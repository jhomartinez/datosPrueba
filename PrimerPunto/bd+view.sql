-- MySQL dump 10.13  Distrib 5.7.29, for Linux (x86_64)
--
-- Host: 127.0.0.1    Database: empresa
-- ------------------------------------------------------
-- Server version	5.7.29-0ubuntu0.18.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `Conductores`
--

DROP TABLE IF EXISTS `Conductores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Conductores` (
  `codigoC` varchar(12) NOT NULL COMMENT 'Es la llave primaria de la tabla Conductores.',
  `nombre` varchar(45) NOT NULL COMMENT 'Es el nombre del conductor.',
  `municipio` varchar(45) NOT NULL COMMENT 'Es el nombre del municipio al que pertenece el conductor.',
  `categoria` varchar(45) NOT NULL COMMENT 'Es la categoria a la que puede tener el conductor.',
  PRIMARY KEY (`codigoC`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Es la tabla que permite almacenar la informacion de los conductores.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Conductores`
--

LOCK TABLES `Conductores` WRITE;
/*!40000 ALTER TABLE `Conductores` DISABLE KEYS */;
INSERT INTO `Conductores` VALUES ('1','Carlos','Pasto','C1'),('2','Rosa','Pasto','C1'),('3','Jhon','Pasto','B1'),('4','Graciela','Cali','C1');
/*!40000 ALTER TABLE `Conductores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Maquinas`
--

DROP TABLE IF EXISTS `Maquinas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Maquinas` (
  `codigoM` varchar(12) NOT NULL COMMENT 'Es la llave primaria de la tabla Maquinas.',
  `nombre` varchar(45) NOT NULL COMMENT 'Es el nombre de la maquina.',
  `precio_hora` double NOT NULL COMMENT 'Es el precio de la maquina por cada hora',
  PRIMARY KEY (`codigoM`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Es la tabla que almacena los datos de las maquinas.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Maquinas`
--

LOCK TABLES `Maquinas` WRITE;
/*!40000 ALTER TABLE `Maquinas` DISABLE KEYS */;
INSERT INTO `Maquinas` VALUES ('1','Tractor',1500),('2','Tractor',10000),('3','Excavadora',1000),('4','Tractor-Grande',10000),('5','Tractor',10000),('6','Aplanadora',5000),('7','Allanadora',3000),('8','Cortadora',2000);
/*!40000 ALTER TABLE `Maquinas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Proyectos`
--

DROP TABLE IF EXISTS `Proyectos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Proyectos` (
  `codigoP` varchar(20) NOT NULL COMMENT 'Es la llave primaria de la tabla Proyectos',
  `descripcion` varchar(50) DEFAULT NULL COMMENT 'Es la descripcion del proyecto.',
  `minicipio` varchar(30) NOT NULL COMMENT 'Es el municipio donde se realiza el proyecto',
  `cliente` varchar(25) NOT NULL COMMENT 'Es el cliente que contrata el proyecto',
  PRIMARY KEY (`codigoP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Es la tabla que almacena los proyectos.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Proyectos`
--

LOCK TABLES `Proyectos` WRITE;
/*!40000 ALTER TABLE `Proyectos` DISABLE KEYS */;
INSERT INTO `Proyectos` VALUES ('1','proyecto X','Pasto','Henry Pulido'),('2','proyecto Q','Cali','Graciela Pulido'),('3','proyecto Y','Pasto','Jhon Pulido'),('4','proyecto Z','Pasto','Rosa Pulido'),('5','proyecto A','Pasto','Ricardo Rengifo'),('6','proyecto B','Cali','Oscar Chavarro'),('7','proyecto C','Pasto','Claudia Delgado');
/*!40000 ALTER TABLE `Proyectos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Trabajos`
--

DROP TABLE IF EXISTS `Trabajos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Trabajos` (
  `codigC` varchar(12) NOT NULL COMMENT 'Es la llave foranea de la tabla Conductores.',
  `codigoM` varchar(12) NOT NULL COMMENT 'Es la llave foranea de la tabla Maquinas.',
  `codigoP` varchar(20) NOT NULL COMMENT 'Es la llave foranea de la tabla Proyectos.',
  `fecha` date NOT NULL COMMENT 'Es fecha cuando se realiza el trabajo.',
  `tiempo` int(11) DEFAULT NULL COMMENT 'Es el tiempo cuando se realiza el trabajo.',
  KEY `FK_CONDUCTORES_TRABAJOS_idx` (`codigC`),
  KEY `FK_MAQUINAS_TRABAJOS_idx` (`codigoM`),
  KEY `FK_PROYECTOS_TRABAJOS_idx` (`codigoP`),
  CONSTRAINT `FK_CONDUCTORES_TRABAJOS` FOREIGN KEY (`codigC`) REFERENCES `Conductores` (`codigoC`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_MAQUINAS_TRABAJOS` FOREIGN KEY (`codigoM`) REFERENCES `Maquinas` (`codigoM`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_PROYECTOS_TRABAJOS` FOREIGN KEY (`codigoP`) REFERENCES `Proyectos` (`codigoP`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Es la tabla que almacena cada trabajo realizado por la empresa.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Trabajos`
--

LOCK TABLES `Trabajos` WRITE;
/*!40000 ALTER TABLE `Trabajos` DISABLE KEYS */;
INSERT INTO `Trabajos` VALUES ('1','1','1','2019-11-12',1200),('1','3','2','2018-10-12',1400),('1','8','6','2018-12-12',1300),('4','6','3','2017-12-11',1300),('4','3','4','2019-12-12',1500),('4','3','7','2017-12-12',1300),('3','8','5','2017-12-12',1300),('4','1','6','2020-02-12',100);
/*!40000 ALTER TABLE `Trabajos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `general`
--

DROP TABLE IF EXISTS `general`;
/*!50001 DROP VIEW IF EXISTS `general`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `general` AS SELECT 
 1 AS `nombre`,
 1 AS `descripcion`,
 1 AS `Tiempo Trabajado`*/;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `general`
--

/*!50001 DROP VIEW IF EXISTS `general`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `general` AS select `c`.`nombre` AS `nombre`,`p`.`descripcion` AS `descripcion`,avg(`t`.`tiempo`) AS `Tiempo Trabajado` from ((`Conductores` `c` join `Proyectos` `p`) join `Trabajos` `t`) where ((`t`.`codigC` = `c`.`codigoC`) and (`t`.`codigoP` = `p`.`codigoP`)) group by `c`.`nombre`,`p`.`descripcion` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-03-18 14:48:59
