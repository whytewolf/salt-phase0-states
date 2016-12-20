{% set user_pillars = salt.pillar.get('mysql_core:users_pillars',['mysql_users']) %}
{% for user_pillar in user_pillars %}
{% set users = salt.pillar.get(user_pillar,{}) %}
{% for user in users%}
{{user}}

{#
mysql_{{user['username']}}:
  mysql_user.present:
    - name: {{user['username']}}
    - password: '{{user['password']}}'
    - host: '{{user['host']}}'

{% for grant in user['grants'] %}
mysql_{{user['username']}}_{{grant['databse']}}_{{grant['grant']}}:
  mysql_grant.present:
    - grant: {{grant['grant']}}
    - database: {{grant['database']}}
    - user: {{user['username']}}
{%endfor%}#}
{%endfor%}
{%endfor%}
