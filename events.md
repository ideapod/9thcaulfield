---
layout: page
title: Events
subtitle: Camps, activities and group events.
description: >-
  Upcoming events and activities for 9th Caulfield Scout Group members.
---

Keep an eye on this page for upcoming group events, camps, and activities.
Section leaders will also share details directly with families at weekly meetings.

{% assign events = site.events | sort: 'date' | reverse %}
{% if events.size > 0 %}
<ul class="event-list">
  {% for event in events %}
  <li class="event-card">
    <h2><a href="{{ event.url }}">{{ event.title }}</a></h2>
    <div class="event-card-meta">
      <span>📅 {{ event.date | date: "%-d %B %Y" }}{% if event.end_date %} – {{ event.end_date | date: "%-d %B %Y" }}{% endif %}</span>
      {% if event.sections %}<span>👥 {{ event.sections | join: ", " }}</span>{% endif %}
      {% if event.dropoff_time %}<span>🚗 Drop-off {{ event.dropoff_time }}</span>{% endif %}
      {% if event.pickup_time %}<span>🏠 Pick-up {{ event.pickup_time }}</span>{% endif %}
      {% if event.address %}<span>📍 {{ event.address }}</span>{% endif %}
    </div>
    {% if event.overview %}<p>{{ event.overview }}</p>{% endif %}
  </li>
  {% endfor %}
</ul>
{% else %}
*No events listed at the moment. Check back soon, or [contact us](/contact/) for the latest.*
{% endif %}
