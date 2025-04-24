# eidf186ns

# 🤖 HuggingFace Training Job on Kubernetes

This is a preliminary work, or basically just a setup, to train a HuggingFace model on Kubernetes Job using a custom Docker image. It includes Docker, Kubernetes YAMLs, and usage of a PersistentVolumeClaim (PVC).

---

## 📦 Project Structure

- `Dockerfile`: Defines the Python environment with dependencies.
- `requirements.txt`: Python libraries required for training.
- `train.py`: Training script (e.g., text classification or NER).
- `k8s/job-template.yaml`: Kubernetes Job YAML.
- `k8s/pvc.yaml`: PVC YAML for storing output files/checkpoints.
- `notes/troubleshooting.md`: Issues and solutions encountered.
- `.dockerignore`: Files/folders to ignore in Docker context.

---

## 🐳 Docker

I need to login to docker before pushing the image. Note to self: use `fr27` as my login.

### Build the Docker image

```bash
docker login
docker build -t fr27/frahman-hugface:latest .
docker push fr27/frahman-hugface:latest
```

---

## Kubernetes

### Create alias
To save the typing `kubectl --namespace eidf186ns`, a new command alias can be made following these steps:
```
    vim ~/.bashrc
    alias <new_command>='kubectl -n eidf106ns'
```
Save the file and reload by running this command: `source ~/.bashrc`.
Try the alias: `<new_command> get jobs`

### Basic Kubernetes commands
For jobs and pods:
```
    kubectl -n <project-namespace> create -f <job.yml>
    kubectl -n <project-namespace> get jobs
    kubectl -n <project-namespace> describe job <job_id>
    kubectl -n <project-namespace> get pods
    kubectl -n <project-namespace> describe pod <pod_id>
    kubectl -n <project-namespace> logs <pod_id>
    kubectl -n <project-namespace> delete job <job_id>
```

For PVC:
```
    kubectl -n <project-namespace> create -f <pvc.yml>
    kubectl -n <project-namespace> delete pvc <pvc_id>
    kubectl -n <project-namespace> get pvc <pvc_id>
    kubectl -n <project-namespace> apply -f <pvc.yml>
    kubectl -n <project-namespace> delete pvc <pvc_id>
```

Accessing a PVC from a lightweight job's pod:
```
    kubectl -n <project-namespace> cp alice.txt <pod_id>:/mnt/app/
    kubectl -n <project-namespace> exec <pod_id> -- ls /mnt/app/
    kubectl -n <project-namespace> exec <pod_id> -- curl https://archive.ics.uci.edu/static/public/53/iris.zip -o /mnt/app/iris.zip
```
