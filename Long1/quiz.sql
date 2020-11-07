-- phpMyAdmin SQL Dump
-- version 4.5.4.1deb2ubuntu2.1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Oct 13, 2020 at 11:47 AM
-- Server version: 5.7.28-0ubuntu0.16.04.2
-- PHP Version: 7.0.33-0ubuntu0.16.04.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `quiz`
--

-- --------------------------------------------------------

--
-- Table structure for table `question`
--

CREATE TABLE `question` (
  `ID` int(10) NOT NULL,
  `Question` varchar(255) NOT NULL,
  `Option1` varchar(100) NOT NULL,
  `Option2` varchar(100) NOT NULL,
  `Option3` varchar(100) NOT NULL,
  `Option4` varchar(100) NOT NULL,
  `Answer` varchar(100) NOT NULL,
  `Created` varchar(30) NOT NULL,
  `Date` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `question`
--

INSERT INTO `question` (`ID`, `Question`, `Option1`, `Option2`, `Option3`, `Option4`, `Answer`, `Created`, `Date`) VALUES
(1, 'What does HTML stands for?', 'Hypertext Machine Language', 'Hypertext and links markup language', 'Hypertext Markup Language', 'Hightext Machine Language', 'Hypertext Markup Language', 'admin', '13-Oct-2020'),
(5, 'Which of the following characters indicate closing of a tag?', '.', '/', '\\', '!', '/', 'admin', '13-Oct-2020'),
(6, 'What is the font-size of the h1 heading tag?', '3.5 em', '2.17 em', '2 em', '1.5 em', '2 em', 'admin', '13-Oct-2020'),
(7, 'How many attributes are there in HTML5?', '2', '4', '1', '5', '2', 'admin', '13-Oct-2020'),
(8, 'Which of the following attributes is used to add link to any element?', 'link', 'ref', 'href', 'newref', 'href', 'admin', '13-Oct-2020'),
(9, 'She works____Saturday.', 'at', 'to', 'in', 'on', 'on', 'admin2', '13-Oct-2020'),
(10, 'I stay at home ____ the morning.', 'at', 'to', 'in', 'on', 'in', 'admin2', '13-Oct-2020'),
(11, 'How do you get to work?____', 'By car', 'In car', 'By the car', 'On car', 'By car', 'admin2', '13-Oct-2020'),
(12, 'Do you like classical music? ____', 'Yes.', 'No.', 'No, I don\'t', 'Yes, I do', 'Yes, I do', 'admin2', '13-Oct-2020');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `Username` varchar(30) NOT NULL,
  `Password` varchar(30) NOT NULL,
  `Type` varchar(30) NOT NULL,
  `Email` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`Username`, `Password`, `Type`, `Email`) VALUES
('admin', '123456', 'Teacher', 'admin@gmail.com'),
('admin2', '123456', 'Teacher', 'admin2@gmail.com'),
('User', '123', 'User', 'user@gmail.com');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `question`
--
ALTER TABLE `question`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`Username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `question`
--
ALTER TABLE `question`
  MODIFY `ID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
