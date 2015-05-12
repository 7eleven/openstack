apt-get install -y nova-api nova-cert nova-conductor nova-consoleauth nova-novncproxy nova-scheduler python-novaclient
rm /var/lib/nova/nova.sqlite
mysql -u root -p123456 -e "CREATE DATABASE keystone;GRANT ALL PRIVILEGES ON keystone.* TO 'keystone'@'localhost' IDENTIFIED BY '123456';GRANT ALL PRIVILEGES ON keystone.* TO 'keystone'@'%' IDENTIFIED BY '123456';"
keystone user-create --name=nova --pass=123456 --email=123456@qq.com
keystone user-role-add --user=nova --tenant=service --role=admin
keystone service-create --name=nova --type=compute --description="OpenStack Compute"
keystone endpoint-create --service-id=$(keystone service-list | awk '/ compute / {print $2}') --publicurl=http://192.168.100.11:8774/v2/%\(tenant_id\)s --internalurl=http://10.0.0.11:8774/v2/%\(tenant_id\)s --adminurl=http://10.0.0.11:8774/v2/%\(tenant_id\)s
cp nova/nova.conf /etc/nova/
nova-manage db sync
sh look_nova.sh