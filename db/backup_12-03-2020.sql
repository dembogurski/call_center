/*
SQLyog Ultimate v11.11 (32 bit)
MySQL - 5.7.28 : Database - call_center
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`call_center` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `call_center`;

/*Table structure for table `art_propiedades` */

DROP TABLE IF EXISTS `art_propiedades`;

CREATE TABLE `art_propiedades` (
  `cod_prop` varchar(30) NOT NULL,
  `descrip` varchar(120) NOT NULL,
  `tipo` varchar(20) DEFAULT NULL,
  `valor_def` varchar(60) DEFAULT NULL,
  `estado` varchar(30) NOT NULL,
  PRIMARY KEY (`cod_prop`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `art_propiedades` */

/*Table structure for table `art_x_uso` */

DROP TABLE IF EXISTS `art_x_uso`;

CREATE TABLE `art_x_uso` (
  `cod_uso` int(11) NOT NULL,
  `codigo` varchar(30) NOT NULL,
  PRIMARY KEY (`cod_uso`,`codigo`),
  KEY `Refarticulos23` (`codigo`),
  CONSTRAINT `Refarticulos23` FOREIGN KEY (`codigo`) REFERENCES `articulos` (`codigo`),
  CONSTRAINT `Refusos22` FOREIGN KEY (`cod_uso`) REFERENCES `usos` (`cod_uso`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `art_x_uso` */

/*Table structure for table `articulos` */

DROP TABLE IF EXISTS `articulos`;

CREATE TABLE `articulos` (
  `codigo` varchar(30) NOT NULL,
  `clase` varchar(16) DEFAULT NULL,
  `descrip` varchar(100) NOT NULL,
  `cod_sector` int(11) NOT NULL,
  `um` varchar(10) NOT NULL,
  `costo_prom` decimal(16,2) DEFAULT NULL,
  `costo_cif` decimal(16,2) DEFAULT NULL,
  `costo_fob` decimal(16,2) DEFAULT NULL,
  `art_venta` varchar(6) DEFAULT NULL,
  `art_inv` varchar(6) DEFAULT NULL,
  `art_compra` varchar(6) DEFAULT NULL,
  `img` varchar(100) DEFAULT NULL,
  `estado_venta` varchar(30) DEFAULT NULL,
  `composicion` varchar(30) DEFAULT NULL,
  `temporada` varchar(30) DEFAULT NULL,
  `ligamento` varchar(30) DEFAULT NULL,
  `combinacion` varchar(30) DEFAULT NULL,
  `especificaciones` varchar(1024) DEFAULT NULL,
  `acabado` varchar(30) DEFAULT NULL,
  `tipo` varchar(30) DEFAULT NULL,
  `estetica` varchar(30) DEFAULT NULL,
  `ancho` decimal(16,2) DEFAULT NULL,
  `espesor` decimal(16,4) DEFAULT NULL,
  `gramaje_prom` decimal(16,2) DEFAULT NULL,
  `rendimiento` decimal(16,2) DEFAULT NULL,
  `produc_ancho` decimal(10,2) DEFAULT NULL,
  `produc_largo` decimal(10,2) DEFAULT NULL,
  `produc_alto` decimal(10,2) DEFAULT NULL,
  `produc_costo` decimal(16,2) DEFAULT NULL,
  `mnj_x_lotes` varchar(2) DEFAULT NULL,
  `estado` varchar(12) DEFAULT NULL,
  PRIMARY KEY (`codigo`),
  KEY `Refsectores21` (`cod_sector`),
  KEY `Refunidades_medida26` (`um`),
  CONSTRAINT `Refsectores21` FOREIGN KEY (`cod_sector`) REFERENCES `sectores` (`cod_sector`),
  CONSTRAINT `Refunidades_medida26` FOREIGN KEY (`um`) REFERENCES `unidades_medida` (`um_cod`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `articulos` */

/*Table structure for table `cargos` */

DROP TABLE IF EXISTS `cargos`;

CREATE TABLE `cargos` (
  `cargo` varchar(30) NOT NULL,
  PRIMARY KEY (`cargo`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Data for the table `cargos` */

insert  into `cargos`(`cargo`) values ('Cocinero/a');
insert  into `cargos`(`cargo`) values ('Director');
insert  into `cargos`(`cargo`) values ('Profesor');

/*Table structure for table `codigos_barras` */

DROP TABLE IF EXISTS `codigos_barras`;

CREATE TABLE `codigos_barras` (
  `codigo` varchar(30) NOT NULL,
  `barcode` varchar(60) NOT NULL,
  PRIMARY KEY (`codigo`,`barcode`),
  CONSTRAINT `Refarticulos104` FOREIGN KEY (`codigo`) REFERENCES `articulos` (`codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `codigos_barras` */

/*Table structure for table `comunicaciones` */

DROP TABLE IF EXISTS `comunicaciones`;

CREATE TABLE `comunicaciones` (
  `id_com` int(11) NOT NULL AUTO_INCREMENT,
  `cod_per` int(11) NOT NULL,
  `usuario` varchar(30) NOT NULL,
  `fecha` datetime DEFAULT NULL,
  `obs_per` varchar(2048) DEFAULT NULL,
  `obs_usuario` varchar(2048) DEFAULT NULL,
  `nivel` varchar(16) DEFAULT NULL,
  `estado` varchar(10) DEFAULT NULL,
  `fecha_modif` datetime DEFAULT NULL,
  PRIMARY KEY (`id_com`),
  KEY `Refpersonas247` (`cod_per`),
  KEY `Refusuarios248` (`usuario`),
  CONSTRAINT `Refpersonas247` FOREIGN KEY (`cod_per`) REFERENCES `personas` (`cod_per`),
  CONSTRAINT `Refusuarios248` FOREIGN KEY (`usuario`) REFERENCES `usuarios` (`usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

/*Data for the table `comunicaciones` */

insert  into `comunicaciones`(`id_com`,`cod_per`,`usuario`,`fecha`,`obs_per`,`obs_usuario`,`nivel`,`estado`,`fecha_modif`) values (1,85,'douglas','2020-03-11 18:23:15','Necesitamos garrafa de gas','Le enviamos loantes posible','Bajo','Pendiente',NULL);
insert  into `comunicaciones`(`id_com`,`cod_per`,`usuario`,`fecha`,`obs_per`,`obs_usuario`,`nivel`,`estado`,`fecha_modif`) values (2,14,'douglas','2020-03-11 18:27:26','Necesitamos una jarra electrica','Gestionaramos la compra y el envio','Urgente','Pendiente',NULL);
insert  into `comunicaciones`(`id_com`,`cod_per`,`usuario`,`fecha`,`obs_per`,`obs_usuario`,`nivel`,`estado`,`fecha_modif`) values (3,165,'douglas','2020-03-11 19:03:18','Necesitamos 100 kg de tomate para el Lunes','Ok en curso','Medio','En Proceso',NULL);
insert  into `comunicaciones`(`id_com`,`cod_per`,`usuario`,`fecha`,`obs_per`,`obs_usuario`,`nivel`,`estado`,`fecha_modif`) values (4,186,'douglas','2020-03-11 19:04:14','Necesitamos cebolla','Le enviamos','Bajo','En Proceso',NULL);
insert  into `comunicaciones`(`id_com`,`cod_per`,`usuario`,`fecha`,`obs_per`,`obs_usuario`,`nivel`,`estado`,`fecha_modif`) values (5,111,'douglas','2020-03-11 22:17:23','Necesitamos una licuadora Arno','Ok: le comfirmo en breve, ya se le envio','Medio','Cerrado','2020-03-11 22:19:39');

/*Table structure for table `contactos` */

DROP TABLE IF EXISTS `contactos`;

CREATE TABLE `contactos` (
  `id_contacto` varchar(30) NOT NULL,
  `codigo_entidad` int(11) NOT NULL,
  `nombre` varchar(60) DEFAULT NULL,
  `doc` varchar(30) DEFAULT NULL,
  `tel` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id_contacto`,`codigo_entidad`),
  KEY `Refinsituciones249` (`codigo_entidad`),
  CONSTRAINT `Refentidades128` FOREIGN KEY (`codigo_entidad`) REFERENCES `entidades` (`cod_ent`),
  CONSTRAINT `Refinsituciones249` FOREIGN KEY (`codigo_entidad`) REFERENCES `instituciones` (`cod_inst`),
  CONSTRAINT `Refpersonas130` FOREIGN KEY (`codigo_entidad`) REFERENCES `personas` (`cod_per`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `contactos` */

/*Table structure for table `cotizaciones` */

DROP TABLE IF EXISTS `cotizaciones`;

CREATE TABLE `cotizaciones` (
  `id_cotiz` int(11) NOT NULL AUTO_INCREMENT,
  `suc` varchar(10) NOT NULL,
  `m_cod` varchar(4) NOT NULL,
  `fecha` date NOT NULL,
  `hora` varchar(10) DEFAULT NULL,
  `compra` decimal(8,2) DEFAULT NULL,
  `venta` decimal(8,2) DEFAULT NULL,
  `ref` varchar(4) DEFAULT NULL,
  PRIMARY KEY (`id_cotiz`,`suc`),
  KEY `Refsucursales133` (`suc`),
  KEY `Refmonedas135` (`m_cod`),
  CONSTRAINT `Refmonedas135` FOREIGN KEY (`m_cod`) REFERENCES `monedas` (`m_cod`),
  CONSTRAINT `Refsucursales133` FOREIGN KEY (`suc`) REFERENCES `sucursales` (`suc`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `cotizaciones` */

/*Table structure for table `departamentos` */

DROP TABLE IF EXISTS `departamentos`;

CREATE TABLE `departamentos` (
  `codigo_pais` varchar(30) NOT NULL,
  `cod_depart` varchar(4) NOT NULL,
  `nombre_depar` varchar(254) DEFAULT NULL,
  `estado` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`codigo_pais`,`cod_depart`),
  CONSTRAINT `Refpaises242` FOREIGN KEY (`codigo_pais`) REFERENCES `paises` (`codigo_pais`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `departamentos` */

insert  into `departamentos`(`codigo_pais`,`cod_depart`,`nombre_depar`,`estado`) values ('PY','00','Asuncion Capital','Inactivo');
insert  into `departamentos`(`codigo_pais`,`cod_depart`,`nombre_depar`,`estado`) values ('PY','01','Concepcion','Inactivo');
insert  into `departamentos`(`codigo_pais`,`cod_depart`,`nombre_depar`,`estado`) values ('PY','02','San Pedro','Inactivo');
insert  into `departamentos`(`codigo_pais`,`cod_depart`,`nombre_depar`,`estado`) values ('PY','03','Cordillera','Inactivo');
insert  into `departamentos`(`codigo_pais`,`cod_depart`,`nombre_depar`,`estado`) values ('PY','04','Guairá','Inactivo');
insert  into `departamentos`(`codigo_pais`,`cod_depart`,`nombre_depar`,`estado`) values ('PY','05','Caaguazu','Inactivo');
insert  into `departamentos`(`codigo_pais`,`cod_depart`,`nombre_depar`,`estado`) values ('PY','06','Caazapá','Inactivo');
insert  into `departamentos`(`codigo_pais`,`cod_depart`,`nombre_depar`,`estado`) values ('PY','07','Itapúa','Activo');
insert  into `departamentos`(`codigo_pais`,`cod_depart`,`nombre_depar`,`estado`) values ('PY','08','Misiones','Activo');
insert  into `departamentos`(`codigo_pais`,`cod_depart`,`nombre_depar`,`estado`) values ('PY','09','Paraguarí','Activo');
insert  into `departamentos`(`codigo_pais`,`cod_depart`,`nombre_depar`,`estado`) values ('PY','10','Alto Paraná','Inactivo');
insert  into `departamentos`(`codigo_pais`,`cod_depart`,`nombre_depar`,`estado`) values ('PY','11','Central','Inactivo');
insert  into `departamentos`(`codigo_pais`,`cod_depart`,`nombre_depar`,`estado`) values ('PY','12','Ñeembucú','Inactivo');
insert  into `departamentos`(`codigo_pais`,`cod_depart`,`nombre_depar`,`estado`) values ('PY','13','Amambay','Inactivo');
insert  into `departamentos`(`codigo_pais`,`cod_depart`,`nombre_depar`,`estado`) values ('PY','14','Canindeyú','Inactivo');
insert  into `departamentos`(`codigo_pais`,`cod_depart`,`nombre_depar`,`estado`) values ('PY','15','Presidente Hayes','Inactivo');
insert  into `departamentos`(`codigo_pais`,`cod_depart`,`nombre_depar`,`estado`) values ('PY','16','Boqueron','Inactivo');
insert  into `departamentos`(`codigo_pais`,`cod_depart`,`nombre_depar`,`estado`) values ('PY','17','Alto Paraguay','Inactivo');

/*Table structure for table `distritos` */

DROP TABLE IF EXISTS `distritos`;

CREATE TABLE `distritos` (
  `codigo_pais` varchar(30) NOT NULL,
  `cod_depart` varchar(4) NOT NULL,
  `dist_num` varchar(4) NOT NULL,
  `nombre` varchar(254) DEFAULT NULL,
  PRIMARY KEY (`codigo_pais`,`cod_depart`,`dist_num`),
  CONSTRAINT `Refdepartamentos243` FOREIGN KEY (`codigo_pais`, `cod_depart`) REFERENCES `departamentos` (`codigo_pais`, `cod_depart`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `distritos` */

insert  into `distritos`(`codigo_pais`,`cod_depart`,`dist_num`,`nombre`) values ('PY','00','00','ASUNCION');
insert  into `distritos`(`codigo_pais`,`cod_depart`,`dist_num`,`nombre`) values ('PY','01','01','CONCEPCION');
insert  into `distritos`(`codigo_pais`,`cod_depart`,`dist_num`,`nombre`) values ('PY','01','02','BELEN');
insert  into `distritos`(`codigo_pais`,`cod_depart`,`dist_num`,`nombre`) values ('PY','01','03','HORQUETA');
insert  into `distritos`(`codigo_pais`,`cod_depart`,`dist_num`,`nombre`) values ('PY','01','04','LORETO');
insert  into `distritos`(`codigo_pais`,`cod_depart`,`dist_num`,`nombre`) values ('PY','01','05','SAN CARLOS');
insert  into `distritos`(`codigo_pais`,`cod_depart`,`dist_num`,`nombre`) values ('PY','01','06','SAN LAZARO');
insert  into `distritos`(`codigo_pais`,`cod_depart`,`dist_num`,`nombre`) values ('PY','01','07','YVY YA`U');
insert  into `distritos`(`codigo_pais`,`cod_depart`,`dist_num`,`nombre`) values ('PY','01','08','AZOTEY');
insert  into `distritos`(`codigo_pais`,`cod_depart`,`dist_num`,`nombre`) values ('PY','01','09','SGTO. JOSE FELIX LOPEZ');
insert  into `distritos`(`codigo_pais`,`cod_depart`,`dist_num`,`nombre`) values ('PY','01','10','SAN ALFREDO');
insert  into `distritos`(`codigo_pais`,`cod_depart`,`dist_num`,`nombre`) values ('PY','01','11','PASO BARRETO');
insert  into `distritos`(`codigo_pais`,`cod_depart`,`dist_num`,`nombre`) values ('PY','02','01','SAN PEDRO DEL YKUAMANDIYU');
insert  into `distritos`(`codigo_pais`,`cod_depart`,`dist_num`,`nombre`) values ('PY','02','02','ANTEQUERA');
insert  into `distritos`(`codigo_pais`,`cod_depart`,`dist_num`,`nombre`) values ('PY','02','03','CHORE');
insert  into `distritos`(`codigo_pais`,`cod_depart`,`dist_num`,`nombre`) values ('PY','02','04','GENERAL ELIZARDO AQUINO');
insert  into `distritos`(`codigo_pais`,`cod_depart`,`dist_num`,`nombre`) values ('PY','02','05','ITACURUBI DEL ROSARIO');
insert  into `distritos`(`codigo_pais`,`cod_depart`,`dist_num`,`nombre`) values ('PY','02','06','LIMA');
insert  into `distritos`(`codigo_pais`,`cod_depart`,`dist_num`,`nombre`) values ('PY','02','07','NUEVA GERMANIA');
insert  into `distritos`(`codigo_pais`,`cod_depart`,`dist_num`,`nombre`) values ('PY','02','08','SAN ESTANISLAO');
insert  into `distritos`(`codigo_pais`,`cod_depart`,`dist_num`,`nombre`) values ('PY','02','09','SAN PABLO');
insert  into `distritos`(`codigo_pais`,`cod_depart`,`dist_num`,`nombre`) values ('PY','02','10','TACUATI');
insert  into `distritos`(`codigo_pais`,`cod_depart`,`dist_num`,`nombre`) values ('PY','02','11','UNION');
insert  into `distritos`(`codigo_pais`,`cod_depart`,`dist_num`,`nombre`) values ('PY','02','12','25 DE DICIEMBRE');
insert  into `distritos`(`codigo_pais`,`cod_depart`,`dist_num`,`nombre`) values ('PY','02','13','VILLA DEL ROSARIO');
insert  into `distritos`(`codigo_pais`,`cod_depart`,`dist_num`,`nombre`) values ('PY','02','14','GENERAL RESQUIN');
insert  into `distritos`(`codigo_pais`,`cod_depart`,`dist_num`,`nombre`) values ('PY','02','15','YATAITY DEL NORTE');
insert  into `distritos`(`codigo_pais`,`cod_depart`,`dist_num`,`nombre`) values ('PY','02','16','GUAJAYVI');
insert  into `distritos`(`codigo_pais`,`cod_depart`,`dist_num`,`nombre`) values ('PY','02','17','CAPIIBARY');
insert  into `distritos`(`codigo_pais`,`cod_depart`,`dist_num`,`nombre`) values ('PY','02','18','SANTA ROSA DEL AGUARAY');
insert  into `distritos`(`codigo_pais`,`cod_depart`,`dist_num`,`nombre`) values ('PY','02','19','YRYVU CUA');
insert  into `distritos`(`codigo_pais`,`cod_depart`,`dist_num`,`nombre`) values ('PY','02','20','LIBERACION');
insert  into `distritos`(`codigo_pais`,`cod_depart`,`dist_num`,`nombre`) values ('PY','03','01','CAACUPE');
insert  into `distritos`(`codigo_pais`,`cod_depart`,`dist_num`,`nombre`) values ('PY','03','02','ALTOS');
insert  into `distritos`(`codigo_pais`,`cod_depart`,`dist_num`,`nombre`) values ('PY','03','03','ARROYOS Y ESTEROS');
insert  into `distritos`(`codigo_pais`,`cod_depart`,`dist_num`,`nombre`) values ('PY','03','04','ATYRA');
insert  into `distritos`(`codigo_pais`,`cod_depart`,`dist_num`,`nombre`) values ('PY','03','05','CARAGUATAY');
insert  into `distritos`(`codigo_pais`,`cod_depart`,`dist_num`,`nombre`) values ('PY','03','06','EMBOSCADA');
insert  into `distritos`(`codigo_pais`,`cod_depart`,`dist_num`,`nombre`) values ('PY','03','07','EUSEBIO AYALA');
insert  into `distritos`(`codigo_pais`,`cod_depart`,`dist_num`,`nombre`) values ('PY','03','08','ISLA PUCU');
insert  into `distritos`(`codigo_pais`,`cod_depart`,`dist_num`,`nombre`) values ('PY','03','09','ITACURUBI DE LA CORDILLERA');
insert  into `distritos`(`codigo_pais`,`cod_depart`,`dist_num`,`nombre`) values ('PY','03','10','JUAN DE MENA');
insert  into `distritos`(`codigo_pais`,`cod_depart`,`dist_num`,`nombre`) values ('PY','03','11','LOMA GRANDE');
insert  into `distritos`(`codigo_pais`,`cod_depart`,`dist_num`,`nombre`) values ('PY','03','12','MBOCAYATY DEL YHAGUY');
insert  into `distritos`(`codigo_pais`,`cod_depart`,`dist_num`,`nombre`) values ('PY','03','13','NUEVA COLOMBIA');
insert  into `distritos`(`codigo_pais`,`cod_depart`,`dist_num`,`nombre`) values ('PY','03','14','PIRIBEBUY');
insert  into `distritos`(`codigo_pais`,`cod_depart`,`dist_num`,`nombre`) values ('PY','03','15','PRIMERO DE MARZO');
insert  into `distritos`(`codigo_pais`,`cod_depart`,`dist_num`,`nombre`) values ('PY','03','16','SAN BERNARDINO');
insert  into `distritos`(`codigo_pais`,`cod_depart`,`dist_num`,`nombre`) values ('PY','03','17','SANTA ELENA');
insert  into `distritos`(`codigo_pais`,`cod_depart`,`dist_num`,`nombre`) values ('PY','03','18','TOBATI');
insert  into `distritos`(`codigo_pais`,`cod_depart`,`dist_num`,`nombre`) values ('PY','03','19','VALENZUELA');
insert  into `distritos`(`codigo_pais`,`cod_depart`,`dist_num`,`nombre`) values ('PY','03','20','SAN JOSE OBRERO');
insert  into `distritos`(`codigo_pais`,`cod_depart`,`dist_num`,`nombre`) values ('PY','04','01','VILLARRICA');
insert  into `distritos`(`codigo_pais`,`cod_depart`,`dist_num`,`nombre`) values ('PY','04','02','BORJA');
insert  into `distritos`(`codigo_pais`,`cod_depart`,`dist_num`,`nombre`) values ('PY','04','03','MAURICIO JOSE TROCHE');
insert  into `distritos`(`codigo_pais`,`cod_depart`,`dist_num`,`nombre`) values ('PY','04','04','CORONEL MARTINEZ');
insert  into `distritos`(`codigo_pais`,`cod_depart`,`dist_num`,`nombre`) values ('PY','04','05','FELIX PEREZ CARDOZO');
insert  into `distritos`(`codigo_pais`,`cod_depart`,`dist_num`,`nombre`) values ('PY','04','06','GENERAL EUGENIO A. GARAY');
insert  into `distritos`(`codigo_pais`,`cod_depart`,`dist_num`,`nombre`) values ('PY','04','07','COLONIA INDEPENDENCIA');
insert  into `distritos`(`codigo_pais`,`cod_depart`,`dist_num`,`nombre`) values ('PY','04','08','ITAPE');
insert  into `distritos`(`codigo_pais`,`cod_depart`,`dist_num`,`nombre`) values ('PY','04','09','ITURBE');
insert  into `distritos`(`codigo_pais`,`cod_depart`,`dist_num`,`nombre`) values ('PY','04','10','JOSE FASSARDI');
insert  into `distritos`(`codigo_pais`,`cod_depart`,`dist_num`,`nombre`) values ('PY','04','11','MBOCAYATY');
insert  into `distritos`(`codigo_pais`,`cod_depart`,`dist_num`,`nombre`) values ('PY','04','12','NATALICIO TALAVERA');
insert  into `distritos`(`codigo_pais`,`cod_depart`,`dist_num`,`nombre`) values ('PY','04','13','ÑUMI');
insert  into `distritos`(`codigo_pais`,`cod_depart`,`dist_num`,`nombre`) values ('PY','04','14','SAN SALVADOR');
insert  into `distritos`(`codigo_pais`,`cod_depart`,`dist_num`,`nombre`) values ('PY','04','15','YATAITY');
insert  into `distritos`(`codigo_pais`,`cod_depart`,`dist_num`,`nombre`) values ('PY','04','16','DR. BOTTRELL');
insert  into `distritos`(`codigo_pais`,`cod_depart`,`dist_num`,`nombre`) values ('PY','04','17','PASO YOBAI');
insert  into `distritos`(`codigo_pais`,`cod_depart`,`dist_num`,`nombre`) values ('PY','04','18','TEBICUARY');
insert  into `distritos`(`codigo_pais`,`cod_depart`,`dist_num`,`nombre`) values ('PY','05','01','CORONEL OVIEDO');
insert  into `distritos`(`codigo_pais`,`cod_depart`,`dist_num`,`nombre`) values ('PY','05','02','CAAGUAZU');
insert  into `distritos`(`codigo_pais`,`cod_depart`,`dist_num`,`nombre`) values ('PY','05','03','CARAYAO');
insert  into `distritos`(`codigo_pais`,`cod_depart`,`dist_num`,`nombre`) values ('PY','05','04','CECILIO BAEZ');
insert  into `distritos`(`codigo_pais`,`cod_depart`,`dist_num`,`nombre`) values ('PY','05','05','SANTA ROSA DEL MBUTUY');
insert  into `distritos`(`codigo_pais`,`cod_depart`,`dist_num`,`nombre`) values ('PY','05','06','DR. JUAN MANUEL FRUTOS');
insert  into `distritos`(`codigo_pais`,`cod_depart`,`dist_num`,`nombre`) values ('PY','05','07','REPATRIACION');
insert  into `distritos`(`codigo_pais`,`cod_depart`,`dist_num`,`nombre`) values ('PY','05','08','NUEVA LONDRES');
insert  into `distritos`(`codigo_pais`,`cod_depart`,`dist_num`,`nombre`) values ('PY','05','09','SAN JOAQUIN');
insert  into `distritos`(`codigo_pais`,`cod_depart`,`dist_num`,`nombre`) values ('PY','05','10','SAN JOSE DE LOS ARROYOS');
insert  into `distritos`(`codigo_pais`,`cod_depart`,`dist_num`,`nombre`) values ('PY','05','11','YHU');
insert  into `distritos`(`codigo_pais`,`cod_depart`,`dist_num`,`nombre`) values ('PY','05','12','J EULOGIO ESTIGARRIBIA');
insert  into `distritos`(`codigo_pais`,`cod_depart`,`dist_num`,`nombre`) values ('PY','05','13','R.I. 3 CORRALES');
insert  into `distritos`(`codigo_pais`,`cod_depart`,`dist_num`,`nombre`) values ('PY','05','14','RAUL ARSENIO OVIEDO');
insert  into `distritos`(`codigo_pais`,`cod_depart`,`dist_num`,`nombre`) values ('PY','05','15','JOSE DOMINGO OCAMPOS');
insert  into `distritos`(`codigo_pais`,`cod_depart`,`dist_num`,`nombre`) values ('PY','05','16','MCAL. FRANCISCO SOLANO LOPEZ');
insert  into `distritos`(`codigo_pais`,`cod_depart`,`dist_num`,`nombre`) values ('PY','05','17','LA PASTORA');
insert  into `distritos`(`codigo_pais`,`cod_depart`,`dist_num`,`nombre`) values ('PY','05','18','3 DE FEBRERO');
insert  into `distritos`(`codigo_pais`,`cod_depart`,`dist_num`,`nombre`) values ('PY','05','19','SIMON BOLIVAR');
insert  into `distritos`(`codigo_pais`,`cod_depart`,`dist_num`,`nombre`) values ('PY','05','20','VAQUERIA');
insert  into `distritos`(`codigo_pais`,`cod_depart`,`dist_num`,`nombre`) values ('PY','05','21','TEMBIAPORA');
insert  into `distritos`(`codigo_pais`,`cod_depart`,`dist_num`,`nombre`) values ('PY','05','22','NUEVA TOLEDO');
insert  into `distritos`(`codigo_pais`,`cod_depart`,`dist_num`,`nombre`) values ('PY','06','01','CAAZAPA');
insert  into `distritos`(`codigo_pais`,`cod_depart`,`dist_num`,`nombre`) values ('PY','06','02','ABAI');
insert  into `distritos`(`codigo_pais`,`cod_depart`,`dist_num`,`nombre`) values ('PY','06','03','BUENA VISTA');
insert  into `distritos`(`codigo_pais`,`cod_depart`,`dist_num`,`nombre`) values ('PY','06','04','MOISES BERTONI');
insert  into `distritos`(`codigo_pais`,`cod_depart`,`dist_num`,`nombre`) values ('PY','06','05','GENERAL HIGINIO MORINIGO');
insert  into `distritos`(`codigo_pais`,`cod_depart`,`dist_num`,`nombre`) values ('PY','06','06','MACIEL');
insert  into `distritos`(`codigo_pais`,`cod_depart`,`dist_num`,`nombre`) values ('PY','06','07','SAN JUAN NEPOMUCENO');
insert  into `distritos`(`codigo_pais`,`cod_depart`,`dist_num`,`nombre`) values ('PY','06','08','TAVAI');
insert  into `distritos`(`codigo_pais`,`cod_depart`,`dist_num`,`nombre`) values ('PY','06','09','FULGENCIO YEGROS');
insert  into `distritos`(`codigo_pais`,`cod_depart`,`dist_num`,`nombre`) values ('PY','06','10','YUTY');
insert  into `distritos`(`codigo_pais`,`cod_depart`,`dist_num`,`nombre`) values ('PY','06','11','3 DE MAYO');
insert  into `distritos`(`codigo_pais`,`cod_depart`,`dist_num`,`nombre`) values ('PY','07','01','ENCARNACION');
insert  into `distritos`(`codigo_pais`,`cod_depart`,`dist_num`,`nombre`) values ('PY','07','02','BELLA VISTA');
insert  into `distritos`(`codigo_pais`,`cod_depart`,`dist_num`,`nombre`) values ('PY','07','03','CAMBYRETA');
insert  into `distritos`(`codigo_pais`,`cod_depart`,`dist_num`,`nombre`) values ('PY','07','04','CAPITAN MEZA');
insert  into `distritos`(`codigo_pais`,`cod_depart`,`dist_num`,`nombre`) values ('PY','07','05','CAPITAN MIRANDA');
insert  into `distritos`(`codigo_pais`,`cod_depart`,`dist_num`,`nombre`) values ('PY','07','06','NUEVA ALBORADA');
insert  into `distritos`(`codigo_pais`,`cod_depart`,`dist_num`,`nombre`) values ('PY','07','07','CARMEN DEL PARANA');
insert  into `distritos`(`codigo_pais`,`cod_depart`,`dist_num`,`nombre`) values ('PY','07','08','CORONEL BOGADO');
insert  into `distritos`(`codigo_pais`,`cod_depart`,`dist_num`,`nombre`) values ('PY','07','09','CARLOS ANTONIO LOPEZ');
insert  into `distritos`(`codigo_pais`,`cod_depart`,`dist_num`,`nombre`) values ('PY','07','10','NATALIO');
insert  into `distritos`(`codigo_pais`,`cod_depart`,`dist_num`,`nombre`) values ('PY','07','11','FRAM');
insert  into `distritos`(`codigo_pais`,`cod_depart`,`dist_num`,`nombre`) values ('PY','07','12','GENERAL ARTIGAS');
insert  into `distritos`(`codigo_pais`,`cod_depart`,`dist_num`,`nombre`) values ('PY','07','13','GENERAL DELGADO');
insert  into `distritos`(`codigo_pais`,`cod_depart`,`dist_num`,`nombre`) values ('PY','07','14','HOHENAU');
insert  into `distritos`(`codigo_pais`,`cod_depart`,`dist_num`,`nombre`) values ('PY','07','15','JESUS');
insert  into `distritos`(`codigo_pais`,`cod_depart`,`dist_num`,`nombre`) values ('PY','07','16','LEANDRO OVIEDO');
insert  into `distritos`(`codigo_pais`,`cod_depart`,`dist_num`,`nombre`) values ('PY','07','17','OBLIGADO');
insert  into `distritos`(`codigo_pais`,`cod_depart`,`dist_num`,`nombre`) values ('PY','07','18','MAYOR OTAÑO');
insert  into `distritos`(`codigo_pais`,`cod_depart`,`dist_num`,`nombre`) values ('PY','07','19','SAN COSME Y DAMIAN');
insert  into `distritos`(`codigo_pais`,`cod_depart`,`dist_num`,`nombre`) values ('PY','07','20','SAN PEDRO DEL PARANA');
insert  into `distritos`(`codigo_pais`,`cod_depart`,`dist_num`,`nombre`) values ('PY','07','21','SAN RAFAEL DEL PARANA');
insert  into `distritos`(`codigo_pais`,`cod_depart`,`dist_num`,`nombre`) values ('PY','07','22','TRINIDAD');
insert  into `distritos`(`codigo_pais`,`cod_depart`,`dist_num`,`nombre`) values ('PY','07','23','EDELIRA');
insert  into `distritos`(`codigo_pais`,`cod_depart`,`dist_num`,`nombre`) values ('PY','07','24','TOMAS ROMERO PEREIRA');
insert  into `distritos`(`codigo_pais`,`cod_depart`,`dist_num`,`nombre`) values ('PY','07','25','ALTO VERA');
insert  into `distritos`(`codigo_pais`,`cod_depart`,`dist_num`,`nombre`) values ('PY','07','26','LA PAZ');
insert  into `distritos`(`codigo_pais`,`cod_depart`,`dist_num`,`nombre`) values ('PY','07','27','YATYTAY');
insert  into `distritos`(`codigo_pais`,`cod_depart`,`dist_num`,`nombre`) values ('PY','07','28','SAN JUAN DEL PARANA');
insert  into `distritos`(`codigo_pais`,`cod_depart`,`dist_num`,`nombre`) values ('PY','07','29','PIRAPO');
insert  into `distritos`(`codigo_pais`,`cod_depart`,`dist_num`,`nombre`) values ('PY','07','30','ITAPUA POTY');
insert  into `distritos`(`codigo_pais`,`cod_depart`,`dist_num`,`nombre`) values ('PY','08','01','SAN JUAN BAUTISTA');
insert  into `distritos`(`codigo_pais`,`cod_depart`,`dist_num`,`nombre`) values ('PY','08','02','AYOLAS');
insert  into `distritos`(`codigo_pais`,`cod_depart`,`dist_num`,`nombre`) values ('PY','08','03','SAN IGNACIO');
insert  into `distritos`(`codigo_pais`,`cod_depart`,`dist_num`,`nombre`) values ('PY','08','04','SAN MIGUEL');
insert  into `distritos`(`codigo_pais`,`cod_depart`,`dist_num`,`nombre`) values ('PY','08','05','SAN PATRICIO');
insert  into `distritos`(`codigo_pais`,`cod_depart`,`dist_num`,`nombre`) values ('PY','08','06','SANTA MARIA');
insert  into `distritos`(`codigo_pais`,`cod_depart`,`dist_num`,`nombre`) values ('PY','08','07','SANTA ROSA');
insert  into `distritos`(`codigo_pais`,`cod_depart`,`dist_num`,`nombre`) values ('PY','08','08','SANTIAGO');
insert  into `distritos`(`codigo_pais`,`cod_depart`,`dist_num`,`nombre`) values ('PY','08','09','VILLA FLORIDA');
insert  into `distritos`(`codigo_pais`,`cod_depart`,`dist_num`,`nombre`) values ('PY','08','10','YABEBYRY');
insert  into `distritos`(`codigo_pais`,`cod_depart`,`dist_num`,`nombre`) values ('PY','09','01','PARAGUARI');
insert  into `distritos`(`codigo_pais`,`cod_depart`,`dist_num`,`nombre`) values ('PY','09','02','ACAHAY');
insert  into `distritos`(`codigo_pais`,`cod_depart`,`dist_num`,`nombre`) values ('PY','09','03','CAAPUCU');
insert  into `distritos`(`codigo_pais`,`cod_depart`,`dist_num`,`nombre`) values ('PY','09','04','GENERAL BERNARDINO CABALLERO');
insert  into `distritos`(`codigo_pais`,`cod_depart`,`dist_num`,`nombre`) values ('PY','09','05','CARAPEGUA');
insert  into `distritos`(`codigo_pais`,`cod_depart`,`dist_num`,`nombre`) values ('PY','09','06','ESCOBAR');
insert  into `distritos`(`codigo_pais`,`cod_depart`,`dist_num`,`nombre`) values ('PY','09','07','LA COLMENA');
insert  into `distritos`(`codigo_pais`,`cod_depart`,`dist_num`,`nombre`) values ('PY','09','08','MBUYAPEY');
insert  into `distritos`(`codigo_pais`,`cod_depart`,`dist_num`,`nombre`) values ('PY','09','09','PIRAYU');
insert  into `distritos`(`codigo_pais`,`cod_depart`,`dist_num`,`nombre`) values ('PY','09','10','QUIINDY');
insert  into `distritos`(`codigo_pais`,`cod_depart`,`dist_num`,`nombre`) values ('PY','09','11','QUYQUYHO');
insert  into `distritos`(`codigo_pais`,`cod_depart`,`dist_num`,`nombre`) values ('PY','09','12','SAN ROQUE GONZALEZ');
insert  into `distritos`(`codigo_pais`,`cod_depart`,`dist_num`,`nombre`) values ('PY','09','13','SAPUCAI');
insert  into `distritos`(`codigo_pais`,`cod_depart`,`dist_num`,`nombre`) values ('PY','09','14','TEBICUARY-MI');
insert  into `distritos`(`codigo_pais`,`cod_depart`,`dist_num`,`nombre`) values ('PY','09','15','YAGUARON');
insert  into `distritos`(`codigo_pais`,`cod_depart`,`dist_num`,`nombre`) values ('PY','09','16','YBYCUI');
insert  into `distritos`(`codigo_pais`,`cod_depart`,`dist_num`,`nombre`) values ('PY','09','17','YVYTIMI');
insert  into `distritos`(`codigo_pais`,`cod_depart`,`dist_num`,`nombre`) values ('PY','10','01','CIUDAD DEL ESTE');
insert  into `distritos`(`codigo_pais`,`cod_depart`,`dist_num`,`nombre`) values ('PY','10','02','PRESIDENTE FRANCO');
insert  into `distritos`(`codigo_pais`,`cod_depart`,`dist_num`,`nombre`) values ('PY','10','03','DOMINGO MARTINEZ DE IRALA');
insert  into `distritos`(`codigo_pais`,`cod_depart`,`dist_num`,`nombre`) values ('PY','10','04','DR. JUAN LEON MALLORQUIN');
insert  into `distritos`(`codigo_pais`,`cod_depart`,`dist_num`,`nombre`) values ('PY','10','05','HERNANDARIAS');
insert  into `distritos`(`codigo_pais`,`cod_depart`,`dist_num`,`nombre`) values ('PY','10','06','ITAKYRY');
insert  into `distritos`(`codigo_pais`,`cod_depart`,`dist_num`,`nombre`) values ('PY','10','07','JUAN E. OLEARY');
insert  into `distritos`(`codigo_pais`,`cod_depart`,`dist_num`,`nombre`) values ('PY','10','08','ÑACUNDAY');
insert  into `distritos`(`codigo_pais`,`cod_depart`,`dist_num`,`nombre`) values ('PY','10','09','YGUAZU');
insert  into `distritos`(`codigo_pais`,`cod_depart`,`dist_num`,`nombre`) values ('PY','10','10','LOS CEDRALES');
insert  into `distritos`(`codigo_pais`,`cod_depart`,`dist_num`,`nombre`) values ('PY','10','11','MINGA GUAZU');
insert  into `distritos`(`codigo_pais`,`cod_depart`,`dist_num`,`nombre`) values ('PY','10','12','SAN CRISTOBAL');
insert  into `distritos`(`codigo_pais`,`cod_depart`,`dist_num`,`nombre`) values ('PY','10','13','SANTA RITA');
insert  into `distritos`(`codigo_pais`,`cod_depart`,`dist_num`,`nombre`) values ('PY','10','14','NARANJAL');
insert  into `distritos`(`codigo_pais`,`cod_depart`,`dist_num`,`nombre`) values ('PY','10','15','SANTA ROSA DEL MONDAY');
insert  into `distritos`(`codigo_pais`,`cod_depart`,`dist_num`,`nombre`) values ('PY','10','16','MINGA PORA');
insert  into `distritos`(`codigo_pais`,`cod_depart`,`dist_num`,`nombre`) values ('PY','10','17','MBARACAYU');
insert  into `distritos`(`codigo_pais`,`cod_depart`,`dist_num`,`nombre`) values ('PY','10','18','SAN ALBERTO');
insert  into `distritos`(`codigo_pais`,`cod_depart`,`dist_num`,`nombre`) values ('PY','10','19','IRUÑA');
insert  into `distritos`(`codigo_pais`,`cod_depart`,`dist_num`,`nombre`) values ('PY','10','20','SANTA FE DEL PARANA');
insert  into `distritos`(`codigo_pais`,`cod_depart`,`dist_num`,`nombre`) values ('PY','10','21','TAVAPY');
insert  into `distritos`(`codigo_pais`,`cod_depart`,`dist_num`,`nombre`) values ('PY','10','22','DR. RAUL PEÑA');
insert  into `distritos`(`codigo_pais`,`cod_depart`,`dist_num`,`nombre`) values ('PY','11','01','AREGUA');
insert  into `distritos`(`codigo_pais`,`cod_depart`,`dist_num`,`nombre`) values ('PY','11','02','CAPIATA');
insert  into `distritos`(`codigo_pais`,`cod_depart`,`dist_num`,`nombre`) values ('PY','11','03','FERNANDO DE LA MORA');
insert  into `distritos`(`codigo_pais`,`cod_depart`,`dist_num`,`nombre`) values ('PY','11','04','GUARAMBARE');
insert  into `distritos`(`codigo_pais`,`cod_depart`,`dist_num`,`nombre`) values ('PY','11','05','ITA');
insert  into `distritos`(`codigo_pais`,`cod_depart`,`dist_num`,`nombre`) values ('PY','11','06','ITAUGUA');
insert  into `distritos`(`codigo_pais`,`cod_depart`,`dist_num`,`nombre`) values ('PY','11','07','LAMBARE');
insert  into `distritos`(`codigo_pais`,`cod_depart`,`dist_num`,`nombre`) values ('PY','11','08','LIMPIO');
insert  into `distritos`(`codigo_pais`,`cod_depart`,`dist_num`,`nombre`) values ('PY','11','09','LUQUE');
insert  into `distritos`(`codigo_pais`,`cod_depart`,`dist_num`,`nombre`) values ('PY','11','10','MARIANO ROQUE ALONSO');
insert  into `distritos`(`codigo_pais`,`cod_depart`,`dist_num`,`nombre`) values ('PY','11','11','NUEVA ITALIA');
insert  into `distritos`(`codigo_pais`,`cod_depart`,`dist_num`,`nombre`) values ('PY','11','12','ÐEMBY');
insert  into `distritos`(`codigo_pais`,`cod_depart`,`dist_num`,`nombre`) values ('PY','11','13','SAN ANTONIO');
insert  into `distritos`(`codigo_pais`,`cod_depart`,`dist_num`,`nombre`) values ('PY','11','14','SAN LORENZO');
insert  into `distritos`(`codigo_pais`,`cod_depart`,`dist_num`,`nombre`) values ('PY','11','15','VILLA ELISA');
insert  into `distritos`(`codigo_pais`,`cod_depart`,`dist_num`,`nombre`) values ('PY','11','16','VILLETA');
insert  into `distritos`(`codigo_pais`,`cod_depart`,`dist_num`,`nombre`) values ('PY','11','17','YPACARAI');
insert  into `distritos`(`codigo_pais`,`cod_depart`,`dist_num`,`nombre`) values ('PY','11','18','YPANE');
insert  into `distritos`(`codigo_pais`,`cod_depart`,`dist_num`,`nombre`) values ('PY','11','19','J AUGUSTO SALDIVAR');
insert  into `distritos`(`codigo_pais`,`cod_depart`,`dist_num`,`nombre`) values ('PY','12','01','PILAR');
insert  into `distritos`(`codigo_pais`,`cod_depart`,`dist_num`,`nombre`) values ('PY','12','02','ALBERDI');
insert  into `distritos`(`codigo_pais`,`cod_depart`,`dist_num`,`nombre`) values ('PY','12','03','CERRITO');
insert  into `distritos`(`codigo_pais`,`cod_depart`,`dist_num`,`nombre`) values ('PY','12','04','DESMOCHADOS');
insert  into `distritos`(`codigo_pais`,`cod_depart`,`dist_num`,`nombre`) values ('PY','12','05','GENERAL DIAZ');
insert  into `distritos`(`codigo_pais`,`cod_depart`,`dist_num`,`nombre`) values ('PY','12','06','GUAZU CUA');
insert  into `distritos`(`codigo_pais`,`cod_depart`,`dist_num`,`nombre`) values ('PY','12','07','HUMAITA');
insert  into `distritos`(`codigo_pais`,`cod_depart`,`dist_num`,`nombre`) values ('PY','12','08','ISLA UMBU');
insert  into `distritos`(`codigo_pais`,`cod_depart`,`dist_num`,`nombre`) values ('PY','12','09','LOS LAURELES');
insert  into `distritos`(`codigo_pais`,`cod_depart`,`dist_num`,`nombre`) values ('PY','12','10','MAYOR MARTINEZ');
insert  into `distritos`(`codigo_pais`,`cod_depart`,`dist_num`,`nombre`) values ('PY','12','11','PASO DE PATRIA');
insert  into `distritos`(`codigo_pais`,`cod_depart`,`dist_num`,`nombre`) values ('PY','12','12','SAN JUAN BAUTISTA DE ÐEEMBUCU');
insert  into `distritos`(`codigo_pais`,`cod_depart`,`dist_num`,`nombre`) values ('PY','12','13','TACUARAS');
insert  into `distritos`(`codigo_pais`,`cod_depart`,`dist_num`,`nombre`) values ('PY','12','14','VILLA FRANCA');
insert  into `distritos`(`codigo_pais`,`cod_depart`,`dist_num`,`nombre`) values ('PY','12','15','VILLA OLIVA');
insert  into `distritos`(`codigo_pais`,`cod_depart`,`dist_num`,`nombre`) values ('PY','12','16','VILLALBIN');
insert  into `distritos`(`codigo_pais`,`cod_depart`,`dist_num`,`nombre`) values ('PY','13','01','PEDRO JUAN CABALLERO');
insert  into `distritos`(`codigo_pais`,`cod_depart`,`dist_num`,`nombre`) values ('PY','13','02','BELLA VISTA');
insert  into `distritos`(`codigo_pais`,`cod_depart`,`dist_num`,`nombre`) values ('PY','13','03','CAPITAN BADO');
insert  into `distritos`(`codigo_pais`,`cod_depart`,`dist_num`,`nombre`) values ('PY','13','04','ZANJA PYTA');
insert  into `distritos`(`codigo_pais`,`cod_depart`,`dist_num`,`nombre`) values ('PY','13','05','KARAPA`I');
insert  into `distritos`(`codigo_pais`,`cod_depart`,`dist_num`,`nombre`) values ('PY','14','01','SALTOS DEL GUAIRA');
insert  into `distritos`(`codigo_pais`,`cod_depart`,`dist_num`,`nombre`) values ('PY','14','02','CORPUS CHRISTI');
insert  into `distritos`(`codigo_pais`,`cod_depart`,`dist_num`,`nombre`) values ('PY','14','03','CURUGUATY');
insert  into `distritos`(`codigo_pais`,`cod_depart`,`dist_num`,`nombre`) values ('PY','14','04','VILLA YGATIMI');
insert  into `distritos`(`codigo_pais`,`cod_depart`,`dist_num`,`nombre`) values ('PY','14','05','ITANARA');
insert  into `distritos`(`codigo_pais`,`cod_depart`,`dist_num`,`nombre`) values ('PY','14','06','YPE JHU');
insert  into `distritos`(`codigo_pais`,`cod_depart`,`dist_num`,`nombre`) values ('PY','14','07','FRANCISCO CABALLERO ALVAREZ');
insert  into `distritos`(`codigo_pais`,`cod_depart`,`dist_num`,`nombre`) values ('PY','14','08','KATUETE');
insert  into `distritos`(`codigo_pais`,`cod_depart`,`dist_num`,`nombre`) values ('PY','14','09','LA PALOMA');
insert  into `distritos`(`codigo_pais`,`cod_depart`,`dist_num`,`nombre`) values ('PY','14','10','NUEVA ESPERANZA');
insert  into `distritos`(`codigo_pais`,`cod_depart`,`dist_num`,`nombre`) values ('PY','14','11','YASY KAÑY');
insert  into `distritos`(`codigo_pais`,`cod_depart`,`dist_num`,`nombre`) values ('PY','14','12','YBYRAROBANA');
insert  into `distritos`(`codigo_pais`,`cod_depart`,`dist_num`,`nombre`) values ('PY','14','13','YBY PYTA');
insert  into `distritos`(`codigo_pais`,`cod_depart`,`dist_num`,`nombre`) values ('PY','15','02','BENJAMIN ACEVAL');
insert  into `distritos`(`codigo_pais`,`cod_depart`,`dist_num`,`nombre`) values ('PY','15','03','PUERTO PINASCO');
insert  into `distritos`(`codigo_pais`,`cod_depart`,`dist_num`,`nombre`) values ('PY','15','04','VILLA HAYES');
insert  into `distritos`(`codigo_pais`,`cod_depart`,`dist_num`,`nombre`) values ('PY','15','05','NANAWA');
insert  into `distritos`(`codigo_pais`,`cod_depart`,`dist_num`,`nombre`) values ('PY','15','06','JOSE FALCON');
insert  into `distritos`(`codigo_pais`,`cod_depart`,`dist_num`,`nombre`) values ('PY','15','07','TTE 1RO MANUEL IRALA FERNANDEZ');
insert  into `distritos`(`codigo_pais`,`cod_depart`,`dist_num`,`nombre`) values ('PY','15','08','TTE. ESTEBAN MARTINEZ');
insert  into `distritos`(`codigo_pais`,`cod_depart`,`dist_num`,`nombre`) values ('PY','15','09','GRAL JOSE MARIA BRUGUEZ');
insert  into `distritos`(`codigo_pais`,`cod_depart`,`dist_num`,`nombre`) values ('PY','16','02','MARISCAL ESTIGARRIBIA');
insert  into `distritos`(`codigo_pais`,`cod_depart`,`dist_num`,`nombre`) values ('PY','16','04','FILADELFIA');
insert  into `distritos`(`codigo_pais`,`cod_depart`,`dist_num`,`nombre`) values ('PY','16','05','LOMA PLATA');
insert  into `distritos`(`codigo_pais`,`cod_depart`,`dist_num`,`nombre`) values ('PY','17','01','FUERTE OLIMPO');
insert  into `distritos`(`codigo_pais`,`cod_depart`,`dist_num`,`nombre`) values ('PY','17','02','PUERTO CASADO');
insert  into `distritos`(`codigo_pais`,`cod_depart`,`dist_num`,`nombre`) values ('PY','17','04','BAHIA NEGRA');
insert  into `distritos`(`codigo_pais`,`cod_depart`,`dist_num`,`nombre`) values ('PY','17','05','CARMELO PERALTA');

/*Table structure for table `entidades` */

DROP TABLE IF EXISTS `entidades`;

CREATE TABLE `entidades` (
  `cod_ent` int(11) NOT NULL AUTO_INCREMENT,
  `tipo_doc` varchar(30) DEFAULT NULL,
  `ci_ruc` varchar(30) DEFAULT NULL,
  `nombre` varchar(60) DEFAULT NULL,
  `tel` varchar(30) DEFAULT NULL,
  `email` varchar(40) DEFAULT NULL,
  `fecha_nac` date DEFAULT NULL,
  `codigo_pais` varchar(30) NOT NULL,
  `cod_depart` varchar(4) NOT NULL,
  `dist_num` varchar(4) NOT NULL,
  `ciudad` varchar(30) DEFAULT NULL,
  `dir` varchar(60) DEFAULT NULL,
  `tipo` varchar(16) DEFAULT NULL,
  `fecha_reg` date DEFAULT NULL,
  `estado` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`cod_ent`),
  KEY `Refdistritos244` (`codigo_pais`,`cod_depart`,`dist_num`),
  CONSTRAINT `Refdistritos244` FOREIGN KEY (`codigo_pais`, `cod_depart`, `dist_num`) REFERENCES `distritos` (`codigo_pais`, `cod_depart`, `dist_num`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;

/*Data for the table `entidades` */

insert  into `entidades`(`cod_ent`,`tipo_doc`,`ci_ruc`,`nombre`,`tel`,`email`,`fecha_nac`,`codigo_pais`,`cod_depart`,`dist_num`,`ciudad`,`dir`,`tipo`,`fecha_reg`,`estado`) values (1,'RUC','1234564','GOBERNACION DE ITAPUA','595 71 204 568 / 595 71 204 81','',NULL,'PY','07','02','','','C1',NULL,'Activo');
insert  into `entidades`(`cod_ent`,`tipo_doc`,`ci_ruc`,`nombre`,`tel`,`email`,`fecha_nac`,`codigo_pais`,`cod_depart`,`dist_num`,`ciudad`,`dir`,`tipo`,`fecha_reg`,`estado`) values (2,'RUC','','GOBERNACION DE PARAGUARI','','',NULL,'PY','09','01','','','C1',NULL,'Activo');
insert  into `entidades`(`cod_ent`,`tipo_doc`,`ci_ruc`,`nombre`,`tel`,`email`,`fecha_nac`,`codigo_pais`,`cod_depart`,`dist_num`,`ciudad`,`dir`,`tipo`,`fecha_reg`,`estado`) values (3,'RUC','','GOBERNACION DE MISIONES','','',NULL,'PY','08','01','','','C1',NULL,'Activo');
insert  into `entidades`(`cod_ent`,`tipo_doc`,`ci_ruc`,`nombre`,`tel`,`email`,`fecha_nac`,`codigo_pais`,`cod_depart`,`dist_num`,`ciudad`,`dir`,`tipo`,`fecha_reg`,`estado`) values (4,'RUC','','MUNICIPALIDAD DE YABEBYRY','','',NULL,'PY','07','05','','','C1',NULL,'Activo');
insert  into `entidades`(`cod_ent`,`tipo_doc`,`ci_ruc`,`nombre`,`tel`,`email`,`fecha_nac`,`codigo_pais`,`cod_depart`,`dist_num`,`ciudad`,`dir`,`tipo`,`fecha_reg`,`estado`) values (5,'RUC','','MUNICIPALIDAD DE CAPITAN MIRANDA','','',NULL,'PY','07','22','','','C1',NULL,'Activo');
insert  into `entidades`(`cod_ent`,`tipo_doc`,`ci_ruc`,`nombre`,`tel`,`email`,`fecha_nac`,`codigo_pais`,`cod_depart`,`dist_num`,`ciudad`,`dir`,`tipo`,`fecha_reg`,`estado`) values (6,'RUC','','MUNICIPALIDAD (REUTILIZAR)','','',NULL,'PY','07','08','','','C1',NULL,'Inactivo');
insert  into `entidades`(`cod_ent`,`tipo_doc`,`ci_ruc`,`nombre`,`tel`,`email`,`fecha_nac`,`codigo_pais`,`cod_depart`,`dist_num`,`ciudad`,`dir`,`tipo`,`fecha_reg`,`estado`) values (8,'RUC','','MUNICIPALIDAD DE CORONEL BOGADO','','',NULL,'PY','08','10','','','C1',NULL,'Activo');
insert  into `entidades`(`cod_ent`,`tipo_doc`,`ci_ruc`,`nombre`,`tel`,`email`,`fecha_nac`,`codigo_pais`,`cod_depart`,`dist_num`,`ciudad`,`dir`,`tipo`,`fecha_reg`,`estado`) values (9,'RUC','','MUNICIPALIDAD DE ALTO VERA','','',NULL,'PY','07','25','','','C1',NULL,'Activo');
insert  into `entidades`(`cod_ent`,`tipo_doc`,`ci_ruc`,`nombre`,`tel`,`email`,`fecha_nac`,`codigo_pais`,`cod_depart`,`dist_num`,`ciudad`,`dir`,`tipo`,`fecha_reg`,`estado`) values (10,'RUC','','MUNICIPALIDAD DE SAN JUAN DEL PARANA','','',NULL,'PY','07','28','','','ci',NULL,'Activo');
insert  into `entidades`(`cod_ent`,`tipo_doc`,`ci_ruc`,`nombre`,`tel`,`email`,`fecha_nac`,`codigo_pais`,`cod_depart`,`dist_num`,`ciudad`,`dir`,`tipo`,`fecha_reg`,`estado`) values (11,'RUC','','MUNICIPALIDAD DE FRAM','','',NULL,'PY','07','11','','','C1',NULL,'Activo');
insert  into `entidades`(`cod_ent`,`tipo_doc`,`ci_ruc`,`nombre`,`tel`,`email`,`fecha_nac`,`codigo_pais`,`cod_depart`,`dist_num`,`ciudad`,`dir`,`tipo`,`fecha_reg`,`estado`) values (12,'RUC','','MUNICIPALIDAD DE PIRAPO','','',NULL,'PY','07','29','','','C1',NULL,'Activo');

/*Table structure for table `grupos` */

DROP TABLE IF EXISTS `grupos`;

CREATE TABLE `grupos` (
  `id_grupo` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(30) DEFAULT NULL,
  `descrip` varchar(1024) DEFAULT NULL,
  `modulo` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id_grupo`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

/*Data for the table `grupos` */

insert  into `grupos`(`id_grupo`,`nombre`,`descrip`,`modulo`) values (1,'Operadoras','Operadores y Operadoras del Call Center','Operadores');
insert  into `grupos`(`id_grupo`,`nombre`,`descrip`,`modulo`) values (2,'Administradores','Administradores','Admin');
insert  into `grupos`(`id_grupo`,`nombre`,`descrip`,`modulo`) values (3,'TI','Gerentes de Tecnologia','Admin');

/*Table structure for table `instituciones` */

DROP TABLE IF EXISTS `instituciones`;

CREATE TABLE `instituciones` (
  `cod_inst` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(254) DEFAULT NULL,
  `ci_ruc` varchar(16) DEFAULT NULL,
  `tel` varchar(254) DEFAULT NULL,
  `email` varchar(80) DEFAULT NULL,
  `codigo_pais` varchar(30) NOT NULL,
  `cod_depart` varchar(4) NOT NULL,
  `dist_num` varchar(4) NOT NULL,
  `dir` varchar(60) DEFAULT NULL,
  `cod_ent` int(11) NOT NULL,
  `suc` varchar(10) NOT NULL,
  `estado` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`cod_inst`),
  KEY `Refdistritos252` (`codigo_pais`,`cod_depart`,`dist_num`),
  KEY `Refentidades253` (`cod_ent`),
  KEY `Refsucursales254` (`suc`),
  CONSTRAINT `Refdistritos252` FOREIGN KEY (`codigo_pais`, `cod_depart`, `dist_num`) REFERENCES `distritos` (`codigo_pais`, `cod_depart`, `dist_num`),
  CONSTRAINT `Refentidades253` FOREIGN KEY (`cod_ent`) REFERENCES `entidades` (`cod_ent`),
  CONSTRAINT `Refsucursales254` FOREIGN KEY (`suc`) REFERENCES `sucursales` (`suc`)
) ENGINE=InnoDB AUTO_INCREMENT=237 DEFAULT CHARSET=latin1;

/*Data for the table `instituciones` */

insert  into `instituciones`(`cod_inst`,`nombre`,`ci_ruc`,`tel`,`email`,`codigo_pais`,`cod_depart`,`dist_num`,`dir`,`cod_ent`,`suc`,`estado`) values (1,'7781 DIVINO NIÑO JESUS','','','','PY','07','17','Obligado',1,'03','Activo');
insert  into `instituciones`(`cod_inst`,`nombre`,`ci_ruc`,`tel`,`email`,`codigo_pais`,`cod_depart`,`dist_num`,`dir`,`cod_ent`,`suc`,`estado`) values (2,'7753 COMUNIDAD INDIGENA MANDUI-Y','','','','PY','07','29','Pirapo',1,'03','Activo');
insert  into `instituciones`(`cod_inst`,`nombre`,`ci_ruc`,`tel`,`email`,`codigo_pais`,`cod_depart`,`dist_num`,`dir`,`cod_ent`,`suc`,`estado`) values (3,'7578 COMUNIDAD INDIGENA PARAISO','','','','PY','07','29','Pirapo',1,'03','Activo');
insert  into `instituciones`(`cod_inst`,`nombre`,`ci_ruc`,`tel`,`email`,`codigo_pais`,`cod_depart`,`dist_num`,`dir`,`cod_ent`,`suc`,`estado`) values (4,'1504 EPIFANIO MENDEZ FLEITAS','','','','PY','07','20','SAN PEDRO DEL PARANA',1,'03','Activo');
insert  into `instituciones`(`cod_inst`,`nombre`,`ci_ruc`,`tel`,`email`,`codigo_pais`,`cod_depart`,`dist_num`,`dir`,`cod_ent`,`suc`,`estado`) values (5,'2660 MCAL JOSE F. ESTIGARRIBIA','','','','PY','07','20','SAN PEDRO DEL PARANA',1,'03','Activo');
insert  into `instituciones`(`cod_inst`,`nombre`,`ci_ruc`,`tel`,`email`,`codigo_pais`,`cod_depart`,`dist_num`,`dir`,`cod_ent`,`suc`,`estado`) values (6,'3866 SAN JOSE OBRERO','','','','PY','07','20','SAN PEDRO DEL PARANA',1,'03','Activo');
insert  into `instituciones`(`cod_inst`,`nombre`,`ci_ruc`,`tel`,`email`,`codigo_pais`,`cod_depart`,`dist_num`,`dir`,`cod_ent`,`suc`,`estado`) values (7,'2039 GRAL JOSE EDUVIGIS DIAZ','','','','PY','07','20','SAN PEDRO DEL PARANA',1,'03','Activo');
insert  into `instituciones`(`cod_inst`,`nombre`,`ci_ruc`,`tel`,`email`,`codigo_pais`,`cod_depart`,`dist_num`,`dir`,`cod_ent`,`suc`,`estado`) values (8,'3674 SAN ROQUE','','','','PY','07','20','SAN PEDRO DEL PARANA',1,'03','Activo');
insert  into `instituciones`(`cod_inst`,`nombre`,`ci_ruc`,`tel`,`email`,`codigo_pais`,`cod_depart`,`dist_num`,`dir`,`cod_ent`,`suc`,`estado`) values (9,'2057 JUAN MANUEL PAREDES','','','','PY','07','20','SAN PEDRO DEL PARANA',1,'03','Activo');
insert  into `instituciones`(`cod_inst`,`nombre`,`ci_ruc`,`tel`,`email`,`codigo_pais`,`cod_depart`,`dist_num`,`dir`,`cod_ent`,`suc`,`estado`) values (10,'2050 VIRGEN DE CAACUPE','','','','PY','07','20','SAN PEDRO DEL PARANA',1,'03','Activo');
insert  into `instituciones`(`cod_inst`,`nombre`,`ci_ruc`,`tel`,`email`,`codigo_pais`,`cod_depart`,`dist_num`,`dir`,`cod_ent`,`suc`,`estado`) values (11,'2659 VIRGEN DE FATIMA','','','','PY','07','20','SAN PEDRO DEL PARANA',1,'03','Activo');
insert  into `instituciones`(`cod_inst`,`nombre`,`ci_ruc`,`tel`,`email`,`codigo_pais`,`cod_depart`,`dist_num`,`dir`,`cod_ent`,`suc`,`estado`) values (12,'894 SAN MIGUEL','','','','PY','07','20','SAN PEDRO DEL PARANA',1,'03','Activo');
insert  into `instituciones`(`cod_inst`,`nombre`,`ci_ruc`,`tel`,`email`,`codigo_pais`,`cod_depart`,`dist_num`,`dir`,`cod_ent`,`suc`,`estado`) values (13,'7442 LUIS MARIA ARGAÑA','','','','PY','07','20','SAN PEDRO DEL PARANA',1,'03','Activo');
insert  into `instituciones`(`cod_inst`,`nombre`,`ci_ruc`,`tel`,`email`,`codigo_pais`,`cod_depart`,`dist_num`,`dir`,`cod_ent`,`suc`,`estado`) values (14,'2258 PADRE BERNARDO KULHA','','','','PY','07','20','SAN PEDRO DEL PARANA',1,'03','Activo');
insert  into `instituciones`(`cod_inst`,`nombre`,`ci_ruc`,`tel`,`email`,`codigo_pais`,`cod_depart`,`dist_num`,`dir`,`cod_ent`,`suc`,`estado`) values (15,'2053 ARANDU REKAVO','','','','PY','07','20','SAN PEDRO DEL PARANA',1,'03','Activo');
insert  into `instituciones`(`cod_inst`,`nombre`,`ci_ruc`,`tel`,`email`,`codigo_pais`,`cod_depart`,`dist_num`,`dir`,`cod_ent`,`suc`,`estado`) values (16,'5779 SAN ANTONIO','','','','PY','07','20','SAN PEDRO DEL PARANA',1,'03','Activo');
insert  into `instituciones`(`cod_inst`,`nombre`,`ci_ruc`,`tel`,`email`,`codigo_pais`,`cod_depart`,`dist_num`,`dir`,`cod_ent`,`suc`,`estado`) values (17,'66 ENRIQUE SOLANO LOPEZ','','','','PY','07','20','SAN PEDRO DEL PARANA',1,'03','Activo');
insert  into `instituciones`(`cod_inst`,`nombre`,`ci_ruc`,`tel`,`email`,`codigo_pais`,`cod_depart`,`dist_num`,`dir`,`cod_ent`,`suc`,`estado`) values (18,'3385 ESC 3385 SAN JOSE','','','','PY','07','20','SAN RAFAEL DEL PARANA',1,'03','Activo');
insert  into `instituciones`(`cod_inst`,`nombre`,`ci_ruc`,`tel`,`email`,`codigo_pais`,`cod_depart`,`dist_num`,`dir`,`cod_ent`,`suc`,`estado`) values (19,'2796 SAN RAFAEL','','','','PY','07','20','SAN RAFAEL DEL PARANA',1,'03','Activo');
insert  into `instituciones`(`cod_inst`,`nombre`,`ci_ruc`,`tel`,`email`,`codigo_pais`,`cod_depart`,`dist_num`,`dir`,`cod_ent`,`suc`,`estado`) values (20,'6544 15 DE MAYO','','','','PY','07','20','SAN RAFAEL  DEL PARANA',1,'03','Activo');
insert  into `instituciones`(`cod_inst`,`nombre`,`ci_ruc`,`tel`,`email`,`codigo_pais`,`cod_depart`,`dist_num`,`dir`,`cod_ent`,`suc`,`estado`) values (21,'6506 PYKASU YGUA','','','','PY','07','20','SAN RAFAEL  DEL PARANA',1,'03','Activo');
insert  into `instituciones`(`cod_inst`,`nombre`,`ci_ruc`,`tel`,`email`,`codigo_pais`,`cod_depart`,`dist_num`,`dir`,`cod_ent`,`suc`,`estado`) values (22,'5239 JOSE ASUNCION FLORES','','','','PY','07','20','SAN RAFAEL  DEL PARANA',1,'03','Activo');
insert  into `instituciones`(`cod_inst`,`nombre`,`ci_ruc`,`tel`,`email`,`codigo_pais`,`cod_depart`,`dist_num`,`dir`,`cod_ent`,`suc`,`estado`) values (23,'5240 SAN BLAS','','','','PY','07','20','SAN RAFAEL  DEL PARANA',1,'03','Activo');
insert  into `instituciones`(`cod_inst`,`nombre`,`ci_ruc`,`tel`,`email`,`codigo_pais`,`cod_depart`,`dist_num`,`dir`,`cod_ent`,`suc`,`estado`) values (24,'6984 ESC KAAGUY PORA TIROL INDIGENA','','','','PY','07','20','SAN RAFAEL DEL PARANA',1,'03','Activo');
insert  into `instituciones`(`cod_inst`,`nombre`,`ci_ruc`,`tel`,`email`,`codigo_pais`,`cod_depart`,`dist_num`,`dir`,`cod_ent`,`suc`,`estado`) values (25,'3386 ESC 3386 ACOSTA ÑU','','','','PY','07','20','SAN RAFAEL  DEL PARANA',1,'03','Activo');
insert  into `instituciones`(`cod_inst`,`nombre`,`ci_ruc`,`tel`,`email`,`codigo_pais`,`cod_depart`,`dist_num`,`dir`,`cod_ent`,`suc`,`estado`) values (26,'815 PEDRO JUAN CABALLERO','','','','PY','07','20','SAN JUAN  DEL PARANA',1,'03','Activo');
insert  into `instituciones`(`cod_inst`,`nombre`,`ci_ruc`,`tel`,`email`,`codigo_pais`,`cod_depart`,`dist_num`,`dir`,`cod_ent`,`suc`,`estado`) values (27,'211 CARLOS ANTONIO LOPEZ','','','','PY','07','13','GRAL DELGADO',1,'03','Activo');
insert  into `instituciones`(`cod_inst`,`nombre`,`ci_ruc`,`tel`,`email`,`codigo_pais`,`cod_depart`,`dist_num`,`dir`,`cod_ent`,`suc`,`estado`) values (28,'7754 ESC BAS JUKERI','','','','PY','07','24','TOMAS ROMERO PEREIRA',1,'03','Activo');
insert  into `instituciones`(`cod_inst`,`nombre`,`ci_ruc`,`tel`,`email`,`codigo_pais`,`cod_depart`,`dist_num`,`dir`,`cod_ent`,`suc`,`estado`) values (29,'3450 SAN MIGUEL','','','','PY','07','24','TOMAS ROMERO PEREIRA',1,'03','Activo');
insert  into `instituciones`(`cod_inst`,`nombre`,`ci_ruc`,`tel`,`email`,`codigo_pais`,`cod_depart`,`dist_num`,`dir`,`cod_ent`,`suc`,`estado`) values (30,'2616 SAN ISIDRO LABRADOR','','','','PY','07','24','TOMAS ROMERO PEREIRA',1,'03','Activo');
insert  into `instituciones`(`cod_inst`,`nombre`,`ci_ruc`,`tel`,`email`,`codigo_pais`,`cod_depart`,`dist_num`,`dir`,`cod_ent`,`suc`,`estado`) values (31,'7518 SAN CAYETANO','','','','PY','07','24','TOMAS ROMERO PEREIRA',1,'03','Activo');
insert  into `instituciones`(`cod_inst`,`nombre`,`ci_ruc`,`tel`,`email`,`codigo_pais`,`cod_depart`,`dist_num`,`dir`,`cod_ent`,`suc`,`estado`) values (32,'2507 MANUEL O GUERRERO','','','','PY','07','24','TOMAS ROMERO PEREIRA',1,'03','Activo');
insert  into `instituciones`(`cod_inst`,`nombre`,`ci_ruc`,`tel`,`email`,`codigo_pais`,`cod_depart`,`dist_num`,`dir`,`cod_ent`,`suc`,`estado`) values (33,'7136 8 DE DICIEMBRE','','','','PY','07','24','TOMAS ROMERO PEREIRA',1,'03','Activo');
insert  into `instituciones`(`cod_inst`,`nombre`,`ci_ruc`,`tel`,`email`,`codigo_pais`,`cod_depart`,`dist_num`,`dir`,`cod_ent`,`suc`,`estado`) values (34,'7137 9 DE DICIEMBRE','','','','PY','07','24','TOMAS ROMERO PEREIRA',1,'03','Activo');
insert  into `instituciones`(`cod_inst`,`nombre`,`ci_ruc`,`tel`,`email`,`codigo_pais`,`cod_depart`,`dist_num`,`dir`,`cod_ent`,`suc`,`estado`) values (35,'7126 ESC 1 DE MAYO','','','','PY','07','24','TOMAS ROMERO PEREIRA',1,'03','Activo');
insert  into `instituciones`(`cod_inst`,`nombre`,`ci_ruc`,`tel`,`email`,`codigo_pais`,`cod_depart`,`dist_num`,`dir`,`cod_ent`,`suc`,`estado`) values (36,'6324 ESC PALMITAL','','','','PY','07','09','CARLOS A LOPEZ',1,'03','Activo');
insert  into `instituciones`(`cod_inst`,`nombre`,`ci_ruc`,`tel`,`email`,`codigo_pais`,`cod_depart`,`dist_num`,`dir`,`cod_ent`,`suc`,`estado`) values (37,'ESC  AGRICOLA','','','','PY','07','09','CARLOS A LOPEZ',1,'03','Activo');
insert  into `instituciones`(`cod_inst`,`nombre`,`ci_ruc`,`tel`,`email`,`codigo_pais`,`cod_depart`,`dist_num`,`dir`,`cod_ent`,`suc`,`estado`) values (38,'6571 ESC SAN R GONZALES DE STA CRUZ','','','','PY','07','18','MAYOR OTA?O',1,'03','Activo');
insert  into `instituciones`(`cod_inst`,`nombre`,`ci_ruc`,`tel`,`email`,`codigo_pais`,`cod_depart`,`dist_num`,`dir`,`cod_ent`,`suc`,`estado`) values (39,'5241 ESC SAN JUAN BAUTISTA','','','','PY','07','18','MAYOR OTA?O',1,'03','Activo');
insert  into `instituciones`(`cod_inst`,`nombre`,`ci_ruc`,`tel`,`email`,`codigo_pais`,`cod_depart`,`dist_num`,`dir`,`cod_ent`,`suc`,`estado`) values (40,'5243 ESC SAGRADA FAMILIA','','','','PY','07','18','MAYOR OTA?O',1,'03','Activo');
insert  into `instituciones`(`cod_inst`,`nombre`,`ci_ruc`,`tel`,`email`,`codigo_pais`,`cod_depart`,`dist_num`,`dir`,`cod_ent`,`suc`,`estado`) values (41,'3749 ESC 3749 MARIA AUXILIADORA','','','','PY','07','25','ALTO VERA',1,'03','Activo');
insert  into `instituciones`(`cod_inst`,`nombre`,`ci_ruc`,`tel`,`email`,`codigo_pais`,`cod_depart`,`dist_num`,`dir`,`cod_ent`,`suc`,`estado`) values (42,'4462 ESC 4462 SAN JOSE OBRERO','','','','PY','07','25','ALTO VERA',1,'03','Activo');
insert  into `instituciones`(`cod_inst`,`nombre`,`ci_ruc`,`tel`,`email`,`codigo_pais`,`cod_depart`,`dist_num`,`dir`,`cod_ent`,`suc`,`estado`) values (43,'5916 ESC 5916 JOVERE','','','','PY','07','25','ALTO VERA',1,'03','Activo');
insert  into `instituciones`(`cod_inst`,`nombre`,`ci_ruc`,`tel`,`email`,`codigo_pais`,`cod_depart`,`dist_num`,`dir`,`cod_ent`,`suc`,`estado`) values (44,'5983 ESC 5983 LA ESPERANZA','','','','PY','07','25','ALTO VERA',1,'03','Activo');
insert  into `instituciones`(`cod_inst`,`nombre`,`ci_ruc`,`tel`,`email`,`codigo_pais`,`cod_depart`,`dist_num`,`dir`,`cod_ent`,`suc`,`estado`) values (45,'15407 ESC MBO`I KA`E','','','','PY','07','25','ALTO VERA',1,'03','Activo');
insert  into `instituciones`(`cod_inst`,`nombre`,`ci_ruc`,`tel`,`email`,`codigo_pais`,`cod_depart`,`dist_num`,`dir`,`cod_ent`,`suc`,`estado`) values (46,'4442 ESC MCAL FRANCISCO SOLANO LOPEZ','','','','PY','07','25','ALTO VERA',1,'03','Activo');
insert  into `instituciones`(`cod_inst`,`nombre`,`ci_ruc`,`tel`,`email`,`codigo_pais`,`cod_depart`,`dist_num`,`dir`,`cod_ent`,`suc`,`estado`) values (47,'7796 CARAGUATA','','','','PY','07','25','ALTO VERA',1,'03','Activo');
insert  into `instituciones`(`cod_inst`,`nombre`,`ci_ruc`,`tel`,`email`,`codigo_pais`,`cod_depart`,`dist_num`,`dir`,`cod_ent`,`suc`,`estado`) values (48,'4464 ESC  NI?OS MARTIR DE ACOSTA ?U','','','','PY','07','25','ALTO VERA',1,'03','Activo');
insert  into `instituciones`(`cod_inst`,`nombre`,`ci_ruc`,`tel`,`email`,`codigo_pais`,`cod_depart`,`dist_num`,`dir`,`cod_ent`,`suc`,`estado`) values (49,'1429 ESC WALTER BECKER','','','','PY','07','25','ALTO VERA',1,'03','Activo');
insert  into `instituciones`(`cod_inst`,`nombre`,`ci_ruc`,`tel`,`email`,`codigo_pais`,`cod_depart`,`dist_num`,`dir`,`cod_ent`,`suc`,`estado`) values (50,'7705 ESC BONANZA','','','','PY','07','25','ALTO VERA',1,'03','Activo');
insert  into `instituciones`(`cod_inst`,`nombre`,`ci_ruc`,`tel`,`email`,`codigo_pais`,`cod_depart`,`dist_num`,`dir`,`cod_ent`,`suc`,`estado`) values (51,'7370 ESC  MCAL JOSE F ESTIGARRIBIA','','','','PY','07','30','ITAPUA POTY',1,'03','Activo');
insert  into `instituciones`(`cod_inst`,`nombre`,`ci_ruc`,`tel`,`email`,`codigo_pais`,`cod_depart`,`dist_num`,`dir`,`cod_ent`,`suc`,`estado`) values (52,'8246 ESC KA`AGUY PORA','','','','PY','07','30','ITAPUA POTY',1,'03','Activo');
insert  into `instituciones`(`cod_inst`,`nombre`,`ci_ruc`,`tel`,`email`,`codigo_pais`,`cod_depart`,`dist_num`,`dir`,`cod_ent`,`suc`,`estado`) values (53,'7252 ESC  AUGUSTO ROA BASTOS','','','','PY','07','30','ITAPUA POTY',1,'03','Activo');
insert  into `instituciones`(`cod_inst`,`nombre`,`ci_ruc`,`tel`,`email`,`codigo_pais`,`cod_depart`,`dist_num`,`dir`,`cod_ent`,`suc`,`estado`) values (54,'6581 ESC SAN FRANCISCO DE ASIS','','','','PY','07','30','ITAPUA POTY',1,'03','Activo');
insert  into `instituciones`(`cod_inst`,`nombre`,`ci_ruc`,`tel`,`email`,`codigo_pais`,`cod_depart`,`dist_num`,`dir`,`cod_ent`,`suc`,`estado`) values (55,'5248 ESC FRAY LUIS BOLA?OS','','','','PY','07','30','ITAPUA POTY',1,'03','Activo');
insert  into `instituciones`(`cod_inst`,`nombre`,`ci_ruc`,`tel`,`email`,`codigo_pais`,`cod_depart`,`dist_num`,`dir`,`cod_ent`,`suc`,`estado`) values (56,'2114 ESC  GRAL BERNANDINO CABALLERO','','','','PY','07','30','ITAPUA POTY',1,'03','Activo');
insert  into `instituciones`(`cod_inst`,`nombre`,`ci_ruc`,`tel`,`email`,`codigo_pais`,`cod_depart`,`dist_num`,`dir`,`cod_ent`,`suc`,`estado`) values (57,'6130 SAN JORGE','','','','PY','07','23','EDELIRA',1,'03','Activo');
insert  into `instituciones`(`cod_inst`,`nombre`,`ci_ruc`,`tel`,`email`,`codigo_pais`,`cod_depart`,`dist_num`,`dir`,`cod_ent`,`suc`,`estado`) values (58,'7118 ESC  18 DE AGOSTO','','','','PY','07','23','EDELIRA',1,'03','Activo');
insert  into `instituciones`(`cod_inst`,`nombre`,`ci_ruc`,`tel`,`email`,`codigo_pais`,`cod_depart`,`dist_num`,`dir`,`cod_ent`,`suc`,`estado`) values (59,'7118 ESC 18 DE AGOSTO ACRA','','','','PY','07','23','EDELIRA',1,'03','Activo');
insert  into `instituciones`(`cod_inst`,`nombre`,`ci_ruc`,`tel`,`email`,`codigo_pais`,`cod_depart`,`dist_num`,`dir`,`cod_ent`,`suc`,`estado`) values (60,'7123 ESC 7 SAN ISIDRO','','','','PY','07','23','EDELIRA',1,'03','Activo');
insert  into `instituciones`(`cod_inst`,`nombre`,`ci_ruc`,`tel`,`email`,`codigo_pais`,`cod_depart`,`dist_num`,`dir`,`cod_ent`,`suc`,`estado`) values (61,'2606 ESC  VIRGEN DE FATIMA','','','','PY','07','23','EDELIRA',1,'03','Activo');
insert  into `instituciones`(`cod_inst`,`nombre`,`ci_ruc`,`tel`,`email`,`codigo_pais`,`cod_depart`,`dist_num`,`dir`,`cod_ent`,`suc`,`estado`) values (62,'7151 ESC  SAN ANTONIO DE PAUDA','','','','PY','07','23','EDELIRA',1,'03','Activo');
insert  into `instituciones`(`cod_inst`,`nombre`,`ci_ruc`,`tel`,`email`,`codigo_pais`,`cod_depart`,`dist_num`,`dir`,`cod_ent`,`suc`,`estado`) values (63,'3098 ESC  HILARIO FRETES MARIN','','','','PY','07','23','EDELIRA',1,'03','Activo');
insert  into `instituciones`(`cod_inst`,`nombre`,`ci_ruc`,`tel`,`email`,`codigo_pais`,`cod_depart`,`dist_num`,`dir`,`cod_ent`,`suc`,`estado`) values (64,'5208 ESC 5208 FRANCISCO LAMBARE','','','','PY','07','10','NATALIO',1,'03','Activo');
insert  into `instituciones`(`cod_inst`,`nombre`,`ci_ruc`,`tel`,`email`,`codigo_pais`,`cod_depart`,`dist_num`,`dir`,`cod_ent`,`suc`,`estado`) values (65,'3294 ESC  SAN JORGE','','','','PY','07','10','NATALIO',1,'03','Activo');
insert  into `instituciones`(`cod_inst`,`nombre`,`ci_ruc`,`tel`,`email`,`codigo_pais`,`cod_depart`,`dist_num`,`dir`,`cod_ent`,`suc`,`estado`) values (66,'939 ESC RUDO PADRE RICARDO MUSCH','','','','PY','07','10','NATALIO',1,'03','Activo');
insert  into `instituciones`(`cod_inst`,`nombre`,`ci_ruc`,`tel`,`email`,`codigo_pais`,`cod_depart`,`dist_num`,`dir`,`cod_ent`,`suc`,`estado`) values (67,'7354 COMUNIDAD GUAVIRAMI','','','','PY','07','22','TRINIDAD',1,'03','Activo');
insert  into `instituciones`(`cod_inst`,`nombre`,`ci_ruc`,`tel`,`email`,`codigo_pais`,`cod_depart`,`dist_num`,`dir`,`cod_ent`,`suc`,`estado`) values (68,'739 ESC PEDRO DE LLAMAS','','','','PY','07','22','TRINIDAD',1,'03','Activo');
insert  into `instituciones`(`cod_inst`,`nombre`,`ci_ruc`,`tel`,`email`,`codigo_pais`,`cod_depart`,`dist_num`,`dir`,`cod_ent`,`suc`,`estado`) values (69,'735 ESC SAN JOSE','','','','PY','07','06','NUEVA ALBORADA',1,'03','Activo');
insert  into `instituciones`(`cod_inst`,`nombre`,`ci_ruc`,`tel`,`email`,`codigo_pais`,`cod_depart`,`dist_num`,`dir`,`cod_ent`,`suc`,`estado`) values (70,'2447 ESC 2447 SILVANA MELGAREJO','','','','PY','07','06','NUEVA ALBORADA',1,'03','Activo');
insert  into `instituciones`(`cod_inst`,`nombre`,`ci_ruc`,`tel`,`email`,`codigo_pais`,`cod_depart`,`dist_num`,`dir`,`cod_ent`,`suc`,`estado`) values (71,'4011 ESC 4011 PERPETUO SOCORRO','','','','PY','07','06','NUEVA ALBORADA',1,'03','Activo');
insert  into `instituciones`(`cod_inst`,`nombre`,`ci_ruc`,`tel`,`email`,`codigo_pais`,`cod_depart`,`dist_num`,`dir`,`cod_ent`,`suc`,`estado`) values (72,' COLEGIO TECNICO','','','','PY','07','01','ENCARNACION',1,'03','Activo');
insert  into `instituciones`(`cod_inst`,`nombre`,`ci_ruc`,`tel`,`email`,`codigo_pais`,`cod_depart`,`dist_num`,`dir`,`cod_ent`,`suc`,`estado`) values (73,'7580 ESC MAKA','','','','PY','07','01','ENCARNACION',1,'03','Activo');
insert  into `instituciones`(`cod_inst`,`nombre`,`ci_ruc`,`tel`,`email`,`codigo_pais`,`cod_depart`,`dist_num`,`dir`,`cod_ent`,`suc`,`estado`) values (74,'3771 ESC ROGELIO BENITEZ','','','','PY','07','01','ENCARNACION',1,'03','Activo');
insert  into `instituciones`(`cod_inst`,`nombre`,`ci_ruc`,`tel`,`email`,`codigo_pais`,`cod_depart`,`dist_num`,`dir`,`cod_ent`,`suc`,`estado`) values (75,'640 ESC SAN ISIDRO','','','','PY','07','01','ENCARNACION',1,'03','Activo');
insert  into `instituciones`(`cod_inst`,`nombre`,`ci_ruc`,`tel`,`email`,`codigo_pais`,`cod_depart`,`dist_num`,`dir`,`cod_ent`,`suc`,`estado`) values (76,'1541 ESC NUEVA EZPERANZA','','','','PY','07','01','ENCARNACION',1,'03','Activo');
insert  into `instituciones`(`cod_inst`,`nombre`,`ci_ruc`,`tel`,`email`,`codigo_pais`,`cod_depart`,`dist_num`,`dir`,`cod_ent`,`suc`,`estado`) values (77,'4761 ESC SANTA CLARA','','','','PY','07','08','CNEL BOGADO',1,'03','Activo');
insert  into `instituciones`(`cod_inst`,`nombre`,`ci_ruc`,`tel`,`email`,`codigo_pais`,`cod_depart`,`dist_num`,`dir`,`cod_ent`,`suc`,`estado`) values (78,'700 ESC MCAL FRANCISCO SOLANO LOPEZ','','','','PY','07','08','CNEL BOGADO',1,'03','Activo');
insert  into `instituciones`(`cod_inst`,`nombre`,`ci_ruc`,`tel`,`email`,`codigo_pais`,`cod_depart`,`dist_num`,`dir`,`cod_ent`,`suc`,`estado`) values (79,'3323 ESC SAN JOSE','','','','PY','07','05','CAPITAN MIRANDA',1,'03','Activo');
insert  into `instituciones`(`cod_inst`,`nombre`,`ci_ruc`,`tel`,`email`,`codigo_pais`,`cod_depart`,`dist_num`,`dir`,`cod_ent`,`suc`,`estado`) values (80,'4617 ESC  DIVINO NI?O JESUS','','','','PY','07','03','CAMBYRETA',1,'03','Activo');
insert  into `instituciones`(`cod_inst`,`nombre`,`ci_ruc`,`tel`,`email`,`codigo_pais`,`cod_depart`,`dist_num`,`dir`,`cod_ent`,`suc`,`estado`) values (81,'528 DELFIN CHAMORRO','','','','PY','07','02','CNEL BOGADO',8,'02','Activo');
insert  into `instituciones`(`cod_inst`,`nombre`,`ci_ruc`,`tel`,`email`,`codigo_pais`,`cod_depart`,`dist_num`,`dir`,`cod_ent`,`suc`,`estado`) values (82,'2010 CAUCACIA','','','','PY','07','02','CNEL BOGADO',8,'02','Activo');
insert  into `instituciones`(`cod_inst`,`nombre`,`ci_ruc`,`tel`,`email`,`codigo_pais`,`cod_depart`,`dist_num`,`dir`,`cod_ent`,`suc`,`estado`) values (83,'2012 JOSE F BOGADO','','','','PY','07','02','CNEL BOGADO',8,'02','Activo');
insert  into `instituciones`(`cod_inst`,`nombre`,`ci_ruc`,`tel`,`email`,`codigo_pais`,`cod_depart`,`dist_num`,`dir`,`cod_ent`,`suc`,`estado`) values (84,'892 MANUEL TOMAS BOGADO','','','','PY','07','02','CNEL BOGADO',8,'02','Activo');
insert  into `instituciones`(`cod_inst`,`nombre`,`ci_ruc`,`tel`,`email`,`codigo_pais`,`cod_depart`,`dist_num`,`dir`,`cod_ent`,`suc`,`estado`) values (85,'5202 GRAL BERNANDINO CABALLERO','','','','PY','07','02','CNEL BOGADO',8,'02','Activo');
insert  into `instituciones`(`cod_inst`,`nombre`,`ci_ruc`,`tel`,`email`,`codigo_pais`,`cod_depart`,`dist_num`,`dir`,`cod_ent`,`suc`,`estado`) values (86,'754 SAN LUIS GONZAGA','','','','PY','07','02','CNEL BOGADO',8,'02','Activo');
insert  into `instituciones`(`cod_inst`,`nombre`,`ci_ruc`,`tel`,`email`,`codigo_pais`,`cod_depart`,`dist_num`,`dir`,`cod_ent`,`suc`,`estado`) values (87,'5199 SAN MIGUEL POTRERO','','','','PY','07','02','CNEL BOGADO',8,'02','Activo');
insert  into `instituciones`(`cod_inst`,`nombre`,`ci_ruc`,`tel`,`email`,`codigo_pais`,`cod_depart`,`dist_num`,`dir`,`cod_ent`,`suc`,`estado`) values (88,'305 EUGENIO GARAY','','','','PY','07','02','CNEL BOGADO',8,'02','Activo');
insert  into `instituciones`(`cod_inst`,`nombre`,`ci_ruc`,`tel`,`email`,`codigo_pais`,`cod_depart`,`dist_num`,`dir`,`cod_ent`,`suc`,`estado`) values (89,'2011 LAURENTINO BENITEZ','','','','PY','07','02','CNEL BOGADO',8,'02','Activo');
insert  into `instituciones`(`cod_inst`,`nombre`,`ci_ruc`,`tel`,`email`,`codigo_pais`,`cod_depart`,`dist_num`,`dir`,`cod_ent`,`suc`,`estado`) values (90,'7612 TOMAS BOGADO','','','','PY','07','02','CNEL BOGADO',8,'02','Activo');
insert  into `instituciones`(`cod_inst`,`nombre`,`ci_ruc`,`tel`,`email`,`codigo_pais`,`cod_depart`,`dist_num`,`dir`,`cod_ent`,`suc`,`estado`) values (91,'8058 MITA ROGA','','','','PY','07','02','CNEL BOGADO',8,'02','Activo');
insert  into `instituciones`(`cod_inst`,`nombre`,`ci_ruc`,`tel`,`email`,`codigo_pais`,`cod_depart`,`dist_num`,`dir`,`cod_ent`,`suc`,`estado`) values (92,'526 LAS RESIDENTAS','','','','PY','07','02','CNEL BOGADO',8,'02','Activo');
insert  into `instituciones`(`cod_inst`,`nombre`,`ci_ruc`,`tel`,`email`,`codigo_pais`,`cod_depart`,`dist_num`,`dir`,`cod_ent`,`suc`,`estado`) values (93,'5195 DON SILVERIO FRETES','','','','PY','07','02','CNEL BOGADO',8,'02','Activo');
insert  into `instituciones`(`cod_inst`,`nombre`,`ci_ruc`,`tel`,`email`,`codigo_pais`,`cod_depart`,`dist_num`,`dir`,`cod_ent`,`suc`,`estado`) values (94,'68 CARLOS A LOPEZ','','','','PY','07','02','CNEL BOGADO',8,'02','Activo');
insert  into `instituciones`(`cod_inst`,`nombre`,`ci_ruc`,`tel`,`email`,`codigo_pais`,`cod_depart`,`dist_num`,`dir`,`cod_ent`,`suc`,`estado`) values (95,'5201 ADELA SPERATTI','','','','PY','07','02','CNEL BOGADO',8,'02','Activo');
insert  into `instituciones`(`cod_inst`,`nombre`,`ci_ruc`,`tel`,`email`,`codigo_pais`,`cod_depart`,`dist_num`,`dir`,`cod_ent`,`suc`,`estado`) values (96,'732 CRESENCIO TROCHE','','','','PY','07','02','CAPITAN MIRANDA',5,'02','Activo');
insert  into `instituciones`(`cod_inst`,`nombre`,`ci_ruc`,`tel`,`email`,`codigo_pais`,`cod_depart`,`dist_num`,`dir`,`cod_ent`,`suc`,`estado`) values (97,'8008 LUZ Y ESPERANZA','','','','PY','07','02','CAPITAN MIRANDA',5,'02','Activo');
insert  into `instituciones`(`cod_inst`,`nombre`,`ci_ruc`,`tel`,`email`,`codigo_pais`,`cod_depart`,`dist_num`,`dir`,`cod_ent`,`suc`,`estado`) values (98,'2440 LUIS. F. MULLER','','','','PY','07','02','CAPITAN MIRANDA',5,'02','Activo');
insert  into `instituciones`(`cod_inst`,`nombre`,`ci_ruc`,`tel`,`email`,`codigo_pais`,`cod_depart`,`dist_num`,`dir`,`cod_ent`,`suc`,`estado`) values (99,'733 JULIAN CABRERA','','','','PY','07','02','CAPITAN MIRANDA',5,'02','Activo');
insert  into `instituciones`(`cod_inst`,`nombre`,`ci_ruc`,`tel`,`email`,`codigo_pais`,`cod_depart`,`dist_num`,`dir`,`cod_ent`,`suc`,`estado`) values (100,'1546 ALBORADA','','','','PY','07','02','CAPITAN MIRANDA',5,'02','Activo');
insert  into `instituciones`(`cod_inst`,`nombre`,`ci_ruc`,`tel`,`email`,`codigo_pais`,`cod_depart`,`dist_num`,`dir`,`cod_ent`,`suc`,`estado`) values (101,'938 VIRGEN DE LOURDES','','','','PY','07','02','CAPITAN MIRANDA',5,'02','Activo');
insert  into `instituciones`(`cod_inst`,`nombre`,`ci_ruc`,`tel`,`email`,`codigo_pais`,`cod_depart`,`dist_num`,`dir`,`cod_ent`,`suc`,`estado`) values (102,'2446 RAMON INDALECIO CARDOZO','','','','PY','07','02','CAPITAN MIRANDA',5,'02','Activo');
insert  into `instituciones`(`cod_inst`,`nombre`,`ci_ruc`,`tel`,`email`,`codigo_pais`,`cod_depart`,`dist_num`,`dir`,`cod_ent`,`suc`,`estado`) values (103,'527 RCA ORIENTAL DEL URUGUAY','','','','PY','07','02','CAPITAN MIRANDA',5,'02','Activo');
insert  into `instituciones`(`cod_inst`,`nombre`,`ci_ruc`,`tel`,`email`,`codigo_pais`,`cod_depart`,`dist_num`,`dir`,`cod_ent`,`suc`,`estado`) values (104,'404 NIPO PARAGUAYA','','','','PY','07','02','CAPITAN MIRANDA',5,'02','Activo');
insert  into `instituciones`(`cod_inst`,`nombre`,`ci_ruc`,`tel`,`email`,`codigo_pais`,`cod_depart`,`dist_num`,`dir`,`cod_ent`,`suc`,`estado`) values (105,'299 ASUNCION ESCALADA','','','','PY','07','02','CAPITAN MIRANDA',5,'02','Activo');
insert  into `instituciones`(`cod_inst`,`nombre`,`ci_ruc`,`tel`,`email`,`codigo_pais`,`cod_depart`,`dist_num`,`dir`,`cod_ent`,`suc`,`estado`) values (106,'1550 AUGUSTO ROA BASTOS','','','','PY','07','02','CAPITAN MIRANDA',5,'02','Activo');
insert  into `instituciones`(`cod_inst`,`nombre`,`ci_ruc`,`tel`,`email`,`codigo_pais`,`cod_depart`,`dist_num`,`dir`,`cod_ent`,`suc`,`estado`) values (107,'1547 MANUEL ORTIZ GUERRERO','','','','PY','07','02','CAPITAN MIRANDA',5,'02','Activo');
insert  into `instituciones`(`cod_inst`,`nombre`,`ci_ruc`,`tel`,`email`,`codigo_pais`,`cod_depart`,`dist_num`,`dir`,`cod_ent`,`suc`,`estado`) values (136,'2529 GRACIELA STROSNNER','','','','PY','07','02','TRINIDAD',5,'02','Activo');
insert  into `instituciones`(`cod_inst`,`nombre`,`ci_ruc`,`tel`,`email`,`codigo_pais`,`cod_depart`,`dist_num`,`dir`,`cod_ent`,`suc`,`estado`) values (137,'1440 SANTA MARIA','','','','PY','07','02','TRINIDAD',5,'02','Activo');
insert  into `instituciones`(`cod_inst`,`nombre`,`ci_ruc`,`tel`,`email`,`codigo_pais`,`cod_depart`,`dist_num`,`dir`,`cod_ent`,`suc`,`estado`) values (138,'2531 SAN ANTONIO','','','','PY','07','02','TRINIDAD',5,'02','Activo');
insert  into `instituciones`(`cod_inst`,`nombre`,`ci_ruc`,`tel`,`email`,`codigo_pais`,`cod_depart`,`dist_num`,`dir`,`cod_ent`,`suc`,`estado`) values (139,'4445 ITA VERA','','','','PY','07','02','TRINIDAD',5,'02','Activo');
insert  into `instituciones`(`cod_inst`,`nombre`,`ci_ruc`,`tel`,`email`,`codigo_pais`,`cod_depart`,`dist_num`,`dir`,`cod_ent`,`suc`,`estado`) values (140,'5980 AMANECER','','','','PY','07','02','TRINIDAD',5,'02','Activo');
insert  into `instituciones`(`cod_inst`,`nombre`,`ci_ruc`,`tel`,`email`,`codigo_pais`,`cod_depart`,`dist_num`,`dir`,`cod_ent`,`suc`,`estado`) values (141,'4471 SAN MIGUEL ARCANGEL','','','','PY','07','02','TRINIDAD',5,'02','Activo');
insert  into `instituciones`(`cod_inst`,`nombre`,`ci_ruc`,`tel`,`email`,`codigo_pais`,`cod_depart`,`dist_num`,`dir`,`cod_ent`,`suc`,`estado`) values (142,'2540 GRAL JOSE E DIAZ','','','','PY','07','01','PIRAPO',12,'01','Activo');
insert  into `instituciones`(`cod_inst`,`nombre`,`ci_ruc`,`tel`,`email`,`codigo_pais`,`cod_depart`,`dist_num`,`dir`,`cod_ent`,`suc`,`estado`) values (143,'625 RAMON INDALECIO CARDOZO','','','','PY','07','01','PIRAPO',12,'01','Activo');
insert  into `instituciones`(`cod_inst`,`nombre`,`ci_ruc`,`tel`,`email`,`codigo_pais`,`cod_depart`,`dist_num`,`dir`,`cod_ent`,`suc`,`estado`) values (144,'1216 ESC AMISTAD','','','','PY','07','01','PIRAPO',12,'01','Activo');
insert  into `instituciones`(`cod_inst`,`nombre`,`ci_ruc`,`tel`,`email`,`codigo_pais`,`cod_depart`,`dist_num`,`dir`,`cod_ent`,`suc`,`estado`) values (145,'4452 KUARAHY RESE','','','','PY','07','01','PIRAPO',12,'01','Activo');
insert  into `instituciones`(`cod_inst`,`nombre`,`ci_ruc`,`tel`,`email`,`codigo_pais`,`cod_depart`,`dist_num`,`dir`,`cod_ent`,`suc`,`estado`) values (146,'6977 ESPIRITU SANTO','','','','PY','07','01','PIRAPO',12,'01','Activo');
insert  into `instituciones`(`cod_inst`,`nombre`,`ci_ruc`,`tel`,`email`,`codigo_pais`,`cod_depart`,`dist_num`,`dir`,`cod_ent`,`suc`,`estado`) values (147,'574 IMPERIO DEL JAPON','','','','PY','07','01','PIRAPO',12,'01','Activo');
insert  into `instituciones`(`cod_inst`,`nombre`,`ci_ruc`,`tel`,`email`,`codigo_pais`,`cod_depart`,`dist_num`,`dir`,`cod_ent`,`suc`,`estado`) values (148,'271 DON CARLOS A LOPEZ','','','','PY','07','01','FRAM',11,'01','Activo');
insert  into `instituciones`(`cod_inst`,`nombre`,`ci_ruc`,`tel`,`email`,`codigo_pais`,`cod_depart`,`dist_num`,`dir`,`cod_ent`,`suc`,`estado`) values (149,'1593 FRANCISCO SOLANO LOPEZ','','','','PY','07','01','FRAM',11,'01','Activo');
insert  into `instituciones`(`cod_inst`,`nombre`,`ci_ruc`,`tel`,`email`,`codigo_pais`,`cod_depart`,`dist_num`,`dir`,`cod_ent`,`suc`,`estado`) values (150,'2323 SAN ISIDRO LABRADOR','','','','PY','07','01','FRAM',11,'01','Activo');
insert  into `instituciones`(`cod_inst`,`nombre`,`ci_ruc`,`tel`,`email`,`codigo_pais`,`cod_depart`,`dist_num`,`dir`,`cod_ent`,`suc`,`estado`) values (151,'1596 DR JOSE GASPAR RODRIUEZ DE FRANCIA','','','','PY','07','01','FRAM',11,'01','Activo');
insert  into `instituciones`(`cod_inst`,`nombre`,`ci_ruc`,`tel`,`email`,`codigo_pais`,`cod_depart`,`dist_num`,`dir`,`cod_ent`,`suc`,`estado`) values (152,'2022 MCAL FRANCISCO S LOPEZ','','','','PY','07','01','FRAM',11,'01','Activo');
insert  into `instituciones`(`cod_inst`,`nombre`,`ci_ruc`,`tel`,`email`,`codigo_pais`,`cod_depart`,`dist_num`,`dir`,`cod_ent`,`suc`,`estado`) values (153,'10955 VICENTE DE PAUL','','','','PY','07','01','FRAM',11,'01','Activo');
insert  into `instituciones`(`cod_inst`,`nombre`,`ci_ruc`,`tel`,`email`,`codigo_pais`,`cod_depart`,`dist_num`,`dir`,`cod_ent`,`suc`,`estado`) values (154,'592 DOMINGO MARTINEZ IRALA','','','','PY','07','01','FRAM',11,'01','Activo');
insert  into `instituciones`(`cod_inst`,`nombre`,`ci_ruc`,`tel`,`email`,`codigo_pais`,`cod_depart`,`dist_num`,`dir`,`cod_ent`,`suc`,`estado`) values (155,'2020 OTTO HAHNER','','','','PY','07','01','FRAM',11,'01','Activo');
insert  into `instituciones`(`cod_inst`,`nombre`,`ci_ruc`,`tel`,`email`,`codigo_pais`,`cod_depart`,`dist_num`,`dir`,`cod_ent`,`suc`,`estado`) values (156,'742 SAN FRANCISCO DE BORJA','','','','PY','07','01','FRAM',11,'01','Activo');
insert  into `instituciones`(`cod_inst`,`nombre`,`ci_ruc`,`tel`,`email`,`codigo_pais`,`cod_depart`,`dist_num`,`dir`,`cod_ent`,`suc`,`estado`) values (157,'530 ADELA SPERATTI','','','','PY','07','01','FRAM',11,'01','Activo');
insert  into `instituciones`(`cod_inst`,`nombre`,`ci_ruc`,`tel`,`email`,`codigo_pais`,`cod_depart`,`dist_num`,`dir`,`cod_ent`,`suc`,`estado`) values (158,'937 FRIDA SHULTZ MULLER','','','','PY','07','01','SAN JUAN DEL PARANA',10,'01','Activo');
insert  into `instituciones`(`cod_inst`,`nombre`,`ci_ruc`,`tel`,`email`,`codigo_pais`,`cod_depart`,`dist_num`,`dir`,`cod_ent`,`suc`,`estado`) values (159,'936 ARCANGELO BENEDETTI','','','','PY','07','01','SAN JUAN DEL PARANA',10,'01','Activo');
insert  into `instituciones`(`cod_inst`,`nombre`,`ci_ruc`,`tel`,`email`,`codigo_pais`,`cod_depart`,`dist_num`,`dir`,`cod_ent`,`suc`,`estado`) values (160,'3319 SAN JOSE OBRERO','','','','PY','07','01','SAN JUAN DEL PARANA',10,'01','Activo');
insert  into `instituciones`(`cod_inst`,`nombre`,`ci_ruc`,`tel`,`email`,`codigo_pais`,`cod_depart`,`dist_num`,`dir`,`cod_ent`,`suc`,`estado`) values (161,'641 EMILIANO ROMERO PEREIRA','','','','PY','07','01','SAN JUAN DEL PARANA',10,'01','Activo');
insert  into `instituciones`(`cod_inst`,`nombre`,`ci_ruc`,`tel`,`email`,`codigo_pais`,`cod_depart`,`dist_num`,`dir`,`cod_ent`,`suc`,`estado`) values (162,'935 SAN NICOLAS','','','','PY','07','01','SAN JUAN DEL PARANA',10,'01','Activo');
insert  into `instituciones`(`cod_inst`,`nombre`,`ci_ruc`,`tel`,`email`,`codigo_pais`,`cod_depart`,`dist_num`,`dir`,`cod_ent`,`suc`,`estado`) values (163,'7609 AYUMI','','','','PY','07','01','SAN JUAN DEL PARANA',10,'01','Activo');
insert  into `instituciones`(`cod_inst`,`nombre`,`ci_ruc`,`tel`,`email`,`codigo_pais`,`cod_depart`,`dist_num`,`dir`,`cod_ent`,`suc`,`estado`) values (164,'2931 SAN BLAS','','','','PY','07','21','',1,'03','Activo');
insert  into `instituciones`(`cod_inst`,`nombre`,`ci_ruc`,`tel`,`email`,`codigo_pais`,`cod_depart`,`dist_num`,`dir`,`cod_ent`,`suc`,`estado`) values (165,'7753 COMUNIDAD INDIGENA Mandui-y','','','','PY','07','29','Pirapo',1,'03','Activo');
insert  into `instituciones`(`cod_inst`,`nombre`,`ci_ruc`,`tel`,`email`,`codigo_pais`,`cod_depart`,`dist_num`,`dir`,`cod_ent`,`suc`,`estado`) values (166,'7578 COMUNIDAD INDIGENA PARAISO','','','','PY','07','29','Pirapo',1,'03','Activo');
insert  into `instituciones`(`cod_inst`,`nombre`,`ci_ruc`,`tel`,`email`,`codigo_pais`,`cod_depart`,`dist_num`,`dir`,`cod_ent`,`suc`,`estado`) values (167,'1504 EPIFANIO MENDEZ FLEITAS','','','','PY','07','20','SAN PEDRO DEL PARANA',1,'03','Activo');
insert  into `instituciones`(`cod_inst`,`nombre`,`ci_ruc`,`tel`,`email`,`codigo_pais`,`cod_depart`,`dist_num`,`dir`,`cod_ent`,`suc`,`estado`) values (168,'2660 MCAL JOSE F. ESTIGARRIBIA','','','','PY','07','20','SAN PEDRO DEL PARANA',1,'03','Activo');
insert  into `instituciones`(`cod_inst`,`nombre`,`ci_ruc`,`tel`,`email`,`codigo_pais`,`cod_depart`,`dist_num`,`dir`,`cod_ent`,`suc`,`estado`) values (169,'3866 SAN JOSE OBRERO','','','','PY','07','20','SAN PEDRO DEL PARANA',1,'03','Activo');
insert  into `instituciones`(`cod_inst`,`nombre`,`ci_ruc`,`tel`,`email`,`codigo_pais`,`cod_depart`,`dist_num`,`dir`,`cod_ent`,`suc`,`estado`) values (170,'2039 GRAL JOSE EDUVIGIS DIAZ','','','','PY','07','20','SAN PEDRO DEL PARANA',1,'03','Activo');
insert  into `instituciones`(`cod_inst`,`nombre`,`ci_ruc`,`tel`,`email`,`codigo_pais`,`cod_depart`,`dist_num`,`dir`,`cod_ent`,`suc`,`estado`) values (171,'3674 SAN ROQUE','','','','PY','07','20','SAN PEDRO DEL PARANA',1,'03','Activo');
insert  into `instituciones`(`cod_inst`,`nombre`,`ci_ruc`,`tel`,`email`,`codigo_pais`,`cod_depart`,`dist_num`,`dir`,`cod_ent`,`suc`,`estado`) values (172,'2057 JUAN MANUEL PAREDES','','','','PY','07','20','SAN PEDRO DEL PARANA',1,'03','Activo');
insert  into `instituciones`(`cod_inst`,`nombre`,`ci_ruc`,`tel`,`email`,`codigo_pais`,`cod_depart`,`dist_num`,`dir`,`cod_ent`,`suc`,`estado`) values (173,'2050 VIRGEN DE CAACUPE','','','','PY','07','20','SAN PEDRO DEL PARANA',1,'03','Activo');
insert  into `instituciones`(`cod_inst`,`nombre`,`ci_ruc`,`tel`,`email`,`codigo_pais`,`cod_depart`,`dist_num`,`dir`,`cod_ent`,`suc`,`estado`) values (175,'2659 VIRGEN DE FATIMA','','','','PY','07','20','SAN PEDRO DEL PARANA',1,'03','Activo');
insert  into `instituciones`(`cod_inst`,`nombre`,`ci_ruc`,`tel`,`email`,`codigo_pais`,`cod_depart`,`dist_num`,`dir`,`cod_ent`,`suc`,`estado`) values (176,'894 SAN MIGUEL','','','','PY','07','20','SAN PEDRO DEL PARANA',1,'03','Activo');
insert  into `instituciones`(`cod_inst`,`nombre`,`ci_ruc`,`tel`,`email`,`codigo_pais`,`cod_depart`,`dist_num`,`dir`,`cod_ent`,`suc`,`estado`) values (177,'894 ','','','','PY','07','20','SAN PEDRO DEL PARANA',1,'03','Activo');
insert  into `instituciones`(`cod_inst`,`nombre`,`ci_ruc`,`tel`,`email`,`codigo_pais`,`cod_depart`,`dist_num`,`dir`,`cod_ent`,`suc`,`estado`) values (178,'2258 PADRE BERNARDO KULHA','','','','PY','07','20','SAN PEDRO DEL PARANA',1,'03','Activo');
insert  into `instituciones`(`cod_inst`,`nombre`,`ci_ruc`,`tel`,`email`,`codigo_pais`,`cod_depart`,`dist_num`,`dir`,`cod_ent`,`suc`,`estado`) values (179,'2053 ARANDU REKAVO','','','','PY','07','20','SAN PEDRO DEL PARANA',1,'03','Activo');
insert  into `instituciones`(`cod_inst`,`nombre`,`ci_ruc`,`tel`,`email`,`codigo_pais`,`cod_depart`,`dist_num`,`dir`,`cod_ent`,`suc`,`estado`) values (180,'5779 SAN ANTONIO','','','','PY','07','20','SAN PEDRO DEL PARANA',1,'03','Activo');
insert  into `instituciones`(`cod_inst`,`nombre`,`ci_ruc`,`tel`,`email`,`codigo_pais`,`cod_depart`,`dist_num`,`dir`,`cod_ent`,`suc`,`estado`) values (181,'66 ENRIQUE SOLANO LOPEZ','','','','PY','07','20','SAN PEDRO DEL PARANA',1,'03','Activo');
insert  into `instituciones`(`cod_inst`,`nombre`,`ci_ruc`,`tel`,`email`,`codigo_pais`,`cod_depart`,`dist_num`,`dir`,`cod_ent`,`suc`,`estado`) values (182,'3385 ESC 3385 SAN JOSE','','','','PY','07','20','SAN RAFAEL DEL PARANA',1,'03','Activo');
insert  into `instituciones`(`cod_inst`,`nombre`,`ci_ruc`,`tel`,`email`,`codigo_pais`,`cod_depart`,`dist_num`,`dir`,`cod_ent`,`suc`,`estado`) values (183,'2796 SAN RAFAEL','','','','PY','07','20','SAN RAFAEL DEL PARANA',1,'03','Activo');
insert  into `instituciones`(`cod_inst`,`nombre`,`ci_ruc`,`tel`,`email`,`codigo_pais`,`cod_depart`,`dist_num`,`dir`,`cod_ent`,`suc`,`estado`) values (184,'6544 15 DE MAYO','','','','PY','07','20','SAN RAFAEL  DEL PARANA',1,'03','Activo');
insert  into `instituciones`(`cod_inst`,`nombre`,`ci_ruc`,`tel`,`email`,`codigo_pais`,`cod_depart`,`dist_num`,`dir`,`cod_ent`,`suc`,`estado`) values (185,'6506 PYKASU YGUA','','','','PY','07','20','SAN RAFAEL  DEL PARANA',1,'03','Activo');
insert  into `instituciones`(`cod_inst`,`nombre`,`ci_ruc`,`tel`,`email`,`codigo_pais`,`cod_depart`,`dist_num`,`dir`,`cod_ent`,`suc`,`estado`) values (186,'5239 JOSE ASUNCION FLORES','','','','PY','07','20','SAN RAFAEL  DEL PARANA',1,'03','Activo');
insert  into `instituciones`(`cod_inst`,`nombre`,`ci_ruc`,`tel`,`email`,`codigo_pais`,`cod_depart`,`dist_num`,`dir`,`cod_ent`,`suc`,`estado`) values (188,'6984 ESC KAAGUY PORA TIROL INDIGENA','','','','PY','07','20','SAN RAFAEL DEL PARANA',1,'03','Activo');
insert  into `instituciones`(`cod_inst`,`nombre`,`ci_ruc`,`tel`,`email`,`codigo_pais`,`cod_depart`,`dist_num`,`dir`,`cod_ent`,`suc`,`estado`) values (189,'815 PEDRO JUAN CABALLERO','','','','PY','07','20','SAN JUAN  DEL PARANA',1,'03','Activo');
insert  into `instituciones`(`cod_inst`,`nombre`,`ci_ruc`,`tel`,`email`,`codigo_pais`,`cod_depart`,`dist_num`,`dir`,`cod_ent`,`suc`,`estado`) values (190,'211 CARLOS ANTONIO LOPEZ','','','','PY','07','13','GRAL DELGADO',1,'03','Activo');
insert  into `instituciones`(`cod_inst`,`nombre`,`ci_ruc`,`tel`,`email`,`codigo_pais`,`cod_depart`,`dist_num`,`dir`,`cod_ent`,`suc`,`estado`) values (191,'7754 ESC BAS JUKERI','','','','PY','07','24','TOMAS ROMERO PEREIRA',1,'03','Activo');
insert  into `instituciones`(`cod_inst`,`nombre`,`ci_ruc`,`tel`,`email`,`codigo_pais`,`cod_depart`,`dist_num`,`dir`,`cod_ent`,`suc`,`estado`) values (192,'3450 SAN MIGUEL','','','','PY','07','24','TOMAS ROMERO PEREIRA',1,'03','Activo');
insert  into `instituciones`(`cod_inst`,`nombre`,`ci_ruc`,`tel`,`email`,`codigo_pais`,`cod_depart`,`dist_num`,`dir`,`cod_ent`,`suc`,`estado`) values (193,'2616 SAN ISIDRO LABRADOR','','','','PY','07','24','TOMAS ROMERO PEREIRA',1,'03','Activo');
insert  into `instituciones`(`cod_inst`,`nombre`,`ci_ruc`,`tel`,`email`,`codigo_pais`,`cod_depart`,`dist_num`,`dir`,`cod_ent`,`suc`,`estado`) values (194,'7518 SAN CAYETANO','','','','PY','07','24','TOMAS ROMERO PEREIRA',1,'03','Activo');
insert  into `instituciones`(`cod_inst`,`nombre`,`ci_ruc`,`tel`,`email`,`codigo_pais`,`cod_depart`,`dist_num`,`dir`,`cod_ent`,`suc`,`estado`) values (195,'2507 MANUEL O GUERRERO','','','','PY','07','24','TOMAS ROMERO PEREIRA',1,'03','Activo');
insert  into `instituciones`(`cod_inst`,`nombre`,`ci_ruc`,`tel`,`email`,`codigo_pais`,`cod_depart`,`dist_num`,`dir`,`cod_ent`,`suc`,`estado`) values (196,'7136 8 DE DICIEMBRE','','','','PY','07','24','TOMAS ROMERO PEREIRA',1,'03','Activo');
insert  into `instituciones`(`cod_inst`,`nombre`,`ci_ruc`,`tel`,`email`,`codigo_pais`,`cod_depart`,`dist_num`,`dir`,`cod_ent`,`suc`,`estado`) values (197,'7126 ESC 1 DE MAYO','','','','PY','07','24','TOMAS ROMERO PEREIRA',1,'03','Activo');
insert  into `instituciones`(`cod_inst`,`nombre`,`ci_ruc`,`tel`,`email`,`codigo_pais`,`cod_depart`,`dist_num`,`dir`,`cod_ent`,`suc`,`estado`) values (198,'6324 ESC PALMITAL','','','','PY','07','09','CARLOS A LOPEZ',1,'03','Activo');
insert  into `instituciones`(`cod_inst`,`nombre`,`ci_ruc`,`tel`,`email`,`codigo_pais`,`cod_depart`,`dist_num`,`dir`,`cod_ent`,`suc`,`estado`) values (199,'* ESC  AGRICOLA','','','','PY','07','09','CARLOS A LOPEZ',1,'03','Activo');
insert  into `instituciones`(`cod_inst`,`nombre`,`ci_ruc`,`tel`,`email`,`codigo_pais`,`cod_depart`,`dist_num`,`dir`,`cod_ent`,`suc`,`estado`) values (200,'3749 ESC 3749 MARIA AUXILIADORA','','','','PY','07','25','ALTO VERA',1,'03','Activo');
insert  into `instituciones`(`cod_inst`,`nombre`,`ci_ruc`,`tel`,`email`,`codigo_pais`,`cod_depart`,`dist_num`,`dir`,`cod_ent`,`suc`,`estado`) values (201,'4462 ESC 4462 SAN JOSE OBRERO','','','','PY','07','25','ALTO VERA',1,'03','Activo');
insert  into `instituciones`(`cod_inst`,`nombre`,`ci_ruc`,`tel`,`email`,`codigo_pais`,`cod_depart`,`dist_num`,`dir`,`cod_ent`,`suc`,`estado`) values (202,'5916 ESC 5916 JOVERE','','','','PY','07','25','ALTO VERA',1,'03','Activo');
insert  into `instituciones`(`cod_inst`,`nombre`,`ci_ruc`,`tel`,`email`,`codigo_pais`,`cod_depart`,`dist_num`,`dir`,`cod_ent`,`suc`,`estado`) values (203,'5983 ESC 5983 LA ESPERANZA','','','','PY','07','25','ALTO VERA',1,'03','Activo');
insert  into `instituciones`(`cod_inst`,`nombre`,`ci_ruc`,`tel`,`email`,`codigo_pais`,`cod_depart`,`dist_num`,`dir`,`cod_ent`,`suc`,`estado`) values (204,'15407 ESC MBO`I KA`E','','','','PY','07','25','ALTO VERA',1,'03','Activo');
insert  into `instituciones`(`cod_inst`,`nombre`,`ci_ruc`,`tel`,`email`,`codigo_pais`,`cod_depart`,`dist_num`,`dir`,`cod_ent`,`suc`,`estado`) values (205,'4442 ESC 4442 MCAL FRANCISCO SOLANO LOPEZ','','','','PY','07','25','ALTO VERA',1,'03','Activo');
insert  into `instituciones`(`cod_inst`,`nombre`,`ci_ruc`,`tel`,`email`,`codigo_pais`,`cod_depart`,`dist_num`,`dir`,`cod_ent`,`suc`,`estado`) values (206,'7796 CARAGUATA','','','','PY','07','25','ALTO VERA',1,'03','Activo');
insert  into `instituciones`(`cod_inst`,`nombre`,`ci_ruc`,`tel`,`email`,`codigo_pais`,`cod_depart`,`dist_num`,`dir`,`cod_ent`,`suc`,`estado`) values (207,'1429 ESC WALTER BECKER','','','','PY','07','25','ALTO VERA',1,'03','Activo');
insert  into `instituciones`(`cod_inst`,`nombre`,`ci_ruc`,`tel`,`email`,`codigo_pais`,`cod_depart`,`dist_num`,`dir`,`cod_ent`,`suc`,`estado`) values (208,'7705 ESC BONANZA','','','','PY','07','25','ALTO VERA',1,'03','Activo');
insert  into `instituciones`(`cod_inst`,`nombre`,`ci_ruc`,`tel`,`email`,`codigo_pais`,`cod_depart`,`dist_num`,`dir`,`cod_ent`,`suc`,`estado`) values (209,'7370 ESC  MCAL JOSE F ESTIGARRIBIA','','','','PY','07','30','ITAPUA POTY',1,'03','Activo');
insert  into `instituciones`(`cod_inst`,`nombre`,`ci_ruc`,`tel`,`email`,`codigo_pais`,`cod_depart`,`dist_num`,`dir`,`cod_ent`,`suc`,`estado`) values (210,'8246 ESC KA`AGUY PORA','','','','PY','07','30','ITAPUA POTY',1,'03','Activo');
insert  into `instituciones`(`cod_inst`,`nombre`,`ci_ruc`,`tel`,`email`,`codigo_pais`,`cod_depart`,`dist_num`,`dir`,`cod_ent`,`suc`,`estado`) values (211,'7252 ESC  AUGUSTO ROA BASTOS','','','','PY','07','30','ITAPUA POTY',1,'03','Activo');
insert  into `instituciones`(`cod_inst`,`nombre`,`ci_ruc`,`tel`,`email`,`codigo_pais`,`cod_depart`,`dist_num`,`dir`,`cod_ent`,`suc`,`estado`) values (212,'6581 ESC SAN FRANCISCO DE ASIS','','','','PY','07','30','ITAPUA POTY',1,'03','Activo');
insert  into `instituciones`(`cod_inst`,`nombre`,`ci_ruc`,`tel`,`email`,`codigo_pais`,`cod_depart`,`dist_num`,`dir`,`cod_ent`,`suc`,`estado`) values (213,'2114 ESC  GRAL BERNANDINO CABALLERO','','','','PY','07','30','ITAPUA POTY',1,'03','Activo');
insert  into `instituciones`(`cod_inst`,`nombre`,`ci_ruc`,`tel`,`email`,`codigo_pais`,`cod_depart`,`dist_num`,`dir`,`cod_ent`,`suc`,`estado`) values (214,'6130 SAN JORGE','','','','PY','07','23','EDELIRA',1,'03','Activo');
insert  into `instituciones`(`cod_inst`,`nombre`,`ci_ruc`,`tel`,`email`,`codigo_pais`,`cod_depart`,`dist_num`,`dir`,`cod_ent`,`suc`,`estado`) values (215,'7118 ESC  18 DE AGOSTO','','','','PY','07','23','EDELIRA',1,'03','Activo');
insert  into `instituciones`(`cod_inst`,`nombre`,`ci_ruc`,`tel`,`email`,`codigo_pais`,`cod_depart`,`dist_num`,`dir`,`cod_ent`,`suc`,`estado`) values (216,'7118 ESC 18 DE AGOSTO ACRA','','','','PY','07','23','EDELIRA',1,'03','Activo');
insert  into `instituciones`(`cod_inst`,`nombre`,`ci_ruc`,`tel`,`email`,`codigo_pais`,`cod_depart`,`dist_num`,`dir`,`cod_ent`,`suc`,`estado`) values (217,'7123 ESC 7 SAN ISIDRO','','','','PY','07','23','EDELIRA',1,'03','Activo');
insert  into `instituciones`(`cod_inst`,`nombre`,`ci_ruc`,`tel`,`email`,`codigo_pais`,`cod_depart`,`dist_num`,`dir`,`cod_ent`,`suc`,`estado`) values (218,'2606 ESC  VIRGEN DE FATIMA','','','','PY','07','23','EDELIRA',1,'03','Activo');
insert  into `instituciones`(`cod_inst`,`nombre`,`ci_ruc`,`tel`,`email`,`codigo_pais`,`cod_depart`,`dist_num`,`dir`,`cod_ent`,`suc`,`estado`) values (219,'7151 ESC  SAN ANTONIO DE PAUDA','','','','PY','07','23','EDELIRA',1,'03','Activo');
insert  into `instituciones`(`cod_inst`,`nombre`,`ci_ruc`,`tel`,`email`,`codigo_pais`,`cod_depart`,`dist_num`,`dir`,`cod_ent`,`suc`,`estado`) values (220,'3098 ESC  HILARIO FRETES MARIN','','','','PY','07','23','EDELIRA',1,'03','Activo');
insert  into `instituciones`(`cod_inst`,`nombre`,`ci_ruc`,`tel`,`email`,`codigo_pais`,`cod_depart`,`dist_num`,`dir`,`cod_ent`,`suc`,`estado`) values (221,'5208 ESC 5208 FRANCISCO LAMBARE','','','','PY','07','10','NATALIO',1,'03','Activo');
insert  into `instituciones`(`cod_inst`,`nombre`,`ci_ruc`,`tel`,`email`,`codigo_pais`,`cod_depart`,`dist_num`,`dir`,`cod_ent`,`suc`,`estado`) values (222,'3294 ESC  SAN JORGE','','','','PY','07','10','NATALIO',1,'03','Activo');
insert  into `instituciones`(`cod_inst`,`nombre`,`ci_ruc`,`tel`,`email`,`codigo_pais`,`cod_depart`,`dist_num`,`dir`,`cod_ent`,`suc`,`estado`) values (223,'939 ESC RUDO PADRE RICARDO MUSCH','','','','PY','07','10','NATALIO',1,'03','Activo');
insert  into `instituciones`(`cod_inst`,`nombre`,`ci_ruc`,`tel`,`email`,`codigo_pais`,`cod_depart`,`dist_num`,`dir`,`cod_ent`,`suc`,`estado`) values (224,'7354 COMUNIDAD GUAVIRAMI','','','','PY','07','22','TRINIDAD',1,'03','Activo');
insert  into `instituciones`(`cod_inst`,`nombre`,`ci_ruc`,`tel`,`email`,`codigo_pais`,`cod_depart`,`dist_num`,`dir`,`cod_ent`,`suc`,`estado`) values (225,'739 ESC PEDRO DE LLAMAS','','','','PY','07','22','TRINIDAD',1,'03','Activo');
insert  into `instituciones`(`cod_inst`,`nombre`,`ci_ruc`,`tel`,`email`,`codigo_pais`,`cod_depart`,`dist_num`,`dir`,`cod_ent`,`suc`,`estado`) values (226,'735 ESC SAN JOSE','','','','PY','07','06','NUEVA ALBORADA',1,'03','Activo');
insert  into `instituciones`(`cod_inst`,`nombre`,`ci_ruc`,`tel`,`email`,`codigo_pais`,`cod_depart`,`dist_num`,`dir`,`cod_ent`,`suc`,`estado`) values (227,'2447 ESC 2447 SILVANA MELGAREJO','','','','PY','07','06','NUEVA ALBORADA',1,'03','Activo');
insert  into `instituciones`(`cod_inst`,`nombre`,`ci_ruc`,`tel`,`email`,`codigo_pais`,`cod_depart`,`dist_num`,`dir`,`cod_ent`,`suc`,`estado`) values (228,'4011 ESC 4011 PERPETUO SOCORRO','','','','PY','07','06','NUEVA ALBORADA',1,'03','Activo');
insert  into `instituciones`(`cod_inst`,`nombre`,`ci_ruc`,`tel`,`email`,`codigo_pais`,`cod_depart`,`dist_num`,`dir`,`cod_ent`,`suc`,`estado`) values (229,'4011 COLEGIO TECNICO','','','','PY','07','01','ENCARNACION',1,'03','Activo');
insert  into `instituciones`(`cod_inst`,`nombre`,`ci_ruc`,`tel`,`email`,`codigo_pais`,`cod_depart`,`dist_num`,`dir`,`cod_ent`,`suc`,`estado`) values (230,'7580 ESC MAKA','','','','PY','07','01','ENCARNACION',1,'03','Activo');
insert  into `instituciones`(`cod_inst`,`nombre`,`ci_ruc`,`tel`,`email`,`codigo_pais`,`cod_depart`,`dist_num`,`dir`,`cod_ent`,`suc`,`estado`) values (231,'3771 ESC ROGELIO BENITEZ','','','','PY','07','01','ENCARNACION',1,'03','Activo');
insert  into `instituciones`(`cod_inst`,`nombre`,`ci_ruc`,`tel`,`email`,`codigo_pais`,`cod_depart`,`dist_num`,`dir`,`cod_ent`,`suc`,`estado`) values (232,'640 ESC SAN ISIDRO','','','','PY','07','01','ENCARNACION',1,'03','Activo');
insert  into `instituciones`(`cod_inst`,`nombre`,`ci_ruc`,`tel`,`email`,`codigo_pais`,`cod_depart`,`dist_num`,`dir`,`cod_ent`,`suc`,`estado`) values (233,'1541 ESC NUEVA EZPERANZA','','','','PY','07','01','ENCARNACION',1,'03','Activo');
insert  into `instituciones`(`cod_inst`,`nombre`,`ci_ruc`,`tel`,`email`,`codigo_pais`,`cod_depart`,`dist_num`,`dir`,`cod_ent`,`suc`,`estado`) values (234,'4761 ESC SANTA CLARA','','','','PY','07','08','CNEL BOGADO',1,'03','Activo');
insert  into `instituciones`(`cod_inst`,`nombre`,`ci_ruc`,`tel`,`email`,`codigo_pais`,`cod_depart`,`dist_num`,`dir`,`cod_ent`,`suc`,`estado`) values (235,'700 ESC MCAL FRANCISCO SOLANO LOPEZ','','','','PY','07','08','CNEL BOGADO',1,'03','Activo');
insert  into `instituciones`(`cod_inst`,`nombre`,`ci_ruc`,`tel`,`email`,`codigo_pais`,`cod_depart`,`dist_num`,`dir`,`cod_ent`,`suc`,`estado`) values (236,'3323 ESC SAN JOSE','','','','PY','07','05','CAPITAN MIRANDA',1,'03','Activo');

/*Table structure for table `lista_prec_x_art` */

DROP TABLE IF EXISTS `lista_prec_x_art`;

CREATE TABLE `lista_prec_x_art` (
  `codigo` varchar(30) NOT NULL,
  `precio` decimal(16,2) DEFAULT NULL,
  `usuario` varchar(30) NOT NULL,
  `fecha` datetime DEFAULT NULL,
  PRIMARY KEY (`codigo`),
  KEY `Refusuarios79` (`usuario`),
  CONSTRAINT `Refarticulos78` FOREIGN KEY (`codigo`) REFERENCES `articulos` (`codigo`),
  CONSTRAINT `Refusuarios79` FOREIGN KEY (`usuario`) REFERENCES `usuarios` (`usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `lista_prec_x_art` */

/*Table structure for table `lista_precios` */

DROP TABLE IF EXISTS `lista_precios`;

CREATE TABLE `lista_precios` (
  `num` int(11) NOT NULL,
  `moneda` varchar(4) NOT NULL,
  `um` varchar(10) NOT NULL,
  `descrip` varchar(30) DEFAULT NULL,
  `ref_num` int(11) NOT NULL,
  `ref_moneda` varchar(4) NOT NULL,
  `ref_um` varchar(10) NOT NULL,
  `factor` decimal(4,3) DEFAULT NULL,
  `regla_redondeo` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`num`,`moneda`,`um`),
  KEY `Refmonedas73` (`moneda`),
  KEY `Refunidades_medida74` (`um`),
  KEY `Reflista_precios76` (`ref_num`,`ref_moneda`,`ref_um`),
  CONSTRAINT `Reflista_precios76` FOREIGN KEY (`ref_num`, `ref_moneda`, `ref_um`) REFERENCES `lista_precios` (`num`, `moneda`, `um`),
  CONSTRAINT `Refmonedas73` FOREIGN KEY (`moneda`) REFERENCES `monedas` (`m_cod`),
  CONSTRAINT `Refunidades_medida74` FOREIGN KEY (`um`) REFERENCES `unidades_medida` (`um_cod`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `lista_precios` */

/*Table structure for table `logs` */

DROP TABLE IF EXISTS `logs`;

CREATE TABLE `logs` (
  `id_log` int(11) NOT NULL AUTO_INCREMENT,
  `usuario` varchar(30) NOT NULL,
  `ip` varchar(30) DEFAULT NULL,
  `fecha` date DEFAULT NULL,
  `hora` varchar(12) DEFAULT NULL,
  `accion` varchar(30) DEFAULT NULL,
  `tipo` varchar(20) DEFAULT NULL,
  `doc_num` varchar(16) DEFAULT NULL,
  `data` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`id_log`),
  KEY `Refusuarios148` (`usuario`),
  CONSTRAINT `Refusuarios148` FOREIGN KEY (`usuario`) REFERENCES `usuarios` (`usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `logs` */

/*Table structure for table `metas` */

DROP TABLE IF EXISTS `metas`;

CREATE TABLE `metas` (
  `id_meta` smallint(6) NOT NULL,
  `usuario` varchar(30) NOT NULL,
  `meta_minima` decimal(16,0) DEFAULT NULL,
  `meta_base` decimal(16,0) DEFAULT NULL,
  `sueldo_base` decimal(16,0) DEFAULT NULL,
  `ponderacion` decimal(3,0) DEFAULT NULL,
  PRIMARY KEY (`id_meta`,`usuario`),
  KEY `Refusuarios226` (`usuario`),
  CONSTRAINT `Refusuarios226` FOREIGN KEY (`usuario`) REFERENCES `usuarios` (`usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `metas` */

/*Table structure for table `monedas` */

DROP TABLE IF EXISTS `monedas`;

CREATE TABLE `monedas` (
  `m_cod` varchar(4) NOT NULL,
  `m_descri` varchar(30) DEFAULT NULL,
  `m_ref` varchar(4) DEFAULT NULL,
  PRIMARY KEY (`m_cod`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `monedas` */

/*Table structure for table `paises` */

DROP TABLE IF EXISTS `paises`;

CREATE TABLE `paises` (
  `codigo_pais` varchar(30) NOT NULL,
  `nombre` varchar(30) DEFAULT NULL,
  `hits` int(11) DEFAULT NULL,
  PRIMARY KEY (`codigo_pais`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `paises` */

insert  into `paises`(`codigo_pais`,`nombre`,`hits`) values ('PY','Paraguay',1);

/*Table structure for table `parametros` */

DROP TABLE IF EXISTS `parametros`;

CREATE TABLE `parametros` (
  `clave` varchar(40) NOT NULL,
  `usuario` varchar(30) NOT NULL,
  `valor` varchar(60) DEFAULT NULL,
  `descrip` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`clave`,`usuario`),
  KEY `Refusuarios82` (`usuario`),
  CONSTRAINT `Refusuarios82` FOREIGN KEY (`usuario`) REFERENCES `usuarios` (`usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `parametros` */

/*Table structure for table `pdvs` */

DROP TABLE IF EXISTS `pdvs`;

CREATE TABLE `pdvs` (
  `pdv_cod` varchar(30) NOT NULL,
  `suc` varchar(10) NOT NULL,
  `pdv_ubic` varchar(30) NOT NULL,
  `tipo` varchar(30) NOT NULL,
  `moneda` varchar(4) NOT NULL,
  `sub_tipo` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`pdv_cod`,`suc`,`pdv_ubic`,`tipo`,`moneda`),
  KEY `Refsucursales122` (`suc`),
  KEY `Refmonedas224` (`moneda`),
  CONSTRAINT `Refmonedas224` FOREIGN KEY (`moneda`) REFERENCES `monedas` (`m_cod`),
  CONSTRAINT `Refsucursales122` FOREIGN KEY (`suc`) REFERENCES `sucursales` (`suc`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `pdvs` */

/*Table structure for table `permisos` */

DROP TABLE IF EXISTS `permisos`;

CREATE TABLE `permisos` (
  `id_permiso` varchar(10) NOT NULL,
  `descripcion` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id_permiso`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `permisos` */

insert  into `permisos`(`id_permiso`,`descripcion`) values ('1','Acceso al Menu Call Center');
insert  into `permisos`(`id_permiso`,`descripcion`) values ('10','Acceso al Menu Reportes');
insert  into `permisos`(`id_permiso`,`descripcion`) values ('10.1','Reporte de Comunicaciones');
insert  into `permisos`(`id_permiso`,`descripcion`) values ('10.2','Reporte de Cumpleaños');
insert  into `permisos`(`id_permiso`,`descripcion`) values ('2','Acceso al Menu Archivo');
insert  into `permisos`(`id_permiso`,`descripcion`) values ('2.1','Acceso al Menu Personas');
insert  into `permisos`(`id_permiso`,`descripcion`) values ('2.2','Acceso al Menu Entidades');
insert  into `permisos`(`id_permiso`,`descripcion`) values ('2.3','Acceso al Menu Distritos');
insert  into `permisos`(`id_permiso`,`descripcion`) values ('2.4','Acceso al Menu Instituciones');
insert  into `permisos`(`id_permiso`,`descripcion`) values ('5','Acceso al Menu Configuracion');
insert  into `permisos`(`id_permiso`,`descripcion`) values ('5.1','Acceso al Menu Administracion de Usuarios');
insert  into `permisos`(`id_permiso`,`descripcion`) values ('5.2','Acceso al Menu Impresion de Credenciales');
insert  into `permisos`(`id_permiso`,`descripcion`) values ('5.3','Acceso al Menu Configuracion de Sistema');
insert  into `permisos`(`id_permiso`,`descripcion`) values ('5.3.1','Acceso al Menu Permisos x Grupo');
insert  into `permisos`(`id_permiso`,`descripcion`) values ('5.4','Acceso al Menu Perfil y Password');

/*Table structure for table `permisos_x_grupo` */

DROP TABLE IF EXISTS `permisos_x_grupo`;

CREATE TABLE `permisos_x_grupo` (
  `id_permiso` varchar(10) NOT NULL,
  `id_grupo` int(11) NOT NULL,
  `trustee` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id_permiso`,`id_grupo`),
  KEY `Refgrupos103` (`id_grupo`),
  CONSTRAINT `Refgrupos103` FOREIGN KEY (`id_grupo`) REFERENCES `grupos` (`id_grupo`),
  CONSTRAINT `Refpermisos101` FOREIGN KEY (`id_permiso`) REFERENCES `permisos` (`id_permiso`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `permisos_x_grupo` */

insert  into `permisos_x_grupo`(`id_permiso`,`id_grupo`,`trustee`) values ('1',1,'vem');
insert  into `permisos_x_grupo`(`id_permiso`,`id_grupo`,`trustee`) values ('1',3,'vem');
insert  into `permisos_x_grupo`(`id_permiso`,`id_grupo`,`trustee`) values ('10',3,'vem');
insert  into `permisos_x_grupo`(`id_permiso`,`id_grupo`,`trustee`) values ('10.1',3,'vem');
insert  into `permisos_x_grupo`(`id_permiso`,`id_grupo`,`trustee`) values ('10.2',3,'vem');
insert  into `permisos_x_grupo`(`id_permiso`,`id_grupo`,`trustee`) values ('2',1,'vem');
insert  into `permisos_x_grupo`(`id_permiso`,`id_grupo`,`trustee`) values ('2',3,'vem');
insert  into `permisos_x_grupo`(`id_permiso`,`id_grupo`,`trustee`) values ('2.1',1,'vem');
insert  into `permisos_x_grupo`(`id_permiso`,`id_grupo`,`trustee`) values ('2.1',3,'vem');
insert  into `permisos_x_grupo`(`id_permiso`,`id_grupo`,`trustee`) values ('2.2',3,'vem');
insert  into `permisos_x_grupo`(`id_permiso`,`id_grupo`,`trustee`) values ('2.3',3,'vem');
insert  into `permisos_x_grupo`(`id_permiso`,`id_grupo`,`trustee`) values ('2.4',3,'vem');
insert  into `permisos_x_grupo`(`id_permiso`,`id_grupo`,`trustee`) values ('5',3,'vem');
insert  into `permisos_x_grupo`(`id_permiso`,`id_grupo`,`trustee`) values ('5.1',3,'vem');
insert  into `permisos_x_grupo`(`id_permiso`,`id_grupo`,`trustee`) values ('5.2',3,'vem');
insert  into `permisos_x_grupo`(`id_permiso`,`id_grupo`,`trustee`) values ('5.3',3,'vem');
insert  into `permisos_x_grupo`(`id_permiso`,`id_grupo`,`trustee`) values ('5.3.1',3,'vem');
insert  into `permisos_x_grupo`(`id_permiso`,`id_grupo`,`trustee`) values ('5.4',3,'vem');

/*Table structure for table `personas` */

DROP TABLE IF EXISTS `personas`;

CREATE TABLE `personas` (
  `cod_per` int(11) NOT NULL AUTO_INCREMENT,
  `cod_inst` int(11) NOT NULL,
  `tipo_doc` varchar(30) DEFAULT NULL,
  `ci_ruc` varchar(30) DEFAULT NULL,
  `nombre` varchar(60) DEFAULT NULL,
  `tel` varchar(30) DEFAULT NULL,
  `email` varchar(40) DEFAULT NULL,
  `fecha_nac` date DEFAULT NULL,
  `estado` varchar(30) DEFAULT NULL,
  `ciudad` varchar(30) DEFAULT NULL,
  `dir` varchar(60) DEFAULT NULL,
  `geoloc` varchar(120) DEFAULT NULL,
  `ocupacion` varchar(30) DEFAULT NULL,
  `tipo` varchar(16) DEFAULT NULL,
  `usuario` varchar(30) DEFAULT NULL,
  `fecha_reg` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`cod_per`),
  KEY `Refinsituciones250` (`cod_inst`),
  CONSTRAINT `Refinsituciones250` FOREIGN KEY (`cod_inst`) REFERENCES `instituciones` (`cod_inst`)
) ENGINE=InnoDB AUTO_INCREMENT=190 DEFAULT CHARSET=latin1;

/*Data for the table `personas` */

insert  into `personas`(`cod_per`,`cod_inst`,`tipo_doc`,`ci_ruc`,`nombre`,`tel`,`email`,`fecha_nac`,`estado`,`ciudad`,`dir`,`geoloc`,`ocupacion`,`tipo`,`usuario`,`fecha_reg`) values (1,1,'CI','2.352.951','MIGUELINA VILLASBOA DE FIGUEREDO','985374656','','2020-05-08','Activo','','Obligado','','Cocinero/a','','douglas','2020-03-10');
insert  into `personas`(`cod_per`,`cod_inst`,`tipo_doc`,`ci_ruc`,`nombre`,`tel`,`email`,`fecha_nac`,`estado`,`ciudad`,`dir`,`geoloc`,`ocupacion`,`tipo`,`usuario`,`fecha_reg`) values (2,2,'CI','7.348.397','CRISTINA BENITEZ GONZALES','SIN NUMERO','','2020-05-09','Activo','','Pirapo','','Cocinero/a','','douglas','2020-03-10');
insert  into `personas`(`cod_per`,`cod_inst`,`tipo_doc`,`ci_ruc`,`nombre`,`tel`,`email`,`fecha_nac`,`estado`,`ciudad`,`dir`,`geoloc`,`ocupacion`,`tipo`,`usuario`,`fecha_reg`) values (3,3,'CI','5.477.039','BLACIDA CASTILLO BENITEZ','SIN NUMERO','','2020-10-11','Activo','','Pirapo','','Cocinero/a','','douglas','2020-03-10');
insert  into `personas`(`cod_per`,`cod_inst`,`tipo_doc`,`ci_ruc`,`nombre`,`tel`,`email`,`fecha_nac`,`estado`,`ciudad`,`dir`,`geoloc`,`ocupacion`,`tipo`,`usuario`,`fecha_reg`) values (4,4,'CI','4.113.499','DELIA ALMIRON FRANCO','985268770','','2020-09-15','Activo','','SAN PEDRO DEL PARANA','','Cocinero/a','','douglas','2020-03-10');
insert  into `personas`(`cod_per`,`cod_inst`,`tipo_doc`,`ci_ruc`,`nombre`,`tel`,`email`,`fecha_nac`,`estado`,`ciudad`,`dir`,`geoloc`,`ocupacion`,`tipo`,`usuario`,`fecha_reg`) values (5,5,'CI','3.904.386','NILDA ROJAS','SIN NUMERO','','2020-06-15','Activo','','SAN PEDRO DEL PARANA','','Cocinero/a','','douglas','2020-03-10');
insert  into `personas`(`cod_per`,`cod_inst`,`tipo_doc`,`ci_ruc`,`nombre`,`tel`,`email`,`fecha_nac`,`estado`,`ciudad`,`dir`,`geoloc`,`ocupacion`,`tipo`,`usuario`,`fecha_reg`) values (6,6,'CI','5.895.967','DOMINGA SILVA ALGARIN','985605428','','2020-12-20','Activo','','SAN PEDRO DEL PARANA','','Cocinero/a','','douglas','2020-03-10');
insert  into `personas`(`cod_per`,`cod_inst`,`tipo_doc`,`ci_ruc`,`nombre`,`tel`,`email`,`fecha_nac`,`estado`,`ciudad`,`dir`,`geoloc`,`ocupacion`,`tipo`,`usuario`,`fecha_reg`) values (7,7,'CI','5.358.163','AURELIA SOTELO','982820348','','2020-07-10','Activo','','SAN PEDRO DEL PARANA','','Cocinero/a','','douglas','2020-03-10');
insert  into `personas`(`cod_per`,`cod_inst`,`tipo_doc`,`ci_ruc`,`nombre`,`tel`,`email`,`fecha_nac`,`estado`,`ciudad`,`dir`,`geoloc`,`ocupacion`,`tipo`,`usuario`,`fecha_reg`) values (8,8,'CI','5.914.905','GILDA VIGO','986610915','','2020-09-01','Activo','','SAN PEDRO DEL PARANA','','Cocinero/a','','douglas','2020-03-10');
insert  into `personas`(`cod_per`,`cod_inst`,`tipo_doc`,`ci_ruc`,`nombre`,`tel`,`email`,`fecha_nac`,`estado`,`ciudad`,`dir`,`geoloc`,`ocupacion`,`tipo`,`usuario`,`fecha_reg`) values (9,9,'CI','2.692.622','MIRIAN ROJAS','983838010','','2020-12-20','Activo','','SAN PEDRO DEL PARANA','','Cocinero/a','','douglas','2020-03-10');
insert  into `personas`(`cod_per`,`cod_inst`,`tipo_doc`,`ci_ruc`,`nombre`,`tel`,`email`,`fecha_nac`,`estado`,`ciudad`,`dir`,`geoloc`,`ocupacion`,`tipo`,`usuario`,`fecha_reg`) values (10,10,'CI','5.807.868','CELESTINA TRINIDAD ROJAS','984860204','','2020-05-19','Activo','','SAN PEDRO DEL PARANA','','Cocinero/a','','douglas','2020-03-10');
insert  into `personas`(`cod_per`,`cod_inst`,`tipo_doc`,`ci_ruc`,`nombre`,`tel`,`email`,`fecha_nac`,`estado`,`ciudad`,`dir`,`geoloc`,`ocupacion`,`tipo`,`usuario`,`fecha_reg`) values (11,10,'CI','6.138.344','ROMINA TRINIDAD MAIDANA','984356859','','2020-01-21','Activo','','SAN PEDRO DEL PARANA','','Cocinero/a','','douglas','2020-03-10');
insert  into `personas`(`cod_per`,`cod_inst`,`tipo_doc`,`ci_ruc`,`nombre`,`tel`,`email`,`fecha_nac`,`estado`,`ciudad`,`dir`,`geoloc`,`ocupacion`,`tipo`,`usuario`,`fecha_reg`) values (12,11,'CI','4.890.370','EUGENIA GONZALES REYES','973176602','','2020-09-21','Activo','','SAN PEDRO DEL PARANA','','Cocinero/a','','douglas','2020-03-10');
insert  into `personas`(`cod_per`,`cod_inst`,`tipo_doc`,`ci_ruc`,`nombre`,`tel`,`email`,`fecha_nac`,`estado`,`ciudad`,`dir`,`geoloc`,`ocupacion`,`tipo`,`usuario`,`fecha_reg`) values (13,5,'CI','3.036.394','ALICIA OCAMPOS BENITEZ','986168699','','2020-05-02','Activo','','SAN PEDRO DEL PARANA','','Cocinero/a','','douglas','2020-03-10');
insert  into `personas`(`cod_per`,`cod_inst`,`tipo_doc`,`ci_ruc`,`nombre`,`tel`,`email`,`fecha_nac`,`estado`,`ciudad`,`dir`,`geoloc`,`ocupacion`,`tipo`,`usuario`,`fecha_reg`) values (14,12,'CI','2.277.542','LIBRADA DIAZ VAZQUEZ','986699665','','2020-07-20','Activo','','SAN PEDRO DEL PARANA','','Cocinero/a','','douglas','2020-03-10');
insert  into `personas`(`cod_per`,`cod_inst`,`tipo_doc`,`ci_ruc`,`nombre`,`tel`,`email`,`fecha_nac`,`estado`,`ciudad`,`dir`,`geoloc`,`ocupacion`,`tipo`,`usuario`,`fecha_reg`) values (15,12,'CI','5.517.780','ADRIANA CA?ETE CUBILLA','986346940','','2020-12-27','Activo','','SAN PEDRO DEL PARANA','','Cocinero/a','','douglas','2020-03-10');
insert  into `personas`(`cod_per`,`cod_inst`,`tipo_doc`,`ci_ruc`,`nombre`,`tel`,`email`,`fecha_nac`,`estado`,`ciudad`,`dir`,`geoloc`,`ocupacion`,`tipo`,`usuario`,`fecha_reg`) values (16,12,'CI','5.077.876','LILIANA ZARZA','981483787','','2020-03-02','Activo','','SAN PEDRO DEL PARANA','','Cocinero/a','','douglas','2020-03-10');
insert  into `personas`(`cod_per`,`cod_inst`,`tipo_doc`,`ci_ruc`,`nombre`,`tel`,`email`,`fecha_nac`,`estado`,`ciudad`,`dir`,`geoloc`,`ocupacion`,`tipo`,`usuario`,`fecha_reg`) values (17,13,'CI','2.056.481','PABLINA ROJAS SOTELO','983554695','','2020-12-02','Activo','','SAN PEDRO DEL PARANA','','Cocinero/a','','douglas','2020-03-10');
insert  into `personas`(`cod_per`,`cod_inst`,`tipo_doc`,`ci_ruc`,`nombre`,`tel`,`email`,`fecha_nac`,`estado`,`ciudad`,`dir`,`geoloc`,`ocupacion`,`tipo`,`usuario`,`fecha_reg`) values (18,13,'CI','5.844.461','HIPOLITA SARABIA SOLTELO','983724381','','2020-08-13','Activo','','SAN PEDRO DEL PARANA','','Cocinero/a','','douglas','2020-03-10');
insert  into `personas`(`cod_per`,`cod_inst`,`tipo_doc`,`ci_ruc`,`nombre`,`tel`,`email`,`fecha_nac`,`estado`,`ciudad`,`dir`,`geoloc`,`ocupacion`,`tipo`,`usuario`,`fecha_reg`) values (19,14,'CI','4.949.084','MELCHORA FARI?A VERA','982377158','','2020-04-16','Activo','','SAN PEDRO DEL PARANA','','Cocinero/a','','douglas','2020-03-10');
insert  into `personas`(`cod_per`,`cod_inst`,`tipo_doc`,`ci_ruc`,`nombre`,`tel`,`email`,`fecha_nac`,`estado`,`ciudad`,`dir`,`geoloc`,`ocupacion`,`tipo`,`usuario`,`fecha_reg`) values (20,14,'CI','5.515.103','ZUNY FIGUEREDO DUARTE','983322335','','2020-01-26','Activo','','SAN PEDRO DEL PARANA','','Cocinero/a','','douglas','2020-03-10');
insert  into `personas`(`cod_per`,`cod_inst`,`tipo_doc`,`ci_ruc`,`nombre`,`tel`,`email`,`fecha_nac`,`estado`,`ciudad`,`dir`,`geoloc`,`ocupacion`,`tipo`,`usuario`,`fecha_reg`) values (21,15,'CI','3.558.601','LEONIDA BOGADO MOLINAS','985533125','','2020-01-22','Activo','','SAN PEDRO DEL PARANA','','Cocinero/a','','douglas','2020-03-10');
insert  into `personas`(`cod_per`,`cod_inst`,`tipo_doc`,`ci_ruc`,`nombre`,`tel`,`email`,`fecha_nac`,`estado`,`ciudad`,`dir`,`geoloc`,`ocupacion`,`tipo`,`usuario`,`fecha_reg`) values (22,16,'CI','6.350.073','ROSSANA TRINIDAD DE VIGO','985279264','','2020-02-07','Activo','','SAN PEDRO DEL PARANA','','Cocinero/a','','douglas','2020-03-10');
insert  into `personas`(`cod_per`,`cod_inst`,`tipo_doc`,`ci_ruc`,`nombre`,`tel`,`email`,`fecha_nac`,`estado`,`ciudad`,`dir`,`geoloc`,`ocupacion`,`tipo`,`usuario`,`fecha_reg`) values (23,17,'CI','3.360.419','MARIA DEL CARMEN NU?EZ RAMIREZ','985520668','','2020-07-15','Activo','','SAN PEDRO DEL PARANA','','Cocinero/a','','douglas','2020-03-10');
insert  into `personas`(`cod_per`,`cod_inst`,`tipo_doc`,`ci_ruc`,`nombre`,`tel`,`email`,`fecha_nac`,`estado`,`ciudad`,`dir`,`geoloc`,`ocupacion`,`tipo`,`usuario`,`fecha_reg`) values (24,17,'CI','2.692.672','IRMA BARRETO DELVALLE','983268093','','2020-05-10','Activo','','SAN PEDRO DEL PARANA','','Cocinero/a','','douglas','2020-03-10');
insert  into `personas`(`cod_per`,`cod_inst`,`tipo_doc`,`ci_ruc`,`nombre`,`tel`,`email`,`fecha_nac`,`estado`,`ciudad`,`dir`,`geoloc`,`ocupacion`,`tipo`,`usuario`,`fecha_reg`) values (25,17,'CI','4.083.814','VERONICA BORDON FRANCO','985349745','','2020-08-27','Activo','','SAN PEDRO DEL PARANA','','Cocinero/a','','douglas','2020-03-10');
insert  into `personas`(`cod_per`,`cod_inst`,`tipo_doc`,`ci_ruc`,`nombre`,`tel`,`email`,`fecha_nac`,`estado`,`ciudad`,`dir`,`geoloc`,`ocupacion`,`tipo`,`usuario`,`fecha_reg`) values (26,18,'CI','5.113.811','MARIA ISABEL GONZALEZ FORCADO','984614866','','2020-06-03','Activo','','SAN RAFAEL DEL PARANA','','Cocinero/a','','douglas','2020-03-10');
insert  into `personas`(`cod_per`,`cod_inst`,`tipo_doc`,`ci_ruc`,`nombre`,`tel`,`email`,`fecha_nac`,`estado`,`ciudad`,`dir`,`geoloc`,`ocupacion`,`tipo`,`usuario`,`fecha_reg`) values (27,18,'CI','1.596.704','LUISA VAZQUEZ PAEZ','981653104','','2020-10-11','Activo','','SAN RAFAEL DEL PARANA','','Cocinero/a','','douglas','2020-03-10');
insert  into `personas`(`cod_per`,`cod_inst`,`tipo_doc`,`ci_ruc`,`nombre`,`tel`,`email`,`fecha_nac`,`estado`,`ciudad`,`dir`,`geoloc`,`ocupacion`,`tipo`,`usuario`,`fecha_reg`) values (28,19,'CI','3.907.307','SEBASTIANA SANDOVAL GARCETE','984419167','','2020-01-20','Activo','','SAN RAFAEL DEL PARANA','','Cocinero/a','','douglas','2020-03-10');
insert  into `personas`(`cod_per`,`cod_inst`,`tipo_doc`,`ci_ruc`,`nombre`,`tel`,`email`,`fecha_nac`,`estado`,`ciudad`,`dir`,`geoloc`,`ocupacion`,`tipo`,`usuario`,`fecha_reg`) values (29,20,'CI','7.274.094','NORMA RUIZ ARAUJO','985303053','','2020-11-26','Activo','','SAN RAFAEL  DEL PARANA','','Cocinero/a','','douglas','2020-03-10');
insert  into `personas`(`cod_per`,`cod_inst`,`tipo_doc`,`ci_ruc`,`nombre`,`tel`,`email`,`fecha_nac`,`estado`,`ciudad`,`dir`,`geoloc`,`ocupacion`,`tipo`,`usuario`,`fecha_reg`) values (30,21,'CI','5.599.401','ANA CABALLERO AQUINO','9824751884','','2020-07-13','Activo','','SAN RAFAEL  DEL PARANA','','Cocinero/a','','douglas','2020-03-10');
insert  into `personas`(`cod_per`,`cod_inst`,`tipo_doc`,`ci_ruc`,`nombre`,`tel`,`email`,`fecha_nac`,`estado`,`ciudad`,`dir`,`geoloc`,`ocupacion`,`tipo`,`usuario`,`fecha_reg`) values (31,22,'CI','5.950.397','BLASIDA PEREIRA FERREIRA','982712347','','2020-02-03','Activo','','SAN RAFAEL  DEL PARANA','','Cocinero/a','','douglas','2020-03-10');
insert  into `personas`(`cod_per`,`cod_inst`,`tipo_doc`,`ci_ruc`,`nombre`,`tel`,`email`,`fecha_nac`,`estado`,`ciudad`,`dir`,`geoloc`,`ocupacion`,`tipo`,`usuario`,`fecha_reg`) values (32,23,'CI','4.113.042','MARTA VERON DE BRIZUELA','982221393','','2020-05-23','Activo','','SAN RAFAEL  DEL PARANA','','Cocinero/a','','douglas','2020-03-10');
insert  into `personas`(`cod_per`,`cod_inst`,`tipo_doc`,`ci_ruc`,`nombre`,`tel`,`email`,`fecha_nac`,`estado`,`ciudad`,`dir`,`geoloc`,`ocupacion`,`tipo`,`usuario`,`fecha_reg`) values (33,164,'CI','4.478.902','LORENZA GIMENEZ DE PRIETO','982318241','','2020-08-10','Activo','','SAN RAFAEL  DEL PARANA','','Cocinero/a','','douglas','2020-03-10');
insert  into `personas`(`cod_per`,`cod_inst`,`tipo_doc`,`ci_ruc`,`nombre`,`tel`,`email`,`fecha_nac`,`estado`,`ciudad`,`dir`,`geoloc`,`ocupacion`,`tipo`,`usuario`,`fecha_reg`) values (34,24,'CI','','ANTONIA MENDOZA VELAZQUEZ','SIN NUMERO','','2020-09-22','Activo','','SAN RAFAEL DEL PARANA','','Cocinero/a','','douglas','2020-03-10');
insert  into `personas`(`cod_per`,`cod_inst`,`tipo_doc`,`ci_ruc`,`nombre`,`tel`,`email`,`fecha_nac`,`estado`,`ciudad`,`dir`,`geoloc`,`ocupacion`,`tipo`,`usuario`,`fecha_reg`) values (35,25,'CI','3.286.340','ZUNILDA GONZALEZ DE BARRIA','982914740','','2020-06-10','Activo','','SAN RAFAEL  DEL PARANA','','Cocinero/a','','douglas','2020-03-10');
insert  into `personas`(`cod_per`,`cod_inst`,`tipo_doc`,`ci_ruc`,`nombre`,`tel`,`email`,`fecha_nac`,`estado`,`ciudad`,`dir`,`geoloc`,`ocupacion`,`tipo`,`usuario`,`fecha_reg`) values (36,26,'CI','3.593.169','BLANCA CACERES DE VILLALBA','994855013','','2020-09-19','Activo','','SAN JUAN  DEL PARANA','','Cocinero/a','','douglas','2020-03-10');
insert  into `personas`(`cod_per`,`cod_inst`,`tipo_doc`,`ci_ruc`,`nombre`,`tel`,`email`,`fecha_nac`,`estado`,`ciudad`,`dir`,`geoloc`,`ocupacion`,`tipo`,`usuario`,`fecha_reg`) values (37,26,'CI','4.431.677','FATIMA VILLALBA CACERES','986460888','','2020-05-18','Activo','','SAN JUAN  DEL PARANA','','Cocinero/a','','douglas','2020-03-10');
insert  into `personas`(`cod_per`,`cod_inst`,`tipo_doc`,`ci_ruc`,`nombre`,`tel`,`email`,`fecha_nac`,`estado`,`ciudad`,`dir`,`geoloc`,`ocupacion`,`tipo`,`usuario`,`fecha_reg`) values (38,26,'CI','5.381.228','ARMINDA QUIROGA BAEZ','993254821','','2020-05-29','Activo','','SAN JUAN  DEL PARANA','','Cocinero/a','','douglas','2020-03-10');
insert  into `personas`(`cod_per`,`cod_inst`,`tipo_doc`,`ci_ruc`,`nombre`,`tel`,`email`,`fecha_nac`,`estado`,`ciudad`,`dir`,`geoloc`,`ocupacion`,`tipo`,`usuario`,`fecha_reg`) values (39,26,'CI','6.805.397','ANTOLINA QUIROGA BAEZ','986222005','','2020-07-02','Activo','','SAN JUAN  DEL PARANA','','Cocinero/a','','douglas','2020-03-10');
insert  into `personas`(`cod_per`,`cod_inst`,`tipo_doc`,`ci_ruc`,`nombre`,`tel`,`email`,`fecha_nac`,`estado`,`ciudad`,`dir`,`geoloc`,`ocupacion`,`tipo`,`usuario`,`fecha_reg`) values (40,27,'CI','3.720.469','BLANCA GONZALEZ','985162620','','2020-12-17','Activo','','GRAL DELGADO','','Cocinero/a','','douglas','2020-03-10');
insert  into `personas`(`cod_per`,`cod_inst`,`tipo_doc`,`ci_ruc`,`nombre`,`tel`,`email`,`fecha_nac`,`estado`,`ciudad`,`dir`,`geoloc`,`ocupacion`,`tipo`,`usuario`,`fecha_reg`) values (41,27,'CI','2.562.656','MARIA BENITEZ AQUINO','981871660','','2020-05-24','Activo','','GRAL DELGADO','','Cocinero/a','','douglas','2020-03-10');
insert  into `personas`(`cod_per`,`cod_inst`,`tipo_doc`,`ci_ruc`,`nombre`,`tel`,`email`,`fecha_nac`,`estado`,`ciudad`,`dir`,`geoloc`,`ocupacion`,`tipo`,`usuario`,`fecha_reg`) values (42,28,'CI','7.099.326','CELIA DUARTE BENITEZ','SIN NUMERO','','2020-01-30','Activo','','TOMAS ROMERO PEREIRA','','Cocinero/a','','douglas','2020-03-10');
insert  into `personas`(`cod_per`,`cod_inst`,`tipo_doc`,`ci_ruc`,`nombre`,`tel`,`email`,`fecha_nac`,`estado`,`ciudad`,`dir`,`geoloc`,`ocupacion`,`tipo`,`usuario`,`fecha_reg`) values (43,29,'CI','5.218.022','DELMIRA BARRETO','986615426','','2020-04-22','Activo','','TOMAS ROMERO PEREIRA','','Cocinero/a','','douglas','2020-03-10');
insert  into `personas`(`cod_per`,`cod_inst`,`tipo_doc`,`ci_ruc`,`nombre`,`tel`,`email`,`fecha_nac`,`estado`,`ciudad`,`dir`,`geoloc`,`ocupacion`,`tipo`,`usuario`,`fecha_reg`) values (44,30,'CI','1.596.901','AGUSTINA FERNANDEZ AMARILLA','985253057','','2020-08-28','Activo','','TOMAS ROMERO PEREIRA','','Cocinero/a','','douglas','2020-03-10');
insert  into `personas`(`cod_per`,`cod_inst`,`tipo_doc`,`ci_ruc`,`nombre`,`tel`,`email`,`fecha_nac`,`estado`,`ciudad`,`dir`,`geoloc`,`ocupacion`,`tipo`,`usuario`,`fecha_reg`) values (45,31,'CI','3.345.642','MIRTA GARCIA GIMENEZ','985407158','','2020-09-11','Activo','','TOMAS ROMERO PEREIRA','','Cocinero/a','','douglas','2020-03-10');
insert  into `personas`(`cod_per`,`cod_inst`,`tipo_doc`,`ci_ruc`,`nombre`,`tel`,`email`,`fecha_nac`,`estado`,`ciudad`,`dir`,`geoloc`,`ocupacion`,`tipo`,`usuario`,`fecha_reg`) values (46,32,'CI','3.233.086','VIVIANA MEZA ALGARIN','985681904','','2020-11-11','Activo','','TOMAS ROMERO PEREIRA','','Cocinero/a','','douglas','2020-03-10');
insert  into `personas`(`cod_per`,`cod_inst`,`tipo_doc`,`ci_ruc`,`nombre`,`tel`,`email`,`fecha_nac`,`estado`,`ciudad`,`dir`,`geoloc`,`ocupacion`,`tipo`,`usuario`,`fecha_reg`) values (47,32,'CI','8.515.919','QUENIA TOLEDO','985330849','','2020-11-16','Activo','','TOMAS ROMERO PEREIRA','','Cocinero/a','','douglas','2020-03-10');
insert  into `personas`(`cod_per`,`cod_inst`,`tipo_doc`,`ci_ruc`,`nombre`,`tel`,`email`,`fecha_nac`,`estado`,`ciudad`,`dir`,`geoloc`,`ocupacion`,`tipo`,`usuario`,`fecha_reg`) values (48,32,'CI','3.330.146','ERMELINDA GOMEZ','985776936','','2020-05-28','Activo','','TOMAS ROMERO PEREIRA','','Cocinero/a','','douglas','2020-03-10');
insert  into `personas`(`cod_per`,`cod_inst`,`tipo_doc`,`ci_ruc`,`nombre`,`tel`,`email`,`fecha_nac`,`estado`,`ciudad`,`dir`,`geoloc`,`ocupacion`,`tipo`,`usuario`,`fecha_reg`) values (49,32,'CI','856.053','JULIA BAEZ ESCOBAR','985499546','','2020-12-21','Activo','','TOMAS ROMERO PEREIRA','','Cocinero/a','','douglas','2020-03-10');
insert  into `personas`(`cod_per`,`cod_inst`,`tipo_doc`,`ci_ruc`,`nombre`,`tel`,`email`,`fecha_nac`,`estado`,`ciudad`,`dir`,`geoloc`,`ocupacion`,`tipo`,`usuario`,`fecha_reg`) values (50,33,'CI','3.949.188','LUZ RUIZ DIAZ','984281590','','2020-10-18','Activo','','TOMAS ROMERO PEREIRA','','Cocinero/a','','douglas','2020-03-10');
insert  into `personas`(`cod_per`,`cod_inst`,`tipo_doc`,`ci_ruc`,`nombre`,`tel`,`email`,`fecha_nac`,`estado`,`ciudad`,`dir`,`geoloc`,`ocupacion`,`tipo`,`usuario`,`fecha_reg`) values (51,33,'CI','4.115.422','JOVINA GALEANO','984281530','','2020-04-23','Activo','','TOMAS ROMERO PEREIRA','','Cocinero/a','','douglas','2020-03-10');
insert  into `personas`(`cod_per`,`cod_inst`,`tipo_doc`,`ci_ruc`,`nombre`,`tel`,`email`,`fecha_nac`,`estado`,`ciudad`,`dir`,`geoloc`,`ocupacion`,`tipo`,`usuario`,`fecha_reg`) values (52,35,'CI','4.876.147','ALICIA RUIZ SILVA','SIN NUMERO','','2020-09-22','Activo','','TOMAS ROMERO PEREIRA','','Cocinero/a','','douglas','2020-03-10');
insert  into `personas`(`cod_per`,`cod_inst`,`tipo_doc`,`ci_ruc`,`nombre`,`tel`,`email`,`fecha_nac`,`estado`,`ciudad`,`dir`,`geoloc`,`ocupacion`,`tipo`,`usuario`,`fecha_reg`) values (53,35,'CI','4.406.847','FIDELINA CACERES MELGAREJO','985328078','','2020-11-16','Activo','','TOMAS ROMERO PEREIRA','','Cocinero/a','','douglas','2020-03-10');
insert  into `personas`(`cod_per`,`cod_inst`,`tipo_doc`,`ci_ruc`,`nombre`,`tel`,`email`,`fecha_nac`,`estado`,`ciudad`,`dir`,`geoloc`,`ocupacion`,`tipo`,`usuario`,`fecha_reg`) values (54,36,'CI','2.857.622','LIDIA DOMINGUEZ CHAMORRO','985951818','','2020-07-30','Activo','','CARLOS A LOPEZ','','Cocinero/a','','douglas','2020-03-10');
insert  into `personas`(`cod_per`,`cod_inst`,`tipo_doc`,`ci_ruc`,`nombre`,`tel`,`email`,`fecha_nac`,`estado`,`ciudad`,`dir`,`geoloc`,`ocupacion`,`tipo`,`usuario`,`fecha_reg`) values (55,36,'CI','3.580.889','ROSALIA CA?ETE','975668969','','2020-09-07','Activo','','CARLOS A LOPEZ','','Cocinero/a','','douglas','2020-03-10');
insert  into `personas`(`cod_per`,`cod_inst`,`tipo_doc`,`ci_ruc`,`nombre`,`tel`,`email`,`fecha_nac`,`estado`,`ciudad`,`dir`,`geoloc`,`ocupacion`,`tipo`,`usuario`,`fecha_reg`) values (56,36,'CI','2.699.812','VENERIA SAINGER AQUINO','983569493','','2020-11-14','Activo','','CARLOS A LOPEZ','','Cocinero/a','','douglas','2020-03-10');
insert  into `personas`(`cod_per`,`cod_inst`,`tipo_doc`,`ci_ruc`,`nombre`,`tel`,`email`,`fecha_nac`,`estado`,`ciudad`,`dir`,`geoloc`,`ocupacion`,`tipo`,`usuario`,`fecha_reg`) values (57,37,'CI','5.115.108','GLASIS MARTINEZ BAEZ','983942275','','2020-01-11','Activo','','CARLOS A LOPEZ','','Cocinero/a','','douglas','2020-03-10');
insert  into `personas`(`cod_per`,`cod_inst`,`tipo_doc`,`ci_ruc`,`nombre`,`tel`,`email`,`fecha_nac`,`estado`,`ciudad`,`dir`,`geoloc`,`ocupacion`,`tipo`,`usuario`,`fecha_reg`) values (58,38,'CI','5.221.485','JUANA ACOSTA MENDEZ','986569003','','2020-06-24','Activo','','MAYOR OTA?O','','Cocinero/a','','douglas','2020-03-10');
insert  into `personas`(`cod_per`,`cod_inst`,`tipo_doc`,`ci_ruc`,`nombre`,`tel`,`email`,`fecha_nac`,`estado`,`ciudad`,`dir`,`geoloc`,`ocupacion`,`tipo`,`usuario`,`fecha_reg`) values (59,39,'CI','3.655.085','MARCIANA LOPEZ','983515840','','2020-06-30','Activo','','MAYOR OTA?O','','Cocinero/a','','douglas','2020-03-10');
insert  into `personas`(`cod_per`,`cod_inst`,`tipo_doc`,`ci_ruc`,`nombre`,`tel`,`email`,`fecha_nac`,`estado`,`ciudad`,`dir`,`geoloc`,`ocupacion`,`tipo`,`usuario`,`fecha_reg`) values (60,40,'CI','5.905.095','SEGUNDA BUSTAMANTE','982468537','','2020-06-01','Activo','','MAYOR OTA?O','','Cocinero/a','','douglas','2020-03-10');
insert  into `personas`(`cod_per`,`cod_inst`,`tipo_doc`,`ci_ruc`,`nombre`,`tel`,`email`,`fecha_nac`,`estado`,`ciudad`,`dir`,`geoloc`,`ocupacion`,`tipo`,`usuario`,`fecha_reg`) values (61,40,'CI','2.990.046','ELVA BAEZ  IRALA','984882022','','2020-11-07','Activo','','MAYOR OTA?O','','Cocinero/a','','douglas','2020-03-10');
insert  into `personas`(`cod_per`,`cod_inst`,`tipo_doc`,`ci_ruc`,`nombre`,`tel`,`email`,`fecha_nac`,`estado`,`ciudad`,`dir`,`geoloc`,`ocupacion`,`tipo`,`usuario`,`fecha_reg`) values (62,41,'CI','7.398.151','SONIA BENITEZ','983736505','','2020-01-08','Activo','','ALTO VERA','','Cocinero/a','','douglas','2020-03-10');
insert  into `personas`(`cod_per`,`cod_inst`,`tipo_doc`,`ci_ruc`,`nombre`,`tel`,`email`,`fecha_nac`,`estado`,`ciudad`,`dir`,`geoloc`,`ocupacion`,`tipo`,`usuario`,`fecha_reg`) values (63,41,'CI','3.260.004','ALBA GONZALEZ','984711385','','2020-09-23','Activo','','ALTO VERA','','Cocinero/a','','douglas','2020-03-10');
insert  into `personas`(`cod_per`,`cod_inst`,`tipo_doc`,`ci_ruc`,`nombre`,`tel`,`email`,`fecha_nac`,`estado`,`ciudad`,`dir`,`geoloc`,`ocupacion`,`tipo`,`usuario`,`fecha_reg`) values (64,42,'CI','5.461.877','DORA VERA','984130698','','2020-02-13','Activo','','ALTO VERA','','Cocinero/a','','douglas','2020-03-10');
insert  into `personas`(`cod_per`,`cod_inst`,`tipo_doc`,`ci_ruc`,`nombre`,`tel`,`email`,`fecha_nac`,`estado`,`ciudad`,`dir`,`geoloc`,`ocupacion`,`tipo`,`usuario`,`fecha_reg`) values (65,43,'CI','6.345.436','RAMONA ACOSTA','985199810','','2020-02-26','Activo','','ALTO VERA','','Cocinero/a','','douglas','2020-03-10');
insert  into `personas`(`cod_per`,`cod_inst`,`tipo_doc`,`ci_ruc`,`nombre`,`tel`,`email`,`fecha_nac`,`estado`,`ciudad`,`dir`,`geoloc`,`ocupacion`,`tipo`,`usuario`,`fecha_reg`) values (66,44,'CI','1.797.874','MAXIMA GARCIA','984593795','','2020-10-01','Activo','','ALTO VERA','','Cocinero/a','','douglas','2020-03-10');
insert  into `personas`(`cod_per`,`cod_inst`,`tipo_doc`,`ci_ruc`,`nombre`,`tel`,`email`,`fecha_nac`,`estado`,`ciudad`,`dir`,`geoloc`,`ocupacion`,`tipo`,`usuario`,`fecha_reg`) values (67,45,'CI','4.983.793','REINALDA MEDEINA','986923343','','2020-07-13','Activo','','ALTO VERA','','Cocinero/a','','douglas','2020-03-10');
insert  into `personas`(`cod_per`,`cod_inst`,`tipo_doc`,`ci_ruc`,`nombre`,`tel`,`email`,`fecha_nac`,`estado`,`ciudad`,`dir`,`geoloc`,`ocupacion`,`tipo`,`usuario`,`fecha_reg`) values (68,46,'CI','6.139.637','SIRLEY MIRANDA','986401001','','2020-03-17','Activo','','ALTO VERA','','Cocinero/a','','douglas','2020-03-10');
insert  into `personas`(`cod_per`,`cod_inst`,`tipo_doc`,`ci_ruc`,`nombre`,`tel`,`email`,`fecha_nac`,`estado`,`ciudad`,`dir`,`geoloc`,`ocupacion`,`tipo`,`usuario`,`fecha_reg`) values (69,47,'CI','3.961.522','ILDA GONZALEZ','983749034','','2020-07-08','Activo','','ALTO VERA','','Cocinero/a','','douglas','2020-03-10');
insert  into `personas`(`cod_per`,`cod_inst`,`tipo_doc`,`ci_ruc`,`nombre`,`tel`,`email`,`fecha_nac`,`estado`,`ciudad`,`dir`,`geoloc`,`ocupacion`,`tipo`,`usuario`,`fecha_reg`) values (70,48,'CI','6.811.045','ROSSANA ARRIOLA','983898349','','2020-06-19','Activo','','ALTO VERA','','Cocinero/a','','douglas','2020-03-10');
insert  into `personas`(`cod_per`,`cod_inst`,`tipo_doc`,`ci_ruc`,`nombre`,`tel`,`email`,`fecha_nac`,`estado`,`ciudad`,`dir`,`geoloc`,`ocupacion`,`tipo`,`usuario`,`fecha_reg`) values (71,49,'CI','2.411.918','CAROLINA GONZALEZ','985889105','','2020-03-08','Activo','','ALTO VERA','','Cocinero/a','','douglas','2020-03-10');
insert  into `personas`(`cod_per`,`cod_inst`,`tipo_doc`,`ci_ruc`,`nombre`,`tel`,`email`,`fecha_nac`,`estado`,`ciudad`,`dir`,`geoloc`,`ocupacion`,`tipo`,`usuario`,`fecha_reg`) values (72,49,'CI','4.219.636','MARIA BRITEZ','985323817','','2020-10-23','Activo','','ALTO VERA','','Cocinero/a','','douglas','2020-03-10');
insert  into `personas`(`cod_per`,`cod_inst`,`tipo_doc`,`ci_ruc`,`nombre`,`tel`,`email`,`fecha_nac`,`estado`,`ciudad`,`dir`,`geoloc`,`ocupacion`,`tipo`,`usuario`,`fecha_reg`) values (73,50,'CI','1.939.995','BASILIA GALEANO','986279116','','2020-01-09','Activo','','ALTO VERA','','Cocinero/a','','douglas','2020-03-10');
insert  into `personas`(`cod_per`,`cod_inst`,`tipo_doc`,`ci_ruc`,`nombre`,`tel`,`email`,`fecha_nac`,`estado`,`ciudad`,`dir`,`geoloc`,`ocupacion`,`tipo`,`usuario`,`fecha_reg`) values (74,51,'CI','6.104.627','MARIA GONZALEZ','981255100','','2020-01-02','Activo','','ITAPUA POTY','','Cocinero/a','','douglas','2020-03-10');
insert  into `personas`(`cod_per`,`cod_inst`,`tipo_doc`,`ci_ruc`,`nombre`,`tel`,`email`,`fecha_nac`,`estado`,`ciudad`,`dir`,`geoloc`,`ocupacion`,`tipo`,`usuario`,`fecha_reg`) values (75,52,'CI','5.452.912','VICTORIA SOSA','SIN NUMERO','','2020-03-19','Activo','','ITAPUA POTY','','Cocinero/a','','douglas','2020-03-10');
insert  into `personas`(`cod_per`,`cod_inst`,`tipo_doc`,`ci_ruc`,`nombre`,`tel`,`email`,`fecha_nac`,`estado`,`ciudad`,`dir`,`geoloc`,`ocupacion`,`tipo`,`usuario`,`fecha_reg`) values (76,53,'CI','1.082.077','MARCELINA FLORES','986115747','','2020-06-05','Activo','','ITAPUA POTY','','Cocinero/a','','douglas','2020-03-10');
insert  into `personas`(`cod_per`,`cod_inst`,`tipo_doc`,`ci_ruc`,`nombre`,`tel`,`email`,`fecha_nac`,`estado`,`ciudad`,`dir`,`geoloc`,`ocupacion`,`tipo`,`usuario`,`fecha_reg`) values (77,53,'CI','6.734.322','MARIA CENTURION','983369469','','2020-05-24','Activo','','ITAPUA POTY','','Cocinero/a','','douglas','2020-03-10');
insert  into `personas`(`cod_per`,`cod_inst`,`tipo_doc`,`ci_ruc`,`nombre`,`tel`,`email`,`fecha_nac`,`estado`,`ciudad`,`dir`,`geoloc`,`ocupacion`,`tipo`,`usuario`,`fecha_reg`) values (78,54,'CI','4.165.924','SONIA SOTELO','981202951','','2020-10-27','Activo','','ITAPUA POTY','','Cocinero/a','','douglas','2020-03-10');
insert  into `personas`(`cod_per`,`cod_inst`,`tipo_doc`,`ci_ruc`,`nombre`,`tel`,`email`,`fecha_nac`,`estado`,`ciudad`,`dir`,`geoloc`,`ocupacion`,`tipo`,`usuario`,`fecha_reg`) values (79,55,'CI','3.566.380','MIRIAN ESTELA FRUTOS','984256784','','2020-06-30','Activo','','ITAPUA POTY','','Cocinero/a','','douglas','2020-03-10');
insert  into `personas`(`cod_per`,`cod_inst`,`tipo_doc`,`ci_ruc`,`nombre`,`tel`,`email`,`fecha_nac`,`estado`,`ciudad`,`dir`,`geoloc`,`ocupacion`,`tipo`,`usuario`,`fecha_reg`) values (80,56,'CI','3.364.624','NANCY BRUNAGA','985123430','','2020-10-14','Activo','','ITAPUA POTY','','Cocinero/a','','douglas','2020-03-10');
insert  into `personas`(`cod_per`,`cod_inst`,`tipo_doc`,`ci_ruc`,`nombre`,`tel`,`email`,`fecha_nac`,`estado`,`ciudad`,`dir`,`geoloc`,`ocupacion`,`tipo`,`usuario`,`fecha_reg`) values (81,56,'CI','5.103.908','ALICIA ROLON','984906057','','2020-08-03','Activo','','ITAPUA POTY','','Cocinero/a','','douglas','2020-03-10');
insert  into `personas`(`cod_per`,`cod_inst`,`tipo_doc`,`ci_ruc`,`nombre`,`tel`,`email`,`fecha_nac`,`estado`,`ciudad`,`dir`,`geoloc`,`ocupacion`,`tipo`,`usuario`,`fecha_reg`) values (82,57,'CI','7.158.130','VILMA LUNA BRUNAGA','985250911','','2020-01-21','Activo','','EDELIRA','','Cocinero/a','','douglas','2020-03-10');
insert  into `personas`(`cod_per`,`cod_inst`,`tipo_doc`,`ci_ruc`,`nombre`,`tel`,`email`,`fecha_nac`,`estado`,`ciudad`,`dir`,`geoloc`,`ocupacion`,`tipo`,`usuario`,`fecha_reg`) values (83,58,'CI','2.892.618','GLADYS RAMIREZ','SIN NUMERO','','2020-08-24','Activo','','EDELIRA','','Cocinero/a','','douglas','2020-03-10');
insert  into `personas`(`cod_per`,`cod_inst`,`tipo_doc`,`ci_ruc`,`nombre`,`tel`,`email`,`fecha_nac`,`estado`,`ciudad`,`dir`,`geoloc`,`ocupacion`,`tipo`,`usuario`,`fecha_reg`) values (84,58,'CI','5.735.663','LOURDES RAMIREZ','985562737','','2020-09-05','Activo','','EDELIRA','','Cocinero/a','','douglas','2020-03-10');
insert  into `personas`(`cod_per`,`cod_inst`,`tipo_doc`,`ci_ruc`,`nombre`,`tel`,`email`,`fecha_nac`,`estado`,`ciudad`,`dir`,`geoloc`,`ocupacion`,`tipo`,`usuario`,`fecha_reg`) values (85,58,'CI','3.301.868','GLADYS RODAS','982177016','','2020-09-17','Activo','','EDELIRA','','Cocinero/a','','douglas','2020-03-10');
insert  into `personas`(`cod_per`,`cod_inst`,`tipo_doc`,`ci_ruc`,`nombre`,`tel`,`email`,`fecha_nac`,`estado`,`ciudad`,`dir`,`geoloc`,`ocupacion`,`tipo`,`usuario`,`fecha_reg`) values (86,60,'CI','2.994.498','ESTELA KUNGER','983163309','','2020-09-29','Activo','','EDELIRA','','Cocinero/a','','douglas','2020-03-10');
insert  into `personas`(`cod_per`,`cod_inst`,`tipo_doc`,`ci_ruc`,`nombre`,`tel`,`email`,`fecha_nac`,`estado`,`ciudad`,`dir`,`geoloc`,`ocupacion`,`tipo`,`usuario`,`fecha_reg`) values (87,61,'CI','3.712.625','GRACIELA GODOY','985507332','','2020-03-28','Activo','','EDELIRA','','Cocinero/a','','douglas','2020-03-10');
insert  into `personas`(`cod_per`,`cod_inst`,`tipo_doc`,`ci_ruc`,`nombre`,`tel`,`email`,`fecha_nac`,`estado`,`ciudad`,`dir`,`geoloc`,`ocupacion`,`tipo`,`usuario`,`fecha_reg`) values (88,62,'CI','5.376.850','NINFA RAQUEL FERREIRA','986526948','','2020-05-23','Activo','','EDELIRA','','Cocinero/a','','douglas','2020-03-10');
insert  into `personas`(`cod_per`,`cod_inst`,`tipo_doc`,`ci_ruc`,`nombre`,`tel`,`email`,`fecha_nac`,`estado`,`ciudad`,`dir`,`geoloc`,`ocupacion`,`tipo`,`usuario`,`fecha_reg`) values (89,62,'CI','3.934.989','RAMONA FRETES','982482339','','2020-11-22','Activo','','EDELIRA','','Cocinero/a','','douglas','2020-03-10');
insert  into `personas`(`cod_per`,`cod_inst`,`tipo_doc`,`ci_ruc`,`nombre`,`tel`,`email`,`fecha_nac`,`estado`,`ciudad`,`dir`,`geoloc`,`ocupacion`,`tipo`,`usuario`,`fecha_reg`) values (90,62,'CI','5.191.830','BLANCA FERNANDEZ','983522855','','2020-08-26','Activo','','EDELIRA','','Cocinero/a','','douglas','2020-03-10');
insert  into `personas`(`cod_per`,`cod_inst`,`tipo_doc`,`ci_ruc`,`nombre`,`tel`,`email`,`fecha_nac`,`estado`,`ciudad`,`dir`,`geoloc`,`ocupacion`,`tipo`,`usuario`,`fecha_reg`) values (91,63,'CI','3.295.800','PERLA GROSELLE DAVALOS','982969233','','2020-07-02','Activo','','EDELIRA','','Cocinero/a','','douglas','2020-03-10');
insert  into `personas`(`cod_per`,`cod_inst`,`tipo_doc`,`ci_ruc`,`nombre`,`tel`,`email`,`fecha_nac`,`estado`,`ciudad`,`dir`,`geoloc`,`ocupacion`,`tipo`,`usuario`,`fecha_reg`) values (92,63,'CI','5.363.429','CATALINA VAZQUEZ','SIN NUMERO','','2020-06-06','Activo','','EDELIRA','','Cocinero/a','','douglas','2020-03-10');
insert  into `personas`(`cod_per`,`cod_inst`,`tipo_doc`,`ci_ruc`,`nombre`,`tel`,`email`,`fecha_nac`,`estado`,`ciudad`,`dir`,`geoloc`,`ocupacion`,`tipo`,`usuario`,`fecha_reg`) values (93,64,'CI','3.962.925','HILDA FERREIRA','986534671','','2020-03-31','Activo','','NATALIO','','Cocinero/a','','douglas','2020-03-10');
insert  into `personas`(`cod_per`,`cod_inst`,`tipo_doc`,`ci_ruc`,`nombre`,`tel`,`email`,`fecha_nac`,`estado`,`ciudad`,`dir`,`geoloc`,`ocupacion`,`tipo`,`usuario`,`fecha_reg`) values (94,65,'CI','5.469.790','BEATRIZ GAONA','984973146','','2020-01-18','Activo','','NATALIO','','Cocinero/a','','douglas','2020-03-10');
insert  into `personas`(`cod_per`,`cod_inst`,`tipo_doc`,`ci_ruc`,`nombre`,`tel`,`email`,`fecha_nac`,`estado`,`ciudad`,`dir`,`geoloc`,`ocupacion`,`tipo`,`usuario`,`fecha_reg`) values (95,65,'CI','896.720','MARIA DEL CARMEN GIMENEZ','985160917','','2020-08-14','Activo','','NATALIO','','Cocinero/a','','douglas','2020-03-10');
insert  into `personas`(`cod_per`,`cod_inst`,`tipo_doc`,`ci_ruc`,`nombre`,`tel`,`email`,`fecha_nac`,`estado`,`ciudad`,`dir`,`geoloc`,`ocupacion`,`tipo`,`usuario`,`fecha_reg`) values (96,66,'CI','4.740.522','NORMA AYALA','983967155','','2020-05-18','Activo','','NATALIO','','Cocinero/a','','douglas','2020-03-10');
insert  into `personas`(`cod_per`,`cod_inst`,`tipo_doc`,`ci_ruc`,`nombre`,`tel`,`email`,`fecha_nac`,`estado`,`ciudad`,`dir`,`geoloc`,`ocupacion`,`tipo`,`usuario`,`fecha_reg`) values (97,66,'CI','2.998.936','ESTANISLAA ROJAS','984485890','','2020-11-13','Activo','','NATALIO','','Cocinero/a','','douglas','2020-03-10');
insert  into `personas`(`cod_per`,`cod_inst`,`tipo_doc`,`ci_ruc`,`nombre`,`tel`,`email`,`fecha_nac`,`estado`,`ciudad`,`dir`,`geoloc`,`ocupacion`,`tipo`,`usuario`,`fecha_reg`) values (98,66,'CI','1.865.153','ROSA MOREL','986494849','','2020-04-15','Activo','','NATALIO','','Cocinero/a','','douglas','2020-03-10');
insert  into `personas`(`cod_per`,`cod_inst`,`tipo_doc`,`ci_ruc`,`nombre`,`tel`,`email`,`fecha_nac`,`estado`,`ciudad`,`dir`,`geoloc`,`ocupacion`,`tipo`,`usuario`,`fecha_reg`) values (99,67,'CI','5.852.039','GIDA AYALA','986826332','','2020-09-01','Activo','','TRINIDAD','','Cocinero/a','','douglas','2020-03-10');
insert  into `personas`(`cod_per`,`cod_inst`,`tipo_doc`,`ci_ruc`,`nombre`,`tel`,`email`,`fecha_nac`,`estado`,`ciudad`,`dir`,`geoloc`,`ocupacion`,`tipo`,`usuario`,`fecha_reg`) values (100,67,'CI','7.326.108','MARGARITA BENITEZ','982815618','','2020-08-23','Activo','','TRINIDAD','','Cocinero/a','','douglas','2020-03-10');
insert  into `personas`(`cod_per`,`cod_inst`,`tipo_doc`,`ci_ruc`,`nombre`,`tel`,`email`,`fecha_nac`,`estado`,`ciudad`,`dir`,`geoloc`,`ocupacion`,`tipo`,`usuario`,`fecha_reg`) values (101,68,'CI','5.140.426','FATIMA SOSA','983275605','','2020-11-01','Activo','','TRINIDAD','','Cocinero/a','','douglas','2020-03-10');
insert  into `personas`(`cod_per`,`cod_inst`,`tipo_doc`,`ci_ruc`,`nombre`,`tel`,`email`,`fecha_nac`,`estado`,`ciudad`,`dir`,`geoloc`,`ocupacion`,`tipo`,`usuario`,`fecha_reg`) values (102,68,'CI','2.362.152','CARMEN GUTIERREZ','983153500','','2020-09-01','Activo','','TRINIDAD','','Cocinero/a','','douglas','2020-03-10');
insert  into `personas`(`cod_per`,`cod_inst`,`tipo_doc`,`ci_ruc`,`nombre`,`tel`,`email`,`fecha_nac`,`estado`,`ciudad`,`dir`,`geoloc`,`ocupacion`,`tipo`,`usuario`,`fecha_reg`) values (103,68,'CI','13.005.912','NORMA QUINTANA','985921195','','2020-12-21','Activo','','TRINIDAD','','Cocinero/a','','douglas','2020-03-10');
insert  into `personas`(`cod_per`,`cod_inst`,`tipo_doc`,`ci_ruc`,`nombre`,`tel`,`email`,`fecha_nac`,`estado`,`ciudad`,`dir`,`geoloc`,`ocupacion`,`tipo`,`usuario`,`fecha_reg`) values (104,67,'CI','3.576.672','CELSA SILVA','985252846','','2020-10-28','Activo','','NUEVA ALBORADA','','Cocinero/a','','douglas','2020-03-10');
insert  into `personas`(`cod_per`,`cod_inst`,`tipo_doc`,`ci_ruc`,`nombre`,`tel`,`email`,`fecha_nac`,`estado`,`ciudad`,`dir`,`geoloc`,`ocupacion`,`tipo`,`usuario`,`fecha_reg`) values (105,67,'CI','1.940.437','DEMESIA DOMINGUEZ','985252846','','2020-09-18','Activo','','NUEVA ALBORADA','','Cocinero/a','','douglas','2020-03-10');
insert  into `personas`(`cod_per`,`cod_inst`,`tipo_doc`,`ci_ruc`,`nombre`,`tel`,`email`,`fecha_nac`,`estado`,`ciudad`,`dir`,`geoloc`,`ocupacion`,`tipo`,`usuario`,`fecha_reg`) values (106,70,'CI','1.928.403','LIDIA RAMIREZ','985325500','','2020-03-14','Activo','','NUEVA ALBORADA','','Cocinero/a','','douglas','2020-03-10');
insert  into `personas`(`cod_per`,`cod_inst`,`tipo_doc`,`ci_ruc`,`nombre`,`tel`,`email`,`fecha_nac`,`estado`,`ciudad`,`dir`,`geoloc`,`ocupacion`,`tipo`,`usuario`,`fecha_reg`) values (107,71,'CI','4.488.283','ELBA VAZQUEZ','982465937','','2020-01-25','Activo','','NUEVA ALBORADA','','Cocinero/a','','douglas','2020-03-10');
insert  into `personas`(`cod_per`,`cod_inst`,`tipo_doc`,`ci_ruc`,`nombre`,`tel`,`email`,`fecha_nac`,`estado`,`ciudad`,`dir`,`geoloc`,`ocupacion`,`tipo`,`usuario`,`fecha_reg`) values (108,71,'CI','3.685.291','CAROLINA DUARTE','983218000','','2020-03-23','Activo','','ENCARNACION','','Cocinero/a','','douglas','2020-03-10');
insert  into `personas`(`cod_per`,`cod_inst`,`tipo_doc`,`ci_ruc`,`nombre`,`tel`,`email`,`fecha_nac`,`estado`,`ciudad`,`dir`,`geoloc`,`ocupacion`,`tipo`,`usuario`,`fecha_reg`) values (109,71,'CI','3.400.166','NANCI MEZA BORJA','985749163','','2020-10-20','Activo','','ENCARNACION','','Cocinero/a','','douglas','2020-03-10');
insert  into `personas`(`cod_per`,`cod_inst`,`tipo_doc`,`ci_ruc`,`nombre`,`tel`,`email`,`fecha_nac`,`estado`,`ciudad`,`dir`,`geoloc`,`ocupacion`,`tipo`,`usuario`,`fecha_reg`) values (110,73,'CI','4.279.236','QOIKONI PAMELA MERELES','','','2020-02-16','Activo','','ENCARNACION','','Cocinero/a','','douglas','2020-03-10');
insert  into `personas`(`cod_per`,`cod_inst`,`tipo_doc`,`ci_ruc`,`nombre`,`tel`,`email`,`fecha_nac`,`estado`,`ciudad`,`dir`,`geoloc`,`ocupacion`,`tipo`,`usuario`,`fecha_reg`) values (111,74,'CI','6.055.577','VERONICA ALGARIN','984301141','','2020-03-12','Activo','','ENCARNACION','','Cocinero/a','','douglas','2020-03-10');
insert  into `personas`(`cod_per`,`cod_inst`,`tipo_doc`,`ci_ruc`,`nombre`,`tel`,`email`,`fecha_nac`,`estado`,`ciudad`,`dir`,`geoloc`,`ocupacion`,`tipo`,`usuario`,`fecha_reg`) values (112,74,'CI','4.226.028','EVELIA MARTINEZ','985132845','','2020-03-11','Activo','','ENCARNACION','','Cocinero/a','','douglas','2020-03-10');
insert  into `personas`(`cod_per`,`cod_inst`,`tipo_doc`,`ci_ruc`,`nombre`,`tel`,`email`,`fecha_nac`,`estado`,`ciudad`,`dir`,`geoloc`,`ocupacion`,`tipo`,`usuario`,`fecha_reg`) values (113,74,'CI','3.434.528','MIRTA CASTILLO','992988911','','2020-05-29','Activo','','ENCARNACION','','Cocinero/a','','douglas','2020-03-10');
insert  into `personas`(`cod_per`,`cod_inst`,`tipo_doc`,`ci_ruc`,`nombre`,`tel`,`email`,`fecha_nac`,`estado`,`ciudad`,`dir`,`geoloc`,`ocupacion`,`tipo`,`usuario`,`fecha_reg`) values (114,75,'CI','3.256.862','MARIA ALVEZ','982459930','','2020-01-07','Activo','','ENCARNACION','','Cocinero/a','','douglas','2020-03-10');
insert  into `personas`(`cod_per`,`cod_inst`,`tipo_doc`,`ci_ruc`,`nombre`,`tel`,`email`,`fecha_nac`,`estado`,`ciudad`,`dir`,`geoloc`,`ocupacion`,`tipo`,`usuario`,`fecha_reg`) values (115,75,'CI','3.802.387','GLORIA CABRAL','981717557','','2020-12-30','Activo','','ENCARNACION','','Cocinero/a','','douglas','2020-03-10');
insert  into `personas`(`cod_per`,`cod_inst`,`tipo_doc`,`ci_ruc`,`nombre`,`tel`,`email`,`fecha_nac`,`estado`,`ciudad`,`dir`,`geoloc`,`ocupacion`,`tipo`,`usuario`,`fecha_reg`) values (116,75,'CI','3.909.558','HILDA MARTINEZ','986718147','','2020-03-06','Activo','','ENCARNACION','','Cocinero/a','','douglas','2020-03-10');
insert  into `personas`(`cod_per`,`cod_inst`,`tipo_doc`,`ci_ruc`,`nombre`,`tel`,`email`,`fecha_nac`,`estado`,`ciudad`,`dir`,`geoloc`,`ocupacion`,`tipo`,`usuario`,`fecha_reg`) values (117,75,'CI','5.974.280','EDIL ACU?A','985607018','','2020-04-01','Activo','','ENCARNACION','','Cocinero/a','','douglas','2020-03-10');
insert  into `personas`(`cod_per`,`cod_inst`,`tipo_doc`,`ci_ruc`,`nombre`,`tel`,`email`,`fecha_nac`,`estado`,`ciudad`,`dir`,`geoloc`,`ocupacion`,`tipo`,`usuario`,`fecha_reg`) values (118,76,'CI','5.051.242','IRMA CACERES','985726003','','2020-05-27','Activo','','ENCARNACION','','Cocinero/a','','douglas','2020-03-10');
insert  into `personas`(`cod_per`,`cod_inst`,`tipo_doc`,`ci_ruc`,`nombre`,`tel`,`email`,`fecha_nac`,`estado`,`ciudad`,`dir`,`geoloc`,`ocupacion`,`tipo`,`usuario`,`fecha_reg`) values (119,76,'CI','3.330.219','MERCEDES SALINAS','983220823','','2020-09-24','Activo','','ENCARNACION','','Cocinero/a','','douglas','2020-03-10');
insert  into `personas`(`cod_per`,`cod_inst`,`tipo_doc`,`ci_ruc`,`nombre`,`tel`,`email`,`fecha_nac`,`estado`,`ciudad`,`dir`,`geoloc`,`ocupacion`,`tipo`,`usuario`,`fecha_reg`) values (120,76,'CI','1.498.889','JACINTA VEGA','993310054','','2020-11-28','Activo','','ENCARNACION','','Cocinero/a','','douglas','2020-03-10');
insert  into `personas`(`cod_per`,`cod_inst`,`tipo_doc`,`ci_ruc`,`nombre`,`tel`,`email`,`fecha_nac`,`estado`,`ciudad`,`dir`,`geoloc`,`ocupacion`,`tipo`,`usuario`,`fecha_reg`) values (121,76,'CI','4.091.827','EDUVIGIS FERNANDEZ','981835772','','2020-10-16','Activo','','ENCARNACION','','Cocinero/a','','douglas','2020-03-10');
insert  into `personas`(`cod_per`,`cod_inst`,`tipo_doc`,`ci_ruc`,`nombre`,`tel`,`email`,`fecha_nac`,`estado`,`ciudad`,`dir`,`geoloc`,`ocupacion`,`tipo`,`usuario`,`fecha_reg`) values (122,77,'CI','531.347','GLADYS BOGADO','','','2020-02-25','Activo','','CNEL BOGADO','','Cocinero/a','','douglas','2020-03-10');
insert  into `personas`(`cod_per`,`cod_inst`,`tipo_doc`,`ci_ruc`,`nombre`,`tel`,`email`,`fecha_nac`,`estado`,`ciudad`,`dir`,`geoloc`,`ocupacion`,`tipo`,`usuario`,`fecha_reg`) values (123,77,'CI','1.597.526','MARIA BOGADO','986419936','','2020-03-29','Activo','','CNEL BOGADO','','Cocinero/a','','douglas','2020-03-10');
insert  into `personas`(`cod_per`,`cod_inst`,`tipo_doc`,`ci_ruc`,`nombre`,`tel`,`email`,`fecha_nac`,`estado`,`ciudad`,`dir`,`geoloc`,`ocupacion`,`tipo`,`usuario`,`fecha_reg`) values (124,77,'CI','5.146.938','ALICE CUBA','','','2020-02-04','Activo','','CNEL BOGADO','','Cocinero/a','','douglas','2020-03-10');
insert  into `personas`(`cod_per`,`cod_inst`,`tipo_doc`,`ci_ruc`,`nombre`,`tel`,`email`,`fecha_nac`,`estado`,`ciudad`,`dir`,`geoloc`,`ocupacion`,`tipo`,`usuario`,`fecha_reg`) values (125,78,'CI','7.728.323','MICAELA FRANCO','971336284','','2020-05-20','Activo','','CNEL BOGADO','','Cocinero/a','','douglas','2020-03-10');
insert  into `personas`(`cod_per`,`cod_inst`,`tipo_doc`,`ci_ruc`,`nombre`,`tel`,`email`,`fecha_nac`,`estado`,`ciudad`,`dir`,`geoloc`,`ocupacion`,`tipo`,`usuario`,`fecha_reg`) values (126,78,'CI','2.404.540','MARIA ARANDA','985203319','','2020-01-01','Activo','','CNEL BOGADO','','Cocinero/a','','douglas','2020-03-10');
insert  into `personas`(`cod_per`,`cod_inst`,`tipo_doc`,`ci_ruc`,`nombre`,`tel`,`email`,`fecha_nac`,`estado`,`ciudad`,`dir`,`geoloc`,`ocupacion`,`tipo`,`usuario`,`fecha_reg`) values (127,79,'CI','3.960.397','FATIMA CARDOZO','973116413','','2020-05-08','Activo','','CAPITAN MIRANDA','','Cocinero/a','','douglas','2020-03-10');
insert  into `personas`(`cod_per`,`cod_inst`,`tipo_doc`,`ci_ruc`,`nombre`,`tel`,`email`,`fecha_nac`,`estado`,`ciudad`,`dir`,`geoloc`,`ocupacion`,`tipo`,`usuario`,`fecha_reg`) values (128,79,'CI','3.626.152','EMI MARTINEZ','983577963','','2020-03-09','Activo','','CAPITAN MIRANDA','','Cocinero/a','','douglas','2020-03-10');
insert  into `personas`(`cod_per`,`cod_inst`,`tipo_doc`,`ci_ruc`,`nombre`,`tel`,`email`,`fecha_nac`,`estado`,`ciudad`,`dir`,`geoloc`,`ocupacion`,`tipo`,`usuario`,`fecha_reg`) values (129,79,'CI','3.021.267','MARIA VASTIQUE','984354038','','2020-08-29','Activo','','CAPITAN MIRANDA','','Cocinero/a','','douglas','2020-03-10');
insert  into `personas`(`cod_per`,`cod_inst`,`tipo_doc`,`ci_ruc`,`nombre`,`tel`,`email`,`fecha_nac`,`estado`,`ciudad`,`dir`,`geoloc`,`ocupacion`,`tipo`,`usuario`,`fecha_reg`) values (130,80,'CI','5.027.481','WILMA CARDOZO','986530428','','2020-11-23','Activo','','CAMBYRETA','','Cocinero/a','','douglas','2020-03-10');
insert  into `personas`(`cod_per`,`cod_inst`,`tipo_doc`,`ci_ruc`,`nombre`,`tel`,`email`,`fecha_nac`,`estado`,`ciudad`,`dir`,`geoloc`,`ocupacion`,`tipo`,`usuario`,`fecha_reg`) values (131,80,'CI','4.002.959','MARCELO COLMAN','984550520','','2020-03-02','Activo','','CAMBYRETA','','Cocinero/a','','douglas','2020-03-10');
insert  into `personas`(`cod_per`,`cod_inst`,`tipo_doc`,`ci_ruc`,`nombre`,`tel`,`email`,`fecha_nac`,`estado`,`ciudad`,`dir`,`geoloc`,`ocupacion`,`tipo`,`usuario`,`fecha_reg`) values (132,80,'CI','4.268.571','MIRTA BARRIOS','985194408','','2020-07-14','Activo','','CAMBYRETA','','Cocinero/a','','douglas','2020-03-10');
insert  into `personas`(`cod_per`,`cod_inst`,`tipo_doc`,`ci_ruc`,`nombre`,`tel`,`email`,`fecha_nac`,`estado`,`ciudad`,`dir`,`geoloc`,`ocupacion`,`tipo`,`usuario`,`fecha_reg`) values (133,80,'CI','3.294.164','BALBINO CABRAL','985350797','','2020-10-14','Activo','','CAMBYRETA','','Cocinero/a','','douglas','2020-03-10');
insert  into `personas`(`cod_per`,`cod_inst`,`tipo_doc`,`ci_ruc`,`nombre`,`tel`,`email`,`fecha_nac`,`estado`,`ciudad`,`dir`,`geoloc`,`ocupacion`,`tipo`,`usuario`,`fecha_reg`) values (134,80,'CI','4.605.636','DAMIANA LEZCANO','993556604','','2020-12-11','Activo','','CAMBYRETA','','Cocinero/a','','douglas','2020-03-10');
insert  into `personas`(`cod_per`,`cod_inst`,`tipo_doc`,`ci_ruc`,`nombre`,`tel`,`email`,`fecha_nac`,`estado`,`ciudad`,`dir`,`geoloc`,`ocupacion`,`tipo`,`usuario`,`fecha_reg`) values (135,96,'CI','661.856','LORENA ORTELLADO VILLALBA','984316069','','2020-07-20','Activo','','CAPITAN MIRANDA','','Cocinero/a','','douglas','2020-03-10');
insert  into `personas`(`cod_per`,`cod_inst`,`tipo_doc`,`ci_ruc`,`nombre`,`tel`,`email`,`fecha_nac`,`estado`,`ciudad`,`dir`,`geoloc`,`ocupacion`,`tipo`,`usuario`,`fecha_reg`) values (136,97,'CI','','VICTORINA E.V.G','986468235','','0000-00-00','Activo','','CAPITAN MIRANDA','','Cocinero/a','','douglas','2020-03-10');
insert  into `personas`(`cod_per`,`cod_inst`,`tipo_doc`,`ci_ruc`,`nombre`,`tel`,`email`,`fecha_nac`,`estado`,`ciudad`,`dir`,`geoloc`,`ocupacion`,`tipo`,`usuario`,`fecha_reg`) values (137,98,'CI','','BLANCA BUDENI','985553891','','0000-00-00','Activo','','CAPITAN MIRANDA','','Cocinero/a','','douglas','2020-03-10');
insert  into `personas`(`cod_per`,`cod_inst`,`tipo_doc`,`ci_ruc`,`nombre`,`tel`,`email`,`fecha_nac`,`estado`,`ciudad`,`dir`,`geoloc`,`ocupacion`,`tipo`,`usuario`,`fecha_reg`) values (138,99,'CI','','ELVIRA LEZCANO','983786351','','0000-00-00','Activo','','CAPITAN MIRANDA','','Cocinero/a','','douglas','2020-03-10');
insert  into `personas`(`cod_per`,`cod_inst`,`tipo_doc`,`ci_ruc`,`nombre`,`tel`,`email`,`fecha_nac`,`estado`,`ciudad`,`dir`,`geoloc`,`ocupacion`,`tipo`,`usuario`,`fecha_reg`) values (139,100,'CI','','ANA GONZALEZ','985852596','','0000-00-00','Activo','','CAPITAN MIRANDA','','Cocinero/a','','douglas','2020-03-10');
insert  into `personas`(`cod_per`,`cod_inst`,`tipo_doc`,`ci_ruc`,`nombre`,`tel`,`email`,`fecha_nac`,`estado`,`ciudad`,`dir`,`geoloc`,`ocupacion`,`tipo`,`usuario`,`fecha_reg`) values (140,100,'CI','','ANA DUARTE','986909346','','0000-00-00','Activo','','','','Cocinero/a','','douglas','2020-03-10');
insert  into `personas`(`cod_per`,`cod_inst`,`tipo_doc`,`ci_ruc`,`nombre`,`tel`,`email`,`fecha_nac`,`estado`,`ciudad`,`dir`,`geoloc`,`ocupacion`,`tipo`,`usuario`,`fecha_reg`) values (141,101,'CI','','SILVIA ANDINO','985788325','','0000-00-00','Activo','','CAPITAN MIRANDA','','Cocinero/a','','douglas','2020-03-10');
insert  into `personas`(`cod_per`,`cod_inst`,`tipo_doc`,`ci_ruc`,`nombre`,`tel`,`email`,`fecha_nac`,`estado`,`ciudad`,`dir`,`geoloc`,`ocupacion`,`tipo`,`usuario`,`fecha_reg`) values (142,102,'CI','','MIRIAN SILVA','984874867','','0000-00-00','Activo','','CAPITAN MIRANDA','','Cocinero/a','','douglas','2020-03-10');
insert  into `personas`(`cod_per`,`cod_inst`,`tipo_doc`,`ci_ruc`,`nombre`,`tel`,`email`,`fecha_nac`,`estado`,`ciudad`,`dir`,`geoloc`,`ocupacion`,`tipo`,`usuario`,`fecha_reg`) values (143,103,'CI','','NIMIA MARTINEZ','985262918','','0000-00-00','Activo','','CAPITAN MIRANDA','','Cocinero/a','','douglas','2020-03-10');
insert  into `personas`(`cod_per`,`cod_inst`,`tipo_doc`,`ci_ruc`,`nombre`,`tel`,`email`,`fecha_nac`,`estado`,`ciudad`,`dir`,`geoloc`,`ocupacion`,`tipo`,`usuario`,`fecha_reg`) values (144,104,'CI','','ANUNCIA MEZA RAMIREZ','994673303','','0000-00-00','Activo','','CAPITAN MIRANDA','','Cocinero/a','','douglas','2020-03-10');
insert  into `personas`(`cod_per`,`cod_inst`,`tipo_doc`,`ci_ruc`,`nombre`,`tel`,`email`,`fecha_nac`,`estado`,`ciudad`,`dir`,`geoloc`,`ocupacion`,`tipo`,`usuario`,`fecha_reg`) values (145,105,'CI','','MABEL CARDOZO','986518770','','0000-00-00','Activo','','CAPITAN MIRANDA','','Cocinero/a','','douglas','2020-03-10');
insert  into `personas`(`cod_per`,`cod_inst`,`tipo_doc`,`ci_ruc`,`nombre`,`tel`,`email`,`fecha_nac`,`estado`,`ciudad`,`dir`,`geoloc`,`ocupacion`,`tipo`,`usuario`,`fecha_reg`) values (146,106,'CI','','ZULMA RIOS LEON','981663216','','0000-00-00','Activo','','CAPITAN MIRANDA','','Cocinero/a','','douglas','2020-03-10');
insert  into `personas`(`cod_per`,`cod_inst`,`tipo_doc`,`ci_ruc`,`nombre`,`tel`,`email`,`fecha_nac`,`estado`,`ciudad`,`dir`,`geoloc`,`ocupacion`,`tipo`,`usuario`,`fecha_reg`) values (147,107,'CI','','LIDIA MONTERO BENITEZ','992662382','','0000-00-00','Activo','','CAPITAN MIRANDA','','Cocinero/a','','douglas','2020-03-10');
insert  into `personas`(`cod_per`,`cod_inst`,`tipo_doc`,`ci_ruc`,`nombre`,`tel`,`email`,`fecha_nac`,`estado`,`ciudad`,`dir`,`geoloc`,`ocupacion`,`tipo`,`usuario`,`fecha_reg`) values (148,136,'CI','','MARIA MARTINEZ SOSA','986660401','','0000-00-00','Activo','','TRINIDAD','','Cocinero/a','','douglas','2020-03-10');
insert  into `personas`(`cod_per`,`cod_inst`,`tipo_doc`,`ci_ruc`,`nombre`,`tel`,`email`,`fecha_nac`,`estado`,`ciudad`,`dir`,`geoloc`,`ocupacion`,`tipo`,`usuario`,`fecha_reg`) values (149,137,'CI','','BEATRIZ TORALES','985480552','','0000-00-00','Activo','','TRINIDAD','','Cocinero/a','','douglas','2020-03-10');
insert  into `personas`(`cod_per`,`cod_inst`,`tipo_doc`,`ci_ruc`,`nombre`,`tel`,`email`,`fecha_nac`,`estado`,`ciudad`,`dir`,`geoloc`,`ocupacion`,`tipo`,`usuario`,`fecha_reg`) values (150,138,'CI','','FELIPA IRALA BENITEZ','981317950','','0000-00-00','Activo','','TRINIDAD','','Cocinero/a','','douglas','2020-03-10');
insert  into `personas`(`cod_per`,`cod_inst`,`tipo_doc`,`ci_ruc`,`nombre`,`tel`,`email`,`fecha_nac`,`estado`,`ciudad`,`dir`,`geoloc`,`ocupacion`,`tipo`,`usuario`,`fecha_reg`) values (151,139,'CI','','ZULMA EDITH','984542034','','0000-00-00','Activo','','TRINIDAD','','Cocinero/a','','douglas','2020-03-10');
insert  into `personas`(`cod_per`,`cod_inst`,`tipo_doc`,`ci_ruc`,`nombre`,`tel`,`email`,`fecha_nac`,`estado`,`ciudad`,`dir`,`geoloc`,`ocupacion`,`tipo`,`usuario`,`fecha_reg`) values (152,140,'CI','','ROSA ISABEL ACOSTA','983894372','','0000-00-00','Activo','','TRINIDAD','','Cocinero/a','','douglas','2020-03-10');
insert  into `personas`(`cod_per`,`cod_inst`,`tipo_doc`,`ci_ruc`,`nombre`,`tel`,`email`,`fecha_nac`,`estado`,`ciudad`,`dir`,`geoloc`,`ocupacion`,`tipo`,`usuario`,`fecha_reg`) values (153,141,'CI','6.188.040','IRMA RIOS MULLER','','','2020-05-30','Activo','','TRINIDAD','','Cocinero/a','','douglas','2020-03-10');
insert  into `personas`(`cod_per`,`cod_inst`,`tipo_doc`,`ci_ruc`,`nombre`,`tel`,`email`,`fecha_nac`,`estado`,`ciudad`,`dir`,`geoloc`,`ocupacion`,`tipo`,`usuario`,`fecha_reg`) values (154,141,'CI','4.673.978','NOELIA ARCE SARABIA','986291195','','2020-12-03','Activo','','TRINIDAD','','Cocinero/a','','douglas','2020-03-10');
insert  into `personas`(`cod_per`,`cod_inst`,`tipo_doc`,`ci_ruc`,`nombre`,`tel`,`email`,`fecha_nac`,`estado`,`ciudad`,`dir`,`geoloc`,`ocupacion`,`tipo`,`usuario`,`fecha_reg`) values (155,142,'CI','5.182.497','ROSA GIMENEZ LOPEZ','995676515','','2020-04-17','Activo','','PIRAPO','','Cocinero/a','','douglas','2020-03-10');
insert  into `personas`(`cod_per`,`cod_inst`,`tipo_doc`,`ci_ruc`,`nombre`,`tel`,`email`,`fecha_nac`,`estado`,`ciudad`,`dir`,`geoloc`,`ocupacion`,`tipo`,`usuario`,`fecha_reg`) values (156,143,'CI','5.129.832','NOELIA BRUNO DUARTE','985860471','','2020-10-01','Activo','','PIRAPO','','Cocinero/a','','douglas','2020-03-10');
insert  into `personas`(`cod_per`,`cod_inst`,`tipo_doc`,`ci_ruc`,`nombre`,`tel`,`email`,`fecha_nac`,`estado`,`ciudad`,`dir`,`geoloc`,`ocupacion`,`tipo`,`usuario`,`fecha_reg`) values (157,144,'CI','7.933.573','MARIA GONZALEZ','983689111','','2020-07-17','Activo','','PIRAPO','','Cocinero/a','','douglas','2020-03-10');
insert  into `personas`(`cod_per`,`cod_inst`,`tipo_doc`,`ci_ruc`,`nombre`,`tel`,`email`,`fecha_nac`,`estado`,`ciudad`,`dir`,`geoloc`,`ocupacion`,`tipo`,`usuario`,`fecha_reg`) values (158,145,'CI','4.420.936','DELIA CABALLERO VERA','992822969','','2020-07-02','Activo','','PIRAPO','','Cocinero/a','','douglas','2020-03-10');
insert  into `personas`(`cod_per`,`cod_inst`,`tipo_doc`,`ci_ruc`,`nombre`,`tel`,`email`,`fecha_nac`,`estado`,`ciudad`,`dir`,`geoloc`,`ocupacion`,`tipo`,`usuario`,`fecha_reg`) values (159,146,'CI','2.495.242','IRMA ORTEGA GENES','972832839','','2020-05-19','Activo','','PIRAPO','','Cocinero/a','','douglas','2020-03-10');
insert  into `personas`(`cod_per`,`cod_inst`,`tipo_doc`,`ci_ruc`,`nombre`,`tel`,`email`,`fecha_nac`,`estado`,`ciudad`,`dir`,`geoloc`,`ocupacion`,`tipo`,`usuario`,`fecha_reg`) values (160,146,'CI','5.363.334','ANA RODAS CASTILLO','984368311','','2020-07-26','Activo','','PIRAPO','','Cocinero/a','','douglas','2020-03-10');
insert  into `personas`(`cod_per`,`cod_inst`,`tipo_doc`,`ci_ruc`,`nombre`,`tel`,`email`,`fecha_nac`,`estado`,`ciudad`,`dir`,`geoloc`,`ocupacion`,`tipo`,`usuario`,`fecha_reg`) values (161,146,'CI','3.613.948','BERNANDINA VELAZQUEZ','986544847','','2020-08-20','Activo','','PIRAPO','','Cocinero/a','','douglas','2020-03-10');
insert  into `personas`(`cod_per`,`cod_inst`,`tipo_doc`,`ci_ruc`,`nombre`,`tel`,`email`,`fecha_nac`,`estado`,`ciudad`,`dir`,`geoloc`,`ocupacion`,`tipo`,`usuario`,`fecha_reg`) values (162,147,'CI','4.082.922','MARIA GIMENEZ','986881712','','2020-02-20','Activo','','PIRAPO','','Cocinero/a','','douglas','2020-03-10');
insert  into `personas`(`cod_per`,`cod_inst`,`tipo_doc`,`ci_ruc`,`nombre`,`tel`,`email`,`fecha_nac`,`estado`,`ciudad`,`dir`,`geoloc`,`ocupacion`,`tipo`,`usuario`,`fecha_reg`) values (163,148,'CI','3.803.792','ANGELA PEREIRA DUARTE','972172857','','2020-08-08','Activo','','FRAM','','Cocinero/a','','douglas','2020-03-10');
insert  into `personas`(`cod_per`,`cod_inst`,`tipo_doc`,`ci_ruc`,`nombre`,`tel`,`email`,`fecha_nac`,`estado`,`ciudad`,`dir`,`geoloc`,`ocupacion`,`tipo`,`usuario`,`fecha_reg`) values (164,148,'CI','3.434.061','LUCIANA DUARTE ACUÑA','985496541','','2020-06-21','Activo','','','','Cocinero/a','','douglas','2020-03-10');
insert  into `personas`(`cod_per`,`cod_inst`,`tipo_doc`,`ci_ruc`,`nombre`,`tel`,`email`,`fecha_nac`,`estado`,`ciudad`,`dir`,`geoloc`,`ocupacion`,`tipo`,`usuario`,`fecha_reg`) values (165,148,'CI','5.913.198','GRACIELA GOMEZ','982810538','','2020-04-05','Activo','','','','Cocinero/a','','douglas','2020-03-10');
insert  into `personas`(`cod_per`,`cod_inst`,`tipo_doc`,`ci_ruc`,`nombre`,`tel`,`email`,`fecha_nac`,`estado`,`ciudad`,`dir`,`geoloc`,`ocupacion`,`tipo`,`usuario`,`fecha_reg`) values (166,149,'CI','2.662.556','ROSA GONZALEZ TRINIDAD','986769327','','2020-09-04','Activo','','FRAM','','Cocinero/a','','douglas','2020-03-10');
insert  into `personas`(`cod_per`,`cod_inst`,`tipo_doc`,`ci_ruc`,`nombre`,`tel`,`email`,`fecha_nac`,`estado`,`ciudad`,`dir`,`geoloc`,`ocupacion`,`tipo`,`usuario`,`fecha_reg`) values (167,150,'CI','2.675.341','BERNARDA AMARILLA','','','2020-03-11','Activo','','FRAM','','Cocinero/a','','douglas','2020-03-10');
insert  into `personas`(`cod_per`,`cod_inst`,`tipo_doc`,`ci_ruc`,`nombre`,`tel`,`email`,`fecha_nac`,`estado`,`ciudad`,`dir`,`geoloc`,`ocupacion`,`tipo`,`usuario`,`fecha_reg`) values (168,151,'CI','6.966.048','JENNIFER GRINIVSKI','985623751','','2020-01-16','Activo','','FRAM','','Cocinero/a','','douglas','2020-03-10');
insert  into `personas`(`cod_per`,`cod_inst`,`tipo_doc`,`ci_ruc`,`nombre`,`tel`,`email`,`fecha_nac`,`estado`,`ciudad`,`dir`,`geoloc`,`ocupacion`,`tipo`,`usuario`,`fecha_reg`) values (169,152,'CI','2.956.788','ILDA GALEANO','973105278','','2020-01-21','Activo','','FRAM','','Cocinero/a','','douglas','2020-03-10');
insert  into `personas`(`cod_per`,`cod_inst`,`tipo_doc`,`ci_ruc`,`nombre`,`tel`,`email`,`fecha_nac`,`estado`,`ciudad`,`dir`,`geoloc`,`ocupacion`,`tipo`,`usuario`,`fecha_reg`) values (170,153,'CI','5.140.614','VICTORIANA MEZA','','','2020-10-08','Activo','','FRAM','','Cocinero/a','','douglas','2020-03-10');
insert  into `personas`(`cod_per`,`cod_inst`,`tipo_doc`,`ci_ruc`,`nombre`,`tel`,`email`,`fecha_nac`,`estado`,`ciudad`,`dir`,`geoloc`,`ocupacion`,`tipo`,`usuario`,`fecha_reg`) values (171,154,'CI','5.511.113','ANA CARDOZO BRITEZ','985468419','','2020-05-16','Activo','','FRAM','','Cocinero/a','','douglas','2020-03-10');
insert  into `personas`(`cod_per`,`cod_inst`,`tipo_doc`,`ci_ruc`,`nombre`,`tel`,`email`,`fecha_nac`,`estado`,`ciudad`,`dir`,`geoloc`,`ocupacion`,`tipo`,`usuario`,`fecha_reg`) values (172,155,'CI','2.956.765','VIRGINIA DUARTE','','','2020-11-14','Activo','','FRAM','','Cocinero/a','','douglas','2020-03-10');
insert  into `personas`(`cod_per`,`cod_inst`,`tipo_doc`,`ci_ruc`,`nombre`,`tel`,`email`,`fecha_nac`,`estado`,`ciudad`,`dir`,`geoloc`,`ocupacion`,`tipo`,`usuario`,`fecha_reg`) values (173,156,'CI','2.694.983','ROSALBA ARAUJO','982571119','','2020-08-16','Activo','','FRAM','','Cocinero/a','','douglas','2020-03-10');
insert  into `personas`(`cod_per`,`cod_inst`,`tipo_doc`,`ci_ruc`,`nombre`,`tel`,`email`,`fecha_nac`,`estado`,`ciudad`,`dir`,`geoloc`,`ocupacion`,`tipo`,`usuario`,`fecha_reg`) values (174,157,'CI','4.081.634','TERESA AQUINO ACOSTA','985157596','','2020-02-26','Activo','','FRAM','','Cocinero/a','','douglas','2020-03-10');
insert  into `personas`(`cod_per`,`cod_inst`,`tipo_doc`,`ci_ruc`,`nombre`,`tel`,`email`,`fecha_nac`,`estado`,`ciudad`,`dir`,`geoloc`,`ocupacion`,`tipo`,`usuario`,`fecha_reg`) values (175,158,'CI','6.188.346','ALBA PEDROZO ROJAS','986345222','','2020-11-28','Activo','','SAN JUAN  DEL PARANA','','Cocinero/a','','douglas','2020-03-10');
insert  into `personas`(`cod_per`,`cod_inst`,`tipo_doc`,`ci_ruc`,`nombre`,`tel`,`email`,`fecha_nac`,`estado`,`ciudad`,`dir`,`geoloc`,`ocupacion`,`tipo`,`usuario`,`fecha_reg`) values (176,158,'CI','6.772.177','ROSANNA TAVAREZ PAIVA','984361410','','2020-02-22','Activo','','','','Cocinero/a','','douglas','2020-03-10');
insert  into `personas`(`cod_per`,`cod_inst`,`tipo_doc`,`ci_ruc`,`nombre`,`tel`,`email`,`fecha_nac`,`estado`,`ciudad`,`dir`,`geoloc`,`ocupacion`,`tipo`,`usuario`,`fecha_reg`) values (177,158,'CI','2.824.129','CATALINA CRISTALDO','985805737','','2020-04-30','Activo','','','','Cocinero/a','','douglas','2020-03-10');
insert  into `personas`(`cod_per`,`cod_inst`,`tipo_doc`,`ci_ruc`,`nombre`,`tel`,`email`,`fecha_nac`,`estado`,`ciudad`,`dir`,`geoloc`,`ocupacion`,`tipo`,`usuario`,`fecha_reg`) values (178,159,'CI','3.246.124','TERESA RODRIGUEZ','985720993','','2020-03-22','Activo','','SAN JUAN  DEL PARANA','','Cocinero/a','','douglas','2020-03-10');
insert  into `personas`(`cod_per`,`cod_inst`,`tipo_doc`,`ci_ruc`,`nombre`,`tel`,`email`,`fecha_nac`,`estado`,`ciudad`,`dir`,`geoloc`,`ocupacion`,`tipo`,`usuario`,`fecha_reg`) values (179,159,'CI','4.318.111','LIS PAOLA PIRIS SILVA','985928234','','2020-07-25','Activo','','','','Cocinero/a','','douglas','2020-03-10');
insert  into `personas`(`cod_per`,`cod_inst`,`tipo_doc`,`ci_ruc`,`nombre`,`tel`,`email`,`fecha_nac`,`estado`,`ciudad`,`dir`,`geoloc`,`ocupacion`,`tipo`,`usuario`,`fecha_reg`) values (180,159,'CI','3.437.384','EMILSE CASTILLO SANCHEZ','992361974','','2020-03-25','Activo','','','','Cocinero/a','','douglas','2020-03-10');
insert  into `personas`(`cod_per`,`cod_inst`,`tipo_doc`,`ci_ruc`,`nombre`,`tel`,`email`,`fecha_nac`,`estado`,`ciudad`,`dir`,`geoloc`,`ocupacion`,`tipo`,`usuario`,`fecha_reg`) values (181,160,'CI','2.047.064','MARIA CASCO','985731846','','2020-05-04','Activo','','SAN JUAN  DEL PARANA','','Cocinero/a','','douglas','2020-03-10');
insert  into `personas`(`cod_per`,`cod_inst`,`tipo_doc`,`ci_ruc`,`nombre`,`tel`,`email`,`fecha_nac`,`estado`,`ciudad`,`dir`,`geoloc`,`ocupacion`,`tipo`,`usuario`,`fecha_reg`) values (182,160,'CI','4.110.265','LILIANA LOPEZ ROA','971883952','','2020-12-11','Activo','','','','Cocinero/a','','douglas','2020-03-10');
insert  into `personas`(`cod_per`,`cod_inst`,`tipo_doc`,`ci_ruc`,`nombre`,`tel`,`email`,`fecha_nac`,`estado`,`ciudad`,`dir`,`geoloc`,`ocupacion`,`tipo`,`usuario`,`fecha_reg`) values (183,161,'CI','2.859.680','NORMA CABA?AS','975893589','','2020-04-30','Activo','','SAN JUAN  DEL PARANA','','Cocinero/a','','douglas','2020-03-10');
insert  into `personas`(`cod_per`,`cod_inst`,`tipo_doc`,`ci_ruc`,`nombre`,`tel`,`email`,`fecha_nac`,`estado`,`ciudad`,`dir`,`geoloc`,`ocupacion`,`tipo`,`usuario`,`fecha_reg`) values (184,161,'CI','2.664.301','GRACIELA MEZA','993571435','','2020-06-12','Activo','','','','Cocinero/a','','douglas','2020-03-10');
insert  into `personas`(`cod_per`,`cod_inst`,`tipo_doc`,`ci_ruc`,`nombre`,`tel`,`email`,`fecha_nac`,`estado`,`ciudad`,`dir`,`geoloc`,`ocupacion`,`tipo`,`usuario`,`fecha_reg`) values (185,162,'CI','2.607.107','RAMONA SANCHEZ MORINIGO','986795922','','2020-02-16','Activo','','SAN JUAN  DEL PARANA','','Cocinero/a','','douglas','2020-03-10');
insert  into `personas`(`cod_per`,`cod_inst`,`tipo_doc`,`ci_ruc`,`nombre`,`tel`,`email`,`fecha_nac`,`estado`,`ciudad`,`dir`,`geoloc`,`ocupacion`,`tipo`,`usuario`,`fecha_reg`) values (186,162,'CI','1.411.835','OLGA GERASINCHUK','985798398','','2020-06-11','Activo','','','','Cocinero/a','','douglas','2020-03-10');
insert  into `personas`(`cod_per`,`cod_inst`,`tipo_doc`,`ci_ruc`,`nombre`,`tel`,`email`,`fecha_nac`,`estado`,`ciudad`,`dir`,`geoloc`,`ocupacion`,`tipo`,`usuario`,`fecha_reg`) values (187,162,'CI','1.256.604','ANITA LESCHI?UK DE PORTAKIEWICH','984737108','','2020-01-10','Activo','','','','Cocinero/a','','douglas','2020-03-10');
insert  into `personas`(`cod_per`,`cod_inst`,`tipo_doc`,`ci_ruc`,`nombre`,`tel`,`email`,`fecha_nac`,`estado`,`ciudad`,`dir`,`geoloc`,`ocupacion`,`tipo`,`usuario`,`fecha_reg`) values (188,163,'CI','4.267.342','IGNACIA ORTELLADO','983674977','','2020-07-31','Activo','','SAN JUAN  DEL PARANA','','Cocinero/a','','douglas','2020-03-10');
insert  into `personas`(`cod_per`,`cod_inst`,`tipo_doc`,`ci_ruc`,`nombre`,`tel`,`email`,`fecha_nac`,`estado`,`ciudad`,`dir`,`geoloc`,`ocupacion`,`tipo`,`usuario`,`fecha_reg`) values (189,163,'CI','1.175.158','PERLA DUARTE GOIRI','985499546','','2020-03-01','Activo','','','','Cocinero/a','','douglas','2020-03-10');

/*Table structure for table `prop_x_art` */

DROP TABLE IF EXISTS `prop_x_art`;

CREATE TABLE `prop_x_art` (
  `codigo` varchar(30) NOT NULL,
  `cod_prop` varchar(30) NOT NULL,
  `valor` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`codigo`,`cod_prop`),
  KEY `Refart_propiedades28` (`cod_prop`),
  CONSTRAINT `Refart_propiedades28` FOREIGN KEY (`cod_prop`) REFERENCES `art_propiedades` (`cod_prop`),
  CONSTRAINT `Refarticulos27` FOREIGN KEY (`codigo`) REFERENCES `articulos` (`codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `prop_x_art` */

/*Table structure for table `sectores` */

DROP TABLE IF EXISTS `sectores`;

CREATE TABLE `sectores` (
  `cod_sector` int(11) NOT NULL,
  `descrip` varchar(60) DEFAULT NULL,
  `prefijo` varchar(4) DEFAULT NULL,
  `longitud` int(11) DEFAULT NULL,
  `serie` int(11) DEFAULT NULL,
  PRIMARY KEY (`cod_sector`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `sectores` */

/*Table structure for table `sesiones` */

DROP TABLE IF EXISTS `sesiones`;

CREATE TABLE `sesiones` (
  `id_sesion` int(11) NOT NULL AUTO_INCREMENT,
  `usuario` varchar(30) NOT NULL,
  `fecha` varchar(30) DEFAULT NULL,
  `hora` varchar(30) DEFAULT NULL,
  `ip` varchar(30) DEFAULT NULL,
  `serial` varchar(100) DEFAULT NULL,
  `limite_sesion` int(11) DEFAULT NULL,
  `expira` varchar(30) DEFAULT NULL,
  `estado` varchar(16) DEFAULT NULL,
  PRIMARY KEY (`id_sesion`,`usuario`),
  KEY `Refusuarios106` (`usuario`),
  CONSTRAINT `Refusuarios106` FOREIGN KEY (`usuario`) REFERENCES `usuarios` (`usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=latin1;

/*Data for the table `sesiones` */

insert  into `sesiones`(`id_sesion`,`usuario`,`fecha`,`hora`,`ip`,`serial`,`limite_sesion`,`expira`,`estado`) values (1,'douglas','2020-02-22','12:09:20','::1','13397e5a2307ada0e963936e74c56ead523a648e',9999,'2020-02-29 10:48:20','Inactiva');
insert  into `sesiones`(`id_sesion`,`usuario`,`fecha`,`hora`,`ip`,`serial`,`limite_sesion`,`expira`,`estado`) values (2,'douglas','2020-02-22','12:10:15','::1','df1d9c020f3fee7989efed28a91ea9d19032cab9',9999,'2020-02-29 10:49:15','Inactiva');
insert  into `sesiones`(`id_sesion`,`usuario`,`fecha`,`hora`,`ip`,`serial`,`limite_sesion`,`expira`,`estado`) values (3,'douglas','2020-02-22','12:13:15','::1','0559de57aa58d26e1f485f99c5506c82d9732674',9999,'2020-02-29 10:52:15','Inactiva');
insert  into `sesiones`(`id_sesion`,`usuario`,`fecha`,`hora`,`ip`,`serial`,`limite_sesion`,`expira`,`estado`) values (4,'douglas','2020-02-22','12:19:24','::1','a56609f884b32dc722e03afef7f8eb9537abebb5',9999,'2020-02-29 10:58:24','Inactiva');
insert  into `sesiones`(`id_sesion`,`usuario`,`fecha`,`hora`,`ip`,`serial`,`limite_sesion`,`expira`,`estado`) values (5,'douglas','2020-02-22','12:24:26','::1','209cd54a6b3eeb94594b02288eec6c76e883321b',9999,'2020-02-29 11:03:26','Inactiva');
insert  into `sesiones`(`id_sesion`,`usuario`,`fecha`,`hora`,`ip`,`serial`,`limite_sesion`,`expira`,`estado`) values (6,'douglas','2020-02-22','12:25:16','::1','f50aaf3c223b8d879f790a7dec868f4294582b0d',9999,'2020-02-29 11:09:16','Inactiva');
insert  into `sesiones`(`id_sesion`,`usuario`,`fecha`,`hora`,`ip`,`serial`,`limite_sesion`,`expira`,`estado`) values (7,'douglas','2020-02-24','18:11:38','::1','16c10ac83c2d88fd852ea8833e002d943456ca9e',9999,'2020-03-02 16:50:38','Inactiva');
insert  into `sesiones`(`id_sesion`,`usuario`,`fecha`,`hora`,`ip`,`serial`,`limite_sesion`,`expira`,`estado`) values (8,'douglas','2020-02-24','19:13:19','::1','21889d4988fca19596f658991eb50977949f9dbe',9999,'2020-03-02 17:52:19','Inactiva');
insert  into `sesiones`(`id_sesion`,`usuario`,`fecha`,`hora`,`ip`,`serial`,`limite_sesion`,`expira`,`estado`) values (9,'douglas','2020-02-24','20:45:20','::1','c39d1f8deb065aa0441aebe30341b566cd7e8474',9999,'2020-03-02 19:24:20','Inactiva');
insert  into `sesiones`(`id_sesion`,`usuario`,`fecha`,`hora`,`ip`,`serial`,`limite_sesion`,`expira`,`estado`) values (10,'douglas','2020-02-24','20:46:10','::1','7723ee5de9f14274e010ae965343f0857f31c2b6',9999,'2020-03-02 19:25:10','Inactiva');
insert  into `sesiones`(`id_sesion`,`usuario`,`fecha`,`hora`,`ip`,`serial`,`limite_sesion`,`expira`,`estado`) values (11,'douglas','2020-02-24','20:47:15','::1','47f47134b3b5fd9147a6a1653b460ce91448ffd4',9999,'2020-03-03 17:34:48','Inactiva');
insert  into `sesiones`(`id_sesion`,`usuario`,`fecha`,`hora`,`ip`,`serial`,`limite_sesion`,`expira`,`estado`) values (12,'douglas','2020-02-25','19:05:30','::1','21b4e148e7d2cb356993580fb9fd5851dfb4df9b',9999,'2020-03-03 17:44:30','Inactiva');
insert  into `sesiones`(`id_sesion`,`usuario`,`fecha`,`hora`,`ip`,`serial`,`limite_sesion`,`expira`,`estado`) values (13,'douglas','2020-02-25','19:07:11','::1','5c8c54daa38a47fa683d1b88ac4bf6e40b8eca17',9999,'2020-03-03 17:46:11','Inactiva');
insert  into `sesiones`(`id_sesion`,`usuario`,`fecha`,`hora`,`ip`,`serial`,`limite_sesion`,`expira`,`estado`) values (14,'douglas','2020-02-25','19:12:04','::1','c860ad5dc641cb70dc04e11d1483a1375f0571fe',9999,'2020-03-03 17:51:04','Inactiva');
insert  into `sesiones`(`id_sesion`,`usuario`,`fecha`,`hora`,`ip`,`serial`,`limite_sesion`,`expira`,`estado`) values (15,'douglas','2020-02-25','19:17:11','::1','30cae25f8020a75b358408620f717539f6c18cfe',9999,'2020-03-03 17:56:11','Inactiva');
insert  into `sesiones`(`id_sesion`,`usuario`,`fecha`,`hora`,`ip`,`serial`,`limite_sesion`,`expira`,`estado`) values (16,'douglas','2020-02-25','19:24:13','::1','a4f375393e6704618fecdda1d143e19d43cc5ce2',9999,'2020-03-03 18:03:13','Inactiva');
insert  into `sesiones`(`id_sesion`,`usuario`,`fecha`,`hora`,`ip`,`serial`,`limite_sesion`,`expira`,`estado`) values (17,'douglas','2020-02-25','19:25:53','::1','c6fa0a15b868c7cc645231192e699b7285e5a5ba',9999,'2020-03-03 18:09:53','Inactiva');
insert  into `sesiones`(`id_sesion`,`usuario`,`fecha`,`hora`,`ip`,`serial`,`limite_sesion`,`expira`,`estado`) values (18,'douglas','2020-02-25','19:28:55','::1','4709130ddb84ab85c6dd9cb12d8d2b31589f6de0',9999,'2020-03-03 18:07:55','Inactiva');
insert  into `sesiones`(`id_sesion`,`usuario`,`fecha`,`hora`,`ip`,`serial`,`limite_sesion`,`expira`,`estado`) values (19,'douglas','2020-02-25','19:34:18','::1','8878cf6efc21d0fe9ca19393fd53f8b8bcea9659',9999,'2020-03-03 19:03:22','Inactiva');
insert  into `sesiones`(`id_sesion`,`usuario`,`fecha`,`hora`,`ip`,`serial`,`limite_sesion`,`expira`,`estado`) values (20,'douglas','2020-02-25','20:37:02','::1','9bf42032a125b5e4dd186aecc513fa2d34ca9d6b',9999,'2020-03-03 19:21:02','Inactiva');
insert  into `sesiones`(`id_sesion`,`usuario`,`fecha`,`hora`,`ip`,`serial`,`limite_sesion`,`expira`,`estado`) values (21,'douglas','2020-02-27','20:17:00','::1','d77862fcb069c91b8dfad40be444d96225f7caca',9999,'2020-03-05 19:01:02','Inactiva');
insert  into `sesiones`(`id_sesion`,`usuario`,`fecha`,`hora`,`ip`,`serial`,`limite_sesion`,`expira`,`estado`) values (22,'douglas','2020-02-27','20:29:54','::1','42aa0dfdb7abbf91db5bfdb002366bfb474c9cd0',9999,'2020-03-05 19:08:54','Inactiva');
insert  into `sesiones`(`id_sesion`,`usuario`,`fecha`,`hora`,`ip`,`serial`,`limite_sesion`,`expira`,`estado`) values (23,'douglas','2020-02-27','20:30:31','::1','04c9643c853072d671fc146895091ca71dd28999',9999,'2020-03-05 19:09:31','Inactiva');
insert  into `sesiones`(`id_sesion`,`usuario`,`fecha`,`hora`,`ip`,`serial`,`limite_sesion`,`expira`,`estado`) values (24,'douglas','2020-02-27','20:34:09','::1','aba2473b45a5a44f30aed180b8988ef7ecc7bc97',9999,'2020-03-05 19:13:09','Inactiva');
insert  into `sesiones`(`id_sesion`,`usuario`,`fecha`,`hora`,`ip`,`serial`,`limite_sesion`,`expira`,`estado`) values (25,'douglas','2020-02-27','20:34:53','::1','d30bfa16d373361becbfd44a89e954fa17cefbe9',9999,'2020-03-09 16:44:27','Inactiva');
insert  into `sesiones`(`id_sesion`,`usuario`,`fecha`,`hora`,`ip`,`serial`,`limite_sesion`,`expira`,`estado`) values (26,'douglas','2020-03-02','20:00:00','::1','b2eb3b5d3d49a76d389786684b4d29ccff9a7cf0',9999,'2020-03-09 18:59:02','Inactiva');
insert  into `sesiones`(`id_sesion`,`usuario`,`fecha`,`hora`,`ip`,`serial`,`limite_sesion`,`expira`,`estado`) values (27,'douglas','2020-03-02','20:21:36','::1','3bde2a81800494e1e0b7fbd9be1fdda9fd7c2681',9999,'2020-03-09 19:25:37','Inactiva');
insert  into `sesiones`(`id_sesion`,`usuario`,`fecha`,`hora`,`ip`,`serial`,`limite_sesion`,`expira`,`estado`) values (28,'douglas','2020-03-02','20:51:01','::1','71a5b63992d03d50129db0eb5f16a6252fcaae56',9999,'2020-03-09 19:30:01','Inactiva');
insert  into `sesiones`(`id_sesion`,`usuario`,`fecha`,`hora`,`ip`,`serial`,`limite_sesion`,`expira`,`estado`) values (29,'douglas','2020-03-02','20:51:23','::1','ccd895d15353c78183e00e575320ad54ac9528cd',9999,'2020-03-09 19:40:24','Inactiva');
insert  into `sesiones`(`id_sesion`,`usuario`,`fecha`,`hora`,`ip`,`serial`,`limite_sesion`,`expira`,`estado`) values (30,'douglas','2020-03-02','21:10:50','::1','c3c359681df748d374b0ceee26d084bca119fe7b',9999,'2020-03-10 19:06:23','Inactiva');
insert  into `sesiones`(`id_sesion`,`usuario`,`fecha`,`hora`,`ip`,`serial`,`limite_sesion`,`expira`,`estado`) values (31,'douglas','2020-03-04','20:00:36','::1','35c56782d0ef2c1e3635eeda02bb0ebb835e8960',9999,'2020-03-11 18:54:36','Inactiva');
insert  into `sesiones`(`id_sesion`,`usuario`,`fecha`,`hora`,`ip`,`serial`,`limite_sesion`,`expira`,`estado`) values (32,'douglas','2020-03-04','20:16:20','::1','3cf95c1f504855ed3b31694c9f4348a1a2eb3433',9999,'2020-03-11 18:55:20','Inactiva');
insert  into `sesiones`(`id_sesion`,`usuario`,`fecha`,`hora`,`ip`,`serial`,`limite_sesion`,`expira`,`estado`) values (33,'douglas','2020-03-04','20:16:38','::1','14df69d04b8f72b23599a6d5632bcef890e6ec46',9999,'2020-03-11 19:15:39','Inactiva');
insert  into `sesiones`(`id_sesion`,`usuario`,`fecha`,`hora`,`ip`,`serial`,`limite_sesion`,`expira`,`estado`) values (34,'douglas','2020-03-04','20:38:58','::1','48bbb36ee7faf4708a19c514672aa42a6dcf6f9c',9999,'2020-03-11 19:17:58','Inactiva');
insert  into `sesiones`(`id_sesion`,`usuario`,`fecha`,`hora`,`ip`,`serial`,`limite_sesion`,`expira`,`estado`) values (35,'douglas','2020-03-04','20:40:50','::1','23c3efd01c8366605bda1f2555ff99a359d9335e',9999,'2020-03-11 20:44:52','Inactiva');
insert  into `sesiones`(`id_sesion`,`usuario`,`fecha`,`hora`,`ip`,`serial`,`limite_sesion`,`expira`,`estado`) values (36,'douglas','2020-03-05','17:59:04','::1','279f0fa2c0e67a8e0b5d9af66254619102fa3d4e',9999,'2020-03-12 18:43:06','Activa');
insert  into `sesiones`(`id_sesion`,`usuario`,`fecha`,`hora`,`ip`,`serial`,`limite_sesion`,`expira`,`estado`) values (37,'douglas','2020-03-06','18:21:12','::1','3c358d3231092bda0d6565c94795c60996d31f98',9999,'2020-03-13 19:00:16','Activa');
insert  into `sesiones`(`id_sesion`,`usuario`,`fecha`,`hora`,`ip`,`serial`,`limite_sesion`,`expira`,`estado`) values (38,'douglas','2020-03-07','12:21:42','::1','eb57fd7ac7cd967f9f5688af7e5c057bbf6cb5e4',9999,'2020-03-16 19:15:23','Activa');
insert  into `sesiones`(`id_sesion`,`usuario`,`fecha`,`hora`,`ip`,`serial`,`limite_sesion`,`expira`,`estado`) values (39,'douglas','2020-03-10','19:44:41','::1','ef48dd33f88898d16008355e420ba7ac32214487',9999,'2020-03-17 19:53:44','Activa');
insert  into `sesiones`(`id_sesion`,`usuario`,`fecha`,`hora`,`ip`,`serial`,`limite_sesion`,`expira`,`estado`) values (40,'douglas','2020-03-11','18:17:23','::1','b41344a22e5e65f5e2e13e8e0378aa444bb3e66e',9999,'2020-03-18 20:36:24','Activa');
insert  into `sesiones`(`id_sesion`,`usuario`,`fecha`,`hora`,`ip`,`serial`,`limite_sesion`,`expira`,`estado`) values (41,'douglas','2020-03-11','22:04:35','::1','57c2c922ac98a90416d9264bb411b255a2cde69f',9999,'2020-03-18 20:43:35','Activa');
insert  into `sesiones`(`id_sesion`,`usuario`,`fecha`,`hora`,`ip`,`serial`,`limite_sesion`,`expira`,`estado`) values (42,'douglas','2020-03-11','22:09:20','::1','ea169e53de9a7708a279e8063c502474bee66bf4',9999,'2020-03-18 21:03:36','Activa');
insert  into `sesiones`(`id_sesion`,`usuario`,`fecha`,`hora`,`ip`,`serial`,`limite_sesion`,`expira`,`estado`) values (43,'douglas','2020-03-12','12:44:00','::1','9870467bf128d85569f7acb6ae0634868e38c178',9999,'2020-03-19 18:37:00','Activa');

/*Table structure for table `sucursales` */

DROP TABLE IF EXISTS `sucursales`;

CREATE TABLE `sucursales` (
  `suc` varchar(10) NOT NULL,
  `ruc` varchar(20) DEFAULT NULL,
  `nombre` varchar(30) DEFAULT NULL,
  `direccion` varchar(200) DEFAULT NULL,
  `tel` varchar(30) DEFAULT NULL,
  `mail` varchar(30) DEFAULT NULL,
  `web` varchar(100) DEFAULT NULL,
  `ciudad` varchar(30) DEFAULT NULL,
  `departamento` varchar(30) DEFAULT NULL,
  `pais` varchar(30) DEFAULT NULL,
  `tipo` varchar(30) DEFAULT NULL,
  `estab_cont` varchar(6) DEFAULT NULL,
  `estado` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`suc`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `sucursales` */

insert  into `sucursales`(`suc`,`ruc`,`nombre`,`direccion`,`tel`,`mail`,`web`,`ciudad`,`departamento`,`pais`,`tipo`,`estab_cont`,`estado`) values ('01','4243949-3','Distribuidora Paraguay','','','','','Encarnacion','07','PY','',NULL,'Activa');
insert  into `sucursales`(`suc`,`ruc`,`nombre`,`direccion`,`tel`,`mail`,`web`,`ciudad`,`departamento`,`pais`,`tipo`,`estab_cont`,`estado`) values ('02','4119457-8','Fortaleza Emprendimientos','','','','','Encarnacion','07','PY','',NULL,'Activa');
insert  into `sucursales`(`suc`,`ruc`,`nombre`,`direccion`,`tel`,`mail`,`web`,`ciudad`,`departamento`,`pais`,`tipo`,`estab_cont`,`estado`) values ('03','80096687-2','Consorcio Santa Rosa','','','','','Encarnacion','07','PY','',NULL,'Activa');

/*Table structure for table `tipo_vendedor` */

DROP TABLE IF EXISTS `tipo_vendedor`;

CREATE TABLE `tipo_vendedor` (
  `id_tipo` varchar(30) NOT NULL,
  `descrip` varchar(30) DEFAULT NULL,
  `nombre_grupo` varchar(30) DEFAULT NULL,
  `meta_base_coef` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_tipo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `tipo_vendedor` */

insert  into `tipo_vendedor`(`id_tipo`,`descrip`,`nombre_grupo`,`meta_base_coef`) values ('1','Todos','Todos',5000000);

/*Table structure for table `unidades_medida` */

DROP TABLE IF EXISTS `unidades_medida`;

CREATE TABLE `unidades_medida` (
  `um_cod` varchar(10) NOT NULL,
  `um_prior` int(11) DEFAULT NULL,
  `um_descri` varchar(30) DEFAULT NULL,
  `um_ref` varchar(4) DEFAULT NULL,
  `um_mult` decimal(16,3) DEFAULT NULL,
  PRIMARY KEY (`um_cod`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `unidades_medida` */

/*Table structure for table `usos` */

DROP TABLE IF EXISTS `usos`;

CREATE TABLE `usos` (
  `cod_uso` int(11) NOT NULL AUTO_INCREMENT,
  `descrip` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`cod_uso`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `usos` */

/*Table structure for table `usuarios` */

DROP TABLE IF EXISTS `usuarios`;

CREATE TABLE `usuarios` (
  `usuario` varchar(30) NOT NULL,
  `passw` varchar(80) NOT NULL,
  `hash` varchar(30) DEFAULT NULL,
  `doc` varchar(30) DEFAULT NULL,
  `nombre` varchar(30) DEFAULT NULL,
  `apellido` varchar(30) DEFAULT NULL,
  `tel` varchar(30) DEFAULT NULL,
  `email` varchar(60) DEFAULT NULL,
  `pais` varchar(60) DEFAULT NULL,
  `dir` varchar(120) DEFAULT NULL,
  `fecha_nac` date DEFAULT NULL,
  `fecha_cont` date DEFAULT NULL,
  `limite_sesion` int(11) DEFAULT NULL,
  `imagen` varchar(100) DEFAULT NULL,
  `suc` varchar(10) DEFAULT NULL,
  `profesion` varchar(60) DEFAULT NULL,
  `cargo` varchar(60) DEFAULT NULL,
  `hora_entrada` varchar(6) DEFAULT NULL,
  `hora_salida` varchar(6) DEFAULT NULL,
  `id_tipo` varchar(30) DEFAULT NULL,
  `sueldo_fijo` double(18,0) DEFAULT NULL,
  `sueldo_contable` double(18,0) DEFAULT NULL,
  `estado` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`usuario`),
  KEY `Reftipo_vendedor225` (`id_tipo`),
  CONSTRAINT `Reftipo_vendedor225` FOREIGN KEY (`id_tipo`) REFERENCES `tipo_vendedor` (`id_tipo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `usuarios` */

insert  into `usuarios`(`usuario`,`passw`,`hash`,`doc`,`nombre`,`apellido`,`tel`,`email`,`pais`,`dir`,`fecha_nac`,`fecha_cont`,`limite_sesion`,`imagen`,`suc`,`profesion`,`cargo`,`hora_entrada`,`hora_salida`,`id_tipo`,`sueldo_fijo`,`sueldo_contable`,`estado`) values ('douglas','2e6060b4c6b95c2ee886735b669eae29ab1d3113','94BA5ACF','4933243','Doglas Antonio','Dembogurski Feix','0983-593615','dembogurski@gmail.com','PY','Cap.Miranda','1980-09-02',NULL,9999,NULL,'01',NULL,NULL,NULL,NULL,'1',NULL,NULL,'Activo');

/*Table structure for table `usuarios_x_grupo` */

DROP TABLE IF EXISTS `usuarios_x_grupo`;

CREATE TABLE `usuarios_x_grupo` (
  `usuario` varchar(30) NOT NULL,
  `id_grupo` int(11) NOT NULL,
  PRIMARY KEY (`usuario`,`id_grupo`),
  KEY `Refgrupos100` (`id_grupo`),
  CONSTRAINT `Refgrupos100` FOREIGN KEY (`id_grupo`) REFERENCES `grupos` (`id_grupo`),
  CONSTRAINT `Refusuarios98` FOREIGN KEY (`usuario`) REFERENCES `usuarios` (`usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `usuarios_x_grupo` */

insert  into `usuarios_x_grupo`(`usuario`,`id_grupo`) values ('douglas',3);

/*Table structure for table `usuarios_x_suc` */

DROP TABLE IF EXISTS `usuarios_x_suc`;

CREATE TABLE `usuarios_x_suc` (
  `suc` varchar(10) NOT NULL,
  `usuario` varchar(30) NOT NULL,
  PRIMARY KEY (`suc`,`usuario`),
  KEY `Refusuarios114` (`usuario`),
  CONSTRAINT `Refsucursales113` FOREIGN KEY (`suc`) REFERENCES `sucursales` (`suc`),
  CONSTRAINT `Refusuarios114` FOREIGN KEY (`usuario`) REFERENCES `usuarios` (`usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `usuarios_x_suc` */

insert  into `usuarios_x_suc`(`suc`,`usuario`) values ('01','douglas');
insert  into `usuarios_x_suc`(`suc`,`usuario`) values ('02','douglas');
insert  into `usuarios_x_suc`(`suc`,`usuario`) values ('03','douglas');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
