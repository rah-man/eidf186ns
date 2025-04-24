Some errors that I found:
- `OOMKilled errors`: this is mostly due to the quota in the PVC is exceeded. Either remove some logs, checkpoints, or create a new PVC with a larger capacity.
- `ContainerCreating stalls`: this happened when I used the docker image from GitHub's container registry (GHCR). Not sure why, perhaps EIDF doesn't recognise it, or I didn't setup the right configuration. But when I use the image from Docker Hub, it works.
