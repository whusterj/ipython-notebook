install-ipython:
  cmd.run:
    - user: vagrant 
    - name: "sudo pip install 'ipython[all]'"
    - shell: /bin/bash
    - cwd: /home/vagrant/
    - require:
      - pkg: python-pip


create-ipython-profile:
  cmd.run:
    - user: vagrant
    - name: "ipython profile create myserver"
    - shell: /bin/bash
    - cwd: /home/vagrant
    - require:
      - cmd: install-ipython


configure-ipython:
  file.copy:
    - name: /home/vagrant/.ipython/profile_myserver/ipython_notebook_config.py
    - source: /home/vagrant/ipython/vm/config/ipython_notebook_config.py
    - user: vagrant
    - group: vagrant
    - mode: 744
    - force: True
    - require:
      - cmd: create-ipython-profile


start-ipython-server:
  cmd.run:
    - user: vagrant
    - name: "ipython notebook --profile=myserver"
    - shell: /bin/bash
    - cwd: /home/vagrant/ipython/notebooks
    - require:
      - file: configure-ipython
