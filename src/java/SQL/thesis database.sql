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
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `budget`
--

LOCK TABLES `budget` WRITE;
/*!40000 ALTER TABLE `budget` DISABLE KEYS */;
INSERT INTO `budget` VALUES (1,'2018-10-19',10000000,NULL,10000000,NULL,NULL),(2,'2018-11-22',10000000,4000,9996000,0,0),(3,'2018-11-22',9996000,2000,9994000,0,0),(4,'2018-11-22',9994000,1000,9993000,0,0),(5,'2018-11-22',9993000,10000,9983000,0,0),(6,'2018-11-22',9983000,2000,9981000,0,0),(7,'2018-11-22',9981000,4000,9977000,0,0),(8,'2018-11-22',9977000,4000,9973000,10,0),(9,'2018-11-22',9973000,6500,9966500,20,0),(10,'2018-11-22',9966500,1000,9965500,5,0),(11,'2018-11-22',9965500,1000,9964500,18,0),(12,'2018-11-22',9964500,5000,9959500,15,0),(13,'2018-11-22',9959500,2000,9957500,14,0),(14,'2018-11-22',9957500,2000,9955500,12,0),(15,'2018-11-22',9955500,2000,9953500,17,0),(16,'2018-11-22',9953500,2000,9951500,4,0),(17,'2018-11-22',9951500,2000,9949500,7,0),(18,'2018-11-22',9949500,1000,9948500,6,0),(19,'2018-11-23',9948500,2000,9946500,0,28),(20,'2018-11-23',9946500,2000,9944500,0,24),(21,'2018-11-23',9944500,2000,9942500,0,12),(22,'2018-11-23',9942500,2000,9940500,0,15),(23,'2018-11-23',9940500,2000,9938500,0,19),(24,'2018-11-23',9938500,2000,9936500,0,21),(25,'2018-11-23',9936500,2000,9934500,0,23),(26,'2018-11-23',9934500,2000,9932500,0,16),(27,'2018-11-23',9932500,2000,9930500,0,25),(28,'2018-11-23',9930500,2000,9928500,0,27),(29,'2018-11-23',9928500,2000,9926500,0,17),(30,'2018-11-23',9926500,2000,9924500,0,10),(31,'2018-11-23',9924500,2000,9922500,0,20),(32,'2018-11-23',9922500,4000,9918500,0,26),(33,'2018-11-23',9918500,4000,9914500,0,14),(34,'2018-11-23',9914500,4000,9910500,0,11),(35,'2018-11-23',9910500,2000,9908500,0,13),(36,'2018-11-23',9908500,4000,9904500,0,22),(37,'2018-11-23',9904500,4000,9900500,0,18),(38,'2018-11-23',9900500,3000,9897500,22,0),(39,'2018-11-27',9897500,25000,9872500,23,0),(40,'2019-01-27',9872500,5000,9867500,24,0),(41,'2019-01-29',9867500,4000,9863500,0,33),(42,'2019-01-29',9863500,5000,9858500,25,0),(43,'2019-02-02',9858500,5000,9853500,0,34),(44,'2019-02-03',9853500,-5000,9858500,25,0),(45,'2019-02-12',9858500,5000,9853500,0,37),(46,'2019-02-18',9853500,5000,9848500,31,0),(47,'2019-02-21',9848500,5000,9843500,0,0),(48,'2019-02-21',9843500,5000,9838500,0,0),(49,'2019-02-21',9838500,5000,9833500,0,0),(50,'2019-02-21',9833500,5000,9828500,0,0),(51,'2019-02-26',9828500,5000,9823500,35,0),(52,'2019-02-26',9823500,-500,9824000,35,0);
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
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ffevaluation`
--

LOCK TABLES `ffevaluation` WRITE;
/*!40000 ALTER TABLE `ffevaluation` DISABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=58 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ffproposal`
--

LOCK TABLES `ffproposal` WRITE;
/*!40000 ALTER TABLE `ffproposal` DISABLE KEYS */;
INSERT INTO `ffproposal` VALUES (41,'College of Computer Studies (CCS)','Computer Technology (CT)','2019-03-02','unitrep ccsct','Retreat',NULL,NULL,NULL,'CCS-CT Recollection 2019','DLSU Retreat House','Bro. Jason Cruz','To unwind and improve faith to God','2019-03-17',3000,'OVPLM',4,'Approved!','2019-03-02 21:43:27',' Approved!','2019-03-02 21:45:06',' Approved!','2019-03-02 21:46:57',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,83,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Academic','2019-03-02 19:26:59',1,1,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(42,'College of Liberal Arts (CLA)','Political Science (POLSCI)','2019-03-02','unitrep clapolsci','Prayer Service',NULL,NULL,NULL,'CLA-POLSCI: Prayer Service','DLSU Retreat House','Bro. Ed Dela Cruz','To have a successful prayer service','2019-03-31',2000,'Others',4,' Approved!','2019-03-02 21:54:11','  Approved!','2019-03-02 21:54:34',' Approved!','2019-03-02 21:56:11',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,111,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Academic','2019-03-02 20:13:24',1,1,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(43,'College of Liberal Arts (CLA)','Psychology (PSYCH)','2019-03-02','unitrep clapsych','Spiritual Talk',NULL,NULL,NULL,'CLA-PSYCH: Spritual Talk 2019','DLSU Retreat House','Bro. Dino Alcala','To have a successful Spritual Talk','2019-03-25',2000,'Others',4,' Approved!','2019-03-02 21:54:05','  Approved!','2019-03-02 21:54:53',' Approved!','2019-03-02 21:56:04',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,112,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Academic','2019-03-02 20:16:25',1,1,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(44,'College of Liberal Arts (CLA)','Theology and Religious Education (TRED)','2019-03-02','unitrep clatred','Talk on the life of the Founder',NULL,NULL,NULL,'CLA-TRED: Talk on the Life of Founder 2019','DLSU Retreat House','Bro. Khalid Malo','To have a successful talk on the life of founder','2019-03-13',2000,'Others',4,' Approved!','2019-03-02 21:54:00','  Approved!','2019-03-02 21:55:05',' Approved!','2019-03-02 21:55:59',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,113,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Academic','2019-03-02 20:17:37',1,1,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(45,'Ramon V. Del Rosario College of Business (RVR-COB)','Management and Organization Department (RVRCOB-MOD)','2019-03-02','unitrep rvrcobmod','Retreat',NULL,NULL,NULL,'Retreat 2K19','Laguna City','Bro. Eddie Fernandez','To have a meaningful retreat','2019-03-26',10000,'Others',4,'Approved!','2019-03-02 22:02:07',' Approved!','2019-03-02 22:02:21','Approved!','2019-03-02 22:02:50',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,93,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Academic','2019-03-02 20:32:06',1,1,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(46,'Ramon V. Del Rosario College of Business (RVR-COB)','Marketing Management (RVRCOB-MM)','2019-03-02','unitrep rvrcobmm','Recollection',NULL,NULL,NULL,'Recollection 2K19','DLSU Retreat House','Bro. Angelo Canares','To have a wonderful recollection','2019-03-15',2000,'Others',4,'Approved!','2019-03-02 22:02:02',' Approved!','2019-03-02 22:02:35','Approved!','2019-03-02 22:02:45',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,94,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Academic','2019-03-02 20:33:25',1,1,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(47,'School of Economics (SOE)','Industrial Applied Economics (IAE)','2019-03-02','unitrep soeiae','Br. Gabriel Drolin Experience',NULL,NULL,NULL,'SOE-IAE: Br. Gabriel Drolin Experience 2019','DLSU Retreat House','Bro. Dino Brow','To have a meaningful Br. Grabiel Drolin Experience ','2019-03-25',2000,'Others',4,'Approved!','2019-03-02 22:06:50',' Approved!','2019-03-02 22:07:10','Approved!','2019-03-02 22:09:52',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,126,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Academic','2019-03-02 20:35:29',1,1,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(48,'School of Economics (SOE)','Financial Applied Economics (FAE)','2019-03-02','unitrep soefae','Spiritual Talk',NULL,NULL,NULL,'Spritual Talk 2K19','DLSU Retreat House','Bro. Eddie Garcia','To improve the Lasallian Faith','2019-03-28',2000,'Others',4,'Approved!','2019-03-02 22:06:54',' Approved!','2019-03-02 22:07:23','Approved!','2019-03-02 22:09:58',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,127,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Academic','2019-03-02 20:36:46',1,1,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(49,'Br. Andrew Gonzales College of Education (BAGCED)','Physical Education Department (PED)','2019-03-02','unitrep bagcedped','Spiritual Talk',NULL,NULL,NULL,'Improving Faith to God','DLSU Retreat House','Bro. Dino Alcala','To have a meaningful spiritual talk about God','2019-03-27',2000,'Others',4,'Approved!','2019-03-02 22:11:52',' Approved!','2019-03-02 22:12:39','Approved!','2019-03-02 22:13:27',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,143,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Academic','2019-03-02 21:08:14',1,1,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(50,'Br. Andrew Gonzales College of Education (BAGCED)','Science Education Department (SED)','2019-03-02','unitrep bagcedsed','Retreat',NULL,NULL,NULL,'Retreat for a better life','Cavite City','Bro. Khalid Cruz','To have the best retreat in life','2019-03-13',2000,'Others',4,'Approved!','2019-03-02 22:11:47',' Approved!','2019-03-02 22:12:54','Approved!','2019-03-02 22:13:23',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,144,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Academic','2019-03-02 21:09:45',1,1,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(51,'Gokongwei College of Engineering (GCOE)','Industrial Engineering (IE)','2019-03-02','unitrep gcoeie','Retreat',NULL,NULL,NULL,'GCOE-IE: Retreat 2K19','DLSU Retreat House','Bro. Angelo Carpio','To have a meaningful retreat','2019-03-15',2000,'Others',4,'Approved!','2019-03-02 22:14:51',' Approved!','2019-03-02 22:15:28','Approved!','2019-03-02 22:16:19',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,155,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Academic','2019-03-02 21:22:16',1,1,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(52,'Gokongwei College of Engineering (GCOE)','Manufacturing Engineering and Management (MEM)','2019-03-02','unitrep gcoemem','Talk on the life of the Founder',NULL,NULL,NULL,'GCOE-MEM: Talk on the life of the Founder 2019','DLSU Retreat House','Bro. Carlos Dela Cruz','To have a successful talk on the life of the founder','2019-03-22',2000,'Others',4,'Approved!','2019-03-02 22:14:56',' Approved!','2019-03-02 22:15:47','Approved!','2019-03-02 22:16:38',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,156,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Academic','2019-03-02 21:24:57',1,1,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(53,'Gokongwei College of Engineering (GCOE)','Mechanical Engineering (ME)','2019-03-02','unitrep gcoeme','Prayer Service',NULL,NULL,NULL,'Prayer Service for the Philippines','DLSU Retreat House','Bro. Ariane Green','To pray for the Philippines','2019-03-26',2000,'Others',4,'Approved!','2019-03-02 22:15:00',' Approved!','2019-03-02 22:16:09','Approved!','2019-03-02 22:16:44',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,157,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Academic','2019-03-02 21:26:05',1,1,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(54,'College of Science (COS)','Physics (PHYS)','2019-03-02','unitrep cosphys','Recollection',NULL,NULL,NULL,'COS-PHYS: Recollection 2019','DLSU Retreat House','Bro. Abigail Cruz','To have a meaningful recollection for the students of science','2019-03-27',2000,'Others',4,'Approved!','2019-03-02 22:17:47',' Approved!','2019-03-02 22:18:07','Approved!','2019-03-02 22:18:57',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,172,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Academic','2019-03-02 21:35:41',1,1,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(55,'Ramon V. Del Rosario College of Business (RVR-COB)','Management of Financial Institutions (RVRCOB-MFI)','2019-03-02','unitrep rvrcobmfi','Spiritual Talk',NULL,NULL,NULL,'Let\'s talk about God','DLSU Retreat House','Bro. Abigail Santa Cruz','To be more closer to God','2019-03-24',2000,'Others',4,'Approved!','2019-03-02 22:05:48',' Approved!','2019-03-02 22:06:02','Approved!','2019-03-02 22:06:12',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,92,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Academic','2019-03-02 22:05:11',1,1,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(56,'No College','Society of Proactive Role Models Inspiring Total Development (SPRINT)','2019-03-02','Glenn Romulo','Retreat',NULL,NULL,NULL,'SPRINT Retreat 2K19','Tagaytay City','Bro. Marck Flores','To have a meaningful Retreat','2019-03-18',2000,'Others',8,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,78,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Non-Academic','2019-03-02 23:50:02',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(57,'Gokongwei College of Engineering (GCOE)','Civil Engineering Society (CES)','2019-03-02','Princess Palafox','Br. Gabriel Drolin Experience',NULL,NULL,NULL,'CES - Br. Gabriel Drolin Experience','DLSU Retreat House','Bro. Alvin Reyes','To have a successful Br. Gabriel Drolin Experience','2019-03-19',2000,'Others',8,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,78,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Non-Academic','2019-03-02 23:51:30',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=333 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ffproposal_attendees`
--

LOCK TABLES `ffproposal_attendees` WRITE;
/*!40000 ALTER TABLE `ffproposal_attendees` DISABLE KEYS */;
INSERT INTO `ffproposal_attendees` VALUES (265,'Karl Madrid','krlmdrd@gmail.com',41),(266,'Dino Alcala','dinoboi@gmail.com',41),(267,'Khalid Malo','kramalo@gmail.com',41),(268,'Angelo De Jesus','dj@gmail.com',41),(269,'Dana Aquino','da@gmail.com',42),(270,'Kobi Tolentino','kt@gmail.com',42),(271,'Riel Malibiran','rm@gmail.com',42),(272,'Bea Santos','bs@gmail.com',42),(273,'Luis Grefiel','lg@gmail.com',43),(274,'Lianne Lu','ll@gmail.com',43),(275,'Aaron Estinar','ae@gmail.com',43),(276,'Lorenzo Libre','ll2@gmai.com',43),(277,'Karl Madrid','krlmdrd@gmail.com',44),(278,'Angelo De Jesus','aj@gmail.com',44),(279,'Khalid Malo','kramalo@gmail.com',44),(280,'Dino Alcala','da@gmail.com',44),(281,'Karl Madrid','krlmdrd@gmail.com',45),(282,'Khalid Malo','km@gmail.com',45),(283,'Dino Alcala','da@gmail.com',45),(284,'Angelo De Jesus','adj@gmail.com',45),(285,'Luis Grefie','lg@gmail.com',46),(286,'Topher Ignacio','ti@gmail.com',46),(287,'Rey Gamboa','rg@gmail.com',46),(288,'Amiel Trinidad','at@gmail.com',46),(289,'Angelo Gordon','ag@gmail.com',47),(290,'Khalid Say','ks@gmail.com',47),(291,'Gringo Honasan','gh@gmail.com',47),(292,'Rodgrigo Duterte','rd@gmail.com',47),(293,'LeBron James','lbj@gmail.com',48),(294,'Kevin Durant','kd@gmail.com',48),(295,'Giannis Antentekumpo','ga@gmail.com',48),(296,'Kawhi Leonard','kl@gmail.com',48),(297,'Karl Madrid','krlmdrd@gmail.com',49),(298,'Khalid Malo','km@gmail.com',49),(299,'Dino Alcala','da@gmail.com',49),(300,'Angelo De Jesus','angeloo@gmail.com',49),(301,'Karl Madrid','krlmdrd@gmail.com',50),(302,'Khalid Malo','kram@gmail.com',50),(303,'Dino Alcala','da@gmail.com',50),(304,'Angelo De Jesus','adj@gmail.com',50),(305,'Karl Madrid','krlmdrd@gmail.com',51),(306,'Dino Alcala','da@gmail.com',51),(307,'Angelo De Jesus','adj@gmail.com',51),(308,'Khalid Malo','kram@gmail.com',51),(309,'Ariana Grande','ag@gmail.com',52),(310,'Taylor Swift','ts@gmail.com',52),(311,'Nicki Minaj','nj@gmail.com',52),(312,'Cardi Bee','cb@gmail.com',52),(313,'Shaq Onel','shaq@gmail.com',53),(314,'Michael Bee','mb@gmail.com',53),(315,'Karol Cruz','kcee@gmail.com',53),(316,'Abigail De Jesus','abj@gmail.com',53),(317,'Carmen Rippey','cr@gmail.com',54),(318,'Kae Geneciran','kg@gmail.com',54),(319,'Alex Munoz','am@gmail.com',54),(320,'Angelica Munoz','am2@gmail.com',54),(321,'David Cook','dc@gmail.com',55),(322,'David Archuleta','daa@gmail.com',55),(323,'Dana Aquino','daaa@gmail.com',55),(324,'Danille Cruz','dceee@gmail.com',55),(325,'Karl Madrid','krlmdrd@gmail.com',56),(326,'Angelo De Jesus','adj@gmail.com',56),(327,'Dino Alcala','da@gmail.com',56),(328,'Khalid Malo','kram@gmail.com',56),(329,'Bea Santos','bs@gmail.com',57),(330,'Dana Aquino','daa@gmail.com',57),(331,'Kristin Te','ktee@gmail.com',57),(332,'Kyra Velasco','kv@gmail.com',57);
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
) ENGINE=InnoDB AUTO_INCREMENT=141 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ffproposal_expenses`
--

LOCK TABLES `ffproposal_expenses` WRITE;
/*!40000 ALTER TABLE `ffproposal_expenses` DISABLE KEYS */;
INSERT INTO `ffproposal_expenses` VALUES (123,'Faith Equipment',3000,1,NULL,41,3000,'2001-01-01 00:00:00'),(124,'Activity Equipment',2000,1,NULL,42,2000,'2001-01-01 00:00:00'),(125,'Activity Equipment',2000,1,NULL,43,2000,'2001-01-01 00:00:00'),(126,'Activity Equipment',2000,1,NULL,44,2000,'2001-01-01 00:00:00'),(127,'Activity Equipment',5000,1,NULL,45,5000,'2001-01-01 00:00:00'),(128,'Food',5000,1,NULL,45,5000,'2001-01-01 00:00:00'),(129,'Activity Equipment',2000,1,NULL,46,2000,'2001-01-01 00:00:00'),(130,'Activity Equipment',2000,1,NULL,47,2000,'2001-01-01 00:00:00'),(131,'Activity Equipment',2000,1,NULL,48,2000,'2001-01-01 00:00:00'),(132,'Activity Equipment',2000,1,NULL,49,2000,'2001-01-01 00:00:00'),(133,'Food',2000,1,NULL,50,2000,'2001-01-01 00:00:00'),(134,'Activity Equipment',2000,1,NULL,51,2000,'2001-01-01 00:00:00'),(135,'Activity Equipment',2000,1,NULL,52,2000,'2001-01-01 00:00:00'),(136,'Activity Equipment',2000,1,NULL,53,2000,'2001-01-01 00:00:00'),(137,'Activity Equipment',2000,1,NULL,54,2000,'2001-01-01 00:00:00'),(138,'Activity Equipment',2000,1,NULL,55,2000,'2001-01-01 00:00:00'),(139,'Activity Equipment',2000,1,NULL,56,2000,'2001-01-01 00:00:00'),(140,'Activity Equipment',2000,1,NULL,57,2000,'2001-01-01 00:00:00');
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
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ffreport`
--

LOCK TABLES `ffreport` WRITE;
/*!40000 ALTER TABLE `ffreport` DISABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=197 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ffreport_attendees`
--

LOCK TABLES `ffreport_attendees` WRITE;
/*!40000 ALTER TABLE `ffreport_attendees` DISABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ffreport_attendees_temp`
--

LOCK TABLES `ffreport_attendees_temp` WRITE;
/*!40000 ALTER TABLE `ffreport_attendees_temp` DISABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ffreport_funds`
--

LOCK TABLES `ffreport_funds` WRITE;
/*!40000 ALTER TABLE `ffreport_funds` DISABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ffreport_objectives`
--

LOCK TABLES `ffreport_objectives` WRITE;
/*!40000 ALTER TABLE `ffreport_objectives` DISABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `goal`
--

LOCK TABLES `goal` WRITE;
/*!40000 ALTER TABLE `goal` DISABLE KEYS */;
INSERT INTO `goal` VALUES (1,1,'KRA3-G1 - Implement sustainable, holistic, and developmental Lasallian formation across all sectors based on the Lasallian guiding principles',1),(2,2,'KRA3-G2 - Create a conducive environment that helps bridge faith and scholarship',1),(3,3,'KRA3-G3 - Create and nurture communities dedicated to promoting the Lasallian mission and spirituality',1),(4,1,'KRA5-G1 - Each unit of the University has at least one sustainable social engagement project',2),(5,2,'KRA5-G2 - Service Learning is institutionalized',2),(6,3,'KRA5-G3 - The University contributes to the localization of the Sustainable Development Goals (SDGs)',2),(7,3,'KRA5-G4 - The Lasallian Community works towards becoming better Stewards of God\'s Creation and the restoration of the ingerity of creation',2),(8,1,'KRA3-G1 - Implement sustainable, holistic and developmental Lasallian formation across all sectors based on the Lasallian Guiding Principles',3),(9,2,'KRA3-G2 - Create a conducive environment that helps bridge faith and scholarship',3),(12,1,'KRA5-G1 - Each unit of the University has at least one sustainable social engagement project',6),(13,2,'KRA5-G2 - Service Learning is Institutionalized',6);
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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kra`
--

LOCK TABLES `kra` WRITE;
/*!40000 ALTER TABLE `kra` DISABLE KEYS */;
INSERT INTO `kra` VALUES (1,'KRA3 - Formation for all sectors that is truly Lasallian','2018-10-06',71),(2,'KRA5 - Community that is attuned to a sustainable Earth and socially engaged','2018-10-06',71),(3,'KRA3 - Formation for all sectors that is truly Lasallian','2019-02-19',74),(6,'KRA5 - Community that is attuned to a sustainable Earth and socially engaged','2019-02-21',74);
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
  `kraID` int(11) DEFAULT NULL,
  `goalID` int(11) DEFAULT NULL,
  `numtarget` int(11) DEFAULT NULL,
  `numtypetarget` varchar(45) DEFAULT NULL,
  `unittarget` varchar(45) DEFAULT NULL,
  `typetarget` varchar(100) DEFAULT NULL,
  `engagingtarget` varchar(45) DEFAULT NULL,
  `untrackable` int(1) DEFAULT NULL,
  PRIMARY KEY (`measureID`),
  KEY `LA7_idx` (`kraID`),
  KEY `LA8_idx` (`goalID`),
  CONSTRAINT `LA7` FOREIGN KEY (`kraID`) REFERENCES `kra` (`kraID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `LA8` FOREIGN KEY (`goalID`) REFERENCES `goal` (`goalID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `measure`
--

LOCK TABLES `measure` WRITE;
/*!40000 ALTER TABLE `measure` DISABLE KEYS */;
INSERT INTO `measure` VALUES (1,'KRA3-G1-M1','Integration in curricular and co-curricular programs of formation based on Lasallian sprituality and mission',1,1,NULL,NULL,NULL,NULL,NULL,NULL),(2,'KRA3-G1-M2','Participation of administrators, faculty, and personnel in Lasallian formation activity',1,1,NULL,NULL,NULL,NULL,NULL,NULL),(3,'KRA3-G1-M3','Number of Lasallian formation activities available for other sectors in the DLSU community',1,1,NULL,NULL,NULL,NULL,NULL,NULL),(4,'KRA3-G2-M1 ','Number of fora and other interdisciplinary activities focused on bridging faith and scholarship (e.g. ethics, heritage, culture, science, theology, philosophy)',1,2,NULL,NULL,NULL,NULL,NULL,NULL),(5,'KRA3-G2-M2 ','Integration of faith dimension using the Lasallian Reflection Framework (LRF) in GE courses',1,2,NULL,NULL,NULL,NULL,NULL,NULL),(6,'KRA3-G2-M3 ','Participation of international students in co-curricular activities promoting interfaith and multicultural diversity',1,2,NULL,NULL,NULL,NULL,NULL,NULL),(7,'KRA3-G3-M1 ','Number of Lasallian communities committed to the Lasallian mission',1,3,NULL,NULL,NULL,NULL,NULL,NULL),(8,'KRA5-G1-M1 ','Number of sustainable social engagement project of units',2,4,NULL,NULL,NULL,NULL,NULL,NULL),(9,'KRA5-G1-M2 ','Involvement of faculty, student, and personnel in DLSU community engagement programs and activities A. Percentage of student organizations involved in community engagement programs and activities B. Percentage of staff engaged in community engagement programs and activities C. Percentage of departments with community engagement projects',2,4,NULL,NULL,NULL,NULL,NULL,NULL),(10,'KRA5-G1-M3 ','Number of social engagement choices under the four components of the Sustainable Development Goals Localization Project - L-ARAL (Education) - L-SEED (Social Enterprise) - L-Envisage (Environment/DRR) - L-HEARTS (Health and Wellness)',2,4,NULL,NULL,NULL,NULL,NULL,NULL),(11,'KRA5-G2-M1 ','Service learning (SL) components of academic programs A. Percentage of undergraduate programs with SL component B. Percentage of graduate programs with SL component',2,5,NULL,NULL,NULL,NULL,NULL,NULL),(12,'KRA5-G2-M2 ','Number of international SL activities',2,5,NULL,NULL,NULL,NULL,NULL,NULL),(13,'KRA5-G2-M3 ','Student satisfaction in service learning experience',2,5,NULL,NULL,NULL,NULL,NULL,NULL),(14,'KRA5-G3-M1 ','Percentage of members of Lasallian Community engaged in activities related to the realization of the SDGs',2,6,NULL,NULL,NULL,NULL,NULL,NULL),(15,'KRA5-G3-M2 ','Number of public engagements that allows sharing of expertise for the realization of the SDGs',2,6,NULL,NULL,NULL,NULL,NULL,NULL),(16,'KRA5-G3-M3','Metrics to gauge SD impact of DLSU initiatives',2,6,NULL,NULL,NULL,NULL,NULL,NULL),(17,'KRA5-G4-M1 ','Compliance with green building standards for both existing and new construction',2,7,NULL,NULL,NULL,NULL,NULL,NULL),(18,'KRA5-G4-M2','Resource use efficiency (i.e. material resources, utilities, etc.)',2,7,NULL,NULL,NULL,NULL,NULL,NULL),(19,'KRA5-G4-M3 ','University\'s per Capita Carbon Footprint',2,7,NULL,NULL,NULL,NULL,NULL,NULL),(20,'KRA5-G4-M4 ','Percentage of total energy requirements provided by alternative energy sources',2,7,NULL,NULL,NULL,NULL,NULL,NULL),(21,'KRA5-G4-M5 ','University\'s per Capita Water Footprint',2,7,NULL,NULL,NULL,NULL,NULL,NULL),(22,'KRA5-G4-M6 ','Percentage of spaces dedicated to biodiversity \'green zones\' and open spaces',2,7,NULL,NULL,NULL,NULL,NULL,NULL),(23,'KRA3-G1-M1','Integration in curricular and co-curricular programs of formation based on Lasallian spirituality and mission',3,8,50,'Percent','Student Organizations','Faith Formation','N/A',NULL),(24,'KRA3-G1-M2A','Participation of administrators, faculty and personnel in Lasallian formation activity',3,8,50,'Percent','Faculty Departments','Faith Formation','N/A',NULL),(25,'KRA3-G1-M2B','Participation of administrators, faculty and personnel in Lasallian formation activity',3,8,75,'Percent','Staff','Faith Formation','N/A',NULL),(26,'KRA3-G1-M2C','Participation of administrators, faculty and personnel in Lasallian formation activity',3,8,100,'Percent','Administrators','Faith Formation','N/A',NULL),(28,'KRA3-G1-M3A','Number of Lasallian formation activities available for other sectors in the DLSU community',3,8,1,'Count','No Specified Unit','Faith Formation','Alumni',NULL),(29,'KRA3-G1-M3B','Number of Lasallian formation activities available for other sectors in the DLSU community',3,8,1,'Count','No Specified Unit','Faith Formation','Parents',NULL),(30,'KRA3-G2-M1 ','Number of fora and other interdisciplinary activities focused on bridging faith and scholarship (e.g. ethics, heritage, culture, science, theology, philosophy)',3,9,1,'Count','No Specified Unit','Interdisciplinary Fora','N/A',NULL),(31,'KRA3-G2-M2','Participation of international students in co-curricular activities promoting interfaith and multicultural diversity',3,9,50,'Percent','International Students','Interdisciplinary Fora','N/A',NULL),(37,'KRA5-G1-M1','Number of sustainable social engagement project of units',6,12,20,'Percent','SE Programs Per Unit','Sustainable SE','N/A',NULL),(38,'KRA5-G1-M2','Involvement of faculty, student, and personnel in DLSU community engagement programs and activities',6,12,0,'untrackable','untrackable','untrackable','untrackable',NULL),(39,'KRA5-G1-M2A','Percentage of student organizations involved in community engagement programs and activities',6,12,50,'Percent','Student Organizations','Social Engagement','N/A',NULL),(40,'KRA5-G1-M2B','Percentage of staff engaged in community engagement programs and activities',6,12,50,'Percent','Staff','Social Engagement','N/A',NULL),(41,'KRA5-G1-M2C','Percentage of departments with community engagement project',6,12,20,'Percent','Departments','Social Engagement','N/A',NULL),(42,'KRA5-G1-M3','Number of social engagement choices under the four components of the Sustainable Development Goals Localization Project: - L-ARAL, (Education) - L-SEED (Social Enterprise) \r - L-Envisage (Environment / DRR) - L-HEARTS (Health and Wellness) ',6,12,16,'Count','No Specified Unit','Sustainable Development Goals Localization Project','N/A',NULL),(43,'KRA5-G2-M1','Number of international SL activities',6,13,1,'Count','No Specified Unit','Service-Learning','International Communities',NULL);
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
  `redirect` varchar(45) DEFAULT NULL,
  `attribute` int(11) DEFAULT NULL,
  `userID` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `LA14_idx` (`userID`),
  CONSTRAINT `LA14` FOREIGN KEY (`userID`) REFERENCES `informationsheet` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=572 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notification`
--

LOCK TABLES `notification` WRITE;
/*!40000 ALTER TABLE `notification` DISABLE KEYS */;
INSERT INTO `notification` VALUES (130,'SE Proposal ready for approval','Program: SE Testing\n2019-02-12 23:08','2019-02-12 23:08:35','/SIGNATORIES-approveSEProposal.jsp',30,87),(131,'SE Proposal ready for approval','Program: Sample 1\n2019-02-12 23:11','2019-02-12 23:11:22','/SIGNATORIES-approveSEProposal.jsp',31,87),(132,'SE Proposal ready for Approval','Program: Sample 1\n2019-02-12 23:11','2019-02-12 23:11:59','/SIGNATORIES-approveSEProposal2.jsp',31,82),(133,'SE Proposal Approved','Sample 1 approved the Department Chair! It will now be taken to the ADEALM.\n2019-02-12 23:11','2019-02-12 23:11:59','/MULTIPLE-viewPendingSEProgramDetails.jsp',31,85),(134,'SE Proposal ready for Approval','Program: Sample 1\n2019-02-12 23:12','2019-02-12 23:12:19','/SIGNATORIES-approveSEProposal3.jsp',31,81),(135,'SE Proposal Approved','Sample 1 approved by the ADEALM! It will now be taken to the Dean.\n2019-02-12 23:12','2019-02-12 23:12:19','/MULTIPLE-viewPendingSEProgramDetails.jsp',31,85),(136,'SE Proposal ready for Approval','Program: Sample 1\n2019-02-12 23:12','2019-02-12 23:12:45','/SIGNATORIES-approveSEProposal3.jsp',31,75),(137,'SE Proposal Approved','Sample 1 has been approved by the Dean! It will now be taken to COSCA.\n2019-02-12 23:12','2019-02-12 23:12:45','/MULTIPLE-viewPendingSEProgramDetails.jsp',31,85),(138,'SE Proposal ready for Approval','Program: Sample 1\n2019-02-12 23:13','2019-02-12 23:13:23','/MULTIPLE-approveSEProposal4.jsp',31,76),(139,'SE Proposal ready for Approval','Program: Sample 1\n2019-02-12 23:13','2019-02-12 23:13:23','/MULTIPLE-approveSEProposal4.jsp',31,77),(140,'SE Proposal ready for Approval','Program: Sample 1\n2019-02-12 23:13','2019-02-12 23:13:23','/MULTIPLE-approveSEProposal4.jsp',31,79),(141,'SE Proposal ready for Approval','Program: Sample 1\n2019-02-12 23:13','2019-02-12 23:13:23','/MULTIPLE-approveSEProposal4.jsp',31,78),(142,'SE Proposal ready for Approval','Program: Sample 1\n2019-02-12 23:13','2019-02-12 23:13:23','/MULTIPLE-approveSEProposal4.jsp',31,74),(143,'Sample 1','Sample 1 has been approved by COSCA. It will now be taken to the LMC Council.\n2019-02-12 23:13:23','2019-02-12 23:13:23','/MULTIPLE-viewPendingSEProgramDetails.jsp',31,85),(144,'SE Proposal for Revision','SE Testing has some revisions before it is approved by the Department Chair.\n2019-02-18 12:53','2019-02-18 12:53:01','/MULTIPLE-viewPendingSEProgramDetails.jsp',30,85),(145,'Urgent SE Proposal ready for Approval','Program: Notif Testing 3\n2019-02-18 13:16','2019-02-18 13:16:41','/SIGNATORIES-approveSEProposal.jsp',32,80),(146,'Proposal Approval Count: Sample 1','Michael Broughton has approved your proposal. Count: 1/5\n2019-02-18 13:36','2019-02-18 13:36:25','/MULTIPLE-viewPendingSEProgramDetails.jsp',31,85),(147,'Proposal Approval Count: Sample 1','Michael Broughton has approved your proposal. Count: 1/5\n2019-02-18 13:36','2019-02-18 13:36:25','/MULTIPLE-viewPendingSEProgramDetails.jsp',31,71),(148,'Proposal Approval Count: Sample 1','Michael Broughton has approved your proposal. Count: 1/5\n2019-02-18 13:36','2019-02-18 13:36:25','/MULTIPLE-viewPendingSEProgramDetails.jsp',31,74),(149,'Proposal Approval Count: Sample 1','Michael Broughton has approved your proposal. Count: 1/5\n2019-02-18 13:36','2019-02-18 13:36:25','/MULTIPLE-viewPendingSEProgramDetails.jsp',31,243),(150,'Proposal Approval Count: Sample 1','Fritzie De Vera has approved your proposal. Count: 2/5\n2019-02-18 13:36','2019-02-18 13:36:42','/MULTIPLE-viewPendingSEProgramDetails.jsp',31,85),(151,'Proposal Approval Count: Sample 1','Fritzie De Vera has approved your proposal. Count: 2/5\n2019-02-18 13:36','2019-02-18 13:36:42','/MULTIPLE-viewPendingSEProgramDetails.jsp',31,71),(152,'Proposal Approval Count: Sample 1','Fritzie De Vera has approved your proposal. Count: 2/5\n2019-02-18 13:36','2019-02-18 13:36:42','/MULTIPLE-viewPendingSEProgramDetails.jsp',31,74),(153,'Proposal Approval Count: Sample 1','Fritzie De Vera has approved your proposal. Count: 2/5\n2019-02-18 13:36','2019-02-18 13:36:42','/MULTIPLE-viewPendingSEProgramDetails.jsp',31,243),(154,'Proposal Approval Count: Sample 1','Margarita Perdido has approved your proposal. Count: 3/5\n2019-02-18 13:37','2019-02-18 13:37:14','/MULTIPLE-viewPendingSEProgramDetails.jsp',31,85),(155,'Proposal Approval Count: Sample 1','Margarita Perdido has approved your proposal. Count: 3/5\n2019-02-18 13:37','2019-02-18 13:37:14','/MULTIPLE-viewPendingSEProgramDetails.jsp',31,71),(156,'Proposal Approval Count: Sample 1','Margarita Perdido has approved your proposal. Count: 3/5\n2019-02-18 13:37','2019-02-18 13:37:14','/MULTIPLE-viewPendingSEProgramDetails.jsp',31,74),(157,'Proposal Approval Count: Sample 1','Margarita Perdido has approved your proposal. Count: 3/5\n2019-02-18 13:37','2019-02-18 13:37:14','/MULTIPLE-viewPendingSEProgramDetails.jsp',31,243),(158,'Proposal Approval Count: Sample 1','James Laxa has approved your proposal. Count: 4/5\n2019-02-18 13:37','2019-02-18 13:37:49','/MULTIPLE-viewPendingSEProgramDetails.jsp',31,85),(159,'Proposal Approval Count: Sample 1','James Laxa has approved your proposal. Count: 4/5\n2019-02-18 13:37','2019-02-18 13:37:49','/MULTIPLE-viewPendingSEProgramDetails.jsp',31,71),(160,'Proposal Approval Count: Sample 1','James Laxa has approved your proposal. Count: 4/5\n2019-02-18 13:37','2019-02-18 13:37:49','/MULTIPLE-viewPendingSEProgramDetails.jsp',31,74),(161,'Proposal Approval Count: Sample 1','James Laxa has approved your proposal. Count: 4/5\n2019-02-18 13:37','2019-02-18 13:37:49','/MULTIPLE-viewPendingSEProgramDetails.jsp',31,243),(162,'Proposal Approval Count: Sample 1','Nelca Villarin has approved your proposal. Count: 5/5\n2019-02-18 13:38','2019-02-18 13:38:14','/MULTIPLE-viewPendingSEProgramDetails.jsp',31,85),(163,'Proposal Approval Count: Sample 1','Nelca Villarin has approved your proposal. Count: 5/5\n2019-02-18 13:38','2019-02-18 13:38:14','/MULTIPLE-viewPendingSEProgramDetails.jsp',31,71),(164,'Proposal Approval Count: Sample 1','Nelca Villarin has approved your proposal. Count: 5/5\n2019-02-18 13:38','2019-02-18 13:38:14','/MULTIPLE-viewPendingSEProgramDetails.jsp',31,74),(165,'Proposal Approval Count: Sample 1','Nelca Villarin has approved your proposal. Count: 5/5\n2019-02-18 13:38','2019-02-18 13:38:14','/MULTIPLE-viewPendingSEProgramDetails.jsp',31,243),(166,'Urgent SE Proposal Approved by Council','Sample 1: You may now upload the PRS for endorsement.\n2019-02-18 13:38','2019-02-18 13:38:15','/MULTIPLE-viewPendingSEProgramDetails.jsp',31,85),(167,'Urgent SE PRS ready for Approval','Program: Sample 1\n2019-02-18 13:39','2019-02-18 13:39:25','/MULTIPLE-approveSEProposal5.jsp',31,74),(168,'Urguent SE Proposal Approved','Program: Sample 1\n2019-02-18 13:39','2019-02-18 13:39:45','/MULTIPLE-viewPendigSEProgramDetails.jsp',31,85),(169,'Program Approved','Program: Sample 1: Php5000.0 has been deducted to the budget\n2019-02-18 13:39','2019-02-18 13:39:45','/MULTIPLE-viewSEProgramDetails.jsp',31,74),(170,'Program Approved','Program: Sample 1: Php5000.0 has been deducted to the budget\n2019-02-18 13:39','2019-02-18 13:39:45','/MULTIPLE-viewSEProgramDetails.jsp',31,71),(171,'Program Approved','Program: Sample 1: Php5000.0 has been deducted to the budget\n2019-02-18 13:39','2019-02-18 13:39:45','/MULTIPLE-viewSEProgramDetails.jsp',31,243),(172,'Budget Updated','Sample 1: A portion of the budget has been used\n2019-02-18 13:48','2019-02-18 13:48:41','/MULTIPLE-viewSEProgramDetails.jsp',31,74),(173,'Budget Updated','Sample 1: A portion of the budget has been used\n2019-02-18 13:48','2019-02-18 13:48:41','/MULTIPLE-viewSEProgramDetails.jsp',31,71),(174,'Budget Updated','Sample 1: A portion of the budget has been used\n2019-02-18 13:48','2019-02-18 13:48:41','/MULTIPLE-viewSEProgramDetails.jsp',31,243),(175,'Evaluation Received','Sample 1: 100% of Attendees have now Evaluated!\n2019-02-18 13:52','2019-02-18 13:52:12','/MULTIPLE-viewSEResponses.jsp',31,74),(176,'Evaluation Received','Sample 1: 100% of Attendees have now Evaluated!\n2019-02-18 13:52','2019-02-18 13:52:12','/MULTIPLE-viewSEResponses.jsp',31,71),(177,'Evaluation Received','Sample 1: 100% of Attendees have now Evaluated!\n2019-02-18 13:52','2019-02-18 13:52:12','/MULTIPLE-viewSEResponses.jsp',31,243),(178,'Evaluation Received','Sample 1: 100% of Attendees have now Evaluated!\n2019-02-18 13:52','2019-02-18 13:52:12','/MULTIPLE-viewSEResponses.jsp',31,85),(179,'Student Org SE Proposal Submitted',': 5000.0 has been deducted to the budget!\n2019-02-21 16:27','2019-02-21 16:27:46','/MULTIPLE-viewBudget.jsp',0,74),(180,'Student Org SE Proposal Submitted',': 5000.0 has been deducted to the budget!\n2019-02-21 16:27','2019-02-21 16:27:46','/MULTIPLE-viewBudget.jsp',0,71),(181,'Student Org SE Proposal Submitted',': 5000.0 has been deducted to the budget!\n2019-02-21 16:27','2019-02-21 16:27:46','/MULTIPLE-viewBudget.jsp',0,243),(182,'Budget Updated','Outreach for the Marginalized: A portion of the budget has been used\n2019-02-21 16:31','2019-02-21 16:31:39','/MULTIPLE-viewSEProgramDetails.jsp',33,74),(183,'Budget Updated','Outreach for the Marginalized: A portion of the budget has been used\n2019-02-21 16:31','2019-02-21 16:31:39','/MULTIPLE-viewSEProgramDetails.jsp',33,71),(184,'Budget Updated','Outreach for the Marginalized: A portion of the budget has been used\n2019-02-21 16:31','2019-02-21 16:31:39','/MULTIPLE-viewSEProgramDetails.jsp',33,243),(185,'Evaluation Received','Outreach for the Marginalized: 100% of Attendees have now Evaluated!\n2019-02-21 16:33','2019-02-21 16:33:13','/MULTIPLE-viewSEResponses.jsp',33,74),(186,'Evaluation Received','Outreach for the Marginalized: 100% of Attendees have now Evaluated!\n2019-02-21 16:33','2019-02-21 16:33:13','/MULTIPLE-viewSEResponses.jsp',33,71),(187,'Evaluation Received','Outreach for the Marginalized: 100% of Attendees have now Evaluated!\n2019-02-21 16:33','2019-02-21 16:33:13','/MULTIPLE-viewSEResponses.jsp',33,243),(188,'Evaluation Received','Outreach for the Marginalized: 100% of Attendees have now Evaluated!\n2019-02-21 16:33','2019-02-21 16:33:13','/MULTIPLE-viewSEResponses.jsp',33,78),(189,'Accomplishment Report Submitted','Program: Outreach for the Marginalized\n2019-02-21 16:39','2019-02-21 16:39:16','/MULTIPLE-viewSEReport.jsp',33,74),(190,'Accomplishment Report Submitted','Program: Outreach for the Marginalized\n2019-02-21 16:39','2019-02-21 16:39:16','/MULTIPLE-viewSEReport.jsp',33,71),(191,'Accomplishment Report Submitted','Program: Outreach for the Marginalized\n2019-02-21 16:39','2019-02-21 16:39:16','/MULTIPLE-viewSEReport.jsp',33,243),(192,'Student Org SE Proposal Submitted',': 5000.0 has been deducted to the budget!\n2019-02-21 17:50','2019-02-21 17:50:26','/MULTIPLE-viewBudget.jsp',0,74),(193,'Student Org SE Proposal Submitted',': 5000.0 has been deducted to the budget!\n2019-02-21 17:50','2019-02-21 17:50:26','/MULTIPLE-viewBudget.jsp',0,71),(194,'Student Org SE Proposal Submitted',': 5000.0 has been deducted to the budget!\n2019-02-21 17:50','2019-02-21 17:50:26','/MULTIPLE-viewBudget.jsp',0,243),(195,'Budget Updated','Reachout for the Poor: A portion of the budget has been used\n2019-02-21 17:50','2019-02-21 17:50:39','/MULTIPLE-viewSEProgramDetails.jsp',34,74),(196,'Budget Updated','Reachout for the Poor: A portion of the budget has been used\n2019-02-21 17:50','2019-02-21 17:50:39','/MULTIPLE-viewSEProgramDetails.jsp',34,71),(197,'Budget Updated','Reachout for the Poor: A portion of the budget has been used\n2019-02-21 17:50','2019-02-21 17:50:39','/MULTIPLE-viewSEProgramDetails.jsp',34,243),(198,'Evaluation Received','Reachout for the Poor: 100% of Attendees have now Evaluated!\n2019-02-21 17:52','2019-02-21 17:52:02','/MULTIPLE-viewSEResponses.jsp',34,74),(199,'Evaluation Received','Reachout for the Poor: 100% of Attendees have now Evaluated!\n2019-02-21 17:52','2019-02-21 17:52:02','/MULTIPLE-viewSEResponses.jsp',34,71),(200,'Evaluation Received','Reachout for the Poor: 100% of Attendees have now Evaluated!\n2019-02-21 17:52','2019-02-21 17:52:02','/MULTIPLE-viewSEResponses.jsp',34,243),(201,'Evaluation Received','Reachout for the Poor: 100% of Attendees have now Evaluated!\n2019-02-21 17:52','2019-02-21 17:52:02','/MULTIPLE-viewSEResponses.jsp',34,78),(202,'Accomplishment Report Submitted','Program: Reachout for the Poor\n2019-02-21 17:52','2019-02-21 17:52:44','/MULTIPLE-viewSEReport.jsp',34,74),(203,'Accomplishment Report Submitted','Program: Reachout for the Poor\n2019-02-21 17:52','2019-02-21 17:52:44','/MULTIPLE-viewSEReport.jsp',34,71),(204,'Accomplishment Report Submitted','Program: Reachout for the Poor\n2019-02-21 17:52','2019-02-21 17:52:44','/MULTIPLE-viewSEReport.jsp',34,243),(205,'Student Org FF Proposal Submitted',': 5000.0 has been deducted to the budget!\n2019-02-21 22:12','2019-02-21 22:12:57','/MULTIPLE-viewPendingFFProgramDetails.jsp',0,74),(206,'Student Org FF Proposal Submitted',': 5000.0 has been deducted to the budget!\n2019-02-21 22:12','2019-02-21 22:12:57','/MULTIPLE-viewPendingFFProgramDetails.jsp',0,71),(207,'Student Org FF Proposal Submitted',': 5000.0 has been deducted to the budget!\n2019-02-21 22:12','2019-02-21 22:12:57','/MULTIPLE-viewPendingFFProgramDetails.jsp',0,243),(208,'Student Org FF Proposal Submitted',': 5000.0 has been deducted to the budget!\n2019-02-21 22:14','2019-02-21 22:14:59','/MULTIPLE-viewPendingFFProgramDetails.jsp',0,74),(209,'Student Org FF Proposal Submitted',': 5000.0 has been deducted to the budget!\n2019-02-21 22:14','2019-02-21 22:14:59','/MULTIPLE-viewPendingFFProgramDetails.jsp',0,71),(210,'Student Org FF Proposal Submitted',': 5000.0 has been deducted to the budget!\n2019-02-21 22:14','2019-02-21 22:14:59','/MULTIPLE-viewPendingFFProgramDetails.jsp',0,243),(211,'Budget Updated','dsadsad: A portion of the budget has been used\n2019-02-21 22:15','2019-02-21 22:15:31','/MULTIPLE-viewFFProgramDetails.jsp',39,74),(212,'Budget Updated','dsadsad: A portion of the budget has been used\n2019-02-21 22:15','2019-02-21 22:15:31','/MULTIPLE-viewFFProgramDetails.jsp',39,71),(213,'Budget Updated','dsadsad: A portion of the budget has been used\n2019-02-21 22:15','2019-02-21 22:15:31','/MULTIPLE-viewFFProgramDetails.jsp',39,243),(214,'Evaluation Received','dsadsad: 50% of Attendees have now Evaluated!\n2019-02-21 22:17','2019-02-21 22:17:38','/MULTIPLE-viewFFResponses.jsp',39,74),(215,'Evaluation Received','dsadsad: 50% of Attendees have now Evaluated!\n2019-02-21 22:17','2019-02-21 22:17:38','/MULTIPLE-viewFFResponses.jsp',39,71),(216,'Evaluation Received','dsadsad: 50% of Attendees have now Evaluated!\n2019-02-21 22:17','2019-02-21 22:17:38','/MULTIPLE-viewFFResponses.jsp',39,243),(217,'Evaluation Received','dsadsad: 50% of Attendees have now Evaluated!\n2019-02-21 22:17','2019-02-21 22:17:38','/MULTIPLE-viewFFResponses.jsp',39,78),(218,'Evaluation Received','dsadsad: 100% of Attendees have now Evaluated!\n2019-02-21 22:17','2019-02-21 22:17:54','/MULTIPLE-viewFFResponses.jsp',39,74),(219,'Evaluation Received','dsadsad: 100% of Attendees have now Evaluated!\n2019-02-21 22:17','2019-02-21 22:17:54','/MULTIPLE-viewFFResponses.jsp',39,71),(220,'Evaluation Received','dsadsad: 100% of Attendees have now Evaluated!\n2019-02-21 22:17','2019-02-21 22:17:54','/MULTIPLE-viewFFResponses.jsp',39,243),(221,'Evaluation Received','dsadsad: 100% of Attendees have now Evaluated!\n2019-02-21 22:17','2019-02-21 22:17:54','/MULTIPLE-viewFFResponses.jsp',39,78),(222,'Accomplishment Report Submitted','Program: dsadsad\n2019-02-21 22:18','2019-02-21 22:18:44','/MULTIPLE-viewFFReport.jsp',39,74),(223,'Accomplishment Report Submitted','Program: dsadsad\n2019-02-21 22:18','2019-02-21 22:18:44','/MULTIPLE-viewFFReport.jsp',39,71),(224,'Accomplishment Report Submitted','Program: dsadsad\n2019-02-21 22:18','2019-02-21 22:18:44','/MULTIPLE-viewFFReport.jsp',39,243),(225,'Urgent SE Proposal ready for Approval','Program: Sample Program 1\n2019-02-26 16:06','2019-02-26 16:06:25','/SIGNATORIES-approveSEProposal.jsp',35,87),(226,'Program: Sample FF \n2019-02-26 16:07','Urgent FF Proposal ready for Approval','2019-02-26 16:07:06','/SIGNATORIES-approveFFProposal.jsp',40,183),(227,'SE Proposal for Revision','Sample Program 1 has some revisions before it is approved by the Department Chair.\n2019-02-26 16:12','2019-02-26 16:12:55','/MULTIPLE-viewPendingSEProgramDetails.jsp',35,85),(228,'Revised SE Proposal ready for Approval','Program: Sample Program 1\n2019-02-26 17:39','2019-02-26 17:39:45','/SIGNATORIES-approveSEProposal.jsp',35,87),(229,'Urgent SE Proposal ready for Approval','Program: Sample Program 1\n2019-02-26 17:44','2019-02-26 17:44:57','/SIGNATORIES-approveSEProposal2.jsp',35,82),(230,'SE Proposal Approved','Sample Program 1 approved the Department Chair! It will now be taken to the ADEALM.\n2019-02-26 17:44','2019-02-26 17:44:57','/MULTIPLE-viewPendingSEProgramDetails.jsp',35,85),(231,'Urgent SE Proposal ready for Approval','Program: Sample Program 1\n2019-02-26 17:45','2019-02-26 17:45:09','/SIGNATORIES-approveSEProposal3.jsp',35,81),(232,'SE Proposal Approved','Sample Program 1 approved by the ADEALM! It will now be taken to the Dean.\n2019-02-26 17:45','2019-02-26 17:45:09','/MULTIPLE-viewPendingSEProgramDetails.jsp',35,85),(233,'Urgent SE Proposal ready for Approval','Program: Sample Program 1\n2019-02-26 17:45','2019-02-26 17:45:20','/SIGNATORIES-approveSEProposal3.jsp',35,75),(234,'SE Proposal Approved','Sample Program 1 has been approved by the Dean! It will now be taken to COSCA.\n2019-02-26 17:45','2019-02-26 17:45:20','/MULTIPLE-viewPendingSEProgramDetails.jsp',35,85),(235,'Urgent SE Proposal ready for Approval','Program: Sample Program 1\n2019-02-26 17:48','2019-02-26 17:48:18','/MULTIPLE-approveSEProposal4.jsp',35,76),(236,'Urgent SE Proposal ready for Approval','Program: Sample Program 1\n2019-02-26 17:48','2019-02-26 17:48:18','/MULTIPLE-approveSEProposal4.jsp',35,77),(237,'Urgent SE Proposal ready for Approval','Program: Sample Program 1\n2019-02-26 17:48','2019-02-26 17:48:18','/MULTIPLE-approveSEProposal4.jsp',35,79),(238,'Urgent SE Proposal ready for Approval','Program: Sample Program 1\n2019-02-26 17:48','2019-02-26 17:48:18','/MULTIPLE-approveSEProposal4.jsp',35,78),(239,'Urgent SE Proposal ready for Approval','Program: Sample Program 1\n2019-02-26 17:48','2019-02-26 17:48:18','/MULTIPLE-approveSEProposal4.jsp',35,74),(240,'Sample Program 1','Sample Program 1 has been approved by COSCA. It will now be taken to the LMC Council.\n2019-02-26 17:48:18','2019-02-26 17:48:18','/MULTIPLE-viewPendingSEProgramDetails.jsp',35,85),(241,'Proposal Approval Count: Sample Program 1','Michael Broughton has approved your proposal. Count: 1/5\n2019-02-26 17:52','2019-02-26 17:52:57','/MULTIPLE-viewPendingSEProgramDetails.jsp',35,85),(242,'Proposal Approval Count: Sample Program 1','Michael Broughton has approved your proposal. Count: 1/5\n2019-02-26 17:52','2019-02-26 17:52:57','/MULTIPLE-viewPendingSEProgramDetails.jsp',35,71),(243,'Proposal Approval Count: Sample Program 1','Michael Broughton has approved your proposal. Count: 1/5\n2019-02-26 17:52','2019-02-26 17:52:57','/MULTIPLE-viewPendingSEProgramDetails.jsp',35,74),(244,'Proposal Approval Count: Sample Program 1','Michael Broughton has approved your proposal. Count: 1/5\n2019-02-26 17:52','2019-02-26 17:52:57','/MULTIPLE-viewPendingSEProgramDetails.jsp',35,243),(245,'Proposal Approval Count: Sample Program 1','Fritzie De Vera has approved your proposal. Count: 2/5\n2019-02-26 17:53','2019-02-26 17:53:19','/MULTIPLE-viewPendingSEProgramDetails.jsp',35,85),(246,'Proposal Approval Count: Sample Program 1','Fritzie De Vera has approved your proposal. Count: 2/5\n2019-02-26 17:53','2019-02-26 17:53:19','/MULTIPLE-viewPendingSEProgramDetails.jsp',35,71),(247,'Proposal Approval Count: Sample Program 1','Fritzie De Vera has approved your proposal. Count: 2/5\n2019-02-26 17:53','2019-02-26 17:53:19','/MULTIPLE-viewPendingSEProgramDetails.jsp',35,74),(248,'Proposal Approval Count: Sample Program 1','Fritzie De Vera has approved your proposal. Count: 2/5\n2019-02-26 17:53','2019-02-26 17:53:19','/MULTIPLE-viewPendingSEProgramDetails.jsp',35,243),(249,'Proposal Approval Count: Sample Program 1','James Laxa has approved your proposal. Count: 3/5\n2019-02-26 17:53','2019-02-26 17:53:35','/MULTIPLE-viewPendingSEProgramDetails.jsp',35,85),(250,'Proposal Approval Count: Sample Program 1','James Laxa has approved your proposal. Count: 3/5\n2019-02-26 17:53','2019-02-26 17:53:35','/MULTIPLE-viewPendingSEProgramDetails.jsp',35,71),(251,'Proposal Approval Count: Sample Program 1','James Laxa has approved your proposal. Count: 3/5\n2019-02-26 17:53','2019-02-26 17:53:35','/MULTIPLE-viewPendingSEProgramDetails.jsp',35,74),(252,'Proposal Approval Count: Sample Program 1','James Laxa has approved your proposal. Count: 3/5\n2019-02-26 17:53','2019-02-26 17:53:35','/MULTIPLE-viewPendingSEProgramDetails.jsp',35,243),(253,'Proposal Approval Count: Sample Program 1','Margarita Perdido has approved your proposal. Count: 4/5\n2019-02-26 17:53','2019-02-26 17:53:53','/MULTIPLE-viewPendingSEProgramDetails.jsp',35,85),(254,'Proposal Approval Count: Sample Program 1','Margarita Perdido has approved your proposal. Count: 4/5\n2019-02-26 17:53','2019-02-26 17:53:53','/MULTIPLE-viewPendingSEProgramDetails.jsp',35,71),(255,'Proposal Approval Count: Sample Program 1','Margarita Perdido has approved your proposal. Count: 4/5\n2019-02-26 17:53','2019-02-26 17:53:53','/MULTIPLE-viewPendingSEProgramDetails.jsp',35,74),(256,'Proposal Approval Count: Sample Program 1','Margarita Perdido has approved your proposal. Count: 4/5\n2019-02-26 17:53','2019-02-26 17:53:53','/MULTIPLE-viewPendingSEProgramDetails.jsp',35,243),(257,'Proposal Approval Count: Sample Program 1','Nelca Villarin has approved your proposal. Count: 5/5\n2019-02-26 17:54','2019-02-26 17:54:16','/MULTIPLE-viewPendingSEProgramDetails.jsp',35,85),(258,'Proposal Approval Count: Sample Program 1','Nelca Villarin has approved your proposal. Count: 5/5\n2019-02-26 17:54','2019-02-26 17:54:16','/MULTIPLE-viewPendingSEProgramDetails.jsp',35,71),(259,'Proposal Approval Count: Sample Program 1','Nelca Villarin has approved your proposal. Count: 5/5\n2019-02-26 17:54','2019-02-26 17:54:16','/MULTIPLE-viewPendingSEProgramDetails.jsp',35,74),(260,'Proposal Approval Count: Sample Program 1','Nelca Villarin has approved your proposal. Count: 5/5\n2019-02-26 17:54','2019-02-26 17:54:16','/MULTIPLE-viewPendingSEProgramDetails.jsp',35,243),(261,'Urgent SE Proposal Approved by Council','Sample Program 1: You may now upload the PRS for endorsement.\n2019-02-26 17:54','2019-02-26 17:54:18','/MULTIPLE-viewPendingSEProgramDetails.jsp',35,85),(262,'Urgent SE PRS ready for Approval','Program: Sample Program 1\n2019-02-26 17:56','2019-02-26 17:56:09','/MULTIPLE-approveSEProposal5.jsp',35,74),(263,'Urguent SE Proposal Approved','Program: Sample Program 1\n2019-02-26 17:56','2019-02-26 17:56:25','/MULTIPLE-viewSEProgramDetails.jsp',35,85),(264,'Program Approved','Program: Sample Program 1: Php5000.0 has been deducted to the budget\n2019-02-26 17:56','2019-02-26 17:56:25','/MULTIPLE-viewSEProgramDetails.jsp',35,74),(265,'Program Approved','Program: Sample Program 1: Php5000.0 has been deducted to the budget\n2019-02-26 17:56','2019-02-26 17:56:25','/MULTIPLE-viewSEProgramDetails.jsp',35,71),(266,'Program Approved','Program: Sample Program 1: Php5000.0 has been deducted to the budget\n2019-02-26 17:56','2019-02-26 17:56:25','/MULTIPLE-viewSEProgramDetails.jsp',35,243),(267,'Budget Updated','Sample Program 1: A portion of the budget has been used\n2019-02-26 18:03','2019-02-26 18:03:00','/MULTIPLE-viewSEProgramDetails.jsp',35,74),(268,'Budget Updated','Sample Program 1: A portion of the budget has been used\n2019-02-26 18:03','2019-02-26 18:03:00','/MULTIPLE-viewSEProgramDetails.jsp',35,71),(269,'Budget Updated','Sample Program 1: A portion of the budget has been used\n2019-02-26 18:03','2019-02-26 18:03:00','/MULTIPLE-viewSEProgramDetails.jsp',35,243),(270,'Evaluation Received','Sample Program 1: 50% of Attendees have now Evaluated!\n2019-02-26 18:06','2019-02-26 18:06:22','/MULTIPLE-viewSEResponses.jsp',35,74),(271,'Evaluation Received','Sample Program 1: 50% of Attendees have now Evaluated!\n2019-02-26 18:06','2019-02-26 18:06:22','/MULTIPLE-viewSEResponses.jsp',35,71),(272,'Evaluation Received','Sample Program 1: 50% of Attendees have now Evaluated!\n2019-02-26 18:06','2019-02-26 18:06:22','/MULTIPLE-viewSEResponses.jsp',35,243),(273,'Evaluation Received','Sample Program 1: 50% of Attendees have now Evaluated!\n2019-02-26 18:06','2019-02-26 18:06:22','/MULTIPLE-viewSEResponses.jsp',35,85),(274,'Evaluation Received','Sample Program 1: 100% of Attendees have now Evaluated!\n2019-02-26 18:06','2019-02-26 18:06:48','/MULTIPLE-viewSEResponses.jsp',35,74),(275,'Evaluation Received','Sample Program 1: 100% of Attendees have now Evaluated!\n2019-02-26 18:06','2019-02-26 18:06:48','/MULTIPLE-viewSEResponses.jsp',35,71),(276,'Evaluation Received','Sample Program 1: 100% of Attendees have now Evaluated!\n2019-02-26 18:06','2019-02-26 18:06:48','/MULTIPLE-viewSEResponses.jsp',35,243),(277,'Evaluation Received','Sample Program 1: 100% of Attendees have now Evaluated!\n2019-02-26 18:06','2019-02-26 18:06:48','/MULTIPLE-viewSEResponses.jsp',35,85),(278,'Accomplishment Report Submitted','Program: Sample Program 1\n2019-02-26 18:13','2019-02-26 18:13:18','/MULTIPLE-viewSEReport.jsp',35,74),(279,'Accomplishment Report Submitted','Program: Sample Program 1\n2019-02-26 18:13','2019-02-26 18:13:18','/MULTIPLE-viewSEReport.jsp',35,71),(280,'Accomplishment Report Submitted','Program: Sample Program 1\n2019-02-26 18:13','2019-02-26 18:13:18','/MULTIPLE-viewSEReport.jsp',35,243),(281,'Urgent SE Proposal ready for Approval','Program: dsadsa\n2019-02-26 19:26','2019-02-26 19:26:48','/SIGNATORIES-approveSEProposal.jsp',36,88),(282,'Urgent SE Proposal ready for Approval','Program: CCS-IT Charity Donation 2019\n2019-03-02 19:08','2019-03-02 19:08:18','/SIGNATORIES-approveSEProposal.jsp',37,87),(283,'Urgent SE Proposal ready for Approval','Program: CCS-ST Feeding Program 2K19\n2019-03-02 19:24','2019-03-02 19:24:39','/SIGNATORIES-approveSEProposal.jsp',38,88),(284,'Program: CCS-CT Recollection 2019\n2019-03-02 19:27','FF Proposal ready for approval','2019-03-02 19:27:00','/SIGNATORIES-approveFFProposal.jsp',41,183),(285,'SE Proposal ready for approval','Program: CLA-BS Mental Health Sharing\n2019-03-02 19:32','2019-03-02 19:32:41','/SIGNATORIES-approveSEProposal.jsp',39,114),(286,'SE Proposal ready for approval','Program: CLA-COMM: How to be a leader?\n2019-03-02 19:54','2019-03-02 19:54:47','/SIGNATORIES-approveSEProposal.jsp',40,115),(287,'SE Proposal ready for approval','Program: CLA-LIT: A Good Researcher\n2019-03-02 19:57','2019-03-02 19:57:44','/SIGNATORIES-approveSEProposal.jsp',41,116),(288,'SE Proposal ready for approval','Program: CLA-FIL: Leader Training for the poor\n2019-03-02 20:03','2019-03-02 20:03:04','/SIGNATORIES-approveSEProposal.jsp',42,117),(289,'SE Proposal ready for approval','Program: CLA-HIS: Improving Critical Thinking\n2019-03-02 20:06','2019-03-02 20:06:53','/SIGNATORIES-approveSEProposal.jsp',43,118),(290,'SE Proposal ready for approval','Program: CLA-IS: Charity Donation 2019\n2019-03-02 20:09','2019-03-02 20:09:36','/SIGNATORIES-approveSEProposal.jsp',44,119),(291,'SE Proposal ready for approval','Program: CLA-PHILO: Issue Awareness 2019\n2019-03-02 20:11','2019-03-02 20:11:54','/SIGNATORIES-approveSEProposal.jsp',45,120),(292,'Program: CLA-POLSCI: Prayer Service\n2019-03-02 20:13','FF Proposal ready for approval','2019-03-02 20:13:24','/SIGNATORIES-approveFFProposal.jsp',42,193),(293,'Program: CLA-PSYCH: Spritual Talk 2019\n2019-03-02 20:16','FF Proposal ready for approval','2019-03-02 20:16:25','/SIGNATORIES-approveFFProposal.jsp',43,193),(294,'Program: CLA-TRED: Talk on the Life of Founder 2019\n2019-03-02 20:17','Urgent FF Proposal ready for Approval','2019-03-02 20:17:38','/SIGNATORIES-approveFFProposal.jsp',44,193),(295,'SE Proposal ready for approval','Program: RVRCOB-ACC: Accounting 101\n2019-03-02 20:21','2019-03-02 20:21:28','/SIGNATORIES-approveSEProposal.jsp',46,95),(296,'Urgent SE Proposal ready for Approval','Program: RVRCOB-CL: Charity Donation 2019\n2019-03-02 20:24','2019-03-02 20:24:16','/SIGNATORIES-approveSEProposal.jsp',47,96),(297,'SE Proposal ready for approval','Program: RVRCOB-DSID: The benefits of sunlight\n2019-03-02 20:27','2019-03-02 20:27:38','/SIGNATORIES-approveSEProposal.jsp',48,97),(298,'SE Proposal ready for approval','Program: Preparation for future problems\n2019-03-02 20:30','2019-03-02 20:30:30','/SIGNATORIES-approveSEProposal.jsp',49,98),(299,'Program: Retreat 2K19\n2019-03-02 20:32','FF Proposal ready for approval','2019-03-02 20:32:07','/SIGNATORIES-approveFFProposal.jsp',45,184),(300,'Program: Recollection 2K19\n2019-03-02 20:33','Urgent FF Proposal ready for Approval','2019-03-02 20:33:25','/SIGNATORIES-approveFFProposal.jsp',46,184),(301,'Program: SOE-IAE: Br. Gabriel Drolin Experience 2019\n2019-03-02 20:35','FF Proposal ready for approval','2019-03-02 20:35:29','/SIGNATORIES-approveFFProposal.jsp',47,218),(302,'Program: Spritual Talk 2K19\n2019-03-02 20:36','FF Proposal ready for approval','2019-03-02 20:36:47','/SIGNATORIES-approveFFProposal.jsp',48,218),(303,'SE Proposal ready for approval','Program: SOE-LAE: School Teaching 2019\n2019-03-02 20:40','2019-03-02 20:40:37','/SIGNATORIES-approveSEProposal.jsp',50,134),(304,'SE Proposal ready for approval','Program: SOE-MFI: Charity Donation 2K19\n2019-03-02 20:43','2019-03-02 20:43:19','/SIGNATORIES-approveSEProposal.jsp',51,135),(305,'SE Proposal ready for approval','Program: SOE-MOD: Issue Awareness 2K19\n2019-03-02 20:46','2019-03-02 20:46:13','/SIGNATORIES-approveSEProposal.jsp',52,136),(306,'SE Proposal ready for approval','Program: SOE-MM: Service for the poor 2019\n2019-03-02 20:49','2019-03-02 20:49:45','/SIGNATORIES-approveSEProposal.jsp',53,137),(307,'SE Proposal ready for approval','Program: Solve Problems 101\n2019-03-02 20:55','2019-03-02 20:55:44','/SIGNATORIES-approveSEProposal.jsp',54,145),(308,'SE Proposal ready for approval','Program: Researching 101\n2019-03-02 20:59','2019-03-02 20:59:39','/SIGNATORIES-approveSEProposal.jsp',55,146),(309,'SE Proposal ready for approval','Program: Food Party 2K19\n2019-03-02 21:04','2019-03-02 21:04:25','/SIGNATORIES-approveSEProposal.jsp',56,147),(310,'Program: Improving Faith to God\n2019-03-02 21:08','FF Proposal ready for approval','2019-03-02 21:08:15','/SIGNATORIES-approveFFProposal.jsp',49,219),(311,'Program: Retreat for a better life\n2019-03-02 21:09','Urgent FF Proposal ready for Approval','2019-03-02 21:09:45','/SIGNATORIES-approveFFProposal.jsp',50,219),(312,'SE Proposal ready for approval','Program: CHEMENG: Charity Donation 2K19\n2019-03-02 21:13','2019-03-02 21:13:02','/SIGNATORIES-approveSEProposal.jsp',57,163),(313,'SE Proposal ready for approval','Program: Why cramming is not good\n2019-03-02 21:17','2019-03-02 21:17:10','/SIGNATORIES-approveSEProposal.jsp',58,161),(314,'SE Proposal ready for approval','Program: Electronics 101\n2019-03-02 21:20','2019-03-02 21:20:57','/SIGNATORIES-approveSEProposal.jsp',59,162),(315,'Program: GCOE-IE: Retreat 2K19\n2019-03-02 21:22','Urgent FF Proposal ready for Approval','2019-03-02 21:22:16','/SIGNATORIES-approveFFProposal.jsp',51,225),(316,'Program: GCOE-MEM: Talk on the life of the Founder 2019\n2019-03-02 21:24','FF Proposal ready for approval','2019-03-02 21:24:57','/SIGNATORIES-approveFFProposal.jsp',52,225),(317,'Program: Prayer Service for the Philippines\n2019-03-02 21:26','FF Proposal ready for approval','2019-03-02 21:26:05','/SIGNATORIES-approveFFProposal.jsp',53,225),(318,'SE Proposal ready for approval','Program: Biology 101\n2019-03-02 21:29','2019-03-02 21:29:12','/SIGNATORIES-approveSEProposal.jsp',60,174),(319,'SE Proposal ready for approval','Program: Chemistry 101\n2019-03-02 21:33','2019-03-02 21:33:25','/SIGNATORIES-approveSEProposal.jsp',61,171),(320,'Program: COS-PHYS: Recollection 2019\n2019-03-02 21:35','FF Proposal ready for approval','2019-03-02 21:35:41','/SIGNATORIES-approveFFProposal.jsp',54,232),(321,'Urgent SE Proposal ready for Approval','Program: CCS-IT Charity Donation 2019\n2019-03-02 21:42','2019-03-02 21:42:40','/SIGNATORIES-approveSEProposal2.jsp',37,82),(322,'SE Proposal Approved','CCS-IT Charity Donation 2019 approved the Department Chair! It will now be taken to the ADEALM.\n2019-03-02 21:42','2019-03-02 21:42:40','/MULTIPLE-viewPendingSEProgramDetails.jsp',37,85),(323,'Urgent SE Proposal ready for Approval','Program: CCS-ST Feeding Program 2K19\n2019-03-02 21:43','2019-03-02 21:43:08','/SIGNATORIES-approveSEProposal2.jsp',38,82),(324,'SE Proposal Approved','CCS-ST Feeding Program 2K19 approved the Department Chair! It will now be taken to the ADEALM.\n2019-03-02 21:43','2019-03-02 21:43:08','/MULTIPLE-viewPendingSEProgramDetails.jsp',38,86),(325,'FF Proposal ready for Approval','Program: CCS-CT Recollection 2019\n2019-03-02 21:43','2019-03-02 21:43:27','/SIGNATORIES-approveFFProposal.jsp',41,190),(326,'CCS-CT Recollection 2019','Your proposal has been approved by the Assistant Dean for Lasallian Mission! It will now be taken to the Chairperson of the Department.\n2019-03-02 21:43','2019-03-02 21:43:27','/MULTIPLE-viewPendingFFProgramDetails.jsp',41,83),(327,'Urgent SE Proposal ready for Approval','Program: CCS-ST Feeding Program 2K19\n2019-03-02 21:44','2019-03-02 21:44:23','/SIGNATORIES-approveSEProposal3.jsp',38,81),(328,'SE Proposal Approved','CCS-ST Feeding Program 2K19 approved by the ADEALM! It will now be taken to the Dean.\n2019-03-02 21:44','2019-03-02 21:44:23','/MULTIPLE-viewPendingSEProgramDetails.jsp',38,86),(329,'Urgent SE Proposal ready for Approval','Program: CCS-ST Feeding Program 2K19\n2019-03-02 21:44','2019-03-02 21:44:33','/SIGNATORIES-approveSEProposal3.jsp',38,81),(330,'SE Proposal Approved','CCS-ST Feeding Program 2K19 approved by the ADEALM! It will now be taken to the Dean.\n2019-03-02 21:44','2019-03-02 21:44:33','/MULTIPLE-viewPendingSEProgramDetails.jsp',38,86),(331,'FF Proposal ready for Approval','Program: CCS-CT Recollection 2019\n2019-03-02 21:45','2019-03-02 21:45:06','/SIGNATORIES-approveFFProposal3.jsp',41,81),(332,'CCS-CT Recollection 2019','Your proposal has been approved by the Chairperson of the Department! It will now be taken to the Dean.\n2019-03-02 21:45','2019-03-02 21:45:06','/MULTIPLE-viewPendingFFProgramDetails.jsp',41,83),(333,'Urgent SE Proposal ready for Approval','Program: CCS-ST Feeding Program 2K19\n2019-03-02 21:45','2019-03-02 21:45:42','/SIGNATORIES-approveSEProposal3.jsp',38,81),(334,'SE Proposal Approved','CCS-ST Feeding Program 2K19 approved by the ADEALM! It will now be taken to the Dean.\n2019-03-02 21:45','2019-03-02 21:45:42','/MULTIPLE-viewPendingSEProgramDetails.jsp',38,86),(335,'Urgent SE Proposal ready for Approval','Program: CCS-IT Charity Donation 2019\n2019-03-02 21:46','2019-03-02 21:46:21','/SIGNATORIES-approveSEProposal3.jsp',37,81),(336,'SE Proposal Approved','CCS-IT Charity Donation 2019 approved by the ADEALM! It will now be taken to the Dean.\n2019-03-02 21:46','2019-03-02 21:46:21','/MULTIPLE-viewPendingSEProgramDetails.jsp',37,85),(337,'Urgent SE Proposal ready for Approval','Program: CCS-IT Charity Donation 2019\n2019-03-02 21:46','2019-03-02 21:46:44','/SIGNATORIES-approveSEProposal3.jsp',37,75),(338,'SE Proposal Approved','CCS-IT Charity Donation 2019 has been approved by the Dean! It will now be taken to COSCA.\n2019-03-02 21:46','2019-03-02 21:46:44','/MULTIPLE-viewPendingSEProgramDetails.jsp',37,85),(339,'Urgent SE Proposal ready for Approval','Program: CCS-ST Feeding Program 2K19\n2019-03-02 21:46','2019-03-02 21:46:50','/SIGNATORIES-approveSEProposal3.jsp',38,75),(340,'SE Proposal Approved','CCS-ST Feeding Program 2K19 has been approved by the Dean! It will now be taken to COSCA.\n2019-03-02 21:46','2019-03-02 21:46:50','/MULTIPLE-viewPendingSEProgramDetails.jsp',38,86),(341,'FF Proposal ready for Approval','Program: CCS-CT Recollection 2019\n2019-03-02 21:46','2019-03-02 21:46:57','/MULTIPLE-approveFFProposal3.jsp',41,76),(342,'CCS-CT Recollection 2019','Your proposal has been approved by the Dean! It will now be taken to Sir James.\n2019-03-02 21:46','2019-03-02 21:46:57','/MULTIPLE-viewPendingFFProgramDetails.jsp',41,83),(343,'SE Proposal ready for Approval','Program: CLA-BS Mental Health Sharing\n2019-03-02 21:48','2019-03-02 21:48:04','/SIGNATORIES-approveSEProposal2.jsp',39,124),(344,'SE Proposal Approved','CLA-BS Mental Health Sharing approved the Department Chair! It will now be taken to the ADEALM.\n2019-03-02 21:48','2019-03-02 21:48:04','/MULTIPLE-viewPendingSEProgramDetails.jsp',39,104),(345,'SE Proposal ready for Approval','Program: CLA-COMM: How to be a leader?\n2019-03-02 21:48','2019-03-02 21:48:27','/SIGNATORIES-approveSEProposal2.jsp',40,124),(346,'SE Proposal Approved','CLA-COMM: How to be a leader? approved the Department Chair! It will now be taken to the ADEALM.\n2019-03-02 21:48','2019-03-02 21:48:27','/MULTIPLE-viewPendingSEProgramDetails.jsp',40,105),(347,'SE Proposal ready for Approval','Program: CLA-LIT: A Good Researcher\n2019-03-02 21:49','2019-03-02 21:49:17','/SIGNATORIES-approveSEProposal2.jsp',41,124),(348,'SE Proposal Approved','CLA-LIT: A Good Researcher approved the Department Chair! It will now be taken to the ADEALM.\n2019-03-02 21:49','2019-03-02 21:49:17','/MULTIPLE-viewPendingSEProgramDetails.jsp',41,106),(349,'SE Proposal ready for Approval','Program: CLA-FIL: Leader Training for the poor\n2019-03-02 21:49','2019-03-02 21:49:44','/SIGNATORIES-approveSEProposal2.jsp',42,124),(350,'SE Proposal Approved','CLA-FIL: Leader Training for the poor approved the Department Chair! It will now be taken to the ADEALM.\n2019-03-02 21:49','2019-03-02 21:49:44','/MULTIPLE-viewPendingSEProgramDetails.jsp',42,107),(351,'SE Proposal ready for Approval','Program: CLA-HIS: Improving Critical Thinking\n2019-03-02 21:50','2019-03-02 21:50:53','/SIGNATORIES-approveSEProposal2.jsp',43,124),(352,'SE Proposal Approved','CLA-HIS: Improving Critical Thinking approved the Department Chair! It will now be taken to the ADEALM.\n2019-03-02 21:50','2019-03-02 21:50:53','/MULTIPLE-viewPendingSEProgramDetails.jsp',43,108),(353,'SE Proposal ready for Approval','Program: CLA-IS: Charity Donation 2019\n2019-03-02 21:51','2019-03-02 21:51:06','/SIGNATORIES-approveSEProposal2.jsp',44,124),(354,'SE Proposal Approved','CLA-IS: Charity Donation 2019 approved the Department Chair! It will now be taken to the ADEALM.\n2019-03-02 21:51','2019-03-02 21:51:06','/MULTIPLE-viewPendingSEProgramDetails.jsp',44,109),(355,'SE Proposal ready for Approval','Program: CLA-PHILO: Issue Awareness 2019\n2019-03-02 21:51','2019-03-02 21:51:23','/SIGNATORIES-approveSEProposal2.jsp',45,124),(356,'SE Proposal Approved','CLA-PHILO: Issue Awareness 2019 approved the Department Chair! It will now be taken to the ADEALM.\n2019-03-02 21:51','2019-03-02 21:51:23','/MULTIPLE-viewPendingSEProgramDetails.jsp',45,110),(357,'SE Proposal ready for Approval','Program: CLA-BS Mental Health Sharing\n2019-03-02 21:52','2019-03-02 21:52:42','/SIGNATORIES-approveSEProposal3.jsp',39,125),(358,'SE Proposal Approved','CLA-BS Mental Health Sharing approved by the ADEALM! It will now be taken to the Dean.\n2019-03-02 21:52','2019-03-02 21:52:42','/MULTIPLE-viewPendingSEProgramDetails.jsp',39,104),(359,'SE Proposal ready for Approval','Program: CLA-COMM: How to be a leader?\n2019-03-02 21:52','2019-03-02 21:52:50','/SIGNATORIES-approveSEProposal3.jsp',40,125),(360,'SE Proposal Approved','CLA-COMM: How to be a leader? approved by the ADEALM! It will now be taken to the Dean.\n2019-03-02 21:52','2019-03-02 21:52:50','/MULTIPLE-viewPendingSEProgramDetails.jsp',40,105),(361,'SE Proposal ready for Approval','Program: CLA-LIT: A Good Researcher\n2019-03-02 21:52','2019-03-02 21:52:57','/SIGNATORIES-approveSEProposal3.jsp',41,125),(362,'SE Proposal Approved','CLA-LIT: A Good Researcher approved by the ADEALM! It will now be taken to the Dean.\n2019-03-02 21:52','2019-03-02 21:52:57','/MULTIPLE-viewPendingSEProgramDetails.jsp',41,106),(363,'SE Proposal ready for Approval','Program: CLA-FIL: Leader Training for the poor\n2019-03-02 21:53','2019-03-02 21:53:05','/SIGNATORIES-approveSEProposal3.jsp',42,125),(364,'SE Proposal Approved','CLA-FIL: Leader Training for the poor approved by the ADEALM! It will now be taken to the Dean.\n2019-03-02 21:53','2019-03-02 21:53:05','/MULTIPLE-viewPendingSEProgramDetails.jsp',42,107),(365,'SE Proposal ready for Approval','Program: CLA-HIS: Improving Critical Thinking\n2019-03-02 21:53','2019-03-02 21:53:12','/SIGNATORIES-approveSEProposal3.jsp',43,125),(366,'SE Proposal Approved','CLA-HIS: Improving Critical Thinking approved by the ADEALM! It will now be taken to the Dean.\n2019-03-02 21:53','2019-03-02 21:53:12','/MULTIPLE-viewPendingSEProgramDetails.jsp',43,108),(367,'SE Proposal ready for Approval','Program: CLA-IS: Charity Donation 2019\n2019-03-02 21:53','2019-03-02 21:53:19','/SIGNATORIES-approveSEProposal3.jsp',44,125),(368,'SE Proposal Approved','CLA-IS: Charity Donation 2019 approved by the ADEALM! It will now be taken to the Dean.\n2019-03-02 21:53','2019-03-02 21:53:19','/MULTIPLE-viewPendingSEProgramDetails.jsp',44,109),(369,'SE Proposal ready for Approval','Program: CLA-PHILO: Issue Awareness 2019\n2019-03-02 21:53','2019-03-02 21:53:26','/SIGNATORIES-approveSEProposal3.jsp',45,125),(370,'SE Proposal Approved','CLA-PHILO: Issue Awareness 2019 approved by the ADEALM! It will now be taken to the Dean.\n2019-03-02 21:53','2019-03-02 21:53:26','/MULTIPLE-viewPendingSEProgramDetails.jsp',45,110),(371,'Urgent FF Proposal ready for Approval','Program: CLA-TRED: Talk on the Life of Founder 2019\n2019-03-02 21:54','2019-03-02 21:54:00','/SIGNATORIES-approveFFProposal.jsp',44,205),(372,'CLA-TRED: Talk on the Life of Founder 2019','Your proposal has been approved by the Assistant Dean for Lasallian Mission! It will now be taken to the Chairperson of the Department.\n2019-03-02 21:54','2019-03-02 21:54:00','/MULTIPLE-viewPendingFFProgramDetails.jsp',44,113),(373,'FF Proposal ready for Approval','Program: CLA-PSYCH: Spritual Talk 2019\n2019-03-02 21:54','2019-03-02 21:54:05','/SIGNATORIES-approveFFProposal.jsp',43,204),(374,'CLA-PSYCH: Spritual Talk 2019','Your proposal has been approved by the Assistant Dean for Lasallian Mission! It will now be taken to the Chairperson of the Department.\n2019-03-02 21:54','2019-03-02 21:54:05','/MULTIPLE-viewPendingFFProgramDetails.jsp',43,112),(375,'FF Proposal ready for Approval','Program: CLA-POLSCI: Prayer Service\n2019-03-02 21:54','2019-03-02 21:54:11','/SIGNATORIES-approveFFProposal.jsp',42,203),(376,'CLA-POLSCI: Prayer Service','Your proposal has been approved by the Assistant Dean for Lasallian Mission! It will now be taken to the Chairperson of the Department.\n2019-03-02 21:54','2019-03-02 21:54:11','/MULTIPLE-viewPendingFFProgramDetails.jsp',42,111),(377,'FF Proposal ready for Approval','Program: CLA-POLSCI: Prayer Service\n2019-03-02 21:54','2019-03-02 21:54:34','/SIGNATORIES-approveFFProposal3.jsp',42,125),(378,'CLA-POLSCI: Prayer Service','Your proposal has been approved by the Chairperson of the Department! It will now be taken to the Dean.\n2019-03-02 21:54','2019-03-02 21:54:34','/MULTIPLE-viewPendingFFProgramDetails.jsp',42,111),(379,'FF Proposal ready for Approval','Program: CLA-PSYCH: Spritual Talk 2019\n2019-03-02 21:54','2019-03-02 21:54:53','/SIGNATORIES-approveFFProposal3.jsp',43,125),(380,'CLA-PSYCH: Spritual Talk 2019','Your proposal has been approved by the Chairperson of the Department! It will now be taken to the Dean.\n2019-03-02 21:54','2019-03-02 21:54:53','/MULTIPLE-viewPendingFFProgramDetails.jsp',43,112),(381,'Urgent FF Proposal ready for Approval','Program: CLA-TRED: Talk on the Life of Founder 2019\n2019-03-02 21:55','2019-03-02 21:55:05','/SIGNATORIES-approveFFProposal3.jsp',44,125),(382,'CLA-TRED: Talk on the Life of Founder 2019','Your proposal has been approved by the Chairperson of the Department! It will now be taken to the Dean.\n2019-03-02 21:55','2019-03-02 21:55:05','/MULTIPLE-viewPendingFFProgramDetails.jsp',44,113),(383,'SE Proposal ready for Approval','Program: CLA-BS Mental Health Sharing\n2019-03-02 21:55','2019-03-02 21:55:20','/SIGNATORIES-approveSEProposal3.jsp',39,75),(384,'SE Proposal Approved','CLA-BS Mental Health Sharing has been approved by the Dean! It will now be taken to COSCA.\n2019-03-02 21:55','2019-03-02 21:55:20','/MULTIPLE-viewPendingSEProgramDetails.jsp',39,104),(385,'SE Proposal ready for Approval','Program: CLA-COMM: How to be a leader?\n2019-03-02 21:55','2019-03-02 21:55:26','/SIGNATORIES-approveSEProposal3.jsp',40,75),(386,'SE Proposal Approved','CLA-COMM: How to be a leader? has been approved by the Dean! It will now be taken to COSCA.\n2019-03-02 21:55','2019-03-02 21:55:26','/MULTIPLE-viewPendingSEProgramDetails.jsp',40,105),(387,'SE Proposal ready for Approval','Program: CLA-LIT: A Good Researcher\n2019-03-02 21:55','2019-03-02 21:55:33','/SIGNATORIES-approveSEProposal3.jsp',41,75),(388,'SE Proposal Approved','CLA-LIT: A Good Researcher has been approved by the Dean! It will now be taken to COSCA.\n2019-03-02 21:55','2019-03-02 21:55:33','/MULTIPLE-viewPendingSEProgramDetails.jsp',41,106),(389,'SE Proposal ready for Approval','Program: CLA-FIL: Leader Training for the poor\n2019-03-02 21:55','2019-03-02 21:55:38','/SIGNATORIES-approveSEProposal3.jsp',42,75),(390,'SE Proposal Approved','CLA-FIL: Leader Training for the poor has been approved by the Dean! It will now be taken to COSCA.\n2019-03-02 21:55','2019-03-02 21:55:38','/MULTIPLE-viewPendingSEProgramDetails.jsp',42,107),(391,'SE Proposal ready for Approval','Program: CLA-HIS: Improving Critical Thinking\n2019-03-02 21:55','2019-03-02 21:55:44','/SIGNATORIES-approveSEProposal3.jsp',43,75),(392,'SE Proposal Approved','CLA-HIS: Improving Critical Thinking has been approved by the Dean! It will now be taken to COSCA.\n2019-03-02 21:55','2019-03-02 21:55:44','/MULTIPLE-viewPendingSEProgramDetails.jsp',43,108),(393,'SE Proposal ready for Approval','Program: CLA-IS: Charity Donation 2019\n2019-03-02 21:55','2019-03-02 21:55:49','/SIGNATORIES-approveSEProposal3.jsp',44,75),(394,'SE Proposal Approved','CLA-IS: Charity Donation 2019 has been approved by the Dean! It will now be taken to COSCA.\n2019-03-02 21:55','2019-03-02 21:55:49','/MULTIPLE-viewPendingSEProgramDetails.jsp',44,109),(395,'SE Proposal ready for Approval','Program: CLA-PHILO: Issue Awareness 2019\n2019-03-02 21:55','2019-03-02 21:55:54','/SIGNATORIES-approveSEProposal3.jsp',45,75),(396,'SE Proposal Approved','CLA-PHILO: Issue Awareness 2019 has been approved by the Dean! It will now be taken to COSCA.\n2019-03-02 21:55','2019-03-02 21:55:54','/MULTIPLE-viewPendingSEProgramDetails.jsp',45,110),(397,'Urgent FF Proposal ready for Approval','Program: CLA-TRED: Talk on the Life of Founder 2019\n2019-03-02 21:55','2019-03-02 21:55:59','/MULTIPLE-approveFFProposal3.jsp',44,76),(398,'CLA-TRED: Talk on the Life of Founder 2019','Your proposal has been approved by the Dean! It will now be taken to Sir James.\n2019-03-02 21:55','2019-03-02 21:55:59','/MULTIPLE-viewPendingFFProgramDetails.jsp',44,113),(399,'FF Proposal ready for Approval','Program: CLA-PSYCH: Spritual Talk 2019\n2019-03-02 21:56','2019-03-02 21:56:04','/MULTIPLE-approveFFProposal3.jsp',43,76),(400,'CLA-PSYCH: Spritual Talk 2019','Your proposal has been approved by the Dean! It will now be taken to Sir James.\n2019-03-02 21:56','2019-03-02 21:56:04','/MULTIPLE-viewPendingFFProgramDetails.jsp',43,112),(401,'FF Proposal ready for Approval','Program: CLA-POLSCI: Prayer Service\n2019-03-02 21:56','2019-03-02 21:56:11','/MULTIPLE-approveFFProposal3.jsp',42,76),(402,'CLA-POLSCI: Prayer Service','Your proposal has been approved by the Dean! It will now be taken to Sir James.\n2019-03-02 21:56','2019-03-02 21:56:11','/MULTIPLE-viewPendingFFProgramDetails.jsp',42,111),(403,'SE Proposal ready for Approval','Program: RVRCOB-ACC: Accounting 101\n2019-03-02 21:56','2019-03-02 21:56:31','/SIGNATORIES-approveSEProposal2.jsp',46,185),(404,'SE Proposal Approved','RVRCOB-ACC: Accounting 101 approved the Department Chair! It will now be taken to the ADEALM.\n2019-03-02 21:56','2019-03-02 21:56:31','/MULTIPLE-viewPendingSEProgramDetails.jsp',46,89),(405,'Urgent SE Proposal ready for Approval','Program: RVRCOB-CL: Charity Donation 2019\n2019-03-02 21:56','2019-03-02 21:56:43','/SIGNATORIES-approveSEProposal2.jsp',47,185),(406,'SE Proposal Approved','RVRCOB-CL: Charity Donation 2019 approved the Department Chair! It will now be taken to the ADEALM.\n2019-03-02 21:56','2019-03-02 21:56:43','/MULTIPLE-viewPendingSEProgramDetails.jsp',47,90),(407,'SE Proposal ready for Approval','Program: RVRCOB-DSID: The benefits of sunlight\n2019-03-02 21:57','2019-03-02 21:57:00','/SIGNATORIES-approveSEProposal2.jsp',48,185),(408,'SE Proposal Approved','RVRCOB-DSID: The benefits of sunlight approved the Department Chair! It will now be taken to the ADEALM.\n2019-03-02 21:57','2019-03-02 21:57:00','/MULTIPLE-viewPendingSEProgramDetails.jsp',48,91),(409,'SE Proposal ready for Approval','Program: RVRCOB-ACC: Accounting 101\n2019-03-02 22:01','2019-03-02 22:01:26','/SIGNATORIES-approveSEProposal3.jsp',46,186),(410,'SE Proposal Approved','RVRCOB-ACC: Accounting 101 approved by the ADEALM! It will now be taken to the Dean.\n2019-03-02 22:01','2019-03-02 22:01:26','/MULTIPLE-viewPendingSEProgramDetails.jsp',46,89),(411,'Urgent SE Proposal ready for Approval','Program: RVRCOB-CL: Charity Donation 2019\n2019-03-02 22:01','2019-03-02 22:01:42','/SIGNATORIES-approveSEProposal3.jsp',47,186),(412,'SE Proposal Approved','RVRCOB-CL: Charity Donation 2019 approved by the ADEALM! It will now be taken to the Dean.\n2019-03-02 22:01','2019-03-02 22:01:42','/MULTIPLE-viewPendingSEProgramDetails.jsp',47,90),(413,'SE Proposal ready for Approval','Program: RVRCOB-DSID: The benefits of sunlight\n2019-03-02 22:01','2019-03-02 22:01:48','/SIGNATORIES-approveSEProposal3.jsp',48,186),(414,'SE Proposal Approved','RVRCOB-DSID: The benefits of sunlight approved by the ADEALM! It will now be taken to the Dean.\n2019-03-02 22:01','2019-03-02 22:01:48','/MULTIPLE-viewPendingSEProgramDetails.jsp',48,91),(415,'Urgent FF Proposal ready for Approval','Program: Recollection 2K19\n2019-03-02 22:02','2019-03-02 22:02:02','/SIGNATORIES-approveFFProposal.jsp',46,211),(416,'Recollection 2K19','Your proposal has been approved by the Assistant Dean for Lasallian Mission! It will now be taken to the Chairperson of the Department.\n2019-03-02 22:02','2019-03-02 22:02:02','/MULTIPLE-viewPendingFFProgramDetails.jsp',46,94),(417,'FF Proposal ready for Approval','Program: Retreat 2K19\n2019-03-02 22:02','2019-03-02 22:02:07','/SIGNATORIES-approveFFProposal.jsp',45,210),(418,'Retreat 2K19','Your proposal has been approved by the Assistant Dean for Lasallian Mission! It will now be taken to the Chairperson of the Department.\n2019-03-02 22:02','2019-03-02 22:02:07','/MULTIPLE-viewPendingFFProgramDetails.jsp',45,93),(419,'FF Proposal ready for Approval','Program: Retreat 2K19\n2019-03-02 22:02','2019-03-02 22:02:21','/SIGNATORIES-approveFFProposal3.jsp',45,186),(420,'Retreat 2K19','Your proposal has been approved by the Chairperson of the Department! It will now be taken to the Dean.\n2019-03-02 22:02','2019-03-02 22:02:21','/MULTIPLE-viewPendingFFProgramDetails.jsp',45,93),(421,'Urgent FF Proposal ready for Approval','Program: Recollection 2K19\n2019-03-02 22:02','2019-03-02 22:02:35','/SIGNATORIES-approveFFProposal3.jsp',46,186),(422,'Recollection 2K19','Your proposal has been approved by the Chairperson of the Department! It will now be taken to the Dean.\n2019-03-02 22:02','2019-03-02 22:02:35','/MULTIPLE-viewPendingFFProgramDetails.jsp',46,94),(423,'Urgent FF Proposal ready for Approval','Program: Recollection 2K19\n2019-03-02 22:02','2019-03-02 22:02:45','/MULTIPLE-approveFFProposal3.jsp',46,76),(424,'Recollection 2K19','Your proposal has been approved by the Dean! It will now be taken to Sir James.\n2019-03-02 22:02','2019-03-02 22:02:45','/MULTIPLE-viewPendingFFProgramDetails.jsp',46,94),(425,'FF Proposal ready for Approval','Program: Retreat 2K19\n2019-03-02 22:02','2019-03-02 22:02:50','/MULTIPLE-approveFFProposal3.jsp',45,76),(426,'Retreat 2K19','Your proposal has been approved by the Dean! It will now be taken to Sir James.\n2019-03-02 22:02','2019-03-02 22:02:50','/MULTIPLE-viewPendingFFProgramDetails.jsp',45,93),(427,'Urgent SE Proposal ready for Approval','Program: RVRCOB-CL: Charity Donation 2019\n2019-03-02 22:02','2019-03-02 22:02:55','/SIGNATORIES-approveSEProposal3.jsp',47,75),(428,'SE Proposal Approved','RVRCOB-CL: Charity Donation 2019 has been approved by the Dean! It will now be taken to COSCA.\n2019-03-02 22:02','2019-03-02 22:02:55','/MULTIPLE-viewPendingSEProgramDetails.jsp',47,90),(429,'SE Proposal ready for Approval','Program: RVRCOB-DSID: The benefits of sunlight\n2019-03-02 22:03','2019-03-02 22:03:00','/SIGNATORIES-approveSEProposal3.jsp',48,75),(430,'SE Proposal Approved','RVRCOB-DSID: The benefits of sunlight has been approved by the Dean! It will now be taken to COSCA.\n2019-03-02 22:03','2019-03-02 22:03:00','/MULTIPLE-viewPendingSEProgramDetails.jsp',48,91),(431,'SE Proposal ready for Approval','Program: RVRCOB-ACC: Accounting 101\n2019-03-02 22:03','2019-03-02 22:03:05','/SIGNATORIES-approveSEProposal3.jsp',46,75),(432,'SE Proposal Approved','RVRCOB-ACC: Accounting 101 has been approved by the Dean! It will now be taken to COSCA.\n2019-03-02 22:03','2019-03-02 22:03:05','/MULTIPLE-viewPendingSEProgramDetails.jsp',46,89),(433,'Program: Let\'s talk about God\n2019-03-02 22:05','FF Proposal ready for approval','2019-03-02 22:05:11','/SIGNATORIES-approveFFProposal.jsp',55,184),(434,'FF Proposal ready for Approval','Program: Let\'s talk about God\n2019-03-02 22:05','2019-03-02 22:05:48','/SIGNATORIES-approveFFProposal.jsp',55,209),(435,'Let\'s talk about God','Your proposal has been approved by the Assistant Dean for Lasallian Mission! It will now be taken to the Chairperson of the Department.\n2019-03-02 22:05','2019-03-02 22:05:48','/MULTIPLE-viewPendingFFProgramDetails.jsp',55,92),(436,'FF Proposal ready for Approval','Program: Let\'s talk about God\n2019-03-02 22:06','2019-03-02 22:06:02','/SIGNATORIES-approveFFProposal3.jsp',55,186),(437,'Let\'s talk about God','Your proposal has been approved by the Chairperson of the Department! It will now be taken to the Dean.\n2019-03-02 22:06','2019-03-02 22:06:02','/MULTIPLE-viewPendingFFProgramDetails.jsp',55,92),(438,'FF Proposal ready for Approval','Program: Let\'s talk about God\n2019-03-02 22:06','2019-03-02 22:06:12','/MULTIPLE-approveFFProposal3.jsp',55,76),(439,'Let\'s talk about God','Your proposal has been approved by the Dean! It will now be taken to Sir James.\n2019-03-02 22:06','2019-03-02 22:06:12','/MULTIPLE-viewPendingFFProgramDetails.jsp',55,92),(440,'FF Proposal ready for Approval','Program: SOE-IAE: Br. Gabriel Drolin Experience 2019\n2019-03-02 22:06','2019-03-02 22:06:50','/SIGNATORIES-approveFFProposal.jsp',47,212),(441,'SOE-IAE: Br. Gabriel Drolin Experience 2019','Your proposal has been approved by the Assistant Dean for Lasallian Mission! It will now be taken to the Chairperson of the Department.\n2019-03-02 22:06','2019-03-02 22:06:50','/MULTIPLE-viewPendingFFProgramDetails.jsp',47,126),(442,'FF Proposal ready for Approval','Program: Spritual Talk 2K19\n2019-03-02 22:06','2019-03-02 22:06:54','/SIGNATORIES-approveFFProposal.jsp',48,213),(443,'Spritual Talk 2K19','Your proposal has been approved by the Assistant Dean for Lasallian Mission! It will now be taken to the Chairperson of the Department.\n2019-03-02 22:06','2019-03-02 22:06:54','/MULTIPLE-viewPendingFFProgramDetails.jsp',48,127),(444,'FF Proposal ready for Approval','Program: SOE-IAE: Br. Gabriel Drolin Experience 2019\n2019-03-02 22:07','2019-03-02 22:07:10','/SIGNATORIES-approveFFProposal3.jsp',47,139),(445,'SOE-IAE: Br. Gabriel Drolin Experience 2019','Your proposal has been approved by the Chairperson of the Department! It will now be taken to the Dean.\n2019-03-02 22:07','2019-03-02 22:07:10','/MULTIPLE-viewPendingFFProgramDetails.jsp',47,126),(446,'FF Proposal ready for Approval','Program: Spritual Talk 2K19\n2019-03-02 22:07','2019-03-02 22:07:23','/SIGNATORIES-approveFFProposal3.jsp',48,139),(447,'Spritual Talk 2K19','Your proposal has been approved by the Chairperson of the Department! It will now be taken to the Dean.\n2019-03-02 22:07','2019-03-02 22:07:23','/MULTIPLE-viewPendingFFProgramDetails.jsp',48,127),(448,'SE Proposal ready for Approval','Program: SOE-LAE: School Teaching 2019\n2019-03-02 22:07','2019-03-02 22:07:44','/SIGNATORIES-approveSEProposal2.jsp',50,138),(449,'SE Proposal Approved','SOE-LAE: School Teaching 2019 approved the Department Chair! It will now be taken to the ADEALM.\n2019-03-02 22:07','2019-03-02 22:07:44','/MULTIPLE-viewPendingSEProgramDetails.jsp',50,128),(450,'SE Proposal ready for Approval','Program: SOE-MFI: Charity Donation 2K19\n2019-03-02 22:08','2019-03-02 22:08:01','/SIGNATORIES-approveSEProposal2.jsp',51,138),(451,'SE Proposal Approved','SOE-MFI: Charity Donation 2K19 approved the Department Chair! It will now be taken to the ADEALM.\n2019-03-02 22:08','2019-03-02 22:08:01','/MULTIPLE-viewPendingSEProgramDetails.jsp',51,129),(452,'SE Proposal ready for Approval','Program: SOE-MOD: Issue Awareness 2K19\n2019-03-02 22:08','2019-03-02 22:08:39','/SIGNATORIES-approveSEProposal2.jsp',52,138),(453,'SE Proposal Approved','SOE-MOD: Issue Awareness 2K19 approved the Department Chair! It will now be taken to the ADEALM.\n2019-03-02 22:08','2019-03-02 22:08:39','/MULTIPLE-viewPendingSEProgramDetails.jsp',52,130),(454,'SE Proposal ready for Approval','Program: SOE-MM: Service for the poor 2019\n2019-03-02 22:08','2019-03-02 22:08:57','/SIGNATORIES-approveSEProposal2.jsp',53,138),(455,'SE Proposal Approved','SOE-MM: Service for the poor 2019 approved the Department Chair! It will now be taken to the ADEALM.\n2019-03-02 22:08','2019-03-02 22:08:57','/MULTIPLE-viewPendingSEProgramDetails.jsp',53,131),(456,'SE Proposal ready for Approval','Program: SOE-LAE: School Teaching 2019\n2019-03-02 22:09','2019-03-02 22:09:18','/SIGNATORIES-approveSEProposal3.jsp',50,139),(457,'SE Proposal Approved','SOE-LAE: School Teaching 2019 approved by the ADEALM! It will now be taken to the Dean.\n2019-03-02 22:09','2019-03-02 22:09:18','/MULTIPLE-viewPendingSEProgramDetails.jsp',50,128),(458,'SE Proposal ready for Approval','Program: SOE-MFI: Charity Donation 2K19\n2019-03-02 22:09','2019-03-02 22:09:25','/SIGNATORIES-approveSEProposal3.jsp',51,139),(459,'SE Proposal Approved','SOE-MFI: Charity Donation 2K19 approved by the ADEALM! It will now be taken to the Dean.\n2019-03-02 22:09','2019-03-02 22:09:25','/MULTIPLE-viewPendingSEProgramDetails.jsp',51,129),(460,'SE Proposal ready for Approval','Program: SOE-MOD: Issue Awareness 2K19\n2019-03-02 22:09','2019-03-02 22:09:32','/SIGNATORIES-approveSEProposal3.jsp',52,139),(461,'SE Proposal Approved','SOE-MOD: Issue Awareness 2K19 approved by the ADEALM! It will now be taken to the Dean.\n2019-03-02 22:09','2019-03-02 22:09:32','/MULTIPLE-viewPendingSEProgramDetails.jsp',52,130),(462,'SE Proposal ready for Approval','Program: SOE-MM: Service for the poor 2019\n2019-03-02 22:09','2019-03-02 22:09:40','/SIGNATORIES-approveSEProposal3.jsp',53,139),(463,'SE Proposal Approved','SOE-MM: Service for the poor 2019 approved by the ADEALM! It will now be taken to the Dean.\n2019-03-02 22:09','2019-03-02 22:09:40','/MULTIPLE-viewPendingSEProgramDetails.jsp',53,131),(464,'FF Proposal ready for Approval','Program: SOE-IAE: Br. Gabriel Drolin Experience 2019\n2019-03-02 22:09','2019-03-02 22:09:52','/MULTIPLE-approveFFProposal3.jsp',47,76),(465,'SOE-IAE: Br. Gabriel Drolin Experience 2019','Your proposal has been approved by the Dean! It will now be taken to Sir James.\n2019-03-02 22:09','2019-03-02 22:09:52','/MULTIPLE-viewPendingFFProgramDetails.jsp',47,126),(466,'FF Proposal ready for Approval','Program: Spritual Talk 2K19\n2019-03-02 22:09','2019-03-02 22:09:58','/MULTIPLE-approveFFProposal3.jsp',48,76),(467,'Spritual Talk 2K19','Your proposal has been approved by the Dean! It will now be taken to Sir James.\n2019-03-02 22:09','2019-03-02 22:09:58','/MULTIPLE-viewPendingFFProgramDetails.jsp',48,127),(468,'SE Proposal ready for Approval','Program: SOE-LAE: School Teaching 2019\n2019-03-02 22:10','2019-03-02 22:10:05','/SIGNATORIES-approveSEProposal3.jsp',50,75),(469,'SE Proposal Approved','SOE-LAE: School Teaching 2019 has been approved by the Dean! It will now be taken to COSCA.\n2019-03-02 22:10','2019-03-02 22:10:05','/MULTIPLE-viewPendingSEProgramDetails.jsp',50,128),(470,'SE Proposal ready for Approval','Program: SOE-MOD: Issue Awareness 2K19\n2019-03-02 22:10','2019-03-02 22:10:11','/SIGNATORIES-approveSEProposal3.jsp',52,75),(471,'SE Proposal Approved','SOE-MOD: Issue Awareness 2K19 has been approved by the Dean! It will now be taken to COSCA.\n2019-03-02 22:10','2019-03-02 22:10:11','/MULTIPLE-viewPendingSEProgramDetails.jsp',52,130),(472,'SE Proposal ready for Approval','Program: SOE-MFI: Charity Donation 2K19\n2019-03-02 22:10','2019-03-02 22:10:16','/SIGNATORIES-approveSEProposal3.jsp',51,75),(473,'SE Proposal Approved','SOE-MFI: Charity Donation 2K19 has been approved by the Dean! It will now be taken to COSCA.\n2019-03-02 22:10','2019-03-02 22:10:16','/MULTIPLE-viewPendingSEProgramDetails.jsp',51,129),(474,'SE Proposal ready for Approval','Program: SOE-MM: Service for the poor 2019\n2019-03-02 22:10','2019-03-02 22:10:21','/SIGNATORIES-approveSEProposal3.jsp',53,75),(475,'SE Proposal Approved','SOE-MM: Service for the poor 2019 has been approved by the Dean! It will now be taken to COSCA.\n2019-03-02 22:10','2019-03-02 22:10:21','/MULTIPLE-viewPendingSEProgramDetails.jsp',53,131),(476,'SE Proposal ready for Approval','Program: Solve Problems 101\n2019-03-02 22:10','2019-03-02 22:10:56','/SIGNATORIES-approveSEProposal2.jsp',54,150),(477,'SE Proposal Approved','Solve Problems 101 approved the Department Chair! It will now be taken to the ADEALM.\n2019-03-02 22:10','2019-03-02 22:10:56','/MULTIPLE-viewPendingSEProgramDetails.jsp',54,140),(478,'SE Proposal ready for Approval','Program: Researching 101\n2019-03-02 22:11','2019-03-02 22:11:11','/SIGNATORIES-approveSEProposal2.jsp',55,150),(479,'SE Proposal Approved','Researching 101 approved the Department Chair! It will now be taken to the ADEALM.\n2019-03-02 22:11','2019-03-02 22:11:11','/MULTIPLE-viewPendingSEProgramDetails.jsp',55,141),(480,'SE Proposal ready for Approval','Program: Food Party 2K19\n2019-03-02 22:11','2019-03-02 22:11:27','/SIGNATORIES-approveSEProposal2.jsp',56,150),(481,'SE Proposal Approved','Food Party 2K19 approved the Department Chair! It will now be taken to the ADEALM.\n2019-03-02 22:11','2019-03-02 22:11:27','/MULTIPLE-viewPendingSEProgramDetails.jsp',56,142),(482,'Urgent FF Proposal ready for Approval','Program: Retreat for a better life\n2019-03-02 22:11','2019-03-02 22:11:48','/SIGNATORIES-approveFFProposal.jsp',50,224),(483,'Retreat for a better life','Your proposal has been approved by the Assistant Dean for Lasallian Mission! It will now be taken to the Chairperson of the Department.\n2019-03-02 22:11','2019-03-02 22:11:48','/MULTIPLE-viewPendingFFProgramDetails.jsp',50,144),(484,'FF Proposal ready for Approval','Program: Improving Faith to God\n2019-03-02 22:11','2019-03-02 22:11:52','/SIGNATORIES-approveFFProposal.jsp',49,223),(485,'Improving Faith to God','Your proposal has been approved by the Assistant Dean for Lasallian Mission! It will now be taken to the Chairperson of the Department.\n2019-03-02 22:11','2019-03-02 22:11:52','/MULTIPLE-viewPendingFFProgramDetails.jsp',49,143),(486,'SE Proposal ready for Approval','Program: Solve Problems 101\n2019-03-02 22:12','2019-03-02 22:12:08','/SIGNATORIES-approveSEProposal3.jsp',54,151),(487,'SE Proposal Approved','Solve Problems 101 approved by the ADEALM! It will now be taken to the Dean.\n2019-03-02 22:12','2019-03-02 22:12:08','/MULTIPLE-viewPendingSEProgramDetails.jsp',54,140),(488,'SE Proposal ready for Approval','Program: Researching 101\n2019-03-02 22:12','2019-03-02 22:12:14','/SIGNATORIES-approveSEProposal3.jsp',55,151),(489,'SE Proposal Approved','Researching 101 approved by the ADEALM! It will now be taken to the Dean.\n2019-03-02 22:12','2019-03-02 22:12:14','/MULTIPLE-viewPendingSEProgramDetails.jsp',55,141),(490,'SE Proposal ready for Approval','Program: Food Party 2K19\n2019-03-02 22:12','2019-03-02 22:12:22','/SIGNATORIES-approveSEProposal3.jsp',56,151),(491,'SE Proposal Approved','Food Party 2K19 approved by the ADEALM! It will now be taken to the Dean.\n2019-03-02 22:12','2019-03-02 22:12:22','/MULTIPLE-viewPendingSEProgramDetails.jsp',56,142),(492,'FF Proposal ready for Approval','Program: Improving Faith to God\n2019-03-02 22:12','2019-03-02 22:12:39','/SIGNATORIES-approveFFProposal3.jsp',49,151),(493,'Improving Faith to God','Your proposal has been approved by the Chairperson of the Department! It will now be taken to the Dean.\n2019-03-02 22:12','2019-03-02 22:12:39','/MULTIPLE-viewPendingFFProgramDetails.jsp',49,143),(494,'Urgent FF Proposal ready for Approval','Program: Retreat for a better life\n2019-03-02 22:12','2019-03-02 22:12:54','/SIGNATORIES-approveFFProposal3.jsp',50,151),(495,'Retreat for a better life','Your proposal has been approved by the Chairperson of the Department! It will now be taken to the Dean.\n2019-03-02 22:12','2019-03-02 22:12:54','/MULTIPLE-viewPendingFFProgramDetails.jsp',50,144),(496,'SE Proposal ready for Approval','Program: Researching 101\n2019-03-02 22:13','2019-03-02 22:13:05','/SIGNATORIES-approveSEProposal3.jsp',55,75),(497,'SE Proposal Approved','Researching 101 has been approved by the Dean! It will now be taken to COSCA.\n2019-03-02 22:13','2019-03-02 22:13:05','/MULTIPLE-viewPendingSEProgramDetails.jsp',55,141),(498,'SE Proposal ready for Approval','Program: Solve Problems 101\n2019-03-02 22:13','2019-03-02 22:13:10','/SIGNATORIES-approveSEProposal3.jsp',54,75),(499,'SE Proposal Approved','Solve Problems 101 has been approved by the Dean! It will now be taken to COSCA.\n2019-03-02 22:13','2019-03-02 22:13:10','/MULTIPLE-viewPendingSEProgramDetails.jsp',54,140),(500,'SE Proposal ready for Approval','Program: Food Party 2K19\n2019-03-02 22:13','2019-03-02 22:13:16','/SIGNATORIES-approveSEProposal3.jsp',56,75),(501,'SE Proposal Approved','Food Party 2K19 has been approved by the Dean! It will now be taken to COSCA.\n2019-03-02 22:13','2019-03-02 22:13:16','/MULTIPLE-viewPendingSEProgramDetails.jsp',56,142),(502,'Urgent FF Proposal ready for Approval','Program: Retreat for a better life\n2019-03-02 22:13','2019-03-02 22:13:23','/MULTIPLE-approveFFProposal3.jsp',50,76),(503,'Retreat for a better life','Your proposal has been approved by the Dean! It will now be taken to Sir James.\n2019-03-02 22:13','2019-03-02 22:13:23','/MULTIPLE-viewPendingFFProgramDetails.jsp',50,144),(504,'FF Proposal ready for Approval','Program: Improving Faith to God\n2019-03-02 22:13','2019-03-02 22:13:28','/MULTIPLE-approveFFProposal3.jsp',49,76),(505,'Improving Faith to God','Your proposal has been approved by the Dean! It will now be taken to Sir James.\n2019-03-02 22:13','2019-03-02 22:13:28','/MULTIPLE-viewPendingFFProgramDetails.jsp',49,143),(506,'SE Proposal ready for Approval','Program: CHEMENG: Charity Donation 2K19\n2019-03-02 22:13','2019-03-02 22:13:43','/SIGNATORIES-approveSEProposal2.jsp',57,158),(507,'SE Proposal Approved','CHEMENG: Charity Donation 2K19 approved the Department Chair! It will now be taken to the ADEALM.\n2019-03-02 22:13','2019-03-02 22:13:43','/MULTIPLE-viewPendingSEProgramDetails.jsp',57,152),(508,'SE Proposal ready for Approval','Program: Why cramming is not good\n2019-03-02 22:13','2019-03-02 22:13:55','/SIGNATORIES-approveSEProposal2.jsp',58,158),(509,'SE Proposal Approved','Why cramming is not good approved the Department Chair! It will now be taken to the ADEALM.\n2019-03-02 22:13','2019-03-02 22:13:55','/MULTIPLE-viewPendingSEProgramDetails.jsp',58,153),(510,'SE Proposal ready for Approval','Program: Electronics 101\n2019-03-02 22:14','2019-03-02 22:14:09','/SIGNATORIES-approveSEProposal2.jsp',59,158),(511,'SE Proposal Approved','Electronics 101 approved the Department Chair! It will now be taken to the ADEALM.\n2019-03-02 22:14','2019-03-02 22:14:09','/MULTIPLE-viewPendingSEProgramDetails.jsp',59,154),(512,'SE Proposal ready for Approval','Program: CHEMENG: Charity Donation 2K19\n2019-03-02 22:14','2019-03-02 22:14:25','/SIGNATORIES-approveSEProposal3.jsp',57,159),(513,'SE Proposal Approved','CHEMENG: Charity Donation 2K19 approved by the ADEALM! It will now be taken to the Dean.\n2019-03-02 22:14','2019-03-02 22:14:25','/MULTIPLE-viewPendingSEProgramDetails.jsp',57,152),(514,'SE Proposal ready for Approval','Program: Why cramming is not good\n2019-03-02 22:14','2019-03-02 22:14:33','/SIGNATORIES-approveSEProposal3.jsp',58,159),(515,'SE Proposal Approved','Why cramming is not good approved by the ADEALM! It will now be taken to the Dean.\n2019-03-02 22:14','2019-03-02 22:14:33','/MULTIPLE-viewPendingSEProgramDetails.jsp',58,153),(516,'SE Proposal ready for Approval','Program: Electronics 101\n2019-03-02 22:14','2019-03-02 22:14:39','/SIGNATORIES-approveSEProposal3.jsp',59,159),(517,'SE Proposal Approved','Electronics 101 approved by the ADEALM! It will now be taken to the Dean.\n2019-03-02 22:14','2019-03-02 22:14:39','/MULTIPLE-viewPendingSEProgramDetails.jsp',59,154),(518,'Urgent FF Proposal ready for Approval','Program: GCOE-IE: Retreat 2K19\n2019-03-02 22:14','2019-03-02 22:14:52','/SIGNATORIES-approveFFProposal.jsp',51,229),(519,'GCOE-IE: Retreat 2K19','Your proposal has been approved by the Assistant Dean for Lasallian Mission! It will now be taken to the Chairperson of the Department.\n2019-03-02 22:14','2019-03-02 22:14:52','/MULTIPLE-viewPendingFFProgramDetails.jsp',51,155),(520,'FF Proposal ready for Approval','Program: GCOE-MEM: Talk on the life of the Founder 2019\n2019-03-02 22:14','2019-03-02 22:14:56','/SIGNATORIES-approveFFProposal.jsp',52,230),(521,'GCOE-MEM: Talk on the life of the Founder 2019','Your proposal has been approved by the Assistant Dean for Lasallian Mission! It will now be taken to the Chairperson of the Department.\n2019-03-02 22:14','2019-03-02 22:14:56','/MULTIPLE-viewPendingFFProgramDetails.jsp',52,156),(522,'FF Proposal ready for Approval','Program: Prayer Service for the Philippines\n2019-03-02 22:15','2019-03-02 22:15:00','/SIGNATORIES-approveFFProposal.jsp',53,231),(523,'Prayer Service for the Philippines','Your proposal has been approved by the Assistant Dean for Lasallian Mission! It will now be taken to the Chairperson of the Department.\n2019-03-02 22:15','2019-03-02 22:15:00','/MULTIPLE-viewPendingFFProgramDetails.jsp',53,157),(524,'Urgent FF Proposal ready for Approval','Program: GCOE-IE: Retreat 2K19\n2019-03-02 22:15','2019-03-02 22:15:28','/SIGNATORIES-approveFFProposal3.jsp',51,159),(525,'GCOE-IE: Retreat 2K19','Your proposal has been approved by the Chairperson of the Department! It will now be taken to the Dean.\n2019-03-02 22:15','2019-03-02 22:15:28','/MULTIPLE-viewPendingFFProgramDetails.jsp',51,155),(526,'FF Proposal ready for Approval','Program: GCOE-MEM: Talk on the life of the Founder 2019\n2019-03-02 22:15','2019-03-02 22:15:47','/SIGNATORIES-approveFFProposal3.jsp',52,159),(527,'GCOE-MEM: Talk on the life of the Founder 2019','Your proposal has been approved by the Chairperson of the Department! It will now be taken to the Dean.\n2019-03-02 22:15','2019-03-02 22:15:47','/MULTIPLE-viewPendingFFProgramDetails.jsp',52,156),(528,'FF Proposal ready for Approval','Program: Prayer Service for the Philippines\n2019-03-02 22:16','2019-03-02 22:16:09','/SIGNATORIES-approveFFProposal3.jsp',53,159),(529,'Prayer Service for the Philippines','Your proposal has been approved by the Chairperson of the Department! It will now be taken to the Dean.\n2019-03-02 22:16','2019-03-02 22:16:09','/MULTIPLE-viewPendingFFProgramDetails.jsp',53,157),(530,'Urgent FF Proposal ready for Approval','Program: GCOE-IE: Retreat 2K19\n2019-03-02 22:16','2019-03-02 22:16:19','/MULTIPLE-approveFFProposal3.jsp',51,76),(531,'GCOE-IE: Retreat 2K19','Your proposal has been approved by the Dean! It will now be taken to Sir James.\n2019-03-02 22:16','2019-03-02 22:16:19','/MULTIPLE-viewPendingFFProgramDetails.jsp',51,155),(532,'SE Proposal ready for Approval','Program: Electronics 101\n2019-03-02 22:16','2019-03-02 22:16:24','/SIGNATORIES-approveSEProposal3.jsp',59,75),(533,'SE Proposal Approved','Electronics 101 has been approved by the Dean! It will now be taken to COSCA.\n2019-03-02 22:16','2019-03-02 22:16:24','/MULTIPLE-viewPendingSEProgramDetails.jsp',59,154),(534,'SE Proposal ready for Approval','Program: Why cramming is not good\n2019-03-02 22:16','2019-03-02 22:16:29','/SIGNATORIES-approveSEProposal3.jsp',58,75),(535,'SE Proposal Approved','Why cramming is not good has been approved by the Dean! It will now be taken to COSCA.\n2019-03-02 22:16','2019-03-02 22:16:29','/MULTIPLE-viewPendingSEProgramDetails.jsp',58,153),(536,'SE Proposal ready for Approval','Program: CHEMENG: Charity Donation 2K19\n2019-03-02 22:16','2019-03-02 22:16:34','/SIGNATORIES-approveSEProposal3.jsp',57,75),(537,'SE Proposal Approved','CHEMENG: Charity Donation 2K19 has been approved by the Dean! It will now be taken to COSCA.\n2019-03-02 22:16','2019-03-02 22:16:34','/MULTIPLE-viewPendingSEProgramDetails.jsp',57,152),(538,'FF Proposal ready for Approval','Program: GCOE-MEM: Talk on the life of the Founder 2019\n2019-03-02 22:16','2019-03-02 22:16:38','/MULTIPLE-approveFFProposal3.jsp',52,76),(539,'GCOE-MEM: Talk on the life of the Founder 2019','Your proposal has been approved by the Dean! It will now be taken to Sir James.\n2019-03-02 22:16','2019-03-02 22:16:38','/MULTIPLE-viewPendingFFProgramDetails.jsp',52,156),(540,'FF Proposal ready for Approval','Program: Prayer Service for the Philippines\n2019-03-02 22:16','2019-03-02 22:16:44','/MULTIPLE-approveFFProposal3.jsp',53,76),(541,'Prayer Service for the Philippines','Your proposal has been approved by the Dean! It will now be taken to Sir James.\n2019-03-02 22:16','2019-03-02 22:16:44','/MULTIPLE-viewPendingFFProgramDetails.jsp',53,157),(542,'SE Proposal ready for Approval','Program: Biology 101\n2019-03-02 22:16','2019-03-02 22:16:56','/SIGNATORIES-approveSEProposal2.jsp',60,176),(543,'SE Proposal Approved','Biology 101 approved the Department Chair! It will now be taken to the ADEALM.\n2019-03-02 22:16','2019-03-02 22:16:56','/MULTIPLE-viewPendingSEProgramDetails.jsp',60,167),(544,'SE Proposal ready for Approval','Program: Chemistry 101\n2019-03-02 22:17','2019-03-02 22:17:08','/SIGNATORIES-approveSEProposal2.jsp',61,176),(545,'SE Proposal Approved','Chemistry 101 approved the Department Chair! It will now be taken to the ADEALM.\n2019-03-02 22:17','2019-03-02 22:17:08','/MULTIPLE-viewPendingSEProgramDetails.jsp',61,173),(546,'SE Proposal ready for Approval','Program: Biology 101\n2019-03-02 22:17','2019-03-02 22:17:21','/SIGNATORIES-approveSEProposal3.jsp',60,177),(547,'SE Proposal Approved','Biology 101 approved by the ADEALM! It will now be taken to the Dean.\n2019-03-02 22:17','2019-03-02 22:17:21','/MULTIPLE-viewPendingSEProgramDetails.jsp',60,167),(548,'SE Proposal ready for Approval','Program: Chemistry 101\n2019-03-02 22:17','2019-03-02 22:17:28','/SIGNATORIES-approveSEProposal3.jsp',61,177),(549,'SE Proposal Approved','Chemistry 101 approved by the ADEALM! It will now be taken to the Dean.\n2019-03-02 22:17','2019-03-02 22:17:28','/MULTIPLE-viewPendingSEProgramDetails.jsp',61,173),(550,'FF Proposal ready for Approval','Program: COS-PHYS: Recollection 2019\n2019-03-02 22:17','2019-03-02 22:17:47','/SIGNATORIES-approveFFProposal.jsp',54,235),(551,'COS-PHYS: Recollection 2019','Your proposal has been approved by the Assistant Dean for Lasallian Mission! It will now be taken to the Chairperson of the Department.\n2019-03-02 22:17','2019-03-02 22:17:47','/MULTIPLE-viewPendingFFProgramDetails.jsp',54,172),(552,'FF Proposal ready for Approval','Program: COS-PHYS: Recollection 2019\n2019-03-02 22:18','2019-03-02 22:18:07','/SIGNATORIES-approveFFProposal3.jsp',54,177),(553,'COS-PHYS: Recollection 2019','Your proposal has been approved by the Chairperson of the Department! It will now be taken to the Dean.\n2019-03-02 22:18','2019-03-02 22:18:07','/MULTIPLE-viewPendingFFProgramDetails.jsp',54,172),(554,'SE Proposal ready for Approval','Program: Chemistry 101\n2019-03-02 22:18','2019-03-02 22:18:47','/SIGNATORIES-approveSEProposal3.jsp',61,75),(555,'SE Proposal Approved','Chemistry 101 has been approved by the Dean! It will now be taken to COSCA.\n2019-03-02 22:18','2019-03-02 22:18:47','/MULTIPLE-viewPendingSEProgramDetails.jsp',61,173),(556,'SE Proposal ready for Approval','Program: Biology 101\n2019-03-02 22:18','2019-03-02 22:18:53','/SIGNATORIES-approveSEProposal3.jsp',60,75),(557,'SE Proposal Approved','Biology 101 has been approved by the Dean! It will now be taken to COSCA.\n2019-03-02 22:18','2019-03-02 22:18:53','/MULTIPLE-viewPendingSEProgramDetails.jsp',60,167),(558,'FF Proposal ready for Approval','Program: COS-PHYS: Recollection 2019\n2019-03-02 22:18','2019-03-02 22:18:57','/MULTIPLE-approveFFProposal3.jsp',54,76),(559,'COS-PHYS: Recollection 2019','Your proposal has been approved by the Dean! It will now be taken to Sir James.\n2019-03-02 22:18','2019-03-02 22:18:57','/MULTIPLE-viewPendingFFProgramDetails.jsp',54,172),(560,'Student Org SE Proposal Submitted','Program: \n2019-03-02 23:45','2019-03-02 23:45:08','/MULTIPLE-viewPendingSEProgramDetails.jsp',0,74),(561,'Student Org SE Proposal Submitted','Program: \n2019-03-02 23:45','2019-03-02 23:45:08','/MULTIPLE-viewPendingSEProgramDetails.jsp',0,71),(562,'Student Org SE Proposal Submitted','Program: \n2019-03-02 23:45','2019-03-02 23:45:08','/MULTIPLE-viewPendingSEProgramDetails.jsp',0,243),(563,'Student Org SE Proposal Submitted','Program: \n2019-03-02 23:48','2019-03-02 23:48:37','/MULTIPLE-viewPendingSEProgramDetails.jsp',0,74),(564,'Student Org SE Proposal Submitted','Program: \n2019-03-02 23:48','2019-03-02 23:48:37','/MULTIPLE-viewPendingSEProgramDetails.jsp',0,71),(565,'Student Org SE Proposal Submitted','Program: \n2019-03-02 23:48','2019-03-02 23:48:37','/MULTIPLE-viewPendingSEProgramDetails.jsp',0,243),(566,'Student Org SE Proposal Submitted','Program: \n2019-03-02 23:50','2019-03-02 23:50:03','/MULTIPLE-viewPendingFFProgramDetails.jsp',0,74),(567,'Student Org SE Proposal Submitted','Program: \n2019-03-02 23:50','2019-03-02 23:50:03','/MULTIPLE-viewPendingFFProgramDetails.jsp',0,71),(568,'Student Org SE Proposal Submitted','Program: \n2019-03-02 23:50','2019-03-02 23:50:03','/MULTIPLE-viewPendingFFProgramDetails.jsp',0,243),(569,'Student Org SE Proposal Submitted','Program: \n2019-03-02 23:51','2019-03-02 23:51:30','/MULTIPLE-viewPendingFFProgramDetails.jsp',0,74),(570,'Student Org SE Proposal Submitted','Program: \n2019-03-02 23:51','2019-03-02 23:51:30','/MULTIPLE-viewPendingFFProgramDetails.jsp',0,71),(571,'Student Org SE Proposal Submitted','Program: \n2019-03-02 23:51','2019-03-02 23:51:30','/MULTIPLE-viewPendingFFProgramDetails.jsp',0,243);
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
-- Table structure for table `se_checkedited`
--

DROP TABLE IF EXISTS `se_checkedited`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `se_checkedited` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `seID` int(11) DEFAULT NULL,
  `check1` int(11) DEFAULT '0',
  `check2` int(11) DEFAULT '0',
  `check3` int(11) DEFAULT '0',
  `check4` int(11) DEFAULT '0',
  `check5` int(11) DEFAULT '0',
  `check6` int(11) DEFAULT '0',
  `check7` int(11) DEFAULT '0',
  `check8` int(11) DEFAULT '0',
  `check9` int(11) DEFAULT '0',
  `check10` int(11) DEFAULT '0',
  `check11` int(11) DEFAULT '0',
  `check12` int(11) DEFAULT '0',
  `check13` int(11) DEFAULT '0',
  `check14` int(11) DEFAULT '0',
  `check15` int(11) DEFAULT '0',
  `check16` int(11) DEFAULT '0',
  `check17` int(11) DEFAULT '0',
  `check18` int(11) DEFAULT '0',
  `check19` int(11) DEFAULT '0',
  `check20` int(11) DEFAULT '0',
  `check21` int(11) DEFAULT '0',
  `check22` int(11) DEFAULT '0',
  `check23` int(11) DEFAULT '0',
  `check24` int(11) DEFAULT '0',
  `check25` int(11) DEFAULT '0',
  `check26` int(11) DEFAULT '0',
  `check27` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `FK50_idx` (`seID`),
  CONSTRAINT `FK50` FOREIGN KEY (`seID`) REFERENCES `seproposal` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `se_checkedited`
--

LOCK TABLES `se_checkedited` WRITE;
/*!40000 ALTER TABLE `se_checkedited` DISABLE KEYS */;
/*!40000 ALTER TABLE `se_checkedited` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=140 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `se_measures`
--

LOCK TABLES `se_measures` WRITE;
/*!40000 ALTER TABLE `se_measures` DISABLE KEYS */;
INSERT INTO `se_measures` VALUES (86,37,37),(87,37,38),(88,37,39),(89,38,23),(90,39,43),(91,40,37),(92,40,38),(93,41,37),(94,41,38),(95,41,42),(96,42,30),(97,43,43),(98,44,43),(99,45,30),(100,45,31),(101,46,37),(102,46,38),(103,46,42),(104,47,23),(105,47,25),(106,47,28),(107,48,37),(108,48,38),(109,48,42),(110,49,23),(111,50,30),(112,50,31),(113,51,37),(114,51,38),(115,51,42),(116,52,43),(117,53,23),(118,53,25),(119,53,29),(120,54,37),(121,55,30),(122,55,31),(123,56,30),(124,56,31),(125,57,23),(126,57,25),(127,57,28),(128,58,43),(129,59,37),(130,59,39),(131,59,42),(132,60,43),(133,61,23),(134,61,25),(135,61,29),(136,62,43),(137,63,37),(138,63,38),(139,63,42);
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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `seevaluation`
--

LOCK TABLES `seevaluation` WRITE;
/*!40000 ALTER TABLE `seevaluation` DISABLE KEYS */;
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
  `sustainable` int(1) DEFAULT NULL,
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
) ENGINE=InnoDB AUTO_INCREMENT=64 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `seproposal`
--

LOCK TABLES `seproposal` WRITE;
/*!40000 ALTER TABLE `seproposal` DISABLE KEYS */;
INSERT INTO `seproposal` VALUES (37,'College of Computer Studies (CCS)','Information Technology (IT)','2019-03-02','CCS-IT Charity Donation 2019','unitrep ccsit','Service-Learning',2,6,12,NULL,NULL,'2019-03-15',5000,'Poverty','Dela Cruz, Juan','Quezon City','Antonio De Jesus','09123456789','adejesus@gmail.com','Best partner for charity donation program','To give help to the poor',0,NULL,'OVPLM',27,25,12,10,10,10,10,10,4,'Approved!','2019-03-02 21:42:39','  Approved!','2019-03-02 21:46:21',' Approved!','2019-03-02 21:46:44',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,85,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Academic',NULL,NULL,NULL,NULL,NULL,NULL,'2019-03-02 19:08:17','Antipolo Hills, Antipolo City',1,1,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(38,'College of Computer Studies (CCS)','Software Technology (ST)','2019-03-02','CCS-ST Feeding Program 2K19','unitrep ccsst','Direct Service to the Poor and Marginalized',1,3,8,NULL,NULL,'2019-03-16',5000,'Hunger','Angelo De Jesus','Paranaque City','Malo, Khalid','09987654331','kazmalo@gmail.com','A good partner for feeding programs','To feed the hungry',0,NULL,'Others',27,12,12,12,12,12,12,12,4,'Approved!','2019-03-02 21:43:08',' Approved!  ','2019-03-02 21:45:42',' Approved!','2019-03-02 21:46:50',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,86,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Academic',NULL,NULL,NULL,NULL,NULL,NULL,'2019-03-02 19:24:38','DLSU - Manila',1,1,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(39,'College of Liberal Arts (CLA)','Behavioral Sciences (BS)','2019-03-02','CLA-BS Mental Health Sharing','unitrep clabs','Issue Awareness and Advocacy',4,6,13,NULL,NULL,'2019-03-18',4000,'Issues encountered in the Philippines','Aquino, Danielle','San Juan City','Bea Santos','09999999999','bsantos@gmail.com','A good partner for Issue Awareness and Advocacy','To be aware of the issues encountered in the Philippines',0,NULL,'Others',27,15,12,12,10,10,10,10,4,' Approved!','2019-03-02 21:48:04','  Approved!','2019-03-02 21:52:42',' Approved!','2019-03-02 21:55:20',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,104,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Academic',NULL,NULL,NULL,NULL,NULL,NULL,'2019-03-02 19:32:40','Pateros, Makati',1,1,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(40,'College of Liberal Arts (CLA)','Communication (COMM)','2019-03-02','CLA-COMM: How to be a leader?','unitrep clacomm','Public Engagement',1,6,12,NULL,NULL,'2019-03-18',3000,'Problems on being a good leader','Dela Paz, Karl','Quezon City','Dino De Jesus','09123456987','ddj@gmail.com','A good partner and a good leader','To train everyone on how to be a good leader',0,NULL,'Others',27,24,12,10,10,10,10,10,4,' Approved!','2019-03-02 21:48:26','  Approved!','2019-03-02 21:52:50',' Approved!','2019-03-02 21:55:26',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,105,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Academic',NULL,NULL,NULL,NULL,NULL,NULL,'2019-03-02 19:54:46','Mandaluyong City',1,1,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(41,'College of Liberal Arts (CLA)','Literature (LIT)','2019-03-02','CLA-LIT: A Good Researcher','unitrep clalit','Socially Engaged Research',2,6,12,NULL,NULL,'2019-03-26',2000,'Problems related on researching','Karl Malone','Cubao, Quezon City','Angelo Alcala','09123555432','aa@gmail.com','A partner that is really good on researching','To help the people on how to become a good researcher',0,NULL,'Others',27,20,12,10,10,10,10,10,4,' Approved!','2019-03-02 21:49:17','  Approved!','2019-03-02 21:52:57',' Approved!','2019-03-02 21:55:32',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,106,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Academic',NULL,NULL,NULL,NULL,NULL,NULL,'2019-03-02 19:57:44','DLSU - Manila',1,1,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(42,'College of Liberal Arts (CLA)','Filipino (FIL)','2019-03-02','CLA-FIL: Leader Training for the poor','unitrep clafil','Service-Learning',1,3,9,NULL,NULL,'2019-03-28',5000,'People who do not know how to lead','Luis Grefiel','Paranaque City','Valenzuela, James','09783216753','vj@gmail.com','A good partner and a good leader','To help the poor on how to become a good leader',0,NULL,'Others',36,30,12,10,10,10,10,10,4,' Approved!','2019-03-02 21:49:44','  Approved!','2019-03-02 21:53:05',' Approved!','2019-03-02 21:55:38',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,107,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Academic',NULL,NULL,NULL,NULL,NULL,NULL,'2019-03-02 20:03:04','BGC, Taguig',1,1,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(43,'College of Liberal Arts (CLA)','History (HIS)','2019-03-02','CLA-HIS: Improving Critical Thinking','unitrep clahis','Interdisciplinary Fora',4,6,13,NULL,NULL,'2019-03-30',5000,'Problems about critical thinking','Marsh Matters','Antipolo City','James Height','09873213275','jh@gmail.com','A good partner','To help everyone imrpove their critical thinking',0,NULL,'Others',27,25,12,10,10,10,10,10,4,' Approved!','2019-03-02 21:50:53','  Approved!','2019-03-02 21:53:12',' Approved!','2019-03-02 21:55:44',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,108,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Academic',NULL,NULL,NULL,NULL,NULL,NULL,'2019-03-02 20:06:53','Tagaytay City',1,1,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(44,'College of Liberal Arts (CLA)','International Studies (IS)','2019-03-02','CLA-IS: Charity Donation 2019','unitrep clais','Direct Service to the Poor and Marginalized',4,6,13,NULL,NULL,'2019-03-30',5000,'Poverty','Kristin Te','Santa Cruz, Recto','Murphy Garcia','09873213245','mg@gmail.com','A good partner and a responsible partner','To help the needy',0,NULL,'Others',27,25,12,10,10,10,10,10,4,' Approved!','2019-03-02 21:51:06','  Approved!','2019-03-02 21:53:19',' Approved!','2019-03-02 21:55:49',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,109,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Academic',NULL,NULL,NULL,NULL,NULL,NULL,'2019-03-02 20:09:36','Cubao, Quezon City',1,1,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(45,'College of Liberal Arts (CLA)','Philosophy (PHILO)','2019-03-02','CLA-PHILO: Issue Awareness 2019','unitrep claphilo','Issue Awareness and Advocacy',2,3,9,NULL,NULL,'2019-03-31',3000,'Issues encountered in the Philippines','Khalid De Jesus','Pateros, Makati','Angelo Madrid','09123456789','am@gmail.com','An intelligent partner','To be aware of the issues encountered in the Philippines',0,NULL,'Others',27,23,12,10,10,7,10,8,4,' Approved!','2019-03-02 21:51:23','  Approved!','2019-03-02 21:53:26',' Approved!','2019-03-02 21:55:54',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,110,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Academic',NULL,NULL,NULL,NULL,NULL,NULL,'2019-03-02 20:11:54','DLSU - Manila',1,1,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(46,'Ramon V. Del Rosario College of Business (RVR-COB)','Accountancy (ACC)','2019-03-02','RVRCOB-ACC: Accounting 101','unitrep rvrcobacc','Public Engagement',2,6,12,NULL,NULL,'2019-03-31',10000,'People who do not have any background regarding Accounting','Gian Sagum','Cubao, Quezon City','Madrid, Marck','0989872630','mm@gmail.com','A partner that is really good in accounting','To help the peopl learn about accounting',0,NULL,'Others',27,24,12,10,10,10,10,10,4,' Approved!','2019-03-02 21:56:31','Approved!','2019-03-02 22:01:26','Approved!','2019-03-02 22:03:05',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,89,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Academic',NULL,NULL,NULL,NULL,NULL,NULL,'2019-03-02 20:21:28','San Juan City',1,1,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(47,'Ramon V. Del Rosario College of Business (RVR-COB)','Commercial Law (CL)','2019-03-02','RVRCOB-CL: Charity Donation 2019','unitrep rvrcobcl','Direct Service to the Poor and Marginalized',4,3,8,NULL,NULL,'2019-03-13',5000,'Poverty','Angelo De Jesus','Paranaque City','Malo, Khalid','0982738130','km@gmail.com','A partner that is willing to help','To help the needy',0,NULL,'Others',27,25,12,10,10,10,10,10,4,' Approved!','2019-03-02 21:56:43',' Approved!','2019-03-02 22:01:42','Approved!','2019-03-02 22:02:55',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,90,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Academic',NULL,NULL,NULL,NULL,NULL,NULL,'2019-03-02 20:24:15','BGC, Taguig',1,1,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(48,'Ramon V. Del Rosario College of Business (RVR-COB)','Decision Sciences and Innovation Department (DSID)','2019-03-02','RVRCOB-DSID: The benefits of sunlight','unitrep rvrcobdsid','Socially Engaged Research',2,6,12,NULL,NULL,'2019-03-22',5000,'People who lack ideas about the sunlight','Angelo De Jesus','Paranaque City','Dino Alcala','09987652637','da@gmail.com','A partner who has a great knowledge about sunlight','To help the people know the benefit of the sunlight',0,NULL,'Others',27,23,12,10,10,10,10,10,4,' Approved!','2019-03-02 21:57:00',' Approved!','2019-03-02 22:01:48','Approved!','2019-03-02 22:03:00',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,91,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Academic',NULL,NULL,NULL,NULL,NULL,NULL,'2019-03-02 20:27:37','San Juan City',1,1,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(49,'Ramon V. Del Rosario College of Business (RVR-COB)','Management of Financial Institutions (RVRCOB-MFI)','2019-03-02','Preparation for future problems','unitrep rvrcobmfi','Interdisciplinary Fora',1,3,8,NULL,NULL,'2019-03-29',3000,'Problems the country face in this generation','Khalid Malo','Pateros, Makati','Dino Alcala','09827312341','da@gmail.com','A partner that has a great knowledge about the problems in the country','To help the people solve future problems',0,NULL,'Others',27,20,12,8,8,8,8,8,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,92,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Academic',NULL,NULL,NULL,NULL,NULL,NULL,'2019-03-02 20:30:30','Marikina City',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(50,'School of Economics (SOE)','Ladderized Applied Economics (LAE)','2019-03-02','SOE-LAE: School Teaching 2019','unitrep soelae','Public Engagement',2,3,9,NULL,NULL,'2019-03-24',5000,'People who do not have proper education','Dino Alcala','Anonas, Quezon City','Luis Grefiel','09738261234','lg@gmail.com','A partner that is willing to help','To give a proper learning for the needy',0,NULL,'Others',27,25,12,10,10,10,10,10,4,'Approved!','2019-03-02 22:07:44',' Approved!','2019-03-02 22:09:18','Approved!','2019-03-02 22:10:05',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,128,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Academic',NULL,NULL,NULL,NULL,NULL,NULL,'2019-03-02 20:40:36','DLSU - Manila',1,1,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(51,'School of Economics (SOE)','Management of Financial Institutions (SOE-MFI)','2019-03-02','SOE-MFI: Charity Donation 2K19','unitrep soemfi','Direct Service to the Poor and Marginalized',4,6,12,NULL,NULL,'2019-03-28',5000,'People who do not have enough things','Gian Madrid','Cubao, Quezon City','Madrid, Kate','098273928321','katie@gmail.com','A partner that is really willing to help','To help the needy',0,NULL,'Others',27,15,12,8,6,6,5,5,4,'Approved!','2019-03-02 22:08:01',' Approved!','2019-03-02 22:09:25','Approved!','2019-03-02 22:10:16',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,129,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Academic',NULL,NULL,NULL,NULL,NULL,NULL,'2019-03-02 20:43:18','Cubao, Quezon City',1,1,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(52,'School of Economics (SOE)','Management and Organization Department (SOE-MOD)','2019-03-02','SOE-MOD: Issue Awareness 2K19','unitrep soemod','Issue Awareness and Advocacy',2,6,13,NULL,NULL,'2019-03-25',5000,'Issues encountered in the Philippines','De Jesus, Marck','Cubao, Quezon City','Carl Cruz','09827323445','cc@gmail.com','A partner that is willing to help','To give awareness regarding the issues encountered in the Philppines',0,NULL,'Others',27,20,12,9,9,9,9,9,4,'Approved!','2019-03-02 22:08:39',' Approved!','2019-03-02 22:09:32','Approved!','2019-03-02 22:10:11',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,130,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Academic',NULL,NULL,NULL,NULL,NULL,NULL,'2019-03-02 20:46:13','Paranque City',1,1,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(53,'School of Economics (SOE)','Marketing Management (SOE-MM)','2019-03-02','SOE-MM: Service for the poor 2019','unitrep soemm','Service-Learning',4,3,8,NULL,NULL,'2019-03-31',5000,'People who do not have enough service learnings','Katie Dela Paz','Cubao, Quezon City','Jude Magtibay','09827382321','jm@gmail.com','A partner who has a great experience in service learning','To have a successful service learning',0,NULL,'Others',27,23,12,10,10,10,10,10,4,'Approved!','2019-03-02 22:08:57',' Approved!','2019-03-02 22:09:40','Approved!','2019-03-02 22:10:21',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,131,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Academic',NULL,NULL,NULL,NULL,NULL,NULL,'2019-03-02 20:49:44','Antipolo Hills, Antipolo City',1,1,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(54,'Br. Andrew Gonzales College of Education (BAGCED)','Counselling and Educational Psychology Department (CEPD)','2019-03-02','Solve Problems 101','unitrep bagcedcepd','Interdisciplinary Fora',4,6,12,NULL,NULL,'2019-03-25',3000,'People who can\'t solve problems well','Luis De Jesus','Marikina City','Bea Aquino','09999923213','ba@gmail.com','A good partner','To give people ideas on how to handle big problems',0,NULL,'Others',27,20,12,10,10,10,10,10,4,'Approved!','2019-03-02 22:10:56',' Approved!','2019-03-02 22:12:08','Approved!','2019-03-02 22:13:10',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,140,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Academic',NULL,NULL,NULL,NULL,NULL,NULL,'2019-03-02 20:55:44','DLSU - Manila',1,1,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(55,'Br. Andrew Gonzales College of Education (BAGCED)','Department of English and Applied Linguistics (DEAL)','2019-03-02','Researching 101','unitrep bagceddeal','Socially Engaged Research',2,3,9,NULL,NULL,'2019-03-18',3000,'People who have problems in researching','Angelo Trinidad','Antipolo City','Dino Malo','09823212345','nelzie@gmail.com','A partner that is willing to help','To help people have a better researching skills',0,NULL,'Others',27,23,12,12,12,12,12,12,4,'Approved!','2019-03-02 22:11:11',' Approved!','2019-03-02 22:12:14','Approved!','2019-03-02 22:13:05',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,141,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Academic',NULL,NULL,NULL,NULL,NULL,NULL,'2019-03-02 20:59:39','San Juan City',1,1,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(56,'Br. Andrew Gonzales College of Education (BAGCED)','Educational Leadership and Management Department (ELMD)','2019-03-02','Food Party 2K19','unitrep bagcedelmd','Public Engagement',1,3,9,NULL,NULL,'2019-03-31',3000,'Food hunger of the poor','Charles Cruz','Cubao, Quezon City','Karl Magsalin','09873213241','km2@gmail.com','A partner that has a lot to share','To feed the hungry',0,NULL,'Others',27,23,12,9,9,9,9,9,4,'Approved!','2019-03-02 22:11:27',' Approved!','2019-03-02 22:12:22','Approved!','2019-03-02 22:13:16',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,142,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Academic',NULL,NULL,NULL,NULL,NULL,NULL,'2019-03-02 21:04:24','Cavite City',1,1,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(57,'Gokongwei College of Engineering (GCOE)','Chemical Engineering (CHEMENG)','2019-03-02','CHEMENG: Charity Donation 2K19','unitrep gcoechemeng','Direct Service to the Poor and Marginalized',4,3,8,NULL,NULL,'2019-03-25',5000,'Poverty','Kristin Marcelo','Pateros, Makati','Kyra Velasco','09823712321','kv@gmail.com','A partner that is willing to share her things','To help the poor people',0,NULL,'Others',27,23,12,12,12,12,12,12,4,'Approved!','2019-03-02 22:13:43',' Approved!','2019-03-02 22:14:25','Approved!','2019-03-02 22:16:34',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,152,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Academic',NULL,NULL,NULL,NULL,NULL,NULL,'2019-03-02 21:13:01','Antipolo Hills, Antipolo City',1,1,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(58,'Gokongwei College of Engineering (GCOE)','Civil Engineering (CIV)','2019-03-02','Why cramming is not good','unitrep gcoeciv','Socially Engaged Research',2,6,13,NULL,NULL,'2019-03-24',3000,'People who crams','Jose De Jesus','Paranaque City','Bea Umali','09232323232','bu@gmail.com','A partner who experienced cramming','To help people know the benefits of not cramming',0,NULL,'Others',27,23,12,10,10,10,10,10,4,'Approved!','2019-03-02 22:13:55',' Approved!','2019-03-02 22:14:32','Approved!','2019-03-02 22:16:28',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,153,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Academic',NULL,NULL,NULL,NULL,NULL,NULL,'2019-03-02 21:17:10','Mandaluyong City',1,1,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(59,'Gokongwei College of Engineering (GCOE)','Electronics and Communications Engineering (ECE)','2019-03-02','Electronics 101','unitrep gcoeece','Public Engagement',4,6,12,NULL,NULL,'2019-03-20',50000,'People who do not have any idea regarding Electronics','Angela Carpio','Pateros, Makati','Queen Dela Cruz','09923212321','quenie@gmail.com','A partner who has a lot of knowledge regarding Electronics','To help the people know about electronics',0,NULL,'Others',27,13,12,10,10,10,10,10,4,'Approved!','2019-03-02 22:14:08',' Approved!','2019-03-02 22:14:39','Approved!','2019-03-02 22:16:24',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,154,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Academic',NULL,NULL,NULL,NULL,NULL,NULL,'2019-03-02 21:20:57','DLSU - Manila',1,1,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(60,'College of Science (COS)','Biology (BIO)','2019-03-02','Biology 101','unitrep cosboi','Service-Learning',4,6,13,NULL,NULL,'2019-03-24',5000,'People who do not have any idea regarding Biology','Patrice Lu','Cubao, Quezon City','Patrick Dela Cruz','09283922313','pcee@gmail.com','A partner that has a great knowledge about Biology','To help the people know about Biology',0,NULL,'Others',27,20,12,10,7,7,7,7,4,'Approved!','2019-03-02 22:16:56',' Approved!','2019-03-02 22:17:21','Approved!','2019-03-02 22:18:53',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,167,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Academic',NULL,NULL,NULL,NULL,NULL,NULL,'2019-03-02 21:29:11','San Juan City',1,1,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(61,'College of Science (COS)','Chemistry (CHEM)','2019-03-02','Chemistry 101','unitrep coschem','Public Engagement',2,3,8,NULL,NULL,'2019-03-19',5000,'People who do not have any knowledge about Chemistry','Charles Darwin','Pateros, Makati','Charmaine Young','09837212345','cy@gmail.com','A partner that is really good in Chemistry','To help the people know about Chemistry',0,NULL,'Others',27,23,12,10,10,10,10,10,4,'Approved!','2019-03-02 22:17:08',' Approved!','2019-03-02 22:17:27','Approved!','2019-03-02 22:18:47',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,173,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Academic',NULL,NULL,NULL,NULL,NULL,NULL,'2019-03-02 21:33:24','BGC, Taguig',1,1,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(62,'No College','Santugon','2019-03-02','Political Leader 101','Richard De Leon','Public Engagement',1,6,13,NULL,NULL,'2019-03-29',5000,'People who are challenged on being a political leader','Angelo De Jesus','Paranaque City','Bea Santos','09123212321','bs@gmail.com','A partner who is a former political leader','To teach the young generation on how to become a political leader',0,'Training that will help the individual maximize their skills','Others',5,5,7,7,7,7,7,7,8,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,78,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Non-Academic',NULL,NULL,NULL,NULL,NULL,NULL,'2019-03-02 23:45:07','Antipolo Hills, Antipolo City',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(63,'No College','Tapat','2019-03-02','Philippine Administration Talk','Rey Gamboa','Public Engagement',1,6,12,NULL,NULL,'2019-03-25',5000,'Problems related to Philippine Administration','Luis Grefiel','Paranaque City','Lu, Lianne','093234523256','ll@gmail.com','A partner who has a lot of knowledge regarding the Philippine Administration','To know more about the Philippine Administration and to give solutions to the current problems',0,'To determine problems in the current industry and also determine how to solve it','Others',5,5,7,7,7,7,7,7,8,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,78,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Non-Academic',NULL,NULL,NULL,NULL,NULL,NULL,'2019-03-02 23:48:36','San Juan City',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `seproposal_component`
--

LOCK TABLES `seproposal_component` WRITE;
/*!40000 ALTER TABLE `seproposal_component` DISABLE KEYS */;
INSERT INTO `seproposal_component` VALUES (19,62,'Training/Capacity Building for the Partner'),(20,63,'Policy Advocacy/Development related to the Social Problem being Addressed');
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
  `datetime` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `LA12_idx` (`seproposalID`),
  CONSTRAINT `LA12` FOREIGN KEY (`seproposalID`) REFERENCES `seproposal` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=155 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `seproposal_expenses`
--

LOCK TABLES `seproposal_expenses` WRITE;
/*!40000 ALTER TABLE `seproposal_expenses` DISABLE KEYS */;
INSERT INTO `seproposal_expenses` VALUES (113,'Food',2500,1,NULL,NULL,37,2500,'2001-01-01 00:00:00.0'),(114,'Donations',2500,1,NULL,NULL,37,2500,'2001-01-01 00:00:00.0'),(115,'Food',5000,1,NULL,NULL,38,5000,'2001-01-01 00:00:00.0'),(116,'Requirements',4000,1,NULL,NULL,39,4000,'2001-01-01 00:00:00.0'),(117,'Equipment',3000,1,NULL,NULL,40,3000,'2001-01-01 00:00:00.0'),(118,'Requirements',2000,1,NULL,NULL,41,2000,'2001-01-01 00:00:00.0'),(119,'Activity Equipment',2500,1,NULL,NULL,42,2500,'2001-01-01 00:00:00.0'),(120,'Food',2500,1,NULL,NULL,42,2500,'2001-01-01 00:00:00.0'),(121,'Activity Equipment',2500,1,NULL,NULL,43,2500,'2001-01-01 00:00:00.0'),(122,'Food',2500,1,NULL,NULL,43,2500,'2001-01-01 00:00:00.0'),(123,'Activity Equipment',2500,1,NULL,NULL,44,2500,'2001-01-01 00:00:00.0'),(124,'Food',2500,1,NULL,NULL,44,2500,'2001-01-01 00:00:00.0'),(125,'Activity Equipment',3000,1,NULL,NULL,45,3000,'2001-01-01 00:00:00.0'),(126,'Activity Equipment',5000,1,NULL,NULL,46,5000,'2001-01-01 00:00:00.0'),(127,'Food',5000,1,NULL,NULL,46,5000,'2001-01-01 00:00:00.0'),(128,'Activity Equipment',5000,1,NULL,NULL,47,5000,'2001-01-01 00:00:00.0'),(129,'Activity Equipment',2500,1,NULL,NULL,48,2500,'2001-01-01 00:00:00.0'),(130,'Food',2500,1,NULL,NULL,48,2500,'2001-01-01 00:00:00.0'),(131,'Activity Equipment',3000,1,NULL,NULL,49,3000,'2001-01-01 00:00:00.0'),(132,'Activity Equipment',5000,1,NULL,NULL,50,5000,'2001-01-01 00:00:00.0'),(133,'Activity Equipment',2500,1,NULL,NULL,51,2500,'2001-01-01 00:00:00.0'),(134,'Food Snacks',2500,1,NULL,NULL,51,2500,'2001-01-01 00:00:00.0'),(135,'Activity Equipment',2500,1,NULL,NULL,52,2500,'2001-01-01 00:00:00.0'),(136,'Food',2500,1,NULL,NULL,52,2500,'2001-01-01 00:00:00.0'),(137,'Activity Equipment',2500,1,NULL,NULL,53,2500,'2001-01-01 00:00:00.0'),(138,'Food',2500,1,NULL,NULL,53,2500,'2001-01-01 00:00:00.0'),(139,'Activity Equipment',3000,1,NULL,NULL,54,3000,'2001-01-01 00:00:00.0'),(140,'Activity Equipment',3000,1,NULL,NULL,55,3000,'2001-01-01 00:00:00.0'),(141,'Food',3000,1,NULL,NULL,56,3000,'2001-01-01 00:00:00.0'),(142,'Activity Equipment',2500,1,NULL,NULL,57,2500,'2001-01-01 00:00:00.0'),(143,'Food',2500,1,NULL,NULL,57,2500,'2001-01-01 00:00:00.0'),(144,'Activity Equipment',3000,1,NULL,NULL,58,3000,'2001-01-01 00:00:00.0'),(145,'Activity Equipment',40000,1,NULL,NULL,59,40000,'2001-01-01 00:00:00.0'),(146,'Food',10000,1,NULL,NULL,59,10000,'2001-01-01 00:00:00.0'),(147,'Activity Equipment',2500,1,NULL,NULL,60,2500,'2001-01-01 00:00:00.0'),(148,'Food',2500,1,NULL,NULL,60,2500,'2001-01-01 00:00:00.0'),(149,'Activity Equipment',2500,1,NULL,NULL,61,2500,'2001-01-01 00:00:00.0'),(150,'Food',2500,1,NULL,NULL,61,2500,'2001-01-01 00:00:00.0'),(151,'Activity Equipment',2500,1,NULL,NULL,62,2500,'2001-01-01 00:00:00.0'),(152,'Food',2500,1,NULL,NULL,62,2500,'2001-01-01 00:00:00.0'),(153,'Activity Equipment',2500,1,NULL,NULL,63,2500,'2001-01-01 00:00:00.0'),(154,'Food',2500,1,NULL,NULL,63,2500,'2001-01-01 00:00:00.0');
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
) ENGINE=InnoDB AUTO_INCREMENT=77 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `seproposal_personresponsible`
--

LOCK TABLES `seproposal_personresponsible` WRITE;
/*!40000 ALTER TABLE `seproposal_personresponsible` DISABLE KEYS */;
INSERT INTO `seproposal_personresponsible` VALUES (50,'Jeremy','Cruz',37),(51,'Dino','Alcala',38),(52,'Rey Gamboa','reyg@gmail.com',39),(53,'Khalid','Pastor',40),(54,'Gian','Ericson',41),(55,'Gordon','Ramsay',42),(56,'Grace','Poe',43),(57,'Earle','Calantuan',44),(58,'Mora','Dela Torre',45),(59,'Dino Alcala','dinoo@gmail.com',46),(60,'Angelo','Santos',47),(61,'Karl Madrid','kvm@gmail.com',48),(62,'Luis Grefiel',' lg@gmail.com',49),(63,'Kae Cruz','kc@gmail.com',50),(64,'Michael Jordan','mj@gmail.com',51),(65,'Kate Cruz','kc@gmail.com',52),(66,'Josh Groban','jg@gmail.com',53),(67,'Josh Garcia','jg@gmail.com',54),(68,'Junnel Magsalin','jm@gmail.com',55),(69,'Bea Cruz','bc@gmail.com',56),(70,'Kyra Marine','kyra@gmail.com',57),(71,'Jason Cruz','jc@gmail.com',58),(72,'Drake Zen','drake@gmail.com',59),(73,'Sean Cruz','sc@gmail.com',60),(74,'Khalid Malo','kram@gmail.com',61),(75,'Luis Grefiel','lg@gmail.com',62),(76,'Nasol, Carlo','cn@gmail.com',63);
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `seproposal_revisions_measures`
--

LOCK TABLES `seproposal_revisions_measures` WRITE;
/*!40000 ALTER TABLE `seproposal_revisions_measures` DISABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=122 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `seproposal_workplan`
--

LOCK TABLES `seproposal_workplan` WRITE;
/*!40000 ALTER TABLE `seproposal_workplan` DISABLE KEYS */;
INSERT INTO `seproposal_workplan` VALUES (83,'2019-03-12','Team Meeting','9AM','10AM','Henry Sy Grounds',37),(84,'2019-03-15','Charity Donation','3PM','4PM','Antipolo Hills',37),(85,'2019-03-16','Food gathering','10AM','11AM','Henry Grounds',38),(86,'2019-03-16','Food sharing','12:30PM','2:00PM','Henry Grounds',38),(87,'2019-03-15','Requirements Gathering','10AM','11AM','Henry 5th Floor',39),(88,'2019-03-16','Equipment Gathering','9AM','10AM','Henry 4th Floor',40),(89,'2019-03-22','Requirements Gathering','10AM','11AM','Henry, 3rd floor',41),(90,'2019-03-26','Requirements Gathering','10AM','11AM','Henry 5th Floor',42),(91,'2019-03-27','Requirements Gathering','10AM','11AM','Henry, 6th Floor',43),(92,'2019-03-29','Team Meeting','9AM','10AM','Henry, 6th Floor',43),(93,'2019-03-28','Team Meeting','10AM','11AM','Henry, 4th Floor',44),(94,'2019-03-26','Team Meeting','12PM','2PM','Henry, 3rd Floor',45),(95,'2019-03-20','Team Meeting','10AM','11AM','Henry, 5th Floor',46),(96,'2019-03-12','Team Meeting','10AM','11AM','Henry, 4th Floor',47),(97,'2019-03-21','Requirements Gathering','10AM','11AM','Henry, 5th Floor',48),(98,'2019-03-21','Team Meeting','3PM','5PM','Henry, 5th Floor',48),(99,'2019-03-22','Team Meeting','12PM','1PM','Henry Grounds',49),(100,'2019-03-21','Team Meeting','10AM','11AM','Henry, 5th Floor',50),(101,'2019-03-22','Requirements Gathering','5PM','6PM','Henry, 5th Floor',50),(102,'2019-03-20','Team Meeting','10AM','11AM','Henry Grounds',51),(103,'2019-03-20','Requirements Gathering','10AM','11AM','Henry, 3rd floor',52),(104,'2019-03-21','Team Meeting','1PM','3PM','Henry, 3rd floor',52),(105,'2019-03-22','Requirements Gathering','9AM','10AM','Henry, 3rd Floor',53),(106,'2019-03-23','Team Meeting','11AM','12PM','Henry, 3rd Floor',53),(107,'2019-03-15','Team Meeting','9AM','10AM','Henry, 5th floor',54),(108,'2019-03-15','Requirements Gathering','10AM','11AM','Henry, 5th Floor',55),(109,'2019-03-28','Team Meeting','3PM','4PM','Henry, 5th floor',56),(110,'2019-03-22','Requirements Gathering','10AM','11AM','Henry 5th Floor',57),(111,'2019-03-23','Team Meeting','2PM','3PM','Henry 6th Floor',57),(112,'2019-03-22','Team Meeting','10AM','11AM','Henry Grounds',58),(113,'2019-03-18','Requirements Gathering','10AM','11AM','Henry 7th Floor',59),(114,'2019-03-19','Team Meeting','1PM','3PM','Henry 7th Floor',59),(115,'2019-03-20','Team Meeting','10AM','11AM','Henry, 6th floor',60),(116,'2019-03-18','Requirements Gathering','10AM','11AM','Henry Grounds',61),(117,'2019-03-18','Team Meeting','3PM','5PM','Henry Grounds',61),(118,'2019-03-27','Requirements Gathering','10AM','11AM','Henry, 5th floor',62),(119,'2019-03-28','Team Meeting','10AM','11AM','Henry, 5th floor',62),(120,'2019-03-22','Requirements Gathering','10AM','11AM','Henry, 5th Floor',63),(121,'2019-03-22','Team Meeting','1PM','3PM','Henry, 5th Floor',63);
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
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
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sereport_attendees_temp`
--

LOCK TABLES `sereport_attendees_temp` WRITE;
/*!40000 ALTER TABLE `sereport_attendees_temp` DISABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
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
-- Table structure for table `totals`
--

DROP TABLE IF EXISTS `totals`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `totals` (
  `id` int(11) NOT NULL,
  `totalunits` int(11) DEFAULT NULL,
  `totalstudentorgs` int(11) DEFAULT NULL,
  `totalfacultydept` int(11) DEFAULT NULL,
  `totalstaff` int(11) DEFAULT NULL,
  `totalcap` int(11) DEFAULT NULL,
  `totalapsp` int(11) DEFAULT NULL,
  `totalasf` int(11) DEFAULT NULL,
  `totalfaculty` int(11) DEFAULT NULL,
  `totaladmin` int(11) DEFAULT NULL,
  `totalgrad` int(11) DEFAULT NULL,
  `totalundergrad` int(11) DEFAULT NULL,
  `totalinternationalstudents` int(11) DEFAULT NULL,
  `totaldepts` int(11) DEFAULT NULL,
  `totalalumni` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `totals`
--

LOCK TABLES `totals` WRITE;
/*!40000 ALTER TABLE `totals` DISABLE KEYS */;
INSERT INTO `totals` VALUES (1,15,10,39,700,100,150,120,300,45,200,1000,30,70,5000);
/*!40000 ALTER TABLE `totals` ENABLE KEYS */;
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

-- Dump completed on 2019-03-05 17:36:45
