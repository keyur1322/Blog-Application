-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: May 11, 2021 at 12:16 PM
-- Server version: 5.7.31
-- PHP Version: 7.3.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_blog`
--

-- --------------------------------------------------------

--
-- Table structure for table `blog`
--

DROP TABLE IF EXISTS `blog`;
CREATE TABLE IF NOT EXISTS `blog` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `title` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `shortdescription` varchar(500) COLLATE utf8mb4_unicode_ci NOT NULL,
  `longdescription` varchar(700) COLLATE utf8mb4_unicode_ci NOT NULL,
  `category` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `published_at` datetime NOT NULL,
  `image` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_C0155143A76ED395` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `blog`
--

INSERT INTO `blog` (`id`, `user_id`, `title`, `shortdescription`, `longdescription`, `category`, `published_at`, `image`) VALUES
(1, 3, 'CSIRO', 'The Commonwealth Scientific and Industrial Research Organisation (CSIRO) is Australia’s national science agency. Established in 1916, the CSIRO has invented everything from modern-day WiFi, Aerogard and even extended-wear contact lenses.\\r\\n', 'The Commonwealth Scientific and Industrial Research Organisation (CSIRO) is Australia’s national science agency. Established in 1916, the CSIRO has invented everything from modern-day WiFi, Aerogard and even extended-wear contact lenses. With such an innovative impact on both a national and global scale, it’s no surprise its blog is one of the most interesting scientific reads on the Internet. Covering a vast number of topics including farmings.\\r\\n', 'science', '2021-04-07 18:37:18', 'img/f52f17084f25c5ab154242ff0d3a0215.jpg'),
(2, 3, 'HARVARD HEALTH BLOG', 'This blog is part of Harvard Medical School’s family of publications and manages to answer questions most of us didn’t even think to ask.\\r\\n', 'This blog is part of Harvard Medical School’s family of publications and manages to answer questions most of us didn’t even think to ask. While topics are hard-hitting, don’t expect to find anything terribly obscure when scrolling through these posts.\\r\\n', 'medical', '2021-04-07 18:39:48', 'img/3703ac82c682e5cdca0ba35e171627c9.jpg'),
(3, 3, 'Serious Eats', 'Well-tested interesting recipes, food science, techniques, equipment, and even food histories. Also has a highly-rated podcast hosted by founder Ed Levine.\\r\\n', 'Well-tested interesting recipes, food science, techniques, equipment, and even food histories. Also has a highly-rated podcast hosted by founder Ed Levine.Daily food magazine published by the founders of Apartment Therapy. Recipes, how-to, kitchen style, and shopping in an easy-to-navigate site.\\r\\n', 'food', '2021-03-31 10:43:30', 'img/59336ba51058217ff8ebec4409892767.jpg'),
(4, 3, 'DR KARL KRUSZELNICKI', 'Featuring Kruszelnicki’s trademark humorous yet informative approach to science, this blog delves into some of the most complicated and frequently asked (but not so frequently answered in an accessible way) scientific questions.\\r\\n', 'Featuring Kruszelnicki’s trademark humorous yet informative approach to science, this blog delves into some of the most complicated and frequently asked (but not so frequently answered in an accessible way) scientific questions. From the beautiful act of vomiting to the overwhelming-grand ‘how many cells in a person?’, Kruszelnicki seeks to entertain and educate in a laidback and educational manner that young and old Australians alike will love.', 'technology', '2021-02-22 00:19:28', 'img/119bc3ac99b4e7322d25ea63610f107b123.jpg'),
(5, 3, 'VACCINES DEVELOPMENT', 'As we interpret them today, vaccines are far from a novel concept. Vaccinae, a Latin word, is derived from vaccinus (of or relating to cows), based upon vacca, or cow. Vaccine arose to describe the cowpox material used for injections. The injection itself was called vaccination.\\r\\n', 'The New England Journal of Medicine suggested this could be a misnomer as the vaccine was likely derived from Horsepox1. Widely acclaimed as the mastermind for his discovery in 1796, Edward Jenner’s findings came 22 years after Benjamin Jesty inoculated his children in 1774 in Dorset, UK. There is earlier evidence dating back to the 1500s. As early as 200 BCE, the scabs of the infected were ground down and blown into the nostrils of people in China. \\r\\n', 'medical', '2021-04-07 18:42:06', 'img/38c38ef5412ad87c7a66ec439f631452.jpg'),
(6, 7, 'ANNALS OF BOTANY BLOG', 'News and views on plant science and ecology, the blog is an offshoot of Annals of Botany, an online scientific, peer-reviewed journal that releases research once a month.', 'News and views on plant science and ecology, the blog is an offshoot of Annals of Botany, an online scientific, peer-reviewed journal that releases research once a month. This blog really gets into the nitty-gritty of plants, so its content is more suited to those who have a deep understanding and knowledge of botanical science.', 'science', '2021-05-11 11:26:41', 'img/7999db1584d41d33cf59963119eea3fc.png');

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

DROP TABLE IF EXISTS `comments`;
CREATE TABLE IF NOT EXISTS `comments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `blog_id` int(11) NOT NULL,
  `comment` varchar(500) COLLATE utf8mb4_unicode_ci NOT NULL,
  `published_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_5F9E962AA76ED395` (`user_id`),
  KEY `IDX_5F9E962ADAE07E97` (`blog_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `comments`
--

INSERT INTO `comments` (`id`, `user_id`, `blog_id`, `comment`, `published_at`) VALUES
(1, 3, 2, 'Hey, I am very interested in learning medical blogs.\r\nKeep learning and leep shining.\r\n', '2021-04-07 18:58:44'),
(2, 6, 5, 'Hey Author,\r\nMedical development is very necessary thingfor human. and vaccine development is the most important things now a days.', '2021-04-07 19:02:12'),
(3, 7, 3, 'Welcome to New World Mr. Admin.\r\nYour blogs are very awesome.', '2021-05-11 11:23:03'),
(4, 7, 6, 'Very famous topic of science.\r\nWe enjoyed a lot.\r\nThank you and read it.', '2021-05-11 11:27:26');

-- --------------------------------------------------------

--
-- Table structure for table `doctrine_migration_versions`
--

DROP TABLE IF EXISTS `doctrine_migration_versions`;
CREATE TABLE IF NOT EXISTS `doctrine_migration_versions` (
  `version` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `executed_at` datetime DEFAULT NULL,
  `execution_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `doctrine_migration_versions`
--

INSERT INTO `doctrine_migration_versions` (`version`, `executed_at`, `execution_time`) VALUES
('DoctrineMigrations\\Version20210407182231', '2021-04-07 18:22:54', 2451),
('DoctrineMigrations\\Version20210407183135', '2021-04-07 18:32:02', 417);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(180) COLLATE utf8mb4_unicode_ci NOT NULL,
  `roles` json NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_8D93D649E7927C74` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `email`, `roles`, `password`, `name`) VALUES
(3, 'admin@gmail.com', '[\"ROLE_USER\"]', '$argon2id$v=19$m=65536,t=4,p=1$MENaQ3U0WFdLVXdYd0l2bA$bSU7AM/7hnTmYFCBSdllFkCu2bC7+O/wJT8VpKce0AQ', 'admin'),
(4, 'keyur@gmail.com', '[\"ROLE_USER\"]', '$argon2id$v=19$m=65536,t=4,p=1$eFFxSUN5RTE0VWtjaUJ5SA$NlneF466nzHWw3xZD7HimjhzMD++UEPQKuYl6fRJps0', 'keyur'),
(5, 'dhanraj@gmail.com', '[\"ROLE_USER\"]', '$argon2id$v=19$m=65536,t=4,p=1$Y2lOdVV0NUNwZEdaemlyVg$sFvAcno/MfgW93khGis72WSi0QH+Cr/FxBTB4E52HB4', 'dhanraj'),
(6, 'akash@gmail.com', '[\"ROLE_USER\"]', '$argon2id$v=19$m=65536,t=4,p=1$TGpieEZDcnVUcGxxV1Z3Sw$kQpcyKzae9LRxJZF0NN6WRqaaDJON0zxsEKESNmPWtA', 'akash'),
(7, 'jay@gmail.com', '[\"ROLE_USER\"]', '$argon2id$v=19$m=65536,t=4,p=1$RUR4V2ZlN3dyYUR5cTl1bQ$S1IVz6rVpLAq0jwpc33K2I8JQhMTUVAr8+o2mWP9+cQ', 'jay panchal');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `blog`
--
ALTER TABLE `blog`
  ADD CONSTRAINT `FK_C0155143A76ED395` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Constraints for table `comments`
--
ALTER TABLE `comments`
  ADD CONSTRAINT `FK_5F9E962AA76ED395` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `FK_5F9E962ADAE07E97` FOREIGN KEY (`blog_id`) REFERENCES `blog` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
