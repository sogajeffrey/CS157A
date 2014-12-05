CREATE DATABASE  IF NOT EXISTS `codemonkeys` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `codemonkeys`;
-- MySQL dump 10.13  Distrib 5.6.17, for osx10.6 (i386)
--
-- Host: soga.remotewebaccess.com    Database: codemonkeys
-- ------------------------------------------------------
-- Server version	5.6.21-log

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
-- Table structure for table `accountactivity`
--

DROP TABLE IF EXISTS `accountactivity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `accountactivity` (
  `eventNumber` int(11) NOT NULL AUTO_INCREMENT,
  `accountID` int(11) NOT NULL,
  `transactiondate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `accountNumber` int(11) NOT NULL,
  `actionDone` varchar(50) NOT NULL,
  `amount` double(15,2) NOT NULL,
  `newbalance` double(15,2) NOT NULL,
  `type` enum('Checking','Savings','Loan') NOT NULL,
  `updateAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`eventNumber`)
) ENGINE=InnoDB AUTO_INCREMENT=90 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accountactivity`
--

LOCK TABLES `accountactivity` WRITE;
/*!40000 ALTER TABLE `accountactivity` DISABLE KEYS */;
INSERT INTO `accountactivity` VALUES (62,18,'2014-12-03 21:20:55',112,'Deposit',50391.00,50900.00,'Savings','2014-12-03 21:20:55'),(63,23,'2014-12-03 21:21:04',111,'Deposit',50391.00,50900.00,'Savings','2014-12-03 21:21:04'),(64,16,'2014-12-03 21:21:07',108,'Deposit',64350.00,65000.00,'Savings','2014-12-03 21:21:07'),(65,15,'2014-12-03 21:21:10',107,'Withdraw',25200.00,2805.00,'Savings','2014-12-03 21:21:10'),(66,13,'2014-12-03 21:21:13',106,'Deposit',58410.00,59000.00,'Savings','2014-12-03 21:21:13'),(67,14,'2014-12-03 21:21:17',105,'Deposit',228776.00,229005.00,'Savings','2014-12-03 21:21:17'),(68,23,'2014-12-03 21:21:23',19,'Withdraw',38510.00,388.00,'Checking','2014-12-03 21:21:23'),(69,18,'2014-12-03 21:21:26',16,'Withdraw',49577.00,500.00,'Checking','2014-12-03 21:21:26'),(70,17,'2014-12-03 21:21:28',15,'Deposit',19800.00,20000.00,'Checking','2014-12-03 21:21:28'),(71,14,'2014-12-03 21:21:31',14,'Withdraw',4510.00,45.00,'Checking','2014-12-03 21:21:31'),(72,13,'2014-12-03 21:21:34',13,'Withdraw',5409.00,590.00,'Checking','2014-12-03 21:21:34'),(73,14,'2014-12-03 21:21:37',14,'Deposit',4455.00,4500.00,'Checking','2014-12-03 21:21:37'),(74,13,'2014-12-05 04:21:59',13,'Withdraw',30.00,560.00,'Checking','2014-12-05 04:21:59'),(75,13,'2014-12-05 04:22:03',13,'Deposit',500.00,1060.00,'Checking','2014-12-05 04:22:03'),(76,13,'2014-12-05 04:22:06',13,'Withdraw',20.00,1040.00,'Checking','2014-12-05 04:22:06'),(77,13,'2014-12-05 04:22:06',106,'Deposit',20.00,59020.00,'Savings','2014-12-05 04:22:06'),(78,13,'2014-12-05 04:22:19',13,'Withdraw',3000.00,-1960.00,'Checking','2014-12-05 04:22:19'),(79,13,'2014-12-05 04:22:28',13,'Deposit',300000.00,298040.00,'Checking','2014-12-05 04:22:28'),(80,13,'2014-12-05 21:06:15',13,'Withdraw',8000.00,290040.00,'Checking','2014-12-05 21:06:15'),(81,13,'2014-12-05 21:06:22',13,'Deposit',5000.00,295040.00,'Checking','2014-12-05 21:06:22'),(82,13,'2014-12-05 21:06:28',13,'Withdraw',40.00,295000.00,'Checking','2014-12-05 21:06:28'),(83,13,'2014-12-05 21:06:28',106,'Deposit',40.00,59060.00,'Savings','2014-12-05 21:06:28'),(84,13,'2014-12-05 21:06:54',106,'Withdraw',3000.00,56060.00,'Savings','2014-12-05 21:06:54'),(85,13,'2014-12-05 21:06:57',106,'Deposit',2000.00,58060.00,'Savings','2014-12-05 21:06:57'),(86,13,'2014-12-05 21:07:00',106,'Withdraw',200.00,57860.00,'Savings','2014-12-05 21:07:00'),(87,13,'2014-12-05 21:07:00',13,'Deposit',200.00,295200.00,'Checking','2014-12-05 21:07:00'),(88,13,'2014-12-05 21:07:27',13,'Withdraw',300.00,294900.00,'Checking','2014-12-05 21:07:27'),(89,13,'2014-12-05 21:07:31',106,'Withdraw',100.00,57760.00,'Savings','2014-12-05 21:07:31');
/*!40000 ALTER TABLE `accountactivity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `accountactivity_archive`
--

DROP TABLE IF EXISTS `accountactivity_archive`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `accountactivity_archive` (
  `eventNumber` int(11) NOT NULL,
  `accountID` int(11) NOT NULL,
  `transactiondate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `accountNumber` int(11) NOT NULL,
  `actionDone` varchar(50) NOT NULL,
  `amount` double(15,2) NOT NULL,
  `newbalance` double(15,2) NOT NULL,
  `type` enum('Checking','Savings','Loan') NOT NULL,
  PRIMARY KEY (`eventNumber`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accountactivity_archive`
--

LOCK TABLES `accountactivity_archive` WRITE;
/*!40000 ALTER TABLE `accountactivity_archive` DISABLE KEYS */;
INSERT INTO `accountactivity_archive` VALUES (62,18,'2014-12-03 21:20:55',112,'Deposit',50391.00,50900.00,'Savings'),(63,23,'2014-12-03 21:21:04',111,'Deposit',50391.00,50900.00,'Savings'),(64,16,'2014-12-03 21:21:07',108,'Deposit',64350.00,65000.00,'Savings'),(65,15,'2014-12-03 21:21:10',107,'Withdraw',25200.00,2805.00,'Savings'),(66,13,'2014-12-03 21:21:13',106,'Deposit',58410.00,59000.00,'Savings'),(67,14,'2014-12-03 21:21:17',105,'Deposit',228776.00,229005.00,'Savings'),(68,23,'2014-12-03 21:21:23',19,'Withdraw',38510.00,388.00,'Checking'),(69,18,'2014-12-03 21:21:26',16,'Withdraw',49577.00,500.00,'Checking'),(70,17,'2014-12-03 21:21:28',15,'Deposit',19800.00,20000.00,'Checking'),(71,14,'2014-12-03 21:21:31',14,'Withdraw',4510.00,45.00,'Checking'),(72,13,'2014-12-03 21:21:34',13,'Withdraw',5409.00,590.00,'Checking'),(73,14,'2014-12-03 21:21:37',14,'Deposit',4455.00,4500.00,'Checking'),(74,13,'2014-12-05 04:21:59',13,'Withdraw',30.00,560.00,'Checking'),(75,13,'2014-12-05 04:22:03',13,'Deposit',500.00,1060.00,'Checking'),(76,13,'2014-12-05 04:22:06',13,'Withdraw',20.00,1040.00,'Checking'),(77,13,'2014-12-05 04:22:06',106,'Deposit',20.00,59020.00,'Savings'),(78,13,'2014-12-05 04:22:19',13,'Withdraw',3000.00,-1960.00,'Checking'),(79,13,'2014-12-05 04:22:28',13,'Deposit',300000.00,298040.00,'Checking'),(80,13,'2014-12-05 21:06:15',13,'Withdraw',8000.00,290040.00,'Checking'),(81,13,'2014-12-05 21:06:22',13,'Deposit',5000.00,295040.00,'Checking'),(82,13,'2014-12-05 21:06:28',13,'Withdraw',40.00,295000.00,'Checking'),(83,13,'2014-12-05 21:06:28',106,'Deposit',40.00,59060.00,'Savings'),(84,13,'2014-12-05 21:06:54',106,'Withdraw',3000.00,56060.00,'Savings'),(85,13,'2014-12-05 21:06:57',106,'Deposit',2000.00,58060.00,'Savings'),(86,13,'2014-12-05 21:07:00',106,'Withdraw',200.00,57860.00,'Savings'),(87,13,'2014-12-05 21:07:00',13,'Deposit',200.00,295200.00,'Checking'),(88,13,'2014-12-05 21:07:27',13,'Withdraw',300.00,294900.00,'Checking'),(89,13,'2014-12-05 21:07:31',106,'Withdraw',100.00,57760.00,'Savings');
/*!40000 ALTER TABLE `accountactivity_archive` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `checkingaccount`
--

DROP TABLE IF EXISTS `checkingaccount`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `checkingaccount` (
  `cAccountNumber` int(30) NOT NULL AUTO_INCREMENT,
  `accountID` int(30) NOT NULL,
  `balance` double(15,2) NOT NULL,
  `updatedAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`cAccountNumber`),
  UNIQUE KEY `accountID` (`accountID`),
  CONSTRAINT `customercheckingaccount` FOREIGN KEY (`accountID`) REFERENCES `customer_account_link` (`accountID`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf16 COLLATE=utf16_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `checkingaccount`
--

LOCK TABLES `checkingaccount` WRITE;
/*!40000 ALTER TABLE `checkingaccount` DISABLE KEYS */;
INSERT INTO `checkingaccount` VALUES (13,13,294900.00,'2014-12-05 21:07:27'),(14,14,4500.00,'2014-12-03 21:21:37'),(15,17,20000.00,'2014-12-03 21:21:28'),(16,18,500.00,'2014-12-03 21:21:26'),(20,40,3000.00,'2014-12-05 21:16:14');
/*!40000 ALTER TABLE `checkingaccount` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `addCheckingAccount` AFTER INSERT ON `checkingaccount`
 FOR EACH ROW UPDATE customer_account_link
SET hasChecking = TRUE
where accountID=new.accountID */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `cwithdrawmoney` BEFORE UPDATE ON `checkingaccount`
 FOR EACH ROW INSERT INTO accountactivity (accountID,accountNumber, actionDone, amount, newbalance, type)
(select accountID, cAccountNumber, 'Withdraw', old.balance - new.balance, new.balance, 'Checking'
 from checkingaccount
 where accountID = new.accountID and
	   new.balance < old.balance) */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `cdepositMoney` AFTER UPDATE ON `checkingaccount`
 FOR EACH ROW INSERT INTO accountactivity (accountID,accountNumber, actionDone, amount, newbalance, type)
(select accountID, cAccountNumber, 'Deposit', new.balance - old.balance, balance, 'Checking'
 from checkingaccount
 where accountID = new.accountID and
	   balance > old.balance) */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `customer_account_link`
--

DROP TABLE IF EXISTS `customer_account_link`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer_account_link` (
  `accountID` int(30) NOT NULL AUTO_INCREMENT,
  `uID` varchar(15) NOT NULL,
  `accountFlag` tinyint(1) NOT NULL DEFAULT '0',
  `hasChecking` tinyint(1) NOT NULL DEFAULT '0',
  `hasSavings` tinyint(1) NOT NULL DEFAULT '0',
  `hasLoan` tinyint(1) NOT NULL DEFAULT '0',
  `updatedAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`accountID`),
  UNIQUE KEY `uidlink` (`uID`),
  CONSTRAINT `uidfromcustomerinfo` FOREIGN KEY (`uID`) REFERENCES `userinfo` (`uID`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_account_link`
--

LOCK TABLES `customer_account_link` WRITE;
/*!40000 ALTER TABLE `customer_account_link` DISABLE KEYS */;
INSERT INTO `customer_account_link` VALUES (13,'test1',0,1,1,1,'2014-11-22 20:38:59'),(14,'test2',0,1,1,1,'2014-11-26 21:27:33'),(15,'test3',0,0,1,1,'2014-11-22 20:39:07'),(16,'test4',0,0,1,1,'2014-11-26 21:32:57'),(17,'test5',0,1,0,0,'2014-11-22 20:38:11'),(18,'test6',0,1,1,1,'2014-11-26 21:43:14'),(19,'manager2',0,0,0,0,'2014-11-24 05:44:19'),(20,'test7',0,0,0,1,'2014-11-26 21:30:32'),(27,'jsu',0,0,0,0,'2014-11-26 06:53:28'),(28,'BrandonR',0,0,0,0,'2014-12-03 21:47:51'),(29,'BrandonJ',0,0,0,0,'2014-12-03 21:47:51'),(30,'AnnaR',0,0,0,0,'2014-12-03 21:54:59'),(31,'AnnaB',0,0,0,0,'2014-12-03 21:54:59'),(35,'TJ',0,0,0,0,'2014-12-03 21:57:02'),(40,'customer1',0,1,0,1,'2014-12-05 21:16:46'),(41,'customer2',0,0,0,0,'2014-12-03 22:36:41'),(42,'manager1',0,0,0,0,'2014-12-03 22:36:41'),(43,'manager4',0,0,0,0,'2014-12-03 22:36:41'),(44,'manager3',0,0,0,0,'2014-12-03 22:36:41'),(45,'customer3',0,0,0,0,'2014-12-03 22:36:41'),(46,'customer4',0,0,0,0,'2014-12-03 22:36:41'),(47,'customer5',0,0,0,0,'2014-12-03 22:36:41'),(48,'customer6',0,0,0,0,'2014-12-03 22:36:41'),(49,'customer7',0,0,0,0,'2014-12-03 22:36:41'),(50,'customer8',0,0,0,0,'2014-12-03 22:36:41'),(51,'Customer9',0,0,0,0,'2014-12-03 22:36:41');
/*!40000 ALTER TABLE `customer_account_link` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customercomplaints`
--

DROP TABLE IF EXISTS `customercomplaints`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customercomplaints` (
  `complaintID` int(11) NOT NULL AUTO_INCREMENT,
  `uID` varchar(50) NOT NULL,
  `message` text NOT NULL,
  PRIMARY KEY (`complaintID`),
  KEY `uidindex` (`uID`),
  CONSTRAINT `uidconstraint` FOREIGN KEY (`uID`) REFERENCES `customer_account_link` (`uID`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customercomplaints`
--

LOCK TABLES `customercomplaints` WRITE;
/*!40000 ALTER TABLE `customercomplaints` DISABLE KEYS */;
INSERT INTO `customercomplaints` VALUES (2,'test1','This monkey bank is awesome!'),(3,'test1','WHERE IS MY MONEY???? '),(4,'test1','I DONT HAVE MONEYYY '),(5,'test2','I am having a hard time taking money out of my account. I want to take out $1000000 but it won\'t let me because I only have $1000. This bank sucks!'),(6,'test1','I change my mind, I don\'t like this bank'),(7,'test6','Spam'),(8,'test6','Spam'),(9,'test6','More Spam'),(10,'test6','HAHA This is more spam'),(11,'test6','I must be in Hawaii, because I like Spam!!'),(12,'test1','suckssss'),(13,'test1','great bank\r\n'),(14,'test1','Sucks\r\n');
/*!40000 ALTER TABLE `customercomplaints` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `loan`
--

DROP TABLE IF EXISTS `loan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `loan` (
  `lAccountNumber` int(11) NOT NULL AUTO_INCREMENT,
  `AccountID` int(11) NOT NULL,
  `amount` double(15,2) NOT NULL,
  `loanDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `dueDate` date NOT NULL,
  `updatedAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`lAccountNumber`),
  UNIQUE KEY `accountID key` (`AccountID`),
  CONSTRAINT `mustexist` FOREIGN KEY (`AccountID`) REFERENCES `customer_account_link` (`accountID`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=1141 DEFAULT CHARSET=utf16 COLLATE=utf16_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `loan`
--

LOCK TABLES `loan` WRITE;
/*!40000 ALTER TABLE `loan` DISABLE KEYS */;
INSERT INTO `loan` VALUES (1134,13,396207.00,'2014-11-22 20:38:30','2014-11-29','2014-12-05 21:07:30'),(1135,15,300600.00,'2014-11-22 20:38:40','2014-11-27','2014-11-22 20:40:57'),(1136,14,220000.00,'2014-11-26 21:27:33','2015-12-20','2014-11-26 21:27:33'),(1137,20,5000.00,'2014-11-26 21:30:32','2014-12-11','2014-11-26 21:30:32'),(1138,16,5000.00,'2014-11-26 21:32:57','2016-03-03','2014-11-26 21:32:57'),(1139,18,200000.00,'2014-11-26 21:33:59','2017-07-06','2014-11-26 21:33:59'),(1140,40,200.00,'2014-12-05 21:16:46','2016-07-03','2014-12-05 21:16:46');
/*!40000 ALTER TABLE `loan` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `addLoan` AFTER INSERT ON `loan`
 FOR EACH ROW UPDATE customer_account_link
SET hasLoan = TRUE
where accountID = new.accountID */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `updateCustomerAccountLink` AFTER UPDATE ON `loan` FOR EACH ROW IF new.amount = 0 THEN
UPDATE customer_account_link
SET hasLoan = 0
WHERE accountID = new.accountID;
END IF */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `savingsaccount`
--

DROP TABLE IF EXISTS `savingsaccount`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `savingsaccount` (
  `sAccountID` int(11) NOT NULL AUTO_INCREMENT,
  `accountID` int(11) NOT NULL,
  `balance` double(15,2) NOT NULL,
  `updatedAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`sAccountID`),
  UNIQUE KEY `accountid` (`accountID`),
  CONSTRAINT `savingsaccountid` FOREIGN KEY (`accountID`) REFERENCES `customer_account_link` (`accountID`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=113 DEFAULT CHARSET=utf16 COLLATE=utf16_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `savingsaccount`
--

LOCK TABLES `savingsaccount` WRITE;
/*!40000 ALTER TABLE `savingsaccount` DISABLE KEYS */;
INSERT INTO `savingsaccount` VALUES (105,14,229005.00,'2014-12-03 21:21:17'),(106,13,57760.00,'2014-12-05 21:07:31'),(107,15,2805.00,'2014-12-03 21:21:10'),(108,16,65000.00,'2014-12-03 21:21:07'),(112,18,50900.00,'2014-12-03 21:20:55');
/*!40000 ALTER TABLE `savingsaccount` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `addSavingsAccount` AFTER INSERT ON `savingsaccount`
 FOR EACH ROW UPDATE customer_account_link
SET hasSavings = TRUE
where accountID=new.accountID */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `swithdrawmoney` BEFORE UPDATE ON `savingsaccount`
 FOR EACH ROW INSERT INTO accountactivity (accountID,accountNumber, actionDone, amount, newbalance, type)
(select accountID, sAccountID, 'Withdraw', old.balance - new.balance, new.balance, 'Savings'
 from savingsaccount
 where accountID = new.accountID and
	   new.balance < old.balance) */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `sdepositmoney` AFTER UPDATE ON `savingsaccount`
 FOR EACH ROW INSERT INTO accountactivity (accountID,accountNumber, actionDone, amount, newbalance, type)
(select accountID, sAccountID, 'Deposit', new.balance - old.balance, balance, 'Savings'
 from savingsaccount
 where accountID = new.accountID and
	   balance > old.balance) */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `userinfo`
--

DROP TABLE IF EXISTS `userinfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `userinfo` (
  `uID` varchar(15) NOT NULL,
  `password` varchar(50) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `age` int(30) DEFAULT NULL,
  `email` varchar(50) NOT NULL,
  `ssn` varchar(30) NOT NULL DEFAULT '',
  `phoneNumber` varchar(30) DEFAULT NULL,
  `type` enum('Customer','Manager') NOT NULL DEFAULT 'Customer',
  `updatedAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`uID`,`email`,`ssn`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `userinfo`
--

LOCK TABLES `userinfo` WRITE;
/*!40000 ALTER TABLE `userinfo` DISABLE KEYS */;
INSERT INTO `userinfo` VALUES ('AnnaB','annaB123','Brandon Joseph',56,'joseph@joseph.com','66666666','3333333','Customer','2014-12-03 21:54:59'),('AnnaR','Anna','Brandon Rossi',26,'brandon@brandon.com','99999999','5555555','Customer','2014-12-03 21:54:59'),('BrandonJ','asdffiojgoiehfoijwef','Brandon Joseph',56,'joseph@joseph.com','66666666','3333333','Customer','2014-12-03 21:47:51'),('BrandonR','secret3212314125','Brandon Rossi',26,'brandon@brandon.com','99999999','5555555','Customer','2014-12-03 21:47:51'),('customer1','customer1123','Customer One',27,'customer1@monkeybank.com','111-11-1111','111-111-1111','Customer','2014-12-03 22:36:41'),('customer2','customer2123','Customer Two',23,'customer2@monkeybank.com','222-22-2222','222-222-2222','Customer','2014-12-03 22:36:41'),('customer3','customer3123','Customer Three',50,'customer3@monkeybank.com','666-66-6666','666-666-6666','Customer','2014-12-03 22:36:41'),('customer4','customer4123','Customer Four',30,'customer4@monkeybank.com','777-77-7777','777-777-7777','Customer','2014-12-03 22:36:41'),('customer5','customer5123','Customer Five',26,'customer5@monkeybank.com','888-88-8888','888-888-8888','Customer','2014-12-03 22:36:41'),('customer6','customer6123','Customer Six',65,'customer6@monkeybank.com','999-99-9999','999-999-9999','Customer','2014-12-03 22:36:41'),('customer7','customer7123','Customer Seven',32,'customer7@monkeybank.com','111-22-1111','111-222-1111','Customer','2014-12-03 22:36:41'),('customer8','customer8123','Customer Eight',18,'customer8@monkeybank.com','222-33-2222','222-333-2222','Customer','2014-12-03 22:36:41'),('Customer9','customer9123','Customer Nine',47,'customer9@monkeybank.com','333-44-3333','333-444-3333','Customer','2014-12-03 22:36:41'),('jsu','secret123','jeff',21,'jeff@su.com','12342334','234234234','Manager','2014-11-26 06:53:28'),('manager1','manager1','manager1',45,'manager1.com','1234567345','123423234','Manager','2014-11-22 22:22:13'),('manager1','manager1321','Manager One',21,'manager1@monkeybank.com','333-33-3333','333-333-3333','Manager','2014-12-03 22:36:41'),('manager2','secret123','manager2',35,'manager@moneky.com','12345','2345','Manager','2014-11-24 05:44:19'),('manager3','manager3321','Manager Three',35,'manager3@monkeybank.com','555-55-5555','555-555-5555','Manager','2014-12-03 22:36:41'),('manager4','manager4321','Manager Four',45,'manager4@monkeybank.com','444-44-4444','444-444-4444','Manager','2014-12-03 22:36:41'),('test1','test1','Bob',51,'test1.com','test1-test1-test1','test1-test1-test1-test1','Customer','2014-12-05 21:07:53'),('test2','test2','Manny',20,'test2.com','test2-test2-test2','test2-test2-test3','Customer','2014-11-22 22:34:34'),('test3','test3','Bob',21,'test3.com','test3-test3-test3','test3-test3-test3','Customer','2014-12-02 01:44:14'),('test4','test4','Brandon',20,'test4.com','test4-test4-test4','test4-test4-test4','Customer','2014-11-26 21:52:01'),('test5','test5','Nirav',21,'test5.com','test5-test5-test5','test5-test5-test5','Customer','2014-12-02 01:45:52'),('test6','test6','Mary',20,'test6.com','test6-test6-test6','test6-test6-test6','Customer','2014-11-26 21:52:29'),('test7','test7','Tina',123,'test7@test.com','142345','234234234','Customer','2014-12-02 01:45:20'),('TJ','annaB1ge23','Brangdonwgew Joseph',56,'josgwgew3@joseph.com','697243697698','3333432333','Customer','2014-12-03 21:57:02');
/*!40000 ALTER TABLE `userinfo` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `createCustomerAccount` AFTER INSERT ON `userinfo`
 FOR EACH ROW INSERT INTO customer_account_link(uID)
VALUES (new.uID) */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Dumping routines for database 'codemonkeys'
--
/*!50003 DROP PROCEDURE IF EXISTS `archiveActivity` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `archiveActivity`(IN `cutOffDate` DATE)
INSERT INTO accountactivity_archive (accountID, accountNumber, actionDone, amount, eventNumber, newbalance, transactiondate, type)
SELECT accountID, accountNumber, actionDone, amount, eventNumber, newbalance, transactiondate, type FROM accountactivity WHERE date(updateAt) <= cutOffDate ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `avgAgeUsersWithLoanOverXDollars` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `avgAgeUsersWithLoanOverXDollars`(IN `inAmount` DOUBLE(15,2))
SELECT avg(age)
FROM loan, userinfo, customer_account_link
WHERE userinfo.uID = customer_account_link.uID 
	AND customer_account_link.accountID = loan.accountID 
	AND loan.amount > inAmount ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `createNewCustomer` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `createNewCustomer`(IN `name` VARCHAR(30), IN `username` VARCHAR(30), IN `email` VARCHAR(30), IN `phoneNumber` VARCHAR(30), IN `password` VARCHAR(30), IN `age` INT, IN `ssn` VARCHAR(30))
BEGIN

	INSERT INTO userinfo (uID, password, name, age, email, ssn, phoneNumber) VALUES(userName, password, name, age, email, ssn, phoneNumber);

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getAccountActivity` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getAccountActivity`(IN `inAccountID` INT(11), IN `accountType` ENUM('Checking','Savings','Loan') CHARSET utf8)
SELECT transactiondate, actionDone, amount, newBalance
FROM accountactivity
WHERE accountID=inAccountID AND type=accountType
ORDER BY transactiondate DESC ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getAllComplaints` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getAllComplaints`()
select userinfo.uID, userinfo.name, userinfo.email, userinfo.phoneNumber, customercomplaints.message
from userinfo, customercomplaints
where userinfo.uID = customercomplaints.uID ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getCheckingAccounts` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getCheckingAccounts`()
select customer_account_link.accountID, checkingaccount.cAccountNumber, checkingaccount.balance
from customer_account_link
left outer join checkingaccount
on checkingaccount.accountID = customer_account_link.accountID ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getCustomerInfo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getCustomerInfo`(IN `userID` VARCHAR(30) CHARSET utf8, OUT `outID` VARCHAR(30) CHARSET utf8, OUT `outName` VARCHAR(30) CHARSET utf8, OUT `outAge` INT, OUT `outEmail` VARCHAR(30) CHARSET utf8, OUT `outPhone` VARCHAR(30) CHARSET utf8)
BEGIN
	SELECT uID, name, age, email, phoneNumber
	INTO outID, outName, outAge, outEmail, outPhone
	FROM userinfo
	WHERE uID = userID;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getNetBalanceOfCustomers` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getNetBalanceOfCustomers`()
select CustomerAccounts.aID AS accountID, sum(CustomerAccounts.Total) AS NetBalance
from(
select customer_account_link.accountID AS aID, (checkingaccount.balance) AS Total 
from checkingaccount, customer_account_link 
where checkingaccount.accountID = customer_account_link.accountID 

union

select customer_account_link.accountID AS aID, (savingsaccount.balance) AS Total 
from savingsaccount, customer_account_link 
where savingsaccount.accountID = customer_account_link.accountID) AS CustomerAccounts

group by CustomerAccounts.aID ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getNumberOfTransactions` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getNumberOfTransactions`(IN `dateFrom` DATE, IN `dateTill` DATE)
select accountactivity.accountID, count(accountactivity.accountID) as NumberOfTransaction
from accountactivity
where accountactivity.accountID in (select customer_account_link.accountID
									from customer_account_link
									where customer_account_link.accountID = accountactivity.accountID )
                                    
      and date(transactiondate) >= dateFrom and date(transactiondate) <= dateTill
group by accountactivity.accountID ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getProblemCustomers` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getProblemCustomers`(IN `messageLimit` INT)
select userinfo.uID, userinfo.name, userinfo.email, userinfo.phoneNumber, count(customercomplaints.uID) as totalNumberOfComplaints
from userinfo, customercomplaints
where userinfo.uID = customercomplaints.uID
group by customercomplaints.uID
having count(customercomplaints.uID) > messageLimit ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getProblemLoaners` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getProblemLoaners`()
select CustomerAccounts.aID AS accountID, sum(CustomerAccounts.Total) AS NetBalance, loan.amount AS loanAmount
from(
select customer_account_link.accountID AS aID, (checkingaccount.balance) AS Total 
from checkingaccount, customer_account_link 
where checkingaccount.accountID = customer_account_link.accountID 

union

select customer_account_link.accountID AS aID, (savingsaccount.balance) AS Total 
from savingsaccount, customer_account_link 
where savingsaccount.accountID = customer_account_link.accountID) AS CustomerAccounts, loan

where loan.accountID = CustomerAccounts.aID 
group by CustomerAccounts.aID
having loan.amount > sum(CustomerAccounts.Total) ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `loginCustomer` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `loginCustomer`(IN `customerID` VARCHAR(15) CHARSET utf8, IN `customerPassword` VARCHAR(50) CHARSET utf8)
BEGIN
		SELECT userinfo.uID, userinfo.password, userinfo.type, accountID
		FROM userinfo, customer_account_link
		WHERE userinfo.uID = customerID and password = customerPassword
and customerID  =  customer_account_link.uID;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2014-12-05 14:18:58
