apt-get install -y ntp rabbitmq-server mysql-server python-mysqldb
cp my.cnf /etc/mysql/
cp ntp.conf /etc/
cp crontab /etc/
service ntp restart
service mysql restart
mysql_install_db
mysql_secure_installation