# Use a stable Python image
FROM python:3.10-slim-buster

# Prevent interactive prompts during package install
ENV DEBIAN_FRONTEND=noninteractive

# Update and install dependencies safely
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    gcc libffi-dev ffmpeg aria2 python3-pip && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

# Copy project files
WORKDIR /app
COPY . /app

# Install Python requirements if present
RUN pip install --no-cache-dir -r requirements.txt || true

# Run your Python app
CMD ["python3", "vars.py"]
