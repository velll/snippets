---
# Feel free to add content and custom Front Matter to this file.
# To modify the layout, see https://jekyllrb.com/docs/themes/#overriding-theme-defaults

layout: home
---
{% for chapter in site.chapters %}
# {{ chapter.title }}

  {% assign chapter_pages = site.pages | where_exp: "page", "page.dir == chapter.dir" | sort: "order", "last" %}

  {% for page in chapter_pages  %}
- [{{ page.title | default: page.name }}]({{ page.url }})
  {% endfor %}

{% endfor %}
