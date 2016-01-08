{% set MYSQL_ROOT_PASSWORD = "root" %}
state1:
  cmd.run:
    - order: 1
    - name: |
       cd /opt
       echo "Starting mysql installation"
  pkg.installed:
    - order: 2
    - pkgs:
       - mysql-server
       - mysql-common
       - mysql-client
state2:
  cmd.run:
    - order: 3
    - name: |
       update-rc.d mysql defaults
       echo "Mysql installation Completed"
       mysqladmin -u root password {{ MYSQL_ROOT_PASSWORD }}
