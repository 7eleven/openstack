apt-get install -y neutron-server neutron-plugin-ml2
mysql -u root -p123456 -e "CREATE DATABASE neutron;GRANT ALL PRIVILEGES ON neutron.* TO 'neutron'@'localhost' IDENTIFIED BY '123456';GRANT ALL PRIVILEGES ON neutron.* TO 'neutron'@'%' IDENTIFIED BY '123456';"
keystone user-create --name=neutron --pass=123456 --email=123456@qq.com
keystone user-role-add --user=neutron --tenant=service --role=admin
keystone service-create --name=neutron --type=network --description="OpenStack Networking"
keystone endpoint-create --service-id=$(keystone service-list | awk '/ network / {print $2}') --publicurl=http://192.168.100.11:9696 --internalurl=http://10.0.0.11:9696 --adminurl=http://10.0.0.11:9696
keystone tenant-list | awk '/ service / { print $2 }'
cp neutron/neutron.conf /etc/neutron/
cp neutron/ml2_conf.ini /etc/neutron/plugins/ml2/
sh service_neutron.sh