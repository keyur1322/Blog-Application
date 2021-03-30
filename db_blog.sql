-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Mar 30, 2021 at 01:31 PM
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
  `title` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `category` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `short_description` varchar(300) COLLATE utf8mb4_unicode_ci NOT NULL,
  `long_description` varchar(400) COLLATE utf8mb4_unicode_ci NOT NULL,
  `published_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `blog`
--

INSERT INTO `blog` (`id`, `title`, `image`, `category`, `short_description`, `long_description`, `published_at`) VALUES
(30, 'Tech World', 'img/39f9a3eb868ce8d9ec1556933ec815a5.jpg', 'technology', 'An original home for technology news and reviews, Engadget produces the internet\'s most compelling videos.', 'An original home for technology news and reviews, Engadget produces the internet\'s most compelling videos, reviews, features and breaking news about the people, products and ideas shaping our world.', '2021-03-30 12:41:23'),
(31, 'Medical World - WELL', 'img/a0e51e9d3c783c865491699815a01292.jpg', 'medical', 'Part of The New York Times, Well is a great resource for everything.', 'Part of The New York Times, Well is a great resource for everything, from the latest research about a particular type of exercise to navigating romantic relationships.', '2021-03-30 12:42:40'),
(32, 'Serious Eats', 'img/f66fcaa77b4cfb7e150d58e3683ad97e.jpg', 'food', 'Well-tested interesting recipes, food science, techniques, equipment, and even food histories.', 'Well-tested interesting recipes, food science, techniques, equipment, and even food histories. Also has a highly-rated podcast hosted by founder Ed Levine.', '2021-03-30 12:43:50'),
(33, 'Science World', 'img/5ee69a677830025ee0a51bb4ad5244ae.jpg', 'science', '. Entire scientific communities now connect through social media, and science blogs have prospered and grown into rich platforms of discourse.', 'Entire scientific communities now connect through social media, and science blogs have prospered and grown into rich platforms of discourse. On the Internet, experts and amateurs alike can come together to talk about the topics that interest them, and in doing so have created great educational spaces for anyone who wants to learn and discuss science.', '2021-03-30 12:45:35'),
(34, 'CSIRO', 'img/a71dd834496f21b767779649dc470843.jpg', 'technology', 'The Commonwealth Scientific and Industrial Research Organisation (CSIRO) is Australia’s national science agency.', 'Established in 1916, the CSIRO has invented everything from modern-day WiFi, Aerogard and even extended-wear contact lenses. With such an innovative impact on both a national and global scale, it’s no surprise its blog is one of the most interesting scientific reads on the Internet.', '2021-03-30 12:46:43');

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
('DoctrineMigrations\\Version20210325072517', '2021-03-25 07:25:40', 237),
('DoctrineMigrations\\Version20210325072834', '2021-03-25 07:28:42', 326),
('DoctrineMigrations\\Version20210325080454', '2021-03-25 08:04:59', 304),
('DoctrineMigrations\\Version20210325082835', '2021-03-25 08:28:40', 389),
('DoctrineMigrations\\Version20210330062539', '2021-03-30 06:25:54', 159),
('DoctrineMigrations\\Version20210330112011', '2021-03-30 11:21:03', 525);

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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `email`, `roles`, `password`, `name`) VALUES
(2, 'admin@gmail.com', '[\"ROLE_USER\"]', '$argon2id$v=19$m=65536,t=4,p=1$OE1oL0hZR21BTC5VZmpNZg$ZtEdC2VKLymkieqxQk60oosknBDjHnDAPJ1okbLZhSk', 'admin');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
