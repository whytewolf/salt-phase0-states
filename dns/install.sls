# Copyright Thomas "Whytewolf" Phipps 2016

# install bind and utils
bind_install:
  pkg.latest:
    - pkgs:
      - bind
      - bind-utils

bind_config:
  file.managed:
    - name: /etc/named.conf
    - source: salt://dns/files/named.conf.jinja
    - template: jinja
    - mode: 664
    - user: named
    - group: named

var_named_cleanup:
  file.directory:
    - name: /var/named
    - user: named
    - group: named
    - dir_mode: 775
    - file_mode: 664
    - recurse:
      - user
      - group

wolfcloud_dynamic_db:
  file.managed:
    - name: /var/named/dynamic/wolfcloud.bad4.us.db
    - source: salt://dns/files/dynamic.forward.template.jinja
    - template: jinja
    - mode: 664
    - user: named
    - group: named
    - defaults:
        nameserver: 10.40.0.105
        domain: wolfcloud.bad4.us
