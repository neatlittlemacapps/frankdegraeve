---
layout: default
title: Blog
description: "Writing on DesignOps, UX strategy, AI adoption, and building design culture at scale."
permalink: /blog/
---

<div class="page-hero">
  <div class="hero-header">
    <h1>Blog</h1>
  </div>
  <p class="hero-description">Writing on DesignOps, UX strategy, AI adoption, and building design culture at scale.</p>
</div>

{% if site.posts.size > 0 %}
<div class="card-grid">
  {% for post in site.posts %}
  <a href="{{ post.url | relative_url }}" class="nav-card">
    <div class="card-content">
      <p class="post-meta">
        <time datetime="{{ post.date | date_to_xmlschema }}">{{ post.date | date: "%B %-d, %Y" }}</time>
        {% if post.category %} &middot; {{ post.category }}{% endif %}
      </p>
      <h3>{{ post.title }}</h3>
      <p>{{ post.description | default: post.excerpt | strip_html | truncate: 120 }}</p>
    </div>
  </a>
  {% endfor %}
</div>
{% else %}
<p>No posts yet — check back soon.</p>
{% endif %}
