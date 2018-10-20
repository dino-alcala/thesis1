CREATE DATABASE  IF NOT EXISTS `thsis01` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `thsis01`;
-- MySQL dump 10.13  Distrib 5.6.24, for Win64 (x86_64)
--
-- Host: localhost    Database: thsis01
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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `budget`
--

LOCK TABLES `budget` WRITE;
/*!40000 ALTER TABLE `budget` DISABLE KEYS */;
INSERT INTO `budget` VALUES (1,'2018-10-19',0,5000,-5000,1,0),(2,'2018-10-19',-5000,321313,-326313,7,0),(3,'2018-10-19',-326313,32,-326345,15,0),(4,'2018-10-20',-326345,13,-326358,22,0);
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
INSERT INTO `community` VALUES (1,'Khalid\'s Retirement Home','Khalid Malo','09291107660','24','Mabango Street','Barangay Rahim','Makati City','Khalid\'s Retirement Home',71),(2,'Karl\'s Community for the Jobless','Karl Madrid','09566082949','8','New York Street','Barangay KM','Quezon City','Karl\'s Community for the Jobless',71),(4,'Angelo\'s School for the Special','Angelo De Jesus','09174029299','17','Matuwid Street','Barangay Tibay','Paranaque City','Angelo\'s School for the Special',71);
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
INSERT INTO `department` VALUES (0,'No Department',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1,'Admin ',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(2,'Computer Technology (CT)',50,5,50,50,50,5,5,5),(3,'Information Technology (IT)',40,4,40,40,40,4,4,4),(4,'Software Technology (ST)',30,3,30,30,30,3,3,3),(5,'Counselling and Educational Psychology Department (CEPD)',30,40,40,50,30,50,30,40),(6,'Department of English and Applied Linguistics (DEAL)',30,40,40,50,30,50,30,40),(7,'Educational Leadership and Management Department (ELMD)',30,40,40,50,30,50,30,40),(8,'Physical Education Department (PED)',30,40,40,50,30,50,30,40),(9,'Science Education Department (SED)',30,40,40,50,30,50,30,40),(10,'Behavioral Sciences (BS)',30,40,40,50,30,50,30,40),(11,'Communication (COMM)',30,40,40,50,30,50,30,40),(12,'Literature (LIT)',30,40,40,50,30,50,30,40),(13,'Filipino (FIL)',30,40,40,50,30,50,30,40),(14,'History (HIS)',30,40,40,50,30,50,30,40),(15,'International Studies (IS)',30,40,40,50,30,50,30,40),(16,'Philosophy (PHILO)',30,40,40,50,30,50,30,40),(17,'Political Science (POLSCI)',30,40,40,50,30,50,30,40),(18,'Psychology (PSYCH)',30,40,40,50,30,50,30,40),(19,'Theology and Religious Education (TRED)',30,40,40,50,30,50,30,40),(20,'Biology (BIO)',30,40,40,50,30,50,30,40),(21,'Chemistry (CHEM)',30,40,40,50,30,50,30,40),(22,'Physics (PHYS)',30,40,40,50,30,50,30,40),(23,'Chemical Engineering (CHEMENG)',30,40,40,50,30,50,30,40),(24,'Civil Engineering (CIV)',30,40,40,50,30,50,30,40),(25,'Electronics and Communications Engineering (ECE)',30,40,40,50,30,50,30,40),(26,'Industrial Engineering (IE)',30,40,40,50,30,50,30,40),(27,'Manufacturing Engineering and Management (MEM)',30,40,40,50,30,50,30,40),(28,'Mechanical Engineering (ME)',30,40,40,50,30,50,30,40),(29,'Accountancy (ACC)',30,40,40,50,30,50,30,40),(30,'Commercial Law (CL)',30,40,40,50,30,50,30,40),(31,'Decision Sciences and Innovation Department (DSID)',30,40,40,50,30,50,30,40),(32,'Management of Financial Institutions (MFI)',30,40,40,50,30,50,30,40),(33,'Management and Organization Department (MOD)',30,40,40,50,30,50,30,40),(34,'Marketing Management (MM)',30,40,40,50,30,50,30,40),(35,'Industrial Applied Economics (IAE)',30,40,40,50,30,50,30,40),(36,'Financial Applied Economics (FAE)',30,40,40,50,30,50,30,40),(37,'Ladderized Applied Economics (LAE)',30,40,40,50,30,50,30,40),(38,'Management of Financial Institutions (MFI)',30,40,40,50,30,50,30,40),(39,'Management and Organization Department (MOD)',30,40,40,50,30,50,30,40),(40,'Marketing Management (MM)',30,40,40,50,30,50,30,40);
/*!40000 ALTER TABLE `department` ENABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
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
  `chairdirectorRemarks` varchar(500) DEFAULT NULL,
  `vplmRemarks` varchar(500) DEFAULT NULL,
  `deanunitRemarks` varchar(500) DEFAULT NULL,
  `assistantdeanRemarks` varchar(500) DEFAULT NULL,
  `ovplm1Remarks` varchar(500) DEFAULT NULL,
  `ovplm2Remarks` varchar(500) DEFAULT NULL,
  `lspoRemarks` varchar(500) DEFAULT NULL,
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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ffproposal`
--

LOCK TABLES `ffproposal` WRITE;
/*!40000 ALTER TABLE `ffproposal` DISABLE KEYS */;
INSERT INTO `ffproposal` VALUES (1,'Office of the Vice President for Lasallian Mission (OVPLM)','No Department','2018-10-06','Luis Grefiel','Recollection',1,2,6,'Kalbuhan 2018','Paranaque City','Bea S.','Kumalbo ng mga tao','2018-10-13',5000,'OVPLM',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,74,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ffproposal_attendees`
--

LOCK TABLES `ffproposal_attendees` WRITE;
/*!40000 ALTER TABLE `ffproposal_attendees` DISABLE KEYS */;
INSERT INTO `ffproposal_attendees` VALUES (1,'Lance Alunan','lance@gmail.com',1),(2,'Karl Madrid','karl@gmail.com',1),(3,'Dino Alcala','dino@gmail.com',1);
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
  PRIMARY KEY (`id`),
  KEY `LA15_idx` (`ffproposalID`),
  CONSTRAINT `LA15` FOREIGN KEY (`ffproposalID`) REFERENCES `ffproposal` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ffproposal_expenses`
--

LOCK TABLES `ffproposal_expenses` WRITE;
/*!40000 ALTER TABLE `ffproposal_expenses` DISABLE KEYS */;
INSERT INTO `ffproposal_expenses` VALUES (1,'Razor',10,5,NULL,1,50),(2,'Seat',100,5,NULL,1,500);
/*!40000 ALTER TABLE `ffproposal_expenses` ENABLE KEYS */;
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
  `targetKRA` varchar(500) DEFAULT NULL,
  `targetGoal` varchar(5000) DEFAULT NULL,
  `targetMeasure` varchar(500) DEFAULT NULL,
  `projectProponent` varchar(500) DEFAULT NULL,
  `personResponsible` varchar(500) DEFAULT NULL,
  `facilitatorName` varchar(500) DEFAULT NULL,
  `amountReceivedOVPLM` double DEFAULT NULL,
  `significanceProject` varchar(1000) DEFAULT NULL,
  `highlightsProject` varchar(1000) DEFAULT NULL,
  `majorProblems` varchar(1000) DEFAULT NULL,
  `otherRecommendations` varchar(1000) DEFAULT NULL,
  `annexes` longblob,
  `attendanceDLSU` longblob,
  `ffproposalID` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `LA22_idx` (`ffproposalID`),
  CONSTRAINT `LA22` FOREIGN KEY (`ffproposalID`) REFERENCES `ffproposal` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ffreport`
--

LOCK TABLES `ffreport` WRITE;
/*!40000 ALTER TABLE `ffreport` DISABLE KEYS */;
/*!40000 ALTER TABLE `ffreport` ENABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ffreport_objectives`
--

LOCK TABLES `ffreport_objectives` WRITE;
/*!40000 ALTER TABLE `ffreport_objectives` DISABLE KEYS */;
/*!40000 ALTER TABLE `ffreport_objectives` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ffreport_participants`
--

DROP TABLE IF EXISTS `ffreport_participants`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ffreport_participants` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `classification` varchar(500) DEFAULT NULL,
  `numberOfIndividuals` int(11) DEFAULT NULL,
  `ffreportID` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `LA23_idx` (`ffreportID`),
  CONSTRAINT `LA23` FOREIGN KEY (`ffreportID`) REFERENCES `ffreport` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ffreport_participants`
--

LOCK TABLES `ffreport_participants` WRITE;
/*!40000 ALTER TABLE `ffreport_participants` DISABLE KEYS */;
/*!40000 ALTER TABLE `ffreport_participants` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
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
) ENGINE=InnoDB AUTO_INCREMENT=190 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `informationsheet`
--

LOCK TABLES `informationsheet` WRITE;
/*!40000 ALTER TABLE `informationsheet` DISABLE KEYS */;
INSERT INTO `informationsheet` VALUES (1,'Admin','Admin','admin@gmail.com','Admin','Administrator',1,'admin','c7ad44cbad762a5da0a452f9e854fdc1e0e7a52a38015f23f3eab1d80b931dd472634dfac71cd34ebc35d16ab7fb8a90c81f975113d6c7538dc69dd8de9077ec'),(71,'Carmel','Carosa','carmel.carosa@dlsu.edu.ph','Office of the Vice President for Lasallian Mission (OVPLM)','OVPLM - Executive Officer',0,'carosa','28fa1fcc5ad52572cd57b7db7feeaf14382b9d719b255dd9fff7212cbd06ced12e2a7d7e45265a1fef33c1d63fe894da8c8502162eaf616ec20a44ff532a200f'),(74,'Michael','Broughton','michael.broughton@dlsu.edu.ph','Office of the Vice President for Lasallian Mission (OVPLM)','OVPLM - Vice President for Lasallian Mission',0,'michael','34e1fd6820ce1e79fbbdaae3fc708b634ab1d9765c215b7cd88d4c0c750e87b8c1d478b6112d95ae7bd165f9f73d165263ef7fcee357b48c6bc1f6b591f94ab8'),(75,'Neil','Penullar','neil.penullar@dlsu.edu.ph','Center for Social Concern and Action (COSCA)','COSCA - Sir Neil Position',0,'neil','0e1026d7c69f6e48c550d4c6f0296e4be95f960d15ff3eba2e8c5d8633f909bad6d6d806112dc7d8e3cdb80e7b22c08070a7fe1d70a74d9ac4de429fd4835444'),(76,'James','Laxa','james.laxa@dlsu.edu.ph','Lasallian Pastoral Office (LSPO)','LSPO - Director',0,'james','625f7fdb99de7de358ab119ead94c29b436764e1bffb3af4f1ca715b692cf155e62007572ce4101fef09a98130369de7a06ccd57903b4c5a9104d1444a02f4a2'),(77,'Margarita','Perdido','margarita_perdido@dlsu.edu.ph','Laguna Campus Lasallian Mission (LCLM)','LCLM - Executive Director',0,'margarita','aa08c20688b952d8119e1abac52e3c7bc0a918b10f5188c0c22fd4b36cb5bbbe626e25a71a6b02d071cb749f351937bcdb071c85cef71b3d7858abb2b3b17eb4'),(78,'Nelca','Villarin','nelca_villarin@dlsu.edu.ph','Dean of Student Affairs (DSA)','DSA - Dean',0,'nelca','759578037fdb24f7c6d6968c2e4dae34df944bd90507c336baedee5e57a7845a9d4cf59bcf2ca83bc1fbf55d332e86525d544968d6e5a3e074305750581fbe4c'),(79,'Fritzie','De Vera','fritzie.de.vera@dlsu.edu.ph','Center for Social Concern and Action (COSCA)','COSCA - Director',0,'fritzie','4ba090d4b0913b18790e889dba1a778af3b1e6b3f577cd0740b8bb521900f578200097589d24a01187350efd69b0168b00ba3d2ef00a79cbbcc71d9cb8f89d96'),(80,'deptchair','ccsct','deptchairccs@dlsu.edu.ph','College of Computer Studies (CCS)','CCSCT - Department Chair',2,'deptchairccsct','6d493c87e813256fdaa04e0fb21af39db4050353ad704be7642852fe50c4ac779622f277a2fec30747d058820d0955a85c2905ed01c3f3e508b247b81db7f238'),(81,'dean','ccs','ccsdean@dlsu.edu.ph','College of Computer Studies (CCS)','CCS - Dean',0,'ccsdean','da7f2a9da28aadd88bc66bbf6209b24dd4e6fa25c63c4e00c30f3698fe39605dff6b9ce63e8dcbb149a1a1306ad43a9af097b0238e5bacc31dfb3e2b6453b1be'),(82,'Diane','Ramos','diane.ramos@dlsu.edu.ph','College of Computer Studies (CCS)','CCS - ADEALM',0,'ccsadealm','2a095af73198792b4009add45468df1e99724305247bf0f9ff5707e6a43599cbf6885722fb7d5bd2f21e0407820387f0e4046f8d82cecf943ca98d86d39e1eb3'),(83,'unitrep','ccsct','unitrepccsct@dlsu.edu.ph','College of Computer Studies (CCS)','CCSCT - Unit Representative',2,'unitrepccsct','adde68203c9017d1778008099e80373aa83e15ba4ccd66f1f03048db729c215e6b5c21939c5918446b57c5694d64d96152c724a85a19c112f4fbedc40779e515'),(84,'ccsdean','ccsdean','ccsdean@dlsu.edu.ph','College of Computer Studies (CCS)','CCS - Dean',0,'ccsdean','da7f2a9da28aadd88bc66bbf6209b24dd4e6fa25c63c4e00c30f3698fe39605dff6b9ce63e8dcbb149a1a1306ad43a9af097b0238e5bacc31dfb3e2b6453b1be'),(85,'unitrep','ccsit','unitrepccsit@dlsu.edu.ph','College of Computer Studies (CCS)','CCSIT - Unit Representative',3,'unitrepccsit','cc795c0f7f451aca96006551e0d3d274e8b546d64701be0a3523697e61ade64ba36f7ae8f691089df163b8215bfab4e3f1683b5fb1f4d6151b5c00b91d04f9b3'),(86,'unitrep','ccsst','unitrepccsst@dlsu.edu.ph','College of Computer Studies (CCS)','CCSST - Unit Representative',4,'unitrepccsst','84b6275070ff95eb2615105dfc182ba91a38fee2c38abb1d3f90a8601a5f8897a5aec61ae0dc94a3ef7e6c17c1ca2987f942f81e951fb2b0c13821d102a0484f'),(87,'deptchair','ccsit','deptchairccsit@dlsu.edu.ph','College of Computer Studies (CCS)','CCSIT - Department Chair',3,'deptchairccsit','24067f1c587b1e7c1350e54ca7abdcc2523cf372271469862a7b56ab3ae878fb9a0051a5dca8b7b51aed1c72ea2d36d4c21e6997aa0dee7ec21dfc145d69dd60'),(88,'deptchair','ccsst','deptchairccsst@dlsu.edu.ph','College of Computer Studies (CCS)','CCSST - Department Chair',4,'deptchairccsst','5840c750402750e0cfff9c1bc09dfab251be4f7b23dcd15b34d7a61ddf21b90faf0ac3a149e23560e30d5db12777eeec90bbfbfb4077da0e6923bb24d8650f9b'),(89,'unitrep','rvrcobacc','unitreprvrcobacc@dlsu.edu.ph','Ramon V. Del Rosario College of Business (RVR-COB)','RVRCOBACC - Unit Representative',29,'unitreprvrcobacc','406a5d65ebb7f61d64859d2e73dce4c4e5052075f58b0b535941c80a50c89561c31d0485f352b22fe89515e6840c32c8cc7bcbffcc687ba7148d53bffeae609c'),(90,'unitrep','rvrcobcl','unitreprvrcobcl@dlsu.edu.ph','Ramon V. Del Rosario College of Business (RVR-COB)','RVRCOBCL - Unit Representative',30,'unitreprvrcobcl','1d4352edb7161789a1adea3d439ad86a2507f1e9bbca0c084a1cacb7d9e22d2237dedf4713f902178e304cd77cc0cc6ca5ae5abc1461f4b2e6a727a143de296f'),(91,'unitrep','rvrcobdsid','unitreprvrcobdsid@dlsu.edu.ph','Ramon V. Del Rosario College of Business (RVR-COB)','RVRCOBDSID - Unit Representative',31,'unitreprvrcobdsid','90b9815b200a19440b8d5161d7c2ca680693170b67dfc751ce3a45a63c7ca2b0c51ba19ae3eb3ed9194e06768901eee440fe9d7a7e30e718c639ae8da091dc94'),(92,'unitrep','rvrcobmfi','unitreprvrcobmfi@dlsu.edu.ph','Ramon V. Del Rosario College of Business (RVR-COB)','RVRCOBMFI - Unit Representative',32,'unitreprvrcobmfi','0193f8beaa5eca0758ec518c679a796066163fd39b8b4e6c140d56851a6f285a6f5fe8547112d50746a1b7d1ac8ccd839878ed2eb37395d5a7d4510885dbfde7'),(93,'unitrep','rvrcobmod','unitreprvrcobmod@dlsu.edu.ph','Ramon V. Del Rosario College of Business (RVR-COB)','RVRCOBMOD - Unit Representative',33,'unitreprvrcobmod','13c31542f36a515dd635e4c88624d013581405e80817ff90af6a212cfebd47a6fadb9eb7d154327c9e475b50062a2bce36198ad45ae6e6c7e16494e26e4fe505'),(94,'unitrep','rvrcobmm','unitreprvrcobmm@dlsu.edu.ph','Ramon V. Del Rosario College of Business (RVR-COB)','RVRCOBMM - Unit Representative',34,'unitreprvrcobmm','e4c6ffb7c1ec890c49de6648f93e2e31a0d3b5dd5a79d0bc105353de197a4db14ec1ceb7bb591eace36b3eb80b9a315d41717f50dd9a444da41564fd286b33e7'),(95,'deptchair','rvrcobacc','deptchairrvrcobacc@dlsu.edu.ph','Ramon V. Del Rosario College of Business (RVR-COB)','RVRCOBACC - Department Chair',29,'deptchairrvrcobacc','17f33d134ed7957b04115976d624d231733a716e70b62f4c0bfe15c24a805b1a8abb78947c9855f994fc5fc4c3a4bb80d1ec220319f7a2f8c80d53f71bd5b1b0'),(96,'deptchair','rvrcobcl','deptchairrvrcobcl@dlsu.edu.ph','Ramon V. Del Rosario College of Business (RVR-COB)','RVRCOBCL - Department Chair',30,'deptchairrvrcobcl','7f73f46be50f7e2ce830451a5ae5268f37badb6513aa257e03c9d00eee126c4b4867267fda8d72480fb60fcf7d4f74206645be486a53d26fde82f60caca94127'),(97,'deptchair','rvrcobdsid','deptchairrvrcobdsid@dlsu.edu.ph','Ramon V. Del Rosario College of Business (RVR-COB)','RVRCOBDSID - Department Chair',31,'deptchairrvrcobdsid','6919d0a928758f4a611aa33bb5c6bedbcbe0bac0e069b44e9f3d84fbdc32feca0c322b24acad8e13a58b8c2587b30b6f63c9168f3bba059d5aedf260a28a326e'),(98,'deptchair','rvrcobmfi','deptchairrvrcobmfi@dlsu.edu.ph','Ramon V. Del Rosario College of Business (RVR-COB)','RVRCOBMFI - Department Chair',32,'deptchairrvrcobmfi','90b9815b200a19440b8d5161d7c2ca680693170b67dfc751ce3a45a63c7ca2b0c51ba19ae3eb3ed9194e06768901eee440fe9d7a7e30e718c639ae8da091dc94'),(99,'deptchair','rvrcobmod','deptchairrvrcobmod@dlsu.edu.ph','Ramon V. Del Rosario College of Business (RVR-COB)','RVRCOBMOD - Department Chair',33,'deptchairrvrcobmod','e565544fab154cdfe84965e955760403a4586ad89ef6947be1e42b99543496717049dc6f659555aab9ddeb2bb99cf7ff8ea0042f08a05807f0135bb39722a8d1'),(101,'deptchair','rvrcobmm','deptchairrvrcobmm@dlsu.edu.ph','Ramon V. Del Rosario College of Business (RVR-COB)','RVRCOBMM - Department Chair',34,'deptchairrvrcobmm','58047de0ed2df3e3cf4f6b246c906bb1f4efd998af50bc1e2173fde802b8bc7b48035f514754f526ee4a44e9df118346248834ecb0c774828599af5b44e77b21'),(104,'unitrep','clabs','unitrepclabs@dlsu.edu.ph','College of Liberal Arts (CLA)','CLABS - Unit Representative',10,'unitrepclabs','1d50c3bb6d84e148987a3932e82e271e232220f1ad7f62b52c4f3e5107483e0269f5bfcc8af5793df4878e689b11aa108667397a94437fa01981e35b9bb46540'),(105,'unitrep','clacomm','unitrepclacomm@dlsu.edu.ph','College of Liberal Arts (CLA)','CLACOMM - Unit Representative',11,'unitrepclacomm','1b17dc4d260ac51e6c0f8083991b7b970fd383394cf31692fa817f84cdcaf849355e8b99b4ead6260b71a8653f16365b880dd3442bbdf2d785ddd3a6ef9d8192'),(106,'unitrep','clalit','unitrepclalit@dlsu.edu.ph','College of Liberal Arts (CLA)','CLALIT - Unit Representative',12,'unitrepclalit','9d21f465d5defe9a3a224918021281575316599894b503f6b195a84b8b62b9cf6154cd3614742d31507acad347520436084d1c55f9b02510cf4bc818aea39d29'),(107,'unitrep','clafil','unitrepclafil@dlsu.edu.ph','College of Liberal Arts (CLA)','CLAFIL - Unit Representative',13,'unitrepclafil','d08ae5304edb03b6058d35775fe7aef19278468709e3b89c52efab6ed040fa23edf1cc086ff205abf6820e4a0bfac99973a8f188557bc50ec838d4421f0a1a15'),(108,'unitrep','clahis','unitrepclahis@dlsu.edu.ph','College of Liberal Arts (CLA)','CLAHIS - Unit Representative',14,'unitrepclahis','f95a17b26558112fe79210e7439fccc0ec14540539b1c00e5f9bc0d64afdbfd561a241a8c18454b32249e877d0671cabb73a880c0d9e6fc37be63091fc1e7cbb'),(109,'unitrep','clais','unitrepclais@dlsu.edu.ph','College of Liberal Arts (CLA)','CLAIS - Unit Representative',15,'unitrepclais','f629c025af8b7c7c233e5b238bc103ed074c056f1a52b5659fbde843e0d8fb2f4c24964423d3fdc1d77a6fdfa3a5203af551af6108b3fd8d0431235c45342e53'),(110,'unitrep','claphilo','unitrepclaphilo@dlsu.edu.ph','College of Liberal Arts (CLA)','CLAPHILO- Unit Representative',16,'unitrepclaphilo','ebbf5e2e6732cf8bf566f0b4d55b9710d7df5b6b618803f2603053b3f9f47d7199dbb4ece8e676a9708e6260ccec77a58bb8722b3786b5a1445ecee16c818962'),(111,'unitrep','clapolsci','unitrepclapolsci@dlsu.edu.ph','College of Liberal Arts (CLA)','CLAPOLSCI - Unit Representative',17,'unitrepclapolsci','a3c90080b35e9f32c8c9c612059f2553fc1fe67c3b4213db1f04aaf96e989ecc44f3b287d1d5ed17e6dd823cd016ff99721fc035c0ee4ef2aaa274e0181a9dd9'),(112,'unitrep','clapsych','unitrepclapsych@dlsu.edu.ph','College of Liberal Arts (CLA)','CLAPSYCH - Unit Representative',18,'unitrepclapsych','b83cba723e88a0ac30ab61312d6324479e13ff0db92dd01c4fa3ce3dd354a1eacbffe88bdfe502024a9f38bf77ae9217ccb856c7eeadf1ba508a383a2b2833eb'),(113,'unitrep','clatred','unitrepclatred@dlsu.edu.ph','College of Liberal Arts (CLA)','CLATRED - Unit Representative',19,'unitrepclatred','d1ed2d4f6cecc122061b5ebbf4f1351a4e53a51b16286a43237b8a1d8bd800107ebbc7ff4d3175f4071e26c153573ca6dce1d685c0c98c4d9e40144759ecdb4c'),(114,'deptchair','clabs','deptchairclabs@dlsu.edu.ph','College of Liberal Arts (CLA)','CLABS - Department Chair',10,'deptchairclabs','65217899703cb77257f8356d7e9d31044b86a8ee6065915e75e201b4dabd6f16f8d98c339fbc2b7b6ab68d0ffa67c85c9db701be17e94847cb75c690f753904c'),(115,'deptchair','clacomm','deptchairclacomm@dlsu.edu.ph','College of Liberal Arts (CLA)','CLACOMM - Department Chair',11,'deptchairclacomm','e93e47ecdfb519ff7a30961bbf9bde3c78bdb811cc6c3f8841861585ce1456032cd2d2856ef568f38951f7ef55425e3a2359b8baa69cd7151c25fcdd6269103b'),(116,'deptchair','clalit','deptchairclalit@dlsu.edu.ph','College of Liberal Arts (CLA)','CLALIT - Department Chair',12,'deptchairclalit','c4a9305650b9fd0d0495386a0d66542f11a7efc80c1f44c88680aeb2132bebb85f1b6eba226cceb1ce15524ce5fef34f7ba44bd56db368a0776655a47f5de437'),(117,'deptchair','clafil','deptchairclafil@dlsu.edu.ph','College of Liberal Arts (CLA)','CLAFIL - Department Chair',13,'deptchairclafil','c094e7da76847f55798cbf5d39a77a142008674264b17ab73b88ce5778e34c36cab34f990b89ebf4a1047d23f36d81ab80066f4afc309ef3c5d9605cbb3f3c99'),(118,'deptchair','clahis','deptchairclahis@dlsu.edu.ph','College of Liberal Arts (CLA)','CLAHIS - Department Chair',14,'deptchairclahis','0e13d9bc0fa7a23097990119b4ff8574911e2d03ea4e42a07312b0dbf068e157ab0e2adbde68c728544952a6a890fc00490424ad6dff38e0283b5d74c492149c'),(119,'deptchair','clais','deptchairclais@dlsu.edu.ph','College of Liberal Arts (CLA)','CLAIS - Department Chair',15,'deptchairclais','c0a14eff996d128ee3607c1470d5938450ec89e42c296b6e58bf6393233479e47b6c5a314de4f5096780710b0f6467e3a7783dfae77fb4218e212fb0e63c8b27'),(120,'deptchair','claphilo','deptchairclaphilo@dlsu.edu.ph','College of Liberal Arts (CLA)','CLAPHILO - Department Chair',16,'deptchairclaphilo','2d48beec90c5bb5d88a035f3e332210c03afefcd6f6f98e1d7093707ca0eb9b7a5c09638bd93d6b536c871339cbac7cdfda7b9c0bd6c022305bfabfad62acf19'),(121,'deptchair','clapolsci','deptchairclapolsci@dlsu.edu.ph','College of Liberal Arts (CLA)','CLAPOLSCI - Department Chair',17,'deptchairclapolsci','f8a9732c8ab0569b65683aa388db7b151b801d6066c5b491b49e2932d35507621067a69b2ffd9f99dfaf044923b561dd2a87a1a815618702546d013071f6a33d'),(122,'deptchair','clapsych','deptchairclapsych@dlsu.edu.ph','College of Liberal Arts (CLA)','CLAPSYCH - Department Chair',18,'deptchairclapsych','af55d061c7fe6dd1f820e2b787ac38e31bea8f78cc8724dc48b1f8d665e780cfdbea4a552b452c145db415fa2db0a2e2281fa72dff6b30d9897c6b06d341c0ea'),(123,'deptchair','clatred','deptchairclatred@dlsu.edu.ph','College of Liberal Arts (CLA)','CLATRED - Department Chair',19,'deptchairclatred','5e6a6e2198027f55274de34bf53892886f0e71052fd49c28dcb259241074d9b3b324f41dca9e33e835ff0a7a8869fcc393f3e3db068488000db0021602b78122'),(124,'cla','adealm','claadealm@dlsu.edu.ph','College of Liberal Arts (CLA)','CLA - ADEALM',0,'claadealm','df9a7db63cbbabba983391b2f3c9e937a9d6a499e3450b42b70d404ec57a0c8516183464f3e9d73fb35bb58dbba9250897cc8b4dec50987d9d2b74342dffc8d6'),(125,'cla','dean','cladean@dlsu.edu.ph','College of Liberal Arts (CLA)','CLA - Dean',0,'cladean','cf7719a92f1786be67d872f2f3d8637ecbce8ad9f3f0a28292511ed71ed1d6bcc19c47406bba51a2e06dbc0a859c274b03920956330da3d7303567bebe741ab9'),(126,'unitrep','soeiae','unitrepsoeiae@dlsu.edu.ph','School of Economics (SOE)','SOEIAE - Unit Representative',35,'unitrepsoeiae','3a28a7cf79818030b7863544a6712ae6df60068678a0e7e47aa7712741189385625bf7713af82537754cebd6b7855df2fae8008fa64207ef25db3ae343c4c4e2'),(127,'unitrep','soefae','unitrepsoefae@dlsu.edu.ph','School of Economics (SOE)','SOEFAE - Unit Representative',36,'unitrepsoefae','200f985df9ace2e7470acf684a6ade0803eb81c5536d8112759bbab2ac7b52113a88f8bb9242434a673f1d61ffdfbdff37d48c0ed2bcf752cb9fc92cc1bc3b0a'),(128,'unitrep','soelae','unitrepsoelae@dlsu.edu.ph','School of Economics (SOE)','SOELAE - Unit Representative',37,'unitrepsoelae','720ffa71c3a1f495354765939b6a5f292b7aeed7d1c7c1e1a94a9776a674e2580debde428119f2386792fc1d9fded00b18c078d4c0e1932907ab77c59589f641'),(129,'unitrep','soemfi','unitrepsoemfi@dlsu.edu.ph','School of Economics (SOE)','SOEMFI - Unit Representative',38,'unitrepsoemfi','f79a489f30614e8c732fbb27d5ba5450ff2c64b47afcbca5d495107a791ad2c6da48bf1c686347fe9a957ac4b3215fac5992bd84f195325797b11dad1321236f'),(130,'unitrep','soemod','unitrepsoemod@dlsu.edu.ph','School of Economics (SOE)','SOEMOD - Unit Representative',39,'unitrepsoemod','429dd6dfd5380e98e3d06554967df2843ffb7d29122a582eea130067439ef0ab382d6f0d3b9a6e452b249331381fc4c6c4e08a73da88e14190e9d142e0ada689'),(131,'unitrep','soemm','unitrepsoemm@dlsu.edu.ph','School of Economics (SOE)','SOEMM - Unit Representative',40,'unitrepsoemm','0ee0be6d139540389341b0cdc65808f797d66e0ad09b068a8bb5931e9c6f3093160aa83ca02e761354fe1b0b8cd98d29d4a5175de2c4684a53ec4d97011e7676'),(132,'deptchair','soeiae','deptchairsoeiae@dlsu.edu.ph','School of Economics (SOE)','SOEIAE - Department Chair',35,'deptchairsoeiae','8f02d94b7b0d794cdd8bff59c64d5373b89261b4f3cbc439819394dfcb4c9d36400d880bd169607155188b83b343336909525118eca5ac93c95cd8e5fbe9afa2'),(133,'deptchair','soefae','deptchairsoefae@dlsu.edu.ph','School of Economics (SOE)','SOEFAE - Department Chair',36,'deptchairsoefae','eb2cf7e393ad68830aabae8a44992294eb0051c8cbbcfd87bb2f560cbb1143ba551322f246074f6ad8368d90b753ecc1541a35894bfc0956a165ad7a28788ae3'),(134,'deptchair','soelae','deptchairsoelae@dlsu.edu.ph','School of Economics (SOE)','SOELAE - Department Chair',37,'deptchairsoelae','cc2959d131f787f8ae9c4cd597fd94054d3786e84d454a1ce67c977c17544b128c7e2a73196f6ce0ea29c6d9ec7114ec3e5a30047f31ffa10b0543a5d9e7b844'),(135,'deptchair','soemfi','deptchairsoemfi@dlsu.edu.ph','School of Economics (SOE)','SOEMFI - Department Chair',38,'deptchairsoemfi','e317bea34e69fdf59d5abbe7ef2f81064ceac4a375e1cf6b48e56d62f8e9fbb2a1a93456cbd64b6c8cd2c7623b45572dda43eb589c435192c239cc9a3db59f2e'),(136,'deptchair','soemod','deptchairsoemod@dlsu.edu.ph','School of Economics (SOE)','SOEMOD - Department Chair',39,'deptchairsoemod','3e6098fcf7bd1e16f71194b55ab0638011cfe7c520fea2bf4f5717141a800d9592f6b6f63926c869b901b8b0b07484561bee0f7196fe811d303ee9f56f2efd3e'),(137,'deptchair','soemm','deptchairsoemm@dlsu.edu.ph','School of Economics (SOE)','SOEMM - Department Chair',40,'deptchairsoemm','de295557ade21ad0ccbccaf82981fde7304fb7129d41e4177d7161520cd94562e98080a1703870da6b44dec72d165b5a014055df4b706bc44efcbd0d821ac6b5'),(138,'soe','adealm','soeadealm@dlsu.edu.ph','School of Economics (SOE)','SOE - ADEALM',0,'soeadealm','cd977bf1bce839d6e6702902d6e8da747e8e8a40229810e630f92cd715a9744f3faf3378c2b58ef34980a939ebe5e0cc3cabf65f47a7098162da4d282e29b75a'),(139,'soe','dean','soedean@dlsu.edu.ph','School of Economics (SOE)','SOE - Dean',0,'soedean','4943c9a66ba2bec804866a5ec4eaa799b4a89751c10998483e17f5415b146c7560f940f4ccf79c95a0470d8eb51960de1c4e48b9e8ef1075126966e4aed8039b'),(140,'unitrep','bagcedcepd','unitrepbagcedcepd@dlsu.edu.ph','Br. Andrew Gonzales College of Education (BAGCED)','BAGCEDCEPD - Unit Representative',5,'unitrepbagcedcepd','d7f829b5dc4e88b2dd2684a0a2248ee85d64effd39d3b42906a592ba7adf6a0ec6c80862c367593bf997f6a8054053248a4e6436f0a7ad6ba51a8462350e7598'),(141,'unitrep','bagceddeal','unitrepbagceddeal@dlsu.edu.ph','Br. Andrew Gonzales College of Education (BAGCED)','BAGCEDDEAL - Unit Representative',6,'unitrepbagceddeal','d08fb1a12d2bd865627ef81813e4442c86ba99e513d27525b9db34b2527abb6827e87734164dbcd18e180d446dfd856e87b5963e4103b47f982d694b135df959'),(142,'unitrep','bagcedelmd','unitrepbagcedelmd@dlsu.edu.ph','Br. Andrew Gonzales College of Education (BAGCED)','BAGCEDELMD - Unit Representative',7,'unitrepbagcedelmd','10515bb7f3fd9aacb29a3d20803ec0965cf68576895c707d10fd0e64355e4187a5a8b925c1f8f1e7e41dd056b67d119b0f97a17638c3d546fe92f259cc9c6992'),(143,'unitrep','bagcedped','unitrepbagcedped@dlsu.edu.ph','Br. Andrew Gonzales College of Education (BAGCED)','BAGCEDPED - Unit Representative',8,'unitrepbagcedped','50249b166a07b1be09c0a962b85d94277feca7cf22e48122b9a4e23eae94f9a66609110a61ec70ffc2cab2125b23a3f28ffc32be6a53980b5f3762a819510c3e'),(144,'unitrep','bagcedsed','unitrepbagcedsed@dlsu.edu.ph','Br. Andrew Gonzales College of Education (BAGCED)','BAGCEDSED - Unit Representative',9,'unitrepbagcedsed','ce3edbebca349c61411aeb90e536c3abc22d63efb4a0f2c308e0511292e21c2c49069b0cf85d5d414fefb405f41f477b76b4f86a9e0f140e34b3d88279432860'),(145,'deptchair','bagcedcepd','deptchairbagcedcepd@dlsu.edu.ph','Br. Andrew Gonzales College of Education (BAGCED)','BAGCEDCEPD - Department Chair',5,'deptchairbagcedcepd','64a20783717f8ea07cf5f2828a4eda949613d543844e2dfc7e3a8daebc2fd39a8d04629c7d8166b505184ecd0524f88da7c748a032863eeb0f68e3367827c4c9'),(146,'deptchair','bagceddeal','deptchairbagceddeal@dlsu.edu.ph','Br. Andrew Gonzales College of Education (BAGCED)','BAGCEDDEAL - Department Chair',6,'deptchairbagceddeal','26c99b1d9942f49c610098ca57a165dde39437d7d024c2bafaf250c0349a16e5789366f4190d6d38ceaead66a4ce9159d8b38a5047e2d6489f568510a0846c67'),(147,'deptchair','bagcedelmd','deptchairbagcedelmd@dlsu.edu.ph','Br. Andrew Gonzales College of Education (BAGCED)','BAGCEDELMD - Department Chair',7,'deptchairbagcedelmd','12fc83cb60fa33c7dea8cf6ad28a3f186ad0e5305d7bd5f98e783fe26bf6f9dadb41c132ea6b9478fd08c87ff05004a6bfc6e5275f4f8ae6bf4c62a1aff02033'),(148,'deptchair','bagcedped','deptchairbagcedped@dlsu.edu.ph','Br. Andrew Gonzales College of Education (BAGCED)','BAGCEDPED - Department Chair',8,'deptchairbagcedped','74eca07404a187d643068885f3fbc7508c5b3546419dcb3d193d3d1964e30cab5481f0dbd2f8e32fbbf6fc32352631b1f607c02b222197aa7aed90074b6cbf68'),(149,'deptchair','bagcedsed','deptchairbagcedsed@dlsu.edu.ph','Br. Andrew Gonzales College of Education (BAGCED)','BAGCEDSED - Department Chair',9,'deptchairbagcedsed','604d524d7657adf48925e00e7b023fef2c1731b070b759232f4087aa7f8967b976639b394a5bee544bdcb6d6dd077ae79a4f087e7a29ba92a0bf47a16587fa48'),(150,'bagced','adealm','bagcedadealm@dlsu.edu.ph','Br. Andrew Gonzales College of Education (BAGCED)','BAGCED - ADEALM',0,'bagcedadealm','0b0d281dd4685d0958378b3b4f09aa71dbde6ba190f625143833cf529952a38a0dd5a7290d36c6a49348a9e517de6eafdc6c3c573f9a4da0c75c771eddbe2d64'),(151,'bagced','dean','bagceddean@dlsu.edu.ph','Br. Andrew Gonzales College of Education (BAGCED)','BAGCED - Dean',0,'bagceddean','ba34117288261efc18422b203e505afeeb37b1e0d8b43d2d3fa81f1024b8c8c921f324a4a6900f5344375c766a0a3803831a9b3572b23669172d1aae48f1ad2d'),(152,'unitrep','gcoechemeng','unitrepgcoechemeng@dlsu.edu.ph','Gokongwei College of Engineering (GCOE)','GCOECHEMENG - Unit Representative',23,'unitrepgcoechemeng','abf1878ee5f90cfd095caccc644324ecdfebcd2351b4d80ab7c3a6cd1bd11cc7398f8abab8fa553f4ef7f5957c11aee606ab4127f6feb41d4453f875e20de206'),(153,'unitrep','gcoeciv','unitrepgcoeciv@dlsu.edu.ph','Gokongwei College of Engineering (GCOE)','GCOECIV - Unit Representative',24,'unitrepgcoeciv','b5a41358d24f431d0a39f5a3c0b16e3a0a87f62885ce0d1c4ce3625b0d737baf9c3a60cf20b1963558ee59701d51c6009ef59de55cb75c28a494fcb0f5d0dd8d'),(154,'unitrep','gcoeece','unitrepgcoeece@dlsu.edu.ph','Gokongwei College of Engineering (GCOE)','GCOEECE - Unit Representative',25,'unitrepgcoeece','908902a9eb25f37a4cbd11d19e976757cdead9764ba00e47c9197c042ed31326fabe2af14db4b922b0d6b82cb19ad48084e373da401296cac5761ab688e4a991'),(155,'unitrep','gcoeie','unitrepgcoeie@dlsu.edu.ph','Gokongwei College of Engineering (GCOE)','GCOEIE - Unit Representative',26,'unitrepgcoeie','5975449ee94df16a6a656025e8584239a452bd345a78e0394192753a73a7f95248d0e9471898c1b90d80426aa7b799f51bd34cf47dfa63651975068d1b7d4200'),(156,'unitrep','gcoemem','unitrepgcoemem@dlsu.edu.ph','Gokongwei College of Engineering (GCOE)','GCOEMEM - Unit Representative',27,'unitrepgcoemem','8a96658f1982db617c9a1407ae602003fb1d92684db09affaecc005055bc59da63a262463503cda47c2a23ee992f61bd5e1305861f02532a86bdc2ba2115205c'),(157,'unitrep','gcoeme','unitrepgcoeme@dlsu.edu.ph','Gokongwei College of Engineering (GCOE)','GCOEME - Unit Representative',28,'unitrepgcoeme','d6bfa104504a0f23f37947d1e9b6a3fdfcd2a0d271eceabafa2fbaa4a7641edb2a2c5c4bbd4d377d0cbae6815d56bc64496d3cb16c3d96c7236a07e116765a05'),(158,'gcoe','adealm','gcoeadealm@dlsu.edu.ph','Gokongwei College of Engineering (GCOE)','GCOE - ADEALM',0,'gcoeadealm','4da2ca744a22b8958c7d7036c75fb507e3edc37c3b3bbb851170e4739c4e01e217a28e7a66a3210338c05cabfac72fe3cd4b9042680dc5340ee97c88c9aa76f8'),(159,'gcoe','dean','gcoedean@dlsu.edu.ph','Gokongwei College of Engineering (GCOE)','GCOE - Dean',0,'gcoedean','8d9196d0b7b2772d76e555857d0458abda4a5507978dd91cfb48825394a3439402970c85430f9db901d4bec1aa4a7b66de3420910561c4448718995614f24a43'),(161,'deptchair','gcoeciv','deptchairgcoeciv@dlsu.edu.ph','Gokongwei College of Engineering (GCOE)','GCOECIV - Department Chair',24,'deptchairgcoeciv','7a30b933704eb6ea2842b77dd4c3d2abeca9f3d325b05e7d94feb802b6f55ac6be624184649e29d4601e83ed32475bfc59606711f5e44e4df6a08ccd3d2b9525'),(162,'deptchair','gcoeece','deptchairgcoeece@dlsu.edu.ph','Gokongwei College of Engineering (GCOE)','GCOEECE - Department Chair',25,'deptchairgcoeece','3b022120c9a06ab76a7832e01f088f5e8fcda584a6e1c27514afe1c1edca5e493c5d80deb5847b30141c6ee794351c45213a359a7dd7e32c31c87b944f1db47f'),(163,'deptchair','gcoechemeng','deptchairgcoechemeng@dlsu.edu.ph','Gokongwei College of Engineering (GCOE)','GCOECHEMENG - Department Chair',23,'deptchairgcoechemeng','ff98a300a3741cf47287e5e7f1d0e1c8b7dd2b7d1b1a7cba70a5232b74c363e811819bc52ce1b3592d29af81843a91dc12c8a60d496218c2e5b1ecf5be52fba3'),(164,'deptchair','gcoeie','deptchairgcoeie@dlsu.edu.ph','Gokongwei College of Engineering (GCOE)','GCOEIE - Department Chair',26,'deptchairgcoeie','eee80356a20046cd7930944cdeb27f50c2c720bb47c6667639d56fad5e8eed12da2e95af6e91d2a6a8957d189f3835d670f703590e604beb6018050237f7fbef'),(165,'deptchair','gcoemem','deptchairgcoemem@dlsu.edu.ph','Gokongwei College of Engineering (GCOE)','GCOEMEM - Department Chair',27,'deptchairgcoemem','fdac8c6af0681488ce31712b3a938954402300c288c5cd2dc349b725e7867ed6da5c089df9096270c031bb538d19d4f0712a7b62c2bb98926cc3f72ec0c28382'),(166,'deptchair','gcoeme','deptchairgcoeme@dlsu.edu.ph','Gokongwei College of Engineering (GCOE)','GCOEME - Department Chair',28,'deptchairgcoeme','30f6a252a718a0e14764db999e92fc7b8c1dc64db97e4063368cd3217c0ab3d1f4238eb4754fbf883107154a99a1116d64c23e786de6c54d56156556229eaaef'),(167,'unitrep','cosboi','unitrepcosbio@dlsu.edu.ph','College of Science (COS)','COSBIO - Unit Representative',20,'unitrepcosbio','160ff2b4c21756053dec3cb0f85c0f4d795762190cc2b718e0f17256d86725e323f45ad0d12db6e7b63f577eb1d34b811082ae5a7a8f997feae7ba87897e2939'),(171,'deptchair','coschem','deptchaircoschem@dlsu.edu.ph','College of Science (COS)','COSCHEM - Department Chair',21,'deptchaircoschem','2fe76479c9cf5b6fe61f07c5a9a1fb5beaee3ff5fcadefce43437b7d76522c5bd4f15a045cf3bb589b1723cedf5de0e93e266e9d4901e6c69153500dd6e9335d'),(172,'unitrep','cosphys','unitrepcosphys@dlsu.edu.ph','College of Science (COS)','COSPHYS - Unit Representative',22,'unitrepcosphys','3ea6229f73d20b382c82398ed914444e019964d672bf9d3c8a96487225fa52a30c256fade71da7e5d416ba5031a13d1be81e18bf6092883dc4f406764104d007'),(173,'unitrep','coschem','unitrepcoschem@dlsu.edu.ph','College of Science (COS)','COSCHEM - Unit Representative',21,'unitrepcoschem','99e0f772b2675689f3f67e650c30ab273339cdf550e43782be5b29ba07a34e1435faae141ca0b0db94349cd05ef6e7df5699c66f1e98ab55508d36d33d19c298'),(174,'deptchair','cosbio','deptchaircosbio@dlsu.edu.ph','College of Science (COS)','COSBIO - Department Chair',20,'deptchaircosbio','51dc466e60847b1aa49958f259dbddb5efd26dc049348a8054e1d77cfe9ae7d4c42efd1044eb83712563280498b9f0f820b66d208abb6773707fd30e94cd2428'),(175,'deptchair','cosphys','deptchaircosphys@dlsu.edu.ph','College of Science (COS)','COSPHYS - Department Chair',22,'deptchaircosphys','0ffcbe2a34cec09496c38e39f4f7e5d91fcad16fe1a9f2bc284665a7ac8c55b342349ae6fcbda1a449b5342932cc4698824b18c8ecfb82b706704cd3b6dda8a7'),(176,'cos','adealm','cosadealm@dlsu.edu.ph','College of Science (COS)','COS - ADEALM',0,'cosadealm','e40e91fdfb30ecf80e2c8300e976a3aede59f4d28b3ddbcba7c6298d8b8b697f1f5eff8feafdc3b6ff675c6da198dcb3178c59e6853aa45ecea52eedd37c762f'),(177,'cos','dean','cosdean@dlsu.edu.ph','College of Science (COS)','COS - Dean',0,'cosdean','eab9c36968d8581a0ea727509dac441c61b8b6762f86dcef8e216afd39c7b666b825049fa463ef9952863e305c41d1562a5707199add6d9d6a2fd6fdb64bd584'),(178,'unitrep','unitrep','unitrepcol@dlsu.edu.ph','College of Law (COL)','COL - Unit Representative',0,'unitrepcol','11e584c6254c2f7c05a2fb9de13596122036bdfe90f81e42f1c782db1a0abbea545883cf43b2f88bd9ddca0d5a83a228c73b714ed6c6ea383b3474c60702be63'),(179,'deptchair','col','deptchaircol@dlsu.edu.ph','College of Law (COL)','COL - Department Chair',0,'deptchaircol','3bedb8f0692e8a9330207729cf5da9bebf66b736384ef760231670a489769519757eebcfc9223fe813a77b00f55698c7855756206f2bccba7ed2a60138ed88b4'),(180,'col','adealm','coladealm@dlsu.edu.ph','College of Law (COL)','COL - ADEALM',0,'coladealm','7fd684b876ee4dd2c7ae360856593fbbd1685f37e5f891286677bdc3b15f520d3b613d25e981da91743e3728639ccd69e98cf3870942d47412f792e47d323ff1'),(181,'col','dean','coldean@dlsu.edu.ph','College of Law (COL)','COL - Dean',0,'coldean','531e7c0755c6438ee60748f9809fd61796b0f1658b17bf2ec6a0dd9513b3c9a532b0ccfebb430cabaa4dbc5a596e59f846433bac8af958196104088bad555f27'),(182,'unitrep','cosca','unitrepcosca@dlsu.edu.ph','Center for Social Concern and Action (COSCA)','COSCA - Unit Rep',0,'unitrepcosca','90a7e0f58dbfc30df9ec5e53129db5400d14d6c5f1103608a9ec1cd6f9c441051c869a434e72200dc37819ef260f90049c5e42e6aa948a62bf988f6b952fc54d'),(183,'ccs','assistantdeanlm','ccs_assistantdeanlm@dlsu.edu.ph','College of Computer Studies (CCS)','CCS - Assistant Dean for Lasallian Mission',0,'ccsassistantdeanlm','c166189b2598bcde62c967b64ddfe0fe007f084cc150098f666b533daf0148f4846047515c65a0bdf70ad8b264e17ae63c6adaaaa2c8de2e084a3b645c125185'),(184,'rvrcob','assistantdeanlm','rvrcob_assistantdeanlm@dlsu.edu.ph','Ramon V. Del Rosario College of Business (RVR-COB)','RVRCOB - Assistant Dean for Lasallian Mission',0,'rvrcobassistantdeanlm','c853544e4a5b9f270dad35bf517f48e0beb4278a55c6a33a88bf6dceb62dc48d6e4e20777b1483f1ae1b09db4da1899c1d7e43456e3b72baf9bc3b22e69fd3ae'),(185,'rvrcob','adealm','rvrcob_adealm@dlsu.edu.ph','Ramon V. Del Rosario College of Business (RVR-COB)','RVRCOB - ADEALM',0,'rvrcobadealm','14034fda15dc56b76f301f964028060147edf85d558aca1b93d1e65df2d4d10fe0f362b018ec8104aeaefd869b8df0493ad1b82024734886b52379bc565851c1'),(186,'rvrcob','dean','rvrcob_dean@dlsu.edu.ph','Ramon V. Del Rosario College of Business (RVR-COB)','RVRCOB - Dean',0,'rvrcobdean','9c5f8e8fa4d3c97d4e8593cf9d1739ceab22086543d43fbcb4899ee5b24d15cd9756472c095f90389b701130b0dcfed85df99091ffd99ae6ae3d215f88f5492e'),(187,'ccsct','chairperson','ccsct_chairperson@dlsu.edu.ph','College of Computer Studies (CCS)','CCSCT - Chairperson',2,'ccsctchairperson','3a7cab1e7a36d73e778efeae4255c58c36403d857040a904db80c48c1d44f90b9535d215d5305efae294ead76e7cfafe90c03a822063dbcbd7e95c017a52092d'),(188,'ccsit','chairperson','ccsit_chairperson@dlsu.edu.ph','College of Computer Studies (CCS)','CCSIT - Chairperson',3,'ccsitchairperson','da973f96e635a3a18249dc14ac5f344127471f06ed7cddd818a415b0c212537e9f9c6c60ecb670104d27861406b25833ab90a5da7a2ad067f5bcebc73b8ce805'),(189,'ccsst','chairperson','ccsst_chairperson@dlsu.edu.ph','College of Computer Studies (CCS)','CCSST - Chairperson',4,'ccsstchairperson','6d8a9b3edb17223dce5a49310cb8802218ca21cc75f4d3c43c22d08d136fda654218f8494fa0367cf41628254c812f490bb9667bbebc7b8ef70c3ee2cd910a73');
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
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
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `measure`
--

LOCK TABLES `measure` WRITE;
/*!40000 ALTER TABLE `measure` DISABLE KEYS */;
INSERT INTO `measure` VALUES (1,'KRA3-G1-M1','Integration in curricular and co-curricular programs of formation based on Lasallian sprituality and mission','1. Development of Lasallian formation program for graduate students\r\n\r\n2. Existing Lasallian formation programs for undergraduate students have been reviewed and revised\r\n\r\n3. 50% of student organizations have implemented a Lasallian formation activity',1,1),(2,'KRA3-G1-M2','Participation of administrators, faculty, and personnel in Lasallian formation activity','1. 50% of Faculty Departments have undergone Lasallian Formation Programs\r\n\r\n2. 75% of Staff have undergone Lasallian Formation Programs\r\n\r\n3. All administrators have undergone the Lasallian formation activity',1,1),(3,'KRA3-G1-M3','Number of Lasallian formation activities available for other sectors in the DLSU community','1. At least one Lasallian formation activity engaging alumni, parents, and community partners',1,1),(4,'KRA3-G2-M1 ','Number of fora and other interdisciplinary activities focused on bridging faith and scholarship (e.g. ethics, heritage, culture, science, theology, philosophy)','1. At least one interdisciplinary activity conducted each term',1,2),(5,'KRA3-G2-M2 ','Integration of faith dimension using the Lasallian Reflection Framework (LRF) in GE courses','1. Review and integrate the LRF in all NLCC subjects',1,2),(6,'KRA3-G2-M3 ','Participation of international students in co-curricular activities promoting interfaith and multicultural diversity','1. 50% of international students participate in co-curricular activities promoting interfaith and multicultural diversity',1,2),(7,'KRA3-G3-M1 ','Number of Lasallian communities committed to the Lasallian mission','1. 3 communities',1,3),(8,'KRA5-G1-M1 ','Number of sustainable social engagement project of units','1. 20% ',2,4),(9,'KRA5-G1-M2 ','Involvement of faculty, student, and personnel in DLSU community engagement programs and activities A. Percentage of student organizations involved in community engagement programs and activities B. Percentage of staff engaged in community engagement programs and activities C. Percentage of departments with community engagement projects','A. 50%\r\n\r\nB. 50%\r\n\r\nC. 50%',2,4),(10,'KRA5-G1-M3 ','Number of social engagement choices under the four components of the Sustainable Development Goals Localization Project - L-ARAL (Education) - L-SEED (Social Enterprise) - L-Envisage (Environment/DRR) - L-HEARTS (Health and Wellness)','1. 16',2,4),(11,'KRA5-G2-M1 ','Service learning (SL) components of academic programs A. Percentage of undergraduate programs with SL component B. Percentage of graduate programs with SL component','A. 50%\r\n\r\nB. 10%',2,5),(12,'KRA5-G2-M2 ','Number of international SL activities','1. 1',2,5),(13,'KRA5-G2-M3 ','Student satisfaction in service learning experience','1. 3/4',2,5),(14,'KRA5-G3-M1 ','Percentage of members of Lasallian Community engaged in activities related to the realization of the SDGs','1. Baseline: Inventory of existing SDG localization efforts',2,6),(15,'KRA5-G3-M2 ','Number of public engagements that allows sharing of expertise for the realization of the SDGs','1. Baseline: Inventory of public engagements/sharing of expertise of the University units/personnel for the realization of the SDGs',2,6),(16,'KRA5-G3-M3','Metrics to gauge SD impact of DLSU initiatives','1. Development of SD impact assessment tools/SD metrics',2,6),(17,'KRA5-G4-M1 ','Compliance with green building standards for both existing and new construction','1. Baseline study',2,7),(18,'KRA5-G4-M2','Resource use efficiency (i.e. material resources, utilities, etc.)','1. Baseline study',2,7),(19,'KRA5-G4-M3 ','University\'s per Capita Carbon Footprint','1. Baseline study',2,7),(20,'KRA5-G4-M4 ','Percentage of total energy requirements provided by alternative energy sources','1. Baseline study',2,7),(21,'KRA5-G4-M5 ','University\'s per Capita Water Footprint','1. Baseline study',2,7),(22,'KRA5-G4-M6 ','Percentage of spaces dedicated to biodiversity \'green zones\' and open spaces','1. Baseline study',2,7);
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
) ENGINE=InnoDB AUTO_INCREMENT=227 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notification`
--

LOCK TABLES `notification` WRITE;
/*!40000 ALTER TABLE `notification` DISABLE KEYS */;
INSERT INTO `notification` VALUES (1,'Name','You have new SE Proposal ready for approval!','2018-10-13 13:38:24',87),(2,'Program Name','You have new SE Proposal ready for approval!','2018-10-13 13:40:51',88),(7,'asdadsads','You have new SE Proposal ready for approval!','2018-10-13 13:53:29',95),(10,'b','You have new SE Proposal ready for approval!','2018-10-13 14:00:22',96),(11,'c','You have new SE Proposal ready for approval!','2018-10-13 14:02:14',97),(13,'r','You have new SE Proposal ready for approval!','2018-10-13 14:29:37',99),(14,'g','You have new SE Proposal ready for approval!','2018-10-13 14:31:59',101),(15,'t','You have new SE Proposal ready for approval!','2018-10-13 14:59:31',122),(16,'s','You have new SE Proposal ready for approval!','2018-10-13 15:16:49',134),(17,'v','You have new SE Proposal ready for approval!','2018-10-13 15:31:14',147),(19,'ff','You have new SE Proposal ready for approval!','2018-10-13 15:50:18',162),(20,'se','You have new SE Proposal ready for approval!','2018-10-13 16:02:32',175),(21,'cc','You have new SE Proposal ready for approval!','2018-10-13 16:04:01',171),(22,'asdf','You have new SE Proposal ready for approval!','2018-10-13 16:04:55',174),(23,'h','You have new SE Proposal ready for approval!','2018-10-13 16:11:07',179),(24,'y','You have new SE Proposal ready for approval!','2018-10-13 16:12:32',116),(25,'Program Name','You have new SE Proposal ready for approval!','2018-10-18 16:27:14',82),(26,'Program Name','Your proposal has been approved by the Department Chair! It will now be taken to the ADEALM.','2018-10-18 16:27:14',86),(27,'Program Name','You have new SE Proposal ready for approval!','2018-10-18 16:41:55',82),(28,'Program Name','Your proposal has been approved by the ADEALM! It will now be taken to the Dean.','2018-10-18 16:41:55',86),(29,'Name','You have new SE Proposal ready for approval!','2018-10-18 16:45:22',82),(30,'Name','Your proposal has been approved by the Department Chair! It will now be taken to the ADEALM.','2018-10-18 16:45:22',85),(31,'Name','You have new SE Proposal ready for approval!','2018-10-18 16:46:24',82),(32,'Name','Your proposal has been approved by the ADEALM! It will now be taken to the Dean.','2018-10-18 16:46:24',85),(33,'Name','You have new SE Proposal ready for approval!','2018-10-18 16:53:06',82),(34,'Name','You have new SE Proposal ready for approval!','2018-10-18 16:53:06',75),(35,'Name','Your proposal has been approved by the Dean! It will now be taken to Sir Neil.','2018-10-18 16:53:06',85),(36,'Program Name','Your proposal has some revisions before it is approved by the Dean.','2018-10-18 16:53:15',86),(37,'Name','You have new SE Proposal ready for approval!','2018-10-18 18:30:05',74),(38,'Name','You have new SE Proposal ready for approval!','2018-10-18 18:30:05',76),(39,'Name','You have new SE Proposal ready for approval!','2018-10-18 18:30:05',77),(40,'Name','You have new SE Proposal ready for approval!','2018-10-18 18:30:05',79),(41,'Name','You have new SE Proposal ready for approval!','2018-10-18 18:30:05',78),(42,'Name','Your proposal has been approved by Sir Neil. It will now be taken to the LMC Council.','2018-10-18 18:30:05',85),(44,'asdadsads','Your proposal has been approved by the Department Chair! It will now be taken to the ADEALM.','2018-10-18 18:50:50',89),(46,'asdadsads','Your proposal has been approved by the ADEALM! It will now be taken to the Dean.','2018-10-18 18:51:13',89),(48,'asdadsads','You have new SE Proposal ready for approval!','2018-10-18 18:51:33',75),(49,'asdadsads','Your proposal has been approved by the Dean! It will now be taken to Sir Neil.','2018-10-18 18:51:33',89),(50,'asdadsads','You have new SE Proposal ready for approval!','2018-10-18 18:57:07',74),(51,'asdadsads','You have new SE Proposal ready for approval!','2018-10-18 18:57:07',76),(52,'asdadsads','You have new SE Proposal ready for approval!','2018-10-18 18:57:07',77),(53,'asdadsads','You have new SE Proposal ready for approval!','2018-10-18 18:57:07',79),(54,'asdadsads','You have new SE Proposal ready for approval!','2018-10-18 18:57:07',78),(55,'asdadsads','Your proposal has been approved by Sir Neil. It will now be taken to the LMC Council.','2018-10-18 18:57:07',89),(56,'Program Name','You have a Revised SE Proposal ready for approval!','2018-10-18 20:24:44',88),(57,'Program Name','You have new SE Proposal ready for approval!','2018-10-18 20:31:04',82),(58,'Program Name','Your proposal has been approved by the Department Chair! It will now be taken to the ADEALM.','2018-10-18 20:31:04',86),(59,'Name','James Laxa has voted to APPROVE your proposal. Vote Count: 1/5','2018-10-19 15:59:28',85),(60,'Name','James Laxa has voted to APPROVE your proposal. Vote Count: 2/5','2018-10-19 15:59:39',85),(61,'Name','James Laxa has voted to APPROVE your proposal. Vote Count: 3/5','2018-10-19 16:01:11',85),(62,'Name','Michael Broughton has voted to APPROVE your proposal. Vote Count: 4/5','2018-10-19 16:03:10',85),(63,'Name','Nelca Villarin has voted to APPROVE your proposal. Vote Count: 5/5','2018-10-19 16:03:22',85),(64,'Name','Fritzie De Vera has voted to APPROVE your proposal. Vote Count: 6/5','2018-10-19 16:04:28',85),(65,'Name','Margarita Perdido has voted to APPROVE your proposal. Vote Count: 7/5','2018-10-19 16:04:42',85),(66,'Name','Your proposal has been approved by the Council. You may now upload the PRS for endorsement.','2018-10-19 16:04:42',85),(68,'Name','Congratulations! Your SE Proposal has been approved!','2018-10-19 16:09:05',85),(70,'asdadsads','Michael Broughton has voted to APPROVE your proposal. Vote Count: 1/5','2018-10-19 16:38:13',89),(71,'asdadsads','Nelca Villarin has voted to APPROVE your proposal. Vote Count: 2/5','2018-10-19 16:38:30',89),(72,'Program Name','You have new SE Proposal ready for approval!','2018-10-19 16:46:28',82),(73,'Program Name','Your proposal has been approved by the ADEALM! It will now be taken to the Dean.','2018-10-19 16:46:28',86),(74,'Program Name','You have new SE Proposal ready for approval!','2018-10-19 16:46:57',82),(75,'Program Name','You have new SE Proposal ready for approval!','2018-10-19 16:46:57',75),(76,'Program Name','Your proposal has been approved by the Dean! It will now be taken to Sir Neil.','2018-10-19 16:46:57',86),(77,'Program Name','Your proposal has some revisions before it is approved by Sir Neil.','2018-10-19 16:56:17',86),(78,'Program Name','You have a Revised SE Proposal ready for approval!','2018-10-19 17:04:49',88),(79,'Program Name','You have new SE Proposal ready for approval!','2018-10-19 17:05:22',82),(80,'Program Name','Your proposal has been approved by the Department Chair! It will now be taken to the ADEALM.','2018-10-19 17:05:22',86),(81,'Program Name','You have new SE Proposal ready for approval!','2018-10-19 17:05:34',82),(82,'Program Name','Your proposal has been approved by the ADEALM! It will now be taken to the Dean.','2018-10-19 17:05:34',86),(83,'Program Name','You have new SE Proposal ready for approval!','2018-10-19 17:05:45',82),(84,'Program Name','You have new SE Proposal ready for approval!','2018-10-19 17:05:45',75),(85,'Program Name','Your proposal has been approved by the Dean! It will now be taken to Sir Neil.','2018-10-19 17:05:45',86),(86,'Program Name','You have new SE Proposal ready for approval!','2018-10-19 17:05:54',74),(87,'Program Name','You have new SE Proposal ready for approval!','2018-10-19 17:05:54',76),(88,'Program Name','You have new SE Proposal ready for approval!','2018-10-19 17:05:54',77),(89,'Program Name','You have new SE Proposal ready for approval!','2018-10-19 17:05:54',79),(90,'Program Name','You have new SE Proposal ready for approval!','2018-10-19 17:05:54',78),(91,'Program Name','Your proposal has been approved by Sir Neil. It will now be taken to the LMC Council.','2018-10-19 17:05:54',86),(92,'Program Name','Michael Broughton has voted to APPROVE your proposal. Vote Count: 1/5','2018-10-19 17:06:17',86),(93,'Program Name','Nelca Villarin has voted to APPROVE your proposal. Vote Count: 2/5','2018-10-19 17:06:29',86),(94,'Program Name','Fritzie De Vera has voted to APPROVE your proposal. Vote Count: 3/5','2018-10-19 17:08:01',86),(95,'asdadsads','Fritzie De Vera has voted to APPROVE your proposal. Vote Count: 3/5','2018-10-19 17:08:11',89),(96,'Program Name','Margarita Perdido has voted to APPROVE your proposal. Vote Count: 4/5','2018-10-19 17:08:29',86),(97,'asdadsads','Margarita Perdido has voted to APPROVE your proposal. Vote Count: 4/5','2018-10-19 17:08:47',89),(98,'Program Name','James Laxa has voted to APPROVE your proposal. Vote Count: 5/5','2018-10-19 17:08:58',86),(99,'Program Name','Congratulations! Your SE Proposal has been approved!','2018-10-19 17:08:58',86),(100,'asdadsads','James Laxa has voted to APPROVE your proposal. Vote Count: 5/5','2018-10-19 17:09:03',89),(101,'asdadsads','Your proposal has been approved by the Council. You may now upload the PRS for endorsement.','2018-10-19 17:09:03',89),(103,'t','You have new SE Proposal ready for approval!','2018-10-19 17:40:38',124),(104,'t','Your proposal has been approved by the Department Chair! It will now be taken to the ADEALM.','2018-10-19 17:40:38',112),(105,'t','You have new SE Proposal ready for approval!','2018-10-19 17:40:51',124),(106,'t','Your proposal has been approved by the ADEALM! It will now be taken to the Dean.','2018-10-19 17:40:51',112),(107,'t','You have new SE Proposal ready for approval!','2018-10-19 17:40:59',124),(108,'t','You have new SE Proposal ready for approval!','2018-10-19 17:40:59',75),(109,'t','Your proposal has been approved by the Dean! It will now be taken to Sir Neil.','2018-10-19 17:40:59',112),(110,'t','You have new SE Proposal ready for approval!','2018-10-19 17:42:31',74),(111,'t','You have new SE Proposal ready for approval!','2018-10-19 17:42:31',76),(112,'t','You have new SE Proposal ready for approval!','2018-10-19 17:42:31',77),(113,'t','You have new SE Proposal ready for approval!','2018-10-19 17:42:31',79),(114,'t','You have new SE Proposal ready for approval!','2018-10-19 17:42:31',78),(115,'t','Your proposal has been approved by Sir Neil. It will now be taken to the LMC Council.','2018-10-19 17:42:31',112),(116,'t','Michael Broughton has voted to APPROVE your proposal. Vote Count: 1/5','2018-10-19 17:44:14',112),(117,'t','Fritzie De Vera has voted to APPROVE your proposal. Vote Count: 2/5','2018-10-19 17:44:55',112),(118,'t','James Laxa has voted to APPROVE your proposal. Vote Count: 3/5','2018-10-19 17:45:07',112),(119,'t','Margarita Perdido has voted to APPROVE your proposal. Vote Count: 4/5','2018-10-19 17:47:23',112),(120,'t','Nelca Villarin has voted to APPROVE your proposal. Vote Count: 5/5','2018-10-19 17:47:38',112),(121,'t','Your proposal has been approved by the Council. You may now upload the PRS for endorsement.','2018-10-19 17:47:38',112),(122,'asdadsads','Congratulations! Your SE Proposal has been approved!','2018-10-19 17:52:50',89),(125,'t','Congratulations! Your SE Proposal has been approved!','2018-10-19 18:04:54',112),(127,'cc','You have new SE Proposal ready for approval!','2018-10-19 18:06:24',176),(128,'cc','Your proposal has been approved by the Department Chair! It will now be taken to the ADEALM.','2018-10-19 18:06:24',173),(129,'cc','You have new SE Proposal ready for approval!','2018-10-19 18:06:38',176),(130,'cc','Your proposal has been approved by the ADEALM! It will now be taken to the Dean.','2018-10-19 18:06:38',173),(131,'cc','You have new SE Proposal ready for approval!','2018-10-19 18:06:47',176),(132,'cc','You have new SE Proposal ready for approval!','2018-10-19 18:06:47',75),(133,'cc','Your proposal has been approved by the Dean! It will now be taken to Sir Neil.','2018-10-19 18:06:47',173),(134,'cc','You have new SE Proposal ready for approval!','2018-10-19 18:08:25',74),(135,'cc','You have new SE Proposal ready for approval!','2018-10-19 18:08:25',76),(136,'cc','You have new SE Proposal ready for approval!','2018-10-19 18:08:25',77),(137,'cc','You have new SE Proposal ready for approval!','2018-10-19 18:08:25',79),(138,'cc','You have new SE Proposal ready for approval!','2018-10-19 18:08:25',78),(139,'cc','Your proposal has been approved by Sir Neil. It will now be taken to the LMC Council.','2018-10-19 18:08:25',173),(140,'cc','Michael Broughton has voted to APPROVE your proposal. Vote Count: 1/5','2018-10-19 18:08:36',173),(141,'cc','James Laxa has voted to APPROVE your proposal. Vote Count: 2/5','2018-10-19 18:08:48',173),(142,'cc','Fritzie De Vera has voted to APPROVE your proposal. Vote Count: 3/5','2018-10-19 18:09:01',173),(143,'cc','Margarita Perdido has voted to APPROVE your proposal. Vote Count: 4/5','2018-10-19 18:09:12',173),(144,'cc','Nelca Villarin has voted to APPROVE your proposal. Vote Count: 5/5','2018-10-19 18:09:21',173),(145,'cc','Congratulations! Your SE Proposal has been approved!','2018-10-19 18:09:22',173),(146,'asdf','You have new SE Proposal ready for approval!','2018-10-19 18:17:28',176),(147,'asdf','Your proposal has been approved by the Department Chair! It will now be taken to the ADEALM.','2018-10-19 18:17:28',167),(148,'asdf','You have new SE Proposal ready for approval!','2018-10-19 18:17:40',176),(149,'asdf','Your proposal has been approved by the ADEALM! It will now be taken to the Dean.','2018-10-19 18:17:40',167),(150,'asdf','You have new SE Proposal ready for approval!','2018-10-19 18:18:08',176),(151,'asdf','You have new SE Proposal ready for approval!','2018-10-19 18:18:08',75),(152,'asdf','Your proposal has been approved by the Dean! It will now be taken to Sir Neil.','2018-10-19 18:18:08',167),(153,'asdf','You have new SE Proposal ready for approval!','2018-10-19 18:18:26',74),(154,'asdf','You have new SE Proposal ready for approval!','2018-10-19 18:18:26',76),(155,'asdf','You have new SE Proposal ready for approval!','2018-10-19 18:18:26',77),(156,'asdf','You have new SE Proposal ready for approval!','2018-10-19 18:18:26',79),(157,'asdf','You have new SE Proposal ready for approval!','2018-10-19 18:18:26',78),(158,'asdf','Your proposal has been approved by Sir Neil. It will now be taken to the LMC Council.','2018-10-19 18:18:26',167),(159,'asdf','Michael Broughton has voted to APPROVE your proposal. Vote Count: 1/5','2018-10-19 18:18:45',167),(160,'asdf','Fritzie De Vera has voted to APPROVE your proposal. Vote Count: 2/5','2018-10-19 18:18:58',167),(161,'asdf','James Laxa has voted to APPROVE your proposal. Vote Count: 3/5','2018-10-19 18:19:13',167),(162,'asdf','Nelca Villarin has voted to APPROVE your proposal. Vote Count: 4/5','2018-10-19 18:19:28',167),(163,'asdf','Margarita Perdido has voted to APPROVE your proposal. Vote Count: 5/5','2018-10-19 18:19:42',167),(164,'asdf','Your proposal has been approved by the Council. You may now upload the PRS for endorsement.','2018-10-19 18:19:42',167),(166,'y','You have new SE Proposal ready for approval!','2018-10-20 02:24:29',124),(167,'y','Your proposal has been approved by the Department Chair! It will now be taken to the ADEALM.','2018-10-20 02:24:29',106),(168,'y','You have new SE Proposal ready for approval!','2018-10-20 02:24:54',124),(169,'y','Your proposal has been approved by the ADEALM! It will now be taken to the Dean.','2018-10-20 02:24:54',106),(170,'y','You have new SE Proposal ready for approval!','2018-10-20 02:25:09',124),(171,'y','You have new SE Proposal ready for approval!','2018-10-20 02:25:09',75),(172,'y','Your proposal has been approved by the Dean! It will now be taken to Sir Neil.','2018-10-20 02:25:09',106),(173,'y','You have new SE Proposal ready for approval!','2018-10-20 02:25:20',74),(174,'y','You have new SE Proposal ready for approval!','2018-10-20 02:25:20',76),(175,'y','You have new SE Proposal ready for approval!','2018-10-20 02:25:20',77),(176,'y','You have new SE Proposal ready for approval!','2018-10-20 02:25:20',79),(177,'y','You have new SE Proposal ready for approval!','2018-10-20 02:25:20',78),(178,'y','Your proposal has been approved by Sir Neil. It will now be taken to the LMC Council.','2018-10-20 02:25:20',106),(179,'y','Michael Broughton has voted to APPROVE your proposal. Vote Count: 1/5','2018-10-20 02:25:34',106),(180,'y','James Laxa has voted to APPROVE your proposal. Vote Count: 2/5','2018-10-20 02:25:49',106),(181,'y','Fritzie De Vera has voted to APPROVE your proposal. Vote Count: 3/5','2018-10-20 02:26:04',106),(182,'y','Margarita Perdido has voted to APPROVE your proposal. Vote Count: 4/5','2018-10-20 02:26:16',106),(183,'y','Nelca Villarin has voted to APPROVE your proposal. Vote Count: 5/5','2018-10-20 02:26:35',106),(184,'y','Your proposal has been approved by the Council. You may now upload the PRS for endorsement.','2018-10-20 02:26:35',106),(185,'asdf','Congratulations! Your SE Proposal has been approved!','2018-10-20 02:32:37',167),(189,'b','Your proposal has been approved by the Department Chair! It will now be taken to the ADEALM.','2018-10-20 02:37:37',90),(191,'b','Your proposal has been approved by the ADEALM! It will now be taken to the Dean.','2018-10-20 02:37:51',90),(193,'b','You have new SE Proposal ready for approval!','2018-10-20 02:38:04',75),(194,'b','Your proposal has been approved by the Dean! It will now be taken to Sir Neil.','2018-10-20 02:38:04',90),(195,'b','You have new SE Proposal ready for approval!','2018-10-20 02:38:15',74),(196,'b','You have new SE Proposal ready for approval!','2018-10-20 02:38:15',76),(197,'b','You have new SE Proposal ready for approval!','2018-10-20 02:38:15',77),(198,'b','You have new SE Proposal ready for approval!','2018-10-20 02:38:15',79),(199,'b','You have new SE Proposal ready for approval!','2018-10-20 02:38:15',78),(200,'b','Your proposal has been approved by Sir Neil. It will now be taken to the LMC Council.','2018-10-20 02:38:15',90),(201,'b','Michael Broughton has voted to APPROVE your proposal. Vote Count: 1/5','2018-10-20 02:38:27',90),(202,'b','Fritzie De Vera has voted to APPROVE your proposal. Vote Count: 2/5','2018-10-20 02:38:39',90),(203,'b','James Laxa has voted to APPROVE your proposal. Vote Count: 3/5','2018-10-20 02:38:52',90),(204,'b','Margarita Perdido has voted to APPROVE your proposal. Vote Count: 4/5','2018-10-20 02:39:03',90),(205,'b','Nelca Villarin has voted to APPROVE your proposal. Vote Count: 5/5','2018-10-20 02:39:13',90),(206,'b','Your proposal has been approved by the Council. You may now upload the PRS for endorsement.','2018-10-20 02:39:13',90),(208,'c','Your proposal has been approved by the Department Chair! It will now be taken to the ADEALM.','2018-10-20 02:48:15',91),(210,'c','Your proposal has been approved by the ADEALM! It will now be taken to the Dean.','2018-10-20 02:48:26',91),(212,'c','You have new SE Proposal ready for approval!','2018-10-20 02:48:33',75),(213,'c','Your proposal has been approved by the Dean! It will now be taken to Sir Neil.','2018-10-20 02:48:33',91),(214,'c','You have new SE Proposal ready for approval!','2018-10-20 02:48:49',74),(215,'c','You have new SE Proposal ready for approval!','2018-10-20 02:48:49',76),(216,'c','You have new SE Proposal ready for approval!','2018-10-20 02:48:49',77),(217,'c','You have new SE Proposal ready for approval!','2018-10-20 02:48:49',79),(218,'c','You have new SE Proposal ready for approval!','2018-10-20 02:48:49',78),(219,'c','Your proposal has been approved by Sir Neil. It will now be taken to the LMC Council.','2018-10-20 02:48:49',91),(220,'c','Michael Broughton has voted to APPROVE your proposal. Vote Count: 1/5','2018-10-20 02:49:02',91),(221,'c','Fritzie De Vera has voted to APPROVE your proposal. Vote Count: 2/5','2018-10-20 02:49:19',91),(222,'c','James Laxa has voted to APPROVE your proposal. Vote Count: 3/5','2018-10-20 02:49:29',91),(223,'c','Nelca Villarin has voted to APPROVE your proposal. Vote Count: 4/5','2018-10-20 02:49:39',91),(224,'c','Margarita Perdido has voted to APPROVE your proposal. Vote Count: 5/5','2018-10-20 02:49:50',91),(225,'c','Your proposal has been approved by the Council. You may now upload the PRS for endorsement.','2018-10-20 02:49:50',91);
/*!40000 ALTER TABLE `notification` ENABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
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
  `externaldirectorRemarks` varchar(1000) DEFAULT NULL,
  `deanRemarks` varchar(1000) DEFAULT NULL,
  `ovplm1Remarks` varchar(1000) DEFAULT NULL,
  `ovplm2Remarks` varchar(1000) DEFAULT NULL,
  `coscaRemarks` varchar(1000) DEFAULT NULL,
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
  PRIMARY KEY (`id`),
  KEY `LA9_idx` (`userID`),
  CONSTRAINT `LA9` FOREIGN KEY (`userID`) REFERENCES `informationsheet` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `seproposal`
--

LOCK TABLES `seproposal` WRITE;
/*!40000 ALTER TABLE `seproposal` DISABLE KEYS */;
INSERT INTO `seproposal` VALUES (1,'College of Computer Studies (CCS)','Information Technology (IT)','2018-10-13','Name','Head','Socially Engaged Research',1,2,5,12,NULL,'2018-10-20',5000,'Explain','Partner','Address','Contact','0912345678','email@email.com','Description','Measurable','Explanation','OVPLM',80,80,44,44,30,30,30,30,8,'','','',NULL,NULL,'',1,1,1,1,1,NULL,NULL,NULL,1,1,1,1,1,NULL,NULL,NULL,7,NULL,NULL,NULL,85,'1312321321','fhgfhgfhgfhfgf','000000000000','asdadsdadsada','tytytytytyty',NULL,NULL,NULL,'ÿØÿà\0JFIF\0\0x\0x\0\0ÿÛ\0C\0		\n\n\r\n\n	\rÿÛ\0CÿÀ\0=B\"\0ÿÄ\0\0\0\0\0\0\0\0\0\0\0	\nÿÄ\0µ\0\0\0}\0!1AQa\"q2‘¡#B±ÁRÑğ$3br‚	\n\Z%&\'()*456789:CDEFGHIJSTUVWXYZcdefghijstuvwxyzƒ„…†‡ˆ‰Š’“”•–—˜™š¢£¤¥¦§¨©ª²³´µ¶·¸¹ºÂÃÄÅÆÇÈÉÊÒÓÔÕÖ×ØÙÚáâãäåæçèéêñòóôõö÷øùúÿÄ\0\0\0\0\0\0\0\0	\nÿÄ\0µ\0\0w\0!1AQaq\"2B‘¡±Á	#3RğbrÑ\n$4á%ñ\Z&\'()*56789:CDEFGHIJSTUVWXYZcdefghijstuvwxyz‚ƒ„…†‡ˆ‰Š’“”•–—˜™š¢£¤¥¦§¨©ª²³´µ¶·¸¹ºÂÃÄÅÆÇÈÉÊÒÓÔÕÖ×ØÙÚâãäåæçèéêòóôõö÷øùúÿÚ\0\0\0?\0ıÑ¼M.µv–ª­r7„„ŸLWuiğšKØC5Â@Ç’€#ëœV7Â+8›Ä72\rÉr}sÅzZ]ùcŠâPV5¹ÉŸƒ\'åÚóÓşÊ¬\'ÁD\0Ô~¸‹ÿ\0²®™®ËH4©s…ûØöÍ?gäŸ­—9Ô:Œåcííóœ\Z’‚v­¾”·b#ú×F5\rèÙ³ß¦)a½e\' 2·©Æ*\\b]˜|¶fÈ¿”‚›°!ÎO§^¾Õf×àÅŠ}¶Iw\'\"ÁVã¯=y­‘¨ÈÒ±fûÜx\"œot+ÆŞ>P9éÇéS õ1ŸàÎŸ(Ü—“rR\"\\sëÏÿ\0[Ş¤?³å´¿>¥6×#\0q¿¯Ozİ[Àwoâ\\oCŒÔÿ\0…$7I#?»mù?ÄÏjv]CSÏà6›5±ÅÕŞà73y`ü rzğ?ÚéO´ø+¦ù	ç]\\»UÆpõª—nXLq)Ç¨ÏøšU¾)ŒHomÃ€•!jT‹àN†Hšçt¹u$¯+ëLw9¬öø#b÷»…R ©‚1ß·O~•Òı¶HîÕQùNNI,}1Èşt‡ZhXÇˆÊ…È<zÿ\0ûTÒ‹\rLx¾éRÇæ­ÍÒ†}©€½¡èÃéS^üÓ-â2}®áÕIù7·‘œqõÅjlÈ]ÁrtÉÀã<òzsÔÓ¯5“40¡A\' ³©ÁÉ>¾æ†’Ø5F$¿´ ì÷›ÖF…ÈÈÏN=ºu8éDtQùt\Z.	iå€cùñ§ò­“}¹d†t*I?yv¹#§¿×ŞŸi¨Ê’¤–@ÉÀÎÕùÉ¯<fšŒX©ğSETå“iÉ}¥Xç¯té×‘Dß	4„5Ù,‹±‰Ìø\0óÁ!x<t=kjê÷Ï‹`Ú¢8Úùàƒ½°Ü’9ÇA™#5\rÅöéÿ\0vHXÕ£\0~Sæg8àöéÅ>Hmğ£@]›¡¸mÅ®°	áA\0üÜ\09úÕƒğ@wCöYÙ|³»,>oŸ‚1ÁÎ1Ğf¥}T\"E€ÆJÆãæÈËt?‡n=i}ö‹¹Ys–RÇ;²8íşíRŒDîÈ.şøzÁ[+¢DLìZáˆsóG±ã#ÜRÉğ“A6³ı‘#r§r‹‡Ë}àº•nk‰§cî[pR’ãqÎyõëURâO±©ÁÃ—\'îr‘şª•˜‘Z†>c¼X—+‰.d;ºàğŞã§¥Jÿ\0¼5òçJVŞKÊ™AÆÏÉÉÉ\"¬Ş\\,·%fÎ‡VàœŸè*! \näm)#’Ì¹ç¦8ÿ\0ëQbˆ¬¾xv5xÆÜå&w$	ÇÍÇ\0ô¨—ÀU‘›LCóü Èüõà\rÜõ•Jòğ>÷$ç½:Ó¢»1ÆH\0‰r¤wÇ?^½xæ€W+Â¿Ğ-]˜éğºñÁvã÷¹¨ÓÀš\Zsö¿ï¦?û5X7E[=ıqLîêx=ihib¼ÑXóa	ôûßüU7şM)HcãŒU“Ç#ÔÓ\\àqNÁÊ¥sàı%ÏüxAùšCàÍ%åÂßùÕ”“|õ¡Üæ¥b“xCI‹?Šoü!ÚA?òƒõ« ‘G™1@¥~…1àİ tÓíÿ\03I\'ƒ´‚?ãÂÌÕÂØôüé²H1ş‚53¥ğN‘\'aˆPäb¸¯x+û\r|û}Í9%yõ¯Dí“ã‡xVóıÏê*f®]Oö…ÿ\0kEG°úÊŠæ6:Ï„RÔ®Éë±?™¯AÎñı;\ZóŸƒN­“¸lL{rkĞüÌzÖñm-L ®<61ùSª1 =¹õÍ<6­hö/|oµ¹éÜÔ¤ƒÓ‘ØúÕu9ÏCOY=Mg7w¡Z’Œg½H³\\z‰$‡×±ô¥VÁäñüªGvM€!8;Iê	ëı*eË¯eÊÿ\0{­V÷²2\0sşM ”Ÿ¾[=9ô .Ëm1„sÆ01Ğ½±!‚’Øã·~ªºüï• `ÉÎjC zŒëëHZ–ÚiÅ¿€3·w ÿ\0gŸ­B[ks¹r@?â;có¤’WºXÇÈjá\0Ú£××­VÔ5(4ë7šáÂA\n—ffÚ8õú\nRË] pûW\'NÒ½{úZ‡Tñ-®™k¸¸Ş<6ÒÍ´c-Ğúu<{×È¿µü3Âc}7O{ıhÈC1À°OŞAà¾T\r§‘¼zWÄ?o_|TÔb¸:½¥iÅ,1EeØ\\Çş±‚™9RrÁH#\0 šPob\\ÒÜıGø™ûjøáuÊ}³^Ó\n$‹>w)2£8ÇT]…‰\0zY—ÿ\0·ßÃû}nÚÏûLÌ°\\\\™Ë·«ñ÷Ç•\r§±5ù\n·:Ö»¡ê7ÓÈom-™­Ö+É™¥…;ÓRÙVÀ\'~–FXW;©kú€ÔşËª_Zİ*¬¨eUD…—Î~Kmç|’mŞIÀß²0sGê¿¿àªğõÖä€ˆBåîîD†2á¦Ê\0‹–ùbbwÏ_³ÿ\0‚ºêVú‰ÚãK²¸+Ùc·q#~éY®ˆŞá˜ç¨#vAñGÄzËM½Õlî$Õ.áó?ycrïk*2›­“Ëïıà,rB˜‘ÇØxáZÂú/.g†áÚI‡Ş&)GÌyÜ~w9`H*v•<ÒöI\nç×3ÁP¾-™¤³—Fh-\\FßiŠR!MùÈìœ«……áúzïÍÿ\0>ø« øŞÉ&}#Ro³Í%Å‰gˆ2Ÿ•ÚI@ûªûÀ§‘€Üñv±ª&¿¢[8xìçdª@\r`+ÆÙàí„!‰çi÷ş(óü[<Ûu\nl!ÙÊIo™›†fpI~xÀÎEªqê\ZŸ Ÿ\n?à²4×<Kog«x?Nm=.#†îæ)dCl\\o+ƒ“ÉûùbA¥}·ğ³ãv—ñVÊ°–…TÚÄœ“è@#ñõ¯ÂÍ3Æi-<ñÍ.mĞ¢2]mŞ¬1Ç$.™22y¯_øÿ\0	ñÏÀ™4_*}E¬áÿ\0_²A¶ëk‚¯Û´Ÿ.ˆbA88‹‹OCXÚÚŸµ|Æ?ÃÈôÈïÚ£óöÄÀc‘{Wçÿ\0€¿à´z,w_Ùº¾‹¨Ésicyip“ÁwóàaƒqõZûWáWÅMâ÷ƒm5Íöû+´VVŠD}„¨%[iá†@#¨4õZ²Ò[£ªvòàŸz2\0Ï#ĞqÈÿ\0ëşUæ?SøÓÓ“È,;3óš9ÛØ­G²îà÷£y=ÇáC¨WáÃpG©ê?\n¨¶ÃQÏÒ€1ßô¤i6¿¥ÛGZ«»Ø5ùÓ^M§ÿ\0¯Mó‰<Ÿ¦5ÛqªÔ5$vÚ;Ó|ïoÖ˜Xš(Ô5Ûq¤¢šíµhÔz„‡	Y~,S/†o}¢?ÌUó!¥Pñ3Å=wÿ\0\\Ÿ>üRÔ”ûW“éúÑM74W õ:ƒ\n\"¿Ô=\n úrkĞóšóÏƒjRóPÏBŸÄ×Ï®*ÕìLcbTå©å”q×ß5\0|\np9iØ¢TQşM(~}}ª.}qKaO?7ó©psÎÅ9gÇ=j¿˜ß…9$äñ@Ùß¿5\"¾ÉF@?ì“Ö««J[&€,.7ó‚¸È\nÃ#=3@“÷8=ª??t`cî€½dxÇÆš‚tõ\rNî\r>ÎİwI<òmHş¿­\0eücøÉ¤|ğ5î¹®]ı’ÂÁİÂ–?3\0\0	$Ÿ@O¿0¿kïø*‡ˆ¾0kš¿†´Ù4-e¸´yÓ3ÜÃóGµ¾ö\0[¸>a\\¯ü?öÚÕ¿i_\r7Lim|?eøJÌ.ã%²ÌAµAÁÁæ¾`·¾)6ÆV}\Zów’AQÉ­a¦R—C¢Óus§´wÏcÍVËHbG.\nr>^ŸR\0â•Ü,÷’G Ù’Ê#9Hå)<v‚Ù^N[¼uC«¦ Škk@¼m0ıÜ„\\(9XÇXg.IÏ<-\rjî¯f•~ÑÄÙØ …*¬ïä\0F6à`ä‚zî•ŒM/ê–º†¹©]éSŞÍ¤4òùæ<Ïló•Yq‘¹‘—%K¸#šŠmMæ±°kÒ\nLÒ}Cç(‹rÏ¿c.Kşñã$(~€¹ åÙÜlÒe‚96dÜÉ·s|¡öã ô¿4ñ©\'öE²¥£Is$…|ÉeQIc#±`Kd`&0Aá7a¸_cP›:ıš8Ñãu\nÙó\nùR!*Fs‚	ùIø†sV`Ö®fÑï<ÿ\0%¿´WHã€\"ÄJJ÷&÷bF`ªJŸâiæõ+·mD“ş‘.ÎYI$7ñÓùUÇ›ÍÓõKùå‰bFÅŸœüàãeqŒœT–ÚS‚QHc¹™n[F».]Š`0ÎâÃî²cç\'q#g«OÈ¼:Ú®!C˜Ë\rçpÎŞ0Ø=8îZÉµÔ\r…ÍôÉ,Ûd’’ˆ÷¿\rì9ù_nµ úTÈ]e(+}ğD`d>qÀÏÍœñŒR\ZĞ¹×6ÚmÄÉºñ”•Ææ”©Ê¶G»`ıj$¼YRÊ&İ]¨°ò¼„®Oç÷zg=ñŠÊ‹Í]\ZF‹”3(f\0‚0cÆïN¼zĞöfÖäó!#c„-ó6“ƒÇÓÚ›zN¯&««Iw{7Ú\ZCœbÂ8Ú¨À}	ÉÍ};ÿ\0øı·¿á—<{2jÒ³x#Uqö´3#[ÜŠ%îÉwu$öòg‡ïÚƒä‰Dˆ…‹ÄO@À€0_ğâ´t­]­¶\rÂJÅ‚Hÿ\0!¦\'£§“ëÒ“WV5†¨ş„´nß^Ò¡½¶’)¡¸f‰Ğñ\"²‚¤{zÕæe~À<kóOş	aûm\\|<Õáøkâ¹¦“HºFÔ.¥\'ì¹M¾A=6ä&Ş˜İÏ­~’E(š%uå\\dÄ{V\\®%äöõëC>q’>^œô¤¯•Ê¶üŒ6î1Ïluç­DNM )Ë~o,9¦Ñ[G`ÒŠBp)<ÁLR3m¡#ÈúûPyãÒ£2;n4”\0Š§â\0Dº¼/üªåR×¿äsëä¿ğA1Vw<‰²ıh©^ŞMçäïëErtnL·WàôÂ3^¸W|âòü{\'‰¯BÆ*ÖÀ=NãŠ\\â£”6)€ıÔå!ª4^iÀã¥\0I’Û4gÍÆ•Z€\';*G#§5JA”ÿ\0´(<?˜ ^^-»JÇA?×úWæÇüßöá·ñÇ‰“Á\ZêÜh–¦)õ;¸g&9_lƒÈe×·L×Ñ_ğUÚ:o€Ÿ³D¿Ù÷3[jºıØÓ-ŞIô‘™ëÀ\\qÏ5øù}â™5»»–Œl7.\\’ä=zôÎO5¤;ÒêÆ­\0ÑÅ$¶²F$ÜÜü„À\\’Ü³‚2x®[S·Áï-İ~trÉ#1dlŸ(ÜX|Ç¦8ëO†é$ÅÄ¿ºSåBy,JrsÆ@ÍAw¬#Eq,Qm–êãİ	qÙ9Áä`ã>„b´ZIufXì ‚x×;åÇ?ëò ÏŞ»|Àü£šS•ïÅÄŞC*`Õ€Î:î\'=:’zSî#v6…	d,Ìë¸˜”]„´ûÀòyíÒ™×îRŞd‘wÈàŒœ\r¼(î:çê¹‘#¯lU\"¿ÚÒE,É–ÊÇ8|“´çn~÷>”û8ä]6V‹äŠÚ\rÓêwŒmSÔînAÉäÔzEÄ~Q¾cLÑ±Œ¡P~ñàŒc,IÕ= éòÇ0•wq´‚B†#\'¯ºsP\\Fß][Ë¬G›O&\rÀ¼\"rKgÖB¹\'§§JÕãµ‚tÜB°\rû½ıÃ˜àçrGc&ym0ŠBc$£Io7#±ç8ü1Sê3‰åÜ¸1\\Ä	 ¶AŸÒ‚ÆÜ¹ÒaFd\rk&ÿ\0/!r$ÚFáŠ³oz¶šÄxé°r2F{duÿ\0\ZËuŒEç±WÆÒ Ä/ÊFyã§¯¶iòêyq,“Jè°…“ûşnJ®xRFrzp½M\0lYêòëz\nG$#íjY¤(wd ÀE\0`ô¦O­Mcc6·al‘ba$\nşì à?Ùç¨<Xš<o\"*[³´³.\0\0yŒÌ\\g\'$qïsV4KÓl·	4²•ÂÆ«´a3Ä íßĞ\Zw/ø\\Z§‹­ä’ÙÅ€•VHü£!eÜ ®.O$ğÀıj¶™(Yã.Â7onûËŒ`çØ­1õHÍ¯ÏÇïƒ n#rò?\0j;ËeòáeP?t®Täúúš\0ìc×®[Äz}Å¼Ó£ÄÁüÅ»78î‘Æ9úùÿ\0åı Æÿ\0ÙËK7÷ßh×4!ö\r@Hÿ\0½bŒÊÃnôPß~/5É’Ko-„A9ùF[9şŸ}ÿ\0åı©à7Åû+if´íjæ++Ü¸XÈ•Ê$¬1ÎÂXçwC•2WC?eÍ-Cep. VïƒíS”t¬€(¤\r»¶)IÀéš«;\\»LÛšo—§5ıŞÔã+=@|‡½ŸÂ˜Ni1Š3VÀ\\g½5Î\r&ÓëM2níLuUÖX2çş¹?ş‚jË>½UÕí:àÓ\'ÿ\0ĞM\'+ãÍy6ïõ¿øí3Bw}(¬9‹æGAğyš]Fÿ\0v2¡:}H¯Bç×5çŸX.¥~9ÎÔç=y5ßî¡l@ğÙjZ4ån)€õm´ğr*:UnhôRn´\0õéU<AªÅ¢h÷RäÅm#ã°§cò÷¯™¿à¡ÿ\0´Ú|øQ¨Úyª\'Ö´Ûë{lÈW2ª(ÇÇ˜§¯¥>ÿ\0‚£~Õ©ûDüd60ùŸÙŞ{›(nÜ;¶×brIÉB{b¾\\·fIöçkg¨¨õ]nmKT»¹—/%ô­,²;½‰$I=I¥±™mdÌ˜m½zŞ:#)½t-Op\Z0‡B½OéQ¡ûb:Æ›/·¯Ÿn‚³ŞøÈÜŒõùqÉÏ½$—k]›yäœgß™kUbìBñcS»pR?Ç¹°Äcû§¶9çÚ§²Ö|Eı¤“Ki¨¨Ü’ÄÅ7İÎá‚AŠÃâL‡RAëı{ş•4J×dEæcî\")=0NGz6O\"õş´ú”¤ÌGÌÌ7(Çnà{vïÉ©F´d´…Wj¤g—sóÈ=1õ¨¬´=OP†EÎæq•Y1e@şœ÷¥]\né›ÒpĞ·!b\'<ò;\ZÏÚG¹²¥>¨EÔ–;äš5%WhÇ==F)º~¦ğióÆ!²Á‹Û£Ë¯œr}AöÅ@Úl–’•6Ó’ñ‘“zÚÒü56¡§Ü,eUåQ²(Îã.Óœœ~i¹¤®?g\'¢F0Š{…WÛ¸œ{ôıh7ò¼®ÀŸ6Î2@ÁÇOjô|¿Ôå1¿›0²¿2Ì+m wû½+~÷öOÔµê+{Ë$ßóÃ2*0>n½\r`ñ”Ö›G]«ò9¨b…Ùqä¾W!Âí¹89Áş]1\n$iûÈƒHÒo;eİ´…	·åÛ–ÉÉ·LŸÄ³ö· Í1{¸’\" ã ÏÕÍ^ør÷OÕü™á(Ãª’‹Àû¹#<g=OÒ¶hKáfN„ãñ\"•ÃìŒsò¿ßéZW_Ú:•K;@V2r\0é¾µNFYm›æß¸/i?w©\'§_×ÖŸhVÊÊI72Êª!;ä#–c®8ÎkC&˜ß´–ƒn\0ÎsW4Ûóhª»Š…\"\\ãÊ	üqùU?-â|<mvİĞƒÿ\0êıiÑ¹Çñc<çùş”ß‘:Ÿ²?ğLÏÛ ~Ğ?mí5©Ñ¼UáökmCTJ»—*óĞ¦Üû©¯¨üÒ§ŸÊ¿ÿ\0a/Š²ü1ı¡ô‡IXZj*lîU$Ûæn#8çæù\nı¼²ºöÙ^6¤A®yhÀ´gÇjF›\"™š(»µ€	É¢‚qLfæ\'JmÍ&áM6¶i¾e#74•ª95 »¬¦ÿ\0®Oÿ\0 š˜œT7L\r¼¿îäjf€ñÉD‘†zt¢¬Ë‰[,3“ÚŠç_àó–Ô/OO•?Mz	’¼óá×¨ßü¸Ê\'ó5èŒšµ°X˜t¥¦p:SÈ¦•¹§‘QÓ•‰4\0áÖŸº™E\09ÏËÁÁì}+óOş{¢İÍ6ƒ¨GÆŸ`²­ÆÖb‘K#§8è\0{ã«ô¥†áøƒ_ÁUô‹I¼«éWKØÇ%”ò?îc¹ÙúTŸ““ÁÜéLi+“báI a±ó\rßçúÓ/®Ô^·–Y¢É\0°ÚX}?Î®^èÒZJêê€†e.vò>•›ulVt:zv­Œa¸ã!¹¶|¤cv	ú{Õ«:ç[œ¢G$Ÿ˜…<}qT¢´38Ùü€sï_Nüø#kƒ­¯îÌ¹Ô-Ó,„ä\\ñé\\ØŒDiFìô0¸WZ\\¨ó/‡?³ï‹`·œ\\DË>à¦[…à³¶>AwŒf¾ŒøSûéz.É®á·ša×‘œ	æ½SÀ_F‘§ùl>sÆÑĞ‘·è:^‚–ğÏ’sÆM|ı|mIû·ĞúL>•-RÔòè>\0è¾|q;uf|²}:ô­Áğ;CØV-2Î/—[×\'­vĞé¢go,¨Ãr£UÁo#åDqãOï°?•q^W½ÎøÁ-‘â~\"ı“¼?«î‰tës$‡#ä`êAâ¥ğÿ\0ìáïA\ZCkÉÒîßÓƒõí6~¾òWvrWĞZĞOE‹f\0ÀÈÅj§+ZæsPOmO>Ò>i: Q…¬2ŒdóëZrxFÔ.ÓH„`³ù×Wq¦ˆFïP*‘ˆ«`ø¶+÷*3ºØäuï‡Vº­±à‚]Ã`ß+:ŒW™x»ör°»ñ×2XÀåeÈÜ\0Œ`ó^ö‰–Î9ì3Ö ŸNóWç\\ŒôÍ8·˜š‹İ\rüSıš†‡á±slö”™„íBGÍŸN½«Æüi¡OáMbãM¼F2[¾Cùx2($t¯Ğß‰_âÕ´›˜StbtÆòG+œŒñ_~ĞÚ¯öf·’RæØåFw2±“ê}8¯s.ÄÊräg‹™aiÆ<ñZcwqö‹®¬@]Ìx §ù¦ÛyÁÃnıi—6-— €Fî™î}óªèå8çÓ5í>õ74K¡j“Ù·Ù®¬Ü¸RA2\rÌç¡ÎİéÍ~âşÃß?átşÏzN¾¬û®2%wÃ\0ŒşUøSü°J>ÎpÍò’0N}+õßşçâ[[ösº´¸˜ìëï%!È&ò×\0ààúık*½Ä}}æcŞº£4µ +6i(¢€\ZÍÅ6Š(\0¤İC6\r2µŠ[€®Ù5Ëº\'÷Sü>™3m¿İ?Èÿ\0L÷Ğ!¸Œı¡ø?xÑDì|÷çøj+\06>\'•ªßw;öä× nÇzó¿ƒÒ³ëÛ»ªÿ\03^‡˜qV¶¸å~y5 ËrJˆz\n)`9xj‚7ÙÚ¥ICë@nš`æ€q@gâ·¶£ë³‡ˆßWH¦‚ÖÛÍòØ/˜ì®¥v3d+dzô¯h-Å|£ÿ\0_ñä~ı›µhEßÙæšHÕ6<ìH:PRi‘,ŸûGÄz”‰¤BOİí\0mÎpgñÅco¶’w äüÅ€}M[Õ5=‚VãtÌ²±S÷_Î²­ïR9°UŒ|‚§¡Ò¢íb\rÊmJ%vÌjWsüÿ\0Jû‹àF!ğ¦‡…Oœ±\\ã2ª•qï¸WÅ\r4ÕÕ<]ek\"gÏ•FâxPs“úWè7Â.-CµhÕ	hãï®kÄÍ›ID÷òho3Ñt{±É½¾bA<úœõêåÌ\'°‹<g5Zƒ…ä=*uu‘_=z`Õá3İí*¯Ê€v{ëïZV\'nyá‡åYñ•ó@õâ´ µ c®zRÔ/­®Z·Ùº™ö•9<{\Z‰ãhúâ‘Ãc¿åZ	¨²Áº2ùš¡©ƒúÒåİÉÏÇ©¨®È¼\rŞÙ©aÕœƒÃ\0{|µ#O+ VaÈêJ§$6\\qÇ5<r#pãÔšÊ74vw™nşµùõûSxëHøÁ¯]YÄ.-î<‚23ÜÄåAÏaù×è,÷*N8Æ9æ¾ı¶tKÿ\0ü[¾Ô`wk]EXØ¬ªìÜtÁükÕË¤•K3ÍÌbİ-:‘¹IÀ›Û$Âû\n… Ü7`ôÀ<Ôhß>àF“ş5$¿˜¿&JƒŒtÇ§S_LôĞù2m6Õ®%\0â¡ä`£23ï_ªßğK[ù¤ğºÙË{uk`†ŞÒŞX­®ŠÆM#°Ã¹ìsLç5ùH&òQ27mè½Àç§·ZıTÿ\0‚Xx|\'ûf“·E¸ğõÜV\Z½Š…‘u1å†KØƒœŒ˜°	æ°¨µ¹i¦}Â€F€z¾´ æ¡·“Í·FõPyëøÓóŠD½Å\'šMÔRg	Å#79È¦ĞœÓZP‚—8¨e}Ç\0VŠVB»×?/¨¥“|géF=…dcje+¡G¨6ÛùñÓÌl~tTz£2êw\0+JÃ uäÑX¹ğ’&]nópÀò”|\Zô$}şµçÿ\0	ï…Ö·v;,?–MwÑ6ÜÕ­†÷$üèüé¾hõı(ßô¦!ß\np{ÑŸqF}Å\0=fæŸæàıjûŠ	Ïq@	ë_ÿ\0ÁktYOìóaylHµ%óAÿ\0k…ıkí5ny<WÊ?ğY8’ØËWù¾d¹¶uòVU9àöëLÇ}DùQmfÜ~QŸÂ¨[\'Ç§wÖqwæF£hÏsëUËù\\z×EØ÷Á\0ÒxûJ†?˜Ü¸ŒñÛ­~„xıD·L7î¢P£</>µñì7á9|KñNkß#}¾ß#„b=+ëŸˆ_ôß„Ş7dË8+`–o—¾:t¯Ì¯*¼§ÑåMF1è—^ ‡Mƒ|î#Q’FOëP[x’-E·Ç:mng$×Æ6ı£µ¯Ü´³ùºlA±¸sæÈvƒœœõççÚ³í¼#ñsã@Xôû;íKA€«x-ÙñÏÌKaÏ°ãÚ±†¬ÙÕ,kû(û…~!év÷±CöøòŒAïùWK¦x’	ÎCy™^«Ú¿>®ÿ\0bÏˆ>¶7H—SÜ2–uy”¶2>ëïZÿ\0Ä<*bÕmşÈå^ÚY,¸ÈÚNvàö#¥kR…(«©\\ÎJ’~ôOĞkˆ/¾n£¡ÁéROl.{Æ¼‡á7îZÎ8æ{‰1Êò|ÀçO_Ê½5u_´Â’3Æ®UËc¥¦·5ÒIéŞ¨Ë$*äÏP=k‡ø«ñwş]:MIwq±¼˜„›<Ç!s‚98üëæŒ´ÿ\0µ6+mOhf™L…íC¹€GŞã,p:v5p¡w¹2›Šº>¹½Ôà‘Ø,­”ê\n¿•F·êĞî,1Ğ“œ\nø\n†Ÿõ©íç:—ˆ¼ÙœÍ.ofCGÃsŸOnµ¯¿âŸÃ‹·2ëºĞWE\Z‹É$J?º¡yÔÖ’Á§ğÉë$õ‰öíÕÖÜàdc·zó?ÿ\0l~6xQtùØÇs	mçCµ¢~~\\ÿ\0pç¦Zğÿ\0şÙŞ*ğeÂÿ\0lé‹«Xgdl\n©ş/âÏ§c^éğÿ\0ã&“ñ9#“L[ò®»ˆ’ÒP€Š\0z×=L<èÉLë\"X¸3ó÷\\Òn¼9¨Ía{…ÚG‹\0‚+aÇ¸ªˆÛ3óx&½£öÙğu—†~*ıª5t]B<‚8–;»g¦+Ä‹ùò••ôØzœôÔûŸ-^—$Ú,Ùµ2ƒÎsÔvÅ~ÿ\0Áæ…åø‰n%Y3(q\'şCğ¯Íäœ¶Bğ@Ïú™ÿ\0Uø#ÿ\0wÂİGÅs¤‘j:õÉ„êPÛ$hÑåBr\n¹œÚŸuªí¥¦«qJN+0ÔZcõ¥fâ›œĞ ¦Jÿ\0)¦³mnOZc>OZ`(“şªoçF}Å÷¢€÷…ñßô©”l€ò]DgPŸŸùhßÎŠf­nÿ\0Ú—8-5±Ï¹¢°Wá\ZüAy·¼#?zyÿ\0Â¡·^¹íû1]ú¶êµ°=Å¥_¼>´”S`séFyíPäŠUm­š\0›Â°N¢‘pïC¦ÿ\0_Ê€×°¯#ı¸>Ëñ¯ölñ^‰kl·ZŒúeÇØ©9ŸaÙŒwÈ¯[½Sñ¹má­îşíŠ[ÙÄÓÈŞŠ£&µ*1¹üçkzTºV¯qg*§´‘á™Uu;X~\ZÍl3rÇC_B~ß\Zƒ®|k×¼Oá{këM;YÔ&Xç\0¯˜Ç,é×›sc=øÇJùúî	]’W÷²\0ªw&®hNPfÕ(NŒÔ*+h~Ã?ÛÂß\nÚõãıö±7Ú‰Ç!6 UçêÇñ®ïÆ	n~&kª÷j°Z[¶R1É”ôÉãÛõ®›áŸ‡#ğç‚t›ùVÎÖ4#Ü\"ŠÜÔµ¨ô;C!Ï\nz\nùjÕ[¨æÙõ8zj4Ôbq¾\Zø\ráÏ^Ë2Îâü/Êå²ÿ\0*ê—âO…¼2¥Î±¥iˆ8!®\0`İf¾gøëñSÇüGı¢Zµ–)R÷;±ğ	<şşuÊü]ı“-|A£ØİøBçQÕï&‹Ë¼KéQgiÕ‹ïç	·`…?‡Ztè9»Ô†µjÊœ}Ø]ŸbÅñßÃÚåÚÅ§ëúeïğIÇ=N1Zw\Zu½iöˆ£<ïœúÿ\0Ÿzù+àìq­Yü@·Ö|{¡%İ„He··¼G’fxY#ó0ÄÆ+ß~èZ—‚üa¢Øj‰áËÖö«3Ç3Y“ÈË«¦Iå—=Hâ¢½Ãà•ËÃIÎ>ôltÚN’±^)P[…\0`]¾`ÒÙy‡syc#«˜X~ÊÇ¯Á+¯Òõ?ø“Ê»s;Ö0“‰µJi£Ï¼}¡&»¨y’ª¿–:HNã·áúV~‹ğòÇM³Y<¨¡/”`şz×C«ÈfÔH+“ÔÕÌüfÔ\r¿i£Å~l XÄ·7‰	‘àRFRì@©\0Vq“›ÔÒ	%±Óh\Z¾—©ioÈ™”g·zĞ×ôí;_´O´Ai{¶C²©>Ş8¯†¿i†:‡‡>!½æ•}¬ëºiŠefbˆÙÊ°*\0u Gzèe\ZÏ¼+¨ë×:î·¡[évì4û˜¤@%¸.ì2…rÈ İ2z\Zô£‚²º’ûÏ6¦*ó²†‡Ñº÷ìı¡êáŠ[Át;Sù\0qV¼à4ğ×•o\ZFŠ¤)D\0ã‚¼cá/í_â=7ÆÃş-Šö€¾ÛËHğz‚9¨¯£4íj-ZäCÃ€ÀãÔVœ¾2šº¼QòÇügÂN§ÃúÈdb[Y€uR„ŸÄÂ¾^ŒíÏrzc¯Ò¿C?i¿	Eãß„ºÅœ»ˆH\ZhöœÉóå_Ÿ:u´ïª­ŒQ<—(Œ Ág9Çç^æ]8û;v<Â›SO¸û`-ÈÜq¹€8=³ú:ıºÿ\0‚mx>ëÁ¿²_…moQ¯iÌd.ÂRH‘×#Ÿ˜Œ×æ7€?fmK³µG¨Üj>jLğXÉ&<äåÊNÑÛÔWì¿Ã>ËMğN“œ–1YÂ¶êÿ\0xF#A÷Æ+xb!QÚ\'6\'R„bê-ÍÚ\\“IšBG­tòèr\nx¦;àõ¦ÈNs”ÆmÇ½\n=ÀN´mö£ó¦³mÓZ\0ì{\nMÃıŸÎ™ç{~´Ê4Wl/¨üÁŞ’‘—q¨•¯¨c¬\\Õ®†:Lãõ4U}lí›¾?å³ÿ\0èFŠç_ál¼Asƒÿ\0,¨®ó8¯6øB?ŞmfæĞr+Ò7QV¶)®¢î§+qLÎii’IE3q§‘@DûW¯éNóG¯éQQ@†Ïq^mûWê¿`ø#­&yº‰`Æ~ğf\0Ê½!xAÓ¥y‡íg£Í¬|\'¹òT°Ğ¸Q“´°ş\'øNÇV	E×‚–×?;ÿ\0i¯OáeüpGæ-®A1®mûÙÏÁú×ÅÓäÇZu­Ò•uº8oc_£:ŞŒ5yã¶”G$s[˜d†w`m9ç­|qñ«áÁø_û@iãÎ²¸^)<½œä‚¶áİy™ekEÒgÔçX^w\Zİ·t@%µŒâ\0gÖµÿ\0±æ2oS× U:ÜÙ²)2~õÒiğïˆtÁÇæMj][cÔşÙİÊdX•$öQÍş\nXH<¶1£¥wñÙ†?0÷*Ù§÷ûâ’ĞéçîyíÇ…\Zâ|•ƒÁÏ5³¥Y¶—ÔÊà`cµtwVé8!cÀñÖ³®“Ëãë7vZ(Åh<¿›{ŠÙÑÓ6¸Ş¹û­Q\ZìG$(ù½ëfÂïìÖ¼Œ–è}*yYf6±jF§\'\\ãËš|ÒÉwc \'t®0ÄòÄœşU‰®Z)Ä‡*œûUïˆïÌ9õíB‹Nàr²Á~’²É½Õ‰\'qÎzŠ	A|©ç@]BœØO¥wçLŒKŠTöÅK6™D6ª‚JÛ˜É»\r¿Ã[K›…†Ú¹\0éÍoØh‘éí…v(ì+y,<•íùS\'Q2piy‘)$?Ç:Cj~¿…?Ö<D®ˆqøã|iğÇBºÑ?jü˜âO³_¬RÆc%U$p§A’+íÏÎ­cp\0ÏÈxòÏÁı9µïÚŸSÛ#7\rsrIÈò£t%~¬pĞ×£†“9Xóç:‘õ=ÂßÃ&é\'“o˜Í1C\'sÓô•~xx,\Z%ª”,H\0ôE|+ğ»Á÷3ñ<Z\\÷“\\³n ã\0sÇÓ5÷„y0*Â€+§,ƒm³!šjœz’ù€÷¤wãƒMÆ;\n7è¿{gÌ†ïz3î(Ç°¤\'”\0¹÷ÙÈiwö:äÎF?J:\\ÑIœSD˜÷©¶·Ùæ‚qM-“šBsS>ày~¹m^×wïşÑ¢®k0gWºùOúçÿ\0Ğ©[á\Z“â;–õ‡úŠôZó¿„-\"ø–è66}ŸŒö…z%ZØO`ƒÖ¤Iº\nˆÔˆW9¦fK@84€æ–€&QÓ•¨Ù5KÄ:%ÑnlnWÌ‚ê&‰—8È#×µ\\\ršeN:ÑÒİÇÓº>ø­àé~üC½´}Û­fùw\r¡£8eaõ\\~µó/í½á‹xåƒSwòŞÎò	¢fÂ‘˜ç?…~“~Ö_â?…Æ¡amCNWw]ØóbÆX¼Lú×Àôañ#Á7ZÜ‰ÉŒI\rÆÌŸ—æQÓxäWÎÕ£*ıİµÃâã‰ÂYîi¶¹[E&ìùƒwçÍmX]”TÀü4×·şø~øñö­>HÁNÑ»õÍu–’™|²¬N<ÖU’R1ÃŞ×:xîL«úTğ9Æ3Y¶×<àv«°Ü¢Œ¶\nÈì4×*xô?Zåüw|Ú,#b–yNÄ¹5Ù¤Èyñõ5ÇxÚåañeªIÂ˜\\¯¹Êæ¥­4TmØÅğ¾”èŞmÎK‚®ãAğ»k0†5	Ë:Wüsı¦|%ğA­m5@Û_]âHaKw•™y;GƒŞº|^·Õ4h®ìçK¨n#•;v‘ïÎqI&—¼t-]‘ÒëšRyr!Û\'QëXŞIt»Ï±¾ÿ\0.BYY»{f¼ïâ\'íyá_†^&ŠÏ[ÔÙ¥=VÙäôåŠğ5é~#³¾Ñ¢»·e€í–)S€şãó5|¤ÎVG^–»‡JI ufÊà\\BŒ:ı*¾£.ØÖ•‘ÍÎÛ³)Ë9<ôæ³ç¾ÆTôúÔ·×=HãV\\Òã;¹ç½1Ô*k2§“#áR*ğoÙ/C3üFñŸ‰f\r™®æ³…6ãhİ–9üò¯oÖåX´«§Bç™ÚkË>\nÙ^êfk[8Ê½Ôœªàff/·\n}Éş/å]wq§hõ9©[ÚŞ[#ë_Ø‹ÁR^ëwºÔË¸[#[¡+ÒGÁ$÷xüké¼‘ßô®3àŸÃÅø]àKm7!®˜™îz4×ß P>†ºíçÔ×¹‚¤éÓQgÍcñÚ³™6s×&£ó½¿Znóêi+´ã³ÜíúÓ]·\ZBqI¸Ri	À£p¦“FÀ+šJ(<\nMö\0¢˜%ÜøíD¯ïY»½Àà5‰öµ×?òÙÿ\0™¢Ÿ«¦uk?å³ÿ\03EefjPøI6ÿ\0]tâ~¢½}yÇÂ?—Ä×ŸõÇúŠôUmÕKa=‡‡É¥Îi”ƒLÌ|¾´õ›™N\"€%iÁ³PR†+@ƒƒK¾¡ûFÕéúÓÖLĞ!ù×ÓïÇùükäÿ\0³6±câ½NãKĞ$¿Óî\\É–¢=Êªl$‚O·Jú¾‘†áş5J*jÌëÃbêPwùÙàoj~ğü\Z.³a6™}¥î·kyq•]Ç`‘½ë£ÓÜ+ü¾Õí¿¶ŸƒÈ:>µQ,hd·ºe\\3g	 sóÖ¼6Ê_-kÅÅÒpsYÎ<ìİ·}¯Ÿ^õn°ëÆEeÃwŸ ÷¥kÒ²ä•FIÍp=Ï^*êçQa©o…Ü¶P¾µÊü@ĞÏ‰`E˜Ã<J•şGØ÷«ÚB~+?û~mJVŞóòçÓëCer¥©ÌGàq<³hØéw²J™¤¶óqŒ`¶OoÔÖõ¿Â;3oæ[Ï5˜`	OJÛ6R wglUËO+«$7–¯ác‚1éM>ŒÓßèsŞ\"ğ>Ÿ†ÚM:ÃRH¾m·,Š[H#ÿ\0\Z‹Fğ”¢âòììlâ9Xm××ŒtŸJ×Õµx.‹n¿¶2zg\0ûXµİjÊOğ’rñ¥;½­.Î×M½6ÖYöË›­Äg§©®[Iñ<†ñ-¦ù]»çƒZÓŞoà*µ[œÍ\\šô‚G|÷‘+ml¶vÕ‰/ÃßNI|Ä=OÖª;‘Q«XËñDm{áûÈÖ?4ÉUP@ÜOõ¯@ıÿ\0gK¥h·ú¶Ú=¼©~®îóáÂí {úb©üğ­¿ş)iz}Ìmf¸¸Lœ0ŒnP}‹WØ–péöQAo\ZCJ#Q€€vía()Ú]Åâç	rAîYQ´u4¹¦ù”…ò+ØécÉº›æûSKA8 È¤¦ùƒÖ‘›\'ïb€EDÍ÷³Oi\"÷$sI«€4¡M5æÊñô¨ÉÉ¢’ˆh&ŠGo—@qZ³ãU¹ÿ\0®­üÍ>£l²j·¬ŒZ+Sá/$»÷‡ÌW¡gç?æßâ;¯h¨¯EŞ*VÂ{ºœ­Å3u(ni™’Qšnò)CPÕ©ÕlSƒæ€GZh~y¥Ü(H¤Ær~õ(9[u8gŞ€9/ü,Ö­#Íœ[4Ğ¨<™æQø‘_E!Bmu;YHèGWŞm’§Üb¾Cı¨>7ÃŸKzƒ\Zv±+ÏÛ…CË¦~§#ÛÖ¸1ôïeĞõ2ê¼²å}NYn†Áş×\r,¤‘õ¬¿íPLg¥K©/\\şµóİO©¤îK¨ß•UF+ä‰ö®{ÄßáğäMm•æpOD§5­z<ÈÃ&q·çÁ¬M_ÃöWv«$–VóHvé\"ˆ÷È¤šgT\"›Ôåtÿ\0ˆĞx–ŞGûKŞÜç\"”cŒt­H¼mo<æÊı¶’ GmÊ@Ö¾™¬­Šš(D+ÀM™ØZ2x»G‰B¼Ãó˜üÅh¬w/f•š9x¼B5+iz]ì‘qµví#=zµgŞøÎoß§’òÚ¬œ§BO^Wõ¯A‡Æz|Öám\r»ñ’O\'ğâ³îKëH!3uP¼}ıt]Uå¶„ÚO‰·áŠO/Ë”àîÛÁ®¢ŞrÑä’=;ÖZiêéİ<²Q—ÛéW¨ÃŒûÖ|Èóš-Hû—=³QO&G\rÇ¥Q}P3pWóª×:¶ÅÀ‹|ª%˜ğ\0ú’mO]:îÇ¿~ÅmCYÕš=ÛJZÂùèÁYŸôe…}ƒj×ğ/À#á·ÃË;•s\"‰îAÇúÖUİÓÜ\Zì7WÕaiªpHù,Dùª6M#ìÏ?Ú™œÒfº.Iæê)²)›¨Ş(´Roo\0Š7\nilÒP÷\n7\ne&á@fæ“9¤Ü)ğhép0o#İw/ïŸçEM2+pİM‰©Ç|%ˆ/Häù#ùŠô%pÃ­yŸÁÖ\'Ä·™=aÇ×‘^‘·éùT­…\"ZÅDKÅ=[+Í32O0ıiÀäTY¥É%(b´Ån)AÍ\0HE-Gš7P”¡ÈïQn§â€æZò¯ÛD‡Uø+;Â\ZM=…Ò6Ü•ÆAúšõ=Â¹oz`Ö¾øßƒæi·\0ëå±¨©”SLÖ“jhø&×Uİ.õÏ9©Òoô A%zZæõÓ%¦àG#Ÿ~•_Añ²ÜK²Vhİz‚+åå}²¡+hz]¢	\"İ×Ò–X3´œõö¬ÍVóaÛ¾Õ»aó¯<ık›S±=J’iqH¿ê=rFj¼¿bÔX´¶ñŸ¨ë]-’ S¸/^x«ÌåG–ê­ÜWs’·ğT:4Ÿ¹·Q×Š¿Ÿå b˜5±Ó4øqÁëN¸…\0ÎsÏö›–æt1ÿ\0£²lUh‹hzõÇáWo¯RØîÈùyé\\ŠüY±¾÷ç*mµj„±8ë‘W>jRñ¦›<›L÷‘Œ8œuöæ¼ÖûÅ²ë—ßf„ŸÄÀsjëü>Ïar&wÅ´‚<¥vQ²g*:3ôz#…çŠ™PÛN³Û£Œ ñOÜ+ëcª¹ñQì?Ì¦“šMÂš[š¢õEGºÔ’Šu¨Şe8ŠŒĞÙ°i”g4€æ€Š	Å&áKÈLJO={ÑMtËO_Z+SÍşø¨®Èïşb½6ßØW›ü\"|ø†ìzC×ñè™\"¥l\'±6yè?:B™=ÿ\0:[kfç{~´ÌÇ§îCOnn†¡ó½¿ZU—stıh}ÀÒ«â¢üé^	…\0XÜ}(ŞsQy§ÔÓ‘÷M\0I¸Qº™š(û…T×­şÛ£]E‚Şl.„ªGõ«¤vùHõëLqÑ¦~jjğ™\"wm zWâİ\Z_¾ËƒÔu¯PÕm>Í©\\ÂÃ˜¦’2=0Æ±õmgˆá3šøú“å“Gİa¢œ;ÁäÑo-Ev&à˜b\0éÍz¾ãk]NİL3ÆêàÃ<ó^Câ_¤ŠNŞ€ãå¬+-OSğ„¹·C1°ôÿ\0ëTÆI«£¢ÇÒjÂE)÷{\r>ÓÄxqO—Ÿ½Ô×‚Z|{ºÓÿ\0×C\"¿F%ø?Yÿ\0†·»ì1wÆjì=ĞëffëÉçƒDúø†Üîº{W„ÉûG[4˜;±~™óªÚ‡ÇY/ÁK+k†fé¸ği=Ç¦xÓâ,\ZU“nš\"Ì}+Í/u{ß]m]ñÃ»wÊ>ıgÛi×¾\"¼In¤f\\œ¯$×iáı+D@£{â•ì.xcD[XÀÙ´ø®ÇMµ\"¹©>ãÖ³4»óÒ¶†%üªTîMX¦µ>êøSâñ\'Ãİ\"ìù–P—À?+lt;Æ~5ù‡ñƒâÿ\0ÆŸ‡öĞê_<]pš]„cÎĞŒQÎÌGÆğ@åIãu­/Ù3şC¬İxêÛÃ¿´Øcâd³}A-›MrÊ»ç‹\0Ærçø}ó_[†­A%¹ğ¸œ<éMİh~•îÖ·UK]Rûhæ·™.`™CE,l$g ©|Ş+°ãæìI¼ŠU|š‹Í¥Ph¶$/Í‰¨„¹£Í>ô—q›ê?4ûÑæûP»‰¤-GæŸzF‘ˆëúP¥‰”ØÛåå¿Jvh|Ìÿ\0	ü¨¦ª6Ñó”V&§•|”·‰/8ãÈş¢½uy¿Á¼¯ˆï2ÜyÇâ+Ò3š•°ÃÕ³KQƒƒK¾™˜úÅ3ÌÅoµ\0I¼úš7ŸSLdÓ‡4\0ä|7&ŸæÜ~U(\'(”ÿ\0¥à¨Ïj«y}Ÿi,óË0À¥äw`ª€u$“À¯…¿nÏø+Şğéî<1ğÑìõg\n’êûØÛZ’U\0Æ÷À†ÀÉôªJû•f}uñ»ö‘ğ‡ìÿ\0¢›ßj±Ø,¼P*—ã0Š;ä¸õğŸÆ¿ø*/Œ¿i¯OàÏ…8ğÖ‹N±¬O›ÁlFĞ\"å•]ƒ209¯Ï¿\Z|ZÖ|s«=æ«ªßj·“i.n§2I+1É9Éã9àzšúsöAğÔ\Z_ÁÛmMyú¼³M+ãæ;%uAøP+ŸWØQæ]NÜWª¢úÙ¥Èc³Â\0»ÎXñÔšÓx<ÕÊş•ÎxjëÌ<ãƒ{WOÚ1Æ=kãªË™Üû8G–*&»¢faó(9=+’½ÓÄH9ãé^™¦¨³Búõ®[XÒJ?<ñÇZ\"œQ¢8´ğ¼7Œw Ú¯Z|%Ó®mÇîùa\rk=¯–q´çúÖÏ†.„wh¥¶`úu­T´(ã ø#a¥¾ûkpÄ’X³jì>·ÓâÏ”¡‰ÆÑÈ¯LÔ‘$·Üvæ¹©íÄ÷ƒ ¤Ù,Ä°±6v’3Ÿ¥niÖÛœ|¼T0ÛÈòˆpö­­.È¶~föíRI{N¶ØœÔ÷ÉäÛîÀàúV…­°Š\0O\'ÔÖ~»(U>™§r¦¼ Ü¶I9ãë^YûY|ƒÆ¾“Ä–¬zîOæƒ<J2ÈŞ¼cøúW¤Z÷Ù­ˆ7ğèŸ\nõëÛ²¾M®›;}|¦\0®Jº8‰ª‘p9ñá85#ä¿ƒ_¶¾Ù$>ñ6£§Ú¨ ÀoİŒ•gÛµ}ÙûÁ\\tÏˆfÇÃŸ¥ƒMñÌËmm¨[@EæTm-Îcrx?.Ş{\nüŸÍær3\rhéú—ÙnÃ|²!Q½sòF\n‘_p|?)ıÅz—P¬‘É½CSAcÚ¦•²¿~*şËßğQOşÍ(,´ıB={D\0ÓuYd+l7V#¸`sÇ÷7À¿ø,?€ş ÛÆ¾(·¸ğ¥Æ¼˜{«eÇûj¼g¾”¹r³ì$|7^)şhõı+ŸğGÄ}âN¡ êÚ~­g*‚³Z\\,ÈruÆ¶Ç4Ó¸¶%óG¯éGŸÏõÅEŠ3Í\0N­¸qü©’I‘Á¦+í©(ÑäµK¸¯J‰äƒõ§ù€uæ¢{\0èíÁAÏj*D\\ ëÒŠƒSÉ~¶|Iwïõé\nÛkÌ¾3İn9>FOıô+ÒÁÈ©[\nCüÊ<ÊmÌÇy”É¦Ñš\0’ŒÔ{«/Æ^8Ò¾ø~}SZÔm4Í>İK¼÷3,H¸õb2x<wªQl\r7–ÅyŸí#û[x3ö`ğmî©âRİîmai\"Ó¡™\rÕÓ€ˆ„ƒÉãœw¯†m/ø,N£âh/4†‹.‡`,šıÒ¡à`–X¡*p3üDçƒÅ|\râİx“Rû^¡qusq1i™ç¼—RLŒ:/®«öl¢ÿ\0l?ø*išÚËS»ğg…÷Nµœ5ÅÂæ¸ÁŒü¹#Ÿjùjï\\÷ÈîÄ´ò·ÎÃØrÔVUíËË1%ÉÜÄõ§F>Aô«ŒBUWAÆbö¯¯¿a?ü3»ÒÃI¢Ë¹T·;%fnÇÆ¾<.Pÿ\0?jïÿ\0f_‹oğ—â¥ó,ge·¼ä©fáŒ×a‡uiYt;2Ü_²¯Ìözré¬Öº¤‘v\'9ØZÍˆ½rú„a.c¹ÖHäPDˆAVÈìG}+sN¹ó\"Ç^=kâe¾§Ü#nŞe™1TµK$º\\?*‚ŞFI©§fù~`x9QmŒÊ“EXÜqæ¸Æ)n|1ºİÊ!n€ÿ\0Nõbñß>áZix’Ã‡g j¤0-¬¯âO.G,¾¹<\n¶4Ö7/ÎOzÒxbp;‚İh–é-ãã=ª…rµ• ¿Ë1ëZšrßåà•›\rÏÚ¥ãôïZª|¨³Ç° ‹—ZàCjrs\\æ±zdr3ïVïn^lªœ\nÌ?=é;ÛB/¨ßYù÷¿ÍÏæ?ğP‰kà¿„–z%³ÿ\0¤ë²Ÿ1AùŒwBH¯aÑR-Â{¹ÜEº4²;P3“_şÔß¿áp|^Ô/ÑŸìËö{4c‘&ÕşŒş5ß”áJÜÏdy¹®%S¥Ê·g€dÜÊ¬ÅGE©­ÔFœ°œp[?Aæù±IÀÇzn\nn!†6ŸZúö»,ßby±;2v+9ÙÔ¨ëøôÅO¤kMÿ\0/˜‹ †Ç¯STQ|×ûØ9$œöüx©ÕFô9Şr¤œ/Ë¡¨åÙêÿ\0ÿ\0j_şÏ^!´¼ğÖ¹{eåNÍ=°æÒğvHÎW×ç#¯jı3ı’ÿ\0àª^	øùg›¯Lñ$Q =BtKk‡<„Œ‚pyï{Wä,WİY<Š[ÌÉqùPpG¯£¨â¬häÏŒñägHäŸáúş•.ëb¬Bzv©±d.-n!¸…ãpÊš²z×á—ÁßÚ{Å¿µ˜nü7¬ê:ZÛçtyYb`À•¿•}½û0ÿ\0Á`ìüC$\Zo­VÙfãûZÑ¿wØócÂíA<â…5ÔV»üÊzŒšËğßŠ4ïi1_éW¶ºŒëº+‹yVH¥r¬¼\ZĞSëÒ¯ru$oåIBà};æÎqëëJK¸ìÉT£æ=(¤É^=8ëEdhy\'ÁåÇ‰ï?ëßÿ\0fé\"b£µyŸÂ Ñø®ç²´?Ÿ\"½*¥lC}ùçÚ<ûS)c=N=Q$yö®âWÅàÿ\0…¥Ö<I©[éZ|\'iA “Ğ\0$×È¿··ü£Mø{/†<ı›â?Æ\0»¼2î´ÒóÉRÃåy1·€ÜnäWæ_Åï ø×âY5ë×úõÌ¤2‰ç³Gè¨ŒH\0gµh©Ü–ì~‰||ÿ\0‚ßhÖVÓ§Ãİ6kÅJKR·òâ\r»-7îlFGqšøKöŠı´¼kûHkFãÄÚ³½ª1kkhaDTÎ9Æ>µä:ˆ^òmÌD¤/?,~ÀVl×ìI$–õ5ª‰ç4eñdÂİ¥ÎY¿3Uâ|C,œä¹õ5J Z@~µnå¶Ãü<z¢[m•VLËÍJ“øçò¨cûù©üôÖ¢&oœ1¸?J„Â~ğè½iÛ‚¶IëÚ™,¸íòôĞÆµgÔ±ÿ\0í7ÚM—ƒµÉˆ‹ı‚á”ñ’[cÛ%ˆã½}O£Áè_c_–q\\5Îänœ‚8¯©¿e/Ûb-môÜ¢ˆµvi¦ºäuæ¾s2Ë]İZKä}>]™İ{*¯æ}lĞôÇÒ§€f,7ÍÛÔí\Zâ×]Ó£»²¹†îÚe’ÂáÕç¨ş¼Óš=>½=+ÀäåvgĞ©¦®ŒûûA+9>õI­dN›‡µmŞÀLfÉê(Ğ.U\r,rœR´r\\I×µR°8<zZÇ2x Eı&ØC;\n¹+—üi4ûfH²i\r´—WXŒÓJær’½ˆ±n1V4ıî.W<–àÜÖ—öri¶í,Åc‰9i$!~¤ğ?\Zù‹ö¤ı»m4k+­ÁÓA<íˆç¿Ga°†!–1Ç ù³]Xz«.Trbq0¤µ)şÜÿ\0´ÜPYÉà½ådYn©*§İ`ØƒìTæ¾M€}óœÔW7òjRI4¯$’»YÛq9ç$i‡t²un·½}^\ZP²>W]Õ›obÄlşnHçªÜÅTãƒÀ UboaÇ¥8r ár?İé]IXç$¨ÙiÆ3S\"¡ü¯Êüãå?&29÷çò¦Á–gY¥xS€·ÍƒÁïı)6³Ÿa”t8æ6Ï5p[—4è¼Ë%QÎÒHü…‰üšŸMÜ³ò@v#NŞ@,qÏìæ£´„İXÈøfL\0Ç—§¡õ?¥Iöém¼¡€ÏÈç¶3øHÔ½a4Î2‹‘§<İ1øôç¯½kZ]MªËh„W)jnŠ›Â„+•g“ÈÁ=ëK” f,¬èÂFŒ¦U—1®sş5sÍû.™‘9$E9 \0àãÛõ¤Òhhõßµ‹~êm^šÇí2–%Ex^B2.03Æq­}éû(ÿ\0ÁX4ˆzJYxé¿±u”Ú’]Ç6w-–ÈÉCŒp@ï_—öæj6É4ƒlğ›÷\"\nç98İò^µmf{¹L&]Ê»e(Ç<ÎÒ8#åç<t¬nÖ¥èÏß\r_´ñˆ¹²¸æ$,‘Ÿ”â¯G/”ÙúWâÏÁÚãÅß¥ótÍUì.ì,ÚVkIÔ™9h”ã9ÇÌ•úAû!şß~ı¤´ña~ÖšŠ¢*§½ÆõºÈ?4N@\r÷[å#ĞçufK‹>Š{….ryÏ84Q’#—œpÑSÌIãŸ/Ì¾.6ínßÌW§äšòoƒÑ\"øÖfB@0‘ÏnV°ÿ\0k_ÛÃÂ_²˜ñj2½îºcWÂË\0ÙÃ9Îàù5Q2±“g´x‡Ä¶Òf¿Õ/-¬l­¼³O(GRI5ùËÿ\0ÿ\0‚¶kÛŞø\'á}õí›	írLİE·-È$¨$ó !†ÑÉ#å¿Ú÷ş\nãOÚ{W+ª\\Çc¤&õ†ÒŞ=W9À’{rÇ5óÍÖ fİ†1«œõ~Ü‘]Q‚JÂ¿sGS×[ÙL²™šC½†íÉ»¹\'»tíY’L÷+ó>UFoÓµV\rÏ?…;±Ö®Æm½IvôÅ7vÍ1şZj¯ôìÅÔ³§!oŞºƒëÛô§Nÿ\0»>ãõ¥_ôk$Oâo˜şdJlËşŒZ•™Dj@ûj;@5\"©eİ@+ù”ªsÇğ÷¦1ÂÓwn –=¬xÈÎAôöªÒÈeaÆ;Õ0…Í+[ùÃÃ&‘j]ÏDø%ûVx¯àÎ¡Øµ¥°/™låmñ¸Æ;ƒ;Šú¯áŸü3Â^6Ã«Û\\h—¸Uy|Á$Ç¤‚?\Zø\"â³œzÔEXè¼ŒW#/£WVµ;°ÙjZ\'¡úßáÏè>1µišÆ‘z‡şyİFOâ¹È§ßé. ‡ÔmÉÍ~MéŞ »ÒT´3¼~ëÖºö„ñg‡¤O²k7qí\0×—S$¿Ã#×§¦­4~™_é&Kt;~n=r*æ¢1##óùÍ§şÙìĞˆüCpàƒ\ZŸı–¨ë´÷|B».õÛ§ByUÂƒùYaÏ¹o:¥m?MµIğåƒÉ¨êV(ƒ%§¸TÇækÉ~!şİşøpd[#/ˆ.ÆälÊ±+å²N>‚¿=ï|a{¨I¾k™d~ÅU3És¼–İëšê¥“F.ów8jæÓ—À¬{_ÇÛcÅŸ®ÛíÒiº[`[wÚ‡äoÆ¼vk¯8î\'œç\'’MTIµcÈy#İ°/Ç·µzĞ¡/póªÕ•MfîMîéR†#¿×ê(ÙQ\0æäb§\"µZu±pI°~÷#-ÓŒ1ÓÓšm¼¹$ç°ëP#şê¤±?¾Oºàç E0-nØ…_w\\œ…I72y[†H n}¹¨0ïÛò§o7H‘àÉëÀoçPÓÜksR†C\\ÍæI•‘ğì+ÇCÉ=F8àšrÉçL’cq1¦áŒüÀ(búÔZ-ÛÅ§ÊŸ+‰v©F<qÓsëWã‘NÆ‚C¼ÊÛ˜€ß*eq8ÇQÏ\'Ú¤Ğ,ŸÌ•v¼q¼ +çîcä¸È<sëÅ\\¶‚I\"kvQ7ÌÆ¨2p\0ÎsÓ¿·JË6¹‹÷x<üÊzúõíüëY¯&kxØg\n„È#hàû^¾õ2ò\Z-İ@Ûá]Š+y-\"ƒ…çO¨\0t ó÷Ex‹í+;±;ü¶älÉ¿ŞàòNµO¨*K}0£’›Ğä¯,\0o^üõ©&oºYãòæˆ4€Ú\n‘\'òsÛŸÎ²,Heû~íìb—RgŒâAüYÏN3Ó¥uºgŠ/¼x×ºuüöwvÏ¼¬YWg\r(WÏ]r\n–³Ñæ¹ÿ\0IŒâ!/e“~26>]ÍÔ‘ÜzãµÉ.ÿ\0RØ a—7“Ï*˜•\0÷Ï8à\03YTWØÚ–úŸ[[ÿ\0ÁAş,iVék¿q,6Ê\"æÒciW€Xäåˆœ{Ñ_:Câ]>(•²´Ù¶€<ÇŞıÎÖ“ì1éErZ]Îßs±úñ‹ãÄ³WÂÏx©¤E»·ÓeOI3¶[²§Ê^9ëùWãçÄ?ŠzçÄ\\êÚî¡uªjw„g¸•¸\0wú~úÃûNø\Z×âwÂ=_J¾ÿ\0Usìb»¼—ÛÃê¿!o,„WóBÍ»Ë‘“8ÆqŞ½,4“ĞğjŞ:™ÓÈe“¯OÖ˜>b}ªY-ö’2x4Øcıç_ÒºvÛÜj1SÒ¤5=¢QÔf”DµRYÎXqNw°r@àTÏn\nçÒ–ÖægüŠ ê_ŞõëM¹ËÛãîñŠ%Œ<ßJ[¨ò¨2zĞZ+ªãç\"¹fÅ*Ç»J|q|¿¥J—WD#\rLh‚¯NôàTo•©;ÕÉ­•ˆüúSÕDD÷<Òµ+F\nÔ“Æ#U÷$Ç^Ù ÙFÄOnUÀŒàŸJ…íöpß‘«Â/ƒÎFsLòrÃæ4¯âFsëœTŠ»›ÿ\0­W,Äy5\ZesÛ=(ßr}Ò?\nrÛùjI<dc ÔÌÛP{Óf^W®1Ó4;$à½Xy²ÿ\0/Ojb h¶ã5=µ°I:ö *n~KT­6ÅÆzr3ßÚ¤Š/Şõ¨x¿@{ò:Pdñ,f“qØÜmã¨¤±p?º=“Ä§ğúÔ–p	#$öã@Ğù#VVäu=¯4ì‹™ÂŸ”de±’3J°nr	?QÒ˜ÔÚ\nñıìÒ{diZIäÚ#d39mÙL&?8§ÈWæÙ\"qÁèF}†õGKa,{Ï+‚NqŒ~œt­!–C(t»BÓioâãÛš—Av9o]Û@úJ»yo5½¦$Ş­±]L‰Ô‘€z¯}ë6i<¦#Ÿõ{»tÏN}êìSMy­$Í \\ª‰>m«°¶?Î¢æ¤}x²ù^O¾cÇÚ9ŞIÓéÒ´\ZôŞÁ~%F·#Í´6VAòã?7ÊjÔ$Íºœ1H]”‘Ñ~o—òã=j×ˆ9-o¥Xü³k0e\nŞ«!ÇéÔóïXËskÃDÖé»÷`‰•_i—Ìÿ\0[‡$—ÏàÚµ5«Û9îµ¨¤{iI&(üÍà–iwØ˜v\'œÖÏ¿Mk˜ÿ\0uS”òs¸ÂLœŸ­nx7Ã1x‡ÆqÛHì±J@‘@á³¿?JÎm$RmlwúN¥¨j\ZU´ğèzSE4I\"y*@#©ÏJ+ê|ĞÃZx66lE´`Ÿ³¨ÏÊ(®S¢ìÿÙ',NULL),(2,'College of Computer Studies (CCS)','Software Technology (ST)','2018-10-13','Program Name','Program Head','Socially Engaged Research',1,1,2,4,NULL,'2018-10-25',2000,'Explain','Name','a','a','23','a','a','a','a','Others',60,60,33,33,20,20,20,20,8,'orayt','Ayos!','dsadsadsadsa',NULL,NULL,'BERI GUD',1,1,1,1,1,NULL,NULL,NULL,1,1,1,1,1,NULL,NULL,NULL,5,NULL,NULL,0,86,'sadsadsadsadsa','2131231','dsadsadsa','','eweqweqw',NULL,NULL,NULL,NULL,NULL),(7,'Ramon V. Del Rosario College of Business (RVR-COB)','Accountancy (ACC)','2018-10-13','asdadsads','dsadsadsa','Socially Engaged Research',1,1,1,3,NULL,'2018-10-19',321313,'fdsjfkdlsjf','djsakldjsakl','dsajkdsajk','dsajkdlsaj','21312321','dadsakdjdk','dsajkdljsakl','dsadsa','dsadsad','OVPLM',80,50,90,50,5,5,5,5,8,'RVRCOB ACC DEPT CHAIR','','COB DEAN',NULL,NULL,'ANG GALING',1,1,1,1,1,NULL,NULL,NULL,1,1,1,1,1,NULL,NULL,NULL,5,NULL,NULL,NULL,89,'ayos to mehn','dsasdadsa','fdsfdsfds','','fdfsdfds',NULL,NULL,NULL,'',NULL),(10,'Ramon V. Del Rosario College of Business (RVR-COB)','Commercial Law (CL)','2018-10-13','b','b','Socially Engaged Research',2,1,1,2,NULL,'2018-10-27',45,'e','a','a','a','11','a','e','b','b','OVPLM',80,23,90,23,23,23,23,23,7,'','','',NULL,NULL,'',1,1,1,1,1,NULL,NULL,NULL,1,1,1,1,1,NULL,NULL,NULL,5,NULL,NULL,NULL,90,'','','','','',NULL,NULL,NULL,'',NULL),(11,'Ramon V. Del Rosario College of Business (RVR-COB)','Decision Sciences and Innovation Department (DSID)','2018-10-13','c','c','Issue Awareness and Advocacy',2,2,6,16,NULL,'2018-10-24',23,'e','e','e','e','11','e','e','e','e','OVPLM',80,2,90,2,2,2,2,2,7,'','','',NULL,NULL,'fdsfadsfdsaf',1,1,1,1,1,NULL,NULL,NULL,1,1,1,1,1,NULL,NULL,NULL,5,NULL,NULL,NULL,91,'fsadsadsa','','','','',NULL,NULL,NULL,'ÿØÿà\0JFIF\0\0x\0x\0\0ÿÛ\0C\0		\n\n\r\n\n	\rÿÛ\0CÿÀ\0=B\"\0ÿÄ\0\0\0\0\0\0\0\0\0\0\0	\nÿÄ\0µ\0\0\0}\0!1AQa\"q2‘¡#B±ÁRÑğ$3br‚	\n\Z%&\'()*456789:CDEFGHIJSTUVWXYZcdefghijstuvwxyzƒ„…†‡ˆ‰Š’“”•–—˜™š¢£¤¥¦§¨©ª²³´µ¶·¸¹ºÂÃÄÅÆÇÈÉÊÒÓÔÕÖ×ØÙÚáâãäåæçèéêñòóôõö÷øùúÿÄ\0\0\0\0\0\0\0\0	\nÿÄ\0µ\0\0w\0!1AQaq\"2B‘¡±Á	#3RğbrÑ\n$4á%ñ\Z&\'()*56789:CDEFGHIJSTUVWXYZcdefghijstuvwxyz‚ƒ„…†‡ˆ‰Š’“”•–—˜™š¢£¤¥¦§¨©ª²³´µ¶·¸¹ºÂÃÄÅÆÇÈÉÊÒÓÔÕÖ×ØÙÚâãäåæçèéêòóôõö÷øùúÿÚ\0\0\0?\0ıÑ¼M.µv–ª­r7„„ŸLWuiğšKØC5Â@Ç’€#ëœV7Â+8›Ä72\rÉr}sÅzZ]ùcŠâPV5¹ÉŸƒ\'åÚóÓşÊ¬\'ÁD\0Ô~¸‹ÿ\0²®™®ËH4©s…ûØöÍ?gäŸ­—9Ô:Œåcííóœ\Z’‚v­¾”·b#ú×F5\rèÙ³ß¦)a½e\' 2·©Æ*\\b]˜|¶fÈ¿”‚›°!ÎO§^¾Õf×àÅŠ}¶Iw\'\"ÁVã¯=y­‘¨ÈÒ±fûÜx\"œot+ÆŞ>P9éÇéS õ1ŸàÎŸ(Ü—“rR\"\\sëÏÿ\0[Ş¤?³å´¿>¥6×#\0q¿¯Ozİ[Àwoâ\\oCŒÔÿ\0…$7I#?»mù?ÄÏjv]CSÏà6›5±ÅÕŞà73y`ü rzğ?ÚéO´ø+¦ù	ç]\\»UÆpõª—nXLq)Ç¨ÏøšU¾)ŒHomÃ€•!jT‹àN†Hšçt¹u$¯+ëLw9¬öø#b÷»…R ©‚1ß·O~•Òı¶HîÕQùNNI,}1Èşt‡ZhXÇˆÊ…È<zÿ\0ûTÒ‹\rLx¾éRÇæ­ÍÒ†}©€½¡èÃéS^üÓ-â2}®áÕIù7·‘œqõÅjlÈ]ÁrtÉÀã<òzsÔÓ¯5“40¡A\' ³©ÁÉ>¾æ†’Ø5F$¿´ ì÷›ÖF…ÈÈÏN=ºu8éDtQùt\Z.	iå€cùñ§ò­“}¹d†t*I?yv¹#§¿×ŞŸi¨Ê’¤–@ÉÀÎÕùÉ¯<fšŒX©ğSETå“iÉ}¥Xç¯té×‘Dß	4„5Ù,‹±‰Ìø\0óÁ!x<t=kjê÷Ï‹`Ú¢8Úùàƒ½°Ü’9ÇA™#5\rÅöéÿ\0vHXÕ£\0~Sæg8àöéÅ>Hmğ£@]›¡¸mÅ®°	áA\0üÜ\09úÕƒğ@wCöYÙ|³»,>oŸ‚1ÁÎ1Ğf¥}T\"E€ÆJÆãæÈËt?‡n=i}ö‹¹Ys–RÇ;²8íşíRŒDîÈ.şøzÁ[+¢DLìZáˆsóG±ã#ÜRÉğ“A6³ı‘#r§r‹‡Ë}àº•nk‰§cî[pR’ãqÎyõëURâO±©ÁÃ—\'îr‘şª•˜‘Z†>c¼X—+‰.d;ºàğŞã§¥Jÿ\0¼5òçJVŞKÊ™AÆÏÉÉÉ\"¬Ş\\,·%fÎ‡VàœŸè*! \näm)#’Ì¹ç¦8ÿ\0ëQbˆ¬¾xv5xÆÜå&w$	ÇÍÇ\0ô¨—ÀU‘›LCóü Èüõà\rÜõ•Jòğ>÷$ç½:Ó¢»1ÆH\0‰r¤wÇ?^½xæ€W+Â¿Ğ-]˜éğºñÁvã÷¹¨ÓÀš\Zsö¿ï¦?û5X7E[=ıqLîêx=ihib¼ÑXóa	ôûßüU7şM)HcãŒU“Ç#ÔÓ\\àqNÁÊ¥sàı%ÏüxAùšCàÍ%åÂßùÕ”“|õ¡Üæ¥b“xCI‹?Šoü!ÚA?òƒõ« ‘G™1@¥~…1àİ tÓíÿ\03I\'ƒ´‚?ãÂÌÕÂØôüé²H1ş‚53¥ğN‘\'aˆPäb¸¯x+û\r|û}Í9%yõ¯Dí“ã‡xVóıÏê*f®]Oö…ÿ\0kEG°úÊŠæ6:Ï„RÔ®Éë±?™¯AÎñı;\ZóŸƒN­“¸lL{rkĞüÌzÖñm-L ®<61ùSª1 =¹õÍ<6­hö/|oµ¹éÜÔ¤ƒÓ‘ØúÕu9ÏCOY=Mg7w¡Z’Œg½H³\\z‰$‡×±ô¥VÁäñüªGvM€!8;Iê	ëı*eË¯eÊÿ\0{­V÷²2\0sşM ”Ÿ¾[=9ô .Ëm1„sÆ01Ğ½±!‚’Øã·~ªºüï• `ÉÎjC zŒëëHZ–ÚiÅ¿€3·w ÿ\0gŸ­B[ks¹r@?â;có¤’WºXÇÈjá\0Ú£××­VÔ5(4ë7šáÂA\n—ffÚ8õú\nRË] pûW\'NÒ½{úZ‡Tñ-®™k¸¸Ş<6ÒÍ´c-Ğúu<{×È¿µü3Âc}7O{ıhÈC1À°OŞAà¾T\r§‘¼zWÄ?o_|TÔb¸:½¥iÅ,1EeØ\\Çş±‚™9RrÁH#\0 šPob\\ÒÜıGø™ûjøáuÊ}³^Ó\n$‹>w)2£8ÇT]…‰\0zY—ÿ\0·ßÃû}nÚÏûLÌ°\\\\™Ë·«ñ÷Ç•\r§±5ù\n·:Ö»¡ê7ÓÈom-™­Ö+É™¥…;ÓRÙVÀ\'~–FXW;©kú€ÔşËª_Zİ*¬¨eUD…—Î~Kmç|’mŞIÀß²0sGê¿¿àªğõÖä€ˆBåîîD†2á¦Ê\0‹–ùbbwÏ_³ÿ\0‚ºêVú‰ÚãK²¸+Ùc·q#~éY®ˆŞá˜ç¨#vAñGÄzËM½Õlî$Õ.áó?ycrïk*2›­“Ëïıà,rB˜‘ÇØxáZÂú/.g†áÚI‡Ş&)GÌyÜ~w9`H*v•<ÒöI\nç×3ÁP¾-™¤³—Fh-\\FßiŠR!MùÈìœ«……áúzïÍÿ\0>ø« øŞÉ&}#Ro³Í%Å‰gˆ2Ÿ•ÚI@ûªûÀ§‘€Üñv±ª&¿¢[8xìçdª@\r`+ÆÙàí„!‰çi÷ş(óü[<Ûu\nl!ÙÊIo™›†fpI~xÀÎEªqê\ZŸ Ÿ\n?à²4×<Kog«x?Nm=.#†îæ)dCl\\o+ƒ“ÉûùbA¥}·ğ³ãv—ñVÊ°–…TÚÄœ“è@#ñõ¯ÂÍ3Æi-<ñÍ.mĞ¢2]mŞ¬1Ç$.™22y¯_øÿ\0	ñÏÀ™4_*}E¬áÿ\0_²A¶ëk‚¯Û´Ÿ.ˆbA88‹‹OCXÚÚŸµ|Æ?ÃÈôÈïÚ£óöÄÀc‘{Wçÿ\0€¿à´z,w_Ùº¾‹¨Ésicyip“ÁwóàaƒqõZûWáWÅMâ÷ƒm5Íöû+´VVŠD}„¨%[iá†@#¨4õZ²Ò[£ªvòàŸz2\0Ï#ĞqÈÿ\0ëşUæ?SøÓÓ“È,;3óš9ÛØ­G²îà÷£y=ÇáC¨WáÃpG©ê?\n¨¶ÃQÏÒ€1ßô¤i6¿¥ÛGZ«»Ø5ùÓ^M§ÿ\0¯Mó‰<Ÿ¦5ÛqªÔ5$vÚ;Ó|ïoÖ˜Xš(Ô5Ûq¤¢šíµhÔz„‡	Y~,S/†o}¢?ÌUó!¥Pñ3Å=wÿ\0\\Ÿ>üRÔ”ûW“éúÑM74W õ:ƒ\n\"¿Ô=\n úrkĞóšóÏƒjRóPÏBŸÄ×Ï®*ÕìLcbTå©å”q×ß5\0|\np9iØ¢TQşM(~}}ª.}qKaO?7ó©psÎÅ9gÇ=j¿˜ß…9$äñ@Ùß¿5\"¾ÉF@?ì“Ö««J[&€,.7ó‚¸È\nÃ#=3@“÷8=ª??t`cî€½dxÇÆš‚tõ\rNî\r>ÎİwI<òmHş¿­\0eücøÉ¤|ğ5î¹®]ı’ÂÁİÂ–?3\0\0	$Ÿ@O¿0¿kïø*‡ˆ¾0kš¿†´Ù4-e¸´yÓ3ÜÃóGµ¾ö\0[¸>a\\¯ü?öÚÕ¿i_\r7Lim|?eøJÌ.ã%²ÌAµAÁÁæ¾`·¾)6ÆV}\Zów’AQÉ­a¦R—C¢Óus§´wÏcÍVËHbG.\nr>^ŸR\0â•Ü,÷’G Ù’Ê#9Hå)<v‚Ù^N[¼uC«¦ Škk@¼m0ıÜ„\\(9XÇXg.IÏ<-\rjî¯f•~ÑÄÙØ …*¬ïä\0F6à`ä‚zî•ŒM/ê–º†¹©]éSŞÍ¤4òùæ<Ïló•Yq‘¹‘—%K¸#šŠmMæ±°kÒ\nLÒ}Cç(‹rÏ¿c.Kşñã$(~€¹ åÙÜlÒe‚96dÜÉ·s|¡öã ô¿4ñ©\'öE²¥£Is$…|ÉeQIc#±`Kd`&0Aá7a¸_cP›:ıš8Ñãu\nÙó\nùR!*Fs‚	ùIø†sV`Ö®fÑï<ÿ\0%¿´WHã€\"ÄJJ÷&÷bF`ªJŸâiæõ+·mD“ş‘.ÎYI$7ñÓùUÇ›ÍÓõKùå‰bFÅŸœüàãeqŒœT–ÚS‚QHc¹™n[F».]Š`0ÎâÃî²cç\'q#g«OÈ¼:Ú®!C˜Ë\rçpÎŞ0Ø=8îZÉµÔ\r…ÍôÉ,Ûd’’ˆ÷¿\rì9ù_nµ úTÈ]e(+}ğD`d>qÀÏÍœñŒR\ZĞ¹×6ÚmÄÉºñ”•Ææ”©Ê¶G»`ıj$¼YRÊ&İ]¨°ò¼„®Oç÷zg=ñŠÊ‹Í]\ZF‹”3(f\0‚0cÆïN¼zĞöfÖäó!#c„-ó6“ƒÇÓÚ›zN¯&««Iw{7Ú\ZCœbÂ8Ú¨À}	ÉÍ};ÿ\0øı·¿á—<{2jÒ³x#Uqö´3#[ÜŠ%îÉwu$öòg‡ïÚƒä‰Dˆ…‹ÄO@À€0_ğâ´t­]­¶\rÂJÅ‚Hÿ\0!¦\'£§“ëÒ“WV5†¨ş„´nß^Ò¡½¶’)¡¸f‰Ğñ\"²‚¤{zÕæe~À<kóOş	aûm\\|<Õáøkâ¹¦“HºFÔ.¥\'ì¹M¾A=6ä&Ş˜İÏ­~’E(š%uå\\dÄ{V\\®%äöõëC>q’>^œô¤¯•Ê¶üŒ6î1Ïluç­DNM )Ë~o,9¦Ñ[G`ÒŠBp)<ÁLR3m¡#ÈúûPyãÒ£2;n4”\0Š§â\0Dº¼/üªåR×¿äsëä¿ğA1Vw<‰²ıh©^ŞMçäïëErtnL·WàôÂ3^¸W|âòü{\'‰¯BÆ*ÖÀ=NãŠ\\â£”6)€ıÔå!ª4^iÀã¥\0I’Û4gÍÆ•Z€\';*G#§5JA”ÿ\0´(<?˜ ^^-»JÇA?×úWæÇüßöá·ñÇ‰“Á\ZêÜh–¦)õ;¸g&9_lƒÈe×·L×Ñ_ğUÚ:o€Ÿ³D¿Ù÷3[jºıØÓ-ŞIô‘™ëÀ\\qÏ5øù}â™5»»–Œl7.\\’ä=zôÎO5¤;ÒêÆ­\0ÑÅ$¶²F$ÜÜü„À\\’Ü³‚2x®[S·Áï-İ~trÉ#1dlŸ(ÜX|Ç¦8ëO†é$ÅÄ¿ºSåBy,JrsÆ@ÍAw¬#Eq,Qm–êãİ	qÙ9Áä`ã>„b´ZIufXì ‚x×;åÇ?ëò ÏŞ»|Àü£šS•ïÅÄŞC*`Õ€Î:î\'=:’zSî#v6…	d,Ìë¸˜”]„´ûÀòyíÒ™×îRŞd‘wÈàŒœ\r¼(î:çê¹‘#¯lU\"¿ÚÒE,É–ÊÇ8|“´çn~÷>”û8ä]6V‹äŠÚ\rÓêwŒmSÔînAÉäÔzEÄ~Q¾cLÑ±Œ¡P~ñàŒc,IÕ= éòÇ0•wq´‚B†#\'¯ºsP\\Fß][Ë¬G›O&\rÀ¼\"rKgÖB¹\'§§JÕãµ‚tÜB°\rû½ıÃ˜àçrGc&ym0ŠBc$£Io7#±ç8ü1Sê3‰åÜ¸1\\Ä	 ¶AŸÒ‚ÆÜ¹ÒaFd\rk&ÿ\0/!r$ÚFáŠ³oz¶šÄxé°r2F{duÿ\0\ZËuŒEç±WÆÒ Ä/ÊFyã§¯¶iòêyq,“Jè°…“ûşnJ®xRFrzp½M\0lYêòëz\nG$#íjY¤(wd ÀE\0`ô¦O­Mcc6·al‘ba$\nşì à?Ùç¨<Xš<o\"*[³´³.\0\0yŒÌ\\g\'$qïsV4KÓl·	4²•ÂÆ«´a3Ä íßĞ\Zw/ø\\Z§‹­ä’ÙÅ€•VHü£!eÜ ®.O$ğÀıj¶™(Yã.Â7onûËŒ`çØ­1õHÍ¯ÏÇïƒ n#rò?\0j;ËeòáeP?t®Täúúš\0ìc×®[Äz}Å¼Ó£ÄÁüÅ»78î‘Æ9úùÿ\0åı Æÿ\0ÙËK7÷ßh×4!ö\r@Hÿ\0½bŒÊÃnôPß~/5É’Ko-„A9ùF[9şŸ}ÿ\0åı©à7Åû+if´íjæ++Ü¸XÈ•Ê$¬1ÎÂXçwC•2WC?eÍ-Cep. VïƒíS”t¬€(¤\r»¶)IÀéš«;\\»LÛšo—§5ıŞÔã+=@|‡½ŸÂ˜Ni1Š3VÀ\\g½5Î\r&ÓëM2níLuUÖX2çş¹?ş‚jË>½UÕí:àÓ\'ÿ\0ĞM\'+ãÍy6ïõ¿øí3Bw}(¬9‹æGAğyš]Fÿ\0v2¡:}H¯Bç×5çŸX.¥~9ÎÔç=y5ßî¡l@ğÙjZ4ån)€õm´ğr*:UnhôRn´\0õéU<AªÅ¢h÷RäÅm#ã°§cò÷¯™¿à¡ÿ\0´Ú|øQ¨Úyª\'Ö´Ûë{lÈW2ª(ÇÇ˜§¯¥>ÿ\0‚£~Õ©ûDüd60ùŸÙŞ{›(nÜ;¶×brIÉB{b¾\\·fIöçkg¨¨õ]nmKT»¹—/%ô­,²;½‰$I=I¥±™mdÌ˜m½zŞ:#)½t-Op\Z0‡B½OéQ¡ûb:Æ›/·¯Ÿn‚³ŞøÈÜŒõùqÉÏ½$—k]›yäœgß™kUbìBñcS»pR?Ç¹°Äcû§¶9çÚ§²Ö|Eı¤“Ki¨¨Ü’ÄÅ7İÎá‚AŠÃâL‡RAëı{ş•4J×dEæcî\")=0NGz6O\"õş´ú”¤ÌGÌÌ7(Çnà{vïÉ©F´d´…Wj¤g—sóÈ=1õ¨¬´=OP†EÎæq•Y1e@şœ÷¥]\né›ÒpĞ·!b\'<ò;\ZÏÚG¹²¥>¨EÔ–;äš5%WhÇ==F)º~¦ğióÆ!²Á‹Û£Ë¯œr}AöÅ@Úl–’•6Ó’ñ‘“zÚÒü56¡§Ü,eUåQ²(Îã.Óœœ~i¹¤®?g\'¢F0Š{…WÛ¸œ{ôıh7ò¼®ÀŸ6Î2@ÁÇOjô|¿Ôå1¿›0²¿2Ì+m wû½+~÷öOÔµê+{Ë$ßóÃ2*0>n½\r`ñ”Ö›G]«ò9¨b…Ùqä¾W!Âí¹89Áş]1\n$iûÈƒHÒo;eİ´…	·åÛ–ÉÉ·LŸÄ³ö· Í1{¸’\" ã ÏÕÍ^ør÷OÕü™á(Ãª’‹Àû¹#<g=OÒ¶hKáfN„ãñ\"•ÃìŒsò¿ßéZW_Ú:•K;@V2r\0é¾µNFYm›æß¸/i?w©\'§_×ÖŸhVÊÊI72Êª!;ä#–c®8ÎkC&˜ß´–ƒn\0ÎsW4Ûóhª»Š…\"\\ãÊ	üqùU?-â|<mvİĞƒÿ\0êıiÑ¹Çñc<çùş”ß‘:Ÿ²?ğLÏÛ ~Ğ?mí5©Ñ¼UáökmCTJ»—*óĞ¦Üû©¯¨üÒ§ŸÊ¿ÿ\0a/Š²ü1ı¡ô‡IXZj*lîU$Ûæn#8çæù\nı¼²ºöÙ^6¤A®yhÀ´gÇjF›\"™š(»µ€	É¢‚qLfæ\'JmÍ&áM6¶i¾e#74•ª95 »¬¦ÿ\0®Oÿ\0 š˜œT7L\r¼¿îäjf€ñÉD‘†zt¢¬Ë‰[,3“ÚŠç_àó–Ô/OO•?Mz	’¼óá×¨ßü¸Ê\'ó5èŒšµ°X˜t¥¦p:SÈ¦•¹§‘QÓ•‰4\0áÖŸº™E\09ÏËÁÁì}+óOş{¢İÍ6ƒ¨GÆŸ`²­ÆÖb‘K#§8è\0{ã«ô¥†áøƒ_ÁUô‹I¼«éWKØÇ%”ò?îc¹ÙúTŸ““ÁÜéLi+“báI a±ó\rßçúÓ/®Ô^·–Y¢É\0°ÚX}?Î®^èÒZJêê€†e.vò>•›ulVt:zv­Œa¸ã!¹¶|¤cv	ú{Õ«:ç[œ¢G$Ÿ˜…<}qT¢´38Ùü€sï_Nüø#kƒ­¯îÌ¹Ô-Ó,„ä\\ñé\\ØŒDiFìô0¸WZ\\¨ó/‡?³ï‹`·œ\\DË>à¦[…à³¶>AwŒf¾ŒøSûéz.É®á·ša×‘œ	æ½SÀ_F‘§ùl>sÆÑĞ‘·è:^‚–ğÏ’sÆM|ı|mIû·ĞúL>•-RÔòè>\0è¾|q;uf|²}:ô­Áğ;CØV-2Î/—[×\'­vĞé¢go,¨Ãr£UÁo#åDqãOï°?•q^W½ÎøÁ-‘â~\"ı“¼?«î‰tës$‡#ä`êAâ¥ğÿ\0ìáïA\ZCkÉÒîßÓƒõí6~¾òWvrWĞZĞOE‹f\0ÀÈÅj§+ZæsPOmO>Ò>i: Q…¬2ŒdóëZrxFÔ.ÓH„`³ù×Wq¦ˆFïP*‘ˆ«`ø¶+÷*3ºØäuï‡Vº­±à‚]Ã`ß+:ŒW™x»ör°»ñ×2XÀåeÈÜ\0Œ`ó^ö‰–Î9ì3Ö ŸNóWç\\ŒôÍ8·˜š‹İ\rüSıš†‡á±slö”™„íBGÍŸN½«Æüi¡OáMbãM¼F2[¾Cùx2($t¯Ğß‰_âÕ´›˜StbtÆòG+œŒñ_~ĞÚ¯öf·’RæØåFw2±“ê}8¯s.ÄÊräg‹™aiÆ<ñZcwqö‹®¬@]Ìx §ù¦ÛyÁÃnıi—6-— €Fî™î}óªèå8çÓ5í>õ74K¡j“Ù·Ù®¬Ü¸RA2\rÌç¡ÎİéÍ~âşÃß?átşÏzN¾¬û®2%wÃ\0ŒşUøSü°J>ÎpÍò’0N}+õßşçâ[[ösº´¸˜ìëï%!È&ò×\0ààúık*½Ä}}æcŞº£4µ +6i(¢€\ZÍÅ6Š(\0¤İC6\r2µŠ[€®Ù5Ëº\'÷Sü>™3m¿İ?Èÿ\0L÷Ğ!¸Œı¡ø?xÑDì|÷çøj+\06>\'•ªßw;öä× nÇzó¿ƒÒ³ëÛ»ªÿ\03^‡˜qV¶¸å~y5 ËrJˆz\n)`9xj‚7ÙÚ¥ICë@nš`æ€q@gâ·¶£ë³‡ˆßWH¦‚ÖÛÍòØ/˜ì®¥v3d+dzô¯h-Å|£ÿ\0_ñä~ı›µhEßÙæšHÕ6<ìH:PRi‘,ŸûGÄz”‰¤BOİí\0mÎpgñÅco¶’w äüÅ€}M[Õ5=‚VãtÌ²±S÷_Î²­ïR9°UŒ|‚§¡Ò¢íb\rÊmJ%vÌjWsüÿ\0Jû‹àF!ğ¦‡…Oœ±\\ã2ª•qï¸WÅ\r4ÕÕ<]ek\"gÏ•FâxPs“úWè7Â.-CµhÕ	hãï®kÄÍ›ID÷òho3Ñt{±É½¾bA<úœõêåÌ\'°‹<g5Zƒ…ä=*uu‘_=z`Õá3İí*¯Ê€v{ëïZV\'nyá‡åYñ•ó@õâ´ µ c®zRÔ/­®Z·Ùº™ö•9<{\Z‰ãhúâ‘Ãc¿åZ	¨²Áº2ùš¡©ƒúÒåİÉÏÇ©¨®È¼\rŞÙ©aÕœƒÃ\0{|µ#O+ VaÈêJ§$6\\qÇ5<r#pãÔšÊ74vw™nşµùõûSxëHøÁ¯]YÄ.-î<‚23ÜÄåAÏaù×è,÷*N8Æ9æ¾ı¶tKÿ\0ü[¾Ô`wk]EXØ¬ªìÜtÁükÕË¤•K3ÍÌbİ-:‘¹IÀ›Û$Âû\n… Ü7`ôÀ<Ôhß>àF“ş5$¿˜¿&JƒŒtÇ§S_LôĞù2m6Õ®%\0â¡ä`£23ï_ªßğK[ù¤ğºÙË{uk`†ŞÒŞX­®ŠÆM#°Ã¹ìsLç5ùH&òQ27mè½Àç§·ZıTÿ\0‚Xx|\'ûf“·E¸ğõÜV\Z½Š…‘u1å†KØƒœŒ˜°	æ°¨µ¹i¦}Â€F€z¾´ æ¡·“Í·FõPyëøÓóŠD½Å\'šMÔRg	Å#79È¦ĞœÓZP‚—8¨e}Ç\0VŠVB»×?/¨¥“|géF=…dcje+¡G¨6ÛùñÓÌl~tTz£2êw\0+JÃ uäÑX¹ğ’&]nópÀò”|\Zô$}şµçÿ\0	ï…Ö·v;,?–MwÑ6ÜÕ­†÷$üèüé¾hõı(ßô¦!ß\np{ÑŸqF}Å\0=fæŸæàıjûŠ	Ïq@	ë_ÿ\0ÁktYOìóaylHµ%óAÿ\0k…ıkí5ny<WÊ?ğY8’ØËWù¾d¹¶uòVU9àöëLÇ}DùQmfÜ~QŸÂ¨[\'Ç§wÖqwæF£hÏsëUËù\\z×EØ÷Á\0ÒxûJ†?˜Ü¸ŒñÛ­~„xıD·L7î¢P£</>µñì7á9|KñNkß#}¾ß#„b=+ëŸˆ_ôß„Ş7dË8+`–o—¾:t¯Ì¯*¼§ÑåMF1è—^ ‡Mƒ|î#Q’FOëP[x’-E·Ç:mng$×Æ6ı£µ¯Ü´³ùºlA±¸sæÈvƒœœõççÚ³í¼#ñsã@Xôû;íKA€«x-ÙñÏÌKaÏ°ãÚ±†¬ÙÕ,kû(û…~!év÷±CöøòŒAïùWK¦x’	ÎCy™^«Ú¿>®ÿ\0bÏˆ>¶7H—SÜ2–uy”¶2>ëïZÿ\0Ä<*bÕmşÈå^ÚY,¸ÈÚNvàö#¥kR…(«©\\ÎJ’~ôOĞkˆ/¾n£¡ÁéROl.{Æ¼‡á7îZÎ8æ{‰1Êò|ÀçO_Ê½5u_´Â’3Æ®UËc¥¦·5ÒIéŞ¨Ë$*äÏP=k‡ø«ñwş]:MIwq±¼˜„›<Ç!s‚98üëæŒ´ÿ\0µ6+mOhf™L…íC¹€GŞã,p:v5p¡w¹2›Šº>¹½Ôà‘Ø,­”ê\n¿•F·êĞî,1Ğ“œ\nø\n†Ÿõ©íç:—ˆ¼ÙœÍ.ofCGÃsŸOnµ¯¿âŸÃ‹·2ëºĞWE\Z‹É$J?º¡yÔÖ’Á§ğÉë$õ‰öíÕÖÜàdc·zó?ÿ\0l~6xQtùØÇs	mçCµ¢~~\\ÿ\0pç¦Zğÿ\0şÙŞ*ğeÂÿ\0lé‹«Xgdl\n©ş/âÏ§c^éğÿ\0ã&“ñ9#“L[ò®»ˆ’ÒP€Š\0z×=L<èÉLë\"X¸3ó÷\\Òn¼9¨Ía{…ÚG‹\0‚+aÇ¸ªˆÛ3óx&½£öÙğu—†~*ıª5t]B<‚8–;»g¦+Ä‹ùò••ôØzœôÔûŸ-^—$Ú,Ùµ2ƒÎsÔvÅ~ÿ\0Áæ…åø‰n%Y3(q\'şCğ¯Íäœ¶Bğ@Ïú™ÿ\0Uø#ÿ\0wÂİGÅs¤‘j:õÉ„êPÛ$hÑåBr\n¹œÚŸuªí¥¦«qJN+0ÔZcõ¥fâ›œĞ ¦Jÿ\0)¦³mnOZc>OZ`(“şªoçF}Å÷¢€÷…ñßô©”l€ò]DgPŸŸùhßÎŠf­nÿ\0Ú—8-5±Ï¹¢°Wá\ZüAy·¼#?zyÿ\0Â¡·^¹íû1]ú¶êµ°=Å¥_¼>´”S`séFyíPäŠUm­š\0›Â°N¢‘pïC¦ÿ\0_Ê€×°¯#ı¸>Ëñ¯ölñ^‰kl·ZŒúeÇØ©9ŸaÙŒwÈ¯[½Sñ¹má­îşíŠ[ÙÄÓÈŞŠ£&µ*1¹üçkzTºV¯qg*§´‘á™Uu;X~\ZÍl3rÇC_B~ß\Zƒ®|k×¼Oá{këM;YÔ&Xç\0¯˜Ç,é×›sc=øÇJùúî	]’W÷²\0ªw&®hNPfÕ(NŒÔ*+h~Ã?ÛÂß\nÚõãıö±7Ú‰Ç!6 UçêÇñ®ïÆ	n~&kª÷j°Z[¶R1É”ôÉãÛõ®›áŸ‡#ğç‚t›ùVÎÖ4#Ü\"ŠÜÔµ¨ô;C!Ï\nz\nùjÕ[¨æÙõ8zj4Ôbq¾\Zø\ráÏ^Ë2Îâü/Êå²ÿ\0*ê—âO…¼2¥Î±¥iˆ8!®\0`İf¾gøëñSÇüGı¢Zµ–)R÷;±ğ	<şşuÊü]ı“-|A£ØİøBçQÕï&‹Ë¼KéQgiÕ‹ïç	·`…?‡Ztè9»Ô†µjÊœ}Ø]ŸbÅñßÃÚåÚÅ§ëúeïğIÇ=N1Zw\Zu½iöˆ£<ïœúÿ\0Ÿzù+àìq­Yü@·Ö|{¡%İ„He··¼G’fxY#ó0ÄÆ+ß~èZ—‚üa¢Øj‰áËÖö«3Ç3Y“ÈË«¦Iå—=Hâ¢½Ãà•ËÃIÎ>ôltÚN’±^)P[…\0`]¾`ÒÙy‡syc#«˜X~ÊÇ¯Á+¯Òõ?ø“Ê»s;Ö0“‰µJi£Ï¼}¡&»¨y’ª¿–:HNã·áúV~‹ğòÇM³Y<¨¡/”`şz×C«ÈfÔH+“ÔÕÌüfÔ\r¿i£Å~l XÄ·7‰	‘àRFRì@©\0Vq“›ÔÒ	%±Óh\Z¾—©ioÈ™”g·zĞ×ôí;_´O´Ai{¶C²©>Ş8¯†¿i†:‡‡>!½æ•}¬ëºiŠefbˆÙÊ°*\0u Gzèe\ZÏ¼+¨ë×:î·¡[évì4û˜¤@%¸.ì2…rÈ İ2z\Zô£‚²º’ûÏ6¦*ó²†‡Ñº÷ìı¡êáŠ[Át;Sù\0qV¼à4ğ×•o\ZFŠ¤)D\0ã‚¼cá/í_â=7ÆÃş-Šö€¾ÛËHğz‚9¨¯£4íj-ZäCÃ€ÀãÔVœ¾2šº¼QòÇügÂN§ÃúÈdb[Y€uR„ŸÄÂ¾^ŒíÏrzc¯Ò¿C?i¿	Eãß„ºÅœ»ˆH\ZhöœÉóå_Ÿ:u´ïª­ŒQ<—(Œ Ág9Çç^æ]8û;v<Â›SO¸û`-ÈÜq¹€8=³ú:ıºÿ\0‚mx>ëÁ¿²_…moQ¯iÌd.ÂRH‘×#Ÿ˜Œ×æ7€?fmK³µG¨Üj>jLğXÉ&<äåÊNÑÛÔWì¿Ã>ËMğN“œ–1YÂ¶êÿ\0xF#A÷Æ+xb!QÚ\'6\'R„bê-ÍÚ\\“IšBG­tòèr\nx¦;àõ¦ÈNs”ÆmÇ½\n=ÀN´mö£ó¦³mÓZ\0ì{\nMÃıŸÎ™ç{~´Ê4Wl/¨üÁŞ’‘—q¨•¯¨c¬\\Õ®†:Lãõ4U}lí›¾?å³ÿ\0èFŠç_ál¼Asƒÿ\0,¨®ó8¯6øB?ŞmfæĞr+Ò7QV¶)®¢î§+qLÎii’IE3q§‘@DûW¯éNóG¯éQQ@†Ïq^mûWê¿`ø#­&yº‰`Æ~ğf\0Ê½!xAÓ¥y‡íg£Í¬|\'¹òT°Ğ¸Q“´°ş\'øNÇV	E×‚–×?;ÿ\0i¯OáeüpGæ-®A1®mûÙÏÁú×ÅÓäÇZu­Ò•uº8oc_£:ŞŒ5yã¶”G$s[˜d†w`m9ç­|qñ«áÁø_û@iãÎ²¸^)<½œä‚¶áİy™ekEÒgÔçX^w\Zİ·t@%µŒâ\0gÖµÿ\0±æ2oS× U:ÜÙ²)2~õÒiğïˆtÁÇæMj][cÔşÙİÊdX•$öQÍş\nXH<¶1£¥wñÙ†?0÷*Ù§÷ûâ’ĞéçîyíÇ…\Zâ|•ƒÁÏ5³¥Y¶—ÔÊà`cµtwVé8!cÀñÖ³®“Ëãë7vZ(Åh<¿›{ŠÙÑÓ6¸Ş¹û­Q\ZìG$(ù½ëfÂïìÖ¼Œ–è}*yYf6±jF§\'\\ãËš|ÒÉwc \'t®0ÄòÄœşU‰®Z)Ä‡*œûUïˆïÌ9õíB‹Nàr²Á~’²É½Õ‰\'qÎzŠ	A|©ç@]BœØO¥wçLŒKŠTöÅK6™D6ª‚JÛ˜É»\r¿Ã[K›…†Ú¹\0éÍoØh‘éí…v(ì+y,<•íùS\'Q2piy‘)$?Ç:Cj~¿…?Ö<D®ˆqøã|iğÇBºÑ?jü˜âO³_¬RÆc%U$p§A’+íÏÎ­cp\0ÏÈxòÏÁı9µïÚŸSÛ#7\rsrIÈò£t%~¬pĞ×£†“9Xóç:‘õ=ÂßÃ&é\'“o˜Í1C\'sÓô•~xx,\Z%ª”,H\0ôE|+ğ»Á÷3ñ<Z\\÷“\\³n ã\0sÇÓ5÷„y0*Â€+§,ƒm³!šjœz’ù€÷¤wãƒMÆ;\n7è¿{gÌ†ïz3î(Ç°¤\'”\0¹÷ÙÈiwö:äÎF?J:\\ÑIœSD˜÷©¶·Ùæ‚qM-“šBsS>ày~¹m^×wïşÑ¢®k0gWºùOúçÿ\0Ğ©[á\Z“â;–õ‡úŠôZó¿„-\"ø–è66}ŸŒö…z%ZØO`ƒÖ¤Iº\nˆÔˆW9¦fK@84€æ–€&QÓ•¨Ù5KÄ:%ÑnlnWÌ‚ê&‰—8È#×µ\\\ršeN:ÑÒİÇÓº>ø­àé~üC½´}Û­fùw\r¡£8eaõ\\~µó/í½á‹xåƒSwòŞÎò	¢fÂ‘˜ç?…~“~Ö_â?…Æ¡amCNWw]ØóbÆX¼Lú×Àôañ#Á7ZÜ‰ÉŒI\rÆÌŸ—æQÓxäWÎÕ£*ıİµÃâã‰ÂYîi¶¹[E&ìùƒwçÍmX]”TÀü4×·şø~øñö­>HÁNÑ»õÍu–’™|²¬N<ÖU’R1ÃŞ×:xîL«úTğ9Æ3Y¶×<àv«°Ü¢Œ¶\nÈì4×*xô?Zåüw|Ú,#b–yNÄ¹5Ù¤Èyñõ5ÇxÚåañeªIÂ˜\\¯¹Êæ¥­4TmØÅğ¾”èŞmÎK‚®ãAğ»k0†5	Ë:Wüsı¦|%ğA­m5@Û_]âHaKw•™y;GƒŞº|^·Õ4h®ìçK¨n#•;v‘ïÎqI&—¼t-]‘ÒëšRyr!Û\'QëXŞIt»Ï±¾ÿ\0.BYY»{f¼ïâ\'íyá_†^&ŠÏ[ÔÙ¥=VÙäôåŠğ5é~#³¾Ñ¢»·e€í–)S€şãó5|¤ÎVG^–»‡JI ufÊà\\BŒ:ı*¾£.ØÖ•‘ÍÎÛ³)Ë9<ôæ³ç¾ÆTôúÔ·×=HãV\\Òã;¹ç½1Ô*k2§“#áR*ğoÙ/C3üFñŸ‰f\r™®æ³…6ãhİ–9üò¯oÖåX´«§Bç™ÚkË>\nÙ^êfk[8Ê½Ôœªàff/·\n}Éş/å]wq§hõ9©[ÚŞ[#ë_Ø‹ÁR^ëwºÔË¸[#[¡+ÒGÁ$÷xüké¼‘ßô®3àŸÃÅø]àKm7!®˜™îz4×ß P>†ºíçÔ×¹‚¤éÓQgÍcñÚ³™6s×&£ó½¿Znóêi+´ã³ÜíúÓ]·\ZBqI¸Ri	À£p¦“FÀ+šJ(<\nMö\0¢˜%ÜøíD¯ïY»½Àà5‰öµ×?òÙÿ\0™¢Ÿ«¦uk?å³ÿ\03EefjPøI6ÿ\0]tâ~¢½}yÇÂ?—Ä×ŸõÇúŠôUmÕKa=‡‡É¥Îi”ƒLÌ|¾´õ›™N\"€%iÁ³PR†+@ƒƒK¾¡ûFÕéúÓÖLĞ!ù×ÓïÇùükäÿ\0³6±câ½NãKĞ$¿Óî\\É–¢=Êªl$‚O·Jú¾‘†áş5J*jÌëÃbêPwùÙàoj~ğü\Z.³a6™}¥î·kyq•]Ç`‘½ë£ÓÜ+ü¾Õí¿¶ŸƒÈ:>µQ,hd·ºe\\3g	 sóÖ¼6Ê_-kÅÅÒpsYÎ<ìİ·}¯Ÿ^õn°ëÆEeÃwŸ ÷¥kÒ²ä•FIÍp=Ï^*êçQa©o…Ü¶P¾µÊü@ĞÏ‰`E˜Ã<J•şGØ÷«ÚB~+?û~mJVŞóòçÓëCer¥©ÌGàq<³hØéw²J™¤¶óqŒ`¶OoÔÖõ¿Â;3oæ[Ï5˜`	OJÛ6R wglUËO+«$7–¯ác‚1éM>ŒÓßèsŞ\"ğ>Ÿ†ÚM:ÃRH¾m·,Š[H#ÿ\0\Z‹Fğ”¢âòììlâ9Xm××ŒtŸJ×Õµx.‹n¿¶2zg\0ûXµİjÊOğ’rñ¥;½­.Î×M½6ÖYöË›­Äg§©®[Iñ<†ñ-¦ù]»çƒZÓŞoà*µ[œÍ\\šô‚G|÷‘+ml¶vÕ‰/ÃßNI|Ä=OÖª;‘Q«XËñDm{áûÈÖ?4ÉUP@ÜOõ¯@ıÿ\0gK¥h·ú¶Ú=¼©~®îóáÂí {úb©üğ­¿ş)iz}Ìmf¸¸Lœ0ŒnP}‹WØ–péöQAo\ZCJ#Q€€vía()Ú]Åâç	rAîYQ´u4¹¦ù”…ò+ØécÉº›æûSKA8 È¤¦ùƒÖ‘›\'ïb€EDÍ÷³Oi\"÷$sI«€4¡M5æÊñô¨ÉÉ¢’ˆh&ŠGo—@qZ³ãU¹ÿ\0®­üÍ>£l²j·¬ŒZ+Sá/$»÷‡ÌW¡gç?æßâ;¯h¨¯EŞ*VÂ{ºœ­Å3u(ni™’Qšnò)CPÕ©ÕlSƒæ€GZh~y¥Ü(H¤Ær~õ(9[u8gŞ€9/ü,Ö­#Íœ[4Ğ¨<™æQø‘_E!Bmu;YHèGWŞm’§Üb¾Cı¨>7ÃŸKzƒ\Zv±+ÏÛ…CË¦~§#ÛÖ¸1ôïeĞõ2ê¼²å}NYn†Áş×\r,¤‘õ¬¿íPLg¥K©/\\şµóİO©¤îK¨ß•UF+ä‰ö®{ÄßáğäMm•æpOD§5­z<ÈÃ&q·çÁ¬M_ÃöWv«$–VóHvé\"ˆ÷È¤šgT\"›Ôåtÿ\0ˆĞx–ŞGûKŞÜç\"”cŒt­H¼mo<æÊı¶’ GmÊ@Ö¾™¬­Šš(D+ÀM™ØZ2x»G‰B¼Ãó˜üÅh¬w/f•š9x¼B5+iz]ì‘qµví#=zµgŞøÎoß§’òÚ¬œ§BO^Wõ¯A‡Æz|Öám\r»ñ’O\'ğâ³îKëH!3uP¼}ıt]Uå¶„ÚO‰·áŠO/Ë”àîÛÁ®¢ŞrÑä’=;ÖZiêéİ<²Q—ÛéW¨ÃŒûÖ|Èóš-Hû—=³QO&G\rÇ¥Q}P3pWóª×:¶ÅÀ‹|ª%˜ğ\0ú’mO]:îÇ¿~ÅmCYÕš=ÛJZÂùèÁYŸôe…}ƒj×ğ/À#á·ÃË;•s\"‰îAÇúÖUİÓÜ\Zì7WÕaiªpHù,Dùª6M#ìÏ?Ú™œÒfº.Iæê)²)›¨Ş(´Roo\0Š7\nilÒP÷\n7\ne&á@fæ“9¤Ü)ğhép0o#İw/ïŸçEM2+pİM‰©Ç|%ˆ/Häù#ùŠô%pÃ­yŸÁÖ\'Ä·™=aÇ×‘^‘·éùT­…\"ZÅDKÅ=[+Í32O0ıiÀäTY¥É%(b´Ån)AÍ\0HE-Gš7P”¡ÈïQn§â€æZò¯ÛD‡Uø+;Â\ZM=…Ò6Ü•ÆAúšõ=Â¹oz`Ö¾øßƒæi·\0ëå±¨©”SLÖ“jhø&×Uİ.õÏ9©Òoô A%zZæõÓ%¦àG#Ÿ~•_Añ²ÜK²Vhİz‚+åå}²¡+hz]¢	\"İ×Ò–X3´œõö¬ÍVóaÛ¾Õ»aó¯<ık›S±=J’iqH¿ê=rFj¼¿bÔX´¶ñŸ¨ë]-’ S¸/^x«ÌåG–ê­ÜWs’·ğT:4Ÿ¹·Q×Š¿Ÿå b˜5±Ó4øqÁëN¸…\0ÎsÏö›–æt1ÿ\0£²lUh‹hzõÇáWo¯RØîÈùyé\\ŠüY±¾÷ç*mµj„±8ë‘W>jRñ¦›<›L÷‘Œ8œuöæ¼ÖûÅ²ë—ßf„ŸÄÀsjëü>Ïar&wÅ´‚<¥vQ²g*:3ôz#…çŠ™PÛN³Û£Œ ñOÜ+ëcª¹ñQì?Ì¦“šMÂš[š¢õEGºÔ’Šu¨Şe8ŠŒĞÙ°i”g4€æ€Š	Å&áKÈLJO={ÑMtËO_Z+SÍşø¨®Èïşb½6ßØW›ü\"|ø†ìzC×ñè™\"¥l\'±6yè?:B™=ÿ\0:[kfç{~´ÌÇ§îCOnn†¡ó½¿ZU—stıh}ÀÒ«â¢üé^	…\0XÜ}(ŞsQy§ÔÓ‘÷M\0I¸Qº™š(û…T×­şÛ£]E‚Şl.„ªGõ«¤vùHõëLqÑ¦~jjğ™\"wm zWâİ\Z_¾ËƒÔu¯PÕm>Í©\\ÂÃ˜¦’2=0Æ±õmgˆá3šøú“å“Gİa¢œ;ÁäÑo-Ev&à˜b\0éÍz¾ãk]NİL3ÆêàÃ<ó^Câ_¤ŠNŞ€ãå¬+-OSğ„¹·C1°ôÿ\0ëTÆI«£¢ÇÒjÂE)÷{\r>ÓÄxqO—Ÿ½Ô×‚Z|{ºÓÿ\0×C\"¿F%ø?Yÿ\0†·»ì1wÆjì=ĞëffëÉçƒDúø†Üîº{W„ÉûG[4˜;±~™óªÚ‡ÇY/ÁK+k†fé¸ği=Ç¦xÓâ,\ZU“nš\"Ì}+Í/u{ß]m]ñÃ»wÊ>ıgÛi×¾\"¼In¤f\\œ¯$×iáı+D@£{â•ì.xcD[XÀÙ´ø®ÇMµ\"¹©>ãÖ³4»óÒ¶†%üªTîMX¦µ>êøSâñ\'Ãİ\"ìù–P—À?+lt;Æ~5ù‡ñƒâÿ\0ÆŸ‡öĞê_<]pš]„cÎĞŒQÎÌGÆğ@åIãu­/Ù3şC¬İxêÛÃ¿´Øcâd³}A-›MrÊ»ç‹\0Ærçø}ó_[†­A%¹ğ¸œ<éMİh~•îÖ·UK]Rûhæ·™.`™CE,l$g ©|Ş+°ãæìI¼ŠU|š‹Í¥Ph¶$/Í‰¨„¹£Í>ô—q›ê?4ûÑæûP»‰¤-GæŸzF‘ˆëúP¥‰”ØÛåå¿Jvh|Ìÿ\0	ü¨¦ª6Ñó”V&§•|”·‰/8ãÈş¢½uy¿Á¼¯ˆï2ÜyÇâ+Ò3š•°ÃÕ³KQƒƒK¾™˜úÅ3ÌÅoµ\0I¼úš7ŸSLdÓ‡4\0ä|7&ŸæÜ~U(\'(”ÿ\0¥à¨Ïj«y}Ÿi,óË0À¥äw`ª€u$“À¯…¿nÏø+Şğéî<1ğÑìõg\n’êûØÛZ’U\0Æ÷À†ÀÉôªJû•f}uñ»ö‘ğ‡ìÿ\0¢›ßj±Ø,¼P*—ã0Š;ä¸õğŸÆ¿ø*/Œ¿i¯OàÏ…8ğÖ‹N±¬O›ÁlFĞ\"å•]ƒ209¯Ï¿\Z|ZÖ|s«=æ«ªßj·“i.n§2I+1É9Éã9àzšúsöAğÔ\Z_ÁÛmMyú¼³M+ãæ;%uAøP+ŸWØQæ]NÜWª¢úÙ¥Èc³Â\0»ÎXñÔšÓx<ÕÊş•ÎxjëÌ<ãƒ{WOÚ1Æ=kãªË™Üû8G–*&»¢faó(9=+’½ÓÄH9ãé^™¦¨³Búõ®[XÒJ?<ñÇZ\"œQ¢8´ğ¼7Œw Ú¯Z|%Ó®mÇîùa\rk=¯–q´çúÖÏ†.„wh¥¶`úu­T´(ã ø#a¥¾ûkpÄ’X³jì>·ÓâÏ”¡‰ÆÑÈ¯LÔ‘$·Üvæ¹©íÄ÷ƒ ¤Ù,Ä°±6v’3Ÿ¥niÖÛœ|¼T0ÛÈòˆpö­­.È¶~föíRI{N¶ØœÔ÷ÉäÛîÀàúV…­°Š\0O\'ÔÖ~»(U>™§r¦¼ Ü¶I9ãë^YûY|ƒÆ¾“Ä–¬zîOæƒ<J2ÈŞ¼cøúW¤Z÷Ù­ˆ7ğèŸ\nõëÛ²¾M®›;}|¦\0®Jº8‰ª‘p9ñá85#ä¿ƒ_¶¾Ù$>ñ6£§Ú¨ ÀoİŒ•gÛµ}ÙûÁ\\tÏˆfÇÃŸ¥ƒMñÌËmm¨[@EæTm-Îcrx?.Ş{\nüŸÍær3\rhéú—ÙnÃ|²!Q½sòF\n‘_p|?)ıÅz—P¬‘É½CSAcÚ¦•²¿~*şËßğQOşÍ(,´ıB={D\0ÓuYd+l7V#¸`sÇ÷7À¿ø,?€ş ÛÆ¾(·¸ğ¥Æ¼˜{«eÇûj¼g¾”¹r³ì$|7^)şhõı+ŸğGÄ}âN¡ êÚ~­g*‚³Z\\,ÈruÆ¶Ç4Ó¸¶%óG¯éGŸÏõÅEŠ3Í\0N­¸qü©’I‘Á¦+í©(ÑäµK¸¯J‰äƒõ§ù€uæ¢{\0èíÁAÏj*D\\ ëÒŠƒSÉ~¶|Iwïõé\nÛkÌ¾3İn9>FOıô+ÒÁÈ©[\nCüÊ<ÊmÌÇy”É¦Ñš\0’ŒÔ{«/Æ^8Ò¾ø~}SZÔm4Í>İK¼÷3,H¸õb2x<wªQl\r7–ÅyŸí#û[x3ö`ğmî©âRİîmai\"Ó¡™\rÕÓ€ˆ„ƒÉãœw¯†m/ø,N£âh/4†‹.‡`,šıÒ¡à`–X¡*p3üDçƒÅ|\râİx“Rû^¡qusq1i™ç¼—RLŒ:/®«öl¢ÿ\0l?ø*išÚËS»ğg…÷Nµœ5ÅÂæ¸ÁŒü¹#Ÿjùjï\\÷ÈîÄ´ò·ÎÃØrÔVUíËË1%ÉÜÄõ§F>Aô«ŒBUWAÆbö¯¯¿a?ü3»ÒÃI¢Ë¹T·;%fnÇÆ¾<.Pÿ\0?jïÿ\0f_‹oğ—â¥ó,ge·¼ä©fáŒ×a‡uiYt;2Ü_²¯Ìözré¬Öº¤‘v\'9ØZÍˆ½rú„a.c¹ÖHäPDˆAVÈìG}+sN¹ó\"Ç^=kâe¾§Ü#nŞe™1TµK$º\\?*‚ŞFI©§fù~`x9QmŒÊ“EXÜqæ¸Æ)n|1ºİÊ!n€ÿ\0Nõbñß>áZix’Ã‡g j¤0-¬¯âO.G,¾¹<\n¶4Ö7/ÎOzÒxbp;‚İh–é-ãã=ª…rµ• ¿Ë1ëZšrßåà•›\rÏÚ¥ãôïZª|¨³Ç° ‹—ZàCjrs\\æ±zdr3ïVïn^lªœ\nÌ?=é;ÛB/¨ßYù÷¿ÍÏæ?ğP‰kà¿„–z%³ÿ\0¤ë²Ÿ1AùŒwBH¯aÑR-Â{¹ÜEº4²;P3“_şÔß¿áp|^Ô/ÑŸìËö{4c‘&ÕşŒş5ß”áJÜÏdy¹®%S¥Ê·g€dÜÊ¬ÅGE©­ÔFœ°œp[?Aæù±IÀÇzn\nn!†6ŸZúö»,ßby±;2v+9ÙÔ¨ëøôÅO¤kMÿ\0/˜‹ †Ç¯STQ|×ûØ9$œöüx©ÕFô9Şr¤œ/Ë¡¨åÙêÿ\0ÿ\0j_şÏ^!´¼ğÖ¹{eåNÍ=°æÒğvHÎW×ç#¯jı3ı’ÿ\0àª^	øùg›¯Lñ$Q =BtKk‡<„Œ‚pyï{Wä,WİY<Š[ÌÉqùPpG¯£¨â¬häÏŒñägHäŸáúş•.ëb¬Bzv©±d.-n!¸…ãpÊš²z×á—ÁßÚ{Å¿µ˜nü7¬ê:ZÛçtyYb`À•¿•}½û0ÿ\0Á`ìüC$\Zo­VÙfãûZÑ¿wØócÂíA<â…5ÔV»üÊzŒšËğßŠ4ïi1_éW¶ºŒëº+‹yVH¥r¬¼\ZĞSëÒ¯ru$oåIBà};æÎqëëJK¸ìÉT£æ=(¤É^=8ëEdhy\'ÁåÇ‰ï?ëßÿ\0fé\"b£µyŸÂ Ñø®ç²´?Ÿ\"½*¥lC}ùçÚ<ûS)c=N=Q$yö®âWÅàÿ\0…¥Ö<I©[éZ|\'iA “Ğ\0$×È¿··ü£Mø{/†<ı›â?Æ\0»¼2î´ÒóÉRÃåy1·€ÜnäWæ_Åï ø×âY5ë×úõÌ¤2‰ç³Gè¨ŒH\0gµh©Ü–ì~‰||ÿ\0‚ßhÖVÓ§Ãİ6kÅJKR·òâ\r»-7îlFGqšøKöŠı´¼kûHkFãÄÚ³½ª1kkhaDTÎ9Æ>µä:ˆ^òmÌD¤/?,~ÀVl×ìI$–õ5ª‰ç4eñdÂİ¥ÎY¿3Uâ|C,œä¹õ5J Z@~µnå¶Ãü<z¢[m•VLËÍJ“øçò¨cûù©üôÖ¢&oœ1¸?J„Â~ğè½iÛ‚¶IëÚ™,¸íòôĞÆµgÔ±ÿ\0í7ÚM—ƒµÉˆ‹ı‚á”ñ’[cÛ%ˆã½}O£Áè_c_–q\\5Îänœ‚8¯©¿e/Ûb-môÜ¢ˆµvi¦ºäuæ¾s2Ë]İZKä}>]™İ{*¯æ}lĞôÇÒ§€f,7ÍÛÔí\Zâ×]Ó£»²¹†îÚe’ÂáÕç¨ş¼Óš=>½=+ÀäåvgĞ©¦®ŒûûA+9>õI­dN›‡µmŞÀLfÉê(Ğ.U\r,rœR´r\\I×µR°8<zZÇ2x Eı&ØC;\n¹+—üi4ûfH²i\r´—WXŒÓJær’½ˆ±n1V4ıî.W<–àÜÖ—öri¶í,Åc‰9i$!~¤ğ?\Zù‹ö¤ı»m4k+­ÁÓA<íˆç¿Ga°†!–1Ç ù³]Xz«.Trbq0¤µ)şÜÿ\0´ÜPYÉà½ådYn©*§İ`ØƒìTæ¾M€}óœÔW7òjRI4¯$’»YÛq9ç$i‡t²un·½}^\ZP²>W]Õ›obÄlşnHçªÜÅTãƒÀ UboaÇ¥8r ár?İé]IXç$¨ÙiÆ3S\"¡ü¯Êüãå?&29÷çò¦Á–gY¥xS€·ÍƒÁïı)6³Ÿa”t8æ6Ï5p[—4è¼Ë%QÎÒHü…‰üšŸMÜ³ò@v#NŞ@,qÏìæ£´„İXÈøfL\0Ç—§¡õ?¥Iöém¼¡€ÏÈç¶3øHÔ½a4Î2‹‘§<İ1øôç¯½kZ]MªËh„W)jnŠ›Â„+•g“ÈÁ=ëK” f,¬èÂFŒ¦U—1®sş5sÍû.™‘9$E9 \0àãÛõ¤Òhhõßµ‹~êm^šÇí2–%Ex^B2.03Æq­}éû(ÿ\0ÁX4ˆzJYxé¿±u”Ú’]Ç6w-–ÈÉCŒp@ï_—öæj6É4ƒlğ›÷\"\nç98İò^µmf{¹L&]Ê»e(Ç<ÎÒ8#åç<t¬nÖ¥èÏß\r_´ñˆ¹²¸æ$,‘Ÿ”â¯G/”ÙúWâÏÁÚãÅß¥ótÍUì.ì,ÚVkIÔ™9h”ã9ÇÌ•úAû!şß~ı¤´ña~ÖšŠ¢*§½ÆõºÈ?4N@\r÷[å#ĞçufK‹>Š{….ryÏ84Q’#—œpÑSÌIãŸ/Ì¾.6ínßÌW§äšòoƒÑ\"øÖfB@0‘ÏnV°ÿ\0k_ÛÃÂ_²˜ñj2½îºcWÂË\0ÙÃ9Îàù5Q2±“g´x‡Ä¶Òf¿Õ/-¬l­¼³O(GRI5ùËÿ\0ÿ\0‚¶kÛŞø\'á}õí›	írLİE·-È$¨$ó !†ÑÉ#å¿Ú÷ş\nãOÚ{W+ª\\Çc¤&õ†ÒŞ=W9À’{rÇ5óÍÖ fİ†1«œõ~Ü‘]Q‚JÂ¿sGS×[ÙL²™šC½†íÉ»¹\'»tíY’L÷+ó>UFoÓµV\rÏ?…;±Ö®Æm½IvôÅ7vÍ1şZj¯ôìÅÔ³§!oŞºƒëÛô§Nÿ\0»>ãõ¥_ôk$Oâo˜şdJlËşŒZ•™Dj@ûj;@5\"©eİ@+ù”ªsÇğ÷¦1ÂÓwn –=¬xÈÎAôöªÒÈeaÆ;Õ0…Í+[ùÃÃ&‘j]ÏDø%ûVx¯àÎ¡Øµ¥°/™låmñ¸Æ;ƒ;Šú¯áŸü3Â^6Ã«Û\\h—¸Uy|Á$Ç¤‚?\Zø\"â³œzÔEXè¼ŒW#/£WVµ;°ÙjZ\'¡úßáÏè>1µišÆ‘z‡şyİFOâ¹È§ßé. ‡ÔmÉÍ~MéŞ »ÒT´3¼~ëÖºö„ñg‡¤O²k7qí\0×—S$¿Ã#×§¦­4~™_é&Kt;~n=r*æ¢1##óùÍ§şÙìĞˆüCpàƒ\ZŸı–¨ë´÷|B».õÛ§ByUÂƒùYaÏ¹o:¥m?MµIğåƒÉ¨êV(ƒ%§¸TÇækÉ~!şİşøpd[#/ˆ.ÆälÊ±+å²N>‚¿=ï|a{¨I¾k™d~ÅU3És¼–İëšê¥“F.ów8jæÓ—À¬{_ÇÛcÅŸ®ÛíÒiº[`[wÚ‡äoÆ¼vk¯8î\'œç\'’MTIµcÈy#İ°/Ç·µzĞ¡/póªÕ•MfîMîéR†#¿×ê(ÙQ\0æäb§\"µZu±pI°~÷#-ÓŒ1ÓÓšm¼¹$ç°ëP#şê¤±?¾Oºàç E0-nØ…_w\\œ…I72y[†H n}¹¨0ïÛò§o7H‘àÉëÀoçPÓÜksR†C\\ÍæI•‘ğì+ÇCÉ=F8àšrÉçL’cq1¦áŒüÀ(búÔZ-ÛÅ§ÊŸ+‰v©F<qÓsëWã‘NÆ‚C¼ÊÛ˜€ß*eq8ÇQÏ\'Ú¤Ğ,ŸÌ•v¼q¼ +çîcä¸È<sëÅ\\¶‚I\"kvQ7ÌÆ¨2p\0ÎsÓ¿·JË6¹‹÷x<üÊzúõíüëY¯&kxØg\n„È#hàû^¾õ2ò\Z-İ@Ûá]Š+y-\"ƒ…çO¨\0t ó÷Ex‹í+;±;ü¶älÉ¿ŞàòNµO¨*K}0£’›Ğä¯,\0o^üõ©&oºYãòæˆ4€Ú\n‘\'òsÛŸÎ²,Heû~íìb—RgŒâAüYÏN3Ó¥uºgŠ/¼x×ºuüöwvÏ¼¬YWg\r(WÏ]r\n–³Ñæ¹ÿ\0IŒâ!/e“~26>]ÍÔ‘ÜzãµÉ.ÿ\0RØ a—7“Ï*˜•\0÷Ï8à\03YTWØÚ–úŸ[[ÿ\0ÁAş,iVék¿q,6Ê\"æÒciW€Xäåˆœ{Ñ_:Câ]>(•²´Ù¶€<ÇŞıÎÖ“ì1éErZ]Îßs±úñ‹ãÄ³WÂÏx©¤E»·ÓeOI3¶[²§Ê^9ëùWãçÄ?ŠzçÄ\\êÚî¡uªjw„g¸•¸\0wú~úÃûNø\Z×âwÂ=_J¾ÿ\0Usìb»¼—ÛÃê¿!o,„WóBÍ»Ë‘“8ÆqŞ½,4“ĞğjŞ:™ÓÈe“¯OÖ˜>b}ªY-ö’2x4Øcıç_ÒºvÛÜj1SÒ¤5=¢QÔf”DµRYÎXqNw°r@àTÏn\nçÒ–ÖægüŠ ê_ŞõëM¹ËÛãîñŠ%Œ<ßJ[¨ò¨2zĞZ+ªãç\"¹fÅ*Ç»J|q|¿¥J—WD#\rLh‚¯NôàTo•©;ÕÉ­•ˆüúSÕDD÷<Òµ+F\nÔ“Æ#U÷$Ç^Ù ÙFÄOnUÀŒàŸJ…íöpß‘«Â/ƒÎFsLòrÃæ4¯âFsëœTŠ»›ÿ\0­W,Äy5\ZesÛ=(ßr}Ò?\nrÛùjI<dc ÔÌÛP{Óf^W®1Ó4;$à½Xy²ÿ\0/Ojb h¶ã5=µ°I:ö *n~KT­6ÅÆzr3ßÚ¤Š/Şõ¨x¿@{ò:Pdñ,f“qØÜmã¨¤±p?º=“Ä§ğúÔ–p	#$öã@Ğù#VVäu=¯4ì‹™ÂŸ”de±’3J°nr	?QÒ˜ÔÚ\nñıìÒ{diZIäÚ#d39mÙL&?8§ÈWæÙ\"qÁèF}†õGKa,{Ï+‚NqŒ~œt­!–C(t»BÓioâãÛš—Av9o]Û@úJ»yo5½¦$Ş­±]L‰Ô‘€z¯}ë6i<¦#Ÿõ{»tÏN}êìSMy­$Í \\ª‰>m«°¶?Î¢æ¤}x²ù^O¾cÇÚ9ŞIÓéÒ´\ZôŞÁ~%F·#Í´6VAòã?7ÊjÔ$Íºœ1H]”‘Ñ~o—òã=j×ˆ9-o¥Xü³k0e\nŞ«!ÇéÔóïXËskÃDÖé»÷`‰•_i—Ìÿ\0[‡$—ÏàÚµ5«Û9îµ¨¤{iI&(üÍà–iwØ˜v\'œÖÏ¿Mk˜ÿ\0uS”òs¸ÂLœŸ­nx7Ã1x‡ÆqÛHì±J@‘@á³¿?JÎm$RmlwúN¥¨j\ZU´ğèzSE4I\"y*@#©ÏJ+ê|ĞÃZx66lE´`Ÿ³¨ÏÊ(®S¢ìÿÙ',NULL),(13,'Ramon V. Del Rosario College of Business (RVR-COB)','Management and Organization Department (MOD)','2018-10-13','r','r','Socially Engaged Research',1,1,2,6,NULL,'2018-10-30',4,'f','f','f','f','1','f','f','f','r','OVPLM',80,1,90,1,1,1,1,1,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,93,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(14,'Ramon V. Del Rosario College of Business (RVR-COB)','Marketing Management (MM)','2018-10-13','g','g','Socially Engaged Research',1,2,5,13,NULL,'2018-10-24',23,'g','g','g','g','1','g','g','g','g','OVPLM',80,1,90,1,1,1,1,1,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,94,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(15,'College of Liberal Arts (CLA)','Psychology (PSYCH)','2018-10-13','t','t','Socially Engaged Research',1,2,5,13,NULL,'2018-10-25',32,'t','t','t','t','1','t','t','t','t','OVPLM',80,1,90,1,1,1,1,1,8,'','','',NULL,NULL,'',1,1,1,1,1,NULL,NULL,NULL,1,1,1,1,1,NULL,NULL,NULL,5,NULL,NULL,NULL,112,'','','','','',NULL,NULL,NULL,'',NULL),(16,'School of Economics (SOE)','Ladderized Applied Economics (LAE)','2018-10-13','s','s','Socially Engaged Research',1,1,3,7,NULL,'2018-10-26',33,'s','s','s','s','3','s','s','s','s','OVPLM',80,4,90,4,4,4,4,4,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,128,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(17,'Br. Andrew Gonzales College of Education (BAGCED)','Educational Leadership and Management Department (ELMD)','2018-10-13','v','v','Socially Engaged Research',1,2,6,16,NULL,'2018-10-30',1,'v','v','v','v','1','v','v','v','v','Others',80,5,90,5,5,5,5,5,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,142,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(19,'Gokongwei College of Engineering (GCOE)','Electronics and Communications Engineering (ECE)','2018-10-13','ff','ff','Issue Awareness and Advocacy',4,2,5,13,NULL,'2018-10-31',3,'ff','f','f','f','1','f','f','f','f','OVPLM',80,1,90,1,1,1,1,1,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,154,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(20,'College of Science (COS)','Physics (PHYS)','2018-10-13','se','se','Issue Awareness and Advocacy',4,2,6,15,NULL,'2018-10-31',31,'se','se','se','se','12','se','se','se','se','OVPLM',80,3,90,3,3,3,3,3,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,172,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(21,'College of Science (COS)','Chemistry (CHEM)','2018-10-13','cc','cc','Direct Service to the Poor and Marginalized',4,2,7,22,NULL,'2018-10-31',3,'cc','cc','cc','cc','3','cc','cc','cc','cc','Others',80,1,90,1,1,1,1,1,8,'','','',NULL,NULL,'',1,1,1,1,1,NULL,NULL,NULL,1,1,1,1,1,NULL,NULL,NULL,5,NULL,NULL,NULL,173,'','','','','',NULL,NULL,NULL,NULL,NULL),(22,'College of Science (COS)','Biology (BIO)','2018-10-13','asdf','asdf','Socially Engaged Research',1,2,6,15,NULL,'2018-10-31',13,'asdf','asdf','adf','asdf','31','adf','fda','fdas','fda','OVPLM',80,1,90,1,1,1,1,1,8,'','','',NULL,NULL,'',1,1,1,1,1,NULL,NULL,NULL,1,1,1,1,1,NULL,NULL,NULL,5,NULL,NULL,NULL,167,'','','','','',NULL,NULL,NULL,'ÿØÿà\0JFIF\0\0x\0x\0\0ÿÛ\0C\0		\n\n\r\n\n	\rÿÛ\0CÿÀ\0=B\"\0ÿÄ\0\0\0\0\0\0\0\0\0\0\0	\nÿÄ\0µ\0\0\0}\0!1AQa\"q2‘¡#B±ÁRÑğ$3br‚	\n\Z%&\'()*456789:CDEFGHIJSTUVWXYZcdefghijstuvwxyzƒ„…†‡ˆ‰Š’“”•–—˜™š¢£¤¥¦§¨©ª²³´µ¶·¸¹ºÂÃÄÅÆÇÈÉÊÒÓÔÕÖ×ØÙÚáâãäåæçèéêñòóôõö÷øùúÿÄ\0\0\0\0\0\0\0\0	\nÿÄ\0µ\0\0w\0!1AQaq\"2B‘¡±Á	#3RğbrÑ\n$4á%ñ\Z&\'()*56789:CDEFGHIJSTUVWXYZcdefghijstuvwxyz‚ƒ„…†‡ˆ‰Š’“”•–—˜™š¢£¤¥¦§¨©ª²³´µ¶·¸¹ºÂÃÄÅÆÇÈÉÊÒÓÔÕÖ×ØÙÚâãäåæçèéêòóôõö÷øùúÿÚ\0\0\0?\0ıÑ¼M.µv–ª­r7„„ŸLWuiğšKØC5Â@Ç’€#ëœV7Â+8›Ä72\rÉr}sÅzZ]ùcŠâPV5¹ÉŸƒ\'åÚóÓşÊ¬\'ÁD\0Ô~¸‹ÿ\0²®™®ËH4©s…ûØöÍ?gäŸ­—9Ô:Œåcííóœ\Z’‚v­¾”·b#ú×F5\rèÙ³ß¦)a½e\' 2·©Æ*\\b]˜|¶fÈ¿”‚›°!ÎO§^¾Õf×àÅŠ}¶Iw\'\"ÁVã¯=y­‘¨ÈÒ±fûÜx\"œot+ÆŞ>P9éÇéS õ1ŸàÎŸ(Ü—“rR\"\\sëÏÿ\0[Ş¤?³å´¿>¥6×#\0q¿¯Ozİ[Àwoâ\\oCŒÔÿ\0…$7I#?»mù?ÄÏjv]CSÏà6›5±ÅÕŞà73y`ü rzğ?ÚéO´ø+¦ù	ç]\\»UÆpõª—nXLq)Ç¨ÏøšU¾)ŒHomÃ€•!jT‹àN†Hšçt¹u$¯+ëLw9¬öø#b÷»…R ©‚1ß·O~•Òı¶HîÕQùNNI,}1Èşt‡ZhXÇˆÊ…È<zÿ\0ûTÒ‹\rLx¾éRÇæ­ÍÒ†}©€½¡èÃéS^üÓ-â2}®áÕIù7·‘œqõÅjlÈ]ÁrtÉÀã<òzsÔÓ¯5“40¡A\' ³©ÁÉ>¾æ†’Ø5F$¿´ ì÷›ÖF…ÈÈÏN=ºu8éDtQùt\Z.	iå€cùñ§ò­“}¹d†t*I?yv¹#§¿×ŞŸi¨Ê’¤–@ÉÀÎÕùÉ¯<fšŒX©ğSETå“iÉ}¥Xç¯té×‘Dß	4„5Ù,‹±‰Ìø\0óÁ!x<t=kjê÷Ï‹`Ú¢8Úùàƒ½°Ü’9ÇA™#5\rÅöéÿ\0vHXÕ£\0~Sæg8àöéÅ>Hmğ£@]›¡¸mÅ®°	áA\0üÜ\09úÕƒğ@wCöYÙ|³»,>oŸ‚1ÁÎ1Ğf¥}T\"E€ÆJÆãæÈËt?‡n=i}ö‹¹Ys–RÇ;²8íşíRŒDîÈ.şøzÁ[+¢DLìZáˆsóG±ã#ÜRÉğ“A6³ı‘#r§r‹‡Ë}àº•nk‰§cî[pR’ãqÎyõëURâO±©ÁÃ—\'îr‘şª•˜‘Z†>c¼X—+‰.d;ºàğŞã§¥Jÿ\0¼5òçJVŞKÊ™AÆÏÉÉÉ\"¬Ş\\,·%fÎ‡VàœŸè*! \näm)#’Ì¹ç¦8ÿ\0ëQbˆ¬¾xv5xÆÜå&w$	ÇÍÇ\0ô¨—ÀU‘›LCóü Èüõà\rÜõ•Jòğ>÷$ç½:Ó¢»1ÆH\0‰r¤wÇ?^½xæ€W+Â¿Ğ-]˜éğºñÁvã÷¹¨ÓÀš\Zsö¿ï¦?û5X7E[=ıqLîêx=ihib¼ÑXóa	ôûßüU7şM)HcãŒU“Ç#ÔÓ\\àqNÁÊ¥sàı%ÏüxAùšCàÍ%åÂßùÕ”“|õ¡Üæ¥b“xCI‹?Šoü!ÚA?òƒõ« ‘G™1@¥~…1àİ tÓíÿ\03I\'ƒ´‚?ãÂÌÕÂØôüé²H1ş‚53¥ğN‘\'aˆPäb¸¯x+û\r|û}Í9%yõ¯Dí“ã‡xVóıÏê*f®]Oö…ÿ\0kEG°úÊŠæ6:Ï„RÔ®Éë±?™¯AÎñı;\ZóŸƒN­“¸lL{rkĞüÌzÖñm-L ®<61ùSª1 =¹õÍ<6­hö/|oµ¹éÜÔ¤ƒÓ‘ØúÕu9ÏCOY=Mg7w¡Z’Œg½H³\\z‰$‡×±ô¥VÁäñüªGvM€!8;Iê	ëı*eË¯eÊÿ\0{­V÷²2\0sşM ”Ÿ¾[=9ô .Ëm1„sÆ01Ğ½±!‚’Øã·~ªºüï• `ÉÎjC zŒëëHZ–ÚiÅ¿€3·w ÿ\0gŸ­B[ks¹r@?â;có¤’WºXÇÈjá\0Ú£××­VÔ5(4ë7šáÂA\n—ffÚ8õú\nRË] pûW\'NÒ½{úZ‡Tñ-®™k¸¸Ş<6ÒÍ´c-Ğúu<{×È¿µü3Âc}7O{ıhÈC1À°OŞAà¾T\r§‘¼zWÄ?o_|TÔb¸:½¥iÅ,1EeØ\\Çş±‚™9RrÁH#\0 šPob\\ÒÜıGø™ûjøáuÊ}³^Ó\n$‹>w)2£8ÇT]…‰\0zY—ÿ\0·ßÃû}nÚÏûLÌ°\\\\™Ë·«ñ÷Ç•\r§±5ù\n·:Ö»¡ê7ÓÈom-™­Ö+É™¥…;ÓRÙVÀ\'~–FXW;©kú€ÔşËª_Zİ*¬¨eUD…—Î~Kmç|’mŞIÀß²0sGê¿¿àªğõÖä€ˆBåîîD†2á¦Ê\0‹–ùbbwÏ_³ÿ\0‚ºêVú‰ÚãK²¸+Ùc·q#~éY®ˆŞá˜ç¨#vAñGÄzËM½Õlî$Õ.áó?ycrïk*2›­“Ëïıà,rB˜‘ÇØxáZÂú/.g†áÚI‡Ş&)GÌyÜ~w9`H*v•<ÒöI\nç×3ÁP¾-™¤³—Fh-\\FßiŠR!MùÈìœ«……áúzïÍÿ\0>ø« øŞÉ&}#Ro³Í%Å‰gˆ2Ÿ•ÚI@ûªûÀ§‘€Üñv±ª&¿¢[8xìçdª@\r`+ÆÙàí„!‰çi÷ş(óü[<Ûu\nl!ÙÊIo™›†fpI~xÀÎEªqê\ZŸ Ÿ\n?à²4×<Kog«x?Nm=.#†îæ)dCl\\o+ƒ“ÉûùbA¥}·ğ³ãv—ñVÊ°–…TÚÄœ“è@#ñõ¯ÂÍ3Æi-<ñÍ.mĞ¢2]mŞ¬1Ç$.™22y¯_øÿ\0	ñÏÀ™4_*}E¬áÿ\0_²A¶ëk‚¯Û´Ÿ.ˆbA88‹‹OCXÚÚŸµ|Æ?ÃÈôÈïÚ£óöÄÀc‘{Wçÿ\0€¿à´z,w_Ùº¾‹¨Ésicyip“ÁwóàaƒqõZûWáWÅMâ÷ƒm5Íöû+´VVŠD}„¨%[iá†@#¨4õZ²Ò[£ªvòàŸz2\0Ï#ĞqÈÿ\0ëşUæ?SøÓÓ“È,;3óš9ÛØ­G²îà÷£y=ÇáC¨WáÃpG©ê?\n¨¶ÃQÏÒ€1ßô¤i6¿¥ÛGZ«»Ø5ùÓ^M§ÿ\0¯Mó‰<Ÿ¦5ÛqªÔ5$vÚ;Ó|ïoÖ˜Xš(Ô5Ûq¤¢šíµhÔz„‡	Y~,S/†o}¢?ÌUó!¥Pñ3Å=wÿ\0\\Ÿ>üRÔ”ûW“éúÑM74W õ:ƒ\n\"¿Ô=\n úrkĞóšóÏƒjRóPÏBŸÄ×Ï®*ÕìLcbTå©å”q×ß5\0|\np9iØ¢TQşM(~}}ª.}qKaO?7ó©psÎÅ9gÇ=j¿˜ß…9$äñ@Ùß¿5\"¾ÉF@?ì“Ö««J[&€,.7ó‚¸È\nÃ#=3@“÷8=ª??t`cî€½dxÇÆš‚tõ\rNî\r>ÎİwI<òmHş¿­\0eücøÉ¤|ğ5î¹®]ı’ÂÁİÂ–?3\0\0	$Ÿ@O¿0¿kïø*‡ˆ¾0kš¿†´Ù4-e¸´yÓ3ÜÃóGµ¾ö\0[¸>a\\¯ü?öÚÕ¿i_\r7Lim|?eøJÌ.ã%²ÌAµAÁÁæ¾`·¾)6ÆV}\Zów’AQÉ­a¦R—C¢Óus§´wÏcÍVËHbG.\nr>^ŸR\0â•Ü,÷’G Ù’Ê#9Hå)<v‚Ù^N[¼uC«¦ Škk@¼m0ıÜ„\\(9XÇXg.IÏ<-\rjî¯f•~ÑÄÙØ …*¬ïä\0F6à`ä‚zî•ŒM/ê–º†¹©]éSŞÍ¤4òùæ<Ïló•Yq‘¹‘—%K¸#šŠmMæ±°kÒ\nLÒ}Cç(‹rÏ¿c.Kşñã$(~€¹ åÙÜlÒe‚96dÜÉ·s|¡öã ô¿4ñ©\'öE²¥£Is$…|ÉeQIc#±`Kd`&0Aá7a¸_cP›:ıš8Ñãu\nÙó\nùR!*Fs‚	ùIø†sV`Ö®fÑï<ÿ\0%¿´WHã€\"ÄJJ÷&÷bF`ªJŸâiæõ+·mD“ş‘.ÎYI$7ñÓùUÇ›ÍÓõKùå‰bFÅŸœüàãeqŒœT–ÚS‚QHc¹™n[F».]Š`0ÎâÃî²cç\'q#g«OÈ¼:Ú®!C˜Ë\rçpÎŞ0Ø=8îZÉµÔ\r…ÍôÉ,Ûd’’ˆ÷¿\rì9ù_nµ úTÈ]e(+}ğD`d>qÀÏÍœñŒR\ZĞ¹×6ÚmÄÉºñ”•Ææ”©Ê¶G»`ıj$¼YRÊ&İ]¨°ò¼„®Oç÷zg=ñŠÊ‹Í]\ZF‹”3(f\0‚0cÆïN¼zĞöfÖäó!#c„-ó6“ƒÇÓÚ›zN¯&««Iw{7Ú\ZCœbÂ8Ú¨À}	ÉÍ};ÿ\0øı·¿á—<{2jÒ³x#Uqö´3#[ÜŠ%îÉwu$öòg‡ïÚƒä‰Dˆ…‹ÄO@À€0_ğâ´t­]­¶\rÂJÅ‚Hÿ\0!¦\'£§“ëÒ“WV5†¨ş„´nß^Ò¡½¶’)¡¸f‰Ğñ\"²‚¤{zÕæe~À<kóOş	aûm\\|<Õáøkâ¹¦“HºFÔ.¥\'ì¹M¾A=6ä&Ş˜İÏ­~’E(š%uå\\dÄ{V\\®%äöõëC>q’>^œô¤¯•Ê¶üŒ6î1Ïluç­DNM )Ë~o,9¦Ñ[G`ÒŠBp)<ÁLR3m¡#ÈúûPyãÒ£2;n4”\0Š§â\0Dº¼/üªåR×¿äsëä¿ğA1Vw<‰²ıh©^ŞMçäïëErtnL·WàôÂ3^¸W|âòü{\'‰¯BÆ*ÖÀ=NãŠ\\â£”6)€ıÔå!ª4^iÀã¥\0I’Û4gÍÆ•Z€\';*G#§5JA”ÿ\0´(<?˜ ^^-»JÇA?×úWæÇüßöá·ñÇ‰“Á\ZêÜh–¦)õ;¸g&9_lƒÈe×·L×Ñ_ğUÚ:o€Ÿ³D¿Ù÷3[jºıØÓ-ŞIô‘™ëÀ\\qÏ5øù}â™5»»–Œl7.\\’ä=zôÎO5¤;ÒêÆ­\0ÑÅ$¶²F$ÜÜü„À\\’Ü³‚2x®[S·Áï-İ~trÉ#1dlŸ(ÜX|Ç¦8ëO†é$ÅÄ¿ºSåBy,JrsÆ@ÍAw¬#Eq,Qm–êãİ	qÙ9Áä`ã>„b´ZIufXì ‚x×;åÇ?ëò ÏŞ»|Àü£šS•ïÅÄŞC*`Õ€Î:î\'=:’zSî#v6…	d,Ìë¸˜”]„´ûÀòyíÒ™×îRŞd‘wÈàŒœ\r¼(î:çê¹‘#¯lU\"¿ÚÒE,É–ÊÇ8|“´çn~÷>”û8ä]6V‹äŠÚ\rÓêwŒmSÔînAÉäÔzEÄ~Q¾cLÑ±Œ¡P~ñàŒc,IÕ= éòÇ0•wq´‚B†#\'¯ºsP\\Fß][Ë¬G›O&\rÀ¼\"rKgÖB¹\'§§JÕãµ‚tÜB°\rû½ıÃ˜àçrGc&ym0ŠBc$£Io7#±ç8ü1Sê3‰åÜ¸1\\Ä	 ¶AŸÒ‚ÆÜ¹ÒaFd\rk&ÿ\0/!r$ÚFáŠ³oz¶šÄxé°r2F{duÿ\0\ZËuŒEç±WÆÒ Ä/ÊFyã§¯¶iòêyq,“Jè°…“ûşnJ®xRFrzp½M\0lYêòëz\nG$#íjY¤(wd ÀE\0`ô¦O­Mcc6·al‘ba$\nşì à?Ùç¨<Xš<o\"*[³´³.\0\0yŒÌ\\g\'$qïsV4KÓl·	4²•ÂÆ«´a3Ä íßĞ\Zw/ø\\Z§‹­ä’ÙÅ€•VHü£!eÜ ®.O$ğÀıj¶™(Yã.Â7onûËŒ`çØ­1õHÍ¯ÏÇïƒ n#rò?\0j;ËeòáeP?t®Täúúš\0ìc×®[Äz}Å¼Ó£ÄÁüÅ»78î‘Æ9úùÿ\0åı Æÿ\0ÙËK7÷ßh×4!ö\r@Hÿ\0½bŒÊÃnôPß~/5É’Ko-„A9ùF[9şŸ}ÿ\0åı©à7Åû+if´íjæ++Ü¸XÈ•Ê$¬1ÎÂXçwC•2WC?eÍ-Cep. VïƒíS”t¬€(¤\r»¶)IÀéš«;\\»LÛšo—§5ıŞÔã+=@|‡½ŸÂ˜Ni1Š3VÀ\\g½5Î\r&ÓëM2níLuUÖX2çş¹?ş‚jË>½UÕí:àÓ\'ÿ\0ĞM\'+ãÍy6ïõ¿øí3Bw}(¬9‹æGAğyš]Fÿ\0v2¡:}H¯Bç×5çŸX.¥~9ÎÔç=y5ßî¡l@ğÙjZ4ån)€õm´ğr*:UnhôRn´\0õéU<AªÅ¢h÷RäÅm#ã°§cò÷¯™¿à¡ÿ\0´Ú|øQ¨Úyª\'Ö´Ûë{lÈW2ª(ÇÇ˜§¯¥>ÿ\0‚£~Õ©ûDüd60ùŸÙŞ{›(nÜ;¶×brIÉB{b¾\\·fIöçkg¨¨õ]nmKT»¹—/%ô­,²;½‰$I=I¥±™mdÌ˜m½zŞ:#)½t-Op\Z0‡B½OéQ¡ûb:Æ›/·¯Ÿn‚³ŞøÈÜŒõùqÉÏ½$—k]›yäœgß™kUbìBñcS»pR?Ç¹°Äcû§¶9çÚ§²Ö|Eı¤“Ki¨¨Ü’ÄÅ7İÎá‚AŠÃâL‡RAëı{ş•4J×dEæcî\")=0NGz6O\"õş´ú”¤ÌGÌÌ7(Çnà{vïÉ©F´d´…Wj¤g—sóÈ=1õ¨¬´=OP†EÎæq•Y1e@şœ÷¥]\né›ÒpĞ·!b\'<ò;\ZÏÚG¹²¥>¨EÔ–;äš5%WhÇ==F)º~¦ğióÆ!²Á‹Û£Ë¯œr}AöÅ@Úl–’•6Ó’ñ‘“zÚÒü56¡§Ü,eUåQ²(Îã.Óœœ~i¹¤®?g\'¢F0Š{…WÛ¸œ{ôıh7ò¼®ÀŸ6Î2@ÁÇOjô|¿Ôå1¿›0²¿2Ì+m wû½+~÷öOÔµê+{Ë$ßóÃ2*0>n½\r`ñ”Ö›G]«ò9¨b…Ùqä¾W!Âí¹89Áş]1\n$iûÈƒHÒo;eİ´…	·åÛ–ÉÉ·LŸÄ³ö· Í1{¸’\" ã ÏÕÍ^ør÷OÕü™á(Ãª’‹Àû¹#<g=OÒ¶hKáfN„ãñ\"•ÃìŒsò¿ßéZW_Ú:•K;@V2r\0é¾µNFYm›æß¸/i?w©\'§_×ÖŸhVÊÊI72Êª!;ä#–c®8ÎkC&˜ß´–ƒn\0ÎsW4Ûóhª»Š…\"\\ãÊ	üqùU?-â|<mvİĞƒÿ\0êıiÑ¹Çñc<çùş”ß‘:Ÿ²?ğLÏÛ ~Ğ?mí5©Ñ¼UáökmCTJ»—*óĞ¦Üû©¯¨üÒ§ŸÊ¿ÿ\0a/Š²ü1ı¡ô‡IXZj*lîU$Ûæn#8çæù\nı¼²ºöÙ^6¤A®yhÀ´gÇjF›\"™š(»µ€	É¢‚qLfæ\'JmÍ&áM6¶i¾e#74•ª95 »¬¦ÿ\0®Oÿ\0 š˜œT7L\r¼¿îäjf€ñÉD‘†zt¢¬Ë‰[,3“ÚŠç_àó–Ô/OO•?Mz	’¼óá×¨ßü¸Ê\'ó5èŒšµ°X˜t¥¦p:SÈ¦•¹§‘QÓ•‰4\0áÖŸº™E\09ÏËÁÁì}+óOş{¢İÍ6ƒ¨GÆŸ`²­ÆÖb‘K#§8è\0{ã«ô¥†áøƒ_ÁUô‹I¼«éWKØÇ%”ò?îc¹ÙúTŸ““ÁÜéLi+“báI a±ó\rßçúÓ/®Ô^·–Y¢É\0°ÚX}?Î®^èÒZJêê€†e.vò>•›ulVt:zv­Œa¸ã!¹¶|¤cv	ú{Õ«:ç[œ¢G$Ÿ˜…<}qT¢´38Ùü€sï_Nüø#kƒ­¯îÌ¹Ô-Ó,„ä\\ñé\\ØŒDiFìô0¸WZ\\¨ó/‡?³ï‹`·œ\\DË>à¦[…à³¶>AwŒf¾ŒøSûéz.É®á·ša×‘œ	æ½SÀ_F‘§ùl>sÆÑĞ‘·è:^‚–ğÏ’sÆM|ı|mIû·ĞúL>•-RÔòè>\0è¾|q;uf|²}:ô­Áğ;CØV-2Î/—[×\'­vĞé¢go,¨Ãr£UÁo#åDqãOï°?•q^W½ÎøÁ-‘â~\"ı“¼?«î‰tës$‡#ä`êAâ¥ğÿ\0ìáïA\ZCkÉÒîßÓƒõí6~¾òWvrWĞZĞOE‹f\0ÀÈÅj§+ZæsPOmO>Ò>i: Q…¬2ŒdóëZrxFÔ.ÓH„`³ù×Wq¦ˆFïP*‘ˆ«`ø¶+÷*3ºØäuï‡Vº­±à‚]Ã`ß+:ŒW™x»ör°»ñ×2XÀåeÈÜ\0Œ`ó^ö‰–Î9ì3Ö ŸNóWç\\ŒôÍ8·˜š‹İ\rüSıš†‡á±slö”™„íBGÍŸN½«Æüi¡OáMbãM¼F2[¾Cùx2($t¯Ğß‰_âÕ´›˜StbtÆòG+œŒñ_~ĞÚ¯öf·’RæØåFw2±“ê}8¯s.ÄÊräg‹™aiÆ<ñZcwqö‹®¬@]Ìx §ù¦ÛyÁÃnıi—6-— €Fî™î}óªèå8çÓ5í>õ74K¡j“Ù·Ù®¬Ü¸RA2\rÌç¡ÎİéÍ~âşÃß?átşÏzN¾¬û®2%wÃ\0ŒşUøSü°J>ÎpÍò’0N}+õßşçâ[[ösº´¸˜ìëï%!È&ò×\0ààúık*½Ä}}æcŞº£4µ +6i(¢€\ZÍÅ6Š(\0¤İC6\r2µŠ[€®Ù5Ëº\'÷Sü>™3m¿İ?Èÿ\0L÷Ğ!¸Œı¡ø?xÑDì|÷çøj+\06>\'•ªßw;öä× nÇzó¿ƒÒ³ëÛ»ªÿ\03^‡˜qV¶¸å~y5 ËrJˆz\n)`9xj‚7ÙÚ¥ICë@nš`æ€q@gâ·¶£ë³‡ˆßWH¦‚ÖÛÍòØ/˜ì®¥v3d+dzô¯h-Å|£ÿ\0_ñä~ı›µhEßÙæšHÕ6<ìH:PRi‘,ŸûGÄz”‰¤BOİí\0mÎpgñÅco¶’w äüÅ€}M[Õ5=‚VãtÌ²±S÷_Î²­ïR9°UŒ|‚§¡Ò¢íb\rÊmJ%vÌjWsüÿ\0Jû‹àF!ğ¦‡…Oœ±\\ã2ª•qï¸WÅ\r4ÕÕ<]ek\"gÏ•FâxPs“úWè7Â.-CµhÕ	hãï®kÄÍ›ID÷òho3Ñt{±É½¾bA<úœõêåÌ\'°‹<g5Zƒ…ä=*uu‘_=z`Õá3İí*¯Ê€v{ëïZV\'nyá‡åYñ•ó@õâ´ µ c®zRÔ/­®Z·Ùº™ö•9<{\Z‰ãhúâ‘Ãc¿åZ	¨²Áº2ùš¡©ƒúÒåİÉÏÇ©¨®È¼\rŞÙ©aÕœƒÃ\0{|µ#O+ VaÈêJ§$6\\qÇ5<r#pãÔšÊ74vw™nşµùõûSxëHøÁ¯]YÄ.-î<‚23ÜÄåAÏaù×è,÷*N8Æ9æ¾ı¶tKÿ\0ü[¾Ô`wk]EXØ¬ªìÜtÁükÕË¤•K3ÍÌbİ-:‘¹IÀ›Û$Âû\n… Ü7`ôÀ<Ôhß>àF“ş5$¿˜¿&JƒŒtÇ§S_LôĞù2m6Õ®%\0â¡ä`£23ï_ªßğK[ù¤ğºÙË{uk`†ŞÒŞX­®ŠÆM#°Ã¹ìsLç5ùH&òQ27mè½Àç§·ZıTÿ\0‚Xx|\'ûf“·E¸ğõÜV\Z½Š…‘u1å†KØƒœŒ˜°	æ°¨µ¹i¦}Â€F€z¾´ æ¡·“Í·FõPyëøÓóŠD½Å\'šMÔRg	Å#79È¦ĞœÓZP‚—8¨e}Ç\0VŠVB»×?/¨¥“|géF=…dcje+¡G¨6ÛùñÓÌl~tTz£2êw\0+JÃ uäÑX¹ğ’&]nópÀò”|\Zô$}şµçÿ\0	ï…Ö·v;,?–MwÑ6ÜÕ­†÷$üèüé¾hõı(ßô¦!ß\np{ÑŸqF}Å\0=fæŸæàıjûŠ	Ïq@	ë_ÿ\0ÁktYOìóaylHµ%óAÿ\0k…ıkí5ny<WÊ?ğY8’ØËWù¾d¹¶uòVU9àöëLÇ}DùQmfÜ~QŸÂ¨[\'Ç§wÖqwæF£hÏsëUËù\\z×EØ÷Á\0ÒxûJ†?˜Ü¸ŒñÛ­~„xıD·L7î¢P£</>µñì7á9|KñNkß#}¾ß#„b=+ëŸˆ_ôß„Ş7dË8+`–o—¾:t¯Ì¯*¼§ÑåMF1è—^ ‡Mƒ|î#Q’FOëP[x’-E·Ç:mng$×Æ6ı£µ¯Ü´³ùºlA±¸sæÈvƒœœõççÚ³í¼#ñsã@Xôû;íKA€«x-ÙñÏÌKaÏ°ãÚ±†¬ÙÕ,kû(û…~!év÷±CöøòŒAïùWK¦x’	ÎCy™^«Ú¿>®ÿ\0bÏˆ>¶7H—SÜ2–uy”¶2>ëïZÿ\0Ä<*bÕmşÈå^ÚY,¸ÈÚNvàö#¥kR…(«©\\ÎJ’~ôOĞkˆ/¾n£¡ÁéROl.{Æ¼‡á7îZÎ8æ{‰1Êò|ÀçO_Ê½5u_´Â’3Æ®UËc¥¦·5ÒIéŞ¨Ë$*äÏP=k‡ø«ñwş]:MIwq±¼˜„›<Ç!s‚98üëæŒ´ÿ\0µ6+mOhf™L…íC¹€GŞã,p:v5p¡w¹2›Šº>¹½Ôà‘Ø,­”ê\n¿•F·êĞî,1Ğ“œ\nø\n†Ÿõ©íç:—ˆ¼ÙœÍ.ofCGÃsŸOnµ¯¿âŸÃ‹·2ëºĞWE\Z‹É$J?º¡yÔÖ’Á§ğÉë$õ‰öíÕÖÜàdc·zó?ÿ\0l~6xQtùØÇs	mçCµ¢~~\\ÿ\0pç¦Zğÿ\0şÙŞ*ğeÂÿ\0lé‹«Xgdl\n©ş/âÏ§c^éğÿ\0ã&“ñ9#“L[ò®»ˆ’ÒP€Š\0z×=L<èÉLë\"X¸3ó÷\\Òn¼9¨Ía{…ÚG‹\0‚+aÇ¸ªˆÛ3óx&½£öÙğu—†~*ıª5t]B<‚8–;»g¦+Ä‹ùò••ôØzœôÔûŸ-^—$Ú,Ùµ2ƒÎsÔvÅ~ÿ\0Áæ…åø‰n%Y3(q\'şCğ¯Íäœ¶Bğ@Ïú™ÿ\0Uø#ÿ\0wÂİGÅs¤‘j:õÉ„êPÛ$hÑåBr\n¹œÚŸuªí¥¦«qJN+0ÔZcõ¥fâ›œĞ ¦Jÿ\0)¦³mnOZc>OZ`(“şªoçF}Å÷¢€÷…ñßô©”l€ò]DgPŸŸùhßÎŠf­nÿ\0Ú—8-5±Ï¹¢°Wá\ZüAy·¼#?zyÿ\0Â¡·^¹íû1]ú¶êµ°=Å¥_¼>´”S`séFyíPäŠUm­š\0›Â°N¢‘pïC¦ÿ\0_Ê€×°¯#ı¸>Ëñ¯ölñ^‰kl·ZŒúeÇØ©9ŸaÙŒwÈ¯[½Sñ¹má­îşíŠ[ÙÄÓÈŞŠ£&µ*1¹üçkzTºV¯qg*§´‘á™Uu;X~\ZÍl3rÇC_B~ß\Zƒ®|k×¼Oá{këM;YÔ&Xç\0¯˜Ç,é×›sc=øÇJùúî	]’W÷²\0ªw&®hNPfÕ(NŒÔ*+h~Ã?ÛÂß\nÚõãıö±7Ú‰Ç!6 UçêÇñ®ïÆ	n~&kª÷j°Z[¶R1É”ôÉãÛõ®›áŸ‡#ğç‚t›ùVÎÖ4#Ü\"ŠÜÔµ¨ô;C!Ï\nz\nùjÕ[¨æÙõ8zj4Ôbq¾\Zø\ráÏ^Ë2Îâü/Êå²ÿ\0*ê—âO…¼2¥Î±¥iˆ8!®\0`İf¾gøëñSÇüGı¢Zµ–)R÷;±ğ	<şşuÊü]ı“-|A£ØİøBçQÕï&‹Ë¼KéQgiÕ‹ïç	·`…?‡Ztè9»Ô†µjÊœ}Ø]ŸbÅñßÃÚåÚÅ§ëúeïğIÇ=N1Zw\Zu½iöˆ£<ïœúÿ\0Ÿzù+àìq­Yü@·Ö|{¡%İ„He··¼G’fxY#ó0ÄÆ+ß~èZ—‚üa¢Øj‰áËÖö«3Ç3Y“ÈË«¦Iå—=Hâ¢½Ãà•ËÃIÎ>ôltÚN’±^)P[…\0`]¾`ÒÙy‡syc#«˜X~ÊÇ¯Á+¯Òõ?ø“Ê»s;Ö0“‰µJi£Ï¼}¡&»¨y’ª¿–:HNã·áúV~‹ğòÇM³Y<¨¡/”`şz×C«ÈfÔH+“ÔÕÌüfÔ\r¿i£Å~l XÄ·7‰	‘àRFRì@©\0Vq“›ÔÒ	%±Óh\Z¾—©ioÈ™”g·zĞ×ôí;_´O´Ai{¶C²©>Ş8¯†¿i†:‡‡>!½æ•}¬ëºiŠefbˆÙÊ°*\0u Gzèe\ZÏ¼+¨ë×:î·¡[évì4û˜¤@%¸.ì2…rÈ İ2z\Zô£‚²º’ûÏ6¦*ó²†‡Ñº÷ìı¡êáŠ[Át;Sù\0qV¼à4ğ×•o\ZFŠ¤)D\0ã‚¼cá/í_â=7ÆÃş-Šö€¾ÛËHğz‚9¨¯£4íj-ZäCÃ€ÀãÔVœ¾2šº¼QòÇügÂN§ÃúÈdb[Y€uR„ŸÄÂ¾^ŒíÏrzc¯Ò¿C?i¿	Eãß„ºÅœ»ˆH\ZhöœÉóå_Ÿ:u´ïª­ŒQ<—(Œ Ág9Çç^æ]8û;v<Â›SO¸û`-ÈÜq¹€8=³ú:ıºÿ\0‚mx>ëÁ¿²_…moQ¯iÌd.ÂRH‘×#Ÿ˜Œ×æ7€?fmK³µG¨Üj>jLğXÉ&<äåÊNÑÛÔWì¿Ã>ËMğN“œ–1YÂ¶êÿ\0xF#A÷Æ+xb!QÚ\'6\'R„bê-ÍÚ\\“IšBG­tòèr\nx¦;àõ¦ÈNs”ÆmÇ½\n=ÀN´mö£ó¦³mÓZ\0ì{\nMÃıŸÎ™ç{~´Ê4Wl/¨üÁŞ’‘—q¨•¯¨c¬\\Õ®†:Lãõ4U}lí›¾?å³ÿ\0èFŠç_ál¼Asƒÿ\0,¨®ó8¯6øB?ŞmfæĞr+Ò7QV¶)®¢î§+qLÎii’IE3q§‘@DûW¯éNóG¯éQQ@†Ïq^mûWê¿`ø#­&yº‰`Æ~ğf\0Ê½!xAÓ¥y‡íg£Í¬|\'¹òT°Ğ¸Q“´°ş\'øNÇV	E×‚–×?;ÿ\0i¯OáeüpGæ-®A1®mûÙÏÁú×ÅÓäÇZu­Ò•uº8oc_£:ŞŒ5yã¶”G$s[˜d†w`m9ç­|qñ«áÁø_û@iãÎ²¸^)<½œä‚¶áİy™ekEÒgÔçX^w\Zİ·t@%µŒâ\0gÖµÿ\0±æ2oS× U:ÜÙ²)2~õÒiğïˆtÁÇæMj][cÔşÙİÊdX•$öQÍş\nXH<¶1£¥wñÙ†?0÷*Ù§÷ûâ’ĞéçîyíÇ…\Zâ|•ƒÁÏ5³¥Y¶—ÔÊà`cµtwVé8!cÀñÖ³®“Ëãë7vZ(Åh<¿›{ŠÙÑÓ6¸Ş¹û­Q\ZìG$(ù½ëfÂïìÖ¼Œ–è}*yYf6±jF§\'\\ãËš|ÒÉwc \'t®0ÄòÄœşU‰®Z)Ä‡*œûUïˆïÌ9õíB‹Nàr²Á~’²É½Õ‰\'qÎzŠ	A|©ç@]BœØO¥wçLŒKŠTöÅK6™D6ª‚JÛ˜É»\r¿Ã[K›…†Ú¹\0éÍoØh‘éí…v(ì+y,<•íùS\'Q2piy‘)$?Ç:Cj~¿…?Ö<D®ˆqøã|iğÇBºÑ?jü˜âO³_¬RÆc%U$p§A’+íÏÎ­cp\0ÏÈxòÏÁı9µïÚŸSÛ#7\rsrIÈò£t%~¬pĞ×£†“9Xóç:‘õ=ÂßÃ&é\'“o˜Í1C\'sÓô•~xx,\Z%ª”,H\0ôE|+ğ»Á÷3ñ<Z\\÷“\\³n ã\0sÇÓ5÷„y0*Â€+§,ƒm³!šjœz’ù€÷¤wãƒMÆ;\n7è¿{gÌ†ïz3î(Ç°¤\'”\0¹÷ÙÈiwö:äÎF?J:\\ÑIœSD˜÷©¶·Ùæ‚qM-“šBsS>ày~¹m^×wïşÑ¢®k0gWºùOúçÿ\0Ğ©[á\Z“â;–õ‡úŠôZó¿„-\"ø–è66}ŸŒö…z%ZØO`ƒÖ¤Iº\nˆÔˆW9¦fK@84€æ–€&QÓ•¨Ù5KÄ:%ÑnlnWÌ‚ê&‰—8È#×µ\\\ršeN:ÑÒİÇÓº>ø­àé~üC½´}Û­fùw\r¡£8eaõ\\~µó/í½á‹xåƒSwòŞÎò	¢fÂ‘˜ç?…~“~Ö_â?…Æ¡amCNWw]ØóbÆX¼Lú×Àôañ#Á7ZÜ‰ÉŒI\rÆÌŸ—æQÓxäWÎÕ£*ıİµÃâã‰ÂYîi¶¹[E&ìùƒwçÍmX]”TÀü4×·şø~øñö­>HÁNÑ»õÍu–’™|²¬N<ÖU’R1ÃŞ×:xîL«úTğ9Æ3Y¶×<àv«°Ü¢Œ¶\nÈì4×*xô?Zåüw|Ú,#b–yNÄ¹5Ù¤Èyñõ5ÇxÚåañeªIÂ˜\\¯¹Êæ¥­4TmØÅğ¾”èŞmÎK‚®ãAğ»k0†5	Ë:Wüsı¦|%ğA­m5@Û_]âHaKw•™y;GƒŞº|^·Õ4h®ìçK¨n#•;v‘ïÎqI&—¼t-]‘ÒëšRyr!Û\'QëXŞIt»Ï±¾ÿ\0.BYY»{f¼ïâ\'íyá_†^&ŠÏ[ÔÙ¥=VÙäôåŠğ5é~#³¾Ñ¢»·e€í–)S€şãó5|¤ÎVG^–»‡JI ufÊà\\BŒ:ı*¾£.ØÖ•‘ÍÎÛ³)Ë9<ôæ³ç¾ÆTôúÔ·×=HãV\\Òã;¹ç½1Ô*k2§“#áR*ğoÙ/C3üFñŸ‰f\r™®æ³…6ãhİ–9üò¯oÖåX´«§Bç™ÚkË>\nÙ^êfk[8Ê½Ôœªàff/·\n}Éş/å]wq§hõ9©[ÚŞ[#ë_Ø‹ÁR^ëwºÔË¸[#[¡+ÒGÁ$÷xüké¼‘ßô®3àŸÃÅø]àKm7!®˜™îz4×ß P>†ºíçÔ×¹‚¤éÓQgÍcñÚ³™6s×&£ó½¿Znóêi+´ã³ÜíúÓ]·\ZBqI¸Ri	À£p¦“FÀ+šJ(<\nMö\0¢˜%ÜøíD¯ïY»½Àà5‰öµ×?òÙÿ\0™¢Ÿ«¦uk?å³ÿ\03EefjPøI6ÿ\0]tâ~¢½}yÇÂ?—Ä×ŸõÇúŠôUmÕKa=‡‡É¥Îi”ƒLÌ|¾´õ›™N\"€%iÁ³PR†+@ƒƒK¾¡ûFÕéúÓÖLĞ!ù×ÓïÇùükäÿ\0³6±câ½NãKĞ$¿Óî\\É–¢=Êªl$‚O·Jú¾‘†áş5J*jÌëÃbêPwùÙàoj~ğü\Z.³a6™}¥î·kyq•]Ç`‘½ë£ÓÜ+ü¾Õí¿¶ŸƒÈ:>µQ,hd·ºe\\3g	 sóÖ¼6Ê_-kÅÅÒpsYÎ<ìİ·}¯Ÿ^õn°ëÆEeÃwŸ ÷¥kÒ²ä•FIÍp=Ï^*êçQa©o…Ü¶P¾µÊü@ĞÏ‰`E˜Ã<J•şGØ÷«ÚB~+?û~mJVŞóòçÓëCer¥©ÌGàq<³hØéw²J™¤¶óqŒ`¶OoÔÖõ¿Â;3oæ[Ï5˜`	OJÛ6R wglUËO+«$7–¯ác‚1éM>ŒÓßèsŞ\"ğ>Ÿ†ÚM:ÃRH¾m·,Š[H#ÿ\0\Z‹Fğ”¢âòììlâ9Xm××ŒtŸJ×Õµx.‹n¿¶2zg\0ûXµİjÊOğ’rñ¥;½­.Î×M½6ÖYöË›­Äg§©®[Iñ<†ñ-¦ù]»çƒZÓŞoà*µ[œÍ\\šô‚G|÷‘+ml¶vÕ‰/ÃßNI|Ä=OÖª;‘Q«XËñDm{áûÈÖ?4ÉUP@ÜOõ¯@ıÿ\0gK¥h·ú¶Ú=¼©~®îóáÂí {úb©üğ­¿ş)iz}Ìmf¸¸Lœ0ŒnP}‹WØ–péöQAo\ZCJ#Q€€vía()Ú]Åâç	rAîYQ´u4¹¦ù”…ò+ØécÉº›æûSKA8 È¤¦ùƒÖ‘›\'ïb€EDÍ÷³Oi\"÷$sI«€4¡M5æÊñô¨ÉÉ¢’ˆh&ŠGo—@qZ³ãU¹ÿ\0®­üÍ>£l²j·¬ŒZ+Sá/$»÷‡ÌW¡gç?æßâ;¯h¨¯EŞ*VÂ{ºœ­Å3u(ni™’Qšnò)CPÕ©ÕlSƒæ€GZh~y¥Ü(H¤Ær~õ(9[u8gŞ€9/ü,Ö­#Íœ[4Ğ¨<™æQø‘_E!Bmu;YHèGWŞm’§Üb¾Cı¨>7ÃŸKzƒ\Zv±+ÏÛ…CË¦~§#ÛÖ¸1ôïeĞõ2ê¼²å}NYn†Áş×\r,¤‘õ¬¿íPLg¥K©/\\şµóİO©¤îK¨ß•UF+ä‰ö®{ÄßáğäMm•æpOD§5­z<ÈÃ&q·çÁ¬M_ÃöWv«$–VóHvé\"ˆ÷È¤šgT\"›Ôåtÿ\0ˆĞx–ŞGûKŞÜç\"”cŒt­H¼mo<æÊı¶’ GmÊ@Ö¾™¬­Šš(D+ÀM™ØZ2x»G‰B¼Ãó˜üÅh¬w/f•š9x¼B5+iz]ì‘qµví#=zµgŞøÎoß§’òÚ¬œ§BO^Wõ¯A‡Æz|Öám\r»ñ’O\'ğâ³îKëH!3uP¼}ıt]Uå¶„ÚO‰·áŠO/Ë”àîÛÁ®¢ŞrÑä’=;ÖZiêéİ<²Q—ÛéW¨ÃŒûÖ|Èóš-Hû—=³QO&G\rÇ¥Q}P3pWóª×:¶ÅÀ‹|ª%˜ğ\0ú’mO]:îÇ¿~ÅmCYÕš=ÛJZÂùèÁYŸôe…}ƒj×ğ/À#á·ÃË;•s\"‰îAÇúÖUİÓÜ\Zì7WÕaiªpHù,Dùª6M#ìÏ?Ú™œÒfº.Iæê)²)›¨Ş(´Roo\0Š7\nilÒP÷\n7\ne&á@fæ“9¤Ü)ğhép0o#İw/ïŸçEM2+pİM‰©Ç|%ˆ/Häù#ùŠô%pÃ­yŸÁÖ\'Ä·™=aÇ×‘^‘·éùT­…\"ZÅDKÅ=[+Í32O0ıiÀäTY¥É%(b´Ån)AÍ\0HE-Gš7P”¡ÈïQn§â€æZò¯ÛD‡Uø+;Â\ZM=…Ò6Ü•ÆAúšõ=Â¹oz`Ö¾øßƒæi·\0ëå±¨©”SLÖ“jhø&×Uİ.õÏ9©Òoô A%zZæõÓ%¦àG#Ÿ~•_Añ²ÜK²Vhİz‚+åå}²¡+hz]¢	\"İ×Ò–X3´œõö¬ÍVóaÛ¾Õ»aó¯<ık›S±=J’iqH¿ê=rFj¼¿bÔX´¶ñŸ¨ë]-’ S¸/^x«ÌåG–ê­ÜWs’·ğT:4Ÿ¹·Q×Š¿Ÿå b˜5±Ó4øqÁëN¸…\0ÎsÏö›–æt1ÿ\0£²lUh‹hzõÇáWo¯RØîÈùyé\\ŠüY±¾÷ç*mµj„±8ë‘W>jRñ¦›<›L÷‘Œ8œuöæ¼ÖûÅ²ë—ßf„ŸÄÀsjëü>Ïar&wÅ´‚<¥vQ²g*:3ôz#…çŠ™PÛN³Û£Œ ñOÜ+ëcª¹ñQì?Ì¦“šMÂš[š¢õEGºÔ’Šu¨Şe8ŠŒĞÙ°i”g4€æ€Š	Å&áKÈLJO={ÑMtËO_Z+SÍşø¨®Èïşb½6ßØW›ü\"|ø†ìzC×ñè™\"¥l\'±6yè?:B™=ÿ\0:[kfç{~´ÌÇ§îCOnn†¡ó½¿ZU—stıh}ÀÒ«â¢üé^	…\0XÜ}(ŞsQy§ÔÓ‘÷M\0I¸Qº™š(û…T×­şÛ£]E‚Şl.„ªGõ«¤vùHõëLqÑ¦~jjğ™\"wm zWâİ\Z_¾ËƒÔu¯PÕm>Í©\\ÂÃ˜¦’2=0Æ±õmgˆá3šøú“å“Gİa¢œ;ÁäÑo-Ev&à˜b\0éÍz¾ãk]NİL3ÆêàÃ<ó^Câ_¤ŠNŞ€ãå¬+-OSğ„¹·C1°ôÿ\0ëTÆI«£¢ÇÒjÂE)÷{\r>ÓÄxqO—Ÿ½Ô×‚Z|{ºÓÿ\0×C\"¿F%ø?Yÿ\0†·»ì1wÆjì=ĞëffëÉçƒDúø†Üîº{W„ÉûG[4˜;±~™óªÚ‡ÇY/ÁK+k†fé¸ği=Ç¦xÓâ,\ZU“nš\"Ì}+Í/u{ß]m]ñÃ»wÊ>ıgÛi×¾\"¼In¤f\\œ¯$×iáı+D@£{â•ì.xcD[XÀÙ´ø®ÇMµ\"¹©>ãÖ³4»óÒ¶†%üªTîMX¦µ>êøSâñ\'Ãİ\"ìù–P—À?+lt;Æ~5ù‡ñƒâÿ\0ÆŸ‡öĞê_<]pš]„cÎĞŒQÎÌGÆğ@åIãu­/Ù3şC¬İxêÛÃ¿´Øcâd³}A-›MrÊ»ç‹\0Ærçø}ó_[†­A%¹ğ¸œ<éMİh~•îÖ·UK]Rûhæ·™.`™CE,l$g ©|Ş+°ãæìI¼ŠU|š‹Í¥Ph¶$/Í‰¨„¹£Í>ô—q›ê?4ûÑæûP»‰¤-GæŸzF‘ˆëúP¥‰”ØÛåå¿Jvh|Ìÿ\0	ü¨¦ª6Ñó”V&§•|”·‰/8ãÈş¢½uy¿Á¼¯ˆï2ÜyÇâ+Ò3š•°ÃÕ³KQƒƒK¾™˜úÅ3ÌÅoµ\0I¼úš7ŸSLdÓ‡4\0ä|7&ŸæÜ~U(\'(”ÿ\0¥à¨Ïj«y}Ÿi,óË0À¥äw`ª€u$“À¯…¿nÏø+Şğéî<1ğÑìõg\n’êûØÛZ’U\0Æ÷À†ÀÉôªJû•f}uñ»ö‘ğ‡ìÿ\0¢›ßj±Ø,¼P*—ã0Š;ä¸õğŸÆ¿ø*/Œ¿i¯OàÏ…8ğÖ‹N±¬O›ÁlFĞ\"å•]ƒ209¯Ï¿\Z|ZÖ|s«=æ«ªßj·“i.n§2I+1É9Éã9àzšúsöAğÔ\Z_ÁÛmMyú¼³M+ãæ;%uAøP+ŸWØQæ]NÜWª¢úÙ¥Èc³Â\0»ÎXñÔšÓx<ÕÊş•ÎxjëÌ<ãƒ{WOÚ1Æ=kãªË™Üû8G–*&»¢faó(9=+’½ÓÄH9ãé^™¦¨³Búõ®[XÒJ?<ñÇZ\"œQ¢8´ğ¼7Œw Ú¯Z|%Ó®mÇîùa\rk=¯–q´çúÖÏ†.„wh¥¶`úu­T´(ã ø#a¥¾ûkpÄ’X³jì>·ÓâÏ”¡‰ÆÑÈ¯LÔ‘$·Üvæ¹©íÄ÷ƒ ¤Ù,Ä°±6v’3Ÿ¥niÖÛœ|¼T0ÛÈòˆpö­­.È¶~föíRI{N¶ØœÔ÷ÉäÛîÀàúV…­°Š\0O\'ÔÖ~»(U>™§r¦¼ Ü¶I9ãë^YûY|ƒÆ¾“Ä–¬zîOæƒ<J2ÈŞ¼cøúW¤Z÷Ù­ˆ7ğèŸ\nõëÛ²¾M®›;}|¦\0®Jº8‰ª‘p9ñá85#ä¿ƒ_¶¾Ù$>ñ6£§Ú¨ ÀoİŒ•gÛµ}ÙûÁ\\tÏˆfÇÃŸ¥ƒMñÌËmm¨[@EæTm-Îcrx?.Ş{\nüŸÍær3\rhéú—ÙnÃ|²!Q½sòF\n‘_p|?)ıÅz—P¬‘É½CSAcÚ¦•²¿~*şËßğQOşÍ(,´ıB={D\0ÓuYd+l7V#¸`sÇ÷7À¿ø,?€ş ÛÆ¾(·¸ğ¥Æ¼˜{«eÇûj¼g¾”¹r³ì$|7^)şhõı+ŸğGÄ}âN¡ êÚ~­g*‚³Z\\,ÈruÆ¶Ç4Ó¸¶%óG¯éGŸÏõÅEŠ3Í\0N­¸qü©’I‘Á¦+í©(ÑäµK¸¯J‰äƒõ§ù€uæ¢{\0èíÁAÏj*D\\ ëÒŠƒSÉ~¶|Iwïõé\nÛkÌ¾3İn9>FOıô+ÒÁÈ©[\nCüÊ<ÊmÌÇy”É¦Ñš\0’ŒÔ{«/Æ^8Ò¾ø~}SZÔm4Í>İK¼÷3,H¸õb2x<wªQl\r7–ÅyŸí#û[x3ö`ğmî©âRİîmai\"Ó¡™\rÕÓ€ˆ„ƒÉãœw¯†m/ø,N£âh/4†‹.‡`,šıÒ¡à`–X¡*p3üDçƒÅ|\râİx“Rû^¡qusq1i™ç¼—RLŒ:/®«öl¢ÿ\0l?ø*išÚËS»ğg…÷Nµœ5ÅÂæ¸ÁŒü¹#Ÿjùjï\\÷ÈîÄ´ò·ÎÃØrÔVUíËË1%ÉÜÄõ§F>Aô«ŒBUWAÆbö¯¯¿a?ü3»ÒÃI¢Ë¹T·;%fnÇÆ¾<.Pÿ\0?jïÿ\0f_‹oğ—â¥ó,ge·¼ä©fáŒ×a‡uiYt;2Ü_²¯Ìözré¬Öº¤‘v\'9ØZÍˆ½rú„a.c¹ÖHäPDˆAVÈìG}+sN¹ó\"Ç^=kâe¾§Ü#nŞe™1TµK$º\\?*‚ŞFI©§fù~`x9QmŒÊ“EXÜqæ¸Æ)n|1ºİÊ!n€ÿ\0Nõbñß>áZix’Ã‡g j¤0-¬¯âO.G,¾¹<\n¶4Ö7/ÎOzÒxbp;‚İh–é-ãã=ª…rµ• ¿Ë1ëZšrßåà•›\rÏÚ¥ãôïZª|¨³Ç° ‹—ZàCjrs\\æ±zdr3ïVïn^lªœ\nÌ?=é;ÛB/¨ßYù÷¿ÍÏæ?ğP‰kà¿„–z%³ÿ\0¤ë²Ÿ1AùŒwBH¯aÑR-Â{¹ÜEº4²;P3“_şÔß¿áp|^Ô/ÑŸìËö{4c‘&ÕşŒş5ß”áJÜÏdy¹®%S¥Ê·g€dÜÊ¬ÅGE©­ÔFœ°œp[?Aæù±IÀÇzn\nn!†6ŸZúö»,ßby±;2v+9ÙÔ¨ëøôÅO¤kMÿ\0/˜‹ †Ç¯STQ|×ûØ9$œöüx©ÕFô9Şr¤œ/Ë¡¨åÙêÿ\0ÿ\0j_şÏ^!´¼ğÖ¹{eåNÍ=°æÒğvHÎW×ç#¯jı3ı’ÿ\0àª^	øùg›¯Lñ$Q =BtKk‡<„Œ‚pyï{Wä,WİY<Š[ÌÉqùPpG¯£¨â¬häÏŒñägHäŸáúş•.ëb¬Bzv©±d.-n!¸…ãpÊš²z×á—ÁßÚ{Å¿µ˜nü7¬ê:ZÛçtyYb`À•¿•}½û0ÿ\0Á`ìüC$\Zo­VÙfãûZÑ¿wØócÂíA<â…5ÔV»üÊzŒšËğßŠ4ïi1_éW¶ºŒëº+‹yVH¥r¬¼\ZĞSëÒ¯ru$oåIBà};æÎqëëJK¸ìÉT£æ=(¤É^=8ëEdhy\'ÁåÇ‰ï?ëßÿ\0fé\"b£µyŸÂ Ñø®ç²´?Ÿ\"½*¥lC}ùçÚ<ûS)c=N=Q$yö®âWÅàÿ\0…¥Ö<I©[éZ|\'iA “Ğ\0$×È¿··ü£Mø{/†<ı›â?Æ\0»¼2î´ÒóÉRÃåy1·€ÜnäWæ_Åï ø×âY5ë×úõÌ¤2‰ç³Gè¨ŒH\0gµh©Ü–ì~‰||ÿ\0‚ßhÖVÓ§Ãİ6kÅJKR·òâ\r»-7îlFGqšøKöŠı´¼kûHkFãÄÚ³½ª1kkhaDTÎ9Æ>µä:ˆ^òmÌD¤/?,~ÀVl×ìI$–õ5ª‰ç4eñdÂİ¥ÎY¿3Uâ|C,œä¹õ5J Z@~µnå¶Ãü<z¢[m•VLËÍJ“øçò¨cûù©üôÖ¢&oœ1¸?J„Â~ğè½iÛ‚¶IëÚ™,¸íòôĞÆµgÔ±ÿ\0í7ÚM—ƒµÉˆ‹ı‚á”ñ’[cÛ%ˆã½}O£Áè_c_–q\\5Îänœ‚8¯©¿e/Ûb-môÜ¢ˆµvi¦ºäuæ¾s2Ë]İZKä}>]™İ{*¯æ}lĞôÇÒ§€f,7ÍÛÔí\Zâ×]Ó£»²¹†îÚe’ÂáÕç¨ş¼Óš=>½=+ÀäåvgĞ©¦®ŒûûA+9>õI­dN›‡µmŞÀLfÉê(Ğ.U\r,rœR´r\\I×µR°8<zZÇ2x Eı&ØC;\n¹+—üi4ûfH²i\r´—WXŒÓJær’½ˆ±n1V4ıî.W<–àÜÖ—öri¶í,Åc‰9i$!~¤ğ?\Zù‹ö¤ı»m4k+­ÁÓA<íˆç¿Ga°†!–1Ç ù³]Xz«.Trbq0¤µ)şÜÿ\0´ÜPYÉà½ådYn©*§İ`ØƒìTæ¾M€}óœÔW7òjRI4¯$’»YÛq9ç$i‡t²un·½}^\ZP²>W]Õ›obÄlşnHçªÜÅTãƒÀ UboaÇ¥8r ár?İé]IXç$¨ÙiÆ3S\"¡ü¯Êüãå?&29÷çò¦Á–gY¥xS€·ÍƒÁïı)6³Ÿa”t8æ6Ï5p[—4è¼Ë%QÎÒHü…‰üšŸMÜ³ò@v#NŞ@,qÏìæ£´„İXÈøfL\0Ç—§¡õ?¥Iöém¼¡€ÏÈç¶3øHÔ½a4Î2‹‘§<İ1øôç¯½kZ]MªËh„W)jnŠ›Â„+•g“ÈÁ=ëK” f,¬èÂFŒ¦U—1®sş5sÍû.™‘9$E9 \0àãÛõ¤Òhhõßµ‹~êm^šÇí2–%Ex^B2.03Æq­}éû(ÿ\0ÁX4ˆzJYxé¿±u”Ú’]Ç6w-–ÈÉCŒp@ï_—öæj6É4ƒlğ›÷\"\nç98İò^µmf{¹L&]Ê»e(Ç<ÎÒ8#åç<t¬nÖ¥èÏß\r_´ñˆ¹²¸æ$,‘Ÿ”â¯G/”ÙúWâÏÁÚãÅß¥ótÍUì.ì,ÚVkIÔ™9h”ã9ÇÌ•úAû!şß~ı¤´ña~ÖšŠ¢*§½ÆõºÈ?4N@\r÷[å#ĞçufK‹>Š{….ryÏ84Q’#—œpÑSÌIãŸ/Ì¾.6ínßÌW§äšòoƒÑ\"øÖfB@0‘ÏnV°ÿ\0k_ÛÃÂ_²˜ñj2½îºcWÂË\0ÙÃ9Îàù5Q2±“g´x‡Ä¶Òf¿Õ/-¬l­¼³O(GRI5ùËÿ\0ÿ\0‚¶kÛŞø\'á}õí›	írLİE·-È$¨$ó !†ÑÉ#å¿Ú÷ş\nãOÚ{W+ª\\Çc¤&õ†ÒŞ=W9À’{rÇ5óÍÖ fİ†1«œõ~Ü‘]Q‚JÂ¿sGS×[ÙL²™šC½†íÉ»¹\'»tíY’L÷+ó>UFoÓµV\rÏ?…;±Ö®Æm½IvôÅ7vÍ1şZj¯ôìÅÔ³§!oŞºƒëÛô§Nÿ\0»>ãõ¥_ôk$Oâo˜şdJlËşŒZ•™Dj@ûj;@5\"©eİ@+ù”ªsÇğ÷¦1ÂÓwn –=¬xÈÎAôöªÒÈeaÆ;Õ0…Í+[ùÃÃ&‘j]ÏDø%ûVx¯àÎ¡Øµ¥°/™låmñ¸Æ;ƒ;Šú¯áŸü3Â^6Ã«Û\\h—¸Uy|Á$Ç¤‚?\Zø\"â³œzÔEXè¼ŒW#/£WVµ;°ÙjZ\'¡úßáÏè>1µišÆ‘z‡şyİFOâ¹È§ßé. ‡ÔmÉÍ~MéŞ »ÒT´3¼~ëÖºö„ñg‡¤O²k7qí\0×—S$¿Ã#×§¦­4~™_é&Kt;~n=r*æ¢1##óùÍ§şÙìĞˆüCpàƒ\ZŸı–¨ë´÷|B».õÛ§ByUÂƒùYaÏ¹o:¥m?MµIğåƒÉ¨êV(ƒ%§¸TÇækÉ~!şİşøpd[#/ˆ.ÆälÊ±+å²N>‚¿=ï|a{¨I¾k™d~ÅU3És¼–İëšê¥“F.ów8jæÓ—À¬{_ÇÛcÅŸ®ÛíÒiº[`[wÚ‡äoÆ¼vk¯8î\'œç\'’MTIµcÈy#İ°/Ç·µzĞ¡/póªÕ•MfîMîéR†#¿×ê(ÙQ\0æäb§\"µZu±pI°~÷#-ÓŒ1ÓÓšm¼¹$ç°ëP#şê¤±?¾Oºàç E0-nØ…_w\\œ…I72y[†H n}¹¨0ïÛò§o7H‘àÉëÀoçPÓÜksR†C\\ÍæI•‘ğì+ÇCÉ=F8àšrÉçL’cq1¦áŒüÀ(búÔZ-ÛÅ§ÊŸ+‰v©F<qÓsëWã‘NÆ‚C¼ÊÛ˜€ß*eq8ÇQÏ\'Ú¤Ğ,ŸÌ•v¼q¼ +çîcä¸È<sëÅ\\¶‚I\"kvQ7ÌÆ¨2p\0ÎsÓ¿·JË6¹‹÷x<üÊzúõíüëY¯&kxØg\n„È#hàû^¾õ2ò\Z-İ@Ûá]Š+y-\"ƒ…çO¨\0t ó÷Ex‹í+;±;ü¶älÉ¿ŞàòNµO¨*K}0£’›Ğä¯,\0o^üõ©&oºYãòæˆ4€Ú\n‘\'òsÛŸÎ²,Heû~íìb—RgŒâAüYÏN3Ó¥uºgŠ/¼x×ºuüöwvÏ¼¬YWg\r(WÏ]r\n–³Ñæ¹ÿ\0IŒâ!/e“~26>]ÍÔ‘ÜzãµÉ.ÿ\0RØ a—7“Ï*˜•\0÷Ï8à\03YTWØÚ–úŸ[[ÿ\0ÁAş,iVék¿q,6Ê\"æÒciW€Xäåˆœ{Ñ_:Câ]>(•²´Ù¶€<ÇŞıÎÖ“ì1éErZ]Îßs±úñ‹ãÄ³WÂÏx©¤E»·ÓeOI3¶[²§Ê^9ëùWãçÄ?ŠzçÄ\\êÚî¡uªjw„g¸•¸\0wú~úÃûNø\Z×âwÂ=_J¾ÿ\0Usìb»¼—ÛÃê¿!o,„WóBÍ»Ë‘“8ÆqŞ½,4“ĞğjŞ:™ÓÈe“¯OÖ˜>b}ªY-ö’2x4Øcıç_ÒºvÛÜj1SÒ¤5=¢QÔf”DµRYÎXqNw°r@àTÏn\nçÒ–ÖægüŠ ê_ŞõëM¹ËÛãîñŠ%Œ<ßJ[¨ò¨2zĞZ+ªãç\"¹fÅ*Ç»J|q|¿¥J—WD#\rLh‚¯NôàTo•©;ÕÉ­•ˆüúSÕDD÷<Òµ+F\nÔ“Æ#U÷$Ç^Ù ÙFÄOnUÀŒàŸJ…íöpß‘«Â/ƒÎFsLòrÃæ4¯âFsëœTŠ»›ÿ\0­W,Äy5\ZesÛ=(ßr}Ò?\nrÛùjI<dc ÔÌÛP{Óf^W®1Ó4;$à½Xy²ÿ\0/Ojb h¶ã5=µ°I:ö *n~KT­6ÅÆzr3ßÚ¤Š/Şõ¨x¿@{ò:Pdñ,f“qØÜmã¨¤±p?º=“Ä§ğúÔ–p	#$öã@Ğù#VVäu=¯4ì‹™ÂŸ”de±’3J°nr	?QÒ˜ÔÚ\nñıìÒ{diZIäÚ#d39mÙL&?8§ÈWæÙ\"qÁèF}†õGKa,{Ï+‚NqŒ~œt­!–C(t»BÓioâãÛš—Av9o]Û@úJ»yo5½¦$Ş­±]L‰Ô‘€z¯}ë6i<¦#Ÿõ{»tÏN}êìSMy­$Í \\ª‰>m«°¶?Î¢æ¤}x²ù^O¾cÇÚ9ŞIÓéÒ´\ZôŞÁ~%F·#Í´6VAòã?7ÊjÔ$Íºœ1H]”‘Ñ~o—òã=j×ˆ9-o¥Xü³k0e\nŞ«!ÇéÔóïXËskÃDÖé»÷`‰•_i—Ìÿ\0[‡$—ÏàÚµ5«Û9îµ¨¤{iI&(üÍà–iwØ˜v\'œÖÏ¿Mk˜ÿ\0uS”òs¸ÂLœŸ­nx7Ã1x‡ÆqÛHì±J@‘@á³¿?JÎm$RmlwúN¥¨j\ZU´ğèzSE4I\"y*@#©ÏJ+ê|ĞÃZx66lE´`Ÿ³¨ÏÊ(®S¢ìÿÙ',NULL),(23,'College of Law (COL)','No Department','2018-10-13','h','h','Direct Service to the Poor and Marginalized',2,2,6,15,NULL,'2018-10-23',4,'h','h','h','h','4','h','h','h','h','Others',0,2,0,2,2,2,2,2,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,178,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(24,'College of Liberal Arts (CLA)','Literature (LIT)','2018-10-13','y','y','Interdisciplinary Fora',4,2,6,16,NULL,'2018-10-30',2,'y','y','y','y','4','y','y','y','y','OVPLM',80,3,90,3,3,3,3,3,7,'','','',NULL,NULL,'',1,1,1,1,1,NULL,NULL,NULL,1,1,1,1,1,NULL,NULL,NULL,5,NULL,NULL,NULL,106,'','','','','',NULL,NULL,NULL,'ÿØÿà\0JFIF\0\0x\0x\0\0ÿÛ\0C\0		\n\n\r\n\n	\rÿÛ\0CÿÀ\0=B\"\0ÿÄ\0\0\0\0\0\0\0\0\0\0\0	\nÿÄ\0µ\0\0\0}\0!1AQa\"q2‘¡#B±ÁRÑğ$3br‚	\n\Z%&\'()*456789:CDEFGHIJSTUVWXYZcdefghijstuvwxyzƒ„…†‡ˆ‰Š’“”•–—˜™š¢£¤¥¦§¨©ª²³´µ¶·¸¹ºÂÃÄÅÆÇÈÉÊÒÓÔÕÖ×ØÙÚáâãäåæçèéêñòóôõö÷øùúÿÄ\0\0\0\0\0\0\0\0	\nÿÄ\0µ\0\0w\0!1AQaq\"2B‘¡±Á	#3RğbrÑ\n$4á%ñ\Z&\'()*56789:CDEFGHIJSTUVWXYZcdefghijstuvwxyz‚ƒ„…†‡ˆ‰Š’“”•–—˜™š¢£¤¥¦§¨©ª²³´µ¶·¸¹ºÂÃÄÅÆÇÈÉÊÒÓÔÕÖ×ØÙÚâãäåæçèéêòóôõö÷øùúÿÚ\0\0\0?\0ıÑ¼M.µv–ª­r7„„ŸLWuiğšKØC5Â@Ç’€#ëœV7Â+8›Ä72\rÉr}sÅzZ]ùcŠâPV5¹ÉŸƒ\'åÚóÓşÊ¬\'ÁD\0Ô~¸‹ÿ\0²®™®ËH4©s…ûØöÍ?gäŸ­—9Ô:Œåcííóœ\Z’‚v­¾”·b#ú×F5\rèÙ³ß¦)a½e\' 2·©Æ*\\b]˜|¶fÈ¿”‚›°!ÎO§^¾Õf×àÅŠ}¶Iw\'\"ÁVã¯=y­‘¨ÈÒ±fûÜx\"œot+ÆŞ>P9éÇéS õ1ŸàÎŸ(Ü—“rR\"\\sëÏÿ\0[Ş¤?³å´¿>¥6×#\0q¿¯Ozİ[Àwoâ\\oCŒÔÿ\0…$7I#?»mù?ÄÏjv]CSÏà6›5±ÅÕŞà73y`ü rzğ?ÚéO´ø+¦ù	ç]\\»UÆpõª—nXLq)Ç¨ÏøšU¾)ŒHomÃ€•!jT‹àN†Hšçt¹u$¯+ëLw9¬öø#b÷»…R ©‚1ß·O~•Òı¶HîÕQùNNI,}1Èşt‡ZhXÇˆÊ…È<zÿ\0ûTÒ‹\rLx¾éRÇæ­ÍÒ†}©€½¡èÃéS^üÓ-â2}®áÕIù7·‘œqõÅjlÈ]ÁrtÉÀã<òzsÔÓ¯5“40¡A\' ³©ÁÉ>¾æ†’Ø5F$¿´ ì÷›ÖF…ÈÈÏN=ºu8éDtQùt\Z.	iå€cùñ§ò­“}¹d†t*I?yv¹#§¿×ŞŸi¨Ê’¤–@ÉÀÎÕùÉ¯<fšŒX©ğSETå“iÉ}¥Xç¯té×‘Dß	4„5Ù,‹±‰Ìø\0óÁ!x<t=kjê÷Ï‹`Ú¢8Úùàƒ½°Ü’9ÇA™#5\rÅöéÿ\0vHXÕ£\0~Sæg8àöéÅ>Hmğ£@]›¡¸mÅ®°	áA\0üÜ\09úÕƒğ@wCöYÙ|³»,>oŸ‚1ÁÎ1Ğf¥}T\"E€ÆJÆãæÈËt?‡n=i}ö‹¹Ys–RÇ;²8íşíRŒDîÈ.şøzÁ[+¢DLìZáˆsóG±ã#ÜRÉğ“A6³ı‘#r§r‹‡Ë}àº•nk‰§cî[pR’ãqÎyõëURâO±©ÁÃ—\'îr‘şª•˜‘Z†>c¼X—+‰.d;ºàğŞã§¥Jÿ\0¼5òçJVŞKÊ™AÆÏÉÉÉ\"¬Ş\\,·%fÎ‡VàœŸè*! \näm)#’Ì¹ç¦8ÿ\0ëQbˆ¬¾xv5xÆÜå&w$	ÇÍÇ\0ô¨—ÀU‘›LCóü Èüõà\rÜõ•Jòğ>÷$ç½:Ó¢»1ÆH\0‰r¤wÇ?^½xæ€W+Â¿Ğ-]˜éğºñÁvã÷¹¨ÓÀš\Zsö¿ï¦?û5X7E[=ıqLîêx=ihib¼ÑXóa	ôûßüU7şM)HcãŒU“Ç#ÔÓ\\àqNÁÊ¥sàı%ÏüxAùšCàÍ%åÂßùÕ”“|õ¡Üæ¥b“xCI‹?Šoü!ÚA?òƒõ« ‘G™1@¥~…1àİ tÓíÿ\03I\'ƒ´‚?ãÂÌÕÂØôüé²H1ş‚53¥ğN‘\'aˆPäb¸¯x+û\r|û}Í9%yõ¯Dí“ã‡xVóıÏê*f®]Oö…ÿ\0kEG°úÊŠæ6:Ï„RÔ®Éë±?™¯AÎñı;\ZóŸƒN­“¸lL{rkĞüÌzÖñm-L ®<61ùSª1 =¹õÍ<6­hö/|oµ¹éÜÔ¤ƒÓ‘ØúÕu9ÏCOY=Mg7w¡Z’Œg½H³\\z‰$‡×±ô¥VÁäñüªGvM€!8;Iê	ëı*eË¯eÊÿ\0{­V÷²2\0sşM ”Ÿ¾[=9ô .Ëm1„sÆ01Ğ½±!‚’Øã·~ªºüï• `ÉÎjC zŒëëHZ–ÚiÅ¿€3·w ÿ\0gŸ­B[ks¹r@?â;có¤’WºXÇÈjá\0Ú£××­VÔ5(4ë7šáÂA\n—ffÚ8õú\nRË] pûW\'NÒ½{úZ‡Tñ-®™k¸¸Ş<6ÒÍ´c-Ğúu<{×È¿µü3Âc}7O{ıhÈC1À°OŞAà¾T\r§‘¼zWÄ?o_|TÔb¸:½¥iÅ,1EeØ\\Çş±‚™9RrÁH#\0 šPob\\ÒÜıGø™ûjøáuÊ}³^Ó\n$‹>w)2£8ÇT]…‰\0zY—ÿ\0·ßÃû}nÚÏûLÌ°\\\\™Ë·«ñ÷Ç•\r§±5ù\n·:Ö»¡ê7ÓÈom-™­Ö+É™¥…;ÓRÙVÀ\'~–FXW;©kú€ÔşËª_Zİ*¬¨eUD…—Î~Kmç|’mŞIÀß²0sGê¿¿àªğõÖä€ˆBåîîD†2á¦Ê\0‹–ùbbwÏ_³ÿ\0‚ºêVú‰ÚãK²¸+Ùc·q#~éY®ˆŞá˜ç¨#vAñGÄzËM½Õlî$Õ.áó?ycrïk*2›­“Ëïıà,rB˜‘ÇØxáZÂú/.g†áÚI‡Ş&)GÌyÜ~w9`H*v•<ÒöI\nç×3ÁP¾-™¤³—Fh-\\FßiŠR!MùÈìœ«……áúzïÍÿ\0>ø« øŞÉ&}#Ro³Í%Å‰gˆ2Ÿ•ÚI@ûªûÀ§‘€Üñv±ª&¿¢[8xìçdª@\r`+ÆÙàí„!‰çi÷ş(óü[<Ûu\nl!ÙÊIo™›†fpI~xÀÎEªqê\ZŸ Ÿ\n?à²4×<Kog«x?Nm=.#†îæ)dCl\\o+ƒ“ÉûùbA¥}·ğ³ãv—ñVÊ°–…TÚÄœ“è@#ñõ¯ÂÍ3Æi-<ñÍ.mĞ¢2]mŞ¬1Ç$.™22y¯_øÿ\0	ñÏÀ™4_*}E¬áÿ\0_²A¶ëk‚¯Û´Ÿ.ˆbA88‹‹OCXÚÚŸµ|Æ?ÃÈôÈïÚ£óöÄÀc‘{Wçÿ\0€¿à´z,w_Ùº¾‹¨Ésicyip“ÁwóàaƒqõZûWáWÅMâ÷ƒm5Íöû+´VVŠD}„¨%[iá†@#¨4õZ²Ò[£ªvòàŸz2\0Ï#ĞqÈÿ\0ëşUæ?SøÓÓ“È,;3óš9ÛØ­G²îà÷£y=ÇáC¨WáÃpG©ê?\n¨¶ÃQÏÒ€1ßô¤i6¿¥ÛGZ«»Ø5ùÓ^M§ÿ\0¯Mó‰<Ÿ¦5ÛqªÔ5$vÚ;Ó|ïoÖ˜Xš(Ô5Ûq¤¢šíµhÔz„‡	Y~,S/†o}¢?ÌUó!¥Pñ3Å=wÿ\0\\Ÿ>üRÔ”ûW“éúÑM74W õ:ƒ\n\"¿Ô=\n úrkĞóšóÏƒjRóPÏBŸÄ×Ï®*ÕìLcbTå©å”q×ß5\0|\np9iØ¢TQşM(~}}ª.}qKaO?7ó©psÎÅ9gÇ=j¿˜ß…9$äñ@Ùß¿5\"¾ÉF@?ì“Ö««J[&€,.7ó‚¸È\nÃ#=3@“÷8=ª??t`cî€½dxÇÆš‚tõ\rNî\r>ÎİwI<òmHş¿­\0eücøÉ¤|ğ5î¹®]ı’ÂÁİÂ–?3\0\0	$Ÿ@O¿0¿kïø*‡ˆ¾0kš¿†´Ù4-e¸´yÓ3ÜÃóGµ¾ö\0[¸>a\\¯ü?öÚÕ¿i_\r7Lim|?eøJÌ.ã%²ÌAµAÁÁæ¾`·¾)6ÆV}\Zów’AQÉ­a¦R—C¢Óus§´wÏcÍVËHbG.\nr>^ŸR\0â•Ü,÷’G Ù’Ê#9Hå)<v‚Ù^N[¼uC«¦ Škk@¼m0ıÜ„\\(9XÇXg.IÏ<-\rjî¯f•~ÑÄÙØ …*¬ïä\0F6à`ä‚zî•ŒM/ê–º†¹©]éSŞÍ¤4òùæ<Ïló•Yq‘¹‘—%K¸#šŠmMæ±°kÒ\nLÒ}Cç(‹rÏ¿c.Kşñã$(~€¹ åÙÜlÒe‚96dÜÉ·s|¡öã ô¿4ñ©\'öE²¥£Is$…|ÉeQIc#±`Kd`&0Aá7a¸_cP›:ıš8Ñãu\nÙó\nùR!*Fs‚	ùIø†sV`Ö®fÑï<ÿ\0%¿´WHã€\"ÄJJ÷&÷bF`ªJŸâiæõ+·mD“ş‘.ÎYI$7ñÓùUÇ›ÍÓõKùå‰bFÅŸœüàãeqŒœT–ÚS‚QHc¹™n[F».]Š`0ÎâÃî²cç\'q#g«OÈ¼:Ú®!C˜Ë\rçpÎŞ0Ø=8îZÉµÔ\r…ÍôÉ,Ûd’’ˆ÷¿\rì9ù_nµ úTÈ]e(+}ğD`d>qÀÏÍœñŒR\ZĞ¹×6ÚmÄÉºñ”•Ææ”©Ê¶G»`ıj$¼YRÊ&İ]¨°ò¼„®Oç÷zg=ñŠÊ‹Í]\ZF‹”3(f\0‚0cÆïN¼zĞöfÖäó!#c„-ó6“ƒÇÓÚ›zN¯&««Iw{7Ú\ZCœbÂ8Ú¨À}	ÉÍ};ÿ\0øı·¿á—<{2jÒ³x#Uqö´3#[ÜŠ%îÉwu$öòg‡ïÚƒä‰Dˆ…‹ÄO@À€0_ğâ´t­]­¶\rÂJÅ‚Hÿ\0!¦\'£§“ëÒ“WV5†¨ş„´nß^Ò¡½¶’)¡¸f‰Ğñ\"²‚¤{zÕæe~À<kóOş	aûm\\|<Õáøkâ¹¦“HºFÔ.¥\'ì¹M¾A=6ä&Ş˜İÏ­~’E(š%uå\\dÄ{V\\®%äöõëC>q’>^œô¤¯•Ê¶üŒ6î1Ïluç­DNM )Ë~o,9¦Ñ[G`ÒŠBp)<ÁLR3m¡#ÈúûPyãÒ£2;n4”\0Š§â\0Dº¼/üªåR×¿äsëä¿ğA1Vw<‰²ıh©^ŞMçäïëErtnL·WàôÂ3^¸W|âòü{\'‰¯BÆ*ÖÀ=NãŠ\\â£”6)€ıÔå!ª4^iÀã¥\0I’Û4gÍÆ•Z€\';*G#§5JA”ÿ\0´(<?˜ ^^-»JÇA?×úWæÇüßöá·ñÇ‰“Á\ZêÜh–¦)õ;¸g&9_lƒÈe×·L×Ñ_ğUÚ:o€Ÿ³D¿Ù÷3[jºıØÓ-ŞIô‘™ëÀ\\qÏ5øù}â™5»»–Œl7.\\’ä=zôÎO5¤;ÒêÆ­\0ÑÅ$¶²F$ÜÜü„À\\’Ü³‚2x®[S·Áï-İ~trÉ#1dlŸ(ÜX|Ç¦8ëO†é$ÅÄ¿ºSåBy,JrsÆ@ÍAw¬#Eq,Qm–êãİ	qÙ9Áä`ã>„b´ZIufXì ‚x×;åÇ?ëò ÏŞ»|Àü£šS•ïÅÄŞC*`Õ€Î:î\'=:’zSî#v6…	d,Ìë¸˜”]„´ûÀòyíÒ™×îRŞd‘wÈàŒœ\r¼(î:çê¹‘#¯lU\"¿ÚÒE,É–ÊÇ8|“´çn~÷>”û8ä]6V‹äŠÚ\rÓêwŒmSÔînAÉäÔzEÄ~Q¾cLÑ±Œ¡P~ñàŒc,IÕ= éòÇ0•wq´‚B†#\'¯ºsP\\Fß][Ë¬G›O&\rÀ¼\"rKgÖB¹\'§§JÕãµ‚tÜB°\rû½ıÃ˜àçrGc&ym0ŠBc$£Io7#±ç8ü1Sê3‰åÜ¸1\\Ä	 ¶AŸÒ‚ÆÜ¹ÒaFd\rk&ÿ\0/!r$ÚFáŠ³oz¶šÄxé°r2F{duÿ\0\ZËuŒEç±WÆÒ Ä/ÊFyã§¯¶iòêyq,“Jè°…“ûşnJ®xRFrzp½M\0lYêòëz\nG$#íjY¤(wd ÀE\0`ô¦O­Mcc6·al‘ba$\nşì à?Ùç¨<Xš<o\"*[³´³.\0\0yŒÌ\\g\'$qïsV4KÓl·	4²•ÂÆ«´a3Ä íßĞ\Zw/ø\\Z§‹­ä’ÙÅ€•VHü£!eÜ ®.O$ğÀıj¶™(Yã.Â7onûËŒ`çØ­1õHÍ¯ÏÇïƒ n#rò?\0j;ËeòáeP?t®Täúúš\0ìc×®[Äz}Å¼Ó£ÄÁüÅ»78î‘Æ9úùÿ\0åı Æÿ\0ÙËK7÷ßh×4!ö\r@Hÿ\0½bŒÊÃnôPß~/5É’Ko-„A9ùF[9şŸ}ÿ\0åı©à7Åû+if´íjæ++Ü¸XÈ•Ê$¬1ÎÂXçwC•2WC?eÍ-Cep. VïƒíS”t¬€(¤\r»¶)IÀéš«;\\»LÛšo—§5ıŞÔã+=@|‡½ŸÂ˜Ni1Š3VÀ\\g½5Î\r&ÓëM2níLuUÖX2çş¹?ş‚jË>½UÕí:àÓ\'ÿ\0ĞM\'+ãÍy6ïõ¿øí3Bw}(¬9‹æGAğyš]Fÿ\0v2¡:}H¯Bç×5çŸX.¥~9ÎÔç=y5ßî¡l@ğÙjZ4ån)€õm´ğr*:UnhôRn´\0õéU<AªÅ¢h÷RäÅm#ã°§cò÷¯™¿à¡ÿ\0´Ú|øQ¨Úyª\'Ö´Ûë{lÈW2ª(ÇÇ˜§¯¥>ÿ\0‚£~Õ©ûDüd60ùŸÙŞ{›(nÜ;¶×brIÉB{b¾\\·fIöçkg¨¨õ]nmKT»¹—/%ô­,²;½‰$I=I¥±™mdÌ˜m½zŞ:#)½t-Op\Z0‡B½OéQ¡ûb:Æ›/·¯Ÿn‚³ŞøÈÜŒõùqÉÏ½$—k]›yäœgß™kUbìBñcS»pR?Ç¹°Äcû§¶9çÚ§²Ö|Eı¤“Ki¨¨Ü’ÄÅ7İÎá‚AŠÃâL‡RAëı{ş•4J×dEæcî\")=0NGz6O\"õş´ú”¤ÌGÌÌ7(Çnà{vïÉ©F´d´…Wj¤g—sóÈ=1õ¨¬´=OP†EÎæq•Y1e@şœ÷¥]\né›ÒpĞ·!b\'<ò;\ZÏÚG¹²¥>¨EÔ–;äš5%WhÇ==F)º~¦ğióÆ!²Á‹Û£Ë¯œr}AöÅ@Úl–’•6Ó’ñ‘“zÚÒü56¡§Ü,eUåQ²(Îã.Óœœ~i¹¤®?g\'¢F0Š{…WÛ¸œ{ôıh7ò¼®ÀŸ6Î2@ÁÇOjô|¿Ôå1¿›0²¿2Ì+m wû½+~÷öOÔµê+{Ë$ßóÃ2*0>n½\r`ñ”Ö›G]«ò9¨b…Ùqä¾W!Âí¹89Áş]1\n$iûÈƒHÒo;eİ´…	·åÛ–ÉÉ·LŸÄ³ö· Í1{¸’\" ã ÏÕÍ^ør÷OÕü™á(Ãª’‹Àû¹#<g=OÒ¶hKáfN„ãñ\"•ÃìŒsò¿ßéZW_Ú:•K;@V2r\0é¾µNFYm›æß¸/i?w©\'§_×ÖŸhVÊÊI72Êª!;ä#–c®8ÎkC&˜ß´–ƒn\0ÎsW4Ûóhª»Š…\"\\ãÊ	üqùU?-â|<mvİĞƒÿ\0êıiÑ¹Çñc<çùş”ß‘:Ÿ²?ğLÏÛ ~Ğ?mí5©Ñ¼UáökmCTJ»—*óĞ¦Üû©¯¨üÒ§ŸÊ¿ÿ\0a/Š²ü1ı¡ô‡IXZj*lîU$Ûæn#8çæù\nı¼²ºöÙ^6¤A®yhÀ´gÇjF›\"™š(»µ€	É¢‚qLfæ\'JmÍ&áM6¶i¾e#74•ª95 »¬¦ÿ\0®Oÿ\0 š˜œT7L\r¼¿îäjf€ñÉD‘†zt¢¬Ë‰[,3“ÚŠç_àó–Ô/OO•?Mz	’¼óá×¨ßü¸Ê\'ó5èŒšµ°X˜t¥¦p:SÈ¦•¹§‘QÓ•‰4\0áÖŸº™E\09ÏËÁÁì}+óOş{¢İÍ6ƒ¨GÆŸ`²­ÆÖb‘K#§8è\0{ã«ô¥†áøƒ_ÁUô‹I¼«éWKØÇ%”ò?îc¹ÙúTŸ““ÁÜéLi+“báI a±ó\rßçúÓ/®Ô^·–Y¢É\0°ÚX}?Î®^èÒZJêê€†e.vò>•›ulVt:zv­Œa¸ã!¹¶|¤cv	ú{Õ«:ç[œ¢G$Ÿ˜…<}qT¢´38Ùü€sï_Nüø#kƒ­¯îÌ¹Ô-Ó,„ä\\ñé\\ØŒDiFìô0¸WZ\\¨ó/‡?³ï‹`·œ\\DË>à¦[…à³¶>AwŒf¾ŒøSûéz.É®á·ša×‘œ	æ½SÀ_F‘§ùl>sÆÑĞ‘·è:^‚–ğÏ’sÆM|ı|mIû·ĞúL>•-RÔòè>\0è¾|q;uf|²}:ô­Áğ;CØV-2Î/—[×\'­vĞé¢go,¨Ãr£UÁo#åDqãOï°?•q^W½ÎøÁ-‘â~\"ı“¼?«î‰tës$‡#ä`êAâ¥ğÿ\0ìáïA\ZCkÉÒîßÓƒõí6~¾òWvrWĞZĞOE‹f\0ÀÈÅj§+ZæsPOmO>Ò>i: Q…¬2ŒdóëZrxFÔ.ÓH„`³ù×Wq¦ˆFïP*‘ˆ«`ø¶+÷*3ºØäuï‡Vº­±à‚]Ã`ß+:ŒW™x»ör°»ñ×2XÀåeÈÜ\0Œ`ó^ö‰–Î9ì3Ö ŸNóWç\\ŒôÍ8·˜š‹İ\rüSıš†‡á±slö”™„íBGÍŸN½«Æüi¡OáMbãM¼F2[¾Cùx2($t¯Ğß‰_âÕ´›˜StbtÆòG+œŒñ_~ĞÚ¯öf·’RæØåFw2±“ê}8¯s.ÄÊräg‹™aiÆ<ñZcwqö‹®¬@]Ìx §ù¦ÛyÁÃnıi—6-— €Fî™î}óªèå8çÓ5í>õ74K¡j“Ù·Ù®¬Ü¸RA2\rÌç¡ÎİéÍ~âşÃß?átşÏzN¾¬û®2%wÃ\0ŒşUøSü°J>ÎpÍò’0N}+õßşçâ[[ösº´¸˜ìëï%!È&ò×\0ààúık*½Ä}}æcŞº£4µ +6i(¢€\ZÍÅ6Š(\0¤İC6\r2µŠ[€®Ù5Ëº\'÷Sü>™3m¿İ?Èÿ\0L÷Ğ!¸Œı¡ø?xÑDì|÷çøj+\06>\'•ªßw;öä× nÇzó¿ƒÒ³ëÛ»ªÿ\03^‡˜qV¶¸å~y5 ËrJˆz\n)`9xj‚7ÙÚ¥ICë@nš`æ€q@gâ·¶£ë³‡ˆßWH¦‚ÖÛÍòØ/˜ì®¥v3d+dzô¯h-Å|£ÿ\0_ñä~ı›µhEßÙæšHÕ6<ìH:PRi‘,ŸûGÄz”‰¤BOİí\0mÎpgñÅco¶’w äüÅ€}M[Õ5=‚VãtÌ²±S÷_Î²­ïR9°UŒ|‚§¡Ò¢íb\rÊmJ%vÌjWsüÿ\0Jû‹àF!ğ¦‡…Oœ±\\ã2ª•qï¸WÅ\r4ÕÕ<]ek\"gÏ•FâxPs“úWè7Â.-CµhÕ	hãï®kÄÍ›ID÷òho3Ñt{±É½¾bA<úœõêåÌ\'°‹<g5Zƒ…ä=*uu‘_=z`Õá3İí*¯Ê€v{ëïZV\'nyá‡åYñ•ó@õâ´ µ c®zRÔ/­®Z·Ùº™ö•9<{\Z‰ãhúâ‘Ãc¿åZ	¨²Áº2ùš¡©ƒúÒåİÉÏÇ©¨®È¼\rŞÙ©aÕœƒÃ\0{|µ#O+ VaÈêJ§$6\\qÇ5<r#pãÔšÊ74vw™nşµùõûSxëHøÁ¯]YÄ.-î<‚23ÜÄåAÏaù×è,÷*N8Æ9æ¾ı¶tKÿ\0ü[¾Ô`wk]EXØ¬ªìÜtÁükÕË¤•K3ÍÌbİ-:‘¹IÀ›Û$Âû\n… Ü7`ôÀ<Ôhß>àF“ş5$¿˜¿&JƒŒtÇ§S_LôĞù2m6Õ®%\0â¡ä`£23ï_ªßğK[ù¤ğºÙË{uk`†ŞÒŞX­®ŠÆM#°Ã¹ìsLç5ùH&òQ27mè½Àç§·ZıTÿ\0‚Xx|\'ûf“·E¸ğõÜV\Z½Š…‘u1å†KØƒœŒ˜°	æ°¨µ¹i¦}Â€F€z¾´ æ¡·“Í·FõPyëøÓóŠD½Å\'šMÔRg	Å#79È¦ĞœÓZP‚—8¨e}Ç\0VŠVB»×?/¨¥“|géF=…dcje+¡G¨6ÛùñÓÌl~tTz£2êw\0+JÃ uäÑX¹ğ’&]nópÀò”|\Zô$}şµçÿ\0	ï…Ö·v;,?–MwÑ6ÜÕ­†÷$üèüé¾hõı(ßô¦!ß\np{ÑŸqF}Å\0=fæŸæàıjûŠ	Ïq@	ë_ÿ\0ÁktYOìóaylHµ%óAÿ\0k…ıkí5ny<WÊ?ğY8’ØËWù¾d¹¶uòVU9àöëLÇ}DùQmfÜ~QŸÂ¨[\'Ç§wÖqwæF£hÏsëUËù\\z×EØ÷Á\0ÒxûJ†?˜Ü¸ŒñÛ­~„xıD·L7î¢P£</>µñì7á9|KñNkß#}¾ß#„b=+ëŸˆ_ôß„Ş7dË8+`–o—¾:t¯Ì¯*¼§ÑåMF1è—^ ‡Mƒ|î#Q’FOëP[x’-E·Ç:mng$×Æ6ı£µ¯Ü´³ùºlA±¸sæÈvƒœœõççÚ³í¼#ñsã@Xôû;íKA€«x-ÙñÏÌKaÏ°ãÚ±†¬ÙÕ,kû(û…~!év÷±CöøòŒAïùWK¦x’	ÎCy™^«Ú¿>®ÿ\0bÏˆ>¶7H—SÜ2–uy”¶2>ëïZÿ\0Ä<*bÕmşÈå^ÚY,¸ÈÚNvàö#¥kR…(«©\\ÎJ’~ôOĞkˆ/¾n£¡ÁéROl.{Æ¼‡á7îZÎ8æ{‰1Êò|ÀçO_Ê½5u_´Â’3Æ®UËc¥¦·5ÒIéŞ¨Ë$*äÏP=k‡ø«ñwş]:MIwq±¼˜„›<Ç!s‚98üëæŒ´ÿ\0µ6+mOhf™L…íC¹€GŞã,p:v5p¡w¹2›Šº>¹½Ôà‘Ø,­”ê\n¿•F·êĞî,1Ğ“œ\nø\n†Ÿõ©íç:—ˆ¼ÙœÍ.ofCGÃsŸOnµ¯¿âŸÃ‹·2ëºĞWE\Z‹É$J?º¡yÔÖ’Á§ğÉë$õ‰öíÕÖÜàdc·zó?ÿ\0l~6xQtùØÇs	mçCµ¢~~\\ÿ\0pç¦Zğÿ\0şÙŞ*ğeÂÿ\0lé‹«Xgdl\n©ş/âÏ§c^éğÿ\0ã&“ñ9#“L[ò®»ˆ’ÒP€Š\0z×=L<èÉLë\"X¸3ó÷\\Òn¼9¨Ía{…ÚG‹\0‚+aÇ¸ªˆÛ3óx&½£öÙğu—†~*ıª5t]B<‚8–;»g¦+Ä‹ùò••ôØzœôÔûŸ-^—$Ú,Ùµ2ƒÎsÔvÅ~ÿ\0Áæ…åø‰n%Y3(q\'şCğ¯Íäœ¶Bğ@Ïú™ÿ\0Uø#ÿ\0wÂİGÅs¤‘j:õÉ„êPÛ$hÑåBr\n¹œÚŸuªí¥¦«qJN+0ÔZcõ¥fâ›œĞ ¦Jÿ\0)¦³mnOZc>OZ`(“şªoçF}Å÷¢€÷…ñßô©”l€ò]DgPŸŸùhßÎŠf­nÿ\0Ú—8-5±Ï¹¢°Wá\ZüAy·¼#?zyÿ\0Â¡·^¹íû1]ú¶êµ°=Å¥_¼>´”S`séFyíPäŠUm­š\0›Â°N¢‘pïC¦ÿ\0_Ê€×°¯#ı¸>Ëñ¯ölñ^‰kl·ZŒúeÇØ©9ŸaÙŒwÈ¯[½Sñ¹má­îşíŠ[ÙÄÓÈŞŠ£&µ*1¹üçkzTºV¯qg*§´‘á™Uu;X~\ZÍl3rÇC_B~ß\Zƒ®|k×¼Oá{këM;YÔ&Xç\0¯˜Ç,é×›sc=øÇJùúî	]’W÷²\0ªw&®hNPfÕ(NŒÔ*+h~Ã?ÛÂß\nÚõãıö±7Ú‰Ç!6 UçêÇñ®ïÆ	n~&kª÷j°Z[¶R1É”ôÉãÛõ®›áŸ‡#ğç‚t›ùVÎÖ4#Ü\"ŠÜÔµ¨ô;C!Ï\nz\nùjÕ[¨æÙõ8zj4Ôbq¾\Zø\ráÏ^Ë2Îâü/Êå²ÿ\0*ê—âO…¼2¥Î±¥iˆ8!®\0`İf¾gøëñSÇüGı¢Zµ–)R÷;±ğ	<şşuÊü]ı“-|A£ØİøBçQÕï&‹Ë¼KéQgiÕ‹ïç	·`…?‡Ztè9»Ô†µjÊœ}Ø]ŸbÅñßÃÚåÚÅ§ëúeïğIÇ=N1Zw\Zu½iöˆ£<ïœúÿ\0Ÿzù+àìq­Yü@·Ö|{¡%İ„He··¼G’fxY#ó0ÄÆ+ß~èZ—‚üa¢Øj‰áËÖö«3Ç3Y“ÈË«¦Iå—=Hâ¢½Ãà•ËÃIÎ>ôltÚN’±^)P[…\0`]¾`ÒÙy‡syc#«˜X~ÊÇ¯Á+¯Òõ?ø“Ê»s;Ö0“‰µJi£Ï¼}¡&»¨y’ª¿–:HNã·áúV~‹ğòÇM³Y<¨¡/”`şz×C«ÈfÔH+“ÔÕÌüfÔ\r¿i£Å~l XÄ·7‰	‘àRFRì@©\0Vq“›ÔÒ	%±Óh\Z¾—©ioÈ™”g·zĞ×ôí;_´O´Ai{¶C²©>Ş8¯†¿i†:‡‡>!½æ•}¬ëºiŠefbˆÙÊ°*\0u Gzèe\ZÏ¼+¨ë×:î·¡[évì4û˜¤@%¸.ì2…rÈ İ2z\Zô£‚²º’ûÏ6¦*ó²†‡Ñº÷ìı¡êáŠ[Át;Sù\0qV¼à4ğ×•o\ZFŠ¤)D\0ã‚¼cá/í_â=7ÆÃş-Šö€¾ÛËHğz‚9¨¯£4íj-ZäCÃ€ÀãÔVœ¾2šº¼QòÇügÂN§ÃúÈdb[Y€uR„ŸÄÂ¾^ŒíÏrzc¯Ò¿C?i¿	Eãß„ºÅœ»ˆH\ZhöœÉóå_Ÿ:u´ïª­ŒQ<—(Œ Ág9Çç^æ]8û;v<Â›SO¸û`-ÈÜq¹€8=³ú:ıºÿ\0‚mx>ëÁ¿²_…moQ¯iÌd.ÂRH‘×#Ÿ˜Œ×æ7€?fmK³µG¨Üj>jLğXÉ&<äåÊNÑÛÔWì¿Ã>ËMğN“œ–1YÂ¶êÿ\0xF#A÷Æ+xb!QÚ\'6\'R„bê-ÍÚ\\“IšBG­tòèr\nx¦;àõ¦ÈNs”ÆmÇ½\n=ÀN´mö£ó¦³mÓZ\0ì{\nMÃıŸÎ™ç{~´Ê4Wl/¨üÁŞ’‘—q¨•¯¨c¬\\Õ®†:Lãõ4U}lí›¾?å³ÿ\0èFŠç_ál¼Asƒÿ\0,¨®ó8¯6øB?ŞmfæĞr+Ò7QV¶)®¢î§+qLÎii’IE3q§‘@DûW¯éNóG¯éQQ@†Ïq^mûWê¿`ø#­&yº‰`Æ~ğf\0Ê½!xAÓ¥y‡íg£Í¬|\'¹òT°Ğ¸Q“´°ş\'øNÇV	E×‚–×?;ÿ\0i¯OáeüpGæ-®A1®mûÙÏÁú×ÅÓäÇZu­Ò•uº8oc_£:ŞŒ5yã¶”G$s[˜d†w`m9ç­|qñ«áÁø_û@iãÎ²¸^)<½œä‚¶áİy™ekEÒgÔçX^w\Zİ·t@%µŒâ\0gÖµÿ\0±æ2oS× U:ÜÙ²)2~õÒiğïˆtÁÇæMj][cÔşÙİÊdX•$öQÍş\nXH<¶1£¥wñÙ†?0÷*Ù§÷ûâ’ĞéçîyíÇ…\Zâ|•ƒÁÏ5³¥Y¶—ÔÊà`cµtwVé8!cÀñÖ³®“Ëãë7vZ(Åh<¿›{ŠÙÑÓ6¸Ş¹û­Q\ZìG$(ù½ëfÂïìÖ¼Œ–è}*yYf6±jF§\'\\ãËš|ÒÉwc \'t®0ÄòÄœşU‰®Z)Ä‡*œûUïˆïÌ9õíB‹Nàr²Á~’²É½Õ‰\'qÎzŠ	A|©ç@]BœØO¥wçLŒKŠTöÅK6™D6ª‚JÛ˜É»\r¿Ã[K›…†Ú¹\0éÍoØh‘éí…v(ì+y,<•íùS\'Q2piy‘)$?Ç:Cj~¿…?Ö<D®ˆqøã|iğÇBºÑ?jü˜âO³_¬RÆc%U$p§A’+íÏÎ­cp\0ÏÈxòÏÁı9µïÚŸSÛ#7\rsrIÈò£t%~¬pĞ×£†“9Xóç:‘õ=ÂßÃ&é\'“o˜Í1C\'sÓô•~xx,\Z%ª”,H\0ôE|+ğ»Á÷3ñ<Z\\÷“\\³n ã\0sÇÓ5÷„y0*Â€+§,ƒm³!šjœz’ù€÷¤wãƒMÆ;\n7è¿{gÌ†ïz3î(Ç°¤\'”\0¹÷ÙÈiwö:äÎF?J:\\ÑIœSD˜÷©¶·Ùæ‚qM-“šBsS>ày~¹m^×wïşÑ¢®k0gWºùOúçÿ\0Ğ©[á\Z“â;–õ‡úŠôZó¿„-\"ø–è66}ŸŒö…z%ZØO`ƒÖ¤Iº\nˆÔˆW9¦fK@84€æ–€&QÓ•¨Ù5KÄ:%ÑnlnWÌ‚ê&‰—8È#×µ\\\ršeN:ÑÒİÇÓº>ø­àé~üC½´}Û­fùw\r¡£8eaõ\\~µó/í½á‹xåƒSwòŞÎò	¢fÂ‘˜ç?…~“~Ö_â?…Æ¡amCNWw]ØóbÆX¼Lú×Àôañ#Á7ZÜ‰ÉŒI\rÆÌŸ—æQÓxäWÎÕ£*ıİµÃâã‰ÂYîi¶¹[E&ìùƒwçÍmX]”TÀü4×·şø~øñö­>HÁNÑ»õÍu–’™|²¬N<ÖU’R1ÃŞ×:xîL«úTğ9Æ3Y¶×<àv«°Ü¢Œ¶\nÈì4×*xô?Zåüw|Ú,#b–yNÄ¹5Ù¤Èyñõ5ÇxÚåañeªIÂ˜\\¯¹Êæ¥­4TmØÅğ¾”èŞmÎK‚®ãAğ»k0†5	Ë:Wüsı¦|%ğA­m5@Û_]âHaKw•™y;GƒŞº|^·Õ4h®ìçK¨n#•;v‘ïÎqI&—¼t-]‘ÒëšRyr!Û\'QëXŞIt»Ï±¾ÿ\0.BYY»{f¼ïâ\'íyá_†^&ŠÏ[ÔÙ¥=VÙäôåŠğ5é~#³¾Ñ¢»·e€í–)S€şãó5|¤ÎVG^–»‡JI ufÊà\\BŒ:ı*¾£.ØÖ•‘ÍÎÛ³)Ë9<ôæ³ç¾ÆTôúÔ·×=HãV\\Òã;¹ç½1Ô*k2§“#áR*ğoÙ/C3üFñŸ‰f\r™®æ³…6ãhİ–9üò¯oÖåX´«§Bç™ÚkË>\nÙ^êfk[8Ê½Ôœªàff/·\n}Éş/å]wq§hõ9©[ÚŞ[#ë_Ø‹ÁR^ëwºÔË¸[#[¡+ÒGÁ$÷xüké¼‘ßô®3àŸÃÅø]àKm7!®˜™îz4×ß P>†ºíçÔ×¹‚¤éÓQgÍcñÚ³™6s×&£ó½¿Znóêi+´ã³ÜíúÓ]·\ZBqI¸Ri	À£p¦“FÀ+šJ(<\nMö\0¢˜%ÜøíD¯ïY»½Àà5‰öµ×?òÙÿ\0™¢Ÿ«¦uk?å³ÿ\03EefjPøI6ÿ\0]tâ~¢½}yÇÂ?—Ä×ŸõÇúŠôUmÕKa=‡‡É¥Îi”ƒLÌ|¾´õ›™N\"€%iÁ³PR†+@ƒƒK¾¡ûFÕéúÓÖLĞ!ù×ÓïÇùükäÿ\0³6±câ½NãKĞ$¿Óî\\É–¢=Êªl$‚O·Jú¾‘†áş5J*jÌëÃbêPwùÙàoj~ğü\Z.³a6™}¥î·kyq•]Ç`‘½ë£ÓÜ+ü¾Õí¿¶ŸƒÈ:>µQ,hd·ºe\\3g	 sóÖ¼6Ê_-kÅÅÒpsYÎ<ìİ·}¯Ÿ^õn°ëÆEeÃwŸ ÷¥kÒ²ä•FIÍp=Ï^*êçQa©o…Ü¶P¾µÊü@ĞÏ‰`E˜Ã<J•şGØ÷«ÚB~+?û~mJVŞóòçÓëCer¥©ÌGàq<³hØéw²J™¤¶óqŒ`¶OoÔÖõ¿Â;3oæ[Ï5˜`	OJÛ6R wglUËO+«$7–¯ác‚1éM>ŒÓßèsŞ\"ğ>Ÿ†ÚM:ÃRH¾m·,Š[H#ÿ\0\Z‹Fğ”¢âòììlâ9Xm××ŒtŸJ×Õµx.‹n¿¶2zg\0ûXµİjÊOğ’rñ¥;½­.Î×M½6ÖYöË›­Äg§©®[Iñ<†ñ-¦ù]»çƒZÓŞoà*µ[œÍ\\šô‚G|÷‘+ml¶vÕ‰/ÃßNI|Ä=OÖª;‘Q«XËñDm{áûÈÖ?4ÉUP@ÜOõ¯@ıÿ\0gK¥h·ú¶Ú=¼©~®îóáÂí {úb©üğ­¿ş)iz}Ìmf¸¸Lœ0ŒnP}‹WØ–péöQAo\ZCJ#Q€€vía()Ú]Åâç	rAîYQ´u4¹¦ù”…ò+ØécÉº›æûSKA8 È¤¦ùƒÖ‘›\'ïb€EDÍ÷³Oi\"÷$sI«€4¡M5æÊñô¨ÉÉ¢’ˆh&ŠGo—@qZ³ãU¹ÿ\0®­üÍ>£l²j·¬ŒZ+Sá/$»÷‡ÌW¡gç?æßâ;¯h¨¯EŞ*VÂ{ºœ­Å3u(ni™’Qšnò)CPÕ©ÕlSƒæ€GZh~y¥Ü(H¤Ær~õ(9[u8gŞ€9/ü,Ö­#Íœ[4Ğ¨<™æQø‘_E!Bmu;YHèGWŞm’§Üb¾Cı¨>7ÃŸKzƒ\Zv±+ÏÛ…CË¦~§#ÛÖ¸1ôïeĞõ2ê¼²å}NYn†Áş×\r,¤‘õ¬¿íPLg¥K©/\\şµóİO©¤îK¨ß•UF+ä‰ö®{ÄßáğäMm•æpOD§5­z<ÈÃ&q·çÁ¬M_ÃöWv«$–VóHvé\"ˆ÷È¤šgT\"›Ôåtÿ\0ˆĞx–ŞGûKŞÜç\"”cŒt­H¼mo<æÊı¶’ GmÊ@Ö¾™¬­Šš(D+ÀM™ØZ2x»G‰B¼Ãó˜üÅh¬w/f•š9x¼B5+iz]ì‘qµví#=zµgŞøÎoß§’òÚ¬œ§BO^Wõ¯A‡Æz|Öám\r»ñ’O\'ğâ³îKëH!3uP¼}ıt]Uå¶„ÚO‰·áŠO/Ë”àîÛÁ®¢ŞrÑä’=;ÖZiêéİ<²Q—ÛéW¨ÃŒûÖ|Èóš-Hû—=³QO&G\rÇ¥Q}P3pWóª×:¶ÅÀ‹|ª%˜ğ\0ú’mO]:îÇ¿~ÅmCYÕš=ÛJZÂùèÁYŸôe…}ƒj×ğ/À#á·ÃË;•s\"‰îAÇúÖUİÓÜ\Zì7WÕaiªpHù,Dùª6M#ìÏ?Ú™œÒfº.Iæê)²)›¨Ş(´Roo\0Š7\nilÒP÷\n7\ne&á@fæ“9¤Ü)ğhép0o#İw/ïŸçEM2+pİM‰©Ç|%ˆ/Häù#ùŠô%pÃ­yŸÁÖ\'Ä·™=aÇ×‘^‘·éùT­…\"ZÅDKÅ=[+Í32O0ıiÀäTY¥É%(b´Ån)AÍ\0HE-Gš7P”¡ÈïQn§â€æZò¯ÛD‡Uø+;Â\ZM=…Ò6Ü•ÆAúšõ=Â¹oz`Ö¾øßƒæi·\0ëå±¨©”SLÖ“jhø&×Uİ.õÏ9©Òoô A%zZæõÓ%¦àG#Ÿ~•_Añ²ÜK²Vhİz‚+åå}²¡+hz]¢	\"İ×Ò–X3´œõö¬ÍVóaÛ¾Õ»aó¯<ık›S±=J’iqH¿ê=rFj¼¿bÔX´¶ñŸ¨ë]-’ S¸/^x«ÌåG–ê­ÜWs’·ğT:4Ÿ¹·Q×Š¿Ÿå b˜5±Ó4øqÁëN¸…\0ÎsÏö›–æt1ÿ\0£²lUh‹hzõÇáWo¯RØîÈùyé\\ŠüY±¾÷ç*mµj„±8ë‘W>jRñ¦›<›L÷‘Œ8œuöæ¼ÖûÅ²ë—ßf„ŸÄÀsjëü>Ïar&wÅ´‚<¥vQ²g*:3ôz#…çŠ™PÛN³Û£Œ ñOÜ+ëcª¹ñQì?Ì¦“šMÂš[š¢õEGºÔ’Šu¨Şe8ŠŒĞÙ°i”g4€æ€Š	Å&áKÈLJO={ÑMtËO_Z+SÍşø¨®Èïşb½6ßØW›ü\"|ø†ìzC×ñè™\"¥l\'±6yè?:B™=ÿ\0:[kfç{~´ÌÇ§îCOnn†¡ó½¿ZU—stıh}ÀÒ«â¢üé^	…\0XÜ}(ŞsQy§ÔÓ‘÷M\0I¸Qº™š(û…T×­şÛ£]E‚Şl.„ªGõ«¤vùHõëLqÑ¦~jjğ™\"wm zWâİ\Z_¾ËƒÔu¯PÕm>Í©\\ÂÃ˜¦’2=0Æ±õmgˆá3šøú“å“Gİa¢œ;ÁäÑo-Ev&à˜b\0éÍz¾ãk]NİL3ÆêàÃ<ó^Câ_¤ŠNŞ€ãå¬+-OSğ„¹·C1°ôÿ\0ëTÆI«£¢ÇÒjÂE)÷{\r>ÓÄxqO—Ÿ½Ô×‚Z|{ºÓÿ\0×C\"¿F%ø?Yÿ\0†·»ì1wÆjì=ĞëffëÉçƒDúø†Üîº{W„ÉûG[4˜;±~™óªÚ‡ÇY/ÁK+k†fé¸ği=Ç¦xÓâ,\ZU“nš\"Ì}+Í/u{ß]m]ñÃ»wÊ>ıgÛi×¾\"¼In¤f\\œ¯$×iáı+D@£{â•ì.xcD[XÀÙ´ø®ÇMµ\"¹©>ãÖ³4»óÒ¶†%üªTîMX¦µ>êøSâñ\'Ãİ\"ìù–P—À?+lt;Æ~5ù‡ñƒâÿ\0ÆŸ‡öĞê_<]pš]„cÎĞŒQÎÌGÆğ@åIãu­/Ù3şC¬İxêÛÃ¿´Øcâd³}A-›MrÊ»ç‹\0Ærçø}ó_[†­A%¹ğ¸œ<éMİh~•îÖ·UK]Rûhæ·™.`™CE,l$g ©|Ş+°ãæìI¼ŠU|š‹Í¥Ph¶$/Í‰¨„¹£Í>ô—q›ê?4ûÑæûP»‰¤-GæŸzF‘ˆëúP¥‰”ØÛåå¿Jvh|Ìÿ\0	ü¨¦ª6Ñó”V&§•|”·‰/8ãÈş¢½uy¿Á¼¯ˆï2ÜyÇâ+Ò3š•°ÃÕ³KQƒƒK¾™˜úÅ3ÌÅoµ\0I¼úš7ŸSLdÓ‡4\0ä|7&ŸæÜ~U(\'(”ÿ\0¥à¨Ïj«y}Ÿi,óË0À¥äw`ª€u$“À¯…¿nÏø+Şğéî<1ğÑìõg\n’êûØÛZ’U\0Æ÷À†ÀÉôªJû•f}uñ»ö‘ğ‡ìÿ\0¢›ßj±Ø,¼P*—ã0Š;ä¸õğŸÆ¿ø*/Œ¿i¯OàÏ…8ğÖ‹N±¬O›ÁlFĞ\"å•]ƒ209¯Ï¿\Z|ZÖ|s«=æ«ªßj·“i.n§2I+1É9Éã9àzšúsöAğÔ\Z_ÁÛmMyú¼³M+ãæ;%uAøP+ŸWØQæ]NÜWª¢úÙ¥Èc³Â\0»ÎXñÔšÓx<ÕÊş•ÎxjëÌ<ãƒ{WOÚ1Æ=kãªË™Üû8G–*&»¢faó(9=+’½ÓÄH9ãé^™¦¨³Búõ®[XÒJ?<ñÇZ\"œQ¢8´ğ¼7Œw Ú¯Z|%Ó®mÇîùa\rk=¯–q´çúÖÏ†.„wh¥¶`úu­T´(ã ø#a¥¾ûkpÄ’X³jì>·ÓâÏ”¡‰ÆÑÈ¯LÔ‘$·Üvæ¹©íÄ÷ƒ ¤Ù,Ä°±6v’3Ÿ¥niÖÛœ|¼T0ÛÈòˆpö­­.È¶~föíRI{N¶ØœÔ÷ÉäÛîÀàúV…­°Š\0O\'ÔÖ~»(U>™§r¦¼ Ü¶I9ãë^YûY|ƒÆ¾“Ä–¬zîOæƒ<J2ÈŞ¼cøúW¤Z÷Ù­ˆ7ğèŸ\nõëÛ²¾M®›;}|¦\0®Jº8‰ª‘p9ñá85#ä¿ƒ_¶¾Ù$>ñ6£§Ú¨ ÀoİŒ•gÛµ}ÙûÁ\\tÏˆfÇÃŸ¥ƒMñÌËmm¨[@EæTm-Îcrx?.Ş{\nüŸÍær3\rhéú—ÙnÃ|²!Q½sòF\n‘_p|?)ıÅz—P¬‘É½CSAcÚ¦•²¿~*şËßğQOşÍ(,´ıB={D\0ÓuYd+l7V#¸`sÇ÷7À¿ø,?€ş ÛÆ¾(·¸ğ¥Æ¼˜{«eÇûj¼g¾”¹r³ì$|7^)şhõı+ŸğGÄ}âN¡ êÚ~­g*‚³Z\\,ÈruÆ¶Ç4Ó¸¶%óG¯éGŸÏõÅEŠ3Í\0N­¸qü©’I‘Á¦+í©(ÑäµK¸¯J‰äƒõ§ù€uæ¢{\0èíÁAÏj*D\\ ëÒŠƒSÉ~¶|Iwïõé\nÛkÌ¾3İn9>FOıô+ÒÁÈ©[\nCüÊ<ÊmÌÇy”É¦Ñš\0’ŒÔ{«/Æ^8Ò¾ø~}SZÔm4Í>İK¼÷3,H¸õb2x<wªQl\r7–ÅyŸí#û[x3ö`ğmî©âRİîmai\"Ó¡™\rÕÓ€ˆ„ƒÉãœw¯†m/ø,N£âh/4†‹.‡`,šıÒ¡à`–X¡*p3üDçƒÅ|\râİx“Rû^¡qusq1i™ç¼—RLŒ:/®«öl¢ÿ\0l?ø*išÚËS»ğg…÷Nµœ5ÅÂæ¸ÁŒü¹#Ÿjùjï\\÷ÈîÄ´ò·ÎÃØrÔVUíËË1%ÉÜÄõ§F>Aô«ŒBUWAÆbö¯¯¿a?ü3»ÒÃI¢Ë¹T·;%fnÇÆ¾<.Pÿ\0?jïÿ\0f_‹oğ—â¥ó,ge·¼ä©fáŒ×a‡uiYt;2Ü_²¯Ìözré¬Öº¤‘v\'9ØZÍˆ½rú„a.c¹ÖHäPDˆAVÈìG}+sN¹ó\"Ç^=kâe¾§Ü#nŞe™1TµK$º\\?*‚ŞFI©§fù~`x9QmŒÊ“EXÜqæ¸Æ)n|1ºİÊ!n€ÿ\0Nõbñß>áZix’Ã‡g j¤0-¬¯âO.G,¾¹<\n¶4Ö7/ÎOzÒxbp;‚İh–é-ãã=ª…rµ• ¿Ë1ëZšrßåà•›\rÏÚ¥ãôïZª|¨³Ç° ‹—ZàCjrs\\æ±zdr3ïVïn^lªœ\nÌ?=é;ÛB/¨ßYù÷¿ÍÏæ?ğP‰kà¿„–z%³ÿ\0¤ë²Ÿ1AùŒwBH¯aÑR-Â{¹ÜEº4²;P3“_şÔß¿áp|^Ô/ÑŸìËö{4c‘&ÕşŒş5ß”áJÜÏdy¹®%S¥Ê·g€dÜÊ¬ÅGE©­ÔFœ°œp[?Aæù±IÀÇzn\nn!†6ŸZúö»,ßby±;2v+9ÙÔ¨ëøôÅO¤kMÿ\0/˜‹ †Ç¯STQ|×ûØ9$œöüx©ÕFô9Şr¤œ/Ë¡¨åÙêÿ\0ÿ\0j_şÏ^!´¼ğÖ¹{eåNÍ=°æÒğvHÎW×ç#¯jı3ı’ÿ\0àª^	øùg›¯Lñ$Q =BtKk‡<„Œ‚pyï{Wä,WİY<Š[ÌÉqùPpG¯£¨â¬häÏŒñägHäŸáúş•.ëb¬Bzv©±d.-n!¸…ãpÊš²z×á—ÁßÚ{Å¿µ˜nü7¬ê:ZÛçtyYb`À•¿•}½û0ÿ\0Á`ìüC$\Zo­VÙfãûZÑ¿wØócÂíA<â…5ÔV»üÊzŒšËğßŠ4ïi1_éW¶ºŒëº+‹yVH¥r¬¼\ZĞSëÒ¯ru$oåIBà};æÎqëëJK¸ìÉT£æ=(¤É^=8ëEdhy\'ÁåÇ‰ï?ëßÿ\0fé\"b£µyŸÂ Ñø®ç²´?Ÿ\"½*¥lC}ùçÚ<ûS)c=N=Q$yö®âWÅàÿ\0…¥Ö<I©[éZ|\'iA “Ğ\0$×È¿··ü£Mø{/†<ı›â?Æ\0»¼2î´ÒóÉRÃåy1·€ÜnäWæ_Åï ø×âY5ë×úõÌ¤2‰ç³Gè¨ŒH\0gµh©Ü–ì~‰||ÿ\0‚ßhÖVÓ§Ãİ6kÅJKR·òâ\r»-7îlFGqšøKöŠı´¼kûHkFãÄÚ³½ª1kkhaDTÎ9Æ>µä:ˆ^òmÌD¤/?,~ÀVl×ìI$–õ5ª‰ç4eñdÂİ¥ÎY¿3Uâ|C,œä¹õ5J Z@~µnå¶Ãü<z¢[m•VLËÍJ“øçò¨cûù©üôÖ¢&oœ1¸?J„Â~ğè½iÛ‚¶IëÚ™,¸íòôĞÆµgÔ±ÿ\0í7ÚM—ƒµÉˆ‹ı‚á”ñ’[cÛ%ˆã½}O£Áè_c_–q\\5Îänœ‚8¯©¿e/Ûb-môÜ¢ˆµvi¦ºäuæ¾s2Ë]İZKä}>]™İ{*¯æ}lĞôÇÒ§€f,7ÍÛÔí\Zâ×]Ó£»²¹†îÚe’ÂáÕç¨ş¼Óš=>½=+ÀäåvgĞ©¦®ŒûûA+9>õI­dN›‡µmŞÀLfÉê(Ğ.U\r,rœR´r\\I×µR°8<zZÇ2x Eı&ØC;\n¹+—üi4ûfH²i\r´—WXŒÓJær’½ˆ±n1V4ıî.W<–àÜÖ—öri¶í,Åc‰9i$!~¤ğ?\Zù‹ö¤ı»m4k+­ÁÓA<íˆç¿Ga°†!–1Ç ù³]Xz«.Trbq0¤µ)şÜÿ\0´ÜPYÉà½ådYn©*§İ`ØƒìTæ¾M€}óœÔW7òjRI4¯$’»YÛq9ç$i‡t²un·½}^\ZP²>W]Õ›obÄlşnHçªÜÅTãƒÀ UboaÇ¥8r ár?İé]IXç$¨ÙiÆ3S\"¡ü¯Êüãå?&29÷çò¦Á–gY¥xS€·ÍƒÁïı)6³Ÿa”t8æ6Ï5p[—4è¼Ë%QÎÒHü…‰üšŸMÜ³ò@v#NŞ@,qÏìæ£´„İXÈøfL\0Ç—§¡õ?¥Iöém¼¡€ÏÈç¶3øHÔ½a4Î2‹‘§<İ1øôç¯½kZ]MªËh„W)jnŠ›Â„+•g“ÈÁ=ëK” f,¬èÂFŒ¦U—1®sş5sÍû.™‘9$E9 \0àãÛõ¤Òhhõßµ‹~êm^šÇí2–%Ex^B2.03Æq­}éû(ÿ\0ÁX4ˆzJYxé¿±u”Ú’]Ç6w-–ÈÉCŒp@ï_—öæj6É4ƒlğ›÷\"\nç98İò^µmf{¹L&]Ê»e(Ç<ÎÒ8#åç<t¬nÖ¥èÏß\r_´ñˆ¹²¸æ$,‘Ÿ”â¯G/”ÙúWâÏÁÚãÅß¥ótÍUì.ì,ÚVkIÔ™9h”ã9ÇÌ•úAû!şß~ı¤´ña~ÖšŠ¢*§½ÆõºÈ?4N@\r÷[å#ĞçufK‹>Š{….ryÏ84Q’#—œpÑSÌIãŸ/Ì¾.6ínßÌW§äšòoƒÑ\"øÖfB@0‘ÏnV°ÿ\0k_ÛÃÂ_²˜ñj2½îºcWÂË\0ÙÃ9Îàù5Q2±“g´x‡Ä¶Òf¿Õ/-¬l­¼³O(GRI5ùËÿ\0ÿ\0‚¶kÛŞø\'á}õí›	írLİE·-È$¨$ó !†ÑÉ#å¿Ú÷ş\nãOÚ{W+ª\\Çc¤&õ†ÒŞ=W9À’{rÇ5óÍÖ fİ†1«œõ~Ü‘]Q‚JÂ¿sGS×[ÙL²™šC½†íÉ»¹\'»tíY’L÷+ó>UFoÓµV\rÏ?…;±Ö®Æm½IvôÅ7vÍ1şZj¯ôìÅÔ³§!oŞºƒëÛô§Nÿ\0»>ãõ¥_ôk$Oâo˜şdJlËşŒZ•™Dj@ûj;@5\"©eİ@+ù”ªsÇğ÷¦1ÂÓwn –=¬xÈÎAôöªÒÈeaÆ;Õ0…Í+[ùÃÃ&‘j]ÏDø%ûVx¯àÎ¡Øµ¥°/™låmñ¸Æ;ƒ;Šú¯áŸü3Â^6Ã«Û\\h—¸Uy|Á$Ç¤‚?\Zø\"â³œzÔEXè¼ŒW#/£WVµ;°ÙjZ\'¡úßáÏè>1µišÆ‘z‡şyİFOâ¹È§ßé. ‡ÔmÉÍ~MéŞ »ÒT´3¼~ëÖºö„ñg‡¤O²k7qí\0×—S$¿Ã#×§¦­4~™_é&Kt;~n=r*æ¢1##óùÍ§şÙìĞˆüCpàƒ\ZŸı–¨ë´÷|B».õÛ§ByUÂƒùYaÏ¹o:¥m?MµIğåƒÉ¨êV(ƒ%§¸TÇækÉ~!şİşøpd[#/ˆ.ÆälÊ±+å²N>‚¿=ï|a{¨I¾k™d~ÅU3És¼–İëšê¥“F.ów8jæÓ—À¬{_ÇÛcÅŸ®ÛíÒiº[`[wÚ‡äoÆ¼vk¯8î\'œç\'’MTIµcÈy#İ°/Ç·µzĞ¡/póªÕ•MfîMîéR†#¿×ê(ÙQ\0æäb§\"µZu±pI°~÷#-ÓŒ1ÓÓšm¼¹$ç°ëP#şê¤±?¾Oºàç E0-nØ…_w\\œ…I72y[†H n}¹¨0ïÛò§o7H‘àÉëÀoçPÓÜksR†C\\ÍæI•‘ğì+ÇCÉ=F8àšrÉçL’cq1¦áŒüÀ(búÔZ-ÛÅ§ÊŸ+‰v©F<qÓsëWã‘NÆ‚C¼ÊÛ˜€ß*eq8ÇQÏ\'Ú¤Ğ,ŸÌ•v¼q¼ +çîcä¸È<sëÅ\\¶‚I\"kvQ7ÌÆ¨2p\0ÎsÓ¿·JË6¹‹÷x<üÊzúõíüëY¯&kxØg\n„È#hàû^¾õ2ò\Z-İ@Ûá]Š+y-\"ƒ…çO¨\0t ó÷Ex‹í+;±;ü¶älÉ¿ŞàòNµO¨*K}0£’›Ğä¯,\0o^üõ©&oºYãòæˆ4€Ú\n‘\'òsÛŸÎ²,Heû~íìb—RgŒâAüYÏN3Ó¥uºgŠ/¼x×ºuüöwvÏ¼¬YWg\r(WÏ]r\n–³Ñæ¹ÿ\0IŒâ!/e“~26>]ÍÔ‘ÜzãµÉ.ÿ\0RØ a—7“Ï*˜•\0÷Ï8à\03YTWØÚ–úŸ[[ÿ\0ÁAş,iVék¿q,6Ê\"æÒciW€Xäåˆœ{Ñ_:Câ]>(•²´Ù¶€<ÇŞıÎÖ“ì1éErZ]Îßs±úñ‹ãÄ³WÂÏx©¤E»·ÓeOI3¶[²§Ê^9ëùWãçÄ?ŠzçÄ\\êÚî¡uªjw„g¸•¸\0wú~úÃûNø\Z×âwÂ=_J¾ÿ\0Usìb»¼—ÛÃê¿!o,„WóBÍ»Ë‘“8ÆqŞ½,4“ĞğjŞ:™ÓÈe“¯OÖ˜>b}ªY-ö’2x4Øcıç_ÒºvÛÜj1SÒ¤5=¢QÔf”DµRYÎXqNw°r@àTÏn\nçÒ–ÖægüŠ ê_ŞõëM¹ËÛãîñŠ%Œ<ßJ[¨ò¨2zĞZ+ªãç\"¹fÅ*Ç»J|q|¿¥J—WD#\rLh‚¯NôàTo•©;ÕÉ­•ˆüúSÕDD÷<Òµ+F\nÔ“Æ#U÷$Ç^Ù ÙFÄOnUÀŒàŸJ…íöpß‘«Â/ƒÎFsLòrÃæ4¯âFsëœTŠ»›ÿ\0­W,Äy5\ZesÛ=(ßr}Ò?\nrÛùjI<dc ÔÌÛP{Óf^W®1Ó4;$à½Xy²ÿ\0/Ojb h¶ã5=µ°I:ö *n~KT­6ÅÆzr3ßÚ¤Š/Şõ¨x¿@{ò:Pdñ,f“qØÜmã¨¤±p?º=“Ä§ğúÔ–p	#$öã@Ğù#VVäu=¯4ì‹™ÂŸ”de±’3J°nr	?QÒ˜ÔÚ\nñıìÒ{diZIäÚ#d39mÙL&?8§ÈWæÙ\"qÁèF}†õGKa,{Ï+‚NqŒ~œt­!–C(t»BÓioâãÛš—Av9o]Û@úJ»yo5½¦$Ş­±]L‰Ô‘€z¯}ë6i<¦#Ÿõ{»tÏN}êìSMy­$Í \\ª‰>m«°¶?Î¢æ¤}x²ù^O¾cÇÚ9ŞIÓéÒ´\ZôŞÁ~%F·#Í´6VAòã?7ÊjÔ$Íºœ1H]”‘Ñ~o—òã=j×ˆ9-o¥Xü³k0e\nŞ«!ÇéÔóïXËskÃDÖé»÷`‰•_i—Ìÿ\0[‡$—ÏàÚµ5«Û9îµ¨¤{iI&(üÍà–iwØ˜v\'œÖÏ¿Mk˜ÿ\0uS”òs¸ÂLœŸ­nx7Ã1x‡ÆqÛHì±J@‘@á³¿?JÎm$RmlwúN¥¨j\ZU´ğèzSE4I\"y*@#©ÏJ+ê|ĞÃZx66lE´`Ÿ³¨ÏÊ(®S¢ìÿÙ',NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `seproposal_component`
--

LOCK TABLES `seproposal_component` WRITE;
/*!40000 ALTER TABLE `seproposal_component` DISABLE KEYS */;
INSERT INTO `seproposal_component` VALUES (1,1,'Policy Advocacy/Development related to the Social Problem being Addressed'),(2,1,'Continuing and Developmental Partnership'),(8,7,'Training/Capacity Building for the Partner'),(11,10,'Continuing and Developmental Partnership'),(13,13,'Training/Capacity Building for the Partner'),(14,14,'Training/Capacity Building for the Partner'),(15,15,'Continuing and Developmental Partnership'),(16,16,'Policy Advocacy/Development related to the Social Problem being Addressed'),(17,17,'Policy Advocacy/Development related to the Social Problem being Addressed'),(19,19,'Policy Advocacy/Development related to the Social Problem being Addressed'),(20,20,'Training/Capacity Building for the Partner'),(21,21,'Training/Capacity Building for the Partner'),(22,22,'Training/Capacity Building for the Partner'),(23,22,'Policy Advocacy/Development related to the Social Problem being Addressed'),(24,22,'Continuing and Developmental Partnership'),(25,23,'Policy Advocacy/Development related to the Social Problem being Addressed'),(26,24,'Policy Advocacy/Development related to the Social Problem being Addressed'),(27,24,'Continuing and Developmental Partnership'),(29,2,'Training/Capacity Building for the Partner');
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
  `seproposalID` int(11) DEFAULT NULL,
  `subtotal` double DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `LA12_idx` (`seproposalID`),
  CONSTRAINT `LA12` FOREIGN KEY (`seproposalID`) REFERENCES `seproposal` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `seproposal_expenses`
--

LOCK TABLES `seproposal_expenses` WRITE;
/*!40000 ALTER TABLE `seproposal_expenses` DISABLE KEYS */;
INSERT INTO `seproposal_expenses` VALUES (1,'a',5000,1,NULL,1,5000),(7,'dsasda',4,4,NULL,7,16),(10,'a',1,1,NULL,10,1),(11,'e',2,2,NULL,11,4),(13,'b',1,1,NULL,13,1),(14,'g',1,1,NULL,14,1),(15,'t',1,1,NULL,15,1),(16,'s',2,2,NULL,16,4),(17,'v',2,2,NULL,17,4),(19,'f',1,11,NULL,19,1),(20,'se',3,3,NULL,20,3),(21,'cc',1,1,NULL,21,1),(22,'asdf',1,1,NULL,22,1),(23,'h',2,2,NULL,23,2),(24,'y',3,3,NULL,24,3),(26,'a',2000,1,NULL,2,2000);
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
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `seproposal_personresponsible`
--

LOCK TABLES `seproposal_personresponsible` WRITE;
/*!40000 ALTER TABLE `seproposal_personresponsible` DISABLE KEYS */;
INSERT INTO `seproposal_personresponsible` VALUES (1,'First','Email',1),(7,'sadsadsa','dsjakldjsakla',7),(10,'a','a',10),(11,'a','a',11),(13,'b','b',13),(14,'g','g',14),(15,'a','b',15),(16,'b','b',16),(17,'v','v',17),(19,'f','f',19),(20,'bb','bb',20),(21,'cc','cc',21),(22,'ff','ff',22),(23,'h','h',23),(24,'t','t',24),(26,'Namme','Email',2);
/*!40000 ALTER TABLE `seproposal_personresponsible` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `seproposal_workplan`
--

LOCK TABLES `seproposal_workplan` WRITE;
/*!40000 ALTER TABLE `seproposal_workplan` DISABLE KEYS */;
INSERT INTO `seproposal_workplan` VALUES (1,'2018-10-20','a','10AM','11Am','a',1),(7,'2018-10-24','dsadsa','dsadsa','dsadsa','dsadsa',7),(10,'2018-10-27','a','a','a','a',10),(11,'2018-10-24','e','e','e','e',11),(13,'2018-10-31','a','a','a','a',13),(14,'2018-10-31','g','g','g','g',14),(15,'2018-10-25','t','t','t','t',15),(16,'2018-10-30','s','s','s','s',16),(17,'2018-10-30','v','v','v','v',17),(19,'2018-10-31','f','f','f','f',19),(20,'2018-10-31','se','se','se','se',20),(21,'2018-10-31','cc','cc','cc','cc',21),(22,'2018-10-31','asdf','fda','asdf','asdf',22),(23,'2018-10-23','h','h','h','h',23),(24,'2018-10-30','y','y','y','y',24),(26,'2018-10-25','Activity','10AM','11AM','a',2);
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
  `targetKRA` varchar(500) DEFAULT NULL,
  `targetGoal` varchar(500) DEFAULT NULL,
  `targetMeasure` varchar(500) DEFAULT NULL,
  `projectProponent` varchar(500) DEFAULT NULL,
  `personResponsible` varchar(500) DEFAULT NULL,
  `numberOfBeneficiaries` int(11) DEFAULT NULL,
  `projectBeneficiaries` varchar(500) DEFAULT NULL,
  `addressBeneficiaries` varchar(500) DEFAULT NULL,
  `addressOfProject` varchar(500) DEFAULT NULL,
  `amountReceivedOVPLM` double DEFAULT NULL,
  `significanceProject` varchar(1000) DEFAULT NULL,
  `happenedImplementationProject` varchar(1000) DEFAULT NULL,
  `whenwhereProject` varchar(1000) DEFAULT NULL,
  `participantsProject` varchar(1000) DEFAULT NULL,
  `highlightsProject` varchar(1000) DEFAULT NULL,
  `majorProblems` varchar(1000) DEFAULT NULL,
  `otherRecommendations` varchar(1000) DEFAULT NULL,
  `annexes` longblob,
  `attendanceBeneficiaries` longblob,
  `attendanceDLSU` longblob,
  `beneficiariesLetters` longblob,
  `seproposalID` int(11) DEFAULT NULL,
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
  `sereportID` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `LA21_idx` (`sereportID`),
  CONSTRAINT `LA21` FOREIGN KEY (`sereportID`) REFERENCES `sereport` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
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
-- Table structure for table `sereport_participants`
--

DROP TABLE IF EXISTS `sereport_participants`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sereport_participants` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `classification` varchar(500) DEFAULT NULL,
  `numberOfIndividuals` int(11) DEFAULT NULL,
  `sereportID` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `LA19_idx` (`sereportID`),
  CONSTRAINT `LA19` FOREIGN KEY (`sereportID`) REFERENCES `sereport` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sereport_participants`
--

LOCK TABLES `sereport_participants` WRITE;
/*!40000 ALTER TABLE `sereport_participants` DISABLE KEYS */;
/*!40000 ALTER TABLE `sereport_participants` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `unit`
--

LOCK TABLES `unit` WRITE;
/*!40000 ALTER TABLE `unit` DISABLE KEYS */;
INSERT INTO `unit` VALUES (10,'Office of the Vice President for Lasallian Mission (OVPLM)','OVPLM Unit Head','Non-Academic',0,0,1,50,40,55,5,5,5,'OVPLM Unit',1),(11,'College of Computer Studies (CCS)','CCS Unit Head','Academic',3,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'CCS Unit ',1),(12,'College of Law (COL)','COL Unit Head','Academic',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'COL Unit',71),(13,'Br. Andrew Gonzales College of Education (BAGCED)','CED Unit Head','Academic',5,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'CED Unit',1),(14,'College of Liberal Arts (CLA)','CLA Unit Head','Academic',10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'CLA Unit',74),(15,'College of Science (COS)','COS Unit Head','Academic',3,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'COS Unit',74),(16,'Gokongwei College of Engineering (GCOE)','GCOE Unit Head','Academic',6,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'GCOE Unit',74),(17,'Ramon V. Del Rosario College of Business (RVR-COB)','RVR-COB Unit Head','Academic',6,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'RVR-COB Unit',74),(18,'School of Economics (SOE)','SOE Unit HEad','Academic',6,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'SOE Unit',74),(19,'Center for Social Concern and Action (COSCA)','COSCA Unit Head','Non-Academic',0,20,5,15,20,15,3,3,3,'COSCA Unit Description',71),(20,'Laguna Campus Lasallian Mission (LCLM)','LCLM Unit Head','Non-Academic',0,5,3,10,15,5,4,4,4,'LCLM Unit Description',71),(21,'Lasallian Pastoral Office (LSPO)','LSPO Unit Head','Non-Academic',0,0,3,10,10,10,2,2,2,'LSPO Unit Description',71),(22,'Lasallian Mission Council (LMC)','LMC Unit Head','Non-Academic',0,0,1,10,10,10,0,0,0,'LMC Unit Description',71),(23,'Dean of Student Affairs (DSA)','DSA Unit Head','Non-Academic',0,0,2,20,20,20,1,1,1,'DSA Unit Description',1);
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
) ENGINE=InnoDB AUTO_INCREMENT=87 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `unit_department`
--

LOCK TABLES `unit_department` WRITE;
/*!40000 ALTER TABLE `unit_department` DISABLE KEYS */;
INSERT INTO `unit_department` VALUES (41,10,0),(42,11,2),(43,11,3),(44,11,4),(45,13,5),(46,13,6),(47,13,7),(48,13,8),(49,13,9),(50,14,10),(51,14,11),(52,14,12),(53,14,13),(54,14,14),(55,14,15),(56,14,16),(57,14,17),(58,14,18),(59,14,19),(60,15,20),(61,15,21),(62,15,22),(63,16,23),(64,16,24),(65,16,25),(66,16,26),(67,16,27),(68,16,28),(69,17,29),(70,17,30),(71,17,31),(72,17,32),(73,17,33),(74,17,34),(75,18,35),(76,18,36),(77,18,37),(78,18,38),(79,18,39),(80,18,40),(81,19,0),(82,20,0),(83,21,0),(84,22,0),(85,23,0),(86,12,0);
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

-- Dump completed on 2018-10-20 14:46:50
