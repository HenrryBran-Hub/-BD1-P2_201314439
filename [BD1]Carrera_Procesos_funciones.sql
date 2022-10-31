USE Facultad;
#-------------------------------------------------------------------------
#CREAMOS LA FUNCION PARA VALIDAR SOLO LETRAS
#-------------------------------------------------------------------------
DELIMITER $$
CREATE FUNCTION ValidarLetras(
	cadena VARCHAR(150)
)
RETURNS BOOLEAN
DETERMINISTIC
BEGIN

DECLARE valido BOOLEAN;
#validamos con regex
IF (SELECT REGEXP_INSTR(cadena,'[^a-zA-ZÀ-ú  ]') = 0)THEN
	SELECT TRUE INTO valido;
ELSE 
	SELECT FALSE INTO valido;
END IF;

RETURN (valido);
END$$

#-------------------------------------------------------------------------
#CREAMOS LA FUNCION PARA VALIDAR SOLO NUMEROS DECIMALES
#-------------------------------------------------------------------------
DELIMITER $$
CREATE FUNCTION ValidarNumerosDecimales(
	cadena VARCHAR(150)
)
RETURNS BOOLEAN
DETERMINISTIC
BEGIN

DECLARE valido BOOLEAN;
#validamos con regex
IF (SELECT REGEXP_INSTR(cadena,'^[0-9]*\.?[0-9]+$') = 0)THEN
	SELECT FALSE INTO valido;
ELSE 
	SELECT TRUE INTO valido;
END IF;

RETURN (valido);
END$$

#-------------------------------------------------------------------------
#CREAMOS LA FUNCION PARA VALIDAR SOLO NUMEROS ENTEROS
#-------------------------------------------------------------------------
DELIMITER $$
CREATE FUNCTION ValidarNumerosEnteros(
	cadena VARCHAR(150)
)
RETURNS BOOLEAN
DETERMINISTIC
BEGIN

DECLARE valido BOOLEAN;
#validamos con regex
IF (SELECT REGEXP_INSTR(cadena,'^[0-9]+$') = 0)THEN
	SELECT FALSE INTO valido;
ELSE 
	SELECT TRUE INTO valido;
END IF;

RETURN (valido);
END$$

#-------------------------------------------------------------------------
#CREAMOS LA FUNCION PARA VALIDAR BOOLEANO
#-------------------------------------------------------------------------
DELIMITER $$
CREATE FUNCTION ValidarBooleano(
	cadena VARCHAR(10)
)
RETURNS BOOLEAN
DETERMINISTIC
BEGIN

DECLARE valido BOOLEAN;
#validamos con regex
IF (SELECT cadena = "1" OR cadena = "0")THEN
	SELECT TRUE INTO valido;
ELSE 
	SELECT FALSE INTO valido;
END IF;

RETURN (valido);
END$$

#-------------------------------------------------------------------------
#CREAMOS LA FUNCION PARA VALIDAR EL CORREO
#-------------------------------------------------------------------------
DELIMITER $$
CREATE FUNCTION ValidarCorreo(
	cadena VARCHAR(150)
)
RETURNS BOOLEAN
DETERMINISTIC
BEGIN

DECLARE valido BOOLEAN;
#validamos con regex
IF (SELECT REGEXP_INSTR(cadena,'^[[:alnum:]._%-\+]+@[[:alnum:].-]+[.][[:alnum:]]{2,4}$') = 0)THEN
	SELECT FALSE INTO valido;
ELSE 
	SELECT TRUE INTO valido;
END IF;

RETURN (valido);
END$$

#-------------------------------------------------------------------------
#CREAMOS LA FUNCION PARA VALIDAR EL CICLO
#-------------------------------------------------------------------------
DELIMITER $$
CREATE FUNCTION ValidarCiclo(
	cadena VARCHAR(150)
)
RETURNS BOOLEAN
DETERMINISTIC
BEGIN

DECLARE valido BOOLEAN;
#validamos con regex
IF (SELECT cadena = "1S" OR cadena = "2S" OR cadena = "VJ" OR cadena = "VD" )THEN
	SELECT TRUE INTO valido;
ELSE 
	SELECT FALSE INTO valido;
END IF;

RETURN (valido);
END$$

#-------------------------------------------------------------------------
#CREAMOS LA FUNCION PARA VALIDAR LAS SECCIONE PERO EN RANGOS A-I
#-------------------------------------------------------------------------
DELIMITER $$
CREATE FUNCTION ValidarSeccion1(
	cadena VARCHAR(150)
)
RETURNS BOOLEAN
DETERMINISTIC
BEGIN

DECLARE valido BOOLEAN;
#validamos con regex
IF (SELECT cadena = "a" OR cadena = "b" OR cadena = "c" OR cadena = "d" OR cadena = "e" OR cadena = "f" OR cadena = "g" OR cadena = "h" OR cadena = "i" )THEN
	SELECT FALSE INTO valido;
ELSE 
	SELECT TRUE INTO valido;
END IF;

RETURN (valido);
END$$

#-------------------------------------------------------------------------
#CREAMOS LA FUNCION PARA VALIDAR LAS SECCIONE PERO EN RANGOS J-Q
#-------------------------------------------------------------------------
DELIMITER $$
CREATE FUNCTION ValidarSeccion2(
	cadena VARCHAR(150)
)
RETURNS BOOLEAN
DETERMINISTIC
BEGIN

DECLARE valido BOOLEAN;
#validamos con regex
IF (SELECT cadena = "j" OR cadena = "k" OR cadena = "l" OR cadena = "m" OR cadena = "n" OR cadena = "ñ" OR cadena = "o" OR cadena = "p" OR cadena = "q" )THEN
	SELECT FALSE INTO valido;
ELSE 
	SELECT TRUE INTO valido;
END IF;

RETURN (valido);
END$$

#-------------------------------------------------------------------------
#CREAMOS LA FUNCION PARA VALIDAR LAS SECCIONE PERO EN RANGOS R-Z
#-------------------------------------------------------------------------
DELIMITER $$
CREATE FUNCTION ValidarSeccion3(
	cadena VARCHAR(150)
)
RETURNS BOOLEAN
DETERMINISTIC
BEGIN

DECLARE valido BOOLEAN;
#validamos con regex
IF (SELECT cadena = "r" OR cadena = "s" OR cadena = "t" OR cadena = "u" OR cadena = "v" OR cadena = "w" OR cadena = "x" OR cadena = "y" OR cadena = "z" )THEN
	SELECT FALSE INTO valido;
ELSE 
	SELECT TRUE INTO valido;
END IF;

RETURN (valido);
END$$

#-------------------------------------------------------------------------
#CREAMOS LA FUNCION PARA VALIDAR LAS SECCIONES
#-------------------------------------------------------------------------
DELIMITER $$
CREATE FUNCTION ValidarSeccion(
	cadena VARCHAR(150)
)
RETURNS BOOLEAN
DETERMINISTIC
BEGIN

DECLARE valido BOOLEAN;
#validamos con regex
IF ( ValidarSeccion1(cadena) = 0 OR ValidarSeccion2(cadena) = 0 OR ValidarSeccion3(cadena) = 0 )THEN
	SELECT TRUE INTO valido;
ELSE 
	SELECT FALSE INTO valido;
END IF;

RETURN (valido);
END$$

#-------------------------------------------------------------------------
#CREAMOS LA FUNCION PARA VALIDAR LOS HORARIOS
#-------------------------------------------------------------------------
DELIMITER $$
CREATE FUNCTION ValidarHorario(
	cadena VARCHAR(150)
)
RETURNS BOOLEAN
DETERMINISTIC
BEGIN

DECLARE valido BOOLEAN;
#validamos con regex
IF (SELECT REGEXP_INSTR(cadena,'(^0[0-9]|10|11|12|13|14|15|16|17|18|19|20|21|22|23)\:([0-5][0-9])\-(0[0-9]|10|11|12|13|14|15|16|17|18|19|20|21|22|23)\:([0-5][0-9])$') = 0)THEN
	SELECT FALSE INTO valido;
ELSE 
	SELECT TRUE INTO valido;
END IF;

RETURN (valido);
END$$