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
  root:
    pgsql:
      username: root
      password: strong_password
      createdb: True
      createroles: True
      createuser: True
      encrypted: True
      superuser: True
      replication: True
      groups: None
  user2:
    pgsql:
      username: user2
      password: strong_password
      createdb: True
      encrypted: True
#}

{% set default_perm = {
  'createdb': False,
  'createroles': False,
  'createuser': False,
  'encrypted': None,
  'superuser': False,
  'replication': False,
  'groups': None
}%}


{#pull pgsql_users list out of pgsql_core#}
{% set user_pillars = salt.pillar.get('pgsql:users_pillars',['pgsql_users']) %}
{#loop through pgsql_users list#}
{% for user_pillar in user_pillars %}
  {#pull this iteration of pgsql_users from pillar#}
  {% set users = salt.pillar.get(user_pillar,{}) %}
  {#loop though the user list#}
  {% for user in users%}
    {#pull the user dict out of the user object so we don't have to worry about other nastyness#}
    {%set user = salt.defaults.merge(default_perm,users[user]['pgsql'])%}
# {{user}}

# install user into pgsql
postgres_user_{{user['username']}}:
  postgres_user.present:
    - name: {{user['username']}}
    - password: '{{user['password']}}'
    - createdb: {{user['createdb']}}
    - createuser: {{user['createuser']}}
    - encrypted: {{user['encrypted']}}
    - superuser: {{user['superuser']}}
    - replication: {{user['replication']}}
    - groups: {{user['groups']}}
  {%endfor%}
{%endfor%}
