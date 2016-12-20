{#
Copyright Thomas "Whytewolf" Phipps 2016
install users into mysql.

pillar configs used for this
users_pillars a list of pillar lists used to iterate through. 
and <users_pillars> one or more lists containing user data
mysql_core:
  user_pillars:
    - mysql_users

mysql_users:
  - username: root
    host: '%'
    password: 'no a password'
    grants:
      - grant: all
        database: '*.*'
  - username: user2
    host: 'localhost'
    password: 'no a password'
    grants:
      - grant: 'select,update'
        database: 'user2.*'
#}
{% set user_pillars = salt.pillar.get('mysql_core:users_pillars',['mysql_users']) %}
{% for user_pillar in user_pillars %}
{% set users = salt.pillar.get(user_pillar,{}) %}
{% for user in users%}
mysql_{{user['username']}}:
  mysql_user.present:
    - name: {{user['username']}}
    - password: '{{user['password']}}'
    - host: '{{user['host']}}'

{% for grant in user['grants'] %}
mysql_{{user['username']}}_{{grant['database']}}_{{grant['grant']}}:
  mysql_grants.present:
    - grant: '{{grant['grant']}}'
    - database: '{{grant['database']}}'
    - user: {{user['username']}}
    - host: '{{user['host']}}'
{%endfor%}
{%endfor%}
{%endfor%}
