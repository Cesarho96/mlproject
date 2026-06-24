FROM python:3.11-slim-bookworm
WORKDIR /app
COPY . /app

# The repositories for 'bookworm' are active, so this will now work perfectly
RUN apt-get update && apt-get install -y \
    awscli \
    ffmpeg \
    libsm6 \
    libxext6 \
    unzip \
    && rm -rf /var/lib/apt/lists/*

RUN pip install --no-cache-dir -r requirements.txt

CMD ["python3", "app.py"]