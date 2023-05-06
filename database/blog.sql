-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 20, 2023 at 11:25 AM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `blog`
--

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `id` int(11) NOT NULL,
  `title` varchar(100) DEFAULT NULL,
  `description` varchar(255) NOT NULL,
  `img` varchar(255) NOT NULL,
  `date` datetime NOT NULL,
  `userid` int(11) NOT NULL,
  `category` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`id`, `title`, `description`, `img`, `date`, `userid`, `category`) VALUES
(2, 'Lorem ipsum dolor sit amet.', 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Temporibus repellendus magni sit perspiciatis assumenda, obcaecati veritatis explicabo unde at. Quisquam consectetur velit dolor quaerat nesciunt eaque explicabo, tempore recusandae temporibus paria', './assets/p7.jpg', '0000-00-00 00:00:00', 1, 'art'),
(3, 'Lorem ipsum dolor sit amet.', 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Temporibus repellendus magni sit perspiciatis assumenda, obcaecati veritatis explicabo unde at. Quisquam consectetur velit dolor quaerat nesciunt eaque explicabo, tempore recusandae temporibus paria', './assets/p7.jpg', '0000-00-00 00:00:00', 3, 'art'),
(4, 'Lorem ipsum dolor sit amet.', 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Temporibus repellendus magni sit perspiciatis assumenda, obcaecati veritatis explicabo unde at. Quisquam consectetur velit dolor quaerat nesciunt eaque explicabo, tempore recusandae temporibus paria', './assets/p7.jpg', '0000-00-00 00:00:00', 3, 'food'),
(5, 'Lorem ipsum dolor sit amet.', 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Temporibus repellendus magni sit perspiciatis assumenda, obcaecati veritatis explicabo unde at. Quisquam consectetur velit dolor quaerat nesciunt eaque explicabo, tempore recusandae temporibus paria', './assets/p7.jpg', '0000-00-00 00:00:00', 1, 'design');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `Id` int(11) NOT NULL,
  `username` varchar(100) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  `img` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`Id`, `username`, `email`, `password`, `img`) VALUES
(1, 'Jackon Shiundu', 'jackonshiundu2019@gmail.com', '$2a$10$p9DtdNdnukdo0uR0bq1o.O9N.btC5BmohLnj1OJPm1U3pZoqFx1pC', ''),
(2, 'Jery Lutta', 'jerry@gmail.com', '$2a$10$DwVpaVOljnCGBWBz8CvjteM2sFwXE5xYIe.YGIXkQCMcRxtnzfm76', ''),
(3, 'Graham Lutta', 'graham@gmail.com', '$2a$10$k9Wgq82EMMS4/jVWOIrvCuks0/eeI/.95/.D1sPNI1Aqe8/QHZ0Ge', '');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `userid` (`userid`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`Id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `posts`
--
ALTER TABLE `posts`
  ADD CONSTRAINT `posts_ibfk_1` FOREIGN KEY (`userid`) REFERENCES `user` (`Id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
