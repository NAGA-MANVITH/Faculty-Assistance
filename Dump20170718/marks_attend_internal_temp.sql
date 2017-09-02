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
-- Table structure for table `internal_temp`
--

DROP TABLE IF EXISTS `internal_temp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `internal_temp` (
  `fac_id` varchar(45) DEFAULT NULL,
  `acad_year` varchar(255) NOT NULL,
  `program` varchar(45) DEFAULT NULL,
  `branch` varchar(45) DEFAULT NULL,
  `semester` varchar(45) DEFAULT NULL,
  `sub_code` varchar(45) DEFAULT NULL,
  `section` varchar(45) DEFAULT NULL,
  `assesment_type` varchar(45) DEFAULT NULL,
  `assesment_method` varchar(45) DEFAULT NULL,
  `assesment_number` varchar(45) DEFAULT NULL,
  `temp_marks` longtext
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `internal_temp`
--

LOCK TABLES `internal_temp` WRITE;
/*!40000 ALTER TABLE `internal_temp` DISABLE KEYS */;
INSERT INTO `internal_temp` VALUES ('vasishta','2016-17','1A','5','6','13CS1102','1','test','','1','1;2;3;4;3;4;on;10;10;10;10;10;10;30;on;10;10;10;10;10;10;30;on;10;10;10;10;10;1;30;on;1;1;1;1;1;1;3;on;;;;;;;;on;;;;;;;;on;;;;;;;;on;;;;;;;;on;;;;;;;;on;;;;;;;;on;;;;;;;;on;;;;;;;;on;;;;;;;;on;;;;;;;;on;;;;;;;;on;;;;;;;;on;;;;;;;;on;;;;;;;;on;;;;;;;;on;;;;;;;;on;;;;;;;;on;;;;;;;;on;;;;;;;;on;;;;;;;;on;;;;;;;;on;;;;;;;;on;;;;;;;;on;;;;;;;;on;;;;;;;;on;;;;;;;;on;;;;;;;;on;;;;;;;;on;;;;;;;;on;;;;;;;;on;;;;;;;;on;;;;;;;;on;;;;;;;;on;;;;;;;;on;;;;;;;;on;;;;;;;;on;;;;;;;;on;;;;;;;;on;;;;;;;;on;;;;;;;;on;;;;;;;;on;;;;;;;;on;;;;;;;;on;;;;;;;;on;;;;;;;;on;;;;;;;;on;;;;;;;;on;;;;;;;;on;;;;;;;;on;;;;;;;;on;;;;;;;;on;;;;;;;;on;;;;;;;;on;;;;;;;;on;;;;;;;;on;;;;;;;;on;;;;;;;;on;;;;;;;;on;;;;;;;;on;;;;;;;;on;;;;;;;;on;;;;;;;;on;;;;;;;;on;;;;;;;;on;;;;;;;;on;;;;;;;;on;;;;;;;;on;;;;;;;;on;;;;;;;;'),('vasishta','2016-17','1A','5','6','13CS1102','1','assesment','Assignment','1','1;2;3;4;on;6;6;6;6;12;on;5;1;5;10;15;on;2;1;1;1;3;on;;;;;;on;;;;;;on;;;;;;on;;;;;;on;;;;;;on;;;;;;on;;;;;;on;;;;;;on;;;;;;on;;;;;;on;;;;;;on;;;;;;on;;;;;;on;;;;;;on;;;;;;on;;;;;;on;;;;;;on;;;;;;on;;;;;;on;;;;;;on;;;;;;on;;;;;;on;;;;;;on;;;;;;on;;;;;;on;;;;;;on;;;;;;on;;;;;;on;;;;;;on;;;;;;on;;;;;;on;;;;;;on;;;;;;on;;;;;;on;;;;;;on;;;;;;on;;;;;;on;;;;;;on;;;;;;on;;;;;;on;;;;;;on;;;;;;on;;;;;;on;;;;;;on;;;;;;on;;;;;;on;;;;;;on;;;;;;on;;;;;;on;;;;;;on;;;;;;on;;;;;;on;;;;;;on;;;;;;on;;;;;;on;;;;;;on;;;;;;on;;;;;;on;;;;;;on;;;;;;on;;;;;;on;;;;;;on;;;;;;on;;;;;;on;;;;;;on;;;;;;on;;;;;;on;;;;;;on;;;;;;on;;;;;;'),('cshanti','2016-17','1A','5','6','13CT1124','1','test','','2','3;3;3;3;4;4;4;4;5;5;5;5;undefined;3;0;;;;;0;2;4;4;;;13;undefined;0;;;;;;3;;2;2;;1;7;undefined;3;0;;;2;1;;;1;3;;;10;undefined;0;0;;2;;;0;;2;3;;;7;undefined;;;4;4;4.5;1;;;4.5;3.5;;;22;undefined;1;3.5;;;;;2;3;;;3;1;14;undefined;4;4;;;4;3.5;;;4;3.5;;;23;undefined;;;;;;;0;0.5;2;1;2;;4;undefined;1;2;;;;;2;2;3.5;4;;;15;undefined;3.5;1.5;;;;;4.5;4;4.5;4.5;;;23;undefined;1;;;;;1;;;;;2;0;4;undefined;2;;;;0;;1;;;;3;2;8;undefined;;;4;4.5;4;2;;;3;4;;;22;undefined;4;3;;;;;3;4;4;3;;;21;undefined;4;;;;4.5;;4.5;4.5;2;4.5;;;20;undefined;3;;;4;;;4;4.5;4.5;4;;;21;undefined;;4;;;;;4;;;4;4;;12;undefined;1.5;1;;;;4;;;;3;2.5;;10;undefined;3;4.5;;;;;;1;4;3;;;16;undefined;0;;;;;;1;;3.5;4;;;9;undefined;4.5;1;;;4;4;;;3;4;;;21;undefined;;;;;4;4;;;;;3;;11;undefined;4;4.5;;;;;3;2;;;3;;17;undefined;;;;3;;3.5;;;;;4;2;13;undefined;3;;;;;;4.5;4;2;4.5;;;18;undefined;4.5;4.5;;;;;4.5;4.5;;;4;3;25;undefined;0;4;;;;;1;0;2;4;;;11;undefined;2;;;;;;4;;3;4;;;13;undefined;0;4;;;;;2;1;2;3;;;12;undefined;3;;;;;;3;3;4.5;4.5;;;18;undefined;;;;;;;4;;1;4;;;9;undefined;2;1;;;1;4;;;4.5;4;;;17;undefined;3;3;;;;;4;4;4.5;4;;;23;undefined;0;4;;;;;3;4;3;4.5;;;19;undefined;1;4;;;;;3.5;4;3;4;;;20;undefined;;4.5;;;;;;;4;3;;;12;undefined;;;;;3;;;;3;3;;;9;undefined;1;2;;;4;4.5;;;4.5;3.5;;;20;undefined;;;3;3;;;3.5;;2;4;;;16;undefined;2;1;;;;;4;0;3;4;;;14;undefined;0.5;4;;;4;4;;;3;3;;;19;undefined;;;;1;;;0;2;3;2;;;8;undefined;1;1;;;;;;4.5;4.5;4.5;;;16;undefined;4.5;4;;;;;4;4;4;4;;;25;undefined;1;;;;;2;1;;1;4;;;8;undefined;;;;3.5;3.5;;0.5;;;4;;1;11;undefined;0;4;;;3;4;;;4.5;4;;;20;undefined;2;;;;;;4;4.5;3.5;4;;;18;undefined;3.5;3;;;;;4;4;3;3;;;21;off;;;;;;;;;;;;;0;undefined;;;;;;;5;;4;5;;;14;undefined;4.5;4.5;;;;;4.5;4.5;;;3;4.5;26;undefined;;;;;4;3.5;;;4;4.5;;;16;undefined;0;1;;;;;4.5;;1;3;;;10;undefined;;;;;;;;0;2;3.5;;;6;undefined;1;3;;;;;4.5;4.5;4.5;4.5;;;22;undefined;3;3;;;;;0;4.5;2;;;;13;undefined;4;2;;;;;4.5;4.5;1;3;;;19;undefined;;;;;;0;;;2;4;;;6;undefined;4;2;;;;4.5;;;4.5;4.5;;;20;undefined;;;;;4.5;3;;;1;3;;;12;undefined;3.5;2.5;;;;;;;4;;;;10;undefined;;;;;3;2;;;;4;;;9;undefined;;;;;0;;;;3;3.5;;;7;undefined;1;0;;;1;3;0;0;1;1;;;7;undefined;;;;;;2;;;3;4;;;9;undefined;;1;;;;;1;4.5;3;4.5;;;14;undefined;;;0;1;3;4.5;;;3.5;4;;;16;undefined;;;0;1;4;4;;;2;4.5;;;16;undefined;0;2;;;;;3;3;2;4;;;14;undefined;;;;;;;2;;4;2;;;8;undefined;;;;0;;;0;1;2;3;;;6;undefined;0;3;;;;;1;3;3;4.5;;;15;'),('cshanti','2016-17','1A','5','6','13CT1124','1','assesment','Assignment','1','1;1;2;2;2;undefined;2;2;2;2;2;10;undefined;2;2;2;2;2;10;undefined;2;2;2;2;2;10;undefined;1;0;0;0;0;1;undefined;2;2;2;2;2;10;undefined;2;2;2;2;2;10;undefined;2;2;2;2;2;10;undefined;1;0;0;0;0;1;undefined;2;2;2;2;2;10;undefined;2;2;2;2;2;10;undefined;2;2;2;2;2;10;undefined;2;2;2;2;2;10;undefined;2;2;2;2;2;10;undefined;2;2;2;2;2;10;undefined;2;2;2;2;2;10;undefined;2;2;2;2;2;10;undefined;1;0;0;0;0;1;undefined;2;2;2;2;2;10;undefined;2;2;2;2;2;10;undefined;2;2;2;2;2;10;undefined;2;2;2;2;2;10;undefined;2;2;2;2;2;10;undefined;2;2;2;2;2;10;undefined;2;2;2;2;2;10;undefined;2;2;2;2;2;10;undefined;2;2;2;2;2;10;undefined;2;2;2;2;2;10;undefined;2;2;2;2;2;10;undefined;1;0;0;0;0;1;undefined;2;2;2;2;2;10;undefined;2;2;2;2;2;10;undefined;2;2;2;2;2;10;undefined;2;2;2;2;2;10;undefined;2;2;2;2;2;10;undefined;2;2;2;2;2;10;undefined;2;2;2;2;2;10;undefined;2;2;2;2;2;10;undefined;2;2;2;2;2;10;undefined;2;2;2;2;2;10;undefined;2;2;2;2;2;10;undefined;2;2;2;2;2;10;undefined;2;2;2;2;2;10;undefined;2;2;2;2;2;10;undefined;2;2;2;2;2;10;undefined;1;0;0;0;0;1;undefined;1;0;0;0;0;1;undefined;2;2;2;2;2;10;undefined;2;2;2;2;2;10;undefined;2;2;2;2;2;10;undefined;1;0;0;0;0;1;undefined;2;2;2;2;2;10;undefined;2;2;2;2;2;10;undefined;2;2;2;2;2;10;undefined;2;2;2;2;2;10;undefined;1;0;0;0;0;1;undefined;2;2;2;2;2;10;undefined;1;0;0;0;0;1;undefined;1;0;0;0;0;1;undefined;2;2;2;2;2;10;undefined;2;2;2;2;2;10;undefined;2;2;2;2;2;10;undefined;2;2;2;2;2;10;undefined;2;2;2;2;2;10;undefined;2;2;2;2;2;10;undefined;2;2;2;2;2;10;undefined;2;2;2;2;2;10;undefined;2;2;2;2;2;10;undefined;2;2;2;2;2;10;undefined;1;0;0;0;0;1;undefined;2;2;2;2;2;10;undefined;2;2;2;2;2;10;undefined;2;2;2;2;2;10;undefined;2;2;2;2;2;10;'),('cshanti','2016-17','1A','5','6','13CT1124','1','assesment','Quiz','2','3;undefined;7;7;undefined;3;3;undefined;1;1;undefined;2;2;undefined;9;9;undefined;6;6;undefined;5;5;undefined;1;1;undefined;2;2;undefined;3;3;undefined;1;1;undefined;1;1;undefined;1;1;undefined;3;3;undefined;2;2;undefined;3;3;undefined;7;7;undefined;1;1;undefined;1;1;undefined;1;1;undefined;5;5;undefined;3;3;undefined;3;3;undefined;2;2;undefined;2;2;undefined;7;7;undefined;2;2;undefined;1;1;undefined;1;1;undefined;2;2;undefined;1;1;undefined;5;5;undefined;2;2;undefined;10;10;undefined;1;1;undefined;1;1;undefined;2;2;undefined;1;1;undefined;4;4;undefined;1;1;undefined;3;3;undefined;4;4;undefined;8;8;undefined;3;3;undefined;1;1;undefined;1;1;undefined;2;2;undefined;2;2;undefined;3;3;undefined;1;1;undefined;1;1;undefined;9;9;undefined;3;3;undefined;3;3;undefined;1;1;undefined;4;4;undefined;2;2;undefined;3;3;undefined;1;1;undefined;1;1;undefined;1;1;undefined;8;8;undefined;1;1;undefined;1;1;undefined;2;2;undefined;1;1;undefined;1;1;undefined;1;1;undefined;1;1;undefined;1;1;undefined;2;2;undefined;1;1;undefined;2;2;'),('cshanti','2016-17','1A','5','6','13CT1124','1','assesment','Quiz','3','4;undefined;6;6;undefined;8;8;undefined;1;1;undefined;1;1;undefined;8;8;undefined;1;1;undefined;4;4;undefined;1;1;undefined;2;2;undefined;2;2;undefined;1;1;undefined;4;4;undefined;4;4;undefined;4;4;undefined;4;4;undefined;2;2;undefined;1;1;undefined;1;1;undefined;1;1;undefined;1;1;undefined;1;1;undefined;2;2;undefined;1;1;undefined;1;1;undefined;1;1;undefined;10;10;undefined;4;4;undefined;1;1;undefined;6;6;undefined;4;4;undefined;1;1;undefined;8;8;undefined;1;1;undefined;6;6;undefined;4;4;undefined;1;1;undefined;2;2;undefined;1;1;undefined;1;1;undefined;8;8;undefined;8;8;undefined;1;1;undefined;4;4;undefined;2;2;undefined;2;2;undefined;2;2;undefined;2;2;undefined;4;4;undefined;4;4;undefined;6;6;undefined;6;6;undefined;1;1;undefined;2;2;undefined;1;1;undefined;1;1;undefined;1;1;undefined;1;1;undefined;4;4;undefined;1;1;undefined;2;2;undefined;1;1;undefined;1;1;undefined;1;1;undefined;2;2;undefined;6;6;undefined;2;2;undefined;2;2;undefined;6;6;undefined;4;4;undefined;2;2;undefined;1;1;undefined;4;4;undefined;4;4;'),('cshanti','2016-17','1A','5','6','13CT1124','1','assesment','Assignment','4','5;undefined;8;8;undefined;7;7;undefined;4;4;undefined;2;2;undefined;9;9;undefined;6;6;undefined;7;7;undefined;1;1;undefined;5;5;undefined;5;5;undefined;4;4;undefined;5;5;undefined;5;5;undefined;6;6;undefined;6;6;undefined;5;5;undefined;3;3;undefined;4;4;undefined;4;4;undefined;4;4;undefined;6;6;undefined;5;5;undefined;5;5;undefined;5;5;undefined;5;5;undefined;9;9;undefined;6;6;undefined;5;5;undefined;1;1;undefined;6;6;undefined;4;4;undefined;8;8;undefined;5;5;undefined;9;9;undefined;5;5;undefined;4;4;undefined;5;5;undefined;4;4;undefined;5;5;undefined;7;7;undefined;7;7;undefined;5;5;undefined;8;8;undefined;5;5;undefined;2;2;undefined;2;2;undefined;5;5;undefined;6;6;undefined;6;6;undefined;3;3;undefined;6;6;undefined;7;7;undefined;5;5;undefined;5;5;undefined;1;1;undefined;5;5;undefined;2;2;undefined;3;3;undefined;4;4;undefined;5;5;undefined;4;4;undefined;7;7;undefined;4;4;undefined;5;5;undefined;6;6;undefined;5;5;undefined;5;5;undefined;6;6;undefined;2;2;undefined;5;5;undefined;5;5;undefined;5;5;undefined;6;6;'),('cshanti','2016-17','1A','5','6','13CT1124','1','test','','1','1;1;1;1;2;2;2;2;2;2;2;1;undefined;;2;;;;2;;;4;4.5;;;13;undefined;4;;;;0;2;;;4.5;0;;;11;undefined;;;4;;1;;;;2;1;;;8;undefined;;;4;0.5;0;1;;;1;0;;;7;undefined;5;4;;;4;1;;;4.5;5;;;24;undefined;;;3;4;;;;;4.5;5;;;17;undefined;;;1;4.5;;;4;4.5;5;5;;;24;undefined;;;4;;;;;2;;;;;6;undefined;;;4.5;1;;;0.5;1;;;0;2;9;undefined;;;3;1;;4.5;;;;;3;2;14;on;3;;;;;3;;;;;5;;11;undefined;4;2;;;;0;;;;;;1;7;undefined;4.5;3;3;;4.5;4;;;;;4;3;23;undefined;2;2;;;;;0;0;1;1;;;6;undefined;4;1;;;;;;4;;5;;;14;undefined;;;5;2;2;4.5;;;3;4;;;21;undefined;;;4;0;;4;;;4;1;;;13;undefined;;;4;1;;;5;2;5;1;;;18;undefined;2;;;;;4;;;4;5;;;15;undefined;4.5;;;;1;0;;;;;3;;9;undefined;4.5;2;;;;;2;3;4.5;5;;;21;undefined;;2;;;;3;;;;3;;;8;undefined;3;;;;;;;;0.5;;;;4;undefined;2;;;2;;;;;;;;;2;undefined;;;5;;2;5;;;;5;;;17;undefined;4.5;4.5;;;;;4.5;4.5;3.5;1;;;23;undefined;;;1;3;;;1;3.5;0;5;0;0;14;undefined;;;4.5;;;0;;;;0;;;5;undefined;;;4.5;;;4;;;1;0.5;;;10;undefined;;;3;;;4.5;;;2;5;;;15;undefined;;;4.5;;;0;;;;;;;5;undefined;3;;;;1;4.5;;;4.5;2;;;15;undefined;4.5;3;;;0;4.5;;;5;5;;;22;undefined;;;4.5;4;;;3.5;4;;;5;4;25;undefined;4;3;;;;;1;1;4;3;;;16;undefined;2.5;;;;;;;1;1.5;;;;5;undefined;;;0;4;;;;3.5;;0;;;8;undefined;;;4.5;;;4.5;;;;3.5;;;13;undefined;;;;1;4;0;;;;5;;;10;undefined;4.5;2;;;3;4;;;;;5;1;20;undefined;4.5;2;;;;;0.5;2;1;0;;;10;undefined;5;1;;;;0;;;;;0;;6;undefined;4.5;3;;;;;4;4.5;4.5;5;;;26;undefined;;;5;3.5;;3.5;;;4;5;;;21;undefined;3;1;;;;3.5;;;;;1;;9;undefined;4;;;;;;;;1;2;;;7;undefined;3.5;3.5;;;0;4;;;3;5;;;19;undefined;3.5;;;;;3.5;;;4;4;;;15;undefined;3;3;;;0;4;;;0;0;;;10;off;;;;;;;;;;;;;0;undefined;;;3;0;;0;;;3.5;;;;7;undefined;4.5;3.5;;;0;4.5;;;4;0;;;17;undefined;;;3.5;;;4.5;;;4.5;0;;;13;undefined;;;2.5;2;;1;;;;;0;1;7;undefined;;;1;;;;;2;;;;;3;undefined;4.5;3;;;0;4;;;4.5;1;;;17;undefined;;;3;;;;;3.5;3.5;5;;;15;undefined;;;;;;;4.5;2.5;4.5;4;;;16;undefined;1;;;;;0;;;;;0;;1;undefined;4;3;;;;;3;2;;;2;2;16;undefined;;;;4;;;;;;;;;4;undefined;;;;;;;;;5;;;;5;undefined;5;;;;3;;;;;;;;8;undefined;3.5;1;;;;1;;;;;0;;6;undefined;4;1;;;;;0;2;;;0;1;8;undefined;3;;;;;1;;;;;;;4;undefined;;;4;;;;1;3;0;0;;;8;undefined;;;3.5;2;;;1;0;;;0;1;8;undefined;;;4.5;3;0;4;;;2;0;;;14;undefined;4;4;;;;;4;4;;;1;;17;off;;;;;;;;;;;;;0;undefined;3;1;;;;0;;;0;2;;;6;undefined;;;4;0;;0;;;0;0;;;4;');
/*!40000 ALTER TABLE `internal_temp` ENABLE KEYS */;
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
