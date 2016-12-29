fileserver-update:
  salt.runner:
    - fileserver.update

git_pillar-update:
  salt.runner:
    - git_pillar.update

pillar_refresh:
  salt.function:
    - tgt: '*'
    - name: saltutil.pillar_refresh

sync_all:
  salt.function:
    - tgt: '*'
    - name: saltutil.sync_all
