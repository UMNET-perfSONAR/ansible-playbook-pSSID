#README for pSSID deployment and config

**Quick Start**:

**RPi4 OS install**:
Install Ubuntu 18 64 bit version:
https://ubuntu.com/download/raspberry-pi
Install on SD Card as per Ubuntu's instructions.

from console:
log on as ubuntu
change user ubuntu and root password

```
sudo -s
passwd
```

**pSSID Bootstrap**:

On the Ansible Controller:

Clone the playbook

```
git clone https://github.com/UMNET-perfSONAR/ansible-playbook-pSSID.git
cd ansible-playbook-pSSID
```

Get the required roles (ignore errors so we can run this multiple times):

```
ansible-galaxy install -r requirements.yml --ignore-errors
```

Define testpoints, add ip address or FQDN of the testpoint under
the [pSSID-testpoints] group

If you have your own inventory, clone this inventory in the playbook dir at
this point.
If you do not have your own inventory, create one with defaults.sh or use
the "inventory" directory.

```
./defaults.sh myinventory/inventory
```

or

```
vi inventory/hosts
```

Edit pSSID config files:

```
vi inventory/group_vars/pSSID-testpoints/*
```

Use Ansible ping to verify connectivity to targets:

Note that your inventory path or connection details may be different.

```
ansible all \
  --ask-become-pass \
  --become-method su \
  -i inventory \
  -m ping
```

Run the playbook:

```
ansible-playbook \
  --ask-pass \
  --ask-become-pass \
  -i inventory \
  pSSID.yml
```
