-- MySQL Script generated by MySQL Workbench
-- Tue Mar 15 20:17:10 2022
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema Optica
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `Optica` ;

-- -----------------------------------------------------
-- Schema Optica
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Optica` DEFAULT CHARACTER SET utf8 ;
USE `Optica` ;

-- -----------------------------------------------------
-- Table `Optica`.`CLIENTES`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Optica`.`CLIENTES` ;

CREATE TABLE IF NOT EXISTS `Optica`.`CLIENTES` (
  `idcliente` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NOT NULL,
  `direccion` VARCHAR(45) NOT NULL,
  `telefono` INT NULL,
  `email` VARCHAR(45) NOT NULL,
  `fechareg` DATE NOT NULL,
  `idcliente_recomedado` INT NULL,
  PRIMARY KEY (`idcliente`),
  INDEX `fk_CLIENTES_CLIENTES1_idx` (`idcliente_recomedado` ASC) ,
  CONSTRAINT `fk_CLIENTES_CLIENTES1`
    FOREIGN KEY (`idcliente_recomedado`)
    REFERENCES `Optica`.`CLIENTES` (`idcliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Optica`.`COMPRAN`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Optica`.`COMPRAN` ;

CREATE TABLE IF NOT EXISTS `Optica`.`COMPRAN` (
  `ULLERES_IdUlleres` INT NOT NULL,
  `CLIENTES_idcliente` INT NOT NULL,
  `id_vendedor` INT NOT NULL,
  PRIMARY KEY (`ULLERES_IdUlleres`, `CLIENTES_idcliente`),
  INDEX `fk_ULLERES_has_CLIENTES_CLIENTES1_idx` (`CLIENTES_idcliente` ASC) VISIBLE,
  INDEX `fk_ULLERES_has_CLIENTES_ULLERES_idx` (`ULLERES_IdUlleres` ASC) VISIBLE,
  CONSTRAINT `fk_ULLERES_has_CLIENTES_ULLERES`
    FOREIGN KEY (`ULLERES_IdUlleres`)
    REFERENCES `Optica`.`ULLERES` (`IdUlleres`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_ULLERES_has_CLIENTES_CLIENTES1`
    FOREIGN KEY (`CLIENTES_idcliente`)
    REFERENCES `Optica`.`CLIENTES` (`idcliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Optica`.`PROVEEDORES`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Optica`.`PROVEEDORES` ;

CREATE TABLE IF NOT EXISTS `Optica`.`PROVEEDORES` (
  `idproveedorr` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NOT NULL,
  `numero` INT NOT NULL,
  `piso` VARCHAR(5) NULL,
  `puerta` VARCHAR(5) NULL,
  `ciudad` VARCHAR(45) NOT NULL,
  `codigopostal` VARCHAR(10) NOT NULL,
  `calle` VARCHAR(45) NOT NULL,
  `pais` VARCHAR(45) NOT NULL,
  `telefono` INT NOT NULL,
  `fax` INT NULL,
  `nif` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idproveedorr`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Optica`.`ULLERES`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Optica`.`ULLERES` ;

CREATE TABLE IF NOT EXISTS `Optica`.`ULLERES` (
  `IdUlleres` INT NOT NULL AUTO_INCREMENT,
  `Marca` VARCHAR(45) NOT NULL,
  `Montura` ENUM("flotante", "pasta", "metalica") NOT NULL,
  `Graduacion` FLOAT NOT NULL,
  `ColorMontura` VARCHAR(45) NOT NULL,
  `ColorVidreo` VARCHAR(45) NOT NULL,
  `Precio` FLOAT NOT NULL,
  `PROVEEDORES_idproveedorr` INT NOT NULL,
  PRIMARY KEY (`IdUlleres`),
  INDEX `fk_ULLERES_PROVEEDORES1_idx` (`PROVEEDORES_idproveedorr` ASC) VISIBLE,
  CONSTRAINT `fk_ULLERES_PROVEEDORES1`
    FOREIGN KEY (`PROVEEDORES_idproveedorr`)
    REFERENCES `Optica`.`PROVEEDORES` (`idproveedorr`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;