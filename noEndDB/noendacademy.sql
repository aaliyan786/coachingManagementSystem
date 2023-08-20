-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 20, 2023 at 02:15 PM
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
-- Database: `noendacademy`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `loginID` varchar(5) NOT NULL,
  `First_name` varchar(20) NOT NULL,
  `Last_name` varchar(20) NOT NULL,
  `Gender` varchar(10) NOT NULL,
  `DOB` date NOT NULL,
  `CNIC` varchar(15) NOT NULL,
  `Email` varchar(50) NOT NULL,
  `Mobile` varchar(12) NOT NULL,
  `Address` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`loginID`, `First_name`, `Last_name`, `Gender`, `DOB`, `CNIC`, `Email`, `Mobile`, `Address`) VALUES
('admin', 'aali', 'khan', 'male', '2012-12-21', '4440122344561', 'email@gmail.com', '03332221111', 'admin Home');

-- --------------------------------------------------------

--
-- Table structure for table `logindetails`
--

CREATE TABLE `logindetails` (
  `loginID` varchar(5) NOT NULL,
  `password` varchar(255) NOT NULL,
  `status` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `logindetails`
--

INSERT INTO `logindetails` (`loginID`, `password`, `status`) VALUES
('123', '$2y$10$zvyprYjLNp4KmA/hEk80beTRGsn7yB7lHC3aVmr6ZOwMAYvDzRrT6', 'student'),
('admin', '$2y$10$82lhZAScjkSWGng/0TpzdO1w1UWsDmvCsKN1A/673IOLOWx5tzblS', 'admin'),
('new', '$2y$10$dHBC0MiR66qg0h.6yBTzPuxaTu1wA.rmM2r4MZVWldYQ43shJ4D0S', 'student'),
('teach', '$2y$10$ueQV0Sux04mDqBCr5apQYu1xn4LKLdp5sHNxSiMxOkSHP4p6ooACG', 'teacher');

-- --------------------------------------------------------

--
-- Table structure for table `student`
--

CREATE TABLE `student` (
  `loginID` varchar(5) NOT NULL,
  `First_name` varchar(20) NOT NULL,
  `Last_name` varchar(20) NOT NULL,
  `Gender` varchar(10) NOT NULL,
  `DOB` date NOT NULL,
  `CNIC` varchar(15) NOT NULL,
  `Email` varchar(50) NOT NULL,
  `Mobile` varchar(12) NOT NULL,
  `Address` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `student`
--

INSERT INTO `student` (`loginID`, `First_name`, `Last_name`, `Gender`, `DOB`, `CNIC`, `Email`, `Mobile`, `Address`) VALUES
('123', 'umer', 'khan', 'male', '0000-00-00', '4220166544789', 'email@gmail.com', '03332221111', 'HOme 3'),
('new', 'new', 'person', 'female', '2022-12-13', '23301-998423-2', 'testemail@nothing.com', '0333-2228768', 'home3');

-- --------------------------------------------------------

--
-- Table structure for table `teacher`
--

CREATE TABLE `teacher` (
  `loginID` varchar(5) NOT NULL,
  `First_name` varchar(20) NOT NULL,
  `Last_name` varchar(20) NOT NULL,
  `Gender` varchar(10) NOT NULL,
  `DOB` date NOT NULL,
  `CNIC` varchar(15) NOT NULL,
  `Email` varchar(50) NOT NULL,
  `Mobile` varchar(12) NOT NULL,
  `Address` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `teacher`
--

INSERT INTO `teacher` (`loginID`, `First_name`, `Last_name`, `Gender`, `DOB`, `CNIC`, `Email`, `Mobile`, `Address`) VALUES
('teach', 'Misbah', 'Khan', 'female', '0000-00-00', '4556544544554', 'teacher@gmail.com', '03332225555', 'Home 4');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`loginID`);

--
-- Indexes for table `logindetails`
--
ALTER TABLE `logindetails`
  ADD PRIMARY KEY (`loginID`);

--
-- Indexes for table `student`
--
ALTER TABLE `student`
  ADD PRIMARY KEY (`loginID`);

--
-- Indexes for table `teacher`
--
ALTER TABLE `teacher`
  ADD PRIMARY KEY (`loginID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
