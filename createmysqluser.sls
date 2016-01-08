{% set NEW_USER = "SPECIFY_USER_TO_BE_CREATED_HERE" %}
{% set NEW_USER_PASSWORD = "SPECIFY_USER_TO_BE_CREATED_PASSWORD_HERE" %}
{% set USER_NAME = "SPECIFY_MYSQL_CONNECTION_USERNAME_HERE" %}
{% set USER_PASSWORD = "SPECIFY_MYSQL_CONNECTION_PASSWORD_HERE" %}
{% set DB_NAME = "SPECIFY_DATABASE_TO_GRANT_PERMISSION_ON_HERE" %}
#NOTE: Specify '*' to grant permission on all databases


state1:
  pkg.latest:
    - order: 1
    - pkgs:
       - python-mysqldb

{{ NEW_USER }}:
  mysql_user.present:
    - order: 2
    - host: '%'
    - password: {{ NEW_USER_PASSWORD }}
    - connection_user: {{ USER_NAME }}
    - connection_pass: {{ USER_PASSWORD }}
    - connection_charset: utf8
    - saltenv:
       - LC_ALL: "en_US.utf8"

  mysql_grants.present:
    - order: 3
    - grant: all privileges
    - database: '{{ DB_NAME }}.*'
    - user: {{ NEW_USER }}
    - connection_pass: {{ USER_PASSWORD }}
    - host: '%'
