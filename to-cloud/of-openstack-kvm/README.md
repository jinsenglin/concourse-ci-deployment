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

## Phase 1

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

Use helper script `make-cloud-configs.sh` to setup BOSH Director

```
cd by-bosh/cloud-configs
./make-cloud-configs.sh

# output: configs/
```

Use helper script `backup-phase1.sh` to backup phase 1 outputs

```
cd by-bosh/backup-restore-phase1
./backup-phase1.sh <backup dest dir>

# output: <backup src dir>/phase1
```

## Phase 2

Use helper script `restore-phase1.sh` to restore phase 1 outputs

```
cd by-bosh/backup-restore-phase1
./restore-phase1.sh <backup src dir>
```

Use helper script `make-final-concourse-ci-deployment.sh` to generate final concourse-ci.yml

```
cd by-bosh/bosh-deployments
./make-final-concourse-ci-deployment.sh

# output: deployments/
```

Use helper script `backup-phase2.sh` to restore phase 2 outputs

```
cd by-bosh/backup-restore-phase2
./restore-phase2.sh <backup src dir>

# output: <backup src dir>/phase2
```

---

# Deployment

Use helper script `restore-phase2.sh` to restore phase 1 outputs

```
cd by-bosh/backup-restore-phase2
./restore-phase2.sh <backup src dir>
```

Use `bosh` CLI to deploy Concourse CI.

```
cd by-bosh/concourse-ci-deployment
bosh --ca-cert root-ca.pem -e 192.168.240.34 -d concourse-ci deploy -n concourse-ci.yml

# output:

# To delete this deployment
# Run `bosh --ca-cert root-ca.pem -e 192.168.240.34 -d concourse-ci delete-deployment -n`
```

---

# Note

* IP 192.168.240.34 is the floating IP collected from / assigned by OpenStack.
* bosh-openstack-kvm-ubuntu-trusty-go_agent.stemcell 3363.12 passed the test.
* bosh-openstack-cpi.release 31 passed the test.
* bosh-director.release 261.4 passed the test.
* concourse.release 2.7.0 passed the test.
* garden-runc.release 1.3.0 passed the test.
* bosh director login: admin / admin
* concourse ci login: admin / admin

---

# TODO

* by-bosh/cloud-resources/make-cloud-resources.sh reserve-collect
* 4 nodes deployment (currently missing vault node)
