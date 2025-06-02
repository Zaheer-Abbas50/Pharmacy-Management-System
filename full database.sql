-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: localhost    Database: pharmacydata3
-- ------------------------------------------------------
-- Server version	8.3.0

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `billing`
--

DROP TABLE IF EXISTS `billing`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `billing` (
  `bill_id` smallint NOT NULL AUTO_INCREMENT,
  `customer_id` smallint NOT NULL,
  `discounted_price` decimal(10,2) DEFAULT NULL,
  `actual_price` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`bill_id`),
  KEY `customer_id` (`customer_id`),
  CONSTRAINT `billing_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`customer_id`)
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `billing`
--

LOCK TABLES `billing` WRITE;
/*!40000 ALTER TABLE `billing` DISABLE KEYS */;
INSERT INTO `billing` VALUES (1,1,1313.20,'1340'),(2,2,1205.40,'1230'),(3,3,793.80,'810'),(4,4,1019.20,'1040'),(5,5,676.20,'690'),(6,6,823.20,'840'),(7,7,1136.80,'1160'),(8,8,1019.20,'1040'),(9,9,1597.40,'1630'),(10,10,2107.00,'2150'),(11,11,1685.60,'1720'),(12,12,1724.80,'1760'),(13,13,1509.20,'1540'),(14,14,1656.20,'1690'),(15,15,2009.00,'2050'),(16,49,1989.40,'2030'),(17,49,1989.40,'2030'),(18,49,1989.40,'2030'),(19,49,1989.40,'2030'),(20,49,1989.40,'2030'),(21,49,1989.40,'2030'),(22,49,1989.40,'2030'),(23,49,1989.40,'2030'),(24,49,1989.40,'2030'),(25,49,1989.40,'2030'),(26,50,1225.00,'1250'),(27,50,1225.00,'1250'),(28,52,823.20,'840'),(29,52,823.20,'840'),(30,52,823.20,'840'),(31,5,1470.00,'1500'),(32,3,656.60,'670'),(33,3,1607.20,'1640'),(34,55,2606.80,'2660'),(35,6,1303.40,'1330'),(36,20,480.20,'490'),(37,20,2214.80,'2260'),(38,20,3371.20,'3440'),(39,56,2342.20,'2390'),(40,36,548.80,'560'),(41,56,2724.40,'2780'),(42,56,3655.40,'3730'),(43,58,715.40,'730'),(44,58,715.40,'730'),(45,59,1274.00,'1300'),(46,10,1568.00,'1600');
/*!40000 ALTER TABLE `billing` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer` (
  `customer_id` smallint NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`customer_id`)
) ENGINE=InnoDB AUTO_INCREMENT=60 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES (1,'Aqeel Khan','0300-1234567','aqeel.khan@gmail.com'),(2,'Sara Ali','0301-1234567','sara.ali@yahoo.com'),(3,'Bilal Ahmed','0302-1234567','bilal.ahmed@hotmail.com'),(4,'Fatima Noor','0303-1234567','fatima.noor@gmainol.com'),(5,'Zain Abbas','0304-1234567','zain.abbas@yahoo.com'),(6,'Nida Farooq','0305-1234567','nida.farooq@hotmail.com'),(7,'Hassan Raza','0306-1234567','hassan.raza@gmail.com'),(8,'Maha Saeed','0307-1234567','maha.saeed@yahoo.com'),(9,'Umer Javed','0308-1234567','umer.javed@hotmail.com'),(10,'Asma Tariq','0309-1234567','asma.tariq@gmail.com'),(11,'Ali Shah','0310-1234567','ali.shah@yahoo.com'),(12,'Ayesha Kamran','0311-1234567','ayesha.kamran@hotmail.com'),(13,'Saad Qureshi','0312-1234567','saad.qureshi@gmail.com'),(14,'Hira Bashir','0313-1234567','hira.bashir@yahoo.com'),(15,'Imran Khan','0314-1234567','imran.khan@hotmail.com'),(16,'Malik Zaheer Abbas','030456789234','zaheer@gmail.com'),(17,'Malik Zaheer Abbas','030456789264','Zaheer@gmail.com'),(18,'Malik Zaheer Abbas','030456789264','Zaheer@gmail.com'),(19,'Shazia','030400404004','shazia@gmail.com'),(20,'Shazia','030400404004','shazia@gmail.com'),(21,'Malik Zaheer ','030456789234','Zaheer@gmail.com'),(22,'Malik Zaheer Abbas','03045678923489','jarvisai551972@gmail.com'),(23,'Malik Zaheer Abbas','03045678923489','jarvisai551972@gmail.com333'),(25,'Malik Zaheer 4','030456789234','zaheer4@gmail.com'),(26,'Malik Zaheer 4','030456789234','zaheer4@gmail.com'),(27,'Malik Zaheer 4','030456789234','zaheer4@gmail.com'),(28,'Malik Zaheer Abbas','030456789234','jarvisai551972@gmail.com'),(29,'Malik Zaheer Abbas','030456789234','jarvisai551972@gmail.com'),(30,'Malik Zaheer Abbas','030456789234','jarvisai551972@gmail.com'),(31,'Malik Zaheer Abbas','030456789234','jarvisai551972@gmail.com'),(32,'Malik Zaheer 4','030456789234','zaheer4@gmail.com'),(33,'Malik Zaheer Abbas','030456789234','zaheer4@gmail.com'),(34,'Malik Zaheer Abbas','030456789234','shazia@gmail.com'),(35,'Malik Zaheer Abbas','030456789234','Zaheer@gmail.com'),(36,'Malik Zaheer Abbas','030456789234','Zaheer@gmail.com'),(37,'Malik Zaheer Abbas','030456789234','zaheer@gmail.com'),(38,'Malik Zaheer Abbas','030456789234','zaheer4@gmail.com'),(39,'Malik','030400404004','malik@gmail.com'),(40,'ma','02020','maa@gmail.com'),(41,'khan','02020444','khan@gmail.com'),(42,'khani','0202044433','khani@gmail.com'),(43,'Shaziaaa','030456789234','zaheer@gmail.com'),(44,'Malikkk','030400404004','malikkk@gmail.com'),(45,'manahil','030456789234','zaheer4@gmail.com'),(46,'laraib','03000033','lara@gmail.com'),(47,'l','000','ll@gmail.com'),(48,'m','33','m@gmail.com'),(49,'a','11','shazia@gmail.com'),(50,'DilJan Ali','03096201725','diljan4@gmail.com'),(52,'Aqeel ','03003003003','200020202@gmail.com'),(54,'Malik Zaheer Abbas22','03045678923422','shazia@gmail.com'),(55,'Malik Zaheer Abbas 56','030456789234','Zaheer@gmail.com'),(56,'Zaheer Abbas','03000000','zaheer@gmail.com'),(58,'Zaheer Abbas44','03000000','samcengagesolutions@gmail.com'),(59,'Diljan malik','030456789234','zaheer4@gmail.com');
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `medicine`
--

DROP TABLE IF EXISTS `medicine`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `medicine` (
  `medicine_id` smallint NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `sale_price` mediumint DEFAULT NULL,
  `pack_size` varchar(50) DEFAULT NULL,
  `available_quantity` smallint DEFAULT NULL,
  PRIMARY KEY (`medicine_id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `medicine`
--

LOCK TABLES `medicine` WRITE;
/*!40000 ALTER TABLE `medicine` DISABLE KEYS */;
INSERT INTO `medicine` VALUES (1,'Paracetamol',810,'1x14\'s',100),(2,'Xetza',480,'15 ml',200),(3,'Wizen',560,'4x7\'s',150),(4,'Ciprofloxacin',350,'1x14\'s',80),(5,'Unifin',510,'25 ml',90),(6,'Omeprazole',670,'2x10\'s',120),(7,'Zeboxil',390,'2x10\'s',110),(8,'Azithromycin',650,'1x14\'s',60),(9,'Lisinopril',690,'1x14\'s',130),(10,'Zeal',490,'4x7\'s',140),(11,'Simvastatin',540,'2x10\'s',70),(12,'Levothyroxine',730,'1x14\'s',90),(13,'Zenda',710,'1x14\'s',100),(14,'Aspirin',440,'15 ml',200),(15,'Clopidogrel',510,'1x14\'s',50);
/*!40000 ALTER TABLE `medicine` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `order_id` smallint NOT NULL AUTO_INCREMENT,
  `customer_id` smallint NOT NULL,
  `medicine_id` smallint NOT NULL,
  `discount` varchar(100) DEFAULT NULL,
  `order_date` datetime DEFAULT NULL,
  PRIMARY KEY (`order_id`),
  KEY `customer_id` (`customer_id`),
  KEY `medicine_id` (`medicine_id`),
  CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`customer_id`),
  CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`medicine_id`) REFERENCES `medicine` (`medicine_id`)
) ENGINE=InnoDB AUTO_INCREMENT=85 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (1,1,2,'2%','2022-10-30 00:00:00'),(2,1,4,'2%','2022-10-30 00:00:00'),(3,1,5,'2%','2022-10-30 00:00:00'),(4,2,6,'2%','2020-08-08 00:00:00'),(5,2,3,'2%','2020-08-08 00:00:00'),(6,3,1,'2%','2023-02-23 00:00:00'),(7,4,7,'2%','2021-12-01 00:00:00'),(8,4,8,'2%','2021-12-01 00:00:00'),(9,5,9,'2%','2024-01-24 00:00:00'),(10,6,10,'2%','2020-03-03 00:00:00'),(11,6,4,'2%','2020-03-03 00:00:00'),(12,7,10,'2%','2020-05-12 00:00:00'),(13,7,6,'2%','2020-05-12 00:00:00'),(14,8,3,'2%','2020-05-29 00:00:00'),(15,8,2,'2%','2020-05-29 00:00:00'),(16,9,12,'2%','2022-01-03 00:00:00'),(17,9,5,'2%','2022-01-03 00:00:00'),(18,9,7,'2%','2022-01-03 00:00:00'),(19,10,1,'2%','2022-01-21 00:00:00'),(20,10,8,'2%','2022-01-21 00:00:00'),(21,10,9,'2%','2022-01-21 00:00:00'),(22,11,5,'2%','2020-06-15 00:00:00'),(23,11,6,'2%','2020-06-15 00:00:00'),(24,11,11,'2%','2020-06-15 00:00:00'),(25,12,3,'2%','2020-10-10 00:00:00'),(26,12,9,'2%','2020-10-10 00:00:00'),(27,12,5,'2%','2020-10-10 00:00:00'),(28,13,13,'2%','2020-04-28 00:00:00'),(29,13,2,'2%','2020-04-28 00:00:00'),(30,13,4,'2%','2020-04-28 00:00:00'),(31,14,7,'2%','2022-09-05 00:00:00'),(32,14,10,'2%','2022-09-05 00:00:00'),(33,14,1,'2%','2022-09-05 00:00:00'),(34,15,8,'2%','2020-12-30 00:00:00'),(35,15,6,'2%','2020-12-30 00:00:00'),(36,15,12,'2%','2020-12-30 00:00:00'),(37,39,5,'2%','2024-06-29 10:04:02'),(38,44,2,'2%','2024-06-29 10:24:35'),(39,44,4,'2%','2024-06-29 10:24:42'),(40,45,14,'2%','2024-06-29 10:26:06'),(41,45,10,'2%','2024-06-29 10:26:17'),(42,49,3,'2%','2024-06-29 11:02:08'),(43,49,3,'2%','2024-06-29 11:03:09'),(44,49,3,'2%','2024-06-29 11:03:34'),(45,49,4,'2%','2024-06-29 11:03:46'),(46,50,1,'2%','2024-06-29 12:07:39'),(47,50,14,'2%','2024-06-29 12:07:52'),(48,52,4,'2%','2024-06-29 12:32:54'),(49,52,10,'2%','2024-06-29 12:33:06'),(50,54,1,'2%','2024-06-29 13:30:53'),(51,5,1,'2%','2024-06-29 13:36:58'),(52,5,2,'2%','2024-06-29 13:55:31'),(53,3,6,'2%','2024-06-29 14:09:35'),(54,3,10,'2%','2024-06-29 14:17:39'),(55,3,2,'2%','2024-06-29 14:17:48'),(56,55,14,'2%','2024-06-29 14:29:01'),(57,55,14,'2%','2024-06-29 14:29:06'),(58,55,10,'2%','2024-06-29 14:29:19'),(59,55,3,'2%','2024-06-29 14:29:29'),(60,55,12,'2%','2024-06-29 14:29:36'),(61,6,4,'2%','2024-06-29 14:38:26'),(62,6,10,'2%','2024-06-29 14:38:33'),(63,6,10,'2%','2024-06-29 14:38:42'),(64,20,10,'2%','2024-06-29 15:14:02'),(65,20,12,'2%','2024-06-29 16:42:55'),(66,20,3,'2%','2024-06-29 16:43:06'),(67,20,2,'2%','2024-06-29 16:43:17'),(68,20,4,'2%','2024-06-29 16:43:32'),(69,20,4,'2%','2024-06-29 16:43:38'),(70,20,2,'2%','2024-06-29 16:43:46'),(71,56,3,'2%','2024-06-29 18:08:49'),(72,56,7,'2%','2024-06-29 18:09:03'),(73,56,12,'2%','2024-06-29 18:09:13'),(74,56,13,'2%','2024-06-29 18:09:23'),(75,36,3,'2%','2024-06-29 18:13:43'),(76,56,7,'2%','2024-06-29 18:14:43'),(77,56,3,'2%','2024-06-29 18:15:01'),(78,56,7,'2%','2024-06-29 18:15:11'),(79,58,12,'2%','2024-06-29 22:42:43'),(80,59,1,'2%','2024-06-29 23:17:19'),(81,59,10,'2%','2024-06-29 23:17:31'),(82,10,6,'2%','2024-06-29 23:19:23'),(83,10,14,'2%','2024-06-29 23:19:31'),(84,10,10,'2%','2024-06-29 23:19:41');
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shipment`
--

DROP TABLE IF EXISTS `shipment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shipment` (
  `shipment_id` smallint NOT NULL AUTO_INCREMENT,
  `supplier_id` smallint NOT NULL,
  `medicine_id` smallint NOT NULL,
  `quantity` smallint DEFAULT NULL,
  `expiry_date` date DEFAULT NULL,
  `buying_price` smallint DEFAULT NULL,
  PRIMARY KEY (`shipment_id`),
  KEY `supplier_id` (`supplier_id`),
  KEY `medicine_id` (`medicine_id`),
  CONSTRAINT `shipment_ibfk_1` FOREIGN KEY (`supplier_id`) REFERENCES `supplier` (`supplier_id`),
  CONSTRAINT `shipment_ibfk_2` FOREIGN KEY (`medicine_id`) REFERENCES `medicine` (`medicine_id`)
) ENGINE=InnoDB AUTO_INCREMENT=62 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shipment`
--

LOCK TABLES `shipment` WRITE;
/*!40000 ALTER TABLE `shipment` DISABLE KEYS */;
INSERT INTO `shipment` VALUES (1,1,11,50,'2024-12-31',420),(2,1,5,40,'2024-11-30',395),(3,1,13,30,'2024-10-31',580),(4,1,3,20,'2024-09-30',450),(5,1,7,10,'2024-08-31',300),(6,2,9,50,'2024-07-31',580),(7,2,4,40,'2024-06-30',230),(8,2,1,30,'2024-05-31',695),(9,2,12,20,'2024-04-30',590),(10,2,6,10,'2024-03-31',550),(11,3,14,50,'2024-02-29',295),(12,3,2,40,'2024-01-31',365),(13,3,8,30,'2023-12-31',540),(14,3,10,20,'2023-11-30',370),(15,3,15,10,'2023-10-31',340),(16,4,11,50,'2024-11-30',400),(17,4,13,40,'2024-10-31',575),(18,4,7,30,'2024-09-30',290),(19,4,4,20,'2024-08-31',235),(20,4,12,10,'2024-07-31',610),(21,5,5,50,'2024-06-30',405),(22,5,3,40,'2024-05-31',440),(23,5,9,30,'2024-04-30',580),(24,5,1,20,'2024-03-31',700),(25,5,6,10,'2024-02-29',540),(26,6,14,50,'2024-01-31',300),(27,6,8,40,'2023-12-31',545),(28,6,15,30,'2023-11-30',320),(29,7,11,50,'2024-10-31',430),(30,7,3,40,'2024-09-30',445),(31,7,4,30,'2024-08-31',240),(32,7,6,20,'2024-07-31',560),(33,7,8,10,'2024-06-30',530),(34,8,5,50,'2024-05-31',390),(35,8,7,40,'2024-04-30',280),(36,8,1,30,'2024-03-31',680),(37,8,14,20,'2024-02-29',390),(38,8,12,10,'2024-01-31',600),(39,9,13,50,'2023-12-31',585),(40,9,9,40,'2023-11-30',590),(41,9,3,30,'2023-10-31',450),(42,9,2,20,'2024-12-31',370),(43,9,15,10,'2024-11-30',290),(44,10,11,50,'2024-09-30',390),(45,10,4,40,'2024-08-31',230),(46,10,8,30,'2024-07-31',525),(47,11,13,50,'2024-06-30',595),(48,11,12,40,'2024-05-31',615),(49,11,15,30,'2024-04-30',305),(50,12,7,50,'2024-03-31',285),(51,12,14,40,'2024-02-29',375),(52,12,11,30,'2024-01-31',405),(53,13,4,50,'2023-12-31',225),(54,13,8,40,'2023-11-30',555),(55,13,13,30,'2023-10-31',605),(56,14,12,50,'2024-12-31',605),(57,14,15,40,'2024-11-30',295),(58,14,7,30,'2024-10-31',310),(59,15,14,50,'2024-09-30',285),(60,15,11,40,'2024-08-31',430),(61,15,4,30,'2024-07-31',230);
/*!40000 ALTER TABLE `shipment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `supplier`
--

DROP TABLE IF EXISTS `supplier`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `supplier` (
  `supplier_id` smallint NOT NULL AUTO_INCREMENT,
  `supplier_name` varchar(100) NOT NULL,
  `supplier_email` varchar(100) DEFAULT NULL,
  `supplier_phone` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`supplier_id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `supplier`
--

LOCK TABLES `supplier` WRITE;
/*!40000 ALTER TABLE `supplier` DISABLE KEYS */;
INSERT INTO `supplier` VALUES (1,'MedPak','info@medpak.com','0321-1234567'),(2,'HealthPlus','contact@healthplus.com','0322-1234567'),(3,'PharmaCare','support@pharmacare.com','0323-1234567'),(4,'LifeMeds','sales@lifemeds.com','0324-1234567'),(5,'WellnessMed','info@wellnessmed.com','0325-1234567'),(6,'CarePharm','contact@carepharm.com','0326-1234567'),(7,'MediHub','support@medihub.com','0327-1234567'),(8,'DrugMart','sales@drugmart.com','0328-1234567'),(9,'CureMed','info@curemed.com','0329-1234567'),(10,'PharmaPlus','contact@pharmaplus.com','0330-1234567'),(11,'HealPharm','support@healpharm.com','0331-1234567'),(12,'MediZone','sales@medizone.com','0332-1234567'),(13,'HealthMeds','info@healthmeds.com','0333-1234567'),(14,'CarePlus','contact@careplus.com','0334-1234567'),(15,'LifeCare','support@lifecare.com','0335-1234567');
/*!40000 ALTER TABLE `supplier` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'pharmacydata3'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-06-30  9:22:33
