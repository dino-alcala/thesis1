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
INSERT INTO `department` VALUES (0,'No Department',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1,'Admin ',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(2,'Computer Technology (CT)',50,5,50,50,50,5,5,5),(3,'Information Technology (CT)',40,4,40,40,40,4,4,4),(4,'Software Technology (ST)',30,3,30,30,30,3,3,3);
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
  `position` varchar(45) DEFAULT NULL,
  `departmentID` int(11) DEFAULT NULL,
  `username` varchar(100) DEFAULT NULL,
  `password` varchar(256) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `LA1_idx` (`departmentID`),
  CONSTRAINT `LA1` FOREIGN KEY (`departmentID`) REFERENCES `department` (`departmentID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=78 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `informationsheet`
--

LOCK TABLES `informationsheet` WRITE;
/*!40000 ALTER TABLE `informationsheet` DISABLE KEYS */;
INSERT INTO `informationsheet` VALUES (1,'Admin','Admin','admin@gmail.com','Admin','Administrator',1,'admin','c7ad44cbad762a5da0a452f9e854fdc1e0e7a52a38015f23f3eab1d80b931dd472634dfac71cd34ebc35d16ab7fb8a90c81f975113d6c7538dc69dd8de9077ec'),(71,'Carmel','Carosa','carmel.carosa@dlsu.edu.ph','Office of the Vice President for Lasallian Mission (OVPLM)','Executive Officer',0,'carosa','28fa1fcc5ad52572cd57b7db7feeaf14382b9d719b255dd9fff7212cbd06ced12e2a7d7e45265a1fef33c1d63fe894da8c8502162eaf616ec20a44ff532a200f'),(74,'Michael','Broughton','michael.broughton@dlsu.edu.ph','Office of the Vice President for Lasallian Mission (OVPLM)','Vice President for Lasallian Mission',0,'michael','34e1fd6820ce1e79fbbdaae3fc708b634ab1d9765c215b7cd88d4c0c750e87b8c1d478b6112d95ae7bd165f9f73d165263ef7fcee357b48c6bc1f6b591f94ab8');
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
  `measure` varchar(500) DEFAULT NULL,
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
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `unit`
--

LOCK TABLES `unit` WRITE;
/*!40000 ALTER TABLE `unit` DISABLE KEYS */;
INSERT INTO `unit` VALUES (10,'Office of the Vice President for Lasallian Mission (OVPLM)','OVPLM Unit Head',NULL,0,0,1,50,40,55,5,5,5,'OVPLM Unit',1),(11,'College of Computer Studies (CCS)','CCS Unit Head','Academic',3,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'CCS Unit ',1),(12,'College of Law (COL)','COL Unit Head','Academic',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'COL Unit',71);
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
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `unit_department`
--

LOCK TABLES `unit_department` WRITE;
/*!40000 ALTER TABLE `unit_department` DISABLE KEYS */;
INSERT INTO `unit_department` VALUES (41,10,0),(42,11,2),(43,11,3),(44,11,4);
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

-- Dump completed on 2018-10-01 15:53:39
