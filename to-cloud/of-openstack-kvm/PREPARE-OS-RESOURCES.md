# Do once

* Get a project admin username and password
* Import the public key (use the private key by-bosh/ssh-keys/bosh.pem)
* Create a security group (open all)

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

---

# Do per bosh director deployment

* Create a router
* Create a network
* Create a subnet
* Get 1 floating IP

---

# Do per concourse ci deployment

* Get 1 floating IP
