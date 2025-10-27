# Use a stable Python image
FROM python:3.10-slim-buster

# Prevent interactive prompts
ENV DEBIAN_FRONTEND=noninteractive

# Update and install dependencies
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    gcc libffi-dev ffmpeg aria2 python3-pip && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

# Set working directory
WORKDIR /app

# Copy all files to container
COPY . /app

# Install Python requirements (if file exists)
RUN pip install --no-cache-dir -r requirements.txt || true

# Start your app
CMD ["python3", "main.py"]
