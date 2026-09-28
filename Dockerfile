FROM python:3.12-slim
WORKDIR /build
RUN apt-get update && apt-get install -y --no-install-recommends unzip && rm -rf /var/lib/apt/lists/*
COPY Analizador_Futbol_V3_Mobile.zip /tmp/app.zip
RUN unzip -q /tmp/app.zip -d /build/unpacked && cp -a /build/unpacked/Analizador_Futbol_V3_Mobile/. /app/
WORKDIR /app
RUN pip install --no-cache-dir -r requirements.txt
ENV PORT=10000
CMD ["sh","-c","uvicorn app.main:app --host 0.0.0.0 --port ${PORT:-10000}"]
