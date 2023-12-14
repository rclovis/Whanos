# Whanos

The Whanos project aims at developing an automated pipeline to test, compile and deploy applications written in any languages!

## Prerequisites

Before you begin, ensure you have these packages installed in your machine:
- **Ansible**
- **Git**

## Getting Started

### Deploy the pipeline
![image|400](Images/image2.png)
Deploying the pipeline is done using **Ansible** and **Git** in two steps:

* To deploy **Kubernetes**, check out : [Kubernetes deployment](Kubernetes/Kubernetes%20deployment.md)
* To deploy **Jenkins** and the **Registry**, check out : [Jenkins deployment](Jenkins/Jenkins%20deployment.md), [Registry deployment](Registry/Registry%20deployment.md)

### Use the pipeline
![image](Images/image1.png)
To use the pipeline, you must understand how to configure your repo and how to launch the Jenkins job:

* To start using your **pipeline**, check out: [Jenkins usage](Jenkins/Jenkins%20usage.md)
* To start **deploying** your apps and **access** them, check out: [Kubernetes usage](Kubernetes/Kubernetes%20usage.md)

## Creators

<div style="display: flex; justify-content: space-between;">
    <a href="https://github.com/EstusSipper">
        <img src="https://media.licdn.com/dms/image/C4E03AQF6AIitN8q7cg/profile-displayphoto-shrink_400_400/0/1651531289334?e=1703721600&v=beta&t=nCsDz0wBgls-nLvLAzpAZqELOfTItPVJtoWJwRtmSGk" width="150" height="150">
        <p>Erwan Gonzales</p>
    </a>
    <a href="https://github.com/rclovis">
        <img src="https://avatars.githubusercontent.com/u/91875893?v=4" width="150" height="150">
        <p>Clovis Rabot</p>
    </a>
    <a href="https://github.com/TotoFunki">
        <img src="https://media.licdn.com/dms/image/D4E03AQF5p--YcDCWoQ/profile-displayphoto-shrink_800_800/0/1697809819173?e=1706745600&v=beta&t=FIEWA66x7PpYe9ZfTns7dk1rxuWL16BEAU34tHwqS0Q" width="150" height="150">
        <p>Théo Liennard</p>
    </a>
</div>
