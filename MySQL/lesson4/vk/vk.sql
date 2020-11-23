-- MySQL dump 10.13  Distrib 8.0.21, for Win64 (x86_64)
--
-- Host: localhost    Database: vk
-- ------------------------------------------------------
-- Server version	8.0.21

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
-- Table structure for table `communities`
--

DROP TABLE IF EXISTS `communities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `communities` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(245) NOT NULL,
  `admin_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_communities_users1_idx` (`admin_id`),
  CONSTRAINT `fk_communities_users1` FOREIGN KEY (`admin_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `communities`
--

LOCK TABLES `communities` WRITE;
/*!40000 ALTER TABLE `communities` DISABLE KEYS */;
INSERT INTO `communities` VALUES (1,'et',1),(2,'et',2),(3,'impedit',3),(4,'molestias',4),(5,'repudiandae',5),(6,'quia',6),(7,'eos',7),(8,'sunt',8),(9,'fugiat',9),(10,'magnam',10);
/*!40000 ALTER TABLE `communities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `friend_requests`
--

DROP TABLE IF EXISTS `friend_requests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `friend_requests` (
  `from_user_id` int NOT NULL,
  `to_user_id` int NOT NULL,
  `status` tinyint unsigned NOT NULL COMMENT 'статус: 0 - запрос, 1 - подтвержден, 2 - отклонен',
  PRIMARY KEY (`from_user_id`,`to_user_id`),
  KEY `fk_friend_requests_users1_idx` (`from_user_id`),
  KEY `fk_friend_requests_users2_idx` (`to_user_id`),
  CONSTRAINT `fk_friend_requests_users1` FOREIGN KEY (`from_user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `fk_friend_requests_users2` FOREIGN KEY (`to_user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `friend_requests`
--

LOCK TABLES `friend_requests` WRITE;
/*!40000 ALTER TABLE `friend_requests` DISABLE KEYS */;
INSERT INTO `friend_requests` VALUES (2,2,1),(4,8,1),(4,13,2),(6,14,1),(6,39,2),(6,77,0),(9,35,0),(9,61,1),(10,34,2),(11,9,1),(12,11,1),(14,61,0),(15,34,1),(15,67,2),(19,39,1),(19,62,2),(19,79,2),(21,100,0),(23,63,1),(24,50,2),(25,83,0),(26,64,0),(27,3,2),(27,38,1),(29,49,0),(29,69,0),(30,49,1),(32,17,0),(32,63,0),(33,50,0),(34,52,2),(35,8,2),(35,28,0),(35,56,1),(35,82,0),(36,57,1),(37,16,2),(38,39,0),(38,69,0),(38,99,2),(39,3,1),(39,9,2),(40,93,2),(43,4,2),(45,34,2),(45,96,2),(46,42,2),(46,97,2),(47,56,1),(48,60,1),(49,23,2),(50,85,0),(51,91,2),(53,11,1),(54,97,2),(55,34,1),(55,66,2),(56,67,2),(57,36,1),(59,93,2),(61,37,0),(61,71,0),(63,56,0),(63,72,0),(64,47,1),(67,100,2),(68,5,2),(68,61,0),(68,100,2),(69,37,1),(69,68,2),(69,89,0),(70,75,2),(70,80,0),(71,78,1),(72,39,2),(75,28,2),(75,68,1),(75,76,0),(76,28,2),(77,56,0),(81,7,1),(83,41,1),(84,63,0),(86,58,1),(89,57,0),(89,79,1),(92,91,1),(92,93,2),(93,27,1),(93,97,2),(94,41,0),(95,2,2),(95,9,1),(95,98,1),(96,91,0),(96,97,2),(98,75,1),(99,31,1),(100,86,0);
/*!40000 ALTER TABLE `friend_requests` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `likes`
--

DROP TABLE IF EXISTS `likes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `likes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `from_user_id` int NOT NULL,
  `to_user_id` int NOT NULL,
  `message_id` int DEFAULT NULL,
  `media_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `fk_from_to_idx` (`from_user_id`,`to_user_id`),
  UNIQUE KEY `fk_from_to_message_idx` (`from_user_id`,`to_user_id`,`message_id`) /*!80000 INVISIBLE */,
  UNIQUE KEY `fk_from_to_media_idx` (`from_user_id`,`to_user_id`,`media_id`),
  KEY `fk_likes_users2_idx` (`to_user_id`),
  KEY `fk_likes_messages1_idx` (`message_id`),
  KEY `fk_likes_media1_idx` (`media_id`),
  CONSTRAINT `fk_likes_media1` FOREIGN KEY (`media_id`) REFERENCES `media` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_likes_messages1` FOREIGN KEY (`message_id`) REFERENCES `messages` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_likes_users1` FOREIGN KEY (`from_user_id`) REFERENCES `users` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_likes_users2` FOREIGN KEY (`to_user_id`) REFERENCES `users` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=301 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `likes`
--

LOCK TABLES `likes` WRITE;
/*!40000 ALTER TABLE `likes` DISABLE KEYS */;
INSERT INTO `likes` VALUES (101,61,61,NULL,NULL),(102,23,19,NULL,NULL),(103,84,20,NULL,NULL),(104,30,40,NULL,NULL),(105,27,25,NULL,NULL),(106,84,33,NULL,NULL),(107,21,15,NULL,NULL),(108,80,74,NULL,NULL),(109,35,38,NULL,NULL),(110,57,1,NULL,NULL),(111,21,29,NULL,NULL),(112,68,77,NULL,NULL),(113,2,52,NULL,NULL),(114,85,42,NULL,NULL),(115,57,37,NULL,NULL),(116,11,34,NULL,NULL),(117,72,17,NULL,NULL),(118,18,86,NULL,NULL),(119,14,38,NULL,NULL),(120,14,28,NULL,NULL),(121,79,46,NULL,NULL),(122,88,13,NULL,NULL),(123,49,46,NULL,NULL),(124,80,55,NULL,NULL),(125,72,4,NULL,NULL),(126,89,48,NULL,NULL),(127,85,14,NULL,NULL),(128,41,60,NULL,NULL),(129,5,13,NULL,NULL),(130,25,51,NULL,NULL),(131,97,14,NULL,NULL),(132,69,36,NULL,NULL),(133,40,7,NULL,NULL),(134,54,55,NULL,NULL),(135,68,15,NULL,NULL),(136,74,50,NULL,NULL),(137,62,12,NULL,NULL),(138,63,6,NULL,NULL),(139,20,93,NULL,NULL),(140,29,62,NULL,NULL),(141,69,57,NULL,NULL),(142,11,27,NULL,NULL),(143,42,98,NULL,NULL),(144,47,16,NULL,NULL),(145,27,64,NULL,NULL),(146,69,55,NULL,NULL),(147,48,83,NULL,NULL),(148,44,5,NULL,NULL),(149,62,40,NULL,NULL),(150,67,96,NULL,NULL),(151,93,38,NULL,NULL),(152,54,15,NULL,NULL),(153,79,42,NULL,NULL),(154,96,18,NULL,NULL),(155,100,13,NULL,NULL),(156,17,62,NULL,NULL),(157,2,91,NULL,NULL),(158,86,1,NULL,NULL),(159,39,97,NULL,NULL),(160,12,63,NULL,NULL),(161,4,44,NULL,NULL),(162,61,72,NULL,NULL),(163,84,62,NULL,NULL),(164,24,60,NULL,NULL),(165,50,30,NULL,NULL),(166,31,67,NULL,NULL),(167,64,28,NULL,NULL),(168,91,36,NULL,NULL),(169,79,1,NULL,NULL),(170,73,37,NULL,NULL),(171,99,4,NULL,NULL),(172,64,37,NULL,NULL),(173,66,38,NULL,NULL),(174,5,60,NULL,NULL),(175,88,27,NULL,NULL),(176,62,7,NULL,NULL),(177,8,67,NULL,NULL),(178,4,79,NULL,NULL),(179,83,93,NULL,NULL),(180,29,69,59,NULL),(181,7,6,90,NULL),(182,66,55,80,NULL),(183,81,23,32,NULL),(184,30,5,82,NULL),(185,71,61,16,NULL),(186,40,52,77,NULL),(187,45,100,67,NULL),(188,69,25,68,NULL),(189,31,58,87,NULL),(190,12,67,49,NULL),(191,90,80,34,NULL),(192,84,15,55,NULL),(193,76,71,30,NULL),(194,22,6,36,NULL),(195,6,3,40,NULL),(196,27,8,49,NULL),(197,65,36,53,NULL),(198,3,1,68,NULL),(199,81,1,10,NULL),(200,16,65,20,NULL),(201,35,49,6,NULL),(202,55,42,23,NULL),(203,44,63,34,NULL),(204,70,82,27,NULL),(205,18,80,11,NULL),(206,80,78,12,NULL),(207,79,22,24,NULL),(208,86,43,85,NULL),(209,92,91,77,NULL),(210,33,100,6,NULL),(211,63,39,47,NULL),(212,21,74,67,NULL),(213,53,77,58,NULL),(214,54,70,92,NULL),(215,92,16,26,NULL),(216,59,11,98,NULL),(217,2,74,96,NULL),(218,74,2,10,NULL),(219,40,56,68,NULL),(220,29,34,98,NULL),(221,11,56,13,NULL),(222,26,4,96,NULL),(223,19,22,94,NULL),(224,33,91,27,NULL),(225,65,23,68,NULL),(226,24,77,74,NULL),(227,32,42,23,NULL),(228,76,21,42,NULL),(229,77,54,49,NULL),(230,58,45,19,NULL),(231,66,12,54,NULL),(232,2,80,32,NULL),(233,3,99,4,NULL),(234,75,78,90,NULL),(235,19,13,68,NULL),(236,33,9,79,NULL),(237,62,28,11,NULL),(238,72,30,95,NULL),(239,41,49,36,NULL),(240,29,67,9,31),(241,65,13,NULL,39),(242,90,46,NULL,9),(243,58,13,NULL,91),(244,21,81,NULL,83),(245,9,11,NULL,81),(246,40,97,NULL,80),(247,45,54,NULL,73),(248,20,31,NULL,84),(249,43,60,NULL,33),(250,6,68,NULL,63),(251,81,43,NULL,2),(252,24,53,NULL,33),(253,63,86,NULL,3),(254,82,31,NULL,27),(255,84,5,NULL,4),(256,36,3,NULL,78),(257,62,10,NULL,68),(258,78,51,NULL,58),(259,94,83,NULL,17),(260,36,43,NULL,99),(261,28,62,NULL,10),(262,92,83,NULL,76),(263,87,36,NULL,22),(264,38,66,NULL,100),(265,75,10,NULL,53),(266,60,97,NULL,54),(267,80,69,NULL,16),(268,12,19,NULL,39),(269,80,14,NULL,72),(270,96,85,NULL,83),(271,21,27,NULL,59),(272,92,4,NULL,67),(273,13,26,NULL,73),(274,23,30,NULL,2),(275,98,96,NULL,9),(276,15,30,NULL,94),(277,44,97,NULL,39),(278,82,14,NULL,3),(279,40,25,NULL,32),(280,29,19,NULL,42),(281,44,18,NULL,66),(282,48,40,NULL,45),(283,36,85,NULL,50),(284,15,2,NULL,58),(285,99,10,NULL,81),(286,23,18,NULL,63),(287,43,43,NULL,71),(288,62,93,NULL,6),(289,11,26,NULL,58),(290,66,39,NULL,1),(291,24,57,NULL,39),(292,59,94,NULL,58),(293,3,94,NULL,25),(294,11,20,NULL,54),(295,62,82,NULL,24),(296,74,36,NULL,85),(297,62,100,NULL,27),(298,39,46,NULL,62),(299,2,77,NULL,61),(300,71,97,NULL,73);
/*!40000 ALTER TABLE `likes` ENABLE KEYS */;
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `likes_BEFORE_INSERT` BEFORE INSERT ON `likes` FOR EACH ROW BEGIN

END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `media`
--

DROP TABLE IF EXISTS `media`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `media` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `media_type_id` int NOT NULL,
  `text` text,
  `file` blob COMMENT '/files/img/01.jpg',
  `size` int DEFAULT NULL,
  `metadata` json DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_media_media_types1_idx` (`media_type_id`),
  KEY `fk_media_users1_idx` (`user_id`),
  CONSTRAINT `fk_media_media_types1` FOREIGN KEY (`media_type_id`) REFERENCES `media_types` (`id`),
  CONSTRAINT `fk_media_users1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `media`
--

LOCK TABLES `media` WRITE;
/*!40000 ALTER TABLE `media` DISABLE KEYS */;
INSERT INTO `media` VALUES (1,1,1,'Sit vero facere aut dolorem. Consequatur quo molestiae placeat pariatur est. Suscipit molestiae rerum delectus itaque est qui.',NULL,77965,NULL),(2,2,2,'Et eaque dolorem corporis veniam enim ut. Qui necessitatibus exercitationem rerum rerum veniam vitae eos aut. Expedita officiis in et sunt. Adipisci tenetur illo aut saepe.',NULL,0,NULL),(3,3,3,'Cumque recusandae et est tempore similique sit soluta et. Iure illo quas ad.\nQuis et quasi magni doloribus sapiente. Quo et veniam a omnis recusandae. Ut repellendus molestiae unde ut.',NULL,586,NULL),(4,4,4,'Suscipit aliquid perspiciatis asperiores consequatur. Ipsa dolores sequi provident sed. Impedit repellendus aut consequatur voluptas non.',NULL,195,NULL),(5,5,1,'Reiciendis rerum architecto ut similique. Sed omnis error molestiae ipsam explicabo.',NULL,2520890,NULL),(6,6,2,'Ut laudantium voluptatem libero veniam velit ad et. Sit rem ea ipsum veniam accusantium id. Itaque fuga dignissimos enim unde deserunt ut.',NULL,0,NULL),(7,7,3,'Enim ex vero et illo dolore soluta et. Impedit vel odio voluptatibus rerum architecto eveniet qui. Nihil delectus error quas dolorem nesciunt.',NULL,8645,NULL),(8,8,4,'Et sunt aut pariatur voluptatem. Et necessitatibus sunt consequatur dolor qui.',NULL,5710019,NULL),(9,9,1,'Vero animi incidunt ut quis. Aspernatur inventore dicta hic deleniti autem. A ut voluptates officiis reprehenderit quia. Ut corrupti temporibus deserunt magni et inventore sit.',NULL,6,NULL),(10,10,2,'Quo id sit repudiandae in ut est illo. Molestiae et fugit autem labore sed. Qui omnis in temporibus velit consequatur. Deserunt ut iure id eum nihil et.',NULL,422,NULL),(11,11,3,'Totam accusantium quia quae voluptatum est sit. Mollitia corrupti at inventore consequatur. Dolor veniam beatae labore accusantium sint quis voluptas sunt.',NULL,2918,NULL),(12,12,4,'Maiores eum sunt quasi. Illum et est omnis ratione enim ea.\nSunt quia et enim minus ex. Est accusantium molestiae neque reprehenderit. Non repellat voluptas aut asperiores sit.',NULL,383585842,NULL),(13,13,1,'In veritatis maiores possimus voluptatibus suscipit. Quasi mollitia possimus voluptatem sapiente. Ducimus dolore et dolor. Sint esse inventore deserunt incidunt cupiditate.',NULL,12,NULL),(14,14,2,'Tempora sequi deleniti sit quaerat eligendi at placeat harum. Fuga ducimus ad nisi mollitia. Vel et doloribus consectetur. Sunt in voluptatem sed vitae. Minima maxime ipsum inventore quaerat.',NULL,7,NULL),(15,15,3,'Explicabo dicta voluptas dolor natus. Sequi qui est dolorum ab aperiam est distinctio. Aliquid dolores delectus saepe ut libero quaerat tenetur.',NULL,213,NULL),(16,16,4,'Accusantium voluptatem ut in consequatur. Pariatur consequatur reiciendis itaque nostrum. Quidem nobis labore perferendis vitae ut repellat. Quos repellendus modi dolore eos est culpa eligendi enim.',NULL,424838319,NULL),(17,17,1,'Excepturi nihil et quia ipsa voluptate qui. Et dolor asperiores optio ullam doloribus. Id esse veritatis mollitia id quia aperiam beatae.',NULL,0,NULL),(18,18,2,'Aperiam consectetur adipisci est. Debitis dolor illum odit ex ea. Quaerat quaerat vel esse. Odio hic nemo similique. Dicta qui modi error ullam est doloribus dicta.',NULL,0,NULL),(19,19,3,'Aut aliquid rerum similique odit aut possimus beatae. Ut in modi repellat optio omnis fugit. Consequatur ex quae et sit voluptatibus eum ut ut. Quas voluptatem provident inventore.',NULL,414,NULL),(20,20,4,'Fuga optio qui illo voluptas. Sed expedita perspiciatis sequi vero.',NULL,33366216,NULL),(21,21,1,'Aut rem odit eaque unde voluptas ut. Consequuntur impedit vitae odio accusantium perspiciatis. Impedit sit quis excepturi possimus ab.',NULL,40929,NULL),(22,22,2,'Unde officia sint mollitia minus facilis magnam. Dolores omnis nihil soluta sequi voluptatem non. Esse excepturi omnis unde qui provident sed.',NULL,832409,NULL),(23,23,3,'Omnis aperiam quis dolorum dolores quia. Assumenda distinctio deleniti sit sit eveniet sapiente quam. Vero qui odio corporis fugiat. Tempora dolor accusantium deserunt.',NULL,6924796,NULL),(24,24,4,'Nemo minus ratione et necessitatibus enim quis. Officiis repudiandae alias quia quo consequatur. Enim voluptates sunt explicabo deserunt ut.',NULL,44558,NULL),(25,25,1,'Consequatur quas praesentium quis tempora id. Dolores voluptatibus et voluptatum sed accusamus. Et quia quas fuga ut ut numquam tenetur at.',NULL,390,NULL),(26,26,2,'Dignissimos ea maiores illum qui deleniti nam. Optio repellat vero est consequatur rerum omnis.',NULL,75,NULL),(27,27,3,'Rem quia dolorum dolore minus. Est deserunt tenetur tempore eligendi dolor. Et recusandae eligendi et officia quam aspernatur nulla quae. Alias laudantium amet labore repudiandae debitis tempora hic.',NULL,609495,NULL),(28,28,4,'Nostrum et velit dolor quia odio labore et. Optio doloremque quae repellendus. Deleniti nobis modi qui amet iusto aperiam quo. Sunt nisi quis voluptatem necessitatibus ratione odit rerum.',NULL,2,NULL),(29,29,1,'Odio velit ut ex voluptates. Ut facere hic repellendus. Neque quia libero soluta ea aut ut maxime tenetur. Ut accusamus amet beatae.',NULL,0,NULL),(30,30,2,'Sed ducimus explicabo reprehenderit repellat. Dolorem sed aut nisi tenetur in libero dolore. Magni cumque eum distinctio qui ab ut.',NULL,88,NULL),(31,31,3,'Optio ullam vel ut delectus eligendi. Explicabo enim aut error accusamus sint consequatur. Voluptatem eaque vel asperiores eos.\nEst ab ut odio accusamus. Ex eos asperiores vitae.',NULL,209074207,NULL),(32,32,4,'Recusandae molestias beatae nihil sunt. Nihil rerum voluptatibus quos ea quia nisi nesciunt. Rem quam aut ea omnis perspiciatis est id. Velit provident iure sapiente.',NULL,708530,NULL),(33,33,1,'Fugit est velit ut nulla quo quaerat. Consequatur est tempora nam consectetur ipsum qui ipsum. Ut praesentium architecto consequatur sint. Ex et velit et temporibus amet nihil veniam.',NULL,87151,NULL),(34,34,2,'Reprehenderit excepturi molestiae sapiente id sapiente autem vitae. Consequatur quia ut eaque sint facere eum. Earum et tempore velit. Tempore aut architecto accusamus enim.',NULL,784,NULL),(35,35,3,'Natus iste tempora qui deserunt. Est atque magni ducimus sit optio. In vel minus officia esse. Impedit necessitatibus optio ea et beatae cum omnis.',NULL,72868,NULL),(36,36,4,'Ea aut architecto ipsa omnis ducimus ipsam repellendus. Debitis tempora laborum sequi quia quo.\nVoluptas adipisci laudantium expedita excepturi. Sed eum ipsa quam nihil veritatis explicabo et.',NULL,5320713,NULL),(37,37,1,'Et aperiam et ea explicabo dolor amet. Modi temporibus dolorem cumque deserunt qui fugiat in. Labore eaque ut consequatur sint qui. Aut quam et accusantium ut molestias aut voluptas.',NULL,99,NULL),(38,38,2,'Ex repellendus quod debitis aut pariatur in temporibus repellendus. Et facere dolor delectus est et impedit eligendi ex. Accusamus molestias inventore nemo dolor.',NULL,2,NULL),(39,39,3,'Dolores nobis voluptatem et delectus. Tenetur nobis commodi mollitia nihil sit magni amet. Ut qui soluta cupiditate ea.',NULL,0,NULL),(40,40,4,'Doloribus omnis consectetur rerum quia. Maiores voluptatem soluta et dolor quibusdam. Nulla et maiores magni consequatur adipisci voluptatem.',NULL,454,NULL),(41,41,1,'Quod voluptatem ut a incidunt aut accusantium fugiat. Voluptas ea et aut rerum et. Culpa maiores et dolorem animi totam magni consectetur.',NULL,0,NULL),(42,42,2,'Sunt perspiciatis eos mollitia voluptatum nihil. Eum sed facilis aut nisi. Et doloremque debitis sit animi dignissimos ex. Quidem inventore consequatur voluptas veritatis alias cumque soluta.',NULL,49918,NULL),(43,43,3,'Perspiciatis nisi animi consequatur commodi. Aut qui eum aut odit laudantium ex. Optio officiis et ullam atque eum porro possimus.',NULL,6371,NULL),(44,44,4,'Placeat eveniet blanditiis unde saepe. Dolor eveniet eius et molestiae perferendis adipisci aut sunt. Iusto dolore est modi quae.',NULL,64340,NULL),(45,45,1,'Dolor ut voluptate id temporibus a quia. Reiciendis vitae rerum quam et atque culpa. Sed id pariatur quis et quam aperiam voluptatem.',NULL,712604192,NULL),(46,46,2,'Labore incidunt rem maxime laborum qui. Vel iusto quidem porro quod asperiores enim suscipit.',NULL,4055,NULL),(47,47,3,'Enim eveniet qui dignissimos accusantium. Rerum provident laudantium dolore inventore totam. Aspernatur nostrum hic eos et ut suscipit. Provident cumque sunt natus sunt magni sunt.',NULL,0,NULL),(48,48,4,'Maiores temporibus ipsa voluptate facilis vitae vel corporis. Earum pariatur quis nisi. Fugiat officiis ea velit ea nobis id architecto autem. Et qui quia harum facere.',NULL,0,NULL),(49,49,1,'Saepe omnis sit et ut ut ab et. Rerum ea at aspernatur. Totam natus veniam et sed ratione aliquid voluptatibus fuga.',NULL,49,NULL),(50,50,2,'Eligendi velit sit quod culpa. Error ducimus accusantium molestiae molestiae nihil eaque quia.',NULL,928,NULL),(51,51,3,'Aliquam quas sint minus quo blanditiis est dolore. Voluptas omnis unde maxime tenetur et. Sunt ut et nisi consequatur asperiores.',NULL,6576576,NULL),(52,52,4,'Omnis perferendis labore incidunt consequatur et natus. Quae blanditiis eligendi blanditiis repudiandae tempora. Enim ut eius ducimus.',NULL,813,NULL),(53,53,1,'Fuga ut cupiditate enim. Atque perspiciatis reprehenderit aut repellendus quaerat.',NULL,85896516,NULL),(54,54,2,'Ut sequi et enim. Aut enim eius suscipit nemo quisquam harum. Accusantium similique omnis soluta. Expedita quaerat consequatur iusto.',NULL,5822,NULL),(55,55,3,'Aut velit sit minus nam cupiditate. Autem odit et praesentium non. Qui qui porro corporis consequuntur.',NULL,0,NULL),(56,56,4,'Deserunt sed consequatur nulla excepturi. Consequatur omnis quas quo assumenda esse architecto voluptas. Laudantium odio iure ut reiciendis sed sint. Similique sit expedita quis.',NULL,2921290,NULL),(57,57,1,'Quibusdam temporibus quae quisquam debitis. Sint omnis et enim aut molestiae quidem. Est et sunt repudiandae tempore.',NULL,8434779,NULL),(58,58,2,'Quis debitis aut enim qui. Ipsa unde ad molestiae quae. Voluptatem ratione a accusamus ut debitis qui sit. Accusantium commodi nostrum soluta aperiam.',NULL,50,NULL),(59,59,3,'Quis perferendis repudiandae facere ut magnam et dicta. Consequatur iusto odio placeat dolor eius id sed. Quod aliquam amet quaerat veritatis qui. Ducimus provident nesciunt sit exercitationem ullam.',NULL,0,NULL),(60,60,4,'Molestiae itaque fugiat minima sequi in. Eos perferendis alias soluta ullam. Quis possimus nesciunt provident voluptatem. Eligendi cupiditate libero corporis quisquam sed.',NULL,443608,NULL),(61,61,1,'Et dolores laborum ipsum non et repellendus ut. Illum tempore minus tempora nostrum est voluptatum fugiat. Eveniet sapiente voluptas et quisquam. Rerum enim ut ut fugiat autem pariatur molestias.',NULL,8445,NULL),(62,62,2,'Est quas officiis reprehenderit nam nostrum quae ut. Rem rerum aliquam rerum consequatur quo. Alias aut facilis dolor non.',NULL,9987034,NULL),(63,63,3,'Sit et amet non. Reprehenderit rem officia nihil omnis velit repellat. Saepe quod delectus omnis error quaerat.',NULL,102827124,NULL),(64,64,4,'Ut omnis rerum ut veritatis sapiente tenetur. Corporis praesentium suscipit aut quia possimus sit dignissimos. Ex quaerat deserunt sapiente vero velit ut laboriosam nulla. Et eum occaecati illum.',NULL,45602,NULL),(65,65,1,'Excepturi est nihil dignissimos nisi porro qui. Distinctio et temporibus dolorem. Dicta distinctio quo nam eos tempora voluptatem.',NULL,1565,NULL),(66,66,2,'Culpa quo facere recusandae voluptates commodi aliquid accusantium quia. Sed dolorum illum et commodi accusamus consectetur ullam. Tempora sit in quia dolorem excepturi veniam maxime.',NULL,139503,NULL),(67,67,3,'Ut molestias exercitationem tempore rerum eveniet maxime. Blanditiis in eveniet hic ut. Nihil id impedit temporibus quibusdam ipsa.',NULL,509196,NULL),(68,68,4,'Vitae aut quos officiis atque minima quae nemo. Aperiam nobis laudantium totam rerum aut illo. Tempora ratione iure dignissimos voluptatem eius.',NULL,656148096,NULL),(69,69,1,'Sapiente et eum quo rerum soluta magnam temporibus. Laboriosam omnis repudiandae eum quod. Ut qui molestiae possimus quaerat at et. Nobis recusandae consequatur recusandae nemo.',NULL,2544393,NULL),(70,70,2,'Molestiae quis facilis libero laudantium alias itaque ut. Adipisci ratione iure aut et commodi. Ea corporis praesentium veniam voluptas debitis tempora.',NULL,88,NULL),(71,71,3,'Quia consequatur maiores et quae sunt. Optio reprehenderit aut nulla sapiente. Ad sit quibusdam quos quia consequatur minima. Voluptatum sint facilis ullam dolorem et.',NULL,562791,NULL),(72,72,4,'Id aperiam rerum magni inventore. Non autem repellat pariatur impedit eum quis. Ut voluptatem maxime eos vitae ea.\nPorro quas cum deleniti reiciendis cumque. Et nihil odit enim hic.',NULL,8988,NULL),(73,73,1,'Sint sit ipsum magni natus. Dolores consequatur porro esse suscipit doloremque. Qui aperiam odit aliquam ad possimus.',NULL,33356,NULL),(74,74,2,'Et non rerum voluptates qui. Tempora sunt sint provident deleniti similique. Rerum velit laborum nobis illum tenetur recusandae nam.',NULL,567,NULL),(75,75,3,'Vel illum exercitationem maiores dignissimos natus voluptate aliquam vitae. Fugit ab asperiores eum est praesentium consequuntur vero sint. Laborum delectus dolorem ut perferendis.',NULL,5025,NULL),(76,76,4,'Cupiditate molestiae libero sint accusamus vel sit dolor. Quam voluptas ea ea soluta. Similique molestias delectus nihil veritatis. Et aliquam et magnam fuga voluptatem voluptas modi eos.',NULL,11009,NULL),(77,77,1,'Corporis fugiat accusamus culpa reiciendis. Dolorem quis commodi aut quidem minima. Consequatur repudiandae et perferendis tenetur beatae a eaque.',NULL,5180484,NULL),(78,78,2,'Unde consectetur sed autem reprehenderit quis minus. Rerum molestias rerum neque blanditiis. Nisi rerum adipisci recusandae est molestias quos. Nobis et harum commodi blanditiis optio rem.',NULL,25195615,NULL),(79,79,3,'Deleniti natus debitis unde. Vel asperiores mollitia vel cupiditate ut molestiae optio. Eum quos natus culpa.\nVel et cumque dolor at. Sit laborum corporis voluptatem veritatis itaque vel deserunt.',NULL,0,NULL),(80,80,4,'Aut omnis rerum consectetur qui alias ex. Qui porro corrupti aliquam molestiae. Ut nemo praesentium ratione voluptatum. Facilis vel est maxime.',NULL,875,NULL),(81,81,1,'Incidunt necessitatibus dignissimos similique magni voluptatem veritatis. Omnis earum veniam labore nemo. Non delectus hic omnis nam sequi fugiat. Mollitia ut nihil quasi suscipit quos qui unde.',NULL,80650403,NULL),(82,82,2,'Ratione dolore molestias consequuntur dicta est incidunt. Unde commodi enim cumque sit at. Qui ab blanditiis saepe vero commodi blanditiis.',NULL,5076449,NULL),(83,83,3,'Pariatur eligendi et omnis ipsum et aut et. Facere vel dolor quo sit accusantium dignissimos debitis. Recusandae consequatur doloremque unde quia.',NULL,91,NULL),(84,84,4,'Velit magni nihil unde vitae et vitae. Sed natus pariatur debitis at laborum. Laudantium odio ut quis eveniet sit et natus. Qui accusantium et quas iusto atque natus.',NULL,465389388,NULL),(85,85,1,'Porro ullam ut ab veniam sed amet et. Alias laboriosam alias non labore. Unde sed iste fugit est eaque dolorem in.',NULL,9222463,NULL),(86,86,2,'Voluptas eius cumque sit quos dolor. Provident eum aliquid expedita eveniet est eum voluptatem hic. Ipsum asperiores deserunt asperiores beatae veniam.',NULL,9,NULL),(87,87,3,'Rerum error soluta provident veritatis sed. Natus nostrum molestiae alias sed. Dolore hic et voluptas sit ut et enim. Dolorem enim repudiandae et reprehenderit pariatur beatae.',NULL,2,NULL),(88,88,4,'Porro et quo possimus ex eaque. Corrupti eveniet earum necessitatibus. Fuga fugit aut aut a natus vero.',NULL,94596,NULL),(89,89,1,'Tenetur alias qui quia sint et velit. Id explicabo aut cum minima qui quisquam. Commodi est temporibus reprehenderit. Eaque dignissimos magnam porro delectus animi quo aliquam.',NULL,176976,NULL),(90,90,2,'Et nemo quos et et nemo et iusto. Molestias non nam et temporibus quam. Praesentium explicabo aut eos voluptas eos nemo in.',NULL,162660,NULL),(91,91,3,'Officiis excepturi non et consequatur magnam. Nemo praesentium natus voluptas debitis dolores optio ut. Quia et sit facere neque repudiandae voluptatibus et recusandae.',NULL,0,NULL),(92,92,4,'Doloremque adipisci voluptates ipsum qui velit sunt aut. Et nemo odit molestiae aut. Sint explicabo dicta facilis impedit corporis quis nihil. Aut omnis nam magnam natus voluptatem.',NULL,87439598,NULL),(93,93,1,'Iusto saepe quasi id. Iusto quos repellendus qui blanditiis aliquid. Minus rem pariatur consectetur corporis et praesentium. Quidem maxime ut sunt.',NULL,389,NULL),(94,94,2,'Enim ut quia ipsa minima aspernatur alias voluptate. Dolorem optio quia et dignissimos odit porro qui eius. Et autem rerum totam.',NULL,4386,NULL),(95,95,3,'Cumque nihil sit velit omnis. Aliquam maiores labore odio ut et vel incidunt. Id quia vel ratione.\nQui eaque et et nemo. Ut ut ipsam hic sunt autem minima voluptatem.',NULL,3446284,NULL),(96,96,4,'Quasi id dignissimos molestias animi culpa iure sunt. Odit omnis dignissimos consequatur sed. Odit et veritatis tenetur ipsum. Velit delectus suscipit qui autem.',NULL,6001690,NULL),(97,97,1,'Incidunt sint necessitatibus et. Debitis qui id illo exercitationem velit officiis. Enim dolores qui asperiores et cum ipsa. Ipsa delectus modi placeat.',NULL,66,NULL),(98,98,2,'Iure exercitationem quas at ea dolor voluptatem. Non velit sapiente necessitatibus. Est mollitia soluta provident ipsam consequatur. Rem amet et asperiores facilis. Omnis est eaque non.',NULL,17292137,NULL),(99,99,3,'Quae illo et voluptates et magni consequatur animi. Ab nihil veniam aut necessitatibus voluptatibus et. Atque consequatur assumenda quam et illum nulla delectus.',NULL,0,NULL),(100,100,4,'Consequatur facilis laborum molestiae architecto aliquid minima. Dolorem natus eius distinctio optio ullam repellat. Repellendus enim deleniti tempore fuga voluptatem temporibus.',NULL,53758239,NULL);
/*!40000 ALTER TABLE `media` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `media_types`
--

DROP TABLE IF EXISTS `media_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `media_types` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(245) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `media_types`
--

LOCK TABLES `media_types` WRITE;
/*!40000 ALTER TABLE `media_types` DISABLE KEYS */;
INSERT INTO `media_types` VALUES (1,'img'),(2,'music'),(3,'video'),(4,'music');
/*!40000 ALTER TABLE `media_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `messages`
--

DROP TABLE IF EXISTS `messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `messages` (
  `id` int NOT NULL AUTO_INCREMENT,
  `from_user_id` int NOT NULL,
  `to_user_id` int NOT NULL,
  `text` text NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `fk_messages_users1_idx` (`from_user_id`),
  KEY `fk_messages_users2_idx` (`to_user_id`),
  CONSTRAINT `fk_messages_users1` FOREIGN KEY (`from_user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `fk_messages_users2` FOREIGN KEY (`to_user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `messages`
--

LOCK TABLES `messages` WRITE;
/*!40000 ALTER TABLE `messages` DISABLE KEYS */;
INSERT INTO `messages` VALUES (1,9,85,'Quae deserunt dignissimos rem consequatur facilis et eaque.','2007-02-07 10:52:44'),(2,19,67,'Occaecati nobis tenetur ut ad eaque sed mollitia eum.','2014-02-23 05:19:38'),(3,81,83,'Omnis aut qui inventore excepturi.','1987-05-22 09:00:47'),(4,72,37,'Ullam eius tempore nobis.','1991-01-07 19:45:49'),(5,98,30,'Praesentium autem dolores quisquam architecto.','2016-07-20 00:56:59'),(6,7,47,'Adipisci labore amet sint ut.','2006-03-07 06:14:28'),(7,85,21,'Consequatur officia voluptatem praesentium omnis nostrum.','1997-02-28 07:55:07'),(8,52,55,'Enim porro molestiae magni qui possimus eligendi aspernatur ut.','1980-05-25 02:32:00'),(9,19,94,'Ipsum vitae qui voluptatem enim explicabo et quisquam.','2009-06-10 14:10:37'),(10,91,18,'Sed eius ea minima dolorum.','2020-06-09 17:59:05'),(11,83,9,'Nihil consequatur sit voluptatem doloribus voluptate eaque provident beatae.','2005-07-15 14:02:40'),(12,7,85,'Recusandae sapiente ipsa suscipit tempora.','1990-06-06 09:04:54'),(13,76,46,'Qui mollitia aliquid atque nihil et tempore deserunt.','2009-04-06 19:21:06'),(14,74,52,'Ratione dicta id aspernatur excepturi.','2019-03-05 13:42:02'),(15,11,100,'Illo recusandae odit et dolorum exercitationem amet labore.','2000-12-01 03:21:41'),(16,65,19,'A facilis voluptatem sunt temporibus quo et.','2006-04-22 02:36:22'),(17,84,83,'Harum ex harum et corporis error animi sed.','1998-10-15 05:25:26'),(18,86,64,'Ratione vitae adipisci veniam nemo.','1988-03-08 14:51:31'),(19,65,57,'Eos sint dicta rerum amet accusamus qui.','1983-03-06 06:45:19'),(20,1,62,'Consequatur facere dolorum porro impedit quis.','1979-01-03 19:00:24'),(21,86,7,'Explicabo in aut aut architecto incidunt ipsa aperiam mollitia.','2009-04-04 02:44:55'),(22,9,71,'Laboriosam error eum est eaque molestiae.','1980-04-21 15:08:05'),(23,28,60,'Odit est quis at laboriosam voluptatum ut vel.','1984-08-07 18:42:11'),(24,25,46,'Eum ut id neque odit perferendis explicabo eos.','2015-04-11 10:15:30'),(25,53,15,'Aliquid qui sapiente unde.','2002-03-20 10:56:53'),(26,64,35,'Ut omnis voluptatem veniam cum nulla iusto.','2007-10-29 22:53:50'),(27,24,71,'Et quia suscipit qui voluptate nesciunt.','1989-07-15 00:24:01'),(28,20,99,'Sed voluptas reiciendis aspernatur non inventore nobis sed.','1976-04-21 00:52:47'),(29,16,93,'Vel perferendis odio laudantium aut non magnam quia vero.','2009-09-17 12:18:00'),(30,51,27,'Ut libero repellat harum unde.','1991-06-28 21:56:51'),(31,92,15,'Repellendus sit nihil eos magni qui.','2009-03-06 18:40:49'),(32,46,76,'Qui officiis nobis laboriosam voluptatem delectus quam.','2002-02-22 17:33:47'),(33,97,31,'Qui fugit sit itaque neque ab aut fugiat.','1981-10-13 17:56:16'),(34,40,61,'Animi in magnam nobis nesciunt beatae et quibusdam quis.','1983-07-05 09:14:54'),(35,88,40,'Aut voluptatem sequi corrupti in.','2001-01-31 14:03:19'),(36,23,73,'Minus deleniti numquam eveniet et in.','2018-05-20 16:11:06'),(37,47,31,'Possimus aliquid eaque autem odit rerum et repellat eos.','1979-09-25 00:24:46'),(38,43,74,'Delectus asperiores impedit similique quasi voluptatibus officiis ut.','2002-06-16 10:19:14'),(39,91,68,'Earum ad quia ipsa non explicabo qui.','1980-01-12 04:17:09'),(40,20,44,'Et aspernatur a et impedit commodi occaecati.','1988-06-08 02:19:19'),(41,83,83,'Dolores optio tempora est et et et.','1976-08-16 20:11:30'),(42,78,6,'Ut libero minus dolor aut quas aperiam fugit qui.','1973-05-29 16:08:45'),(43,54,98,'Consectetur placeat dolorem rerum asperiores consequatur aut iste sint.','2008-05-21 17:17:22'),(44,5,69,'Non voluptatem sit recusandae quasi tempore laudantium fugiat.','1997-07-16 09:34:43'),(45,91,55,'Cum magnam debitis veritatis suscipit rerum cupiditate.','2008-09-06 09:34:15'),(46,96,83,'Mollitia quia accusamus nulla id qui qui eveniet.','2000-03-09 16:00:30'),(47,69,41,'Commodi totam error asperiores eos placeat nostrum.','1991-05-23 14:48:10'),(48,58,65,'Aut animi voluptatem asperiores veritatis et et est veniam.','1986-09-09 17:50:50'),(49,71,98,'Et fugiat nostrum aliquid nulla et.','2018-12-17 09:54:48'),(50,25,58,'Blanditiis est doloremque voluptas magni mollitia quia voluptas doloremque.','1994-04-11 13:26:54'),(51,37,48,'Facere voluptatem recusandae eum aut sed similique vitae necessitatibus.','1990-04-29 01:56:37'),(52,31,83,'Vel voluptatem aliquid voluptas et nisi enim.','2003-09-20 16:18:12'),(53,78,74,'Nobis aut consequatur ut et sed.','1982-10-07 06:15:41'),(54,57,68,'Recusandae ut sed a consequatur.','2005-01-24 07:52:09'),(55,42,76,'Rem quia illum voluptatum qui.','2013-07-12 05:24:27'),(56,12,25,'Aut non a accusantium ipsa ex natus.','1982-09-14 08:50:25'),(57,58,89,'Fuga dolore voluptatibus numquam incidunt voluptatem et.','1991-03-12 14:28:18'),(58,30,11,'Dolor dolores ratione pariatur ipsa quia a neque.','1988-08-04 14:24:39'),(59,87,35,'Fuga autem non quis perferendis.','2018-06-18 03:41:26'),(60,80,78,'Sed dolores unde ullam non esse officia.','2010-05-19 08:52:15'),(61,89,75,'Corporis quidem nostrum nobis eum rerum.','2004-11-20 18:54:09'),(62,60,58,'Recusandae vel placeat omnis asperiores cumque officia rem voluptas.','1991-08-03 05:06:31'),(63,16,17,'Labore laboriosam iste aliquam necessitatibus est blanditiis.','2012-11-07 00:04:24'),(64,22,86,'Exercitationem dicta ut aperiam et.','1995-07-28 02:08:16'),(65,15,47,'Corrupti quia sequi ab voluptates esse tempora.','1978-10-15 02:33:37'),(66,44,51,'Cupiditate eveniet animi quidem praesentium totam quod.','1980-12-11 20:16:17'),(67,94,75,'Qui tempore dolor eos doloribus quo qui.','1984-11-14 19:53:32'),(68,34,72,'Ipsa quo quo consequuntur consectetur.','1979-04-20 10:09:31'),(69,48,90,'Perferendis et doloremque sequi quisquam minima.','1977-01-31 14:04:22'),(70,40,89,'Ut ut accusantium laborum quisquam in qui pariatur.','1996-01-23 02:02:10'),(71,66,51,'Sint similique perspiciatis quas eius labore ea pariatur id.','2004-12-17 23:11:35'),(72,14,23,'Delectus molestiae voluptatem perspiciatis vel repellat.','1988-09-08 13:07:42'),(73,40,43,'Et minus qui nulla expedita ipsam qui et ipsam.','2002-12-06 14:09:05'),(74,34,26,'Quam est corrupti hic odio.','1971-11-25 02:30:41'),(75,78,14,'Facilis ratione doloribus voluptatem quo aut repellendus nobis.','1999-07-19 00:51:42'),(76,3,66,'Optio sint officiis quo ipsam saepe quo voluptas.','1983-05-31 04:46:50'),(77,89,63,'Necessitatibus quae quam blanditiis iste quos.','2008-11-26 17:15:05'),(78,24,4,'Tempore voluptas ipsa id dolor a sed odio iusto.','2004-03-17 19:14:48'),(79,80,45,'Libero dolores hic corrupti fugit aut.','1996-06-12 03:28:46'),(80,90,94,'Nobis totam omnis tempora.','2019-05-04 05:22:27'),(81,91,34,'Dolorem id incidunt consequatur quia.','1970-07-16 19:30:08'),(82,45,85,'Delectus molestiae libero dolorem et.','2012-02-05 08:18:37'),(83,8,78,'Tempora deleniti odit accusantium amet eos et.','2017-09-02 13:40:09'),(84,57,56,'Aut qui earum quia.','2018-02-28 17:54:35'),(85,68,96,'Et sequi ea dolores omnis voluptas mollitia.','2004-03-15 21:02:38'),(86,45,33,'Aliquid quis fugit tempore.','1982-06-27 09:12:29'),(87,46,58,'Ut numquam dolor repellat aliquam soluta nostrum ut.','2005-12-15 08:45:16'),(88,56,86,'Quis dignissimos aperiam cumque aut autem.','1978-04-12 16:17:19'),(89,1,90,'Vitae occaecati officiis quam aut labore excepturi ea.','2006-03-05 17:01:49'),(90,12,78,'Quibusdam veniam eaque et animi.','1978-02-03 04:03:57'),(91,3,15,'Dolorem consequatur sed ratione.','1986-11-05 12:36:31'),(92,44,92,'Dolorum et optio doloremque.','2001-07-20 12:21:00'),(93,77,67,'Nobis incidunt omnis asperiores ea.','2016-04-22 08:49:59'),(94,96,56,'Iusto sed ut architecto ducimus amet eligendi nihil beatae.','1986-05-25 12:51:37'),(95,11,85,'Praesentium eligendi id magni quia ullam delectus.','1988-09-13 02:21:23'),(96,49,2,'Harum est velit quia beatae.','1972-10-10 22:09:49'),(97,18,93,'Eum voluptatum itaque sed beatae sit ut maxime.','1990-01-07 05:41:18'),(98,87,26,'Qui ut inventore possimus molestias in.','2013-07-15 05:54:11'),(99,71,43,'Accusamus aut impedit sed est consequatur.','1984-12-03 01:40:59'),(100,81,38,'Iure distinctio incidunt molestiae non nam unde aut.','2007-12-25 17:43:14');
/*!40000 ALTER TABLE `messages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `photo_albums`
--

DROP TABLE IF EXISTS `photo_albums`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `photo_albums` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(245) NOT NULL,
  `decs` text,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_photo_albums_users1_idx` (`user_id`),
  CONSTRAINT `fk_photo_albums_users1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `photo_albums`
--

LOCK TABLES `photo_albums` WRITE;
/*!40000 ALTER TABLE `photo_albums` DISABLE KEYS */;
INSERT INTO `photo_albums` VALUES (1,'qui',NULL,1),(2,'dolores',NULL,2),(3,'iusto',NULL,3),(4,'et',NULL,4),(5,'similique',NULL,5),(6,'eos',NULL,6),(7,'tempore',NULL,7),(8,'quia',NULL,8),(9,'qui',NULL,9),(10,'dolores',NULL,10),(11,'neque',NULL,11),(12,'dolorem',NULL,12),(13,'ut',NULL,13),(14,'iste',NULL,14),(15,'dolores',NULL,15),(16,'ut',NULL,16),(17,'fuga',NULL,17),(18,'et',NULL,18),(19,'laudantium',NULL,19),(20,'occaecati',NULL,20),(21,'commodi',NULL,21),(22,'sint',NULL,22),(23,'dolorem',NULL,23),(24,'cum',NULL,24),(25,'illo',NULL,25),(26,'commodi',NULL,26),(27,'perferendis',NULL,27),(28,'in',NULL,28),(29,'sed',NULL,29),(30,'velit',NULL,30),(31,'nihil',NULL,31),(32,'aperiam',NULL,32),(33,'non',NULL,33),(34,'veniam',NULL,34),(35,'vel',NULL,35),(36,'asperiores',NULL,36),(37,'voluptatem',NULL,37),(38,'velit',NULL,38),(39,'quis',NULL,39),(40,'vel',NULL,40),(41,'ratione',NULL,41),(42,'ad',NULL,42),(43,'pariatur',NULL,43),(44,'eaque',NULL,44),(45,'et',NULL,45),(46,'ipsum',NULL,46),(47,'earum',NULL,47),(48,'odio',NULL,48),(49,'voluptatem',NULL,49),(50,'pariatur',NULL,50),(51,'enim',NULL,51),(52,'fuga',NULL,52),(53,'maiores',NULL,53),(54,'commodi',NULL,54),(55,'esse',NULL,55),(56,'sit',NULL,56),(57,'qui',NULL,57),(58,'beatae',NULL,58),(59,'velit',NULL,59),(60,'itaque',NULL,60),(61,'non',NULL,61),(62,'blanditiis',NULL,62),(63,'rerum',NULL,63),(64,'voluptatem',NULL,64),(65,'eaque',NULL,65),(66,'in',NULL,66),(67,'recusandae',NULL,67),(68,'aut',NULL,68),(69,'et',NULL,69),(70,'aut',NULL,70),(71,'minus',NULL,71),(72,'id',NULL,72),(73,'voluptatum',NULL,73),(74,'eos',NULL,74),(75,'sit',NULL,75),(76,'ex',NULL,76),(77,'nihil',NULL,77),(78,'asperiores',NULL,78),(79,'perspiciatis',NULL,79),(80,'magnam',NULL,80),(81,'vero',NULL,81),(82,'quae',NULL,82),(83,'sequi',NULL,83),(84,'quaerat',NULL,84),(85,'impedit',NULL,85),(86,'voluptates',NULL,86),(87,'sit',NULL,87),(88,'et',NULL,88),(89,'quo',NULL,89),(90,'dolores',NULL,90),(91,'quibusdam',NULL,91),(92,'autem',NULL,92),(93,'ab',NULL,93),(94,'adipisci',NULL,94),(95,'iure',NULL,95),(96,'voluptatem',NULL,96),(97,'quia',NULL,97),(98,'officiis',NULL,98),(99,'harum',NULL,99),(100,'voluptate',NULL,100);
/*!40000 ALTER TABLE `photo_albums` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `photos`
--

DROP TABLE IF EXISTS `photos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `photos` (
  `id` int NOT NULL,
  `album_id` int NOT NULL,
  `media_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_photos_photo_albums1_idx` (`album_id`),
  KEY `fk_photos_media1_idx` (`media_id`),
  CONSTRAINT `fk_photos_media1` FOREIGN KEY (`media_id`) REFERENCES `media` (`id`),
  CONSTRAINT `fk_photos_photo_albums1` FOREIGN KEY (`album_id`) REFERENCES `photo_albums` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `photos`
--

LOCK TABLES `photos` WRITE;
/*!40000 ALTER TABLE `photos` DISABLE KEYS */;
INSERT INTO `photos` VALUES (1,1,1),(2,2,2),(3,3,3),(4,4,4),(5,5,5),(6,6,6),(7,7,7),(8,8,8),(9,9,9),(10,10,10),(11,11,11),(12,12,12),(13,13,13),(14,14,14),(15,15,15),(16,16,16),(17,17,17),(18,18,18),(19,19,19),(20,20,20),(21,21,21),(22,22,22),(23,23,23),(24,24,24),(25,25,25),(26,26,26),(27,27,27),(28,28,28),(29,29,29),(30,30,30),(31,31,31),(32,32,32),(33,33,33),(34,34,34),(35,35,35),(36,36,36),(37,37,37),(38,38,38),(39,39,39),(40,40,40),(41,41,41),(42,42,42),(43,43,43),(44,44,44),(45,45,45),(46,46,46),(47,47,47),(48,48,48),(49,49,49),(50,50,50),(51,51,51),(52,52,52),(53,53,53),(54,54,54),(55,55,55),(56,56,56),(57,57,57),(58,58,58),(59,59,59),(60,60,60),(61,61,61),(62,62,62),(63,63,63),(64,64,64),(65,65,65),(66,66,66),(67,67,67),(68,68,68),(69,69,69),(70,70,70),(71,71,71),(72,72,72),(73,73,73),(74,74,74),(75,75,75),(76,76,76),(77,77,77),(78,78,78),(79,79,79),(80,80,80),(81,81,81),(82,82,82),(83,83,83),(84,84,84),(85,85,85),(86,86,86),(87,87,87),(88,88,88),(89,89,89),(90,90,90),(91,91,91),(92,92,92),(93,93,93),(94,94,94),(95,95,95),(96,96,96),(97,97,97),(98,98,98),(99,99,99),(100,100,100);
/*!40000 ALTER TABLE `photos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `profiles`
--

DROP TABLE IF EXISTS `profiles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `profiles` (
  `users_id` int NOT NULL,
  `gender` enum('m','f','x') NOT NULL,
  `birthday` date NOT NULL,
  `location` varchar(245) DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`users_id`),
  KEY `fk_profiles_users_idx` (`users_id`),
  CONSTRAINT `fk_profiles_users` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `profiles`
--

LOCK TABLES `profiles` WRITE;
/*!40000 ALTER TABLE `profiles` DISABLE KEYS */;
INSERT INTO `profiles` VALUES (1,'m','1986-09-02','25277 Orland Green\nNorth Abdulchester, RI 50114','2009-04-30 06:13:20'),(2,'x','2004-09-12','227 Ali Ville\nPort Edaville, TX 05892','1971-07-18 02:58:18'),(3,'x','1994-06-06','523 Hoppe Brooks\nMorarchester, KS 70962-3883','2017-12-15 04:14:24'),(4,'f','1982-05-22','401 King Light\nIssacville, SD 92531','2011-11-25 19:15:28'),(5,'m','1986-09-28','742 Reid Pike Suite 518\nLoramouth, MS 31618-9655','2003-04-26 21:37:14'),(6,'m','2019-09-11','67057 Karianne Shoal Suite 237\nMaeton, NC 60004-3250','1993-01-02 12:12:30'),(7,'m','1994-03-06','089 Greyson Common Suite 477\nPort Fridashire, ND 39348-3399','1997-06-18 00:10:27'),(8,'f','2019-02-22','408 Marjory Forge Apt. 666\nMayton, NE 09758-2008','2020-08-28 17:22:37'),(9,'x','2001-03-03','49421 Yost Ranch\nPort Prudenceville, FL 16943','1983-10-25 08:42:37'),(10,'f','1998-12-20','366 Howe Shoal\nLake Selmerberg, VA 60788-7870','1982-06-23 10:01:21'),(11,'x','1987-05-27','78112 Halie Port Suite 790\nRunolfssonborough, MI 74073','1975-02-22 07:47:58'),(12,'f','2015-01-05','9100 Bahringer Alley Apt. 428\nLockmanland, SC 93071-7317','1996-04-20 03:30:40'),(13,'m','2012-11-03','899 Willie Stream Suite 057\nNorth Pietroside, NJ 84368','1985-03-30 04:08:17'),(14,'m','2000-03-04','79362 Gutmann Meadow\nLake Easter, TX 23322-7047','1975-04-09 22:59:31'),(15,'f','2015-09-18','034 Conn Rue Apt. 438\nProhaskaport, IL 18374','2014-12-09 03:34:09'),(16,'x','2007-11-28','6668 Maribel Isle Suite 228\nMillermouth, KY 12942-4836','2008-09-05 21:31:02'),(17,'m','1979-09-09','491 Violet Meadows Apt. 067\nDarrelmouth, KS 07565-7015','1986-02-01 16:55:06'),(18,'x','2018-03-14','535 Bethel Trail\nNorth Hattie, MS 28108-8689','2010-05-29 18:02:04'),(19,'f','1971-08-17','175 Kertzmann Wall Suite 476\nWest Angelita, MT 38381-6471','1986-06-04 10:14:40'),(20,'f','1991-07-06','87178 Cassin Plaza Suite 801\nSouth Aracelyberg, KY 11210','1982-10-14 16:13:27'),(21,'f','1973-04-27','65544 Miguel Points\nLake Teaganbury, AK 91913','2020-07-29 14:09:57'),(22,'f','2005-06-28','18149 Ross Trail\nNatalieberg, MS 82852','1982-01-18 23:39:57'),(23,'m','2004-12-17','2090 Missouri Corner\nEdnabury, WV 89065','1975-12-13 01:04:12'),(24,'f','1980-07-21','258 Runolfsson Terrace Apt. 242\nHillsland, TX 89726-0061','1993-01-24 02:37:34'),(25,'x','1988-02-22','04236 Lowe Inlet Suite 769\nSouth Waldobury, VT 85808','2010-07-12 17:03:09'),(26,'x','1998-10-13','97328 Howe Square\nPort Judson, CA 69910','1991-11-29 15:22:06'),(27,'m','1986-09-09','71640 Kailee Knolls Apt. 468\nPort Hendersonburgh, NY 32479','1998-05-04 17:36:17'),(28,'f','1974-11-25','21487 Russel Terrace\nWest Gabetown, KS 58112-4112','1975-11-09 07:45:05'),(29,'x','2007-02-15','8424 Abner Square Suite 462\nLake Kelliebury, WV 46353','1973-06-30 18:05:29'),(30,'m','2006-02-18','714 London Camp Suite 095\nTodtown, NY 36803','1988-01-17 14:52:11'),(31,'x','1978-05-09','57849 Ernser Mount\nEast Gloria, CO 16462-9787','1977-08-02 08:08:56'),(32,'f','2001-12-25','185 Nadia Plain Suite 596\nKuvalisbury, FL 12466','1992-12-01 06:20:49'),(33,'x','2016-05-13','77619 Otha Ville\nEast Brooklynmouth, NV 13310','2014-01-05 11:28:58'),(34,'m','2001-08-19','85011 Bernier Via Suite 449\nHirtheland, OK 09462','2005-05-27 14:22:32'),(35,'f','1988-06-19','15918 Fisher Prairie\nSouth Cecilia, SC 30812-3810','2017-09-22 23:47:27'),(36,'m','2010-02-08','674 Robert Key\nWest Edisonland, MD 99218','2003-10-05 20:27:47'),(37,'f','1977-02-15','68117 Kyra Lights\nSouth Tyrell, MO 30428','2014-11-17 01:03:53'),(38,'f','1983-10-21','5489 Turcotte Loaf Suite 378\nPort Jay, NC 87963','1991-11-07 23:44:34'),(39,'f','2013-08-06','38190 Hand View\nNew Narciso, AR 38520','1972-04-09 12:07:55'),(40,'x','1999-10-01','2706 Bo Plaza Suite 132\nFadelland, VT 11792-7273','2013-04-21 09:02:16'),(41,'x','2011-06-30','996 Murazik Burg Apt. 969\nNew Ricardoside, AK 66620','2011-06-19 02:44:09'),(42,'m','1970-07-28','342 Gerhold Junctions\nPort Abdul, AZ 67884','2001-02-04 17:41:45'),(43,'f','2010-02-28','2995 Cartwright Circles\nWarrenside, MI 92733','1983-05-13 20:45:12'),(44,'f','1987-10-03','999 Graham Drive\nNew Katelin, NY 61508-7977','1978-11-11 18:14:18'),(45,'m','1992-03-13','85014 Meghan Island\nLake Wilford, KY 50754-3653','2004-10-15 02:52:54'),(46,'m','1978-02-28','3043 Okuneva Rapids Suite 626\nLake Richmond, MI 05756','1972-01-28 22:28:44'),(47,'m','1986-09-22','06865 Dayana Plaza Apt. 998\nLylatown, SD 40960-1234','2013-06-30 17:58:41'),(48,'m','2012-10-15','87045 Reece Plaza Suite 647\nEast Estefaniaside, OH 69104','1992-10-17 01:46:42'),(49,'f','1996-04-05','784 McClure Hollow Suite 823\nNew Abbigailchester, VT 54964','2018-06-07 16:49:29'),(50,'x','1990-01-06','8848 Walter Club Apt. 681\nWest Vincentfurt, AL 68960','1980-11-02 22:34:15'),(51,'f','2012-07-18','793 Cormier Pine\nLake Julianburgh, HI 36385','1978-08-14 07:54:18'),(52,'f','1984-07-07','528 Dariana Valley\nStarkchester, ND 57332-4357','1976-08-10 08:39:55'),(53,'m','2018-03-31','2817 Kaitlyn Mall\nSouth Chesleyborough, KY 09421-7239','2001-08-25 17:55:32'),(54,'f','1992-05-11','177 Gutkowski Rapids Suite 350\nManteville, VT 85704-6149','1998-07-28 22:04:38'),(55,'f','2018-05-26','7439 Justyn Ferry\nTysonland, IL 84887','1983-04-12 17:01:37'),(56,'m','2007-04-30','15703 Bethel Ridges Apt. 465\nWest Cristian, MT 78267-1727','2011-06-26 20:27:46'),(57,'x','2009-12-20','5687 Elvis Loaf Apt. 068\nLake Juanita, LA 97297-0213','1996-06-10 01:11:29'),(58,'x','1993-09-30','65589 Nayeli Center Suite 385\nJacobsfort, IN 54726-1757','1972-09-21 10:33:35'),(59,'x','2016-07-16','645 Myrna Isle Apt. 094\nWest Oda, MN 92445','2015-04-02 03:01:16'),(60,'m','2013-05-22','16110 Arvilla Crescent Apt. 356\nWest Marshall, AK 60712-3411','2003-12-18 05:26:15'),(61,'x','2000-06-05','924 Walsh Isle\nNorth Elouisefurt, WV 60028-6029','1971-06-07 08:33:41'),(62,'x','1993-10-30','754 Ziemann Oval Suite 351\nSouth Allyfort, MT 43657-7838','2005-10-18 10:37:30'),(63,'f','1975-10-02','0648 Baylee Falls Suite 426\nSouth Asha, WV 56290-8077','1995-07-25 18:51:17'),(64,'f','2015-12-01','015 Maxine Mountains\nCrawfordborough, UT 98350-0849','1991-01-03 12:20:26'),(65,'f','1971-03-12','5670 Conroy Circle Apt. 502\nFraneckimouth, KY 36648','1990-07-21 11:29:01'),(66,'f','1977-05-10','122 Beverly Underpass\nPort Yeseniamouth, CO 45410-6267','1973-09-21 03:42:39'),(67,'x','1989-03-19','5839 Lindgren Greens Suite 710\nLake Willaville, NM 98712','1998-06-11 05:03:59'),(68,'x','2003-05-26','874 O\'Hara Throughway\nWest Maximilianfurt, PA 86049','2006-10-30 14:04:50'),(69,'m','1982-05-08','188 Jude Light Suite 152\nLake Shirleyfurt, IN 75496-3945','1993-05-27 02:42:37'),(70,'x','1973-01-04','57537 Beaulah Place Suite 270\nPort Siennatown, VT 97320-0401','1995-10-28 17:46:07'),(71,'x','1978-05-01','5310 Jacobi Gardens Apt. 006\nNehatown, HI 33212-1479','1991-07-07 00:16:28'),(72,'x','1991-03-29','34384 Ida Field Suite 481\nAmbroseville, HI 59902','1998-12-30 18:26:42'),(73,'x','2002-09-01','852 Schmeler Walks Apt. 940\nNew Orville, MT 65900','2006-05-29 11:17:29'),(74,'m','2013-12-29','6616 Michael Square\nNorth Leannport, MD 65036-2067','2019-07-07 00:21:29'),(75,'f','2015-01-05','2624 Stroman Summit\nNew Efrenport, OH 85874-2779','1987-01-02 05:39:09'),(76,'x','2017-05-05','84897 Lina Knolls Suite 663\nPort Edgar, SD 82408-7648','1999-11-09 01:51:24'),(77,'x','2003-05-26','8658 Aric Park\nEffertzhaven, AZ 06106','1985-12-09 21:23:17'),(78,'x','1970-07-05','5626 Toy Stravenue Apt. 106\nNew Stellahaven, VA 99787','1970-10-16 05:32:08'),(79,'x','1985-11-10','9664 Prince Forks Apt. 560\nLockmanfort, CA 84670-1828','1989-05-02 17:39:46'),(80,'x','2011-12-02','696 Marcelle Plains Suite 256\nWest Brandyn, MA 65020','1980-12-21 19:33:58'),(81,'x','1998-03-21','045 Cristal Junctions Apt. 584\nWhiteborough, OH 40758','2000-01-11 16:04:44'),(82,'f','1981-01-28','913 Beatty Courts\nLlewellynton, MI 12758-7150','1978-10-08 07:55:07'),(83,'x','1977-02-16','27873 Dianna Mission\nGilbertobury, HI 38867-5786','2008-05-09 09:00:31'),(84,'f','1997-01-01','7108 Lavern Camp Apt. 486\nLake Felicitybury, NV 54856-1215','2002-11-25 11:25:07'),(85,'f','1975-11-19','9755 Chanel Hollow\nNicolasmouth, NM 83278-2563','2016-07-06 10:49:00'),(86,'m','1976-09-14','1893 Rutherford Forge\nLake Oscarland, TX 67906-4152','2011-07-30 22:22:22'),(87,'m','1998-08-20','4330 Bode Field Suite 417\nDevanshire, SD 55374-1262','1992-06-14 09:41:53'),(88,'x','2002-03-17','6770 Nickolas Circle Apt. 196\nSouth Peggieport, CT 94719-5316','1975-08-20 20:26:09'),(89,'m','2008-08-13','2014 Hamill Circles\nDavisville, KY 06894-4955','1996-02-28 19:39:44'),(90,'x','1970-10-26','22303 Griffin Harbor\nSouth Johnnychester, WV 56128','2004-02-12 00:12:35'),(91,'x','1979-04-21','765 Edwin Pike Suite 557\nAmymouth, CT 15601','2000-11-29 08:38:38'),(92,'x','2006-07-12','420 Heaney Rest\nTristonshire, TN 68774','1970-08-24 10:33:45'),(93,'m','2017-05-02','161 Shirley Cape Suite 825\nEast Santinofort, MT 29385','1983-07-28 02:45:47'),(94,'m','2015-12-17','579 Kirstin Inlet\nNew Mekhichester, MI 90224-2342','2013-02-03 12:42:10'),(95,'m','2004-06-14','493 Cartwright Drive\nSouth Mariana, DE 16921-4809','2013-03-21 20:24:54'),(96,'m','2019-10-08','843 Predovic Mill\nNorth Helene, NE 81216-9345','1975-10-23 23:08:55'),(97,'m','1988-08-02','62747 Holly Vista\nKreigertown, IL 67028','2003-02-24 19:36:17'),(98,'f','1971-12-16','11111 Toy Villages\nWest Mariam, OR 26424-5225','1973-08-23 20:40:03'),(99,'m','2001-03-11','792 Mike Junction\nO\'Connellland, AK 71070','2004-04-18 13:01:45'),(100,'m','2015-04-14','04939 Pearlie Common Apt. 705\nKohlershire, KY 10770','2009-06-02 21:04:45');
/*!40000 ALTER TABLE `profiles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `firstname` varchar(245) NOT NULL COMMENT 'имя',
  `lastname` varchar(245) NOT NULL COMMENT 'фамилия',
  `email` varchar(245) NOT NULL,
  `phone` bigint NOT NULL COMMENT 'телефон',
  `password_hash` char(64) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email_UNIQUE` (`email`),
  UNIQUE KEY `phone_UNIQUE` (`phone`),
  KEY `firstname_lastname_idx` (`lastname`,`firstname`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='пользователи';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Janessa','Schmidt','stamm.warren@example.com',79187124812,'5f947c792424d218f440e529ebfed2ca315d24b6'),(2,'Beulah','Stanton','coberbrunner@example.net',79632062566,'48d5c7f5f1fcf54274f7191434489a3024004a4a'),(3,'Briana','Raynor','weissnat.maida@example.net',79816702452,'a1a6ff018e51aab4be58eec0af63fe4235666c98'),(4,'Carson','Gibson','felipa.frami@example.net',79545349316,'bd762aad8ccf1bf9ebd6214cb89d932f79af1cb9'),(5,'Candelario','Weissnat','little.wava@example.net',79451045675,'aad697a8ef7939e241348942b93ff0df5f7c5c1f'),(6,'Adell','Heathcote','glennie37@example.com',79415305931,'4f8fd97c35702b5ab3a969c8b3b21d0e4c3a46d7'),(7,'Ezequiel','Trantow','mraz.jeramy@example.net',79029276572,'253b2d8187cc3da2161402942f2de93e39349600'),(8,'Teagan','Purdy','ebony.zieme@example.com',79020601060,'362e2dbf0021d69845e3bf4d114901b90eeda201'),(9,'Dean','Skiles','edwardo.powlowski@example.org',79792367791,'44b8da46ec5a18f4dc22d4eb93438197cc2fd69e'),(10,'Stone','Medhurst','vstehr@example.com',79346271367,'3031fff19cde5f840cf7f88a3ccc7bfaea25a393'),(11,'Tristin','Okuneva','brigitte03@example.org',79744606306,'15c97b9ee15203def5181b8a681d903d107e9f2c'),(12,'Jason','Sanford','isabelle21@example.com',79613959910,'5dc37db42230a3d17aa13960bd17f87599c7f9f4'),(13,'Eveline','Dach','ashtyn73@example.com',79249413749,'37b94e77bdf85509760dc80eea09c95f88ba85b9'),(14,'Casey','Macejkovic','maryse.ernser@example.net',79916728684,'bb9538f68fe0643b396548a3b81b1492cca515df'),(15,'Fritz','Ondricka','gspencer@example.net',79640261323,'ee4ae7ab8497782276057f1404cc31a749021160'),(16,'Paula','Heidenreich','brooke.muller@example.net',79325267805,'48306516d055b17e945b062f0caf379055f4e3af'),(17,'Eve','Murazik','beverly37@example.org',79859284932,'b66ade4f0edb2ebebd4f8c179c9010481e7fbd9f'),(18,'Bo','Greenholt','hjacobson@example.org',79859197131,'c0d849657dd65a99e9d501f0b60d82cbfc54beb2'),(19,'Clara','Hodkiewicz','vkautzer@example.com',79208782505,'e0373e1675cedacec2bd8c57a86c21f4874d7b20'),(20,'Brown','Morissette','werner18@example.net',79328176337,'c92ec3ef5d06b0cfd7a2d888a9ac39d9c7b30cb0'),(21,'Dwight','Mertz','zoie.wiegand@example.org',79387449890,'07643d52ffc80960443e272f206f6231fdd7b9f1'),(22,'Vicenta','Stoltenberg','nikko.grant@example.net',79420667658,'4d55ed5a1b804bb4dc10fc8ecd88f7d686fd4d18'),(23,'Aglae','Corwin','hand.annie@example.net',79003602954,'d8e0789ccfeb20ae10303f58dcca4652dbea4e20'),(24,'Katherine','Bruen','bmarquardt@example.net',79873357359,'ca612c313967e465d39f4ab5cf9bebaab738a0a6'),(25,'Jordon','Dooley','adele80@example.org',79706667990,'aa796b2928796e3d9888c797acfe0123f4e6d043'),(26,'Travis','Friesen','camylle52@example.com',79057441160,'b1393658ca04de9948de8ef1c0dd4b7114f48a6e'),(27,'Frances','Braun','herminia38@example.com',79338356202,'98b4400a7d977c638d38ada636908c124860d8fe'),(28,'Eli','Hudson','corkery.dee@example.net',79377052085,'54d4b374a4ac6f662bf284c1f3143ef94335fd1d'),(29,'Ashlee','Kertzmann','libby88@example.com',79518902560,'358854181c4733e12ef118efc19fa541aaecd21f'),(30,'Alejandrin','O\'Conner','crawford08@example.com',79448183423,'4022c7bef301312244766816a85454049015b3b5'),(31,'Katrine','Spinka','kari72@example.org',79651728239,'78000ad4a5b6738dfc12be56914f627c9344f451'),(32,'Major','Willms','luna28@example.com',79741627682,'87671a87804f8cd991e1da4d68946c219c0a05f7'),(33,'Jett','Kozey','kmcglynn@example.org',79919431718,'abc3977d8543d21a014aa814752e036a424a2bde'),(34,'Emmet','Okuneva','hagenes.christophe@example.com',79080078296,'c2c0fdf72b44173d8eb8f9fae754f46a2422f36e'),(35,'Joesph','Tromp','sgaylord@example.net',79978372330,'73a417d4f2349b6c657d779aeffcfb00d4e12fe2'),(36,'Kolby','Klocko','zkiehn@example.org',79797646555,'60366a99bece07ed114826d2cebd9573bef5a6f8'),(37,'Chaim','Fadel','abbigail.runte@example.com',79180888581,'3d11f6f9f2de3f120253832aaa4f087df678e4fc'),(38,'Gaetano','Considine','bettie.walter@example.com',79351724752,'9bc3fd997790d3a88eb70ab713991f9d16a41955'),(39,'Elisa','Kub','alva44@example.net',79467906287,'d9aad27bf48af20b2657e61fa8e9c60d360b41d5'),(40,'Eugene','Gibson','wiza.franz@example.com',79578803818,'33f156738a5956d98433c86eb0a294b74ced0017'),(41,'Maud','Armstrong','pfeffer.garrett@example.org',79599946707,'26fea62b03f21de3e6eeb50ebb7846db136e9c62'),(42,'Rebeca','Dare','easton85@example.org',79097001760,'77d41436668d78fc5eaa879f74f74558690e5d6f'),(43,'Murray','Kihn','heller.johnpaul@example.net',79722118176,'2a356cf75d50ab8e8aca16277c997746c177d83e'),(44,'Horacio','Jerde','ludwig21@example.org',79240394648,'6e3601a9421e9eac9951c1b46f626810eadc2879'),(45,'Valerie','Larson','shawn27@example.net',79281104556,'560e01b293ee8f35ab564110508036cbed9f22aa'),(46,'Toney','Nienow','sharon24@example.com',79426136356,'f63a49e7f681a718d4837b86e9cf1a53aabe57fe'),(47,'Merl','Brekke','altenwerth.shanna@example.com',79257629221,'32450428b21084d3e51071b36fcae991200e6a95'),(48,'Andrew','Howe','ctromp@example.org',79388289389,'82362fe1954e9bbb776707a0f9733c33e9d7e019'),(49,'Kaleigh','Kuhlman','fconnelly@example.org',79173645841,'32049743bbd06bd43fa8ec2dde128817b4ecd576'),(50,'Lexie','Dickinson','jaclyn68@example.com',79959488777,'9c5da87727f938a53f6f658a60f9a72cf9eb7cc5'),(51,'Abel','O\'Reilly','darron08@example.net',79901592003,'c3d27bb98503d7a152fb1f7c4f67d279f33b57a0'),(52,'Vicenta','Wehner','huels.karianne@example.net',79767526492,'b20cea256bf0ae6c4474d6a1f4e75985a89c6006'),(53,'Callie','Borer','ldeckow@example.org',79721552402,'8f96b4906ce2a73baf2daa99140a371286cb9831'),(54,'Emilio','Hermann','shields.lera@example.net',79820769128,'dc9e10d5d50ec34f3ca38ff5a9d945550f6966af'),(55,'Wade','Koelpin','kamryn80@example.org',79024814003,'e064845d8d49f5b4eab9fcba7ea42e63972668af'),(56,'Aurelia','Breitenberg','marc.klein@example.com',79065360942,'924255b2dc4bd9d18386e17e0c8aae30df5df328'),(57,'Mozell','Rempel','jaqueline.cormier@example.org',79528202671,'6df5731eb94f30aa866e67b9b561f60939aa6e6a'),(58,'Kristofer','Collier','finn54@example.org',79985671188,'5be027348dc00080762d8f9e007e1a400e58706d'),(59,'Gerry','Armstrong','raven47@example.net',79596470228,'b1cd1b298407b9be07ea504149cebeee264ccdd1'),(60,'Leanna','Gaylord','crona.alejandra@example.com',79842494476,'2eb7dc8ca7be2a1dbc4bc6e87a586c3e139c7316'),(61,'Christina','Price','angelo03@example.org',79191888395,'ccd12e41fee2429eda49dd502ff0c95733e0e0a3'),(62,'Lonzo','Harris','yreilly@example.org',79504852720,'10d3403a066cecef7fbe2835654a44b45ab1e829'),(63,'Oren','Corwin','ymayert@example.com',79074261178,'5299889814e198fb677dccaaafd9eec5d88212c9'),(64,'Hazel','Hilpert','wlittle@example.org',79922623124,'546eb4536391da471c66e7c33e6d93146f88a24c'),(65,'Wilbert','Pfannerstill','rosamond.balistreri@example.com',79438554360,'0273d39997bed6502f2e011bc6b427bf23f3e697'),(66,'Fermin','Johns','hromaguera@example.com',79209579924,'a042833cbf2accc2e2d3f4cecef2ed5693af1abf'),(67,'Remington','Abbott','sage.dach@example.org',79614446418,'65daad2d7736f3fbacc2d2c2fa3f5780db282f7e'),(68,'Dejon','Romaguera','lavinia.reinger@example.net',79290154382,'2f984643c0e01ddac88bbd057c291e2becfe3b18'),(69,'Catalina','Kshlerin','marvin.sydnee@example.org',79755326275,'53e36a84c5007e6bb169866508b143e2e601c869'),(70,'Malvina','Christiansen','hassie.ziemann@example.net',79712789671,'310d57a7085c00b74f80034a96d000cce069a578'),(71,'Allie','Wolf','qhilll@example.com',79439524007,'72b39210411c3bc8568872269d08dca3b217ccc6'),(72,'Elyssa','Moore','erica.white@example.net',79422991763,'122bede7117a08dd6eaab0950bea53b196785397'),(73,'Trace','Huels','jamil95@example.net',79545247878,'171c794d76039f23b20b19b6e50708b676ad2d65'),(74,'Karianne','Fay','rtillman@example.com',79090727533,'463948a981e2b401e2ae64c46f159c0d5842ec79'),(75,'Patrick','Hudson','xjacobi@example.org',79343230728,'4efc0d1826faf24e92ae1c2c5c1e1ef82d7a7aa5'),(76,'Alta','Donnelly','reinger.mallory@example.com',79614242985,'174ba097fd1706340e7b83c91dc8c2fd9bb9919a'),(77,'Dell','Macejkovic','alize.hammes@example.org',79278233366,'2ede529171c44d7a83b8b5a023dd527c745fdcf8'),(78,'Sheila','Williamson','wlindgren@example.org',79122043069,'81b1ccde1283e5b793a60883f12bc2a788950894'),(79,'Margarete','Gusikowski','kraig.funk@example.com',79539105865,'788b2b882439e03d6db270eceda3eb8b9f05e184'),(80,'Devyn','Beier','javier.torp@example.com',79815638029,'da7208b4cfb6c34d17fd0e1a48a1513f1b48c56a'),(81,'Eldred','Kuhn','freeda55@example.net',79743253609,'9645ddef973343c56beb4357fc8fc8e51d2959aa'),(82,'Claud','Beahan','adams.moses@example.com',79786985526,'a6e2b23ea0886bf1d9bacdac99dad778e14e74c2'),(83,'Maude','Wunsch','romaguera.carolanne@example.net',79286153238,'79752afe6908f20ce9ebeb3bac8a61f6390d0a13'),(84,'Kennith','Renner','barney.stracke@example.net',79572868105,'7ce13180791b0aed1b356b36e3bf66dd0f775925'),(85,'Cruz','Hodkiewicz','toy.corine@example.com',79614760298,'958be2dd9bb7f317052a916758996de87db947b8'),(86,'Sophie','McClure','kristofer.considine@example.net',79388625656,'51820c4bcf0f4d07579613d535918e84272c810b'),(87,'Jannie','Kub','wschinner@example.com',79491113033,'b54cd3669c5305d20400c34b6012e9be08779e1b'),(88,'Demarco','McClure','lola96@example.org',79593576352,'1b015cb3642b9641cd41f6f2f9792d1c4874abd7'),(89,'Newton','Quigley','jhoppe@example.org',79274819669,'7f20e7c5ac8f3578e0842745c6f907285339ff03'),(90,'Verla','Veum','elyse82@example.net',79926248667,'5cfba5f36f94a556ed32dce2b9b89f146d77fd70'),(91,'Jordyn','Collier','gruecker@example.org',79738319114,'db6b9c1fbce13d6ca6f3963465965b8c1537e141'),(92,'Lolita','Prohaska','marley35@example.com',79005412443,'44b256ebccfd0f2889444a87bf4ce3b345436e86'),(93,'Euna','Baumbach','warren29@example.org',79443781644,'5f01134cccd460b0e84edd7e2140940bc81f4bd4'),(94,'Lina','Yost','grimes.phoebe@example.com',79870905104,'9fad012841e7dbb12522272eb71a88cc433877cf'),(95,'Karine','Witting','camryn49@example.net',79111691938,'1cddfa79c0e94fd2b4b9d9eba0b67194c5ab4ced'),(96,'Westley','Ankunding','wilkinson.jaclyn@example.org',79456373614,'ee02d9801bef01316ada1b765dc121259efe188d'),(97,'Darien','Gottlieb','haley.abner@example.net',79589756279,'b13c1361a106bbd78448db1891c684d1c1dae4f0'),(98,'Vernie','Pacocha','darlene.murphy@example.org',79285735995,'93bc3118a8133568ed62848731d5536938c7aacf'),(99,'Rebeka','Toy','gutmann.wyman@example.net',79866189245,'23f0b3baf2419433d82dd0f38288bc11745cb609'),(100,'Kiera','McGlynn','adela.volkman@example.net',79926931031,'e901cff050f5f742ad5cf7672bd78629e21282a5');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_communities`
--

DROP TABLE IF EXISTS `users_communities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users_communities` (
  `community_id` int NOT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`community_id`,`user_id`),
  KEY `fk_users_communities_users1_idx` (`user_id`),
  KEY `fk_users_communities_communities1_idx` (`community_id`),
  CONSTRAINT `fk_users_communities_communities1` FOREIGN KEY (`community_id`) REFERENCES `communities` (`id`),
  CONSTRAINT `fk_users_communities_users1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_communities`
--

LOCK TABLES `users_communities` WRITE;
/*!40000 ALTER TABLE `users_communities` DISABLE KEYS */;
INSERT INTO `users_communities` VALUES (2,1),(9,1),(4,3),(1,4),(9,4),(2,5),(9,5),(1,6),(5,7),(2,9),(7,10),(2,12),(6,12),(8,12),(7,13),(4,15),(5,15),(7,16),(8,16),(5,17),(4,18),(5,19),(9,19),(2,22),(7,23),(8,23),(1,24),(2,24),(9,24),(2,25),(5,26),(3,29),(3,30),(7,30),(10,31),(10,33),(8,34),(9,34),(3,35),(4,35),(1,36),(6,36),(2,37),(3,37),(8,38),(5,40),(9,42),(10,43),(7,45),(1,46),(8,47),(10,48),(1,49),(3,49),(10,49),(2,51),(6,51),(8,53),(6,54),(6,56),(8,57),(3,60),(4,61),(6,64),(3,70),(7,70),(4,72),(10,73),(6,76),(9,78),(9,79),(8,80),(2,82),(5,84),(1,87),(6,87),(10,87),(8,88),(1,89),(10,89),(1,90),(5,92),(10,92),(6,93),(9,93),(7,94),(3,95),(4,95),(7,95),(6,96),(7,96),(1,97),(3,97),(5,97),(4,98),(5,99),(10,100);
/*!40000 ALTER TABLE `users_communities` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-10-05  9:17:16
