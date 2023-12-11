## Deploy your Kubernetes nodes

For your applications to be deployed, we use Kubernetes.
Firstly, you must gather the local IP of the machines you want to use as nodes for your cluster.

To set up the Kubernetes cluster, you have to run this script :
```bash
./deploy_kube.sh [ip1] [ip2] ...
```
This step can take 30 minutes to 1h depending on the number of nodes

> [!warning]
> The number of nodes required for to use Whanos ranges from 2 to 6.

The technical documentation for kubernetes is at [Kubernetes technical](Kubernetes%20technical.md).
