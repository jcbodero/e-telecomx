from flask import Blueprint, request, jsonify
from services.usuarios_service import (
    obtener_todos, obtener_por_id, crear_usuario,
    actualizar_usuario, eliminar_usuario,obtener_por_id_paquetes,obtener_por_id_servicios,obtener_por_email
)
from flasgger import Swagger, swag_from
usuarios_bp = Blueprint('usuarios', __name__)

@usuarios_bp.route('/', methods=['GET'])
@swag_from('docs/get_all_users.yml')
def listar_usuarios():
    return jsonify(obtener_todos())

@usuarios_bp.route('/<int:id_usuario>', methods=['GET'])
@swag_from('docs/get_user.yml')
def obtener_usuario(id_usuario):
    usuario = obtener_por_id(id_usuario)
    if usuario:
        return jsonify(usuario)
    return jsonify({'error': 'Usuario no encontrado'}), 404

from flask import request, jsonify

@usuarios_bp.route('/login', methods=['POST'])
@swag_from('docs/login.yml')
def buscar_usuario_por_email():
    data = request.json
    email = data.get('email')
    if not email:
        return jsonify({'error': 'El campo email es requerido'}), 400

    usuario = obtener_por_email(email)  
    if usuario:
        return jsonify(usuario)
    return jsonify({'error': 'Usuario no encontrado'}), 404


@usuarios_bp.route('/paquetes/<int:id_usuario>', methods=['GET'])
@swag_from('docs/get_user.yml')
def obtener_usuario_paquetes(id_usuario):
    usuario = obtener_por_id_paquetes(id_usuario)
    if usuario:
        return jsonify(usuario)
    return jsonify({'error': 'Usuario no encontrado'}), 404
@usuarios_bp.route('/servicios/<int:id_usuario>', methods=['GET'])
@swag_from('docs/get_user.yml')
def obtener_usuario_servicios(id_usuario):
    usuario = obtener_por_id_servicios(id_usuario)
    if usuario:
        return jsonify(usuario)
    return jsonify({'error': 'Usuario no encontrado'}), 404

@usuarios_bp.route('/', methods=['POST'])
@swag_from('docs/create_users.yml')
def crear():
    data = request.json
    nuevo_id = crear_usuario(data)
    return jsonify({'id_usuario': nuevo_id}), 201

@usuarios_bp.route('/<int:id_usuario>', methods=['PUT'])
@swag_from('docs/update_user.yml')
def actualizar(id_usuario):
    data = request.json
    actualizar_usuario(id_usuario, data)
    return jsonify({'mensaje': 'Usuario actualizado'})

@usuarios_bp.route('/<int:id_usuario>', methods=['DELETE'])
@swag_from('docs/delete_user.yml')
def eliminar(id_usuario):
    eliminar_usuario(id_usuario)
    return jsonify({'mensaje': 'Usuario eliminado'})
