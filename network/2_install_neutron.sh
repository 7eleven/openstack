apt-get install -y vlan bridge-utils
cp sysctl.conf /etc/
apt-get install -y neutron-plugin-ml2 neutron-plugin-openvswitch-agent dnsmasq neutron-l3-agent neutron-dhcp-agent
cp neutron.conf /etc/neutron/
cp l3_agent.ini /etc/neutron/
cp dhcp_agent.ini /etc/neutron/
cp metadata_agent.ini /etc/neutron/
cp ml2_conf.ini /etc/neutron/plugins/ml2/ml2_conf.ini
service openvswitch-switch restart
ovs-vsctl add-br br-ex
ovs-vsctl add-port br-ex eth2