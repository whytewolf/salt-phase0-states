{% from "files/etc/elasticsearch/map.jinja" import elastic_config with context%}

java_pkg:
  pkg.installed:
    - name: java-1.8.0-openjdk-headless
    - allow_updates: true
    - version: '1:1.8.0.141-1.b16.el7_3'

elasticsearch_pkg:
  pkg.installed:
    - name: elasticsearch
    - allow_updates: true
    - version: '5.5.2-1'

elasticsearch_config:
  file.serialize:
    - name: /etc/elasticsearch/elasticsearch.yml
    - formatter: yaml
    - dataset: {{elastic_config|yaml}}
