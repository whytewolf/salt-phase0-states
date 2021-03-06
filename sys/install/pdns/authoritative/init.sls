include:
  - sys.install.epel

auth-repo:
  file.managed:
    - name: /etc/yum.repos.d/powerdns-auth-master.repo
    - source: https://repo.powerdns.com/repo-files/centos-auth-41.repo
    - skip_verify: True

install-powerdns-auth:
  pkg.installed:
    - pkgs:
      - pdns
      - pdns-backend-mysql
      - pdns-backend-remote
      - pdns-tools

