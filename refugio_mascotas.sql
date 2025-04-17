
-- Crear base de datos
CREATE DATABASE IF NOT EXISTS AdopcionMascotas;
USE AdopcionMascotas;

-- Tabla Refugio
CREATE TABLE Refugio (
    id_refugio INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100),
    direccion VARCHAR(150),
    telefono VARCHAR(20),
    email VARCHAR(100)
);

-- Tabla Mascota
CREATE TABLE Mascota (
    id_mascota INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50),
    especie VARCHAR(30),
    raza VARCHAR(50),
    edad_aproximada INT,
    sexo ENUM('Macho', 'Hembra'),
    fecha_ingreso DATE,
    estado_adopcion ENUM('Disponible', 'Adoptado', 'En seguimiento'),
    id_refugio INT,
    FOREIGN KEY (id_refugio) REFERENCES Refugio(id_refugio)
);

-- Tabla Adoptante
CREATE TABLE Adoptante (
    id_adoptante INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100),
    dni VARCHAR(15),
    telefono VARCHAR(20),
    email VARCHAR(100),
    direccion VARCHAR(150)
);

-- Tabla SolicitudAdopcion
CREATE TABLE SolicitudAdopcion (
    id_solicitud INT AUTO_INCREMENT PRIMARY KEY,
    fecha_solicitud DATE,
    estado ENUM('Pendiente', 'Aprobada', 'Rechazada', 'Cancelada'),
    id_adoptante INT,
    id_mascota INT,
    FOREIGN KEY (id_adoptante) REFERENCES Adoptante(id_adoptante),
    FOREIGN KEY (id_mascota) REFERENCES Mascota(id_mascota)
);

-- Tabla Seguimiento
CREATE TABLE Seguimiento (
    id_seguimiento INT AUTO_INCREMENT PRIMARY KEY,
    id_solicitud INT,
    fecha_visita DATE,
    observaciones TEXT,
    estado_mascota VARCHAR(50),
    FOREIGN KEY (id_solicitud) REFERENCES SolicitudAdopcion(id_solicitud)
);

-- Tabla Veterinario
CREATE TABLE Veterinario (
    id_veterinario INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100),
    matricula VARCHAR(30),
    telefono VARCHAR(20),
    email VARCHAR(100)
);

-- Tabla ConsultaVeterinaria
CREATE TABLE ConsultaVeterinaria (
    id_consulta INT AUTO_INCREMENT PRIMARY KEY,
    id_mascota INT,
    id_veterinario INT,
    fecha_consulta DATE,
    motivo TEXT,
    tratamiento TEXT,
    FOREIGN KEY (id_mascota) REFERENCES Mascota(id_mascota),
    FOREIGN KEY (id_veterinario) REFERENCES Veterinario(id_veterinario)
);

-- Tabla Donacion
CREATE TABLE Donacion (
    id_donacion INT AUTO_INCREMENT PRIMARY KEY,
    fecha DATE,
    monto DECIMAL(10,2),
    donante_nombre VARCHAR(100),
    id_refugio INT,
    FOREIGN KEY (id_refugio) REFERENCES Refugio(id_refugio)
);
