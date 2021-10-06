-- MySQL dump 10.13  Distrib 8.0.19, for Linux (x86_64)
--
-- Host: localhost    Database: chat_default
-- ------------------------------------------------------
-- Server version	8.0.19-0ubuntu5

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
-- Table structure for table `bookmarks`
--

DROP TABLE IF EXISTS `bookmarks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bookmarks` (
  `user_id` int NOT NULL,
  `room_id` int NOT NULL,
  `message_id` int NOT NULL,
  PRIMARY KEY (`user_id`,`room_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bots`
--

DROP TABLE IF EXISTS `bots`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bots` (
  `id` int NOT NULL AUTO_INCREMENT,
  `bot_name` char(255) NOT NULL,
  `bot_info` text NOT NULL,
  `bot_params` blob NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bots_opt`
--

DROP TABLE IF EXISTS `bots_opt`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bots_opt` (
  `id` int NOT NULL AUTO_INCREMENT,
  `bot_id` int NOT NULL,
  `room_id` int NOT NULL,
  `enable` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `oldusers`
--

DROP TABLE IF EXISTS `oldusers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `oldusers` (
  `id` int NOT NULL AUTO_INCREMENT,
  `email` char(255) NOT NULL,
  `pass` char(255) NOT NULL,
  `name` char(255) NOT NULL,
  `datebirth` date DEFAULT NULL,
  `sex` tinyint(1) NOT NULL,
  `city` char(255) NOT NULL,
  `fio` char(255) NOT NULL,
  `aboutme` text NOT NULL,
  `hash` char(255) NOT NULL,
  `avatar` char(255) NOT NULL,
  `audio` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `email_3` (`email`),
  KEY `email_2` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `rooms`
--

DROP TABLE IF EXISTS `rooms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rooms` (
  `id` int NOT NULL AUTO_INCREMENT,
  `room` char(255) NOT NULL,
  `creator` int NOT NULL,
  `freq` tinyint(1) DEFAULT '0',
  `hello` text NOT NULL,
  `protected` tinyint(1) DEFAULT '0',
  `room_low` char(255) NOT NULL DEFAULT '',
  `pwd` char(255) NOT NULL,
  `lang` char(10) DEFAULT 'ru',
  `css` text,
  `ord` text NOT NULL,
  `img` char(255) NOT NULL DEFAULT '',
  `bots` int DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_rooms` (`room`)
) ENGINE=InnoDB AUTO_INCREMENT=129 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `rooms_messages`
--

DROP TABLE IF EXISTS `rooms_messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rooms_messages` (
  `id` int NOT NULL AUTO_INCREMENT,
  `room_id` int NOT NULL,
  `user_id` int NOT NULL,
  `message` text NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `isbroadcast` tinyint(1) NOT NULL,
  `broadcast_color` char(7) DEFAULT '#feffe3',
  `broadcast_textcolor` char(7) DEFAULT '#000000',
  `ip` char(64) DEFAULT NULL,
  `rang` int DEFAULT '0',
  `marker` datetime DEFAULT NULL,
  `gin` char(10) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `marker` (`user_id`,`marker`)
) ENGINE=InnoDB AUTO_INCREMENT=7403 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `rooms_messages_readed`
--

DROP TABLE IF EXISTS `rooms_messages_readed`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rooms_messages_readed` (
  `id` int NOT NULL AUTO_INCREMENT,
  `msg_id` int NOT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `msg_id` (`msg_id`,`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `servers_messages`
--

DROP TABLE IF EXISTS `servers_messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `servers_messages` (
  `id` int NOT NULL AUTO_INCREMENT,
  `room_id` int NOT NULL,
  `msg_type` char(255) NOT NULL,
  `color` char(255) NOT NULL,
  `message` text NOT NULL,
  `dt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `cnter` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `sm_counter` BEFORE INSERT ON `servers_messages` FOR EACH ROW SET NEW.cnter = (select IFNULL(max(cnter), 0)+1 from servers_messages where room_id = NEW.room_id) */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `sockets`
--

DROP TABLE IF EXISTS `sockets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sockets` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `socket` char(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_user_socket` (`user_id`,`socket`)
) ENGINE=InnoDB AUTO_INCREMENT=184 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sockets_in_rooms`
--

DROP TABLE IF EXISTS `sockets_in_rooms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sockets_in_rooms` (
  `id` int NOT NULL AUTO_INCREMENT,
  `socket_id` int NOT NULL,
  `room_id` int NOT NULL,
  `mob` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `socket_id` (`socket_id`,`room_id`)
) ENGINE=InnoDB AUTO_INCREMENT=135 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `email` char(255) NOT NULL,
  `pass` char(255) NOT NULL,
  `name` char(255) NOT NULL,
  `datebirth` date DEFAULT NULL,
  `sex` tinyint(1) NOT NULL,
  `city` char(255) NOT NULL,
  `fio` char(255) NOT NULL DEFAULT '',
  `aboutme` text NOT NULL,
  `hash` char(255) NOT NULL,
  `avatar` char(255) NOT NULL DEFAULT '',
  `audio` tinyint(1) NOT NULL DEFAULT '1',
  `pattern` char(255) NOT NULL DEFAULT '',
  `bg` char(255) NOT NULL DEFAULT '',
  `darktheme` tinyint(1) DEFAULT '0',
  `ico` char(16) DEFAULT '',
  `ban` tinyint(1) DEFAULT '0',
  `datereg` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_0` (`name`),
  UNIQUE KEY `username` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `users_bots`
--

DROP TABLE IF EXISTS `users_bots`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users_bots` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `bot_id` int NOT NULL,
  `bot_expire` date NOT NULL,
  `bot_settings` blob NOT NULL,
  `bot_index` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`,`bot_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `users_feed`
--

DROP TABLE IF EXISTS `users_feed`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users_feed` (
  `id` int NOT NULL AUTO_INCREMENT,
  `parent_id` int NOT NULL DEFAULT '0',
  `user_id` int NOT NULL,
  `author_id` int unsigned NOT NULL,
  `content` text NOT NULL,
  `child_count` int unsigned NOT NULL,
  `deleted` tinyint DEFAULT '0',
  `posted` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `users_hashes`
--

DROP TABLE IF EXISTS `users_hashes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users_hashes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `hash` char(255) NOT NULL,
  `date_created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `users_hashes_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `oldusers` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `users_in_rooms`
--

DROP TABLE IF EXISTS `users_in_rooms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users_in_rooms` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `room_id` int NOT NULL,
  `dt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`,`room_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `users_last_readed_messages`
--

DROP TABLE IF EXISTS `users_last_readed_messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users_last_readed_messages` (
  `id` int NOT NULL AUTO_INCREMENT,
  `from_id` int NOT NULL,
  `to_id` int NOT NULL,
  `lrm_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `lrm_users_ids` (`from_id`,`to_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1593 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `users_messages`
--

DROP TABLE IF EXISTS `users_messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users_messages` (
  `id` int NOT NULL AUTO_INCREMENT,
  `from_id` int NOT NULL,
  `to_id` int NOT NULL,
  `message` text NOT NULL,
  `readed_from` tinyint(1) NOT NULL DEFAULT '0',
  `readed_to` tinyint(1) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `ip` char(255) DEFAULT NULL,
  `gin` char(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1521 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `users_photos`
--

DROP TABLE IF EXISTS `users_photos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users_photos` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `upload_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `path` char(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=807 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `walls_messages`
--

DROP TABLE IF EXISTS `walls_messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `walls_messages` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `wall_id` int NOT NULL,
  `message` text NOT NULL,
  `parent_id` int NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-10-05 22:47:23


--
-- ADD DEFAULT ROOMS
--

insert into rooms values (91,'Рисовач',1,0,'',0,'','','ru','body{overflow: hidden !important;}\ndiv.msg{display:none !important;}\ndiv.right{position:absolute !important;left:9000px !important;}\n.anketa-body{display:none !important;} \n#bc4881{position:absolute !important;width:100% !important;height:100%; !important}\n.messages{display:none;}\n.mc .broadcast{left: 0 !important;width: 100% !important;    right: 0px !important;margin: 0px !important;margin-left: 0px !important;padding:0 !important}\n.mc .broadcastarea{max-height: 100% !important;width:100% !important;position: absolute !important;top: 0 !important;}\n.bc.expanded .hidden {height: 100% !important;}\n.mc .bc {padding: 0 !important;border: 0 !important;}\na.cssbtn {z-index:99 !important}\n.anketa-new.anketamin {display: none !important;}\n.wrapper{display:none !important;}\n.mc .broadcastarea {overflow-y:hidden !important;}\n.mc .broadcastarea .btn, .mc .broadcastarea .broadcastbtn {z-index:0 !important;}\n.mc .broadcastarea iframe{z-index:10 !important;} ','0','',0);


insert into rooms_messages values (4881,91,1,'<iframe style=\"width:100%;height:100%;border:none\" src=\"https://www.pixilart.com/draw\"></iframe>','2020-06-06 03:38:41',1,'#ffffff','#222222',NULL,0,NULL,'');


INSERT INTO `rooms` VALUES (39,'¢ґ@ẘ¢▣η€☂',1,0,'',0,'','','ru',' ','0,1426','https://crawc.net/coub.png',0);

insert into rooms_messages values (1426,39,1,'<div style=\"background:url(/16f694ddc7e.gif);position:absolute;background-size:contain;width:100px;height:70px;background-color:#ffffff00;right:50px;top:30px\"></div><span style=\"color:#ff6f65;font-size:32px;position:absolute;font-variant:all-small-caps;undefined:undefined;undefined:undefined;undefined:undefined;line-height:28px;undefined:undefined;undefined:undefined;undefined:undefined\">Welcome</span>                                           <pre style=\"margin:0;padding:0;font-size:14px;font-weight:normal;border:none;background-color:#fff\"><span style=\"background-color:rgb(255, 255, 255)\">\n                                  _   \n ___ ___ ___ _ _ _ ___    ___ ___|</span><span style=\"background-color:rgb(255, 239, 198)\"> </span><span style=\"background-color:rgb(255, 255, 255)\">|_ \n|</span><span style=\"background-color:rgb(255, 239, 198)\">  _|  _| _ | | | |  _</span><span style=\"background-color:rgb(255, 255, 255)\">|  |</span><span style=\"background-color:rgb(255, 239, 198)\">   | -_|  _</span><span style=\"background-color:rgb(255, 255, 255)\">|\n|</span><span style=\"background-color:rgb(255, 239, 198)\">___|_|</span> <span style=\"background-color:rgb(255, 239, 198)\">|_._|_____|___</span><span style=\"background-color:rgb(255, 255, 255)\">|  |</span><span style=\"background-color:rgb(255, 239, 198)\">_|_|___|_</span><span style=\"background-color:rgb(255, 255, 255)\">|</span></pre>','2020-05-08 06:37:19',1,'#fafafa','#333333',NULL,0,NULL,'');
