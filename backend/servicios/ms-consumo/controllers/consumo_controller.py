from flask import Blueprint, request, jsonify
from services.consumo_service import (
   obtener_consumos_por_usuario_y_mes,crear_consumo
)
from flasgger import Swagger, swag_from
consumo_bp = Blueprint('consumo_bp', __name__)




@consumo_bp.route('/por_usuario', methods=['GET'])
@swag_from('docs/get_consumo_mes.yml')
def get_consumos():
    id_usuario = request.args.get('id_usuario', type=int)
    anio = request.args.get('anio', type=int)
    mes = request.args.get('mes', type=int)

    if not id_usuario or not anio or not mes:
        return jsonify({"error": "id_usuario, anio y mes son requeridos"}), 400

    datos = obtener_consumos_por_usuario_y_mes(id_usuario, anio, mes)
    return jsonify(datos), 200

@consumo_bp.route('/crear', methods=['POST'])
@swag_from('docs/post_consumo.yml')
def post_consumo():
    data = request.json
    crear_consumo(data)
    return jsonify({"mensaje": "Consumo registrado exitosamente"}), 201