SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;


DELIMITER $$
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

CREATE TABLE IF NOT EXISTS `accountactivity` (
`eventNumber` int(11) NOT NULL,
  `accountID` int(11) NOT NULL,
  `transactiondate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `accountNumber` int(11) NOT NULL,
  `actionDone` varchar(50) NOT NULL,
  `amount` double(15,2) NOT NULL,
  `newbalance` double(15,2) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

INSERT INTO `accountactivity` (`eventNumber`, `accountID`, `transactiondate`, `accountNumber`, `actionDone`, `amount`, `newbalance`) VALUES
(1, 7, '2014-11-19 08:12:52', 12, 'Deposit', 0.00, 5600.00),
(3, 8, '2014-11-19 08:19:41', 13, 'Deposit', 100.00, 8100.00),
(4, 5, '2014-11-19 08:22:32', 11, 'Deposit', 50.00, 450.00),
(5, 3, '2014-11-19 08:22:51', 10, 'Deposit', 6.00, 1649.00),
(6, 3, '2014-11-19 18:17:40', 10, 'Deposit', 500.00, 2149.00),
(7, 5, '2014-11-19 22:10:21', 11, 'Deposit', 55.00, 300.00),
(8, 5, '2014-11-19 22:10:39', 11, 'Deposit', 100.00, 400.00),
(9, 3, '2014-11-19 22:15:01', 10, 'Withdraw', 200.00, 2149.00),
(10, 3, '2014-11-19 22:16:50', 10, 'Withdraw', 200.00, 1749.00),
(11, 7, '2014-11-19 23:15:36', 103, 'Deposit', 100.00, 11100.00),
(12, 7, '2014-11-19 23:16:32', 103, 'Withdraw', 50.00, 11050.00);

CREATE TABLE IF NOT EXISTS `checkingaccount` (
`cAccountNumber` int(30) NOT NULL,
  `accountID` int(30) NOT NULL,
  `balance` double(15,2) NOT NULL,
  `updatedAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf16 COLLATE=utf16_unicode_ci;

INSERT INTO `checkingaccount` (`cAccountNumber`, `accountID`, `balance`, `updatedAt`) VALUES
(10, 3, 1749.00, '2014-11-19 22:16:50'),
(11, 5, 200.00, '2014-11-19 22:11:04'),
(12, 7, 5600.00, '2014-11-19 08:12:52');
DELIMITER //
CREATE TRIGGER `addCheckingAccount` AFTER INSERT ON `checkingaccount`
 FOR EACH ROW UPDATE customer_account_link
SET hasChecking = TRUE
where accountID=new.accountID
//
DELIMITER ;
DELIMITER //
CREATE TRIGGER `cdepositMoney` AFTER UPDATE ON `checkingaccount`
 FOR EACH ROW INSERT INTO accountactivity (accountID,accountNumber, actionDone, amount, newbalance)
(select accountID, cAccountNumber, 'Deposit', new.balance - old.balance, balance
 from checkingaccount
 where accountID = new.accountID and
	   balance > old.balance)
//
DELIMITER ;
DELIMITER //
CREATE TRIGGER `cwithdrawmoney` BEFORE UPDATE ON `checkingaccount`
 FOR EACH ROW INSERT INTO accountactivity (accountID,accountNumber, actionDone, amount, newbalance)
(select accountID, cAccountNumber, 'Withdraw', old.balance - new.balance, new.balance
 from checkingaccount
 where accountID = new.accountID and
	   new.balance < old.balance)
//
DELIMITER ;

CREATE TABLE IF NOT EXISTS `customercomplaints` (
`complaintID` int(11) NOT NULL,
  `uID` varchar(50) NOT NULL,
  `name` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `phoneNumber` varchar(50) NOT NULL,
  `message` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `customer_account_link` (
`accountID` int(30) NOT NULL,
  `uID` varchar(15) NOT NULL,
  `accountFlag` tinyint(1) NOT NULL DEFAULT '0',
  `hasChecking` tinyint(1) NOT NULL DEFAULT '0',
  `hasSavings` tinyint(1) NOT NULL DEFAULT '0',
  `hasLoan` tinyint(1) NOT NULL DEFAULT '0',
  `updatedAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

INSERT INTO `customer_account_link` (`accountID`, `uID`, `accountFlag`, `hasChecking`, `hasSavings`, `hasLoan`, `updatedAt`) VALUES
(3, 'myid', 0, 1, 1, 1, '2014-11-19 21:58:10'),
(5, 'myid2', 0, 1, 0, 0, '2014-11-19 21:56:21'),
(7, 'myid4', 0, 1, 1, 0, '2014-11-15 22:33:56'),
(9, 'myid6', 0, 0, 1, 0, '2014-11-19 21:56:21'),
(10, 'bRossi', 0, 0, 0, 0, '2014-11-16 19:58:14'),
(11, 'bob1', 0, 0, 0, 0, '2014-11-17 05:53:35'),
(12, 'jsu', 0, 0, 0, 1, '2014-11-19 23:03:46');
DELIMITER //
CREATE TRIGGER `deleteLoan` AFTER UPDATE ON `customer_account_link`
 FOR EACH ROW DELETE FROM loan
WHERE accountID = new.accountID AND amount = 0
//
DELIMITER ;

CREATE TABLE IF NOT EXISTS `loan` (
`lAccountNumber` int(11) NOT NULL,
  `AccountID` int(11) NOT NULL,
  `amount` double(15,2) NOT NULL,
  `loanDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `dueDate` date NOT NULL,
  `updatedAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB AUTO_INCREMENT=1114 DEFAULT CHARSET=utf16 COLLATE=utf16_unicode_ci;

INSERT INTO `loan` (`lAccountNumber`, `AccountID`, `amount`, `loanDate`, `dueDate`, `updatedAt`) VALUES
(1111, 5, 1000.00, '2014-11-06 18:23:58', '2015-11-06', '2014-11-19 21:53:34'),
(1112, 3, 15000.00, '2014-11-06 18:27:12', '2014-12-06', '2014-11-19 22:30:00'),
(1113, 9, 2000.00, '2014-11-11 06:38:31', '2015-01-25', '2014-11-19 22:30:06');
DELIMITER //
CREATE TRIGGER `addLoan` AFTER INSERT ON `loan`
 FOR EACH ROW UPDATE customer_account_link
SET hasLoan = TRUE
where accountID = new.accountID
//
DELIMITER ;
DELIMITER //
CREATE TRIGGER `upateHasLoan` AFTER UPDATE ON `loan`
 FOR EACH ROW UPDATE customer_account_link
SET hasLoan = 0
WHERE accountID = new.accountID and amount = 0
//
DELIMITER ;

CREATE TABLE IF NOT EXISTS `savingsaccount` (
`sAccountID` int(11) NOT NULL,
  `accountID` int(11) NOT NULL,
  `balance` double(15,2) NOT NULL,
  `updatedAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB AUTO_INCREMENT=105 DEFAULT CHARSET=utf16 COLLATE=utf16_unicode_ci;

INSERT INTO `savingsaccount` (`sAccountID`, `accountID`, `balance`, `updatedAt`) VALUES
(101, 3, 12962.00, '2014-11-17 19:23:54'),
(103, 7, 11050.00, '2014-11-19 23:16:32'),
(104, 9, 19000.00, '2014-11-15 22:34:39');
DELIMITER //
CREATE TRIGGER `addSavingsAccount` AFTER INSERT ON `savingsaccount`
 FOR EACH ROW UPDATE customer_account_link
SET hasSavings = TRUE
where accountID=new.accountID
//
DELIMITER ;
DELIMITER //
CREATE TRIGGER `sdepositmoney` AFTER UPDATE ON `savingsaccount`
 FOR EACH ROW INSERT INTO accountactivity (accountID,accountNumber, actionDone, amount, newbalance)
(select accountID, sAccountID, 'Deposit', new.balance - old.balance, balance
 from savingsaccount
 where accountID = new.accountID and
	   balance > old.balance)
//
DELIMITER ;
DELIMITER //
CREATE TRIGGER `swithdrawmoney` BEFORE UPDATE ON `savingsaccount`
 FOR EACH ROW INSERT INTO accountactivity (accountID,accountNumber, actionDone, amount, newbalance)
(select accountID, sAccountID, 'Withdraw', old.balance - new.balance, new.balance
 from savingsaccount
 where accountID = new.accountID and
	   new.balance < old.balance)
//
DELIMITER ;

CREATE TABLE IF NOT EXISTS `userinfo` (
  `uID` varchar(15) NOT NULL,
  `password` varchar(50) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `age` int(30) DEFAULT NULL,
  `email` varchar(50) NOT NULL,
  `ssn` varchar(30) NOT NULL DEFAULT '',
  `phoneNumber` varchar(30) DEFAULT NULL,
  `type` set('Customer','Manager') NOT NULL,
  `updatedAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `userinfo` (`uID`, `password`, `name`, `age`, `email`, `ssn`, `phoneNumber`, `type`, `updatedAt`) VALUES
('bob1', '1234', 'bob', 25, 'bob@man.com', '21232548', '123123123123', 'Customer', '2014-11-19 07:48:52'),
('bRossi', 'brossiPassword', 'Brandon', 27, 'brossi@monkeyBank.com', '000-00-0000', '123456789', 'Manager', '2014-11-19 07:49:00'),
('jsu', 'secret123', 'Jeffrey Su', 21, 'jeff@monkeybank.com', '123-456-3456', '408-123-4566', 'Manager', '2014-11-19 07:49:52'),
('myid', 'secret123', 'Jeffrey ', 27, 'email@email.com', '333', '12345', 'Customer', '2014-11-19 07:49:03'),
('myid2', 'password2', 'Amy', 56, 'amy@monkey.com', '011-22-3333', '4561235564', 'Customer', '2014-11-19 07:49:05'),
('myid4', 'password4', 'Chris', 40, 'chris@monkey.com', '012-13-1000', '3216540987', 'Customer', '2014-11-19 07:49:10'),
('myid6', 'password6', 'Mark', 45, 'mark@monkey.com', '011-11-1111', '2221113333', 'Customer', '2014-11-19 07:49:14');
DELIMITER //
CREATE TRIGGER `createCustomerAccount` AFTER INSERT ON `userinfo`
 FOR EACH ROW INSERT INTO customer_account_link(uID) 
VALUES (new.uID)
//
DELIMITER ;


ALTER TABLE `accountactivity`
 ADD PRIMARY KEY (`eventNumber`);

ALTER TABLE `checkingaccount`
 ADD PRIMARY KEY (`cAccountNumber`), ADD UNIQUE KEY `accountID` (`accountID`);

ALTER TABLE `customercomplaints`
 ADD PRIMARY KEY (`complaintID`), ADD KEY `uidindex` (`uID`);

ALTER TABLE `customer_account_link`
 ADD PRIMARY KEY (`accountID`), ADD UNIQUE KEY `uidlink` (`uID`);

ALTER TABLE `loan`
 ADD PRIMARY KEY (`lAccountNumber`), ADD UNIQUE KEY `accountID key` (`AccountID`);

ALTER TABLE `savingsaccount`
 ADD PRIMARY KEY (`sAccountID`), ADD UNIQUE KEY `accountid` (`accountID`);

ALTER TABLE `userinfo`
 ADD PRIMARY KEY (`uID`,`email`,`ssn`);


ALTER TABLE `accountactivity`
MODIFY `eventNumber` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=13;
ALTER TABLE `checkingaccount`
MODIFY `cAccountNumber` int(30) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=14;
ALTER TABLE `customercomplaints`
MODIFY `complaintID` int(11) NOT NULL AUTO_INCREMENT;
ALTER TABLE `customer_account_link`
MODIFY `accountID` int(30) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=13;
ALTER TABLE `loan`
MODIFY `lAccountNumber` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=1114;
ALTER TABLE `savingsaccount`
MODIFY `sAccountID` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=105;

ALTER TABLE `checkingaccount`
ADD CONSTRAINT `customercheckingaccount` FOREIGN KEY (`accountID`) REFERENCES `customer_account_link` (`accountID`) ON DELETE CASCADE ON UPDATE NO ACTION;

ALTER TABLE `customer_account_link`
ADD CONSTRAINT `uidfromcustomerinfo` FOREIGN KEY (`uID`) REFERENCES `userinfo` (`uID`) ON DELETE CASCADE ON UPDATE NO ACTION;

ALTER TABLE `loan`
ADD CONSTRAINT `mustexist` FOREIGN KEY (`AccountID`) REFERENCES `customer_account_link` (`accountID`) ON DELETE CASCADE ON UPDATE NO ACTION;

ALTER TABLE `savingsaccount`
ADD CONSTRAINT `savingsaccountid` FOREIGN KEY (`accountID`) REFERENCES `customer_account_link` (`accountID`) ON DELETE CASCADE ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
