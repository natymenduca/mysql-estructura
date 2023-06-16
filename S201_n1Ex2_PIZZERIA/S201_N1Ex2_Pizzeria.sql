-- MySQL Script generated by MySQL Workbench
-- Wed Jun 14 20:30:30 2023
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema S201_N1E2_Pizzeria
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema S201_N1E2_Pizzeria
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `S201_N1E2_Pizzeria` DEFAULT CHARACTER SET latin1 ;
USE `S201_N1E2_Pizzeria` ;

-- -----------------------------------------------------
-- Table `S201_N1E2_Pizzeria`.`productos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `S201_N1E2_Pizzeria`.`productos` (
  `id_producto` INT(11) NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NOT NULL,
  `descripcion` VARCHAR(150) NOT NULL,
  `imagen` VARCHAR(45) NOT NULL,
  `precio` FLOAT NOT NULL,
  PRIMARY KEY (`id_producto`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `S201_N1E2_Pizzeria`.`categorias`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `S201_N1E2_Pizzeria`.`categorias` (
  `id_categorias` INT(11) NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NOT NULL,
  `productos_id_producto` INT(11) NOT NULL,
  PRIMARY KEY (`id_categorias`),
  INDEX `fk_categorias_productos1_idx` (`productos_id_producto` ASC) VISIBLE,
  CONSTRAINT `fk_categorias_productos1`
    FOREIGN KEY (`productos_id_producto`)
    REFERENCES `S201_N1E2_Pizzeria`.`productos` (`id_producto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `S201_N1E2_Pizzeria`.`provincias`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `S201_N1E2_Pizzeria`.`provincias` (
  `id_provincia` INT(11) NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_provincia`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `S201_N1E2_Pizzeria`.`localidades`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `S201_N1E2_Pizzeria`.`localidades` (
  `id_localidades` INT(11) NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NOT NULL,
  `provincias_id_provincia` INT(11) NOT NULL,
  PRIMARY KEY (`id_localidades`),
  INDEX `fk_localidades_provincias1_idx` (`provincias_id_provincia` ASC) VISIBLE,
  CONSTRAINT `fk_localidades_provincias1`
    FOREIGN KEY (`provincias_id_provincia`)
    REFERENCES `S201_N1E2_Pizzeria`.`provincias` (`id_provincia`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `S201_N1E2_Pizzeria`.`clientes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `S201_N1E2_Pizzeria`.`clientes` (
  `id_cliente` INT(11) NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(50) NOT NULL,
  `apellidos` VARCHAR(50) NOT NULL,
  `direccion` VARCHAR(150) NOT NULL,
  `cp` INT(11) NOT NULL,
  `telefono` INT(11) NOT NULL,
  PRIMARY KEY (`id_cliente`),
  CONSTRAINT `id_localidad`
    FOREIGN KEY (`id_cliente`)
    REFERENCES `S201_N1E2_Pizzeria`.`localidades` (`id_localidades`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `S201_N1E2_Pizzeria`.`tipo_empleados`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `S201_N1E2_Pizzeria`.`tipo_empleados` (
  `id_tipo_empleados` INT(11) NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_tipo_empleados`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `S201_N1E2_Pizzeria`.`tiendas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `S201_N1E2_Pizzeria`.`tiendas` (
  `id_tienda` INT(11) NOT NULL AUTO_INCREMENT,
  `direccion` VARCHAR(45) NOT NULL,
  `cp` INT(11) NOT NULL,
  `localidad` VARCHAR(45) NOT NULL,
  `provincias_id_provincia` INT(11) NOT NULL,
  PRIMARY KEY (`id_tienda`),
  INDEX `fk_tiendas_provincias1_idx` (`provincias_id_provincia` ASC) VISIBLE,
  CONSTRAINT `fk_tiendas_provincias1`
    FOREIGN KEY (`provincias_id_provincia`)
    REFERENCES `S201_N1E2_Pizzeria`.`provincias` (`id_provincia`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `S201_N1E2_Pizzeria`.`empleados`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `S201_N1E2_Pizzeria`.`empleados` (
  `id_empleado` INT(11) NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NOT NULL,
  `apellidos` VARCHAR(45) NOT NULL,
  `NIF` VARCHAR(45) NOT NULL,
  `telefono` INT(11) NOT NULL,
  `tipo_empleados_id_tipo_empleados` INT(11) NOT NULL,
  `tiendas_id_tienda` INT(11) NOT NULL,
  PRIMARY KEY (`id_empleado`),
  INDEX `fk_empleados_tipo_empleados1_idx` (`tipo_empleados_id_tipo_empleados` ASC) VISIBLE,
  INDEX `fk_empleados_tiendas1_idx` (`tiendas_id_tienda` ASC) VISIBLE,
  CONSTRAINT `fk_empleados_tipo_empleados1`
    FOREIGN KEY (`tipo_empleados_id_tipo_empleados`)
    REFERENCES `S201_N1E2_Pizzeria`.`tipo_empleados` (`id_tipo_empleados`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_empleados_tiendas1`
    FOREIGN KEY (`tiendas_id_tienda`)
    REFERENCES `S201_N1E2_Pizzeria`.`tiendas` (`id_tienda`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `S201_N1E2_Pizzeria`.`tipo_entrega`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `S201_N1E2_Pizzeria`.`tipo_entrega` (
  `id_tipo_entrega` INT(11) NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`id_tipo_entrega`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `S201_N1E2_Pizzeria`.`pedidos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `S201_N1E2_Pizzeria`.`pedidos` (
  `id_pedido` INT(11) NOT NULL AUTO_INCREMENT,
  `data_Hora` DATETIME NOT NULL,
  `precio_total` FLOAT NOT NULL,
  `productos_id_producto` INT(11) NOT NULL,
  PRIMARY KEY (`id_pedido`),
  INDEX `fk_pedidos_productos1_idx` (`productos_id_producto` ASC) VISIBLE,
  CONSTRAINT `id_cliente`
    FOREIGN KEY (`id_pedido`)
    REFERENCES `S201_N1E2_Pizzeria`.`clientes` (`id_cliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `id_tienda`
    FOREIGN KEY (`id_pedido`)
    REFERENCES `S201_N1E2_Pizzeria`.`tiendas` (`id_tienda`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `id_tipo_entrega`
    FOREIGN KEY (`id_pedido`)
    REFERENCES `S201_N1E2_Pizzeria`.`tipo_entrega` (`id_tipo_entrega`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_pedidos_productos`
    FOREIGN KEY (`productos_id_producto`)
    REFERENCES `S201_N1E2_Pizzeria`.`productos` (`id_producto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `S201_N1E2_Pizzeria`.`entrega_domicilios`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `S201_N1E2_Pizzeria`.`entrega_domicilios` (
  `id_entrega_domicilio` INT(11) NOT NULL AUTO_INCREMENT,
  `fecha_hora` DATETIME NOT NULL,
  `empleados_id_empleado` INT(11) NOT NULL,
  `pedidos_id_pedido` INT(11) NOT NULL,
  PRIMARY KEY (`id_entrega_domicilio`),
  INDEX `fk_entrega_domicilios_empleados1_idx` (`empleados_id_empleado` ASC) VISIBLE,
  INDEX `fk_entrega_domicilios_pedidos1_idx` (`pedidos_id_pedido` ASC) VISIBLE,
  CONSTRAINT `fk_entrega_domicilios_empleados1`
    FOREIGN KEY (`empleados_id_empleado`)
    REFERENCES `S201_N1E2_Pizzeria`.`empleados` (`id_empleado`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_entrega_domicilios_pedidos1`
    FOREIGN KEY (`pedidos_id_pedido`)
    REFERENCES `S201_N1E2_Pizzeria`.`pedidos` (`id_pedido`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `S201_N1E2_Pizzeria`.`pedido_productos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `S201_N1E2_Pizzeria`.`pedido_productos` (
  `id_pedido_productos` INT(11) NOT NULL AUTO_INCREMENT,
  `cantidad` INT(11) NOT NULL,
  `pedidos_id_pedido` INT(11) NOT NULL,
  PRIMARY KEY (`id_pedido_productos`, `pedidos_id_pedido`),
  INDEX `fk_pedido_productos_pedidos1_idx` (`pedidos_id_pedido` ASC) VISIBLE,
  CONSTRAINT `id_producto`
    FOREIGN KEY (`id_pedido_productos`)
    REFERENCES `S201_N1E2_Pizzeria`.`productos` (`id_producto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_pedido_productos_pedidos1`
    FOREIGN KEY (`pedidos_id_pedido`)
    REFERENCES `S201_N1E2_Pizzeria`.`pedidos` (`id_pedido`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
