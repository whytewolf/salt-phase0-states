postgres_dyn_top_grain_postgres:
  grains.list_present:
    - name: installed.states
    - value: sys.install.postgres

postgres_dyn_top_grain_postgres.users:
  grains.list_present:
    - name: installed.states
    - value: sys.install.postgres.users

#mysql_dyn_top_grain_mysql.database:
#  grains.list_present:
#    - name: installed.states
#    - value: sys.other.mysql.databases

