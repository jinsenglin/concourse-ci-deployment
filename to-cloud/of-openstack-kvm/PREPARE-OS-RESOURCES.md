# Do once

* Get a project admin username and password
* Import the public key (use the private key by-bosh/ssh-keys/bosh.pem)
* Create a security group (open all)
* Create flavors: m1.xlarge, m1.large, m1.small

To generate a public key file from the existing private key file by-bosh/ssh-keys/bosh.pem

```
cd by-bosh/ssh-keys/

[ -d keys ] && rm -rf keys
mkdir keys

chmod 600 bosh.pem
ssh-keygen -y -f bosh.pem | tee keys/bosh.pub
```

To import the public key

```
cd by-bosh/ssh-keys/keys
openstack keypair create --public-key bosh.pub bosh
```

To create flavors

```
openstack flavor create --vcpus 8 --ram 16384 --disk 160 --swap 0 --public m1.xlarge
openstack flavor create --vcpus 4 --ram 8192 --disk 80 --swap 0 --public m1.large
openstack flavor create --vcpus 1 --ram 2048 --disk 20 --swap 0 --public m1.small
```

---

# Do per bosh director deployment

* Create a router
* Create a network
* Create a subnet
* Get 1 floating IP

---

# Do per concourse ci deployment

* Get 1 floating IP
