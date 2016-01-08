{% set GROUP_NAME = "BLAZENT_GROUP" %}
{% set USER_NAME = "BLAZENT_USER" %}
{% set USER_PASSWORD = "BLAZENT" %}
{% set DIR = "cgn" %}
{% set ZIP_FILE = "codegenerator.zip" %}
{% set ZIP_FILE_PATH = "/home/ubuntu" %}





state1:
  cmd.run:
    - order: 1
    - name: |
        groupadd {{ GROUP_NAME }}
        useradd {{ USER_NAME }} -p {{ USER_PASSWORD }} -g {{ GROUP_NAME }}
        usermod -s /bin/false {{ USER_NAME }}
        cd /
        mkdir ./opt
        test -d /opt && echo "/opt directory created successfully "
        test -d /opt && cd /opt
        mkdir ./log
        test -d /opt/log && echo "/opt/log folder created succesfully "
        mkdir ./appdata 
        mkdir ./projects
        test -d /opt/log && chown {{ USER_NAME }}:{{ GROUP_NAME }} /opt/log
        test -d /opt/appdata && chown {{ USER_NAME }}:{{ GROUP_NAME }} /opt/appdata
        test -d /opt/projects && chown {{ USER_NAME }}:{{ GROUP_NAME }} /opt/projects
        test -d /opt/projects && chmod 777 /opt/projects


  pkg.installed:
    - order: 2
    - pkgs:
        - maven

state2:
  cmd.run:
    - order: 3
    - name: |
        echo "java installation starting .... "
        cd /

java7_ppa:
  cmd.run:
    - name: add-apt-repository ppa:webupd8team/java --yes && apt-get update
    - user: root
accept-license:
  cmd.run:
    - name: echo oracle-java7-installer shared/accepted-oracle-license-v1-1 select true | /usr/bin/debconf-set-selections
    - unless: debconf-get-selections | grep -q shared/accepted-oracle-license-v1-1
    - user: root

jdk7:

  pkg.installed:
    - name: oracle-java7-installer
    - pkgrepo: apt-get


    - requires:
      - cmd: accept-license



        

