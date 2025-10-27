FROM FROM python:3.10-slim
RUN RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    gcc libffi-dev ffmpeg aria2 python3-pip && \
    rm -rf /var/lib/apt/lists/*
COPY . /app/
WORKDIR /app/
RUN pip3 install --no-cache-dir --upgrade --requirement requirements.txt
CMD gunicorn app:app & python3 main.py

