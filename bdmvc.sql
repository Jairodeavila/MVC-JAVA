/*
SQLyog Ultimate v13.1.1 (64 bit)
MySQL - 10.4.28-MariaDB : Database - dbmvc
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`dbmvc` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */;

USE `dbmvc`;

/*Table structure for table `factura` */

DROP TABLE IF EXISTS `factura`;

CREATE TABLE `factura` (
  `FACT_ID` varchar(100) NOT NULL,
  `ENC_ID_FK` varchar(100) NOT NULL,
  `TOTAL_COM` int(11) NOT NULL,
  `FACT_FECH` date NOT NULL,
  PRIMARY KEY (`FACT_ID`),
  KEY `id_VentaFK` (`ENC_ID_FK`),
  CONSTRAINT `factura_ibfk_3` FOREIGN KEY (`ENC_ID_FK`) REFERENCES `encabezado` (`ENC_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `factura` */

/*Table structure for table `fotos` */

DROP TABLE IF EXISTS `fotos`;

CREATE TABLE `fotos` (
  `FOT_ID` int(11) NOT NULL AUTO_INCREMENT,
  `FOT_NOMBRE` varchar(255) NOT NULL,
  `FOT_URL` varchar(255) NOT NULL,
  `PROD_IDFK` int(11) DEFAULT NULL,
  PRIMARY KEY (`FOT_ID`),
  KEY `PROD_IDFK` (`PROD_IDFK`),
  CONSTRAINT `fotos_ibfk_1` FOREIGN KEY (`PROD_IDFK`) REFERENCES `productos` (`PROD_ID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `fotos` */

/*Table structure for table `proveedor` */

DROP TABLE IF EXISTS `proveedor`;

CREATE TABLE `proveedor` (
  `PROV_ID` varchar(100) NOT NULL,
  `PROV_NOM` varchar(30) DEFAULT NULL,
  `PROV_CONTACTO` date DEFAULT NULL,
  `PROV_EST` char(1) DEFAULT NULL COMMENT '1:ACTIVO, 2 INACTIVO, 3:SUSPENDIDO',
  PRIMARY KEY (`PROV_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `proveedor` */

/*Table structure for table `proveedors` */

DROP TABLE IF EXISTS `proveedors`;

CREATE TABLE `proveedors` (
  `PROV_ID` varchar(100) NOT NULL,
  `PROV_NOM` varchar(30) DEFAULT NULL,
  `PROV_CONTACTO` date DEFAULT NULL,
  `PROV_EST` char(1) DEFAULT NULL COMMENT '1:ACTIVO, 2 INACTIVO, 3:SUSPENDIDO',
  `createdAt` datetime DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL,
  PRIMARY KEY (`PROV_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `proveedors` */

insert  into `proveedors`(`PROV_ID`,`PROV_NOM`,`PROV_CONTACTO`,`PROV_EST`,`createdAt`,`updatedAt`) values 
('9p6b9dolu1f5b9z','Proveedor32323231','2022-01-01','A','2024-03-21 16:00:24','2024-03-21 16:11:48'),
('9p6bfhglu1cd6tl','Proveedor 1','2022-01-01','A','2024-03-21 14:42:33','2024-03-21 14:42:33');

/*Table structure for table `roles` */

DROP TABLE IF EXISTS `roles`;

CREATE TABLE `roles` (
  `Id_Rol` int(11) NOT NULL AUTO_INCREMENT,
  `Nom_Rol` varchar(255) DEFAULT NULL,
  `createdAt` datetime DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL,
  PRIMARY KEY (`Id_Rol`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `roles` */

insert  into `roles`(`Id_Rol`,`Nom_Rol`,`createdAt`,`updatedAt`) values 
(1,'Admin',NULL,NULL),
(2,'Empleado',NULL,NULL),
(3,'Cliente',NULL,'2024-03-21 00:34:44');

/*Table structure for table `t_programa` */

DROP TABLE IF EXISTS `t_programa`;

CREATE TABLE `t_programa` (
  `PRO_ID` int(100) NOT NULL AUTO_INCREMENT,
  `PRO_UID` varchar(100) DEFAULT NULL,
  `PRO_NOMBRE` varchar(100) NOT NULL,
  `PRO_CODIGO` varchar(100) NOT NULL,
  PRIMARY KEY (`PRO_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=83 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `t_programa` */

insert  into `t_programa`(`PRO_ID`,`PRO_UID`,`PRO_NOMBRE`,`PRO_CODIGO`) values 
(79,'65df39c7b1','SISTEMAS','2620654'),
(81,'1b23c3a9-a00c-42f6-92b9-ad7a6c9cd47a','202020','jairo'),
(82,'48d03dad-0abd-41c9-9527-bba6f3d9bf7c','adsoooo','202023');

/*Table structure for table `t_usu_pro` */

DROP TABLE IF EXISTS `t_usu_pro`;

CREATE TABLE `t_usu_pro` (
  `USPRO_ID` int(100) NOT NULL AUTO_INCREMENT,
  `USPRO_UID` varchar(100) DEFAULT NULL,
  `USPRO_USU_ID` int(100) DEFAULT NULL,
  `USPRO_PRO_ID` int(100) DEFAULT NULL,
  `USPRO_FCH_INS` date DEFAULT NULL,
  PRIMARY KEY (`USPRO_ID`),
  KEY `t_usu_pro_ibfk_1` (`USPRO_USU_ID`),
  KEY `t_usu_pro_ibfk_2` (`USPRO_PRO_ID`),
  CONSTRAINT `t_usu_pro_ibfk_1` FOREIGN KEY (`USPRO_USU_ID`) REFERENCES `t_usuario` (`USU_ID`),
  CONSTRAINT `t_usu_pro_ibfk_2` FOREIGN KEY (`USPRO_PRO_ID`) REFERENCES `t_programa` (`PRO_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `t_usu_pro` */

insert  into `t_usu_pro`(`USPRO_ID`,`USPRO_UID`,`USPRO_USU_ID`,`USPRO_PRO_ID`,`USPRO_FCH_INS`) values 
(8,'65e74777ad',54,79,'2024-03-05');

/*Table structure for table `t_usuario` */

DROP TABLE IF EXISTS `t_usuario`;

CREATE TABLE `t_usuario` (
  `USU_ID` int(100) NOT NULL AUTO_INCREMENT,
  `USU_UID` varchar(100) DEFAULT NULL,
  `USU_NOMBRES` varchar(100) NOT NULL,
  `USU_APELLIDOS` varchar(100) NOT NULL,
  `USU_EMAIL` varchar(100) NOT NULL,
  `USU_PASSWORD` varchar(100) NOT NULL,
  `USU_ROL` tinyint(100) DEFAULT NULL,
  `USU_TELEFONO` varchar(100) NOT NULL,
  PRIMARY KEY (`USU_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `t_usuario` */

insert  into `t_usuario`(`USU_ID`,`USU_UID`,`USU_NOMBRES`,`USU_APELLIDOS`,`USU_EMAIL`,`USU_PASSWORD`,`USU_ROL`,`USU_TELEFONO`) values 
(47,'65d4ae2c94','Santiago','Alvarez','alvasanti@gmail.com','40bd001563085fc35165329ea1ff5c5ecbdbbeef',1,'3216533775'),
(54,'65d6254570','Johana','Pertuz','margarita@gmail.com','40bd001563085fc35165329ea1ff5c5ecbdbbeef',1,'3214567896'),
(55,'65de04166f','Dina','De la Hoz','dina@gmail.com','40bd001563085fc35165329ea1ff5c5ecbdbbeef',3,'3214567896');

/*Table structure for table `usuarios` */

DROP TABLE IF EXISTS `usuarios`;

CREATE TABLE `usuarios` (
  `Id_User` varchar(100) NOT NULL,
  `Nom_User` varchar(255) DEFAULT NULL,
  `Ape_User` varchar(255) DEFAULT NULL,
  `Tel_User` varchar(20) DEFAULT NULL,
  `Ema_User` varchar(255) DEFAULT NULL,
  `Pass_User` varchar(255) DEFAULT NULL,
  `Id_Rol_FK` int(11) DEFAULT NULL,
  `Fot_User` varchar(255) DEFAULT NULL,
  `Est_Email_User` int(1) DEFAULT 0 COMMENT '0: No verificado, 1: verificado',
  `createdAt` datetime DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL,
  PRIMARY KEY (`Id_User`),
  KEY `Id_Rol_FK` (`Id_Rol_FK`),
  CONSTRAINT `usuarios_ibfk_1` FOREIGN KEY (`Id_Rol_FK`) REFERENCES `roles` (`Id_Rol`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `usuarios` */

insert  into `usuarios`(`Id_User`,`Nom_User`,`Ape_User`,`Tel_User`,`Ema_User`,`Pass_User`,`Id_Rol_FK`,`Fot_User`,`Est_Email_User`,`createdAt`,`updatedAt`) values 
('hle1ffcmolul8uo6n','petro','perez',NULL,'yoinerpertuz@gmail.com','$2b$10$vK83JCqzwie8eda4lwaxw.cL2TNsAdWzR9mbfnOlZ/z9vkv3/OhV6',1,NULL,0,'2024-04-04 12:59:33','2024-04-04 12:59:33');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
