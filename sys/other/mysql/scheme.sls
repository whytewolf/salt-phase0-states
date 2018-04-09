{%for db,file in salt.pillar.get('mysql_schemes') %}

install_mysql_schemes:
  mysql_query.run_file:
    - name: {{db}}
    - database: {{db}}
    - query_file: salt://files{{file}}

{%endfor%}
