neutron net-create int-net
neutron subnet-create int-net --name int-subnet --dns-nameserver 114.114.114.114 --gateway 172.16.1.1 172.16.1.0/24