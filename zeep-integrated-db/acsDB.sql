-- MySQL dump 10.13  Distrib 8.0.42, for Linux (x86_64)
--
-- Host: 10.160.0.62    Database: acsDB
-- ------------------------------------------------------
-- Server version	8.0.41

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
-- Table structure for table `auto_complete`
--

DROP TABLE IF EXISTS `auto_complete`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auto_complete` (
  `id` int NOT NULL,
  `command` text CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci,
  `device_model` varchar(255) DEFAULT NULL,
  `suggestion_list` longblob,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `client_list`
--

DROP TABLE IF EXISTS `client_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `client_list` (
  `id` bigint NOT NULL,
  `band` varchar(255) DEFAULT NULL,
  `down` varchar(255) DEFAULT NULL,
  `ip` varchar(255) DEFAULT NULL,
  `macc` varchar(255) DEFAULT NULL,
  `manufacturer` varchar(255) DEFAULT NULL,
  `os` varchar(255) DEFAULT NULL,
  `rssi` varchar(255) DEFAULT NULL,
  `serial_num` varchar(255) DEFAULT NULL,
  `ssid` varchar(255) DEFAULT NULL,
  `traffic` varchar(255) DEFAULT NULL,
  `up` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cpe_response_log`
--

DROP TABLE IF EXISTS `cpe_response_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cpe_response_log` (
  `id` bigint NOT NULL,
  `method` varchar(255) DEFAULT NULL,
  `payload` text,
  `serial_num` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `device`
--

DROP TABLE IF EXISTS `device`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `device` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `activated` bit(1) DEFAULT NULL,
  `date_created` varchar(255) DEFAULT NULL,
  `date_modified` varchar(255) DEFAULT NULL,
  `device_name` varchar(255) DEFAULT NULL,
  `location` varchar(255) DEFAULT NULL,
  `mac_address` varchar(255) DEFAULT NULL,
  `model` varchar(255) DEFAULT NULL,
  `parent` varchar(255) DEFAULT NULL,
  `serial_number` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT 'offline',
  `date_offline` varchar(255) DEFAULT NULL,
  `device_type` varchar(255) DEFAULT NULL,
  `second_wan_mac` varchar(255) DEFAULT NULL,
  `wan_ip` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16827 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `device_logs`
--

DROP TABLE IF EXISTS `device_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `device_logs` (
  `id` bigint NOT NULL,
  `offtime` varchar(255) DEFAULT NULL,
  `ontime` varchar(255) DEFAULT NULL,
  `reason` varchar(255) DEFAULT NULL,
  `serial_num` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `update_time` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `device_model_parameters`
--

DROP TABLE IF EXISTS `device_model_parameters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `device_model_parameters` (
  `id` bigint NOT NULL,
  `con_req_url_parameter` varchar(255) DEFAULT NULL,
  `hardware_ver_parameter` varchar(255) DEFAULT NULL,
  `mac_address_parameter` varchar(255) DEFAULT NULL,
  `management_ip_parameter` varchar(255) DEFAULT NULL,
  `public_ip_parameter` varchar(255) DEFAULT NULL,
  `second_wan_mac` varchar(255) DEFAULT NULL,
  `software_ver_parameter` varchar(255) DEFAULT NULL,
  `udp_con_req_url_parameter` varchar(255) DEFAULT NULL,
  `manufacturer` varchar(255) NOT NULL,
  `model` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `device_traffic_24h`
--

DROP TABLE IF EXISTS `device_traffic_24h`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `device_traffic_24h` (
  `id` bigint NOT NULL,
  `date` varchar(255) DEFAULT NULL,
  `rx` int DEFAULT NULL,
  `serial_num` varchar(255) DEFAULT NULL,
  `time` varchar(255) DEFAULT NULL,
  `tx` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `device_traffic_daily`
--

DROP TABLE IF EXISTS `device_traffic_daily`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `device_traffic_daily` (
  `id` bigint NOT NULL,
  `date` varchar(255) DEFAULT NULL,
  `rx` int DEFAULT NULL,
  `serial_num` varchar(255) DEFAULT NULL,
  `tx` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `devices`
--

DROP TABLE IF EXISTS `devices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `devices` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `serial_num` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `model` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `manufacturer` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `oui` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `hardware_ver` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `root_fs_ver` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `firmware_ver` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `ap_mode` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `mac_address` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `os_type` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `host_name` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `max_users` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `ip` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `last_reboot` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `last_boot` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `root_data_model` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `web_auth` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `group_path` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `udp_con_req_url` varchar(255) DEFAULT NULL,
  `con_req_url` varchar(255) DEFAULT NULL,
  `cpu_usage` varchar(255) DEFAULT NULL,
  `cwmp_cycle_end` bit(1) DEFAULT NULL,
  `device_alias` varchar(255) DEFAULT NULL,
  `management_ip` varchar(255) DEFAULT NULL,
  `memory_usage` varchar(255) DEFAULT NULL,
  `public_ip` varchar(255) DEFAULT NULL,
  `software_ver` varchar(255) DEFAULT NULL,
  `ssids` varchar(255) DEFAULT NULL,
  `second_wan_mac` varchar(255) DEFAULT NULL,
  `apMode` varchar(255) DEFAULT NULL,
  `conReqUrl` varchar(255) DEFAULT NULL,
  `cpuUsage` varchar(255) DEFAULT NULL,
  `cwmpCycleEnd` bit(1) DEFAULT NULL,
  `deviceAlias` varchar(255) DEFAULT NULL,
  `firmwareVer` varchar(255) DEFAULT NULL,
  `groupPath` varchar(255) DEFAULT NULL,
  `hardwareVer` varchar(255) DEFAULT NULL,
  `hostName` varchar(255) DEFAULT NULL,
  `lastBoot` varchar(255) DEFAULT NULL,
  `lastReboot` varchar(255) DEFAULT NULL,
  `macAddress` varchar(255) DEFAULT NULL,
  `managementIp` varchar(255) DEFAULT NULL,
  `maxUsers` varchar(255) DEFAULT NULL,
  `memoryUsage` varchar(255) DEFAULT NULL,
  `osType` varchar(255) DEFAULT NULL,
  `publicIp` varchar(255) DEFAULT NULL,
  `rootDataModel` varchar(255) DEFAULT NULL,
  `rootFsVer` varchar(255) DEFAULT NULL,
  `secondWanMac` varchar(255) DEFAULT NULL,
  `serialNum` varchar(255) DEFAULT NULL,
  `softwareVer` varchar(255) DEFAULT NULL,
  `udpConReqUrl` varchar(255) DEFAULT NULL,
  `webAuth` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16747 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `group_command`
--

DROP TABLE IF EXISTS `group_command`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `group_command` (
  `id` bigint NOT NULL,
  `command` text,
  `description` varchar(255) DEFAULT NULL,
  `model` varchar(255) DEFAULT NULL,
  `parent` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `group_ssid`
--

DROP TABLE IF EXISTS `group_ssid`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `group_ssid` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `auth` bit(1) DEFAULT NULL,
  `downlink` int DEFAULT NULL,
  `encryption_mode` varchar(255) DEFAULT NULL,
  `forward_mode` varchar(255) DEFAULT NULL,
  `gateway_id` varchar(255) DEFAULT NULL,
  `limitless` bit(1) DEFAULT NULL,
  `parent` varchar(255) DEFAULT NULL,
  `portal_ip` varchar(255) DEFAULT NULL,
  `portal_url` varchar(255) DEFAULT NULL,
  `seamless` bit(1) DEFAULT NULL,
  `ssid` varchar(255) DEFAULT NULL,
  `uplink` int DEFAULT NULL,
  `vlan_id` int DEFAULT NULL,
  `wlan_id` int DEFAULT NULL,
  `passphrase` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16409 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `groups`
--

DROP TABLE IF EXISTS `groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `groups` (
  `id` bigint NOT NULL,
  `child` varchar(255) DEFAULT NULL,
  `date_created` varchar(255) DEFAULT NULL,
  `date_modified` varchar(255) DEFAULT NULL,
  `parent` varchar(255) DEFAULT NULL,
  `site` varchar(255) DEFAULT NULL,
  `location` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `group_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `hibernate_sequence`
--

DROP TABLE IF EXISTS `hibernate_sequence`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hibernate_sequence` (
  `next_val` bigint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `httprequestlog`
--

DROP TABLE IF EXISTS `httprequestlog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `httprequestlog` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `cookie` varchar(255) DEFAULT NULL,
  `last_request` datetime(6) DEFAULT NULL,
  `serial_num` varchar(255) DEFAULT NULL,
  `device_status` varchar(255) DEFAULT NULL,
  `lastRequest` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16782 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `radio_info`
--

DROP TABLE IF EXISTS `radio_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `radio_info` (
  `id` bigint NOT NULL,
  `bandWidth` varchar(255) DEFAULT NULL,
  `channel` varchar(255) DEFAULT NULL,
  `gatherTime` varchar(255) DEFAULT NULL,
  `power` varchar(255) DEFAULT NULL,
  `radioIndex` varchar(255) DEFAULT NULL,
  `sn` varchar(255) DEFAULT NULL,
  `uploadTime` varchar(255) DEFAULT NULL,
  `utilization` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `taskhandler`
--

DROP TABLE IF EXISTS `taskhandler`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `taskhandler` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `method` varchar(255) DEFAULT NULL,
  `optional` varchar(255) DEFAULT NULL,
  `parameters` text,
  `serial_num` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16828 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `webcli_response_log`
--

DROP TABLE IF EXISTS `webcli_response_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `webcli_response_log` (
  `id` bigint NOT NULL,
  `command_output` blob,
  `command_used` blob,
  `device_sn` varchar(255) DEFAULT NULL,
  `time_saved` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping events for database 'acsDB'
--

--
-- Dumping routines for database 'acsDB'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-06-23 10:01:39
