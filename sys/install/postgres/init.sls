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
    - require:
      - pkg: postgres-install-repo

postgresql-10-initdb:
  postgres_initdb.present:
    - name: /var/lib/pgsql/10/data
    - user: {{salt.config.get('postgres.user','postgres')}}
    - password: {{salt.config.get('postgres.pass','')}}
    - auth: password
    - runas: {{salt.config.get('postgres.user','postgres')}}


postgres-config-file:
  file.managed:
    - name: /var/lib/pgsql/10/data/postgresql.conf
    - source: salt://files/var/lib/pgsql/10/data/postgresql.conf
    - template: jinja
    - user: postgres
    - group: postgres
    - mode: 600
    - require:
      - pkg: postgres-install-packages
      - postgres_initdb: postgresql-10-initdb

postgres-hba-config-file:
  file.managed:
    - name: /var/lib/pgsql/10/data/pg_hba.conf
    - source: salt://files/var/lib/pgsql/10/data/pg_hba.conf
    - template: jinja
    - user: postgres
    - group: postgres
    - mode: 600
    - require:
      - pkg: postgres-install-packages
      - postgres_initdb: postgresql-10-initdb

postgres-idents-config-file:
  file.managed:
    - name: /var/lib/pgsql/10/data/pg_ident.conf
    - source: salt://files/var/lib/pgsql/10/data/pg_ident.conf
    - template: jinja
    - user: postgres
    - group: postgres
    - mode: 600
    - require:
      - pkg: postgres-install-packages
      - postgres_initdb: postgresql-10-initdb

postgres-start-server:
  service.running:
    - name: postgresql-10.service
    - enable: True
    - watch:
      - pkg: postgres-install-packages
      - file: postgres-hba-config-file
      - file: postgres-config-file
      - file: postgres-idents-config-file
