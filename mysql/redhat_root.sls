{% set temp_password = salt.cmd.shell(cmd="grep 'temporary password' /var/log/mysqld.log | awk '{print $NF}'")%}

mysql_password:
  test.show_notification:
    - name: test
    - text: {{temp_password}}
