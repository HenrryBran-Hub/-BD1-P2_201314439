USE Facultad;
#-------------------------------------------------------------------------
#CREAMOS EL TRIGGER PARA LA INSERCION DE DATOS EN TABLA CARRERA
#-------------------------------------------------------------------------
DELIMITER $$
CREATE TRIGGER bitacora_estudiante
AFTER INSERT ON Estudiante
FOR EACH ROW
BEGIN
#Sentencias SQL
	INSERT INTO Bitacora(Fecha,Descripcion,tabla) 
    VALUES (SYSDATE(), "Se ha insertado un nuevo registro","Estudiante");
END;
$$

#-------------------------------------------------------------------------
#CREAMOS LA FUNCION PARA VALIDAR QUE EXISTA O NO EL ESTUDIANTE
#-------------------------------------------------------------------------
DELIMITER $$
CREATE FUNCTION ExisteEstudiante(
	cadena VARCHAR(150)
)
RETURNS BOOLEAN
DETERMINISTIC
BEGIN

DECLARE valido BOOLEAN;
-- Sentenicas SQL
SELECT EXISTS (SELECT 1 FROM Estudiante WHERE Carnet = cadena) INTO valido;
RETURN (valido);

END$$

#-------------------------------------------------------------------------
#CREAMOS LA FUNCION PARA VALIDAR QUE EXISTA LA CARRERA
#-------------------------------------------------------------------------
DELIMITER $$
CREATE FUNCTION ExisteCarreraId(
	cadena VARCHAR(150)
)
RETURNS BOOLEAN
DETERMINISTIC
BEGIN

DECLARE valido BOOLEAN;
-- Sentenicas SQL
SELECT EXISTS (SELECT 1 FROM Carrera WHERE Id_Carrera = cadena) INTO valido;
RETURN (valido);

END$$

#-------------------------------------------------------------------------
#CREAMOS LA FUNCION PARA VALIDAR LA INSERCION DE DATOS EN TABLA ESTUDIANTE
#-------------------------------------------------------------------------
DELIMITER $$
CREATE PROCEDURE RegistrarEstudiante(
	IN Carnet_In BIGINT,
    IN Nombres_In VARCHAR(100),
    IN Apellidos_In VARCHAR(100),
    IN Fecha_Nacimiento_In DATE,
    IN Correo_In VARCHAR(100),
    IN Telefono_In NUMERIC(8,0),
    IN Direccion_In VARCHAR(150),
    IN DPI_In BIGINT,
    IN Id_Carrera_In INT
)
RegistrarEstudiante:BEGIN 

#Validamos que no exista el carnet
IF (ExisteEstudiante(Carnet_In)) THEN
	SELECT "El carnet ingresado ya existe en el sistema de bases de datos" AS ERROR;
	LEAVE RegistrarEstudiante;
END IF;

#Validamos que sea un correo valido
IF (NOT ValidarCorreo(Correo_In)) THEN
	SELECT "Correo no es permitido, solo se permiten un tipo de entra XXX@XXX.XXX" AS ERROR;
	LEAVE RegistrarEstudiante;
END IF;

#Validamos que sean todos numeros
IF (NOT ValidarNumerosEnteros(Telefono_In)) THEN
	SELECT "Telefono no es permitido, solo se permiten numeros enteros positivos sin codigo de area" AS ERROR;
	LEAVE RegistrarEstudiante;
END IF;

#Validamos que exista la carrera
IF (NOT ExisteCarreraId(Id_Carrera_In)) THEN
	SELECT "La carrera ingresada no existe en el sistema de bases de datos" AS ERROR;
	LEAVE RegistrarEstudiante;
END IF;

#ingresamos los datos 
INSERT INTO Estudiante(Carnet,Nombres,Apellidos,Fecha_Nacimiento,Correo,Telefono,Direccion,DPI,Fecha_Ingreso,Creditos,Id_Carrera)
VALUES (Carnet_In,Nombres_In,Apellidos_In,Fecha_Nacimiento_In,Correo_In,Telefono_In,Direccion_In,DPI_In,CURDATE(),0,Id_Carrera_In);

#mensaje de salida
SELECT CONCAT("El estudiante ", Nombres_In, " ", Apellidos_In, " a sido registrad@ en el sistema de bases de datos") AS MENSAJE;

END$$
