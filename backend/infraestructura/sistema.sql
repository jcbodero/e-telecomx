USE telcox_db;

-- Tabla: Usuarios
CREATE TABLE Usuarios (
    id_usuario INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100),
    apellido VARCHAR(100),
    email VARCHAR(150) UNIQUE,
    contraseña_hash VARCHAR(255),
    estado_cuenta VARCHAR(50),
    fecha_registro DATETIME DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB;

-- Tabla: Servicios
CREATE TABLE Servicios (
    id_servicio INT AUTO_INCREMENT PRIMARY KEY,
    nombre_servicio VARCHAR(100),
    tipo_servicio VARCHAR(50),
    estado_servicio VARCHAR(50)
) ENGINE=InnoDB;

-- Tabla: Servicios_Contratados
CREATE TABLE Servicios_Contratados (
    id_contrato INT AUTO_INCREMENT PRIMARY KEY,
    id_usuario INT,
    id_servicio INT,
    fecha_inicio DATETIME,
    fecha_fin DATETIME,
    estado_contrato VARCHAR(50),
    FOREIGN KEY (id_usuario) REFERENCES Usuarios(id_usuario),
    FOREIGN KEY (id_servicio) REFERENCES Servicios(id_servicio)
) ENGINE=InnoDB;

-- Tabla: Facturas
CREATE TABLE Facturas (
    id_factura INT AUTO_INCREMENT PRIMARY KEY,
    id_usuario INT,
    fecha_emision DATETIME,
    fecha_vencimiento DATETIME,
    total DECIMAL(10,2),
    estado_pago VARCHAR(50),
    FOREIGN KEY (id_usuario) REFERENCES Usuarios(id_usuario)
) ENGINE=InnoDB;

-- Tabla: Factura_Detalle
CREATE TABLE Factura_Detalle (
    id_detalle INT AUTO_INCREMENT PRIMARY KEY,
    id_factura INT,
    descripcion VARCHAR(255),
    monto DECIMAL(10,2),
    tipo VARCHAR(50),
    FOREIGN KEY (id_factura) REFERENCES Facturas(id_factura)
) ENGINE=InnoDB;

-- Tabla: Soporte_Tickets
CREATE TABLE Soporte_Tickets (
    id_ticket INT AUTO_INCREMENT PRIMARY KEY,
    id_usuario INT,
    asunto VARCHAR(150),
    descripcion TEXT,
    fecha_creacion DATETIME DEFAULT CURRENT_TIMESTAMP,
    estado_ticket VARCHAR(50),
    prioridad VARCHAR(50),
    FOREIGN KEY (id_usuario) REFERENCES Usuarios(id_usuario)
) ENGINE=InnoDB;

-- Tabla: Consumo_Datos
CREATE TABLE Consumo_Datos (
    id_consumo INT AUTO_INCREMENT PRIMARY KEY,
    id_usuario INT,
    id_servicio INT,
    id_paquete INT,
    fecha DATETIME,
    consumo_mb DECIMAL(10,2),
    limite_mb DECIMAL(10,2),
    FOREIGN KEY (id_usuario) REFERENCES Usuarios(id_usuario),
    FOREIGN KEY (id_servicio) REFERENCES Servicios(id_servicio),
    FOREIGN KEY (id_paquete, id_servicio) REFERENCES Paquete_Servicio(id_paquete, id_servicio)
) ENGINE=InnoDB;
-- Tabla: Paquetes
CREATE TABLE Paquetes (
    id_paquete INT AUTO_INCREMENT PRIMARY KEY,
    nombre_paquete VARCHAR(100),
    descripcion VARCHAR(255),
    precio DECIMAL(10,2),
    estado_paquete VARCHAR(50)
) ENGINE=InnoDB;

-- Tabla: Paquete_Servicio (relación N:M)
CREATE TABLE Paquete_Servicio (
    id_paquete INT,
    id_servicio INT,
    PRIMARY KEY (id_paquete, id_servicio),
    FOREIGN KEY (id_paquete) REFERENCES Paquetes(id_paquete),
    FOREIGN KEY (id_servicio) REFERENCES Servicios(id_servicio)
) ENGINE=InnoDB;

-- Tabla: CRM_Integracion
CREATE TABLE CRM_Integracion (
    id_usuario INT PRIMARY KEY,
    id_cliente_crm VARCHAR(100),
    estado_sync VARCHAR(50),
    fecha_ultima_sync DATETIME,
    FOREIGN KEY (id_usuario) REFERENCES Usuarios(id_usuario)
) ENGINE=InnoDB;

-- Tabla: BSS_Integracion
CREATE TABLE BSS_Integracion (
    id_servicio INT PRIMARY KEY,
    id_servicio_bss VARCHAR(100),
    estado_sync VARCHAR(50),
    fecha_ultima_sync DATETIME,
    FOREIGN KEY (id_servicio) REFERENCES Servicios(id_servicio)
) ENGINE=InnoDB;
