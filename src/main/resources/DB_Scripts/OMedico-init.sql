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
INSERT INTO `common` VALUES (1,'RESERVATION');
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
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `examine_type`
--

LOCK TABLES `examine_type` WRITE;
/*!40000 ALTER TABLE `examine_type` DISABLE KEYS */;
INSERT INTO `examine_type` VALUES (1,'«·ﬂ‘› «·ÃœÌœ','Examine','Examination',50,10,'\0','\0'),(2,'≈⁄«œ… «·ﬂ‘›','Re-Examine','Re-Examine',50,15,'\0','\0'),(19,' Õ·Ì· œ„','Blood Test','Blood Test',80,20,'\0',''),(20,'dsdsad','asdasd','asdasd',40,20,'','\0'),(31,'csdfgh','dsfdgdf','fdfdds',10,10,'','\0'),(33,'‰Ê⁄ ÃœÌœ','New Type',' New Type Examine',20,20,'','\0'),(34,'‰Ê⁄ ÃœÌœ','Another One','fdsafsdfsdfds',50,30,'\0','\0'),(35,'»Ì”»Ì»','Ì»Ì”»Ì”»','Ì”»Ì”»Ì”»',20,20,'','\0');
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
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `insurance_company`
--

LOCK TABLES `insurance_company` WRITE;
/*!40000 ALTER TABLE `insurance_company` DISABLE KEYS */;
INSERT INTO `insurance_company` VALUES (1,'','OMED','OMed Company for Inssurance',NULL,'\0'),(2,'‘—ﬂ… „Ìœ—«Ìœ','MedRight','MedRight Company for Insurrance',NULL,'\0'),(3,'«·⁄—»Ì…','Arabian','Welcome to Arabian Company',NULL,'\0'),(4,'dadasdasdas','fdsfdsf','dsadsadsadasdasd',NULL,''),(9,'ÃœÌœ…','New One','New One Integration System',NULL,''),(10,'Dalia','Dalia','Dalia Company for Insurrance',NULL,'\0');
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
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `insurance_profile`
--

LOCK TABLES `insurance_profile` WRITE;
/*!40000 ALTER TABLE `insurance_profile` DISABLE KEYS */;
INSERT INTO `insurance_profile` VALUES (46,9,1,40),(47,1,1,35),(49,2,1,50),(50,2,19,30),(53,10,1,85);
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
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `obird_auth`
--

LOCK TABLES `obird_auth` WRITE;
/*!40000 ALTER TABLE `obird_auth` DISABLE KEYS */;
INSERT INTO `obird_auth` VALUES (1,'khaledeng','thegenius'),(2,'ali','ali'),(3,'amr','amr'),(4,'admin','admin'),(5,'fsdafsd','23123'),(6,'change','123'),(7,'fsdafsdfdsf','12312'),(8,'fdsfsdf','fsdafsdf');
/*!40000 ALTER TABLE `obird_auth` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `obird_user`
--

LOCK TABLES `obird_user` WRITE;
/*!40000 ALTER TABLE `obird_user` DISABLE KEYS */;
INSERT INTO `obird_user` VALUES (1,'khaled','KOKO','Mosaad','efafsdfsda',NULL,NULL,'','\0',1),(2,'ali','ali','ali','ali',NULL,'2016-11-12','','\0',2),(3,'amr','amr','amr','amr',NULL,NULL,'','\0',3),(4,'admin','admin','admin','admin@mail.com',NULL,NULL,'','\0',4),(7,'Change','ChageMe','Chagnge','fdsfdsfdsf',NULL,'2016-11-12','','\0',6),(8,'fdfdsaf','fdsfdsfdsfs','ASD','fsdafsdfds','2016-11-12','2016-11-12','','\0',7),(9,'dsasad','dsadas','fsdfdsa','fsdfasdf','2016-11-12',NULL,'','\0',8);
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
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `obird_user_role`
--

LOCK TABLES `obird_user_role` WRITE;
/*!40000 ALTER TABLE `obird_user_role` DISABLE KEYS */;
INSERT INTO `obird_user_role` VALUES (1,1,1),(4,3,7),(2,4,8),(2,7,12),(2,8,14),(2,2,15),(4,9,16);
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
  CONSTRAINT `fk_patient_1` FOREIGN KEY (`insuranceId`) REFERENCES `insurance_company` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `patient`
--

LOCK TABLES `patient` WRITE;
/*!40000 ALTER TABLE `patient` DISABLE KEYS */;
INSERT INTO `patient` VALUES (1,'006677','khaled','Mosaad','Abd El-Aziz','Male','Sheben El-Kom Meonofiya','01116258483','01060752335','engkhaledmos3ad@gmail.com','26','1980-05-05','2015-10-10 02:28:24',1,'2016-11-05 22:04:45',1,10,'\0'),(2,'Mohamed','Mohamed','Ahmed','El-Nagar','Female','Cairo ,Egypt ','01343413454','','mohamed@mail.com','22','1999-06-03','2015-10-10 02:31:04',1,'2015-11-10 22:41:29',1,1,''),(3,'mohamed','mohamed','Ahmed','El-Naggar','Male','Menoufia','','222222222222222','mohamed.nn90@gmail.com','25',NULL,'2015-11-03 00:15:54',1,NULL,NULL,2,''),(4,'Ali','Ali','Mohamed','Eslam','Male','Sheben el-Kom','011161112050','013454345634','Mohamed@gg.com','23','2016-06-08','2015-11-03 21:56:04',1,'2016-06-13 00:54:09',1,1,''),(5,'Eslam','Eslam','Mohamed','Ali','Female','Sheben El-Kom Meonofiya','012223445435','5646356573','eslam@gmail.com','21',NULL,'2015-11-04 22:38:50',1,'2015-11-04 22:39:02',1,1,''),(6,'dafsddsf','dafsddsf','sadfdsfdsf','fadsf','Female','afsdfadsf','asfdasdfads','azsdfasdf','fdsafasdf@gfdgdsfgdf.com','23',NULL,'2015-11-10 22:41:07',1,NULL,NULL,2,''),(7,'Mahmoud','Mahmoud','Matar','Ali','Male','dsfadsf','02222','','mahmod@tahoo.com','25',NULL,'2015-12-04 20:31:15',1,'2015-12-04 20:31:42',1,2,''),(8,'Amr','Amr','gvagfdafsd','fsadfdsf','Male','SADADSA','DFSADSADS','','','12',NULL,'2015-12-14 23:51:05',1,'2015-12-14 23:51:26',1,1,'\0'),(9,'dsfghfds','dsfghfds','fgdghjkhgf','gtfdghuiytre','Female','qerwtyuioytrew','56786543','89076543','wertyu@fgdsfgfdsg.com','23','2015-10-22','2015-12-26 02:10:41',1,'2015-12-26 02:20:57',1,2,''),(10,'fadsfdsf','fadsfdsf','vfasdfdsaf','bnm,50','Female','qwreewrqwerqwerewr','546463563564656','345678903424578','sdafadsfd@gdfgf.org','50','2015-10-20','2015-12-26 02:16:51',1,'2016-09-10 04:29:57',1,NULL,'\0'),(11,'fdsafds','fdsafds','fsdafds','fsadfdsaf','Female','asdfsdf','fasdfds','fasdf','engkhaledmos3ad@gmail.com','123',NULL,'2016-01-02 00:53:01',1,'2016-09-10 08:52:21',1,NULL,'\0'),(12,'Eslam','dsadsa','fdgdfgsfdgdfg','El-Sayed,20','Male','Maadi , Cairo ','0111555666','045345636','engkhaledmos3ad@gmail.com','20','2010-10-22','2016-01-12 14:11:50',1,'2016-11-05 22:05:00',1,NULL,'\0'),(13,'mahmoud','mahmoud','Matar','dsaDAS','Male','Bagoor','01115555555','034324324324','dfadf@gfsdg.com','25','1991-12-31','2016-01-30 17:20:43',1,'2016-02-10 22:34:10',1,1,''),(14,'khload','khload','dsadsa','dasdsada','Male','sdadsdsad','0213213','04313432','sAS@afdsf.com','19','1991-02-08','2016-02-27 18:42:48',1,NULL,NULL,1,'');
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
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reservation`
--

LOCK TABLES `reservation` WRITE;
/*!40000 ALTER TABLE `reservation` DISABLE KEYS */;
INSERT INTO `reservation` VALUES (1,'2015-10-17',1,1,1,NULL,NULL,'17:05:00','17:35:00','CANCELLED',NULL,1),(2,'2015-10-17',1,1,2,NULL,NULL,'17:50:00','18:00:00','WAITING',NULL,1),(3,'2015-10-17',1,1,1,200,NULL,'18:30:00','18:55:00','CONFIRMED',NULL,1),(4,'2015-10-17',1,1,2,60,NULL,'19:00:00','19:10:00','CONFIRMED',NULL,1),(5,'2015-10-17',1,1,1,NULL,NULL,'19:20:00','19:30:00','WAITING',NULL,1),(6,'2015-10-17',2,2,1,40,NULL,'18:25:00','18:30:00','CONFIRMED',NULL,1),(7,'2015-10-17',2,1,1,NULL,NULL,'21:20:00','21:30:00','WAITING',NULL,2),(8,'2015-10-17',2,2,1,NULL,NULL,'21:10:00','21:15:00','CANCELLED',NULL,2),(9,'2015-10-18',2,1,1,NULL,NULL,'16:10:00','16:20:00','WAITING',NULL,3),(10,'2015-10-17',3,1,1,NULL,NULL,'18:10:00','18:20:00','WAITING',NULL,1),(11,'2015-10-17',2,1,1,NULL,NULL,'17:20:00','17:30:00','UNDEFINED',NULL,1),(12,'2015-10-17',2,1,1,NULL,NULL,'17:40:00','17:50:00','WAITING',NULL,1),(13,'2015-10-17',NULL,1,13,NULL,NULL,'17:20:00','17:30:00','WAITING',NULL,1),(14,'2015-10-17',1,1,1,NULL,NULL,'18:00:00','18:10:00','WAITING',NULL,1),(15,'2016-02-29',2,1,1,NULL,NULL,'18:20:00','18:30:00','WAITING',NULL,5),(16,'2016-02-25',2,1,1,NULL,NULL,'19:50:00','20:00:00','CANCELLED',NULL,11),(17,'2016-02-25',2,1,13,NULL,NULL,'19:50:00','20:00:00','CONFIRMED',NULL,11),(18,'2016-02-25',1,1,1,NULL,NULL,'19:40:00','19:50:00','WAITING',NULL,11),(19,'2016-02-27',1,2,14,NULL,NULL,'17:40:00','17:45:00','CONFIRMED',NULL,1),(20,'2016-02-27',1,2,1,NULL,NULL,'18:10:00','18:15:00','CONFIRMED',NULL,1),(21,'2016-03-24',1,2,1,NULL,NULL,'19:10:00','19:15:00','CONFIRMED',NULL,11),(22,'2016-03-24',2,2,1,NULL,NULL,'19:00:00','19:05:00','CANCELLED',NULL,11),(23,'2016-03-24',2,1,1,NULL,NULL,'19:00:00','19:10:00','CONFIRMED',NULL,11),(24,'2016-03-30',NULL,19,1,NULL,NULL,'18:40:00','19:00:00','WAITING',NULL,9),(25,'2016-04-13',2,1,14,NULL,NULL,'18:30:00','18:40:00','WAITING',NULL,9),(26,'2016-04-26',1,19,1,NULL,NULL,'18:00:00','18:20:00','WAITING',NULL,7),(27,'2016-04-26',1,19,1,NULL,NULL,'17:20:00','17:40:00','WAITING',NULL,1),(28,'2016-04-30',1,1,1,NULL,NULL,'17:30:00','17:40:00','CONFIRMED',NULL,1),(29,'2016-05-14',1,1,1,NULL,NULL,'17:20:00','17:30:00','CANCELLED',NULL,1),(30,'2016-05-30',1,1,1,NULL,NULL,'21:30:00','21:40:00','CANCELLED',NULL,6),(31,'2016-05-30',1,1,1,NULL,NULL,'18:30:00','18:45:00','WAITING',NULL,5),(32,'2016-06-28',1,19,1,NULL,NULL,'21:40:00','22:00:00','WAITING',NULL,8),(33,'2016-06-12',1,1,1,NULL,NULL,'16:20:00','16:30:00','WAITING',NULL,3),(34,'2016-06-25',14,1,1,NULL,NULL,'18:30:00','18:40:00','WAITING',NULL,1),(35,'2016-06-25',14,1,2,37.5,0,'17:20:00','17:30:00','WAITING',NULL,1),(36,'2016-06-25',14,1,5,0,37.5,'18:50:00','19:00:00','WAITING',NULL,1),(37,'2016-06-25',14,1,5,37.5,0,'18:10:00','18:20:00','WAITING',NULL,1),(38,'2016-06-25',14,1,5,37.5,0,'18:10:00','18:20:00','WAITING',NULL,1),(39,'2016-07-02',14,1,4,50,0,'17:20:00','17:30:00','WAITING',NULL,1),(40,'2016-08-01',14,1,1,0,26.75,'18:50:00','19:00:00','WAITING',NULL,5),(41,'2016-08-06',14,1,1,0,26.75,'17:10:00','17:20:00','WAITING',NULL,1),(46,'2016-09-12',2,1,1,0,25,'18:10:00','18:20:00','WAITING',NULL,5),(47,'2016-09-12',14,34,1,50,0,'18:20:00','18:50:00','WAITING',NULL,5),(48,'2016-09-12',14,34,1,50,0,'19:20:00','19:50:00','WAITING',NULL,5),(49,'2016-09-13',14,1,1,0,25,'17:20:00','17:30:00','WAITING',NULL,7),(50,'2016-09-13',14,1,1,25,0,'17:40:00','17:50:00','WAITING',NULL,7),(51,'2016-09-13',14,1,12,0,50,'17:30:00','17:40:00','WAITING',NULL,7),(52,'2016-10-09',14,1,1,0,7.5,'16:30:00','16:40:00','WAITING',NULL,3),(53,'2016-11-14',14,19,1,0,80,'18:40:00','19:00:00','WAITING',NULL,5);
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
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reservation_way`
--

LOCK TABLES `reservation_way` WRITE;
/*!40000 ALTER TABLE `reservation_way` DISABLE KEYS */;
INSERT INTO `reservation_way` VALUES (1,'»«· ·Ì›Ê‰','By Telephone','Reserve By Telephone','\0','\0'),(2,'»«·«Ì„Ì·','By Email','fdsfdsfsd','\0','\0'),(3,'»«·ÊÌ» ”«Ì ','By WebSite','Reservation by WebSite','\0','\0'),(14,'«·Õ÷Ê—','Attendence','Attend to Clinic','\0','');
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
INSERT INTO `user` VALUES (1,'Cairo','01111','022222'),(2,'Cairo','03333','04444'),(3,'Alex','05555','06666'),(4,'PORTO','456789','45678'),(7,'ALEXXX','2345674321','32456754'),(8,'FFDSFDFSDFAFSDAFDS','243241','23432423'),(9,'vdsfdsafsdfsadfsdfsdfsd','fsdfsdf','fsdfsdfsd');
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

-- Dump completed on 2016-11-15 20:54:41
