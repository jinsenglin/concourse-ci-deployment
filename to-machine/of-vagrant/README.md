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

NOTE: If your want to use the hosts not provisioned by `vagrant/Vagrantfile`, modify the file `ansible/hosts`.

---

# Deployment

Use Ansible to deploy Concourse CI.

```
cd ansible
ansible-playbook -vvvv -i hosts -e @vars.yml playbook.yml 
```

---

# TODO

* vagrant/Vagrantfile
* ansible/hosts
* ansible/vars.yml
* ansible/playbook.yml
