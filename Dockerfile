FROM python:3.11-slim-buster
FROM python:3.11-slim-buster
WORKDIR /app
COPY . /app

# Combine updates and installs into a single layer, and clean up to save space
RUN apt-get update && apt-get install -y \
    awscli \
    ffmpeg \
    libsm6 \
    libxext6 \
    unzip \
    && rm -rf /var/lib/apt/lists/*

RUN pip install --no-cache-dir -r requirements.txt

CMD ["python3", "app.py"]