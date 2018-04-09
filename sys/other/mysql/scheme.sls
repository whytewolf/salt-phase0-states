{% for item in salt.pillar.get('mysql_schemes') %}
{% for db,file in item.items() %}

install_{{file}}_for_{{db}}:
  file.managed:
    - name: {{file}}
    - source: salt://files{{file}}

install_mysql_schemes:
  mysql_query.run_file:
    - name: {{db}}
    - database: {{db}}
    - query_file: {{file}}

{%endfor%}
{%endfor%}
