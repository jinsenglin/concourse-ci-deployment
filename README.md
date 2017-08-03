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
