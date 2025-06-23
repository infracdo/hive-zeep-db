-- MySQL dump 10.13  Distrib 8.0.42, for Linux (x86_64)
--
-- Host: 10.160.0.64    Database: subscriberDB
-- ------------------------------------------------------
-- Server version	8.0.42

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `hive_clients`
--

DROP TABLE IF EXISTS `hive_clients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hive_clients` (
  `id` bigint NOT NULL,
  `account_no` varchar(255) DEFAULT NULL,
  `backend` varchar(255) DEFAULT NULL,
  `client_name` varchar(255) DEFAULT NULL,
  `ip_assigned` varchar(255) DEFAULT NULL,
  `olt_interface` varchar(255) DEFAULT NULL,
  `olt_ip` varchar(255) DEFAULT NULL,
  `olt_downstream` varchar(255) DEFAULT NULL,
  `olt_upstream` varchar(255) DEFAULT NULL,
  `subscription_name` varchar(255) DEFAULT NULL,
  `modem_mac_address` varchar(255) DEFAULT NULL,
  `onu_serial_number` varchar(255) DEFAULT NULL,
  `package_type` varchar(255) DEFAULT NULL,
  `area_id_site` int DEFAULT NULL,
  `ssid_name` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_equiwa2b306v6c4vc0ldd6mqp` (`ip_assigned`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hive_clients`
--

LOCK TABLES `hive_clients` WRITE;
/*!40000 ALTER TABLE `hive_clients` DISABLE KEYS */;
/*!40000 ALTER TABLE `hive_clients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hive_clients_SEQ`
--

DROP TABLE IF EXISTS `hive_clients_SEQ`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hive_clients_SEQ` (
  `next_val` bigint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hive_clients_SEQ`
--

LOCK TABLES `hive_clients_SEQ` WRITE;
/*!40000 ALTER TABLE `hive_clients_SEQ` DISABLE KEYS */;
INSERT INTO `hive_clients_SEQ` VALUES (1);
/*!40000 ALTER TABLE `hive_clients_SEQ` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `new_packages`
--

DROP TABLE IF EXISTS `new_packages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `new_packages` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `cir` varchar(255) NOT NULL,
  `package_type` varchar(255) NOT NULL,
  `max_speed` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_brlye3d46nay3k6t1wt2f330m` (`package_type`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `new_packages`
--

LOCK TABLES `new_packages` WRITE;
/*!40000 ALTER TABLE `new_packages` DISABLE KEYS */;
INSERT INTO `new_packages` VALUES (1,'10000','PLAN999','100000'),(2,'20000','PLAN1000','200000'),(3,'10000','PLAN2999','10000'),(5,'480','FG999','50000'),(6,'70000','SP175R12401','1000000'),(7,'100000','SP176R12401','200000'),(8,'70000','SP177R12402','70000'),(9,'2500','SP178R12402','800000'),(10,'50000','SP179R12402','50000'),(11,'100000','SP180R12403','100000'),(12,'50000','SP181R12403','50000'),(13,'580','FG1199','80000'),(14,'600','FG1399','200000'),(15,'800','FG1899','300000'),(16,'1280','FG2499','550000'),(17,'2000','FG4999','800000'),(18,'1500','FGSME1999','100000'),(19,'2000','FGSME2499','200000'),(20,'2500','FGSME3999','400000'),(21,'3500','FGSME5999','600000'),(22,'7000','FGSME11999','800000'),(23,'20000','FGENT20MB','20000'),(24,'50000','FGENT50MB','50000'),(25,'100000','FGENT100MB','100000'),(26,'200000','FGENT200MB','200000'),(27,'400000','FGENT400MB','400000'),(28,'550000','FGENT550MB','550000'),(29,'1000000','FGENT1GB','1000000'),(30,'2000000','FGENT2GB','2000000'),(31,'3000000','FGENT3GB','3000000'),(32,'10000','PLAN6999','10000'),(33,'10000','HIVE999','10000');
/*!40000 ALTER TABLE `new_packages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `new_subscriber`
--

DROP TABLE IF EXISTS `new_subscriber`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `new_subscriber` (
  `subscriber_id` bigint NOT NULL AUTO_INCREMENT,
  `account_Number` varchar(255) NOT NULL,
  `bucket_id` varchar(255) DEFAULT NULL,
  `ip_assigned` varchar(255) DEFAULT NULL,
  `subscription_name` varchar(255) DEFAULT NULL,
  `modem_mac_address` varchar(255) DEFAULT NULL,
  `onu_serial_number` varchar(255) DEFAULT NULL,
  `package_type` varchar(255) DEFAULT NULL,
  `package_id` varchar(255) DEFAULT NULL,
  `provision_type` varchar(255) DEFAULT NULL,
  `area_id` varchar(255) DEFAULT NULL,
  `subscriber_Name` varchar(255) NOT NULL,
  `subscriber_status` varchar(255) DEFAULT NULL,
  `olt_ip` varchar(255) DEFAULT NULL,
  `olt_downstream` varchar(255) DEFAULT NULL,
  `olt_upstream` varchar(255) DEFAULT NULL,
  `ssid_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`subscriber_id`),
  UNIQUE KEY `UK_4bk4nksbyjdag21usicy85yb3` (`account_Number`),
  UNIQUE KEY `UK_r2dx54tmwewtkqme1uqn51koq` (`ip_assigned`)
) ENGINE=InnoDB AUTO_INCREMENT=108 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `new_subscriber`
--

LOCK TABLES `new_subscriber` WRITE;
/*!40000 ALTER TABLE `new_subscriber` DISABLE KEYS */;
INSERT INTO `new_subscriber` VALUES (89,'RES-20250326-39',NULL,NULL,NULL,NULL,NULL,'FG999',NULL,'hiveconnect',NULL,'CDO TEST3','NEW',NULL,NULL,NULL,NULL),(90,'10000003',NULL,NULL,NULL,NULL,NULL,'CLUR31902',NULL,'mby',NULL,'DWADA, DADA','NEW',NULL,NULL,NULL,NULL),(91,'10000009',NULL,NULL,NULL,NULL,NULL,'COUR61901',NULL,'mby',NULL,'TESSSS, TESTING TEST','NEW',NULL,NULL,NULL,NULL),(92,'10000001',NULL,NULL,NULL,NULL,NULL,'CLUR22104',NULL,'mby',NULL,'DWADA, DASDA','NEW',NULL,NULL,NULL,NULL),(93,'10000006',NULL,NULL,NULL,NULL,NULL,'FG1199',NULL,'mby',NULL,'DEV, TEST','NEW',NULL,NULL,NULL,NULL),(94,'10000002',NULL,NULL,NULL,NULL,NULL,'CLUR21902',NULL,'mby',NULL,'FSDGFA, DGFS','NEW',NULL,NULL,NULL,NULL),(95,'10000010',NULL,NULL,NULL,NULL,NULL,'CLUR11902',NULL,'mby',NULL,'MINHO, LEE','NEW',NULL,NULL,NULL,NULL),(96,'10000011',NULL,NULL,NULL,NULL,NULL,'CLUR12104-1',NULL,'mby',NULL,'DOG, HAT','NEW',NULL,NULL,NULL,NULL),(97,'10000004',NULL,NULL,NULL,NULL,NULL,'CLUR12104-SP',NULL,'mby',NULL,'CDO, WANDA','NEW',NULL,NULL,NULL,NULL),(98,'10000012',NULL,NULL,NULL,NULL,NULL,'CLUR12104-1',NULL,'mby',NULL,'ACCOUNT, NEW','NEW',NULL,NULL,NULL,NULL),(99,'10000013',NULL,NULL,NULL,NULL,NULL,'CLUR21902',NULL,'mby',NULL,'SERVER, TEST','NEW',NULL,NULL,NULL,NULL),(100,'10000014',NULL,NULL,NULL,NULL,NULL,'CLUR12104-1',NULL,'mby',NULL,'SSCWS, TESTTTTTTTSCC','NEW',NULL,NULL,NULL,NULL),(101,'10000015',NULL,NULL,NULL,NULL,NULL,'CLUR12104-1',NULL,'mby',NULL,'AAAA, GOJO','NEW',NULL,NULL,NULL,NULL),(102,'10000016',NULL,NULL,NULL,NULL,NULL,'CLUR31902',NULL,'mby',NULL,'ONE, TESTING','NEW',NULL,NULL,NULL,NULL),(103,'10000005',NULL,NULL,NULL,NULL,NULL,'Standard-monthly',NULL,'mby',NULL,'SAKURAJIMA, MAI','NEW',NULL,NULL,NULL,NULL),(104,'10000007',NULL,NULL,NULL,NULL,NULL,'Standard-monthly',NULL,'mby',NULL,'RINTAROU, OKABE','NEW',NULL,NULL,NULL,NULL),(105,'10000008',NULL,NULL,NULL,NULL,NULL,'Standard-monthly',NULL,'mby',NULL,'LIMIN, MHARI ALLEN','NEW',NULL,NULL,NULL,NULL),(106,'10000017',NULL,NULL,NULL,NULL,NULL,'CLUR12104-SP',NULL,'mby',NULL,'ONE, ONE','NEW',NULL,NULL,NULL,NULL),(107,'B0000031396',NULL,NULL,NULL,NULL,NULL,'CLUR12104-1',NULL,'mby',NULL,'TANJUAKIO, ADRIAN JAKE S.','NEW',NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `new_subscriber` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roles` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` enum('ROLE_ADMIN','ROLE_MODERATOR','ROLE_USER') DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'ROLE_USER'),(2,'ROLE_MODERATOR'),(3,'ROLE_ADMIN');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_roles`
--

DROP TABLE IF EXISTS `user_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_roles` (
  `user_id` bigint NOT NULL,
  `role_id` int NOT NULL,
  PRIMARY KEY (`user_id`,`role_id`),
  KEY `FKh8ciramu9cc9q3qcqiv4ue8a6` (`role_id`),
  CONSTRAINT `FKh8ciramu9cc9q3qcqiv4ue8a6` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`),
  CONSTRAINT `FKhfh9dx7w3ubf1co1vdev94g3f` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_roles`
--

LOCK TABLES `user_roles` WRITE;
/*!40000 ALTER TABLE `user_roles` DISABLE KEYS */;
INSERT INTO `user_roles` VALUES (1,1),(2,1),(3,1),(4,1),(5,1),(6,1),(7,1),(2,3);
/*!40000 ALTER TABLE `user_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UKr43af9ap4edm43mmtq01oddj6` (`username`),
  UNIQUE KEY `UK6dotkott2kjsp8vw4d0m25fb7` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'billing@gmail.com','$2a$10$WsN3tI/7SY7csXbPsuOyKuvOnjjF9wbnM4yrtPo/34Xk5XN5ojV/m','billing'),(2,'test@example.com','$2a$10$P2ctJDF/0UFYUMjR1GrHyOrCiL700iTS5KfOXB82SDhEL7RttKZLO','testaccount'),(3,'billinaccount@gmail.com','$2a$10$PpLl/I.HBDbqwGbioXPBCe9polIhFbVZVTGaNWddKd5GwQ8BxXA.u','billingaccount'),(4,'testaccount123@gmail.com','$2a$10$vcB4y3bf6lc.PzbWr4fwEuMED5xhfd/dV9mwaGVSSTdyWytRqGsoa','testaccount123'),(5,'frontend@gmail.com','$2a$10$CUpp945/2cIMaCcp5RLWleqcjQgShAMbuk1QstMcvWiSCVtXTdDD.','frontendaccount'),(6,'infrahive@gmail.com','$2a$10$N0/CsIDg9y6cq/CI3yEyKO6Oo4Rb0ZHR0Ygniq424O0f0FhfA51mW','infra-hive'),(7,'testuser@gmail.com','$2a$10$hsbwV4sU5vLRsfRuXCdwGuBBjLWzFiPNQdJlpnIQiu0B7NrE1oW6a','testuser');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'subscriberDB'
--

--
-- Dumping routines for database 'subscriberDB'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-06-23  9:55:17
