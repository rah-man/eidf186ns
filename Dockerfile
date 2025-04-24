FROM python:3.9-slim

# Install OS-level dependencies
RUN apt-get update && \
    apt-get install -y --no-install-recommends git && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Set the working directory
WORKDIR /app

# Copy the files into the image
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# COPY app/ ./app/

# Set the default command
# CMD ["python", "app/train.py"]
