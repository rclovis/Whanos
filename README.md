# Whanos

The Whanos project aims at developing an automated pipeline to test, compile and deploy applications written in any languages

## Prerequisites

Before you begin, ensure you have these packages installed in your machine:
- Ansible
- git

## Getting Started

### Deploy Kubernetes

For your applications to be deployed, we use Kubernetes.
Firstly, you must gather the local ip of the machines you want to use as nodes for your cluster.

To set up the Kubernetes cluster, you have to run this script:
```bash
./deploy_kube [ip1] [ip2] ...
```
This step can take 30 minutes to 1h depending on the number of nodes

> [!warning]
> The number of nodes required for to use Whanos range from 2 to 6

The documentation for this part is at [Kubernetes](Kubernetes/Kubernetes.md)

## Creator

<div align="center">
<div style="display: flex; flex-wrap: wrap; justify-content: center; align-items: center;">
<div style="text-align: center; margin: 10px;">
<img src="https://avatars.githubusercontent.com/u/91875893?v=4" width="200" height="200">
<p>Clovis Rabot</p>
<p><a href="mailto:clovis.rabot@epitech.eu">clovis.rabot@epitech.eu</a></p>
</div>
<div style="text-align: center; margin: 10px;">
<img src="https://media.licdn.com/dms/image/C4E03AQF6AIitN8q7cg/profile-displayphoto-shrink_400_400/0/1651531289334?e=1703721600&v=beta&t=nCsDz0wBgls-nLvLAzpAZqELOfTItPVJtoWJwRtmSGk" width="200" height="200">
<p>Erwan Gonzales</p>
<p><a href="mailto:erwan.gonzales@epitech.eu">erwan.gonzales@epitech.eu</a></p>
</div>
<div style="text-align: center; margin: 10px;">
<img src="https://media.licdn.com/dms/image/D4E03AQF5p--YcDCWoQ/profile-displayphoto-shrink_800_800/0/1697809819173?e=1706745600&v=beta&t=FIEWA66x7PpYe9ZfTns7dk1rxuWL16BEAU34tHwqS0Q" width="200" height="200">
<p>Théo Liennard</p>
<p><a href="mailto:theo.liennard@epitech.eu">theo.liennard@epitech.eu</a></p>
</div>
</div>
</div>
