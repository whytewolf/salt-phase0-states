{% set user_pillars = salt.pillar.get('mysql_core:users_pillars',['mysql_users']) %}
{{user_pillars}}
{#{% for user_pillar in user_pillars %}
{% set user = salt.pillar.get(user_pillar,{}) %}
{{users}}
{%endfor%}#}
