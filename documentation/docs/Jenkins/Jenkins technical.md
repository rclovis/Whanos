# Jenkins Technical

## Deployment

Jenkins deployment is done using a Dockerfile.

The produced image setups everything Jenkins needs to be operational.

- configuration using JCasC
- bash scripts for completing jobs
- whanos images dockerfiles
- admin account

The deployment is issued by Ansible in the main process. But the Jenkins Image we build can be used standalone, given that you provide the necessary files for its creation.
