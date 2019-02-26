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


-- SUBMENU ROL JUGADOR


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

-- ------------------------------------------------------------------------------------------------------
-- ---------------------------------------------------------------------------------------------

-- --------------------------------------------------
-- GESTIONAR TABLAS BASICAS 231- 250                       |
-- --------------------------------------------------
insert into vista values("231","/Views/Administrador/Icono/Iconos.aspx","activo","Gestionar Iconos","mdi mdi-check-all","9");
insert into vista values("232","/Views/Administrador/Programa/Programa.aspx","activo","Gestionar Programas","mdi mdi-check-all","9");
insert into vista values("233","/Views/Administrador/Empresa/EditarEmpresa.aspx","activo","Gestionar Empresa","mdi mdi-check-all","9");


-- ------------------------------------------------------------------------------------------------------
-- ---------------------------------------------------------------------------------------------
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
-- GESTIONAR MODULO 1 - 19      Jugaddor                 |
-- --------------------------------------------------

insert into vista_rol values("10","3","3","2");
insert into vista_rol values("11","54","3","2");


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
-- GESTIONAR  tablas basicas 181 - 200                       |
-- --------------------------------------------------
insert into vista_rol values("181","9","9","1");
insert into vista_rol values("182","231","9","1");
insert into vista_rol values("183","232","9","1");
insert into vista_rol values("184","233","9","1");




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

insert into premiacion values('1','120','1','0','1');
insert into premiacion values('2','240','2','0','2');
insert into premiacion values('3','370','3','0','3');

-- ----------------------------------------------------------------------
-- ---------------------------------------------------------------------------

insert into modulo values('1','La Universidad','../../../FotosBD/moduloFotos/la%20universidad.jpg','A');
insert into modulo values('2','Normatividad','../../../FotosBD/moduloFotos/normativa.jpg','A');
insert into modulo values('3','Gestion Institucional','../../../FotosBD/moduloFotos/gestion%20institucional.jpg','A');
insert into modulo values('4','Servicio de informacion','../../../FotosBD/moduloFotos/servicios.jpg','A');
insert into modulo values('5','Acreditacion','../../../FotosBD/moduloFotos/acreditacion.png','A');
insert into modulo values('6','Editorial Uniamazonia','../../../FotosBD/moduloFotos/editorial.jpg','A');
insert into modulo values('7','Salas y vehiculos','../../../FotosBD/moduloFotos/vehiculos.png','A');
insert into modulo values('8','Estatutos','../../../FotosBD/moduloFotos/estatuto.jpg','A');
insert into modulo values('9','Medio Ambiente','../../../FotosBD/moduloFotos/aprender.jpg','A');
-- -------------------------------------------------------------------------
-- -----------------------------------------------------------------------------------------
insert into inicio values('1','Vision','Los proyectos de formación virtual deben entenderse en el marco de una estrategia integral
                        de desarrollo del talento, orientada al logro de los objetivos de las empresas y organizaciones, y la mejora de sus niveles de competitividad.','../../Images/uniamazonia.jpg','A','active','J');
insert into inicio values('2','Mision','Descargue en formato pdf nuestro mapa conceptual del e-learning','../../Images/biblioteca.jpg','A','','J');
insert into inicio values('3','Objetivo','Mientras que a las instituciones educativas les proporciona','../../Images/auditorio.jpg','A','','J');


-- -------------------------------------------------------------------------
-- -----------------------------------------------------------------------------------------
insert into contenido values('1',' la universidad 1','Cras sit amet nibh libero, in gravida nulla. Nulla vel metus scelerisque ante sollicitudin. Cras purus odio, vestibulum in vulputate at, tempus viverra turpis. Fusce condimentum nunc ac nisi vulputate fringilla. Donec lacinia congue felis in faucibus.','/images/univer.jpg','A','1');
insert into contenido values('2',' la universidad 2','Cras sit amet nibh libero, in gravida nulla. Nulla vel metus scelerisque ante sollicitudin. Cras purus odio, vestibulum in vulputate at, tempus viverra turpis. Fusce condimentum nunc ac nisi vulputate fringilla. Donec lacinia congue felis in faucibus.','/images/univer.jpg','A','1');
insert into contenido values('3',' la universidad 3','Cras sit amet nibh libero, in gravida nulla. Nulla vel metus scelerisque ante sollicitudin. Cras purus odio, vestibulum in vulputate at, tempus viverra turpis. Fusce condimentum nunc ac nisi vulputate fringilla. Donec lacinia congue felis in faucibus.','/images/univer.jpg','A','1');
insert into contenido values('4',' la universidad 4','Cras sit amet nibh libero, in gravida nulla. Nulla vel metus scelerisque ante sollicitudin. Cras purus odio, vestibulum in vulputate at, tempus viverra turpis. Fusce condimentum nunc ac nisi vulputate fringilla. Donec lacinia congue felis in faucibus.','/images/univer.jpg','A','1');

insert into contenido values('5',' Normatividad 1','Cras sit amet nibh libero, in gravida nulla. Nulla vel metus scelerisque ante sollicitudin. Cras purus odio, vestibulum in vulputate at, tempus viverra turpis. Fusce condimentum nunc ac nisi vulputate fringilla. Donec lacinia congue felis in faucibus.','/images/univer.jpg','A','2');
insert into contenido values('6',' Normatividad 2','Cras sit amet nibh libero, in gravida nulla. Nulla vel metus scelerisque ante sollicitudin. Cras purus odio, vestibulum in vulputate at, tempus viverra turpis. Fusce condimentum nunc ac nisi vulputate fringilla. Donec lacinia congue felis in faucibus.','/images/univer.jpg','A','2');
insert into contenido values('7',' Normatividad 3','Cras sit amet nibh libero, in gravida nulla. Nulla vel metus scelerisque ante sollicitudin. Cras purus odio, vestibulum in vulputate at, tempus viverra turpis. Fusce condimentum nunc ac nisi vulputate fringilla. Donec lacinia congue felis in faucibus.','/images/univer.jpg','A','2');
insert into contenido values('8',' Normatividad 4','Cras sit amet nibh libero, in gravida nulla. Nulla vel metus scelerisque ante sollicitudin. Cras purus odio, vestibulum in vulputate at, tempus viverra turpis. Fusce condimentum nunc ac nisi vulputate fringilla. Donec lacinia congue felis in faucibus.','/images/univer.jpg','A','2');

insert into contenido values('9',' Gestion Institucional 1','Cras sit amet nibh libero, in gravida nulla. Nulla vel metus scelerisque ante sollicitudin. Cras purus odio, vestibulum in vulputate at, tempus viverra turpis. Fusce condimentum nunc ac nisi vulputate fringilla. Donec lacinia congue felis in faucibus.','/images/univer.jpg','A','3');
insert into contenido values('10',' Gestion Institucional 2','Cras sit amet nibh libero, in gravida nulla. Nulla vel metus scelerisque ante sollicitudin. Cras purus odio, vestibulum in vulputate at, tempus viverra turpis. Fusce condimentum nunc ac nisi vulputate fringilla. Donec lacinia congue felis in faucibus.','/images/univer.jpg','A','3');
insert into contenido values('11',' Gestion Institucional 3','Cras sit amet nibh libero, in gravida nulla. Nulla vel metus scelerisque ante sollicitudin. Cras purus odio, vestibulum in vulputate at, tempus viverra turpis. Fusce condimentum nunc ac nisi vulputate fringilla. Donec lacinia congue felis in faucibus.','/images/univer.jpg','A','3');
insert into contenido values('12',' Gestion Institucional 4','Cras sit amet nibh libero, in gravida nulla. Nulla vel metus scelerisque ante sollicitudin. Cras purus odio, vestibulum in vulputate at, tempus viverra turpis. Fusce condimentum nunc ac nisi vulputate fringilla. Donec lacinia congue felis in faucibus.','/images/univer.jpg','A','3');

insert into contenido values('13',' Servicio de informacion 1','Cras sit amet nibh libero, in gravida nulla. Nulla vel metus scelerisque ante sollicitudin. Cras purus odio, vestibulum in vulputate at, tempus viverra turpis. Fusce condimentum nunc ac nisi vulputate fringilla. Donec lacinia congue felis in faucibus.','/images/univer.jpg','A','4');
insert into contenido values('14',' Servicio de informacion 2','Cras sit amet nibh libero, in gravida nulla. Nulla vel metus scelerisque ante sollicitudin. Cras purus odio, vestibulum in vulputate at, tempus viverra turpis. Fusce condimentum nunc ac nisi vulputate fringilla. Donec lacinia congue felis in faucibus.','/images/univer.jpg','A','4');
insert into contenido values('15',' Servicio de informacion 3','Cras sit amet nibh libero, in gravida nulla. Nulla vel metus scelerisque ante sollicitudin. Cras purus odio, vestibulum in vulputate at, tempus viverra turpis. Fusce condimentum nunc ac nisi vulputate fringilla. Donec lacinia congue felis in faucibus.','/images/univer.jpg','A','4');
insert into contenido values('16',' Servicio de informacion 4','Cras sit amet nibh libero, in gravida nulla. Nulla vel metus scelerisque ante sollicitudin. Cras purus odio, vestibulum in vulputate at, tempus viverra turpis. Fusce condimentum nunc ac nisi vulputate fringilla. Donec lacinia congue felis in faucibus.','/images/univer.jpg','A','4');

insert into contenido values('17',' Acreditacion 1','Cras sit amet nibh libero, in gravida nulla. Nulla vel metus scelerisque ante sollicitudin. Cras purus odio, vestibulum in vulputate at, tempus viverra turpis. Fusce condimentum nunc ac nisi vulputate fringilla. Donec lacinia congue felis in faucibus.','/images/univer.jpg','A','5');
insert into contenido values('18',' Acreditacion 2','Cras sit amet nibh libero, in gravida nulla. Nulla vel metus scelerisque ante sollicitudin. Cras purus odio, vestibulum in vulputate at, tempus viverra turpis. Fusce condimentum nunc ac nisi vulputate fringilla. Donec lacinia congue felis in faucibus.','/images/univer.jpg','A','5');
insert into contenido values('19',' Acreditacion 3','Cras sit amet nibh libero, in gravida nulla. Nulla vel metus scelerisque ante sollicitudin. Cras purus odio, vestibulum in vulputate at, tempus viverra turpis. Fusce condimentum nunc ac nisi vulputate fringilla. Donec lacinia congue felis in faucibus.','/images/univer.jpg','A','5');
insert into contenido values('20',' Acreditacion 4','Cras sit amet nibh libero, in gravida nulla. Nulla vel metus scelerisque ante sollicitudin. Cras purus odio, vestibulum in vulputate at, tempus viverra turpis. Fusce condimentum nunc ac nisi vulputate fringilla. Donec lacinia congue felis in faucibus.','/images/univer.jpg','A','5');

-- ---------------------------------------------------------------------------------------------------------------------------------------------
-- -----------------------------------------------------------------------------------------------------------------------------------------------

insert into prueba values('1','prueba universidad 1','A','1');
insert into prueba values('2','prueba universidad 2','A','1');
insert into prueba values('3','prueba universidad 3','A','1');
insert into prueba values('4','prueba universidad 4','A','1');

insert into prueba values('5','prueba normatividad 1','A','2');
insert into prueba values('6','prueba normatividad 2','A','2');
insert into prueba values('7','prueba noramtividad 3','A','2');
insert into prueba values('8','prueba normatividad 4','A','2');

insert into prueba values('9','prueba getion institucional 1','A','3');
insert into prueba values('10','prueba getion institucional 2','A','3');
insert into prueba values('11','prueba getion institucional 3','A','3');
insert into prueba values('12','prueba getion institucional 4','A','3');

insert into prueba values('13','prueba servicio de informacio 1','A','4');
insert into prueba values('14','prueba servicio de informacio 2','A','4');
insert into prueba values('15','prueba servicio de informacio 3','A','4');
insert into prueba values('16','prueba servicio de informacio 4','A','4');


-- ------------------------------------------------------------------------------------------------------------------------------
-- --------------------------------------------------------------------------------------------------------------------------------------
insert INTO pregunta values ("1","¿Quien es la representate de los estudiantes?","0","0",NULL,"0");
insert INTO pregunta values ("2","¿Cuantos programa academicos tiene la UA?","0","0",NULL,"0");
insert INTO pregunta values ("3","¿Cuantas facultades tien la UA?","0","0",NULL,"0");
insert INTO pregunta values ("4","¿En que año fue creada la UA?","0","0",NULL,"0");
insert INTO pregunta values ("5","¿Cuantos programa acreditados tiene la AU?","0","0",NULL,"0");
insert INTO pregunta values ("6","¿Cuantos docentes tiene la AU?","0","0",NULL,"0");
insert INTO pregunta values ("7","¿Quien es el vicerrector academico?","0","0",NULL,"0");
insert INTO pregunta values ("8","¿Cuantas disciplinas deportivas hay en la UA?","0","0",NULL,"0");
insert INTO pregunta values ("9","¿Con que universidades tiene convenio la UA?","0","0",NULL,"0");
insert INTO pregunta values ("10","¿Cuantos estusiantes hay en la UA?","0","0",NULL,"0");


-- ------------------------------------------------------------------------------------------------------------------------------
-- --------------------------------------------------------------------------------------------------------------------------------------
insert into sancion values ("1","Sancion de deportes","https://www.youtube.com/watch?v=_NNGB-jQhtU&t=52s","0");
insert into sancion values ("2","Sancion de Cultura general","https://www.youtube.com/watch?v=_NNGB-jQhtU&t=52s","0");
insert into sancion values ("3","Sancion de informativa","https://www.youtube.com/watch?v=_NNGB-jQhtU&t=52s","0");
insert into sancion values ("4","Sancion Conociendo la UA","https://www.youtube.com/watch?v=_NNGB-jQhtU&t=52s","0");
insert into sancion values ("5","Sancion programas academicos","https://www.youtube.com/watch?v=_NNGB-jQhtU&t=52s","0");

-- ------------------------------------------------------------------------------------------------------------------------------
-- --------------------------------------------------------------------------------------------------------------------------------------

insert into respuesta VALUES ("1","Karina","Carolina","Julio","Marcos","Karina","A","1"); 
insert into respuesta VALUES ("2","26","23","12","37","23","A","2");
insert into respuesta VALUES ("3","5","6","3","7","5","A","3");
insert into respuesta VALUES ("4","1890","1960","1971","1950","1971","A","4");
insert into respuesta VALUES ("5","4","10","7","9","5","A","5");
insert into respuesta VALUES ("6","115","200","150","220","115","A","6");
insert into respuesta VALUES ("7","Andres Villamizar","Antonio Pastrana","Julio Oyola","Martin Restrepo","Andres Villamizar","A","7");
insert into respuesta VALUES ("8","4","12","20","8","8","A","8");
insert into respuesta VALUES ("9","U Antioquia","U Nacional","U Tolima","U del Atlantico","U Tolima","A","9");
insert into respuesta VALUES ("10","9500","10000","500","890","10000","A","10");
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
