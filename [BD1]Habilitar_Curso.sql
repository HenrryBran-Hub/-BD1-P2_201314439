USE Facultad;
#-------------------------------------------------------------------------
#CREAMOS EL TRIGGER PARA LA INSERCION DE DATOS EN TABLA HABILITAR CURSO
#-------------------------------------------------------------------------
DELIMITER $$
CREATE TRIGGER bitacora_Habilitar_curso_insert
AFTER INSERT ON Curso_Habilitado
FOR EACH ROW
BEGIN
#Sentencias SQL
	INSERT INTO Bitacora(Fecha,Descripcion,Tipo) 
    VALUES (SYSDATE(), "Se ha realizado una accion en la tabla Habilitar_Curso","INSERT");
END;
$$

#-------------------------------------------------------------------------
#CREAMOS EL TRIGGER PARA LA ELIMINACION DE DATOS EN TABLA HABILITAR CURSO
#-------------------------------------------------------------------------
DELIMITER $$
CREATE TRIGGER bitacora_Habilitar_curso_delete
AFTER DELETE ON Curso_Habilitado
FOR EACH ROW
BEGIN
#Sentencias SQL
	INSERT INTO Bitacora(Fecha,Descripcion,Tipo) 
    VALUES (SYSDATE(), "Se ha realizado una accion en la tabla Habilitar_Curso","DELETE");
END;
$$

#-------------------------------------------------------------------------
#CREAMOS EL TRIGGER PARA LA ACTUALIZACION DE DATOS EN TABLA HABILITAR CURSO
#-------------------------------------------------------------------------
DELIMITER $$
CREATE TRIGGER bitacora_Habilitar_curso_update
AFTER UPDATE ON Curso_Habilitado
FOR EACH ROW
BEGIN
#Sentencias SQL
	INSERT INTO Bitacora(Fecha,Descripcion,Tipo) 
    VALUES (SYSDATE(), "Se ha realizado una accion en la tabla Habilitar_Curso","UPDATE");
END;
$$

#-------------------------------------------------------------------------
#CREAMOS LA FUNCION PARA VALIDAR QUE EXISTA O NO EL CURSO EN EL MISMO CICLO Y SECCION
#-------------------------------------------------------------------------
DELIMITER $$
CREATE FUNCTION ExisteCurso_Ciclo_Seccion(
	Ciclo_In VARCHAR(15),
    Seccion_In VARCHAR(15),
    Id_Curso_In VARCHAR(15)
)
RETURNS BOOLEAN
DETERMINISTIC
BEGIN

DECLARE valido BOOLEAN;
-- Sentenicas SQL
SELECT EXISTS (SELECT 1 FROM Curso_Habilitado WHERE Ciclo_In = Ciclo AND Seccion_In = Seccion AND Id_Curso = Id_Curso_In) INTO valido;
RETURN (valido);

END$$

#-------------------------------------------------------------------------
#CREAMOS LA FUNCION PARA VALIDAR LA INSERCION DE DATOS EN TABLA HABILITAR CURSO
#-------------------------------------------------------------------------
DELIMITER $$
CREATE PROCEDURE HabilitarCurso(
	IN Id_Curso_In BIGINT,
    IN Ciclo_In VARCHAR(10),
    IN SIIF_In VARCHAR(10),
    IN Cupo_Maximo_In VARCHAR(10),
    IN Seccion_In VARCHAR(10)  
    
)
HabilitarCurso:BEGIN 

#Validamos que exista el id curso
IF (NOT ExisteCurso(Id_Curso_In)) THEN
	SELECT "El Id del curso ingresado no existe en el sistema de bases de datos" AS ERROR;
	LEAVE HabilitarCurso;
END IF;

#Validamos que exista los ciclos establecidos
IF (NOT ValidarCiclo(Ciclo_In)) THEN
	SELECT "El ciclo no es valido solo se permiten 1s, 2s, vj, vd ya sea mayusculas o minusculas " AS ERROR;
	LEAVE HabilitarCurso;
END IF;

#Validamos que  exista el siif
IF (NOT ExisteDocente(SIIF_In)) THEN
	SELECT "El SIIF ingresado no existe en el sistema de bases de datos" AS ERROR;
	LEAVE HabilitarCurso;
END IF;

#Validamos que sean todos numeros
IF (NOT ValidarNumerosEnteros(Cupo_Maximo_In)) THEN
	SELECT "El cupo maximo deben ser numeros enteros y sin signo" AS ERROR;
	LEAVE HabilitarCurso;
END IF;

#Validamos que sea una seccion valida
IF (NOT ValidarSeccion(Seccion_In)) THEN
	SELECT "La seccion ingresada, no concuerda con el modelo de 1 caracter" AS ERROR;
	LEAVE HabilitarCurso;
END IF;

#validamos que no exista el curso en el ciclo y la seccion 
IF (ExisteCurso_Ciclo_Seccion(Ciclo_In,Seccion_In,Id_Curso_In)) THEN
	SELECT "La Seccion ingresada esta repetida para el ciclo que esta ingresando, cambie de seccion o de ciclo" AS ERROR;
	LEAVE HabilitarCurso;
END IF;

#ingresamos los datos 
INSERT INTO Curso_Habilitado(Ciclo,Cupo_Maximo,Seccion,Annio,Asignados,Id_Curso,SIIF)
VALUES (Ciclo_In,Cupo_Maximo_In,UPPER(Seccion_In),YEAR(CURDATE()),0,Id_Curso_In,SIIF_In);
 
#mensaje de salida
SELECT CONCAT("El curso ", Id_Curso_In, " ha sido habilitado en el ciclo ", Ciclo_In, " para la seccion ", Seccion_In, ", a sido registrad@ en el sistema de bases de datos") AS MENSAJE;

END$$
