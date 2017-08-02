# concourse-ci-deployment

# 4 nodes deployment

* 1 vault
* 1 web
* 1 db
* 1 worker

---

# Test your deployment

Use `fly` CLI to issue a task.

```
cd tests
fly -t concourse-ci login --concourse-url $HTTP://$HOST:$PORT --team-name=main --username=$ADMIN_USER --password=$ADMIN_PASS
fly -t concourse-ci execute -c test-your-deployment.yml
```
