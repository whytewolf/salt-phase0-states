{% set temp_password = salt.cmd.shell(cmd="grep 'temporary password' /var/log/mysqld.log | awk '{print $NF}'")%}

mysql_password:
  cmd.run:
    - name: mysqladmin -p{{temp_password}} password {{salt.pillar.get('mysql_core:root_password')}}
