#-------------------------------------------------------------------------
#INGRESAMOS DATOS Y PROBAMOS VALIDACIONES CARRERA
#-------------------------------------------------------------------------
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
call RegistrarEstudiante("201314439","Henrry David","Bran Velasquez","1992-12-26","henry26@gmail.com","35621487","12-69 9na Avenida Zona 1","2168036320108",1);
call RegistrarEstudiante("199863257","Juan Roberto","Garcia Perez","1980-12-01","juan66@gmail.com","23569856","8va calle 8-44 zona 15","36215478942158",2);
call RegistrarEstudiante("200359761","Ricardo Andres","Forest Lopoz","1985-05-07","andres_P@hotmail.com","12457845","8-99 diagonal 7 zona 14","356984218764",3);
call RegistrarEstudiante("201345796","Steven David","Bran Montenegro","1993-05-09","sdbm@hotmail.com","26548795","4ta calle 4-75 zona 1","2015463781230",4);
call RegistrarEstudiante("201316845","Erica Aislin","Moore Gonzales","1992-11-1","mixerica@gmail.com","15932547","9na avenida 14-98 zona 11","0124632895172",5);
call RegistrarEstudiante("201336985","Yuri Noelia","Bran Velasquez","1992-01-24","Yuri99@gmail.com","24569831","5ta avenida 6-78 zona 3","2034157910326",6);
call RegistrarEstudiante("201468957","Jessica Andrea","Perez Beltran","1994-06-15","Jess@hotmail.com","78469512","5ta avenida 7-99 zona 6","2348510695217",7);
call RegistrarEstudiante("201431274","Esperanza","Durcal Bram","1995-05-17","Hope8@gmail.com","46895217","6ta avenidad 14-30 zona 1","2567148931015",8);
call RegistrarEstudiante("201465218","Enrique Josue","Smith","1993-09-24","Joss-98@gmail.com","10365289","6ta avenidad 6-87 zona 15","2941510362487",1);
call RegistrarEstudiante("201468925","Barresi Giordany","Pol","1975-10-30","Pol69@yahoo.net","74869210","3 calle y 5ta avenida 3-44 zona 4","1245863257498",1);
call RegistrarEstudiante("201568974","Cristina","Ricci","1988-08-07","Ricchi57@yahoo.net","21469823","4 calle y 3ra avenida 14-66 residencial flores","19546328496521",2);
call RegistrarEstudiante("201632598","Carlos Santiago","Bran Barrillas","1995-06-19","Futurama@yahoo.net","47621035","8va avenida 6-88 residencial colina del monte","15642874132015",2);
call RegistrarEstudiante("201532187","Carla Paulina","Lopez Zuñiga","1995-05-27","PauK@yahoo.net","95478623","6ta calle y 3ra Avenida 6-55 bolivar zona 6","1362548974521",3);
call RegistrarEstudiante("201541236","Joana","Malta","1995-11-03","Jo231@yahoo.net","54872169","3ra calle 6-99 zona 5","1254874652149",7);
call RegistrarEstudiante("201578416","Candy","Candy","1996-06-09","SweetCandy@gmail.com","32568941","6ta calle 1-22 zona 14","3659824157846",5);
call RegistrarEstudiante("201698214","Felipa","Jerez Barrios","1997-08-29","Flip666@gmail.com","14785692","2da Avenida 2-33 zona 6","1457846214032",3);
call RegistrarEstudiante("201621487","Rosio","Morales Botran","1997-01-25","Roxi2@outlook.com","10234578","3ra calle 7-15 zona 8","13659824578410",7);
call RegistrarEstudiante("201610248","Yuri Noelia","Rios Yax","1997-11-02","LaikaY@gmail.com","14758692","6ta avenidad 14-30 zona 22","6985412748653",5);
call RegistrarEstudiante("201641257","Valentina","Rossi","1997-07-22","Vale36@outlook.com","12345678","9na avenida 3-45 zona 11","34157842103215",8);
call RegistrarEstudiante("201610985","David Andre","Latballa","1997-06-07","AndreGiant78@outlook.com","87654321","3-55 residencial bosques zona 15","6954128745869",8);
call RegistrarEstudiante("201741256","Lucas Felipe","Bayarta","1998-04-12","Filipavo44@outlook.com","98652147","5ta calle y 6ta avenida 5-66 zona 19","3624157849650",1);
select * from Estudiante;
select * from bitacora;

#probando validacion de carnet unico
call RegistrarEstudiante("201314439","Henrry David","Bran Velasquez","1992-12-26","henrry26k@gmail.com","32553598","6ta avenidad 14-30 zona 1, lo de coy mixco","2168036320108",1);
#probando validacion de que exista la carrera
call RegistrarEstudiante("201565987","Juan Gustavo","Peres Ballarta","2000-01-15","juagGustavo55k@gmail.com","65982314","5ta avenidad 2-99 zona 18, Guatemala","35698741658",55);
#probando validacion de que el correo cumpla el formato valido
call RegistrarEstudiante("201565987","Juan Gustavo","Peres Ballarta","2000-01-15","juagGustavo55k@gmai","65982314","5ta avenidad 2-99 zona 18, Guatemala","35698741658",1);

#-------------------------------------------------------------------------
#INGRESAMOS DATOS Y PROBAMOS VALIDACIONES DOCENTE
#-------------------------------------------------------------------------
call RegistrarDocente("Pedro Pablo","Hernandes Perez","1979-02-28","pph@gmail.com","42157864","8va Avenida 6-45 zona 15","2547612348754","124635874");
call RegistrarDocente("Pedro Pablo","Hernandes Perez","1979-02-28","pph@gmail.com","42157864","8va Avenida 6-45 zona 15","2547612348754","124635874");
call RegistrarDocente("Pedro Pablo","Hernandes Perez","1979-02-28","pph@gmail.com","42157864","8va Avenida 6-45 zona 15","2547612348754","124635874");
call RegistrarDocente("Pedro Pablo","Hernandes Perez","1979-02-28","pph@gmail.com","42157864","8va Avenida 6-45 zona 15","2547612348754","124635874");
call RegistrarDocente("Pedro Pablo","Hernandes Perez","1979-02-28","pph@gmail.com","42157864","8va Avenida 6-45 zona 15","2547612348754","124635874");
call RegistrarDocente("Pedro Pablo","Hernandes Perez","1979-02-28","pph@gmail.com","42157864","8va Avenida 6-45 zona 15","2547612348754","124635874");
call RegistrarDocente("Pedro Pablo","Hernandes Perez","1979-02-28","pph@gmail.com","42157864","8va Avenida 6-45 zona 15","2547612348754","124635874");
call RegistrarDocente("Pedro Pablo","Hernandes Perez","1979-02-28","pph@gmail.com","42157864","8va Avenida 6-45 zona 15","2547612348754","124635874");
call RegistrarDocente("Pedro Pablo","Hernandes Perez","1979-02-28","pph@gmail.com","42157864","8va Avenida 6-45 zona 15","2547612348754","124635874");
call RegistrarDocente("Pedro Pablo","Hernandes Perez","1979-02-28","pph@gmail.com","42157864","8va Avenida 6-45 zona 15","2547612348754","124635874");
call RegistrarDocente("Pedro Pablo","Hernandes Perez","1979-02-28","pph@gmail.com","42157864","8va Avenida 6-45 zona 15","2547612348754","124635874");
select * from Docente;
select * from bitacora;

#probando validacion de siif unico
call RegistrarDocente("Pedro Pablo","Hernandes Perez","1979-02-28","pph@gmail.com","42157864","8va Avenida 6-45 zona 15","2547612348754","124635874");
#probando validacion de que el correo cumpla el formato valido
call RegistrarDocente("Rogelio","Paiz Najera","1975-09-11","rpaizgmail.com","42157864","8va Avenida 6-45 zona 15","2547612348754","321548640");
