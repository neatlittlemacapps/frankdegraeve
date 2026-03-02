---
layout: default
title: Frank De Graeve
description: "I build systems, not screens. DesignOps, UX Strategy, and AI Adoption — helping teams scale design impact and AI fluency."
permalink: /
---

<section class="home-hero">
  <h1>Hi, I'm Frank.</h1>
  <p class="hero-tagline">I build systems, not screens. DesignOps &middot; UX Strategy &middot; AI Adoption &mdash; helping teams build the conditions to scale design impact and AI fluency.</p>
  <div class="hero-cta">
    <a href="{{ '/portfolio/' | relative_url }}" class="btn btn-primary">View Portfolio</a>
    <a href="{{ '/cv/' | relative_url }}" class="btn btn-secondary">Read CV</a>
  </div>
</section>

<hr class="visual-divider">

<section>
  <div class="card-grid">
    <a href="{{ '/blog/' | relative_url }}" class="nav-card">
      <div class="card-content">
        <h3>Blog</h3>
        <p>Writing on design, development, and life building indie Mac apps.</p>
      </div>
    </a>
    <a href="{{ '/portfolio/' | relative_url }}" class="nav-card">
      <div class="card-content">
        <h3>Portfolio</h3>
        <p>Selected work — apps, client projects, design systems, and articles.</p>
      </div>
    </a>
    <a href="{{ '/cv/' | relative_url }}" class="nav-card">
      <div class="card-content">
        <h3>CV</h3>
        <p>Full career history with experience, skills, and education.</p>
      </div>
    </a>
    <a href="{{ '/contact/' | relative_url }}" class="nav-card">
      <div class="card-content">
        <h3>Contact</h3>
        <p>Get in touch for work enquiries, collaborations, or just to say hello.</p>
      </div>
    </a>
  </div>
</section>

{% if site.posts.size > 0 %}
<hr class="visual-divider">

<section>
  <h2>Recent Writing</h2>
  <div class="card-grid">
    {% for post in site.posts limit: 3 %}
    <a href="{{ post.url | relative_url }}" class="nav-card">
      <div class="card-content">
        <p class="post-meta"><time datetime="{{ post.date | date_to_xmlschema }}">{{ post.date | date: "%B %-d, %Y" }}</time></p>
        <h3>{{ post.title }}</h3>
        <p>{{ post.description | default: post.excerpt | strip_html | truncate: 100 }}</p>
      </div>
    </a>
    {% endfor %}
  </div>
  <p><a href="{{ '/blog/' | relative_url }}">All posts &rarr;</a></p>
</section>
{% endif %}
