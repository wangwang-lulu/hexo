{% extends '_layout.swig' %}
{% import '_macro/sidebar.swig' as sidebar_template %}

{% block title %}{% set page_title_suffix = ' | ' + config.title %}{% if page.type === "categories" and not page.title %}{{ __('title.category') + page_title_suffix }}{% elif page.type === "tags" and not page.title %}{{ __('title.tag') + page_title_suffix }}{% else %}{{ page.title + page_title_suffix }}{% endif %}{% endblock %}

{% block content %}

  <div id="posts" class="posts-expand">
  {% include '_partials/page-header.swig' %}
    {# tagcloud page support #}
    {% if page.type === "tags" %}
      <div class="tag-cloud">
        <div class="tag-cloud-title">
            {{ _p('counter.tag_cloud', site.tags.length) }}
        </div>
        <div class="tag-cloud-tags">
          {{ tagcloud({min_font: 12, max_font: 30, amount: 200, color: true, start_color: '#ccc', end_color: '#111'}) }}
        </div>
      </div>
        {% if site.tags.length > 1 %}
<script type="text/javascript" charset="utf-8" src="/js/tagcloud.js"></script>
<script type="text/javascript" charset="utf-8" src="/js/tagcanvas.js"></script>
<div id="posts" class="posts-expand">
    <h1 class="post-title" itemprop="name headline">标签云</h1>
    <div id="myCanvasContainer" class="tag-cloud">
        <canvas width="400" height="400" id="resCanvas" style="width=100%">
            {{ list_tags() }}
        </canvas>
    </div>
</div>
{% endif %}
    {% elif page.type === 'categories' %}
      <div class="category-all-page">
        <div class="category-all-title">
            {{ _p('counter.categories', site.categories.length) }}
        </div>
        <div class="category-all">
          {{ list_categories() }}
        </div>
      </div>
    {% else %}
      {{ page.content }}
    {% endif %}
  </div>

{% endblock %}

{% block sidebar %}
  {{ sidebar_template.render(false) }}
{% endblock %}
