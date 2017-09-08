# 4 nodes Concourse CI deployment

* 1 vault
* 1 web
* 1 db
* 1 worker

---

# Test your deployment

Use `fly` CLI to issue a task.

```
cd tests

# e.g.,
export HTTP=http
export HOST=192.168.33.101
export PORT=8080
export ADMIN_USER=admin
export ADMIN_PASS=admin

fly -t concourse-ci login --concourse-url $HTTP://$HOST:$PORT --team-name=main --username=$ADMIN_USER --password=$ADMIN_PASS
fly -t concourse-ci execute -c test-your-deployment.yml
```

---

# For single all-in-one VM deployment

Old way

```
vagrant init --box-version "2.7.0" concourse/lite
vagrant up

# http://192.168.100.4:8080
# main team (no admin account, no admin password)
```

New way

```
wget https://github.com/concourse/concourse/releases/download/v3.4.1/concourse-lite.yml
bosh create-env concourse-lite.yml

# http://192.168.100.4:8080
# main team (no admin account, no admin password)
```
