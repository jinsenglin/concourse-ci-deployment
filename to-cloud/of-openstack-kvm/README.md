# My Environment

# Goal: 4 nodes Concourse CI deployment

* 1 vault
* 1 web
* 1 db
* 1 worker

---

# Prerequisites

Method 1: Use helper script `make-cloud-resources.sh` to collect information of available existing cloud resources.

```
cd by-bosh/cloud-resources
./make-cloud-resources.sh collect
```

Method 2: Use helper script `make-cloud-resources.sh` to reserve cloud resources.

```
cd by-bosh/cloud-resources
./make-cloud-resources.sh reserve-collect
```

Use helper script `make-self-signed-ssl-certs.sh` to generate SSL certificates.

```
cd by-bosh/ssl-certs
BOSH_DIRECTOR_HOST=192.168.210.25 ./make-self-signed-ssl-certs.sh
```

Use `bosh-init` CLI to deploy BOSH Director.

```
cd by-bosh/bosh-director-deployment
bosh-init deploy bosh-director.yml
```

---

# Deployment

Use `bosh` CLI to deploy Concourse CI.

```
cd by-bosh/concourse-ci-deployment
BOSH_DIRECTOR_HOST=192.168.210.25 bosh deploy --ca-cert root-ca.pem -e $BOSH_DIRECTOR_HOST -d concourse-ci concourse-ci.yml
```

---

# Note

* IP 192.168.210.25 is the floating IP collected from / assigned by OpenStack.

---

# TODO

* by-bosh/cloud-resources/make-cloud-resources.sh
* by-bosh/bosh-director-deployment/bosh-director.yml
* by-bosh/concourse-ci-deployment/concourse-ci.yml
