# concourse-ci-deployment

# 4 nodes deployment

* 1 vault
* 1 web
* 1 db
* 1 worker

---

# ?

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
docker-compose up
```

---

# TODO

* rsa-keys/make-rsa-keys.sh
* docker-compose/docker-compose.yml
