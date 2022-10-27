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
call RegistrarEstudiante("201314439","Henrry David","Bran Velasquez","1992-12-26","henrry26k@gmail.com","32553598","6ta avenidad 14-30 zona 1, lo de coy mixco","2168036320108",1);
call RegistrarEstudiante("201314439","Henrry David","Bran Velasquez","1992-12-26","henrry26k@gmail.com","32553598","6ta avenidad 14-30 zona 1, lo de coy mixco","2168036320108",1);
call RegistrarEstudiante("201314439","Henrry David","Bran Velasquez","1992-12-26","henrry26k@gmail.com","32553598","6ta avenidad 14-30 zona 1, lo de coy mixco","2168036320108",1);
call RegistrarEstudiante("201314439","Henrry David","Bran Velasquez","1992-12-26","henrry26k@gmail.com","32553598","6ta avenidad 14-30 zona 1, lo de coy mixco","2168036320108",1);
call RegistrarEstudiante("201314439","Henrry David","Bran Velasquez","1992-12-26","henrry26k@gmail.com","32553598","6ta avenidad 14-30 zona 1, lo de coy mixco","2168036320108",1);
call RegistrarEstudiante("201314439","Henrry David","Bran Velasquez","1992-12-26","henrry26k@gmail.com","32553598","6ta avenidad 14-30 zona 1, lo de coy mixco","2168036320108",1);
call RegistrarEstudiante("201314439","Henrry David","Bran Velasquez","1992-12-26","henrry26k@gmail.com","32553598","6ta avenidad 14-30 zona 1, lo de coy mixco","2168036320108",1);
call RegistrarEstudiante("201314439","Henrry David","Bran Velasquez","1992-12-26","henrry26k@gmail.com","32553598","6ta avenidad 14-30 zona 1, lo de coy mixco","2168036320108",1);
call RegistrarEstudiante("201314439","Henrry David","Bran Velasquez","1992-12-26","henrry26k@gmail.com","32553598","6ta avenidad 14-30 zona 1, lo de coy mixco","2168036320108",1);
call RegistrarEstudiante("201314439","Henrry David","Bran Velasquez","1992-12-26","henrry26k@gmail.com","32553598","6ta avenidad 14-30 zona 1, lo de coy mixco","2168036320108",1);
call RegistrarEstudiante("201314439","Henrry David","Bran Velasquez","1992-12-26","henrry26k@gmail.com","32553598","6ta avenidad 14-30 zona 1, lo de coy mixco","2168036320108",1);
call RegistrarEstudiante("201314439","Henrry David","Bran Velasquez","1992-12-26","henrry26k@gmail.com","32553598","6ta avenidad 14-30 zona 1, lo de coy mixco","2168036320108",1);
call RegistrarEstudiante("201314439","Henrry David","Bran Velasquez","1992-12-26","henrry26k@gmail.com","32553598","6ta avenidad 14-30 zona 1, lo de coy mixco","2168036320108",1);
call RegistrarEstudiante("201314439","Henrry David","Bran Velasquez","1992-12-26","henrry26k@gmail.com","32553598","6ta avenidad 14-30 zona 1, lo de coy mixco","2168036320108",1);
call RegistrarEstudiante("201314439","Henrry David","Bran Velasquez","1992-12-26","henrry26k@gmail.com","32553598","6ta avenidad 14-30 zona 1, lo de coy mixco","2168036320108",1);
call RegistrarEstudiante("201314439","Henrry David","Bran Velasquez","1992-12-26","henrry26k@gmail.com","32553598","6ta avenidad 14-30 zona 1, lo de coy mixco","2168036320108",1);
call RegistrarEstudiante("201314439","Henrry David","Bran Velasquez","1992-12-26","henrry26k@gmail.com","32553598","6ta avenidad 14-30 zona 1, lo de coy mixco","2168036320108",1);
call RegistrarEstudiante("201314439","Henrry David","Bran Velasquez","1992-12-26","henrry26k@gmail.com","32553598","6ta avenidad 14-30 zona 1, lo de coy mixco","2168036320108",1);
call RegistrarEstudiante("201314439","Henrry David","Bran Velasquez","1992-12-26","henrry26k@gmail.com","32553598","6ta avenidad 14-30 zona 1, lo de coy mixco","2168036320108",1);
call RegistrarEstudiante("201314439","Henrry David","Bran Velasquez","1992-12-26","henrry26k@gmail.com","32553598","6ta avenidad 14-30 zona 1, lo de coy mixco","2168036320108",1);
call RegistrarEstudiante("201314439","Henrry David","Bran Velasquez","1992-12-26","henrry26k@gmail.com","32553598","6ta avenidad 14-30 zona 1, lo de coy mixco","2168036320108",1);
select * from Estudiante;
select * from bitacora;

#probando validacion de carnet unico
call RegistrarEstudiante("201314439","Henrry David","Bran Velasquez","1992-12-26","henrry26k@gmail.com","32553598","6ta avenidad 14-30 zona 1, lo de coy mixco","2168036320108",1);
#probando validacion de que exista la carrera
call RegistrarEstudiante("201565987","Juan Gustavo","Peres Ballarta","2000-01-15","juagGustavo55k@gmail.com","65982314","5ta avenidad 2-99 zona 18, Guatemala","35698741658",55);
#probando validacion de que el correo cumpla el formato valido
