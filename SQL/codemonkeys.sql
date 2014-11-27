SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;


DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `avgAgeUsersWithLoanOverXDollars`(IN `inAmount` DOUBLE(15,2))
SELECT avg(age)
FROM loan, userinfo, customer_account_link
WHERE userinfo.uID = customer_account_link.uID 
	AND customer_account_link.accountID = loan.accountID 
	AND loan.amount > inAmount$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `changePassword`(IN `customerID` VARCHAR(15) CHARSET utf8)
BEGIN
		UPDATE customerinfo
		SET password = new.password
		WHERE uID = customerID;
	END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `createNewCustomer`(IN `name` VARCHAR(30), IN `username` VARCHAR(30), IN `email` VARCHAR(30), IN `phoneNumber` VARCHAR(30), IN `password` VARCHAR(30), IN `age` INT, IN `ssn` VARCHAR(30))
BEGIN

	INSERT INTO userinfo (uID, password, name, age, email, ssn, phoneNumber) VALUES(userName, password, name, age, email, ssn, phoneNumber);

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `getAccountActivity`(IN `inAccountID` INT(11), IN `accountType` ENUM('Checking','Savings','Loan') CHARSET utf8)
SELECT transactiondate, actionDone, amount, newBalance
FROM accountactivity
WHERE accountID=inAccountID AND type=accountType
ORDER BY transactiondate DESC$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `getCheckingBalance`(IN `userID` VARCHAR(30) CHARSET utf8, OUT `accountBalance` DOUBLE)
BEGIN

	SELECT balance INTO accountBalance
	FROM checkingAccount, customer_account_link
	WHERE customer_account_link.uID = userID
		AND customer_account_link.accountID = checkingAccount.accountID;

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `getCustomerInfo`(IN `userID` VARCHAR(30) CHARSET utf8, OUT `outID` VARCHAR(30) CHARSET utf8, OUT `outName` VARCHAR(30) CHARSET utf8, OUT `outAge` INT, OUT `outEmail` VARCHAR(30) CHARSET utf8, OUT `outPhone` VARCHAR(30) CHARSET utf8)
BEGIN
	SELECT uID, name, age, email, phoneNumber
	INTO outID, outName, outAge, outEmail, outPhone
	FROM userinfo
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

CREATE DEFINER=`root`@`localhost` PROCEDURE `getProblemCustomers`(IN `messageLimit` INT)
select userinfo.uID, userinfo.name, userinfo.email, userinfo.phoneNumber, count(customercomplaints.uID) as totalNumberOfComplaints
from userinfo, customercomplaints
where userinfo.uID = customercomplaints.uID
group by customercomplaints.uID
having count(customercomplaints.uID) > messageLimit$$

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
		SELECT userinfo.uID, userinfo.password, userinfo.type, accountID
		FROM userinfo, customer_account_link
		WHERE userinfo.uID = customerID and password = customerPassword
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
  `newbalance` double(15,2) NOT NULL,
  `type` enum('Checking','Savings','Loan') NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=utf8;

INSERT INTO `accountactivity` (`eventNumber`, `accountID`, `transactiondate`, `accountNumber`, `actionDone`, `amount`, `newbalance`, `type`) VALUES
(16, 13, '2014-11-22 20:39:36', 13, 'Deposit', 50.00, 6050.00, 'Checking'),
(17, 14, '2014-11-22 20:39:52', 14, 'Deposit', 400000.00, 450000.00, 'Checking'),
(18, 17, '2014-11-22 20:39:59', 15, 'Withdraw', 99400.00, 200600.00, 'Checking'),
(19, 14, '2014-11-22 20:40:28', 105, 'Withdraw', 4699500.00, 300500.00, 'Savings'),
(20, 13, '2014-11-22 20:40:32', 106, 'Deposit', 600.00, 60600.00, 'Savings'),
(21, 16, '2014-11-22 20:40:37', 108, 'Withdraw', 1000.00, 5092.00, 'Savings'),
(22, 13, '2014-11-22 20:52:07', 13, 'Deposit', 1000.00, 7050.00, 'Checking'),
(23, 13, '2014-11-22 20:52:11', 13, 'Deposit', 10.00, 7060.00, 'Checking'),
(24, 13, '2014-11-22 20:52:15', 13, 'Withdraw', 7000.00, 60.00, 'Checking'),
(25, 13, '2014-11-22 20:52:19', 13, 'Deposit', 49940.00, 50000.00, 'Checking'),
(26, 13, '2014-11-22 20:52:22', 13, 'Withdraw', 44950.00, 5050.00, 'Checking'),
(27, 13, '2014-11-22 20:52:25', 13, 'Deposit', 5044950.00, 5050000.00, 'Checking'),
(28, 13, '2014-11-22 20:52:28', 13, 'Withdraw', 5044950.00, 5050.00, 'Checking'),
(29, 14, '2014-11-22 21:09:46', 14, 'Withdraw', 445500.00, 4500.00, 'Checking'),
(30, 17, '2014-11-22 21:09:51', 15, 'Deposit', 50.00, 200650.00, 'Checking'),
(31, 15, '2014-11-22 21:10:40', 107, 'Deposit', 800.00, 400800.00, 'Savings'),
(32, 16, '2014-11-22 21:10:45', 108, 'Deposit', 60000.00, 65092.00, 'Savings'),
(33, 13, '2014-11-22 21:10:52', 106, 'Deposit', 60.00, 60660.00, 'Savings'),
(34, 15, '2014-11-22 21:10:57', 107, 'Withdraw', 398000.00, 2800.00, 'Savings'),
(35, 18, '2014-11-22 21:24:15', 16, 'Deposit', 499950.00, 500000.00, 'Checking'),
(36, 14, '2014-11-22 22:38:29', 105, 'Deposit', 500.00, 301000.00, 'Savings'),
(37, 14, '2014-11-22 22:38:49', 105, 'Withdraw', 3010000.00, -2709000.00, 'Savings'),
(38, 14, '2014-11-22 22:39:06', 105, 'Deposit', 2132.00, -2706868.00, 'Savings'),
(39, 14, '2014-11-22 22:39:17', 105, 'Deposit', 5000000.00, 2293132.00, 'Savings'),
(40, 13, '2014-11-24 08:03:20', 106, 'Deposit', 2000.00, 62660.00, 'Savings'),
(41, 13, '2014-11-24 08:03:25', 106, 'Withdraw', 300.00, 62360.00, 'Savings'),
(42, 13, '2014-11-24 08:03:25', 13, 'Deposit', 300.00, 5350.00, 'Checking'),
(43, 13, '2014-11-24 08:03:47', 106, 'Withdraw', 3000.00, 59360.00, 'Savings'),
(44, 13, '2014-11-24 08:04:09', 13, 'Withdraw', 500.00, 4850.00, 'Checking'),
(45, 13, '2014-11-24 08:04:09', 106, 'Deposit', 500.00, 59860.00, 'Savings'),
(46, 13, '2014-11-24 18:28:15', 106, 'Withdraw', 677.00, 59183.00, 'Savings'),
(47, 13, '2014-11-24 18:28:15', 13, 'Deposit', 677.00, 5527.00, 'Checking');

CREATE TABLE IF NOT EXISTS `checkingaccount` (
`cAccountNumber` int(30) NOT NULL,
  `accountID` int(30) NOT NULL,
  `balance` double(15,2) NOT NULL,
  `updatedAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf16 COLLATE=utf16_unicode_ci;

INSERT INTO `checkingaccount` (`cAccountNumber`, `accountID`, `balance`, `updatedAt`) VALUES
(13, 13, 5527.00, '2014-11-24 18:28:15'),
(14, 14, 4500.00, '2014-11-22 21:09:46'),
(15, 17, 200650.00, '2014-11-22 21:09:51'),
(16, 18, 500000.00, '2014-11-22 21:24:15'),
(19, 23, 344.00, '2014-11-24 07:57:13');
DELIMITER //
CREATE TRIGGER `addCheckingAccount` AFTER INSERT ON `checkingaccount`
 FOR EACH ROW UPDATE customer_account_link
SET hasChecking = TRUE
where accountID=new.accountID
//
DELIMITER ;
DELIMITER //
CREATE TRIGGER `cdepositMoney` AFTER UPDATE ON `checkingaccount`
 FOR EACH ROW INSERT INTO accountactivity (accountID,accountNumber, actionDone, amount, newbalance, type)
(select accountID, cAccountNumber, 'Deposit', new.balance - old.balance, balance, 'Checking'
 from checkingaccount
 where accountID = new.accountID and
	   balance > old.balance)
//
DELIMITER ;
DELIMITER //
CREATE TRIGGER `cwithdrawmoney` BEFORE UPDATE ON `checkingaccount`
 FOR EACH ROW INSERT INTO accountactivity (accountID,accountNumber, actionDone, amount, newbalance, type)
(select accountID, cAccountNumber, 'Withdraw', old.balance - new.balance, new.balance, 'Checking'
 from checkingaccount
 where accountID = new.accountID and
	   new.balance < old.balance)
//
DELIMITER ;

CREATE TABLE IF NOT EXISTS `customercomplaints` (
`complaintID` int(11) NOT NULL,
  `uID` varchar(50) NOT NULL,
  `message` text NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

INSERT INTO `customercomplaints` (`complaintID`, `uID`, `message`) VALUES
(2, 'test1', 'This monkey bank is awesome!'),
(3, 'test1', 'WHERE IS MY MONEY???? '),
(4, 'test1', 'I DONT HAVE MONEYYY '),
(5, 'test2', 'I am having a hard time taking money out of my account. I want to take out $1000000 but it won''t let me because I only have $1000. This bank sucks!'),
(6, 'test1', 'I change my mind, I don''t like this bank'),
(7, 'test6', 'Spam'),
(8, 'test6', 'Spam'),
(9, 'test6', 'More Spam'),
(10, 'test6', 'HAHA This is more spam'),
(11, 'test6', 'I must be in Hawaii, because I like Spam!!'),
(12, 'test1', 'suckssss'),
(13, 'test1', 'great bank\r\n');

CREATE TABLE IF NOT EXISTS `customer_account_link` (
`accountID` int(30) NOT NULL,
  `uID` varchar(15) NOT NULL,
  `accountFlag` tinyint(1) NOT NULL DEFAULT '0',
  `hasChecking` tinyint(1) NOT NULL DEFAULT '0',
  `hasSavings` tinyint(1) NOT NULL DEFAULT '0',
  `hasLoan` tinyint(1) NOT NULL DEFAULT '0',
  `updatedAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;

INSERT INTO `customer_account_link` (`accountID`, `uID`, `accountFlag`, `hasChecking`, `hasSavings`, `hasLoan`, `updatedAt`) VALUES
(13, 'test1', 0, 1, 1, 1, '2014-11-22 20:38:59'),
(14, 'test2', 0, 1, 1, 1, '2014-11-26 21:27:33'),
(15, 'test3', 0, 0, 1, 1, '2014-11-22 20:39:07'),
(16, 'test4', 0, 0, 1, 1, '2014-11-26 21:32:57'),
(17, 'test5', 0, 1, 0, 0, '2014-11-22 20:38:11'),
(18, 'test6', 0, 1, 1, 1, '2014-11-26 21:43:14'),
(19, 'manager2', 0, 0, 0, 0, '2014-11-24 05:44:19'),
(20, 'test7', 0, 0, 0, 1, '2014-11-26 21:30:32'),
(23, 'jeffman', 0, 1, 1, 0, '2014-11-24 08:00:16'),
(25, 'Bob1', 0, 0, 0, 0, '2014-11-26 06:33:45'),
(27, 'jsu', 0, 0, 0, 0, '2014-11-26 06:53:28');

CREATE TABLE IF NOT EXISTS `loan` (
`lAccountNumber` int(11) NOT NULL,
  `AccountID` int(11) NOT NULL,
  `amount` double(15,2) NOT NULL,
  `loanDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `dueDate` date NOT NULL,
  `updatedAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB AUTO_INCREMENT=1140 DEFAULT CHARSET=utf16 COLLATE=utf16_unicode_ci;

INSERT INTO `loan` (`lAccountNumber`, `AccountID`, `amount`, `loanDate`, `dueDate`, `updatedAt`) VALUES
(1134, 13, 400500.00, '2014-11-22 20:38:30', '2014-11-29', '2014-11-22 20:40:49'),
(1135, 15, 300600.00, '2014-11-22 20:38:40', '2014-11-27', '2014-11-22 20:40:57'),
(1136, 14, 220000.00, '2014-11-26 21:27:33', '2015-12-20', '2014-11-26 21:27:33'),
(1137, 20, 5000.00, '2014-11-26 21:30:32', '2014-12-11', '2014-11-26 21:30:32'),
(1138, 16, 5000.00, '2014-11-26 21:32:57', '2016-03-03', '2014-11-26 21:32:57'),
(1139, 18, 200000.00, '2014-11-26 21:33:59', '2017-07-06', '2014-11-26 21:33:59');
DELIMITER //
CREATE TRIGGER `addLoan` AFTER INSERT ON `loan`
 FOR EACH ROW UPDATE customer_account_link
SET hasLoan = TRUE
where accountID = new.accountID
//
DELIMITER ;
DELIMITER //
CREATE TRIGGER `updateCustomerAccountLink` AFTER UPDATE ON `loan`
 FOR EACH ROW IF new.amount = 0 THEN
UPDATE customer_account_link
SET hasLoan = 0
WHERE accountID = new.accountID;
END IF
//
DELIMITER ;

CREATE TABLE IF NOT EXISTS `savingsaccount` (
`sAccountID` int(11) NOT NULL,
  `accountID` int(11) NOT NULL,
  `balance` double(15,2) NOT NULL,
  `updatedAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB AUTO_INCREMENT=113 DEFAULT CHARSET=utf16 COLLATE=utf16_unicode_ci;

INSERT INTO `savingsaccount` (`sAccountID`, `accountID`, `balance`, `updatedAt`) VALUES
(105, 14, 2293132.00, '2014-11-22 22:39:17'),
(106, 13, 59183.00, '2014-11-24 18:28:15'),
(107, 15, 2800.00, '2014-11-22 21:10:57'),
(108, 16, 65092.00, '2014-11-22 21:10:45'),
(111, 23, 5000000.00, '2014-11-24 08:00:16'),
(112, 18, 50000.00, '2014-11-26 21:43:14');
DELIMITER //
CREATE TRIGGER `addSavingsAccount` AFTER INSERT ON `savingsaccount`
 FOR EACH ROW UPDATE customer_account_link
SET hasSavings = TRUE
where accountID=new.accountID
//
DELIMITER ;
DELIMITER //
CREATE TRIGGER `sdepositmoney` AFTER UPDATE ON `savingsaccount`
 FOR EACH ROW INSERT INTO accountactivity (accountID,accountNumber, actionDone, amount, newbalance, type)
(select accountID, sAccountID, 'Deposit', new.balance - old.balance, balance, 'Savings'
 from savingsaccount
 where accountID = new.accountID and
	   balance > old.balance)
//
DELIMITER ;
DELIMITER //
CREATE TRIGGER `swithdrawmoney` BEFORE UPDATE ON `savingsaccount`
 FOR EACH ROW INSERT INTO accountactivity (accountID,accountNumber, actionDone, amount, newbalance, type)
(select accountID, sAccountID, 'Withdraw', old.balance - new.balance, new.balance, 'Savings'
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
  `type` enum('Customer','Manager') NOT NULL DEFAULT 'Customer',
  `updatedAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `userinfo` (`uID`, `password`, `name`, `age`, `email`, `ssn`, `phoneNumber`, `type`, `updatedAt`) VALUES
('Bob1', 'secret123', 'Bob Miller', 35, 'bob@miller.com', '234', '123414', 'Customer', '2014-11-26 06:33:45'),
('jeffman', 'asdf', 'Jeff', 23, 'jeff@asdf.com', '12334', '1234234', 'Customer', '2014-11-24 07:37:23'),
('jsu', 'secret123', 'jeff', 21, 'jeff@su.com', '12342334', '234234234', 'Manager', '2014-11-26 06:53:28'),
('manager1', 'manager1', 'manager1', 45, 'manager1.com', '1234567345', '123423234', 'Manager', '2014-11-22 22:22:13'),
('manager2', 'secret123', 'manager2', 35, 'manager@moneky.com', '12345', '2345', 'Manager', '2014-11-24 05:44:19'),
('test1', 'test1', 'Jill', 50, 'test1.com', 'test1-test1-test1', 'test1-test1-test1-test1', 'Customer', '2014-11-26 22:20:33'),
('test2', 'test2', 'Manny', 20, 'test2.com', 'test2-test2-test2', 'test2-test2-test3', 'Customer', '2014-11-22 22:34:34'),
('test3', 'test3', 'Bob', 20, 'test3.com', 'test3-test3-test3', 'test3-test3-test3', 'Customer', '2014-11-26 21:51:57'),
('test4', 'test4', 'Brandon', 20, 'test4.com', 'test4-test4-test4', 'test4-test4-test4', 'Customer', '2014-11-26 21:52:01'),
('test5', 'test5', 'Nirav', 20, 'test5.com', 'test5-test5-test5', 'test5-test5-test5', 'Customer', '2014-11-26 21:52:05'),
('test6', 'test6', 'Mary', 20, 'test6.com', 'test6-test6-test6', 'test6-test6-test6', 'Customer', '2014-11-26 21:52:29'),
('test7', 'test7', 'Tina', 123, 'test7@test.com', '14234', '234234234', 'Customer', '2014-11-26 21:52:37');
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
MODIFY `eventNumber` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=48;
ALTER TABLE `checkingaccount`
MODIFY `cAccountNumber` int(30) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=20;
ALTER TABLE `customercomplaints`
MODIFY `complaintID` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=14;
ALTER TABLE `customer_account_link`
MODIFY `accountID` int(30) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=28;
ALTER TABLE `loan`
MODIFY `lAccountNumber` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=1140;
ALTER TABLE `savingsaccount`
MODIFY `sAccountID` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=113;

ALTER TABLE `checkingaccount`
ADD CONSTRAINT `customercheckingaccount` FOREIGN KEY (`accountID`) REFERENCES `customer_account_link` (`accountID`) ON DELETE CASCADE ON UPDATE NO ACTION;

ALTER TABLE `customercomplaints`
ADD CONSTRAINT `uidconstraint` FOREIGN KEY (`uID`) REFERENCES `customer_account_link` (`uID`) ON DELETE CASCADE ON UPDATE NO ACTION;

ALTER TABLE `customer_account_link`
ADD CONSTRAINT `uidfromcustomerinfo` FOREIGN KEY (`uID`) REFERENCES `userinfo` (`uID`) ON DELETE CASCADE ON UPDATE NO ACTION;

ALTER TABLE `loan`
ADD CONSTRAINT `mustexist` FOREIGN KEY (`AccountID`) REFERENCES `customer_account_link` (`accountID`) ON DELETE CASCADE ON UPDATE NO ACTION;

ALTER TABLE `savingsaccount`
ADD CONSTRAINT `savingsaccountid` FOREIGN KEY (`accountID`) REFERENCES `customer_account_link` (`accountID`) ON DELETE CASCADE ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
