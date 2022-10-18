DELIMITER $$
CREATE TRIGGER bitacora_carrera
AFTER INSERT ON Carrera
FOR EACH ROW
BEGIN
	INSERT INTO Bitacora(Fecha,Descripcion,tabla) 
    VALUES (SYSDATE(), "Se ha insertado un nuevo registro","Carrera");
END$$

DELIMITER $$
CREATE FUNCTION ValidarLetras(
	cadena VARCHAR(150)
)
RETURNS BOOLEAN
DETERMINISTIC
BEGIN

DECLARE valido BOOLEAN;
#validamos con regex
IF (SELECT REGEXP_INSTR(cadena,'[^a-zA-A ]') = 0)THEN
	SELECT TRUE INTO valido;
ELSE 
	SELECT FALSE INTO valido;
END IF;

RETURN (valido);
END$$

DELIMITER $$
CREATE FUNCTION ValidarNumeros(
	cadena VARCHAR(150)
)
RETURNS BOOLEAN
DETERMINISTIC
BEGIN

DECLARE valido BOOLEAN;
#validamos con regex
IF (SELECT REGEXP_INSTR(cadena,'[^0-9]||.') = 0)THEN
	SELECT TRUE INTO valido;
ELSE 
	SELECT FALSE INTO valido;
END IF;

RETURN (valido);
END$$


select ValidarNumeros(".564654.6.465465.4656545465");