---
layout: page
title: Newsletters
subtitle: Updates from the group.
description: News and updates from 9th Caulfield Scout Group.
---

{% assign newsletters = site.newsletters | sort: 'date' | reverse %}
{% if newsletters.size > 0 %}
<ul class="newsletter-list">
  {% for nl in newsletters %}
  <li>
    <a href="{{ nl.url | relative_url }}">{{ nl.title }}</a>
    <span class="nl-date">{{ nl.date | date: "%-d %B %Y" }}</span>
    {% if nl.excerpt %}<p>{{ nl.excerpt }}</p>{% endif %}
  </li>
  {% endfor %}
</ul>
{% else %}
<p>No newsletters yet — check back soon.</p>
{% endif %}
