from db import get_db_connection

def obtener_todos():
    conn = get_db_connection()
    cursor = conn.cursor(dictionary=True)
    cursor.callproc('sp_obtener_todos_usuarios')

    usuarios = []
    for result_set in cursor.stored_results():
        usuarios = result_set.fetchall()

    conn.close()
    return usuarios

def obtener_por_id(id_usuario):
    conn = get_db_connection()
    cursor = conn.cursor(dictionary=True)
    cursor.callproc('sp_obtener_usuario_por_id', [id_usuario])
    result = None
    for result_set in cursor.stored_results():
        result = result_set.fetchone()
    
    conn.close()
    return result

def obtener_por_email(id_usuario):
    conn = get_db_connection()
    cursor = conn.cursor(dictionary=True)
    cursor.callproc('sp_login_usuario', [id_usuario])
    result = None
    for result_set in cursor.stored_results():
        result = result_set.fetchone()
    
    conn.close()
    return result

def obtener_por_id_paquetes(id_usuario):
    conn = get_db_connection()
    cursor = conn.cursor(dictionary=True)
    cursor.callproc('sp_consultar_consumo_paquetes_usuario', [id_usuario])
    result = None
    for result_set in cursor.stored_results():
        result = result_set.fetchall()
    
    conn.close()
    return result
def obtener_por_id_servicios(id_usuario):
    conn = get_db_connection()
    cursor = conn.cursor(dictionary=True)
    cursor.callproc('sp_consultar_servicios_usuario', [id_usuario])
    result = None
    for result_set in cursor.stored_results():
        result = result_set.fetchone()
    
    conn.close()
    return result

def crear_usuario(data):
    conn = get_db_connection()
    cursor = conn.cursor()
    
    # Preparar variable para el OUT
    nuevo_id = 0
    
    # Llamar al SP
    args = [
        data['nombre'],
        data['apellido'],
        data['email'],
        data['contrasena_hash'],
        data['estado_cuenta'],
        nuevo_id
    ]
    
    result_args = cursor.callproc('sp_crear_usuario', args)
    conn.commit()
    conn.close()
    
    # El valor de nuevo_id queda en result_args[-1]
    return result_args[-1]


def actualizar_usuario(id_usuario, data):
    conn = get_db_connection()
    cursor = conn.cursor()
    cursor.callproc('sp_actualizar_usuario', [
        id_usuario,
        data['nombre'],
        data['apellido'],
        data['email'],
        data['estado_cuenta']
    ])
    conn.commit()
    conn.close()


def eliminar_usuario(id_usuario):
    conn = get_db_connection()
    cursor = conn.cursor()
    cursor.callproc('sp_eliminar_usuario', [id_usuario])
    conn.commit()
    conn.close()
