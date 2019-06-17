-- --------------------------------------------------------
-- Host:                         localhost
-- Server version:               5.7.24 - MySQL Community Server (GPL)
-- Server OS:                    Win64
-- HeidiSQL Version:             9.5.0.5332
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- Dumping structure for table e-learningv.answers
CREATE TABLE IF NOT EXISTS `answers` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `question_id` int(11) DEFAULT NULL,
  `reponse` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table e-learningv.answers: ~8 rows (approximately)
/*!40000 ALTER TABLE `answers` DISABLE KEYS */;
INSERT INTO `answers` (`id`, `question_id`, `reponse`, `created_at`, `updated_at`) VALUES
	(4, 1, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ulla mco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.', '2019-04-19 09:17:15', '2019-04-19 09:17:15'),
	(5, 2, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ulla mco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.', '2019-04-19 09:17:15', '2019-04-19 09:17:15'),
	(6, 5, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ulla mco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.', '2019-04-19 09:17:15', '2019-04-19 09:17:15'),
	(7, 7, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ulla mco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.', '2019-04-19 09:17:15', '2019-04-19 09:17:15'),
	(8, 8, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ulla mco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.', '2019-04-19 09:17:15', '2019-04-19 09:17:15'),
	(9, 9, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ulla mco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.', '2019-04-19 09:17:15', '2019-04-19 09:17:15'),
	(10, 10, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ulla mco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.', '2019-04-19 09:17:15', '2019-04-19 09:17:15'),
	(11, 11, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ulla mco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.', '2019-04-19 09:17:15', '2019-04-19 09:17:15');
/*!40000 ALTER TABLE `answers` ENABLE KEYS */;

-- Dumping structure for table e-learningv.categories
CREATE TABLE IF NOT EXISTS `categories` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` int(10) unsigned DEFAULT NULL,
  `order` int(11) NOT NULL DEFAULT '1',
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `tag` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '#education',
  `description` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  UNIQUE KEY `categories_slug_unique` (`slug`),
  KEY `categories_parent_id_foreign` (`parent_id`),
  CONSTRAINT `categories_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `categories` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table e-learningv.categories: ~3 rows (approximately)
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` (`id`, `parent_id`, `order`, `name`, `slug`, `created_at`, `updated_at`, `tag`, `description`) VALUES
	(1, NULL, 1, 'Web development', 'web-development', '2019-04-17 08:40:03', '2019-04-19 08:48:03', '#web', 'In its most basic form, R can be used as a simple calculator. Consider the following arithmetic operators'),
	(2, NULL, 1, 'Web designer', 'web-designer', '2019-04-17 08:40:03', '2019-04-19 08:50:50', '#designer', 'In its most basic form, R can be used as a simple calculator. Consider the following arithmetic operators'),
	(3, NULL, 1, 'Graphic Design', 'graphic-design', '2019-04-23 16:56:00', '2019-04-23 16:56:00', '#graphic #design', 'In its most basic form, R can be used as a simple calculator. Consider the following arithmetic operators');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;

-- Dumping structure for table e-learningv.comments
CREATE TABLE IF NOT EXISTS `comments` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `comment` text COLLATE utf8mb4_unicode_ci,
  `student_id` int(11) DEFAULT '0',
  `course_id` int(11) DEFAULT '0',
  `teacher_id` int(11) DEFAULT '0',
  `type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `post_id` int(11) DEFAULT '0',
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table e-learningv.comments: ~8 rows (approximately)
/*!40000 ALTER TABLE `comments` DISABLE KEYS */;
INSERT INTO `comments` (`id`, `comment`, `student_id`, `course_id`, `teacher_id`, `type`, `created_at`, `updated_at`, `post_id`, `user_id`) VALUES
	(1, 'Sed ut perspiciatis unde omnis iste natus sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore.', 2, 4, 0, 'Student', '2019-04-26 09:06:02', '2019-04-26 09:06:02', 0, 2),
	(2, 'Sed ut perspiciatis unde omnis iste natus sit Sed ut perspiciatis unde omnis iste natus sit voluptatem accusantium doloremque laudantium.', 2, 4, 0, 'Student', '2019-04-26 09:06:39', '2019-04-26 09:06:39', 0, 2),
	(15, 'Sed ut perspiciatis unde omnis iste natus sit Sed ut perspiciatis unde omnis iste natus sit voluptatem accusantium doloremque laudantium.', 0, 4, 0, 'student', '2019-05-05 01:40:41', '2019-05-05 01:40:41', 0, 2),
	(25, 'Your email address will not be published. Required fields are marked *Your email address will not be published. Required fields are marked ***', 0, 4, 0, 'teacher', '2019-05-06 17:03:19', '2019-05-06 17:05:59', 0, 3),
	(28, 'n culpa qui officia deserunt mollitia animi, id est laborum et dolorum fuga. Et harum quidem rerum facilis est et expedita distinctio. Nam libero tempore, cum soluta nobis est eligendi optio cumque nihil impedit quo minus id quod **', 0, 0, 0, 'student', '2019-05-07 11:56:44', '2019-05-07 12:18:29', 3, 2),
	(29, 'in culpa qui officia deserunt mollitia animi, id est laborum et dolorum fuga. Et harum quidem rerum facilis est et expedita distinctio. Nam libero tempore, cum soluta nobis est eligendi optio cumque nihil impedit quo minus id quod *', 0, 0, 0, 'student', '2019-05-07 11:57:00', '2019-05-07 11:57:00', 3, 2),
	(30, 'in culpa qui officia deserunt mollitia animi, id est laborum et dolorum fuga. Et harum quidem rerum facilis est et expedita distinctio. Nam libero tempore, cum soluta nobis est eligendi optio cumque nihil impedit quo minus id quod ***', 0, 0, 0, 'student', '2019-05-07 12:01:32', '2019-05-07 12:01:32', 3, 2),
	(31, 'in culpa qui officia deserunt mollitia animi, id est laborum et dolorum fuga. Et harum quidem rerum facilis est et expedita distinctio. Nam libero tempore, cum soluta nobis est eligendi optio cumque nihil impedit quo minus id quod *', 0, 0, 0, 'teacher', '2019-05-23 12:19:05', '2019-05-23 12:19:05', 3, 12);
/*!40000 ALTER TABLE `comments` ENABLE KEYS */;

-- Dumping structure for table e-learningv.comment_replies
CREATE TABLE IF NOT EXISTS `comment_replies` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `comment` text COLLATE utf8mb4_unicode_ci,
  `comment_id` int(11) DEFAULT NULL,
  `student_id` int(11) DEFAULT NULL,
  `teacher_id` int(11) DEFAULT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `user_id` int(11) DEFAULT '2',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=62 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table e-learningv.comment_replies: ~11 rows (approximately)
/*!40000 ALTER TABLE `comment_replies` DISABLE KEYS */;
INSERT INTO `comment_replies` (`id`, `comment`, `comment_id`, `student_id`, `teacher_id`, `type`, `created_at`, `updated_at`, `user_id`) VALUES
	(1, 'Sed ut perspiciatis unde omnis iste natus sit voluptatem laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore.', 1, 2, 0, 'Student', '2019-04-26 09:08:00', '2019-04-26 09:08:00', 2),
	(2, 'Sed ut perspiciatis unde omnis iste natus sit voluptatem laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore.', 2, 2, 0, 'Student', '2019-04-26 09:08:25', '2019-04-26 09:08:25', 2),
	(3, 'Sed ut perspiciatis unde omnis iste natus sit voluptatem laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore.', 1, 0, 1, 'Teacher', '2019-04-26 09:08:00', '2019-04-26 09:08:00', 3),
	(4, 'Sed ut perspiciatis unde omnis iste natus sit voluptatem laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore.', 2, 0, 1, 'Teacher', '2019-04-26 09:08:00', '2019-04-26 09:08:00', 3),
	(55, 'Your email address will not be published. Required fields are marked *Your email address will not be published. Required fields are marked **', 25, NULL, NULL, 'student', '2019-05-06 18:51:00', '2019-05-06 18:51:00', 2),
	(56, 'Your email address will not be published. Required fields are marked *Your email address will not be published. Required fields are marked **', 25, NULL, NULL, 'student', '2019-05-06 18:52:37', '2019-05-06 18:52:37', 2),
	(57, 'in culpa qui officia deserunt mollitia animi, id est laborum et dolorum fuga. Et harum quidem rerum facilis est et expedita distinctio. Nam libero tempore, cum soluta nobis est eligendi optio cumque nihil impedit quo minus id quod *', 29, NULL, NULL, 'student', '2019-05-07 12:01:44', '2019-05-07 12:22:41', 2),
	(58, 'in culpa qui officia deserunt mollitia animi, id est laborum et dolorum fuga. Et harum quidem rerum facilis est et expedita distinctio. Nam libero tempore, cum soluta nobis est eligendi optio cumque nihil impedit quo minus id quod **', 28, NULL, NULL, 'student', '2019-05-07 12:02:14', '2019-05-07 12:02:14', 2),
	(59, 'in culpa qui officia deserunt mollitia animi, id est laborum et dolorum fuga. Et harum quidem rerum facilis est et expedita distinctio. Nam libero tempore, cum soluta nobis est eligendi optio cumque nihil impedit quo minus id quod ***', 30, NULL, NULL, 'student', '2019-05-07 12:02:28', '2019-05-07 12:03:27', 2),
	(60, 'in culpa qui officia deserunt mollitia animi, id est laborum et dolorum fuga. Et harum quidem rerum facilis est et expedita distinctio. Nam libero tempore, cum soluta nobis est eligendi optio cumque nihil impedit quo minus id quod *', 29, NULL, NULL, 'teacher', '2019-05-23 12:18:46', '2019-05-23 12:18:46', 12),
	(61, 'Sed ut perspiciatis unde omnis iste natus sit voluptatem laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore.', 15, NULL, NULL, 'teacher', '2019-05-26 17:18:53', '2019-05-26 17:18:53', 12);
/*!40000 ALTER TABLE `comment_replies` ENABLE KEYS */;

-- Dumping structure for table e-learningv.contacts
CREATE TABLE IF NOT EXISTS `contacts` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `full_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `object` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table e-learningv.contacts: ~4 rows (approximately)
/*!40000 ALTER TABLE `contacts` DISABLE KEYS */;
INSERT INTO `contacts` (`id`, `full_name`, `object`, `email`, `content`, `created_at`, `updated_at`) VALUES
	(23, 'Younass Mkhantar', 'hello world', 'youness@gmail.com', 'Browse 100 profile HTML website templates from $5 sorted by best sellers. All created by our Global Community of independent Web Designers and Developers.', '2019-05-21 13:24:44', '2019-05-21 13:24:44'),
	(24, 'Younass Mkhantar', 'hello world', 'youness@gmail.com', 'Browse 100 profile HTML website templates from $5 sorted by best sellers. All created by our Global Community of independent Web Designers and Developers.', '2019-05-21 13:25:35', '2019-05-21 13:25:35'),
	(25, 'Essoubaki Abdelkarim', 'hello world', 'essoubaki@gmail.com', 'Browse 100 profile HTML website templates from $5 sorted by best sellers. All created by our Global Community of independent Web Designers and Developers.', '2019-05-21 13:27:00', '2019-05-21 13:27:00'),
	(26, 'Said Elbaaqyly', 'Global Community', 'said.elbabqyly@gmail.com', 'Browse 100 profile HTML website templates from $5 sorted by best sellers. All created by our Global Community of independent Web Designers and Developers.', '2019-05-21 13:28:21', '2019-05-21 13:28:21');
/*!40000 ALTER TABLE `contacts` ENABLE KEYS */;

-- Dumping structure for table e-learningv.courses
CREATE TABLE IF NOT EXISTS `courses` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price` double DEFAULT '0',
  `duration` int(11) DEFAULT NULL,
  `language` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT 'English',
  `small_description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tag` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '#education',
  `location` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT 'ABC University',
  `nbr_student` int(11) DEFAULT '28',
  `level` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT 'Master',
  `active` binary(255) DEFAULT '0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',
  `category_id` int(11) DEFAULT NULL,
  `teacher_id` int(11) DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table e-learningv.courses: ~8 rows (approximately)
/*!40000 ALTER TABLE `courses` DISABLE KEYS */;
INSERT INTO `courses` (`id`, `title`, `price`, `duration`, `language`, `small_description`, `description`, `image`, `tag`, `location`, `nbr_student`, `level`, `active`, `category_id`, `teacher_id`, `slug`, `created_at`, `updated_at`) VALUES
	(1, 'Photoshop - Web Deisgn', 0, 78, 'English', 'Fusce eleifend donec sapien sed phase lusa. Pellentesque lacus vamus lorem arcu semper duiac. Cras ornare arcu avamus nda leo. Etiam ind arcu morbi justo mauris tempus pharetra interdum at congue semper purus.', '<h4 class="title-2" style="box-sizing: border-box; font-family: Montserrat, sans-serif; font-weight: inherit; line-height: 1.1; color: #333333; margin: 0px 0px 16px; font-size: 18px; vertical-align: baseline; padding: 0px; border: 0px; outline: 0px; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;">What You Will Learn</h4>\r\n<p style="box-sizing: border-box; margin: 0px 0px 20px; font-family: Poppins, sans-serif; font-size: 13px; vertical-align: baseline; padding: 0px; border: 0px; outline: 0px; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; color: #666666;">Fusce eleifend donec sapien sed phase lusa pellentesque lacus.Vivamus lorem arcu semper duiac. Cras ornare arcu avamus nda leo Etiam ind arcu. Morbi justo mauris tempus pharetra interdum at congue semper purus. Lorem ipsum dolor sit</p>\r\n<p class="marginbt-12px" style="box-sizing: border-box; margin: 0px 0px 12px; font-family: Poppins, sans-serif; font-size: 13px; vertical-align: baseline; padding: 0px; border: 0px; outline: 0px; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; color: #666666;">Lorem ipsum dolor sit amet, consectetur adipisicing elit sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>\r\n<ul class="flat-list color-black" style="box-sizing: border-box; margin: 0px 0px 32px; font-family: Poppins, sans-serif; font-size: 13px; vertical-align: baseline; padding: 0px 0px 0px 22px; border: 0px; outline: 0px; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; list-style: none; overflow: hidden; color: #666666;">\r\n<li style="box-sizing: border-box; font-family: inherit; font-weight: inherit; font-style: inherit; vertical-align: baseline; margin: 0px; padding: 6px 0px 6px 24px; border: 0px; outline: 0px; background: transparent; position: relative;">2 Glossaries for difficult terms &amp; acronyms</li>\r\n<li style="box-sizing: border-box; font-family: inherit; font-weight: inherit; font-style: inherit; vertical-align: baseline; margin: 0px; padding: 6px 0px 6px 24px; border: 0px; outline: 0px; background: transparent; position: relative;">25 hours of High Quality e-Learning content</li>\r\n<li style="box-sizing: border-box; font-family: inherit; font-weight: inherit; font-style: inherit; vertical-align: baseline; margin: 0px; padding: 6px 0px 6px 24px; border: 0px; outline: 0px; background: transparent; position: relative;">72 end of chapter quizzes</li>\r\n<li style="box-sizing: border-box; font-family: inherit; font-weight: inherit; font-style: inherit; vertical-align: baseline; margin: 0px; padding: 6px 0px 6px 24px; border: 0px; outline: 0px; background: transparent; position: relative;">30 PDUs Offered</li>\r\n<li style="box-sizing: border-box; font-family: inherit; font-weight: inherit; font-style: inherit; vertical-align: baseline; margin: 0px; padding: 6px 0px 6px 24px; border: 0px; outline: 0px; background: transparent; position: relative;">Collection of 47 six sigma tools for hands-on practice</li>\r\n</ul>', 'courses\\April2019\\85vkPkBZxxao9cTWXmqP.jpg', '#education #desinge', 'ABC University', 23, 'Master', _binary 0x310000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000, 2, 1, 'photoshop-web-deisgn', '2019-03-17 14:03:00', '2019-04-25 09:55:47'),
	(2, 'UI-UX Web Design, Graphic Design', 545, 87, 'English', 'Fusce eleifend donec sapien sed phase lusa. Pellentesque lacus vamus lorem arcu semper duiac. Cras ornare arcu avamus nda leo. Etiam ind arcu morbi justo mauris tempus pharetra interdum at congue semper purus.', '<h4 class="title-2" style="box-sizing: border-box; font-family: Montserrat, sans-serif; font-weight: inherit; line-height: 1.1; color: #333333; margin: 0px 0px 16px; font-size: 18px; vertical-align: baseline; padding: 0px; border: 0px; outline: 0px; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;">What You Will Learn</h4>\r\n<p style="box-sizing: border-box; margin: 0px 0px 20px; font-family: Poppins, sans-serif; font-size: 13px; vertical-align: baseline; padding: 0px; border: 0px; outline: 0px; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; color: #666666;">Fusce eleifend donec sapien sed phase lusa pellentesque lacus.Vivamus lorem arcu semper duiac. Cras ornare arcu avamus nda leo Etiam ind arcu. Morbi justo mauris tempus pharetra interdum at congue semper purus. Lorem ipsum dolor sit</p>\r\n<p class="marginbt-12px" style="box-sizing: border-box; margin: 0px 0px 12px; font-family: Poppins, sans-serif; font-size: 13px; vertical-align: baseline; padding: 0px; border: 0px; outline: 0px; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; color: #666666;">Lorem ipsum dolor sit amet, consectetur adipisicing elit sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>\r\n<ul class="flat-list color-black" style="box-sizing: border-box; margin: 0px 0px 32px; font-family: Poppins, sans-serif; font-size: 13px; vertical-align: baseline; padding: 0px 0px 0px 22px; border: 0px; outline: 0px; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; list-style: none; overflow: hidden; color: #666666;">\r\n<li style="box-sizing: border-box; font-family: inherit; font-weight: inherit; font-style: inherit; vertical-align: baseline; margin: 0px; padding: 6px 0px 6px 24px; border: 0px; outline: 0px; background: transparent; position: relative;">2 Glossaries for difficult terms &amp; acronyms</li>\r\n<li style="box-sizing: border-box; font-family: inherit; font-weight: inherit; font-style: inherit; vertical-align: baseline; margin: 0px; padding: 6px 0px 6px 24px; border: 0px; outline: 0px; background: transparent; position: relative;">25 hours of High Quality e-Learning content</li>\r\n<li style="box-sizing: border-box; font-family: inherit; font-weight: inherit; font-style: inherit; vertical-align: baseline; margin: 0px; padding: 6px 0px 6px 24px; border: 0px; outline: 0px; background: transparent; position: relative;">72 end of chapter quizzes</li>\r\n<li style="box-sizing: border-box; font-family: inherit; font-weight: inherit; font-style: inherit; vertical-align: baseline; margin: 0px; padding: 6px 0px 6px 24px; border: 0px; outline: 0px; background: transparent; position: relative;">30 PDUs Offered</li>\r\n<li style="box-sizing: border-box; font-family: inherit; font-weight: inherit; font-style: inherit; vertical-align: baseline; margin: 0px; padding: 6px 0px 6px 24px; border: 0px; outline: 0px; background: transparent; position: relative;">Collection of 47 six sigma tools for hands-on practice</li>\r\n</ul>', 'courses\\April2019\\gXTxJ8x1xZuxqXClEPHs.jpg', '#design', 'ABC University', 23, 'Master', _binary 0x310000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000, 2, 1, 'ui-ux-web-design-graphic-design', '2019-04-17 14:13:33', '2019-04-18 09:44:56'),
	(3, 'Painting and lorem Laravel', 100, 20, 'English', 'Fusce eleifend donec sapien sed phase lusa. Pellentesque lacus vamus lorem arcu semper duiac. Cras ornare arcu avamus nda leo. Etiam ind arcu morbi justo mauris tempus pharetra interdum at congue semper purus.', '<h4 class="title-2" style="box-sizing: border-box; font-family: Montserrat, sans-serif; font-weight: inherit; line-height: 1.1; color: #333333; margin: 0px 0px 16px; font-size: 18px; vertical-align: baseline; padding: 0px; border: 0px; outline: 0px; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;">What You Will Learn</h4>\r\n<p style="box-sizing: border-box; margin: 0px 0px 20px; font-family: Poppins, sans-serif; font-size: 13px; vertical-align: baseline; padding: 0px; border: 0px; outline: 0px; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; color: #666666;">Fusce eleifend donec sapien sed phase lusa pellentesque lacus.Vivamus lorem arcu semper duiac. Cras ornare arcu avamus nda leo Etiam ind arcu. Morbi justo mauris tempus pharetra interdum at congue semper purus. Lorem ipsum dolor sit</p>\r\n<p class="marginbt-12px" style="box-sizing: border-box; margin: 0px 0px 12px; font-family: Poppins, sans-serif; font-size: 13px; vertical-align: baseline; padding: 0px; border: 0px; outline: 0px; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; color: #666666;">Lorem ipsum dolor sit amet, consectetur adipisicing elit sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>\r\n<ul class="flat-list color-black" style="box-sizing: border-box; margin: 0px 0px 32px; font-family: Poppins, sans-serif; font-size: 13px; vertical-align: baseline; padding: 0px 0px 0px 22px; border: 0px; outline: 0px; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; list-style: none; overflow: hidden; color: #666666;">\r\n<li style="box-sizing: border-box; font-family: inherit; font-weight: inherit; font-style: inherit; vertical-align: baseline; margin: 0px; padding: 6px 0px 6px 24px; border: 0px; outline: 0px; background: transparent; position: relative;">2 Glossaries for difficult terms &amp; acronyms</li>\r\n<li style="box-sizing: border-box; font-family: inherit; font-weight: inherit; font-style: inherit; vertical-align: baseline; margin: 0px; padding: 6px 0px 6px 24px; border: 0px; outline: 0px; background: transparent; position: relative;">25 hours of High Quality e-Learning content</li>\r\n<li style="box-sizing: border-box; font-family: inherit; font-weight: inherit; font-style: inherit; vertical-align: baseline; margin: 0px; padding: 6px 0px 6px 24px; border: 0px; outline: 0px; background: transparent; position: relative;">72 end of chapter quizzes</li>\r\n<li style="box-sizing: border-box; font-family: inherit; font-weight: inherit; font-style: inherit; vertical-align: baseline; margin: 0px; padding: 6px 0px 6px 24px; border: 0px; outline: 0px; background: transparent; position: relative;">30 PDUs Offered</li>\r\n<li style="box-sizing: border-box; font-family: inherit; font-weight: inherit; font-style: inherit; vertical-align: baseline; margin: 0px; padding: 6px 0px 6px 24px; border: 0px; outline: 0px; background: transparent; position: relative;">Collection of 47 six sigma tools for hands-on practice</li>\r\n</ul>', 'courses\\April2019\\ATVgCfuGqF2v5P0VlJNn.jpg', '#education', 'ABC University', 23, 'Master', _binary 0x310000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000, 1, 1, 'painting-and-lorem-ipsum', '2019-06-17 14:44:02', '2019-04-18 11:20:52'),
	(4, 'Java Enterprise Edition / angular', 1205, 201, 'English', 'Fusce eleifend donec sapien sed phase lusa. Pellentesque lacus vamus lorem arcu semper duiac. Cras ornare arcu avamus nda leo. Etiam ind arcu morbi justo mauris tempus pharetra interdum at congue semper purus.', '<h4 class="title-2" style="box-sizing: border-box; font-family: Montserrat, sans-serif; font-weight: inherit; line-height: 1.1; color: #333333; margin: 0px 0px 16px; font-size: 18px; vertical-align: baseline; padding: 0px; border: 0px; outline: 0px; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;">What You Will Learn</h4>\r\n<p style="box-sizing: border-box; margin: 0px 0px 20px; font-family: Poppins, sans-serif; font-size: 13px; vertical-align: baseline; padding: 0px; border: 0px; outline: 0px; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; color: #666666;">Fusce eleifend donec sapien sed phase lusa pellentesque lacus.Vivamus lorem arcu semper duiac. Cras ornare arcu avamus nda leo Etiam ind arcu. Morbi justo mauris tempus pharetra interdum at congue semper purus. Lorem ipsum dolor sit</p>\r\n<p class="marginbt-12px" style="box-sizing: border-box; margin: 0px 0px 12px; font-family: Poppins, sans-serif; font-size: 13px; vertical-align: baseline; padding: 0px; border: 0px; outline: 0px; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; color: #666666;">Lorem ipsum dolor sit amet, consectetur adipisicing elit sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>\r\n<ul class="flat-list color-black" style="box-sizing: border-box; margin: 0px 0px 32px; font-family: Poppins, sans-serif; font-size: 13px; vertical-align: baseline; padding: 0px 0px 0px 22px; border: 0px; outline: 0px; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; list-style: none; overflow: hidden; color: #666666;">\r\n<li style="box-sizing: border-box; font-family: inherit; font-weight: inherit; font-style: inherit; vertical-align: baseline; margin: 0px; padding: 6px 0px 6px 24px; border: 0px; outline: 0px; background: transparent; position: relative;">2 Glossaries for difficult terms &amp; acronyms</li>\r\n<li style="box-sizing: border-box; font-family: inherit; font-weight: inherit; font-style: inherit; vertical-align: baseline; margin: 0px; padding: 6px 0px 6px 24px; border: 0px; outline: 0px; background: transparent; position: relative;">25 hours of High Quality e-Learning content</li>\r\n<li style="box-sizing: border-box; font-family: inherit; font-weight: inherit; font-style: inherit; vertical-align: baseline; margin: 0px; padding: 6px 0px 6px 24px; border: 0px; outline: 0px; background: transparent; position: relative;">72 end of chapter quizzes</li>\r\n<li style="box-sizing: border-box; font-family: inherit; font-weight: inherit; font-style: inherit; vertical-align: baseline; margin: 0px; padding: 6px 0px 6px 24px; border: 0px; outline: 0px; background: transparent; position: relative;">30 PDUs Offered</li>\r\n<li style="box-sizing: border-box; font-family: inherit; font-weight: inherit; font-style: inherit; vertical-align: baseline; margin: 0px; padding: 6px 0px 6px 24px; border: 0px; outline: 0px; background: transparent; position: relative;">Collection of 47 six sigma tools for hands-on practice</li>\r\n</ul>', 'courses\\April2019\\SuDfrIde81YlDg9S3T58.jpg', '#education', 'ABC University', 23, 'Master', _binary 0x310000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000, 1, 2, 'java-enterprise-edition-angular', '2019-05-18 15:46:00', '2019-04-19 08:28:55'),
	(5, 'Bulma Web Design, Graphic', 0, 12, 'English', 'Fusce eleifend donec sapien sed phase lusa. Pellentesque lacus vamus lorem arcu semper duiac. Cras ornare arcu avamus nda leo. Etiam ind arcu morbi justo mauris tempus pharetra interdum at congue semper purus.', '<h4 class="title-2" style="box-sizing: border-box; font-family: Montserrat, sans-serif; font-weight: inherit; line-height: 1.1; color: #333333; margin: 0px 0px 16px; font-size: 18px; vertical-align: baseline; padding: 0px; border: 0px; outline: 0px; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;">What You Will Learn</h4>\r\n<p style="box-sizing: border-box; margin: 0px 0px 20px; font-family: Poppins, sans-serif; font-size: 13px; vertical-align: baseline; padding: 0px; border: 0px; outline: 0px; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; color: #666666;">Fusce eleifend donec sapien sed phase lusa pellentesque lacus.Vivamus lorem arcu semper duiac. Cras ornare arcu avamus nda leo Etiam ind arcu. Morbi justo mauris tempus pharetra interdum at congue semper purus. Lorem ipsum dolor sit</p>\r\n<p class="marginbt-12px" style="box-sizing: border-box; margin: 0px 0px 12px; font-family: Poppins, sans-serif; font-size: 13px; vertical-align: baseline; padding: 0px; border: 0px; outline: 0px; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; color: #666666;">Lorem ipsum dolor sit amet, consectetur adipisicing elit sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>\r\n<ul class="flat-list color-black" style="box-sizing: border-box; margin: 0px 0px 32px; font-family: Poppins, sans-serif; font-size: 13px; vertical-align: baseline; padding: 0px 0px 0px 22px; border: 0px; outline: 0px; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; list-style: none; overflow: hidden; color: #666666;">\r\n<li style="box-sizing: border-box; font-family: inherit; font-weight: inherit; font-style: inherit; vertical-align: baseline; margin: 0px; padding: 6px 0px 6px 24px; border: 0px; outline: 0px; background: transparent; position: relative;">2 Glossaries for difficult terms &amp; acronyms</li>\r\n<li style="box-sizing: border-box; font-family: inherit; font-weight: inherit; font-style: inherit; vertical-align: baseline; margin: 0px; padding: 6px 0px 6px 24px; border: 0px; outline: 0px; background: transparent; position: relative;">25 hours of High Quality e-Learning content</li>\r\n<li style="box-sizing: border-box; font-family: inherit; font-weight: inherit; font-style: inherit; vertical-align: baseline; margin: 0px; padding: 6px 0px 6px 24px; border: 0px; outline: 0px; background: transparent; position: relative;">72 end of chapter quizzes</li>\r\n<li style="box-sizing: border-box; font-family: inherit; font-weight: inherit; font-style: inherit; vertical-align: baseline; margin: 0px; padding: 6px 0px 6px 24px; border: 0px; outline: 0px; background: transparent; position: relative;">30 PDUs Offered</li>\r\n<li style="box-sizing: border-box; font-family: inherit; font-weight: inherit; font-style: inherit; vertical-align: baseline; margin: 0px; padding: 6px 0px 6px 24px; border: 0px; outline: 0px; background: transparent; position: relative;">Collection of 47 six sigma tools for hands-on practice</li>\r\n</ul>', 'courses\\April2019\\PS6Xd7e92YI0Paqb0Ixg.jpg', '#graphic #design', 'ABC University', 23, 'Master', _binary 0x310000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000, 3, 2, 'bulma-web-design-graphic', '2019-05-24 16:34:03', '2019-04-24 15:34:03'),
	(6, 'Spring Boot / angularJS', 1205, 201, 'English', 'Fusce eleifend donec sapien sed phase lusa. Pellentesque lacus vamus lorem arcu semper duiac. Cras ornare arcu avamus nda leo. Etiam ind arcu morbi justo mauris tempus pharetra interdum at congue semper purus.', '<h4 class="title-2" style="box-sizing: border-box; font-family: Montserrat, sans-serif; font-weight: inherit; line-height: 1.1; color: #333333; margin: 0px 0px 16px; font-size: 18px; vertical-align: baseline; padding: 0px; border: 0px; outline: 0px; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;">What You Will Learn</h4>\r\n<p style="box-sizing: border-box; margin: 0px 0px 20px; font-family: Poppins, sans-serif; font-size: 13px; vertical-align: baseline; padding: 0px; border: 0px; outline: 0px; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; color: #666666;">Fusce eleifend donec sapien sed phase lusa pellentesque lacus.Vivamus lorem arcu semper duiac. Cras ornare arcu avamus nda leo Etiam ind arcu. Morbi justo mauris tempus pharetra interdum at congue semper purus. Lorem ipsum dolor sit</p>\r\n<p class="marginbt-12px" style="box-sizing: border-box; margin: 0px 0px 12px; font-family: Poppins, sans-serif; font-size: 13px; vertical-align: baseline; padding: 0px; border: 0px; outline: 0px; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; color: #666666;">Lorem ipsum dolor sit amet, consectetur adipisicing elit sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>\r\n<ul class="flat-list color-black" style="box-sizing: border-box; margin: 0px 0px 32px; font-family: Poppins, sans-serif; font-size: 13px; vertical-align: baseline; padding: 0px 0px 0px 22px; border: 0px; outline: 0px; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; list-style: none; overflow: hidden; color: #666666;">\r\n<li style="box-sizing: border-box; font-family: inherit; font-weight: inherit; font-style: inherit; vertical-align: baseline; margin: 0px; padding: 6px 0px 6px 24px; border: 0px; outline: 0px; background: transparent; position: relative;">2 Glossaries for difficult terms &amp; acronyms</li>\r\n<li style="box-sizing: border-box; font-family: inherit; font-weight: inherit; font-style: inherit; vertical-align: baseline; margin: 0px; padding: 6px 0px 6px 24px; border: 0px; outline: 0px; background: transparent; position: relative;">25 hours of High Quality e-Learning content</li>\r\n<li style="box-sizing: border-box; font-family: inherit; font-weight: inherit; font-style: inherit; vertical-align: baseline; margin: 0px; padding: 6px 0px 6px 24px; border: 0px; outline: 0px; background: transparent; position: relative;">72 end of chapter quizzes</li>\r\n<li style="box-sizing: border-box; font-family: inherit; font-weight: inherit; font-style: inherit; vertical-align: baseline; margin: 0px; padding: 6px 0px 6px 24px; border: 0px; outline: 0px; background: transparent; position: relative;">30 PDUs Offered</li>\r\n<li style="box-sizing: border-box; font-family: inherit; font-weight: inherit; font-style: inherit; vertical-align: baseline; margin: 0px; padding: 6px 0px 6px 24px; border: 0px; outline: 0px; background: transparent; position: relative;">Collection of 47 six sigma tools for hands-on practice</li>\r\n</ul>', 'courses\\April2019\\SuDfrIde81YlDg9S3T58.jpg', '#education', 'ABC University', 23, 'Master', _binary 0x310000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000, 1, 2, 'spring-boot-angularjs', '2019-05-18 15:46:00', '2019-04-19 08:28:55'),
	(7, 'Lorem Ipsum Post blog', 525, 87, 'French', 'Fusce eleifend donec sapien sed phase lusa. Pellentesque lacus vamus lorem arcu semper duiac. Cras ornare arcu avamus nda leo. Etiam ind arcu morbi justo mauris tempus pharetra interdum at congue semper purus.', '<h4 class="title-2" style="box-sizing: border-box; font-family: Montserrat, sans-serif; font-weight: inherit; line-height: 1.1; color: #333333; margin: 0px 0px 16px; font-size: 18px; vertical-align: baseline; padding: 0px; border: 0px; outline: 0px; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;">What You Will Learn</h4>', 'courses\\April2019\\gXTxJ8x1xZuxqXClEPHs.jpg', '#graphic #design', 'EST essaouira', 54, 'Master', _binary 0x310000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000, 1, 2, 'developpeur-web-', '2019-05-23 17:13:46', '2019-05-23 17:13:46'),
	(8, 'Developpeur Web Laravel', 54, 44, 'English', 'Fusce eleifend donec sapien sed phase lusa. Pellentesque lacus vamus lorem arcu semper duiac. Cras ornare arcu avamus nda leo. Etiam ind arcu morbi justo mauris tempus pharetra interdum at congue semper purus.', '<h4 class="title-2" style="box-sizing: border-box; font-family: Montserrat, sans-serif; font-weight: inherit; line-height: 1.1; color: #333333; margin: 0px 0px 16px; font-size: 18px; vertical-align: baseline; padding: 0px; border: 0px; outline: 0px; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;">What You Will Learn</h4>\r\n<p style="box-sizing: border-box; margin: 0px 0px 20px; font-family: Poppins, sans-serif; font-size: 13px; vertical-align: baseline; padding: 0px; border: 0px; outline: 0px; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; color: #666666;">Fusce eleifend donec sapien sed phase lusa pellentesque lacus.Vivamus lorem arcu semper duiac. Cras ornare arcu avamus nda leo Etiam ind arcu. Morbi justo mauris tempus pharetra interdum at congue semper purus. Lorem ipsum dolor sit</p>\r\n<p class="marginbt-12px" style="box-sizing: border-box; margin: 0px 0px 12px; font-family: Poppins, sans-serif; font-size: 13px; vertical-align: baseline; padding: 0px; border: 0px; outline: 0px; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; color: #666666;">Lorem ipsum dolor sit amet, consectetur adipisicing elit sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>\r\n<ul class="flat-list color-black" style="box-sizing: border-box; margin: 0px 0px 32px; font-family: Poppins, sans-serif; font-size: 13px; vertical-align: baseline; padding: 0px 0px 0px 22px; border: 0px; outline: 0px; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; list-style: none; overflow: hidden; color: #666666;">\r\n<li style="box-sizing: border-box; font-family: inherit; font-weight: inherit; font-style: inherit; vertical-align: baseline; margin: 0px; padding: 6px 0px 6px 24px; border: 0px; outline: 0px; background: transparent; position: relative;">2 Glossaries for difficult terms &amp; acronyms</li>\r\n<li style="box-sizing: border-box; font-family: inherit; font-weight: inherit; font-style: inherit; vertical-align: baseline; margin: 0px; padding: 6px 0px 6px 24px; border: 0px; outline: 0px; background: transparent; position: relative;">25 hours of High Quality e-Learning content</li>\r\n<li style="box-sizing: border-box; font-family: inherit; font-weight: inherit; font-style: inherit; vertical-align: baseline; margin: 0px; padding: 6px 0px 6px 24px; border: 0px; outline: 0px; background: transparent; position: relative;">72 end of chapter quizzes</li>\r\n<li style="box-sizing: border-box; font-family: inherit; font-weight: inherit; font-style: inherit; vertical-align: baseline; margin: 0px; padding: 6px 0px 6px 24px; border: 0px; outline: 0px; background: transparent; position: relative;">30 PDUs Offered</li>\r\n<li style="box-sizing: border-box; font-family: inherit; font-weight: inherit; font-style: inherit; vertical-align: baseline; margin: 0px; padding: 6px 0px 6px 24px; border: 0px; outline: 0px; background: transparent; position: relative;">Collection of 47 six sigma tools for hands-on practice</li>\r\n</ul>', 'courses\\April2019\\SuDfrIde81YlDg9S3T58.jpg', '#graphic #design', 'EST essaouira', 47, 'Master', _binary 0x310000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000, 1, 2, 'developpeur-web-laravel', '2019-05-23 17:22:15', '2019-05-23 17:22:15');
/*!40000 ALTER TABLE `courses` ENABLE KEYS */;

-- Dumping structure for table e-learningv.course_faqs
CREATE TABLE IF NOT EXISTS `course_faqs` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `course_id` int(11) DEFAULT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table e-learningv.course_faqs: ~28 rows (approximately)
/*!40000 ALTER TABLE `course_faqs` DISABLE KEYS */;
INSERT INTO `course_faqs` (`id`, `course_id`, `title`, `content`, `created_at`, `updated_at`) VALUES
	(1, 4, 'Celebrate success right, the only way, apple nim ad minim veniam quis ', 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Fugiat tempore enim quas eligendi, dolorem doloremque ad ea quam autem vitae ex quia odio distinctio dolore! Voluptate assumenda quidem possimus in tempora nobis deleniti velit molestias iusto, neque cum iste repellendus pariatur ducimus nostrum, ex dolorem officia! Cum velit corporis similique.', '2019-04-18 15:41:16', '2019-04-18 15:41:16'),
	(2, 4, 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Fugiat tempore enim quas eligendi ', 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Fugiat tempore enim quas eligendi, dolorem doloremque ad ea quam autem vitae ex quia odio distinctio dolore! Voluptate assumenda quidem possimus in tempora nobis deleniti velit molestias iusto, neque cum iste repellendus pariatur ducimus nostrum, ex dolorem officia! Cum velit corporis similique.', '2019-04-19 08:24:18', '2019-04-19 08:24:18'),
	(3, 4, 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Fugiat tempore enim.', 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Fugiat tempore enim quas eligendi, dolorem doloremque ad ea quam autem vitae ex quia odio distinctio dolore! Voluptate assumenda quidem possimus in tempora nobis deleniti velit molestias iusto, neque cum iste repellendus pariatur ducimus nostrum, ex dolorem officia! Cum velit corporis similique.', '2019-04-18 15:41:16', '2019-04-18 15:41:16'),
	(4, 4, 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Fugiat tempore.', 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Fugiat tempore enim quas eligendi, dolorem doloremque ad ea quam autem vitae ex quia odio distinctio dolore! Voluptate assumenda quidem possimus in tempora nobis deleniti velit molestias iusto, neque cum iste repellendus pariatur ducimus nostrum, ex dolorem officia! Cum velit corporis similique.', '2019-04-18 15:41:16', '2019-04-18 15:41:16'),
	(5, 1, 'Celebrate success right, the only way, apple nim ad minim veniam quis ', 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Fugiat tempore enim quas eligendi, dolorem doloremque ad ea quam autem vitae ex quia odio distinctio dolore! Voluptate assumenda quidem possimus in tempora nobis deleniti velit molestias iusto, neque cum iste repellendus pariatur ducimus nostrum, ex dolorem officia! Cum velit corporis similique.', '2019-04-18 15:41:16', '2019-04-18 15:41:16'),
	(6, 1, 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Fugiat tempore enim quas eligendi ', 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Fugiat tempore enim quas eligendi, dolorem doloremque ad ea quam autem vitae ex quia odio distinctio dolore! Voluptate assumenda quidem possimus in tempora nobis deleniti velit molestias iusto, neque cum iste repellendus pariatur ducimus nostrum, ex dolorem officia! Cum velit corporis similique.', '2019-04-19 08:24:18', '2019-04-19 08:24:18'),
	(7, 1, 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Fugiat tempore enim.', 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Fugiat tempore enim quas eligendi, dolorem doloremque ad ea quam autem vitae ex quia odio distinctio dolore! Voluptate assumenda quidem possimus in tempora nobis deleniti velit molestias iusto, neque cum iste repellendus pariatur ducimus nostrum, ex dolorem officia! Cum velit corporis similique.', '2019-04-18 15:41:16', '2019-04-18 15:41:16'),
	(8, 1, 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Fugiat tempore.', 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Fugiat tempore enim quas eligendi, dolorem doloremque ad ea quam autem vitae ex quia odio distinctio dolore! Voluptate assumenda quidem possimus in tempora nobis deleniti velit molestias iusto, neque cum iste repellendus pariatur ducimus nostrum, ex dolorem officia! Cum velit corporis similique.', '2019-04-18 15:41:16', '2019-04-18 15:41:16'),
	(9, 2, 'Celebrate success right, the only way, apple nim ad minim veniam quis ', 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Fugiat tempore enim quas eligendi, dolorem doloremque ad ea quam autem vitae ex quia odio distinctio dolore! Voluptate assumenda quidem possimus in tempora nobis deleniti velit molestias iusto, neque cum iste repellendus pariatur ducimus nostrum, ex dolorem officia! Cum velit corporis similique.', '2019-04-18 15:41:16', '2019-04-18 15:41:16'),
	(10, 2, 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Fugiat tempore enim quas eligendi ', 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Fugiat tempore enim quas eligendi, dolorem doloremque ad ea quam autem vitae ex quia odio distinctio dolore! Voluptate assumenda quidem possimus in tempora nobis deleniti velit molestias iusto, neque cum iste repellendus pariatur ducimus nostrum, ex dolorem officia! Cum velit corporis similique.', '2019-04-19 08:24:18', '2019-04-19 08:24:18'),
	(11, 2, 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Fugiat tempore enim.', 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Fugiat tempore enim quas eligendi, dolorem doloremque ad ea quam autem vitae ex quia odio distinctio dolore! Voluptate assumenda quidem possimus in tempora nobis deleniti velit molestias iusto, neque cum iste repellendus pariatur ducimus nostrum, ex dolorem officia! Cum velit corporis similique.', '2019-04-18 15:41:16', '2019-04-18 15:41:16'),
	(12, 2, 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Fugiat tempore.', 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Fugiat tempore enim quas eligendi, dolorem doloremque ad ea quam autem vitae ex quia odio distinctio dolore! Voluptate assumenda quidem possimus in tempora nobis deleniti velit molestias iusto, neque cum iste repellendus pariatur ducimus nostrum, ex dolorem officia! Cum velit corporis similique.', '2019-04-18 15:41:16', '2019-04-18 15:41:16'),
	(13, 3, 'Celebrate success right, the only way, apple nim ad minim veniam quis ', 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Fugiat tempore enim quas eligendi, dolorem doloremque ad ea quam autem vitae ex quia odio distinctio dolore! Voluptate assumenda quidem possimus in tempora nobis deleniti velit molestias iusto, neque cum iste repellendus pariatur ducimus nostrum, ex dolorem officia! Cum velit corporis similique.', '2019-04-18 15:41:16', '2019-04-18 15:41:16'),
	(14, 3, 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Fugiat tempore enim quas eligendi ', 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Fugiat tempore enim quas eligendi, dolorem doloremque ad ea quam autem vitae ex quia odio distinctio dolore! Voluptate assumenda quidem possimus in tempora nobis deleniti velit molestias iusto, neque cum iste repellendus pariatur ducimus nostrum, ex dolorem officia! Cum velit corporis similique.', '2019-04-19 08:24:18', '2019-04-19 08:24:18'),
	(15, 3, 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Fugiat tempore enim.', 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Fugiat tempore enim quas eligendi, dolorem doloremque ad ea quam autem vitae ex quia odio distinctio dolore! Voluptate assumenda quidem possimus in tempora nobis deleniti velit molestias iusto, neque cum iste repellendus pariatur ducimus nostrum, ex dolorem officia! Cum velit corporis similique.', '2019-04-18 15:41:16', '2019-04-18 15:41:16'),
	(16, 3, 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Fugiat tempore.', 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Fugiat tempore enim quas eligendi, dolorem doloremque ad ea quam autem vitae ex quia odio distinctio dolore! Voluptate assumenda quidem possimus in tempora nobis deleniti velit molestias iusto, neque cum iste repellendus pariatur ducimus nostrum, ex dolorem officia! Cum velit corporis similique.', '2019-04-18 15:41:16', '2019-04-18 15:41:16'),
	(17, 5, 'Celebrate success right, the only way, apple nim ad minim veniam quis ', 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Fugiat tempore enim quas eligendi, dolorem doloremque ad ea quam autem vitae ex quia odio distinctio dolore! Voluptate assumenda quidem possimus in tempora nobis deleniti velit molestias iusto, neque cum iste repellendus pariatur ducimus nostrum, ex dolorem officia! Cum velit corporis similique.', '2019-04-18 15:41:16', '2019-04-18 15:41:16'),
	(18, 5, 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Fugiat tempore enim quas eligendi ', 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Fugiat tempore enim quas eligendi, dolorem doloremque ad ea quam autem vitae ex quia odio distinctio dolore! Voluptate assumenda quidem possimus in tempora nobis deleniti velit molestias iusto, neque cum iste repellendus pariatur ducimus nostrum, ex dolorem officia! Cum velit corporis similique.', '2019-04-19 08:24:18', '2019-04-19 08:24:18'),
	(19, 5, 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Fugiat tempore enim.', 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Fugiat tempore enim quas eligendi, dolorem doloremque ad ea quam autem vitae ex quia odio distinctio dolore! Voluptate assumenda quidem possimus in tempora nobis deleniti velit molestias iusto, neque cum iste repellendus pariatur ducimus nostrum, ex dolorem officia! Cum velit corporis similique.', '2019-04-18 15:41:16', '2019-04-18 15:41:16'),
	(20, 5, 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Fugiat tempore.', 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Fugiat tempore enim quas eligendi, dolorem doloremque ad ea quam autem vitae ex quia odio distinctio dolore! Voluptate assumenda quidem possimus in tempora nobis deleniti velit molestias iusto, neque cum iste repellendus pariatur ducimus nostrum, ex dolorem officia! Cum velit corporis similique.', '2019-04-18 15:41:16', '2019-04-18 15:41:16'),
	(21, 6, 'Celebrate success right, the only way, apple nim ad minim veniam quis ', 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Fugiat tempore enim quas eligendi, dolorem doloremque ad ea quam autem vitae ex quia odio distinctio dolore! Voluptate assumenda quidem possimus in tempora nobis deleniti velit molestias iusto, neque cum iste repellendus pariatur ducimus nostrum, ex dolorem officia! Cum velit corporis similique.', '2019-04-18 15:41:16', '2019-04-18 15:41:16'),
	(22, 6, 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Fugiat tempore enim quas eligendi ', 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Fugiat tempore enim quas eligendi, dolorem doloremque ad ea quam autem vitae ex quia odio distinctio dolore! Voluptate assumenda quidem possimus in tempora nobis deleniti velit molestias iusto, neque cum iste repellendus pariatur ducimus nostrum, ex dolorem officia! Cum velit corporis similique.', '2019-04-19 08:24:18', '2019-04-19 08:24:18'),
	(23, 6, 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Fugiat tempore enim.', 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Fugiat tempore enim quas eligendi, dolorem doloremque ad ea quam autem vitae ex quia odio distinctio dolore! Voluptate assumenda quidem possimus in tempora nobis deleniti velit molestias iusto, neque cum iste repellendus pariatur ducimus nostrum, ex dolorem officia! Cum velit corporis similique.', '2019-04-18 15:41:16', '2019-04-18 15:41:16'),
	(24, 6, 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Fugiat tempore.', 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Fugiat tempore enim quas eligendi, dolorem doloremque ad ea quam autem vitae ex quia odio distinctio dolore! Voluptate assumenda quidem possimus in tempora nobis deleniti velit molestias iusto, neque cum iste repellendus pariatur ducimus nostrum, ex dolorem officia! Cum velit corporis similique.', '2019-04-18 15:41:16', '2019-04-18 15:41:16'),
	(25, 7, 'Celebrate success right, the only way, apple nim ad minim veniam quis ', 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Fugiat tempore enim quas eligendi, dolorem doloremque ad ea quam autem vitae ex quia odio distinctio dolore! Voluptate assumenda quidem possimus in tempora nobis deleniti velit molestias iusto, neque cum iste repellendus pariatur ducimus nostrum, ex dolorem officia! Cum velit corporis similique.', '2019-04-18 15:41:16', '2019-04-18 15:41:16'),
	(26, 7, 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Fugiat tempore enim quas eligendi ', 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Fugiat tempore enim quas eligendi, dolorem doloremque ad ea quam autem vitae ex quia odio distinctio dolore! Voluptate assumenda quidem possimus in tempora nobis deleniti velit molestias iusto, neque cum iste repellendus pariatur ducimus nostrum, ex dolorem officia! Cum velit corporis similique.', '2019-04-19 08:24:18', '2019-04-19 08:24:18'),
	(27, 7, 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Fugiat tempore enim.', 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Fugiat tempore enim quas eligendi, dolorem doloremque ad ea quam autem vitae ex quia odio distinctio dolore! Voluptate assumenda quidem possimus in tempora nobis deleniti velit molestias iusto, neque cum iste repellendus pariatur ducimus nostrum, ex dolorem officia! Cum velit corporis similique.', '2019-04-18 15:41:16', '2019-04-18 15:41:16'),
	(28, 7, 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Fugiat tempore.', 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Fugiat tempore enim quas eligendi, dolorem doloremque ad ea quam autem vitae ex quia odio distinctio dolore! Voluptate assumenda quidem possimus in tempora nobis deleniti velit molestias iusto, neque cum iste repellendus pariatur ducimus nostrum, ex dolorem officia! Cum velit corporis similique.', '2019-04-18 15:41:16', '2019-04-18 15:41:16');
/*!40000 ALTER TABLE `course_faqs` ENABLE KEYS */;

-- Dumping structure for table e-learningv.course_items
CREATE TABLE IF NOT EXISTS `course_items` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `course_session_id` int(11) DEFAULT NULL,
  `step` int(11) DEFAULT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table e-learningv.course_items: ~56 rows (approximately)
/*!40000 ALTER TABLE `course_items` DISABLE KEYS */;
INSERT INTO `course_items` (`id`, `course_session_id`, `step`, `title`, `created_at`, `updated_at`) VALUES
	(3, 1, 1, 'Welcome to the Course!', '2019-04-19 09:36:06', '2019-04-19 09:36:06'),
	(4, 1, 2, 'What Is SEO / Search Engine Optimization?', '2019-04-19 09:36:06', '2019-04-19 09:36:06'),
	(5, 1, 3, 'Scope Chains & Closures', '2019-04-19 09:36:06', '2019-04-19 09:36:06'),
	(6, 2, 1, 'Javascripting &HTML/CSS', '2019-04-19 09:36:06', '2019-04-19 09:36:06'),
	(7, 2, 2, 'Scope Chains & Closures Developer', '2019-04-19 09:36:06', '2019-04-19 09:36:06'),
	(10, 2, 5, 'Preferences in food and clothes', '2019-04-19 09:36:06', '2019-04-19 09:36:06'),
	(11, 3, 1, 'Core stream-adventure', '2019-04-19 09:36:06', '2019-04-19 09:36:06'),
	(12, 3, 2, 'Scope Chains & Closures Developer', '2019-04-19 09:36:06', '2019-04-19 09:36:06'),
	(13, 4, 1, 'Welcome to the Course!', '2019-04-19 09:36:06', '2019-04-19 09:36:06'),
	(14, 4, 2, 'What Is SEO / Search Engine Optimization?', '2019-04-19 09:36:06', '2019-04-19 09:36:06'),
	(15, 4, 3, 'Scope Chains & Closures', '2019-04-19 09:36:06', '2019-04-19 09:36:06'),
	(16, 5, 1, 'Javascripting &HTML/CSS', '2019-04-19 09:36:06', '2019-04-19 09:36:06'),
	(17, 5, 2, 'Scope Chains & Closures Developer', '2019-04-19 09:36:06', '2019-04-19 09:36:06'),
	(18, 5, 5, 'Preferences in food and clothes', '2019-04-19 09:36:06', '2019-04-19 09:36:06'),
	(19, 6, 1, 'Core stream-adventure', '2019-04-19 09:36:06', '2019-04-19 09:36:06'),
	(20, 6, 2, 'Scope Chains & Closures Developer', '2019-04-19 09:36:06', '2019-04-19 09:36:06'),
	(21, 34, 1, 'Welcome to the Course!', '2019-04-19 09:36:06', '2019-04-19 09:36:06'),
	(22, 34, 2, 'What Is SEO / Search Engine Optimization?', '2019-04-19 09:36:06', '2019-04-19 09:36:06'),
	(23, 34, 3, 'Scope Chains & Closures', '2019-04-19 09:36:06', '2019-04-19 09:36:06'),
	(24, 35, 1, 'Javascripting &HTML/CSS', '2019-04-19 09:36:06', '2019-04-19 09:36:06'),
	(25, 35, 2, 'Scope Chains & Closures Developer', '2019-04-19 09:36:06', '2019-04-19 09:36:06'),
	(26, 35, 5, 'Preferences in food and clothes', '2019-04-19 09:36:06', '2019-04-19 09:36:06'),
	(27, 36, 1, 'Core stream-adventure', '2019-04-19 09:36:06', '2019-04-19 09:36:06'),
	(28, 36, 2, 'Scope Chains & Closures Developer', '2019-04-19 09:36:06', '2019-04-19 09:36:06'),
	(29, 31, 1, 'Welcome to the Course!', '2019-04-19 09:36:06', '2019-04-19 09:36:06'),
	(30, 31, 2, 'What Is SEO / Search Engine Optimization?', '2019-04-19 09:36:06', '2019-04-19 09:36:06'),
	(31, 31, 3, 'Scope Chains & Closures', '2019-04-19 09:36:06', '2019-04-19 09:36:06'),
	(32, 32, 1, 'Javascripting &HTML/CSS', '2019-04-19 09:36:06', '2019-04-19 09:36:06'),
	(33, 32, 2, 'Scope Chains & Closures Developer', '2019-04-19 09:36:06', '2019-04-19 09:36:06'),
	(34, 32, 5, 'Preferences in food and clothes', '2019-04-19 09:36:06', '2019-04-19 09:36:06'),
	(35, 33, 1, 'Core stream-adventure', '2019-04-19 09:36:06', '2019-04-19 09:36:06'),
	(36, 33, 2, 'Scope Chains & Closures Developer', '2019-04-19 09:36:06', '2019-04-19 09:36:06'),
	(37, 28, 1, 'Welcome to the Course!', '2019-04-19 09:36:06', '2019-04-19 09:36:06'),
	(38, 28, 2, 'What Is SEO / Search Engine Optimization?', '2019-04-19 09:36:06', '2019-04-19 09:36:06'),
	(39, 28, 3, 'Scope Chains & Closures', '2019-04-19 09:36:06', '2019-04-19 09:36:06'),
	(40, 29, 1, 'Javascripting &HTML/CSS', '2019-04-19 09:36:06', '2019-04-19 09:36:06'),
	(41, 29, 2, 'Scope Chains & Closures Developer', '2019-04-19 09:36:06', '2019-04-19 09:36:06'),
	(42, 29, 5, 'Preferences in food and clothes', '2019-04-19 09:36:06', '2019-04-19 09:36:06'),
	(43, 30, 1, 'Core stream-adventure', '2019-04-19 09:36:06', '2019-04-19 09:36:06'),
	(44, 30, 2, 'Scope Chains & Closures Developer', '2019-04-19 09:36:06', '2019-04-19 09:36:06'),
	(45, 25, 1, 'Welcome to the Course!', '2019-04-19 09:36:06', '2019-04-19 09:36:06'),
	(46, 25, 2, 'What Is SEO / Search Engine Optimization?', '2019-04-19 09:36:06', '2019-04-19 09:36:06'),
	(47, 25, 3, 'Scope Chains & Closures', '2019-04-19 09:36:06', '2019-04-19 09:36:06'),
	(48, 26, 1, 'Javascripting &HTML/CSS', '2019-04-19 09:36:06', '2019-04-19 09:36:06'),
	(49, 26, 2, 'Scope Chains & Closures Developer', '2019-04-19 09:36:06', '2019-04-19 09:36:06'),
	(50, 26, 5, 'Preferences in food and clothes', '2019-04-19 09:36:06', '2019-04-19 09:36:06'),
	(51, 27, 1, 'Core stream-adventure', '2019-04-19 09:36:06', '2019-04-19 09:36:06'),
	(52, 27, 2, 'Scope Chains & Closures Developer', '2019-04-19 09:36:06', '2019-04-19 09:36:06'),
	(53, 22, 1, 'Welcome to the Course!', '2019-04-19 09:36:06', '2019-04-19 09:36:06'),
	(54, 22, 2, 'What Is SEO / Search Engine Optimization?', '2019-04-19 09:36:06', '2019-04-19 09:36:06'),
	(55, 22, 3, 'Scope Chains & Closures', '2019-04-19 09:36:06', '2019-04-19 09:36:06'),
	(56, 23, 1, 'Javascripting &HTML/CSS', '2019-04-19 09:36:06', '2019-04-19 09:36:06'),
	(57, 23, 2, 'Scope Chains & Closures Developer', '2019-04-19 09:36:06', '2019-04-19 09:36:06'),
	(58, 23, 5, 'Preferences in food and clothes', '2019-04-19 09:36:06', '2019-04-19 09:36:06'),
	(59, 24, 1, 'Core stream-adventure', '2019-04-19 09:36:06', '2019-04-19 09:36:06'),
	(60, 24, 2, 'Scope Chains & Closures Developer', '2019-04-19 09:36:06', '2019-04-19 09:36:06');
/*!40000 ALTER TABLE `course_items` ENABLE KEYS */;

-- Dumping structure for table e-learningv.course_rates
CREATE TABLE IF NOT EXISTS `course_rates` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `value` int(11) DEFAULT '3',
  `course_id` int(11) DEFAULT NULL,
  `student_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table e-learningv.course_rates: ~0 rows (approximately)
/*!40000 ALTER TABLE `course_rates` DISABLE KEYS */;
/*!40000 ALTER TABLE `course_rates` ENABLE KEYS */;

-- Dumping structure for table e-learningv.course_sessions
CREATE TABLE IF NOT EXISTS `course_sessions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `step` int(11) DEFAULT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date` date DEFAULT NULL,
  `course_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table e-learningv.course_sessions: ~21 rows (approximately)
/*!40000 ALTER TABLE `course_sessions` DISABLE KEYS */;
INSERT INTO `course_sessions` (`id`, `step`, `title`, `date`, `course_id`, `created_at`, `updated_at`) VALUES
	(1, 1, 'AngularJS -How to make your browsers Smarter', '2019-04-25', 4, '2019-04-19 09:36:06', '2019-04-19 09:36:06'),
	(2, 2, 'Understanding AngularJS', '2019-04-25', 4, '2019-04-19 09:36:06', '2019-04-19 09:36:06'),
	(3, 3, 'AngularJS Model and Controller', '2019-04-25', 4, '2019-04-19 09:36:06', '2019-04-19 09:36:06'),
	(4, 1, 'AngularJS -How to make your browsers Smarter', '2019-04-25', 1, '2019-04-19 09:36:06', '2019-04-19 09:36:06'),
	(5, 2, 'Understanding AngularJS', '2019-04-25', 1, '2019-04-19 09:36:06', '2019-04-19 09:36:06'),
	(6, 3, 'AngularJS Model and Controller', '2019-04-25', 1, '2019-04-19 09:36:06', '2019-04-19 09:36:06'),
	(22, 1, 'AngularJS -How to make your browsers Smarter', '2019-04-25', 7, '2019-04-19 09:36:06', '2019-04-19 09:36:06'),
	(23, 2, 'Understanding AngularJS', '2019-04-25', 7, '2019-04-19 09:36:06', '2019-04-19 09:36:06'),
	(24, 3, 'AngularJS Model and Controller', '2019-04-25', 7, '2019-04-19 09:36:06', '2019-04-19 09:36:06'),
	(25, 1, 'AngularJS -How to make your browsers Smarter', '2019-04-25', 6, '2019-04-19 09:36:06', '2019-04-19 09:36:06'),
	(26, 2, 'Understanding AngularJS', '2019-04-25', 6, '2019-04-19 09:36:06', '2019-04-19 09:36:06'),
	(27, 3, 'AngularJS Model and Controller', '2019-04-25', 6, '2019-04-19 09:36:06', '2019-04-19 09:36:06'),
	(28, 1, 'AngularJS -How to make your browsers Smarter', '2019-04-25', 5, '2019-04-19 09:36:06', '2019-04-19 09:36:06'),
	(29, 2, 'Understanding AngularJS', '2019-04-25', 5, '2019-04-19 09:36:06', '2019-04-19 09:36:06'),
	(30, 3, 'AngularJS Model and Controller', '2019-04-25', 5, '2019-04-19 09:36:06', '2019-04-19 09:36:06'),
	(31, 1, 'AngularJS -How to make your browsers Smarter', '2019-04-25', 3, '2019-04-19 09:36:06', '2019-04-19 09:36:06'),
	(32, 2, 'Understanding AngularJS', '2019-04-25', 3, '2019-04-19 09:36:06', '2019-04-19 09:36:06'),
	(33, 3, 'AngularJS Model and Controller', '2019-04-25', 3, '2019-04-19 09:36:06', '2019-04-19 09:36:06'),
	(34, 1, 'AngularJS -How to make your browsers Smarter', '2019-04-25', 2, '2019-04-19 09:36:06', '2019-04-19 09:36:06'),
	(35, 2, 'Understanding AngularJS', '2019-04-25', 2, '2019-04-19 09:36:06', '2019-04-19 09:36:06'),
	(36, 3, 'AngularJS Model and Controller', '2019-04-25', 2, '2019-04-19 09:36:06', '2019-04-19 09:36:06');
/*!40000 ALTER TABLE `course_sessions` ENABLE KEYS */;

-- Dumping structure for table e-learningv.data_rows
CREATE TABLE IF NOT EXISTS `data_rows` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `data_type_id` int(10) unsigned NOT NULL,
  `field` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `required` tinyint(1) NOT NULL DEFAULT '0',
  `browse` tinyint(1) NOT NULL DEFAULT '1',
  `read` tinyint(1) NOT NULL DEFAULT '1',
  `edit` tinyint(1) NOT NULL DEFAULT '1',
  `add` tinyint(1) NOT NULL DEFAULT '1',
  `delete` tinyint(1) NOT NULL DEFAULT '1',
  `details` text COLLATE utf8mb4_unicode_ci,
  `order` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `data_rows_data_type_id_foreign` (`data_type_id`),
  CONSTRAINT `data_rows_data_type_id_foreign` FOREIGN KEY (`data_type_id`) REFERENCES `data_types` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=198 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table e-learningv.data_rows: ~158 rows (approximately)
/*!40000 ALTER TABLE `data_rows` DISABLE KEYS */;
INSERT INTO `data_rows` (`id`, `data_type_id`, `field`, `type`, `display_name`, `required`, `browse`, `read`, `edit`, `add`, `delete`, `details`, `order`) VALUES
	(1, 1, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1),
	(2, 1, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, NULL, 2),
	(3, 1, 'email', 'text', 'Email', 1, 1, 1, 1, 1, 1, NULL, 3),
	(4, 1, 'password', 'password', 'Password', 1, 0, 0, 1, 1, 0, NULL, 4),
	(5, 1, 'remember_token', 'text', 'Remember Token', 0, 0, 0, 0, 0, 0, NULL, 5),
	(6, 1, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 0, 0, 0, NULL, 6),
	(7, 1, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 7),
	(8, 1, 'avatar', 'image', 'Avatar', 0, 1, 1, 1, 1, 1, NULL, 8),
	(9, 1, 'user_belongsto_role_relationship', 'relationship', 'Role', 0, 1, 1, 1, 1, 0, '{"model":"TCG\\\\Voyager\\\\Models\\\\Role","table":"roles","type":"belongsTo","column":"role_id","key":"id","label":"display_name","pivot_table":"roles","pivot":0}', 10),
	(10, 1, 'user_belongstomany_role_relationship', 'relationship', 'Roles', 0, 1, 1, 1, 1, 0, '{"model":"TCG\\\\Voyager\\\\Models\\\\Role","table":"roles","type":"belongsToMany","column":"id","key":"id","label":"display_name","pivot_table":"user_roles","pivot":"1","taggable":"0"}', 11),
	(11, 1, 'settings', 'hidden', 'Settings', 0, 0, 0, 0, 0, 0, NULL, 12),
	(12, 2, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1),
	(13, 2, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, NULL, 2),
	(14, 2, 'created_at', 'timestamp', 'Created At', 0, 0, 0, 0, 0, 0, NULL, 3),
	(15, 2, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 4),
	(16, 3, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1),
	(17, 3, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, NULL, 2),
	(18, 3, 'created_at', 'timestamp', 'Created At', 0, 0, 0, 0, 0, 0, NULL, 3),
	(19, 3, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 4),
	(20, 3, 'display_name', 'text', 'Display Name', 1, 1, 1, 1, 1, 1, NULL, 5),
	(21, 1, 'role_id', 'text', 'Role', 1, 1, 1, 1, 1, 1, NULL, 9),
	(29, 5, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1),
	(30, 5, 'author_id', 'text', 'Author', 1, 0, 1, 1, 0, 1, NULL, 2),
	(31, 5, 'category_id', 'text', 'Category', 1, 0, 1, 1, 1, 0, NULL, 3),
	(32, 5, 'title', 'text', 'Title', 1, 1, 1, 1, 1, 1, NULL, 4),
	(33, 5, 'excerpt', 'text_area', 'Excerpt', 1, 0, 1, 1, 1, 1, NULL, 5),
	(34, 5, 'body', 'rich_text_box', 'Body', 1, 0, 1, 1, 1, 1, NULL, 6),
	(35, 5, 'image', 'image', 'Post Image', 0, 1, 1, 1, 1, 1, '{"resize":{"width":"1000","height":"null"},"quality":"70%","upsize":true,"thumbnails":[{"name":"medium","scale":"50%"},{"name":"small","scale":"25%"},{"name":"cropped","crop":{"width":"300","height":"250"}}]}', 7),
	(36, 5, 'slug', 'text', 'Slug', 1, 0, 1, 1, 1, 1, '{"slugify":{"origin":"title","forceUpdate":true},"validation":{"rule":"unique:posts,slug"}}', 8),
	(37, 5, 'meta_description', 'text_area', 'Meta Description', 1, 0, 1, 1, 1, 1, NULL, 9),
	(38, 5, 'meta_keywords', 'text_area', 'Meta Keywords', 1, 0, 1, 1, 1, 1, NULL, 10),
	(39, 5, 'status', 'select_dropdown', 'Status', 1, 1, 1, 1, 1, 1, '{"default":"DRAFT","options":{"PUBLISHED":"published","DRAFT":"draft","PENDING":"pending"}}', 11),
	(40, 5, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 0, 0, 0, NULL, 12),
	(41, 5, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 13),
	(42, 5, 'seo_title', 'text', 'SEO Title', 0, 1, 1, 1, 1, 1, NULL, 14),
	(43, 5, 'featured', 'checkbox', 'Featured', 1, 1, 1, 1, 1, 1, NULL, 15),
	(71, 9, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
	(72, 9, 'title', 'text', 'Title', 0, 1, 1, 1, 1, 1, '{}', 2),
	(73, 9, 'price', 'number', 'Price', 0, 1, 1, 1, 1, 1, '{}', 3),
	(74, 9, 'duration', 'text', 'Duration(H)', 0, 1, 1, 1, 1, 1, '{}', 4),
	(75, 9, 'language', 'text', 'Language', 0, 1, 1, 1, 1, 1, '{}', 5),
	(76, 9, 'small_description', 'text_area', 'Small Description', 0, 0, 1, 1, 1, 1, '{}', 6),
	(77, 9, 'description', 'rich_text_box', 'Description', 0, 0, 1, 1, 1, 1, '{}', 7),
	(78, 9, 'image', 'image', 'Image', 0, 1, 1, 1, 1, 1, '{}', 8),
	(79, 9, 'tag', 'text', 'Tag', 0, 1, 1, 1, 1, 1, '{}', 9),
	(80, 9, 'location', 'text', 'Location', 0, 1, 1, 1, 1, 1, '{}', 10),
	(81, 9, 'nbr_student', 'number', 'Nbr Student', 0, 1, 1, 1, 1, 1, '{}', 11),
	(82, 9, 'level', 'text', 'Level', 0, 1, 1, 1, 1, 1, '{}', 12),
	(83, 9, 'active', 'select_dropdown', 'Active', 0, 0, 1, 1, 1, 1, '{"default":"0","options":{"0":"Disable","1":"Enable"}}', 13),
	(84, 9, 'category_id', 'text', 'Category Id', 0, 0, 0, 0, 0, 0, '{}', 14),
	(85, 9, 'teacher_id', 'text', 'Teacher Id', 0, 0, 0, 0, 0, 0, '{}', 15),
	(86, 9, 'slug', 'text', 'Slug', 0, 0, 1, 1, 1, 1, '{"slugify":{"origin":"title","forceUpdate":true},"validation":{"rule":"unique:courses,slug"}}', 16),
	(87, 9, 'created_at', 'timestamp', 'Created At', 0, 0, 1, 0, 0, 0, '{}', 17),
	(88, 9, 'updated_at', 'timestamp', 'Updated At', 0, 0, 1, 0, 0, 0, '{}', 18),
	(89, 9, 'course_belongsto_category_relationship', 'relationship', 'category', 0, 1, 1, 1, 1, 1, '{"model":"App\\\\Category","table":"categories","type":"belongsTo","column":"category_id","key":"id","label":"name","pivot_table":"answers","pivot":"0","taggable":"0"}', 19),
	(90, 9, 'course_belongsto_teacher_profile_relationship', 'relationship', 'Teacher', 0, 0, 0, 0, 0, 0, '{"model":"App\\\\TeacherProfile","table":"teacher_profiles","type":"belongsTo","column":"teacher_id","key":"id","label":"user_id","pivot_table":"answers","pivot":"0","taggable":"0"}', 20),
	(91, 10, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
	(92, 10, 'email', 'text', 'Email', 0, 1, 1, 1, 1, 1, '{}', 2),
	(93, 10, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 0, 0, 0, '{}', 3),
	(94, 10, 'updated_at', 'timestamp', 'Updated At', 0, 0, 1, 0, 0, 0, '{}', 4),
	(95, 11, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
	(96, 11, 'question_id', 'text', 'Question Id', 0, 0, 0, 0, 0, 0, '{}', 2),
	(97, 11, 'reponse', 'text_area', 'Reponse', 0, 1, 1, 1, 1, 1, '{}', 3),
	(98, 11, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 0, 0, 0, '{}', 5),
	(99, 11, 'updated_at', 'timestamp', 'Updated At', 0, 0, 1, 0, 0, 0, '{}', 6),
	(100, 11, 'answer_belongsto_question_relationship', 'relationship', 'Question', 0, 1, 1, 1, 1, 1, '{"model":"App\\\\Question","table":"questions","type":"belongsTo","column":"question_id","key":"id","label":"question","pivot_table":"answers","pivot":"0","taggable":"0"}', 4),
	(101, 12, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
	(102, 12, 'course_id', 'text', 'Course Id', 0, 0, 0, 0, 0, 0, '{}', 2),
	(103, 12, 'email', 'text', 'Email', 0, 1, 1, 1, 1, 1, '{}', 3),
	(104, 12, 'full_name', 'text', 'Full Name', 0, 1, 1, 1, 1, 1, '{}', 4),
	(105, 12, 'question', 'text_area', 'Question', 0, 1, 1, 1, 1, 1, '{}', 5),
	(106, 12, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 0, 0, 0, '{}', 7),
	(107, 12, 'updated_at', 'timestamp', 'Updated At', 0, 0, 1, 0, 0, 0, '{}', 8),
	(108, 12, 'question_hasone_answer_relationship', 'relationship', 'Answers', 0, 1, 1, 1, 1, 1, '{"model":"App\\\\Answer","table":"answers","type":"hasOne","column":"question_id","key":"id","label":"reponse","pivot_table":"answers","pivot":"0","taggable":"0"}', 6),
	(109, 13, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
	(110, 13, 'parent_id', 'text', 'Parent Id', 0, 0, 0, 0, 0, 0, '{}', 2),
	(111, 13, 'order', 'text', 'Order', 1, 0, 0, 0, 0, 0, '{}', 3),
	(112, 13, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, '{}', 4),
	(113, 13, 'slug', 'text', 'Slug', 1, 1, 1, 1, 1, 1, '{"slugify":{"origin":"name","forceUpdate":true},"validation":{"rule":"unique:categories,slug"}}', 5),
	(114, 13, 'created_at', 'timestamp', 'Created At', 0, 0, 1, 0, 0, 0, '{}', 6),
	(115, 13, 'updated_at', 'timestamp', 'Updated At', 0, 0, 1, 0, 0, 0, '{}', 7),
	(116, 13, 'tag', 'text', 'Tag', 0, 1, 1, 1, 1, 1, '{}', 8),
	(117, 13, 'description', 'text_area', 'Description', 0, 0, 1, 1, 1, 1, '{}', 9),
	(118, 14, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
	(119, 14, 'comment', 'text_area', 'Comment', 0, 1, 1, 1, 1, 1, '{}', 2),
	(120, 14, 'student_id', 'text', 'Student Id', 0, 0, 0, 0, 0, 0, '{}', 3),
	(121, 14, 'course_id', 'text', 'Course Id', 0, 0, 0, 0, 0, 0, '{}', 4),
	(122, 14, 'teacher_id', 'text', 'Teacher Id', 0, 0, 0, 0, 0, 0, '{}', 7),
	(123, 14, 'type', 'text', 'Type', 0, 0, 1, 1, 1, 1, '{}', 8),
	(124, 14, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 0, 0, 0, '{}', 9),
	(125, 14, 'updated_at', 'timestamp', 'Updated At', 0, 0, 1, 0, 0, 0, '{}', 10),
	(126, 14, 'post_id', 'text', 'Post Id', 0, 0, 0, 0, 0, 0, '{}', 11),
	(127, 14, 'user_id', 'text', 'User Id', 0, 0, 0, 0, 0, 0, '{}', 12),
	(128, 14, 'comment_belongsto_user_relationship', 'relationship', 'User', 0, 1, 1, 1, 1, 1, '{"model":"App\\\\User","table":"users","type":"belongsTo","column":"user_id","key":"id","label":"name","pivot_table":"answers","pivot":"0","taggable":"0"}', 5),
	(129, 15, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
	(130, 15, 'comment', 'text_area', 'Comment Reply', 0, 1, 1, 1, 1, 1, '{}', 2),
	(131, 15, 'comment_id', 'text', 'Comment Id', 0, 0, 0, 0, 0, 0, '{}', 3),
	(132, 15, 'student_id', 'text', 'Student Id', 0, 0, 0, 0, 0, 0, '{}', 6),
	(133, 15, 'teacher_id', 'text', 'Teacher Id', 0, 0, 0, 0, 0, 0, '{}', 7),
	(134, 15, 'type', 'text', 'Type', 0, 0, 1, 1, 1, 1, '{}', 8),
	(135, 15, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 0, 0, 0, '{}', 9),
	(136, 15, 'updated_at', 'timestamp', 'Updated At', 0, 0, 1, 0, 0, 0, '{}', 10),
	(137, 15, 'user_id', 'text', 'User Id', 0, 0, 0, 0, 0, 0, '{}', 11),
	(138, 14, 'comment_belongsto_user_relationship_1', 'relationship', 'Comment Replies', 0, 1, 1, 1, 1, 1, '{"model":"App\\\\CommentReply","table":"comment_replies","type":"hasMany","column":"comment_id","key":"id","label":"comment","pivot_table":"answers","pivot":"0","taggable":"0"}', 6),
	(139, 15, 'comment_reply_belongsto_comment_relationship', 'relationship', 'Comment', 0, 1, 1, 1, 1, 1, '{"model":"App\\\\Comment","table":"comments","type":"belongsTo","column":"comment_id","key":"id","label":"comment","pivot_table":"answers","pivot":"0","taggable":"0"}', 5),
	(140, 15, 'comment_reply_belongsto_user_relationship', 'relationship', 'User', 0, 1, 1, 1, 1, 1, '{"model":"App\\\\User","table":"users","type":"belongsTo","column":"user_id","key":"id","label":"name","pivot_table":"answers","pivot":"0","taggable":"0"}', 4),
	(141, 16, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
	(142, 16, 'full_name', 'text', 'Full Name', 0, 1, 1, 1, 1, 1, '{}', 2),
	(143, 16, 'object', 'text', 'Subject', 0, 1, 1, 1, 1, 1, '{}', 3),
	(144, 16, 'email', 'text', 'Email', 0, 1, 1, 1, 1, 1, '{}', 4),
	(145, 16, 'content', 'text_area', 'Content', 0, 1, 1, 1, 1, 1, '{}', 5),
	(146, 16, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 0, 0, 0, '{}', 6),
	(147, 16, 'updated_at', 'timestamp', 'Updated At', 0, 0, 1, 0, 0, 0, '{}', 7),
	(148, 17, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
	(149, 17, 'course_id', 'text', 'Course Id', 0, 0, 0, 0, 0, 0, '{}', 2),
	(150, 17, 'title', 'text', 'Title', 0, 1, 1, 1, 1, 1, '{}', 3),
	(151, 17, 'content', 'text_area', 'Content', 0, 1, 1, 1, 1, 1, '{}', 4),
	(152, 17, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 0, 0, 0, '{}', 6),
	(153, 17, 'updated_at', 'timestamp', 'Updated At', 0, 0, 1, 0, 0, 0, '{}', 7),
	(154, 17, 'course_faq_belongsto_course_relationship', 'relationship', 'Course', 0, 1, 1, 1, 1, 1, '{"model":"App\\\\Course","table":"courses","type":"belongsTo","column":"course_id","key":"id","label":"title","pivot_table":"answers","pivot":"0","taggable":"0"}', 5),
	(160, 19, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
	(161, 19, 'title', 'text', 'Title', 0, 1, 1, 1, 1, 1, '{}', 2),
	(162, 19, 'content', 'text_area', 'Content', 0, 1, 1, 1, 1, 1, '{}', 3),
	(163, 19, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 0, 0, 0, '{}', 4),
	(164, 19, 'updated_at', 'timestamp', 'Updated At', 0, 0, 1, 0, 0, 0, '{}', 5),
	(165, 20, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
	(166, 20, 'student_id', 'text', 'Student Id', 0, 1, 1, 1, 1, 1, '{}', 2),
	(167, 20, 'content', 'text_area', 'Content', 0, 1, 1, 1, 1, 1, '{}', 3),
	(168, 20, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 0, 0, 0, '{}', 4),
	(169, 20, 'updated_at', 'timestamp', 'Updated At', 0, 0, 1, 0, 0, 0, '{}', 5),
	(170, 21, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
	(171, 21, 'link', 'text', 'Website', 0, 1, 1, 1, 1, 1, '{}', 2),
	(172, 21, 'logo', 'image', 'Logo', 0, 1, 1, 1, 1, 1, '{}', 3),
	(173, 21, 'name', 'text', 'Name', 0, 1, 1, 1, 1, 1, '{}', 4),
	(174, 21, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 0, 0, 0, '{}', 5),
	(175, 21, 'updated_at', 'timestamp', 'Updated At', 0, 0, 1, 0, 0, 0, '{}', 6),
	(176, 22, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
	(177, 22, 'user_id', 'text', 'User Id', 0, 0, 0, 0, 0, 0, '{}', 3),
	(178, 22, 'category_id', 'text', 'Category Id', 0, 0, 0, 0, 0, 0, '{}', 4),
	(179, 22, 'description', 'text_area', 'Description', 0, 0, 1, 1, 1, 1, '{}', 5),
	(180, 22, 'slug', 'text', 'Slug', 0, 0, 1, 1, 1, 1, '{}', 6),
	(181, 22, 'phone', 'text', 'Phone', 0, 1, 1, 1, 1, 1, '{}', 7),
	(182, 22, 'skype', 'text', 'Skype', 0, 1, 1, 1, 1, 1, '{}', 8),
	(183, 22, 'linkedin', 'text', 'Linkedin', 0, 0, 1, 1, 1, 1, '{}', 9),
	(184, 22, 'facebook', 'text', 'Facebook', 0, 0, 1, 1, 1, 1, '{}', 10),
	(185, 22, 'twitter', 'text', 'Twitter', 0, 0, 1, 1, 1, 1, '{}', 11),
	(186, 22, 'youtube', 'text', 'Youtube', 0, 0, 1, 1, 1, 1, '{}', 12),
	(187, 22, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 0, 0, 0, '{}', 13),
	(188, 22, 'updated_at', 'timestamp', 'Updated At', 0, 0, 1, 0, 0, 0, '{}', 14),
	(189, 22, 'teacher_profile_belongsto_user_relationship', 'relationship', 'Full Name', 0, 1, 1, 1, 1, 1, '{"model":"App\\\\User","table":"users","type":"belongsTo","column":"user_id","key":"id","label":"name","pivot_table":"answers","pivot":"0","taggable":"0"}', 2),
	(190, 23, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
	(191, 23, 'step', 'number', 'Step', 0, 1, 1, 1, 1, 1, '{}', 2),
	(192, 23, 'title', 'text', 'Title', 0, 1, 1, 1, 1, 1, '{}', 3),
	(193, 23, 'date', 'date', 'Date', 0, 1, 1, 1, 1, 1, '{}', 5),
	(194, 23, 'course_id', 'text', 'Course Id', 0, 0, 0, 0, 0, 0, '{}', 6),
	(195, 23, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 0, 0, 0, '{}', 7),
	(196, 23, 'updated_at', 'timestamp', 'Updated At', 0, 0, 1, 0, 0, 0, '{}', 8),
	(197, 23, 'course_session_belongsto_course_relationship', 'relationship', 'Course Title', 0, 1, 1, 1, 1, 1, '{"model":"App\\\\Course","table":"courses","type":"belongsTo","column":"course_id","key":"id","label":"title","pivot_table":"answers","pivot":"0","taggable":"0"}', 4);
/*!40000 ALTER TABLE `data_rows` ENABLE KEYS */;

-- Dumping structure for table e-learningv.data_types
CREATE TABLE IF NOT EXISTS `data_types` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name_singular` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name_plural` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `model_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `policy_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `controller` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `generate_permissions` tinyint(1) NOT NULL DEFAULT '0',
  `server_side` tinyint(4) NOT NULL DEFAULT '0',
  `details` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `data_types_name_unique` (`name`),
  UNIQUE KEY `data_types_slug_unique` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table e-learningv.data_types: ~18 rows (approximately)
/*!40000 ALTER TABLE `data_types` DISABLE KEYS */;
INSERT INTO `data_types` (`id`, `name`, `slug`, `display_name_singular`, `display_name_plural`, `icon`, `model_name`, `policy_name`, `controller`, `description`, `generate_permissions`, `server_side`, `details`, `created_at`, `updated_at`) VALUES
	(1, 'users', 'users', 'User', 'Users', 'voyager-person', 'TCG\\Voyager\\Models\\User', 'TCG\\Voyager\\Policies\\UserPolicy', 'TCG\\Voyager\\Http\\Controllers\\VoyagerUserController', '', 1, 0, NULL, '2019-04-29 13:47:38', '2019-04-29 13:47:38'),
	(2, 'menus', 'menus', 'Menu', 'Menus', 'voyager-list', 'TCG\\Voyager\\Models\\Menu', NULL, '', '', 1, 0, NULL, '2019-04-29 13:47:38', '2019-04-29 13:47:38'),
	(3, 'roles', 'roles', 'Role', 'Roles', 'voyager-lock', 'TCG\\Voyager\\Models\\Role', NULL, '', '', 1, 0, NULL, '2019-04-29 13:47:38', '2019-04-29 13:47:38'),
	(5, 'posts', 'posts', 'Post', 'Posts', 'voyager-news', 'TCG\\Voyager\\Models\\Post', 'TCG\\Voyager\\Policies\\PostPolicy', '', '', 1, 0, NULL, '2019-04-29 13:47:39', '2019-04-29 13:47:39'),
	(9, 'courses', 'courses', 'Course', 'Courses', 'voyager-book', 'App\\Course', NULL, NULL, NULL, 1, 0, '{"order_column":null,"order_display_column":null,"order_direction":"asc","default_search_key":null,"scope":null}', '2019-05-27 12:33:57', '2019-05-27 13:03:03'),
	(10, 'subscribes', 'subscribes', 'Subscribe', 'Subscribes', 'voyager-bell', 'App\\Subscribe', NULL, NULL, NULL, 1, 0, '{"order_column":null,"order_display_column":null,"order_direction":"asc","default_search_key":null}', '2019-05-27 13:11:49', '2019-05-27 13:11:49'),
	(11, 'answers', 'answers', 'Answer', 'Answers', 'voyager-lightbulb', 'App\\Answer', NULL, NULL, NULL, 1, 0, '{"order_column":null,"order_display_column":null,"order_direction":"asc","default_search_key":null,"scope":null}', '2019-05-27 13:15:23', '2019-05-27 13:21:07'),
	(12, 'questions', 'questions', 'Question', 'Questions', 'voyager-question', 'App\\Question', NULL, NULL, NULL, 1, 0, '{"order_column":null,"order_display_column":null,"order_direction":"asc","default_search_key":null,"scope":null}', '2019-05-27 13:24:42', '2019-05-27 13:30:09'),
	(13, 'categories', 'categories', 'Category', 'Categories', 'voyager-ticket', 'App\\Category', NULL, NULL, NULL, 1, 0, '{"order_column":null,"order_display_column":null,"order_direction":"asc","default_search_key":null,"scope":null}', '2019-05-27 13:40:10', '2019-05-27 13:42:04'),
	(14, 'comments', 'comments', 'Comment', 'Comments', 'voyager-chat', 'App\\Comment', NULL, NULL, NULL, 1, 0, '{"order_column":null,"order_display_column":null,"order_direction":"asc","default_search_key":null,"scope":null}', '2019-05-27 13:50:58', '2019-05-27 14:38:27'),
	(15, 'comment_replies', 'comment-replies', 'Comment Reply', 'Comment Replies', 'voyager-bubble', 'App\\CommentReply', NULL, NULL, NULL, 1, 0, '{"order_column":null,"order_display_column":null,"order_direction":"asc","default_search_key":null,"scope":null}', '2019-05-27 14:00:17', '2019-05-27 14:37:49'),
	(16, 'contacts', 'contacts', 'Contact', 'Contacts', 'voyager-mail', 'App\\Contact', NULL, NULL, NULL, 1, 0, '{"order_column":null,"order_display_column":null,"order_direction":"asc","default_search_key":null}', '2019-05-27 14:41:26', '2019-05-27 14:41:26'),
	(17, 'course_faqs', 'course-faqs', 'Course Faq', 'Course Faqs', 'voyager-info-circled', 'App\\CourseFaq', NULL, NULL, NULL, 1, 0, '{"order_column":null,"order_display_column":null,"order_direction":"asc","default_search_key":null,"scope":null}', '2019-05-27 14:45:56', '2019-05-27 14:47:53'),
	(19, 'faqs', 'faqs', 'Faq', 'Faqs', 'voyager-milestone', 'App\\Faq', NULL, NULL, NULL, 1, 0, '{"order_column":null,"order_display_column":null,"order_direction":"asc","default_search_key":null}', '2019-05-27 15:20:56', '2019-05-27 15:20:56'),
	(20, 'student_says', 'student-says', 'Student Say', 'Student Says', 'voyager-sound', 'App\\StudentSay', NULL, NULL, NULL, 1, 0, '{"order_column":null,"order_display_column":null,"order_direction":"asc","default_search_key":null}', '2019-05-27 15:22:36', '2019-05-27 15:22:36'),
	(21, 'sponsors', 'sponsors', 'Sponsor', 'Sponsors', 'voyager-paw', 'App\\Sponsor', NULL, NULL, NULL, 1, 0, '{"order_column":null,"order_display_column":null,"order_direction":"asc","default_search_key":null}', '2019-05-27 15:25:00', '2019-05-27 15:25:00'),
	(22, 'teacher_profiles', 'teacher-profiles', 'Teacher Profile', 'Teacher Profiles', 'voyager-study', 'App\\TeacherProfile', NULL, NULL, NULL, 1, 0, '{"order_column":null,"order_display_column":null,"order_direction":"asc","default_search_key":null,"scope":null}', '2019-05-27 15:28:36', '2019-05-27 15:31:48'),
	(23, 'course_sessions', 'course-sessions', 'Course Session', 'Course Sessions', 'voyager-documentation', 'App\\CourseSession', NULL, NULL, NULL, 1, 0, '{"order_column":null,"order_display_column":null,"order_direction":"asc","default_search_key":null,"scope":null}', '2019-05-27 16:06:31', '2019-05-27 16:07:36');
/*!40000 ALTER TABLE `data_types` ENABLE KEYS */;

-- Dumping structure for table e-learningv.faqs
CREATE TABLE IF NOT EXISTS `faqs` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table e-learningv.faqs: ~4 rows (approximately)
/*!40000 ALTER TABLE `faqs` DISABLE KEYS */;
INSERT INTO `faqs` (`id`, `title`, `content`, `created_at`, `updated_at`) VALUES
	(1, 'Why Our School?', 'Exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Lorem ipsum dolor sit amet, consectetur adipi scing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam quis nostrud.', '2019-05-21 13:47:17', '2019-05-21 13:47:17'),
	(2, 'Qualified Experts', 'Exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.\r\nLorem ipsum dolor sit amet, consectetur adipi scing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam quis nostrud.', '2019-05-21 13:47:51', '2019-05-21 13:47:51'),
	(3, 'Quick Access to The Patient', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut elit tellus, luctus nec ullamcorper mattis, pulvinar dapibus leo.', '2019-05-21 13:48:24', '2019-05-21 13:48:24'),
	(4, 'How can an architect save you money on your home design?', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut elit tellus, luctus nec ullamcorper mattis, pulvinar dapibus leo.', '2019-05-21 13:48:44', '2019-05-21 13:48:44');
/*!40000 ALTER TABLE `faqs` ENABLE KEYS */;

-- Dumping structure for table e-learningv.menus
CREATE TABLE IF NOT EXISTS `menus` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `menus_name_unique` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table e-learningv.menus: ~1 rows (approximately)
/*!40000 ALTER TABLE `menus` DISABLE KEYS */;
INSERT INTO `menus` (`id`, `name`, `created_at`, `updated_at`) VALUES
	(1, 'admin', '2019-04-29 13:47:38', '2019-04-29 13:47:38');
/*!40000 ALTER TABLE `menus` ENABLE KEYS */;

-- Dumping structure for table e-learningv.menu_items
CREATE TABLE IF NOT EXISTS `menu_items` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `menu_id` int(10) unsigned DEFAULT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `url` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `target` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '_self',
  `icon_class` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `color` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `order` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `route` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parameters` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `menu_items_menu_id_foreign` (`menu_id`),
  CONSTRAINT `menu_items_menu_id_foreign` FOREIGN KEY (`menu_id`) REFERENCES `menus` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table e-learningv.menu_items: ~26 rows (approximately)
/*!40000 ALTER TABLE `menu_items` DISABLE KEYS */;
INSERT INTO `menu_items` (`id`, `menu_id`, `title`, `url`, `target`, `icon_class`, `color`, `parent_id`, `order`, `created_at`, `updated_at`, `route`, `parameters`) VALUES
	(1, 1, 'Dashboard', '', '_self', 'voyager-boat', NULL, NULL, 1, '2019-04-29 13:47:38', '2019-04-29 13:47:38', 'voyager.dashboard', NULL),
	(2, 1, 'Media', '', '_self', 'voyager-images', NULL, NULL, 20, '2019-04-29 13:47:38', '2019-05-27 16:14:32', 'voyager.media.index', NULL),
	(3, 1, 'Users', '', '_self', 'voyager-person', NULL, NULL, 2, '2019-04-29 13:47:38', '2019-05-27 16:14:18', 'voyager.users.index', NULL),
	(4, 1, 'Roles', '', '_self', 'voyager-lock', NULL, NULL, 19, '2019-04-29 13:47:38', '2019-05-27 16:14:32', 'voyager.roles.index', NULL),
	(5, 1, 'Tools', '', '_self', 'voyager-tools', NULL, NULL, 21, '2019-04-29 13:47:38', '2019-05-27 16:14:32', NULL, NULL),
	(6, 1, 'Menu Builder', '', '_self', 'voyager-list', NULL, 5, 1, '2019-04-29 13:47:38', '2019-05-27 16:13:21', 'voyager.menus.index', NULL),
	(7, 1, 'Database', '', '_self', 'voyager-data', NULL, 5, 2, '2019-04-29 13:47:38', '2019-05-27 16:13:21', 'voyager.database.index', NULL),
	(8, 1, 'Compass', '', '_self', 'voyager-compass', NULL, 5, 3, '2019-04-29 13:47:38', '2019-05-27 16:13:21', 'voyager.compass.index', NULL),
	(9, 1, 'BREAD', '', '_self', 'voyager-bread', NULL, 5, 4, '2019-04-29 13:47:38', '2019-05-27 16:13:21', 'voyager.bread.index', NULL),
	(10, 1, 'Settings', '', '_self', 'voyager-settings', NULL, NULL, 18, '2019-04-29 13:47:38', '2019-05-27 16:14:30', 'voyager.settings.index', NULL),
	(12, 1, 'Posts', '', '_self', 'voyager-news', NULL, NULL, 3, '2019-04-29 13:47:39', '2019-05-27 16:14:18', 'voyager.posts.index', NULL),
	(14, 1, 'Hooks', '', '_self', 'voyager-hook', NULL, 5, 5, '2019-04-29 13:47:40', '2019-05-27 16:13:21', 'voyager.hooks', NULL),
	(18, 1, 'Courses', '', '_self', 'voyager-book', NULL, NULL, 4, '2019-05-27 12:33:57', '2019-05-27 16:14:20', 'voyager.courses.index', NULL),
	(19, 1, 'Subscribes', '', '_self', 'voyager-bell', NULL, NULL, 5, '2019-05-27 13:11:49', '2019-05-27 16:14:20', 'voyager.subscribes.index', NULL),
	(20, 1, 'Answers', '', '_self', 'voyager-lightbulb', NULL, NULL, 6, '2019-05-27 13:15:23', '2019-05-27 16:14:20', 'voyager.answers.index', NULL),
	(21, 1, 'Questions', '', '_self', 'voyager-question', NULL, NULL, 7, '2019-05-27 13:24:42', '2019-05-27 16:14:24', 'voyager.questions.index', NULL),
	(22, 1, 'Categories', '', '_self', 'voyager-ticket', NULL, NULL, 8, '2019-05-27 13:40:10', '2019-05-27 16:14:24', 'voyager.categories.index', NULL),
	(23, 1, 'Comments', '', '_self', 'voyager-chat', NULL, NULL, 9, '2019-05-27 13:50:58', '2019-05-27 16:14:24', 'voyager.comments.index', NULL),
	(24, 1, 'Comment Replies', '', '_self', 'voyager-bubble', NULL, NULL, 10, '2019-05-27 14:00:17', '2019-05-27 16:14:24', 'voyager.comment-replies.index', NULL),
	(25, 1, 'Contacts', '', '_self', 'voyager-mail', NULL, NULL, 11, '2019-05-27 14:41:26', '2019-05-27 16:14:24', 'voyager.contacts.index', NULL),
	(26, 1, 'Course Faqs', '', '_self', 'voyager-info-circled', NULL, NULL, 12, '2019-05-27 14:45:56', '2019-05-27 16:14:24', 'voyager.course-faqs.index', NULL),
	(28, 1, 'Faqs', '', '_self', 'voyager-milestone', NULL, NULL, 13, '2019-05-27 15:20:56', '2019-05-27 16:14:27', 'voyager.faqs.index', NULL),
	(29, 1, 'Student Says', '', '_self', 'voyager-sound', NULL, NULL, 14, '2019-05-27 15:22:36', '2019-05-27 16:14:27', 'voyager.student-says.index', NULL),
	(30, 1, 'Sponsors', '', '_self', 'voyager-paw', NULL, NULL, 15, '2019-05-27 15:25:00', '2019-05-27 16:14:27', 'voyager.sponsors.index', NULL),
	(31, 1, 'Teacher Profiles', '', '_self', 'voyager-study', NULL, NULL, 16, '2019-05-27 15:28:36', '2019-05-27 16:14:27', 'voyager.teacher-profiles.index', NULL),
	(32, 1, 'Course Sessions', '', '_self', 'voyager-documentation', NULL, NULL, 17, '2019-05-27 16:06:31', '2019-05-27 16:14:30', 'voyager.course-sessions.index', NULL);
/*!40000 ALTER TABLE `menu_items` ENABLE KEYS */;

-- Dumping structure for table e-learningv.migrations
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table e-learningv.migrations: ~26 rows (approximately)
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
	(1, '2014_10_12_000000_create_users_table', 1),
	(2, '2014_10_12_100000_create_password_resets_table', 1),
	(3, '2016_01_01_000000_add_voyager_user_fields', 1),
	(4, '2016_01_01_000000_create_data_types_table', 1),
	(5, '2016_05_19_173453_create_menu_table', 1),
	(6, '2016_10_21_190000_create_roles_table', 1),
	(7, '2016_10_21_190000_create_settings_table', 1),
	(8, '2016_11_30_135954_create_permission_table', 1),
	(9, '2016_11_30_141208_create_permission_role_table', 1),
	(10, '2016_12_26_201236_data_types__add__server_side', 1),
	(11, '2017_01_13_000000_add_route_to_menu_items_table', 1),
	(12, '2017_01_14_005015_create_translations_table', 1),
	(13, '2017_01_15_000000_make_table_name_nullable_in_permissions_table', 1),
	(14, '2017_03_06_000000_add_controller_to_data_types_table', 1),
	(15, '2017_04_21_000000_add_order_to_data_rows_table', 1),
	(16, '2017_07_05_210000_add_policyname_to_data_types_table', 1),
	(17, '2017_08_05_000000_add_group_to_settings_table', 1),
	(18, '2017_11_26_013050_add_user_role_relationship', 1),
	(19, '2017_11_26_015000_create_user_roles_table', 1),
	(20, '2018_03_11_000000_add_user_settings', 1),
	(21, '2018_03_14_000000_add_details_to_data_types_table', 1),
	(22, '2018_03_16_000000_make_settings_value_nullable', 1),
	(23, '2016_01_01_000000_create_pages_table', 2),
	(24, '2016_01_01_000000_create_posts_table', 2),
	(25, '2016_02_15_204651_create_categories_table', 2),
	(26, '2017_04_11_000000_alter_post_nullable_fields_table', 2);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;

-- Dumping structure for table e-learningv.pages
CREATE TABLE IF NOT EXISTS `pages` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `author_id` int(11) NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `excerpt` text COLLATE utf8mb4_unicode_ci,
  `body` text COLLATE utf8mb4_unicode_ci,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta_description` text COLLATE utf8mb4_unicode_ci,
  `meta_keywords` text COLLATE utf8mb4_unicode_ci,
  `status` enum('ACTIVE','INACTIVE') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'INACTIVE',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `pages_slug_unique` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table e-learningv.pages: ~1 rows (approximately)
/*!40000 ALTER TABLE `pages` DISABLE KEYS */;
INSERT INTO `pages` (`id`, `author_id`, `title`, `excerpt`, `body`, `image`, `slug`, `meta_description`, `meta_keywords`, `status`, `created_at`, `updated_at`) VALUES
	(1, 0, 'Hello World', 'Hang the jib grog grog blossom grapple dance the hempen jig gangway pressgang bilge rat to go on account lugger. Nelsons folly gabion line draught scallywag fire ship gaff fluke fathom case shot. Sea Legs bilge rat sloop matey gabion long clothes run a shot across the bow Gold Road cog league.', '<p>Hello World. Scallywag grog swab Cat o\'nine tails scuttle rigging hardtack cable nipper Yellow Jack. Handsomely spirits knave lad killick landlubber or just lubber deadlights chantey pinnace crack Jennys tea cup. Provost long clothes black spot Yellow Jack bilged on her anchor league lateen sail case shot lee tackle.</p>\n<p>Ballast spirits fluke topmast me quarterdeck schooner landlubber or just lubber gabion belaying pin. Pinnace stern galleon starboard warp carouser to go on account dance the hempen jig jolly boat measured fer yer chains. Man-of-war fire in the hole nipperkin handsomely doubloon barkadeer Brethren of the Coast gibbet driver squiffy.</p>', 'pages/page1.jpg', 'hello-world', 'Yar Meta Description', 'Keyword1, Keyword2', 'ACTIVE', '2019-04-29 13:47:39', '2019-04-29 13:47:39');
/*!40000 ALTER TABLE `pages` ENABLE KEYS */;

-- Dumping structure for table e-learningv.password_resets
CREATE TABLE IF NOT EXISTS `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table e-learningv.password_resets: ~0 rows (approximately)
/*!40000 ALTER TABLE `password_resets` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_resets` ENABLE KEYS */;

-- Dumping structure for table e-learningv.permissions
CREATE TABLE IF NOT EXISTS `permissions` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `key` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `table_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `permissions_key_index` (`key`)
) ENGINE=InnoDB AUTO_INCREMENT=132 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table e-learningv.permissions: ~101 rows (approximately)
/*!40000 ALTER TABLE `permissions` DISABLE KEYS */;
INSERT INTO `permissions` (`id`, `key`, `table_name`, `created_at`, `updated_at`) VALUES
	(1, 'browse_admin', NULL, '2019-04-29 13:47:38', '2019-04-29 13:47:38'),
	(2, 'browse_bread', NULL, '2019-04-29 13:47:38', '2019-04-29 13:47:38'),
	(3, 'browse_database', NULL, '2019-04-29 13:47:38', '2019-04-29 13:47:38'),
	(4, 'browse_media', NULL, '2019-04-29 13:47:38', '2019-04-29 13:47:38'),
	(5, 'browse_compass', NULL, '2019-04-29 13:47:38', '2019-04-29 13:47:38'),
	(6, 'browse_menus', 'menus', '2019-04-29 13:47:38', '2019-04-29 13:47:38'),
	(7, 'read_menus', 'menus', '2019-04-29 13:47:38', '2019-04-29 13:47:38'),
	(8, 'edit_menus', 'menus', '2019-04-29 13:47:38', '2019-04-29 13:47:38'),
	(9, 'add_menus', 'menus', '2019-04-29 13:47:38', '2019-04-29 13:47:38'),
	(10, 'delete_menus', 'menus', '2019-04-29 13:47:38', '2019-04-29 13:47:38'),
	(11, 'browse_roles', 'roles', '2019-04-29 13:47:38', '2019-04-29 13:47:38'),
	(12, 'read_roles', 'roles', '2019-04-29 13:47:38', '2019-04-29 13:47:38'),
	(13, 'edit_roles', 'roles', '2019-04-29 13:47:38', '2019-04-29 13:47:38'),
	(14, 'add_roles', 'roles', '2019-04-29 13:47:38', '2019-04-29 13:47:38'),
	(15, 'delete_roles', 'roles', '2019-04-29 13:47:38', '2019-04-29 13:47:38'),
	(16, 'browse_users', 'users', '2019-04-29 13:47:38', '2019-04-29 13:47:38'),
	(17, 'read_users', 'users', '2019-04-29 13:47:38', '2019-04-29 13:47:38'),
	(18, 'edit_users', 'users', '2019-04-29 13:47:38', '2019-04-29 13:47:38'),
	(19, 'add_users', 'users', '2019-04-29 13:47:38', '2019-04-29 13:47:38'),
	(20, 'delete_users', 'users', '2019-04-29 13:47:38', '2019-04-29 13:47:38'),
	(21, 'browse_settings', 'settings', '2019-04-29 13:47:38', '2019-04-29 13:47:38'),
	(22, 'read_settings', 'settings', '2019-04-29 13:47:38', '2019-04-29 13:47:38'),
	(23, 'edit_settings', 'settings', '2019-04-29 13:47:38', '2019-04-29 13:47:38'),
	(24, 'add_settings', 'settings', '2019-04-29 13:47:38', '2019-04-29 13:47:38'),
	(25, 'delete_settings', 'settings', '2019-04-29 13:47:38', '2019-04-29 13:47:38'),
	(31, 'browse_posts', 'posts', '2019-04-29 13:47:39', '2019-04-29 13:47:39'),
	(32, 'read_posts', 'posts', '2019-04-29 13:47:39', '2019-04-29 13:47:39'),
	(33, 'edit_posts', 'posts', '2019-04-29 13:47:39', '2019-04-29 13:47:39'),
	(34, 'add_posts', 'posts', '2019-04-29 13:47:39', '2019-04-29 13:47:39'),
	(35, 'delete_posts', 'posts', '2019-04-29 13:47:39', '2019-04-29 13:47:39'),
	(41, 'browse_hooks', NULL, '2019-04-29 13:47:40', '2019-04-29 13:47:40'),
	(57, 'browse_courses', 'courses', '2019-05-27 12:33:57', '2019-05-27 12:33:57'),
	(58, 'read_courses', 'courses', '2019-05-27 12:33:57', '2019-05-27 12:33:57'),
	(59, 'edit_courses', 'courses', '2019-05-27 12:33:57', '2019-05-27 12:33:57'),
	(60, 'add_courses', 'courses', '2019-05-27 12:33:57', '2019-05-27 12:33:57'),
	(61, 'delete_courses', 'courses', '2019-05-27 12:33:57', '2019-05-27 12:33:57'),
	(62, 'browse_subscribes', 'subscribes', '2019-05-27 13:11:49', '2019-05-27 13:11:49'),
	(63, 'read_subscribes', 'subscribes', '2019-05-27 13:11:49', '2019-05-27 13:11:49'),
	(64, 'edit_subscribes', 'subscribes', '2019-05-27 13:11:49', '2019-05-27 13:11:49'),
	(65, 'add_subscribes', 'subscribes', '2019-05-27 13:11:49', '2019-05-27 13:11:49'),
	(66, 'delete_subscribes', 'subscribes', '2019-05-27 13:11:49', '2019-05-27 13:11:49'),
	(67, 'browse_answers', 'answers', '2019-05-27 13:15:23', '2019-05-27 13:15:23'),
	(68, 'read_answers', 'answers', '2019-05-27 13:15:23', '2019-05-27 13:15:23'),
	(69, 'edit_answers', 'answers', '2019-05-27 13:15:23', '2019-05-27 13:15:23'),
	(70, 'add_answers', 'answers', '2019-05-27 13:15:23', '2019-05-27 13:15:23'),
	(71, 'delete_answers', 'answers', '2019-05-27 13:15:23', '2019-05-27 13:15:23'),
	(72, 'browse_questions', 'questions', '2019-05-27 13:24:42', '2019-05-27 13:24:42'),
	(73, 'read_questions', 'questions', '2019-05-27 13:24:42', '2019-05-27 13:24:42'),
	(74, 'edit_questions', 'questions', '2019-05-27 13:24:42', '2019-05-27 13:24:42'),
	(75, 'add_questions', 'questions', '2019-05-27 13:24:42', '2019-05-27 13:24:42'),
	(76, 'delete_questions', 'questions', '2019-05-27 13:24:42', '2019-05-27 13:24:42'),
	(77, 'browse_categories', 'categories', '2019-05-27 13:40:10', '2019-05-27 13:40:10'),
	(78, 'read_categories', 'categories', '2019-05-27 13:40:10', '2019-05-27 13:40:10'),
	(79, 'edit_categories', 'categories', '2019-05-27 13:40:10', '2019-05-27 13:40:10'),
	(80, 'add_categories', 'categories', '2019-05-27 13:40:10', '2019-05-27 13:40:10'),
	(81, 'delete_categories', 'categories', '2019-05-27 13:40:10', '2019-05-27 13:40:10'),
	(82, 'browse_comments', 'comments', '2019-05-27 13:50:58', '2019-05-27 13:50:58'),
	(83, 'read_comments', 'comments', '2019-05-27 13:50:58', '2019-05-27 13:50:58'),
	(84, 'edit_comments', 'comments', '2019-05-27 13:50:58', '2019-05-27 13:50:58'),
	(85, 'add_comments', 'comments', '2019-05-27 13:50:58', '2019-05-27 13:50:58'),
	(86, 'delete_comments', 'comments', '2019-05-27 13:50:58', '2019-05-27 13:50:58'),
	(87, 'browse_comment_replies', 'comment_replies', '2019-05-27 14:00:17', '2019-05-27 14:00:17'),
	(88, 'read_comment_replies', 'comment_replies', '2019-05-27 14:00:17', '2019-05-27 14:00:17'),
	(89, 'edit_comment_replies', 'comment_replies', '2019-05-27 14:00:17', '2019-05-27 14:00:17'),
	(90, 'add_comment_replies', 'comment_replies', '2019-05-27 14:00:17', '2019-05-27 14:00:17'),
	(91, 'delete_comment_replies', 'comment_replies', '2019-05-27 14:00:17', '2019-05-27 14:00:17'),
	(92, 'browse_contacts', 'contacts', '2019-05-27 14:41:26', '2019-05-27 14:41:26'),
	(93, 'read_contacts', 'contacts', '2019-05-27 14:41:26', '2019-05-27 14:41:26'),
	(94, 'edit_contacts', 'contacts', '2019-05-27 14:41:26', '2019-05-27 14:41:26'),
	(95, 'add_contacts', 'contacts', '2019-05-27 14:41:26', '2019-05-27 14:41:26'),
	(96, 'delete_contacts', 'contacts', '2019-05-27 14:41:26', '2019-05-27 14:41:26'),
	(97, 'browse_course_faqs', 'course_faqs', '2019-05-27 14:45:56', '2019-05-27 14:45:56'),
	(98, 'read_course_faqs', 'course_faqs', '2019-05-27 14:45:56', '2019-05-27 14:45:56'),
	(99, 'edit_course_faqs', 'course_faqs', '2019-05-27 14:45:56', '2019-05-27 14:45:56'),
	(100, 'add_course_faqs', 'course_faqs', '2019-05-27 14:45:56', '2019-05-27 14:45:56'),
	(101, 'delete_course_faqs', 'course_faqs', '2019-05-27 14:45:56', '2019-05-27 14:45:56'),
	(107, 'browse_faqs', 'faqs', '2019-05-27 15:20:56', '2019-05-27 15:20:56'),
	(108, 'read_faqs', 'faqs', '2019-05-27 15:20:56', '2019-05-27 15:20:56'),
	(109, 'edit_faqs', 'faqs', '2019-05-27 15:20:56', '2019-05-27 15:20:56'),
	(110, 'add_faqs', 'faqs', '2019-05-27 15:20:56', '2019-05-27 15:20:56'),
	(111, 'delete_faqs', 'faqs', '2019-05-27 15:20:56', '2019-05-27 15:20:56'),
	(112, 'browse_student_says', 'student_says', '2019-05-27 15:22:36', '2019-05-27 15:22:36'),
	(113, 'read_student_says', 'student_says', '2019-05-27 15:22:36', '2019-05-27 15:22:36'),
	(114, 'edit_student_says', 'student_says', '2019-05-27 15:22:36', '2019-05-27 15:22:36'),
	(115, 'add_student_says', 'student_says', '2019-05-27 15:22:36', '2019-05-27 15:22:36'),
	(116, 'delete_student_says', 'student_says', '2019-05-27 15:22:36', '2019-05-27 15:22:36'),
	(117, 'browse_sponsors', 'sponsors', '2019-05-27 15:25:00', '2019-05-27 15:25:00'),
	(118, 'read_sponsors', 'sponsors', '2019-05-27 15:25:00', '2019-05-27 15:25:00'),
	(119, 'edit_sponsors', 'sponsors', '2019-05-27 15:25:00', '2019-05-27 15:25:00'),
	(120, 'add_sponsors', 'sponsors', '2019-05-27 15:25:00', '2019-05-27 15:25:00'),
	(121, 'delete_sponsors', 'sponsors', '2019-05-27 15:25:00', '2019-05-27 15:25:00'),
	(122, 'browse_teacher_profiles', 'teacher_profiles', '2019-05-27 15:28:36', '2019-05-27 15:28:36'),
	(123, 'read_teacher_profiles', 'teacher_profiles', '2019-05-27 15:28:36', '2019-05-27 15:28:36'),
	(124, 'edit_teacher_profiles', 'teacher_profiles', '2019-05-27 15:28:36', '2019-05-27 15:28:36'),
	(125, 'add_teacher_profiles', 'teacher_profiles', '2019-05-27 15:28:36', '2019-05-27 15:28:36'),
	(126, 'delete_teacher_profiles', 'teacher_profiles', '2019-05-27 15:28:36', '2019-05-27 15:28:36'),
	(127, 'browse_course_sessions', 'course_sessions', '2019-05-27 16:06:31', '2019-05-27 16:06:31'),
	(128, 'read_course_sessions', 'course_sessions', '2019-05-27 16:06:31', '2019-05-27 16:06:31'),
	(129, 'edit_course_sessions', 'course_sessions', '2019-05-27 16:06:31', '2019-05-27 16:06:31'),
	(130, 'add_course_sessions', 'course_sessions', '2019-05-27 16:06:31', '2019-05-27 16:06:31'),
	(131, 'delete_course_sessions', 'course_sessions', '2019-05-27 16:06:31', '2019-05-27 16:06:31');
/*!40000 ALTER TABLE `permissions` ENABLE KEYS */;

-- Dumping structure for table e-learningv.permission_role
CREATE TABLE IF NOT EXISTS `permission_role` (
  `permission_id` bigint(20) unsigned NOT NULL,
  `role_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`permission_id`,`role_id`),
  KEY `permission_role_permission_id_index` (`permission_id`),
  KEY `permission_role_role_id_index` (`role_id`),
  CONSTRAINT `permission_role_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `permission_role_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table e-learningv.permission_role: ~101 rows (approximately)
/*!40000 ALTER TABLE `permission_role` DISABLE KEYS */;
INSERT INTO `permission_role` (`permission_id`, `role_id`) VALUES
	(1, 1),
	(2, 1),
	(3, 1),
	(4, 1),
	(5, 1),
	(6, 1),
	(7, 1),
	(8, 1),
	(9, 1),
	(10, 1),
	(11, 1),
	(12, 1),
	(13, 1),
	(14, 1),
	(15, 1),
	(16, 1),
	(17, 1),
	(18, 1),
	(19, 1),
	(20, 1),
	(21, 1),
	(22, 1),
	(23, 1),
	(24, 1),
	(25, 1),
	(31, 1),
	(32, 1),
	(33, 1),
	(34, 1),
	(35, 1),
	(41, 1),
	(57, 1),
	(58, 1),
	(59, 1),
	(60, 1),
	(61, 1),
	(62, 1),
	(63, 1),
	(64, 1),
	(65, 1),
	(66, 1),
	(67, 1),
	(68, 1),
	(69, 1),
	(70, 1),
	(71, 1),
	(72, 1),
	(73, 1),
	(74, 1),
	(75, 1),
	(76, 1),
	(77, 1),
	(78, 1),
	(79, 1),
	(80, 1),
	(81, 1),
	(82, 1),
	(83, 1),
	(84, 1),
	(85, 1),
	(86, 1),
	(87, 1),
	(88, 1),
	(89, 1),
	(90, 1),
	(91, 1),
	(92, 1),
	(93, 1),
	(94, 1),
	(95, 1),
	(96, 1),
	(97, 1),
	(98, 1),
	(99, 1),
	(100, 1),
	(101, 1),
	(107, 1),
	(108, 1),
	(109, 1),
	(110, 1),
	(111, 1),
	(112, 1),
	(113, 1),
	(114, 1),
	(115, 1),
	(116, 1),
	(117, 1),
	(118, 1),
	(119, 1),
	(120, 1),
	(121, 1),
	(122, 1),
	(123, 1),
	(124, 1),
	(125, 1),
	(126, 1),
	(127, 1),
	(128, 1),
	(129, 1),
	(130, 1),
	(131, 1);
/*!40000 ALTER TABLE `permission_role` ENABLE KEYS */;

-- Dumping structure for table e-learningv.posts
CREATE TABLE IF NOT EXISTS `posts` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `category_id` int(11) DEFAULT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `seo_title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `excerpt` text COLLATE utf8mb4_unicode_ci,
  `body` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta_description` text COLLATE utf8mb4_unicode_ci,
  `meta_keywords` text COLLATE utf8mb4_unicode_ci,
  `status` enum('PUBLISHED','DRAFT','PENDING') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'DRAFT',
  `featured` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `posts_slug_unique` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table e-learningv.posts: ~4 rows (approximately)
/*!40000 ALTER TABLE `posts` DISABLE KEYS */;
INSERT INTO `posts` (`id`, `user_id`, `category_id`, `title`, `seo_title`, `excerpt`, `body`, `image`, `slug`, `meta_description`, `meta_keywords`, `status`, `featured`, `created_at`, `updated_at`) VALUES
	(1, 11, 1, 'Lorem Ipsum Post blog', NULL, 'Lorem, ipsum dolor sit amet consectetur adipisicing elit. Labore fugiat in quod maiores voluptate nesciunt ipsum, aperiam consequuntur', '<p style="box-sizing: border-box; margin: 0px 0px 22px; font-family: Poppins, sans-serif; font-size: 13px; vertical-align: baseline; padding: 0px; border: 0px; outline: 0px; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; color: #797979;">Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt</p>\r\n<h4 style="box-sizing: border-box; font-family: Montserrat, sans-serif; font-weight: inherit; line-height: 23px; color: #3f3f3f; margin: 0px 0px 18px; font-size: 16px; vertical-align: baseline; padding: 0px; border: 0px; outline: 0px; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;">Section 1.10.32 of "de Finibus Bonorum et Malorum", written by Cicero in 45 BC</h4>\r\n<p style="box-sizing: border-box; margin: 0px 0px 22px; font-family: Poppins, sans-serif; font-size: 13px; vertical-align: baseline; padding: 0px; border: 0px; outline: 0px; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; color: #797979;">But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness. No one rejects, dislikes, or avoids pleasure itself, because it is pleasure, but because those who do not know how to pursue pleasure rationally encounter consequences that are extremely painful. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure.</p>\r\n<h4 style="box-sizing: border-box; font-family: Montserrat, sans-serif; font-weight: inherit; line-height: 23px; color: #3f3f3f; margin: 0px 0px 18px; font-size: 16px; vertical-align: baseline; padding: 0px; border: 0px; outline: 0px; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;">The standard Lorem Ipsum passage, used since the 1500s</h4>\r\n<p style="box-sizing: border-box; margin: 0px 0px 22px; font-family: Poppins, sans-serif; font-size: 13px; vertical-align: baseline; padding: 0px; border: 0px; outline: 0px; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; color: #797979;">On the other hand, we denounce with righteous indignation and dislike men who are so beguiled and demoralized by the charms of pleasure of the moment, so blinded by desire, that they cannot foresee the pain and trouble that are bound to ensue; and equal blame belongs to those who fail in their duty through weakness of will, which is the same as saying through shrinking from toil and pain. These cases are perfectly simple and easy to distinguish. In a free hour, when our power of choice is untrammelled and when nothing prevents our being able to do what we like best, every pleasure is to be welcomed and every pain avoided.</p>\r\n<p style="box-sizing: border-box; margin: 0px 0px 22px; font-family: Poppins, sans-serif; font-size: 13px; vertical-align: baseline; padding: 0px; border: 0px; outline: 0px; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; color: #797979;">At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident, similique sunt in culpa qui officia deserunt mollitia animi, id est laborum et dolorum fuga. Et harum quidem rerum facilis est et expedita distinctio. Nam libero tempore, cum soluta nobis est eligendi optio cumque nihil impedit quo minus id quod maxime placeat facere possimus, omnis voluptas assumenda est, omnis dolor repellendus.</p>', 'posts\\April2019\\ierEHZGZTVpFg9ZnTMHL.jpg', 'lorem-ipsum-post-blog', 'This is the meta description', 'keyword1, keyword2, keyword3', 'PUBLISHED', 0, '2019-04-17 08:40:03', '2019-04-19 13:15:45'),
	(2, 10, 1, 'My Sample Post Lorem', NULL, 'Lorem, ipsum dolor sit amet consectetur adipisicing elit. Labore fugiat in quod maiores voluptate nesciunt ipsum, aperiam consequuntur', '<p style="box-sizing: border-box; margin: 0px 0px 22px; font-family: Poppins, sans-serif; font-size: 13px; vertical-align: baseline; padding: 0px; border: 0px; outline: 0px; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; color: #797979;">Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt</p>\r\n<h4 style="box-sizing: border-box; font-family: Montserrat, sans-serif; font-weight: inherit; line-height: 23px; color: #3f3f3f; margin: 0px 0px 18px; font-size: 16px; vertical-align: baseline; padding: 0px; border: 0px; outline: 0px; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;">Section 1.10.32 of "de Finibus Bonorum et Malorum", written by Cicero in 45 BC</h4>\r\n<p style="box-sizing: border-box; margin: 0px 0px 22px; font-family: Poppins, sans-serif; font-size: 13px; vertical-align: baseline; padding: 0px; border: 0px; outline: 0px; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; color: #797979;">But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness. No one rejects, dislikes, or avoids pleasure itself, because it is pleasure, but because those who do not know how to pursue pleasure rationally encounter consequences that are extremely painful. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure.</p>\r\n<h4 style="box-sizing: border-box; font-family: Montserrat, sans-serif; font-weight: inherit; line-height: 23px; color: #3f3f3f; margin: 0px 0px 18px; font-size: 16px; vertical-align: baseline; padding: 0px; border: 0px; outline: 0px; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;">The standard Lorem Ipsum passage, used since the 1500s</h4>\r\n<p style="box-sizing: border-box; margin: 0px 0px 22px; font-family: Poppins, sans-serif; font-size: 13px; vertical-align: baseline; padding: 0px; border: 0px; outline: 0px; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; color: #797979;">On the other hand, we denounce with righteous indignation and dislike men who are so beguiled and demoralized by the charms of pleasure of the moment, so blinded by desire, that they cannot foresee the pain and trouble that are bound to ensue; and equal blame belongs to those who fail in their duty through weakness of will, which is the same as saying through shrinking from toil and pain. These cases are perfectly simple and easy to distinguish. In a free hour, when our power of choice is untrammelled and when nothing prevents our being able to do what we like best, every pleasure is to be welcomed and every pain avoided.</p>\r\n<p style="box-sizing: border-box; margin: 0px 0px 22px; font-family: Poppins, sans-serif; font-size: 13px; vertical-align: baseline; padding: 0px; border: 0px; outline: 0px; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; color: #797979;">At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident, similique sunt in culpa qui officia deserunt mollitia animi, id est laborum et dolorum fuga. Et harum quidem rerum facilis est et expedita distinctio. Nam libero tempore, cum soluta nobis est eligendi optio cumque nihil impedit quo minus id quod maxime placeat facere possimus, omnis voluptas assumenda est, omnis dolor repellendus.</p>', 'posts\\April2019\\H8tbWiFZkwfksKPJYmC2.jpg', 'my-sample-post-lorem', 'Meta Description for sample post', 'keyword1, keyword2, keyword3', 'PUBLISHED', 0, '2019-04-17 08:40:03', '2019-04-19 13:16:22'),
	(3, 12, 2, 'My Sample Post one Laravel', NULL, 'Lorem, ipsum dolor sit amet consectetur adipisicing elit. Labore fugiat in quod maiores voluptate nesciunt ipsum,', '<p style="box-sizing: border-box; margin: 0px 0px 22px; font-family: Poppins, sans-serif; font-size: 13px; vertical-align: baseline; padding: 0px; border: 0px; outline: 0px; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; color: #797979;">Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt</p>\r\n<h4 style="box-sizing: border-box; font-family: Montserrat, sans-serif; font-weight: inherit; line-height: 23px; color: #3f3f3f; margin: 0px 0px 18px; font-size: 16px; vertical-align: baseline; padding: 0px; border: 0px; outline: 0px; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;">Section 1.10.32 of "de Finibus Bonorum et Malorum", written by Cicero in 45 BC</h4>\r\n<p style="box-sizing: border-box; margin: 0px 0px 22px; font-family: Poppins, sans-serif; font-size: 13px; vertical-align: baseline; padding: 0px; border: 0px; outline: 0px; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; color: #797979;">But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness. No one rejects, dislikes, or avoids pleasure itself, because it is pleasure, but because those who do not know how to pursue pleasure rationally encounter consequences that are extremely painful. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure.</p>\r\n<h4 style="box-sizing: border-box; font-family: Montserrat, sans-serif; font-weight: inherit; line-height: 23px; color: #3f3f3f; margin: 0px 0px 18px; font-size: 16px; vertical-align: baseline; padding: 0px; border: 0px; outline: 0px; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;">The standard Lorem Ipsum passage, used since the 1500s</h4>\r\n<p style="box-sizing: border-box; margin: 0px 0px 22px; font-family: Poppins, sans-serif; font-size: 13px; vertical-align: baseline; padding: 0px; border: 0px; outline: 0px; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; color: #797979;">On the other hand, we denounce with righteous indignation and dislike men who are so beguiled and demoralized by the charms of pleasure of the moment, so blinded by desire, that they cannot foresee the pain and trouble that are bound to ensue; and equal blame belongs to those who fail in their duty through weakness of will, which is the same as saying through shrinking from toil and pain. These cases are perfectly simple and easy to distinguish. In a free hour, when our power of choice is untrammelled and when nothing prevents our being able to do what we like best, every pleasure is to be welcomed and every pain avoided.</p>\r\n<p style="box-sizing: border-box; margin: 0px 0px 22px; font-family: Poppins, sans-serif; font-size: 13px; vertical-align: baseline; padding: 0px; border: 0px; outline: 0px; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; color: #797979;">At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident, similique sunt in culpa qui officia deserunt mollitia animi, id est laborum et dolorum fuga. Et harum quidem rerum facilis est et expedita distinctio. Nam libero tempore, cum soluta nobis est eligendi optio cumque nihil impedit quo minus id quod maxime placeat facere possimus, omnis voluptas assumenda est, omnis dolor repellendus.</p>', 'posts\\April2019\\2353J9gWKl3ENshxYzBq.jpg', 'my-sample-post-one-laravel', 'Meta Description for sample post', NULL, 'PUBLISHED', 0, '2019-04-19 10:54:38', '2019-04-19 13:15:27'),
	(4, 11, 1, 'Photoshop - Web noudjs', NULL, 'Lorem, ipsum dolor sit amet consectetur adipisicing elit. Labore fugiat in quod maiores voluptate nesciunt ipsum, aperiam consequuntur', '<p style="box-sizing: border-box; margin: 0px 0px 22px; font-family: Poppins, sans-serif; font-size: 13px; vertical-align: baseline; padding: 0px; border: 0px; outline: 0px; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; color: #797979;">Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt</p>\r\n<h4 style="box-sizing: border-box; font-family: Montserrat, sans-serif; font-weight: inherit; line-height: 23px; color: #3f3f3f; margin: 0px 0px 18px; font-size: 16px; vertical-align: baseline; padding: 0px; border: 0px; outline: 0px; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;">Section 1.10.32 of "de Finibus Bonorum et Malorum", written by Cicero in 45 BC</h4>\r\n<p style="box-sizing: border-box; margin: 0px 0px 22px; font-family: Poppins, sans-serif; font-size: 13px; vertical-align: baseline; padding: 0px; border: 0px; outline: 0px; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; color: #797979;">But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness. No one rejects, dislikes, or avoids pleasure itself, because it is pleasure, but because those who do not know how to pursue pleasure rationally encounter consequences that are extremely painful. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure.</p>\r\n<h4 style="box-sizing: border-box; font-family: Montserrat, sans-serif; font-weight: inherit; line-height: 23px; color: #3f3f3f; margin: 0px 0px 18px; font-size: 16px; vertical-align: baseline; padding: 0px; border: 0px; outline: 0px; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;">The standard Lorem Ipsum passage, used since the 1500s</h4>\r\n<p style="box-sizing: border-box; margin: 0px 0px 22px; font-family: Poppins, sans-serif; font-size: 13px; vertical-align: baseline; padding: 0px; border: 0px; outline: 0px; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; color: #797979;">On the other hand, we denounce with righteous indignation and dislike men who are so beguiled and demoralized by the charms of pleasure of the moment, so blinded by desire, that they cannot foresee the pain and trouble that are bound to ensue; and equal blame belongs to those who fail in their duty through weakness of will, which is the same as saying through shrinking from toil and pain. These cases are perfectly simple and easy to distinguish. In a free hour, when our power of choice is untrammelled and when nothing prevents our being able to do what we like best, every pleasure is to be welcomed and every pain avoided.</p>\r\n<p style="box-sizing: border-box; margin: 0px 0px 22px; font-family: Poppins, sans-serif; font-size: 13px; vertical-align: baseline; padding: 0px; border: 0px; outline: 0px; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; color: #797979;">At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident, similique sunt in culpa qui officia deserunt mollitia animi, id est laborum et dolorum fuga. Et harum quidem rerum facilis est et expedita distinctio. Nam libero tempore, cum soluta nobis est eligendi optio cumque nihil impedit quo minus id quod maxime placeat facere possimus, omnis voluptas assumenda est, omnis dolor repellendus.</p>', 'posts\\April2019\\qH5XaqhXCWfYjs6T5pwr.jpg', 'photoshop-web-noudjs', 'Meta Description for sample post', NULL, 'PUBLISHED', 0, '2019-04-19 10:56:08', '2019-04-26 21:14:47');
/*!40000 ALTER TABLE `posts` ENABLE KEYS */;

-- Dumping structure for table e-learningv.questions
CREATE TABLE IF NOT EXISTS `questions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `course_id` int(11) DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `full_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `question` tinytext COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table e-learningv.questions: ~12 rows (approximately)
/*!40000 ALTER TABLE `questions` DISABLE KEYS */;
INSERT INTO `questions` (`id`, `course_id`, `email`, `full_name`, `question`, `created_at`, `updated_at`) VALUES
	(1, 4, 'essanhaji@gmail.com', 'El houcine Es Sanhaji', 'In its most basic form, R can be used as a simple calculator. Consider the following arithmetic operators ?', '2019-04-19 09:03:30', '2019-04-19 09:03:30'),
	(2, 4, 'ennouri@gmail.com', 'Abdelouahed Ennouri', 'In its most basic form, R can be used as a simple calculator. Consider the following arithmetic operators ?', '2019-04-19 09:04:16', '2019-04-19 09:04:16'),
	(5, 4, 'roudani@gmail.com', 'Mohamed Roudani', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor?', '2019-04-25 17:07:17', '2019-04-25 17:07:17'),
	(6, 4, 'boukdir@gmail.com', 'Mohamed Boukdir', 'nostrud exercitation ulla mco laboris nisi ut aliquip ex ea commodo consequat ?', '2019-04-25 17:14:09', '2019-04-25 17:14:09'),
	(7, 4, 'said@gmail.com', 'Said Elbaaqyly', 'nostrum, ex dolorem officia! Cum velit corporis similique ?', '2019-04-30 13:45:01', '2019-04-30 13:45:01'),
	(8, 4, 'abbomate@gmail.com', 'Abbo Maite', 'You are running Vue in development mode ?', '2019-05-02 09:16:08', '2019-05-02 09:16:08'),
	(9, 1, 'essanhaji@gmail.com', 'El houcine Es Sanhaji', 'In its most basic form, R can be used as a simple calculator. Consider the following arithmetic operators ?', '2019-04-19 09:03:30', '2019-04-19 09:03:30'),
	(10, 1, 'ennouri@gmail.com', 'Abdelouahed Ennouri', 'In its most basic form, R can be used as a simple calculator. Consider the following arithmetic operators ?', '2019-04-19 09:04:16', '2019-04-19 09:04:16'),
	(11, 1, 'roudani@gmail.com', 'Mohamed Roudani', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor?', '2019-04-25 17:07:17', '2019-04-25 17:07:17'),
	(12, 1, 'boukdir@gmail.com', 'Mohamed Boukdir', 'nostrud exercitation ulla mco laboris nisi ut aliquip ex ea commodo consequat ?', '2019-04-25 17:14:09', '2019-04-25 17:14:09'),
	(13, 1, 'said@gmail.com', 'Said Elbaaqyly', 'nostrum, ex dolorem officia! Cum velit corporis similique ?', '2019-04-30 13:45:01', '2019-04-30 13:45:01'),
	(14, 1, 'abbomate@gmail.com', 'Abbo Maite', 'You are running Vue in development mode ?', '2019-05-02 09:16:08', '2019-05-02 09:16:08');
/*!40000 ALTER TABLE `questions` ENABLE KEYS */;

-- Dumping structure for table e-learningv.roles
CREATE TABLE IF NOT EXISTS `roles` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `roles_name_unique` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table e-learningv.roles: ~3 rows (approximately)
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` (`id`, `name`, `display_name`, `created_at`, `updated_at`) VALUES
	(1, 'admin', 'Administrator', '2019-04-29 13:47:38', '2019-04-29 13:47:38'),
	(2, 'student', 'Student', '2019-04-29 13:47:38', '2019-04-29 13:52:53'),
	(3, 'teacher', 'Teacher', '2019-04-29 13:53:10', '2019-04-29 13:53:10');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;

-- Dumping structure for table e-learningv.sessions
CREATE TABLE IF NOT EXISTS `sessions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `course_id` int(11) DEFAULT NULL,
  `student_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=194 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table e-learningv.sessions: ~193 rows (approximately)
/*!40000 ALTER TABLE `sessions` DISABLE KEYS */;
INSERT INTO `sessions` (`id`, `course_id`, `student_id`, `created_at`, `updated_at`) VALUES
	(1, 4, 4, '2019-04-19 10:03:09', '2019-04-19 10:03:09'),
	(2, 4, 5, '2019-04-19 10:04:12', '2019-04-19 10:04:12'),
	(3, 5, 5, '2019-05-22 14:39:27', '2019-05-22 14:39:31'),
	(4, 1, 1, '2019-01-21 10:48:40', '2019-01-21 10:48:40'),
	(5, 1, 1, '2019-01-21 10:48:40', '2019-01-21 10:48:40'),
	(6, 1, 2, '2019-02-21 10:48:40', '2019-02-21 10:48:40'),
	(7, 1, 3, '2019-03-21 10:48:40', '2019-03-21 10:48:40'),
	(8, 1, 4, '2019-04-21 10:48:40', '2019-04-21 10:48:40'),
	(9, 1, 5, '2019-05-21 11:48:40', '2019-05-21 11:48:40'),
	(10, 1, 6, '2019-06-21 10:48:40', '2019-06-21 10:48:40'),
	(11, 1, 7, '2019-07-21 10:48:40', '2019-07-21 10:48:40'),
	(12, 1, 8, '2019-08-21 10:48:40', '2019-08-21 10:48:40'),
	(13, 1, 9, '2019-09-21 10:48:40', '2019-09-21 10:48:40'),
	(14, 2, 1, '2019-01-21 10:48:40', '2019-01-21 10:48:40'),
	(15, 2, 2, '2019-02-21 10:48:40', '2019-02-21 10:48:40'),
	(16, 2, 3, '2019-03-21 10:48:40', '2019-03-21 10:48:40'),
	(17, 2, 4, '2019-04-21 10:48:40', '2019-04-21 10:48:40'),
	(18, 2, 5, '2019-05-21 11:48:40', '2019-05-21 11:48:40'),
	(19, 2, 6, '2019-06-21 10:48:40', '2019-06-21 10:48:40'),
	(20, 2, 7, '2019-07-21 10:48:40', '2019-07-21 10:48:40'),
	(21, 2, 8, '2019-08-21 10:48:40', '2019-08-21 10:48:40'),
	(22, 2, 9, '2019-09-21 10:48:40', '2019-09-21 10:48:40'),
	(23, 3, 1, '2019-01-21 10:48:40', '2019-01-21 10:48:40'),
	(24, 3, 2, '2019-02-21 10:48:40', '2019-02-21 10:48:40'),
	(25, 3, 3, '2019-03-21 10:48:40', '2019-03-21 10:48:40'),
	(26, 3, 4, '2019-04-21 10:48:40', '2019-04-21 10:48:40'),
	(27, 3, 5, '2019-05-21 11:48:40', '2019-05-21 11:48:40'),
	(28, 3, 6, '2019-06-21 10:48:40', '2019-06-21 10:48:40'),
	(29, 3, 7, '2019-07-21 10:48:40', '2019-07-21 10:48:40'),
	(30, 3, 8, '2019-08-21 10:48:40', '2019-08-21 10:48:40'),
	(31, 3, 9, '2019-09-21 10:48:40', '2019-09-21 10:48:40'),
	(32, 4, 1, '2019-01-21 10:48:40', '2019-01-21 10:48:40'),
	(33, 4, 2, '2019-02-21 10:48:40', '2019-02-21 10:48:40'),
	(34, 4, 3, '2019-03-21 10:48:40', '2019-03-21 10:48:40'),
	(35, 4, 4, '2019-04-21 10:48:40', '2019-04-21 10:48:40'),
	(36, 4, 5, '2019-05-21 11:48:40', '2019-05-21 11:48:40'),
	(37, 4, 6, '2019-06-21 10:48:40', '2019-06-21 10:48:40'),
	(38, 4, 7, '2019-07-21 10:48:40', '2019-07-21 10:48:40'),
	(39, 4, 8, '2019-08-21 10:48:40', '2019-08-21 10:48:40'),
	(40, 4, 9, '2019-09-21 10:48:40', '2019-09-21 10:48:40'),
	(41, 5, 1, '2019-01-21 10:48:40', '2019-01-21 10:48:40'),
	(42, 5, 2, '2019-02-21 10:48:40', '2019-02-21 10:48:40'),
	(43, 5, 3, '2019-03-21 10:48:40', '2019-03-21 10:48:40'),
	(44, 5, 4, '2019-04-21 10:48:40', '2019-04-21 10:48:40'),
	(45, 5, 5, '2019-05-21 11:48:40', '2019-05-21 11:48:40'),
	(46, 5, 6, '2019-06-21 10:48:40', '2019-06-21 10:48:40'),
	(47, 5, 7, '2019-07-21 10:48:40', '2019-07-21 10:48:40'),
	(48, 5, 8, '2019-08-21 10:48:40', '2019-08-21 10:48:40'),
	(49, 5, 9, '2019-12-21 10:48:40', '2019-09-21 10:48:40'),
	(50, 3, 16, '2019-01-21 10:48:40', '2019-01-21 10:48:40'),
	(51, 4, 16, '2019-01-21 10:48:40', '2019-01-21 10:48:40'),
	(52, 1, 16, '2019-01-21 10:48:40', '2019-01-21 10:48:40'),
	(53, 1, 17, '2019-02-21 10:48:40', '2019-02-21 10:48:40'),
	(54, 2, 17, '2019-02-21 10:48:40', '2019-02-21 10:48:40'),
	(55, 4, 17, '2019-02-21 10:48:40', '2019-02-21 10:48:40'),
	(56, 4, 18, '2019-03-21 10:48:40', '2019-03-21 10:48:40'),
	(57, 3, 18, '2019-03-21 10:48:40', '2019-03-21 10:48:40'),
	(58, 1, 18, '2019-03-21 10:48:40', '2019-03-21 10:48:40'),
	(59, 4, 19, '2019-04-21 10:48:40', '2019-04-21 10:48:40'),
	(60, 3, 19, '2019-04-21 10:48:40', '2019-04-21 10:48:40'),
	(61, 5, 19, '2019-04-21 10:48:40', '2019-04-21 10:48:40'),
	(62, 2, 20, '2019-05-21 11:48:40', '2019-05-21 11:48:40'),
	(63, 1, 20, '2019-05-21 11:48:40', '2019-05-21 11:48:40'),
	(64, 4, 20, '2019-05-21 11:48:40', '2019-05-21 11:48:40'),
	(65, 5, 21, '2019-06-21 10:48:40', '2019-06-21 10:48:40'),
	(66, 3, 21, '2019-06-21 10:48:40', '2019-06-21 10:48:40'),
	(67, 5, 21, '2019-06-21 10:48:40', '2019-06-21 10:48:40'),
	(68, 5, 22, '2019-07-21 10:48:40', '2019-07-21 10:48:40'),
	(69, 2, 22, '2019-07-21 10:48:40', '2019-07-21 10:48:40'),
	(70, 5, 22, '2019-07-21 10:48:40', '2019-07-21 10:48:40'),
	(71, 1, 23, '2019-08-21 10:48:40', '2019-08-21 10:48:40'),
	(72, 3, 23, '2019-08-21 10:48:40', '2019-08-21 10:48:40'),
	(73, 1, 23, '2019-08-21 10:48:40', '2019-08-21 10:48:40'),
	(74, 4, 24, '2019-09-21 10:48:40', '2019-09-21 10:48:40'),
	(75, 1, 24, '2019-09-21 10:48:40', '2019-09-21 10:48:40'),
	(76, 5, 24, '2019-09-21 10:48:40', '2019-09-21 10:48:40'),
	(77, 1, 25, '2019-10-21 10:48:40', '2019-10-21 10:48:40'),
	(78, 3, 25, '2019-10-21 10:48:40', '2019-10-21 10:48:40'),
	(79, 1, 25, '2019-10-21 10:48:40', '2019-10-21 10:48:40'),
	(80, 2, 26, '2019-11-21 10:48:40', '2019-11-21 10:48:40'),
	(81, 2, 26, '2019-11-21 10:48:40', '2019-11-21 10:48:40'),
	(82, 5, 26, '2019-11-21 10:48:40', '2019-11-21 10:48:40'),
	(83, 4, 27, '2019-12-21 10:48:40', '2019-12-21 10:48:40'),
	(84, 1, 27, '2019-12-21 10:48:40', '2019-12-21 10:48:40'),
	(85, 4, 27, '2019-12-21 10:48:40', '2019-12-21 10:48:40'),
	(86, 4, 28, '2019-01-21 10:48:40', '2019-01-21 10:48:40'),
	(87, 1, 28, '2019-01-21 10:48:40', '2019-01-21 10:48:40'),
	(88, 5, 28, '2019-01-21 10:48:40', '2019-01-21 10:48:40'),
	(89, 2, 29, '2019-02-21 10:48:40', '2019-02-21 10:48:40'),
	(90, 5, 29, '2019-02-21 10:48:40', '2019-02-21 10:48:40'),
	(91, 5, 29, '2019-02-21 10:48:40', '2019-02-21 10:48:40'),
	(92, 6, 30, '2019-03-21 10:48:40', '2019-03-21 10:48:40'),
	(93, 6, 30, '2019-03-21 10:48:40', '2019-03-21 10:48:40'),
	(94, 3, 30, '2019-03-21 10:48:40', '2019-03-21 10:48:40'),
	(95, 4, 31, '2019-04-21 10:48:40', '2019-04-21 10:48:40'),
	(96, 3, 31, '2019-04-21 10:48:40', '2019-04-21 10:48:40'),
	(97, 2, 31, '2019-04-21 10:48:40', '2019-04-21 10:48:40'),
	(98, 6, 32, '2019-05-21 11:48:40', '2019-05-21 11:48:40'),
	(99, 4, 32, '2019-05-21 11:48:40', '2019-05-21 11:48:40'),
	(100, 4, 32, '2019-05-21 11:48:40', '2019-05-21 11:48:40'),
	(101, 4, 33, '2019-06-21 10:48:40', '2019-06-21 10:48:40'),
	(102, 5, 33, '2019-06-21 10:48:40', '2019-06-21 10:48:40'),
	(103, 4, 33, '2019-06-21 10:48:40', '2019-06-21 10:48:40'),
	(104, 1, 34, '2019-07-21 10:48:40', '2019-07-21 10:48:40'),
	(105, 2, 34, '2019-07-21 10:48:40', '2019-07-21 10:48:40'),
	(106, 1, 34, '2019-07-21 10:48:40', '2019-07-21 10:48:40'),
	(107, 3, 35, '2019-08-21 10:48:40', '2019-08-21 10:48:40'),
	(108, 4, 35, '2019-08-21 10:48:40', '2019-08-21 10:48:40'),
	(109, 1, 35, '2019-08-21 10:48:40', '2019-08-21 10:48:40'),
	(110, 5, 36, '2019-09-21 10:48:40', '2019-09-21 10:48:40'),
	(111, 6, 36, '2019-09-21 10:48:40', '2019-09-21 10:48:40'),
	(112, 5, 36, '2019-09-21 10:48:40', '2019-09-21 10:48:40'),
	(113, 4, 37, '2019-10-21 10:48:40', '2019-10-21 10:48:40'),
	(114, 3, 37, '2019-10-21 10:48:40', '2019-10-21 10:48:40'),
	(115, 2, 37, '2019-10-21 10:48:40', '2019-10-21 10:48:40'),
	(116, 4, 38, '2019-11-21 10:48:40', '2019-11-21 10:48:40'),
	(117, 6, 38, '2019-11-21 10:48:40', '2019-11-21 10:48:40'),
	(118, 2, 38, '2019-11-21 10:48:40', '2019-11-21 10:48:40'),
	(119, 4, 39, '2019-12-21 10:48:40', '2019-12-21 10:48:40'),
	(120, 5, 39, '2019-12-21 10:48:40', '2019-12-21 10:48:40'),
	(121, 2, 39, '2019-12-21 10:48:40', '2019-12-21 10:48:40'),
	(122, 5, 40, '2019-01-21 10:48:40', '2019-01-21 10:48:40'),
	(123, 2, 40, '2019-01-21 10:48:40', '2019-01-21 10:48:40'),
	(124, 2, 40, '2019-01-21 10:48:40', '2019-01-21 10:48:40'),
	(125, 2, 41, '2019-02-21 10:48:40', '2019-02-21 10:48:40'),
	(126, 2, 41, '2019-02-21 10:48:40', '2019-02-21 10:48:40'),
	(127, 2, 41, '2019-02-21 10:48:40', '2019-02-21 10:48:40'),
	(128, 5, 42, '2019-03-21 10:48:40', '2019-03-21 10:48:40'),
	(129, 4, 42, '2019-03-21 10:48:40', '2019-03-21 10:48:40'),
	(130, 6, 42, '2019-03-21 10:48:40', '2019-03-21 10:48:40'),
	(131, 5, 43, '2019-04-21 10:48:40', '2019-04-21 10:48:40'),
	(132, 6, 43, '2019-04-21 10:48:40', '2019-04-21 10:48:40'),
	(133, 5, 43, '2019-04-21 10:48:40', '2019-04-21 10:48:40'),
	(134, 5, 44, '2019-05-21 11:48:40', '2019-05-21 11:48:40'),
	(135, 4, 44, '2019-05-21 11:48:40', '2019-05-21 11:48:40'),
	(136, 3, 44, '2019-05-21 11:48:40', '2019-05-21 11:48:40'),
	(137, 5, 45, '2019-06-21 10:48:40', '2019-06-21 10:48:40'),
	(138, 5, 45, '2019-06-21 10:48:40', '2019-06-21 10:48:40'),
	(139, 2, 45, '2019-06-21 10:48:40', '2019-06-21 10:48:40'),
	(140, 2, 46, '2019-07-21 10:48:40', '2019-07-21 10:48:40'),
	(141, 4, 46, '2019-07-21 10:48:40', '2019-07-21 10:48:40'),
	(142, 6, 46, '2019-07-21 10:48:40', '2019-07-21 10:48:40'),
	(143, 3, 47, '2019-08-21 10:48:40', '2019-08-21 10:48:40'),
	(144, 2, 47, '2019-08-21 10:48:40', '2019-08-21 10:48:40'),
	(145, 3, 47, '2019-08-21 10:48:40', '2019-08-21 10:48:40'),
	(146, 2, 48, '2019-09-21 10:48:40', '2019-09-21 10:48:40'),
	(147, 6, 48, '2019-09-21 10:48:40', '2019-09-21 10:48:40'),
	(148, 1, 48, '2019-09-21 10:48:40', '2019-09-21 10:48:40'),
	(149, 3, 49, '2019-10-21 10:48:40', '2019-10-21 10:48:40'),
	(150, 5, 49, '2019-10-21 10:48:40', '2019-10-21 10:48:40'),
	(151, 1, 49, '2019-10-21 10:48:40', '2019-10-21 10:48:40'),
	(152, 5, 50, '2019-11-21 10:48:40', '2019-11-21 10:48:40'),
	(153, 2, 50, '2019-11-21 10:48:40', '2019-11-21 10:48:40'),
	(154, 5, 50, '2019-11-21 10:48:40', '2019-11-21 10:48:40'),
	(155, 2, 51, '2019-12-21 10:48:40', '2019-12-21 10:48:40'),
	(156, 5, 51, '2019-12-21 10:48:40', '2019-12-21 10:48:40'),
	(157, 5, 51, '2019-12-21 10:48:40', '2019-12-21 10:48:40'),
	(158, 6, 52, '2019-01-21 10:48:40', '2019-01-21 10:48:40'),
	(159, 6, 52, '2019-01-21 10:48:40', '2019-01-21 10:48:40'),
	(160, 1, 52, '2019-01-21 10:48:40', '2019-01-21 10:48:40'),
	(161, 4, 53, '2019-02-21 10:48:40', '2019-02-21 10:48:40'),
	(162, 6, 53, '2019-02-21 10:48:40', '2019-02-21 10:48:40'),
	(163, 4, 53, '2019-02-21 10:48:40', '2019-02-21 10:48:40'),
	(164, 1, 54, '2019-03-21 10:48:40', '2019-03-21 10:48:40'),
	(165, 3, 54, '2019-03-21 10:48:40', '2019-03-21 10:48:40'),
	(166, 5, 54, '2019-03-21 10:48:40', '2019-03-21 10:48:40'),
	(167, 3, 55, '2019-04-21 10:48:40', '2019-04-21 10:48:40'),
	(168, 1, 55, '2019-04-21 10:48:40', '2019-04-21 10:48:40'),
	(169, 1, 55, '2019-04-21 10:48:40', '2019-04-21 10:48:40'),
	(170, 5, 56, '2019-05-21 11:48:40', '2019-05-21 11:48:40'),
	(171, 4, 56, '2019-05-21 11:48:40', '2019-05-21 11:48:40'),
	(172, 5, 56, '2019-05-21 11:48:40', '2019-05-21 11:48:40'),
	(173, 3, 57, '2019-06-21 10:48:40', '2019-06-21 10:48:40'),
	(174, 3, 57, '2019-06-21 10:48:40', '2019-06-21 10:48:40'),
	(175, 4, 57, '2019-06-21 10:48:40', '2019-06-21 10:48:40'),
	(176, 2, 58, '2019-07-21 10:48:40', '2019-07-21 10:48:40'),
	(177, 3, 58, '2019-07-21 10:48:40', '2019-07-21 10:48:40'),
	(178, 1, 58, '2019-07-21 10:48:40', '2019-07-21 10:48:40'),
	(179, 3, 59, '2019-08-21 10:48:40', '2019-08-21 10:48:40'),
	(180, 5, 59, '2019-08-21 10:48:40', '2019-08-21 10:48:40'),
	(181, 1, 59, '2019-08-21 10:48:40', '2019-08-21 10:48:40'),
	(182, 1, 60, '2019-09-21 10:48:40', '2019-09-21 10:48:40'),
	(183, 4, 60, '2019-09-21 10:48:40', '2019-09-21 10:48:40'),
	(184, 4, 60, '2019-09-21 10:48:40', '2019-09-21 10:48:40'),
	(185, 1, 61, '2019-10-21 10:48:40', '2019-10-21 10:48:40'),
	(186, 2, 61, '2019-10-21 10:48:40', '2019-10-21 10:48:40'),
	(187, 1, 61, '2019-10-21 10:48:40', '2019-10-21 10:48:40'),
	(188, 2, 62, '2019-11-21 10:48:40', '2019-11-21 10:48:40'),
	(189, 1, 62, '2019-11-21 10:48:40', '2019-11-21 10:48:40'),
	(190, 5, 62, '2019-11-21 10:48:40', '2019-11-21 10:48:40'),
	(191, 4, 63, '2019-12-21 10:48:40', '2019-12-21 10:48:40'),
	(192, 3, 63, '2019-12-21 10:48:40', '2019-12-21 10:48:40'),
	(193, 5, 63, '2019-12-21 10:48:40', '2019-12-21 10:48:40');
/*!40000 ALTER TABLE `sessions` ENABLE KEYS */;

-- Dumping structure for table e-learningv.settings
CREATE TABLE IF NOT EXISTS `settings` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `key` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci,
  `details` text COLLATE utf8mb4_unicode_ci,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `order` int(11) NOT NULL DEFAULT '1',
  `group` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `settings_key_unique` (`key`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table e-learningv.settings: ~10 rows (approximately)
/*!40000 ALTER TABLE `settings` DISABLE KEYS */;
INSERT INTO `settings` (`id`, `key`, `display_name`, `value`, `details`, `type`, `order`, `group`) VALUES
	(1, 'site.title', 'Site Title', 'E-learning', '', 'text', 1, 'Site'),
	(2, 'site.description', 'Site Description', 'Site Description', '', 'text', 2, 'Site'),
	(3, 'site.logo', 'Site Logo', 'settings\\May2019\\F46pEnTrzEW6h5fmcBGw.png', '', 'image', 3, 'Site'),
	(4, 'site.google_analytics_tracking_id', 'Google Analytics Tracking ID', '589910251590-flk2g2hic0r8kr4lotm3c6geo6pf1fic.apps.googleusercontent.com', '', 'text', 4, 'Site'),
	(5, 'admin.bg_image', 'Admin Background Image', '', '', 'image', 5, 'Admin'),
	(6, 'admin.title', 'Admin Title', 'Voyager', '', 'text', 1, 'Admin'),
	(7, 'admin.description', 'Admin Description', 'Welcome to Voyager. The Missing Admin for Laravel', '', 'text', 2, 'Admin'),
	(8, 'admin.loader', 'Admin Loader', '', '', 'image', 3, 'Admin'),
	(9, 'admin.icon_image', 'Admin Icon Image', '', '', 'image', 4, 'Admin'),
	(10, 'admin.google_analytics_client_id', 'Google Analytics Client ID (used for admin dashboard)', '589910251590-flk2g2hic0r8kr4lotm3c6geo6pf1fic.apps.googleusercontent.com', '', 'text', 1, 'Admin');
/*!40000 ALTER TABLE `settings` ENABLE KEYS */;

-- Dumping structure for table e-learningv.sponsors
CREATE TABLE IF NOT EXISTS `sponsors` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `link` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT 'https://laravel.com/',
  `logo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table e-learningv.sponsors: ~6 rows (approximately)
/*!40000 ALTER TABLE `sponsors` DISABLE KEYS */;
INSERT INTO `sponsors` (`id`, `link`, `logo`, `name`, `created_at`, `updated_at`) VALUES
	(1, 'https://www.google.com/', 'sponsors\\April2019\\GThchMJLYjIeQuIvaHKu.jpg', 'KBM Consulting', '2019-04-19 13:47:23', '2019-04-19 13:47:23'),
	(2, 'https://www.google.com/', 'sponsors\\April2019\\ByinKNic2k4o696KejF2.jpg', 'EMPSI Consulting', '2019-04-19 13:47:52', '2019-04-19 13:47:52'),
	(3, 'https://www.google.com/', 'sponsors\\April2019\\CH6yaa2TWTHVcBMt9hpr.jpg', 'InovaTeck', '2019-04-19 13:48:15', '2019-04-19 13:48:15'),
	(4, 'https://www.google.com/', 'sponsors\\April2019\\BOMCUVEgEUSAxVzPdk2q.jpg', 'AMR', '2019-04-19 13:48:30', '2019-04-19 13:48:30'),
	(5, 'https://www.google.com/', 'sponsors\\April2019\\SH4Zy5vFtDt4qf49wA74.jpg', 'EPDD', '2019-04-19 13:49:03', '2019-04-19 13:49:03'),
	(6, 'https://www.google.com/', 'sponsors\\April2019\\XegQiDzNPPCYILuTn4s7.jpg', 'MAXI World', '2019-04-19 13:49:29', '2019-04-19 13:49:29');
/*!40000 ALTER TABLE `sponsors` ENABLE KEYS */;

-- Dumping structure for table e-learningv.student_says
CREATE TABLE IF NOT EXISTS `student_says` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `student_id` int(11) DEFAULT NULL,
  `content` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table e-learningv.student_says: ~2 rows (approximately)
/*!40000 ALTER TABLE `student_says` DISABLE KEYS */;
INSERT INTO `student_says` (`id`, `student_id`, `content`, `created_at`, `updated_at`) VALUES
	(1, 1, 'You don\'t need a whole ecommerce system to sell your online courses. Paypal, Stripe payment methods integration can help you sell your courses out of the box. In the case you wanna use WooCommerce, this awesome WordPress LMS Plugin.', '2019-04-19 14:22:39', '2019-04-19 14:22:39'),
	(2, 1, 'You don\'t need a whole ecommerce system to sell your online courses. Paypal, Stripe payment methods integration can help you sell your courses out of the box. In the case you wanna use WooCommerce, this awesome WordPress LMS Plugin.', '2019-04-19 14:22:59', '2019-04-19 14:22:59');
/*!40000 ALTER TABLE `student_says` ENABLE KEYS */;

-- Dumping structure for table e-learningv.subscribes
CREATE TABLE IF NOT EXISTS `subscribes` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table e-learningv.subscribes: ~7 rows (approximately)
/*!40000 ALTER TABLE `subscribes` DISABLE KEYS */;
INSERT INTO `subscribes` (`id`, `email`, `created_at`, `updated_at`) VALUES
	(22, 'elhoucineessanhaji@gmail.com', '2019-04-22 16:06:55', '2019-04-22 16:06:55'),
	(47, 'ennouri@gmail.com', '2019-04-23 10:12:07', '2019-04-23 10:12:07'),
	(48, 'elhoucineessanhaji1998@gmail.com', '2019-04-23 10:13:29', '2019-04-23 10:13:29'),
	(49, 'essoubaki@gmail.com', '2019-04-23 10:29:40', '2019-04-23 10:29:40'),
	(50, 'elhoucinesssanhaji1998@gmail.com', '2019-04-23 13:46:13', '2019-04-23 13:46:13'),
	(51, 'ayoub.salhi@gmail.com', '2019-05-01 15:36:24', '2019-05-01 15:36:24'),
	(52, 't.imad@gmail.com', '2019-06-11 19:40:25', '2019-06-11 19:40:25');
/*!40000 ALTER TABLE `subscribes` ENABLE KEYS */;

-- Dumping structure for table e-learningv.teacher_profiles
CREATE TABLE IF NOT EXISTS `teacher_profiles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '+212 641 966 888',
  `skype` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT 'skype.e-learning',
  `linkedin` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT 'https://www.linkedin.com/feed/',
  `facebook` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT 'https://www.facebook.com/',
  `twitter` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT 'https://twitter.com/',
  `youtube` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT 'https://www.youtube.com/',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table e-learningv.teacher_profiles: ~2 rows (approximately)
/*!40000 ALTER TABLE `teacher_profiles` DISABLE KEYS */;
INSERT INTO `teacher_profiles` (`id`, `user_id`, `category_id`, `description`, `slug`, `phone`, `skype`, `linkedin`, `facebook`, `twitter`, `youtube`, `created_at`, `updated_at`) VALUES
	(1, 11, 1, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ulla mco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.', 'teacher-teacher', '+212 641 966 888', 'skype.e-learning', 'https://www.linkedin.com/feed/', 'https://www.facebook.com/', 'https://twitter.com/', 'https://www.youtube.com/', '2019-04-18 10:17:20', '2019-04-18 10:46:18'),
	(2, 12, 1, 'ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt.', 'imad-teacher', '+212 641 966 888', 'skype.e-learning', 'https://www.linkedin.com/feed/', 'https://www.facebook.com/', 'https://twitter.com/', 'https://www.youtube.com/', '2019-05-21 14:37:51', '2019-05-27 15:32:50');
/*!40000 ALTER TABLE `teacher_profiles` ENABLE KEYS */;

-- Dumping structure for table e-learningv.teacher_rates
CREATE TABLE IF NOT EXISTS `teacher_rates` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `value` int(11) DEFAULT '3',
  `teacher_profile_id` int(11) DEFAULT NULL,
  `student_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table e-learningv.teacher_rates: ~2 rows (approximately)
/*!40000 ALTER TABLE `teacher_rates` DISABLE KEYS */;
INSERT INTO `teacher_rates` (`id`, `value`, `teacher_profile_id`, `student_id`, `created_at`, `updated_at`) VALUES
	(1, 3, 1, 2, '2019-04-24 08:30:21', '2019-04-24 08:30:21'),
	(2, 3, 1, 4, '2019-04-24 08:30:43', '2019-04-24 08:30:43');
/*!40000 ALTER TABLE `teacher_rates` ENABLE KEYS */;

-- Dumping structure for table e-learningv.translations
CREATE TABLE IF NOT EXISTS `translations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `table_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `column_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `foreign_key` int(10) unsigned NOT NULL,
  `locale` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `translations_table_name_column_name_foreign_key_locale_unique` (`table_name`,`column_name`,`foreign_key`,`locale`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table e-learningv.translations: ~30 rows (approximately)
/*!40000 ALTER TABLE `translations` DISABLE KEYS */;
INSERT INTO `translations` (`id`, `table_name`, `column_name`, `foreign_key`, `locale`, `value`, `created_at`, `updated_at`) VALUES
	(1, 'data_types', 'display_name_singular', 5, 'pt', 'Post', '2019-04-29 13:47:39', '2019-04-29 13:47:39'),
	(2, 'data_types', 'display_name_singular', 6, 'pt', 'Página', '2019-04-29 13:47:39', '2019-04-29 13:47:39'),
	(3, 'data_types', 'display_name_singular', 1, 'pt', 'Utilizador', '2019-04-29 13:47:39', '2019-04-29 13:47:39'),
	(4, 'data_types', 'display_name_singular', 4, 'pt', 'Categoria', '2019-04-29 13:47:39', '2019-04-29 13:47:39'),
	(5, 'data_types', 'display_name_singular', 2, 'pt', 'Menu', '2019-04-29 13:47:39', '2019-04-29 13:47:39'),
	(6, 'data_types', 'display_name_singular', 3, 'pt', 'Função', '2019-04-29 13:47:39', '2019-04-29 13:47:39'),
	(7, 'data_types', 'display_name_plural', 5, 'pt', 'Posts', '2019-04-29 13:47:39', '2019-04-29 13:47:39'),
	(8, 'data_types', 'display_name_plural', 6, 'pt', 'Páginas', '2019-04-29 13:47:39', '2019-04-29 13:47:39'),
	(9, 'data_types', 'display_name_plural', 1, 'pt', 'Utilizadores', '2019-04-29 13:47:39', '2019-04-29 13:47:39'),
	(10, 'data_types', 'display_name_plural', 4, 'pt', 'Categorias', '2019-04-29 13:47:39', '2019-04-29 13:47:39'),
	(11, 'data_types', 'display_name_plural', 2, 'pt', 'Menus', '2019-04-29 13:47:39', '2019-04-29 13:47:39'),
	(12, 'data_types', 'display_name_plural', 3, 'pt', 'Funções', '2019-04-29 13:47:39', '2019-04-29 13:47:39'),
	(13, 'categories', 'slug', 1, 'pt', 'categoria-1', '2019-04-29 13:47:39', '2019-04-29 13:47:39'),
	(14, 'categories', 'name', 1, 'pt', 'Categoria 1', '2019-04-29 13:47:39', '2019-04-29 13:47:39'),
	(15, 'categories', 'slug', 2, 'pt', 'categoria-2', '2019-04-29 13:47:39', '2019-04-29 13:47:39'),
	(16, 'categories', 'name', 2, 'pt', 'Categoria 2', '2019-04-29 13:47:39', '2019-04-29 13:47:39'),
	(17, 'pages', 'title', 1, 'pt', 'Olá Mundo', '2019-04-29 13:47:39', '2019-04-29 13:47:39'),
	(18, 'pages', 'slug', 1, 'pt', 'ola-mundo', '2019-04-29 13:47:39', '2019-04-29 13:47:39'),
	(19, 'pages', 'body', 1, 'pt', '<p>Olá Mundo. Scallywag grog swab Cat o\'nine tails scuttle rigging hardtack cable nipper Yellow Jack. Handsomely spirits knave lad killick landlubber or just lubber deadlights chantey pinnace crack Jennys tea cup. Provost long clothes black spot Yellow Jack bilged on her anchor league lateen sail case shot lee tackle.</p>\r\n<p>Ballast spirits fluke topmast me quarterdeck schooner landlubber or just lubber gabion belaying pin. Pinnace stern galleon starboard warp carouser to go on account dance the hempen jig jolly boat measured fer yer chains. Man-of-war fire in the hole nipperkin handsomely doubloon barkadeer Brethren of the Coast gibbet driver squiffy.</p>', '2019-04-29 13:47:39', '2019-04-29 13:47:39'),
	(20, 'menu_items', 'title', 1, 'pt', 'Painel de Controle', '2019-04-29 13:47:39', '2019-04-29 13:47:39'),
	(21, 'menu_items', 'title', 2, 'pt', 'Media', '2019-04-29 13:47:39', '2019-04-29 13:47:39'),
	(22, 'menu_items', 'title', 12, 'pt', 'Publicações', '2019-04-29 13:47:39', '2019-04-29 13:47:39'),
	(23, 'menu_items', 'title', 3, 'pt', 'Utilizadores', '2019-04-29 13:47:39', '2019-04-29 13:47:39'),
	(24, 'menu_items', 'title', 11, 'pt', 'Categorias', '2019-04-29 13:47:39', '2019-04-29 13:47:39'),
	(25, 'menu_items', 'title', 13, 'pt', 'Páginas', '2019-04-29 13:47:39', '2019-04-29 13:47:39'),
	(26, 'menu_items', 'title', 4, 'pt', 'Funções', '2019-04-29 13:47:39', '2019-04-29 13:47:39'),
	(27, 'menu_items', 'title', 5, 'pt', 'Ferramentas', '2019-04-29 13:47:39', '2019-04-29 13:47:39'),
	(28, 'menu_items', 'title', 6, 'pt', 'Menus', '2019-04-29 13:47:40', '2019-04-29 13:47:40'),
	(29, 'menu_items', 'title', 7, 'pt', 'Base de dados', '2019-04-29 13:47:40', '2019-04-29 13:47:40'),
	(30, 'menu_items', 'title', 10, 'pt', 'Configurações', '2019-04-29 13:47:40', '2019-04-29 13:47:40');
/*!40000 ALTER TABLE `translations` ENABLE KEYS */;

-- Dumping structure for table e-learningv.users
CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `role_id` bigint(20) unsigned DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `avatar` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT 'users/default.png',
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `settings` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`),
  KEY `users_role_id_foreign` (`role_id`),
  CONSTRAINT `users_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=64 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table e-learningv.users: ~60 rows (approximately)
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` (`id`, `role_id`, `name`, `email`, `avatar`, `email_verified_at`, `password`, `remember_token`, `settings`, `created_at`, `updated_at`) VALUES
	(1, 2, 'Imad Etudiant', 'imad@gmail.com', 'users/default.png', NULL, '$2y$10$fGY4P/Ksw83Envvdfp9pq.ZFNCRWNIoPqZSDvzbI4/qimS77LBg86', NULL, NULL, '2019-05-21 11:48:40', '2019-05-21 11:48:40'),
	(2, 2, 'Student Student', 'student@gmail.com', 'users\\April2019\\JaFUPeGWZO0kW0VYUtTm.jpg', NULL, '$2y$10$Ci3VCdvymeH3AJZqwrM8UOEcURE2BGQtjInFX/rJxuNdtsenJidDu', 'IxidBJisIIR8rUvtGGFkn21lETAk6Nkg86oO8Ahl6V3kKFrJbZ2ABphsGAJI', '{"locale":"en"}', '2019-04-29 13:55:51', '2019-04-30 15:09:25'),
	(3, 2, 'El houcine Es sanhaji', 'youneskmlsjjj@gmail.com', 'users/default.png', NULL, '$2y$10$dSLpWI2AlDQxayA.8tS6y.YBV1iTQLzPaVs5SLSBwy2LY.UDvLHIy', NULL, NULL, '2019-05-21 14:36:32', '2019-05-21 14:36:32'),
	(4, 2, 'Abdessad Etudiant', 'abdessamed@gmail.com', 'users/default.png', NULL, '$2y$10$egtNhBi4k6MoZ9PRZvqnnOKhvT1rurr4qHdzPVUuURAhB.imOd1H2', NULL, NULL, '2019-05-21 11:08:11', '2019-05-21 11:08:11'),
	(5, 2, 'Mohamed Etudiant', 'mohamed@gmail.com', 'users/default.png', NULL, '$2y$10$EW8gzMrYhl0cvisS5cbXMuSc74ASxYqPsghEVY9k41GXqPjNFeBu2', NULL, NULL, '2019-05-21 11:13:00', '2019-05-21 11:13:00'),
	(6, 2, 'Ismail Etudiant', 'ismail@gmail.com', 'users/default.png', NULL, '$2y$10$u6VmTjJK74YNC0D.Ka3O7u4VEThuH8qTCfFybTRWT3SgOiJl4bfhy', NULL, NULL, '2019-05-21 11:15:10', '2019-05-21 11:15:10'),
	(7, 2, 'Youness Etudiant', 'youness@gmail.com', 'users/default.png', NULL, '$2y$10$bZqOtXOjjhhkhffe19ZsS.KdpjkQO9OPetv.y2sa6Fxwz0wis98Ju', NULL, NULL, '2019-05-21 11:35:54', '2019-05-21 11:35:54'),
	(8, 2, 'Hamza Etudiant', 'hamza@gmail.com', 'users/default.png', NULL, '$2y$10$gbBFbIUGLXHUvCMU/ezwUeyJSKgJhte8zfkJ7F23c7EyegeNR5qYm', NULL, NULL, '2019-05-21 11:38:32', '2019-05-21 11:38:32'),
	(9, 2, 'Ayoube Etudiant', 'ayoube@gmail.com', 'users/default.png', NULL, '$2y$10$tYwi/sq1uSMwIFM2v8tK5OPEEI3vh8YFrFNk9Ucrs7yCAP1.FbkbG', NULL, NULL, '2019-05-21 11:41:09', '2019-05-21 11:41:09'),
	(10, 1, 'Admin', 'admin@admin.com', 'users\\May2019\\YTmDLQKkDC5ZCCYfx1ib.png', NULL, '$2y$10$Fuoq8Xx0axYlvSdWsx/2cOLVu5HnCx5FiDiERQJO9AdKC5SBEtyw2', '4WqeR292JgnCm341DCe7ntwZ5j9slTLjQxJ27yeL4i0EiFgorvxqF0OYIowy', '{"locale":"en"}', '2019-04-29 13:47:39', '2019-05-21 17:08:45'),
	(11, 3, 'Teacher Teacher', 'teacher@gmail.com', 'users\\April2019\\kUKQd5gPw3qrJbPBeNlQ.jpg', NULL, '$2y$10$H4ZCrnDQAWp85c/dV.zyVuIfNar3Ij33UziMjinj4a/h3eGtY0R/W', 'Vzz9jF2dhIAfLO7sA6tyXXZ9Of7n4ODmRGXdvHwbqpmbGfAtaJPKib7QnUXC', '{"locale":"en"}', '2019-04-29 13:56:50', '2019-04-30 15:08:54'),
	(12, 3, 'Imad Teacher', 't.imad@gmail.com', 'users/default.png', NULL, '$2y$10$KY82oBL/bzjFLllHsVDT7esgX.l6PyrXaKI4i5SE4E5rpa4KQELoK', 'WjvVMZgVWrXcYM7SkTvd24UuVK1AHq93RYGUSMoqvxsU6EVMnpXWpaN86GBu', NULL, '2019-05-21 14:37:51', '2019-05-21 14:37:51'),
	(16, 2, 'mquDPbRrt1', 's.mquDPbRrt1@gmail.com', 'users/default.png', NULL, '$2y$10$yF7PeeVxfc4dcDvzt/8vWuIlAioQiTIkFVI6jBOFmhcqWDWeS.t5y', NULL, NULL, '2019-05-23 00:16:18', '2019-05-23 00:16:18'),
	(17, 2, '6mHZUaQtRW', 's.6mHZUaQtRW@gmail.com', 'users/default.png', NULL, '$2y$10$Uab/hYZPbDQ.4W0fik3FY.rzqbrZgbp4pb8n4nVhxfjZY2XmNerZG', NULL, NULL, '2019-05-23 00:16:18', '2019-05-23 00:16:18'),
	(18, 2, '6NBbj4G8Pa', 's.6NBbj4G8Pa@gmail.com', 'users/default.png', NULL, '$2y$10$DvWqpqBzBxU69ILQhZzH2.8C2D/fJ9uZZ2fCqIuSM3c3qa2HHYIxC', NULL, NULL, '2019-05-23 00:16:18', '2019-05-23 00:16:18'),
	(19, 2, 'm09c1oSM7K', 's.m09c1oSM7K@gmail.com', 'users/default.png', NULL, '$2y$10$G3PYNuuvBhuWG8BgGjDWHutsB/PRbd7hvVJoXDhT3Ug90mAStrLBu', NULL, NULL, '2019-05-23 00:16:18', '2019-05-23 00:16:18'),
	(20, 2, 'UFrAlZ0hj5', 's.UFrAlZ0hj5@gmail.com', 'users/default.png', NULL, '$2y$10$rMsdOTcnDI3Sgj/tBi35CuxNVj9A.JeENbNgjcjRLI/bEnrDp4bb2', NULL, NULL, '2019-05-23 00:16:19', '2019-05-23 00:16:19'),
	(21, 2, 'I24hlPz0dw', 's.I24hlPz0dw@gmail.com', 'users/default.png', NULL, '$2y$10$fYGEtfJm.DTAsENX.6h20O.I2ZwPk2j1tZl9xiPTk5HgFJ.B2ImFK', NULL, NULL, '2019-05-23 00:16:19', '2019-05-23 00:16:19'),
	(22, 2, 'qSc37RXpLk', 's.qSc37RXpLk@gmail.com', 'users/default.png', NULL, '$2y$10$CqBwnSk3DX8h7TF3YTVN/OmS2dlleV9yQ2qzhAOZ3pKpuiNzqMpi.', NULL, NULL, '2019-05-23 00:16:19', '2019-05-23 00:16:19'),
	(23, 2, 'Z87SNAEpJY', 's.Z87SNAEpJY@gmail.com', 'users/default.png', NULL, '$2y$10$JxVx7L/A9x5Aq6.2pXeaWOxMQvPcjso7RVJ.CgY61rVTr0CF19KZa', NULL, NULL, '2019-05-23 00:16:19', '2019-05-23 00:16:19'),
	(24, 2, 'IE8m3V1Aa5', 's.IE8m3V1Aa5@gmail.com', 'users/default.png', NULL, '$2y$10$npa9dSupJPYXWt6iwS70belSi3XrN4PXINpGETqb.GP0VEx5P/Fpq', NULL, NULL, '2019-05-23 00:16:19', '2019-05-23 00:16:19'),
	(25, 2, 'bERclnMv4O', 's.bERclnMv4O@gmail.com', 'users/default.png', NULL, '$2y$10$nKCww3517BnFS6eZjvKEZ.VJiOoMZQ5Jmd1.t/Ng2wE4NoSuU6Ocy', NULL, NULL, '2019-05-23 00:16:19', '2019-05-23 00:16:19'),
	(26, 2, '3dzhqiGxfY', 's.3dzhqiGxfY@gmail.com', 'users/default.png', NULL, '$2y$10$gbPB0i4aUFudD4sJzXpvUO9jEh0FseszXw5wclmVpoK3rBV.SIYs.', NULL, NULL, '2019-05-23 00:16:19', '2019-05-23 00:16:19'),
	(27, 2, '2MVUXz6aiv', 's.2MVUXz6aiv@gmail.com', 'users/default.png', NULL, '$2y$10$p05KI1S/bbcTtWvCWV44peWUm/m/52DSjxVrZUaVphaBLHr70VfO2', NULL, NULL, '2019-05-23 00:16:20', '2019-05-23 00:16:20'),
	(28, 2, 'jtLNH8y4G3', 's.jtLNH8y4G3@gmail.com', 'users/default.png', NULL, '$2y$10$AvT1GUql3Oy3O/qvN4LohezU.yICwWUI3zBe1ybVBQR/kX4vHdiKm', NULL, NULL, '2019-05-23 00:33:08', '2019-05-23 00:33:08'),
	(29, 2, 'tZSr7PRMO3', 's.tZSr7PRMO3@gmail.com', 'users/default.png', NULL, '$2y$10$MHDgAP1WrGOBTwFZFSx14eI/9P1rC.hI6tG3fl2IZIkeT97MwbQ1y', NULL, NULL, '2019-05-23 00:33:08', '2019-05-23 00:33:08'),
	(30, 2, 'pKxd2JjlHW', 's.pKxd2JjlHW@gmail.com', 'users/default.png', NULL, '$2y$10$Qh9ITXzS/WjGiN6lHKO/PuIClIp2053dDJnmpFJ9pm0BaKNX2LmAy', NULL, NULL, '2019-05-23 00:33:08', '2019-05-23 00:33:08'),
	(31, 2, 'AH0B1b2ROt', 's.AH0B1b2ROt@gmail.com', 'users/default.png', NULL, '$2y$10$fdu757qAT2PzJcJeOeQjyuUocX0j9QaXqmbd6lX6elxFT4wtgxcUC', NULL, NULL, '2019-05-23 00:33:08', '2019-05-23 00:33:08'),
	(32, 2, 'wCuoLJfUm3', 's.wCuoLJfUm3@gmail.com', 'users/default.png', NULL, '$2y$10$Kr1lYf1YetpD.1qa0DDXHOsTO0E8lSvIZ8WIxY058zOKkxEo4n1T6', NULL, NULL, '2019-05-23 00:33:09', '2019-05-23 00:33:09'),
	(33, 2, 'cOHAbkl7Xd', 's.cOHAbkl7Xd@gmail.com', 'users/default.png', NULL, '$2y$10$KhMHHkaa89m6Tx6Iki8PAOFXdyVlkQ/j.uWRCAXCPYo5WkwSaq5ry', NULL, NULL, '2019-05-23 00:33:09', '2019-05-23 00:33:09'),
	(34, 2, 'zei9THUK3u', 's.zei9THUK3u@gmail.com', 'users/default.png', NULL, '$2y$10$5Bl38pUna7KoYQWHYsYx3uck0kI7689WKlA8P7kX3m7qUtqk0yV/O', NULL, NULL, '2019-05-23 00:33:09', '2019-05-23 00:33:09'),
	(35, 2, 'YsvxEjhgiJ', 's.YsvxEjhgiJ@gmail.com', 'users/default.png', NULL, '$2y$10$oI3vr806i54.qjogmbTDNeYrdT/yo6J3QbCze7kA5O0.B3k5s9DsW', NULL, NULL, '2019-05-23 00:33:09', '2019-05-23 00:33:09'),
	(36, 2, 'EP1nIjrDFS', 's.EP1nIjrDFS@gmail.com', 'users/default.png', NULL, '$2y$10$/jpc0mTddPFR8W5vpGtT.O6QsSSKMk15PfG30leinCyuCiqaKT852', NULL, NULL, '2019-05-23 00:33:09', '2019-05-23 00:33:09'),
	(37, 2, 'oyAiC6rO34', 's.oyAiC6rO34@gmail.com', 'users/default.png', NULL, '$2y$10$WXZqBQ1ndj6PhaGWeqqYGOZWEziZ4jWYA42outbp6sN4fe.pca6Hq', NULL, NULL, '2019-05-23 00:33:09', '2019-05-23 00:33:09'),
	(38, 2, '9pkULKzI3F', 's.9pkULKzI3F@gmail.com', 'users/default.png', NULL, '$2y$10$gY45BrpngG34BAoFLpaz6eOqjybTUKQqt76TKw2AJDUk7XXTa1vaS', NULL, NULL, '2019-05-23 00:33:10', '2019-05-23 00:33:10'),
	(39, 2, 'bUq5svOPB3', 's.bUq5svOPB3@gmail.com', 'users/default.png', NULL, '$2y$10$Q55FK2htj5ab.TuiWmOTDO7dYnAX813eFHAVqFb8UW5LI4vXeYKsi', NULL, NULL, '2019-05-23 00:33:10', '2019-05-23 00:33:10'),
	(40, 2, 'TuH7PxMyRw', 's.TuH7PxMyRw@gmail.com', 'users/default.png', NULL, '$2y$10$XJbx.NPm7oidq3aMUvqclOot6br0snQtaOJflDex5MCtKMxxC97hq', NULL, NULL, '2019-05-23 11:38:04', '2019-05-23 11:38:04'),
	(41, 2, 'tgaCOVHwzJ', 's.tgaCOVHwzJ@gmail.com', 'users/default.png', NULL, '$2y$10$JZz3T8n82v4W4GiqjjKO3uVKHZD8sNre46ZtVmPlQvIyIlnB1.B/e', NULL, NULL, '2019-05-23 11:38:05', '2019-05-23 11:38:05'),
	(42, 2, 'gXaevwL34V', 's.gXaevwL34V@gmail.com', 'users/default.png', NULL, '$2y$10$kQIofFZUbGYn5F4CjBk5bu4l5eFbUzQewKUX2WZvSAGPCM5/teiB.', NULL, NULL, '2019-05-23 11:38:05', '2019-05-23 11:38:05'),
	(43, 2, 'y4xVEq9nTo', 's.y4xVEq9nTo@gmail.com', 'users/default.png', NULL, '$2y$10$gBBS/FDB3BtEBdbazDhiOuZwX06G8P1q9jYaAroTfG2LiB5hYD3V6', NULL, NULL, '2019-05-23 11:38:05', '2019-05-23 11:38:05'),
	(44, 2, 'CmBSW8vHcG', 's.CmBSW8vHcG@gmail.com', 'users/default.png', NULL, '$2y$10$wwf3yFxqfnVcwaDIqLf5..wAYW/TLAC2wMTuyIWBhteJqrJ5dNn/S', NULL, NULL, '2019-05-23 11:38:05', '2019-05-23 11:38:05'),
	(45, 2, 'Kwglf0e1SW', 's.Kwglf0e1SW@gmail.com', 'users/default.png', NULL, '$2y$10$FA7b3scb4dFAML/pE21dm.HcnuHUvF5EuLVOgDv2Ul1oJwhs3zJJS', NULL, NULL, '2019-05-23 11:38:05', '2019-05-23 11:38:05'),
	(46, 2, '3lA6COGjVQ', 's.3lA6COGjVQ@gmail.com', 'users/default.png', NULL, '$2y$10$q5dpHd.ReBEdt3.i1N7VneviKAmrYuwHtTlifhN3YYNKGKvP6SQ3a', NULL, NULL, '2019-05-23 11:38:05', '2019-05-23 11:38:05'),
	(47, 2, 'sVB7ebO9mh', 's.sVB7ebO9mh@gmail.com', 'users/default.png', NULL, '$2y$10$ht/gpBLSxpYjGY33Ky1MK.1mvGGajvWi2E26NBhS3a7Jsq/1wJB4O', NULL, NULL, '2019-05-23 11:38:05', '2019-05-23 11:38:05'),
	(48, 2, '6iO4VathGx', 's.6iO4VathGx@gmail.com', 'users/default.png', NULL, '$2y$10$bfujDjKd2h1GczmLBuNIHO/KmuHxm1JaxNDGa38elNLpk5AgFumwy', NULL, NULL, '2019-05-23 11:38:05', '2019-05-23 11:38:05'),
	(49, 2, 'LK1JjIO0DT', 's.LK1JjIO0DT@gmail.com', 'users/default.png', NULL, '$2y$10$KQiFUeferSCxL5/IRmRwUOcwj1/5/iXZfVUPg9fv6NgL6vsUTk5eO', NULL, NULL, '2019-05-23 11:38:05', '2019-05-23 11:38:05'),
	(50, 2, 'GiPFwXsCM7', 's.GiPFwXsCM7@gmail.com', 'users/default.png', NULL, '$2y$10$0i/M5yYfYm2LN0crxgE6meX1kFKOUe27yi7rgaWJHoWe7KXf3Dpye', NULL, NULL, '2019-05-23 11:38:06', '2019-05-23 11:38:06'),
	(51, 2, 'We5pf4j2Qw', 's.We5pf4j2Qw@gmail.com', 'users/default.png', NULL, '$2y$10$zsLlmYKO1c6Ao2wC8.sBaOn3G.Sg5Pd4PnHOhpwih9sZTwgnBLR7y', NULL, NULL, '2019-05-23 11:38:06', '2019-05-23 11:38:06'),
	(52, 2, 'JH3CdMSisR', 's.JH3CdMSisR@gmail.com', 'users/default.png', NULL, '$2y$10$1MGJWi07zraaz.U5VFYqZu2OO4WPRQ0kklcpt1ZIrotHWi08CqOXW', NULL, NULL, '2019-05-29 14:34:52', '2019-05-29 14:34:52'),
	(53, 2, 'Aa35hYdijc', 's.Aa35hYdijc@gmail.com', 'users/default.png', NULL, '$2y$10$AJoinykxhwnOxP9ACOhf8O5tKXvrlBeTS5Y7ufgkBgnXvJPop2Ng.', NULL, NULL, '2019-05-29 14:34:52', '2019-05-29 14:34:52'),
	(54, 2, 'g0eB6rbqLo', 's.g0eB6rbqLo@gmail.com', 'users/default.png', NULL, '$2y$10$.zte18NXkPdzIXMlbodccuZ1ZuErlxzpS8tBnN3YSWn2A50AWO2bC', NULL, NULL, '2019-05-29 14:34:52', '2019-05-29 14:34:52'),
	(55, 2, 'SgqYDKQnXs', 's.SgqYDKQnXs@gmail.com', 'users/default.png', NULL, '$2y$10$Sc46.PEqxTQVZ00abdv...IDclOeDzbz2BzYFUoZgF8ZNrFkcQKMC', NULL, NULL, '2019-05-29 14:34:53', '2019-05-29 14:34:53'),
	(56, 2, 'Thw7qrD6fM', 's.Thw7qrD6fM@gmail.com', 'users/default.png', NULL, '$2y$10$t1IQKZIJixRRRN/vNbzjCOfZzRawzltiXd9Wi4y8373xqvd7sDTk6', NULL, NULL, '2019-05-29 14:34:53', '2019-05-29 14:34:53'),
	(57, 2, '7eMKaW1gqs', 's.7eMKaW1gqs@gmail.com', 'users/default.png', NULL, '$2y$10$Z2qoACTiXHzf.IDmKhRNleGmlHHyWXk2E8yMgq9Ix/9/hB/sFxE9K', NULL, NULL, '2019-05-29 14:34:53', '2019-05-29 14:34:53'),
	(58, 2, 'YFgZy6xbpw', 's.YFgZy6xbpw@gmail.com', 'users/default.png', NULL, '$2y$10$9Znjzfge3ML2woBtIHlYOeq5wJoOYbTUtENNpm4/jIjgFyKWmEtr6', NULL, NULL, '2019-05-29 14:34:53', '2019-05-29 14:34:53'),
	(59, 2, 's6Yo8lb5NL', 's.s6Yo8lb5NL@gmail.com', 'users/default.png', NULL, '$2y$10$bXI1FofIboF.rdnsoA6vk.mpxYIY7ZTrfX3ToiXDgBMkoGcHbQyF6', NULL, NULL, '2019-05-29 14:34:53', '2019-05-29 14:34:53'),
	(60, 2, 'li8gamqehb', 's.li8gamqehb@gmail.com', 'users/default.png', NULL, '$2y$10$gywKHFika3yYxxnDBtzajOwYXixBTxhKWuMlCVnLOw14e46C5nCkS', NULL, NULL, '2019-05-29 14:34:53', '2019-05-29 14:34:53'),
	(61, 2, 'XSYxo7jy0I', 's.XSYxo7jy0I@gmail.com', 'users/default.png', NULL, '$2y$10$00pG5U9Reci66sS.4k64auWdY0D2zPuGYMeQNafXlvOiOtLj8Dssq', NULL, NULL, '2019-05-29 14:34:53', '2019-05-29 14:34:53'),
	(62, 2, 'acLI5ipJF2', 's.acLI5ipJF2@gmail.com', 'users/default.png', NULL, '$2y$10$1WrQBDSXmUtmYkcPhMYUCO2NML6FhThgEzdBbU5QVI3nUf8aLT44O', NULL, NULL, '2019-05-29 14:34:54', '2019-05-29 14:34:54'),
	(63, 2, 'ZSCuBR4x23', 's.ZSCuBR4x23@gmail.com', 'users/default.png', NULL, '$2y$10$.fxOpZLUy9W7lrLz9dBKxee1hMkB2VLH64e.b.Hp0vCRYdadQIY/6', NULL, NULL, '2019-05-29 14:34:54', '2019-05-29 14:34:54');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;

-- Dumping structure for table e-learningv.user_roles
CREATE TABLE IF NOT EXISTS `user_roles` (
  `user_id` bigint(20) unsigned NOT NULL,
  `role_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`user_id`,`role_id`),
  KEY `user_roles_user_id_index` (`user_id`),
  KEY `user_roles_role_id_index` (`role_id`),
  CONSTRAINT `user_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE,
  CONSTRAINT `user_roles_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table e-learningv.user_roles: ~0 rows (approximately)
/*!40000 ALTER TABLE `user_roles` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_roles` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
