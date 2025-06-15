from flask import Flask
from controllers.facturas_controller import facturas_bp
from flasgger import Swagger, swag_from
from errores import registrar_manejadores_errores

app = Flask(__name__)
# Registrar errores globales
registrar_manejadores_errores(app)
# Registrar Blueprints
app.register_blueprint(facturas_bp, url_prefix='/api/facturas')

swagger_template = {
    "swagger": "2.0",
    "info": {
        "title": "API de Facturas",
        "description": "Documentación de la API para gestionar Facturas.",
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
    app.run(host='0.0.0.0', port=5002, debug=True)

