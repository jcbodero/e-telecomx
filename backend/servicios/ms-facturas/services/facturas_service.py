from db import get_db_connection

def obtener_todos():
    conn = get_db_connection()
    cursor = conn.cursor(dictionary=True)
    cursor.callproc('sp_facturas_todas')

    facturas = []
    for result_set in cursor.stored_results():
        facturas = result_set.fetchall()

    conn.close()
    return facturas

def obtener_facturas_usuario(id_usuario):
    conn = get_db_connection()
    cursor = conn.cursor(dictionary=True)
    cursor.callproc('sp_obtener_cabeceras_factura_usuario',[id_usuario])

    facturas = []
    for result_set in cursor.stored_results():
        facturas = result_set.fetchall()

    conn.close()
    return facturas

def obtener_detalle_por_id(id_factura):
    conn = get_db_connection()
    cursor = conn.cursor(dictionary=True)
    cursor.callproc('sp_obtener_detalle_factura', [id_factura])
    result = None
    for result_set in cursor.stored_results():
        result = result_set.fetchall()
    
    conn.close()
    return result

def obtener_por_id(id_factura):
    conn = get_db_connection()
    cursor = conn.cursor(dictionary=True)
    cursor.callproc('sp_obtener_factura_id', [id_factura])
    result = None
    for result_set in cursor.stored_results():
        result = result_set.fetchone()
    
    conn.close()
    return result


def crear_factura(data):
    conn = get_db_connection()
    cursor = conn.cursor()
    
    # Preparar variables, OUT debe ir con valor inicial (usualmente 0)
    args = [
        data['id_usuario'],
        data['fecha_emision'],
        data['fecha_vencimiento'],
        data['total'],
        data['estado_pago'],
        0  # Placeholder para OUT p_nuevo_id
    ]
    
    # Ejecutar procedimiento almacenado
    result_args = cursor.callproc('sp_crear_factura', args)
    conn.commit()
    
    # Cerrar cursores y conexión
    cursor.close()
    conn.close()
    
    # El id generado queda en la última posición del arreglo result_args
    nuevo_id_factura = result_args[-1]
    return nuevo_id_factura


def actualizar_factura(data):
    conn = get_db_connection()
    cursor = conn.cursor()
    
    args = [
        data['id_factura'],
        data['id_usuario'],
        data['fecha_emision'],
        data['fecha_vencimiento'],
        data['total'],
        data['estado_pago'],
        0  # Placeholder para OUT p_filas_afectadas
    ]
    
    result_args = cursor.callproc('sp_actualizar_factura', args)
    conn.commit()
    
    cursor.close()
    conn.close()
    
    filas_afectadas = result_args[-1]
    return filas_afectadas


def eliminar_factura(id_factura):
    conn = get_db_connection()
    cursor = conn.cursor()
    cursor.callproc('sp_eliminar_factura', [id_factura])
    conn.commit()
    conn.close()
