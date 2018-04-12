pdns-recurse-config:
  file.managed:
    - name: /etc/pdns-recursor/recursor.conf
    - source: salt://files/etc/pdns-recursor/recursor.conf
    - template: jinja
    - mode: '0644'
    - user: root
    - group: root


{% if salt.match.pillar('pdns:configs:forward-zones-file') %}
pdns-forward-zone-config:
  file.managed:
    - name: {{salt.pillar.get('pdns:configs:forward-zones-file')}}
    - source: salt://files/etc/pdns-recursor/forward-zones.conf
    - template: jinja
    - mode: '0644'
    - user: root
    - group: root

{%endif%}
