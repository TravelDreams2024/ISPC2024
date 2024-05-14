create database DreamTravel;
use DreamTravel;


CREATE TABLE IF NOT exists AEROLINEA(
	id_aerolinea INT NOT NULL PRIMARY KEY auto_increment,
    nombreAerolinea VARCHAR(100)
);

CREATE TABLE IF NOT exists CATEGORIAS(
	id_categoria INT NOT NULL PRIMARY KEY auto_increment,
    nombreCategoria VARCHAR(100)
);

CREATE TABLE IF NOT exists LOCALIDAD(
	id_localidad INT NOT NULL PRIMARY KEY auto_increment,
    nombreLocalidad VARCHAR(100)
);

CREATE TABLE IF NOT exists METODO_PAGO(
	id_metodoPago INT NOT NULL PRIMARY KEY auto_increment,
    nombrePago VARCHAR(100)
);

CREATE TABLE IF NOT exists OBRA_SOCIAL(
	id_obraSocial INT NOT NULL PRIMARY KEY auto_increment,
    nombreObraSocial VARCHAR(100)
);

CREATE TABLE IF NOT exists DESTINOS(
	id_destino INT NOT NULL PRIMARY KEY auto_increment,
    nombreDestino VARCHAR(100) NOT NULL,
    precioDestino INT NOT NULL,
    fecha_salida datetime,
    cantidadDisponible INT NOT NULL,
    id_aerolinea INT NOT NULL,
    id_metodoPago INT NOT NULL,
    id_categoria INT NOT NULL,
    FOREIGN KEY (id_aerolinea) REFERENCES AEROLINEA (id_aerolinea),
    FOREIGN KEY (id_metodoPago) REFERENCES METODO_PAGO (id_metodoPago),
    FOREIGN KEY (id_categoria) REFERENCES CATEGORIAS (id_categoria)
    
);

CREATE TABLE IF NOT exists USUARIO (
	id_usuario INT NOT NULL PRIMARY KEY auto_increment,
    nombre_usuario VARCHAR (100) NOT NULL,
    apellido_usuario VARCHAR (100) NOT NULL,
	passw VARCHAR (100) NOT NULL,
    direccion VARCHAR (300) NOT NULL,
    dni INT NOT NULL,
    telefono VARCHAR (100) NOT NULL,
    mail VARCHAR (100) NOT NULL,
    id_localidad INT NOT NULL,
    id_metodoPago INT NOT NULL,
    id_obraSocial INT NOT NULL,
    FOREIGN KEY (id_localidad) REFERENCES LOCALIDAD (id_localidad),
    FOREIGN KEY (id_metodoPago) REFERENCES METODO_PAGO (id_metodoPago),
    FOREIGN KEY (id_obraSocial) REFERENCES OBRA_SOCIAL (id_obraSocial)
    
    
);