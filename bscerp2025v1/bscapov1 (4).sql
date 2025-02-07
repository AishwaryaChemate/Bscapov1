-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 28, 2025 at 02:04 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `bscapov1`
--

-- --------------------------------------------------------

--
-- Table structure for table `country`
--

CREATE TABLE `country` (
  `country_id` int(11) NOT NULL,
  `country_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `country`
--

INSERT INTO `country` (`country_id`, `country_name`) VALUES
(1, 'Afghanistan'),
(2, 'Albania'),
(3, 'Algeria'),
(4, 'Andorra'),
(5, 'Angola'),
(6, 'Antigua and Barbuda'),
(7, 'Argentina'),
(8, 'Armenia'),
(9, 'Australia'),
(10, 'Austria'),
(11, 'Azerbaijan'),
(12, 'Bahamas'),
(13, 'Bahrain'),
(14, 'Bangladesh'),
(15, 'Barbados'),
(16, 'Belarus'),
(17, 'Belgium'),
(18, 'Belize'),
(19, 'Benin'),
(20, 'Bhutan'),
(21, 'Bolivia'),
(22, 'Bosnia and Herzegovina'),
(23, 'Botswana'),
(24, 'Brazil'),
(25, 'Brunei'),
(26, 'Bulgaria'),
(27, 'Burkina Faso'),
(28, 'Burundi'),
(29, 'Cabo Verde'),
(30, 'Cambodia'),
(31, 'Cameroon'),
(32, 'Canada'),
(33, 'Central African Republic'),
(34, 'Chad'),
(35, 'Chile'),
(36, 'China'),
(37, 'Colombia'),
(38, 'Comoros'),
(39, 'Congo (Congo-Brazzaville)'),
(40, 'Costa Rica'),
(41, 'Croatia'),
(42, 'Cuba'),
(43, 'Cyprus'),
(44, 'Czechia (Czech Republic)'),
(45, 'Denmark'),
(46, 'Djibouti'),
(47, 'Dominica'),
(48, 'Dominican Republic'),
(49, 'Ecuador'),
(50, 'Egypt'),
(51, 'El Salvador'),
(52, 'Equatorial Guinea'),
(53, 'Eritrea'),
(54, 'Estonia'),
(55, 'Eswatini (fmr. \"Swaziland\")'),
(56, 'Ethiopia'),
(57, 'Fiji'),
(58, 'Finland'),
(59, 'France'),
(60, 'Gabon'),
(61, 'Gambia'),
(62, 'Georgia'),
(63, 'Germany'),
(64, 'Ghana'),
(65, 'Greece'),
(66, 'Grenada'),
(67, 'Guatemala'),
(68, 'Guinea'),
(69, 'Guinea-Bissau'),
(70, 'Guyana'),
(71, 'Haiti'),
(72, 'Holy See'),
(73, 'Honduras'),
(74, 'Hungary'),
(75, 'Iceland'),
(76, 'India'),
(77, 'Indonesia'),
(78, 'Iran'),
(79, 'Iraq'),
(80, 'Ireland'),
(81, 'Israel'),
(82, 'Italy'),
(83, 'Jamaica'),
(84, 'Japan'),
(85, 'Jordan'),
(86, 'Kazakhstan'),
(87, 'Kenya'),
(88, 'Kiribati'),
(89, 'Korea (North)'),
(90, 'Korea (South)'),
(91, 'Kosovo'),
(92, 'Kuwait'),
(93, 'Kyrgyzstan'),
(94, 'Laos'),
(95, 'Latvia'),
(96, 'Lebanon'),
(97, 'Lesotho'),
(98, 'Liberia'),
(99, 'Libya'),
(100, 'Liechtenstein'),
(101, 'Lithuania'),
(102, 'Luxembourg'),
(103, 'Madagascar'),
(104, 'Malawi'),
(105, 'Malaysia'),
(106, 'Maldives'),
(107, 'Mali'),
(108, 'Malta'),
(109, 'Marshall Islands'),
(110, 'Mauritania'),
(111, 'Mauritius'),
(112, 'Mexico'),
(113, 'Micronesia'),
(114, 'Moldova'),
(115, 'Monaco'),
(116, 'Mongolia'),
(117, 'Montenegro'),
(118, 'Morocco'),
(119, 'Mozambique'),
(120, 'Myanmar (formerly Burma)'),
(121, 'Namibia'),
(122, 'Nauru'),
(123, 'Nepal'),
(124, 'Netherlands'),
(125, 'New Zealand'),
(126, 'Nicaragua'),
(127, 'Niger'),
(128, 'Nigeria'),
(129, 'North Macedonia (formerly Macedonia)'),
(130, 'Norway'),
(131, 'Oman'),
(132, 'Pakistan'),
(133, 'Palau'),
(134, 'Palestine State'),
(135, 'Panama'),
(136, 'Papua New Guinea'),
(137, 'Paraguay'),
(138, 'Peru'),
(139, 'Philippines'),
(140, 'Poland'),
(141, 'Portugal'),
(142, 'Qatar'),
(143, 'Romania'),
(144, 'Russia'),
(145, 'Rwanda'),
(146, 'Saint Kitts and Nevis'),
(147, 'Saint Lucia'),
(148, 'Saint Vincent and the Grenadines'),
(149, 'Samoa'),
(150, 'San Marino'),
(151, 'Sao Tome and Principe'),
(152, 'Saudi Arabia'),
(153, 'Senegal'),
(154, 'Serbia'),
(155, 'Seychelles'),
(156, 'Sierra Leone'),
(157, 'Singapore'),
(158, 'Slovakia'),
(159, 'Slovenia'),
(160, 'Solomon Islands'),
(161, 'Somalia'),
(162, 'South Africa'),
(163, 'South Sudan'),
(164, 'Spain'),
(165, 'Sri Lanka'),
(166, 'Sudan'),
(167, 'Suriname'),
(168, 'Sweden'),
(169, 'Switzerland'),
(170, 'Syria'),
(171, 'Tajikistan'),
(172, 'Tanzania'),
(173, 'Thailand'),
(174, 'Timor-Leste'),
(175, 'Togo'),
(176, 'Tonga'),
(177, 'Trinidad and Tobago'),
(178, 'Tunisia'),
(179, 'Turkey'),
(180, 'Turkmenistan'),
(181, 'Tuvalu'),
(182, 'Uganda'),
(183, 'Ukraine'),
(184, 'United Arab Emirates'),
(185, 'United Kingdom'),
(186, 'United States of America'),
(187, 'Uruguay'),
(188, 'Uzbekistan'),
(189, 'Vanuatu'),
(190, 'Venezuela'),
(191, 'Vietnam'),
(192, 'Yemen'),
(193, 'Zambia'),
(194, 'Zimbabwe');

-- --------------------------------------------------------

--
-- Table structure for table `days_supply`
--

CREATE TABLE `days_supply` (
  `sr_no` int(11) NOT NULL,
  `product` varchar(20) NOT NULL,
  `plant` varchar(20) NOT NULL,
  `qty` int(11) NOT NULL,
  `buom` varchar(10) NOT NULL,
  `date_submitted` date NOT NULL,
  `requirement_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `forecast`
--

CREATE TABLE `forecast` (
  `sr_no` int(11) NOT NULL,
  `product` char(15) NOT NULL,
  `plant` char(4) NOT NULL,
  `requirement_date` date NOT NULL,
  `qty` int(10) NOT NULL,
  `buom` char(4) DEFAULT NULL,
  `date_submitted` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `forecast`
--

INSERT INTO `forecast` (`sr_no`, `product`, `plant`, `requirement_date`, `qty`, `buom`, `date_submitted`) VALUES
(120, 'FG01', 'DC01', '0000-00-00', 70, NULL, '2025-01-24'),
(121, 'FG01', 'DC01', '0000-00-00', 26, NULL, '2025-01-31'),
(122, 'FG01', 'DC01', '0000-00-00', 24, NULL, '2025-01-03'),
(123, 'FG01', 'DC01', '0000-00-00', 28, NULL, '2025-01-10'),
(124, 'FG01', 'DC01', '0000-00-00', 29, NULL, '2025-01-17'),
(125, 'FG01', 'DC01', '0000-00-00', 28, NULL, '2024-12-27'),
(126, 'FG01', 'DC01', '0000-00-00', 28, NULL, '2025-02-07'),
(127, 'FG01', 'DC01', '0000-00-00', 39, NULL, '2025-02-14'),
(144, 'FG01', 'DC01', '0000-00-00', 47, NULL, '2025-02-21'),
(145, 'FG01', 'DC01', '0000-00-00', 55, NULL, '2025-02-28'),
(150, 'FG01', 'DC02', '0000-00-00', 23, NULL, '2025-01-24'),
(151, 'FG01', 'DC02', '0000-00-00', 31, NULL, '2025-01-31'),
(152, 'FG01', 'DC02', '0000-00-00', 39, NULL, '2025-02-07'),
(185, 'FG01', 'PL01', '0000-00-00', 1000, NULL, '2025-01-31'),
(186, 'FG01', 'PL01', '0000-00-00', 100, NULL, '2025-02-07'),
(187, 'FG01', 'PL01', '0000-00-00', 39, NULL, '2025-02-14'),
(188, 'FG01', 'PL01', '0000-00-00', 47, NULL, '2025-02-21'),
(189, 'FG01', 'DC01', '0000-00-00', 67, NULL, '2025-03-07'),
(190, 'FG01', 'DC01', '0000-00-00', 28, NULL, '2025-03-21'),
(191, 'FG01', 'DC01', '0000-00-00', 23, NULL, '2025-03-28'),
(192, 'FG01', 'DC01', '0000-00-00', 43, NULL, '2025-04-04'),
(193, 'FG01', 'DC01', '0000-00-00', 12, NULL, '2025-04-11'),
(194, 'FG01', 'DC01', '0000-00-00', 675, NULL, '2025-04-18');

-- --------------------------------------------------------

--
-- Table structure for table `indian_states`
--

CREATE TABLE `indian_states` (
  `id` int(11) NOT NULL,
  `state_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `indian_states`
--

INSERT INTO `indian_states` (`id`, `state_name`) VALUES
(1, 'Andhra Pradesh'),
(2, 'Arunachal Pradesh'),
(3, 'Assam'),
(4, 'Bihar'),
(5, 'Chhattisgarh'),
(6, 'Goa'),
(7, 'Gujarat'),
(8, 'Haryana'),
(9, 'Himachal Pradesh'),
(10, 'Jharkhand'),
(11, 'Karnataka'),
(12, 'Kerala'),
(13, 'Madhya Pradesh'),
(14, 'Maharashtra'),
(15, 'Manipur'),
(16, 'Meghalaya'),
(17, 'Mizoram'),
(18, 'Nagaland'),
(19, 'Odisha'),
(20, 'Punjab'),
(21, 'Rajasthan'),
(22, 'Sikkim'),
(23, 'Tamil Nadu'),
(24, 'Telangana'),
(25, 'Tripura'),
(26, 'Uttar Pradesh'),
(27, 'Uttarakhand'),
(28, 'West Bengal'),
(29, 'Andaman and Nicobar Islands'),
(30, 'Chandigarh'),
(31, 'Dadra and Nagar Haveli and Daman and Diu'),
(32, 'Delhi'),
(33, 'Jammu and Kashmir'),
(34, 'Ladakh'),
(35, 'Lakshadweep'),
(36, 'Puducherry');

-- --------------------------------------------------------

--
-- Table structure for table `planned_order`
--

CREATE TABLE `planned_order` (
  `sr_no` int(11) NOT NULL,
  `product` char(15) NOT NULL,
  `plant` char(4) NOT NULL,
  `source` varchar(15) DEFAULT NULL,
  `machine` varchar(15) DEFAULT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `qty` int(10) NOT NULL,
  `buom` char(4) DEFAULT NULL,
  `fixing_indicator` char(1) DEFAULT NULL CHECK (`fixing_indicator` = 'X'),
  `creation_date` date NOT NULL,
  `date_submitted` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `planned_order`
--

INSERT INTO `planned_order` (`sr_no`, `product`, `plant`, `source`, `machine`, `start_date`, `end_date`, `qty`, `buom`, `fixing_indicator`, `creation_date`, `date_submitted`) VALUES
(81, 'FG01', 'DC01', NULL, NULL, '0000-00-00', '0000-00-00', 20, NULL, NULL, '0000-00-00', '2025-01-24'),
(82, 'FG01', 'DC01', NULL, NULL, '0000-00-00', '0000-00-00', 28, NULL, NULL, '0000-00-00', '2025-01-31'),
(83, 'FG01', 'DC01', NULL, NULL, '0000-00-00', '0000-00-00', 51, NULL, NULL, '0000-00-00', '2024-12-27'),
(84, 'FG01', 'DC01', NULL, NULL, '0000-00-00', '0000-00-00', 52, NULL, NULL, '0000-00-00', '2025-01-03'),
(85, 'FG01', 'DC01', NULL, NULL, '0000-00-00', '0000-00-00', 53, NULL, NULL, '0000-00-00', '2025-01-10'),
(86, 'FG01', 'DC01', NULL, NULL, '0000-00-00', '0000-00-00', 54, NULL, NULL, '0000-00-00', '2025-01-17'),
(87, 'FG01', 'DC01', NULL, NULL, '0000-00-00', '0000-00-00', 37, NULL, NULL, '0000-00-00', '2025-02-07'),
(88, 'FG01', 'DC01', NULL, NULL, '0000-00-00', '0000-00-00', 45, NULL, NULL, '0000-00-00', '2025-02-14'),
(105, 'FG01', 'DC01', NULL, NULL, '0000-00-00', '0000-00-00', 53, NULL, NULL, '0000-00-00', '2025-02-21'),
(106, 'FG01', 'DC01', NULL, NULL, '0000-00-00', '0000-00-00', 61, NULL, NULL, '0000-00-00', '2025-02-28'),
(111, 'FG01', 'DC02', NULL, NULL, '0000-00-00', '0000-00-00', 29, NULL, NULL, '0000-00-00', '2025-01-24'),
(112, 'FG01', 'DC02', NULL, NULL, '0000-00-00', '0000-00-00', 37, NULL, NULL, '0000-00-00', '2025-01-31'),
(113, 'FG01', 'DC02', NULL, NULL, '0000-00-00', '0000-00-00', 45, NULL, NULL, '0000-00-00', '2025-02-07'),
(147, 'FG01', 'PL01', NULL, NULL, '0000-00-00', '0000-00-00', 28, NULL, NULL, '0000-00-00', '2025-01-31'),
(148, 'FG01', 'PL01', NULL, NULL, '0000-00-00', '0000-00-00', 37, NULL, NULL, '0000-00-00', '2025-02-07'),
(149, 'FG01', 'PL01', NULL, NULL, '0000-00-00', '0000-00-00', 45, NULL, NULL, '0000-00-00', '2025-02-14'),
(150, 'FG01', 'PL01', NULL, NULL, '0000-00-00', '0000-00-00', 53, NULL, NULL, '0000-00-00', '2025-02-21'),
(151, 'FG01', 'DC01', NULL, NULL, '0000-00-00', '0000-00-00', 45, NULL, NULL, '0000-00-00', '2025-03-07'),
(152, 'FG01', 'DC01', NULL, NULL, '0000-00-00', '0000-00-00', 24, NULL, NULL, '0000-00-00', '2025-03-21'),
(153, 'FG01', 'DC01', NULL, NULL, '0000-00-00', '0000-00-00', 78, NULL, NULL, '0000-00-00', '2025-03-28'),
(154, 'FG01', 'DC01', NULL, NULL, '0000-00-00', '0000-00-00', 67, NULL, NULL, '0000-00-00', '2025-04-04'),
(155, 'FG01', 'DC01', NULL, NULL, '0000-00-00', '0000-00-00', 38, NULL, NULL, '0000-00-00', '2025-04-11'),
(156, 'FG01', 'DC01', NULL, NULL, '0000-00-00', '0000-00-00', 90, NULL, NULL, '0000-00-00', '2025-04-18');

-- --------------------------------------------------------

--
-- Table structure for table `plant_master`
--

CREATE TABLE `plant_master` (
  `plant_code` char(4) NOT NULL,
  `plant_description` char(40) DEFAULT NULL,
  `plant_type` varchar(40) NOT NULL,
  `address` char(35) DEFAULT NULL,
  `city` char(35) DEFAULT NULL,
  `pin_code` char(10) DEFAULT NULL,
  `state` varchar(255) DEFAULT NULL,
  `country` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `plant_master`
--

INSERT INTO `plant_master` (`plant_code`, `plant_description`, `plant_type`, `address`, `city`, `pin_code`, `state`, `country`) VALUES
('DC01', 'Distribution Center 1', 'Warehouse', '', 'Mumbai', '', 'maharshtra', 'India'),
('DC02', 'Distribution Center 2', 'Warehouse', '', 'Nagpur', '', 'maharshtra', 'India'),
('PL01', 'plant 1', 'Production ', '', 'Pune', '411018', 'maharshtra', 'India');

-- --------------------------------------------------------

--
-- Table structure for table `production_order`
--

CREATE TABLE `production_order` (
  `sr_no` int(11) NOT NULL,
  `product` char(15) NOT NULL,
  `plant` char(4) NOT NULL,
  `source` varchar(15) DEFAULT NULL,
  `machine` varchar(15) DEFAULT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `qty` int(10) NOT NULL,
  `buom` char(4) DEFAULT NULL,
  `date_submitted` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `production_order`
--

INSERT INTO `production_order` (`sr_no`, `product`, `plant`, `source`, `machine`, `start_date`, `end_date`, `qty`, `buom`, `date_submitted`) VALUES
(84, 'FG01', 'DC01', NULL, NULL, '0000-00-00', '0000-00-00', 21, NULL, '2025-01-24'),
(85, 'FG01', 'DC01', NULL, NULL, '0000-00-00', '0000-00-00', 29, NULL, '2025-01-31'),
(86, 'FG01', 'DC01', NULL, NULL, '0000-00-00', '0000-00-00', 61, NULL, '2024-12-27'),
(87, 'FG01', 'DC01', NULL, NULL, '0000-00-00', '0000-00-00', 62, NULL, '2025-01-03'),
(88, 'FG01', 'DC01', NULL, NULL, '0000-00-00', '0000-00-00', 63, NULL, '2025-01-10'),
(89, 'FG01', 'DC01', NULL, NULL, '0000-00-00', '0000-00-00', 64, NULL, '2025-01-17'),
(90, 'FG01', 'DC01', NULL, NULL, '0000-00-00', '0000-00-00', 38, NULL, '2025-02-07'),
(91, 'FG01', 'DC01', NULL, NULL, '0000-00-00', '0000-00-00', 46, NULL, '2025-02-14'),
(108, 'FG01', 'DC01', NULL, NULL, '0000-00-00', '0000-00-00', 54, NULL, '2025-02-21'),
(109, 'FG01', 'DC01', NULL, NULL, '0000-00-00', '0000-00-00', 62, NULL, '2025-02-28'),
(114, 'FG01', 'DC02', NULL, NULL, '0000-00-00', '0000-00-00', 30, NULL, '2025-01-24'),
(115, 'FG01', 'DC02', NULL, NULL, '0000-00-00', '0000-00-00', 38, NULL, '2025-01-31'),
(116, 'FG01', 'DC02', NULL, NULL, '0000-00-00', '0000-00-00', 46, NULL, '2025-02-07'),
(150, 'FG01', 'PL01', NULL, NULL, '0000-00-00', '0000-00-00', 29, NULL, '2025-01-31'),
(151, 'FG01', 'PL01', NULL, NULL, '0000-00-00', '0000-00-00', 38, NULL, '2025-02-07'),
(152, 'FG01', 'PL01', NULL, NULL, '0000-00-00', '0000-00-00', 46, NULL, '2025-02-14'),
(153, 'FG01', 'PL01', NULL, NULL, '0000-00-00', '0000-00-00', 54, NULL, '2025-02-21');

-- --------------------------------------------------------

--
-- Table structure for table `product_master`
--

CREATE TABLE `product_master` (
  `product_code` char(18) NOT NULL,
  `product_description` char(40) DEFAULT NULL,
  `product_type` varchar(40) NOT NULL,
  `base_uom` varchar(3) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `product_master`
--

INSERT INTO `product_master` (`product_code`, `product_description`, `product_type`, `base_uom`) VALUES
('FG01', 'Finished Good 1', 'FG', 'EA'),
('RM01', 'Raw Material 1', 'RM', 'EA'),
('RM02', 'Raw Material 2', 'RM', 'EA'),
('RM03', 'Raw Material 3', 'RM', 'EA'),
('RM04', 'Raw Material 4', 'RM', 'EA'),
('SF01', 'Semifinished 1', 'SF', 'EA');

-- --------------------------------------------------------

--
-- Table structure for table `product_plant_master`
--

CREATE TABLE `product_plant_master` (
  `product_code` char(18) NOT NULL,
  `product_description` char(40) DEFAULT NULL,
  `plant_code` char(4) NOT NULL,
  `plant_description` char(40) DEFAULT NULL,
  `manufacturing_type` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `product_plant_master`
--

INSERT INTO `product_plant_master` (`product_code`, `product_description`, `plant_code`, `plant_description`, `manufacturing_type`) VALUES
('FG01', 'Finished Good 1', 'DC01', 'Warehouse 1', 'External'),
('FG01', 'Finished Good 1', 'DC02', 'Warehouse 2', 'External'),
('FG01', 'Finished Good 1', 'PL01', 'Production', 'Inhouse'),
('RM01', 'Raw Material 1', 'PL01', 'Production', 'External'),
('RM02', 'Raw Material 2', 'PL01', 'Production', 'External'),
('RM03', 'Raw Material 3', 'PL01', 'Production', 'External'),
('RM04', 'Raw Material 4', 'PL01', 'Production', 'External'),
('SF01', 'Semifinished 1', 'PL01', 'Production', 'Inhouse');

-- --------------------------------------------------------

--
-- Table structure for table `projected_balance`
--

CREATE TABLE `projected_balance` (
  `sr_no` int(11) NOT NULL,
  `product` varchar(20) NOT NULL,
  `plant` varchar(20) NOT NULL,
  `qty` int(11) NOT NULL,
  `buom` varchar(10) NOT NULL,
  `date_submitted` date NOT NULL,
  `requirement_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `projected_balance`
--

INSERT INTO `projected_balance` (`sr_no`, `product`, `plant`, `qty`, `buom`, `date_submitted`, `requirement_date`) VALUES
(104, 'FG01', 'DC01', 373, '', '2025-01-24', '0000-00-00'),
(105, 'FG01', 'DC01', 785, '', '2025-01-31', '0000-00-00'),
(106, 'FG01', 'DC01', 813, '', '2025-02-07', '0000-00-00'),
(107, 'FG01', 'DC01', 828, '', '2025-02-14', '0000-00-00'),
(108, 'FG01', 'DC01', 410, '', '2025-01-10', '0000-00-00'),
(118, 'FG01', 'DC01', 844, '', '2025-02-21', '0000-00-00'),
(119, 'FG01', 'DC01', 844, '', '2025-02-28', '0000-00-00'),
(120, 'FG01', 'DC01', 814, '', '2025-03-07', '0000-00-00'),
(121, 'FG01', 'DC01', 814, '', '2025-03-14', '0000-00-00'),
(140, 'FG01', 'DC02', 14, '', '2025-01-24', '0000-00-00'),
(141, 'FG01', 'DC02', 30, '', '2025-01-31', '0000-00-00'),
(142, 'FG01', 'DC02', 46, '', '2025-02-07', '0000-00-00'),
(143, 'FG01', 'DC02', 46, '', '2025-02-14', '0000-00-00'),
(177, 'FG01', 'PL01', -215, '', '2025-01-31', '0000-00-00'),
(178, 'FG01', 'PL01', -259, '', '2025-02-07', '0000-00-00'),
(179, 'FG01', 'PL01', -244, '', '2025-02-14', '0000-00-00'),
(180, 'FG01', 'PL01', -228, '', '2025-02-21', '0000-00-00'),
(181, 'FG01', 'DC01', 788, '', '2025-03-21', '0000-00-00'),
(182, 'FG01', 'DC01', 851, '', '2025-03-28', '0000-00-00'),
(183, 'FG01', 'DC01', 897, '', '2025-04-04', '0000-00-00'),
(184, 'FG01', 'DC01', 1221, '', '2025-04-11', '0000-00-00'),
(185, 'FG01', 'DC01', 636, '', '2025-04-18', '0000-00-00'),
(186, 'FG01', 'DC01', 636, '', '2025-04-25', '0000-00-00'),
(187, 'FG01', 'DC01', 636, '', '2025-05-02', '0000-00-00'),
(188, 'FG01', 'DC01', 636, '', '2025-05-09', '0000-00-00'),
(189, 'FG01', 'DC01', 636, '', '2025-05-16', '0000-00-00'),
(190, 'FG01', 'DC01', 636, '', '2025-05-23', '0000-00-00'),
(191, 'FG01', 'DC01', 636, '', '2025-05-30', '0000-00-00'),
(192, 'FG01', 'DC01', 636, '', '2025-06-06', '0000-00-00'),
(193, 'FG01', 'DC01', 636, '', '2025-06-13', '0000-00-00'),
(194, 'FG01', 'DC01', 636, '', '2025-06-20', '0000-00-00'),
(195, 'FG01', 'DC01', 636, '', '2025-06-27', '0000-00-00'),
(196, 'FG01', 'DC01', 636, '', '2025-07-04', '0000-00-00'),
(197, 'FG01', 'DC01', 636, '', '2025-07-11', '0000-00-00'),
(198, 'FG01', 'DC01', 636, '', '2025-07-18', '0000-00-00'),
(199, 'FG01', 'DC01', 636, '', '2025-07-25', '0000-00-00'),
(200, 'FG01', 'DC01', 636, '', '2025-08-01', '0000-00-00'),
(201, 'FG01', 'DC01', 636, '', '2025-08-08', '0000-00-00'),
(202, 'FG01', 'DC01', 636, '', '2025-08-15', '0000-00-00'),
(203, 'FG01', 'DC01', 636, '', '2025-08-22', '0000-00-00'),
(204, 'FG01', 'DC01', 636, '', '2025-08-29', '0000-00-00'),
(205, 'FG01', 'DC01', 636, '', '2025-09-05', '0000-00-00'),
(206, 'FG01', 'DC01', 636, '', '2025-09-12', '0000-00-00'),
(207, 'FG01', 'DC01', 636, '', '2025-09-19', '0000-00-00'),
(208, 'FG01', 'DC01', 636, '', '2025-09-26', '0000-00-00'),
(209, 'FG01', 'DC01', 636, '', '2025-10-03', '0000-00-00'),
(210, 'FG01', 'DC01', 636, '', '2025-10-10', '0000-00-00'),
(211, 'FG01', 'DC01', 636, '', '2025-10-17', '0000-00-00'),
(212, 'FG01', 'DC01', 636, '', '2025-10-24', '0000-00-00'),
(213, 'FG01', 'DC01', 636, '', '2025-10-31', '0000-00-00'),
(214, 'FG01', 'DC01', 636, '', '2025-11-07', '0000-00-00'),
(215, 'FG01', 'DC01', 636, '', '2025-11-14', '0000-00-00'),
(216, 'FG01', 'DC01', 636, '', '2025-11-21', '0000-00-00'),
(217, 'FG01', 'DC01', 636, '', '2025-11-28', '0000-00-00'),
(218, 'FG01', 'DC01', 636, '', '2025-12-05', '0000-00-00'),
(219, 'FG01', 'DC01', 636, '', '2025-12-12', '0000-00-00'),
(220, 'FG01', 'DC01', 636, '', '2025-12-19', '0000-00-00'),
(221, 'FG01', 'DC01', 636, '', '2025-12-26', '0000-00-00'),
(222, 'FG01', 'DC01', 636, '', '2026-01-02', '0000-00-00'),
(223, 'FG01', 'DC01', 636, '', '2026-01-09', '0000-00-00'),
(224, 'FG01', 'DC01', 636, '', '2026-01-16', '0000-00-00'),
(225, 'FG01', 'DC01', 636, '', '2026-01-23', '0000-00-00'),
(226, 'FG01', 'DC01', 636, '', '2026-01-30', '0000-00-00'),
(227, 'FG01', 'DC01', 636, '', '2026-02-06', '0000-00-00'),
(228, 'FG01', 'DC01', 636, '', '2026-02-13', '0000-00-00'),
(229, 'FG01', 'DC01', 636, '', '2026-02-20', '0000-00-00'),
(230, 'FG01', 'DC01', 636, '', '2026-02-27', '0000-00-00'),
(231, 'FG01', 'DC01', 636, '', '2026-03-06', '0000-00-00'),
(232, 'FG01', 'DC01', 636, '', '2026-03-13', '0000-00-00'),
(233, 'FG01', 'DC01', 636, '', '2026-03-20', '0000-00-00'),
(234, 'FG01', 'DC01', 636, '', '2026-03-27', '0000-00-00'),
(235, 'FG01', 'DC01', 636, '', '2026-04-03', '0000-00-00'),
(236, 'FG01', 'DC01', 636, '', '2026-04-10', '0000-00-00'),
(237, 'FG01', 'DC01', 636, '', '2026-04-17', '0000-00-00'),
(238, 'FG01', 'DC01', 636, '', '2026-04-24', '0000-00-00'),
(239, 'FG01', 'DC01', 636, '', '2026-05-01', '0000-00-00'),
(240, 'FG01', 'DC01', 636, '', '2026-05-08', '0000-00-00'),
(241, 'FG01', 'DC01', 636, '', '2026-05-15', '0000-00-00'),
(242, 'FG01', 'DC01', 636, '', '2026-05-22', '0000-00-00'),
(243, 'FG01', 'DC01', 636, '', '2026-05-29', '0000-00-00'),
(244, 'FG01', 'DC01', 636, '', '2026-06-05', '0000-00-00'),
(245, 'FG01', 'DC01', 636, '', '2026-06-12', '0000-00-00'),
(246, 'FG01', 'DC01', 636, '', '2026-06-19', '0000-00-00'),
(247, 'FG01', 'DC01', 636, '', '2026-06-26', '0000-00-00'),
(248, 'FG01', 'DC01', 636, '', '2026-07-03', '0000-00-00'),
(249, 'FG01', 'DC01', 636, '', '2026-07-10', '0000-00-00'),
(250, 'FG01', 'DC01', 636, '', '2026-07-17', '0000-00-00'),
(251, 'FG01', 'DC01', 636, '', '2026-07-24', '0000-00-00'),
(252, 'FG01', 'DC01', 636, '', '2026-07-31', '0000-00-00'),
(253, 'FG01', 'DC01', 636, '', '2026-08-07', '0000-00-00'),
(254, 'FG01', 'DC01', 636, '', '2026-08-14', '0000-00-00'),
(255, 'FG01', 'DC01', 636, '', '2026-08-21', '0000-00-00'),
(256, 'FG01', 'DC01', 636, '', '2026-08-28', '0000-00-00'),
(257, 'FG01', 'DC01', 636, '', '2026-09-04', '0000-00-00'),
(258, 'FG01', 'DC01', 636, '', '2026-09-11', '0000-00-00'),
(259, 'FG01', 'DC01', 636, '', '2026-09-18', '0000-00-00'),
(260, 'FG01', 'DC01', 636, '', '2026-09-25', '0000-00-00'),
(261, 'FG01', 'DC01', 636, '', '2026-10-02', '0000-00-00'),
(262, 'FG01', 'DC01', 636, '', '2026-10-09', '0000-00-00'),
(263, 'FG01', 'DC01', 636, '', '2026-10-16', '0000-00-00'),
(264, 'FG01', 'DC01', 636, '', '2026-10-23', '0000-00-00'),
(265, 'FG01', 'DC01', 636, '', '2026-10-30', '0000-00-00'),
(266, 'FG01', 'DC01', 636, '', '2026-11-06', '0000-00-00'),
(267, 'FG01', 'DC01', 636, '', '2026-11-13', '0000-00-00'),
(268, 'FG01', 'DC01', 636, '', '2026-11-20', '0000-00-00'),
(269, 'FG01', 'DC01', 636, '', '2026-11-27', '0000-00-00'),
(270, 'FG01', 'DC01', 636, '', '2026-12-04', '0000-00-00'),
(271, 'FG01', 'DC01', 636, '', '2026-12-11', '0000-00-00'),
(272, 'FG01', 'DC01', 636, '', '2026-12-18', '0000-00-00'),
(273, 'FG01', 'DC01', 636, '', '2026-12-25', '0000-00-00'),
(274, 'FG01', 'DC01', 636, '', '2027-01-01', '0000-00-00'),
(275, 'FG01', 'DC01', 636, '', '2027-01-08', '0000-00-00'),
(276, 'FG01', 'DC01', 636, '', '2027-01-15', '0000-00-00'),
(277, 'FG01', 'DC01', 636, '', '2027-01-22', '0000-00-00'),
(278, 'FG01', 'DC01', 636, '', '2027-01-29', '0000-00-00');

-- --------------------------------------------------------

--
-- Table structure for table `sales_order`
--

CREATE TABLE `sales_order` (
  `sr_no` int(11) NOT NULL,
  `product` varchar(20) NOT NULL,
  `plant` varchar(20) NOT NULL,
  `qty` int(11) NOT NULL,
  `buom` varchar(10) NOT NULL,
  `date_submitted` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `sales_order`
--

INSERT INTO `sales_order` (`sr_no`, `product`, `plant`, `qty`, `buom`, `date_submitted`) VALUES
(29, 'FG01', 'DC01', 14, '', '2025-01-24'),
(30, 'FG01', 'DC01', 28, '', '2025-01-31'),
(31, 'FG01', 'DC01', 23, '', '2025-01-03'),
(32, 'FG01', 'DC01', 24, '', '2025-01-10'),
(33, 'FG01', 'DC01', 25, '', '2025-01-17'),
(34, 'FG01', 'DC01', 26, '', '2024-12-27'),
(35, 'FG01', 'DC01', 29, '', '2025-02-07'),
(36, 'FG01', 'DC01', 41, '', '2025-02-14'),
(53, 'FG01', 'DC01', 48, '', '2025-02-21'),
(54, 'FG01', 'DC01', 56, '', '2025-02-28'),
(59, 'FG01', 'DC02', 24, '', '2025-01-24'),
(60, 'FG01', 'DC02', 32, '', '2025-01-31'),
(61, 'FG01', 'DC02', 40, '', '2025-02-07'),
(95, 'FG01', 'PL01', 28, '', '2025-01-31'),
(96, 'FG01', 'PL01', 29, '', '2025-02-07'),
(97, 'FG01', 'PL01', 41, '', '2025-02-14'),
(98, 'FG01', 'PL01', 48, '', '2025-02-21'),
(99, 'FG01', 'DC01', 98, '', '2025-03-07'),
(100, 'FG01', 'DC01', 98, '', '2025-03-21'),
(101, 'FG01', 'DC01', 56, '', '2025-03-28'),
(102, 'FG01', 'DC01', 32, '', '2025-04-04'),
(103, 'FG01', 'DC01', 23, '', '2025-04-11'),
(104, 'FG01', 'DC01', 32, '', '2025-04-18');

-- --------------------------------------------------------

--
-- Table structure for table `sourcing_external`
--

CREATE TABLE `sourcing_external` (
  `product_code` varchar(18) NOT NULL,
  `plant_code` varchar(4) NOT NULL,
  `source_type` varchar(15) NOT NULL,
  `source` varchar(15) NOT NULL,
  `lead_time` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `sourcing_external`
--

INSERT INTO `sourcing_external` (`product_code`, `plant_code`, `source_type`, `source`, `lead_time`) VALUES
('FG01', 'DC01', 'Plant Transfer', 'PL01', 15),
('FG01', 'DC02', 'Plant Transfer', 'PL01', 25);

-- --------------------------------------------------------

--
-- Table structure for table `stock`
--

CREATE TABLE `stock` (
  `sr_no` int(11) NOT NULL,
  `product` char(15) NOT NULL,
  `plant` char(4) NOT NULL,
  `qty` int(10) NOT NULL,
  `buom` char(4) DEFAULT NULL,
  `date_submitted` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `stock`
--

INSERT INTO `stock` (`sr_no`, `product`, `plant`, `qty`, `buom`, `date_submitted`) VALUES
(80, 'FG01', 'DC01', 71, NULL, '2024-12-27'),
(81, 'FG01', 'DC01', 72, NULL, '2025-01-03'),
(82, 'FG01', 'DC01', 73, NULL, '2025-01-10'),
(83, 'FG01', 'DC01', 74, NULL, '2025-01-17');

-- --------------------------------------------------------

--
-- Table structure for table `sto_demand`
--

CREATE TABLE `sto_demand` (
  `sr_no` int(11) NOT NULL,
  `product` varchar(20) NOT NULL,
  `plant` varchar(20) NOT NULL,
  `qty` int(11) NOT NULL,
  `buom` varchar(10) NOT NULL,
  `date_submitted` date NOT NULL,
  `requirement_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `sto_demand`
--

INSERT INTO `sto_demand` (`sr_no`, `product`, `plant`, `qty`, `buom`, `date_submitted`, `requirement_date`) VALUES
(29, 'FG01', 'DC01', 15, '', '2025-01-24', '0000-00-00'),
(30, 'FG01', 'DC01', 25, '', '2025-01-31', '0000-00-00'),
(31, 'FG01', 'DC01', 22, '', '2024-12-27', '0000-00-00'),
(33, 'FG01', 'DC01', 23, '', '2025-01-03', '0000-00-00'),
(34, 'FG01', 'DC01', 24, '', '2025-01-10', '0000-00-00'),
(35, 'FG01', 'DC01', 25, '', '2025-01-17', '0000-00-00'),
(36, 'FG01', 'DC01', 31, '', '2025-02-07', '0000-00-00'),
(37, 'FG01', 'DC01', 43, '', '2025-02-14', '0000-00-00'),
(54, 'FG01', 'DC01', 50, '', '2025-02-21', '0000-00-00'),
(55, 'FG01', 'DC01', 58, '', '2025-02-28', '0000-00-00'),
(60, 'FG01', 'DC02', 26, '', '2025-01-24', '0000-00-00'),
(61, 'FG01', 'DC02', 34, '', '2025-01-31', '0000-00-00'),
(62, 'FG01', 'DC02', 42, '', '2025-02-07', '0000-00-00'),
(96, 'FG01', 'PL01', 25, '', '2025-01-31', '0000-00-00'),
(97, 'FG01', 'PL01', 31, '', '2025-02-07', '0000-00-00'),
(98, 'FG01', 'PL01', 43, '', '2025-02-14', '0000-00-00'),
(99, 'FG01', 'PL01', 50, '', '2025-02-21', '0000-00-00');

-- --------------------------------------------------------

--
-- Table structure for table `sto_receipt`
--

CREATE TABLE `sto_receipt` (
  `sr_no` int(11) NOT NULL,
  `product` char(15) NOT NULL,
  `plant` char(4) NOT NULL,
  `source` varchar(15) DEFAULT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `qty` int(10) NOT NULL,
  `buom` char(4) DEFAULT NULL,
  `date_submitted` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `sto_receipt`
--

INSERT INTO `sto_receipt` (`sr_no`, `product`, `plant`, `source`, `start_date`, `end_date`, `qty`, `buom`, `date_submitted`) VALUES
(81, 'FG01', 'DC01', NULL, '0000-00-00', '0000-00-00', 19, NULL, '2025-01-24'),
(82, 'FG01', 'DC01', NULL, '0000-00-00', '0000-00-00', 27, NULL, '2025-01-31'),
(83, 'FG01', 'DC01', NULL, '0000-00-00', '0000-00-00', 41, NULL, '2024-12-27'),
(84, 'FG01', 'DC01', NULL, '0000-00-00', '0000-00-00', 42, NULL, '2025-01-03'),
(85, 'FG01', 'DC01', NULL, '0000-00-00', '0000-00-00', 43, NULL, '2025-01-10'),
(86, 'FG01', 'DC01', NULL, '0000-00-00', '0000-00-00', 44, NULL, '2025-01-17'),
(87, 'FG01', 'DC01', NULL, '0000-00-00', '0000-00-00', 36, NULL, '2025-02-07'),
(88, 'FG01', 'DC01', NULL, '0000-00-00', '0000-00-00', 45, NULL, '2025-02-14'),
(105, 'FG01', 'DC01', NULL, '0000-00-00', '0000-00-00', 52, NULL, '2025-02-21'),
(106, 'FG01', 'DC01', NULL, '0000-00-00', '0000-00-00', 60, NULL, '2025-02-28'),
(111, 'FG01', 'DC02', NULL, '0000-00-00', '0000-00-00', 26, NULL, '2025-01-24'),
(112, 'FG01', 'DC02', NULL, '0000-00-00', '0000-00-00', 36, NULL, '2025-01-31'),
(113, 'FG01', 'DC02', NULL, '0000-00-00', '0000-00-00', 44, NULL, '2025-02-07'),
(147, 'FG01', 'PL01', NULL, '0000-00-00', '0000-00-00', 27, NULL, '2025-01-31'),
(148, 'FG01', 'PL01', NULL, '0000-00-00', '0000-00-00', 36, NULL, '2025-02-07'),
(149, 'FG01', 'PL01', NULL, '0000-00-00', '0000-00-00', 45, NULL, '2025-02-14'),
(150, 'FG01', 'PL01', NULL, '0000-00-00', '0000-00-00', 52, NULL, '2025-02-21');

-- --------------------------------------------------------

--
-- Table structure for table `str_demand`
--

CREATE TABLE `str_demand` (
  `sr_no` int(11) NOT NULL,
  `product` varchar(20) NOT NULL,
  `plant` varchar(20) NOT NULL,
  `qty` int(11) NOT NULL,
  `buom` varchar(10) NOT NULL,
  `date_submitted` date NOT NULL,
  `requirement_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `str_demand`
--

INSERT INTO `str_demand` (`sr_no`, `product`, `plant`, `qty`, `buom`, `date_submitted`, `requirement_date`) VALUES
(29, 'FG01', 'DC01', 16, '', '2025-01-24', '0000-00-00'),
(30, 'FG01', 'DC01', 29, '', '2025-01-31', '0000-00-00'),
(31, 'FG01', 'DC01', 12, '', '2024-12-27', '0000-00-00'),
(32, 'FG01', 'DC01', 13, '', '2025-01-03', '0000-00-00'),
(33, 'FG01', 'DC01', 14, '', '2025-01-10', '0000-00-00'),
(34, 'FG01', 'DC01', 15, '', '2025-01-17', '0000-00-00'),
(36, 'FG01', 'DC01', 30, '', '2025-02-07', '0000-00-00'),
(37, 'FG01', 'DC01', 42, '', '2025-02-14', '0000-00-00'),
(54, 'FG01', 'DC01', 49, '', '2025-02-21', '0000-00-00'),
(55, 'FG01', 'DC01', 57, '', '2025-02-28', '0000-00-00'),
(60, 'FG01', 'DC02', 25, '', '2025-01-24', '0000-00-00'),
(61, 'FG01', 'DC02', 33, '', '2025-01-31', '0000-00-00'),
(62, 'FG01', 'DC02', 41, '', '2025-02-07', '0000-00-00'),
(96, 'FG01', 'PL01', 29, '', '2025-01-31', '0000-00-00'),
(97, 'FG01', 'PL01', 30, '', '2025-02-07', '0000-00-00'),
(98, 'FG01', 'PL01', 42, '', '2025-02-14', '0000-00-00'),
(99, 'FG01', 'PL01', 49, '', '2025-02-21', '0000-00-00');

-- --------------------------------------------------------

--
-- Table structure for table `str_receipt`
--

CREATE TABLE `str_receipt` (
  `sr_no` int(11) NOT NULL,
  `product` char(15) NOT NULL,
  `plant` char(4) NOT NULL,
  `source` varchar(15) DEFAULT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `qty` int(10) NOT NULL,
  `buom` char(4) DEFAULT NULL,
  `fixing_indicator` char(1) DEFAULT NULL CHECK (`fixing_indicator` = 'X'),
  `creation_date` date NOT NULL,
  `date_submitted` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `str_receipt`
--

INSERT INTO `str_receipt` (`sr_no`, `product`, `plant`, `source`, `start_date`, `end_date`, `qty`, `buom`, `fixing_indicator`, `creation_date`, `date_submitted`) VALUES
(81, 'FG01', 'DC01', NULL, '0000-00-00', '0000-00-00', 18, NULL, NULL, '0000-00-00', '2025-01-24'),
(82, 'FG01', 'DC01', NULL, '0000-00-00', '0000-00-00', 26, NULL, NULL, '0000-00-00', '2025-01-31'),
(83, 'FG01', 'DC01', NULL, '0000-00-00', '0000-00-00', 32, NULL, NULL, '0000-00-00', '2024-12-27'),
(84, 'FG01', 'DC01', NULL, '0000-00-00', '0000-00-00', 33, NULL, NULL, '0000-00-00', '2025-01-03'),
(85, 'FG01', 'DC01', NULL, '0000-00-00', '0000-00-00', 34, NULL, NULL, '0000-00-00', '2025-01-10'),
(86, 'FG01', 'DC01', NULL, '0000-00-00', '0000-00-00', 35, NULL, NULL, '0000-00-00', '2025-01-17'),
(87, 'FG01', 'DC01', NULL, '0000-00-00', '0000-00-00', 35, NULL, NULL, '0000-00-00', '2025-02-07'),
(88, 'FG01', 'DC01', NULL, '0000-00-00', '0000-00-00', 44, NULL, NULL, '0000-00-00', '2025-02-14'),
(105, 'FG01', 'DC01', NULL, '0000-00-00', '0000-00-00', 51, NULL, NULL, '0000-00-00', '2025-02-21'),
(106, 'FG01', 'DC01', NULL, '0000-00-00', '0000-00-00', 59, NULL, NULL, '0000-00-00', '2025-02-28'),
(111, 'FG01', 'DC02', NULL, '0000-00-00', '0000-00-00', 27, NULL, NULL, '0000-00-00', '2025-01-24'),
(112, 'FG01', 'DC02', NULL, '0000-00-00', '0000-00-00', 35, NULL, NULL, '0000-00-00', '2025-01-31'),
(113, 'FG01', 'DC02', NULL, '0000-00-00', '0000-00-00', 43, NULL, NULL, '0000-00-00', '2025-02-07'),
(147, 'FG01', 'PL01', NULL, '0000-00-00', '0000-00-00', 35, NULL, NULL, '0000-00-00', '2025-02-07'),
(148, 'FG01', 'PL01', NULL, '0000-00-00', '0000-00-00', 44, NULL, NULL, '0000-00-00', '2025-02-14'),
(149, 'FG01', 'PL01', NULL, '0000-00-00', '0000-00-00', 51, NULL, NULL, '0000-00-00', '2025-02-21'),
(150, 'FG01', 'DC01', NULL, '0000-00-00', '0000-00-00', 90, NULL, NULL, '0000-00-00', '2025-03-07'),
(151, 'FG01', 'DC01', NULL, '0000-00-00', '0000-00-00', 76, NULL, NULL, '0000-00-00', '2025-03-21'),
(152, 'FG01', 'DC01', NULL, '0000-00-00', '0000-00-00', 64, NULL, NULL, '0000-00-00', '2025-03-28'),
(153, 'FG01', 'DC01', NULL, '0000-00-00', '0000-00-00', 54, NULL, NULL, '0000-00-00', '2025-04-04'),
(154, 'FG01', 'DC01', NULL, '0000-00-00', '0000-00-00', 321, NULL, NULL, '0000-00-00', '2025-04-11'),
(155, 'FG01', 'DC01', NULL, '0000-00-00', '0000-00-00', 32, NULL, NULL, '0000-00-00', '2025-04-18');

-- --------------------------------------------------------

--
-- Table structure for table `total_demand`
--

CREATE TABLE `total_demand` (
  `sr_no` int(11) NOT NULL,
  `product` varchar(20) NOT NULL,
  `plant` varchar(20) NOT NULL,
  `qty` int(11) NOT NULL,
  `buom` varchar(10) NOT NULL,
  `date_submitted` date NOT NULL,
  `requirement_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `total_demand`
--

INSERT INTO `total_demand` (`sr_no`, `product`, `plant`, `qty`, `buom`, `date_submitted`, `requirement_date`) VALUES
(49, 'FG01', 'DC01', 115, '', '2025-01-24', '0000-00-00'),
(50, 'FG01', 'DC01', 108, '', '2025-01-31', '0000-00-00'),
(51, 'FG01', 'DC01', 88, '', '2024-12-27', '0000-00-00'),
(52, 'FG01', 'DC01', 83, '', '2025-01-03', '0000-00-00'),
(53, 'FG01', 'DC01', 90, '', '2025-01-10', '0000-00-00'),
(54, 'FG01', 'DC01', 93, '', '2025-01-17', '0000-00-00'),
(55, 'FG01', 'DC01', 118, '', '2025-02-07', '0000-00-00'),
(56, 'FG01', 'DC01', 165, '', '2025-02-14', '0000-00-00'),
(73, 'FG01', 'DC01', 194, '', '2025-02-21', '0000-00-00'),
(74, 'FG01', 'DC01', 226, '', '2025-02-28', '0000-00-00'),
(79, 'FG01', 'DC02', 98, '', '2025-01-24', '0000-00-00'),
(80, 'FG01', 'DC02', 130, '', '2025-01-31', '0000-00-00'),
(81, 'FG01', 'DC02', 162, '', '2025-02-07', '0000-00-00'),
(115, 'FG01', 'PL01', 1082, '', '2025-01-31', '0000-00-00'),
(116, 'FG01', 'PL01', 190, '', '2025-02-07', '0000-00-00'),
(117, 'FG01', 'PL01', 165, '', '2025-02-14', '0000-00-00'),
(118, 'FG01', 'PL01', 194, '', '2025-02-21', '0000-00-00'),
(119, 'FG01', 'DC01', 165, '', '2025-03-07', '0000-00-00'),
(120, 'FG01', 'DC01', 126, '', '2025-03-21', '0000-00-00'),
(121, 'FG01', 'DC01', 79, '', '2025-03-28', '0000-00-00'),
(122, 'FG01', 'DC01', 75, '', '2025-04-04', '0000-00-00'),
(123, 'FG01', 'DC01', 35, '', '2025-04-11', '0000-00-00'),
(124, 'FG01', 'DC01', 707, '', '2025-04-18', '0000-00-00');

-- --------------------------------------------------------

--
-- Table structure for table `total_receipt`
--

CREATE TABLE `total_receipt` (
  `sr_no` int(11) NOT NULL,
  `product` varchar(20) NOT NULL,
  `plant` varchar(20) NOT NULL,
  `qty` int(11) NOT NULL,
  `buom` varchar(10) NOT NULL,
  `date_submitted` date NOT NULL,
  `requirement_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `total_receipt`
--

INSERT INTO `total_receipt` (`sr_no`, `product`, `plant`, `qty`, `buom`, `date_submitted`, `requirement_date`) VALUES
(24, 'FG01', 'DC01', 78, '', '2025-01-24', '0000-00-00'),
(25, 'FG01', 'DC01', 110, '', '2025-01-31', '0000-00-00'),
(26, 'FG01', 'DC01', 185, '', '2024-12-27', '0000-00-00'),
(27, 'FG01', 'DC01', 189, '', '2025-01-03', '0000-00-00'),
(28, 'FG01', 'DC01', 193, '', '2025-01-10', '0000-00-00'),
(29, 'FG01', 'DC01', 197, '', '2025-01-17', '0000-00-00'),
(30, 'FG01', 'DC01', 146, '', '2025-02-07', '0000-00-00'),
(31, 'FG01', 'DC01', 180, '', '2025-02-14', '0000-00-00'),
(48, 'FG01', 'DC01', 210, '', '2025-02-21', '0000-00-00'),
(49, 'FG01', 'DC01', 242, '', '2025-02-28', '0000-00-00'),
(54, 'FG01', 'DC02', 112, '', '2025-01-24', '0000-00-00'),
(55, 'FG01', 'DC02', 146, '', '2025-01-31', '0000-00-00'),
(56, 'FG01', 'DC02', 178, '', '2025-02-07', '0000-00-00'),
(90, 'FG01', 'PL01', 84, '', '2025-01-31', '0000-00-00'),
(91, 'FG01', 'PL01', 146, '', '2025-02-07', '0000-00-00'),
(92, 'FG01', 'PL01', 180, '', '2025-02-14', '0000-00-00'),
(93, 'FG01', 'PL01', 210, '', '2025-02-21', '0000-00-00'),
(94, 'FG01', 'DC01', 135, '', '2025-03-07', '0000-00-00'),
(95, 'FG01', 'DC01', 100, '', '2025-03-21', '0000-00-00'),
(96, 'FG01', 'DC01', 142, '', '2025-03-28', '0000-00-00'),
(97, 'FG01', 'DC01', 121, '', '2025-04-04', '0000-00-00'),
(98, 'FG01', 'DC01', 359, '', '2025-04-11', '0000-00-00'),
(99, 'FG01', 'DC01', 122, '', '2025-04-18', '0000-00-00');

-- --------------------------------------------------------

--
-- Table structure for table `user_master`
--

CREATE TABLE `user_master` (
  `user_id` int(11) NOT NULL,
  `user_name` varchar(20) NOT NULL,
  `password` varchar(20) DEFAULT NULL,
  `user_role_id` int(11) DEFAULT NULL,
  `user_fullname` varchar(40) DEFAULT NULL,
  `email_id` varchar(40) DEFAULT NULL,
  `mobile_number` bigint(20) DEFAULT NULL,
  `user_location` varchar(15) DEFAULT NULL,
  `user_status` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `user_master`
--

INSERT INTO `user_master` (`user_id`, `user_name`, `password`, `user_role_id`, `user_fullname`, `email_id`, `mobile_number`, `user_location`, `user_status`) VALUES
(1, 'admin', '123', 1, 'admin', 'admin@gmail.com', 9544547890, 'pune', 0);

-- --------------------------------------------------------

--
-- Table structure for table `vendor_master`
--

CREATE TABLE `vendor_master` (
  `vendor_code` char(10) NOT NULL,
  `vendor_description` char(35) DEFAULT NULL,
  `address` char(35) DEFAULT NULL,
  `city` char(35) DEFAULT NULL,
  `pin_code` char(10) DEFAULT NULL,
  `state` varchar(255) DEFAULT NULL,
  `country` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `country`
--
ALTER TABLE `country`
  ADD PRIMARY KEY (`country_id`);

--
-- Indexes for table `days_supply`
--
ALTER TABLE `days_supply`
  ADD PRIMARY KEY (`sr_no`),
  ADD UNIQUE KEY `unique_key` (`product`,`plant`,`date_submitted`);

--
-- Indexes for table `forecast`
--
ALTER TABLE `forecast`
  ADD PRIMARY KEY (`sr_no`),
  ADD UNIQUE KEY `unique_key` (`product`,`plant`,`date_submitted`);

--
-- Indexes for table `indian_states`
--
ALTER TABLE `indian_states`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `planned_order`
--
ALTER TABLE `planned_order`
  ADD PRIMARY KEY (`sr_no`),
  ADD UNIQUE KEY `unique_key` (`product`,`plant`,`date_submitted`);

--
-- Indexes for table `plant_master`
--
ALTER TABLE `plant_master`
  ADD PRIMARY KEY (`plant_code`);

--
-- Indexes for table `production_order`
--
ALTER TABLE `production_order`
  ADD PRIMARY KEY (`sr_no`),
  ADD UNIQUE KEY `unique_key` (`product`,`plant`,`date_submitted`);

--
-- Indexes for table `product_master`
--
ALTER TABLE `product_master`
  ADD PRIMARY KEY (`product_code`);

--
-- Indexes for table `product_plant_master`
--
ALTER TABLE `product_plant_master`
  ADD PRIMARY KEY (`product_code`,`plant_code`);

--
-- Indexes for table `projected_balance`
--
ALTER TABLE `projected_balance`
  ADD PRIMARY KEY (`sr_no`),
  ADD UNIQUE KEY `unique_key` (`product`,`plant`,`date_submitted`);

--
-- Indexes for table `sales_order`
--
ALTER TABLE `sales_order`
  ADD PRIMARY KEY (`sr_no`),
  ADD UNIQUE KEY `unique_key` (`product`,`plant`,`date_submitted`);

--
-- Indexes for table `sourcing_external`
--
ALTER TABLE `sourcing_external`
  ADD PRIMARY KEY (`product_code`,`plant_code`),
  ADD KEY `plant_code` (`plant_code`);

--
-- Indexes for table `stock`
--
ALTER TABLE `stock`
  ADD PRIMARY KEY (`sr_no`),
  ADD UNIQUE KEY `unique_key` (`product`,`plant`,`date_submitted`);

--
-- Indexes for table `sto_demand`
--
ALTER TABLE `sto_demand`
  ADD PRIMARY KEY (`sr_no`),
  ADD UNIQUE KEY `unique_key` (`product`,`plant`,`date_submitted`);

--
-- Indexes for table `sto_receipt`
--
ALTER TABLE `sto_receipt`
  ADD PRIMARY KEY (`sr_no`),
  ADD UNIQUE KEY `unique_key` (`product`,`plant`,`date_submitted`);

--
-- Indexes for table `str_demand`
--
ALTER TABLE `str_demand`
  ADD PRIMARY KEY (`sr_no`),
  ADD UNIQUE KEY `unique_key` (`product`,`plant`,`date_submitted`);

--
-- Indexes for table `str_receipt`
--
ALTER TABLE `str_receipt`
  ADD PRIMARY KEY (`sr_no`),
  ADD UNIQUE KEY `unique_key` (`product`,`plant`,`date_submitted`);

--
-- Indexes for table `total_demand`
--
ALTER TABLE `total_demand`
  ADD PRIMARY KEY (`sr_no`),
  ADD UNIQUE KEY `unique_key` (`product`,`plant`,`date_submitted`);

--
-- Indexes for table `total_receipt`
--
ALTER TABLE `total_receipt`
  ADD PRIMARY KEY (`sr_no`),
  ADD UNIQUE KEY `unique_key` (`product`,`plant`,`date_submitted`);

--
-- Indexes for table `user_master`
--
ALTER TABLE `user_master`
  ADD PRIMARY KEY (`user_id`);

--
-- Indexes for table `vendor_master`
--
ALTER TABLE `vendor_master`
  ADD PRIMARY KEY (`vendor_code`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `country`
--
ALTER TABLE `country`
  MODIFY `country_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=195;

--
-- AUTO_INCREMENT for table `days_supply`
--
ALTER TABLE `days_supply`
  MODIFY `sr_no` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `forecast`
--
ALTER TABLE `forecast`
  MODIFY `sr_no` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=199;

--
-- AUTO_INCREMENT for table `indian_states`
--
ALTER TABLE `indian_states`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT for table `planned_order`
--
ALTER TABLE `planned_order`
  MODIFY `sr_no` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=161;

--
-- AUTO_INCREMENT for table `production_order`
--
ALTER TABLE `production_order`
  MODIFY `sr_no` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=158;

--
-- AUTO_INCREMENT for table `projected_balance`
--
ALTER TABLE `projected_balance`
  MODIFY `sr_no` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=286;

--
-- AUTO_INCREMENT for table `sales_order`
--
ALTER TABLE `sales_order`
  MODIFY `sr_no` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=109;

--
-- AUTO_INCREMENT for table `stock`
--
ALTER TABLE `stock`
  MODIFY `sr_no` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=84;

--
-- AUTO_INCREMENT for table `sto_demand`
--
ALTER TABLE `sto_demand`
  MODIFY `sr_no` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=104;

--
-- AUTO_INCREMENT for table `sto_receipt`
--
ALTER TABLE `sto_receipt`
  MODIFY `sr_no` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=155;

--
-- AUTO_INCREMENT for table `str_demand`
--
ALTER TABLE `str_demand`
  MODIFY `sr_no` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=104;

--
-- AUTO_INCREMENT for table `str_receipt`
--
ALTER TABLE `str_receipt`
  MODIFY `sr_no` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=160;

--
-- AUTO_INCREMENT for table `total_demand`
--
ALTER TABLE `total_demand`
  MODIFY `sr_no` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=129;

--
-- AUTO_INCREMENT for table `total_receipt`
--
ALTER TABLE `total_receipt`
  MODIFY `sr_no` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=104;

--
-- AUTO_INCREMENT for table `user_master`
--
ALTER TABLE `user_master`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `sourcing_external`
--
ALTER TABLE `sourcing_external`
  ADD CONSTRAINT `sourcing_external_ibfk_1` FOREIGN KEY (`product_code`) REFERENCES `product_master` (`product_code`),
  ADD CONSTRAINT `sourcing_external_ibfk_2` FOREIGN KEY (`plant_code`) REFERENCES `plant_master` (`plant_code`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
