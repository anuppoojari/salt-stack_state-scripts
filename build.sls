{% for DIR in ['/data','/data/2015','/data/2016','/app','/app/etc','/app/bin','/app/conf','/app/conf/webfe1','/app/conf/webfe2'] %}
{{ DIR }}:
  file.directory:
    - user: root
    - group: root
    - mode: 774
{% endfor %}
