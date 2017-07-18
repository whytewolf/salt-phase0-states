# Copyright Thomas "WhytewOlf" Phipps 2016
# mysql.install used for installing mysql on centos 7 using oracle repos.
# we don't' need no stinking formulas


#install Das repo from orcale who bottles it up in a nice little rpm
mysql_repo_install:
  pkg.installed:
    - sources: 
      - mysql57-community-release: http://dev.mysql.com/get/mysql57-community-release-el7-11.noarch.rpm

# install our packages
# mysql-community-server - for the mysql server portion
# mysql-community-client - because we need a client
# mysql-connector-python - just because. although i might write something to use this python connector instead od MySQL-python
# MySQL-python because salt needs it to connect to mysql
mysql_server_install:
  pkg.latest:
    - pkgs:
      - mysql-community-server
      - mysql-community-client
      - mysql-connector-python
      - MySQL-python
    - require:
      - pkg: mysql_repo_install
  service.running:
    - name: mysqld
    - enable: true

mysql_config_file:
  file.managed:
    - name: /etc/my.cnf
    - source: salt://files/etc/my.cnf.jinja
    - template: jinja
    - listen_in:
      - service: mysql_service

# run our service, making sure that we restart if we change anything in the config or update packages
mysql_service:
  service.running:
    - name: mysqld
    - enable: true
    - listen:
      - pkg: mysql_server_install
