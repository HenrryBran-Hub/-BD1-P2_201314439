USE Facultad;
#-------------------------------------------------------------------------
#CREAMOS EL TRIGGER PARA LA INSERCION DE DATOS EN TABLA AGREGAR HORARIO
#-------------------------------------------------------------------------
DELIMITER $$
CREATE TRIGGER bitacora_Agregar_Horario_insert
AFTER INSERT ON Curso_Horario
FOR EACH ROW
BEGIN
#Sentencias SQL
	INSERT INTO Bitacora(Fecha,Descripcion,Tipo) 
    VALUES (SYSDATE(), "Se ha realizado una accion en la tabla Curso_Horario","INSERT");
END;
$$

#-------------------------------------------------------------------------
#CREAMOS EL TRIGGER PARA LA ELIMINACION DE DATOS EN TABLA AGREGAR HORARIO
#-------------------------------------------------------------------------
DELIMITER $$
CREATE TRIGGER bitacora_Agregar_Horario_delete
AFTER DELETE ON Curso_Horario
FOR EACH ROW
BEGIN
#Sentencias SQL
	INSERT INTO Bitacora(Fecha,Descripcion,Tipo) 
    VALUES (SYSDATE(), "Se ha realizado una accion en la tabla Curso_Horario","DELETE");
END;
$$

#-------------------------------------------------------------------------
#CREAMOS EL TRIGGER PARA LA ACTUALIZACION DE DATOS EN TABLA AGREGAR HORARIO
#-------------------------------------------------------------------------
DELIMITER $$
CREATE TRIGGER bitacora_Agregar_Horario_update
AFTER UPDATE ON Curso_Horario
FOR EACH ROW
BEGIN
#Sentencias SQL
	INSERT INTO Bitacora(Fecha,Descripcion,Tipo) 
    VALUES (SYSDATE(), "Se ha realizado una accion en la tabla Curso_Horario","UPDATE");
END;
$$

#-------------------------------------------------------------------------
#CREAMOS LA FUNCION PARA VALIDAR QUE EXISTA O NO EL CURSO HABILITADO
#-------------------------------------------------------------------------
DELIMITER $$
CREATE FUNCTION ExisteCurso_Habilitado(
	cadena INT
)
RETURNS BOOLEAN
DETERMINISTIC
BEGIN

DECLARE valido BOOLEAN;
-- Sentenicas SQL
SELECT EXISTS (SELECT 1 FROM Curso_Habilitado WHERE cadena = Id_Curso_Habilitado) INTO valido;
RETURN (valido);

END$$

#-------------------------------------------------------------------------
#CREAMOS LA FUNCION PARA VALIDAR LA INSERCION DE DATOS EN TABLA CURSO HORARIO
#-------------------------------------------------------------------------
DELIMITER $$
CREATE PROCEDURE AgregarHorario(
	IN Id_Curso_In BIGINT,
    IN Dia_In VARCHAR(10),
    IN Horario_In VARCHAR(20) 
    
)
AgregarHorario:BEGIN 
DECLARE Dia_Numero_In INT;

#Validamos que exista el id curso
IF (NOT ExisteCurso_Habilitado(Id_Curso_In)) THEN
	SELECT "El Id del curso ingresado no existe en el sistema de bases de datos" AS ERROR;
	LEAVE AgregarHorario;
END IF;

#Validamos que sean todos numeros
IF (NOT ValidarNumerosEnteros(Dia_In)) THEN
	SELECT "El Dia deben ser numeros enteros y sin signo" AS ERROR;
	LEAVE AgregarHorario;
END IF;

#Validamos que sean todos numeros entre 1 y 7
SELECT Dia_In INTO Dia_Numero_In;
IF (NOT (Dia_Numero_In >= 1 AND Dia_Numero_In <= 7)) THEN
	SELECT "El Dia deben ser numeros entre 1 y 7" AS ERROR;
	LEAVE AgregarHorario;
END IF;

#Validamos que sea una seccion valida
IF (NOT ValidarHorario(Horario_In)) THEN
	SELECT "El horario debe tener el siguiente formato XX:XX-XX:XX" AS ERROR;
	LEAVE AgregarHorario;
END IF;

#ingresamos los datos 
INSERT INTO Curso_Horario(Id_Curso_Habilitado,Horario,Dia)
VALUES (Id_Curso_In,Horario_In,Dia_Numero_In);
 
#mensaje de salida
SELECT CONCAT("El curso ", Id_Curso_In, " ha sido habilitado en el horario  ", Horario_In, " para el dia ", Dia_In, ", a sido registrad@ en el sistema de bases de datos") AS MENSAJE;

END$$
