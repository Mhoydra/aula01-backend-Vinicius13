-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema SistemaDeAgendamento
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema SistemaDeAgendamento
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `sistema_agendamento` DEFAULT CHARACTER SET utf8 ;
USE `sistema_agendamento` ;

-- -----------------------------------------------------
-- Table `SistemaDeAgendamento`.`usuarios`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `sistema_agendamento`.`usuarios` (
  `idUsuario` INT NOT NULL,
  `nomeUsuario` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`idUsuario`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `SistemaDeAgendamento`.`servicos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `sistema_agendamento`.`servicos` (
  `idservico` INT NOT NULL,
  `nomeServico` VARCHAR(45) NOT NULL,
  `precoServico` VARCHAR(45) NOT NULL,
  `ativoServico` TINYINT NOT NULL,
  PRIMARY KEY (`idservico`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `SistemaDeAgendamento`.`agendamentos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `sistema_agendamento`.`agendamentos` (
  `idAgendamento` INT NOT NULL,
  `dataAgendamento` DATETIME NOT NULL,
  `servicos_idservico` INT NOT NULL,
  `usuarios_idUsuario` INT NOT NULL,
  PRIMARY KEY (`idAgendamento`),
  INDEX `fk_agendamentos_servicos1_idx` (`servicos_idservico` ASC) VISIBLE,
  INDEX `fk_agendamentos_usuarios1_idx` (`usuarios_idUsuario` ASC) VISIBLE,
  CONSTRAINT `fk_agendamentos_servicos1`
    FOREIGN KEY (`servicos_idservico`)
    REFERENCES `sistema_agendamento`.`servicos` (`idservico`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_agendamentos_usuarios1`
    FOREIGN KEY (`usuarios_idUsuario`)
    REFERENCES `sistema_agendamento`.`usuarios` (`idUsuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `sistema_agendamento`.`categorias`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `sistema_agendamento`.`categorias` (
  `idCategorias` VARCHAR(45) NOT NULL,
  `nomeCategorias` VARCHAR(45) NULL,
  `servicos_idservico` INT NOT NULL,
  PRIMARY KEY (`idCategorias`),
  INDEX `fk_categorias_servicos1_idx` (`servicos_idservico` ASC) VISIBLE,
  CONSTRAINT `fk_categorias_servicos1`
    FOREIGN KEY (`servicos_idservico`)
    REFERENCES `sistema_agendamento`.`servicos` (`idservico`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
