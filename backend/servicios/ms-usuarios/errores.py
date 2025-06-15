from flask import jsonify
from db import cerrar_conexion

def registrar_manejadores_errores(app):
    @app.errorhandler(404)
    def recurso_no_encontrado(error):
        cerrar_conexion()
        return jsonify({'error': 'Ruta no encontrada'}), 404

    @app.errorhandler(400)
    def solicitud_invalida(error):
        cerrar_conexion()
        return jsonify({'error': 'Solicitud inválida'}), 400

    @app.errorhandler(500)
    def error_interno(error):
        cerrar_conexion()
        return jsonify({'error': 'Error interno del servidor'}), 500

    @app.errorhandler(Exception)
    def manejar_error_generico(error):
        cerrar_conexion()
        return jsonify({'error': str(error)}), 500
