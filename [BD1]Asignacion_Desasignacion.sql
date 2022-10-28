USE Facultad;
#-------------------------------------------------------------------------
#CREAMOS EL TRIGGER PARA LA INSERCION DE DATOS EN TABLA ASIGNACION Y DESASIGNACION
#-------------------------------------------------------------------------
DELIMITER $$
CREATE TRIGGER bitacora_Asignacion_Desasignacion_insert
AFTER INSERT ON Asignacion_Desasignacion
FOR EACH ROW
BEGIN
#Sentencias SQL
	INSERT INTO Bitacora(Fecha,Descripcion,Tipo) 
    VALUES (SYSDATE(), "Se ha realizado una accion en la tabla Asignacion_Desasignacion","INSERT");
END;
$$

#-------------------------------------------------------------------------
#CREAMOS EL TRIGGER PARA LA ELIMINACION DE DATOS EN TABLA ASIGNACION Y DESASIGNACION
#-------------------------------------------------------------------------
DELIMITER $$
CREATE TRIGGER bitacora_Asignacion_Desasignacion_delete
AFTER DELETE ON Asignacion_Desasignacion
FOR EACH ROW
BEGIN
#Sentencias SQL
	INSERT INTO Bitacora(Fecha,Descripcion,Tipo) 
    VALUES (SYSDATE(), "Se ha realizado una accion en la tabla Asignacion_Desasignacion","DELETE");
END;
$$

#-------------------------------------------------------------------------
#CREAMOS EL TRIGGER PARA LA ACTUALIZACION DE DATOS EN TABLA ASIGNACION Y DESASIGNACION
#-------------------------------------------------------------------------
DELIMITER $$
CREATE TRIGGER bitacora_Asignacion_Desasignacion_update
AFTER UPDATE ON Asignacion_Desasignacion
FOR EACH ROW
BEGIN
#Sentencias SQL
	INSERT INTO Bitacora(Fecha,Descripcion,Tipo) 
    VALUES (SYSDATE(), "Se ha realizado una accion en la tabla Asignacion_Desasignacion","UPDATE");
END;
$$

#-------------------------------------------------------------------------
#CREAMOS LA FUNCION PARA VALIDAR LA INSERCION DE DATOS EN TABLA HABILITAR CURSO
#-------------------------------------------------------------------------
DELIMITER $$
CREATE PROCEDURE AsignarCurso(
	IN Id_Curso_In BIGINT,
    IN Ciclo_In VARCHAR(10),
    IN Seccion_In VARCHAR(10),    
    IN SIIF_In VARCHAR(10),
    IN Carnet_In BIGINT
    
)
AsignarCurso:BEGIN 

#Validamos que exista el id curso
IF (NOT ExisteCurso(Id_Curso_In)) THEN
	SELECT "El Id del curso ingresado no existe en el sistema de bases de datos" AS ERROR;
	LEAVE AsignarCurso;
END IF;

#Validamos que exista los ciclos establecidos
IF (NOT ValidarCiclo(Ciclo_In)) THEN
	SELECT "El ciclo no es valido solo se permiten 1s, 2s, vj, vd ya sea mayusculas o minusculas " AS ERROR;
	LEAVE AsignarCurso;
END IF;

#Validamos que sea una seccion valida
IF (NOT ValidarSeccion(Seccion_In)) THEN
	SELECT "La seccion ingresada, no concuerda con el modelo de 1 caracter" AS ERROR;
	LEAVE AsignarCurso;
END IF;

#validamos que no exista el curso en el ciclo y la seccion 
IF (ExisteCurso_Ciclo_Seccion(Ciclo_In,Seccion_In)) THEN
	SELECT "La Seccion ingresada esta repetida para el ciclo que esta ingresando, cambie de seccion o de ciclo" AS ERROR;
	LEAVE AsignarCurso;
END IF;

/*
#ingresamos los datos 
INSERT INTO Curso_Habilitado(Ciclo,Cupo_Maximo,Seccion,Annio,Asignados,Id_Curso,SIIF)
VALUES (Ciclo_In,Cupo_Maximo_In,UPPER(Seccion_In),YEAR(CURDATE()),0,Id_Curso_In,SIIF_In);
 */
 
#mensaje de salida
SELECT CONCAT("El curso ", Id_Curso_In, " ha sido habilitado en el ciclo ", Ciclo_In, " para la seccion ", Seccion_In, ", a sido registrad@ en el sistema de bases de datos") AS MENSAJE;

END$$
