highstate scheduled job:
  schedule.present:
    - function: state.apply
    - seconds: 1800

schedule_dyn_top_grain:
  grains.list_present:
    - name: installed.states
    - value: sys.maint.highstate
