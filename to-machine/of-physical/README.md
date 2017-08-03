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

---

# Deployment

Use Ansible to deploy Concourse CI.

```
cd by-ansible
ansible-playbook -vvvv -i hosts -e @vars.yml playbook.yml 
```
