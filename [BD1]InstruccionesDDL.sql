#-------------------------------------------------------------------------
#CREAMOS LA BASE DE DATOS DE LA ORGANIZACION "FACULTAD DE INGENIERIA"
#-------------------------------------------------------------------------
CREATE DATABASE Facultad;

#CREACION DEL MODELO RELACIONAL
#CREACION DE TABLAS

#-------------------------------------------------------------------------
#USAMOS LA BASE DE DATOS
#-------------------------------------------------------------------------
USE Facultad;

#-------------------------------------------------------------------------
#CREAMOS LA TABLA DE Carrera
#-------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS Carrera (
	Id_Carrera INT AUTO_INCREMENT NOT NULL,
    Nombre VARCHAR (150) NOT NULL,
    PRIMARY KEY (Id_Carrera)
)ENGINE=INNODB;

#-------------------------------------------------------------------------
#CREAMOS LA TABLA DE Estudiante
#-------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS Estudiante (
	Carnet BIGINT NOT NULL,
    Nombres VARCHAR(100) NOT NULL,
    Apellidos VARCHAR(100) NOT NULL,
    Fecha_Nacimiento DATE NOT NULL,
    Correo VARCHAR(100) NOT NULL,
    Telefono INT NOT NULL,
    Direccion VARCHAR(150) NOT NULL,
    DPI BIGINT NOT NULL,
    Fecha_Ingreso DATE NOT NULL,
    Creditos INT NOT NULL,
    Id_Carrera INT NOT NULL,
    PRIMARY KEY (Carnet),
    FOREIGN KEY (Id_Carrera) REFERENCES Carrera(Id_Carrera)
    ON DELETE CASCADE ON UPDATE CASCADE
)ENGINE=INNODB;

#-------------------------------------------------------------------------
#CREAMOS LA TABLA DE Docente
#-------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS Docente (
	SIIF BIGINT NOT NULL,
    Nombres VARCHAR(100) NOT NULL,
    Apellidos VARCHAR(100) NOT NULL,
    Fecha_Nacimiento DATE NOT NULL,
    Correo VARCHAR(100) NOT NULL,
    Telefono INT NOT NULL,
    Direccion VARCHAR(150) NOT NULL,
    DPI BIGINT NOT NULL,
    Fecha_Ingreso DATE NOT NULL,
    PRIMARY KEY (SIIF)
)ENGINE=INNODB;

#-------------------------------------------------------------------------
#CREAMOS LA TABLA DE Curso
#-------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS Curso (
	Id_Curso BIGINT NOT NULL,
    Nombre VARCHAR(150) NOT NULL,
	Creditos_Necesarios INT NOT NULL,
    Creditos_Otorga INT NOT NULL,
    Opcionalidad BOOLEAN NOT NULL,
    Id_Carrera INT NOT NULL,
    PRIMARY KEY (Id_Curso),     
    FOREIGN KEY (Id_Carrera) REFERENCES Carrera(Id_Carrera)
    ON DELETE CASCADE ON UPDATE CASCADE
)ENGINE=INNODB;

#-------------------------------------------------------------------------
#CREAMOS LA TABLA DE Curso_Habilitado
#-------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS Curso_Habilitado (
	Id_Curso_Habilitado BIGINT AUTO_INCREMENT,
    Ciclo VARCHAR(2) NOT NULL,
	Cupo_Maximo INT NOT NULL,
    Seccion VARCHAR(1) NOT NULL,
    Annio DATE NOT NULL,
    Asignados INT NOT NULL,
    Id_Curso BIGINT NOT NULL,
    SIIF BIGINT  NOT NULL,
    PRIMARY KEY (Id_Curso_Habilitado),     
    FOREIGN KEY (Id_Curso) REFERENCES Curso(Id_Curso)
    ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (SIIF) REFERENCES Docente(SIIF)
    ON DELETE CASCADE ON UPDATE CASCADE
)ENGINE=INNODB;


#-------------------------------------------------------------------------
#CREAMOS LA TABLA DE Curso_Horario
#-------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS Curso_Horario (
	Id_Curso_Habilitado BIGINT NOT NULL,
    Horario VARCHAR(50) NOT NULL,
	Dia INT NOT NULL,
    PRIMARY KEY (Horario,Dia,Id_Curso_Habilitado), 
    FOREIGN KEY (Id_Curso_Habilitado) REFERENCES Curso_Habilitado(Id_Curso_Habilitado)
    ON DELETE CASCADE ON UPDATE CASCADE
)ENGINE=INNODB;

#-------------------------------------------------------------------------
#CREAMOS LA TABLA DE Acta
#-------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS Acta (
	Id_Acta BIGINT AUTO_INCREMENT,
    Fecha DATE NOT NULL,
	Id_Curso_Habilitado BIGINT NOT NULL,
    PRIMARY KEY (Id_Acta), 
    FOREIGN KEY (Id_Curso_Habilitado) REFERENCES Curso_Habilitado(Id_Curso_Habilitado)
    ON DELETE CASCADE ON UPDATE CASCADE
)ENGINE=INNODB;

#-------------------------------------------------------------------------
#CREAMOS LA TABLA DE Asignacion_Desasignacion
#-------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS Asignacion_Desasignacion (
	Id_Curso_Habilitado BIGINT NOT NULL,
    Carnet BIGINT NOT NULL,
    Estado BOOLEAN NOT NULL,
    PRIMARY KEY (Id_Curso_Habilitado,Carnet), 
    FOREIGN KEY (Id_Curso_Habilitado) REFERENCES Curso_Habilitado(Id_Curso_Habilitado)
    ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (Carnet) REFERENCES Estudiante(Carnet)
    ON DELETE CASCADE ON UPDATE CASCADE
)ENGINE=INNODB;

#-------------------------------------------------------------------------
#CREAMOS LA TABLA DE Nota
#-------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS Nota (
	Id_Nota BIGINT NOT NULL,	
    Nota INT NOT NULL,
    Id_Curso_Habilitado BIGINT NOT NULL,
    Carnet BIGINT NOT NULL,
    PRIMARY KEY (Id_Curso_Habilitado,Carnet,Id_Nota), 
    FOREIGN KEY (Id_Curso_Habilitado) REFERENCES Asignacion_Desasignacion(Id_Curso_Habilitado)
    ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (Carnet) REFERENCES Asignacion_Desasignacion(Carnet)
    ON DELETE CASCADE ON UPDATE CASCADE
)ENGINE=INNODB;


#-------------------------------------------------------------------------
#CREAMOS LA TABLA DE Bitacora
#-------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS Bitacora (
	Id_Bitacora BIGINT AUTO_INCREMENT NOT NULL,	
    Fecha DATETIME NOT NULL,
    Descripcion VARCHAR(200) NOT NULL,
    Tabla VARCHAR(50) NOT NULL,
    PRIMARY KEY (Id_Bitacora) 
)ENGINE=INNODB;

