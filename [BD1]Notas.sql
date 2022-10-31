USE Facultad;
#-------------------------------------------------------------------------
#CREAMOS EL TRIGGER PARA LA INSERCION DE DATOS EN TABLA NOTA
#-------------------------------------------------------------------------
DELIMITER $$
CREATE TRIGGER bitacora_Notas_insert
AFTER INSERT ON Nota
FOR EACH ROW
BEGIN
#Sentencias SQL
	INSERT INTO Bitacora(Fecha,Descripcion,Tipo) 
    VALUES (SYSDATE(), "Se ha realizado una accion en la tabla Nota","INSERT");
END;
$$

#-------------------------------------------------------------------------
#CREAMOS EL TRIGGER PARA LA ELIMINACION DE DATOS EN TABLA NOTA
#-------------------------------------------------------------------------
DELIMITER $$
CREATE TRIGGER bitacora_Notas_delete
AFTER DELETE ON Nota
FOR EACH ROW
BEGIN
#Sentencias SQL
	INSERT INTO Bitacora(Fecha,Descripcion,Tipo) 
    VALUES (SYSDATE(), "Se ha realizado una accion en la tabla Nota","DELETE");
END;
$$

#-------------------------------------------------------------------------
#CREAMOS EL TRIGGER PARA LA ACTUALIZACION DE DATOS EN TABLA NOTA
#-------------------------------------------------------------------------
DELIMITER $$
CREATE TRIGGER bitacora_Notas_update
AFTER UPDATE ON Nota
FOR EACH ROW
BEGIN
#Sentencias SQL
	INSERT INTO Bitacora(Fecha,Descripcion,Tipo) 
    VALUES (SYSDATE(), "Se ha realizado una accion en la tabla Nota","UPDATE");
END;
$$

#-------------------------------------------------------------------------
#CREAMOS LA FUNCION PARA VALIDAR LA INSERCION DE DATOS EN TABLA ASIGNAR Y DESASIGNAR
#-------------------------------------------------------------------------
DELIMITER $$
CREATE PROCEDURE IngresarNota(
	IN Id_Curso_In BIGINT,
    IN Ciclo_In VARCHAR(10),
    IN Seccion_In VARCHAR(10),
    IN Carnet_In BIGINT,
    IN Nota_In VARCHAR(10)
)
IngresarNota:BEGIN 
DECLARE Id_Curso_Habilitado_In VARCHAR(100);
DECLARE Nota_In_In INT;
DECLARE Creditos_Otorgados INT;

#Validamos que exista el id curso
IF (NOT ExisteCurso(Id_Curso_In)) THEN
	SELECT "El Id del curso ingresado no existe en el sistema de bases de datos" AS ERROR;
	LEAVE IngresarNota;
END IF;

#Validamos que exista los ciclos establecidos
IF (NOT ValidarCiclo(Ciclo_In)) THEN
	SELECT "El ciclo no es valido solo se permiten 1s, 2s, vj, vd ya sea mayusculas o minusculas " AS ERROR;
	LEAVE IngresarNota;
END IF;

#Validamos que sea una seccion valida
IF (NOT ValidarSeccion(Seccion_In)) THEN
	SELECT "La seccion ingresada, no concuerda con el modelo de 1 caracter" AS ERROR;
	LEAVE IngresarNota;
END IF;

#Validamos que el curso este habilitado
SELECT ExisteCurso_Ciclo_Seccion_Annio_Curso_Habilitado_Val(Ciclo_In,Seccion_In,Id_Curso_In) INTO Id_Curso_Habilitado_In;
IF (Id_Curso_Habilitado_In IS NULL OR Id_Curso_Habilitado_In = "") THEN
	SELECT "El curso ingresado, con el ciclo y seccion no concuerdan con algun curso habilitado para asignar, ingrese nuevamente los datos correctamente" AS ERROR;
    LEAVE IngresarNota;
END IF;

#Validamos que exista el carnet
IF (NOT ExisteEstudiante(Carnet_In)) THEN
	SELECT "El carnet ingresado no existe en el sistema de bases de datos" AS ERROR;
	LEAVE IngresarNota;
END IF;

#Validamos que este asignado a la misma seccion
IF (NOT ExisteAsignacion(Id_Curso_Habilitado_In,Carnet_In)) THEN
	SELECT "El Estudiante no esta asignado en el sistema de bases de datos" AS ERROR;
	LEAVE IngresarNota;
END IF;

#Validamos que sean todos positivos
IF (NOT ValidarNumerosDecimales(Nota_In)) THEN
	SELECT "La nota ingresada no es valida, tiene que ser positiva y sin signo" AS ERROR;
	LEAVE IngresarNota;
END IF;


#Validamos que sean todos positivos
IF (Nota_In_In >= 0 AND Nota_In_In <= 100) THEN
	SELECT "La nota ingresada no es valida, tiene que ser positiva y mayor a 0" AS ERROR;
	LEAVE IngresarNota;
END IF;

#ingresamos los datos 
INSERT INTO Nota(Carnet,Nota,Id_Curso_Habilitado)
VALUES (Carnet_In,Nota_In,Id_Curso_Habilitado_In);

SELECT Nota_In INTO Nota_In_In;
IF (Nota_In_In >= 61) THEN
	#actualizamos la tabla de Curso Curso_Habilitado
    SELECT Creditos_Otorga FROM Curso WHERE Curso.Id_Curso = Id_Curso_In INTO Creditos_Otorgados;
    
	UPDATE Estudiante 
	SET Estudiante.Creditos = Creditos + Creditos_Otorgados
	WHERE Estudiante.Carnet = Carnet_In;
END IF;

#mensaje de salida
SELECT CONCAT("Al estudiante ", Carnet_In, "  se le han sido registrad@s sus notas en el sistema de bases de datos") AS MENSAJE;

END$$
