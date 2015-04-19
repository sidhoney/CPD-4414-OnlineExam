-- phpMyAdmin SQL Dump
-- version 4.1.6
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Apr 19, 2015 at 05:43 AM
-- Server version: 5.6.16
-- PHP Version: 5.5.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `onlineexamproject`
--

-- --------------------------------------------------------

--
-- Table structure for table `administrator_list`
--

CREATE TABLE IF NOT EXISTS `administrator_list` (
  `UserId` int(11) NOT NULL,
  PRIMARY KEY (`UserId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `administrator_list`
--

INSERT INTO `administrator_list` (`UserId`) VALUES
(4);

-- --------------------------------------------------------

--
-- Table structure for table `exam_list`
--

CREATE TABLE IF NOT EXISTS `exam_list` (
  `ExamId` int(11) NOT NULL,
  `ExamName` varchar(50) NOT NULL,
  `ExamDescription` varchar(50) NOT NULL,
  PRIMARY KEY (`ExamId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `exam_list`
--

INSERT INTO `exam_list` (`ExamId`, `ExamName`, `ExamDescription`) VALUES
(12345, 'Java 2', 'Exam on Java 2\r<BR>');

-- --------------------------------------------------------

--
-- Table structure for table `exam_question_bank`
--

CREATE TABLE IF NOT EXISTS `exam_question_bank` (
  `ExamId` int(11) NOT NULL,
  `QuestionNo` int(11) NOT NULL,
  `Question` varchar(100) NOT NULL,
  `OptionA` varchar(20) NOT NULL,
  `OptionB` varchar(20) NOT NULL,
  `OptionC` varchar(20) NOT NULL,
  `OptionD` varchar(20) NOT NULL,
  `Answer` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `exam_question_bank`
--

INSERT INTO `exam_question_bank` (`ExamId`, `QuestionNo`, `Question`, `OptionA`, `OptionB`, `OptionC`, `OptionD`, `Answer`) VALUES
(12345, 1, 'Which four options describe the correct default values for array elements of the types indicated?', 'int -> 0', 'String -> "null"', 'Dog -> null', 'char -> ''\\u0000''', 'OptionA'),
(12345, 2, 'dsadfasfd', 'dasdas', 'asdasdasdas', 'qwedwa', 'asdasdasdasd', 'OptionB'),
(12345, 3, 'asdasdq32er3q2a', 'asdfasfwqe', 'dadasdasdq23de', 'sdasdqd', 'asdqadeq2wed', 'OptionA'),
(12345, 4, 'asdasdeqwdeaqdzsdd', 'sadadasdasf', 'adfsadasdasd', 'asdasf23qre23qr', 'zdfsdfasfas', 'OptionD'),
(12345, 5, 'sad132eqade', 'asdasdasdfaf', 'asdsadasdq', 'wedsd', 'fsdgfsghsdfh', 'OptionD');

-- --------------------------------------------------------

--
-- Table structure for table `exam_results`
--

CREATE TABLE IF NOT EXISTS `exam_results` (
  `UEID` varchar(20) NOT NULL,
  `ExamId` int(11) NOT NULL,
  `UserId` int(11) NOT NULL,
  `ExamName` varchar(50) NOT NULL,
  `MarksScored` int(11) NOT NULL,
  `TimeStamp` timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  PRIMARY KEY (`UserId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `login_credentials`
--

CREATE TABLE IF NOT EXISTS `login_credentials` (
  `UserId` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `Username` varchar(50) NOT NULL,
  `Password` varchar(50) NOT NULL,
  PRIMARY KEY (`UserId`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `login_credentials`
--

INSERT INTO `login_credentials` (`UserId`, `Username`, `Password`) VALUES
(4, 'sidhoney', 'honeysid'),
(5, 'anand', 'anana');

-- --------------------------------------------------------

--
-- Table structure for table `user_information`
--

CREATE TABLE IF NOT EXISTS `user_information` (
  `Name` varchar(50) NOT NULL,
  `Age` int(11) NOT NULL,
  `Address` varchar(100) NOT NULL,
  `Phone` varchar(10) NOT NULL,
  `Email` varchar(50) NOT NULL,
  `UserId` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`UserId`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `user_information`
--

INSERT INTO `user_information` (`Name`, `Age`, `Address`, `Phone`, `Email`, `UserId`) VALUES
('Sidhartha Gopinath', 28, '817 Devine Street, Apt 102, Sarnia, N7T 1X3, Canada', '2264022848', 'sidharthagopinath@outlook.com', 4),
('Anand', 20, '800 Indian Road', '1234567890', 'anand@ymail.com', 5);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
