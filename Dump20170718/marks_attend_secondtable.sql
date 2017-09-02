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
-- Table structure for table `secondtable`
--

DROP TABLE IF EXISTS `secondtable`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `secondtable` (
  `fac_id` varchar(20) NOT NULL,
  `program` varchar(10) NOT NULL,
  `branch` varchar(10) NOT NULL,
  `sub_code` varchar(10) NOT NULL,
  `accdyear` varchar(45) NOT NULL,
  `section` varchar(45) NOT NULL,
  `semester` varchar(45) NOT NULL,
  `specialization` varchar(45) DEFAULT NULL,
  `regl_no` varchar(5) NOT NULL,
  PRIMARY KEY (`fac_id`,`program`,`branch`,`accdyear`,`section`,`semester`,`sub_code`,`regl_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `secondtable`
--

LOCK TABLES `secondtable` WRITE;
/*!40000 ALTER TABLE `secondtable` DISABLE KEYS */;
INSERT INTO `secondtable` VALUES ('cshanti','1A','5','13CT1124','2016-17','1','6',NULL,'R13'),('ganesh','1A','5','15CS1109','2016-17','1','4',NULL,'R15'),('ganesh','1A','5','13CS1103','2016-17','1','6',NULL,'R15'),('ganesh','1A','5','15CT1109','2016-17','2','4',NULL,'R15'),('padmavathi','1A','12','13ES11BC','2016-17','1','6',NULL,'R13'),('padmavathi','1A','12','13CT1123','2016-17','2','6',NULL,'R13'),('padmavathi','1A','12','15CT1104','2016-17','3','3',NULL,'R15'),('padmavathi','1A','5','13CT1122','2016-17','1','6',NULL,'R15'),('sanoop','1A','5','15CT1109','2016-17','2','4',NULL,'R15'),('sowmya','1A','3','15EC1105','2016-17','3','3',NULL,'R15'),('sowmya','1A','5','13HM1102','2016-17','1','6',NULL,'R15'),('vasishta','1A','5','13CS1102','2016-17','1','6',NULL,'R15'),('vasishta','1A','5','15BC1103','2016-17','4','3',NULL,'R15');
/*!40000 ALTER TABLE `secondtable` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-07-18 15:07:34
