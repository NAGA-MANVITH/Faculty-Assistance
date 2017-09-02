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
-- Table structure for table `schemas_status`
--

DROP TABLE IF EXISTS `schemas_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `schemas_status` (
  `acad_year` varchar(45) NOT NULL,
  `program` varchar(45) DEFAULT NULL,
  `branch` varchar(45) DEFAULT NULL,
  `semester` varchar(45) DEFAULT NULL,
  `sub_code` varchar(45) DEFAULT NULL,
  `section` varchar(45) DEFAULT NULL,
  `assesment_type` varchar(45) DEFAULT NULL,
  `assesment_method` varchar(45) DEFAULT NULL,
  `assesment_number` varchar(45) DEFAULT NULL,
  `fac_id` varchar(45) DEFAULT NULL,
  `schema_used` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schemas_status`
--

LOCK TABLES `schemas_status` WRITE;
/*!40000 ALTER TABLE `schemas_status` DISABLE KEYS */;
INSERT INTO `schemas_status` VALUES ('2016-17','1A','5','6','13CS1102','1','test','','1','vasishta','schemaId20170421142803'),('2016-17','1A','5','6','13CS1102','1','test','','2','vasishta','schemaId20170421143057'),('2016-17','1A','5','6','13CS1102','1','assesment','Assignment','1','vasishta','schemaId20170421171521'),('2016-17','1A','5','4','15CT1109','2','test','','1','sanoop','schemaId20170424113302'),('2016-17','1A','5','4','15CT1109','2','test','','1','sanoop','schemaId20170424113433'),('2016-17','1A','5','6','13CT1124','1','test','','2','cshanti','schemaId20170607093410'),('2016-17','1A','5','6','13CT1124','1','assesment','Quiz','1','cshanti','schemaId20170607133743'),('2016-17','1A','5','6','13CT1124','1','assesment','Quiz','2','cshanti','schemaId20170607135042'),('2016-17','1A','5','6','13CT1124','1','assesment','Assignment','1','cshanti','schemaId20170607141832'),('2016-17','1A','5','6','1','1','assesment','Quiz','4','cshanti','schemaId20170608100041'),('2016-17','1A','5','6','13CT1124','1','assesment','Quiz','3','cshanti','schemaId20170608100147'),('2016-17','1A','5','6','1','1','assesment','Assignment','4','cshanti','schemaId20170608101053'),('2016-17','1A','5','6','13CT1124','1','assesment','Assignment','4','cshanti','schemaId20170608101155'),('2016-17','1A','5','6','13CT1124','1','test','','1','cshanti','schemaId20170608111731');
/*!40000 ALTER TABLE `schemas_status` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-07-18 15:07:36
