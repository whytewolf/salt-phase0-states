remove-pdns-packages:
  pkg.absent:
    - pkgs:
      - pdns
      - pdns-backend-mysql
      - pdns-backend-remote
      - pdns-tools
      - boost-program-options
      - luajit
      - protobuf

