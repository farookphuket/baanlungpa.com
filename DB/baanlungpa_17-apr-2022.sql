-- MariaDB dump 10.19  Distrib 10.7.3-MariaDB, for Linux (x86_64)
--
-- Host: localhost    Database: baanlungpa
-- ------------------------------------------------------
-- Server version	10.7.3-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `blog_category`
--

DROP TABLE IF EXISTS `blog_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blog_category` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `blog_id` bigint(20) unsigned NOT NULL,
  `category_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `blog_category_blog_id_foreign` (`blog_id`),
  KEY `blog_category_category_id_foreign` (`category_id`),
  CONSTRAINT `blog_category_blog_id_foreign` FOREIGN KEY (`blog_id`) REFERENCES `blogs` (`id`) ON DELETE CASCADE,
  CONSTRAINT `blog_category_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blog_category`
--

LOCK TABLES `blog_category` WRITE;
/*!40000 ALTER TABLE `blog_category` DISABLE KEYS */;
INSERT INTO `blog_category` VALUES
(1,1,1),
(2,2,2),
(3,3,3),
(4,4,4),
(5,5,5),
(6,6,5);
/*!40000 ALTER TABLE `blog_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blog_comment`
--

DROP TABLE IF EXISTS `blog_comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blog_comment` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `blog_id` bigint(20) unsigned NOT NULL,
  `comment_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `blog_comment_blog_id_foreign` (`blog_id`),
  KEY `blog_comment_comment_id_foreign` (`comment_id`),
  CONSTRAINT `blog_comment_blog_id_foreign` FOREIGN KEY (`blog_id`) REFERENCES `blogs` (`id`),
  CONSTRAINT `blog_comment_comment_id_foreign` FOREIGN KEY (`comment_id`) REFERENCES `comments` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blog_comment`
--

LOCK TABLES `blog_comment` WRITE;
/*!40000 ALTER TABLE `blog_comment` DISABLE KEYS */;
INSERT INTO `blog_comment` VALUES
(1,1,1),
(2,1,2);
/*!40000 ALTER TABLE `blog_comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blog_read`
--

DROP TABLE IF EXISTS `blog_read`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blog_read` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `blog_id` bigint(20) unsigned NOT NULL,
  `read_id` bigint(20) unsigned NOT NULL,
  `ip` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `readed_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `blog_read_blog_id_foreign` (`blog_id`),
  KEY `blog_read_read_id_foreign` (`read_id`),
  CONSTRAINT `blog_read_blog_id_foreign` FOREIGN KEY (`blog_id`) REFERENCES `blogs` (`id`) ON DELETE CASCADE,
  CONSTRAINT `blog_read_read_id_foreign` FOREIGN KEY (`read_id`) REFERENCES `reads` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blog_read`
--

LOCK TABLES `blog_read` WRITE;
/*!40000 ALTER TABLE `blog_read` DISABLE KEYS */;
INSERT INTO `blog_read` VALUES
(1,1,1,'127.0.13.1','2007-10-17 05:22:13'),
(2,2,2,'223.24.154.236','2007-10-20 23:15:25'),
(3,3,3,'49.237.15.19','2022-03-13 06:09:03'),
(4,3,4,'27.55.89.244','2022-03-13 11:58:35'),
(5,3,5,'223.24.94.165','2022-03-14 01:15:38'),
(6,3,6,'27.55.79.106','2022-03-14 08:51:42'),
(7,3,7,'61.90.31.83','2022-03-14 09:34:14'),
(8,4,8,'223.24.94.248','2022-03-14 10:39:33'),
(9,4,9,'223.24.169.108','2022-03-16 22:24:08'),
(10,5,10,'223.24.153.88','2022-03-28 02:12:02');
/*!40000 ALTER TABLE `blog_read` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blog_reply`
--

DROP TABLE IF EXISTS `blog_reply`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blog_reply` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `blog_id` bigint(20) unsigned NOT NULL,
  `reply_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `blog_reply_blog_id_foreign` (`blog_id`),
  KEY `blog_reply_reply_id_foreign` (`reply_id`),
  CONSTRAINT `blog_reply_blog_id_foreign` FOREIGN KEY (`blog_id`) REFERENCES `blogs` (`id`) ON DELETE CASCADE,
  CONSTRAINT `blog_reply_reply_id_foreign` FOREIGN KEY (`reply_id`) REFERENCES `replies` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blog_reply`
--

LOCK TABLES `blog_reply` WRITE;
/*!40000 ALTER TABLE `blog_reply` DISABLE KEYS */;
INSERT INTO `blog_reply` VALUES
(1,1,1);
/*!40000 ALTER TABLE `blog_reply` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blog_tag`
--

DROP TABLE IF EXISTS `blog_tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blog_tag` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `blog_id` bigint(20) unsigned NOT NULL,
  `tag_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `blog_tag_blog_id_foreign` (`blog_id`),
  KEY `blog_tag_tag_id_foreign` (`tag_id`),
  CONSTRAINT `blog_tag_blog_id_foreign` FOREIGN KEY (`blog_id`) REFERENCES `blogs` (`id`) ON DELETE CASCADE,
  CONSTRAINT `blog_tag_tag_id_foreign` FOREIGN KEY (`tag_id`) REFERENCES `tags` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blog_tag`
--

LOCK TABLES `blog_tag` WRITE;
/*!40000 ALTER TABLE `blog_tag` DISABLE KEYS */;
INSERT INTO `blog_tag` VALUES
(1,1,1),
(2,2,2),
(3,3,3),
(4,4,5),
(5,5,3),
(6,5,8),
(7,6,8),
(8,6,3);
/*!40000 ALTER TABLE `blog_tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blogs`
--

DROP TABLE IF EXISTS `blogs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blogs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL,
  `bl_title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `bl_slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `bl_cover` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bl_excerpt` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `bl_body` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `bl_is_public` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `blogs_user_id_foreign` (`user_id`),
  CONSTRAINT `blogs_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blogs`
--

LOCK TABLES `blogs` WRITE;
/*!40000 ALTER TABLE `blogs` DISABLE KEYS */;
INSERT INTO `blogs` VALUES
(1,1,'my new post my default post','my-new-post-default-post','https://i.ibb.co/CBD2wgH/baanlungpa-17-feb-2022.png','\n    this is the default post DO NOT DELETE ME\n    ','\n\n    <div>\n        <p class=\"title has-text-danger\">\n            Do Not Delete me from \"post_list.sqlite\" file \n        </p>\n        <p class=\"subtitle\">\n            I am your backup data file\n        </p>\n        <p>\n            you can edit me to your data but \n            <span class=\"tag is-danger is-medium has-text-info\">\n            DO NOT DELETE\n            </span> \n            this file need to have at lease 1 row of data to run a script \n\n        </p>\n\n        <pre>\n            <code><span>\n            php artisan db:seed\n            </span></code>\n        </pre>\n        <p>\n            unless you\'re desired \n            <span class=\"tag has-text-danger\">not</span> \n            to use the default data then you just avoid to run \n            \"php artisan db:seed\" command.\n        </p>\n    </div>\n\n\n    ',1,'2007-10-29 05:21:24','2007-10-29 05:21:24'),
(2,4,'วิชาประกันภัยในอุตสาหากรรมขนส่งและโลจิสติกส์','วิชาประกันภัยในอุตสาหากรรมขนส่งและโลจิสติกส์','https://www.prachachat.net/wp-content/uploads/2021/09/5-4-728x409.jpg','\nสื่อการสอนวิชาการประกันภัยอุตสาหกรรมการขนส่งและโลจิสติกส์\n\n    ','\n<div class=\"mt-4 pt-2\">\n\n<div class=\"video-container\">\n<iframe src=\"https://archive.org/embed/23-02-2022-1_class\" width=\"640\" height=\"480\" frameborder=\"0\" webkitallowfullscreen=\"true\" mozallowfullscreen=\"true\" allowfullscreen=\"\"></iframe>\n</div>\n<p class=\"pt-2 has-text-centered\">\nวิดิโอการสอนวิชา การประกันภัยอุตสาหกรรมการขนส่งและโลจิสติกส์\n</p>\n</div>\n\n    ',1,'2022-02-25 14:10:34','2022-02-25 14:10:34'),
(3,4,'เที่ยวสระแก้วกับป้าวันที่ 26 กุมภาฯ 2565','เที่ยวสระแก้วกับป้าวันที่-26-กุมภาฯ-2565','https://i.ibb.co/mhFDLVF/sakaew-25-feb-2022.png','\n    ไปเที่ยวสระแก้วกับป้า วันที่ 26 กุมภาฯ 2565\n\n    ','<div class=\"pt-4 mt-4 mb-4\">\n    <p class=\"mb-4\">\n        ปั่นจักรยานยังไม่ทันได้เหงื่อเลย เด็กติสหนีกลับเสียงั้น\n    </p>\n    <div class=\"video-container\">\n        <iframe src=\"https://archive.org/embed/sakaew-with-pa-26-feb-2022\" \n        width=\"640\" height=\"480\" frameborder=\"0\" webkitallowfullscreen=\"true\" \n        mozallowfullscreen=\"true\" allowfullscreen></iframe>\n    </div>\n\n    <p class=\"pt-2 has-text-centered\">ดูวิดิโอ</p>\n\n    <p class=\"pt-2\">\n        แล้วเจอกันใหม่นะ\n    </p>\n</div>',1,'2022-03-04 01:10:47','2022-03-04 01:10:47'),
(4,1,'เรียนขายของออนไลน์ รุ่น 208 วันที่ 10 มี.ค. 2565','เรียนขายของออนไลน์-รุ่น-208-วันที่-10-มีค-2565','https://i.ibb.co/ckf8Y4y/course98bath-cover-1.jpg','        เรียนออนไลน์รุ่นที่ 208 เก็บไว้เป็นที่ระลึก และเพื่อเตือนตัวเองว่า มึงจะไม่ได้รวยหรอก\r\n    ','<div class=\"content\">\r\n\r\n    <div class=\"box mb-4\">\r\n        <p class=\"title has-text-info\">\r\n            เก็บไว้เป็นที่ระลึก\r\n        </p>\r\n        <p>\r\n            หรือหากท่านใดอยากแนะนำให้เพื่อนๆ ดูก็ยินดีนะครับ เรียนคอร์สนี้ได้อะไรดีๆ \r\n            มากกว่าที่คุณคิด&nbsp;\r\n            <span class=\"has-text-weight-bold has-text-danger\">\r\n                หมายถึงคิดให้ดีๆ นะ เพราะว่ามึงจะไม่รวยหรอก\r\n            </span>\r\n            \r\n        </p>\r\n    </div>\r\n\r\n    <div class=\"video-container\">\r\n        <iframe src=\"https://archive.org/embed/thai-course-online-98-thaibath-208-10-mar-2022\" width=\"640\" height=\"480\" frameborder=\"0\" webkitallowfullscreen=\"true\" mozallowfullscreen=\"true\" allowfullscreen=\"\"></iframe>\r\n    </div>\r\n<div class=\"mt-2 pb-2\">\r\n<div class=\"video-container\">\r\n<iframe src=\"https://archive.org/embed/thai-course-class-208-98thaibath-day2\" width=\"640\" height=\"480\" frameborder=\"0\" webkitallowfullscreen=\"true\" mozallowfullscreen=\"true\" allowfullscreen></iframe>\r\n</div>\r\n<p class=\"has-text-centered pt-2\">\r\nเรียนขายของออนไลน์วันที่ 2 รุ่น 208 (เสียงมันค่อยมากๆ ต้องขออภัย)\r\n</p>\r\n</div>\r\n\r\n\r\n<!-- day 3 START -->\r\n<div class=\"mt-2 pb-2\">\r\n<div class=\"video-container\">\r\n\r\n<iframe src=\"https://archive.org/embed/thai-course-online-class-208-day-3\" width=\"640\" height=\"480\" frameborder=\"0\" webkitallowfullscreen=\"true\" mozallowfullscreen=\"true\" allowfullscreen></iframe>\r\n\r\n</div>\r\n<p class=\"has-text-centered pt-2\">\r\nเรียนขายของออนไลน์วันที่ 3 รุ่น 208\r\n</p>\r\n</div>\r\n<!-- day 3 END -->\r\n\r\n<!-- sale dream START -->\r\n<div class=\"mt-2 pb-2\">\r\n<div class=\"video-container\">\r\n\r\n<iframe src=\"https://archive.org/embed/thai-online-course-class-208-day-dream\" width=\"640\" height=\"480\" frameborder=\"0\" webkitallowfullscreen=\"true\" mozallowfullscreen=\"true\" allowfullscreen></iframe>\r\n\r\n\r\n</div>\r\n<p class=\"has-text-centered pt-2\">\r\nเรียนขายของออนไลน์ รุ่น 208\r\n</p>\r\n</div>\r\n<!-- day dream  END -->\r\n<p>\r\nลองฟังดูดีๆ นะครับ \r\n<span class=\"has-text-weight-bold\">\r\nไม่มีธุรกิจอะไรในโลกนี้ที่ลงทุน 0 บาท\r\n</span> \r\nน่าเสียดายครับ ผมไม่มีเงิน ถ้ามี 4 แสนนี่ ผมลงหมดตัวเลย แต่ตอนนี้ผมขออยู่นิ่งๆ ก่อนดีกว่าครับ เพราะว่าผมไม่มีเงินจริงๆ แต่ถ้าใครพอมองเห็นลู่ทางก็เชิญนะครับ \r\n</p>\r\n<p>\r\nมันฟังแปลกๆ นะ สะดุดใจกันบ้างมั้ย ที่เค้าบอกว่า บ้านเค้ากำลังจะโดนยึด แล้วเค้าเอาเงินมาจากไหนตั้ง 3 แสนมาลงทุน หรือ เค้าจนมากๆ ขายของวันนึง 300 500 แล้วต้องเก็บเงินกี่ปีถึงจะมีเงินมาลงทุนตั้ง 3 แสน แต่ยังไงก็ช่าง มันน่าจะไม่ใช่เรื่องขายฝันหรอกมั้ง เพราะว่าคงไม่มีใครเช่าเฟอรารี่มาขับเล่นๆ ถ่ายวิดิโอ 5 นาที 10 นาทีหรอกเนอะ\r\n</p>\r\n    <p class=\"pt-2 has-text-centered\">\r\n        เรียนขายของออนไลน์ คอร์ส 98 บาท รุ่นที่ 208 วันที่ 10 มีนาคม 2565 ฟังเพลินดีนะครับ ก็ลองฟังๆ ดู\r\n    </p>\r\n    <p class=\"mt-4\">\r\n        หากท่านต้องการเขียน คอมเม้น กรุณา \r\n<a href=\"/login\" class=\"button is-link\">\r\n        ล๊อกอิน \r\n</a>\r\n        ก่อนนะครับ\r\n    </p>\r\n</div>\r\n\r\n',1,'2022-03-11 09:40:05','2022-03-11 09:40:05'),
(5,4,'koko var at koh samed on 26-27 mar 2022','koko-var-at-koh-samed-on-26-27-mar-2022','https://i.ibb.co/0JVXtzk/IMG-20220327-112034.jpg','\n    ไปเที่ยวกันมั้ย จะไปเกาะสเม็ดต่อให้ไปแล้วยังไม่เสร็จ แต่รับรองว่าเด็ดไม่หยอกเลยไง\n    ','<div class=\"content mt-4\">\n    <p class=\"title\">\n        ดูรูปถ่ายจากมือถือ\n    </p>\n    <p class=\"pt-2 pb-4\">\n        คลิกที่รูป เพื่อดูรูปจากอัลบั้มใน กูเกิ้ล โฟโต้(google photo)\n    </p>\n    <div class=\"content mb-4\">\n        <a href=\"https://photos.app.goo.gl/wxVJztD3YGuPLg356\" target=\"_blank\" class=\"image\">\n            <img src=\"https://i.ibb.co/0JVXtzk/IMG-20220327-112034.jpg\">\n        </a>\n    </div>\n\n    <p class=\"title mt-4\">\n        ดูวิดิโอ แบบไม่มีเสียง\n    </p>\n    <p class=\"mb-4 pt-2\">\n        วิดิโอนี้อยู่แม้ว่าจะใน youtube แต่ก็จะไม่สามารถเปิดดูได้หากว่าไม่มีลิ้งค์ เพราะเป้นลิ้งค์แบบ \n        \"unlist\" ซึ่งจะไม่แสดงใน youtube แม้ว่า \"user\" จะเป็น \"ผู้ติดตาม(follower)\" \n        ก็จะไม่สามารถเห็นวิดิโอนี้ใน youtube ได้เว้นแต่ว่าจะได้รับลิ้งค์จากผู้โพส  \n    </p>\n    <div class=\"video-container\">\n        <iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/Fe-ZykSPBlw\" title=\"YouTube video player\" frameborder=\"0\" allow=\"accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture\" allowfullscreen=\"\"></iframe>\n    </div>\n    <p class=\"has-text-centered pt-2 mb-4 has-text-weight-bold\">\n        วิดิโอไม่ค่อยมีเสียงนะครับ เพราะว่าอัดด้วยกล้องใต้น้ำไม่ได้ถอดเคส ในยูทูปใส่เพลงไม่ได้ เพราะจะโดนแบนลิขสิทธิ์\n    </p>\n</div>',1,'2022-03-28 02:05:32','2022-03-28 02:05:32'),
(6,1,'เที่ยวสระแก้วกับป้า (ละลุ ร้อนตับแล่บ) 14-04-2565','เที่ยวสระแก้วกับป้า-ละลุ-ร้อนตับแล่บ-14-04-2565','https://lh3.googleusercontent.com/EkZQcyUIuc0dyGYxPj4X3l34H8MP1SB3_aTglYvHmD7yIgmosE1qhbzEtoMId5RhWK_ZLUEbNPrygfJG9JGCn8OX-KP-WJzdkkI9Pwstz-WTP350FAlU7v5Gat7K_ZO2OZCMTb6KFnI=w2400\r\n','มาเที่ยวละลุวันวันสงกรานต์ ร้อนได้ใจ ได้ประสบการณ์ แต่อย่างน้อยก็ไม่ต้องหัวเสียกับรถติดๆ น่าเบื่อ (ดูรูปทั้งหมดในอัลบั้มนี้ คลิกที่รูปได้เลยครับ)','<div>\r\n    <p>\r\n        มาเที่ยวสระแก้วกับป้า ในวันสงกรานต์ เมษายยน2565 \r\n    </p> \r\n    <div class=\"mt-4 mb-4 pb-4\">\r\n        <a href=\"https://photos.google.com/share/AF1QipPAbxkRzxZbuFaxs0-Q6YBfOp_eCdxUJEOCXtkktZCLhef4SxNX3pCC69me0ebEYw\" targe=\"_blank\">\r\n            <img src=\"https://lh3.googleusercontent.com/EkZQcyUIuc0dyGYxPj4X3l34H8MP1SB3_aTglYvHmD7yIgmosE1qhbzEtoMId5RhWK_ZLUEbNPrygfJG9JGCn8OX-KP-WJzdkkI9Pwstz-WTP350FAlU7v5Gat7K_ZO2OZCMTb6KFnI=w2400\" alt=\"เที่ยวละลุ ร้อนประทุปรอท\">\r\n        </a>\r\n<p class=\"is-block has-text-centered has-text-success\">\r\nคลิกที่รูปเพื่อดูรูปทั้งหมดในอัลบั้มนี้\r\n</p>\r\n    </div>\r\n    \r\n    <div class=\"video-container\">\r\n        <iframe id=\"odysee-iframe\" width=\"560\" height=\"315\" src=\"https://odysee.com/$/embed/la-lu-14-apr-2022/be91961bc667e9d94289319fcbd4be6b587cd948?r=2YnWiNbGCXfEhJyem4TFEz8FTkHv5dEg\" allowfullscreen=\"\"></iframe>\r\n    </div>\r\n    \r\n    <p class=\"has-text-centered pt-2\">\r\n    มาเที่ยวละลุกับป้า วันที่ 14-04-2565 เที่ยวละลุ ร้อนละลาย\r\n</p>\r\n</div>',1,'2022-04-17 13:55:29','2022-04-17 13:55:29');
/*!40000 ALTER TABLE `blogs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categories` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL,
  `cat_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cat_slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_allow_edit` tinyint(1) DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `categories_user_id_foreign` (`user_id`),
  CONSTRAINT `categories_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES
(1,1,'arch linux','arch-linux',1,'2007-10-29 05:15:40','2007-10-29 05:15:40'),
(2,1,'สื่อการเรียน','สื่อการเรียน',0,'2022-02-25 14:07:56','2022-02-25 14:07:56'),
(3,1,'ที่ระลึก','ที่ระลึก',0,'2022-03-04 00:23:33','2022-03-04 00:23:33'),
(4,1,'เรียนออนไลน์','เรียนออนไลน์',0,'2022-03-11 08:37:48','2022-03-11 08:37:48'),
(5,1,'ไปเที่ยวกันมั้ย','ไปเที่ยวกันมั้ย',0,'2022-03-27 08:37:48','2022-03-27 08:37:48');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `class_room_course`
--

DROP TABLE IF EXISTS `class_room_course`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `class_room_course` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `class_room_id` bigint(20) unsigned NOT NULL,
  `course_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `class_room_course_class_room_id_foreign` (`class_room_id`),
  KEY `class_room_course_course_id_foreign` (`course_id`),
  CONSTRAINT `class_room_course_class_room_id_foreign` FOREIGN KEY (`class_room_id`) REFERENCES `class_rooms` (`id`) ON DELETE CASCADE,
  CONSTRAINT `class_room_course_course_id_foreign` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `class_room_course`
--

LOCK TABLES `class_room_course` WRITE;
/*!40000 ALTER TABLE `class_room_course` DISABLE KEYS */;
/*!40000 ALTER TABLE `class_room_course` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `class_rooms`
--

DROP TABLE IF EXISTS `class_rooms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `class_rooms` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL,
  `class_title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `class_description` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `class_level` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `class_year` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `class_rooms_user_id_foreign` (`user_id`),
  CONSTRAINT `class_rooms_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `class_rooms`
--

LOCK TABLES `class_rooms` WRITE;
/*!40000 ALTER TABLE `class_rooms` DISABLE KEYS */;
/*!40000 ALTER TABLE `class_rooms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comment_reply`
--

DROP TABLE IF EXISTS `comment_reply`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comment_reply` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `comment_id` bigint(20) unsigned NOT NULL,
  `reply_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `comment_reply_comment_id_foreign` (`comment_id`),
  KEY `comment_reply_reply_id_foreign` (`reply_id`),
  CONSTRAINT `comment_reply_comment_id_foreign` FOREIGN KEY (`comment_id`) REFERENCES `comments` (`id`) ON DELETE CASCADE,
  CONSTRAINT `comment_reply_reply_id_foreign` FOREIGN KEY (`reply_id`) REFERENCES `replies` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comment_reply`
--

LOCK TABLES `comment_reply` WRITE;
/*!40000 ALTER TABLE `comment_reply` DISABLE KEYS */;
INSERT INTO `comment_reply` VALUES
(1,1,1);
/*!40000 ALTER TABLE `comment_reply` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comments`
--

DROP TABLE IF EXISTS `comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comments` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL,
  `co_title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `co_body` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `comments_user_id_foreign` (`user_id`),
  CONSTRAINT `comments_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comments`
--

LOCK TABLES `comments` WRITE;
/*!40000 ALTER TABLE `comments` DISABLE KEYS */;
INSERT INTO `comments` VALUES
(1,1,'to leave a comment is easy as typing','<p>this is the first comment from me in this post</p>','2007-09-19 23:25:57','2007-09-19 23:25:57'),
(2,2,'this is very cool i like it','<p>hi there I know you are not available now but i just want to tell you that the moment here is very cool!!</p>','2022-02-25 10:31:50','2022-02-25 10:31:50');
/*!40000 ALTER TABLE `comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `courses`
--

DROP TABLE IF EXISTS `courses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `courses` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL,
  `course_year` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `course_term` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `course_credit` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `course_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `course_cover` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `course_excerpt` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `course_body` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `course_hours` int(11) NOT NULL,
  `course_is_free` tinyint(1) NOT NULL,
  `course_is_public` tinyint(1) NOT NULL,
  `released_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `courses_user_id_foreign` (`user_id`),
  CONSTRAINT `courses_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `courses`
--

LOCK TABLES `courses` WRITE;
/*!40000 ALTER TABLE `courses` DISABLE KEYS */;
/*!40000 ALTER TABLE `courses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `default_pages`
--

DROP TABLE IF EXISTS `default_pages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `default_pages` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL,
  `d_title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `d_slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `d_is_public` tinyint(1) NOT NULL DEFAULT 1,
  `d_body` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `default_pages_user_id_foreign` (`user_id`),
  CONSTRAINT `default_pages_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `default_pages`
--

LOCK TABLES `default_pages` WRITE;
/*!40000 ALTER TABLE `default_pages` DISABLE KEYS */;
/*!40000 ALTER TABLE `default_pages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `failed_jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `failed_jobs`
--

LOCK TABLES `failed_jobs` WRITE;
/*!40000 ALTER TABLE `failed_jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `failed_jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES
(1,'2014_10_12_000000_create_users_table',1),
(2,'2014_10_12_100000_create_password_resets_table',1),
(3,'2019_08_19_000000_create_failed_jobs_table',1),
(4,'2019_12_14_000001_create_personal_access_tokens_table',1),
(5,'2022_01_29_040634_create_whatups_table',1),
(6,'2022_01_29_085930_create_roles_table',1),
(7,'2022_01_31_013613_create_visitors_table',1),
(8,'2022_02_07_033105_create_class_rooms_table',1),
(9,'2022_02_07_060619_create_courses_table',1),
(10,'2022_02_07_063537_create_blogs_table',1),
(11,'2022_02_07_063655_create_comments_table',1),
(12,'2022_02_07_063710_create_categories_table',1),
(13,'2022_02_07_063726_create_tags_table',1),
(14,'2022_02_07_204021_create_replies_table',1),
(15,'2022_02_07_204439_create_reads_table',1),
(16,'2022_02_17_143644_create_default_pages_table',1),
(17,'2022_02_27_025956_create_students_table',1),
(18,'2022_02_27_030101_create_teachers_table',1);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_resets`
--

LOCK TABLES `password_resets` WRITE;
/*!40000 ALTER TABLE `password_resets` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_resets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `personal_access_tokens`
--

DROP TABLE IF EXISTS `personal_access_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personal_access_tokens`
--

LOCK TABLES `personal_access_tokens` WRITE;
/*!40000 ALTER TABLE `personal_access_tokens` DISABLE KEYS */;
INSERT INTO `personal_access_tokens` VALUES
(2,'App\\Models\\User',1,'auth_token','48d5d8d2a28e221475078585468bfbb9b48af5e5465ed9b94e58750f27e1efa4','[\"*\"]',NULL,'2022-04-17 13:40:26','2022-04-17 13:40:26');
/*!40000 ALTER TABLE `personal_access_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reads`
--

DROP TABLE IF EXISTS `reads`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reads` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `ip` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `os` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `device` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `browser` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reads`
--

LOCK TABLES `reads` WRITE;
/*!40000 ALTER TABLE `reads` DISABLE KEYS */;
INSERT INTO `reads` VALUES
(1,'127.0.0.1','Linux Ubuntu','WebKit','Chrome 97.0.4692.71','2007-10-29 05:22:13','2007-10-29 05:22:13'),
(2,'223.24.154.236','AndroidOS 10','Xiaomi','Chrome 89.0.4389.116','2022-02-25 15:31:45','2022-02-25 15:31:45'),
(3,'49.237.15.19','iOS 15_3','iPhone','Safari 604.1','2022-03-13 06:09:03','2022-03-13 06:09:03'),
(4,'27.55.89.244','Linux ','WebKit','Chrome 97.0.4692.71','2022-03-13 11:58:35','2022-03-13 11:58:35'),
(5,'223.24.94.165','Linux ','WebKit','Chrome 97.0.4692.71','2022-03-14 01:15:38','2022-03-14 01:15:38'),
(6,'27.55.79.106','Linux ','WebKit','Chrome 97.0.4692.71','2022-03-14 08:51:42','2022-03-14 08:51:42'),
(7,'61.90.31.83','iOS 15_3_1','iPhone','Safari ','2022-03-14 09:34:14','2022-03-14 09:34:14'),
(8,'223.24.94.248','Linux ','WebKit','Chrome 97.0.4692.71','2022-03-14 10:39:33','2022-03-14 10:39:33'),
(9,'223.24.169.108','Linux ','WebKit','Chrome 99.0.4844.51','2022-03-16 22:24:08','2022-03-16 22:24:08'),
(10,'223.24.153.88','AndroidOS 7.1.1','WebKit','Chrome 98.0.4758.101','2022-03-28 02:12:02','2022-03-28 02:12:02');
/*!40000 ALTER TABLE `reads` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `replies`
--

DROP TABLE IF EXISTS `replies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `replies` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL,
  `re_title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `re_body` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `replies_user_id_foreign` (`user_id`),
  CONSTRAINT `replies_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `replies`
--

LOCK TABLES `replies` WRITE;
/*!40000 ALTER TABLE `replies` DISABLE KEYS */;
INSERT INTO `replies` VALUES
(1,1,'this i my first reply to you','<p>hi there i know this very easy method for me to subscription ha ha&nbsp;</p>','2007-12-24 00:59:38','2007-12-24 00:59:38');
/*!40000 ALTER TABLE `replies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role_user`
--

DROP TABLE IF EXISTS `role_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `role_user` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL,
  `role_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `role_user_user_id_foreign` (`user_id`),
  KEY `role_user_role_id_foreign` (`role_id`),
  CONSTRAINT `role_user_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE,
  CONSTRAINT `role_user_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role_user`
--

LOCK TABLES `role_user` WRITE;
/*!40000 ALTER TABLE `role_user` DISABLE KEYS */;
INSERT INTO `role_user` VALUES
(1,1,1),
(2,1,2),
(3,2,2),
(4,3,2),
(5,3,4),
(6,4,2),
(7,4,3),
(8,5,2),
(9,5,3),
(10,6,2),
(11,6,4),
(12,7,2),
(13,7,4),
(14,8,3),
(15,8,4),
(16,9,2),
(17,9,4);
/*!40000 ALTER TABLE `role_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `roles` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `role_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES
(1,'admin','2007-10-28 18:02:03','2007-10-28 18:02:03'),
(2,'member','2007-10-28 18:02:03','2007-10-28 18:02:03'),
(3,'teacher','2007-10-28 18:02:03','2007-10-28 18:02:03'),
(4,'student','2007-10-28 18:02:03','2007-10-28 18:02:03');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `students`
--

DROP TABLE IF EXISTS `students`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `students` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL,
  `class_room_id` bigint(20) unsigned NOT NULL,
  `studied_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `successed_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `students_user_id_foreign` (`user_id`),
  KEY `students_class_room_id_foreign` (`class_room_id`),
  CONSTRAINT `students_class_room_id_foreign` FOREIGN KEY (`class_room_id`) REFERENCES `class_rooms` (`id`) ON DELETE CASCADE,
  CONSTRAINT `students_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `students`
--

LOCK TABLES `students` WRITE;
/*!40000 ALTER TABLE `students` DISABLE KEYS */;
/*!40000 ALTER TABLE `students` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tags`
--

DROP TABLE IF EXISTS `tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tags` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `tag_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tags`
--

LOCK TABLES `tags` WRITE;
/*!40000 ALTER TABLE `tags` DISABLE KEYS */;
INSERT INTO `tags` VALUES
(1,'linux','2007-10-29 05:16:39','2007-10-29 05:16:39'),
(2,'วิชาประกันภัย','2022-02-25 14:08:15','2022-02-25 14:08:15'),
(3,'ที่ระลึก','2022-02-25 14:08:15','2022-02-25 14:08:15'),
(4,'ขายของ','2022-03-11 08:38:09','2022-03-11 08:38:09'),
(5,'เรียนออนไลน์','2022-03-11 08:38:18','2022-03-11 08:38:18'),
(6,'ทำเวปกับลุงฟา','2022-03-11 08:38:40','2022-03-11 08:38:40'),
(7,'ทำเวปเอง','2022-03-11 08:38:51','2022-03-11 08:38:51'),
(8,'ไปเที่ยวกันมั้ย','2022-02-25 14:08:15','2022-02-25 14:08:15');
/*!40000 ALTER TABLE `tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teachers`
--

DROP TABLE IF EXISTS `teachers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `teachers` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL,
  `allow_edit` tinyint(1) NOT NULL,
  `is_available` tinyint(1) NOT NULL,
  `teached_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `teachers_user_id_foreign` (`user_id`),
  CONSTRAINT `teachers_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teachers`
--

LOCK TABLES `teachers` WRITE;
/*!40000 ALTER TABLE `teachers` DISABLE KEYS */;
/*!40000 ALTER TABLE `teachers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_admin` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES
(1,'farook','farook@me.me','2007-09-09 19:36:17','$2y$10$iKi.yWrpeYupRyyC0IpcZeSevb0w7sDXFr6eEN0NFlNnvI3tml4A2',NULL,'1','2007-09-09 19:30:29','2007-09-09 19:36:17'),
(2,'kenny','kenny@me.me','2007-10-28 19:36:17','$2y$10$iKi.yWrpeYupRyyC0IpcZeSevb0w7sDXFr6eEN0NFlNnvI3tml4A2',NULL,'0','2007-10-28 19:30:29','2007-10-28 19:36:17'),
(3,'susy','susy@me.me','2009-10-28 19:36:17','$2y$10$iKi.yWrpeYupRyyC0IpcZeSevb0w7sDXFr6eEN0NFlNnvI3tml4A2',NULL,'0','2009-10-28 19:30:29','2009-10-28 19:36:17'),
(4,'moddang','mod@me.me','2009-10-28 19:36:17','$2y$10$iKi.yWrpeYupRyyC0IpcZeSevb0w7sDXFr6eEN0NFlNnvI3tml4A2',NULL,'0','2007-10-28 19:30:29','2007-10-28 19:36:17'),
(5,'meen','meen@me.me','2009-10-28 19:36:17','$2y$10$iKi.yWrpeYupRyyC0IpcZeSevb0w7sDXFr6eEN0NFlNnvI3tml4A2',NULL,'0','2007-10-28 19:30:29','2007-10-28 19:36:17'),
(6,'mood','mood@me.me','2009-10-28 19:36:17','$2y$10$iKi.yWrpeYupRyyC0IpcZeSevb0w7sDXFr6eEN0NFlNnvI3tml4A2',NULL,'0','2007-10-28 19:30:29','2007-10-28 19:36:17'),
(7,'padi','padi@me.me','2009-10-28 19:36:17','$2y$10$iKi.yWrpeYupRyyC0IpcZeSevb0w7sDXFr6eEN0NFlNnvI3tml4A2',NULL,'0','2007-10-28 19:30:29','2007-10-28 19:36:17'),
(8,'prix','prix@me.me','2009-10-28 19:36:17','$2y$10$iKi.yWrpeYupRyyC0IpcZeSevb0w7sDXFr6eEN0NFlNnvI3tml4A2',NULL,'0','2007-10-28 19:30:29','2007-10-28 19:36:17'),
(9,'pim','pim@me.me','2009-10-28 19:36:17','$2y$10$iKi.yWrpeYupRyyC0IpcZeSevb0w7sDXFr6eEN0NFlNnvI3tml4A2',NULL,'0','2007-10-28 19:30:29','2007-10-28 19:36:17');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `visitors`
--

DROP TABLE IF EXISTS `visitors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `visitors` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `ip` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `os` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `browser` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `device` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'unknow bot',
  `visited_at` datetime NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=97 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `visitors`
--

LOCK TABLES `visitors` WRITE;
/*!40000 ALTER TABLE `visitors` DISABLE KEYS */;
INSERT INTO `visitors` VALUES
(1,'127.0.0.1','Linux Ubuntu','Chrome 97.0.4692.71','WebKit','2007-02-17 12:26:02','2007-02-17 05:26:02','2007-02-17 05:26:02'),
(2,'223.24.153.20','Linux ','Chrome 97.0.4692.71','WebKit','2022-02-25 22:30:31','2022-02-25 15:30:31','2022-02-25 15:30:31'),
(3,'223.24.154.236','AndroidOS 10','Chrome 89.0.4389.116','Xiaomi','2022-02-25 22:31:45','2022-02-25 15:31:45','2022-02-25 15:31:45'),
(4,'17.121.112.237','OS X 10_15_5','Safari 13.1.1','Macintosh','2022-02-26 01:40:49','2022-02-25 18:40:49','2022-02-25 18:40:49'),
(5,'66.249.79.58','AndroidOS 6.0.1','Chrome 98.0.4758.102','Nexus','2022-02-26 05:02:57','2022-02-25 22:02:57','2022-02-25 22:02:57'),
(6,'66.249.79.225','AndroidOS 6.0.1','Chrome 98.0.4758.102','Nexus','2022-02-26 14:16:27','2022-02-26 07:16:27','2022-02-26 07:16:27'),
(7,'17.121.112.193','OS X 10_15_5','Safari 13.1.1','Macintosh','2022-02-27 17:55:36','2022-02-27 10:55:36','2022-02-27 10:55:36'),
(8,'114.119.151.50','AndroidOS 7.0','Safari 537.36','WebKit','2022-02-28 01:09:50','2022-02-27 18:09:50','2022-02-27 18:09:50'),
(9,'66.249.79.58','AndroidOS 6.0.1','Chrome 98.0.4758.102','Nexus','2022-03-01 00:58:03','2022-02-28 17:58:03','2022-02-28 17:58:03'),
(10,'66.249.79.225','AndroidOS 6.0.1','Chrome 98.0.4758.102','Nexus','2022-03-01 02:03:03','2022-02-28 19:03:03','2022-02-28 19:03:03'),
(11,'66.249.79.225',' ','Chrome 98.0.4758.102','Bot','2022-03-02 07:57:40','2022-03-02 00:57:40','2022-03-02 00:57:40'),
(12,'40.77.189.92','Windows 6.1','Mozilla ','WebKit','2022-03-03 17:05:22','2022-03-03 10:05:22','2022-03-03 10:05:22'),
(13,'66.249.79.225',' ','Chrome 98.0.4758.102','Bot','2022-03-03 18:50:28','2022-03-03 11:50:28','2022-03-03 11:50:28'),
(14,'223.24.187.59','Linux ','Chrome 97.0.4692.71','WebKit','2022-03-04 07:11:00','2022-03-04 00:11:00','2022-03-04 00:11:00'),
(15,'114.119.156.142','AndroidOS 7.0','Safari 537.36','WebKit','2022-03-04 10:31:08','2022-03-04 03:31:08','2022-03-04 03:31:08'),
(16,'66.249.79.225',' ','Chrome 98.0.4758.102','Bot','2022-03-04 14:34:19','2022-03-04 07:34:19','2022-03-04 07:34:19'),
(17,'66.249.79.58',' ','Chrome 98.0.4758.102','Bot','2022-03-05 11:23:00','2022-03-05 04:23:00','2022-03-05 04:23:00'),
(18,'66.249.79.227','AndroidOS 6.0.1','Chrome 98.0.4758.102','Nexus','2022-03-05 13:11:32','2022-03-05 06:11:32','2022-03-05 06:11:32'),
(19,'66.249.79.225','AndroidOS 6.0.1','Chrome 98.0.4758.102','Nexus','2022-03-05 22:26:59','2022-03-05 15:26:59','2022-03-05 15:26:59'),
(20,'49.237.9.99','Linux ','Chrome 97.0.4692.71','WebKit','2022-03-06 08:48:08','2022-03-06 01:48:08','2022-03-06 01:48:08'),
(21,'223.24.149.71','Linux ','Chrome 97.0.4692.71','WebKit','2022-03-11 18:43:52','2022-03-11 11:43:52','2022-03-11 11:43:52'),
(22,'17.121.113.181','OS X 10_15_5','Safari 13.1.1','Macintosh','2022-03-12 02:49:02','2022-03-11 19:49:02','2022-03-11 19:49:02'),
(23,'27.55.80.133','Linux ','Chrome 97.0.4692.71','WebKit','2022-03-12 05:00:53','2022-03-11 22:00:53','2022-03-11 22:00:53'),
(24,'49.237.10.55','Linux ','Chrome 97.0.4692.71','WebKit','2022-03-13 07:38:45','2022-03-13 00:38:45','2022-03-13 00:38:45'),
(25,'223.24.162.238','Linux ','Chrome 97.0.4692.71','WebKit','2022-03-13 10:54:35','2022-03-13 03:54:35','2022-03-13 03:54:35'),
(26,'114.119.152.139','AndroidOS 7.0','Safari 537.36','WebKit','2022-03-13 11:59:25','2022-03-13 04:59:25','2022-03-13 04:59:25'),
(27,'49.237.15.19','iOS 15_3','Safari 604.1','iPhone','2022-03-13 13:08:34','2022-03-13 06:08:34','2022-03-13 06:08:34'),
(28,'27.55.76.249','Linux ','Chrome 97.0.4692.71','WebKit','2022-03-13 15:24:07','2022-03-13 08:24:07','2022-03-13 08:24:07'),
(29,'223.24.165.218','Linux ','Chrome 97.0.4692.71','WebKit','2022-03-13 17:40:42','2022-03-13 10:40:42','2022-03-13 10:40:42'),
(30,'27.55.89.244','Linux ','Chrome 97.0.4692.71','WebKit','2022-03-13 18:58:21','2022-03-13 11:58:21','2022-03-13 11:58:21'),
(31,'17.121.113.251','OS X 10_15_5','Safari 13.1.1','Macintosh','2022-03-13 21:58:14','2022-03-13 14:58:14','2022-03-13 14:58:14'),
(32,'65.154.226.171','Windows 10.0','Chrome 76.0.3809.71','WebKit','2022-03-13 23:27:21','2022-03-13 16:27:21','2022-03-13 16:27:21'),
(33,'223.24.94.165','Linux ','Chrome 97.0.4692.71','WebKit','2022-03-14 08:15:27','2022-03-14 01:15:27','2022-03-14 01:15:27'),
(34,'65.154.226.168','Windows 10.0','Chrome 76.0.3809.71','WebKit','2022-03-14 11:59:49','2022-03-14 04:59:49','2022-03-14 04:59:49'),
(35,'66.249.79.118',' ','Chrome 98.0.4758.102','Bot','2022-03-14 12:51:08','2022-03-14 05:51:08','2022-03-14 05:51:08'),
(36,'27.55.79.106','Linux ','Chrome 97.0.4692.71','WebKit','2022-03-14 14:08:43','2022-03-14 07:08:43','2022-03-14 07:08:43'),
(37,'66.249.79.149','AndroidOS 6.0.1','Chrome 98.0.4758.102','Nexus','2022-03-14 14:21:29','2022-03-14 07:21:29','2022-03-14 07:21:29'),
(38,'61.90.31.83','iOS 15_3_1','Safari ','iPhone','2022-03-14 16:34:13','2022-03-14 09:34:13','2022-03-14 09:34:13'),
(39,'223.24.94.248','Linux ','Chrome 97.0.4692.71','WebKit','2022-03-14 17:39:21','2022-03-14 10:39:21','2022-03-14 10:39:21'),
(40,'66.249.79.98','AndroidOS 6.0.1','Chrome 98.0.4758.102','Nexus','2022-03-14 23:11:21','2022-03-14 16:11:21','2022-03-14 16:11:21'),
(41,'66.249.68.79','AndroidOS 6.0.1','Chrome 98.0.4758.102','Nexus','2022-03-15 12:02:54','2022-03-15 05:02:54','2022-03-15 05:02:54'),
(42,'40.77.188.44','Windows 6.1','Mozilla ','WebKit','2022-03-16 12:07:14','2022-03-16 05:07:14','2022-03-16 05:07:14'),
(43,'66.249.79.118','AndroidOS 6.0.1','Chrome 98.0.4758.102','Nexus','2022-03-16 20:44:32','2022-03-16 13:44:32','2022-03-16 13:44:32'),
(44,'223.24.169.108','Linux ','Chrome 99.0.4844.51','WebKit','2022-03-17 05:23:22','2022-03-16 22:23:22','2022-03-16 22:23:22'),
(45,'66.249.79.151','AndroidOS 6.0.1','Chrome 98.0.4758.102','Nexus','2022-03-17 05:50:38','2022-03-16 22:50:38','2022-03-16 22:50:38'),
(46,'66.249.79.116','AndroidOS 6.0.1','Chrome 98.0.4758.102','Nexus','2022-03-17 21:31:08','2022-03-17 14:31:08','2022-03-17 14:31:08'),
(47,'49.237.8.156','Linux ','Chrome 97.0.4692.71','WebKit','2022-03-18 08:49:55','2022-03-18 01:49:55','2022-03-18 01:49:55'),
(48,'114.119.159.152','AndroidOS 7.0','Safari 537.36','WebKit','2022-03-18 21:52:55','2022-03-18 14:52:55','2022-03-18 14:52:55'),
(49,'66.249.79.149',' ','Chrome 98.0.4758.102','Bot','2022-03-19 07:45:32','2022-03-19 00:45:32','2022-03-19 00:45:32'),
(50,'66.249.79.116','AndroidOS 6.0.1','Chrome 98.0.4758.102','Nexus','2022-03-19 22:21:11','2022-03-19 15:21:11','2022-03-19 15:21:11'),
(51,'66.249.79.153','AndroidOS 6.0.1','Chrome 98.0.4758.102','Nexus','2022-03-20 09:20:03','2022-03-20 02:20:03','2022-03-20 02:20:03'),
(52,'66.249.79.116',' ','Chrome 98.0.4758.102','Bot','2022-03-20 12:51:06','2022-03-20 05:51:06','2022-03-20 05:51:06'),
(53,'17.121.114.18','OS X 10_15_5','Safari 13.1.1','Macintosh','2022-03-20 13:34:45','2022-03-20 06:34:45','2022-03-20 06:34:45'),
(54,'17.121.113.171','OS X 10_15_5','Safari 13.1.1','Macintosh','2022-03-20 14:57:34','2022-03-20 07:57:34','2022-03-20 07:57:34'),
(55,'17.121.114.246','OS X 10_15_5','Safari 13.1.1','Macintosh','2022-03-20 16:27:13','2022-03-20 09:27:13','2022-03-20 09:27:13'),
(56,'17.121.114.229','OS X 10_15_5','Safari 13.1.1','Macintosh','2022-03-20 16:40:57','2022-03-20 09:40:57','2022-03-20 09:40:57'),
(57,'17.121.115.67','OS X 10_15_5','Safari 13.1.1','Macintosh','2022-03-20 18:10:27','2022-03-20 11:10:27','2022-03-20 11:10:27'),
(58,'40.77.188.91','Windows 6.1','Mozilla ','WebKit','2022-03-21 08:18:54','2022-03-21 01:18:54','2022-03-21 01:18:54'),
(59,'66.249.79.151',' ','Chrome 98.0.4758.102','Bot','2022-03-22 20:57:53','2022-03-22 13:57:53','2022-03-22 13:57:53'),
(60,'66.249.79.118','AndroidOS 6.0.1','Chrome 98.0.4758.102','Nexus','2022-03-23 06:21:17','2022-03-22 23:21:17','2022-03-22 23:21:17'),
(61,'223.24.168.111','Linux ','Chrome 97.0.4692.71','WebKit','2022-03-24 11:02:58','2022-03-24 04:02:58','2022-03-24 04:02:58'),
(62,'66.249.79.118','AndroidOS 6.0.1','Chrome 98.0.4758.102','Nexus','2022-03-24 13:30:30','2022-03-24 06:30:30','2022-03-24 06:30:30'),
(63,'66.249.79.149','AndroidOS 6.0.1','Chrome 98.0.4758.102','Nexus','2022-03-24 14:53:55','2022-03-24 07:53:55','2022-03-24 07:53:55'),
(64,'66.249.79.151','AndroidOS 6.0.1','Chrome 98.0.4758.102','Nexus','2022-03-24 16:00:06','2022-03-24 09:00:06','2022-03-24 09:00:06'),
(65,'17.121.114.227','OS X 10_15_5','Safari 13.1.1','Macintosh','2022-03-24 16:03:40','2022-03-24 09:03:40','2022-03-24 09:03:40'),
(66,'66.249.79.116','AndroidOS 6.0.1','Chrome 98.0.4758.102','Nexus','2022-03-24 20:28:01','2022-03-24 13:28:01','2022-03-24 13:28:01'),
(67,'114.119.159.92','AndroidOS 7.0','Safari 537.36','WebKit','2022-03-25 04:17:19','2022-03-24 21:17:19','2022-03-24 21:17:19'),
(68,'223.24.158.68','Linux ','Chrome 97.0.4692.71','WebKit','2022-03-25 05:35:33','2022-03-24 22:35:33','2022-03-24 22:35:33'),
(69,'66.249.79.116','AndroidOS 6.0.1','Chrome 98.0.4758.102','Nexus','2022-03-25 11:51:22','2022-03-25 04:51:22','2022-03-25 04:51:22'),
(70,'66.249.79.149',' ','Chrome 98.0.4758.102','Bot','2022-03-25 23:23:38','2022-03-25 16:23:38','2022-03-25 16:23:38'),
(71,'17.121.113.131','OS X 10_15_5','Safari 13.1.1','Macintosh','2022-03-26 00:46:33','2022-03-25 17:46:33','2022-03-25 17:46:33'),
(72,'17.121.113.188','OS X 10_15_5','Safari 13.1.1','Macintosh','2022-03-26 01:55:58','2022-03-25 18:55:58','2022-03-25 18:55:58'),
(73,'66.249.79.116','AndroidOS 6.0.1','Chrome 98.0.4758.102','Nexus','2022-03-27 15:03:20','2022-03-27 08:03:20','2022-03-27 08:03:20'),
(74,'40.77.190.73','Windows 6.1','Mozilla ','WebKit','2022-03-27 16:46:11','2022-03-27 09:46:11','2022-03-27 09:46:11'),
(75,'223.24.153.88','Linux ','Chrome 97.0.4692.71','WebKit','2022-03-28 09:07:57','2022-03-28 02:07:57','2022-03-28 02:07:57'),
(76,'49.237.9.210','Linux ','Chrome 99.0.4844.82','WebKit','2022-03-29 08:50:25','2022-03-29 01:50:25','2022-03-29 01:50:25'),
(77,'66.249.79.118','AndroidOS 6.0.1','Chrome 99.0.4844.74','Nexus','2022-03-29 08:53:20','2022-03-29 01:53:20','2022-03-29 01:53:20'),
(78,'66.249.79.116',' ','Chrome 99.0.4844.74','Bot','2022-03-29 08:53:24','2022-03-29 01:53:24','2022-03-29 01:53:24'),
(79,'223.24.165.228','AndroidOS 10','Chrome 99.0.4844.73','WebKit','2022-03-29 17:29:01','2022-03-29 10:29:01','2022-03-29 10:29:01'),
(80,'223.24.61.244','AndroidOS 7.1.1','Chrome 98.0.4758.101','WebKit','2022-03-30 20:08:55','2022-03-30 13:08:55','2022-03-30 13:08:55'),
(81,'223.24.190.68','AndroidOS 10','Chrome 88.0.4324.93','WebKit','2022-03-30 20:56:38','2022-03-30 13:56:38','2022-03-30 13:56:38'),
(82,'66.249.79.149','AndroidOS 6.0.1','Chrome 99.0.4844.74','Nexus','2022-03-30 22:08:45','2022-03-30 15:08:45','2022-03-30 15:08:45'),
(83,'223.24.166.95','AndroidOS 10','Chrome 88.0.4324.93','WebKit','2022-03-31 07:33:47','2022-03-31 00:33:47','2022-03-31 00:33:47'),
(84,'66.249.79.118',' ','Chrome 99.0.4844.74','Bot','2022-03-31 09:48:33','2022-03-31 02:48:33','2022-03-31 02:48:33'),
(85,'17.121.113.194','OS X 10_15_5','Safari 13.1.1','Macintosh','2022-04-01 13:38:47','2022-04-01 06:38:47','2022-04-01 06:38:47'),
(86,'114.119.158.165','AndroidOS 7.0','Safari 537.36','WebKit','2022-04-01 15:28:11','2022-04-01 08:28:11','2022-04-01 08:28:11'),
(87,'66.249.79.118',' ','Chrome 99.0.4844.84','Bot','2022-04-01 16:24:10','2022-04-01 09:24:10','2022-04-01 09:24:10'),
(88,'17.121.115.122','OS X 10_15_5','Safari 13.1.1','Macintosh','2022-04-01 22:58:51','2022-04-01 15:58:51','2022-04-01 15:58:51');
/*!40000 ALTER TABLE `visitors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `whatups`
--

DROP TABLE IF EXISTS `whatups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `whatups` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL,
  `wp_title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wp_body` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_public` tinyint(1) DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `whatups_user_id_foreign` (`user_id`),
  CONSTRAINT `whatups_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `whatups`
--

LOCK TABLES `whatups` WRITE;
/*!40000 ALTER TABLE `whatups` DISABLE KEYS */;
INSERT INTO `whatups` VALUES
(1,1,'setup your project in different directory name','\n    <p class=\"title has-text-centered has-text-danger\">\n        I am your backup do not delete me.\n    </p>\n    <p>\n\nif your project folder is not \"blp.proj\" please make sure that you edit the \nfile  \"app/config/sanctum.php\" you may have your project folder into the list \nof \"stateful\" just to prevent from having a login problem \"cannot set token\"\n    \n    </p> \n\n    ',1,'2007-10-29 12:11:13','2007-10-29 12:11:13'),
(2,1,'cannot export my database from phpmyadmin','<p class=\"title\">\r\n    phpmyadmin fail to export database\r\n</p>\r\n<p class=\"subtitle\">\r\n    use command line \"mysqldump\" instead\r\n</p>\r\n<p class=\"mb-4\">\r\n    I just have facing this problem today(29 Mar 2022) while I tried to update my blog on \"baanlungpa.com\" but the database export is fail cannot export by some reason \r\n</p>\r\n<div>\r\n    <figure class=\"justify-content-center\">\r\n        <img src=\"https://i.ibb.co/tYVPQSs/cannot-export-db-phpmyadmin.png\">\r\n    </figure>\r\n    <p class=\"pt-2 has-text-centered\">\r\n        phpmyadmin error export on 29 mar 2022\r\n    </p>\r\n</div>\r\n<p>\r\n    so I just google it with the keyword \"arch linux cannot export .sql file\" then I found the command for it my command I use is \r\n</p>\r\n<div class=\"field\">\r\n    <span class=\"code\">\r\n        \r\n        mysqldump -u root -p mydatabasename&gt;~/filename.sql\r\n    </span>\r\n</div>\r\n<p>\r\n    so now I can use phpmyadmin to import the sql script to my website just like what i want, problem solved! \r\n</p>',1,'2022-03-29 18:26:26','2022-03-29 19:20:40'),
(3,1,'มาทดลองใช้งาน ms office online ฟรีๆ ดีๆ กันครับ','<div class=\"content\">\r\n    <p class=\"title\">\r\n        แก้ไขไฟลเอกสารบนคอมในเวปบราวเซอร์ \r\n    </p>\r\n    <p>\r\n        ถ้าท่านมีคอมมากกว่า 1 เครื่องการจะทำให้ไฟล์เอกสารมันเหมือนกันในคอมอีกเครื่องแน่นอนว่ามันคงจะทำได้ยาก(มันทำได้แต่อาจจะต้องเรียนรู้กันหน่อยนึง) แต่ไหนๆ ก้ใช้โปรแกรม ms office ทำงานอยู่แล้ว มันก้คงจะไม่ยากอะไรถ้าจะลองใช้ใน ms office onilne ดูบ้าง คลิกดูวิดิโอสิ\r\n    </p>\r\n    <div class=\"video-container\">\r\n        <iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/3GoWfm5Qw1w\" title=\"YouTube video player\" frameborder=\"0\" allow=\"accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture\" allowfullscreen=\"\"></iframe>\r\n    </div>\r\n    <p class=\"has-text-centered pt-2\">\r\n        ใช้งานโปรแกรม ms office online\r\n    </p>\r\n    <p class=\"mt-2 pt-2 mb-4\">\r\n        <span class=\"tag has-text-info\">\r\n            ตัวผมเอง\r\n        </span>\r\n        ผมไม่ค่อยได้ใช้งานพวกโปรแกรมออฟฟิสนะครับ เพราะฉะนั้นความรู้ผมคือ \"ความมั่ว\" ล้วนๆ 100% ครับ\r\n    </p>\r\n</div>',1,'2022-03-30 03:58:42','2022-03-30 03:58:42'),
(4,1,'สมัครบัญชี hotmail ,live หรือ outlook กับ ไมโครซอฟท์','<div class=\"content\">\r\n    <p class=\"title\">\r\n        วิธีการสมัครบัญชี hotmail,live,outlook\r\n    </p>\r\n    <p>\r\n        สำหรับท่านใดที่ยังไม่มีบัญชี hotmail,live,outlook ของ ไมโครซอฟท์ ลองดูวิธีสมัครในวิดิโอนี้ครับ (บางครั้งปกวิดิโออาจจะไม่โชว์นะครับ ให้กดที่ตัวเล่นวิดิโอ มันก็จะเล่นได้ปรกติ)\r\n        \r\n    </p>\r\n    <div class=\"video-container\">\r\n        <iframe width=\"560\" height=\"315\" src=\"https://www.youtube-nocookie.com/embed/8nti89eO7Lc\" title=\"YouTube video player\" frameborder=\"0\" allow=\"accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture\" allowfullscreen=\"\"></iframe>\r\n    </div>\r\n    <p class=\"pt-2 has-text-centered\">\r\n        วิธีสมัครอีเมล hotmail ,outlook ตามแบบลุงฟา\r\n    </p>\r\n    <p class=\"pt-4 mt-2 mb-4\">ไหนๆ ถ้าเราต้องใช้ ms office ทำงานอยู่แล้ว การ&nbsp;sync งานเอกสารในเครื่องของเรากับบัญชี hotmail ของเราก็น่าจะสะดวกและไม่ต้องกังวลว่าไฟลเอกสารของเราจะหาย หรือไม่ได้จัดเก็บ หรือถ้าเราต้องเปิดไฟล์ๆ นั้นจากเครื่องอื่นๆ เราก้สามารถทำได้ง่ายๆ&nbsp;</p>\r\n</div>',1,'2022-03-30 07:01:12','2022-03-30 07:01:12'),
(5,1,'มาละลุร้อนละลาย 14-04-2565','<p>\r\n    วันสงกรานต์อย่าไปไหนกันไกลๆ รถมันเยอะ แย่งกินแย่งกันเที่ยวมันน่าสนุกตรงไหน ไปแต่เรากันดีกว่า มาละลุจะได้ร้อนกันละลาย สะใจวันสงกรานต์\r\n</p>\r\n<div class=\"video-container\">\r\n    <iframe id=\"odysee-iframe\" width=\"560\" height=\"315\" src=\"https://odysee.com/$/embed/la-lu-14-apr-2022/be91961bc667e9d94289319fcbd4be6b587cd948?r=2YnWiNbGCXfEhJyem4TFEz8FTkHv5dEg\" allowfullscreen=\"\"></iframe>\r\n</div>\r\n<p class=\"has-text-centered pt-2\">\r\n    มาเที่ยวละลุกับป้า วันที่ 14-04-2565 เที่ยวละลุ ร้อนละลาย ให้ได้ประสบการณ์สิ</p>',1,'2022-04-17 13:34:42','2022-04-17 13:34:42');
/*!40000 ALTER TABLE `whatups` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-04-17 21:37:37
