---
layout: default
title: Contact
description: "Get in touch with Frank De Graeve — available for DesignOps consultancy, UX strategy, and AI adoption work."
permalink: /contact/
---

<div class="page-hero">
  <div class="hero-header">
    <h1>Contact</h1>
  </div>
  <p class="hero-description">Available for consultancy, advisory work, and conversations about DesignOps, UX strategy, and AI adoption.</p>
</div>

<div class="two-column-layout">
  <div>
    <h2>Get in touch</h2>
    <p>The best way to reach me is by email. I read everything and reply to most things.</p>
    <p>
      <a href="mailto:{{ site.author.email }}">{{ site.author.email }}</a>
    </p>

    <h3>Currently available for</h3>
    <ul>
      <li>DesignOps consultancy and strategy</li>
      <li>UX strategy and team leadership</li>
      <li>AI adoption and fluency programmes</li>
      <li>Design systems advisory</li>
      <li>Keynotes and workshops</li>
    </ul>
  </div>

  <div>
    <h2>Elsewhere</h2>
    <ul class="contact-links">
      {% if site.author.github %}
      <li>
        <a href="https://github.com/{{ site.author.github }}" target="_blank" rel="noopener">
          GitHub &mdash; @{{ site.author.github }}
        </a>
      </li>
      {% endif %}
      {% if site.author.twitter %}
      <li>
        <a href="https://twitter.com/{{ site.author.twitter }}" target="_blank" rel="noopener">
          Twitter / X &mdash; @{{ site.author.twitter }}
        </a>
      </li>
      {% endif %}
      {% if site.author.linkedin %}
      <li>
        <a href="https://linkedin.com/in/{{ site.author.linkedin }}" target="_blank" rel="noopener">
          LinkedIn
        </a>
      </li>
      {% endif %}
    </ul>
  </div>
</div>
