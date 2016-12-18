mysql_service_stopped:
  service.dead:
    - name: mysqld
    - enable: false

mysql_server_remove:
  pkg.removed:
    - pkgs:
      - mysql57-community-release
      - mysql-community-server
      - mysql-community-client
      - mysql-connector-python
      - MySQL-python
    - require:
      - service: mysql_service_stopped

mysql_log_remove:
  file.absent:
    - name: /var/log/mysqld.log

mysql_data_dir_remove:
  file.absent:
    - name: /var/lib/mysql


