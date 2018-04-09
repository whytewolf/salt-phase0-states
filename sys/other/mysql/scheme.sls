{% for item in salt.pillar.get('mysql_schemes') %}
{% for db,files in item.items() %}

install_mysql_schemes:
  mysql_query.run_file:
    - name: {{db}}
    - database: {{db}}
    - query_file: salt://files{{file}}

{%endfor%}
{%endfor%}
