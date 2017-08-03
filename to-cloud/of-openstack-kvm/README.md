# My Environment

# Goal: 4 nodes Concourse CI deployment

* 1 vault
* 1 web
* 1 db
* 1 worker

---

# Prerequisites

Use helper script `make-cloud-resources.sh` to reserve cloud resources.

```
cd by-bosh/cloud-resources
./make-cloud-resources.sh
```

Use helper script `make-self-signed-ssl-certs.sh` to generate SSL certificates.

```
cd by-bosh/ssl-certs
./make-self-signed-ssl-certs.sh
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
bosh deploy --ca-cert root-ca.pem -e $BOSH_DIRECTOR_IP -d concourse-ci concourse-ci.yml
```

---

# TODO

* by-bosh/cloud-resources/make-cloud-resources.sh
* by-bosh/ssl-certs/make-self-signed-ssl-certs.sh
* by-bosh/bosh-director-deployment/bosh-director.yml
* by-bosh/concourse-ci-deployment/concourse-ci.yml
