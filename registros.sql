use aprender;

-- MENU PARA EL ADMINISTRADOR.
insert into vista values("1","#","activo","Gestionar Menu","mdi mdi-view-list","1");
insert into vista values("2","#","activo","Gestionar Sub Menu","mdi mdi-tag-multiple","2");
insert into vista values("3","#","activo","Gestionar Modulos","mdi mdi-houzz","3");
insert into vista values("4","#","activo","Gestionar Contenido","mdi mdi-vlc","4");
insert into vista values("5","#","activo","Gestionar Prueba","mdi mdi-book-open","5");

insert into vista values("6","#","activo","Preguntas y respuestas","mdi mdi-barcode-scan","6");
insert into vista values("7","#","activo","Gestionar Sancion","mdi mdi-whatsapp","7");
insert into vista values("8","#","activo","Gestionar Premiacion","mdi mdi-apple","8");

insert into vista values("9","#","activo","Gestionar Tablas Basicas","mdi mdi-security","9");


-- MENU PARA EL JUGADOR.
insert into vista values("9","#","activo","Modulos","mdi mdi-view-list","9");
insert into vista VALUES("10","#","activo","Ranking","fas fa-angle-double-up","10");

-- --------------------------------------------------
-- GESTIONAR MODULOS 50 - 70                               |
-- --------------------------------------------------

-- ROL ADMINISTRADOR

insert into vista values("50","/Views/Administrador/Modulo/CrearModulos.aspx","activo","Crear Modulos","mdi mdi-check-all","3");
insert into vista values("51","/Views/Administrador/Modulo/ConsultarModulos.aspx","activo","Consultar Modulos","mdi mdi-check-all","3");
insert into vista values("52","/Views/Administrador/Modulo/EditarModulo.aspx","activo","Editar Modulos","mdi mdi-check-all","3");
insert into vista values("53","/Views/Administrador/Modulo/EliminarModulo.aspx","activo","Eliminar Modulos","mdi mdi-check-all","3");



-- ROL JUGADOR


insert into vista values("54","/Views/VistasJugador/ConsultaModulo/ListaModulo","activo","Ver Modulos","mdi mdi-check-all","3");

-- --------------------------------------------------
-- GESTIONAR CONTENIDO 70 - 90                       |
-- --------------------------------------------------

-- ROL ADMINISTRADOR

insert into vista values("70","/Views/Administrador/Contenido/CrearContenido.aspx","activo","Crear Contenido","mdi mdi-check-all","4");
insert into vista values("71","/Views/Administrador/Contenido/ConsultarContenido.aspx","activo","Consultar Contenido","mdi mdi-check-all","4");
insert into vista values("72","/Views/Administrador/Contenido/EditarContenido.aspx","activo","Editar Contenido","mdi mdi-check-all","4");
insert into vista values("73","/Views/Administrador/Contenido/EliminarContenido.aspx","activo","Eliminar Contenido","mdi mdi-check-all","4");


-- --------------------------------------------------
-- GESTIONAR PRUEBA 90 - 110                       |
-- --------------------------------------------------
-- ROL ADMINISTRADOR
insert into vista values("90","/Views/Administrador/Prueba/CrearPrueba.aspx","activo","Crear Prueba","mdi mdi-check-all","5");
insert into vista values("91","/Views/Administrador/Prueba/ConsultarPrueba.aspx","activo","Consultar Prueba","mdi mdi-check-all","5");
insert into vista values("92","/Views/Administrador/Prueba/EditarPrueba.aspx","activo","Editar Prueba","mdi mdi-check-all","5");
insert into vista values("93","/Views/Administrador/Prueba/EliminarPrueba.aspx","activo","Eliminar Prueba","mdi mdi-check-all","5");
insert into vista values("94","/Views/Administrador/Prueba/AsignarPregunta.aspx","activo","Asignar pregunta","mdi mdi-check-all","5");
insert into vista values("95","/Views/Administrador/Prueba/AsignarSancion.aspx","activo","Asignar sanciones","mdi mdi-check-all","5");
insert into vista values("96","/Views/Administrador/Prueba/VerSancionesAsignadas.aspx","activo","ver sanciones asignadas","mdi mdi-check-all","5");
insert into vista values("97","/Views/Administrador/Prueba/VerPreguntasAsignadas.aspx","activo","ver preguntas asignadas","mdi mdi-check-all","5");
-- ROL JUGADOR

-- --------------------------------------------------
-- GESTIONAR USUARIO 90 - 119                       |
-- --------------------------------------------------
-- ROL ADMINISTRADOR

-- ROL JUGADOR

-- --------------------------------------------------
-- GESTIONAR MENU 120 - 139                       |
-- --------------------------------------------------
insert into vista values("120","/Views/Administrador/Menu Dic/CrearMenuPadre.aspx","activo","Crear Menu","mdi mdi-check-all","1");
insert into vista values("121","/Views/Administrador/Menu Dic/ConsultarMenu.aspx","activo","Consultar Menu","mdi mdi-check-all","1");
insert into vista values("122","/Views/Administrador/Menu Dic/EditarMenu.aspx","activo","Editar Menu","mdi mdi-check-all","1");
insert into vista values("123","/Views/Administrador/Menu Dic/EliminarMenu.aspx","activo","Eliminar Menu","mdi mdi-check-all","1");




-- --------------------------------------------------
-- GESTIONAR SUB MENU 140 - 160                       |
-- --------------------------------------------------
insert into vista values("140","/Views/Administrador/Sub Menu/CrearMenuHijo.aspx","activo","Crear Sub Menu","mdi mdi-check-all","2");
insert into vista values("141","/Views/Administrador/Menu Dic/ConsultarMenu.aspx","activo","Consultar Sub Menu","mdi mdi-check-all","2");
insert into vista values("142","/Views/Administrador/Sub Menu/EditarSubMenu.aspx","activo","Editar Sub Menu","mdi mdi-check-all","2");
insert into vista values("143","/Views/Administrador/Sub Menu/EliminarSubMenu.aspx","activo","Eliminar Sub Menu","mdi mdi-check-all","2");
-- -----------------------------------------------------------------------------------------------------------------------------
-- -----------------------------------------------------------------------------------------------------------------------------
-- --------------------------------------------------
-- GESTIONAR Pregunta 170 - 190                       |
-- --------------------------------------------------
insert into vista values("170","/Views/Administrador/Pregunta/CrearPregunta.aspx","activo","Crear pregunta","mdi mdi-check-all","6");
insert into vista values("171","/Views/Administrador/Pregunta/ListarPreguntas.aspx","activo","Listar pregunta","mdi mdi-check-all","6");


-- --------------------------------------------------
-- GESTIONAR  SANCION 190 - 210                       |
-- --------------------------------------------------
insert into vista values("190","/Views/Administrador/Sancion/CrearSancion.aspx","activo","Crear sancion","mdi mdi-check-all","7");
insert into vista values("191","/Views/Administrador/Sancion/ListarSancion.aspx","activo","Listar sancion","mdi mdi-check-all","7");

-- --------------------------------------------------
-- GESTIONAR PREMIACION 210 - 230                       |
-- --------------------------------------------------
insert into vista values("210","/Views/Administrador/Premiacion/CrearPremiacion.aspx","activo","Crear premiacion","mdi mdi-check-all","8");
insert into vista values("211","/Views/Administrador/Premiacion/ListarPremiacion.aspx","activo","Listar premiacion","mdi mdi-check-all","8");


-- --------------------------------------------------
-- MODULOS USUARIOS 231 - 250                       |
-- --------------------------------------------------

insert into vista VALUES("231","/Views/VistasJugador/ConsultaModulo/ListaModulo","activo","Ver Modulos","mdi mdi-check-all","9");


-- --------------------------------------------------
-- RANKING USUARIOS 251 - 270                       |
-- --------------------------------------------------

insert into vista VALUES("251","/Views/VistasJugador/Ranking/Ranking.aspx","activo","Ver Ranking","mdi mdi-check-all","10");

-- ------------------------------------------------------------------------------------------------------------------------
-- ------------------------------------------------------------------------------------------------------------------------
insert into rol values("1","admin ","administrador");
insert into rol values("2","jugador","jugador");

-- ------------------------------------------------------------------------------------------------------------------------
-- ------------------------------------------------------------------------------------------------------------------------






-- --------------------------------------------------
-- GESTIONAR MODULO 1 - 19                       |
-- --------------------------------------------------

insert into vista_rol values("1","3","3","1");
insert into vista_rol values("2","50","3","1");
insert into vista_rol values("3","51","3","1");
insert into vista_rol values("4","52","3","1");
insert into vista_rol values("5","53","3","1");


-- --------------------------------------------------
-- GESTIONAR MODULO  MENU    Jugaddor                 |
-- --------------------------------------------------
insert into vista_rol values("8","9","9","2");


-- --------------------------------------------------
-- GESTIONAR RANKING  MENU    Jugaddor                 |
-- --------------------------------------------------
insert into vista_rol VALUES("9","10","10","2");


-- --------------------------------------------------
-- GESTIONAR CONTENIDO 20 - 39                       |
-- --------------------------------------------------
insert into vista_rol values("20","4","4","1");
insert into vista_rol values("21","70","4","1");
insert into vista_rol values("22","71","4","1");
insert into vista_rol values("23","72","4","1");
insert into vista_rol values("24","73","4","1");

-- --------------------------------------------------
-- GESTIONAR PRUEBA 40 - 69                       |
-- --------------------------------------------------
insert into vista_rol values("40","5","5","1");
insert into vista_rol values("41","90","5","1");
insert into vista_rol values("42","91","5","1");
insert into vista_rol values("43","92","5","1");
insert into vista_rol values("44","93","5","1");
insert into vista_rol values("45","94","5","1");
insert into vista_rol values("46","95","5","1");
insert into vista_rol values("47","96","5","1");
insert into vista_rol values("48","97","5","1");
-- --------------------------------------------------
-- GESTIONAR Menu 70 - 89                       |
-- --------------------------------------------------

-- --------------------------------------------------
-- GESTIONAR Menu90 - 109                       |
-- --------------------------------------------------
insert into vista_rol values("90","1","1","1");
insert into vista_rol values("91","120","1","1");
insert into vista_rol values("92","121","1","1");
insert into vista_rol values("93","122","1","1");
insert into vista_rol values("94","123","1","1");


-- --------------------------------------------------
-- GESTIONAR  sub menu 110 - 119                       |
-- --------------------------------------------------
insert into vista_rol values("110","2","2","1");
insert into vista_rol values("111","140","2","1");
insert into vista_rol values("112","141","2","1");
insert into vista_rol values("113","142","2","1");
insert into vista_rol values("114","143","2","1");

-- --------------------------------------------------
-- GESTIONAR  sub menu 120 - 140                       |
-- --------------------------------------------------
insert into vista_rol values("120","6","6","1");
insert into vista_rol values("121","170","6","1");
insert into vista_rol values("122","171","6","1");
-- --------------------------------------------------
-- GESTIONAR  sub menu 140 - 160                       |
-- --------------------------------------------------
insert into vista_rol values("140","7","7","1");
insert into vista_rol values("141","190","7","1");
insert into vista_rol values("142","191","7","1");


-- --------------------------------------------------
-- GESTIONAR  sub menu 160 - 180                       |
-- --------------------------------------------------
insert into vista_rol values("160","8","8","1");
insert into vista_rol values("161","210","8","1");
insert into vista_rol values("162","211","8","1");



-- --------------------------------------------------
-- GESTIONAR MODULO  SUBMENU    Jugaddor                 |
-- --------------------------------------------------
insert into vista_rol VALUES("180","231","9","2");

-- --------------------------------------------------
-- RANKING SUBMENU    Jugaddor                 |
-- --------------------------------------------------
insert into vista_rol VALUES("200","251","10","2");



-- ------------------------------------------------------------------------------------------------------------
-- -------------------------------------------------------------------------------------------------------------
insert into usuario values("1","aticristian@hotmail.com","1234","A");

insert into usuario values("2","rosamaria@hotmail.com","rosa","J");
insert into usuario values("3","danielcamargo@hotmail.com","daniel","J");
insert into usuario values("4","jose@hotmail.com","jose","J");
-- -----------------------------------------------------------------------------------------------------------------
-- -----------------------------------------------------------------------------------------------------------------

insert into administrador values("1","Cristian Alberto"," Tisoy Hurtado","A","1");
-- -------------------------------------------------------------------------------------------------------------
-- --------------------------------------------------------------------------------------------------------------
insert into programa values("1","Ingenieria de Sistemas","A");
insert into programa values("2","Ingenieria de Alimentos","A");
insert into programa values("3","Ingenieria de Agroecologica","A");
insert into programa values("4","Licencitura en Ingles","A");
insert into programa values("5","Licencitura en Sociales","A");



insert into jugador values("1","123","Rosa","Maria","Celedon","Solarte",4,"rosamaria@hotmail.com","A","2","1");
insert into jugador values("2","345","Daniel","Andres","Calamargo","Andrade",5,"danielcamargo@hotmail.com","A","3","2");
insert into jugador values("3","567","Jose","Milton","Suarez","Pino",7,"jose@hotmail.com","A","4","3");

-- ----------------------------------------------------------------------------------------------------------------------
-- ---------------------------------------------------------------------------------------------------------------------
insert into rol_usuario values("1","1","A","A");
insert into rol_usuario values("2","1","A","J");
insert into rol_usuario values("2","2","A","J");
insert into rol_usuario values("2","3","A","J");


-- ----------------------------------------------------------------------
-- ---------------------------------------------------------------------------
insert into empresa values('1','Aprender.+','Empresa de juegos Uniamazonia','1210111');

-- ----------------------------------------------------------------------
-- ---------------------------------------------------------------------------


-- ----------------------------------------------------------------------
-- ---------------------------------------------------------------------------

insert into modulo values('1',"Bienestar universitario",'../../../FotosBD/moduloFotos/la%20universidad.jpg','A');
insert into modulo values('2',"Academia",'../../../FotosBD/moduloFotos/normativa.jpg','A');
insert into modulo values('3',"Deportes",'../../../FotosBD/moduloFotos/gestion%20institucional.jpg','A');
insert into modulo values('4',"Servicios",'../../../FotosBD/moduloFotos/servicios.jpg','A');

-- -------------------------------------------------------------------------
-- -----------------------------------------------------------------------------------------
insert into inicio values('1','Vision','Los proyectos de formación virtual deben entenderse en el marco de una estrategia integral de desarrollo del talento, orientada al logro de los objetivos de las empresas y organizaciones, y la mejora de sus niveles de competitividad.','../../Images/paisaje%202%20carrusel.jpg','A','active','J');
insert into inicio values('2','Mision','Descargue en formato pdf nuestro mapa conceptual del e-learning','../../Images/paisaje%201%20carrusel.jpg','A','','J');
insert into inicio values('3','Objetivo','Mientras que a las instituciones educativas les proporciona','../../Images/paisaje%203%20carrusel.jpg','A','','J');


-- -------------------------------------------------------------------------
-- -----------------------------------------------------------------------------------------
insert into contenido values('1',"Enfermeria","Este es un serivicio que brinda bienestar universotario para toda la comunidad universitaria","/images/univer.jpg","A",'1');
insert into contenido values('2',"Danzas","Programa cultural que se brinda para que los estudiantes aprendan danzas nacionales","/images/univer.jpg","A",'1');
insert into contenido values('3',"Deportes","Espacio de recreación para toda la comunidad universitaria","/images/univer.jpg","A",'1');

insert into contenido values('4',"Programas acedemicos","Organismo de la institución representativo de una profesión","/images/univer.jpg","A",'2');
insert into contenido values('5',"Facultades","Organismo representativo de varias carreras","/images/univer.jpg","A",'2');
insert into contenido values('6',"Docentes","Cuerpo de docentes de la institución","/images/univer.jpg","A",'2');

insert into contenido values('7',"Futbol","Deporte que aplica para equipo de planta","/images/univer.jpg","A",'3');
insert into contenido values('8',"Rugby","Deporte no consilidado para equipo de planta","/images/univer.jpg","A",'3');
insert into contenido values('9',"Baloncesto","Deporte integral","/images/univer.jpg","A",'3');

insert into contenido values('10',"Cafeterias","Servicio de alimentación para la comunidad universitaria","/images/univer.jpg","A",'4');
insert into contenido values('11',"Educación","Servicio de educación para toda la comunidad caqueteña","/images/univer.jpg","A",'4');
insert into contenido values('12',"Parqueaderos","Servicio de aparcamiento para toda la comunidad universitaria","/images/univer.jpg","A",'4');


-- ---------------------------------------------------------------------------------------------------------------------------------------------
-- -----------------------------------------------------------------------------------------------------------------------------------------------

insert into prueba values('1',"Prueba de enfermeria",'A','1');
insert into prueba values('2',"Prueba programas académicos",'A','4');
insert into prueba values('3',"Prueba de futbol",'A','7');
insert into prueba values('4',"Prueba de cafeterias",'A','10');


-- ------------------------------------------------------------------------------------------------------------------------------
-- --------------------------------------------------------------------------------------------------------------------------------------

INSERT INTO pregunta VALUES ("1","¿En que año fue fundada la enfermeria de la universidad?","0","1",1,"1");
INSERT INTO pregunta VALUES ("2","¿Cuantos servicios se ofrecen en enfermeria?","0","1",1,"1");
INSERT INTO pregunta VALUES ("3","¿En donde se encuentra ubicada el servcios de enfermeria en la sede principal?","0","1",1,"1");
INSERT INTO pregunta VALUES ("4","¿Enfermeria es una dependencia de?","0","0",1,"1");
INSERT INTO pregunta VALUES ("5","¿El serivicio de enfermeria es exclusivo para?","0","1",1,"1");

insert INTO pregunta VALUES ("6","¿Quien es la representate de los estudiantes?","1","0",NULL,"0");
insert INTO pregunta VALUES ("7","¿Cuantos programa academicos tiene la UA?","1","0",NULL,"0");
insert INTO pregunta VALUES ("8","¿Cuantas facultades tien la UA?","1","0",NULL,"0");
insert INTO pregunta VALUES ("9","¿En que año fue creada la UA?","1","0",NULL,"0");
insert INTO pregunta VALUES ("10","¿Cuantos programa acreditados tiene la AU?","1","0",NULL,"0");
insert INTO pregunta VALUES ("11","¿Cuantos docentes tiene la AU?","1","0",NULL,"0");
insert INTO pregunta VALUES ("12","¿Quien es el vicerrector academico?","1","0",NULL,"0");
insert INTO pregunta VALUES ("13","¿Cuantas disciplinas deportivas hay en la UA?","1","0",NULL,"0");
insert INTO pregunta VALUES ("14","¿Con que universidades tiene convenio la UA?","1","0",NULL,"0");
insert INTO pregunta VALUES ("15","¿Cuantos estusiantes hay en la UA?","1","0",NULL,"0");


-- ------------------------------------------------------------------------------------------------------------------------------
-- --------------------------------------------------------------------------------------------------------------------------------------
insert into sancion values ("1","Sancion de deportes","https://www.youtube.com/watch?v=_NNGB-jQhtU&t=52s","0");
insert into sancion values ("2","Sancion de Cultura general","https://www.youtube.com/watch?v=_NNGB-jQhtU&t=52s","0");
insert into sancion values ("3","Sancion de informativa","https://www.youtube.com/watch?v=_NNGB-jQhtU&t=52s","0");
insert into sancion values ("4","Sancion Conociendo la UA","https://www.youtube.com/watch?v=_NNGB-jQhtU&t=52s","0");
insert into sancion values ("5","Sancion programas academicos","https://www.youtube.com/watch?v=_NNGB-jQhtU&t=52s","0");

-- ------------------------------------------------------------------------------------------------------------------------------
-- --------------------------------------------------------------------------------------------------------------------------------------

INSERT INTO respuesta VALUES ("1","2016","2018","2017","2015","2017","A","1");
INSERT INTO respuesta VALUES ("2","5","2","6","4","6","A","2");
INSERT INTO respuesta VALUES ("3","Bloque 7","Bloque 3","Bloque 1","Bloque auditorio","Bloque auditorio","A","3");
INSERT INTO respuesta VALUES ("4","Bienestar universitario","Facultad","Sistemas","Vigilancia","Bienestar universitario","A","4");
INSERT INTO respuesta VALUES ("5","Docentes","Todos","Funcionarios","Estdudiantes","Todos","A","5");

insert into respuesta VALUES ("6","Karina","Carolina","Julio","Marcos","Karina","A","6");
insert into respuesta VALUES ("7","26","23","12","37","23","A","7");
insert into respuesta VALUES ("8","5","6","3","7","5","A","8");
insert into respuesta VALUES ("9","1890","1960","1971","1950","1971","A","9");
insert into respuesta VALUES ("10","4","10","7","9","5","A","10");
insert into respuesta VALUES ("11","115","200","150","220","115","A","11");
insert into respuesta VALUES ("12","Andres Villamizar","Antonio Pastrana","Julio Oyola","Martin Restrepo","Andres Villamizar","A","12");
insert into respuesta VALUES ("13","4","12","20","8","8","A","13");
insert into respuesta VALUES ("14","U Antioquia","U Nacional","U Tolima","U del Atlantico","U Tolima","A","14");
insert into respuesta VALUES ("15","9500","10000","500","890","10000","A","15");
-- ------------------------------------------------------------------------------------------------------------------------------
-- --------------------------------------------------------------------------------------------------------------------------------------
insert into icono values('1','mdi mdi-account-convert','A');
insert into icono values('2','mdi mdi-apple','D');
insert into icono values('3','mdi mdi-arrange-bring-forward','A');
insert into icono values('4','mdi mdi-arrow-expand-all','A');
insert into icono values('5','mdi mdi-barcode-scan','D');
insert into icono values('6','mdi mdi-clipboard-text','A');
insert into icono values('7','mdi mdi-rss','A');
insert into icono values('8','mdi mdi-server','A');
insert into icono values('9','mdi mdi-shopping','A');
insert into icono values('10','mdi mdi-tag-multiple','D');
insert into icono values('11','mdi mdi-vector-difference-ab','A');
insert into icono values('12','mdi mdi-view-grid','A');
insert into icono values('13','mdi mdi-web','D');
insert into icono values('14','mdi mdi-whatsapp','D');
insert into icono values('15','mdi mdi-traffic-light','A');
insert into icono values('16','mdi mdi-tag-faces','A');
insert into icono values('17','mdi mdi-table-edit','A');
insert into icono values('18','mdi mdi-shopping-music','A');
insert into icono values('19','mdi mdi-security','D');
insert into icono values('20','mdi mdi-puzzle','A');
insert into icono values('21','mdi mdi-radar','A');
insert into icono values('22','mdi mdi-view-list','D');
insert into icono values('23','mdi mdi-houzz','D');
insert into icono values('24','mdi mdi-vlc','D');
insert into icono values('25','mdi mdi-book-open','D');
