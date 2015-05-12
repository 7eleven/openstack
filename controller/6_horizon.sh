apt-get install -y apache2 memcached libapache2-mod-wsgi openstack-dashboard python-openstackclient
cp horizon/local_settings.py /etc/openstack-dashboard/
echo "ServerName localhost" >> /etc/apache2/apache2.conf
sh service_apache.sh