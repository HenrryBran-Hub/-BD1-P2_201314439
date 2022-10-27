USE Facultad;
#-------------------------------------------------------------------------
#CREAMOS EL TRIGGER PARA LA INSERCION DE DATOS EN TABLA DOCENTE
#-------------------------------------------------------------------------
DELIMITER $$
CREATE TRIGGER bitacora_docente_insertar
AFTER INSERT ON Docente
FOR EACH ROW
BEGIN
#Sentencias SQL
	INSERT INTO Bitacora(Fecha,Descripcion,tabla) 
    VALUES (SYSDATE(), "Se ha insertado un nuevo registro","Docente");
END;
$$

#-------------------------------------------------------------------------
#CREAMOS LA FUNCION PARA VALIDAR QUE EXISTA O NO EL DOCENTE
#-------------------------------------------------------------------------
DELIMITER $$
CREATE FUNCTION ExisteDocente(
	cadena VARCHAR(150)
)
RETURNS BOOLEAN
DETERMINISTIC
BEGIN

DECLARE valido BOOLEAN;
-- Sentenicas SQL
SELECT EXISTS (SELECT 1 FROM Docente WHERE SIIF = cadena) INTO valido;
RETURN (valido);

END$$

#-------------------------------------------------------------------------
#CREAMOS LA FUNCION PARA VALIDAR LA INSERCION DE DATOS EN TABLA DOCENTE
#-------------------------------------------------------------------------
DELIMITER $$
CREATE PROCEDURE RegistrarDocente(	
    IN Nombres_In VARCHAR(100),
    IN Apellidos_In VARCHAR(100),
    IN Fecha_Nacimiento_In DATE,
    IN Correo_In VARCHAR(100),
    IN Telefono_In INT,
    IN Direccion_In VARCHAR(150),
    IN DPI_In BIGINT,
    IN SIIF_In BIGINT
)
RegistrarDocente:BEGIN 

#Validamos que no exista el siif
IF (ExisteDocente(SIIF_In)) THEN
	SELECT "El SIIF ingresado ya existe en el sistema de bases de datos" AS ERROR;
	LEAVE RegistrarDocente;
END IF;

#Validamos que sea un correo valido
IF (NOT ValidarCorreo(Correo_In)) THEN
	SELECT "Correo no es permitido, solo se permiten un tipo de entra XXX@XXX.XXX" AS ERROR;
	LEAVE RegistrarDocente;
END IF;

#Validamos que sean todos numeros
IF (NOT ValidarNumerosEnteros(Telefono_In)) THEN
	SELECT "Telefono no es permitido, solo se permiten numeros enteros positivos sin codigo de area" AS ERROR;
	LEAVE RegistrarDocente;
END IF;

#ingresamos los datos 
INSERT INTO Docente(SIIF,Nombres,Apellidos,Fecha_Nacimiento,Correo,Telefono,Direccion,DPI,Fecha_Ingreso)
VALUES (SIIF_In,Nombres_In,Apellidos_In,Fecha_Nacimiento_In,Correo_In,Telefono_In,Direccion_In,DPI_In,CURDATE());

#mensaje de salida
SELECT CONCAT("El Docente ", Nombres_In, " ", Apellidos_In, " a sido registrad@ en el sistema de bases de datos") AS MENSAJE;

END$$
