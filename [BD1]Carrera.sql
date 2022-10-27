USE Facultad;
#-------------------------------------------------------------------------
#CREAMOS EL TRIGGER PARA LA INSERCION DE DATOS EN TABLA CARRERA
#-------------------------------------------------------------------------
DELIMITER $$
CREATE TRIGGER bitacora_carrera
AFTER INSERT ON Carrera
FOR EACH ROW
BEGIN
#Sentencias SQL
	INSERT INTO Bitacora(Fecha,Descripcion,tabla) 
    VALUES (SYSDATE(), "Se ha insertado un nuevo registro","Carrera");
END;
$$

#-------------------------------------------------------------------------
#CREAMOS LA FUNCION PARA VALIDAR QUE EXISTA O NO LA CARRERA
#-------------------------------------------------------------------------
DELIMITER $$
CREATE FUNCTION ExisteCarrera(
	cadena VARCHAR(150)
)
RETURNS BOOLEAN
DETERMINISTIC
BEGIN

DECLARE valido BOOLEAN;
-- Sentenicas SQL
SELECT EXISTS (SELECT 1 FROM Carrera WHERE Nombre = cadena) INTO valido;
RETURN (valido);

END$$

#-------------------------------------------------------------------------
#CREAMOS LA FUNCION PARA VALIDAR LA INSERCION DE DATOS EN TABLA CARRERA
#-------------------------------------------------------------------------
DELIMITER $$
CREATE PROCEDURE CrearCarrera(
	IN Nombre_In VARCHAR(150)
)
CrearCarrera:BEGIN 

#Validamos que sean todos letras
IF (NOT ValidarLetras(Nombre_In)) THEN
	SELECT "Nombre no permitido, contiene caracteres no validos, solo se permiten letras y espacios" AS ERROR;
	LEAVE CrearCarrera;
END IF;

#Validamos que no exista el nombre
IF (ExisteCarrera(Nombre_In)) THEN
	SELECT "La carrera ya existe en el sistema de bases de datos" AS ERROR;
	LEAVE CrearCarrera;
END IF;

#ingresamos los datos 
INSERT INTO Carrera(Nombre)
VALUES (Nombre_In);

#mensaje de salida
SELECT CONCAT("La carrera ", Nombre_In, " a sido registrada") AS MENSAJE;

END$$
