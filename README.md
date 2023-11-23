# Repository structure

You will have to place your Dockerfiles in an images directory, itself placed at the root of your repository.
Each language’s Dockerfiles will be named Dockerfile.base and Dockerfile.standalone, respectively for the
base and the standalone images, placed in a directory bearing the name of the language, in the following
fashion:

```console
> ls images
befunge c java javascript python
> ls images/javascript
Dockerfile.base Dockerfile.standalone
```

If you have any usable files related to Jenkins, Kubernetes, or other technologies you use (e.g.: helper scripts, configuration files for easy redeployment of the infrastructure), they need to be placed in your repository.

You are free to decide the file structure.
Any file not present in the repository will be considered to be the equivalent of "hard-coded" into your infrastructure.

> [!important]
> Some files (such as **secrets**, or **generated configuration files** that are specific to each instance) will obviously **not**, and should not, be in the repository, but other files (such as eventual *deployment templates* or *Jenkins* as Code files) should be in your repository if you want to benefit from them during the defense.


# Bonuses
Whanos loves that!
If you want to be blessed with the power of DevOps, you can for example:
- support more languages (e.g.: C++, Go, Rust, or Brainfuck);
- handle other branches than the default one;
- display a Whanos ASCII art when launching a job;
- extend the configuration capabilities
