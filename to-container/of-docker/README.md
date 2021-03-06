# My Environment

* CPU: x86_64
* OS: Ubuntu 16.04.2 LTS (Linux)
* Docker Engine: 17.06.0-ce, build 02c1d87
* Docker Compose: 1.11.2, build dfed245

# Goal: 4 nodes Concourse CI deployment

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

Method 1: Use `docker-compose` CLI to deploy Concourse CI.

```
cd by-docker-compose
CONCOURSE_EXTERNAL_URL=http://192.168.240.5:8080 docker-compose up
```

Method 2: Use `kubectl` CLI to deploy Concourse CI.

```
cd by-k8s
# TODO
```

---

# Note

* IP 192.168.240.5 is the Docker Engine host external IP.
* Concourse CI v3.3.4 passed the test.

---

# TODO

* 4 nodes deployment (currently missing vault node)
