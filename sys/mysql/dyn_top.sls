mysql_dyn_top_grain_mysql.maint:
  grains.list_present:
    - name: installed.states
    - value: sys.mysql.maint

mysql_dyn_top_grain_mysql.users:
  grains.list_present:
    - name: installed.states
    - value: sys.mysql.users

mysql_dyn_top_grain_mysql.database:
  grains.list_present:
    - name: installed.states
    - value: sys.mysql.databases

