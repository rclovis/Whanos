## Deploy your apps

For you to start deploying your apps, you have to set up your repo, so I can be properly understood and deploy by the pipeline.

### Whanos.yaml

To do that, you have to create a `whanos.yaml` file at the root of your repository.

The `whanos.yaml` file can contain a `deployment` root property, which itself can contain:

- `replicas` → Number of replicas to have (default: 1; 2 replicas means that 2 instances of the resulting pod
must be running at the same time in the cluster);
- `resources` → Resource needs, corresponding to Kubernetes’ own resource specifications (default: no specifications);
- `ports` → An integer list of ports needed by the container to be forwarded to it (default: no ports forwarded).

Here is an example of a `whanos.yaml` file
```
deployment:
	replicas: 3
	resources:
		limits:
			memory: "128M"
		requests:
			memory: "64M"
	ports:
		- 3000
```
