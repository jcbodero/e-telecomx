import requests
import random
import time
from datetime import datetime

API_URL = "http://host.docker.internal:5003/api/consumos/crear"

CANT_USUARIOS = 20
ID_SERVICIO = 20
ID_PAQUETE = 60
LIMITE_MB = 1024

def generar_fecha_actual():
    return datetime.now().strftime('%Y-%m-%dT%H:%M:%S')

def generar_consumo(id_usuario):
    for id_servicio in range(1, ID_SERVICIO + 1):  # del 1 al ID_SERVICIO inclusive
        for id_paquete in range(41, ID_PAQUETE + 1): 
            try:
                consumo = {
                    "id_usuario": id_usuario,
                    "id_servicio": id_servicio,
                    "id_paquete" : id_paquete,
                    "fecha": generar_fecha_actual(),
                    "consumo_mb": round(random.uniform(100, 1500), 2),
                    "limite_mb": LIMITE_MB
                }
                response = requests.post(API_URL, json=consumo)
                if response.status_code == 201:
                    print(f"[✓] Usuario {id_usuario}, Servicio {id_servicio} - OK")
                else:
                    print(f"[✗] Usuario {id_usuario}, Servicio {id_servicio} - Error: {response.status_code}")
            finally:
                print("Error Servicio o Usuario")

if __name__ == "__main__":
    while True:
        for id_usuario in range(1, CANT_USUARIOS + 1):
            generar_consumo(id_usuario)
       
      
        time.sleep(1)
