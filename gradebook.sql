-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 29, 2017 at 09:53 AM
-- Server version: 5.7.18-log
-- PHP Version: 7.1.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `gradebook`
--

-- --------------------------------------------------------

--
-- Table structure for table `book`
--

CREATE TABLE `book` (
  `Book_id` int(10) UNSIGNED NOT NULL,
  `Book_name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `book`
--

INSERT INTO `book` (`Book_id`, `Book_name`) VALUES
(1001, 'The Age of Unreason'),
(1002, 'Built to Last: Successful Habits of Visionary Companies'),
(1003, 'Competing for the Future'),
(1004, 'Competitive Strategy: Techniques for Analyzing Industries and Competitors'),
(1005, 'Being and Time'),
(1006, 'The Republic'),
(1007, 'Critique of Pure Reason'),
(1008, 'Thus Spoke Zarathustra'),
(1009, 'Automata and Compiler Design'),
(1010, 'Introduction to Algorithms'),
(1011, 'Computer Architecture and Organization'),
(1012, 'World Wide Web'),
(1013, 'Fingerprints of Gods'),
(1014, 'Forbidden Archeology'),
(1015, 'The Bible Unearthed'),
(1016, 'Gods, Graves and Scholars'),
(1017, 'Thomas\' Calculus'),
(1018, 'Introduction to Graph Theory'),
(1019, 'Euclid\'s Elements'),
(1020, 'Probability Theory and Game Theory');

-- --------------------------------------------------------

--
-- Table structure for table `course`
--

CREATE TABLE `course` (
  `Course_number` int(10) UNSIGNED NOT NULL,
  `Section_number` int(10) UNSIGNED DEFAULT NULL,
  `Term` varchar(10) DEFAULT NULL,
  `Points` int(10) UNSIGNED DEFAULT NULL,
  `Weight` int(10) UNSIGNED NOT NULL,
  `Grades` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `course`
--

INSERT INTO `course` (`Course_number`, `Section_number`, `Term`, `Points`, `Weight`, `Grades`) VALUES
(101, 1, 'Spring', 4, 100, 8),
(102, 1, 'Spring', 1, 25, 2),
(103, 5, 'Spring', 4, 100, 8),
(104, 5, 'Fall', 2, 50, 4),
(105, 4, 'Fall', 3, 75, 6),
(106, 1, 'Spring', NULL, 100, 8),
(107, 4, 'Spring', 2, 50, 4),
(108, 2, 'Fall', 3, 75, 6),
(109, NULL, 'Spring', 3, 75, 6),
(110, 3, NULL, 1, 25, 2);

-- --------------------------------------------------------

--
-- Table structure for table `grading_component`
--

CREATE TABLE `grading_component` (
  `Course_number` int(10) UNSIGNED NOT NULL,
  `Exam_title` varchar(50) NOT NULL,
  `Exam_weight` int(10) UNSIGNED DEFAULT NULL,
  `Maximum_points` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `grading_component`
--

INSERT INTO `grading_component` (`Course_number`, `Exam_title`, `Exam_weight`, `Maximum_points`) VALUES
(101, 'End Semester', 50, 100),
(101, 'Lab Exam', 10, 20),
(101, 'Mid Semester', 25, 25),
(102, 'End Semester', 50, 100),
(102, 'Lab Exam', 15, NULL),
(102, 'Mid Semester', 25, NULL),
(103, 'End Semester', 50, NULL),
(103, 'Lab Exam', NULL, 25),
(103, 'Mid Semester', NULL, 50),
(104, 'End Semester', NULL, 100),
(104, 'Mid Semester', 20, 40),
(105, 'End Semester', NULL, NULL),
(105, 'Mid Semester', 20, 20),
(106, 'End Semester', 40, 80),
(107, 'Assignment', 5, 10),
(107, 'End Semester', 40, NULL),
(108, 'Assignment', 5, NULL),
(108, 'End Semester', 35, 100),
(109, 'End Semester', NULL, 70),
(110, 'End Semester', 35, 70);

-- --------------------------------------------------------

--
-- Table structure for table `instructor`
--

CREATE TABLE `instructor` (
  `Person_id` int(10) UNSIGNED NOT NULL,
  `Instructor_id` int(10) UNSIGNED NOT NULL,
  `Salary` int(10) UNSIGNED DEFAULT NULL,
  `Grade_point` int(10) UNSIGNED DEFAULT NULL,
  `Mentor_id` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `instructor`
--

INSERT INTO `instructor` (`Person_id`, `Instructor_id`, `Salary`, `Grade_point`, `Mentor_id`) VALUES
(101, 1, 25000, 70, NULL),
(103, 4, 10000, 65, 1),
(105, 2, NULL, 75, NULL),
(107, 3, 10000, 60, 1),
(108, 5, NULL, NULL, 2);

-- --------------------------------------------------------

--
-- Table structure for table `instructor_phone_number`
--

CREATE TABLE `instructor_phone_number` (
  `Person_id` int(10) UNSIGNED NOT NULL,
  `Instructor_id` int(10) UNSIGNED NOT NULL,
  `Phone_number` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `instructor_phone_number`
--

INSERT INTO `instructor_phone_number` (`Person_id`, `Instructor_id`, `Phone_number`) VALUES
(101, 1, '+1 (792) 223-6178'),
(101, 1, '+1 (792) 223-9810'),
(103, 4, '+1 (792) 223-1890'),
(103, 4, '+1 (792) 223-9678'),
(105, 2, '+1 (792) 223-6734'),
(107, 3, '+1 (792) 223-2001'),
(107, 3, '+1 (792) 223-8901'),
(108, 5, '+1 (792) 223-1115');

-- --------------------------------------------------------

--
-- Table structure for table `person`
--

CREATE TABLE `person` (
  `Person_id` int(10) UNSIGNED NOT NULL,
  `First_name` varchar(30) NOT NULL,
  `Middle_initials` varchar(30) DEFAULT NULL,
  `Last_name` varchar(30) NOT NULL,
  `Date_of_birth` date NOT NULL,
  `Sex` varchar(10) NOT NULL,
  `Email` varchar(100) NOT NULL,
  `Street` varchar(50) NOT NULL,
  `City` varchar(50) NOT NULL,
  `State` varchar(50) NOT NULL,
  `Pin_code` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `person`
--

INSERT INTO `person` (`Person_id`, `First_name`, `Middle_initials`, `Last_name`, `Date_of_birth`, `Sex`, `Email`, `Street`, `City`, `State`, `Pin_code`) VALUES
(101, 'Dale', NULL, 'Cooper', '1959-02-22', 'Male', 'dalecooper@microsoft.live.uk', '132 Barry Street', 'Yakima', 'Washington', 98901),
(102, 'Harry', 'Williams', 'Trumann', '1946-01-24', 'Male', 'harry_trumann@gmail.com', '202 South Street', 'Vancouver', 'Washington', 98660),
(103, 'Shelly', NULL, 'Johnson', '1967-05-24', 'Female', 'sjohnson@gmail.com', '14 12th Street', 'San Diego', 'California', 92101),
(104, 'Bobby', 'Mariel', 'Briggs', '1970-12-12', 'Male', 'bobbybriggs@microsoft.live.uk', '9 Pond Road', 'Sparks', 'Virginia', 89431),
(105, 'Donna', 'Laura', 'Hayward', '1970-03-24', 'Female', 'dhayward@yahoo.co.in', '120 16th Street', 'Davenport', 'Iowa', 52801),
(106, 'Audrey', 'David', 'Mathew', '1965-02-01', 'Female', 'amathew@gmail.com', '342 19th St', 'Detroit', 'Michigan', 48222),
(107, 'James', NULL, 'Hurley', '1967-01-02', 'Male', 'jhurley@microsoft.live.uk', '2578 Cliff Street', 'Queens', 'New York', 11427),
(108, 'Lucy', NULL, 'Moran', '1954-11-27', 'Male', 'lucymoran@microsoft.live.uk', '178 Dover Street', 'Tucson', 'Arizona', 85701),
(109, 'Tommy', 'Dave', 'Hill', '1951-12-21', 'Male', 'tommyhill@gmail.com', '672 High Plains', 'Hollywood', 'California', 90078),
(110, 'Andy', NULL, 'Brennman', '1960-12-27', 'Male', 'andybrennan@gmail.com', '281 4th Street', 'Jacksonville', 'North Carolina', 28540),
(111, 'Emma', NULL, 'Simpson', '1985-06-12', 'Female', 'esimpson@gmail.com', 'Birmingham', 'West Midlands', 'England', 56467),
(112, 'Colt', NULL, 'Anderson', '1765-09-09', 'Male', 'coltanderson@gmail.com', 'Jermyn Street', 'Westminster', 'England', 76673),
(113, 'Daniel', NULL, 'Favre', '1997-12-09', 'Female', 'daniel_favre@mirosoft.live.uk', 'Elysees Avenue', 'Paris', 'France', 55463),
(114, 'Giovanni', 'Armano', 'Cupello', '1966-04-29', 'Male', 'cupello_giovanni@gmail.com', 'Via Nazionale', 'Rome', 'Italy', 67632),
(115, 'Eva', NULL, 'Schmidt', '1997-10-26', 'Female', 'eva_schmidt@gmail.com', 'Max Brose Street', 'Bavaria', 'Berlin', 66839);

-- --------------------------------------------------------

--
-- Table structure for table `recommends`
--

CREATE TABLE `recommends` (
  `Person_id` int(10) UNSIGNED NOT NULL,
  `Book_id` int(10) UNSIGNED NOT NULL,
  `Instructor_id` int(10) UNSIGNED NOT NULL,
  `Course_number` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `recommends`
--

INSERT INTO `recommends` (`Person_id`, `Book_id`, `Instructor_id`, `Course_number`) VALUES
(101, 1009, 1, 101),
(103, 1004, 4, 102),
(105, 1008, 2, 103),
(107, 1016, 3, 104),
(108, 1018, 5, 105),
(101, 1010, 1, 106),
(103, 1001, 4, 107),
(105, 1007, 2, 108),
(107, 1016, 3, 109),
(108, 1017, 5, 110);

-- --------------------------------------------------------

--
-- Table structure for table `room`
--

CREATE TABLE `room` (
  `Person_id` int(10) UNSIGNED NOT NULL,
  `Room_number` int(10) UNSIGNED NOT NULL,
  `Block_id` int(10) UNSIGNED NOT NULL,
  `Wing_id` int(10) UNSIGNED NOT NULL,
  `Student_id` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `room`
--

INSERT INTO `room` (`Person_id`, `Room_number`, `Block_id`, `Wing_id`, `Student_id`) VALUES
(102, 1, 1, 1, 1),
(104, 1, 1, 2, 2),
(106, 2, 1, 1, 3),
(109, 2, 1, 2, 4),
(110, 1, 2, 1, 5),
(111, 1, 2, 2, 6),
(112, 2, 2, 1, 7),
(113, 2, 2, 2, 8);

-- --------------------------------------------------------

--
-- Table structure for table `student`
--

CREATE TABLE `student` (
  `Person_id` int(10) UNSIGNED NOT NULL,
  `Student_id` int(10) UNSIGNED NOT NULL,
  `Branch` varchar(30) NOT NULL,
  `College_email` varchar(100) DEFAULT NULL,
  `Year` int(10) UNSIGNED NOT NULL,
  `Course_number` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `student`
--

INSERT INTO `student` (`Person_id`, `Student_id`, `Branch`, `College_email`, `Year`, `Course_number`) VALUES
(102, 1, 'Mathematics', '102_1.harry@princeton.edu', 4, 101),
(104, 2, 'Philosophy', '104_2.bobby@princeton.edu', 4, NULL),
(106, 3, 'Mathematics', '106_3.audrey@princeton.edu', 4, 106),
(109, 4, 'Business Management', '109_4.tommy@princeton.edu', 3, 106),
(110, 5, 'Philosophy', '110_5.andy@princeton.edu', 3, 106),
(111, 6, 'Computer Science', '111_6.emma@princeton.edu', 3, 101),
(112, 7, 'Archeology', '112_7.colt@princeton.edu', 2, 107),
(113, 8, 'Archeology', '113_8.daniel@princeton.edu', 2, 109),
(114, 9, 'Computer Science', NULL, 1, 107),
(115, 10, 'Business Management', NULL, 1, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `teaches`
--

CREATE TABLE `teaches` (
  `Person_id` int(10) UNSIGNED NOT NULL,
  `Instructor_id` int(10) UNSIGNED NOT NULL,
  `Course_number` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `teaches`
--

INSERT INTO `teaches` (`Person_id`, `Instructor_id`, `Course_number`) VALUES
(101, 1, 101),
(103, 4, 102),
(105, 2, 103),
(107, 3, 104),
(108, 5, 105),
(101, 1, 106),
(103, 4, 107),
(105, 2, 108),
(107, 3, 109),
(108, 5, 110);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `book`
--
ALTER TABLE `book`
  ADD PRIMARY KEY (`Book_id`);

--
-- Indexes for table `course`
--
ALTER TABLE `course`
  ADD PRIMARY KEY (`Course_number`);

--
-- Indexes for table `grading_component`
--
ALTER TABLE `grading_component`
  ADD PRIMARY KEY (`Course_number`,`Exam_title`);

--
-- Indexes for table `instructor`
--
ALTER TABLE `instructor`
  ADD PRIMARY KEY (`Person_id`,`Instructor_id`);

--
-- Indexes for table `instructor_phone_number`
--
ALTER TABLE `instructor_phone_number`
  ADD PRIMARY KEY (`Person_id`,`Instructor_id`,`Phone_number`);

--
-- Indexes for table `person`
--
ALTER TABLE `person`
  ADD PRIMARY KEY (`Person_id`);

--
-- Indexes for table `recommends`
--
ALTER TABLE `recommends`
  ADD PRIMARY KEY (`Book_id`,`Person_id`,`Instructor_id`,`Course_number`),
  ADD KEY `Person_id` (`Person_id`,`Instructor_id`),
  ADD KEY `Course_number` (`Course_number`);

--
-- Indexes for table `room`
--
ALTER TABLE `room`
  ADD PRIMARY KEY (`Room_number`,`Block_id`,`Wing_id`),
  ADD KEY `Person_id` (`Person_id`,`Student_id`);

--
-- Indexes for table `student`
--
ALTER TABLE `student`
  ADD PRIMARY KEY (`Person_id`,`Student_id`),
  ADD KEY `Course_number` (`Course_number`);

--
-- Indexes for table `teaches`
--
ALTER TABLE `teaches`
  ADD PRIMARY KEY (`Person_id`,`Instructor_id`,`Course_number`),
  ADD KEY `Course_number` (`Course_number`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `book`
--
ALTER TABLE `book`
  MODIFY `Book_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1021;

--
-- AUTO_INCREMENT for table `course`
--
ALTER TABLE `course`
  MODIFY `Course_number` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=111;

--
-- AUTO_INCREMENT for table `person`
--
ALTER TABLE `person`
  MODIFY `Person_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=116;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `grading_component`
--
ALTER TABLE `grading_component`
  ADD CONSTRAINT `grading_component_ibfk_1` FOREIGN KEY (`Course_number`) REFERENCES `course` (`Course_number`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `instructor`
--
ALTER TABLE `instructor`
  ADD CONSTRAINT `instructor_ibfk_1` FOREIGN KEY (`Person_id`) REFERENCES `person` (`Person_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `instructor_phone_number`
--
ALTER TABLE `instructor_phone_number`
  ADD CONSTRAINT `instructor_phone_number_ibfk_1` FOREIGN KEY (`Person_id`,`Instructor_id`) REFERENCES `instructor` (`Person_id`, `Instructor_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `recommends`
--
ALTER TABLE `recommends`
  ADD CONSTRAINT `recommends_ibfk_1` FOREIGN KEY (`Book_id`) REFERENCES `book` (`Book_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `recommends_ibfk_2` FOREIGN KEY (`Person_id`,`Instructor_id`) REFERENCES `instructor` (`Person_id`, `Instructor_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `recommends_ibfk_3` FOREIGN KEY (`Course_number`) REFERENCES `course` (`Course_number`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `room`
--
ALTER TABLE `room`
  ADD CONSTRAINT `room_ibfk_1` FOREIGN KEY (`Person_id`,`Student_id`) REFERENCES `student` (`Person_id`, `Student_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `student`
--
ALTER TABLE `student`
  ADD CONSTRAINT `student_ibfk_1` FOREIGN KEY (`Person_id`) REFERENCES `person` (`Person_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `student_ibfk_2` FOREIGN KEY (`Course_number`) REFERENCES `course` (`Course_number`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `teaches`
--
ALTER TABLE `teaches`
  ADD CONSTRAINT `teaches_ibfk_1` FOREIGN KEY (`Person_id`,`Instructor_id`) REFERENCES `instructor` (`Person_id`, `Instructor_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `teaches_ibfk_2` FOREIGN KEY (`Course_number`) REFERENCES `course` (`Course_number`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
