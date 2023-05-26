-- MySQL dump 10.13  Distrib 8.0.32, for Linux (x86_64)
--
-- Host: localhost    Database: book_db_dev_v1
-- ------------------------------------------------------
-- Server version	8.0.33-0ubuntu0.22.04.2

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
-- Table structure for table `books`
--

DROP TABLE IF EXISTS `books`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `books` (
  `book_id` int NOT NULL AUTO_INCREMENT,
  `creater_id` int NOT NULL,
  `book_name` varchar(45) NOT NULL,
  `auther_name` varchar(45) NOT NULL,
  `description` text NOT NULL,
  `genre` varchar(45) DEFAULT NULL,
  `total_pages` int DEFAULT NULL,
  `book_price` int NOT NULL,
  `publisher_name` varchar(45) DEFAULT NULL,
  `publish_date` date NOT NULL,
  `is_active` int DEFAULT '0' COMMENT '0- book_will_show\\\\\\\\\\\\\\\\n1- book_has_been_soft_delete',
  `created_datetime` datetime DEFAULT NULL,
  `updated_datetime` datetime DEFAULT NULL,
  PRIMARY KEY (`book_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `books`
--

LOCK TABLES `books` WRITE;
/*!40000 ALTER TABLE `books` DISABLE KEYS */;
INSERT INTO `books` VALUES (2,2,'2 States: The Story of My Marriage','Chetan Bhagat','2 States: The Story of My Marriage[1] commonly known as 2 States[2] is a 2009 novel written by Chetan Bhagat.[3] It is the story about a couple coming from two states in India, who face hardships in convincing their parents to approve of their marriage. Bhagat wrote this novel after quitting his job as an investment banker. This is his fourth book after Five Point Someone, One Night @ the Call Center and The Three Mistakes of My Life.','Fiction, Romance',321,176,'Rupa Publications Pvt. Ltd','2009-10-08',0,'2023-05-25 12:38:21',NULL),(3,3,'November 9','Colleen Hoover','A monumental modern romance with a literary twist, November 9 follows the life of a writer and former actress. Hoover introduces Ben, a young man who has dreams of becoming a writer. By chance, Ben is acquainted with Fallon, who is just about to embark on a huge move to the other side of the country.',' Romance novel, Fiction, Contemporary romance',320,251,'Simon & Schuster','2015-11-10',1,'2023-05-25 12:55:00','2023-05-25 02:53:35'),(4,3,'November 49','Colleen Hoover','A monumental modern romance with a literary twist, November 9 follows the life of a writer and former actress. Hoover introduces Ben, a young man who has dreams of becoming a writer. By chance, Ben is acquainted with Fallon, who is just about to embark on a huge move to the other side of the country.',' Romance novel, Fiction, Contemporary romance',320,251,'Simon & Schuster','2015-11-10',0,'2023-05-25 03:15:43','2023-05-25 03:17:44');
/*!40000 ALTER TABLE `books` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `user_id` bigint NOT NULL AUTO_INCREMENT,
  `user_name` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_id` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone_number` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `auth_key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_datetime` datetime DEFAULT NULL,
  `updated_datetime` datetime DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (2,'Smrati Sengar','Smrati@gmail.com','786339632','$2b$10$RG8rwMjKUhT.0UEry8cIPub6hyQG84aqG.e6NHxQuXD3LqgpuBxv2','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbF9pZCI6IlNtcmF0aUBnbWFpbC5jb20iLCJ1c2VyX25hbWUiOiJTbXJhdGkgU2VuZ2FyIiwicGhvbmVfbnVtYmVyIjoiNzg2MzM5NjMyIiwiaWF0IjoxNjg0OTk1MDIzfQ.PWM57ys3mka0-Rl0ZQhWFiBeJ_P1pGdRNLZnGsq3v4U','2023-05-25 11:40:23',NULL),(3,'Smrati Sengar','SmratiSengar@gmail.com','786339632','$2b$10$XTbMzJ/GTEWQEX4XswaUfeF1Vc1H19zTCieNJ42vTATsFQq6eE24y','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbF9pZCI6IlNtcmF0aVNlbmdhckBnbWFpbC5jb20iLCJ1c2VyX25hbWUiOiJTbXJhdGkgU2VuZ2FyIiwicGhvbmVfbnVtYmVyIjoiNzg2MzM5NjMyIiwiaWF0IjoxNjg0OTk1MTUyfQ.vU1ELlXyArmLKDtPAuMqu_H2zmwtV4StjVd_BajG3Zk','2023-05-25 11:42:32',NULL);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'book_db_dev_v1'
--

--
-- Dumping routines for database 'book_db_dev_v1'
--
/*!50003 DROP PROCEDURE IF EXISTS `get-all-books` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get-all-books`(p_page_no int)
BEGIN
		Declare v_records_per_page bigint default 10;
		Declare v_offset bigint default (p_page_no - 1) * (v_records_per_page) ;
		Declare v_limit bigint default v_records_per_page;

		SELECT 
			book_id, 
            creater_id, 
            users.user_name AS creater_name, 
            book_name,
            auther_name,
            description,
            genre,
            book_price,
            total_pages,
            publisher_name,
            publish_date 
		FROM 
			books 
		INNER JOIN 
			users 
		ON 
            users.user_id = books.creater_id 
		WHERE 
			is_active = 0
		ORDER BY books.created_datetime DESC
		LIMIT V_LIMIT OFFSET V_OFFSET;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_all_books` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_all_books`(p_page_no int)
BEGIN
		Declare v_records_per_page bigint default 10;
		Declare v_offset bigint default (p_page_no - 1) * (v_records_per_page) ;
		Declare v_limit bigint default v_records_per_page;

		SELECT 
			book_id, 
            creater_id, 
            users.user_name AS creater_name, 
            book_name,
            auther_name,
            description,
            genre,
            book_price,
            total_pages,
            publisher_name,
            publish_date 
		FROM 
			books 
		INNER JOIN 
			users 
		ON 
            users.user_id = books.creater_id 
		WHERE 
			is_active = 0
		ORDER BY books.created_datetime DESC
		LIMIT V_LIMIT OFFSET V_OFFSET;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_my_created_books` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_my_created_books`(p_page_no int,p_user_id bigint)
BEGIN
		Declare v_records_per_page bigint default 10;
		Declare v_offset bigint default (p_page_no - 1) * (v_records_per_page) ;
		Declare v_limit bigint default v_records_per_page;

		SELECT 
			book_id, 
            creater_id, 
            users.user_name AS creater_name, 
            book_name,
            auther_name,
            description,
            genre,
            book_price,
            total_pages,
            publisher_name,
            publish_date ,
            is_active
		FROM 
			books 
		INNER JOIN 
			users 
		ON 
            users.user_id = books.creater_id 
		WHERE 
			creater_id  = p_user_id
		ORDER BY books.created_datetime DESC
		LIMIT V_LIMIT OFFSET V_OFFSET;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `search_book_by_title_author_description` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `search_book_by_title_author_description`(p_user_id bigint, p_search_text varchar(100), p_page_no bigint)
BEGIN

Declare v_records_per_page bigint default 50;
Declare v_offset bigint default (p_page_no - 1) * (v_records_per_page) ;
Declare v_limit bigint default v_records_per_page;

IF(trim(p_search_text) = '') THEN
    SET p_search_text = NULL;
ELSE 
    SET p_search_text = trim(p_search_text);
END IF;

if p_search_text is not null then

	SELECT DISTINCT
			book_id, 
            creater_id, 
            users.user_name AS creater_name, 
            book_name,
            auther_name,
            description,
            genre,
            book_price,
            total_pages,
            publisher_name,
            publish_date ,
            is_active,
			(MATCH (description) AGAINST (p_search_text IN NATURAL LANGUAGE MODE) + (MATCH (book_name) AGAINST (p_search_text IN NATURAL LANGUAGE MODE)) + (MATCH (auther_name) AGAINST (p_search_text IN NATURAL LANGUAGE MODE))) AS relevant_score
	FROM
		books
		INNER JOIN 
			users 
		ON 
            users.user_id = books.creater_id
	WHERE
		(MATCH (description) AGAINST (p_search_text IN NATURAL LANGUAGE MODE)
			OR (MATCH (book_name) AGAINST (p_search_text IN NATURAL LANGUAGE MODE))
			OR (MATCH (auther_name) AGAINST (p_search_text IN NATURAL LANGUAGE MODE)))
			AND 
			is_active = 0
	GROUP BY books.book_id
	 ORDER BY relevant_score DESC
    LIMIT V_LIMIT OFFSET V_OFFSET;
    
ELSE

	SELECT DISTINCT
			book_id, 
            creater_id, 
            users.user_name AS creater_name, 
            book_name,
            auther_name,
            description,
            genre,
            book_price,
            total_pages,
            publisher_name,
            publish_date ,
            is_active
	FROM 
			books 
		INNER JOIN 
			users 
		ON 
            users.user_id = books.creater_id 
		WHERE 
			is_active = 0
		
	GROUP BY books.book_id
    ORDER BY relevant_score DESC
	-- ORDER BY relevant_score DESC , user_posts.created_datetime DESC , is_following DESC , total_like_dislike DESC
	LIMIT V_LIMIT OFFSET V_OFFSET;

END IF;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `search_post_by_interest` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`cruitbay_usr`@`%` PROCEDURE `search_post_by_interest`(p_user_id bigint, p_search_text varchar(100), p_page_no bigint)
BEGIN

Declare v_records_per_page bigint default 50;
Declare v_offset bigint default (p_page_no - 1) * (v_records_per_page) ;
Declare v_limit bigint default v_records_per_page;

IF(trim(p_search_text) = '') THEN
    SET p_search_text = NULL;
ELSE 
    SET p_search_text = trim(p_search_text);
END IF;

if p_search_text is not null then

	SELECT DISTINCT
			book_id, 
            creater_id, 
            users.user_name AS creater_name, 
            book_name,
            auther_name,
            description,
            genre,
            book_price,
            total_pages,
            publisher_name,
            publish_date ,
            is_active,
			(MATCH (description) AGAINST (p_search_text IN NATURAL LANGUAGE MODE) + (MATCH (book_name) AGAINST (p_search_text IN NATURAL LANGUAGE MODE)) + (MATCH (auther_name) AGAINST (p_search_text IN NATURAL LANGUAGE MODE))) AS relevant_score
	FROM
		books
		
	WHERE
		(MATCH (description) AGAINST (p_search_text IN NATURAL LANGUAGE MODE)
			OR (MATCH (book_name) AGAINST (p_search_text IN NATURAL LANGUAGE MODE))
			OR (MATCH (auther_name) AGAINST (p_search_text IN NATURAL LANGUAGE MODE)))
			AND 
			is_active = 0
	GROUP BY books.book_id
	 ORDER BY relevant_score DESC
    LIMIT V_LIMIT OFFSET V_OFFSET;
    
ELSE

	SELECT DISTINCT
			book_id, 
            creater_id, 
            users.user_name AS creater_name, 
            book_name,
            auther_name,
            description,
            genre,
            book_price,
            total_pages,
            publisher_name,
            publish_date ,
            is_active
	FROM 
			books 
		INNER JOIN 
			users 
		ON 
            users.user_id = books.creater_id 
		WHERE 
			is_active = 0
		
	GROUP BY books.book_id
    ORDER BY relevant_score DESC
	-- ORDER BY relevant_score DESC , user_posts.created_datetime DESC , is_following DESC , total_like_dislike DESC
	LIMIT V_LIMIT OFFSET V_OFFSET;

END IF;

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

-- Dump completed on 2023-05-26 12:05:01
