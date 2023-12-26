-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 26, 2023 at 12:22 PM
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
  `remarks` varchar(55) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_book`
--

INSERT INTO `tbl_book` (`id`, `student_id`, `book_id`, `course`, `firstname`, `lastname`, `email`, `booktitle`, `author`, `bookshelf`, `quantity`, `date_borrowed`, `date_returned`, `status`, `deadline`, `remarks`) VALUES
(1, '320145', '123456', 'Bachelor of Science in Information Systems', 'Ivan', 'Bayog', 'test@gmail.com', 'El Fili', 'jose r', '102', 5, '2023-12-23 08:22:00', '2023-12-26 06:50:28', 'Returned', '2023-12-31', 'Late'),
(2, '123456', '123457', 'Bachelor of Science in Hospitality Management', 'fnone', 'lnone', 'acconey@gmail.com', 'bookone', 'authorone', '142', 78, '2023-12-23 08:38:52', '2023-12-26 06:50:28', 'Borrowed', '2023-12-31', 'Pending'),
(3, '320145', '123458', 'Bachelor of Science in Information Systems', 'Ivan', 'Bayog', 'test@gmail.com', 'test', 'test', '124', 20, '2023-12-23 08:43:25', '2023-12-26 06:50:28', 'Borrowed', '2023-12-31', 'Pending'),
(4, '320145', '123458', 'Bachelor of Science in Information Systems', 'Ivan', 'Bayog', 'test@gmail.com', 'test', 'test', '124', 20, '2023-11-05 08:43:25', '2023-12-26 06:50:28', 'Borrowed', '2023-12-31', 'Pending'),
(5, '320145', '123459', 'Bachelor of Science in Information Systems', 'Ivan', 'Bayog', 'test@gmail.com', 'test3', 'test3', '89', 112, '2023-10-02 08:43:25', '2023-12-26 06:50:28', 'Returned', '2023-12-31', 'On Time'),
(6, '123456', '123460', 'Bachelor of Science in Hospitality Management', 'fnone', 'lnone', 'acconey@gmail.com', 'book2', 'author2', '142', 4, '2023-12-23 11:48:12', '2023-12-26 06:50:28', 'Borrowed', '2023-12-31', 'Pending'),
(8, '320145', 'asdda', 'Bachelor of Science in Information Systems', 'Ivan', 'Bayog', 'test@gmail.com', 'gsadasd', 'fasd', '234', 22, '2023-12-26 08:18:33', '2023-12-26 11:09:19', 'Returned', '2024-01-02', 'On Time'),
(12, '123456', 'asdda', 'Bachelor of Science in Hospitality Management', 'fnone', 'lnone', 'acconey@gmail.com', 'gsadasd', 'fasd', '234', 22, '2023-12-26 11:08:39', '2023-12-26 11:09:19', 'Returned', '2024-01-02', 'On Time');

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
(2, '123457', 'bookone', 'authorone', '142', 78, 1, 77, '2023-12-23 08:38:52', '2023-12-25 13:31:29'),
(3, '123458', 'test', 'test', '124', 20, 2, 18, '2023-12-23 08:43:25', '2023-12-25 13:31:29'),
(5, '123459', 'test3', 'test3', '89', 112, 1, 111, '2023-10-02 08:43:25', '2023-12-25 13:31:29'),
(6, '123460', 'book2', 'author2', '142', 4, 1, 3, '2023-12-23 11:48:12', '2023-12-25 17:39:47'),
(12, 'asdda', 'gsadasd', 'fasd', '234', 22, 0, 22, '2023-12-25 20:59:38', '2023-12-26 11:09:19');

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
  `username` varchar(55) NOT NULL,
  `password` varchar(55) NOT NULL,
  `email` varchar(55) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_user`
--

INSERT INTO `tbl_user` (`id`, `student_id`, `course`, `firstname`, `lastname`, `username`, `password`, `email`) VALUES
(2, '320145', 'NONE', 'Ivan', 'Bayog', 'test', 'test', 'test@gmail.com'),
(3, '123456', 'Bachelor of Science in Hospitality Management', 'fnone', 'lnone', 'accone', 'accone', 'acconey@gmail.com');

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `tbl_inventory`
--
ALTER TABLE `tbl_inventory`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `tbl_user`
--
ALTER TABLE `tbl_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
