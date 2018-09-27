CREATE DATABASE  IF NOT EXISTS `thsis01` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `thsis01`;
-- MySQL dump 10.13  Distrib 5.6.23, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: thsis01
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
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `budget`
--

LOCK TABLES `budget` WRITE;
/*!40000 ALTER TABLE `budget` DISABLE KEYS */;
INSERT INTO `budget` VALUES (1,'2018-07-29',10000000,0,10000000,NULL,NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `community`
--

LOCK TABLES `community` WRITE;
/*!40000 ALTER TABLE `community` DISABLE KEYS */;
INSERT INTO `community` VALUES (1,'Payatas Community','Karl Madrid','09155114786','42','Kamias Street','Barangay Tibay','City of Angels','Example Description',4),(2,'QC Tambays','Don Mac','09051320321','5','Katipunan Street','Barangay Tanod','Quezon City','Example Description',5),(3,'Anjo Open Community','Khalid Malo','09277777777','76','Pogi Street','Barangay Captain','Makati City','Example Description',4),(4,'Karl Home for the Special','Carlo Nasol','09565127859','50','Apple Street','Barangay Malakas','Paranaque City','Example Description',4),(5,'Red Cross Mandaluyong','Rey Gamboa','09281326520','36','Mango Street','Barangay Bango','Mandaluyong City','Example Description',5);
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
  PRIMARY KEY (`departmentID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `department`
--

LOCK TABLES `department` WRITE;
/*!40000 ALTER TABLE `department` DISABLE KEYS */;
INSERT INTO `department` VALUES (0,'No Department'),(1,'Counselling and Educational Psychology Department (CEPD)'),(2,'Departmentof English and Applied Linguistics (DEAL)'),(3,'Educational Leadership and Management Department (ELMD)'),(4,'Physical Education Department (PED)'),(5,'Science Education Department (SED)'),(6,'Computer Technology (CT)'),(7,'Information Technology (IT)'),(8,'Software Technology (ST)'),(9,'Behavioral Sciences'),(10,'Communication'),(11,'Literature'),(12,'Filipino'),(13,'History'),(14,'International Studies'),(15,'Philosophy'),(16,'Political Science'),(17,'Psychology'),(18,'Theology and Religious Education'),(19,'Biology'),(20,'Chemistry'),(21,'Mathematics'),(22,'Physics'),(23,'Chemical Engineering'),(24,'Civil Engineering'),(25,'Electronics and Communications Engineering'),(26,'Industrial Engineering'),(27,'Manufacturing Engineering and Management'),(28,'Mechanical Engineering'),(29,'Accountancy'),(30,'Commercial Law'),(31,'Decision Sciences and Innovation Department'),(32,'Management of Financial Institutions'),(33,'Management and Organization Department'),(34,'Marketing Management'),(35,'Industrial Applied Economics'),(36,'Financial Appied Economics'),(37,'Ladderized Applied Economics'),(38,'Management of Financial Institutions'),(39,'Admin'),(40,'Lasallian Mission Council'),(41,'Dept 1'),(42,'Dept 2'),(43,'Dept 3'),(44,'Computer Technology (CT)'),(45,'Information Technology (IT)'),(46,'Software Technology (ST)'),(47,'Counselling and Educational Psychology Department (CEPD)'),(48,'Department of English and Applied Linguistics (DEAL)'),(49,'Educational Leadership and Management Department (ELMD)'),(50,'Physical Education Department (PED)'),(51,'Science Education Department(SED)'),(52,'Behavioral Sciences'),(53,'Communication'),(54,'Literature '),(55,'Filipino'),(56,'History'),(57,'International Studies'),(58,'Philosophy'),(59,'Political Science'),(60,'Psychology'),(61,'Theology and Religious Education'),(62,'Biology'),(63,'Chemistry'),(64,'Mathematics'),(65,'Physics'),(66,'Chemical Engineering'),(67,'Civil Engineering'),(68,'Electronics and Communications Engineering'),(69,'Industrial Engineering'),(70,'Manufacturing Engineering and Management'),(71,'Mechanical Engineering'),(72,'Accountancy'),(73,'Commercial Law'),(74,'Decision Sciences and Innovation Department'),(75,'Management of Financial Institutions'),(76,'Management and Organization Department'),(77,'Marketing Management'),(78,'Industrial Applied Economics'),(79,'Financial Applied Economics'),(80,'Ladderized Applied Economics'),(81,'Management of Financial Institutions'),(82,'Management and Organization Department'),(83,'Marketing Management');
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
  `targetCommunity` int(11) DEFAULT NULL,
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ffproposal`
--

LOCK TABLES `ffproposal` WRITE;
/*!40000 ALTER TABLE `ffproposal` DISABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ffproposal_attendees`
--

LOCK TABLES `ffproposal_attendees` WRITE;
/*!40000 ALTER TABLE `ffproposal_attendees` DISABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ffproposal_expenses`
--

LOCK TABLES `ffproposal_expenses` WRITE;
/*!40000 ALTER TABLE `ffproposal_expenses` DISABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `goal`
--

LOCK TABLES `goal` WRITE;
/*!40000 ALTER TABLE `goal` DISABLE KEYS */;
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
  `departmentID` int(11) DEFAULT NULL,
  `username` varchar(100) DEFAULT NULL,
  `password` varchar(256) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `LA1_idx` (`departmentID`),
  CONSTRAINT `LA1` FOREIGN KEY (`departmentID`) REFERENCES `department` (`departmentID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=71 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `informationsheet`
--

LOCK TABLES `informationsheet` WRITE;
/*!40000 ALTER TABLE `informationsheet` DISABLE KEYS */;
INSERT INTO `informationsheet` VALUES (1,'Admin','Admin','admin@gmail.com','Admin',39,'admin','c7ad44cbad762a5da0a452f9e854fdc1e0e7a52a38015f23f3eab1d80b931dd472634dfac71cd34ebc35d16ab7fb8a90c81f975113d6c7538dc69dd8de9077ec'),(3,'Sample','Sample','sample@gmail.com','College of Science (COS)',20,'sample','d404559f602eab6fd602ac7680dacbfaadd13630335e951f097af3900e9de176b6db28512f2e000b9d04fba5133e8b1c6e8df59db3a8ab9d60be4b97cc9e81db'),(4,'OVPLM','OVPLM','ovplm@gmail.com','Office of the Vice President for Lasallian Mission (OVPLM)',0,'ovplm','8a9e78369cfada2c5ea47255f76eb41e744ca11be31c9a3a139d0f01253ba0174061793f2894249efe290e44ef0199d17b92241a4fa95efb5dc6524f1bd3d82f'),(5,'LSPO','LSPO','lspo@gmail.com','Lasallian Pastoral Office (LSPO)',0,'lspo','0673b51cd039f7b594029fe18da49ba5388eba51bee963be9ac586824d2d9ad122fa9d8ac6619a839694160b6f53bf9f196cb37733c623cc3b5ad9cffb58c0c1'),(6,'LMD','LMD','lmd@gmail.com','Lasallian Mission Director',0,'lmd','d94ce9b63fdf231aadee8d49f0e8ba642f0c49a76f642decfebb55ca6245755fb96186ae4f32f79260c3d88e9bccc30f80e796c3037e1b4d3dd2d127c4125078'),(7,'LCLM','LCLM','lclm@gmail.com','Laguna Campus Lasallian Mission',0,'lclm','e89f10b40137062bbee50977d6ee3e71329042e862d9c3e31f158872dea398585968150b010d926000d62af6de7e3b69407b3e3aa16cf5045faf89a51ba8bd3b'),(8,'DSA','DSA','dsa@gmail.com','Dean of Student Affairs',0,'dsa','51fef8efb142cff14c3f6f2aa0dda57cd25d1e748dab38b36c8695ed9848eb38b9a2b01a2d3bf5b448a043ee75665fdd78e61630ae9077b38a050746bddd7b02'),(9,'COSCA','COSCA','cosca@gmail.com','Center for Social Concern and Action (COSCA)',0,'cosca','25d4007f378b0e56e2859157039bdfd2f62d19d8462eaab075236c393b831092a1c026a74348d106433891a8861a26657f9690780c80cfaa40ef6d3b91fd291c'),(10,'ADEALMCCS','ADEALMCCS','adealmccs@gmail.com','Assistant Dean for External Affairs of the Lasallian Mission (ADEALM) - CCS',0,'adealmccs','6ed9758ea48830681b9197b581c833b262102ec567897facf2ae6219452275fca367dbb41f94b249844400ddf7548e42c8e348c7361d0c8699ad03f2f2d01b92'),(11,'ADEALMCOB','ADEALMCOB','adealmcob@gmail.com','Assistant Dean for External Affairs of the Lasallian Mission (ADEALM) - COB',0,'adealmcob','0988ac2e8b0e08355b679edde5092787ef642a6882c5753fa4a9d69e7a364ac919aa0b673b295f143041e5b01e7f0a5d500a823ca04a89dc9781af5c281237c9'),(12,'OPMD','OPMD','opmd@gmail.com','Office of Personnel Management Director',0,'opmd','dba128d5a54bab81fd34d431fcf9442e26594bca5c805e5b00223190736fc49a8ce46ada9ce4becb7c21384cfb422e83bf81a61c5cefa659bfd898ea61c006fa'),(13,'Department','Chair','dept@gmail.com','Department / Unit Chair',0,'deptunit','654f46e5bc6e9667fa43167479f2ee2176c8d07b259bf73606fa9bf3165c15f5dd39a63d35b1d5df19edb1a26ce5137f244f5e959d6793bbc6b5fe66cc6442f4'),(14,'External','Director','eased@gmail.com','External Affairs / Social Engagement Director',0,'eased','720ef88f2528e5539482479b8e9f30b483457ff6c84d82cb1d185488976508da277f53a6b56c7406f7480d99bac8350a0f2ee8bcc707399657969d73e3e21e73'),(15,'Dean','Chair','dvpvc@gmail.com','Dean / VP / VC',0,'dvpvc','56a15346ec0dcf4445abba4235b4aa9c1a1325b38a6ae471b3c226d84c649f2115562fee2b715f774f12d6f9b1fc2bdb63a5091be40ced258c8fc7bf8217d131'),(16,'Jay','Jay','jay@dlsu.edu.ph','Office of the Vice President for Lasallian Mission (OVPLM)',0,'jay','42d5ae85008d2a3c0c0059564ed10203d5cff49a91467b19d267aa764d47d30d3d7d9154e6a4d8e61dcd8ff79a7c727b8cb4d63b1b54f35c6d42a2cc1cad98aa'),(17,'Carmel','Carmel','carmel@dlsu.edu.ph','Office of the Vice President for Lasallian Mission (OVPLM)',0,'carmel','2473c803cd06f0de882ab579abd74ad393eb0d6d64d7c300c6112646a2be484c156f6cbaf42ab33a11aaa581134b1b08f45fece48574202597c0e30a1632e358'),(18,'Niel','Niel','niel@gmail.com','Center for Social Concern and Action (COSCA)',0,'niel','97b0758ef6cb6d5a2b54c744653736c7fda13612af422ebacbfabf9469ddb29c212fa6870a84cc13f22d82f7249db2ca9613a90736145e2db4f981b93ad40e95'),(19,'Michael','Broughton','michaelbroughton@gmail.com','Lasallian Mission Council',40,'michaellmc','4fe98b8c8ecb1d5af0729c20b2489e3e60d6c41f356d6c47b346ce556c144136243a94cbe1665875846aa64530cbb6857d8c26002bd829406d0d18186fdbc9f5'),(20,'Nelca','Villarin','nelcavillarin@gmail.com','Lasallian Mission Council',40,'nelca','759578037fdb24f7c6d6968c2e4dae34df944bd90507c336baedee5e57a7845a9d4cf59bcf2ca83bc1fbf55d332e86525d544968d6e5a3e074305750581fbe4c'),(21,'Margarita','Perdido','margaritapeldido@gmail.com','Lasallian Mission Council',40,'margarita','aa08c20688b952d8119e1abac52e3c7bc0a918b10f5188c0c22fd4b36cb5bbbe626e25a71a6b02d071cb749f351937bcdb071c85cef71b3d7858abb2b3b17eb4'),(22,'James','Laxa','jameslaxa@gmail.com','Lasallian Mission Council',40,'james','625f7fdb99de7de358ab119ead94c29b436764e1bffb3af4f1ca715b692cf155e62007572ce4101fef09a98130369de7a06ccd57903b4c5a9104d1444a02f4a2'),(23,'Fritzie','De Vera','fritziedevera@gmail.com','Lasallian Mission Council',40,'fritzie','4ba090d4b0913b18790e889dba1a778af3b1e6b3f577cd0740b8bb521900f578200097589d24a01187350efd69b0168b00ba3d2ef00a79cbbcc71d9cb8f89d96'),(24,'Gelo','Paragas','geloparagas@gmail.com','Lasallian Mission Council',40,'gelo','3c8a2898c0a7d71aff247dd4e45ebaadd5ad5f3c1affb7f5ec19026d9ddcadb8ea4f9cbf60e877336a52f900ba8e9cb4785a8fd8beee0dad945c9fba20f8cea8'),(25,'Rito','Baring','ritobaring@gmail.com','Lasallian Mission Council',40,'rito','2c879ec0b8dfc2d017a49a0efcde73adbca6d10279bd4323c5e842e8b52549e56b6b1d3a5371d771eeb2d897fce7402f829129200050438a38c6d8bef1c19e2e'),(26,'Lysander','Rivera','lysanderrivera@gmail.com','Lasallian Mission Council',40,'lysander','8db35a780be31e4e5c8dd20bac741ee69b4f93072d755fc1d7336fef3d5abb106ebc243cfa434a80e2c491374052e239754fb26ba6c1fe1c4496ec1a803d662b'),(27,'Michael','Broughton','michaelbroughton@dlsu.edu.ph','Office of the Vice President for Lasallian Mission (OVPLM)',0,'michaelovplm','628b6e04c06ad9ab89b33bc23432d203c8acb5030bbb2e718ee422dafbf009e49c22c1d453655716a5236336f3c6bd94ff37b4b2698ecd3c599f4371bd99f184'),(28,'Chairperson','Director','cd@gmail.com','Chairperson / Director',0,'cd','f6ea8ad7d83486aa37e5770dac2e19671ba15e06b6761bbe3713ccb2aa6b73c1b398f4f583d9ce6c55763269288fd4d8356be65d636df76530fd99ae6722c9bc'),(29,'Vice President','Lasallian Mission','vplm@gmail.com','Vice President for Lasallian Mission',0,'vplm','6bc96463ceaa7643aa1db2faba1e43507e35f31dffa8a333cd6368013910f77d78bd269999f1f43db541d80914bb49389eb2215abb6169fa28c3f2e9721161ab'),(30,'Dean','Unit','duh@gmail.com','Dean / Unit Head',0,'duh','e44e6d93cd165ec8cdeaa632abe1c35d9a71533cc68072e100c5307ea3be17bc4f10e258785bef77d31664be0f1c3f427528c7450d52082a90c4ee86c7012184'),(31,'Assistant','Dean','adlmauh@gmail.com','Assistant Dean for Lasallian Mission / Assistant Unit Head',0,'adlmauh','63dfbbd04006595a397adcf8c8cfc47e68d7438770878aa857c1e35bc000393922c980e71eabfb11332256e4f24480a4e2d97755952514d152ad9a7d21db73bc'),(32,'James','LSPO','jameslspo@gmail.com','Lasallian Pastoral Office (LSPO)',0,'jameslspo','0d675ee36746c5756a800df9d1d3c8a3db54773f027de309d1cc324eff6317270bffa8979ff86dd1cea9ddd94cfedf5d0d9353078222d69cc90f01a6c34e6d40'),(33,'Luis','Grefiel','luis_grefiel@dlsu.edu.ph','Sample Unit',42,'luis','e0f6027174679fa6707768654fe17896072953a44d72def1c4b6cd015575338938757090db978df3ff79187ad411f827eb9e90e169ed8d26a1f64c2c7e40389c'),(34,'CCS','IT','ccsit@gmail.com','College of Computer Studies (CCS)',45,'ccsit','5e65cf68c3e4b619dc0117436b54b8eb1904eeb1c332e79b7bbdc0bccd6d4e70a6cb89f05df951dc2ea4f21a23f6bbca1311aacd25c5027d6c4b78f00c2c67d6'),(35,'Dino','Alcala','dino_alcala@dlsu.edu.ph','College of Computer Studies (CCS)',44,'ccsct','c23b09c6781cc0f9434ca44b885d75a4cd56612794efb39ea795bc6a897a9cee51eb7f290629e01700b2b57b1c86bb8f11744375fadf7d466eea87375607a74b'),(36,'Angelo ','De Jesus','angelo_dejesus@dlsu.edu.ph','College of Computer Studies (CCS)',46,'ccsst','0483fceecf43a148e0a34fa704c71b7eb186c643465310b9fbb85a173c8227e3ca42aed519d37b178d73a3321dcc3a32d404378630f994ddb24715ae89d52bb1'),(37,'CEPDfirst','CEPDlast','cepd@gmail.com','Br. Andrew Gonzales College of Education',47,'cedcepd','081ab988492031f6eed1b2fa4e2950f59a9923f485bac76e1ec59b9d05a4fff8dc9b938b23acb7a2b032010f521168ff5ada1762807b760489ae0c8968646e21'),(38,'DEALfirst','DEALlast','dealsample@gmail.com','Br. Andrew Gonzales College of Education',48,'deal','a78e41ed2f96ead5fddf0315229eb6bcb41a5900e1732203caf778b6c140b9d3068fa69888803615a67ee57dc5c1e8bf869394a26719d719816717f0bac5c492'),(39,'ELMDfirst','ELMDlast','elmdsample@gmail.com','Br. Andrew Gonzales College of Education',49,'cedelmd','6349ac58266cc4403fb9b4f6bb0d3100b9e211e4fd119b35080df5d43f84c7f6f47efe5083057481fa5541a26907c16fd310b6732517971ff61b2c27e88ae64a'),(40,'cedped','cedped','cedped@gmail.com','Br. Andrew Gonzales College of Education',50,'cedped','bd2d5c09a3113d8ffc5c95441baae4ea873fda1c45c0c3ecba31e474b249f2a2dbf07178e79f7775cf4adf02d34efe94b996a95926ee9a07276c707e4f46da79'),(41,'SEDfirst','SEDlast','SED@gmail.com','Br. Andrew Gonzales College of Education',51,'cedsed','f6f808498b487c03e03c54621b89f96619e2fc007ca5750ded62bb561da334155e906c8cb292ac5e4ec80a0d6f561d9dab603338fb26a22871c0bc42830da1db'),(42,'BSfirst','BSlast','BSsample@gmail.cpm','College of Liberal Arts',52,'col','eb49fb738bc4cfba24adf8e7b61be497f19da11fb4c1526ce89c6bc9c7354d5132221318a28bfadb7edaf885543e8990408e4bc42530d05179c8e05423ab946b'),(43,'CLACOMfirst','CLACOMlast','CLACOMsample@gmail.com','College of Liberal Arts',53,'clacom','790f2a24db0b55fa5c39706d2992a27af98ba7c8df30b5fe62b235e2c9f48bced220f9a927c1eb82d0f3fc753b5cd0924aa59c3e7c864c321bdf6887025fefc4'),(44,'CLALITfirst','CLALITlast','CLATLITsample@gmail.com','College of Liberal Arts',54,'clalit','5d0764d49d24e8bc1642033b5ba7ffbe49da329245a33bcfd7777cad8b22ca9cb5f37b4b538393d8fcbb0caef915a1271f001979088bb4282bb055ca4a43c26a'),(45,'CLAFILfirst','CLAFILlast','CLAFILsample@gmail.com','College of Liberal Arts',55,'clafil','eb80fd35f82cd98baada822f3a019ac981db7ddcb54c693f41a61f60022407fbc3551bd55f5517fa649d612eeff568948019e9d4cf10b4dfff1680ecef946c06'),(46,'CLAHISfirst','CLAHILlast','CLAHILsample@gmail.com','College of Liberal Arts',56,'clahis','8b0cd8ac5780e407c6b370da5a2134b6b6362777c18d3ff29e5b8938e10ab84f1f0b545196b7d248ead0aed3593a97bfc9b70c700da20f1e693088ae41179915'),(47,'CLAISfirst','CLAISlast','CLAISsample@gmail.com','College of Liberal Arts',57,'clais','e5579cc3732c1ca73d1e66f98b5064e248258ed60ec255093cb66787908d06cd096ac7e3654a80467d6153275c395644a2b24e16eccf93fc7fdca4ec92442b15'),(48,'CLAPHfirst','CLAPHlast','CLAPHsample@gmail.com','College of Liberal Arts',58,'claph','7dc172d7c04ce9b4320807f3647566f97a258bd23a0f22b8311d97aaa11c735fd2c689a847f9de3c68a1a5cdd9fbb7ac4f19cb361fcd5819fccfe1d73466b923'),(49,'CLAPSfirst','CLAPSlast','CLAPSsample@gmail.com','College of Liberal Arts',59,'claps','055616420e4e518ae32b49ce7c9b12803d6cb214adfda08329123c508ae0ab09ed744067284fbedd01f30684921f0f01a229919cdc94c76a1388bf5716f80a01'),(50,'PSYCHfirst','PSYCHlast','PSYCHsample@gmail.com','College of Liberal Arts',60,'clapsych','aba3a73d5770e08c858d7e0f72f181d5c10559c7b09f0d8039dc85e2f0f45dcce0c9dc33582703501b533b2d7e6100849814f614f2bc7f39fdbf429307910ba9'),(51,'CLATREDfirst','CLATREDlast','CLATREDsample@gmail.com','College of Liberal Arts',61,'clatred','d6791ea2055426ee7f9efd931cdd6f15e730bff57ba1806b01a1fbeaf65b666e26c4ae49288cd7870f68546c2ae7d422d405a21453e82d90e94d5d4234123c50'),(52,'Dwight','Howard','dwight@gmail.com','College of Science',62,'cosbio','92230efff20b4e932fcd32ab5c979bc1a0900ad000a3559addabddff2e7f16320d0d2b6ca528aaac7724bd022f0a1703dcf00e8c0409bc69dcc553497e1b827c'),(53,'Shaq','Oneal','shaqy@gmail.com','Gokongwei College of Engineering (GCOE)',66,'gcoece','ccd2511335b1a8e070909f053ded0c43a139125a0d23a9c6bf2b560a0cc122ac6672cfb48f32a07cc1f5d58b2b3c4bde89bf793f663cc12f52fc85f95af1dfb1'),(54,'Devin','Booker','booker@gmail.com','Ramon V. Del Rosario College of Business (RVRCOB)',72,'coba','df51049df637fe2c6091f1613df9f9dca182e73420affb6056c13430a3dd10b9ca3eff93343b5d7d7a9108d5e7b61202b8a205a2b204bbb85dff4aacceb6753a'),(55,'Tracy','McGrady','tracy@gmail.com','School of Economics (SOE)',78,'soeiae','9a1fc83a4485f418a9658a4130e6c47a8c0a6b7c6f3495bdcc4a65c546253efeb7f123874cc55e4443a22b0880e71cbbe8917054fbccbf9b453c71639cd6218f'),(56,'COSCHEMfirst','COSCHEMlast','COSCHEMsample@gmail.com','College of Science',63,'coschem','1e1924e6317f0757d2cb90120fb5b30eba9b3c642f057d236ef0d70878f499a119ad588c6e92cfe6cceb08e66090d6af82b195afb2ec2efcd9d365d560299a41'),(57,'COSMATHfirst','COSMATHlast','COSMATHsample@gmail.com','College of Science',64,'cosmath','bf6f7916bc316c9fe20687043b411e4da77954cb87ba3d867a9a58ddf563135c1fdbae0ad24108c067001915ad869a1fe0bd11d47b935fdcb8a812da7230b330'),(58,'COSPHYSfirst','COSPHYSlast','COSPHYSsample@gmail.com','College of Science',65,'cosphys','e14be6bedadeed3c97dc083282f86ad900edcaf9267746ae02e39d55d3648507256a2e5ae1d4a492aa8264d81878dc4e735ebd9ccf1ff4aa8316fede65a4d160'),(59,'Kit','Harrington','kit.harrington@dlsu.edu.ph','Ramon V. Del Rosario College of Business (RVRCOB)',73,'cobcl','1f39a6f2d07c9397579e2cda9a90092d6ca055143582b1c6c12f40ba2430cfb29b7f28c50a4f3a4635a66f818a407ad8cb8e8dcc61e1f12cca76463b386f6471'),(60,'Jon','Snow','jonsnow@dlsu.edu.ph','Ramon V. Del Rosario College of Business (RVRCOB)',74,'cobds','297f8c74db97e3d1b3350410bcf29bf49cf0bf7dec339387cab005b97d4659765622682c9e87471cd782385fdccc326ebdc783c6be10f7af63ac7c1a125a6a27'),(61,'Nancy Wheeler','Nancy Wheeler','nancy@dlsu.edu.ph','Ramon V. Del Rosario College of Business (RVRCOB)',75,'cobm','99cf1d36d8cc42e56eb7221ce46390287e55091eceb953d3f2bbe4cde89cfc6b0e9c48a72da6e62af728d9ddd2925ac4b69e7574023531d36d8f61fd880b5c69'),(62,'Jonathan Byers','Jonathan Byers','jonathonbyers@dlsu.edu.ph','Ramon V. Del Rosario College of Business (RVRCOB)',76,'cobmo','8c0bb56efdd3fee8e7e524247b6147483dca6cb20690484fc10e6929b1865884751447bc3d9d99eaf1509b410b98b76f712c013c5f93cf98c511f57ed3af3c87'),(63,'Lucas Nasol','Lucas Nasol','lucas_nasol@dlsu.edu.ph','Ramon V. Del Rosario College of Business (RVRCOB)',77,'cobmm','2d0fe21e3b9128c1ca1ef6ad8a0071dbf62463d48c7de8d1fa2012272786cc9f72261c1f78e102ebd273b6b84b5aa249878db1d92f71c170060a235bcaf5e8ae'),(64,'Nancy','Momoland','nancy_momoland@dlsu.edu.ph','Gokongwei College of Engineering (GCOE)',67,'gcoecv','56806b006e086432b8b51979ef5a78f140a2f0a8b47cae3feafaee5a20c28ccfbc44f56a876a69a568d498114bb91e50aae6437592d29326a23158d364332ae1'),(65,'Ella','May','ella_may@dlsu.edu.ph','Gokongwei College of Engineering (GCOE)',68,'gcoeec','fd67e667cff41d9026923dc6fcc2518eab925f388e47919c68f3fc973a586fd93d3b503eaea935f45923453b1ec2db709ecb744efa5a319013cf1b8bf24e7a45'),(66,'Yeonwoo','Momoland','yeonwoo@gmail.com','Gokongwei College of Engineering (GCOE)',69,'gcoeie','c43040fbf254be602610b70f6d84dbb72642c34194b961f1c9fbac2f355e3943d16b9828bf6575a2c57cc67d3738ef3f4834007a31936390a268778a42c4ff21'),(67,'Super','Man','superman@gmail.com','School of Economics (SOE)',79,'soef','cb7bd30a38647b5bb119bad84652f3172e11476104538e65b97974077f339c904d556860e7ee49b553be616245f84f4d561f033899f4b9ceddabada1cc65a875'),(68,'Bat','Man','batman@gmail.com','School of Economics (SOE)',80,'soel','f4a114efa62dd179137eb5881a8945325718a758517c86b84a4ba4bbf151097ac89ee0ccbf425cf658a7aee687d10516fb22883c462c4e823905fc506fa11f19'),(69,'John','Rick','johnrick@dlsu.edu.ph','School of Economics (SOE)',81,'soem','07aa5bbed4c1941da4af4b6c79f83ec1072188ce28eb0c397b3ca6c9d6fe36dd882fad51f5a482e8783338f8282680ed48ca5fbb7eb75c80907a368878d97967'),(70,'Post','Malone','post_malone@dlsu.edu.h','School of Economics (SOE)',82,'soemo','8242a0f9f15353b10a316f0581546268ed2ec2efad01a570a527e508aa71a94c3f5e978aa246e44ce52c109fd19cc0662b004b7e5fdd93182c0db58b724facd8');
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kra`
--

LOCK TABLES `kra` WRITE;
/*!40000 ALTER TABLE `kra` DISABLE KEYS */;
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
  `measure` int(11) DEFAULT NULL,
  `target` varchar(500) DEFAULT NULL,
  `kraID` int(11) DEFAULT NULL,
  `goalID` int(11) DEFAULT NULL,
  PRIMARY KEY (`measureID`),
  KEY `LA7_idx` (`kraID`),
  KEY `LA8_idx` (`goalID`),
  CONSTRAINT `LA7` FOREIGN KEY (`kraID`) REFERENCES `kra` (`kraID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `LA8` FOREIGN KEY (`goalID`) REFERENCES `goal` (`goalID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `measure`
--

LOCK TABLES `measure` WRITE;
/*!40000 ALTER TABLE `measure` DISABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=1818 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notification`
--

LOCK TABLES `notification` WRITE;
/*!40000 ALTER TABLE `notification` DISABLE KEYS */;
INSERT INTO `notification` VALUES (1022,'Suicide Squad Orientation','Your proposal has been approved by the Dean / VP / VC! It will now be taken to the COSCA.','2018-08-09 21:00:30',61),(1023,'Suicide Squad Orientation','You have new SE Proposal ready for approval!','2018-08-09 21:00:30',18),(1024,'Suicide Squad Orientation','A proposal has been received by COSCA.','2018-08-09 21:00:30',17),(1025,'Suicide Squad Orientation','Your proposal has been approved by the Dean / VP / VC! It will now be taken to the COSCA.','2018-08-09 21:00:30',61),(1026,'Suicide Squad Orientation','You have new SE Proposal ready for approval!','2018-08-09 21:00:54',19),(1027,'Suicide Squad Orientation','You have new SE Proposal ready for approval!','2018-08-09 21:00:54',20),(1028,'Suicide Squad Orientation','You have new SE Proposal ready for approval!','2018-08-09 21:00:54',21),(1029,'Suicide Squad Orientation','You have new SE Proposal ready for approval!','2018-08-09 21:00:54',22),(1030,'Suicide Squad Orientation','You have new SE Proposal ready for approval!','2018-08-09 21:00:54',23),(1031,'Suicide Squad Orientation','Your proposal has been approved by the COSCA. It will now be taken to the LMC Council.','2018-08-09 21:00:54',61),(1032,'Suicide Squad Orientation','Nelca Villarin has voted to APPROVE your proposal. Vote Count: 1/5','2018-08-09 21:01:12',61),(1033,'Suicide Squad Orientation','Margarita Perdido has voted to APPROVE your proposal. Vote Count: 2/5','2018-08-09 21:01:42',61),(1034,'Suicide Squad Orientation','Michael Broughton has voted to APPROVE your proposal. Vote Count: 3/5','2018-08-09 21:01:57',61),(1035,'Suicide Squad Orientation','James Laxa has voted to APPROVE your proposal. Vote Count: 4/5','2018-08-09 21:02:19',61),(1036,'Suicide Squad Orientation','Fritzie De Vera has voted to APPROVE your proposal. Vote Count: 5/5','2018-08-09 21:02:34',61),(1037,'Suicide Squad Orientation','Your proposal has been approved by the Council. You may now upload the PRS for endorsement.','2018-08-09 21:02:34',61),(1038,'Suicide Squad Orientation','You have new SE Proposal ready for approval!','2018-08-09 21:05:06',27),(1039,'Suicide Squad Orientation','Congratulations! Your SE Proposal has been approved!','2018-08-09 21:06:02',61),(1040,'Suicide Squad Orientation','₱4500.0 has been deducted to the budget!','2018-08-09 21:06:02',4),(1041,'Suicide Squad Orientation','Accomplishment Report has been submitted!','2018-08-09 21:09:29',17),(1042,'Suicide Squad Orientation','Accomplishment Report has been submitted!','2018-08-09 21:09:38',17),(1043,'Sample','You have new FF Proposal ready for approval!','2018-08-09 21:13:03',28),(1044,'Sample','You have new FF Proposal ready for approval!','2018-08-09 21:13:24',29),(1045,'Sample','Your proposal has been approved by the Chairperson / Director! It will now be taken to the Vice President for Lasallian Mission.','2018-08-09 21:13:24',61),(1046,'Sample','You have new FF Proposal ready for approval!','2018-08-09 21:13:37',30),(1047,'Sample','Your proposal has been approved by the Vice President for Lasallian Mission! It will now be taken to the Dean / Unit Head.','2018-08-09 21:13:37',61),(1048,'Sample','You have new FF Proposal ready for approval!','2018-08-09 21:13:49',31),(1049,'Sample','Your proposal has been approved by the Dean / Unit Head! It will now be taken to the Assistant Dean for Lasallian Mission / Assistant Unit Head.','2018-08-09 21:13:49',61),(1050,'Sample','You have new FF Proposal ready for approval!','2018-08-09 21:13:58',32),(1051,'Sample','Your proposal has been approved by the Assistant Dean for Lasallian Mission / Assistant Unit Head! It will now be taken to the LSPO.','2018-08-09 21:13:58',61),(1052,'Sample','You have new FF Proposal ready for approval!','2018-08-09 21:14:20',19),(1053,'Sample','You have new FF Proposal ready for approval!','2018-08-09 21:14:20',20),(1054,'Sample','You have new FF Proposal ready for approval!','2018-08-09 21:14:20',21),(1055,'Sample','You have new FF Proposal ready for approval!','2018-08-09 21:14:20',22),(1056,'Sample','You have new FF Proposal ready for approval!','2018-08-09 21:14:20',23),(1057,'Sample','Your proposal has been approved by the LSPO! It will now be taken to the LMC Council.','2018-08-09 21:14:20',61),(1058,'Sample','Nelca Villarin has voted to APPROVE your proposal. Vote Count: 1/5','2018-08-09 21:14:44',61),(1059,'Sample','Margarita Perdido has voted to APPROVE your proposal. Vote Count: 2/5','2018-08-09 21:15:00',61),(1060,'Sample','Michael Broughton has voted to APPROVE your proposal. Vote Count: 3/5','2018-08-09 21:15:18',61),(1061,'Sample','James Laxa has voted to APPROVE your proposal. Vote Count: 4/5','2018-08-09 21:15:56',61),(1062,'Sample','James Laxa has voted to APPROVE your proposal. Vote Count: 5/5','2018-08-09 21:15:57',61),(1063,'Sample','Fritzie De Vera has voted to APPROVE your proposal. Vote Count: 6/5','2018-08-09 21:16:11',61),(1064,'Sample','Congratulations! Your FF Proposal has been approved!','2018-08-09 21:16:11',61),(1065,'Sample','Accomplishment Report has been submitted!','2018-08-09 21:17:20',17),(1066,'Party Party','You have new SE Proposal ready for approval!','2018-08-09 21:20:10',13),(1067,'Party Party','You have new SE Proposal ready for approval!','2018-08-09 21:20:30',14),(1068,'Party Party','Your proposal has been approved by the Department / Unit Chair! It will now be taken to the External Affairs / SE Director.','2018-08-09 21:20:30',62),(1069,'Party Party','You have new SE Proposal ready for approval!','2018-08-09 21:20:43',15),(1070,'Party Party','Your proposal has been approved by the External Affairs / SE Director! It will now be taken to the Dean / VP / VC.','2018-08-09 21:20:43',62),(1071,'Party Party','You have new SE Proposal ready for approval!','2018-08-09 21:21:09',18),(1072,'Party Party','A proposal has been received by COSCA.','2018-08-09 21:21:09',17),(1073,'Party Party','Your proposal has been approved by the Dean / VP / VC! It will now be taken to the COSCA.','2018-08-09 21:21:09',62),(1074,'Party Party','You have new SE Proposal ready for approval!','2018-08-09 21:21:21',19),(1075,'Party Party','You have new SE Proposal ready for approval!','2018-08-09 21:21:21',20),(1076,'Party Party','You have new SE Proposal ready for approval!','2018-08-09 21:21:21',21),(1077,'Party Party','You have new SE Proposal ready for approval!','2018-08-09 21:21:21',22),(1078,'Party Party','You have new SE Proposal ready for approval!','2018-08-09 21:21:21',23),(1079,'Party Party','Your proposal has been approved by the COSCA. It will now be taken to the LMC Council.','2018-08-09 21:21:21',62),(1080,'Party Party','Nelca Villarin has voted to APPROVE your proposal. Vote Count: 1/5','2018-08-09 21:21:43',62),(1081,'Party Party','Margarita Perdido has voted to APPROVE your proposal. Vote Count: 2/5','2018-08-09 21:21:59',62),(1082,'Party Party','Michael Broughton has voted to APPROVE your proposal. Vote Count: 3/5','2018-08-09 21:22:15',62),(1083,'Party Party','James Laxa has voted to APPROVE your proposal. Vote Count: 4/5','2018-08-09 21:22:37',62),(1084,'Party Party','Fritzie De Vera has voted to APPROVE your proposal. Vote Count: 5/5','2018-08-09 21:22:54',62),(1085,'Party Party','Your proposal has been approved by the Council. You may now upload the PRS for endorsement.','2018-08-09 21:22:54',62),(1086,'Party Party','You have new SE Proposal ready for approval!','2018-08-09 21:23:16',27),(1087,'Party Party','Congratulations! Your SE Proposal has been approved!','2018-08-09 21:23:44',62),(1088,'Party Party','₱10000.0 has been deducted to the budget!','2018-08-09 21:23:44',4),(1089,'Party Party','Accomplishment Report has been submitted!','2018-08-09 21:25:28',17),(1090,'Party Party','Accomplishment Report has been submitted!','2018-08-09 21:25:33',17),(1091,'Lalaboomboom','You have new SE Proposal ready for approval!','2018-08-09 21:29:59',13),(1092,'Lalaboomboom','You have new SE Proposal ready for approval!','2018-08-09 21:30:15',14),(1093,'Lalaboomboom','Your proposal has been approved by the Department / Unit Chair! It will now be taken to the External Affairs / SE Director.','2018-08-09 21:30:15',63),(1094,'Lalaboomboom','You have new SE Proposal ready for approval!','2018-08-09 21:30:28',15),(1095,'Lalaboomboom','Your proposal has been approved by the External Affairs / SE Director! It will now be taken to the Dean / VP / VC.','2018-08-09 21:30:28',63),(1096,'Lalaboomboom','You have new SE Proposal ready for approval!','2018-08-09 21:30:42',18),(1097,'Lalaboomboom','A proposal has been received by COSCA.','2018-08-09 21:30:42',17),(1098,'Lalaboomboom','Your proposal has been approved by the Dean / VP / VC! It will now be taken to the COSCA.','2018-08-09 21:30:42',63),(1099,'Lalaboomboom','You have new SE Proposal ready for approval!','2018-08-09 21:30:55',19),(1100,'Lalaboomboom','You have new SE Proposal ready for approval!','2018-08-09 21:30:55',20),(1101,'Lalaboomboom','You have new SE Proposal ready for approval!','2018-08-09 21:30:55',21),(1102,'Lalaboomboom','You have new SE Proposal ready for approval!','2018-08-09 21:30:55',22),(1103,'Lalaboomboom','You have new SE Proposal ready for approval!','2018-08-09 21:30:55',23),(1104,'Lalaboomboom','Your proposal has been approved by the COSCA. It will now be taken to the LMC Council.','2018-08-09 21:30:55',63),(1105,'Lalaboomboom','Nelca Villarin has voted to APPROVE your proposal. Vote Count: 1/5','2018-08-09 21:31:10',63),(1106,'Lalaboomboom','Margarita Perdido has voted to APPROVE your proposal. Vote Count: 2/5','2018-08-09 21:31:23',63),(1107,'Lalaboomboom','Michael Broughton has voted to APPROVE your proposal. Vote Count: 3/5','2018-08-09 21:31:38',63),(1108,'Lalaboomboom','James Laxa has voted to APPROVE your proposal. Vote Count: 4/5','2018-08-09 21:31:53',63),(1109,'Lalaboomboom','Fritzie De Vera has voted to APPROVE your proposal. Vote Count: 5/5','2018-08-09 21:32:06',63),(1110,'Lalaboomboom','Your proposal has been approved by the Council. You may now upload the PRS for endorsement.','2018-08-09 21:32:06',63),(1111,'Lalaboomboom','You have new SE Proposal ready for approval!','2018-08-09 21:32:32',27),(1112,'Lalaboomboom','Congratulations! Your SE Proposal has been approved!','2018-08-09 21:32:50',63),(1113,'Lalaboomboom','₱8500.0 has been deducted to the budget!','2018-08-09 21:32:50',4),(1114,'Lalaboomboom','Congratulations! Your SE Proposal has been approved!','2018-08-09 21:32:50',63),(1115,'Lalaboomboom','₱8500.0 has been deducted to the budget!','2018-08-09 21:32:50',4),(1116,'Lalaboomboom','Accomplishment Report has been submitted!','2018-08-09 21:34:16',17),(1117,'Lalaboomboom','Accomplishment Report has been submitted!','2018-08-09 21:34:20',17),(1118,'CED FF','You have new FF Proposal ready for approval!','2018-08-09 21:42:14',28),(1119,'CED FF','You have new FF Proposal ready for approval!','2018-08-09 21:43:04',29),(1120,'CED FF','Your proposal has been approved by the Chairperson / Director! It will now be taken to the Vice President for Lasallian Mission.','2018-08-09 21:43:04',38),(1121,'CED FF','You have new FF Proposal ready for approval!','2018-08-09 21:43:11',30),(1122,'CED FF','Your proposal has been approved by the Vice President for Lasallian Mission! It will now be taken to the Dean / Unit Head.','2018-08-09 21:43:11',38),(1123,'CED FF','You have new FF Proposal ready for approval!','2018-08-09 21:43:18',31),(1124,'CED FF','Your proposal has been approved by the Dean / Unit Head! It will now be taken to the Assistant Dean for Lasallian Mission / Assistant Unit Head.','2018-08-09 21:43:18',38),(1125,'CED FF','You have new FF Proposal ready for approval!','2018-08-09 21:43:28',32),(1126,'CED FF','Your proposal has been approved by the Assistant Dean for Lasallian Mission / Assistant Unit Head! It will now be taken to the LSPO.','2018-08-09 21:43:28',38),(1127,'CED FF','You have new FF Proposal ready for approval!','2018-08-09 21:43:51',19),(1128,'CED FF','You have new FF Proposal ready for approval!','2018-08-09 21:43:51',20),(1129,'CED FF','You have new FF Proposal ready for approval!','2018-08-09 21:43:51',21),(1130,'CED FF','You have new FF Proposal ready for approval!','2018-08-09 21:43:51',22),(1131,'CED FF','You have new FF Proposal ready for approval!','2018-08-09 21:43:51',23),(1132,'CED FF','Your proposal has been approved by the LSPO! It will now be taken to the LMC Council.','2018-08-09 21:43:51',38),(1133,'CED FF','Nelca Villarin has voted to APPROVE your proposal. Vote Count: 1/5','2018-08-09 21:44:03',38),(1134,'CED FF','Margarita Perdido has voted to APPROVE your proposal. Vote Count: 2/5','2018-08-09 21:44:19',38),(1135,'CED FF','Michael Broughton has voted to APPROVE your proposal. Vote Count: 3/5','2018-08-09 21:44:41',38),(1136,'CED FF','James Laxa has voted to APPROVE your proposal. Vote Count: 4/5','2018-08-09 21:44:53',38),(1137,'CED FF','Fritzie De Vera has voted to APPROVE your proposal. Vote Count: 5/5','2018-08-09 21:45:08',38),(1138,'CED FF','Your proposal has been approved by the Council. You may now upload the PRS for endorsement.','2018-08-09 21:45:08',38),(1139,'CED FF','You have new FF Proposal ready for approval!','2018-08-09 21:45:25',27),(1140,'CED FF','Congratulations! Your FF Proposal has been approved!','2018-08-09 21:46:30',38),(1141,'CED FF','₱10000.0 has been deducted to the budget!','2018-08-09 21:46:30',4),(1142,'CED FF','Accomplishment Report has been submitted!','2018-08-09 21:47:41',17),(1143,'Project Name CED','You have new FF Proposal ready for approval!','2018-08-09 21:52:27',28),(1144,'Project Name CED','You have new FF Proposal ready for approval!','2018-08-09 21:53:25',29),(1145,'Project Name CED','Your proposal has been approved by the Chairperson / Director! It will now be taken to the Vice President for Lasallian Mission.','2018-08-09 21:53:25',40),(1146,'Project Name CED','You have new FF Proposal ready for approval!','2018-08-09 21:53:56',30),(1147,'Project Name CED','Your proposal has been approved by the Vice President for Lasallian Mission! It will now be taken to the Dean / Unit Head.','2018-08-09 21:53:56',40),(1148,'Project Name CED','You have new FF Proposal ready for approval!','2018-08-09 21:54:28',31),(1149,'Project Name CED','Your proposal has been approved by the Dean / Unit Head! It will now be taken to the Assistant Dean for Lasallian Mission / Assistant Unit Head.','2018-08-09 21:54:28',40),(1150,'Project Name CED','You have new FF Proposal ready for approval!','2018-08-09 21:54:40',32),(1151,'Project Name CED','Your proposal has been approved by the Assistant Dean for Lasallian Mission / Assistant Unit Head! It will now be taken to the LSPO.','2018-08-09 21:54:40',40),(1152,'Project Name CED','You have new FF Proposal ready for approval!','2018-08-09 21:55:26',19),(1153,'Project Name CED','You have new FF Proposal ready for approval!','2018-08-09 21:55:26',20),(1154,'Project Name CED','You have new FF Proposal ready for approval!','2018-08-09 21:55:26',21),(1155,'Project Name CED','You have new FF Proposal ready for approval!','2018-08-09 21:55:26',22),(1156,'Project Name CED','You have new FF Proposal ready for approval!','2018-08-09 21:55:26',23),(1157,'Project Name CED','Your proposal has been approved by the LSPO! It will now be taken to the LMC Council.','2018-08-09 21:55:26',40),(1158,'Project Name CED','Nelca Villarin has voted to APPROVE your proposal. Vote Count: 1/5','2018-08-09 21:55:36',40),(1159,'Project Name CED','Margarita Perdido has voted to APPROVE your proposal. Vote Count: 2/5','2018-08-09 21:55:51',40),(1160,'Project Name CED','Michael Broughton has voted to APPROVE your proposal. Vote Count: 3/5','2018-08-09 21:56:04',40),(1161,'Project Name CED','James Laxa has voted to APPROVE your proposal. Vote Count: 4/5','2018-08-09 21:56:16',40),(1162,'Project Name CED','Fritzie De Vera has voted to APPROVE your proposal. Vote Count: 5/5','2018-08-09 21:56:55',40),(1163,'Project Name CED','Congratulations! Your FF Proposal has been approved!','2018-08-09 21:56:55',40),(1164,'Project Name CED','The program has been cancelled!','2018-08-09 21:58:32',17),(1165,'Sampooooool!','You have new FF Proposal ready for approval!','2018-08-09 22:01:27',28),(1166,'Sampooooool!','You have new FF Proposal ready for approval!','2018-08-09 22:01:38',29),(1167,'Sampooooool!','Your proposal has been approved by the Chairperson / Director! It will now be taken to the Vice President for Lasallian Mission.','2018-08-09 22:01:38',40),(1168,'Sampooooool!','You have new FF Proposal ready for approval!','2018-08-09 22:01:49',30),(1169,'Sampooooool!','Your proposal has been approved by the Vice President for Lasallian Mission! It will now be taken to the Dean / Unit Head.','2018-08-09 22:01:49',40),(1170,'Sampooooool!','You have new FF Proposal ready for approval!','2018-08-09 22:01:55',31),(1171,'Sampooooool!','Your proposal has been approved by the Dean / Unit Head! It will now be taken to the Assistant Dean for Lasallian Mission / Assistant Unit Head.','2018-08-09 22:01:55',40),(1172,'Sampooooool!','You have new FF Proposal ready for approval!','2018-08-09 22:02:04',32),(1173,'Sampooooool!','Your proposal has been approved by the Assistant Dean for Lasallian Mission / Assistant Unit Head! It will now be taken to the LSPO.','2018-08-09 22:02:04',40),(1174,'Sampooooool!','You have new FF Proposal ready for approval!','2018-08-09 22:02:22',19),(1175,'Sampooooool!','You have new FF Proposal ready for approval!','2018-08-09 22:02:22',20),(1176,'Sampooooool!','You have new FF Proposal ready for approval!','2018-08-09 22:02:22',21),(1177,'Sampooooool!','You have new FF Proposal ready for approval!','2018-08-09 22:02:22',22),(1178,'Sampooooool!','You have new FF Proposal ready for approval!','2018-08-09 22:02:22',23),(1179,'Sampooooool!','Your proposal has been approved by the LSPO! It will now be taken to the LMC Council.','2018-08-09 22:02:22',40),(1180,'Sampooooool!','Nelca Villarin has voted to APPROVE your proposal. Vote Count: 1/5','2018-08-09 22:02:37',40),(1181,'Sampooooool!','Margarita Perdido has voted to APPROVE your proposal. Vote Count: 2/5','2018-08-09 22:02:54',40),(1182,'Sampooooool!','Michael Broughton has voted to APPROVE your proposal. Vote Count: 3/5','2018-08-09 22:03:06',40),(1183,'Sampooooool!','James Laxa has voted to APPROVE your proposal. Vote Count: 4/5','2018-08-09 22:03:20',40),(1184,'Sampooooool!','Fritzie De Vera has voted to APPROVE your proposal. Vote Count: 5/5','2018-08-09 22:03:33',40),(1185,'Sampooooool!','Your proposal has been approved by the Council. You may now upload the PRS for endorsement.','2018-08-09 22:03:33',40),(1186,'Sampooooool!','You have new FF Proposal ready for approval!','2018-08-09 22:03:52',27),(1187,'Sampooooool!','Congratulations! Your FF Proposal has been approved!','2018-08-09 22:04:08',40),(1188,'Sampooooool!','₱7000.0 has been deducted to the budget!','2018-08-09 22:04:08',4),(1189,'Sampooooool!','Accomplishment Report has been submitted!','2018-08-09 22:05:37',17),(1190,'CCS ST Project','You have new FF Proposal ready for approval!','2018-08-09 22:19:36',28),(1191,'CCS ST Project','You have new FF Proposal ready for approval!','2018-08-09 22:19:50',29),(1192,'CCS ST Project','Your proposal has been approved by the Chairperson / Director! It will now be taken to the Vice President for Lasallian Mission.','2018-08-09 22:19:50',36),(1193,'CCS ST Project','You have new FF Proposal ready for approval!','2018-08-09 22:19:57',30),(1194,'CCS ST Project','Your proposal has been approved by the Vice President for Lasallian Mission! It will now be taken to the Dean / Unit Head.','2018-08-09 22:19:57',36),(1195,'CCS ST Project','You have new FF Proposal ready for approval!','2018-08-09 22:20:04',31),(1196,'CCS ST Project','Your proposal has been approved by the Dean / Unit Head! It will now be taken to the Assistant Dean for Lasallian Mission / Assistant Unit Head.','2018-08-09 22:20:04',36),(1197,'CCS ST Project','You have new FF Proposal ready for approval!','2018-08-09 22:20:24',32),(1198,'CCS ST Project','Your proposal has been approved by the Assistant Dean for Lasallian Mission / Assistant Unit Head! It will now be taken to the LSPO.','2018-08-09 22:20:24',36),(1199,'CCS ST Project','You have new FF Proposal ready for approval!','2018-08-09 22:22:02',19),(1200,'CCS ST Project','You have new FF Proposal ready for approval!','2018-08-09 22:22:02',20),(1201,'CCS ST Project','You have new FF Proposal ready for approval!','2018-08-09 22:22:02',21),(1202,'CCS ST Project','You have new FF Proposal ready for approval!','2018-08-09 22:22:02',22),(1203,'CCS ST Project','You have new FF Proposal ready for approval!','2018-08-09 22:22:02',23),(1204,'CCS ST Project','Your proposal has been approved by the LSPO! It will now be taken to the LMC Council.','2018-08-09 22:22:02',36),(1205,'CCS ST Project','Nelca Villarin has voted to APPROVE your proposal. Vote Count: 1/5','2018-08-09 22:22:21',36),(1206,'CCS ST Project','Margarita Perdido has voted to APPROVE your proposal. Vote Count: 2/5','2018-08-09 22:22:34',36),(1207,'CCS ST Project','Michael Broughton has voted to APPROVE your proposal. Vote Count: 3/5','2018-08-09 22:22:46',36),(1208,'CCS ST Project','James Laxa has voted to APPROVE your proposal. Vote Count: 4/5','2018-08-09 22:22:58',36),(1209,'CCS ST Project','Fritzie De Vera has voted to APPROVE your proposal. Vote Count: 5/5','2018-08-09 22:23:08',36),(1210,'CCS ST Project','Your proposal has been approved by the Council. You may now upload the PRS for endorsement.','2018-08-09 22:23:08',36),(1211,'CCS ST Project','You have new FF Proposal ready for approval!','2018-08-09 22:25:27',27),(1212,'CCS ST Project','You have new FF Proposal ready for approval!','2018-08-09 22:28:34',27),(1213,'CCS ST Project','You have new FF Proposal ready for approval!','2018-08-09 22:30:17',27),(1214,'CCS ST Project','You have new FF Proposal ready for approval!','2018-08-09 22:30:54',27),(1215,'CCS ST Project','Congratulations! Your FF Proposal has been approved!','2018-08-09 22:31:18',36),(1216,'CCS ST Project','₱8000.0 has been deducted to the budget!','2018-08-09 22:31:18',4),(1217,'CCS ST Project','Accomplishment Report has been submitted!','2018-08-09 22:32:21',17),(1218,'Civil Program!','You have new SE Proposal ready for approval!','2018-08-09 22:46:11',13),(1219,'Civil Program!','You have new SE Proposal ready for approval!','2018-08-09 22:46:34',14),(1220,'Civil Program!','Your proposal has been approved by the Department / Unit Chair! It will now be taken to the External Affairs / SE Director.','2018-08-09 22:46:34',64),(1221,'Civil Program!','You have new SE Proposal ready for approval!','2018-08-09 22:46:46',15),(1222,'Civil Program!','Your proposal has been approved by the External Affairs / SE Director! It will now be taken to the Dean / VP / VC.','2018-08-09 22:46:46',64),(1223,'Civil Program!','You have new SE Proposal ready for approval!','2018-08-09 22:46:59',18),(1224,'Civil Program!','A proposal has been received by COSCA.','2018-08-09 22:46:59',17),(1225,'Civil Program!','Your proposal has been approved by the Dean / VP / VC! It will now be taken to the COSCA.','2018-08-09 22:46:59',64),(1226,'Civil Program!','You have new SE Proposal ready for approval!','2018-08-09 22:47:10',19),(1227,'Civil Program!','You have new SE Proposal ready for approval!','2018-08-09 22:47:10',20),(1228,'Civil Program!','You have new SE Proposal ready for approval!','2018-08-09 22:47:10',21),(1229,'Civil Program!','You have new SE Proposal ready for approval!','2018-08-09 22:47:10',22),(1230,'Civil Program!','You have new SE Proposal ready for approval!','2018-08-09 22:47:10',23),(1231,'Civil Program!','Your proposal has been approved by the COSCA. It will now be taken to the LMC Council.','2018-08-09 22:47:10',64),(1232,'Civil Program!','Nelca Villarin has voted to APPROVE your proposal. Vote Count: 1/5','2018-08-09 22:48:04',64),(1233,'Civil Program!','Margarita Perdido has voted to APPROVE your proposal. Vote Count: 2/5','2018-08-09 22:48:15',64),(1234,'Civil Program!','Michael Broughton has voted to APPROVE your proposal. Vote Count: 3/5','2018-08-09 22:48:27',64),(1235,'Civil Program!','James Laxa has voted to APPROVE your proposal. Vote Count: 4/5','2018-08-09 22:48:43',64),(1236,'Civil Program!','Fritzie De Vera has voted to APPROVE your proposal. Vote Count: 5/5','2018-08-09 22:48:54',64),(1237,'Civil Program!','Congratulations! Your SE Proposal has been approved!','2018-08-09 22:48:55',64),(1238,'Civil Program!','Accomplishment Report has been submitted!','2018-08-09 22:50:13',17),(1239,'Civil Program!','Accomplishment Report has been submitted!','2018-08-09 22:52:13',17),(1240,'Civil Program!','Accomplishment Report has been submitted!','2018-08-09 22:52:20',17),(1241,'Faith for Engineering','You have new FF Proposal ready for approval!','2018-08-09 22:56:04',28),(1242,'Faith for Engineering','You have new FF Proposal ready for approval!','2018-08-09 22:56:15',29),(1243,'Faith for Engineering','Your proposal has been approved by the Chairperson / Director! It will now be taken to the Vice President for Lasallian Mission.','2018-08-09 22:56:15',64),(1244,'Faith for Engineering','You have new FF Proposal ready for approval!','2018-08-09 22:56:23',30),(1245,'Faith for Engineering','Your proposal has been approved by the Vice President for Lasallian Mission! It will now be taken to the Dean / Unit Head.','2018-08-09 22:56:23',64),(1246,'Faith for Engineering','You have new FF Proposal ready for approval!','2018-08-09 22:56:32',31),(1247,'Faith for Engineering','Your proposal has been approved by the Dean / Unit Head! It will now be taken to the Assistant Dean for Lasallian Mission / Assistant Unit Head.','2018-08-09 22:56:32',64),(1248,'Faith for Engineering','You have new FF Proposal ready for approval!','2018-08-09 22:56:42',32),(1249,'Faith for Engineering','Your proposal has been approved by the Assistant Dean for Lasallian Mission / Assistant Unit Head! It will now be taken to the LSPO.','2018-08-09 22:56:42',64),(1250,'Faith for Engineering','You have new FF Proposal ready for approval!','2018-08-09 22:57:01',19),(1251,'Faith for Engineering','You have new FF Proposal ready for approval!','2018-08-09 22:57:01',20),(1252,'Faith for Engineering','You have new FF Proposal ready for approval!','2018-08-09 22:57:01',21),(1253,'Faith for Engineering','You have new FF Proposal ready for approval!','2018-08-09 22:57:01',22),(1254,'Faith for Engineering','You have new FF Proposal ready for approval!','2018-08-09 22:57:01',23),(1255,'Faith for Engineering','Your proposal has been approved by the LSPO! It will now be taken to the LMC Council.','2018-08-09 22:57:01',64),(1256,'Faith for Engineering','Nelca Villarin has voted to APPROVE your proposal. Vote Count: 1/5','2018-08-09 22:57:14',64),(1257,'Faith for Engineering','Margarita Perdido has voted to APPROVE your proposal. Vote Count: 2/5','2018-08-09 22:57:27',64),(1258,'Faith for Engineering','Michael Broughton has voted to APPROVE your proposal. Vote Count: 3/5','2018-08-09 22:57:43',64),(1259,'Faith for Engineering','James Laxa has voted to APPROVE your proposal. Vote Count: 4/5','2018-08-09 22:58:05',64),(1260,'Faith for Engineering','Fritzie De Vera has voted to APPROVE your proposal. Vote Count: 5/5','2018-08-09 22:58:16',64),(1261,'Faith for Engineering','Congratulations! Your FF Proposal has been approved!','2018-08-09 22:58:16',64),(1262,'Faith for Engineering','Accomplishment Report has been submitted!','2018-08-09 22:59:33',17),(1263,'Razor Program','You have new SE Proposal ready for approval!','2018-08-09 23:12:18',13),(1264,'Razor Program','You have new SE Proposal ready for approval!','2018-08-09 23:13:01',14),(1265,'Razor Program','Your proposal has been approved by the Department / Unit Chair! It will now be taken to the External Affairs / SE Director.','2018-08-09 23:13:01',65),(1266,'Razor Program','You have new SE Proposal ready for approval!','2018-08-09 23:13:11',15),(1267,'Razor Program','Your proposal has been approved by the External Affairs / SE Director! It will now be taken to the Dean / VP / VC.','2018-08-09 23:13:11',65),(1268,'Razor Program','You have new SE Proposal ready for approval!','2018-08-09 23:13:29',18),(1269,'Razor Program','A proposal has been received by COSCA.','2018-08-09 23:13:29',17),(1270,'Razor Program','Your proposal has been approved by the Dean / VP / VC! It will now be taken to the COSCA.','2018-08-09 23:13:29',65),(1271,'Razor Program','You have new SE Proposal ready for approval!','2018-08-09 23:13:42',19),(1272,'Razor Program','You have new SE Proposal ready for approval!','2018-08-09 23:13:42',20),(1273,'Razor Program','You have new SE Proposal ready for approval!','2018-08-09 23:13:42',21),(1274,'Razor Program','You have new SE Proposal ready for approval!','2018-08-09 23:13:42',22),(1275,'Razor Program','You have new SE Proposal ready for approval!','2018-08-09 23:13:42',23),(1276,'Razor Program','Your proposal has been approved by the COSCA. It will now be taken to the LMC Council.','2018-08-09 23:13:42',65),(1277,'Razor Program','Nelca Villarin has voted to APPROVE your proposal. Vote Count: 1/5','2018-08-09 23:14:06',65),(1278,'Razor Program','Margarita Perdido has voted to APPROVE your proposal. Vote Count: 2/5','2018-08-09 23:14:33',65),(1279,'Razor Program','Michael Broughton has voted to APPROVE your proposal. Vote Count: 3/5','2018-08-09 23:15:10',65),(1280,'Razor Program','James Laxa has voted to APPROVE your proposal. Vote Count: 4/5','2018-08-09 23:16:02',65),(1281,'Razor Program','Fritzie De Vera has voted to APPROVE your proposal. Vote Count: 5/5','2018-08-09 23:16:16',65),(1282,'Razor Program','Congratulations! Your SE Proposal has been approved!','2018-08-09 23:16:16',65),(1283,'Razor Program','Accomplishment Report has been submitted!','2018-08-09 23:17:18',17),(1284,'Razor Program','Accomplishment Report has been submitted!','2018-08-09 23:21:45',17),(1285,'Razor Program','Accomplishment Report has been submitted!','2018-08-09 23:49:31',17),(1286,'Razor Program','Accomplishment Report has been submitted!','2018-08-09 23:52:55',17),(1287,'YEAH','You have new SE Proposal ready for approval!','2018-08-10 00:01:21',13),(1288,'YEAH','You have new SE Proposal ready for approval!','2018-08-10 00:01:45',14),(1289,'YEAH','You have new SE Proposal ready for approval!','2018-08-10 00:01:45',14),(1290,'YEAH','Your proposal has been approved by the Department / Unit Chair! It will now be taken to the External Affairs / SE Director.','2018-08-10 00:01:45',66),(1291,'YEAH','Your proposal has been approved by the Department / Unit Chair! It will now be taken to the External Affairs / SE Director.','2018-08-10 00:01:45',66),(1292,'YEAH','You have new SE Proposal ready for approval!','2018-08-10 00:01:56',15),(1293,'YEAH','Your proposal has been approved by the External Affairs / SE Director! It will now be taken to the Dean / VP / VC.','2018-08-10 00:01:56',66),(1294,'YEAH','You have new SE Proposal ready for approval!','2018-08-10 00:02:06',18),(1295,'YEAH','A proposal has been received by COSCA.','2018-08-10 00:02:06',17),(1296,'YEAH','Your proposal has been approved by the Dean / VP / VC! It will now be taken to the COSCA.','2018-08-10 00:02:06',66),(1297,'YEAH','You have new SE Proposal ready for approval!','2018-08-10 00:03:12',19),(1298,'YEAH','You have new SE Proposal ready for approval!','2018-08-10 00:03:12',20),(1299,'YEAH','You have new SE Proposal ready for approval!','2018-08-10 00:03:12',21),(1300,'YEAH','You have new SE Proposal ready for approval!','2018-08-10 00:03:12',22),(1301,'YEAH','You have new SE Proposal ready for approval!','2018-08-10 00:03:12',23),(1302,'YEAH','Your proposal has been approved by the COSCA. It will now be taken to the LMC Council.','2018-08-10 00:03:12',66),(1303,'YEAH','Nelca Villarin has voted to APPROVE your proposal. Vote Count: 1/5','2018-08-10 00:03:26',66),(1304,'YEAH','Margarita Perdido has voted to APPROVE your proposal. Vote Count: 2/5','2018-08-10 00:03:36',66),(1305,'YEAH','Michael Broughton has voted to APPROVE your proposal. Vote Count: 3/5','2018-08-10 00:03:49',66),(1306,'YEAH','James Laxa has voted to APPROVE your proposal. Vote Count: 4/5','2018-08-10 00:04:00',66),(1307,'YEAH','Fritzie De Vera has voted to APPROVE your proposal. Vote Count: 5/5','2018-08-10 00:04:18',66),(1308,'YEAH','Your proposal has been approved by the Council. You may now upload the PRS for endorsement.','2018-08-10 00:04:18',66),(1309,'YEAH','You have new SE Proposal ready for approval!','2018-08-10 00:04:35',27),(1310,'YEAH','Congratulations! Your SE Proposal has been approved!','2018-08-10 00:04:51',66),(1311,'YEAH','₱1000.0 has been deducted to the budget!','2018-08-10 00:04:51',4),(1312,'YEAH','Accomplishment Report has been submitted!','2018-08-10 00:06:06',17),(1313,'Recollect','You have new FF Proposal ready for approval!','2018-08-10 00:08:55',28),(1314,'Recollect','You have new FF Proposal ready for approval!','2018-08-10 00:09:09',29),(1315,'Recollect','Your proposal has been approved by the Chairperson / Director! It will now be taken to the Vice President for Lasallian Mission.','2018-08-10 00:09:09',66),(1316,'Recollect','You have new FF Proposal ready for approval!','2018-08-10 00:09:19',30),(1317,'Recollect','Your proposal has been approved by the Vice President for Lasallian Mission! It will now be taken to the Dean / Unit Head.','2018-08-10 00:09:19',66),(1318,'Recollect','You have new FF Proposal ready for approval!','2018-08-10 00:09:30',31),(1319,'Recollect','Your proposal has been approved by the Dean / Unit Head! It will now be taken to the Assistant Dean for Lasallian Mission / Assistant Unit Head.','2018-08-10 00:09:30',66),(1320,'Recollect','You have new FF Proposal ready for approval!','2018-08-10 00:09:39',32),(1321,'Recollect','Your proposal has been approved by the Assistant Dean for Lasallian Mission / Assistant Unit Head! It will now be taken to the LSPO.','2018-08-10 00:09:39',66),(1322,'Recollect','You have new FF Proposal ready for approval!','2018-08-10 00:09:52',19),(1323,'Recollect','You have new FF Proposal ready for approval!','2018-08-10 00:09:52',20),(1324,'Recollect','You have new FF Proposal ready for approval!','2018-08-10 00:09:52',21),(1325,'Recollect','You have new FF Proposal ready for approval!','2018-08-10 00:09:52',22),(1326,'Recollect','You have new FF Proposal ready for approval!','2018-08-10 00:09:52',23),(1327,'Recollect','Your proposal has been approved by the LSPO! It will now be taken to the LMC Council.','2018-08-10 00:09:52',66),(1328,'Recollect','Nelca Villarin has voted to APPROVE your proposal. Vote Count: 1/5','2018-08-10 00:10:05',66),(1329,'Recollect','Margarita Perdido has voted to APPROVE your proposal. Vote Count: 2/5','2018-08-10 00:10:17',66),(1330,'Recollect','Michael Broughton has voted to APPROVE your proposal. Vote Count: 3/5','2018-08-10 00:10:30',66),(1331,'Recollect','James Laxa has voted to APPROVE your proposal. Vote Count: 4/5','2018-08-10 00:10:41',66),(1332,'Recollect','James Laxa has voted to APPROVE your proposal. Vote Count: 5/5','2018-08-10 00:10:41',66),(1333,'Recollect','Fritzie De Vera has voted to APPROVE your proposal. Vote Count: 6/5','2018-08-10 00:10:59',66),(1334,'Recollect','Congratulations! Your FF Proposal has been approved!','2018-08-10 00:10:59',66),(1335,'Recollect','Accomplishment Report has been submitted!','2018-08-10 00:15:47',17),(1336,'CCS Outreach 2018','You have new SE Proposal ready for approval!','2018-08-10 00:45:53',13),(1337,'CCS Outreach 2018','You have new SE Proposal ready for approval!','2018-08-10 00:48:51',14),(1338,'CCS Outreach 2018','Your proposal has been approved by the Department / Unit Chair! It will now be taken to the External Affairs / SE Director.','2018-08-10 00:48:51',66),(1339,'CCS Outreach 2018','You have new SE Proposal ready for approval!','2018-08-10 00:49:00',15),(1340,'CCS Outreach 2018','Your proposal has been approved by the External Affairs / SE Director! It will now be taken to the Dean / VP / VC.','2018-08-10 00:49:00',66),(1341,'CCS Outreach 2018','You have new SE Proposal ready for approval!','2018-08-10 00:49:14',18),(1342,'CCS Outreach 2018','A proposal has been received by COSCA.','2018-08-10 00:49:14',17),(1343,'CCS Outreach 2018','Your proposal has been approved by the Dean / VP / VC! It will now be taken to the COSCA.','2018-08-10 00:49:14',66),(1344,'Chemistry','You have new SE Proposal ready for approval!','2018-08-10 01:02:25',13),(1345,'Chemistry','You have new SE Proposal ready for approval!','2018-08-10 01:02:42',14),(1346,'Chemistry','Your proposal has been approved by the Department / Unit Chair! It will now be taken to the External Affairs / SE Director.','2018-08-10 01:02:42',56),(1347,'Chemistry','You have new SE Proposal ready for approval!','2018-08-10 01:02:53',15),(1348,'Chemistry','Your proposal has been approved by the External Affairs / SE Director! It will now be taken to the Dean / VP / VC.','2018-08-10 01:02:53',56),(1349,'Chemistry','You have new SE Proposal ready for approval!','2018-08-10 01:03:06',18),(1350,'Chemistry','A proposal has been received by COSCA.','2018-08-10 01:03:06',17),(1351,'Chemistry','Your proposal has been approved by the Dean / VP / VC! It will now be taken to the COSCA.','2018-08-10 01:03:06',56),(1352,'Chemistry','You have new SE Proposal ready for approval!','2018-08-10 01:03:17',19),(1353,'Chemistry','You have new SE Proposal ready for approval!','2018-08-10 01:03:17',20),(1354,'Chemistry','You have new SE Proposal ready for approval!','2018-08-10 01:03:17',21),(1355,'Chemistry','You have new SE Proposal ready for approval!','2018-08-10 01:03:17',22),(1356,'Chemistry','You have new SE Proposal ready for approval!','2018-08-10 01:03:17',23),(1357,'Chemistry','Your proposal has been approved by the COSCA. It will now be taken to the LMC Council.','2018-08-10 01:03:17',56),(1358,'Chemistry','Nelca Villarin has voted to APPROVE your proposal. Vote Count: 1/5','2018-08-10 01:03:29',56),(1359,'Chemistry','Margarita Perdido has voted to APPROVE your proposal. Vote Count: 2/5','2018-08-10 01:03:44',56),(1360,'Chemistry','Michael Broughton has voted to APPROVE your proposal. Vote Count: 3/5','2018-08-10 01:04:07',56),(1361,'Chemistry','James Laxa has voted to APPROVE your proposal. Vote Count: 4/5','2018-08-10 01:04:21',56),(1362,'Chemistry','Fritzie De Vera has voted to APPROVE your proposal. Vote Count: 5/5','2018-08-10 01:04:32',56),(1363,'Chemistry','Congratulations! Your SE Proposal has been approved!','2018-08-10 01:04:33',56),(1364,'Chemistry','Accomplishment Report has been submitted!','2018-08-10 01:05:57',17),(1366,'CCS Outreach 2018','Your proposal has some revisions before it is approved by Sir Neil.','2018-08-10 01:20:58',66),(1367,'CCS Outreach 2018','You have a Revised SE Proposal ready for approval!','2018-08-10 01:22:45',18),(1368,'Reco @ Karl\'s','You have new FF Proposal ready for approval!','2018-08-10 01:50:56',28),(1369,'Reco @ Karl\'s','The program has been cancelled!','2018-08-10 02:05:51',17),(1370,'CCS Outreach 2018','You have new SE Proposal ready for approval!','2018-08-10 02:10:52',19),(1371,'CCS Outreach 2018','You have new SE Proposal ready for approval!','2018-08-10 02:10:52',20),(1372,'CCS Outreach 2018','You have new SE Proposal ready for approval!','2018-08-10 02:10:52',21),(1373,'CCS Outreach 2018','You have new SE Proposal ready for approval!','2018-08-10 02:10:52',22),(1374,'CCS Outreach 2018','You have new SE Proposal ready for approval!','2018-08-10 02:10:52',23),(1375,'CCS Outreach 2018','Your proposal has been approved by the COSCA. It will now be taken to the LMC Council.','2018-08-10 02:10:52',66),(1376,'CCS Outreach 2018','Nelca Villarin has voted to APPROVE your proposal. Vote Count: 1/5','2018-08-10 02:11:07',66),(1377,'CCS Outreach 2018','Margarita Perdido has voted to APPROVE your proposal. Vote Count: 2/5','2018-08-10 02:11:17',66),(1378,'CCS Outreach 2018','Michael Broughton has voted to APPROVE your proposal. Vote Count: 3/5','2018-08-10 02:11:32',66),(1379,'CCS Outreach 2018','James Laxa has voted to APPROVE your proposal. Vote Count: 4/5','2018-08-10 02:11:59',66),(1380,'CCS Outreach 2018','Fritzie De Vera has voted to APPROVE your proposal. Vote Count: 5/5','2018-08-10 02:12:12',66),(1381,'CCS Outreach 2018','Your proposal has been approved by the Council. You may now upload the PRS for endorsement.','2018-08-10 02:12:12',66),(1382,'CCS Outreach 2018','You have new SE Proposal ready for approval!','2018-08-10 02:12:33',27),(1383,'CCS Outreach 2018','Congratulations! Your SE Proposal has been approved!','2018-08-10 02:12:58',66),(1384,'CCS Outreach 2018','₱25000.0 has been deducted to the budget!','2018-08-10 02:12:58',4),(1385,'CCS Outreach 2018','Accomplishment Report has been submitted!','2018-08-10 02:36:32',17),(1386,'CHEM Baseball Party with the QC Tambays','You have new SE Proposal ready for approval!','2018-08-10 03:07:04',13),(1387,'Dasalan tayo mga pare','You have new FF Proposal ready for approval!','2018-08-10 03:09:59',28),(1388,'MATH Turuan ang mga bata','You have new SE Proposal ready for approval!','2018-08-10 03:12:52',13),(1389,'MATHalinong retreat','You have new FF Proposal ready for approval!','2018-08-10 03:14:33',28),(1390,'PHYSICS Bilyaran sa kalye','You have new SE Proposal ready for approval!','2018-08-10 03:16:46',13),(1391,'SOEIAE Kainan sa Tapsilugan','You have new SE Proposal ready for approval!','2018-08-10 03:18:42',13),(1392,'SOEIAE Retreat for faith','You have new FF Proposal ready for approval!','2018-08-10 03:19:58',28),(1393,'SOEFAE Tulakan sa tulay','You have new SE Proposal ready for approval!','2018-08-10 03:22:04',13),(1394,'SOEFAE retreat','You have new FF Proposal ready for approval!','2018-08-10 03:23:29',28),(1395,'SOELAE Kalbuhan sa barbershop','You have new SE Proposal ready for approval!','2018-08-10 03:25:44',13),(1396,'SOELAE retreat','You have new FF Proposal ready for approval!','2018-08-10 03:27:23',28),(1397,'SOEMFI','You have new SE Proposal ready for approval!','2018-08-10 03:29:59',13),(1398,'SOEMFI Retreat','You have new FF Proposal ready for approval!','2018-08-10 03:31:30',28),(1399,'SOEMOD Shopping sa dumpster','You have new SE Proposal ready for approval!','2018-08-10 03:39:31',13),(1400,'SOEMOD','You have new FF Proposal ready for approval!','2018-08-10 03:41:16',28),(1401,'Introduction to Business','You have new SE Proposal ready for approval!','2018-08-10 03:41:48',14),(1402,'Introduction to Business','Your proposal has been approved by the Department / Unit Chair! It will now be taken to the External Affairs / SE Director.','2018-08-10 03:41:48',4),(1403,'CEPD Disciplinary Values Reachout','You have new SE Proposal ready for approval!','2018-08-10 03:41:56',14),(1404,'CEPD Disciplinary Values Reachout','Your proposal has been approved by the Department / Unit Chair! It will now be taken to the External Affairs / SE Director.','2018-08-10 03:41:56',37),(1405,'SOEMOD Shopping sa dumpster','You have new SE Proposal ready for approval!','2018-08-10 03:42:03',14),(1406,'SOEMOD Shopping sa dumpster','Your proposal has been approved by the Department / Unit Chair! It will now be taken to the External Affairs / SE Director.','2018-08-10 03:42:03',70),(1407,'SOEMFI','You have new SE Proposal ready for approval!','2018-08-10 03:42:10',14),(1408,'SOEMFI','Your proposal has been approved by the Department / Unit Chair! It will now be taken to the External Affairs / SE Director.','2018-08-10 03:42:10',69),(1409,'SOELAE Kalbuhan sa barbershop','You have new SE Proposal ready for approval!','2018-08-10 03:42:16',14),(1410,'SOELAE Kalbuhan sa barbershop','Your proposal has been approved by the Department / Unit Chair! It will now be taken to the External Affairs / SE Director.','2018-08-10 03:42:16',68),(1411,'SOEFAE Tulakan sa tulay','You have new SE Proposal ready for approval!','2018-08-10 03:42:22',14),(1412,'SOEFAE Tulakan sa tulay','Your proposal has been approved by the Department / Unit Chair! It will now be taken to the External Affairs / SE Director.','2018-08-10 03:42:22',67),(1413,'SOEIAE Kainan sa Tapsilugan','You have new SE Proposal ready for approval!','2018-08-10 03:42:29',14),(1414,'SOEIAE Kainan sa Tapsilugan','Your proposal has been approved by the Department / Unit Chair! It will now be taken to the External Affairs / SE Director.','2018-08-10 03:42:29',55),(1415,'PHYSICS Bilyaran sa kalye','You have new SE Proposal ready for approval!','2018-08-10 03:42:36',14),(1416,'PHYSICS Bilyaran sa kalye','Your proposal has been approved by the Department / Unit Chair! It will now be taken to the External Affairs / SE Director.','2018-08-10 03:42:36',58),(1417,'MATH Turuan ang mga bata','You have new SE Proposal ready for approval!','2018-08-10 03:42:41',14),(1418,'MATH Turuan ang mga bata','Your proposal has been approved by the Department / Unit Chair! It will now be taken to the External Affairs / SE Director.','2018-08-10 03:42:41',57),(1419,'CHEM Baseball Party with the QC Tambays','You have new SE Proposal ready for approval!','2018-08-10 03:42:45',14),(1420,'CHEM Baseball Party with the QC Tambays','Your proposal has been approved by the Department / Unit Chair! It will now be taken to the External Affairs / SE Director.','2018-08-10 03:42:45',56),(1421,'CEPD Disciplinary Values Reachout','You have new SE Proposal ready for approval!','2018-08-10 03:42:51',14),(1422,'CEPD Disciplinary Values Reachout','Your proposal has been approved by the Department / Unit Chair! It will now be taken to the External Affairs / SE Director.','2018-08-10 03:42:51',37),(1423,'CEPD Disciplinary Values Reachout','You have new SE Proposal ready for approval!','2018-08-10 03:42:56',14),(1424,'CEPD Disciplinary Values Reachout','Your proposal has been approved by the Department / Unit Chair! It will now be taken to the External Affairs / SE Director.','2018-08-10 03:42:56',37),(1425,'SOEMOD Shopping sa dumpster','You have new SE Proposal ready for approval!','2018-08-10 03:43:10',15),(1426,'SOEMOD Shopping sa dumpster','Your proposal has been approved by the External Affairs / SE Director! It will now be taken to the Dean / VP / VC.','2018-08-10 03:43:10',70),(1427,'SOELAE Kalbuhan sa barbershop','You have new SE Proposal ready for approval!','2018-08-10 03:43:14',15),(1428,'SOELAE Kalbuhan sa barbershop','Your proposal has been approved by the External Affairs / SE Director! It will now be taken to the Dean / VP / VC.','2018-08-10 03:43:14',68),(1429,'SOEMFI','You have new SE Proposal ready for approval!','2018-08-10 03:43:21',15),(1430,'SOEMFI','Your proposal has been approved by the External Affairs / SE Director! It will now be taken to the Dean / VP / VC.','2018-08-10 03:43:21',69),(1431,'SOEFAE Tulakan sa tulay','You have new SE Proposal ready for approval!','2018-08-10 03:43:25',15),(1432,'SOEFAE Tulakan sa tulay','Your proposal has been approved by the External Affairs / SE Director! It will now be taken to the Dean / VP / VC.','2018-08-10 03:43:25',67),(1433,'SOEIAE Kainan sa Tapsilugan','You have new SE Proposal ready for approval!','2018-08-10 03:43:29',15),(1434,'SOEIAE Kainan sa Tapsilugan','Your proposal has been approved by the External Affairs / SE Director! It will now be taken to the Dean / VP / VC.','2018-08-10 03:43:29',55),(1435,'PHYSICS Bilyaran sa kalye','You have new SE Proposal ready for approval!','2018-08-10 03:43:32',15),(1436,'PHYSICS Bilyaran sa kalye','Your proposal has been approved by the External Affairs / SE Director! It will now be taken to the Dean / VP / VC.','2018-08-10 03:43:32',58),(1437,'MATH Turuan ang mga bata','You have new SE Proposal ready for approval!','2018-08-10 03:43:36',15),(1438,'MATH Turuan ang mga bata','Your proposal has been approved by the External Affairs / SE Director! It will now be taken to the Dean / VP / VC.','2018-08-10 03:43:36',57),(1439,'CHEM Baseball Party with the QC Tambays','You have new SE Proposal ready for approval!','2018-08-10 03:43:39',15),(1440,'CHEM Baseball Party with the QC Tambays','Your proposal has been approved by the External Affairs / SE Director! It will now be taken to the Dean / VP / VC.','2018-08-10 03:43:39',56),(1441,'SOEMOD Shopping sa dumpster','You have new SE Proposal ready for approval!','2018-08-10 03:43:57',18),(1442,'SOEMOD Shopping sa dumpster','A proposal has been received by COSCA.','2018-08-10 03:43:57',17),(1443,'SOEMOD Shopping sa dumpster','Your proposal has been approved by the Dean / VP / VC! It will now be taken to the COSCA.','2018-08-10 03:43:57',70),(1444,'SOEIAE Kainan sa Tapsilugan','You have new SE Proposal ready for approval!','2018-08-10 03:44:00',18),(1445,'SOEIAE Kainan sa Tapsilugan','A proposal has been received by COSCA.','2018-08-10 03:44:00',17),(1446,'SOEIAE Kainan sa Tapsilugan','Your proposal has been approved by the Dean / VP / VC! It will now be taken to the COSCA.','2018-08-10 03:44:00',55),(1447,'SOEMFI','You have new SE Proposal ready for approval!','2018-08-10 03:44:03',18),(1448,'SOEMFI','A proposal has been received by COSCA.','2018-08-10 03:44:03',17),(1449,'SOEMFI','Your proposal has been approved by the Dean / VP / VC! It will now be taken to the COSCA.','2018-08-10 03:44:03',69),(1450,'SOELAE Kalbuhan sa barbershop','You have new SE Proposal ready for approval!','2018-08-10 03:44:07',18),(1451,'SOELAE Kalbuhan sa barbershop','A proposal has been received by COSCA.','2018-08-10 03:44:07',17),(1452,'SOELAE Kalbuhan sa barbershop','Your proposal has been approved by the Dean / VP / VC! It will now be taken to the COSCA.','2018-08-10 03:44:07',68),(1453,'SOEFAE Tulakan sa tulay','You have new SE Proposal ready for approval!','2018-08-10 03:44:11',18),(1454,'SOEFAE Tulakan sa tulay','A proposal has been received by COSCA.','2018-08-10 03:44:11',17),(1455,'SOEFAE Tulakan sa tulay','Your proposal has been approved by the Dean / VP / VC! It will now be taken to the COSCA.','2018-08-10 03:44:11',67),(1456,'PHYSICS Bilyaran sa kalye','You have new SE Proposal ready for approval!','2018-08-10 03:44:15',18),(1457,'PHYSICS Bilyaran sa kalye','A proposal has been received by COSCA.','2018-08-10 03:44:15',17),(1458,'PHYSICS Bilyaran sa kalye','Your proposal has been approved by the Dean / VP / VC! It will now be taken to the COSCA.','2018-08-10 03:44:15',58),(1459,'MATH Turuan ang mga bata','You have new SE Proposal ready for approval!','2018-08-10 03:44:18',18),(1460,'MATH Turuan ang mga bata','A proposal has been received by COSCA.','2018-08-10 03:44:18',17),(1461,'MATH Turuan ang mga bata','Your proposal has been approved by the Dean / VP / VC! It will now be taken to the COSCA.','2018-08-10 03:44:18',57),(1462,'CHEM Baseball Party with the QC Tambays','You have new SE Proposal ready for approval!','2018-08-10 03:44:21',18),(1463,'CHEM Baseball Party with the QC Tambays','A proposal has been received by COSCA.','2018-08-10 03:44:21',17),(1464,'CHEM Baseball Party with the QC Tambays','Your proposal has been approved by the Dean / VP / VC! It will now be taken to the COSCA.','2018-08-10 03:44:21',56),(1465,'SOEMFI Retreat','You have new FF Proposal ready for approval!','2018-08-10 03:44:32',29),(1466,'SOEMFI Retreat','Your proposal has been approved by the Chairperson / Director! It will now be taken to the Vice President for Lasallian Mission.','2018-08-10 03:44:32',69),(1467,'SOEMOD','You have new FF Proposal ready for approval!','2018-08-10 03:44:35',29),(1468,'SOEMOD','Your proposal has been approved by the Chairperson / Director! It will now be taken to the Vice President for Lasallian Mission.','2018-08-10 03:44:35',70),(1469,'SOELAE retreat','You have new FF Proposal ready for approval!','2018-08-10 03:44:38',29),(1470,'SOELAE retreat','Your proposal has been approved by the Chairperson / Director! It will now be taken to the Vice President for Lasallian Mission.','2018-08-10 03:44:38',68),(1471,'SOEFAE retreat','You have new FF Proposal ready for approval!','2018-08-10 03:44:41',29),(1472,'SOEFAE retreat','Your proposal has been approved by the Chairperson / Director! It will now be taken to the Vice President for Lasallian Mission.','2018-08-10 03:44:41',67),(1473,'SOEIAE Retreat for faith','You have new FF Proposal ready for approval!','2018-08-10 03:44:44',29),(1474,'SOEIAE Retreat for faith','Your proposal has been approved by the Chairperson / Director! It will now be taken to the Vice President for Lasallian Mission.','2018-08-10 03:44:44',55),(1475,'MATHalinong retreat','You have new FF Proposal ready for approval!','2018-08-10 03:44:46',29),(1476,'MATHalinong retreat','Your proposal has been approved by the Chairperson / Director! It will now be taken to the Vice President for Lasallian Mission.','2018-08-10 03:44:46',57),(1477,'Dasalan tayo mga pare','You have new FF Proposal ready for approval!','2018-08-10 03:44:49',29),(1478,'Dasalan tayo mga pare','Your proposal has been approved by the Chairperson / Director! It will now be taken to the Vice President for Lasallian Mission.','2018-08-10 03:44:49',56),(1479,'Retreat para sa mga hindi banal','You have new FF Proposal ready for approval!','2018-08-10 03:44:52',29),(1480,'Retreat para sa mga hindi banal','Your proposal has been approved by the Chairperson / Director! It will now be taken to the Vice President for Lasallian Mission.','2018-08-10 03:44:52',52),(1481,'SAMPLE','You have new FF Proposal ready for approval!','2018-08-10 03:44:55',29),(1482,'SAMPLE','Your proposal has been approved by the Chairperson / Director! It will now be taken to the Vice President for Lasallian Mission.','2018-08-10 03:44:55',4),(1483,'Microsft Investments','You have new FF Proposal ready for approval!','2018-08-10 03:44:58',29),(1484,'Microsft Investments','Your proposal has been approved by the Chairperson / Director! It will now be taken to the Vice President for Lasallian Mission.','2018-08-10 03:44:58',4),(1485,'SOEMOD','You have new FF Proposal ready for approval!','2018-08-10 03:45:14',30),(1486,'SOEMOD','Your proposal has been approved by the Vice President for Lasallian Mission! It will now be taken to the Dean / Unit Head.','2018-08-10 03:45:14',70),(1487,'Retreat para sa mga hindi banal','You have new FF Proposal ready for approval!','2018-08-10 03:45:17',30),(1488,'Retreat para sa mga hindi banal','Your proposal has been approved by the Vice President for Lasallian Mission! It will now be taken to the Dean / Unit Head.','2018-08-10 03:45:17',52),(1489,'SOEMFI Retreat','You have new FF Proposal ready for approval!','2018-08-10 03:45:21',30),(1490,'SOEMFI Retreat','Your proposal has been approved by the Vice President for Lasallian Mission! It will now be taken to the Dean / Unit Head.','2018-08-10 03:45:21',69),(1491,'SOELAE retreat','You have new FF Proposal ready for approval!','2018-08-10 03:45:24',30),(1492,'SOELAE retreat','Your proposal has been approved by the Vice President for Lasallian Mission! It will now be taken to the Dean / Unit Head.','2018-08-10 03:45:24',68),(1493,'SOEFAE retreat','You have new FF Proposal ready for approval!','2018-08-10 03:45:27',30),(1494,'SOEFAE retreat','Your proposal has been approved by the Vice President for Lasallian Mission! It will now be taken to the Dean / Unit Head.','2018-08-10 03:45:27',67),(1495,'SOEIAE Retreat for faith','You have new FF Proposal ready for approval!','2018-08-10 03:45:30',30),(1496,'SOEIAE Retreat for faith','Your proposal has been approved by the Vice President for Lasallian Mission! It will now be taken to the Dean / Unit Head.','2018-08-10 03:45:30',55),(1497,'MATHalinong retreat','You have new FF Proposal ready for approval!','2018-08-10 03:45:34',30),(1498,'MATHalinong retreat','Your proposal has been approved by the Vice President for Lasallian Mission! It will now be taken to the Dean / Unit Head.','2018-08-10 03:45:34',57),(1499,'Dasalan tayo mga pare','You have new FF Proposal ready for approval!','2018-08-10 03:45:39',30),(1500,'Dasalan tayo mga pare','Your proposal has been approved by the Vice President for Lasallian Mission! It will now be taken to the Dean / Unit Head.','2018-08-10 03:45:39',56),(1501,'SOEMOD','You have new FF Proposal ready for approval!','2018-08-10 03:45:50',31),(1502,'SOEMOD','Your proposal has been approved by the Dean / Unit Head! It will now be taken to the Assistant Dean for Lasallian Mission / Assistant Unit Head.','2018-08-10 03:45:50',70),(1503,'SOEMFI Retreat','You have new FF Proposal ready for approval!','2018-08-10 03:45:53',31),(1504,'SOEMFI Retreat','Your proposal has been approved by the Dean / Unit Head! It will now be taken to the Assistant Dean for Lasallian Mission / Assistant Unit Head.','2018-08-10 03:45:53',69),(1505,'SOELAE retreat','You have new FF Proposal ready for approval!','2018-08-10 03:45:56',31),(1506,'SOELAE retreat','Your proposal has been approved by the Dean / Unit Head! It will now be taken to the Assistant Dean for Lasallian Mission / Assistant Unit Head.','2018-08-10 03:45:56',68),(1507,'SOEFAE retreat','You have new FF Proposal ready for approval!','2018-08-10 03:45:59',31),(1508,'SOEFAE retreat','Your proposal has been approved by the Dean / Unit Head! It will now be taken to the Assistant Dean for Lasallian Mission / Assistant Unit Head.','2018-08-10 03:45:59',67),(1509,'SOEIAE Retreat for faith','You have new FF Proposal ready for approval!','2018-08-10 03:46:02',31),(1510,'SOEIAE Retreat for faith','Your proposal has been approved by the Dean / Unit Head! It will now be taken to the Assistant Dean for Lasallian Mission / Assistant Unit Head.','2018-08-10 03:46:02',55),(1511,'MATHalinong retreat','You have new FF Proposal ready for approval!','2018-08-10 03:46:05',31),(1512,'MATHalinong retreat','Your proposal has been approved by the Dean / Unit Head! It will now be taken to the Assistant Dean for Lasallian Mission / Assistant Unit Head.','2018-08-10 03:46:05',57),(1513,'Dasalan tayo mga pare','You have new FF Proposal ready for approval!','2018-08-10 03:46:10',31),(1514,'Dasalan tayo mga pare','Your proposal has been approved by the Dean / Unit Head! It will now be taken to the Assistant Dean for Lasallian Mission / Assistant Unit Head.','2018-08-10 03:46:10',56),(1515,'Retreat para sa mga hindi banal','You have new FF Proposal ready for approval!','2018-08-10 03:46:13',31),(1516,'Retreat para sa mga hindi banal','Your proposal has been approved by the Dean / Unit Head! It will now be taken to the Assistant Dean for Lasallian Mission / Assistant Unit Head.','2018-08-10 03:46:13',52),(1517,'SOEMOD','You have new FF Proposal ready for approval!','2018-08-10 03:46:24',32),(1518,'SOEMOD','Your proposal has been approved by the Assistant Dean for Lasallian Mission / Assistant Unit Head! It will now be taken to the LSPO.','2018-08-10 03:46:24',70),(1519,'SOEMFI Retreat','You have new FF Proposal ready for approval!','2018-08-10 03:46:26',32),(1520,'SOEMFI Retreat','Your proposal has been approved by the Assistant Dean for Lasallian Mission / Assistant Unit Head! It will now be taken to the LSPO.','2018-08-10 03:46:26',69),(1521,'SOELAE retreat','You have new FF Proposal ready for approval!','2018-08-10 03:46:29',32),(1522,'SOELAE retreat','Your proposal has been approved by the Assistant Dean for Lasallian Mission / Assistant Unit Head! It will now be taken to the LSPO.','2018-08-10 03:46:29',68),(1523,'SOEIAE Retreat for faith','You have new FF Proposal ready for approval!','2018-08-10 03:46:32',32),(1524,'SOEIAE Retreat for faith','Your proposal has been approved by the Assistant Dean for Lasallian Mission / Assistant Unit Head! It will now be taken to the LSPO.','2018-08-10 03:46:32',55),(1525,'SOEFAE retreat','You have new FF Proposal ready for approval!','2018-08-10 03:46:35',32),(1526,'SOEFAE retreat','Your proposal has been approved by the Assistant Dean for Lasallian Mission / Assistant Unit Head! It will now be taken to the LSPO.','2018-08-10 03:46:35',67),(1527,'MATHalinong retreat','You have new FF Proposal ready for approval!','2018-08-10 03:46:38',32),(1528,'MATHalinong retreat','Your proposal has been approved by the Assistant Dean for Lasallian Mission / Assistant Unit Head! It will now be taken to the LSPO.','2018-08-10 03:46:38',57),(1529,'Dasalan tayo mga pare','You have new FF Proposal ready for approval!','2018-08-10 03:46:41',32),(1530,'Dasalan tayo mga pare','Your proposal has been approved by the Assistant Dean for Lasallian Mission / Assistant Unit Head! It will now be taken to the LSPO.','2018-08-10 03:46:41',56),(1531,'Retreat para sa mga hindi banal','You have new FF Proposal ready for approval!','2018-08-10 03:46:44',32),(1532,'Retreat para sa mga hindi banal','Your proposal has been approved by the Assistant Dean for Lasallian Mission / Assistant Unit Head! It will now be taken to the LSPO.','2018-08-10 03:46:44',52),(1533,'SOEMOD Shopping sa dumpster','You have new SE Proposal ready for approval!','2018-08-10 03:46:58',19),(1534,'SOEMOD Shopping sa dumpster','You have new SE Proposal ready for approval!','2018-08-10 03:46:58',20),(1535,'SOEMOD Shopping sa dumpster','You have new SE Proposal ready for approval!','2018-08-10 03:46:58',21),(1536,'SOEMOD Shopping sa dumpster','You have new SE Proposal ready for approval!','2018-08-10 03:46:58',22),(1537,'SOEMOD Shopping sa dumpster','You have new SE Proposal ready for approval!','2018-08-10 03:46:58',23),(1538,'SOEMOD Shopping sa dumpster','Your proposal has been approved by the COSCA. It will now be taken to the LMC Council.','2018-08-10 03:46:58',70),(1539,'CHEM Baseball Party with the QC Tambays','You have new SE Proposal ready for approval!','2018-08-10 03:47:02',19),(1540,'CHEM Baseball Party with the QC Tambays','You have new SE Proposal ready for approval!','2018-08-10 03:47:02',20),(1541,'CHEM Baseball Party with the QC Tambays','You have new SE Proposal ready for approval!','2018-08-10 03:47:02',21),(1542,'CHEM Baseball Party with the QC Tambays','You have new SE Proposal ready for approval!','2018-08-10 03:47:02',22),(1543,'CHEM Baseball Party with the QC Tambays','You have new SE Proposal ready for approval!','2018-08-10 03:47:02',23),(1544,'CHEM Baseball Party with the QC Tambays','Your proposal has been approved by the COSCA. It will now be taken to the LMC Council.','2018-08-10 03:47:02',56),(1545,'MATH Turuan ang mga bata','You have new SE Proposal ready for approval!','2018-08-10 03:47:06',19),(1546,'MATH Turuan ang mga bata','You have new SE Proposal ready for approval!','2018-08-10 03:47:06',20),(1547,'MATH Turuan ang mga bata','You have new SE Proposal ready for approval!','2018-08-10 03:47:06',21),(1548,'MATH Turuan ang mga bata','You have new SE Proposal ready for approval!','2018-08-10 03:47:06',22),(1549,'MATH Turuan ang mga bata','You have new SE Proposal ready for approval!','2018-08-10 03:47:06',23),(1550,'MATH Turuan ang mga bata','Your proposal has been approved by the COSCA. It will now be taken to the LMC Council.','2018-08-10 03:47:06',57),(1551,'PHYSICS Bilyaran sa kalye','You have new SE Proposal ready for approval!','2018-08-10 03:47:13',19),(1552,'PHYSICS Bilyaran sa kalye','You have new SE Proposal ready for approval!','2018-08-10 03:47:13',20),(1553,'PHYSICS Bilyaran sa kalye','You have new SE Proposal ready for approval!','2018-08-10 03:47:13',21),(1554,'PHYSICS Bilyaran sa kalye','You have new SE Proposal ready for approval!','2018-08-10 03:47:13',22),(1555,'PHYSICS Bilyaran sa kalye','You have new SE Proposal ready for approval!','2018-08-10 03:47:13',23),(1556,'PHYSICS Bilyaran sa kalye','Your proposal has been approved by the COSCA. It will now be taken to the LMC Council.','2018-08-10 03:47:13',58),(1557,'SOEIAE Kainan sa Tapsilugan','You have new SE Proposal ready for approval!','2018-08-10 03:47:28',19),(1558,'SOEIAE Kainan sa Tapsilugan','You have new SE Proposal ready for approval!','2018-08-10 03:47:28',20),(1559,'SOEIAE Kainan sa Tapsilugan','You have new SE Proposal ready for approval!','2018-08-10 03:47:28',21),(1560,'SOEIAE Kainan sa Tapsilugan','You have new SE Proposal ready for approval!','2018-08-10 03:47:28',22),(1561,'SOEIAE Kainan sa Tapsilugan','You have new SE Proposal ready for approval!','2018-08-10 03:47:28',23),(1562,'SOEIAE Kainan sa Tapsilugan','Your proposal has been approved by the COSCA. It will now be taken to the LMC Council.','2018-08-10 03:47:28',55),(1563,'SOEFAE Tulakan sa tulay','You have new SE Proposal ready for approval!','2018-08-10 03:47:32',19),(1564,'SOEFAE Tulakan sa tulay','You have new SE Proposal ready for approval!','2018-08-10 03:47:32',20),(1565,'SOEFAE Tulakan sa tulay','You have new SE Proposal ready for approval!','2018-08-10 03:47:32',21),(1566,'SOEFAE Tulakan sa tulay','You have new SE Proposal ready for approval!','2018-08-10 03:47:32',22),(1567,'SOEFAE Tulakan sa tulay','You have new SE Proposal ready for approval!','2018-08-10 03:47:32',23),(1568,'SOEFAE Tulakan sa tulay','Your proposal has been approved by the COSCA. It will now be taken to the LMC Council.','2018-08-10 03:47:32',67),(1569,'SOELAE Kalbuhan sa barbershop','You have new SE Proposal ready for approval!','2018-08-10 03:47:35',19),(1570,'SOELAE Kalbuhan sa barbershop','You have new SE Proposal ready for approval!','2018-08-10 03:47:35',20),(1571,'SOELAE Kalbuhan sa barbershop','You have new SE Proposal ready for approval!','2018-08-10 03:47:35',21),(1572,'SOELAE Kalbuhan sa barbershop','You have new SE Proposal ready for approval!','2018-08-10 03:47:35',22),(1573,'SOELAE Kalbuhan sa barbershop','You have new SE Proposal ready for approval!','2018-08-10 03:47:35',23),(1574,'SOELAE Kalbuhan sa barbershop','Your proposal has been approved by the COSCA. It will now be taken to the LMC Council.','2018-08-10 03:47:35',68),(1575,'SOEMFI','You have new SE Proposal ready for approval!','2018-08-10 03:47:39',19),(1576,'SOEMFI','You have new SE Proposal ready for approval!','2018-08-10 03:47:39',20),(1577,'SOEMFI','You have new SE Proposal ready for approval!','2018-08-10 03:47:39',21),(1578,'SOEMFI','You have new SE Proposal ready for approval!','2018-08-10 03:47:39',22),(1579,'SOEMFI','You have new SE Proposal ready for approval!','2018-08-10 03:47:39',23),(1580,'SOEMFI','Your proposal has been approved by the COSCA. It will now be taken to the LMC Council.','2018-08-10 03:47:39',69),(1581,'Retreat para sa mga hindi banal','You have new FF Proposal ready for approval!','2018-08-10 03:49:49',19),(1582,'Retreat para sa mga hindi banal','You have new FF Proposal ready for approval!','2018-08-10 03:49:49',20),(1583,'Retreat para sa mga hindi banal','You have new FF Proposal ready for approval!','2018-08-10 03:49:49',21),(1584,'Retreat para sa mga hindi banal','You have new FF Proposal ready for approval!','2018-08-10 03:49:49',22),(1585,'Retreat para sa mga hindi banal','You have new FF Proposal ready for approval!','2018-08-10 03:49:49',23),(1586,'Retreat para sa mga hindi banal','Your proposal has been approved by the LSPO! It will now be taken to the LMC Council.','2018-08-10 03:49:49',52),(1587,'Dasalan tayo mga pare','You have new FF Proposal ready for approval!','2018-08-10 03:49:53',19),(1588,'Dasalan tayo mga pare','You have new FF Proposal ready for approval!','2018-08-10 03:49:53',20),(1589,'Dasalan tayo mga pare','You have new FF Proposal ready for approval!','2018-08-10 03:49:53',21),(1590,'Dasalan tayo mga pare','You have new FF Proposal ready for approval!','2018-08-10 03:49:53',22),(1591,'Dasalan tayo mga pare','You have new FF Proposal ready for approval!','2018-08-10 03:49:53',23),(1592,'Dasalan tayo mga pare','Your proposal has been approved by the LSPO! It will now be taken to the LMC Council.','2018-08-10 03:49:53',56),(1593,'MATHalinong retreat','You have new FF Proposal ready for approval!','2018-08-10 03:49:57',19),(1594,'MATHalinong retreat','You have new FF Proposal ready for approval!','2018-08-10 03:49:57',20),(1595,'MATHalinong retreat','You have new FF Proposal ready for approval!','2018-08-10 03:49:57',21),(1596,'MATHalinong retreat','You have new FF Proposal ready for approval!','2018-08-10 03:49:57',22),(1597,'MATHalinong retreat','You have new FF Proposal ready for approval!','2018-08-10 03:49:57',23),(1598,'MATHalinong retreat','Your proposal has been approved by the LSPO! It will now be taken to the LMC Council.','2018-08-10 03:49:57',57),(1599,'SOEIAE Retreat for faith','You have new FF Proposal ready for approval!','2018-08-10 03:50:00',19),(1600,'SOEIAE Retreat for faith','You have new FF Proposal ready for approval!','2018-08-10 03:50:00',20),(1601,'SOEIAE Retreat for faith','You have new FF Proposal ready for approval!','2018-08-10 03:50:00',21),(1602,'SOEIAE Retreat for faith','You have new FF Proposal ready for approval!','2018-08-10 03:50:00',22),(1603,'SOEIAE Retreat for faith','You have new FF Proposal ready for approval!','2018-08-10 03:50:00',23),(1604,'SOEIAE Retreat for faith','Your proposal has been approved by the LSPO! It will now be taken to the LMC Council.','2018-08-10 03:50:00',55),(1605,'SOEFAE retreat','You have new FF Proposal ready for approval!','2018-08-10 03:50:03',19),(1606,'SOEFAE retreat','You have new FF Proposal ready for approval!','2018-08-10 03:50:03',20),(1607,'SOEFAE retreat','You have new FF Proposal ready for approval!','2018-08-10 03:50:03',21),(1608,'SOEFAE retreat','You have new FF Proposal ready for approval!','2018-08-10 03:50:03',22),(1609,'SOEFAE retreat','You have new FF Proposal ready for approval!','2018-08-10 03:50:03',23),(1610,'SOEFAE retreat','Your proposal has been approved by the LSPO! It will now be taken to the LMC Council.','2018-08-10 03:50:03',67),(1611,'SOELAE retreat','You have new FF Proposal ready for approval!','2018-08-10 03:50:07',19),(1612,'SOELAE retreat','You have new FF Proposal ready for approval!','2018-08-10 03:50:07',20),(1613,'SOELAE retreat','You have new FF Proposal ready for approval!','2018-08-10 03:50:07',21),(1614,'SOELAE retreat','You have new FF Proposal ready for approval!','2018-08-10 03:50:07',22),(1615,'SOELAE retreat','You have new FF Proposal ready for approval!','2018-08-10 03:50:07',23),(1616,'SOELAE retreat','Your proposal has been approved by the LSPO! It will now be taken to the LMC Council.','2018-08-10 03:50:07',68),(1617,'SOEMFI Retreat','You have new FF Proposal ready for approval!','2018-08-10 03:50:11',19),(1618,'SOEMFI Retreat','You have new FF Proposal ready for approval!','2018-08-10 03:50:11',20),(1619,'SOEMFI Retreat','You have new FF Proposal ready for approval!','2018-08-10 03:50:11',21),(1620,'SOEMFI Retreat','You have new FF Proposal ready for approval!','2018-08-10 03:50:11',22),(1621,'SOEMFI Retreat','You have new FF Proposal ready for approval!','2018-08-10 03:50:11',23),(1622,'SOEMFI Retreat','Your proposal has been approved by the LSPO! It will now be taken to the LMC Council.','2018-08-10 03:50:11',69),(1623,'SOEMOD','You have new FF Proposal ready for approval!','2018-08-10 03:50:14',19),(1624,'SOEMOD','You have new FF Proposal ready for approval!','2018-08-10 03:50:14',20),(1625,'SOEMOD','You have new FF Proposal ready for approval!','2018-08-10 03:50:14',21),(1626,'SOEMOD','You have new FF Proposal ready for approval!','2018-08-10 03:50:14',22),(1627,'SOEMOD','You have new FF Proposal ready for approval!','2018-08-10 03:50:14',23),(1628,'SOEMOD','Your proposal has been approved by the LSPO! It will now be taken to the LMC Council.','2018-08-10 03:50:14',70),(1629,'CHEM Baseball Party with the QC Tambays','James Laxa has voted to APPROVE your proposal. Vote Count: 1/5','2018-08-10 03:50:58',56),(1630,'MATH Turuan ang mga bata','James Laxa has voted to APPROVE your proposal. Vote Count: 1/5','2018-08-10 03:51:03',57),(1631,'PHYSICS Bilyaran sa kalye','James Laxa has voted to APPROVE your proposal. Vote Count: 1/5','2018-08-10 03:51:07',58),(1632,'SOEIAE Kainan sa Tapsilugan','James Laxa has voted to APPROVE your proposal. Vote Count: 1/5','2018-08-10 03:51:11',55),(1633,'SOEFAE Tulakan sa tulay','James Laxa has voted to APPROVE your proposal. Vote Count: 1/5','2018-08-10 03:51:14',67),(1634,'SOELAE Kalbuhan sa barbershop','James Laxa has voted to APPROVE your proposal. Vote Count: 1/5','2018-08-10 03:51:18',68),(1635,'SOEMFI','James Laxa has voted to APPROVE your proposal. Vote Count: 1/5','2018-08-10 03:51:21',69),(1636,'SOEMOD Shopping sa dumpster','James Laxa has voted to APPROVE your proposal. Vote Count: 1/5','2018-08-10 03:51:24',70),(1637,'CHEM Baseball Party with the QC Tambays','Fritzie De Vera has voted to APPROVE your proposal. Vote Count: 2/5','2018-08-10 03:51:43',56),(1638,'MATH Turuan ang mga bata','Fritzie De Vera has voted to APPROVE your proposal. Vote Count: 2/5','2018-08-10 03:51:47',57),(1639,'PHYSICS Bilyaran sa kalye','Fritzie De Vera has voted to APPROVE your proposal. Vote Count: 2/5','2018-08-10 03:51:50',58),(1640,'SOEIAE Kainan sa Tapsilugan','Fritzie De Vera has voted to APPROVE your proposal. Vote Count: 2/5','2018-08-10 03:51:53',55),(1641,'SOEFAE Tulakan sa tulay','Fritzie De Vera has voted to APPROVE your proposal. Vote Count: 2/5','2018-08-10 03:51:57',67),(1642,'SOELAE Kalbuhan sa barbershop','Fritzie De Vera has voted to APPROVE your proposal. Vote Count: 2/5','2018-08-10 03:52:00',68),(1643,'SOEMFI','Fritzie De Vera has voted to APPROVE your proposal. Vote Count: 2/5','2018-08-10 03:52:03',69),(1644,'SOEMOD Shopping sa dumpster','Fritzie De Vera has voted to APPROVE your proposal. Vote Count: 2/5','2018-08-10 03:52:06',70),(1645,'Retreat para sa mga hindi banal','Fritzie De Vera has voted to APPROVE your proposal. Vote Count: 1/5','2018-08-10 03:52:11',52),(1646,'Dasalan tayo mga pare','Fritzie De Vera has voted to APPROVE your proposal. Vote Count: 1/5','2018-08-10 03:52:14',56),(1647,'MATHalinong retreat','Fritzie De Vera has voted to APPROVE your proposal. Vote Count: 1/5','2018-08-10 03:52:18',57),(1648,'SOEIAE Retreat for faith','Fritzie De Vera has voted to APPROVE your proposal. Vote Count: 1/5','2018-08-10 03:52:21',55),(1649,'SOEFAE retreat','Fritzie De Vera has voted to APPROVE your proposal. Vote Count: 1/5','2018-08-10 03:52:25',67),(1650,'SOELAE retreat','Fritzie De Vera has voted to APPROVE your proposal. Vote Count: 1/5','2018-08-10 03:52:27',68),(1651,'SOEMFI Retreat','Fritzie De Vera has voted to APPROVE your proposal. Vote Count: 1/5','2018-08-10 03:52:30',69),(1652,'SOEMOD','Fritzie De Vera has voted to APPROVE your proposal. Vote Count: 1/5','2018-08-10 03:52:33',70),(1653,'Retreat para sa mga hindi banal','James Laxa has voted to APPROVE your proposal. Vote Count: 2/5','2018-08-10 03:52:47',52),(1654,'Dasalan tayo mga pare','James Laxa has voted to APPROVE your proposal. Vote Count: 2/5','2018-08-10 03:52:50',56),(1655,'MATHalinong retreat','James Laxa has voted to APPROVE your proposal. Vote Count: 2/5','2018-08-10 03:52:53',57),(1656,'SOEIAE Retreat for faith','James Laxa has voted to APPROVE your proposal. Vote Count: 2/5','2018-08-10 03:52:56',55),(1657,'SOEFAE retreat','James Laxa has voted to APPROVE your proposal. Vote Count: 2/5','2018-08-10 03:52:59',67),(1658,'SOELAE retreat','James Laxa has voted to APPROVE your proposal. Vote Count: 2/5','2018-08-10 03:53:02',68),(1659,'SOEMFI Retreat','James Laxa has voted to APPROVE your proposal. Vote Count: 2/5','2018-08-10 03:53:05',69),(1660,'SOEMOD','James Laxa has voted to APPROVE your proposal. Vote Count: 2/5','2018-08-10 03:53:08',70),(1661,'CHEM Baseball Party with the QC Tambays','Michael Broughton has voted to APPROVE your proposal. Vote Count: 3/5','2018-08-10 03:53:24',56),(1662,'MATH Turuan ang mga bata','Michael Broughton has voted to APPROVE your proposal. Vote Count: 3/5','2018-08-10 03:53:27',57),(1663,'PHYSICS Bilyaran sa kalye','Michael Broughton has voted to APPROVE your proposal. Vote Count: 3/5','2018-08-10 03:53:31',58),(1664,'SOEIAE Kainan sa Tapsilugan','Michael Broughton has voted to APPROVE your proposal. Vote Count: 3/5','2018-08-10 03:53:34',55),(1665,'SOEFAE Tulakan sa tulay','Michael Broughton has voted to APPROVE your proposal. Vote Count: 3/5','2018-08-10 03:53:38',67),(1666,'SOELAE Kalbuhan sa barbershop','Michael Broughton has voted to APPROVE your proposal. Vote Count: 3/5','2018-08-10 03:53:41',68),(1667,'SOEMFI','Michael Broughton has voted to APPROVE your proposal. Vote Count: 3/5','2018-08-10 03:53:45',69),(1668,'SOEMOD Shopping sa dumpster','Michael Broughton has voted to APPROVE your proposal. Vote Count: 3/5','2018-08-10 03:53:49',70),(1669,'Retreat para sa mga hindi banal','Michael Broughton has voted to APPROVE your proposal. Vote Count: 3/5','2018-08-10 03:53:54',52),(1670,'Dasalan tayo mga pare','Michael Broughton has voted to APPROVE your proposal. Vote Count: 3/5','2018-08-10 03:53:56',56),(1671,'MATHalinong retreat','Michael Broughton has voted to APPROVE your proposal. Vote Count: 3/5','2018-08-10 03:53:59',57),(1672,'SOEIAE Retreat for faith','Michael Broughton has voted to APPROVE your proposal. Vote Count: 3/5','2018-08-10 03:54:02',55),(1673,'SOEFAE retreat','Michael Broughton has voted to APPROVE your proposal. Vote Count: 3/5','2018-08-10 03:54:05',67),(1674,'SOELAE retreat','Michael Broughton has voted to APPROVE your proposal. Vote Count: 3/5','2018-08-10 03:54:07',68),(1675,'SOEMFI Retreat','Michael Broughton has voted to APPROVE your proposal. Vote Count: 3/5','2018-08-10 03:54:11',69),(1676,'SOEMOD','Michael Broughton has voted to APPROVE your proposal. Vote Count: 3/5','2018-08-10 03:54:14',70),(1677,'CHEM Baseball Party with the QC Tambays','Margarita Perdido has voted to APPROVE your proposal. Vote Count: 4/5','2018-08-10 03:54:26',56),(1678,'MATH Turuan ang mga bata','Margarita Perdido has voted to APPROVE your proposal. Vote Count: 4/5','2018-08-10 03:54:29',57),(1679,'PHYSICS Bilyaran sa kalye','Margarita Perdido has voted to APPROVE your proposal. Vote Count: 4/5','2018-08-10 03:54:33',58),(1680,'SOEIAE Kainan sa Tapsilugan','Margarita Perdido has voted to APPROVE your proposal. Vote Count: 4/5','2018-08-10 03:54:36',55),(1681,'SOEFAE Tulakan sa tulay','Margarita Perdido has voted to APPROVE your proposal. Vote Count: 4/5','2018-08-10 03:54:39',67),(1682,'SOELAE Kalbuhan sa barbershop','Margarita Perdido has voted to APPROVE your proposal. Vote Count: 4/5','2018-08-10 03:54:42',68),(1683,'SOEMFI','Margarita Perdido has voted to APPROVE your proposal. Vote Count: 4/5','2018-08-10 03:54:46',69),(1684,'SOEMOD Shopping sa dumpster','Margarita Perdido has voted to APPROVE your proposal. Vote Count: 4/5','2018-08-10 03:54:49',70),(1685,'Retreat para sa mga hindi banal','Margarita Perdido has voted to APPROVE your proposal. Vote Count: 4/5','2018-08-10 03:54:53',52),(1686,'Dasalan tayo mga pare','Margarita Perdido has voted to APPROVE your proposal. Vote Count: 4/5','2018-08-10 03:54:56',56),(1687,'MATHalinong retreat','Margarita Perdido has voted to APPROVE your proposal. Vote Count: 4/5','2018-08-10 03:54:58',57),(1688,'SOEIAE Retreat for faith','Margarita Perdido has voted to APPROVE your proposal. Vote Count: 4/5','2018-08-10 03:55:01',55),(1689,'SOEFAE retreat','Margarita Perdido has voted to APPROVE your proposal. Vote Count: 4/5','2018-08-10 03:55:04',67),(1690,'SOELAE retreat','Margarita Perdido has voted to APPROVE your proposal. Vote Count: 4/5','2018-08-10 03:55:06',68),(1691,'SOEMFI Retreat','Margarita Perdido has voted to APPROVE your proposal. Vote Count: 4/5','2018-08-10 03:55:09',69),(1692,'SOEMOD','Margarita Perdido has voted to APPROVE your proposal. Vote Count: 4/5','2018-08-10 03:55:15',70),(1693,'CHEM Baseball Party with the QC Tambays','Nelca Villarin has voted to APPROVE your proposal. Vote Count: 5/5','2018-08-10 03:55:27',56),(1694,'CHEM Baseball Party with the QC Tambays','Your proposal has been approved by the Council. You may now upload the PRS for endorsement.','2018-08-10 03:55:27',56),(1695,'MATH Turuan ang mga bata','Nelca Villarin has voted to APPROVE your proposal. Vote Count: 5/5','2018-08-10 03:55:30',57),(1696,'MATH Turuan ang mga bata','Your proposal has been approved by the Council. You may now upload the PRS for endorsement.','2018-08-10 03:55:31',57),(1697,'PHYSICS Bilyaran sa kalye','Nelca Villarin has voted to APPROVE your proposal. Vote Count: 5/5','2018-08-10 03:55:34',58),(1698,'PHYSICS Bilyaran sa kalye','Congratulations! Your SE Proposal has been approved!','2018-08-10 03:55:34',58),(1699,'SOEIAE Kainan sa Tapsilugan','Nelca Villarin has voted to APPROVE your proposal. Vote Count: 5/5','2018-08-10 03:55:37',55),(1700,'SOEIAE Kainan sa Tapsilugan','Congratulations! Your SE Proposal has been approved!','2018-08-10 03:55:37',55),(1701,'SOEFAE Tulakan sa tulay','Nelca Villarin has voted to APPROVE your proposal. Vote Count: 5/5','2018-08-10 03:55:40',67),(1702,'SOEFAE Tulakan sa tulay','Your proposal has been approved by the Council. You may now upload the PRS for endorsement.','2018-08-10 03:55:40',67),(1703,'SOELAE Kalbuhan sa barbershop','Nelca Villarin has voted to APPROVE your proposal. Vote Count: 5/5','2018-08-10 03:55:43',68),(1704,'SOELAE Kalbuhan sa barbershop','Your proposal has been approved by the Council. You may now upload the PRS for endorsement.','2018-08-10 03:55:43',68),(1705,'SOEMFI','Nelca Villarin has voted to APPROVE your proposal. Vote Count: 5/5','2018-08-10 03:55:46',69),(1706,'SOEMFI','Congratulations! Your SE Proposal has been approved!','2018-08-10 03:55:46',69),(1707,'SOEMOD Shopping sa dumpster','Nelca Villarin has voted to APPROVE your proposal. Vote Count: 5/5','2018-08-10 03:55:49',70),(1708,'SOEMOD Shopping sa dumpster','Congratulations! Your SE Proposal has been approved!','2018-08-10 03:55:49',70),(1709,'Retreat para sa mga hindi banal','Nelca Villarin has voted to APPROVE your proposal. Vote Count: 5/5','2018-08-10 03:55:53',52),(1710,'Retreat para sa mga hindi banal','Your proposal has been approved by the Council. You may now upload the PRS for endorsement.','2018-08-10 03:55:53',52),(1711,'Dasalan tayo mga pare','Nelca Villarin has voted to APPROVE your proposal. Vote Count: 5/5','2018-08-10 03:55:56',56),(1712,'Dasalan tayo mga pare','Your proposal has been approved by the Council. You may now upload the PRS for endorsement.','2018-08-10 03:55:56',56),(1713,'MATHalinong retreat','Nelca Villarin has voted to APPROVE your proposal. Vote Count: 5/5','2018-08-10 03:55:58',57),(1714,'MATHalinong retreat','Your proposal has been approved by the Council. You may now upload the PRS for endorsement.','2018-08-10 03:55:59',57),(1715,'SOEIAE Retreat for faith','Nelca Villarin has voted to APPROVE your proposal. Vote Count: 5/5','2018-08-10 03:56:02',55),(1716,'SOEIAE Retreat for faith','Your proposal has been approved by the Council. You may now upload the PRS for endorsement.','2018-08-10 03:56:02',55),(1717,'SOEFAE retreat','Nelca Villarin has voted to APPROVE your proposal. Vote Count: 5/5','2018-08-10 03:56:04',67),(1718,'SOEFAE retreat','Congratulations! Your FF Proposal has been approved!','2018-08-10 03:56:04',67),(1719,'SOELAE retreat','Nelca Villarin has voted to APPROVE your proposal. Vote Count: 5/5','2018-08-10 03:56:07',68),(1720,'SOELAE retreat','Congratulations! Your FF Proposal has been approved!','2018-08-10 03:56:07',68),(1721,'SOEMFI Retreat','Nelca Villarin has voted to APPROVE your proposal. Vote Count: 5/5','2018-08-10 03:56:10',69),(1722,'SOEMFI Retreat','Your proposal has been approved by the Council. You may now upload the PRS for endorsement.','2018-08-10 03:56:10',69),(1723,'SOEMOD','Nelca Villarin has voted to APPROVE your proposal. Vote Count: 5/5','2018-08-10 03:56:13',70),(1724,'SOEMOD','Your proposal has been approved by the Council. You may now upload the PRS for endorsement.','2018-08-10 03:56:13',70),(1725,'CHEM Baseball Party with the QC Tambays','You have new SE Proposal ready for approval!','2018-08-10 03:56:38',27),(1726,'Dasalan tayo mga pare','You have new FF Proposal ready for approval!','2018-08-10 03:57:07',27),(1727,'MATH Turuan ang mga bata','You have new SE Proposal ready for approval!','2018-08-10 03:57:23',27),(1728,'MATHalinong retreat','You have new FF Proposal ready for approval!','2018-08-10 03:57:36',27),(1729,'SOEIAE Retreat for faith','You have new FF Proposal ready for approval!','2018-08-10 03:58:30',27),(1730,'SOEFAE Tulakan sa tulay','You have new SE Proposal ready for approval!','2018-08-10 03:58:53',27),(1731,'SOELAE Kalbuhan sa barbershop','You have new SE Proposal ready for approval!','2018-08-10 03:59:27',27),(1732,'SOEMFI Retreat','You have new FF Proposal ready for approval!','2018-08-10 03:59:51',27),(1733,'SOEMOD','You have new FF Proposal ready for approval!','2018-08-10 04:00:11',27),(1734,'CHEM Baseball Party with the QC Tambays','Congratulations! Your SE Proposal has been approved!','2018-08-10 04:00:33',56),(1735,'CHEM Baseball Party with the QC Tambays','₱25000.0 has been deducted to the budget!','2018-08-10 04:00:33',4),(1736,'MATH Turuan ang mga bata','Congratulations! Your SE Proposal has been approved!','2018-08-10 04:00:36',57),(1737,'MATH Turuan ang mga bata','₱10000.0 has been deducted to the budget!','2018-08-10 04:00:36',4),(1738,'SOEFAE Tulakan sa tulay','Congratulations! Your SE Proposal has been approved!','2018-08-10 04:00:39',67),(1739,'SOEFAE Tulakan sa tulay','₱43000.0 has been deducted to the budget!','2018-08-10 04:00:39',4),(1740,'SOELAE Kalbuhan sa barbershop','Congratulations! Your SE Proposal has been approved!','2018-08-10 04:00:42',68),(1741,'SOELAE Kalbuhan sa barbershop','₱15000.0 has been deducted to the budget!','2018-08-10 04:00:42',4),(1742,'Dasalan tayo mga pare','Congratulations! Your FF Proposal has been approved!','2018-08-10 04:00:48',56),(1743,'Dasalan tayo mga pare','₱30000.0 has been deducted to the budget!','2018-08-10 04:00:48',4),(1744,'MATHalinong retreat','Congratulations! Your FF Proposal has been approved!','2018-08-10 04:00:51',57),(1745,'MATHalinong retreat','₱34000.0 has been deducted to the budget!','2018-08-10 04:00:51',4),(1746,'SOEIAE Retreat for faith','Congratulations! Your FF Proposal has been approved!','2018-08-10 04:00:53',55),(1747,'SOEIAE Retreat for faith','₱30000.0 has been deducted to the budget!','2018-08-10 04:00:53',4),(1748,'SOEMFI Retreat','Congratulations! Your FF Proposal has been approved!','2018-08-10 04:00:57',69),(1749,'SOEMFI Retreat','₱35000.0 has been deducted to the budget!','2018-08-10 04:00:57',4),(1750,'SOEMOD','Congratulations! Your FF Proposal has been approved!','2018-08-10 04:01:01',70),(1751,'SOEMOD','₱25000.0 has been deducted to the budget!','2018-08-10 04:01:01',4),(1752,'CHEM Baseball Party with the QC Tambays','Accomplishment Report has been submitted!','2018-08-10 04:05:52',17),(1753,'Dasalan tayo mga pare','Accomplishment Report has been submitted!','2018-08-10 04:08:45',17),(1754,'MATH Turuan ang mga bata','Accomplishment Report has been submitted!','2018-08-10 04:10:31',17),(1755,'MATHalinong retreat','Accomplishment Report has been submitted!','2018-08-10 04:11:17',17),(1756,'PHYSICS Bilyaran sa kalye','Accomplishment Report has been submitted!','2018-08-10 04:12:57',17),(1757,'SOEIAE Kainan sa Tapsilugan','Accomplishment Report has been submitted!','2018-08-10 04:14:40',17),(1758,'SOEIAE Retreat for faith','Accomplishment Report has been submitted!','2018-08-10 04:15:47',17),(1759,'SOEFAE Tulakan sa tulay','Accomplishment Report has been submitted!','2018-08-10 04:19:38',17),(1760,'SOEFAE Tulakan sa tulay','Accomplishment Report has been submitted!','2018-08-10 04:19:48',17),(1761,'SOEFAE retreat','Accomplishment Report has been submitted!','2018-08-10 04:20:58',17),(1762,'SOELAE Kalbuhan sa barbershop','Accomplishment Report has been submitted!','2018-08-10 04:22:57',17),(1763,'SOELAE retreat','Accomplishment Report has been submitted!','2018-08-10 04:23:54',17),(1764,'SOEMFI','Accomplishment Report has been submitted!','2018-08-10 04:26:40',17),(1765,'SOEMFI Retreat','Accomplishment Report has been submitted!','2018-08-10 04:27:40',17),(1766,'SOEMOD Shopping sa dumpster','Accomplishment Report has been submitted!','2018-08-10 04:29:05',17),(1767,'SOEMOD','Accomplishment Report has been submitted!','2018-08-10 04:30:11',17),(1768,'CCSIT Feeding Program','A portion of the budget has been used!','2018-08-10 13:40:54',16),(1769,'CCSIT Feeding Program','A portion of the budget has been used!','2018-08-10 13:41:16',16),(1770,'CCS Outreach 2018','You have new SE Proposal ready for approval!','2018-08-10 15:46:45',13),(1771,'CCS Outreach 2018','Your proposal has some revisions before it is approved by the Department / Unit Chair.','2018-08-10 15:54:25',34),(1772,'CCS Outreach 2018','You have a Revised SE Proposal ready for approval!','2018-08-10 15:56:10',13),(1773,'CCS Outreach 2018','You have new SE Proposal ready for approval!','2018-08-10 15:56:40',14),(1774,'CCS Outreach 2018','Your proposal has been approved by the Department / Unit Chair! It will now be taken to the External Affairs / SE Director.','2018-08-10 15:56:40',34),(1775,'CCS Outreach 2018','You have new SE Proposal ready for approval!','2018-08-10 15:57:41',15),(1776,'CCS Outreach 2018','Your proposal has been approved by the External Affairs / SE Director! It will now be taken to the Dean / VP / VC.','2018-08-10 15:57:41',34),(1777,'CCS Outreach 2018','Your proposal has some revisions before it is approved by the Dean / VP / VC.','2018-08-10 15:59:34',34),(1778,'CCS Outreach 2018','You have a Revised SE Proposal ready for approval!','2018-08-10 16:00:33',15),(1779,'CCS Outreach 2018','You have new SE Proposal ready for approval!','2018-08-10 16:01:36',18),(1780,'CCS Outreach 2018','A proposal has been received by COSCA.','2018-08-10 16:01:36',17),(1781,'CCS Outreach 2018','Your proposal has been approved by the Dean / VP / VC! It will now be taken to the COSCA.','2018-08-10 16:01:36',34),(1782,'CCS Outreach 2018','You have new SE Proposal ready for approval!','2018-08-10 16:03:00',19),(1783,'CCS Outreach 2018','You have new SE Proposal ready for approval!','2018-08-10 16:03:00',20),(1784,'CCS Outreach 2018','You have new SE Proposal ready for approval!','2018-08-10 16:03:00',21),(1785,'CCS Outreach 2018','You have new SE Proposal ready for approval!','2018-08-10 16:03:00',22),(1786,'CCS Outreach 2018','You have new SE Proposal ready for approval!','2018-08-10 16:03:00',23),(1787,'CCS Outreach 2018','Your proposal has been approved by the COSCA. It will now be taken to the LMC Council.','2018-08-10 16:03:00',34),(1788,'TEST!','You have new SE Proposal ready for approval!','2018-08-10 16:15:46',13),(1789,'TEST!','You have new SE Proposal ready for approval!','2018-08-10 16:16:14',14),(1790,'TEST!','Your proposal has been approved by the Department / Unit Chair! It will now be taken to the External Affairs / SE Director.','2018-08-10 16:16:14',34),(1791,'TEST!','You have new SE Proposal ready for approval!','2018-08-10 16:16:30',15),(1792,'TEST!','Your proposal has been approved by the External Affairs / SE Director! It will now be taken to the Dean / VP / VC.','2018-08-10 16:16:30',34),(1793,'TEST!','You have new SE Proposal ready for approval!','2018-08-10 16:16:44',18),(1794,'TEST!','A proposal has been received by COSCA.','2018-08-10 16:16:44',17),(1795,'TEST!','Your proposal has been approved by the Dean / VP / VC! It will now be taken to the COSCA.','2018-08-10 16:16:44',34),(1796,'TEST!','You have new SE Proposal ready for approval!','2018-08-10 16:17:00',19),(1797,'TEST!','You have new SE Proposal ready for approval!','2018-08-10 16:17:00',20),(1798,'TEST!','You have new SE Proposal ready for approval!','2018-08-10 16:17:00',21),(1799,'TEST!','You have new SE Proposal ready for approval!','2018-08-10 16:17:00',22),(1800,'TEST!','You have new SE Proposal ready for approval!','2018-08-10 16:17:00',23),(1801,'TEST!','Your proposal has been approved by the COSCA. It will now be taken to the LMC Council.','2018-08-10 16:17:00',34),(1802,'Sample!','You have new FF Proposal ready for approval!','2018-08-10 16:21:55',28),(1803,'Sample!','You have new FF Proposal ready for approval!','2018-08-10 16:22:24',29),(1804,'Sample!','Your proposal has been approved by the Chairperson / Director! It will now be taken to the Vice President for Lasallian Mission.','2018-08-10 16:22:24',34),(1805,'Sample!','You have new FF Proposal ready for approval!','2018-08-10 16:22:42',30),(1806,'Sample!','Your proposal has been approved by the Vice President for Lasallian Mission! It will now be taken to the Dean / Unit Head.','2018-08-10 16:22:42',34),(1807,'Sample!','You have new FF Proposal ready for approval!','2018-08-10 16:22:54',31),(1808,'Sample!','Your proposal has been approved by the Dean / Unit Head! It will now be taken to the Assistant Dean for Lasallian Mission / Assistant Unit Head.','2018-08-10 16:22:54',34),(1809,'Sample!','You have new FF Proposal ready for approval!','2018-08-10 16:23:21',32),(1810,'Sample!','Your proposal has been approved by the Assistant Dean for Lasallian Mission / Assistant Unit Head! It will now be taken to the LSPO.','2018-08-10 16:23:21',34),(1811,'Sample!','You have new FF Proposal ready for approval!','2018-08-10 16:23:55',19),(1812,'Sample!','You have new FF Proposal ready for approval!','2018-08-10 16:23:55',20),(1813,'Sample!','You have new FF Proposal ready for approval!','2018-08-10 16:23:55',21),(1814,'Sample!','You have new FF Proposal ready for approval!','2018-08-10 16:23:55',22),(1815,'Sample!','You have new FF Proposal ready for approval!','2018-08-10 16:23:55',23),(1816,'Sample!','Your proposal has been approved by the LSPO! It will now be taken to the LMC Council.','2018-08-10 16:23:55',34),(1817,'CCSIT Feeding Program','Accomplishment Report has been submitted!','2018-08-10 16:30:45',17);
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `seproposal`
--

LOCK TABLES `seproposal` WRITE;
/*!40000 ALTER TABLE `seproposal` DISABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `seproposal_component`
--

LOCK TABLES `seproposal_component` WRITE;
/*!40000 ALTER TABLE `seproposal_component` DISABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `seproposal_expenses`
--

LOCK TABLES `seproposal_expenses` WRITE;
/*!40000 ALTER TABLE `seproposal_expenses` DISABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `seproposal_personresponsible`
--

LOCK TABLES `seproposal_personresponsible` WRITE;
/*!40000 ALTER TABLE `seproposal_personresponsible` DISABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `seproposal_workplan`
--

LOCK TABLES `seproposal_workplan` WRITE;
/*!40000 ALTER TABLE `seproposal_workplan` DISABLE KEYS */;
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
  `numberOfStaff` int(11) DEFAULT NULL,
  `numberOfFaculty` int(11) DEFAULT NULL,
  `numberOfAdmin` int(11) DEFAULT NULL,
  `numberOfAPSP` int(11) DEFAULT NULL,
  `numberOfSAF` int(11) DEFAULT NULL,
  `numberOFCAP` int(11) DEFAULT NULL,
  `numberOfStudent` int(11) DEFAULT NULL,
  `unitDescription` varchar(200) DEFAULT NULL,
  `userID` int(11) DEFAULT NULL,
  PRIMARY KEY (`unitID`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `unit`
--

LOCK TABLES `unit` WRITE;
/*!40000 ALTER TABLE `unit` DISABLE KEYS */;
INSERT INTO `unit` VALUES (1,'College of Computer Studies (CCS)','Sample','Unit Type 1',3,1,2,3,4,5,6,7,'Best Unit',4),(2,'Br. Andrew Gonzales College of Education','Sample Unit Head','Unit Type 1',5,150,25,25,25,25,25,25,'Sample Description',4),(3,'College of Law','Sample Unit Head for College of Law','Unit Type 1',0,150,25,25,25,25,25,25,'Sample Description for College of Law',4),(4,'College of Liberal Arts','Sample Unit Head for CLA','Unit Type 1',10,300,50,50,50,50,50,50,'Sample Description for CLA',4),(5,'College of Science','Sample Unit Head for COS','Unit Type 1',4,180,30,30,30,30,30,30,'Sample Unit Description for COS',4),(6,'Gokongwei College of Engineering (GCOE)','Sample Unit Head for GCOE','Unit Type 1',6,120,20,20,20,20,20,20,'Sample Unit Description for GCOE',4),(7,'Ramon V. Del Rosario College of Business (RVRCOB)','Sample Unit Head for RVRCOB','Unit Type 1',6,240,40,40,40,40,40,40,'Sample Unit Description for RVRCOB',4),(8,'School of Economics (SOE)','Sample Unit Head for SOE','Unit Type 1',6,360,60,60,60,60,60,60,'Sample Unit Description for SOE',4);
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
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `unit_department`
--

LOCK TABLES `unit_department` WRITE;
/*!40000 ALTER TABLE `unit_department` DISABLE KEYS */;
INSERT INTO `unit_department` VALUES (1,1,44),(2,1,45),(3,1,46),(4,2,47),(5,2,48),(6,2,49),(7,2,50),(8,2,51),(9,4,52),(10,4,53),(11,4,54),(12,4,55),(13,4,56),(14,4,57),(15,4,58),(16,4,59),(17,4,60),(18,4,61),(19,5,62),(20,5,63),(21,5,64),(22,5,65),(23,6,66),(24,6,67),(25,6,68),(26,6,69),(27,6,70),(28,6,71),(29,7,72),(30,7,73),(31,7,74),(32,7,75),(33,7,76),(34,7,77),(35,8,78),(36,8,79),(37,8,80),(38,8,81),(39,8,82),(40,8,83);
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

-- Dump completed on 2018-09-27 15:22:23
