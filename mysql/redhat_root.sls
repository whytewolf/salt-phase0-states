{% set temp_password = salt.cmd.shell(cmd="grep 'temporary password' /var/log/mysqld.log | awk '{print $NF}'")%}

mysql_password:
  mysql_user.present:
    - name: root
    - host: localhost
    - password: {{salt.pillar.get('mysql_core:root_password')}}
    - connection_user: root
    - connection_pass: {{temp_password}}
    - connection_charset: utf8
