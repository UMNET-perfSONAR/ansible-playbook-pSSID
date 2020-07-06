playbook for pSSID deployment and config

**Quick Start**:

Clone this repository:

```
```

Get the required roles (note that we ignore errors so we can run this multiple times):

```
ansible-galaxy install -r  requirements.yml --ignore-errors
```

Set up your inventory.  Connection variables can be added here as well.

```
vi inventory/hosts
```

Run the playbook:

```
ansible-playbook pSSID.yml
```
