---
layout: docs
title: Content
permalink: /docs/index.html
---


{% for section in site.data.docs %}
<h4>{{ section.title }}</h4>

{% assign items = section.docs %}

<ul>
{% for item in items %}
  {% assign item_url = item | prepend:"/docs/" | append:".html" %}

  {% if item_url == page.url %}
    {% assign c = "current" %}
  {% else %}
    {% assign c = "" %}
  {% endif %}

  {% for p in site.docs %}
    {% if p.url == item_url %}
      <li class="{{ c }}"><a href="{{ site.url }}{{ p.url }}">{{ p.title }}</a></li>
      {% break %}
    {% endif %}
  {% endfor %}

{% endfor %}
</ul>

{% endfor %}

How to Contribute to Mnemonic ? -- [Wiki](https://cwiki.apache.org/confluence/display/MNEMONIC/How+to+Contribute+to+Mnemonic){:target="_blank"}


How to Release ? -- [Wiki](https://cwiki.apache.org/confluence/display/MNEMONIC/How+to+Release){:target="_blank"}


