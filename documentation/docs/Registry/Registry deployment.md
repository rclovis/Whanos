## Deploy your Docker Registry

To store and manage the Docker images of your repository, we use a Docker Registry.
To deploy your Registry, you first have to gather the local IP of the machine you want to use as host.

> [!warning]
> You must have your Kubernetes cluster up and running before this step. To check if your Kubernetes cluster is installed properly, you can check if the file `admin.conf` is in `ansible/roles/kunernetes` in the repository. If not, check [Kubernetes Deployment](../Kubernetes/Kubernetes%20deployment.md).

Deploying Jenkins and the Docker Registry is done by running this script :
```bash
./deploy_jenkins.sh [ip]
```

The technical documentation for the Registry is at [Registry technical](Registry%20technical.md).
