# copyright Thomas "Whytewolf" Phipps 2016


pdns_pkgs_removed:
  pkg.absent:
    - pkgs:
      - pnds
      - pdns-recursor

pdns_repos_gone:
  file.absent:
    - names:
      - /etc/yum.repos.d/powerdns-auth-40.repo
      - /etc/yum.repos.d/powerdns-rec-40.repo 

pdns_config_directory_gone:
  file.absent:
    - name: /etc/pdns

