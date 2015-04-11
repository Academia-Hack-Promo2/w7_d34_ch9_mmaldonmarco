SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

CREATE SCHEMA IF NOT EXISTS `factura_development` DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci ;
USE `factura_development` ;

-- -----------------------------------------------------
-- Table `factura_development`.`factura`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `factura_development`.`factura` (
  `idfactura` INT NOT NULL,
  `cantidad` VARCHAR(45) NULL,
  `descripcion` VARCHAR(45) NULL,
  `precio_unitario` INT(11) NULL,
  `precio_total` INT(11) NULL,
  PRIMARY KEY (`idfactura`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `factura_development`.`cliente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `factura_development`.`cliente` (
  `nombre` INT NOT NULL,
  `CI/RIF` VARCHAR(45) NULL,
  `direccion` VARCHAR(45) NULL,
  `telefono` VARCHAR(45) NULL,
  `clientecol` VARCHAR(45) NULL,
  `factura_idfactura` INT NOT NULL,
  PRIMARY KEY (`nombre`),
  INDEX `fk_cliente_factura1_idx` (`factura_idfactura` ASC),
  CONSTRAINT `fk_cliente_factura1`
    FOREIGN KEY (`factura_idfactura`)
    REFERENCES `factura_development`.`factura` (`idfactura`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `factura_development`.`producto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `factura_development`.`producto` (
  `idproducto` INT NOT NULL,
  `nombre` VARCHAR(45) NULL,
  `descripcion` VARCHAR(45) NULL,
  PRIMARY KEY (`idproducto`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `factura_development`.`factura_producto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `factura_development`.`factura_producto` (
  `factura_idfactura` INT NOT NULL,
  `producto_idproducto` INT NOT NULL,
  PRIMARY KEY (`factura_idfactura`, `producto_idproducto`),
  INDEX `fk_factura_producto_producto1_idx` (`producto_idproducto` ASC),
  CONSTRAINT `fk_factura_producto_factura`
    FOREIGN KEY (`factura_idfactura`)
    REFERENCES `factura_development`.`factura` (`idfactura`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_factura_producto_producto1`
    FOREIGN KEY (`producto_idproducto`)
    REFERENCES `factura_development`.`producto` (`idproducto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
