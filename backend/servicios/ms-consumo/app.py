from flask import Flask
from controllers.consumo_controller import consumo_bp
from flasgger import Swagger, swag_from
from errores import registrar_manejadores_errores

app = Flask(__name__)
# Registrar errores globales
registrar_manejadores_errores(app)
# Registrar Blueprints
app.register_blueprint(consumo_bp, url_prefix='/api/consumos')

swagger_template = {
    "swagger": "2.0",
    "info": {
        "title": "API de consumo",
        "description": "Documentación de la API para gestionar consumo.",
        "version": "1.0.0",
        "termsOfService": "https://tu-sitio.com/terminos",
        "contact": {
            "email": "soporte@tu-sitio.com"
        }
    },
    "basePath": "/api",  # opcional, si tus rutas están bajo /api
}

Swagger(app, template=swagger_template)
if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5003, debug=True)

