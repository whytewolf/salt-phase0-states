# Copyright Thomas "Whytewolf" Phipps 2016
# uninstall mysql and remove all configs and data from the system

# stop the mysql server 
mysql_service_stopped:
  service.dead:
    - name: mysqld
    - enable: false

#remove the packages that we installed as well as some of their dependencies that we don't use otherwise
mysql_server_remove:
  pkg.removed:
    - pkgs:
      - mysql57-community-release
      - mysql-community-server
      - mysql-community-client
      - mysql-connector-python
      - mysql-community-libs
      - mysql-community-common
      - MySQL-python
    - require:
      - service: mysql_service_stopped

# remove log file
mysql_log_remove:
  file.absent:
    - name: /var/log/mysqld.log

# remove data directory
mysql_data_dir_remove:
  file.absent:
    - name: /var/lib/mysql

# remove share directory
mysql_share_directory:
  file.absent:
    - name: /usr/share/mysql

# remove config directory that doesn't even seem to do anything anyway.
mysql_config_directory:
  file.absent:
    - name: /etc/my.cnf.d

# remove config file [most likely removed by removing the rpm but better safe then sorry]
mysql_config_file:
  file.absent:
    - name: /etc/my.cnf

mysql_repos_cruft:
  file.absent:
    - names:
      - /etc/yum.repos.d/mysql-community.repo
      - /etc/yum.repos.d/mysql-community-source.repo

remove_mysql_dyn_top_grain_mysql.maint:
  grains.list_absent:
    - name: installed.states
    - value: sys.maint.mysql

remove_mysql_dyn_top_grain_mysql.users:
  grains.list_absent:
    - name: installed.states
    - value: sys.other.mysql.users

remove_mysql_dyn_top_grain_mysql.databases:
  grains.list_absent:
    - name: installed.states
    - value: sys.other.mysql.databases

