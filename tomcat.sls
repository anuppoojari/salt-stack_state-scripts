state1:
  cmd.run:
    - order: 1
    - name: |
        cd /opt
        mkdir tomcat
        cd tomcat
        wget http://www.us.apache.org/dist/tomcat/tomcat-7/v7.0.67/bin/apache-tomcat-7.0.67.tar.gz
        tar -xvf apache-tomcat-7.0.67.tar.gz
        rm -rf apache-tomcat-7.0.67.tar.gz 
        sh apache-tomcat-7.0.67/bin/startup.sh
