-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema aprender
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema aprender
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `aprender` DEFAULT CHARACTER SET utf8 ;
USE `aprender` ;

-- -----------------------------------------------------
-- Table `aprender`.`usuario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `aprender`.`usuario` (
  `id_usuario` INT(11) NOT NULL AUTO_INCREMENT,
  `nombre_usuario` VARCHAR(45) NULL DEFAULT NULL,
  `password_usuario` VARCHAR(45) NULL DEFAULT NULL,
  `privilegio_usuario` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`id_usuario`))
ENGINE = InnoDB
AUTO_INCREMENT = 5
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `aprender`.`administrador`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `aprender`.`administrador` (
  `id_dministrador` INT(11) NOT NULL AUTO_INCREMENT,
  `nombres_admin` VARCHAR(45) NULL DEFAULT NULL,
  `apellidos_admin` VARCHAR(45) NULL DEFAULT NULL,
  `estado_admin` VARCHAR(45) NULL DEFAULT NULL,
  `fk_usuario` INT(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id_dministrador`),
  INDEX `fk_Administrador_Usuario1_idx` (`fk_usuario` ASC),
  CONSTRAINT `fk_Administrador_Usuario1`
    FOREIGN KEY (`fk_usuario`)
    REFERENCES `aprender`.`usuario` (`id_usuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 2
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `aprender`.`ayuda`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `aprender`.`ayuda` (
  `id_ayuda` INT(11) NOT NULL AUTO_INCREMENT,
  `titulo_ayuda` VARCHAR(45) NULL DEFAULT NULL,
  `link_ayuda` VARCHAR(100) NULL DEFAULT NULL,
  PRIMARY KEY (`id_ayuda`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `aprender`.`modulo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `aprender`.`modulo` (
  `id_modulo` INT(11) NOT NULL AUTO_INCREMENT,
  `nombre_modulo` VARCHAR(45) NULL DEFAULT NULL,
  `irl_img_modelo` VARCHAR(700) NULL DEFAULT NULL,
  `estado_modulo` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`id_modulo`))
ENGINE = InnoDB
AUTO_INCREMENT = 10
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `aprender`.`contenido`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `aprender`.`contenido` (
  `id_contenido` INT(11) NOT NULL AUTO_INCREMENT,
  `nombre_contenido` VARCHAR(45) NULL DEFAULT NULL,
  `descripcion_contenido` VARCHAR(500) NULL DEFAULT NULL,
  `url_img_contenido` VARCHAR(700) NULL DEFAULT NULL,
  `estado_contenido` VARCHAR(45) NULL DEFAULT NULL,
  `fk_id_modulo` INT(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id_contenido`),
  INDEX `fk_Contenido_Modulo1_idx` (`fk_id_modulo` ASC),
  CONSTRAINT `fk_Contenido_Modulo1`
    FOREIGN KEY (`fk_id_modulo`)
    REFERENCES `aprender`.`modulo` (`id_modulo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 21
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `aprender`.`empresa`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `aprender`.`empresa` (
  `id_empresa` INT(11) NOT NULL AUTO_INCREMENT,
  `nombre_empresa` VARCHAR(45) NULL DEFAULT NULL,
  `descripcion` VARCHAR(800) NULL DEFAULT NULL,
  `nit_emprea` INT(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id_empresa`))
ENGINE = InnoDB
AUTO_INCREMENT = 2
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `aprender`.`icono`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `aprender`.`icono` (
  `id_icono` INT(11) NOT NULL AUTO_INCREMENT,
  `nombre_icono` VARCHAR(100) NULL DEFAULT NULL,
  `estado_icono` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`id_icono`))
ENGINE = InnoDB
AUTO_INCREMENT = 26
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `aprender`.`inicio`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `aprender`.`inicio` (
  `id_inicio` INT(11) NOT NULL,
  `titulo_inicio` VARCHAR(45) NULL DEFAULT NULL,
  `descripcion_inicio` VARCHAR(900) NULL DEFAULT NULL,
  `url_img_inicio` VARCHAR(300) NULL DEFAULT NULL,
  `estado_inicio` VARCHAR(45) NULL DEFAULT NULL,
  `posicion_inicio` VARCHAR(45) NULL DEFAULT NULL,
  `privilegio_inicio` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`id_inicio`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `aprender`.`programa`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `aprender`.`programa` (
  `id_programa` INT(11) NOT NULL AUTO_INCREMENT,
  `nombre_programa` VARCHAR(45) NULL DEFAULT NULL,
  `estado_programa` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`id_programa`))
ENGINE = InnoDB
AUTO_INCREMENT = 6
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `aprender`.`jugador`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `aprender`.`jugador` (
  `id_jugador` INT(11) NOT NULL AUTO_INCREMENT,
  `identificacion_jugador` INT(20) NULL DEFAULT NULL,
  `nombre_1` VARCHAR(45) NULL DEFAULT NULL,
  `nombre_2` VARCHAR(45) NULL DEFAULT NULL,
  `apellido_1` VARCHAR(45) NULL DEFAULT NULL,
  `apellido_2` VARCHAR(45) NULL DEFAULT NULL,
  `semestre` INT(11) NULL DEFAULT NULL,
  `correo_electronico` VARCHAR(45) NULL DEFAULT NULL,
  `estado_jugador` VARCHAR(45) NULL DEFAULT NULL,
  `fk_usuario` INT(11) NULL DEFAULT NULL,
  `fk_programa` INT(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id_jugador`),
  INDEX `fk_Jugador_Usuario1_idx` (`fk_usuario` ASC),
  INDEX `fk_Jugador_Programa1_idx` (`fk_programa` ASC),
  CONSTRAINT `fk_Jugador_Programa1`
    FOREIGN KEY (`fk_programa`)
    REFERENCES `aprender`.`programa` (`id_programa`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Jugador_Usuario1`
    FOREIGN KEY (`fk_usuario`)
    REFERENCES `aprender`.`usuario` (`id_usuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 4
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `aprender`.`Ranking`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `aprender`.`Ranking` (
  `id_ranking` INT(11) NOT NULL AUTO_INCREMENT,
  `puntaje_acomulado` INT(11) NULL DEFAULT NULL,
  `fk_jugador` INT(11) NOT NULL,
  PRIMARY KEY (`id_ranking`),
  INDEX `fk_Ranking_jugador1_idx` (`fk_jugador` ASC),
  CONSTRAINT `fk_Ranking_jugador1`
    FOREIGN KEY (`fk_jugador`)
    REFERENCES `aprender`.`jugador` (`id_jugador`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `aprender`.`prueba`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `aprender`.`prueba` (
  `id_prueba` INT(11) NOT NULL AUTO_INCREMENT,
  `nombre_prueba` VARCHAR(100) NULL DEFAULT NULL,
  `estado_prueba` VARCHAR(5) NULL DEFAULT NULL,
  `fk_contenido` INT(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id_prueba`),
  INDEX `fk_Prueba_Contenido1_idx` (`fk_contenido` ASC),
  CONSTRAINT `fk_Prueba_Contenido1`
    FOREIGN KEY (`fk_contenido`)
    REFERENCES `aprender`.`contenido` (`id_contenido`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 17
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `aprender`.`pregunta`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `aprender`.`pregunta` (
  `id_pregunta` INT(11) NOT NULL AUTO_INCREMENT,
  `nombre_pregunta` VARCHAR(100) NULL DEFAULT NULL,
  `calificacion` INT(11) NULL DEFAULT NULL,
  `estado_pregunta` VARCHAR(20) NULL DEFAULT NULL,
  `fk_prueba` INT(11) NULL DEFAULT NULL,
  `Estado_asignacion` VARCHAR(20) NULL DEFAULT NULL,
  PRIMARY KEY (`id_pregunta`),
  INDEX `fk_Pregunta_Prueba1_idx` (`fk_prueba` ASC),
  CONSTRAINT `fk_Pregunta_Prueba1`
    FOREIGN KEY (`fk_prueba`)
    REFERENCES `aprender`.`prueba` (`id_prueba`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 19
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `aprender`.`Puntuacion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `aprender`.`Puntuacion` (
  `id_puntuacion` INT(11) NOT NULL AUTO_INCREMENT,
  `valor_punto` INT(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id_puntuacion`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `aprender`.`sancion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `aprender`.`sancion` (
  `idsancion` INT(11) NOT NULL AUTO_INCREMENT,
  `descripcion` VARCHAR(45) NULL DEFAULT NULL,
  `url_video` VARCHAR(100) NULL DEFAULT NULL,
  `estado_sancion` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`idsancion`))
ENGINE = InnoDB
AUTO_INCREMENT = 7
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `aprender`.`prueba_sancion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `aprender`.`prueba_sancion` (
  `fk_prueba` INT(11) NOT NULL,
  `fk_sancion` INT(11) NOT NULL,
  `descripcion` VARCHAR(100) NULL DEFAULT NULL,
  PRIMARY KEY (`fk_prueba`, `fk_sancion`),
  INDEX `fk_prueba_has_sancion_sancion1_idx` (`fk_sancion` ASC),
  INDEX `fk_prueba_has_sancion_prueba1_idx` (`fk_prueba` ASC),
  CONSTRAINT `fk_prueba_has_sancion_prueba1`
    FOREIGN KEY (`fk_prueba`)
    REFERENCES `aprender`.`prueba` (`id_prueba`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_prueba_has_sancion_sancion1`
    FOREIGN KEY (`fk_sancion`)
    REFERENCES `aprender`.`sancion` (`idsancion`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `aprender`.`respuesta`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `aprender`.`respuesta` (
  `id_respuesta` INT(11) NOT NULL AUTO_INCREMENT,
  `respuesta_a` VARCHAR(100) NULL DEFAULT NULL,
  `respuesta_b` VARCHAR(100) NULL DEFAULT NULL,
  `respuesta_c` VARCHAR(100) NULL DEFAULT NULL,
  `respuesta_d` VARCHAR(100) NULL DEFAULT NULL,
  `respuesta_correcta` VARCHAR(100) NULL DEFAULT NULL,
  `estado_respuesta` VARCHAR(100) NULL DEFAULT NULL,
  `fk_pregunta` INT(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id_respuesta`),
  INDEX `fk_Respuesta_Pregunta1_idx` (`fk_pregunta` ASC),
  CONSTRAINT `fk_Respuesta_Pregunta1`
    FOREIGN KEY (`fk_pregunta`)
    REFERENCES `aprender`.`pregunta` (`id_pregunta`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 17
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `aprender`.`rol`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `aprender`.`rol` (
  `id_rol` INT(11) NOT NULL AUTO_INCREMENT,
  `nombre_rol` VARCHAR(45) NULL DEFAULT NULL,
  `descripcion` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`id_rol`))
ENGINE = InnoDB
AUTO_INCREMENT = 3
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `aprender`.`rol_usuario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `aprender`.`rol_usuario` (
  `fk_id_rol` INT(11) NOT NULL,
  `fk_usuario` INT(11) NOT NULL,
  `estado_rol_usuario` VARCHAR(45) NULL DEFAULT NULL,
  `tipo_rol_usuario` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`fk_id_rol`, `fk_usuario`),
  INDEX `fk_Rol_has_Usuario_Usuario1_idx` (`fk_usuario` ASC),
  INDEX `fk_Rol_has_Usuario_Rol1_idx` (`fk_id_rol` ASC),
  CONSTRAINT `fk_Rol_has_Usuario_Rol1`
    FOREIGN KEY (`fk_id_rol`)
    REFERENCES `aprender`.`rol` (`id_rol`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Rol_has_Usuario_Usuario1`
    FOREIGN KEY (`fk_usuario`)
    REFERENCES `aprender`.`usuario` (`id_usuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `aprender`.`usuario_prueba`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `aprender`.`usuario_prueba` (
  `fk_prueba` INT(11) NOT NULL,
  `fk_jugador` INT(11) NOT NULL,
  `fecha_prueba` VARCHAR(45) NULL DEFAULT NULL,
  `puntos_prueba` INT(11) NULL DEFAULT NULL,
  `P_NoContestadas` INT(45) NULL DEFAULT NULL,
  `P_Contestadas` INT(45) NULL DEFAULT NULL,
  `P_Incorrectas` INT(45) NULL DEFAULT NULL,
  `P_Correctas` INT(45) NULL DEFAULT NULL,
  PRIMARY KEY (`fk_prueba`, `fk_jugador`),
  INDEX `fk_Jugador_has_Prueba_Prueba1_idx` (`fk_prueba` ASC),
  INDEX `fk_usuario_prueba_jugador1_idx` (`fk_jugador` ASC),
  CONSTRAINT `fk_Jugador_has_Prueba_Prueba1`
    FOREIGN KEY (`fk_prueba`)
    REFERENCES `aprender`.`prueba` (`id_prueba`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_usuario_prueba_jugador1`
    FOREIGN KEY (`fk_jugador`)
    REFERENCES `aprender`.`jugador` (`id_jugador`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `aprender`.`vista`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `aprender`.`vista` (
  `id_vista` INT(11) NOT NULL AUTO_INCREMENT,
  `url` VARCHAR(100) NULL DEFAULT NULL,
  `estado` VARCHAR(45) NULL DEFAULT NULL,
  `descripcion` VARCHAR(100) NULL DEFAULT NULL,
  `icono` VARCHAR(45) NULL DEFAULT NULL,
  `fk_master` INT(11) NOT NULL,
  PRIMARY KEY (`id_vista`, `fk_master`),
  INDEX `fk_Vista_Vista1_idx` (`fk_master` ASC),
  CONSTRAINT `fk_Vista_Vista1`
    FOREIGN KEY (`fk_master`)
    REFERENCES `aprender`.`vista` (`id_vista`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 231
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `aprender`.`vista_rol`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `aprender`.`vista_rol` (
  `id_vista_rol` INT(11) NOT NULL AUTO_INCREMENT,
  `fk_id_vista` INT(11) NOT NULL,
  `fk_master` INT(11) NOT NULL,
  `fk_id_rol` INT(11) NOT NULL,
  PRIMARY KEY (`id_vista_rol`, `fk_id_vista`, `fk_master`, `fk_id_rol`),
  INDEX `fk_Vista_Rol_Vista1_idx` (`fk_id_vista` ASC, `fk_master` ASC),
  INDEX `fk_Vista_Rol_Rol1_idx` (`fk_id_rol` ASC),
  CONSTRAINT `fk_Vista_Rol_Rol1`
    FOREIGN KEY (`fk_id_rol`)
    REFERENCES `aprender`.`rol` (`id_rol`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Vista_Rol_Vista1`
    FOREIGN KEY (`fk_id_vista` , `fk_master`)
    REFERENCES `aprender`.`vista` (`id_vista` , `fk_master`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 163
DEFAULT CHARACTER SET = utf8;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
