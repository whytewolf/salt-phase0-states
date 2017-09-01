elasticsearch-repo:
  pkgrepo.managed:
    - name: elasticsearch
    - enabled: true
    - humanname: 'Elasticsearch repository for 5.x packages'
    - baseurl: https://artifacts.elastic.co/packages/5.x/yum
    - gpgkey: https://artifacts.elastic.co/GPG-KEY-elasticsearch
    - autorefresh: true
    - type: rpm-md

{% if salt.match.pillar('roles:es_curator_host') %}
elasticsearch-curator-repo:
  pkgrepo.managed:
    - name: elasticsearch-curator
    - enabled: true
    - humanname: 'CentOs'
    - baseurl: http://packages.elastic.co/curator/5/centos/$releasever
    - gpgcheck: true
    - gpgkey: http://packages.elastic.co/GPG-KEY-elasticsearch
{% endif %}
