FROM python:3.10-slim

# Gerekli paketleri yükle
RUN apt-get update && apt-get install -y git && \
    pip install --no-cache-dir jupyterlab

# Çalışma dizini
WORKDIR /workspace

# Varsayılan port
EXPOSE 8888

# JupyterLab'i token ve password olmadan başlat, --allow-root ile
CMD ["jupyter", "lab", "--ip=0.0.0.0", "--port=8888", "--no-browser", "--NotebookApp.token=''", "--NotebookApp.password=''", "--allow-root"]
