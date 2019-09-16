<meta charset="UTF-8"/>
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1"/>
<meta http-equiv="Cache-Control" content="no-transform" />
<meta http-equiv="Cache-Control" content="no-siteapp" />
{% if theme.fancybox %}
  {% set fancybox_css_uri = url_for(theme.vendors._internal + '/fancybox/source/jquery.fancybox.css?v=2.1.5') %}
  {% if theme.vendors.fancybox_css %}
    {% set fancybox_css_uri = theme.vendors.fancybox_css %}
  {% endif %}
  <link href="{{ fancybox_css_uri }}" rel="stylesheet" type="text/css" media="print" onload="this.media='all'" />
{% endif %}
<link href="{{ url_for(theme.css) }}/main.css?v={{ theme.version }}" rel="stylesheet" type="text/css" media="print" onload="this.media='all'" />
{% if page.keywords %}
  <meta name="keywords" content="{{ page.keywords }}" />
{% elif page.tags and page.tags.length %}
  <meta name="keywords" content="{% for tag in page.tags %}{{ tag.name }},{% endfor %}" />
{% elif theme.keywords %}
  <meta name="keywords" content="{{ theme.keywords }}" />
{% endif %}
{% if theme.rss === '' and config.feed and config.feed.path %}
  {% set theme.rss = config.feed.path %}
{% endif %}
{% if theme.rss %}
  <link rel="alternate" href="{{ url_for(theme.rss) }}" title="{{ config.title }}" type="application/atom+xml" />
{% endif %}
{{
  open_graph({
    twitter_id: theme.twitter,
    google_plus: theme.google_plus,
    fb_admins: theme.fb_admins,
    fb_app_id: theme.fb_app_id
  })
}}
{# Export some HEXO Configurations to Front-End #}
<script type="text/javascript" id="hexo.configurations">
  var NexT = window.NexT || {};
  var CONFIG = {
    root: '{{ theme.root }}',
    scheme: '{{ theme.scheme }}',
    version: '{{ theme.version }}',
    sidebar: {{ theme.sidebar | json_encode }},
    fancybox: {{ theme.fancybox }},
    tabs: {{ theme.tabs.enable }},
    motion: {{ theme.motion | json_encode }},
    duoshuo: {
      userId: '{{ theme.duoshuo_info.user_id | default() }}',
      author: '{{ theme.duoshuo_info.admin_nickname | default(__('author'))}}'
    },
    algolia: {
      applicationID: '{{ theme.algolia.applicationID }}',
      apiKey: '{{ theme.algolia.apiKey }}',
      indexName: '{{ theme.algolia.indexName }}',
      hits: {{ theme.algolia_search.hits | json_encode }},
      labels: {{ theme.algolia_search.labels | json_encode }}
    }
  };
</script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.2/css/fontawesome.min.css" integrity="sha256-0mlw4Ae1j9eDzZTzLuw5X9fBCL9nAehrtVyKfIstZQA=" crossorigin="anonymous" media="print" onload="this.media='all'" />
{% if theme.canonical %}
  <link rel="canonical" href="{{ config.url }}/{{ page.canonical_path.replace('index.html', '') }}"/>
{% endif %}
<style>
@font-face {
  font-family: 'Noto Sans JP';
  font-style: normal;
  font-weight: 400;
  src: url('assets/fonts/noto-sans-jp-v24-japanese-regular.eot'); /* IE9 Compat Modes */
  src: local('Noto Sans Japanese Regular'), local('NotoSansJapanese-Regular'),
       url('assets/fonts/noto-sans-jp-v24-japanese-regular.eot?#iefix') format('embedded-opentype'), /* IE6-IE8 */
       url('assets/fonts/noto-sans-jp-v24-japanese-regular.woff2') format('woff2'), /* Super Modern Browsers */
       url('assets/fonts/noto-sans-jp-v24-japanese-regular.woff') format('woff'), /* Modern Browsers */
       url('assets/fonts/noto-sans-jp-v24-japanese-regular.ttf') format('truetype'), /* Safari, Android, iOS */
       url('assets/fonts/noto-sans-jp-v24-japanese-regular.svg#NotoSansJP') format('svg'); /* Legacy iOS */
	   font-display: swap;
}
@font-face {
  font-family: 'Roboto Mono';
  font-style: normal;
  font-weight: 400;
  src: url('../fonts/roboto-mono-v7-latin-regular.eot'); /* IE9 Compat Modes */
  src: local('Roboto Mono'), local('RobotoMono-Regular'),
       url('assets/fonts/roboto-mono-v7-latin-regular.eot?#iefix') format('embedded-opentype'), /* IE6-IE8 */
       url('assets/fonts/roboto-mono-v7-latin-regular.woff2') format('woff2'), /* Super Modern Browsers */
       url('assets/fonts/roboto-mono-v7-latin-regular.woff') format('woff'), /* Modern Browsers */
       url('assets/fonts/roboto-mono-v7-latin-regular.ttf') format('truetype'), /* Safari, Android, iOS */
       url('assets/fonts/roboto-mono-v7-latin-regular.svg#RobotoMono') format('svg'); /* Legacy iOS */
	   font-display: swap;
}
@font-face {
     font-family: 'Font Awesome 5 Brands';
     font-style: normal;
     font-weight: 400;
     src: url("https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.2/webfonts/fa-brands-400.woff2") format("woff2");
     font-display: swap;
 }
 @font-face {
     font-family: 'Font Awesome 5 Free';
     font-style: normal;
     font-weight: 900;
     src:url("https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.2/webfonts/fa-solid-900.woff2") format("woff2");
     font-display: swap;
 }
		body{font-family:'Font Awesome 5 Brands','Font Awesome 5 Free','Roboto Mono',"Noto Sans JP"}
    </style>
