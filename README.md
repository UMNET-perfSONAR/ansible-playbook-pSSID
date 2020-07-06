playbook for pSSID deployment and config

**Quick Start**:

Develop roles:

```
cd roles
git clone git@github.com:UMNET-perfSONAR/ansible-role-pSSID.git
git clone git@github.com:UMNET-perfSONAR/ansible-role-rabbitmq.git
cd ..
```

Get the required roles (note that we ignore errors so we can run this multiple times):

```
ansible-galaxy install -r  requirements.yml --ignore-errors
```

Get the environment

```
vagrant up
```

Run the playbook again to test changes:

```
vagrant provision
```
