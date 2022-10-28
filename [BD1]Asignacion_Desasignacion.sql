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
#CREAMOS LA FUNCION PARA VALIDAR QUE EXISTA O NO EL CURSO EN EL MISMO CICLO Y SECCION
#-------------------------------------------------------------------------
DELIMITER $$
CREATE FUNCTION ExisteCurso_Ciclo_Seccion_Annio_Curso_Habilitado_Val(
	Ciclo_In VARCHAR(15),
    Seccion_In VARCHAR(15),
    Id_Curso_In BIGINT
)
RETURNS VARCHAR(100)
DETERMINISTIC
BEGIN

DECLARE valido VARCHAR(100);
-- Sentenicas SQL
(SELECT Id_Curso_Habilitado FROM Curso_Habilitado WHERE Ciclo_In = Ciclo AND Seccion_In = Seccion AND YEAR(CURDATE()) = Annio AND Id_Curso_In = Id_Curso) INTO valido;
RETURN (valido);

END$$

#-------------------------------------------------------------------------
#CREAMOS LA FUNCION PARA VALIDAR QUE EXISTA O NO EL CURSO EN EL MISMO CICLO Y SECCION
#-------------------------------------------------------------------------
DELIMITER $$
CREATE FUNCTION ExisteCurso_Ciclo_Seccion_Annio_Curso_Habilitado_Bol(
	Ciclo_In VARCHAR(15),
    Seccion_In VARCHAR(15),
    Id_Curso_In BIGINT
)
RETURNS BOOLEAN
DETERMINISTIC
BEGIN

DECLARE valido BOOLEAN;
-- Sentenicas SQL
SELECT EXISTS (SELECT 1 FROM Curso_Habilitado WHERE Ciclo_In = Ciclo AND Seccion_In = Seccion AND YEAR(CURDATE()) = Annio AND Id_Curso_In = Id_Curso) INTO valido;
RETURN (valido);

END$$

#-------------------------------------------------------------------------
#CREAMOS LA FUNCION PARA VALIDAR QUE EXISTA O NO EN LA MISMA SECCION 
#-------------------------------------------------------------------------
DELIMITER $$
CREATE FUNCTION ExisteAsignacion(
	Id_Curso_Habilitado_In VARCHAR(15),
    Carnet_In BIGINT
)
RETURNS BOOLEAN
DETERMINISTIC
BEGIN

DECLARE valido BOOLEAN;
-- Sentenicas SQL
SELECT EXISTS (SELECT 1 FROM Asignacion_Desasignacion WHERE Id_Curso_Habilitado_In = Id_Curso_Habilitado AND Carnet_In = Carnet AND Estado = 1) INTO valido;
RETURN (valido);

END$$

#-------------------------------------------------------------------------
#CREAMOS LA FUNCION PARA VALIDAR QUE EXISTA O NO EN O OTRA SECCION
#-------------------------------------------------------------------------
DELIMITER $$
CREATE FUNCTION ExisteAsignacionOtra(
	Id_Curso_In VARCHAR(15),
    Carnet_In BIGINT,
    Ciclo_In VARCHAR(10)
)
RETURNS BOOLEAN
DETERMINISTIC
BEGIN

DECLARE valido BOOLEAN;
-- Sentenicas SQL

SELECT EXISTS (
SELECT 1 FROM Asignacion_Desasignacion 
INNER JOIN Curso_Habilitado 
ON Curso_Habilitado.Id_Curso_Habilitado = Asignacion_Desasignacion.Id_Curso_Habilitado
AND Id_Curso_In = Curso_Habilitado.Id_Curso 
AND Carnet_In = Asignacion_Desasignacion.Carnet 
AND Ciclo_In = Curso_Habilitado.Ciclo
AND Asignacion_Desasignacion.Estado = 1) INTO valido;
RETURN (valido);

END$$

#-------------------------------------------------------------------------
#CREAMOS LA FUNCION PARA VALIDAR QUE EXISTA O NO EN LA MISMA SECCION 
#-------------------------------------------------------------------------
DELIMITER $$
CREATE FUNCTION ExisteDesasignacion(
	Id_Curso_Habilitado_In VARCHAR(15),
    Carnet_In BIGINT
)
RETURNS BOOLEAN
DETERMINISTIC
BEGIN

DECLARE valido BOOLEAN;
-- Sentenicas SQL
SELECT EXISTS (SELECT 1 FROM Asignacion_Desasignacion WHERE Id_Curso_Habilitado_In = Id_Curso_Habilitado AND Carnet_In = Carnet AND Estado = 0) INTO valido;
RETURN (valido);

END$$

#-------------------------------------------------------------------------
#CREAMOS LA FUNCION PARA VALIDAR QUE CUMPLA CON LOS CREDITOS NECESARIOS
#-------------------------------------------------------------------------
DELIMITER $$
CREATE FUNCTION ExisteCreditosNecesarios(
	Id_Curso_In VARCHAR(15),
    Carnet_In BIGINT
)
RETURNS BOOLEAN
DETERMINISTIC
BEGIN

DECLARE Creditos_Necesarios_In INT;
DECLARE Creditos_Carnet_In INT;
-- Sentenicas SQL
SELECT Creditos_Necesarios FROM Curso WHERE Id_Curso_In = Id_Curso INTO Creditos_Necesarios_In;
SELECT Creditos FROM Estudiante WHERE Carnet_In = Carnet INTO Creditos_Carnet_In;

IF (Creditos_Necesarios_In <= Creditos_Carnet_In) THEN
	RETURN TRUE;
ELSE
	RETURN FALSE;
END IF;
END$$

#-------------------------------------------------------------------------
#CREAMOS LA FUNCION PARA VALIDAR QUE CUMPLA CON LOS CREDITOS NECESARIOS
#-------------------------------------------------------------------------
DELIMITER $$
CREATE FUNCTION ExisteCursoCarnetCarrera(
	Id_Curso_In VARCHAR(15),
    Carnet_In BIGINT
)
RETURNS BOOLEAN
DETERMINISTIC
BEGIN

DECLARE Curso_Carrera_In INT;
DECLARE Carnet_Carrera_In INT;
-- Sentenicas SQL
SELECT Id_Carrera FROM Curso WHERE Id_Curso_In = Id_Curso INTO Curso_Carrera_In;
SELECT Id_Carrera FROM Estudiante WHERE Carnet_In = Carnet INTO Carnet_Carrera_In;

IF (Carnet_Carrera_In = Curso_Carrera_In OR Carnet_Carrera_In = 1) THEN
	RETURN TRUE;
ELSE
	RETURN FALSE;
END IF;
END$$

#-------------------------------------------------------------------------
#CREAMOS LA FUNCION PARA VALIDAR QUE EXISTA O NO EN LA MISMA SECCION O OTRA
#-------------------------------------------------------------------------
DELIMITER $$
CREATE FUNCTION ExisteCupoAsignacion(
	Id_Curso_Habilitado_In VARCHAR(100)
)
RETURNS BOOLEAN
DETERMINISTIC
BEGIN

DECLARE Asignados_In INT;
DECLARE Cupo_Maximo_In INT;
-- Sentenicas SQL
SELECT Asignados FROM Curso_Habilitado WHERE Id_Curso_Habilitado_In = Id_Curso_Habilitado INTO Asignados_In;
SELECT Cupo_Maximo FROM Curso_Habilitado WHERE Id_Curso_Habilitado_In = Id_Curso_Habilitado INTO Cupo_Maximo_In;
IF (Asignados_In < Cupo_Maximo_In) THEN
	RETURN TRUE;
ELSE
	RETURN FALSE;
END IF;

END$$

#-------------------------------------------------------------------------
#CREAMOS LA FUNCION PARA VALIDAR LA INSERCION DE DATOS EN TABLA ASIGNAR Y DESASIGNAR
#-------------------------------------------------------------------------
DELIMITER $$
CREATE PROCEDURE AsignarCurso(
	IN Id_Curso_In BIGINT,
    IN Ciclo_In VARCHAR(10),
    IN Seccion_In VARCHAR(10),
    IN Carnet_In BIGINT    
)
AsignarCurso:BEGIN 
DECLARE Id_Curso_Habilitado_In VARCHAR(100);

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

#Validamos que el curso este habilitado
SELECT ExisteCurso_Ciclo_Seccion_Annio_Curso_Habilitado_Val(Ciclo_In,Seccion_In,Id_Curso_In) INTO Id_Curso_Habilitado_In;
IF (Id_Curso_Habilitado_In IS NULL OR Id_Curso_Habilitado_In = "") THEN
	SELECT "El curso ingresado, con el ciclo y seccion no concuerdan con algun curso habilitado para asignar, ingrese nuevamente los datos correctamente" AS ERROR;
    LEAVE AsignarCurso;
END IF;

#Validamos que exista el carnet
IF (NOT ExisteEstudiante(Carnet_In)) THEN
	SELECT "El carnet ingresado no existe en el sistema de bases de datos" AS ERROR;
	LEAVE AsignarCurso;
END IF;

#Validamos que no este asignado a la misma seccion
IF (ExisteAsignacion(Id_Curso_Habilitado_In,Carnet_In)) THEN
	SELECT "El Estudiante ya esta asignado en el sistema de bases de datos" AS ERROR;
	LEAVE AsignarCurso;
END IF;

#Validamos que no este asignado en otra seccion
IF (ExisteAsignacionOtra(Id_Curso_In,Carnet_In,Ciclo_In)) THEN
	SELECT "El Estudiante ya esta asignado en otra seccion en el sistema de bases de datos" AS ERROR;
	LEAVE AsignarCurso;
END IF;

#Validamos que cuente con los creditos necesarios
IF (NOT ExisteCreditosNecesarios(Id_Curso_In,Carnet_In)) THEN
	SELECT "El Estudiante no cumple con los creditos necesarios" AS ERROR;
	LEAVE AsignarCurso;
END IF;
#validamos que pertenezca el curso correspondiente a su carrera o area comun
IF (ExisteCursoCarnetCarrera(Id_Curso_In,Carnet_In)) THEN
	SELECT "El Estudiante no cumple con la carrera correspondiente o el curso no es de area comun" AS ERROR;
	LEAVE AsignarCurso;
END IF;

#validamos que exista cupo
IF (NOT ExisteCupoAsignacion(Id_Curso_Habilitado_In)) THEN
	SELECT "El cupo de estudiantes esta al maximo del sistema" AS ERROR;
	LEAVE AsignarCurso;
END IF;

#ingresamos los datos 
#Validamos que no este desasignacion a la misma seccion
IF (ExisteDesasignacion(Id_Curso_Habilitado_In,Carnet_In)) THEN
	UPDATE Asignacion_Desasignacion
	SET Asignacion_Desasignacion.Estado = 1 
	WHERE Asignacion_Desasignacion.Id_Curso_Habilitado = Id_Curso_Habilitado_In
	AND Asignacion_Desasignacion.Carnet = Carnet_In;	
ELSE 
	INSERT INTO Asignacion_Desasignacion(Id_Curso_Habilitado,Carnet,Estado)
	VALUES (Id_Curso_Habilitado_In,Carnet_In,1);
END IF;

#actualizamos la tabla de Curso Curso_Habilitado
UPDATE Curso_Habilitado 
SET Curso_Habilitado.Asignados = Curso_Habilitado.Asignados + 1
WHERE Curso_Habilitado.Id_Curso_Habilitado = Id_Curso_Habilitado_In;

#mensaje de salida
SELECT CONCAT("El estudiante ", Carnet_In, " ha sido asignado al curso habilitado ", Id_Curso_Habilitado_In, " en el ciclo ", Ciclo_In, " para la seccion ", Seccion_In, ", a sido registrad@ en el sistema de bases de datos") AS MENSAJE;

END$$

#-------------------------------------------------------------------------
#CREAMOS LA FUNCION PARA VALIDAR LA INSERCION DE DATOS EN TABLA ASIGNAR Y DESASIGNAR
#-------------------------------------------------------------------------
DELIMITER $$
CREATE PROCEDURE DesasignarCurso(
	IN Id_Curso_In BIGINT,
    IN Ciclo_In VARCHAR(10),
    IN Seccion_In VARCHAR(10),
    IN Carnet_In BIGINT    
)
DesasignarCurso:BEGIN 
DECLARE Id_Curso_Habilitado_In VARCHAR(100);

#Validamos que exista el id curso
IF (NOT ExisteCurso(Id_Curso_In)) THEN
	SELECT "El Id del curso ingresado no existe en el sistema de bases de datos" AS ERROR;
	LEAVE DesasignarCurso;
END IF;

#Validamos que exista los ciclos establecidos
IF (NOT ValidarCiclo(Ciclo_In)) THEN
	SELECT "El ciclo no es valido solo se permiten 1s, 2s, vj, vd ya sea mayusculas o minusculas " AS ERROR;
	LEAVE DesasignarCurso;
END IF;

#Validamos que sea una seccion valida
IF (NOT ValidarSeccion(Seccion_In)) THEN
	SELECT "La seccion ingresada, no concuerda con el modelo de 1 caracter" AS ERROR;
	LEAVE DesasignarCurso;
END IF;

#Validamos que el curso este habilitado
SELECT ExisteCurso_Ciclo_Seccion_Annio_Curso_Habilitado_Val(Ciclo_In,Seccion_In,Id_Curso_In) INTO Id_Curso_Habilitado_In;
IF (Id_Curso_Habilitado_In IS NULL OR Id_Curso_Habilitado_In = "") THEN
	SELECT "El curso ingresado, con el ciclo y seccion no concuerdan con algun curso habilitado para desasignar, ingrese nuevamente los datos correctamente" AS ERROR;
    LEAVE DesasignarCurso;
END IF;

#Validamos que exista el carnet
IF (NOT ExisteEstudiante(Carnet_In)) THEN
	SELECT "El carnet ingresado no existe en el sistema de bases de datos" AS ERROR;
	LEAVE DesasignarCurso;
END IF;

#Validamos que este asignado
IF (NOT ExisteAsignacion(Id_Curso_Habilitado_In,Carnet_In)) THEN
	SELECT "El Estudiante ya esta asignado en el sistema de bases de datos" AS ERROR;
	LEAVE DesasignarCurso;
END IF;

#ingresamos los datos 
UPDATE Asignacion_Desasignacion
SET Asignacion_Desasignacion.Estado = 0 
WHERE Asignacion_Desasignacion.Id_Curso_Habilitado = Id_Curso_Habilitado_In
AND Asignacion_Desasignacion.Carnet = Carnet_In;

#actualizamos la tabla de Curso Curso_Habilitado
UPDATE Curso_Habilitado 
SET Curso_Habilitado.Asignados = Curso_Habilitado.Asignados - 1
WHERE Curso_Habilitado.Id_Curso_Habilitado = Id_Curso_Habilitado_In;

#mensaje de salida
SELECT CONCAT("El estudiante ", Carnet_In, " ha sido desasignado al curso habilitado ", Id_Curso_Habilitado_In, " en el ciclo ", Ciclo_In, " para la seccion ", Seccion_In, ", a sido actualizado en el sistema de bases de datos") AS MENSAJE;

END$$
