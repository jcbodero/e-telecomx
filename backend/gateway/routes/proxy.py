from flask import Blueprint, request, Response, jsonify
from flask_cors import cross_origin
import requests
from config import MICROSERVICES

proxy_bp = Blueprint('proxy', __name__)

# (1) Ruta para listar servicios
@proxy_bp.route('/api', methods=['GET'])
def list_services():
    return jsonify({"servicios_disponibles": list(MICROSERVICES.keys())})

# (2) Ruta para `/api/<servicio>` sin path adicional
@cross_origin()
@proxy_bp.route('/api/<service>', methods=['GET', 'POST', 'PUT', 'DELETE', 'PATCH'])
@proxy_bp.route('/api/<service>/', methods=['GET', 'POST', 'PUT', 'DELETE', 'PATCH'])  # para slash final
def proxy_service_root(service):
    return proxy(service, '')  # path vacío

# (3) Ruta para `/api/<servicio>/<path:path>`
@proxy_bp.route('/api/<service>/<path:path>', methods=['GET', 'POST', 'PUT', 'DELETE', 'PATCH'])
def proxy(service, path):
    if service not in MICROSERVICES:
        return Response(f'Servicio desconocido: {service}', status=404)

    url_base = MICROSERVICES[service]
    full_url = f'{url_base}/{path}' if path else url_base

    headers = {k: v for k, v in request.headers if k.lower() != 'host'}

    try:
        resp = requests.request(
            method=request.method,
            url=full_url,
            headers=headers,
            params=request.args,
            data=request.get_data(),
            cookies=request.cookies,
            timeout=5,
        )
    except requests.exceptions.RequestException as e:
        return Response(f'Error al contactar {service}: {str(e)}', status=502)

    excluded_headers = ['content-encoding', 'content-length', 'transfer-encoding', 'connection']
    headers = [(k, v) for k, v in resp.headers.items() if k.lower() not in excluded_headers]

    return Response(resp.content, status=resp.status_code, headers=headers)
