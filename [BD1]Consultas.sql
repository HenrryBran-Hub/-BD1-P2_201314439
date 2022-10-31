USE Facultad;
#-------------------------------------------------------------------------
#CONSULTAR PENSUM
#-------------------------------------------------------------------------
DELIMITER $$
CREATE PROCEDURE ConsultarPensum(
	IN Id_Carrera_In BIGINT
    
)
ConsultarPensum:BEGIN 

SELECT 
Curso.Id_Curso AS "Codigo de curso",
Curso.Nombre AS "Nombre del Curso",
IF(Curso.Opcionalidad, 'si', 'no') AS "Es Obligatorio",
Curso.Creditos_Necesarios AS "Creditos Necesarios"
From Curso 
WHERE Id_Carrera_In = Curso.Id_Carrera 
OR Curso.Id_Carrera = 1;

END$$

#-------------------------------------------------------------------------
#CONSULTAR ESTUDIANTE
#-------------------------------------------------------------------------
DELIMITER $$
CREATE PROCEDURE ConsultarEstudiante(
	IN Carnet_In BIGINT
    
)
ConsultarEstudiante:BEGIN 

#Validamos que exista el carnet
IF (NOT ExisteEstudiante(Carnet_In)) THEN
	SELECT "El carnet ingresado no existe en el sistema de bases de datos" AS ERROR;
	LEAVE ConsultarEstudiante;
END IF;

SELECT 
Estudiante.Carnet AS "Carnet",
CONCAT(Estudiante.Nombres," ", Estudiante.Apellidos) AS "Nombre Completo",
Estudiante.Fecha_Nacimiento AS "Fecha de Nacimiento",
Estudiante.Correo AS "Correo",
Estudiante.Telefono AS "Telefono",
Estudiante.Direccion AS "Direccion",
Estudiante.DPI AS "Numero de DPI",
Carrera.Nombre AS "Carrera",
Estudiante.Creditos AS "Creditos que posee"
From Estudiante,Carrera
WHERE Carrera.Id_Carrera = Estudiante.Id_Carrera
AND Estudiante.Carnet = Carnet_In;

END$$

#-------------------------------------------------------------------------
#CONSULTAR DOCENTE
#-------------------------------------------------------------------------
DELIMITER $$
CREATE PROCEDURE ConsultarDocente(
	IN SIIF_In BIGINT
    
)
ConsultarDocente:BEGIN 

#Validamos que exista el carnet
IF (NOT ExisteDocente(SIIF_In)) THEN
	SELECT "El SIIF ingresado no existe en el sistema de bases de datos" AS ERROR;
	LEAVE ConsultarDocente;
END IF;

SELECT 
Docente.SIIF AS "Registro SIIF",
CONCAT(Docente.Nombres," ", Docente.Apellidos) AS "Nombre Completo",
Docente.Fecha_Nacimiento AS "Fecha de Nacimiento",
Docente.Correo AS "Correo",
Docente.Telefono AS "Telefono",
Docente.Direccion AS "Direccion",
Docente.DPI AS "Numero de DPI"
From Docente
WHERE Docente.SIIF = SIIF_In;

END$$

#-------------------------------------------------------------------------
#CREAMOS LA FUNCION PARA VALIDAR QUE EXISTA O NO EL CURSO EN EL MISMO CICLO Y SECCION
#-------------------------------------------------------------------------
DELIMITER $$
CREATE FUNCTION ExisteCurso_Ciclo_Seccion_Annio_Curso_Habilitado_Val_year(
	Ciclo_In VARCHAR(15),
    Seccion_In VARCHAR(15),
    Id_Curso_In BIGINT,
    Annio_In VARCHAR(10)
)
RETURNS VARCHAR(100)
DETERMINISTIC
BEGIN

DECLARE valido VARCHAR(100);
-- Sentenicas SQL
(SELECT Id_Curso_Habilitado FROM Curso_Habilitado WHERE Ciclo_In = Ciclo AND Seccion_In = Seccion AND Annio_In = Annio AND Id_Curso_In = Id_Curso) INTO valido;
RETURN (valido);

END$$

#-------------------------------------------------------------------------
#CONSULTAR ASIGNADOS
#-------------------------------------------------------------------------
DELIMITER $$
CREATE PROCEDURE ConsultarAsignados(
	IN Id_Curso_In BIGINT,
    IN Ciclo_In VARCHAR(10),
    IN Annio_In VARCHAR(10),
    IN Seccion_In VARCHAR(10)
        
)
ConsultarAsignados:BEGIN 
DECLARE Id_Curso_Habilitado_In VARCHAR(100);

#Validamos que exista el id curso
IF (NOT ExisteCurso(Id_Curso_In)) THEN
	SELECT "El Id del curso ingresado no existe en el sistema de bases de datos" AS ERROR;
	LEAVE ConsultarAsignados;
END IF;

#Validamos que exista los ciclos establecidos
IF (NOT ValidarCiclo(Ciclo_In)) THEN
	SELECT "El ciclo no es valido solo se permiten 1s, 2s, vj, vd ya sea mayusculas o minusculas " AS ERROR;
	LEAVE ConsultarAsignados;
END IF;

#Validamos que sea una seccion valida
IF (NOT ValidarSeccion(Seccion_In)) THEN
	SELECT "La seccion ingresada, no concuerda con el modelo de 1 caracter" AS ERROR;
	LEAVE ConsultarAsignados;
END IF;

#Validamos que el curso este habilitado
SELECT ExisteCurso_Ciclo_Seccion_Annio_Curso_Habilitado_Val_year(Ciclo_In,Seccion_In,Id_Curso_In,Annio_In) INTO Id_Curso_Habilitado_In;
IF (Id_Curso_Habilitado_In IS NULL OR Id_Curso_Habilitado_In = "") THEN
	SELECT "El curso ingresado, con el ciclo y seccion no concuerdan con algun curso habilitado para asignar, ingrese nuevamente los datos correctamente" AS ERROR;
    LEAVE ConsultarAsignados;
END IF;

SELECT 
Estudiante.Carnet AS "Carnet",
CONCAT(Estudiante.Nombres," ", Estudiante.Apellidos) AS "Nombre Completo",
Estudiante.Creditos AS "Creditos que posee"
From Estudiante,Asignacion_Desasignacion
WHERE Estudiante.Carnet = Asignacion_Desasignacion.Carnet
AND Asignacion_Desasignacion.Id_Curso_Habilitado = Id_Curso_Habilitado_In
AND Asignacion_Desasignacion.Estado = 1;

END$$

#-------------------------------------------------------------------------
#CONSULTAR ASIGNADOS
#-------------------------------------------------------------------------
DELIMITER $$
CREATE PROCEDURE ConsultarAprobacion(
	IN Id_Curso_In BIGINT,
    IN Ciclo_In VARCHAR(10),
    IN Annio_In VARCHAR(10),
    IN Seccion_In VARCHAR(10)
        
)
ConsultarAprobacion:BEGIN 
DECLARE Id_Curso_Habilitado_In VARCHAR(100);

#Validamos que exista el id curso
IF (NOT ExisteCurso(Id_Curso_In)) THEN
	SELECT "El Id del curso ingresado no existe en el sistema de bases de datos" AS ERROR;
	LEAVE ConsultarAprobacion;
END IF;

#Validamos que exista los ciclos establecidos
IF (NOT ValidarCiclo(Ciclo_In)) THEN
	SELECT "El ciclo no es valido solo se permiten 1s, 2s, vj, vd ya sea mayusculas o minusculas " AS ERROR;
	LEAVE ConsultarAprobacion;
END IF;

#Validamos que sea una seccion valida
IF (NOT ValidarSeccion(Seccion_In)) THEN
	SELECT "La seccion ingresada, no concuerda con el modelo de 1 caracter" AS ERROR;
	LEAVE ConsultarAprobacion;
END IF;

#Validamos que el curso este habilitado
SELECT ExisteCurso_Ciclo_Seccion_Annio_Curso_Habilitado_Val_year(Ciclo_In,Seccion_In,Id_Curso_In,Annio_In) INTO Id_Curso_Habilitado_In;
IF (Id_Curso_Habilitado_In IS NULL OR Id_Curso_Habilitado_In = "") THEN
	SELECT "El curso ingresado, con el ciclo y seccion no concuerdan con algun curso habilitado para asignar, ingrese nuevamente los datos correctamente" AS ERROR;
    LEAVE ConsultarAprobacion;
END IF;

SELECT 
Curso.Id_Curso AS "Codigo de curso",
Estudiante.Carnet AS "Carnet",
CONCAT(Estudiante.Nombres," ", Estudiante.Apellidos) AS "Nombre Completo",
IF (Nota.Nota >= 61, "APROBADO","DESAPROBADO") AS "APROBADO/DESAPROBADO"
FROM Curso
INNER JOIN Curso_Habilitado
ON Curso.Id_Curso = Curso_Habilitado.Id_Curso
INNER JOIN Nota
ON Curso_Habilitado.Id_Curso_Habilitado = Nota.Id_Curso_Habilitado
INNER JOIN Estudiante
ON Nota.Carnet = Estudiante.Carnet
INNER JOIN Asignacion_Desasignacion
ON Curso_Habilitado.Id_Curso_Habilitado = Asignacion_Desasignacion.Id_Curso_Habilitado
AND Curso_Habilitado.Id_Curso_Habilitado = Id_Curso_Habilitado_In
AND Asignacion_Desasignacion.Estado = 1
GROUP BY Curso.Id_Curso,Estudiante.Carnet;

END$$

