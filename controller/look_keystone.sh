sh creds
echo "" > /var/log/keystone/keystone-all.log
echo "" > /var/log/keystone/keystone-manage.log
tail /var/log/keystone/*
keystone user-list > look_keystone
keystone role-list >> look_keystone
keystone tenant-list >> look_keystone