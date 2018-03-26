
#get temp password from /var/log/mysqld.log and save in temp_password
{% set temp_password = salt.cmd.shell(cmd="grep 'temporary password' /var/log/mysqld.log | awk '{print $NF}'")%}


# run a command to change password from the current temp to the root password. 
# this should be stored in a pillar value of mysql_core:root_passwordlike so
# mysql_core:
#   root_password: fakepassword
mysql_password:
  cmd.run:
    - name: mysqladmin -p'{{temp_password}}' password '{{salt.pillar.get('mysql_core:root_password')}}'
    - output_loglevel: quiet
