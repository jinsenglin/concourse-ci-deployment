# My Environment

# Goal: 4 nodes Concourse CI deployment

* 1 vault
* 1 web
* 1 db
* 1 worker

---

# Prerequisites

Follow following steps to prepare your cloud resources.

Use helper script `make-cloud-resources.sh` to reserve cloud resources.

```
cd cloud-resources
./make-cloud-resources.sh
```

Use helper script `make-self-signed-ssl-certs.sh` to generate SSL certificates.

```
cd ssl-certs
./make-self-signed-ssl-certs.sh
```

Use `bosh-init` CLI to deploy BOSH Director.

```
cd bosh-director-deployment
bosh-init deploy bosh-director.yml
```

---

# Deployment

Use `bosh` CLI to deploy Concourse CI.

```
cd concourse-ci-deployment
bosh deploy --ca-cert root-ca.pem -e $BOSH_DIRECTOR_IP -d concourse-ci concourse-ci.yml
```

---

# TODO

* cloud-resources/make-cloud-resources.sh
* ssl-certs/make-self-signed-ssl-certs.sh
* bosh-director-deployment/bosh-director.yml
* concourse-ci-deployment/concourse-ci.yml
