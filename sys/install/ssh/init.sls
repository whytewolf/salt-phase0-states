openssh packages:
  pkg.installed:
    - pkgs:
      - openssh
      - openssh-server
      - openssh-clients

sshd config file:
  file.managed:
    - name: /etc/ssh/sshd
