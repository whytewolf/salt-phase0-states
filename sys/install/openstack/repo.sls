{% os_version = salt.pillar.get('openstack:core:version','ocata') %}
openstack-repo-install:
  pkg.installed:
    - name: centos-release-openstack-{{os_version}}
