-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 14, 2021 at 10:45 AM
-- Server version: 10.4.20-MariaDB
-- PHP Version: 8.0.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `fswd13_cr10_philipmahlberg_biglibrary`
--
CREATE DATABASE IF NOT EXISTS `fswd13_cr10_philipmahlberg_biglibrary` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `fswd13_cr10_philipmahlberg_biglibrary`;

-- --------------------------------------------------------

--
-- Table structure for table `author`
--

CREATE TABLE `author` (
  `id` int(10) UNSIGNED NOT NULL,
  `firstname` varchar(100) NOT NULL,
  `lastname` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `author`
--

INSERT INTO `author` (`id`, `firstname`, `lastname`) VALUES
(1, 'Makoto', 'Shinkai'),
(2, 'Joseph', 'Mercola'),
(3, 'Ronnie', 'Cummins'),
(4, 'James', 'Colquhoun'),
(5, 'Mark', 'Hyman'),
(6, 'Laurentine', 'Bosch'),
(7, 'Gosho', 'Aoyama'),
(8, 'Alligatoah', 'Lukas Strobel'),
(9, 'Esther', 'Graf'),
(10, 'Joanne', 'Rowling'),
(11, 'Philip', 'Mahlberg'),
(29, '1234', '1234');

-- --------------------------------------------------------

--
-- Table structure for table `biglibrary`
--

CREATE TABLE `biglibrary` (
  `FK_ISBN` varchar(255) NOT NULL,
  `FK_ID_author` int(10) UNSIGNED NOT NULL,
  `FK_ID_publisher` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `biglibrary`
--

INSERT INTO `biglibrary` (`FK_ISBN`, `FK_ID_author`, `FK_ID_publisher`) VALUES
('0062220845', 4, 5),
('0062220845', 5, 5),
('0062220845', 6, 5),
('1645020886', 2, 6),
('1645020886', 3, 6),
('1781809178', 2, 7),
('B014K2N5UU', 8, 2),
('B0788XQ1HM', 1, 4),
('B07DS3DJNQ', 11, 1),
('B07DY2M7Y2', 10, 3),
('B081Y3SVT1', 2, 7),
('B095LH5HLB', 7, 4),
('UNKN0WN', 8, 2),
('UNKN0WN', 9, 2);

-- --------------------------------------------------------

--
-- Table structure for table `library`
--

CREATE TABLE `library` (
  `ISBN` varchar(50) NOT NULL,
  `title` varchar(100) NOT NULL,
  `type` enum('Book','CD','DVD') DEFAULT 'Book',
  `short_description` text DEFAULT '',
  `author_first_name` varchar(100) DEFAULT NULL,
  `author_last_name` varchar(100) DEFAULT NULL,
  `publisher_name` varchar(100) DEFAULT NULL,
  `publisher_address` text DEFAULT NULL,
  `publish_date` date DEFAULT NULL,
  `status` enum('available','reserved') DEFAULT 'available',
  `image` varchar(255) DEFAULT 'default_image.jpg'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `library`
--

INSERT INTO `library` (`ISBN`, `title`, `type`, `short_description`, `author_first_name`, `author_last_name`, `publisher_name`, `publisher_address`, `publish_date`, `status`, `image`) VALUES
('0062220845', 'Hungry for Change', 'Book', 'Nutritional consultants and documentary filmmakers James Colquhoun and Laurentine ten Bosch have teamed up with the world’s leading experts in nutrition and natural medicine to create Hungry for Change—a groundbreaking documentary film and a practical, prescriptive companion volume to help you transform your eating habits and change your life.', 'James', 'Colquhoun', 'HarperOne', '195 Broadway, NYC', '2012-10-02', 'available', 'hungryforchange.jpg'),
('1234', '1234', 'Book', '1234', '1234', '1234', '1234', '1234', '2021-08-03', 'available', '61177dcc6698d.jpg'),
('1645020886', 'The Truth About Covid-19', 'Book', '[value-4]', 'Joseph', 'Mercola', 'Chelsea Green Publishing Co', '125 Parkway, London', '2021-04-29', 'available', 'truthcovid19.jpg'),
('1781809178', 'Fat for Fuel', 'Book', '[value-4]', 'Joseph', 'Mercola', 'Hay House Inc.', 'Suite 1200, NYC', '2018-12-31', 'available', 'fatforfuel.jpg'),
('B014K2N5UU', 'Musik ist keine Lösung', 'CD', '[value-4]', 'Lukas', 'Strobel', 'Trailerpark (Groove Attack)', 'Am Glockenturm, 14053 Berlin', '2015-11-27', 'available', 'musikistkeineloesung.jpg'),
('B0788XQ1HM', 'Your Name', 'DVD', '[value-4]', 'Makoto', 'Shinkai', 'KAZÉ Anime (AV Visionen)', 'Spreeufer 5, 10178 Berlin', '2018-05-18', 'available', 'yourname.jpg'),
('B07DS3DJNQ', 'Diätfrei abnehmen und mehr essen Gewicht verlieren mit dem Hinzufügprinzip', 'Book', '[value-4]', 'Philip', 'Mahlberg', 'Denk Dich Leicht e.U.', 'Haidengasse 5/3/10, 1230 Wien', '2018-06-23', 'available', 'diaetfreiabnehmen.jpg'),
('B07DY2M7Y2', 'Harry Potter: The Complete Collection', 'DVD', '[value-4]', 'Joanne', 'Rowling', 'Warner Bros (Universal Pictures)', 'Zieglergasse 10, 1070 Wien', '2018-09-06', 'available', 'harrypottercollection.jpg'),
('B081Y3SVT1', 'EMF*D: 5G, Wi-Fi & Cell Phones', 'Book', '[value-4]', 'Joseph', 'Mercola', 'Hay House Inc.', 'Suite 1200, NYC', '2020-02-18', 'available', 'emfd.jpg'),
('B095LH5HLB', 'Detective Conan Movie 24 - The Scarlet Bullet', 'DVD', '[value-4]', 'Gosho', 'Aoyama', 'KAZÉ Anime (AV Visionen)', 'Spreeufer 5, 10178 Berlin', '2021-12-02', 'reserved', 'dconanfilm24.jpg'),
('UNKN0WN', 'Mit dir schlafen [Explicit] Single', 'CD', '[value-4]', 'Lukas', 'Strobel', 'Trailerpark (Groove Attack)', 'Am Glockenturm, 14053 Berlin', '2021-06-25', 'available', 'mitdirschlafen.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `media`
--

CREATE TABLE `media` (
  `ISBN` varchar(255) NOT NULL,
  `title` varchar(100) NOT NULL,
  `type` enum('Book','CD','DVD') NOT NULL,
  `description` text DEFAULT NULL,
  `publishDate` date DEFAULT NULL,
  `image` varchar(255) DEFAULT 'default_image.jpg',
  `available` enum('available','reserved') DEFAULT 'available'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `media`
--

INSERT INTO `media` (`ISBN`, `title`, `type`, `description`, `publishDate`, `image`, `available`) VALUES
('0062220845', 'Hungry for Change', 'Book', 'Pioneers in the field of nutrition and internationally renowned filmmakers, James Colquhoun and Laurentine ten Bosch join with leading experts to offer proven strategies to lose weight, prevent and reverse disease, and optimize health.', '2012-10-02', 'hungryforchange.jpg', 'available'),
('1645020886', 'The Truth About Covid-19', 'Book', 'Since early 2020, the world has experienced a series of catastrophic eventsa global pandemic caused by what appears to be an engineered coronavirus; international lockdowns and border closings causing widespread business closures, economic collapse, and massive unemployment; and an unprecedented curtailment of civil liberties and freedoms in the name of keeping people safe by locking them up in their homes.', '2021-04-29', 'truthcovid19.jpg', 'available'),
('1781809178', 'Fat for Fuel', 'Book', 'In this ground-breaking guide, New York Times bestselling author and leading natural health practitioner Dr Joseph Mercola explains how nearly all disease - including cancer - is caused by defective metabolic processes. This astonishing truth could revolutionize our understanding of other diseases and show us a radical new path to optimal health.', '2018-12-31', 'fatforfuel.jpg', 'available'),
('B014K2N5UU', 'Musik ist keine Lösung', 'CD', 'Wie alle Menschen, die je gelebt haben, leben wir in turbulenten Zeiten. Die Krisenherde der Welt brodeln konstant und das Zusammenleben unserer Spezies auf diesem Planeten bleibt eine Herausforderung. \"Musik ist keine Lösung\" ist die These der ewigen Pessimisten. Die fragwürdigen Helden unserer Geschichte setzen alles daran, diese Provokation anzufechten. Ob es Ihnen gelingen wird..?!', '2015-11-27', 'musikistkeineloesung.jpg', 'available'),
('B0788XQ1HM', 'Your Name', 'DVD', 'In the fall of 2013, Mitsuha Miyamizu is a high school girl living in the rural town of Itomori in Japan. Bored of the town, she wishes to be a Tokyo boy in her next life. Her wish is partially granted as she inexplicably begins to switch bodies intermittently with Taki Tachibana, a high school boy in Tokyo, waking up as the other person and having to live through their activities and social interactions for the day.', '2018-05-18', 'yourname.jpg', 'available'),
('B07DS3DJNQ', 'Diätfrei abnehmen und mehr essen Gewicht verlieren mit dem Hinzufügprinzip', 'Book', 'Ein Buch, das dir \"schnell abnehmen\" verspricht? Das war gestern - nachhaltig und diätfrei abnehmen ohne Hunger und ohne Kalorien zählen beginnt JETZT mit dem Hinzufügprinzip.Denn die meisten Diäten haben einen strikten Plan mit viel Verzicht, viel Sport und einer Einkaufsliste, die ganze Enzyklopädien füllen kann.In diesem Buch erkläre ich dir, was du statt einer Diät machen kannst, um endlich abzunehmen, ohne dabei auf irgendetwas verzichten zu müssen.', '2018-06-23', 'diaetfreiabnehmen.jpg', 'available'),
('B07DY2M7Y2', 'Harry Potter: The Complete Collection', 'DVD', 'When Harry Potter learns on his eleventh birthday that he is, in fact, a wizard, he is quickly swept up into the spellbinding world of Hogwarts School of Witchcraft and Wizardry alongside new best friends, Ron Weasley and Hermione Granger. He soon discovers, though, that there is a much darker side to the wizarding world than any of them could have imagined. ', '2018-09-06', 'harrypottercollection.jpg', 'available'),
('B081Y3SVT1', 'EMF*D: 5G, Wi-Fi & Cell Phones', 'Book', 'The hazards of electronic pollution may once have been the stuff of science fiction, but now we know they\'re all too real. And with the advent of 5G ultra-wideband technology, the danger is greater than ever.', '2020-02-18', 'emfd.jpg', 'available'),
('B095LH5HLB', 'Detective Conan Movie 24 - The Scarlet Bullet', 'DVD', 'Japan is about to celebrate the world\'s largest sports festival, \"WSG-World Sports Games\", in Tokyo. In line with the opening ceremony, it is announced that the world\'s first \"Vacuum Superconducting Linear\" train, boasting a maximum speed of 1,000 km/h which combined all of Japan\'s technologies, will be opened to the public between Shin-Nagoya Station and Shibahama Station and established in Tokyo.', '2021-12-02', 'dconanfilm24.jpg', 'available'),
('UNKN0WN', 'Mit dir schlafen [Explicit] Single', 'CD', 'Alligatoah ist wieder da und im Gepäck hat er die pure Wahrheit. Seine brandneue frische Single \"Mit dir schlafen\" hat er am 25. Juni 2021 veröffentlicht. Mit auf die Scheibe hat sich die junge Esther Graf getraut.', '2021-06-25', 'mitdirschlafen.jpg', 'available');

-- --------------------------------------------------------

--
-- Table structure for table `publisher`
--

CREATE TABLE `publisher` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(100) NOT NULL,
  `address` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `publisher`
--

INSERT INTO `publisher` (`id`, `name`, `address`) VALUES
(1, 'Denk Dich Leicht e.U.', 'Haidengasse 5/3/10, 1230 Wien'),
(2, 'Trailerpark (Groove Attack)', 'Am Glockenturm, 14053 Berlin'),
(3, 'Warner Bros (Universal Pictures)', 'Zieglergasse 10, 1070 Wien'),
(4, 'KAZÉ Anime (AV Visionen)', 'Spreeufer 5, 10178 Berlin'),
(5, 'HarperOne', '195 Broadway, NYC'),
(6, 'Chelsea Green Publishing Co', '125 Parkway, London'),
(7, 'Hay House Inc.', 'Suite 1200, NYC'),
(25, '1234', '1234');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `author`
--
ALTER TABLE `author`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `biglibrary`
--
ALTER TABLE `biglibrary`
  ADD PRIMARY KEY (`FK_ISBN`,`FK_ID_publisher`,`FK_ID_author`),
  ADD KEY `FK_ID_author` (`FK_ID_author`),
  ADD KEY `FK_ID_publisher` (`FK_ID_publisher`);

--
-- Indexes for table `library`
--
ALTER TABLE `library`
  ADD PRIMARY KEY (`ISBN`);

--
-- Indexes for table `media`
--
ALTER TABLE `media`
  ADD PRIMARY KEY (`ISBN`);

--
-- Indexes for table `publisher`
--
ALTER TABLE `publisher`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `author`
--
ALTER TABLE `author`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `publisher`
--
ALTER TABLE `publisher`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `biglibrary`
--
ALTER TABLE `biglibrary`
  ADD CONSTRAINT `biglibrary_ibfk_1` FOREIGN KEY (`FK_ISBN`) REFERENCES `media` (`ISBN`) ON UPDATE CASCADE,
  ADD CONSTRAINT `biglibrary_ibfk_2` FOREIGN KEY (`FK_ID_author`) REFERENCES `author` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `biglibrary_ibfk_3` FOREIGN KEY (`FK_ID_publisher`) REFERENCES `publisher` (`id`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
