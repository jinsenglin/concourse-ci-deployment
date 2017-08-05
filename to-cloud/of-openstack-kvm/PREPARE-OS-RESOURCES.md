# Do once

* Get a project admin username and password
* Import the key pair (use by-bosh/ssh-keys/bosh.pem)
* Create a security group (open all)

To generate public key file from existing private key file by-bosh/ssh-keys/bosh.pem

```
cd by-bosh/ssh-keys/

[ -d keys ] && rm -rf keys
mkdir keys

chmod 600 bosh.pem
ssh-keygen -y -f bosh.pem | tee keys/bosh.pub
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
