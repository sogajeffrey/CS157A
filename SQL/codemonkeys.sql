-- phpMyAdmin SQL Dump
-- version 4.2.10.1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Nov 16, 2014 at 02:15 PM
-- Server version: 5.6.21-log
-- PHP Version: 5.3.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `codemonkeys`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `changePassword`(IN `customerID` VARCHAR(15) CHARSET utf8)
BEGIN
		UPDATE customerinfo
		SET password = new.password
		WHERE uID = customerID;
	END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `createNewCustomer`(IN `name` VARCHAR(30), IN `username` VARCHAR(30), IN `email` VARCHAR(30), IN `phoneNumber` VARCHAR(30), IN `password` VARCHAR(30), IN `age` INT, IN `ssn` VARCHAR(30))
BEGIN

	INSERT INTO customerInfo(uID, password, name, age, email, ssn, phoneNumber) VALUES(userName, password, name, age, email, ssn, phoneNumber);

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `getCheckingBalance`(IN `userID` VARCHAR(30) CHARSET utf8, OUT `accountBalance` DOUBLE)
BEGIN

	SELECT balance INTO accountBalance
	FROM checkingAccount, customer_account_link
	WHERE customer_account_link.uID = userID
		AND customer_account_link.accountID = checkingAccount.accountID;

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `getCustomerInfo`(IN `userID` VARCHAR(30), OUT `outID` VARCHAR(30), OUT `outName` VARCHAR(30), OUT `outAge` INT, OUT `outEmail` VARCHAR(30), OUT `outPhone` VARCHAR(30))
BEGIN
	SELECT uID, name, age, email, phoneNumber
	INTO outID, outName, outAge, outEmail, outPhone
	FROM customerInfo
	WHERE uID = userID;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `getLinkInfo`(IN `customerID` VARCHAR(15) CHARSET utf8, OUT `account_ID` INT(30), OUT `u_ID` VARCHAR(15) CHARSET utf8, OUT `has_Checking` TINYINT(1), OUT `has_Savings` TINYINT(1), OUT `has_Loan` TINYINT(1))
SELECT accountID, uID, hasChecking, hasSavings, hasLoan
INTO account_ID, u_ID, has_Checking, has_Savings, has_Loan
FROM customer_account_link
WHERE uID = customerID$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `getLoanAmount`(IN `userID` VARCHAR(30) CHARSET utf8, OUT `accountBalance` DOUBLE)
BEGIN

	SELECT amount INTO accountBalance
	FROM loan, customer_account_link
	WHERE customer_account_link.uID = userID
		AND customer_account_link.accountID = loan.accountID;

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `getSavingsBalance`(IN `userID` VARCHAR(30) CHARSET utf8, OUT `accountBalance` DOUBLE)
BEGIN

	SELECT balance INTO accountBalance
	FROM savingsAccount, customer_account_link
	WHERE customer_account_link.uID = userID
		AND customer_account_link.accountID = savingsAccount.accountID;

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `hasAccounts`(IN `userID` VARCHAR(30) CHARSET utf8, OUT `checking` BOOLEAN, OUT `savings` BOOLEAN, OUT `loan` BOOLEAN)
BEGIN

	SELECT 
    	hasChecking INTO checking
    FROM customer_account_link
    WHERE uID = userID;

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `loginCustomer`(IN `customerID` VARCHAR(15) CHARSET utf8, IN `customerPassword` VARCHAR(50) CHARSET utf8)
BEGIN
		SELECT customerinfo.uID, customerinfo.password, accountID
		FROM customerinfo, customer_account_link
		WHERE customerinfo.uID = customerID and password = customerPassword
and customerID  =  customer_account_link.uID;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `checkingaccount`
--

CREATE TABLE IF NOT EXISTS `checkingaccount` (
`cAccountNumber` int(30) NOT NULL,
  `accountID` int(30) NOT NULL,
  `balance` double(15,2) NOT NULL,
  `updatedAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf16 COLLATE=utf16_unicode_ci;

--
-- Dumping data for table `checkingaccount`
--

INSERT INTO `checkingaccount` (`cAccountNumber`, `accountID`, `balance`, `updatedAt`) VALUES
(10, 3, 1000.00, '2014-11-15 22:33:27'),
(11, 5, 200.00, '2014-11-15 22:33:27'),
(12, 7, 5500.00, '2014-11-16 19:55:20'),
(13, 8, 8000.00, '2014-11-15 22:33:27');

--
-- Triggers `checkingaccount`
--
DELIMITER //
CREATE TRIGGER `addCheckingAccount` AFTER INSERT ON `checkingaccount`
 FOR EACH ROW UPDATE customer_account_link
SET hasChecking = TRUE
where accountID=new.accountID
//
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `customerinfo`
--

CREATE TABLE IF NOT EXISTS `customerinfo` (
  `uID` varchar(15) NOT NULL,
  `password` varchar(50) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `age` int(30) DEFAULT NULL,
  `email` varchar(50) NOT NULL,
  `ssn` varchar(30) NOT NULL DEFAULT '',
  `phoneNumber` varchar(30) DEFAULT NULL,
  `updatedAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `customerinfo`
--

INSERT INTO `customerinfo` (`uID`, `password`, `name`, `age`, `email`, `ssn`, `phoneNumber`, `updatedAt`) VALUES
('bRossi', 'brossiPassword', 'Brandon', 27, 'brossi@monkeyBank.com', '000-00-0000', '123456789', '2014-11-16 19:58:14'),
('myid', 'secret123', 'Jeffrey ', 27, 'email@email.com', '333', '12345', '2014-11-06 18:25:34'),
('myid2', 'password2', 'Amy', 56, 'amy@monkey.com', '011-22-3333', '4561235564', '2014-11-06 18:25:34'),
('myid3', 'password3', 'John', 30, 'john@monkey.com', '012-34-5678', '1112223333', '2014-11-11 06:11:09'),
('myid4', 'password4', 'Chris', 40, 'chris@monkey.com', '012-13-1000', '3216540987', '2014-11-11 06:14:44'),
('myid5', 'password5', 'Jenny', 22, 'jenny@monkey.com', '022-33-4444', '3334445555', '2014-11-11 06:22:52'),
('myid6', 'password6', 'Mark', 45, 'mark@monkey.com', '011-11-1111', '2221113333', '2014-11-11 06:35:19');

--
-- Triggers `customerinfo`
--
DELIMITER //
CREATE TRIGGER `createCustomerAccount` AFTER INSERT ON `customerinfo`
 FOR EACH ROW INSERT INTO customer_account_link(uID) 
VALUES (new.uID)
//
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `customer_account_link`
--

CREATE TABLE IF NOT EXISTS `customer_account_link` (
`accountID` int(30) NOT NULL,
  `uID` varchar(15) NOT NULL,
  `accountFlag` tinyint(1) NOT NULL DEFAULT '0',
  `hasChecking` tinyint(1) NOT NULL DEFAULT '0',
  `hasSavings` tinyint(1) NOT NULL DEFAULT '0',
  `hasLoan` tinyint(1) NOT NULL DEFAULT '0',
  `updatedAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `customer_account_link`
--

INSERT INTO `customer_account_link` (`accountID`, `uID`, `accountFlag`, `hasChecking`, `hasSavings`, `hasLoan`, `updatedAt`) VALUES
(3, 'myid', 0, 1, 1, 1, '2014-11-15 22:33:56'),
(5, 'myid2', 0, 1, 0, 1, '2014-11-15 22:33:56'),
(6, 'myid3', 0, 0, 1, 0, '2014-11-15 22:33:56'),
(7, 'myid4', 0, 1, 1, 0, '2014-11-15 22:33:56'),
(8, 'myid5', 0, 1, 0, 0, '2014-11-15 22:33:56'),
(9, 'myid6', 0, 0, 1, 1, '2014-11-15 22:33:56'),
(10, 'bRossi', 0, 0, 0, 0, '2014-11-16 19:58:14');

-- --------------------------------------------------------

--
-- Table structure for table `loan`
--

CREATE TABLE IF NOT EXISTS `loan` (
`lAccountNumber` int(11) NOT NULL,
  `AccountID` int(11) NOT NULL,
  `amount` double(15,2) NOT NULL,
  `loanDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `dueDate` date NOT NULL,
  `updatedAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB AUTO_INCREMENT=1114 DEFAULT CHARSET=utf16 COLLATE=utf16_unicode_ci;

--
-- Dumping data for table `loan`
--

INSERT INTO `loan` (`lAccountNumber`, `AccountID`, `amount`, `loanDate`, `dueDate`, `updatedAt`) VALUES
(1111, 5, 2000.00, '2014-11-06 18:23:58', '2015-11-06', '0000-00-00 00:00:00'),
(1112, 3, 2000.00, '2014-11-06 18:27:12', '2014-12-06', '0000-00-00 00:00:00'),
(1113, 9, 5000.00, '2014-11-11 06:38:31', '2015-01-25', '0000-00-00 00:00:00');

--
-- Triggers `loan`
--
DELIMITER //
CREATE TRIGGER `addLoan` AFTER INSERT ON `loan`
 FOR EACH ROW UPDATE customer_account_link
SET hasLoan = TRUE
where accountID = new.accountID
//
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `managerinfo`
--

CREATE TABLE IF NOT EXISTS `managerinfo` (
  `uID` varchar(15) NOT NULL,
  `password` varchar(50) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `age` int(30) DEFAULT NULL,
  `email` varchar(50) NOT NULL,
  `ssn` varchar(30) NOT NULL DEFAULT '',
  `phoneNumber` varchar(30) DEFAULT NULL,
  `updatedAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `savingsaccount`
--

CREATE TABLE IF NOT EXISTS `savingsaccount` (
`sAccountID` int(11) NOT NULL,
  `accountID` int(11) NOT NULL,
  `balance` double(15,2) NOT NULL,
  `updatedAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB AUTO_INCREMENT=105 DEFAULT CHARSET=utf16 COLLATE=utf16_unicode_ci;

--
-- Dumping data for table `savingsaccount`
--

INSERT INTO `savingsaccount` (`sAccountID`, `accountID`, `balance`, `updatedAt`) VALUES
(101, 3, 15000.00, '2014-11-15 22:34:39'),
(102, 6, 12000.00, '2014-11-15 22:34:39'),
(103, 7, 11000.00, '2014-11-15 22:34:39'),
(104, 9, 19000.00, '2014-11-15 22:34:39');

--
-- Triggers `savingsaccount`
--
DELIMITER //
CREATE TRIGGER `addSavingsAccount` AFTER INSERT ON `savingsaccount`
 FOR EACH ROW UPDATE customer_account_link
SET hasSavings = TRUE
where accountID=new.accountID
//
DELIMITER ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `checkingaccount`
--
ALTER TABLE `checkingaccount`
 ADD PRIMARY KEY (`cAccountNumber`), ADD UNIQUE KEY `accountID` (`accountID`);

--
-- Indexes for table `customerinfo`
--
ALTER TABLE `customerinfo`
 ADD PRIMARY KEY (`uID`,`email`,`ssn`);

--
-- Indexes for table `customer_account_link`
--
ALTER TABLE `customer_account_link`
 ADD PRIMARY KEY (`accountID`), ADD UNIQUE KEY `uidlink` (`uID`);

--
-- Indexes for table `loan`
--
ALTER TABLE `loan`
 ADD PRIMARY KEY (`lAccountNumber`), ADD UNIQUE KEY `accountID key` (`AccountID`);

--
-- Indexes for table `savingsaccount`
--
ALTER TABLE `savingsaccount`
 ADD PRIMARY KEY (`sAccountID`), ADD UNIQUE KEY `accountid` (`accountID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `checkingaccount`
--
ALTER TABLE `checkingaccount`
MODIFY `cAccountNumber` int(30) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=14;
--
-- AUTO_INCREMENT for table `customer_account_link`
--
ALTER TABLE `customer_account_link`
MODIFY `accountID` int(30) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `loan`
--
ALTER TABLE `loan`
MODIFY `lAccountNumber` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=1114;
--
-- AUTO_INCREMENT for table `savingsaccount`
--
ALTER TABLE `savingsaccount`
MODIFY `sAccountID` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=105;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `checkingaccount`
--
ALTER TABLE `checkingaccount`
ADD CONSTRAINT `customercheckingaccount` FOREIGN KEY (`accountID`) REFERENCES `customer_account_link` (`accountID`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `customer_account_link`
--
ALTER TABLE `customer_account_link`
ADD CONSTRAINT `uidfromcustomerinfo` FOREIGN KEY (`uID`) REFERENCES `customerinfo` (`uID`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `loan`
--
ALTER TABLE `loan`
ADD CONSTRAINT `mustexist` FOREIGN KEY (`AccountID`) REFERENCES `customer_account_link` (`accountID`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `savingsaccount`
--
ALTER TABLE `savingsaccount`
ADD CONSTRAINT `savingsaccountid` FOREIGN KEY (`accountID`) REFERENCES `customer_account_link` (`accountID`) ON DELETE NO ACTION ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
