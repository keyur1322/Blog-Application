-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Apr 05, 2021 at 02:00 PM
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
  `image` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `category` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `short_description` varchar(500) COLLATE utf8mb4_unicode_ci NOT NULL,
  `long_description` varchar(700) COLLATE utf8mb4_unicode_ci NOT NULL,
  `published_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_C0155143A76ED395` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `blog`
--

INSERT INTO `blog` (`id`, `user_id`, `title`, `image`, `category`, `short_description`, `long_description`, `published_at`) VALUES
(3, 4, 'Engadget', 'img/91c9c0ddd91bf6ed2f3c07da295a00e3.jpg', 'technology', 'Engadget has expanded from a humble news organization into a leading global technology blog with millions of visitors onboard! Readers come to the blog for the latest reviews and news in entertainment, gaming, tech, and leave both satisfied & informed.', 'Engadget covers any information relating to the latest hardware and gadgets, to video games and NASA tech. The website posts trusted in-depth updates on the latest releases, so you’ll always know what’s best in the market. With a separate video section walking you through the features and how it looks, Engadget is a great blog for tech junkies!', '2021-02-18 10:37:42'),
(4, 3, 'CSIRO', 'img/f52f17084f25c5ab154242ff0d3a0215.jpg', 'science', 'The Commonwealth Scientific and Industrial Research Organisation (CSIRO) is Australia’s national science agency. Established in 1916, the CSIRO has invented everything from modern-day WiFi, Aerogard and even extended-wear contact lenses.', 'The Commonwealth Scientific and Industrial Research Organisation (CSIRO) is Australia’s national science agency. Established in 1916, the CSIRO has invented everything from modern-day WiFi, Aerogard and even extended-wear contact lenses. With such an innovative impact on both a national and global scale, it’s no surprise its blog is one of the most interesting scientific reads on the Internet. Covering a vast number of topics including farming, ocean studies, manufacturing and health, the CSIRO is a fantastic insight into some of the most fascinating scientific breakthroughs by Australian and international scientists.', '2021-03-31 10:41:06'),
(5, 3, 'HARVARD HEALTH BLOG', 'img/3703ac82c682e5cdca0ba35e171627c9.jpg', 'medical', 'This blog is part of Harvard Medical School’s family of publications and manages to answer questions most of us didn’t even think to ask.', 'This blog is part of Harvard Medical School’s family of publications and manages to answer questions most of us didn’t even think to ask. While topics are hard-hitting, don’t expect to find anything terribly obscure when scrolling through these posts.', '2021-03-31 10:42:23'),
(6, 3, 'Serious Eats', 'img/59336ba51058217ff8ebec4409892767.jpg', 'food', 'Well-tested interesting recipes, food science, techniques, equipment, and even food histories. Also has a highly-rated podcast hosted by founder Ed Levine.', 'Well-tested interesting recipes, food science, techniques, equipment, and even food histories. Also has a highly-rated podcast hosted by founder Ed Levine.Daily food magazine published by the founders of Apartment Therapy. Recipes, how-to, kitchen style, and shopping in an easy-to-navigate site.', '2021-03-31 10:43:30'),
(7, 3, 'DR KARL KRUSZELNICKI', 'img/119bc3ac99b4e7322d25ea63610f107b.jpg', 'technology', 'Featuring Kruszelnicki’s trademark humorous yet informative approach to science, this blog delves into some of the most complicated and frequently asked (but not so frequently answered in an accessible way) scientific questions.', 'Featuring Kruszelnicki’s trademark humorous yet informative approach to science, this blog delves into some of the most complicated and frequently asked (but not so frequently answered in an accessible way) scientific questions. From the beautiful act of vomiting to the overwhelming-grand ‘how many cells in a person?’, Kruszelnicki seeks to entertain and educate in a laidback and educational manner that young and old Australians alike will love. For more of Dr Karl, you can also check out his Twitter, and tweet him any of your burning scientific questions.', '2021-03-31 10:44:29'),
(8, 3, 'VACCINE DEVELOPMENT', 'img/38c38ef5412ad87c7a66ec439f631452.jpg', 'medical', 'As we interpret them today, vaccines are far from a novel concept. Vaccinae, a Latin word, is derived from vaccinus (of or relating to cows), based upon vacca, or cow. Vaccine arose to describe the cowpox material used for injections. The injection itself was called vaccination.', 'The New England Journal of Medicine suggested this could be a misnomer as the vaccine was likely derived from Horsepox1. Widely acclaimed as the mastermind for his discovery in 1796, Edward Jenner’s findings came 22 years after Benjamin Jesty inoculated his children in 1774 in Dorset, UK. There is earlier evidence dating back to the 1500s. As early as 200 BCE, the scabs of the infected were ground down and blown into the nostrils of people in China. \r\n\r\nThe fundamental scientific approach has remained the same throughout history: identify, isolate, dose, and trigger an immune response. What has changed is the identification methods instead of relying on the symptoms.', '2021-03-31 10:46:44');

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
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `comments`
--

INSERT INTO `comments` (`id`, `user_id`, `blog_id`, `comment`, `published_at`) VALUES
(3, 4, 8, 'Hii, i read this blog and it\'s too good and informative and i like to thank to the author for such a thoughtful and excellent blog.', '2021-03-31 10:48:52'),
(4, 3, 3, 'Hello, Admin...\r\nI am very interested to learn about new technology and new trends.\r\nIt seems to helpful to me for introduce with new technology.', '2021-03-31 11:17:32'),
(5, 5, 3, 'Hey,\r\nAre you there ?\r\nPlease, contact me him for create your own blog.\r\n', '2021-03-31 12:42:01'),
(7, 5, 7, 'Exactly Dear Author, Technology is the most important part of our life.', '2021-03-31 13:03:00'),
(8, 3, 6, 'Hello, I am admin. Thanks for your support.', '2021-04-01 08:06:48');

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
('DoctrineMigrations\\Version20210331100818', '2021-03-31 10:08:29', 2298),
('DoctrineMigrations\\Version20210331104045', '2021-03-31 10:40:55', 106);

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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `email`, `roles`, `password`, `name`) VALUES
(3, 'admin@gmail.com', '[\"ROLE_USER\"]', '$argon2id$v=19$m=65536,t=4,p=1$MENaQ3U0WFdLVXdYd0l2bA$bSU7AM/7hnTmYFCBSdllFkCu2bC7+O/wJT8VpKce0AQ', 'admin'),
(4, 'keyur@gmail.com', '[\"ROLE_USER\"]', '$argon2id$v=19$m=65536,t=4,p=1$eFFxSUN5RTE0VWtjaUJ5SA$NlneF466nzHWw3xZD7HimjhzMD++UEPQKuYl6fRJps0', 'keyur'),
(5, 'dhanraj@gmail.com', '[\"ROLE_USER\"]', '$argon2id$v=19$m=65536,t=4,p=1$Y2lOdVV0NUNwZEdaemlyVg$sFvAcno/MfgW93khGis72WSi0QH+Cr/FxBTB4E52HB4', 'dhanraj');

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
