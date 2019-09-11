-- MySQL dump 10.13  Distrib 8.0.16, for osx10.14 (x86_64)
--
-- Host: localhost    Database: ihome
-- ------------------------------------------------------
-- Server version	8.0.16

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8mb4 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `alembic_version`
--

DROP TABLE IF EXISTS `alembic_version`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `alembic_version` (
  `version_num` varchar(32) NOT NULL,
  PRIMARY KEY (`version_num`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alembic_version`
--

LOCK TABLES `alembic_version` WRITE;
/*!40000 ALTER TABLE `alembic_version` DISABLE KEYS */;
INSERT INTO `alembic_version` VALUES ('715eef6940a4');
/*!40000 ALTER TABLE `alembic_version` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ih_area_info`
--

DROP TABLE IF EXISTS `ih_area_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `ih_area_info` (
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ih_area_info`
--

LOCK TABLES `ih_area_info` WRITE;
/*!40000 ALTER TABLE `ih_area_info` DISABLE KEYS */;
INSERT INTO `ih_area_info` VALUES (NULL,NULL,1,'东城区'),(NULL,NULL,2,'西城区'),(NULL,NULL,3,'朝阳区'),(NULL,NULL,4,'海淀区'),(NULL,NULL,5,'昌平区'),(NULL,NULL,6,'丰台区'),(NULL,NULL,7,'房山区'),(NULL,NULL,8,'通州区'),(NULL,NULL,9,'顺义区'),(NULL,NULL,10,'大兴区'),(NULL,NULL,11,'怀柔区'),(NULL,NULL,12,'平谷区'),(NULL,NULL,13,'密云区'),(NULL,NULL,14,'延庆区'),(NULL,NULL,15,'石景山区');
/*!40000 ALTER TABLE `ih_area_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ih_facility_info`
--

DROP TABLE IF EXISTS `ih_facility_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `ih_facility_info` (
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ih_facility_info`
--

LOCK TABLES `ih_facility_info` WRITE;
/*!40000 ALTER TABLE `ih_facility_info` DISABLE KEYS */;
INSERT INTO `ih_facility_info` VALUES (NULL,NULL,1,'无线网络'),(NULL,NULL,2,'热水淋浴'),(NULL,NULL,3,'空调'),(NULL,NULL,4,'暖气'),(NULL,NULL,5,'允许吸烟'),(NULL,NULL,6,'饮水设备'),(NULL,NULL,7,'牙具'),(NULL,NULL,8,'香皂'),(NULL,NULL,9,'拖鞋'),(NULL,NULL,10,'手纸'),(NULL,NULL,11,'毛巾'),(NULL,NULL,12,'沐浴露、洗发露'),(NULL,NULL,13,'冰箱'),(NULL,NULL,14,'洗衣机'),(NULL,NULL,15,'电梯'),(NULL,NULL,16,'允许做饭'),(NULL,NULL,17,'允许带宠物'),(NULL,NULL,18,'允许聚会'),(NULL,NULL,19,'门禁系统'),(NULL,NULL,20,'停车位'),(NULL,NULL,21,'有线网络'),(NULL,NULL,22,'电视'),(NULL,NULL,23,'浴缸');
/*!40000 ALTER TABLE `ih_facility_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ih_house_facility`
--

DROP TABLE IF EXISTS `ih_house_facility`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `ih_house_facility` (
  `house_id` int(11) NOT NULL,
  `facility_id` int(11) NOT NULL,
  PRIMARY KEY (`house_id`,`facility_id`),
  KEY `facility_id` (`facility_id`),
  CONSTRAINT `ih_house_facility_ibfk_1` FOREIGN KEY (`facility_id`) REFERENCES `ih_facility_info` (`id`),
  CONSTRAINT `ih_house_facility_ibfk_2` FOREIGN KEY (`house_id`) REFERENCES `ih_house_info` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ih_house_facility`
--

LOCK TABLES `ih_house_facility` WRITE;
/*!40000 ALTER TABLE `ih_house_facility` DISABLE KEYS */;
INSERT INTO `ih_house_facility` VALUES (1,1),(2,1),(3,1),(4,1),(5,1),(6,1),(7,1),(1,2),(4,2),(7,2),(1,3),(2,3),(4,3),(1,4),(7,4),(7,5),(1,6),(4,6),(1,7),(4,7),(4,8),(7,8),(1,9),(3,9),(1,10),(7,10),(1,11),(6,11),(7,11),(1,12),(2,12),(3,12),(4,12),(6,12),(7,12),(3,13),(6,13),(7,13),(3,14),(6,14),(6,15),(3,16),(6,16),(7,16),(4,17),(7,17),(4,18),(5,18),(1,19),(3,19),(3,20),(5,20),(3,21),(5,21),(2,22),(5,22),(2,23),(5,23);
/*!40000 ALTER TABLE `ih_house_facility` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ih_house_image`
--

DROP TABLE IF EXISTS `ih_house_image`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `ih_house_image` (
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `house_id` int(11) NOT NULL,
  `url` varchar(256) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `house_id` (`house_id`),
  CONSTRAINT `ih_house_image_ibfk_1` FOREIGN KEY (`house_id`) REFERENCES `ih_house_info` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ih_house_image`
--

LOCK TABLES `ih_house_image` WRITE;
/*!40000 ALTER TABLE `ih_house_image` DISABLE KEYS */;
INSERT INTO `ih_house_image` VALUES ('2019-07-18 11:58:46','2019-07-18 11:58:46',1,5,'Fifui6Qt3bg7-eVKZPUonEy9WmrF'),('2019-07-18 11:58:58','2019-07-18 11:58:58',2,5,'FtK757045mYAs7-00vsrtEuQ1Vh2'),('2019-07-18 11:59:16','2019-07-18 11:59:16',3,5,'Fr9l__80W7LSXrYwVU4UXMD8xlnM'),('2019-07-18 14:17:27','2019-07-18 14:17:27',5,6,'Fr9l__80W7LSXrYwVU4UXMD8xlnM'),('2019-07-18 14:17:37','2019-07-18 14:17:37',6,6,'FlXy9U2guyn50aXwBkpeKEUd7lD5'),('2019-07-18 14:17:50','2019-07-18 14:17:50',7,6,'FlWbJZeKYKPjQ1r_MbwhDUGThpBY'),('2019-07-18 18:15:31','2019-07-18 18:15:31',8,7,'FsmepVdz8qLOeHLHNoKuIsxba_Jg'),('2019-07-18 18:15:38','2019-07-18 18:15:38',9,7,'FuiBFGjB_68HmFIy1IdYMzngfAvI'),('2019-07-18 18:15:46','2019-07-18 18:15:46',10,7,'FplP4rP1B0HYCkaD-DBV_7ZhNVMZ');
/*!40000 ALTER TABLE `ih_house_image` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ih_house_info`
--

DROP TABLE IF EXISTS `ih_house_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `ih_house_info` (
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `area_id` int(11) NOT NULL,
  `title` varchar(64) NOT NULL,
  `price` int(11) DEFAULT NULL,
  `address` varchar(512) DEFAULT NULL,
  `room_count` int(11) DEFAULT NULL,
  `acreage` int(11) DEFAULT NULL,
  `unit` varchar(32) DEFAULT NULL,
  `capacity` int(11) DEFAULT NULL,
  `beds` varchar(64) DEFAULT NULL,
  `deposit` int(11) DEFAULT NULL,
  `min_days` int(11) DEFAULT NULL,
  `max_days` int(11) DEFAULT NULL,
  `order_count` int(11) DEFAULT NULL,
  `index_image_url` varchar(256) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `area_id` (`area_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `ih_house_info_ibfk_1` FOREIGN KEY (`area_id`) REFERENCES `ih_area_info` (`id`),
  CONSTRAINT `ih_house_info_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `ih_user_profile` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ih_house_info`
--

LOCK TABLES `ih_house_info` WRITE;
/*!40000 ALTER TABLE `ih_house_info` DISABLE KEYS */;
INSERT INTO `ih_house_info` VALUES ('2019-07-17 14:26:10','2019-07-17 14:26:10',1,2,2,'哈哈哈',1200000,'哈时候杀和飞沙令问了问',3,45,'三室两厅两卫',3,'双人床',3422200,15,0,0,'Fr9l__80W7LSXrYwVU4UXMD8xlnM'),('2019-07-17 14:30:43','2019-07-17 14:30:43',2,2,5,'test',2312300,'desrwrwr',12,212,'三室两厅两卫',12,'双人床',1200,121,0,0,'FtK757045mYAs7-00vsrtEuQ1Vh2'),('2019-07-17 14:37:48','2019-07-17 14:37:48',3,1,11,'testhhhhhhhh',231200,'收到货了问了问了',12,121,'好玩儿',123,'了我的海底捞',23100,12,0,0,'FtK757045mYAs7-00vsrtEuQ1Vh2'),('2019-07-17 15:06:38','2019-07-17 15:06:38',4,1,7,'电视台为反射率',121200,'咧3蓝色大海论文',32213,1212,'儿我二',12,'3412431',312300,12,0,0,'Fifui6Qt3bg7-eVKZPUonEy9WmrF'),('2019-07-18 11:58:35','2019-07-18 11:58:46',5,1,1,'new test',1200000,'哈哈哈test嗷嗷叫你看',12,12,'是打发士大夫',12,'safrawrqw',122200,10,30,0,'Fifui6Qt3bg7-eVKZPUonEy9WmrF'),('2019-07-18 14:17:10','2019-07-18 14:17:27',6,1,11,'sapdefish',38800,'水电费上海市',121,123,'的说法是',2,'格林沃尔',22200,222,0,0,'Fr9l__80W7LSXrYwVU4UXMD8xlnM'),('2019-07-18 18:15:14','2019-07-19 18:43:39',7,1,9,'哈哈哈',36600,'dfsfsf',232,23,'乐乐',12,'的哈时候杀',43400,12,3,1,'FsmepVdz8qLOeHLHNoKuIsxba_Jg');
/*!40000 ALTER TABLE `ih_house_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ih_order_info`
--

DROP TABLE IF EXISTS `ih_order_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `ih_order_info` (
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `house_id` int(11) NOT NULL,
  `begin_date` datetime NOT NULL,
  `end_date` datetime NOT NULL,
  `days` int(11) NOT NULL,
  `house_price` int(11) NOT NULL,
  `amount` int(11) NOT NULL,
  `status` enum('WAIT_ACCEPT','WAIT_PAYMENT','PAID','WAIT_COMMENT','COMPLETE','CANCELED','REJECTED') DEFAULT NULL,
  `comment` text,
  PRIMARY KEY (`id`),
  KEY `house_id` (`house_id`),
  KEY `user_id` (`user_id`),
  KEY `ix_ih_order_info_status` (`status`),
  CONSTRAINT `ih_order_info_ibfk_1` FOREIGN KEY (`house_id`) REFERENCES `ih_house_info` (`id`),
  CONSTRAINT `ih_order_info_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `ih_user_profile` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ih_order_info`
--

LOCK TABLES `ih_order_info` WRITE;
/*!40000 ALTER TABLE `ih_order_info` DISABLE KEYS */;
INSERT INTO `ih_order_info` VALUES ('2019-07-19 17:03:12','2019-07-19 18:21:49',1,3,7,'2019-07-19 00:00:00','2019-07-19 00:00:00',1,36600,36600,'REJECTED','test'),('2019-07-19 17:05:59','2019-07-19 18:21:39',2,3,7,'2019-07-24 00:00:00','2019-07-24 00:00:00',1,36600,36600,'WAIT_PAYMENT',NULL),('2019-07-19 17:10:20','2019-07-19 18:43:39',3,3,7,'2019-08-21 00:00:00','2019-08-21 00:00:00',1,36600,36600,'COMPLETE','好 非常好 is cool'),('2019-07-19 17:11:44','2019-07-19 18:21:54',4,3,6,'2019-07-24 00:00:00','2019-07-24 00:00:00',1,38800,38800,'WAIT_PAYMENT',NULL),('2019-07-19 17:35:54','2019-07-19 18:20:05',5,3,7,'2019-07-23 00:00:00','2019-07-23 00:00:00',1,36600,36600,'WAIT_PAYMENT',NULL);
/*!40000 ALTER TABLE `ih_order_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ih_user_profile`
--

DROP TABLE IF EXISTS `ih_user_profile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `ih_user_profile` (
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL,
  `password_hash` varchar(128) NOT NULL,
  `mobile` varchar(11) NOT NULL,
  `real_name` varchar(32) DEFAULT NULL,
  `id_card` varchar(20) DEFAULT NULL,
  `avatar_url` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mobile` (`mobile`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ih_user_profile`
--

LOCK TABLES `ih_user_profile` WRITE;
/*!40000 ALTER TABLE `ih_user_profile` DISABLE KEYS */;
INSERT INTO `ih_user_profile` VALUES ('2019-07-15 14:48:46','2019-07-18 14:20:09',1,'huangxingchen','pbkdf2:sha256:150000$fIbD2pej$2cc6532b86085c5270baca788f47e413e977d047fec830cd3f9e510573c44c58','15926359383','huangxingchen','421097199303216519','FtK757045mYAs7-00vsrtEuQ1Vh2'),('2019-07-15 14:52:47','2019-07-18 09:44:07',2,'Sherry','pbkdf2:sha256:150000$053ETPJk$177b4a44699d84e0633f673d7c53a0018897e8226a03d6c42d6aba9738878be3','18511111111','雪莉','3324327199503216239','FnoFdVRdBllGo4k6KzHYjkGkr6Y5'),('2019-07-19 14:30:35','2019-07-19 15:24:36',3,'黄喵喵大王','pbkdf2:sha256:150000$gYVuUDe9$ec55dacbb022c851a20f1d9497b0c4bf50309187fedc98f2cb72f400b27ca2e6','13265566951','黄喵喵','213565235876764','FplP4rP1B0HYCkaD-DBV_7ZhNVMZ');
/*!40000 ALTER TABLE `ih_user_profile` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-07-19 19:06:24
