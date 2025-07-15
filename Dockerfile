FROM python:3.10-slim

# Sistem bağımlılıklarını yükle
RUN apt-get update && apt-get install -y \
    build-essential \
    git \
    curl \
    && rm -rf /var/lib/apt/lists/*

# JupyterLab kur
RUN pip install --no-cache-dir jupyterlab

# Çalışma dizini
WORKDIR /app

# Portu aç
EXPOSE 8888

# Token olmadan JupyterLab'i başlat
CMD ["jupyter", "lab", "--ip=0.0.0.0", "--port=8888", "--no-browser", "--NotebookApp.token=''", "--NotebookApp.password=''"]
