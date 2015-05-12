apt-get install -y  glance
rm /var/lib/glance/glance.sqlite
mysql -u root -p123456 -e "CREATE DATABASE glance;GRANT ALL PRIVILEGES ON glance.* TO 'glance'@'localhost' IDENTIFIED BY '123456';GRANT ALL PRIVILEGES ON glance.* TO 'glance'@'%' IDENTIFIED BY '123456';"
keystone user-create --name=glance --pass=123456 --email=123456@qq.com
keystone user-role-add --user=glance --tenant=service --role=admin
keystone service-create --name=glance --type=image --description="OpenStack Image Service"
keystone endpoint-create --service-id=$(keystone service-list | awk '/ image / {print $2}') --publicurl=http://192.168.100.11:9292 --internalurl=http://10.0.0.11:9292 --adminurl=http://10.0.0.11:9292
cp glance/glance-api.conf /etc/glance/
cp glance/glance-registry.conf /etc/glance/
service glance-api restart
service glance-registry restart
glance-manage db_sync
sh creds
glance image-create --name="cirros-0.3.2-x86_64" --is-public=true --container-format=bare --disk-format=qcow2 --location=http://download.cirros-cloud.net/0.3.2/cirros-0.3.2-x86_64-disk.img