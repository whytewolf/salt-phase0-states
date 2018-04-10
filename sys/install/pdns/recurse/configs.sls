pdns-auth-config:
  file.managed:
    - name: /etc/pdns/pdns.conf
    - source: salt://files/etc/pdns/pdns.conf
    - template: jinja
    - mode: '0600'
    - user: root
    - group: root
