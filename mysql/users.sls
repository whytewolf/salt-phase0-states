{% set users = salt.pillar.get(salt.pillar.get('mysql_core:users_pillar'),{}) %}
{{users}}
