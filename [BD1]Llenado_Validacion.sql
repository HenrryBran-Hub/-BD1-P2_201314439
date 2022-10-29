USE Facultad;
#-------------------------------------------------------------------------
#INGRESAMOS DATOS Y PROBAMOS VALIDACIONES CARRERA
#-------------------------------------------------------------------------
call CrearCarrera("Area Comun");
call CrearCarrera("Ingenieria en Ciencias y Sistemas");
call CrearCarrera("Ingenieria Industrial");
call CrearCarrera("Ingenieria Mecanica");
call CrearCarrera("Ingenieria en Electricidad");
call CrearCarrera("Ingenieria en Electronica");
call CrearCarrera("Ingenieria Ambiental");
call CrearCarrera("Ingenieria Mecatronica");
call CrearCarrera("Ingenieria Quimica");
select * from carrera;
select * from bitacora;

#probando validacion de solo letras
call CrearCarrera("Ingenieria Quimica 1231");
#probando validacion de que exista la carrera
call CrearCarrera("Ingenieria en Electronica");

#-------------------------------------------------------------------------
#INGRESAMOS DATOS Y PROBAMOS VALIDACIONES ESTUDIANTE
#-------------------------------------------------------------------------
call RegistrarEstudiante("201314439","Henrry David","Bran Velasquez","1992-12-26","henry26@gmail.com","35621487","12-69 9na Avenida Zona 1","2168036320108",2);
call RegistrarEstudiante("199863257","Juan Roberto","Garcia Perez","1980-12-01","juan66@gmail.com","23569856","8va calle 8-44 zona 15","36215478942158",3);
call RegistrarEstudiante("200359761","Ricardo Andres","Forest Lopoz","1985-05-07","andres_P@hotmail.com","12457845","8-99 diagonal 7 zona 14","356984218764",4);
call RegistrarEstudiante("201345796","Steven David","Bran Montenegro","1993-05-09","sdbm@hotmail.com","26548795","4ta calle 4-75 zona 1","2015463781230",5);
call RegistrarEstudiante("201316845","Erica Aislin","Moore Gonzales","1992-11-1","mixerica@gmail.com","15932547","9na avenida 14-98 zona 11","0124632895172",6);
call RegistrarEstudiante("201336985","Yuri Noelia","Bran Velasquez","1992-01-24","Yuri99@gmail.com","24569831","5ta avenida 6-78 zona 3","2034157910326",7);
call RegistrarEstudiante("201468957","Jessica Andrea","Perez Beltran","1994-06-15","Jess@hotmail.com","78469512","5ta avenida 7-99 zona 6","2348510695217",8);
call RegistrarEstudiante("201431274","Esperanza","Durcal Bram","1995-05-17","Hope8@gmail.com","46895217","6ta avenidad 14-30 zona 1","2567148931015",9);
call RegistrarEstudiante("201465218","Enrique Josue","Smith","1993-09-24","Joss-98@gmail.com","10365289","6ta avenidad 6-87 zona 15","2941510362487",2);
call RegistrarEstudiante("201468925","Barresi Giordany","Pol","1975-10-30","Pol69@yahoo.net","74869210","3 calle y 5ta avenida 3-44 zona 4","1245863257498",2);
call RegistrarEstudiante("201568974","Cristina","Ricci","1988-08-07","Ricchi57@yahoo.net","21469823","4 calle y 3ra avenida 14-66 residencial flores","19546328496521",3);
call RegistrarEstudiante("201632598","Carlos Santiago","Bran Barrillas","1995-06-19","Futurama@yahoo.net","47621035","8va avenida 6-88 residencial colina del monte","15642874132015",3);
call RegistrarEstudiante("201532187","Carla Paulina","Lopez Zuñiga","1995-05-27","PauK@yahoo.net","95478623","6ta calle y 3ra Avenida 6-55 bolivar zona 6","1362548974521",5);
call RegistrarEstudiante("201541236","Joana","Malta","1995-11-03","Jo231@yahoo.net","54872169","3ra calle 6-99 zona 5","1254874652149",8);
call RegistrarEstudiante("201578416","Candy","Candy","1996-06-09","SweetCandy@gmail.com","32568941","6ta calle 1-22 zona 14","3659824157846",6);
call RegistrarEstudiante("201698214","Felipa","Jerez Barrios","1997-08-29","Flip666@gmail.com","14785692","2da Avenida 2-33 zona 6","1457846214032",4);
call RegistrarEstudiante("201621487","Rosio","Morales Botran","1997-01-25","Roxi2@outlook.com","10234578","3ra calle 7-15 zona 8","13659824578410",8);
call RegistrarEstudiante("201610248","Yuri Noelia","Rios Yax","1997-11-02","LaikaY@gmail.com","14758692","6ta avenidad 14-30 zona 22","6985412748653",6);
call RegistrarEstudiante("201641257","Valentina","Rossi","1997-07-22","Vale36@outlook.com","12345678","9na avenida 3-45 zona 11","34157842103215",9);
call RegistrarEstudiante("201610985","David Andre","Latballa","1997-06-07","AndreGiant78@outlook.com","87654321","3-55 residencial bosques zona 15","6954128745869",4);
call RegistrarEstudiante("201741256","Lucas Felipe","Bayarta","1998-04-12","Filipavo44@outlook.com","98652147","5ta calle y 6ta avenida 5-66 zona 19","3624157849650",2);
select * from Estudiante;
select * from bitacora;

#probando validacion de carnet unico
call RegistrarEstudiante("201314439","Henrry David","Bran Velasquez","1992-12-26","henrry26k@gmail.com","32553598","6ta avenidad 14-30 zona 1, lo de coy mixco","2168036320108",1);
#probando validacion de que exista la carrera
call RegistrarEstudiante("201565987","Juan Gustavo","Peres Ballarta","2000-01-15","juagGustavo55k@gmail.com","65982314","5ta avenidad 2-99 zona 18, Guatemala","35698741658",55);
#probando validacion de que el correo cumpla el formato valido
call RegistrarEstudiante("201565987","Juan Gustavo","Peres Ballarta","2000-01-15","juagGustavo55k@gmai","65982314","5ta avenidad 2-99 zona 18, Guatemala","35698741658",1);
#probando validacion de no permitir codigo de area
call RegistrarEstudiante("201565987","Juan Gustavo","Peres Ballarta","2000-01-15","juagGustavo55k@gmai.com","+65982314","5ta avenidad 2-99 zona 18, Guatemala","35698741658",1);

#-------------------------------------------------------------------------
#INGRESAMOS DATOS Y PROBAMOS VALIDACIONES DOCENTE
#-------------------------------------------------------------------------
call RegistrarDocente("Pedro Pablo","Hernandes Perez","1979-02-28","pph@gmail.com","42157864","8va Avenida 6-45 zona 15","2547612348754","124635874");
call RegistrarDocente("Carlos Alberto","Rodriguez Kael","1975-08-02","cark@gmail.com","36254187","9na Calle 9-66 zona 1","0124578436521","645217892");
call RegistrarDocente("Mateo Elisio","Botran Garcia","1981-09-11","mebg@outlook.com","21547863","3ra Calle 6-78 zona 18","0325698652147","245713685");
call RegistrarDocente("Ana Maria","Garcia Perez","1988-10-24","amgp@outlook.com","23568974","8va Calle 8-45 zona 15","0147582365984","625478413");
call RegistrarDocente("Maria Jose","Borrayo Pol","1970-12-06","mjbp@yahoo.com","23568417","6va Avenida 7-22 zona 2","1245378412345","135248790");
call RegistrarDocente("Jose Maria","Zidane Gonzales","1976-03-21","jmzg@yahoo.com","14785236","7va Avenida 7-77 zona 16","1264784920132","135240368");
call RegistrarDocente("Alfredo Gustavo","Cortes Martinez","1979-07-03","agcm@hotmail.com","65894217","21va Avenida 2-1 zona 22","0124786532140","124578630");
call RegistrarDocente("Gustavo","Molina","1986-04-07","g89m@hotmail.com","12035687","6va calle 6-2 zona 8","9658231457803","4685972310");
call RegistrarDocente("Rudy Antonio","Paiz","1988-11-15","r_78@gmail.com","14578698","8va calle 8-21 zona 11","1362487593201","265312453");
call RegistrarDocente("Lucia","Faramir","1990-01-19","lf_78@gmail.com","12457846","1ra Avenida 2-33 zona 17","9865247365891","201245893");
call RegistrarDocente("Carlos Enrique","Consuelo Gozo","1956-05-01","V45_pp@gmail.com","59864784","6ta calle 6-33 zona 4","1596587423801","120356874");
select * from Docente;
select * from bitacora;

#probando validacion de siif unico
call RegistrarDocente("Pedro Pablo","Hernandes Perez","1979-02-28","pph@gmail.com","42157864","8va Avenida 6-45 zona 15","2547612348754","124635874");
#probando validacion de que el correo cumpla el formato valido
call RegistrarDocente("Rogelio","Paiz Najera","1975-09-11","rpaizgmail.com","42157864","8va Avenida 6-45 zona 15","2547612348754","321548640");
#probando validacion de no permiter codigo de area
call RegistrarDocente("Rogelio","Paiz Najera","1975-09-11","rpaiz@gmail.com","+42157864","8va Avenida 6-45 zona 15","2547612348754","321548640");

#-------------------------------------------------------------------------
#INGRESAMOS DATOS Y PROBAMOS VALIDACIONES CURSO
#-------------------------------------------------------------------------
call CrearCurso("1","Matematica Basica 1","0","8","1","1");
call CrearCurso("2","Matematica Basica 2","10","8","1","1");
call CrearCurso("3","Fisica Basica 1 ","8","10","1","1");
call CrearCurso("4","Quimica General","0","5","1","0");
call CrearCurso("5","Social Humanistica 1","0","8","1","0");
call CrearCurso("6","Introduccion a la Computacion 1","0","8","2","1");
call CrearCurso("7","Lenguajes de la Comunicacion","7","6","2","0");
call CrearCurso("8","Matematica Computacional 1","0","7","2","1");
call CrearCurso("9","Teoria de Sistema 1","2","5","2","0");
call CrearCurso("10","Estructura de datos","15","4","2","1");
call CrearCurso("11","Contabilidad 1","0","8","3","0");
call CrearCurso("12","Electridad 1","0","7","3","1");
call CrearCurso("13","Analisis Probabilistico 1","8","6","3","0");
call CrearCurso("14","Legislacion 1","0","5","3","0");
call CrearCurso("15","Contabilidad 2","5","6","3","1");
call CrearCurso("16","Sistema Hidraulicos","0","4","4","1");
call CrearCurso("17","Mecanica analitica 1","0","5","4","0");
call CrearCurso("18","Mecanica analitica 2","6","6","4","0");
call CrearCurso("19","Electronica basica 1","5","7","4","1");
call CrearCurso("20","Practica Iniciales","5","8","4","1");
call CrearCurso("21","Cableado estructural 1","0","4","5","1");
call CrearCurso("22","Electridicidad basica 1","0","5","5","0");
call CrearCurso("23","Cableado estructural 2","7","6","5","0");
call CrearCurso("24","Teoria electromagnetica 1","8","7","5","1");
call CrearCurso("25","Fisica 2","6","8","5","1");
call CrearCurso("26","Robotica","15","8","6","1");
call CrearCurso("27","Instalacion de equipos electronicos","8","7","6","1");
call CrearCurso("28","Ingenieria de Costos","3","6","6","0");
call CrearCurso("29","Electronica basica","0","5","6","1");
call CrearCurso("30","Comunicacion 1","6","4","6","0");
call CrearCurso("31","Microbiologia 1","0","8","7","1");
call CrearCurso("32","Calidad de agua","4","7","7","0");
call CrearCurso("33","Microbiologia 2","4","6","7","1");
call CrearCurso("34","Bioquimica 1","0","5","7","0");
call CrearCurso("35","Bioquimica 2","10","4","7","1");
call CrearCurso("36","Circuitos Electricos 1","0","9","8","1");
call CrearCurso("37","Ciencias de los Materiales","0","10","8","0");
call CrearCurso("38","Circuitos Electirocs 2","5","3","8","0");
call CrearCurso("39","Mecanicade fluidos","0","4","8","1");
call CrearCurso("40","Resistencia de los materiales 1","5","6","8","1");
call CrearCurso("41","Fisicoquimica 1","0","7","9","1");
call CrearCurso("42","Cinetica de procesos quimicos","0","6","9","0");
call CrearCurso("43","Procesos Quimicos industriales","7","5","9","1");
call CrearCurso("44","Fisicoquimica 2","4","3","9","1");
call CrearCurso("45","Flujo de fluidos","5","2","9","0");
select * from Curso;
select * from bitacora;

#probando validacion de id de curso inico
call CrearCurso("45","Flujo de fluidos","5","2","9","0");
#probando validacion de creditos necesarios positivo
call CrearCurso("46","Flujo de fluidos 2","-5","2","9","0");
#probando validacion de creditos otorga sean enteros
call CrearCurso("46","Flujo de fluidos 2","5","2.66","9","0");
#probando validacion de que exista la carrera
call CrearCurso("46","Flujo de fluidos 2","5","5","10","0");
#probando validacion de opcionalidad de el curso
call CrearCurso("46","Flujo de fluidos 2","5","5","1","4");

#-------------------------------------------------------------------------
#INGRESAMOS DATOS Y PROBAMOS VALIDACIONES HABILITAR CURSO
#-------------------------------------------------------------------------
call HabilitarCurso("1","1s","124635874","5","a");
call HabilitarCurso("2","1s","124635874","5","a");
call HabilitarCurso("3","1s","645217892","5","a");
call HabilitarCurso("4","1s","4685972310","5","a");
call HabilitarCurso("5","1s","4685972310","5","a");
call HabilitarCurso("6","1s","4685972310","5","a");
call HabilitarCurso("7","1s","124635874","5","a");
call HabilitarCurso("8","1s","625478413","5","a");
call HabilitarCurso("9","1s","245713685","5","a");
call HabilitarCurso("10","1s","124635874","5","a");
call HabilitarCurso("11","1s","135240368","5","a");
call HabilitarCurso("12","1s","124635874","5","a");
call HabilitarCurso("13","1s","124578630","5","a");
call HabilitarCurso("14","1s","135240368","5","a");
call HabilitarCurso("15","1s","124635874","5","a");
call HabilitarCurso("1","1s","124635874","5","b");
call HabilitarCurso("2","1s","124635874","5","b");
call HabilitarCurso("3","1s","645217892","5","b");
call HabilitarCurso("4","1s","4685972310","5","b");
call HabilitarCurso("5","1s","4685972310","5","b");
call HabilitarCurso("6","1s","4685972310","5","b");
call HabilitarCurso("7","1s","124635874","5","b");
call HabilitarCurso("8","1s","625478413","5","b");
call HabilitarCurso("9","1s","245713685","5","b");
call HabilitarCurso("10","1s","124635874","5","b");
call HabilitarCurso("11","1s","135240368","5","b");
call HabilitarCurso("12","1s","124635874","5","b");
call HabilitarCurso("13","1s","124578630","5","b");
call HabilitarCurso("14","1s","135240368","5","b");
call HabilitarCurso("15","1s","124635874","5","b");
select * from curso_habilitado;
select * from bitacora;

#validamos que exista el curso
call HabilitarCurso("99","1s","124635874","5","b");
#validamos que el ciclo sea el correcto
call HabilitarCurso("15","3s","124635874","5","c");
#validamos que exista el docente
call HabilitarCurso("15","1s","1213","5","b");
#validamos que el cupo sea positivo
call HabilitarCurso("15","1s","124635874","-9","b");
#validamos que sea entero
call HabilitarCurso("15","1s","124635874","5.658","b");
#validamos seccion
call HabilitarCurso("15","1s","124635874","5","cc");

#-------------------------------------------------------------------------
#INGRESAMOS DATOS Y PROBAMOS VALIDACIONES HORARIO DE CURSOS
#-------------------------------------------------------------------------
call AgregarHorario("1","1","07:10-09:00");
call AgregarHorario("1","2","07:10-09:00");
call AgregarHorario("1","3","07:10-09:00");
call AgregarHorario("1","5","07:10-09:00");
call AgregarHorario("2","1","10:40-12:00");
call AgregarHorario("3","2","13:40-15:00");
call AgregarHorario("4","3","10:40-11:00");
call AgregarHorario("5","4","15:40-16:30");
call AgregarHorario("6","5","10:40-12:00");
call AgregarHorario("7","6","10:40-12:00");
call AgregarHorario("8","7","12:40-18:00");
call AgregarHorario("9","1","10:40-12:00");
call AgregarHorario("10","2","07:40-08:30");
call AgregarHorario("11","3","08:40-10:45");
call AgregarHorario("12","4","10:40-12:00");
call AgregarHorario("13","5","10:40-13:00");
call AgregarHorario("14","6","10:40-12:40");
call AgregarHorario("15","7","06:40-07:50");
call AgregarHorario("16","1","10:40-12:00");
call AgregarHorario("17","2","09:40-10:20");
call AgregarHorario("17","3","10:40-12:00");
call AgregarHorario("18","4","14:40-15:50");
call AgregarHorario("19","5","10:40-11:30");
call AgregarHorario("20","6","16:40-17:30");
call AgregarHorario("21","7","10:40-13:10");
call AgregarHorario("22","1","18:40-19:20");
call AgregarHorario("23","2","10:40-12:40");
call AgregarHorario("24","3","10:40-12:30");
call AgregarHorario("25","4","20:40-21:50");
call AgregarHorario("26","5","10:40-15:00");
call AgregarHorario("27","6","10:40-13:00");
call AgregarHorario("28","7","22:40-23:40");
call AgregarHorario("29","5","03:40-07:00");
call AgregarHorario("30","5","10:40-14:00");
select * from Curso_Horario;
select * from bitacora;

#validamos que exista el curso
call AgregarHorario("155","2","07:10-09:00");
#validamos que el ciclo sea el correcto
call AgregarHorario("1","21","07:10-09:00");
#validamos que exista el docente
call AgregarHorario("1","2","07:1 0- 09:00");

#-------------------------------------------------------------------------
#INGRESAMOS DATOS Y PROBAMOS VALIDACIONES ASIGNACION DE CURSOS
#-------------------------------------------------------------------------
call AsignarCurso("1","1s","a","201314439");
call AsignarCurso("1","1s","a","199863257");
call AsignarCurso("1","1s","a","200359761");
call AsignarCurso("1","1s","a","201345796");
call AsignarCurso("1","1s","a","201316845");
call AsignarCurso("1","1s","b","201468957");
call AsignarCurso("1","1s","b","201431274");
call AsignarCurso("1","1s","b","201465218");
call AsignarCurso("1","1s","b","201468925");
call AsignarCurso("1","1s","b","201568974");
call AsignarCurso("6","1s","a","201314439");
call AsignarCurso("6","1s","a","201468925");

#validamos que el curso exista
call AsignarCurso("60","1s","a","201468925");
#valiadmos que el ciclo cumpla con las normas
call AsignarCurso("6","1ss","a","201468925");
#validamos que la secion sea un caracter
call AsignarCurso("6","1s","ak","201468925");
#validamos que exista el carnet
call AsignarCurso("6","1s","a","231321");
#validamos que el curso pertenesca a la carrera del usuario
call AsignarCurso("6","1s","a","201431274");
#validamos que exista el cupo
call AsignarCurso("1","1s","a","201336985");

#-------------------------------------------------------------------------
#INGRESAMOS DATOS Y PROBAMOS VALIDACIONES DESASIGNACION DE CURSO
#-------------------------------------------------------------------------
call DesasignarCurso("1","1s","a","201316845");
call DesasignarCurso("1","1s","b","201468957");
call DesasignarCurso("6","1s","a","201468925");

#validamos que el curso exista
call DesasignarCurso("60","1s","a","201468925");
#valiadmos que el ciclo cumpla con las normas
call DesasignarCurso("6","1ss","a","201468925");
#validamos que la secion sea un caracter
call DesasignarCurso("6","1s","ak","201468925");
#validamos que exista el carnet
call DesasignarCurso("6","1s","a","231321");

#-------------------------------------------------------------------------
#INGRESAMOS DATOS Y PROBAMOS VALIDACIONES NOTAS
#-------------------------------------------------------------------------
call IngresarNota("1","1s","a","201314439","66");
call IngresarNota("1","1s","a","199863257","61");
call IngresarNota("1","1s","a","200359761","60");
call IngresarNota("1","1s","a","201345796","59");
call IngresarNota("1","1s","a","201316845","55");
call IngresarNota("1","1s","b","201468957","66");
call IngresarNota("1","1s","b","201431274","61");
call IngresarNota("1","1s","b","201465218","59");
call IngresarNota("1","1s","b","201468925","63");
call IngresarNota("1","1s","b","201568974","31");
call IngresarNota("6","1s","a","201314439","61");
call IngresarNota("6","1s","a","201468925","0");

#validamos que el curso exista
call IngresarNota("60","1s","a","201314439","66");
#valiadmos que el ciclo cumpla con las normas
call IngresarNota("1","1sss","a","201314439","66");
#validamos que la secion sea un caracter
call IngresarNota("1","1s","aas","201314439","66");
#validamos que exista el carnet
call IngresarNota("1","1s","a","12355","66");

call ConsultarPensum("3");
call ConsultarEstudiante("201339");
call ConsultarDocente(124635874);
call ConsultarAsignados(1,"1s","2020","A");
call ConsultarAprobacion(1,"1s","2022","B");



