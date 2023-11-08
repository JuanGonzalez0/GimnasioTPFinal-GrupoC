-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: localhost    Database: chim
-- ------------------------------------------------------
-- Server version	8.0.34

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `miembro`
--

DROP TABLE IF EXISTS `miembro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `miembro` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_persona` int DEFAULT NULL,
  `objetivo` varchar(255) DEFAULT NULL,
  `plan_alimentacion` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_persona` (`id_persona`),
  CONSTRAINT `miembro_ibfk_1` FOREIGN KEY (`id_persona`) REFERENCES `persona` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `miembro`
--

LOCK TABLES `miembro` WRITE;
/*!40000 ALTER TABLE `miembro` DISABLE KEYS */;
INSERT INTO `miembro` VALUES (1,1,'ser roni culeman',1),(2,2,'saslol',0),(3,3,'22',1),(4,4,'ola',1),(5,5,'quien soy',1),(6,7,'caca',1);
/*!40000 ALTER TABLE `miembro` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `after_insert_miembro` AFTER INSERT ON `miembro` FOR EACH ROW BEGIN
  IF NEW.plan_alimentacion = 1 THEN
    INSERT INTO tiene_plan_alimentacion (id_persona, nombre)
    SELECT NEW.id_persona, p.nombre
    FROM persona p
    WHERE p.id = NEW.id_persona;
  END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `after_update_miembro` AFTER UPDATE ON `miembro` FOR EACH ROW BEGIN
  IF NEW.plan_alimentacion = 1 THEN
    SET @usuario_nombre = (SELECT nombre FROM persona WHERE id = NEW.id_persona);
    INSERT INTO tiene_plan_alimentacion (id_persona, nombre)
    VALUES (NEW.id_persona, @usuario_nombre);
  END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `persona`
--

DROP TABLE IF EXISTS `persona`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `persona` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) DEFAULT NULL,
  `apellido` varchar(255) DEFAULT NULL,
  `genero` enum('Masculino','Femenino','Otro') DEFAULT NULL,
  `contrasena` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `persona`
--

LOCK TABLES `persona` WRITE;
/*!40000 ALTER TABLE `persona` DISABLE KEYS */;
INSERT INTO `persona` VALUES (1,'juan','gonzalez','Masculino','123'),(2,'josue','bieber','Masculino','321'),(3,'gilberto','sas','Femenino','333'),(4,'ramiro','ramirez','Masculino','111'),(5,'aldo','morales','Otro','222'),(6,'dr.fabio','mel','Masculino','444'),(7,'fede','fede','Masculino','1212');
/*!40000 ALTER TABLE `persona` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `progreso`
--

DROP TABLE IF EXISTS `progreso`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `progreso` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_persona` int DEFAULT NULL,
  `altura` double DEFAULT NULL,
  `peso` double DEFAULT NULL,
  `asistencia` int DEFAULT NULL,
  `fecha_registro` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `id_persona` (`id_persona`),
  CONSTRAINT `progreso_ibfk_1` FOREIGN KEY (`id_persona`) REFERENCES `persona` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `progreso`
--

LOCK TABLES `progreso` WRITE;
/*!40000 ALTER TABLE `progreso` DISABLE KEYS */;
INSERT INTO `progreso` VALUES (1,1,170,60,1,'2023-11-05 17:38:23'),(2,1,170,67,2,'2023-11-05 17:39:00'),(3,2,198,2222,1,'2023-11-05 20:09:39'),(4,2,160,7,2,'2023-11-05 20:12:38'),(5,2,700,600,3,'2023-11-05 20:13:46'),(6,2,2312,123123,123,'2023-11-05 20:24:37'),(7,3,2323,2323,232,'2023-11-05 20:26:08'),(8,3,2323,2323,232,'2023-11-05 20:26:24'),(9,3,777,777,777,'2023-11-05 20:26:38'),(10,3,67,45,33,'2023-11-05 20:27:06'),(11,1,123,1231,213,'2023-11-05 20:34:27'),(12,2,213,1231,21313,'2023-11-05 20:34:58'),(13,1,213,213,213,'2023-11-05 20:35:30'),(14,1,170,60,1,'2023-11-05 20:44:44'),(15,1,172,67,2,'2023-11-05 20:45:17'),(16,1,123,123,33,'2023-11-05 20:51:24');
/*!40000 ALTER TABLE `progreso` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tiene_plan_alimentacion`
--

DROP TABLE IF EXISTS `tiene_plan_alimentacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tiene_plan_alimentacion` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_persona` int DEFAULT NULL,
  `nombre` varchar(255) DEFAULT NULL,
  `descripcion` text,
  PRIMARY KEY (`id`),
  KEY `id_persona` (`id_persona`),
  CONSTRAINT `tiene_plan_alimentacion_ibfk_1` FOREIGN KEY (`id_persona`) REFERENCES `persona` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tiene_plan_alimentacion`
--

LOCK TABLES `tiene_plan_alimentacion` WRITE;
/*!40000 ALTER TABLE `tiene_plan_alimentacion` DISABLE KEYS */;
INSERT INTO `tiene_plan_alimentacion` VALUES (1,5,'aldo','pollo'),(2,7,'fede','caldo');
/*!40000 ALTER TABLE `tiene_plan_alimentacion` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-11-08 16:28:30
