CREATE DATABASE  IF NOT EXISTS `omedico` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `omedico`;
-- MySQL dump 10.13  Distrib 5.5.53, for debian-linux-gnu (x86_64)
--
-- Host: 127.0.0.1    Database: omedico
-- ------------------------------------------------------
-- Server version	5.5.53-0ubuntu0.12.04.1

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
-- Table structure for table `common`
--

DROP TABLE IF EXISTS `common`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `common` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `defaultSearchBy` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `common`
--

LOCK TABLES `common` WRITE;
/*!40000 ALTER TABLE `common` DISABLE KEYS */;
INSERT INTO `common` VALUES (1,'PROFILE');
/*!40000 ALTER TABLE `common` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `complain`
--

DROP TABLE IF EXISTS `complain`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `complain` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `description` varchar(45) DEFAULT NULL,
  `medicalSectionId` int(11) DEFAULT NULL,
  `signed` bit(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_complain_1_idx` (`medicalSectionId`),
  CONSTRAINT `fk_complain_1` FOREIGN KEY (`medicalSectionId`) REFERENCES `medical_section` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `complain`
--

LOCK TABLES `complain` WRITE;
/*!40000 ALTER TABLE `complain` DISABLE KEYS */;
INSERT INTO `complain` VALUES (1,'OBird Complain1','WEWE',1,'\0'),(2,'OBird Complain2','fdsfdsf',1,'\0'),(3,'OBird Complain3','dsd',1,'\0'),(4,'OBird Complain4','fdsfdsf',2,'');
/*!40000 ALTER TABLE `complain` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `diagnosis`
--

DROP TABLE IF EXISTS `diagnosis`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `diagnosis` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `description` varchar(100) DEFAULT NULL,
  `level` varchar(45) DEFAULT NULL,
  `medicalSectionId` int(11) DEFAULT NULL,
  `signed` bit(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_diagnosis_1_idx` (`medicalSectionId`),
  CONSTRAINT `fk_diagnosis_1` FOREIGN KEY (`medicalSectionId`) REFERENCES `medical_section` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `diagnosis`
--

LOCK TABLES `diagnosis` WRITE;
/*!40000 ALTER TABLE `diagnosis` DISABLE KEYS */;
INSERT INTO `diagnosis` VALUES (1,'UnSigned Diagnosis','12','121',1,'\0'),(2,'UnSigned Diagnosis','fgsd','23',2,'\0'),(3,'Signed Diagnosis','dsdasdsa','11',1,''),(4,'UnSigned Diagnosis','asdasdasdas','21',1,'\0'),(5,'Welcome Diagnosis','fasdfdasf','23',1,'\0'),(6,'khaled1','dafdsfsdf','223',1,'\0'),(7,'khaled2','ewrdfsdf','12',1,'\0'),(8,'khaled3','fsdfaf','23',1,'\0'),(9,'khaled4','fdsafdf','22',1,'\0'),(10,'khaled5','fsadfdsf','2',1,'\0'),(11,'khaled6','fafsdf','23',1,'\0'),(12,'khaled7','fsdasdf','22',1,'\0');
/*!40000 ALTER TABLE `diagnosis` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `examine_type`
--

DROP TABLE IF EXISTS `examine_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `examine_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nameAr` varchar(45) DEFAULT NULL,
  `nameEn` varchar(45) DEFAULT NULL,
  `description` varchar(100) DEFAULT NULL,
  `cost` float DEFAULT NULL,
  `estimatedPeriod` int(11) DEFAULT NULL,
  `isDeleted` bit(1) DEFAULT b'0',
  `isDefault` bit(1) DEFAULT b'0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `examine_type`
--

LOCK TABLES `examine_type` WRITE;
/*!40000 ALTER TABLE `examine_type` DISABLE KEYS */;
INSERT INTO `examine_type` VALUES (1,'«·ﬂ‘› «·⁄«œÌ','Examination','Examination',30,20,'\0','\0'),(2,'≈⁄«œ… «·ﬂ‘›','Re-Examine','Re-Examine',50,15,'\0','\0'),(19,' Õ·Ì· œ„','Blood Test','Blood Test',80,20,'\0','\0'),(20,'Œ«·œ','asdasd','asdasd',40,20,'\0','\0'),(31,'csdfgh','dsfdgdf','fdfdds',10,10,'\0',''),(33,'‰Ê⁄ ÃœÌœ','New Type',' New Type Examine',20,20,'\0','\0'),(34,'‰Ê⁄ ÃœÌœ','Another One','fdsafsdfsdfds',50,30,'\0','\0'),(35,'»Ì”»Ì»','Ì»Ì”»Ì”»','Ì”»Ì”»Ì”»',20,20,'','\0'),(36,'X-Ray','X-Ray','X-ray',100,20,'\0','\0');
/*!40000 ALTER TABLE `examine_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `extra_data`
--

DROP TABLE IF EXISTS `extra_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `extra_data` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `extra_data`
--

LOCK TABLES `extra_data` WRITE;
/*!40000 ALTER TABLE `extra_data` DISABLE KEYS */;
INSERT INTO `extra_data` VALUES (1,'Smoke','YesOrNo'),(2,'Height','Number'),(3,'Weight','Number'),(4,'Drink Cohol','YesOrNo');
/*!40000 ALTER TABLE `extra_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `insurance_company`
--

DROP TABLE IF EXISTS `insurance_company`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `insurance_company` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nameAr` varchar(100) DEFAULT NULL,
  `nameEn` varchar(100) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `joinDate` date DEFAULT NULL,
  `isDeleted` bit(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `insurance_company`
--

LOCK TABLES `insurance_company` WRITE;
/*!40000 ALTER TABLE `insurance_company` DISABLE KEYS */;
INSERT INTO `insurance_company` VALUES (1,'‘—ﬂ… √Ê„Ìœ','OMED','OMed Company for Inssurance',NULL,'\0'),(2,'‘—ﬂ… „Ìœ—«Ìœ','MedRight','MedRight Company for Insurrance',NULL,'\0'),(3,' gffhgfhfg','Arabian','Welcome to Arabian Company',NULL,'\0'),(4,'dadasdasdas','fdsfdsf','dsadsadsadasdasd',NULL,''),(9,'ÃœÌœ…','New One','New One Integration System',NULL,''),(10,'Dalia','Dalia','Dalia Company for Insurrance',NULL,''),(11,'Dalia',' Dalia Company','dalia Company',NULL,'');
/*!40000 ALTER TABLE `insurance_company` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `insurance_profile`
--

DROP TABLE IF EXISTS `insurance_profile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `insurance_profile` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `companyId` int(11) DEFAULT NULL,
  `examineTypeId` int(11) DEFAULT NULL,
  `percentage` float DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_insurance_profile_1_idx` (`examineTypeId`),
  KEY `fk_insurance_profile_2_idx` (`companyId`),
  CONSTRAINT `fk_insurance_profile_1` FOREIGN KEY (`examineTypeId`) REFERENCES `examine_type` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_insurance_profile_2` FOREIGN KEY (`companyId`) REFERENCES `insurance_company` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `insurance_profile`
--

LOCK TABLES `insurance_profile` WRITE;
/*!40000 ALTER TABLE `insurance_profile` DISABLE KEYS */;
INSERT INTO `insurance_profile` VALUES (46,9,1,40),(47,1,1,35),(49,2,1,50),(50,2,19,30),(53,10,1,85),(54,11,36,60),(55,11,1,50);
/*!40000 ALTER TABLE `insurance_profile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `insurance_section`
--

DROP TABLE IF EXISTS `insurance_section`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `insurance_section` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nameAr` varchar(100) DEFAULT NULL,
  `nameEn` varchar(100) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `isDeleted` bit(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `insurance_section`
--

LOCK TABLES `insurance_section` WRITE;
/*!40000 ALTER TABLE `insurance_section` DISABLE KEYS */;
/*!40000 ALTER TABLE `insurance_section` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `measurement`
--

DROP TABLE IF EXISTS `measurement`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `measurement` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `type` varchar(45) DEFAULT NULL,
  `deleted` bit(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `measurement`
--

LOCK TABLES `measurement` WRITE;
/*!40000 ALTER TABLE `measurement` DISABLE KEYS */;
INSERT INTO `measurement` VALUES (1,'Temperature','Human Temperature','NUM','\0'),(2,'Pressure','Human Pressure','STRING','\0'),(3,'Sugar','Human Sugar','NUM','\0'),(4,'Runtastic Heart Rate','Runtastic Heart Rate','STRING','\0');
/*!40000 ALTER TABLE `measurement` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `medical_section`
--

DROP TABLE IF EXISTS `medical_section`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `medical_section` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `description` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `medical_section`
--

LOCK TABLES `medical_section` WRITE;
/*!40000 ALTER TABLE `medical_section` DISABLE KEYS */;
INSERT INTO `medical_section` VALUES (1,'Digestive System','Stomis'),(2,'COCO ',NULL);
/*!40000 ALTER TABLE `medical_section` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `medication`
--

DROP TABLE IF EXISTS `medication`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `medication` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `medicationClassId` int(11) DEFAULT NULL,
  `signed` bit(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_medication_1_idx` (`medicationClassId`),
  CONSTRAINT `fk_medication_1` FOREIGN KEY (`medicationClassId`) REFERENCES `medication_class` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `medication`
--

LOCK TABLES `medication` WRITE;
/*!40000 ALTER TABLE `medication` DISABLE KEYS */;
INSERT INTO `medication` VALUES (1,'Sepro',1,'\0'),(2,'sadsdas',1,'\0'),(3,'sadasdas',1,'\0');
/*!40000 ALTER TABLE `medication` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `medication_class`
--

DROP TABLE IF EXISTS `medication_class`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `medication_class` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `medication_class`
--

LOCK TABLES `medication_class` WRITE;
/*!40000 ALTER TABLE `medication_class` DISABLE KEYS */;
INSERT INTO `medication_class` VALUES (1,'Vile');
/*!40000 ALTER TABLE `medication_class` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `obird_auth`
--

DROP TABLE IF EXISTS `obird_auth`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `obird_auth` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userName` varchar(45) DEFAULT NULL,
  `password` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `obird_auth`
--

LOCK TABLES `obird_auth` WRITE;
/*!40000 ALTER TABLE `obird_auth` DISABLE KEYS */;
INSERT INTO `obird_auth` VALUES (1,'khaledeng','thegenius'),(2,'ali','ali'),(3,'amr','amr'),(4,'admin','admin'),(5,'fsdafsd','23123'),(6,'change','123'),(7,'khaledUSer','12312'),(8,'fdsfsdf','fsdafsdf'),(9,'fsdafds','fdfds'),(10,'dasdsad','dasdsad'),(11,'sdfsdf','fsdfds'),(12,'dasdas','dasdasd'),(13,'fdsf','fsdfsd'),(14,'gdffdg','gdfgd'),(15,'fsdfdsf','fdsfsdf');
/*!40000 ALTER TABLE `obird_auth` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `obird_log_action`
--

DROP TABLE IF EXISTS `obird_log_action`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `obird_log_action` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) DEFAULT NULL,
  `action` varchar(255) DEFAULT NULL,
  `created` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_obird_log_action_1_idx` (`userId`),
  CONSTRAINT `fk_obird_log_action_1` FOREIGN KEY (`userId`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `obird_log_action`
--

LOCK TABLES `obird_log_action` WRITE;
/*!40000 ALTER TABLE `obird_log_action` DISABLE KEYS */;
INSERT INTO `obird_log_action` VALUES (1,1,'ADD Examine Type : Examine','2016-12-03');
/*!40000 ALTER TABLE `obird_log_action` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `obird_role`
--

DROP TABLE IF EXISTS `obird_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `obird_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `displayName` varchar(45) DEFAULT NULL,
  `description` varchar(45) DEFAULT NULL,
  `deleted` bit(1) DEFAULT b'0',
  `enabled` bit(1) DEFAULT b'1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `obird_role`
--

LOCK TABLES `obird_role` WRITE;
/*!40000 ALTER TABLE `obird_role` DISABLE KEYS */;
INSERT INTO `obird_role` VALUES (1,'SUPER_ADMIN','Super Admin','The Super Admin for the Whole System','\0',''),(2,'ADMIN','Admin','Admin User who can View All the System Data','\0',''),(3,'RESERVATION_USER','Reservation','Reservation User for Reservation Processes','\0',''),(4,'INQUIRY_USER','Inquiry','Inquiry User for Checking All Available Times','\0',''),(5,'ENTRY_USER','Entry','Entry User can Add and Edit the User Informat','\0','');
/*!40000 ALTER TABLE `obird_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `obird_user`
--

DROP TABLE IF EXISTS `obird_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `obird_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `firstName` varchar(45) DEFAULT NULL,
  `middleName` varchar(45) DEFAULT NULL,
  `lastName` varchar(45) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `created` date DEFAULT NULL,
  `updated` date DEFAULT NULL,
  `active` bit(1) DEFAULT b'1',
  `deleted` bit(1) DEFAULT b'0',
  `authId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_obird_user_1_idx` (`authId`),
  CONSTRAINT `fk_obird_user_1` FOREIGN KEY (`authId`) REFERENCES `obird_auth` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `obird_user`
--

LOCK TABLES `obird_user` WRITE;
/*!40000 ALTER TABLE `obird_user` DISABLE KEYS */;
INSERT INTO `obird_user` VALUES (1,'khaled','KOKO','Mosaad','efafsdfsda',NULL,NULL,'','\0',1),(2,'ali','ali','ali','ali',NULL,'2016-11-12','','\0',2),(3,'amr','amr','amr','amr',NULL,NULL,'','\0',3),(4,'admin','admin','admin','admin@mail.com',NULL,NULL,'','\0',4),(7,'Change','ChageMe','Chagnge','fdsfdsfdsf',NULL,'2016-11-12','','\0',6),(8,'My Name','is','khaled','khaled@mail.com','2016-11-12','2016-11-25','','\0',7),(9,'dsasad','dsadas','fsdfdsa','fsdfasdf','2016-11-12',NULL,'','',8),(10,'dsa','fdfasd','fsdfasd','fsadf','2016-11-19',NULL,'','\0',9),(11,'dasdasdsad','dasdsad','dasdsad','dsadasdsa','2016-11-19',NULL,'','',10),(12,'dasd','dsadsad','dfdsfs','fsdfsdfdsf','2016-11-19',NULL,'','\0',11),(13,'asdsad','dsadsa','dasdsad','adsad','2016-11-19',NULL,'','',12),(14,'fsdfd','fsdfsf','fdsfsdfd','fsfsdf','2016-11-19',NULL,'','\0',13),(15,'fgdfg1fgdg','dfgfdqgdfgfd','gddfgqgdfgf','gdfgf','2016-11-19',NULL,'','\0',14),(16,'sdfdf','fsdfdsf','fsdfds','fsdfdsf','2016-11-19',NULL,'','\0',15);
/*!40000 ALTER TABLE `obird_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `obird_user_role`
--

DROP TABLE IF EXISTS `obird_user_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `obird_user_role` (
  `roleId` int(11) DEFAULT NULL,
  `userId` int(11) DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`),
  KEY `fk_obird_user_role_1_idx` (`roleId`),
  KEY `fk_obird_user_role_2_idx` (`userId`),
  CONSTRAINT `fk_obird_user_role_1` FOREIGN KEY (`roleId`) REFERENCES `obird_role` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_obird_user_role_2` FOREIGN KEY (`userId`) REFERENCES `obird_user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `obird_user_role`
--

LOCK TABLES `obird_user_role` WRITE;
/*!40000 ALTER TABLE `obird_user_role` DISABLE KEYS */;
INSERT INTO `obird_user_role` VALUES (1,1,1),(4,3,7),(2,4,8),(2,7,12),(3,2,15),(4,9,16),(2,10,17),(2,11,18),(2,12,19),(2,13,20),(2,14,21),(2,15,22),(2,16,23),(3,8,25);
/*!40000 ALTER TABLE `obird_user_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `patient`
--

DROP TABLE IF EXISTS `patient`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `patient` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(45) CHARACTER SET latin1 DEFAULT NULL,
  `fName` varchar(45) CHARACTER SET latin1 DEFAULT NULL,
  `midName` varchar(45) CHARACTER SET latin1 DEFAULT NULL,
  `lName` varchar(45) CHARACTER SET latin1 DEFAULT NULL,
  `gender` varchar(45) CHARACTER SET latin1 DEFAULT NULL,
  `address` varchar(100) CHARACTER SET latin1 DEFAULT NULL,
  `phone1` varchar(45) CHARACTER SET latin1 DEFAULT NULL,
  `phone2` varchar(45) CHARACTER SET latin1 DEFAULT NULL,
  `email` varchar(45) CHARACTER SET latin1 DEFAULT NULL,
  `age` varchar(45) CHARACTER SET latin1 DEFAULT NULL,
  `birthDate` date DEFAULT NULL,
  `creationDate` datetime DEFAULT NULL,
  `registeredBy` int(11) DEFAULT NULL,
  `lastModifiedDate` datetime DEFAULT NULL,
  `modifiedBy` int(11) DEFAULT NULL,
  `insuranceId` int(11) DEFAULT NULL,
  `isDeleted` bit(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_patient_1_idx` (`insuranceId`),
  KEY `fk_patient_2_idx` (`modifiedBy`),
  KEY `fk_patient_3_idx` (`registeredBy`),
  CONSTRAINT `fk_patient_1` FOREIGN KEY (`insuranceId`) REFERENCES `insurance_company` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_patient_2` FOREIGN KEY (`modifiedBy`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_patient_3` FOREIGN KEY (`registeredBy`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `patient`
--

LOCK TABLES `patient` WRITE;
/*!40000 ALTER TABLE `patient` DISABLE KEYS */;
INSERT INTO `patient` VALUES (1,'006677','khaled','Mosaad','Abd El-Aziz','Female','Sheben El-Kom Meonofiya','01116258483','01060752335','engkhaledmos3ad@gmail.com','21','2016-01-01','2015-10-10 02:28:24',1,'2016-12-06 00:44:10',1,1,'\0'),(2,'Mohamed','Mohamed','Ahmed','El-Nagar','Female','Cairo ,Egypt ','01343413454','1234545','mohamed@mail.com','22','1999-06-03','2015-10-10 02:31:04',1,'2016-12-02 18:34:23',1,2,'\0'),(15,'Amr','Amr','Mohamed','Sobhy','Male','Cairo , Egypt','013223','03123213','amr@mail.com','29',NULL,'2016-12-02 18:36:57',1,NULL,NULL,3,'\0'),(16,'Eslam ','Eslam ','Mohamed','hamed','Male','Cairo , Egypt','42341','423134','aam@mail.com','20',NULL,'2016-12-02 18:37:46',1,NULL,NULL,NULL,'\0'),(17,'ESSO','ESSO','khaled','Ali','Male','Cairo , Egypt','01233454325','01241323412','esso@mail.com','40','2009-10-16','2016-12-03 15:14:16',1,'2016-12-06 01:23:31',1,1,'\0'),(18,'IMA','IMA','dad','dasdasd','Female','Cairo , Egypt','121434','234231434','esso@mail.com','20','2016-01-01','2016-12-05 22:34:00',1,'2016-12-06 01:09:16',1,3,'\0'),(19,'fdsafdsf','fdsafdsf','fsdafsdqfsdf','fsdfaf','Male','Cairo , Egypt','23432143','32414','dadad@fdsafd.com','20','2010-10-16','2016-12-05 23:16:55',1,NULL,NULL,2,'\0'),(20,'dsadsad','dsadsad','dsadsa','dsadsa','Male','lcacsdc','432413534','34514354353','dfsdsafd@dff.com','34','1972-03-16','2016-12-05 23:44:47',1,'2016-12-06 02:10:54',1,NULL,'\0'),(21,'New','New','One','Gefe','Male','dsfdsfasdfdsfdsf','213214341','3441234','dfdsfds@fdsfd.com','32','2002-01-01','2016-12-06 00:55:02',1,'2016-12-06 01:09:24',1,2,'\0'),(22,'dodod','dodod','dodo','dodosd','Female','adfdfadsf','21324234','432143241','fsdfasdfdsfdasf','22',NULL,'2016-12-06 02:00:12',1,'2016-12-06 02:00:12',1,NULL,'\0'),(23,'fadsf','fadsf','fsdfsda','fsdafdsf','Female','daffdsf','14324','4234123432','ee@fdsf.com','20','2004-12-12','2016-12-06 02:03:17',1,'2016-12-06 02:09:30',1,3,'\0'),(24,'sadsads','sadsads','dsadsad','dsadsd','Male','dsfdsfds','435673','34567','dsds@fdf.com','20','2002-10-14','2016-12-06 02:10:07',1,'2016-12-06 02:10:07',1,3,'\0');
/*!40000 ALTER TABLE `patient` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `patient_complain`
--

DROP TABLE IF EXISTS `patient_complain`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `patient_complain` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `complainId` int(11) DEFAULT NULL,
  `visitId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_patient_complain_1_idx` (`complainId`),
  KEY `fk_patient_complain_2_idx` (`visitId`),
  CONSTRAINT `fk_patient_complain_1` FOREIGN KEY (`complainId`) REFERENCES `complain` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_patient_complain_2` FOREIGN KEY (`visitId`) REFERENCES `patient_visit` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `patient_complain`
--

LOCK TABLES `patient_complain` WRITE;
/*!40000 ALTER TABLE `patient_complain` DISABLE KEYS */;
INSERT INTO `patient_complain` VALUES (32,1,1),(33,4,1),(34,3,1),(47,1,2),(48,2,2),(49,3,2),(50,4,2);
/*!40000 ALTER TABLE `patient_complain` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `patient_diagnosis`
--

DROP TABLE IF EXISTS `patient_diagnosis`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `patient_diagnosis` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `diagnosisId` int(11) DEFAULT NULL,
  `visitId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_patient_diagnosis_1_idx` (`diagnosisId`),
  KEY `fk_patient_diagnosis_2_idx` (`visitId`),
  CONSTRAINT `fk_patient_diagnosis_1` FOREIGN KEY (`diagnosisId`) REFERENCES `diagnosis` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_patient_diagnosis_2` FOREIGN KEY (`visitId`) REFERENCES `patient_visit` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `patient_diagnosis`
--

LOCK TABLES `patient_diagnosis` WRITE;
/*!40000 ALTER TABLE `patient_diagnosis` DISABLE KEYS */;
INSERT INTO `patient_diagnosis` VALUES (6,3,1),(7,2,1),(8,1,1),(14,4,1),(23,5,1),(25,1,2),(26,2,2),(27,3,2),(28,4,2),(29,5,2);
/*!40000 ALTER TABLE `patient_diagnosis` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `patient_extra`
--

DROP TABLE IF EXISTS `patient_extra`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `patient_extra` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `extraDataId` int(11) DEFAULT NULL,
  `value` varchar(255) DEFAULT NULL,
  `patientId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_patient_extend_1_idx` (`patientId`),
  KEY `fk_patient_extend_2_idx` (`extraDataId`),
  CONSTRAINT `fk_patient_extra_1` FOREIGN KEY (`extraDataId`) REFERENCES `extra_data` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_patient_extra_2` FOREIGN KEY (`patientId`) REFERENCES `patient` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `patient_extra`
--

LOCK TABLES `patient_extra` WRITE;
/*!40000 ALTER TABLE `patient_extra` DISABLE KEYS */;
INSERT INTO `patient_extra` VALUES (1,1,'YES',1),(2,2,'30',1),(3,3,'30',1),(4,4,'YES',1);
/*!40000 ALTER TABLE `patient_extra` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `patient_measurement`
--

DROP TABLE IF EXISTS `patient_measurement`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `patient_measurement` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `measurementId` int(11) DEFAULT NULL,
  `visitId` int(11) DEFAULT NULL,
  `theValue` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_patient_measurement_1_idx` (`measurementId`),
  KEY `fk_patient_measurement_2_idx` (`visitId`),
  CONSTRAINT `fk_patient_measurement_1` FOREIGN KEY (`measurementId`) REFERENCES `measurement` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_patient_measurement_2` FOREIGN KEY (`visitId`) REFERENCES `patient_visit` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `patient_measurement`
--

LOCK TABLES `patient_measurement` WRITE;
/*!40000 ALTER TABLE `patient_measurement` DISABLE KEYS */;
/*!40000 ALTER TABLE `patient_measurement` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `patient_medication`
--

DROP TABLE IF EXISTS `patient_medication`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `patient_medication` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `medicationId` int(11) DEFAULT NULL,
  `visitId` int(11) DEFAULT NULL,
  `unit` int(11) DEFAULT NULL,
  `period` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_patient_medication_1_idx` (`medicationId`),
  KEY `fk_patient_medication_2_idx` (`visitId`),
  CONSTRAINT `fk_patient_medication_1` FOREIGN KEY (`medicationId`) REFERENCES `medication` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_patient_medication_2` FOREIGN KEY (`visitId`) REFERENCES `patient_visit` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `patient_medication`
--

LOCK TABLES `patient_medication` WRITE;
/*!40000 ALTER TABLE `patient_medication` DISABLE KEYS */;
INSERT INTO `patient_medication` VALUES (1,1,1,20,3),(2,2,1,2,2),(3,3,1,33,3);
/*!40000 ALTER TABLE `patient_medication` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `patient_prescription`
--

DROP TABLE IF EXISTS `patient_prescription`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `patient_prescription` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `prescriptionId` int(11) DEFAULT NULL,
  `visitId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_patient_prescription_1_idx` (`prescriptionId`),
  KEY `fk_patient_prescription_2_idx` (`visitId`),
  CONSTRAINT `fk_patient_prescription_1` FOREIGN KEY (`prescriptionId`) REFERENCES `prescription` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_patient_prescription_2` FOREIGN KEY (`visitId`) REFERENCES `patient_visit` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `patient_prescription`
--

LOCK TABLES `patient_prescription` WRITE;
/*!40000 ALTER TABLE `patient_prescription` DISABLE KEYS */;
INSERT INTO `patient_prescription` VALUES (1,3,1),(2,2,1);
/*!40000 ALTER TABLE `patient_prescription` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `patient_visit`
--

DROP TABLE IF EXISTS `patient_visit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `patient_visit` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `patientId` int(11) DEFAULT NULL,
  `temperature` varchar(45) DEFAULT NULL,
  `pressure` varchar(45) DEFAULT NULL,
  `visitDate` datetime DEFAULT NULL,
  `examineTypeId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_patient_visit_1_idx` (`patientId`),
  KEY `fk_patient_visit_2_idx` (`examineTypeId`),
  CONSTRAINT `fk_patient_visit_1` FOREIGN KEY (`patientId`) REFERENCES `patient` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_patient_visit_2` FOREIGN KEY (`examineTypeId`) REFERENCES `examine_type` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `patient_visit`
--

LOCK TABLES `patient_visit` WRITE;
/*!40000 ALTER TABLE `patient_visit` DISABLE KEYS */;
INSERT INTO `patient_visit` VALUES (1,1,'30','80/60','2016-04-08 00:00:00',1),(2,1,'50','80/69','2016-01-06 00:00:00',1);
/*!40000 ALTER TABLE `patient_visit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `prescription`
--

DROP TABLE IF EXISTS `prescription`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `prescription` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `prescriptionTypeId` int(11) DEFAULT NULL,
  `signed` bit(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_prescription_1_idx` (`prescriptionTypeId`),
  CONSTRAINT `fk_prescription_1` FOREIGN KEY (`prescriptionTypeId`) REFERENCES `prescription_type` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prescription`
--

LOCK TABLES `prescription` WRITE;
/*!40000 ALTER TABLE `prescription` DISABLE KEYS */;
INSERT INTO `prescription` VALUES (1,'X-Rays',2,''),(2,'Sonari',2,''),(3,'EXpose',2,'');
/*!40000 ALTER TABLE `prescription` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `prescription_type`
--

DROP TABLE IF EXISTS `prescription_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `prescription_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prescription_type`
--

LOCK TABLES `prescription_type` WRITE;
/*!40000 ALTER TABLE `prescription_type` DISABLE KEYS */;
INSERT INTO `prescription_type` VALUES (1,'Recommended Eats'),(2,'Rays'),(3,'Medical analysis');
/*!40000 ALTER TABLE `prescription_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reservation`
--

DROP TABLE IF EXISTS `reservation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reservation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `reservationDate` date DEFAULT NULL,
  `reservationWay` int(11) DEFAULT NULL,
  `examineType` int(11) DEFAULT NULL,
  `patientId` int(11) DEFAULT NULL,
  `paid` float DEFAULT NULL,
  `remain` float DEFAULT NULL,
  `attendenceTimeFrom` time DEFAULT NULL,
  `attendenceTimeTo` time DEFAULT NULL,
  `status` varchar(45) DEFAULT NULL,
  `theOrder` int(11) DEFAULT NULL,
  `workingTimeId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_reservation_1_idx` (`patientId`),
  KEY `fk_reservation_2_idx` (`reservationWay`),
  KEY `fk_reservation_3_idx` (`examineType`),
  KEY `fk_reservation_4_idx` (`workingTimeId`),
  CONSTRAINT `fk_reservation_1` FOREIGN KEY (`patientId`) REFERENCES `patient` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_reservation_2` FOREIGN KEY (`reservationWay`) REFERENCES `reservation_way` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_reservation_3` FOREIGN KEY (`examineType`) REFERENCES `examine_type` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_reservation_4` FOREIGN KEY (`workingTimeId`) REFERENCES `working_time` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reservation`
--

LOCK TABLES `reservation` WRITE;
/*!40000 ALTER TABLE `reservation` DISABLE KEYS */;
INSERT INTO `reservation` VALUES (1,'2016-12-03',1,1,1,19.5,0,'17:00:00','17:20:00','CONFIRMED',NULL,1),(2,'2016-12-03',1,2,2,15,0,'17:20:00','17:40:00','CONFIRMED',NULL,1),(3,'2016-12-03',1,1,15,30,0,'17:40:00','18:00:00','CONFIRMED',NULL,1),(4,'2016-12-03',2,19,16,30,0,'18:00:00','18:20:00','CONFIRMED',NULL,1),(5,'2016-12-05',14,36,17,40,0,'19:20:00','19:40:00','WAITING',NULL,5);
/*!40000 ALTER TABLE `reservation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reservation_way`
--

DROP TABLE IF EXISTS `reservation_way`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reservation_way` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nameAr` varchar(45) DEFAULT NULL,
  `nameEn` varchar(45) DEFAULT NULL,
  `description` varchar(100) DEFAULT NULL,
  `isDeleted` bit(1) DEFAULT b'0',
  `isDefault` bit(1) DEFAULT b'0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reservation_way`
--

LOCK TABLES `reservation_way` WRITE;
/*!40000 ALTER TABLE `reservation_way` DISABLE KEYS */;
INSERT INTO `reservation_way` VALUES (1,'»«· ·›ÌÊ‰','By Telephone','Reserve By Telephone','\0',''),(2,'»«·«Ì„Ì·','By Email','fdsfdsfsd','\0','\0'),(3,'»«·ÊÌ» ”«Ì ','By WebSite','Reservation by WebSite','\0','\0'),(14,'«·Õ÷Ê—','Attendence','Attend to Clinic','\0','\0'),(15,'sadsad','dsadsad','dsadsadasdas','','\0');
/*!40000 ALTER TABLE `reservation_way` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transfer_source`
--

DROP TABLE IF EXISTS `transfer_source`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `transfer_source` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mobileSource` int(11) DEFAULT NULL,
  `mobileNetwork` int(11) DEFAULT NULL,
  `simNumber` int(11) DEFAULT NULL,
  `totalCredit` float DEFAULT NULL,
  `deleted` bit(1) DEFAULT NULL,
  `mobileNumber` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transfer_source`
--

LOCK TABLES `transfer_source` WRITE;
/*!40000 ALTER TABLE `transfer_source` DISABLE KEYS */;
/*!40000 ALTER TABLE `transfer_source` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `address` varchar(45) DEFAULT NULL,
  `phoneNumber1` varchar(45) DEFAULT NULL,
  `phoneNumber2` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_users_1` FOREIGN KEY (`id`) REFERENCES `obird_user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'Cairo','01111','022222'),(2,'Cairo','03333','04444'),(3,'Alex','05555','06666'),(4,'PORTO','456789','45678'),(7,'ALEXXX','2345674321','32456754'),(8,'FFDSFDFSDFAFSDAFDS','243241','23432423'),(9,'vdsfdsafsdfsadfsdfsdfsd','fsdfsdf','fsdfsdfsd'),(10,'fsdfsdfdsf','fsdfsdf','fsdfsdf'),(11,'dasdsadsadsad','dadasd','dasdsad'),(12,'sdfdsfsdf','fsdfsdf','fsdf'),(13,'sddsfasdsa','dasdsa','dasds'),(14,'fsfsdfsdfsd','fsdfsdf','fsdfsdff'),(15,'gddfgfdgdfg','gdfgdf','gdfgdf'),(16,'fssdfsdfds','fsdfsd','fsdf');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `week_day`
--

DROP TABLE IF EXISTS `week_day`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `week_day` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `dayShort` varchar(45) DEFAULT NULL,
  `dayNameEn` varchar(45) DEFAULT NULL,
  `dayNameAr` varchar(45) CHARACTER SET utf8 DEFAULT NULL,
  `offLine` bit(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `week_day`
--

LOCK TABLES `week_day` WRITE;
/*!40000 ALTER TABLE `week_day` DISABLE KEYS */;
INSERT INTO `week_day` VALUES (1,'SAT','Saturday','«·”» ','\0'),(2,'SUN','Sunday','«·√Õœ','\0'),(3,'MON','Monday','«·√À‰Ì‰','\0'),(4,'TUE','Tuesday','«·À·«À«¡','\0'),(5,'WED','Wednesday','«·√—»⁄«¡','\0'),(6,'THU','Thursday','«·Œ„Ì”','\0'),(7,'FRI','Friday','«·Ã„⁄…','');
/*!40000 ALTER TABLE `week_day` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `working_time`
--

DROP TABLE IF EXISTS `working_time`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `working_time` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `timeFrom` time DEFAULT NULL,
  `timeTo` time DEFAULT NULL,
  `expanded` bit(1) DEFAULT NULL,
  `weekDayId` int(11) DEFAULT NULL,
  `isDeleted` bit(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_working_time_1_idx` (`weekDayId`),
  CONSTRAINT `fk_working_time_1` FOREIGN KEY (`weekDayId`) REFERENCES `week_day` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `working_time`
--

LOCK TABLES `working_time` WRITE;
/*!40000 ALTER TABLE `working_time` DISABLE KEYS */;
INSERT INTO `working_time` VALUES (1,'17:00:00','20:00:00','\0',1,'\0'),(2,'20:30:00','22:30:00','\0',1,'\0'),(3,'16:00:00','18:00:00','\0',2,'\0'),(4,'18:00:00','21:00:00','\0',2,'\0'),(5,'18:00:00','20:00:00','\0',3,'\0'),(6,'21:00:00','23:00:00','\0',3,'\0'),(7,'17:00:00','20:00:00','\0',4,'\0'),(8,'21:00:00','23:00:00','\0',4,'\0'),(9,'18:00:00','20:00:00','\0',5,'\0'),(10,'21:00:00','23:00:00','\0',5,'\0'),(11,'19:00:00','21:00:00','\0',6,'\0'),(12,'22:00:00','23:30:00','\0',6,'\0'),(14,'23:00:00','23:30:00','\0',1,'');
/*!40000 ALTER TABLE `working_time` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-12-06  9:55:29
