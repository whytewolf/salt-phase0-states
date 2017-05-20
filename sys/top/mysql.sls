mysql_dyn_top_grain_mysql.maint:
  grains.list_present:
    - name: installed.states
    - value: sys.maint.mysql

mysql_dyn_top_grain_mysql.users:
  grains.list_present:
    - name: installed.states
    - value: sys.other.mysql.users

mysql_dyn_top_grain_mysql.database:
  grains.list_present:
    - name: installed.states
    - value: sys.other.mysql.databases

