mysql_dyn_top_grain_mysql.maint:
  grains.list_present:
    - name: installed.states
    - value: mysql.maint

mysql_dyn_top_grain_mysql.users:
  grains.list_present:
    - name: installed.states
    - value: mysql.users

mysql_dyn_top_grain_mysql.database:
  grains.list_present:
    - name: installed.states
    - value: mysql.databases

