-- MySQL dump 10.13  Distrib 8.0.43, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: finaldb
-- ------------------------------------------------------
-- Server version	8.0.42

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
-- Table structure for table `champion`
--

DROP TABLE IF EXISTS `champion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `champion` (
  `champion_id` int NOT NULL AUTO_INCREMENT,
  `champ_name` varchar(100) NOT NULL,
  `nickname` varchar(100) DEFAULT NULL,
  `release_date` date DEFAULT NULL,
  `last_changed` varchar(20) DEFAULT NULL,
  `blue_essence` int DEFAULT NULL,
  `rp` int DEFAULT NULL,
  `difficulty_id` int DEFAULT NULL,
  `range_type_id` int DEFAULT NULL,
  `resource_type_id` int DEFAULT NULL,
  `base_hp` int DEFAULT NULL,
  `base_mana` int DEFAULT NULL,
  PRIMARY KEY (`champion_id`),
  KEY `difficulty_id` (`difficulty_id`),
  KEY `range_type_id` (`range_type_id`),
  KEY `resource_type_id` (`resource_type_id`),
  CONSTRAINT `champion_ibfk_1` FOREIGN KEY (`difficulty_id`) REFERENCES `difficulty` (`difficulty_id`),
  CONSTRAINT `champion_ibfk_2` FOREIGN KEY (`range_type_id`) REFERENCES `rangetype` (`range_type_id`),
  CONSTRAINT `champion_ibfk_3` FOREIGN KEY (`resource_type_id`) REFERENCES `resourcetype` (`resource_type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=169 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `champion`
--

LOCK TABLES `champion` WRITE;
/*!40000 ALTER TABLE `champion` DISABLE KEYS */;
INSERT INTO `champion` VALUES (1,'Aatrox','The darkin blade','2013-06-13','V14.14',4800,880,14,1,1,650,0),(2,'Ahri','The nine-tailed fox','2011-12-14','V14.18',3150,790,15,2,2,590,418),(3,'Akali','The rogue assassin','2010-05-11','V14.18',3150,790,16,1,3,600,200),(4,'Akshan','The rogue sentinel','2021-07-22','V14.14',4800,880,17,2,2,630,350),(5,'Alistar','The minotaur','2009-02-21','V14.16',1350,585,18,1,2,685,350),(6,'Amumu','The sad mummy','2009-06-26','V14.9',450,260,19,1,2,685,285),(7,'Anivia','The cryophoenix','2009-07-10','V13.22',3150,790,17,2,2,550,495),(8,'Annie','The dark child','2009-02-21','V14.4',450,260,19,2,2,560,418),(9,'Aphelios','The weapon of the faithful','2019-12-11','V14.14',4800,880,16,2,2,580,348),(10,'Ashe','The frost archer','2009-02-21','V14.12',450,260,19,2,2,640,280),(11,'Aurelion Sol','The star forger','2016-03-24','V14.15',4800,880,17,2,2,620,530),(12,'Aurora','The witch between worlds','2024-07-17','V14.18',7800,975,14,2,2,607,475),(13,'Azir','The emperor of the sands','2014-09-16','V14.18',4800,880,16,2,2,550,320),(14,'Bard','The wandering caretaker','2015-03-12','V14.15',4800,880,14,2,2,630,350),(15,'Bel\'veth','The empress of the void','2022-06-09','V14.18',3150,790,18,1,4,610,60),(16,'Blitzcrank','The great steam golem','2009-09-02','V14.13',1350,585,18,1,2,600,267),(17,'Brand','The burning vengeance','2011-04-12','V14.14',450,260,18,2,2,570,469),(18,'Braum','The heart of the freljord','2014-05-12','V14.9',3150,790,18,1,2,610,311),(19,'Briar','The restrained hunger','2023-09-14','V14.9',6300,975,15,1,5,590,0),(20,'Caitlyn','The sheriff of piltover','2011-01-04','V14.11',450,260,14,2,2,580,315),(21,'Camille','The steel shadow','2016-12-07','V14.15',4800,880,16,1,2,670,339),(22,'Cassiopeia','The serpent\'s embrace','2010-12-14','V14.16',4800,880,15,2,2,630,350),(23,'Cho\'gath','The terror of the void','2009-06-26','V14.14',1350,585,19,1,2,644,270),(24,'Corki','The daring bombardier','2009-09-19','V14.18',3150,790,15,2,2,640,350),(25,'Darius','The hand of noxus','2012-05-23','V14.9',450,260,18,1,2,652,263),(26,'Diana','Scorn of the moon','2012-08-07','V14.9',450,260,18,1,2,640,375),(27,'Dr. mundo','The madman of zaun','2009-09-02','V14.15',450,260,19,2,2,675,361),(28,'Draven','The glorious executioner','2012-06-06','V14.11',4800,880,14,1,4,613,0),(29,'Ekko','The boy who shattered time','2015-05-29','V13.16',3150,790,15,1,2,655,280),(30,'Elise','The spider queen','2012-10-26','V14.12',4800,880,15,2,2,650,324),(31,'Evelynn','Agony\'s embrace','2009-05-01','V14.11',1350,585,17,1,2,642,315),(32,'Ezreal','The prodigal explorer','2010-03-16','V14.15',1350,585,15,2,2,600,375),(33,'Fiddlesticks','The ancient fear','2009-02-21','V14.14',1350,585,17,2,2,650,500),(34,'Fiora','The grand duelist','2012-02-29','V14.9',4800,880,15,1,2,620,300),(35,'Fizz','The tidal trickster','2011-11-15','V14.2',1350,585,15,1,2,640,317),(36,'Galio','The colossus','2010-08-10','V14.8',3150,790,18,1,2,632,500),(37,'Gangplank','The saltwater scourge','2009-08-19','V14.13',3150,790,16,1,2,630,280),(38,'Garen','The might of demacia','2010-04-27','V14.9',450,260,19,1,4,690,0),(39,'Gnar','The missing link','2014-08-14','V14.18',4800,880,17,2,6,540,100),(40,'Gragas','The rabble rouser','2010-02-02','V14.13',3150,790,15,1,2,640,400),(41,'Graves','The outlaw','2011-10-19','V14.13',4800,880,15,2,2,625,325),(42,'Gwen','The hallowed seamstress','2021-04-15','V14.9',4800,880,18,1,2,620,330),(43,'Hecarim','The shadow of war','2012-04-18','V14.14',4800,880,18,1,2,625,280),(44,'Heimerdinger','The revered inventor','2009-10-10','V14.11',3150,790,17,2,2,558,385),(45,'Hwei','The visionary','2023-12-05','V14.18',6300,975,14,2,2,580,480),(46,'Illaoi','The kraken priestess','2015-11-24','V14.9',3150,790,17,1,2,656,350),(47,'Irelia','The blade dancer','2010-11-16','V14.15',3150,790,16,1,2,590,350),(48,'Ivern','The green father','2016-10-05','V14.18',4800,880,17,2,2,630,450),(49,'Janna','The storm\'s fury','2009-09-02','V14.9',1350,585,19,2,2,570,360),(50,'Jarvan Iv','The exemplar of demacia','2011-03-01','V14.18',3150,790,18,1,2,640,300),(51,'Jax','Grandmaster at arms','2009-02-21','V14.18',1350,585,18,1,2,665,339),(52,'Jayce','The defender of tomorrow','2012-07-07','V14.18',4800,880,17,1,2,590,375),(53,'Jhin','The virtuoso','2016-02-01','V14.8',4444,880,17,2,2,655,300),(54,'Jinx','The loose cannon','2013-10-10','V14.18',3150,790,19,2,2,630,260),(55,'K\'sante','The pride of nazumah','2022-11-02','V14.15',4800,880,18,2,2,640,345),(56,'Kai\'sa','Daughter of the void','2018-03-07','V14.8',1350,585,15,2,2,600,300),(57,'Kalista','The spear of vengeance','2014-11-20','V14.13',4800,880,17,2,2,630,374),(58,'Karma','The enlightened one','2011-02-01','V14.13',3150,790,18,2,2,620,467),(59,'Karthus','The deathsinger','2009-06-12','V14.15',3150,790,18,1,2,646,400),(60,'Kassadin','The void walker','2009-08-07','V14.10',3150,790,15,1,4,672,0),(61,'Katarina','The sinister blade','2009-09-19','V14.16',3150,790,16,1,2,670,330),(62,'Kayle','The righteous','2009-02-21','V14.9',4800,260,17,1,2,655,410),(63,'Kayn','The shadow reaper','2017-07-12','V14.7',3150,790,15,2,3,580,200),(64,'Kennen','The heart of the tempest','2010-04-08','V14.13',4800,880,15,1,2,643,327),(65,'Kha\'zix','Kha\'zix the voidreaver','2012-09-27','V14.11',4800,880,15,2,2,610,300),(66,'Kindred','The eternal hunters','2015-10-14','V14.14',4800,880,14,1,7,410,100),(67,'Kled','The cantankerous cavalier','2016-08-10','V14.9',4800,880,17,2,2,635,325),(68,'Kog\'maw','Kog\'maw the mouth of the abyss','2010-06-24','V14.14',4800,880,18,1,2,625,320),(69,'LeBlanc','The deceiver','2010-11-02','V14.14',3150,790,14,2,2,598,400),(70,'Lee Sin','Sin the blind monk','2011-04-01','V14.14',1350,585,16,1,3,645,200),(71,'Leona','The radiant dawn','2011-07-13','V14.18',450,260,18,1,2,646,302),(72,'Lillia','The bashful bloom','2020-07-22','V14.18',4800,880,16,1,2,605,410),(73,'Lissandra','The ice witch','2013-04-30','V14.18',4800,880,15,2,2,620,475),(74,'Lucian','The purifier','2013-08-22','V14.16',1350,585,18,2,2,641,320),(75,'Lulu','The fae sorceress','2012-03-20','V14.18',4800,880,18,2,2,595,350),(76,'Lux','The lady of luminosity','2010-10-19','V14.10',450,260,18,2,2,580,480),(77,'Malphite','Shard of the monolith','2009-09-02','V14.18',450,260,19,1,2,644,280),(78,'Malzahar','The prophet of the void','2010-06-01','V14.9',4800,880,19,2,2,580,375),(79,'Maokai','The twisted treant','2011-02-16','V14.18',4800,880,19,1,2,635,375),(80,'Master Yi ','Yi the wuju bladesman','2009-02-21','V14.12',450,260,19,1,2,669,251),(81,'Milio','The gentle flame','2023-03-23','V14.14',6300,975,19,2,2,560,365),(82,'Miss Fortune ','Fortune the bounty hunter','2010-09-08','V14.18',450,260,19,2,2,640,300),(83,'Mordekaiser','The iron revenant','2010-02-24','V14.15',1350,585,17,1,8,645,100),(84,'Morgana','The fallen','2009-02-21','V14.18',1350,585,18,2,2,630,340),(85,'Naafiri','The hound of a hundred bites','2023-07-19','V14.12',6300,975,18,1,2,635,400),(86,'Nami','The tidecaller','2012-12-07','V14.11',3150,790,15,2,2,560,365),(87,'Nasus','The curator of the sands','2009-10-01','V14.18',1350,585,19,1,2,631,326),(88,'Nautilus','The titan of the depths','2012-02-14','V14.12',4800,880,19,1,2,646,400),(89,'Neeko','The curious chameleon','2018-12-05','V14.16',4800,880,18,2,2,610,450),(90,'Nidalee','The bestial huntress','2009-12-17','V14.14',3150,790,16,2,2,610,295),(91,'Nilah','The joy unbound','2022-07-13','V14.12',4800,880,18,1,2,570,350),(92,'Nocturne','The eternal nightmare','2011-03-15','V14.9',3150,790,19,1,2,655,275),(93,'Nunu & Willump','& willump the boy and his yeti','2009-02-21','V13.19',450,260,19,1,2,610,280),(94,'Olaf','The berserker','2010-06-09','V14.9',3150,790,19,1,2,645,316),(95,'Orianna','The lady of clockwork','2011-06-01','V14.16',4800,880,14,2,2,585,418),(96,'Ornn','The fire below the mountain','2017-08-23','V14.15',4800,880,15,1,2,660,341),(97,'Pantheon','The unbreakable spear','2010-02-02','V14.13',1350,585,18,1,2,650,317),(98,'Poppy','Keeper of the hammer','2010-01-13','V14.9',450,260,15,1,2,610,280),(99,'Pyke','The bloodharbor ripper','2018-05-31','V14.18',3150,790,15,1,2,670,415),(100,'Qiyana','Empress of the elements','2019-06-28','V14.16',4800,880,16,1,2,590,375),(101,'Quinn','Demacia\'s wings','2013-03-01','V14.4',4800,880,17,2,2,565,269),(102,'Rakan','The charmer','2017-04-19','V14.10',4800,880,15,1,2,610,315),(103,'Rammus','The armordillo','2009-07-10','V14.2',1350,585,19,1,2,675,310),(104,'Rek\'sai','Rek\'sai the void burrower','2014-12-11','V14.12',4800,880,15,1,6,600,100),(105,'Rell','The iron maiden','2020-12-10','V14.18',4800,880,15,1,2,610,350),(106,'Renata Glasc','The chem-baroness','2022-02-17','V14.7',4800,880,15,2,2,545,350),(107,'Renekton','The butcher of the sands','2011-01-18','V14.13',4800,880,18,1,5,660,100),(108,'Rengar','The pridestalker','2012-08-21','V14.12',4800,880,17,1,9,590,4),(109,'Riven','The exile','2011-09-14','V14.2',4800,880,16,1,4,630,0),(110,'Rumble','The mechanized menace','2011-04-26','V14.18',4800,880,17,1,10,625,150),(111,'Ryze','The rune mage','2009-02-21','V14.8',4800,260,17,2,2,645,300),(112,'Samira','The desert rose','2020-09-21','V14.18',3150,790,16,2,2,630,349),(113,'Sejuani','Fury of the north','2012-01-17','V14.15',450,260,18,1,2,630,400),(114,'Senna','The redeemer','2019-11-10','V14.16',3150,790,14,2,2,530,350),(115,'Seraphine','The starry-eyed songstress','2020-10-29','V14.15',3150,790,18,2,2,570,360),(116,'Sett','The boss','2020-01-14','V14.10',1350,585,15,1,11,670,0),(117,'Shaco','The demon jester','2009-10-10','V14.3',3150,790,17,1,2,630,297),(118,'Shen','The eye of twilight','2010-03-24','V14.18',3150,790,18,1,3,610,400),(119,'Shyvana','The half-dragon','2011-11-01','V14.15',3150,790,19,1,5,665,100),(120,'Singed','The mad chemist','2009-04-18','V14.11',4800,260,17,1,2,650,330),(121,'Sion','The undead juggernaut','2009-02-21','V14.14',1350,585,18,1,2,655,400),(122,'Sivir','The battle mistress','2009-02-21','V14.5',450,260,19,2,2,600,340),(123,'Skarner','The primordial sovereign','2011-08-09','V14.18',4800,880,19,1,2,610,320),(124,'Smolder','The fiery fledgling','2024-01-31','V14.18',6300,975,18,2,2,605,300),(125,'Sona','Maven of the strings','2010-09-21','V14.7',450,260,18,2,2,550,340),(126,'Soraka','The starchild','2009-02-21','V14.4',450,260,19,2,2,605,425),(127,'Swain','The noxian grand general','2010-10-05','V14.18',3150,790,18,2,2,595,468),(128,'Sylas','The unshackled','2019-01-25','V14.16',3150,790,14,1,2,575,400),(129,'Syndra','The dark sovereign','2012-09-13','V14.16',3150,790,14,2,2,563,480),(130,'Tahm Kench ','The river king','2015-07-09','V14.15',4800,880,19,1,2,640,325),(131,'Taliyah','The stoneweaver','2016-05-18','V14.16',4800,880,17,2,2,550,470),(132,'Talon','The blade\'s shadow','2011-08-24','V14.15',3150,790,15,1,2,658,400),(133,'Taric','The shield of valoran','2009-08-19','V14.15',1350,585,18,1,2,645,300),(134,'Teemo','The swift scout','2009-02-21','V14.8',450,260,19,2,2,598,334),(135,'Thresh','The chain warden','2013-01-23','V14.8',3150,790,14,2,2,600,274),(136,'Tristana','The yordle gunner','2009-02-21','V14.14',1350,585,19,2,2,640,250),(137,'Trundle','The troll king','2010-12-01','V14.5',3150,790,19,1,2,650,340),(138,'Tryndamere','The barbarian king','2009-05-01','V14.12',1350,585,18,1,5,696,100),(139,'Twisted Fate',' The card master','2009-02-21','V14.12',4800,585,15,2,2,604,333),(140,'Twitch','The plague rat','2009-05-01','V14.12',3150,790,15,2,2,630,300),(141,'Udyr','The spirit walker','2009-12-02','V14.3',1350,585,19,1,2,664,271),(142,'Urgot','The dreadnought','2010-08-24','V14.10',3150,790,17,2,2,655,340),(143,'Varus','The arrow of retribution','2012-05-08','V14.18',4800,880,15,2,2,600,360),(144,'Vayne','The night hunter','2011-05-10','V14.6',3150,790,15,2,2,550,232),(145,'Veigar','The tiny master of evil','2009-07-24','V14.9',1350,585,18,2,2,580,490),(146,'Vel\'koz','The eye of the void','2014-02-27','V14.9',3141,880,15,2,2,590,469),(147,'Vex','The gloomist','2021-09-23','V14.9',3150,790,15,2,2,590,490),(148,'Vi','The piltover enforcer','2012-12-19','V14.18',1350,585,18,1,2,655,295),(149,'Viego','The ruined king','2021-01-21','V14.18',4800,880,15,1,4,630,0),(150,'Viktor','The machine herald','2011-12-29','V14.12',4800,880,15,2,2,600,405),(151,'Vladimir','The crimson reaper','2010-07-27','V14.18',3150,790,17,2,12,607,2),(152,'Volibear','The relentless storm','2011-11-29','V14.10',1350,585,18,1,2,650,350),(153,'Warwick','The uncaged wrath of zaun','2009-02-21','V14.9',450,260,18,1,2,620,280),(154,'Wukong','The monkey king','2011-07-26','V14.16',3150,790,18,1,2,610,300),(155,'Xayah','The rebel','2017-04-19','V14.14',4800,880,15,2,2,630,340),(156,'Xerath','The magus ascendant','2011-10-05','V14.9',1350,585,15,2,2,596,400),(157,'Xin Zhao','Zhao the seneschal of demacia','2010-07-13','V14.18',1350,585,18,1,2,640,274),(158,'Yasuo','The unforgiven','2013-12-13','V14.15',1350,585,16,1,13,590,100),(159,'Yone','The unforgotten','2020-08-06','V14.15',3150,790,14,1,13,620,500),(160,'Yorick','Shepherd of souls','2011-06-22','V14.16',3150,790,17,1,2,650,300),(161,'Yuumi','The magical cat','2019-05-14','V14.14',450,260,17,2,2,500,440),(162,'Zac','The secret weapon','2013-03-29','V14.13',4800,880,18,1,4,685,0),(163,'Zed','The master of shadows','2012-11-13','V14.15',1350,585,14,1,3,654,200),(164,'Zeri','The spark of zaun','2022-01-20','V14.18',4800,880,17,2,2,600,250),(165,'Ziggs','The hexplosives expert','2012-02-01','V14.18',4800,880,18,2,2,606,480),(166,'Zilean','The chronokeeper','2009-04-18','V13.22',1350,585,15,2,2,574,452),(167,'Zoe','The aspect of twilight','2017-11-21','V14.9',4800,880,16,2,2,630,425),(168,'Zyra','Rise of the thorns','2012-07-24','V14.15',3150,790,17,2,2,574,418);
/*!40000 ALTER TABLE `champion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `championclass`
--

DROP TABLE IF EXISTS `championclass`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `championclass` (
  `champion_id` int NOT NULL,
  `class_id` int NOT NULL,
  PRIMARY KEY (`champion_id`,`class_id`),
  KEY `class_id` (`class_id`),
  CONSTRAINT `championclass_ibfk_1` FOREIGN KEY (`champion_id`) REFERENCES `champion` (`champion_id`) ON DELETE CASCADE,
  CONSTRAINT `championclass_ibfk_2` FOREIGN KEY (`class_id`) REFERENCES `class` (`class_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `championclass`
--

LOCK TABLES `championclass` WRITE;
/*!40000 ALTER TABLE `championclass` DISABLE KEYS */;
INSERT INTO `championclass` VALUES (1,1),(25,1),(27,1),(38,1),(46,1),(83,1),(87,1),(116,1),(119,1),(137,1),(141,1),(142,1),(152,1),(160,1),(2,2),(8,2),(17,2),(69,2),(73,2),(95,2),(129,2),(139,2),(145,2),(147,2),(167,2),(3,3),(29,3),(31,3),(35,3),(60,3),(61,3),(65,3),(85,3),(92,3),(100,3),(117,3),(132,3),(163,3),(4,4),(5,5),(6,5),(40,5),(71,5),(77,5),(79,5),(88,5),(93,5),(96,5),(103,5),(105,5),(113,5),(121,5),(123,5),(162,5),(7,6),(11,6),(22,6),(59,6),(78,6),(110,6),(111,6),(127,6),(131,6),(150,6),(151,6),(9,7),(10,7),(20,7),(24,7),(28,7),(32,7),(54,7),(56,7),(57,7),(66,7),(68,7),(74,7),(82,7),(112,7),(122,7),(124,7),(136,7),(140,7),(144,7),(155,7),(164,7),(12,8),(13,9),(23,9),(33,9),(37,9),(39,9),(41,9),(44,9),(62,9),(64,9),(90,9),(101,9),(120,9),(134,9),(166,9),(14,10),(16,10),(48,10),(84,10),(102,10),(135,10),(168,10),(15,11),(34,11),(42,11),(51,11),(63,11),(67,11),(72,11),(80,11),(91,11),(109,11),(138,11),(149,11),(158,11),(18,12),(36,12),(98,12),(118,12),(130,12),(19,13),(21,13),(30,13),(43,13),(47,13),(50,13),(70,13),(94,13),(97,13),(104,13),(107,13),(148,13),(153,13),(154,13),(157,13),(26,14),(108,14),(45,15),(52,15),(146,15),(156,15),(165,15),(49,16),(75,16),(81,16),(86,16),(106,16),(125,16),(126,16),(161,16),(53,17),(55,18),(58,19),(115,19),(76,20),(89,21),(99,22),(114,23),(128,24),(133,25),(143,26),(159,27);
/*!40000 ALTER TABLE `championclass` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `championrole`
--

DROP TABLE IF EXISTS `championrole`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `championrole` (
  `champion_id` int NOT NULL,
  `role_id` int NOT NULL,
  PRIMARY KEY (`champion_id`,`role_id`),
  KEY `role_id` (`role_id`),
  CONSTRAINT `championrole_ibfk_1` FOREIGN KEY (`champion_id`) REFERENCES `champion` (`champion_id`) ON DELETE CASCADE,
  CONSTRAINT `championrole_ibfk_2` FOREIGN KEY (`role_id`) REFERENCES `roles` (`roles_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `championrole`
--

LOCK TABLES `championrole` WRITE;
/*!40000 ALTER TABLE `championrole` DISABLE KEYS */;
INSERT INTO `championrole` VALUES (1,1),(23,1),(25,1),(28,1),(34,1),(37,1),(38,1),(39,1),(42,1),(46,1),(61,1),(63,1),(66,1),(68,1),(83,1),(87,1),(94,1),(96,1),(101,1),(107,1),(109,1),(116,1),(120,1),(121,1),(138,1),(142,1),(160,1),(2,2),(4,2),(7,2),(8,2),(11,2),(13,2),(22,2),(24,2),(35,2),(59,2),(60,2),(69,2),(73,2),(78,2),(85,2),(95,2),(100,2),(111,2),(129,2),(147,2),(150,2),(167,2),(3,3),(47,3),(52,3),(110,3),(159,3),(5,4),(14,4),(16,4),(18,4),(49,4),(71,4),(75,4),(81,4),(84,4),(86,4),(88,4),(99,4),(102,4),(105,4),(106,4),(125,4),(126,4),(135,4),(161,4),(166,4),(168,4),(6,5),(117,5),(9,6),(20,6),(27,6),(32,6),(53,6),(54,6),(55,6),(56,6),(67,6),(74,6),(82,6),(91,6),(112,6),(122,6),(143,6),(155,6),(164,6),(10,7),(114,7),(115,7),(140,7),(12,8),(36,8),(45,8),(76,8),(89,8),(145,8),(156,8),(15,9),(19,9),(30,9),(31,9),(33,9),(41,9),(43,9),(48,9),(50,9),(58,9),(62,9),(64,9),(65,9),(70,9),(72,9),(80,9),(90,9),(92,9),(93,9),(103,9),(104,9),(113,9),(119,9),(148,9),(149,9),(157,9),(17,10),(21,11),(118,11),(130,11),(26,12),(29,12),(131,12),(40,13),(44,14),(51,15),(98,15),(137,15),(141,15),(152,15),(57,16),(77,17),(79,18),(97,19),(108,20),(123,20),(153,20),(154,20),(124,21),(127,22),(133,22),(146,22),(128,23),(151,23),(132,24),(163,24),(134,25),(136,26),(165,26),(139,27),(144,28),(158,29),(162,30);
/*!40000 ALTER TABLE `championrole` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `class`
--

DROP TABLE IF EXISTS `class`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `class` (
  `class_id` int NOT NULL AUTO_INCREMENT,
  `descrip` varchar(50) NOT NULL,
  PRIMARY KEY (`class_id`),
  UNIQUE KEY `name` (`descrip`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `class`
--

LOCK TABLES `class` WRITE;
/*!40000 ALTER TABLE `class` DISABLE KEYS */;
INSERT INTO `class` VALUES (15,'Artillery'),(3,'Assassin'),(22,'Assassin  Catcher'),(14,'Assassin  Diver'),(27,'Assassin  Skirmisher'),(6,'Battlemage'),(2,'Burst'),(20,'Burst  Artillery'),(21,'Burst  Catcher'),(19,'Burst  Enchanter'),(24,'Burst  Skirmisher'),(10,'Catcher'),(13,'Diver'),(16,'Enchanter'),(25,'Enchanter  Warden'),(1,'Juggernaut'),(8,'Mage  Assassin'),(7,'Marksman'),(26,'Marksman  Artillery'),(4,'Marksman  Assassin'),(17,'Marksman  Catcher'),(23,'Marksman  Enchanter'),(11,'Skirmisher'),(9,'Specialist'),(5,'Vanguard'),(12,'Warden'),(18,'Warden  Skirmisher');
/*!40000 ALTER TABLE `class` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `difficulty`
--

DROP TABLE IF EXISTS `difficulty`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `difficulty` (
  `difficulty_id` int NOT NULL AUTO_INCREMENT,
  `descrip` varchar(50) NOT NULL,
  PRIMARY KEY (`difficulty_id`),
  UNIQUE KEY `name` (`descrip`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `difficulty`
--

LOCK TABLES `difficulty` WRITE;
/*!40000 ALTER TABLE `difficulty` DISABLE KEYS */;
INSERT INTO `difficulty` VALUES (14,'Advanced'),(19,'Beginner'),(16,'Expert'),(15,'Intermediate'),(17,'Intermediate_Plus'),(18,'Novice');
/*!40000 ALTER TABLE `difficulty` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rangetype`
--

DROP TABLE IF EXISTS `rangetype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rangetype` (
  `range_type_id` int NOT NULL AUTO_INCREMENT,
  `descrip` varchar(50) NOT NULL,
  PRIMARY KEY (`range_type_id`),
  UNIQUE KEY `name` (`descrip`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rangetype`
--

LOCK TABLES `rangetype` WRITE;
/*!40000 ALTER TABLE `rangetype` DISABLE KEYS */;
INSERT INTO `rangetype` VALUES (1,'Melee'),(2,'Ranged');
/*!40000 ALTER TABLE `rangetype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `resourcetype`
--

DROP TABLE IF EXISTS `resourcetype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `resourcetype` (
  `resource_type_id` int NOT NULL AUTO_INCREMENT,
  `descrip` varchar(50) NOT NULL,
  PRIMARY KEY (`resource_type_id`),
  UNIQUE KEY `name` (`descrip`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `resourcetype`
--

LOCK TABLES `resourcetype` WRITE;
/*!40000 ALTER TABLE `resourcetype` DISABLE KEYS */;
INSERT INTO `resourcetype` VALUES (1,'Blood Well'),(7,'Courage'),(12,'Crimson Rush'),(3,'Energy'),(9,'Ferocity'),(13,'Flow'),(5,'Fury'),(11,'Grit'),(10,'Heat'),(2,'Mana'),(4,'none'),(6,'Rage'),(8,'Shield');
/*!40000 ALTER TABLE `resourcetype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roles` (
  `roles_id` int NOT NULL AUTO_INCREMENT,
  `descrip` varchar(50) NOT NULL,
  PRIMARY KEY (`roles_id`),
  UNIQUE KEY `name` (`descrip`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (6,'Bottom'),(26,'Bottom,Middle'),(7,'Bottom,Support'),(28,'Bottom,Top'),(21,'Bottom,Top,Middle'),(9,'Jungle'),(12,'Jungle,Middle'),(5,'Jungle,Support'),(10,'Jungle,Support,Middle'),(20,'Jungle,Top'),(13,'Jungle,Top,Middle'),(30,'Jungle,Top,Support'),(2,'Middle'),(27,'Middle,Bottom,Top'),(24,'Middle,Jungle'),(8,'Middle,Support'),(16,'Middle,Support,Top'),(23,'Middle,Top'),(4,'Support'),(18,'Support,Jungle'),(22,'Support,Middle'),(14,'Support,Top,Middle'),(1,'Top'),(15,'Top,Jungle'),(25,'Top,Jungle,Support'),(3,'Top,Middle'),(29,'Top,Middle,Bottom'),(17,'Top,Middle,Support'),(11,'Top,Support'),(19,'Top,Support,Jungle,Middle');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-10-15  8:28:36
