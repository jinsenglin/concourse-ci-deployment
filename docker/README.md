# concourse-ci-deployment

# 4 nodes deployment

* 1 vault
* 1 web
* 1 db
* 1 worker

---

# Prerequisites

Use helper script `make-rsa-keys.sh` to generate RSA keys.

```
cd rsa-keys
./make-rsa-keys.sh
```

---

# Deployment

Use `docker-compose` CLI to deploy Concourse CI.

```
cd docker-compose
CONCOURSE_EXTERNAL_URL=http://192.168.240.5:8080 docker-compose up
```

---

# Note

* IP 192.168.240.5 is the Docker Engine host external IP.
* Concourse CI v3.3.4 passed the test.

---

# TODO

* 4 nodes deployment
