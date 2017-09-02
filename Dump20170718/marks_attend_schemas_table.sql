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
-- Table structure for table `schemas_table`
--

DROP TABLE IF EXISTS `schemas_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `schemas_table` (
  `sno` int(11) NOT NULL AUTO_INCREMENT,
  `fac_id` varchar(45) NOT NULL,
  `schema_id` varchar(45) NOT NULL,
  `schema_name` varchar(45) NOT NULL,
  PRIMARY KEY (`sno`)
) ENGINE=InnoDB AUTO_INCREMENT=122 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schemas_table`
--

LOCK TABLES `schemas_table` WRITE;
/*!40000 ALTER TABLE `schemas_table` DISABLE KEYS */;
INSERT INTO `schemas_table` VALUES (1,'vasishta','schemaId1','Vasishta-1'),(2,'ganesh','schemaId2','Ganesh-1'),(3,'vasishta','schemaId3','Utei'),(4,'vasishta','schemaId4','Dummy'),(5,'vasishta','schemaId5','222'),(6,'vasishta','schemaId6','Vasishta - 2'),(7,'null','schemaId7','Temp'),(8,'vasishta','schemaId8','Temp'),(9,'vasishta','schemaId9','Temp'),(10,'vasishta','schemaId10','Dummy'),(11,'vasishta','schemaId11',''),(12,'vasishta','schemaId12',''),(13,'vasishta','schemaId13',''),(14,'vasishta','schemaId14',''),(15,'vasishta','schemaId15',''),(16,'vasishta','schemaId16',''),(17,'vasishta','schemaId2017/04/15 17:29:09',''),(18,'vasishta','schemaId2017/04/15 17:33:31',''),(19,'vasishta','schemaId2017/04/15 17:33:59',''),(20,'vasishta','schemaId2017041517:35:03',''),(21,'vasishta','schemaId20170415173528',''),(22,'vasishta','schemaId20170415180326',''),(23,'vasishta','schemaId20170415180526',''),(24,'vasishta','schemaId20170415180537',''),(25,'vasishta','schemaId20170415180803',''),(26,'vasishta','schemaId20170415181032',''),(27,'vasishta','schemaId20170415181154',''),(28,'vasishta','schemaId20170415181357',''),(29,'vasishta','schemaId20170415182846',''),(30,'vasishta','schemaId20170415183135',''),(31,'vasishta','schemaId20170415183258',''),(32,'vasishta','schemaId20170415183524',''),(33,'vasishta','schemaId20170415183706',''),(34,'vasishta','schemaId20170415183951',''),(35,'vasishta','schemaId20170415183955',''),(36,'vasishta','schemaId20170415184003',''),(37,'vasishta','schemaId20170415184017',''),(38,'vasishta','schemaId20170415184029',''),(39,'vasishta','schemaId20170415184129',''),(40,'vasishta','schemaId20170415184252',''),(41,'vasishta','schemaId20170415184333',''),(42,'vasishta','schemaId20170415184520',''),(43,'vasishta','schemaId20170415184611',''),(44,'vasishta','schemaId20170415184842',''),(45,'vasishta','schemaId20170415184927',''),(46,'vasishta','schemaId20170415185120',''),(47,'vasishta','schemaId20170415185246',''),(48,'vasishta','schemaId20170415185406',''),(49,'vasishta','schemaId20170415185656',''),(50,'vasishta','schemaId20170415185738',''),(51,'vasishta','schemaId20170415185825',''),(52,'vasishta','schemaId20170415185833',''),(53,'vasishta','schemaId20170415220235',''),(54,'vasishta','schemaId20170417114400',''),(55,'vasishta','schemaId20170417114924',''),(56,'vasishta','schemaId20170417115039',''),(57,'vasishta','schemaId20170418160836',''),(58,'vasishta','schemaId20170418163039',''),(59,'vasishta','schemaId20170419111704',''),(60,'vasishta','schemaId20170419123233',''),(61,'vasishta','schemaId20170419145056',''),(62,'vasishta','schemaId20170419145100',''),(63,'vasishta','schemaId20170419145142',''),(64,'vasishta','schemaId20170419145144',''),(65,'vasishta','schemaId20170419145549',''),(66,'vasishta','schemaId20170419145550',''),(67,'vasishta','schemaId20170419145903',''),(68,'vasishta','schemaId20170419145904',''),(69,'vasishta','schemaId20170419150646',''),(70,'vasishta','schemaId20170419150647',''),(71,'vasishta','schemaId20170419151134',''),(72,'vasishta','schemaId20170419151305',''),(73,'vasishta','schemaId20170419153811',''),(74,'vasishta','schemaId20170420145848',''),(75,'vasishta','schemaId20170420150140',''),(76,'vasishta','schemaId20170420150933',''),(77,'vasishta','schemaId20170420151029',''),(78,'vasishta','schemaId20170420151147',''),(79,'vasishta','schemaId20170420152236',''),(80,'vasishta','schemaId20170420152512',''),(81,'vasishta','schemaId20170420152931',''),(82,'vasishta','schemaId20170420153221',''),(83,'vasishta','schemaId20170420153451',''),(84,'vasishta','schemaId20170420153612',''),(85,'vasishta','schemaId20170421095727',''),(86,'vasishta','schemaId20170421101817',''),(87,'vasishta','schemaId20170421104742',''),(88,'vasishta','schemaId20170421104853',''),(89,'vasishta','schemaId20170421105526',''),(90,'vasishta','schemaId20170421110228',''),(91,'vasishta','schemaId20170421114203',''),(92,'vasishta','schemaId20170421114303',''),(93,'vasishta','schemaId20170421114458',''),(94,'vasishta','schemaId20170421114610',''),(95,'vasishta','schemaId20170421114734',''),(96,'vasishta','schemaId20170421114901',''),(97,'vasishta','schemaId20170421115336',''),(98,'vasishta','schemaId20170421120141',''),(99,'vasishta','schemaId20170421120425',''),(100,'vasishta','schemaId20170421120845',''),(101,'vasishta','schemaId20170421121242',''),(102,'vasishta','schemaId20170421122002',''),(103,'vasishta','schemaId20170421123443',''),(104,'vasishta','schemaId20170421124207',''),(105,'vasishta','schemaId20170421124251',''),(106,'vasishta','schemaId20170421124318',''),(107,'vasishta','schemaId20170421124946',''),(108,'vasishta','schemaId20170421142803',''),(109,'vasishta','schemaId20170421143057',''),(110,'vasishta','schemaId20170421171521',''),(111,'sanoop','schemaId20170424113302',''),(112,'sanoop','schemaId20170424113433',''),(115,'cshanti','schemaId20170607135042',''),(116,'cshanti','schemaId20170607141832',''),(117,'cshanti','schemaId20170608100041',''),(118,'cshanti','schemaId20170608100147',''),(119,'cshanti','schemaId20170608101053',''),(120,'cshanti','schemaId20170608101155',''),(121,'cshanti','schemaId20170608111731','');
/*!40000 ALTER TABLE `schemas_table` ENABLE KEYS */;
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
