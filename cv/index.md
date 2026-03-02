---
layout: page
title: CV
description: "CV of Frank De Graeve — DesignOps leader, UX strategist, and AI adoption advocate."
permalink: /cv/
---

<div class="page-hero">
  <div class="hero-header">
    <h1>{{ site.author.name }}</h1>
  </div>
  <p class="hero-description">DesignOps &middot; UX Strategy &middot; AI Adoption &mdash; building the conditions for teams to scale design impact and AI fluency.</p>
  <p>
    <a href="{{ '/assets/cv.pdf' | relative_url }}" class="btn btn-primary" target="_blank" rel="noopener">Download PDF</a>
  </p>
</div>

<hr class="visual-divider">

<section id="experience">
  <h2>Experience</h2>
  {% for job in site.data.experience %}
  <article class="cv-role">
    <div class="cv-role-header">
      <div>
        <h3 class="cv-role-title">{{ job.title }}</h3>
        <p class="cv-role-company">{{ job.company }}{% if job.location %} &middot; <span class="cv-role-location">{{ job.location }}</span>{% endif %}</p>
      </div>
      <p class="cv-role-dates">
        <time>{{ job.start_date }}</time> – <time>{{ job.end_date }}</time>
      </p>
    </div>
    {% if job.description %}
    <p class="cv-role-description">{{ job.description }}</p>
    {% endif %}
    {% if job.highlights %}
    <ul class="cv-highlights">
      {% for h in job.highlights %}<li>{{ h }}</li>{% endfor %}
    </ul>
    {% endif %}
  </article>
  {% endfor %}
</section>

<hr class="visual-divider">

<section id="skills">
  <h2>Skills</h2>
  <div class="two-column-layout">
    {% for group in site.data.skills %}
    <div>
      <h3>{{ group.group }}</h3>
      <ul class="cv-skill-list">
        {% for item in group.items %}<li>{{ item }}</li>{% endfor %}
      </ul>
    </div>
    {% endfor %}
  </div>
</section>

<hr class="visual-divider">

<section id="education">
  <h2>Education</h2>
  {% for edu in site.data.education %}
  <article class="cv-role">
    <div class="cv-role-header">
      <div>
        <h3 class="cv-role-title">{{ edu.degree }}{% if edu.field %} in {{ edu.field }}{% endif %}</h3>
        <p class="cv-role-company">{{ edu.institution }}</p>
      </div>
      <p class="cv-role-dates">
        <time>{{ edu.start_year }}</time> – <time>{{ edu.end_year }}</time>
      </p>
    </div>
    {% if edu.notes %}<p class="cv-role-description">{{ edu.notes }}</p>{% endif %}
  </article>
  {% endfor %}
</section>
