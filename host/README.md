# concourse-ci-deployment

# 4 nodes deployment

* 1 vault
* 1 web
* 1 db
* 1 worker

---

# Host

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
