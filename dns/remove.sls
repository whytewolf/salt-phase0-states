bind_uninstall:
  pkg.removed:
    - pkgs:
      - bind
      - bind-utils
      - bind-libs

bind_config_dir_remove:
  file.absent:
    - name: /etc/named

bind_data_dir_remove:
  file.absent:
    - name: /var/named
