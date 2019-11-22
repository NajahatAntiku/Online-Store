-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 13, 2019 at 11:36 PM
-- Server version: 10.4.6-MariaDB
-- PHP Version: 7.1.32

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `tct2021`
--

-- --------------------------------------------------------

--
-- Table structure for table `buyer`
--

CREATE TABLE `buyer` (
  `CustomerId` int(10) NOT NULL,
  `Name of Product Purchased` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `chat`
--

CREATE TABLE `chat` (
  `ChatId` int(10) NOT NULL,
  `CustomerId` int(10) NOT NULL,
  `Name` varchar(255) NOT NULL,
  `Email` varchar(255) NOT NULL,
  `Subject` mediumtext NOT NULL,
  `Message` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `CustomerId` int(10) NOT NULL,
  `PaymentId` int(10) NOT NULL,
  `FirstName` varchar(25) NOT NULL,
  `Surname` varchar(25) DEFAULT NULL,
  `Gender` enum('Male','Female','Other','') DEFAULT NULL,
  `PhoneNumber` int(10) DEFAULT NULL,
  `Location` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `login`
--

CREATE TABLE `login` (
  `LoginId` int(10) NOT NULL,
  `CustomerId` int(10) NOT NULL,
  `Username` int(225) NOT NULL,
  `Password` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `payment method`
--

CREATE TABLE `payment method` (
  `PaymentId` int(10) NOT NULL,
  `Select Method` enum('Mobile Money','Visa Card','Cash','') NOT NULL,
  `Reason for Method Selection` varchar(300) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `ProductId` int(10) NOT NULL,
  `CustomerId` int(10) NOT NULL,
  `Product Name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `signup`
--

CREATE TABLE `signup` (
  `CustomerId` int(10) NOT NULL,
  `Password` int(20) NOT NULL,
  `Email` varchar(255) DEFAULT NULL,
  `Phone_Number` int(10) NOT NULL,
  `Category` enum('Student','Staff/Faculty','Outside_Ashesi','') NOT NULL,
  `Client_Type` enum('Vendor','Shopper','','') NOT NULL,
  `Name_of_Shop` varchar(225) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `supplier`
--

CREATE TABLE `supplier` (
  `CustomerId` int(10) NOT NULL,
  `Product Supplied` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `buyer`
--
ALTER TABLE `buyer`
  ADD KEY `CustomerId` (`CustomerId`) USING BTREE;

--
-- Indexes for table `chat`
--
ALTER TABLE `chat`
  ADD PRIMARY KEY (`ChatId`),
  ADD KEY `CustomerId` (`CustomerId`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`CustomerId`),
  ADD KEY `PaymentId` (`PaymentId`);

--
-- Indexes for table `login`
--
ALTER TABLE `login`
  ADD PRIMARY KEY (`LoginId`),
  ADD KEY `CustomerId` (`CustomerId`);

--
-- Indexes for table `payment method`
--
ALTER TABLE `payment method`
  ADD PRIMARY KEY (`PaymentId`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`ProductId`),
  ADD KEY `CustomerId` (`CustomerId`);

--
-- Indexes for table `signup`
--
ALTER TABLE `signup`
  ADD KEY `CustomerId` (`CustomerId`);

--
-- Indexes for table `supplier`
--
ALTER TABLE `supplier`
  ADD KEY `CustomerId` (`CustomerId`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `buyer`
--
ALTER TABLE `buyer`
  ADD CONSTRAINT `buyer_ibfk_1` FOREIGN KEY (`CustomerId`) REFERENCES `customer` (`CustomerId`);

--
-- Constraints for table `chat`
--
ALTER TABLE `chat`
  ADD CONSTRAINT `chat_ibfk_1` FOREIGN KEY (`CustomerId`) REFERENCES `customer` (`CustomerId`);

--
-- Constraints for table `customer`
--
ALTER TABLE `customer`
  ADD CONSTRAINT `customer_ibfk_1` FOREIGN KEY (`PaymentId`) REFERENCES `payment method` (`PaymentId`);

--
-- Constraints for table `login`
--
ALTER TABLE `login`
  ADD CONSTRAINT `login_ibfk_1` FOREIGN KEY (`CustomerId`) REFERENCES `customer` (`CustomerId`);

--
-- Constraints for table `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `product_ibfk_1` FOREIGN KEY (`CustomerId`) REFERENCES `customer` (`CustomerId`);

--
-- Constraints for table `signup`
--
ALTER TABLE `signup`
  ADD CONSTRAINT `signup_ibfk_1` FOREIGN KEY (`CustomerId`) REFERENCES `customer` (`CustomerId`);

--
-- Constraints for table `supplier`
--
ALTER TABLE `supplier`
  ADD CONSTRAINT `supplier_ibfk_1` FOREIGN KEY (`CustomerId`) REFERENCES `customer` (`CustomerId`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
