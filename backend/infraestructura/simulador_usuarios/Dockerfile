FROM python:3.10-slim

WORKDIR /app

COPY requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt

COPY simular_consumo.py ./

CMD ["python", "simular_consumo.py"]
