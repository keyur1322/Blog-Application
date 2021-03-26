-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Mar 26, 2021 at 07:21 AM
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
  `date` date NOT NULL,
  `image` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `category` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `short_description` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `long_description` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `blog`
--

INSERT INTO `blog` (`id`, `title`, `date`, `image`, `category`, `short_description`, `long_description`) VALUES
(3, 'Blog1', '2016-01-01', 'images/35a77a795266cfaf3f92c6dd37b8b725.jpg', 'technology', 'ShortBlog', 'LongBlog'),
(4, 'Blog2', '2017-01-01', 'images/a1c1c5ca075010768a387ef17b391451.jpg', 'medical', 'ShortBlog2', 'LongBlog2'),
(7, 'blog3', '2019-09-01', 'images/48b1ebad6704a1ecb82df50611f0712d.jpg', 'medical', 'ShortBlog3', 'ShortBlog3'),
(8, 'blog4', '2016-01-01', 'images/d65fa515f79d2d8686ce0cc7da95ee7a.jpg', 'technology', 'ShortBlog4', 'ShortBlog4'),
(9, 'blog3', '2016-01-01', 'images/0d44eb945a8d88f9a625138831d477a9.jpg', 'technology', 'ShortBlog4', 'ShortBlog4'),
(10, 'blog3', '2016-01-01', 'images/be57aa120ed118b68bead41fb0e1a52d.png', 'technology', 'ShortBlog3', 'ShortBlog4'),
(11, 'blog4', '2016-01-01', 'images/87577f8d3775e9cf52b617b7d865c6c8.jpg', 'technology', 'ShortBlog3', 'ShortBlog3');

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
('DoctrineMigrations\\Version20210325082835', '2021-03-25 08:28:40', 389);

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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `email`, `roles`, `password`, `name`) VALUES
(1, 'panchalkeyur1322@gmail.com', '[\"ROLE_USER\"]', '$argon2id$v=19$m=65536,t=4,p=1$Tk9oQ2psS0FENENMaFI3bw$b4m6zwk5V6A+jbHh3JD2YQS//Wfxs7pZeGFIDwO5AAE', 'Keyur Panchal');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
