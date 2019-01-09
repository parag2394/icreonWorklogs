-- MySQL dump 10.13  Distrib 8.0.13, for Win64 (x86_64)
--
-- Host: localhost    Database: icreonworklogs
-- ------------------------------------------------------
-- Server version	8.0.13

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `tbl_issues`
--

DROP TABLE IF EXISTS `tbl_issues`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tbl_issues` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `issue_id` int(11) DEFAULT NULL,
  `issue_name` varchar(100) DEFAULT NULL,
  `createdon` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_issues`
--

LOCK TABLES `tbl_issues` WRITE;
/*!40000 ALTER TABLE `tbl_issues` DISABLE KEYS */;
INSERT INTO `tbl_issues` VALUES (1,111,'test','2018-12-13 21:10:02');
/*!40000 ALTER TABLE `tbl_issues` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_menumst`
--

DROP TABLE IF EXISTS `tbl_menumst`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tbl_menumst` (
  `menuid` int(11) NOT NULL AUTO_INCREMENT,
  `text` varchar(100) DEFAULT NULL,
  `description` varchar(200) DEFAULT NULL,
  `parentid` int(11) DEFAULT NULL,
  `navurl` varchar(250) DEFAULT NULL,
  `showtoall` char(1) DEFAULT NULL,
  `showinmenu` char(1) DEFAULT NULL,
  `orderby` int(11) DEFAULT NULL,
  `enable` char(1) DEFAULT NULL,
  `createdby` varchar(50) DEFAULT NULL,
  `createdon` datetime DEFAULT NULL,
  PRIMARY KEY (`menuid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_menumst`
--

LOCK TABLES `tbl_menumst` WRITE;
/*!40000 ALTER TABLE `tbl_menumst` DISABLE KEYS */;
INSERT INTO `tbl_menumst` VALUES (1,'Worklogs','Worklogs',0,'/icreonWorklogs/worklogs.jsp','1','1',1,NULL,NULL,NULL);
/*!40000 ALTER TABLE `tbl_menumst` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_menurightmapping`
--

DROP TABLE IF EXISTS `tbl_menurightmapping`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tbl_menurightmapping` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `menuid` int(11) DEFAULT NULL,
  `rightsid` int(11) DEFAULT NULL,
  `remark` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_menurightmapping`
--

LOCK TABLES `tbl_menurightmapping` WRITE;
/*!40000 ALTER TABLE `tbl_menurightmapping` DISABLE KEYS */;
INSERT INTO `tbl_menurightmapping` VALUES (1,1,1,'ADMIN');
/*!40000 ALTER TABLE `tbl_menurightmapping` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_rights`
--

DROP TABLE IF EXISTS `tbl_rights`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tbl_rights` (
  `right_id` int(11) NOT NULL,
  `right_name` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_rights`
--

LOCK TABLES `tbl_rights` WRITE;
/*!40000 ALTER TABLE `tbl_rights` DISABLE KEYS */;
INSERT INTO `tbl_rights` VALUES (1,'ADMIN RIGHTS');
/*!40000 ALTER TABLE `tbl_rights` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_user_role`
--

DROP TABLE IF EXISTS `tbl_user_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tbl_user_role` (
  `user_role_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_role_name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`user_role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_user_role`
--

LOCK TABLES `tbl_user_role` WRITE;
/*!40000 ALTER TABLE `tbl_user_role` DISABLE KEYS */;
INSERT INTO `tbl_user_role` VALUES (1,'ADMIN');
/*!40000 ALTER TABLE `tbl_user_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_userdtl`
--

DROP TABLE IF EXISTS `tbl_userdtl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tbl_userdtl` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `userid` int(10) DEFAULT NULL,
  `username` varchar(40) DEFAULT NULL,
  `password` varchar(350) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `mobileno` varchar(12) DEFAULT NULL,
  `emailid` varchar(40) DEFAULT NULL,
  `loginattempts` int(11) DEFAULT NULL,
  `lastlogindate` datetime DEFAULT NULL,
  `oldpassword` varchar(350) DEFAULT NULL,
  `lastlpasswordchangedate` datetime DEFAULT NULL,
  `createdate` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_userdtl`
--

LOCK TABLES `tbl_userdtl` WRITE;
/*!40000 ALTER TABLE `tbl_userdtl` DISABLE KEYS */;
INSERT INTO `tbl_userdtl` VALUES (1,101,'icreon','54eb10cf559b612d2a4a8df07acf4cc3978889b54d4ca40126edc9c7f118a4b6','icreon',NULL,NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `tbl_userdtl` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_userrights`
--

DROP TABLE IF EXISTS `tbl_userrights`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tbl_userrights` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `rightsid` int(11) DEFAULT NULL,
  `userid` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_userrights`
--

LOCK TABLES `tbl_userrights` WRITE;
/*!40000 ALTER TABLE `tbl_userrights` DISABLE KEYS */;
INSERT INTO `tbl_userrights` VALUES (1,1,101);
/*!40000 ALTER TABLE `tbl_userrights` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_worklogs`
--

DROP TABLE IF EXISTS `tbl_worklogs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tbl_worklogs` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `project_id` varchar(50) DEFAULT NULL,
  `issue_id` varchar(50) DEFAULT NULL,
  `worklog_id` varchar(50) DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `updated_date` date DEFAULT NULL,
  `description` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `author` varchar(50) DEFAULT NULL,
  `time_spent` int(10) DEFAULT NULL,
  `status` int(2) DEFAULT NULL,
  `date_created` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1155 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_worklogs`
--

LOCK TABLES `tbl_worklogs` WRITE;
/*!40000 ALTER TABLE `tbl_worklogs` DISABLE KEYS */;
INSERT INTO `tbl_worklogs` VALUES (583,'POLITICO','POL-1','245946','2018-10-01','2018-10-09','Politico Project work','Ravi Kumar',8,0,'2019-01-04 11:32:45'),(584,'POLITICO','POL-1','245949','2018-10-01','2018-10-09','Working on DIR-47 PR.','Rohit Phutane',8,1,'2019-01-04 11:32:45'),(585,'POLITICO','POL-1','245947','2018-10-03','2018-10-09','Politico Project work','Ravi Kumar',8,1,'2019-01-04 11:32:46'),(586,'POLITICO','POL-1','245950','2018-10-03','2018-10-09','Working on DIR-47 PR.','Rohit Phutane',8,2,'2019-01-04 11:32:46'),(587,'POLITICO','POL-1','245951','2018-10-04','2018-10-09','Politico Project work','Ravi Kumar',8,2,'2019-01-04 11:32:46'),(588,'POLITICO','POL-1','245953','2018-10-04','2018-10-09','Working on DIR-44.','Rohit Phutane',8,2,'2019-01-04 11:32:46'),(589,'POLITICO','POL-1','245952','2018-10-05','2018-10-09','Politico Project work','Ravi Kumar',8,2,'2019-01-04 11:32:46'),(590,'POLITICO','POL-1','245954','2018-10-05','2018-10-09','Working on DIR-44.','Rohit Phutane',8,2,'2019-01-04 11:32:46'),(591,'POLITICO','POL-1','245955','2018-10-08','2018-10-09','Working on DIR-44.','Rohit Phutane',8,2,'2019-01-04 11:32:46'),(592,'POLITICO','POL-1','245957','2018-10-08','2018-10-09','Politico Project work','Ravi Kumar',8,2,'2019-01-04 11:32:46'),(593,'POLITICO','POL-1','245956','2018-10-09','2018-10-09','Working on DIR-44.','Rohit Phutane',8,2,'2019-01-04 11:32:46'),(594,'POLITICO','POL-1','245959','2018-10-09','2018-10-09','Politico Project work','Ravi Kumar',8,2,'2019-01-04 11:32:46'),(595,'POLITICO','POL-1','245960','2018-10-10','2018-10-09','Politico Project work','Ravi Kumar',8,2,'2019-01-04 11:32:46'),(596,'POLITICO','POL-1','255252','2018-10-10','2018-11-01','Working on issue POL-1','Rohit Phutane',8,2,'2019-01-04 11:32:46'),(597,'POLITICO','POL-1','245961','2018-10-11','2018-10-09','Politico Project work','Ravi Kumar',8,2,'2019-01-04 11:32:46'),(598,'POLITICO','POL-1','255253','2018-10-11','2018-11-01','Working on issue POL-1','Rohit Phutane',8,2,'2019-01-04 11:32:46'),(599,'POLITICO','POL-1','245962','2018-10-12','2018-10-09','Politico Project work','Ravi Kumar',8,2,'2019-01-04 11:32:46'),(600,'POLITICO','POL-1','255254','2018-10-12','2018-11-01','Working on issue POL-1','Rohit Phutane',8,2,'2019-01-04 11:32:46'),(601,'POLITICO','POL-1','245963','2018-10-15','2018-10-09','Politico Project work','Ravi Kumar',8,2,'2019-01-04 11:32:46'),(602,'POLITICO','POL-1','255255','2018-10-15','2018-11-01','Working on issue POL-1','Rohit Phutane',8,2,'2019-01-04 11:32:46'),(603,'POLITICO','POL-1','245964','2018-10-16','2018-10-09','Politico Project work','Ravi Kumar',8,2,'2019-01-04 11:32:46'),(604,'POLITICO','POL-1','255256','2018-10-16','2018-11-01','Working on issue POL-1','Rohit Phutane',8,2,'2019-01-04 11:32:47'),(605,'POLITICO','POL-1','255257','2018-10-17','2018-11-01','Working on issue POL-1','Rohit Phutane',8,2,'2019-01-04 11:32:47'),(606,'POLITICO','POL-1','255258','2018-10-18','2018-11-01','Working on issue POL-1','Rohit Phutane',8,2,'2019-01-04 11:32:47'),(607,'POLITICO','POL-1','249713','2018-10-22','2018-10-21','Politico Project','Ravi Kumar',8,2,'2019-01-04 11:32:47'),(608,'POLITICO','POL-1','255259','2018-10-22','2018-11-01','Working on issue POL-1','Rohit Phutane',8,2,'2019-01-04 11:32:47'),(609,'POLITICO','POL-1','249714','2018-10-23','2018-10-21','Politico Project','Ravi Kumar',8,2,'2019-01-04 11:32:47'),(610,'POLITICO','POL-1','255260','2018-10-23','2018-11-01','Working on issue POL-1','Rohit Phutane',8,2,'2019-01-04 11:32:47'),(611,'POLITICO','POL-1','249715','2018-10-24','2018-10-21','Politico Project','Ravi Kumar',8,2,'2019-01-04 11:32:47'),(612,'POLITICO','POL-1','255261','2018-10-24','2018-11-01','Working on issue POL-1','Rohit Phutane',8,2,'2019-01-04 11:32:47'),(613,'POLITICO','POL-1','249716','2018-10-25','2018-10-21','Politico Project','Ravi Kumar',8,2,'2019-01-04 11:32:47'),(614,'POLITICO','POL-1','255262','2018-10-25','2018-11-01','Working on issue POL-1','Rohit Phutane',8,2,'2019-01-04 11:32:47'),(615,'POLITICO','POL-1','249717','2018-10-26','2018-10-21','Politico Project','Ravi Kumar',8,2,'2019-01-04 11:32:47'),(616,'POLITICO','POL-1','255263','2018-10-26','2018-11-01','Working on issue POL-1','Rohit Phutane',8,2,'2019-01-04 11:32:47'),(617,'POLITICO','POL-1','249718','2018-10-29','2018-10-21','Politico Project','Ravi Kumar',8,2,'2019-01-04 11:32:47'),(618,'POLITICO','POL-1','255264','2018-10-29','2018-11-01','Working on issue POL-1','Rohit Phutane',8,2,'2019-01-04 11:32:47'),(619,'POLITICO','POL-1','249719','2018-10-30','2018-10-21','Politico Project','Ravi Kumar',8,2,'2019-01-04 11:32:47'),(620,'POLITICO','POL-1','255265','2018-10-30','2018-11-01','Working on issue POL-1','Rohit Phutane',8,2,'2019-01-04 11:32:47'),(621,'POLITICO','POL-1','249720','2018-10-31','2018-10-21','Politico Project','Ravi Kumar',8,2,'2019-01-04 11:32:47'),(622,'POLITICO','POL-1','255266','2018-10-31','2018-11-01','Working on issue POL-1','Rohit Phutane',8,2,'2019-01-04 11:32:47'),(623,'POLITICO','POL-2','245965','2018-10-17','2018-10-09','On Leave','Ravi Kumar',8,2,'2019-01-04 11:32:48'),(624,'POLITICO','POL-2','245966','2018-10-18','2018-10-09','On Leave','Ravi Kumar',8,2,'2019-01-04 11:32:48'),(625,'POLITICO','POL-3','243842','2018-09-03','2018-10-04','Working on POLITICO project','Rohit Phutane',8,2,'2019-01-04 11:32:48'),(626,'POLITICO','POL-3','243843','2018-09-04','2018-10-04','Working on POLITICO project','Rohit Phutane',8,2,'2019-01-04 11:32:48'),(627,'POLITICO','POL-3','243844','2018-09-05','2018-10-04','Working on POLITICO project','Rohit Phutane',8,2,'2019-01-04 11:32:48'),(628,'POLITICO','POL-3','243845','2018-09-06','2018-10-04','Working on POLITICO project','Rohit Phutane',8,2,'2019-01-04 11:32:49'),(629,'POLITICO','POL-3','243846','2018-09-07','2018-10-04','Working on POLITICO project','Rohit Phutane',8,2,'2019-01-04 11:32:49'),(630,'POLITICO','POL-3','243847','2018-09-10','2018-10-04','Working on POLITICO project','Rohit Phutane',8,2,'2019-01-04 11:32:49'),(631,'POLITICO','POL-3','243848','2018-09-11','2018-10-04','Working on POLITICO project','Rohit Phutane',8,2,'2019-01-04 11:32:49'),(632,'POLITICO','POL-3','243849','2018-09-12','2018-10-04','Working on POLITICO project','Rohit Phutane',8,2,'2019-01-04 11:32:49'),(633,'POLITICO','POL-3','243850','2018-09-13','2018-10-04','Working on POLITICO project','Rohit Phutane',8,2,'2019-01-04 11:32:49'),(634,'POLITICO','POL-3','243851','2018-09-14','2018-10-04','Working on POLITICO project','Rohit Phutane',8,2,'2019-01-04 11:32:49'),(635,'POLITICO','POL-3','242810','2018-09-18','2018-10-01','Joined Icreon','Ravi Kumar',8,2,'2019-01-04 11:32:49'),(636,'POLITICO','POL-3','243853','2018-09-18','2018-10-04','Working on POLITICO project','Rohit Phutane',8,2,'2019-01-04 11:32:49'),(637,'POLITICO','POL-3','242811','2018-09-19','2018-10-01','Induction Program','Ravi Kumar',8,2,'2019-01-04 11:32:49'),(638,'POLITICO','POL-3','243854','2018-09-19','2018-10-04','Working on POLITICO project','Rohit Phutane',8,2,'2019-01-04 11:32:49'),(639,'POLITICO','POL-3','242816','2018-09-20','2018-10-01','Started working development setup','Ravi Kumar',8,2,'2019-01-04 11:32:49'),(640,'POLITICO','POL-3','243855','2018-09-20','2018-10-04','Working on POLITICO project','Rohit Phutane',8,2,'2019-01-04 11:32:49'),(641,'POLITICO','POL-3','242818','2018-09-21','2018-10-01','Development setup','Ravi Kumar',8,2,'2019-01-04 11:32:49'),(642,'POLITICO','POL-3','243856','2018-09-21','2018-10-04','Working on POLITICO project','Rohit Phutane',8,2,'2019-01-04 11:32:50'),(643,'POLITICO','POL-3','243857','2018-09-24','2018-10-04','Working on POLITICO project','Rohit Phutane',8,2,'2019-01-04 11:32:50'),(644,'POLITICO','POL-3','242821','2018-09-25','2018-10-01','Working on POLITICO project','Ravi Kumar',8,2,'2019-01-04 11:32:50'),(645,'POLITICO','POL-3','243858','2018-09-25','2018-10-04','Working on POLITICO project','Rohit Phutane',8,2,'2019-01-04 11:32:50'),(646,'POLITICO','POL-3','242823','2018-09-26','2018-10-01','Working on POLITICO project','Ravi Kumar',8,2,'2019-01-04 11:32:50'),(647,'POLITICO','POL-3','243859','2018-09-26','2018-10-04','Working on POLITICO project','Rohit Phutane',8,2,'2019-01-04 11:32:50'),(648,'POLITICO','POL-3','242824','2018-09-27','2018-10-01','Working on issue POL-3','Ravi Kumar',8,2,'2019-01-04 11:32:50'),(649,'POLITICO','POL-3','243860','2018-09-27','2018-10-04','Working on POLITICO project','Rohit Phutane',8,2,'2019-01-04 11:32:50'),(650,'POLITICO','POL-3','242825','2018-09-28','2018-10-01','Working on issue POL-3','Ravi Kumar',8,2,'2019-01-04 11:32:50'),(651,'POLITICO','POL-3','243861','2018-09-28','2018-10-04','Working on POLITICO project','Rohit Phutane',8,2,'2019-01-04 11:32:50'),(652,'POLITICO','POL-4','242819','2018-09-24','2018-10-01','Working on POLITICO project','Ravi Kumar',8,2,'2019-01-04 11:32:50'),(653,'POLITICO','POL-5','255288','2018-11-01','2018-11-01','WORKING ON JIRA TICKETS.','Rohit Phutane',8,1,'2019-01-04 11:32:51'),(654,'POLITICO','POL-5','256015','2018-11-01','2018-11-05','Politico project','Ravi Kumar',8,2,'2019-01-04 11:32:51'),(655,'POLITICO','POL-5','256016','2018-11-02','2018-11-05','Politico project','Ravi Kumar',8,2,'2019-01-04 11:32:51'),(656,'POLITICO','POL-5','261037','2018-11-02','2018-11-20','Working on POLITICO.','Rohit Phutane',8,2,'2019-01-04 11:32:51'),(657,'POLITICO','POL-5','256017','2018-11-05','2018-11-05','Politico project','Ravi Kumar',8,2,'2019-01-04 11:32:51'),(658,'POLITICO','POL-5','261038','2018-11-05','2018-12-04','Working on POLITICO.','Rohit Phutane',8,2,'2019-01-04 11:32:51'),(659,'POLITICO','POL-5','256018','2018-11-06','2018-11-05','Politico project','Ravi Kumar',8,2,'2019-01-04 11:32:51'),(660,'POLITICO','POL-5','261039','2018-11-06','2018-12-04','Working on POLITICO.','Rohit Phutane',8,2,'2019-01-04 11:32:51'),(661,'POLITICO','POL-5','259050','2018-11-08','2018-11-14','Politico Project','Ravi Kumar',8,2,'2019-01-04 11:32:51'),(662,'POLITICO','POL-5','261040','2018-11-08','2018-12-04','Working on POLITICO.','Rohit Phutane',8,2,'2019-01-04 11:32:51'),(663,'POLITICO','POL-5','259051','2018-11-09','2018-11-14','Politico Project','Ravi Kumar',8,2,'2019-01-04 11:32:51'),(664,'POLITICO','POL-5','261041','2018-11-09','2018-12-04','Working on POLITICO.','Rohit Phutane',8,2,'2019-01-04 11:32:51'),(665,'POLITICO','POL-5','257494','2018-11-12','2018-11-12','November - 12th - 2018\n\nâ¢ TASKS\nâ MISC\nâ TEAM\nâ£ [JIRA] (TECH-2129) PHP 7.2 issues for repository sc-crons (3-pointer)\nâ£ [JIRA] (SCM-10573) Dashboard is showing incorrect count for 2018 DOB Inspection Summary dashboard widget (Rocklyn Asset Corp)\nâ£ [JIRA] (SCM-11268) DOB Boiler Dashboard Widget Including \"Passed\" and other incorrect records for \"Failed/Rejected\" 2018 Inspection Records (NYCHA)\nâ£ [JIRA] (SCM-11277) Permit Images and Statuses not pulling into SiteCompli â Gilbane Building Company\nâ£ [JIRA] (TECH-2203) PHP 7.2 issues for repository sc-crons (5-pointer)\nâ£ [JIRA] (TECH-2130) PHP 7.2 issues for repository sc-ical\nâ£ [JIRA] (TECH-2129) PHP 7.2 issues for repository sc-crons (3-pointer)\nâ£ [JIRA] (SCM-11457) Criminal Summons missing from client account\nâ£ ','Ashwani Dher',9,2,'2019-01-04 11:32:51'),(666,'POLITICO','POL-5','257496','2018-11-12','2018-11-12','November - 12th - 2018\n\nâ¢ TASKS\nâ MISC\nâ TEAM\nâ£ [JIRA] (TECH-2129) PHP 7.2 issues for repository sc-crons (3-pointer)\nâ£ [JIRA] (SCM-10573) Dashboard is showing incorrect count for 2018 DOB Inspection Summary dashboard widget (Rocklyn Asset Corp)\nâ£ [JIRA] (SCM-11268) DOB Boiler Dashboard Widget Including \"Passed\" and other incorrect records for \"Failed/Rejected\" 2018 Inspection Records (NYCHA)\nâ£ [JIRA] (SCM-11277) Permit Images and Statuses not pulling into SiteCompli â Gilbane Building Company\nâ£ [JIRA] (TECH-2203) PHP 7.2 issues for repository sc-crons (5-pointer)\nâ£ [JIRA] (TECH-2130) PHP 7.2 issues for repository sc-ical\nâ£ [JIRA] (TECH-2129) PHP 7.2 issues for repository sc-crons (3-pointer)\nâ£ [JIRA] (SCM-11457) Criminal Summons missing from client account\nâ£ ','Ashwani Dher',9,2,'2019-01-04 11:32:51'),(667,'POLITICO','POL-5','259052','2018-11-12','2018-11-14','Politico Project','Ravi Kumar',8,2,'2019-01-04 11:32:51'),(668,'POLITICO','POL-5','261042','2018-11-12','2018-12-04','Working on POLITICO.','Rohit Phutane',8,2,'2019-01-04 11:32:51'),(669,'POLITICO','POL-5','259053','2018-11-13','2018-11-14','Politico Project','Ravi Kumar',8,2,'2019-01-04 11:32:51'),(670,'POLITICO','POL-5','261043','2018-11-13','2018-12-04','Working on POLITICO.','Rohit Phutane',8,2,'2019-01-04 11:32:52'),(671,'POLITICO','POL-5','259054','2018-11-14','2018-11-14','Politico Project','Ravi Kumar',8,2,'2019-01-04 11:32:52'),(672,'POLITICO','POL-5','261044','2018-11-14','2018-12-04','Working on POLITICO.','Rohit Phutane',8,2,'2019-01-04 11:32:52'),(673,'POLITICO','POL-5','259055','2018-11-15','2018-11-14','Politico Project','Ravi Kumar',8,2,'2019-01-04 11:32:52'),(674,'POLITICO','POL-5','261045','2018-11-15','2018-12-04','Working on POLITICO.','Rohit Phutane',8,2,'2019-01-04 11:32:52'),(675,'POLITICO','POL-5','259056','2018-11-16','2018-11-14','Politico Project','Ravi Kumar',8,2,'2019-01-04 11:32:52'),(676,'POLITICO','POL-5','261046','2018-11-16','2018-12-04','Working on POLITICO.','Rohit Phutane',8,2,'2019-01-04 11:32:52'),(677,'POLITICO','POL-5','259057','2018-11-19','2018-11-14','Politico Project','Ravi Kumar',8,2,'2019-01-04 11:32:52'),(678,'POLITICO','POL-5','261047','2018-11-19','2018-12-04','Working on POLITICO.','Rohit Phutane',8,2,'2019-01-04 11:32:52'),(679,'POLITICO','POL-5','259058','2018-11-20','2018-11-14','Politico Project','Ravi Kumar',8,2,'2019-01-04 11:32:52'),(680,'POLITICO','POL-5','261048','2018-11-20','2018-12-04','Working on POLITICO.','Rohit Phutane',8,2,'2019-01-04 11:32:52'),(681,'POLITICO','POL-5','259059','2018-11-21','2018-11-14','Politico Project','Ravi Kumar',8,2,'2019-01-04 11:32:52'),(682,'POLITICO','POL-5','261049','2018-11-21','2018-12-04','Working on POLITICO.','Rohit Phutane',8,2,'2019-01-04 11:32:52'),(683,'POLITICO','POL-5','259060','2018-11-22','2018-11-14','Politico Project','Ravi Kumar',8,2,'2019-01-04 11:32:52'),(684,'POLITICO','POL-5','261050','2018-11-22','2018-12-04','Working on POLITICO.','Rohit Phutane',8,2,'2019-01-04 11:32:52'),(685,'POLITICO','POL-5','259061','2018-11-26','2018-11-14','Politico Project','Ravi Kumar',8,2,'2019-01-04 11:32:52'),(686,'POLITICO','POL-5','261051','2018-11-26','2018-12-04','Working on POLITICO.','Rohit Phutane',8,2,'2019-01-04 11:32:52'),(687,'POLITICO','POL-5','259062','2018-11-27','2018-11-14','Politico Project','Ravi Kumar',8,2,'2019-01-04 11:32:52'),(688,'POLITICO','POL-5','261052','2018-11-27','2018-12-04','Working on POLITICO.','Rohit Phutane',8,2,'2019-01-04 11:32:52'),(689,'POLITICO','POL-5','259063','2018-11-28','2018-11-14','Politico Project','Ravi Kumar',8,2,'2019-01-04 11:32:52'),(690,'POLITICO','POL-5','261053','2018-11-28','2018-12-04','Working on POLITICO.','Rohit Phutane',8,2,'2019-01-04 11:32:52'),(691,'POLITICO','POL-5','259064','2018-11-29','2018-11-14','Politico Project','Ravi Kumar',8,2,'2019-01-04 11:32:52'),(692,'POLITICO','POL-5','261054','2018-11-29','2018-12-04','Working on POLITICO.','Rohit Phutane',8,2,'2019-01-04 11:32:52'),(693,'POLITICO','POL-5','259065','2018-11-30','2018-11-14','Politico Project','Ravi Kumar',8,2,'2019-01-04 11:32:52'),(694,'POLITICO','POL-5','261055','2018-11-30','2018-12-04','Working on POLITICO.','Rohit Phutane',8,2,'2019-01-04 11:32:52'),(695,'POLITICO','POL-5','265521','2018-11-30','2018-12-03','November - 30th - 2018\n\nâ¢ TASKS\nâ MISC\nâ TEAM\nâ£ TECH-2262: Change password for FDDM_External_Scripts app and deploy changes\nâ£ [JIRA] (SCM-11303) Upload October DO File for FDNY Permit Accounts\n','Ashwani Dher',9,2,'2019-01-04 11:32:52'),(696,'POLITICO','POL-6','265523','2018-11-26','2018-12-03','Working on issue POL-6','Ashwani Dher',8,2,'2019-01-04 11:32:53'),(697,'POLITICO','POL-8','265893','2018-12-03','2018-12-04','Politico Project.','Ravi Kumar',8,0,'2019-01-04 11:32:54'),(698,'POLITICO','POL-8','265906','2018-12-03','2018-12-04','Working on Politico','Rohit Phutane',8,0,'2019-01-04 11:32:54'),(699,'POLITICO','POL-8','265894','2018-12-04','2018-12-04','Politico Project.','Ravi Kumar',8,0,'2019-01-04 11:32:54'),(700,'POLITICO','POL-8','265907','2018-12-04','2018-12-04','Working on Politico','Rohit Phutane',8,2,'2019-01-04 11:32:54'),(701,'POLITICO','POL-8','265895','2018-12-05','2018-12-04','Politico Project.','Ravi Kumar',8,2,'2019-01-04 11:32:54'),(702,'POLITICO','POL-8','265908','2018-12-05','2018-12-04','Working on Politico','Rohit Phutane',8,2,'2019-01-04 11:32:54'),(703,'POLITICO','POL-8','265896','2018-12-06','2018-12-04','Politico Project.','Ravi Kumar',8,2,'2019-01-04 11:32:54'),(704,'POLITICO','POL-8','265909','2018-12-06','2018-12-04','Working on Politico','Rohit Phutane',8,2,'2019-01-04 11:32:54'),(705,'POLITICO','POL-8','265897','2018-12-07','2018-12-04','Politico Project.','Ravi Kumar',8,2,'2019-01-04 11:32:54'),(706,'POLITICO','POL-8','265910','2018-12-07','2018-12-04','Working on Politico','Rohit Phutane',8,2,'2019-01-04 11:32:54'),(707,'POLITICO','POL-8','272541','2018-12-08','2018-12-24','Compensating 19th december.','Rohit Phutane',8,2,'2019-01-04 11:32:54'),(708,'POLITICO','POL-8','272543','2018-12-09','2018-12-24','Compensating 20th december.','Rohit Phutane',8,2,'2019-01-04 11:32:54'),(709,'POLITICO','POL-8','265898','2018-12-10','2018-12-04','Politico Project.','Ravi Kumar',8,2,'2019-01-04 11:32:54'),(710,'POLITICO','POL-8','265911','2018-12-10','2018-12-04','Working on Politico','Rohit Phutane',8,2,'2019-01-04 11:32:54'),(711,'POLITICO','POL-8','265899','2018-12-11','2018-12-04','Politico Project.','Ravi Kumar',8,2,'2019-01-04 11:32:54'),(712,'POLITICO','POL-8','265912','2018-12-11','2018-12-04','Working on Politico','Rohit Phutane',8,2,'2019-01-04 11:32:54'),(713,'POLITICO','POL-8','265900','2018-12-12','2018-12-04','Politico Project.','Ravi Kumar',8,2,'2019-01-04 11:32:54'),(714,'POLITICO','POL-8','265913','2018-12-12','2018-12-04','Working on Politico','Rohit Phutane',8,2,'2019-01-04 11:32:54'),(715,'POLITICO','POL-8','265901','2018-12-13','2018-12-04','Politico Project.','Ravi Kumar',8,2,'2019-01-04 11:32:54'),(716,'POLITICO','POL-8','265914','2018-12-13','2018-12-04','Working on Politico','Rohit Phutane',8,2,'2019-01-04 11:32:54'),(717,'POLITICO','POL-8','265902','2018-12-14','2018-12-04','Politico Project.','Ravi Kumar',8,2,'2019-01-04 11:32:54'),(718,'POLITICO','POL-8','265915','2018-12-14','2018-12-04','Working on Politico','Rohit Phutane',8,2,'2019-01-04 11:32:54'),(719,'POLITICO','POL-8','265903','2018-12-17','2018-12-04','Politico Project.','Ravi Kumar',8,2,'2019-01-04 11:32:54'),(720,'POLITICO','POL-8','269992','2018-12-18','2018-12-17','Politico Project','Ravi Kumar',8,2,'2019-01-04 11:32:55'),(721,'POLITICO','POL-8','269993','2018-12-19','2018-12-17','Politico Project','Ravi Kumar',8,2,'2019-01-04 11:32:55'),(722,'POLITICO','POL-8','269994','2018-12-20','2018-12-17','Politico Project','Ravi Kumar',8,2,'2019-01-04 11:32:55'),(723,'POLITICO','POL-8','269995','2018-12-21','2018-12-17','Politico Project','Ravi Kumar',8,2,'2019-01-04 11:32:55'),(724,'POLITICO','POL-8','265916','2018-12-24','2018-12-04','Working on Politico','Rohit Phutane',8,2,'2019-01-04 11:32:55'),(725,'POLITICO','POL-8','269996','2018-12-24','2018-12-17','Politico Project','Ravi Kumar',8,2,'2019-01-04 11:32:55'),(726,'POLITICO','POL-8','265917','2018-12-25','2018-12-04','Working on Politico','Rohit Phutane',8,2,'2019-01-04 11:32:55'),(727,'POLITICO','POL-8','269997','2018-12-25','2018-12-17','Politico Project','Ravi Kumar',8,2,'2019-01-04 11:32:55'),(728,'POLITICO','POL-8','265918','2018-12-26','2018-12-04','Working on Politico','Rohit Phutane',8,2,'2019-01-04 11:32:55'),(729,'POLITICO','POL-8','269998','2018-12-26','2018-12-17','Politico Project','Ravi Kumar',8,2,'2019-01-04 11:32:55'),(730,'POLITICO','POL-8','265919','2018-12-27','2018-12-04','Working on Politico','Rohit Phutane',8,2,'2019-01-04 11:32:55'),(731,'POLITICO','POL-8','269999','2018-12-27','2018-12-17','Politico Project','Ravi Kumar',8,2,'2019-01-04 11:32:55'),(732,'POLITICO','POL-8','265920','2018-12-28','2018-12-04','Working on Politico','Rohit Phutane',8,2,'2019-01-04 11:32:55'),(733,'POLITICO','POL-8','270000','2018-12-28','2018-12-17','Politico Project','Ravi Kumar',8,2,'2019-01-04 11:32:55'),(734,'POLITICO','POL-8','272545','2018-12-29','2018-12-24','Compensating 21st december.','Rohit Phutane',8,2,'2019-01-04 11:32:55'),(735,'POLITICO','POL-8','265921','2018-12-31','2018-12-04','Working on Politico','Rohit Phutane',8,2,'2019-01-04 11:32:55'),(736,'POLITICO','POL-8','270001','2018-12-31','2018-12-17','Politico Project','Ravi Kumar',8,1,'2019-01-04 11:32:56'),(737,'POLITICO','POL-9','265922','2018-12-17','2018-12-04','Leave for Sister\'s Marriage','Rohit Phutane',8,2,'2019-01-04 11:32:56'),(738,'POLITICO','POL-9','265923','2018-12-18','2018-12-04','Leave for Sister\'s Marriage','Rohit Phutane',8,2,'2019-01-04 11:32:56'),(739,'POLITICO','POL-9','272552','2018-12-19','2018-12-24','Leaves','Rohit Phutane',8,2,'2019-01-04 11:32:56'),(740,'POLITICO','POL-9','272553','2018-12-20','2018-12-24','Leaves','Rohit Phutane',8,2,'2019-01-04 11:32:56'),(741,'POLITICO','POL-9','272554','2018-12-21','2018-12-24','Leaves','Rohit Phutane',8,2,'2019-01-04 11:32:56'),(742,'POLITICO','POL-10','275179','2019-01-02','2019-01-02','Politico project','Ravi Kumar',8,1,'2019-01-04 11:32:57'),(743,'POLITICO','POL-10','275180','2019-01-03','2019-01-02','Politico project','Ravi Kumar',8,2,'2019-01-04 11:32:57'),(744,'POLITICO','POL-10','275181','2019-01-04','2019-01-02','Politico project','Ravi Kumar',8,2,'2019-01-04 11:32:57'),(745,'POLITICO','POL-10','275182','2019-01-07','2019-01-02','Politico project','Ravi Kumar',8,2,'2019-01-04 11:32:57'),(746,'POLITICO','POL-10','275183','2019-01-08','2019-01-02','Politico project','Ravi Kumar',8,2,'2019-01-04 11:32:57'),(747,'POLITICO','POL-10','275184','2019-01-09','2019-01-02','Politico project','Ravi Kumar',8,2,'2019-01-04 11:32:57'),(748,'POLITICO','POL-10','275185','2019-01-10','2019-01-02','Politico project','Ravi Kumar',8,2,'2019-01-04 11:32:57'),(749,'POLITICO','POL-10','275186','2019-01-11','2019-01-02','Politico project','Ravi Kumar',8,2,'2019-01-04 11:32:57'),(750,'NBPICREON','NBPICREON-1','247842','2018-10-01','2018-10-15','Gone to Home Town','Kirti Singhal',8,2,'2019-01-04 11:32:58'),(751,'NBPICREON','NBPICREON-1','248656','2018-10-01','2018-10-22','1 casual & 1 official leave','sumit',8,2,'2019-01-04 11:32:58'),(752,'NBPICREON','NBPICREON-1','248915','2018-10-01','2018-10-17','On Leave','Niketa Gupta',8,2,'2019-01-04 11:32:58'),(753,'NBPICREON','NBPICREON-1','249024','2018-10-01','2018-10-17','On Leave','Muqeem Khan',8,2,'2019-01-04 11:32:58'),(754,'NBPICREON','NBPICREON-1','253608','2018-10-01','2018-10-30','Leave','sumit',8,2,'2019-01-04 11:32:58'),(755,'NBPICREON','NBPICREON-1','254375','2018-10-01','2018-10-31','Working on issue NBPICREON-1','Akash Chugh',8,2,'2019-01-04 11:32:58'),(756,'NBPICREON','NBPICREON-1','254497','2018-10-01','2018-10-31','Sick leave','Alok Dayal',8,2,'2019-01-04 11:32:58'),(757,'NBPICREON','NBPICREON-1','254854','2018-10-01','2018-11-01','I was on leave.','Shekh Irfan',8,2,'2019-01-04 11:32:59'),(758,'NBPICREON','NBPICREON-1','256612','2018-10-01','2018-11-08','On Maternity Leaves','Garima Saxena',8,2,'2019-01-04 11:32:59'),(759,'NBPICREON','NBPICREON-1','256633','2018-10-01','2018-11-08','On maternity Leaves','anshu singh',8,2,'2019-01-04 11:32:59'),(760,'NBPICREON','NBPICREON-1','247847','2018-10-02','2018-10-15','Holiday due to Gandhi Jayanti','Kirti Singhal',8,2,'2019-01-04 11:32:59'),(761,'NBPICREON','NBPICREON-1','248704','2018-10-02','2018-10-16','Gandhi Jayanti leave','neeraj_negi',9,2,'2019-01-04 11:32:59'),(762,'NBPICREON','NBPICREON-1','248914','2018-10-02','2018-10-17','Gandhi Jayanti Holiday','Niketa Gupta',8,2,'2019-01-04 11:32:59'),(763,'NBPICREON','NBPICREON-1','251811','2018-10-02','2018-10-25','2nd Oct','Sonika Bansal',8,2,'2019-01-04 11:32:59'),(764,'NBPICREON','NBPICREON-1','253646','2018-10-02','2018-10-30','Gandhi Jayanthi','Rajyalakshmi',8,2,'2019-01-04 11:32:59'),(765,'NBPICREON','NBPICREON-1','254684','2018-10-02','2018-10-31','Official Holiday','Manish Parashar',8,2,'2019-01-04 11:32:59'),(766,'NBPICREON','NBPICREON-1','254857','2018-10-02','2018-11-01','Official leave on GANDHI JAYANTI.','Shekh Irfan',8,2,'2019-01-04 11:32:59'),(767,'NBPICREON','NBPICREON-1','254861','2018-10-02','2018-11-01','Gandhi Jayenti','Faisal Khan',8,2,'2019-01-04 11:32:59'),(768,'NBPICREON','NBPICREON-1','254862','2018-10-02','2018-11-01','GAndhi jayanti','Rimi Bhagat',8,2,'2019-01-04 11:32:59'),(769,'NBPICREON','NBPICREON-1','254911','2018-10-02','2018-11-01','Gandhi Jayanti Holiday','Nikita Chaudhary',8,2,'2019-01-04 11:32:59'),(770,'NBPICREON','NBPICREON-1','247843','2018-10-03','2018-10-15','Gone to Home Town','Kirti Singhal',8,2,'2019-01-04 11:32:59'),(771,'NBPICREON','NBPICREON-1','248498','2018-10-03','2018-10-16','On leave','Himanshu Pandey',8,2,'2019-01-04 11:32:59'),(772,'NBPICREON','NBPICREON-1','255992','2018-10-03','2018-11-05','Working on issue NBPICREON-1','Neha Gupta',8,2,'2019-01-04 11:32:59'),(773,'NBPICREON','NBPICREON-1','256613','2018-10-03','2018-11-08','On Maternity Leaves','Garima Saxena',8,2,'2019-01-04 11:32:59'),(774,'NBPICREON','NBPICREON-1','256634','2018-10-03','2018-11-08','On maternity Leaves','anshu singh',8,2,'2019-01-04 11:32:59'),(775,'NBPICREON','NBPICREON-1','247844','2018-10-04','2018-10-15','Gone to Home Town','Kirti Singhal',8,2,'2019-01-04 11:32:59'),(776,'NBPICREON','NBPICREON-1','248499','2018-10-04','2018-10-16','On leave','Himanshu Pandey',8,2,'2019-01-04 11:32:59'),(777,'NBPICREON','NBPICREON-1','256614','2018-10-04','2018-11-08','On Maternity Leaves','Garima Saxena',8,2,'2019-01-04 11:33:00'),(778,'NBPICREON','NBPICREON-1','256635','2018-10-04','2018-11-08','On maternity Leaves','anshu singh',8,2,'2019-01-04 11:33:00'),(779,'NBPICREON','NBPICREON-1','247845','2018-10-05','2018-10-15','Gone to Home Town','Kirti Singhal',8,2,'2019-01-04 11:33:00'),(780,'NBPICREON','NBPICREON-1','248296','2018-10-05','2018-10-15','On Sick leave','Gaurav Upreti',8,2,'2019-01-04 11:33:00'),(781,'NBPICREON','NBPICREON-1','248500','2018-10-05','2018-10-16','On leave','Himanshu Pandey',8,2,'2019-01-04 11:33:00'),(782,'NBPICREON','NBPICREON-1','251348','2018-10-05','2018-10-24','Leave','Nikesh kumar',8,2,'2019-01-04 11:33:00'),(783,'NBPICREON','NBPICREON-1','256615','2018-10-05','2018-11-08','On Maternity Leaves','Garima Saxena',8,2,'2019-01-04 11:33:00'),(784,'NBPICREON','NBPICREON-1','256636','2018-10-05','2018-11-08','On maternity Leaves','anshu singh',8,2,'2019-01-04 11:33:00'),(785,'NBPICREON','NBPICREON-1','245079','2018-10-08','2018-10-08','Working on issue NBPICREON-1','PMO',1,2,'2019-01-04 11:33:00'),(786,'NBPICREON','NBPICREON-1','248502','2018-10-08','2018-10-16','On leave','Himanshu Pandey',8,2,'2019-01-04 11:33:00'),(787,'NBPICREON','NBPICREON-1','251206','2018-10-08','2018-10-24','Leave on 8oct.','Deepak Sabharwal',8,2,'2019-01-04 11:33:00'),(788,'NBPICREON','NBPICREON-1','251352','2018-10-08','2018-10-24','Leave','Nikesh kumar',8,2,'2019-01-04 11:33:00'),(789,'NBPICREON','NBPICREON-1','251536','2018-10-08','2018-10-24','On leave','Ashish Sood',8,2,'2019-01-04 11:33:00'),(790,'NBPICREON','NBPICREON-1','253186','2018-10-08','2018-10-29','personal','Shyam Sundar',8,2,'2019-01-04 11:33:00'),(791,'NBPICREON','NBPICREON-1','253205','2018-10-08','2018-10-29','on leave','ravi kumar',8,2,'2019-01-04 11:33:00'),(792,'NBPICREON','NBPICREON-1','253381','2018-10-08','2018-10-29','On leave','Mohammad Meraj',8,2,'2019-01-04 11:33:00'),(793,'NBPICREON','NBPICREON-1','256616','2018-10-08','2018-11-08','On Maternity Leaves','Garima Saxena',8,2,'2019-01-04 11:33:00'),(794,'NBPICREON','NBPICREON-1','256637','2018-10-08','2018-11-08','On maternity Leaves','anshu singh',8,2,'2019-01-04 11:33:00'),(795,'NBPICREON','NBPICREON-1','247559','2018-10-09','2018-10-15','Sick Leave','Rasik Awasthi',8,2,'2019-01-04 11:33:00'),(796,'NBPICREON','NBPICREON-1','247771','2018-10-09','2018-10-15','Working on issue NBPICREON-1','Anil Singh',4,2,'2019-01-04 11:33:00'),(797,'NBPICREON','NBPICREON-1','248503','2018-10-09','2018-10-16','On leave','Himanshu Pandey',8,2,'2019-01-04 11:33:01'),(798,'NBPICREON','NBPICREON-1','251353','2018-10-09','2018-10-24','Leave','Nikesh kumar',8,2,'2019-01-04 11:33:01'),(799,'NBPICREON','NBPICREON-1','253383','2018-10-09','2018-10-29','On leave','Mohammad Meraj',8,2,'2019-01-04 11:33:01'),(800,'NBPICREON','NBPICREON-2','247499','2018-09-12','2018-10-15','Completing Joining Formalities','Anurag Arora',4,2,'2019-01-04 11:33:01'),(801,'NBPICREON','NBPICREON-2','259280','2018-09-17','2018-11-14','Icreon Tech Team Meeting','Sachin Kumar Singh',1,2,'2019-01-04 11:33:01'),(802,'NBPICREON','NBPICREON-2','247507','2018-09-18','2018-10-15','Meeting regarding KRA','Anurag Arora',0,2,'2019-01-04 11:33:01'),(803,'NBPICREON','NBPICREON-2','247516','2018-09-20','2018-10-15','Attended Induction','Anurag Arora',3,2,'2019-01-04 11:33:01'),(804,'NBPICREON','NBPICREON-2','247535','2018-09-27','2018-10-15','Meeting with HR for interview','Anurag Arora',0,2,'2019-01-04 11:33:01'),(805,'NBPICREON','NBPICREON-2','247539','2018-09-27','2018-10-15','Corporate Induction','Anurag Arora',2,2,'2019-01-04 11:33:01'),(806,'NBPICREON','NBPICREON-2','259281','2018-09-28','2018-11-14','Project Check In','Sachin Kumar Singh',2,2,'2019-01-04 11:33:01'),(807,'NBPICREON','NBPICREON-2','253301','2018-10-01','2018-10-29','Working on issue NBPICREON-2','Rohit Katyayan',1,2,'2019-01-04 11:33:02'),(808,'NBPICREON','NBPICREON-2','254058','2018-10-01','2018-10-30','Working on issue NBPICREON-2','Abhishek',1,2,'2019-01-04 11:33:02'),(809,'NBPICREON','NBPICREON-2','254723','2018-10-01','2018-10-31','Resource allocation planning','dharmendra singh',2,2,'2019-01-04 11:33:02'),(810,'NBPICREON','NBPICREON-2','254732','2018-10-01','2018-10-31','Interviews and Recruitment coordination','dharmendra singh',1,2,'2019-01-04 11:33:02'),(811,'NBPICREON','NBPICREON-2','249023','2018-10-02','2018-10-17','Official Holiday','Muqeem Khan',8,2,'2019-01-04 11:33:02'),(812,'NBPICREON','NBPICREON-2','253155','2018-10-03','2018-10-29','Worked on Photography Contest Certificates - 2018 designs.','Rohit Sharma',4,2,'2019-01-04 11:33:02'),(813,'NBPICREON','NBPICREON-2','253302','2018-10-03','2018-10-29','Working on issue NBPICREON-2','Rohit Katyayan',1,2,'2019-01-04 11:33:02'),(814,'NBPICREON','NBPICREON-2','253583','2018-10-03','2018-10-30','DZDB Project overview','Rinki',4,2,'2019-01-04 11:33:02'),(815,'NBPICREON','NBPICREON-2','254054','2018-10-03','2018-10-30','Working on issue NBPICREON-2','Abhishek',1,2,'2019-01-04 11:33:02'),(816,'NBPICREON','NBPICREON-2','254662','2018-10-03','2018-10-31','portfolio meeting','dharmendra singh',1,2,'2019-01-04 11:33:02'),(817,'NBPICREON','NBPICREON-2','254733','2018-10-03','2018-10-31','Interviews and Recruitment coordination','dharmendra singh',1,2,'2019-01-04 11:33:02'),(818,'NBPICREON','NBPICREON-2','253157','2018-10-04','2018-10-29','Created Bâday mailer design and welcome banner for Exito Client.','Rohit Sharma',4,2,'2019-01-04 11:33:02'),(819,'NBPICREON','NBPICREON-2','253303','2018-10-04','2018-10-29','Working on issue NBPICREON-2','Rohit Katyayan',1,2,'2019-01-04 11:33:02'),(820,'NBPICREON','NBPICREON-2','254056','2018-10-04','2018-10-30','Working on issue NBPICREON-2','Abhishek',1,2,'2019-01-04 11:33:03'),(821,'NBPICREON','NBPICREON-2','254699','2018-10-04','2018-10-31','UK PMO Meeting','dharmendra singh',1,2,'2019-01-04 11:33:03'),(822,'NBPICREON','NBPICREON-2','254734','2018-10-04','2018-10-31','Interviews and Recruitment coordination','dharmendra singh',1,2,'2019-01-04 11:33:03'),(823,'NBPICREON','NBPICREON-2','253166','2018-10-05','2018-10-29','Participated on Birthday Celebrations.','Rohit Sharma',2,2,'2019-01-04 11:33:03'),(824,'NBPICREON','NBPICREON-2','253304','2018-10-05','2018-10-29','Working on issue NBPICREON-2','Rohit Katyayan',1,2,'2019-01-04 11:33:03'),(825,'NBPICREON','NBPICREON-2','253582','2018-10-05','2018-10-30','BDAY CELEBRATION','Rimi Bhagat',2,2,'2019-01-04 11:33:03'),(826,'NBPICREON','NBPICREON-2','253584','2018-10-05','2018-10-30','fun club meeting','Rimi Bhagat',1,2,'2019-01-04 11:33:03'),(827,'NBPICREON','NBPICREON-2','254701','2018-10-05','2018-10-31','US Project status meeting','dharmendra singh',1,2,'2019-01-04 11:33:03'),(828,'NBPICREON','NBPICREON-2','254735','2018-10-05','2018-10-31','Interviews and Recruitment coordination','dharmendra singh',1,2,'2019-01-04 11:33:03'),(829,'NBPICREON','NBPICREON-2','247781','2018-10-08','2018-10-15','Interview:\nChetan Nathani','Vinod K. Tewthia',1,2,'2019-01-04 11:33:03'),(830,'NBPICREON','NBPICREON-2','253169','2018-10-08','2018-10-29','Worked on DZDB bug fixes and testing for milestone 2','Sudeep Jain',6,2,'2019-01-04 11:33:03'),(831,'NBPICREON','NBPICREON-2','253995','2018-10-08','2018-10-30','Audit activity','Varun',4,2,'2019-01-04 11:33:03'),(832,'NBPICREON','NBPICREON-2','254724','2018-10-08','2018-10-31','Resource allocation planning','dharmendra singh',2,2,'2019-01-04 11:33:03'),(833,'NBPICREON','NBPICREON-2','254736','2018-10-08','2018-10-31','Interviews and Recruitment coordination','dharmendra singh',1,2,'2019-01-04 11:33:03'),(834,'NBPICREON','NBPICREON-2','247558','2018-10-09','2018-10-15','Effective Stand-up Meetings','Anurag Arora',1,2,'2019-01-04 11:33:03'),(835,'NBPICREON','NBPICREON-2','247901','2018-10-09','2018-10-15','Working on issue NBPICREON-2','Rohit Katyayan',1,2,'2019-01-04 11:33:03'),(836,'NBPICREON','NBPICREON-2','247954','2018-10-09','2018-10-15','I have worked on DZDB UI issue for menu load.','Rinki',1,2,'2019-01-04 11:33:03'),(837,'NBPICREON','NBPICREON-2','254737','2018-10-09','2018-10-31','Interviews and Recruitment coordination','dharmendra singh',1,2,'2019-01-04 11:33:03'),(838,'NBPICREON','NBPICREON-2','247544','2018-10-10','2018-10-15','Time management in the verge of Change','Anurag Arora',1,2,'2019-01-04 11:33:03'),(839,'NBPICREON','NBPICREON-2','247783','2018-10-10','2018-10-15','JIRA- Time sheet training','Mahendra Yadav',1,2,'2019-01-04 11:33:04'),(840,'NBPICREON','NBPICREON-2','247784','2018-10-10','2018-10-15','JIRA and TimeSheet changes - awareness ','Vinod K. Tewthia',1,2,'2019-01-04 11:33:04'),(841,'NBPICREON','NBPICREON-2','254703','2018-10-10','2018-10-31','portfolio meeting','dharmendra singh',1,2,'2019-01-04 11:33:04'),(842,'NBPICREON','NBPICREON-2','254738','2018-10-10','2018-10-31','Interviews and Recruitment coordination','dharmendra singh',1,2,'2019-01-04 11:33:04'),(843,'NBPICREON','NBPICREON-2','255974','2018-10-10','2018-11-05','Dorot VP - Forgot Password Implementation Discussion','Manish Kumar Namdeo',1,2,'2019-01-04 11:33:04'),(844,'NBPICREON','NBPICREON-2','255975','2018-10-10','2018-11-05','IMG - Git cleanup using latest prod copy','Manish Kumar Namdeo',2,2,'2019-01-04 11:33:04'),(845,'NBPICREON','NBPICREON-2','247632','2018-10-11','2018-10-15','A@E Project Discussion with Bikash & Pramod Singh.\nReviewed the Project requirement & functionality as per the previous application.','Manish Parashar',3,2,'2019-01-04 11:33:04'),(846,'NBPICREON','NBPICREON-2','247962','2018-10-11','2018-10-15','Got project issue in login (DB;tables was corrupted)','Rinki',4,2,'2019-01-04 11:33:04'),(847,'NBPICREON','NBPICREON-2','254704','2018-10-11','2018-10-31','UK PMO','dharmendra singh',1,2,'2019-01-04 11:33:04'),(848,'NBPICREON','NBPICREON-2','254739','2018-10-11','2018-10-31','Interviews and Recruitment coordination','dharmendra singh',1,2,'2019-01-04 11:33:04'),(849,'NBPICREON','NBPICREON-2','255970','2018-10-11','2018-11-05','IMG - Cropping Issue','Manish Kumar Namdeo',3,2,'2019-01-04 11:33:04'),(850,'NBPICREON','NBPICREON-3','251786','2018-10-01','2018-10-25','Power BI Workspace Understanding','ayush.kalia@icreon.com',4,2,'2019-01-04 11:33:04'),(851,'NBPICREON','NBPICREON-3','253297','2018-10-01','2018-10-29','Working on issue NBPICREON-3','Rohit Katyayan',2,2,'2019-01-04 11:33:06'),(852,'NBPICREON','NBPICREON-3','253802','2018-10-01','2018-10-30','Team Progress Review & Issue Resolution','amit pundeer',1,2,'2019-01-04 11:33:06'),(853,'NBPICREON','NBPICREON-3','254758','2018-10-01','2018-10-31','Project Reviews, Estimates reviews, Progress review etc','dharmendra singh',1,2,'2019-01-04 11:33:06'),(854,'NBPICREON','NBPICREON-3','255075','2018-10-01','2018-11-01','Project Team meetings and discussions','Ajeet Singh',6,2,'2019-01-04 11:33:06'),(855,'NBPICREON','NBPICREON-3','251809','2018-10-03','2018-10-25','Power BI Apps Workspace and Content Packs understanding','ayush.kalia@icreon.com',4,2,'2019-01-04 11:33:06'),(856,'NBPICREON','NBPICREON-3','253298','2018-10-03','2018-10-29','Working on issue NBPICREON-3','Rohit Katyayan',2,2,'2019-01-04 11:33:06'),(857,'NBPICREON','NBPICREON-3','254759','2018-10-03','2018-10-31','Project Reviews, Estimates reviews, Progress review etc','dharmendra singh',2,2,'2019-01-04 11:33:06'),(858,'NBPICREON','NBPICREON-3','255076','2018-10-03','2018-11-01','Project Team meetings and discussions','Ajeet Singh',6,2,'2019-01-04 11:33:06'),(859,'NBPICREON','NBPICREON-3','250464','2018-10-04','2018-10-23','Downtime System was not working ','Akanksha Raghav',2,2,'2019-01-04 11:33:06'),(860,'NBPICREON','NBPICREON-3','251810','2018-10-04','2018-10-25','Power BI Apps Workspace and Content Packs understanding','ayush.kalia@icreon.com',5,2,'2019-01-04 11:33:06'),(861,'NBPICREON','NBPICREON-3','253299','2018-10-04','2018-10-29','Working on issue NBPICREON-3','Rohit Katyayan',2,2,'2019-01-04 11:33:06'),(862,'NBPICREON','NBPICREON-3','253804','2018-10-04','2018-10-30','Weekly Status Review with Justin - FC','amit pundeer',0,2,'2019-01-04 11:33:06'),(863,'NBPICREON','NBPICREON-3','254760','2018-10-04','2018-10-31','Project Reviews, Estimates reviews, Progress review etc','dharmendra singh',1,2,'2019-01-04 11:33:06'),(864,'NBPICREON','NBPICREON-3','255078','2018-10-04','2018-11-01','Project Team meetings and discussions','Ajeet Singh',6,2,'2019-01-04 11:33:06'),(865,'NBPICREON','NBPICREON-3','251808','2018-10-05','2018-10-25','Power BI Functionality of Report Sharing','ayush.kalia@icreon.com',5,2,'2019-01-04 11:33:06'),(866,'NBPICREON','NBPICREON-3','253300','2018-10-05','2018-10-29','Working on issue NBPICREON-3','Rohit Katyayan',2,2,'2019-01-04 11:33:06'),(867,'NBPICREON','NBPICREON-3','253803','2018-10-05','2018-10-30','Release Planning Discussion & Review final release plan for FC','amit pundeer',2,2,'2019-01-04 11:33:06'),(868,'NBPICREON','NBPICREON-3','254761','2018-10-05','2018-10-31','Project Reviews, Estimates reviews, Progress review etc','dharmendra singh',1,2,'2019-01-04 11:33:06'),(869,'NBPICREON','NBPICREON-3','255083','2018-10-05','2018-11-01','Project Team meetings and discussions','Ajeet Singh',6,2,'2019-01-04 11:33:06'),(870,'NBPICREON','NBPICREON-3','247894','2018-10-08','2018-10-15','Working on issue NBPICREON-3','Rohit Katyayan',2,2,'2019-01-04 11:33:06'),(871,'NBPICREON','NBPICREON-3','251812','2018-10-08','2018-10-25','Power BI Drill Through Reports and Drill Down','ayush.kalia@icreon.com',6,2,'2019-01-04 11:33:07'),(872,'NBPICREON','NBPICREON-3','254762','2018-10-08','2018-10-31','Project Reviews, Estimates reviews, Progress review etc','dharmendra singh',1,2,'2019-01-04 11:33:07'),(873,'NBPICREON','NBPICREON-3','255085','2018-10-08','2018-11-01','Project Team meetings and discussions','Ajeet Singh',6,2,'2019-01-04 11:33:07'),(874,'NBPICREON','NBPICREON-3','251813','2018-10-09','2018-10-25','SSRS Reports Understanding','ayush.kalia@icreon.com',7,2,'2019-01-04 11:33:07'),(875,'NBPICREON','NBPICREON-3','252974','2018-10-09','2018-10-30','Nodejs learning and help','Safdar Javed',3,2,'2019-01-04 11:33:07'),(876,'NBPICREON','NBPICREON-3','254763','2018-10-09','2018-10-31','Project Reviews, Estimates reviews, Progress review etc','dharmendra singh',3,2,'2019-01-04 11:33:07'),(877,'NBPICREON','NBPICREON-3','255086','2018-10-09','2018-11-01','Project Team meetings and discussions','Ajeet Singh',6,2,'2019-01-04 11:33:07'),(878,'NBPICREON','NBPICREON-3','247902','2018-10-10','2018-10-15','Working on issue NBPICREON-3','Rohit Katyayan',1,2,'2019-01-04 11:33:07'),(879,'NBPICREON','NBPICREON-3','251814','2018-10-10','2018-10-25','SSRS Reports Understanding','ayush.kalia@icreon.com',7,2,'2019-01-04 11:33:07'),(880,'NBPICREON','NBPICREON-3','254764','2018-10-10','2018-10-31','Project Reviews, Estimates reviews, Progress review etc','dharmendra singh',2,2,'2019-01-04 11:33:07'),(881,'NBPICREON','NBPICREON-3','255089','2018-10-10','2018-11-01','Project Team meetings and discussions','Ajeet Singh',6,2,'2019-01-04 11:33:07'),(882,'NBPICREON','NBPICREON-3','246794','2018-10-11','2018-10-11','PMO call with UK team','Pramod K Singh',1,2,'2019-01-04 11:33:07'),(883,'NBPICREON','NBPICREON-3','247896','2018-10-11','2018-10-15','Working on issue NBPICREON-3','Rohit Katyayan',1,2,'2019-01-04 11:33:07'),(884,'NBPICREON','NBPICREON-3','251815','2018-10-11','2018-10-25','SSRS Reports Understanding','ayush.kalia@icreon.com',7,2,'2019-01-04 11:33:07'),(885,'NBPICREON','NBPICREON-3','253805','2018-10-11','2018-10-30','Weekly Status Review with Justin - FC','amit pundeer',0,2,'2019-01-04 11:33:07'),(886,'NBPICREON','NBPICREON-3','254765','2018-10-11','2018-10-31','Project Reviews, Estimates reviews, Progress review etc','dharmendra singh',1,2,'2019-01-04 11:33:07'),(887,'NBPICREON','NBPICREON-3','247898','2018-10-12','2018-10-15','Working on issue NBPICREON-3','Rohit Katyayan',2,2,'2019-01-04 11:33:07'),(888,'NBPICREON','NBPICREON-3','251816','2018-10-12','2018-10-25','Creating Basic SSRS Report','ayush.kalia@icreon.com',6,2,'2019-01-04 11:33:07'),(889,'NBPICREON','NBPICREON-3','253808','2018-10-12','2018-10-30','Defect Review Status and Issue resolution','amit pundeer',1,2,'2019-01-04 11:33:07'),(890,'NBPICREON','NBPICREON-3','254766','2018-10-12','2018-10-31','Project Reviews, Estimates reviews, Progress review etc','dharmendra singh',1,2,'2019-01-04 11:33:07'),(891,'NBPICREON','NBPICREON-3','248391','2018-10-15','2018-10-16','Sending build for Ask-A-Tasker and discuss with Omvir for issues in APIs(database connection) as Ajeet said to look into for Sada and client.','Pramod K Singh',1,2,'2019-01-04 11:33:07'),(892,'NBPICREON','NBPICREON-3','250055','2018-10-15','2018-10-22','Working on issue NBPICREON-3','Rohit Katyayan',1,2,'2019-01-04 11:33:07'),(893,'NBPICREON','NBPICREON-3','251817','2018-10-15','2018-10-25','Working on the Reports of SSRS and Difference between SSRS and Power BI in terms of functionality','ayush.kalia@icreon.com',6,2,'2019-01-04 11:33:07'),(894,'NBPICREON','NBPICREON-3','252395','2018-10-15','2018-10-26','read email and reply','Pramod K Singh',0,2,'2019-01-04 11:33:08'),(895,'NBPICREON','NBPICREON-3','254767','2018-10-15','2018-10-31','Project Reviews, Estimates reviews, Progress review etc','dharmendra singh',1,2,'2019-01-04 11:33:08'),(896,'NBPICREON','NBPICREON-3','248900','2018-10-16','2018-10-17','Collecting info about TaxiNet project and provide code & details to Randhir.','Pramod K Singh',2,2,'2019-01-04 11:33:08'),(897,'NBPICREON','NBPICREON-3','248962','2018-10-16','2018-10-17','email deployment issueon qa server','Naina Verma',1,2,'2019-01-04 11:33:08'),(898,'NBPICREON','NBPICREON-3','249661','2018-10-16','2018-10-24','Opun - discussion with team for the project and processes, Revisit discussion meeting points from meeting with Rahul','Shantakaram',2,2,'2019-01-04 11:33:08'),(899,'NBPICREON','NBPICREON-3','250056','2018-10-16','2018-10-22','Working on issue NBPICREON-3','Rohit Katyayan',1,2,'2019-01-04 11:33:08'),(900,'NBPICREON','NBPICREON-4','254059','2018-10-11','2018-10-30','Working on issue NBPICREON-4','Abhishek',2,2,'2019-01-04 11:33:08'),(901,'NBPICREON','NBPICREON-4','254060','2018-10-12','2018-10-30','USM CR','Abhishek',2,2,'2019-01-04 11:33:10'),(902,'NBPICREON','NBPICREON-4','248539','2018-10-15','2018-10-16','Referrals estimate and discussion','Ankur Bansal',4,2,'2019-01-04 11:33:10'),(903,'NBPICREON','NBPICREON-4','248654','2018-10-15','2018-10-16','1) Attended Group Call for project \"SPLASH\".\n2) Created Sub-tasks for Web\n3) Time estimated','Saurabh Kumar',4,2,'2019-01-04 11:33:10'),(904,'NBPICREON','NBPICREON-4','248662','2018-10-15','2018-10-16','Reviewed and discussion with Sada, Rahul Singh and Ankur Bansal for A@E Web & Mobile app estimation. As per the discussion & given document, created the feature listing/item list for estimation.','Manish Parashar',3,2,'2019-01-04 11:33:10'),(905,'NBPICREON','NBPICREON-4','249585','2018-10-15','2018-10-18','For USM','Abhishek',3,2,'2019-01-04 11:33:11'),(906,'NBPICREON','NBPICREON-4','249666','2018-10-15','2018-10-24','Work on the proposed CR - analysis, and estimation; related communication with onsite team','Shantakaram',2,2,'2019-01-04 11:33:11'),(907,'NBPICREON','NBPICREON-4','250152','2018-10-15','2018-10-22','OnState Pipeline Deployment Document','Vivek N. Tiwari',4,2,'2019-01-04 11:33:11'),(908,'NBPICREON','NBPICREON-4','248775','2018-10-16','2018-10-16','Referals Estimate','Ankur Bansal',4,2,'2019-01-04 11:33:11'),(909,'NBPICREON','NBPICREON-4','249100','2018-10-16','2018-10-17','1) Attended the Internal call with UK Sales Team\n2) Attended the Client Call regarding project SPLASH for Story Discussion','Saurabh Kumar',5,2,'2019-01-04 11:33:11'),(910,'NBPICREON','NBPICREON-4','249586','2018-10-16','2018-10-18','Working on issue NBPICREON-4','Abhishek',2,2,'2019-01-04 11:33:11'),(911,'NBPICREON','NBPICREON-4','249101','2018-10-17','2018-10-17','1) Analyze the shared document regarding project SPLASH\n2) Attended the internal and Client call for project SPLASH','Saurabh Kumar',4,2,'2019-01-04 11:33:11'),(912,'NBPICREON','NBPICREON-4','249217','2018-10-17','2018-10-17','Worked on FOX+ Posters to client pitch.','Rohit Sharma',2,2,'2019-01-04 11:33:11'),(913,'NBPICREON','NBPICREON-4','249667','2018-10-17','2018-10-24','Work on the proposed CR - analysis, and estimation; related communication with onsite team','Shantakaram',2,2,'2019-01-04 11:33:11'),(914,'NBPICREON','NBPICREON-4','250154','2018-10-17','2018-10-22','OnState Pipeline Deployment Document','Vivek N. Tiwari',4,2,'2019-01-04 11:33:11'),(915,'NBPICREON','NBPICREON-4','249393','2018-10-18','2018-10-18','Estimate discussion for Referrals app','Ankur Bansal',2,2,'2019-01-04 11:33:11'),(916,'NBPICREON','NBPICREON-4','250155','2018-10-18','2018-10-22','OnState Pipeline Deployment Document','Vivek N. Tiwari',4,2,'2019-01-04 11:33:11'),(917,'NBPICREON','NBPICREON-4','251364','2018-10-22','2018-10-24','Worked on POC ','Nikesh kumar',8,2,'2019-01-04 11:33:11'),(918,'NBPICREON','NBPICREON-4','251365','2018-10-23','2018-10-24','Worked on POC ','Nikesh kumar',8,2,'2019-01-04 11:33:11'),(919,'NBPICREON','NBPICREON-4','252304','2018-10-23','2018-10-26','Working on issue NBPICREON-4','Alankar Srivastava',4,2,'2019-01-04 11:33:11'),(920,'NBPICREON','NBPICREON-4','252345','2018-10-26','2018-10-26','Worked on PBI Rest API','Alankar Srivastava',2,2,'2019-01-04 11:33:11'),(921,'NBPICREON','NBPICREON-4','253436','2018-10-29','2018-10-29','3 GP CR estimation and discussion with team and shared with Dharmendra  Sir and Sada Sir.','Manish Parashar',2,2,'2019-01-04 11:33:11'),(922,'NBPICREON','NBPICREON-4','253884','2018-10-30','2018-10-30','Call with Rahul regarding TakeNote mobile app changes to discus with client. Read doc shared with Rahul.','Pramod K Singh',1,2,'2019-01-04 11:33:11'),(923,'NBPICREON','NBPICREON-4','254077','2018-10-30','2018-10-30','Discussion on USM with ( uk team )\nInternal with Abhishek','Hemant Tiwari',1,2,'2019-01-04 11:33:11'),(924,'NBPICREON','NBPICREON-4','254186','2018-10-30','2018-10-31','Working Voices and USM','Ankur Bansal',4,2,'2019-01-04 11:33:11'),(925,'NBPICREON','NBPICREON-4','254354','2018-10-30','2018-10-31','Working Voice: R&D for Auth0 ','PriyaranjanPaikray',1,2,'2019-01-04 11:33:11'),(926,'NBPICREON','NBPICREON-4','254720','2018-10-31','2018-10-31','Review the changes for TakeNote and HKI to discuss with client to approve CR','Pramod K Singh',2,2,'2019-01-04 11:33:11'),(927,'NBPICREON','NBPICREON-4','254994','2018-10-31','2018-11-01','Woking on Project SOLEIF for Field mapping analysis and reply for the provided sheet.','Saurabh Kumar',5,2,'2019-01-04 11:33:11'),(928,'NBPICREON','NBPICREON-4','255042','2018-10-31','2018-11-01','Working on issue NBPICREON-4','Ankur Bansal',2,2,'2019-01-04 11:33:12'),(929,'NBPICREON','NBPICREON-4','255778','2018-11-01','2018-11-05','Working on issue NBPICREON-4','Ankur Bansal',2,2,'2019-01-04 11:33:12'),(930,'NBPICREON','NBPICREON-4','255752','2018-11-02','2018-11-05','Estimate and discuss the changes with Rahul for TakeNote project','Pramod K Singh',2,2,'2019-01-04 11:33:12'),(931,'NBPICREON','NBPICREON-4','255779','2018-11-02','2018-11-05','Working on issue NBPICREON-4','Ankur Bansal',2,2,'2019-01-04 11:33:12'),(932,'NBPICREON','NBPICREON-4','256467','2018-11-05','2018-11-06','POP project time estimation and discussion','ramratan',3,2,'2019-01-04 11:33:12'),(933,'NBPICREON','NBPICREON-4','256361','2018-11-06','2018-11-06','Review CR\'s on shortsTV','Hemant Tiwari',1,2,'2019-01-04 11:33:12'),(934,'NBPICREON','NBPICREON-4','257301','2018-11-09','2018-11-12','Working on \n - Answering the Questions asked by Magrath customer regarding their security audit.\n - Analysis and detailing on the \'Add Employee w/o Application\' change requirement\n','Shantakaram',4,2,'2019-01-04 11:33:12'),(935,'NBPICREON','NBPICREON-4','258703','2018-11-12','2018-11-13','Estimation of ShortsTV app for Android. Referring the current iOS app. Prepare some feature listing.','Abhishek Singh',4,2,'2019-01-04 11:33:12'),(936,'NBPICREON','NBPICREON-4','258602','2018-11-13','2018-11-13','Preparing plan and tasks to process for migration HMV site on new server for approval.','Pramod K Singh',3,2,'2019-01-04 11:33:12'),(937,'NBPICREON','NBPICREON-4','258707','2018-11-13','2018-11-13','Prepare complete feature listing and share estimates with the Managers(Rohit/Abhishek)','Abhishek Singh',5,2,'2019-01-04 11:33:12'),(938,'NBPICREON','NBPICREON-4','258708','2018-11-13','2018-11-13','Working Voices new requirement meeting and discussion with team.','Abhishek Singh',1,2,'2019-01-04 11:33:12'),(939,'NBPICREON','NBPICREON-4','258911','2018-11-13','2018-11-14','Working on issue NBPICREON-4','Ankur Bansal',2,2,'2019-01-04 11:33:12'),(940,'NBPICREON','NBPICREON-4','258933','2018-11-13','2018-11-15','Analyzing the implementation of JQuery Keyboard integration and Optimization.','Saurabh Kumar',4,2,'2019-01-04 11:33:12'),(941,'NBPICREON','NBPICREON-4','260011','2018-11-13','2018-11-16','Call on integration of AIVR POC with Mednection web app.','Shishir Kumar',0,2,'2019-01-04 11:33:12'),(942,'NBPICREON','NBPICREON-4','259713','2018-11-14','2018-11-15','PreDev analysis for the project peppersq.com','Saurabh Kumar',4,2,'2019-01-04 11:33:12'),(943,'NBPICREON','NBPICREON-4','260222','2018-11-14','2018-11-16','Working Voices new CR estimates and meeting.','Abhishek Singh',2,2,'2019-01-04 11:33:12'),(944,'NBPICREON','NBPICREON-4','261068','2018-11-14','2018-11-20','Worked for DZDB project for DAM module, estimations and workflow.','Alankar Srivastava',1,2,'2019-01-04 11:33:12'),(945,'NBPICREON','NBPICREON-4','259886','2018-11-15','2018-11-16','install and understanding of peppersq project','Nikesh kumar',8,2,'2019-01-04 11:33:12'),(946,'NBPICREON','NBPICREON-4','260214','2018-11-15','2018-11-16','Downlaod and build the new app lead named \"CycleSafty\". SHared by Sada. Meeting with Sada to understand the concept and look in to the code.','Abhishek Singh',4,2,'2019-01-04 11:33:12'),(947,'NBPICREON','NBPICREON-4','260374','2018-11-15','2018-11-18','PreDev analysis for the project peppersq.com','Saurabh Kumar',4,2,'2019-01-04 11:33:12'),(948,'NBPICREON','NBPICREON-4','260558','2018-11-15','2018-11-19','HKI and Working voices estimation  and call with client','Ankur Bansal',3,2,'2019-01-04 11:33:12'),(949,'NBPICREON','NBPICREON-4','261069','2018-11-15','2018-11-20','Worked for DZDB project for DAM module, estimations and workflow.','Alankar Srivastava',1,2,'2019-01-04 11:33:12'),(950,'NBPICREON','NBPICREON-5','247500','2018-09-12','2018-10-15','Introduction to React','Anurag Arora',3,2,'2019-01-04 11:33:13'),(951,'NBPICREON','NBPICREON-5','247501','2018-09-13','2018-10-15','React Documentation\nIntroducing JSX\nRendering Elements','Anurag Arora',8,2,'2019-01-04 11:33:13'),(952,'NBPICREON','NBPICREON-5','247502','2018-09-14','2018-10-15','React documentation and training\nComponents and Props\nState and Life cycle\nHandling Events','Anurag Arora',8,2,'2019-01-04 11:33:13'),(953,'NBPICREON','NBPICREON-5','247503','2018-09-17','2018-10-15','Daily Standup meeting','Anurag Arora',0,2,'2019-01-04 11:33:13'),(954,'NBPICREON','NBPICREON-5','247504','2018-09-17','2018-10-15','Workflow and checking for any issues according to the story','Anurag Arora',0,2,'2019-01-04 11:33:13'),(955,'NBPICREON','NBPICREON-5','247505','2018-09-17','2018-10-15','Workflow and checking for any issues according to the story','Anurag Arora',0,2,'2019-01-04 11:33:13'),(956,'NBPICREON','NBPICREON-5','247506','2018-09-17','2018-10-15','React documentation\nConditional Rendering\nLists and keys\nLifting form up\nIntroduction to Redux\nUdemy videos for the same','Anurag Arora',7,2,'2019-01-04 11:33:13'),(957,'NBPICREON','NBPICREON-5','247508','2018-09-18','2018-10-15','Freight Center Overview','Anurag Arora',0,2,'2019-01-04 11:33:13'),(958,'NBPICREON','NBPICREON-5','247509','2018-09-18','2018-10-15','Daily Standup meeting','Anurag Arora',0,2,'2019-01-04 11:33:13'),(959,'NBPICREON','NBPICREON-5','247510','2018-09-18','2018-10-15','Checked and tested for any issues including designing issues','Anurag Arora',0,2,'2019-01-04 11:33:13'),(960,'NBPICREON','NBPICREON-5','247511','2018-09-18','2018-10-15','Checked and tested for any issues including designing issues','Anurag Arora',0,2,'2019-01-04 11:33:13'),(961,'NBPICREON','NBPICREON-5','247512','2018-09-18','2018-10-15','Composition vs Inheritance\nRedux Videos and learned concepts like store, reducer, actions and dispatch','Anurag Arora',5,2,'2019-01-04 11:33:13'),(962,'NBPICREON','NBPICREON-5','247513','2018-09-18','2018-10-15','React Routing Concepts','Anurag Arora',1,2,'2019-01-04 11:33:13'),(963,'NBPICREON','NBPICREON-5','247514','2018-09-19','2018-10-15','Researched on PowerBI Custom layout and developed the same according to some resources.','Anurag Arora',5,2,'2019-01-04 11:33:13'),(964,'NBPICREON','NBPICREON-5','247515','2018-09-19','2018-10-15','Forms and form validations\nReact child routing','Anurag Arora',3,2,'2019-01-04 11:33:13'),(965,'NBPICREON','NBPICREON-5','247517','2018-09-20','2018-10-15','Worked on PowerBI print feature','Anurag Arora',2,2,'2019-01-04 11:33:14'),(966,'NBPICREON','NBPICREON-5','247518','2018-09-20','2018-10-15','Implemeted custom PowerBI according to layout Visuals widgets checkbox','Anurag Arora',3,2,'2019-01-04 11:33:14'),(967,'NBPICREON','NBPICREON-5','247519','2018-09-21','2018-10-15','Removed from development branch due to some testing purpose and done some testing as well','Anurag Arora',0,2,'2019-01-04 11:33:14'),(968,'NBPICREON','NBPICREON-5','247520','2018-09-21','2018-10-15','Added this feature on live','Anurag Arora',0,2,'2019-01-04 11:33:14'),(969,'NBPICREON','NBPICREON-5','247521','2018-09-21','2018-10-15','Worked on Dynamic Layout','Anurag Arora',7,2,'2019-01-04 11:33:14'),(970,'NBPICREON','NBPICREON-5','247522','2018-09-21','2018-10-15','Daily Standup Meeting','Anurag Arora',0,2,'2019-01-04 11:33:14'),(971,'NBPICREON','NBPICREON-5','247524','2018-09-24','2018-10-15','Hide show feature for visuals along with sorting of containers ','Anurag Arora',8,2,'2019-01-04 11:33:14'),(972,'NBPICREON','NBPICREON-5','247525','2018-09-24','2018-10-15','Daily Stand up meeting','Anurag Arora',0,2,'2019-01-04 11:33:14'),(973,'NBPICREON','NBPICREON-5','247527','2018-09-25','2018-10-15','Researched and implementation on PowerBI PDF','Anurag Arora',2,2,'2019-01-04 11:33:14'),(974,'NBPICREON','NBPICREON-5','247528','2018-09-25','2018-10-15','Completed hide/show feature','Anurag Arora',2,2,'2019-01-04 11:33:14'),(975,'NBPICREON','NBPICREON-5','247529','2018-09-25','2018-10-15','Daily stand up meeting','Anurag Arora',0,2,'2019-01-04 11:33:14'),(976,'NBPICREON','NBPICREON-5','247530','2018-09-25','2018-10-15','React developer tools\nHTTP/ AJAX Requests\nIntercepting Requests\nError Handling','Anurag Arora',3,2,'2019-01-04 11:33:14'),(977,'NBPICREON','NBPICREON-5','247531','2018-09-25','2018-10-15','Finance Induction','Anurag Arora',0,2,'2019-01-04 11:33:14'),(978,'NBPICREON','NBPICREON-5','247532','2018-09-26','2018-10-15','Moved the report layout to its own new page','Anurag Arora',2,2,'2019-01-04 11:33:14'),(979,'NBPICREON','NBPICREON-5','247533','2018-09-26','2018-10-15','Styling React Components & Elements\nWorking with Lists and Conditionals\nDebugging React Apps','Anurag Arora',6,2,'2019-01-04 11:33:14'),(980,'NBPICREON','NBPICREON-5','247534','2018-09-27','2018-10-15','Moved filters from the page to the dialog box','Anurag Arora',2,2,'2019-01-04 11:33:14'),(981,'NBPICREON','NBPICREON-5','247536','2018-09-27','2018-10-15','Introduction to NodeJS','Anurag Arora',0,2,'2019-01-04 11:33:14'),(982,'NBPICREON','NBPICREON-5','247537','2018-09-27','2018-10-15','Diving Deeper into Components & React Internal','Anurag Arora',1,2,'2019-01-04 11:33:14'),(983,'NBPICREON','NBPICREON-5','247538','2018-09-27','2018-10-15','Data entry in Accessorial Page','Anurag Arora',1,2,'2019-01-04 11:33:14'),(984,'NBPICREON','NBPICREON-5','247540','2018-09-28','2018-10-15','Moved powerbi report section of all report to a new page','Anurag Arora',0,2,'2019-01-04 11:33:14'),(985,'NBPICREON','NBPICREON-5','247541','2018-09-28','2018-10-15','Learned NodeJS','Anurag Arora',7,2,'2019-01-04 11:33:15'),(986,'NBPICREON','NBPICREON-5','247550','2018-10-01','2018-10-15','Node and Angular Interview questions','Anurag Arora',8,2,'2019-01-04 11:33:15'),(987,'NBPICREON','NBPICREON-5','249319','2018-10-01','2018-10-18','Complete a Assigned Task which one assigned by team lead','sankalp awasthi',8,2,'2019-01-04 11:33:15'),(988,'NBPICREON','NBPICREON-5','250463','2018-10-01','2018-10-23','AGU Audit meeting','Akanksha Raghav',1,2,'2019-01-04 11:33:15'),(989,'NBPICREON','NBPICREON-5','253264','2018-10-01','2018-10-29','Learn ReactJs.','Abhishek Singh',8,2,'2019-01-04 11:33:15'),(990,'NBPICREON','NBPICREON-5','254891','2018-10-01','2018-11-01','Angular 6','PriyaranjanPaikray',8,2,'2019-01-04 11:33:15'),(991,'NBPICREON','NBPICREON-5','256026','2018-10-01','2018-11-05','Sitecore training','Sushil Kumar',0,2,'2019-01-04 11:33:15'),(992,'NBPICREON','NBPICREON-5','249320','2018-10-02','2018-10-18','National Holiday','sankalp awasthi',8,2,'2019-01-04 11:33:15'),(993,'NBPICREON','NBPICREON-5','247552','2018-10-03','2018-10-15','Interview preparation for node and angular','Anurag Arora',8,2,'2019-01-04 11:33:15'),(994,'NBPICREON','NBPICREON-5','253265','2018-10-03','2018-10-29','Learn ReactJs.','Abhishek Singh',8,2,'2019-01-04 11:33:15'),(995,'NBPICREON','NBPICREON-5','253640','2018-10-03','2018-10-30','Automating Ross Project','Jitendra Singh',2,2,'2019-01-04 11:33:15'),(996,'NBPICREON','NBPICREON-5','254956','2018-10-03','2018-11-01','Working on issue NBPICREON-5','PriyaranjanPaikray',8,2,'2019-01-04 11:33:15'),(997,'NBPICREON','NBPICREON-5','256028','2018-10-03','2018-11-05','Sitecore training','Sushil Kumar',0,2,'2019-01-04 11:33:15'),(998,'NBPICREON','NBPICREON-5','247553','2018-10-04','2018-10-15','Interview Preparation for angular and node','Anurag Arora',8,2,'2019-01-04 11:33:15'),(999,'NBPICREON','NBPICREON-5','253266','2018-10-04','2018-10-29','Learn ReactJs.','Abhishek Singh',8,2,'2019-01-04 11:33:15'),(1000,'NBPICREON','NBPICREON-6','248710','2018-10-01','2018-10-16','Working on issue NBPICREON-6','Puneet Parashar',8,2,'2019-01-04 11:33:17'),(1001,'NBPICREON','NBPICREON-6','253170','2018-10-01','2018-10-29','Reporting and analysis for project management process improvement','Shyam Sundar',7,2,'2019-01-04 11:33:17'),(1002,'NBPICREON','NBPICREON-6','253251','2018-10-01','2018-10-29','Working on issue NBPICREON-6','Preeti Bhatt',7,2,'2019-01-04 11:33:17'),(1003,'NBPICREON','NBPICREON-6','253254','2018-10-01','2018-10-29','Working on issue NBPICREON-6','shashi kant singh',6,2,'2019-01-04 11:33:17'),(1004,'NBPICREON','NBPICREON-6','253587','2018-10-01','2018-10-30','Working on issue NBPICREON-6','Rinki',8,2,'2019-01-04 11:33:18'),(1005,'NBPICREON','NBPICREON-6','253683','2018-10-01','2018-10-30','Working on issue NBPICREON-6','mohit pandey',4,2,'2019-01-04 11:33:18'),(1006,'NBPICREON','NBPICREON-6','248711','2018-10-03','2018-10-16','Working on issue NBPICREON-6','Puneet Parashar',8,2,'2019-01-04 11:33:18'),(1007,'NBPICREON','NBPICREON-6','253171','2018-10-03','2018-10-29','Reporting and analysis for project management process improvement','Shyam Sundar',7,2,'2019-01-04 11:33:18'),(1008,'NBPICREON','NBPICREON-6','253253','2018-10-03','2018-10-29','Working on issue NBPICREON-6','Preeti Bhatt',8,2,'2019-01-04 11:33:18'),(1009,'NBPICREON','NBPICREON-6','253256','2018-10-03','2018-10-29','Working on issue NBPICREON-6','shashi kant singh',4,2,'2019-01-04 11:33:18'),(1010,'NBPICREON','NBPICREON-6','253684','2018-10-03','2018-10-30','Working on issue NBPICREON-6','mohit pandey',4,2,'2019-01-04 11:33:18'),(1011,'NBPICREON','NBPICREON-6','248712','2018-10-04','2018-10-16','Working on issue NBPICREON-6','Puneet Parashar',8,2,'2019-01-04 11:33:18'),(1012,'NBPICREON','NBPICREON-6','253174','2018-10-04','2018-10-29','Working on issue NBPICREON-6','Shyam Sundar',7,2,'2019-01-04 11:33:18'),(1013,'NBPICREON','NBPICREON-6','253255','2018-10-04','2018-10-29','Working on issue NBPICREON-6','Preeti Bhatt',8,2,'2019-01-04 11:33:18'),(1014,'NBPICREON','NBPICREON-6','253257','2018-10-04','2018-10-29','Working on issue NBPICREON-6','shashi kant singh',4,2,'2019-01-04 11:33:18'),(1015,'NBPICREON','NBPICREON-6','253685','2018-10-04','2018-10-30','Working on issue NBPICREON-6','mohit pandey',4,2,'2019-01-04 11:33:18'),(1016,'NBPICREON','NBPICREON-6','248713','2018-10-05','2018-10-16','Working on issue NBPICREON-6','Puneet Parashar',8,2,'2019-01-04 11:33:18'),(1017,'NBPICREON','NBPICREON-6','253176','2018-10-05','2018-10-29','Reporting and analysis for project management process improvement','Shyam Sundar',7,2,'2019-01-04 11:33:18'),(1018,'NBPICREON','NBPICREON-6','253252','2018-10-05','2018-10-29','Working on issue NBPICREON-6','shashi kant singh',4,2,'2019-01-04 11:33:18'),(1019,'NBPICREON','NBPICREON-6','253259','2018-10-05','2018-10-29','Working on issue NBPICREON-6','Preeti Bhatt',8,2,'2019-01-04 11:33:18'),(1020,'NBPICREON','NBPICREON-6','247741','2018-10-08','2018-10-15','Working on issue NBPICREON-6','shashi kant singh',5,2,'2019-01-04 11:33:18'),(1021,'NBPICREON','NBPICREON-6','248714','2018-10-08','2018-10-16','Working on issue NBPICREON-6','Puneet Parashar',8,2,'2019-01-04 11:33:18'),(1022,'NBPICREON','NBPICREON-6','253261','2018-10-08','2018-10-29','Working on issue NBPICREON-6','Preeti Bhatt',7,2,'2019-01-04 11:33:18'),(1023,'NBPICREON','NBPICREON-6','253548','2018-10-08','2018-10-30','Standby forextended IMG Support ','sumit',5,2,'2019-01-04 11:33:18'),(1024,'NBPICREON','NBPICREON-6','253688','2018-10-08','2018-10-30','Working on issue NBPICREON-6','mohit pandey',4,2,'2019-01-04 11:33:19'),(1025,'NBPICREON','NBPICREON-6','255163','2018-10-08','2018-11-01','Drupal Module Learning.','khursheedalam',6,2,'2019-01-04 11:33:19'),(1026,'NBPICREON','NBPICREON-6','247666','2018-10-09','2018-10-15','Working on issue NBPBA-19','Naman Tyagi',2,2,'2019-01-04 11:33:19'),(1027,'NBPICREON','NBPICREON-6','247745','2018-10-09','2018-10-15','Working on issue NBPICREON-6','shashi kant singh',2,2,'2019-01-04 11:33:19'),(1028,'NBPICREON','NBPICREON-6','247916','2018-10-09','2018-10-15','Project data analysis for process improvement.','Shyam Sundar',7,2,'2019-01-04 11:33:19'),(1029,'NBPICREON','NBPICREON-6','248715','2018-10-09','2018-11-02','Working on issue NBPICREON-6','Puneet Parashar',7,2,'2019-01-04 11:33:19'),(1030,'NBPICREON','NBPICREON-6','252394','2018-10-09','2018-10-26','Working on issue NBPICREON-6','Pramod K Singh',2,2,'2019-01-04 11:33:19'),(1031,'NBPICREON','NBPICREON-6','253207','2018-10-09','2018-10-29','learning advanced javascript','ravi kumar',8,2,'2019-01-04 11:33:19'),(1032,'NBPICREON','NBPICREON-6','253241','2018-10-09','2018-10-29','Working on issue NBPICREON-6','mohit pandey',4,2,'2019-01-04 11:33:19'),(1033,'NBPICREON','NBPICREON-6','253262','2018-10-09','2018-10-29','Working on issue NBPICREON-6','Preeti Bhatt',8,2,'2019-01-04 11:33:19'),(1034,'NBPICREON','NBPICREON-6','247669','2018-10-10','2018-10-15','Working on issue NBPBA-19','Naman Tyagi',2,2,'2019-01-04 11:33:19'),(1035,'NBPICREON','NBPICREON-6','247746','2018-10-10','2018-10-15','Working on issue NBPICREON-6','shashi kant singh',4,2,'2019-01-04 11:33:19'),(1036,'NBPICREON','NBPICREON-6','247919','2018-10-10','2018-10-15','Project data analysis for process improvement.','Shyam Sundar',7,2,'2019-01-04 11:33:19'),(1037,'NBPICREON','NBPICREON-6','248716','2018-10-10','2018-11-02','Working on issue NBPICREON-6','Puneet Parashar',6,2,'2019-01-04 11:33:19'),(1038,'NBPICREON','NBPICREON-6','250661','2018-10-10','2018-10-23','learning advanced javascript','ravi kumar',8,2,'2019-01-04 11:33:19'),(1039,'NBPICREON','NBPICREON-6','253239','2018-10-10','2018-10-29','Working on issue NBPICREON-6','mohit pandey',1,2,'2019-01-04 11:33:19'),(1040,'NBPICREON','NBPICREON-6','253263','2018-10-10','2018-10-29','Working on issue NBPICREON-6','Preeti Bhatt',5,2,'2019-01-04 11:33:19'),(1041,'NBPICREON','NBPICREON-6','247754','2018-10-11','2018-10-16','Working on issue NBPICREON-6','shashi kant singh',7,2,'2019-01-04 11:33:19'),(1042,'NBPICREON','NBPICREON-6','247920','2018-10-11','2018-10-15','Project data analysis for process improvement.','Shyam Sundar',7,2,'2019-01-04 11:33:19'),(1043,'NBPICREON','NBPICREON-6','248717','2018-10-11','2018-10-16','Working on issue NBPICREON-6','Puneet Parashar',8,2,'2019-01-04 11:33:19'),(1044,'NBPICREON','NBPICREON-6','250664','2018-10-11','2018-10-23','learning advanced javascript','ravi kumar',8,2,'2019-01-04 11:33:19'),(1045,'NBPICREON','NBPICREON-6','253234','2018-10-11','2018-10-29','Working on issue NBPICREON-6','mohit pandey',2,2,'2019-01-04 11:33:19'),(1046,'NBPICREON','NBPICREON-6','253268','2018-10-11','2018-10-29','Working on issue NBPICREON-6','Preeti Bhatt',3,2,'2019-01-04 11:33:19'),(1047,'NBPICREON','NBPICREON-6','247487','2018-10-12','2018-10-15','Testing Magrath USs: Â Â  Â Â Â MAG011-634\nÂ Â  Â Â Â MAG011-635\nÂ Â  Â Â Â MAG011-636\nÂ Â  Â Â Â MAG011-637\n','Sonika Bansal',4,2,'2019-01-04 11:33:20'),(1048,'NBPICREON','NBPICREON-6','247756','2018-10-12','2018-10-15','Working on issue NBPICREON-6','shashi kant singh',4,2,'2019-01-04 11:33:20'),(1049,'NBPICREON','NBPICREON-6','247922','2018-10-12','2018-10-15','Project data analysis for process improvement.','Shyam Sundar',7,2,'2019-01-04 11:33:20'),(1050,'NBPICREON','NBPICREON-7','254937','2018-10-12','2018-11-01','Working on issue NBPICREON-7','PriyaranjanPaikray',2,2,'2019-01-04 11:33:20'),(1051,'NBPICREON','NBPICREON-7','248683','2018-10-15','2018-10-16','Working on issue NBPICREON-7','Rimi Bhagat',1,2,'2019-01-04 11:33:21'),(1052,'NBPICREON','NBPICREON-7','248735','2018-10-15','2018-10-16','Working on issue NBPICREON-7','Ankita Singh',1,2,'2019-01-04 11:33:21'),(1053,'NBPICREON','NBPICREON-7','250676','2018-10-16','2018-10-23','Left early from office, because going out of station. Cover hours in month.','Abhishek Singh',2,2,'2019-01-04 11:33:21'),(1054,'NBPICREON','NBPICREON-7','249417','2018-10-18','2018-10-18','leaving early today','neeraj_negi',2,2,'2019-01-04 11:33:21'),(1055,'NBPICREON','NBPICREON-7','249851','2018-10-18','2018-10-22','Working on issue NBPICREON-7','Ankur Bansal',2,2,'2019-01-04 11:33:22'),(1056,'NBPICREON','NBPICREON-7','251692','2018-10-22','2018-10-25','Urgent work at home','Hemant Tiwari',2,2,'2019-01-04 11:33:22'),(1057,'NBPICREON','NBPICREON-7','255210','2018-10-22','2018-11-01','Working on issue NBPICREON-7','Rinki',1,2,'2019-01-04 11:33:22'),(1058,'NBPICREON','NBPICREON-7','251457','2018-10-24','2018-10-24','Working on issue NBPICREON-7','PriyaranjanPaikray',2,2,'2019-01-04 11:33:22'),(1059,'NBPICREON','NBPICREON-7','251463','2018-10-24','2018-10-24','Working on issue NBPICREON-7','Preeti Bhatt',1,2,'2019-01-04 11:33:22'),(1060,'NBPICREON','NBPICREON-7','251907','2018-10-24','2018-10-25','Leave early due to medical emergency for my daughter. She is suffering from teeth pain.','Abhishek Singh',1,2,'2019-01-04 11:33:22'),(1061,'NBPICREON','NBPICREON-7','252154','2018-10-25','2018-10-26','Leave before 1 hr','Saurabh Kumar',1,2,'2019-01-04 11:33:22'),(1062,'NBPICREON','NBPICREON-7','254073','2018-10-30','2018-10-30','went to unitech to see the satus','Hemant Tiwari',2,2,'2019-01-04 11:33:22'),(1063,'NBPICREON','NBPICREON-7','254544','2018-10-30','2018-10-31','Working on issue NBPICREON-7','Rimi Bhagat',1,2,'2019-01-04 11:33:22'),(1064,'NBPICREON','NBPICREON-7','254625','2018-10-31','2018-10-31','Left office early feeling back pain.','Abhishek Singh',2,2,'2019-01-04 11:33:22'),(1065,'NBPICREON','NBPICREON-7','255506','2018-11-01','2018-11-02','Working on issue NBPICREON-7','Rimi Bhagat',1,2,'2019-01-04 11:33:22'),(1066,'NBPICREON','NBPICREON-7','255617','2018-11-02','2018-11-02','Came office late due to some personal work.','Abhishek Singh',1,2,'2019-01-04 11:33:22'),(1067,'NBPICREON','NBPICREON-7','255654','2018-11-02','2018-11-05','Working on issue NBPICREON-7','PriyaranjanPaikray',1,2,'2019-01-04 11:33:22'),(1068,'NBPICREON','NBPICREON-7','256290','2018-11-06','2018-11-06','Working on issue NBPICREON-7','PriyaranjanPaikray',2,2,'2019-01-04 11:33:22'),(1069,'NBPICREON','NBPICREON-7','257140','2018-11-06','2018-11-09','Leave early for festival reason.','Abhishek Singh',1,2,'2019-01-04 11:33:22'),(1070,'NBPICREON','NBPICREON-7','257627','2018-11-06','2018-11-12','Short Hrs.','Shishir Kumar',2,2,'2019-01-04 11:33:22'),(1071,'NBPICREON','NBPICREON-7','259034','2018-11-08','2018-11-14','Diwali handover','Hemant Tiwari',1,2,'2019-01-04 11:33:22'),(1072,'NBPICREON','NBPICREON-7','259070','2018-11-13','2018-11-14','Working on issue NBPICREON-7','PriyaranjanPaikray',1,2,'2019-01-04 11:33:22'),(1073,'NBPICREON','NBPICREON-7','259558','2018-11-14','2018-11-15','Working on issue NBPICREON-7','PriyaranjanPaikray',0,2,'2019-01-04 11:33:22'),(1074,'NBPICREON','NBPICREON-7','259720','2018-11-15','2018-11-15','Working on issue NBPICREON-7','PriyaranjanPaikray',1,2,'2019-01-04 11:33:22'),(1075,'NBPICREON','NBPICREON-7','260066','2018-11-16','2018-11-16','Working on issue NBPICREON-7','PriyaranjanPaikray',1,2,'2019-01-04 11:33:22'),(1076,'NBPICREON','NBPICREON-7','261405','2018-11-20','2018-11-21','Working on issue NBPICREON-7','Rimi Bhagat',1,2,'2019-01-04 11:33:22'),(1077,'NBPICREON','NBPICREON-7','262076','2018-11-20','2018-11-22','Leave from office little early for some personal reasons.','Abhishek Singh',2,2,'2019-01-04 11:33:22'),(1078,'NBPICREON','NBPICREON-7','261607','2018-11-21','2018-11-21','Working on issue NBPICREON-7','PriyaranjanPaikray',1,2,'2019-01-04 11:33:22'),(1079,'NBPICREON','NBPICREON-7','261933','2018-11-22','2018-11-22','leave from office early ','Vinay Kumar',1,2,'2019-01-04 11:33:22'),(1080,'NBPICREON','NBPICREON-7','262889','2018-11-26','2018-11-26','Due to heavy traffic','Pawan Tiwari',2,2,'2019-01-04 11:33:23'),(1081,'NBPICREON','NBPICREON-7','264697','2018-11-30','2018-11-30','Working on issue NBPICREON-7','Preeti Bhatt',2,2,'2019-01-04 11:33:23'),(1082,'NBPICREON','NBPICREON-7','265311','2018-11-30','2018-12-03','Working on issue NBPICREON-7','PriyaranjanPaikray',1,2,'2019-01-04 11:33:23'),(1083,'NBPICREON','NBPICREON-7','269852','2018-12-13','2018-12-17','Working on issue NBPICREON-7','PriyaranjanPaikray',2,2,'2019-01-04 11:33:23'),(1084,'NBPICREON','NBPICREON-7','270616','2018-12-14','2018-12-18','Join office delayed by 2 hrs','Saurabh Kumar',2,2,'2019-01-04 11:33:23'),(1085,'NBPICREON','NBPICREON-7','270660','2018-12-18','2018-12-18','Working on issue NBPICREON-7','Rimi Bhagat',1,2,'2019-01-04 11:33:23'),(1086,'NBPICREON','NBPICREON-7','274014','2018-12-21','2018-12-28','Left early due to personal work','Gaurav Upreti',1,2,'2019-01-04 11:33:23'),(1087,'NBPICREON','NBPICREON-7','274960','2018-12-24','2018-12-31','Working on issue NBPICREON-7','sumit',4,2,'2019-01-04 11:33:23'),(1088,'NBPICREON','NBPICREON-7','273900','2018-12-25','2018-12-28','Christmas Holiday ','Alankar Srivastava',8,2,'2019-01-04 11:33:23'),(1089,'NBPICREON','NBPICREON-7','274067','2018-12-27','2018-12-28','Working on issue NBPICREON-7','Rimi Bhagat',1,2,'2019-01-04 11:33:23'),(1090,'NBPICREON','NBPICREON-7','274293','2018-12-28','2018-12-28','Early leave from office','Vinay Kumar',2,2,'2019-01-04 11:33:23'),(1091,'NBPICREON','NBPICREON-7','275005','2018-12-31','2018-12-31','Leave early for new year celebrations.','Abhishek Singh',1,2,'2019-01-04 11:33:23'),(1092,'NBPICREON','NBPICREON-8','247705','2018-10-11','2018-10-15','Looked into SCM-10634.','Tilak',8,2,'2019-01-04 11:33:24'),(1093,'NBPICREON','NBPICREON-8','247708','2018-10-11','2018-10-15','Looked into SCM-10634.','Tilak',8,2,'2019-01-04 11:33:25'),(1094,'NBPICREON','NBPICREON-8','259876','2018-11-01','2018-11-16','Timesheet compliance training in Sec-2','KETAN SETHI',4,2,'2019-01-04 11:33:26'),(1095,'NBPICREON','NBPICREON-8','259900','2018-11-12','2018-11-16','Work travel to VFS visa center for Visa process','KETAN SETHI',4,2,'2019-01-04 11:33:26'),(1096,'NBPICREON','NBPICREON-8','261009','2018-11-19','2018-11-20','Travelling from Noida to Pune.','PriyaranjanPaikray',8,2,'2019-01-04 11:33:26'),(1097,'NBPICREON','NBPICREON-8','272506','2018-11-19','2018-12-24','Travelling back to India','Kinshuk Marttand',8,2,'2019-01-04 11:33:26'),(1098,'NBPICREON','NBPICREON-8','265310','2018-11-29','2018-12-03','Working on issue NBPICREON-8','PriyaranjanPaikray',8,2,'2019-01-04 11:33:26'),(1099,'NBPICREON','NBPICREON-8','265360','2018-11-29','2018-12-03','ShortsTV TataSky launch event ','Ankur Bansal',4,2,'2019-01-04 11:33:26'),(1100,'NBPICREON','NBPICREON-8','267625','2018-12-05','2018-12-10','Working on issue NBPICREON-8','PriyaranjanPaikray',6,2,'2019-01-04 11:33:26'),(1101,'NBPICREON','NBPICREON-8','268126','2018-12-10','2018-12-11','Meeting for Sitecompli project in sector 62','Akanksha Raghav',4,2,'2019-01-04 11:33:26'),(1102,'NBPICREON','NBPICREON-8','269024','2018-12-10','2018-12-13','Travelling from DC to New Delhi','Gaurav Upreti',8,2,'2019-01-04 11:33:26'),(1103,'NBPICREON','NBPICREON-8','269880','2018-12-14','2018-12-17','In transit from UK to India','Shantakaram',8,2,'2019-01-04 11:33:26'),(1104,'NBPICREON','NBPICREON-8','272317','2018-12-21','2018-12-24','Travel for interview drive','Kinshuk Marttand',3,2,'2019-01-04 11:33:26'),(1105,'NBPICREON','NBPICREON-9','254685','2018-10-01','2018-10-31','Reviewed the DOROT Project details and project specification. Reviewed the user stories and drupal 8 architecture with team.','Manish Parashar',8,2,'2019-01-04 11:33:27'),(1106,'NBPICREON','NBPICREON-9','246372','2018-10-10','2018-10-10','R&D','Suman Roy',10,2,'2019-01-04 11:33:28'),(1107,'NBPICREON','NBPICREON-9','253581','2018-10-10','2018-10-30','For email estimation RND','Rimi Bhagat',1,2,'2019-01-04 11:33:28'),(1108,'NBPICREON','NBPICREON-9','256107','2018-10-11','2018-11-05','Working on issue NBPICREON-9','Anoop Kumar',5,2,'2019-01-04 11:33:28'),(1109,'NBPICREON','NBPICREON-9','253666','2018-10-12','2018-10-30','Working on issue NBPICREON-9','Rimi Bhagat',1,2,'2019-01-04 11:33:28'),(1110,'NBPICREON','NBPICREON-9','251864','2018-10-15','2018-10-25','Updated build release version 1.0.0 (1.0.5) in hockey app after adding Tom UDID','Vinay Kumar',2,2,'2019-01-04 11:33:28'),(1111,'NBPICREON','NBPICREON-9','248693','2018-10-16','2018-10-16','Working on issue NBPICREON-9','Rimi Bhagat',4,2,'2019-01-04 11:33:28'),(1112,'NBPICREON','NBPICREON-9','255130','2018-10-16','2018-11-01','Half day','Megha Agarwal',4,2,'2019-01-04 11:33:28'),(1113,'NBPICREON','NBPICREON-9','249214','2018-10-17','2018-10-17','Searched the Google Address API implementation with Drupal pages and created Google Cloud a/c and generated an API key and paid 50 Rs to enable the Free account.','Manish Parashar',1,2,'2019-01-04 11:33:28'),(1114,'NBPICREON','NBPICREON-9','249524','2018-10-18','2018-10-18','Working on issue NBPICREON-9','Rasik Awasthi',4,2,'2019-01-04 11:33:29'),(1115,'NBPICREON','NBPICREON-9','250004','2018-10-22','2018-10-22','XpressSpa iOS: Updated build release version 1.0.0 (1.0.6) in hockey app after adding client UDID and 1 bugs fixes for date issue on dashboard.','Vinay Kumar',2,2,'2019-01-04 11:33:29'),(1116,'NBPICREON','NBPICREON-9','250486','2018-10-22','2018-10-23','Working on issue NBPICREON-9','Rasik Awasthi',5,2,'2019-01-04 11:33:29'),(1117,'NBPICREON','NBPICREON-9','250935','2018-10-23','2018-10-23','Doing R&D to open old app codebase in Xcode 10 on new macOS Mojave','Pramod K Singh',4,2,'2019-01-04 11:33:29'),(1118,'NBPICREON','NBPICREON-9','251420','2018-10-23','2018-10-24','PCHP (6h development, 2h Setup application on Frontend developer\'s system)','Rasik Awasthi',8,2,'2019-01-04 11:33:29'),(1119,'NBPICREON','NBPICREON-9','251758','2018-10-24','2018-10-25','PCHP, setting up server and development','Rasik Awasthi',4,2,'2019-01-04 11:33:29'),(1120,'NBPICREON','NBPICREON-9','252102','2018-10-24','2018-11-01','SP optimization','Megha Agarwal',5,2,'2019-01-04 11:33:29'),(1121,'NBPICREON','NBPICREON-9','252351','2018-10-24','2018-10-26','Worked POC','Alankar Srivastava',4,2,'2019-01-04 11:33:29'),(1122,'NBPICREON','NBPICREON-9','252370','2018-10-24','2018-10-26','Working on xls reading and converting specific format for duration into minute for Girish','Pramod K Singh',6,2,'2019-01-04 11:33:29'),(1123,'NBPICREON','NBPICREON-9','252104','2018-10-25','2018-10-26','sp optimization','Megha Agarwal',4,2,'2019-01-04 11:33:29'),(1124,'NBPICREON','NBPICREON-9','252352','2018-10-25','2018-10-26','Worked POC','Alankar Srivastava',4,2,'2019-01-04 11:33:29'),(1125,'NBPICREON','NBPICREON-9','252219','2018-10-26','2018-10-26','PCHP Power BI','Rasik Awasthi',2,2,'2019-01-04 11:33:29'),(1126,'NBPICREON','NBPICREON-9','252364','2018-10-26','2018-10-26','Check code for net texts to collie in xcode 10 and team discussion','Pramod K Singh',4,2,'2019-01-04 11:33:29'),(1127,'NBPICREON','NBPICREON-9','252661','2018-10-26','2018-10-29','PCHP: PBI report rest APIS ','neeraj_negi',4,2,'2019-01-04 11:33:29'),(1128,'NBPICREON','NBPICREON-9','252762','2018-10-26','2018-11-12','migration performance issue.','Megha Agarwal',4,2,'2019-01-04 11:33:29'),(1129,'NBPICREON','NBPICREON-9','254338','2018-10-29','2018-11-12','R & D and implementation onDB optimization ','Megha Agarwal',4,2,'2019-01-04 11:33:29'),(1130,'NBPICREON','NBPICREON-9','254839','2018-10-29','2018-11-01','RnD on PowerBI for Multi page report.','Alankar Srivastava',2,2,'2019-01-04 11:33:29'),(1131,'NBPICREON','NBPICREON-9','256062','2018-10-29','2018-11-05','Working on issue NBPICREON-9','Anoop Kumar',3,2,'2019-01-04 11:33:29'),(1132,'NBPICREON','NBPICREON-9','254331','2018-10-30','2018-10-31','worked on BI reports data and anaysis .','Megha Agarwal',4,2,'2019-01-04 11:33:29'),(1133,'NBPICREON','NBPICREON-9','256063','2018-10-30','2018-11-05','Working on issue NBPICREON-9','Anoop Kumar',2,2,'2019-01-04 11:33:29'),(1134,'NBPICREON','NBPICREON-9','254913','2018-10-31','2018-11-12',' db optimization.','Megha Agarwal',4,2,'2019-01-04 11:33:30'),(1135,'NBPICREON','NBPICREON-9','256066','2018-10-31','2018-11-05','Working on issue NBPICREON-9','Anoop Kumar',4,2,'2019-01-04 11:33:30'),(1136,'NBPICREON','NBPICREON-9','255439','2018-11-01','2018-11-02','Working on issue NBPICREON-9','Rasik Awasthi',3,2,'2019-01-04 11:33:30'),(1137,'NBPICREON','NBPICREON-9','265402','2018-11-01','2018-12-03','R and D on graph API integration with mutiple user upload.','Megha Agarwal',4,2,'2019-01-04 11:33:30'),(1138,'NBPICREON','NBPICREON-9','255569','2018-11-02','2018-11-02','Winston Candy Box and slider','sumit',8,2,'2019-01-04 11:33:30'),(1139,'NBPICREON','NBPICREON-9','255858','2018-11-02','2018-11-05','Discuss with team on Data Analysis border/ top level. ','Alankar Srivastava',0,2,'2019-01-04 11:33:30'),(1140,'NBPICREON','NBPICREON-9','256288','2018-11-02','2018-11-06','Searched the Drupal Ajax module call with multiple options and parametered and apply researched the implementation way in Drupal 8','Manish Parashar',3,2,'2019-01-04 11:33:30'),(1141,'NBPICREON','NBPICREON-9','257489','2018-11-02','2018-11-12','R and D on onedrive upload system.','Megha Agarwal',4,2,'2019-01-04 11:33:30'),(1142,'NBPICREON','NBPICREON-9','257485','2018-11-05','2018-11-12','R and D on onedrive upload system.','Megha Agarwal',4,2,'2019-01-04 11:33:30'),(1143,'NBPICREON','NBPICREON-9','257487','2018-11-06','2018-11-12','Working on issue NBPICREON-9','Megha Agarwal',8,2,'2019-01-04 11:33:30'),(1144,'NBPICREON','NBPICREON-9','257603','2018-11-06','2018-11-12','Search and worked into the Ajax call implementation with Drupal 8','Manish Parashar',4,2,'2019-01-04 11:33:30'),(1145,'NBPICREON','NBPICREON-9','257479','2018-11-08','2018-11-12','Worked on Database query Optimization','Megha Agarwal',4,2,'2019-01-04 11:33:30'),(1146,'NBPICREON','NBPICREON-9','258683','2018-11-08','2018-11-13','Reviewed the Drupal 8 API call with Ajax & passing the arguments from the User object.','Manish Parashar',3,2,'2019-01-04 11:33:30'),(1147,'NBPICREON','NBPICREON-9','257488','2018-11-09','2018-11-12','Working on issue NBPICREON-9','Megha Agarwal',8,2,'2019-01-04 11:33:30'),(1148,'NBPICREON','NBPICREON-9','259450','2018-11-12','2018-11-15','Find the date and time format solution for the Salesforce api and change into the drupal template','Manish Parashar',3,2,'2019-01-04 11:33:30'),(1149,'NBPICREON','NBPICREON-9','259510','2018-11-12','2018-11-15','R and D: on graph API for consent screen through global admin.','Megha Agarwal',6,2,'2019-01-04 11:33:30'),(1150,'NBPICREON','NBPICREON-9','259506','2018-11-13','2018-11-15','One drive upload functionaly with multiple user.','Megha Agarwal',6,2,'2019-01-04 11:33:30'),(1151,'NBPICREON','NBPICREON-9','259500','2018-11-14','2018-11-15','R and D .. performance issue in angular related to bundle js.','Megha Agarwal',6,2,'2019-01-04 11:33:30'),(1152,'NBPICREON','NBPICREON-9','260743','2018-11-15','2018-11-19','application performance tool for js optimization','Megha Agarwal',6,2,'2019-01-04 11:33:30'),(1153,'NBPICREON','NBPICREON-9','260759','2018-11-15','2018-11-19','Reviewed the timezone requirement in Dorot API response, research the timezone format for Newyork & converting into the required format for DOROTVP.','Manish Parashar',3,2,'2019-01-04 11:33:31'),(1154,'NBPICREON','NBPICREON-9','260744','2018-11-16','2018-11-19','application performance tool for js optimization','Megha Agarwal',6,2,'2019-01-04 11:33:31');
/*!40000 ALTER TABLE `tbl_worklogs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'icreonworklogs'
--
/*!50003 DROP PROCEDURE IF EXISTS `authenticate_user` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `authenticate_user`(
IN p_username varchar(100),
IN p_password varchar(400)

 )
BEGIN
   SELECT userid,username,password,name from tbl_userdtl where username=p_username AND password=p_password;
     END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `pro_approveAll` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `pro_approveAll`(IN p_worklog_id varchar(30))
BEGIN
   update tbl_worklogs set status=1 where worklog_id=p_worklog_id;
     END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `pro_getAllWorklogs` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `pro_getAllWorklogs`()
BEGIN
   Select project_id,issue_id,worklog_id,start_date,description,author,time_spent,status,date_created from tbl_worklogs;
     END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `pro_getApprovedWorklogs` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `pro_getApprovedWorklogs`()
BEGIN
   Select project_id,issue_id,worklog_id,start_date,description,author,time_spent,status,date_created from tbl_worklogs where status=1;
     END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `pro_getAuthors` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `pro_getAuthors`(IN p_issue_id varchar(50))
BEGIN
   Select distinct author FROM tbl_worklogs where issue_id=p_issue_id;
     END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `pro_getLastSevenDaysWorklogs` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `pro_getLastSevenDaysWorklogs`()
BEGIN
   Select project_id,issue_id,worklog_id,start_date,description,author,time_spent,status,date_created from tbl_worklogs where
    start_date>=(CURDATE() - INTERVAL 7 DAY) and start_date<=curdate();
     END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `pro_getRejectedWorklogs` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `pro_getRejectedWorklogs`()
BEGIN
   Select project_id,issue_id,worklog_id,start_date,description,author,time_spent,status,date_created from tbl_worklogs where status=0;
     END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `pro_getUnApprovedWorklogs` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `pro_getUnApprovedWorklogs`()
BEGIN
   Select project_id,issue_id,worklog_id,start_date,description,author,time_spent,status,date_created from tbl_worklogs where status=2;
     END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `pro_getWorklogs_wrt_all` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `pro_getWorklogs_wrt_all`(
IN p_issue_id varchar(50),
IN p_author varchar(50),
IN p_from_date varchar(20),
IN p_to_date varchar(20)
 )
BEGIN
   Select project_id,issue_id,worklog_id,start_date,description,author,time_spent,status,date_created from tbl_worklogs 
   where issue_id=p_issue_id and start_date >=STR_TO_DATE(p_from_date,'%Y-%m-%d') and start_date <= STR_TO_DATE(p_to_date,'%Y-%m-%d') and author=p_author;
     END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `pro_getWorklogs_wrt_all_and_status` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `pro_getWorklogs_wrt_all_and_status`(
IN p_issue_id varchar(50),
IN p_author varchar(50),
IN p_from_date varchar(20),
IN p_to_date varchar(20),
IN p_status int(2)
 )
BEGIN
   Select project_id,issue_id,worklog_id,start_date,description,author,time_spent,status,date_created from tbl_worklogs 
   where issue_id=p_issue_id and start_date >=STR_TO_DATE(p_from_date,'%Y-%m-%d') and start_date <= STR_TO_DATE(p_to_date,'%Y-%m-%d') and author=p_author 
   and status=p_status;
     END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `pro_getWorklogs_wrt_date` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `pro_getWorklogs_wrt_date`(
IN p_from_date date,
IN p_to_date date
 )
BEGIN
   Select project_id,issue_id,worklog_id,start_date,description,author,time_spent,status,date_created from tbl_worklogs
   where start_date>=STR_TO_DATE(p_from_date,'%Y-%m-%d') and start_date<=STR_TO_DATE(p_to_date,'%Y-%m-%d');
     END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `pro_getWorklogs_wrt_issue_ID` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `pro_getWorklogs_wrt_issue_ID`(
IN p_issue_id varchar(50)
 )
BEGIN
   Select project_id,issue_id,worklog_id,start_date,description,author,time_spent,status,date_created from tbl_worklogs
   where issue_id=p_issue_id;
     END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `pro_getWorklogs_wrt_issue_user` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`admin`@`%` PROCEDURE `pro_getWorklogs_wrt_issue_user`(
 IN p_issue_id varchar(50),
IN p_author varchar(50)
 )
BEGIN
   Select project_id,issue_id,worklog_id,start_date,description,author,time_spent,status,date_created from tbl_worklogs
   where issue_id=p_issue_id and author=p_author;
     END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `pro_getWorklogs_wrt_user` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `pro_getWorklogs_wrt_user`(
IN p_author varchar(50)
 )
BEGIN
   Select project_id,issue_id,worklog_id,start_date,description,author,time_spent,status,date_created from tbl_worklogs
   where author=p_author;
     END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `pro_setWorklogs` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `pro_setWorklogs`(
IN p_project_id varchar(50),
IN p_issue_id varchar(50),
IN p_worklog_id varchar(50),
IN p_start_date date,
IN p_description varchar(2000),
IN p_author varchar(50),
IN p_time_spent int(10),
IN p_status int(2),
IN p_updated_date date
 )
BEGIN
   INSERT into tbl_worklogs(project_id,issue_id,worklog_id,start_date,description,author,time_spent,status,updated_date,date_created) 
   values(p_project_id,p_issue_id,p_worklog_id,STR_TO_DATE(p_start_date,'%Y-%m-%d'),p_description,p_author,p_time_spent,p_status,str_to_date(p_updated_date,'%Y-%m-%d'),now());
   END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `pro_setWorklogs_aprove_status` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `pro_setWorklogs_aprove_status`(
IN p_project_id varchar(100),
IN p_issue_id varchar(50),
IN p_worklog_id varchar(50)
)
BEGIN
   update tbl_worklogs set status=1 where worklog_id=p_worklog_id;
   END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `pro_setWorklogs_rejected_to_aprove_status` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `pro_setWorklogs_rejected_to_aprove_status`(
IN p_project_id varchar(100),
IN p_issue_id varchar(50),
IN p_worklog_id varchar(50)
)
BEGIN
   update tbl_worklogs set status=1 where worklog_id=p_worklog_id and status=0;
   END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `pro_setWorklogs_reject_status` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `pro_setWorklogs_reject_status`(
IN p_project_id varchar(100),
IN p_issue_id varchar(50),
IN p_worklog_id varchar(50)
)
BEGIN
   update tbl_worklogs set status=0 where worklog_id=p_worklog_id;
   END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `pro_set_worklogs` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `pro_set_worklogs`(
IN p_project_id varchar(50),
IN p_issue_id varchar(50),
IN p_worklog_id varchar(50),
IN p_start_date date,
IN p_description varchar(500),
IN p_author varchar(50),
IN p_time_spent int(10),
IN p_status int(2)
 )
BEGIN
   INSERT into tbl_worklogs(project_id,issue_id,worklog_id,start_date,description,author,time_spent,status,date_created) 
   values(p_project_id,p_issue_id,p_worklog_id,p_start_date,p_description,p_author,p_time_spent,p_status,now());
   END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `tbl_issues_1` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `tbl_issues_1`()
BEGIN
   SELECT *  FROM tbl_issues;
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

-- Dump completed on 2019-01-04 15:27:06
