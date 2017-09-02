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
-- Table structure for table `feedback_store`
--

DROP TABLE IF EXISTS `feedback_store`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `feedback_store` (
  `year` varchar(10) NOT NULL,
  `semester` varchar(2) NOT NULL,
  `branch` varchar(45) DEFAULT NULL,
  `section` varchar(45) DEFAULT NULL,
  `sub_id` varchar(20) NOT NULL,
  `fac_id` varchar(45) DEFAULT NULL,
  `student_id` varchar(20) NOT NULL,
  `q1` varchar(3) NOT NULL,
  `q2` varchar(3) NOT NULL,
  `q3` varchar(3) NOT NULL,
  `q4` varchar(3) NOT NULL,
  `q5` varchar(3) NOT NULL,
  `q6` varchar(3) NOT NULL,
  `q7` varchar(3) NOT NULL,
  `q8` varchar(3) NOT NULL,
  `q9` varchar(3) NOT NULL,
  `q10` varchar(3) NOT NULL,
  `q11` varchar(3) NOT NULL,
  `q12` varchar(3) NOT NULL,
  `q13` varchar(3) NOT NULL,
  `q14` varchar(3) NOT NULL,
  `q15` varchar(3) NOT NULL,
  `rating` varchar(5) NOT NULL,
  `comment` varchar(50) DEFAULT NULL,
  `feedback_no` varchar(45) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `feedback_store`
--

LOCK TABLES `feedback_store` WRITE;
/*!40000 ALTER TABLE `feedback_store` DISABLE KEYS */;
INSERT INTO `feedback_store` VALUES ('2016-17','6','5','1','13CS1102','vasishta','13131A0542','yes','yes','yes','no','yes','no','yes','no','yes','no','no','no','no','no','yes','4','Dummy','1'),('2016-17','6','5','1','13CS1103','ganesh','13131A0542','5','5','5','5','5','4','4','4','3','5','5','5','5','5','5','5','','1'),('2016-17','6','5','1','13CT1122','padmavathi','13131A0542','5','5','5','5','5','4','5','5','5','5','5','5','5','5','5','5','','1'),('2016-17','6','5','1','13HM1102','sowmya','13131A0542','5','5','5','5','5','5','5','5','5','5','5','5','5','5','5','5',' Tempu','1'),('2016-17','6','5','1','13CS1102','vasishta','13131A0542','5','5','5','5','5','5','5','5','5','5','5','5','5','5','5','5','','2'),('2016-17','6','5','1','13CS1103','ganesh','13131A0542','5','5','5','4','5','5','5','5','5','5','5','5','5','5','5','5','Temo','2'),('2016-17','6','5','1','13CT1122','padmavathi','13131A0542','5','5','5','5','5','5','5','5','5','5','5','5','5','5','5','5',' Temp','2');
/*!40000 ALTER TABLE `feedback_store` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-07-18 15:07:39
