fileserver_update:
  salt.runner:
    - name: state.orch
    - mods: orch.salt-core-update

mysql_cleanup:
  salt.state:
    - tgt: 'master-mom'
    - sls:
      - mysql.remove

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

mysql_databases:
  salt.state:
    - tgt: 'master-mom'
    - sls: 
      - mysql.databases
