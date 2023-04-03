-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 21, 2022 at 01:38 PM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 7.4.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `doanky4`
--

-- --------------------------------------------------------

--
-- Table structure for table `account`
--

CREATE TABLE `account` (
  `accountid` int(11) NOT NULL,
  `accountname` varchar(100) NOT NULL,
  `phone` varchar(15) NOT NULL,
  `email` varchar(50) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(200) NOT NULL,
  `accounttypeid` int(11) NOT NULL,
  `hotelid` int(11) DEFAULT NULL,
  `avatar` varchar(50) NOT NULL,
  `verifycode` varchar(50) DEFAULT NULL,
  `accountstt` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `account`
--

INSERT INTO `account` (`accountid`, `accountname`, `phone`, `email`, `username`, `password`, `accounttypeid`, `hotelid`, `avatar`, `verifycode`, `accountstt`) VALUES
(1, 'ADMIN', '0123456780', 'admin@gmail.com', 'admin', '$2a$10$pRwf33Pe0Yk3zmCRwt1QyuhY/7m7XYiNfVp4EhewQ21o39xDMuM5e', 3, NULL, 'user.png', '', 1),
(2, 'Lan Nguyen Binh Phuong', '0123459889', 'lannguyen@gmail.com', 'lannguyen', '$2a$10$pRwf33Pe0Yk3zmCRwt1QyuhY/7m7XYiNfVp4EhewQ21o39xDMuM5e', 1, NULL, 'user.png', '', 1),
(3, 'Customer Two', '0253456789', 'customer2@gmail.com', 'customer2', '$2a$10$pRwf33Pe0Yk3zmCRwt1QyuhY/7m7XYiNfVp4EhewQ21o39xDMuM5e', 1, NULL, 'user.png', '', 1),
(4, 'Customer Three', '0123556789', 'customer3@gmail.com', 'customer3', '$2a$10$pRwf33Pe0Yk3zmCRwt1QyuhY/7m7XYiNfVp4EhewQ21o39xDMuM5e', 1, NULL, 'user.png', '', 1),
(5, 'Customer Four', '0123456799', 'customer4@gmail.com', 'customer4', '$2a$10$pRwf33Pe0Yk3zmCRwt1QyuhY/7m7XYiNfVp4EhewQ21o39xDMuM5e', 1, NULL, 'user.png', '', 1),
(6, 'Customer Five', '0223456789', 'customer5@gmail.com', 'customer5', '$2a$10$pRwf33Pe0Yk3zmCRwt1QyuhY/7m7XYiNfVp4EhewQ21o39xDMuM5e', 1, NULL, 'user.png', '', 1),
(7, 'Customer Six', '0323456789', 'customer6@gmail.com', 'customer6', '$2a$10$pRwf33Pe0Yk3zmCRwt1QyuhY/7m7XYiNfVp4EhewQ21o39xDMuM5e', 1, NULL, 'user.png', '', 1),
(8, 'Customer Seven', '0423456789', 'customer7@gmail.com', 'customer7', '$2a$10$pRwf33Pe0Yk3zmCRwt1QyuhY/7m7XYiNfVp4EhewQ21o39xDMuM5e', 1, NULL, 'user.png', '', 1),
(9, 'Customer Eight', '0523456789', 'customer8@gmail.com', 'customer8', '$2a$10$pRwf33Pe0Yk3zmCRwt1QyuhY/7m7XYiNfVp4EhewQ21o39xDMuM5e', 1, NULL, 'user.png', '', 1),
(10, 'Customer Nine', '0513456789', 'customer9@gmail.com', 'customer9', '$2a$10$pRwf33Pe0Yk3zmCRwt1QyuhY/7m7XYiNfVp4EhewQ21o39xDMuM5e', 1, NULL, 'user.png', '', 1),
(11, 'Customer Ten', '0943456789', 'customer10@gmail.com', 'customer10', '$2a$10$pRwf33Pe0Yk3zmCRwt1QyuhY/7m7XYiNfVp4EhewQ21o39xDMuM5e', 1, NULL, 'user.png', '', 1),
(12, 'Pandanus Resort', '0933456789', 'pandanus@gmail.com', 'pandanus', '$2a$10$pRwf33Pe0Yk3zmCRwt1QyuhY/7m7XYiNfVp4EhewQ21o39xDMuM5e', 2, 1, 'user.png', '', 1),
(13, 'hotel two', '0983456789', 'hotel2@gmail.com', 'hotel2', '$2a$10$pRwf33Pe0Yk3zmCRwt1QyuhY/7m7XYiNfVp4EhewQ21o39xDMuM5e', 2, 2, 'user.png', '', 1),
(14, 'Hotel Three', '0973556789', 'hotel3@gmail.com', 'hotel3', '$2a$10$pRwf33Pe0Yk3zmCRwt1QyuhY/7m7XYiNfVp4EhewQ21o39xDMuM5e', 2, 3, 'user.png', '', 1),
(15, 'Hotel Four', '0963456799', 'hotel4@gmail.com', 'hotel4', '$2a$10$pRwf33Pe0Yk3zmCRwt1QyuhY/7m7XYiNfVp4EhewQ21o39xDMuM5e', 2, 4, 'user.png', '', 1),
(16, 'Hotel Five', '0953456789', 'Hotel5@gmail.com', 'Hotel5', '$2a$10$pRwf33Pe0Yk3zmCRwt1QyuhY/7m7XYiNfVp4EhewQ21o39xDMuM5e', 2, 5, 'user.png', '', 1),
(17, 'Hotel Six', '0394456789', 'member6@gmail.com', 'Hotel6', '$2a$10$pRwf33Pe0Yk3zmCRwt1QyuhY/7m7XYiNfVp4EhewQ21o39xDMuM5e', 2, 6, 'user.png', '', 1),
(18, 'Hotel Seven', '0423484789', 'Hotel7@gmail.com', 'Hotel7', '$2a$10$pRwf33Pe0Yk3zmCRwt1QyuhY/7m7XYiNfVp4EhewQ21o39xDMuM5e', 2, 7, 'user.png', '', 1),
(19, 'Hotel Eight', '0683456789', 'Hotel8@gmail.com', 'Hotel8', '$2a$10$pRwf33Pe0Yk3zmCRwt1QyuhY/7m7XYiNfVp4EhewQ21o39xDMuM5e', 2, 8, 'user.png', '', 1),
(20, 'Hotel Nine', '0525456789', 'Hotel 9@gmail.com', 'Hotel9', '$2a$10$pRwf33Pe0Yk3zmCRwt1QyuhY/7m7XYiNfVp4EhewQ21o39xDMuM5e', 2, 9, 'user.png', '', 1),
(21, 'HotelTen', '0911456789', 'Hotel10@gmail.com', 'Hotel10', '$2a$10$pRwf33Pe0Yk3zmCRwt1QyuhY/7m7XYiNfVp4EhewQ21o39xDMuM5e', 2, 10, 'user.png', '', 1),
(22, 'Hotel Eleven', '0872516789', 'Hotel11@gmail.com', 'Hotel11', '$2a$10$pRwf33Pe0Yk3zmCRwt1QyuhY/7m7XYiNfVp4EhewQ21o39xDMuM5e', 2, 11, 'user.png', '', 1),
(23, 'Hotel Twelve', '0983457889', 'Hotel12@gmail.com', 'Hotel12', '$2a$10$pRwf33Pe0Yk3zmCRwt1QyuhY/7m7XYiNfVp4EhewQ21o39xDMuM5e', 2, 12, 'user.png', '', 1),
(24, 'Hotel Thirteen', '0698556789', 'Hotel13@gmail.com', 'Hotel13', '$2a$10$pRwf33Pe0Yk3zmCRwt1QyuhY/7m7XYiNfVp4EhewQ21o39xDMuM5e', 2, 13, 'user.png', '', 1),
(25, 'Hotel Fourteen', '0963478499', 'Hotel14@gmail.com', 'Hotel14', '$2a$10$pRwf33Pe0Yk3zmCRwt1QyuhY/7m7XYiNfVp4EhewQ21o39xDMuM5e', 2, 14, 'user.png', '', 1),
(26, 'Hotel Fifteen', '0953487789', 'Hotel15@gmail.com', 'Hotel15', '$2a$10$pRwf33Pe0Yk3zmCRwt1QyuhY/7m7XYiNfVp4EhewQ21o39xDMuM5e', 2, 15, 'user.png', '', 1),
(27, 'Hotel Sixteen', '0399686789', 'Hotel16@gmail.com', 'Hotel16', '$2a$10$pRwf33Pe0Yk3zmCRwt1QyuhY/7m7XYiNfVp4EhewQ21o39xDMuM5e', 2, 16, 'user.png', '', 1),
(28, 'Hotel Seventeen', '0423474789', 'Hotel17@gmail.com', 'Hotel17', '$2a$10$pRwf33Pe0Yk3zmCRwt1QyuhY/7m7XYiNfVp4EhewQ21o39xDMuM5e', 2, 17, 'user.png', '', 1),
(29, 'Hotel Eightteen', '0683985789', 'Hotel18@gmail.com', 'Hotel18', '$2a$10$pRwf33Pe0Yk3zmCRwt1QyuhY/7m7XYiNfVp4EhewQ21o39xDMuM5e', 2, 18, 'user.png', '', 1),
(30, 'Hotel Nineteen', '0545456789', 'Hotel19@gmail.com', 'Hotel19', '$2a$10$pRwf33Pe0Yk3zmCRwt1QyuhY/7m7XYiNfVp4EhewQ21o39xDMuM5e', 2, 19, 'user.png', '', 1),
(33, 'Dac Pham Danh', '0933556789', 'danhdac@gmail.com', 'danhdac', '$2a$10$pRwf33Pe0Yk3zmCRwt1QyuhY/7m7XYiNfVp4EhewQ21o39xDMuM5e', 4, NULL, 'user.png', '', 1),
(34, 'AgentCS Two', '0983459789', 'agentCS2@gmail.com', 'agentCS2', '$2a$10$pRwf33Pe0Yk3zmCRwt1QyuhY/7m7XYiNfVp4EhewQ21o39xDMuM5e', 4, NULL, 'user.png', '', 1),
(35, 'AgentCS Three', '0973558789', 'agentCS3@gmail.com', 'agentCS3', '$2a$10$pRwf33Pe0Yk3zmCRwt1QyuhY/7m7XYiNfVp4EhewQ21o39xDMuM5e', 4, NULL, 'user.png', '', 1),
(36, 'AgentCS Four', '0961236799', 'agentCS4@gmail.com', 'agentCS4', '$2a$10$pRwf33Pe0Yk3zmCRwt1QyuhY/7m7XYiNfVp4EhewQ21o39xDMuM5e', 4, NULL, 'user.png', '', 1),
(37, 'AgentCS Five', '0956986789', 'agentCS5@gmail.com', 'agentCS5', '$2a$10$pRwf33Pe0Yk3zmCRwt1QyuhY/7m7XYiNfVp4EhewQ21o39xDMuM5e', 4, NULL, 'user.png', '', 1),
(38, 'AgentCS Six', '0394445189', 'agentCS6@gmail.com', 'agentCS6', '$2a$10$pRwf33Pe0Yk3zmCRwt1QyuhY/7m7XYiNfVp4EhewQ21o39xDMuM5e', 4, NULL, 'user.png', '', 1),
(39, 'AgentCS Seven', '0423474189', 'agentCS7@gmail.com', 'agentCS7', '$2a$10$pRwf33Pe0Yk3zmCRwt1QyuhY/7m7XYiNfVp4EhewQ21o39xDMuM5e', 4, NULL, 'user.png', '', 1),
(40, 'AgentCS Eight', '0683658789', 'agentCS8@gmail.com', 'agentCS8', '$2a$10$pRwf33Pe0Yk3zmCRwt1QyuhY/7m7XYiNfVp4EhewQ21o39xDMuM5e', 4, NULL, 'user.png', '', 1),
(41, 'AgentCS Nine', '0525147789', 'agentCS9@gmail.com', 'agentCS9', '$2a$10$pRwf33Pe0Yk3zmCRwt1QyuhY/7m7XYiNfVp4EhewQ21o39xDMuM5e', 4, NULL, 'user.png', '', 1),
(42, 'AgentCS Ten', '0911450789', 'agentCS10@gmail.com', 'agentCS10', '$2a$10$pRwf33Pe0Yk3zmCRwt1QyuhY/7m7XYiNfVp4EhewQ21o39xDMuM5e', 4, NULL, 'user.png', '', 1),
(43, 'pandanus2', '98721316543', 'pandanus2@gmail.com', 'pandanus2', '$2a$10$pRwf33Pe0Yk3zmCRwt1QyuhY/7m7XYiNfVp4EhewQ21o39xDMuM5e', 2, 1, 'user.png', '', 1),
(44, 'Tran Van Toan aaaaa', '3333333333', 'RRRRRRRR@GMAIL.COM', 'pandanus5', '$2a$10$5OSBi8xTXJse8TjSfWUHveqqK1sVzrzjhW0ur7oeQexeZxpiF68L2', 1, NULL, 'user.png', '5454c2d959434bf4899e4d44d60fa05f', 0),
(45, 'adsafsfsdfgtg', '7895798679', 'dwewe@gmail.com', 'pandanus1', '$2a$10$Azbk03v4v9mV8OSa0KOeGOdqf8LxTZAADhoG716CF47pdV5TlOj02', 1, NULL, 'user.png', '', 1),
(46, 'Tran Van Toan aaaaa', '7895798679', 'test@gmail.com', 'nhanvienketoan1', '$2a$10$UkFDzztm4Sq6aHZKnsYfAew38SZdNz.QQ0k0mqIvmnmojJpyK48j2', 1, NULL, 'user.png', '', 1),
(47, 'dee eeeeeee', '0123456780', 'test2@gmail.com', 'nhanvienketoan2', '$2a$10$Rqa9GY4LhZ2V4HZn92ikTumTMYN.D54ziKTIXKOF7YD0VzaTrsEU2', 1, NULL, 'user.png', '', 1),
(48, 'dee eeeeeee', '094154654151', 'test3@gmail.com', 'we324434', '$2a$10$YzYAYq95RVeBPm/K2Oj7PuogKo0WJeK8hWHpn.w1yjpW9diogf6Fy', 1, NULL, 'user.png', '', 1),
(52, 'rew erewre', '435324214235', 'phuoc41120001@gmail.com', 'erewrewrew', '$2a$10$DVz/PsxQrNDnH4f1u2cPfO0hjThUOboN.0ukoWXYkIme5nDlAwVBW', 1, NULL, 'user.png', '52ba0fd2575a4b3598bb1e4ac452a56d', 0),
(53, 'dasfdewfre', '12345678910', 'dongthithanhxuan.hn@gmail.com', 'khongmaplam', '$2a$10$dWNtAlu1ggOWOuyNtLnLu.fcZHHBE8KehIJXoNy1AfW4AD.CUuelu', 1, NULL, 'user.png', 'bad093ec21744a33b3773da96497e9d4', 0);

-- --------------------------------------------------------

--
-- Table structure for table `accounttype`
--

CREATE TABLE `accounttype` (
  `accounttypeid` int(11) NOT NULL,
  `accounttypename` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `accounttype`
--

INSERT INTO `accounttype` (`accounttypeid`, `accounttypename`) VALUES
(1, 'ROLE_CUSTOMER'),
(2, 'ROLE_HOTEL'),
(3, 'ROLE_ADMIN'),
(4, 'ROLE_AGENTSCS');

-- --------------------------------------------------------

--
-- Table structure for table `addonservice`
--

CREATE TABLE `addonservice` (
  `addonserviceid` int(11) NOT NULL,
  `hotelid` int(11) NOT NULL,
  `addonservicename` varchar(100) NOT NULL,
  `servicetype` varchar(20) NOT NULL,
  `netprice` decimal(7,0) NOT NULL,
  `price` decimal(7,0) NOT NULL,
  `addonservicestt` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `addonservice`
--

INSERT INTO `addonservice` (`addonserviceid`, `hotelid`, `addonservicename`, `servicetype`, `netprice`, `price`, `addonservicestt`) VALUES
(1, 1, 'Weekly barbeque buffet \'Taste of Mui Ne\'', 'Other Service', '21', '24', 1),
(2, 1, 'Day use packages: A relaxing day in Mui Ne', 'Other Service', '11', '14', 1),
(3, 1, 'Bar - Wine', 'Other Service', '9', '10', 1),
(4, 1, 'Laundry', 'Other Service', '9', '10', 1),
(5, 1, 'Fitness center', 'Other Service', '10', '15', 1),
(6, 1, 'Spa', 'Other Service', '10', '12', 1),
(7, 1, 'Airport shuttle', 'Other Service', '10', '12', 1),
(8, 1, '4 seasons swimming pool', 'Other Service', '4', '5', 1),
(9, 1, 'Extra bed', 'Extra Bed', '10', '12', 1),
(10, 1, 'Food - Salad', 'Other Service', '4', '5', 1),
(11, 1, 'Late check-out 1 hours', 'Late Check-out', '10', '15', 1),
(12, 2, 'Golf', 'Other Service', '22', '25', 1),
(13, 2, 'Spice Spoons', 'Other Service', '11', '12', 1),
(14, 2, 'Bar', 'Other Service', '9', '11', 1),
(15, 2, 'Laundry', 'Other Service', '9', '10', 1),
(16, 2, 'Fitness center', 'Other Service', '10', '15', 1),
(17, 2, 'Spa', 'Other Service', '10', '12', 1),
(18, 2, 'Airport shuttle', 'Other Service', '10', '12', 1),
(19, 2, '4 seasons swimming pool', 'Other Service', '4', '5', 1),
(20, 2, 'Extra bed', 'Extra Bed', '11', '13', 1),
(21, 2, 'Late check in', 'Late Check-out', '4', '5', 1),
(22, 2, 'Late check out', 'Late Check-out', '4', '5', 1),
(23, 3, 'Bar', 'Other Service', '9', '10', 1),
(24, 3, 'Laundry', 'Other Service', '9', '10', 1),
(25, 3, 'Fitness center', 'Other Service', '10', '15', 1),
(26, 3, 'Spa', 'Other Service', '10', '12', 1),
(27, 3, 'Airport shuttle', 'Other Service', '10', '12', 1),
(28, 3, '4 seasons swimming pool', 'Other Service', '4', '5', 1),
(29, 3, 'Extra bed', 'Extra Bed', '10', '12', 1),
(30, 3, 'Late check in', 'Late Check-out', '4', '5', 1),
(31, 3, 'Late check out', 'Late Check-out', '4', '5', 1),
(32, 4, 'Sailing Club Kite School', 'Other Service', '10', '12', 1),
(33, 4, 'Cooking Classes', 'Other Service', '10', '11', 1),
(34, 4, 'Bar', 'Other Service', '9', '10', 1),
(35, 4, 'Laundry', 'Other Service', '9', '10', 1),
(36, 4, 'Fitness center', 'Other Service', '10', '15', 1),
(37, 4, 'Spa', 'Other Service', '10', '12', 1),
(38, 4, 'Airport shuttle', 'Other Service', '10', '12', 1),
(39, 4, '4 seasons swimming pool', 'Other Service', '4', '5', 1),
(40, 4, 'Extra bed', 'Extra Bed', '10', '12', 1),
(41, 4, 'Late check in', 'Late Check-out', '4', '5', 1),
(42, 4, 'Late check out', 'Late Check-out', '4', '5', 1),
(43, 5, 'Bar', 'Other Service', '9', '10', 1),
(44, 5, 'Laundry', 'Other Service', '9', '10', 1),
(45, 5, 'Yoga', 'Other Service', '12', '15', 1),
(46, 5, 'Spa', 'Other Service', '10', '12', 1),
(47, 5, 'Airport shuttle', 'Other Service', '10', '12', 1),
(48, 5, '4 seasons swimming pool', 'Other Service', '4', '5', 1),
(49, 5, 'Extra bed', 'Extra Bed', '10', '12', 1),
(50, 5, 'Late check in', 'Late Check-out', '4', '5', 1),
(51, 5, 'Late check out', 'Late Check-out', '4', '5', 1),
(52, 6, 'Mini Cinema', 'Other Service', '11', '15', 1),
(53, 6, 'Karaoke', 'Other Service', '9', '10', 1),
(54, 6, 'Bar', 'Other Service', '9', '10', 1),
(55, 6, 'Laundry', 'Other Service', '9', '10', 1),
(56, 6, 'Fitness center', 'Other Service', '10', '15', 1),
(57, 6, 'Spa', 'Other Service', '10', '12', 1),
(58, 6, 'Airport shuttle', 'Other Service', '10', '12', 1),
(59, 6, '4 seasons swimming pool', 'Other Service', '4', '5', 1),
(60, 6, 'Extra bed', 'Extra Bed', '10', '12', 1),
(61, 6, 'Late check in', 'Late Check-out', '4', '5', 1),
(62, 6, 'Late check out', 'Late Check-out', '4', '5', 1),
(63, 7, 'Bar', 'Other Service', '9', '10', 1),
(64, 7, 'Laundry', 'Other Service', '9', '10', 1),
(65, 7, 'Yoga', 'Other Service', '10', '15', 1),
(66, 7, 'Spa', 'Other Service', '10', '12', 1),
(67, 7, 'Airport shuttle', 'Other Service', '10', '12', 1),
(68, 7, 'Extra bed', 'Extra Bed', '10', '12', 1),
(69, 7, 'Late check in', 'Late Check-out', '4', '5', 1),
(70, 7, 'Late check out', 'Late Check-out', '4', '5', 1),
(71, 8, 'Bar', 'Other Service', '9', '10', 1),
(72, 8, 'Laundry', 'Other Service', '9', '10', 1),
(73, 8, 'Fitness center', 'Other Service', '10', '15', 1),
(74, 8, 'Spa', 'Other Service', '10', '12', 1),
(75, 8, 'Airport shuttle', 'Other Service', '10', '12', 1),
(76, 8, 'Infinity pool', 'Other Service', '4', '5', 1),
(77, 8, 'Extra bed', 'Extra Bed', '10', '12', 1),
(78, 8, 'Late check in', 'Late Check-out', '4', '5', 1),
(79, 8, 'Late check out', 'Late Check-out', '4', '5', 1),
(80, 9, 'Windsurfing', 'Other Service', '11', '12', 1),
(81, 9, 'Bar', 'Other Service', '9', '10', 1),
(82, 9, 'Laundry', 'Other Service', '9', '10', 1),
(83, 9, 'Yoga', 'Other Service', '10', '15', 1),
(84, 9, 'Spa', 'Other Service', '10', '12', 1),
(85, 9, 'Airport shuttle', 'Other Service', '10', '12', 1),
(86, 9, 'Steam room', 'Other Service', '8', '9', 1),
(87, 9, 'Extra bed', 'Extra Bed', '10', '12', 1),
(88, 9, 'Late check in', 'Late Check-out', '4', '5', 1),
(89, 9, 'Late check out', 'Late Check-out', '4', '5', 1),
(90, 10, 'Windsurfing', 'Other Service', '11', '12', 1),
(91, 10, 'Bar', 'Other Service', '9', '10', 1),
(92, 10, 'Laundry', 'Other Service', '9', '10', 1),
(93, 10, 'Fitness center', 'Other Service', '10', '15', 1),
(94, 10, 'Spa', 'Other Service', '10', '12', 1),
(95, 10, 'Airport shuttle', 'Other Service', '10', '12', 1),
(96, 10, 'Karaoke', 'Other Service', '9', '10', 1),
(97, 10, 'Fishing', 'Other Service', '6', '8', 1),
(98, 10, 'Extra bed', 'Extra Bed', '10', '12', 1),
(99, 10, 'Late check in', 'Late Check-out', '4', '5', 1),
(100, 10, 'Late check out', 'Late Check-out', '4', '5', 1),
(101, 11, 'Hairdressers', 'Other Service', '4', '5', 1),
(102, 11, 'Bar', 'Other Service', '9', '10', 1),
(103, 11, 'Laundry', 'Other Service', '9', '10', 1),
(104, 11, 'Fitness center', 'Other Service', '10', '15', 1),
(105, 11, 'Spa', 'Other Service', '10', '12', 1),
(106, 11, 'Airport shuttle', 'Other Service', '10', '12', 1),
(107, 11, 'Yoga', 'Other Service', '8', '9', 1),
(108, 11, 'Extra bed', 'Extra Bed', '10', '12', 1),
(109, 11, 'Late check in', 'Late Check-out', '4', '5', 1),
(110, 11, 'Late check out', 'Late Check-out', '4', '5', 1),
(111, 12, 'Private Beach', 'Other Service', '11', '12', 1),
(112, 12, 'Bar', 'Other Service', '9', '10', 1),
(113, 12, 'Laundry', 'Other Service', '9', '10', 1),
(114, 12, 'Fitness center', 'Other Service', '10', '15', 1),
(115, 12, 'Spa', 'Other Service', '10', '12', 1),
(116, 12, 'Airport shuttle', 'Other Service', '10', '12', 1),
(117, 12, 'Roman swimming pool', 'Other Service', '4', '5', 1),
(118, 12, 'Extra bed', 'Extra Bed', '10', '12', 1),
(119, 12, 'Late check in', 'Late Check-out', '4', '5', 1),
(120, 12, 'Late check out', 'Late Check-out', '4', '5', 1),
(121, 13, 'BBQ', 'Other Service', '9', '10', 1),
(122, 13, 'Bar', 'Other Service', '9', '10', 1),
(123, 13, 'Laundry', 'Other Service', '9', '10', 1),
(124, 13, 'Fitness center', 'Other Service', '10', '15', 1),
(125, 13, 'Spa', 'Other Service', '10', '12', 1),
(126, 13, 'Airport shuttle', 'Other Service', '10', '12', 1),
(127, 13, 'Infinity swimming pool', 'Other Service', '4', '5', 1),
(128, 13, 'Extra bed', 'Extra Bed', '10', '12', 1),
(129, 13, 'Late check in', 'Late Check-out', '4', '5', 1),
(130, 13, 'Late check out', 'Late Check-out', '4', '5', 1),
(131, 14, 'BBQ', 'Other Service', '9', '10', 1),
(132, 14, 'Karaoke', 'Other Service', '9', '10', 1),
(133, 14, 'Bar', 'Other Service', '9', '10', 1),
(134, 14, 'Laundry', 'Other Service', '9', '10', 1),
(135, 14, 'Fitness center', 'Other Service', '10', '15', 1),
(136, 14, 'Spa', 'Other Service', '10', '12', 1),
(137, 14, 'Airport shuttle', 'Other Service', '10', '12', 1),
(138, 14, 'Extra bed', 'Extra Bed', '10', '12', 1),
(139, 14, 'Late check in', 'Late Check-out', '4', '5', 1),
(140, 14, 'Late check out', 'Late Check-out', '4', '5', 1),
(141, 15, 'Disco/DJ', 'Other Service', '11', '12', 1),
(142, 15, 'Bar', 'Other Service', '9', '10', 1),
(143, 15, 'Laundry', 'Other Service', '9', '10', 1),
(144, 15, 'Fitness center', 'Other Service', '10', '15', 1),
(145, 15, 'Spa', 'Other Service', '10', '12', 1),
(146, 15, 'Airport shuttle', 'Other Service', '10', '12', 1),
(147, 15, 'Yoga', 'Other Service', '4', '5', 1),
(148, 15, 'Extra bed', 'Extra Bed', '10', '12', 1),
(149, 15, 'Late check in', 'Late Check-out', '4', '5', 1),
(150, 15, 'Late check out', 'Late Check-out', '4', '5', 1),
(151, 16, 'Tenis', 'Other Service', '4', '5', 1),
(152, 16, 'Bar', 'Other Service', '9', '10', 1),
(153, 16, 'Laundry', 'Other Service', '9', '10', 1),
(154, 16, 'Fitness center', 'Other Service', '10', '15', 1),
(155, 16, 'Spa', 'Other Service', '10', '12', 1),
(156, 16, 'Airport shuttle', 'Other Service', '10', '12', 1),
(157, 16, 'Yoga', 'Other Service', '11', '14', 1),
(158, 16, 'Infinity swimming pool', 'Other Service', '4', '5', 1),
(159, 16, 'Extra bed', 'Extra Bed', '10', '12', 1),
(160, 16, 'Late check in', 'Late Check-out', '4', '5', 1),
(161, 16, 'Late check out', 'Late Check-out', '4', '5', 1),
(162, 17, 'Gofl', 'Other Service', '13', '15', 1),
(163, 17, 'Tenis', 'Other Service', '11', '12', 1),
(164, 17, 'BBQ', 'Other Service', '9', '10', 1),
(165, 17, 'Bar', 'Other Service', '9', '10', 1),
(166, 17, 'Laundry', 'Other Service', '9', '10', 1),
(167, 17, 'Fitness center', 'Other Service', '10', '15', 1),
(168, 17, 'Spa', 'Other Service', '10', '12', 1),
(169, 17, 'Airport shuttle', 'Other Service', '10', '12', 1),
(170, 17, 'Yoga', 'Other Service', '4', '5', 1),
(171, 17, 'Extra bed', 'Extra Bed', '10', '12', 1),
(172, 17, 'Late check in', 'Late Check-out', '4', '5', 1),
(173, 17, 'Late check out', 'Late Check-out', '4', '5', 1),
(174, 18, 'Japanese style bathroom', 'Other Service', '7', '10', 1),
(175, 18, 'Bar', 'Other Service', '9', '10', 1),
(176, 18, 'Laundry', 'Other Service', '9', '10', 1),
(177, 18, 'Fitness center', 'Other Service', '10', '15', 1),
(178, 18, 'Spa', 'Other Service', '10', '12', 1),
(179, 18, 'Airport shuttle', 'Other Service', '10', '12', 1),
(180, 18, 'Extra bed', 'Extra Bed', '10', '12', 1),
(181, 18, 'Late check in', 'Late Check-out', '4', '5', 1),
(182, 18, 'Late check out', 'Late Check-out', '4', '5', 1),
(183, 19, 'BBQ', 'Other Service', '11', '12', 1),
(184, 19, 'Cooking Classes', 'Other Service', '9', '10', 1),
(185, 19, 'Water sports', 'Other Service', '9', '10', 1),
(186, 19, 'Fishing', 'Other Service', '4', '5', 1),
(187, 19, 'Bar', 'Other Service', '9', '10', 1),
(188, 19, 'Laundry', 'Other Service', '9', '10', 1),
(189, 19, 'Fitness center', 'Other Service', '10', '15', 1),
(190, 19, 'Spa', 'Other Service', '10', '12', 1),
(191, 19, 'Airport shuttle', 'Other Service', '10', '12', 1),
(192, 19, 'Special swimming pool', 'Other Service', '4', '5', 1),
(193, 19, 'Extra bed', 'Extra Bed', '10', '12', 1),
(194, 19, 'Late check in', 'Late Check-out', '4', '5', 1),
(195, 19, 'Late check out', 'Late Check-out', '4', '5', 1),
(196, 1, 'Food - HotPot', 'Other Service', '25', '27', 1),
(197, 1, 'Bar - Juices', 'Other Service', '3', '5', 1),
(198, 1, 'Late check-out before 18h', 'Late Check-out', '0', '0', 1),
(199, 1, 'ytu', 'Other Service', '7', '7', 0);

-- --------------------------------------------------------

--
-- Table structure for table `city`
--

CREATE TABLE `city` (
  `cityid` int(11) NOT NULL,
  `cityname` varchar(30) NOT NULL,
  `provinceid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `city`
--

INSERT INTO `city` (`cityid`, `cityname`, `provinceid`) VALUES
(1, 'District 1', 1),
(2, 'District 3', 1),
(3, 'Tay Ho', 2),
(4, 'Hoan Kiem', 2),
(5, 'Ngu Hanh Son', 3),
(6, 'Hai Chau', 3),
(7, 'Nha Trang', 4),
(8, 'Phu Quoc', 5),
(9, 'Phan Thiet', 6);

-- --------------------------------------------------------

--
-- Table structure for table `contractinfo`
--

CREATE TABLE `contractinfo` (
  `contractid` int(11) NOT NULL,
  `hoteltid` int(11) NOT NULL,
  `taxcode` varchar(50) NOT NULL,
  `fromdate` date NOT NULL,
  `todate` date NOT NULL,
  `contractinfostt` int(11) NOT NULL,
  `contractname` varchar(200) NOT NULL,
  `address` varchar(250) NOT NULL,
  `email` varchar(50) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `channel` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `contractinfo`
--

INSERT INTO `contractinfo` (`contractid`, `hoteltid`, `taxcode`, `fromdate`, `todate`, `contractinfostt`, `contractname`, `address`, `email`, `phone`, `channel`) VALUES
(1, 1, '54910113', '2021-01-01', '2021-12-31', 2, 'MyWedSize', '35/06 D5 St, 25 w, Binh Thach Dis, HCM city ', 'dongthithanhxuan.hn@gmail.com', '0904859325', 'ONLINECHANNEL'),
(2, 1, '54910113', '2021-02-01', '2021-12-31', 2, 'Cong Ty TNHH MTV Dich Vu Lu Hanh Saigontourist', '102 Nguyen Hue, P Ben Nghe, Quan 1, TP Ho Chi Minh', 'dongthithanhxuan.hn@gmail.com', '0904859325', 'AGENTCHANNEL'),
(3, 1, '54910113', '2021-02-01', '2021-12-31', 2, 'Cong Ty TNHH MTV Dich Vu Lu Hanh Cholontourist', '787 Tran Hung Dao,P7, Q5, TP Ho Chi Minh', 'dongthithanhxuan.hn@gmail.com', '0904859325', 'AGENTCHANNEL'),
(4, 1, '54910113', '2021-02-01', '2021-12-31', 2, 'Cong Ty TNHH VietTravel', '190 Pasteur,P Vo Thi Sau, Quan 3, TP Ho Chi Minh', 'dongthithanhxuan.hn@gmail.com', '0904859325', 'AGENTCHANNEL'),
(5, 1, '25251325', '2022-01-01', '2022-12-31', 1, 'Traveloto', '35/06 D5 St, 25 w, Binh Thach Dis, HCM city ', 'dongthithanhxuan.hn@gmail.com', '0904859325', 'ONLINECHANNEL'),
(6, 1, '040919893', '2022-02-01', '2022-12-31', 1, 'Cong Ty TNHH MTV Dich Vu Lu Hanh Saigontourist', '102 Nguyen Hue, P Ben Nghe, Quan 1, TP Ho Chi Minh', 'dongthithanhxuan.hn@gmail.com', '0904859325', 'AGENTCHANNEL'),
(7, 1, '42343242397', '2022-02-01', '2022-12-31', 1, 'Cong Ty TNHH MTV Dich Vu Lu Hanh Cholontourist', '787 Tran Hung Dao,P7, Q5, TP Ho Chi Minh', 'dongthithanhxuan.hn@gmail.com', '0904859325', 'AGENTCHANNEL'),
(8, 1, '54910113', '2022-02-01', '2022-12-31', 0, 'Cong Ty TNHH VietTravel', '190 Pasteur,P Vo Thi Sau, Quan 3, TP Ho Chi Minh', 'dongthithanhxuan.hn@gmail.com', '0904859325', 'AGENTCHANNEL'),
(9, 2, '25251325', '2022-01-01', '2022-12-31', 1, 'Traveloto', '35/06 D5 St, 25 w, Binh Thach Dis, HCM city ', 'dongthithanhxuan.hn@gmail.com', '0904859325', 'ONLINECHANNEL'),
(10, 3, '25251325', '2022-01-01', '2022-12-31', 1, 'Traveloto', '35/06 D5 St, 25 w, Binh Thach Dis, HCM city ', 'dongthithanhxuan.hn@gmail.com', '0904859325', 'ONLINECHANNEL'),
(11, 4, '25251325', '2022-01-01', '2022-12-31', 1, 'Traveloto', '35/06 D5 St, 25 w, Binh Thach Dis, HCM city ', 'dongthithanhxuan.hn@gmail.com', '0904859325', 'ONLINECHANNEL'),
(12, 5, '25251325', '2022-01-01', '2022-12-31', 1, 'Traveloto', '35/06 D5 St, 25 w, Binh Thach Dis, HCM city ', 'dongthithanhxuan.hn@gmail.com', '0904859325', 'ONLINECHANNEL'),
(13, 6, '25251325', '2022-01-01', '2022-12-31', 1, 'Traveloto', '35/06 D5 St, 25 w, Binh Thach Dis, HCM city ', 'dongthithanhxuan.hn@gmail.com', '0904859325', 'ONLINECHANNEL'),
(14, 7, '25251325', '2022-01-01', '2022-12-31', 1, 'Traveloto', '35/06 D5 St, 25 w, Binh Thach Dis, HCM city ', 'dongthithanhxuan.hn@gmail.com', '0904859325', 'ONLINECHANNEL'),
(15, 8, '25251325', '2022-01-01', '2022-12-31', 1, 'Traveloto', '35/06 D5 St, 25 w, Binh Thach Dis, HCM city ', 'dongthithanhxuan.hn@gmail.com', '0904859325', 'ONLINECHANNEL'),
(16, 9, '25251325', '2022-01-01', '2022-12-31', 1, 'Traveloto', '35/06 D5 St, 25 w, Binh Thach Dis, HCM city ', 'dongthithanhxuan.hn@gmail.com', '0904859325', 'ONLINECHANNEL'),
(17, 10, '25251325', '2022-01-01', '2022-12-31', 1, 'Traveloto', '35/06 D5 St, 25 w, Binh Thach Dis, HCM city ', 'dongthithanhxuan.hn@gmail.com', '0904859325', 'ONLINECHANNEL'),
(18, 11, '25251325', '2022-01-01', '2022-12-31', 1, 'Traveloto', '35/06 D5 St, 25 w, Binh Thach Dis, HCM city ', 'dongthithanhxuan.hn@gmail.com', '0904859325', 'ONLINECHANNEL'),
(19, 12, '25251325', '2022-01-01', '2022-12-31', 1, 'Traveloto', '35/06 D5 St, 25 w, Binh Thach Dis, HCM city ', 'dongthithanhxuan.hn@gmail.com', '0904859325', 'ONLINECHANNEL'),
(20, 13, '25251325', '2022-01-01', '2022-12-31', 1, 'Traveloto', '35/06 D5 St, 25 w, Binh Thach Dis, HCM city ', 'dongthithanhxuan.hn@gmail.com', '0904859325', 'ONLINECHANNEL'),
(21, 14, '25251325', '2022-01-01', '2022-12-31', 1, 'Traveloto', '35/06 D5 St, 25 w, Binh Thach Dis, HCM city ', 'dongthithanhxuan.hn@gmail.com', '0904859325', 'ONLINECHANNEL'),
(22, 15, '25251325', '2022-01-01', '2022-12-31', 1, 'Traveloto', '35/06 D5 St, 25 w, Binh Thach Dis, HCM city ', 'dongthithanhxuan.hn@gmail.com', '0904859325', 'ONLINECHANNEL'),
(23, 16, '25251325', '2022-01-01', '2022-12-31', 1, 'Traveloto', '35/06 D5 St, 25 w, Binh Thach Dis, HCM city ', 'dongthithanhxuan.hn@gmail.com', '0904859325', 'ONLINECHANNEL'),
(24, 17, '25251325', '2022-01-01', '2022-12-31', 1, 'Traveloto', '35/06 D5 St, 25 w, Binh Thach Dis, HCM city ', 'dongthithanhxuan.hn@gmail.com', '0904859325', 'ONLINECHANNEL'),
(25, 18, '25251325', '2022-01-01', '2022-12-31', 1, 'Traveloto', '35/06 D5 St, 25 w, Binh Thach Dis, HCM city ', 'dongthithanhxuan.hn@gmail.com', '0904859325', 'ONLINECHANNEL'),
(26, 19, '25251325', '2022-01-01', '2022-12-31', 1, 'Traveloto', '35/06 D5 St, 25 w, Binh Thach Dis, HCM city ', 'dongthithanhxuan.hn@gmail.com', '0904859325', 'ONLINECHANNEL');

-- --------------------------------------------------------

--
-- Table structure for table `contractinforoomtype`
--

CREATE TABLE `contractinforoomtype` (
  `contractid` int(11) NOT NULL,
  `roomtypeid` int(11) NOT NULL,
  `hightseasonprice` double NOT NULL,
  `lowseasonprice` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `contractinforoomtype`
--

INSERT INTO `contractinforoomtype` (`contractid`, `roomtypeid`, `hightseasonprice`, `lowseasonprice`) VALUES
(2, 1, 300, 280),
(5, 1, 300, 280),
(5, 2, 250, 200),
(5, 3, 180, 150),
(5, 4, 116, 100),
(5, 5, 115, 99),
(5, 6, 220, 180),
(5, 7, 250, 220),
(5, 99, 120, 90),
(5, 100, 100, 80),
(5, 101, 110, 85),
(5, 102, 110, 85),
(6, 1, 310, 290),
(6, 2, 240, 210),
(6, 3, 190, 170),
(6, 4, 120, 110),
(6, 5, 116, 100),
(6, 6, 220, 190),
(6, 7, 260, 230),
(7, 1, 301, 290),
(7, 2, 255, 205),
(7, 3, 185, 155),
(7, 4, 120, 105),
(7, 5, 120, 105),
(7, 6, 225, 185),
(7, 7, 255, 225),
(9, 66, 150, 110),
(9, 69, 140, 100),
(9, 71, 210, 180),
(10, 8, 220, 200),
(10, 9, 300, 280),
(10, 10, 310, 220),
(10, 11, 370, 350),
(10, 12, 500, 480),
(10, 13, 570, 550),
(10, 14, 575, 565),
(10, 15, 620, 600),
(10, 16, 210, 190),
(10, 17, 140, 120),
(10, 18, 160, 140),
(10, 19, 180, 160),
(10, 20, 120, 100),
(11, 21, 190, 170),
(11, 22, 210, 190),
(11, 23, 240, 220),
(11, 24, 280, 260),
(11, 25, 330, 310),
(11, 26, 540, 520),
(12, 27, 220, 200),
(12, 28, 240, 220),
(12, 29, 260, 240),
(12, 30, 450, 430),
(12, 31, 590, 570),
(12, 32, 270, 250),
(12, 33, 360, 340),
(12, 34, 420, 400),
(13, 35, 150, 130),
(13, 37, 195, 175),
(13, 39, 210, 190),
(13, 40, 170, 150),
(13, 41, 205, 185),
(13, 43, 220, 200),
(13, 45, 320, 300),
(13, 46, 620, 600),
(14, 47, 120, 100),
(14, 48, 110, 90),
(14, 49, 115, 85),
(14, 50, 170, 150),
(15, 51, 150, 130),
(15, 52, 90, 60),
(15, 53, 170, 145),
(15, 54, 270, 235),
(15, 55, 160, 140),
(15, 56, 140, 120),
(15, 57, 170, 150),
(15, 58, 130, 90),
(16, 59, 170, 140),
(16, 62, 120, 100),
(16, 64, 95, 80),
(16, 65, 110, 95),
(18, 72, 260, 220),
(18, 74, 110, 80),
(18, 75, 120, 85),
(18, 77, 95, 75),
(19, 78, 100, 80),
(19, 80, 110, 85),
(19, 82, 100, 80),
(19, 83, 100, 80),
(20, 84, 110, 90),
(20, 85, 140, 120),
(20, 86, 150, 130),
(20, 87, 100, 80),
(21, 88, 110, 90),
(21, 92, 300, 180),
(21, 93, 200, 180),
(22, 94, 110, 90),
(22, 95, 150, 80),
(22, 97, 100, 80),
(22, 98, 180, 160),
(24, 104, 110, 90),
(24, 105, 200, 180),
(24, 106, 100, 85),
(25, 107, 110, 90),
(26, 111, 110, 90),
(26, 113, 300, 280),
(26, 115, 140, 110);

-- --------------------------------------------------------

--
-- Table structure for table `hotel`
--

CREATE TABLE `hotel` (
  `hotelid` int(11) NOT NULL,
  `hotelname` varchar(50) NOT NULL,
  `description` varchar(500) NOT NULL,
  `star` int(4) NOT NULL,
  `address` int(11) NOT NULL,
  `street` varchar(100) NOT NULL,
  `spa` int(11) NOT NULL,
  `pool` int(1) NOT NULL,
  `beach` int(1) NOT NULL,
  `bar` int(1) NOT NULL,
  `restaurants` int(1) NOT NULL,
  `frontdesk` int(1) NOT NULL,
  `transport` int(1) NOT NULL,
  `shuttle` int(1) NOT NULL,
  `parking` int(1) NOT NULL,
  `fitnesscenter` int(1) NOT NULL,
  `bank_Info1` varchar(200) DEFAULT NULL,
  `bank_Info2` varchar(200) DEFAULT NULL,
  `bank_Info3` varchar(200) DEFAULT NULL,
  `totalrating` decimal(2,1) DEFAULT NULL,
  `logo` varchar(250) NOT NULL,
  `hotelstatus` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `hotel`
--

INSERT INTO `hotel` (`hotelid`, `hotelname`, `description`, `star`, `address`, `street`, `spa`, `pool`, `beach`, `bar`, `restaurants`, `frontdesk`, `transport`, `shuttle`, `parking`, `fitnesscenter`, `bank_Info1`, `bank_Info2`, `bank_Info3`, `totalrating`, `logo`, `hotelstatus`) VALUES
(1, 'Pandanus Resort', 'Welcome to a refreshing retreat abounding in palm trees and lush tropical flora on a white sand beach. Designed in the charming Cham architectural style, this peaceful getaway will comfort you and transport you to a place of serenity and beauty, while the sound of the ocean waves whispers in your ear.  Relax and ready yourself to experience the real Mui Ne, immersing yourself in the peaceful life of the local people.', 4, 19, 'o dau con lau moi noi', 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, '200421349888888-Vietcombank', '6235979878996666-Vietinbank', '333355657687878-ACB', '9.5', 'PandanusLogo.png', 1),
(2, 'Anantara Mui Ne Resort', 'Four hours east of Ho Chi Minh City, a 10 km stretch of golden beach invites unwinding. Pool villas and tropical gardens surround the resort\'s lagoon. \r\nDine on fresh seafood overlooking the ocean while staying at our resort in Mui Ne. Join in the famous kitesurfing scene. Explore Cham ruins or hot air balloons over the rolling red and white sand dunes for which Mui Ne is known for. ', 5, 19, 'o dau con lau moi noi', 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, '4313459999999-CitiBank', '700455678888888-HSBC', '', '8.8', '', 1),
(3, 'Bamboo Village Beach Resort', 'Located in the heart of Mui Ne beach, our resort provides travelers from all over the world a gateway to one of the world’s most beautiful and reclusive white sandy beaches on the Southern coast of Vietnam. A popular destination for couples and honeymooners, Bamboo Village is known for its lush tropical garden, luxury spa, eco-friendly accommodations, and friendly customer service.\r\nWe are a family-owned, award-winning resort that has opened our door since 1998.', 4, 19, 'o dau con lau moi noi', 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, '3436899997656454-ACB', '42786787684444-Sacombank', '', '9.2', '', 1),
(4, 'Sailing Club Resort Mui Ne', 'The Sailing Club Leisure Group is a well-established company founded in 1994 by an Australian businessman and family man, passionate about hospitality and beautiful Vietnam. The Sailing Club Resort Mui Ne (formerly known as Mia Mui Ne) opened in 2002 and has been continually enhanced over the years in response to the needs of our guests and to provide an enviable list of distinctive in-house amenities. From our Sailing Club family to yours, we welcome you to your tropical home away from home.', 4, 19, 'o dau con lau moi noi', 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, '6657657777777-Vietcombank', '2004567767555555-VietinBank', '', '9.1', '', 1),
(5, 'Centara Mirage Resort Mui Ne', 'Awaken your sense of wonder at Centara Mirage Resort Mui Ne, an Explorer’s Playground-themed resort overlooking the East Sea with discovery, entertainment, and joy at the heart of the experience.\r\nFollow in the footsteps of the Spanish maritime explorers who turned the resort into their playground, filling it with all their favorite items, activities, and inspirations from their travels to create a fully-integrated resort for guests of all ages.', 5, 19, 'o dau con lau moi noi', 1, 1, 1, 1, 1, 1, 1, 0, 1, 0, '5557679999999-HSBC', '0079668888888-ACB', '', '8.8', '', 1),
(6, 'The Cliff Resort and Residences', 'A new refreshing, enchanting experience awaits you at the entry to the capital of Mui Ne. Introducing the grandeur of The Cliff Resort & Residences. The Cliff with its unique location, sitting comfortably atop the rocky and gentle slopes, offers a breathtaking panoramic view of the blue sea. The Cliff offers an unprecedented opportunity to enjoy the unbelievable natural beauty. The Cliff sits in harmony nestled in the hand of nature.', 4, 19, 'o dau con lau moi noi', 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, '4444233434351111-Vietcombank', '0099877889090-ACB', '', '8.8', '', 1),
(7, 'Poshanu Resort', 'A premium resort \"Poshanu Resort\" is built on a rock right on the most beautiful beach of Mui Ne. With the idea of \"bringing the soul of Cham culture to the sea\", the investors of the resort designed the whole resort as a Cham village. Twenty-four luxurious villas are designed according to the Cham architectural style, but inside they are all equipped with modern furniture according to the standards of a four-star hotel.', 4, 19, 'o dau con lau moi noi', 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, '00454222222444-Vietcombank', '26275656767555555-BIDV', '', '8.6', '', 1),
(8, 'Aroma Beach Resort and Spa', 'Possessing a view close to the beach, Aroma brings a very refreshing feeling to visitors. Here, you will escape the crowded streets or noisy bars. Instead, there are peaceful sounds at a poetic oasis right in the middle of the bay. This is the right place for those who want to enjoy the golden sand and blue sea but still need a moment of relaxation and privacy.', 4, 19, 'o dau con lau moi noi', 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, '44455667676666-VietinBank', '44466665555500-ACB', '', '8.8', '', 1),
(9, 'Allezboo Beach Resort and Spa', 'Say goodbye to the stress of day-to-day responsibilities and check in to Allezboo resort. The French Colonial-style resort - which boasts swimming pools amid manicured gardens and a luxurious restaurant - is the perfect place to let go of stress and relax uninterrupted.\r\nOffers a luxury experience through delicious cuisine in our high-end restaurants, an array of pristine rooms to relax in, and a serene surrounding location.', 4, 19, 'o dau con lau moi noi', 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, '44466444545-Sacombank', '777445566666-BIDV', '', '8.0', '', 1),
(10, 'Sea Links Beach Resort & Golf', 'Sea Links Beach Hotel is a 5 stars Hotel located on the highest of Sea Links City area with an Architectural style\r\nof Terraced field in Vietnam and equipped with full of modern equipment. Sea Links Beach Hotel is inclusive of 188 spacious and luxurious rooms with a private balcony view of the beach and pool.\r\nThere are full of room styles: Superior room, Deluxe room, Suite, and President.', 5, 19, 'o dau con lau moi noi', 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, '55677899999999-VietinBank', '2224444488888-MB', '', '8.4', '', 1),
(11, 'Muong Thanh Luxury Khanh Hoa', 'Parking and Wi-Fi are always free, so you can stay in touch, coming and going as you please. Centrally located in Xuong Huan of Nha Trang, this property puts you close to attractions and exciting dining options. Be sure to take some time to visit Vinpearl Land Nha Trang as well as the nearby Nha Trang Beach. Rated 5 stars, this high-quality property offers guests access to an indoor swimming pool, massage and an on-site outdoor pool.', 5, 14, 'o dau con lau moi noi', 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, '289571349888888-Vietcombank', '2004213498145888-TP Bank', '2085213498145888-Agribank', '9.0', '', 1),
(12, 'Sunrise Nha Trang Beach Hotel & Spa', 'Parking and Wi-Fi are always free, so you can stay in touch, coming and going as you please. Centrally located in Nha Trang\'s Xuong Huan, this property puts you close to attractions and exciting dining options. Be sure to take some time to visit Vinpearl Land Nha Trang as well as the nearby Nha Trang Beach. Rated 5 stars, this high-quality property offers guests access to an indoor swimming pool, massage and an on-site outdoor pool.', 5, 14, 'o dau con lau moi noi', 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, '200421147888888-Vietcombank', '200421349874888-MB', '', '8.8', '', 1),
(13, 'DQua Hotel and Apartment', 'D\'Qua Hotel is certified 5-star standard with unique architecture located in the center of Nha Trang City. All 202 rooms and 160 apartments are luxuriously designed and furnished with panoramic views of the city and the sprawling Nha Trang Bay.', 5, 14, 'o dau con lau moi noi', 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, '200421147987888-TP Bank', '', '', '8.4', '', 1),
(14, 'Diamond Bay Hotel', 'Diamond Bay Nha Trang Hotel was built in Nha Trang Center complex consists of 5-storey podium for shopping centers and 2 separate towers 20 stories above, a tower designed for apartments and tower also the hotel is 275 rooms with modern equipment luxurious restaurant and meeting room systems to meet requirement of many different customer markets.', 5, 15, 'o dau con lau moi noi', 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, '5557679879999-HSBC', '5557679952799-MB', '', '8.6', '', 1),
(15, 'Havana Nha Trang Hotel', 'Havana Nha Trang Hotel stands out with a height of 41 floors, providing 1060 rooms facing the sea, with a system of modern equipment and facilities according to international 5-star standards. It is a clever combination of European-style interior architecture on the background of highly aesthetic natural materials, exuding luxury, leaving you with an unforgettable impression.', 5, 15, 'o dau con lau moi noi', 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, '262756567675855455-BIDV', '26275656767511155-VietinBank', '', '8.8', '', 1),
(16, 'Sandy Beach Non Nuoc Resort', 'Sandy Beach Non Nuoc Resort welcomes you to a wonderful vacation in Da Nang, a must-see destination where green-covered mountains and tropical gardens stretch across the resort\'s grounds, in harmony with the song of the sea with clear water and long sparkling sand.', 4, 9, 'o dau con lau moi noi', 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, '42786785484444-Sacombank', '4278678768544-VietcomBank', '', '7.8', '', 1),
(17, 'Vinpearl Luxury Da Nang', 'Located on the \"waterscape\" on the romantic Non Nuoc beach and the natural masterpiece of Ngu Hanh Son mountain, Vinpearl Luxury Da Nang brings harmony between ecstatic natural beauty and luxurious Indochine architecture. East Asia. Experiences not to be missed here are yoga or relaxing massage in the unique Himalayan salt rock sauna to detoxify and purify the body, or explore the system of 5 beautiful swimming pools, including the infinity pool. up to 1,185m2 wide.', 5, 9, 'o dau con lau moi noi', 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, '44455667699966-VietinBank', '44418567676666-VietcomBank', '', '9.1', '', 1),
(18, 'Grandvrio City Danang', 'Located in one of the busiest streets of Da Nang city, Grandvrio City Danang Hotel is aiming to be one of the leading hotels in providing accommodation and resort services in Da Nang city. With a peaceful location, combined with a variety of recreational services, Grandvrio City Danang Hotel is your ticket to an exciting and new experience.', 4, 12, 'o dau con lau moi noi', 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, '42786787689854-Sacombank', '42888787684444-VietinBank', '', '8.7', '', 1),
(19, 'Naman Retreat Resort', 'Stepping into our enchanting and liberating resort paradise, you have entered a world of complete bliss.', 5, 11, 'o dau con lau moi noi', 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, '200421147899998-Vietcombank', '', '', '8.6', '', 1),
(20, 'rrrrr', '                                          1414          	', 0, 7, 'rrrrrrrrr', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, 'dove.png', 0),
(21, 'rrrrr435435', '                                  tttttttttttt                  	', 0, 7, 'rrrrrrrrr', 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, 'dove.png', 0),
(22, 'er3453', '   tetewt                                 	', 0, 11, 'rrrrrrrrr', 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, NULL, NULL, NULL, NULL, 'dove.png', 0),
(23, 'rrrrr435435', '  42424               	', 0, 11, 'rrrrrrrrr', 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, NULL, NULL, NULL, NULL, 'dove.png', 0),
(24, 'rrrrr', '32222222', 0, 1, '32222222', 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, NULL, NULL, NULL, NULL, 'dove.png', 0),
(25, 'rrrrr', 'rrrrrrrrr', 0, 1, 'rrrrrrrrr', 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, NULL, NULL, NULL, NULL, 'dove.png', 0),
(26, 'dsadasd', 'dsadsadsadsad', 0, 1, 'dsadsadsadsad', 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, NULL, NULL, NULL, NULL, 'dove.png', 0),
(27, 'alo', '4535643 3432', 0, 3, '4535643 3432', 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, NULL, NULL, NULL, NULL, 'dove.png', 0),
(28, 'eeee', 'eeeeeee', 0, 2, 'eeeeeee', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, 'dove.png', 0),
(29, 'pppppp', 'ppppppppp', 0, 6, 'ppppppppp', 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, 'dove.png', 0);

-- --------------------------------------------------------

--
-- Table structure for table `hotelimage`
--

CREATE TABLE `hotelimage` (
  `imagehotelid` int(11) NOT NULL,
  `hotelimagename` varchar(50) NOT NULL,
  `hotelid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `hotelimage`
--

INSERT INTO `hotelimage` (`imagehotelid`, `hotelimagename`, `hotelid`) VALUES
(1, 'limg1.jpg', 1),
(2, 'limg2.jpg', 1),
(3, 'limg3.jpg', 1),
(4, 'limg4.jpg', 1),
(5, 'limg5.jpg', 1),
(6, 'limg6.jpg', 1),
(7, 'limg7.jpg', 1),
(8, 'limg8.jpg', 1),
(9, 'limg9.jpg', 1),
(10, 'limg10.jpg', 1),
(11, 'limg11.jpg', 1),
(12, 'limg12.jpg', 2),
(13, 'limg13.jpg', 2),
(14, 'limg14.jpg', 2),
(15, 'limg15.jpg', 2),
(16, 'limg16.jpg', 2),
(17, 'limg17.jpg', 2),
(18, 'limg18.jpg', 2),
(19, 'limg19.jpg', 2),
(20, 'limg20.jpg', 2),
(21, 'limg21.jpg', 2),
(22, 'limg22.jpg', 2),
(23, 'limg23.jpg', 2),
(24, 'limg24.jpg', 2),
(25, 'limg25.jpg', 3),
(26, 'limg26.jpg', 3),
(27, 'limg27.jpg', 3),
(28, 'limg28.jpg', 3),
(29, 'limg29.jpg', 3),
(30, 'limg30.jpg', 3),
(31, 'limg31.jpg', 3),
(32, 'limg32.jpg', 3),
(33, 'limg33.jpg', 3),
(34, 'limg34.jpg', 3),
(35, 'limg35.jpg', 3),
(36, 'limg36.jpg', 4),
(37, 'limg37.jpeg', 4),
(38, 'limg38.jpeg', 4),
(39, 'limg39.jpg', 4),
(40, 'limg40.jpg', 4),
(41, 'limg41.jpg', 4),
(42, 'limg42.jpeg', 4),
(43, 'limg43.jpg', 4),
(44, 'limg44.jpg', 4),
(45, 'limg45.jpg', 4),
(46, 'limg46.jpg', 4),
(47, 'limg47.jpg', 5),
(48, 'limg48.jpg', 5),
(49, 'limg49.jpg', 5),
(50, 'limg50.jpg', 5),
(51, 'limg51.jpg', 5),
(52, 'limg52.jpg', 5),
(53, 'limg53.jpg', 5),
(54, 'limg54.jpg', 5),
(55, 'limg55.jpg', 5),
(56, 'limg56.jpg', 5),
(57, 'limg57.jpg', 6),
(58, 'limg58.jpg', 6),
(59, 'limg59.jpg', 6),
(60, 'limg60.jpg', 6),
(61, 'limg61.jpg', 6),
(62, 'limg62.jpg', 6),
(63, 'limg63.jpg', 6),
(64, 'limg64.jpg', 6),
(65, 'limg65.jpg', 6),
(66, 'limg66.jpg', 6),
(67, 'limg67.jpg', 6),
(68, 'limg68.jpg', 6),
(69, 'limg69.jpg', 6),
(70, 'limg70.jpg', 7),
(71, 'limg71.jpg', 7),
(72, 'limg72.jpg', 7),
(73, 'limg73.jpg', 7),
(74, 'limg74.jpg', 7),
(75, 'limg75.jpg', 7),
(76, 'limg76.jpg', 7),
(77, 'limg77.jpg', 7),
(78, 'limg78.jpg', 7),
(79, 'limg79.jpg', 7),
(80, 'limg80.jpg', 8),
(81, 'limg81.jpg', 8),
(82, 'limg82.jpg', 8),
(83, 'limg83.jpg', 8),
(84, 'limg84.jpg', 8),
(85, 'limg85.jpg', 8),
(86, 'limg86.jpg', 8),
(87, 'limg87.jpg', 8),
(88, 'limg88.jpg', 8),
(89, 'limg89.jpg', 8),
(90, 'limg90.jpg', 8),
(91, 'limg91.jpg', 8),
(92, 'limg92.jpg', 9),
(93, 'limg93.jpg', 9),
(94, 'limg94.jpg', 9),
(95, 'limg95.jpg', 9),
(96, 'limg96.jpg', 9),
(97, 'limg97.jpg', 9),
(98, 'limg98.jpg', 9),
(99, 'limg99.jpg', 9),
(100, 'limg100.jpg', 9),
(101, 'limg101.jpg', 9),
(102, 'limg102.jpg', 9),
(103, 'limg103.jpg', 9),
(104, 'limg104.jpg', 10),
(105, 'limg105.jpg', 10),
(106, 'limg106.jpg', 10),
(107, 'limg107.jpg', 10),
(108, 'limg108.jpg', 10),
(109, 'limg109.jpg', 10),
(110, 'limg110.jpg', 10),
(111, 'limg111.jpg', 10),
(112, 'limg112.jpg', 10),
(113, 'limg113.jpg', 10),
(114, 'limg114.jpg', 10),
(115, 'limg115.jpg', 10),
(116, 'dimg1.jpg', 11),
(117, 'dimg2.jpg', 11),
(118, 'dimg3.jpg', 11),
(119, 'dimg4.jpg', 11),
(120, 'dimg5.jpg', 11),
(121, 'dimg6.jpg', 11),
(122, 'dimg7.jpg', 11),
(123, 'dimg8.jpg', 11),
(124, 'dimg9.jpg', 11),
(125, 'dimg10.jpg', 11),
(126, 'dimg11.jpg', 12),
(127, 'dimg12.jpg', 12),
(128, 'dimg13.jpg', 12),
(129, 'dimg14.jpg', 12),
(130, 'dimg15.jpg', 12),
(131, 'dimg16.jpg', 13),
(132, 'dimg17.jpg', 13),
(133, 'dimg18.jpg', 13),
(134, 'dimg19.jpg', 13),
(135, 'dimg20.jpg', 13),
(136, 'dimg21.jpg', 13),
(137, 'dimg22.jpg', 13),
(138, 'dimg23.jpg', 13),
(139, 'dimg24.jpg', 13),
(140, 'dimg25.jpg', 13),
(141, 'dimg26.jpg', 14),
(142, 'dimg27.jpg', 14),
(143, 'dimg28.jpg', 14),
(144, 'dimg29.jpg', 14),
(145, 'dimg30.jpg', 14),
(146, 'dimg31.jpg', 14),
(147, 'dimg32.jpg', 14),
(148, 'dimg33.jpg', 14),
(149, 'dimg34.jpg', 14),
(150, 'dimg35.jpg', 15),
(151, 'dimg36.jpg', 15),
(152, 'dimg37.jpg', 15),
(153, 'dimg38.jpg', 15),
(154, 'dimg39.jpg', 16),
(155, 'dimg40.jpg', 16),
(156, 'dimg41.jpg', 16),
(157, 'dimg42.jpg', 16),
(158, 'dimg43.jpg', 16),
(159, 'dimg44.jpg', 16),
(160, 'dimg45.jpg', 16),
(161, 'dimg46.jpg', 17),
(162, 'dimg47.jpg', 17),
(163, 'dimg48.jpg', 17),
(164, 'dimg49.jpg', 17),
(165, 'dimg50.jpg', 17),
(166, 'dimg51.jpg', 17),
(167, 'dimg52.jpg', 17),
(168, 'dimg53.jpg', 17),
(169, 'dimg54.jpg', 17),
(170, 'dimg55.jpg', 17),
(171, 'dimg56.jpg', 18),
(172, 'dimg57.jpg', 18),
(173, 'dimg58.jpg', 18),
(174, 'dimg59.jpg', 18),
(175, 'dimg60.jpg', 18),
(176, 'dimg61.jpg', 18),
(177, 'dimg62.jpg', 18),
(178, 'dimg63.jpg', 17),
(179, 'dimg64.jpg', 17),
(180, 'dimg65.jpg', 17),
(181, 'dimg66.jpg', 17),
(182, 'dimg67.jpg', 17),
(183, 'dimg68.jpg', 17),
(184, 'dimg69.jpg', 17),
(185, 'dimg70.jpg', 17),
(186, 'dimg71.jpg', 17),
(187, 'dimg72.jpg', 17),
(188, 'dimg73.jpg', 17);

-- --------------------------------------------------------

--
-- Table structure for table `hotelseason`
--

CREATE TABLE `hotelseason` (
  `hotelseasonid` int(11) NOT NULL,
  `hotelid` int(11) NOT NULL,
  `fromdate` date NOT NULL,
  `todate` date NOT NULL,
  `seasonname` varchar(10) NOT NULL,
  `hotelseasonstt` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `hotelseason`
--

INSERT INTO `hotelseason` (`hotelseasonid`, `hotelid`, `fromdate`, `todate`, `seasonname`, `hotelseasonstt`) VALUES
(1, 1, '2022-09-03', '2022-12-23', 'LOW', 1),
(2, 1, '2022-12-24', '2022-12-25', 'HIGH', 1),
(3, 1, '2022-12-26', '2022-12-31', 'LOW', 1),
(7, 2, '2022-10-01', '2022-12-23', 'LOW', 1),
(8, 2, '2022-12-24', '2022-12-25', 'HIGH', 1),
(9, 2, '2022-12-26', '2022-12-31', 'LOW', 1),
(10, 3, '2022-10-01', '2022-12-23', 'LOW', 1),
(11, 3, '2022-12-24', '2022-12-25', 'HIGH', 1),
(12, 3, '2022-12-26', '2022-12-31', 'LOW', 1),
(13, 4, '2022-10-01', '2022-12-23', 'LOW', 1),
(14, 4, '2022-12-24', '2022-12-25', 'HIGH', 1),
(15, 4, '2022-12-26', '2022-12-31', 'LOW', 1),
(16, 5, '2022-10-01', '2022-12-23', 'LOW', 1),
(17, 5, '2022-12-24', '2022-12-25', 'HIGH', 1),
(18, 5, '2022-12-26', '2022-12-31', 'LOW', 1),
(19, 6, '2022-10-01', '2022-12-23', 'LOW', 1),
(20, 6, '2022-12-24', '2022-12-25', 'HIGH', 1),
(21, 6, '2022-12-26', '2022-12-31', 'LOW', 1),
(22, 7, '2022-10-01', '2022-12-23', 'LOW', 1),
(23, 7, '2022-12-24', '2022-12-25', 'HIGH', 1),
(24, 7, '2022-12-26', '2022-12-31', 'LOW', 1),
(25, 8, '2022-10-01', '2022-12-23', 'LOW', 1),
(26, 8, '2022-12-24', '2022-12-25', 'HIGH', 1),
(27, 8, '2022-12-26', '2022-12-31', 'LOW', 1),
(28, 9, '2022-10-01', '2022-12-23', 'LOW', 1),
(29, 9, '2022-12-24', '2022-12-25', 'HIGH', 1),
(30, 9, '2022-12-26', '2022-12-31', 'LOW', 1),
(31, 10, '2022-10-01', '2022-12-23', 'LOW', 1),
(32, 10, '2022-12-24', '2022-12-25', 'HIGH', 1),
(33, 10, '2022-12-26', '2022-12-31', 'LOW', 1),
(34, 11, '2022-10-01', '2022-12-23', 'LOW', 1),
(35, 11, '2022-12-24', '2022-12-25', 'HIGH', 1),
(36, 11, '2022-12-26', '2022-12-31', 'LOW', 1),
(37, 12, '2022-10-01', '2022-12-23', 'LOW', 1),
(38, 12, '2022-12-24', '2022-12-25', 'HIGH', 1),
(39, 12, '2022-12-26', '2022-12-31', 'LOW', 1),
(40, 13, '2022-10-01', '2022-12-23', 'LOW', 1),
(41, 13, '2022-12-24', '2022-12-25', 'HIGH', 1),
(42, 13, '2022-12-26', '2022-12-31', 'LOW', 1),
(43, 14, '2022-10-01', '2022-12-23', 'LOW', 1),
(44, 14, '2022-12-24', '2022-12-25', 'HIGH', 1),
(45, 14, '2022-12-26', '2022-12-31', 'LOW', 1),
(46, 15, '2022-10-01', '2022-12-23', 'LOW', 1),
(47, 15, '2022-12-24', '2022-12-25', 'HIGH', 1),
(48, 15, '2022-12-26', '2022-12-31', 'LOW', 1),
(49, 16, '2022-10-01', '2022-12-23', 'LOW', 1),
(50, 16, '2022-12-24', '2022-12-25', 'HIGH', 1),
(51, 16, '2022-12-26', '2022-12-31', 'LOW', 1),
(52, 17, '2022-10-01', '2022-12-23', 'LOW', 1),
(53, 17, '2022-12-24', '2022-12-25', 'HIGH', 1),
(54, 17, '2022-12-26', '2022-12-31', 'LOW', 1),
(55, 18, '2022-10-01', '2022-12-23', 'LOW', 1),
(56, 18, '2022-12-24', '2022-12-25', 'HIGH', 1),
(57, 18, '2022-12-26', '2022-12-31', 'LOW', 1),
(58, 19, '2022-10-01', '2022-12-23', 'LOW', 1),
(59, 19, '2022-12-24', '2022-12-25', 'HIGH', 1),
(60, 19, '2022-12-26', '2022-12-31', 'LOW', 1),
(61, 1, '2023-01-01', '2023-01-20', 'LOW', 2),
(62, 1, '2023-01-21', '2023-01-25', 'HIGH', 2),
(63, 1, '2023-01-26', '2023-04-28', 'LOW', 2),
(64, 1, '2023-04-29', '2023-05-01', 'HIGH', 2),
(65, 1, '2023-05-02', '2023-12-31', 'HIGH', 2),
(68, 1, '2023-01-01', '2023-04-28', 'LOW', 2),
(69, 1, '2023-04-29', '2023-05-01', 'HIGH', 2),
(70, 1, '2023-05-02', '2023-12-31', 'LOW', 2),
(71, 1, '2022-01-01', '2022-01-03', 'HIGH', 1),
(72, 1, '2022-01-04', '2022-01-28', 'LOW', 1),
(73, 1, '2022-01-29', '2022-02-06', 'HIGH', 1),
(74, 1, '2022-02-07', '2022-04-09', 'LOW', 1),
(75, 1, '2022-04-10', '2022-04-11', 'HIGH', 1),
(76, 1, '2022-04-12', '2022-04-29', 'LOW', 1),
(77, 1, '2022-04-30', '2022-05-03', 'HIGH', 1),
(78, 1, '2022-05-04', '2022-08-31', 'LOW', 1),
(79, 1, '2022-09-01', '2022-09-02', 'HIGH', 1),
(80, 1, '2023-01-01', '2023-01-20', 'LOW', 1),
(81, 1, '2023-01-21', '2023-01-28', 'HIGH', 1),
(82, 1, '2023-01-29', '2023-12-31', 'LOW', 1);

-- --------------------------------------------------------

--
-- Table structure for table `policies`
--

CREATE TABLE `policies` (
  `policiesid` int(11) NOT NULL,
  `policiescontent` varchar(250) NOT NULL,
  `roomstypeid` int(11) NOT NULL,
  `applyfor` varchar(50) NOT NULL,
  `fromdate` date NOT NULL,
  `todate` date NOT NULL,
  `minbeforecheckindate` int(4) NOT NULL,
  `maxbeforcheckindate` int(11) NOT NULL,
  `refund` int(11) NOT NULL,
  `reissue` int(11) NOT NULL,
  `policiesstatus` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `policies`
--

INSERT INTO `policies` (`policiesid`, `policiescontent`, `roomstypeid`, `applyfor`, `fromdate`, `todate`, `minbeforecheckindate`, `maxbeforcheckindate`, `refund`, `reissue`, `policiesstatus`) VALUES
(1, 'Failure to arrive at your hotel or property will be considered a no-show and will incur a charge of 100% of the booking value', 1, 'ONLINECHANNEL', '2022-10-01', '2022-12-23', 0, 2, 100, 100, 1),
(2, 'any cancellation received betwen 3 days to 7 days prior to arrival date will be charged for 50% the entire stay.', 1, 'ONLINECHANNEL', '2022-10-01', '2022-12-23', 3, 6, 50, 50, 1),
(3, 'Risk-free booking! Cancel 7 days before check-in date and you will not be charged', 1, 'ONLINECHANNEL', '2022-10-01', '2022-12-23', 7, 365, 0, 0, 1),
(4, 'any cancellation received within 7 days prior to arrival date will be charged for the entire stay.\r\nFailure to arrive at your hotel or property will be considered a no-show and will incur a charge of 100% of the booking value', 1, 'ONLINECHANNEL', '2022-12-24', '2022-12-25', 0, 9, 100, 100, 1),
(5, 'Risk-free booking! Cancel 10 days before check-in date and you will not be charged', 1, 'ONLINECHANNEL', '2022-12-24', '2022-12-25', 10, 365, 0, 0, 1),
(6, 'any cancellation received within 7 days prior to arrival date will be charged for the entire stay.\r\nFailure to arrive at your hotel or property will be considered a no-show and will incur a charge of 100% of the booking value', 1, 'ONLINECHANNEL', '2022-12-26', '2022-12-31', 0, 6, 100, 100, 1),
(7, 'Risk-free booking! Cancel 7 days before check-in date and you will not be charged', 1, 'ONLINECHANNEL', '2022-12-26', '2022-12-31', 7, 365, 0, 0, 1),
(8, 'Failure to arrive at your hotel or property will be considered a no-show and will incur a charge of 100% of the booking value', 2, 'ONLINECHANNEL', '2022-10-01', '2022-12-23', 0, 2, 100, 100, 1),
(9, 'any cancellation received betwen 3 days to 7 days prior to arrival date will be charged for 50% the entire stay.', 2, 'ONLINECHANNEL', '2022-10-01', '2022-12-23', 3, 6, 50, 50, 1),
(10, 'Risk-free booking! Cancel 7 days before check-in date and you will not be charged', 2, 'ONLINECHANNEL', '2022-10-01', '2022-12-23', 7, 365, 0, 0, 1),
(11, 'any cancellation received within 7 days prior to arrival date will be charged for the entire stay.\r\nFailure to arrive at your hotel or property will be considered a no-show and will incur a charge of 100% of the booking value', 2, 'ONLINECHANNEL', '2022-12-24', '2022-12-25', 0, 9, 100, 100, 1),
(12, 'Risk-free booking! Cancel 10 days before check-in date and you will not be charged', 2, 'ONLINECHANNEL', '2022-12-24', '2022-12-25', 10, 365, 0, 0, 1),
(13, 'any cancellation received within 7 days prior to arrival date will be charged for the entire stay.\r\nFailure to arrive at your hotel or property will be considered a no-show and will incur a charge of 100% of the booking value', 2, 'ONLINECHANNEL', '2022-12-26', '2022-12-31', 0, 6, 100, 100, 1),
(14, 'Risk-free booking! Cancel 7 days before check-in date and you will not be charged', 2, 'ONLINECHANNEL', '2022-12-26', '2022-12-31', 7, 365, 0, 0, 1),
(15, 'Failure to arrive at your hotel or property will be considered a no-show and will incur a charge of 100% of the booking value', 3, 'ONLINECHANNEL', '2022-10-01', '2022-12-23', 0, 2, 100, 100, 1),
(16, 'any cancellation received betwen 3 days to 7 days prior to arrival date will be charged for 50% the entire stay.', 3, 'ONLINECHANNEL', '2022-10-01', '2022-12-23', 3, 6, 50, 50, 1),
(17, 'Risk-free booking! Cancel 7 days before check-in date and you will not be charged', 3, 'ONLINECHANNEL', '2022-10-01', '2022-12-23', 7, 365, 0, 0, 1),
(18, 'any cancellation received within 7 days prior to arrival date will be charged for the entire stay.\r\nFailure to arrive at your hotel or property will be considered a no-show and will incur a charge of 100% of the booking value', 3, 'ONLINECHANNEL', '2022-12-24', '2022-12-25', 0, 9, 100, 100, 1),
(19, 'Risk-free booking! Cancel 10 days before check-in date and you will not be charged', 3, 'ONLINECHANNEL', '2022-12-24', '2022-12-25', 10, 365, 0, 0, 1),
(20, 'any cancellation received within 7 days prior to arrival date will be charged for the entire stay.\r\nFailure to arrive at your hotel or property will be considered a no-show and will incur a charge of 100% of the booking value', 3, 'ONLINECHANNEL', '2022-12-26', '2022-12-31', 0, 6, 100, 100, 1),
(21, 'Risk-free booking! Cancel 7 days before check-in date and you will not be charged', 3, 'ONLINECHANNEL', '2022-12-26', '2022-12-31', 7, 365, 0, 0, 1),
(22, 'Failure to arrive at your hotel or property will be considered a no-show and will incur a charge of 100% of the booking value', 4, 'ONLINECHANNEL', '2022-10-01', '2022-12-23', 0, 2, 100, 100, 1),
(23, 'any cancellation received betwen 3 days to 7 days prior to arrival date will be charged for 50% the entire stay.', 4, 'ONLINECHANNEL', '2022-10-01', '2022-12-23', 3, 6, 50, 50, 1),
(24, 'Risk-free booking! Cancel 7 days before check-in date and you will not be charged', 4, 'ONLINECHANNEL', '2022-10-01', '2022-12-23', 7, 365, 0, 0, 1),
(25, 'any cancellation received within 7 days prior to arrival date will be charged for the entire stay.\r\nFailure to arrive at your hotel or property will be considered a no-show and will incur a charge of 100% of the booking value', 4, 'ONLINECHANNEL', '2022-12-24', '2022-12-25', 0, 9, 100, 100, 1),
(26, 'Risk-free booking! Cancel 10 days before check-in date and you will not be charged', 4, 'ONLINECHANNEL', '2022-12-24', '2022-12-25', 10, 365, 0, 0, 1),
(27, 'any cancellation received within 7 days prior to arrival date will be charged for the entire stay.\r\nFailure to arrive at your hotel or property will be considered a no-show and will incur a charge of 100% of the booking value', 4, 'ONLINECHANNEL', '2022-12-26', '2022-12-31', 0, 6, 100, 100, 1),
(28, 'Risk-free booking! Cancel 7 days before check-in date and you will not be charged', 4, 'ONLINECHANNEL', '2022-12-26', '2022-12-31', 7, 365, 0, 0, 1),
(29, 'Failure to arrive at your hotel or property will be considered a no-show and will incur a charge of 100% of the booking value', 5, 'ONLINECHANNEL', '2022-10-01', '2022-12-23', 0, 2, 100, 100, 1),
(30, 'any cancellation received betwen 3 days to 7 days prior to arrival date will be charged for 50% the entire stay.', 5, 'ONLINECHANNEL', '2022-10-01', '2022-12-23', 3, 6, 50, 50, 1),
(31, 'Risk-free booking! Cancel 7 days before check-in date and you will not be charged', 5, 'ONLINECHANNEL', '2022-10-01', '2022-12-23', 7, 365, 0, 0, 1),
(32, 'any cancellation received within 7 days prior to arrival date will be charged for the entire stay.\r\nFailure to arrive at your hotel or property will be considered a no-show and will incur a charge of 100% of the booking value', 5, 'ONLINECHANNEL', '2022-12-24', '2022-12-25', 0, 9, 100, 100, 1),
(33, 'Risk-free booking! Cancel 10 days before check-in date and you will not be charged', 5, 'ONLINECHANNEL', '2022-12-24', '2022-12-25', 10, 365, 0, 0, 1),
(34, 'any cancellation received within 7 days prior to arrival date will be charged for the entire stay.\r\nFailure to arrive at your hotel or property will be considered a no-show and will incur a charge of 100% of the booking value', 5, 'ONLINECHANNEL', '2022-12-26', '2022-12-31', 0, 6, 100, 100, 1),
(35, 'Risk-free booking! Cancel 7 days before check-in date and you will not be charged', 5, 'ONLINECHANNEL', '2022-12-26', '2022-12-31', 7, 365, 0, 0, 1),
(36, 'Failure to arrive at your hotel or property will be considered a no-show and will incur a charge of 100% of the booking value', 6, 'ONLINECHANNEL', '2022-10-01', '2022-12-23', 0, 2, 100, 100, 1),
(37, 'Risk-free booking! Cancel 7 days before check-in date and you will not be charged', 6, 'ONLINECHANNEL', '2022-10-01', '2022-12-23', 7, 365, 0, 0, 1),
(38, 'any cancellation received within 7 days prior to arrival date will be charged for the entire stay.\r\nFailure to arrive at your hotel or property will be considered a no-show and will incur a charge of 100% of the booking value', 6, 'ONLINECHANNEL', '2022-12-24', '2022-12-25', 0, 9, 100, 100, 1),
(39, 'Risk-free booking! Cancel 10 days before check-in date and you will not be charged', 6, 'ONLINECHANNEL', '2022-12-24', '2022-12-25', 10, 365, 0, 0, 1),
(40, 'any cancellation received within 7 days prior to arrival date will be charged for the entire stay.\r\nFailure to arrive at your hotel or property will be considered a no-show and will incur a charge of 100% of the booking value', 6, 'ONLINECHANNEL', '2022-12-26', '2022-12-31', 0, 6, 100, 100, 1),
(41, 'Risk-free booking! Cancel 7 days before check-in date and you will not be charged', 6, 'ONLINECHANNEL', '2022-12-26', '2022-12-31', 7, 365, 0, 0, 1),
(42, 'Failure to arrive at your hotel or property will be considered a no-show and will incur a charge of 100% of the booking value', 7, 'ONLINECHANNEL', '2022-10-01', '2022-12-23', 0, 2, 100, 100, 1),
(43, 'Risk-free booking! Cancel 7 days before check-in date and you will not be charged', 7, 'ONLINECHANNEL', '2022-10-01', '2022-12-23', 7, 365, 0, 0, 1),
(44, 'any cancellation received within 7 days prior to arrival date will be charged for the entire stay.\r\nFailure to arrive at your hotel or property will be considered a no-show and will incur a charge of 100% of the booking value', 7, 'ONLINECHANNEL', '2022-12-24', '2022-12-25', 0, 9, 100, 100, 1),
(45, 'Risk-free booking! Cancel 10 days before check-in date and you will not be charged', 7, 'ONLINECHANNEL', '2022-12-24', '2022-12-25', 10, 365, 0, 0, 1),
(46, 'any cancellation received within 7 days prior to arrival date will be charged for the entire stay.\r\nFailure to arrive at your hotel or property will be considered a no-show and will incur a charge of 100% of the booking value', 7, 'ONLINECHANNEL', '2022-12-26', '2022-12-31', 0, 6, 100, 100, 1),
(47, 'Risk-free booking! Cancel 7 days before check-in date and you will not be charged', 7, 'ONLINECHANNEL', '2022-12-26', '2022-12-31', 7, 365, 0, 0, 1),
(48, 'any cancellation received within 10 days prior to arrival date will be charged for the entire stay.\r\nFailure to arrive at your hotel or property will be considered a no-show and will incur a charge of 100% of the booking value', 1, 'AGENTCHANNEL', '2022-10-01', '2022-12-23', 0, 9, 100, 100, 1),
(49, 'Cancel between 10 days and  before 15 days before check-in date and you will be a charge of 50% of the booking value', 1, 'AGENTCHANNEL', '2022-10-01', '2022-12-23', 10, 14, 50, 50, 1),
(50, 'Cancel or exchange 15 days before check-in date and you will not be charged', 1, 'AGENTCHANNEL', '2022-10-01', '2022-12-23', 15, 365, 0, 0, 1),
(51, 'any cancellation received within 15 days prior to arrival date will be charged for the entire stay.\r\nFailure to arrive at your hotel or property will be considered a no-show and will incur a charge of 100% of the booking value', 1, 'AGENTCHANNEL', '2022-12-24', '2022-12-25', 0, 6, 100, 100, 1),
(52, 'Cancel or exchange 15 days before check-in date and you will not be charged', 1, 'AGENTCHANNEL', '2022-12-24', '2022-12-25', 15, 365, 0, 0, 1),
(53, 'any cancellation received within 10 days prior to arrival date will be charged for the entire stay.\r\nFailure to arrive at your hotel or property will be considered a no-show and will incur a charge of 100% of the booking value', 1, 'AGENTCHANNEL', '2022-12-26', '2022-12-31', 0, 9, 100, 100, 1),
(54, 'Cancel between 10 days and  before 15 days before check-in date and you will be a charge of 50% of the booking value', 1, 'AGENTCHANNEL', '2022-12-26', '2022-12-31', 10, 14, 50, 50, 1),
(55, 'Cancel or exchange 15 days before check-in date and you will not be charged', 1, 'AGENTCHANNEL', '2022-12-26', '2022-12-31', 15, 365, 0, 0, 1),
(56, 'any cancellation received within 10 days prior to arrival date will be charged for the entire stay.\r\nFailure to arrive at your hotel or property will be considered a no-show and will incur a charge of 100% of the booking value', 2, 'AGENTCHANNEL', '2022-10-01', '2022-12-23', 0, 9, 100, 100, 1),
(57, 'Cancel between 10 days and  before 15 days before check-in date and you will be a charge of 50% of the booking value', 2, 'AGENTCHANNEL', '2022-10-01', '2022-12-23', 10, 14, 50, 50, 1),
(58, 'Cancel or exchange 15 days before check-in date and you will not be charged', 2, 'AGENTCHANNEL', '2022-10-01', '2022-12-23', 15, 365, 0, 0, 1),
(59, 'any cancellation received within 15 days prior to arrival date will be charged for the entire stay.\r\nFailure to arrive at your hotel or property will be considered a no-show and will incur a charge of 100% of the booking value', 2, 'AGENTCHANNEL', '2022-12-24', '2022-12-25', 0, 6, 100, 100, 1),
(60, 'Cancel or exchange 15 days before check-in date and you will not be charged', 2, 'AGENTCHANNEL', '2022-12-24', '2022-12-25', 15, 365, 0, 0, 1),
(61, 'any cancellation received within 10 days prior to arrival date will be charged for the entire stay.\r\nFailure to arrive at your hotel or property will be considered a no-show and will incur a charge of 100% of the booking value', 2, 'AGENTCHANNEL', '2022-12-26', '2022-12-31', 0, 9, 100, 100, 1),
(62, 'Cancel between 10 days and  before 15 days before check-in date and you will be a charge of 50% of the booking value', 2, 'AGENTCHANNEL', '2022-12-26', '2022-12-31', 10, 14, 50, 50, 1),
(63, 'Cancel or exchange 15 days before check-in date and you will not be charged', 2, 'AGENTCHANNEL', '2022-12-26', '2022-12-31', 15, 365, 0, 0, 1),
(64, 'any cancellation received within 10 days prior to arrival date will be charged for the entire stay.\r\nFailure to arrive at your hotel or property will be considered a no-show and will incur a charge of 100% of the booking value', 3, 'AGENTCHANNEL', '2022-10-01', '2022-12-23', 0, 9, 100, 100, 1),
(65, 'Cancel between 10 days and  before 15 days before check-in date and you will be a charge of 50% of the booking value', 3, 'AGENTCHANNEL', '2022-10-01', '2022-12-23', 10, 14, 50, 50, 1),
(66, 'Cancel or exchange 15 days before check-in date and you will not be charged', 3, 'AGENTCHANNEL', '2022-10-01', '2022-12-23', 15, 365, 0, 0, 1),
(67, 'any cancellation received within 15 days prior to arrival date will be charged for the entire stay.\r\nFailure to arrive at your hotel or property will be considered a no-show and will incur a charge of 100% of the booking value', 3, 'AGENTCHANNEL', '2022-12-24', '2022-12-25', 0, 6, 100, 100, 1),
(68, 'Cancel or exchange 15 days before check-in date and you will not be charged', 3, 'AGENTCHANNEL', '2022-12-24', '2022-12-25', 15, 365, 0, 0, 1),
(69, 'any cancellation received within 10 days prior to arrival date will be charged for the entire stay.\r\nFailure to arrive at your hotel or property will be considered a no-show and will incur a charge of 100% of the booking value', 3, 'AGENTCHANNEL', '2022-12-26', '2022-12-31', 0, 9, 100, 100, 1),
(70, 'Cancel between 10 days and  before 15 days before check-in date and you will be a charge of 50% of the booking value', 3, 'AGENTCHANNEL', '2022-12-26', '2022-12-31', 10, 14, 50, 50, 1),
(71, 'Cancel or exchange 15 days before check-in date and you will not be charged', 3, 'AGENTCHANNEL', '2022-12-26', '2022-12-31', 15, 365, 0, 0, 1),
(72, 'any cancellation received within 10 days prior to arrival date will be charged for the entire stay.\r\nFailure to arrive at your hotel or property will be considered a no-show and will incur a charge of 100% of the booking value', 4, 'AGENTCHANNEL', '2022-10-01', '2022-12-23', 0, 9, 100, 100, 1),
(73, 'Cancel between 10 days and  before 15 days before check-in date and you will be a charge of 50% of the booking value', 4, 'AGENTCHANNEL', '2022-10-01', '2022-12-23', 10, 14, 50, 50, 1),
(74, 'Cancel or exchange 15 days before check-in date and you will not be charged', 4, 'AGENTCHANNEL', '2022-10-01', '2022-12-23', 15, 365, 0, 0, 1),
(75, 'any cancellation received within 15 days prior to arrival date will be charged for the entire stay.\r\nFailure to arrive at your hotel or property will be considered a no-show and will incur a charge of 100% of the booking value', 4, 'AGENTCHANNEL', '2022-12-24', '2022-12-25', 0, 6, 100, 100, 1),
(76, 'Cancel or exchange 15 days before check-in date and you will not be charged', 4, 'AGENTCHANNEL', '2022-12-24', '2022-12-25', 15, 365, 0, 0, 1),
(77, 'any cancellation received within 10 days prior to arrival date will be charged for the entire stay.\r\nFailure to arrive at your hotel or property will be considered a no-show and will incur a charge of 100% of the booking value', 4, 'AGENTCHANNEL', '2022-12-26', '2022-12-31', 0, 9, 100, 100, 1),
(78, 'Cancel between 10 days and  before 15 days before check-in date and you will be a charge of 50% of the booking value', 4, 'AGENTCHANNEL', '2022-12-26', '2022-12-31', 10, 14, 50, 50, 1),
(79, 'Cancel or exchange 15 days before check-in date and you will not be charged', 4, 'AGENTCHANNEL', '2022-12-26', '2022-12-31', 15, 365, 0, 0, 1),
(80, 'any cancellation received within 10 days prior to arrival date will be charged for the entire stay.\r\nFailure to arrive at your hotel or property will be considered a no-show and will incur a charge of 100% of the booking value', 5, 'AGENTCHANNEL', '2022-10-01', '2022-12-23', 0, 9, 100, 100, 1),
(81, 'Cancel between 10 days and  before 15 days before check-in date and you will be a charge of 50% of the booking value', 5, 'AGENTCHANNEL', '2022-10-01', '2022-12-23', 10, 14, 50, 50, 1),
(82, 'Cancel or exchange 15 days before check-in date and you will not be charged', 5, 'AGENTCHANNEL', '2022-10-01', '2022-12-23', 15, 365, 0, 0, 1),
(83, 'any cancellation received within 15 days prior to arrival date will be charged for the entire stay.\r\nFailure to arrive at your hotel or property will be considered a no-show and will incur a charge of 100% of the booking value', 5, 'AGENTCHANNEL', '2022-12-24', '2022-12-25', 0, 6, 100, 100, 1),
(84, 'Cancel or exchange 15 days before check-in date and you will not be charged', 5, 'AGENTCHANNEL', '2022-12-24', '2022-12-25', 15, 365, 0, 0, 1),
(85, 'any cancellation received within 10 days prior to arrival date will be charged for the entire stay.\r\nFailure to arrive at your hotel or property will be considered a no-show and will incur a charge of 100% of the booking value', 5, 'AGENTCHANNEL', '2022-12-26', '2022-12-31', 0, 9, 100, 100, 1),
(86, 'Cancel between 10 days and  before 15 days before check-in date and you will be a charge of 50% of the booking value', 5, 'AGENTCHANNEL', '2022-12-26', '2022-12-31', 10, 14, 50, 50, 1),
(87, 'Cancel or exchange 15 days before check-in date and you will not be charged', 5, 'AGENTCHANNEL', '2022-12-26', '2022-12-31', 15, 365, 0, 0, 1),
(88, 'any cancellation received within 10 days prior to arrival date will be charged for the entire stay.\r\nFailure to arrive at your hotel or property will be considered a no-show and will incur a charge of 100% of the booking value', 6, 'AGENTCHANNEL', '2022-10-01', '2022-12-23', 0, 9, 100, 100, 1),
(89, 'Cancel between 10 days and  before 15 days before check-in date and you will be a charge of 50% of the booking value', 6, 'AGENTCHANNEL', '2022-10-01', '2022-12-23', 10, 14, 50, 50, 1),
(90, 'Cancel or exchange 15 days before check-in date and you will not be charged', 6, 'AGENTCHANNEL', '2022-10-01', '2022-12-23', 15, 365, 0, 0, 1),
(91, 'any cancellation received within 15 days prior to arrival date will be charged for the entire stay.\r\nFailure to arrive at your hotel or property will be considered a no-show and will incur a charge of 100% of the booking value', 6, 'AGENTCHANNEL', '2022-12-24', '2022-12-25', 0, 6, 100, 100, 1),
(92, 'Cancel or exchange 15 days before check-in date and you will not be charged', 6, 'AGENTCHANNEL', '2022-12-24', '2022-12-25', 15, 365, 0, 0, 1),
(93, 'any cancellation received within 10 days prior to arrival date will be charged for the entire stay.\r\nFailure to arrive at your hotel or property will be considered a no-show and will incur a charge of 100% of the booking value', 6, 'AGENTCHANNEL', '2022-12-26', '2022-12-31', 0, 9, 100, 100, 1),
(94, 'Cancel between 10 days and  before 15 days before check-in date and you will be a charge of 50% of the booking value', 6, 'AGENTCHANNEL', '2022-12-26', '2022-12-31', 10, 14, 50, 50, 1),
(95, 'Cancel or exchange 15 days before check-in date and you will not be charged', 6, 'AGENTCHANNEL', '2022-12-26', '2022-12-31', 15, 365, 0, 0, 1),
(96, 'any cancellation received within 10 days prior to arrival date will be charged for the entire stay.\r\nFailure to arrive at your hotel or property will be considered a no-show and will incur a charge of 100% of the booking value', 7, 'AGENTCHANNEL', '2022-10-01', '2022-12-23', 0, 9, 100, 100, 1),
(97, 'Cancel between 10 days and  before 15 days before check-in date and you will be a charge of 50% of the booking value', 7, 'AGENTCHANNEL', '2022-10-01', '2022-12-23', 10, 14, 50, 50, 1),
(98, 'Cancel or exchange 15 days before check-in date and you will not be charged', 7, 'AGENTCHANNEL', '2022-10-01', '2022-12-23', 15, 365, 0, 0, 1),
(99, 'any cancellation received within 15 days prior to arrival date will be charged for the entire stay.\r\nFailure to arrive at your hotel or property will be considered a no-show and will incur a charge of 100% of the booking value', 7, 'AGENTCHANNEL', '2022-12-24', '2022-12-25', 0, 6, 100, 100, 1),
(100, 'Cancel or exchange 15 days before check-in date and you will not be charged', 7, 'AGENTCHANNEL', '2022-12-24', '2022-12-25', 15, 365, 0, 0, 1),
(101, 'any cancellation received within 10 days prior to arrival date will be charged for the entire stay.\r\nFailure to arrive at your hotel or property will be considered a no-show and will incur a charge of 100% of the booking value', 7, 'AGENTCHANNEL', '2022-12-26', '2022-12-31', 0, 9, 100, 100, 1),
(102, 'Cancel between 10 days and  before 15 days before check-in date and you will be a charge of 50% of the booking value', 7, 'AGENTCHANNEL', '2022-12-26', '2022-12-31', 10, 14, 50, 50, 1),
(103, 'Cancel or exchange 15 days before check-in date and you will not be charged', 7, 'AGENTCHANNEL', '2022-12-26', '2022-12-31', 15, 365, 0, 0, 1),
(104, 'Cancel 5 days before check-in date and you will not be charged', 1, 'DIRECTCHANNEL', '2022-10-01', '2022-12-23', 5, 365, 0, 0, 1),
(105, 'Any cancellation received within 5 days prior to arrival date will be charged for the entire stay.\r\nFailure to arrive at your hotel or property will be considered a no-show and will incur a charge of 100% of the booking value', 1, 'DIRECTCHANNEL', '2022-10-01', '2022-12-23', 0, 4, 100, 100, 1),
(106, 'Cancel 5 days before check-in date and you will not be charged', 1, 'DIRECTCHANNEL', '2022-12-24', '2022-12-25', 5, 365, 0, 0, 1),
(107, 'Any cancellation received within 5 days prior to arrival date will be charged for the entire stay.\r\nFailure to arrive at your hotel or property will be considered a no-show and will incur a charge of 100% of the booking value', 1, 'DIRECTCHANNEL', '2022-12-24', '2022-12-25', 0, 4, 100, 100, 1),
(108, 'Cancel 5 days before check-in date and you will not be charged', 1, 'DIRECTCHANNEL', '2022-12-26', '2022-12-31', 5, 365, 0, 0, 1),
(109, 'Any cancellation received within 5 days prior to arrival date will be charged for the entire stay.\r\nFailure to arrive at your hotel or property will be considered a no-show and will incur a charge of 100% of the booking value', 1, 'DIRECTCHANNEL', '2022-12-26', '2022-12-31', 0, 4, 100, 100, 1),
(110, 'Cancel 5 days before check-in date and you will not be charged', 2, 'DIRECTCHANNEL', '2022-10-01', '2022-12-23', 5, 365, 0, 0, 1),
(111, 'Any cancellation received within 5 days prior to arrival date will be charged for the entire stay.\r\nFailure to arrive at your hotel or property will be considered a no-show and will incur a charge of 100% of the booking value', 2, 'DIRECTCHANNEL', '2022-10-01', '2022-12-23', 0, 4, 100, 100, 1),
(112, 'Cancel 5 days before check-in date and you will not be charged', 2, 'DIRECTCHANNEL', '2022-12-24', '2022-12-25', 5, 365, 0, 0, 1),
(113, 'Any cancellation received within 5 days prior to arrival date will be charged for the entire stay.\r\nFailure to arrive at your hotel or property will be considered a no-show and will incur a charge of 100% of the booking value', 2, 'DIRECTCHANNEL', '2022-12-24', '2022-12-25', 0, 4, 100, 100, 1),
(114, 'Cancel 5 days before check-in date and you will not be charged', 2, 'DIRECTCHANNEL', '2022-12-26', '2022-12-31', 5, 365, 0, 0, 1),
(115, 'Any cancellation received within 5 days prior to arrival date will be charged for the entire stay.\r\nFailure to arrive at your hotel or property will be considered a no-show and will incur a charge of 100% of the booking value', 2, 'DIRECTCHANNEL', '2022-12-26', '2022-12-31', 0, 4, 100, 100, 1),
(116, 'Cancel 5 days before check-in date and you will not be charged', 3, 'DIRECTCHANNEL', '2022-10-01', '2022-12-23', 5, 365, 0, 0, 1),
(117, 'Any cancellation received within 5 days prior to arrival date will be charged for the entire stay.\r\nFailure to arrive at your hotel or property will be considered a no-show and will incur a charge of 100% of the booking value', 3, 'DIRECTCHANNEL', '2022-10-01', '2022-12-23', 0, 4, 100, 100, 1),
(118, 'Cancel 5 days before check-in date and you will not be charged', 3, 'DIRECTCHANNEL', '2022-12-24', '2022-12-25', 5, 365, 0, 0, 1),
(119, 'Any cancellation received within 5 days prior to arrival date will be charged for the entire stay.\r\nFailure to arrive at your hotel or property will be considered a no-show and will incur a charge of 100% of the booking value', 3, 'DIRECTCHANNEL', '2022-12-24', '2022-12-25', 0, 4, 100, 100, 1),
(120, 'Cancel 5 days before check-in date and you will not be charged', 3, 'DIRECTCHANNEL', '2022-12-26', '2022-12-31', 5, 365, 0, 0, 1),
(121, 'Any cancellation received within 5 days prior to arrival date will be charged for the entire stay.\r\nFailure to arrive at your hotel or property will be considered a no-show and will incur a charge of 100% of the booking value', 3, 'DIRECTCHANNEL', '2022-12-26', '2022-12-31', 0, 4, 100, 100, 1),
(122, 'Cancel 5 days before check-in date and you will not be charged', 4, 'DIRECTCHANNEL', '2022-10-01', '2022-12-23', 5, 365, 0, 0, 1),
(123, 'Any cancellation received within 5 days prior to arrival date will be charged for the entire stay.\r\nFailure to arrive at your hotel or property will be considered a no-show and will incur a charge of 100% of the booking value', 4, 'DIRECTCHANNEL', '2022-10-01', '2022-12-23', 0, 4, 100, 100, 1),
(124, 'Cancel 5 days before check-in date and you will not be charged', 4, 'DIRECTCHANNEL', '2022-12-24', '2022-12-25', 5, 365, 0, 0, 1),
(125, 'Any cancellation received within 5 days prior to arrival date will be charged for the entire stay.\r\nFailure to arrive at your hotel or property will be considered a no-show and will incur a charge of 100% of the booking value', 4, 'DIRECTCHANNEL', '2022-12-24', '2022-12-25', 0, 4, 100, 100, 1),
(126, 'Cancel 5 days before check-in date and you will not be charged', 4, 'DIRECTCHANNEL', '2022-12-26', '2022-12-31', 5, 365, 0, 0, 1),
(127, 'Any cancellation received within 5 days prior to arrival date will be charged for the entire stay.\r\nFailure to arrive at your hotel or property will be considered a no-show and will incur a charge of 100% of the booking value', 4, 'DIRECTCHANNEL', '2022-12-26', '2022-12-31', 0, 4, 100, 100, 1),
(128, 'Cancel 5 days before check-in date and you will not be charged', 5, 'DIRECTCHANNEL', '2022-10-01', '2022-12-23', 5, 365, 0, 0, 1),
(129, 'Any cancellation received within 5 days prior to arrival date will be charged for the entire stay.\r\nFailure to arrive at your hotel or property will be considered a no-show and will incur a charge of 100% of the booking value', 5, 'DIRECTCHANNEL', '2022-10-01', '2022-12-23', 0, 4, 100, 100, 1),
(130, 'Cancel 5 days before check-in date and you will not be charged', 5, 'DIRECTCHANNEL', '2022-12-24', '2022-12-25', 5, 365, 0, 0, 1),
(131, 'Any cancellation received within 5 days prior to arrival date will be charged for the entire stay.\r\nFailure to arrive at your hotel or property will be considered a no-show and will incur a charge of 100% of the booking value', 5, 'DIRECTCHANNEL', '2022-12-24', '2022-12-25', 0, 4, 100, 100, 1),
(132, 'Cancel 5 days before check-in date and you will not be charged', 5, 'DIRECTCHANNEL', '2022-12-26', '2022-12-31', 5, 365, 0, 0, 1),
(133, 'Any cancellation received within 5 days prior to arrival date will be charged for the entire stay.\r\nFailure to arrive at your hotel or property will be considered a no-show and will incur a charge of 100% of the booking value', 5, 'DIRECTCHANNEL', '2022-12-26', '2022-12-31', 0, 4, 100, 100, 1),
(134, 'Cancel 5 days before check-in date and you will not be charged', 6, 'DIRECTCHANNEL', '2022-10-01', '2022-12-23', 5, 365, 0, 0, 1),
(135, 'Any cancellation received within 5 days prior to arrival date will be charged for the entire stay.\r\nFailure to arrive at your hotel or property will be considered a no-show and will incur a charge of 100% of the booking value', 6, 'DIRECTCHANNEL', '2022-10-01', '2022-12-23', 0, 4, 100, 100, 1),
(136, 'Cancel 5 days before check-in date and you will not be charged', 6, 'DIRECTCHANNEL', '2022-12-24', '2022-12-25', 5, 365, 0, 0, 1),
(137, 'Any cancellation received within 5 days prior to arrival date will be charged for the entire stay.\r\nFailure to arrive at your hotel or property will be considered a no-show and will incur a charge of 100% of the booking value', 6, 'DIRECTCHANNEL', '2022-12-24', '2022-12-25', 0, 4, 100, 100, 1),
(138, 'Cancel 5 days before check-in date and you will not be charged', 6, 'DIRECTCHANNEL', '2022-12-26', '2022-12-31', 5, 365, 0, 0, 1),
(139, 'Any cancellation received within 5 days prior to arrival date will be charged for the entire stay.\r\nFailure to arrive at your hotel or property will be considered a no-show and will incur a charge of 100% of the booking value', 6, 'DIRECTCHANNEL', '2022-12-26', '2022-12-31', 0, 4, 100, 100, 1),
(140, 'Cancel 5 days before check-in date and you will not be charged', 7, 'DIRECTCHANNEL', '2022-10-01', '2022-12-23', 5, 365, 0, 0, 1),
(141, 'Any cancellation received within 5 days prior to arrival date will be charged for the entire stay.\r\nFailure to arrive at your hotel or property will be considered a no-show and will incur a charge of 100% of the booking value', 7, 'DIRECTCHANNEL', '2022-10-01', '2022-12-23', 0, 4, 100, 100, 1),
(142, 'Cancel 5 days before check-in date and you will not be charged', 7, 'DIRECTCHANNEL', '2022-12-24', '2022-12-25', 5, 365, 0, 0, 1),
(143, 'Any cancellation received within 5 days prior to arrival date will be charged for the entire stay.\r\nFailure to arrive at your hotel or property will be considered a no-show and will incur a charge of 100% of the booking value', 7, 'DIRECTCHANNEL', '2022-12-24', '2022-12-25', 0, 4, 100, 100, 1),
(144, 'Cancel 5 days before check-in date and you will not be charged', 7, 'DIRECTCHANNEL', '2022-12-26', '2022-12-31', 5, 365, 0, 0, 1),
(145, 'Any cancellation received within 5 days prior to arrival date will be charged for the entire stay.\r\nFailure to arrive at your hotel or property will be considered a no-show and will incur a charge of 100% of the booking value', 7, 'DIRECTCHANNEL', '2022-12-26', '2022-12-31', 0, 4, 100, 100, 1),
(146, 'fghhbfghfdghfdghfg', 2, 'ONLINECHANNEL', '2023-01-01', '2023-01-20', 0, 6, 100, 6, 0),
(147, 'gdrgregrfgdrgre', 2, 'ONLINECHANNEL', '2023-01-01', '2023-01-20', 7, 15, 50, 15, 0),
(148, 'hdfhbfdxrhg', 2, 'ONLINECHANNEL', '2023-01-01', '2023-01-20', 16, 365, 0, 365, 0);

-- --------------------------------------------------------

--
-- Table structure for table `province`
--

CREATE TABLE `province` (
  `provinceid` int(11) NOT NULL,
  `provincename` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `province`
--

INSERT INTO `province` (`provinceid`, `provincename`) VALUES
(1, 'HO CHI MINH'),
(2, 'HA NOI'),
(3, 'DA NANG'),
(4, 'KHANH HOA'),
(5, 'KIEN GIANG'),
(6, 'BINH THUAN');

-- --------------------------------------------------------

--
-- Table structure for table `reservation`
--

CREATE TABLE `reservation` (
  `reservationid` int(11) NOT NULL,
  `reservationidcode` varchar(200) DEFAULT NULL,
  `contractid` int(11) DEFAULT NULL,
  `checkin` date NOT NULL,
  `checkout` date NOT NULL,
  `guestid` int(11) DEFAULT NULL,
  `roomstypeid` int(11) NOT NULL,
  `totalrooms` int(11) NOT NULL,
  `customername` varchar(50) NOT NULL,
  `customerphone` varchar(50) NOT NULL,
  `customeremail` varchar(50) NOT NULL,
  `payment1` double DEFAULT NULL,
  `paymentdat1` date DEFAULT NULL,
  `payment2` double DEFAULT NULL,
  `paymentdat2` date DEFAULT NULL,
  `refundamount` double DEFAULT NULL,
  `refunddate` date DEFAULT NULL,
  `reservationstt` int(11) NOT NULL,
  `rating` decimal(2,1) DEFAULT NULL,
  `customercomment` varchar(250) DEFAULT NULL,
  `replyfromhotel` varchar(250) DEFAULT NULL,
  `chargefee` double DEFAULT NULL,
  `netprice` double NOT NULL,
  `price` double NOT NULL,
  `servicefee` double DEFAULT NULL,
  `createday` date NOT NULL,
  `paymentchannel1` varchar(50) DEFAULT NULL,
  `paymentsnote1` varchar(250) DEFAULT NULL,
  `paymentchannel2` varchar(50) DEFAULT NULL,
  `paymentsnote2` varchar(50) DEFAULT NULL,
  `createby` int(11) NOT NULL,
  `deadline` datetime NOT NULL,
  `related` int(11) DEFAULT NULL,
  `note` varchar(100) DEFAULT NULL,
  `bookingchannels` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `reservation`
--

INSERT INTO `reservation` (`reservationid`, `reservationidcode`, `contractid`, `checkin`, `checkout`, `guestid`, `roomstypeid`, `totalrooms`, `customername`, `customerphone`, `customeremail`, `payment1`, `paymentdat1`, `payment2`, `paymentdat2`, `refundamount`, `refunddate`, `reservationstt`, `rating`, `customercomment`, `replyfromhotel`, `chargefee`, `netprice`, `price`, `servicefee`, `createday`, `paymentchannel1`, `paymentsnote1`, `paymentchannel2`, `paymentsnote2`, `createby`, `deadline`, `related`, `note`, `bookingchannels`) VALUES
(1, NULL, 6, '2022-12-22', '2022-12-24', NULL, 1, 3, 'Phan Huu tri', '0904859325', 'dongthithanhxuan.hn@gmail.com', 1740, '2022-12-19', NULL, NULL, NULL, NULL, 2, NULL, NULL, NULL, NULL, 290, 1740, NULL, '2022-12-19', 'CASH', '', NULL, NULL, 0, '2022-12-19 18:00:00', NULL, '', 'AGENTCHANNEL'),
(2, NULL, NULL, '2022-12-19', '2022-12-20', NULL, 2, 7, 'Le Hoang Minh Duong', '3264845135', 'tommyle@gmail.com', 2380, '2022-12-19', NULL, NULL, NULL, NULL, 4, NULL, NULL, NULL, NULL, 340, 2380, NULL, '2022-12-19', 'CASH', '', NULL, NULL, 0, '2022-12-19 13:24:30', NULL, '', 'DIRECTCHANNEL'),
(3, NULL, NULL, '2022-12-23', '2022-12-24', NULL, 1, 5, 'Le Hoang Minh duong', '434343243432', 'tommyle@gmail.com', 1840, '2022-12-19', NULL, NULL, NULL, NULL, 2, NULL, NULL, NULL, NULL, 368, 1840, NULL, '2022-12-19', 'CASH', '', NULL, NULL, 0, '2022-12-19 18:00:00', NULL, '', 'DIRECTCHANNEL');

-- --------------------------------------------------------

--
-- Table structure for table `reservationaddonservice`
--

CREATE TABLE `reservationaddonservice` (
  `reservationaddonserviceid` int(11) NOT NULL,
  `createday` date NOT NULL,
  `reservationroomdetailsid` int(11) NOT NULL,
  `addonserviceid` int(11) NOT NULL,
  `price` double NOT NULL,
  `quantity` int(11) NOT NULL,
  `amount` double NOT NULL,
  `paymentdate` date DEFAULT NULL,
  `paymentchannel` varchar(20) DEFAULT NULL,
  `latecheckoutid` int(11) DEFAULT NULL,
  `paymentstt` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `reservationaddonservice`
--

INSERT INTO `reservationaddonservice` (`reservationaddonserviceid`, `createday`, `reservationroomdetailsid`, `addonserviceid`, `price`, `quantity`, `amount`, `paymentdate`, `paymentchannel`, `latecheckoutid`, `paymentstt`) VALUES
(1, '2022-12-19', 567, 197, 5, 1, 5, NULL, NULL, 0, 0),
(2, '2022-12-19', 567, 2, 14, 1, 14, NULL, NULL, 0, 0),
(3, '2022-12-19', 570, 9, 12, 1, 12, NULL, NULL, 0, 0),
(4, '2022-12-19', 570, 4, 10, 1, 10, '2022-12-19', 'CASH', 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `reservationguestinfo`
--

CREATE TABLE `reservationguestinfo` (
  `reservationguestinfoid` int(11) NOT NULL,
  `reservationroomdetailsid` int(11) NOT NULL,
  `birthday` date DEFAULT NULL,
  `guestname` varchar(50) DEFAULT NULL,
  `guestidcardnumber` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `reservationguestinfo`
--

INSERT INTO `reservationguestinfo` (`reservationguestinfoid`, `reservationroomdetailsid`, `birthday`, `guestname`, `guestidcardnumber`) VALUES
(1, 567, '2022-12-19', 'Nguyen Ngoc Ha', '2432512532'),
(2, 567, '2022-12-19', 'Nguyen Thi Lien', '2432512532'),
(3, 570, '2022-12-19', 'Le Hoang Minh Duong', '369745121'),
(4, 570, '2022-12-19', 'Le Hoang Anh Tuan', '432532535'),
(5, 570, '2022-12-19', 'Dong Thi Thanh Xuan', '15454216546'),
(6, 571, '2022-12-19', 'Ho Minh Thanh Dat', '34234234'),
(7, 571, '2022-12-19', 'Luon Ngoc Khac Nguyen', '2321323'),
(8, 572, '2022-12-19', 'Phan Huu Tri', '242342'),
(9, 572, '2022-12-19', 'Minh Ha', '324324324'),
(10, 573, '2022-12-19', '35432532', '325325325'),
(11, 573, '2022-12-19', '325325', '35325'),
(12, 575, '2022-12-19', 'fdsfdsf', 'fdsfsdf'),
(13, 575, '2022-12-19', 'fdsfdsf', 'fdsfdsf'),
(14, 576, '2022-12-19', 'hjhrhresh', 'rgrer'),
(15, 576, '2022-12-19', 'tertre', 'tertr');

-- --------------------------------------------------------

--
-- Table structure for table `reservationroomdetails`
--

CREATE TABLE `reservationroomdetails` (
  `reservationroomdetailsid` int(11) NOT NULL,
  `reservationid` int(11) NOT NULL,
  `roomid` int(11) NOT NULL,
  `checkintime` datetime DEFAULT NULL,
  `checkouttime` datetime DEFAULT NULL,
  `cusinroom` int(11) NOT NULL,
  `latecheckoutid` int(11) DEFAULT NULL,
  `reservationroomtypestt` int(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `reservationroomdetails`
--

INSERT INTO `reservationroomdetails` (`reservationroomdetailsid`, `reservationid`, `roomid`, `checkintime`, `checkouttime`, `cusinroom`, `latecheckoutid`, `reservationroomtypestt`) VALUES
(564, 1, 1, NULL, NULL, 2, 0, 6),
(565, 1, 2, NULL, NULL, 2, 0, 6),
(566, 1, 3, NULL, NULL, 2, 0, 6),
(567, 1, 1, NULL, NULL, 2, 0, 2),
(568, 1, 2, NULL, NULL, 2, 0, 2),
(569, 1, 3, NULL, NULL, 2, 0, 2),
(570, 2, 16, '2022-12-19 10:37:00', NULL, 3, 0, 4),
(571, 2, 17, '2022-12-19 10:27:46', NULL, 2, 0, 4),
(572, 2, 18, '2022-12-19 10:28:33', NULL, 2, 0, 4),
(573, 2, 19, '2022-12-19 10:29:00', NULL, 2, 0, 4),
(574, 2, 20, '2022-12-19 10:29:19', NULL, 2, 0, 4),
(575, 2, 21, '2022-12-19 10:36:11', NULL, 2, 0, 4),
(576, 2, 22, '2022-12-19 10:36:39', NULL, 2, 0, 4),
(577, 3, 4, NULL, NULL, 2, 0, 2),
(578, 3, 5, NULL, NULL, 2, 0, 2),
(579, 3, 6, NULL, NULL, 2, 0, 2),
(580, 3, 7, NULL, NULL, 2, 0, 2),
(581, 3, 8, NULL, NULL, 2, 0, 2);

-- --------------------------------------------------------

--
-- Table structure for table `rooms`
--

CREATE TABLE `rooms` (
  `roomid` int(11) NOT NULL,
  `roomname` varchar(50) NOT NULL,
  `roomstypeid` int(11) NOT NULL,
  `roomtypecontent` varchar(50) NOT NULL,
  `extrabed` int(1) NOT NULL,
  `hotelroomstatus` int(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `rooms`
--

INSERT INTO `rooms` (`roomid`, `roomname`, `roomstypeid`, `roomtypecontent`, `extrabed`, `hotelroomstatus`) VALUES
(1, '101', 1, 'Twin', 0, 1),
(2, '102', 1, 'Twin', 0, 1),
(3, '103', 1, 'Twin', 0, 1),
(4, '104', 1, 'Twin', 0, 1),
(5, '105', 1, 'Twin', 0, 1),
(6, '106', 1, 'Twin', 0, 1),
(7, '107', 1, 'Twin', 0, 1),
(8, '108', 1, 'Twin', 0, 1),
(9, '109', 1, 'Twin', 0, 1),
(10, '110', 1, 'Twin', 0, 1),
(11, '201', 2, 'Twin', 1, 1),
(12, '202', 2, 'Twin', 1, 1),
(13, '203', 2, 'Twin', 1, 1),
(14, '204', 2, 'Twin', 1, 1),
(15, '205', 2, 'Twin', 1, 1),
(16, '206', 2, 'Double', 1, 1),
(17, '207', 2, 'Double', 1, 1),
(18, '208', 2, 'Double', 1, 1),
(19, '209', 2, 'Double', 1, 1),
(20, '210', 2, 'Double', 1, 1),
(21, '211', 2, 'Double', 1, 1),
(22, '212', 2, 'Double', 1, 1),
(23, '301', 3, 'Twin', 1, 1),
(24, '302', 3, 'Twin', 1, 1),
(25, '303', 3, 'Twin', 1, 1),
(26, '304', 3, 'Double', 1, 1),
(27, '305', 3, 'Double', 1, 1),
(28, '401', 4, 'Twin', 1, 1),
(29, '402', 4, 'Twin', 1, 1),
(30, '403', 4, 'Double', 1, 1),
(31, '404', 4, 'Double', 1, 1),
(32, '405', 4, 'Double', 1, 1),
(33, '501', 5, 'Twin', 1, 1),
(34, '502', 5, 'Twin', 1, 1),
(35, '503', 5, 'Twin', 1, 1),
(36, '504', 5, 'Double', 1, 1),
(37, '505', 5, 'Double', 1, 1),
(38, '601', 6, '1 Twin and 1 Double', 2, 1),
(39, '602', 6, '1 Twin and 1 Double', 2, 1),
(40, '603', 6, '1 Twin and 1 Double', 2, 1),
(41, '604', 6, '1 Twin and 1 Double', 2, 1),
(42, '605', 6, '1 Twin and 1 Double', 2, 1),
(43, '701', 7, 'Double', 1, 1),
(44, '702', 7, 'Double', 1, 1),
(45, '703', 7, 'Double', 1, 1),
(46, '704', 7, 'Double', 1, 1),
(47, '705', 7, 'Double', 1, 1),
(48, '101', 8, 'Twin', 0, 1),
(49, '102', 8, 'Twin', 0, 1),
(50, '103', 8, 'Twin', 0, 1),
(51, '104', 8, 'Twin', 0, 1),
(52, '201', 9, 'Twin', 0, 1),
(53, '202', 9, 'Twin', 0, 1),
(54, '203', 9, 'Twin', 0, 1),
(55, '204', 9, 'Twin', 0, 1),
(56, '205', 9, 'Twin', 0, 1),
(57, '301', 10, 'Twin', 0, 1),
(58, '302', 10, 'Twin', 0, 1),
(59, '303', 10, 'Twin', 0, 1),
(60, '401', 11, 'Villa', 1, 1),
(61, '402', 11, 'Villa', 1, 1),
(62, '403', 11, 'Villa', 1, 1),
(63, '404', 11, 'Villa', 1, 1),
(64, '501', 12, 'Villa', 1, 1),
(65, '502', 12, 'Villa', 1, 1),
(66, '503', 12, 'Villa', 1, 1),
(67, '601', 13, 'Villa', 1, 1),
(68, '602', 13, 'Villa', 1, 1),
(69, '701', 14, 'Duplex', 1, 1),
(70, '702', 14, 'Duplex', 1, 1),
(71, '801', 15, 'Twin', 1, 1),
(72, '802', 15, 'Twin', 1, 1),
(73, '101', 16, 'Bungalows', 0, 1),
(74, '102', 16, 'Bungalows', 0, 1),
(75, '103', 16, 'Bungalows', 0, 1),
(76, '104', 16, 'Bungalows', 0, 1),
(77, '201', 17, 'Double', 0, 1),
(78, '202', 17, 'Double', 0, 1),
(79, '301', 18, 'Double', 0, 1),
(80, '302', 18, 'Double', 0, 1),
(81, '401', 19, 'Double', 0, 1),
(82, '402', 19, 'Double', 0, 1),
(83, '501', 20, 'Double', 0, 1),
(84, '502', 20, 'Double', 0, 1),
(85, '101', 21, 'Queen', 0, 1),
(86, '102', 21, 'Queen', 0, 1),
(87, '103', 21, 'Queen', 0, 1),
(88, '201', 22, 'Queen', 0, 1),
(89, '202', 22, 'Queen', 0, 1),
(90, '301', 23, 'Bungalows', 1, 1),
(91, '302', 23, 'Bungalows', 0, 1),
(92, '401', 24, 'Bungalows', 0, 1),
(93, '402', 24, 'Bungalows', 0, 1),
(94, '501', 25, 'Bungalows', 0, 1),
(95, '502', 25, 'Bungalows', 0, 1),
(96, '601', 26, 'Villa', 0, 1),
(97, '602', 26, 'Villa', 0, 1),
(98, '101', 27, 'Twin', 0, 1),
(99, '102', 27, 'Twin', 0, 1),
(100, '103', 27, 'Twin', 0, 1),
(106, '201', 28, 'Twin', 0, 1),
(107, '202', 28, 'Twin', 0, 1),
(108, '203', 28, 'Twin', 0, 1),
(109, '301', 29, 'Twin', 0, 1),
(110, '302', 29, 'Twin', 0, 1),
(111, '401', 30, 'Residence', 1, 1),
(112, '501', 31, 'Residence', 1, 1),
(113, '601', 32, 'Villa', 1, 1),
(114, '602', 32, 'Villa', 1, 1),
(115, '701', 33, 'Villa', 1, 1),
(116, '702', 33, 'Villa', 1, 1),
(117, '801', 34, 'Villa', 1, 1),
(118, '802', 34, 'Villa', 1, 1),
(119, '101', 35, 'Double', 0, 1),
(120, '102', 35, 'Twin', 0, 1),
(121, '201', 36, 'Double', 0, 1),
(122, '202', 36, 'Twin', 0, 1),
(123, '301', 37, 'Double', 0, 1),
(124, '302', 37, 'Twin', 0, 1),
(125, '401', 38, 'Double', 0, 1),
(126, '402', 38, 'Twin', 0, 1),
(127, '501', 39, 'Double', 0, 1),
(128, '502', 39, 'Twin', 0, 1),
(129, '601', 40, 'Twin', 0, 1),
(130, '602', 40, 'Twin', 0, 1),
(131, '701', 41, 'Twin', 1, 1),
(132, '702', 41, 'Twin', 1, 1),
(133, '801', 42, 'Twin', 0, 1),
(134, '802', 42, 'Twin', 0, 1),
(135, '901', 43, 'Twin', 1, 1),
(136, '902', 43, 'Twin', 1, 1),
(137, '1001', 44, 'Twin', 1, 1),
(138, '1002', 44, 'Twin', 1, 1),
(139, '1101', 45, 'Twin', 0, 1),
(140, '1102', 45, 'Twin', 0, 1),
(141, '1201', 46, 'Villa', 1, 1),
(142, '1202', 46, 'Villa', 1, 1),
(143, '1203', 46, 'Villa', 1, 1),
(144, '101', 47, 'Double', 1, 1),
(145, '102', 47, 'Twin', 1, 1),
(146, '103', 47, 'Twin', 1, 1),
(147, '201', 48, 'Double', 1, 1),
(148, '202', 48, 'Double', 1, 1),
(149, '301', 49, 'Queen', 1, 1),
(150, '302', 49, 'Queen', 1, 1),
(151, '401', 50, 'Twin', 1, 1),
(152, '402', 50, 'Twin', 1, 1),
(153, '101', 51, 'Double', 0, 1),
(154, '102', 51, 'Twin', 0, 1),
(155, '201', 52, 'Double', 0, 1),
(156, '202', 52, 'Twin', 0, 1),
(157, '203', 52, 'Queen', 0, 1),
(158, '301', 53, 'Twin', 0, 1),
(159, '302', 53, 'Twin', 0, 1),
(160, '401', 54, 'Twin', 0, 1),
(161, '402', 54, 'Twin', 0, 1),
(162, '501', 55, 'Twin', 0, 1),
(163, '601', 56, 'Bungalow', 0, 1),
(164, '602', 56, 'Bungalow', 0, 1),
(165, '701', 57, 'Bungalow', 0, 1),
(166, '702', 57, 'Bungalow', 0, 1),
(167, '801', 58, 'Twin', 0, 1),
(168, '802', 58, 'Queen', 0, 1),
(169, '803', 58, 'Twin', 0, 1),
(170, '101', 59, 'Twin', 0, 1),
(171, '102', 59, 'Twin', 0, 1),
(172, '201', 60, 'Twin', 0, 1),
(173, '202', 60, 'Twin', 0, 1),
(174, '203', 60, 'Twin', 0, 1),
(175, '301', 61, 'Villa', 0, 1),
(176, '302', 61, 'Villa', 0, 1),
(177, '401', 62, 'Twin', 0, 1),
(178, '402', 62, 'Twin', 0, 1),
(179, '501', 63, 'Twin', 0, 1),
(180, '502', 63, 'Twin', 0, 1),
(181, '601', 64, 'Twin', 0, 1),
(182, '602', 64, 'Twin', 0, 1),
(183, '701', 65, 'Twin', 0, 1),
(184, '702', 65, 'Twin', 0, 1),
(185, '101', 66, 'Twin', 0, 1),
(186, '102', 66, 'Twin', 0, 1),
(187, '201', 67, 'Twin', 0, 1),
(188, '202', 67, 'Twin', 0, 1),
(189, '203', 67, 'Twin', 0, 1),
(190, '301', 68, 'Twin', 0, 1),
(191, '302', 68, 'Twin', 0, 1),
(192, '401', 69, 'Twin', 0, 1),
(193, '402', 69, 'Twin', 0, 1),
(194, '501', 70, 'Twin', 0, 1),
(195, '502', 70, 'Twin', 0, 1),
(196, '601', 71, 'King + Queen', 0, 1),
(197, '602', 71, 'King + Queen', 0, 1),
(223, '101', 72, 'President', 0, 1),
(224, '102', 72, 'President', 0, 1),
(225, '103', 72, 'President', 0, 1),
(226, '104', 72, 'President', 0, 1),
(227, '105', 72, 'President', 0, 1),
(228, '201', 73, 'Royal', 0, 1),
(229, '202', 73, 'Royal', 0, 1),
(230, '203', 73, 'Royal', 0, 1),
(231, '204', 73, 'Royal', 0, 1),
(232, '205', 73, 'Royal', 0, 1),
(233, '301', 74, 'Junior', 0, 1),
(234, '302', 74, 'Junior', 0, 1),
(235, '303', 74, 'Junior', 0, 1),
(236, '304', 74, 'Junior', 0, 1),
(237, '305', 74, 'Junior', 0, 1),
(238, '401', 75, 'Grand', 0, 1),
(239, '402', 75, 'Grand', 0, 1),
(240, '403', 75, 'Grand', 0, 1),
(241, '404', 75, 'Grand', 0, 1),
(242, '405', 75, 'Grand', 0, 1),
(243, '501', 76, 'Executive', 0, 1),
(244, '502', 76, 'Executive', 0, 1),
(245, '503', 76, 'Executive', 0, 1),
(246, '504', 76, 'Executive', 0, 1),
(247, '505', 76, 'Executive', 0, 1),
(248, '601', 77, 'Deluxe', 0, 1),
(249, '602', 77, 'Deluxe', 0, 1),
(250, '603', 77, 'Deluxe', 0, 1),
(251, '604', 77, 'Deluxe', 0, 1),
(252, '605', 77, 'Deluxe', 0, 1),
(253, '101', 78, 'Premium Deluxe', 0, 1),
(254, '102', 78, 'Premium Deluxe', 0, 1),
(255, '103', 78, 'Premium Deluxe', 0, 1),
(256, '104', 78, 'Premium Deluxe', 0, 1),
(257, '105', 78, 'Premium Deluxe', 0, 1),
(258, '201', 79, 'Deluxe', 1, 1),
(259, '202', 79, 'Deluxe', 1, 1),
(260, '203', 79, 'Deluxe', 1, 1),
(261, '204', 79, 'Deluxe', 1, 1),
(262, '205', 79, 'Deluxe', 1, 1),
(263, '301', 80, 'Executive', 0, 1),
(264, '302', 80, 'Executive', 0, 1),
(265, '303', 80, 'Executive', 0, 1),
(266, '304', 80, 'Executive', 0, 1),
(267, '305', 80, 'Executive', 0, 1),
(268, '401', 81, 'Junior', 0, 1),
(269, '402', 81, 'Junior', 0, 1),
(270, '501', 82, 'Grand', 0, 1),
(271, '502', 82, 'Grand', 0, 1),
(272, '601', 83, 'Deluxe', 0, 1),
(273, '602', 83, 'Deluxe', 0, 1),
(274, '101', 84, 'Deluxe', 0, 1),
(275, '102', 84, 'Deluxe', 0, 1),
(276, '201', 85, 'Premierdeluxe', 0, 1),
(277, '202', 85, 'Premierdeluxe', 0, 1),
(278, '301', 86, 'Family', 0, 1),
(279, '302', 86, 'Family', 0, 1),
(280, '401', 87, 'Deluxe', 0, 1),
(281, '402', 87, 'Deluxe', 0, 1),
(282, '101', 88, 'Grand', 0, 1),
(283, '102', 88, 'Grand', 0, 1),
(284, '201', 89, 'Royale', 0, 1),
(285, '202', 89, 'Royale', 0, 1),
(286, '301', 90, 'Twin', 0, 1),
(287, '302', 90, 'Twin', 0, 1),
(288, '401', 91, 'Prime', 0, 1),
(289, '402', 91, 'Prime', 0, 1),
(290, '501', 92, 'Elite', 0, 1),
(291, '502', 92, 'Elite', 0, 1),
(292, '601', 93, 'Familia', 0, 1),
(293, '602', 93, 'Familia', 0, 1),
(294, '101', 94, 'Deluxe', 0, 1),
(295, '102', 94, 'Deluxe', 0, 1),
(296, '201', 95, 'Junior', 0, 1),
(297, '202', 95, 'Junior', 0, 1),
(298, '301', 96, 'Triple', 0, 1),
(299, '302', 96, 'Triple', 0, 1),
(300, '401', 97, 'Family', 0, 1),
(301, '402', 97, 'Family', 0, 1),
(302, '501', 98, 'Executive', 1, 1),
(303, '502', 98, 'Executive', 1, 1),
(304, '101', 99, 'Superior', 0, 1),
(305, '102', 99, 'Superior', 0, 1),
(306, '201', 100, 'Deluxe', 0, 1),
(307, '202', 100, 'Deluxe', 0, 1),
(308, '301', 101, 'Bungalows', 0, 1),
(309, '302', 101, 'Bungalows', 0, 1),
(310, '401', 102, 'Premium', 0, 1),
(311, '402', 102, 'Premium', 0, 1),
(312, '501', 103, 'Premium', 0, 1),
(313, '502', 103, 'Premium', 0, 1),
(314, '101', 104, 'Deluxe', 0, 1),
(315, '102', 104, 'Deluxe', 0, 1),
(316, '201', 105, 'Executive', 0, 1),
(317, '202', 105, 'Executive', 0, 1),
(318, '301', 106, 'Panoramic', 0, 1),
(319, '302', 106, 'Panoramic', 0, 1),
(320, '101', 107, 'Junior', 0, 1),
(321, '102', 107, 'Junior', 0, 1),
(322, '201', 108, 'Superior', 1, 1),
(323, '202', 108, 'Superior', 1, 1),
(324, '301', 109, 'Superior', 0, 1),
(325, '302', 109, 'Superior', 0, 1),
(326, '401', 110, 'Premier', 0, 1),
(327, '402', 110, 'Premier', 0, 1),
(328, '101', 111, 'Babylon', 0, 1),
(329, '102', 111, 'Babylon', 0, 1),
(330, '201', 112, 'Pool', 1, 1),
(331, '202', 112, 'Pool', 1, 1),
(332, '301', 113, 'Garden', 1, 1),
(333, '302', 113, 'Garden', 1, 1),
(334, '401', 114, 'Villa', 1, 1),
(335, '402', 114, 'Villa', 1, 1),
(336, '501', 115, 'Sunlit', 0, 1),
(337, '502', 115, 'Sunlit', 0, 1),
(338, '706', 7, 'Twin', 1, 1),
(339, '707', 7, 'Twin', 1, 1),
(340, '708', 7, 'Twin', 1, 1),
(341, '709', 7, 'Twin', 1, 1),
(342, '710', 7, 'Twin', 1, 1),
(343, '711', 7, 'Twin', 1, 1),
(344, '712', 7, 'Twin', 1, 1),
(345, '713', 7, 'Twin', 1, 1),
(346, '714', 7, 'Twin', 1, 1),
(347, '715', 7, 'Twin', 1, 1),
(348, '716', 7, 'Twin', 1, 1),
(349, '306', 3, 'Twin', 1, 1),
(350, '307', 3, 'Twin', 1, 1),
(351, '308', 3, 'Twin', 1, 1),
(352, '309', 3, 'Twin', 1, 1),
(353, '310', 3, 'Twin', 1, 1),
(354, '311', 3, 'Twin', 1, 1),
(355, '312', 3, 'Twin', 1, 1),
(356, '313', 3, 'Twin', 1, 1),
(357, '314', 3, 'Twin', 1, 1),
(358, '315', 3, 'Double', 1, 1),
(359, '316', 3, 'Double', 1, 1),
(360, '317', 3, 'Double', 1, 1),
(361, '318', 3, 'Double', 1, 1),
(362, '319', 3, 'Double', 1, 1),
(363, '320', 3, 'Double', 1, 1),
(364, '111', 1, 'Double', 0, 1),
(365, '112', 1, 'Double', 0, 1),
(366, '113', 1, 'Double', 0, 1),
(367, '114', 1, 'Double', 0, 1),
(368, '115', 1, 'Double', 0, 1),
(369, '116', 1, 'Double', 0, 1),
(370, '117', 1, 'Double', 0, 1),
(371, '118', 1, 'Double', 0, 1),
(372, '119', 1, 'Double', 0, 1),
(373, '120', 1, 'Twin', 0, 1),
(374, '121', 1, 'Twin', 0, 1),
(375, '122', 1, 'Twin', 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `roomtype`
--

CREATE TABLE `roomtype` (
  `roomstypeid` int(11) NOT NULL,
  `roomstypename` varchar(50) NOT NULL,
  `numcusdefault` int(11) NOT NULL,
  `maxcus` int(11) NOT NULL,
  `views` varchar(50) NOT NULL,
  `description` varchar(500) NOT NULL,
  `minibar` int(1) NOT NULL,
  `smoking` int(1) NOT NULL,
  `breakfast` int(1) NOT NULL,
  `shower` int(1) NOT NULL,
  `roomsize` int(4) NOT NULL,
  `hotelid` int(11) NOT NULL,
  `roomtypestt` int(1) NOT NULL,
  `publicprice` int(11) NOT NULL,
  `netprice` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `roomtype`
--

INSERT INTO `roomtype` (`roomstypeid`, `roomstypename`, `numcusdefault`, `maxcus`, `views`, `description`, `minibar`, `smoking`, `breakfast`, `shower`, `roomsize`, `hotelid`, `roomtypestt`, `publicprice`, `netprice`) VALUES
(1, 'Signature Suite', 2, 2, 'Garden', 'This is our most expansive suite, featuring a luxuriously large balcony with a lounger to bask in the golden sunlight. In addition to the large bedroom, the suite includes a living room and dining area, and a splendid soaking tub.', 1, 0, 1, 1, 83, 1, 1, 368, 244),
(2, 'Bungalow', 2, 3, 'Ocean', 'These relaxing rooms are perfect for couples. Our charming bungalows offer ocean, pool or garden views and include stunning private outdoor baths and showers, in addition to an indoor shower.\r\nOne extra large king-size bed (2 x 2 m) or Two double size beds (1.2 x 2 m)', 1, 0, 1, 1, 53, 1, 1, 340, 180),
(3, 'Superior Comfort', 2, 3, 'Garden', 'Rooms are elegantly designed to comfortably accommodate either one or two people, with a bathtub, a small sitting area, and garden or ocean views. Reconnect with nature out on your garden-view balcony, or have a chat with friends in your sitting area.\r\nOne king-size bed (1.8 x 2 m) or Two double size beds (1.2 x 2 m)', 1, 0, 1, 1, 42, 1, 1, 229, 110),
(4, 'Superior Deluxe', 2, 3, 'Garden', 'Feel at home in one of these comfortable rooms with lots of space to stretch out and relax in. Breathe in the fresh air on your balcony or soak your cares away in the large bathtub.\r\nOne king-size bed (1.8 x 2 m) or Two double size beds (1.2 x 2 m)', 1, 0, 1, 1, 32, 1, 1, 176, 85),
(5, 'Superior Standard', 2, 3, 'Garden', 'Be in the middle of it all. Cozy, well-appointed rooms with spacious balconies overlooking lush gardens offer all the comforts of home, just steps from every delight that Pandanus has to offer.\r\nOne king-size bed (1.8 x 2 m) or Two double size beds (1.2 x 2 m)', 1, 0, 1, 1, 30, 1, 1, 189, 86),
(6, 'Family Suite', 4, 6, 'Garden', 'Spacious suites are perfect for families or friends traveling together. These suites can accommodate four guests comfortably and include a large sitting area and wrap-around balcony.\r\nOne king-size bed (1.8 x 2 m) and Two double size beds (1.2 x 2 m)', 1, 0, 1, 1, 53, 1, 1, 315, 140),
(7, 'Executive Suite', 2, 3, 'Garden', 'Our expansive Executive Suite generously accommodates four people and features two large bedrooms, a living room to gather with friends or family, and a wrap-around balcony to admire the views.\r\nOne king-size bed (1.8 x 2 m) and Two double size beds (1.2 x 2 m)', 1, 0, 1, 1, 76, 1, 1, 370, 175),
(8, 'Premier Room', 2, 3, 'City', 'Premier Rooms at Anantara Mui Ne are among the finest of Mui Ne hotels and are warm and sunlit, with stone and teak floors, a neutral palette, and bright splashes of color throughout. \r\nTake in soothing green views through floor-to-ceiling windows. Soak in your stone tub or cool off under the open rain shower.\r\n- Separate tub and rain shower.\r\n- King bed or Twin beds.', 1, 0, 1, 1, 43, 2, 1, 525, 162),
(9, 'Deluxe Room', 2, 3, 'Garden', 'Deluxe rooms at Anantara Resort in Mui Ne are spacious and tranquil, with tropical décor and indigenous motifs. Laze on your daybed or step out to your balcony to take in soothing views of the resort’s palms. The oversized bathroom features double vanities, an open rain shower, and a stone bathtub for long, hot soaks.\r\n- Balcony with garden views.\r\n- Separate tub and rain shower.\r\n- King bed or Twin beds.', 1, 0, 1, 1, 57, 2, 1, 545, 178),
(10, 'Ocean Suite', 2, 3, 'Ocean', 'Suites at our hotel in Phan Thiet offer the luxury of space, both indoors and out. Take in views of the ocean from a higher vantage point within the resort\'s main building. Breakfast on your private balcony, then retreat to the cool of your indoor daybed or soak in the tub.\r\n- Higher-floor balcony with ocean views.\r\n- Open-plan living area.', 1, 0, 1, 1, 90, 2, 1, 574, 235),
(11, 'One Bedroom Pool Villa', 2, 3, 'Garden', 'Standalone pool villas are set in lush gardens and dotted throughout the resort. Hideaway in the private courtyard of your villa in Vietnam, spending sunny days by or in the pool. Dine in the shade of your sunken dining pavilion, and bathe under the stars. \r\n- Garden courtyard with pool/ Beach front pool with ocean views\r\n- Al fresco dining pavilion and bathroom\r\n- King bed', 1, 0, 1, 1, 90, 2, 1, 650, 323),
(12, 'Two Bedroom Pool Villa', 2, 3, 'Garden', 'Two separate villas are set in lush gardens and share a central pool area. Each villa contains a master or twin ensuite bedroom, ensuring both privacy and shared moments. Both bathrooms are al fresco, with the master bathroom boasting a stone tub for soaking. Dine together in your sunken pavilion overlooking the pool.\r\n- Two standalone villas\r\n- Central garden courtyard with pool/beach front pool with ocean views\r\n- King bed and Twin beds', 1, 0, 1, 1, 128, 2, 1, 685, 455),
(13, 'Two Bedroom Family Pool Villa', 2, 3, 'Garden', 'Designed especially with families in mind, these private villas at our beach resort in Mui Ne offer a peaceful atmosphere. A twin bedroom lies off the master, ideal for watching over small children. Both bathrooms are al fresco, with the master bathroom boasting a stone tub for soaking. Spend sunny days splashing in the pool in your garden courtyard.\r\n- King bed and Twin beds', 1, 0, 1, 1, 128, 2, 1, 735, 520),
(14, 'Two Bedroom Duplex Pool Villa', 2, 3, 'Garden', 'With one ensuite bedroom per floor, the duplex villa at Anantara Mui Ne Resort stands out among Vietnam luxury resorts and is ideal for couples traveling together. Both bathrooms are al fresco, with the downstairs bathroom boasting a stone tub for soaking. Sunbathe together by the pool, enjoying meals in the sunken dining pavilion. Then retreat to your respective spaces for quiet nights.\r\n- King beds (one bedroom on each floor)', 1, 0, 1, 1, 128, 2, 1, 755, 535),
(15, 'Two Bedroom Suite', 2, 3, 'Ocean', 'The Two Bedroom Suite offers the best views in the resort and is among the finest of 5-star hotels in Vietnam with a higher-floor view of the ocean and magnificent sunrises. Each floor of the duplex has an ensuite bedroom, perfect for couples traveling together and wanting some privacy. Dine together out on the balcony, or indoors with refreshments from your wet bar. Soak in a Jacuzzi and unwind.\r\n- King beds (one bedroom on each floor)', 1, 0, 1, 1, 175, 2, 1, 775, 565),
(16, 'Bunglows', 2, 3, 'Ocean', 'Inspired by traditional Vietnamese village bungalows, our beach front bungalows are situated in front of the ocean with charming features such as thatched roofs, bamboo interiors and local Vietnamese art.\r\nLush landscapes and bamboo trees surround stylish bungalows. These bungalows form a collective seaside village where guests can enjoy tropical charm while maintaining privacy. ', 1, 0, 1, 1, 40, 3, 1, 224, 168),
(17, 'Cozy Deluxe', 2, 3, 'Garden', 'Find your Zen with sounds from the ocean with the tranquility of the water lily pond.', 1, 0, 1, 1, 32, 3, 1, 171, 91),
(18, 'Nova Deluxe', 2, 3, 'Garden', 'Our Nova Deluxe rooms can be found on the newest wing with direct views of the garden and water lily ponds. These rooms are specifically designed for those looking for all the comforts of home but in a modern resort atmosphere.', 1, 0, 1, 0, 35, 3, 1, 125, 95),
(19, 'Sea Breeze Deluxe', 2, 3, 'Garden', 'Picturesque sightline of the ocean from our overreaching balcony.', 1, 0, 1, 1, 45, 3, 1, 242, 120),
(20, 'Garden View Deluxe', 2, 3, 'Garden', 'Romantic yet functional, our Deluxe rooms keep with modern demands for luxurious comfort. Surrounded by greenery and steps away from the quiet swimming pool and spa, Garden View Deluxe rooms feature thatched roofs with a view of the garden.', 1, 0, 1, 1, 32, 3, 1, 96, 76),
(21, 'Sapa House Room', 2, 3, 'Garden', 'Named after the scenic terraced highlands of Northern Vietnam, these rooms are well-appointed and thoughtfully designed. With a lower or upper floor option, our Sapa House rooms offer a combination of privacy, flexibility, and tastefully minimalist resort accommodations.', 1, 0, 1, 1, 29, 4, 1, 214, 113),
(22, 'Superior Sapa House', 2, 3, 'Garden', 'Larger than our standard Sapa House rooms, Superior Sapa House rooms boast complete privacy and exclusivity. Select from two types of Superior Sapa House rooms: Ground floor rooms with cozy private garden and indoor shower, or upper floor rooms with a private veranda and outdoor shower.', 1, 0, 1, 1, 54, 4, 1, 250, 125),
(23, 'Superior Garden View Bungalows', 2, 3, 'Garden', 'Superior Garden View Bungalows are built back-to-back within a series of interconnecting pathways leading through lush, tropical gardens. These bungalows boast spacious, well-appointed bedrooms and a landscaped, semi-open-air bathroom highlighted by handmade brass vanity basins. The secluded bathtub and garden shower are ideal for communing with nature underneath starry skies.', 1, 0, 1, 1, 43, 4, 1, 370, 159),
(24, 'Deluxe Garden View Bungalows', 2, 3, 'Garden', 'Built back-to back, Deluxe Garden View Bungalows have the most spacious bedrooms in the entire resort, offering all the luxury and style expected by discerning guests. Meticulously designed, these bungalows feature a spacious bedroom and modern bathroom with a double shower overlooking a compact feature garden for a wonderful blend of classic and modern aesthetics.', 1, 0, 1, 1, 47, 4, 1, 358, 211),
(25, 'Beachfront Bungalows', 2, 3, 'Ocean', 'Situated right on the beach with uninterrupted views of the East Sea, these bungalows embody Sailing Club’s signature qualities of vibrancy and exclusivity. Effortlessly blending comfort, luxury and location, our Beachfront Bungalows are always in high demand, providing a restful seaside escape just steps away from most of the resort’s entertainment and dining facilities.', 1, 0, 1, 1, 47, 4, 1, 415, 230),
(26, '4-Bedroom Family Villa', 2, 3, 'Garden', 'Truly a home away from home, Sailing Club’s 4-Bedroom Family Villa is a two-storey house with 3 double bedrooms, one twin room, 3.5 bathrooms, a kitchenette, expansive dining room and a separate lounge and TV room.\r\nThree of the bedrooms are situated on the upper floor and lead onto a large open balcony overlooking lush tropical gardens. The master bedroom has a sizeable dressing room and large en-suite bathroom while the two smaller bedrooms share a second bathroom.', 1, 0, 1, 1, 200, 4, 1, 550, 485),
(27, 'Deluxe', 2, 3, 'Garden', 'With soothing neutral tones and blue hues, the comfortable Deluxe room is designed for up to two adults and one child with your choice of either king-size or twin beds. The surprisingly spacious room comes with 78 square meters of living space and an ensuite bathroom. Connecting rooms are available.', 1, 1, 0, 1, 44, 5, 1, 227, 175),
(28, 'Premium Deluxe', 2, 3, 'Garden', 'Overlooking the property, the well-designed Premium Deluxe room provides 90 square meters of space, comfortably sleeping up to three adults or two adults and one child with your choice of one king-size or two twin beds, plus a cozy sofa bed. The airy room also comes with an ensuite bathroom.', 1, 1, 0, 1, 50, 5, 1, 247, 193),
(29, 'Premier Pool Access', 2, 3, 'Garden', 'With views of the resort’s sparkling long pool, the Premier Pool Access Deluxe room comfortably sleeps up to two adults and one child with your choice of double or twin bed configuration. The tastefully decorated 78-square-meter room also features an ensuite bathroom. Connecting rooms are available.', 1, 1, 0, 1, 78, 5, 1, 325, 217),
(30, 'Residence 2 Bedroom Private Pool', 2, 3, 'Garden', 'Enjoy pure privacy, comfort and convenience in the 2 Bedroom Private Pool Residence, complete with a plunge pool and kitchenette. With 160 square metres of living space, the residence can sleep up to six guests with one king-size bed, bunk beds, the option for an extra bed and two ensuite bathrooms.', 1, 1, 0, 0, 160, 5, 1, 607, 418),
(31, 'Residence 3 Bedroom Private Pool', 2, 3, 'Garden', 'As the resort’s most spacious residence, the 190-square-meter 3 Bedroom Private Pool Residence comes complete with a plunge pool and kitchenette. The stylish sanctuary can sleep up to eight guests with two king-size beds, two twin beds, the option for an extra bed, and three ensuite bathrooms.', 0, 1, 0, 1, 190, 5, 1, 714, 544),
(32, 'Villa 1 Bedroom Private Pool', 2, 3, 'Garden', 'Unwind in the stylish sanctuary of your private pool villa overlooking the gardens. With nearly 68 square metres of well-designed living space, the airy abode comes with a plunge pool, and a king-size bed plus the option of adding an extra bed to fit up to three adults or two adults and two children.', 1, 1, 0, 1, 68, 5, 1, 366, 238),
(33, 'Villa 2 Bedroom Private Pool', 2, 3, 'Garden', 'Thoughtfully designed to sleep up to six guests, the stylish 2 Bedroom Private Pool Villa features one king-size bed and two twin beds. With nearly 68 meters of living space decorated in neutral tones and blue accents, the villa also boasts a private plunge pool, two bathrooms, and views of the resort.', 1, 0, 0, 1, 161, 5, 1, 554, 310),
(34, 'Villa 2 Bedroom Ocean View Private Pool', 2, 3, 'Ocean', 'Escape to your own oasis in the Villa Two-Bedroom Private Pool Ocean View at Centara Mirage Resort Mui Ne. At 161 square meters, the villa comfortably houses up to six guests in two spacious bedrooms. Guests enjoy the luxury of privacy with a private pool and views over the East Sea.', 1, 0, 0, 1, 161, 5, 1, 595, 346),
(35, 'Azul Garden View', 2, 3, 'Garden', 'Azul Garden View - an ideal room for nature lovers who enjoy spending time and observing green plants, colorful flowers, and a winding garden as a beautiful painting', 1, 0, 1, 1, 45, 6, 1, 153, 118),
(36, 'Azul Pool View', 2, 3, 'Pool', 'Azul Pool View - an outstanding view of the pool where you can enjoy the fresh air, watch the most unique swimming pool in Mui Ne with a design main color is blue bringing peace, charming, and a friendly atmosphere.', 1, 0, 1, 1, 45, 6, 1, 176, 133),
(37, 'Azul Sea View', 2, 3, 'Ocean', 'Azul Sea View – The harmony between rooms’ designs and nature smoothen every sense. Azul Sea View room has a beautiful Mui Ne sea view. Each piece of equipment is carefully selected in order to balance the inside furniture and the outside view and makes our customers feel relaxed and convenient.', 1, 0, 1, 1, 45, 6, 1, 198, 157),
(38, 'Bungalow Garden View', 2, 3, 'Garden', 'Bungalow Garden View - Suited by the sea, the ocean wind makes you feel comfortable and younger. With rustic, cottage design including wide front porches and charming dormers. You can escape the busy and noisy life to spend a wonderful vacation at Bungalow Garden View.', 1, 0, 1, 1, 72, 6, 1, 247, 137),
(39, 'Bungalow Beach Front', 2, 3, 'Ocean', 'Bungalow Beach Front - Offer more privacy, and unique wide verandas, you will be immersed in the landscape of nature. “A house in the forest” is the best description for Bungalow Beach Front.', 1, 0, 1, 1, 72, 6, 1, 294, 161),
(40, 'Verde Condos', 2, 3, 'Garden', 'Verde Condos - Decorating style features the special color of coconut leaves and purity of nature. Verde Condos blends various creativities of modern, luxury, and the beauty of nature. This dominant style is the best choice for you to restore your inner peace.', 1, 0, 1, 1, 72, 6, 1, 176, 133),
(41, 'Terra Ocean View', 2, 3, 'Ocean', 'Terra Ocean View - Inspired by the color of tropical sand of Mui Ne the view, design, and decorations reflect the endless tropical paradise of dunes and valleys.', 1, 0, 1, 1, 140, 6, 1, 285, 157),
(42, 'Terra Ocean View 2 Bedrooms', 2, 3, 'Ocean', 'Terra Ocean View 2 Bedrooms - A luxury apartment with 2 bedrooms and a convenient kitchen area, especially a jacuzzi bathtub outdoors to relax while observing the peaceful landscape but still maintain privacy.', 1, 0, 1, 1, 148, 6, 1, 310, 180),
(43, 'Luxury Duplex', 2, 3, 'Ocean', 'Luxury Duplex - If you prefer high, wide visibility toward the sea, Luxury Duplex is the best choice. The modern, elegant decoration with a wide balcony will make your stay memorable.', 1, 0, 1, 0, 106, 6, 1, 302, 166),
(44, 'Luxury Duplex 2 Bedrooms', 2, 3, 'Ocean', 'Luxury Duplex 2 Bedrooms - Equipped with a set of sofa, kitchen area, modern bathroom and other amenities. Especially, Luxury Duplex 2 Bedrooms has sea view balcony, from here you can greet the sunrise, watch the sunset or just simply observe the vasty of the sea.', 1, 0, 1, 1, 106, 6, 1, 421, 323),
(45, 'Rooftop', 2, 3, 'Ocean', 'The rooftop will impress you with the color of the sand of the tropical region like Mui Ne, which possesses 2 rooms for your all family. The rooftop is equipped with a Jacuzzi bathtub that helps in massaging to relieve pain and stress while enjoying the beautiful scenery.', 1, 0, 1, 1, 180, 6, 1, 490, 269),
(46, 'Villa Ocean Front', 2, 3, 'Ocean', 'Villa Ocean Front - Suitable for a group of friends, company, or family, Villa Ocean Front is a combination of luxury and modern life with an impressive area of up to 470 m2 and a private pool. Villa Ocean Front is right at the sea and offers you an unforgettable view with all of the available amenities... Villa Ocean Front at The Cliff Resort & Residences is a perfect choice for events, ceremonies, weddings, and birthday party organizations.', 1, 0, 1, 1, 470, 6, 1, 1044, 574),
(47, 'Premium Deluxe Room', 2, 3, 'Ocean', 'Rooms are equipped with luxurious amenities and modern. The room is also fitted with smoke sensors, ensuring safety for travelers. Rooms have a balcony, and separate corridors are comfortable for guests to enjoy the sea and the Resort. The room has 2 choices of 1 single bed or 2 double beds, very suitable for lovers or newlyweds looking for romance.', 1, 1, 1, 1, 80, 7, 1, 143, 79),
(48, 'Ocean View Bungalow', 2, 3, 'Ocean', 'Each room in Ocean View Bungalow with modern design and luxurious amenities is arranged into 3 separate spaces: bedroom, living room, and bathroom (with bathtub). The room has large windows, balconies, and sea views.\r\n', 1, 1, 1, 1, 60, 7, 1, 150, 77),
(49, 'Luxury Garden Bungalow', 2, 3, 'Garden', 'Each Luxury Garden Bungalow has a sea view with modern design and luxurious facilities, arranged in 3 separate spaces: bedroom, living room, and bathroom (with bathtub). Rooms have large windows, balconies, and a view of the sea.', 1, 1, 1, 1, 60, 7, 1, 163, 75),
(50, 'Deluxe Partial Seaview', 2, 3, 'Ocean', 'Each Deluxe Partial Seaview room overlooks the ocean with modern design and luxurious amenities, arranged in 3 separate spaces: bedroom, living room, and bathroom (with bathtub). The room has large windows, balconies, and sea views.', 1, 1, 1, 1, 55, 7, 1, 131, 120),
(51, 'Superior Sea View', 2, 3, 'Ocean', 'The superior sea view room with an area of 46m2 is modernly designed and fully equipped with amenities for your stay. ', 1, 0, 1, 1, 46, 8, 1, 149, 68),
(52, 'Superior Garden View', 2, 3, 'Garden', 'The superior sea view room with an area of 46m2 is modernly designed and fully equipped with amenities for your stay.', 1, 0, 1, 1, 46, 8, 1, 147, 47),
(53, 'Aroma Luxury', 2, 3, 'Pool', 'Luxury Suite is the room class that owns the largest area with 119m2 for 1 unit, this is quite a large area compared to the normal room class. The entire Aroma Resort has only 02 Luxury Suite apartments. Each room is fully equipped with high-class amenities such as a work desk and a bathtub.', 1, 0, 1, 1, 119, 8, 1, 156, 110),
(54, 'Aroma Suite', 2, 3, 'Garden', 'Aroma Suite Room owns an area of ​​about 98m2, built near the beach. This is a special high-end designer bedroom with sweeping views. With a scientific design, this place gives visitors a feeling of modern, sophisticated but extremely warm.', 1, 0, 1, 1, 98, 8, 1, 240, 197),
(55, 'Aroma Triple', 2, 3, 'Ocean', 'With an area of up to 85m2, Triple Room is a room for a group of 3 friends or a small family. It is equipped with 1 large double bed and 1 single bed overlooking the sea. In a beautiful setting and 1001 virtual living corners, the room helps visitors keep unforgettable memories with family and loved ones.', 1, 0, 1, 1, 85, 8, 1, 215, 179),
(56, 'Bungalow Sea View', 2, 3, 'Ocean', 'Sea View Bungalow has impressed guests by its delicate and elegant architecture. The room is a combination of modern trends but still retains the rustic features of Vietnamese villages. With an area of 55m2, this place is arranged with 2 single beds and designed with a sea view. Therefore, just by staying in the room, you can cover the whole sea of waves.', 1, 0, 1, 1, 55, 8, 1, 150, 87),
(57, 'Bungalow Garden View', 2, 3, 'Garden', 'Bungalow Garden View has recreated the history and beauty of Vietnamese culture through creative personality design. This place is a harmonious combination of contemporary design with the simple beauty of the countryside. The same thatched roof is surrounded by many trees to help visitors immerse themselves in nature.', 1, 0, 1, 1, 55, 8, 1, 145, 68),
(58, 'Aroma Villages', 2, 3, 'Garden', 'For the most part, couples tend to choose Village Double. Having the same area as the Village Twin, this room has a large double bed. With a cozy space and gentle colors, this place deserves to be a great choice for you and your loved one together.', 1, 1, 1, 1, 51, 8, 1, 166, 64),
(59, 'Seaview Suite', 2, 3, 'Ocean', 'Layout – Bedroom and living room\r\nInternet – Free Wi-Fi\r\nEntertainment – Cable channels\r\nFood & Drink – Coffee/tea maker, minibar, 24-hour room service, and free bottled water\r\nSleep – Premium bedding and blackout drapes/curtains\r\nBathroom – Private bathroom, bathtub, bathrobes, and slippers\r\nPractical – Safe, double sofa bed, and desk; rollaway/extra beds and free cribs/infant beds available on request\r\nComfort – Air conditioning and daily housekeeping\r\nNon-Smoking', 1, 0, 1, 0, 80, 9, 1, 356, 121),
(60, 'Beach-Front Private Villa', 2, 3, 'Ocean', 'Layout – Bedroom, living room, and sitting area\r\nRelax – Private pool and a spa tub\r\nInternet – Free Wi-Fi\r\nEntertainment – Cable channels\r\nFood & Drink – Coffee/tea maker, minibar, 24-hour room service, and free bottled water\r\nSleep – Premium bedding and blackout drapes/curtains\r\nBathroom – 2 bathrooms, separate bathtub and shower, bathrobes, and slippers\r\nPractical – Yard, double sofa bed, and safe; rollaway/extra beds and free cribs/infant beds available on request\r\nComfort – Air conditioning', 1, 0, 1, 1, 200, 9, 1, 698, 319),
(61, 'Presidential Villa', 2, 3, 'Pool', 'An extraordinary, expansive living area unfolds beyond the entranceway. Straight ahead is a sunken lounge with views out across the pool then to your left is a dining area for ten or twelve guests. The suite also boasts plush sofas and a giant TV screen.\r\nA 3-bedroom French-Bali-inspired paradise, complete with a private pool, relaxing pavilion, and Jacuzzi. Enjoy total privacy, with the beach only steps away.\r\nMaster Bedrooms: From boundless comfort, you look out over the garden and pool area.', 1, 0, 1, 1, 400, 9, 1, 2339, 1068),
(62, 'Premier Deluxe', 2, 3, 'Ocean', 'Internet – Free WiFi\r\nEntertainment – Cable channels\r\nFood & Drink – Coffee/tea maker, minibar, 24-hour room service, and free bottled water\r\nSleep – Premium bedding and blackout drapes/curtains\r\nBathroom – Private bathroom, shower, bathrobes, and slippers\r\nPractical – Safe, desk, and phone; rollaway/extra beds and free cribs/infant beds available on request\r\nComfort – Air conditioning and daily housekeeping\r\nNon-Smoking', 1, 0, 1, 1, 40, 9, 1, 170, 79),
(63, 'Garden View Suite', 2, 3, 'Garden', 'Layout – Bedroom, living room, and sitting area\r\nInternet – Free Wi-Fi\r\nEntertainment – Cable channels\r\nFood & Drink – Coffee/tea maker, minibar, 24-hour room service, and free bottled water\r\nSleep – Premium bedding and blackout drapes/curtains\r\nBathroom – Private bathroom, bathtub, bathrobes, and slippers\r\nPractical – Safe, desk, and phone; rollaway/extra beds and free cribs/infant beds available on request\r\nComfort – Air conditioning and daily housekeeping\r\nAccessibility – Wheelchair accessibl', 1, 0, 1, 1, 80, 9, 1, 239, 110),
(64, 'Garden View Deluxe ', 2, 3, 'Garden', 'Internet – Free Wi-Fi\r\nEntertainment – Cable channels\r\nFood & Drink – Coffee/tea maker, minibar, 24-hour room service, and free bottled water\r\nSleep – Premium bedding and blackout drapes/curtains\r\nBathroom – Private bathroom, shower, bathrobes, and slippers\r\nPractical – Safe, desk, and phone; rollaway/extra beds and free cribs/infant beds available on request\r\nComfort – Air conditioning and daily housekeeping\r\nNon-Smoking', 1, 0, 1, 1, 40, 9, 1, 161, 69),
(65, 'Premier Superior', 2, 3, 'Garden', 'Internet – Free WiFi\r\nEntertainment – Cable channels\r\nFood & Drink – Coffee/tea maker, minibar, 24-hour room service, and free bottled water\r\nSleep – Premium bedding and blackout drapes/curtains\r\nBathroom – Private bathroom, shower, bathrobes, and slippers\r\nPractical – Safe, desk, and phone; rollaway/extra beds and free cribs/infant beds available on request\r\nComfort – Air conditioning and daily housekeeping\r\nNon-Smoking', 1, 0, 1, 1, 30, 9, 1, 204, 69),
(66, 'Superior Pool View', 2, 3, 'Pool', 'Superior pool view is a standard room with full standard amenities, bright & airy with a private balcony and pool view, offering a comfort zone for tranquil periods of sleep.', 1, 0, 1, 1, 37, 10, 1, 180, 87),
(67, 'Deluxe Pool View', 2, 3, 'Pool', 'Simply an elegant and spacious room with outstanding views of the pool. Truly conducive to rest and relaxation for the discerning guests.', 1, 0, 1, 1, 46, 10, 1, 196, 96),
(68, 'Premium Deluxe King', 2, 3, 'Ocean', 'With warm colors and a design-oriented interior, these Deluxe Rooms comprise an inviting blend of International and Asian styles. You will be instilled with a sense of belonging in every stay.', 1, 0, 1, 0, 57, 10, 1, 225, 138),
(69, 'Superior Sea View', 2, 3, 'Ocean', 'Superior sea view is a standard room with full standard amenities, bright & airy with a private balcony and sea view, offering a comfort zone for a tranquil sleep.', 1, 0, 1, 1, 37, 10, 1, 179, 87),
(70, 'Deluxe Sea View', 2, 3, 'Ocean', 'Simply elegant and spacious room with outstanding views of the Mui Ne bay. Truly conducive to rest and relaxation for the discerning guests.', 1, 0, 1, 1, 46, 10, 1, 208, 103),
(71, 'Premium Deluxe Family', 2, 3, 'Ocean', 'Stunning views matched with luxury interiors perfectly designed for families and groups with utmost relaxation. This room is spacious and fully equipped with modern amenities which is ideal for your family vacation.', 1, 0, 1, 1, 57, 10, 1, 258, 164),
(72, 'President Suite', 2, 3, 'Nha Trang Bay', 'PRESIDENTIAL SUITE has an area of ​​435m2 located in a unique location of the building, with beautiful views, open space and creative design. From here, you can admire the panoramic view of Nha Trang Bay, Tran Phu street and a part of the romantic coastal city.\n\nThe room consists of two bedrooms, one double bed, two single beds and a living room with a desk, a bar, a kitchen, a dining table, a sofa, which is sophisticatedly designed and fully equipped with modern equipment.\n', 0, 0, 1, 1, 252, 11, 1, 450, 200),
(73, 'Royal Suite', 2, 3, 'City or Ocean', 'You can relax with comfortable living room and modern equipment, large bathroom with whirlpool bathtub, shower and all in-room features as you would expect.', 1, 0, 1, 1, 112, 11, 1, 250, 125),
(74, 'Junior Suite', 2, 3, 'City', 'You can relax with comfortable living room and modern equipment, large bathroom, shower and all the in-room features you would expect.', 1, 0, 1, 1, 63, 11, 1, 144, 60),
(75, 'Grand Suite', 2, 3, 'City or Ocean', 'You can relax with comfortable living room and modern equipment, large bathroom, shower and all the in-room features you would expect.', 1, 0, 1, 1, 92, 11, 1, 152, 65),
(76, 'Executive Suite', 2, 3, 'City or Ocean', 'Executive Suite room is luxuriously and elegantly designed with separate living room and bedroom area. The room also has wide glass walls creating a panoramic view of Nha Trang Bay', 1, 0, 1, 1, 63, 11, 1, 250, 60),
(77, 'Deluxe Family Triple', 2, 3, 'City or Ocean', 'Deluxe Family Triple bedroom has an average area of 39 m2 with luxurious furniture that is equally cozy and elegant.', 1, 0, 1, 1, 45, 11, 1, 247, 50),
(78, 'Premium Deluxe Ocean', 2, 3, 'Ocean', 'Separated from the main house area, Premium Deluxe Ocean View is a spacious and elegant room with an outside balcony facing the sea. With a massage tub with luxurious jacuzzi and a spacious and comfortable bathroom, Premium Deluxe Ocean View will provide your dream vacation.', 1, 0, 1, 1, 55, 12, 1, 144, 60),
(79, 'Deluxe Ocean View', 2, 3, 'Ocean', 'From the balcony of Deluxe Ocean View room, you can see most of the beautiful scenery of Nha Trang Sea. Guests can relax comfortably and the room is equipped with extra-large bed.', 1, 0, 1, 1, 37, 12, 1, 160, 40),
(80, 'Executive Suite Ocean View', 2, 3, 'Ocean', 'Executive Suite Ocean View features a private sauna and 2 spa tubs in the room and right on the elegantly designed balcony on wooden floors. Relax your body and soul into a cozy space, open the door to catch the gentle breeze from the sea. Don\'t forget to observe the daily life and beauty of the city from the balcony on the side of the room.', 1, 0, 1, 1, 62, 12, 1, 144, 60),
(81, 'Junior Suite Ocean View', 2, 3, 'Nha Trang Bay', 'This is the most spacious room type that has everything a traveler could want. Junior Suite Ocean View offers guests a luxurious and comfortable room with 1 bedroom and 1 elegantly designed living room. The spa tub on the private balcony, overlooking the panoramic view of Nha Trang Bay, helps guests staying during business or leisure time to enjoy the scenery of Nha Trang sea.', 1, 0, 1, 1, 57, 12, 1, 144, 50),
(82, 'Grand Suite', 2, 3, 'Ocean', 'Located on the upper floors of the hotel, Grand Deluxe Ocean View has a beautiful view of Nha Trang beach and offers a relaxing atmosphere, enjoying the peace of the sea. Offering a comfortable and peaceful feeling with wooden floors and elegant interiors, Grand Deluxe offers a luxurious and classy experience.', 1, 0, 1, 1, 37, 12, 1, 144, 60),
(83, 'Deluxe Room', 2, 3, 'Garden', 'Comfort guests with beautiful Roman pool or garden views. Several rooms can be connected to each other depending on your needs.\r\nDeluxe Room has many different types of rooms with double beds, 2 single beds, designed to suit guests\' preferences.', 1, 0, 1, 1, 35, 12, 1, 144, 60),
(84, 'Deluxe Twin City View', 2, 3, 'City', 'With a sufficient area to create warmth and comfort, deluxe city view rooms are complemented by necessary amenities. Perfect for both business and leisure travelers. Various room types with double bed, twin beds and triple beds are tailored for your choice. All the 118 Deluxe Double  City View Rooms overlooking the panoramic view of Nha Trang city.', 1, 0, 1, 1, 35, 13, 1, 144, 60),
(85, 'Premierdeluxe Double', 2, 3, 'Nha Trang Bay', 'From Premier sea view Room balcony, the most breathtaking views of Nha Trang Bay are available. Bathroom with transparent glass will bring nature close to you. Refresh your soul in cozy and well-appointed accommodation with king-size bed.', 1, 0, 1, 1, 37, 13, 1, 250, 90),
(86, 'Premium Family', 2, 3, 'Nha Trang Bay', 'Some of the Premium Family rooms possess breathtaking views of Nha Trang Bays and relaxing atmosphere and some has breathtaking views of mountain & City. The Premium Family rooms also offer exclusive level of comfort with wooden floor, elegant interior and privileges.', 1, 0, 1, 1, 68, 13, 1, 270, 100),
(87, 'Junior Suite', 2, 3, 'Nha Trang Bay', 'For romantic souls, ask for the Junior Suite facing Nha Trang city. Each of the guestrooms and suites is luxuriously appointed, large and elegantly styled to cater the most discerning business or leisure travelers with magnificent views over Nha Trang City.', 1, 0, 1, 1, 56, 13, 1, 144, 60),
(88, 'Grand Room', 2, 3, 'Sea and City', 'Enjoy with Grand Room', 1, 0, 1, 1, 38, 14, 1, 150, 72),
(89, 'Grand Royale', 2, 3, 'Sea and City', 'Enjoy with Grand Royale', 1, 0, 1, 1, 44, 14, 1, 320, 154),
(90, 'Suite', 2, 3, 'Sea and City', 'Enjoy with Suite', 1, 0, 1, 1, 63, 14, 1, 144, 60),
(91, 'Prime Suite', 2, 3, 'Sea', 'Enjoy with Prime Suite', 1, 0, 1, 1, 80, 14, 1, 360, 157),
(92, 'Elite Suite', 2, 3, 'Sea', 'Enjoy with Elite Suite', 1, 0, 1, 1, 102, 14, 1, 420, 250),
(93, 'Familia Suite', 2, 3, 'Sea and City', 'Enjoy with Familia Suite', 1, 0, 1, 0, 62, 14, 1, 354, 160),
(94, 'Deluxe Ocean', 2, 3, 'Ocean', 'Deluxe Ocean rooms have panoramic views over Nha Trang beach and the islands in the distance. With unique architecture, elegant furniture, the room is luxuriously and modernly designed with a wide and open view where you can enjoy the panoramic view of the coast.', 1, 0, 1, 1, 40, 15, 1, 144, 60),
(95, 'Junior Suite', 2, 3, 'Ocean', 'Junior Suite room with direct sea view.', 1, 0, 1, 1, 65, 15, 1, 174, 93),
(96, 'Triple City', 2, 3, 'City', 'Triple City room has a panoramic view of Nha Trang city. With unique architecture, elegant interior, the room is luxuriously and modernly designed with a wide and open view where you can enjoy the panoramic view of the city.', 1, 0, 1, 1, 40, 15, 1, 154, 60),
(97, 'Family Suite', 2, 3, 'Ocean', 'Family Suite room is a great \"2 in 1\" choice for your family, including bedroom area, kitchen area, relaxing sofa, separate toilet designed on a straight axis, open view direct view of the entire sea and island scenery through the large glass window. Through the virtual transparent glass, every moment of immersion here awakens all the purest senses, bringing new emotional faces to your life.', 1, 0, 1, 1, 65, 15, 1, 164, 65),
(98, 'Executive Suite', 2, 3, 'Ocean', 'Executive Suite room is the perfect and most luxurious choice for your trip whether going to work or relaxing with family.', 1, 0, 1, 1, 130, 15, 1, 280, 140),
(99, 'Superior', 2, 3, 'Garden', 'Superior Garden View rooms are comfortable and are 32 square meters in size with large glass windows overlooking the Resort\'s garden. This basic room type has the option of king or twin beds, suitable for couples. Couples and families with 2 adults or 1 adult and 1 child. In-room amenities and services include a flat-screen TV with international channels, individually controlled air conditioning, a fully equipped minibar, amenities like tea/coffee and hair dryer.', 1, 0, 1, 1, 32, 16, 1, 144, 60),
(100, 'Deluxe', 2, 3, 'Garden', 'Choosing to stay at the Deluxe Garden View room type will be suitable for families who like to relax in a cozy room. These 62-square-foot rooms overlook the resort\'s lush gardens. The decor with wooden accents and soft colors makes the space feel more spacious. Each room can accommodate up to 3 adults or 2 adults and 1 child. This room type has a king size bed and a bathroom with separate bathtub and shower. There are other kinds of amenities', 1, 0, 1, 1, 62, 16, 1, 160, 65),
(101, 'Bungalows', 2, 3, 'Ocean and City', 'The decoration style with neutral and gentle colors creates an airy and spacious space for each 44 square meter bungalow. Stay and enjoy the sea breeze on the balcony, enjoy the garden view. Inside each bungalow is equipped with a flat-screen TV with multi-channel TV, international direct dial phone, air conditioning, In-room safe, fully equipped minibar, amenities such as tea, coffee and hair dryer.', 1, 0, 1, 1, 44, 16, 1, 143, 60),
(102, 'Premium Deluxe', 2, 3, 'Ocean or City', 'Enjoy your stay comfortably in the Premium Deluxe with a furnished balcony to relax in. These rooms have a 46 square meter living area, including the option of king or twin beds for couples, families of up to 3 adults or 2 adults and 1 child with en-suite bathrooms with faucets. separate lotus. Full facilities.', 1, 0, 1, 1, 46, 16, 1, 144, 60),
(103, 'Premium Suite', 2, 3, 'City or Ocean', 'After a busy day enjoying water sports or spending the day relaxing by the beach or by the pool, the 71-square-foot comfortable living space, including a separate living room, is the perfect place to stay. Great for relaxing. Bathrooms include separate bathtubs and showers. You will also have complimentary wireless Internet access. Amenities are complete.', 1, 0, 1, 1, 71, 16, 1, 144, 60),
(104, 'Deluxe', 2, 3, 'Ocean', 'With an area of 54 m², Deluxe is a hotel room designed in a modern style, fully integrated with amenities including luxury bed, television, high-speed wifi, private bath... Owning a balcony and door With a view of the sea, this place is an ideal choice for couples, small families or business travelers.', 1, 0, 1, 1, 54, 17, 1, 144, 60),
(105, 'Executive Suite', 2, 3, 'Ocean', 'With an area of 107 m², Executive Suite double bed is a hotel room designed in a modern style, fully integrated with amenities including luxury double bed, television, high-speed wifi, private bath... Owned Balcony and window with open sea view, this place is the ideal choice for couples, small families or business travelers.', 1, 0, 1, 1, 107, 17, 1, 360, 160),
(106, 'Panoramic', 2, 3, 'Ocean', 'With an area of 69 m², Panoramic luxury bed is a hotel room designed in a modern style, fully integrated with amenities including luxury bed, television, high-speed wifi, private bath... Owned Balcony and window with open sea view, this place is the ideal choice for couples, small families or business travelers.', 1, 0, 1, 1, 69, 17, 1, 144, 60),
(107, 'Junior Studio', 2, 3, 'City', 'You can relax comfortably in Junior Studio room with compact and handy design', 1, 0, 1, 1, 20, 18, 1, 144, 60),
(108, 'Superior', 2, 3, 'City', 'With a moderate and quiet space, For guests who are enjoying the trip, the Superior room gives guests traveling or working as if they are in their own home.', 1, 0, 1, 1, 1, 18, 1, 175, 70),
(109, 'Superior with bathtub', 2, 3, 'City', 'Regardless of the purpose of stay, Superior with bathtub will bring all guests the most satisfaction', 1, 0, 1, 1, 30, 18, 1, 144, 60),
(110, 'Premier Deluxe', 2, 3, 'City', 'Premier Deluxe is the most luxurious room in the hotel, equipped with a spacious living room so you can relax comfortably during your stay in Da Nang.', 1, 0, 1, 1, 39, 18, 1, 144, 60),
(111, 'Babylon room', 2, 3, 'Pool', 'Minimalistic, modern and sophisticated, Babylon rooms meet the most essential needs for a complete vacation for families or couples. Covered by the green color from the hanging tree garden to the clear water of the outdoor swimming pool, you will completely immerse yourself in a calm, peaceful space, leaving behind all the pressure from the daily life.', 1, 0, 1, 1, 45, 19, 1, 144, 60),
(112, 'Pool Villa', 2, 3, 'Pool', 'Delicately blending modern architecture with natural materials from bamboo and stone, the pool villa offers a charming, intimate vibe with a private courtyard and swimming pool. Let the open and welcoming design allow natural light to wake you up every day for an endless and emotional adventure.', 1, 0, 1, 1, 100, 19, 1, 144, 60),
(113, 'Garden Pool Villa', 2, 3, 'Garden', 'Covering an area of up to 670m2 with 03 bedrooms, the garden view villa is surrounded by a lush garden with a large swimming pool and a skylight, breaking all boundaries to create harmony between nature and people. This is the perfect place for calmness, connection, and enjoyment. In particular, a private terrace located in the middle of the lake will be an interesting space for sharing and bonding activities.', 1, 1, 1, 1, 670, 19, 1, 410, 250),
(114, 'Beachfront Villa', 2, 3, 'Ocean', 'Having a space of 1000 m2 with 03 bedrooms, a private infinity pool, sun terrace, garden, our sea-view villa also offers direct views of the whispering beach to help visitors have absolute relaxation moments. Without a doubt, this is a worthy destination for family or friend trips where you can enjoy time together in a new, unique, and interesting living space.', 1, 1, 1, 1, 1000, 19, 1, 415, 210),
(115, 'Sunlit Suite', 2, 3, 'Ocean', 'With a minimalist design, towards the comfort of closeness, Sunlit offers the optimal choice for travelers with room types from 1 to 3 bedrooms, suitable for families, groups, or companies. Besides, not only fully equipped with basic amenities, but the apartment is also full of sunlight with a wide view of the sea, mountains, or green golf course, which will make you feel as comfortable as your own home.', 1, 0, 1, 1, 95, 19, 1, 150, 70),
(120, 'Deluxe sup', 2, 3, 'pool', '<p>ahi hihihihi</p>\r\n', 0, 0, 1, 1, 30, 1, 0, 150, 120);

-- --------------------------------------------------------

--
-- Table structure for table `roomtypeimage`
--

CREATE TABLE `roomtypeimage` (
  `roomtypeimageid` int(11) NOT NULL,
  `roomtypeimagename` varchar(50) NOT NULL,
  `roomstypeid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `roomtypeimage`
--

INSERT INTO `roomtypeimage` (`roomtypeimageid`, `roomtypeimagename`, `roomstypeid`) VALUES
(1, 'limg1.1.jpg', 1),
(2, 'limg1.2.jpg', 1),
(3, 'limg1.3.jpg', 1),
(4, 'limg1.4.jpg', 1),
(5, 'limg1.5.jpg', 1),
(6, 'limg1.6.jpg', 1),
(7, 'limg1.7.jpg', 1),
(8, 'limg1.8.jpg', 1),
(9, 'limg1.9.jpg', 1),
(10, 'limg2.1.jpg', 2),
(11, 'limg2.2.jpg', 2),
(12, 'limg2.3.jpg', 2),
(13, 'limg2.4.jpg', 2),
(14, 'limg2.5.jpg', 2),
(15, 'limg2.6.jpg', 2),
(16, 'limg2.7.jpg', 2),
(17, 'limg3.1.jpg', 3),
(18, 'limg3.2.jpg', 3),
(19, 'limg3.3.jpg', 3),
(20, 'limg3.4.jpg', 3),
(21, 'limg3.5.jpg', 3),
(22, 'limg4.1.jpg', 4),
(23, 'limg4.2.jpg', 4),
(24, 'limg4.3.jpg', 4),
(25, 'limg4.4.jpg', 4),
(26, 'limg4.5.jpg', 4),
(27, 'limg5.1.jpg', 5),
(28, 'limg5.2.jpg', 5),
(29, 'limg5.3.jpg', 5),
(30, 'limg5.4.jpg', 5),
(31, 'limg5.5.jpg', 5),
(32, 'limg6.1.jpg', 6),
(33, 'limg6.2.jpg', 6),
(34, 'limg6.3.jpg', 6),
(35, 'limg6.4.jpg', 6),
(36, 'limg6.5.jpg', 6),
(37, 'limg6.6.jpg', 6),
(38, 'limg6.7.jpg', 6),
(39, 'limg7.1.jpg', 7),
(40, 'limg7.2.jpg', 7),
(41, 'limg7.3.jpg', 7),
(42, 'limg7.4.jpg', 7),
(43, 'limg7.5.jpg', 7),
(44, 'limg7.6.jpg', 7),
(45, 'limg7.7.jpg', 7),
(46, 'limg8.1.jpg', 8),
(47, 'limg8.2.jpg', 8),
(48, 'limg8.3.jpg', 8),
(49, 'limg8.4.jpg', 8),
(50, 'limg9.1.jpg', 9),
(51, 'limg9.2.jpg', 9),
(52, 'limg9.3.jpg', 9),
(53, 'limg9.4.jpg', 9),
(54, 'limg9.5.jpg', 9),
(55, 'limg10.1.jpg', 10),
(56, 'limg10.2.jpg', 10),
(57, 'limg10.3.jpg', 10),
(58, 'limg10.4.jpg', 10),
(59, 'limg11.1.jpg', 11),
(60, 'limg11.2.jpg', 11),
(61, 'limg11.3.jpg', 11),
(62, 'limg11.4.jpg', 11),
(63, 'limg11.5.jpg', 11),
(64, 'limg11.6.jpg', 11),
(65, 'limg12.1.jpg', 12),
(66, 'limg12.2.jpg', 12),
(67, 'limg12.3.jpg', 12),
(68, 'limg12.4.jpg', 12),
(69, 'limg13.1.jpg', 13),
(70, 'limg13.2.jpg', 13),
(71, 'limg13.3.jpg', 13),
(72, 'limg14.1.jpg', 14),
(73, 'limg14.2.jpg', 14),
(74, 'limg14.3.jpg', 14),
(75, 'limg14.4.jpg', 14),
(76, 'limg15.1.jpg', 15),
(77, 'limg15.2.jpg', 15),
(78, 'limg15.3.jpg', 15),
(79, 'limg15.4.jpg', 15),
(80, 'limg15.5.jpg', 15),
(81, 'limg16.1.jpg', 16),
(82, 'limg16.2.jpg', 16),
(83, 'limg16.3.jpg', 16),
(84, 'limg16.4.jpg', 16),
(85, 'limg16.5.jpg', 16),
(86, 'limg17.1.jpg', 17),
(87, 'limg17.2.jpg', 17),
(88, 'limg17.3.jpg', 17),
(89, 'limg17.4.jpg', 17),
(90, 'limg18.1.jpg', 18),
(91, 'limg18.2.jpg', 18),
(92, 'limg18.3.jpg', 18),
(93, 'limg18.4.jpg', 18),
(94, 'limg19.1.png', 19),
(95, 'limg19.2.jpg', 19),
(96, 'limg19.3.jpg', 19),
(97, 'limg20.1.jpg', 20),
(98, 'limg20.2.jpg', 20),
(99, 'limg20.3.jpg', 20),
(100, 'limg20.4.jpg', 20),
(101, 'limg21.1.jpg', 21),
(102, 'limg21.2.jpg', 21),
(103, 'limg21.3.jpg', 21),
(104, 'limg21.4.jpg', 21),
(105, 'limg22.1.jpg', 22),
(106, 'limg22.2.jpg', 22),
(107, 'limg22.3.jpg', 22),
(108, 'limg22.4.jpg', 22),
(109, 'limg22.5.jpg', 22),
(110, 'limg22.6.jpg', 22),
(111, 'limg22.7.jpg', 22),
(112, 'limg23.1.jpg', 23),
(113, 'limg23.2.jpg', 23),
(114, 'limg23.3.jpg', 23),
(115, 'limg23.4.jpg', 23),
(116, 'limg23.5.jpg', 23),
(117, 'limg23.6.jpg', 23),
(118, 'limg24.1.jpg', 24),
(119, 'limg24.2.jpg', 24),
(120, 'limg24.3.jpg', 24),
(121, 'limg24.4.jpg', 24),
(122, 'limg25.1.jpg', 25),
(123, 'limg25.2.jpg', 25),
(124, 'limg25.3.jpg', 25),
(125, 'limg25.4.jpg', 25),
(126, 'limg25.5.jpg', 25),
(127, 'limg26.1.jpg', 26),
(128, 'limg26.2.jpg', 26),
(129, 'limg26.3.jpg', 26),
(130, 'limg26.4.jpg', 26),
(131, 'limg26.5.jpg', 26),
(132, 'limg26.6.jpg', 26),
(133, 'limg26.7.jpg', 26),
(134, 'limg27.1.jpg', 27),
(135, 'limg27.2.jpg', 27),
(136, 'limg27.3.jpg', 27),
(137, 'limg27.4.jpg', 27),
(138, 'limg28.1.jpg', 28),
(139, 'limg28.2.jpg', 28),
(140, 'limg28.3.jpg', 28),
(141, 'limg28.4.jpg', 28),
(142, 'limg28.5.jpg', 28),
(143, 'limg29.1.jpg', 29),
(144, 'limg29.2.jpg', 29),
(145, 'limg29.3.jpg', 29),
(146, 'limg29.4.jpg', 29),
(147, 'limg30.1.jpg', 30),
(148, 'limg30.2.jpg', 30),
(149, 'limg30.3.jpg', 30),
(150, 'limg30.4.jpg', 30),
(151, 'limg30.5.jpg', 30),
(152, 'limg31.1.jpg', 31),
(153, 'limg31.2.jpg', 31),
(154, 'limg31.3.jpg', 31),
(155, 'limg31.4.jpg', 31),
(156, 'limg31.5.jpg', 31),
(157, 'limg31.6.jpg', 31),
(158, 'limg31.7.jpg', 31),
(159, 'limg32.1.jpg', 32),
(160, 'limg32.2.jpg', 32),
(161, 'limg32.3.jpg', 32),
(162, 'limg32.4.jpg', 32),
(163, 'limg32.5.jpg', 32),
(164, 'limg33.1.jpg', 33),
(165, 'limg33.2.jpg', 33),
(166, 'limg33.3.jpg', 33),
(167, 'limg33.4.jpg', 33),
(168, 'limg33.5.jpg', 33),
(169, 'limg34.1.jpg', 34),
(170, 'limg34.2.jpg', 34),
(171, 'limg34.3.jpg', 34),
(172, 'limg35.1.jpg', 35),
(173, 'limg35.2.jpg', 35),
(174, 'limg35.3.jpg', 35),
(175, 'limg35.4.jpg', 35),
(176, 'limg36.1.jpg', 36),
(177, 'limg36.2.jpg', 36),
(178, 'limg36.3.jpg', 36),
(179, 'limg36.4.jpg', 36),
(180, 'limg37.1.jpg', 37),
(181, 'limg37.2.jpg', 37),
(182, 'limg37.3.jpg', 37),
(183, 'limg38.1.jpg', 38),
(184, 'limg38.2.jpg', 38),
(185, 'limg38.3.jpg', 38),
(186, 'limg38.4.jpg', 38),
(187, 'limg38.5.jpg', 38),
(188, 'limg39.1.jpg', 39),
(189, 'limg39.2.jpg', 39),
(190, 'limg39.3.jpg', 39),
(191, 'limg39.4.jpg', 39),
(192, 'limg40.1.jpg', 40),
(193, 'limg40.2.jpg', 40),
(194, 'limg40.3.jpg', 40),
(195, 'limg40.4.jpg', 40),
(196, 'limg41.1.jpg', 41),
(197, 'limg41.2.jpg', 41),
(198, 'limg41.3.jpg', 41),
(199, 'limg41.4.jpg', 41),
(200, 'limg42.1.jpg', 42),
(201, 'limg42.2.jpg', 42),
(202, 'limg42.3.jpg', 42),
(203, 'limg43.1.jpg', 43),
(204, 'limg43.2.jpg', 43),
(205, 'limg43.3.jpg', 43),
(206, 'limg43.4.jpg', 43),
(207, 'limg44.1.jpg', 44),
(208, 'limg44.2.jpg', 44),
(209, 'limg44.3.jpg', 44),
(210, 'limg44.4.jpg', 44),
(211, 'limg44.5.jpg', 44),
(212, 'limg44.6.jpg', 44),
(213, 'limg45.1.jpg', 45),
(214, 'limg45.2.jpg', 45),
(215, 'limg45.3.jpg', 45),
(216, 'limg45.4.jpg', 45),
(217, 'limg45.5.jpg', 45),
(218, 'limg46.1.jpg', 46),
(219, 'limg46.2.jpg', 46),
(220, 'limg46.3.jpg', 46),
(221, 'limg46.4.jpg', 46),
(222, 'limg46.5.jpg', 46),
(223, 'limg46.6.jpg', 46),
(224, 'limg46.7.jpg', 46),
(225, 'limg47.1.jpg', 47),
(226, 'limg47.2.jpg', 47),
(227, 'limg47.3.jpg', 47),
(228, 'limg47.4.jpg', 47),
(229, 'limg47.5.jpg', 47),
(230, 'limg48.1.jpg', 48),
(231, 'limg48.2.jpg', 48),
(232, 'limg48.3.jpg', 48),
(233, 'limg48.4.jpg', 48),
(234, 'limg48.5.jpg', 48),
(235, 'limg49.1.jpg', 49),
(236, 'limg49.2.jpg', 49),
(237, 'limg49.3.jpg', 49),
(238, 'limg49.4.jpg', 49),
(239, 'limg49.5.jpg', 49),
(240, 'limg50.1.jpg', 50),
(241, 'limg50.2.jpg', 50),
(242, 'limg50.3.jpg', 50),
(243, 'limg50.4.jpg', 50),
(244, 'limg50.5.jpg', 50),
(245, 'limg51.1.jpg', 51),
(246, 'limg51.2.jpg', 51),
(247, 'limg51.3.jpg', 51),
(248, 'limg51.4.jpg', 51),
(249, 'limg52.1.jpg', 52),
(250, 'limg52.2.jpg', 52),
(251, 'limg52.3.jpg', 52),
(252, 'limg52.4.jpg', 52),
(253, 'limg52.5.jpg', 52),
(254, 'limg53.1.jpg', 53),
(255, 'limg53.2.jpg', 53),
(256, 'limg53.3.jpg', 53),
(257, 'limg53.4.jpg', 53),
(258, 'limg53.5.jpg', 53),
(259, 'limg53.6.jpg', 53),
(260, 'limg54.1.jpg', 54),
(261, 'limg54.2.jpg', 54),
(262, 'limg54.3.jpg', 54),
(263, 'limg54.4.jpg', 54),
(264, 'limg54.5.jpg', 54),
(265, 'limg55.1.jpg', 55),
(266, 'limg55.2.jpg', 55),
(267, 'limg55.3.jpg', 55),
(268, 'limg55.4.jpg', 55),
(269, 'limg55.5.jpg', 55),
(270, 'limg56.1.jpg', 56),
(271, 'limg56.2.jpg', 56),
(272, 'limg56.3.jpg', 56),
(273, 'limg56.4.jpg', 56),
(274, 'limg57.1.jpg', 57),
(275, 'limg57.2.jpg', 57),
(276, 'limg57.3.jpg', 57),
(277, 'limg57.4.jpg', 57),
(278, 'limg58.1.jpg', 58),
(279, 'limg58.2.jpg', 58),
(280, 'limg58.3.jpg', 58),
(281, 'limg58.4.jpg', 58),
(282, 'limg58.5.jpg', 58),
(283, 'limg58.6.jpg', 58),
(284, 'limg59.1.jpg', 59),
(285, 'limg59.2.jpg', 59),
(286, 'limg59.3.jpg', 59),
(287, 'limg59.4.jpg', 59),
(288, 'limg60.1.jpg', 60),
(289, 'limg60.2.jpg', 60),
(290, 'limg60.3.jpg', 60),
(291, 'limg60.4.jpg', 60),
(292, 'limg60.5.jpg', 60),
(293, 'limg60.6.jpg', 60),
(294, 'limg61.1.jpg', 61),
(295, 'limg61.2.jpg', 61),
(296, 'limg61.3.jpg', 61),
(297, 'limg61.4.jpg', 61),
(298, 'limg61.5.jpg', 61),
(299, 'limg61.6.jpg', 61),
(300, 'limg62.1.jpg', 62),
(301, 'limg62.2.jpg', 62),
(302, 'limg62.3.jpg', 62),
(303, 'limg62.4.jpg', 62),
(304, 'limg62.5.jpg', 62),
(305, 'limg63.1.jpg', 63),
(306, 'limg63.2.jpg', 63),
(307, 'limg63.3.jpg', 63),
(308, 'limg63.4.jpg', 63),
(309, 'limg64.1.jpg', 64),
(310, 'limg64.2.jpg', 64),
(311, 'limg64.3.jpg', 64),
(312, 'limg64.4.jpg', 64),
(313, 'limg64.5.jpg', 64),
(314, 'limg65.1.jpg', 65),
(315, 'limg65.2.jpg', 65),
(316, 'limg65.3.jpg', 65),
(317, 'limg65.4.jpg', 65),
(318, 'limg65.5.jpg', 65),
(319, 'limg66.1.jpg', 66),
(320, 'limg66.2.jpg', 66),
(321, 'limg66.3.jpg', 66),
(322, 'limg66.4.jpg', 66),
(323, 'limg66.5.jpg', 66),
(324, 'limg67.1.jpg', 67),
(325, 'limg67.2.jpg', 67),
(326, 'limg67.3.jpg', 67),
(327, 'limg67.4.jpg', 67),
(328, 'limg68.1.jpg', 68),
(329, 'limg68.2.jpg', 68),
(330, 'limg68.3.jpg', 68),
(331, 'limg68.4.jpg', 68),
(332, 'limg68.5.jpg', 68),
(333, 'limg69.1.jpg', 69),
(334, 'limg69.2.jpg', 69),
(335, 'limg69.3.jpg', 69),
(336, 'limg69.4.jpg', 69),
(337, 'limg70.1.jpg', 70),
(338, 'limg70.2.jpg', 70),
(339, 'limg70.3.jpg', 70),
(340, 'limg70.4.jpg', 70),
(341, 'limg71.1.jpg', 71),
(342, 'limg71.2.jpg', 71),
(343, 'limg71.3.jpg', 71),
(344, 'limg71.4.jpg', 71),
(345, 'limg71.5.jpg', 71),
(346, 'dimg72.1.jpg', 72),
(347, 'dimg72.2.jpg', 72),
(348, 'dimg72.3.jpg', 72),
(349, 'dimg72.4.jpg', 72),
(350, 'dimg73.1.jpg', 73),
(351, 'dimg73.2.jpg', 73),
(352, 'dimg73.3.jpg', 73),
(353, 'dimg73.4.jpg', 73),
(354, 'dimg73.5.jpg', 73),
(355, 'dimg74.1.jpg', 74),
(356, 'dimg74.2.jpg', 74),
(357, 'dimg74.3.jpg', 74),
(358, 'dimg75.1.jpg', 75),
(359, 'dimg75.2.jpg', 75),
(360, 'dimg76.1.jpg', 76),
(361, 'dimg76.2.jpg', 76),
(362, 'dimg76.3.jpg', 76),
(363, 'dimg77.1.jpg', 77),
(364, 'dimg77.2.jpg', 77),
(365, 'dimg77.3.jpg', 77),
(366, 'dimg77.4.jpg', 77),
(367, 'dimg77.5.jpg', 77),
(368, 'dimg77.6.jpg', 77),
(369, 'dimg77.7.jpg', 77),
(370, 'dimg77.8.jpg', 77),
(371, 'dimg77.9.jpg', 77),
(372, 'dimg77.10.jpg', 77),
(373, 'dimg78.1.jpg', 78),
(374, 'dimg78.2.jpg', 78),
(375, 'dimg78.3.jpg', 78),
(376, 'dimg78.4.jpg', 78),
(377, 'dimg78.5.jpg', 78),
(378, 'dimg78.6.jpg', 78),
(379, 'dimg78.7.jpg', 78),
(380, 'dimg79.1.jpg', 79),
(381, 'dimg79.2.jpg', 79),
(382, 'dimg79.3.jpg', 79),
(383, 'dimg79.4.jpg', 79),
(384, 'dimg79.5.jpg', 79),
(385, 'dimg79.6.jpg', 79),
(386, 'dimg80.1.jpg', 80),
(387, 'dimg80.2.jpg', 80),
(388, 'dimg80.3.jpg', 80),
(389, 'dimg80.4.jpg', 80),
(390, 'dimg80.5.jpg', 80),
(391, 'dimg80.6.jpg', 80),
(392, 'dimg80.7.jpg', 80),
(393, 'dimg81.1.jpg', 81),
(394, 'dimg81.2.jpg', 81),
(395, 'dimg81.3.jpg', 81),
(396, 'dimg81.4.jpg', 81),
(397, 'dimg81.5.jpg', 81),
(398, 'dimg81.6.jpg', 81),
(399, 'dimg81.7.jpg', 81),
(400, 'dimg81.8.jpg', 81),
(401, 'dimg81.9.jpg', 81),
(402, 'dimg82.1.jpg', 82),
(403, 'dimg82.2.jpg', 82),
(404, 'dimg82.3.jpg', 82),
(405, 'dimg82.4.jpg', 82),
(406, 'dimg82.5.jpg', 82),
(407, 'dimg82.6.jpg', 82),
(408, 'dimg83.1.jpg', 83),
(409, 'dimg83.2.jpg', 83),
(410, 'dimg83.3.jpg', 83),
(411, 'dimg83.4.jpg', 83),
(412, 'dimg83.5.jpg', 83),
(413, 'dimg83.6.jpg', 83),
(414, 'dimg84.1.jpg', 84),
(415, 'dimg84.2.jpg', 84),
(416, 'dimg84.3.jpg', 84),
(417, 'dimg84.4.jpg', 84),
(418, 'dimg84.5.jpg', 84),
(419, 'dimg84.6.jpg', 84),
(420, 'dimg84.7.jpg', 84),
(421, 'dimg84.8.jpg', 84),
(422, 'dimg84.9.jpg', 84),
(423, 'dimg84.9.jpg', 84),
(424, 'dimg84.10.jpg', 84),
(425, 'dimg85.1.jpg', 85),
(426, 'dimg85.2.jpg', 85),
(427, 'dimg85.3.jpg', 85),
(428, 'dimg85.4.jpg', 85),
(429, 'dimg85.5.jpg', 85),
(430, 'dimg85.6.jpg', 85),
(431, 'dimg85.7.jpg', 85),
(432, 'dimg85.8.jpg', 85),
(433, 'dimg85.9.jpg', 85),
(434, 'dimg85.9.jpg', 85),
(435, 'dimg86.1.jpg', 86),
(436, 'dimg86.2.jpg', 86),
(437, 'dimg86.3.jpg', 86),
(438, 'dimg86.4.jpg', 86),
(439, 'dimg86.5.jpg', 86),
(440, 'dimg86.6.jpg', 86),
(441, 'dimg87.1.jpg', 87),
(442, 'dimg87.2.jpg', 87),
(443, 'dimg87.3.jpg', 87),
(444, 'dimg87.4.jpg', 87),
(445, 'dimg88.1.jpg', 88),
(446, 'dimg88.2.jpg', 88),
(447, 'dimg88.3.jpg', 88),
(448, 'dimg88.4.jpg', 88),
(449, 'dimg88.5.jpg', 88),
(450, 'dimg89.1.jpg', 89),
(451, 'dimg89.2.jpg', 89),
(452, 'dimg89.3.jpg', 89),
(453, 'dimg89.4.jpg', 89),
(454, 'dimg89.5.jpg', 89),
(455, 'dimg90.1.jpg', 90),
(456, 'dimg90.2.jpg', 90),
(457, 'dimg90.3.jpg', 90),
(458, 'dimg90.4.jpg', 90),
(459, 'dimg90.5.jpg', 90),
(460, 'dimg91.1.jpg', 91),
(461, 'dimg91.2.jpg', 91),
(462, 'dimg91.3.jpg', 91),
(463, 'dimg92.1.jpg', 92),
(464, 'dimg92.2.jpg', 92),
(465, 'dimg92.3.jpg', 92),
(466, 'dimg92.4.jpg', 92),
(467, 'dimg92.5.jpg', 92),
(468, 'dimg92.6.jpg', 92),
(469, 'dimg93.1.jpg', 93),
(470, 'dimg93.2.jpg', 93),
(471, 'dimg93.3.jpg', 93),
(472, 'dimg94.1.jpg', 94),
(473, 'dimg94.2.jpg', 94),
(474, 'dimg94.3.jpg', 94),
(475, 'dimg94.4.jpg', 94),
(476, 'dimg94.5.jpg', 94),
(477, 'dimg95.1.jpg', 95),
(478, 'dimg95.2.jpg', 95),
(479, 'dimg95.3.jpg', 95),
(480, 'dimg95.4.jpg', 95),
(481, 'dimg95.5.jpg', 95),
(482, 'dimg96.1.jpg', 96),
(483, 'dimg96.2.jpg', 96),
(484, 'dimg96.3.jpg', 96),
(485, 'dimg96.4.jpg', 96),
(486, 'dimg96.5.jpg', 96),
(487, 'dimg97.1.jpg', 97),
(488, 'dimg97.2.jpg', 97),
(489, 'dimg97.3.jpg', 97),
(490, 'dimg97.4.jpg', 97),
(491, 'dimg97.5.jpg', 97),
(492, 'dimg98.1.jpg', 98),
(493, 'dimg98.2.jpg', 98),
(494, 'dimg98.3.jpg', 98),
(495, 'dimg98.4.jpg', 98),
(496, 'dimg98.5.jpg', 98),
(497, 'dimg99.1.jpg', 99),
(498, 'dimg99.2.jpg', 99),
(499, 'dimg99.3.jpg', 99),
(500, 'dimg99.4.jpg', 99),
(501, 'dimg99.5.jpg', 99),
(502, 'dimg99.6.jpg', 99),
(503, 'dimg100.1.jpg', 100),
(504, 'dimg100.2.jpg', 100),
(505, 'dimg100.3.jpg', 100),
(506, 'dimg100.4.jpg', 100),
(507, 'dimg100.5.jpg', 100),
(508, 'dimg101.1.jpg', 101),
(509, 'dimg101.2.jpg', 101),
(510, 'dimg101.3.jpg', 101),
(511, 'dimg101.4.jpg', 101),
(512, 'dimg102.1.jpg', 102),
(513, 'dimg102.2.jpg', 102),
(514, 'dimg102.3.jpg', 102),
(515, 'dimg102.4.jpg', 102),
(516, 'dimg102.5.jpg', 102),
(517, 'dimg102.6.jpg', 102),
(518, 'dimg103.1.jpg', 103),
(519, 'dimg103.2.jpg', 103),
(520, 'dimg103.3.jpg', 103),
(521, 'dimg103.4.jpg', 103),
(522, 'dimg103.5.jpg', 103),
(523, 'dimg103.6.jpg', 103),
(524, 'dimg104.1.jpg', 104),
(525, 'dimg104.2.jpg', 104),
(526, 'dimg104.3.jpg', 104),
(527, 'dimg104.4.jpg', 104),
(528, 'dimg105.1.jpg', 105),
(529, 'dimg105.2.jpg', 105),
(530, 'dimg105.3.jpg', 105),
(531, 'dimg105.4.jpg', 105),
(532, 'dimg106.1.jpg', 106),
(533, 'dimg106.2.jpg', 106),
(534, 'dimg106.3.jpg', 106),
(535, 'dimg107.1.jpg', 107),
(536, 'dimg107.2.jpg', 107),
(537, 'dimg107.3.jpg', 107),
(538, 'dimg107.4.jpg', 107),
(539, 'dimg107.5.jpg', 107),
(540, 'dimg107.6.jpg', 107),
(541, 'dimg108.1.jpg', 108),
(542, 'dimg108.2.jpg', 108),
(543, 'dimg108.3.jpg', 108),
(544, 'dimg108.4.jpg', 108),
(545, 'dimg108.4.jpg', 108),
(546, 'dimg108.5.jpg', 108),
(547, 'dimg108.6.jpg', 108),
(548, 'dimg108.7.jpg', 108),
(555, 'dimg109.1.jpg', 109),
(556, 'dimg109.2.jpg', 109),
(557, 'dimg109.3.jpg', 109),
(558, 'dimg109.4.jpg', 109),
(559, 'dimg110.1.jpg', 110),
(560, 'dimg110.2.jpg', 110),
(561, 'dimg110.3.jpg', 110),
(562, 'dimg110.4.jpg', 110),
(563, 'dimg110.5.jpg', 110),
(564, 'dimg110.6.jpg', 110),
(565, 'dimg110.7.jpg', 110),
(566, 'dimg111.1.jpg', 111),
(567, 'dimg111.2.jpg', 111),
(568, 'dimg111.3.jpg', 111),
(569, 'dimg111.4.jpg', 111),
(570, 'dimg111.5.jpg', 111),
(571, 'dimg112.1.jpg', 112),
(572, 'dimg112.2.jpg', 112),
(573, 'dimg112.3.jpg', 112),
(574, 'dimg112.4.jpg', 112),
(575, 'dimg112.5.jpg', 112),
(576, 'dimg112.6.jpg', 112),
(577, 'dimg113.1.jpg', 113),
(578, 'dimg113.2.jpg', 113),
(579, 'dimg113.3.jpg', 113),
(580, 'dimg113.4.jpg', 113),
(581, 'dimg113.5.jpg', 113),
(582, 'dimg113.6.jpg', 113),
(583, 'dimg113.7.jpg', 113),
(584, 'dimg114.1.jpg', 114),
(585, 'dimg114.2.jpg', 114),
(586, 'dimg114.3.jpg', 114),
(587, 'dimg114.4.jpg', 114),
(588, 'dimg114.5.jpg', 114),
(589, 'dimg114.6.jpg', 114),
(590, 'dimg115.1.jpg', 115),
(591, 'dimg115.2.jpg', 115),
(592, 'dimg115.3.jpg', 115),
(593, 'dimg115.4.jpg', 115),
(594, 'dimg115.5.jpg', 115),
(595, 'dimg115.6.jpg', 115),
(596, 'dimg115.7.jpg', 115),
(597, 'dimg115.8.jpg', 115),
(608, 'd07aa6f97a9a46f48a611a8ed55572af.jpg', 120),
(610, 'c0e042e6a66c4b6d8bd47d4aae7d9574.jpg', 120),
(612, '49777a8d0f5e4f93916d448f38dabe95.jpg', 120),
(614, 'c017b0614a774135aed3cd3beaef5bbe.jpg', 120),
(615, '3fe517ca1b364ab98b8ce7876ba8696a.jpg', 1);

-- --------------------------------------------------------

--
-- Table structure for table `ward`
--

CREATE TABLE `ward` (
  `wardid` int(11) NOT NULL,
  `wardname` varchar(30) NOT NULL,
  `cityid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `ward`
--

INSERT INTO `ward` (`wardid`, `wardname`, `cityid`) VALUES
(1, 'Ben Thanh', 1),
(2, 'Ben Nghe', 1),
(3, 'Vo Thi Sau', 2),
(4, 'Ward 6', 2),
(5, 'Quang An', 3),
(6, 'Phu Thuong', 3),
(7, 'Trang Tien', 4),
(8, 'Hang Trong', 4),
(9, 'Hoa Hai', 5),
(10, 'Khue My', 5),
(11, 'Nam Duong', 6),
(12, 'Thach Thang', 6),
(13, 'Vinh Nguyen', 7),
(14, 'Xuong Huan', 7),
(15, 'Loc Tho', 7),
(16, 'Duong To', 8),
(17, 'Ganh Dau', 8),
(18, 'Cua Duong', 8),
(19, 'Mui Ne', 9),
(20, 'Phu Thuy', 9),
(21, 'Tien Thanh', 9),
(22, 'Ham Thuan Nam', 9);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `account`
--
ALTER TABLE `account`
  ADD PRIMARY KEY (`accountid`),
  ADD KEY `accounttypeid` (`accounttypeid`),
  ADD KEY `hotelid` (`hotelid`);

--
-- Indexes for table `accounttype`
--
ALTER TABLE `accounttype`
  ADD PRIMARY KEY (`accounttypeid`);

--
-- Indexes for table `addonservice`
--
ALTER TABLE `addonservice`
  ADD PRIMARY KEY (`addonserviceid`),
  ADD KEY `hotelid` (`hotelid`);

--
-- Indexes for table `city`
--
ALTER TABLE `city`
  ADD PRIMARY KEY (`cityid`),
  ADD KEY `provinceid` (`provinceid`);

--
-- Indexes for table `contractinfo`
--
ALTER TABLE `contractinfo`
  ADD PRIMARY KEY (`contractid`),
  ADD KEY `accountid` (`hoteltid`);

--
-- Indexes for table `contractinforoomtype`
--
ALTER TABLE `contractinforoomtype`
  ADD PRIMARY KEY (`contractid`,`roomtypeid`),
  ADD KEY `roomtypeid` (`roomtypeid`);

--
-- Indexes for table `hotel`
--
ALTER TABLE `hotel`
  ADD PRIMARY KEY (`hotelid`),
  ADD KEY `address` (`address`);

--
-- Indexes for table `hotelimage`
--
ALTER TABLE `hotelimage`
  ADD PRIMARY KEY (`imagehotelid`),
  ADD KEY `hotelid` (`hotelid`);

--
-- Indexes for table `hotelseason`
--
ALTER TABLE `hotelseason`
  ADD PRIMARY KEY (`hotelseasonid`),
  ADD KEY `hotelid` (`hotelid`);

--
-- Indexes for table `policies`
--
ALTER TABLE `policies`
  ADD PRIMARY KEY (`policiesid`),
  ADD KEY `roomstypeid` (`roomstypeid`);

--
-- Indexes for table `province`
--
ALTER TABLE `province`
  ADD PRIMARY KEY (`provinceid`);

--
-- Indexes for table `reservation`
--
ALTER TABLE `reservation`
  ADD PRIMARY KEY (`reservationid`),
  ADD KEY `guestid` (`guestid`),
  ADD KEY `roomstypeid` (`roomstypeid`),
  ADD KEY `contactid` (`contractid`),
  ADD KEY `related` (`related`);

--
-- Indexes for table `reservationaddonservice`
--
ALTER TABLE `reservationaddonservice`
  ADD PRIMARY KEY (`reservationaddonserviceid`),
  ADD KEY `reservationroomdetailsid` (`reservationroomdetailsid`),
  ADD KEY `addonserviceid` (`addonserviceid`);

--
-- Indexes for table `reservationguestinfo`
--
ALTER TABLE `reservationguestinfo`
  ADD PRIMARY KEY (`reservationguestinfoid`),
  ADD KEY `reservationroomdetailsid` (`reservationroomdetailsid`);

--
-- Indexes for table `reservationroomdetails`
--
ALTER TABLE `reservationroomdetails`
  ADD PRIMARY KEY (`reservationroomdetailsid`),
  ADD KEY `reservationid` (`reservationid`),
  ADD KEY `roomid` (`roomid`);

--
-- Indexes for table `rooms`
--
ALTER TABLE `rooms`
  ADD PRIMARY KEY (`roomid`),
  ADD KEY `roomstypeid` (`roomstypeid`);

--
-- Indexes for table `roomtype`
--
ALTER TABLE `roomtype`
  ADD PRIMARY KEY (`roomstypeid`),
  ADD KEY `hotelid` (`hotelid`);

--
-- Indexes for table `roomtypeimage`
--
ALTER TABLE `roomtypeimage`
  ADD PRIMARY KEY (`roomtypeimageid`),
  ADD KEY `roomstypeid` (`roomstypeid`);

--
-- Indexes for table `ward`
--
ALTER TABLE `ward`
  ADD PRIMARY KEY (`wardid`),
  ADD KEY `cityid` (`cityid`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `account`
--
ALTER TABLE `account`
  MODIFY `accountid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=54;

--
-- AUTO_INCREMENT for table `accounttype`
--
ALTER TABLE `accounttype`
  MODIFY `accounttypeid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `addonservice`
--
ALTER TABLE `addonservice`
  MODIFY `addonserviceid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=200;

--
-- AUTO_INCREMENT for table `city`
--
ALTER TABLE `city`
  MODIFY `cityid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `contractinfo`
--
ALTER TABLE `contractinfo`
  MODIFY `contractid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `hotel`
--
ALTER TABLE `hotel`
  MODIFY `hotelid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `hotelimage`
--
ALTER TABLE `hotelimage`
  MODIFY `imagehotelid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=189;

--
-- AUTO_INCREMENT for table `hotelseason`
--
ALTER TABLE `hotelseason`
  MODIFY `hotelseasonid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=83;

--
-- AUTO_INCREMENT for table `policies`
--
ALTER TABLE `policies`
  MODIFY `policiesid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=149;

--
-- AUTO_INCREMENT for table `province`
--
ALTER TABLE `province`
  MODIFY `provinceid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `reservation`
--
ALTER TABLE `reservation`
  MODIFY `reservationid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `reservationaddonservice`
--
ALTER TABLE `reservationaddonservice`
  MODIFY `reservationaddonserviceid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `reservationguestinfo`
--
ALTER TABLE `reservationguestinfo`
  MODIFY `reservationguestinfoid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `reservationroomdetails`
--
ALTER TABLE `reservationroomdetails`
  MODIFY `reservationroomdetailsid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=582;

--
-- AUTO_INCREMENT for table `rooms`
--
ALTER TABLE `rooms`
  MODIFY `roomid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=376;

--
-- AUTO_INCREMENT for table `roomtype`
--
ALTER TABLE `roomtype`
  MODIFY `roomstypeid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=121;

--
-- AUTO_INCREMENT for table `roomtypeimage`
--
ALTER TABLE `roomtypeimage`
  MODIFY `roomtypeimageid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=616;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `account`
--
ALTER TABLE `account`
  ADD CONSTRAINT `account_ibfk_1` FOREIGN KEY (`accounttypeid`) REFERENCES `accounttype` (`accounttypeid`),
  ADD CONSTRAINT `account_ibfk_2` FOREIGN KEY (`hotelid`) REFERENCES `hotel` (`hotelid`);

--
-- Constraints for table `addonservice`
--
ALTER TABLE `addonservice`
  ADD CONSTRAINT `addonservice_ibfk_1` FOREIGN KEY (`hotelid`) REFERENCES `hotel` (`hotelid`);

--
-- Constraints for table `city`
--
ALTER TABLE `city`
  ADD CONSTRAINT `city_ibfk_1` FOREIGN KEY (`provinceid`) REFERENCES `province` (`provinceid`);

--
-- Constraints for table `contractinfo`
--
ALTER TABLE `contractinfo`
  ADD CONSTRAINT `contractinfo_ibfk_1` FOREIGN KEY (`hoteltid`) REFERENCES `hotel` (`hotelid`);

--
-- Constraints for table `contractinforoomtype`
--
ALTER TABLE `contractinforoomtype`
  ADD CONSTRAINT `contractinforoomtype_ibfk_1` FOREIGN KEY (`contractid`) REFERENCES `contractinfo` (`contractid`),
  ADD CONSTRAINT `contractinforoomtype_ibfk_2` FOREIGN KEY (`roomtypeid`) REFERENCES `roomtype` (`roomstypeid`);

--
-- Constraints for table `hotel`
--
ALTER TABLE `hotel`
  ADD CONSTRAINT `hotel_ibfk_1` FOREIGN KEY (`address`) REFERENCES `ward` (`wardid`);

--
-- Constraints for table `hotelimage`
--
ALTER TABLE `hotelimage`
  ADD CONSTRAINT `hotelimage_ibfk_1` FOREIGN KEY (`hotelid`) REFERENCES `hotel` (`hotelid`);

--
-- Constraints for table `hotelseason`
--
ALTER TABLE `hotelseason`
  ADD CONSTRAINT `hotelseason_ibfk_1` FOREIGN KEY (`hotelid`) REFERENCES `hotel` (`hotelid`);

--
-- Constraints for table `policies`
--
ALTER TABLE `policies`
  ADD CONSTRAINT `policies_ibfk_1` FOREIGN KEY (`roomstypeid`) REFERENCES `roomtype` (`roomstypeid`);

--
-- Constraints for table `reservation`
--
ALTER TABLE `reservation`
  ADD CONSTRAINT `reservation_ibfk_1` FOREIGN KEY (`contractid`) REFERENCES `contractinfo` (`contractid`),
  ADD CONSTRAINT `reservation_ibfk_2` FOREIGN KEY (`guestid`) REFERENCES `account` (`accountid`),
  ADD CONSTRAINT `reservation_ibfk_3` FOREIGN KEY (`roomstypeid`) REFERENCES `roomtype` (`roomstypeid`),
  ADD CONSTRAINT `reservation_ibfk_4` FOREIGN KEY (`related`) REFERENCES `reservation` (`reservationid`);

--
-- Constraints for table `reservationaddonservice`
--
ALTER TABLE `reservationaddonservice`
  ADD CONSTRAINT `reservationaddonservice_ibfk_1` FOREIGN KEY (`addonserviceid`) REFERENCES `addonservice` (`addonserviceid`),
  ADD CONSTRAINT `reservationaddonservice_ibfk_2` FOREIGN KEY (`reservationroomdetailsid`) REFERENCES `reservationroomdetails` (`reservationroomdetailsid`);

--
-- Constraints for table `reservationguestinfo`
--
ALTER TABLE `reservationguestinfo`
  ADD CONSTRAINT `reservationguestinfo_ibfk_1` FOREIGN KEY (`reservationroomdetailsid`) REFERENCES `reservationroomdetails` (`reservationroomdetailsid`);

--
-- Constraints for table `reservationroomdetails`
--
ALTER TABLE `reservationroomdetails`
  ADD CONSTRAINT `reservationroomdetails_ibfk_2` FOREIGN KEY (`roomid`) REFERENCES `rooms` (`roomid`),
  ADD CONSTRAINT `reservationroomdetails_ibfk_3` FOREIGN KEY (`reservationid`) REFERENCES `reservation` (`reservationid`);

--
-- Constraints for table `rooms`
--
ALTER TABLE `rooms`
  ADD CONSTRAINT `rooms_ibfk_1` FOREIGN KEY (`roomstypeid`) REFERENCES `roomtype` (`roomstypeid`);

--
-- Constraints for table `roomtype`
--
ALTER TABLE `roomtype`
  ADD CONSTRAINT `roomtype_ibfk_1` FOREIGN KEY (`hotelid`) REFERENCES `hotel` (`hotelid`);

--
-- Constraints for table `roomtypeimage`
--
ALTER TABLE `roomtypeimage`
  ADD CONSTRAINT `roomtypeimage_ibfk_1` FOREIGN KEY (`roomstypeid`) REFERENCES `roomtype` (`roomstypeid`);

--
-- Constraints for table `ward`
--
ALTER TABLE `ward`
  ADD CONSTRAINT `ward_ibfk_1` FOREIGN KEY (`cityid`) REFERENCES `city` (`cityid`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
