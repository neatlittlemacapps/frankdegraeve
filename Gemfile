source "https://rubygems.org"

# Jekyll 4.3 is the last series supporting Ruby 2.6 (macOS system Ruby).
# GitHub Actions uses Ruby 3.3, so the latest compatible gem will be resolved there.
gem "jekyll", "~> 4.3"
gem "webrick", "~> 1.8"

# Pin ffi to 1.15.x — 1.17 requires Ruby 3.0, 1.15.x supports Ruby 2.4+
gem "ffi", "~> 1.15.0"

# Pin sass converter to 2.x (uses sassc, not sass-embedded) to avoid ffi Ruby 3.0 requirement
gem "jekyll-sass-converter", "~> 2.2"

group :jekyll_plugins do
  gem "jekyll-feed",    "~> 0.12"
  gem "jekyll-seo-tag", "~> 2.8"
  gem "jekyll-sitemap", "~> 1.4"
end

# Windows / JRuby compatibility
platforms :mingw, :x64_mingw, :mswin, :jruby do
  gem "tzinfo", ">= 1", "< 3"
  gem "tzinfo-data"
end
