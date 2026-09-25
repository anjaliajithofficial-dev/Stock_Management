-- MySQL dump 10.13  Distrib 9.1.0, for Win64 (x86_64)
--
-- Host: localhost    Database: college_stock_db
-- ------------------------------------------------------
-- Server version	9.1.0

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
-- Table structure for table `activity_logs`
--

DROP TABLE IF EXISTS `activity_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `activity_logs` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int DEFAULT NULL,
  `action` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ip_address` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `idx_activity_user_date` (`user_id`,`created_at`),
  CONSTRAINT `activity_logs_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `activity_logs`
--

LOCK TABLES `activity_logs` WRITE;
/*!40000 ALTER TABLE `activity_logs` DISABLE KEYS */;
INSERT INTO `activity_logs` VALUES (1,1,'Imported stationary and printing workbook items; old sample item master archived','localhost','2026-06-07 11:05:42'),(2,6,'Logged in','::1','2026-09-20 05:28:54'),(3,6,'Created request REQ-20260920-DEC04D','::1','2026-09-20 05:29:43'),(4,6,'Exported request PDF REQ-20260920-DEC04D','::1','2026-09-20 05:29:47'),(5,6,'Logged out','::1','2026-09-20 05:30:13'),(6,1,'Logged in','::1','2026-09-20 05:30:36'),(7,1,'Logged out','::1','2026-09-20 05:37:13'),(8,2,'Logged in','::1','2026-09-20 05:37:19'),(9,2,'Consolidated all pending requests into ID 36','::1','2026-09-20 05:43:26'),(10,2,'Logged out','::1','2026-09-20 05:44:41'),(11,1,'Logged in','::1','2026-09-20 05:44:50'),(12,1,'Exported request PDF REQ-20260920-888559','::1','2026-09-20 05:45:14'),(13,1,'GSSSR PARTIALLY_APPROVED_BY_GSSSR request ID 36','::1','2026-09-20 05:45:37'),(14,1,'Logged out','::1','2026-09-20 05:46:07'),(15,2,'Logged in','::1','2026-09-20 05:46:13'),(16,2,'IETW distributed and issued stock for consolidated request ID 36','::1','2026-09-20 06:02:42'),(17,2,'IETW exported stock report','::1','2026-09-20 06:03:03'),(18,2,'Exported PDF report stockbook for Current_month','::1','2026-09-20 06:03:27'),(19,2,'Logged out','::1','2026-09-20 06:03:52'),(20,6,'Logged in','::1','2026-09-20 06:04:03'),(21,1,'Logged in','::1','2026-09-24 09:39:08'),(22,1,'GSSSR created a manual backup','::1','2026-09-24 09:51:46'),(23,1,'GSSSR created a manual backup','::1','2026-09-24 10:02:17'),(24,1,'GSSSR deleted a backup: uploads_20260924_152146.zip','::1','2026-09-24 10:02:22'),(25,1,'GSSSR deleted a backup: db_20260924_152146.sql','::1','2026-09-24 10:02:24'),(26,1,'GSSSR deleted a backup: db_20260924_152146.sql','::1','2026-09-24 10:03:55'),(27,1,'GSSSR deleted a backup: db_20260924_152146.sql','::1','2026-09-24 10:04:00'),(28,1,'GSSSR created a manual backup','::1','2026-09-24 10:04:02'),(29,1,'GSSSR deleted a backup: db_20260924_153402.sql','::1','2026-09-24 10:12:00'),(30,1,'GSSSR deleted a backup: db_20260924_153402.sql','::1','2026-09-24 10:12:04'),(31,1,'GSSSR deleted a backup: uploads_20260924_153402.zip','::1','2026-09-24 10:12:07'),(32,1,'GSSSR deleted a backup: db_20260924_153217.sql','::1','2026-09-24 10:12:10'),(33,1,'GSSSR deleted a backup: uploads_20260924_153217.zip','::1','2026-09-24 10:12:12'),(34,1,'GSSSR created a manual backup','::1','2026-09-24 10:12:14'),(35,1,'Logged in','::1','2026-09-25 08:41:10'),(36,1,'GSSSR created a manual backup','::1','2026-09-25 08:44:08'),(37,1,'GSSSR deleted a backup: db_20260925_141408.sql','::1','2026-09-25 08:45:55'),(38,1,'GSSSR deleted a backup: uploads_20260925_141408.zip','::1','2026-09-25 08:45:58'),(39,1,'GSSSR deleted a backup: db_20260924_154214.sql','::1','2026-09-25 08:46:01'),(40,1,'GSSSR deleted a backup: uploads_20260924_154214.zip','::1','2026-09-25 08:46:06');
/*!40000 ALTER TABLE `activity_logs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categories` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (1,'Stationary','Office and academic stationery','2026-06-07 11:05:31'),(2,'Housekeeping','Imported from stationary and printing workbook','2026-06-07 11:05:31'),(3,'Electrical','Electrical stock and fixtures','2026-06-07 11:05:31'),(4,'Electronics & Lab','Lab equipment and consumables','2026-06-07 11:05:31'),(5,'Computer & IT','Computer peripherals and IT supplies','2026-06-07 11:05:31'),(6,'Furniture','Tables, chairs, cabinets and fixtures','2026-06-07 11:05:31'),(7,'Pooja Items','Imported from stationary and printing workbook','2026-06-07 11:05:31'),(8,'Others','Miscellaneous stock','2026-06-07 11:05:31'),(9,'Printing','Imported from stationary and printing workbook','2026-06-07 11:05:41'),(10,'Stationery','Imported from stationary and printing workbook','2026-06-07 11:05:41');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `department_inventory`
--

DROP TABLE IF EXISTS `department_inventory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `department_inventory` (
  `department_id` int NOT NULL,
  `item_id` int NOT NULL,
  `quantity` decimal(12,2) NOT NULL DEFAULT '0.00',
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`department_id`,`item_id`),
  KEY `item_id` (`item_id`),
  CONSTRAINT `department_inventory_ibfk_1` FOREIGN KEY (`department_id`) REFERENCES `departments` (`id`),
  CONSTRAINT `department_inventory_ibfk_2` FOREIGN KEY (`item_id`) REFERENCES `items` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `department_inventory`
--

LOCK TABLES `department_inventory` WRITE;
/*!40000 ALTER TABLE `department_inventory` DISABLE KEYS */;
INSERT INTO `department_inventory` VALUES (4,163,2.00,NULL),(4,197,3.00,NULL);
/*!40000 ALTER TABLE `department_inventory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `departments`
--

DROP TABLE IF EXISTS `departments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `departments` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  UNIQUE KEY `code` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `departments`
--

LOCK TABLES `departments` WRITE;
/*!40000 ALTER TABLE `departments` DISABLE KEYS */;
INSERT INTO `departments` VALUES (1,'Computer Science and Engineering','CSE','2026-06-07 11:05:31'),(2,'Electronics and Communication Engineering','ECE','2026-06-07 11:05:31'),(3,'Electrical and Electronics Engineering','EEE','2026-06-07 11:05:31'),(4,'Artificial Intelligence and Machine Learning','AIML','2026-06-07 11:05:31'),(5,'Artificial Intelligence and Data Science','AIDS','2026-06-07 11:05:31'),(6,'Information Science and Engineering','ISE','2026-06-07 11:05:31'),(7,'Central Administrative Cell','CAC','2026-06-07 11:05:31'),(8,'Administration','ADMIN','2026-06-07 11:05:31');
/*!40000 ALTER TABLE `departments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `excel_import_logs`
--

DROP TABLE IF EXISTS `excel_import_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `excel_import_logs` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int DEFAULT NULL,
  `file_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `action_type` enum('IMPORT','EXPORT') COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('SUCCESS','FAILED') COLLATE utf8mb4_unicode_ci NOT NULL,
  `rows_processed` int NOT NULL DEFAULT '0',
  `remarks` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `excel_import_logs_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `excel_import_logs`
--

LOCK TABLES `excel_import_logs` WRITE;
/*!40000 ALTER TABLE `excel_import_logs` DISABLE KEYS */;
INSERT INTO `excel_import_logs` VALUES (1,2,'ietw_stock_20260920_113303.xlsx','EXPORT','SUCCESS',0,'IETW stock','2026-09-20 06:03:03');
/*!40000 ALTER TABLE `excel_import_logs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `invoices`
--

DROP TABLE IF EXISTS `invoices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `invoices` (
  `id` int NOT NULL AUTO_INCREMENT,
  `item_id` int DEFAULT NULL,
  `invoice_no` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `file_path` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `uploaded_by` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `item_id` (`item_id`),
  KEY `uploaded_by` (`uploaded_by`),
  CONSTRAINT `invoices_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `items` (`id`),
  CONSTRAINT `invoices_ibfk_2` FOREIGN KEY (`uploaded_by`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `invoices`
--

LOCK TABLES `invoices` WRITE;
/*!40000 ALTER TABLE `invoices` DISABLE KEYS */;
/*!40000 ALTER TABLE `invoices` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `items`
--

DROP TABLE IF EXISTS `items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `items` (
  `id` int NOT NULL AUTO_INCREMENT,
  `item_code` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `item_name` varchar(180) COLLATE utf8mb4_unicode_ci NOT NULL,
  `category_id` int NOT NULL,
  `quantity` decimal(12,2) NOT NULL DEFAULT '0.00',
  `unit` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Nos',
  `unit_price` decimal(12,2) NOT NULL DEFAULT '0.00',
  `minimum_stock` decimal(12,2) NOT NULL DEFAULT '0.00',
  `storage_location` varchar(160) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `status` enum('ACTIVE','INACTIVE') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'ACTIVE',
  `archive_reason` text COLLATE utf8mb4_unicode_ci,
  `archived_by` int DEFAULT NULL,
  `archived_at` datetime DEFAULT NULL,
  `deletion_approval_status` enum('NOT_REQUESTED','PENDING_GSSSR','APPROVED_BY_GSSSR','REJECTED_BY_GSSSR') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'NOT_REQUESTED',
  `invoice_path` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `item_code` (`item_code`),
  KEY `idx_items_category` (`category_id`),
  KEY `idx_items_low_stock` (`quantity`,`minimum_stock`),
  KEY `created_by` (`created_by`),
  KEY `archived_by` (`archived_by`),
  CONSTRAINT `items_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`),
  CONSTRAINT `items_ibfk_2` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`),
  CONSTRAINT `items_ibfk_3` FOREIGN KEY (`archived_by`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=199 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `items`
--

LOCK TABLES `items` WRITE;
/*!40000 ALTER TABLE `items` DISABLE KEYS */;
INSERT INTO `items` VALUES (1,'ST-A4-001','A4 Sheets Bundle',1,50.00,'Bundle',280.00,10.00,'Store Room A','Printer and office paper','ACTIVE',NULL,NULL,NULL,'NOT_REQUESTED',NULL,1,'2026-06-07 11:05:32','2026-06-07 11:05:41','2026-06-07 11:05:41'),(2,'HK-PH-001','Phenyl Can',2,12.00,'Can',180.00,5.00,'Housekeeping Rack','Floor cleaning liquid','ACTIVE',NULL,NULL,NULL,'NOT_REQUESTED',NULL,1,'2026-06-07 11:05:32','2026-06-07 11:05:41','2026-06-07 11:05:41'),(3,'EL-BL-001','LED Bulb 12W',3,40.00,'Nos',95.00,10.00,'Electrical Shelf','Replacement bulbs','ACTIVE',NULL,NULL,NULL,'NOT_REQUESTED',NULL,1,'2026-06-07 11:05:32','2026-06-07 11:05:41','2026-06-07 11:05:41'),(4,'LAB-ARD-001','Arduino Kit',4,8.00,'Kit',1450.00,3.00,'CSE Lab Store','Microcontroller kit','ACTIVE',NULL,NULL,NULL,'NOT_REQUESTED',NULL,1,'2026-06-07 11:05:32','2026-06-07 11:05:41','2026-06-07 11:05:41'),(5,'IT-MSE-001','USB Optical Mouse',5,25.00,'Nos',350.00,8.00,'IT Store','Computer peripheral','ACTIVE',NULL,NULL,NULL,'NOT_REQUESTED',NULL,1,'2026-06-07 11:05:32','2026-06-07 11:05:41','2026-06-07 11:05:41'),(6,'FUR-CHR-001','Classroom Chair',6,60.00,'Nos',750.00,10.00,'Furniture Bay','Student chair','ACTIVE',NULL,NULL,NULL,'NOT_REQUESTED',NULL,1,'2026-06-07 11:05:32','2026-06-07 11:05:41','2026-06-07 11:05:41'),(7,'PRINT-001','Attendance register 8 sheets',9,9.00,'01 Book.',0.00,1.00,'Printing Store','Imported stock as on 08.07.2025 from stationary and printing (1).xlsx','ACTIVE',NULL,NULL,NULL,'NOT_REQUESTED',NULL,1,'2026-06-07 11:05:41',NULL,NULL),(8,'PRINT-002','Attendance register 12 sheets',9,125.00,'01 Book',0.00,12.00,'Printing Store','Imported stock as on 08.07.2025 from stationary and printing (1).xlsx','ACTIVE',NULL,NULL,NULL,'NOT_REQUESTED',NULL,1,'2026-06-07 11:05:41',NULL,NULL),(9,'PRINT-003','Attendance register - Lab',9,28.00,'01 Book',0.00,2.00,'Printing Store','Imported stock as on 08.07.2025 from stationary and printing (1).xlsx','ACTIVE',NULL,NULL,NULL,'NOT_REQUESTED',NULL,1,'2026-06-07 11:05:41',NULL,NULL),(10,'PRINT-004','Application - Engineering',9,300.00,'01 No.',0.00,30.00,'Printing Store','Imported stock as on 08.07.2025 from stationary and printing (1).xlsx','ACTIVE',NULL,NULL,NULL,'NOT_REQUESTED',NULL,1,'2026-06-07 11:05:41',NULL,NULL),(11,'PRINT-005','Application - MBA',9,30.00,'01 No.',0.00,3.00,'Printing Store','Imported stock as on 08.07.2025 from stationary and printing (1).xlsx','ACTIVE',NULL,NULL,NULL,'NOT_REQUESTED',NULL,1,'2026-06-07 11:05:41',NULL,NULL),(12,'PRINT-006','Application - M.tech',9,90.00,'01 No.',0.00,9.00,'Printing Store','Imported stock as on 08.07.2025 from stationary and printing (1).xlsx','ACTIVE',NULL,NULL,NULL,'NOT_REQUESTED',NULL,1,'2026-06-07 11:05:41',NULL,NULL),(13,'PRINT-007','Application - Hostel',9,1000.00,'01 No.',0.00,100.00,'Printing Store','Imported stock as on 08.07.2025 from stationary and printing (1).xlsx','ACTIVE',NULL,NULL,NULL,'NOT_REQUESTED',NULL,1,'2026-06-07 11:05:41',NULL,NULL),(14,'PRINT-008','Application - Phd',9,70.00,'01 No.',0.00,7.00,'Printing Store','Imported stock as on 08.07.2025 from stationary and printing (1).xlsx','ACTIVE',NULL,NULL,NULL,'NOT_REQUESTED',NULL,1,'2026-06-07 11:05:41',NULL,NULL),(15,'PRINT-009','Bus pass - student',9,140.00,'01 No.',0.00,14.00,'Printing Store','Imported stock as on 08.07.2025 from stationary and printing (1).xlsx','ACTIVE',NULL,NULL,NULL,'NOT_REQUESTED',NULL,1,'2026-06-07 11:05:41',NULL,NULL),(16,'PRINT-010','Calendar',9,0.00,'01 No.',0.00,1.00,'Printing Store','Imported stock as on 08.07.2025 from stationary and printing (1).xlsx','ACTIVE',NULL,NULL,NULL,'NOT_REQUESTED',NULL,1,'2026-06-07 11:05:41',NULL,NULL),(17,'PRINT-011','Document file - Zip folder',9,9.00,'01 No.',0.00,1.00,'Printing Store','Imported stock as on 08.07.2025 from stationary and printing (1).xlsx','ACTIVE',NULL,NULL,NULL,'NOT_REQUESTED',NULL,1,'2026-06-07 11:05:41',NULL,NULL),(18,'PRINT-012','Dairy',9,99.00,'01 Book',0.00,9.00,'Printing Store','Imported stock as on 08.07.2025 from stationary and printing (1).xlsx','ACTIVE',NULL,NULL,NULL,'NOT_REQUESTED',NULL,1,'2026-06-07 11:05:41',NULL,NULL),(19,'PRINT-013','Multicolour tags',9,545.00,'01 No.',0.00,54.00,'Printing Store','Imported stock as on 08.07.2025 from stationary and printing (1).xlsx','ACTIVE',NULL,NULL,NULL,'NOT_REQUESTED',NULL,1,'2026-06-07 11:05:41',NULL,NULL),(20,'PRINT-014','Jute folder',9,115.00,'01 No.',0.00,11.00,'Printing Store','Imported stock as on 08.07.2025 from stationary and printing (1).xlsx','ACTIVE',NULL,NULL,NULL,'NOT_REQUESTED',NULL,1,'2026-06-07 11:05:41',NULL,NULL),(21,'PRINT-015','Assignment books',9,442.00,'01 Book',0.00,44.00,'Printing Store','Imported stock as on 08.07.2025 from stationary and printing (1).xlsx','ACTIVE',NULL,NULL,NULL,'NOT_REQUESTED',NULL,1,'2026-06-07 11:05:41',NULL,NULL),(22,'PRINT-016','Blue books - UG',9,521.00,'01 Book',0.00,52.00,'Printing Store','Imported stock as on 08.07.2025 from stationary and printing (1).xlsx','ACTIVE',NULL,NULL,NULL,'NOT_REQUESTED',NULL,1,'2026-06-07 11:05:41',NULL,NULL),(23,'PRINT-017','Blue books - MBA',9,130.00,'01 Book',0.00,13.00,'Printing Store','Imported stock as on 08.07.2025 from stationary and printing (1).xlsx','ACTIVE',NULL,NULL,NULL,'NOT_REQUESTED',NULL,1,'2026-06-07 11:05:41',NULL,NULL),(24,'PRINT-018','Cash voucher book',9,1.00,'01 Book',0.00,1.00,'Printing Store','Imported stock as on 08.07.2025 from stationary and printing (1).xlsx','ACTIVE',NULL,NULL,NULL,'NOT_REQUESTED',NULL,1,'2026-06-07 11:05:41',NULL,NULL),(25,'PRINT-019','CAED sketch book- EEE',9,6.00,'01 Book',0.00,1.00,'Printing Store','Imported stock as on 08.07.2025 from stationary and printing (1).xlsx','ACTIVE',NULL,NULL,NULL,'NOT_REQUESTED',NULL,1,'2026-06-07 11:05:41',NULL,NULL),(26,'PRINT-020','CAED blue book',9,0.00,'01 Book',0.00,1.00,'Printing Store','Imported stock as on 08.07.2025 from stationary and printing (1).xlsx','ACTIVE',NULL,NULL,NULL,'NOT_REQUESTED',NULL,1,'2026-06-07 11:05:41',NULL,NULL),(27,'PRINT-021','EGDL sketch book- Mechanical',9,75.00,'01 Book',0.00,7.00,'Printing Store','Imported stock as on 08.07.2025 from stationary and printing (1).xlsx','ACTIVE',NULL,NULL,NULL,'NOT_REQUESTED',NULL,1,'2026-06-07 11:05:41',NULL,NULL),(28,'PRINT-022','EGDL blue book- Mechanical',9,50.00,'01 Book',0.00,5.00,'Printing Store','Imported stock as on 08.07.2025 from stationary and printing (1).xlsx','ACTIVE',NULL,NULL,NULL,'NOT_REQUESTED',NULL,1,'2026-06-07 11:05:41',NULL,NULL),(29,'PRINT-023','Manual - Physics',9,0.00,'01 Book',0.00,1.00,'Printing Store','Imported stock as on 08.07.2025 from stationary and printing (1).xlsx','ACTIVE',NULL,NULL,NULL,'NOT_REQUESTED',NULL,1,'2026-06-07 11:05:41',NULL,NULL),(30,'PRINT-024','Manual - Chemistry',9,7.00,'01 Book',0.00,1.00,'Printing Store','Imported stock as on 08.07.2025 from stationary and printing (1).xlsx','ACTIVE',NULL,NULL,NULL,'NOT_REQUESTED',NULL,1,'2026-06-07 11:05:41',NULL,NULL),(31,'PRINT-025','Material gate pass',9,8.00,'01 Book',0.00,1.00,'Printing Store','Imported stock as on 08.07.2025 from stationary and printing (1).xlsx','ACTIVE',NULL,NULL,NULL,'NOT_REQUESTED',NULL,1,'2026-06-07 11:05:41',NULL,NULL),(32,'PRINT-026','Department No due slip',9,4.00,'01 Book',0.00,1.00,'Printing Store','Imported stock as on 08.07.2025 from stationary and printing (1).xlsx','ACTIVE',NULL,NULL,NULL,'NOT_REQUESTED',NULL,1,'2026-06-07 11:05:41',NULL,NULL),(33,'PRINT-027','Practical record',9,126.00,'01 Book',0.00,12.00,'Printing Store','Imported stock as on 08.07.2025 from stationary and printing (1).xlsx','ACTIVE',NULL,NULL,NULL,'NOT_REQUESTED',NULL,1,'2026-06-07 11:05:41',NULL,NULL),(34,'PRINT-028','Foldable bags',9,6.00,'01 No.',0.00,1.00,'Printing Store','Imported stock as on 08.07.2025 from stationary and printing (1).xlsx','ACTIVE',NULL,NULL,NULL,'NOT_REQUESTED',NULL,1,'2026-06-07 11:05:41',NULL,NULL),(35,'PRINT-029','Go green bags',9,2768.00,'01 No.',0.00,276.00,'Printing Store','Imported stock as on 08.07.2025 from stationary and printing (1).xlsx','ACTIVE',NULL,NULL,NULL,'NOT_REQUESTED',NULL,1,'2026-06-07 11:05:41',NULL,NULL),(36,'PRINT-030','Jute conference bags',9,0.00,'01 No.',0.00,1.00,'Printing Store','Imported stock as on 08.07.2025 from stationary and printing (1).xlsx','ACTIVE',NULL,NULL,NULL,'NOT_REQUESTED',NULL,1,'2026-06-07 11:05:41',NULL,NULL),(37,'PRINT-031','Letterhead - Engineering',9,400.00,'01 No.',0.00,40.00,'Printing Store','Imported stock as on 08.07.2025 from stationary and printing (1).xlsx','ACTIVE',NULL,NULL,NULL,'NOT_REQUESTED',NULL,1,'2026-06-07 11:05:41',NULL,NULL),(38,'PRINT-032','Pamphlets',9,9000.00,'01 No.',0.00,900.00,'Printing Store','Imported stock as on 08.07.2025 from stationary and printing (1).xlsx','ACTIVE',NULL,NULL,NULL,'NOT_REQUESTED',NULL,1,'2026-06-07 11:05:41',NULL,NULL),(39,'PRINT-033','Posters',9,0.00,'01 No.',0.00,1.00,'Printing Store','Imported stock as on 08.07.2025 from stationary and printing (1).xlsx','ACTIVE',NULL,NULL,NULL,'NOT_REQUESTED',NULL,1,'2026-06-07 11:05:41',NULL,NULL),(40,'PRINT-034','Receipt book - Application',9,11.00,'01 Book',0.00,1.00,'Printing Store','Imported stock as on 08.07.2025 from stationary and printing (1).xlsx','ACTIVE',NULL,NULL,NULL,'NOT_REQUESTED',NULL,1,'2026-06-07 11:05:41',NULL,NULL),(41,'PRINT-035','Receipt book - Miscellneous',9,0.00,'01 Book',0.00,1.00,'Printing Store','Imported stock as on 08.07.2025 from stationary and printing (1).xlsx','ACTIVE',NULL,NULL,NULL,'NOT_REQUESTED',NULL,1,'2026-06-07 11:05:41',NULL,NULL),(42,'PRINT-036','Rubber stamp - Seal',9,0.00,'01 No.',0.00,1.00,'Printing Store','Imported stock as on 08.07.2025 from stationary and printing (1).xlsx','ACTIVE',NULL,NULL,NULL,'NOT_REQUESTED',NULL,1,'2026-06-07 11:05:41',NULL,NULL),(43,'PRINT-037','Spring file - yellow colour',9,350.00,'01 No.',0.00,35.00,'Printing Store','Imported stock as on 08.07.2025 from stationary and printing (1).xlsx','ACTIVE',NULL,NULL,NULL,'NOT_REQUESTED',NULL,1,'2026-06-07 11:05:41',NULL,NULL),(44,'PRINT-038','Visiting card - Principal',9,0.00,'01 No.',0.00,1.00,'Printing Store','Imported stock as on 08.07.2025 from stationary and printing (1).xlsx','ACTIVE',NULL,NULL,NULL,'NOT_REQUESTED',NULL,1,'2026-06-07 11:05:41',NULL,NULL),(45,'PRINT-039','Plastic Folders- A4 : pack of 50',9,0.00,'01 No.',0.00,1.00,'Printing Store','Imported stock as on 08.07.2025 from stationary and printing (1).xlsx','ACTIVE',NULL,NULL,NULL,'NOT_REQUESTED',NULL,1,'2026-06-07 11:05:41',NULL,NULL),(46,'PRINT-040','Plastic Folders- A3 : pack of 50',9,200.00,'01 No.',0.00,20.00,'Printing Store','Imported stock as on 08.07.2025 from stationary and printing (1).xlsx','ACTIVE',NULL,NULL,NULL,'NOT_REQUESTED',NULL,1,'2026-06-07 11:05:41',NULL,NULL),(47,'PRINT-041','Canvas bag',9,150.00,'01 No.',0.00,15.00,'Printing Store','Imported stock as on 08.07.2025 from stationary and printing (1).xlsx','ACTIVE',NULL,NULL,NULL,'NOT_REQUESTED',NULL,1,'2026-06-07 11:05:41',NULL,NULL),(48,'PRINT-042','Temporary ID Card',9,334.00,'Nos',0.00,33.00,'Printing Store','Imported stock as on 08.07.2025 from stationary and printing (1).xlsx','ACTIVE',NULL,NULL,NULL,'NOT_REQUESTED',NULL,1,'2026-06-07 11:05:41',NULL,NULL),(49,'PRINT-043','T- Shirt',9,7.00,'01 No.',0.00,1.00,'Printing Store','Imported stock as on 08.07.2025 from stationary and printing (1).xlsx','ACTIVE',NULL,NULL,NULL,'NOT_REQUESTED',NULL,1,'2026-06-07 11:05:41',NULL,NULL),(50,'PRINT-044','Tarpalin bag',9,2.00,'01 No.',0.00,1.00,'Printing Store','Imported stock as on 08.07.2025 from stationary and printing (1).xlsx','ACTIVE',NULL,NULL,NULL,'NOT_REQUESTED',NULL,1,'2026-06-07 11:05:41',NULL,NULL),(51,'PRINT-045','Momento',9,0.00,'01 No.',0.00,1.00,'Printing Store','Imported stock as on 08.07.2025 from stationary and printing (1).xlsx','ACTIVE',NULL,NULL,NULL,'NOT_REQUESTED',NULL,1,'2026-06-07 11:05:41',NULL,NULL),(52,'STAT-001','A4 Paper Sheet',10,6.00,'1 Rim',0.00,1.00,'Stationery Store','Imported stock as on 08.07.2025 from stationary and printing (1).xlsx','ACTIVE',NULL,NULL,NULL,'NOT_REQUESTED',NULL,1,'2026-06-07 11:05:41',NULL,NULL),(53,'STAT-058','Portfolio File',10,28.00,'01 No',0.00,2.00,'Stationery Store','Imported stock as on 08.07.2025 from stationary and printing (1).xlsx','ACTIVE',NULL,NULL,NULL,'NOT_REQUESTED',NULL,1,'2026-06-07 11:05:41',NULL,NULL),(54,'STAT-002','A3 Paper sheet',10,1.00,'1 Rim',0.00,1.00,'Stationery Store','Imported stock as on 08.07.2025 from stationary and printing (1).xlsx','ACTIVE',NULL,NULL,NULL,'NOT_REQUESTED',NULL,1,'2026-06-07 11:05:41',NULL,NULL),(55,'STAT-059','Double Side Sticker',10,8.00,'01 No',0.00,1.00,'Stationery Store','Imported stock as on 08.07.2025 from stationary and printing (1).xlsx','ACTIVE',NULL,NULL,NULL,'NOT_REQUESTED',NULL,1,'2026-06-07 11:05:41',NULL,NULL),(56,'STAT-003','Buff Sheets',10,3.00,'1 Rim',0.00,1.00,'Stationery Store','Imported stock as on 08.07.2025 from stationary and printing (1).xlsx','ACTIVE',NULL,NULL,NULL,'NOT_REQUESTED',NULL,1,'2026-06-07 11:05:42',NULL,NULL),(57,'STAT-060','Duster',10,8.00,'01 No',0.00,1.00,'Stationery Store','Imported stock as on 08.07.2025 from stationary and printing (1).xlsx','ACTIVE',NULL,NULL,NULL,'NOT_REQUESTED',NULL,1,'2026-06-07 11:05:42',NULL,NULL),(58,'STAT-004','Attendance Register Book- 100 Pages',10,3.00,'01 Book',0.00,1.00,'Stationery Store','Imported stock as on 08.07.2025 from stationary and printing (1).xlsx','ACTIVE',NULL,NULL,NULL,'NOT_REQUESTED',NULL,1,'2026-06-07 11:05:42',NULL,NULL),(59,'STAT-061','DVD',10,0.00,'01 No',0.00,1.00,'Stationery Store','Imported stock as on 08.07.2025 from stationary and printing (1).xlsx','ACTIVE',NULL,NULL,NULL,'NOT_REQUESTED',NULL,1,'2026-06-07 11:05:42',NULL,NULL),(60,'STAT-005','Attendance Register Book- 200 Pages',10,11.00,'01 Book',0.00,1.00,'Stationery Store','Imported stock as on 08.07.2025 from stationary and printing (1).xlsx','ACTIVE',NULL,NULL,NULL,'NOT_REQUESTED',NULL,1,'2026-06-07 11:05:42',NULL,NULL),(61,'STAT-062','Drums',10,0.00,'01 No',0.00,1.00,'Stationery Store','Imported stock as on 08.07.2025 from stationary and printing (1).xlsx','ACTIVE',NULL,NULL,NULL,'NOT_REQUESTED',NULL,1,'2026-06-07 11:05:42',NULL,NULL),(62,'STAT-006','From Register book',10,7.00,'01 Book',0.00,1.00,'Stationery Store','Imported stock as on 08.07.2025 from stationary and printing (1).xlsx','ACTIVE',NULL,NULL,NULL,'NOT_REQUESTED',NULL,1,'2026-06-07 11:05:42',NULL,NULL),(63,'STAT-063','Executive Bond Sheets: Pack of 100',10,0.00,'01 No',0.00,1.00,'Stationery Store','Imported stock as on 08.07.2025 from stationary and printing (1).xlsx','ACTIVE',NULL,NULL,NULL,'NOT_REQUESTED',NULL,1,'2026-06-07 11:05:42',NULL,NULL),(64,'STAT-007','Long Note Book- 100 Pages',10,0.00,'01 book',0.00,1.00,'Stationery Store','Imported stock as on 08.07.2025 from stationary and printing (1).xlsx','ACTIVE',NULL,NULL,NULL,'NOT_REQUESTED',NULL,1,'2026-06-07 11:05:42',NULL,NULL),(65,'STAT-064','Eraser',10,4.00,'01 No',0.00,1.00,'Stationery Store','Imported stock as on 08.07.2025 from stationary and printing (1).xlsx','ACTIVE',NULL,NULL,NULL,'NOT_REQUESTED',NULL,1,'2026-06-07 11:05:42',NULL,NULL),(66,'STAT-008','Long Note Book- 200 Pages',10,20.00,'01 book',0.00,2.00,'Stationery Store','Imported stock as on 08.07.2025 from stationary and printing (1).xlsx','ACTIVE',NULL,NULL,NULL,'NOT_REQUESTED',NULL,1,'2026-06-07 11:05:42',NULL,NULL),(67,'STAT-065','Envelops- Plain :',10,250.00,'01 No',0.00,25.00,'Stationery Store','Imported stock as on 08.07.2025 from stationary and printing (1).xlsx','ACTIVE',NULL,NULL,NULL,'NOT_REQUESTED',NULL,1,'2026-06-07 11:05:42',NULL,NULL),(68,'STAT-009','Accounts Ledger Book- 100 Pages',10,8.00,'01 book',0.00,1.00,'Stationery Store','Imported stock as on 08.07.2025 from stationary and printing (1).xlsx','ACTIVE',NULL,NULL,NULL,'NOT_REQUESTED',NULL,1,'2026-06-07 11:05:42',NULL,NULL),(69,'STAT-066','Fevi Stick',10,0.00,'01 No',0.00,1.00,'Stationery Store','Imported stock as on 08.07.2025 from stationary and printing (1).xlsx','ACTIVE',NULL,NULL,NULL,'NOT_REQUESTED',NULL,1,'2026-06-07 11:05:42',NULL,NULL),(70,'STAT-010','Accounts Ledger Book- 200 Pages',10,0.00,'01 book',0.00,1.00,'Stationery Store','Imported stock as on 08.07.2025 from stationary and printing (1).xlsx','ACTIVE',NULL,NULL,NULL,'NOT_REQUESTED',NULL,1,'2026-06-07 11:05:42',NULL,NULL),(71,'STAT-067','Flip folder',10,16.00,'01 No',0.00,1.00,'Stationery Store','Imported stock as on 08.07.2025 from stationary and printing (1).xlsx','ACTIVE',NULL,NULL,NULL,'NOT_REQUESTED',NULL,1,'2026-06-07 11:05:42',NULL,NULL),(72,'STAT-011','Accounts Ledger Book- 300 Pages',10,1.00,'01 book',0.00,1.00,'Stationery Store','Imported stock as on 08.07.2025 from stationary and printing (1).xlsx','ACTIVE',NULL,NULL,NULL,'NOT_REQUESTED',NULL,1,'2026-06-07 11:05:42',NULL,NULL),(73,'STAT-068','Glue stick- Pack of 12',10,6.00,'01 No',0.00,1.00,'Stationery Store','Imported stock as on 08.07.2025 from stationary and printing (1).xlsx','ACTIVE',NULL,NULL,NULL,'NOT_REQUESTED',NULL,1,'2026-06-07 11:05:42',NULL,NULL),(74,'STAT-012','Service Register',10,23.00,'01 Book',0.00,2.00,'Stationery Store','Imported stock as on 08.07.2025 from stationary and printing (1).xlsx','ACTIVE',NULL,NULL,NULL,'NOT_REQUESTED',NULL,1,'2026-06-07 11:05:42',NULL,NULL),(75,'STAT-069','Highlighter- Pack of 10',10,12.00,'01 No',0.00,1.00,'Stationery Store','Imported stock as on 08.07.2025 from stationary and printing (1).xlsx','ACTIVE',NULL,NULL,NULL,'NOT_REQUESTED',NULL,1,'2026-06-07 11:05:42',NULL,NULL),(76,'STAT-013','Stock Register',10,10.00,'01 Book',0.00,1.00,'Stationery Store','Imported stock as on 08.07.2025 from stationary and printing (1).xlsx','ACTIVE',NULL,NULL,NULL,'NOT_REQUESTED',NULL,1,'2026-06-07 11:05:42',NULL,NULL),(77,'STAT-070','Knife',10,0.00,'01 No',0.00,1.00,'Stationery Store','Imported stock as on 08.07.2025 from stationary and printing (1).xlsx','ACTIVE',NULL,NULL,NULL,'NOT_REQUESTED',NULL,1,'2026-06-07 11:05:42',NULL,NULL),(78,'STAT-014','OHP Sheets',10,2.00,'01 pack',0.00,1.00,'Stationery Store','Imported stock as on 08.07.2025 from stationary and printing (1).xlsx','ACTIVE',NULL,NULL,NULL,'NOT_REQUESTED',NULL,1,'2026-06-07 11:05:42',NULL,NULL),(79,'STAT-071','Notice board pins',10,10.00,'01 No.',0.00,1.00,'Stationery Store','Imported stock as on 08.07.2025 from stationary and printing (1).xlsx','ACTIVE',NULL,NULL,NULL,'NOT_REQUESTED',NULL,1,'2026-06-07 11:05:42',NULL,NULL),(80,'STAT-015','Binder clips-25MM- Pack of 10',10,10.00,'01 Box',0.00,1.00,'Stationery Store','Imported stock as on 08.07.2025 from stationary and printing (1).xlsx','ACTIVE',NULL,NULL,NULL,'NOT_REQUESTED',NULL,1,'2026-06-07 11:05:42',NULL,NULL),(81,'STAT-072','OHB Pen/Permanent Marker Pen',10,67.00,'1No.',0.00,6.00,'Stationery Store','Imported stock as on 08.07.2025 from stationary and printing (1).xlsx','ACTIVE',NULL,NULL,NULL,'NOT_REQUESTED',NULL,1,'2026-06-07 11:05:42',NULL,NULL),(82,'STAT-016','Binder clips-50MM- Pack of 10',10,0.00,'1 Box',0.00,1.00,'Stationery Store','Imported stock as on 08.07.2025 from stationary and printing (1).xlsx','ACTIVE',NULL,NULL,NULL,'NOT_REQUESTED',NULL,1,'2026-06-07 11:05:42',NULL,NULL),(83,'STAT-073','Refill- Green',10,0.00,'1No.',0.00,1.00,'Stationery Store','Imported stock as on 08.07.2025 from stationary and printing (1).xlsx','ACTIVE',NULL,NULL,NULL,'NOT_REQUESTED',NULL,1,'2026-06-07 11:05:42',NULL,NULL),(84,'STAT-017','Packer Clips-35MM',10,25.00,'1 Box',0.00,2.00,'Stationery Store','Imported stock as on 08.07.2025 from stationary and printing (1).xlsx','ACTIVE',NULL,NULL,NULL,'NOT_REQUESTED',NULL,1,'2026-06-07 11:05:42',NULL,NULL),(85,'STAT-074','Pen- Red - pack of 20',10,20.00,'01 No.',0.00,2.00,'Stationery Store','Imported stock as on 08.07.2025 from stationary and printing (1).xlsx','ACTIVE',NULL,NULL,NULL,'NOT_REQUESTED',NULL,1,'2026-06-07 11:05:42',NULL,NULL),(86,'STAT-018','Ball pins',10,3.00,'01 Box',0.00,1.00,'Stationery Store','Imported stock as on 08.07.2025 from stationary and printing (1).xlsx','ACTIVE',NULL,NULL,NULL,'NOT_REQUESTED',NULL,1,'2026-06-07 11:05:42',NULL,NULL),(87,'STAT-075','Pen- Black - pack of 20',10,50.00,'01 No.',0.00,5.00,'Stationery Store','Imported stock as on 08.07.2025 from stationary and printing (1).xlsx','ACTIVE',NULL,NULL,NULL,'NOT_REQUESTED',NULL,1,'2026-06-07 11:05:42',NULL,NULL),(88,'STAT-019','Chalk piece- White',10,10.00,'01 Box',0.00,1.00,'Stationery Store','Imported stock as on 08.07.2025 from stationary and printing (1).xlsx','ACTIVE',NULL,NULL,NULL,'NOT_REQUESTED',NULL,1,'2026-06-07 11:05:42',NULL,NULL),(89,'STAT-076','Pen- Blue - pack of 20',10,18.00,'01 No.',0.00,1.00,'Stationery Store','Imported stock as on 08.07.2025 from stationary and printing (1).xlsx','ACTIVE',NULL,NULL,NULL,'NOT_REQUESTED',NULL,1,'2026-06-07 11:05:42',NULL,NULL),(90,'STAT-020','Chalk piece- Colour',10,4.00,'01 Box',0.00,1.00,'Stationery Store','Imported stock as on 08.07.2025 from stationary and printing (1).xlsx','ACTIVE',NULL,NULL,NULL,'NOT_REQUESTED',NULL,1,'2026-06-07 11:05:42',NULL,NULL),(91,'STAT-077','Pen- Green',10,0.00,'01 No.',0.00,1.00,'Stationery Store','Imported stock as on 08.07.2025 from stationary and printing (1).xlsx','ACTIVE',NULL,NULL,NULL,'NOT_REQUESTED',NULL,1,'2026-06-07 11:05:42',NULL,NULL),(92,'STAT-021','Packer clip-26MM/25MM/30MM- Pack of 12',10,38.00,'01 Box',0.00,3.00,'Stationery Store','Imported stock as on 08.07.2025 from stationary and printing (1).xlsx','ACTIVE',NULL,NULL,NULL,'NOT_REQUESTED',NULL,1,'2026-06-07 11:05:42',NULL,NULL),(93,'STAT-078','Pen- Gel',10,15.00,'01 No.',0.00,1.00,'Stationery Store','Imported stock as on 08.07.2025 from stationary and printing (1).xlsx','ACTIVE',NULL,NULL,NULL,'NOT_REQUESTED',NULL,1,'2026-06-07 11:05:42',NULL,NULL),(94,'STAT-022','Stappler Pins-10 : pack of 12',10,6.00,'01 Box',0.00,1.00,'Stationery Store','Imported stock as on 08.07.2025 from stationary and printing (1).xlsx','ACTIVE',NULL,NULL,NULL,'NOT_REQUESTED',NULL,1,'2026-06-07 11:05:42',NULL,NULL),(95,'STAT-079','Photo Sheets-Pack of 100',10,0.00,'01 No.',0.00,1.00,'Stationery Store','Imported stock as on 08.07.2025 from stationary and printing (1).xlsx','ACTIVE',NULL,NULL,NULL,'NOT_REQUESTED',NULL,1,'2026-06-07 11:05:42',NULL,NULL),(96,'STAT-023','Stappler Pins-45 : pack of 12',10,8.00,'01 Box',0.00,1.00,'Stationery Store','Imported stock as on 08.07.2025 from stationary and printing (1).xlsx','ACTIVE',NULL,NULL,NULL,'NOT_REQUESTED',NULL,1,'2026-06-07 11:05:42',NULL,NULL),(97,'STAT-080','Pendrive',10,1.00,'01 No.',0.00,1.00,'Stationery Store','Imported stock as on 08.07.2025 from stationary and printing (1).xlsx','ACTIVE',NULL,NULL,NULL,'NOT_REQUESTED',NULL,1,'2026-06-07 11:05:42',NULL,NULL),(98,'STAT-024','Stappler Pin-23/15-H- Big Stappler',10,6.00,'01 Box',0.00,1.00,'Stationery Store','Imported stock as on 08.07.2025 from stationary and printing (1).xlsx','ACTIVE',NULL,NULL,NULL,'NOT_REQUESTED',NULL,1,'2026-06-07 11:05:42',NULL,NULL),(99,'STAT-081','Pencil- Pack of 10',10,3.00,'01 No.',0.00,1.00,'Stationery Store','Imported stock as on 08.07.2025 from stationary and printing (1).xlsx','ACTIVE',NULL,NULL,NULL,'NOT_REQUESTED',NULL,1,'2026-06-07 11:05:42',NULL,NULL),(100,'STAT-025','Gum Bottle',10,1.00,'01 Bottle',0.00,1.00,'Stationery Store','Imported stock as on 08.07.2025 from stationary and printing (1).xlsx','ACTIVE',NULL,NULL,NULL,'NOT_REQUESTED',NULL,1,'2026-06-07 11:05:42',NULL,NULL),(101,'STAT-082','Punching Machine',10,5.00,'01 No.',0.00,1.00,'Stationery Store','Imported stock as on 08.07.2025 from stationary and printing (1).xlsx','ACTIVE',NULL,NULL,NULL,'NOT_REQUESTED',NULL,1,'2026-06-07 11:05:42',NULL,NULL),(102,'STAT-026','Ink- Stamp Pad',10,5.00,'01 Bottle',0.00,1.00,'Stationery Store','Imported stock as on 08.07.2025 from stationary and printing (1).xlsx','ACTIVE',NULL,NULL,NULL,'NOT_REQUESTED',NULL,1,'2026-06-07 11:05:42',NULL,NULL),(103,'STAT-083','Pin Remover',10,0.00,'01 No.',0.00,1.00,'Stationery Store','Imported stock as on 08.07.2025 from stationary and printing (1).xlsx','ACTIVE',NULL,NULL,NULL,'NOT_REQUESTED',NULL,1,'2026-06-07 11:05:42',NULL,NULL),(104,'STAT-027','Cotton Thread Roll',10,2.00,'01 Roll',0.00,1.00,'Stationery Store','Imported stock as on 08.07.2025 from stationary and printing (1).xlsx','ACTIVE',NULL,NULL,NULL,'NOT_REQUESTED',NULL,1,'2026-06-07 11:05:42',NULL,NULL),(105,'STAT-084','Stamp pad',10,3.00,'01 No.',0.00,1.00,'Stationery Store','Imported stock as on 08.07.2025 from stationary and printing (1).xlsx','ACTIVE',NULL,NULL,NULL,'NOT_REQUESTED',NULL,1,'2026-06-07 11:05:42',NULL,NULL),(106,'STAT-028','Plastic Threads',10,5.00,'01 Roll',0.00,1.00,'Stationery Store','Imported stock as on 08.07.2025 from stationary and printing (1).xlsx','ACTIVE',NULL,NULL,NULL,'NOT_REQUESTED',NULL,1,'2026-06-07 11:05:42',NULL,NULL),(107,'STAT-085','Stappler No-10',10,0.00,'01 No.',0.00,1.00,'Stationery Store','Imported stock as on 08.07.2025 from stationary and printing (1).xlsx','ACTIVE',NULL,NULL,NULL,'NOT_REQUESTED',NULL,1,'2026-06-07 11:05:42',NULL,NULL),(108,'STAT-029','Rubber Band- Small',10,12.00,'01 Bunch',0.00,1.00,'Stationery Store','Imported stock as on 08.07.2025 from stationary and printing (1).xlsx','ACTIVE',NULL,NULL,NULL,'NOT_REQUESTED',NULL,1,'2026-06-07 11:05:42',NULL,NULL),(109,'STAT-086','Scribbling pad',10,3.00,'01 No.',0.00,1.00,'Stationery Store','Imported stock as on 08.07.2025 from stationary and printing (1).xlsx','ACTIVE',NULL,NULL,NULL,'NOT_REQUESTED',NULL,1,'2026-06-07 11:05:42',NULL,NULL),(110,'STAT-030','Rubber Band- Big',10,0.00,'01 Bunch',0.00,1.00,'Stationery Store','Imported stock as on 08.07.2025 from stationary and printing (1).xlsx','ACTIVE',NULL,NULL,NULL,'NOT_REQUESTED',NULL,1,'2026-06-07 11:05:42',NULL,NULL),(111,'STAT-087','Stappler Machine-45',10,0.00,'01 No.',0.00,1.00,'Stationery Store','Imported stock as on 08.07.2025 from stationary and printing (1).xlsx','ACTIVE',NULL,NULL,NULL,'NOT_REQUESTED',NULL,1,'2026-06-07 11:05:42',NULL,NULL),(112,'STAT-031','Tags- Pack of 50',10,0.00,'01 Bunch',0.00,1.00,'Stationery Store','Imported stock as on 08.07.2025 from stationary and printing (1).xlsx','ACTIVE',NULL,NULL,NULL,'NOT_REQUESTED',NULL,1,'2026-06-07 11:05:42',NULL,NULL),(113,'STAT-088','Scrbling pad',10,0.00,'01 No.',0.00,1.00,'Stationery Store','Imported stock as on 08.07.2025 from stationary and printing (1).xlsx','ACTIVE',NULL,NULL,NULL,'NOT_REQUESTED',NULL,1,'2026-06-07 11:05:42',NULL,NULL),(114,'STAT-032','Post it Pad',10,8.00,'01 Pack',0.00,1.00,'Stationery Store','Imported stock as on 08.07.2025 from stationary and printing (1).xlsx','ACTIVE',NULL,NULL,NULL,'NOT_REQUESTED',NULL,1,'2026-06-07 11:05:42',NULL,NULL),(115,'STAT-089','Scissor',10,4.00,'01 No.',0.00,1.00,'Stationery Store','Imported stock as on 08.07.2025 from stationary and printing (1).xlsx','ACTIVE',NULL,NULL,NULL,'NOT_REQUESTED',NULL,1,'2026-06-07 11:05:42',NULL,NULL),(116,'STAT-033','A4 Sticker Sheet - pack of 100',10,0.00,'1 No.',0.00,1.00,'Stationery Store','Imported stock as on 08.07.2025 from stationary and printing (1).xlsx','ACTIVE',NULL,NULL,NULL,'NOT_REQUESTED',NULL,1,'2026-06-07 11:05:42',NULL,NULL),(117,'STAT-090','Sharpner',10,30.00,'01 No.',0.00,3.00,'Stationery Store','Imported stock as on 08.07.2025 from stationary and printing (1).xlsx','ACTIVE',NULL,NULL,NULL,'NOT_REQUESTED',NULL,1,'2026-06-07 11:05:42',NULL,NULL),(118,'STAT-034','Box File- Big',10,27.00,'01 No',0.00,2.00,'Stationery Store','Imported stock as on 08.07.2025 from stationary and printing (1).xlsx','ACTIVE',NULL,NULL,NULL,'NOT_REQUESTED',NULL,1,'2026-06-07 11:05:42',NULL,NULL),(119,'STAT-091','Steel Scale',10,3.00,'01 No.',0.00,1.00,'Stationery Store','Imported stock as on 08.07.2025 from stationary and printing (1).xlsx','ACTIVE',NULL,NULL,NULL,'NOT_REQUESTED',NULL,1,'2026-06-07 11:05:42',NULL,NULL),(120,'STAT-035','Box File-Small',10,24.00,'01 No',0.00,2.00,'Stationery Store','Imported stock as on 08.07.2025 from stationary and printing (1).xlsx','ACTIVE',NULL,NULL,NULL,'NOT_REQUESTED',NULL,1,'2026-06-07 11:05:42',NULL,NULL),(121,'STAT-092','Spring File - Personal file',10,0.00,'01 No.',0.00,1.00,'Stationery Store','Imported stock as on 08.07.2025 from stationary and printing (1).xlsx','ACTIVE',NULL,NULL,NULL,'NOT_REQUESTED',NULL,1,'2026-06-07 11:05:42',NULL,NULL),(122,'STAT-036','Cello Tape Dispenser',10,0.00,'01 No',0.00,1.00,'Stationery Store','Imported stock as on 08.07.2025 from stationary and printing (1).xlsx','ACTIVE',NULL,NULL,NULL,'NOT_REQUESTED',NULL,1,'2026-06-07 11:05:42',NULL,NULL),(123,'STAT-093','Steel Stand',10,1.00,'01 No.',0.00,1.00,'Stationery Store','Imported stock as on 08.07.2025 from stationary and printing (1).xlsx','ACTIVE',NULL,NULL,NULL,'NOT_REQUESTED',NULL,1,'2026-06-07 11:05:42',NULL,NULL),(124,'STAT-037','Cello Tape 1 inch- White- Pack of 12',10,33.00,'01 No',0.00,3.00,'Stationery Store','Imported stock as on 08.07.2025 from stationary and printing (1).xlsx','ACTIVE',NULL,NULL,NULL,'NOT_REQUESTED',NULL,1,'2026-06-07 11:05:42',NULL,NULL),(125,'STAT-094','Toner- Canon',10,0.00,'01 No.',0.00,1.00,'Stationery Store','Imported stock as on 08.07.2025 from stationary and printing (1).xlsx','ACTIVE',NULL,NULL,NULL,'NOT_REQUESTED',NULL,1,'2026-06-07 11:05:42',NULL,NULL),(126,'STAT-038','Cello Tape 2 inch- White-Pack of 6',10,0.00,'01 No',0.00,1.00,'Stationery Store','Imported stock as on 08.07.2025 from stationary and printing (1).xlsx','ACTIVE',NULL,NULL,NULL,'NOT_REQUESTED',NULL,1,'2026-06-07 11:05:42',NULL,NULL),(127,'STAT-095','White Board Marker Pen- Pack of 10',10,70.00,'01 No.',0.00,7.00,'Stationery Store','Imported stock as on 08.07.2025 from stationary and printing (1).xlsx','ACTIVE',NULL,NULL,NULL,'NOT_REQUESTED',NULL,1,'2026-06-07 11:05:42',NULL,NULL),(128,'STAT-039','Cello Tape 1 inch- Brown- Pack of 12',10,34.00,'01 No',0.00,3.00,'Stationery Store','Imported stock as on 08.07.2025 from stationary and printing (1).xlsx','ACTIVE',NULL,NULL,NULL,'NOT_REQUESTED',NULL,1,'2026-06-07 11:05:42',NULL,NULL),(129,'STAT-096','White Board Ink',10,30.00,'01 No.',0.00,3.00,'Stationery Store','Imported stock as on 08.07.2025 from stationary and printing (1).xlsx','ACTIVE',NULL,NULL,NULL,'NOT_REQUESTED',NULL,1,'2026-06-07 11:05:42',NULL,NULL),(130,'STAT-040','Cello Tape 2 inch- Brown-Pack of 6',10,21.00,'01 No',0.00,2.00,'Stationery Store','Imported stock as on 08.07.2025 from stationary and printing (1).xlsx','ACTIVE',NULL,NULL,NULL,'NOT_REQUESTED',NULL,1,'2026-06-07 11:05:42',NULL,NULL),(131,'STAT-097','PVC Stickers',10,0.00,'01 No.',0.00,1.00,'Stationery Store','Imported stock as on 08.07.2025 from stationary and printing (1).xlsx','ACTIVE',NULL,NULL,NULL,'NOT_REQUESTED',NULL,1,'2026-06-07 11:05:42',NULL,NULL),(132,'STAT-041','Cello Tape 2 inch-Blue- Pack of 6',10,12.00,'01 No',0.00,1.00,'Stationery Store','Imported stock as on 08.07.2025 from stationary and printing (1).xlsx','ACTIVE',NULL,NULL,NULL,'NOT_REQUESTED',NULL,1,'2026-06-07 11:05:42',NULL,NULL),(133,'STAT-098','Green Envelope- Plain',10,100.00,'01 No.',0.00,10.00,'Stationery Store','Imported stock as on 08.07.2025 from stationary and printing (1).xlsx','ACTIVE',NULL,NULL,NULL,'NOT_REQUESTED',NULL,1,'2026-06-07 11:05:42',NULL,NULL),(134,'STAT-042','Cello Tape 1 inch-Blue-Pack of 12',10,0.00,'01 No',0.00,1.00,'Stationery Store','Imported stock as on 08.07.2025 from stationary and printing (1).xlsx','ACTIVE',NULL,NULL,NULL,'NOT_REQUESTED',NULL,1,'2026-06-07 11:05:42',NULL,NULL),(135,'STAT-099','Clothline Cover- Green Colour Plain',10,13.00,'01 No.',0.00,1.00,'Stationery Store','Imported stock as on 08.07.2025 from stationary and printing (1).xlsx','ACTIVE',NULL,NULL,NULL,'NOT_REQUESTED',NULL,1,'2026-06-07 11:05:42',NULL,NULL),(136,'STAT-043','Cello tape 1 Inch- Red-Pack of 12',10,0.00,'01 No',0.00,1.00,'Stationery Store','Imported stock as on 08.07.2025 from stationary and printing (1).xlsx','ACTIVE',NULL,NULL,NULL,'NOT_REQUESTED',NULL,1,'2026-06-07 11:05:42',NULL,NULL),(137,'STAT-044','Cell- AAA-Pack of 12',10,34.00,'01 No',0.00,3.00,'Stationery Store','Imported stock as on 08.07.2025 from stationary and printing (1).xlsx','ACTIVE',NULL,NULL,NULL,'NOT_REQUESTED',NULL,1,'2026-06-07 11:05:42',NULL,NULL),(138,'STAT-045','Cell- AA-Pack of 12',10,30.00,'01 No',0.00,3.00,'Stationery Store','Imported stock as on 08.07.2025 from stationary and printing (1).xlsx','ACTIVE',NULL,NULL,NULL,'NOT_REQUESTED',NULL,1,'2026-06-07 11:05:42',NULL,NULL),(139,'STAT-046','Calculator',10,3.00,'01 No',0.00,1.00,'Stationery Store','Imported stock as on 08.07.2025 from stationary and printing (1).xlsx','ACTIVE',NULL,NULL,NULL,'NOT_REQUESTED',NULL,1,'2026-06-07 11:05:42',NULL,NULL),(140,'STAT-047','Cartridge 78A',10,0.00,'01 No',0.00,1.00,'Stationery Store','Imported stock as on 08.07.2025 from stationary and printing (1).xlsx','ACTIVE',NULL,NULL,NULL,'NOT_REQUESTED',NULL,1,'2026-06-07 11:05:42',NULL,NULL),(141,'STAT-048','Cartridge 88A',10,0.00,'01 No',0.00,1.00,'Stationery Store','Imported stock as on 08.07.2025 from stationary and printing (1).xlsx','ACTIVE',NULL,NULL,NULL,'NOT_REQUESTED',NULL,1,'2026-06-07 11:05:42',NULL,NULL),(142,'STAT-049','Cartridge 12A',10,0.00,'01 No',0.00,1.00,'Stationery Store','Imported stock as on 08.07.2025 from stationary and printing (1).xlsx','ACTIVE',NULL,NULL,NULL,'NOT_REQUESTED',NULL,1,'2026-06-07 11:05:42',NULL,NULL),(143,'STAT-050','Cartridge - Brother',10,0.00,'01 No',0.00,1.00,'Stationery Store','Imported stock as on 08.07.2025 from stationary and printing (1).xlsx','ACTIVE',NULL,NULL,NULL,'NOT_REQUESTED',NULL,1,'2026-06-07 11:05:42',NULL,NULL),(144,'STAT-051','Cartridge - Canon',10,0.00,'01 No',0.00,1.00,'Stationery Store','Imported stock as on 08.07.2025 from stationary and printing (1).xlsx','ACTIVE',NULL,NULL,NULL,'NOT_REQUESTED',NULL,1,'2026-06-07 11:05:42',NULL,NULL),(145,'STAT-052','Carbon Sheets- Pack of 50',10,1.00,'01 No',0.00,1.00,'Stationery Store','Imported stock as on 08.07.2025 from stationary and printing (1).xlsx','ACTIVE',NULL,NULL,NULL,'NOT_REQUESTED',NULL,1,'2026-06-07 11:05:42',NULL,NULL),(146,'STAT-053','Colour Sheets',10,13.00,'01 Rim',0.00,1.00,'Stationery Store','Imported stock as on 08.07.2025 from stationary and printing (1).xlsx','ACTIVE',NULL,NULL,NULL,'NOT_REQUESTED',NULL,1,'2026-06-07 11:05:42',NULL,NULL),(147,'STAT-054','Cutter',10,0.00,'01 No',0.00,1.00,'Stationery Store','Imported stock as on 08.07.2025 from stationary and printing (1).xlsx','ACTIVE',NULL,NULL,NULL,'NOT_REQUESTED',NULL,1,'2026-06-07 11:05:42',NULL,NULL),(148,'STAT-055','CD',10,0.00,'01 No',0.00,1.00,'Stationery Store','Imported stock as on 08.07.2025 from stationary and printing (1).xlsx','ACTIVE',NULL,NULL,NULL,'NOT_REQUESTED',NULL,1,'2026-06-07 11:05:42',NULL,NULL),(149,'STAT-056','Colour Print- Ink',10,9.00,'01 No',0.00,1.00,'Stationery Store','Imported stock as on 08.07.2025 from stationary and printing (1).xlsx','ACTIVE',NULL,NULL,NULL,'NOT_REQUESTED',NULL,1,'2026-06-07 11:05:42',NULL,NULL),(150,'STAT-057','Colour Ink- Black',10,3.00,'01 No',0.00,1.00,'Stationery Store','Imported stock as on 08.07.2025 from stationary and printing (1).xlsx','ACTIVE',NULL,NULL,NULL,'NOT_REQUESTED',NULL,1,'2026-06-07 11:05:42',NULL,NULL),(151,'HOUSE-001','All clean : 5 litre',2,30.00,'0.5 ltr',0.00,3.00,'Housekeeping Store','Imported stock as on 08.07.2025 from stationary and printing (1).xlsx','ACTIVE',NULL,NULL,NULL,'NOT_REQUESTED',NULL,1,'2026-06-07 11:05:42',NULL,NULL),(152,'POOJA-001','Agarabatti',7,11.00,'01 Pack',0.00,1.00,'Pooja Store','Imported stock as on 08.07.2025 from stationary and printing (1).xlsx','ACTIVE',NULL,NULL,NULL,'NOT_REQUESTED',NULL,1,'2026-06-07 11:05:42',NULL,NULL),(153,'HOUSE-002','Acid : 5 litre',2,10.00,'0.5 ltr',0.00,1.00,'Housekeeping Store','Imported stock as on 08.07.2025 from stationary and printing (1).xlsx','ACTIVE',NULL,NULL,NULL,'NOT_REQUESTED',NULL,1,'2026-06-07 11:05:42',NULL,NULL),(154,'POOJA-002','Rangoli',7,11.00,'01 Pack',0.00,1.00,'Pooja Store','Imported stock as on 08.07.2025 from stationary and printing (1).xlsx','ACTIVE',NULL,NULL,NULL,'NOT_REQUESTED',NULL,1,'2026-06-07 11:05:42',NULL,NULL),(155,'HOUSE-003','Germ Free : 5 litre',2,25.00,'0.5 ltr',0.00,2.00,'Housekeeping Store','Imported stock as on 08.07.2025 from stationary and printing (1).xlsx','ACTIVE',NULL,NULL,NULL,'NOT_REQUESTED',NULL,1,'2026-06-07 11:05:42',NULL,NULL),(156,'POOJA-003','Pitambari',7,6.00,'01 Pack',0.00,1.00,'Pooja Store','Imported stock as on 08.07.2025 from stationary and printing (1).xlsx','ACTIVE',NULL,NULL,NULL,'NOT_REQUESTED',NULL,1,'2026-06-07 11:05:42',NULL,NULL),(157,'HOUSE-004','Handwash Label : 5 litre',2,5.00,'0.5 ltr',0.00,1.00,'Housekeeping Store','Imported stock as on 08.07.2025 from stationary and printing (1).xlsx','ACTIVE',NULL,NULL,NULL,'NOT_REQUESTED',NULL,1,'2026-06-07 11:05:42',NULL,NULL),(158,'POOJA-004','Camphor',7,1.00,'01 Pack',0.00,1.00,'Pooja Store','Imported stock as on 08.07.2025 from stationary and printing (1).xlsx','ACTIVE',NULL,NULL,NULL,'NOT_REQUESTED',NULL,1,'2026-06-07 11:05:42',NULL,NULL),(159,'HOUSE-005','Room Freshner : 5 litre',2,2.00,'0.5 ltr',0.00,1.00,'Housekeeping Store','Imported stock as on 08.07.2025 from stationary and printing (1).xlsx','ACTIVE',NULL,NULL,NULL,'NOT_REQUESTED',NULL,1,'2026-06-07 11:05:42',NULL,NULL),(160,'POOJA-005','Gingely Oil',7,8.00,'01 Pack',0.00,1.00,'Pooja Store','Imported stock as on 08.07.2025 from stationary and printing (1).xlsx','ACTIVE',NULL,NULL,NULL,'NOT_REQUESTED',NULL,1,'2026-06-07 11:05:42',NULL,NULL),(161,'HOUSE-006','Phenoil : 5 litre',2,25.00,'0.5 ltr',0.00,2.00,'Housekeeping Store','Imported stock as on 08.07.2025 from stationary and printing (1).xlsx','ACTIVE',NULL,NULL,NULL,'NOT_REQUESTED',NULL,1,'2026-06-07 11:05:42',NULL,NULL),(162,'HOUSE-007','All out',2,0.00,'01 No.',0.00,1.00,'Housekeeping Store','Imported stock as on 08.07.2025 from stationary and printing (1).xlsx','ACTIVE',NULL,NULL,NULL,'NOT_REQUESTED',NULL,1,'2026-06-07 11:05:42',NULL,NULL),(163,'HOUSE-008','Bombay broom',2,18.00,'01 No.',0.00,2.00,'Housekeeping Store','Imported stock as on 08.07.2025 from stationary and printing (1).xlsx','ACTIVE',NULL,NULL,NULL,'NOT_REQUESTED',NULL,1,'2026-06-07 11:05:42','2026-09-20 06:02:42',NULL),(164,'HOUSE-009','Coconut Broom',2,38.00,'01 No.',0.00,3.00,'Housekeeping Store','Imported stock as on 08.07.2025 from stationary and printing (1).xlsx','ACTIVE',NULL,NULL,NULL,'NOT_REQUESTED',NULL,1,'2026-06-07 11:05:42',NULL,NULL),(165,'HOUSE-010','Colin',2,31.00,'01 No.',0.00,3.00,'Housekeeping Store','Imported stock as on 08.07.2025 from stationary and printing (1).xlsx','ACTIVE',NULL,NULL,NULL,'NOT_REQUESTED',NULL,1,'2026-06-07 11:05:42',NULL,NULL),(166,'HOUSE-011','Ceiling broom',2,16.00,'01 No.',0.00,1.00,'Housekeeping Store','Imported stock as on 08.07.2025 from stationary and printing (1).xlsx','ACTIVE',NULL,NULL,NULL,'NOT_REQUESTED',NULL,1,'2026-06-07 11:05:42',NULL,NULL),(167,'HOUSE-012','Dust pan',2,14.00,'01 No.',0.00,1.00,'Housekeeping Store','Imported stock as on 08.07.2025 from stationary and printing (1).xlsx','ACTIVE',NULL,NULL,NULL,'NOT_REQUESTED',NULL,1,'2026-06-07 11:05:42',NULL,NULL),(168,'HOUSE-013','Dishwash bar - Vim',2,3.00,'01 No.',0.00,1.00,'Housekeeping Store','Imported stock as on 08.07.2025 from stationary and printing (1).xlsx','ACTIVE',NULL,NULL,NULL,'NOT_REQUESTED',NULL,1,'2026-06-07 11:05:42',NULL,NULL),(169,'HOUSE-014','liquid- Vim',2,3.00,'01 No.',0.00,1.00,'Housekeeping Store','Imported stock as on 08.07.2025 from stationary and printing (1).xlsx','ACTIVE',NULL,NULL,NULL,'NOT_REQUESTED',NULL,1,'2026-06-07 11:05:42',NULL,NULL),(170,'HOUSE-015','Hit',2,5.00,'01 No.',0.00,1.00,'Housekeeping Store','Imported stock as on 08.07.2025 from stationary and printing (1).xlsx','ACTIVE',NULL,NULL,NULL,'NOT_REQUESTED',NULL,1,'2026-06-07 11:05:42',NULL,NULL),(171,'HOUSE-016','Long Handle brush',2,7.00,'01 No.',0.00,1.00,'Housekeeping Store','Imported stock as on 08.07.2025 from stationary and printing (1).xlsx','ACTIVE',NULL,NULL,NULL,'NOT_REQUESTED',NULL,1,'2026-06-07 11:05:42',NULL,NULL),(172,'HOUSE-017','Toilet Cleaning brush',2,55.00,'01 No.',0.00,5.00,'Housekeeping Store','Imported stock as on 08.07.2025 from stationary and printing (1).xlsx','ACTIVE',NULL,NULL,NULL,'NOT_REQUESTED',NULL,1,'2026-06-07 11:05:42',NULL,NULL),(173,'HOUSE-018','Mop Set',2,20.00,'01 No.',0.00,2.00,'Housekeeping Store','Imported stock as on 08.07.2025 from stationary and printing (1).xlsx','ACTIVE',NULL,NULL,NULL,'NOT_REQUESTED',NULL,1,'2026-06-07 11:05:42',NULL,NULL),(174,'HOUSE-019','Mosquito Repllent',2,5.00,'01 No.',0.00,1.00,'Housekeeping Store','Imported stock as on 08.07.2025 from stationary and printing (1).xlsx','ACTIVE',NULL,NULL,NULL,'NOT_REQUESTED',NULL,1,'2026-06-07 11:05:42',NULL,NULL),(175,'HOUSE-020','Naphthalene balls : pack of 50',2,3.00,'01 No.',0.00,1.00,'Housekeeping Store','Imported stock as on 08.07.2025 from stationary and printing (1).xlsx','ACTIVE',NULL,NULL,NULL,'NOT_REQUESTED',NULL,1,'2026-06-07 11:05:42',NULL,NULL),(176,'HOUSE-021','Odonils',2,0.00,'01 No.',0.00,1.00,'Housekeeping Store','Imported stock as on 08.07.2025 from stationary and printing (1).xlsx','ACTIVE',NULL,NULL,NULL,'NOT_REQUESTED',NULL,1,'2026-06-07 11:05:42',NULL,NULL),(177,'HOUSE-022','Rubber handgloves: Pack of 2',2,22.00,'01 No.',0.00,2.00,'Housekeeping Store','Imported stock as on 08.07.2025 from stationary and printing (1).xlsx','ACTIVE',NULL,NULL,NULL,'NOT_REQUESTED',NULL,1,'2026-06-07 11:05:42',NULL,NULL),(178,'HOUSE-023','Shining cloth',2,48.00,'01 No.',0.00,4.00,'Housekeeping Store','Imported stock as on 08.07.2025 from stationary and printing (1).xlsx','ACTIVE',NULL,NULL,NULL,'NOT_REQUESTED',NULL,1,'2026-06-07 11:05:42',NULL,NULL),(179,'HOUSE-024','Scrub pads- Silver : pack of 12',2,30.00,'01 No.',0.00,3.00,'Housekeeping Store','Imported stock as on 08.07.2025 from stationary and printing (1).xlsx','ACTIVE',NULL,NULL,NULL,'NOT_REQUESTED',NULL,1,'2026-06-07 11:05:42',NULL,NULL),(180,'HOUSE-025','Soaps- Rin',2,32.00,'01 No.',0.00,3.00,'Housekeeping Store','Imported stock as on 08.07.2025 from stationary and printing (1).xlsx','ACTIVE',NULL,NULL,NULL,'NOT_REQUESTED',NULL,1,'2026-06-07 11:05:42',NULL,NULL),(181,'HOUSE-026','Table cleaning cloth : pack of 6/12',2,55.00,'01 No.',0.00,5.00,'Housekeeping Store','Imported stock as on 08.07.2025 from stationary and printing (1).xlsx','ACTIVE',NULL,NULL,NULL,'NOT_REQUESTED',NULL,1,'2026-06-07 11:05:42',NULL,NULL),(182,'HOUSE-027','Disposable Gloves : pack of 50',2,0.00,'02 No.',0.00,1.00,'Housekeeping Store','Imported stock as on 08.07.2025 from stationary and printing (1).xlsx','ACTIVE',NULL,NULL,NULL,'NOT_REQUESTED',NULL,1,'2026-06-07 11:05:42',NULL,NULL),(183,'HOUSE-028','Garbage cover: pack of 50',2,56.00,'1 Pack',0.00,5.00,'Housekeeping Store','Imported stock as on 08.07.2025 from stationary and printing (1).xlsx','ACTIVE',NULL,NULL,NULL,'NOT_REQUESTED',NULL,1,'2026-06-07 11:05:42',NULL,NULL),(184,'HOUSE-029','Tissue paper : pack of 50',2,16.00,'01 Pack',0.00,1.00,'Housekeeping Store','Imported stock as on 08.07.2025 from stationary and printing (1).xlsx','ACTIVE',NULL,NULL,NULL,'NOT_REQUESTED',NULL,1,'2026-06-07 11:05:42',NULL,NULL),(185,'HOUSE-030','Urinal cakes : pack of 2',2,82.00,'01 pack',0.00,8.00,'Housekeeping Store','Imported stock as on 08.07.2025 from stationary and printing (1).xlsx','ACTIVE',NULL,NULL,NULL,'NOT_REQUESTED',NULL,1,'2026-06-07 11:05:42',NULL,NULL),(186,'HOUSE-031','Key and lock: pack of 10',2,3.00,'01 Set',0.00,1.00,'Housekeeping Store','Imported stock as on 08.07.2025 from stationary and printing (1).xlsx','ACTIVE',NULL,NULL,NULL,'NOT_REQUESTED',NULL,1,'2026-06-07 11:05:42',NULL,NULL),(187,'HOUSE-032','Wheel powder : per kg',2,1.00,'Grams',0.00,1.00,'Housekeeping Store','Imported stock as on 08.07.2025 from stationary and printing (1).xlsx','ACTIVE',NULL,NULL,NULL,'NOT_REQUESTED',NULL,1,'2026-06-07 11:05:42',NULL,NULL),(188,'HOUSE-033','Handwash Dispenser',2,0.00,'01 Bottle',0.00,1.00,'Housekeeping Store','Imported stock as on 08.07.2025 from stationary and printing (1).xlsx','ACTIVE',NULL,NULL,NULL,'NOT_REQUESTED',NULL,1,'2026-06-07 11:05:42',NULL,NULL),(189,'HOUSE-034','Rat mat',2,20.00,'01 No.',0.00,2.00,'Housekeeping Store','Imported stock as on 08.07.2025 from stationary and printing (1).xlsx','ACTIVE',NULL,NULL,NULL,'NOT_REQUESTED',NULL,1,'2026-06-07 11:05:42',NULL,NULL),(190,'HOUSE-035','Sanitizer',2,1.00,'01 No.',0.00,1.00,'Housekeeping Store','Imported stock as on 08.07.2025 from stationary and printing (1).xlsx','ACTIVE',NULL,NULL,NULL,'NOT_REQUESTED',NULL,1,'2026-06-07 11:05:42',NULL,NULL),(191,'HOUSE-036','Tamrind',2,3.00,'1 Kg',0.00,1.00,'Housekeeping Store','Imported stock as on 08.07.2025 from stationary and printing (1).xlsx','ACTIVE',NULL,NULL,NULL,'NOT_REQUESTED',NULL,1,'2026-06-07 11:05:42',NULL,NULL),(192,'HOUSE-037','Diffuser set',2,5.00,'01 No.',0.00,1.00,'Housekeeping Store','Imported stock as on 08.07.2025 from stationary and printing (1).xlsx','ACTIVE',NULL,NULL,NULL,'NOT_REQUESTED',NULL,1,'2026-06-07 11:05:42',NULL,NULL),(193,'HOUSE-038','Sanitary napkins',2,400.00,'Nos',0.00,40.00,'Housekeeping Store','Imported stock as on 08.07.2025 from stationary and printing (1).xlsx','ACTIVE',NULL,NULL,NULL,'NOT_REQUESTED',NULL,1,'2026-06-07 11:05:42',NULL,NULL),(194,'ST-FILE-001','Box File',1,120.00,'Nos',65.00,20.00,'Store Room A','Department office files','ACTIVE',NULL,NULL,NULL,'NOT_REQUESTED',NULL,1,'2026-06-07 11:05:52',NULL,NULL),(195,'IT-KBD-001','USB Keyboard',5,35.00,'Nos',520.00,8.00,'IT Store','Computer lab keyboard','ACTIVE',NULL,NULL,NULL,'NOT_REQUESTED',NULL,1,'2026-06-07 11:05:52',NULL,NULL),(196,'LAB-BRD-001','Breadboard',4,75.00,'Nos',120.00,12.00,'ECE Lab Store','Electronics lab breadboard','ACTIVE',NULL,NULL,NULL,'NOT_REQUESTED',NULL,1,'2026-06-07 11:05:52',NULL,NULL),(197,'EL-WIR-001','Electrical Wire Roll',3,42.00,'Roll',780.00,6.00,'Electrical Shelf','Electrical lab and maintenance wire','ACTIVE',NULL,NULL,NULL,'NOT_REQUESTED',NULL,1,'2026-06-07 11:05:52','2026-09-20 06:02:42',NULL),(198,'HK-SAN-001','Sanitizer Bottle',2,90.00,'Bottle',85.00,15.00,'Housekeeping Rack','Department sanitizer stock','ACTIVE',NULL,NULL,NULL,'NOT_REQUESTED',NULL,1,'2026-06-07 11:05:52',NULL,NULL);
/*!40000 ALTER TABLE `items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `login_history`
--

DROP TABLE IF EXISTS `login_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `login_history` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int DEFAULT NULL,
  `email` varchar(160) COLLATE utf8mb4_unicode_ci NOT NULL,
  `success` tinyint(1) NOT NULL DEFAULT '0',
  `ip_address` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `login_history_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `login_history`
--

LOCK TABLES `login_history` WRITE;
/*!40000 ALTER TABLE `login_history` DISABLE KEYS */;
INSERT INTO `login_history` VALUES (1,NULL,'admin@college.test',0,'::1','2026-09-20 05:27:11'),(2,6,'aiml@college.test',1,'::1','2026-09-20 05:28:54'),(3,1,'gsssr@college.test',1,'::1','2026-09-20 05:30:36'),(4,2,'ietw@college.test',1,'::1','2026-09-20 05:37:19'),(5,1,'gsssr@college.test',1,'::1','2026-09-20 05:44:50'),(6,2,'ietw@college.test',1,'::1','2026-09-20 05:46:13'),(7,6,'aiml@college.test',1,'::1','2026-09-20 06:04:03'),(8,1,'gsssr@college.test',1,'::1','2026-09-24 09:39:08'),(9,1,'gsssr@college.test',1,'::1','2026-09-25 08:41:10');
/*!40000 ALTER TABLE `login_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notifications`
--

DROP TABLE IF EXISTS `notifications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `notifications` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int DEFAULT NULL,
  `title` varchar(160) COLLATE utf8mb4_unicode_ci NOT NULL,
  `message` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_read` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `notifications_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notifications`
--

LOCK TABLES `notifications` WRITE;
/*!40000 ALTER TABLE `notifications` DISABLE KEYS */;
INSERT INTO `notifications` VALUES (1,2,'All Requests Consolidated','All pending requests consolidated into one request #REQ-20260920-888559',0,'2026-09-20 05:43:26'),(2,2,'GSSSR Decision','The request has been partially approved. IETW must now distribute the approved quantities to the respective departments.',0,'2026-09-20 05:45:37');
/*!40000 ALTER TABLE `notifications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pdf_export_logs`
--

DROP TABLE IF EXISTS `pdf_export_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pdf_export_logs` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int DEFAULT NULL,
  `report_type` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL,
  `file_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ip_address` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `pdf_export_logs_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pdf_export_logs`
--

LOCK TABLES `pdf_export_logs` WRITE;
/*!40000 ALTER TABLE `pdf_export_logs` DISABLE KEYS */;
INSERT INTO `pdf_export_logs` VALUES (1,6,'REQUEST','Request_Artificial_Intelligence_and_Machine_Learning_2026-09-20.pdf','::1','2026-09-20 05:29:47'),(2,1,'REQUEST','Request_Central_Administrative_Cell_2026-09-20.pdf','::1','2026-09-20 05:45:14'),(3,2,'STOCKBOOK','StockBook_GSSSIETW - Stock_Current_month_2026-09-20.pdf','::1','2026-09-20 06:03:27');
/*!40000 ALTER TABLE `pdf_export_logs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `request_items`
--

DROP TABLE IF EXISTS `request_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `request_items` (
  `id` int NOT NULL AUTO_INCREMENT,
  `request_id` int NOT NULL,
  `item_id` int NOT NULL,
  `requested_quantity` decimal(12,2) NOT NULL,
  `justification` text COLLATE utf8mb4_unicode_ci,
  `ietw_recommended_qty` decimal(12,2) NOT NULL DEFAULT '0.00',
  `gsssr_approved_qty` decimal(12,2) NOT NULL DEFAULT '0.00',
  `issued_quantity` decimal(12,2) NOT NULL DEFAULT '0.00',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `request_id` (`request_id`),
  KEY `item_id` (`item_id`),
  CONSTRAINT `request_items_ibfk_1` FOREIGN KEY (`request_id`) REFERENCES `requests` (`id`) ON DELETE CASCADE,
  CONSTRAINT `request_items_ibfk_2` FOREIGN KEY (`item_id`) REFERENCES `items` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=66 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `request_items`
--

LOCK TABLES `request_items` WRITE;
/*!40000 ALTER TABLE `request_items` DISABLE KEYS */;
INSERT INTO `request_items` VALUES (1,4,1,22.00,NULL,22.00,20.00,20.00,'2022-08-10 04:00:00'),(2,11,1,22.00,NULL,22.00,20.00,20.00,'2023-07-12 04:00:00'),(3,18,1,22.00,NULL,22.00,20.00,20.00,'2024-06-15 04:00:00'),(4,25,1,22.00,NULL,22.00,20.00,20.00,'2025-05-14 04:00:00'),(5,32,1,22.00,NULL,22.00,20.00,20.00,'2026-04-10 04:00:00'),(6,3,1,22.00,NULL,22.00,20.00,20.00,'2022-08-10 04:00:00'),(7,10,1,22.00,NULL,22.00,20.00,20.00,'2023-07-12 04:00:00'),(8,17,1,22.00,NULL,22.00,20.00,20.00,'2024-06-15 04:00:00'),(9,24,1,22.00,NULL,22.00,20.00,20.00,'2025-05-14 04:00:00'),(10,31,1,22.00,NULL,22.00,20.00,20.00,'2026-04-10 04:00:00'),(11,6,1,40.00,NULL,40.00,36.00,36.00,'2022-08-10 04:00:00'),(12,13,1,40.00,NULL,40.00,36.00,36.00,'2023-07-12 04:00:00'),(13,20,1,40.00,NULL,40.00,36.00,36.00,'2024-06-15 04:00:00'),(14,27,1,40.00,NULL,40.00,36.00,36.00,'2025-05-14 04:00:00'),(15,34,1,40.00,NULL,40.00,36.00,36.00,'2026-04-10 04:00:00'),(16,1,1,30.00,NULL,30.00,27.00,27.00,'2022-08-10 04:00:00'),(17,8,1,30.00,NULL,30.00,27.00,27.00,'2023-07-12 04:00:00'),(18,15,1,30.00,NULL,30.00,27.00,27.00,'2024-06-15 04:00:00'),(19,22,1,30.00,NULL,30.00,27.00,27.00,'2025-05-14 04:00:00'),(20,29,1,30.00,NULL,30.00,27.00,27.00,'2026-04-10 04:00:00'),(21,2,1,28.00,NULL,28.00,25.00,25.00,'2022-08-10 04:00:00'),(22,9,1,28.00,NULL,28.00,25.00,25.00,'2023-07-12 04:00:00'),(23,16,1,28.00,NULL,28.00,25.00,25.00,'2024-06-15 04:00:00'),(24,23,1,28.00,NULL,28.00,25.00,25.00,'2025-05-14 04:00:00'),(25,30,1,28.00,NULL,28.00,25.00,25.00,'2026-04-10 04:00:00'),(26,5,1,24.00,NULL,24.00,22.00,22.00,'2022-08-10 04:00:00'),(27,12,1,24.00,NULL,24.00,22.00,22.00,'2023-07-12 04:00:00'),(28,19,1,24.00,NULL,24.00,22.00,22.00,'2024-06-15 04:00:00'),(29,26,1,24.00,NULL,24.00,22.00,22.00,'2025-05-14 04:00:00'),(30,33,1,24.00,NULL,24.00,22.00,22.00,'2026-04-10 04:00:00'),(32,4,195,16.00,NULL,16.00,14.00,14.00,'2022-08-10 04:00:00'),(33,11,195,16.00,NULL,16.00,14.00,14.00,'2023-07-12 04:00:00'),(34,18,195,16.00,NULL,16.00,14.00,14.00,'2024-06-15 04:00:00'),(35,25,195,16.00,NULL,16.00,14.00,14.00,'2025-05-14 04:00:00'),(36,32,195,16.00,NULL,16.00,14.00,14.00,'2026-04-10 04:00:00'),(37,3,195,16.00,NULL,16.00,14.00,14.00,'2022-08-10 04:00:00'),(38,10,195,16.00,NULL,16.00,14.00,14.00,'2023-07-12 04:00:00'),(39,17,195,16.00,NULL,16.00,14.00,14.00,'2024-06-15 04:00:00'),(40,24,195,16.00,NULL,16.00,14.00,14.00,'2025-05-14 04:00:00'),(41,31,195,16.00,NULL,16.00,14.00,14.00,'2026-04-10 04:00:00'),(42,6,194,10.00,NULL,10.00,8.00,8.00,'2022-08-10 04:00:00'),(43,13,194,10.00,NULL,10.00,8.00,8.00,'2023-07-12 04:00:00'),(44,20,194,10.00,NULL,10.00,8.00,8.00,'2024-06-15 04:00:00'),(45,27,194,10.00,NULL,10.00,8.00,8.00,'2025-05-14 04:00:00'),(46,34,194,10.00,NULL,10.00,8.00,8.00,'2026-04-10 04:00:00'),(47,1,196,18.00,NULL,18.00,16.00,16.00,'2022-08-10 04:00:00'),(48,8,196,18.00,NULL,18.00,16.00,16.00,'2023-07-12 04:00:00'),(49,15,196,18.00,NULL,18.00,16.00,16.00,'2024-06-15 04:00:00'),(50,22,196,18.00,NULL,18.00,16.00,16.00,'2025-05-14 04:00:00'),(51,29,196,18.00,NULL,18.00,16.00,16.00,'2026-04-10 04:00:00'),(52,2,197,20.00,NULL,20.00,18.00,18.00,'2022-08-10 04:00:00'),(53,9,197,20.00,NULL,20.00,18.00,18.00,'2023-07-12 04:00:00'),(54,16,197,20.00,NULL,20.00,18.00,18.00,'2024-06-15 04:00:00'),(55,23,197,20.00,NULL,20.00,18.00,18.00,'2025-05-14 04:00:00'),(56,30,197,20.00,NULL,20.00,18.00,18.00,'2026-04-10 04:00:00'),(57,5,5,14.00,NULL,14.00,12.00,12.00,'2022-08-10 04:00:00'),(58,12,5,14.00,NULL,14.00,12.00,12.00,'2023-07-12 04:00:00'),(59,19,5,14.00,NULL,14.00,12.00,12.00,'2024-06-15 04:00:00'),(60,26,5,14.00,NULL,14.00,12.00,12.00,'2025-05-14 04:00:00'),(61,33,5,14.00,NULL,14.00,12.00,12.00,'2026-04-10 04:00:00'),(62,35,197,5.00,'',0.00,0.00,0.00,'2026-09-20 05:29:43'),(63,35,163,2.00,'',0.00,0.00,0.00,'2026-09-20 05:29:43'),(64,36,197,5.00,'Aggregated from multiple department requests',5.00,3.00,0.00,'2026-09-20 05:43:26'),(65,36,163,2.00,'Aggregated from multiple department requests',2.00,2.00,0.00,'2026-09-20 05:43:26');
/*!40000 ALTER TABLE `request_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `requests`
--

DROP TABLE IF EXISTS `requests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `requests` (
  `id` int NOT NULL AUTO_INCREMENT,
  `request_no` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL,
  `department_id` int NOT NULL,
  `requested_by` int NOT NULL,
  `purpose` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('PENDING_IETW','CONSOLIDATED_BY_IETW','APPROVED_BY_GSSSR','PARTIALLY_APPROVED_BY_GSSSR','REJECTED_BY_GSSSR','ISSUED','PARTIALLY_ISSUED') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'PENDING_IETW',
  `ietw_remarks` text COLLATE utf8mb4_unicode_ci,
  `ietw_processed_by` int DEFAULT NULL,
  `ietw_processed_at` datetime DEFAULT NULL,
  `gsssr_remarks` text COLLATE utf8mb4_unicode_ci,
  `gsssr_approved_by` int DEFAULT NULL,
  `gsssr_approved_at` datetime DEFAULT NULL,
  `admin_issued_by` int DEFAULT NULL,
  `admin_issued_at` datetime DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `is_consolidated` tinyint(1) DEFAULT '0',
  `source_request_ids` text COLLATE utf8mb4_unicode_ci,
  `consolidated_by` int DEFAULT NULL,
  `consolidated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `request_no` (`request_no`),
  KEY `idx_req_status` (`status`),
  KEY `idx_req_dept_date` (`department_id`,`created_at`),
  KEY `requested_by` (`requested_by`),
  KEY `ietw_processed_by` (`ietw_processed_by`),
  KEY `gsssr_approved_by` (`gsssr_approved_by`),
  KEY `admin_issued_by` (`admin_issued_by`),
  CONSTRAINT `requests_ibfk_1` FOREIGN KEY (`department_id`) REFERENCES `departments` (`id`),
  CONSTRAINT `requests_ibfk_2` FOREIGN KEY (`requested_by`) REFERENCES `users` (`id`),
  CONSTRAINT `requests_ibfk_3` FOREIGN KEY (`ietw_processed_by`) REFERENCES `users` (`id`),
  CONSTRAINT `requests_ibfk_4` FOREIGN KEY (`gsssr_approved_by`) REFERENCES `users` (`id`),
  CONSTRAINT `requests_ibfk_5` FOREIGN KEY (`admin_issued_by`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `requests`
--

LOCK TABLES `requests` WRITE;
/*!40000 ALTER TABLE `requests` DISABLE KEYS */;
INSERT INTO `requests` VALUES (1,'SAMPLE-ECE-2022',2,4,'Sample annual department stock requirement','ISSUED','Consolidated sample',2,'2022-08-10 09:45:00','Approved for academic use',1,'2022-08-10 10:00:00',1,'2022-08-11 12:00:00','2022-08-10 04:00:00',NULL,0,NULL,NULL,NULL),(2,'SAMPLE-EEE-2022',3,5,'Sample annual department stock requirement','ISSUED','Consolidated sample',2,'2022-08-10 09:45:00','Approved for academic use',1,'2022-08-10 10:00:00',1,'2022-08-11 12:00:00','2022-08-10 04:00:00',NULL,0,NULL,NULL,NULL),(3,'SAMPLE-AIML-2022',4,6,'Sample annual department stock requirement','ISSUED','Consolidated sample',2,'2022-08-10 09:45:00','Approved for academic use',1,'2022-08-10 10:00:00',1,'2022-08-11 12:00:00','2022-08-10 04:00:00',NULL,0,NULL,NULL,NULL),(4,'SAMPLE-AIDS-2022',5,7,'Sample annual department stock requirement','ISSUED','Consolidated sample',2,'2022-08-10 09:45:00','Approved for academic use',1,'2022-08-10 10:00:00',1,'2022-08-11 12:00:00','2022-08-10 04:00:00',NULL,0,NULL,NULL,NULL),(5,'SAMPLE-ISE-2022',6,8,'Sample annual department stock requirement','ISSUED','Consolidated sample',2,'2022-08-10 09:45:00','Approved for academic use',1,'2022-08-10 10:00:00',1,'2022-08-11 12:00:00','2022-08-10 04:00:00',NULL,0,NULL,NULL,NULL),(6,'SAMPLE-CAC-2022',7,9,'Sample annual department stock requirement','ISSUED','Consolidated sample',2,'2022-08-10 09:45:00','Approved for academic use',1,'2022-08-10 10:00:00',1,'2022-08-11 12:00:00','2022-08-10 04:00:00',NULL,0,NULL,NULL,NULL),(8,'SAMPLE-ECE-2023',2,4,'Sample annual department stock requirement','ISSUED','Consolidated sample',2,'2023-07-12 09:45:00','Approved for academic use',1,'2023-07-12 10:00:00',1,'2023-07-13 12:00:00','2023-07-12 04:00:00',NULL,0,NULL,NULL,NULL),(9,'SAMPLE-EEE-2023',3,5,'Sample annual department stock requirement','ISSUED','Consolidated sample',2,'2023-07-12 09:45:00','Approved for academic use',1,'2023-07-12 10:00:00',1,'2023-07-13 12:00:00','2023-07-12 04:00:00',NULL,0,NULL,NULL,NULL),(10,'SAMPLE-AIML-2023',4,6,'Sample annual department stock requirement','ISSUED','Consolidated sample',2,'2023-07-12 09:45:00','Approved for academic use',1,'2023-07-12 10:00:00',1,'2023-07-13 12:00:00','2023-07-12 04:00:00',NULL,0,NULL,NULL,NULL),(11,'SAMPLE-AIDS-2023',5,7,'Sample annual department stock requirement','ISSUED','Consolidated sample',2,'2023-07-12 09:45:00','Approved for academic use',1,'2023-07-12 10:00:00',1,'2023-07-13 12:00:00','2023-07-12 04:00:00',NULL,0,NULL,NULL,NULL),(12,'SAMPLE-ISE-2023',6,8,'Sample annual department stock requirement','ISSUED','Consolidated sample',2,'2023-07-12 09:45:00','Approved for academic use',1,'2023-07-12 10:00:00',1,'2023-07-13 12:00:00','2023-07-12 04:00:00',NULL,0,NULL,NULL,NULL),(13,'SAMPLE-CAC-2023',7,9,'Sample annual department stock requirement','ISSUED','Consolidated sample',2,'2023-07-12 09:45:00','Approved for academic use',1,'2023-07-12 10:00:00',1,'2023-07-13 12:00:00','2023-07-12 04:00:00',NULL,0,NULL,NULL,NULL),(15,'SAMPLE-ECE-2024',2,4,'Sample annual department stock requirement','ISSUED','Consolidated sample',2,'2024-06-15 09:45:00','Approved for academic use',1,'2024-06-15 10:00:00',1,'2024-06-16 12:00:00','2024-06-15 04:00:00',NULL,0,NULL,NULL,NULL),(16,'SAMPLE-EEE-2024',3,5,'Sample annual department stock requirement','ISSUED','Consolidated sample',2,'2024-06-15 09:45:00','Approved for academic use',1,'2024-06-15 10:00:00',1,'2024-06-16 12:00:00','2024-06-15 04:00:00',NULL,0,NULL,NULL,NULL),(17,'SAMPLE-AIML-2024',4,6,'Sample annual department stock requirement','ISSUED','Consolidated sample',2,'2024-06-15 09:45:00','Approved for academic use',1,'2024-06-15 10:00:00',1,'2024-06-16 12:00:00','2024-06-15 04:00:00',NULL,0,NULL,NULL,NULL),(18,'SAMPLE-AIDS-2024',5,7,'Sample annual department stock requirement','ISSUED','Consolidated sample',2,'2024-06-15 09:45:00','Approved for academic use',1,'2024-06-15 10:00:00',1,'2024-06-16 12:00:00','2024-06-15 04:00:00',NULL,0,NULL,NULL,NULL),(19,'SAMPLE-ISE-2024',6,8,'Sample annual department stock requirement','ISSUED','Consolidated sample',2,'2024-06-15 09:45:00','Approved for academic use',1,'2024-06-15 10:00:00',1,'2024-06-16 12:00:00','2024-06-15 04:00:00',NULL,0,NULL,NULL,NULL),(20,'SAMPLE-CAC-2024',7,9,'Sample annual department stock requirement','ISSUED','Consolidated sample',2,'2024-06-15 09:45:00','Approved for academic use',1,'2024-06-15 10:00:00',1,'2024-06-16 12:00:00','2024-06-15 04:00:00',NULL,0,NULL,NULL,NULL),(22,'SAMPLE-ECE-2025',2,4,'Sample annual department stock requirement','ISSUED','Consolidated sample',2,'2025-05-14 09:45:00','Approved for academic use',1,'2025-05-14 10:00:00',1,'2025-05-15 12:00:00','2025-05-14 04:00:00',NULL,0,NULL,NULL,NULL),(23,'SAMPLE-EEE-2025',3,5,'Sample annual department stock requirement','ISSUED','Consolidated sample',2,'2025-05-14 09:45:00','Approved for academic use',1,'2025-05-14 10:00:00',1,'2025-05-15 12:00:00','2025-05-14 04:00:00',NULL,0,NULL,NULL,NULL),(24,'SAMPLE-AIML-2025',4,6,'Sample annual department stock requirement','ISSUED','Consolidated sample',2,'2025-05-14 09:45:00','Approved for academic use',1,'2025-05-14 10:00:00',1,'2025-05-15 12:00:00','2025-05-14 04:00:00',NULL,0,NULL,NULL,NULL),(25,'SAMPLE-AIDS-2025',5,7,'Sample annual department stock requirement','ISSUED','Consolidated sample',2,'2025-05-14 09:45:00','Approved for academic use',1,'2025-05-14 10:00:00',1,'2025-05-15 12:00:00','2025-05-14 04:00:00',NULL,0,NULL,NULL,NULL),(26,'SAMPLE-ISE-2025',6,8,'Sample annual department stock requirement','ISSUED','Consolidated sample',2,'2025-05-14 09:45:00','Approved for academic use',1,'2025-05-14 10:00:00',1,'2025-05-15 12:00:00','2025-05-14 04:00:00',NULL,0,NULL,NULL,NULL),(27,'SAMPLE-CAC-2025',7,9,'Sample annual department stock requirement','ISSUED','Consolidated sample',2,'2025-05-14 09:45:00','Approved for academic use',1,'2025-05-14 10:00:00',1,'2025-05-15 12:00:00','2025-05-14 04:00:00',NULL,0,NULL,NULL,NULL),(29,'SAMPLE-ECE-2026',2,4,'Sample annual department stock requirement','ISSUED','Consolidated sample',2,'2026-04-10 09:45:00','Approved for academic use',1,'2026-04-10 10:00:00',1,'2026-04-11 12:00:00','2026-04-10 04:00:00',NULL,0,NULL,NULL,NULL),(30,'SAMPLE-EEE-2026',3,5,'Sample annual department stock requirement','ISSUED','Consolidated sample',2,'2026-04-10 09:45:00','Approved for academic use',1,'2026-04-10 10:00:00',1,'2026-04-11 12:00:00','2026-04-10 04:00:00',NULL,0,NULL,NULL,NULL),(31,'SAMPLE-AIML-2026',4,6,'Sample annual department stock requirement','ISSUED','Consolidated sample',2,'2026-04-10 09:45:00','Approved for academic use',1,'2026-04-10 10:00:00',1,'2026-04-11 12:00:00','2026-04-10 04:00:00',NULL,0,NULL,NULL,NULL),(32,'SAMPLE-AIDS-2026',5,7,'Sample annual department stock requirement','ISSUED','Consolidated sample',2,'2026-04-10 09:45:00','Approved for academic use',1,'2026-04-10 10:00:00',1,'2026-04-11 12:00:00','2026-04-10 04:00:00',NULL,0,NULL,NULL,NULL),(33,'SAMPLE-ISE-2026',6,8,'Sample annual department stock requirement','ISSUED','Consolidated sample',2,'2026-04-10 09:45:00','Approved for academic use',1,'2026-04-10 10:00:00',1,'2026-04-11 12:00:00','2026-04-10 04:00:00',NULL,0,NULL,NULL,NULL),(34,'SAMPLE-CAC-2026',7,9,'Sample annual department stock requirement','ISSUED','Consolidated sample',2,'2026-04-10 09:45:00','Approved for academic use',1,'2026-04-10 10:00:00',1,'2026-04-11 12:00:00','2026-04-10 04:00:00',NULL,0,NULL,NULL,NULL),(35,'REQ-20260920-DEC04D',4,6,'Stationery requirement for Odd Semester 2026-27','ISSUED',NULL,2,'2026-09-20 11:13:26',NULL,NULL,NULL,NULL,NULL,'2026-09-20 05:29:43','2026-09-20 06:02:42',1,NULL,NULL,NULL),(36,'REQ-20260920-888559',7,2,'Consolidated request from multiple departments – 2026-09-20 11:13:26','ISSUED','',2,'2026-09-20 11:13:26','The request has been partially approved. IETW must now distribute the approved quantities to the respective departments.',1,'2026-09-20 11:15:37',2,'2026-09-20 11:32:42','2026-09-20 05:43:26','2026-09-20 06:02:42',1,'35',2,'2026-09-20 11:13:26');
/*!40000 ALTER TABLE `requests` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stock_book`
--

DROP TABLE IF EXISTS `stock_book`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stock_book` (
  `id` int NOT NULL AUTO_INCREMENT,
  `item_id` int NOT NULL,
  `transaction_type` enum('INWARD','OUTWARD','RETURN','ADJUSTMENT') COLLATE utf8mb4_unicode_ci NOT NULL,
  `inward_qty` decimal(12,2) NOT NULL DEFAULT '0.00',
  `outward_qty` decimal(12,2) NOT NULL DEFAULT '0.00',
  `balance_qty` decimal(12,2) NOT NULL,
  `remarks` text COLLATE utf8mb4_unicode_ci,
  `created_by` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `idx_stock_book_date` (`created_at`),
  KEY `item_id` (`item_id`),
  KEY `created_by` (`created_by`),
  CONSTRAINT `stock_book_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `items` (`id`),
  CONSTRAINT `stock_book_ibfk_2` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=204 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stock_book`
--

LOCK TABLES `stock_book` WRITE;
/*!40000 ALTER TABLE `stock_book` DISABLE KEYS */;
INSERT INTO `stock_book` VALUES (1,4,'INWARD',8.00,0.00,8.00,'Opening stock',1,'2026-06-07 11:05:32'),(2,2,'INWARD',12.00,0.00,12.00,'Opening stock',1,'2026-06-07 11:05:32'),(3,5,'INWARD',25.00,0.00,25.00,'Opening stock',1,'2026-06-07 11:05:32'),(4,3,'INWARD',40.00,0.00,40.00,'Opening stock',1,'2026-06-07 11:05:32'),(5,1,'INWARD',50.00,0.00,50.00,'Opening stock',1,'2026-06-07 11:05:32'),(6,6,'INWARD',60.00,0.00,60.00,'Opening stock',1,'2026-06-07 11:05:32'),(8,7,'INWARD',9.00,0.00,9.00,'Imported opening stock from workbook dated 08.07.2025',1,'2026-06-07 11:05:42'),(9,8,'INWARD',125.00,0.00,125.00,'Imported opening stock from workbook dated 08.07.2025',1,'2026-06-07 11:05:42'),(10,9,'INWARD',28.00,0.00,28.00,'Imported opening stock from workbook dated 08.07.2025',1,'2026-06-07 11:05:42'),(11,10,'INWARD',300.00,0.00,300.00,'Imported opening stock from workbook dated 08.07.2025',1,'2026-06-07 11:05:42'),(12,11,'INWARD',30.00,0.00,30.00,'Imported opening stock from workbook dated 08.07.2025',1,'2026-06-07 11:05:42'),(13,12,'INWARD',90.00,0.00,90.00,'Imported opening stock from workbook dated 08.07.2025',1,'2026-06-07 11:05:42'),(14,13,'INWARD',1000.00,0.00,1000.00,'Imported opening stock from workbook dated 08.07.2025',1,'2026-06-07 11:05:42'),(15,14,'INWARD',70.00,0.00,70.00,'Imported opening stock from workbook dated 08.07.2025',1,'2026-06-07 11:05:42'),(16,15,'INWARD',140.00,0.00,140.00,'Imported opening stock from workbook dated 08.07.2025',1,'2026-06-07 11:05:42'),(17,16,'INWARD',0.00,0.00,0.00,'Imported opening stock from workbook dated 08.07.2025',1,'2026-06-07 11:05:42'),(18,17,'INWARD',9.00,0.00,9.00,'Imported opening stock from workbook dated 08.07.2025',1,'2026-06-07 11:05:42'),(19,18,'INWARD',99.00,0.00,99.00,'Imported opening stock from workbook dated 08.07.2025',1,'2026-06-07 11:05:42'),(20,19,'INWARD',545.00,0.00,545.00,'Imported opening stock from workbook dated 08.07.2025',1,'2026-06-07 11:05:42'),(21,20,'INWARD',115.00,0.00,115.00,'Imported opening stock from workbook dated 08.07.2025',1,'2026-06-07 11:05:42'),(22,21,'INWARD',442.00,0.00,442.00,'Imported opening stock from workbook dated 08.07.2025',1,'2026-06-07 11:05:42'),(23,22,'INWARD',521.00,0.00,521.00,'Imported opening stock from workbook dated 08.07.2025',1,'2026-06-07 11:05:42'),(24,23,'INWARD',130.00,0.00,130.00,'Imported opening stock from workbook dated 08.07.2025',1,'2026-06-07 11:05:42'),(25,24,'INWARD',1.00,0.00,1.00,'Imported opening stock from workbook dated 08.07.2025',1,'2026-06-07 11:05:42'),(26,25,'INWARD',6.00,0.00,6.00,'Imported opening stock from workbook dated 08.07.2025',1,'2026-06-07 11:05:42'),(27,26,'INWARD',0.00,0.00,0.00,'Imported opening stock from workbook dated 08.07.2025',1,'2026-06-07 11:05:42'),(28,27,'INWARD',75.00,0.00,75.00,'Imported opening stock from workbook dated 08.07.2025',1,'2026-06-07 11:05:42'),(29,28,'INWARD',50.00,0.00,50.00,'Imported opening stock from workbook dated 08.07.2025',1,'2026-06-07 11:05:42'),(30,29,'INWARD',0.00,0.00,0.00,'Imported opening stock from workbook dated 08.07.2025',1,'2026-06-07 11:05:42'),(31,30,'INWARD',7.00,0.00,7.00,'Imported opening stock from workbook dated 08.07.2025',1,'2026-06-07 11:05:42'),(32,31,'INWARD',8.00,0.00,8.00,'Imported opening stock from workbook dated 08.07.2025',1,'2026-06-07 11:05:42'),(33,32,'INWARD',4.00,0.00,4.00,'Imported opening stock from workbook dated 08.07.2025',1,'2026-06-07 11:05:42'),(34,33,'INWARD',126.00,0.00,126.00,'Imported opening stock from workbook dated 08.07.2025',1,'2026-06-07 11:05:42'),(35,34,'INWARD',6.00,0.00,6.00,'Imported opening stock from workbook dated 08.07.2025',1,'2026-06-07 11:05:42'),(36,35,'INWARD',2768.00,0.00,2768.00,'Imported opening stock from workbook dated 08.07.2025',1,'2026-06-07 11:05:42'),(37,36,'INWARD',0.00,0.00,0.00,'Imported opening stock from workbook dated 08.07.2025',1,'2026-06-07 11:05:42'),(38,37,'INWARD',400.00,0.00,400.00,'Imported opening stock from workbook dated 08.07.2025',1,'2026-06-07 11:05:42'),(39,38,'INWARD',9000.00,0.00,9000.00,'Imported opening stock from workbook dated 08.07.2025',1,'2026-06-07 11:05:42'),(40,39,'INWARD',0.00,0.00,0.00,'Imported opening stock from workbook dated 08.07.2025',1,'2026-06-07 11:05:42'),(41,40,'INWARD',11.00,0.00,11.00,'Imported opening stock from workbook dated 08.07.2025',1,'2026-06-07 11:05:42'),(42,41,'INWARD',0.00,0.00,0.00,'Imported opening stock from workbook dated 08.07.2025',1,'2026-06-07 11:05:42'),(43,42,'INWARD',0.00,0.00,0.00,'Imported opening stock from workbook dated 08.07.2025',1,'2026-06-07 11:05:42'),(44,43,'INWARD',350.00,0.00,350.00,'Imported opening stock from workbook dated 08.07.2025',1,'2026-06-07 11:05:42'),(45,44,'INWARD',0.00,0.00,0.00,'Imported opening stock from workbook dated 08.07.2025',1,'2026-06-07 11:05:42'),(46,45,'INWARD',0.00,0.00,0.00,'Imported opening stock from workbook dated 08.07.2025',1,'2026-06-07 11:05:42'),(47,46,'INWARD',200.00,0.00,200.00,'Imported opening stock from workbook dated 08.07.2025',1,'2026-06-07 11:05:42'),(48,47,'INWARD',150.00,0.00,150.00,'Imported opening stock from workbook dated 08.07.2025',1,'2026-06-07 11:05:42'),(49,48,'INWARD',334.00,0.00,334.00,'Imported opening stock from workbook dated 08.07.2025',1,'2026-06-07 11:05:42'),(50,49,'INWARD',7.00,0.00,7.00,'Imported opening stock from workbook dated 08.07.2025',1,'2026-06-07 11:05:42'),(51,50,'INWARD',2.00,0.00,2.00,'Imported opening stock from workbook dated 08.07.2025',1,'2026-06-07 11:05:42'),(52,51,'INWARD',0.00,0.00,0.00,'Imported opening stock from workbook dated 08.07.2025',1,'2026-06-07 11:05:42'),(53,52,'INWARD',6.00,0.00,6.00,'Imported opening stock from workbook dated 08.07.2025',1,'2026-06-07 11:05:42'),(54,53,'INWARD',28.00,0.00,28.00,'Imported opening stock from workbook dated 08.07.2025',1,'2026-06-07 11:05:42'),(55,54,'INWARD',1.00,0.00,1.00,'Imported opening stock from workbook dated 08.07.2025',1,'2026-06-07 11:05:42'),(56,55,'INWARD',8.00,0.00,8.00,'Imported opening stock from workbook dated 08.07.2025',1,'2026-06-07 11:05:42'),(57,56,'INWARD',3.00,0.00,3.00,'Imported opening stock from workbook dated 08.07.2025',1,'2026-06-07 11:05:42'),(58,57,'INWARD',8.00,0.00,8.00,'Imported opening stock from workbook dated 08.07.2025',1,'2026-06-07 11:05:42'),(59,58,'INWARD',3.00,0.00,3.00,'Imported opening stock from workbook dated 08.07.2025',1,'2026-06-07 11:05:42'),(60,59,'INWARD',0.00,0.00,0.00,'Imported opening stock from workbook dated 08.07.2025',1,'2026-06-07 11:05:42'),(61,60,'INWARD',11.00,0.00,11.00,'Imported opening stock from workbook dated 08.07.2025',1,'2026-06-07 11:05:42'),(62,61,'INWARD',0.00,0.00,0.00,'Imported opening stock from workbook dated 08.07.2025',1,'2026-06-07 11:05:42'),(63,62,'INWARD',7.00,0.00,7.00,'Imported opening stock from workbook dated 08.07.2025',1,'2026-06-07 11:05:42'),(64,63,'INWARD',0.00,0.00,0.00,'Imported opening stock from workbook dated 08.07.2025',1,'2026-06-07 11:05:42'),(65,64,'INWARD',0.00,0.00,0.00,'Imported opening stock from workbook dated 08.07.2025',1,'2026-06-07 11:05:42'),(66,65,'INWARD',4.00,0.00,4.00,'Imported opening stock from workbook dated 08.07.2025',1,'2026-06-07 11:05:42'),(67,66,'INWARD',20.00,0.00,20.00,'Imported opening stock from workbook dated 08.07.2025',1,'2026-06-07 11:05:42'),(68,67,'INWARD',250.00,0.00,250.00,'Imported opening stock from workbook dated 08.07.2025',1,'2026-06-07 11:05:42'),(69,68,'INWARD',8.00,0.00,8.00,'Imported opening stock from workbook dated 08.07.2025',1,'2026-06-07 11:05:42'),(70,69,'INWARD',0.00,0.00,0.00,'Imported opening stock from workbook dated 08.07.2025',1,'2026-06-07 11:05:42'),(71,70,'INWARD',0.00,0.00,0.00,'Imported opening stock from workbook dated 08.07.2025',1,'2026-06-07 11:05:42'),(72,71,'INWARD',16.00,0.00,16.00,'Imported opening stock from workbook dated 08.07.2025',1,'2026-06-07 11:05:42'),(73,72,'INWARD',1.00,0.00,1.00,'Imported opening stock from workbook dated 08.07.2025',1,'2026-06-07 11:05:42'),(74,73,'INWARD',6.00,0.00,6.00,'Imported opening stock from workbook dated 08.07.2025',1,'2026-06-07 11:05:42'),(75,74,'INWARD',23.00,0.00,23.00,'Imported opening stock from workbook dated 08.07.2025',1,'2026-06-07 11:05:42'),(76,75,'INWARD',12.00,0.00,12.00,'Imported opening stock from workbook dated 08.07.2025',1,'2026-06-07 11:05:42'),(77,76,'INWARD',10.00,0.00,10.00,'Imported opening stock from workbook dated 08.07.2025',1,'2026-06-07 11:05:42'),(78,77,'INWARD',0.00,0.00,0.00,'Imported opening stock from workbook dated 08.07.2025',1,'2026-06-07 11:05:42'),(79,78,'INWARD',2.00,0.00,2.00,'Imported opening stock from workbook dated 08.07.2025',1,'2026-06-07 11:05:42'),(80,79,'INWARD',10.00,0.00,10.00,'Imported opening stock from workbook dated 08.07.2025',1,'2026-06-07 11:05:42'),(81,80,'INWARD',10.00,0.00,10.00,'Imported opening stock from workbook dated 08.07.2025',1,'2026-06-07 11:05:42'),(82,81,'INWARD',67.00,0.00,67.00,'Imported opening stock from workbook dated 08.07.2025',1,'2026-06-07 11:05:42'),(83,82,'INWARD',0.00,0.00,0.00,'Imported opening stock from workbook dated 08.07.2025',1,'2026-06-07 11:05:42'),(84,83,'INWARD',0.00,0.00,0.00,'Imported opening stock from workbook dated 08.07.2025',1,'2026-06-07 11:05:42'),(85,84,'INWARD',25.00,0.00,25.00,'Imported opening stock from workbook dated 08.07.2025',1,'2026-06-07 11:05:42'),(86,85,'INWARD',20.00,0.00,20.00,'Imported opening stock from workbook dated 08.07.2025',1,'2026-06-07 11:05:42'),(87,86,'INWARD',3.00,0.00,3.00,'Imported opening stock from workbook dated 08.07.2025',1,'2026-06-07 11:05:42'),(88,87,'INWARD',50.00,0.00,50.00,'Imported opening stock from workbook dated 08.07.2025',1,'2026-06-07 11:05:42'),(89,88,'INWARD',10.00,0.00,10.00,'Imported opening stock from workbook dated 08.07.2025',1,'2026-06-07 11:05:42'),(90,89,'INWARD',18.00,0.00,18.00,'Imported opening stock from workbook dated 08.07.2025',1,'2026-06-07 11:05:42'),(91,90,'INWARD',4.00,0.00,4.00,'Imported opening stock from workbook dated 08.07.2025',1,'2026-06-07 11:05:42'),(92,91,'INWARD',0.00,0.00,0.00,'Imported opening stock from workbook dated 08.07.2025',1,'2026-06-07 11:05:42'),(93,92,'INWARD',38.00,0.00,38.00,'Imported opening stock from workbook dated 08.07.2025',1,'2026-06-07 11:05:42'),(94,93,'INWARD',15.00,0.00,15.00,'Imported opening stock from workbook dated 08.07.2025',1,'2026-06-07 11:05:42'),(95,94,'INWARD',6.00,0.00,6.00,'Imported opening stock from workbook dated 08.07.2025',1,'2026-06-07 11:05:42'),(96,95,'INWARD',0.00,0.00,0.00,'Imported opening stock from workbook dated 08.07.2025',1,'2026-06-07 11:05:42'),(97,96,'INWARD',8.00,0.00,8.00,'Imported opening stock from workbook dated 08.07.2025',1,'2026-06-07 11:05:42'),(98,97,'INWARD',1.00,0.00,1.00,'Imported opening stock from workbook dated 08.07.2025',1,'2026-06-07 11:05:42'),(99,98,'INWARD',6.00,0.00,6.00,'Imported opening stock from workbook dated 08.07.2025',1,'2026-06-07 11:05:42'),(100,99,'INWARD',3.00,0.00,3.00,'Imported opening stock from workbook dated 08.07.2025',1,'2026-06-07 11:05:42'),(101,100,'INWARD',1.00,0.00,1.00,'Imported opening stock from workbook dated 08.07.2025',1,'2026-06-07 11:05:42'),(102,101,'INWARD',5.00,0.00,5.00,'Imported opening stock from workbook dated 08.07.2025',1,'2026-06-07 11:05:42'),(103,102,'INWARD',5.00,0.00,5.00,'Imported opening stock from workbook dated 08.07.2025',1,'2026-06-07 11:05:42'),(104,103,'INWARD',0.00,0.00,0.00,'Imported opening stock from workbook dated 08.07.2025',1,'2026-06-07 11:05:42'),(105,104,'INWARD',2.00,0.00,2.00,'Imported opening stock from workbook dated 08.07.2025',1,'2026-06-07 11:05:42'),(106,105,'INWARD',3.00,0.00,3.00,'Imported opening stock from workbook dated 08.07.2025',1,'2026-06-07 11:05:42'),(107,106,'INWARD',5.00,0.00,5.00,'Imported opening stock from workbook dated 08.07.2025',1,'2026-06-07 11:05:42'),(108,107,'INWARD',0.00,0.00,0.00,'Imported opening stock from workbook dated 08.07.2025',1,'2026-06-07 11:05:42'),(109,108,'INWARD',12.00,0.00,12.00,'Imported opening stock from workbook dated 08.07.2025',1,'2026-06-07 11:05:42'),(110,109,'INWARD',3.00,0.00,3.00,'Imported opening stock from workbook dated 08.07.2025',1,'2026-06-07 11:05:42'),(111,110,'INWARD',0.00,0.00,0.00,'Imported opening stock from workbook dated 08.07.2025',1,'2026-06-07 11:05:42'),(112,111,'INWARD',0.00,0.00,0.00,'Imported opening stock from workbook dated 08.07.2025',1,'2026-06-07 11:05:42'),(113,112,'INWARD',0.00,0.00,0.00,'Imported opening stock from workbook dated 08.07.2025',1,'2026-06-07 11:05:42'),(114,113,'INWARD',0.00,0.00,0.00,'Imported opening stock from workbook dated 08.07.2025',1,'2026-06-07 11:05:42'),(115,114,'INWARD',8.00,0.00,8.00,'Imported opening stock from workbook dated 08.07.2025',1,'2026-06-07 11:05:42'),(116,115,'INWARD',4.00,0.00,4.00,'Imported opening stock from workbook dated 08.07.2025',1,'2026-06-07 11:05:42'),(117,116,'INWARD',0.00,0.00,0.00,'Imported opening stock from workbook dated 08.07.2025',1,'2026-06-07 11:05:42'),(118,117,'INWARD',30.00,0.00,30.00,'Imported opening stock from workbook dated 08.07.2025',1,'2026-06-07 11:05:42'),(119,118,'INWARD',27.00,0.00,27.00,'Imported opening stock from workbook dated 08.07.2025',1,'2026-06-07 11:05:42'),(120,119,'INWARD',3.00,0.00,3.00,'Imported opening stock from workbook dated 08.07.2025',1,'2026-06-07 11:05:42'),(121,120,'INWARD',24.00,0.00,24.00,'Imported opening stock from workbook dated 08.07.2025',1,'2026-06-07 11:05:42'),(122,121,'INWARD',0.00,0.00,0.00,'Imported opening stock from workbook dated 08.07.2025',1,'2026-06-07 11:05:42'),(123,122,'INWARD',0.00,0.00,0.00,'Imported opening stock from workbook dated 08.07.2025',1,'2026-06-07 11:05:42'),(124,123,'INWARD',1.00,0.00,1.00,'Imported opening stock from workbook dated 08.07.2025',1,'2026-06-07 11:05:42'),(125,124,'INWARD',33.00,0.00,33.00,'Imported opening stock from workbook dated 08.07.2025',1,'2026-06-07 11:05:42'),(126,125,'INWARD',0.00,0.00,0.00,'Imported opening stock from workbook dated 08.07.2025',1,'2026-06-07 11:05:42'),(127,126,'INWARD',0.00,0.00,0.00,'Imported opening stock from workbook dated 08.07.2025',1,'2026-06-07 11:05:42'),(128,127,'INWARD',70.00,0.00,70.00,'Imported opening stock from workbook dated 08.07.2025',1,'2026-06-07 11:05:42'),(129,128,'INWARD',34.00,0.00,34.00,'Imported opening stock from workbook dated 08.07.2025',1,'2026-06-07 11:05:42'),(130,129,'INWARD',30.00,0.00,30.00,'Imported opening stock from workbook dated 08.07.2025',1,'2026-06-07 11:05:42'),(131,130,'INWARD',21.00,0.00,21.00,'Imported opening stock from workbook dated 08.07.2025',1,'2026-06-07 11:05:42'),(132,131,'INWARD',0.00,0.00,0.00,'Imported opening stock from workbook dated 08.07.2025',1,'2026-06-07 11:05:42'),(133,132,'INWARD',12.00,0.00,12.00,'Imported opening stock from workbook dated 08.07.2025',1,'2026-06-07 11:05:42'),(134,133,'INWARD',100.00,0.00,100.00,'Imported opening stock from workbook dated 08.07.2025',1,'2026-06-07 11:05:42'),(135,134,'INWARD',0.00,0.00,0.00,'Imported opening stock from workbook dated 08.07.2025',1,'2026-06-07 11:05:42'),(136,135,'INWARD',13.00,0.00,13.00,'Imported opening stock from workbook dated 08.07.2025',1,'2026-06-07 11:05:42'),(137,136,'INWARD',0.00,0.00,0.00,'Imported opening stock from workbook dated 08.07.2025',1,'2026-06-07 11:05:42'),(138,137,'INWARD',34.00,0.00,34.00,'Imported opening stock from workbook dated 08.07.2025',1,'2026-06-07 11:05:42'),(139,138,'INWARD',30.00,0.00,30.00,'Imported opening stock from workbook dated 08.07.2025',1,'2026-06-07 11:05:42'),(140,139,'INWARD',3.00,0.00,3.00,'Imported opening stock from workbook dated 08.07.2025',1,'2026-06-07 11:05:42'),(141,140,'INWARD',0.00,0.00,0.00,'Imported opening stock from workbook dated 08.07.2025',1,'2026-06-07 11:05:42'),(142,141,'INWARD',0.00,0.00,0.00,'Imported opening stock from workbook dated 08.07.2025',1,'2026-06-07 11:05:42'),(143,142,'INWARD',0.00,0.00,0.00,'Imported opening stock from workbook dated 08.07.2025',1,'2026-06-07 11:05:42'),(144,143,'INWARD',0.00,0.00,0.00,'Imported opening stock from workbook dated 08.07.2025',1,'2026-06-07 11:05:42'),(145,144,'INWARD',0.00,0.00,0.00,'Imported opening stock from workbook dated 08.07.2025',1,'2026-06-07 11:05:42'),(146,145,'INWARD',1.00,0.00,1.00,'Imported opening stock from workbook dated 08.07.2025',1,'2026-06-07 11:05:42'),(147,146,'INWARD',13.00,0.00,13.00,'Imported opening stock from workbook dated 08.07.2025',1,'2026-06-07 11:05:42'),(148,147,'INWARD',0.00,0.00,0.00,'Imported opening stock from workbook dated 08.07.2025',1,'2026-06-07 11:05:42'),(149,148,'INWARD',0.00,0.00,0.00,'Imported opening stock from workbook dated 08.07.2025',1,'2026-06-07 11:05:42'),(150,149,'INWARD',9.00,0.00,9.00,'Imported opening stock from workbook dated 08.07.2025',1,'2026-06-07 11:05:42'),(151,150,'INWARD',3.00,0.00,3.00,'Imported opening stock from workbook dated 08.07.2025',1,'2026-06-07 11:05:42'),(152,151,'INWARD',30.00,0.00,30.00,'Imported opening stock from workbook dated 08.07.2025',1,'2026-06-07 11:05:42'),(153,152,'INWARD',11.00,0.00,11.00,'Imported opening stock from workbook dated 08.07.2025',1,'2026-06-07 11:05:42'),(154,153,'INWARD',10.00,0.00,10.00,'Imported opening stock from workbook dated 08.07.2025',1,'2026-06-07 11:05:42'),(155,154,'INWARD',11.00,0.00,11.00,'Imported opening stock from workbook dated 08.07.2025',1,'2026-06-07 11:05:42'),(156,155,'INWARD',25.00,0.00,25.00,'Imported opening stock from workbook dated 08.07.2025',1,'2026-06-07 11:05:42'),(157,156,'INWARD',6.00,0.00,6.00,'Imported opening stock from workbook dated 08.07.2025',1,'2026-06-07 11:05:42'),(158,157,'INWARD',5.00,0.00,5.00,'Imported opening stock from workbook dated 08.07.2025',1,'2026-06-07 11:05:42'),(159,158,'INWARD',1.00,0.00,1.00,'Imported opening stock from workbook dated 08.07.2025',1,'2026-06-07 11:05:42'),(160,159,'INWARD',2.00,0.00,2.00,'Imported opening stock from workbook dated 08.07.2025',1,'2026-06-07 11:05:42'),(161,160,'INWARD',8.00,0.00,8.00,'Imported opening stock from workbook dated 08.07.2025',1,'2026-06-07 11:05:42'),(162,161,'INWARD',25.00,0.00,25.00,'Imported opening stock from workbook dated 08.07.2025',1,'2026-06-07 11:05:42'),(163,162,'INWARD',0.00,0.00,0.00,'Imported opening stock from workbook dated 08.07.2025',1,'2026-06-07 11:05:42'),(164,163,'INWARD',20.00,0.00,20.00,'Imported opening stock from workbook dated 08.07.2025',1,'2026-06-07 11:05:42'),(165,164,'INWARD',38.00,0.00,38.00,'Imported opening stock from workbook dated 08.07.2025',1,'2026-06-07 11:05:42'),(166,165,'INWARD',31.00,0.00,31.00,'Imported opening stock from workbook dated 08.07.2025',1,'2026-06-07 11:05:42'),(167,166,'INWARD',16.00,0.00,16.00,'Imported opening stock from workbook dated 08.07.2025',1,'2026-06-07 11:05:42'),(168,167,'INWARD',14.00,0.00,14.00,'Imported opening stock from workbook dated 08.07.2025',1,'2026-06-07 11:05:42'),(169,168,'INWARD',3.00,0.00,3.00,'Imported opening stock from workbook dated 08.07.2025',1,'2026-06-07 11:05:42'),(170,169,'INWARD',3.00,0.00,3.00,'Imported opening stock from workbook dated 08.07.2025',1,'2026-06-07 11:05:42'),(171,170,'INWARD',5.00,0.00,5.00,'Imported opening stock from workbook dated 08.07.2025',1,'2026-06-07 11:05:42'),(172,171,'INWARD',7.00,0.00,7.00,'Imported opening stock from workbook dated 08.07.2025',1,'2026-06-07 11:05:42'),(173,172,'INWARD',55.00,0.00,55.00,'Imported opening stock from workbook dated 08.07.2025',1,'2026-06-07 11:05:42'),(174,173,'INWARD',20.00,0.00,20.00,'Imported opening stock from workbook dated 08.07.2025',1,'2026-06-07 11:05:42'),(175,174,'INWARD',5.00,0.00,5.00,'Imported opening stock from workbook dated 08.07.2025',1,'2026-06-07 11:05:42'),(176,175,'INWARD',3.00,0.00,3.00,'Imported opening stock from workbook dated 08.07.2025',1,'2026-06-07 11:05:42'),(177,176,'INWARD',0.00,0.00,0.00,'Imported opening stock from workbook dated 08.07.2025',1,'2026-06-07 11:05:42'),(178,177,'INWARD',22.00,0.00,22.00,'Imported opening stock from workbook dated 08.07.2025',1,'2026-06-07 11:05:42'),(179,178,'INWARD',48.00,0.00,48.00,'Imported opening stock from workbook dated 08.07.2025',1,'2026-06-07 11:05:42'),(180,179,'INWARD',30.00,0.00,30.00,'Imported opening stock from workbook dated 08.07.2025',1,'2026-06-07 11:05:42'),(181,180,'INWARD',32.00,0.00,32.00,'Imported opening stock from workbook dated 08.07.2025',1,'2026-06-07 11:05:42'),(182,181,'INWARD',55.00,0.00,55.00,'Imported opening stock from workbook dated 08.07.2025',1,'2026-06-07 11:05:42'),(183,182,'INWARD',0.00,0.00,0.00,'Imported opening stock from workbook dated 08.07.2025',1,'2026-06-07 11:05:42'),(184,183,'INWARD',56.00,0.00,56.00,'Imported opening stock from workbook dated 08.07.2025',1,'2026-06-07 11:05:42'),(185,184,'INWARD',16.00,0.00,16.00,'Imported opening stock from workbook dated 08.07.2025',1,'2026-06-07 11:05:42'),(186,185,'INWARD',82.00,0.00,82.00,'Imported opening stock from workbook dated 08.07.2025',1,'2026-06-07 11:05:42'),(187,186,'INWARD',3.00,0.00,3.00,'Imported opening stock from workbook dated 08.07.2025',1,'2026-06-07 11:05:42'),(188,187,'INWARD',1.00,0.00,1.00,'Imported opening stock from workbook dated 08.07.2025',1,'2026-06-07 11:05:42'),(189,188,'INWARD',0.00,0.00,0.00,'Imported opening stock from workbook dated 08.07.2025',1,'2026-06-07 11:05:42'),(190,189,'INWARD',20.00,0.00,20.00,'Imported opening stock from workbook dated 08.07.2025',1,'2026-06-07 11:05:42'),(191,190,'INWARD',1.00,0.00,1.00,'Imported opening stock from workbook dated 08.07.2025',1,'2026-06-07 11:05:42'),(192,191,'INWARD',3.00,0.00,3.00,'Imported opening stock from workbook dated 08.07.2025',1,'2026-06-07 11:05:42'),(193,192,'INWARD',5.00,0.00,5.00,'Imported opening stock from workbook dated 08.07.2025',1,'2026-06-07 11:05:42'),(194,193,'INWARD',400.00,0.00,400.00,'Imported opening stock from workbook dated 08.07.2025',1,'2026-06-07 11:05:42'),(202,197,'OUTWARD',0.00,3.00,42.00,'Issued to department via distribution of consolidated request #REQ-20260920-888559',2,'2026-09-20 06:02:42'),(203,163,'OUTWARD',0.00,2.00,18.00,'Issued to department via distribution of consolidated request #REQ-20260920-888559',2,'2026-09-20 06:02:42');
/*!40000 ALTER TABLE `stock_book` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stock_transactions`
--

DROP TABLE IF EXISTS `stock_transactions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stock_transactions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `transaction_no` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL,
  `item_id` int NOT NULL,
  `request_item_id` int DEFAULT NULL,
  `type` enum('INWARD','OUTWARD','RETURN','ADJUSTMENT') COLLATE utf8mb4_unicode_ci NOT NULL,
  `quantity` decimal(12,2) NOT NULL,
  `previous_quantity` decimal(12,2) NOT NULL,
  `new_quantity` decimal(12,2) NOT NULL,
  `remarks` text COLLATE utf8mb4_unicode_ci,
  `created_by` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `transaction_no` (`transaction_no`),
  KEY `idx_txn_item` (`item_id`),
  KEY `idx_txn_type_date` (`type`,`created_at`),
  KEY `created_by` (`created_by`),
  KEY `request_item_id` (`request_item_id`),
  CONSTRAINT `stock_transactions_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `items` (`id`),
  CONSTRAINT `stock_transactions_ibfk_2` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`),
  CONSTRAINT `stock_transactions_ibfk_3` FOREIGN KEY (`request_item_id`) REFERENCES `request_items` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stock_transactions`
--

LOCK TABLES `stock_transactions` WRITE;
/*!40000 ALTER TABLE `stock_transactions` DISABLE KEYS */;
INSERT INTO `stock_transactions` VALUES (8,'TRX-20260920113242-58A3',197,NULL,'OUTWARD',3.00,45.00,42.00,'Issued to department via distribution of consolidated request #REQ-20260920-888559',2,'2026-09-20 06:02:42'),(9,'TRX-20260920113242-5937',163,NULL,'OUTWARD',2.00,20.00,18.00,'Issued to department via distribution of consolidated request #REQ-20260920-888559',2,'2026-09-20 06:02:42');
/*!40000 ALTER TABLE `stock_transactions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `department_id` int DEFAULT NULL,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(160) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password_hash` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `role` enum('GSSSR','IETW','DEPARTMENT') COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('ACTIVE','INACTIVE') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'ACTIVE',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`),
  KEY `department_id` (`department_id`),
  CONSTRAINT `users_ibfk_1` FOREIGN KEY (`department_id`) REFERENCES `departments` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,NULL,'GSSSR Admin','gsssr@college.test','$2y$10$pzPy3XX7zXIj8sB4lx2BVefK9hHGmMPnMFqXlcuYWAA9OndlOeg4a','GSSSR','ACTIVE','2026-06-07 11:05:31',NULL),(2,NULL,'IETW Admin','ietw@college.test','$2y$10$pzPy3XX7zXIj8sB4lx2BVefK9hHGmMPnMFqXlcuYWAA9OndlOeg4a','IETW','ACTIVE','2026-06-07 11:05:31',NULL),(3,1,'CSE Department User','cse@college.test','$2y$10$pzPy3XX7zXIj8sB4lx2BVefK9hHGmMPnMFqXlcuYWAA9OndlOeg4a','DEPARTMENT','ACTIVE','2026-06-07 11:05:31',NULL),(4,2,'ECE Department User','ece@college.test','$2y$10$pzPy3XX7zXIj8sB4lx2BVefK9hHGmMPnMFqXlcuYWAA9OndlOeg4a','DEPARTMENT','ACTIVE','2026-06-07 11:05:31',NULL),(5,3,'EEE Department User','eee@college.test','$2y$10$pzPy3XX7zXIj8sB4lx2BVefK9hHGmMPnMFqXlcuYWAA9OndlOeg4a','DEPARTMENT','ACTIVE','2026-06-07 11:05:31',NULL),(6,4,'AIML Department User','aiml@college.test','$2y$10$pzPy3XX7zXIj8sB4lx2BVefK9hHGmMPnMFqXlcuYWAA9OndlOeg4a','DEPARTMENT','ACTIVE','2026-06-07 11:05:31',NULL),(7,5,'AIDS Department User','aids@college.test','$2y$10$pzPy3XX7zXIj8sB4lx2BVefK9hHGmMPnMFqXlcuYWAA9OndlOeg4a','DEPARTMENT','ACTIVE','2026-06-07 11:05:31',NULL),(8,6,'ISE Department User','ise@college.test','$2y$10$pzPy3XX7zXIj8sB4lx2BVefK9hHGmMPnMFqXlcuYWAA9OndlOeg4a','DEPARTMENT','ACTIVE','2026-06-07 11:05:31',NULL),(9,7,'CAC Department User','cac@college.test','$2y$10$pzPy3XX7zXIj8sB4lx2BVefK9hHGmMPnMFqXlcuYWAA9OndlOeg4a','DEPARTMENT','ACTIVE','2026-06-07 11:05:31',NULL);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-09-25 14:53:08
