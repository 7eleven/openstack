ssh-keygen
nova keypair-add --pub-key ~/.ssh/id_rsa.pub key1
nova secgroup-add-rule default icmp -1 -1 0.0.0.0/0
nova secgroup-add-rule default tcp 22 22 0.0.0.0/0