include:
  - sys.install.epel

auth-repo:
  file.managed:
    - name: /etc/yum.repos.d/powerdns-auth-master.repo
    - source: https://repo.powerdns.com/repo-files/centos-auth-master.repo
    - skip-verify: true



