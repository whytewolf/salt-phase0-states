postgres-install-repo:
  pkg.installed:
    - sources:
      - pgdg-centos10: https://download.postgresql.org/pub/repos/yum/10/redhat/rhel-7-x86_64/pgdg-centos10-10-2.noarch.rpm

postgres-install-packages:
  pkg.installed:
    - pkgs:
      - postgresql10
      - postgresql10-server
      - postgresql10-contrib
      - postgresql10-plpython

postgresql-10-initdb:
  cmd.run:
    - name: '/usr/pgsql-10/bin/postgresql-10-setup initdb'
    - creates: /var/lib/pgsql/10/data/PG_VERSION


