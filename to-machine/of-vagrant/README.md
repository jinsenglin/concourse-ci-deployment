# My Environment

* CPU: x86_64
* OS: masOS Sierra 10.12.3 (Darwin)
* Oracle VM VirtualBox Manager: 5.1.14
* Vagrant: 1.9.1
* Ansible: 2.2.0.0

# Goal: 4 nodes Concourse CI deployment

* 1 vault
* 1 web
* 1 db
* 1 worker

---

# Prerequisites

Use Vagrant to quickly provision 4 hosts.

```
cd vagrant
vagrant up
```

---

# Deployment

Use Ansible to deploy Concourse CI.

```
cd by-ansible
ANSIBLE_HOST_KEY_CHECKING=False ansible-playbook -vvvv -i hosts -e @vars.yml playbook.yml 
```

---

# Note

* Concourse CI v3.3.4 passed the test.

---

# TODO

* by-ansible/roles/vault/files/installer.sh

---

# REFERENCE

* https://concourse.ci/binaries.html
* https://www.digitalocean.com/community/tutorials/how-to-install-concourse-ci-on-ubuntu-16-04
