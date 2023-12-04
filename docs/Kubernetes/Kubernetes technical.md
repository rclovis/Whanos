## Introduction

In this part of the documentation, we will go through the working of Kubernetes in Whanos.

## Kubespray

We use Kubespray to set up the nodes of the cluster.
We have chosen this deployment method because it is a reliable, simple and effective way to self-host Kubernetes systems.

If you want to know more about Kubespray check out their [Documentation](https://github.com/kubernetes-sigs/kubespray) !

## Helm

To deploy applications onto Kubernetes pods, we use **Helm** to template our yaml files.
Helm is particularly useful because it can read the `wanos.yaml` files to adapt deployment specification and services in Kubernetes.

You can also check out their [Documentation](https://helm.sh/docs/) !


