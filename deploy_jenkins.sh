#!/bin/bash

# usage: ./deploy_jenkins.sh <ip1>

if [ $# -eq 2 ]; then
    echo "You must provide 1 argument: <ip1>"
    exit 1
fi

read -p 'Username: ' USER
read -sp 'Password: ' PASSWORD

ssh-copy-id -i ~/.ssh/id_rsa.pub $USER@$1

# Generate inventory file
cd ansible/roles/jenkins
rm -rf inventory.ini
echo "[jenkins]" >> inventory.ini
echo "$1" >> inventory.ini

# launch playbook
ansible-playbook -i inventory.ini --user=$USER --become --become-user=root jenkins.yml -e ansible_become_pass=$PASSWORD