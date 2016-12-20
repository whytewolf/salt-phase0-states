mysql_repo_install:
  pkg.installed:
    - sources: 
      - mysql57-community-release: http://dev.mysql.com/get/mysql57-community-release-el7-9.noarch.rpm

mysql_server_install:
  pkg.latest:
    - pkgs:
      - mysql-community-server
      - mysql-community-client
      - mysql-connector-python
      - MySQL-python
    - require:
      - pkg: mysql_repo_install

mysql_config_file:
  file.managed:
    - name: /etc/my.cnf.d/my.cnf
    - source: salt://mysql/files/my.cnf.jinja
    - template: jinja

mysql_service:
  service.running:
    - name: mysqld
    - enable: true
    - watch:
      - file: mysql_config_file
      - pkg: mysql_server_install
