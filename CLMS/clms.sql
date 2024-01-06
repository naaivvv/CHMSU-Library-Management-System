-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 06, 2024 at 12:33 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.0.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `clms`
--

-- --------------------------------------------------------

--
-- Table structure for table `tbl_admin`
--

CREATE TABLE `tbl_admin` (
  `id` int(11) NOT NULL,
  `username` varchar(55) NOT NULL,
  `password` varchar(55) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_admin`
--

INSERT INTO `tbl_admin` (`id`, `username`, `password`) VALUES
(1, 'admin', 'password');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_book`
--

CREATE TABLE `tbl_book` (
  `id` int(11) NOT NULL,
  `student_id` varchar(11) NOT NULL,
  `book_id` varchar(11) NOT NULL,
  `course` varchar(255) NOT NULL,
  `firstname` varchar(55) NOT NULL,
  `lastname` varchar(55) NOT NULL,
  `email` varchar(55) NOT NULL,
  `booktitle` varchar(255) NOT NULL,
  `author` varchar(55) NOT NULL,
  `bookshelf` varchar(55) NOT NULL,
  `quantity` int(5) NOT NULL,
  `date_borrowed` timestamp NOT NULL DEFAULT current_timestamp(),
  `date_returned` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  `status` varchar(55) NOT NULL,
  `deadline` date NOT NULL,
  `remarks` varchar(55) NOT NULL,
  `fine` decimal(10,2) DEFAULT 0.00
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_book`
--

INSERT INTO `tbl_book` (`id`, `student_id`, `book_id`, `course`, `firstname`, `lastname`, `email`, `booktitle`, `author`, `bookshelf`, `quantity`, `date_borrowed`, `date_returned`, `status`, `deadline`, `remarks`, `fine`) VALUES
(2, '123456', '123457', 'Bachelor of Science in Hospitality Management', 'fnone', 'lnone', 'accone@gmail.com', 'bookone', 'authorone', '142', 78, '2023-12-23 08:38:52', '2023-12-30 12:54:39', 'Borrowed', '2023-12-31', 'Pending', 0.00),
(3, '123456', '123458', 'Bachelor of Science in Hospitality Management', 'fnone', 'lnone', 'accone@gmail.com', 'test', 'test', '124', 20, '2023-12-29 10:29:24', '0000-00-00 00:00:00', 'Borrowed', '2023-12-31', 'Pending', 0.00),
(4, '123456', '123458', 'Bachelor of Science in Hospitality Management', 'fnone', 'lnone', 'accone@gmail.com', 'test', 'test', '124', 20, '2023-12-29 10:29:24', '0000-00-00 00:00:00', 'Borrowed', '2023-12-31', 'Pending', 0.00),
(5, '320145', '123459', 'Bachelor of Science in Information Systems', 'Ivan', 'Bayog', 'test@gmail.com', 'test3', 'test3', '89', 112, '2023-10-02 08:43:25', '2023-12-26 06:50:28', 'Returned', '2023-12-31', 'On Time', 0.00),
(8, '320145', 'asdda', 'Bachelor of Science in Information Systems', 'Ivan', 'Bayog', 'test@gmail.com', 'gsadasd', 'fasd', '234', 22, '2023-12-26 08:18:33', '2023-12-26 11:09:19', 'Returned', '2024-01-02', 'On Time', 0.00),
(12, '123456', 'asdda', 'Bachelor of Science in Hospitality Management', 'fnone', 'lnone', 'accone@gmail.com', 'gsadasd', 'fasd', '234', 22, '2023-12-26 11:08:39', '2023-12-30 12:54:39', 'Returned', '2024-01-02', 'On Time', 0.00),
(14, '123456', '123458', 'Bachelor of Science in Hospitality Management', 'fnone', 'lnone', 'accone@gmail.com', 'test', 'test', '124', 20, '2023-12-29 10:29:24', '0000-00-00 00:00:00', 'Borrowed', '2024-01-05', 'Pending', 0.00),
(16, '320145', '123457', 'Bachelor of Science in Information Systems', 'Ivan', 'Bayog', 'test@gmail.com', 'bookone', 'authorone', '142', 78, '2023-12-29 10:32:59', NULL, 'Borrowed', '2024-01-05', 'Pending', 0.00),
(17, '320145', '99999', 'Bachelor of Science in Information Systems', 'Ivan', 'Bayog', 'test@gmail.com', 'ftest1', 'asd', 'asd', 23, '2023-12-20 11:50:03', '2024-01-06 11:24:52', 'Returned', '2023-12-27', 'Late', 10.00),
(18, '320145', '666666', 'Bachelor of Science in Information Systems', 'Ivan', 'Bayog', 'test@gmail.com', 'acvxz', 'erasdfasd', '102', 66, '2023-12-20 11:50:10', '0000-00-00 00:00:00', 'Borrowed', '2024-01-05', 'Pending', 0.00),
(19, '320145', '444444', 'Bachelor of Science in Information Systems', 'Ivan', 'Bayog', 'test@gmail.com', 'ftest5', 'asdffs', '234', 1, '2023-12-29 11:50:19', '2024-01-15 12:11:51', 'Returned', '2024-01-05', 'Late', 0.00),
(20, '320145', '77777', 'Bachelor of Science in Information Systems', 'Ivan', 'Bayog', 'test@gmail.com', 'ftest3', 'asdgsd', 'asd', 12, '2023-12-20 11:50:57', '2024-01-06 11:21:23', 'Returned', '2024-01-05', 'Late', 1.00);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_inventory`
--

CREATE TABLE `tbl_inventory` (
  `id` int(11) NOT NULL,
  `book_id` varchar(11) NOT NULL,
  `booktitle` varchar(255) NOT NULL,
  `author` varchar(55) NOT NULL,
  `bookshelf` varchar(55) NOT NULL,
  `quantity` int(5) NOT NULL,
  `borrowed` int(5) NOT NULL DEFAULT 0,
  `available` int(5) NOT NULL DEFAULT 0,
  `date_borrowed` timestamp NOT NULL DEFAULT current_timestamp(),
  `date_returned` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_inventory`
--

INSERT INTO `tbl_inventory` (`id`, `book_id`, `booktitle`, `author`, `bookshelf`, `quantity`, `borrowed`, `available`, `date_borrowed`, `date_returned`) VALUES
(1, '123456', 'El Fili', 'jose r', '102', 5, 1, 4, '2023-12-23 08:22:00', '2023-12-26 07:16:46'),
(2, '123457', 'bookone', 'authorone', '142', 78, 2, 76, '2023-12-23 08:38:52', '2023-12-29 10:32:59'),
(3, '123458', 'test', 'test', '124', 25, 3, 22, '2023-12-23 08:43:25', '2023-12-30 12:49:54'),
(5, '123459', 'test3', 'test3', '89', 112, 1, 111, '2023-10-02 08:43:25', '2023-12-25 13:31:29'),
(6, '123460', 'book2', 'author2', '142', 8, 4, 4, '2023-12-23 11:48:12', '2024-01-05 04:29:39'),
(12, 'asdda', 'gsadasd', 'fasd', '234', 22, 0, 22, '2023-12-25 20:59:38', '2023-12-26 11:09:19'),
(14, '99999', 'ftest1', 'asd', 'asd', 23, 0, 23, '2023-12-29 11:42:16', '2024-01-06 11:24:51'),
(15, '888888', 'ftest2', 'asd', '234', 55, 0, 55, '2023-12-29 11:42:33', NULL),
(16, '77777', 'ftest3', 'asdgsd', 'asd', 12, 0, 12, '2023-12-29 11:43:18', '2024-01-06 11:21:23'),
(17, '666666', 'acvxz', 'erasdfasd', '102', 70, 1, 69, '2023-12-29 11:43:52', '2023-12-30 12:41:51'),
(18, '55555', 'ftest4', 'dfsfczxcs', '89', 3, 0, 3, '2023-12-29 11:44:27', NULL),
(19, '444444', 'ftest5', 'asdffs', '234', 2, 0, 2, '2023-12-29 11:45:04', '2023-12-30 12:33:59');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user`
--

CREATE TABLE `tbl_user` (
  `id` int(11) NOT NULL,
  `student_id` varchar(11) NOT NULL,
  `course` varchar(255) NOT NULL,
  `firstname` varchar(55) NOT NULL,
  `lastname` varchar(55) NOT NULL,
  `gender` varchar(10) NOT NULL,
  `age` int(3) NOT NULL,
  `username` varchar(55) NOT NULL,
  `password` varchar(55) NOT NULL,
  `email` varchar(55) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_user`
--

INSERT INTO `tbl_user` (`id`, `student_id`, `course`, `firstname`, `lastname`, `gender`, `age`, `username`, `password`, `email`) VALUES
(2, '320145', 'Bachelor of Science in Information Systems', 'Ivan', 'Bayog', '', 0, 'test', 'test', 'test@gmail.com'),
(3, '123456', 'Bachelor of Science in Hospitality Management', 'fnone', 'lnone', '', 0, 'accone', 'accone', 'accone@gmail.com'),
(4, 'gtest', 'NONE', 'g', 'test', 'Female', 20, 'gtest', 'gtest', 'gtest@gmail.com');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tbl_admin`
--
ALTER TABLE `tbl_admin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_book`
--
ALTER TABLE `tbl_book`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_inventory`
--
ALTER TABLE `tbl_inventory`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_user`
--
ALTER TABLE `tbl_user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tbl_admin`
--
ALTER TABLE `tbl_admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tbl_book`
--
ALTER TABLE `tbl_book`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `tbl_inventory`
--
ALTER TABLE `tbl_inventory`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `tbl_user`
--
ALTER TABLE `tbl_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
