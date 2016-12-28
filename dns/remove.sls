# copyright Thomas "Whytewolf" Phipps 2016

# remove bind and the libs installed with it
bind_uninstall:
  pkg.removed:
    - pkgs:
      - bind
      - bind-utils
      - bind-libs

#make sure the config directory is gone
bind_config_dir_remove:
  file.absent:
    - name: /etc/named

#make sure the data directory is gone
bind_data_dir_remove:
  file.absent:
    - name: /var/named
