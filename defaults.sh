#/bin/sh

# The purpose of this script is to create Ansible inventories.
# Usage: ./defaults.sh [ directory ]

if [ "$1" == "" ]; then
  directory="inventory"
else
  directory=$1
fi

mkdir -p $directory/group_vars/
mkdir -p $directory/group_vars/pSSID-testpoints
mkdir -p $directory/host_vars/

# copy hosts file
wget -q -P $directory -nc \
  https://raw.githubusercontent.com/UMNET-perfSONAR/ansible-playbook-pSSID/master/inventory/hosts

if ! [ -f $directory/group_vars/pSSID-testpoints/pSSID.yml ]; then
  cp roles/ansible-role-pSSID/defaults/main.yml \
    $directory/group_vars/pSSID-testpoints/pSSID.yml
fi

if ! [ -f $directory/group_vars/pSSID-testpoints/rabbitmq ]; then
  cp roles/ansible-role-rabbitmq/defaults/main.yml \
    $directory/group_vars/pSSID-testpoints/rabbitmq
fi

if ! [ -f $directory/group_vars/pSSID-testpoints/ps_installer.yml ]; then
  cp roles/ansible-role-perfsonar-installer/defaults/main.yml \
    $directory/group_vars/pSSID-testpoints/ps_installer.yml
fi

if ! [ -f $directory/group_vars/pSSID-testpoints/ps_testpoint.yml ]; then
  cp roles/ansible-role-perfsonar-testpoint/defaults/main.yml \
    $directory/group_vars/pSSID-testpoints/ps_testpoint.yml
fi
