-- MariaDB dump 10.17  Distrib 10.4.7-MariaDB, for Linux (x86_64)
--
-- Host: localhost    Database: innexgo
-- ------------------------------------------------------
-- Server version	10.4.7-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `api_key`
--

DROP TABLE IF EXISTS `api_key`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `api_key` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL,
  `creation_time` bigint(20) NOT NULL,
  `expiration_time` bigint(20) NOT NULL,
  `key_hash` char(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `api_key`
--

LOCK TABLES `api_key` WRITE;
/*!40000 ALTER TABLE `api_key` DISABLE KEYS */;
INSERT INTO `api_key` VALUES (1,1,1566512100545,1152921504606846975,'VsGtiVaRDIwAnVNCg2DWa5eJbh951o6tOwhO7expA_k='),(2,2,1566757313282,1566865313164,'c3qBh9i8s131_zn1fOqMpBzenzeTrm5EGNMG0IA3Mxo=');
/*!40000 ALTER TABLE `api_key` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `course`
--

DROP TABLE IF EXISTS `course`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `course` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `teacher_id` bigint(20) NOT NULL,
  `location_id` bigint(20) NOT NULL,
  `period` bigint(20) NOT NULL,
  `subject` varchar(31) COLLATE utf8mb4_unicode_ci NOT NULL,
  `year` bigint(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course`
--

LOCK TABLES `course` WRITE;
/*!40000 ALTER TABLE `course` DISABLE KEYS */;
INSERT INTO `course` VALUES (1,2,3,1,'history',2020),(2,3,2,1,'math',2020),(3,2,2,2,'english',2020),(4,3,3,2,'chemistry',2020);
/*!40000 ALTER TABLE `course` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `encounter`
--

DROP TABLE IF EXISTS `encounter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `encounter` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `time` bigint(20) NOT NULL,
  `location_id` bigint(20) NOT NULL,
  `student_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `encounter`
--

LOCK TABLES `encounter` WRITE;
/*!40000 ALTER TABLE `encounter` DISABLE KEYS */;
INSERT INTO `encounter` VALUES (1,1565155403613,3,30094614),(2,1565155405125,3,30094614);
/*!40000 ALTER TABLE `encounter` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `location`
--

DROP TABLE IF EXISTS `location`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `location` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tags` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `location`
--

LOCK TABLES `location` WRITE;
/*!40000 ALTER TABLE `location` DISABLE KEYS */;
INSERT INTO `location` VALUES (1,'Main Office','restricted'),(2,'Room 503','classroom'),(3,'Room 500','classroom'),(4,'Room 501','classroom'),(5,'Room 502','classroom');
/*!40000 ALTER TABLE `location` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `period`
--

DROP TABLE IF EXISTS `period`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `period` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `initial_time` bigint(20) NOT NULL,
  `start_time` bigint(20) NOT NULL,
  `end_time` bigint(20) NOT NULL,
  `period` bigint(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=241 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `period`
--

LOCK TABLES `period` WRITE;
/*!40000 ALTER TABLE `period` DISABLE KEYS */;
INSERT INTO `period` VALUES (1,1566824400000,1566828900000,1566831300000,1),(2,1566831300000,1566831600000,1566834000000,2),(3,1566834000000,1566834300000,1566836700000,3),(4,1566836700000,1566837900000,1566840300000,4),(5,1566840300000,1566840300000,1566842100000,0),(6,1566842100000,1566842400000,1566844800000,5),(7,1566844800000,1566846900000,1566849300000,6),(8,1566849300000,1566806400000,1566808800000,7),(9,1566910800000,1566915300000,1566921300000,1),(10,1566921300000,1566922500000,1566928500000,3),(11,1566928500000,1566929700000,1566935700000,5),(12,1566935700000,1566894600000,1566900600000,7),(13,1567083600000,1567088100000,1567094100000,1),(14,1567094100000,1567095300000,1567101300000,3),(15,1567101300000,1567102500000,1567108500000,5),(16,1567108500000,1567067400000,1567073400000,7),(17,1566997200000,1567004400000,1567010400000,2),(18,1567010400000,1567011600000,1567017600000,4),(19,1567017600000,1567017600000,1567020600000,0),(20,1567020600000,1566979500000,1566985500000,6),(21,1567170000000,1567177200000,1567183200000,2),(22,1567183200000,1567184400000,1567190400000,4),(23,1567190400000,1567190400000,1567193400000,0),(24,1567193400000,1567152300000,1567158300000,6),(25,1567429200000,1567433700000,1567436100000,1),(26,1567436100000,1567436400000,1567438800000,2),(27,1567438800000,1567439100000,1567441500000,3),(28,1567441500000,1567442700000,1567445100000,4),(29,1567445100000,1567445100000,1567446900000,0),(30,1567446900000,1567447200000,1567449600000,5),(31,1567449600000,1567451700000,1567454100000,6),(32,1567454100000,1567411200000,1567413600000,7),(33,1567515600000,1567520100000,1567526100000,1),(34,1567526100000,1567527300000,1567533300000,3),(35,1567533300000,1567534500000,1567540500000,5),(36,1567540500000,1567499400000,1567505400000,7),(37,1567688400000,1567692900000,1567698900000,1),(38,1567698900000,1567700100000,1567706100000,3),(39,1567706100000,1567707300000,1567713300000,5),(40,1567713300000,1567672200000,1567678200000,7),(41,1567602000000,1567609200000,1567615200000,2),(42,1567615200000,1567616400000,1567622400000,4),(43,1567622400000,1567622400000,1567625400000,0),(44,1567625400000,1567584300000,1567590300000,6),(45,1567774800000,1567782000000,1567788000000,2),(46,1567788000000,1567789200000,1567795200000,4),(47,1567795200000,1567795200000,1567798200000,0),(48,1567798200000,1567757100000,1567763100000,6),(49,1568034000000,1568038500000,1568040900000,1),(50,1568040900000,1568041200000,1568043600000,2),(51,1568043600000,1568043900000,1568046300000,3),(52,1568046300000,1568047500000,1568049900000,4),(53,1568049900000,1568049900000,1568051700000,0),(54,1568051700000,1568052000000,1568054400000,5),(55,1568054400000,1568056500000,1568058900000,6),(56,1568058900000,1568016000000,1568018400000,7),(57,1568120400000,1568124900000,1568130900000,1),(58,1568130900000,1568132100000,1568138100000,3),(59,1568138100000,1568139300000,1568145300000,5),(60,1568145300000,1568104200000,1568110200000,7),(61,1568293200000,1568297700000,1568303700000,1),(62,1568303700000,1568304900000,1568310900000,3),(63,1568310900000,1568312100000,1568318100000,5),(64,1568318100000,1568277000000,1568283000000,7),(65,1568206800000,1568214000000,1568220000000,2),(66,1568220000000,1568221200000,1568227200000,4),(67,1568227200000,1568227200000,1568230200000,0),(68,1568230200000,1568189100000,1568195100000,6),(69,1568379600000,1568386800000,1568392800000,2),(70,1568392800000,1568394000000,1568400000000,4),(71,1568400000000,1568400000000,1568403000000,0),(72,1568403000000,1568361900000,1568367900000,6),(73,1568638800000,1568643300000,1568645700000,1),(74,1568645700000,1568646000000,1568648400000,2),(75,1568648400000,1568648700000,1568651100000,3),(76,1568651100000,1568652300000,1568654700000,4),(77,1568654700000,1568654700000,1568656500000,0),(78,1568656500000,1568656800000,1568659200000,5),(79,1568659200000,1568661300000,1568663700000,6),(80,1568663700000,1568620800000,1568623200000,7),(81,1568725200000,1568729700000,1568735700000,1),(82,1568735700000,1568736900000,1568742900000,3),(83,1568742900000,1568744100000,1568750100000,5),(84,1568750100000,1568709000000,1568715000000,7),(85,1568898000000,1568902500000,1568908500000,1),(86,1568908500000,1568909700000,1568915700000,3),(87,1568915700000,1568916900000,1568922900000,5),(88,1568922900000,1568881800000,1568887800000,7),(89,1568811600000,1568818800000,1568824800000,2),(90,1568824800000,1568826000000,1568832000000,4),(91,1568832000000,1568832000000,1568835000000,0),(92,1568835000000,1568793900000,1568799900000,6),(93,1568984400000,1568991600000,1568997600000,2),(94,1568997600000,1568998800000,1569004800000,4),(95,1569004800000,1569004800000,1569007800000,0),(96,1569007800000,1568966700000,1568972700000,6),(97,1569243600000,1569248100000,1569250500000,1),(98,1569250500000,1569250800000,1569253200000,2),(99,1569253200000,1569253500000,1569255900000,3),(100,1569255900000,1569257100000,1569259500000,4),(101,1569259500000,1569259500000,1569261300000,0),(102,1569261300000,1569261600000,1569264000000,5),(103,1569264000000,1569266100000,1569268500000,6),(104,1569268500000,1569225600000,1569228000000,7),(105,1569330000000,1569334500000,1569340500000,1),(106,1569340500000,1569341700000,1569347700000,3),(107,1569347700000,1569348900000,1569354900000,5),(108,1569354900000,1569313800000,1569319800000,7),(109,1569502800000,1569507300000,1569513300000,1),(110,1569513300000,1569514500000,1569520500000,3),(111,1569520500000,1569521700000,1569527700000,5),(112,1569527700000,1569486600000,1569492600000,7),(113,1569416400000,1569423600000,1569429600000,2),(114,1569429600000,1569430800000,1569436800000,4),(115,1569436800000,1569436800000,1569439800000,0),(116,1569439800000,1569398700000,1569404700000,6),(117,1569589200000,1569596400000,1569602400000,2),(118,1569602400000,1569603600000,1569609600000,4),(119,1569609600000,1569609600000,1569612600000,0),(120,1569612600000,1569571500000,1569577500000,6),(121,1569848400000,1569852900000,1569855300000,1),(122,1569855300000,1569855600000,1569858000000,2),(123,1569858000000,1569858300000,1569860700000,3),(124,1569860700000,1569861900000,1569864300000,4),(125,1569864300000,1569864300000,1569866100000,0),(126,1569866100000,1569866400000,1569868800000,5),(127,1569868800000,1569870900000,1569873300000,6),(128,1569873300000,1569830400000,1569832800000,7),(129,1569934800000,1569939300000,1569945300000,1),(130,1569945300000,1569946500000,1569952500000,3),(131,1569952500000,1569953700000,1569959700000,5),(132,1569959700000,1569918600000,1569924600000,7),(133,1570107600000,1570112100000,1570118100000,1),(134,1570118100000,1570119300000,1570125300000,3),(135,1570125300000,1570126500000,1570132500000,5),(136,1570132500000,1570091400000,1570097400000,7),(137,1570021200000,1570028400000,1570034400000,2),(138,1570034400000,1570035600000,1570041600000,4),(139,1570041600000,1570041600000,1570044600000,0),(140,1570044600000,1570003500000,1570009500000,6),(141,1570194000000,1570201200000,1570207200000,2),(142,1570207200000,1570208400000,1570214400000,4),(143,1570214400000,1570214400000,1570217400000,0),(144,1570217400000,1570176300000,1570182300000,6),(145,1570453200000,1570457700000,1570460100000,1),(146,1570460100000,1570460400000,1570462800000,2),(147,1570462800000,1570463100000,1570465500000,3),(148,1570465500000,1570466700000,1570469100000,4),(149,1570469100000,1570469100000,1570470900000,0),(150,1570470900000,1570471200000,1570473600000,5),(151,1570473600000,1570475700000,1570478100000,6),(152,1570478100000,1570435200000,1570437600000,7),(153,1570539600000,1570544100000,1570550100000,1),(154,1570550100000,1570551300000,1570557300000,3),(155,1570557300000,1570558500000,1570564500000,5),(156,1570564500000,1570523400000,1570529400000,7),(157,1570712400000,1570716900000,1570722900000,1),(158,1570722900000,1570724100000,1570730100000,3),(159,1570730100000,1570731300000,1570737300000,5),(160,1570737300000,1570696200000,1570702200000,7),(161,1570626000000,1570633200000,1570639200000,2),(162,1570639200000,1570640400000,1570646400000,4),(163,1570646400000,1570646400000,1570649400000,0),(164,1570649400000,1570608300000,1570614300000,6),(165,1570798800000,1570806000000,1570812000000,2),(166,1570812000000,1570813200000,1570819200000,4),(167,1570819200000,1570819200000,1570822200000,0),(168,1570822200000,1570781100000,1570787100000,6),(169,1571058000000,1571062500000,1571064900000,1),(170,1571064900000,1571065200000,1571067600000,2),(171,1571067600000,1571067900000,1571070300000,3),(172,1571070300000,1571071500000,1571073900000,4),(173,1571073900000,1571073900000,1571075700000,0),(174,1571075700000,1571076000000,1571078400000,5),(175,1571078400000,1571080500000,1571082900000,6),(176,1571082900000,1571040000000,1571042400000,7),(177,1571144400000,1571148900000,1571154900000,1),(178,1571154900000,1571156100000,1571162100000,3),(179,1571162100000,1571163300000,1571169300000,5),(180,1571169300000,1571128200000,1571134200000,7),(181,1571317200000,1571321700000,1571327700000,1),(182,1571327700000,1571328900000,1571334900000,3),(183,1571334900000,1571336100000,1571342100000,5),(184,1571342100000,1571301000000,1571307000000,7),(185,1571230800000,1571238000000,1571244000000,2),(186,1571244000000,1571245200000,1571251200000,4),(187,1571251200000,1571251200000,1571254200000,0),(188,1571254200000,1571213100000,1571219100000,6),(189,1571403600000,1571410800000,1571416800000,2),(190,1571416800000,1571418000000,1571424000000,4),(191,1571424000000,1571424000000,1571427000000,0),(192,1571427000000,1571385900000,1571391900000,6),(193,1571662800000,1571667300000,1571669700000,1),(194,1571669700000,1571670000000,1571672400000,2),(195,1571672400000,1571672700000,1571675100000,3),(196,1571675100000,1571676300000,1571678700000,4),(197,1571678700000,1571678700000,1571680500000,0),(198,1571680500000,1571680800000,1571683200000,5),(199,1571683200000,1571685300000,1571687700000,6),(200,1571687700000,1571644800000,1571647200000,7),(201,1571749200000,1571753700000,1571759700000,1),(202,1571759700000,1571760900000,1571766900000,3),(203,1571766900000,1571768100000,1571774100000,5),(204,1571774100000,1571733000000,1571739000000,7),(205,1571922000000,1571926500000,1571932500000,1),(206,1571932500000,1571933700000,1571939700000,3),(207,1571939700000,1571940900000,1571946900000,5),(208,1571946900000,1571905800000,1571911800000,7),(209,1571835600000,1571842800000,1571848800000,2),(210,1571848800000,1571850000000,1571856000000,4),(211,1571856000000,1571856000000,1571859000000,0),(212,1571859000000,1571817900000,1571823900000,6),(213,1572008400000,1572015600000,1572021600000,2),(214,1572021600000,1572022800000,1572028800000,4),(215,1572028800000,1572028800000,1572031800000,0),(216,1572031800000,1571990700000,1571996700000,6),(217,1572267600000,1572272100000,1572274500000,1),(218,1572274500000,1572274800000,1572277200000,2),(219,1572277200000,1572277500000,1572279900000,3),(220,1572279900000,1572281100000,1572283500000,4),(221,1572283500000,1572283500000,1572285300000,0),(222,1572285300000,1572285600000,1572288000000,5),(223,1572288000000,1572290100000,1572292500000,6),(224,1572292500000,1572249600000,1572252000000,7),(225,1572354000000,1572358500000,1572364500000,1),(226,1572364500000,1572365700000,1572371700000,3),(227,1572371700000,1572372900000,1572378900000,5),(228,1572378900000,1572337800000,1572343800000,7),(229,1572526800000,1572531300000,1572537300000,1),(230,1572537300000,1572538500000,1572544500000,3),(231,1572544500000,1572545700000,1572551700000,5),(232,1572551700000,1572510600000,1572516600000,7),(233,1572440400000,1572447600000,1572453600000,2),(234,1572453600000,1572454800000,1572460800000,4),(235,1572460800000,1572460800000,1572463800000,0),(236,1572463800000,1572422700000,1572428700000,6),(237,1572613200000,1572620400000,1572626400000,2),(238,1572626400000,1572627600000,1572633600000,4),(239,1572633600000,1572633600000,1572636600000,0),(240,1572636600000,1572595500000,1572601500000,6);
/*!40000 ALTER TABLE `period` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `schedule`
--

DROP TABLE IF EXISTS `schedule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `schedule` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `student_id` bigint(20) NOT NULL,
  `course_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schedule`
--

LOCK TABLES `schedule` WRITE;
/*!40000 ALTER TABLE `schedule` DISABLE KEYS */;
INSERT INTO `schedule` VALUES (1,30091735,1),(2,30092415,1),(3,30092430,1),(4,30115956,1),(5,30092039,1),(6,30091785,1),(7,30092464,1),(8,30107994,1),(9,30092814,1),(10,30092875,1),(11,30095143,1),(12,30091660,1),(13,30094462,1),(14,30106463,1),(15,30105130,1),(16,30091918,1),(17,30094614,1),(18,30089932,1),(19,30092955,1),(20,30091993,1),(21,30109163,1),(22,30093558,1),(23,30091670,1);
/*!40000 ALTER TABLE `schedule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `session`
--

DROP TABLE IF EXISTS `session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `session` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `in_encounter_id` bigint(20) NOT NULL,
  `out_encounter_id` bigint(20) NOT NULL,
  `course_id` bigint(20) NOT NULL,
  `complete` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `session`
--

LOCK TABLES `session` WRITE;
/*!40000 ALTER TABLE `session` DISABLE KEYS */;
INSERT INTO `session` VALUES (1,1,2,1,1);
/*!40000 ALTER TABLE `session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student`
--

DROP TABLE IF EXISTS `student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `student` (
  `id` bigint(20) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `graduating_year` bigint(20) NOT NULL,
  `tags` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student`
--

LOCK TABLES `student` WRITE;
/*!40000 ALTER TABLE `student` DISABLE KEYS */;
INSERT INTO `student` VALUES (30089932,'RAYCARD QUINTO',2020,''),(30091660,'JAZMIN MARTINEZ',2020,''),(30091670,'LAUREN XIE',2020,''),(30091735,'OSKAR ATTAR',2020,''),(30091785,'ZACHARY IGUELMAMENE',2020,''),(30091918,'MINH PHAN',2020,''),(30091993,'DAN TRAN',2020,''),(30092039,'ISHA GONUGUNTA',2020,''),(30092415,'DANIEL BINOY',2020,''),(30092430,'LUCAS CHAVES MEYLES',2020,''),(30092464,'VIKASNI KALAHASTHI',2020,''),(30092814,'RICHARD LE',2020,''),(30092875,'CHRISTOPHER LEE',2020,''),(30092955,'NITISH REUBEN',2020,''),(30093558,'STEVEN VARY',2020,''),(30094462,'SANJANA NANDI',2021,''),(30094614,'GOVIND PIMPALE',2021,''),(30095143,'JASON LY',2021,''),(30105130,'JINSUNG PARK',2021,''),(30106463,'NIDHI PANCHAL',2020,''),(30107994,'ANDREW LE',2020,''),(30109163,'KENNETH TRAN',2020,''),(30115956,'ETHAN GARCIA',2021,'');
/*!40000 ALTER TABLE `student` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password_hash` char(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ring` bigint(2) NOT NULL,
  `prefstring` varchar(1023) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'Adam Smith','adamsmith@example.com','$2a$10$QP.tNPcWees66yCZ3w03leoj8j16cXcGxvEcxehRCN7XsawCJGv8y',0,'{\"colourTheme\":\"dark\",\"sidebarStyle\":\"fixed\",\"sidebarInfo\":\"augmented\"}'),(2,'Bernard Johnson','bernardjohnson@example.com','$2a$10$7N0TLOnkez33cLQKMTeCV.VyuxfXdYmtO5JEA4gE4penZBqFLGGJ2',1,'{\"colourTheme\":\"dark\",\"sidebarStyle\":\"fixed\",\"sidebarInfo\":\"augmented\"}'),(3,'Clara Brown','clarabrown@example.com','$2a$10$B4BiQbAZeD18ztqa7629oeiLyMEd/om9KGo/S7w/iG8IqLiOKiegu',1,'');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-08-25 11:56:30
