{#
Copyright Thomas "whytewolf" Phipps 2016
create databases from lists

mysql_core:
  db_lists:
    - databases
    - openstack_dbs

databases:
  - mysql

openstack_dbs:
  - nova
  - nova-api
  - keystone
  - neutron
  - glance
  - cinder

#}

{#pull databse list from mysql_core#}
{% set db_lol = salt.pillar.get('mysql_core:db_lists',['databases']) %}
{% for db_list in db_lol %}
{% for database in salt.pillar.get(db_list,'mysql')%}
mysql_database_{{database}}:
  mysql_database.present:
    - name: {{database}}
{%endfor%}
{%endfor%}
