USE Facultad;
#-------------------------------------------------------------------------
#CREAMOS EL TRIGGER PARA LA INSERCION DE DATOS EN TABLA CURSO
#-------------------------------------------------------------------------
DELIMITER $$
CREATE TRIGGER bitacora_curso_insert
AFTER INSERT ON Curso
FOR EACH ROW
BEGIN
#Sentencias SQL
	INSERT INTO Bitacora(Fecha,Descripcion,Tipo) 
    VALUES (SYSDATE(), "Se ha realizado una accion en la tabla Curso","INSERT");
END;
$$

#-------------------------------------------------------------------------
#CREAMOS EL TRIGGER PARA LA ELIMINACION DE DATOS EN TABLA CURSO
#-------------------------------------------------------------------------
DELIMITER $$
CREATE TRIGGER bitacora_curso_insertar
AFTER DELETE ON Curso
FOR EACH ROW
BEGIN
#Sentencias SQL
	INSERT INTO Bitacora(Fecha,Descripcion,Tipo) 
    VALUES (SYSDATE(), "Se ha realizado una accion en la tabla Curso","DELETE");
END;
$$

#-------------------------------------------------------------------------
#CREAMOS EL TRIGGER PARA LA ACTUALIZACION DE DATOS EN TABLA CURSO
#-------------------------------------------------------------------------
DELIMITER $$
CREATE TRIGGER bitacora_curso_update
AFTER UPDATE ON Curso
FOR EACH ROW
BEGIN
#Sentencias SQL
	INSERT INTO Bitacora(Fecha,Descripcion,Tipo) 
    VALUES (SYSDATE(), "Se ha realizado una accion en la tabla Curso","UPDATE");
END;
$$

#-------------------------------------------------------------------------
#CREAMOS LA FUNCION PARA VALIDAR QUE EXISTA O NO EL CURSO
#-------------------------------------------------------------------------
DELIMITER $$
CREATE FUNCTION ExisteCurso(
	cadena VARCHAR(150)
)
RETURNS BOOLEAN
DETERMINISTIC
BEGIN

DECLARE valido BOOLEAN;
-- Sentenicas SQL
SELECT EXISTS (SELECT 1 FROM Curso WHERE Id_Curso = cadena) INTO valido;
RETURN (valido);

END$$

#-------------------------------------------------------------------------
#CREAMOS LA FUNCION PARA VALIDAR LA INSERCION DE DATOS EN TABLA CURSO
#-------------------------------------------------------------------------
DELIMITER $$
CREATE PROCEDURE CrearCurso(
	IN Id_Curso_In BIGINT,
    IN Nombre_In VARCHAR(150),
    IN Creditos_Necesarios_In VARCHAR(10),
    IN Creditos_Otorga_In VARCHAR(10),
    IN Id_Carrera_In INT,
    IN Opcionalidad_In BOOLEAN    
    
)
CrearCurso:BEGIN 

#Validamos que no exista el id curso
IF (ExisteCurso(Id_Curso_In)) THEN
	SELECT "El Id del curso ingresado ya existe en el sistema de bases de datos" AS ERROR;
	LEAVE CrearCurso;
END IF;

#Validamos que sean todos numeros creditos necesarios
IF (NOT ValidarNumerosEnteros(Creditos_Necesarios_In)) THEN
	SELECT "Creditos Necesarios no es permitido, solo se permiten numeros enteros positivos " AS ERROR;
	LEAVE CrearCurso;
END IF;

#Validamos que sean todos numeros creditos que otorga
IF (NOT ValidarNumerosEnteros(Creditos_Otorga_In)) THEN
	SELECT "Creditos que otorga no es permitido, solo se permiten numeros enteros positivos" AS ERROR;
	LEAVE CrearCurso;
END IF;

#Validamos que exista la carrera
IF (NOT ExisteCarreraId(Id_Carrera_In)) THEN
	SELECT "La carrera ingresada no existe en el sistema de bases de datos" AS ERROR;
	LEAVE CrearCurso;
END IF;

#Validamos que sea un valor booleano
IF (NOT ValidarBooleano(Opcionalidad_In)) THEN
	SELECT "La opcionalida ingresada, no concuerda con el modelo validar 0 o 1" AS ERROR;
	LEAVE CrearCurso;
END IF;

#ingresamos los datos 
INSERT INTO Curso(Id_Curso,Nombre,Creditos_Necesarios,Creditos_Otorga,Opcionalidad,Id_Carrera)
VALUES (Id_Curso_In,Nombre_In,Creditos_Necesarios_In,Creditos_Otorga_In,Opcionalidad_In,Id_Carrera_In);

#mensaje de salida
SELECT CONCAT("El curso ", Id_Curso_In, " llamado ", Nombre_In, " a sido registrad@ en el sistema de bases de datos") AS MENSAJE;

END$$
