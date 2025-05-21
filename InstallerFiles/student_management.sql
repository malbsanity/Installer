CREATE DATABASE  IF NOT EXISTS `student_management` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `student_management`;
-- MySQL dump 10.13  Distrib 8.0.41, for Win64 (x86_64)
--
-- Host: localhost    Database: student_management
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
-- Temporary view structure for view `class_details`
--

DROP TABLE IF EXISTS `class_details`;
/*!50001 DROP VIEW IF EXISTS `class_details`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `class_details` AS SELECT 
 1 AS `class_id`,
 1 AS `schedule`,
 1 AS `instructor_name`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `classes`
--

DROP TABLE IF EXISTS `classes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `classes` (
  `class_id` int NOT NULL AUTO_INCREMENT,
  `instructor_id` int DEFAULT NULL,
  `course_id` int DEFAULT NULL,
  `schedule` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`class_id`),
  KEY `instructor_id` (`instructor_id`),
  KEY `course_id` (`course_id`),
  CONSTRAINT `classes_ibfk_1` FOREIGN KEY (`instructor_id`) REFERENCES `instructors` (`instructor_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `classes_ibfk_2` FOREIGN KEY (`course_id`) REFERENCES `courses` (`course_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `classes`
--

LOCK TABLES `classes` WRITE;
/*!40000 ALTER TABLE `classes` DISABLE KEYS */;
INSERT INTO `classes` VALUES (1,1,1,'Monday 10AM-12PM'),(2,2,2,'Tuesday 2PM-4PM'),(3,3,3,'Wednesday 9AM-11AM'),(4,4,4,'Thursday 1PM-3PM'),(5,5,5,'Friday 10AM-12PM'),(6,6,6,'Saturday 2PM-4PM'),(7,7,7,'Monday 3PM-5PM'),(8,8,8,'Tuesday 11AM-1PM'),(9,9,9,'Wednesday 4PM-6PM'),(10,10,10,'Thursday 9AM-11AM');
/*!40000 ALTER TABLE `classes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `courses`
--

DROP TABLE IF EXISTS `courses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `courses` (
  `course_id` int NOT NULL AUTO_INCREMENT,
  `course_name` varchar(100) DEFAULT NULL,
  `description` text,
  PRIMARY KEY (`course_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `courses`
--

LOCK TABLES `courses` WRITE;
/*!40000 ALTER TABLE `courses` DISABLE KEYS */;
INSERT INTO `courses` VALUES (1,'Database Systems','Study of relational databases'),(2,'Networking','Fundamentals of computer networks'),(3,'Programming','Introduction to coding'),(4,'Cybersecurity','Study of security principles'),(5,'Web Development','Building websites and applications'),(6,'AI & Machine Learning','Introduction to AI concepts'),(7,'Software Engineering','Software development process'),(8,'Data Structures','Study of algorithms and structures'),(9,'Operating Systems','Fundamentals of OS'),(10,'Cloud Computing','Introduction to cloud technology');
/*!40000 ALTER TABLE `courses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `departments`
--

DROP TABLE IF EXISTS `departments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `departments` (
  `department_id` int NOT NULL AUTO_INCREMENT,
  `department_name` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`department_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `departments`
--

LOCK TABLES `departments` WRITE;
/*!40000 ALTER TABLE `departments` DISABLE KEYS */;
INSERT INTO `departments` VALUES (1,'Computer Science'),(2,'Information Technology'),(3,'Software Engineering'),(4,'Cybersecurity'),(5,'Data Science'),(6,'Artificial Intelligence'),(7,'Network Engineering'),(8,'Cloud Computing'),(9,'Game Development'),(10,'Business Analytics');
/*!40000 ALTER TABLE `departments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `enrollments`
--

DROP TABLE IF EXISTS `enrollments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `enrollments` (
  `enrollment_id` int NOT NULL AUTO_INCREMENT,
  `student_id` int DEFAULT NULL,
  `course_id` int DEFAULT NULL,
  PRIMARY KEY (`enrollment_id`),
  KEY `student_id` (`student_id`),
  KEY `course_id` (`course_id`),
  CONSTRAINT `enrollments_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `students` (`student_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `enrollments_ibfk_2` FOREIGN KEY (`course_id`) REFERENCES `courses` (`course_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `enrollments`
--

LOCK TABLES `enrollments` WRITE;
/*!40000 ALTER TABLE `enrollments` DISABLE KEYS */;
INSERT INTO `enrollments` VALUES (1,1,1),(6,6,6),(7,7,7),(8,8,8),(9,9,9),(10,10,10);
/*!40000 ALTER TABLE `enrollments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grades`
--

DROP TABLE IF EXISTS `grades`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `grades` (
  `id` int NOT NULL AUTO_INCREMENT,
  `student_id` int DEFAULT NULL,
  `subject` varchar(50) DEFAULT NULL,
  `grade` decimal(5,2) DEFAULT NULL,
  `grade_category` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `student_id` (`student_id`),
  CONSTRAINT `grades_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `students` (`student_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grades`
--

LOCK TABLES `grades` WRITE;
/*!40000 ALTER TABLE `grades` DISABLE KEYS */;
INSERT INTO `grades` VALUES (1,1,'Math',98.00,'Excellent'),(2,1,'Math',98.00,'Excellent'),(3,1,'Science',92.00,'Excellent'),(4,55,'English',75.00,'Passing'),(5,1,'English',95.00,'Excellent'),(6,55,'Science',98.00,'Excellent'),(7,55,'Math',95.00,'Excellent'),(8,55,'Math',95.00,'Excellent'),(9,1,'Math',98.00,'Excellent'),(10,1,'Math',99.00,'Excellent');
/*!40000 ALTER TABLE `grades` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `graduated_students`
--

DROP TABLE IF EXISTS `graduated_students`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `graduated_students` (
  `student_id` int NOT NULL DEFAULT '0',
  `name` varchar(100) DEFAULT NULL,
  `age` int DEFAULT NULL,
  `gender` enum('Male','Female') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `graduated_students`
--

LOCK TABLES `graduated_students` WRITE;
/*!40000 ALTER TABLE `graduated_students` DISABLE KEYS */;
/*!40000 ALTER TABLE `graduated_students` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `instructors`
--

DROP TABLE IF EXISTS `instructors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `instructors` (
  `instructor_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `department` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`instructor_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `instructors`
--

LOCK TABLES `instructors` WRITE;
/*!40000 ALTER TABLE `instructors` DISABLE KEYS */;
INSERT INTO `instructors` VALUES (1,'Dr. Alice Johnson','Computer Science'),(2,'Prof. Mark Wilson','Information Technology'),(3,'Dr. Sarah Lee','Software Engineering'),(4,'Prof. Kevin Brown','Cybersecurity'),(5,'Dr. Rachel Green','Data Science'),(6,'Prof. Tom Carter','Artificial Intelligence'),(7,'Dr. Susan White','Network Engineering'),(8,'Prof. James Black','Cloud Computing'),(9,'Dr. Michael Adams','Game Development'),(10,'Prof. Emily Davis','Business Analytics');
/*!40000 ALTER TABLE `instructors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `logs`
--

DROP TABLE IF EXISTS `logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `logs` (
  `id` int NOT NULL AUTO_INCREMENT,
  `action` varchar(50) DEFAULT NULL,
  `description` text,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `timestamp` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=63 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `logs`
--

LOCK TABLES `logs` WRITE;
/*!40000 ALTER TABLE `logs` DISABLE KEYS */;
INSERT INTO `logs` VALUES (1,'INSERT','New student added: ALEX TURNER','2025-03-22 20:00:09','2025-03-23 14:32:44'),(2,'INSERT','New student added: ALEX TURNER','2025-03-22 20:00:11','2025-03-23 14:32:44'),(3,'INSERT','New student added: ALEX TURNER','2025-03-22 20:00:11','2025-03-23 14:32:44'),(4,'INSERT','New student added: ALEX TURNER','2025-03-22 20:00:11','2025-03-23 14:32:44'),(5,'INSERT','New student added: ALEX TURNER','2025-03-22 20:00:11','2025-03-23 14:32:44'),(6,'INSERT','New student added: ALEX TURNER','2025-03-22 20:00:12','2025-03-23 14:32:44'),(7,'INSERT','New student added: ALEX TURNER','2025-03-22 20:00:18','2025-03-23 14:32:44'),(8,'DELETE','Student deleted: Chris Evans','2025-03-22 20:03:26','2025-03-23 14:32:44'),(9,'INSERT','New student added: ALEX TURNER','2025-03-22 20:05:31','2025-03-23 14:32:44'),(10,'INSERT','New student added: ','2025-03-22 20:16:08','2025-03-23 14:32:44'),(11,'INSERT','New student added: ','2025-03-22 20:16:21','2025-03-23 14:32:44'),(12,'INSERT','New student added: ','2025-03-22 20:22:42','2025-03-23 14:32:44'),(13,'INSERT','New student added: ','2025-03-22 20:22:43','2025-03-23 14:32:44'),(14,'INSERT','New student added: ','2025-03-22 20:22:45','2025-03-23 14:32:44'),(15,'INSERT','New student added: ','2025-03-22 20:22:46','2025-03-23 14:32:44'),(16,'INSERT','New student added: ','2025-03-22 20:22:51','2025-03-23 14:32:44'),(17,'INSERT','New student added: ','2025-03-22 20:22:57','2025-03-23 14:32:44'),(18,'INSERT','New student added: ','2025-03-22 20:22:59','2025-03-23 14:32:44'),(19,'INSERT','New student added: ','2025-03-22 20:23:05','2025-03-23 14:32:44'),(20,'INSERT','New student added: ','2025-03-22 20:23:06','2025-03-23 14:32:44'),(21,'INSERT','New student added: ','2025-03-22 20:23:07','2025-03-23 14:32:44'),(22,'INSERT','New student added: ','2025-03-22 20:23:07','2025-03-23 14:32:44'),(23,'INSERT','New student added: ','2025-03-22 20:23:08','2025-03-23 14:32:44'),(24,'INSERT','New student added: ','2025-03-22 20:23:09','2025-03-23 14:32:44'),(25,'INSERT','New student added: ','2025-03-22 20:23:09','2025-03-23 14:32:44'),(26,'INSERT','New student added: ','2025-03-22 20:26:19','2025-03-23 14:32:44'),(27,'INSERT','New student added: ','2025-03-22 20:26:20','2025-03-23 14:32:44'),(28,'INSERT','New student added: ','2025-03-22 20:26:22','2025-03-23 14:32:44'),(29,'INSERT','New student added: ','2025-03-22 20:26:45','2025-03-23 14:32:44'),(30,'INSERT','New student added: ','2025-03-22 20:26:46','2025-03-23 14:32:44'),(31,'INSERT','New student added: ','2025-03-22 20:26:47','2025-03-23 14:32:44'),(32,'INSERT','New student added: ','2025-03-22 20:26:47','2025-03-23 14:32:44'),(33,'INSERT','New student added: ','2025-03-22 20:26:48','2025-03-23 14:32:44'),(34,'INSERT','New student added: ','2025-03-22 20:26:48','2025-03-23 14:32:44'),(35,'INSERT','New student added: ','2025-03-22 20:26:48','2025-03-23 14:32:44'),(36,'INSERT','New student added: ','2025-03-22 20:26:48','2025-03-23 14:32:44'),(37,'INSERT','New student added: ','2025-03-22 20:26:49','2025-03-23 14:32:44'),(38,'INSERT','New student added: Alex Turner','2025-03-23 06:33:26','2025-03-23 14:33:26'),(39,'INSERT','New student added: Malbert','2025-03-23 06:33:42','2025-03-23 14:33:42'),(40,'UPDATE','Student updated from  to John Smith','2025-03-23 06:36:09','2025-03-23 14:36:09'),(41,'DELETE','Student removed: Jane Smith','2025-03-23 15:58:17','2025-03-23 23:58:17'),(42,'INSERT','New student added: Malbert Colarina','2025-03-23 16:16:12','2025-03-24 00:16:12'),(43,'UPDATE','Student updated from John Smith to Malbert Colarina','2025-03-23 16:17:30','2025-03-24 00:17:30'),(44,'INSERT','New student added: Zaro','2025-04-14 14:41:38','2025-04-14 22:41:38'),(45,'INSERT','New student added: andreev','2025-04-14 14:47:42','2025-04-14 22:47:42'),(46,'INSERT','New student added: Malbert','2025-05-09 02:55:40','2025-05-09 10:55:40'),(47,'INSERT','New student added: Malbert','2025-05-09 10:28:50','2025-05-09 18:28:50'),(48,'INSERT','New student added: Daryl','2025-05-10 09:19:59','2025-05-10 17:19:59'),(49,'INSERT','New student added: louie','2025-05-10 11:53:30','2025-05-10 19:53:30'),(50,'UPDATE','Student updated from Malbert Colarina to Malbert Colarina','2025-05-13 19:24:02','2025-05-14 03:24:02'),(51,'UPDATE','Student updated from Malbert Colarina to Malbert Colarina','2025-05-13 19:26:27','2025-05-14 03:26:27'),(52,'DELETE','Student removed: Michael Brown','2025-05-13 19:30:16','2025-05-14 03:30:16'),(53,'DELETE','Student removed: Emily Johnson','2025-05-13 19:30:24','2025-05-14 03:30:24'),(54,'DELETE','Student removed: ALEX TURNER','2025-05-13 19:30:34','2025-05-14 03:30:34'),(55,'DELETE','Student removed: ALEX TURNER','2025-05-13 19:30:38','2025-05-14 03:30:38'),(56,'DELETE','Student removed: Malbert','2025-05-13 19:31:00','2025-05-14 03:31:00'),(57,'DELETE','Student removed: ALEX TURNER','2025-05-14 03:10:55','2025-05-14 11:10:55'),(58,'UPDATE','Student updated from Sophia Martinez to Sophia Martinez','2025-05-14 11:45:12','2025-05-14 19:45:12'),(59,'DELETE','Student removed: ALEX TURNER','2025-05-14 11:45:23','2025-05-14 19:45:23'),(60,'INSERT','New student added: John','2025-05-15 08:44:07','2025-05-15 16:44:07'),(61,'UPDATE','Student updated from John to John','2025-05-15 08:44:38','2025-05-15 16:44:38'),(62,'DELETE','Student removed: John','2025-05-15 08:44:48','2025-05-15 16:44:48');
/*!40000 ALTER TABLE `logs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student_archive`
--

DROP TABLE IF EXISTS `student_archive`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `student_archive` (
  `student_id` int DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `age` int DEFAULT NULL,
  `gender` varchar(10) DEFAULT NULL,
  `archive_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student_archive`
--

LOCK TABLES `student_archive` WRITE;
/*!40000 ALTER TABLE `student_archive` DISABLE KEYS */;
/*!40000 ALTER TABLE `student_archive` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student_backup`
--

DROP TABLE IF EXISTS `student_backup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `student_backup` (
  `student_id` int DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `age` int DEFAULT NULL,
  `gender` varchar(10) DEFAULT NULL,
  `backup_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student_backup`
--

LOCK TABLES `student_backup` WRITE;
/*!40000 ALTER TABLE `student_backup` DISABLE KEYS */;
/*!40000 ALTER TABLE `student_backup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `students`
--

DROP TABLE IF EXISTS `students`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `students` (
  `student_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `age` int DEFAULT NULL,
  `gender` enum('Male','Female') DEFAULT NULL,
  PRIMARY KEY (`student_id`)
) ENGINE=InnoDB AUTO_INCREMENT=62 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `students`
--

LOCK TABLES `students` WRITE;
/*!40000 ALTER TABLE `students` DISABLE KEYS */;
INSERT INTO `students` VALUES (1,'Malbert Colarina',23,'Male'),(6,'Sophia Martinez',22,'Female'),(7,'Daniel Wilson',22,'Male'),(8,'Olivia White',21,'Female'),(9,'Ethan Taylor',19,'Male'),(10,'Emma Anderson',23,'Female'),(11,'ALEX TURNER',21,'Male'),(12,'ALEX TURNER',21,'Male'),(13,'ALEX TURNER',21,'Male'),(15,'ALEX TURNER',21,'Male'),(19,'',20,'Male'),(20,'',20,'Male'),(21,'',20,'Male'),(22,'',20,'Male'),(23,'',20,'Male'),(24,'',20,'Male'),(25,'',20,'Male'),(26,'',20,'Male'),(27,'',20,'Male'),(28,'',20,'Male'),(29,'',20,'Male'),(30,'',20,'Male'),(31,'',20,'Male'),(32,'',20,'Male'),(33,'',20,'Male'),(34,'',20,'Male'),(35,'',20,'Male'),(36,'',20,'Male'),(37,'',20,'Male'),(38,'',21,'Male'),(39,'',21,'Male'),(40,'',21,'Male'),(41,'',21,'Male'),(42,'',21,'Male'),(43,'',21,'Male'),(44,'',21,'Male'),(45,'',21,'Male'),(46,'',21,'Male'),(52,'Alex Turner',21,'Male'),(53,'Malbert',21,'Male'),(54,'Malbert Colarina',21,'Male'),(55,'Zaro',23,'Male'),(56,'andreev',20,'Male'),(57,'Malbert',25,'Male'),(59,'Daryl',21,'Female'),(60,'louie',20,'Male');
/*!40000 ALTER TABLE `students` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `before_student_insert` BEFORE INSERT ON `students` FOR EACH ROW BEGIN
    IF NEW.name = '' THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Student name cannot be empty';
    END IF;
END */;;
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
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `after_student_insert` AFTER INSERT ON `students` FOR EACH ROW BEGIN  
    INSERT INTO logs (action, description, timestamp)  
    VALUES ('INSERT', CONCAT('New student added: ', NEW.name), NOW());  
END */;;
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
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `before_student_update` BEFORE UPDATE ON `students` FOR EACH ROW BEGIN  
    IF NEW.name = '' THEN  
        SIGNAL SQLSTATE '45000'  
        SET MESSAGE_TEXT = 'Student name cannot be empty';  
    END IF;  
END */;;
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
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `after_student_update` AFTER UPDATE ON `students` FOR EACH ROW BEGIN  
    INSERT INTO logs (action, description, timestamp)  
    VALUES ('UPDATE', CONCAT('Student updated from ', OLD.name, ' to ', NEW.name), NOW());  
END */;;
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
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `before_student_delete` BEFORE DELETE ON `students` FOR EACH ROW BEGIN  
    DECLARE count_enrollments INT;
    SELECT COUNT(*) INTO count_enrollments FROM enrollments WHERE student_id = OLD.student_id;
    
    IF count_enrollments > 0 THEN  
        SIGNAL SQLSTATE '45000'  
        SET MESSAGE_TEXT = 'Cannot delete student with existing enrollments';  
    END IF;  
END */;;
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
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `after_student_delete` AFTER DELETE ON `students` FOR EACH ROW BEGIN  
    INSERT INTO logs (action, description, timestamp)  
    VALUES ('DELETE', CONCAT('Student removed: ', OLD.name), NOW());  
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'malbs123','','password12345'),(5,'malbs321','malbs123@gmail.com','pass12345'),(6,'','',''),(7,'malbs2004','malbs2004@gmail.com','pass12345'),(9,'malbs10','malbs10@gmail.com','pass10'),(11,'malbs12','malbs12@gmail.com','pass12'),(13,'kaloy123','kaloy@gmail.com','123');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `vw_course_enrollment_count`
--

DROP TABLE IF EXISTS `vw_course_enrollment_count`;
/*!50001 DROP VIEW IF EXISTS `vw_course_enrollment_count`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_course_enrollment_count` AS SELECT 
 1 AS `course_id`,
 1 AS `course_name`,
 1 AS `enrollment_count`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_course_instructors`
--

DROP TABLE IF EXISTS `vw_course_instructors`;
/*!50001 DROP VIEW IF EXISTS `vw_course_instructors`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_course_instructors` AS SELECT 
 1 AS `course_id`,
 1 AS `course_name`,
 1 AS `instructor_name`,
 1 AS `department`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_instructors`
--

DROP TABLE IF EXISTS `vw_instructors`;
/*!50001 DROP VIEW IF EXISTS `vw_instructors`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_instructors` AS SELECT 
 1 AS `instructor_id`,
 1 AS `name`,
 1 AS `department`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_students`
--

DROP TABLE IF EXISTS `vw_students`;
/*!50001 DROP VIEW IF EXISTS `vw_students`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_students` AS SELECT 
 1 AS `student_id`,
 1 AS `name`,
 1 AS `age`,
 1 AS `gender`*/;
SET character_set_client = @saved_cs_client;

--
-- Dumping events for database 'student_management'
--
/*!50106 SET @save_time_zone= @@TIME_ZONE */ ;
/*!50106 DROP EVENT IF EXISTS `move_graduated_students` */;
DELIMITER ;;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;;
/*!50003 SET character_set_client  = utf8mb4 */ ;;
/*!50003 SET character_set_results = utf8mb4 */ ;;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;;
/*!50003 SET @saved_time_zone      = @@time_zone */ ;;
/*!50003 SET time_zone             = 'SYSTEM' */ ;;
/*!50106 CREATE*/ /*!50117 DEFINER=`root`@`localhost`*/ /*!50106 EVENT `move_graduated_students` ON SCHEDULE EVERY 1 DAY STARTS '2025-04-14 15:54:17' ON COMPLETION NOT PRESERVE ENABLE DO BEGIN
    INSERT INTO graduated_students
    SELECT * FROM students WHERE grade_level = 12;

    DELETE FROM students WHERE grade_level = 12;
END */ ;;
/*!50003 SET time_zone             = @saved_time_zone */ ;;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;;
/*!50003 SET character_set_client  = @saved_cs_client */ ;;
/*!50003 SET character_set_results = @saved_cs_results */ ;;
/*!50003 SET collation_connection  = @saved_col_connection */ ;;
/*!50106 DROP EVENT IF EXISTS `reset_marks` */;;
DELIMITER ;;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;;
/*!50003 SET character_set_client  = utf8mb4 */ ;;
/*!50003 SET character_set_results = utf8mb4 */ ;;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;;
/*!50003 SET @saved_time_zone      = @@time_zone */ ;;
/*!50003 SET time_zone             = 'SYSTEM' */ ;;
/*!50106 CREATE*/ /*!50117 DEFINER=`root`@`localhost`*/ /*!50106 EVENT `reset_marks` ON SCHEDULE EVERY 6 MONTH STARTS '2025-06-01 00:00:00' ON COMPLETION NOT PRESERVE ENABLE DO BEGIN
    UPDATE students SET marks = 0;
END */ ;;
/*!50003 SET time_zone             = @saved_time_zone */ ;;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;;
/*!50003 SET character_set_client  = @saved_cs_client */ ;;
/*!50003 SET character_set_results = @saved_cs_results */ ;;
/*!50003 SET collation_connection  = @saved_col_connection */ ;;
DELIMITER ;
/*!50106 SET TIME_ZONE= @save_time_zone */ ;

--
-- Dumping routines for database 'student_management'
--
/*!50003 DROP FUNCTION IF EXISTS `get_avg_grade` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `get_avg_grade`(course_id_param INT) RETURNS double
    DETERMINISTIC
BEGIN
    DECLARE avg_grade DOUBLE;
    SELECT AVG(CASE 
        WHEN grade = 'A' THEN 4.0
        WHEN grade = 'B+' THEN 3.5
        WHEN grade = 'B' THEN 3.0
        WHEN grade = 'C+' THEN 2.5
        WHEN grade = 'C' THEN 2.0
        ELSE 0.0
    END) INTO avg_grade 
    FROM grades 
    JOIN enrollments ON grades.enrollment_id = enrollments.enrollment_id
    WHERE enrollments.course_id = course_id_param;
    RETURN avg_grade;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `get_department_students` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `get_department_students`(dept_name VARCHAR(100)) RETURNS int
    DETERMINISTIC
BEGIN
    DECLARE total INT;
    SELECT COUNT(e.student_id) INTO total 
    FROM enrollments e
    JOIN courses c ON e.course_id = c.course_id
    JOIN instructors i ON c.course_id = i.instructor_id
    WHERE i.department = dept_name;
    RETURN total;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `get_instructor_name` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `get_instructor_name`(class_id_param INT) RETURNS varchar(100) CHARSET utf8mb4
    DETERMINISTIC
BEGIN
    DECLARE instructor_name VARCHAR(100);
    SELECT i.name INTO instructor_name 
    FROM instructors i 
    JOIN classes c ON i.instructor_id = c.instructor_id
    WHERE c.class_id = class_id_param;
    RETURN instructor_name;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `get_student_grade` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `get_student_grade`(enrollment_id_param INT) RETURNS char(5) CHARSET utf8mb4
    DETERMINISTIC
BEGIN
    DECLARE student_grade CHAR(5);
    SELECT grade INTO student_grade FROM grades WHERE enrollment_id = enrollment_id_param;
    RETURN student_grade;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `get_total_students` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `get_total_students`(course_id_param INT) RETURNS int
    DETERMINISTIC
BEGIN
    DECLARE total INT;
    SELECT COUNT(*) INTO total FROM enrollments WHERE course_id = course_id_param;
    RETURN total;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_course_statistics` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_course_statistics`(IN dept_name VARCHAR(100), IN course_id_param INT)
BEGIN
    SELECT get_department_students(dept_name) AS total_students_in_department,
           get_avg_grade(course_id_param) AS average_grade_in_course;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_average_student_age` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_average_student_age`(OUT avg_age DECIMAL(5,2))
BEGIN
    SELECT AVG(age) INTO avg_age FROM students;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_list_courses_no_enrollments` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_list_courses_no_enrollments`()
BEGIN
    DECLARE done INT DEFAULT 0;
    DECLARE v_course_id INT;
    DECLARE v_course_name VARCHAR(100);
    
    DECLARE cur CURSOR FOR
        SELECT course_id, course_name FROM courses
        WHERE course_id NOT IN (SELECT DISTINCT course_id FROM enrollments);
        
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;
    
    OPEN cur;
    SELECT 'Listing courses with no enrollments:' AS Info;
    
    read_loop2: LOOP
        FETCH cur INTO v_course_id, v_course_name;
        IF done THEN
            LEAVE read_loop2;
        END IF;
        SELECT CONCAT('Course ID: ', v_course_id, ', Course Name: ', v_course_name) AS CourseInfo;
    END LOOP;
    
    CLOSE cur;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_list_students_by_gender` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_list_students_by_gender`(IN p_gender ENUM('Male','Female'))
BEGIN
    DECLARE done INT DEFAULT 0;
    DECLARE v_student_id INT;
    DECLARE v_name VARCHAR(100);
    
   
    DECLARE cur CURSOR FOR
        SELECT student_id, name FROM students WHERE gender = p_gender;
        
    
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;
    
    OPEN cur;
    
    SELECT CONCAT('Listing students with gender = ', p_gender) AS Info;
    
    read_loop: LOOP
        FETCH cur INTO v_student_id, v_name;
        IF done THEN
            LEAVE read_loop;
        END IF;
        
        SELECT CONCAT('ID: ', v_student_id, ', Name: ', v_name) AS StudentInfo;
    END LOOP;
    
    CLOSE cur;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_total_students` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_total_students`(OUT total INT)
BEGIN
    SELECT COUNT(*) INTO total FROM students;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `class_details`
--

/*!50001 DROP VIEW IF EXISTS `class_details`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `class_details` AS select `c`.`class_id` AS `class_id`,`c`.`schedule` AS `schedule`,`get_instructor_name`(`c`.`class_id`) AS `instructor_name` from `classes` `c` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_course_enrollment_count`
--

/*!50001 DROP VIEW IF EXISTS `vw_course_enrollment_count`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_course_enrollment_count` AS select `c`.`course_id` AS `course_id`,`c`.`course_name` AS `course_name`,count(`e`.`enrollment_id`) AS `enrollment_count` from (`courses` `c` left join `enrollments` `e` on((`c`.`course_id` = `e`.`course_id`))) group by `c`.`course_id`,`c`.`course_name` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_course_instructors`
--

/*!50001 DROP VIEW IF EXISTS `vw_course_instructors`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_course_instructors` AS select `c`.`course_id` AS `course_id`,`c`.`course_name` AS `course_name`,`i`.`name` AS `instructor_name`,`i`.`department` AS `department` from ((`courses` `c` join `classes` `cl` on((`c`.`course_id` = `cl`.`course_id`))) join `instructors` `i` on((`cl`.`instructor_id` = `i`.`instructor_id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_instructors`
--

/*!50001 DROP VIEW IF EXISTS `vw_instructors`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_instructors` AS select `instructors`.`instructor_id` AS `instructor_id`,`instructors`.`name` AS `name`,`instructors`.`department` AS `department` from `instructors` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_students`
--

/*!50001 DROP VIEW IF EXISTS `vw_students`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_students` AS select `students`.`student_id` AS `student_id`,`students`.`name` AS `name`,`students`.`age` AS `age`,`students`.`gender` AS `gender` from `students` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-05-21 15:04:00
