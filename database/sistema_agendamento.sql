CREATE DATABASE sistema_agendamento;
USE sistema_agendamento;

CREATE TABLE usuarios(
	idUsuario INT PRIMARY KEY AUTO_INCREMENT,
    nomeUsuario VARCHAR(100) NOT NULL,
    emailUsuario VARCHAR(100),
    senhaUsuario VARCHAR(100),
    dataUsuario TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);
-- DROP TABLE usuarios;

CREATE TABLE servicos(
	idServico INT PRIMARY KEY AUTO_INCREMENT,
    nomeServico VARCHAR(100) NOT NULL,
    dataServico TIMESTAMP NOT NULL  DEFAULT CURRENT_TIMESTAMP
);
-- DROP TABLE servicos;

CREATE TABLE categorias(
	idCategoria INT PRIMARY KEY AUTO_INCREMENT,
    nomeCategoria VARCHAR(100) NOT NULL,
    dataCategoria TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    FKidServico INT NOT NULL,
    FOREIGN KEY (FKidServico) REFERENCES servicos(idServico)
);
-- DROP TABLE categorias;

CREATE TABLE agendamentos(
	idUsuario INT NOT NULL,
    idServico INT NOT NULL,	
	idAgendamento INT PRIMARY KEY AUTO_INCREMENT,
    nomeAgendamento VARCHAR(100) NOT NULL ,
    dataAgendamento TIMESTAMP NOT NULL  DEFAULT CURRENT_TIMESTAMP,
    ativo BOOLEAN NOT NULL DEFAULT TRUE,
    FKidUsuario INT NOT NULL,
    FKidServico INT NOT NULL,
    FOREIGN KEY (FKidUsuario) REFERENCES usuarios(idUsuario),
    FOREIGN KEY (FKidServico) REFERENCES servicos(idServico) 
);
-- DROP TABLE agendamentos;

CREATE TABLE profissionais(
	idProfissional INT PRIMARY KEY AUTO_INCREMENT,
    nomeProfissional VARCHAR(100) NOT NULL,
    dataProfissional TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);
-- DROP TABLE profissionais;

CREATE TABLE servicosProfissionais(
	idServico INT NOT NULL,
    idProfissional INT NOT NULL,
	PRIMARY KEY(idServico, IDProfissionaL),
	FKidServico INT NOT NULL,
    FKidProfissionais INT NOT NULL,
    FOREIGN KEY (FKidServico) REFERENCES servicos(idServico),
    FOREIGN KEY (FKidProfissionais) REFERENCES profissionais(idProfissional)
);
-- DROP TABLE profissionais;

INSERT INTO usuarios(nomeUsuario,emailUsuario,senhaUusario) VALUES 
("Herick Barone Freitas","BaraoDasProvincias@gmail.com",'3284576345'),
("Gustavo Tavares Lopes","Trovao&Cerveja@gmail.com",'13478568234'),
("Cristhoper Frederick Brascubas III","74782846287@senacrs.edu.br",'876235762345');

INSERT INTO servicos(nomeServico) VALUES 
("Entrega"),("Compra"),("Revenda");

INSERT INTO categorias(nomeCategoria,FKidServico) VALUES 
("Urgente",1),("Rapido",2),("Demorado",3);

-- criar INSERT INTO em servicosProfissionais e agendamentos

-- -- MySQL Workbench Forward Engineering

-- SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
-- SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
-- SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -- -----------------------------------------------------
-- -- Schema SistemaDeAgendamento
-- -- -----------------------------------------------------
 
-- CREATE SCHEMA IF NOT EXISTS `sistema_agendamento` DEFAULT CHARACTER SET utf8 ;
-- USE `sistema_agendamento` ;

-- -- -----------------------------------------------------
-- -- Table `SistemaDeAgendamento`.`usuarios`
-- -- -----------------------------------------------------
-- CREATE TABLE IF NOT EXISTS `sistema_agendamento`.`usuarios` (
--   `idUsuario` INT NOT NULL,
--   `nomeUsuario` VARCHAR(100) NOT NULL,
--   PRIMARY KEY (`idUsuario`))
-- ENGINE = InnoDB;


-- -- -----------------------------------------------------
-- -- Table `SistemaDeAgendamento`.`servicos`
-- -- -----------------------------------------------------
-- CREATE TABLE IF NOT EXISTS `sistema_agendamento`.`servicos` (
--   `idservico` INT NOT NULL,
--   `nomeServico` VARCHAR(45) NOT NULL,
--   `precoServico` VARCHAR(45) NOT NULL,
--   `ativoServico` TINYINT NOT NULL,
--   PRIMARY KEY (`idservico`))
-- ENGINE = InnoDB;


-- -- -----------------------------------------------------
-- -- Table `SistemaDeAgendamento`.`agendamentos`
-- -- -----------------------------------------------------
-- CREATE TABLE IF NOT EXISTS `sistema_agendamento`.`agendamentos` (
--   `idAgendamento` INT NOT NULL,
--   `dataAgendamento` DATETIME NOT NULL,
--   `servicos_idservico` INT NOT NULL,
--   `usuarios_idUsuario` INT NOT NULL,
--   PRIMARY KEY (`idAgendamento`),
--   INDEX `fk_agendamentos_servicos1_idx` (`servicos_idservico` ASC) VISIBLE,
--   INDEX `fk_agendamentos_usuarios1_idx` (`usuarios_idUsuario` ASC) VISIBLE,
--   CONSTRAINT `fk_agendamentos_servicos1`
--     FOREIGN KEY (`servicos_idservico`)
--     REFERENCES `sistema_agendamento`.`servicos` (`idservico`)
--     ON DELETE NO ACTION
--     ON UPDATE NO ACTION,
--   CONSTRAINT `fk_agendamentos_usuarios1`
--     FOREIGN KEY (`usuarios_idUsuario`)
--     REFERENCES `sistema_agendamento`.`usuarios` (`idUsuario`)
--     ON DELETE NO ACTION
--     ON UPDATE NO ACTION)
-- ENGINE = InnoDB;

-- -- -----------------------------------------------------
-- -- Table `sistema_agendamento`.`categorias`
-- -- -----------------------------------------------------
-- CREATE TABLE IF NOT EXISTS `sistema_agendamento`.`categorias` (
--   `idCategorias` VARCHAR(45) NOT NULL,
--   `nomeCategorias` VARCHAR(45) NULL,
--   `servicos_idservico` INT NOT NULL,
--   PRIMARY KEY (`idCategorias`),
--   INDEX `fk_categorias_servicos1_idx` (`servicos_idservico` ASC) VISIBLE,
--   CONSTRAINT `fk_categorias_servicos1`
--     FOREIGN KEY (`servicos_idservico`)
--     REFERENCES `sistema_agendamento`.`servicos` (`idservico`)
--     ON DELETE NO ACTION
--     ON UPDATE NO ACTION)
-- ENGINE = InnoDB;

-- SET SQL_MODE=@OLD_SQL_MODE;
-- SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
-- SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;



