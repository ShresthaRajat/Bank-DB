-- MySQL dump 10.16  Distrib 10.1.30-MariaDB, for Win32 (AMD64)
--
-- Host: localhost    Database: remittance
-- ------------------------------------------------------
-- Server version	10.1.30-MariaDB

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
-- Table structure for table `branches`
--

DROP TABLE IF EXISTS `branches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `branches` (
  `branchCode` varchar(3) NOT NULL,
  `location` varchar(25) DEFAULT NULL,
  `contact` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`branchCode`),
  UNIQUE KEY `location` (`location`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `branches`
--

LOCK TABLES `branches` WRITE;
/*!40000 ALTER TABLE `branches` DISABLE KEYS */;
INSERT INTO `branches` VALUES ('AU2','Australia','6356778'),('FL4','Finland','5356778'),('NK5','North Korea','2356778'),('NP1','Nepal','4356778'),('US3','United States','9356778');
/*!40000 ALTER TABLE `branches` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employees`
--

DROP TABLE IF EXISTS `employees`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `employees` (
  `empID` int(11) NOT NULL,
  `name` varchar(25) DEFAULT NULL,
  `post` varchar(25) DEFAULT 'Teller',
  `contact` varchar(25) DEFAULT NULL,
  `workPlace` varchar(3) DEFAULT NULL,
  PRIMARY KEY (`empID`),
  UNIQUE KEY `name` (`name`),
  KEY `workPlace` (`workPlace`),
  CONSTRAINT `employees_ibfk_1` FOREIGN KEY (`workPlace`) REFERENCES `branches` (`branchCode`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employees`
--

LOCK TABLES `employees` WRITE;
/*!40000 ALTER TABLE `employees` DISABLE KEYS */;
INSERT INTO `employees` VALUES (1,'Ram','CEO','977-01-4449988','NP1'),(2,'Julie','Manager','923-01-4449434','AU2'),(3,'Ron','Teller','115-01-4445943','US3'),(4,'Madan','Manager','992-01-4532454','FL4'),(5,'Jan','Manager','001-01-4434254','NK5');
/*!40000 ALTER TABLE `employees` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `receivers`
--

DROP TABLE IF EXISTS `receivers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `receivers` (
  `RNo` int(11) NOT NULL,
  `name` varchar(30) NOT NULL,
  `contact` varchar(25) DEFAULT NULL,
  `location` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`RNo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `receivers`
--

LOCK TABLES `receivers` WRITE;
/*!40000 ALTER TABLE `receivers` DISABLE KEYS */;
INSERT INTO `receivers` VALUES (1,'Ron','667-01-4449934','Nepal'),(2,'Dora','234-01-4999934','Nepal'),(3,'Babuska','453-01-422234','NorthKorea'),(4,'Boris','765-01-4422934','NotrhKorea'),(5,'Luna','675-01-4449934','NorthKorea'),(6,'Steve','564-01-4433934','USA'),(7,'Dora','234-01-4455934','Nepal');
/*!40000 ALTER TABLE `receivers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `senders`
--

DROP TABLE IF EXISTS `senders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `senders` (
  `SNo` int(11) NOT NULL,
  `name` varchar(30) NOT NULL,
  `contact` varchar(25) DEFAULT NULL,
  `location` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`SNo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `senders`
--

LOCK TABLES `senders` WRITE;
/*!40000 ALTER TABLE `senders` DISABLE KEYS */;
INSERT INTO `senders` VALUES (1,'Rabin','977-01-4449934','Nepal'),(2,'Jack','977-01-4445934','Australia'),(3,'Binod','977-01-4765324','USA'),(4,'Avas','977-01-4478854','FinLand'),(5,'Avon','977-01-4454934','NorthKorea'),(6,'Ana','977-01-4449778','Nepal');
/*!40000 ALTER TABLE `senders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transactions`
--

DROP TABLE IF EXISTS `transactions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `transactions` (
  `transactionCode` int(11) NOT NULL AUTO_INCREMENT,
  `sender` int(11) DEFAULT NULL,
  `receiver` int(11) DEFAULT NULL,
  `amount` int(11) NOT NULL,
  `autdBy` int(11) DEFAULT NULL,
  `autdLoc` varchar(3) DEFAULT NULL,
  `date` date DEFAULT NULL,
  PRIMARY KEY (`transactionCode`),
  KEY `sender` (`sender`),
  KEY `receiver` (`receiver`),
  KEY `autdBy` (`autdBy`),
  KEY `autdLoc` (`autdLoc`),
  CONSTRAINT `transactions_ibfk_1` FOREIGN KEY (`sender`) REFERENCES `senders` (`SNo`),
  CONSTRAINT `transactions_ibfk_2` FOREIGN KEY (`receiver`) REFERENCES `receivers` (`RNo`),
  CONSTRAINT `transactions_ibfk_3` FOREIGN KEY (`autdBy`) REFERENCES `employees` (`empID`),
  CONSTRAINT `transactions_ibfk_4` FOREIGN KEY (`autdLoc`) REFERENCES `branches` (`branchCode`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transactions`
--

LOCK TABLES `transactions` WRITE;
/*!40000 ALTER TABLE `transactions` DISABLE KEYS */;
INSERT INTO `transactions` VALUES (1,1,2,4500,1,'NP1','1999-01-21'),(2,2,1,6700,2,'AU2','2001-09-13'),(3,3,1,4590,3,'US3','2001-09-14'),(4,4,4,4500,4,'FL4','2001-02-17'),(5,5,5,1450,5,'NK5','1997-02-28'),(6,6,3,9500,1,'NP1','1999-04-30'),(7,6,7,5500,1,'NP1','1997-11-29'),(8,5,6,9000,5,'NK5','2001-12-01'),(9,3,6,4000,3,'US3','1999-05-30'),(10,2,1,3400,2,'AU2','1998-07-05'),(11,6,2,1200,1,'NP1','1996-08-07'),(12,6,1,4500,1,'NP1','1997-02-11');
/*!40000 ALTER TABLE `transactions` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-03-23 13:46:31
