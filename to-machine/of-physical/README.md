# My Environment

* Ansible: 2.2.0.0

# Goal: 4 nodes Concourse CI deployment

* 1 vault
* 1 web
* 1 db
* 1 worker

---

# Prerequisites

Modify the file `by-ansible/hosts`.

Make sure python 2.7+ pre-installed in the target machines (CPU: x86_64, OS: Linux).

---

# Deployment

Use Ansible to deploy Concourse CI.

```
cd by-ansible
ANSIBLE_HOST_KEY_CHECKING=False ansible-playbook -vvvv -i hosts -e @vars.yml playbook.yml 
```
