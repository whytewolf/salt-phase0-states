{% for item in salt.pillar.get('mysql_schemes') %}
{% set db,files = item %}

install_mysql_schemes:
  mysql_query.run_file:
    - name: {{db}}
    - database: {{db}}
    - query_file: salt://files{{file}}

{%endfor%}
