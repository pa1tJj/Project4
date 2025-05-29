-- MySQL dump 10.13  Distrib 8.0.41, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: estateadvance
-- ------------------------------------------------------
-- Server version	8.0.41

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
-- Table structure for table `assignmentbuilding`
--

DROP TABLE IF EXISTS `assignmentbuilding`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `assignmentbuilding` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `staffid` bigint NOT NULL,
  `buildingid` bigint NOT NULL,
  `createddate` datetime DEFAULT NULL,
  `modifieddate` datetime DEFAULT NULL,
  `createdby` varchar(255) DEFAULT NULL,
  `modifiedby` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_user_building` (`staffid`),
  KEY `fk_building_user` (`buildingid`),
  CONSTRAINT `fk_building_user` FOREIGN KEY (`buildingid`) REFERENCES `building` (`id`),
  CONSTRAINT `fk_user_building` FOREIGN KEY (`staffid`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=72 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assignmentbuilding`
--

LOCK TABLES `assignmentbuilding` WRITE;
/*!40000 ALTER TABLE `assignmentbuilding` DISABLE KEYS */;
INSERT INTO `assignmentbuilding` VALUES (58,2,2,NULL,NULL,NULL,NULL),(59,3,2,NULL,NULL,NULL,NULL),(60,2,4,NULL,NULL,NULL,NULL),(61,4,4,NULL,NULL,NULL,NULL),(62,2,3,NULL,NULL,NULL,NULL),(69,4,1,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `assignmentbuilding` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `assignmentcustomer`
--

DROP TABLE IF EXISTS `assignmentcustomer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `assignmentcustomer` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `staffid` bigint NOT NULL,
  `customerid` bigint NOT NULL,
  `createddate` datetime DEFAULT NULL,
  `modifieddate` datetime DEFAULT NULL,
  `createdby` varchar(255) DEFAULT NULL,
  `modifiedby` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_user_customer` (`staffid`),
  KEY `fk_customer_user` (`customerid`),
  CONSTRAINT `fk_customer_user` FOREIGN KEY (`customerid`) REFERENCES `customer` (`id`),
  CONSTRAINT `fk_user_customer` FOREIGN KEY (`staffid`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assignmentcustomer`
--

LOCK TABLES `assignmentcustomer` WRITE;
/*!40000 ALTER TABLE `assignmentcustomer` DISABLE KEYS */;
INSERT INTO `assignmentcustomer` VALUES (2,2,3,NULL,NULL,NULL,NULL),(4,3,3,NULL,NULL,NULL,NULL),(14,2,1,NULL,NULL,NULL,NULL),(15,2,4,NULL,NULL,NULL,NULL),(16,3,4,NULL,NULL,NULL,NULL),(17,5,4,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `assignmentcustomer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `building`
--

DROP TABLE IF EXISTS `building`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `building` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `street` varchar(255) DEFAULT NULL,
  `ward` varchar(255) DEFAULT NULL,
  `district` varchar(255) DEFAULT NULL,
  `structure` varchar(255) DEFAULT NULL,
  `numberofbasement` int DEFAULT NULL,
  `floorarea` int DEFAULT NULL,
  `direction` varchar(255) DEFAULT NULL,
  `level` varchar(255) DEFAULT NULL,
  `rentprice` int DEFAULT NULL,
  `rentpricedescription` text,
  `servicefee` varchar(255) DEFAULT NULL,
  `carfee` varchar(255) DEFAULT NULL,
  `motofee` varchar(255) DEFAULT NULL,
  `overtimefee` varchar(255) DEFAULT NULL,
  `waterfee` varchar(255) DEFAULT NULL,
  `electricityfee` varchar(255) DEFAULT NULL,
  `deposit` varchar(255) DEFAULT NULL,
  `payment` varchar(255) DEFAULT NULL,
  `renttime` varchar(255) DEFAULT NULL,
  `decorationtime` varchar(255) DEFAULT NULL,
  `brokeragefee` decimal(13,2) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `note` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `linkofbuilding` varchar(255) DEFAULT NULL,
  `map` varchar(255) DEFAULT NULL,
  `avatar` varchar(255) DEFAULT NULL,
  `createddate` datetime DEFAULT NULL,
  `modifieddate` datetime DEFAULT NULL,
  `createdby` varchar(255) DEFAULT NULL,
  `modifiedby` varchar(255) DEFAULT NULL,
  `managername` varchar(255) DEFAULT NULL,
  `managerphone` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=70 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `building`
--

LOCK TABLES `building` WRITE;
/*!40000 ALTER TABLE `building` DISABLE KEYS */;
INSERT INTO `building` VALUES (1,'Nam Giao Building Tower','59 phan xích long','Phường 2','QUAN_1',NULL,2,500,NULL,NULL,15,'15 triệu/m2',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'TANG_TRET,NGUYEN_CAN',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Anh Nam-Chị Linh','0915354727'),(2,'ACM Tower','96 cao thắng','Phường 4','QUAN_2',NULL,2,650,NULL,NULL,18,'18 triệu/m2',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'NGUYEN_CAN',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Chú Thuận','0173546263'),(3,'Alpha 2 Building Tower','153 nguyễn đình chiểu','Phường 6','QUAN_1',NULL,1,200,NULL,NULL,20,'20 triệu/m2',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'NOI_THAT',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Cô Lý','0555532578'),(4,'IDD 1 Building','111 Lý Chính Thắng','Phường 7','QUAN_4',NULL,1,200,NULL,NULL,12,'12 triệu/m2',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'TANG_TRET,NGUYEN_CAN,NOI_THAT',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Anh Long','017345253'),(67,'Bitexco Financial Tower','Hải Triều','Bến Nghé','QUAN_2','',3,6100,'','',50,'50 triệu/m2','','','','',NULL,'','','','','',NULL,'NOI_THAT,TANG_TRET','',NULL,NULL,NULL,NULL,'2025-05-29 19:45:14','2025-05-29 19:45:14','nguyenvana','nguyenvana','Phan Anh - Thị Hương','04837545434'),(68,'Bitexco Financial Tower','Hải Triều','Bến Nghé','QUAN_1','',3,6100,'','',50,'50 triệu/m2','','','','',NULL,'','','','','',NULL,'NOI_THAT,NGUYEN_CAN','',NULL,NULL,NULL,NULL,'2025-05-29 19:45:24','2025-05-29 19:45:24','nguyenvana','nguyenvana','Phan Anh - Thị Hương','04837545434'),(69,'Jj Town','Hải Triều','Bến Nghé','QUAN_8','',3,6100,'','',50,'50 triệu/m2','','','','',NULL,'','','','','',NULL,'TANG_TRET','',NULL,NULL,NULL,NULL,NULL,'2025-05-29 20:17:50',NULL,'nguyenvana','Phan Anh - Thị Hương','04837545434');
/*!40000 ALTER TABLE `building` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `fullname` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `companyname` varchar(255) DEFAULT NULL,
  `demand` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT '1',
  `createddate` datetime DEFAULT NULL,
  `modifieddate` datetime DEFAULT NULL,
  `createdby` varchar(255) DEFAULT NULL,
  `modifiedby` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES (1,'Luc Van Hai','0905671231','hailv@gmail.com','','','',1,NULL,'2025-05-29 14:38:31',NULL,'nguyenvana'),(3,'Ta Thi Cuc','0912121231','cucthita1@gmail.com',NULL,NULL,NULL,1,NULL,NULL,NULL,NULL),(4,'phan anh tuan','0917717219','j14.tuan@gmail.com','','','Đang xử lí',1,NULL,'2025-05-29 14:38:37',NULL,'nguyenvana'),(5,'Đinh Hoàng Đức Anh','048572384534','dhdanh@gmail.com','Viettel','thuê nhà','Đang xử lí',0,NULL,'2025-05-25 16:25:24',NULL,'nguyenvana'),(7,'Phạm Văn Thiên','0917717219','patuandhti15a15hn@sv.uneti.edu.vn','','thuê nhà','',0,NULL,'2025-05-29 11:22:48',NULL,'nguyenvana'),(12,'pat','0917717219','patuandhti15a15hn@sv.uneti.edu.vn','JCorp','thuê nhà','Đang xử lí',0,NULL,'2025-05-29 11:22:23',NULL,'nguyenvana'),(13,'Mai Lan Anh','24358734','mlanh@gmail.com','JCorp','thuê nhà','đã xử lý',0,NULL,'2025-05-29 14:14:20',NULL,'nguyenvanb'),(14,'đangsa','0539453434','da@gmail.com','addd','','',0,'2025-05-29 14:56:54','2025-05-29 14:56:54','nguyenvana','nguyenvana'),(15,'Mai Lan Anh','24358734','mlanh@gmail.com','JCorp','','',0,'2025-05-29 15:04:29','2025-05-29 15:04:29','nguyenvana','nguyenvana'),(16,'','','','','','',0,'2025-05-29 19:33:44','2025-05-29 19:33:44','nguyenvana','nguyenvana'),(17,'Trần Văn Toàn','0489565646','ttv@gmail.com','Viettel','thuê nhà','Đang xử lí',1,'2025-05-29 19:34:56','2025-05-29 19:34:56','nguyenvana','nguyenvana'),(18,'Chu Thui','0489565646','ctv@gmail.com','Viettel','thuê nhà','Đang xử lí',0,'2025-05-29 19:39:07','2025-05-29 19:39:07','nguyenvana','nguyenvana'),(19,'Mai Thị Mai','0489565646','ctv@gmail.com','Viettel','thuê nhà','Đang xử lí',1,'2025-05-29 19:46:34','2025-05-29 19:46:34','nguyenvana','nguyenvana'),(20,'Dương Qúa','04837545434','dq@gmail.com','JCorp','mua nhà','đã xử lý',1,'2025-05-29 19:53:51','2025-05-29 19:53:51','nguyenvana','nguyenvana'),(21,'Tiểu long nữ','04837545434','tln@gmail.com','JCorp','mua nhà','đã xử lý',1,'2025-05-29 19:58:12','2025-05-29 19:58:12','nguyenvana','nguyenvana'),(22,'Đông phương bất bại','04837545434','tln@gmail.com','JJ','mua nhà ở','đã xử lý',1,'2025-05-29 19:58:45','2025-05-29 19:58:45','nguyenvana','nguyenvana'),(23,'Taây Mỗ','05875687','tm@gmail.com','CCMK','thuê nhà','Đang xử lí',1,'2025-05-29 20:01:11','2025-05-29 20:01:11','nguyenvana','nguyenvana'),(24,'hihi','02543523254','hi@gmail.com','JG','thuê nhà','Đang xử lí',1,'2025-05-29 20:02:19','2025-05-29 20:02:19','nguyenvana','nguyenvana');
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rentarea`
--

DROP TABLE IF EXISTS `rentarea`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rentarea` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `value` int DEFAULT NULL,
  `buildingid` bigint DEFAULT NULL,
  `createddate` datetime DEFAULT NULL,
  `modifieddate` datetime DEFAULT NULL,
  `createdby` varchar(255) DEFAULT NULL,
  `modifiedby` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `rentarea_building` (`buildingid`),
  CONSTRAINT `rentarea_building` FOREIGN KEY (`buildingid`) REFERENCES `building` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=90 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rentarea`
--

LOCK TABLES `rentarea` WRITE;
/*!40000 ALTER TABLE `rentarea` DISABLE KEYS */;
INSERT INTO `rentarea` VALUES (1,100,1,NULL,NULL,NULL,NULL),(2,200,1,NULL,NULL,NULL,NULL),(3,200,2,NULL,NULL,NULL,NULL),(4,300,2,NULL,NULL,NULL,NULL),(5,400,2,NULL,NULL,NULL,NULL),(6,300,3,NULL,NULL,NULL,NULL),(7,400,3,NULL,NULL,NULL,NULL),(8,500,3,NULL,NULL,NULL,NULL),(9,100,4,NULL,NULL,NULL,NULL),(10,400,4,NULL,NULL,NULL,NULL),(11,250,4,NULL,NULL,NULL,NULL),(80,111,67,NULL,NULL,NULL,NULL),(81,222,67,NULL,NULL,NULL,NULL),(82,555,67,NULL,NULL,NULL,NULL),(83,111,68,NULL,NULL,NULL,NULL),(84,222,68,NULL,NULL,NULL,NULL),(85,555,68,NULL,NULL,NULL,NULL),(89,444,69,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `rentarea` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `role` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `code` varchar(255) NOT NULL,
  `createddate` datetime DEFAULT NULL,
  `modifieddate` datetime DEFAULT NULL,
  `createdby` varchar(255) DEFAULT NULL,
  `modifiedby` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role`
--

LOCK TABLES `role` WRITE;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
INSERT INTO `role` VALUES (1,'Quản lý','MANAGER',NULL,NULL,NULL,NULL),(2,'Nhân viên','STAFF',NULL,NULL,NULL,NULL),(3,'Người dùng','USER',NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transaction`
--

DROP TABLE IF EXISTS `transaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `transaction` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `code` varchar(255) DEFAULT NULL,
  `note` varchar(255) DEFAULT NULL,
  `customerid` bigint NOT NULL,
  `createddate` datetime DEFAULT NULL,
  `modifieddate` datetime DEFAULT NULL,
  `createdby` varchar(255) DEFAULT NULL,
  `modifiedby` varchar(255) DEFAULT NULL,
  `staffid` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_customer_transaction` (`customerid`),
  CONSTRAINT `fk_customer_transaction` FOREIGN KEY (`customerid`) REFERENCES `customer` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transaction`
--

LOCK TABLES `transaction` WRITE;
/*!40000 ALTER TABLE `transaction` DISABLE KEYS */;
INSERT INTO `transaction` VALUES (20,'DDX','đi cafe',5,'2025-05-29 10:44:59','2025-05-29 10:44:59','nguyenvana','nguyenvana',NULL),(21,'CSKH','tư vấn',5,'2025-05-29 10:46:56','2025-05-29 10:46:56','nguyenvana','nguyenvana',NULL),(22,'CSKH','tư vấn',5,'2025-05-29 10:47:15','2025-05-29 10:47:15','nguyenvana','nguyenvana',NULL),(23,'CSKH','tư vấn',4,'2025-05-29 10:48:17','2025-05-29 10:48:17','nguyenvana','nguyenvana',NULL),(24,'CSKH','tư vấn và thao túng',4,NULL,'2025-05-29 19:47:59',NULL,'nguyenvanb',NULL),(40,'CSKH','gggggggggg',5,'2025-05-29 11:19:40','2025-05-29 11:19:40','nguyenvana','nguyenvana',NULL),(41,'CSKH','gọi điệnvà tư vấn',12,NULL,'2025-05-29 14:13:36',NULL,'nguyenvanb',NULL),(42,'CSKH','gọi điện',18,'2025-05-29 19:39:50','2025-05-29 19:39:50','nguyenvana','nguyenvana',NULL);
/*!40000 ALTER TABLE `transaction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `fullname` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `status` int NOT NULL,
  `createddate` datetime DEFAULT NULL,
  `modifieddate` datetime DEFAULT NULL,
  `createdby` varchar(255) DEFAULT NULL,
  `modifiedby` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'nguyenvana','$2a$10$/RUbuT9KIqk6f8enaTQiLOXzhnUkiwEJRdtzdrMXXwU7dgnLKTCYG','nguyen van a',NULL,NULL,1,NULL,NULL,NULL,NULL),(2,'nguyenvanb','$2a$10$/RUbuT9KIqk6f8enaTQiLOXzhnUkiwEJRdtzdrMXXwU7dgnLKTCYG','nguyen van b',NULL,NULL,1,NULL,NULL,NULL,NULL),(3,'nguyenvanc','$2a$10$/RUbuT9KIqk6f8enaTQiLOXzhnUkiwEJRdtzdrMXXwU7dgnLKTCYG','nguyen van c',NULL,NULL,1,NULL,NULL,NULL,NULL),(4,'nguyenvand','$2a$10$/RUbuT9KIqk6f8enaTQiLOXzhnUkiwEJRdtzdrMXXwU7dgnLKTCYG','nguyen van d',NULL,NULL,1,NULL,NULL,NULL,NULL),(5,'phananh','$2a$10$IzdZzyOiccfCAG1hWP8Z2OYwLDLh9F3R.IrMbAQWWtaTrXAfh06ZO','Phan Anh',NULL,NULL,1,'2025-05-23 08:23:24','2025-05-23 08:23:24','nguyenvana','nguyenvana'),(6,'pa','$2a$10$EafBHL5XjR/fSl5itRES9eIUY81ldF.rmvmpqNlvb0l97TyqmmpbO','Phan Anh URL',NULL,NULL,1,NULL,'2025-05-25 16:55:36',NULL,'nguyenvana');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_role`
--

DROP TABLE IF EXISTS `user_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_role` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `role_id` bigint NOT NULL,
  `user_id` bigint NOT NULL,
  `createddate` datetime DEFAULT NULL,
  `modifieddate` datetime DEFAULT NULL,
  `createdby` varchar(255) DEFAULT NULL,
  `modifiedby` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_user_role` (`user_id`),
  KEY `fk_role_user` (`role_id`),
  CONSTRAINT `fk_role_user` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`),
  CONSTRAINT `fk_user_role` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_role`
--

LOCK TABLES `user_role` WRITE;
/*!40000 ALTER TABLE `user_role` DISABLE KEYS */;
INSERT INTO `user_role` VALUES (1,1,1,NULL,NULL,NULL,NULL),(2,2,2,NULL,NULL,NULL,NULL),(3,2,3,NULL,NULL,NULL,NULL),(4,2,4,NULL,NULL,NULL,NULL),(5,2,5,NULL,NULL,NULL,NULL),(7,2,6,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `user_role` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-05-29 20:38:47
