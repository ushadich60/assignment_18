-- phpMyAdmin SQL Dump
-- version 5.2.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 24, 2026 at 01:06 AM
-- Server version: 10.11.19-MariaDB
-- PHP Version: 8.5.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `company_db`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetAllEmployees` ()   BEGIN
 SELECT *
 FROM employees;

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `GetEmployeesByDepartment` (IN `departmentlocation` VARCHAR(50))   BEGIN

SELECT emp_name ,department
FROM employees
WHERE department =departmentlocation;

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `GetEmployeesBySalary` (IN `prizi` DECIMAL(15,2))   BEGIN

SELECT emp_name ,salary
FROM employees
WHERE salary >=prizi;

END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `employees`
--

CREATE TABLE `employees` (
  `emp_id` int(11) NOT NULL,
  `emp_name` varchar(50) DEFAULT NULL,
  `department` varchar(50) DEFAULT NULL,
  `salary` decimal(15,2) DEFAULT NULL,
  `manager_id` int(11) DEFAULT NULL,
  `city` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `employees`
--

INSERT INTO `employees` (`emp_id`, `emp_name`, `department`, `salary`, `manager_id`, `city`) VALUES
(1, 'Noor', 'HR', 50000.00, 3, 'Beirut'),
(2, 'hassan', 'IT', 60000.00, 4, 'Baalback'),
(3, 'Hady', 'HR', 70000.00, NULL, 'Beirut'),
(4, 'ALi', 'IT', 80000.00, NULL, 'tripoli'),
(5, 'Mohammad', 'Sales', 45000.00, 6, 'saida'),
(6, 'Zayn', 'sales', 65000.00, NULL, 'Beqaa');

-- --------------------------------------------------------

--
-- Stand-in structure for view `it_employees`
-- (See below for the actual view)
--
CREATE TABLE `it_employees` (
`emp_name` varchar(50)
,`department` varchar(50)
,`salary` decimal(15,2)
);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `employees`
--
ALTER TABLE `employees`
  ADD PRIMARY KEY (`emp_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `employees`
--
ALTER TABLE `employees`
  MODIFY `emp_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

-- --------------------------------------------------------

--
-- Structure for view `it_employees`
--
DROP TABLE IF EXISTS `it_employees`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `it_employees`  AS SELECT `employees`.`emp_name` AS `emp_name`, `employees`.`department` AS `department`, `employees`.`salary` AS `salary` FROM `employees` WHERE `employees`.`department` = 'IT' ;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
