
-- -----------------------------------------------------
-- Schema aprender
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema aprender
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `aprender` DEFAULT CHARACTER SET utf8 ;
USE `aprender` ;

-- -----------------------------------------------------
-- Table `aprender`.`Modulo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `aprender`.`Modulo` (
  `id_modulo` INT NOT NULL AUTO_INCREMENT,
  `nombre_modulo` VARCHAR(45) NULL,
  `irl_img_modelo` VARCHAR(700) NULL,
  `estado_modulo` VARCHAR(45) NULL,
  PRIMARY KEY (`id_modulo`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `aprender`.`Contenido`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `aprender`.`Contenido` (
  `id_contenido` INT NOT NULL AUTO_INCREMENT,
  `nombre_contenido` VARCHAR(45) NULL,
  `descripcion_contenido` VARCHAR(500) NULL,
  `url_img_contenido` VARCHAR(700) NULL,
  `estado_contenido` VARCHAR(45) NULL,
  `fk_id_modulo` INT NULL,
  PRIMARY KEY (`id_contenido`),
  INDEX `fk_Contenido_Modulo1_idx` (`fk_id_modulo` ASC),
  CONSTRAINT `fk_Contenido_Modulo1`
    FOREIGN KEY (`fk_id_modulo`)
    REFERENCES `aprender`.`Modulo` (`id_modulo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `aprender`.`Prueba`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `aprender`.`Prueba` (
  `id_prueba` INT NOT NULL AUTO_INCREMENT,
  `nombre_prueba` VARCHAR(100) NULL,
  `numero_preguntas` INT NULL,
  `estado_prueba` VARCHAR(5) NULL,
  `fk_contenido` INT NULL,
  PRIMARY KEY (`id_prueba`),
  INDEX `fk_Prueba_Contenido1_idx` (`fk_contenido` ASC),
  CONSTRAINT `fk_Prueba_Contenido1`
    FOREIGN KEY (`fk_contenido`)
    REFERENCES `aprender`.`Contenido` (`id_contenido`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `aprender`.`Ayuda`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `aprender`.`Ayuda` (
  `id_ayuda` INT NOT NULL AUTO_INCREMENT,
  `titulo_ayuda` VARCHAR(45) NULL,
  `link_ayuda` VARCHAR(100) NULL,
  PRIMARY KEY (`id_ayuda`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `aprender`.`sancion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `aprender`.`sancion` (
  `idsancion` INT NOT NULL AUTO_INCREMENT,
  `descripcion` VARCHAR(45) NULL,
  `url_video` VARCHAR(100) NULL,
  `estado_sancion` VARCHAR(45) NULL,
  PRIMARY KEY (`idsancion`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `aprender`.`Pregunta`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `aprender`.`Pregunta` (
  `id_pregunta` INT NOT NULL AUTO_INCREMENT,
  `nombre_pregunta` VARCHAR(100) NULL,
  `calificacion` DOUBLE NULL,
  `estado_pregunta` VARCHAR(5) NULL,
  `fk_prueba` INT NULL,
  `fk_sancion` INT NULL,
  PRIMARY KEY (`id_pregunta`),
  INDEX `fk_Pregunta_Prueba1_idx` (`fk_prueba` ASC),
  INDEX `fk_Pregunta_sancion1_idx` (`fk_sancion` ASC),
  CONSTRAINT `fk_Pregunta_Prueba1`
    FOREIGN KEY (`fk_prueba`)
    REFERENCES `aprender`.`Prueba` (`id_prueba`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Pregunta_sancion1`
    FOREIGN KEY (`fk_sancion`)
    REFERENCES `aprender`.`sancion` (`idsancion`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `aprender`.`Respuesta`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `aprender`.`Respuesta` (
  `id_respuesta` INT NOT NULL AUTO_INCREMENT,
  `respuesta_a` VARCHAR(100) NULL,
  `respuesta_b` VARCHAR(100) NULL,
  `respuesta_c` VARCHAR(100) NULL,
  `respuesta_d` VARCHAR(100) NULL,
  `respuesta_correcta` VARCHAR(100) NULL,
  `estado_respuesta` VARCHAR(100) NULL,
  `fk_pregunta` INT NULL,
  PRIMARY KEY (`id_respuesta`),
  INDEX `fk_Respuesta_Pregunta1_idx` (`fk_pregunta` ASC),
  CONSTRAINT `fk_Respuesta_Pregunta1`
    FOREIGN KEY (`fk_pregunta`)
    REFERENCES `aprender`.`Pregunta` (`id_pregunta`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `aprender`.`Calificacion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `aprender`.`Calificacion` (
  `id_calificacion` INT NOT NULL AUTO_INCREMENT,
  `valor_calificacion` INT NULL,
  `fk_pregunta_calific` INT NULL,
  PRIMARY KEY (`id_calificacion`),
  INDEX `fk_Calificacion_Pregunta1_idx` (`fk_pregunta_calific` ASC),
  CONSTRAINT `fk_Calificacion_Pregunta1`
    FOREIGN KEY (`fk_pregunta_calific`)
    REFERENCES `aprender`.`Pregunta` (`id_pregunta`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `aprender`.`Tiempo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `aprender`.`Tiempo` (
  `id_tiempo` INT NOT NULL AUTO_INCREMENT,
  `tiempo_inicio` VARCHAR(45) NULL,
  `tiempo_final` VARCHAR(45) NULL,
  `fk_prueba` INT NULL,
  PRIMARY KEY (`id_tiempo`),
  INDEX `fk_Tiempo_Prueba1_idx` (`fk_prueba` ASC),
  CONSTRAINT `fk_Tiempo_Prueba1`
    FOREIGN KEY (`fk_prueba`)
    REFERENCES `aprender`.`Prueba` (`id_prueba`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `aprender`.`Usuario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `aprender`.`Usuario` (
  `id_usuario` INT NOT NULL,
  `nombre_usuario` VARCHAR(45) NULL,
  `password_usuario` VARCHAR(45) NULL,
  `privilegio_usuario` VARCHAR(45) NULL,
  PRIMARY KEY (`id_usuario`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `aprender`.`Programa`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `aprender`.`Programa` (
  `id_programa` INT NOT NULL AUTO_INCREMENT,
  `nombre_programa` VARCHAR(45) NULL,
  `estado_programa` VARCHAR(45) NULL,
  PRIMARY KEY (`id_programa`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `aprender`.`Jugador`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `aprender`.`Jugador` (
  `id_jugador` INT NOT NULL AUTO_INCREMENT,
  `nombre_1` VARCHAR(45) NULL,
  `nombre_2` VARCHAR(45) NULL,
  `apellido_1` VARCHAR(45) NULL,
  `apellido_2` VARCHAR(45) NULL,
  `semestre` INT NULL,
  `correo_electronico` VARCHAR(45) NULL,
  `estado_jugador` VARCHAR(45) NULL,
  `fk_usuario` INT NULL,
  `fk_programa` INT NULL,
  PRIMARY KEY (`id_jugador`),
  INDEX `fk_Jugador_Usuario1_idx` (`fk_usuario` ASC),
  INDEX `fk_Jugador_Programa1_idx` (`fk_programa` ASC),
  CONSTRAINT `fk_Jugador_Usuario1`
    FOREIGN KEY (`fk_usuario`)
    REFERENCES `aprender`.`Usuario` (`id_usuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Jugador_Programa1`
    FOREIGN KEY (`fk_programa`)
    REFERENCES `aprender`.`Programa` (`id_programa`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `aprender`.`Posicion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `aprender`.`Posicion` (
  `id_posicion` INT NOT NULL AUTO_INCREMENT,
  `puntaje` INT NULL,
  `numero_pruebas` INT NULL,
  `fk_id_jugador` INT NULL,
  PRIMARY KEY (`id_posicion`),
  INDEX `fk_Posicion_Jugador1_idx` (`fk_id_jugador` ASC),
  CONSTRAINT `fk_Posicion_Jugador1`
    FOREIGN KEY (`fk_id_jugador`)
    REFERENCES `aprender`.`Jugador` (`id_jugador`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `aprender`.`Administrador`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `aprender`.`Administrador` (
  `id_dministrador` INT NOT NULL AUTO_INCREMENT,
  `nombres_admin` VARCHAR(45) NULL,
  `apellidos_admin` VARCHAR(45) NULL,
  `estado_admin` VARCHAR(45) NULL,
  `fk_usuario` INT NULL,
  PRIMARY KEY (`id_dministrador`),
  INDEX `fk_Administrador_Usuario1_idx` (`fk_usuario` ASC),
  CONSTRAINT `fk_Administrador_Usuario1`
    FOREIGN KEY (`fk_usuario`)
    REFERENCES `aprender`.`Usuario` (`id_usuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `aprender`.`Rol`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `aprender`.`Rol` (
  `id_rol` INT NOT NULL AUTO_INCREMENT,
  `nombre_rol` VARCHAR(45) NULL,
  `descripcion` VARCHAR(45) NULL,
  PRIMARY KEY (`id_rol`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `aprender`.`Rol_Usuario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `aprender`.`Rol_Usuario` (
  `fk_id_rol` INT NOT NULL,
  `fk_usuario` INT NOT NULL,
  `estado_rol_usuario` VARCHAR(45) NULL,
  `tipo_rol_usuario` VARCHAR(45) NULL,
  PRIMARY KEY (`fk_id_rol`, `fk_usuario`),
  INDEX `fk_Rol_has_Usuario_Usuario1_idx` (`fk_usuario` ASC),
  INDEX `fk_Rol_has_Usuario_Rol1_idx` (`fk_id_rol` ASC),
  CONSTRAINT `fk_Rol_has_Usuario_Rol1`
    FOREIGN KEY (`fk_id_rol`)
    REFERENCES `aprender`.`Rol` (`id_rol`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Rol_has_Usuario_Usuario1`
    FOREIGN KEY (`fk_usuario`)
    REFERENCES `aprender`.`Usuario` (`id_usuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `aprender`.`Vista`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `aprender`.`Vista` (
  `id_vista` INT NOT NULL AUTO_INCREMENT,
  `url` VARCHAR(100) NULL,
  `estado` VARCHAR(45) NULL,
  `descripcion` VARCHAR(100) NULL,
  `icono` VARCHAR(45) NULL,
  `fk_master` INT NOT NULL,
  PRIMARY KEY (`id_vista`, `fk_master`),
  INDEX `fk_Vista_Vista1_idx` (`fk_master` ASC),
  CONSTRAINT `fk_Vista_Vista1`
    FOREIGN KEY (`fk_master`)
    REFERENCES `aprender`.`Vista` (`id_vista`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `aprender`.`Vista_Rol`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `aprender`.`Vista_Rol` (
  `id_vista_rol` INT NOT NULL AUTO_INCREMENT,
  `fk_id_vista` INT NOT NULL,
  `fk_master` INT NOT NULL,
  `fk_id_rol` INT NOT NULL,
  PRIMARY KEY (`id_vista_rol`, `fk_id_vista`, `fk_master`, `fk_id_rol`),
  INDEX `fk_Vista_Rol_Vista1_idx` (`fk_id_vista` ASC, `fk_master` ASC),
  INDEX `fk_Vista_Rol_Rol1_idx` (`fk_id_rol` ASC),
  CONSTRAINT `fk_Vista_Rol_Vista1`
    FOREIGN KEY (`fk_id_vista` , `fk_master`)
    REFERENCES `aprender`.`Vista` (`id_vista` , `fk_master`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Vista_Rol_Rol1`
    FOREIGN KEY (`fk_id_rol`)
    REFERENCES `aprender`.`Rol` (`id_rol`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `aprender`.`Jugador_Prueba`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `aprender`.`Jugador_Prueba` (
  `fk_pk_id_jugador` INT NOT NULL,
  `fk_pk_id_prueba` INT NOT NULL,
  `fecha_prueba` VARCHAR(45) NULL,
  `puntos_prueba` INT NULL,
  PRIMARY KEY (`fk_pk_id_jugador`, `fk_pk_id_prueba`),
  INDEX `fk_Jugador_has_Prueba_Prueba1_idx` (`fk_pk_id_prueba` ASC),
  INDEX `fk_Jugador_has_Prueba_Jugador1_idx` (`fk_pk_id_jugador` ASC),
  CONSTRAINT `fk_Jugador_has_Prueba_Jugador1`
    FOREIGN KEY (`fk_pk_id_jugador`)
    REFERENCES `aprender`.`Jugador` (`id_jugador`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Jugador_has_Prueba_Prueba1`
    FOREIGN KEY (`fk_pk_id_prueba`)
    REFERENCES `aprender`.`Prueba` (`id_prueba`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `aprender`.`Premiacion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `aprender`.`Premiacion` (
  `id_premiacion` INT NOT NULL AUTO_INCREMENT,
  `puntos_acomulados` INT NULL,
  `estrellas_obtenidas` INT NULL,
  `diamantes_obtenidos` INT NULL,
  `fk_jugador` INT NULL,
  PRIMARY KEY (`id_premiacion`),
  INDEX `fk_Premiacion_Jugador1_idx` (`fk_jugador` ASC),
  CONSTRAINT `fk_Premiacion_Jugador1`
    FOREIGN KEY (`fk_jugador`)
    REFERENCES `aprender`.`Jugador` (`id_jugador`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `aprender`.`Empresa`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `aprender`.`Empresa` (
  `id_empresa` INT NOT NULL AUTO_INCREMENT,
  `nombre_empresa` VARCHAR(45) NULL,
  `descripcion` VARCHAR(800) NULL,
  `nit_emprea` INT NULL,
  PRIMARY KEY (`id_empresa`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `aprender`.`Jugador_sancion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `aprender`.`Jugador_sancion` (
  `fk_jugador` INT NOT NULL,
  `fk_sancion` INT NOT NULL,
  `fecha_sancion` VARCHAR(45) NULL,
  PRIMARY KEY (`fk_jugador`, `fk_sancion`),
  INDEX `fk_Jugador_has_sancion_sancion1_idx` (`fk_sancion` ASC),
  INDEX `fk_Jugador_has_sancion_Jugador1_idx` (`fk_jugador` ASC),
  CONSTRAINT `fk_Jugador_has_sancion_Jugador1`
    FOREIGN KEY (`fk_jugador`)
    REFERENCES `aprender`.`Jugador` (`id_jugador`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Jugador_has_sancion_sancion1`
    FOREIGN KEY (`fk_sancion`)
    REFERENCES `aprender`.`sancion` (`idsancion`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `aprender`.`premios_referencia`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `aprender`.`premios_referencia` (
  `pk_premios_referencia` INT NOT NULL AUTO_INCREMENT,
  `puntos_referencia` INT NULL,
  `estrellas_referencia` INT NULL,
  PRIMARY KEY (`pk_premios_referencia`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `aprender`.`Icono`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `aprender`.`Icono` (
  `id_icono` INT NOT NULL AUTO_INCREMENT,
  `nombre_icono` VARCHAR(100) NULL,
  `estado_icono` VARCHAR(45) NULL,
  PRIMARY KEY (`id_icono`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `aprender`.`Numero_Preguntas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `aprender`.`Numero_Preguntas` (
  `id_numero_preguntas` INT NOT NULL AUTO_INCREMENT,
  `numero_pregunta` INT NULL,
  `estado_pregunta` VARCHAR(45) NULL,
  PRIMARY KEY (`id_numero_preguntas`))
ENGINE = InnoDB;


