#!/bin/bash

# Exit if less than 4 arguments given
if [ $# -lt 4 ]; then
    echo "Usage: $0 <ip node1> <ip node2> <ip jenkins> <ip docker>"
    exit 1
fi
# ask the user for the username
read -p 'Username: ' USER
# ask the user for the password
read -sp 'Password: ' PASSWORD

cd ansible/roles/kubernetes
git clone https://github.com/kubernetes-sigs/kubespray.git

# Install dependencies from ``requirements.txt``
python3 -m venv kube_venv
source kube_venv/bin/activate
cd kubespray
sudo pip3 install -r requirements.txt

# Generate inventory file
cp -rfp inventory/sample inventory/mycluster
# edit inventory/mycluster/inventory.ini

cat inventory/mycluster/group_vars/all/all.yml
cat inventory/mycluster/group_vars/k8s_cluster/k8s-cluster.yml
declare -a IPS=($1 $2)
CONFIG_FILE=inventory/mycluster/hosts.yaml python3 contrib/inventory_builder/inventory.py ${IPS[@]}

ssh-copy-id -i ~/.ssh/id_rsa.pub $USER@$1
ssh-copy-id -i ~/.ssh/id_rsa.pub $USER@$2

# Install kubernetes cluster
ansible-playbook -i inventory/mycluster/hosts.yaml --user=$USER --become --become-user=root reset.yml -e ansible_become_pass=$PASSWORD -e kubectl_localhost=true -e kubeconfig_localhost=true
ansible-playbook -i inventory/mycluster/hosts.yaml --user=$USER --become --become-user=root cluster.yml -e ansible_become_pass=$PASSWORD -e kubectl_localhost=true -e kubeconfig_localhost=true

cp inventory/mycluster/artifacts/admin.conf ../admin.conf
