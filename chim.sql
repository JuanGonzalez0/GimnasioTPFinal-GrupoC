-- MySQL dump 10.13  Distrib 8.0.26, for Win64 (x86_64)
--
-- Host: localhost    Database: chim
-- ------------------------------------------------------
-- Server version	8.0.26

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
-- Table structure for table `historial_progreso`
--

DROP TABLE IF EXISTS `historial_progreso`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `historial_progreso` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_persona` int DEFAULT NULL,
  `altura` double DEFAULT NULL,
  `peso` double DEFAULT NULL,
  `asistencia` int DEFAULT NULL,
  `fecha_registro` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `historial_progreso`
--

LOCK TABLES `historial_progreso` WRITE;
/*!40000 ALTER TABLE `historial_progreso` DISABLE KEYS */;
INSERT INTO `historial_progreso` VALUES (1,2,160,7,2,'2023-11-05 20:12:38'),(2,2,700,600,3,'2023-11-05 20:13:46'),(3,1,123,123,33,'2023-11-05 20:51:24'),(4,1,5000,500,2222,'2023-11-06 11:45:14'),(5,4,176,70,1,'2023-11-06 12:07:25'),(6,4,180,80,2,'2023-11-06 12:08:51');
/*!40000 ALTER TABLE `historial_progreso` ENABLE KEYS */;
UNLOCK TABLES;

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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `miembro`
--

LOCK TABLES `miembro` WRITE;
/*!40000 ALTER TABLE `miembro` DISABLE KEYS */;
INSERT INTO `miembro` VALUES (1,1,'ser roni culeman',1),(2,2,'saslol',0),(3,3,'22',1),(4,4,'estar guigante',1);
/*!40000 ALTER TABLE `miembro` ENABLE KEYS */;
UNLOCK TABLES;

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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `persona`
--

LOCK TABLES `persona` WRITE;
/*!40000 ALTER TABLE `persona` DISABLE KEYS */;
INSERT INTO `persona` VALUES (1,'juan','gonzalez','Masculino','123'),(2,'josue','bieber','Masculino','321'),(3,'gilberto','sas','Femenino','333'),(4,'Carlos','Rodriguez','Masculino','1234');
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
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `progreso`
--

LOCK TABLES `progreso` WRITE;
/*!40000 ALTER TABLE `progreso` DISABLE KEYS */;
INSERT INTO `progreso` VALUES (1,1,170,60,1,'2023-11-05 17:38:23'),(2,1,170,67,2,'2023-11-05 17:39:00'),(3,2,198,2222,1,'2023-11-05 20:09:39'),(4,2,160,7,2,'2023-11-05 20:12:38'),(5,2,700,600,3,'2023-11-05 20:13:46'),(6,2,2312,123123,123,'2023-11-05 20:24:37'),(7,3,2323,2323,232,'2023-11-05 20:26:08'),(8,3,2323,2323,232,'2023-11-05 20:26:24'),(9,3,777,777,777,'2023-11-05 20:26:38'),(10,3,67,45,33,'2023-11-05 20:27:06'),(11,1,123,1231,213,'2023-11-05 20:34:27'),(12,2,213,1231,21313,'2023-11-05 20:34:58'),(13,1,213,213,213,'2023-11-05 20:35:30'),(14,1,170,60,1,'2023-11-05 20:44:44'),(15,1,172,67,2,'2023-11-05 20:45:17'),(16,1,123,123,33,'2023-11-05 20:51:24'),(17,1,5000,500,2222,'2023-11-06 11:45:14'),(18,4,176,70,1,'2023-11-06 12:07:25'),(19,4,180,80,2,'2023-11-06 12:08:51');
/*!40000 ALTER TABLE `progreso` ENABLE KEYS */;
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `antes_de_insertar_progreso` BEFORE INSERT ON `progreso` FOR EACH ROW BEGIN
    INSERT INTO historial_progreso (id_persona, altura, peso, asistencia, fecha_registro)
    VALUES (NEW.id_persona, NEW.altura, NEW.peso, NEW.asistencia, NOW());
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-11-06  9:27:43
