# Proyecto de Consumo de Servicios en Tiempo Real

Este proyecto simula el consumo de servicios por usuarios y lo representa en tiempo real a través de una aplicación Angular. Utiliza **Node.js v22.14**, **Docker Compose** y **MySQL** como base de datos.

---

## 🧰 Requisitos

Antes de comenzar, asegúrate de tener instalados:

- [Node.js v22.14](https://nodejs.org/)
- [Docker](https://www.docker.com/)
- [Docker Compose](https://docs.docker.com/compose/)
- Bash en sistemas Unix o Git Bash en Windows (para ejecutar scripts `.sh`)

---

## 🐬 Tecnologías Usadas

- Node.js `v22.14`
- Angular (standalone components)
- Docker y Docker Compose
- MySQL
- Python (para simulador de consumo opcional)

---

## 🚀 Iniciar el proyecto

### Para usuarios de **Linux** o que usen **Git Bash** en Windows:

```bash
bash iniciar.sh
```

Este script realiza lo siguiente:

- Levanta la base de datos MySQL
- Construye y ejecuta los contenedores definidos en `docker-compose.yml`
- Ejecuta migraciones o carga inicial si es necesario

### Para usuarios de **Windows (CMD)**:

```cmd
docker compose up --build
```

---

## 📝 Archivos importantes

- `docker-compose.yml` — Define servicios como `mysql`, `backend`, `simulador`, etc.
- `iniciar.sh` — Script para iniciar en sistemas Unix-like o Git Bash.
- `README.md` — Este archivo.

---

## 🛑 Detener el proyecto

```bash
docker compose down
```

---

---

## Pruebas unitarias

```bash
cd frontend\telecom-app && ng test
```

---

## 📝 Documentacion de API


- http://127.0.0.1:5001/apidocs/ -- Docuemntacion de Usuarios
- http://127.0.0.1:5002/apidocs/ -- Docuemntacion de Facturas
- http://127.0.0.1:5003/apidocs/ -- Docuemntacion de Consumos

- http://127.0.0.1:8080/api      -- API GATEWAY CONSULTA SERVICIOS DISPONIBLES


---


## 📦 Scripts adicionales

Puedes agregar scripts como:

- `simular_consumo.py` (si usas un simulador Python para generar tráfico de datos)
- Scripts de migración o seed para MySQL

---

## 📬 Contacto

Si tienes dudas o sugerencias, no dudes en abrir un issue o contactar al equipo de desarrollo.

---
