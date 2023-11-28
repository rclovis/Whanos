#!/bin/bash

# Exit if less than 4 arguments given
if [ $# -lt 4 ]; then
    echo "Usage: $0 <ip node1> <ip node2> <ip jenkins> <ip docker>"
    exit 1
fi

cd ansible/roles/kubernetes
git clone https://github.com/kubernetes-sigs/kubespray.git

# Install dependencies from ``requirements.txt``
python3 -m venv kube_venv
cd kubespray
source kube_venv/bin/activate
sudo pip3 install -r requirements.txt

# Generate inventory file
cp -rfp inventory/sample inventory/mycluster
cat inventory/mycluster/group_vars/all/all.yml
cat inventory/mycluster/group_vars/k8s_cluster/k8s-cluster.yml
declare -a IPS=($1 $2)
CONFIG_FILE=inventory/mycluster/hosts.yaml python3 contrib/inventory_builder/inventory.py ${IPS[@]}




# Install kubernetes cluster
ansible-playbook -i inventory/mycluster/hosts.yaml --user=puta --become --become-user=root reset.yml
ansible-playbook -i inventory/mycluster/hosts.yaml --user=puta --become --become-user=root cluster.yml

