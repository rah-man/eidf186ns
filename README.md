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
