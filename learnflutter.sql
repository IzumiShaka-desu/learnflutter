-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 23, 2021 at 12:50 PM
-- Server version: 10.4.13-MariaDB
-- PHP Version: 7.4.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `learnflutter`
--

-- --------------------------------------------------------

--
-- Table structure for table `chart`
--

CREATE TABLE `chart` (
  `idChart` int(11) NOT NULL,
  `name` varchar(25) NOT NULL,
  `detail` text NOT NULL,
  `data` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`data`))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `chart`
--

INSERT INTO `chart` (`idChart`, `name`, `detail`, `data`) VALUES
(1, 'general purpose', 'A domain-specific programming language is designed to be used within a specific application domain. Examples include page description languages and database query languages.', '{\r\n  \"data\": [\r\n    {\"name\":\"php\",\"popularity\":2.5},\r\n    {\"name\":\"C#\",\"popularity\":3.9},\r\n    {\"name\":\"javascript\",\"popularity\":3.6},\r\n    {\"name\":\"java\",\"popularity\":3.8}\r\n  ],\r\n \r\n  \"total\": 13.8\r\n}'),
(2, 'data science', 'Data science is a field of study and practice that\'s focused on obtaining insights from data. Practitioners of data science use programming skills, statistics knowledge, and machine learning techniques to mine large data sets for patterns that can be used to analyze the past or even predict the future.', '{\r\n  \"data\": [\r\n    {\"name\":\"python\",\"popularity\":4.5},\r\n    {\"name\":\"julia\",\"popularity\":0.1},\r\n    {\"name\":\"R\",\"popularity\":2.5},\r\n    {\"name\":\"scala\",\"popularity\":0.3}\r\n  ],\r\n \r\n  \"total\": 7.4\r\n}'),
(3, 'mobile apps', 'Mobile app development is the act or process by which a mobile app is developed for mobile devices, such as personal digital assistants, enterprise digital assistants or mobile phones. ... The user is often the focus of interaction with their device, and the interface entails components of both hardware and software.', '{\r\n  \"data\": [\r\n    {\"name\":\"python\",\"popularity\":8.1},\r\n    {\"name\":\"javascript\",\"popularity\":7.1},\r\n    {\"name\":\"ruby\",\"popularity\":4.5},\r\n    {\"name\":\"scala\",\"popularity\":3.7}\r\n  ],\r\n \r\n  \"total\": 16.4\r\n}');

-- --------------------------------------------------------

--
-- Table structure for table `favorites`
--

CREATE TABLE `favorites` (
  `email` varchar(30) NOT NULL,
  `video_id` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `favorites`
--

INSERT INTO `favorites` (`email`, `video_id`) VALUES
('shusak@mail.com', 'asdadasd'),
('shi@m.com', 'StLsXxd9Y4w'),
('p@mail.com', 'StLsXxd9Y4w'),
('p@mail.com', '_fVofw5UlBk');

-- --------------------------------------------------------

--
-- Table structure for table `profile`
--

CREATE TABLE `profile` (
  `id` int(11) NOT NULL,
  `fullname` varchar(30) NOT NULL,
  `phone` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `profile`
--

INSERT INTO `profile` (`id`, `fullname`, `phone`) VALUES
(1, 'dfsfs', 7473475),
(10, '0895858', 0),
(11, '955855', 0);

-- --------------------------------------------------------

--
-- Table structure for table `userlogin`
--

CREATE TABLE `userlogin` (
  `id` int(11) NOT NULL,
  `email` varchar(30) NOT NULL,
  `password` varchar(128) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `userlogin`
--

INSERT INTO `userlogin` (`id`, `email`, `password`) VALUES
(1, 'sh@mail.com', 'e2b98325e39318c3819acc27fc81cccd784b7e9a'),
(2, 'shk@mail.ckm', '40bd001563085fc35165329ea1ff5c5ecbdbbeef'),
(3, 'se@mail.com', '00762ccfa703393e0daff813a6ecc19f7cd02421'),
(4, 'shusak@mail.com', '7c4a8d09ca3762af61e59520943dc26494f8941b'),
(5, 'shusak2@mail.com', '7c4a8d09ca3762af61e59520943dc26494f8941b'),
(6, 'shusak3@mail.com', '7c4a8d09ca3762af61e59520943dc26494f8941b'),
(7, 'shuuu@mail.com', '20eabe5d64b0e216796e834f52d61fd0b70332fc'),
(8, 'shi@m.com', '20eabe5d64b0e216796e834f52d61fd0b70332fc'),
(9, 'shi@ma.com', 'c65a9b7af4f9f41917caa6e29ac0550b8f525387'),
(10, 'shes@m.com', '7c4a8d09ca3762af61e59520943dc26494f8941b'),
(11, 'p@mail.com', '20eabe5d64b0e216796e834f52d61fd0b70332fc');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `chart`
--
ALTER TABLE `chart`
  ADD PRIMARY KEY (`idChart`);

--
-- Indexes for table `userlogin`
--
ALTER TABLE `userlogin`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `chart`
--
ALTER TABLE `chart`
  MODIFY `idChart` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `userlogin`
--
ALTER TABLE `userlogin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
