-- MySQL dump 10.13  Distrib 8.0.42, for Linux (x86_64)
--
-- Host: 10.160.0.64    Database: hiveDB
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
-- Table structure for table `cebu_subs_network_info`
--

DROP TABLE IF EXISTS `cebu_subs_network_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cebu_subs_network_info` (
  `account_no` varchar(100) DEFAULT NULL,
  `new_account_no` varchar(100) DEFAULT NULL,
  `mac_address` varchar(50) DEFAULT NULL,
  `ip_address` varchar(50) DEFAULT NULL,
  `olt_name` varchar(100) DEFAULT NULL,
  `olt_ip` varchar(50) DEFAULT NULL,
  `olt_interface` varchar(50) DEFAULT NULL,
  `upstream` varchar(50) DEFAULT NULL,
  `downstream` varchar(50) DEFAULT NULL,
  `package` varchar(50) DEFAULT NULL,
  `package_profile` varchar(50) DEFAULT NULL,
  `vlan` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cidr_block`
--

DROP TABLE IF EXISTS `cidr_block`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cidr_block` (
  `cidr_id` bigint NOT NULL AUTO_INCREMENT,
  `broadcast_address` varchar(255) NOT NULL,
  `cidr_block` varchar(255) NOT NULL,
  `default_gateway` varchar(255) NOT NULL,
  `network_address` varchar(255) NOT NULL,
  `network_name` varchar(255) DEFAULT NULL,
  `network_type` varchar(255) DEFAULT NULL,
  `vlan_id` varchar(255) DEFAULT NULL,
  `site_location` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`cidr_id`),
  UNIQUE KEY `broadcast_address` (`broadcast_address`),
  UNIQUE KEY `cidr_block` (`cidr_block`),
  UNIQUE KEY `default_gateway` (`default_gateway`),
  UNIQUE KEY `network_address` (`network_address`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cidr_ipaddress`
--

DROP TABLE IF EXISTS `cidr_ipaddress`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cidr_ipaddress` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `accountNumber` varchar(255) DEFAULT NULL,
  `ipAddress` varchar(255) DEFAULT NULL,
  `networkAddress` varchar(255) DEFAULT NULL,
  `notes` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `vlanId` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4353 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

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
  `monitoring_status` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_equiwa2b306v6c4vc0ldd6mqp` (`ip_assigned`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

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
-- Table structure for table `hive_device_info`
--

DROP TABLE IF EXISTS `hive_device_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hive_device_info` (
  `id` int NOT NULL AUTO_INCREMENT,
  `device_name` varchar(100) DEFAULT NULL,
  `device_ip` varchar(45) DEFAULT NULL,
  `device_type` varchar(50) DEFAULT NULL,
  `node` varchar(50) DEFAULT NULL,
  `location` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

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
  UNIQUE KEY `package_type` (`package_type`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

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
  UNIQUE KEY `account_Number` (`account_Number`),
  UNIQUE KEY `ip_assigned` (`ip_assigned`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `site_olt`
--

DROP TABLE IF EXISTS `site_olt`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `site_olt` (
  `olt_id` bigint NOT NULL AUTO_INCREMENT,
  `olt_ipaddress` varchar(255) NOT NULL,
  `olt_name` varchar(255) NOT NULL,
  `olt_network_site` varchar(255) DEFAULT NULL,
  `olt_type` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`olt_id`),
  UNIQUE KEY `olt_ipaddress` (`olt_ipaddress`),
  UNIQUE KEY `olt_name` (`olt_name`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

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
  KEY `role_id` (`role_id`),
  CONSTRAINT `FK_user_roles_role` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`),
  CONSTRAINT `FK_user_roles_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

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
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `vlan_info`
--

DROP TABLE IF EXISTS `vlan_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vlan_info` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `account_no` varchar(255) NOT NULL,
  `location` varchar(255) NOT NULL,
  `vlan_id` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping events for database 'hiveDB'
--

--
-- Dumping routines for database 'hiveDB'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-06-23  9:53:19
