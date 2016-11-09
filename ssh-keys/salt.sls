root_ssh_directory:
  file.directory:
    - name: /root/.ssh
    - user: root
    - group: root
    - clean: false
    - mode: 700

salt_public:
  file.managed:
    - name: /root/.ssh/id_rsa4096.github.pub
    - user: root
    - group: root
    - mode: 644
    - contents_pillar: github_keys:public

salt_private:
  file.managed:
    - name: /root/.ssh/id_rsa4096.github
    - user: root
    - group: root
    - mode: 600
    - contents_pillar: github_keys:private
