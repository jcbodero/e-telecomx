
import mysql.connector

conexion = None

def get_db_connection():
    global conexion
    if conexion is None or not conexion.is_connected():
        conexion = mysql.connector.connect(
            host="mysql",
            user="telcox_user",
            password="telcox_pass",
            database="telcox_db"
        )
    return conexion

def cerrar_conexion():
    global conexion
    if conexion and conexion.is_connected():
        conexion.close()
        conexion = None
