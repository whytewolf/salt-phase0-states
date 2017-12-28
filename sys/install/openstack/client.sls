salt-cloud_install_cloud:
  pkg.installed:
    - pkgs:
      - salt-cloud
      - python2-pip

salt-cloud_install_cloud_deps:
  pip.installed:
    - pkgs:
      - python-novaclient >= 2.6.1, <= 6.0.1
      - python-keystoneclient
    - reload_modules: true

salt-cloud_provider_config:
  file.managed:
    - name: /tmp/nova.file.out
    - source: salt://files/tmp/test.jinja
    - template: jinja
