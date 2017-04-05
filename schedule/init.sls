cook the books:
  schedule.present:
    - function: state.apply
    - seconds: 1800

mysql_dyn_top_grain:
  grains.list_present:
    - name: installed.states
    - value: schedule
