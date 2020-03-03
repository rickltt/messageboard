-- MySQL dump 10.13  Distrib 8.0.17, for macos10.14 (x86_64)
--
-- Host: localhost    Database: blog
-- ------------------------------------------------------
-- Server version	5.7.27

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
-- Table structure for table `admin`
--

DROP TABLE IF EXISTS `admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admin` (
  `id` int(11) NOT NULL DEFAULT '1',
  `name` varchar(45) COLLATE utf8_bin DEFAULT '123',
  `password` varchar(45) COLLATE utf8_bin DEFAULT '123',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin`
--

LOCK TABLES `admin` WRITE;
/*!40000 ALTER TABLE `admin` DISABLE KEYS */;
INSERT INTO `admin` VALUES (1,'123','123');
/*!40000 ALTER TABLE `admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `logs`
--

DROP TABLE IF EXISTS `logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `logs` (
  `l_id` int(11) NOT NULL AUTO_INCREMENT,
  `log` varchar(255) DEFAULT NULL COMMENT '日志说明',
  `time` datetime DEFAULT NULL,
  PRIMARY KEY (`l_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COMMENT='日志表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `logs`
--

LOCK TABLES `logs` WRITE;
/*!40000 ALTER TABLE `logs` DISABLE KEYS */;
INSERT INTO `logs` VALUES (2,'3成功注册','2019-12-06 14:14:55'),(3,'9成功注册','2019-12-10 19:55:37'),(4,'玻璃心成功注册','2019-12-11 00:40:33');
/*!40000 ALTER TABLE `logs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `message`
--

DROP TABLE IF EXISTS `message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `message` (
  `m_id` int(11) NOT NULL AUTO_INCREMENT,
  `m_title` varchar(45) COLLATE utf8_bin DEFAULT NULL,
  `m_content` varchar(45) COLLATE utf8_bin DEFAULT NULL,
  `m_publishtime` datetime DEFAULT NULL,
  `fk_MB_id` int(11) NOT NULL,
  `fk_u_id` int(11) NOT NULL,
  PRIMARY KEY (`m_id`),
  KEY `fk_message_message_block1_idx` (`fk_MB_id`),
  KEY `fk_message_user1_idx` (`fk_u_id`),
  KEY `index_mbid_uid` (`fk_MB_id`,`fk_u_id`),
  CONSTRAINT `fk_message_message_block1` FOREIGN KEY (`fk_MB_id`) REFERENCES `message_block` (`MB_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_message_user1` FOREIGN KEY (`fk_u_id`) REFERENCES `user` (`u_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `message`
--

LOCK TABLES `message` WRITE;
/*!40000 ALTER TABLE `message` DISABLE KEYS */;
INSERT INTO `message` VALUES (2,'html制表符','table制表符','2019-11-20 00:00:00',2,1),(3,'早安','晚安','2019-11-20 00:00:00',2,2),(6,'html按钮标签','button标签','2019-11-20 00:00:00',2,1),(7,'Good','Good','2019-11-20 00:00:00',2,1),(12,'我爱你','爱你','2019-12-10 21:22:35',8,1),(14,'加油','考试加油喔！','2019-12-11 00:50:43',2,12),(15,'1','1','2019-12-17 03:33:44',2,1),(17,'python爬虫','python爬虫爬去淘宝，京东商品信息\r\n','2019-12-17 11:38:14',19,1),(18,'java软件架构','1、开闭原则\r\n2、依赖倒置原则','2019-12-17 11:39:53',18,1),(19,'java虚拟机是什么','1、抽象规范\r\n2、一个具体实现\r\n3、一个运行的虚拟机实例','2019-12-17 11:40:40',17,1),(20,'mysql安装配置','1、mysql的下载\r\n2、mysql的安装','2019-12-17 11:41:53',15,1),(21,'一线城市高','比如北上广深','2019-12-17 11:42:34',16,1),(22,'二线城市','大部分二线城市也有1w+的工资','2019-12-17 11:42:57',16,1),(23,'python字符串','strip和rstrip和lstrip讲解','2019-12-17 11:44:40',19,1),(24,'python列表','python列表重塑','2019-12-17 11:45:10',19,1),(25,'python深度学习','搭建卷积神经网络','2019-12-17 11:45:42',19,1),(26,'python','一点都不难！','2019-12-23 00:18:37',19,12);
/*!40000 ALTER TABLE `message` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `message_block`
--

DROP TABLE IF EXISTS `message_block`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `message_block` (
  `MB_id` int(11) NOT NULL AUTO_INCREMENT,
  `MB_name` varchar(45) COLLATE utf8_bin DEFAULT NULL,
  `MB_time` datetime DEFAULT NULL,
  `fk_u_id` int(11) NOT NULL,
  PRIMARY KEY (`MB_id`),
  UNIQUE KEY `MB_name_UNIQUE` (`MB_name`),
  KEY `fk_message_block_user1_idx` (`fk_u_id`),
  CONSTRAINT `fk_message_block_user1` FOREIGN KEY (`fk_u_id`) REFERENCES `user` (`u_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `message_block`
--

LOCK TABLES `message_block` WRITE;
/*!40000 ALTER TABLE `message_block` DISABLE KEYS */;
INSERT INTO `message_block` VALUES (2,'html讲解','2019-11-20 19:20:33',1),(8,'正门新开了一家奶茶店','2019-12-10 19:29:50',2),(14,'jsp讲解','2019-12-11 15:20:07',1),(15,'数据库','2019-12-11 15:20:22',1),(16,'软件开发真的是工资高吗？','2019-11-20 21:20:33',1),(17,'Java虚拟机讲解','2019-12-11 21:20:07',2),(18,'java基础','2019-12-13 21:52:10',1),(19,'python基础','2019-12-13 21:52:31',1);
/*!40000 ALTER TABLE `message_block` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reply`
--

DROP TABLE IF EXISTS `reply`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reply` (
  `r_id` int(11) NOT NULL AUTO_INCREMENT,
  `r_title` varchar(45) COLLATE utf8_bin DEFAULT NULL,
  `r_content` varchar(45) COLLATE utf8_bin DEFAULT NULL,
  `r_time` datetime DEFAULT NULL,
  `fk_MB_id` int(11) NOT NULL,
  `fk_u_id` int(11) NOT NULL,
  `fk_m_id` int(11) NOT NULL,
  PRIMARY KEY (`r_id`,`fk_m_id`),
  KEY `fk_table1_message_block1_idx` (`fk_MB_id`),
  KEY `fk_table1_user1_idx` (`fk_u_id`),
  KEY `fk_table1_message1_idx` (`fk_m_id`),
  KEY `index_uid` (`fk_u_id`),
  CONSTRAINT `fk_table1_message1` FOREIGN KEY (`fk_m_id`) REFERENCES `message` (`m_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_table1_message_block1` FOREIGN KEY (`fk_MB_id`) REFERENCES `message_block` (`MB_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_table1_user1` FOREIGN KEY (`fk_u_id`) REFERENCES `user` (`u_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reply`
--

LOCK TABLES `reply` WRITE;
/*!40000 ALTER TABLE `reply` DISABLE KEYS */;
INSERT INTO `reply` VALUES (1,'吃了','麻辣烫','2019-11-22 00:00:00',2,1,2),(2,'嗯','嗯','2019-11-22 00:00:00',2,2,3),(3,'Ok','没问题','2019-11-20 01:02:00',2,1,3),(4,'ok','没问题','2019-11-20 00:00:00',2,1,2),(6,'加油','加油','2019-12-02 00:00:00',2,1,3),(7,'2','2','2019-12-03 00:00:00',2,1,2),(10,'me','也是','2019-12-10 21:22:44',8,1,12),(11,'早餐','我今早吃了包子和豆浆','2019-12-11 00:54:15',2,12,2),(12,'早上好','吃了吗','2019-12-13 14:49:53',2,1,2),(13,'2','2','2019-12-13 14:51:25',2,1,2),(14,'1','1','2019-12-17 03:31:45',2,1,2),(15,'1','1','2019-12-17 03:32:07',2,1,2),(16,'12','12','2019-12-17 03:56:24',2,1,3),(17,'求源码！','楼主可以发个源码到我邮箱吗','2019-12-17 11:43:48',19,1,17),(18,'楼主','求源码！！','2019-12-17 11:46:06',19,1,23),(19,'卷积神经','楼主可以去看看keras的书。','2019-12-23 00:20:11',19,12,25);
/*!40000 ALTER TABLE `reply` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `u_id` int(11) NOT NULL AUTO_INCREMENT,
  `u_name` varchar(45) COLLATE utf8_bin NOT NULL,
  `u_password` varchar(45) COLLATE utf8_bin NOT NULL,
  `u_sex` varchar(45) COLLATE utf8_bin DEFAULT NULL,
  `u_email` varchar(45) COLLATE utf8_bin DEFAULT NULL,
  `u_telephone` varchar(45) COLLATE utf8_bin DEFAULT NULL,
  `u_regday` datetime DEFAULT NULL,
  `u_signature` varchar(60) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`u_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'123','123','男','2141241235@qq.com','321414','2019-11-20 21:23:44','一名程序员'),(2,'大帅涛','123','女','214124214@qq.com','32141414','2019-11-20 11:03:02','123'),(6,'杨洋','123','女','213124124@qq.com','1234567','2019-11-20 10:20:05','烈火起源'),(7,'杨幂','123','女','321421231@qq.com','1241241','2019-11-20 14:20:10','你的月亮我的心'),(12,'玻璃心','123','男','12345678@qq.com','13387717231','2019-12-11 00:40:33','哈哈哈哈哈哈哈');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `user_info`
--

DROP TABLE IF EXISTS `user_info`;
/*!50001 DROP VIEW IF EXISTS `user_info`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `user_info` AS SELECT 
 1 AS `u_name`,
 1 AS `u_sex`,
 1 AS `u_email`,
 1 AS `u_telephone`,
 1 AS `u_regday`,
 1 AS `u_signature`*/;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `user_info`
--

/*!50001 DROP VIEW IF EXISTS `user_info`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `user_info` AS select `user`.`u_name` AS `u_name`,`user`.`u_sex` AS `u_sex`,`user`.`u_email` AS `u_email`,`user`.`u_telephone` AS `u_telephone`,`user`.`u_regday` AS `u_regday`,`user`.`u_signature` AS `u_signature` from `user` */;
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

-- Dump completed on 2020-03-03 13:24:43
