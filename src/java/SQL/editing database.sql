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
INSERT INTO `ffproposal` VALUES (34,'College of Computer Studies (CCS)','Information Technology (IT)','2019-02-02','unitrep ccsit','Retreat',NULL,NULL,NULL,'Testing 2019','djsakdjsakl','djsakldjsak','dsjakdljsakld','2019-02-28',5000,'OVPLM',9,'ok','2019-02-02 18:59:16',' ayt','2019-02-02 19:00:25','nc','2019-02-02 19:00:45',NULL,NULL,'good','2019-02-02 19:01:05',1,1,1,NULL,1,1,1,1,NULL,1,4,NULL,NULL,NULL,85,'NICE!','okay','alright',NULL,'good',_binary '�\��\�\0JFIF\0\0x\0x\0\0�\�\0C\0		\n\n\r\n\n	\r�\�\0C��\0=B\"\0�\�\0\0\0\0\0\0\0\0\0\0\0	\n�\�\0�\0\0\0}\0!1AQa\"q2���#B��R\��$3br�	\n\Z%&\'()*456789:CDEFGHIJSTUVWXYZcdefghijstuvwxyz�����������������������������������\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\������������\�\0\0\0\0\0\0\0\0	\n�\�\0�\0\0w\0!1AQaq\"2�B����	#3R�br\�\n$4\�%�\Z&\'()*56789:CDEFGHIJSTUVWXYZcdefghijstuvwxyz������������������������������������\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�����������\�\0\0\0?\0�ѼM.�v���r7���LWui�K\�C5\�@ǒ�#\�V7\�+8�\�72\r\�r}s\�zZ]�c�\�PV5�ɟ�\'\�\��\��ʬ\'�D\0\�~���\0����\�H4�s��\��\�?g\���9\�:�\�c\�\���\Z��v����b#�\�F5\r\�\��ߦ)a�e\' 2��\�*\\b�]�|�fȿ����!\�O�^�\�f\�\�Ŋ}�Iw\'\"�V\�=y���\�ұf�\�x\"�ot+\�\�>P9\�\�\�S��1�\�Ο(ܗ�rR\"\\s\�\��\0[ޤ?�坴�>�6\��#\0q���Oz\�[�wo\�\\oC�\��\0�$7�I#?�m�?\�\�jv]CS\�\�6�5�\�\�\�\�73y`��rz�?\�\�O��+��	\�]\\�U\�p����nXLq)Ǩ\���U�)�HomÀ�!jT�\�N�H�\�t�u$�+\�Lw9���#b���R���1߷O~�\���H\�\�Q��NNI,}1\��t�ZhX�ǈ\��\�<z�\0�Tҋ\rLx�\�R\�\�\�҆}����\�\�\�S^�\�-\�2}�\�\�I�7���q�\�jl\�]��rt\��\�<�zs\�ӯ5�40�A\' ���\�>�憒\�5F$���\���\�F��\�\�\�N=�u8\�DtQ��t\Z.	i\�c���}�d�t*I?yv�#��\�ޟi�ʒ���@\��\�\��\���<f��X��SET\�i\�}�X\�t\�בD\�	4��5\�,���\��\0��!x<t=kj\��ϋ`ڢ8\��\����ܒ9\�A��#5\r\��\��\0vHXգ\0�~S\�g8\��\�\�>H��m�@]����mŮ�	\�A\0�\�\09�Ճ��@wC�Y\�|��,>o��1�\�1\�f�}T\"E�\�J\�\�\�\�\�t?�n=i�}���Ys�R\�;�8\��\�R�D\�\�.��z�[+�DL\�Z\�s�G�\�#\�R\��A6���#r�r��\�}\���nk��c�\�[pR�\�q\�y�\�UR\�O���Ï�\'\�r�������Z�>c�X�+�.d;�\��\�㧥J�\0�5�\�JV\�KʙA\�\�\�\�\�\"�\�\\,�%f΁�V\���\�*! \n\�m)#�̹\�8�\0\�Qb���xv5xƝ�\�\�&w$	\�\�\�\0�����U��LC���\���\�\r\���J��>�$\��:Ӣ�1\�H\0�r�w\�?^�x\�W+¿\�-]�\����v\����\���\Zs��\�?�5X7E[=�qL\�\�x=ihib��\�X�a	��\��U7�M)Hc��\�U��\�#\�\�\\\�qN�ʞ�s\��%\��xA��C\�\�%\�\�\��Ք��|��\�恥b�xCI�?�o�!\�A?������G��1@�~�1\�\� t\�\��\03I\'���?\�\�\�\�\�\���\�H1��53��N�\'a�P\�b��x+�\r|�}\�9%y��D\��\�xV��\�\�*f��]�O���\0�kEG��ʊ\�6:τRԮ\�\�?��A\���;\Z󟃎N���lL{rk\��\�z\��m-L��<61�S�1 =��\�<6�h��/�|o��\�\�Ԥ�ӑ\��\�u�9\�COY=Mg7w�Z��g�H��\\�z�$�ױ��V�\����GvM�!8;I\�	\��*e˯e\��\0{�V����2\0s�M ���[=9��.\�m1��s\�0�1н�!��\�\�~�����\� `\�\�jC z�\�\�HZ�\�iſ�3�w��\0g���B[ks�r@?\�;c�W�X\�\�j\�\0ڣ\�׭V\�5(4\�7�\�\�A\n�ff\�8��\nR\�]��p�W\'Nҽ{�Z�T�-��k���\�<6\�ʹc-\��u<{\�ȿ��3\�c}7O�{�h\�C1��O\�A\�T\r���zW\�?o_|T\�b�:���i\�,1Ee\�\\\�����9Rr�H#\0��Pob\\\�\��G���j�\�u\�}�^\�\n$�>w)2�8\�T]��\0zY��\0�\�\��}n\�\��L̰\\\\�˷����\��\r���5�\n�:ֻ�\�7\�\�om-��\�+ə���;\�R\�V�\'~�FXW;�k��\��˪_Z\�*��e�UD��\�~Km\�|�m\�I��߲0sG꿏�ઞ��\�䀈B\�\�\�D�2\�\�\0���bbw\�_��\0��\�V��\�\�K���+\�c�q#~\�Y��\�\��\��#v�A�Gĝz\�M�\�l\�$\�.\��?ycr\�k*2����\�\��\�,rB���\�\�x\�Z\��/.g�\�\�I�\�&)G\�y\�~w9`H*v�<\��I\n\�\�3�P�-����Fh-\\F\�i�R!�M��\�윫��\��z\�\��\0>����\�\�&}#Ro�\�%ŉg�2��\�I@��������\��v��&��[8x\�\�d�@\r`+\�\�\��\�!�\��i��(��[<\�u\nl!\�\�Io���fpI~x�\�E�q\�\Z���\n?\�4\�<Kog�x?Nm=.#�\�\�)dCl\\o+��\���bA�}��\�v��V\����T\�Ĝ�\�@#���\�\�3\�i-<�\�.mТ2]mެ1\�$.��22y�_��\0	�\���4_*}E�\��\0_�A�\�k��۴�.�bA88��OCX\�ڟ���|\�?\�\��\�\�ڣ��\��c��{W\��\0��\�z,w_ٺ���\�sicyip��w�\�a��q�Z�W\�W\�M\���m5\���+�VV�D}��%[i\�@#�4�Z�\�[��v�\���z2\0\�#\�q\��\0\��U�\�?S�\�ӓ\�,;3��9\�حG�\�\���y=\�\�C�W\�\�pG�\�?\n��\�Q\�Ҁ1\���i6���\�GZ��\�5�\�^M��\0�M�<��5\�q�\�5$v\�;\�|\�o֘X�(\�5\�q���\�h\�z��	Y~,S/�o}�?\�U�!�P�3\�=w�\0\\�>�RԔ�W�\��\�M74W �:�\n\"�\�=\n��rk\���σjR�P\�B�\�\�Ϯ*\�\�LcbT\�\�q\�\�5\0|\np9iآTQ�M(~}}�.}qKaO?7�ps\�\�9g\�=j��߅9$\��@\�߿5\"�\�F@?\�֫�J[&�,.7�\�\n\�#=3@��8=�??t`c\��dx\�ƚ�t�\rN\�\r>\�\�wI<�mH���\0e�c�ɤ|�5]��\��\�?3\0\0	$�@O�0�k\��*���0k����\�4-e��y\�3\�\��G���\0[��>a\\��?�\�տi_\r7Lim|?e�J\�.\�%�\�A�A��\�`��)6\�V}�\Z�w�A��Qɭa�R�C�\�us��w\�c\�V\�HbG.\nr>^�R\0\�\�,��G \��\�#9H\�)<�v�\�^N[��uC����kk@�m0�܄\\(9X\�Xg.I\�<-\rj\��f�~\�\�\�ؠ�*�\�\�\0F6\�`\�zM/ꖺ���]\�S\�ͤ4��\�<\�l��Yq����%K�#��mM汰k\�\nL\�}�C\�(�rϿc.K��\�$(~�� \�\�\�l\�e�96d\�ɷs|��\� ��4�\'�E���Is$�|\�eQI�c#�`Kd`&0A\�7a�_cP�:��8\�\�u\n\��\n�R!*Fs�	�I��sV`֮f\�\�<�\0%��WH\�\"\�JJ�&�bF`�J�\�i\��+�mD���.\�Y�I$7�\��UǛ\�\��K�\�bFş��\�\�e�q��T�\�S�QHc��n[F��.]�`0\�\�\�\�c\�\'q#g�Oȼ:ڮ!C�\�\r\�p\�\�0\�=8\�Zɵ\�\r�͝�\�,\�d�����\r\�9��_n���T\�]e(�+}�D`d>q�\�͜�R\Zй\�6\�m\�ɺ�\�攩ʶG�`�j$�YR\�&�ݞ]��򼄮O\��zg=�ʋ\�]\ZF��3(f\0�0c\�\�N�z\��f\�\��!#c�-�6���\�\�ځ�zN�&��Iw{7\�\ZC�b\�8\���}	\�\�};�\0����\�<{2jҳx#Uq���3#[\��%\�\�wu$��g�\�\��\�D���\�O@��0_�\�t�]���\r\�JłH�\0!�\'���\�ғWV5�����n\�^ҡ���)���f�\��\"���{z\�\�e~��<�k�O�	a�m\\|<\�\��k⹦�H��F\�.�\'\�M�A=6\�&ޘ\�ϭ~�E(�%u\�\\d\�{V\\�%\���\�C>q�>^�����ʶ��6\�1\�lu\�DNM )\�~o,9�\�[G`ҊBp)<�LR3m��#\���Py\�ң2;n4�\0��\�\0D��/��\�R׿\�s\�\��A1Vw<���h�^\�M\�\�\�\�ErtnL�W\��\�3^��W�|\���{\'��B\�*\��=N\�\\\��6)��\�\�!�4^i�\�\0I�\�4g\�ƕZ�\'�;*G#��5JA��\0�(<�?��^^-��J\�A?\��W\�\��\��\��ǉ��\Z\�\�h��)�;�g&9_l�\�e�׷L\�\�_�U\�:o���D�\��3[j��\�\�-\�I����\��\\q\�5��}\�5����l7.\\�\�=z�\�O5�;�\�\�\��\0\�\�$��F$\�\����\\�\���2x�[S���\�-\�~tr\�#1dl�(\�X|Ǧ8\�O�\�$\�Ď��S\�By,Jrs\�@\�Aw�#Eq,Qm�\�\�\�	q�\�9�\�`\�>�b�ZIufX젂x\�;\�\�?\��\�\��|������S�\�\�\�\�C*`Հ\�:\�\'=:�zS\�#v6�	d,\�븘�]�����y\�ҙ\�\�R\�d�w\�\���\r�(\�:\�깑#�lU\"�\�\�E,\��\�\�8|��\�n~�>��8\�]6V�\�\�\r\�\�w�mS\�\�nA\�\�\�zE\�~Q�cLѱ��P~�\��c,I�\�=�\��\�0�wq��B�#\'��sP\\F\�][ˬG�O&\r��\"rKg\�B�\'���J�\�㵂t\�B�\r���\��\�\�rGc&�ym0�Bc$�Io7#�\�8�1S\�3�\�ܸ1\\\�	� �A�҂\�\��\�aFd\rk&�\0/!r$\�Fኳoz��\�x\�r�2F{du�\0\Zˎu�E\�W\�\� \�/\�Fy㧯�i�\�yq,�J谅���nJ�xRFrzp�M\0lY\��\�z\nG$#\�jY�(wd �E\0`��O�Mcc6�al���ba$�\n�\� \�?\�\�<X�<o\"*[���.\0\0y�\�\\g\'$q\�sV4K\�l�	4��\�ƫ�a3�ď�\�\�\�\Zw/�\\Z���\�\�ŀ�VH��!eܠ�.O$���j��(Y\�.\�7o�n�ˌ`\�؏�1�Hͯ\�\�\��n#r�?\0j;\�e�\�eP?t�T\����\0\�c׮[\�z}żӣ\���\��78\��\�9���\0\����\��\0\�\�K7�\�h\�4!�\r@H�\0�b�ʎ\�n�Pߝ~/5ɒ�Ko-�A9�F[9���}�\0\���\�7\��+if��\�j\�++ܸXȕ\�$�1\�\�X\�wC��2WC?e�\�-Cep.�V\��\�S�t��(�\r��)I�隫;\\�Lۚo��5�\�\�\�+=@|����Ni1�3V��\\g�5\�\r&\�\�M2n\�LuU\�X�2\���?��j\�>�U\�\�:\�\�\'�\0\�M\'+\�\�y6\����\�3Bw�}(�9�\�GA�y�]F�\0v2�:}H�B\�\�5\�X.�~9\�\�\�=y5\�\�l@�\�jZ�4\�n)��m��r*:Unh�Rn�\0�\�U<A�Ţh�R\�\�m#\��c�����\��\0�\�|�Q�\�y�\'ִ\�\�{l\�W2�(\�ǘ���>�\0��~թ�D�d60��\�\�{�(n\�;�\�brI\�B{b�\\�fI�\�kg���]nmKT���/%��,�;��$�I=I���md̘m��z\�:#)�t-Op\Z0�B�O\�Q��b:ƛ�/���n��\��\�܌��q\�Ͻ$��k]�y\�g\��kUb\�B�cS�pR?ǹ�\�c���9\�ڧ�\�|E���Ki��ܒ\�\�7\�\�\�A�\�\�L�RA\��{��4J\�dE\�c\�\")=0NGz6O\"������\�G\�\�7(\�n\�{v\�ɩF�d��Wj�g�s�\���=1����=OP�E�\�\�q�Y1e@����]\n\�\�pз!b\'<�;\Z\�\�G���>�EԖ;\�5%Wh\�==F)�~��i�\�!�����ۣ˯�r}A�\�@\�l���6\��񑓏z\�\��56��\�,eU\�Q�(\�\�.Ӝ�~i���?g\'�F0�{�W۸�{��h7����6\�2@�\�Oj�|�\�\�1��0���2\�+m w��+~��OԵ\�+{\�$\��\�2*0>n�\r`�֍�G]��9�b�\�q\�W!\�폹89��]�1\n$i�ȃH\�o;eݴ�	�\�ۖ\�\��L�\�����\�1{��\"�\� \�\�\�^�r�O\���\�(ê�����#<g=OҶ�hK\�fN�\��\"�\�\�s�\�\�ZW_\�:�K;@V2r\0鎾�NFYm�\�߸/i?w�\'�_\�֟hV\�\�I7�2ʪ!;�\�#�c�8\�kC&�ߴ��n\0\�sW4\��h����\"\\\�\�	�q�U?-\�|<mv\�Ѓ�\0\��i\��\��c�<\����ߑ:��?�L\�\� ~\�?m\�5�ѼU\��kmCTJ���*�Ц\������ҧ�ʿ�\0a/���1���IXZj*l\�U$\�\�n#8\�\��\n������\�^6�A�yh��g\�jF�\"��(���	ɢ�qLf\�\'Jm\�&\�M6�i�e#74���95�����\0�O�\0����T7L\r��\�\�jf���\�D��zt��\��[,3�ڊ\�_\��\�/OO�?Mz	���\�ם�\���\�\'�5\�����X�t��p:S�Ȧ����Qӕ�4\0\�֟��E\09\�\���\�}+�O�{�\�\�6��GƟ`��\�\�b�K#�8\�\0{\�����\���_�U�I��\�W�K�\�\�%��?\�c��\���T����\�\�Li+�b\�I a��\r\�\��\�/�\�^��Y�\�\0�\�X}?ή^\�\�ZJ\�ꀆe.v�>��ulVt�:zv��a�\�!���|�cv	�{ի:\�[��G$����<}qT��38ٍ��s\�_N��#k���\�̹\�-\�,�\�\\�\�\\،DiF\��0�WZ\\��/�?��\�`��\\D\�>\���[�೶>A��w�f���S�\�z.ɮᷚa\�����	\�S�_F���l>s\�\�Б�\�:^����ϒs\�M|�|mI��\��L>�-R\��\�>\0\�|q;uf�|�}�:����;C\�V-2\�/�[\�\'�v\�\�go,�\�r�U�o#\�Dq\�O\�?�q^W�\���-�\�~\"���?�\�t\�s$�#\�`\�A\���\0\�\�\�A\ZCkɐ\�\�\�Ӄ���\�6~��Wvr�WЏZЏOE�f\0�\�\�j�+Z\�sPOmO>\�>i: Q��2�d��\�ZrxF\�.\�H�`����\�Wq��F\�P*���`��+��*3�\�\�u\�V����\��]\�`\�+�:�W�x��r���\�2X�\�e\�\�\0��`�^���\�9\�3֠�N�W\�\\��\�8����\�\r�S����\�sl�����\�BG͟N��\��i�O\�Mb\�M�F2[�C�x2($t�\�߉_\�մ��Stbt\��G+���_~\�گ���f��R\�\�\�Fw2��\�}8�s.\�\�r\�g��ai\�<�Z�cwq����@]\�x����ېy�\�n�i�6-� �F\�\�}�\�\�8\�\�5\�>�74�K�j�ٷٮ�\��RA2\r\�\�\�\�\�\�~\��\�\�?\�t�\�zN����2%w\�\0��U�S��J>\�p\��0N}+�\��\�\�[�[�s����\�\�\�%!\�&�\�\0\�\���k*�\�}}\�cޝ��4� +6i(��\Z\�\�6�(\0�\�C6\r2��[��\�5˺\'�S��>�3m��\�?\��\0�L�\�!�����?x\�D\�|�\���j+\06>\'��\�w;�\�נn\�z�ҳ\�ۻ��\03^���qV��\�~y5 \�r�J��z\n)�`9xj�7\�ڥIC\�@n�`\�q@g\�����\����\�WH��\�\�\��\�/�쮥v3d+dz��h-\�|��\0_�\�~���hE\�\�\�H\�6<\�H:PRi��,��G\�z���BO\�\�\0m\�pg�\�co��w \��ŀ}M[\�5=�V\�t̲�S��_β�\�R9�U�|���Ң\�b\r\�mJ%v\�jWs��\0J��\�F�!��O��\\\�2��q\�W\�\r4\�\�<]ek\"gϕF\�xPs��W\�7.-C�h\�	h\�\��k\�͛ID��ho3\�t{�ɽ�bA<���\�\�̏\'��<g5Z��\�=*uu�_=z`�\�\�3\�\�*�ʀv{\�\�ZV\'ny\�\�Y��@�ⴠ� c�zR\�/��Z�ف����9<{\Z�\�h�\�\�c�\�Z	����2������\�\�\�\�\�ǩ���ȼ\r\�٩a�՜�\�\0{|�#O+�Va\�\�J�$6\\q\�5<r#p\�Ԛ\�74vw�n�����Sx\�H���]Y\�.-\�<�23\�\�\�A\�a�\�\�,�*N8\�9\���tK�\0�[�\�`wk]EX\���\�\�t��k\�ˤ�K3\�\�b\�-:��I��\�$\��\n��\�7`��<\�h\�>\�F��5$���&J��tǧS_L�\��2m6ծ%\0\��\�`��23\�_�\��K[���\�\�{uk`�\�\�\�X���\�M#�ù\�s�L\�5�H&�Q27m\��秷Z�T�\0�Xx�|\'�f��E���\�V\Z����u1\�K�\������	氨��i�}F�z���桷�ͷF�Py\��\��D�\�\'�M\�Rg	\�#79Ȧ\��\�ZP��8�e}\�\0V�VB�\�?/���|g\�F=�dcje+��G�6\���\�\�l~tTz�2\�w\0+J\� u\�\�X���&]n�p��|\Z�$}��\��\0	\�ַv;,?�Mw\�6\�խ��$�\��\�h��(\���!ߝ\np{џqF}\�\0=f\�\�\��j��	\�q@	\�_�\0�ktYO\��aylH�%�A�\0k��k\�5ny<W\�?�Y8�\�\�W��d��u�VU9\��\�L\�}D�Qmf\�~Q�¨[\'�ǧw֝qw\�F�h\�s\�U\��\\�z\�E\���\0\�x�J�?�ܸ��ۭ~�x�D�L7\�P�</>��\�7\�9|K�Nk\�#}��\�#�b=+럈_�߄\�7d\�8�+`�o��:t��̯*��\�\�MF�1\�^ �M�|\�#Q��FO\�P[x�-E�\�:mng$\�ƞ6����ܴ���lA��s\�\�v�����\�\�ڳ\�#�s\�@X��;\�KA��x-\��\�\�Kaϰ\�ڱ��\�\�,k�(��~!\�v��C���A\��WK�x�	\�Cy�^�ڿ>��\0bψ>�7H�S\�2�uy��2>\�\�Z�\0ď<*b\�m�\�\�^\�Y,�\�\�Nv\��#�kR�(��\\ΝJ�~�O\�k�/�n���\�ROl.{�Ƽ�\�7�\�Z\�8\�{�1�\��|�\�O_ʽ5u_��3\��U\�c���5\�I\�ި\�$*\�\�P=k����w�]:M�Iwq�����<\�!s�98�\�揌��\0���6+mOhf�L�\�C��G\�\�,p:v5p�w�2���>��\�\��\�,��\�\n���F�\�\�\�,1Г�\n�\n����\�\�:���ٜ\�.ofCG\�s�On���\�Ë�2\�\�WE\Z�\�$J?���y\�֒���\�\�$���\�\�\�\�\�dc�z�?��\0l~6xQt�\�\�s	m\�C��~~\\�\0p\�Z��\0�\�\�*�e\��\0l鋫Xgd�l\n��/\�ϧc^\���\0\�&��9#�L[򮻈�\�P��\0z\�=L<\�\�L\�\"�X�3��\\\�n�9�\�a{��\�G�\0�+aǸ��\�3��x&���\��u��~*��5t]B<�8�;�g�+ċ����\�z��\���-^�$\�,ُ�2�\�s\�v\�~��\0�\�\���n%Y3�(q�\'�C�\�䜶B�@\����\0U�#�\0w\�\�G\�s��j:�Ʉ�\�P\�$h\��\�Br\n��ڟu���qJN+0\�Zc��f⛜\� �J�\0)��mnOZc>OZ`(���o\�F}\����������\����l��]DgP���h\�Ίf�n�\0ڗ8-�5�Ϲ��W\�\Z�Ay��#?�zy�\0¡�^�\���1]��군=ť_�>��S`s\�Fy\�P\�Um��\0��N��p\�C��\0_ʀװ�#��>\���l�^�kl�Z��e\�ؐ�9�aٌwȯ[�S��m\�\��\�[\�\�\�\�ފ�&��*1��\�kzT�V�qg*���\�Uu;X~\Z\�l3rǏC_B~\�\Z��|k׼O\�{k\�M;Y\�&�X\�\0��\�,\�\��sc=�\�J��\�	]�W��\0�w&��hNPf\�(N�\�*+h~\�?\�\�\�\n\��\����7ډ\�!6 U\�\�\��\�\�	n~&k��j�Z[�R1ɔ�\�\�\����ះ#�\�t��V\�\�4#\�\"�\�Ե��;C!\�\nz\n�j\�[�\�\��8zj4\�bq�\Z�\r\�\�^ˍ2\�\��/\�\����\0*\�\�O��2�α�i�8!�\0`\�f�g�\��S\��G���Z���)R�;��	<��u\��]��-|A�\�\��B\�Q\�\�&�˼K\�QgiՋ\�\�	�`�?�Zt\�9�Ԟ��jʜ}\�]�b\��\�\�\�\�\�ŧ\��e\��I\�=N1Zw\Zu��i����<\����\0�z�+\�\�q�Y�@�\�|{�%݄He���G�fxY#�0\�\�+\�~\�Z���a�\�j�\�\�\���3\�3Y�\�˫�I\�=H⢽\�\��\�\�I\�>�lt\�N��^)P�[�\0`]��`\�\�y�syc#��X~\�\���+�\��?��ʻs�;\�0���Ji�ϼ}�&��y����:HN\�\��V~���\�M�Y<���/�`�z\�C�\�fԝH+�\�\�\��f\�\r��i�\�~l Xķ7�	�\�RFR\�@�\0Vq��\�\�	%�\�h\Z����io\���g�z\�\��\�;_�O�Ai{�C��>ޝ8���i�:��>!�\�}�\�i�efb�\�ʰ*\0u Gz\�e�\Zύ�+�\�\�:[\�v\�4���@%�.\�2�rȠ\�2z\Z�������\�6�*󲆞�Ѻ�\���\�\�[�t;S�\0qV�\�4��וo\ZF��)D\0㎂�c\�/\�_\�=7\�\��-����\�\�H�z�9���4\�j-Z\�CÀ�\�\�V��2���Q�\��g\�N�\��\�db[Y�uR��ď¾^�\�\�rzc�ҿC?i�	E\�߄�Ŝ��H\Zh��\��\�_�:u�節�Q<�(� �g9\�\�^\�]8�;v<SO��`-\�\�q��8=��:���\0�mx>\����_�moQ�i\�d.\�RH�\�#���\�\�7�?fmK��G�\�j>jL�Xɏ&<\�\�\�N\�\�\�W\�Í>\�M�N����1Y¶\��\0xF#A�\�+xb!Q\�\'6\'R�b\�-\�\�\\�I�BG�t�\�r\nx�;\���\�Ns��\�mǽ\n=�N�m���m\�Z\0\�{\nM\���Ι\�{~�\�4Wl/���ޒ��q����c�\\ծ�:L\��4U}l훾?\��\0\�F�\�_\�l��As��\0,���8�6�B?\�mf\��\�r+\�7�QV�)��\�+qL\�ii�IE3q��@D�W�\�N�G�\�QQ@�\�q^m�W\�`�#�&y��`\�~�f\0�ʽ!xAӥy�\�g�ͬ|\'��T��иQ�����\'�N\�V	Eׂ�\�?;�\0i�O\�e�pG\�-�A1�m�\�\���\�Ş\�\�\�Zu�ҕu�8oc_�:ތ5y㶔G$s[�d��w`m9\�|q�\���_�@i\�β��^)<��\��\�ݍy�ekE\�g\�\�X^w\Zݏ�t@%��\�\0gֵ�\0�\�2oS\� U:\�ٲ)2~�\�i�\�t�\�\�Mj][c�\��\�\�\�dX�$�Q\��\nXH<�1���w�ن?0�*٧��\�\�\�\�\�y\�ǅ\Z\�|����\�5��Y��\�\�\�`c�twV\�8!c��ֳ��\�\�\�7vZ(\�h<��{�\�\�\�6��޹��Q\Z\�G$(��\�f\�\�\�ּ��\�}*yYf6�jF�\'\\\�˚|\�\�wc \'t�0\��\���U��Z)ć*��U\��\�\�9�\�B�N\�r��~��ɽՉ\'q\�z�	A|�\�@]B�\�O�w\�L�K��T�\�K6�D6��Jۘɻ\r�\�[K����ڹ\0\�\�o\�h�\�\�v(\�+y,<�\��S\'�Q2piy�)$�?\�:Cj~��?\�<D���q�\��|i�\�B�\�?j��\�O�_�R\�c%U$p�A�+\�\�έcp\0\�\�x�\���9�\�ڟS�\�#7\rsrI\��t%~�p\�ף���9X�\�:��=\�\�\�&\�\'�o�\�1C\'s�\���~�xx,\Z%���,H\0�E|+���3�<Z\\��\\�n \�\0s\�\�5��y0*�+�,�m�!�j�z�����w\�M\�;\n7违{ğ\�z3\�(ǰ�\'�\0��\�\�iw�:�\�\�F?J:\\\�I�SD�����\�\�qM-��BsS>\�y~�m^\�w\��Ѣ�k0gW��O�\��\0Ѝ��[\�\Z�\�;������Z�-\"��\�66}����z%Z\�O`�֤I�\n�ԈW�9�fK@84�斀&�Qӕ�\�5K\�:%\�nlnŴ\�&��8\�#׵\\\r�eN:\�\�\�\�Ӻ>��\�\�~�C��}ۭf�w\r��8ea�\\~��/\�\�x\�Sw�\�\��	�f��\�?�~�~\�_\�?�ơamCNWw]\��b\�X�L�\���a�#�7Z܉ɌI\r\�̟�\�Q\�x\�W\�գ*�ݏ�\�\�\�\�Y\�i��[E&\���w\�\�mX]�T��4\����~����>H�Nѻ�\�u���|��N<\�U�R1\�\�\�:x\�L��T�9\�3Y�\�<\�v��ܢ��\n\�\�4\�*x�?Z\��w|\�,#b�yN\��5٤ȁy��5\�x\�\�a�e�I\\��\�業4Tm\�\��\�\�m\�K��\�A�k0�5	\�:W��s��|%�A�m5�@\�_]\�HaKw��y;G�޺|^�\�4h�\�\�K�n#�;v�\�\�qI&��t-]�\�\�Ryr!\�\'Q\�X\�It�ϱ��\0.BYY�{f�\�\�\'\�y\�_�^&�\�[Ԟ٥=V\�\��\��5\�~#��Ѣ���e�\�)S��\��5|�\�VG^���JI uf\�\�\\B�:�*��.؏֕�\�\�۳)\�9<�\�\�\�T��Է\�=H\�V\\\�\�;�\�1\�*k2��#\�R*�o\�/C3�F�f\r��泅6\�hݖ9��o\�\�X���B瞙\�k\�>\n\�^\�fk[8ʽԜ�\�ff/�\n}\��/\�]wq�h�9�[\�\�[#\�_؋�R^\�w�\�˸[#[�+\�G�$�x�k鼑\���3\��\�\��]\�Km7!���\�z4�\�ߠP>��\�\�\�׹��\�\�Qg\�c�ڳ�6s\�&��Zn�\�i+�\�\��\��\�]�\ZBqI�Ri	��p��F�+�J(<\nM�\0��%\��\�D��\�Y���\�5���\�?�\��\0�����uk�?\��\03EefjP�I6�\0]t\�~��}y\�\�?�\�ן�\����Um\�Ka=��ɥ\�i��L̐|�����N\"�%i��PR�+@��K���F\�\��\�\�L\�!�\�Ӂ\�\���k\��\0��6�c\�N\�K\�$�\�\�\\\���=\��l$�O�J����\��5�J*j\�\�\�b\�Pw��\�\�oj~��\Z.�a6�}�\�kyq�]\�`���\�\�\�+��\����\�:>�Q,hd��e\\3g	 s�ּ6\�_-�k\�\�\�p��sY\�<\�ݷ}��^�n��\�\�Ee\�w����kҲ\��FI\�p=\�^*\�\�Qa�o�ܶP��\��@\�ω`�E�\�<J��G\���\�B~+?�~mJV�\���\�\�\�Cer��\�G\�q<�h\�\�w�J����q�`�Oo\�\���\�;3o\�[\�5�`	�OJ�ۏ6R�wglU\�O+�$7���\�c�1\�M>�\�\�\�s\�\"�>��\�M:\�RH�m��,�[H#�\0\Z�F�\��\�\�l\�9Xmׁ׌t�J\�յx.�n��2zg\0�X�\�j\�O�r�;��.\�\�M�6֞Y�˛�\�g���[I�<��-��]�\�Z\�\�o\��*�[�\�\\��G|��+ml�vՉ/\�\�NI|\�=O֪;�Q�X\��Dm{\��\�\�?4\�UP@\�O��@���\0gK�h����\�=���~�\��\�\�\� {�b��𭿍�)iz}\�m�f��L�0�nP}�Wؖp\��QAo\ZCJ#Q��v\�a()\�]��\�\�\�	rA\�YQ�u4������+\�\�c\���\��SKA8�Ȥ���֑�\'\�b�ED́��Oi\"�$sI��4�M5\�\����\�ɢ��h&�Go�@qZ�\�U��\0���\�>�l�j���Z+S\�/$����\�W�g\�?\�\�\�;�h��E\�*V\�{���\�3u(ni��Q�n�)CPթ\�lS�\�GZh~y�\�(H�\�r~��(9[u8gހ9/���,֭#�͜[4Ш<�\�Q��_E!�Bmu;YH\�GW\�m��\�b�C��>7ßKz�\Zv�+\�ۅ�C˦~�#\�ָ1�\�e\��2꼲\�}NYn���\�\r,�����\�P�Lg�K�/\\���\�O��\�K�ߕUF+\����{\�\�\��\�Mm�\�pOD�5�z<\�\�&q�\���M_\��Wv�$�V�Hv\�\"��Ȥ�gT\"�\�\�t�\0�\�x�\�G�K\�\�\�\"�c�t�H�m�o<\�\�����Gm\�@־�����(D+�M�\�Z2x�G�B��Á���\�h�w/f��9x�B5+iz]\�q�v\�#=z�g\��\�oߧ��ڬ��BO^W��A�\�z|\�\�m\r��O\'�\�\�K\�H!�3uP�}�t]U嶄\�O��\�O/˔\�\�\����\�r\�\�=;\�Zi\�\�\�<�Q��\�\�W��Ì�\�|\��-H���=�QO&G\rǥQ}P3pW�\�:�\���|�%��\0��mO]�:\�ǿ~Ş�mCY՚=\�JZ\��\��Y��e�}�j\��/�#\�\�\�;�s\"�\�A\��\�U\�\�\�\Z\�7W\�ai�pH�,D��6M#\�\�?ڙ�\�f�.I\�\�)�)��\�(�Roo\0�7\nil\�P�\n7\ne&\�@f\�9�\�)�h\�p0o#\�w/\�\�EM2+p\�M��\�|%�/H\��#���%píy��\�\'ķ�=a\�ב^��\��T��\"Z\�DK\�=[+\�32O0�i�\�TY�\�%(b�\�n)A\�\0HE-G�7P��\�\�Qn�\�\�Z�\�D�U�+;\�\ZM=�\�6ܕ\�A���=¹o�z`־��߃\�i�\0\�\����SL֓jh�&\�U\�.�\�9�\�o��A%zZ\��\�%�\��G#�~�_A�\�K�Vh\�z�+\�\�}��+hz]�	\"\�\�ҖX3������\�V�a۞�ջa�<�k�S�=J�iqH�\�=rFj��b\�X���\�]-��S�/^x�\�\�G�\�\�Ws���T:4���Q�\����\� b�5�\�4�q�\�N��\0\�s\����\�t1�\0��lUh�hz�\�\�Wo�R\�\�\��y\�\\��Y���\�*m�j��8\�W>jR�<�L���8�u�\�\��Ų\�\�f���\��s�j\��>\�ar&wŴ�<�vQ�g*:3�z#�\��P\�N�ۣ����O\�+\�c���Q\�?̦��M[���EG��\����u�\�e8���\�ٰi�g4�\��	\�&\�K\�LJO={\�Mt\�O_Z+S\�����\�\��b�6\�\�W��\"|��\�zC\��\�\"�l\'�6y\�?:B�=�\0:�[kf�\�{~�\�ǧ\�COnn���ZU�st�h}�ҫ\��\�^	�\0X\�}(\�sQy�\�ӑ�M\0I�Q���(��T׭�ۣ]E�\�l.���G���v�H�\�LqѦ~jj�\"wm zW\�\�\Z_��˃\�u�P\�m>ͩ\\\�Ø��2=0Ʊ�mg�\�3����\�G\�a���;�\�\�o-Ev&\��b\0\�\�z��\�k]N\�L3\�\�\�\�<�^C\�_��Nހ\�\�+-OS�����C1���\0\�T\�I���\�\�j\�E)�{\r>\�\�xqO���\�ׂZ|{�\��\0\�C\"�F%�?�Y�\0����\�1�w\�j\�=\�\�ff\�\�\�D���\�\��{W�\��G[4�;��~��ڇ\�Y/�K+k�f\��i=Ǧx\�\�,\ZU�n�\"\��}+\�/u{\�]m]�ûw\�>�g\�i׾\"�In�f\\��$\�i\��+D@�{\�\�.xcD[X�ٴ���\�M�\"��>\�ֳ4����Ҷ�%��T�\�MX��>\��S\��\'\�\�\"\���P��?+l�t;\�~5���\��\0Ɵ��\�\�_<]p�]�c\�ЌQ\�\�G\��@\�I\�u�/\�3�C�\�x\�\�ÿ�\�c�\�d�}A-�Mrʻ\�\0\�r\��}�_[��A%��<\�M\�h~�\�֐�UK]R�h淙.`�CE,l$g ��|\�+�\�\�\�I��U|��ͥPh�$/\������\�>��q�\�?4�\�\��P���-G\�zF��\��P���\�\�\�\�Jvh|\��\0	����6\��V&��|���/8\�\����uy�����\�2\�y\�\�+\�3����\�ճKQ��K����\�3\�\�o�\0I���7�SLdӇ4\0\�|7&�\�\�~U(\'(��\0�\�\�j�y}�i,�\�0��\�w`��u$�����n\��+ޝ�\�\�<1�\�\���g\n�\��\�\�Z�U\0\�����\���J��f}u�����\��\0��\�j�؏,�P*��\�0�;䎸��ƿ�*/��i�O\�υ8�֋N��O��lF\�\"\�]�209�Ͽ\Z|Z\�|s�=櫪\�j��i.n�2I+1\�9\�\�9\�z��s�A�\�\Z_�\�mMy���M+\�\�;%uA��P+�W\�Q\�]N\�W���٥ȁc�\�\0�\�X�Ԛ\�x<\�\���\�xj\�\�<ノ{WO\�1\�=k\�˙\��8G�*&��fa�(9=+��\�\�H9\�\�^�����B���[X\�J?<�\�Z\"�Q�8��7�w�گZ|%Ӯm\�\��a�\rk=��q�\��\�φ.�wh��`�u�T�(\� �#a���kpĒX��j\�>�\�\�ϔ��\�\�ȯLԑ$�\�v湩\�\������\�,İ�6v�3��ni\�ۜ|�T0\�\��p���.ȶ~f�\�RI{N�؜\��\�\�\�\��\��V����\0O\'\�\�~�(U>��r���ܶI9\�\�^Y�Y|�ƾ�Ė�z\�O\��<J2\�޼c��W�Z���٭�7�\�\n�\�۲�M��;}|�\0�J�8���p9�\�85#促_���\�$>�6��ڨ �o݌�g�۵}\���\\tψf\�ß��M�\�\�mm�[@E�\�Tm-\�crx?.\�{\n��\�\�r3�\rh\���\�n\�|�!Q�s�F\n�_p|?)�\�z�P��ɽCS�Acڦ����~*�\�\��QO�\�(,��B={D\0\�uYd+l7V#�`s\��7���,?�� \�ƾ(���\���{�e\��j�g�����r�\�$|7^)�h��+��G\�}\�N���\�\�~�g*��Z\\,\�ruƶ\�4Ӹ�%�G�\�G�\��\�E�3\�\0N��q���I���+\��(\�\�K��J�\�����u\�{\0\�\��A\�j*D\\ \�Ҋ�S\�~�|Iw\��\�\n\�k̾3\�n9>FO��+\��ȩ[\nC�\�<\�m\�\�y�ɦњ\0��\�{�/\�^8Ҿ�~}SZ\�m4\�>\�K��3,H��b2x<w�Ql\r7�\�y�\�#�[x3�`�m\�\�R\�\�mai\"ӡ�\r\�\�����\�\�w��m/�,N�\�h/4��.�`,��ҡ�\�`�X�*p3�D\�\�|\r\�\�x�R�^�qusq1i�琼�RL�:/���l��\0l?�*�i�\�\�S��g���N��5\�\��\�����#�j�j\�\\�\�\�Ĵ�\�\�\�r\�VU\�\�\�1%\�\�\���F>A���BUWA\�b����a?��3�\�\�I�˹T�;%fn�Ǐƾ<.P�\0?j\��\0f_�o�⍥�,ge��\��f�\�\�a�uiYt;2\�_��\��zr\�ֺ��v\'9\�Z͈�r��a.c��\�H\�PD�AV\�\�G}+sN��\"\�^=k\�e��\�#n\�e�1T�K$�\\?*�\�FI��f�~`x9Qm�ʓEX\�q\��\�)n|1�\�\�!n��\0N�b�\�>\�Zix�Çg�j�0-��\�O.G,��<\n�4֍7/\�Oz\�xbp�;�\�h�\�-\�\�=��r����ˎ1\�Z�r\�\�\����\r\�ڥ\��\�Z�|��\�����Z\�Cjrs\\\�zdr3\�V\�n^l��\n̝?=\�;\�B/�\�Y���\�\�\�?�P�k࿄�z%��\0�벟1A��wBH�a\�R-\�{�\�E�4�;P3�_�\�\��\�p|^\�/џ\�\��{4c��&\����5ߔ\�J\�\�dy��%S�ʷg��d\�ʬ\�GE��\�F���p[?�A\���I�\�z�n\nn!�6�Z���,\�by�;2v+9\�Ԩ\���\�O�kM�\0/�����ǯSTQ|\��\�9$���x�\�F�9\�r��/ˡ�\�\�\��\0�\0j_�\�^!���ֹ{e\�N\�=�\�\��vH\�W\�\�#�j�3���\0\�^	��g��L��$Q��=BtKk�<���py\�{W\�,W\�Y<�[\�\�q�PpG���\�h\�\����\�g�H\�\����.\�b�Bzv��d.-n!���\�p\���z\�\��\�\�{ſ��n�7�\�:Z\�\�tyYb`�����}��0�\0�`\��C$\Zo��V\�f\��Zѿw\��c\�\��A<\�5ԞV���\�z��\��ߊ4\�i1_\�W����\�+�yVH�r��\Z\�S\�үru$o\�IB\�};\�\�q\�\�JK�\�\�T�\�=(�\�^=8\�Edhy\'�\�ǉ\�?\�\��\0f\�\"b��y�\� \���粴?�\"�*�lC}�\�ڏ<�S)c=N=Q$�y��\�Wŝ\��\0��\�<I�[\�Z|\'iA �\�\0$\�ȿ����M�{/�<��\�?\�\0��2\�\��\�R\�\�y1��\�n\�W\�_\�\� �\�\�Y5�\�\���̤2�\��G訌H\0g�h�ܖ\�~�||�\0�\�h\�Vӧ\�\�6kōJKR��\�\r��-7\�l�FGq��K�����k�HkF\�\�ڳ��1kkhaDT\�9\�>��\�:��^�m\�D�/?,~�Vl\�\�I$��5���\�4e�d\�ݍ�\�Y�3U\�|C,�䍹�5J Z@~�n\�Á�<z�[m�VL\�\�J���\��c�����֢&o�1�?J�\�~�\�iۂ�I\�ڙ,�\���\�Ƶg\���\0\�7\�M���\�����\��[c\�%�\�}O���\�_c�_�q\\5�\�\�n��8���e/\�b-m�\����vi��\�u\�s2\�]\�ZK\�}>]�\�{*�\�}l\��\�ҧ�f,7\�۞\�\�\Z\�\�]ӣ����\�\�e�\�\�Ձ\���Ӛ=�>�=+�\�\�vgЩ�����A+9>�I�dN���m\��L�f�\�\�(\�.U\r,r�R�r\\I׵R�8<zZ�\�2�x�E�&\�C;\n�+��i4�fH�i\r��WX�\�J\�r����n1V4�\�.W<�\�\�֗�ri�\�,\�c�9i$!~��?\Z������m4k+��\�A<\�\�Ga��!�1Ǡ��]Xz�.Trbq0��)�\��\0�\�PY\�\�\�dYn�*�\�`\��\�T\�M�}�\�W7�jRI4�$��Y\�q9\�$�i�t�un��}^\ZP�>W]՛ob\�l�nH\��\�\�T\�� Uboaǥ8r�\�r?\�\�]IX\�$�\�i\�3S\"���\��\�\�?&29�\����gY�xS��̓��\��)6��a�t8\�6\�5p[�4\�\�%Q\�\�H������Mܳ�@v#N\�@,q\�\�棴�\�X\��fL\0Ǐ����?�I�\�m���\��\�\�3�HԽa4\�2����<ݞ1��篽kZ]M�\�h�W)j�n��+�g�\��=\�K� f,�\�\�F��U�1�s�5s\��.��9$E9 \0\�\�\���\�hh��ߵ�~\�m^�\�\�2�%Ex^B2.03\�q��}\��(�\0�X4�zJYx鿱u�ڒ]\�6w-�\�\�C�p@\�_���\�j6\�4�l��\"\n\�98\��^�mf{�L&]ʻe(\�<\�\�8#\�\�<t�n֥\�\�\�\r_�������\�$,���\�G/�\��W\�\��\�\�\�\���t\�U\�.\�,\�VkIԙ9h�\�9\�\���A�!�\�~����a~֚��*���\���\�?4N@\r�[\�#\�\�ufK�>�{�.ry\�84Q�#��p\�S\�I\�/̾.�6\�n\�\�W�\��o�\�\"�\�fB@0�\�nV��\0k_\�\�\�_����j2�\�cW�\�\�\0\�\�9\�\��5Q�2��g�x�Ķ\�f�\�/-�l����O(�GRI5�\��\0�\0��k\�\��\'\�}�\�	�\�rL\�E�-\�$�$� !�с\�#\�\���\n\�O\�{W+�\\\�c�&��\�\�=�W9��{r\�5�\�֠f݆1���~ܑ]Q�J¿sGSמ[\�L���C��\�ɻ�\'�t\�Y�L�+�>UFoӵV\r\�?�;�֮\�m�Iv�\�7v\�1�Zj��\�\�Գ�!o\���\�\���N�\0�>\���_�k$O\�o��dJl\���Z��D�j@�j;@5\"�e\�@+���s\����1\�\�wn��=�x\�\�A���\�\�ea\�;�\�0��\�+[�Î\�&�j]\�D�%�Vx�\�Ρص��/�l\�m�\�;��;���\��3\�^6ë\�\\h��Uy|�$ǎ��?\Z�\"\���z\�EX�輌W#/�WV�;�ٍjZ\'��\�\�\�\�>1�i�Ƒz��y\�FO\�ȧ\�\�.���\�m\�\�~M\�\� �\�T�3�~\�ֺ����g��O�k7q\�\0חS$�\�#ק���4~�_\�&Kt;~n=r*换1##��ͧ�\�\�Ј�Cp\��\Z����\����|B�.�ۧByU�YaϹo:�m?M�I�\�ɨ\�V(�%��T\�\�k\�~!�\���pd[#/�.\�\�lʱ+\�N>��=\�|a{�I�k�d~ōU3\�s��\�\�꥓F.�w8j\�ӗ��{_\�\�cş�\�\�\�i�[`[wڇ\�oƼvk�8\�\'�\�\'�MTI�c\�y#ݰ/Ƿ�zС/p�ՕMf\�M\�\�R�#�\�\�(\�Q\0\�\�b��\"�Zu�pI�~�#-ӌ�1\�Ӛm��$\�\�P#�ꤱ?�O�\�\� E0-n؅_w\\��I72y[�H n}��0\�\��o7H�\�\�\��o\�P\�\�ksR��C\\\�\�I���\�+\�C\�=F8\��r\�\�L�cq1�\���(b�\�Z-\�ŧʟ+�v�F<q\�s\�W\�NƂC�\�ۘ�\�*eq�8\�Q\�\'ڤ\�,�̕v�q��+\�\�c䞸\�<s\�\�\\��I\"kvQ7\�ƨ2p\0\�sӿ�J\�6���x<�\�z��\��\�Y�&kx\�g\n�\�#h\���^��2�\Z-\�@\�\�]�+y-\"��\�O�\0t ��Ex�\�+;�;��\�lɐ�\�\��N�O�*K}0���\�\�,\0o^���&o�Y\��\�4�\�\n�\'�s۟β,He�~\�\�b�Rg�\�A�Y\�N3\��u�g�/�x׺u��wvϼ�YWg\r(W\�]r\n��с\��\0I�\�!/e�~26>]\�ԑ\�z\�\�.�\0R\� a�7�\�*���\0�\�8\�\03YTW\�ږ��[[�\0�A�,iV\�k�q,6\�\"�\�\�ciW�X\�\���{\�_:C\�]>(���ٶ�<\�\��\�\��\�1\�ErZ]\�\�s���\�\��W\�\�x��E��\�e�OI3�[��\�^9\��W\�\�\�?�z\�ď\\\�\�\�u�jw�g����\0w�~�\��N�\Z\�\�w\�=_J��\0Us\�b���\�Á\��!o,�W�Bͻˑ�8\�q޽,4�\��j\�:�\�\�e��O֘>b}�Y-��2x4\�c�\�_Һ�v\�\�j1SҤ5=�Q\�f�D�RY\�XqN�w�r@\�T\�n\n\�Җ\�\�g���\�_\��\�M�\�\�\�\��%�<\�J[��2z\�Z+�\�\�\"�f\�*ǻ�J|q|���J��WD#\rLh��N��\�To��;\�ɭ����S\�DD�<\��+F\nԓ\�#U�$\�^٠\�F\�OnU��\��J�\��pߑ�\�/��\�FsL�r\�\�4�\�Fs\�T����\0�W,\�y5\Zes\�=(\�r}\�?\nr\��jI<dc��\�\�\�P{\�f^W�1\�4;$\���Xy��\0/Ojb h�\�5=��I:��*n~KT�6\�\�zr3\�ڤ�/\���x�@{�:Pd�,f�q\�\�m㨤�p?�=�ħ��Ԗp	#$�\�@\��#VV\�u=�4싙�de��3�J�nr	?QҘ\�\�\n��\�\�{diZI\�ځ#d39m\�L&?8�\�W\�\�\"�q�\�F}��GKa,{\�+�Nq�~�t�!�C(t�B�\�io\�\�ۚ��Av9o]\�@��J�yo5��$ޭ�]L�\���z�}\�6i<�#��{�t\�N�}\�\�SMy�$\� \\��>m���?΁�植}x��^O��c\�\�9\�I\�\�Ҵ\Z�\��~%�F�#\��6VA�\�?7�\�j�\�$ͺ�1H]��\�~o��\�=j׈�9-o�X��k0e\nޫ!\�\�\��\�X\�sk\�D\�\��`��_i�\��\0[�$�\�\��ڵ5�\�9\���{iI&(�\�\��iw\��v\'�\�ϿMk��\0uS��s�\�L���nx7\�1x�\�q\�H\�J@�@᳿?J\�m$Rmlw�N��j\ZU��\�zSE4I\"y*@#�\�J+\�|\�\�Zx66lE�`���\�\�(�S�\��\�','YP4DSL46A9',NULL,NULL,NULL,NULL,'Academic','2019-02-02 18:58:38',1,1,1,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,'Comment','Suggestion','Suggestion','Suggestion','Comment',100,NULL);
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
INSERT INTO `seproposal` VALUES (25,'College of Computer Studies (CCS)','Information Technology (IT)','2019-01-29','Testing 2019','unitrep ccsit','Interdisciplinary Fora',1,1,2,NULL,NULL,'2019-01-31',5000,'dsadasdsads','dsadsa','dsadsa','dafadsa','5008675','sads','adsadsa','dsadsadsa','dsadsada','OVPLM',27,5,12,5,5,5,5,5,0,'ayt','2019-01-29 17:35:43',' good','2019-01-29 17:35:57','kk','2019-01-29 17:36:28',NULL,NULL,'ayt','2019-01-29 17:45:19',1,1,1,1,1,NULL,NULL,NULL,1,1,1,1,1,NULL,NULL,NULL,5,NULL,NULL,NULL,85,'fdsfdadsada','fdsfdsfs','dsadsadsa','fdsfsfs','dsadsadsa',NULL,NULL,NULL,_binary '�\��\�\0JFIF\0\0x\0x\0\0�\�\0C\0		\n\n\r\n\n	\r�\�\0C��\0=B\"\0�\�\0\0\0\0\0\0\0\0\0\0\0	\n�\�\0�\0\0\0}\0!1AQa\"q2���#B��R\��$3br�	\n\Z%&\'()*456789:CDEFGHIJSTUVWXYZcdefghijstuvwxyz�����������������������������������\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\������������\�\0\0\0\0\0\0\0\0	\n�\�\0�\0\0w\0!1AQaq\"2�B����	#3R�br\�\n$4\�%�\Z&\'()*56789:CDEFGHIJSTUVWXYZcdefghijstuvwxyz������������������������������������\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�����������\�\0\0\0?\0�ѼM.�v���r7���LWui�K\�C5\�@ǒ�#\�V7\�+8�\�72\r\�r}s\�zZ]�c�\�PV5�ɟ�\'\�\��\��ʬ\'�D\0\�~���\0����\�H4�s��\��\�?g\���9\�:�\�c\�\���\Z��v����b#�\�F5\r\�\��ߦ)a�e\' 2��\�*\\b�]�|�fȿ����!\�O�^�\�f\�\�Ŋ}�Iw\'\"�V\�=y���\�ұf�\�x\"�ot+\�\�>P9\�\�\�S��1�\�Ο(ܗ�rR\"\\s\�\��\0[ޤ?�坴�>�6\��#\0q���Oz\�[�wo\�\\oC�\��\0�$7�I#?�m�?\�\�jv]CS\�\�6�5�\�\�\�\�73y`��rz�?\�\�O��+��	\�]\\�U\�p����nXLq)Ǩ\���U�)�HomÀ�!jT�\�N�H�\�t�u$�+\�Lw9���#b���R���1߷O~�\���H\�\�Q��NNI,}1\��t�ZhX�ǈ\��\�<z�\0�Tҋ\rLx�\�R\�\�\�҆}����\�\�\�S^�\�-\�2}�\�\�I�7���q�\�jl\�]��rt\��\�<�zs\�ӯ5�40�A\' ���\�>�憒\�5F$���\���\�F��\�\�\�N=�u8\�DtQ��t\Z.	i\�c���}�d�t*I?yv�#��\�ޟi�ʒ���@\��\�\��\���<f��X��SET\�i\�}�X\�t\�בD\�	4��5\�,���\��\0��!x<t=kj\��ϋ`ڢ8\��\����ܒ9\�A��#5\r\��\��\0vHXգ\0�~S\�g8\��\�\�>H��m�@]����mŮ�	\�A\0�\�\09�Ճ��@wC�Y\�|��,>o��1�\�1\�f�}T\"E�\�J\�\�\�\�\�t?�n=i�}���Ys�R\�;�8\��\�R�D\�\�.��z�[+�DL\�Z\�s�G�\�#\�R\��A6���#r�r��\�}\���nk��c�\�[pR�\�q\�y�\�UR\�O���Ï�\'\�r�������Z�>c�X�+�.d;�\��\�㧥J�\0�5�\�JV\�KʙA\�\�\�\�\�\"�\�\\,�%f΁�V\���\�*! \n\�m)#�̹\�8�\0\�Qb���xv5xƝ�\�\�&w$	\�\�\�\0�����U��LC���\���\�\r\���J��>�$\��:Ӣ�1\�H\0�r�w\�?^�x\�W+¿\�-]�\����v\����\���\Zs��\�?�5X7E[=�qL\�\�x=ihib��\�X�a	��\��U7�M)Hc��\�U��\�#\�\�\\\�qN�ʞ�s\��%\��xA��C\�\�%\�\�\��Ք��|��\�恥b�xCI�?�o�!\�A?������G��1@�~�1\�\� t\�\��\03I\'���?\�\�\�\�\�\���\�H1��53��N�\'a�P\�b��x+�\r|�}\�9%y��D\��\�xV��\�\�*f��]�O���\0�kEG��ʊ\�6:τRԮ\�\�?��A\���;\Z󟃎N���lL{rk\��\�z\��m-L��<61�S�1 =��\�<6�h��/�|o��\�\�Ԥ�ӑ\��\�u�9\�COY=Mg7w�Z��g�H��\\�z�$�ױ��V�\����GvM�!8;I\�	\��*e˯e\��\0{�V����2\0s�M ���[=9��.\�m1��s\�0�1н�!��\�\�~�����\� `\�\�jC z�\�\�HZ�\�iſ�3�w��\0g���B[ks�r@?\�;c�W�X\�\�j\�\0ڣ\�׭V\�5(4\�7�\�\�A\n�ff\�8��\nR\�]��p�W\'Nҽ{�Z�T�-��k���\�<6\�ʹc-\��u<{\�ȿ��3\�c}7O�{�h\�C1��O\�A\�T\r���zW\�?o_|T\�b�:���i\�,1Ee\�\\\�����9Rr�H#\0��Pob\\\�\��G���j�\�u\�}�^\�\n$�>w)2�8\�T]��\0zY��\0�\�\��}n\�\��L̰\\\\�˷����\��\r���5�\n�:ֻ�\�7\�\�om-��\�+ə���;\�R\�V�\'~�FXW;�k��\��˪_Z\�*��e�UD��\�~Km\�|�m\�I��߲0sG꿏�ઞ��\�䀈B\�\�\�D�2\�\�\0���bbw\�_��\0��\�V��\�\�K���+\�c�q#~\�Y��\�\��\��#v�A�Gĝz\�M�\�l\�$\�.\��?ycr\�k*2����\�\��\�,rB���\�\�x\�Z\��/.g�\�\�I�\�&)G\�y\�~w9`H*v�<\��I\n\�\�3�P�-����Fh-\\F\�i�R!�M��\�윫��\��z\�\��\0>����\�\�&}#Ro�\�%ŉg�2��\�I@��������\��v��&��[8x\�\�d�@\r`+\�\�\��\�!�\��i��(��[<\�u\nl!\�\�Io���fpI~x�\�E�q\�\Z���\n?\�4\�<Kog�x?Nm=.#�\�\�)dCl\\o+��\���bA�}��\�v��V\����T\�Ĝ�\�@#���\�\�3\�i-<�\�.mТ2]mެ1\�$.��22y�_��\0	�\���4_*}E�\��\0_�A�\�k��۴�.�bA88��OCX\�ڟ���|\�?\�\��\�\�ڣ��\��c��{W\��\0��\�z,w_ٺ���\�sicyip��w�\�a��q�Z�W\�W\�M\���m5\���+�VV�D}��%[i\�@#�4�Z�\�[��v�\���z2\0\�#\�q\��\0\��U�\�?S�\�ӓ\�,;3��9\�حG�\�\���y=\�\�C�W\�\�pG�\�?\n��\�Q\�Ҁ1\���i6���\�GZ��\�5�\�^M��\0�M�<��5\�q�\�5$v\�;\�|\�o֘X�(\�5\�q���\�h\�z��	Y~,S/�o}�?\�U�!�P�3\�=w�\0\\�>�RԔ�W�\��\�M74W �:�\n\"�\�=\n��rk\���σjR�P\�B�\�\�Ϯ*\�\�LcbT\�\�q\�\�5\0|\np9iآTQ�M(~}}�.}qKaO?7�ps\�\�9g\�=j��߅9$\��@\�߿5\"�\�F@?\�֫�J[&�,.7�\�\n\�#=3@��8=�??t`c\��dx\�ƚ�t�\rN\�\r>\�\�wI<�mH���\0e�c�ɤ|�5]��\��\�?3\0\0	$�@O�0�k\��*���0k����\�4-e��y\�3\�\��G���\0[��>a\\��?�\�տi_\r7Lim|?e�J\�.\�%�\�A�A��\�`��)6\�V}�\Z�w�A��Qɭa�R�C�\�us��w\�c\�V\�HbG.\nr>^�R\0\�\�,��G \��\�#9H\�)<�v�\�^N[��uC����kk@�m0�܄\\(9X\�Xg.I\�<-\rj\��f�~\�\�\�ؠ�*�\�\�\0F6\�`\�zM/ꖺ���]\�S\�ͤ4��\�<\�l��Yq����%K�#��mM汰k\�\nL\�}�C\�(�rϿc.K��\�$(~�� \�\�\�l\�e�96d\�ɷs|��\� ��4�\'�E���Is$�|\�eQI�c#�`Kd`&0A\�7a�_cP�:��8\�\�u\n\��\n�R!*Fs�	�I��sV`֮f\�\�<�\0%��WH\�\"\�JJ�&�bF`�J�\�i\��+�mD���.\�Y�I$7�\��UǛ\�\��K�\�bFş��\�\�e�q��T�\�S�QHc��n[F��.]�`0\�\�\�\�c\�\'q#g�Oȼ:ڮ!C�\�\r\�p\�\�0\�=8\�Zɵ\�\r�͝�\�,\�d�����\r\�9��_n���T\�]e(�+}�D`d>q�\�͜�R\Zй\�6\�m\�ɺ�\�攩ʶG�`�j$�YR\�&�ݞ]��򼄮O\��zg=�ʋ\�]\ZF��3(f\0�0c\�\�N�z\��f\�\��!#c�-�6���\�\�ځ�zN�&��Iw{7\�\ZC�b\�8\���}	\�\�};�\0����\�<{2jҳx#Uq���3#[\��%\�\�wu$��g�\�\��\�D���\�O@��0_�\�t�]���\r\�JłH�\0!�\'���\�ғWV5�����n\�^ҡ���)���f�\��\"���{z\�\�e~��<�k�O�	a�m\\|<\�\��k⹦�H��F\�.�\'\�M�A=6\�&ޘ\�ϭ~�E(�%u\�\\d\�{V\\�%\���\�C>q�>^�����ʶ��6\�1\�lu\�DNM )\�~o,9�\�[G`ҊBp)<�LR3m��#\���Py\�ң2;n4�\0��\�\0D��/��\�R׿\�s\�\��A1Vw<���h�^\�M\�\�\�\�ErtnL�W\��\�3^��W�|\���{\'��B\�*\��=N\�\\\��6)��\�\�!�4^i�\�\0I�\�4g\�ƕZ�\'�;*G#��5JA��\0�(<�?��^^-��J\�A?\��W\�\��\��\��ǉ��\Z\�\�h��)�;�g&9_l�\�e�׷L\�\�_�U\�:o���D�\��3[j��\�\�-\�I����\��\\q\�5��}\�5����l7.\\�\�=z�\�O5�;�\�\�\��\0\�\�$��F$\�\����\\�\���2x�[S���\�-\�~tr\�#1dl�(\�X|Ǧ8\�O�\�$\�Ď��S\�By,Jrs\�@\�Aw�#Eq,Qm�\�\�\�	q�\�9�\�`\�>�b�ZIufX젂x\�;\�\�?\��\�\��|������S�\�\�\�\�C*`Հ\�:\�\'=:�zS\�#v6�	d,\�븘�]�����y\�ҙ\�\�R\�d�w\�\���\r�(\�:\�깑#�lU\"�\�\�E,\��\�\�8|��\�n~�>��8\�]6V�\�\�\r\�\�w�mS\�\�nA\�\�\�zE\�~Q�cLѱ��P~�\��c,I�\�=�\��\�0�wq��B�#\'��sP\\F\�][ˬG�O&\r��\"rKg\�B�\'���J�\�㵂t\�B�\r���\��\�\�rGc&�ym0�Bc$�Io7#�\�8�1S\�3�\�ܸ1\\\�	� �A�҂\�\��\�aFd\rk&�\0/!r$\�Fኳoz��\�x\�r�2F{du�\0\Zˎu�E\�W\�\� \�/\�Fy㧯�i�\�yq,�J谅���nJ�xRFrzp�M\0lY\��\�z\nG$#\�jY�(wd �E\0`��O�Mcc6�al���ba$�\n�\� \�?\�\�<X�<o\"*[���.\0\0y�\�\\g\'$q\�sV4K\�l�	4��\�ƫ�a3�ď�\�\�\�\Zw/�\\Z���\�\�ŀ�VH��!eܠ�.O$���j��(Y\�.\�7o�n�ˌ`\�؏�1�Hͯ\�\�\��n#r�?\0j;\�e�\�eP?t�T\����\0\�c׮[\�z}żӣ\���\��78\��\�9���\0\����\��\0\�\�K7�\�h\�4!�\r@H�\0�b�ʎ\�n�Pߝ~/5ɒ�Ko-�A9�F[9���}�\0\���\�7\��+if��\�j\�++ܸXȕ\�$�1\�\�X\�wC��2WC?e�\�-Cep.�V\��\�S�t��(�\r��)I�隫;\\�Lۚo��5�\�\�\�+=@|����Ni1�3V��\\g�5\�\r&\�\�M2n\�LuU\�X�2\���?��j\�>�U\�\�:\�\�\'�\0\�M\'+\�\�y6\����\�3Bw�}(�9�\�GA�y�]F�\0v2�:}H�B\�\�5\�X.�~9\�\�\�=y5\�\�l@�\�jZ�4\�n)��m��r*:Unh�Rn�\0�\�U<A�Ţh�R\�\�m#\��c�����\��\0�\�|�Q�\�y�\'ִ\�\�{l\�W2�(\�ǘ���>�\0��~թ�D�d60��\�\�{�(n\�;�\�brI\�B{b�\\�fI�\�kg���]nmKT���/%��,�;��$�I=I���md̘m��z\�:#)�t-Op\Z0�B�O\�Q��b:ƛ�/���n��\��\�܌��q\�Ͻ$��k]�y\�g\��kUb\�B�cS�pR?ǹ�\�c���9\�ڧ�\�|E���Ki��ܒ\�\�7\�\�\�A�\�\�L�RA\��{��4J\�dE\�c\�\")=0NGz6O\"������\�G\�\�7(\�n\�{v\�ɩF�d��Wj�g�s�\���=1����=OP�E�\�\�q�Y1e@����]\n\�\�pз!b\'<�;\Z\�\�G���>�EԖ;\�5%Wh\�==F)�~��i�\�!�����ۣ˯�r}A�\�@\�l���6\��񑓏z\�\��56��\�,eU\�Q�(\�\�.Ӝ�~i���?g\'�F0�{�W۸�{��h7����6\�2@�\�Oj�|�\�\�1��0���2\�+m w��+~��OԵ\�+{\�$\��\�2*0>n�\r`�֍�G]��9�b�\�q\�W!\�폹89��]�1\n$i�ȃH\�o;eݴ�	�\�ۖ\�\��L�\�����\�1{��\"�\� \�\�\�^�r�O\���\�(ê�����#<g=OҶ�hK\�fN�\��\"�\�\�s�\�\�ZW_\�:�K;@V2r\0鎾�NFYm�\�߸/i?w�\'�_\�֟hV\�\�I7�2ʪ!;�\�#�c�8\�kC&�ߴ��n\0\�sW4\��h����\"\\\�\�	�q�U?-\�|<mv\�Ѓ�\0\��i\��\��c�<\����ߑ:��?�L\�\� ~\�?m\�5�ѼU\��kmCTJ���*�Ц\������ҧ�ʿ�\0a/���1���IXZj*l\�U$\�\�n#8\�\��\n������\�^6�A�yh��g\�jF�\"��(���	ɢ�qLf\�\'Jm\�&\�M6�i�e#74���95�����\0�O�\0����T7L\r��\�\�jf���\�D��zt��\��[,3�ڊ\�_\��\�/OO�?Mz	���\�ם�\���\�\'�5\�����X�t��p:S�Ȧ����Qӕ�4\0\�֟��E\09\�\���\�}+�O�{�\�\�6��GƟ`��\�\�b�K#�8\�\0{\�����\���_�U�I��\�W�K�\�\�%��?\�c��\���T����\�\�Li+�b\�I a��\r\�\��\�/�\�^��Y�\�\0�\�X}?ή^\�\�ZJ\�ꀆe.v�>��ulVt�:zv��a�\�!���|�cv	�{ի:\�[��G$����<}qT��38ٍ��s\�_N��#k���\�̹\�-\�,�\�\\�\�\\،DiF\��0�WZ\\��/�?��\�`��\\D\�>\���[�೶>A��w�f���S�\�z.ɮᷚa\�����	\�S�_F���l>s\�\�Б�\�:^����ϒs\�M|�|mI��\��L>�-R\��\�>\0\�|q;uf�|�}�:����;C\�V-2\�/�[\�\'�v\�\�go,�\�r�U�o#\�Dq\�O\�?�q^W�\���-�\�~\"���?�\�t\�s$�#\�`\�A\���\0\�\�\�A\ZCkɐ\�\�\�Ӄ���\�6~��Wvr�WЏZЏOE�f\0�\�\�j�+Z\�sPOmO>\�>i: Q��2�d��\�ZrxF\�.\�H�`����\�Wq��F\�P*���`��+��*3�\�\�u\�V����\��]\�`\�+�:�W�x��r���\�2X�\�e\�\�\0��`�^���\�9\�3֠�N�W\�\\��\�8����\�\r�S����\�sl�����\�BG͟N��\��i�O\�Mb\�M�F2[�C�x2($t�\�߉_\�մ��Stbt\��G+���_~\�گ���f��R\�\�\�Fw2��\�}8�s.\�\�r\�g��ai\�<�Z�cwq����@]\�x����ېy�\�n�i�6-� �F\�\�}�\�\�8\�\�5\�>�74�K�j�ٷٮ�\��RA2\r\�\�\�\�\�\�~\��\�\�?\�t�\�zN����2%w\�\0��U�S��J>\�p\��0N}+�\��\�\�[�[�s����\�\�\�%!\�&�\�\0\�\���k*�\�}}\�cޝ��4� +6i(��\Z\�\�6�(\0�\�C6\r2��[��\�5˺\'�S��>�3m��\�?\��\0�L�\�!�����?x\�D\�|�\���j+\06>\'��\�w;�\�נn\�z�ҳ\�ۻ��\03^���qV��\�~y5 \�r�J��z\n)�`9xj�7\�ڥIC\�@n�`\�q@g\�����\����\�WH��\�\�\��\�/�쮥v3d+dz��h-\�|��\0_�\�~���hE\�\�\�H\�6<\�H:PRi��,��G\�z���BO\�\�\0m\�pg�\�co��w \��ŀ}M[\�5=�V\�t̲�S��_β�\�R9�U�|���Ң\�b\r\�mJ%v\�jWs��\0J��\�F�!��O��\\\�2��q\�W\�\r4\�\�<]ek\"gϕF\�xPs��W\�7.-C�h\�	h\�\��k\�͛ID��ho3\�t{�ɽ�bA<���\�\�̏\'��<g5Z��\�=*uu�_=z`�\�\�3\�\�*�ʀv{\�\�ZV\'ny\�\�Y��@�ⴠ� c�zR\�/��Z�ف����9<{\Z�\�h�\�\�c�\�Z	����2������\�\�\�\�\�ǩ���ȼ\r\�٩a�՜�\�\0{|�#O+�Va\�\�J�$6\\q\�5<r#p\�Ԛ\�74vw�n�����Sx\�H���]Y\�.-\�<�23\�\�\�A\�a�\�\�,�*N8\�9\���tK�\0�[�\�`wk]EX\���\�\�t��k\�ˤ�K3\�\�b\�-:��I��\�$\��\n��\�7`��<\�h\�>\�F��5$���&J��tǧS_L�\��2m6ծ%\0\��\�`��23\�_�\��K[���\�\�{uk`�\�\�\�X���\�M#�ù\�s�L\�5�H&�Q27m\��秷Z�T�\0�Xx�|\'�f��E���\�V\Z����u1\�K�\������	氨��i�}F�z���桷�ͷF�Py\��\��D�\�\'�M\�Rg	\�#79Ȧ\��\�ZP��8�e}\�\0V�VB�\�?/���|g\�F=�dcje+��G�6\���\�\�l~tTz�2\�w\0+J\� u\�\�X���&]n�p��|\Z�$}��\��\0	\�ַv;,?�Mw\�6\�խ��$�\��\�h��(\���!ߝ\np{џqF}\�\0=f\�\�\��j��	\�q@	\�_�\0�ktYO\��aylH�%�A�\0k��k\�5ny<W\�?�Y8�\�\�W��d��u�VU9\��\�L\�}D�Qmf\�~Q�¨[\'�ǧw֝qw\�F�h\�s\�U\��\\�z\�E\���\0\�x�J�?�ܸ��ۭ~�x�D�L7\�P�</>��\�7\�9|K�Nk\�#}��\�#�b=+럈_�߄\�7d\�8�+`�o��:t��̯*��\�\�MF�1\�^ �M�|\�#Q��FO\�P[x�-E�\�:mng$\�ƞ6����ܴ���lA��s\�\�v�����\�\�ڳ\�#�s\�@X��;\�KA��x-\��\�\�Kaϰ\�ڱ��\�\�,k�(��~!\�v��C���A\��WK�x�	\�Cy�^�ڿ>��\0bψ>�7H�S\�2�uy��2>\�\�Z�\0ď<*b\�m�\�\�^\�Y,�\�\�Nv\��#�kR�(��\\ΝJ�~�O\�k�/�n���\�ROl.{�Ƽ�\�7�\�Z\�8\�{�1�\��|�\�O_ʽ5u_��3\��U\�c���5\�I\�ި\�$*\�\�P=k����w�]:M�Iwq�����<\�!s�98�\�揌��\0���6+mOhf�L�\�C��G\�\�,p:v5p�w�2���>��\�\��\�,��\�\n���F�\�\�\�,1Г�\n�\n����\�\�:���ٜ\�.ofCG\�s�On���\�Ë�2\�\�WE\Z�\�$J?���y\�֒���\�\�$���\�\�\�\�\�dc�z�?��\0l~6xQt�\�\�s	m\�C��~~\\�\0p\�Z��\0�\�\�*�e\��\0l鋫Xgd�l\n��/\�ϧc^\���\0\�&��9#�L[򮻈�\�P��\0z\�=L<\�\�L\�\"�X�3��\\\�n�9�\�a{��\�G�\0�+aǸ��\�3��x&���\��u��~*��5t]B<�8�;�g�+ċ����\�z��\���-^�$\�,ُ�2�\�s\�v\�~��\0�\�\���n%Y3�(q�\'�C�\�䜶B�@\����\0U�#�\0w\�\�G\�s��j:�Ʉ�\�P\�$h\��\�Br\n��ڟu���qJN+0\�Zc��f⛜\� �J�\0)��mnOZc>OZ`(���o\�F}\����������\����l��]DgP���h\�Ίf�n�\0ڗ8-�5�Ϲ��W\�\Z�Ay��#?�zy�\0¡�^�\���1]��군=ť_�>��S`s\�Fy\�P\�Um��\0��N��p\�C��\0_ʀװ�#��>\���l�^�kl�Z��e\�ؐ�9�aٌwȯ[�S��m\�\��\�[\�\�\�\�ފ�&��*1��\�kzT�V�qg*���\�Uu;X~\Z\�l3rǏC_B~\�\Z��|k׼O\�{k\�M;Y\�&�X\�\0��\�,\�\��sc=�\�J��\�	]�W��\0�w&��hNPf\�(N�\�*+h~\�?\�\�\�\n\��\����7ډ\�!6 U\�\�\��\�\�	n~&k��j�Z[�R1ɔ�\�\�\����ះ#�\�t��V\�\�4#\�\"�\�Ե��;C!\�\nz\n�j\�[�\�\��8zj4\�bq�\Z�\r\�\�^ˍ2\�\��/\�\����\0*\�\�O��2�α�i�8!�\0`\�f�g�\��S\��G���Z���)R�;��	<��u\��]��-|A�\�\��B\�Q\�\�&�˼K\�QgiՋ\�\�	�`�?�Zt\�9�Ԟ��jʜ}\�]�b\��\�\�\�\�\�ŧ\��e\��I\�=N1Zw\Zu��i����<\����\0�z�+\�\�q�Y�@�\�|{�%݄He���G�fxY#�0\�\�+\�~\�Z���a�\�j�\�\�\���3\�3Y�\�˫�I\�=H⢽\�\��\�\�I\�>�lt\�N��^)P�[�\0`]��`\�\�y�syc#��X~\�\���+�\��?��ʻs�;\�0���Ji�ϼ}�&��y����:HN\�\��V~���\�M�Y<���/�`�z\�C�\�fԝH+�\�\�\��f\�\r��i�\�~l Xķ7�	�\�RFR\�@�\0Vq��\�\�	%�\�h\Z����io\���g�z\�\��\�;_�O�Ai{�C��>ޝ8���i�:��>!�\�}�\�i�efb�\�ʰ*\0u Gz\�e�\Zύ�+�\�\�:[\�v\�4���@%�.\�2�rȠ\�2z\Z�������\�6�*󲆞�Ѻ�\���\�\�[�t;S�\0qV�\�4��וo\ZF��)D\0㎂�c\�/\�_\�=7\�\��-����\�\�H�z�9���4\�j-Z\�CÀ�\�\�V��2���Q�\��g\�N�\��\�db[Y�uR��ď¾^�\�\�rzc�ҿC?i�	E\�߄�Ŝ��H\Zh��\��\�_�:u�節�Q<�(� �g9\�\�^\�]8�;v<SO��`-\�\�q��8=��:���\0�mx>\����_�moQ�i\�d.\�RH�\�#���\�\�7�?fmK��G�\�j>jL�Xɏ&<\�\�\�N\�\�\�W\�Í>\�M�N����1Y¶\��\0xF#A�\�+xb!Q\�\'6\'R�b\�-\�\�\\�I�BG�t�\�r\nx�;\���\�Ns��\�mǽ\n=�N�m���m\�Z\0\�{\nM\���Ι\�{~�\�4Wl/���ޒ��q����c�\\ծ�:L\��4U}l훾?\��\0\�F�\�_\�l��As��\0,���8�6�B?\�mf\��\�r+\�7�QV�)��\�+qL\�ii�IE3q��@D�W�\�N�G�\�QQ@�\�q^m�W\�`�#�&y��`\�~�f\0�ʽ!xAӥy�\�g�ͬ|\'��T��иQ�����\'�N\�V	Eׂ�\�?;�\0i�O\�e�pG\�-�A1�m�\�\���\�Ş\�\�\�Zu�ҕu�8oc_�:ތ5y㶔G$s[�d��w`m9\�|q�\���_�@i\�β��^)<��\��\�ݍy�ekE\�g\�\�X^w\Zݏ�t@%��\�\0gֵ�\0�\�2oS\� U:\�ٲ)2~�\�i�\�t�\�\�Mj][c�\��\�\�\�dX�$�Q\��\nXH<�1���w�ن?0�*٧��\�\�\�\�\�y\�ǅ\Z\�|����\�5��Y��\�\�\�`c�twV\�8!c��ֳ��\�\�\�7vZ(\�h<��{�\�\�\�6��޹��Q\Z\�G$(��\�f\�\�\�ּ��\�}*yYf6�jF�\'\\\�˚|\�\�wc \'t�0\��\���U��Z)ć*��U\��\�\�9�\�B�N\�r��~��ɽՉ\'q\�z�	A|�\�@]B�\�O�w\�L�K��T�\�K6�D6��Jۘɻ\r�\�[K����ڹ\0\�\�o\�h�\�\�v(\�+y,<�\��S\'�Q2piy�)$�?\�:Cj~��?\�<D���q�\��|i�\�B�\�?j��\�O�_�R\�c%U$p�A�+\�\�έcp\0\�\�x�\���9�\�ڟS�\�#7\rsrI\��t%~�p\�ף���9X�\�:��=\�\�\�&\�\'�o�\�1C\'s�\���~�xx,\Z%���,H\0�E|+���3�<Z\\��\\�n \�\0s\�\�5��y0*�+�,�m�!�j�z�����w\�M\�;\n7违{ğ\�z3\�(ǰ�\'�\0��\�\�iw�:�\�\�F?J:\\\�I�SD�����\�\�qM-��BsS>\�y~�m^\�w\��Ѣ�k0gW��O�\��\0Ѝ��[\�\Z�\�;������Z�-\"��\�66}����z%Z\�O`�֤I�\n�ԈW�9�fK@84�斀&�Qӕ�\�5K\�:%\�nlnŴ\�&��8\�#׵\\\r�eN:\�\�\�\�Ӻ>��\�\�~�C��}ۭf�w\r��8ea�\\~��/\�\�x\�Sw�\�\��	�f��\�?�~�~\�_\�?�ơamCNWw]\��b\�X�L�\���a�#�7Z܉ɌI\r\�̟�\�Q\�x\�W\�գ*�ݏ�\�\�\�\�Y\�i��[E&\���w\�\�mX]�T��4\����~����>H�Nѻ�\�u���|��N<\�U�R1\�\�\�:x\�L��T�9\�3Y�\�<\�v��ܢ��\n\�\�4\�*x�?Z\��w|\�,#b�yN\��5٤ȁy��5\�x\�\�a�e�I\\��\�業4Tm\�\��\�\�m\�K��\�A�k0�5	\�:W��s��|%�A�m5�@\�_]\�HaKw��y;G�޺|^�\�4h�\�\�K�n#�;v�\�\�qI&��t-]�\�\�Ryr!\�\'Q\�X\�It�ϱ��\0.BYY�{f�\�\�\'\�y\�_�^&�\�[Ԟ٥=V\�\��\��5\�~#��Ѣ���e�\�)S��\��5|�\�VG^���JI uf\�\�\\B�:�*��.؏֕�\�\�۳)\�9<�\�\�\�T��Է\�=H\�V\\\�\�;�\�1\�*k2��#\�R*�o\�/C3�F�f\r��泅6\�hݖ9��o\�\�X���B瞙\�k\�>\n\�^\�fk[8ʽԜ�\�ff/�\n}\��/\�]wq�h�9�[\�\�[#\�_؋�R^\�w�\�˸[#[�+\�G�$�x�k鼑\���3\��\�\��]\�Km7!���\�z4�\�ߠP>��\�\�\�׹��\�\�Qg\�c�ڳ�6s\�&��Zn�\�i+�\�\��\��\�]�\ZBqI�Ri	��p��F�+�J(<\nM�\0��%\��\�D��\�Y���\�5���\�?�\��\0�����uk�?\��\03EefjP�I6�\0]t\�~��}y\�\�?�\�ן�\����Um\�Ka=��ɥ\�i��L̐|�����N\"�%i��PR�+@��K���F\�\��\�\�L\�!�\�Ӂ\�\���k\��\0��6�c\�N\�K\�$�\�\�\\\���=\��l$�O�J����\��5�J*j\�\�\�b\�Pw��\�\�oj~��\Z.�a6�}�\�kyq�]\�`���\�\�\�+��\����\�:>�Q,hd��e\\3g	 s�ּ6\�_-�k\�\�\�p��sY\�<\�ݷ}��^�n��\�\�Ee\�w����kҲ\��FI\�p=\�^*\�\�Qa�o�ܶP��\��@\�ω`�E�\�<J��G\���\�B~+?�~mJV�\���\�\�\�Cer��\�G\�q<�h\�\�w�J����q�`�Oo\�\���\�;3o\�[\�5�`	�OJ�ۏ6R�wglU\�O+�$7���\�c�1\�M>�\�\�\�s\�\"�>��\�M:\�RH�m��,�[H#�\0\Z�F�\��\�\�l\�9Xmׁ׌t�J\�յx.�n��2zg\0�X�\�j\�O�r�;��.\�\�M�6֞Y�˛�\�g���[I�<��-��]�\�Z\�\�o\��*�[�\�\\��G|��+ml�vՉ/\�\�NI|\�=O֪;�Q�X\��Dm{\��\�\�?4\�UP@\�O��@���\0gK�h����\�=���~�\��\�\�\� {�b��𭿍�)iz}\�m�f��L�0�nP}�Wؖp\��QAo\ZCJ#Q��v\�a()\�]��\�\�\�	rA\�YQ�u4������+\�\�c\���\��SKA8�Ȥ���֑�\'\�b�ED́��Oi\"�$sI��4�M5\�\����\�ɢ��h&�Go�@qZ�\�U��\0���\�>�l�j���Z+S\�/$����\�W�g\�?\�\�\�;�h��E\�*V\�{���\�3u(ni��Q�n�)CPթ\�lS�\�GZh~y�\�(H�\�r~��(9[u8gހ9/���,֭#�͜[4Ш<�\�Q��_E!�Bmu;YH\�GW\�m��\�b�C��>7ßKz�\Zv�+\�ۅ�C˦~�#\�ָ1�\�e\��2꼲\�}NYn���\�\r,�����\�P�Lg�K�/\\���\�O��\�K�ߕUF+\����{\�\�\��\�Mm�\�pOD�5�z<\�\�&q�\���M_\��Wv�$�V�Hv\�\"��Ȥ�gT\"�\�\�t�\0�\�x�\�G�K\�\�\�\"�c�t�H�m�o<\�\�����Gm\�@־�����(D+�M�\�Z2x�G�B��Á���\�h�w/f��9x�B5+iz]\�q�v\�#=z�g\��\�oߧ��ڬ��BO^W��A�\�z|\�\�m\r��O\'�\�\�K\�H!�3uP�}�t]U嶄\�O��\�O/˔\�\�\����\�r\�\�=;\�Zi\�\�\�<�Q��\�\�W��Ì�\�|\��-H���=�QO&G\rǥQ}P3pW�\�:�\���|�%��\0��mO]�:\�ǿ~Ş�mCY՚=\�JZ\��\��Y��e�}�j\��/�#\�\�\�;�s\"�\�A\��\�U\�\�\�\Z\�7W\�ai�pH�,D��6M#\�\�?ڙ�\�f�.I\�\�)�)��\�(�Roo\0�7\nil\�P�\n7\ne&\�@f\�9�\�)�h\�p0o#\�w/\�\�EM2+p\�M��\�|%�/H\��#���%píy��\�\'ķ�=a\�ב^��\��T��\"Z\�DK\�=[+\�32O0�i�\�TY�\�%(b�\�n)A\�\0HE-G�7P��\�\�Qn�\�\�Z�\�D�U�+;\�\ZM=�\�6ܕ\�A���=¹o�z`־��߃\�i�\0\�\����SL֓jh�&\�U\�.�\�9�\�o��A%zZ\��\�%�\��G#�~�_A�\�K�Vh\�z�+\�\�}��+hz]�	\"\�\�ҖX3������\�V�a۞�ջa�<�k�S�=J�iqH�\�=rFj��b\�X���\�]-��S�/^x�\�\�G�\�\�Ws���T:4���Q�\����\� b�5�\�4�q�\�N��\0\�s\����\�t1�\0��lUh�hz�\�\�Wo�R\�\�\��y\�\\��Y���\�*m�j��8\�W>jR�<�L���8�u�\�\��Ų\�\�f���\��s�j\��>\�ar&wŴ�<�vQ�g*:3�z#�\��P\�N�ۣ����O\�+\�c���Q\�?̦��M[���EG��\����u�\�e8���\�ٰi�g4�\��	\�&\�K\�LJO={\�Mt\�O_Z+S\�����\�\��b�6\�\�W��\"|��\�zC\��\�\"�l\'�6y\�?:B�=�\0:�[kf�\�{~�\�ǧ\�COnn���ZU�st�h}�ҫ\��\�^	�\0X\�}(\�sQy�\�ӑ�M\0I�Q���(��T׭�ۣ]E�\�l.���G���v�H�\�LqѦ~jj�\"wm zW\�\�\Z_��˃\�u�P\�m>ͩ\\\�Ø��2=0Ʊ�mg�\�3����\�G\�a���;�\�\�o-Ev&\��b\0\�\�z��\�k]N\�L3\�\�\�\�<�^C\�_��Nހ\�\�+-OS�����C1���\0\�T\�I���\�\�j\�E)�{\r>\�\�xqO���\�ׂZ|{�\��\0\�C\"�F%�?�Y�\0����\�1�w\�j\�=\�\�ff\�\�\�D���\�\��{W�\��G[4�;��~��ڇ\�Y/�K+k�f\��i=Ǧx\�\�,\ZU�n�\"\��}+\�/u{\�]m]�ûw\�>�g\�i׾\"�In�f\\��$\�i\��+D@�{\�\�.xcD[X�ٴ���\�M�\"��>\�ֳ4����Ҷ�%��T�\�MX��>\��S\��\'\�\�\"\���P��?+l�t;\�~5���\��\0Ɵ��\�\�_<]p�]�c\�ЌQ\�\�G\��@\�I\�u�/\�3�C�\�x\�\�ÿ�\�c�\�d�}A-�Mrʻ\�\0\�r\��}�_[��A%��<\�M\�h~�\�֐�UK]R�h淙.`�CE,l$g ��|\�+�\�\�\�I��U|��ͥPh�$/\������\�>��q�\�?4�\�\��P���-G\�zF��\��P���\�\�\�\�Jvh|\��\0	����6\��V&��|���/8\�\����uy�����\�2\�y\�\�+\�3����\�ճKQ��K����\�3\�\�o�\0I���7�SLdӇ4\0\�|7&�\�\�~U(\'(��\0�\�\�j�y}�i,�\�0��\�w`��u$�����n\��+ޝ�\�\�<1�\�\���g\n�\��\�\�Z�U\0\�����\���J��f}u�����\��\0��\�j�؏,�P*��\�0�;䎸��ƿ�*/��i�O\�υ8�֋N��O��lF\�\"\�]�209�Ͽ\Z|Z\�|s�=櫪\�j��i.n�2I+1\�9\�\�9\�z��s�A�\�\Z_�\�mMy���M+\�\�;%uA��P+�W\�Q\�]N\�W���٥ȁc�\�\0�\�X�Ԛ\�x<\�\���\�xj\�\�<ノ{WO\�1\�=k\�˙\��8G�*&��fa�(9=+��\�\�H9\�\�^�����B���[X\�J?<�\�Z\"�Q�8��7�w�گZ|%Ӯm\�\��a�\rk=��q�\��\�φ.�wh��`�u�T�(\� �#a���kpĒX��j\�>�\�\�ϔ��\�\�ȯLԑ$�\�v湩\�\������\�,İ�6v�3��ni\�ۜ|�T0\�\��p���.ȶ~f�\�RI{N�؜\��\�\�\�\��\��V����\0O\'\�\�~�(U>��r���ܶI9\�\�^Y�Y|�ƾ�Ė�z\�O\��<J2\�޼c��W�Z���٭�7�\�\n�\�۲�M��;}|�\0�J�8���p9�\�85#促_���\�$>�6��ڨ �o݌�g�۵}\���\\tψf\�ß��M�\�\�mm�[@E�\�Tm-\�crx?.\�{\n��\�\�r3�\rh\���\�n\�|�!Q�s�F\n�_p|?)�\�z�P��ɽCS�Acڦ����~*�\�\��QO�\�(,��B={D\0\�uYd+l7V#�`s\��7���,?�� \�ƾ(���\���{�e\��j�g�����r�\�$|7^)�h��+��G\�}\�N���\�\�~�g*��Z\\,\�ruƶ\�4Ӹ�%�G�\�G�\��\�E�3\�\0N��q���I���+\��(\�\�K��J�\�����u\�{\0\�\��A\�j*D\\ \�Ҋ�S\�~�|Iw\��\�\n\�k̾3\�n9>FO��+\��ȩ[\nC�\�<\�m\�\�y�ɦњ\0��\�{�/\�^8Ҿ�~}SZ\�m4\�>\�K��3,H��b2x<w�Ql\r7�\�y�\�#�[x3�`�m\�\�R\�\�mai\"ӡ�\r\�\�����\�\�w��m/�,N�\�h/4��.�`,��ҡ�\�`�X�*p3�D\�\�|\r\�\�x�R�^�qusq1i�琼�RL�:/���l��\0l?�*�i�\�\�S��g���N��5\�\��\�����#�j�j\�\\�\�\�Ĵ�\�\�\�r\�VU\�\�\�1%\�\�\���F>A���BUWA\�b����a?��3�\�\�I�˹T�;%fn�Ǐƾ<.P�\0?j\��\0f_�o�⍥�,ge��\��f�\�\�a�uiYt;2\�_��\��zr\�ֺ��v\'9\�Z͈�r��a.c��\�H\�PD�AV\�\�G}+sN��\"\�^=k\�e��\�#n\�e�1T�K$�\\?*�\�FI��f�~`x9Qm�ʓEX\�q\��\�)n|1�\�\�!n��\0N�b�\�>\�Zix�Çg�j�0-��\�O.G,��<\n�4֍7/\�Oz\�xbp�;�\�h�\�-\�\�=��r����ˎ1\�Z�r\�\�\����\r\�ڥ\��\�Z�|��\�����Z\�Cjrs\\\�zdr3\�V\�n^l��\n̝?=\�;\�B/�\�Y���\�\�\�?�P�k࿄�z%��\0�벟1A��wBH�a\�R-\�{�\�E�4�;P3�_�\�\��\�p|^\�/џ\�\��{4c��&\����5ߔ\�J\�\�dy��%S�ʷg��d\�ʬ\�GE��\�F���p[?�A\���I�\�z�n\nn!�6�Z���,\�by�;2v+9\�Ԩ\���\�O�kM�\0/�����ǯSTQ|\��\�9$���x�\�F�9\�r��/ˡ�\�\�\��\0�\0j_�\�^!���ֹ{e\�N\�=�\�\��vH\�W\�\�#�j�3���\0\�^	��g��L��$Q��=BtKk�<���py\�{W\�,W\�Y<�[\�\�q�PpG���\�h\�\����\�g�H\�\����.\�b�Bzv��d.-n!���\�p\���z\�\��\�\�{ſ��n�7�\�:Z\�\�tyYb`�����}��0�\0�`\��C$\Zo��V\�f\��Zѿw\��c\�\��A<\�5ԞV���\�z��\��ߊ4\�i1_\�W����\�+�yVH�r��\Z\�S\�үru$o\�IB\�};\�\�q\�\�JK�\�\�T�\�=(�\�^=8\�Edhy\'�\�ǉ\�?\�\��\0f\�\"b��y�\� \���粴?�\"�*�lC}�\�ڏ<�S)c=N=Q$�y��\�Wŝ\��\0��\�<I�[\�Z|\'iA �\�\0$\�ȿ����M�{/�<��\�?\�\0��2\�\��\�R\�\�y1��\�n\�W\�_\�\� �\�\�Y5�\�\���̤2�\��G訌H\0g�h�ܖ\�~�||�\0�\�h\�Vӧ\�\�6kōJKR��\�\r��-7\�l�FGq��K�����k�HkF\�\�ڳ��1kkhaDT\�9\�>��\�:��^�m\�D�/?,~�Vl\�\�I$��5���\�4e�d\�ݍ�\�Y�3U\�|C,�䍹�5J Z@~�n\�Á�<z�[m�VL\�\�J���\��c�����֢&o�1�?J�\�~�\�iۂ�I\�ڙ,�\���\�Ƶg\���\0\�7\�M���\�����\��[c\�%�\�}O���\�_c�_�q\\5�\�\�n��8���e/\�b-m�\����vi��\�u\�s2\�]\�ZK\�}>]�\�{*�\�}l\��\�ҧ�f,7\�۞\�\�\Z\�\�]ӣ����\�\�e�\�\�Ձ\���Ӛ=�>�=+�\�\�vgЩ�����A+9>�I�dN���m\��L�f�\�\�(\�.U\r,r�R�r\\I׵R�8<zZ�\�2�x�E�&\�C;\n�+��i4�fH�i\r��WX�\�J\�r����n1V4�\�.W<�\�\�֗�ri�\�,\�c�9i$!~��?\Z������m4k+��\�A<\�\�Ga��!�1Ǡ��]Xz�.Trbq0��)�\��\0�\�PY\�\�\�dYn�*�\�`\��\�T\�M�}�\�W7�jRI4�$��Y\�q9\�$�i�t�un��}^\ZP�>W]՛ob\�l�nH\��\�\�T\�� Uboaǥ8r�\�r?\�\�]IX\�$�\�i\�3S\"���\��\�\�?&29�\����gY�xS��̓��\��)6��a�t8\�6\�5p[�4\�\�%Q\�\�H������Mܳ�@v#N\�@,q\�\�棴�\�X\��fL\0Ǐ����?�I�\�m���\��\�\�3�HԽa4\�2����<ݞ1��篽kZ]M�\�h�W)j�n��+�g�\��=\�K� f,�\�\�F��U�1�s�5s\��.��9$E9 \0\�\�\���\�hh��ߵ�~\�m^�\�\�2�%Ex^B2.03\�q��}\��(�\0�X4�zJYx鿱u�ڒ]\�6w-�\�\�C�p@\�_���\�j6\�4�l��\"\n\�98\��^�mf{�L&]ʻe(\�<\�\�8#\�\�<t�n֥\�\�\�\r_�������\�$,���\�G/�\��W\�\��\�\�\�\���t\�U\�.\�,\�VkIԙ9h�\�9\�\���A�!�\�~����a~֚��*���\���\�?4N@\r�[\�#\�\�ufK�>�{�.ry\�84Q�#��p\�S\�I\�/̾.�6\�n\�\�W�\��o�\�\"�\�fB@0�\�nV��\0k_\�\�\�_����j2�\�cW�\�\�\0\�\�9\�\��5Q�2��g�x�Ķ\�f�\�/-�l����O(�GRI5�\��\0�\0��k\�\��\'\�}�\�	�\�rL\�E�-\�$�$� !�с\�#\�\���\n\�O\�{W+�\\\�c�&��\�\�=�W9��{r\�5�\�֠f݆1���~ܑ]Q�J¿sGSמ[\�L���C��\�ɻ�\'�t\�Y�L�+�>UFoӵV\r\�?�;�֮\�m�Iv�\�7v\�1�Zj��\�\�Գ�!o\���\�\���N�\0�>\���_�k$O\�o��dJl\���Z��D�j@�j;@5\"�e\�@+���s\����1\�\�wn��=�x\�\�A���\�\�ea\�;�\�0��\�+[�Î\�&�j]\�D�%�Vx�\�Ρص��/�l\�m�\�;��;���\��3\�^6ë\�\\h��Uy|�$ǎ��?\Z�\"\���z\�EX�輌W#/�WV�;�ٍjZ\'��\�\�\�\�>1�i�Ƒz��y\�FO\�ȧ\�\�.���\�m\�\�~M\�\� �\�T�3�~\�ֺ����g��O�k7q\�\0חS$�\�#ק���4~�_\�&Kt;~n=r*换1##��ͧ�\�\�Ј�Cp\��\Z����\����|B�.�ۧByU�YaϹo:�m?M�I�\�ɨ\�V(�%��T\�\�k\�~!�\���pd[#/�.\�\�lʱ+\�N>��=\�|a{�I�k�d~ōU3\�s��\�\�꥓F.�w8j\�ӗ��{_\�\�cş�\�\�\�i�[`[wڇ\�oƼvk�8\�\'�\�\'�MTI�c\�y#ݰ/Ƿ�zС/p�ՕMf\�M\�\�R�#�\�\�(\�Q\0\�\�b��\"�Zu�pI�~�#-ӌ�1\�Ӛm��$\�\�P#�ꤱ?�O�\�\� E0-n؅_w\\��I72y[�H n}��0\�\��o7H�\�\�\��o\�P\�\�ksR��C\\\�\�I���\�+\�C\�=F8\��r\�\�L�cq1�\���(b�\�Z-\�ŧʟ+�v�F<q\�s\�W\�NƂC�\�ۘ�\�*eq�8\�Q\�\'ڤ\�,�̕v�q��+\�\�c䞸\�<s\�\�\\��I\"kvQ7\�ƨ2p\0\�sӿ�J\�6���x<�\�z��\��\�Y�&kx\�g\n�\�#h\���^��2�\Z-\�@\�\�]�+y-\"��\�O�\0t ��Ex�\�+;�;��\�lɐ�\�\��N�O�*K}0���\�\�,\0o^���&o�Y\��\�4�\�\n�\'�s۟β,He�~\�\�b�Rg�\�A�Y\�N3\��u�g�/�x׺u��wvϼ�YWg\r(W\�]r\n��с\��\0I�\�!/e�~26>]\�ԑ\�z\�\�.�\0R\� a�7�\�*���\0�\�8\�\03YTW\�ږ��[[�\0�A�,iV\�k�q,6\�\"�\�\�ciW�X\�\���{\�_:C\�]>(���ٶ�<\�\��\�\��\�1\�ErZ]\�\�s���\�\��W\�\�x��E��\�e�OI3�[��\�^9\��W\�\�\�?�z\�ď\\\�\�\�u�jw�g����\0w�~�\��N�\Z\�\�w\�=_J��\0Us\�b���\�Á\��!o,�W�Bͻˑ�8\�q޽,4�\��j\�:�\�\�e��O֘>b}�Y-��2x4\�c�\�_Һ�v\�\�j1SҤ5=�Q\�f�D�RY\�XqN�w�r@\�T\�n\n\�Җ\�\�g���\�_\��\�M�\�\�\�\��%�<\�J[��2z\�Z+�\�\�\"�f\�*ǻ�J|q|���J��WD#\rLh��N��\�To��;\�ɭ����S\�DD�<\��+F\nԓ\�#U�$\�^٠\�F\�OnU��\��J�\��pߑ�\�/��\�FsL�r\�\�4�\�Fs\�T����\0�W,\�y5\Zes\�=(\�r}\�?\nr\��jI<dc��\�\�\�P{\�f^W�1\�4;$\���Xy��\0/Ojb h�\�5=��I:��*n~KT�6\�\�zr3\�ڤ�/\���x�@{�:Pd�,f�q\�\�m㨤�p?�=�ħ��Ԗp	#$�\�@\��#VV\�u=�4싙�de��3�J�nr	?QҘ\�\�\n��\�\�{diZI\�ځ#d39m\�L&?8�\�W\�\�\"�q�\�F}��GKa,{\�+�Nq�~�t�!�C(t�B�\�io\�\�ۚ��Av9o]\�@��J�yo5��$ޭ�]L�\���z�}\�6i<�#��{�t\�N�}\�\�SMy�$\� \\��>m���?΁�植}x��^O��c\�\�9\�I\�\�Ҵ\Z�\��~%�F�#\��6VA�\�?7�\�j�\�$ͺ�1H]��\�~o��\�=j׈�9-o�X��k0e\nޫ!\�\�\��\�X\�sk\�D\�\��`��_i�\��\0[�$�\�\��ڵ5�\�9\���{iI&(�\�\��iw\��v\'�\�ϿMk��\0uS��s�\�L���nx7\�1x�\�q\�H\�J@�@᳿?J\�m$Rmlw�N��j\ZU��\�zSE4I\"y*@#�\�J+\�|\�\�Zx66lE�`���\�\�(�S�\��\�','V9C0CWFUTW','L-Aral','Academic',NULL,NULL,NULL,NULL,NULL,NULL,'2019-01-29 17:35:02','dsadsa',1,1,1,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,'Suggestion','Suggestion','Comment','Comment','Suggestion',100,'No more program head'),(26,'College of Computer Studies (CCS)','Information Technology (IT)','2019-02-07','Edit SE Testing','unitrep ccsit','Interdisciplinary Fora',1,1,4,0,NULL,'2019-02-27',50000,'adsadsa','dsads','adada','dsad','421321','dsad','sadsadsa','dsadsadsa',NULL,'OVPLM',27,5,12,5,5,5,5,55,1,'change kras','2019-02-07 17:20:59',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,85,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Academic',NULL,NULL,NULL,NULL,NULL,NULL,'2019-02-07 19:52:42','dsadsa',NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
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
