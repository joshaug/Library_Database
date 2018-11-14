-- phpMyAdmin SQL Dump
-- version 4.5.2
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Apr 13, 2016 at 12:14 PM
-- Server version: 5.7.9
-- PHP Version: 5.6.16

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `library`
--

-- --------------------------------------------------------

--
-- Table structure for table `account`
--

DROP TABLE IF EXISTS `account`;
CREATE TABLE IF NOT EXISTS `account` (
  `fine_id` int(16) NOT NULL AUTO_INCREMENT,
  `loan_id` int(16) NOT NULL,
  `fine` decimal(4,0) NOT NULL DEFAULT '2',
  `paid` varchar(4) NOT NULL DEFAULT 'No',
  PRIMARY KEY (`fine_id`),
  KEY `loan_id` (`loan_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `account`
--

INSERT INTO `account` (`fine_id`, `loan_id`, `fine`, `paid`) VALUES
(3, 5, '2', 'No'),
(5, 6, '2', 'No'),
(6, 7, '2', 'No'),
(7, 8, '2', 'No'),
(8, 11, '2', 'No');

--
-- Triggers `account`
--
DROP TRIGGER IF EXISTS `latebook`;
DELIMITER $$
CREATE TRIGGER `latebook` AFTER INSERT ON `account` FOR EACH ROW UPDATE loans SET late = 'yes' 
WHERE loans.loan_id = NEW.loan_id
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `author`
--

DROP TABLE IF EXISTS `author`;
CREATE TABLE IF NOT EXISTS `author` (
  `author_id` int(16) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  PRIMARY KEY (`author_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `author`
--

INSERT INTO `author` (`author_id`, `name`) VALUES
(1, 'tom brown'),
(2, 'tom jackson'),
(3, 'bob molony'),
(4, 'tom james'),
(5, 'david dickson'),
(6, 'lisa smith'),
(7, 'lisa bender'),
(8, 'peter pervis');

-- --------------------------------------------------------

--
-- Table structure for table `book`
--

DROP TABLE IF EXISTS `book`;
CREATE TABLE IF NOT EXISTS `book` (
  `book_id` int(16) NOT NULL AUTO_INCREMENT,
  `title` varchar(256) NOT NULL,
  `publisher` varchar(64) NOT NULL,
  `author_id` int(16) NOT NULL,
  `on_loan` varchar(4) NOT NULL DEFAULT 'No',
  PRIMARY KEY (`book_id`),
  KEY `publisher` (`publisher`),
  KEY `author` (`author_id`)
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `book`
--

INSERT INTO `book` (`book_id`, `title`, `publisher`, `author_id`, `on_loan`) VALUES
(1, 'How to Cook', 'penguin', 1, 'yes'),
(2, 'how to cook better', 'penguin', 1, 'No'),
(10, 'hell', 'penguin', 1, 'No'),
(11, 'bones jones', 'cape', 1, 'No'),
(12, 'landing james', 'cape', 2, 'yes'),
(13, 'heaven', 'orion', 2, 'yes'),
(14, 'the thing', 'cape', 2, 'yes'),
(15, 'from there', 'penguin', 3, 'No'),
(16, 'not here', 'cape', 1, 'yes'),
(17, 'here we go', 'cape', 7, 'No'),
(38, 'there we go', 'cape', 7, 'No'),
(39, 'Blackberry Winter: My Earlier Years', 'penguin', 2, 'No'),
(40, 'there we go', 'cape', 1, 'yes'),
(41, 'Little Girl', 'cape', 5, 'No'),
(48, 'hello', 'oxford', 5, 'yes'),
(49, 'huck finn', 'penguin', 7, 'No'),
(50, 'gone girl', 'cape', 6, 'No'),
(51, 'the client', 'penguin', 8, 'yes'),
(52, 'born free', 'orion', 1, 'No');

-- --------------------------------------------------------

--
-- Table structure for table `loans`
--

DROP TABLE IF EXISTS `loans`;
CREATE TABLE IF NOT EXISTS `loans` (
  `loan_id` int(16) NOT NULL AUTO_INCREMENT,
  `member_id` int(16) NOT NULL,
  `book_id` int(16) NOT NULL,
  `date_out` date NOT NULL,
  `date_due` date NOT NULL,
  `late` varchar(4) NOT NULL DEFAULT 'No',
  `returned` varchar(4) NOT NULL DEFAULT 'no',
  PRIMARY KEY (`loan_id`),
  KEY `member_id` (`member_id`),
  KEY `book_id` (`book_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `loans`
--

INSERT INTO `loans` (`loan_id`, `member_id`, `book_id`, `date_out`, `date_due`, `late`, `returned`) VALUES
(5, 2, 12, '2016-04-05', '2016-04-19', 'No', 'no'),
(6, 5, 1, '2016-04-01', '2016-04-15', 'yes', 'no'),
(7, 5, 16, '2016-04-01', '2016-04-08', 'yes', 'no'),
(8, 6, 51, '2016-04-08', '2016-04-15', 'yes', 'no'),
(9, 3, 40, '2016-04-19', '2016-04-27', 'No', 'no'),
(10, 4, 48, '2016-04-27', '2016-04-28', 'No', 'no'),
(11, 5, 13, '2016-04-01', '2016-04-15', 'yes', 'no'),
(12, 6, 14, '2016-04-02', '2016-04-23', 'No', 'no');

--
-- Triggers `loans`
--
DROP TRIGGER IF EXISTS `bookout`;
DELIMITER $$
CREATE TRIGGER `bookout` AFTER INSERT ON `loans` FOR EACH ROW UPDATE book SET on_loan = 'yes' 
WHERE book_id = NEW.book_id
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `member`
--

DROP TABLE IF EXISTS `member`;
CREATE TABLE IF NOT EXISTS `member` (
  `member_id` int(16) NOT NULL AUTO_INCREMENT,
  `name` varchar(16) NOT NULL,
  `address` varchar(64) NOT NULL,
  `phone` int(16) NOT NULL,
  PRIMARY KEY (`member_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `member`
--

INSERT INTO `member` (`member_id`, `name`, `address`, `phone`) VALUES
(1, 'tom jones', '34 wales road cardiff', 4563636),
(2, 'bob jones', '37 oconnell st limerick', 9565736),
(3, 'tom james', '34 wales road cardiff', 3563466),
(4, 'david jones', '34 mountain st cardiff', 25635776),
(5, 'lisa smith', '355 hyde road limerick', 86553636),
(6, 'lisa rocket', '675 belview  dublin', 4564636),
(7, 'peter parker', '378 wales road cardiff', 4380636);

-- --------------------------------------------------------

--
-- Table structure for table `publisher`
--

DROP TABLE IF EXISTS `publisher`;
CREATE TABLE IF NOT EXISTS `publisher` (
  `name` varchar(16) NOT NULL,
  `address` varchar(64) NOT NULL,
  `phone` int(16) NOT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `publisher`
--

INSERT INTO `publisher` (`name`, `address`, `phone`) VALUES
('bloomsbury', '56 the creasent  Dublin 4', 12453566),
('cape', '45 Belmount cork', 454678658),
('orion', '678 rodeo drive new york', 755857464),
('oxford', '45 davidston Cheshire england', 24525325),
('penguin', '1 london road', 1234567);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `account`
--
ALTER TABLE `account`
  ADD CONSTRAINT `account_ibfk_1` FOREIGN KEY (`loan_id`) REFERENCES `loans` (`loan_id`);

--
-- Constraints for table `book`
--
ALTER TABLE `book`
  ADD CONSTRAINT `book_ibfk_2` FOREIGN KEY (`author_id`) REFERENCES `author` (`author_id`),
  ADD CONSTRAINT `book_ibfk_3` FOREIGN KEY (`publisher`) REFERENCES `publisher` (`name`);

--
-- Constraints for table `loans`
--
ALTER TABLE `loans`
  ADD CONSTRAINT `loans_ibfk_1` FOREIGN KEY (`member_id`) REFERENCES `member` (`member_id`),
  ADD CONSTRAINT `loans_ibfk_2` FOREIGN KEY (`book_id`) REFERENCES `book` (`book_id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
