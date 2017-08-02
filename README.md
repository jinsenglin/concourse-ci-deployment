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
fly -t test-your-deployment execute -c test-your-deployment.yml
```

---

# TODO

* tests/test-your-deployment.yml
