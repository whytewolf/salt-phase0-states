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

{#pull mysql_users list out of mysql_core#}
{#{% set user_pillars = salt.pillar.get('mysql_core:users_pillars',['mysql_users']) %}
#loop through mysql_users list#}
{#{% for user_pillar in user_pillars %}#}
{#pull this iteration of mysql_users from pillar#}
{% set user_pillar = 'mysql_users2'%}
{% set users = salt.pillar.get(user_pillar,{}) %}
{{users}}
{#loop though the user list#}
{% for user in users%}
# {{user}}
{{users[user]['mysql']}}
{%endfor%}
