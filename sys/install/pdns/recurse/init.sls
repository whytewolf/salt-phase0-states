include:
  - sys.install.epel

auth-repo:
  file.managed:
    - name: /etc/yum.repos.d/powerdns-recurse.repo
    - source: https://repo.powerdns.com/repo-files/centos-rec-41.repo
    - skip_verify: True

install-powerdns-auth:
  pkg.installed:
    - pkgs:
      - pdns-recurse

