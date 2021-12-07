-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Dec 07, 2021 at 04:46 AM
-- Server version: 8.0.21
-- PHP Version: 7.3.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `suburbanoutfitters`
--

-- --------------------------------------------------------

--
-- Table structure for table `campaign`
--

DROP TABLE IF EXISTS `campaign`;
CREATE TABLE IF NOT EXISTS `campaign` (
  `camp_id` int NOT NULL AUTO_INCREMENT,
  `camp_name` varchar(128) NOT NULL,
  `promo_percent` float NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `prod_id` int NOT NULL,
  PRIMARY KEY (`camp_id`),
  KEY `prod_id` (`prod_id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `campaign`
--

INSERT INTO `campaign` (`camp_id`, `camp_name`, `promo_percent`, `start_date`, `end_date`, `prod_id`) VALUES
(1, 'Dark-wash-promo!', 0.2, '2021-05-16', '2021-05-23', 46),
(2, 'Winter-inventory-clearance', 0.5, '2021-08-21', '2021-08-21', 36),
(3, 'Black-tank-staples', 0.1, '2021-01-10', '2021-06-29', 27),
(4, 'Gear-up-for-winter', 0.1, '2021-04-16', '2021-09-05', 39),
(5, 'New-grad-specials', 0.3, '2021-03-15', '2021-11-23', 10);

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
CREATE TABLE IF NOT EXISTS `customer` (
  `cust_id` int NOT NULL AUTO_INCREMENT,
  `f_name` varchar(128) NOT NULL,
  `l_name` varchar(128) NOT NULL,
  `cust_address` varchar(128) NOT NULL,
  `cust_city` varchar(50) NOT NULL,
  `cust_state` varchar(2) NOT NULL,
  PRIMARY KEY (`cust_id`)
) ENGINE=MyISAM AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`cust_id`, `f_name`, `l_name`, `cust_address`, `cust_city`, `cust_state`) VALUES
(1, 'Seline', 'Danev', '997 Talisman Park', 'Columbia', 'SC'),
(2, 'Cirstoforo', 'Halsho', '305 3rd Lane', 'Los Angeles', 'CA'),
(3, 'Josefina', 'Christal', '5 Prairieview Alley', 'Pittsburgh', 'PA'),
(4, 'Mallory', 'Silberschatz', '39 International Court', 'El Paso', 'TX'),
(5, 'Ginni', 'Veschi', '99363 Springview Circle', 'Chicago', 'IL'),
(6, 'Theressa', 'Kobelt', '53 Prentice Crossing', 'Macon', 'GA'),
(7, 'Demetra', 'Haddock', '37 Farragut Plaza', 'Milwaukee', 'WI'),
(8, 'Salvidor', 'Burkhill', '62297 Jana Hill', 'Oakland', 'CA'),
(9, 'Alden', 'Pentecost', '5241 Bay Place', 'Sarasota', 'FL'),
(10, 'Bridie', 'Fitzharris', '2425 Monument Terrace', 'Champaign', 'IL'),
(11, 'Florrie', 'Borkin', '391 Sunbrook Parkway', 'North Hollywood', 'CA'),
(12, 'Tiena', 'Scorthorne', '11 Graedel Street', 'Baltimore', 'MD'),
(13, 'Collen', 'Gidman', '75548 Gulseth Pass', 'Saint Paul', 'MN'),
(14, 'Chiquia', 'O\' Scallan', '137 Forster Trail', 'Chattanooga', 'TN'),
(15, 'Sally', 'Spittall', '6073 Sutherland Trail', 'Seattle', 'WA'),
(16, 'Leodora', 'Giacopetti', '42 Redwing Alley', 'South Bend', 'IN'),
(17, 'Lulu', 'Parlett', '3021 Shopko Parkway', 'Detroit', 'MI'),
(18, 'Osmond', 'Hepher', '6519 Raven Alley', 'Kansas City', 'MO'),
(19, 'Stewart', 'Baack', '3 Jenifer Park', 'Tallahassee', 'FL'),
(20, 'Raquela', 'Nigh', '773 Knutson Junction', 'Durham', 'NC');

-- --------------------------------------------------------

--
-- Table structure for table `cust_order`
--

DROP TABLE IF EXISTS `cust_order`;
CREATE TABLE IF NOT EXISTS `cust_order` (
  `order_id` int NOT NULL AUTO_INCREMENT,
  `emp_id` int NOT NULL,
  `cust_id` int NOT NULL,
  `store_id` int NOT NULL,
  `order_date` date NOT NULL,
  `order_total` float DEFAULT NULL,
  PRIMARY KEY (`order_id`),
  KEY `emp_id` (`emp_id`),
  KEY `cust_id` (`cust_id`),
  KEY `store_id` (`store_id`)
) ENGINE=MyISAM AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `cust_order`
--

INSERT INTO `cust_order` (`order_id`, `emp_id`, `cust_id`, `store_id`, `order_date`, `order_total`) VALUES
(2, 5, 12, 2, '2021-01-17', 1649),
(3, 4, 10, 1, '2021-01-25', 1080),
(4, 1, 6, 1, '2021-01-29', 1270),
(5, 7, 6, 1, '2021-02-07', 935),
(6, 8, 19, 2, '2021-02-09', 850),
(7, 6, 2, 3, '2021-02-11', 615),
(8, 2, 5, 2, '2021-02-20', 940),
(9, 3, 6, 3, '2021-02-20', 555),
(10, 5, 8, 2, '2021-02-27', 880),
(11, 5, 2, 2, '2021-03-05', 1220),
(12, 3, 6, 3, '2021-03-08', 785),
(13, 2, 13, 2, '2021-03-14', 810),
(14, 6, 3, 3, '2021-03-23', 1230),
(15, 7, 2, 1, '2021-03-24', 1534),
(16, 9, 10, 3, '2021-04-03', 1560),
(17, 4, 19, 1, '2021-04-05', 920),
(18, 8, 20, 2, '2021-04-08', 850),
(19, 5, 13, 2, '2021-05-05', 970),
(20, 8, 19, 2, '2021-05-24', 645),
(21, 6, 9, 3, '2021-05-26', 734),
(22, 4, 3, 1, '2021-05-29', 900),
(23, 6, 14, 3, '2021-05-31', 698),
(24, 8, 15, 2, '2021-06-01', 980),
(25, 2, 10, 2, '2021-06-02', 1263),
(26, 5, 2, 2, '2021-06-02', 655),
(27, 3, 5, 3, '2021-06-04', 1565),
(28, 5, 18, 2, '2021-06-04', 1005),
(29, 8, 9, 2, '2021-06-07', 1070),
(30, 8, 7, 2, '2021-06-27', 1130),
(31, 9, 4, 3, '2021-07-02', 1100),
(32, 1, 5, 1, '2021-07-13', 435),
(33, 5, 9, 2, '2021-07-15', 970),
(34, 5, 8, 2, '2021-07-18', 1415),
(35, 7, 17, 1, '2021-07-22', 720),
(36, 1, 3, 1, '2021-08-01', 1060),
(37, 3, 19, 3, '2021-08-08', 720),
(38, 3, 15, 3, '2021-08-13', 1170),
(39, 2, 12, 2, '2021-08-24', 625),
(40, 6, 12, 3, '2021-09-12', 710),
(41, 8, 8, 2, '2021-09-23', 550),
(42, 3, 1, 3, '2021-10-02', 885),
(43, 5, 7, 2, '2021-10-06', 1100),
(44, 5, 13, 2, '2021-10-15', 1470),
(45, 4, 16, 1, '2021-10-18', 1230),
(46, 8, 2, 2, '2021-10-24', 1095),
(47, 9, 13, 3, '2021-10-31', 585),
(48, 5, 3, 2, '2021-11-01', 1195),
(49, 3, 19, 3, '2021-11-09', 340),
(50, 5, 16, 2, '2021-12-02', 890),
(1, 5, 6, 2, '2021-01-15', 510);

-- --------------------------------------------------------

--
-- Table structure for table `cust_return`
--

DROP TABLE IF EXISTS `cust_return`;
CREATE TABLE IF NOT EXISTS `cust_return` (
  `return_id` int NOT NULL AUTO_INCREMENT,
  `return_date` date DEFAULT NULL,
  `quantity` int DEFAULT NULL,
  `line_id` int NOT NULL,
  `return_total` float DEFAULT NULL,
  PRIMARY KEY (`return_id`),
  KEY `line_id` (`line_id`)
) ENGINE=MyISAM AUTO_INCREMENT=91 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `cust_return`
--

INSERT INTO `cust_return` (`return_id`, `return_date`, `quantity`, `line_id`, `return_total`) VALUES
(61, '2021-09-04', 1, 189, 100),
(62, '2021-01-28', 1, 53, 150),
(63, '2021-06-08', 3, 226, 75),
(64, '2021-10-19', 3, 44, 270),
(65, '2021-02-04', 3, 202, 900),
(66, '2021-06-29', 2, 130, 120),
(67, '2021-04-06', 3, 66, 300),
(68, '2021-07-27', 2, 85, 70),
(69, '2021-05-31', 1, 171, 40),
(70, '2021-01-18', 1, 201, 25),
(71, '2021-08-27', 1, 189, 100),
(72, '2021-06-30', 3, 230, 300),
(73, '2021-02-24', 1, 108, 40),
(74, '2021-04-08', 3, 166, 240),
(75, '2021-04-07', 3, 17, 150),
(76, '2021-03-05', 3, 210, 180),
(77, '2021-07-16', 2, 33, 100),
(78, '2021-12-31', 3, 100, 240),
(79, '2021-08-05', 1, 82, 70),
(80, '2021-09-24', 2, 190, 80),
(81, '2021-09-05', 1, 289, 80),
(82, '2021-02-10', 3, 254, 90),
(83, '2021-12-18', 1, 150, 50),
(84, '2021-07-24', 3, 84, 75),
(85, '2021-06-06', 3, 77, 600),
(86, '2021-06-17', 2, 29, 70),
(87, '2021-10-27', 3, 44, 270),
(88, '2021-09-02', 2, 139, 100),
(89, '2021-02-16', 3, 255, 45),
(90, '2021-07-16', 3, 233, 150);

-- --------------------------------------------------------

--
-- Table structure for table `cust_saved_pmt`
--

DROP TABLE IF EXISTS `cust_saved_pmt`;
CREATE TABLE IF NOT EXISTS `cust_saved_pmt` (
  `card_id` int NOT NULL AUTO_INCREMENT,
  `cust_id` int NOT NULL,
  `name_on_card` varchar(128) NOT NULL,
  `card_number` varchar(16) NOT NULL,
  `card_type` varchar(50) NOT NULL,
  `exp_date` date NOT NULL,
  `sec_num` varchar(4) NOT NULL,
  PRIMARY KEY (`card_id`),
  KEY `cust_id` (`cust_id`)
) ENGINE=MyISAM AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `cust_saved_pmt`
--

INSERT INTO `cust_saved_pmt` (`card_id`, `cust_id`, `name_on_card`, `card_number`, `card_type`, `exp_date`, `sec_num`) VALUES
(1, 1, 'Seline Danev', '6649820099566933', 'Discover', '2023-09-25', '782'),
(2, 2, 'Cirstoforo Halsho', '6684855855603498', 'Discover', '2022-07-20', '100'),
(3, 3, 'Josefina Christal', '6688574310657818', 'Discover', '2023-09-19', '182'),
(4, 4, 'Mallory Silberschatz', '4646310738049737', 'Visa', '2022-10-21', '554'),
(5, 5, 'Ginni Veschi', '4156472768357890', 'Visa', '2022-11-02', '409'),
(6, 6, 'Theressa Kobelt', '5851402553535189', 'MasterCard', '2021-12-12', '791'),
(7, 7, 'Demetra Haddock', '6849307668472884', 'Discover', '2023-11-10', '274'),
(8, 8, 'Salvidor Burkhill', '6297395189808131', 'Discover', '2022-11-29', '419'),
(9, 9, 'Alden Pentecost', '6788681449165139', 'Discover', '2023-01-05', '527'),
(10, 10, 'Bridie Fitzharris', '5214401493942744', 'MasterCard', '2022-01-31', '406'),
(11, 11, 'Florrie Borkin', '5350626876036528', 'MasterCard', '2024-01-26', '344'),
(12, 12, 'Tiena Scorthorne', '6707256878880053', 'Discover', '2022-03-11', '658'),
(13, 13, 'Collen Gidman', '4681827602205434', 'Visa', '2024-06-04', '988'),
(14, 14, 'Chiquia O\' Scallan', '6065311754835435', 'Discover', '2023-07-07', '666'),
(15, 15, 'Sally Spittall', '6984040034262733', 'Discover', '2023-03-22', '757'),
(16, 16, 'Leodora Giacopetti', '3970886928898578', 'AmericanExpress', '2022-11-28', '342'),
(17, 17, 'Lulu Parlett', '6112905540900542', 'Discover', '2022-03-16', '616'),
(18, 18, 'Osmond Hepher', '4614376693438291', 'Visa', '2023-09-24', '455'),
(19, 19, 'Stewart Baack', '3039186657450396', 'AmericanExpress', '2022-12-06', '143'),
(20, 20, 'Raquela Nigh', '4618958975552334', 'Visa', '2022-04-29', '303');

-- --------------------------------------------------------

--
-- Table structure for table `employee`
--

DROP TABLE IF EXISTS `employee`;
CREATE TABLE IF NOT EXISTS `employee` (
  `emp_id` int NOT NULL AUTO_INCREMENT,
  `l_name` varchar(128) NOT NULL,
  `f_name` varchar(128) NOT NULL,
  `position` varchar(1280) NOT NULL,
  `store_id` int NOT NULL,
  PRIMARY KEY (`emp_id`),
  KEY `store_id` (`store_id`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `employee`
--

INSERT INTO `employee` (`emp_id`, `l_name`, `f_name`, `position`, `store_id`) VALUES
(1, 'Kippen', 'Cyrille', 'manager', 1),
(2, 'Vassano', 'Codie', 'manager', 2),
(3, 'Dunridge', 'Renado', 'manager', 3),
(4, 'Hacker', 'Alida', 'employee', 1),
(5, 'Raftery', 'Lilas', 'employee', 2),
(6, 'Brady', 'Bobby', 'employee', 3),
(7, 'Canton', 'Percy', 'employee', 1),
(8, 'Hugnet', 'Joanna', 'employee', 2),
(9, 'Andreasen', 'Chuck', 'employee', 3);

-- --------------------------------------------------------

--
-- Table structure for table `inventory`
--

DROP TABLE IF EXISTS `inventory`;
CREATE TABLE IF NOT EXISTS `inventory` (
  `inv_id` int NOT NULL AUTO_INCREMENT,
  `prod_id` int NOT NULL,
  `vendor_id` int DEFAULT NULL,
  `cust_id` int DEFAULT NULL,
  `line_id` int DEFAULT NULL,
  `store_id` int NOT NULL,
  `date` date NOT NULL,
  `quantity` int NOT NULL,
  `total_cost` float NOT NULL,
  `return_id` int DEFAULT NULL,
  PRIMARY KEY (`inv_id`),
  KEY `prod_id` (`prod_id`),
  KEY `vendor_id` (`vendor_id`),
  KEY `store_id` (`store_id`),
  KEY `line_id` (`line_id`),
  KEY `return_id` (`return_id`)
) ENGINE=MyISAM AUTO_INCREMENT=1882 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `inventory`
--

INSERT INTO `inventory` (`inv_id`, `prod_id`, `vendor_id`, `cust_id`, `line_id`, `store_id`, `date`, `quantity`, `total_cost`, `return_id`) VALUES
(1, 1, 8, NULL, NULL, 1, '2021-01-01', 50, 2500, NULL),
(2, 2, 1, NULL, NULL, 1, '2021-01-01', 50, 1250, NULL),
(3, 3, 2, NULL, NULL, 1, '2021-01-01', 50, 750, NULL),
(4, 4, 8, NULL, NULL, 1, '2021-01-01', 50, 375, NULL),
(5, 5, 7, NULL, NULL, 1, '2021-01-01', 50, 2500, NULL),
(6, 6, 6, NULL, NULL, 1, '2021-01-01', 50, 1250, NULL),
(7, 7, 4, NULL, NULL, 1, '2021-01-01', 50, 625, NULL),
(8, 8, 4, NULL, NULL, 1, '2021-01-01', 50, 3750, NULL),
(9, 9, 6, NULL, NULL, 1, '2021-01-01', 50, 5000, NULL),
(10, 10, 1, NULL, NULL, 1, '2021-01-01', 50, 7500, NULL),
(11, 11, 5, NULL, NULL, 1, '2021-01-01', 50, 2000, NULL),
(12, 12, 6, NULL, NULL, 1, '2021-01-01', 50, 2250, NULL),
(13, 13, 4, NULL, NULL, 1, '2021-01-01', 50, 5000, NULL),
(14, 14, 10, NULL, NULL, 1, '2021-01-01', 50, 1500, NULL),
(15, 15, 10, NULL, NULL, 1, '2021-01-01', 50, 2000, NULL),
(16, 16, 7, NULL, NULL, 1, '2021-01-01', 50, 1250, NULL),
(17, 17, 8, NULL, NULL, 1, '2021-01-01', 50, 1250, NULL),
(18, 18, 1, NULL, NULL, 1, '2021-01-01', 50, 2000, NULL),
(19, 19, 4, NULL, NULL, 1, '2021-01-01', 50, 2500, NULL),
(20, 20, 6, NULL, NULL, 1, '2021-01-01', 50, 2500, NULL),
(21, 21, 10, NULL, NULL, 1, '2021-01-01', 50, 2000, NULL),
(22, 22, 9, NULL, NULL, 1, '2021-01-01', 50, 2500, NULL),
(23, 23, 7, NULL, NULL, 1, '2021-01-01', 50, 3750, NULL),
(24, 24, 4, NULL, NULL, 1, '2021-01-01', 50, 2000, NULL),
(25, 25, 6, NULL, NULL, 1, '2021-01-01', 50, 2000, NULL),
(26, 26, 4, NULL, NULL, 1, '2021-01-01', 50, 1250, NULL),
(27, 27, 3, NULL, NULL, 1, '2021-01-01', 50, 500, NULL),
(28, 28, 6, NULL, NULL, 1, '2021-01-01', 50, 1750, NULL),
(29, 29, 9, NULL, NULL, 1, '2021-01-01', 50, 1000, NULL),
(30, 30, 7, NULL, NULL, 1, '2021-01-01', 50, 1500, NULL),
(31, 31, 5, NULL, NULL, 1, '2021-01-01', 50, 1250, NULL),
(32, 32, 9, NULL, NULL, 1, '2021-01-01', 50, 1750, NULL),
(33, 33, 10, NULL, NULL, 1, '2021-01-01', 50, 2375, NULL),
(34, 34, 3, NULL, NULL, 1, '2021-01-01', 50, 5000, NULL),
(35, 35, 2, NULL, NULL, 1, '2021-01-01', 50, 750, NULL),
(36, 36, 7, NULL, NULL, 1, '2021-01-01', 50, 1250, NULL),
(37, 37, 10, NULL, NULL, 1, '2021-01-01', 50, 1000, NULL),
(38, 38, 9, NULL, NULL, 1, '2021-01-01', 50, 1500, NULL),
(39, 39, 6, NULL, NULL, 1, '2021-01-01', 50, 2500, NULL),
(40, 40, 2, NULL, NULL, 1, '2021-01-01', 50, 2250, NULL),
(41, 41, 1, NULL, NULL, 1, '2021-01-01', 50, 625, NULL),
(42, 42, 4, NULL, NULL, 1, '2021-01-01', 50, 875, NULL),
(43, 43, 1, NULL, NULL, 1, '2021-01-01', 50, 625, NULL),
(44, 44, 2, NULL, NULL, 1, '2021-01-01', 50, 1250, NULL),
(45, 45, 8, NULL, NULL, 1, '2021-01-01', 50, 1000, NULL),
(46, 46, 3, NULL, NULL, 1, '2021-01-01', 50, 2250, NULL),
(47, 47, 2, NULL, NULL, 1, '2021-01-01', 50, 3750, NULL),
(48, 1, 9, NULL, NULL, 2, '2021-01-01', 50, 2500, NULL),
(49, 2, 5, NULL, NULL, 2, '2021-01-01', 50, 1250, NULL),
(50, 3, 2, NULL, NULL, 2, '2021-01-01', 50, 750, NULL),
(51, 4, 1, NULL, NULL, 2, '2021-01-01', 50, 375, NULL),
(52, 5, 4, NULL, NULL, 2, '2021-01-01', 50, 2500, NULL),
(53, 6, 6, NULL, NULL, 2, '2021-01-01', 50, 1250, NULL),
(54, 7, 5, NULL, NULL, 2, '2021-01-01', 50, 625, NULL),
(55, 8, 9, NULL, NULL, 2, '2021-01-01', 50, 3750, NULL),
(56, 9, 3, NULL, NULL, 2, '2021-01-01', 50, 5000, NULL),
(57, 10, 10, NULL, NULL, 2, '2021-01-01', 50, 7500, NULL),
(58, 11, 9, NULL, NULL, 2, '2021-01-01', 50, 2000, NULL),
(59, 12, 1, NULL, NULL, 2, '2021-01-01', 50, 2250, NULL),
(60, 13, 9, NULL, NULL, 2, '2021-01-01', 50, 5000, NULL),
(61, 14, 9, NULL, NULL, 2, '2021-01-01', 50, 1500, NULL),
(62, 15, 9, NULL, NULL, 2, '2021-01-01', 50, 2000, NULL),
(63, 16, 10, NULL, NULL, 2, '2021-01-01', 50, 1250, NULL),
(64, 17, 7, NULL, NULL, 2, '2021-01-01', 50, 1250, NULL),
(65, 18, 6, NULL, NULL, 2, '2021-01-01', 50, 2000, NULL),
(66, 19, 5, NULL, NULL, 2, '2021-01-01', 50, 2500, NULL),
(67, 20, 5, NULL, NULL, 2, '2021-01-01', 50, 2500, NULL),
(68, 21, 8, NULL, NULL, 2, '2021-01-01', 50, 2000, NULL),
(69, 22, 6, NULL, NULL, 2, '2021-01-01', 50, 2500, NULL),
(70, 23, 10, NULL, NULL, 2, '2021-01-01', 50, 3750, NULL),
(71, 24, 8, NULL, NULL, 2, '2021-01-01', 50, 2000, NULL),
(72, 25, 5, NULL, NULL, 2, '2021-01-01', 50, 2000, NULL),
(73, 26, 10, NULL, NULL, 2, '2021-01-01', 50, 1250, NULL),
(74, 27, 6, NULL, NULL, 2, '2021-01-01', 50, 500, NULL),
(75, 28, 1, NULL, NULL, 2, '2021-01-01', 50, 1750, NULL),
(76, 29, 8, NULL, NULL, 2, '2021-01-01', 50, 1000, NULL),
(77, 30, 5, NULL, NULL, 2, '2021-01-01', 50, 1500, NULL),
(78, 31, 6, NULL, NULL, 2, '2021-01-01', 50, 1250, NULL),
(79, 32, 2, NULL, NULL, 2, '2021-01-01', 50, 1750, NULL),
(80, 33, 7, NULL, NULL, 2, '2021-01-01', 50, 2375, NULL),
(81, 34, 3, NULL, NULL, 2, '2021-01-01', 50, 5000, NULL),
(82, 35, 5, NULL, NULL, 2, '2021-01-01', 50, 750, NULL),
(83, 36, 1, NULL, NULL, 2, '2021-01-01', 50, 1250, NULL),
(84, 37, 9, NULL, NULL, 2, '2021-01-01', 50, 1000, NULL),
(85, 38, 10, NULL, NULL, 2, '2021-01-01', 50, 1500, NULL),
(86, 39, 7, NULL, NULL, 2, '2021-01-01', 50, 2500, NULL),
(87, 40, 2, NULL, NULL, 2, '2021-01-01', 50, 2250, NULL),
(88, 41, 4, NULL, NULL, 2, '2021-01-01', 50, 625, NULL),
(89, 42, 1, NULL, NULL, 2, '2021-01-01', 50, 875, NULL),
(90, 43, 4, NULL, NULL, 2, '2021-01-01', 50, 625, NULL),
(91, 44, 7, NULL, NULL, 2, '2021-01-01', 50, 1250, NULL),
(92, 45, 10, NULL, NULL, 2, '2021-01-01', 50, 1000, NULL),
(93, 46, 10, NULL, NULL, 2, '2021-01-01', 50, 2250, NULL),
(94, 47, 3, NULL, NULL, 2, '2021-01-01', 50, 3750, NULL),
(95, 1, 2, NULL, NULL, 3, '2021-01-01', 50, 2500, NULL),
(96, 2, 1, NULL, NULL, 3, '2021-01-01', 50, 1250, NULL),
(97, 3, 9, NULL, NULL, 3, '2021-01-01', 50, 750, NULL),
(98, 4, 10, NULL, NULL, 3, '2021-01-01', 50, 375, NULL),
(99, 5, 10, NULL, NULL, 3, '2021-01-01', 50, 2500, NULL),
(100, 6, 9, NULL, NULL, 3, '2021-01-01', 50, 1250, NULL),
(101, 7, 2, NULL, NULL, 3, '2021-01-01', 50, 625, NULL),
(102, 8, 7, NULL, NULL, 3, '2021-01-01', 50, 3750, NULL),
(103, 9, 3, NULL, NULL, 3, '2021-01-01', 50, 5000, NULL),
(104, 10, 9, NULL, NULL, 3, '2021-01-01', 50, 7500, NULL),
(105, 11, 6, NULL, NULL, 3, '2021-01-01', 50, 2000, NULL),
(106, 12, 10, NULL, NULL, 3, '2021-01-01', 50, 2250, NULL),
(107, 13, 8, NULL, NULL, 3, '2021-01-01', 50, 5000, NULL),
(108, 14, 6, NULL, NULL, 3, '2021-01-01', 50, 1500, NULL),
(109, 15, 3, NULL, NULL, 3, '2021-01-01', 50, 2000, NULL),
(110, 16, 1, NULL, NULL, 3, '2021-01-01', 50, 1250, NULL),
(111, 17, 8, NULL, NULL, 3, '2021-01-01', 50, 1250, NULL),
(112, 18, 8, NULL, NULL, 3, '2021-01-01', 50, 2000, NULL),
(113, 19, 9, NULL, NULL, 3, '2021-01-01', 50, 2500, NULL),
(114, 20, 10, NULL, NULL, 3, '2021-01-01', 50, 2500, NULL),
(115, 21, 6, NULL, NULL, 3, '2021-01-01', 50, 2000, NULL),
(116, 22, 8, NULL, NULL, 3, '2021-01-01', 50, 2500, NULL),
(117, 23, 3, NULL, NULL, 3, '2021-01-01', 50, 3750, NULL),
(118, 24, 8, NULL, NULL, 3, '2021-01-01', 50, 2000, NULL),
(119, 25, 3, NULL, NULL, 3, '2021-01-01', 50, 2000, NULL),
(120, 26, 5, NULL, NULL, 3, '2021-01-01', 50, 1250, NULL),
(121, 27, 7, NULL, NULL, 3, '2021-01-01', 50, 500, NULL),
(122, 28, 5, NULL, NULL, 3, '2021-01-01', 50, 1750, NULL),
(123, 29, 3, NULL, NULL, 3, '2021-01-01', 50, 1000, NULL),
(124, 30, 10, NULL, NULL, 3, '2021-01-01', 50, 1500, NULL),
(125, 31, 9, NULL, NULL, 3, '2021-01-01', 50, 1250, NULL),
(126, 32, 8, NULL, NULL, 3, '2021-01-01', 50, 1750, NULL),
(127, 33, 2, NULL, NULL, 3, '2021-01-01', 50, 2375, NULL),
(128, 34, 1, NULL, NULL, 3, '2021-01-01', 50, 5000, NULL),
(129, 35, 7, NULL, NULL, 3, '2021-01-01', 50, 750, NULL),
(130, 36, 9, NULL, NULL, 3, '2021-01-01', 50, 1250, NULL),
(131, 37, 9, NULL, NULL, 3, '2021-01-01', 50, 1000, NULL),
(132, 38, 1, NULL, NULL, 3, '2021-01-01', 50, 1500, NULL),
(133, 39, 1, NULL, NULL, 3, '2021-01-01', 50, 2500, NULL),
(134, 40, 5, NULL, NULL, 3, '2021-01-01', 50, 2250, NULL),
(135, 41, 10, NULL, NULL, 3, '2021-01-01', 50, 625, NULL),
(136, 42, 9, NULL, NULL, 3, '2021-01-01', 50, 875, NULL),
(137, 43, 4, NULL, NULL, 3, '2021-01-01', 50, 625, NULL),
(138, 44, 4, NULL, NULL, 3, '2021-01-01', 50, 1250, NULL),
(139, 45, 8, NULL, NULL, 3, '2021-01-01', 50, 1000, NULL),
(140, 46, 1, NULL, NULL, 3, '2021-01-01', 50, 2250, NULL),
(141, 47, 9, NULL, NULL, 3, '2021-01-01', 50, 3750, NULL),
(142, 40, NULL, 19, NULL, 3, '2021-11-09', -1, 45, NULL),
(143, 24, NULL, 16, NULL, 2, '2021-12-02', -3, 120, NULL),
(144, 26, NULL, 6, NULL, 2, '2021-01-15', -3, 75, NULL),
(145, 14, NULL, 12, NULL, 2, '2021-01-17', -3, 90, NULL),
(146, 34, NULL, 10, NULL, 1, '2021-01-25', -2, 200, NULL),
(147, 35, NULL, 6, NULL, 1, '2021-01-29', -3, 45, NULL),
(148, 4, NULL, 6, NULL, 1, '2021-02-07', -3, 22.5, NULL),
(149, 31, NULL, 19, NULL, 2, '2021-02-09', -1, 25, NULL),
(150, 6, NULL, 2, NULL, 3, '2021-02-11', -1, 25, NULL),
(151, 3, NULL, 5, NULL, 2, '2021-02-20', -2, 30, NULL),
(152, 33, NULL, 6, NULL, 3, '2021-02-20', -1, 47.5, NULL),
(153, 44, NULL, 8, NULL, 2, '2021-02-27', -3, 75, NULL),
(154, 45, NULL, 2, NULL, 2, '2021-03-05', -3, 60, NULL),
(155, 7, NULL, 6, NULL, 3, '2021-03-08', -3, 37.5, NULL),
(156, 32, NULL, 13, NULL, 2, '2021-03-14', -2, 70, NULL),
(157, 14, NULL, 3, NULL, 3, '2021-03-23', -3, 90, NULL),
(158, 1, NULL, 2, NULL, 1, '2021-03-24', -1, 50, NULL),
(159, 28, NULL, 10, NULL, 3, '2021-04-03', -3, 105, NULL),
(160, 44, NULL, 19, NULL, 1, '2021-04-05', -1, 25, NULL),
(161, 2, NULL, 20, NULL, 2, '2021-04-08', -2, 50, NULL),
(162, 24, NULL, 13, NULL, 2, '2021-05-05', -2, 80, NULL),
(163, 33, NULL, 19, NULL, 2, '2021-05-24', -1, 47.5, NULL),
(164, 28, NULL, 9, NULL, 3, '2021-05-26', -2, 70, NULL),
(165, 25, NULL, 3, NULL, 1, '2021-05-29', -1, 40, NULL),
(166, 22, NULL, 14, NULL, 3, '2021-05-31', -2, 100, NULL),
(167, 8, NULL, 15, NULL, 2, '2021-06-01', -2, 150, NULL),
(168, 43, NULL, 10, NULL, 2, '2021-06-02', -3, 37.5, NULL),
(169, 6, NULL, 2, NULL, 2, '2021-06-02', -2, 50, NULL),
(170, 38, NULL, 5, NULL, 3, '2021-06-04', -3, 90, NULL),
(171, 46, NULL, 18, NULL, 2, '2021-06-04', -1, 45, NULL),
(172, 17, NULL, 9, NULL, 2, '2021-06-07', -1, 25, NULL),
(173, 46, NULL, 7, NULL, 2, '2021-06-27', -3, 135, NULL),
(174, 17, NULL, 4, NULL, 3, '2021-07-02', -2, 50, NULL),
(175, 24, NULL, 5, NULL, 1, '2021-07-13', -2, 80, NULL),
(176, 2, NULL, 9, NULL, 2, '2021-07-15', -2, 50, NULL),
(177, 10, NULL, 8, NULL, 2, '2021-07-18', -3, 450, NULL),
(178, 38, NULL, 17, NULL, 1, '2021-07-22', -2, 60, NULL),
(179, 1, NULL, 3, NULL, 1, '2021-08-01', -3, 150, NULL),
(180, 20, NULL, 19, NULL, 3, '2021-08-08', -3, 150, NULL),
(181, 10, NULL, 15, NULL, 3, '2021-08-13', -1, 150, NULL),
(182, 24, NULL, 12, NULL, 2, '2021-08-24', -1, 40, NULL),
(183, 33, NULL, 12, NULL, 3, '2021-09-12', -1, 47.5, NULL),
(184, 36, NULL, 8, NULL, 2, '2021-09-23', -3, 75, NULL),
(185, 1, NULL, 1, NULL, 3, '2021-10-02', -3, 150, NULL),
(186, 34, NULL, 7, NULL, 2, '2021-10-06', -2, 200, NULL),
(187, 46, NULL, 13, NULL, 2, '2021-10-15', -1, 45, NULL),
(188, 43, NULL, 16, NULL, 1, '2021-10-18', -3, 37.5, NULL),
(189, 18, NULL, 2, NULL, 2, '2021-10-24', -3, 120, NULL),
(190, 26, NULL, 13, NULL, 3, '2021-10-31', -2, 50, NULL),
(191, 7, NULL, 3, NULL, 2, '2021-11-01', -1, 12.5, NULL),
(192, 26, NULL, 19, NULL, 3, '2021-11-09', -1, 25, NULL),
(193, 18, NULL, 16, NULL, 2, '2021-12-02', -2, 80, NULL),
(194, 21, NULL, 3, NULL, 2, '2021-11-01', -1, 40, NULL),
(195, 41, NULL, 13, NULL, 3, '2021-10-31', -2, 25, NULL),
(196, 23, NULL, 2, NULL, 2, '2021-10-24', -3, 225, NULL),
(197, 47, NULL, 16, NULL, 1, '2021-10-18', -3, 225, NULL),
(198, 24, NULL, 13, NULL, 2, '2021-10-15', -3, 120, NULL),
(199, 14, NULL, 7, NULL, 2, '2021-10-06', -1, 30, NULL),
(200, 23, NULL, 1, NULL, 3, '2021-10-02', -1, 75, NULL),
(201, 29, NULL, 8, NULL, 2, '2021-09-23', -1, 20, NULL),
(202, 25, NULL, 12, NULL, 3, '2021-09-12', -3, 120, NULL),
(203, 42, NULL, 12, NULL, 2, '2021-08-24', -3, 52.5, NULL),
(204, 37, NULL, 15, NULL, 3, '2021-08-13', -2, 40, NULL),
(205, 27, NULL, 19, NULL, 3, '2021-08-08', -3, 30, NULL),
(206, 5, NULL, 3, NULL, 1, '2021-08-01', -1, 50, NULL),
(207, 11, NULL, 17, NULL, 1, '2021-07-22', -1, 40, NULL),
(208, 37, NULL, 8, NULL, 2, '2021-07-18', -3, 60, NULL),
(209, 36, NULL, 9, NULL, 2, '2021-07-15', -3, 75, NULL),
(210, 14, NULL, 5, NULL, 1, '2021-07-13', -1, 30, NULL),
(211, 8, NULL, 4, NULL, 3, '2021-07-02', -1, 75, NULL),
(212, 5, NULL, 7, NULL, 2, '2021-06-27', -3, 150, NULL),
(213, 47, NULL, 9, NULL, 2, '2021-06-07', -3, 225, NULL),
(214, 23, NULL, 18, NULL, 2, '2021-06-04', -3, 225, NULL),
(215, 34, NULL, 5, NULL, 3, '2021-06-04', -2, 200, NULL),
(216, 43, NULL, 2, NULL, 2, '2021-06-02', -3, 37.5, NULL),
(217, 27, NULL, 10, NULL, 2, '2021-06-02', -3, 30, NULL),
(218, 29, NULL, 15, NULL, 2, '2021-06-01', -2, 40, NULL),
(219, 29, NULL, 14, NULL, 3, '2021-05-31', -3, 60, NULL),
(220, 46, NULL, 3, NULL, 1, '2021-05-29', -1, 45, NULL),
(221, 27, NULL, 9, NULL, 3, '2021-05-26', -3, 30, NULL),
(222, 44, NULL, 19, NULL, 2, '2021-05-24', -1, 25, NULL),
(223, 14, NULL, 13, NULL, 2, '2021-05-05', -3, 90, NULL),
(224, 46, NULL, 20, NULL, 2, '2021-04-08', -1, 45, NULL),
(225, 10, NULL, 19, NULL, 1, '2021-04-05', -2, 300, NULL),
(226, 8, NULL, 10, NULL, 3, '2021-04-03', -1, 75, NULL),
(227, 46, NULL, 2, NULL, 1, '2021-03-24', -2, 90, NULL),
(228, 6, NULL, 3, NULL, 3, '2021-03-23', -1, 25, NULL),
(229, 15, NULL, 13, NULL, 2, '2021-03-14', -2, 80, NULL),
(230, 26, NULL, 6, NULL, 3, '2021-03-08', -2, 50, NULL),
(231, 39, NULL, 2, NULL, 2, '2021-03-05', -2, 100, NULL),
(232, 38, NULL, 8, NULL, 2, '2021-02-27', -3, 90, NULL),
(233, 12, NULL, 6, NULL, 3, '2021-02-20', -2, 90, NULL),
(234, 32, NULL, 5, NULL, 2, '2021-02-20', -3, 105, NULL),
(235, 3, NULL, 2, NULL, 3, '2021-02-11', -2, 30, NULL),
(236, 34, NULL, 19, NULL, 2, '2021-02-09', -2, 200, NULL),
(237, 29, NULL, 6, NULL, 1, '2021-02-07', -3, 60, NULL),
(238, 8, NULL, 6, NULL, 1, '2021-01-29', -3, 225, NULL),
(239, 31, NULL, 10, NULL, 1, '2021-01-25', -2, 50, NULL),
(240, 10, NULL, 12, NULL, 2, '2021-01-17', -3, 450, NULL),
(241, 43, NULL, 6, NULL, 2, '2021-01-15', -1, 12.5, NULL),
(242, 26, NULL, 16, NULL, 2, '2021-12-02', -2, 50, NULL),
(243, 38, NULL, 19, NULL, 3, '2021-11-09', -1, 30, NULL),
(244, 21, NULL, 3, NULL, 2, '2021-11-01', -3, 120, NULL),
(245, 42, NULL, 13, NULL, 3, '2021-10-31', -2, 35, NULL),
(246, 42, NULL, 2, NULL, 2, '2021-10-24', -1, 17.5, NULL),
(247, 42, NULL, 16, NULL, 1, '2021-10-18', -3, 52.5, NULL),
(248, 33, NULL, 13, NULL, 2, '2021-10-15', -2, 95, NULL),
(249, 24, NULL, 7, NULL, 2, '2021-10-06', -2, 80, NULL),
(250, 13, NULL, 1, NULL, 3, '2021-10-02', -1, 100, NULL),
(251, 21, NULL, 8, NULL, 2, '2021-09-23', -2, 80, NULL),
(252, 37, NULL, 12, NULL, 3, '2021-09-12', -2, 40, NULL),
(253, 20, NULL, 12, NULL, 2, '2021-08-24', -1, 50, NULL),
(254, 38, NULL, 15, NULL, 3, '2021-08-13', -3, 90, NULL),
(255, 14, NULL, 19, NULL, 3, '2021-08-08', -1, 30, NULL),
(256, 20, NULL, 3, NULL, 1, '2021-08-01', -1, 50, NULL),
(257, 1, NULL, 17, NULL, 1, '2021-07-22', -1, 50, NULL),
(258, 25, NULL, 8, NULL, 2, '2021-07-18', -3, 120, NULL),
(259, 5, NULL, 9, NULL, 2, '2021-07-15', -3, 150, NULL),
(260, 7, NULL, 5, NULL, 1, '2021-07-13', -1, 12.5, NULL),
(261, 2, NULL, 4, NULL, 3, '2021-07-02', -2, 50, NULL),
(262, 22, NULL, 7, NULL, 2, '2021-06-27', -2, 100, NULL),
(263, 17, NULL, 9, NULL, 2, '2021-06-07', -3, 75, NULL),
(264, 7, NULL, 18, NULL, 2, '2021-06-04', -1, 12.5, NULL),
(265, 41, NULL, 5, NULL, 3, '2021-06-04', -3, 37.5, NULL),
(266, 41, NULL, 2, NULL, 2, '2021-06-02', -2, 25, NULL),
(267, 27, NULL, 10, NULL, 2, '2021-06-02', -2, 20, NULL),
(268, 46, NULL, 15, NULL, 2, '2021-06-01', -1, 45, NULL),
(269, 12, NULL, 14, NULL, 3, '2021-05-31', -3, 135, NULL),
(270, 46, NULL, 3, NULL, 1, '2021-05-29', -3, 135, NULL),
(271, 29, NULL, 9, NULL, 3, '2021-05-26', -1, 20, NULL),
(272, 30, NULL, 19, NULL, 2, '2021-05-24', -3, 90, NULL),
(273, 13, NULL, 13, NULL, 2, '2021-05-05', -2, 200, NULL),
(274, 8, NULL, 20, NULL, 2, '2021-04-08', -3, 225, NULL),
(275, 32, NULL, 19, NULL, 1, '2021-04-05', -1, 35, NULL),
(276, 18, NULL, 10, NULL, 3, '2021-04-03', -3, 120, NULL),
(277, 27, NULL, 2, NULL, 1, '2021-03-24', -3, 30, NULL),
(278, 9, NULL, 3, NULL, 3, '2021-03-23', -1, 100, NULL),
(279, 28, NULL, 13, NULL, 2, '2021-03-14', -1, 35, NULL),
(280, 32, NULL, 6, NULL, 3, '2021-03-08', -3, 105, NULL),
(281, 42, NULL, 2, NULL, 2, '2021-03-05', -3, 52.5, NULL),
(282, 37, NULL, 8, NULL, 2, '2021-02-27', -2, 40, NULL),
(283, 16, NULL, 6, NULL, 3, '2021-02-20', -1, 25, NULL),
(284, 17, NULL, 5, NULL, 2, '2021-02-20', -3, 75, NULL),
(285, 44, NULL, 2, NULL, 3, '2021-02-11', -3, 75, NULL),
(286, 5, NULL, 19, NULL, 2, '2021-02-09', -2, 100, NULL),
(287, 18, NULL, 6, NULL, 1, '2021-02-07', -3, 120, NULL),
(288, 2, NULL, 6, NULL, 1, '2021-01-29', -2, 50, NULL),
(289, 40, NULL, 10, NULL, 1, '2021-01-25', -1, 45, NULL),
(290, 41, NULL, 12, NULL, 2, '2021-01-17', -3, 37.5, NULL),
(291, 36, NULL, 6, NULL, 2, '2021-01-15', -3, 75, NULL),
(292, 16, NULL, 16, NULL, 2, '2021-12-02', -1, 25, NULL),
(293, 4, NULL, 19, NULL, 3, '2021-11-09', -3, 22.5, NULL),
(294, 23, NULL, 3, NULL, 2, '2021-11-01', -3, 225, NULL),
(295, 32, NULL, 13, NULL, 3, '2021-10-31', -2, 70, NULL),
(296, 19, NULL, 2, NULL, 2, '2021-10-24', -2, 100, NULL),
(297, 13, NULL, 16, NULL, 1, '2021-10-18', -2, 200, NULL),
(298, 9, NULL, 13, NULL, 2, '2021-10-15', -3, 300, NULL),
(299, 23, NULL, 7, NULL, 2, '2021-10-06', -1, 75, NULL),
(300, 42, NULL, 1, NULL, 3, '2021-10-02', -3, 52.5, NULL),
(301, 28, NULL, 8, NULL, 2, '2021-09-23', -1, 35, NULL),
(302, 41, NULL, 12, NULL, 3, '2021-09-12', -2, 25, NULL),
(303, 16, NULL, 12, NULL, 2, '2021-08-24', -2, 50, NULL),
(304, 22, NULL, 15, NULL, 3, '2021-08-13', -2, 100, NULL),
(305, 6, NULL, 19, NULL, 3, '2021-08-08', -2, 50, NULL),
(306, 20, NULL, 3, NULL, 1, '2021-08-01', -3, 150, NULL),
(307, 11, NULL, 17, NULL, 1, '2021-07-22', -1, 40, NULL),
(308, 33, NULL, 8, NULL, 2, '2021-07-18', -2, 95, NULL),
(309, 24, NULL, 9, NULL, 2, '2021-07-15', -1, 40, NULL),
(310, 27, NULL, 5, NULL, 1, '2021-07-13', -3, 30, NULL),
(311, 10, NULL, 4, NULL, 3, '2021-07-02', -1, 150, NULL),
(312, 14, NULL, 7, NULL, 2, '2021-06-27', -2, 60, NULL),
(313, 6, NULL, 9, NULL, 2, '2021-06-07', -1, 25, NULL),
(314, 11, NULL, 18, NULL, 2, '2021-06-04', -2, 80, NULL),
(315, 25, NULL, 5, NULL, 3, '2021-06-04', -2, 80, NULL),
(316, 9, NULL, 2, NULL, 2, '2021-06-02', -1, 100, NULL),
(317, 23, NULL, 10, NULL, 2, '2021-06-02', -3, 225, NULL),
(318, 47, NULL, 15, NULL, 2, '2021-06-01', -1, 75, NULL),
(319, 4, NULL, 14, NULL, 3, '2021-05-31', -2, 15, NULL),
(320, 22, NULL, 3, NULL, 1, '2021-05-29', -1, 50, NULL),
(321, 8, NULL, 9, NULL, 3, '2021-05-26', -1, 75, NULL),
(322, 40, NULL, 19, NULL, 2, '2021-05-24', -2, 90, NULL),
(323, 38, NULL, 13, NULL, 2, '2021-05-05', -1, 30, NULL),
(324, 3, NULL, 20, NULL, 2, '2021-04-08', -3, 45, NULL),
(325, 29, NULL, 19, NULL, 1, '2021-04-05', -2, 40, NULL),
(326, 10, NULL, 10, NULL, 3, '2021-04-03', -1, 150, NULL),
(327, 9, NULL, 2, NULL, 1, '2021-03-24', -3, 300, NULL),
(328, 44, NULL, 3, NULL, 3, '2021-03-23', -2, 50, NULL),
(329, 12, NULL, 13, NULL, 2, '2021-03-14', -2, 90, NULL),
(330, 23, NULL, 6, NULL, 3, '2021-03-08', -1, 75, NULL),
(331, 37, NULL, 2, NULL, 2, '2021-03-05', -3, 60, NULL),
(332, 18, NULL, 8, NULL, 2, '2021-02-27', -3, 120, NULL),
(333, 4, NULL, 6, NULL, 3, '2021-02-20', -3, 22.5, NULL),
(334, 37, NULL, 5, NULL, 2, '2021-02-20', -1, 20, NULL),
(335, 45, NULL, 2, NULL, 3, '2021-02-11', -3, 60, NULL),
(336, 45, NULL, 19, NULL, 2, '2021-02-09', -3, 60, NULL),
(337, 3, NULL, 6, NULL, 1, '2021-02-07', -3, 45, NULL),
(338, 23, NULL, 6, NULL, 1, '2021-01-29', -2, 150, NULL),
(339, 32, NULL, 10, NULL, 1, '2021-01-25', -2, 70, NULL),
(340, 28, NULL, 12, NULL, 2, '2021-01-17', -2, 70, NULL),
(341, 21, NULL, 6, NULL, 2, '2021-01-15', -1, 40, NULL),
(342, 24, NULL, 16, NULL, 2, '2021-12-02', -3, 120, NULL),
(343, 11, NULL, 19, NULL, 3, '2021-11-09', -1, 40, NULL),
(344, 19, NULL, 3, NULL, 2, '2021-11-01', -2, 100, NULL),
(345, 31, NULL, 13, NULL, 3, '2021-10-31', -3, 75, NULL),
(346, 28, NULL, 2, NULL, 2, '2021-10-24', -1, 35, NULL),
(347, 44, NULL, 16, NULL, 1, '2021-10-18', -3, 75, NULL),
(348, 45, NULL, 13, NULL, 2, '2021-10-15', -2, 40, NULL),
(349, 35, NULL, 7, NULL, 2, '2021-10-06', -1, 15, NULL),
(350, 25, NULL, 1, NULL, 3, '2021-10-02', -1, 40, NULL),
(351, 31, NULL, 8, NULL, 2, '2021-09-23', -1, 25, NULL),
(352, 8, NULL, 12, NULL, 3, '2021-09-12', -1, 75, NULL),
(353, 14, NULL, 12, NULL, 2, '2021-08-24', -3, 90, NULL),
(354, 22, NULL, 15, NULL, 3, '2021-08-13', -3, 150, NULL),
(355, 31, NULL, 19, NULL, 3, '2021-08-08', -2, 50, NULL),
(356, 1, NULL, 3, NULL, 1, '2021-08-01', -1, 50, NULL),
(357, 42, NULL, 17, NULL, 1, '2021-07-22', -2, 35, NULL),
(358, 7, NULL, 8, NULL, 2, '2021-07-18', -3, 37.5, NULL),
(359, 15, NULL, 9, NULL, 2, '2021-07-15', -3, 120, NULL),
(360, 28, NULL, 5, NULL, 1, '2021-07-13', -1, 35, NULL),
(361, 8, NULL, 4, NULL, 3, '2021-07-02', -2, 150, NULL),
(362, 37, NULL, 7, NULL, 2, '2021-06-27', -2, 40, NULL),
(363, 23, NULL, 9, NULL, 2, '2021-06-07', -2, 150, NULL),
(364, 24, NULL, 18, NULL, 2, '2021-06-04', -3, 120, NULL),
(365, 34, NULL, 5, NULL, 3, '2021-06-04', -3, 300, NULL),
(366, 17, NULL, 2, NULL, 2, '2021-06-02', -3, 75, NULL),
(367, 27, NULL, 10, NULL, 2, '2021-06-02', -1, 10, NULL),
(368, 47, NULL, 15, NULL, 2, '2021-06-01', -2, 150, NULL),
(369, 3, NULL, 14, NULL, 3, '2021-05-31', -2, 30, NULL),
(370, 10, NULL, 3, NULL, 1, '2021-05-29', -1, 150, NULL),
(371, 20, NULL, 9, NULL, 3, '2021-05-26', -2, 100, NULL),
(372, 40, NULL, 19, NULL, 2, '2021-05-24', -1, 45, NULL),
(373, 26, NULL, 13, NULL, 2, '2021-05-05', -1, 25, NULL),
(374, 37, NULL, 20, NULL, 2, '2021-04-08', -2, 40, NULL),
(375, 23, NULL, 19, NULL, 1, '2021-04-05', -1, 75, NULL),
(376, 22, NULL, 10, NULL, 3, '2021-04-03', -3, 150, NULL),
(377, 23, NULL, 2, NULL, 1, '2021-03-24', -3, 225, NULL),
(378, 34, NULL, 3, NULL, 3, '2021-03-23', -2, 200, NULL),
(379, 21, NULL, 13, NULL, 2, '2021-03-14', -1, 40, NULL),
(380, 6, NULL, 6, NULL, 3, '2021-03-08', -2, 50, NULL),
(381, 43, NULL, 2, NULL, 2, '2021-03-05', -3, 37.5, NULL),
(382, 25, NULL, 8, NULL, 2, '2021-02-27', -1, 40, NULL),
(383, 42, NULL, 6, NULL, 3, '2021-02-20', -3, 52.5, NULL),
(384, 13, NULL, 5, NULL, 2, '2021-02-20', -2, 200, NULL),
(385, 19, NULL, 2, NULL, 3, '2021-02-11', -2, 100, NULL),
(386, 35, NULL, 19, NULL, 2, '2021-02-09', -1, 15, NULL),
(387, 9, NULL, 6, NULL, 1, '2021-02-07', -1, 100, NULL),
(388, 46, NULL, 6, NULL, 1, '2021-01-29', -3, 135, NULL),
(389, 8, NULL, 10, NULL, 1, '2021-01-25', -1, 75, NULL),
(390, 1, NULL, 12, NULL, 2, '2021-01-17', -3, 150, NULL),
(391, 42, NULL, 6, NULL, 2, '2021-01-15', -1, 17.5, NULL),
(392, 31, NULL, 16, NULL, 2, '2021-12-02', -2, 50, NULL),
(393, 4, NULL, 19, NULL, 3, '2021-11-09', -1, 7.5, NULL),
(394, 34, NULL, 3, NULL, 2, '2021-11-01', -1, 100, NULL),
(395, 7, NULL, 13, NULL, 3, '2021-10-31', -3, 37.5, NULL),
(396, 26, NULL, 2, NULL, 2, '2021-10-24', -2, 50, NULL),
(397, 36, NULL, 16, NULL, 1, '2021-10-18', -1, 25, NULL),
(398, 12, NULL, 13, NULL, 2, '2021-10-15', -3, 135, NULL),
(399, 22, NULL, 7, NULL, 2, '2021-10-06', -3, 150, NULL),
(400, 6, NULL, 1, NULL, 3, '2021-10-02', -1, 25, NULL),
(401, 37, NULL, 8, NULL, 2, '2021-09-23', -2, 40, NULL),
(402, 33, NULL, 12, NULL, 3, '2021-09-12', -1, 47.5, NULL),
(403, 38, NULL, 12, NULL, 2, '2021-08-24', -1, 30, NULL),
(404, 22, NULL, 15, NULL, 3, '2021-08-13', -2, 100, NULL),
(405, 22, NULL, 19, NULL, 3, '2021-08-08', -1, 50, NULL),
(406, 15, NULL, 3, NULL, 1, '2021-08-01', -2, 80, NULL),
(407, 46, NULL, 17, NULL, 1, '2021-07-22', -3, 135, NULL),
(408, 18, NULL, 8, NULL, 2, '2021-07-18', -2, 80, NULL),
(409, 17, NULL, 9, NULL, 2, '2021-07-15', -2, 50, NULL),
(410, 35, NULL, 5, NULL, 1, '2021-07-13', -2, 30, NULL),
(411, 25, NULL, 4, NULL, 3, '2021-07-02', -3, 120, NULL),
(412, 15, NULL, 7, NULL, 2, '2021-06-27', -2, 80, NULL),
(413, 42, NULL, 9, NULL, 2, '2021-06-07', -2, 35, NULL),
(414, 29, NULL, 18, NULL, 2, '2021-06-04', -1, 20, NULL),
(415, 31, NULL, 5, NULL, 3, '2021-06-04', -3, 75, NULL),
(416, 15, NULL, 2, NULL, 2, '2021-06-02', -1, 40, NULL),
(417, 10, NULL, 10, NULL, 2, '2021-06-02', -3, 450, NULL),
(418, 14, NULL, 15, NULL, 2, '2021-06-01', -1, 30, NULL),
(419, 27, NULL, 14, NULL, 3, '2021-05-31', -1, 10, NULL),
(420, 44, NULL, 3, NULL, 1, '2021-05-29', -3, 75, NULL),
(421, 16, NULL, 9, NULL, 3, '2021-05-26', -3, 75, NULL),
(422, 43, NULL, 19, NULL, 2, '2021-05-24', -2, 25, NULL),
(423, 45, NULL, 13, NULL, 2, '2021-05-05', -3, 60, NULL),
(424, 37, NULL, 20, NULL, 2, '2021-04-08', -1, 20, NULL),
(425, 17, NULL, 19, NULL, 1, '2021-04-05', -3, 75, NULL),
(426, 8, NULL, 10, NULL, 3, '2021-04-03', -3, 225, NULL),
(427, 17, NULL, 2, NULL, 1, '2021-03-24', -3, 75, NULL),
(428, 19, NULL, 3, NULL, 3, '2021-03-23', -3, 150, NULL),
(429, 12, NULL, 13, NULL, 2, '2021-03-14', -2, 90, NULL),
(430, 23, NULL, 6, NULL, 3, '2021-03-08', -1, 75, NULL),
(431, 10, NULL, 2, NULL, 2, '2021-03-05', -2, 300, NULL),
(432, 6, NULL, 8, NULL, 2, '2021-02-27', -3, 75, NULL),
(433, 11, NULL, 6, NULL, 3, '2021-02-20', -1, 40, NULL),
(434, 45, NULL, 5, NULL, 2, '2021-02-20', -2, 40, NULL),
(435, 42, NULL, 2, NULL, 3, '2021-02-11', -1, 17.5, NULL),
(436, 17, NULL, 19, NULL, 2, '2021-02-09', -1, 25, NULL),
(437, 15, NULL, 6, NULL, 1, '2021-02-07', -3, 120, NULL),
(438, 3, NULL, 6, NULL, 1, '2021-01-29', -2, 30, NULL),
(439, 39, NULL, 10, NULL, 1, '2021-01-25', -2, 100, NULL),
(440, 27, NULL, 12, NULL, 2, '2021-01-17', -3, 30, NULL),
(441, 32, NULL, 6, NULL, 2, '2021-01-15', -1, 35, NULL),
(1881, 36, NULL, NULL, NULL, 2, '2021-07-16', 3, 75, 90),
(1880, 4, NULL, NULL, NULL, 1, '2021-02-16', 3, 22.5, 89),
(1879, 16, NULL, NULL, NULL, 2, '2021-09-02', 2, 50, 88),
(1878, 12, NULL, NULL, NULL, 2, '2021-10-27', 3, 135, 87),
(1877, 42, NULL, NULL, NULL, 2, '2021-06-17', 2, 35, 86),
(1876, 34, NULL, NULL, NULL, 3, '2021-06-06', 3, 300, 85),
(1875, 7, NULL, NULL, NULL, 2, '2021-07-24', 3, 37.5, 84),
(1874, 16, NULL, NULL, NULL, 2, '2021-12-18', 1, 25, 83),
(1873, 35, NULL, NULL, NULL, 1, '2021-02-10', 3, 45, 82),
(1872, 24, NULL, NULL, NULL, 2, '2021-09-05', 1, 40, 81),
(1871, 37, NULL, NULL, NULL, 3, '2021-09-24', 2, 40, 80),
(1870, 28, NULL, NULL, NULL, 1, '2021-08-05', 1, 35, 79),
(1869, 24, NULL, NULL, NULL, 2, '2021-12-31', 3, 120, 78),
(1868, 17, NULL, NULL, NULL, 2, '2021-07-16', 2, 50, 77),
(1867, 38, NULL, NULL, NULL, 2, '2021-03-05', 3, 90, 76),
(1866, 17, NULL, NULL, NULL, 1, '2021-04-07', 3, 75, 75),
(1865, 18, NULL, NULL, NULL, 3, '2021-04-08', 3, 120, 74),
(1864, 37, NULL, NULL, NULL, 2, '2021-02-24', 1, 20, 73),
(1863, 5, NULL, NULL, NULL, 2, '2021-06-30', 3, 150, 72),
(1862, 20, NULL, NULL, NULL, 2, '2021-08-27', 1, 50, 71),
(1861, 43, NULL, NULL, NULL, 2, '2021-01-18', 1, 12.5, 70),
(1860, 29, NULL, NULL, NULL, 3, '2021-05-31', 1, 20, 69),
(1859, 42, NULL, NULL, NULL, 1, '2021-07-27', 2, 35, 68),
(1858, 22, NULL, NULL, NULL, 3, '2021-04-06', 3, 150, 67),
(1857, 14, NULL, NULL, NULL, 2, '2021-06-29', 2, 60, 66),
(1856, 10, NULL, NULL, NULL, 2, '2021-02-04', 3, 450, 65),
(1855, 12, NULL, NULL, NULL, 2, '2021-10-19', 3, 135, 64),
(1854, 43, NULL, NULL, NULL, 2, '2021-06-08', 3, 37.5, 63),
(1853, 8, NULL, NULL, NULL, 1, '2021-01-28', 1, 75, 62),
(1852, 20, NULL, NULL, NULL, 2, '2021-09-04', 1, 50, 61);

-- --------------------------------------------------------

--
-- Table structure for table `orderline`
--

DROP TABLE IF EXISTS `orderline`;
CREATE TABLE IF NOT EXISTS `orderline` (
  `line_id` int NOT NULL AUTO_INCREMENT,
  `order_id` int NOT NULL,
  `prod_id` int NOT NULL,
  `quantity` int NOT NULL,
  `price` float NOT NULL,
  `promo_percent` float NOT NULL,
  `line_total` float NOT NULL,
  `camp_id` int DEFAULT NULL,
  PRIMARY KEY (`line_id`),
  KEY `order_id` (`order_id`),
  KEY `prod_id` (`prod_id`),
  KEY `camp_id` (`camp_id`)
) ENGINE=MyISAM AUTO_INCREMENT=301 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `orderline`
--

INSERT INTO `orderline` (`line_id`, `order_id`, `prod_id`, `quantity`, `price`, `promo_percent`, `line_total`, `camp_id`) VALUES
(249, 49, 40, 1, 90, 0, 90, NULL),
(250, 50, 24, 3, 80, 0, 240, NULL),
(251, 1, 26, 3, 50, 0, 150, NULL),
(252, 2, 14, 3, 60, 0, 180, NULL),
(253, 3, 34, 2, 200, 0, 400, NULL),
(254, 4, 35, 3, 30, 0, 90, NULL),
(255, 5, 4, 3, 15, 0, 45, NULL),
(256, 6, 31, 1, 50, 0, 50, NULL),
(257, 7, 6, 1, 50, 0, 50, NULL),
(258, 8, 3, 2, 30, 0, 60, NULL),
(259, 9, 33, 1, 95, 0, 95, NULL),
(260, 10, 44, 3, 50, 0, 150, NULL),
(261, 11, 45, 3, 40, 0, 120, NULL),
(262, 12, 7, 3, 25, 0, 75, NULL),
(263, 13, 32, 2, 70, 0, 140, NULL),
(264, 14, 14, 3, 60, 0, 180, NULL),
(265, 15, 1, 1, 100, 0, 100, NULL),
(266, 16, 28, 3, 70, 0, 210, NULL),
(267, 17, 44, 1, 50, 0, 50, NULL),
(268, 18, 2, 2, 50, 0, 100, NULL),
(269, 19, 24, 2, 80, 0, 160, NULL),
(270, 20, 33, 1, 95, 0, 95, NULL),
(271, 21, 28, 2, 70, 0, 140, NULL),
(272, 22, 25, 1, 80, 0, 80, NULL),
(273, 23, 22, 2, 100, 0, 200, NULL),
(274, 24, 8, 2, 150, 0, 300, NULL),
(275, 25, 43, 3, 25, 0, 75, NULL),
(276, 26, 6, 2, 50, 0, 100, NULL),
(277, 27, 38, 3, 60, 0, 180, NULL),
(278, 28, 46, 1, 90, 0, 90, NULL),
(279, 29, 17, 1, 50, 0, 50, NULL),
(280, 30, 46, 3, 90, 0, 270, NULL),
(281, 31, 17, 2, 50, 0, 100, NULL),
(282, 32, 24, 2, 80, 0, 160, NULL),
(283, 33, 2, 2, 50, 0, 100, NULL),
(284, 34, 10, 3, 300, 0.3, 630, 5),
(285, 35, 38, 2, 60, 0, 120, NULL),
(286, 36, 1, 3, 100, 0, 300, NULL),
(287, 37, 20, 3, 100, 0, 300, NULL),
(288, 38, 10, 1, 300, 0.3, 210, 5),
(289, 39, 24, 1, 80, 0, 80, NULL),
(290, 40, 33, 1, 95, 0, 95, NULL),
(291, 41, 36, 3, 50, 0, 150, NULL),
(292, 42, 1, 3, 100, 0, 300, NULL),
(293, 43, 34, 2, 200, 0, 400, NULL),
(294, 44, 46, 1, 90, 0, 90, NULL),
(295, 45, 43, 3, 25, 0, 75, NULL),
(296, 46, 18, 3, 80, 0, 240, NULL),
(297, 47, 26, 2, 50, 0, 100, NULL),
(298, 48, 7, 1, 25, 0, 25, NULL),
(299, 49, 26, 1, 50, 0, 50, NULL),
(300, 50, 18, 2, 80, 0, 160, NULL),
(248, 48, 21, 1, 80, 0, 80, NULL),
(247, 47, 41, 2, 25, 0, 50, NULL),
(246, 46, 23, 3, 150, 0, 450, NULL),
(245, 45, 47, 3, 150, 0, 450, NULL),
(244, 44, 24, 3, 80, 0, 240, NULL),
(243, 43, 14, 1, 60, 0, 60, NULL),
(242, 42, 23, 1, 150, 0, 150, NULL),
(241, 41, 29, 1, 40, 0, 40, NULL),
(240, 40, 25, 3, 80, 0, 240, NULL),
(239, 39, 42, 3, 35, 0, 105, NULL),
(238, 38, 37, 2, 40, 0, 80, NULL),
(237, 37, 27, 3, 20, 0, 60, NULL),
(236, 36, 5, 1, 100, 0, 100, NULL),
(235, 35, 11, 1, 80, 0, 80, NULL),
(234, 34, 37, 3, 40, 0, 120, NULL),
(233, 33, 36, 3, 50, 0, 150, NULL),
(232, 32, 14, 1, 60, 0, 60, NULL),
(231, 31, 8, 1, 150, 0, 150, NULL),
(230, 30, 5, 3, 100, 0, 300, NULL),
(229, 29, 47, 3, 150, 0, 450, NULL),
(228, 28, 23, 3, 150, 0, 450, NULL),
(227, 27, 34, 2, 200, 0, 400, NULL),
(226, 26, 43, 3, 25, 0, 75, NULL),
(225, 25, 27, 3, 20, 0.1, 54, 3),
(224, 24, 29, 2, 40, 0, 80, NULL),
(223, 23, 29, 3, 40, 0, 120, NULL),
(222, 22, 46, 1, 90, 0, 90, NULL),
(221, 21, 27, 3, 20, 0.1, 54, 3),
(220, 20, 44, 1, 50, 0, 50, NULL),
(219, 19, 14, 3, 60, 0, 180, NULL),
(218, 18, 46, 1, 90, 0, 90, NULL),
(217, 17, 10, 2, 300, 0.3, 420, 5),
(216, 16, 8, 1, 150, 0, 150, NULL),
(215, 15, 46, 2, 90, 0, 180, NULL),
(214, 14, 6, 1, 50, 0, 50, NULL),
(213, 13, 15, 2, 80, 0, 160, NULL),
(212, 12, 26, 2, 50, 0, 100, NULL),
(211, 11, 39, 2, 100, 0, 200, NULL),
(210, 10, 38, 3, 60, 0, 180, NULL),
(209, 9, 12, 2, 90, 0, 180, NULL),
(208, 8, 32, 3, 70, 0, 210, NULL),
(207, 7, 3, 2, 30, 0, 60, NULL),
(206, 6, 34, 2, 200, 0, 400, NULL),
(205, 5, 29, 3, 40, 0, 120, NULL),
(204, 4, 8, 3, 150, 0, 450, NULL),
(203, 3, 31, 2, 50, 0, 100, NULL),
(202, 2, 10, 3, 300, 0, 900, NULL),
(201, 1, 43, 1, 25, 0, 25, NULL),
(200, 50, 26, 2, 50, 0, 100, NULL),
(199, 49, 38, 1, 60, 0, 60, NULL),
(198, 48, 21, 3, 80, 0, 240, NULL),
(197, 47, 42, 2, 35, 0, 70, NULL),
(196, 46, 42, 1, 35, 0, 35, NULL),
(195, 45, 42, 3, 35, 0, 105, NULL),
(194, 44, 33, 2, 95, 0, 190, NULL),
(193, 43, 24, 2, 80, 0, 160, NULL),
(192, 42, 13, 1, 200, 0, 200, NULL),
(191, 41, 21, 2, 80, 0, 160, NULL),
(190, 40, 37, 2, 40, 0, 80, NULL),
(189, 39, 20, 1, 100, 0, 100, NULL),
(188, 38, 38, 3, 60, 0, 180, NULL),
(187, 37, 14, 1, 60, 0, 60, NULL),
(186, 36, 20, 1, 100, 0, 100, NULL),
(185, 35, 1, 1, 100, 0, 100, NULL),
(184, 34, 25, 3, 80, 0, 240, NULL),
(183, 33, 5, 3, 100, 0, 300, NULL),
(182, 32, 7, 1, 25, 0, 25, NULL),
(181, 31, 2, 2, 50, 0, 100, NULL),
(180, 30, 22, 2, 100, 0, 200, NULL),
(179, 29, 17, 3, 50, 0, 150, NULL),
(178, 28, 7, 1, 25, 0, 25, NULL),
(177, 27, 41, 3, 25, 0, 75, NULL),
(176, 26, 41, 2, 25, 0, 50, NULL),
(175, 25, 27, 2, 20, 0.1, 36, 3),
(174, 24, 46, 1, 90, 0, 90, NULL),
(173, 23, 12, 3, 90, 0, 270, NULL),
(172, 22, 46, 3, 90, 0, 270, NULL),
(171, 21, 29, 1, 40, 0, 40, NULL),
(170, 20, 30, 3, 60, 0, 180, NULL),
(169, 19, 13, 2, 200, 0, 400, NULL),
(168, 18, 8, 3, 150, 0, 450, NULL),
(167, 17, 32, 1, 70, 0, 70, NULL),
(166, 16, 18, 3, 80, 0, 240, NULL),
(165, 15, 27, 3, 20, 0.1, 54, 3),
(164, 14, 9, 1, 200, 0, 200, NULL),
(163, 13, 28, 1, 70, 0, 70, NULL),
(162, 12, 32, 3, 70, 0, 210, NULL),
(161, 11, 42, 3, 35, 0, 105, NULL),
(160, 10, 37, 2, 40, 0, 80, NULL),
(159, 9, 16, 1, 50, 0, 50, NULL),
(158, 8, 17, 3, 50, 0, 150, NULL),
(157, 7, 44, 3, 50, 0, 150, NULL),
(156, 6, 5, 2, 100, 0, 200, NULL),
(155, 5, 18, 3, 80, 0, 240, NULL),
(154, 4, 2, 2, 50, 0, 100, NULL),
(153, 3, 40, 1, 90, 0, 90, NULL),
(152, 2, 41, 3, 25, 0, 75, NULL),
(151, 1, 36, 3, 50, 0, 150, NULL),
(150, 50, 16, 1, 50, 0, 50, NULL),
(149, 49, 4, 3, 15, 0, 45, NULL),
(148, 48, 23, 3, 150, 0, 450, NULL),
(147, 47, 32, 2, 70, 0, 140, NULL),
(146, 46, 19, 2, 100, 0, 200, NULL),
(145, 45, 13, 2, 200, 0, 400, NULL),
(144, 44, 9, 3, 200, 0, 600, NULL),
(143, 43, 23, 1, 150, 0, 150, NULL),
(142, 42, 42, 3, 35, 0, 105, NULL),
(141, 41, 28, 1, 70, 0, 70, NULL),
(140, 40, 41, 2, 25, 0, 50, NULL),
(139, 39, 16, 2, 50, 0, 100, NULL),
(138, 38, 22, 2, 100, 0, 200, NULL),
(137, 37, 6, 2, 50, 0, 100, NULL),
(136, 36, 20, 3, 100, 0, 300, NULL),
(135, 35, 11, 1, 80, 0, 80, NULL),
(134, 34, 33, 2, 95, 0, 190, NULL),
(133, 33, 24, 1, 80, 0, 80, NULL),
(132, 32, 27, 3, 20, 0, 60, NULL),
(131, 31, 10, 1, 300, 0.3, 210, 5),
(130, 30, 14, 2, 60, 0, 120, NULL),
(129, 29, 6, 1, 50, 0, 50, NULL),
(128, 28, 11, 2, 80, 0, 160, NULL),
(127, 27, 25, 2, 80, 0, 160, NULL),
(126, 26, 9, 1, 200, 0, 200, NULL),
(125, 25, 23, 3, 150, 0, 450, NULL),
(124, 24, 47, 1, 150, 0, 150, NULL),
(123, 23, 4, 2, 15, 0, 30, NULL),
(122, 22, 22, 1, 100, 0, 100, NULL),
(121, 21, 8, 1, 150, 0, 150, NULL),
(120, 20, 40, 2, 90, 0, 180, NULL),
(119, 19, 38, 1, 60, 0, 60, NULL),
(118, 18, 3, 3, 30, 0, 90, NULL),
(117, 17, 29, 2, 40, 0, 80, NULL),
(116, 16, 10, 1, 300, 0.3, 210, 5),
(115, 15, 9, 3, 200, 0, 600, NULL),
(114, 14, 44, 2, 50, 0, 100, NULL),
(113, 13, 12, 2, 90, 0, 180, NULL),
(112, 12, 23, 1, 150, 0, 150, NULL),
(111, 11, 37, 3, 40, 0, 120, NULL),
(110, 10, 18, 3, 80, 0, 240, NULL),
(109, 9, 4, 3, 15, 0, 45, NULL),
(108, 8, 37, 1, 40, 0, 40, NULL),
(107, 7, 45, 3, 40, 0, 120, NULL),
(106, 6, 45, 3, 40, 0, 120, NULL),
(105, 5, 3, 3, 30, 0, 90, NULL),
(104, 4, 23, 2, 150, 0, 300, NULL),
(103, 3, 32, 2, 70, 0, 140, NULL),
(102, 2, 28, 2, 70, 0, 140, NULL),
(101, 1, 21, 1, 80, 0, 80, NULL),
(100, 50, 24, 3, 80, 0, 240, NULL),
(99, 49, 11, 1, 80, 0, 80, NULL),
(98, 48, 19, 2, 100, 0, 200, NULL),
(97, 47, 31, 3, 50, 0, 150, NULL),
(96, 46, 28, 1, 70, 0, 70, NULL),
(95, 45, 44, 3, 50, 0, 150, NULL),
(94, 44, 45, 2, 40, 0, 80, NULL),
(93, 43, 35, 1, 30, 0, 30, NULL),
(92, 42, 25, 1, 80, 0, 80, NULL),
(91, 41, 31, 1, 50, 0, 50, NULL),
(90, 40, 8, 1, 150, 0, 150, NULL),
(89, 39, 14, 3, 60, 0, 180, NULL),
(88, 38, 22, 3, 100, 0, 300, NULL),
(87, 37, 31, 2, 50, 0, 100, NULL),
(86, 36, 1, 1, 100, 0, 100, NULL),
(85, 35, 42, 2, 35, 0, 70, NULL),
(84, 34, 7, 3, 25, 0, 75, NULL),
(83, 33, 15, 3, 80, 0, 240, NULL),
(82, 32, 28, 1, 70, 0, 70, NULL),
(81, 31, 8, 2, 150, 0, 300, NULL),
(80, 30, 37, 2, 40, 0, 80, NULL),
(79, 29, 23, 2, 150, 0, 300, NULL),
(78, 28, 24, 3, 80, 0, 240, NULL),
(77, 27, 34, 3, 200, 0, 600, NULL),
(76, 26, 17, 3, 50, 0, 150, NULL),
(75, 25, 27, 1, 20, 0.1, 18, 3),
(74, 24, 47, 2, 150, 0, 300, NULL),
(73, 23, 3, 2, 30, 0, 60, NULL),
(72, 22, 10, 1, 300, 0.3, 210, 5),
(71, 21, 20, 2, 100, 0, 200, NULL),
(70, 20, 40, 1, 90, 0, 90, NULL),
(69, 19, 26, 1, 50, 0, 50, NULL),
(68, 18, 37, 2, 40, 0, 80, NULL),
(67, 17, 23, 1, 150, 0, 150, NULL),
(66, 16, 22, 3, 100, 0, 300, NULL),
(65, 15, 23, 3, 150, 0, 450, NULL),
(64, 14, 34, 2, 200, 0, 400, NULL),
(63, 13, 21, 1, 80, 0, 80, NULL),
(62, 12, 6, 2, 50, 0, 100, NULL),
(61, 11, 43, 3, 25, 0, 75, NULL),
(60, 10, 25, 1, 80, 0, 80, NULL),
(59, 9, 42, 3, 35, 0, 105, NULL),
(58, 8, 13, 2, 200, 0, 400, NULL),
(57, 7, 19, 2, 100, 0, 200, NULL),
(56, 6, 35, 1, 30, 0, 30, NULL),
(55, 5, 9, 1, 200, 0, 200, NULL),
(54, 4, 46, 3, 90, 0, 270, NULL),
(53, 3, 8, 1, 150, 0, 150, NULL),
(52, 2, 1, 3, 100, 0, 300, NULL),
(51, 1, 42, 1, 35, 0, 35, NULL),
(50, 50, 31, 2, 50, 0, 100, NULL),
(49, 49, 4, 1, 15, 0, 15, NULL),
(48, 48, 34, 1, 200, 0, 200, NULL),
(47, 47, 7, 3, 25, 0, 75, NULL),
(46, 46, 26, 2, 50, 0, 100, NULL),
(45, 45, 36, 1, 50, 0, 50, NULL),
(44, 44, 12, 3, 90, 0, 270, NULL),
(43, 43, 22, 3, 100, 0, 300, NULL),
(42, 42, 6, 1, 50, 0, 50, NULL),
(41, 41, 37, 2, 40, 0, 80, NULL),
(40, 40, 33, 1, 95, 0, 95, NULL),
(39, 39, 38, 1, 60, 0, 60, NULL),
(38, 38, 22, 2, 100, 0, 200, NULL),
(37, 37, 22, 1, 100, 0, 100, NULL),
(36, 36, 15, 2, 80, 0, 160, NULL),
(35, 35, 46, 3, 90, 0, 270, NULL),
(34, 34, 18, 2, 80, 0, 160, NULL),
(33, 33, 17, 2, 50, 0, 100, NULL),
(32, 32, 35, 2, 30, 0, 60, NULL),
(31, 31, 25, 3, 80, 0, 240, NULL),
(30, 30, 15, 2, 80, 0, 160, NULL),
(29, 29, 42, 2, 35, 0, 70, NULL),
(28, 28, 29, 1, 40, 0, 40, NULL),
(27, 27, 31, 3, 50, 0, 150, NULL),
(26, 26, 15, 1, 80, 0, 80, NULL),
(25, 25, 10, 3, 300, 0.3, 630, 5),
(24, 24, 14, 1, 60, 0, 60, NULL),
(23, 23, 27, 1, 20, 0.1, 18, 3),
(22, 22, 44, 3, 50, 0, 150, NULL),
(21, 21, 16, 3, 50, 0, 150, NULL),
(20, 20, 43, 2, 25, 0, 50, NULL),
(19, 19, 45, 3, 40, 0, 120, NULL),
(18, 18, 37, 1, 40, 0, 40, NULL),
(17, 17, 17, 3, 50, 0, 150, NULL),
(16, 16, 8, 3, 150, 0, 450, NULL),
(15, 15, 17, 3, 50, 0, 150, NULL),
(14, 14, 19, 3, 100, 0, 300, NULL),
(13, 13, 12, 2, 90, 0, 180, NULL),
(12, 12, 23, 1, 150, 0, 150, NULL),
(11, 11, 10, 2, 300, 0, 600, NULL),
(10, 10, 6, 3, 50, 0, 150, NULL),
(9, 9, 11, 1, 80, 0, 80, NULL),
(8, 8, 45, 2, 40, 0, 80, NULL),
(7, 7, 42, 1, 35, 0, 35, NULL),
(6, 6, 17, 1, 50, 0, 50, NULL),
(5, 5, 15, 3, 80, 0, 240, NULL),
(4, 4, 3, 2, 30, 0, 60, NULL),
(3, 3, 39, 2, 100, 0, 200, NULL),
(2, 2, 27, 3, 20, 0.1, 54, 3),
(1, 1, 32, 1, 70, 0, 70, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `order_pmt`
--

DROP TABLE IF EXISTS `order_pmt`;
CREATE TABLE IF NOT EXISTS `order_pmt` (
  `pmt_id` int NOT NULL AUTO_INCREMENT,
  `card_id` int NOT NULL,
  `order_id` int NOT NULL,
  `pmt_date` date NOT NULL,
  `pmt_amt` float NOT NULL,
  PRIMARY KEY (`pmt_id`),
  KEY `card_id` (`card_id`),
  KEY `order_id` (`order_id`)
) ENGINE=MyISAM AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `order_pmt`
--

INSERT INTO `order_pmt` (`pmt_id`, `card_id`, `order_id`, `pmt_date`, `pmt_amt`) VALUES
(1, 1, 42, '2021-10-02', 898.67),
(2, 2, 7, '2021-02-11', 621.89),
(3, 2, 11, '2021-03-05', 1239.51),
(4, 2, 15, '2021-03-24', 1542.99),
(5, 2, 26, '2021-06-02', 661.93),
(6, 2, 46, '2021-10-24', 1114.53),
(7, 3, 14, '2021-03-23', 1235.32),
(8, 3, 22, '2021-05-29', 917.78),
(9, 3, 36, '2021-08-01', 1074.23),
(10, 3, 48, '2021-11-01', 1200.74),
(11, 4, 31, '2021-07-02', 1110.25),
(12, 5, 8, '2021-02-20', 948.75),
(13, 5, 27, '2021-06-04', 1576.06),
(14, 5, 32, '2021-07-13', 446.69),
(15, 6, 4, '2021-01-29', 1275.97),
(16, 6, 5, '2021-02-07', 953.82),
(17, 6, 9, '2021-02-20', 573.09),
(18, 6, 12, '2021-03-08', 790.95),
(19, 6, 1, '2021-01-15', 516.06),
(20, 7, 30, '2021-06-27', 1147.61),
(21, 7, 43, '2021-10-06', 1111.35),
(22, 8, 10, '2021-02-27', 888.57),
(23, 8, 34, '2021-07-18', 1422.14),
(24, 8, 41, '2021-09-23', 568.18),
(25, 9, 21, '2021-05-26', 747.56),
(26, 9, 29, '2021-06-07', 1081.65),
(27, 9, 33, '2021-07-15', 983.26),
(28, 10, 3, '2021-01-25', 1091.01),
(29, 10, 16, '2021-04-03', 1578.06),
(30, 10, 25, '2021-06-02', 1275.55),
(31, 12, 2, '2021-01-17', 1655.97),
(32, 12, 39, '2021-08-24', 634.52),
(33, 12, 40, '2021-09-12', 720.18),
(34, 13, 13, '2021-03-14', 818.33),
(35, 13, 19, '2021-05-05', 979.46),
(36, 13, 44, '2021-10-15', 1484.86),
(37, 13, 47, '2021-10-31', 593.96),
(38, 14, 23, '2021-05-31', 711.57),
(39, 15, 24, '2021-06-01', 996),
(40, 15, 38, '2021-08-13', 1177.21),
(41, 16, 45, '2021-10-18', 1241.42),
(42, 16, 50, '2021-12-02', 904.97),
(43, 17, 35, '2021-07-22', 725.46),
(44, 18, 28, '2021-06-04', 1024.19),
(45, 19, 6, '2021-02-09', 860.75),
(46, 19, 17, '2021-04-05', 931.93),
(47, 19, 20, '2021-05-24', 651.97),
(48, 19, 37, '2021-08-08', 734.77),
(49, 19, 49, '2021-11-09', 345.04),
(50, 20, 18, '2021-04-08', 869.41);

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
CREATE TABLE IF NOT EXISTS `product` (
  `prod_id` int NOT NULL AUTO_INCREMENT,
  `prod_name` varchar(128) DEFAULT NULL,
  `type` varchar(128) NOT NULL,
  `vendor_id` int NOT NULL,
  `sale_price` float NOT NULL,
  `cost` float NOT NULL,
  PRIMARY KEY (`prod_id`),
  KEY `vendor_id` (`vendor_id`)
) ENGINE=MyISAM AUTO_INCREMENT=48 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`prod_id`, `prod_name`, `type`, `vendor_id`, `sale_price`, `cost`) VALUES
(1, 'Lightweight waterproof coat', 'Outterwear', 6, 100, 50),
(2, 'Cotton pajamas', 'Bottoms', 8, 50, 25),
(3, 'Cotton blouse', 'Tops', 10, 30, 15),
(4, 'Printed tops', 'Tops', 1, 15, 7.5),
(5, 'Peacoat', 'Outterwear', 3, 100, 50),
(6, 'Cardigan', 'Sweaters', 9, 50, 25),
(7, 'Long-sleeved black T-shirt', 'Tops', 10, 25, 12.5),
(8, 'Down vest', 'Outterwear', 4, 150, 75),
(9, 'Black cashmere wrap coat', 'Outterwear', 5, 200, 100),
(10, 'Leather blazer', 'Outterwear', 5, 300, 150),
(11, 'White jeans', 'Bottoms', 8, 80, 40),
(12, 'Flat boots (black or brown)', 'Shoes', 9, 90, 45),
(13, 'Pantsuit', 'Bottoms', 10, 200, 100),
(14, 'Athletic sweatshirt', 'Outterwear', 9, 60, 30),
(15, 'Cropped jacket', 'Outterwear', 3, 80, 40),
(16, 'Convertible strapless bra', 'Underwear', 8, 50, 25),
(17, 'Short-sleeved black T-shirt', 'Tops', 4, 50, 25),
(18, 'Jeans', 'Bottoms', 7, 80, 40),
(19, 'Lightweight cashmere sweater', 'Sweaters', 1, 100, 50),
(20, 'Wool trousers', 'Bottoms', 4, 100, 50),
(21, 'Black heeled booties', 'Shoes', 1, 80, 40),
(22, 'Cashmere hoodie', 'Sweaters', 3, 100, 50),
(23, 'Khaki trench coat', 'Outterwear', 9, 150, 75),
(24, 'One-button blazer', 'Outterwear', 8, 80, 40),
(25, 'Black dress', 'Dresses', 5, 80, 40),
(26, 'Khaki shorts', 'Bottoms', 3, 50, 25),
(27, 'Black tank', 'Tops', 6, 20, 10),
(28, 'Capri pants', 'Bottoms', 10, 70, 35),
(29, 'Black turtleneck', 'Tops', 4, 40, 20),
(30, 'Crewneck sweater', 'Sweaters', 5, 60, 30),
(31, 'Flat leather sandals', 'Shoes', 5, 50, 25),
(32, 'Black cashmere wrap', 'Sweaters', 6, 70, 35),
(33, 'Lightweight waterproof raincoat', 'Outterwear', 7, 95, 47.5),
(34, 'The tuxedo shirt', 'Tops', 10, 200, 100),
(35, 'Short-sleeved white T-shirt', 'Tops', 7, 30, 15),
(36, 'Fleece vest', 'Outterwear', 3, 50, 25),
(37, 'Built-in bra tank', 'Tops', 5, 40, 20),
(38, 'Inverted pleat skirt', 'Bottoms', 1, 60, 30),
(39, 'Winter coat', 'Outterwear', 5, 100, 50),
(40, 'Metallic evening shoes', 'Shoes', 2, 90, 45),
(41, 'Ribbed cotton tank', 'Tops', 2, 25, 12.5),
(42, 'Gray flannel pants', 'Bottoms', 8, 35, 17.5),
(43, 'Long-sleeved white T-shirt', 'Tops', 10, 25, 12.5),
(44, 'Cotton printed dress', 'Dresses', 9, 50, 25),
(45, 'Ballet flats (in a neutral or a versatile red)', 'Shoes', 4, 40, 20),
(46, 'Dark-wash jeans', 'Bottoms', 10, 90, 45),
(47, 'Strapless dress', 'Dresses', 6, 150, 75);

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
CREATE TABLE IF NOT EXISTS `roles` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(128) NOT NULL,
  `role` varchar(128) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `username` (`username`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `username`, `role`) VALUES
(1, 'bsmith', 'admin'),
(2, 'sdanev', 'customer');

-- --------------------------------------------------------

--
-- Table structure for table `shipping`
--

DROP TABLE IF EXISTS `shipping`;
CREATE TABLE IF NOT EXISTS `shipping` (
  `ship_id` int NOT NULL AUTO_INCREMENT,
  `ship_date` date NOT NULL,
  `order_id` int NOT NULL,
  `delivery_date` date NOT NULL,
  `cost` float NOT NULL,
  PRIMARY KEY (`ship_id`),
  KEY `order_id` (`order_id`)
) ENGINE=MyISAM AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `shipping`
--

INSERT INTO `shipping` (`ship_id`, `ship_date`, `order_id`, `delivery_date`, `cost`) VALUES
(1, '2021-01-18', 2, '2021-01-21', 6.97),
(2, '2021-01-26', 3, '2021-01-29', 11.01),
(3, '2021-01-30', 4, '2021-02-02', 5.97),
(4, '2021-02-08', 5, '2021-02-11', 18.82),
(5, '2021-02-10', 6, '2021-02-13', 10.75),
(6, '2021-02-12', 7, '2021-02-15', 6.89),
(7, '2021-02-21', 8, '2021-02-24', 8.75),
(8, '2021-02-21', 9, '2021-02-24', 18.09),
(9, '2021-02-28', 10, '2021-03-03', 8.57),
(10, '2021-03-06', 11, '2021-03-09', 19.51),
(11, '2021-03-09', 12, '2021-03-12', 5.95),
(12, '2021-03-15', 13, '2021-03-18', 8.33),
(13, '2021-03-24', 14, '2021-03-27', 5.32),
(14, '2021-03-25', 15, '2021-03-28', 8.99),
(15, '2021-04-04', 16, '2021-04-07', 18.06),
(16, '2021-04-06', 17, '2021-04-09', 11.93),
(17, '2021-04-09', 18, '2021-04-12', 19.41),
(18, '2021-05-06', 19, '2021-05-09', 9.46),
(19, '2021-05-25', 20, '2021-05-28', 6.97),
(20, '2021-05-27', 21, '2021-05-30', 13.56),
(21, '2021-05-30', 22, '2021-06-02', 17.78),
(22, '2021-06-01', 23, '2021-06-04', 13.57),
(23, '2021-06-02', 24, '2021-06-05', 16),
(24, '2021-06-03', 25, '2021-06-06', 12.55),
(25, '2021-06-03', 26, '2021-06-06', 6.93),
(26, '2021-06-05', 27, '2021-06-08', 11.06),
(27, '2021-06-05', 28, '2021-06-08', 19.19),
(28, '2021-06-08', 29, '2021-06-11', 11.65),
(29, '2021-06-28', 30, '2021-07-01', 17.61),
(30, '2021-07-03', 31, '2021-07-06', 10.25),
(31, '2021-07-14', 32, '2021-07-17', 11.69),
(32, '2021-07-16', 33, '2021-07-19', 13.26),
(33, '2021-07-19', 34, '2021-07-22', 7.14),
(34, '2021-07-23', 35, '2021-07-26', 5.46),
(35, '2021-08-02', 36, '2021-08-05', 14.23),
(36, '2021-08-09', 37, '2021-08-12', 14.77),
(37, '2021-08-14', 38, '2021-08-17', 7.21),
(38, '2021-08-25', 39, '2021-08-28', 9.52),
(39, '2021-09-13', 40, '2021-09-16', 10.18),
(40, '2021-09-24', 41, '2021-09-27', 18.18),
(41, '2021-10-03', 42, '2021-10-06', 13.67),
(42, '2021-10-07', 43, '2021-10-10', 11.35),
(43, '2021-10-16', 44, '2021-10-19', 14.86),
(44, '2021-10-19', 45, '2021-10-22', 11.42),
(45, '2021-10-25', 46, '2021-10-28', 19.53),
(46, '2021-11-01', 47, '2021-11-04', 8.96),
(47, '2021-11-02', 48, '2021-11-05', 5.74),
(48, '2021-11-10', 49, '2021-11-13', 5.04),
(49, '2021-12-03', 50, '2021-12-06', 14.97),
(50, '2021-01-16', 1, '2021-01-19', 6.06);

-- --------------------------------------------------------

--
-- Table structure for table `store`
--

DROP TABLE IF EXISTS `store`;
CREATE TABLE IF NOT EXISTS `store` (
  `store_id` int NOT NULL AUTO_INCREMENT,
  `store_address` varchar(128) NOT NULL,
  `store_city` varchar(50) NOT NULL,
  `store_state` varchar(2) NOT NULL,
  PRIMARY KEY (`store_id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `store`
--

INSERT INTO `store` (`store_id`, `store_address`, `store_city`, `store_state`) VALUES
(1, '306 Ridgeway Crossing', 'New York City', 'NY'),
(2, '33801 Hansons Alley', 'Los Angeles', 'CA'),
(3, '4 Oak Place', 'San Diego', 'CA');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `forename` varchar(128) NOT NULL,
  `surname` varchar(128) NOT NULL,
  `username` varchar(128) NOT NULL,
  `password` varchar(128) NOT NULL,
  UNIQUE KEY `username` (`username`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`forename`, `surname`, `username`, `password`) VALUES
('Bill', 'Smith', 'bsmith', '$2y$10$gmEUp7v7yEQHq8zIwvqSaO0t7uDLRqHZhMU5VCjPA99fLs7yMcVz6'),
('Pauline', 'Jones', 'pjones', '$2y$10$Qwu8f.nLRcitUtWOP38.re6a7y6Tg2xc6s6SaXAiBDnS.j7h2x1bG'),
('Selene', 'Danev', 'sdanev', '$2y$10$EdQUSfOSRlQPJ/OMfsVc..mUAda7M8F3kuWHB.c.7Fs90JohLFE0m');

-- --------------------------------------------------------

--
-- Table structure for table `vendor`
--

DROP TABLE IF EXISTS `vendor`;
CREATE TABLE IF NOT EXISTS `vendor` (
  `vendor_id` int NOT NULL AUTO_INCREMENT,
  `vendor_name` varchar(128) NOT NULL,
  `vendor_address` varchar(128) NOT NULL,
  `vendor_city` varchar(50) NOT NULL,
  `vendor_state` varchar(2) NOT NULL,
  PRIMARY KEY (`vendor_id`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `vendor`
--

INSERT INTO `vendor` (`vendor_id`, `vendor_name`, `vendor_address`, `vendor_city`, `vendor_state`) VALUES
(1, 'Zoonoodle', '30 Clemons Pass', 'Salt Lake City', 'UT'),
(2, 'Rooxo', '44547 Heath Park', 'Arlington', 'VA'),
(3, 'Wikivu', '61564 Riverside Point', 'Atlanta', 'GA'),
(4, 'Flashpoint', '7629 Butterfield Hill', 'Oklahoma City', 'OK'),
(5, 'Youopia', '17501 Corscot Road', 'Tempe', 'AZ'),
(6, 'Tagpad', '7 Lukken Center', 'Richmond', 'VA'),
(7, 'Browsedrive', '34 Farragut Circle', 'Montgomery', 'AL'),
(8, 'Devpulse', '8 Banding Place', 'Oakland', 'CA'),
(9, 'Aimbo', '1 Granby Plaza', 'Harrisburg', 'PA'),
(10, 'Youspan', '7 Truax Plaza', 'San Jose', 'CA');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
