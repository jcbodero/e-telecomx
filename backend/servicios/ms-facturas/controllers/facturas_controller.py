from flask import Blueprint, request, jsonify
from services.facturas_service import (
    obtener_todos, obtener_por_id, crear_factura,
    actualizar_factura, eliminar_factura,obtener_facturas_usuario,obtener_detalle_por_id
)
from flasgger import Swagger, swag_from
facturas_bp = Blueprint('facturas', __name__)

@facturas_bp.route('/', methods=['GET'])
@swag_from('docs/get_all_factura.yml')
def listar_facturas():
    return jsonify(obtener_todos())

@facturas_bp.route('/<int:id_factura>', methods=['GET'])
@swag_from('docs/get_factura.yml')
def obtener_factura(id_factura):
    factura = obtener_por_id(id_factura)
    if factura:
        return jsonify(factura)
    return jsonify({'error': 'factura no encontrado'}), 404

@facturas_bp.route('/usuario/<int:id_usuario>', methods=['GET'])
@swag_from('docs/get_factura.yml')
def obtener_factura_usuario(id_usuario):
    factura = obtener_facturas_usuario(id_usuario)
    if factura:
        return jsonify(factura)
    return jsonify({'error': 'factura no encontrado'}), 404

@facturas_bp.route('/detalle/<int:id_factura>', methods=['GET'])
@swag_from('docs/get_factura.yml')
def obtener_factura_detalle(id_factura):
    factura = obtener_detalle_por_id(id_factura)
    if factura:
        return jsonify(factura)
    return jsonify({'error': 'factura no encontrado'}), 404

@facturas_bp.route('/', methods=['POST'])
@swag_from('docs/create_factura.yml')
def crear():
    data = request.json
    nuevo_id = crear_factura(data)
    return jsonify({'id_factura': nuevo_id}), 201

@facturas_bp.route('/<int:id_factura>', methods=['PUT'])
@swag_from('docs/update_factura.yml')
def actualizar(id_factura):
    data = request.json
    actualizar_factura(id_factura, data)
    return jsonify({'mensaje': 'factura actualizado'})

@facturas_bp.route('/<int:id_factura>', methods=['DELETE'])
@swag_from('docs/delete_factura.yml')
def eliminar(id_factura):
    eliminar_factura(id_factura)
    return jsonify({'mensaje': 'factura eliminado'})
