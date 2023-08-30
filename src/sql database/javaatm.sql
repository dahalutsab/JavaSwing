-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 30, 2023 at 04:27 AM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `javaatm`
--

-- --------------------------------------------------------

--
-- Table structure for table `user_accounts`
--

CREATE TABLE `user_accounts` (
  `card_number` bigint(20) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `pin` int(11) DEFAULT NULL,
  `balance` double DEFAULT NULL,
  `status` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user_accounts`
--

INSERT INTO `user_accounts` (`card_number`, `name`, `pin`, `balance`, `status`) VALUES
(1234567890, 'Utsab Dahal', 1234, 281255, 1),
(2345678901, 'Apson Jirel', 2345, 100, 0),
(3456789012, 'Dhiraj Jirel', 3456, 41956, 1),
(4567890123, 'Chitra Prasad Acharya', 4567, 248148, 0),
(5678901234, 'Pasang Gelbu Sherpa', 5678, 220499, 1);

-- --------------------------------------------------------

--
-- Table structure for table `user_history`
--

CREATE TABLE `user_history` (
  `id` int(5) NOT NULL,
  `card_number` bigint(20) NOT NULL,
  `name` varchar(50) NOT NULL,
  `history` varchar(200) NOT NULL,
  `date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user_history`
--

INSERT INTO `user_history` (`id`, `card_number`, `name`, `history`, `date`) VALUES
(6, 1234567890, 'Utsab Dahal', 'Rs.200.0 Withdrawn', '2023-08-02 09:59:32'),
(7, 1234567890, 'Utsab Dahal', 'Rs.500.0 Withdrawn', '2023-08-02 10:01:51'),
(8, 1234567890, 'Utsab Dahal', 'Rs.15000.0 Withdrawn', '2023-08-02 10:03:40'),
(9, 1234567890, 'Utsab Dahal', 'Rs.15500.0 Withdrawn', '2023-08-02 10:03:55'),
(10, 1234567890, 'Utsab Dahal', 'Rs.25000.0 Withdrawn', '2023-08-02 10:04:26'),
(11, 1234567890, 'Utsab Dahal', 'Rs.50000 Deposited', '2023-08-02 10:05:25'),
(12, 1234567890, 'Utsab Dahal', 'Rs.100 Deposited', '2023-08-02 10:06:19'),
(13, 2345678901, 'Apson Jirel', 'Rs.23453 Deposited', '2023-08-02 19:04:51'),
(14, 2345678901, 'Apson Jirel', 'Rs.500.0 Withdrawn', '2023-08-02 19:05:06'),
(15, 2345678901, 'Apson Jirel', 'Rs.600 Deposited', '2023-08-02 19:05:39');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `user_accounts`
--
ALTER TABLE `user_accounts`
  ADD PRIMARY KEY (`card_number`);

--
-- Indexes for table `user_history`
--
ALTER TABLE `user_history`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `user_history`
--
ALTER TABLE `user_history`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
