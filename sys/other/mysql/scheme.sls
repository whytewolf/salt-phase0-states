{%for item in salt.pillar.get('mysql_schemes') %}

install_mysql_schemes:
  mysql_query.run_file:
    - name: {{item}}

{%endfor%}
