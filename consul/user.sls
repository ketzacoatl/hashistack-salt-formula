# setup and manage user (and home directory), for the consul service

{%- set home = '/home/consul' %}
{%- set user = 'consul' %}


consul-user:
  user.present:
    - name: {{ user }}
    - system: True
    - usergroup: True
    - home: {{ home }}
    - shell: /bin/sh
  file.directory:
    - name: {{ home }}
    - user: {{ user }}
    - group: {{ user }}
    - dir_mode: 750
    - file_mode: 640
    - recurse:
        - user
        - group
        - mode
