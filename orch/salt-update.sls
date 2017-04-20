fileserver-update:
  salt.runner:
    - name: fileserver.update

git_pillar-update:
  salt.runner:
    - name: git_pillar.update

pillar_refresh:
  salt.function:
    - tgt: '*'
    - name: saltutil.pillar_refresh

sync_all:
  salt.function:
    - tgt: '*'
    - name: saltutil.sync_all


mine_update:
  salt.function:
    - tgt: '*'
    - name: mine.update
