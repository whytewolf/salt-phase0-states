salt_public:
  file.managed:
    - name: /root/.ssh/id_rsa4096.github.pub
    - user: root
    - group: root
    - mode: 644
    - makedirs: True
    - dir_mode: 700
    - contents_pillar: github_keys:public

salt_private:
  file.managed:
    - name: /root/.ssh/id_rsa4096.github
    - user: root
    - group: root
    - mode: 600
    - makedirs: True
    - dir_mode: 700
    - contents_pillar: github_keys:private
