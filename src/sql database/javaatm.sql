-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 02, 2023 at 06:04 AM
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
-- Table structure for table `transactionhistory`
--

CREATE TABLE `transactionhistory` (
  `TransactionID` int(11) NOT NULL,
  `TransactionType` enum('Deposit','Withdrawal','Transfer') NOT NULL,
  `Amount` double NOT NULL,
  `FromAccountID` bigint(20) DEFAULT NULL,
  `ToAccountID` bigint(20) DEFAULT NULL,
  `ByAccountName` varchar(50) NOT NULL,
  `Timestamp` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `transactionhistory`
--

INSERT INTO `transactionhistory` (`TransactionID`, `TransactionType`, `Amount`, `FromAccountID`, `ToAccountID`, `ByAccountName`, `Timestamp`) VALUES
(4, 'Transfer', 1000, 1234567890, 3456789012, 'Utsab Dahal', '2023-09-01 02:44:22'),
(5, 'Deposit', 5000, 1234567890, 1234567890, 'Utsab Dahal', '2023-09-01 03:19:26'),
(6, 'Transfer', 1000, 3456789012, 1234567890, 'Dhiraj Jirel', '2023-09-01 03:36:50'),
(7, 'Deposit', 1234, 1234567890, 1234567890, 'Utsab Dahal', '2023-09-02 02:47:26'),
(8, 'Transfer', 2200, 3456789012, 1234567890, 'Dhiraj Jirel', '2023-09-02 02:50:20');

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
(1234567890, 'Utsab Dahal', 1234, 278221, 1),
(2345678901, 'Apson Jirel', 2345, 283255, 0),
(3456789012, 'Dhiraj Jirel', 3456, 273821, 1),
(4567890123, 'Chitra Prasad Acharya', 4567, 248148, 0),
(5678901234, 'Pasang Gelbu Sherpa', 5678, 220499, 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `transactionhistory`
--
ALTER TABLE `transactionhistory`
  ADD PRIMARY KEY (`TransactionID`),
  ADD KEY `FromAccountID` (`FromAccountID`),
  ADD KEY `ToAccountID` (`ToAccountID`);

--
-- Indexes for table `user_accounts`
--
ALTER TABLE `user_accounts`
  ADD PRIMARY KEY (`card_number`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `transactionhistory`
--
ALTER TABLE `transactionhistory`
  MODIFY `TransactionID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `transactionhistory`
--
ALTER TABLE `transactionhistory`
  ADD CONSTRAINT `transactionhistory_ibfk_1` FOREIGN KEY (`FromAccountID`) REFERENCES `user_accounts` (`card_number`),
  ADD CONSTRAINT `transactionhistory_ibfk_2` FOREIGN KEY (`ToAccountID`) REFERENCES `user_accounts` (`card_number`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
