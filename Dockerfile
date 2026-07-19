FROM python:3.11-slim

RUN apt-get update && apt-get install -y \
    libgl1 \
    libglib2.0-0 \
    libsm6 \
    libxext6 \
    libxrender-dev \
    libgomp1 \
    && rm -rf /var/lib/apt/lists/*

# 🔥 INSTALLA TUTTE LE DIPENDENZE
RUN pip install --upgrade pip && \
    pip install playwright Pillow imagehash requests && \
    playwright install chromium

WORKDIR /app
COPY bot.py .
COPY hash_phash_db.json .

CMD ["python", "-u", "bot.py"]
