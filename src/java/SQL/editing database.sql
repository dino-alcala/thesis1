CREATE DATABASE  IF NOT EXISTS `thsis01` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `thsis01`;
-- MySQL dump 10.13  Distrib 5.7.23, for Win64 (x86_64)
--
-- Host: localhost    Database: thsis01
-- ------------------------------------------------------
-- Server version	5.7.23-log

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
-- Table structure for table `budget`
--

DROP TABLE IF EXISTS `budget`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `budget` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` date DEFAULT NULL,
  `currentBudget` double DEFAULT NULL,
  `budgetRequested` double DEFAULT NULL,
  `remainingBudget` double DEFAULT NULL,
  `seID` int(11) DEFAULT NULL,
  `ffID` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `LA17_idx` (`seID`),
  KEY `LA18_idx` (`ffID`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `budget`
--

LOCK TABLES `budget` WRITE;
/*!40000 ALTER TABLE `budget` DISABLE KEYS */;
INSERT INTO `budget` VALUES (1,'2018-10-19',10000000,NULL,10000000,NULL,NULL),(2,'2018-11-22',10000000,4000,9996000,0,0),(3,'2018-11-22',9996000,2000,9994000,0,0),(4,'2018-11-22',9994000,1000,9993000,0,0),(5,'2018-11-22',9993000,10000,9983000,0,0),(6,'2018-11-22',9983000,2000,9981000,0,0),(7,'2018-11-22',9981000,4000,9977000,0,0),(8,'2018-11-22',9977000,4000,9973000,10,0),(9,'2018-11-22',9973000,6500,9966500,20,0),(10,'2018-11-22',9966500,1000,9965500,5,0),(11,'2018-11-22',9965500,1000,9964500,18,0),(12,'2018-11-22',9964500,5000,9959500,15,0),(13,'2018-11-22',9959500,2000,9957500,14,0),(14,'2018-11-22',9957500,2000,9955500,12,0),(15,'2018-11-22',9955500,2000,9953500,17,0),(16,'2018-11-22',9953500,2000,9951500,4,0),(17,'2018-11-22',9951500,2000,9949500,7,0),(18,'2018-11-22',9949500,1000,9948500,6,0),(19,'2018-11-23',9948500,2000,9946500,0,28),(20,'2018-11-23',9946500,2000,9944500,0,24),(21,'2018-11-23',9944500,2000,9942500,0,12),(22,'2018-11-23',9942500,2000,9940500,0,15),(23,'2018-11-23',9940500,2000,9938500,0,19),(24,'2018-11-23',9938500,2000,9936500,0,21),(25,'2018-11-23',9936500,2000,9934500,0,23),(26,'2018-11-23',9934500,2000,9932500,0,16),(27,'2018-11-23',9932500,2000,9930500,0,25),(28,'2018-11-23',9930500,2000,9928500,0,27),(29,'2018-11-23',9928500,2000,9926500,0,17),(30,'2018-11-23',9926500,2000,9924500,0,10),(31,'2018-11-23',9924500,2000,9922500,0,20),(32,'2018-11-23',9922500,4000,9918500,0,26),(33,'2018-11-23',9918500,4000,9914500,0,14),(34,'2018-11-23',9914500,4000,9910500,0,11),(35,'2018-11-23',9910500,2000,9908500,0,13),(36,'2018-11-23',9908500,4000,9904500,0,22),(37,'2018-11-23',9904500,4000,9900500,0,18),(38,'2018-11-23',9900500,3000,9897500,22,0),(39,'2018-11-27',9897500,25000,9872500,23,0),(40,'2019-01-27',9872500,5000,9867500,24,0),(41,'2019-01-29',9867500,4000,9863500,0,33),(42,'2019-01-29',9863500,5000,9858500,25,0),(43,'2019-02-02',9858500,5000,9853500,0,34),(44,'2019-02-03',9853500,-5000,9858500,25,0);
/*!40000 ALTER TABLE `budget` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `community`
--

DROP TABLE IF EXISTS `community`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `community` (
  `communityID` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) DEFAULT NULL,
  `contactPerson` varchar(200) DEFAULT NULL,
  `contactNumber` varchar(200) DEFAULT NULL,
  `unitNumber` varchar(200) DEFAULT NULL,
  `street` varchar(200) DEFAULT NULL,
  `barangay` varchar(200) DEFAULT NULL,
  `city` varchar(200) DEFAULT NULL,
  `description` varchar(200) DEFAULT NULL,
  `userID` int(11) DEFAULT NULL,
  `international` int(1) DEFAULT NULL,
  PRIMARY KEY (`communityID`),
  KEY `LA4_idx` (`userID`),
  CONSTRAINT `LA4` FOREIGN KEY (`userID`) REFERENCES `informationsheet` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `community`
--

LOCK TABLES `community` WRITE;
/*!40000 ALTER TABLE `community` DISABLE KEYS */;
INSERT INTO `community` VALUES (1,'Khalids Retirement Home','Khalid Malo','09291107660','24','Mabango Street','Barangay Rahim','Makati City','Khalid\'s Retirement Home',71,NULL),(2,'Karls Community for the Jobless','Karl Madrid','09566082949','8','New York Street','Barangay KM','Quezon City','Karl\'s Community for the Jobless',71,NULL),(3,'Lasalle Singapore','Luis Grefiel','09291577712','9','Woodlands Street','Example Barangay','Singapore City','Lasalle Singapore Description',71,1),(4,'Angelos School for the Special','Angelo De Jesus','09174029299','17','Matuwid Street','Barangay Tibay','Paranaque City','Angelo\'s School for the Special',71,NULL);
/*!40000 ALTER TABLE `community` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `department`
--

DROP TABLE IF EXISTS `department`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `department` (
  `departmentID` int(11) NOT NULL,
  `department` varchar(100) DEFAULT NULL,
  `numberOfFaculty` int(11) DEFAULT NULL,
  `numberOfAdmin` int(11) DEFAULT NULL,
  `numberOfAPSP` int(11) DEFAULT NULL,
  `numberOfASF` int(11) DEFAULT NULL,
  `numberOfCAP` int(11) DEFAULT NULL,
  `numberOfDirectHired` int(11) DEFAULT NULL,
  `numberOfIndependent` int(11) DEFAULT NULL,
  `numberOfExternal` int(11) DEFAULT NULL,
  PRIMARY KEY (`departmentID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `department`
--

LOCK TABLES `department` WRITE;
/*!40000 ALTER TABLE `department` DISABLE KEYS */;
INSERT INTO `department` VALUES (0,'No Department',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1,'Admin ',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(2,'Computer Technology (CT)',15,2,10,12,10,2,2,2),(3,'Information Technology (IT)',15,2,10,12,10,2,2,2),(4,'Software Technology (ST)',15,2,10,12,10,2,2,2),(5,'Counselling and Educational Psychology Department (CEPD)',15,2,10,12,10,2,2,2),(6,'Department of English and Applied Linguistics (DEAL)',15,2,10,12,10,2,2,2),(7,'Educational Leadership and Management Department (ELMD)',15,2,10,12,10,2,2,2),(8,'Physical Education Department (PED)',15,2,10,12,10,2,2,2),(9,'Science Education Department (SED)',15,2,10,12,10,2,2,2),(10,'Behavioral Sciences (BS)',15,2,10,12,10,2,2,2),(11,'Communication (COMM)',15,2,10,12,10,2,2,2),(12,'Literature (LIT)',15,2,10,12,10,2,2,2),(13,'Filipino (FIL)',15,2,10,21,10,2,2,2),(14,'History (HIS)',15,2,10,12,10,2,2,2),(15,'International Studies (IS)',15,2,10,12,10,2,2,2),(16,'Philosophy (PHILO)',15,2,10,12,10,2,2,2),(17,'Political Science (POLSCI)',15,2,10,12,10,2,2,2),(18,'Psychology (PSYCH)',15,2,10,12,10,2,2,2),(19,'Theology and Religious Education (TRED)',15,2,10,12,10,2,2,2),(20,'Biology (BIO)',15,2,10,12,10,2,2,2),(21,'Chemistry (CHEM)',15,2,10,12,10,2,2,2),(22,'Physics (PHYS)',15,2,10,12,10,2,2,2),(23,'Chemical Engineering (CHEMENG)',15,2,10,12,10,2,2,2),(24,'Civil Engineering (CIV)',15,2,10,12,10,2,2,2),(25,'Electronics and Communications Engineering (ECE)',15,2,10,12,10,2,2,2),(26,'Industrial Engineering (IE)',15,2,10,12,10,2,2,2),(27,'Manufacturing Engineering and Management (MEM)',15,2,10,12,10,2,2,2),(28,'Mechanical Engineering (ME)',15,2,10,12,10,2,2,2),(29,'Accountancy (ACC)',15,2,10,12,10,2,2,2),(30,'Commercial Law (CL)',15,2,10,12,10,2,2,2),(31,'Decision Sciences and Innovation Department (DSID)',15,2,10,12,10,2,2,2),(32,'Management of Financial Institutions (RVRCOB-MFI)',15,2,10,12,10,2,2,2),(33,'Management and Organization Department (RVRCOB-MOD)',15,2,10,12,10,2,2,2),(34,'Marketing Management (RVRCOB-MM)',15,2,10,12,10,2,2,2),(35,'Industrial Applied Economics (IAE)',15,2,10,12,10,2,2,2),(36,'Financial Applied Economics (FAE)',15,2,10,12,10,2,2,2),(37,'Ladderized Applied Economics (LAE)',15,2,10,12,10,2,2,2),(38,'Management of Financial Institutions (SOE-MFI)',15,2,10,12,10,2,2,2),(39,'Management and Organization Department (SOE-MOD)',15,2,10,12,10,2,2,2),(40,'Marketing Management (SOE-MM)',15,2,10,12,10,2,2,2);
/*!40000 ALTER TABLE `department` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employeelist`
--

DROP TABLE IF EXISTS `employeelist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `employeelist` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) DEFAULT NULL,
  `type` varchar(45) DEFAULT NULL,
  `attendff` int(11) DEFAULT NULL,
  `attendse` int(11) DEFAULT NULL,
  `unitID` int(11) DEFAULT NULL,
  `departmentID` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employeelist`
--

LOCK TABLES `employeelist` WRITE;
/*!40000 ALTER TABLE `employeelist` DISABLE KEYS */;
INSERT INTO `employeelist` VALUES (1,'Dino Alcala','CAP',NULL,NULL,10,NULL),(2,'Karl Madrid','CAP',NULL,NULL,10,NULL),(3,'Luis Grefiel','APSP',NULL,NULL,10,NULL),(4,'Angelo De Jesus','APSP',NULL,NULL,10,NULL),(5,NULL,'ASF',NULL,NULL,NULL,NULL),(6,NULL,'ASF',NULL,NULL,NULL,NULL),(7,NULL,'Faculty',NULL,NULL,NULL,NULL),(8,NULL,'Faculty',NULL,NULL,NULL,NULL),(9,NULL,'Admin',NULL,NULL,NULL,NULL),(10,NULL,'Admin',NULL,NULL,NULL,NULL),(11,NULL,'Directhired',NULL,NULL,NULL,NULL),(12,NULL,'Directhired',NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `employeelist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ffevaluation`
--

DROP TABLE IF EXISTS `ffevaluation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ffevaluation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` date DEFAULT NULL,
  `name` varchar(500) DEFAULT NULL,
  `q1` int(11) DEFAULT NULL,
  `q2` int(11) DEFAULT NULL,
  `q3` int(11) DEFAULT NULL,
  `q4` int(11) DEFAULT NULL,
  `q5` int(11) DEFAULT NULL,
  `q6` int(11) DEFAULT NULL,
  `q7` int(11) DEFAULT NULL,
  `q8` int(11) DEFAULT NULL,
  `q9` int(11) DEFAULT NULL,
  `learning` varchar(1000) DEFAULT NULL,
  `memorable` varchar(1000) DEFAULT NULL,
  `feedback` varchar(1000) DEFAULT NULL,
  `ffproposalID` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `LA27_idx` (`ffproposalID`),
  CONSTRAINT `LA27` FOREIGN KEY (`ffproposalID`) REFERENCES `ffproposal` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ffevaluation`
--

LOCK TABLES `ffevaluation` WRITE;
/*!40000 ALTER TABLE `ffevaluation` DISABLE KEYS */;
INSERT INTO `ffevaluation` VALUES (13,'2019-02-02','dsadsadas',4,4,4,4,4,4,4,4,4,'dskal','dsajkld','djskal',34);
/*!40000 ALTER TABLE `ffevaluation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ffproposal`
--

DROP TABLE IF EXISTS `ffproposal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ffproposal` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `unit` varchar(200) DEFAULT NULL,
  `department` varchar(200) DEFAULT NULL,
  `datecreated` date DEFAULT NULL,
  `programHead` varchar(200) DEFAULT NULL,
  `activityClassification` varchar(200) DEFAULT NULL,
  `targetKRA` int(11) DEFAULT NULL,
  `targetGoal` int(11) DEFAULT NULL,
  `targetMeasure` int(11) DEFAULT NULL,
  `projectName` varchar(500) DEFAULT NULL,
  `venue` varchar(200) DEFAULT NULL,
  `speaker` varchar(200) DEFAULT NULL,
  `objectives` varchar(500) DEFAULT NULL,
  `actualImplementation` date DEFAULT NULL,
  `totalAmount` double DEFAULT NULL,
  `sourceOfFunds` varchar(200) DEFAULT NULL,
  `step` int(11) DEFAULT NULL,
  `adlmremarks` varchar(500) DEFAULT NULL,
  `adlmdatetime` datetime DEFAULT NULL,
  `chairpersonremarks` varchar(500) DEFAULT NULL,
  `chairpersondatetime` datetime DEFAULT NULL,
  `deanremarks` varchar(500) DEFAULT NULL,
  `deandatetime` datetime DEFAULT NULL,
  `ovplm1Remarks` varchar(500) DEFAULT NULL,
  `ovplm2Remarks` varchar(500) DEFAULT NULL,
  `lspoRemarks` varchar(500) DEFAULT NULL,
  `lspodatetime` datetime DEFAULT NULL,
  `lmc1` int(11) DEFAULT NULL,
  `lmc2` int(11) DEFAULT NULL,
  `lmc3` int(11) DEFAULT NULL,
  `lmc4` int(11) DEFAULT NULL,
  `lmc5` int(11) DEFAULT NULL,
  `hasVoted1` int(11) DEFAULT NULL,
  `hasVoted2` int(11) DEFAULT NULL,
  `hasVoted3` int(11) DEFAULT NULL,
  `hasVoted4` int(11) DEFAULT NULL,
  `hasVoted5` int(11) DEFAULT NULL,
  `lmcApprovalCount` int(11) DEFAULT NULL,
  `lmcReviseCount` int(11) DEFAULT NULL,
  `lmcRejectCount` int(11) DEFAULT NULL,
  `isRevise` int(11) DEFAULT NULL,
  `userID` int(11) DEFAULT NULL,
  `lmc1Remarks` varchar(500) DEFAULT NULL,
  `lmc2Remarks` varchar(500) DEFAULT NULL,
  `lmc3Remarks` varchar(500) DEFAULT NULL,
  `lmc4Remarks` varchar(500) DEFAULT NULL,
  `lmc5Remarks` varchar(500) DEFAULT NULL,
  `prs` longblob,
  `code` varchar(45) DEFAULT NULL,
  `unitheadremarks` varchar(100) DEFAULT NULL,
  `unitheaddatetime` datetime DEFAULT NULL,
  `directorremarks` varchar(100) DEFAULT NULL,
  `directordatetime` datetime DEFAULT NULL,
  `unittype` varchar(45) DEFAULT NULL,
  `datetime` datetime DEFAULT NULL,
  `approve1` int(1) DEFAULT NULL,
  `approve2` int(1) DEFAULT NULL,
  `approve3` int(1) DEFAULT NULL,
  `approve4` int(1) DEFAULT NULL,
  `revise1` int(1) DEFAULT NULL,
  `revise2` int(1) DEFAULT NULL,
  `revise3` int(1) DEFAULT NULL,
  `revise4` int(1) DEFAULT NULL,
  `reject1` int(1) DEFAULT NULL,
  `reject2` int(1) DEFAULT NULL,
  `reject3` int(1) DEFAULT NULL,
  `reject4` int(1) DEFAULT NULL,
  `studentorg` int(1) DEFAULT NULL,
  `remarktype1` varchar(45) DEFAULT NULL,
  `remarktype2` varchar(45) DEFAULT NULL,
  `remarktype3` varchar(45) DEFAULT NULL,
  `remarktype4` varchar(45) DEFAULT NULL,
  `remarktype5` varchar(45) DEFAULT NULL,
  `evaluationpercent` double DEFAULT NULL,
  `reasonforcancel` varchar(150) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ffproposal`
--

LOCK TABLES `ffproposal` WRITE;
/*!40000 ALTER TABLE `ffproposal` DISABLE KEYS */;
INSERT INTO `ffproposal` VALUES (34,'College of Computer Studies (CCS)','Information Technology (IT)','2019-02-02','unitrep ccsit','Retreat',NULL,NULL,NULL,'Testing 2019','djsakdjsakl','djsakldjsak','dsjakdljsakld','2019-02-28',5000,'OVPLM',9,'ok','2019-02-02 18:59:16',' ayt','2019-02-02 19:00:25','nc','2019-02-02 19:00:45',NULL,NULL,'good','2019-02-02 19:01:05',1,1,1,NULL,1,1,1,1,NULL,1,4,NULL,NULL,NULL,85,'NICE!','okay','alright',NULL,'good',_binary 'ÿ\Øÿ\à\0JFIF\0\0x\0x\0\0ÿ\Û\0C\0		\n\n\r\n\n	\rÿ\Û\0CÿÀ\0=B\"\0ÿ\Ä\0\0\0\0\0\0\0\0\0\0\0	\nÿ\Ä\0µ\0\0\0}\0!1AQa\"q2‘¡#B±ÁR\Ñğ$3br‚	\n\Z%&\'()*456789:CDEFGHIJSTUVWXYZcdefghijstuvwxyzƒ„…†‡ˆ‰Š’“”•–—˜™š¢£¤¥¦§¨©ª²³´µ¶·¸¹º\Â\Ã\Ä\Å\Æ\Ç\È\É\Ê\Ò\Ó\Ô\Õ\Ö\×\Ø\Ù\Ú\á\â\ã\ä\å\æ\ç\è\é\êñòóôõö÷øùúÿ\Ä\0\0\0\0\0\0\0\0	\nÿ\Ä\0µ\0\0w\0!1AQaq\"2B‘¡±Á	#3Rğbr\Ñ\n$4\á%ñ\Z&\'()*56789:CDEFGHIJSTUVWXYZcdefghijstuvwxyz‚ƒ„…†‡ˆ‰Š’“”•–—˜™š¢£¤¥¦§¨©ª²³´µ¶·¸¹º\Â\Ã\Ä\Å\Æ\Ç\È\É\Ê\Ò\Ó\Ô\Õ\Ö\×\Ø\Ù\Ú\â\ã\ä\å\æ\ç\è\é\êòóôõö÷øùúÿ\Ú\0\0\0?\0ıÑ¼M.µv–ª­r7„„ŸLWuiğšK\ØC5\Â@Ç’€#\ëœV7\Â+8›\Ä72\r\Ér}s\ÅzZ]ùcŠ\âPV5¹ÉŸƒ\'\å\Úó\ÓşÊ¬\'ÁD\0\Ô~¸‹ÿ\0²®™®\ËH4©s…û\Øö\Í?g\äŸ­—9\Ô:Œ\åc\í\íóœ\Z’‚v­¾”·b#ú\×F5\r\è\Ù³ß¦)a½e\' 2·©\Æ*\\b]˜|¶fÈ¿”‚›°!\ÎO§^¾\Õf\×\àÅŠ}¶Iw\'\"ÁV\ã¯=y­‘¨\ÈÒ±fû\Üx\"œot+\Æ\Ş>P9\é\Ç\éS õ1Ÿ\àÎŸ(Ü—“rR\"\\s\ë\Ïÿ\0[Ş¤?³å´¿>¥6\×#\0q¿¯Oz\İ[Àwo\â\\oCŒ\Ôÿ\0…$7I#?»mù?\Ä\Ïjv]CS\Ï\à6›5±\Å\Õ\Ş\à73y`ü rzğ?\Ú\éO´ø+¦ù	\ç]\\»U\Æpõª—nXLq)Ç¨\ÏøšU¾)ŒHomÃ€•!jT‹\àN†Hš\çt¹u$¯+\ëLw9¬öø#b÷»…R ©‚1ß·O~•\Òı¶H\î\ÕQùNNI,}1\Èşt‡ZhXÇˆ\Ê…\È<zÿ\0ûTÒ‹\rLx¾\éR\Ç\æ­\ÍÒ†}©€½¡\è\Ã\éS^ü\Ó-\â2}®\á\ÕIù7·‘œqõ\Åjl\È]Árt\ÉÀ\ã<òzs\ÔÓ¯5“40¡A\' ³©Á\É>¾æ†’\Ø5F$¿´ \ì÷›\ÖF…\È\È\ÏN=ºu8\éDtQùt\Z.	i\å€cùñ§ò­“}¹d†t*I?yv¹#§¿\×ŞŸi¨Ê’¤–@\ÉÀ\Î\Õù\É¯<fšŒX©ğSET\å“i\É}¥X\ç¯t\é×‘D\ß	4„5\Ù,‹±‰\Ìø\0óÁ!x<t=kj\ê÷Ï‹`Ú¢8\Úù\àƒ½°Ü’9\ÇA™#5\r\Åö\éÿ\0vHXÕ£\0~S\æg8\àö\é\Å>Hmğ£@]›¡¸mÅ®°	\áA\0ü\Ü\09úÕƒğ@wCöY\Ù|³»,>oŸ‚1Á\Î1\Ğf¥}T\"E€\ÆJ\Æ\ã\æ\È\Ët?‡n=i}ö‹¹Ys–R\Ç;²8\íş\íRŒD\î\È.şøzÁ[+¢DL\ìZ\áˆsóG±\ã#\ÜR\Éğ“A6³ı‘#r§r‹‡\Ë}\àº•nk‰§c\î[pR’\ãq\Îyõ\ëUR\âO±©ÁÃ—\'\îr‘şª•˜‘Z†>c¼X—+‰.d;º\àğ\Şã§¥Jÿ\0¼5ò\çJV\ŞKÊ™A\Æ\Ï\É\É\É\"¬\Ş\\,·%fÎ‡V\àœŸ\è*! \n\äm)#’Ì¹\ç¦8ÿ\0\ëQbˆ¬¾xv5xÆ\Ü\å&w$	\Ç\Í\Ç\0ô¨—ÀU‘›LCóü \Èüõ\à\r\Üõ•Jòğ>÷$\ç½:Ó¢»1\ÆH\0‰r¤w\Ç?^½x\æ€W+Â¿\Ğ-]˜\éğºñÁv\ã÷¹¨\ÓÀš\Zsö¿\ï¦?û5X7E[=ıqL\î\êx=ihib¼\ÑXóa	ôû\ßüU7şM)Hc\ãŒU“\Ç#\Ô\Ó\\\àqNÁÊ¥s\àı%\ÏüxAùšC\à\Í%\å\Â\ßùÕ”“|õ¡\Üæ¥b“xCI‹?Šoü!\ÚA?òƒõ« ‘G™1@¥~…1\à\İ t\Ó\íÿ\03I\'ƒ´‚?\ã\Â\Ì\Õ\Â\Øôü\é²H1ş‚53¥ğN‘\'aˆP\äb¸¯x+û\r|û}\Í9%yõ¯D\í“\ã‡xVóı\Ï\ê*f®]Oö…ÿ\0kEG°úÊŠ\æ6:Ï„RÔ®\É\ë±?™¯A\Îñı;\ZóŸƒN­“¸lL{rk\Ğü\Ìz\Öñm-L ®<61ùSª1 =¹õ\Í<6­hö/|oµ¹\é\ÜÔ¤ƒÓ‘\Øú\Õu9\ÏCOY=Mg7w¡Z’Œg½H³\\z‰$‡×±ô¥VÁ\äñüªGvM€!8;I\ê	\ëı*eË¯e\Êÿ\0{­V÷²2\0sşM ”Ÿ¾[=9ô .\Ëm1„s\Æ01Ğ½±!‚’\Ø\ã·~ªºü\ï• `\É\ÎjC zŒ\ë\ëHZ–\ÚiÅ¿€3·w ÿ\0gŸ­B[ks¹r@?\â;có¤’WºX\Ç\Èj\á\0Ú£\××­V\Ô5(4\ë7š\á\ÂA\n—ff\Ú8õú\nR\Ë] pûW\'NÒ½{úZ‡Tñ-®™k¸¸\Ş<6\ÒÍ´c-\Ğúu<{\×È¿µü3\Âc}7O{ıh\ÈC1À°O\ŞA\à¾T\r§‘¼zW\Ä?o_|T\Ôb¸:½¥i\Å,1Ee\Ø\\\Çş±‚™9RrÁH#\0 šPob\\\Ò\ÜıGø™ûjø\áu\Ê}³^\Ó\n$‹>w)2£8\ÇT]…‰\0zY—ÿ\0·\ß\Ãû}n\Ú\ÏûLÌ°\\\\™Ë·«ñ÷\Ç•\r§±5ù\n·:Ö»¡\ê7\Ó\Èom-™­\Ö+É™¥…;\ÓR\ÙVÀ\'~–FXW;©kú€\ÔşËª_Z\İ*¬¨eUD…—\Î~Km\ç|’m\ŞIÀß²0sGê¿¿àªğõ\Öä€ˆB\å\î\îD†2\á¦\Ê\0‹–ùbbw\Ï_³ÿ\0‚º\êVú‰\Ú\ãK²¸+\Ùc·q#~\éY®ˆ\Ş\á˜\ç¨#vAñGÄz\ËM½\Õl\î$\Õ.\áó?ycr\ïk*2›­“\Ë\ïı\à,rB˜‘\Ç\Øx\áZ\Âú/.g†\á\ÚI‡\Ş&)G\Ìy\Ü~w9`H*v•<\ÒöI\n\ç\×3ÁP¾-™¤³—Fh-\\F\ßiŠR!Mù\Èìœ«……\áúz\ï\Íÿ\0>ø« ø\Ş\É&}#Ro³\Í%Å‰gˆ2Ÿ•\ÚI@ûªûÀ§‘€\Üñv±ª&¿¢[8x\ì\çdª@\r`+\Æ\Ù\à\í„!‰\çi÷ş(óü[<\Ûu\nl!\Ù\ÊIo™›†fpI~xÀ\ÎEªq\ê\ZŸ Ÿ\n?\à²4\×<Kog«x?Nm=.#†\î\æ)dCl\\o+ƒ“\ÉûùbA¥}·ğ³\ãv—ñV\Ê°–…T\ÚÄœ“\è@#ñõ¯\Â\Í3\Æi-<ñ\Í.mĞ¢2]mŞ¬1\Ç$.™22y¯_øÿ\0	ñ\ÏÀ™4_*}E¬\áÿ\0_²A¶\ëk‚¯Û´Ÿ.ˆbA88‹‹OCX\ÚÚŸµ|\Æ?\Ã\Èô\È\ïÚ£óö\ÄÀc‘{W\çÿ\0€¿\à´z,w_Ùº¾‹¨\Ésicyip“Áwó\àaƒqõZûW\áW\ÅM\â÷ƒm5\Íöû+´VVŠD}„¨%[i\á†@#¨4õZ²\Ò[£ªvò\àŸz2\0\Ï#\Ğq\Èÿ\0\ëşU\æ?Sø\ÓÓ“\È,;3óš9\ÛØ­G²\î\à÷£y=\Ç\áC¨W\á\ÃpG©\ê?\n¨¶\ÃQ\ÏÒ€1\ßô¤i6¿¥\ÛGZ«»\Ø5ù\Ó^M§ÿ\0¯Mó‰<Ÿ¦5\Ûqª\Ô5$v\Ú;\Ó|\ïoÖ˜Xš(\Ô5\Ûq¤¢š\íµh\Ôz„‡	Y~,S/†o}¢?\ÌUó!¥Pñ3\Å=wÿ\0\\Ÿ>üRÔ”ûW“\éú\ÑM74W õ:ƒ\n\"¿\Ô=\n úrk\ĞóšóÏƒjRóP\ÏBŸ\Ä\×Ï®*\Õ\ìLcbT\å©\å”q\×\ß5\0|\np9iØ¢TQşM(~}}ª.}qKaO?7ó©ps\Î\Å9g\Ç=j¿˜ß…9$\äñ@\Ùß¿5\"¾\ÉF@?\ì“Ö««J[&€,.7ó‚¸\È\n\Ã#=3@“÷8=ª??t`c\î€½dx\ÇÆš‚tõ\rN\î\r>\Î\İwI<òmHş¿­\0eücøÉ¤|ğ5î¹®]ı’\ÂÁ\İÂ–?3\0\0	$Ÿ@O¿0¿k\ïø*‡ˆ¾0kš¿†´\Ù4-e¸´y\Ó3\Ü\ÃóGµ¾ö\0[¸>a\\¯ü?ö\ÚÕ¿i_\r7Lim|?eøJ\Ì.\ã%²\ÌAµAÁÁ\æ¾`·¾)6\ÆV}\Zów’AQÉ­a¦R—C¢\Óus§´w\Ïc\ÍV\ËHbG.\nr>^ŸR\0\â•\Ü,÷’G \Ù’\Ê#9H\å)<v‚\Ù^N[¼uC«¦ Škk@¼m0ıÜ„\\(9X\ÇXg.I\Ï<-\rj\î¯f•~\Ñ\Ä\ÙØ …*¬\ï\ä\0F6\à`\ä‚zî•ŒM/ê–º†¹©]\éS\ŞÍ¤4òù\æ<\Ïló•Yq‘¹‘—%K¸#šŠmMæ±°k\Ò\nL\Ò}C\ç(‹rÏ¿c.Kşñ\ã$(~€¹ \å\Ù\Ül\Òe‚96d\ÜÉ·s|¡ö\ã ô¿4ñ©\'öE²¥£Is$…|\ÉeQIc#±`Kd`&0A\á7a¸_cP›:ıš8\Ñ\ãu\n\Ùó\nùR!*Fs‚	ùIø†sV`Ö®f\Ñ\ï<ÿ\0%¿´WH\ã€\"\ÄJJ÷&÷bF`ªJŸ\âi\æõ+·mD“ş‘.\ÎYI$7ñ\ÓùUÇ›\Í\ÓõKù\å‰bFÅŸœü\à\ãeqŒœT–\ÚS‚QHc¹™n[F».]Š`0\Î\â\Ã\î²c\ç\'q#g«OÈ¼:Ú®!C˜\Ë\r\çp\Î\Ş0\Ø=8\îZÉµ\Ô\r…Íô\É,\Ûd’’ˆ÷¿\r\ì9ù_nµ úT\È]e(+}ğD`d>qÀ\ÏÍœñŒR\ZĞ¹\×6\Úm\ÄÉºñ”•\Ææ”©Ê¶G»`ıj$¼YR\Ê&İ]¨°ò¼„®O\ç÷zg=ñŠÊ‹\Í]\ZF‹”3(f\0‚0c\Æ\ïN¼z\Ğöf\Ö\äó!#c„-ó6“ƒ\Ç\ÓÚ›zN¯&««Iw{7\Ú\ZCœb\Â8\Ú¨À}	\É\Í};ÿ\0øı·¿\á—<{2jÒ³x#Uqö´3#[\ÜŠ%\î\Éwu$öòg‡\ï\Úƒ\ä‰Dˆ…‹\ÄO@À€0_ğ\â´t­]­¶\r\ÂJÅ‚Hÿ\0!¦\'£§“\ëÒ“WV5†¨ş„´n\ß^Ò¡½¶’)¡¸f‰\Ğñ\"²‚¤{z\Õ\æe~À<kóOş	aûm\\|<\Õ\áøkâ¹¦“HºF\Ô.¥\'\ì¹M¾A=6\ä&Ş˜\İÏ­~’E(š%u\å\\d\Ä{V\\®%\äöõ\ëC>q’>^œô¤¯•Ê¶üŒ6\î1\Ïlu\ç­DNM )\Ë~o,9¦\Ñ[G`ÒŠBp)<ÁLR3m¡#\ÈúûPy\ãÒ£2;n4”\0Š§\â\0Dº¼/üª\åR×¿\äs\ë\ä¿ğA1Vw<‰²ıh©^\ŞM\ç\ä\ï\ëErtnL·W\àô\Â3^¸W|\âòü{\'‰¯B\Æ*\ÖÀ=N\ãŠ\\\â£”6)€ı\Ô\å!ª4^iÀ\ã¥\0I’\Û4g\ÍÆ•Z€\';*G#§5JA”ÿ\0´(<?˜ ^^-»J\ÇA?\×úW\æ\Çü\ßö\á·ñÇ‰“Á\Z\ê\Üh–¦)õ;¸g&9_lƒ\Èe×·L\×\Ñ_ğU\Ú:o€Ÿ³D¿\Ù÷3[jºı\Ø\Ó-\ŞIô‘™\ëÀ\\q\Ï5øù}\â™5»»–Œl7.\\’\ä=zô\ÎO5¤;\Ò\ê\Æ­\0\Ñ\Å$¶²F$\Ü\Üü„À\\’\Ü³‚2x®[S·Á\ï-\İ~tr\É#1dlŸ(\ÜX|Ç¦8\ëO†\é$\ÅÄ¿ºS\åBy,Jrs\Æ@\ÍAw¬#Eq,Qm–\ê\ã\İ	q\Ù9Á\ä`\ã>„b´ZIufXì ‚x\×;\å\Ç?\ëò \Ï\Ş»|Àü£šS•\ï\Å\Ä\ŞC*`Õ€\Î:\î\'=:’zS\î#v6…	d,\Ìë¸˜”]„´ûÀòy\íÒ™\×\îR\Şd‘w\È\àŒœ\r¼(\î:\çê¹‘#¯lU\"¿\Ú\ÒE,\É–\Ê\Ç8|“´\çn~÷>”û8\ä]6V‹\äŠ\Ú\r\Ó\êwŒmS\Ô\înA\É\ä\ÔzE\Ä~Q¾cLÑ±Œ¡P~ñ\àŒc,I\Õ= \éò\Ç0•wq´‚B†#\'¯ºsP\\F\ß][Ë¬G›O&\rÀ¼\"rKg\ÖB¹\'§§J\Õãµ‚t\ÜB°\rû½ı\Ã˜\à\çrGc&ym0ŠBc$£Io7#±\ç8ü1S\ê3‰\åÜ¸1\\\Ä	 ¶AŸÒ‚\Æ\Ü¹\ÒaFd\rk&ÿ\0/!r$\ÚFáŠ³oz¶š\Äx\é°r2F{duÿ\0\ZËuŒE\ç±W\Æ\Ò \Ä/\ÊFyã§¯¶iò\êyq,“Jè°…“ûşnJ®xRFrzp½M\0lY\êò\ëz\nG$#\íjY¤(wd ÀE\0`ô¦O­Mcc6·al‘ba$\nş\ì \à?\Ù\ç¨<Xš<o\"*[³´³.\0\0yŒ\Ì\\g\'$q\ïsV4K\Ól·	4²•\ÂÆ«´a3Ä \í\ß\Ğ\Zw/ø\\Z§‹­\ä’\ÙÅ€•VHü£!eÜ ®.O$ğÀıj¶™(Y\ã.\Â7onûËŒ`\çØ­1õHÍ¯\Ï\Ç\ïƒ n#rò?\0j;\Ëeò\áeP?t®T\äúúš\0\ìc×®[\Äz}Å¼Ó£\ÄÁü\Å»78\î‘\Æ9úùÿ\0\åı \Æÿ\0\Ù\ËK7÷\ßh\×4!ö\r@Hÿ\0½bŒÊ\ÃnôPß~/5É’Ko-„A9ùF[9şŸ}ÿ\0\åı©\à7\Åû+if´\íj\æ++Ü¸XÈ•\Ê$¬1\Î\ÂX\çwC•2WC?e\Í-Cep. V\ïƒ\íS”t¬€(¤\r»¶)IÀéš«;\\»LÛšo—§5ı\Ş\Ô\ã+=@|‡½ŸÂ˜Ni1Š3VÀ\\g½5\Î\r&\Ó\ëM2n\íLuU\ÖX2\çş¹?ş‚j\Ë>½U\Õ\í:\à\Ó\'ÿ\0\ĞM\'+\ã\Íy6\ïõ¿ø\í3Bw}(¬9‹\æGAğyš]Fÿ\0v2¡:}H¯B\ç\×5\çŸX.¥~9\Î\Ô\ç=y5\ß\î¡l@ğ\ÙjZ4\ån)€õm´ğr*:UnhôRn´\0õ\éU<AªÅ¢h÷R\ä\Åm#\ã°§cò÷¯™¿\à¡ÿ\0´\Ú|øQ¨\Úyª\'Ö´\Û\ë{l\ÈW2ª(\ÇÇ˜§¯¥>ÿ\0‚£~Õ©ûDüd60ùŸ\Ù\Ş{›(n\Ü;¶\×brI\ÉB{b¾\\·fIö\çkg¨¨õ]nmKT»¹—/%ô­,²;½‰$I=I¥±™mdÌ˜m½z\Ş:#)½t-Op\Z0‡B½O\éQ¡ûb:Æ›/·¯Ÿn‚³\Şø\ÈÜŒõùq\ÉÏ½$—k]›y\äœg\ß™kUb\ìBñcS»pR?Ç¹°\Äcû§¶9\çÚ§²\Ö|Eı¤“Ki¨¨Ü’\Ä\Å7\İ\Î\á‚AŠ\Ã\âL‡RA\ëı{ş•4J\×dE\æc\î\")=0NGz6O\"õş´ú”¤\ÌG\Ì\Ì7(\Çn\à{v\ïÉ©F´d´…Wj¤g—só\È=1õ¨¬´=OP†E\Î\æq•Y1e@şœ÷¥]\n\é›\ÒpĞ·!b\'<ò;\Z\Ï\ÚG¹²¥>¨EÔ–;\äš5%Wh\Ç==F)º~¦ğió\Æ!²Á‹Û£Ë¯œr}Aö\Å@\Úl–’•6\Ó’ñ‘“z\Ú\Òü56¡§\Ü,eU\åQ²(\Î\ã.Óœœ~i¹¤®?g\'¢F0Š{…WÛ¸œ{ôıh7ò¼®ÀŸ6\Î2@Á\ÇOjô|¿\Ô\å1¿›0²¿2\Ì+m wû½+~÷öOÔµ\ê+{\Ë$\ßó\Ã2*0>n½\r`ñ”Ö›G]«ò9¨b…\Ùq\ä¾W!\Âí¹89Áş]1\n$iûÈƒH\Òo;eİ´…	·\åÛ–\É\É·LŸ\Ä³ö· \Í1{¸’\" \ã \Ï\Õ\Í^ør÷O\Õü™\á(Ãª’‹Àû¹#<g=OÒ¶hK\áfN„\ãñ\"•\Ã\ìŒsò¿\ß\éZW_\Ú:•K;@V2r\0é¾µNFYm›\æß¸/i?w©\'§_\×ÖŸhV\Ê\ÊI72Êª!;\ä#–c®8\ÎkC&˜ß´–ƒn\0\ÎsW4\Ûóhª»Š…\"\\\ã\Ê	üqùU?-\â|<mv\İĞƒÿ\0\êıi\Ñ¹\Çñc<\çùş”ß‘:Ÿ²?ğL\Ï\Û ~\Ğ?m\í5©Ñ¼U\áökmCTJ»—*óĞ¦\Üû©¯¨üÒ§ŸÊ¿ÿ\0a/Š²ü1ı¡ô‡IXZj*l\îU$\Û\æn#8\ç\æù\nı¼²ºö\Ù^6¤A®yhÀ´g\ÇjF›\"™š(»µ€	É¢‚qLf\æ\'Jm\Í&\áM6¶i¾e#74•ª95 »¬¦ÿ\0®Oÿ\0 š˜œT7L\r¼¿\î\äjf€ñ\ÉD‘†zt¢¬\Ë‰[,3“ÚŠ\ç_\àó–\Ô/OO•?Mz	’¼ó\á×¨\ßü¸\Ê\'ó5\èŒšµ°X˜t¥¦p:SÈ¦•¹§‘QÓ•‰4\0\áÖŸº™E\09\Ï\ËÁÁ\ì}+óOş{¢\İ\Í6ƒ¨GÆŸ`²­\Æ\Öb‘K#§8\è\0{\ã«ô¥†\áøƒ_ÁUô‹I¼«\éWK\Ø\Ç%”ò?\îc¹\ÙúTŸ““Á\Ü\éLi+“b\áI a±ó\r\ß\çú\Ó/®\Ô^·–Y¢\É\0°\ÚX}?Î®^\è\ÒZJ\êê€†e.vò>•›ulVt:zv­Œa¸\ã!¹¶|¤cv	ú{Õ«:\ç[œ¢G$Ÿ˜…<}qT¢´38Ùü€s\ï_Nüø#kƒ­¯\îÌ¹\Ô-\Ó,„\ä\\ñ\é\\ØŒDiF\ìô0¸WZ\\¨ó/‡?³\ï‹`·œ\\D\Ë>\à¦[…à³¶>AwŒf¾ŒøSû\éz.É®á·ša\×‘œ	\æ½SÀ_F‘§ùl>s\Æ\ÑĞ‘·\è:^‚–ğÏ’s\ÆM|ı|mIû·\ĞúL>•-R\Ôò\è>\0\è¾|q;uf|²}:ô­Áğ;C\ØV-2\Î/—[\×\'­v\Ğ\é¢go,¨\Ãr£UÁo#\åDq\ãO\ï°?•q^W½\ÎøÁ-‘\â~\"ı“¼?«\î‰t\ës$‡#\ä`\êA\â¥ğÿ\0\ì\á\ïA\ZCkÉ\Ò\î\ßÓƒõ\í6~¾òWvrWĞZĞOE‹f\0À\È\Åj§+Z\æsPOmO>\Ò>i: Q…¬2Œdó\ëZrxF\Ô.\ÓH„`³ù\×Wq¦ˆF\ïP*‘ˆ«`ø¶+÷*3º\Ø\äu\ï‡Vº­±\à‚]\Ã`\ß+:ŒW™x»ör°»ñ\×2XÀ\åe\È\Ü\0Œ`ó^ö‰–\Î9\ì3Ö ŸNóW\ç\\Œô\Í8·˜š‹\İ\rüSıš†‡\á±slö”™„\íBGÍŸN½«\Æüi¡O\áMb\ãM¼F2[¾Cùx2($t¯\Ğß‰_\âÕ´›˜Stbt\ÆòG+œŒñ_~\ĞÚ¯öf·’R\æ\Ø\åFw2±“\ê}8¯s.\Ä\Êr\äg‹™ai\Æ<ñZcwqö‹®¬@]\Ìx §ù¦ÛyÁ\Ãnıi—6-— €F\î™\î}óª\è\å8\ç\Ó5\í>õ74K¡j“Ù·Ù®¬\Ü¸RA2\r\Ì\ç¡\Î\İ\é\Í~\âş\Ã\ß?\átş\ÏzN¾¬û®2%w\Ã\0ŒşUøSü°J>\Îp\Íò’0N}+õ\ßş\ç\â[[ösº´¸˜\ì\ë\ï%!\È&ò\×\0\à\àúık*½\Ä}}\æcŞº£4µ +6i(¢€\Z\Í\Å6Š(\0¤\İC6\r2µŠ[€®\Ù5Ëº\'÷Sü>™3m¿\İ?\Èÿ\0L÷\Ğ!¸Œı¡ø?x\ÑD\ì|÷\çøj+\06>\'•ª\ßw;ö\ä× n\Çzó¿ƒÒ³\ëÛ»ªÿ\03^‡˜qV¶¸\å~y5 \ËrJˆz\n)`9xj‚7\ÙÚ¥IC\ë@nš`\æ€q@g\â·¶£\ë³‡ˆ\ßWH¦‚\Ö\Û\Íò\Ø/˜ì®¥v3d+dzô¯h-\Å|£ÿ\0_ñ\ä~ı›µhE\ß\Ù\æšH\Õ6<\ìH:PRi‘,ŸûG\Äz”‰¤BO\İ\í\0m\Îpgñ\Åco¶’w \äüÅ€}M[\Õ5=‚V\ãtÌ²±S÷_Î²­\ïR9°UŒ|‚§¡Ò¢\íb\r\ÊmJ%v\ÌjWsüÿ\0Jû‹\àF!ğ¦‡…Oœ±\\\ã2ª•q\ï¸W\Å\r4\Õ\Õ<]ek\"gÏ•F\âxPs“úW\è7Â.-Cµh\Õ	h\ã\ï®k\ÄÍ›ID÷òho3\Ñt{±É½¾bA<úœõ\ê\åÌ\'°‹<g5Zƒ…\ä=*uu‘_=z`\Õ\á3\İ\í*¯Ê€v{\ë\ïZV\'ny\á‡\åYñ•ó@õâ´ µ c®zR\Ô/­®Z·Ùº™ö•9<{\Z‰\ãhú\â‘\Ãc¿\åZ	¨²Áº2ùš¡©ƒú\Ò\å\İ\É\ÏÇ©¨®È¼\r\ŞÙ©aÕœƒ\Ã\0{|µ#O+ Va\È\êJ§$6\\q\Ç5<r#p\ãÔš\Ê74vw™nşµùõûSx\ëHøÁ¯]Y\Ä.-\î<‚23\Ü\Ä\åA\Ïaù\×\è,÷*N8\Æ9\æ¾ı¶tKÿ\0ü[¾\Ô`wk]EX\Ø¬ª\ì\ÜtÁük\ÕË¤•K3\Í\Ìb\İ-:‘¹IÀ›\Û$\Âû\n… \Ü7`ôÀ<\Ôh\ß>\àF“ş5$¿˜¿&JƒŒtÇ§S_Lô\Ğù2m6Õ®%\0\â¡\ä`£23\ï_ª\ßğK[ù¤ğº\Ù\Ë{uk`†\Ş\Ò\ŞX­®Š\ÆM#°Ã¹\ìsL\ç5ùH&òQ27m\è½Àç§·ZıTÿ\0‚Xx|\'ûf“·E¸ğõ\ÜV\Z½Š…‘u1\å†K\ØƒœŒ˜°	æ°¨µ¹i¦}Â€F€z¾´ æ¡·“Í·FõPy\ëø\ÓóŠD½\Å\'šM\ÔRg	\Å#79È¦\Ğœ\ÓZP‚—8¨e}\Ç\0VŠVB»\×?/¨¥“|g\éF=…dcje+¡G¨6\Ûùñ\Ó\Ìl~tTz£2\êw\0+J\Ã u\ä\ÑX¹ğ’&]nópÀò”|\Zô$}şµ\çÿ\0	\ï…Ö·v;,?–Mw\Ñ6\ÜÕ­†÷$ü\èü\é¾hõı(\ßô¦!ß\np{ÑŸqF}\Å\0=f\æŸ\æ\àıjûŠ	\Ïq@	\ë_ÿ\0ÁktYO\ìóaylHµ%óAÿ\0k…ık\í5ny<W\Ê?ğY8’\Ø\ËWù¾d¹¶uòVU9\àö\ëL\Ç}DùQmf\Ü~QŸÂ¨[\'Ç§wÖqw\æF£h\Ïs\ëU\Ëù\\z\×E\Ø÷Á\0\ÒxûJ†?˜Ü¸ŒñÛ­~„xıD·L7\î¢P£</>µñ\ì7\á9|KñNk\ß#}¾\ß#„b=+ëŸˆ_ôß„\Ş7d\Ë8+`–o—¾:t¯Ì¯*¼§\Ñ\åMF1\è—^ ‡Mƒ|\î#Q’FO\ëP[x’-E·\Ç:mng$\×Æ6ı£µ¯Ü´³ùºlA±¸s\æ\Èvƒœœõ\ç\çÚ³\í¼#ñs\ã@Xôû;\íKA€«x-\Ùñ\Ï\ÌKaÏ°\ãÚ±†¬\Ù\Õ,kû(û…~!\év÷±CöøòŒA\ïùWK¦x’	\ÎCy™^«Ú¿>®ÿ\0bÏˆ>¶7H—S\Ü2–uy”¶2>\ë\ïZÿ\0Ä<*b\Õmş\È\å^\ÚY,¸\È\ÚNv\àö#¥kR…(«©\\ÎJ’~ôO\Ğkˆ/¾n£¡Á\éROl.{Æ¼‡\á7\îZ\Î8\æ{‰1\Êò|À\çO_Ê½5u_´Â’3\Æ®U\Ëc¥¦·5\ÒI\éŞ¨\Ë$*\ä\ÏP=k‡ø«ñwş]:MIwq±¼˜„›<\Ç!s‚98ü\ëæŒ´ÿ\0µ6+mOhf™L…\íC¹€G\Ş\ã,p:v5p¡w¹2›Šº>¹½\Ô\à‘\Ø,­”\ê\n¿•F·\ê\Ğ\î,1Ğ“œ\nø\n†Ÿõ©\í\ç:—ˆ¼Ùœ\Í.ofCG\ÃsŸOnµ¯¿\âŸÃ‹·2\ëº\ĞWE\Z‹\É$J?º¡y\ÔÖ’Á§ğ\É\ë$õ‰ö\í\Õ\Ö\Ü\àdc·zó?ÿ\0l~6xQtù\Ø\Çs	m\çCµ¢~~\\ÿ\0p\ç¦Zğÿ\0ş\Ù\Ş*ğe\Âÿ\0lé‹«Xgdl\n©ş/\âÏ§c^\éğÿ\0\ã&“ñ9#“L[ò®»ˆ’\ÒP€Š\0z\×=L<\è\ÉL\ë\"X¸3ó÷\\\Òn¼9¨\Ía{…\ÚG‹\0‚+aÇ¸ªˆ\Û3óx&½£ö\Ùğu—†~*ıª5t]B<‚8–;»g¦+Ä‹ùò••ô\Øzœô\ÔûŸ-^—$\Ú,Ùµ2ƒ\Îs\Ôv\Å~ÿ\0Á\æ…\åø‰n%Y3(q\'şCğ¯\Íäœ¶Bğ@\Ïú™ÿ\0Uø#ÿ\0w\Â\İG\Ås¤‘j:õÉ„\êP\Û$h\Ñ\åBr\n¹œÚŸuªí¥¦«qJN+0\ÔZcõ¥fâ›œ\Ğ ¦Jÿ\0)¦³mnOZc>OZ`(“şªo\çF}\Å÷¢€÷…ñ\ßô©”l€ò]DgPŸŸùh\ßÎŠf­nÿ\0Ú—8-5±Ï¹¢°W\á\ZüAy·¼#?zyÿ\0Â¡·^¹\íû1]ú¶êµ°=Å¥_¼>´”S`s\éFy\íP\äŠUm­š\0›Â°N¢‘p\ïC¦ÿ\0_Ê€×°¯#ı¸>\Ëñ¯ölñ^‰kl·ZŒúe\ÇØ©9ŸaÙŒwÈ¯[½Sñ¹m\á­\îş\íŠ[\Ù\Ä\Ó\ÈŞŠ£&µ*1¹ü\çkzTºV¯qg*§´‘\á™Uu;X~\Z\Íl3rÇC_B~\ß\Zƒ®|k×¼O\á{k\ëM;Y\Ô&X\ç\0¯˜\Ç,\é\×›sc=ø\ÇJùú\î	]’W÷²\0ªw&®hNPf\Õ(NŒ\Ô*+h~\Ã?\Û\Â\ß\n\Úõ\ãıö±7Ú‰\Ç!6 U\ç\ê\Çñ®\ï\Æ	n~&kª÷j°Z[¶R1É”ô\É\ã\Ûõ®›áŸ‡#ğ\ç‚t›ùV\Î\Ö4#\Ü\"Š\ÜÔµ¨ô;C!\Ï\nz\nùj\Õ[¨\æ\Ùõ8zj4\Ôbq¾\Zø\r\á\Ï^Ë2\Î\âü/\Ê\å²ÿ\0*\ê—\âO…¼2¥Î±¥iˆ8!®\0`\İf¾gø\ëñS\ÇüGı¢Zµ–)R÷;±ğ	<şşu\Êü]ı“-|A£\Ø\İøB\çQ\Õ\ï&‹Ë¼K\éQgiÕ‹\ï\ç	·`…?‡Zt\è9»Ô†µjÊœ}\Ø]Ÿb\Åñ\ß\Ã\Ú\å\ÚÅ§\ëúe\ïğI\Ç=N1Zw\Zu½iöˆ£<\ïœúÿ\0Ÿzù+\à\ìq­Yü@·\Ö|{¡%İ„He··¼G’fxY#ó0\Ä\Æ+\ß~\èZ—‚üa¢\Øj‰\á\Ë\Öö«3\Ç3Y“\ÈË«¦I\å—=Hâ¢½\Ã\à•\Ë\ÃI\Î>ôlt\ÚN’±^)P[…\0`]¾`\Ò\Ùy‡syc#«˜X~\Ê\Ç¯Á+¯\Òõ?ø“Ê»s;\Ö0“‰µJi£Ï¼}¡&»¨y’ª¿–:HN\ã·\áúV~‹ğò\ÇM³Y<¨¡/”`şz\×C«\ÈfÔH+“\Ô\Õ\Ìüf\Ô\r¿i£\Å~l XÄ·7‰	‘\àRFR\ì@©\0Vq“›\Ô\Ò	%±\Óh\Z¾—©io\È™”g·z\Ğ\×ô\í;_´O´Ai{¶C²©>Ş8¯†¿i†:‡‡>!½\æ•}¬\ëºiŠefbˆ\ÙÊ°*\0u Gz\èe\ZÏ¼+¨\ë\×:î·¡[\év\ì4û˜¤@%¸.\ì2…rÈ \İ2z\Zô£‚²º’û\Ï6¦*ó²†‡Ñº÷\ìı¡\ê\áŠ[Át;Sù\0qV¼\à4ğ×•o\ZFŠ¤)D\0ã‚¼c\á/\í_\â=7\Æ\Ãş-Šö€¾\Û\ËHğz‚9¨¯£4\íj-Z\äCÃ€À\ã\ÔVœ¾2šº¼Qò\Çüg\ÂN§\Ãú\Èdb[Y€uR„ŸÄÂ¾^Œ\í\Ïrzc¯Ò¿C?i¿	E\ãß„ºÅœ»ˆH\Zhöœ\Éó\å_Ÿ:u´ïª­ŒQ<—(Œ Ág9\Ç\ç^\æ]8û;v<Â›SO¸û`-\È\Üq¹€8=³ú:ıºÿ\0‚mx>\ëÁ¿²_…moQ¯i\Ìd.\ÂRH‘\×#Ÿ˜Œ\×\æ7€?fmK³µG¨\Üj>jLğXÉ&<\ä\å\ÊN\Ñ\Û\ÔW\ì¿Ã>\ËMğN“œ–1YÂ¶\êÿ\0xF#A÷\Æ+xb!Q\Ú\'6\'R„b\ê-\Í\Ú\\“IšBG­tò\èr\nx¦;\àõ¦\ÈNs”\ÆmÇ½\n=ÀN´mö£ó¦³m\ÓZ\0\ì{\nM\ÃıŸÎ™\ç{~´\Ê4Wl/¨üÁŞ’‘—q¨•¯¨c¬\\Õ®†:L\ãõ4U}lí›¾?\å³ÿ\0\èFŠ\ç_\ál¼Asƒÿ\0,¨®ó8¯6øB?\Şmf\æ\Ğr+\Ò7QV¶)®¢\î§+qL\Îii’IE3q§‘@DûW¯\éNóG¯\éQQ@†\Ïq^mûW\ê¿`ø#­&yº‰`\Æ~ğf\0Ê½!xAÓ¥y‡\íg£Í¬|\'¹òT°Ğ¸Q“´°ş\'øN\ÇV	E×‚–\×?;ÿ\0i¯O\áeüpG\æ-®A1®mû\Ù\ÏÁú\×Å\Ó\ä\ÇZu­Ò•uº8oc_£:ŞŒ5yã¶”G$s[˜d†w`m9\ç­|qñ«\áÁø_û@i\ãÎ²¸^)<½œ\ä‚¶\áİy™ekE\Òg\Ô\çX^w\Zİ·t@%µŒ\â\0gÖµÿ\0±\æ2oS\× U:\ÜÙ²)2~õ\Òiğ\ïˆtÁ\Ç\æMj][c\Ôş\Ù\İ\ÊdX•$öQ\Íş\nXH<¶1£¥wñÙ†?0÷*Ù§÷û\â’\Ğ\é\ç\îy\íÇ…\Z\â|•ƒÁ\Ï5³¥Y¶—\Ô\Ê\à`cµtwV\é8!cÀñÖ³®“\Ë\ã\ë7vZ(\Åh<¿›{Š\Ù\Ñ\Ó6¸Ş¹û­Q\Z\ìG$(ù½\ëf\Â\ï\ìÖ¼Œ–\è}*yYf6±jF§\'\\\ãËš|\Ò\Éwc \'t®0\Äò\ÄœşU‰®Z)Ä‡*œûU\ïˆ\ï\Ì9õ\íB‹N\àr²Á~’²É½Õ‰\'q\ÎzŠ	A|©\ç@]Bœ\ØO¥w\çLŒKŠTö\ÅK6™D6ª‚JÛ˜É»\r¿\Ã[K›…†Ú¹\0\é\Ío\Øh‘\é\í…v(\ì+y,<•\íùS\'Q2piy‘)$?\Ç:Cj~¿…?\Ö<D®ˆqø\ã|iğ\ÇBº\Ñ?jü˜\âO³_¬R\Æc%U$p§A’+\í\ÏÎ­cp\0\Ï\Èxò\ÏÁı9µ\ïÚŸS\Û#7\rsrI\Èò£t%~¬p\Ğ×£†“9Xó\ç:‘õ=\Â\ß\Ã&\é\'“o˜\Í1C\'s\Óô•~xx,\Z%ª”,H\0ôE|+ğ»Á÷3ñ<Z\\÷“\\³n \ã\0s\Ç\Ó5÷„y0*Â€+§,ƒm³!šjœz’ù€÷¤w\ãƒM\Æ;\n7è¿{gÌ†\ïz3\î(Ç°¤\'”\0¹÷\Ù\Èiwö:\ä\ÎF?J:\\\ÑIœSD˜÷©¶·\Ù\æ‚qM-“šBsS>\ày~¹m^\×w\ïşÑ¢®k0gWºùOú\çÿ\0Ğ©[\á\Z“\â;–õ‡úŠôZó¿„-\"ø–\è66}ŸŒö…z%Z\ØO`ƒÖ¤Iº\nˆÔˆW9¦fK@84€æ–€&QÓ•¨\Ù5K\Ä:%\ÑnlnWÌ‚\ê&‰—8\È#×µ\\\ršeN:\Ñ\Ò\İ\ÇÓº>ø­\à\é~üC½´}Û­fùw\r¡£8eaõ\\~µó/\í½\á‹x\åƒSwò\Ş\Îò	¢fÂ‘˜\ç?…~“~\Ö_\â?…Æ¡amCNWw]\Øób\ÆX¼Lú\×Àôañ#Á7ZÜ‰ÉŒI\r\ÆÌŸ—\æQ\Óx\äW\ÎÕ£*ıİµ\Ã\â\ã‰\ÂY\îi¶¹[E&\ìùƒw\ç\ÍmX]”TÀü4\×·şø~øñö­>HÁNÑ»õ\Íu–’™|²¬N<\ÖU’R1\Ã\Ş\×:x\îL«úTğ9\Æ3Y¶\×<\àv«°Ü¢Œ¶\n\È\ì4\×*xô?Z\åüw|\Ú,#b–yN\Ä¹5Ù¤Èyñõ5\Çx\Ú\åañeªIÂ˜\\¯¹\Êæ¥­4Tm\Ø\Åğ¾”\è\Şm\ÎK‚®\ãAğ»k0†5	\Ë:Wüsı¦|%ğA­m5@\Û_]\âHaKw•™y;GƒŞº|^·\Õ4h®\ì\çK¨n#•;v‘\ï\ÎqI&—¼t-]‘\Ò\ëšRyr!\Û\'Q\ëX\ŞIt»Ï±¾ÿ\0.BYY»{f¼\ï\â\'\íy\á_†^&Š\Ï[ÔÙ¥=V\Ù\äô\åŠğ5\é~#³¾Ñ¢»·e€\í–)S€ş\ãó5|¤\ÎVG^–»‡JI uf\Ê\à\\BŒ:ı*¾£.ØÖ•‘\Í\ÎÛ³)\Ë9<ô\æ³\ç¾\ÆTôúÔ·\×=H\ãV\\\Ò\ã;¹\ç½1\Ô*k2§“#\áR*ğo\Ù/C3üFñŸ‰f\r™®æ³…6\ãhİ–9üò¯o\Ö\åX´«§Bç™\Úk\Ë>\n\Ù^\êfk[8Ê½Ôœª\àff/·\n}\Éş/\å]wq§hõ9©[\Ú\Ş[#\ë_Ø‹ÁR^\ëwº\ÔË¸[#[¡+\ÒGÁ$÷xüké¼‘\ßô®3\àŸ\Ã\Åø]\àKm7!®˜™\îz4\×ß P>†º\í\ç\Ô×¹‚¤\é\ÓQg\ÍcñÚ³™6s\×&£ó½¿Znó\êi+´\ã³\Ü\íú\Ó]·\ZBqI¸Ri	À£p¦“FÀ+šJ(<\nMö\0¢˜%\Üø\íD¯\ïY»½À\à5‰öµ\×?ò\Ùÿ\0™¢Ÿ«¦uk?\å³ÿ\03EefjPøI6ÿ\0]t\â~¢½}y\Ç\Â?—\Ä×Ÿõ\ÇúŠôUm\ÕKa=‡‡É¥\Îi”ƒLÌ|¾´õ›™N\"€%iÁ³PR†+@ƒƒK¾¡ûF\Õ\éú\Ó\ÖL\Ğ!ù\×Ó\ï\Çùük\äÿ\0³6±c\â½N\ãK\Ğ$¿\Ó\î\\\É–¢=\Êªl$‚O·Jú¾‘†\áş5J*j\Ì\ë\Ãb\êPwù\Ù\àoj~ğü\Z.³a6™}¥\î·kyq•]\Ç`‘½\ë£\Ó\Ü+ü¾\Õí¿¶Ÿƒ\È:>µQ,hd·ºe\\3g	 sóÖ¼6\Ê_-k\Å\Å\ÒpsY\Î<\ìİ·}¯Ÿ^õn°\ë\ÆEe\ÃwŸ ÷¥kÒ²\ä•FI\Íp=\Ï^*\ê\çQa©o…Ü¶P¾µ\Êü@\ĞÏ‰`E˜\Ã<J•şG\Ø÷«\ÚB~+?û~mJV\Şóò\ç\Ó\ëCer¥©\ÌG\àq<³h\Ø\éw²J™¤¶óqŒ`¶Oo\Ô\Öõ¿\Â;3o\æ[\Ï5˜`	OJÛ6R wglU\ËO+«$7–¯\ác‚1\éM>Œ\Ó\ß\ès\Ş\"ğ>Ÿ†\ÚM:\ÃRH¾m·,Š[H#ÿ\0\Z‹Fğ”¢\âò\ì\ìl\â9Xm××ŒtŸJ\×Õµx.‹n¿¶2zg\0ûXµ\İj\ÊOğ’rñ¥;½­.\Î\×M½6ÖYöË›­\Äg§©®[Iñ<†ñ-¦ù]»\çƒZ\Ó\Şo\à*µ[œ\Í\\šô‚G|÷‘+ml¶vÕ‰/\Ã\ßNI|\Ä=OÖª;‘Q«X\ËñDm{\áû\È\Ö?4\ÉUP@\ÜOõ¯@ıÿ\0gK¥h·ú¶\Ú=¼©~®\îó\á\Â\í {úb©üğ­¿ş)iz}\Ìmf¸¸Lœ0ŒnP}‹WØ–p\éöQAo\ZCJ#Q€€v\ía()\Ú]\Å\â\ç	rA\îYQ´u4¹¦ù”…ò+\Ø\éc\Éº›\æûSKA8 È¤¦ùƒÖ‘›\'\ïb€EDÍ÷³Oi\"÷$sI«€4¡M5\æ\Êñô¨\ÉÉ¢’ˆh&ŠGo—@qZ³\ãU¹ÿ\0®­ü\Í>£l²j·¬ŒZ+S\á/$»÷‡\ÌW¡g\ç?\æ\ß\â;¯h¨¯E\Ş*V\Â{ºœ­\Å3u(ni™’Qšnò)CPÕ©\ÕlSƒ\æ€GZh~y¥\Ü(H¤\Ær~õ(9[u8gŞ€9/ü,Ö­#Íœ[4Ğ¨<™\æQø‘_E!Bmu;YH\èGW\Şm’§\Üb¾Cı¨>7ÃŸKzƒ\Zv±+\ÏÛ…CË¦~§#\ÛÖ¸1ô\ïe\Ğõ2ê¼²\å}NYn†Áş\×\r,¤‘õ¬¿\íPLg¥K©/\\şµó\İO©¤\îK¨ß•UF+\ä‰ö®{\Ä\ß\áğ\äMm•\æpOD§5­z<\È\Ã&q·\çÁ¬M_\ÃöWv«$–VóHv\é\"ˆ÷È¤šgT\"›\Ô\åtÿ\0ˆ\Ğx–\ŞGûK\Ş\Ü\ç\"”cŒt­H¼mo<\æ\Êı¶’ Gm\Ê@Ö¾™¬­Šš(D+ÀM™\ØZ2x»G‰B¼Ãó˜ü\Åh¬w/f•š9x¼B5+iz]\ì‘qµv\í#=zµg\Şø\Îoß§’òÚ¬œ§BO^Wõ¯A‡\Æz|\Ö\ám\r»ñ’O\'ğ\â³\îK\ëH!3uP¼}ıt]Uå¶„\ÚO‰·\áŠO/Ë”\à\î\ÛÁ®¢\Şr\Ñ\ä’=;\ÖZi\ê\é\İ<²Q—\Û\éW¨ÃŒû\Ö|\Èóš-Hû—=³QO&G\rÇ¥Q}P3pWóª\×:¶\ÅÀ‹|ª%˜ğ\0ú’mO]:\îÇ¿~ÅmCYÕš=\ÛJZ\Âù\èÁYŸôe…}ƒj\×ğ/À#\á·\Ã\Ë;•s\"‰\îA\Çú\ÖU\İ\Ó\Ü\Z\ì7W\ÕaiªpHù,Dùª6M#\ì\Ï?Ú™œ\Òfº.I\æ\ê)²)›¨\Ş(´Roo\0Š7\nil\ÒP÷\n7\ne&\á@f\æ“9¤\Ü)ğh\ép0o#\İw/\ïŸ\çEM2+p\İM‰©\Ç|%ˆ/H\äù#ùŠô%pÃ­yŸÁ\Ö\'Ä·™=a\Ç×‘^‘·\éùT­…\"Z\ÅDK\Å=[+\Í32O0ıiÀ\äTY¥\É%(b´\Ån)A\Í\0HE-Gš7P”¡\È\ïQn§\â€\æZò¯\ÛD‡Uø+;\Â\ZM=…\Ò6Ü•\ÆAúšõ=Â¹oz`Ö¾øßƒ\æi·\0\ë\å±¨©”SLÖ“jhø&\×U\İ.õ\Ï9©\Òoô A%zZ\æõ\Ó%¦\àG#Ÿ~•_Añ²\ÜK²Vh\İz‚+\å\å}²¡+hz]¢	\"\İ\×Ò–X3´œõö¬\ÍVóaÛ¾Õ»aó¯<ık›S±=J’iqH¿\ê=rFj¼¿b\ÔX´¶ñŸ¨\ë]-’ S¸/^x«\Ì\åG–\ê­\ÜWs’·ğT:4Ÿ¹·Q\×Š¿Ÿ\å b˜5±\Ó4øqÁ\ëN¸…\0\Îs\Ïö›–\æt1ÿ\0£²lUh‹hzõ\Ç\áWo¯R\Ø\î\Èùy\é\\ŠüY±¾÷\ç*mµj„±8\ë‘W>jRñ¦›<›L÷‘Œ8œuö\æ¼\ÖûÅ²\ë—\ßf„Ÿ\ÄÀsj\ëü>\Ïar&wÅ´‚<¥vQ²g*:3ôz#…\çŠ™P\ÛN³Û£Œ ñO\Ü+\ëcª¹ñQ\ì?Ì¦“šMÂš[š¢õEGº\Ô’Šu¨\Şe8ŠŒ\ĞÙ°i”g4€\æ€Š	\Å&\áK\ÈLJO={\ÑMt\ËO_Z+S\Íşø¨®\È\ïşb½6\ß\ØW›ü\"|ø†\ìzC\×ñ\è™\"¥l\'±6y\è?:B™=ÿ\0:[kf\ç{~´\ÌÇ§\îCOnn†¡ó½¿ZU—stıh}ÀÒ«\â¢ü\é^	…\0X\Ü}(\ŞsQy§\ÔÓ‘÷M\0I¸Qº™š(û…T×­şÛ£]E‚\Şl.„ªGõ«¤vùHõ\ëLqÑ¦~jjğ™\"wm zW\â\İ\Z_¾Ëƒ\Ôu¯P\Õm>Í©\\\ÂÃ˜¦’2=0Æ±õmgˆ\á3šøú“\å“G\İa¢œ;Á\ä\Ño-Ev&\à˜b\0\é\Íz¾\ãk]N\İL3\Æ\ê\à\Ã<ó^C\â_¤ŠNŞ€\ã\å¬+-OSğ„¹·C1°ôÿ\0\ëT\ÆI«£¢\Ç\Òj\ÂE)÷{\r>\Ó\ÄxqO—Ÿ½\Ô×‚Z|{º\Óÿ\0\×C\"¿F%ø?Yÿ\0†·»\ì1w\Æj\ì=\Ğ\ëff\ë\É\çƒDúø†\Ü\îº{W„\ÉûG[4˜;±~™óªÚ‡\ÇY/ÁK+k†f\é¸ği=Ç¦x\Ó\â,\ZU“nš\"\Ì}+\Í/u{\ß]m]ñÃ»w\Ê>ıg\Ûi×¾\"¼In¤f\\œ¯$\×i\áı+D@£{\â•\ì.xcD[XÀÙ´ø®\ÇMµ\"¹©>\ãÖ³4»óÒ¶†%üªT\îMX¦µ>\êøS\âñ\'\Ã\İ\"\ìù–P—À?+lt;\Æ~5ù‡ñƒ\âÿ\0ÆŸ‡ö\Ğ\ê_<]pš]„c\ÎĞŒQ\Î\ÌG\Æğ@\åI\ãu­/\Ù3şC¬\İx\ê\ÛÃ¿´\Øc\âd³}A-›MrÊ»\ç‹\0\Ær\çø}ó_[†­A%¹ğ¸œ<\éM\İh~•\îÖ·UK]Rûhæ·™.`™CE,l$g ©|\Ş+°\ã\æ\ìI¼ŠU|š‹Í¥Ph¶$/\Í‰¨„¹£\Í>ô—q›\ê?4û\Ñ\æûP»‰¤-G\æŸzF‘ˆ\ëúP¥‰”\Ø\Û\å\å¿Jvh|\Ìÿ\0	ü¨¦ª6\Ñó”V&§•|”·‰/8\ã\Èş¢½uy¿Á¼¯ˆ\ï2\Üy\Ç\â+\Ò3š•°\ÃÕ³KQƒƒK¾™˜ú\Å3\Ì\Åoµ\0I¼úš7ŸSLdÓ‡4\0\ä|7&Ÿ\æ\Ü~U(\'(”ÿ\0¥\à¨\Ïj«y}Ÿi,ó\Ë0À¥\äw`ª€u$“À¯…¿n\Ïø+Şğ\é\î<1ğ\Ñ\ìõg\n’\êû\Ø\ÛZ’U\0\Æ÷À†À\ÉôªJû•f}uñ»ö‘ğ‡\ìÿ\0¢›\ßj±Ø,¼P*—\ã0Š;ä¸õğŸÆ¿ø*/Œ¿i¯O\àÏ…8ğÖ‹N±¬O›ÁlF\Ğ\"\å•]ƒ209¯Ï¿\Z|Z\Ö|s«=æ«ª\ßj·“i.n§2I+1\É9\É\ã9\àzšúsöAğ\Ô\Z_Á\ÛmMyú¼³M+\ã\æ;%uAøP+ŸW\ØQ\æ]N\ÜWª¢úÙ¥Èc³\Â\0»\ÎXñÔš\Óx<\Õ\Êş•\Îxj\ë\Ì<ãƒ{WO\Ú1\Æ=k\ãªË™\Üû8G–*&»¢faó(9=+’½\Ó\ÄH9\ã\é^™¦¨³Búõ®[X\ÒJ?<ñ\ÇZ\"œQ¢8´ğ¼7Œw Ú¯Z|%Ó®m\Ç\îùa\rk=¯–q´\çú\ÖÏ†.„wh¥¶`úu­T´(\ã ø#a¥¾ûkpÄ’X³j\ì>·\Ó\âÏ”¡‰\Æ\ÑÈ¯LÔ‘$·\Üvæ¹©\í\Ä÷ƒ ¤\Ù,Ä°±6v’3Ÿ¥ni\ÖÛœ|¼T0\Û\Èòˆpö­­.È¶~fö\íRI{N¶Øœ\Ô÷\É\ä\Û\îÀ\àúV…­°Š\0O\'\Ô\Ö~»(U>™§r¦¼ Ü¶I9\ã\ë^YûY|ƒÆ¾“Ä–¬z\îO\æƒ<J2\ÈŞ¼cøúW¤Z÷Ù­ˆ7ğ\èŸ\nõ\ëÛ²¾M®›;}|¦\0®Jº8‰ª‘p9ñ\á85#ä¿ƒ_¶¾\Ù$>ñ6£§Ú¨ ÀoİŒ•gÛµ}\ÙûÁ\\tÏˆf\ÇÃŸ¥ƒMñ\Ì\Ëmm¨[@E\æTm-\Îcrx?.\Ş{\nüŸ\Í\ær3\rh\éú—\Ùn\Ã|²!Q½sòF\n‘_p|?)ı\Åz—P¬‘É½CSAcÚ¦•²¿~*ş\Ë\ßğQOş\Í(,´ıB={D\0\ÓuYd+l7V#¸`s\Ç÷7À¿ø,?€ş \ÛÆ¾(·¸ğ¥\Æ¼˜{«e\Çûj¼g¾”¹r³\ì$|7^)şhõı+ŸğG\Ä}\âN¡ \ê\Ú~­g*‚³Z\\,\ÈruÆ¶\Ç4Ó¸¶%óG¯\éGŸ\Ïõ\ÅEŠ3\Í\0N­¸qü©’I‘Á¦+\í©(\Ñ\äµK¸¯J‰\äƒõ§ù€u\æ¢{\0\è\íÁA\Ïj*D\\ \ëÒŠƒS\É~¶|Iw\ïõ\é\n\ÛkÌ¾3\İn9>FOıô+\ÒÁÈ©[\nCü\Ê<\Êm\Ì\Çy”É¦Ñš\0’Œ\Ô{«/\Æ^8Ò¾ø~}SZ\Ôm4\Í>\İK¼÷3,H¸õb2x<wªQl\r7–\ÅyŸ\í#û[x3ö`ğm\î©\âR\İ\îmai\"Ó¡™\r\Õ\Ó€ˆ„ƒ\É\ãœw¯†m/ø,N£\âh/4†‹.‡`,šıÒ¡\à`–X¡*p3üD\çƒ\Å|\r\â\İx“Rû^¡qusq1i™ç¼—RLŒ:/®«öl¢ÿ\0l?ø*iš\Ú\ËS»ğg…÷Nµœ5\Å\Â\æ¸ÁŒü¹#Ÿjùj\ï\\÷\È\îÄ´ò·\Î\Ã\Ør\ÔVU\í\Ë\Ë1%\É\Ü\Äõ§F>Aô«ŒBUWA\Æbö¯¯¿a?ü3»\Ò\ÃI¢Ë¹T·;%fnÇÆ¾<.Pÿ\0?j\ïÿ\0f_‹oğ—â¥ó,ge·¼\ä©f\áŒ\×a‡uiYt;2\Ü_²¯\Ìözr\é¬Öº¤‘v\'9\ØZÍˆ½rú„a.c¹\ÖH\äPDˆAV\È\ìG}+sN¹ó\"\Ç^=k\âe¾§\Ü#n\Şe™1TµK$º\\?*‚\ŞFI©§fù~`x9QmŒÊ“EX\Üq\æ¸\Æ)n|1º\İ\Ê!n€ÿ\0Nõbñ\ß>\áZix’Ã‡g j¤0-¬¯\âO.G,¾¹<\n¶4Ö7/\ÎOz\Òxbp;‚\İh–\é-\ã\ã=ª…rµ• ¿Ë1\ëZšr\ß\å\à•›\r\ÏÚ¥\ãô\ïZª|¨³\Ç° ‹—Z\àCjrs\\\æ±zdr3\ïV\ïn^lªœ\nÌ?=\é;\ÛB/¨\ßYù÷¿\Í\Ï\æ?ğP‰kà¿„–z%³ÿ\0¤ë²Ÿ1AùŒwBH¯a\ÑR-\Â{¹\ÜEº4²;P3“_ş\Ô\ß¿\áp|^\Ô/ÑŸ\ì\Ëö{4c‘&\ÕşŒş5ß”\áJ\Ü\Ïdy¹®%S¥Ê·g€d\ÜÊ¬\ÅGE©­\ÔFœ°œp[?A\æù±IÀ\Çzn\nn!†6ŸZúö»,\ßby±;2v+9\ÙÔ¨\ëøô\ÅO¤kMÿ\0/˜‹ †Ç¯STQ|\×û\Ø9$œöüx©\ÕFô9\Şr¤œ/Ë¡¨\å\Ù\êÿ\0ÿ\0j_ş\Ï^!´¼ğÖ¹{e\åN\Í=°\æ\ÒğvH\ÎW\×\ç#¯jı3ı’ÿ\0\àª^	øùg›¯Lñ$Q =BtKk‡<„Œ‚py\ï{W\ä,W\İY<Š[\Ì\ÉqùPpG¯£¨\â¬h\ä\ÏŒñ\ägH\äŸ\áúş•.\ëb¬Bzv©±d.-n!¸…\ãp\Êš²z\×\á—Á\ß\Ú{Å¿µ˜nü7¬\ê:Z\Û\çtyYb`À•¿•}½û0ÿ\0Á`\ìüC$\Zo­V\Ùf\ãûZÑ¿w\Øóc\Â\íA<\â…5ÔV»ü\ÊzŒš\ËğßŠ4\ïi1_\éW¶ºŒ\ëº+‹yVH¥r¬¼\Z\ĞS\ëÒ¯ru$o\åIB\à};\æ\Îq\ë\ëJK¸\ì\ÉT£\æ=(¤\É^=8\ëEdhy\'Á\åÇ‰\ï?\ë\ßÿ\0f\é\"b£µyŸ\Â \Ñø®ç²´?Ÿ\"½*¥lC}ù\çÚ<ûS)c=N=Q$yö®\âWÅ\àÿ\0…¥\Ö<I©[\éZ|\'iA “\Ğ\0$\×È¿··ü£Mø{/†<ı›\â?\Æ\0»¼2\î´\Òó\ÉR\Ã\åy1·€\Ün\äW\æ_\Å\ï ø\×\âY5\ë\×úõÌ¤2‰\ç³Gè¨ŒH\0gµh©Ü–\ì~‰||ÿ\0‚\ßh\ÖVÓ§\Ã\İ6kÅJKR·ò\â\r»-7\îlFGqšøKöŠı´¼kûHkF\ã\ÄÚ³½ª1kkhaDT\Î9\Æ>µ\ä:ˆ^òm\ÌD¤/?,~ÀVl\×\ìI$–õ5ª‰\ç4eñd\Âİ¥\ÎY¿3U\â|C,œä¹õ5J Z@~µn\å¶Ãü<z¢[m•VL\Ë\ÍJ“ø\çò¨cûù©üôÖ¢&oœ1¸?J„\Â~ğ\è½iÛ‚¶I\ëÚ™,¸\íòô\ĞÆµg\Ô±ÿ\0\í7\ÚM—ƒµ\Éˆ‹ı‚\á”ñ’[c\Û%ˆ\ã½}O£Á\è_c_–q\\5\Î\änœ‚8¯©¿e/\Ûb-mô\Ü¢ˆµvi¦º\äu\æ¾s2\Ë]\İZK\ä}>]™\İ{*¯\æ}l\Ğô\ÇÒ§€f,7\ÍÛ\Ô\í\Z\â\×]Ó£»²¹†\î\Úe’\Â\áÕ\ç¨ş¼Óš=>½=+À\ä\åvgĞ©¦®ŒûûA+9>õI­dN›‡µm\ŞÀLf\É\ê(\Ğ.U\r,rœR´r\\I×µR°8<zZ\Ç2x Eı&\ØC;\n¹+—üi4ûfH²i\r´—WXŒ\ÓJ\ær’½ˆ±n1V4ı\î.W<–\à\ÜÖ—öri¶\í,\Åc‰9i$!~¤ğ?\Zù‹ö¤ı»m4k+­Á\ÓA<\íˆ\ç¿Ga°†!–1Ç ù³]Xz«.Trbq0¤µ)ş\Üÿ\0´\ÜPY\É\à½\ådYn©*§\İ`\Øƒ\ìT\æ¾M€}óœ\ÔW7òjRI4¯$’»Y\Ûq9\ç$i‡t²un·½}^\ZP²>W]Õ›ob\ÄlşnH\çª\Ü\ÅT\ãƒÀ UboaÇ¥8r \ár?\İ\é]IX\ç$¨\Ùi\Æ3S\"¡ü¯\Êü\ã\å?&29÷\çò¦Á–gY¥xS€·ÍƒÁ\ïı)6³Ÿa”t8\æ6\Ï5p[—4\è¼\Ë%Q\Î\ÒHü…‰üšŸMÜ³ò@v#N\Ş@,q\Ï\ìæ£´„\İX\ÈøfL\0Ç—§¡õ?¥Iö\ém¼¡€\Ï\È\ç¶3øHÔ½a4\Î2‹‘§<İ1øôç¯½kZ]Mª\Ëh„W)jnŠ›Â„+•g“\ÈÁ=\ëK” f,¬\è\ÂFŒ¦U—1®sş5s\Íû.™‘9$E9 \0\à\ã\Ûõ¤\Òhhõßµ‹~\êm^š\Ç\í2–%Ex^B2.03\Æq­}\éû(ÿ\0ÁX4ˆzJYxé¿±u”Ú’]\Ç6w-–\È\ÉCŒp@\ï_—ö\æj6\É4ƒlğ›÷\"\n\ç98\İò^µmf{¹L&]Ê»e(\Ç<\Î\Ò8#\å\ç<t¬nÖ¥\è\Ï\ß\r_´ñˆ¹²¸\æ$,‘Ÿ”\â¯G/”\ÙúW\â\ÏÁ\Ú\ã\Å\ß¥ót\ÍU\ì.\ì,\ÚVkIÔ™9h”\ã9\Ç\Ì•úAû!ş\ß~ı¤´ña~ÖšŠ¢*§½\Æõº\È?4N@\r÷[\å#\Ğ\çufK‹>Š{….ry\Ï84Q’#—œp\ÑS\ÌI\ãŸ/Ì¾.6\ín\ß\ÌW§\äšòoƒ\Ñ\"ø\ÖfB@0‘\ÏnV°ÿ\0k_\Û\Ã\Â_²˜ñj2½\îºcW\Â\Ë\0\Ù\Ã9\Î\àù5Q2±“g´x‡Ä¶\Òf¿\Õ/-¬l­¼³O(GRI5ù\Ëÿ\0ÿ\0‚¶k\Û\Şø\'\á}õ\í›	\írL\İE·-\È$¨$ó !†Ñ\É#\å¿\Ú÷ş\n\ãO\Ú{W+ª\\\Çc¤&õ†\Ò\Ş=W9À’{r\Ç5ó\ÍÖ fİ†1«œõ~Ü‘]Q‚JÂ¿sGS×[\ÙL²™šC½†\íÉ»¹\'»t\íY’L÷+ó>UFoÓµV\r\Ï?…;±Ö®\Æm½Ivô\Å7v\Í1şZj¯ô\ì\ÅÔ³§!o\Şºƒ\ë\Ûô§Nÿ\0»>\ãõ¥_ôk$O\âo˜şdJl\ËşŒZ•™Dj@ûj;@5\"©e\İ@+ù”ªs\Çğ÷¦1\Â\Ówn –=¬x\È\ÎAôöª\Ò\Èea\Æ;\Õ0…\Í+[ùÃ\Ã&‘j]\ÏDø%ûVx¯\àÎ¡Øµ¥°/™l\åmñ¸\Æ;ƒ;Šú¯\áŸü3\Â^6Ã«\Û\\h—¸Uy|Á$Ç¤‚?\Zø\"\â³œz\ÔEXè¼ŒW#/£WVµ;°ÙjZ\'¡ú\ß\á\Ï\è>1µišÆ‘z‡şy\İFO\â¹È§\ß\é. ‡\Ôm\É\Í~M\é\Ş »\ÒT´3¼~\ëÖºö„ñg‡¤O²k7q\í\0×—S$¿\Ã#×§¦­4~™_\é&Kt;~n=r*æ¢1##óùÍ§ş\Ù\ìĞˆüCp\àƒ\ZŸı–¨\ë´÷|B».õÛ§ByUÂƒùYaÏ¹o:¥m?MµIğ\åƒÉ¨\êV(ƒ%§¸T\Ç\æk\É~!ş\İşøpd[#/ˆ.\Æ\älÊ±+\å²N>‚¿=\ï|a{¨I¾k™d~ÅU3\És¼–\İ\ëšê¥“F.ów8j\æÓ—À¬{_\Ç\ÛcÅŸ®\Û\í\Òiº[`[wÚ‡\äoÆ¼vk¯8\î\'œ\ç\'’MTIµc\Èy#İ°/Ç·µzĞ¡/póªÕ•Mf\îM\î\éR†#¿\×\ê(\ÙQ\0\æ\äb§\"µZu±pI°~÷#-ÓŒ1\ÓÓšm¼¹$\ç°\ëP#şê¤±?¾Oº\à\ç E0-nØ…_w\\œ…I72y[†H n}¹¨0\ï\Ûò§o7H‘\à\É\ëÀo\çP\Ó\ÜksR†C\\\Í\æI•‘ğ\ì+\ÇC\É=F8\àšr\É\çL’cq1¦\áŒüÀ(bú\ÔZ-\ÛÅ§ÊŸ+‰v©F<q\Ós\ëW\ã‘NÆ‚C¼\ÊÛ˜€\ß*eq8\ÇQ\Ï\'Ú¤\Ğ,ŸÌ•v¼q¼ +\ç\îcä¸\È<s\ë\Å\\¶‚I\"kvQ7\ÌÆ¨2p\0\ÎsÓ¿·J\Ë6¹‹÷x<ü\Êzúõ\íü\ëY¯&kx\Øg\n„\È#h\àû^¾õ2ò\Z-\İ@\Û\á]Š+y-\"ƒ…\çO¨\0t ó÷Ex‹\í+;±;ü¶\älÉ¿\Ş\àòNµO¨*K}0£’›\Ğ\ä¯,\0o^üõ©&oºY\ãò\æˆ4€\Ú\n‘\'òsÛŸÎ²,Heû~\í\ìb—RgŒ\âAüY\ÏN3\Ó¥uºgŠ/¼x×ºuüöwvÏ¼¬YWg\r(W\Ï]r\n–³Ñ\æ¹ÿ\0IŒ\â!/e“~26>]\ÍÔ‘\Üz\ãµ\É.ÿ\0R\Ø a—7“\Ï*˜•\0÷\Ï8\à\03YTW\ØÚ–úŸ[[ÿ\0ÁAş,iV\ék¿q,6\Ê\"\æ\ÒciW€X\ä\åˆœ{\Ñ_:C\â]>(•²´Ù¶€<\Ç\Şı\Î\Ö“\ì1\éErZ]\Î\ßs±úñ‹\ã\Ä³W\Â\Ïx©¤E»·\ÓeOI3¶[²§\Ê^9\ëùW\ã\ç\Ä?Šz\çÄ\\\ê\Ú\î¡uªjw„g¸•¸\0wú~ú\ÃûNø\Z\×\âw\Â=_J¾ÿ\0Us\ìb»¼—\ÛÃ\ê¿!o,„WóBÍ»Ë‘“8\ÆqŞ½,4“\Ğğj\Ş:™\Ó\Èe“¯OÖ˜>b}ªY-ö’2x4\Øcı\ç_Òºv\Û\Üj1SÒ¤5=¢Q\Ôf”DµRY\ÎXqNw°r@\àT\Ïn\n\çÒ–\Ö\ægüŠ \ê_\Şõ\ëM¹\Ë\Û\ã\îñŠ%Œ<\ßJ[¨ò¨2z\ĞZ+ª\ã\ç\"¹f\Å*Ç»J|q|¿¥J—WD#\rLh‚¯Nô\àTo•©;\ÕÉ­•ˆüúS\ÕDD÷<\Òµ+F\nÔ“\Æ#U÷$\Ç^Ù \ÙF\ÄOnUÀŒ\àŸJ…\íöpß‘«\Â/ƒ\ÎFsLòr\Ã\æ4¯\âFs\ëœTŠ»›ÿ\0­W,\Äy5\Zes\Û=(\ßr}\Ò?\nr\ÛùjI<dc \Ô\Ì\ÛP{\Óf^W®1\Ó4;$\à½Xy²ÿ\0/Ojb h¶\ã5=µ°I:ö *n~KT­6\Å\Æzr3\ßÚ¤Š/\Şõ¨x¿@{ò:Pdñ,f“q\Ø\Ümã¨¤±p?º=“Ä§ğúÔ–p	#$ö\ã@\Ğù#VV\äu=¯4ì‹™ÂŸ”de±’3J°nr	?QÒ˜\Ô\Ú\nñı\ì\Ò{diZI\äÚ#d39m\ÙL&?8§\ÈW\æ\Ù\"qÁ\èF}†õGKa,{\Ï+‚NqŒ~œt­!–C(t»B\Óio\â\ãÛš—Av9o]\Û@úJ»yo5½¦$Ş­±]L‰\Ô‘€z¯}\ë6i<¦#Ÿõ{»t\ÏN}\ê\ìSMy­$\Í \\ª‰>m«°¶?Î¢æ¤}x²ù^O¾c\Ç\Ú9\ŞI\Ó\éÒ´\Zô\ŞÁ~%F·#\Í´6VAò\ã?7\Êj\Ô$Íºœ1H]”‘\Ñ~o—ò\ã=j×ˆ9-o¥Xü³k0e\nŞ«!\Ç\é\Ôó\ïX\Ësk\ÃD\Ö\é»÷`‰•_i—\Ìÿ\0[‡$—\Ï\àÚµ5«\Û9\îµ¨¤{iI&(ü\Í\à–iw\Ø˜v\'œ\ÖÏ¿Mk˜ÿ\0uS”òs¸\ÂLœŸ­nx7\Ã1x‡\Æq\ÛH\ì±J@‘@á³¿?J\Îm$RmlwúN¥¨j\ZU´ğ\èzSE4I\"y*@#©\ÏJ+\ê|\Ğ\ÃZx66lE´`Ÿ³¨\Ï\Ê(®S¢\ìÿ\Ù','YP4DSL46A9',NULL,NULL,NULL,NULL,'Academic','2019-02-02 18:58:38',1,1,1,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,'Comment','Suggestion','Suggestion','Suggestion','Comment',100,NULL);
/*!40000 ALTER TABLE `ffproposal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ffproposal_attendees`
--

DROP TABLE IF EXISTS `ffproposal_attendees`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ffproposal_attendees` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `ffproposalID` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `LA16_idx` (`ffproposalID`),
  CONSTRAINT `LA16` FOREIGN KEY (`ffproposalID`) REFERENCES `ffproposal` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=256 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ffproposal_attendees`
--

LOCK TABLES `ffproposal_attendees` WRITE;
/*!40000 ALTER TABLE `ffproposal_attendees` DISABLE KEYS */;
INSERT INTO `ffproposal_attendees` VALUES (252,'dsadsad','sadsadad',34),(253,'dsadsad','sadsada',34),(254,'dsadsadsa','dsadsa',34),(255,'dsaad','sadsadsadsa',34);
/*!40000 ALTER TABLE `ffproposal_attendees` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ffproposal_expenses`
--

DROP TABLE IF EXISTS `ffproposal_expenses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ffproposal_expenses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `item` varchar(200) DEFAULT NULL,
  `unitcost` double DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `amountUsed` double DEFAULT NULL,
  `ffproposalID` int(11) DEFAULT NULL,
  `subtotal` double DEFAULT NULL,
  `datetime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `LA15_idx` (`ffproposalID`),
  CONSTRAINT `LA15` FOREIGN KEY (`ffproposalID`) REFERENCES `ffproposal` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=116 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ffproposal_expenses`
--

LOCK TABLES `ffproposal_expenses` WRITE;
/*!40000 ALTER TABLE `ffproposal_expenses` DISABLE KEYS */;
INSERT INTO `ffproposal_expenses` VALUES (115,'dsadsada',5000,1,5000,34,5000,'2019-02-02 20:27:33');
/*!40000 ALTER TABLE `ffproposal_expenses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ffproposal_revisions`
--

DROP TABLE IF EXISTS `ffproposal_revisions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ffproposal_revisions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ffproposalID` int(11) DEFAULT NULL,
  `unit` varchar(200) DEFAULT NULL,
  `department` varchar(200) DEFAULT NULL,
  `datecreated` date DEFAULT NULL,
  `programHead` varchar(200) DEFAULT NULL,
  `activityClassification` varchar(200) DEFAULT NULL,
  `targetKRA` int(11) DEFAULT NULL,
  `targetGoal` int(11) DEFAULT NULL,
  `targetMeasure` int(11) DEFAULT NULL,
  `projectName` varchar(500) DEFAULT NULL,
  `venue` varchar(200) DEFAULT NULL,
  `speaker` varchar(200) DEFAULT NULL,
  `objectives` varchar(500) DEFAULT NULL,
  `actualImplementation` date DEFAULT NULL,
  `totalAmount` double DEFAULT NULL,
  `sourceOfFunds` varchar(200) DEFAULT NULL,
  `step` int(11) DEFAULT NULL,
  `adlmremarks` varchar(500) DEFAULT NULL,
  `adlmdatetime` datetime DEFAULT NULL,
  `chairpersonremarks` varchar(500) DEFAULT NULL,
  `chairpersondatetime` datetime DEFAULT NULL,
  `deanremarks` varchar(500) DEFAULT NULL,
  `deandatetime` datetime DEFAULT NULL,
  `ovplm1Remarks` varchar(500) DEFAULT NULL,
  `ovplm2Remarks` varchar(500) DEFAULT NULL,
  `lspoRemarks` varchar(500) DEFAULT NULL,
  `lspodatetime` datetime DEFAULT NULL,
  `lmc1` int(11) DEFAULT NULL,
  `lmc2` int(11) DEFAULT NULL,
  `lmc3` int(11) DEFAULT NULL,
  `lmc4` int(11) DEFAULT NULL,
  `lmc5` int(11) DEFAULT NULL,
  `hasVoted1` int(11) DEFAULT NULL,
  `hasVoted2` int(11) DEFAULT NULL,
  `hasVoted3` int(11) DEFAULT NULL,
  `hasVoted4` int(11) DEFAULT NULL,
  `hasVoted5` int(11) DEFAULT NULL,
  `lmcApprovalCount` int(11) DEFAULT NULL,
  `lmcReviseCount` int(11) DEFAULT NULL,
  `lmcRejectCount` int(11) DEFAULT NULL,
  `isRevise` int(11) DEFAULT NULL,
  `userID` int(11) DEFAULT NULL,
  `lmc1Remarks` varchar(500) DEFAULT NULL,
  `lmc2Remarks` varchar(500) DEFAULT NULL,
  `lmc3Remarks` varchar(500) DEFAULT NULL,
  `lmc4Remarks` varchar(500) DEFAULT NULL,
  `lmc5Remarks` varchar(500) DEFAULT NULL,
  `prs` longblob,
  `code` varchar(45) DEFAULT NULL,
  `unitheadremarks` varchar(100) DEFAULT NULL,
  `unitheaddatetime` datetime DEFAULT NULL,
  `directorremarks` varchar(100) DEFAULT NULL,
  `directordatetime` datetime DEFAULT NULL,
  `unittype` varchar(45) DEFAULT NULL,
  `datetime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `LA46_idx` (`ffproposalID`),
  CONSTRAINT `LA46` FOREIGN KEY (`ffproposalID`) REFERENCES `ffproposal` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ffproposal_revisions`
--

LOCK TABLES `ffproposal_revisions` WRITE;
/*!40000 ALTER TABLE `ffproposal_revisions` DISABLE KEYS */;
/*!40000 ALTER TABLE `ffproposal_revisions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ffproposal_revisions_attendees`
--

DROP TABLE IF EXISTS `ffproposal_revisions_attendees`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ffproposal_revisions_attendees` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `ffproposalID` int(11) DEFAULT NULL,
  `revisionID` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `LA47_idx` (`ffproposalID`),
  CONSTRAINT `LA49` FOREIGN KEY (`ffproposalID`) REFERENCES `ffproposal_revisions` (`ffproposalID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ffproposal_revisions_attendees`
--

LOCK TABLES `ffproposal_revisions_attendees` WRITE;
/*!40000 ALTER TABLE `ffproposal_revisions_attendees` DISABLE KEYS */;
/*!40000 ALTER TABLE `ffproposal_revisions_attendees` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ffproposal_revisions_expenses`
--

DROP TABLE IF EXISTS `ffproposal_revisions_expenses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ffproposal_revisions_expenses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `item` varchar(200) DEFAULT NULL,
  `unitcost` double DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `amountUsed` double DEFAULT NULL,
  `ffproposalID` int(11) DEFAULT NULL,
  `subtotal` double DEFAULT NULL,
  `revisionID` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `LA50_idx` (`ffproposalID`),
  CONSTRAINT `LA50` FOREIGN KEY (`ffproposalID`) REFERENCES `ffproposal_revisions` (`ffproposalID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ffproposal_revisions_expenses`
--

LOCK TABLES `ffproposal_revisions_expenses` WRITE;
/*!40000 ALTER TABLE `ffproposal_revisions_expenses` DISABLE KEYS */;
/*!40000 ALTER TABLE `ffproposal_revisions_expenses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ffreport`
--

DROP TABLE IF EXISTS `ffreport`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ffreport` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` date DEFAULT NULL,
  `projectTitle` varchar(500) DEFAULT NULL,
  `targetKRA` varchar(100) DEFAULT NULL,
  `targetGoal` varchar(100) DEFAULT NULL,
  `targetMeasure` varchar(100) DEFAULT NULL,
  `projectProponent` varchar(500) DEFAULT NULL,
  `facilitatorName` varchar(500) DEFAULT NULL,
  `amountReceivedOVPLM` double DEFAULT NULL,
  `significanceProject` varchar(5000) DEFAULT NULL,
  `highlightsProject` varchar(5000) DEFAULT NULL,
  `majorProblems` varchar(2000) DEFAULT NULL,
  `otherRecommendations` varchar(1000) DEFAULT NULL,
  `annexes` longblob,
  `attendanceDLSU` longblob,
  `ffproposalID` int(11) DEFAULT NULL,
  `cap` int(11) DEFAULT NULL,
  `apsp` int(11) DEFAULT NULL,
  `asf` int(11) DEFAULT NULL,
  `faculty` int(11) DEFAULT NULL,
  `admin` int(11) DEFAULT NULL,
  `directhired` int(11) DEFAULT NULL,
  `independent` int(11) DEFAULT NULL,
  `external` int(11) DEFAULT NULL,
  `venue` varchar(100) DEFAULT NULL,
  `gsheets` varchar(100) DEFAULT NULL,
  `implementationdate` date DEFAULT NULL,
  `graduate` int(11) DEFAULT NULL,
  `undergraduate` int(11) DEFAULT NULL,
  `alumni` int(11) DEFAULT NULL,
  `parents` int(11) DEFAULT NULL,
  `feedback1` varchar(500) DEFAULT NULL,
  `feedback2` varchar(500) DEFAULT NULL,
  `feedback3` varchar(500) DEFAULT NULL,
  `feedback4` varchar(500) DEFAULT NULL,
  `feedback5` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `LA22_idx` (`ffproposalID`),
  CONSTRAINT `LA22` FOREIGN KEY (`ffproposalID`) REFERENCES `ffproposal` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ffreport`
--

LOCK TABLES `ffreport` WRITE;
/*!40000 ALTER TABLE `ffreport` DISABLE KEYS */;
INSERT INTO `ffreport` VALUES (23,'2019-02-02','Testing 2019',NULL,NULL,NULL,'College of Computer Studies (CCS), Information Technology (IT)',NULL,5000,'sadas','dasdsadas','dadsa','dsadsa','','',34,1,0,0,0,0,0,0,0,'djsakdjsakl','dsadsasa','2019-02-28',0,0,0,0,'No Suggestion','dsad','sadsad','sadsadsa','No Suggestion');
/*!40000 ALTER TABLE `ffreport` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ffreport_attendees`
--

DROP TABLE IF EXISTS `ffreport_attendees`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ffreport_attendees` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `type` varchar(45) DEFAULT NULL,
  `ffreportID` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FFREPORT_idx` (`ffreportID`),
  CONSTRAINT `ffreport` FOREIGN KEY (`ffreportID`) REFERENCES `ffreport` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=195 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ffreport_attendees`
--

LOCK TABLES `ffreport_attendees` WRITE;
/*!40000 ALTER TABLE `ffreport_attendees` DISABLE KEYS */;
INSERT INTO `ffreport_attendees` VALUES (194,'dsadsasada','dino.dc.alcala@gmail.com','CAP',23);
/*!40000 ALTER TABLE `ffreport_attendees` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ffreport_attendees_temp`
--

DROP TABLE IF EXISTS `ffreport_attendees_temp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ffreport_attendees_temp` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `type` varchar(100) DEFAULT NULL,
  `ffproposalID` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ffreport_attendees_temp`
--

LOCK TABLES `ffreport_attendees_temp` WRITE;
/*!40000 ALTER TABLE `ffreport_attendees_temp` DISABLE KEYS */;
INSERT INTO `ffreport_attendees_temp` VALUES (1,'dsadsasada','dino.dc.alcala@gmail.com','CAP',34);
/*!40000 ALTER TABLE `ffreport_attendees_temp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ffreport_funds`
--

DROP TABLE IF EXISTS `ffreport_funds`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ffreport_funds` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lineItem` varchar(500) DEFAULT NULL,
  `approvedAmount` double DEFAULT NULL,
  `expendedAmount` double DEFAULT NULL,
  `variance` double DEFAULT NULL,
  `reasonVariance` varchar(500) DEFAULT NULL,
  `ffreportID` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `LA25_idx` (`ffreportID`),
  CONSTRAINT `LA25` FOREIGN KEY (`ffreportID`) REFERENCES `ffreport` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ffreport_funds`
--

LOCK TABLES `ffreport_funds` WRITE;
/*!40000 ALTER TABLE `ffreport_funds` DISABLE KEYS */;
INSERT INTO `ffreport_funds` VALUES (44,'dsadsada',5000,5000,0,'dsadasdsa',23);
/*!40000 ALTER TABLE `ffreport_funds` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ffreport_objectives`
--

DROP TABLE IF EXISTS `ffreport_objectives`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ffreport_objectives` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `expectedOutcomes` varchar(1000) DEFAULT NULL,
  `actualAccomplishment` varchar(1000) DEFAULT NULL,
  `hinderingFactors` varchar(1000) DEFAULT NULL,
  `ffreportID` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `LA24_idx` (`ffreportID`),
  CONSTRAINT `LA24` FOREIGN KEY (`ffreportID`) REFERENCES `ffreport` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ffreport_objectives`
--

LOCK TABLES `ffreport_objectives` WRITE;
/*!40000 ALTER TABLE `ffreport_objectives` DISABLE KEYS */;
INSERT INTO `ffreport_objectives` VALUES (23,'dsad','asdsad','asdsa',23);
/*!40000 ALTER TABLE `ffreport_objectives` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `goal`
--

DROP TABLE IF EXISTS `goal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `goal` (
  `goalID` int(11) NOT NULL AUTO_INCREMENT,
  `goalNumber` int(11) DEFAULT NULL,
  `name` varchar(500) DEFAULT NULL,
  `kraID` int(11) DEFAULT NULL,
  PRIMARY KEY (`goalID`),
  KEY `LA6_idx` (`kraID`),
  CONSTRAINT `LA6` FOREIGN KEY (`kraID`) REFERENCES `kra` (`kraID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `goal`
--

LOCK TABLES `goal` WRITE;
/*!40000 ALTER TABLE `goal` DISABLE KEYS */;
INSERT INTO `goal` VALUES (1,1,'KRA3-G1 - Implement sustainable, holistic, and developmental Lasallian formation across all sectors based on the Lasallian guiding principles',1),(2,2,'KRA3-G2 - Create a conducive environment that helps bridge faith and scholarship',1),(3,3,'KRA3-G3 - Create and nurture communities dedicated to promoting the Lasallian mission and spirituality',1),(4,1,'KRA5-G1 - Each unit of the University has at least one sustainable social engagement project',2),(5,2,'KRA5-G2 - Service Learning is institutionalized',2),(6,3,'KRA5-G3 - The University contributes to the localization of the Sustainable Development Goals (SDGs)',2),(7,3,'KRA5-G4 - The Lasallian Community works towards becoming better Stewards of God\'s Creation and the restoration of the ingerity of creation',2);
/*!40000 ALTER TABLE `goal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `informationsheet`
--

DROP TABLE IF EXISTS `informationsheet`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `informationsheet` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `firstName` varchar(100) DEFAULT NULL,
  `lastName` varchar(100) DEFAULT NULL,
  `emailAddress` varchar(100) DEFAULT NULL,
  `unit` varchar(100) DEFAULT NULL,
  `position` varchar(45) DEFAULT NULL,
  `departmentID` int(11) DEFAULT NULL,
  `username` varchar(100) DEFAULT NULL,
  `password` varchar(256) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `LA1_idx` (`departmentID`),
  CONSTRAINT `LA1` FOREIGN KEY (`departmentID`) REFERENCES `department` (`departmentID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=248 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `informationsheet`
--

LOCK TABLES `informationsheet` WRITE;
/*!40000 ALTER TABLE `informationsheet` DISABLE KEYS */;
INSERT INTO `informationsheet` VALUES (1,'Admin','Admin','admin@gmail.com','Admin','Administrator',1,'admin','c7ad44cbad762a5da0a452f9e854fdc1e0e7a52a38015f23f3eab1d80b931dd472634dfac71cd34ebc35d16ab7fb8a90c81f975113d6c7538dc69dd8de9077ec'),(71,'Carmel','Carosa','carmel.carosa@dlsu.edu.ph','Office of the Vice President for Lasallian Mission (OVPLM)','OVPLM - Executive Officer',0,'carosa','28fa1fcc5ad52572cd57b7db7feeaf14382b9d719b255dd9fff7212cbd06ced12e2a7d7e45265a1fef33c1d63fe894da8c8502162eaf616ec20a44ff532a200f'),(74,'Michael','Broughton','michael.broughton@dlsu.edu.ph','Office of the Vice President for Lasallian Mission (OVPLM)','OVPLM - Vice President for Lasallian Mission',0,'michael','34e1fd6820ce1e79fbbdaae3fc708b634ab1d9765c215b7cd88d4c0c750e87b8c1d478b6112d95ae7bd165f9f73d165263ef7fcee357b48c6bc1f6b591f94ab8'),(75,'Neil','Penullar','neil.penullar@dlsu.edu.ph','Center for Social Concern and Action (COSCA)','COSCA - Sir Neil Position',0,'neil','0e1026d7c69f6e48c550d4c6f0296e4be95f960d15ff3eba2e8c5d8633f909bad6d6d806112dc7d8e3cdb80e7b22c08070a7fe1d70a74d9ac4de429fd4835444'),(76,'James','Laxa','james.laxa@dlsu.edu.ph','Lasallian Pastoral Office (LSPO)','LSPO - Director',0,'james','625f7fdb99de7de358ab119ead94c29b436764e1bffb3af4f1ca715b692cf155e62007572ce4101fef09a98130369de7a06ccd57903b4c5a9104d1444a02f4a2'),(77,'Margarita','Perdido','margarita_perdido@dlsu.edu.ph','Laguna Campus Lasallian Mission (LCLM)','LCLM - Executive Director',0,'margarita','aa08c20688b952d8119e1abac52e3c7bc0a918b10f5188c0c22fd4b36cb5bbbe626e25a71a6b02d071cb749f351937bcdb071c85cef71b3d7858abb2b3b17eb4'),(78,'Nelca','Villarin','nelca_villarin@dlsu.edu.ph','Dean of Student Affairs (DSA)','DSA - Dean',0,'nelca','759578037fdb24f7c6d6968c2e4dae34df944bd90507c336baedee5e57a7845a9d4cf59bcf2ca83bc1fbf55d332e86525d544968d6e5a3e074305750581fbe4c'),(79,'Fritzie','De Vera','fritzie.de.vera@dlsu.edu.ph','Center for Social Concern and Action (COSCA)','COSCA - Director',0,'fritzie','4ba090d4b0913b18790e889dba1a778af3b1e6b3f577cd0740b8bb521900f578200097589d24a01187350efd69b0168b00ba3d2ef00a79cbbcc71d9cb8f89d96'),(80,'deptchair','ccsct','deptchairccs@dlsu.edu.ph','College of Computer Studies (CCS)','CCSCT - Department Chair',2,'deptchairccsct','6d493c87e813256fdaa04e0fb21af39db4050353ad704be7642852fe50c4ac779622f277a2fec30747d058820d0955a85c2905ed01c3f3e508b247b81db7f238'),(81,'ccs','dean','ccsdean@dlsu.edu.ph','College of Computer Studies (CCS)','CCS - Dean',0,'ccsdean','da7f2a9da28aadd88bc66bbf6209b24dd4e6fa25c63c4e00c30f3698fe39605dff6b9ce63e8dcbb149a1a1306ad43a9af097b0238e5bacc31dfb3e2b6453b1be'),(82,'Diane','Ramos','diane.ramos@dlsu.edu.ph','College of Computer Studies (CCS)','CCS - ADEALM',0,'ccsadealm','2a095af73198792b4009add45468df1e99724305247bf0f9ff5707e6a43599cbf6885722fb7d5bd2f21e0407820387f0e4046f8d82cecf943ca98d86d39e1eb3'),(83,'unitrep','ccsct','unitrepccsct@dlsu.edu.ph','College of Computer Studies (CCS)','CCSCT - Unit Representative',2,'unitrepccsct','adde68203c9017d1778008099e80373aa83e15ba4ccd66f1f03048db729c215e6b5c21939c5918446b57c5694d64d96152c724a85a19c112f4fbedc40779e515'),(85,'unitrep','ccsit','unitrepccsit@dlsu.edu.ph','College of Computer Studies (CCS)','CCSIT - Unit Representative',3,'unitrepccsit','cc795c0f7f451aca96006551e0d3d274e8b546d64701be0a3523697e61ade64ba36f7ae8f691089df163b8215bfab4e3f1683b5fb1f4d6151b5c00b91d04f9b3'),(86,'unitrep','ccsst','unitrepccsst@dlsu.edu.ph','College of Computer Studies (CCS)','CCSST - Unit Representative',4,'unitrepccsst','84b6275070ff95eb2615105dfc182ba91a38fee2c38abb1d3f90a8601a5f8897a5aec61ae0dc94a3ef7e6c17c1ca2987f942f81e951fb2b0c13821d102a0484f'),(87,'deptchair','ccsit','deptchairccsit@dlsu.edu.ph','College of Computer Studies (CCS)','CCSIT - Department Chair',3,'deptchairccsit','24067f1c587b1e7c1350e54ca7abdcc2523cf372271469862a7b56ab3ae878fb9a0051a5dca8b7b51aed1c72ea2d36d4c21e6997aa0dee7ec21dfc145d69dd60'),(88,'deptchair','ccsst','deptchairccsst@dlsu.edu.ph','College of Computer Studies (CCS)','CCSST - Department Chair',4,'deptchairccsst','5840c750402750e0cfff9c1bc09dfab251be4f7b23dcd15b34d7a61ddf21b90faf0ac3a149e23560e30d5db12777eeec90bbfbfb4077da0e6923bb24d8650f9b'),(89,'unitrep','rvrcobacc','unitreprvrcobacc@dlsu.edu.ph','Ramon V. Del Rosario College of Business (RVR-COB)','RVRCOBACC - Unit Representative',29,'unitreprvrcobacc','406a5d65ebb7f61d64859d2e73dce4c4e5052075f58b0b535941c80a50c89561c31d0485f352b22fe89515e6840c32c8cc7bcbffcc687ba7148d53bffeae609c'),(90,'unitrep','rvrcobcl','unitreprvrcobcl@dlsu.edu.ph','Ramon V. Del Rosario College of Business (RVR-COB)','RVRCOBCL - Unit Representative',30,'unitreprvrcobcl','1d4352edb7161789a1adea3d439ad86a2507f1e9bbca0c084a1cacb7d9e22d2237dedf4713f902178e304cd77cc0cc6ca5ae5abc1461f4b2e6a727a143de296f'),(91,'unitrep','rvrcobdsid','unitreprvrcobdsid@dlsu.edu.ph','Ramon V. Del Rosario College of Business (RVR-COB)','RVRCOBDSID - Unit Representative',31,'unitreprvrcobdsid','90b9815b200a19440b8d5161d7c2ca680693170b67dfc751ce3a45a63c7ca2b0c51ba19ae3eb3ed9194e06768901eee440fe9d7a7e30e718c639ae8da091dc94'),(92,'unitrep','rvrcobmfi','unitreprvrcobmfi@dlsu.edu.ph','Ramon V. Del Rosario College of Business (RVR-COB)','RVRCOBMFI - Unit Representative',32,'unitreprvrcobmfi','0193f8beaa5eca0758ec518c679a796066163fd39b8b4e6c140d56851a6f285a6f5fe8547112d50746a1b7d1ac8ccd839878ed2eb37395d5a7d4510885dbfde7'),(93,'unitrep','rvrcobmod','unitreprvrcobmod@dlsu.edu.ph','Ramon V. Del Rosario College of Business (RVR-COB)','RVRCOBMOD - Unit Representative',33,'unitreprvrcobmod','13c31542f36a515dd635e4c88624d013581405e80817ff90af6a212cfebd47a6fadb9eb7d154327c9e475b50062a2bce36198ad45ae6e6c7e16494e26e4fe505'),(94,'unitrep','rvrcobmm','unitreprvrcobmm@dlsu.edu.ph','Ramon V. Del Rosario College of Business (RVR-COB)','RVRCOBMM - Unit Representative',34,'unitreprvrcobmm','e4c6ffb7c1ec890c49de6648f93e2e31a0d3b5dd5a79d0bc105353de197a4db14ec1ceb7bb591eace36b3eb80b9a315d41717f50dd9a444da41564fd286b33e7'),(95,'deptchair','rvrcobacc','deptchairrvrcobacc@dlsu.edu.ph','Ramon V. Del Rosario College of Business (RVR-COB)','RVRCOBACC - Department Chair',29,'deptchairrvrcobacc','17f33d134ed7957b04115976d624d231733a716e70b62f4c0bfe15c24a805b1a8abb78947c9855f994fc5fc4c3a4bb80d1ec220319f7a2f8c80d53f71bd5b1b0'),(96,'deptchair','rvrcobcl','deptchairrvrcobcl@dlsu.edu.ph','Ramon V. Del Rosario College of Business (RVR-COB)','RVRCOBCL - Department Chair',30,'deptchairrvrcobcl','7f73f46be50f7e2ce830451a5ae5268f37badb6513aa257e03c9d00eee126c4b4867267fda8d72480fb60fcf7d4f74206645be486a53d26fde82f60caca94127'),(97,'deptchair','rvrcobdsid','deptchairrvrcobdsid@dlsu.edu.ph','Ramon V. Del Rosario College of Business (RVR-COB)','RVRCOBDSID - Department Chair',31,'deptchairrvrcobdsid','6919d0a928758f4a611aa33bb5c6bedbcbe0bac0e069b44e9f3d84fbdc32feca0c322b24acad8e13a58b8c2587b30b6f63c9168f3bba059d5aedf260a28a326e'),(98,'deptchair','rvrcobmfi','deptchairrvrcobmfi@dlsu.edu.ph','Ramon V. Del Rosario College of Business (RVR-COB)','RVRCOBMFI - Department Chair',32,'deptchairrvrcobmfi','90b9815b200a19440b8d5161d7c2ca680693170b67dfc751ce3a45a63c7ca2b0c51ba19ae3eb3ed9194e06768901eee440fe9d7a7e30e718c639ae8da091dc94'),(99,'deptchair','rvrcobmod','deptchairrvrcobmod@dlsu.edu.ph','Ramon V. Del Rosario College of Business (RVR-COB)','RVRCOBMOD - Department Chair',33,'deptchairrvrcobmod','e565544fab154cdfe84965e955760403a4586ad89ef6947be1e42b99543496717049dc6f659555aab9ddeb2bb99cf7ff8ea0042f08a05807f0135bb39722a8d1'),(101,'deptchair','rvrcobmm','deptchairrvrcobmm@dlsu.edu.ph','Ramon V. Del Rosario College of Business (RVR-COB)','RVRCOBMM - Department Chair',34,'deptchairrvrcobmm','58047de0ed2df3e3cf4f6b246c906bb1f4efd998af50bc1e2173fde802b8bc7b48035f514754f526ee4a44e9df118346248834ecb0c774828599af5b44e77b21'),(104,'unitrep','clabs','unitrepclabs@dlsu.edu.ph','College of Liberal Arts (CLA)','CLABS - Unit Representative',10,'unitrepclabs','1d50c3bb6d84e148987a3932e82e271e232220f1ad7f62b52c4f3e5107483e0269f5bfcc8af5793df4878e689b11aa108667397a94437fa01981e35b9bb46540'),(105,'unitrep','clacomm','unitrepclacomm@dlsu.edu.ph','College of Liberal Arts (CLA)','CLACOMM - Unit Representative',11,'unitrepclacomm','1b17dc4d260ac51e6c0f8083991b7b970fd383394cf31692fa817f84cdcaf849355e8b99b4ead6260b71a8653f16365b880dd3442bbdf2d785ddd3a6ef9d8192'),(106,'unitrep','clalit','unitrepclalit@dlsu.edu.ph','College of Liberal Arts (CLA)','CLALIT - Unit Representative',12,'unitrepclalit','9d21f465d5defe9a3a224918021281575316599894b503f6b195a84b8b62b9cf6154cd3614742d31507acad347520436084d1c55f9b02510cf4bc818aea39d29'),(107,'unitrep','clafil','unitrepclafil@dlsu.edu.ph','College of Liberal Arts (CLA)','CLAFIL - Unit Representative',13,'unitrepclafil','d08ae5304edb03b6058d35775fe7aef19278468709e3b89c52efab6ed040fa23edf1cc086ff205abf6820e4a0bfac99973a8f188557bc50ec838d4421f0a1a15'),(108,'unitrep','clahis','unitrepclahis@dlsu.edu.ph','College of Liberal Arts (CLA)','CLAHIS - Unit Representative',14,'unitrepclahis','f95a17b26558112fe79210e7439fccc0ec14540539b1c00e5f9bc0d64afdbfd561a241a8c18454b32249e877d0671cabb73a880c0d9e6fc37be63091fc1e7cbb'),(109,'unitrep','clais','unitrepclais@dlsu.edu.ph','College of Liberal Arts (CLA)','CLAIS - Unit Representative',15,'unitrepclais','f629c025af8b7c7c233e5b238bc103ed074c056f1a52b5659fbde843e0d8fb2f4c24964423d3fdc1d77a6fdfa3a5203af551af6108b3fd8d0431235c45342e53'),(110,'unitrep','claphilo','unitrepclaphilo@dlsu.edu.ph','College of Liberal Arts (CLA)','CLAPHILO - Unit Representative',16,'unitrepclaphilo','ebbf5e2e6732cf8bf566f0b4d55b9710d7df5b6b618803f2603053b3f9f47d7199dbb4ece8e676a9708e6260ccec77a58bb8722b3786b5a1445ecee16c818962'),(111,'unitrep','clapolsci','unitrepclapolsci@dlsu.edu.ph','College of Liberal Arts (CLA)','CLAPOLSCI - Unit Representative',17,'unitrepclapolsci','a3c90080b35e9f32c8c9c612059f2553fc1fe67c3b4213db1f04aaf96e989ecc44f3b287d1d5ed17e6dd823cd016ff99721fc035c0ee4ef2aaa274e0181a9dd9'),(112,'unitrep','clapsych','unitrepclapsych@dlsu.edu.ph','College of Liberal Arts (CLA)','CLAPSYCH - Unit Representative',18,'unitrepclapsych','b83cba723e88a0ac30ab61312d6324479e13ff0db92dd01c4fa3ce3dd354a1eacbffe88bdfe502024a9f38bf77ae9217ccb856c7eeadf1ba508a383a2b2833eb'),(113,'unitrep','clatred','unitrepclatred@dlsu.edu.ph','College of Liberal Arts (CLA)','CLATRED - Unit Representative',19,'unitrepclatred','d1ed2d4f6cecc122061b5ebbf4f1351a4e53a51b16286a43237b8a1d8bd800107ebbc7ff4d3175f4071e26c153573ca6dce1d685c0c98c4d9e40144759ecdb4c'),(114,'deptchair','clabs','deptchairclabs@dlsu.edu.ph','College of Liberal Arts (CLA)','CLABS - Department Chair',10,'deptchairclabs','65217899703cb77257f8356d7e9d31044b86a8ee6065915e75e201b4dabd6f16f8d98c339fbc2b7b6ab68d0ffa67c85c9db701be17e94847cb75c690f753904c'),(115,'deptchair','clacomm','deptchairclacomm@dlsu.edu.ph','College of Liberal Arts (CLA)','CLACOMM - Department Chair',11,'deptchairclacomm','e93e47ecdfb519ff7a30961bbf9bde3c78bdb811cc6c3f8841861585ce1456032cd2d2856ef568f38951f7ef55425e3a2359b8baa69cd7151c25fcdd6269103b'),(116,'deptchair','clalit','deptchairclalit@dlsu.edu.ph','College of Liberal Arts (CLA)','CLALIT - Department Chair',12,'deptchairclalit','c4a9305650b9fd0d0495386a0d66542f11a7efc80c1f44c88680aeb2132bebb85f1b6eba226cceb1ce15524ce5fef34f7ba44bd56db368a0776655a47f5de437'),(117,'deptchair','clafil','deptchairclafil@dlsu.edu.ph','College of Liberal Arts (CLA)','CLAFIL - Department Chair',13,'deptchairclafil','c094e7da76847f55798cbf5d39a77a142008674264b17ab73b88ce5778e34c36cab34f990b89ebf4a1047d23f36d81ab80066f4afc309ef3c5d9605cbb3f3c99'),(118,'deptchair','clahis','deptchairclahis@dlsu.edu.ph','College of Liberal Arts (CLA)','CLAHIS - Department Chair',14,'deptchairclahis','0e13d9bc0fa7a23097990119b4ff8574911e2d03ea4e42a07312b0dbf068e157ab0e2adbde68c728544952a6a890fc00490424ad6dff38e0283b5d74c492149c'),(119,'deptchair','clais','deptchairclais@dlsu.edu.ph','College of Liberal Arts (CLA)','CLAIS - Department Chair',15,'deptchairclais','c0a14eff996d128ee3607c1470d5938450ec89e42c296b6e58bf6393233479e47b6c5a314de4f5096780710b0f6467e3a7783dfae77fb4218e212fb0e63c8b27'),(120,'deptchair','claphilo','deptchairclaphilo@dlsu.edu.ph','College of Liberal Arts (CLA)','CLAPHILO - Department Chair',16,'deptchairclaphilo','2d48beec90c5bb5d88a035f3e332210c03afefcd6f6f98e1d7093707ca0eb9b7a5c09638bd93d6b536c871339cbac7cdfda7b9c0bd6c022305bfabfad62acf19'),(121,'deptchair','clapolsci','deptchairclapolsci@dlsu.edu.ph','College of Liberal Arts (CLA)','CLAPOLSCI - Department Chair',17,'deptchairclapolsci','f8a9732c8ab0569b65683aa388db7b151b801d6066c5b491b49e2932d35507621067a69b2ffd9f99dfaf044923b561dd2a87a1a815618702546d013071f6a33d'),(122,'deptchair','clapsych','deptchairclapsych@dlsu.edu.ph','College of Liberal Arts (CLA)','CLAPSYCH - Department Chair',18,'deptchairclapsych','af55d061c7fe6dd1f820e2b787ac38e31bea8f78cc8724dc48b1f8d665e780cfdbea4a552b452c145db415fa2db0a2e2281fa72dff6b30d9897c6b06d341c0ea'),(123,'deptchair','clatred','deptchairclatred@dlsu.edu.ph','College of Liberal Arts (CLA)','CLATRED - Department Chair',19,'deptchairclatred','5e6a6e2198027f55274de34bf53892886f0e71052fd49c28dcb259241074d9b3b324f41dca9e33e835ff0a7a8869fcc393f3e3db068488000db0021602b78122'),(124,'cla','adealm','claadealm@dlsu.edu.ph','College of Liberal Arts (CLA)','CLA - ADEALM',0,'claadealm','df9a7db63cbbabba983391b2f3c9e937a9d6a499e3450b42b70d404ec57a0c8516183464f3e9d73fb35bb58dbba9250897cc8b4dec50987d9d2b74342dffc8d6'),(125,'cla','dean','cladean@dlsu.edu.ph','College of Liberal Arts (CLA)','CLA - Dean',0,'cladean','cf7719a92f1786be67d872f2f3d8637ecbce8ad9f3f0a28292511ed71ed1d6bcc19c47406bba51a2e06dbc0a859c274b03920956330da3d7303567bebe741ab9'),(126,'unitrep','soeiae','unitrepsoeiae@dlsu.edu.ph','School of Economics (SOE)','SOEIAE - Unit Representative',35,'unitrepsoeiae','3a28a7cf79818030b7863544a6712ae6df60068678a0e7e47aa7712741189385625bf7713af82537754cebd6b7855df2fae8008fa64207ef25db3ae343c4c4e2'),(127,'unitrep','soefae','unitrepsoefae@dlsu.edu.ph','School of Economics (SOE)','SOEFAE - Unit Representative',36,'unitrepsoefae','200f985df9ace2e7470acf684a6ade0803eb81c5536d8112759bbab2ac7b52113a88f8bb9242434a673f1d61ffdfbdff37d48c0ed2bcf752cb9fc92cc1bc3b0a'),(128,'unitrep','soelae','unitrepsoelae@dlsu.edu.ph','School of Economics (SOE)','SOELAE - Unit Representative',37,'unitrepsoelae','720ffa71c3a1f495354765939b6a5f292b7aeed7d1c7c1e1a94a9776a674e2580debde428119f2386792fc1d9fded00b18c078d4c0e1932907ab77c59589f641'),(129,'unitrep','soemfi','unitrepsoemfi@dlsu.edu.ph','School of Economics (SOE)','SOEMFI - Unit Representative',38,'unitrepsoemfi','f79a489f30614e8c732fbb27d5ba5450ff2c64b47afcbca5d495107a791ad2c6da48bf1c686347fe9a957ac4b3215fac5992bd84f195325797b11dad1321236f'),(130,'unitrep','soemod','unitrepsoemod@dlsu.edu.ph','School of Economics (SOE)','SOEMOD - Unit Representative',39,'unitrepsoemod','429dd6dfd5380e98e3d06554967df2843ffb7d29122a582eea130067439ef0ab382d6f0d3b9a6e452b249331381fc4c6c4e08a73da88e14190e9d142e0ada689'),(131,'unitrep','soemm','unitrepsoemm@dlsu.edu.ph','School of Economics (SOE)','SOEMM - Unit Representative',40,'unitrepsoemm','0ee0be6d139540389341b0cdc65808f797d66e0ad09b068a8bb5931e9c6f3093160aa83ca02e761354fe1b0b8cd98d29d4a5175de2c4684a53ec4d97011e7676'),(132,'deptchair','soeiae','deptchairsoeiae@dlsu.edu.ph','School of Economics (SOE)','SOEIAE - Department Chair',35,'deptchairsoeiae','8f02d94b7b0d794cdd8bff59c64d5373b89261b4f3cbc439819394dfcb4c9d36400d880bd169607155188b83b343336909525118eca5ac93c95cd8e5fbe9afa2'),(133,'deptchair','soefae','deptchairsoefae@dlsu.edu.ph','School of Economics (SOE)','SOEFAE - Department Chair',36,'deptchairsoefae','eb2cf7e393ad68830aabae8a44992294eb0051c8cbbcfd87bb2f560cbb1143ba551322f246074f6ad8368d90b753ecc1541a35894bfc0956a165ad7a28788ae3'),(134,'deptchair','soelae','deptchairsoelae@dlsu.edu.ph','School of Economics (SOE)','SOELAE - Department Chair',37,'deptchairsoelae','cc2959d131f787f8ae9c4cd597fd94054d3786e84d454a1ce67c977c17544b128c7e2a73196f6ce0ea29c6d9ec7114ec3e5a30047f31ffa10b0543a5d9e7b844'),(135,'deptchair','soemfi','deptchairsoemfi@dlsu.edu.ph','School of Economics (SOE)','SOEMFI - Department Chair',38,'deptchairsoemfi','e317bea34e69fdf59d5abbe7ef2f81064ceac4a375e1cf6b48e56d62f8e9fbb2a1a93456cbd64b6c8cd2c7623b45572dda43eb589c435192c239cc9a3db59f2e'),(136,'deptchair','soemod','deptchairsoemod@dlsu.edu.ph','School of Economics (SOE)','SOEMOD - Department Chair',39,'deptchairsoemod','3e6098fcf7bd1e16f71194b55ab0638011cfe7c520fea2bf4f5717141a800d9592f6b6f63926c869b901b8b0b07484561bee0f7196fe811d303ee9f56f2efd3e'),(137,'deptchair','soemm','deptchairsoemm@dlsu.edu.ph','School of Economics (SOE)','SOEMM - Department Chair',40,'deptchairsoemm','de295557ade21ad0ccbccaf82981fde7304fb7129d41e4177d7161520cd94562e98080a1703870da6b44dec72d165b5a014055df4b706bc44efcbd0d821ac6b5'),(138,'soe','adealm','soeadealm@dlsu.edu.ph','School of Economics (SOE)','SOE - ADEALM',0,'soeadealm','cd977bf1bce839d6e6702902d6e8da747e8e8a40229810e630f92cd715a9744f3faf3378c2b58ef34980a939ebe5e0cc3cabf65f47a7098162da4d282e29b75a'),(139,'soe','dean','soedean@dlsu.edu.ph','School of Economics (SOE)','SOE - Dean',0,'soedean','4943c9a66ba2bec804866a5ec4eaa799b4a89751c10998483e17f5415b146c7560f940f4ccf79c95a0470d8eb51960de1c4e48b9e8ef1075126966e4aed8039b'),(140,'unitrep','bagcedcepd','unitrepbagcedcepd@dlsu.edu.ph','Br. Andrew Gonzales College of Education (BAGCED)','BAGCEDCEPD - Unit Representative',5,'unitrepbagcedcepd','d7f829b5dc4e88b2dd2684a0a2248ee85d64effd39d3b42906a592ba7adf6a0ec6c80862c367593bf997f6a8054053248a4e6436f0a7ad6ba51a8462350e7598'),(141,'unitrep','bagceddeal','unitrepbagceddeal@dlsu.edu.ph','Br. Andrew Gonzales College of Education (BAGCED)','BAGCEDDEAL - Unit Representative',6,'unitrepbagceddeal','d08fb1a12d2bd865627ef81813e4442c86ba99e513d27525b9db34b2527abb6827e87734164dbcd18e180d446dfd856e87b5963e4103b47f982d694b135df959'),(142,'unitrep','bagcedelmd','unitrepbagcedelmd@dlsu.edu.ph','Br. Andrew Gonzales College of Education (BAGCED)','BAGCEDELMD - Unit Representative',7,'unitrepbagcedelmd','10515bb7f3fd9aacb29a3d20803ec0965cf68576895c707d10fd0e64355e4187a5a8b925c1f8f1e7e41dd056b67d119b0f97a17638c3d546fe92f259cc9c6992'),(143,'unitrep','bagcedped','unitrepbagcedped@dlsu.edu.ph','Br. Andrew Gonzales College of Education (BAGCED)','BAGCEDPED - Unit Representative',8,'unitrepbagcedped','50249b166a07b1be09c0a962b85d94277feca7cf22e48122b9a4e23eae94f9a66609110a61ec70ffc2cab2125b23a3f28ffc32be6a53980b5f3762a819510c3e'),(144,'unitrep','bagcedsed','unitrepbagcedsed@dlsu.edu.ph','Br. Andrew Gonzales College of Education (BAGCED)','BAGCEDSED - Unit Representative',9,'unitrepbagcedsed','ce3edbebca349c61411aeb90e536c3abc22d63efb4a0f2c308e0511292e21c2c49069b0cf85d5d414fefb405f41f477b76b4f86a9e0f140e34b3d88279432860'),(145,'deptchair','bagcedcepd','deptchairbagcedcepd@dlsu.edu.ph','Br. Andrew Gonzales College of Education (BAGCED)','BAGCEDCEPD - Department Chair',5,'deptchairbagcedcepd','64a20783717f8ea07cf5f2828a4eda949613d543844e2dfc7e3a8daebc2fd39a8d04629c7d8166b505184ecd0524f88da7c748a032863eeb0f68e3367827c4c9'),(146,'deptchair','bagceddeal','deptchairbagceddeal@dlsu.edu.ph','Br. Andrew Gonzales College of Education (BAGCED)','BAGCEDDEAL - Department Chair',6,'deptchairbagceddeal','26c99b1d9942f49c610098ca57a165dde39437d7d024c2bafaf250c0349a16e5789366f4190d6d38ceaead66a4ce9159d8b38a5047e2d6489f568510a0846c67'),(147,'deptchair','bagcedelmd','deptchairbagcedelmd@dlsu.edu.ph','Br. Andrew Gonzales College of Education (BAGCED)','BAGCEDELMD - Department Chair',7,'deptchairbagcedelmd','12fc83cb60fa33c7dea8cf6ad28a3f186ad0e5305d7bd5f98e783fe26bf6f9dadb41c132ea6b9478fd08c87ff05004a6bfc6e5275f4f8ae6bf4c62a1aff02033'),(148,'deptchair','bagcedped','deptchairbagcedped@dlsu.edu.ph','Br. Andrew Gonzales College of Education (BAGCED)','BAGCEDPED - Department Chair',8,'deptchairbagcedped','74eca07404a187d643068885f3fbc7508c5b3546419dcb3d193d3d1964e30cab5481f0dbd2f8e32fbbf6fc32352631b1f607c02b222197aa7aed90074b6cbf68'),(149,'deptchair','bagcedsed','deptchairbagcedsed@dlsu.edu.ph','Br. Andrew Gonzales College of Education (BAGCED)','BAGCEDSED - Department Chair',9,'deptchairbagcedsed','604d524d7657adf48925e00e7b023fef2c1731b070b759232f4087aa7f8967b976639b394a5bee544bdcb6d6dd077ae79a4f087e7a29ba92a0bf47a16587fa48'),(150,'bagced','adealm','bagcedadealm@dlsu.edu.ph','Br. Andrew Gonzales College of Education (BAGCED)','BAGCED - ADEALM',0,'bagcedadealm','0b0d281dd4685d0958378b3b4f09aa71dbde6ba190f625143833cf529952a38a0dd5a7290d36c6a49348a9e517de6eafdc6c3c573f9a4da0c75c771eddbe2d64'),(151,'bagced','dean','bagceddean@dlsu.edu.ph','Br. Andrew Gonzales College of Education (BAGCED)','BAGCED - Dean',0,'bagceddean','ba34117288261efc18422b203e505afeeb37b1e0d8b43d2d3fa81f1024b8c8c921f324a4a6900f5344375c766a0a3803831a9b3572b23669172d1aae48f1ad2d'),(152,'unitrep','gcoechemeng','unitrepgcoechemeng@dlsu.edu.ph','Gokongwei College of Engineering (GCOE)','GCOECHEMENG - Unit Representative',23,'unitrepgcoechemeng','abf1878ee5f90cfd095caccc644324ecdfebcd2351b4d80ab7c3a6cd1bd11cc7398f8abab8fa553f4ef7f5957c11aee606ab4127f6feb41d4453f875e20de206'),(153,'unitrep','gcoeciv','unitrepgcoeciv@dlsu.edu.ph','Gokongwei College of Engineering (GCOE)','GCOECIV - Unit Representative',24,'unitrepgcoeciv','b5a41358d24f431d0a39f5a3c0b16e3a0a87f62885ce0d1c4ce3625b0d737baf9c3a60cf20b1963558ee59701d51c6009ef59de55cb75c28a494fcb0f5d0dd8d'),(154,'unitrep','gcoeece','unitrepgcoeece@dlsu.edu.ph','Gokongwei College of Engineering (GCOE)','GCOEECE - Unit Representative',25,'unitrepgcoeece','908902a9eb25f37a4cbd11d19e976757cdead9764ba00e47c9197c042ed31326fabe2af14db4b922b0d6b82cb19ad48084e373da401296cac5761ab688e4a991'),(155,'unitrep','gcoeie','unitrepgcoeie@dlsu.edu.ph','Gokongwei College of Engineering (GCOE)','GCOEIE - Unit Representative',26,'unitrepgcoeie','5975449ee94df16a6a656025e8584239a452bd345a78e0394192753a73a7f95248d0e9471898c1b90d80426aa7b799f51bd34cf47dfa63651975068d1b7d4200'),(156,'unitrep','gcoemem','unitrepgcoemem@dlsu.edu.ph','Gokongwei College of Engineering (GCOE)','GCOEMEM - Unit Representative',27,'unitrepgcoemem','8a96658f1982db617c9a1407ae602003fb1d92684db09affaecc005055bc59da63a262463503cda47c2a23ee992f61bd5e1305861f02532a86bdc2ba2115205c'),(157,'unitrep','gcoeme','unitrepgcoeme@dlsu.edu.ph','Gokongwei College of Engineering (GCOE)','GCOEME - Unit Representative',28,'unitrepgcoeme','d6bfa104504a0f23f37947d1e9b6a3fdfcd2a0d271eceabafa2fbaa4a7641edb2a2c5c4bbd4d377d0cbae6815d56bc64496d3cb16c3d96c7236a07e116765a05'),(158,'gcoe','adealm','gcoeadealm@dlsu.edu.ph','Gokongwei College of Engineering (GCOE)','GCOE - ADEALM',0,'gcoeadealm','4da2ca744a22b8958c7d7036c75fb507e3edc37c3b3bbb851170e4739c4e01e217a28e7a66a3210338c05cabfac72fe3cd4b9042680dc5340ee97c88c9aa76f8'),(159,'gcoe','dean','gcoedean@dlsu.edu.ph','Gokongwei College of Engineering (GCOE)','GCOE - Dean',0,'gcoedean','8d9196d0b7b2772d76e555857d0458abda4a5507978dd91cfb48825394a3439402970c85430f9db901d4bec1aa4a7b66de3420910561c4448718995614f24a43'),(161,'deptchair','gcoeciv','deptchairgcoeciv@dlsu.edu.ph','Gokongwei College of Engineering (GCOE)','GCOECIV - Department Chair',24,'deptchairgcoeciv','7a30b933704eb6ea2842b77dd4c3d2abeca9f3d325b05e7d94feb802b6f55ac6be624184649e29d4601e83ed32475bfc59606711f5e44e4df6a08ccd3d2b9525'),(162,'deptchair','gcoeece','deptchairgcoeece@dlsu.edu.ph','Gokongwei College of Engineering (GCOE)','GCOEECE - Department Chair',25,'deptchairgcoeece','3b022120c9a06ab76a7832e01f088f5e8fcda584a6e1c27514afe1c1edca5e493c5d80deb5847b30141c6ee794351c45213a359a7dd7e32c31c87b944f1db47f'),(163,'deptchair','gcoechemeng','deptchairgcoechemeng@dlsu.edu.ph','Gokongwei College of Engineering (GCOE)','GCOECHEMENG - Department Chair',23,'deptchairgcoechemeng','ff98a300a3741cf47287e5e7f1d0e1c8b7dd2b7d1b1a7cba70a5232b74c363e811819bc52ce1b3592d29af81843a91dc12c8a60d496218c2e5b1ecf5be52fba3'),(164,'deptchair','gcoeie','deptchairgcoeie@dlsu.edu.ph','Gokongwei College of Engineering (GCOE)','GCOEIE - Department Chair',26,'deptchairgcoeie','eee80356a20046cd7930944cdeb27f50c2c720bb47c6667639d56fad5e8eed12da2e95af6e91d2a6a8957d189f3835d670f703590e604beb6018050237f7fbef'),(165,'deptchair','gcoemem','deptchairgcoemem@dlsu.edu.ph','Gokongwei College of Engineering (GCOE)','GCOEMEM - Department Chair',27,'deptchairgcoemem','fdac8c6af0681488ce31712b3a938954402300c288c5cd2dc349b725e7867ed6da5c089df9096270c031bb538d19d4f0712a7b62c2bb98926cc3f72ec0c28382'),(166,'deptchair','gcoeme','deptchairgcoeme@dlsu.edu.ph','Gokongwei College of Engineering (GCOE)','GCOEME - Department Chair',28,'deptchairgcoeme','30f6a252a718a0e14764db999e92fc7b8c1dc64db97e4063368cd3217c0ab3d1f4238eb4754fbf883107154a99a1116d64c23e786de6c54d56156556229eaaef'),(167,'unitrep','cosboi','unitrepcosbio@dlsu.edu.ph','College of Science (COS)','COSBIO - Unit Representative',20,'unitrepcosbio','160ff2b4c21756053dec3cb0f85c0f4d795762190cc2b718e0f17256d86725e323f45ad0d12db6e7b63f577eb1d34b811082ae5a7a8f997feae7ba87897e2939'),(171,'deptchair','coschem','deptchaircoschem@dlsu.edu.ph','College of Science (COS)','COSCHEM - Department Chair',21,'deptchaircoschem','2fe76479c9cf5b6fe61f07c5a9a1fb5beaee3ff5fcadefce43437b7d76522c5bd4f15a045cf3bb589b1723cedf5de0e93e266e9d4901e6c69153500dd6e9335d'),(172,'unitrep','cosphys','unitrepcosphys@dlsu.edu.ph','College of Science (COS)','COSPHYS - Unit Representative',22,'unitrepcosphys','3ea6229f73d20b382c82398ed914444e019964d672bf9d3c8a96487225fa52a30c256fade71da7e5d416ba5031a13d1be81e18bf6092883dc4f406764104d007'),(173,'unitrep','coschem','unitrepcoschem@dlsu.edu.ph','College of Science (COS)','COSCHEM - Unit Representative',21,'unitrepcoschem','99e0f772b2675689f3f67e650c30ab273339cdf550e43782be5b29ba07a34e1435faae141ca0b0db94349cd05ef6e7df5699c66f1e98ab55508d36d33d19c298'),(174,'deptchair','cosbio','deptchaircosbio@dlsu.edu.ph','College of Science (COS)','COSBIO - Department Chair',20,'deptchaircosbio','51dc466e60847b1aa49958f259dbddb5efd26dc049348a8054e1d77cfe9ae7d4c42efd1044eb83712563280498b9f0f820b66d208abb6773707fd30e94cd2428'),(175,'deptchair','cosphys','deptchaircosphys@dlsu.edu.ph','College of Science (COS)','COSPHYS - Department Chair',22,'deptchaircosphys','0ffcbe2a34cec09496c38e39f4f7e5d91fcad16fe1a9f2bc284665a7ac8c55b342349ae6fcbda1a449b5342932cc4698824b18c8ecfb82b706704cd3b6dda8a7'),(176,'cos','adealm','cosadealm@dlsu.edu.ph','College of Science (COS)','COS - ADEALM',0,'cosadealm','e40e91fdfb30ecf80e2c8300e976a3aede59f4d28b3ddbcba7c6298d8b8b697f1f5eff8feafdc3b6ff675c6da198dcb3178c59e6853aa45ecea52eedd37c762f'),(177,'cos','dean','cosdean@dlsu.edu.ph','College of Science (COS)','COS - Dean',0,'cosdean','eab9c36968d8581a0ea727509dac441c61b8b6762f86dcef8e216afd39c7b666b825049fa463ef9952863e305c41d1562a5707199add6d9d6a2fd6fdb64bd584'),(178,'unitrep','unitrep','unitrepcol@dlsu.edu.ph','College of Law (COL)','COL - Unit Representative',0,'unitrepcol','11e584c6254c2f7c05a2fb9de13596122036bdfe90f81e42f1c782db1a0abbea545883cf43b2f88bd9ddca0d5a83a228c73b714ed6c6ea383b3474c60702be63'),(179,'deptchair','col','deptchaircol@dlsu.edu.ph','College of Law (COL)','COL - Department Chair',0,'deptchaircol','3bedb8f0692e8a9330207729cf5da9bebf66b736384ef760231670a489769519757eebcfc9223fe813a77b00f55698c7855756206f2bccba7ed2a60138ed88b4'),(180,'col','adealm','coladealm@dlsu.edu.ph','College of Law (COL)','COL - ADEALM',0,'coladealm','7fd684b876ee4dd2c7ae360856593fbbd1685f37e5f891286677bdc3b15f520d3b613d25e981da91743e3728639ccd69e98cf3870942d47412f792e47d323ff1'),(181,'col','dean','coldean@dlsu.edu.ph','College of Law (COL)','COL - Dean',0,'coldean','531e7c0755c6438ee60748f9809fd61796b0f1658b17bf2ec6a0dd9513b3c9a532b0ccfebb430cabaa4dbc5a596e59f846433bac8af958196104088bad555f27'),(182,'unitrep','cosca','unitrepcosca@dlsu.edu.ph','Center for Social Concern and Action (COSCA)','COSCA - Unit Rep',0,'unitrepcosca','90a7e0f58dbfc30df9ec5e53129db5400d14d6c5f1103608a9ec1cd6f9c441051c869a434e72200dc37819ef260f90049c5e42e6aa948a62bf988f6b952fc54d'),(183,'ccs','assistantdeanlm','ccs_assistantdeanlm@dlsu.edu.ph','College of Computer Studies (CCS)','CCS - ADLM',0,'ccsassistantdeanlm','c166189b2598bcde62c967b64ddfe0fe007f084cc150098f666b533daf0148f4846047515c65a0bdf70ad8b264e17ae63c6adaaaa2c8de2e084a3b645c125185'),(184,'rvrcob','assistantdeanlm','rvrcob_assistantdeanlm@dlsu.edu.ph','Ramon V. Del Rosario College of Business (RVR-COB)','RVRCOB - ADLM',0,'rvrcobassistantdeanlm','c853544e4a5b9f270dad35bf517f48e0beb4278a55c6a33a88bf6dceb62dc48d6e4e20777b1483f1ae1b09db4da1899c1d7e43456e3b72baf9bc3b22e69fd3ae'),(185,'rvrcob','adealm','rvrcob_adealm@dlsu.edu.ph','Ramon V. Del Rosario College of Business (RVR-COB)','RVRCOB - ADEALM',0,'rvrcobadealm','14034fda15dc56b76f301f964028060147edf85d558aca1b93d1e65df2d4d10fe0f362b018ec8104aeaefd869b8df0493ad1b82024734886b52379bc565851c1'),(186,'rvrcob','dean','rvrcob_dean@dlsu.edu.ph','Ramon V. Del Rosario College of Business (RVR-COB)','RVRCOB - Dean',0,'rvrcobdean','9c5f8e8fa4d3c97d4e8593cf9d1739ceab22086543d43fbcb4899ee5b24d15cd9756472c095f90389b701130b0dcfed85df99091ffd99ae6ae3d215f88f5492e'),(190,'chairperson','ccsct','chairperson_ccsct@dlsu.edu.ph','College of Computer Studies (CCS)','CCSCT - Chairperson',2,'chairpersonccsct','af21e56d84ddc2e67309a4de708edb7709d7c58436d1a9aee3cbcf62bc25499ec18d629df52f5c89fb1959213420abc34d6a4fb446dbf0bb0def6cc85c109712'),(191,'chairperson','ccsit','chairperson_ccsit@dlsu.edu.ph','College of Computer Studies (CCS)','CCSIT - Chairperson',3,'chairpersonccsit','58505ef4bb3e32a66b48948a7b21101d9d7053f663bf0e05405b15a46a5dc729788df31b0abd57c1cc413da73921df1a975c6e75ae951d52b389c8af30920fd3'),(192,'chairperson','ccsst','chairperson_ccsst@dlsu.edu.ph','College of Computer Studies (CCS)','CCSST - Chairperson',4,'chairpersonccsst','855fb463a046723ab95462fa238fc9bcbfe5f998fd39c17947b1a8cc282da0f3cc5d0c5702e7226a500c9743d9ca97134e69f157db44a4aa35a504aa4147d712'),(193,'cla','assistantdeanlm','cla_assistantdeanlm@dlsu.edu.ph','College of Liberal Arts (CLA)','CLA - ADLM',0,'claassistantdeanlm','2b86a85e0a40b5330f1f7f28623e68732b59d97dc712ac4aebea3084bf66b7c1f7edf66fd111bc236e9b53c053ac8881e0d007c00a690aed89a6bf209a8e1bf1'),(194,'chairperson','clabs','chairperson_clabs@dlsu.edu.ph','College of Liberal Arts (CLA)','CLABS - Chairperson',10,'chairpersonclabs','573f688aeabea86b632f951c39061d1e20d533f54c45fec0c72cb30df57d9574ca01ed08df8bec4956350ae4a3a4b21098b929620675997c33ac98311071fd4b'),(195,'chairperson','clacomm','chairperson_clacomm@dlsu.edu.ph','College of Liberal Arts (CLA)','CLACOMM - Chairperson',11,'chairpersonclacomm','c91fa8ca51d054cce16b1d22460acc05e672060e6749f4bafdbfe13db8a39cd6edc144f1cd7369daa5cec9513dfe88720f56c817be57421c3b4cc6b691172596'),(196,'chairperson','clalit','chairperson_clalit@dlsu.edu.ph','College of Liberal Arts (CLA)','CLALIT - Chairperson',12,'chairpersonclalit','687ba01aacfbe9c154dc09f0f0588dc3432adb1f817ffdb87162d458f71537ceae70559dca6b5669dad495e85c7da8677a39cf5c0b6659c117a192db83e6feb8'),(197,'chairperson','clafil','chairperson_clafil@dlsu.edu.ph','College of Liberal Arts (CLA)','CLAFIL - Chairperson',13,'chairpersonclafil','4e5ec069d02b40715c4d87805fbedb11b8c80b5d742f14030af0f59551d11234d4aab111204a0776aa77d32b4ee9e300e8158af0d5f56f6da08b1efbc4ce001e'),(198,'chairperson','clahis','chairperson_clahis@dlsu.edu.ph','College of Liberal Arts (CLA)','CLAHIS - Chairperson',14,'chairpersonclahis','569f36090fcd4c5962dfb031cab63d691f689be459d82c6e6fe323acb12c97d38b4ea084e7f2fc88ca31ffbc52ce7b9cb8b3b6f9d1455d1e5b603fdf2442c953'),(199,'chairperson','clais','chairperson_clais@dlsu.edu.ph','College of Liberal Arts (CLA)','CLAIS - Chairperson',15,'chairpersonclais','f91eeea8a830ac38b30a73b71990d48630094ef87dc7751fe7b3539f1fa6263302931ede6b16cc84217670617eb7913fb788856fe1d3cabe4b128df4ef611c95'),(200,'chairperson','claphilo','chairperson_claphilo@dlsu.edu.ph','College of Liberal Arts (CLA)','CLAPHILO - Chairperson',16,'chairpersonclaphilo','7b0e2f6563e11c4d3a3a789e1d1b4bca1210a078605dd5291dca922b9f466c61c0cf48ee8ceef02f4b73d1af2e8bbb614a419098c1e40f0ed4c88b385474ff71'),(203,'chairperson','clapolsci','chairperson_clapolsci@dlsu.edu.ph','College of Liberal Arts (CLA)','CLAPOLSCI - Chairperson',17,'chairpersonclapolsci','c3dc8bcf190c7c047823609e2405dd5ce68b1e5bd8dc275792fcb497533b7690b18e930197ed6be8e780e69feca0646e56709aa99f8f5deb3d18f50fda23b69a'),(204,'chairperson','clapsych','chairperson_clapsych@dlsu.edu.ph','College of Liberal Arts (CLA)','CLAPSYCH - Chairperson',18,'chairpersonclapsych','d6235d70e53cb757eaea974386ccb16f6667e6eab1eca10c9f21a7cb651eadbb6017e463ede5fda784cdbf1151db7faa7c715a9bbeb41c167d7a26fafd2370d9'),(205,'chairperson','clatred','chairperson_clatred@dlsu.edu.ph','College of Liberal Arts (CLA)','CLATRED - Chairperson',19,'chairpersonclatred','9ffafb56b66474c1c8ef68dfc051fc73742a72c4a7ec3ef5d2e66032d9c4a9cb0282555ff826eec7c31f62c32913b02ee77916eaad71c14e6fdf1d1883675ba9'),(206,'chairperson','rvrcobacc','chairperson_rvrcobacc@dlsu.edu.ph','Ramon V. Del Rosario College of Business (RVR-COB)','RVRCOBACC - Chairperson',29,'chairpersonrvrcobacc','4bb877fd2f53e2843ec0fe4d1a8f20e5038c49281bd1350ac6f146b52749010a9f935912d51d4b57e995dc9b7d27858edd1d0d97dc18a2bc6b1756b244be2ad5'),(207,'chairperson','rvrcobcl','chairperson_rvrcobcl@dlsu.edu.ph','Ramon V. Del Rosario College of Business (RVR-COB)','RVRCOBCL - Chairperson',30,'chairpersonrvrcobcl','9468de684fdb7bfbf75106d2aa8f605343100a4ad5cf61b490fe4510986186331bcfbe6f8288c12ed4d09f72266f197a6d616905caeee1f09c8de166e9f3c2f2'),(208,'chairperson','rvrcobdsid','chairperson_rvrcobdsid@dlsu.edu.ph','Ramon V. Del Rosario College of Business (RVR-COB)','RVRCOBDSID - Chairperson',31,'chairpersonrvrcobdsid','dffafadefed7df31907b7bef26e566b4d47ca400136778fee1a579b309dca53cbad120943d74aeba5de49d7bbe42b5dadc40a5aa42b84fe3a18ab04ecb6a18eb'),(209,'chairperson','rvrcobmfi','chairperson_rvrcobmfi@dlsu.edu.ph','Ramon V. Del Rosario College of Business (RVR-COB)','RVRCOBMFI - Chairperson',32,'chairpersonrvrcobmfi','5809805a41cddc18c262fb98708f014c692bb1ff52a99f8ce107e7dfc5a3d426ba09adee73452ac9ba7f83eb4788889358f0f70792e44cfbd02aa7536c61003a'),(210,'chairperson','rvrcobmod','chairperson_rvrcobmod@dlsu.edu.ph','Ramon V. Del Rosario College of Business (RVR-COB)','RVRCOBMOD - Chairperson',33,'chairpersonrvrcobmod','7e327e8448ce64d6834f9f47f45a56ef40b9294907b08754d383323098e4976d91caed3e553837965875a388ea6edc3a9261fa8d9e7f9e1474842807b4e225d1'),(211,'chairperson','rvrcobmm','chairperson_rvrcobmm@dlsu.edu.ph','Ramon V. Del Rosario College of Business (RVR-COB)','RVRCOBMM - Chairperson',34,'chairpersonrvrcobmm','f296545329f6e5a401729dedb43f2063095d6974cdc44499b76a2029d996533a5d944b539763dc1bd895488fc0e96dadd3144ab5dcbd34e12272cb6a7ef42749'),(212,'chairperson','soeiae','chairperson_soeiae@dlsu.edu.ph','School of Economics (SOE)','SOEIAE - Chairperson',35,'chairpersonsoeiae','0e6b4afcf2d864cca84a2ff80c6ecb53f61c2fd81d9bb53ced750111449ec5b8237a3238f09c903b3addae0a77c5057ac05f9686c08410ec5d838cfeec35cd53'),(213,'chairperson','soefae','chairperson_soefae@dlsu.edu.ph','School of Economics (SOE)','SOEFAE - Chairperson',36,'chairpersonsoefae','f4353f2ef538e2ce284b37e2a040b18c7b1408b063dc273be23a842e9ecce5de1c6db22b4a7574b2b2184bb14104232ded25aa31ecd0fe83cba93bfafc7df3db'),(214,'chairperson','soelae','chairperson_soelae@dlsu.edu.ph','School of Economics (SOE)','SOELAE - Chairperson',37,'chairpersonsoelae','a276c0d1fabb5f291f8b014d95228873ba6bb28ee225e3a51a9661fde8b21406123c96893cc34f77da5d9dc1f5334a05d190559ac11ed3d2e740a124afab82c0'),(215,'chairperson','soemfi','chairperson_soemfi@dlsu.edu.ph','School of Economics (SOE)','SOEMFI - Chairperson',38,'chairpersonsoemfi','1da683a9b4f5fd453d2c5e9d5b22ce2e484c65122ff78bf909f83c0dd98fe99f1b50902a6b214f39205577cefdb87e1adfab2c5c83cdd29f2c1583d7ce85c054'),(216,'chairperson','soemod','chairperson_soemod@dlsu.edu.ph','School of Economics (SOE)','SOEMOD - Chairperson',39,'chairpersonsoemod','fb7e30ffbe687fb5e5dd4d8bee1d35151af3807c78503d0b35a7350ff975a0a6316b57f53cb0b727bafe2e792358846c2ef362f9b7d3759ba8e587033cd006cd'),(217,'chairperson','soemm','chairperson_soemm@dlsu.edu.ph','School of Economics (SOE)','SOEMM - Chairperson',40,'chairpersonsoemm','425626607bc9096a9267703e215c761963df623099bb214b014d8d24765f5c78d98a536b454d59cf80d4caac960aac52e6fc419897a3da0f2d406748b6cc9c62'),(218,'soe','assistantdeanlm','soe_assistantdeanlm@dlsu.edu.ph','School of Economics (SOE)','SOE - ADLM',0,'soeassistantdeanlm','654e385160427b228d343c90e51dfa155fca7bf4869bf8684f9250fea3c3e8c084999578544304c378521de08cd8412b349f5608d65149fbbaf31ecff7e89a21'),(219,'bagced','assistantdeanlm','bagced_assistantdeanlm@dlsu.edu.ph','Br. Andrew Gonzales College of Education (BAGCED)','BAGCED - ADLM',0,'bagcedassistantdeanlm','ee0edd7d46a69abed0132c8f635ff2a7cd626701d778f6cef008307b4b6005556535e142dba09d13d21117aac987fae7a9c52f164cfcd3c2f1c5ca17f5cbfa87'),(220,'chairperson','bagcedcepd','chairperson_bagcedcepd@dlsu.edu.ph','Br. Andrew Gonzales College of Education (BAGCED)','BAGCEDCEPD - Chairperson',5,'chairpersonbagcedcepd','03627ef21e2db3feb7825ec30da5444fbcfa41cd4a98e0a3b13f5b1822ac606d507be8e2b7ab9e94edf4a8c28ef3336ae864486fca031c8cb53c03f2fb0d318d'),(221,'chairperson','bagceddeal','chairperson_bagceddeal@dlsu.edu.ph','Br. Andrew Gonzales College of Education (BAGCED)','BAGCEDDEAL - Chairperson',6,'chairpersonbagceddeal','80f28fa52f3ed1149c2e92918f6e075ee559236865b7e636e4dce3d58c1188e0498e19830af0229b78065d1a89683ba41fc3136c167bcf8e4286af024fbd34ba'),(222,'chairperson','bagcedelmd','chairperson_bagcedelmd@dlsu.edu.ph','Br. Andrew Gonzales College of Education (BAGCED)','BAGCEDELMD - Chairperson',7,'chairpersonbagcedelmd','e460f4483fd60149a543c02b90ee2ffe928fec401ccfca7d1a52f9d0c0f7d194758d3b95218373f74a2c073418e57f35e59f87f897bb56690a7a6e4aea1e5d5e'),(223,'chairperson','bagcedped','chairperson_bagcedped@dlsu.edu.ph','Br. Andrew Gonzales College of Education (BAGCED)','BAGCEDPED - Chairperson',8,'chairpersonbagcedped','a124c663481d4fd26994c6fb477031cd09f62662058d92b505fcffb3d81f4cf43af263e191e7ba2c7e28a726448ebdeb95e80af63f6820e9903ad623d6059406'),(224,'chairperson','bagcedsed','chairperson_bagcedsed@dlsu.edu.ph','Br. Andrew Gonzales College of Education (BAGCED)','BAGCEDSED - Chairperson',9,'chairpersonbagcedsed','d224ceb0dcd431ccd7a9f73cb65213a4c4b35561a1bb5616074f7fd2f38f31439a4d7d4bc3c43738eb1f19dd99951d2018500d83347a14bd7c7b77088652d45e'),(225,'gcoe','assistantdeanlm','gcoe_assistantdeanlm@dlsu.edu.ph','Gokongwei College of Engineering (GCOE)','GCOE - ADLM',0,'gcoeassistantdeanlm','dc7cafd8e849f4fb7cc57639f074ee61b550e2849e2d8ae8e6d559e8165034646970233af5b52bf887cb336b545740385702c000e63f6f6035b728b50f25f184'),(226,'chairperson','gcoechemeng','chairperson_gcoechemeng@dlsu.edu.ph','Gokongwei College of Engineering (GCOE)','GCOECHEMENG - Chairperson',23,'chairpersongcoechemeng','286aad5b56a08ab833be2dde4b411c6915bcd6d0d3b30273e30d2d81d26030d2dd41e9b9d517c0b73533e753db7dfaf8667c2b5e2a4e317120c0c74ae36c319e'),(227,'chairperson','gcoeciv','chairperson_gcoeciv@dlsu.edu.ph','Gokongwei College of Engineering (GCOE)','GCOECIV - Chairperson',24,'chairpersongcoeciv','d9d3c8c94acc0e67e9f8540e01e9212a339c222ceb3c41dc9d8b101aa63f2384f7a2053a9995a8d152d2ed6bdd3c169f340a03d983a5e4c4a69ba8f02e2c8778'),(228,'chairperson','gcoeece','chairperson_gcoeece@dlsu.edu.ph','Gokongwei College of Engineering (GCOE)','GCOEECE - Chairperson',25,'chairpersongcoeece','8f308d92ee6c0ca2172cab9a05c6841099c6d83b3a58519cdf7b4ce5c99b54f334cd7563dddd0d3a00fc6ed617535774d4cb84ad66c2ec7d9ca21769f84ab405'),(229,'chairperson','gcoeie','chairperson_gcoeie@dlsu.edu.ph','Gokongwei College of Engineering (GCOE)','GCOEIE - Chairperson',26,'chairpersongcoeie','a1da473cb84689d7227aeab6fbaa75faa664b8677212c2b9e4f758559fb292af0896c06f4f6df9266c67ee8549a89db3c1cff44389095d02da9d9e022960ada4'),(230,'chairperson','gcoemem','chairperson_gcoemem@dlsu.edu.ph','Gokongwei College of Engineering (GCOE)','GCOEMEM - Chairperson',27,'chairpersongcoemem','fda981fb8ccc3e33d192d9ae54e9cb1ed0a085634a7b1984c2ce32fb3402f0ce1b6dde621471e2b6d49f38b260d5020976569af7ee3cac417ecf96aec479b7ea'),(231,'chairperson','gcoeme','chairperson_gcoeme@dlsu.edu.ph','Gokongwei College of Engineering (GCOE)','GCOEME - Chairperson',28,'chairpersongcoeme','834ab30fc97b534e394f03e5d2875d873f146fcf495e02940dde0455356fc4a8aaba3388295102cd1202911347d65e4deb41db379d1f35dbf33c0f5a6853e930'),(232,'cos','assistantdeanlm','cos_assistantdeanlm@dlsu.edu.ph','College of Science (COS)','COS - ADLM',0,'cosassistantdeanlm','b4bc564ee7478dbce352e32c0bbcc9242f82b994e65556c02df003b82698a679f91d4af7b4c3ae09b5bfecd86a25885d4fa2915466014ea9a458872377c749da'),(233,'chairperson','cosbio','chairperson_cosbio@dlsu.edu.ph','College of Science (COS)','COSBIO - Chairperson',20,'chairpersoncosbio','d1b10bbb591a77049ce0e7b5170cc3fe45af6cef5f8a9ea49de00716e74cdd4bf01a180bc5ac744d8fdf1b790a2e3dd201f5cc73e66ef65f600b4c037758b44f'),(234,'chairperson','coschem','chairperson_coschem@dlsu.edu.ph','College of Science (COS)','COSCHEM - Chairperson',21,'chairpersoncoschem','ac4509446edf8a8ff6eb05134367346f7687f36abd8e8cc571249a558ed21f990086be94fb25945384b8bd7b361ea604dddd834540c66af78fa812f01aead911'),(235,'chairperson','cosphys','chairperson_cosphys@dlsu.edu.ph','College of Science (COS)','COSPHYS - Chairperson',22,'chairpersoncosphys','d02c96cf805fae18f307b7cdd6b30a0378f09c4af070081aa7036fda9e6b74365e1c55186e507301442cd8ee97c1699e43a9f313c1a81bb7f2370f9d1b12a733'),(236,'opm','unitrep','opmunitrep@dlsu.edu.ph','Office of Personnel Management (OPM)','OPM - Unit Representative',0,'unitrepopm','de68dbd399f7a0158c53e8605356c535a87f92660f2a788bfd6fcccc28b12e1c7cfa02cee03a961a742ae0af408fdec35d392af8f17f855519357ffb20d6454a'),(237,'opm','unitchair','opmunitchair@dlsu.edu.ph','Office of Personnel Management (OPM)','OPM - Unit Chair',0,'unitchairopm','3f8f93db9ca52653a3ccb8e86a70779bc037d6bf1c936f92f6a3b5fb3a20cc7c106ace9727c9ce559fec4b2fe01c51317fcaceb62ef9f5b87ac026d2494d66a9'),(238,'opm','sedirector','opmsedirector@dlsu.edu.h','Office of Personnel Management (OPM)','OPM - Social Engagement Director',0,'sedirectoropm','c405b158b68083d023d011d605ae694d4c06997b86d258eb87b9c21e3df67897574473d0e1d7cd53cf3a9598da4518d84b2fcdb2dd81c1c6b9c43fad4367770d'),(239,'opm','vpvc','dsadasdsa@dlsu.edu.ph','Office of Personnel Management (OPM)','OPM - VP/VC',0,'vpvcopm','eb5326bda602b42b344651963376e39427b2d1e2a685a956a9de12b3b431d60d0cee7527fd6adedcc44683dd57ef45bb98a1778ade0f89fa2d23a1dbb39fa5f0'),(240,'adlm','opm','adlmopm@dlsu.edu.ph','Office of Personnel Management (OPM)','OPM - ADLM',0,'adlmopm','bb4b140d1343c3dfe2344a2360e280e5e173a3ddd592d5b7540d355fb4fec493effd6cc0a879879f6be06ada64f1b609a100cf9c66c1d93ec0baaa2cf0021465'),(241,'unithead','opm','unitheadopm@dlsu.edu.ph','Office of Personnel Management (OPM)','OPM - Unit Head',0,'unitheadopm','b435a5761fbb21510cc70d9d4de8f206036b3e9560f6454ecd6e0812ba29734b0d729ff8435e73cfdeee6290002e3122823ba39d044189f68c6c9738ec95723b'),(242,'director','opm','directoropm@dlsu.edu.ph','Office of Personnel Management (OPM)','OPM - Director',0,'directoropm','2f0bb0245dabf64b251297b58ad8870aa3e0b2b8e33b7269a89f3e605b2616e80220cf9cd06b158d017c43cf8ecbaf37a3684aab63d06d2b2820a1842a2bc607'),(243,'jay','ovplm','jayovplm@dlsu.edu.ph','Office of the Vice President for Lasallian Mission (OVPLM)','OVPLM - Sir Jay Position',0,'jay','42d5ae85008d2a3c0c0059564ed10203d5cff49a91467b19d267aa764d47d30d3d7d9154e6a4d8e61dcd8ff79a7c727b8cb4d63b1b54f35c6d42a2cc1cad98aa'),(244,'Jonathan','Santos','unitrepso@dlsu.edu.ph','Security Office (SO)','SO - Unit Representative',0,'unitrepso','d1ef9d35fec6e8ae6a8395ed3863df6fabbc16d2008130f112ab237f43c94ddab53f10260351311ce85c5824ea3aed24b76dcc9eb28bb15c035bcb1970df30a6'),(245,'unitchair','so','unitchairso@dlsu.edu.ph','Security Office (SO)','SO - Unit Chair',0,'unitchairso','5f6243904d18a252a008ff6782819ad4830d2900971ed05218ee138904b5890b998c8693ac798b84f1305acc6e75b19c1aedfe57d91dd6f77b96ebd6aa90b157'),(246,'Daniel','Versoza','sedirectorso@dlsu.edu.ph','Security Office (SO)','SO - Social Engagement Director',0,'sedirectorso','da718d65a1b53120f02355984fc87b29beb7242e6a8d64d58591d37ad231b45f92ddbf7a11fe8b86c413845bc1bd7a18c9f420895d25bea8f8c454271493a4b4'),(247,'Jericho','Mendoza','jericho_mendoza@dlsu.edu.ph','Security Office (SO)','SO - VP/VC',0,'vpvcso','5fc4f0c981512d79e75e999ab6c7803f22e58570f2681db9bca2c936de098cf108ce24b70d4e5c007d228077141464102767c5973e43ad101924a87d6042855c');
/*!40000 ALTER TABLE `informationsheet` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kra`
--

DROP TABLE IF EXISTS `kra`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `kra` (
  `kraID` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `userID` int(11) DEFAULT NULL,
  PRIMARY KEY (`kraID`),
  KEY `LA5_idx` (`userID`),
  CONSTRAINT `LA5` FOREIGN KEY (`userID`) REFERENCES `informationsheet` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kra`
--

LOCK TABLES `kra` WRITE;
/*!40000 ALTER TABLE `kra` DISABLE KEYS */;
INSERT INTO `kra` VALUES (1,'KRA3 - Formation for all sectors that is truly Lasallian','2018-10-06',71),(2,'KRA5 - Community that is attuned to a sustainable Earth and socially engaged','2018-10-06',71);
/*!40000 ALTER TABLE `kra` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `measure`
--

DROP TABLE IF EXISTS `measure`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `measure` (
  `measureID` int(11) NOT NULL AUTO_INCREMENT,
  `measure` varchar(500) DEFAULT NULL,
  `description` varchar(500) DEFAULT NULL,
  `target` varchar(500) DEFAULT NULL,
  `kraID` int(11) DEFAULT NULL,
  `goalID` int(11) DEFAULT NULL,
  PRIMARY KEY (`measureID`),
  KEY `LA7_idx` (`kraID`),
  KEY `LA8_idx` (`goalID`),
  CONSTRAINT `LA7` FOREIGN KEY (`kraID`) REFERENCES `kra` (`kraID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `LA8` FOREIGN KEY (`goalID`) REFERENCES `goal` (`goalID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=114 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `measure`
--

LOCK TABLES `measure` WRITE;
/*!40000 ALTER TABLE `measure` DISABLE KEYS */;
INSERT INTO `measure` VALUES (1,'KRA3-G1-M1','Integration in curricular and co-curricular programs of formation based on Lasallian sprituality and mission','1. Development of Lasallian formation program for graduate students  2. Existing Lasallian formation programs for undergraduate students have been reviewed and revised\r \r 3. 50% of student organizations have implemented a Lasallian formation activity',1,1),(2,'KRA3-G1-M2','Participation of administrators, faculty, and personnel in Lasallian formation activity','1. 50% of Faculty Departments have undergone Lasallian Formation Programs\r\n\r\n2. 75% of Staff have undergone Lasallian Formation Programs\r\n\r\n3. All administrators have undergone the Lasallian formation activity',1,1),(3,'KRA3-G1-M3','Number of Lasallian formation activities available for other sectors in the DLSU community','1. At least one Lasallian formation activity engaging alumni, parents, and community partners',1,1),(4,'KRA3-G2-M1 ','Number of fora and other interdisciplinary activities focused on bridging faith and scholarship (e.g. ethics, heritage, culture, science, theology, philosophy)','1. At least one interdisciplinary activity conducted each term',1,2),(5,'KRA3-G2-M2 ','Integration of faith dimension using the Lasallian Reflection Framework (LRF) in GE courses','1. Review and integrate the LRF in all NLCC subjects',1,2),(6,'KRA3-G2-M3 ','Participation of international students in co-curricular activities promoting interfaith and multicultural diversity','1. 50% of international students participate in co-curricular activities promoting interfaith and multicultural diversity',1,2),(7,'KRA3-G3-M1 ','Number of Lasallian communities committed to the Lasallian mission','1. 3 communities',1,3),(8,'KRA5-G1-M1 ','Number of sustainable social engagement project of units','1. 20% ',2,4),(9,'KRA5-G1-M2 ','Involvement of faculty, student, and personnel in DLSU community engagement programs and activities A. Percentage of student organizations involved in community engagement programs and activities B. Percentage of staff engaged in community engagement programs and activities C. Percentage of departments with community engagement projects','A. 50%\r\n\r\nB. 50%\r\n\r\nC. 50%',2,4),(10,'KRA5-G1-M3 ','Number of social engagement choices under the four components of the Sustainable Development Goals Localization Project - L-ARAL (Education) - L-SEED (Social Enterprise) - L-Envisage (Environment/DRR) - L-HEARTS (Health and Wellness)','1. 16',2,4),(11,'KRA5-G2-M1 ','Service learning (SL) components of academic programs A. Percentage of undergraduate programs with SL component B. Percentage of graduate programs with SL component','A. 50%\r\n\r\nB. 10%',2,5),(12,'KRA5-G2-M2 ','Number of international SL activities','1. 1',2,5),(13,'KRA5-G2-M3 ','Student satisfaction in service learning experience','1. 3/4',2,5),(14,'KRA5-G3-M1 ','Percentage of members of Lasallian Community engaged in activities related to the realization of the SDGs','1. Baseline: Inventory of existing SDG localization efforts',2,6),(15,'KRA5-G3-M2 ','Number of public engagements that allows sharing of expertise for the realization of the SDGs','1. Baseline: Inventory of public engagements/sharing of expertise of the University units/personnel for the realization of the SDGs',2,6),(16,'KRA5-G3-M3','Metrics to gauge SD impact of DLSU initiatives','1. Development of SD impact assessment tools/SD metrics',2,6),(17,'KRA5-G4-M1 ','Compliance with green building standards for both existing and new construction','1. Baseline study',2,7),(18,'KRA5-G4-M2','Resource use efficiency (i.e. material resources, utilities, etc.)','1. Baseline study',2,7),(19,'KRA5-G4-M3 ','University\'s per Capita Carbon Footprint','1. Baseline study',2,7),(20,'KRA5-G4-M4 ','Percentage of total energy requirements provided by alternative energy sources','1. Baseline study',2,7),(21,'KRA5-G4-M5 ','University\'s per Capita Water Footprint','1. Baseline study',2,7),(22,'KRA5-G4-M6 ','Percentage of spaces dedicated to biodiversity \'green zones\' and open spaces','1. Baseline study',2,7);
/*!40000 ALTER TABLE `measure` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notification`
--

DROP TABLE IF EXISTS `notification`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `notification` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(500) DEFAULT NULL,
  `body` varchar(1000) DEFAULT NULL,
  `datetime` datetime DEFAULT NULL,
  `userID` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `LA14_idx` (`userID`),
  CONSTRAINT `LA14` FOREIGN KEY (`userID`) REFERENCES `informationsheet` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notification`
--

LOCK TABLES `notification` WRITE;
/*!40000 ALTER TABLE `notification` DISABLE KEYS */;
INSERT INTO `notification` VALUES (1,'SE Proposal ready for approval','Program: Edit SE Testing\n2019-02-07 17:20','2019-02-07 17:20:40',87),(2,'SE Proposal for Revision','Edit SE Testing has some revisions before it is approved by the Department Chair.\n2019-02-07 17:20','2019-02-07 17:20:59',85),(3,'Revised SE Proposal ready for Approval','Program: Edit SE Testing\n2019-02-07 19:52','2019-02-07 19:52:43',87);
/*!40000 ALTER TABLE `notification` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `positions`
--

DROP TABLE IF EXISTS `positions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `positions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `position` varchar(100) DEFAULT NULL,
  `unitID` int(11) DEFAULT NULL,
  `departmentID` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `positions`
--

LOCK TABLES `positions` WRITE;
/*!40000 ALTER TABLE `positions` DISABLE KEYS */;
INSERT INTO `positions` VALUES (1,'OVPLM - Vice President for Lasallian Mission',10,0),(2,'OVPLM - Executve Officer',10,0),(3,'OVPLM - Unit Representative',10,0),(4,'BAGCED - ADEALM',13,0),(5,'BAGCED - Dean',13,0),(6,'BAGCEDCEPD - Chairperson',13,5),(7,'BAGCEDCEPD - Department Chair',13,5),(8,'BAGCEDCEPD - Unit Representative',13,5),(9,'BAGCEDDEAL - Chairperson',13,6),(10,'BAGCEDDEAL - Department Chair',13,6),(11,'BAGCEDDEAL - Unit Representative',13,6),(12,'BAGCEDELMD - Chairperson',13,7),(13,'BAGCEDELMD - Department Chair',13,7),(14,'BAGCEDELMD - Unit Representative',13,7),(15,'BAGCEDPED - Chairperson',13,8),(16,'BAGCEDPED - Department Chair',13,8),(17,'BAGCEDPED - Unit Representative',13,8),(18,'BAGCEDSED - Chairperson',13,9),(19,'BAGCEDSED - Department Chair',13,9),(20,'BAGCEDSED - Unit Representative',13,9),(21,'CCS - ADEALM',11,0),(22,'CCS - ADLM',11,0),(23,'CCS - Dean',11,0),(24,'CCSCT - Chairperson',11,2),(25,'CCSCT - Department Chair',11,2),(26,'CCSCT - Unit Representative',11,2),(27,'CCSIT - Chairperson',11,3),(28,'CCSIT - Department Chair',11,3),(29,'CCSIT - Unit Representative',11,3),(30,'CCSST - Chairperson',11,4),(31,'CCSST - Department Chair',11,4),(32,'CCSST - Unit Representative',11,4);
/*!40000 ALTER TABLE `positions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `se_measures`
--

DROP TABLE IF EXISTS `se_measures`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `se_measures` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `seproposalID` int(11) DEFAULT NULL,
  `measureID` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `LA70_idx` (`seproposalID`),
  KEY `LA71_idx` (`measureID`),
  CONSTRAINT `LA70` FOREIGN KEY (`seproposalID`) REFERENCES `seproposal` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `LA71` FOREIGN KEY (`measureID`) REFERENCES `measure` (`measureID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=60 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `se_measures`
--

LOCK TABLES `se_measures` WRITE;
/*!40000 ALTER TABLE `se_measures` DISABLE KEYS */;
INSERT INTO `se_measures` VALUES (53,25,4),(54,25,5),(58,26,8),(59,26,9);
/*!40000 ALTER TABLE `se_measures` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `seevaluation`
--

DROP TABLE IF EXISTS `seevaluation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `seevaluation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` date DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `detail` varchar(500) DEFAULT NULL,
  `subjectName` varchar(500) DEFAULT NULL,
  `sl11` int(11) DEFAULT NULL,
  `sl12` int(11) DEFAULT NULL,
  `sl13` int(11) DEFAULT NULL,
  `sl14` int(11) DEFAULT NULL,
  `sl15` int(11) DEFAULT NULL,
  `ss21` int(11) DEFAULT NULL,
  `ss22` int(11) DEFAULT NULL,
  `ss23` int(11) DEFAULT NULL,
  `ss24` int(11) DEFAULT NULL,
  `ss25` int(11) DEFAULT NULL,
  `pe31` int(11) DEFAULT NULL,
  `pj41` int(11) DEFAULT NULL,
  `lv51` int(11) DEFAULT NULL,
  `lv52` int(11) DEFAULT NULL,
  `lv53` int(11) DEFAULT NULL,
  `lv54` int(11) DEFAULT NULL,
  `lv55` int(11) DEFAULT NULL,
  `pm61` int(11) DEFAULT NULL,
  `pm62` int(11) DEFAULT NULL,
  `pm63` int(11) DEFAULT NULL,
  `pm64` int(11) DEFAULT NULL,
  `pm65` int(11) DEFAULT NULL,
  `pm66` int(11) DEFAULT NULL,
  `pm67` int(11) DEFAULT NULL,
  `pm68` int(11) DEFAULT NULL,
  `pm69` int(11) DEFAULT NULL,
  `pm610` int(11) DEFAULT NULL,
  `pm611` int(11) DEFAULT NULL,
  `pm612` int(11) DEFAULT NULL,
  `pm613` int(11) DEFAULT NULL,
  `or71` int(11) DEFAULT NULL,
  `feedbacks` varchar(2000) DEFAULT NULL,
  `seproposalID` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `LA26_idx` (`seproposalID`),
  CONSTRAINT `LA26` FOREIGN KEY (`seproposalID`) REFERENCES `seproposal` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `seevaluation`
--

LOCK TABLES `seevaluation` WRITE;
/*!40000 ALTER TABLE `seevaluation` DISABLE KEYS */;
INSERT INTO `seevaluation` VALUES (17,'2019-01-29','dsadsa','dsasa','dsadsadas',5,5,4,4,4,4,4,4,4,4,4,4,5,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,'dsadsadsada',25),(18,'2019-01-29','dasdsd','sdsadsa','sadsa',5,4,4,4,4,4,4,4,4,4,4,4,5,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,'dsadsadsa',25),(19,'2019-01-29','dsad','asdafasd','dasdas',5,4,4,4,3,4,4,4,4,4,4,4,5,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,'dsadsaada',25);
/*!40000 ALTER TABLE `seevaluation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `seproposal`
--

DROP TABLE IF EXISTS `seproposal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `seproposal` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `unit` varchar(200) DEFAULT NULL,
  `department` varchar(200) DEFAULT NULL,
  `datecreated` date DEFAULT NULL,
  `programName` varchar(500) DEFAULT NULL,
  `programHead` varchar(200) DEFAULT NULL,
  `activityClassification` varchar(200) DEFAULT NULL,
  `targetCommunity` int(11) DEFAULT NULL,
  `targetKRA` int(11) DEFAULT NULL,
  `targetGoal` int(11) DEFAULT NULL,
  `targetMeasure` int(11) DEFAULT NULL,
  `titleOfActivity` varchar(200) DEFAULT NULL,
  `actualImplementation` date DEFAULT NULL,
  `totalAmountRequested` double DEFAULT NULL,
  `problemaddressed` varchar(500) DEFAULT NULL,
  `nameOfPartner` varchar(200) DEFAULT NULL,
  `address` varchar(200) DEFAULT NULL,
  `contactPerson` varchar(200) DEFAULT NULL,
  `mobileNumber` varchar(200) DEFAULT NULL,
  `email` varchar(200) DEFAULT NULL,
  `description` varchar(500) DEFAULT NULL,
  `objectives` varchar(1000) DEFAULT NULL,
  `explanation` varchar(1000) DEFAULT NULL,
  `sourceOfFunds` varchar(45) DEFAULT NULL,
  `academicStaffPopulation` int(11) DEFAULT NULL,
  `academicStaffExpected` int(11) DEFAULT NULL,
  `supportStaffPopulation` int(11) DEFAULT NULL,
  `supportStaffExpected` int(11) DEFAULT NULL,
  `undergraduatePopulation` int(11) DEFAULT NULL,
  `undergraduateExpected` int(11) DEFAULT NULL,
  `graduatePopulation` int(11) DEFAULT NULL,
  `graduateExpected` int(11) DEFAULT NULL,
  `step` int(11) DEFAULT NULL,
  `deptunitRemarks` varchar(1000) DEFAULT NULL,
  `deptunitdatetime` datetime DEFAULT NULL,
  `externaldirectorRemarks` varchar(1000) DEFAULT NULL,
  `externaldirectordatetime` datetime DEFAULT NULL,
  `deanRemarks` varchar(1000) DEFAULT NULL,
  `deandatetime` datetime DEFAULT NULL,
  `ovplm1Remarks` varchar(1000) DEFAULT NULL,
  `ovplm2Remarks` varchar(1000) DEFAULT NULL,
  `coscaRemarks` varchar(1000) DEFAULT NULL,
  `coscadatetime` datetime DEFAULT NULL,
  `lmc1` int(11) DEFAULT NULL,
  `lmc2` int(11) DEFAULT NULL,
  `lmc3` int(11) DEFAULT NULL,
  `lmc4` int(11) DEFAULT NULL,
  `lmc5` int(11) DEFAULT NULL,
  `lmc6` int(11) DEFAULT NULL,
  `lmc7` int(11) DEFAULT NULL,
  `lmc8` int(11) DEFAULT NULL,
  `hasVoted1` int(11) DEFAULT NULL,
  `hasVoted2` int(11) DEFAULT NULL,
  `hasVoted3` int(11) DEFAULT NULL,
  `hasVoted4` int(11) DEFAULT NULL,
  `hasVoted5` int(11) DEFAULT NULL,
  `hasVoted6` int(11) DEFAULT NULL,
  `hasVoted7` int(11) DEFAULT NULL,
  `hasVoted8` int(11) DEFAULT NULL,
  `lmcApprovalCount` int(11) DEFAULT NULL,
  `lmcReviseCount` int(11) DEFAULT NULL,
  `lmcRejectCount` int(11) DEFAULT NULL,
  `isRevise` int(11) DEFAULT NULL,
  `userID` int(11) DEFAULT NULL,
  `lmc1Remarks` varchar(1000) DEFAULT NULL,
  `lmc2Remarks` varchar(1000) DEFAULT NULL,
  `lmc3Remarks` varchar(1000) DEFAULT NULL,
  `lmc4Remarks` varchar(1000) DEFAULT NULL,
  `lmc5Remarks` varchar(1000) DEFAULT NULL,
  `lmc6Remarks` varchar(1000) DEFAULT NULL,
  `lmc7Remarks` varchar(1000) DEFAULT NULL,
  `lmc8Remarks` varchar(1000) DEFAULT NULL,
  `prs` longblob,
  `code` varchar(45) DEFAULT NULL,
  `classificationforkra` varchar(45) DEFAULT NULL,
  `unittype` varchar(45) DEFAULT NULL,
  `unitchairremarks` varchar(100) DEFAULT NULL,
  `unitchairdatetime` datetime DEFAULT NULL,
  `sedirectorremarks` varchar(100) DEFAULT NULL,
  `sedirectordatetime` datetime DEFAULT NULL,
  `vpvcremarks` varchar(100) DEFAULT NULL,
  `vpvcdatetime` datetime DEFAULT NULL,
  `datetime` datetime DEFAULT NULL,
  `addressimplementation` varchar(100) DEFAULT NULL,
  `approve1` int(1) DEFAULT NULL,
  `approve2` int(1) DEFAULT NULL,
  `approve3` int(1) DEFAULT NULL,
  `approve4` int(1) DEFAULT NULL,
  `revise1` int(1) DEFAULT NULL,
  `revise2` int(1) DEFAULT NULL,
  `revise3` int(1) DEFAULT NULL,
  `revise4` int(1) DEFAULT NULL,
  `reject1` int(1) DEFAULT NULL,
  `reject2` int(1) DEFAULT NULL,
  `reject3` int(1) DEFAULT NULL,
  `reject4` int(1) DEFAULT NULL,
  `studentorg` int(1) DEFAULT NULL,
  `remarktype1` varchar(45) DEFAULT NULL,
  `remarktype2` varchar(45) DEFAULT NULL,
  `remarktype3` varchar(45) DEFAULT NULL,
  `remarktype4` varchar(45) DEFAULT NULL,
  `remarktype5` varchar(45) DEFAULT NULL,
  `evaluationpercent` double DEFAULT NULL,
  `reasonforcancel` varchar(150) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `LA9_idx` (`userID`),
  CONSTRAINT `LA9` FOREIGN KEY (`userID`) REFERENCES `informationsheet` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `seproposal`
--

LOCK TABLES `seproposal` WRITE;
/*!40000 ALTER TABLE `seproposal` DISABLE KEYS */;
INSERT INTO `seproposal` VALUES (25,'College of Computer Studies (CCS)','Information Technology (IT)','2019-01-29','Testing 2019','unitrep ccsit','Interdisciplinary Fora',1,1,2,NULL,NULL,'2019-01-31',5000,'dsadasdsads','dsadsa','dsadsa','dafadsa','5008675','sads','adsadsa','dsadsadsa','dsadsada','OVPLM',27,5,12,5,5,5,5,5,0,'ayt','2019-01-29 17:35:43',' good','2019-01-29 17:35:57','kk','2019-01-29 17:36:28',NULL,NULL,'ayt','2019-01-29 17:45:19',1,1,1,1,1,NULL,NULL,NULL,1,1,1,1,1,NULL,NULL,NULL,5,NULL,NULL,NULL,85,'fdsfdadsada','fdsfdsfs','dsadsadsa','fdsfsfs','dsadsadsa',NULL,NULL,NULL,_binary 'ÿ\Øÿ\à\0JFIF\0\0x\0x\0\0ÿ\Û\0C\0		\n\n\r\n\n	\rÿ\Û\0CÿÀ\0=B\"\0ÿ\Ä\0\0\0\0\0\0\0\0\0\0\0	\nÿ\Ä\0µ\0\0\0}\0!1AQa\"q2‘¡#B±ÁR\Ñğ$3br‚	\n\Z%&\'()*456789:CDEFGHIJSTUVWXYZcdefghijstuvwxyzƒ„…†‡ˆ‰Š’“”•–—˜™š¢£¤¥¦§¨©ª²³´µ¶·¸¹º\Â\Ã\Ä\Å\Æ\Ç\È\É\Ê\Ò\Ó\Ô\Õ\Ö\×\Ø\Ù\Ú\á\â\ã\ä\å\æ\ç\è\é\êñòóôõö÷øùúÿ\Ä\0\0\0\0\0\0\0\0	\nÿ\Ä\0µ\0\0w\0!1AQaq\"2B‘¡±Á	#3Rğbr\Ñ\n$4\á%ñ\Z&\'()*56789:CDEFGHIJSTUVWXYZcdefghijstuvwxyz‚ƒ„…†‡ˆ‰Š’“”•–—˜™š¢£¤¥¦§¨©ª²³´µ¶·¸¹º\Â\Ã\Ä\Å\Æ\Ç\È\É\Ê\Ò\Ó\Ô\Õ\Ö\×\Ø\Ù\Ú\â\ã\ä\å\æ\ç\è\é\êòóôõö÷øùúÿ\Ú\0\0\0?\0ıÑ¼M.µv–ª­r7„„ŸLWuiğšK\ØC5\Â@Ç’€#\ëœV7\Â+8›\Ä72\r\Ér}s\ÅzZ]ùcŠ\âPV5¹ÉŸƒ\'\å\Úó\ÓşÊ¬\'ÁD\0\Ô~¸‹ÿ\0²®™®\ËH4©s…û\Øö\Í?g\äŸ­—9\Ô:Œ\åc\í\íóœ\Z’‚v­¾”·b#ú\×F5\r\è\Ù³ß¦)a½e\' 2·©\Æ*\\b]˜|¶fÈ¿”‚›°!\ÎO§^¾\Õf\×\àÅŠ}¶Iw\'\"ÁV\ã¯=y­‘¨\ÈÒ±fû\Üx\"œot+\Æ\Ş>P9\é\Ç\éS õ1Ÿ\àÎŸ(Ü—“rR\"\\s\ë\Ïÿ\0[Ş¤?³å´¿>¥6\×#\0q¿¯Oz\İ[Àwo\â\\oCŒ\Ôÿ\0…$7I#?»mù?\Ä\Ïjv]CS\Ï\à6›5±\Å\Õ\Ş\à73y`ü rzğ?\Ú\éO´ø+¦ù	\ç]\\»U\Æpõª—nXLq)Ç¨\ÏøšU¾)ŒHomÃ€•!jT‹\àN†Hš\çt¹u$¯+\ëLw9¬öø#b÷»…R ©‚1ß·O~•\Òı¶H\î\ÕQùNNI,}1\Èşt‡ZhXÇˆ\Ê…\È<zÿ\0ûTÒ‹\rLx¾\éR\Ç\æ­\ÍÒ†}©€½¡\è\Ã\éS^ü\Ó-\â2}®\á\ÕIù7·‘œqõ\Åjl\È]Árt\ÉÀ\ã<òzs\ÔÓ¯5“40¡A\' ³©Á\É>¾æ†’\Ø5F$¿´ \ì÷›\ÖF…\È\È\ÏN=ºu8\éDtQùt\Z.	i\å€cùñ§ò­“}¹d†t*I?yv¹#§¿\×ŞŸi¨Ê’¤–@\ÉÀ\Î\Õù\É¯<fšŒX©ğSET\å“i\É}¥X\ç¯t\é×‘D\ß	4„5\Ù,‹±‰\Ìø\0óÁ!x<t=kj\ê÷Ï‹`Ú¢8\Úù\àƒ½°Ü’9\ÇA™#5\r\Åö\éÿ\0vHXÕ£\0~S\æg8\àö\é\Å>Hmğ£@]›¡¸mÅ®°	\áA\0ü\Ü\09úÕƒğ@wCöY\Ù|³»,>oŸ‚1Á\Î1\Ğf¥}T\"E€\ÆJ\Æ\ã\æ\È\Ët?‡n=i}ö‹¹Ys–R\Ç;²8\íş\íRŒD\î\È.şøzÁ[+¢DL\ìZ\áˆsóG±\ã#\ÜR\Éğ“A6³ı‘#r§r‹‡\Ë}\àº•nk‰§c\î[pR’\ãq\Îyõ\ëUR\âO±©ÁÃ—\'\îr‘şª•˜‘Z†>c¼X—+‰.d;º\àğ\Şã§¥Jÿ\0¼5ò\çJV\ŞKÊ™A\Æ\Ï\É\É\É\"¬\Ş\\,·%fÎ‡V\àœŸ\è*! \n\äm)#’Ì¹\ç¦8ÿ\0\ëQbˆ¬¾xv5xÆ\Ü\å&w$	\Ç\Í\Ç\0ô¨—ÀU‘›LCóü \Èüõ\à\r\Üõ•Jòğ>÷$\ç½:Ó¢»1\ÆH\0‰r¤w\Ç?^½x\æ€W+Â¿\Ğ-]˜\éğºñÁv\ã÷¹¨\ÓÀš\Zsö¿\ï¦?û5X7E[=ıqL\î\êx=ihib¼\ÑXóa	ôû\ßüU7şM)Hc\ãŒU“\Ç#\Ô\Ó\\\àqNÁÊ¥s\àı%\ÏüxAùšC\à\Í%\å\Â\ßùÕ”“|õ¡\Üæ¥b“xCI‹?Šoü!\ÚA?òƒõ« ‘G™1@¥~…1\à\İ t\Ó\íÿ\03I\'ƒ´‚?\ã\Â\Ì\Õ\Â\Øôü\é²H1ş‚53¥ğN‘\'aˆP\äb¸¯x+û\r|û}\Í9%yõ¯D\í“\ã‡xVóı\Ï\ê*f®]Oö…ÿ\0kEG°úÊŠ\æ6:Ï„RÔ®\É\ë±?™¯A\Îñı;\ZóŸƒN­“¸lL{rk\Ğü\Ìz\Öñm-L ®<61ùSª1 =¹õ\Í<6­hö/|oµ¹\é\ÜÔ¤ƒÓ‘\Øú\Õu9\ÏCOY=Mg7w¡Z’Œg½H³\\z‰$‡×±ô¥VÁ\äñüªGvM€!8;I\ê	\ëı*eË¯e\Êÿ\0{­V÷²2\0sşM ”Ÿ¾[=9ô .\Ëm1„s\Æ01Ğ½±!‚’\Ø\ã·~ªºü\ï• `\É\ÎjC zŒ\ë\ëHZ–\ÚiÅ¿€3·w ÿ\0gŸ­B[ks¹r@?\â;có¤’WºX\Ç\Èj\á\0Ú£\××­V\Ô5(4\ë7š\á\ÂA\n—ff\Ú8õú\nR\Ë] pûW\'NÒ½{úZ‡Tñ-®™k¸¸\Ş<6\ÒÍ´c-\Ğúu<{\×È¿µü3\Âc}7O{ıh\ÈC1À°O\ŞA\à¾T\r§‘¼zW\Ä?o_|T\Ôb¸:½¥i\Å,1Ee\Ø\\\Çş±‚™9RrÁH#\0 šPob\\\Ò\ÜıGø™ûjø\áu\Ê}³^\Ó\n$‹>w)2£8\ÇT]…‰\0zY—ÿ\0·\ß\Ãû}n\Ú\ÏûLÌ°\\\\™Ë·«ñ÷\Ç•\r§±5ù\n·:Ö»¡\ê7\Ó\Èom-™­\Ö+É™¥…;\ÓR\ÙVÀ\'~–FXW;©kú€\ÔşËª_Z\İ*¬¨eUD…—\Î~Km\ç|’m\ŞIÀß²0sGê¿¿àªğõ\Öä€ˆB\å\î\îD†2\á¦\Ê\0‹–ùbbw\Ï_³ÿ\0‚º\êVú‰\Ú\ãK²¸+\Ùc·q#~\éY®ˆ\Ş\á˜\ç¨#vAñGÄz\ËM½\Õl\î$\Õ.\áó?ycr\ïk*2›­“\Ë\ïı\à,rB˜‘\Ç\Øx\áZ\Âú/.g†\á\ÚI‡\Ş&)G\Ìy\Ü~w9`H*v•<\ÒöI\n\ç\×3ÁP¾-™¤³—Fh-\\F\ßiŠR!Mù\Èìœ«……\áúz\ï\Íÿ\0>ø« ø\Ş\É&}#Ro³\Í%Å‰gˆ2Ÿ•\ÚI@ûªûÀ§‘€\Üñv±ª&¿¢[8x\ì\çdª@\r`+\Æ\Ù\à\í„!‰\çi÷ş(óü[<\Ûu\nl!\Ù\ÊIo™›†fpI~xÀ\ÎEªq\ê\ZŸ Ÿ\n?\à²4\×<Kog«x?Nm=.#†\î\æ)dCl\\o+ƒ“\ÉûùbA¥}·ğ³\ãv—ñV\Ê°–…T\ÚÄœ“\è@#ñõ¯\Â\Í3\Æi-<ñ\Í.mĞ¢2]mŞ¬1\Ç$.™22y¯_øÿ\0	ñ\ÏÀ™4_*}E¬\áÿ\0_²A¶\ëk‚¯Û´Ÿ.ˆbA88‹‹OCX\ÚÚŸµ|\Æ?\Ã\Èô\È\ïÚ£óö\ÄÀc‘{W\çÿ\0€¿\à´z,w_Ùº¾‹¨\Ésicyip“Áwó\àaƒqõZûW\áW\ÅM\â÷ƒm5\Íöû+´VVŠD}„¨%[i\á†@#¨4õZ²\Ò[£ªvò\àŸz2\0\Ï#\Ğq\Èÿ\0\ëşU\æ?Sø\ÓÓ“\È,;3óš9\ÛØ­G²\î\à÷£y=\Ç\áC¨W\á\ÃpG©\ê?\n¨¶\ÃQ\ÏÒ€1\ßô¤i6¿¥\ÛGZ«»\Ø5ù\Ó^M§ÿ\0¯Mó‰<Ÿ¦5\Ûqª\Ô5$v\Ú;\Ó|\ïoÖ˜Xš(\Ô5\Ûq¤¢š\íµh\Ôz„‡	Y~,S/†o}¢?\ÌUó!¥Pñ3\Å=wÿ\0\\Ÿ>üRÔ”ûW“\éú\ÑM74W õ:ƒ\n\"¿\Ô=\n úrk\ĞóšóÏƒjRóP\ÏBŸ\Ä\×Ï®*\Õ\ìLcbT\å©\å”q\×\ß5\0|\np9iØ¢TQşM(~}}ª.}qKaO?7ó©ps\Î\Å9g\Ç=j¿˜ß…9$\äñ@\Ùß¿5\"¾\ÉF@?\ì“Ö««J[&€,.7ó‚¸\È\n\Ã#=3@“÷8=ª??t`c\î€½dx\ÇÆš‚tõ\rN\î\r>\Î\İwI<òmHş¿­\0eücøÉ¤|ğ5î¹®]ı’\ÂÁ\İÂ–?3\0\0	$Ÿ@O¿0¿k\ïø*‡ˆ¾0kš¿†´\Ù4-e¸´y\Ó3\Ü\ÃóGµ¾ö\0[¸>a\\¯ü?ö\ÚÕ¿i_\r7Lim|?eøJ\Ì.\ã%²\ÌAµAÁÁ\æ¾`·¾)6\ÆV}\Zów’AQÉ­a¦R—C¢\Óus§´w\Ïc\ÍV\ËHbG.\nr>^ŸR\0\â•\Ü,÷’G \Ù’\Ê#9H\å)<v‚\Ù^N[¼uC«¦ Škk@¼m0ıÜ„\\(9X\ÇXg.I\Ï<-\rj\î¯f•~\Ñ\Ä\ÙØ …*¬\ï\ä\0F6\à`\ä‚zî•ŒM/ê–º†¹©]\éS\ŞÍ¤4òù\æ<\Ïló•Yq‘¹‘—%K¸#šŠmMæ±°k\Ò\nL\Ò}C\ç(‹rÏ¿c.Kşñ\ã$(~€¹ \å\Ù\Ül\Òe‚96d\ÜÉ·s|¡ö\ã ô¿4ñ©\'öE²¥£Is$…|\ÉeQIc#±`Kd`&0A\á7a¸_cP›:ıš8\Ñ\ãu\n\Ùó\nùR!*Fs‚	ùIø†sV`Ö®f\Ñ\ï<ÿ\0%¿´WH\ã€\"\ÄJJ÷&÷bF`ªJŸ\âi\æõ+·mD“ş‘.\ÎYI$7ñ\ÓùUÇ›\Í\ÓõKù\å‰bFÅŸœü\à\ãeqŒœT–\ÚS‚QHc¹™n[F».]Š`0\Î\â\Ã\î²c\ç\'q#g«OÈ¼:Ú®!C˜\Ë\r\çp\Î\Ş0\Ø=8\îZÉµ\Ô\r…Íô\É,\Ûd’’ˆ÷¿\r\ì9ù_nµ úT\È]e(+}ğD`d>qÀ\ÏÍœñŒR\ZĞ¹\×6\Úm\ÄÉºñ”•\Ææ”©Ê¶G»`ıj$¼YR\Ê&İ]¨°ò¼„®O\ç÷zg=ñŠÊ‹\Í]\ZF‹”3(f\0‚0c\Æ\ïN¼z\Ğöf\Ö\äó!#c„-ó6“ƒ\Ç\ÓÚ›zN¯&««Iw{7\Ú\ZCœb\Â8\Ú¨À}	\É\Í};ÿ\0øı·¿\á—<{2jÒ³x#Uqö´3#[\ÜŠ%\î\Éwu$öòg‡\ï\Úƒ\ä‰Dˆ…‹\ÄO@À€0_ğ\â´t­]­¶\r\ÂJÅ‚Hÿ\0!¦\'£§“\ëÒ“WV5†¨ş„´n\ß^Ò¡½¶’)¡¸f‰\Ğñ\"²‚¤{z\Õ\æe~À<kóOş	aûm\\|<\Õ\áøkâ¹¦“HºF\Ô.¥\'\ì¹M¾A=6\ä&Ş˜\İÏ­~’E(š%u\å\\d\Ä{V\\®%\äöõ\ëC>q’>^œô¤¯•Ê¶üŒ6\î1\Ïlu\ç­DNM )\Ë~o,9¦\Ñ[G`ÒŠBp)<ÁLR3m¡#\ÈúûPy\ãÒ£2;n4”\0Š§\â\0Dº¼/üª\åR×¿\äs\ë\ä¿ğA1Vw<‰²ıh©^\ŞM\ç\ä\ï\ëErtnL·W\àô\Â3^¸W|\âòü{\'‰¯B\Æ*\ÖÀ=N\ãŠ\\\â£”6)€ı\Ô\å!ª4^iÀ\ã¥\0I’\Û4g\ÍÆ•Z€\';*G#§5JA”ÿ\0´(<?˜ ^^-»J\ÇA?\×úW\æ\Çü\ßö\á·ñÇ‰“Á\Z\ê\Üh–¦)õ;¸g&9_lƒ\Èe×·L\×\Ñ_ğU\Ú:o€Ÿ³D¿\Ù÷3[jºı\Ø\Ó-\ŞIô‘™\ëÀ\\q\Ï5øù}\â™5»»–Œl7.\\’\ä=zô\ÎO5¤;\Ò\ê\Æ­\0\Ñ\Å$¶²F$\Ü\Üü„À\\’\Ü³‚2x®[S·Á\ï-\İ~tr\É#1dlŸ(\ÜX|Ç¦8\ëO†\é$\ÅÄ¿ºS\åBy,Jrs\Æ@\ÍAw¬#Eq,Qm–\ê\ã\İ	q\Ù9Á\ä`\ã>„b´ZIufXì ‚x\×;\å\Ç?\ëò \Ï\Ş»|Àü£šS•\ï\Å\Ä\ŞC*`Õ€\Î:\î\'=:’zS\î#v6…	d,\Ìë¸˜”]„´ûÀòy\íÒ™\×\îR\Şd‘w\È\àŒœ\r¼(\î:\çê¹‘#¯lU\"¿\Ú\ÒE,\É–\Ê\Ç8|“´\çn~÷>”û8\ä]6V‹\äŠ\Ú\r\Ó\êwŒmS\Ô\înA\É\ä\ÔzE\Ä~Q¾cLÑ±Œ¡P~ñ\àŒc,I\Õ= \éò\Ç0•wq´‚B†#\'¯ºsP\\F\ß][Ë¬G›O&\rÀ¼\"rKg\ÖB¹\'§§J\Õãµ‚t\ÜB°\rû½ı\Ã˜\à\çrGc&ym0ŠBc$£Io7#±\ç8ü1S\ê3‰\åÜ¸1\\\Ä	 ¶AŸÒ‚\Æ\Ü¹\ÒaFd\rk&ÿ\0/!r$\ÚFáŠ³oz¶š\Äx\é°r2F{duÿ\0\ZËuŒE\ç±W\Æ\Ò \Ä/\ÊFyã§¯¶iò\êyq,“Jè°…“ûşnJ®xRFrzp½M\0lY\êò\ëz\nG$#\íjY¤(wd ÀE\0`ô¦O­Mcc6·al‘ba$\nş\ì \à?\Ù\ç¨<Xš<o\"*[³´³.\0\0yŒ\Ì\\g\'$q\ïsV4K\Ól·	4²•\ÂÆ«´a3Ä \í\ß\Ğ\Zw/ø\\Z§‹­\ä’\ÙÅ€•VHü£!eÜ ®.O$ğÀıj¶™(Y\ã.\Â7onûËŒ`\çØ­1õHÍ¯\Ï\Ç\ïƒ n#rò?\0j;\Ëeò\áeP?t®T\äúúš\0\ìc×®[\Äz}Å¼Ó£\ÄÁü\Å»78\î‘\Æ9úùÿ\0\åı \Æÿ\0\Ù\ËK7÷\ßh\×4!ö\r@Hÿ\0½bŒÊ\ÃnôPß~/5É’Ko-„A9ùF[9şŸ}ÿ\0\åı©\à7\Åû+if´\íj\æ++Ü¸XÈ•\Ê$¬1\Î\ÂX\çwC•2WC?e\Í-Cep. V\ïƒ\íS”t¬€(¤\r»¶)IÀéš«;\\»LÛšo—§5ı\Ş\Ô\ã+=@|‡½ŸÂ˜Ni1Š3VÀ\\g½5\Î\r&\Ó\ëM2n\íLuU\ÖX2\çş¹?ş‚j\Ë>½U\Õ\í:\à\Ó\'ÿ\0\ĞM\'+\ã\Íy6\ïõ¿ø\í3Bw}(¬9‹\æGAğyš]Fÿ\0v2¡:}H¯B\ç\×5\çŸX.¥~9\Î\Ô\ç=y5\ß\î¡l@ğ\ÙjZ4\ån)€õm´ğr*:UnhôRn´\0õ\éU<AªÅ¢h÷R\ä\Åm#\ã°§cò÷¯™¿\à¡ÿ\0´\Ú|øQ¨\Úyª\'Ö´\Û\ë{l\ÈW2ª(\ÇÇ˜§¯¥>ÿ\0‚£~Õ©ûDüd60ùŸ\Ù\Ş{›(n\Ü;¶\×brI\ÉB{b¾\\·fIö\çkg¨¨õ]nmKT»¹—/%ô­,²;½‰$I=I¥±™mdÌ˜m½z\Ş:#)½t-Op\Z0‡B½O\éQ¡ûb:Æ›/·¯Ÿn‚³\Şø\ÈÜŒõùq\ÉÏ½$—k]›y\äœg\ß™kUb\ìBñcS»pR?Ç¹°\Äcû§¶9\çÚ§²\Ö|Eı¤“Ki¨¨Ü’\Ä\Å7\İ\Î\á‚AŠ\Ã\âL‡RA\ëı{ş•4J\×dE\æc\î\")=0NGz6O\"õş´ú”¤\ÌG\Ì\Ì7(\Çn\à{v\ïÉ©F´d´…Wj¤g—só\È=1õ¨¬´=OP†E\Î\æq•Y1e@şœ÷¥]\n\é›\ÒpĞ·!b\'<ò;\Z\Ï\ÚG¹²¥>¨EÔ–;\äš5%Wh\Ç==F)º~¦ğió\Æ!²Á‹Û£Ë¯œr}Aö\Å@\Úl–’•6\Ó’ñ‘“z\Ú\Òü56¡§\Ü,eU\åQ²(\Î\ã.Óœœ~i¹¤®?g\'¢F0Š{…WÛ¸œ{ôıh7ò¼®ÀŸ6\Î2@Á\ÇOjô|¿\Ô\å1¿›0²¿2\Ì+m wû½+~÷öOÔµ\ê+{\Ë$\ßó\Ã2*0>n½\r`ñ”Ö›G]«ò9¨b…\Ùq\ä¾W!\Âí¹89Áş]1\n$iûÈƒH\Òo;eİ´…	·\åÛ–\É\É·LŸ\Ä³ö· \Í1{¸’\" \ã \Ï\Õ\Í^ør÷O\Õü™\á(Ãª’‹Àû¹#<g=OÒ¶hK\áfN„\ãñ\"•\Ã\ìŒsò¿\ß\éZW_\Ú:•K;@V2r\0é¾µNFYm›\æß¸/i?w©\'§_\×ÖŸhV\Ê\ÊI72Êª!;\ä#–c®8\ÎkC&˜ß´–ƒn\0\ÎsW4\Ûóhª»Š…\"\\\ã\Ê	üqùU?-\â|<mv\İĞƒÿ\0\êıi\Ñ¹\Çñc<\çùş”ß‘:Ÿ²?ğL\Ï\Û ~\Ğ?m\í5©Ñ¼U\áökmCTJ»—*óĞ¦\Üû©¯¨üÒ§ŸÊ¿ÿ\0a/Š²ü1ı¡ô‡IXZj*l\îU$\Û\æn#8\ç\æù\nı¼²ºö\Ù^6¤A®yhÀ´g\ÇjF›\"™š(»µ€	É¢‚qLf\æ\'Jm\Í&\áM6¶i¾e#74•ª95 »¬¦ÿ\0®Oÿ\0 š˜œT7L\r¼¿\î\äjf€ñ\ÉD‘†zt¢¬\Ë‰[,3“ÚŠ\ç_\àó–\Ô/OO•?Mz	’¼ó\á×¨\ßü¸\Ê\'ó5\èŒšµ°X˜t¥¦p:SÈ¦•¹§‘QÓ•‰4\0\áÖŸº™E\09\Ï\ËÁÁ\ì}+óOş{¢\İ\Í6ƒ¨GÆŸ`²­\Æ\Öb‘K#§8\è\0{\ã«ô¥†\áøƒ_ÁUô‹I¼«\éWK\Ø\Ç%”ò?\îc¹\ÙúTŸ““Á\Ü\éLi+“b\áI a±ó\r\ß\çú\Ó/®\Ô^·–Y¢\É\0°\ÚX}?Î®^\è\ÒZJ\êê€†e.vò>•›ulVt:zv­Œa¸\ã!¹¶|¤cv	ú{Õ«:\ç[œ¢G$Ÿ˜…<}qT¢´38Ùü€s\ï_Nüø#kƒ­¯\îÌ¹\Ô-\Ó,„\ä\\ñ\é\\ØŒDiF\ìô0¸WZ\\¨ó/‡?³\ï‹`·œ\\D\Ë>\à¦[…à³¶>AwŒf¾ŒøSû\éz.É®á·ša\×‘œ	\æ½SÀ_F‘§ùl>s\Æ\ÑĞ‘·\è:^‚–ğÏ’s\ÆM|ı|mIû·\ĞúL>•-R\Ôò\è>\0\è¾|q;uf|²}:ô­Áğ;C\ØV-2\Î/—[\×\'­v\Ğ\é¢go,¨\Ãr£UÁo#\åDq\ãO\ï°?•q^W½\ÎøÁ-‘\â~\"ı“¼?«\î‰t\ës$‡#\ä`\êA\â¥ğÿ\0\ì\á\ïA\ZCkÉ\Ò\î\ßÓƒõ\í6~¾òWvrWĞZĞOE‹f\0À\È\Åj§+Z\æsPOmO>\Ò>i: Q…¬2Œdó\ëZrxF\Ô.\ÓH„`³ù\×Wq¦ˆF\ïP*‘ˆ«`ø¶+÷*3º\Ø\äu\ï‡Vº­±\à‚]\Ã`\ß+:ŒW™x»ör°»ñ\×2XÀ\åe\È\Ü\0Œ`ó^ö‰–\Î9\ì3Ö ŸNóW\ç\\Œô\Í8·˜š‹\İ\rüSıš†‡\á±slö”™„\íBGÍŸN½«\Æüi¡O\áMb\ãM¼F2[¾Cùx2($t¯\Ğß‰_\âÕ´›˜Stbt\ÆòG+œŒñ_~\ĞÚ¯öf·’R\æ\Ø\åFw2±“\ê}8¯s.\Ä\Êr\äg‹™ai\Æ<ñZcwqö‹®¬@]\Ìx §ù¦ÛyÁ\Ãnıi—6-— €F\î™\î}óª\è\å8\ç\Ó5\í>õ74K¡j“Ù·Ù®¬\Ü¸RA2\r\Ì\ç¡\Î\İ\é\Í~\âş\Ã\ß?\átş\ÏzN¾¬û®2%w\Ã\0ŒşUøSü°J>\Îp\Íò’0N}+õ\ßş\ç\â[[ösº´¸˜\ì\ë\ï%!\È&ò\×\0\à\àúık*½\Ä}}\æcŞº£4µ +6i(¢€\Z\Í\Å6Š(\0¤\İC6\r2µŠ[€®\Ù5Ëº\'÷Sü>™3m¿\İ?\Èÿ\0L÷\Ğ!¸Œı¡ø?x\ÑD\ì|÷\çøj+\06>\'•ª\ßw;ö\ä× n\Çzó¿ƒÒ³\ëÛ»ªÿ\03^‡˜qV¶¸\å~y5 \ËrJˆz\n)`9xj‚7\ÙÚ¥IC\ë@nš`\æ€q@g\â·¶£\ë³‡ˆ\ßWH¦‚\Ö\Û\Íò\Ø/˜ì®¥v3d+dzô¯h-\Å|£ÿ\0_ñ\ä~ı›µhE\ß\Ù\æšH\Õ6<\ìH:PRi‘,ŸûG\Äz”‰¤BO\İ\í\0m\Îpgñ\Åco¶’w \äüÅ€}M[\Õ5=‚V\ãtÌ²±S÷_Î²­\ïR9°UŒ|‚§¡Ò¢\íb\r\ÊmJ%v\ÌjWsüÿ\0Jû‹\àF!ğ¦‡…Oœ±\\\ã2ª•q\ï¸W\Å\r4\Õ\Õ<]ek\"gÏ•F\âxPs“úW\è7Â.-Cµh\Õ	h\ã\ï®k\ÄÍ›ID÷òho3\Ñt{±É½¾bA<úœõ\ê\åÌ\'°‹<g5Zƒ…\ä=*uu‘_=z`\Õ\á3\İ\í*¯Ê€v{\ë\ïZV\'ny\á‡\åYñ•ó@õâ´ µ c®zR\Ô/­®Z·Ùº™ö•9<{\Z‰\ãhú\â‘\Ãc¿\åZ	¨²Áº2ùš¡©ƒú\Ò\å\İ\É\ÏÇ©¨®È¼\r\ŞÙ©aÕœƒ\Ã\0{|µ#O+ Va\È\êJ§$6\\q\Ç5<r#p\ãÔš\Ê74vw™nşµùõûSx\ëHøÁ¯]Y\Ä.-\î<‚23\Ü\Ä\åA\Ïaù\×\è,÷*N8\Æ9\æ¾ı¶tKÿ\0ü[¾\Ô`wk]EX\Ø¬ª\ì\ÜtÁük\ÕË¤•K3\Í\Ìb\İ-:‘¹IÀ›\Û$\Âû\n… \Ü7`ôÀ<\Ôh\ß>\àF“ş5$¿˜¿&JƒŒtÇ§S_Lô\Ğù2m6Õ®%\0\â¡\ä`£23\ï_ª\ßğK[ù¤ğº\Ù\Ë{uk`†\Ş\Ò\ŞX­®Š\ÆM#°Ã¹\ìsL\ç5ùH&òQ27m\è½Àç§·ZıTÿ\0‚Xx|\'ûf“·E¸ğõ\ÜV\Z½Š…‘u1\å†K\ØƒœŒ˜°	æ°¨µ¹i¦}Â€F€z¾´ æ¡·“Í·FõPy\ëø\ÓóŠD½\Å\'šM\ÔRg	\Å#79È¦\Ğœ\ÓZP‚—8¨e}\Ç\0VŠVB»\×?/¨¥“|g\éF=…dcje+¡G¨6\Ûùñ\Ó\Ìl~tTz£2\êw\0+J\Ã u\ä\ÑX¹ğ’&]nópÀò”|\Zô$}şµ\çÿ\0	\ï…Ö·v;,?–Mw\Ñ6\ÜÕ­†÷$ü\èü\é¾hõı(\ßô¦!ß\np{ÑŸqF}\Å\0=f\æŸ\æ\àıjûŠ	\Ïq@	\ë_ÿ\0ÁktYO\ìóaylHµ%óAÿ\0k…ık\í5ny<W\Ê?ğY8’\Ø\ËWù¾d¹¶uòVU9\àö\ëL\Ç}DùQmf\Ü~QŸÂ¨[\'Ç§wÖqw\æF£h\Ïs\ëU\Ëù\\z\×E\Ø÷Á\0\ÒxûJ†?˜Ü¸ŒñÛ­~„xıD·L7\î¢P£</>µñ\ì7\á9|KñNk\ß#}¾\ß#„b=+ëŸˆ_ôß„\Ş7d\Ë8+`–o—¾:t¯Ì¯*¼§\Ñ\åMF1\è—^ ‡Mƒ|\î#Q’FO\ëP[x’-E·\Ç:mng$\×Æ6ı£µ¯Ü´³ùºlA±¸s\æ\Èvƒœœõ\ç\çÚ³\í¼#ñs\ã@Xôû;\íKA€«x-\Ùñ\Ï\ÌKaÏ°\ãÚ±†¬\Ù\Õ,kû(û…~!\év÷±CöøòŒA\ïùWK¦x’	\ÎCy™^«Ú¿>®ÿ\0bÏˆ>¶7H—S\Ü2–uy”¶2>\ë\ïZÿ\0Ä<*b\Õmş\È\å^\ÚY,¸\È\ÚNv\àö#¥kR…(«©\\ÎJ’~ôO\Ğkˆ/¾n£¡Á\éROl.{Æ¼‡\á7\îZ\Î8\æ{‰1\Êò|À\çO_Ê½5u_´Â’3\Æ®U\Ëc¥¦·5\ÒI\éŞ¨\Ë$*\ä\ÏP=k‡ø«ñwş]:MIwq±¼˜„›<\Ç!s‚98ü\ëæŒ´ÿ\0µ6+mOhf™L…\íC¹€G\Ş\ã,p:v5p¡w¹2›Šº>¹½\Ô\à‘\Ø,­”\ê\n¿•F·\ê\Ğ\î,1Ğ“œ\nø\n†Ÿõ©\í\ç:—ˆ¼Ùœ\Í.ofCG\ÃsŸOnµ¯¿\âŸÃ‹·2\ëº\ĞWE\Z‹\É$J?º¡y\ÔÖ’Á§ğ\É\ë$õ‰ö\í\Õ\Ö\Ü\àdc·zó?ÿ\0l~6xQtù\Ø\Çs	m\çCµ¢~~\\ÿ\0p\ç¦Zğÿ\0ş\Ù\Ş*ğe\Âÿ\0lé‹«Xgdl\n©ş/\âÏ§c^\éğÿ\0\ã&“ñ9#“L[ò®»ˆ’\ÒP€Š\0z\×=L<\è\ÉL\ë\"X¸3ó÷\\\Òn¼9¨\Ía{…\ÚG‹\0‚+aÇ¸ªˆ\Û3óx&½£ö\Ùğu—†~*ıª5t]B<‚8–;»g¦+Ä‹ùò••ô\Øzœô\ÔûŸ-^—$\Ú,Ùµ2ƒ\Îs\Ôv\Å~ÿ\0Á\æ…\åø‰n%Y3(q\'şCğ¯\Íäœ¶Bğ@\Ïú™ÿ\0Uø#ÿ\0w\Â\İG\Ås¤‘j:õÉ„\êP\Û$h\Ñ\åBr\n¹œÚŸuªí¥¦«qJN+0\ÔZcõ¥fâ›œ\Ğ ¦Jÿ\0)¦³mnOZc>OZ`(“şªo\çF}\Å÷¢€÷…ñ\ßô©”l€ò]DgPŸŸùh\ßÎŠf­nÿ\0Ú—8-5±Ï¹¢°W\á\ZüAy·¼#?zyÿ\0Â¡·^¹\íû1]ú¶êµ°=Å¥_¼>´”S`s\éFy\íP\äŠUm­š\0›Â°N¢‘p\ïC¦ÿ\0_Ê€×°¯#ı¸>\Ëñ¯ölñ^‰kl·ZŒúe\ÇØ©9ŸaÙŒwÈ¯[½Sñ¹m\á­\îş\íŠ[\Ù\Ä\Ó\ÈŞŠ£&µ*1¹ü\çkzTºV¯qg*§´‘\á™Uu;X~\Z\Íl3rÇC_B~\ß\Zƒ®|k×¼O\á{k\ëM;Y\Ô&X\ç\0¯˜\Ç,\é\×›sc=ø\ÇJùú\î	]’W÷²\0ªw&®hNPf\Õ(NŒ\Ô*+h~\Ã?\Û\Â\ß\n\Úõ\ãıö±7Ú‰\Ç!6 U\ç\ê\Çñ®\ï\Æ	n~&kª÷j°Z[¶R1É”ô\É\ã\Ûõ®›áŸ‡#ğ\ç‚t›ùV\Î\Ö4#\Ü\"Š\ÜÔµ¨ô;C!\Ï\nz\nùj\Õ[¨\æ\Ùõ8zj4\Ôbq¾\Zø\r\á\Ï^Ë2\Î\âü/\Ê\å²ÿ\0*\ê—\âO…¼2¥Î±¥iˆ8!®\0`\İf¾gø\ëñS\ÇüGı¢Zµ–)R÷;±ğ	<şşu\Êü]ı“-|A£\Ø\İøB\çQ\Õ\ï&‹Ë¼K\éQgiÕ‹\ï\ç	·`…?‡Zt\è9»Ô†µjÊœ}\Ø]Ÿb\Åñ\ß\Ã\Ú\å\ÚÅ§\ëúe\ïğI\Ç=N1Zw\Zu½iöˆ£<\ïœúÿ\0Ÿzù+\à\ìq­Yü@·\Ö|{¡%İ„He··¼G’fxY#ó0\Ä\Æ+\ß~\èZ—‚üa¢\Øj‰\á\Ë\Öö«3\Ç3Y“\ÈË«¦I\å—=Hâ¢½\Ã\à•\Ë\ÃI\Î>ôlt\ÚN’±^)P[…\0`]¾`\Ò\Ùy‡syc#«˜X~\Ê\Ç¯Á+¯\Òõ?ø“Ê»s;\Ö0“‰µJi£Ï¼}¡&»¨y’ª¿–:HN\ã·\áúV~‹ğò\ÇM³Y<¨¡/”`şz\×C«\ÈfÔH+“\Ô\Õ\Ìüf\Ô\r¿i£\Å~l XÄ·7‰	‘\àRFR\ì@©\0Vq“›\Ô\Ò	%±\Óh\Z¾—©io\È™”g·z\Ğ\×ô\í;_´O´Ai{¶C²©>Ş8¯†¿i†:‡‡>!½\æ•}¬\ëºiŠefbˆ\ÙÊ°*\0u Gz\èe\ZÏ¼+¨\ë\×:î·¡[\év\ì4û˜¤@%¸.\ì2…rÈ \İ2z\Zô£‚²º’û\Ï6¦*ó²†‡Ñº÷\ìı¡\ê\áŠ[Át;Sù\0qV¼\à4ğ×•o\ZFŠ¤)D\0ã‚¼c\á/\í_\â=7\Æ\Ãş-Šö€¾\Û\ËHğz‚9¨¯£4\íj-Z\äCÃ€À\ã\ÔVœ¾2šº¼Qò\Çüg\ÂN§\Ãú\Èdb[Y€uR„ŸÄÂ¾^Œ\í\Ïrzc¯Ò¿C?i¿	E\ãß„ºÅœ»ˆH\Zhöœ\Éó\å_Ÿ:u´ïª­ŒQ<—(Œ Ág9\Ç\ç^\æ]8û;v<Â›SO¸û`-\È\Üq¹€8=³ú:ıºÿ\0‚mx>\ëÁ¿²_…moQ¯i\Ìd.\ÂRH‘\×#Ÿ˜Œ\×\æ7€?fmK³µG¨\Üj>jLğXÉ&<\ä\å\ÊN\Ñ\Û\ÔW\ì¿Ã>\ËMğN“œ–1YÂ¶\êÿ\0xF#A÷\Æ+xb!Q\Ú\'6\'R„b\ê-\Í\Ú\\“IšBG­tò\èr\nx¦;\àõ¦\ÈNs”\ÆmÇ½\n=ÀN´mö£ó¦³m\ÓZ\0\ì{\nM\ÃıŸÎ™\ç{~´\Ê4Wl/¨üÁŞ’‘—q¨•¯¨c¬\\Õ®†:L\ãõ4U}lí›¾?\å³ÿ\0\èFŠ\ç_\ál¼Asƒÿ\0,¨®ó8¯6øB?\Şmf\æ\Ğr+\Ò7QV¶)®¢\î§+qL\Îii’IE3q§‘@DûW¯\éNóG¯\éQQ@†\Ïq^mûW\ê¿`ø#­&yº‰`\Æ~ğf\0Ê½!xAÓ¥y‡\íg£Í¬|\'¹òT°Ğ¸Q“´°ş\'øN\ÇV	E×‚–\×?;ÿ\0i¯O\áeüpG\æ-®A1®mû\Ù\ÏÁú\×Å\Ó\ä\ÇZu­Ò•uº8oc_£:ŞŒ5yã¶”G$s[˜d†w`m9\ç­|qñ«\áÁø_û@i\ãÎ²¸^)<½œ\ä‚¶\áİy™ekE\Òg\Ô\çX^w\Zİ·t@%µŒ\â\0gÖµÿ\0±\æ2oS\× U:\ÜÙ²)2~õ\Òiğ\ïˆtÁ\Ç\æMj][c\Ôş\Ù\İ\ÊdX•$öQ\Íş\nXH<¶1£¥wñÙ†?0÷*Ù§÷û\â’\Ğ\é\ç\îy\íÇ…\Z\â|•ƒÁ\Ï5³¥Y¶—\Ô\Ê\à`cµtwV\é8!cÀñÖ³®“\Ë\ã\ë7vZ(\Åh<¿›{Š\Ù\Ñ\Ó6¸Ş¹û­Q\Z\ìG$(ù½\ëf\Â\ï\ìÖ¼Œ–\è}*yYf6±jF§\'\\\ãËš|\Ò\Éwc \'t®0\Äò\ÄœşU‰®Z)Ä‡*œûU\ïˆ\ï\Ì9õ\íB‹N\àr²Á~’²É½Õ‰\'q\ÎzŠ	A|©\ç@]Bœ\ØO¥w\çLŒKŠTö\ÅK6™D6ª‚JÛ˜É»\r¿\Ã[K›…†Ú¹\0\é\Ío\Øh‘\é\í…v(\ì+y,<•\íùS\'Q2piy‘)$?\Ç:Cj~¿…?\Ö<D®ˆqø\ã|iğ\ÇBº\Ñ?jü˜\âO³_¬R\Æc%U$p§A’+\í\ÏÎ­cp\0\Ï\Èxò\ÏÁı9µ\ïÚŸS\Û#7\rsrI\Èò£t%~¬p\Ğ×£†“9Xó\ç:‘õ=\Â\ß\Ã&\é\'“o˜\Í1C\'s\Óô•~xx,\Z%ª”,H\0ôE|+ğ»Á÷3ñ<Z\\÷“\\³n \ã\0s\Ç\Ó5÷„y0*Â€+§,ƒm³!šjœz’ù€÷¤w\ãƒM\Æ;\n7è¿{gÌ†\ïz3\î(Ç°¤\'”\0¹÷\Ù\Èiwö:\ä\ÎF?J:\\\ÑIœSD˜÷©¶·\Ù\æ‚qM-“šBsS>\ày~¹m^\×w\ïşÑ¢®k0gWºùOú\çÿ\0Ğ©[\á\Z“\â;–õ‡úŠôZó¿„-\"ø–\è66}ŸŒö…z%Z\ØO`ƒÖ¤Iº\nˆÔˆW9¦fK@84€æ–€&QÓ•¨\Ù5K\Ä:%\ÑnlnWÌ‚\ê&‰—8\È#×µ\\\ršeN:\Ñ\Ò\İ\ÇÓº>ø­\à\é~üC½´}Û­fùw\r¡£8eaõ\\~µó/\í½\á‹x\åƒSwò\Ş\Îò	¢fÂ‘˜\ç?…~“~\Ö_\â?…Æ¡amCNWw]\Øób\ÆX¼Lú\×Àôañ#Á7ZÜ‰ÉŒI\r\ÆÌŸ—\æQ\Óx\äW\ÎÕ£*ıİµ\Ã\â\ã‰\ÂY\îi¶¹[E&\ìùƒw\ç\ÍmX]”TÀü4\×·şø~øñö­>HÁNÑ»õ\Íu–’™|²¬N<\ÖU’R1\Ã\Ş\×:x\îL«úTğ9\Æ3Y¶\×<\àv«°Ü¢Œ¶\n\È\ì4\×*xô?Z\åüw|\Ú,#b–yN\Ä¹5Ù¤Èyñõ5\Çx\Ú\åañeªIÂ˜\\¯¹\Êæ¥­4Tm\Ø\Åğ¾”\è\Şm\ÎK‚®\ãAğ»k0†5	\Ë:Wüsı¦|%ğA­m5@\Û_]\âHaKw•™y;GƒŞº|^·\Õ4h®\ì\çK¨n#•;v‘\ï\ÎqI&—¼t-]‘\Ò\ëšRyr!\Û\'Q\ëX\ŞIt»Ï±¾ÿ\0.BYY»{f¼\ï\â\'\íy\á_†^&Š\Ï[ÔÙ¥=V\Ù\äô\åŠğ5\é~#³¾Ñ¢»·e€\í–)S€ş\ãó5|¤\ÎVG^–»‡JI uf\Ê\à\\BŒ:ı*¾£.ØÖ•‘\Í\ÎÛ³)\Ë9<ô\æ³\ç¾\ÆTôúÔ·\×=H\ãV\\\Ò\ã;¹\ç½1\Ô*k2§“#\áR*ğo\Ù/C3üFñŸ‰f\r™®æ³…6\ãhİ–9üò¯o\Ö\åX´«§Bç™\Úk\Ë>\n\Ù^\êfk[8Ê½Ôœª\àff/·\n}\Éş/\å]wq§hõ9©[\Ú\Ş[#\ë_Ø‹ÁR^\ëwº\ÔË¸[#[¡+\ÒGÁ$÷xüké¼‘\ßô®3\àŸ\Ã\Åø]\àKm7!®˜™\îz4\×ß P>†º\í\ç\Ô×¹‚¤\é\ÓQg\ÍcñÚ³™6s\×&£ó½¿Znó\êi+´\ã³\Ü\íú\Ó]·\ZBqI¸Ri	À£p¦“FÀ+šJ(<\nMö\0¢˜%\Üø\íD¯\ïY»½À\à5‰öµ\×?ò\Ùÿ\0™¢Ÿ«¦uk?\å³ÿ\03EefjPøI6ÿ\0]t\â~¢½}y\Ç\Â?—\Ä×Ÿõ\ÇúŠôUm\ÕKa=‡‡É¥\Îi”ƒLÌ|¾´õ›™N\"€%iÁ³PR†+@ƒƒK¾¡ûF\Õ\éú\Ó\ÖL\Ğ!ù\×Ó\ï\Çùük\äÿ\0³6±c\â½N\ãK\Ğ$¿\Ó\î\\\É–¢=\Êªl$‚O·Jú¾‘†\áş5J*j\Ì\ë\Ãb\êPwù\Ù\àoj~ğü\Z.³a6™}¥\î·kyq•]\Ç`‘½\ë£\Ó\Ü+ü¾\Õí¿¶Ÿƒ\È:>µQ,hd·ºe\\3g	 sóÖ¼6\Ê_-k\Å\Å\ÒpsY\Î<\ìİ·}¯Ÿ^õn°\ë\ÆEe\ÃwŸ ÷¥kÒ²\ä•FI\Íp=\Ï^*\ê\çQa©o…Ü¶P¾µ\Êü@\ĞÏ‰`E˜\Ã<J•şG\Ø÷«\ÚB~+?û~mJV\Şóò\ç\Ó\ëCer¥©\ÌG\àq<³h\Ø\éw²J™¤¶óqŒ`¶Oo\Ô\Öõ¿\Â;3o\æ[\Ï5˜`	OJÛ6R wglU\ËO+«$7–¯\ác‚1\éM>Œ\Ó\ß\ès\Ş\"ğ>Ÿ†\ÚM:\ÃRH¾m·,Š[H#ÿ\0\Z‹Fğ”¢\âò\ì\ìl\â9Xm××ŒtŸJ\×Õµx.‹n¿¶2zg\0ûXµ\İj\ÊOğ’rñ¥;½­.\Î\×M½6ÖYöË›­\Äg§©®[Iñ<†ñ-¦ù]»\çƒZ\Ó\Şo\à*µ[œ\Í\\šô‚G|÷‘+ml¶vÕ‰/\Ã\ßNI|\Ä=OÖª;‘Q«X\ËñDm{\áû\È\Ö?4\ÉUP@\ÜOõ¯@ıÿ\0gK¥h·ú¶\Ú=¼©~®\îó\á\Â\í {úb©üğ­¿ş)iz}\Ìmf¸¸Lœ0ŒnP}‹WØ–p\éöQAo\ZCJ#Q€€v\ía()\Ú]\Å\â\ç	rA\îYQ´u4¹¦ù”…ò+\Ø\éc\Éº›\æûSKA8 È¤¦ùƒÖ‘›\'\ïb€EDÍ÷³Oi\"÷$sI«€4¡M5\æ\Êñô¨\ÉÉ¢’ˆh&ŠGo—@qZ³\ãU¹ÿ\0®­ü\Í>£l²j·¬ŒZ+S\á/$»÷‡\ÌW¡g\ç?\æ\ß\â;¯h¨¯E\Ş*V\Â{ºœ­\Å3u(ni™’Qšnò)CPÕ©\ÕlSƒ\æ€GZh~y¥\Ü(H¤\Ær~õ(9[u8gŞ€9/ü,Ö­#Íœ[4Ğ¨<™\æQø‘_E!Bmu;YH\èGW\Şm’§\Üb¾Cı¨>7ÃŸKzƒ\Zv±+\ÏÛ…CË¦~§#\ÛÖ¸1ô\ïe\Ğõ2ê¼²\å}NYn†Áş\×\r,¤‘õ¬¿\íPLg¥K©/\\şµó\İO©¤\îK¨ß•UF+\ä‰ö®{\Ä\ß\áğ\äMm•\æpOD§5­z<\È\Ã&q·\çÁ¬M_\ÃöWv«$–VóHv\é\"ˆ÷È¤šgT\"›\Ô\åtÿ\0ˆ\Ğx–\ŞGûK\Ş\Ü\ç\"”cŒt­H¼mo<\æ\Êı¶’ Gm\Ê@Ö¾™¬­Šš(D+ÀM™\ØZ2x»G‰B¼Ãó˜ü\Åh¬w/f•š9x¼B5+iz]\ì‘qµv\í#=zµg\Şø\Îoß§’òÚ¬œ§BO^Wõ¯A‡\Æz|\Ö\ám\r»ñ’O\'ğ\â³\îK\ëH!3uP¼}ıt]Uå¶„\ÚO‰·\áŠO/Ë”\à\î\ÛÁ®¢\Şr\Ñ\ä’=;\ÖZi\ê\é\İ<²Q—\Û\éW¨ÃŒû\Ö|\Èóš-Hû—=³QO&G\rÇ¥Q}P3pWóª\×:¶\ÅÀ‹|ª%˜ğ\0ú’mO]:\îÇ¿~ÅmCYÕš=\ÛJZ\Âù\èÁYŸôe…}ƒj\×ğ/À#\á·\Ã\Ë;•s\"‰\îA\Çú\ÖU\İ\Ó\Ü\Z\ì7W\ÕaiªpHù,Dùª6M#\ì\Ï?Ú™œ\Òfº.I\æ\ê)²)›¨\Ş(´Roo\0Š7\nil\ÒP÷\n7\ne&\á@f\æ“9¤\Ü)ğh\ép0o#\İw/\ïŸ\çEM2+p\İM‰©\Ç|%ˆ/H\äù#ùŠô%pÃ­yŸÁ\Ö\'Ä·™=a\Ç×‘^‘·\éùT­…\"Z\ÅDK\Å=[+\Í32O0ıiÀ\äTY¥\É%(b´\Ån)A\Í\0HE-Gš7P”¡\È\ïQn§\â€\æZò¯\ÛD‡Uø+;\Â\ZM=…\Ò6Ü•\ÆAúšõ=Â¹oz`Ö¾øßƒ\æi·\0\ë\å±¨©”SLÖ“jhø&\×U\İ.õ\Ï9©\Òoô A%zZ\æõ\Ó%¦\àG#Ÿ~•_Añ²\ÜK²Vh\İz‚+\å\å}²¡+hz]¢	\"\İ\×Ò–X3´œõö¬\ÍVóaÛ¾Õ»aó¯<ık›S±=J’iqH¿\ê=rFj¼¿b\ÔX´¶ñŸ¨\ë]-’ S¸/^x«\Ì\åG–\ê­\ÜWs’·ğT:4Ÿ¹·Q\×Š¿Ÿ\å b˜5±\Ó4øqÁ\ëN¸…\0\Îs\Ïö›–\æt1ÿ\0£²lUh‹hzõ\Ç\áWo¯R\Ø\î\Èùy\é\\ŠüY±¾÷\ç*mµj„±8\ë‘W>jRñ¦›<›L÷‘Œ8œuö\æ¼\ÖûÅ²\ë—\ßf„Ÿ\ÄÀsj\ëü>\Ïar&wÅ´‚<¥vQ²g*:3ôz#…\çŠ™P\ÛN³Û£Œ ñO\Ü+\ëcª¹ñQ\ì?Ì¦“šMÂš[š¢õEGº\Ô’Šu¨\Şe8ŠŒ\ĞÙ°i”g4€\æ€Š	\Å&\áK\ÈLJO={\ÑMt\ËO_Z+S\Íşø¨®\È\ïşb½6\ß\ØW›ü\"|ø†\ìzC\×ñ\è™\"¥l\'±6y\è?:B™=ÿ\0:[kf\ç{~´\ÌÇ§\îCOnn†¡ó½¿ZU—stıh}ÀÒ«\â¢ü\é^	…\0X\Ü}(\ŞsQy§\ÔÓ‘÷M\0I¸Qº™š(û…T×­şÛ£]E‚\Şl.„ªGõ«¤vùHõ\ëLqÑ¦~jjğ™\"wm zW\â\İ\Z_¾Ëƒ\Ôu¯P\Õm>Í©\\\ÂÃ˜¦’2=0Æ±õmgˆ\á3šøú“\å“G\İa¢œ;Á\ä\Ño-Ev&\à˜b\0\é\Íz¾\ãk]N\İL3\Æ\ê\à\Ã<ó^C\â_¤ŠNŞ€\ã\å¬+-OSğ„¹·C1°ôÿ\0\ëT\ÆI«£¢\Ç\Òj\ÂE)÷{\r>\Ó\ÄxqO—Ÿ½\Ô×‚Z|{º\Óÿ\0\×C\"¿F%ø?Yÿ\0†·»\ì1w\Æj\ì=\Ğ\ëff\ë\É\çƒDúø†\Ü\îº{W„\ÉûG[4˜;±~™óªÚ‡\ÇY/ÁK+k†f\é¸ği=Ç¦x\Ó\â,\ZU“nš\"\Ì}+\Í/u{\ß]m]ñÃ»w\Ê>ıg\Ûi×¾\"¼In¤f\\œ¯$\×i\áı+D@£{\â•\ì.xcD[XÀÙ´ø®\ÇMµ\"¹©>\ãÖ³4»óÒ¶†%üªT\îMX¦µ>\êøS\âñ\'\Ã\İ\"\ìù–P—À?+lt;\Æ~5ù‡ñƒ\âÿ\0ÆŸ‡ö\Ğ\ê_<]pš]„c\ÎĞŒQ\Î\ÌG\Æğ@\åI\ãu­/\Ù3şC¬\İx\ê\ÛÃ¿´\Øc\âd³}A-›MrÊ»\ç‹\0\Ær\çø}ó_[†­A%¹ğ¸œ<\éM\İh~•\îÖ·UK]Rûhæ·™.`™CE,l$g ©|\Ş+°\ã\æ\ìI¼ŠU|š‹Í¥Ph¶$/\Í‰¨„¹£\Í>ô—q›\ê?4û\Ñ\æûP»‰¤-G\æŸzF‘ˆ\ëúP¥‰”\Ø\Û\å\å¿Jvh|\Ìÿ\0	ü¨¦ª6\Ñó”V&§•|”·‰/8\ã\Èş¢½uy¿Á¼¯ˆ\ï2\Üy\Ç\â+\Ò3š•°\ÃÕ³KQƒƒK¾™˜ú\Å3\Ì\Åoµ\0I¼úš7ŸSLdÓ‡4\0\ä|7&Ÿ\æ\Ü~U(\'(”ÿ\0¥\à¨\Ïj«y}Ÿi,ó\Ë0À¥\äw`ª€u$“À¯…¿n\Ïø+Şğ\é\î<1ğ\Ñ\ìõg\n’\êû\Ø\ÛZ’U\0\Æ÷À†À\ÉôªJû•f}uñ»ö‘ğ‡\ìÿ\0¢›\ßj±Ø,¼P*—\ã0Š;ä¸õğŸÆ¿ø*/Œ¿i¯O\àÏ…8ğÖ‹N±¬O›ÁlF\Ğ\"\å•]ƒ209¯Ï¿\Z|Z\Ö|s«=æ«ª\ßj·“i.n§2I+1\É9\É\ã9\àzšúsöAğ\Ô\Z_Á\ÛmMyú¼³M+\ã\æ;%uAøP+ŸW\ØQ\æ]N\ÜWª¢úÙ¥Èc³\Â\0»\ÎXñÔš\Óx<\Õ\Êş•\Îxj\ë\Ì<ãƒ{WO\Ú1\Æ=k\ãªË™\Üû8G–*&»¢faó(9=+’½\Ó\ÄH9\ã\é^™¦¨³Búõ®[X\ÒJ?<ñ\ÇZ\"œQ¢8´ğ¼7Œw Ú¯Z|%Ó®m\Ç\îùa\rk=¯–q´\çú\ÖÏ†.„wh¥¶`úu­T´(\ã ø#a¥¾ûkpÄ’X³j\ì>·\Ó\âÏ”¡‰\Æ\ÑÈ¯LÔ‘$·\Üvæ¹©\í\Ä÷ƒ ¤\Ù,Ä°±6v’3Ÿ¥ni\ÖÛœ|¼T0\Û\Èòˆpö­­.È¶~fö\íRI{N¶Øœ\Ô÷\É\ä\Û\îÀ\àúV…­°Š\0O\'\Ô\Ö~»(U>™§r¦¼ Ü¶I9\ã\ë^YûY|ƒÆ¾“Ä–¬z\îO\æƒ<J2\ÈŞ¼cøúW¤Z÷Ù­ˆ7ğ\èŸ\nõ\ëÛ²¾M®›;}|¦\0®Jº8‰ª‘p9ñ\á85#ä¿ƒ_¶¾\Ù$>ñ6£§Ú¨ ÀoİŒ•gÛµ}\ÙûÁ\\tÏˆf\ÇÃŸ¥ƒMñ\Ì\Ëmm¨[@E\æTm-\Îcrx?.\Ş{\nüŸ\Í\ær3\rh\éú—\Ùn\Ã|²!Q½sòF\n‘_p|?)ı\Åz—P¬‘É½CSAcÚ¦•²¿~*ş\Ë\ßğQOş\Í(,´ıB={D\0\ÓuYd+l7V#¸`s\Ç÷7À¿ø,?€ş \ÛÆ¾(·¸ğ¥\Æ¼˜{«e\Çûj¼g¾”¹r³\ì$|7^)şhõı+ŸğG\Ä}\âN¡ \ê\Ú~­g*‚³Z\\,\ÈruÆ¶\Ç4Ó¸¶%óG¯\éGŸ\Ïõ\ÅEŠ3\Í\0N­¸qü©’I‘Á¦+\í©(\Ñ\äµK¸¯J‰\äƒõ§ù€u\æ¢{\0\è\íÁA\Ïj*D\\ \ëÒŠƒS\É~¶|Iw\ïõ\é\n\ÛkÌ¾3\İn9>FOıô+\ÒÁÈ©[\nCü\Ê<\Êm\Ì\Çy”É¦Ñš\0’Œ\Ô{«/\Æ^8Ò¾ø~}SZ\Ôm4\Í>\İK¼÷3,H¸õb2x<wªQl\r7–\ÅyŸ\í#û[x3ö`ğm\î©\âR\İ\îmai\"Ó¡™\r\Õ\Ó€ˆ„ƒ\É\ãœw¯†m/ø,N£\âh/4†‹.‡`,šıÒ¡\à`–X¡*p3üD\çƒ\Å|\r\â\İx“Rû^¡qusq1i™ç¼—RLŒ:/®«öl¢ÿ\0l?ø*iš\Ú\ËS»ğg…÷Nµœ5\Å\Â\æ¸ÁŒü¹#Ÿjùj\ï\\÷\È\îÄ´ò·\Î\Ã\Ør\ÔVU\í\Ë\Ë1%\É\Ü\Äõ§F>Aô«ŒBUWA\Æbö¯¯¿a?ü3»\Ò\ÃI¢Ë¹T·;%fnÇÆ¾<.Pÿ\0?j\ïÿ\0f_‹oğ—â¥ó,ge·¼\ä©f\áŒ\×a‡uiYt;2\Ü_²¯\Ìözr\é¬Öº¤‘v\'9\ØZÍˆ½rú„a.c¹\ÖH\äPDˆAV\È\ìG}+sN¹ó\"\Ç^=k\âe¾§\Ü#n\Şe™1TµK$º\\?*‚\ŞFI©§fù~`x9QmŒÊ“EX\Üq\æ¸\Æ)n|1º\İ\Ê!n€ÿ\0Nõbñ\ß>\áZix’Ã‡g j¤0-¬¯\âO.G,¾¹<\n¶4Ö7/\ÎOz\Òxbp;‚\İh–\é-\ã\ã=ª…rµ• ¿Ë1\ëZšr\ß\å\à•›\r\ÏÚ¥\ãô\ïZª|¨³\Ç° ‹—Z\àCjrs\\\æ±zdr3\ïV\ïn^lªœ\nÌ?=\é;\ÛB/¨\ßYù÷¿\Í\Ï\æ?ğP‰kà¿„–z%³ÿ\0¤ë²Ÿ1AùŒwBH¯a\ÑR-\Â{¹\ÜEº4²;P3“_ş\Ô\ß¿\áp|^\Ô/ÑŸ\ì\Ëö{4c‘&\ÕşŒş5ß”\áJ\Ü\Ïdy¹®%S¥Ê·g€d\ÜÊ¬\ÅGE©­\ÔFœ°œp[?A\æù±IÀ\Çzn\nn!†6ŸZúö»,\ßby±;2v+9\ÙÔ¨\ëøô\ÅO¤kMÿ\0/˜‹ †Ç¯STQ|\×û\Ø9$œöüx©\ÕFô9\Şr¤œ/Ë¡¨\å\Ù\êÿ\0ÿ\0j_ş\Ï^!´¼ğÖ¹{e\åN\Í=°\æ\ÒğvH\ÎW\×\ç#¯jı3ı’ÿ\0\àª^	øùg›¯Lñ$Q =BtKk‡<„Œ‚py\ï{W\ä,W\İY<Š[\Ì\ÉqùPpG¯£¨\â¬h\ä\ÏŒñ\ägH\äŸ\áúş•.\ëb¬Bzv©±d.-n!¸…\ãp\Êš²z\×\á—Á\ß\Ú{Å¿µ˜nü7¬\ê:Z\Û\çtyYb`À•¿•}½û0ÿ\0Á`\ìüC$\Zo­V\Ùf\ãûZÑ¿w\Øóc\Â\íA<\â…5ÔV»ü\ÊzŒš\ËğßŠ4\ïi1_\éW¶ºŒ\ëº+‹yVH¥r¬¼\Z\ĞS\ëÒ¯ru$o\åIB\à};\æ\Îq\ë\ëJK¸\ì\ÉT£\æ=(¤\É^=8\ëEdhy\'Á\åÇ‰\ï?\ë\ßÿ\0f\é\"b£µyŸ\Â \Ñø®ç²´?Ÿ\"½*¥lC}ù\çÚ<ûS)c=N=Q$yö®\âWÅ\àÿ\0…¥\Ö<I©[\éZ|\'iA “\Ğ\0$\×È¿··ü£Mø{/†<ı›\â?\Æ\0»¼2\î´\Òó\ÉR\Ã\åy1·€\Ün\äW\æ_\Å\ï ø\×\âY5\ë\×úõÌ¤2‰\ç³Gè¨ŒH\0gµh©Ü–\ì~‰||ÿ\0‚\ßh\ÖVÓ§\Ã\İ6kÅJKR·ò\â\r»-7\îlFGqšøKöŠı´¼kûHkF\ã\ÄÚ³½ª1kkhaDT\Î9\Æ>µ\ä:ˆ^òm\ÌD¤/?,~ÀVl\×\ìI$–õ5ª‰\ç4eñd\Âİ¥\ÎY¿3U\â|C,œä¹õ5J Z@~µn\å¶Ãü<z¢[m•VL\Ë\ÍJ“ø\çò¨cûù©üôÖ¢&oœ1¸?J„\Â~ğ\è½iÛ‚¶I\ëÚ™,¸\íòô\ĞÆµg\Ô±ÿ\0\í7\ÚM—ƒµ\Éˆ‹ı‚\á”ñ’[c\Û%ˆ\ã½}O£Á\è_c_–q\\5\Î\änœ‚8¯©¿e/\Ûb-mô\Ü¢ˆµvi¦º\äu\æ¾s2\Ë]\İZK\ä}>]™\İ{*¯\æ}l\Ğô\ÇÒ§€f,7\ÍÛ\Ô\í\Z\â\×]Ó£»²¹†\î\Úe’\Â\áÕ\ç¨ş¼Óš=>½=+À\ä\åvgĞ©¦®ŒûûA+9>õI­dN›‡µm\ŞÀLf\É\ê(\Ğ.U\r,rœR´r\\I×µR°8<zZ\Ç2x Eı&\ØC;\n¹+—üi4ûfH²i\r´—WXŒ\ÓJ\ær’½ˆ±n1V4ı\î.W<–\à\ÜÖ—öri¶\í,\Åc‰9i$!~¤ğ?\Zù‹ö¤ı»m4k+­Á\ÓA<\íˆ\ç¿Ga°†!–1Ç ù³]Xz«.Trbq0¤µ)ş\Üÿ\0´\ÜPY\É\à½\ådYn©*§\İ`\Øƒ\ìT\æ¾M€}óœ\ÔW7òjRI4¯$’»Y\Ûq9\ç$i‡t²un·½}^\ZP²>W]Õ›ob\ÄlşnH\çª\Ü\ÅT\ãƒÀ UboaÇ¥8r \ár?\İ\é]IX\ç$¨\Ùi\Æ3S\"¡ü¯\Êü\ã\å?&29÷\çò¦Á–gY¥xS€·ÍƒÁ\ïı)6³Ÿa”t8\æ6\Ï5p[—4\è¼\Ë%Q\Î\ÒHü…‰üšŸMÜ³ò@v#N\Ş@,q\Ï\ìæ£´„\İX\ÈøfL\0Ç—§¡õ?¥Iö\ém¼¡€\Ï\È\ç¶3øHÔ½a4\Î2‹‘§<İ1øôç¯½kZ]Mª\Ëh„W)jnŠ›Â„+•g“\ÈÁ=\ëK” f,¬\è\ÂFŒ¦U—1®sş5s\Íû.™‘9$E9 \0\à\ã\Ûõ¤\Òhhõßµ‹~\êm^š\Ç\í2–%Ex^B2.03\Æq­}\éû(ÿ\0ÁX4ˆzJYxé¿±u”Ú’]\Ç6w-–\È\ÉCŒp@\ï_—ö\æj6\É4ƒlğ›÷\"\n\ç98\İò^µmf{¹L&]Ê»e(\Ç<\Î\Ò8#\å\ç<t¬nÖ¥\è\Ï\ß\r_´ñˆ¹²¸\æ$,‘Ÿ”\â¯G/”\ÙúW\â\ÏÁ\Ú\ã\Å\ß¥ót\ÍU\ì.\ì,\ÚVkIÔ™9h”\ã9\Ç\Ì•úAû!ş\ß~ı¤´ña~ÖšŠ¢*§½\Æõº\È?4N@\r÷[\å#\Ğ\çufK‹>Š{….ry\Ï84Q’#—œp\ÑS\ÌI\ãŸ/Ì¾.6\ín\ß\ÌW§\äšòoƒ\Ñ\"ø\ÖfB@0‘\ÏnV°ÿ\0k_\Û\Ã\Â_²˜ñj2½\îºcW\Â\Ë\0\Ù\Ã9\Î\àù5Q2±“g´x‡Ä¶\Òf¿\Õ/-¬l­¼³O(GRI5ù\Ëÿ\0ÿ\0‚¶k\Û\Şø\'\á}õ\í›	\írL\İE·-\È$¨$ó !†Ñ\É#\å¿\Ú÷ş\n\ãO\Ú{W+ª\\\Çc¤&õ†\Ò\Ş=W9À’{r\Ç5ó\ÍÖ fİ†1«œõ~Ü‘]Q‚JÂ¿sGS×[\ÙL²™šC½†\íÉ»¹\'»t\íY’L÷+ó>UFoÓµV\r\Ï?…;±Ö®\Æm½Ivô\Å7v\Í1şZj¯ô\ì\ÅÔ³§!o\Şºƒ\ë\Ûô§Nÿ\0»>\ãõ¥_ôk$O\âo˜şdJl\ËşŒZ•™Dj@ûj;@5\"©e\İ@+ù”ªs\Çğ÷¦1\Â\Ówn –=¬x\È\ÎAôöª\Ò\Èea\Æ;\Õ0…\Í+[ùÃ\Ã&‘j]\ÏDø%ûVx¯\àÎ¡Øµ¥°/™l\åmñ¸\Æ;ƒ;Šú¯\áŸü3\Â^6Ã«\Û\\h—¸Uy|Á$Ç¤‚?\Zø\"\â³œz\ÔEXè¼ŒW#/£WVµ;°ÙjZ\'¡ú\ß\á\Ï\è>1µišÆ‘z‡şy\İFO\â¹È§\ß\é. ‡\Ôm\É\Í~M\é\Ş »\ÒT´3¼~\ëÖºö„ñg‡¤O²k7q\í\0×—S$¿\Ã#×§¦­4~™_\é&Kt;~n=r*æ¢1##óùÍ§ş\Ù\ìĞˆüCp\àƒ\ZŸı–¨\ë´÷|B».õÛ§ByUÂƒùYaÏ¹o:¥m?MµIğ\åƒÉ¨\êV(ƒ%§¸T\Ç\æk\É~!ş\İşøpd[#/ˆ.\Æ\älÊ±+\å²N>‚¿=\ï|a{¨I¾k™d~ÅU3\És¼–\İ\ëšê¥“F.ów8j\æÓ—À¬{_\Ç\ÛcÅŸ®\Û\í\Òiº[`[wÚ‡\äoÆ¼vk¯8\î\'œ\ç\'’MTIµc\Èy#İ°/Ç·µzĞ¡/póªÕ•Mf\îM\î\éR†#¿\×\ê(\ÙQ\0\æ\äb§\"µZu±pI°~÷#-ÓŒ1\ÓÓšm¼¹$\ç°\ëP#şê¤±?¾Oº\à\ç E0-nØ…_w\\œ…I72y[†H n}¹¨0\ï\Ûò§o7H‘\à\É\ëÀo\çP\Ó\ÜksR†C\\\Í\æI•‘ğ\ì+\ÇC\É=F8\àšr\É\çL’cq1¦\áŒüÀ(bú\ÔZ-\ÛÅ§ÊŸ+‰v©F<q\Ós\ëW\ã‘NÆ‚C¼\ÊÛ˜€\ß*eq8\ÇQ\Ï\'Ú¤\Ğ,ŸÌ•v¼q¼ +\ç\îcä¸\È<s\ë\Å\\¶‚I\"kvQ7\ÌÆ¨2p\0\ÎsÓ¿·J\Ë6¹‹÷x<ü\Êzúõ\íü\ëY¯&kx\Øg\n„\È#h\àû^¾õ2ò\Z-\İ@\Û\á]Š+y-\"ƒ…\çO¨\0t ó÷Ex‹\í+;±;ü¶\älÉ¿\Ş\àòNµO¨*K}0£’›\Ğ\ä¯,\0o^üõ©&oºY\ãò\æˆ4€\Ú\n‘\'òsÛŸÎ²,Heû~\í\ìb—RgŒ\âAüY\ÏN3\Ó¥uºgŠ/¼x×ºuüöwvÏ¼¬YWg\r(W\Ï]r\n–³Ñ\æ¹ÿ\0IŒ\â!/e“~26>]\ÍÔ‘\Üz\ãµ\É.ÿ\0R\Ø a—7“\Ï*˜•\0÷\Ï8\à\03YTW\ØÚ–úŸ[[ÿ\0ÁAş,iV\ék¿q,6\Ê\"\æ\ÒciW€X\ä\åˆœ{\Ñ_:C\â]>(•²´Ù¶€<\Ç\Şı\Î\Ö“\ì1\éErZ]\Î\ßs±úñ‹\ã\Ä³W\Â\Ïx©¤E»·\ÓeOI3¶[²§\Ê^9\ëùW\ã\ç\Ä?Šz\çÄ\\\ê\Ú\î¡uªjw„g¸•¸\0wú~ú\ÃûNø\Z\×\âw\Â=_J¾ÿ\0Us\ìb»¼—\ÛÃ\ê¿!o,„WóBÍ»Ë‘“8\ÆqŞ½,4“\Ğğj\Ş:™\Ó\Èe“¯OÖ˜>b}ªY-ö’2x4\Øcı\ç_Òºv\Û\Üj1SÒ¤5=¢Q\Ôf”DµRY\ÎXqNw°r@\àT\Ïn\n\çÒ–\Ö\ægüŠ \ê_\Şõ\ëM¹\Ë\Û\ã\îñŠ%Œ<\ßJ[¨ò¨2z\ĞZ+ª\ã\ç\"¹f\Å*Ç»J|q|¿¥J—WD#\rLh‚¯Nô\àTo•©;\ÕÉ­•ˆüúS\ÕDD÷<\Òµ+F\nÔ“\Æ#U÷$\Ç^Ù \ÙF\ÄOnUÀŒ\àŸJ…\íöpß‘«\Â/ƒ\ÎFsLòr\Ã\æ4¯\âFs\ëœTŠ»›ÿ\0­W,\Äy5\Zes\Û=(\ßr}\Ò?\nr\ÛùjI<dc \Ô\Ì\ÛP{\Óf^W®1\Ó4;$\à½Xy²ÿ\0/Ojb h¶\ã5=µ°I:ö *n~KT­6\Å\Æzr3\ßÚ¤Š/\Şõ¨x¿@{ò:Pdñ,f“q\Ø\Ümã¨¤±p?º=“Ä§ğúÔ–p	#$ö\ã@\Ğù#VV\äu=¯4ì‹™ÂŸ”de±’3J°nr	?QÒ˜\Ô\Ú\nñı\ì\Ò{diZI\äÚ#d39m\ÙL&?8§\ÈW\æ\Ù\"qÁ\èF}†õGKa,{\Ï+‚NqŒ~œt­!–C(t»B\Óio\â\ãÛš—Av9o]\Û@úJ»yo5½¦$Ş­±]L‰\Ô‘€z¯}\ë6i<¦#Ÿõ{»t\ÏN}\ê\ìSMy­$\Í \\ª‰>m«°¶?Î¢æ¤}x²ù^O¾c\Ç\Ú9\ŞI\Ó\éÒ´\Zô\ŞÁ~%F·#\Í´6VAò\ã?7\Êj\Ô$Íºœ1H]”‘\Ñ~o—ò\ã=j×ˆ9-o¥Xü³k0e\nŞ«!\Ç\é\Ôó\ïX\Ësk\ÃD\Ö\é»÷`‰•_i—\Ìÿ\0[‡$—\Ï\àÚµ5«\Û9\îµ¨¤{iI&(ü\Í\à–iw\Ø˜v\'œ\ÖÏ¿Mk˜ÿ\0uS”òs¸\ÂLœŸ­nx7\Ã1x‡\Æq\ÛH\ì±J@‘@á³¿?J\Îm$RmlwúN¥¨j\ZU´ğ\èzSE4I\"y*@#©\ÏJ+\ê|\Ğ\ÃZx66lE´`Ÿ³¨\Ï\Ê(®S¢\ìÿ\Ù','V9C0CWFUTW','L-Aral','Academic',NULL,NULL,NULL,NULL,NULL,NULL,'2019-01-29 17:35:02','dsadsa',1,1,1,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,'Suggestion','Suggestion','Comment','Comment','Suggestion',100,'No more program head'),(26,'College of Computer Studies (CCS)','Information Technology (IT)','2019-02-07','Edit SE Testing','unitrep ccsit','Interdisciplinary Fora',1,1,4,0,NULL,'2019-02-27',50000,'adsadsa','dsads','adada','dsad','421321','dsad','sadsadsa','dsadsadsa',NULL,'OVPLM',27,5,12,5,5,5,5,55,1,'change kras','2019-02-07 17:20:59',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,85,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Academic',NULL,NULL,NULL,NULL,NULL,NULL,'2019-02-07 19:52:42','dsadsa',NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `seproposal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `seproposal_component`
--

DROP TABLE IF EXISTS `seproposal_component`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `seproposal_component` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `seproposalID` int(11) DEFAULT NULL,
  `component` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `LA10_idx` (`seproposalID`),
  CONSTRAINT `LA10` FOREIGN KEY (`seproposalID`) REFERENCES `seproposal` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `seproposal_component`
--

LOCK TABLES `seproposal_component` WRITE;
/*!40000 ALTER TABLE `seproposal_component` DISABLE KEYS */;
INSERT INTO `seproposal_component` VALUES (9,25,'Training/Capacity Building for the Partner'),(10,25,'Policy Advocacy/Development related to the Social Problem being Addressed');
/*!40000 ALTER TABLE `seproposal_component` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `seproposal_expenses`
--

DROP TABLE IF EXISTS `seproposal_expenses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `seproposal_expenses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `item` varchar(200) DEFAULT NULL,
  `unitcost` double DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `amountUsed` double DEFAULT NULL,
  `receipt` longblob,
  `seproposalID` int(11) DEFAULT NULL,
  `subtotal` double DEFAULT NULL,
  `datetime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `LA12_idx` (`seproposalID`),
  CONSTRAINT `LA12` FOREIGN KEY (`seproposalID`) REFERENCES `seproposal` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=94 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `seproposal_expenses`
--

LOCK TABLES `seproposal_expenses` WRITE;
/*!40000 ALTER TABLE `seproposal_expenses` DISABLE KEYS */;
INSERT INTO `seproposal_expenses` VALUES (91,'dsdsasa',5000,1,5000,NULL,25,5000,'2019-01-29 17:45:19'),(93,'dsadsa',50000,1,NULL,NULL,26,50000,NULL);
/*!40000 ALTER TABLE `seproposal_expenses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `seproposal_personresponsible`
--

DROP TABLE IF EXISTS `seproposal_personresponsible`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `seproposal_personresponsible` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `seproposalID` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `LA13_idx` (`seproposalID`),
  CONSTRAINT `LA13` FOREIGN KEY (`seproposalID`) REFERENCES `seproposal` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `seproposal_personresponsible`
--

LOCK TABLES `seproposal_personresponsible` WRITE;
/*!40000 ALTER TABLE `seproposal_personresponsible` DISABLE KEYS */;
INSERT INTO `seproposal_personresponsible` VALUES (33,'dasdsa','dsadad',25),(35,'dsasada','dsadadsa',26);
/*!40000 ALTER TABLE `seproposal_personresponsible` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `seproposal_revisions`
--

DROP TABLE IF EXISTS `seproposal_revisions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `seproposal_revisions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `seproposalID` int(11) DEFAULT NULL,
  `unit` varchar(200) DEFAULT NULL,
  `department` varchar(200) DEFAULT NULL,
  `datecreated` date DEFAULT NULL,
  `programName` varchar(500) DEFAULT NULL,
  `programHead` varchar(200) DEFAULT NULL,
  `activityClassification` varchar(200) DEFAULT NULL,
  `targetCommunity` int(11) DEFAULT NULL,
  `targetKRA` int(11) DEFAULT NULL,
  `targetGoal` int(11) DEFAULT NULL,
  `targetMeasure` int(11) DEFAULT NULL,
  `titleOfActivity` varchar(200) DEFAULT NULL,
  `actualImplementation` date DEFAULT NULL,
  `totalAmountRequested` double DEFAULT NULL,
  `problemaddressed` varchar(500) DEFAULT NULL,
  `nameOfPartner` varchar(200) DEFAULT NULL,
  `address` varchar(200) DEFAULT NULL,
  `contactPerson` varchar(200) DEFAULT NULL,
  `mobileNumber` varchar(200) DEFAULT NULL,
  `email` varchar(200) DEFAULT NULL,
  `description` varchar(500) DEFAULT NULL,
  `objectives` varchar(1000) DEFAULT NULL,
  `explanation` varchar(1000) DEFAULT NULL,
  `sourceOfFunds` varchar(45) DEFAULT NULL,
  `academicStaffPopulation` int(11) DEFAULT NULL,
  `academicStaffExpected` int(11) DEFAULT NULL,
  `supportStaffPopulation` int(11) DEFAULT NULL,
  `supportStaffExpected` int(11) DEFAULT NULL,
  `undergraduatePopulation` int(11) DEFAULT NULL,
  `undergraduateExpected` int(11) DEFAULT NULL,
  `graduatePopulation` int(11) DEFAULT NULL,
  `graduateExpected` int(11) DEFAULT NULL,
  `step` int(11) DEFAULT NULL,
  `deptunitRemarks` varchar(1000) DEFAULT NULL,
  `deptunitdatetime` datetime DEFAULT NULL,
  `externaldirectorRemarks` varchar(1000) DEFAULT NULL,
  `externaldirectordatetime` datetime DEFAULT NULL,
  `deanRemarks` varchar(1000) DEFAULT NULL,
  `deandatetime` datetime DEFAULT NULL,
  `ovplm1Remarks` varchar(1000) DEFAULT NULL,
  `ovplm2Remarks` varchar(1000) DEFAULT NULL,
  `coscaRemarks` varchar(1000) DEFAULT NULL,
  `coscadatetime` datetime DEFAULT NULL,
  `lmc1` int(11) DEFAULT NULL,
  `lmc2` int(11) DEFAULT NULL,
  `lmc3` int(11) DEFAULT NULL,
  `lmc4` int(11) DEFAULT NULL,
  `lmc5` int(11) DEFAULT NULL,
  `lmc6` int(11) DEFAULT NULL,
  `lmc7` int(11) DEFAULT NULL,
  `lmc8` int(11) DEFAULT NULL,
  `hasVoted1` int(11) DEFAULT NULL,
  `hasVoted2` int(11) DEFAULT NULL,
  `hasVoted3` int(11) DEFAULT NULL,
  `hasVoted4` int(11) DEFAULT NULL,
  `hasVoted5` int(11) DEFAULT NULL,
  `hasVoted6` int(11) DEFAULT NULL,
  `hasVoted7` int(11) DEFAULT NULL,
  `hasVoted8` int(11) DEFAULT NULL,
  `lmcApprovalCount` int(11) DEFAULT NULL,
  `lmcReviseCount` int(11) DEFAULT NULL,
  `lmcRejectCount` int(11) DEFAULT NULL,
  `isRevise` int(11) DEFAULT NULL,
  `userID` int(11) DEFAULT NULL,
  `lmc1Remarks` varchar(1000) DEFAULT NULL,
  `lmc2Remarks` varchar(1000) DEFAULT NULL,
  `lmc3Remarks` varchar(1000) DEFAULT NULL,
  `lmc4Remarks` varchar(1000) DEFAULT NULL,
  `lmc5Remarks` varchar(1000) DEFAULT NULL,
  `lmc6Remarks` varchar(1000) DEFAULT NULL,
  `lmc7Remarks` varchar(1000) DEFAULT NULL,
  `lmc8Remarks` varchar(1000) DEFAULT NULL,
  `prs` longblob,
  `code` varchar(45) DEFAULT NULL,
  `classificationforkra` varchar(45) DEFAULT NULL,
  `unittype` varchar(45) DEFAULT NULL,
  `unitchairremarks` varchar(100) DEFAULT NULL,
  `unitchairdatetime` datetime DEFAULT NULL,
  `sedirectorremarks` varchar(100) DEFAULT NULL,
  `sedirectordatetime` datetime DEFAULT NULL,
  `vpvcremarks` varchar(100) DEFAULT NULL,
  `vpvcdatetime` datetime DEFAULT NULL,
  `datetime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `LA40_idx` (`seproposalID`),
  CONSTRAINT `LA40` FOREIGN KEY (`seproposalID`) REFERENCES `seproposal` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `seproposal_revisions`
--

LOCK TABLES `seproposal_revisions` WRITE;
/*!40000 ALTER TABLE `seproposal_revisions` DISABLE KEYS */;
INSERT INTO `seproposal_revisions` VALUES (1,26,'College of Computer Studies (CCS)','Information Technology (IT)','2019-02-07','Edit SE Testing','unitrep ccsit','Interdisciplinary Fora',1,1,1,NULL,NULL,'2019-02-27',50000,'adsadsa','dsads','adada','dsad','421321','dsad','sadsadsa','dsadsadsa',NULL,'OVPLM',27,5,12,5,5,5,5,55,1,'change kras','2019-02-07 17:20:59',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2019-02-07 17:20:39');
/*!40000 ALTER TABLE `seproposal_revisions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `seproposal_revisions_component`
--

DROP TABLE IF EXISTS `seproposal_revisions_component`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `seproposal_revisions_component` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `seproposalID` int(11) DEFAULT NULL,
  `component` varchar(1000) DEFAULT NULL,
  `revisionID` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `LA45_idx` (`seproposalID`),
  CONSTRAINT `LA45` FOREIGN KEY (`seproposalID`) REFERENCES `seproposal_revisions` (`seproposalID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `seproposal_revisions_component`
--

LOCK TABLES `seproposal_revisions_component` WRITE;
/*!40000 ALTER TABLE `seproposal_revisions_component` DISABLE KEYS */;
/*!40000 ALTER TABLE `seproposal_revisions_component` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `seproposal_revisions_expenses`
--

DROP TABLE IF EXISTS `seproposal_revisions_expenses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `seproposal_revisions_expenses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `item` varchar(200) DEFAULT NULL,
  `unitcost` double DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `amountUsed` double DEFAULT NULL,
  `seproposalID` int(11) DEFAULT NULL,
  `subtotal` double DEFAULT NULL,
  `revisionID` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `LA44_idx` (`seproposalID`),
  CONSTRAINT `LA44` FOREIGN KEY (`seproposalID`) REFERENCES `seproposal_revisions` (`seproposalID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `seproposal_revisions_expenses`
--

LOCK TABLES `seproposal_revisions_expenses` WRITE;
/*!40000 ALTER TABLE `seproposal_revisions_expenses` DISABLE KEYS */;
INSERT INTO `seproposal_revisions_expenses` VALUES (1,'dsadsa',50000,1,NULL,26,50000,1);
/*!40000 ALTER TABLE `seproposal_revisions_expenses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `seproposal_revisions_measures`
--

DROP TABLE IF EXISTS `seproposal_revisions_measures`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `seproposal_revisions_measures` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `seproposalID` int(11) DEFAULT NULL,
  `measureID` int(11) DEFAULT NULL,
  `revisionID` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `LA42_idx` (`seproposalID`),
  KEY `LA43_idx` (`measureID`),
  CONSTRAINT `LA42` FOREIGN KEY (`seproposalID`) REFERENCES `seproposal_revisions` (`seproposalID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `LA43` FOREIGN KEY (`measureID`) REFERENCES `measure` (`measureID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `seproposal_revisions_measures`
--

LOCK TABLES `seproposal_revisions_measures` WRITE;
/*!40000 ALTER TABLE `seproposal_revisions_measures` DISABLE KEYS */;
INSERT INTO `seproposal_revisions_measures` VALUES (1,26,8,1),(2,26,9,1);
/*!40000 ALTER TABLE `seproposal_revisions_measures` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `seproposal_revisions_personresponsible`
--

DROP TABLE IF EXISTS `seproposal_revisions_personresponsible`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `seproposal_revisions_personresponsible` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `seproposalID` int(11) DEFAULT NULL,
  `revisionID` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `LA46_idx` (`seproposalID`),
  CONSTRAINT `LA47` FOREIGN KEY (`seproposalID`) REFERENCES `seproposal_revisions` (`seproposalID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `seproposal_revisions_personresponsible`
--

LOCK TABLES `seproposal_revisions_personresponsible` WRITE;
/*!40000 ALTER TABLE `seproposal_revisions_personresponsible` DISABLE KEYS */;
INSERT INTO `seproposal_revisions_personresponsible` VALUES (1,'dsasada','dsadadsa',26,1);
/*!40000 ALTER TABLE `seproposal_revisions_personresponsible` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `seproposal_revisions_workplan`
--

DROP TABLE IF EXISTS `seproposal_revisions_workplan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `seproposal_revisions_workplan` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `startdate` date DEFAULT NULL,
  `activity` varchar(200) DEFAULT NULL,
  `timestartTimeend` varchar(200) DEFAULT NULL,
  `timeend` varchar(200) DEFAULT NULL,
  `venue` varchar(200) DEFAULT NULL,
  `seproposalID` int(11) DEFAULT NULL,
  `revisionID` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `LA41_idx` (`seproposalID`),
  CONSTRAINT `LA41` FOREIGN KEY (`seproposalID`) REFERENCES `seproposal_revisions` (`seproposalID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `seproposal_revisions_workplan`
--

LOCK TABLES `seproposal_revisions_workplan` WRITE;
/*!40000 ALTER TABLE `seproposal_revisions_workplan` DISABLE KEYS */;
INSERT INTO `seproposal_revisions_workplan` VALUES (1,'2019-02-27','dsad','sad','adsad','sadsads',26,1);
/*!40000 ALTER TABLE `seproposal_revisions_workplan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `seproposal_workplan`
--

DROP TABLE IF EXISTS `seproposal_workplan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `seproposal_workplan` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `startdate` date DEFAULT NULL,
  `activity` varchar(200) DEFAULT NULL,
  `timestartTimeend` varchar(200) DEFAULT NULL,
  `timeend` varchar(200) DEFAULT NULL,
  `venue` varchar(200) DEFAULT NULL,
  `seproposalID` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `LA11_idx` (`seproposalID`),
  CONSTRAINT `LA11` FOREIGN KEY (`seproposalID`) REFERENCES `seproposal` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=69 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `seproposal_workplan`
--

LOCK TABLES `seproposal_workplan` WRITE;
/*!40000 ALTER TABLE `seproposal_workplan` DISABLE KEYS */;
INSERT INTO `seproposal_workplan` VALUES (66,'2019-01-31','dsads','adsa','sada','ddas',25),(68,'2019-02-27','dsad','sad','adsad','sadsads',26);
/*!40000 ALTER TABLE `seproposal_workplan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sereport`
--

DROP TABLE IF EXISTS `sereport`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sereport` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` date DEFAULT NULL,
  `projectTitle` varchar(500) DEFAULT NULL,
  `targetKRA` varchar(200) DEFAULT NULL,
  `targetGoal` varchar(200) DEFAULT NULL,
  `targetMeasure` varchar(200) DEFAULT NULL,
  `projectProponent` varchar(200) DEFAULT NULL,
  `numberOfBeneficiaries` int(11) DEFAULT NULL,
  `projectBeneficiaries` varchar(100) DEFAULT NULL,
  `addressBeneficiaries` varchar(200) DEFAULT NULL,
  `addressOfProject` varchar(200) DEFAULT NULL,
  `amountReceivedOVPLM` double DEFAULT NULL,
  `significanceProject` varchar(4000) DEFAULT NULL,
  `happenedImplementationProject` varchar(4000) DEFAULT NULL,
  `whenwhereProject` varchar(1000) DEFAULT NULL,
  `participantsProject` varchar(1000) DEFAULT NULL,
  `highlightsProject` varchar(5000) DEFAULT NULL,
  `majorProblems` varchar(1000) DEFAULT NULL,
  `otherRecommendations` varchar(1000) DEFAULT NULL,
  `annexes` longblob,
  `attendanceBeneficiaries` longblob,
  `attendanceDLSU` longblob,
  `beneficiariesLetters` longblob,
  `seproposalID` int(11) DEFAULT NULL,
  `cap` int(11) DEFAULT NULL,
  `apsp` int(11) DEFAULT NULL,
  `asf` int(11) DEFAULT NULL,
  `faculty` int(11) DEFAULT NULL,
  `admin` int(11) DEFAULT NULL,
  `directhired` int(11) DEFAULT NULL,
  `independent` int(11) DEFAULT NULL,
  `external` int(11) DEFAULT NULL,
  `gsheets` varchar(100) DEFAULT NULL,
  `implementationdate` date DEFAULT NULL,
  `graduate` int(11) DEFAULT NULL,
  `undergraduate` int(11) DEFAULT NULL,
  `alumni` int(11) DEFAULT NULL,
  `parents` int(11) DEFAULT NULL,
  `feedback1` varchar(500) DEFAULT NULL,
  `feedback2` varchar(500) DEFAULT NULL,
  `feedback3` varchar(500) DEFAULT NULL,
  `feedback4` varchar(500) DEFAULT NULL,
  `feedback5` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `LA17_idx` (`seproposalID`),
  CONSTRAINT `LA17` FOREIGN KEY (`seproposalID`) REFERENCES `seproposal` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sereport`
--

LOCK TABLES `sereport` WRITE;
/*!40000 ALTER TABLE `sereport` DISABLE KEYS */;
/*!40000 ALTER TABLE `sereport` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sereport_attendees`
--

DROP TABLE IF EXISTS `sereport_attendees`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sereport_attendees` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(500) DEFAULT NULL,
  `email` varchar(500) DEFAULT NULL,
  `type` varchar(45) DEFAULT NULL,
  `sereportID` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `LA55_idx` (`sereportID`),
  CONSTRAINT `LA55` FOREIGN KEY (`sereportID`) REFERENCES `sereport` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sereport_attendees`
--

LOCK TABLES `sereport_attendees` WRITE;
/*!40000 ALTER TABLE `sereport_attendees` DISABLE KEYS */;
/*!40000 ALTER TABLE `sereport_attendees` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sereport_attendees_temp`
--

DROP TABLE IF EXISTS `sereport_attendees_temp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sereport_attendees_temp` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(500) DEFAULT NULL,
  `email` varchar(500) DEFAULT NULL,
  `type` varchar(500) DEFAULT NULL,
  `seproposalID` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sereport_attendees_temp`
--

LOCK TABLES `sereport_attendees_temp` WRITE;
/*!40000 ALTER TABLE `sereport_attendees_temp` DISABLE KEYS */;
INSERT INTO `sereport_attendees_temp` VALUES (1,'fsadsasadsadas','dino.dc.alcala@gmail.com','Admin','25'),(2,'sadsafsada','dino12225@gmail.com','Undergrad','25'),(3,'dsafsadjkajkdls','dsajdkslajdkas@gmail.com','CAP','25');
/*!40000 ALTER TABLE `sereport_attendees_temp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sereport_funds`
--

DROP TABLE IF EXISTS `sereport_funds`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sereport_funds` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lineItem` varchar(500) DEFAULT NULL,
  `approvedAmount` double DEFAULT NULL,
  `expendedAmount` double DEFAULT NULL,
  `variance` double DEFAULT NULL,
  `reasonVariance` varchar(500) DEFAULT NULL,
  `sereportID` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `LA20_idx` (`sereportID`),
  CONSTRAINT `LA20` FOREIGN KEY (`sereportID`) REFERENCES `sereport` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sereport_funds`
--

LOCK TABLES `sereport_funds` WRITE;
/*!40000 ALTER TABLE `sereport_funds` DISABLE KEYS */;
/*!40000 ALTER TABLE `sereport_funds` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sereport_objectives`
--

DROP TABLE IF EXISTS `sereport_objectives`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sereport_objectives` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `expectedOutcomes` varchar(1000) DEFAULT NULL,
  `actualAccomplishment` varchar(1000) DEFAULT NULL,
  `hinderingFactors` varchar(1000) DEFAULT NULL,
  `sereportID` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `LA18_idx` (`sereportID`),
  CONSTRAINT `LA18` FOREIGN KEY (`sereportID`) REFERENCES `sereport` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sereport_objectives`
--

LOCK TABLES `sereport_objectives` WRITE;
/*!40000 ALTER TABLE `sereport_objectives` DISABLE KEYS */;
/*!40000 ALTER TABLE `sereport_objectives` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `studentorgs`
--

DROP TABLE IF EXISTS `studentorgs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `studentorgs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `college` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `studentorgs`
--

LOCK TABLES `studentorgs` WRITE;
/*!40000 ALTER TABLE `studentorgs` DISABLE KEYS */;
INSERT INTO `studentorgs` VALUES (1,'Santugon','No College'),(2,'Tapat','No College'),(3,'La Salle Computer Society (LSCS)','College of Computer Studies (CCS)'),(4,'Mathematics Circle (Math Circle)','Br. Andrew Gonzales College of Education (BAGCED)'),(5,'Political Science Society (POLISCY)','No College'),(6,'Society of Proactive Role Models Inspiring Total Development (SPRINT)','No College'),(7,'Student Research and Development Program (SRDP)','No College'),(8,'Civil Engineering Society (CES)','Gokongwei College of Engineering (GCOE)'),(9,'Society of Manufacturing Engineering (SME)','No College'),(10,'Business Management Society (BMS)','Ramon V. Del Rosario College of Business (RVR-COB)');
/*!40000 ALTER TABLE `studentorgs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `unit`
--

DROP TABLE IF EXISTS `unit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `unit` (
  `unitID` int(11) NOT NULL AUTO_INCREMENT,
  `unitName` varchar(100) DEFAULT NULL,
  `unitHead` varchar(100) DEFAULT NULL,
  `unitType` varchar(45) DEFAULT NULL,
  `departments` int(11) DEFAULT NULL,
  `numberOfFaculty` int(11) DEFAULT NULL,
  `numberOfAdmin` int(11) DEFAULT NULL,
  `numberOfAPSP` int(11) DEFAULT NULL,
  `numberOfASF` int(11) DEFAULT NULL,
  `numberOfCAP` int(11) DEFAULT NULL,
  `numberOfDirectHired` int(11) DEFAULT NULL,
  `numberOfIndependent` int(11) DEFAULT NULL,
  `numberOfExternal` int(11) DEFAULT NULL,
  `unitDescription` varchar(200) DEFAULT NULL,
  `userID` int(11) DEFAULT NULL,
  PRIMARY KEY (`unitID`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `unit`
--

LOCK TABLES `unit` WRITE;
/*!40000 ALTER TABLE `unit` DISABLE KEYS */;
INSERT INTO `unit` VALUES (10,'Office of the Vice President for Lasallian Mission (OVPLM)','OVPLM Unit Head','Non-Academic',0,0,1,3,2,2,1,1,1,'OVPLM Unit',1),(11,'College of Computer Studies (CCS)','CCS Unit Head','Academic',6,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'CCS Unit ',1),(12,'College of Law (COL)','COL Unit Head','Academic',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'COL Unit',71),(13,'Br. Andrew Gonzales College of Education (BAGCED)','CED Unit Head','Academic',5,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'CED Unit',1),(14,'College of Liberal Arts (CLA)','CLA Unit Head','Academic',10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'CLA Unit',74),(15,'College of Science (COS)','COS Unit Head','Academic',3,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'COS Unit',74),(16,'Gokongwei College of Engineering (GCOE)','GCOE Unit Head','Academic',6,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'GCOE Unit',74),(17,'Ramon V. Del Rosario College of Business (RVR-COB)','RVR-COB Unit Head','Academic',6,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'RVR-COB Unit',74),(18,'School of Economics (SOE)','SOE Unit HEad','Academic',6,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'SOE Unit',74),(19,'Center for Social Concern and Action (COSCA)','COSCA Unit Head','Non-Academic',0,0,2,5,5,5,2,1,2,'COSCA Unit Description',71),(20,'Laguna Campus Lasallian Mission (LCLM)','LCLM Unit Head','Non-Academic',0,0,2,5,5,5,2,1,2,'LCLM Unit Description',71),(21,'Lasallian Pastoral Office (LSPO)','LSPO Unit Head','Non-Academic',0,0,2,5,5,5,2,1,2,'LSPO Unit Description',71),(22,'Lasallian Mission Council (LMC)','LMC Unit Head','Non-Academic',0,0,2,5,5,5,2,1,2,'LMC Unit Description',71),(23,'Dean of Student Affairs (DSA)','DSA Unit Head','Non-Academic',0,0,2,5,5,5,2,1,2,'DSA Unit Description',1),(24,'Office of Personnel Management (OPM)','OPM Program Head','Non-Academic',0,0,2,5,5,5,2,1,2,'OPM Unit Description',74),(25,'Security Office (SO)','Norman Dela Cruz','Non-Academic',0,10,10,10,5,10,10,10,10,'This is the Office of the Security of the University',1);
/*!40000 ALTER TABLE `unit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `unit_department`
--

DROP TABLE IF EXISTS `unit_department`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `unit_department` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `unitID` int(11) DEFAULT NULL,
  `departmentID` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `LA2_idx` (`unitID`),
  KEY `LA3_idx` (`departmentID`),
  CONSTRAINT `LA2` FOREIGN KEY (`unitID`) REFERENCES `unit` (`unitID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `LA3` FOREIGN KEY (`departmentID`) REFERENCES `department` (`departmentID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=89 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `unit_department`
--

LOCK TABLES `unit_department` WRITE;
/*!40000 ALTER TABLE `unit_department` DISABLE KEYS */;
INSERT INTO `unit_department` VALUES (41,10,0),(42,11,2),(43,11,3),(44,11,4),(45,13,5),(46,13,6),(47,13,7),(48,13,8),(49,13,9),(50,14,10),(51,14,11),(52,14,12),(53,14,13),(54,14,14),(55,14,15),(56,14,16),(57,14,17),(58,14,18),(59,14,19),(60,15,20),(61,15,21),(62,15,22),(63,16,23),(64,16,24),(65,16,25),(66,16,26),(67,16,27),(68,16,28),(69,17,29),(70,17,30),(71,17,31),(72,17,32),(73,17,33),(74,17,34),(75,18,35),(76,18,36),(77,18,37),(78,18,38),(79,18,39),(80,18,40),(81,19,0),(82,20,0),(83,21,0),(84,22,0),(85,23,0),(86,12,0),(87,24,0),(88,25,0);
/*!40000 ALTER TABLE `unit_department` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-02-09 12:51:38
