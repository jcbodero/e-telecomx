# app/services/consumo_service.py
from db import get_db_connection

def obtener_consumos_por_usuario_y_mes(id_usuario, anio, mes):
    conn = get_db_connection()
    cursor = conn.cursor(dictionary=True)
    cursor.callproc('sp_get_consumo_datos_usuario_mes', [id_usuario, anio, mes])
    
    resultados = []
    for result in cursor.stored_results():
        resultados = result.fetchall()
    
    cursor.close()
    conn.close()
    return resultados


def crear_consumo(data):
    try:

        conn = get_db_connection()
        cursor = conn.cursor(dictionary=True)
        cursor.callproc('sp_insert_consumo_datos', [
            data['id_usuario'],
            data['id_servicio'],
            data['id_paquete'],
            data['fecha'],
            data['consumo_mb'],
            data['limite_mb']
        ])
    except Exception as e :
        return jsonify({"error": f"Error inesperado: {str(e)}"}), 500
    finally:
        conn.commit()
        cursor.close()
        conn.close()

    return "Exito 1"
