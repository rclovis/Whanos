#!/bin/bash

if [ $# -lt 2 ]; then
    echo "You must provide at least 2 arguments: <ip1> <ip2>"
    exit 1
fi

if [ $# -gt 6 ]; then
    echo "You must provide at most 6 arguments: <ip1> <ip2> <ip3> <ip4> <ip5> <ip6>"
    exit 1
fi

read -p 'Username: ' USER
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
declare -a IPS=("$@")
CONFIG_FILE=inventory/mycluster/hosts.yaml python3 contrib/inventory_builder/inventory.py ${IPS[@]}

for i in ${IPS[@]}; do
    ssh-copy-id -i ~/.ssh/id_rsa.pub $USER@$i
done

# Install kubernetes cluster
ansible-playbook -i inventory/mycluster/hosts.yaml --user=$USER --become --become-user=root reset.yml -e ansible_become_pass=$PASSWORD -e kubectl_localhost=true -e kubeconfig_localhost=true
ansible-playbook -i inventory/mycluster/hosts.yaml --user=$USER --become --become-user=root cluster.yml -e ansible_become_pass=$PASSWORD -e kubectl_localhost=true -e kubeconfig_localhost=true

cp inventory/mycluster/artifacts/admin.conf ../admin.conf
