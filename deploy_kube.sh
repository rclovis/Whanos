#!/bin/bash

if [ $# -lt 3 ]; then
    echo "You must provide at least 3 arguments: <ip registry> <ip1> <ip2>"
    exit 1
fi

if [ $# -gt 7 ]; then
    echo "You must provide at most 7 arguments: <ip registry> <ip1> <ip2> <ip3> <ip4> <ip5> <ip6>"
    exit 1
fi

read -p 'Username: ' USER
read -sp 'Password: ' PASSWORD

IP_REGISTRY=$1
shift

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
    echo $i
    ssh-copy-id -i ~/.ssh/id_rsa.pub $USER@$i
done

# Install kubernetes cluster
ansible-playbook -i inventory/mycluster/hosts.yaml --user=$USER --become --become-user=root reset.yml -e ansible_become_pass=$PASSWORD -e kubectl_localhost=true -e kubeconfig_localhost=true
ansible-playbook -i inventory/mycluster/hosts.yaml --user=$USER --become --become-user=root cluster.yml -e ansible_become_pass=$PASSWORD -e kubectl_localhost=true -e kubeconfig_localhost=true

for i in ${IPS[@]}; do
    ssh $USER@$i "echo "$PASSWORD" | sudo -S sed -i 's/https:\/\/registry-1.docker.io/http:\/\/'$IP_REGISTRY':5000/g' /etc/containerd/config.toml"
    ssh $USER@$i "echo "$PASSWORD" | sudo -S sed -i 's/docker.io/'$IP_REGISTRY':5000/g' /etc/containerd/config.toml"
    ssh $USER@$i "echo "$PASSWORD" | sudo -S sed -i 's/http:\/\/'$IP_REGISTRY':5000\"]/http:\/\/'$IP_REGISTRY':5000\"]\n          insecure_skip_verify = true/g' /etc/containerd/config.toml"
    ssh $USER@$i "echo "$PASSWORD" | sudo -S systemctl restart containerd"
done

cp inventory/mycluster/artifacts/admin.conf ../admin.conf
