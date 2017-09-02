-- MySQL dump 10.13  Distrib 5.6.23, for Win32 (x86)
--
-- Host: localhost    Database: marks_attend
-- ------------------------------------------------------
-- Server version	5.6.25-log

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
-- Table structure for table `thirdtable`
--

DROP TABLE IF EXISTS `thirdtable`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `thirdtable` (
  `fac_id` varchar(20) NOT NULL,
  `fac_name` varchar(50) NOT NULL,
  `department` char(20) NOT NULL,
  `username` varchar(50) NOT NULL,
  `pwd` varchar(20) NOT NULL,
  `level` varchar(45) NOT NULL,
  `access` varchar(45) NOT NULL,
  `designation` varchar(40) NOT NULL DEFAULT 'Assistant Professor',
  PRIMARY KEY (`fac_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `thirdtable`
--

LOCK TABLES `thirdtable` WRITE;
/*!40000 ALTER TABLE `thirdtable` DISABLE KEYS */;
INSERT INTO `thirdtable` VALUES ('cshanti','Shanti','CSE','cshanti','cshanti','2','1','Professor'),('ganesh','Ganesh','ECE','ganesh','qwerty','2','1','temp'),('padmavathi','Padmavathi','IT','padmavathi','qwerty','2','1','temp'),('sanoop','sanoop','CSE','sanoop','sanoop','2','1','temp'),('sowmya','Sowmya','MECH','sowmya','qwerty','2','1','temp'),('vasishta','Vasishta','CSE','vasishta','abc','2','1','temp');
/*!40000 ALTER TABLE `thirdtable` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-07-18 15:07:38
