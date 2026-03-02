#!/usr/bin/env ruby
# frozen_string_literal: true

# _tools/build_cv_data.rb
#
# Merges LinkedIn export + Notion nested export into Jekyll _data/ YAML files
# and copies portfolio images into assets/images/portfolio/.
#
# SOURCE LAYOUT expected at source-data/:
#
#   source-data/
#     linkedin.zip/
#       Positions.csv
#       Skills.csv
#       Education.csv
#       Certifications.csv
#       Languages.csv
#     notion/
#       Resume Frank De Graeve *.md          ← root resume page
#       Resume Frank De Graeve/
#         CV aspects/
#           *.md                             ← one file per skill/capability
#         Untitled *.csv                     ← tools & methods
#         Portfolio Items/
#           *.md                             ← one file per portfolio item
#           <Client>/                        ← image folders alongside MDs
#             *.png / *.jpg
#
# OUTPUTS (all suffixed .draft — review then rename):
#   _data/experience.draft.yml
#   _data/skills.draft.yml
#   _data/education.draft.yml
#   _data/portfolio.draft.yml
#   assets/images/portfolio/<slug>/          ← copied images
#
# USAGE:
#   bundle exec ruby _tools/build_cv_data.rb

require "csv"
require "yaml"
require "date"
require "fileutils"

ROOT        = File.expand_path("..", __dir__)
LINKEDIN    = File.join(ROOT, "source-data", "linkedin.zip")
NOTION_ROOT = File.join(ROOT, "source-data", "notion")
DATA_DIR    = File.join(ROOT, "_data")
IMG_DIR     = File.join(ROOT, "assets", "images", "portfolio")

def banner(msg)
  puts "\n#{"=" * 60}"
  puts "  #{msg}"
  puts "=" * 60
end

def linkedin_file(glob)
  Dir.glob(File.join(LINKEDIN, glob), File::FNM_CASEFOLD).first
end

def notion_subdir
  Dir.glob(File.join(NOTION_ROOT, "Resume Frank De Graeve")).first ||
    Dir.glob(File.join(NOTION_ROOT, "Resume*")).find { |f| File.directory?(f) }
end

def notion_root_md
  Dir.glob(File.join(NOTION_ROOT, "Resume Frank De Graeve*.md")).first
end

def slugify(str)
  str.downcase.gsub(/[^a-z0-9]+/, "-").gsub(/^-|-$/, "")
end

def fmt_date(str)
  return "Present" if str.nil? || str.strip.empty? || str.strip == "Still in Role"
  str = str.strip
  # Try "Jan 2023" format
  begin
    return Date.strptime(str, "%b %Y").strftime("%B %Y")
  rescue ArgumentError
  end
  # Already just a year
  str
end

# ─── 1. EXPERIENCE from LinkedIn Positions ───────────────────────────────────

banner "Processing LinkedIn Positions"

positions_file = linkedin_file("Positions.csv")
experience = []

if positions_file
  CSV.foreach(positions_file, headers: true, encoding: "UTF-8") do |row|
    company     = row["Company Name"].to_s.strip
    title       = row["Title"].to_s.strip
    location    = row["Location"].to_s.strip
    description = row["Description"].to_s.strip
    started     = fmt_date(row["Started On"].to_s)
    finished    = fmt_date(row["Finished On"].to_s)

    next if company.empty? && title.empty?

    experience << {
      "company"     => company,
      "title"       => title,
      "location"    => location,
      "start_date"  => started,
      "end_date"    => finished,
      "description" => description,
      "highlights"  => []
    }
  end

  # Sort newest first using start_date
  experience.sort_by! do |e|
    raw = e["start_date"]
    begin
      Date.strptime(raw, "%B %Y")
    rescue
      begin
        Date.new(raw.to_i)
      rescue
        Date.new(1900)
      end
    end
  end.reverse!

  puts "  Found #{experience.size} positions"
else
  warn "  ⚠  No Positions.csv found in #{LINKEDIN}"
end

# ─── 2. ENRICH experience from Notion main MD ────────────────────────────────

banner "Enriching experience from Notion resume"

root_md = notion_root_md

if root_md
  text = File.read(root_md, encoding: "UTF-8")

  # The work highlights are in <aside> blocks. Each block looks like:
  #   **Job Title**
  #   [**Company**](url) *(dates)*
  #   > bullet
  #   > bullet
  #
  # We parse each aside block and match by company name to existing experience entries.
  asides = text.scan(/<aside>(.*?)<\/aside>/m).flatten

  asides.each do |aside|
    # Extract title (bold text on a line by itself before the company link)
    title_match   = aside.match(/\*\*([^\*\n]+)\*\*\s*\n/)
    company_match = aside.match(/\[?\*?\*?([A-Z][^\]\*\n]{2,}?)\*?\*?\]?\([^)]+\)/)
    next unless company_match

    notion_company = company_match[1].strip.downcase

    # Grab blockquote bullets (lines starting with >)
    bullets = aside.scan(/^>\s*(.+)$/).flatten
                   .map(&:strip)
                   .reject { |b| b.empty? || b == ">" }
                   .first(6)

    # Match against experience entries
    experience.each do |job|
      next unless job["company"].downcase.include?(notion_company) ||
                  notion_company.include?(job["company"].downcase)

      job["highlights"] = bullets unless bullets.empty?

      # Fill description from Notion if LinkedIn left it blank
      if job["description"].empty? && title_match
        # Use first prose line after title as description
        prose = aside.gsub(/^>\s*.*$/, "")
                     .gsub(/<[^>]+>/, "")
                     .gsub(/\[?\*?\*?[A-Z][^\]\n]+\*?\*?\]?\([^)]+\)\s*\*[^*]+\*/, "")
                     .strip.split("\n\n").first&.strip
        job["description"] = prose unless prose.nil? || prose.empty?
      end
    end
  end

  puts "  Notion enrichment applied"
else
  warn "  ⚠  No root resume MD found in #{NOTION_ROOT}"
end

# ─── 3. SKILLS from Notion CV aspects MDs + Untitled tools CSV ───────────────

banner "Processing Notion CV aspects"

subdir      = notion_subdir
aspects_dir = subdir && File.join(subdir, "CV aspects")
skills      = { "Capabilities" => [], "Tools & Methods" => [] }

if aspects_dir && Dir.exist?(aspects_dir)
  Dir.glob(File.join(aspects_dir, "*.md")).sort.each do |f|
    content = File.read(f, encoding: "UTF-8")
    name    = content.match(/^#\s+(.+)$/)&.captures&.first&.strip
    what    = content.match(/What I bring:\s*(.+)$/i)&.captures&.first&.strip
    type    = content.match(/^type:\s*(.+)$/i)&.captures&.first&.strip&.downcase

    next unless name

    group = (type == "capabilities") ? "Capabilities" : "Tools & Methods"
    skills[group] << { "name" => name, "detail" => what || "" }
  end
  puts "  Found #{skills.values.flatten.size} aspects in #{aspects_dir}"
else
  warn "  ⚠  CV aspects directory not found (expected: #{aspects_dir})"
end

# Also pull in the Untitled tools CSV (may have additional entries)
tools_csv = subdir && Dir.glob(File.join(subdir, "Untitled*.csv")).first
if tools_csv
  CSV.foreach(tools_csv, headers: true, encoding: "UTF-8") do |row|
    area = row["Area"].to_s.strip
    what = (row["What I bring"] || row[1]).to_s.strip
    next if area.empty?
    # Avoid duplicates already in aspects
    existing = skills["Tools & Methods"].any? { |s| s["name"].downcase == area.downcase }
    skills["Tools & Methods"] << { "name" => area, "detail" => what } unless existing
  end
end

# LinkedIn Skills.csv (flat list — append anything not already named)
skills_csv = linkedin_file("Skills.csv")
li_skills  = []
if skills_csv
  CSV.foreach(skills_csv, headers: true, encoding: "UTF-8") do |row|
    s = (row["Name"] || row.fields.first).to_s.strip
    li_skills << s unless s.empty?
  end
  # List them separately as a flat group for reference
  known = skills.values.flatten.map { |s| s["name"].downcase }
  extra = li_skills.reject { |s| known.any? { |k| k.include?(s.downcase) || s.downcase.include?(k) } }
  skills["LinkedIn endorsements"] = extra.map { |s| { "name" => s, "detail" => "" } } unless extra.empty?
  puts "  Found #{li_skills.size} LinkedIn skills (#{extra.size} new, added as reference group)"
end

# Languages
langs_csv = linkedin_file("Languages.csv")
if langs_csv
  langs = []
  CSV.foreach(langs_csv, headers: true, encoding: "UTF-8") do |row|
    lang  = row["Name"].to_s.strip
    level = row["Proficiency"].to_s.strip
    langs << { "name" => lang, "proficiency" => level } unless lang.empty?
  end
  skills["Languages"] = langs unless langs.empty?
  puts "  Found #{langs.size} languages"
end

skills_yaml = skills.reject { |_, v| v.empty? }.map { |g, items| { "group" => g, "items" => items } }

# ─── 4. EDUCATION from LinkedIn + certifications from Notion MD ──────────────

banner "Processing Education & Certifications"

education_csv = linkedin_file("Education.csv")
education = []

if education_csv
  CSV.foreach(education_csv, headers: true, encoding: "UTF-8") do |row|
    inst   = row["School Name"].to_s.strip
    degree = row["Degree Name"].to_s.strip
    field  = row["Field Of Study"].to_s.strip
    sy     = row["Start Date"].to_s.strip.match(/\d{4}/)&.to_a&.first || row["Start Date"].to_s.strip
    ey     = row["End Date"].to_s.strip.match(/\d{4}/)&.to_a&.first   || row["End Date"].to_s.strip
    notes  = (row["Notes"] || row["Activities"] || "").to_s.strip
    next if inst.empty?
    education << { "institution" => inst, "degree" => degree, "field" => field,
                   "start_year" => sy, "end_year" => ey, "notes" => notes }
  end
  puts "  Found #{education.size} education entries"
end

# Certifications — merge from LinkedIn CSV and Notion MD
certs = []

certs_csv = linkedin_file("Certifications.csv")
if certs_csv
  CSV.foreach(certs_csv, headers: true, encoding: "UTF-8") do |row|
    name  = row["Name"].to_s.strip
    auth  = row["Authority"].to_s.strip
    year  = row["Started On"].to_s.strip.match(/\d{4}/)&.to_a&.first || row["Started On"].to_s.strip
    url   = row["Url"].to_s.strip
    next if name.empty?
    certs << { "name" => name, "authority" => auth, "year" => year, "url" => url }
  end
end

# Parse certifications section from Notion MD  (lines under "# 📜 Certifications")
if root_md
  text      = File.read(root_md, encoding: "UTF-8")
  cert_sect = text.match(/# 📜 Certifications\s*---\s*(.*?)(?=\n#|\z)/m)&.captures&.first
  if cert_sect
    cert_sect.scan(/^-\s+(.+)$/).flatten.each do |line|
      # Format: "Name - Authority (year)" or "Name - Authority - Year"
      line = line.strip
      next if line.empty?
      year_match = line.match(/\((\d{4})\)/)
      year = year_match&.captures&.first
      clean = line.gsub(/\(\d{4}\)/, "").strip.gsub(/\s*-\s*$/, "")
      # Only add if not already in certs
      unless certs.any? { |c| c["name"].downcase.include?(clean.split(" - ").first.downcase.strip[0..15]) }
        certs << { "name" => clean, "authority" => "", "year" => year || "", "url" => "" }
      end
    end
  end
end

education_out = { "degrees" => education, "certifications" => certs }
puts "  Found #{certs.size} certifications total"

# ─── 5. PORTFOLIO from Notion Portfolio Items MDs ────────────────────────────

banner "Processing Portfolio Items"

portfolio_dir = subdir && File.join(subdir, "Portfolio Items")
portfolio     = []

if portfolio_dir && Dir.exist?(portfolio_dir)
  Dir.glob(File.join(portfolio_dir, "*.md")).sort.each do |md_file|
    content = File.read(md_file, encoding: "UTF-8")

    title    = content.match(/^#\s+(.+)$/)&.captures&.first&.strip
    byline   = content.match(/^byline:\s*(.+)$/i)&.captures&.first&.strip
    tags_raw = content.match(/^Tags:\s*(.+)$/i)&.captures&.first&.strip
    tags     = tags_raw ? tags_raw.split(",").map(&:strip) : []

    challenge = content.match(/^##[^\n]*Challenge[^\n]*\n+(.*?)(?=\n##|\z)/m)&.captures&.first&.strip
    approach  = content.match(/^##[^\n]*Approach[^\n]*\n+(.*?)(?=\n##|\z)/m)&.captures&.first&.strip
    outcome   = content.match(/^##[^\n]*Outcome[^\n]*\n+(.*?)(?=\n##|\z)/m)&.captures&.first&.strip

    # Find matching image subdirectory
    base_name   = File.basename(md_file, ".md").sub(/ [0-9a-f]{32}$/, "").strip
    img_src_dir = File.join(portfolio_dir, base_name)
    slug        = slugify(base_name.split(" ").first(4).join(" "))
    images      = []

    if Dir.exist?(img_src_dir)
      dest_dir = File.join(IMG_DIR, slug)
      FileUtils.mkdir_p(dest_dir)
      Dir.glob(File.join(img_src_dir, "*.{png,jpg,jpeg,gif}", "")).concat(
        Dir.glob(File.join(img_src_dir, "*.png")) +
        Dir.glob(File.join(img_src_dir, "*.jpg")) +
        Dir.glob(File.join(img_src_dir, "*.jpeg"))
      ).uniq.each do |img|
        dest = File.join(dest_dir, File.basename(img))
        FileUtils.cp(img, dest) unless File.exist?(dest)
        images << "/assets/images/portfolio/#{slug}/#{File.basename(img)}"
      end
      puts "    #{title}: copied #{images.size} images → assets/images/portfolio/#{slug}/"
    end

    portfolio << {
      "title"     => title || base_name,
      "slug"      => slug,
      "byline"    => byline || "",
      "tags"      => tags,
      "challenge" => challenge || "",
      "approach"  => approach || "",
      "outcome"   => outcome || "",
      "images"    => images
    }
  end

  puts "  Found #{portfolio.size} portfolio items"
else
  warn "  ⚠  Portfolio Items directory not found (expected: #{portfolio_dir})"
end

# ─── 6. WRITE DRAFT FILES ────────────────────────────────────────────────────

banner "Writing draft YAML files"

def write_draft(path, data, label)
  File.write(path, data.to_yaml(line_width: -1))
  size = data.is_a?(Array) ? data.size : data.values.flatten.size
  puts "  ✓ #{path.sub(ROOT + "/", "")}  (#{size} #{label})"
end

write_draft(File.join(DATA_DIR, "experience.draft.yml"), experience,    "roles")          unless experience.empty?
write_draft(File.join(DATA_DIR, "skills.draft.yml"),    skills_yaml,    "groups")         unless skills_yaml.empty?
write_draft(File.join(DATA_DIR, "education.draft.yml"), education_out,  "degrees+certs")  unless education.empty? && certs.empty?
write_draft(File.join(DATA_DIR, "portfolio.draft.yml"), portfolio,      "items")          unless portfolio.empty?

banner "Done"
puts ""
puts "  Next steps:"
puts "  1. Review each .draft.yml in _data/"
puts "  2. Edit descriptions, highlights, and groupings as needed"
puts "  3. Rename drafts:  mv _data/experience.draft.yml _data/experience.yml  (etc.)"
puts "  4. Add portfolio pages if desired: portfolio items are in _data/portfolio.yml"
puts "  5. bundle exec jekyll serve"
puts ""
