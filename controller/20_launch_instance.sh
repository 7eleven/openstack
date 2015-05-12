cd ~/openstack/controller/
neutron net-create ext-net --shared --router:external=True
neutron subnet-create ext-net --name ext-subnet --allocation-pool start=192.168.100.101,end=192.168.100.200 --disable-dhcp --gateway 192.168.100.1 192.168.100.0/24
neutron net-create int-net
neutron subnet-create int-net --name int-subnet --dns-nameserver 114.114.114.114 --gateway 172.16.1.1 172.16.1.0/24
neutron router-create router1
neutron router-interface-add router1 int-subnet
neutron router-gateway-set router1 ext-net
NET_ID=$(neutron net-list |awk '/ int-net / {print $2}')
nova boot --flavor m1.tiny --image cirros-0.3.2-x86_64 --nic net-id=$NET_ID --security-group default --key-name key1 instance1
nova list
neutron floatingip-create ext-net
nova floating-ip-associate instance1 192.168.100.102
ssh-keygen
nova keypair-add --pub-key ~/.ssh/id_rsa.pub key1
nova secgroup-add-rule default icmp -1 -1 0.0.0.0/0
nova secgroup-add-rule default tcp 22 22 0.0.0.0/0