{% from "files/etc/elasticsearch/map.jinja" import elastic_config with context%}
{{elastic_config|yaml}}
