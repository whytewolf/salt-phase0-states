{% set temp_password = salt.cmd.run(cmd="grep 'temporary password' /var/log/mysqld.log | awk '{print \$NF}'",python_shell=true)%}

mysql_password:
  test.show_notification:
    - name: test
    - text: {{temp_password}}
