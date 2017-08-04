# My Environment

* CPU: x86_64
* OS: masOS Sierra 10.12.3 (Darwin)
* spiff cli: 1.0.8
* bosh-init cli: 0.0.102
* bosh cli: 2.0.1

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

# output: resources/
```

Method 2: Use helper script `make-cloud-resources.sh` to reserve cloud resources.

```
cd by-bosh/cloud-resources
./make-cloud-resources.sh reserve-collect

# output: resources/
```

Use helper script `make-self-signed-ssl-certs.sh` to generate SSL certificates.

```
cd by-bosh/ssl-certs
./make-self-signed-ssl-certs.sh

# or use BOSH_DIRECTOR_HOST to precede OS_RES_FLOATING_IP_BOSH_DIRECTOR 
BOSH_DIRECTOR_HOST=192.168.240.34 ./make-self-signed-ssl-certs.sh

# output: certs/
```

Use helper script `make-final-bosh-director-deployment.sh` to generate final bosh-director.yml

```
cd by-bosh/bosh-deployments
./make-final-bosh-director-deployment.sh

# output: deployments/
```

Use `bosh-init` CLI to deploy BOSH Director.

```
cd by-bosh/bosh-director-deployment
bosh-init deploy bosh-director.yml

# output: bosh-director-state.json

# To delete this deployment
# Run `bosh-init delete bosh-director.yml`
```

Use helper script `make-final-concourse-ci-deployment.sh` to generate final concourse-ci.yml

```
cd by-bosh/bosh-deployments
./make-final-concourse-ci-deployment.sh

# output: deployments/
```

---

# Deployment

Use `bosh` CLI to deploy Concourse CI.

```
cd by-bosh/concourse-ci-deployment
BOSH_DIRECTOR_HOST=192.168.240.34 bosh deploy --ca-cert root-ca.pem -e $BOSH_DIRECTOR_HOST -d concourse-ci concourse-ci.yml

# output:
```

---

# Note

* IP 192.168.240.34 is the floating IP collected from / assigned by OpenStack.

---

# TODO

* by-bosh/cloud-resources/make-cloud-resources.sh reserve-collect
* by-bosh/bosh-deployments/make-final-concourse-ci-deployment.sh
