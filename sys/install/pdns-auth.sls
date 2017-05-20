#copyright 2017 Thomas "Whytewolf" Phipps

#install repo the chea easy way
authoritive pdns repo:
  file.managed:
    - name: /etc/yum.repos.d/powerdns-auth-40.repo
    - source: salt://files/etc/yum.repos.d/powerdns-auth-40.repo

pdns_installed:
  pkg.installed:
    - pkgs:
      - pdns
      - yum-plugin-priorities
      - pdns-backend-mysql
