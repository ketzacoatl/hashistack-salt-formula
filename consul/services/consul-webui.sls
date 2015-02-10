# create service definition and check config for the consul webui

{%- set home = '/home/consul' %}
{%- set user = 'consul' %}

include:
  - consul
  - consul.services


consul-service-consul-webui:
  file.managed:
    - name: {{ home }}/conf.d/consul-webui.json
    - source: salt://consul/files/service.json
    - template: jinja
    - user: {{ user }}
    - group: {{ user }}
    - mode: 640
    - context:
        name: consul-webui
        tags:
          - consul-webui
        port: 8500
        check:
          script: 'true'
          interval: '30s'
    - require:
        - user: consul-user
        - file: consul-conf-d
    - watch_in:
        - cmd: consul-service-reload
