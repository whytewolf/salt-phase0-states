fileserver_update:
  salt.runner:
    - name: fileserver.update

pillar_update:
  salt.function:
    - tgt: '*'
    - name: saltutil.pillar_refresh

mysql_install_1:
  salt.state:
    - tgt: 'master-mom'
    - sls: 
      - mysql.install

mysql_install_2:
  salt.state:
    - tgt: 'master-mom'
    - sls: 
      - mysql.install
mysql_redhat_password_fix:
  salt.state:
    - tgt: 'master-mom'
    - sls: 
      - mysql.redhat_root

mysql_users:
  salt.state:
    - tgt: 'master-mom'
    - sls: 
      - mysql.users
