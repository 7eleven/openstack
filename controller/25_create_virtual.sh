NET_ID=$(neutron net-list |awk '/ int-net / {print $2}')
nova boot --flavor m1.tiny --image cirros-0.3.2-x86_64 --nic net-id=$NET_ID --security-group default --key-name key1 instance1
nova list
neutron floatingip-create ext-net
nova floating-ip-associate instance1 192.168.100.102