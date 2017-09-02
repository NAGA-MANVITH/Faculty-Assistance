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
-- Table structure for table `course_outcomes`
--

DROP TABLE IF EXISTS `course_outcomes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `course_outcomes` (
  `sno` int(11) NOT NULL AUTO_INCREMENT,
  `fac_id` varchar(45) DEFAULT NULL,
  `acad_year` varchar(45) DEFAULT NULL,
  `program` varchar(45) DEFAULT NULL,
  `branch` varchar(45) DEFAULT NULL,
  `semester` varchar(45) DEFAULT NULL,
  `subject` varchar(45) DEFAULT NULL,
  `section` varchar(45) DEFAULT NULL,
  `assesment_type` varchar(45) DEFAULT NULL,
  `assesment_number` varchar(45) DEFAULT NULL,
  `co1` varchar(45) DEFAULT NULL,
  `co1a` varchar(45) DEFAULT NULL,
  `co1p` varchar(45) DEFAULT NULL,
  `co2` varchar(45) DEFAULT NULL,
  `co2a` varchar(45) DEFAULT NULL,
  `co2p` varchar(45) DEFAULT NULL,
  `co3` varchar(45) DEFAULT NULL,
  `co3a` varchar(45) DEFAULT NULL,
  `co3p` varchar(45) DEFAULT NULL,
  `co4` varchar(45) DEFAULT NULL,
  `co4a` varchar(45) DEFAULT NULL,
  `co4p` varchar(45) DEFAULT NULL,
  `co5` varchar(45) DEFAULT NULL,
  `co5a` varchar(45) DEFAULT NULL,
  `co5p` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`sno`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course_outcomes`
--

LOCK TABLES `course_outcomes` WRITE;
/*!40000 ALTER TABLE `course_outcomes` DISABLE KEYS */;
INSERT INTO `course_outcomes` VALUES (1,'vasishta','2016-17','1A','5','6','13CS1102','1','test','1','0.75','4','3','','0','0','0.75','8','6','','0','0','','0','0'),(2,'vasishta','2016-17','1A','5','6','13CS1102','1','assesment','1','0.6666666666666666','3','2','','0','0','0.5','2','1','1','1','1','','0','0'),(3,'sanoop','2016-17','1A','5','4','15CT1109','2','test','1','','0','0','','0','0','','0','0','','0','0','','0','0'),(4,'cshanti','2016-17','1A','5','6','13CT1124','1','test','2','','0','0','','0','0','0.6458333333333334','96','62','0.8272727272727273','110','91','0.9191176470588235','136','125'),(5,'cshanti','2016-17','1A','5','6','13CT1124','1','assesment','1','1.0814814814814815','135','146','1','186','186','','0','0','','0','0','','0','0'),(6,'cshanti','2016-17','1A','5','6','13CT1124','1','assesment','2','','0','0','','0','0','0.1232876712328767','73','9','','0','0','','0','0'),(7,'cshanti','2016-17','1A','5','6','13CT1124','1','assesment','3','','0','0','','0','0','','0','0','0.3835616438356164','73','28','','0','0'),(8,'cshanti','2016-17','1A','5','6','13CT1124','1','assesment','4','','0','0','','0','0','','0','0','','0','0','0.8493150684931506','73','62'),(9,'cshanti','2016-17','1A','5','6','13CT1124','1','test','1','0.7983193277310925','119','95','0.68','175','119','','0','0','','0','0','','0','0');
/*!40000 ALTER TABLE `course_outcomes` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-07-18 15:07:37
