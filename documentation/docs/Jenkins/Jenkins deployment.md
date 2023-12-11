## Deploy your Jenkins instance

To monitor, automate the building, testing, and deployment of your repositories, we use Jenkins.
To deploy your Jenkins instance, you first have to gather the local IP of the machine you want to use as host.

> [!warning]
> You must have your Kubernetes cluster up and running before this step. To check if your Kubernetes cluster is installed properly, you can check if the file `admin.conf` is in `ansible/roles/kunernetes` in the repository. If not, check [Kubernetes Deployment](../Kubernetes/Kubernetes%20deployment.md).

Deploying Jenkins and the Docker Registry is done by running this script :
```bash
./deploy_jenkins.sh [ip]
```

The technical documentation for Jenkins is at [Jenkins technical](Jenkins%20technical.md).
