# Copyright Thomas "Whytewolf" Phipps 2016

# install bind and utils
bind_install:
  pkg.latest:
    - pkgs:
      - bind
      - bind-utils


