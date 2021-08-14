-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 14, 2021 at 03:15 PM
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
('0062220845', 'Hungry for Change', 'Book', 'Nutritional consultants and documentary filmmakers James Colquhoun and Laurentine ten Bosch have teamed up with the world’s leading experts in nutrition and natural medicine to create Hungry for Change—a groundbreaking documentary film and a practical, prescriptive companion volume to help you transform your eating habits and change your life.', 'James', 'Colquhoun', 'HarperOne', '195 Broadway, NYC', '2012-10-02', 'available', '6117bd67e425c.jpg'),
('1234', '1234', 'Book', '1234', '1234', '1234', '1234', '1234', '2021-09-02', 'available', 'default_image.jpg'),
('1645020886', 'The Truth About Covid-19', 'Book', 'Since early 2020, the world has experienced a series of catastrophic eventsa global pandemic caused by what appears to be an engineered coronavirus; international lockdowns and border closings causing widespread business closures, economic collapse, and massive unemployment; and an unprecedented curtailment of civil liberties and freedoms in the name of keeping people safe by locking them up in their homes.', 'Joseph', 'Mercola', 'Chelsea Green Publishing Co', '125 Parkway, London', '2021-04-29', 'available', 'truthcovid19.jpg'),
('1781809178', 'Fat for Fuel', 'Book', 'For over a century, we’ve accepted the scientific consensus that cancer results from genetic disease due to chromosomal damage in cell nuclei. But what if cancer isn’t a genetic disease after all? What if scientists are chasing a flawed paradigm, and cancer isn’t a disease of damaged DNA but rather of defective metabolism as a result of mitochondrial dysfunction?', 'Joseph', 'Mercola', 'Hay House Inc.', 'Suite 1200, NYC', '2018-12-31', 'available', 'fatforfuel.jpg'),
('B014K2N5UU', 'Musik ist keine Lösung', 'CD', 'Wie alle Menschen, die je gelebt haben, leben wir in turbulenten Zeiten. Die Krisenherde der Welt brodeln konstant und das Zusammenleben unserer Spezies auf diesem Planeten bleibt eine Herausforderung. \"Musik ist keine Lösung\" ist die These der ewigen Pessimisten. Die fragwürdigen Helden unserer Geschichte setzen alles daran, diese Provokation anzufechten. Ob es Ihnen gelingen wird..?!', 'Lukas', 'Strobel', 'Trailerpark (Groove Attack)', 'Am Glockenturm, 14053 Berlin', '2015-11-27', 'available', 'musikistkeineloesung.jpg'),
('B0788XQ1HM', 'Your Name', 'DVD', 'In the fall of 2013, Mitsuha Miyamizu is a high school girl living in the rural town of Itomori in Japan. Bored of the town, she wishes to be a Tokyo boy in her next life. Her wish is partially granted as she inexplicably begins to switch bodies intermittently with Taki Tachibana, a high school boy in Tokyo, waking up as the other person and having to live through their activities and social interactions for the day. ', 'Makoto', 'Shinkai', 'KAZÉ Anime (AV Visionen)', 'Spreeufer 5, 10178 Berlin', '2018-05-18', 'reserved', 'yourname.jpg'),
('B07DS3DJNQ', 'Diätfrei abnehmen und mehr essen Gewicht verlieren mit dem Hinzufügprinzip', 'Book', 'Wenn du dir immer schon gewunschen hast, dein Traumgewicht zu erreichen, und das vollkommen OHNE Verzicht, Hunger und viel Zeitaufwand, dann kann dieses Buch das wichtigste sein, dass du dieses Jahr lesen wirst!   Denn du erfährst in diesem Buch warum: Schon zahlreiche Menschen endlich langfristig und ohne Jojo-Effekt diätfrei abnehmen! Und mit der richtigen Information und Anleitung kannst du das auch!​', 'Philip', 'Mahlberg', 'Denk Dich Leicht e.U.', 'Haidengasse 5/3/10, 1230 Wien', '2018-06-23', 'available', 'diaetfreiabnehmen.jpg'),
('B07DY2M7Y2', 'Harry Potter: The Complete Collection', 'DVD', 'When Harry Potter learns on his eleventh birthday that he is, in fact, a wizard, he is quickly swept up into the spellbinding world of Hogwarts School of Witchcraft and Wizardry alongside new best friends, Ron Weasley and Hermione Granger. He soon discovers, though, that there is a much darker side to the wizarding world than any of them could have imagined. ', 'Joanne', 'Rowling', 'Warner Bros (Universal Pictures)', 'Zieglergasse 10, 1070 Wien', '2018-09-06', 'available', 'harrypottercollection.jpg'),
('B081Y3SVT1', 'EMF*D: 5G, Wi-Fi & Cell Phones', 'Book', 'The hazards of electronic pollution may once have been the stuff of science fiction, but now we know they\'re all too real. And with the advent of 5G ultra-wideband technology, the danger is greater than ever.\r\nDr. Joseph Mercola, one of the world\'s foremost authorities on alternative health, has mined the scientific literature to offer a radical new understanding of how electromagnetic fields impact your body and mind.', 'Joseph', 'Mercola', 'Hay House Inc.', 'Suite 1200, NYC', '2020-02-18', 'available', 'emfd.jpg'),
('B095LH5HLB', 'Detective Conan Movie 24 - The Scarlet Bullet', 'DVD', 'Japan is about to celebrate the world\'s largest sports festival, \"WSG-World Sports Games\", in Tokyo. In line with the opening ceremony, it is announced that the world\'s first \"Vacuum Superconducting Linear\" train, boasting a maximum speed of 1,000 km/h which combined all of Japan\'s technologies, will be opened to the public between Shin-Nagoya Station and Shibahama Station and established in Tokyo. As the world\'s attention is garnered, an incident occurs at a party venue where famous tournament sponsors are gathered, leading to an abnormal situation where top dogs of companies are kidnapped one after another. Behind the scenes are Shuichi Akai who monitors the incident, and the FBI who waits for orders from Akai.', 'Gosho', 'Aoyama', 'KAZÉ Anime (AV Visionen)', 'Spreeufer 5, 10178 Berlin', '2021-12-02', 'available', 'dconanfilm24.jpg'),
('UNKN0WN', 'Mit dir schlafen [Explicit] Single', 'CD', 'In „Mit dir schlafen“ geht [es] um Schüchternheit, Einfühlsamkeit und offene Kommunikation. Es geht darum, dass es beide Parteien wollen, da Konsens das wichtigste ist.', 'Lukas', 'Strobel', 'Trailerpark (Groove Attack)', 'Am Glockenturm, 14053 Berlin', '2021-06-25', 'available', 'mitdirschlafen.jpg');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `library`
--
ALTER TABLE `library`
  ADD PRIMARY KEY (`ISBN`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
