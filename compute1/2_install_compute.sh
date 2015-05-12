apt-get install -y kvm libvirt-bin pm-utils
apt-get install -y nova-compute-kvm python-guestfs
dpkg-statoverride --update --add root root 0644 /boot/vmlinuz-$(uname -r)
cp statoverride /etc/kernel/postinst.d/
chmod +x /etc/kernel/postinst.d/statoverride
cp nova.conf /etc/nova/
rm /var/lib/nova/nova.sqlite
service nova-compute restart
cp sysctl.conf /etc/
sysctl -p
apt-get install -y neutron-common neutron-plugin-ml2 neutron-plugin-openvswitch-agent
cp neutron.conf /etc/neutron/
cp ml2_conf.ini /etc/neutron/plugins/ml2/ml2_conf.ini
service opensvswitch-switch restart
cp nova-compute.conf /etc/nova/
sh look_nova.sh