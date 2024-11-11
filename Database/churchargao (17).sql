-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 01, 2024 at 03:17 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `churchargao`
--

-- --------------------------------------------------------

--
-- Table structure for table `announcement`
--

CREATE TABLE `announcement` (
  `announcement_id` int(11) NOT NULL,
  `approval_id` int(11) DEFAULT NULL,
  `seminar_id` int(11) DEFAULT NULL,
  `event_type` text NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `schedule_id` int(11) DEFAULT NULL,
  `date_created` datetime NOT NULL,
  `capacity` int(11) NOT NULL,
  `speaker_ann` varchar(50) DEFAULT NULL,
  `pending_capacity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `announcement`
--

INSERT INTO `announcement` (`announcement_id`, `approval_id`, `seminar_id`, `event_type`, `title`, `description`, `schedule_id`, `date_created`, `capacity`, `speaker_ann`, `pending_capacity`) VALUES
(32, 206, 1720, 'MassBaptism', 'MassBaptism', 'The word baptism comes from a Greek word (baptize), which means, “to immerse.” Baptism is a ceremony in which a Christian is immersed in water before the church to publically symbolize their belief in Christ. The water is a symbol of sin being washed away.', 1719, '2024-10-31 10:24:40', 8, 'BoyTapang', 0);

-- --------------------------------------------------------

--
-- Table structure for table `appointment_schedule`
--

CREATE TABLE `appointment_schedule` (
  `appsched_id` int(11) NOT NULL,
  `baptismfill_id` int(11) DEFAULT NULL,
  `confirmation_id` int(11) DEFAULT NULL,
  `defuctom_id` int(11) DEFAULT NULL,
  `marriage_id` int(11) DEFAULT NULL,
  `schedule_id` int(11) DEFAULT NULL,
  `request_id` int(11) DEFAULT NULL,
  `payable_amount` decimal(11,2) DEFAULT NULL,
  `status` enum('Process','Delete','Completed') NOT NULL,
  `p_status` enum('Unpaid','Paid') NOT NULL,
  `speaker_app` varchar(50) DEFAULT NULL,
  `reference_number` varchar(12) NOT NULL,
  `paid_date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `appointment_schedule`
--

INSERT INTO `appointment_schedule` (`appsched_id`, `baptismfill_id`, `confirmation_id`, `defuctom_id`, `marriage_id`, `schedule_id`, `request_id`, `payable_amount`, `status`, `p_status`, `speaker_app`, `reference_number`, `paid_date`) VALUES
(1049, 636, NULL, NULL, NULL, 1578, NULL, 100.00, 'Completed', 'Paid', '', 'HVA6', NULL),
(1051, NULL, NULL, NULL, 191, 1582, NULL, 100.00, 'Completed', 'Paid', 'BoyTapang', '90H6', NULL),
(1052, 637, NULL, NULL, NULL, 1584, NULL, 100.00, 'Completed', 'Paid', 'qweqwewqe', '30B8', NULL),
(1053, NULL, NULL, NULL, NULL, NULL, 63, 100.00, 'Completed', 'Paid', NULL, 'KOIE', '2024-11-01 17:08:39'),
(1054, NULL, NULL, NULL, NULL, NULL, 64, 100.00, 'Completed', 'Paid', NULL, '6LJP', '2024-11-01 17:08:41'),
(1055, NULL, 212, NULL, NULL, NULL, NULL, 0.00, 'Completed', 'Paid', NULL, 'X7SU', NULL),
(1056, NULL, 213, NULL, NULL, NULL, NULL, 0.00, 'Completed', 'Paid', NULL, '5X6I', NULL),
(1057, NULL, 216, NULL, NULL, NULL, NULL, 100.00, 'Completed', 'Paid', NULL, 'UK6C', NULL),
(1058, 638, NULL, NULL, NULL, 1589, NULL, 100.00, 'Process', 'Unpaid', 'BoyTapang', 'IRMF', NULL),
(1068, NULL, NULL, 115, NULL, NULL, NULL, 100.00, 'Process', 'Unpaid', NULL, 'O7K0', NULL),
(1069, NULL, NULL, 116, NULL, NULL, NULL, 100.00, 'Completed', 'Paid', NULL, 'BDN1', NULL),
(1070, NULL, NULL, 117, NULL, NULL, NULL, 100.00, 'Completed', 'Paid', NULL, 'LAMW', NULL),
(1071, NULL, 223, NULL, NULL, NULL, NULL, 100.00, 'Completed', 'Paid', NULL, 'CF5O', NULL),
(1072, NULL, 215, NULL, NULL, NULL, NULL, 100.00, 'Process', 'Unpaid', NULL, 'PHKY', NULL),
(1074, 643, NULL, NULL, NULL, 1607, NULL, 100.00, 'Completed', 'Paid', 'BoyTapang', '3R7F', NULL),
(1075, NULL, NULL, NULL, NULL, NULL, 68, 100.00, 'Process', 'Unpaid', NULL, 'LDJC', NULL),
(1076, NULL, 224, NULL, NULL, NULL, NULL, 100.00, 'Completed', 'Paid', NULL, 'M3PX', '2024-11-01 15:08:22'),
(1078, 646, NULL, NULL, NULL, 1618, NULL, 100.00, 'Completed', 'Paid', 'BoyTapang', 'QM5L', '2024-11-01 15:08:29'),
(1079, 651, NULL, NULL, NULL, 1621, NULL, 100.00, 'Completed', 'Paid', 'BoyTapang', 'PJD9', NULL),
(1080, 652, NULL, NULL, NULL, 1622, NULL, 100.00, 'Completed', 'Paid', 'BoyTapang', 'NKCX', '2024-11-01 15:08:27'),
(1081, 654, NULL, NULL, NULL, 1627, NULL, 100.00, 'Completed', 'Paid', 'BoyTapang', '6RVW', '2024-11-01 16:52:07'),
(1082, NULL, NULL, NULL, NULL, NULL, 72, 200.00, 'Process', 'Unpaid', NULL, '4W7Q', NULL),
(1083, NULL, NULL, NULL, NULL, NULL, 73, 100.00, 'Process', 'Unpaid', NULL, 'I5LG', NULL),
(1084, NULL, NULL, NULL, NULL, NULL, 74, 100.00, 'Process', 'Unpaid', NULL, '5SD4', NULL),
(1085, 667, NULL, NULL, NULL, 1656, NULL, 100.00, 'Completed', 'Paid', 'BoyTapang', 'P84Y', '2024-11-01 16:52:01'),
(1086, NULL, NULL, NULL, NULL, NULL, 75, 100.00, 'Process', 'Unpaid', NULL, 'LOUT', NULL),
(1087, NULL, NULL, NULL, NULL, NULL, 76, 100.00, 'Completed', 'Paid', NULL, '0BSO', '2024-11-01 17:08:47'),
(1088, NULL, NULL, NULL, NULL, NULL, 77, 100.00, 'Completed', 'Paid', NULL, 'HTLM', '2024-11-01 17:08:53'),
(1089, 653, NULL, NULL, NULL, 1660, NULL, 100.00, 'Completed', 'Paid', 'BoyTapang', 'BDLQ', '2024-11-01 15:08:33'),
(1090, 653, NULL, NULL, NULL, 1661, NULL, 100.00, 'Completed', 'Paid', 'BoyTapang', 'OPLM', '2024-11-01 16:51:52'),
(1091, 653, NULL, NULL, NULL, 1662, NULL, 100.00, 'Completed', 'Paid', 'BoyTapang', '89XM', '2024-11-01 16:51:55'),
(1092, 653, NULL, NULL, NULL, 1663, NULL, 100.00, 'Completed', 'Paid', 'BoyTapang', 'MUS7', '2024-11-01 16:51:59'),
(1093, NULL, 230, NULL, NULL, NULL, NULL, 100.00, 'Completed', 'Paid', NULL, '4GU1', '2024-11-01 16:52:04'),
(1094, NULL, NULL, 118, NULL, NULL, NULL, 100.00, 'Process', 'Unpaid', NULL, '4GUZ', NULL),
(1095, 668, NULL, NULL, NULL, 1665, NULL, 100.00, 'Process', 'Unpaid', 'BoyTapang', '4786', NULL),
(1096, NULL, 232, NULL, NULL, NULL, NULL, 100.00, 'Process', 'Paid', NULL, 'PCKL', NULL),
(1098, 669, NULL, NULL, NULL, 1669, NULL, 100.00, 'Process', 'Unpaid', 'BoyTapang', '0F8A', NULL),
(1101, NULL, NULL, NULL, NULL, NULL, 78, 100.00, 'Process', 'Unpaid', NULL, 'Y67R', NULL),
(1102, NULL, NULL, NULL, NULL, NULL, 79, 100.00, 'Process', 'Unpaid', NULL, 'TZYO', NULL),
(1103, 670, NULL, NULL, NULL, 1675, NULL, 100.00, 'Process', 'Unpaid', 'BoyTapang', 'AH0J', NULL),
(1104, NULL, 233, NULL, NULL, NULL, NULL, 100.00, 'Process', 'Unpaid', NULL, '2N7H', NULL),
(1105, NULL, NULL, 119, NULL, NULL, NULL, 100.00, 'Process', 'Unpaid', NULL, 'TVI5', NULL),
(1106, NULL, NULL, NULL, NULL, NULL, 80, 100.00, 'Process', 'Unpaid', NULL, '327V', NULL),
(1107, NULL, NULL, NULL, NULL, NULL, 81, 0.00, 'Process', 'Unpaid', NULL, 'FRAD', NULL),
(1108, NULL, 234, NULL, NULL, NULL, NULL, 0.00, 'Process', 'Unpaid', NULL, 'DP8H', NULL),
(1109, NULL, 235, NULL, NULL, NULL, NULL, 0.00, 'Process', 'Unpaid', NULL, 'NG34', NULL),
(1110, NULL, 236, NULL, NULL, NULL, NULL, 0.00, 'Process', 'Unpaid', NULL, '8CYW', NULL),
(1111, NULL, 237, NULL, NULL, NULL, NULL, 0.00, 'Process', 'Unpaid', NULL, '7DW8', NULL),
(1112, NULL, 238, NULL, NULL, NULL, NULL, 100.00, 'Process', 'Unpaid', NULL, 'T3P6', NULL),
(1113, NULL, 239, NULL, NULL, NULL, NULL, 100.00, 'Process', 'Unpaid', NULL, 'RW0T', NULL),
(1114, NULL, 240, NULL, NULL, NULL, NULL, 0.00, 'Process', 'Unpaid', NULL, 'UT05', NULL),
(1115, 677, NULL, NULL, NULL, NULL, NULL, 100.00, 'Process', 'Paid', NULL, 'XHRN', '2024-11-01 15:08:56'),
(1116, 678, NULL, NULL, NULL, NULL, NULL, 100.00, 'Completed', 'Paid', NULL, 'ZRMY', '2024-10-17 15:10:08');

-- --------------------------------------------------------

--
-- Table structure for table `baptismfill`
--

CREATE TABLE `baptismfill` (
  `baptism_id` int(11) NOT NULL,
  `schedule_id` int(11) DEFAULT NULL,
  `citizen_id` int(11) DEFAULT NULL,
  `announcement_id` int(11) DEFAULT NULL,
  `approval_id` int(11) DEFAULT NULL,
  `father_fullname` varchar(255) DEFAULT NULL,
  `pbirth` varchar(255) DEFAULT NULL,
  `mother_fullname` varchar(255) DEFAULT NULL,
  `religion` varchar(100) DEFAULT NULL,
  `parent_resident` text DEFAULT NULL,
  `godparent` text DEFAULT NULL,
  `status` varchar(20) DEFAULT 'Pending',
  `event_name` varchar(255) NOT NULL DEFAULT 'Baptism,MassBaptism',
  `role` varchar(50) NOT NULL DEFAULT 'Online',
  `fullname` varchar(255) NOT NULL,
  `gender` varchar(10) NOT NULL,
  `c_date_birth` date NOT NULL,
  `age` int(11) NOT NULL,
  `address` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `baptismfill`
--

INSERT INTO `baptismfill` (`baptism_id`, `schedule_id`, `citizen_id`, `announcement_id`, `approval_id`, `father_fullname`, `pbirth`, `mother_fullname`, `religion`, `parent_resident`, `godparent`, `status`, `event_name`, `role`, `fullname`, `gender`, `c_date_birth`, `age`, `address`, `created_at`) VALUES
(599, 1400, NULL, NULL, 36, 'cvb', 'vcbcvb', 'cbcvbvcb', 'Catholic', 'cvbcvbcvb', 'cvb', 'Approved', 'Baptism', 'Walk In', 'vcbcvb cvbcv bcvbvcb', 'Male', '2020-04-04', 4, 'cvbcvbcbv', '2024-10-22 08:30:16'),
(610, 1472, NULL, NULL, 58, 'edgardo siton', 'Minglanilla Cebu City', 'edgardo siton', 'BVNBVN', 'XCVCX', 'VXCVXCV', 'Approved', 'Baptism', 'Walk In', 'XCVCXV CXVXC VXCVCXV', 'Male', '2007-04-29', 17, 'XCVCXV', '2024-10-22 08:31:24'),
(612, 1475, NULL, NULL, 60, 'eqweqwe', 'qweqweqwe', 'qwe', 'qweqwe', 'qweqw', 'eqweqweqwe', 'Approved', 'Baptism', 'Online', 'Edgardo Arong Siton', 'Male', '2021-04-04', 3, 'Oakland Newzealand            ', '2024-10-22 06:39:42'),
(613, 1491, NULL, NULL, NULL, 'edgardo siton', 'qweqwe', 'edgardo siton', 'qweqwe', 'qweqweqwe', 'qwe', 'Approved', 'Baptism', 'Online', 'Edgardo Arong Siton', 'Male', '2020-03-03', 4, 'Oakland Newzealand            ', '2024-10-22 07:56:07'),
(614, 1495, NULL, NULL, NULL, 'cvbvc', 'Minglanilla Cebu City', 'bcbcvb', 'cvbcvbcvbc', 'bcvbcvbcvb', 'cvbcvbcvb', 'Approved', 'Baptism', 'Online', 'Edgardo Arong Siton', 'Male', '2017-06-06', 7, 'Oakland Newzealand            ', '2024-10-22 08:31:54'),
(615, 1500, NULL, NULL, NULL, 'qweqwe', 'qweqweqw', 'qweqwe', 'qweqw', 'qweqwe', 'eqwe', 'Approved', 'Baptism', 'Online', 'Edgardo Arong Siton', 'Male', '2020-03-03', 4, 'Oakland Newzealand            ', '2024-10-22 08:35:46'),
(616, 1502, NULL, NULL, 63, 'qweqwe', 'qweqwe', 'qwe', 'qweqweqwe', 'qweqwe', 'qweqwe', 'Approved', 'Baptism', 'Online', 'Edgardo Arong Siton', 'Male', '2021-02-03', 3, 'Oakland Newzealand            ', '2024-10-22 08:40:16'),
(617, 1504, NULL, NULL, NULL, 'qeqw', 'qweqwe', 'qweqweqw', 'qweqwe', 'eqwe', 'eqweq', 'Approved', 'Baptism', 'Online', 'Edgardo Arong Siton', 'Male', '2020-04-04', 4, 'Oakland Newzealand            ', '2024-10-22 08:42:06'),
(618, 1508, NULL, NULL, NULL, 'cbcvb', 'cvbcvb', 'cvbv', 'cvbcvb', 'cvbcvb', 'cvbcvb', 'Approved', 'Baptism', 'Online', 'Edgardo Arong Siton', 'Male', '2020-03-04', 4, 'Oakland Newzealand            ', '2024-10-22 08:46:11'),
(619, 1510, NULL, NULL, NULL, 'xcvxc', 'xcvx', 'vxcvxcv', 'xcvxcv', 'xcvxcvxcv', 'xcvxcv', 'Approved', 'Baptism', 'Online', 'Edgardo Arong Siton', 'Male', '2020-03-05', 4, 'Oakland Newzealand            ', '2024-10-22 08:49:02'),
(620, 1512, NULL, NULL, NULL, 'qweqwe', 'qweqew', 'qwewq', 'qweqwe', 'qweqew', 'ewqe', 'Approved', 'Baptism', 'Online', 'Edgardo Arong Siton', 'Male', '2019-02-05', 5, 'Oakland Newzealand            ', '2024-10-22 08:50:55'),
(621, 1514, NULL, NULL, NULL, 'cvbcv', 'cvbcvbcvb', 'cvbc', 'bcvbcvb', 'bcvbcv', 'bvcb', 'Approved', 'Baptism', 'Online', 'Edgardo Arong Siton', 'Male', '2018-03-04', 6, 'Oakland Newzealand            ', '2024-10-22 08:54:33'),
(622, 1516, NULL, NULL, NULL, 'qwewqe', 'qweqwe', 'qweqwe', 'xcvcxv', 'qweqwe', 'xcvxcvxcv', 'Approved', 'Baptism', 'Online', 'Edgardo Arong Siton', 'Male', '2021-04-04', 3, 'Oakland Newzealand            ', '2024-10-22 08:56:06'),
(623, 1518, NULL, NULL, 64, 'qweqwe', 'qweqwe', 'qwe', 'qweqweqwe', 'qweqe', 'qweqweqwe', 'Approved', 'Baptism', 'Walk In', 'qweqwe eqewqwe qweqw', 'Male', '2001-05-04', 23, 'qweqwe', '2024-10-22 09:00:46'),
(624, 1520, NULL, NULL, 65, 'qweq', 'qweqwe', 'eqweqwew', 'qweqweqwe', 'qweqweqwe', 'qwe', 'Approved', 'Baptism', 'Walk In', 'eqweqwe qwe qweqw', 'Male', '2019-04-05', 5, 'qweqweqwe', '2024-10-22 09:05:15'),
(625, 1522, NULL, NULL, 66, 'xcvcxvxc', 'xcvxcv', 'xc', 'xcvxcvxcv', 'xcvxcv', 'vxcv', 'Approved', 'Baptism', 'Walk In', 'vxcvcxv xcvxccxv xcvxc', 'Male', '2021-03-06', 3, 'xcvxcvxcv', '2024-10-22 09:06:40'),
(627, 1544, NULL, NULL, 90, 'QWEQ', 'qweq', 'WEQWEQWE', 'qweqweqwe', 'weqwe', 'qweqwe', 'Approved', 'Baptism', 'Walk In', 'qweqweqwe qweq qweqwe', 'Male', '2022-04-03', 2, 'weqwe', '2024-10-27 05:25:03'),
(628, 1554, NULL, NULL, 99, 'bnmbnm', 'bnmnbm', 'bmbnm', 'Catholic', 'mnbmnbmbnm', 'bnmbn', 'Approved', 'Baptism', 'Walk In', 'bnmbnm qweqwe bnmbnmbnm', 'Male', '2023-02-02', 1, 'bnmbnmbnm', '2024-10-27 05:25:48'),
(629, 1556, NULL, NULL, 100, 'Edgardo Arong Siton', 'vbnvbnbvn', 'vbnvbnbvn', 'vbnvbnvb', 'vbnvbnbvn', 'vbnvbn', 'Approved', 'Baptism', 'Online', 'vbnvbn frghfgh vbnbvnvbn', 'Male', '2016-06-06', 8, 'Oakland Newzealand            ', '2024-10-27 03:19:51'),
(630, 1561, NULL, NULL, 101, 'xcvxcv', 'cxvxc', 'xcvxcv', 'Catholic', 'vcxvxcv', 'xvxcvxc', 'Approved', 'Baptism', 'Walk In', 'cxvcxv qweqwe cxvxcv', 'Male', '2020-04-03', 4, 'lower\r\nsaddsad', '2024-10-27 05:25:35'),
(631, 1569, NULL, NULL, 105, 'qwewq', 'qweqw', 'ewqeqwe', 'werwrwer', 'eqweqweqwe', 'qeqw', 'Approved', 'Baptism', 'Walk In', 'qewqe ewqeqwe qwew', 'Male', '2020-04-03', 4, 'qweqw', '2024-10-28 04:53:48'),
(636, 1577, NULL, NULL, 109, 'cvbvcb', 'vcbvcb', 'vbcvbcvb', 'qweqweqwe', 'cvbc', 'vbvcbcb', 'Approved', 'Baptism', 'Walk In', 'bvcbvcb cvbvcb cvbcv', 'Male', '2021-03-04', 3, 'lower\r\nsaddsad', '2024-10-27 05:27:31'),
(637, 1583, NULL, NULL, 112, 'ewqeqewq', 'Minglanilla Cebu City', 'qweqwe', 'Catholic', 'wewq', 'wqe', 'Approved', 'Baptism', 'Walk In', 'qweqwewqe q eqwewqeq', 'Male', '2018-04-04', 6, 'qwewqewqe', '2024-10-27 05:48:45'),
(638, 1588, NULL, NULL, NULL, 'Edgardo Arong Siton', 'qwerwqeqwe', 'qweqwe', 'qweqweqwe', 'qweqweqwe', 'qweq', 'Approved', 'Baptism', 'Online', 'qweqw  wewqewq', 'Male', '2020-01-03', 4, 'Oakland Newzealand            ', '2024-10-27 06:26:43'),
(643, 1606, NULL, NULL, 121, 'qwewqeqwe', 'qwewqewqe', 'qweqweqwe', 'qwewqeqwe', 'qweqweqw', 'ewqeqweqwe', 'Approved', 'Baptism', 'Walk In', 'qewwqe  wqewqewqewqe', 'Male', '2021-03-03', 3, 'ewqeqweqwe', '2024-10-29 15:28:24'),
(646, 1608, NULL, NULL, 124, 'Edgardo Arong Siton', 'qweqwe', 'qweqwe', 'qweqweqwe', 'qweqwe', 'qweqwe', 'Approved', 'Baptism', 'Online', 'qweqwe  qweqwe', 'Male', '2020-03-04', 4, 'Oakland Newzealand            ', '2024-10-29 13:06:23'),
(651, 1612, NULL, NULL, 126, 'Edgardo Arong Siton', 'vcxv', 'xcvxcv', 'xvxcvxcvx', 'xcvxcv', 'cxvcxv', 'Approved', 'Baptism', 'Online', 'xcvcxvx  xcvcxvx', 'Male', '2021-02-03', 3, 'Oakland Newzealand            ', '2024-10-29 15:29:30'),
(652, 1619, NULL, NULL, 127, 'Edgardo Arong Siton', 'qweqwe', 'qweqwe', 'qweqweqwe', 'qweqwe', 'qweqwe', 'Approved', 'Baptism', 'Online', 'qweqwe  qweqweqwe', 'Male', '2022-03-03', 2, 'Oakland Newzealand            ', '2024-10-29 15:29:54'),
(653, 1620, NULL, NULL, 128, 'Edgardo Arong Siton', 'qweqwe', 'qweqwe', 'qweqweqwe', 'weqwe', 'qweq', 'Approved', 'Baptism', 'Online', 'qweqwe qweqwe qweqwe', 'Male', '2021-03-03', 3, 'Oakland Newzealand            ', '2024-10-30 06:16:27'),
(654, 1626, NULL, NULL, 136, 'edgardo siton', 'eqweqw', 'edgardo siton', 'qweqweqwe', 'eqewqe', 'qweqwe', 'Approved', 'Baptism', 'Walk In', 'qweqw qwewqeqwe qweqweqwe', 'Male', '2019-04-05', 5, 'qweqweqwe', '2024-10-30 06:29:05'),
(667, 1655, NULL, NULL, 164, 'qweqwe', 'qweqwe', 'qweqweqwe', 'qweqeqwe', 'eqweqwe', 'qwewq', 'Approved', 'Baptism', 'Walk In', 'qweqwe qweqwe qweqwe', 'Male', '2020-03-04', 4, 'qweqweqwe', '2024-10-30 06:17:41'),
(668, 1664, NULL, NULL, 168, 'qweqwe', 'eqwe', 'qweqwe', 'Catholic', 'qweqwe', 'qweqwe', 'Approved', 'Baptism', 'Walk In', 'qweqw eqwe qweqwe', 'Male', '2021-03-03', 3, 'qweqw', '2024-10-30 06:33:18'),
(669, 1668, NULL, NULL, 171, 'qweqwe', 'eqwe', 'qweqwe', 'qweqweqwe', 'qweqweqwe', 'qweqwe', 'Pending', 'Baptism', 'Walk In', 'qweqw qeqwe qweqwe', 'Male', '2020-04-02', 4, 'qwe', '2024-10-30 06:38:23'),
(670, 1674, NULL, NULL, 178, 'eqwe', 'qweqwe', 'qweqwe', 'qweqweqwe', 'qweqweqwe', 'qwe', 'Pending', 'Baptism', 'Walk In', 'weqweqwe qweqwe qweq', 'Male', '2020-04-04', 4, 'qwewq', '2024-10-31 03:13:57'),
(671, 1680, NULL, NULL, NULL, 'Edgardo Arong Siton', 'dfgdfg', 'dfgfdgfdg', 'dfgdfgdfg', 'dfgfdgfd', 'gfdgdfg', 'Pending', 'Baptism', 'Online', 'dfgfdg  fdgfdg', 'Male', '2019-02-05', 5, 'Oakland Newzealand            ', '2024-10-31 03:17:46'),
(672, 1685, NULL, NULL, 183, '', '', '', '', '', '', 'Pending', 'Baptism', 'Walk In', '', '', '0000-00-00', 0, '', '2024-10-31 04:05:56'),
(673, 1686, NULL, NULL, 184, '', '', '', '', '', '', 'Pending', 'Baptism', 'Walk In', '', '', '0000-00-00', 0, '', '2024-10-31 04:06:13'),
(674, 1687, NULL, NULL, 185, '', '', '', '', '', '', 'Pending', 'Baptism', 'Walk In', '', '', '0000-00-00', 0, '', '2024-10-31 04:06:22'),
(675, 1688, NULL, NULL, 186, '', '', '', '', '', '', 'Pending', 'Baptism', 'Walk In', '', '', '0000-00-00', 0, '', '2024-10-31 04:09:11'),
(677, NULL, NULL, 32, NULL, 'qweqw', 'qweqweqwe', 'eqweqw', 'qweqweqwe', 'wqeqweqwe', 'eqwe', 'Approved', 'MassBaptism', 'Walk In', 'qweqwe qweqwe qweqwe', 'Male', '2019-04-02', 5, 'qweqweqwe', '2024-11-01 05:27:11'),
(678, NULL, NULL, 32, NULL, 'qwe', 'qweqwe', 'qweqweqwe', 'qweqweqwe', 'qweqwe', 'qweqwe', 'Approved', 'MassBaptism', 'Walk In', 'qweqw eqweqwe eqweqwe', 'Male', '2020-03-06', 4, 'qweqw', '2024-11-01 05:28:21'),
(679, 1721, NULL, NULL, NULL, 'Edgardo Arong Siton', 'qweqwe', 'qwewqe', 'ewqe', 'qwewqewqe', 'qwewq', 'Pending', 'Baptism', 'Online', 'qweqwe  qweqwe', 'Male', '2021-03-04', 3, 'Oakland Newzealand            ', '2024-11-01 14:15:20');

-- --------------------------------------------------------

--
-- Table structure for table `citizen`
--

CREATE TABLE `citizen` (
  `citizend_id` int(11) NOT NULL,
  `fullname` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `gender` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `c_date_birth` date NOT NULL,
  `age` int(11) NOT NULL,
  `address` varchar(255) NOT NULL,
  `valid_id` blob NOT NULL,
  `password` varchar(255) NOT NULL,
  `user_type` varchar(255) NOT NULL,
  `r_status` varchar(50) NOT NULL,
  `c_current_time` datetime NOT NULL DEFAULT current_timestamp(),
  `otp_code` varchar(6) DEFAULT NULL,
  `otp_attempts` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `citizen`
--

INSERT INTO `citizen` (`citizend_id`, `fullname`, `email`, `gender`, `phone`, `c_date_birth`, `age`, `address`, `valid_id`, `password`, `user_type`, `r_status`, `c_current_time`, `otp_code`, `otp_attempts`) VALUES
(4, 'Edgardo Arong Siton', 'edgardositon90@gmail.com', 'Male', '+639394245345', '2007-09-10', 0, 'Oakland Newzealand            ', '', '$2y$10$she3jio6MQnO4ct9z5eDWuFWASXLW.1PzP1nO1PJDcF49xFjIVq7a', 'Citizen', 'Approved', '2024-08-06 00:00:00', NULL, 0),
(5, 'daniel', 'admin@gmail.com', 'Male', '639394245345', '0000-00-00', 0, 'lowersaimongheart', '', '$2y$10$KFdTQLQDEwPAlRNFxRpPYOYOXQrJJWDDkZmut/oHdm8DGF7fug66q', 'Admin', '', '2024-07-10 00:00:00', NULL, 0),
(6, 'sweet', 'edgardositon92@gmail.com', 'Male', '639394245345', '0000-00-00', 0, 'LowerCalajo-an Minglanilla Cebu', '', '$2y$10$iJINoGhbUa3heLDFnZgEFuoGwQN7Ex6p2TWNUl8WlPRjRY2i8DYfe', 'Staff', '', '2024-07-23 00:00:00', NULL, 0),
(7, 'aeron', 'aeronvillafuerte2@gmail.com', 'Male', '639394245345', '0000-00-00', 0, 'lowewqrq', '', '$2y$10$ycjT75O0Q6MUQoe5lmaLuOqZh87maa0eI3OMkijqW1lfwYhmAjc3a', 'citizen', '', '2024-08-06 00:00:00', NULL, 0),
(13, 'XhydrikBartido', 'staff@gmail.com', 'Male', '09394366099', '0000-00-00', 0, 'qweqweqwe', '', '$2y$10$KDEuxvu2a1SyiQu5OxdIjuJ3CpQCWYBGLEwiPtpQeJXLqeGndaDtG', 'Staff', 'Active', '2024-07-22 00:00:00', NULL, 0),
(14, 'Fr.Rodel Celis', 'priest@gmail.com', 'Male', '09394245345', '0000-00-00', 0, 'LowerCalajo-an Minglanilla Cebu', '', '$2y$10$o0/5Gn66AEbwNdcRI6vfzuSaWr10uOAKHDCv7Y.S.AMWOon8defp2', 'Priest', 'Unactive', '2024-07-15 00:00:00', NULL, 0),
(15, 'Jameban', 'edgardositon0@gmail.com', 'Male', '09394245345', '0000-00-00', 0, 'LowerCalajo-an Minglanilla Cebu', '', '$2y$10$ouRXkUPN8OaYjyE2SXLgmO/wCRcmwBnQE.LX9MfeEFLo3iGq2IVnW', 'citizen', '', '2024-07-16 00:00:00', NULL, 0),
(19, 'chinchin', 'chinchin@gmail.com', 'Female', '09394245345', '2024-08-20', 0, 'LowerCalajo-an Minglanilla Cebu', '', '$2y$10$qE20.AXd.DzWZIrbC.jLherbIc88Ipjp2ZA.HRRhE1IYkUZpZNhCK', 'Citizen', 'Approve', '2024-08-06 00:00:00', NULL, 0),
(20, 'chanchan', 'chanchan@gmail.com', 'Female', '09394245345', '2024-08-13', 0, 'LowerCalajo-an Minglanilla Cebu', '', '$2y$10$LFEiKZNaG/IH4g8vPR.IA.r/Zsej4Z78oHq4xEJccKh/3I53OOGdC', 'Citizen', 'Approved', '2024-08-06 00:00:00', NULL, 0),
(21, 'Sweetie Siton', 'SweetieSiton@gmail.com', 'Female', '09394245345', '2024-08-07', 0, 'LowerCalajo-an Minglanilla Cebu', '', '$2y$10$avtRCjUK14ZIoKyTe/V6NeTxF9Qtd45S3rkGxSflj6OkCY2DWCB8m', 'Citizen', 'Pending', '2024-08-06 00:00:00', NULL, 0),
(22, 'Eddi Siton', 'Eddie@gmail.com', 'Male', '09394245345', '2024-08-07', 0, 'LowerCalajo-an Minglanilla Cebu', '', '$2y$10$GFtn71FaUQsT98mBn97BJeIV.gw3nj4DxwbEan/Ljdn0w11jvZq.W', 'Citizen', 'Approved', '2024-08-06 00:00:00', NULL, 0),
(23, 'Fr.AaronVillafuerte', 'priest1@gmail.com', 'Male', '09394245345', '2024-08-15', 0, 'LowerCalajo-an Minglanilla Cebu', 0x66756e6572616c2e6a7067, '$2y$10$RULvMwNCbAxKQZEEviOekOZwKr0M2gR7x/KvJCCxRwUwrvoP/g3Ga', 'Priest', 'Active', '2024-08-14 00:00:00', NULL, 0),
(27, 'Alice Arong Siton', 'alice@gmail.com', 'Female', '09394245345', '2024-08-14', 0, 'LowerCalajo-an Minglanilla Cebu', 0x636f6e6669726d6174696f6e2e6a7067, '$2y$10$u3F42X84bgckrj2vgPazze/6EtgDeXR.nl4XNAGI.iuQFC8W7SUOm', 'Citizen', 'Pending', '2024-08-26 00:00:00', NULL, 0),
(33, 'Janet Siton Toledo', 'janetsitontoledo@gmail.com', 'Female', '09394245345', '0000-00-00', 0, 'LowerCalajo-an Minglanilla Cebu', 0x61626f75742d312e706e67, '$2y$10$oIydwX1TuOpUNF41Y0ZqPu4XfketVAkoqlGBtg84qnoRY2d4mPFua', 'Citizen', 'Pending', '2024-08-26 00:00:00', NULL, 0),
(34, 'Grant Toledo Siton', 'grantmantetoledo@gmail.com', 'Male', '09394245345', '1985-04-12', 39, 'qweqwe', 0x636f6e6669726d6174696f6e2e6a7067, '$2y$10$NrWZNbNJTikH5vLFCwpEm.8Qnz6uPCqZrvEyuGt0kj/gwnpa2lOk.', 'Citizen', 'Pending', '2024-08-26 00:00:00', NULL, 0),
(36, 'asdasd Siton admin', 'sdfsdf@gmail.com', 'Male', '09394245345', '2012-08-10', 12, 'LowerCalajo-an Minglanilla Cebu', 0x77656464696e672e6a7067, '$2y$10$UGUah67nEm8V0Wyhr8kNje8eHYHxDkN5kTJGAo46HEQFNPZ8WO4xi', 'Citizen', 'Pending', '2024-08-26 00:00:00', NULL, 0),
(37, 'admin Siton admin', 'jacky@gmail.com', 'Female', '09394245345', '2012-07-25', 12, 'LowerCalajo-an Minglanilla Cebu', 0x77656464696e672e6a7067, '$2y$10$LVVP8OMiWnrVUcBlFfIN4ejHC1779dPVy.5bYinRorPxJw8dcp86m', 'Citizen', 'Pending', '2024-08-26 00:00:00', NULL, 0),
(38, 'Melita Suson Camposano', 'MelitaCamposanoSuson@gmail.com', 'Male', '09394245345', '2009-04-17', 15, 'LowerCalajo-an Minglanilla Cebu', 0x626c6f672d342e706e67, '$2y$10$zXwFlidpH139U8/n5T/8qOXnY.SryhnCSKXl5jwQQ9A132rFzfwK6', 'Citizen', 'Pending', '2024-08-26 00:00:00', NULL, 0);
INSERT INTO `citizen` (`citizend_id`, `fullname`, `email`, `gender`, `phone`, `c_date_birth`, `age`, `address`, `valid_id`, `password`, `user_type`, `r_status`, `c_current_time`, `otp_code`, `otp_attempts`) VALUES
(39, 'esadsasad', 'asdsaas', 'saddsasdasda', '09394556', '2024-08-12', 1, 'aswdasdasdasd', 0x89504e470d0a1a0a0000000d49484452000001330000018708020000005361226a000000097048597300000ec400000ec401952b0e1b000020004944415478daecbdf7932b59762676ccbd9909a0dc33eddd989e19ee0c8d444a5c06d77043c191421192fe55493f2ea92563399c1e8e6ff37cbf7ea69f3765510032af39473f9cc4ad2cd46b7277a69bd3dd831b15787828542201dc2f8ffbce775045012148ce44029801002041acc1230003288000640005500082f55aaff5fa6d9782961f04242004640006758008ea40049888580002a479582c168b108284880aa40000829011840000500175fdc1aed77afd568b8810111199d92f57453c620fc008e852ce8e090012a4a3e3a3c3d9b4eb3a551df99a00104010000110940000480070fdc1aed77afd562be6a4aa008088d8b5cc4c441ee995edf355350200e7bc578045eaf667d3c3f9719b237be79ca30c08000a049097e65601107bcba9b8be5ddfae6f7fc3dbc67b01d52c49b2660929a2425298b95985dcf8ca0142947c3c9f1dcf674932313bef99398616b58f2a3342565000416005002005c1f5edfa767dfb1bdea694ca7d662242062481e9ecb876bef295538090628831aba263248c9243088df727212501226404446001e8dddbf5cffa67fdf31bfea418015010005111fb5b806ed18510524e4e0032680655040550842c922563025a2233132840260080b4b699ebdbf5ed6f7ddb5495ddcfa0a89054248b5af0089a5530aace52fbfce8e0a89d7720e4d8b2462c80702a376bd04558e766d76bbd7eeb0c508c385800a0aaace0ba7c61737b6773cb0940e39ad96ce66a1f251173ce991051fa0c9021d37e609d975daff5fa5caa268e97854d508319022830f3e1f4e8e2b98b9f491c903504d76bbdfed5972e71e708200f7e51f0489fedb2aebdd9f55aaf2f109c856c874b660fe92a38cf82700dcbf55aaf7f85e5f00cf050fbc46e7984a04fdbfe8be674bdd66bbd3e1f64020019d8f494b53483697c85a1b55cc372bdd6eb0b5aa514a267e34c52503d95813540e2b20e03ebf4ec7aadd7bf8ecdfc974352eca1bc5e5f86f4c017bad65ff2ef7695861127000220088800dad72d11010178e0ca9ec4990a6b7ff6778504a32eeb17861ecb02e297e94af1fb054b83212e3d5b3dfd299fa0114ffdb7fcf17aadd77a7d513e11f666d3ad3f8baf96813d75295d7bb35fdfb5160ff9ea81d3028d2fe876bdbe246b6d33bf6a97525d06845fcced3a5a59dbccf5fa4dcda67e51b7ebb5b699ebf55b2509d66b8dccf5fa72adb5b7b946e67afd4e1128828845fb50555555540b38ed1130f135c49cb33d79f82b0020227b7ce5f9c3e7d883762b21daebaaaa8894e7afbf913532d76be9b52eb1d1c3524401941099989989872024e402395040e891965222d021628908019959454424e77c7210c08afb260793421d227ffd8dac91b95e27460c96aac1f66852013036d0d2e82d6fc57e353882823ae262334505108de22529ab2a0238623392b652174035a5b4728d706ebd55d6c85caf25260b30fa074d1b4d4444ccfa11119389e7f78fdbdf1630a7947a996055736101111025e7f22a0a90216700556deafaec41ca91d76b8dccf5ea01d9fbb1cb553b4fa20440c408a85953d7a594e6f379ced96c1d1139e78abd25229300b7ff32331255cb08b6604f55b3aa29f41b2c4fa0abeba2ca1a99eb753a0334cceba0282401901c53c85d3b5f1c1c1deeefee4d67c7f73fbd17524c210aa867c7de31922254ce9363bb75c4ec5df92d7b376e46e38dc9e66463bc311937235ff9a8199d3360e79c0db12b367cbdd6c85c9b4d4d29e59c638c31468879b177389fcd0ef6f6f70ef60ff6f69fefedee3ddf3d3a9e3e7ffaac0d5dec828056cebbca3b62010d6d874c9e1d321160b9af59c87153d593cd8df33be72ebc74f1fcceb966327efddbdf6836275b5b5b4dd3f4c336bcf7de8710d65fc71a995f655b77dab4ac4840fcf376a73c19154851b2c42ecce7f3a3a3a3838383a3a3a3b868f71e3f3d7cbe77fffefdc78f1f1f1c1ccce7f3aeeb524a1b1b1b2104f345bdf755551577b4e46c2d5c2c459118630821e7ecbd9f4c261b1b1b7edcbcfce6ebe75ebaf8e69b6fbef2ca2be7ce9ddb3eb773eedcb98d8d8da669e0458d47789a60ff596fbf3cbc768bd7c8fcd7c8d0f49e5e29120224cda6096161212a20a243222204802c2242804404a2590599920a644144059494bbc522b4dde278b6b7bbfbf0fe83e74f9e1e1e1e1e1d1c1e1e1ece8f8fefdfbfdf755ddbb622c2cccc8caa8c787c7484888c6831258858b8689e2858015344963512c3aa3d5f529a1e1e1e1d1c00c0f3474f80b0998ccf9d3bb7b9b9b9b9bdf5e65b6fbdf5d65bffe60f7ff0f6db6f2b684a69e7fcf910c2c1d1e1783c4e127d53871473cebeaeed09de7bbb0a1060edbd2346d11c53928cecd6e05c23f38b4566c98b9cec750024ec332e06862c3967150d5de7901cb14706000644265212d01ce26c7a3c9d4ea78747077b7b07cf76a7474737af5e9f4d8f8f0e0ee6c7b3d0762184d8756d08defb2e861042c9cdaaaad9bd2502218bea32c193732ee99c6126a9afca808d7b4355454055ed66731189b34598ce9e3303d1ed1b37772e9c7f74ffc11ffef11f5db878b11a35b10b5d0c8bc542521e4d1a8724c4aacacc4c9873ee62a8eb1a336a96104210250547ecd9c5f5d65923f38bf04e571cd49e4c63f814518018131838910000455504442be77ac533c931c676be582c165d0ccff7f68e8e8e9e3e7dfaecc993674f9eee3e7db6bfb7373f9eb5b3798e29c728299be1250055edba2ec94962666908b373ce1e317ff584d32302c38ae820c304cbcc6db9b8a8aa6797b0a71389488c31edeecde7f3c56271e7d3bb9b9b9b5bdbdb6fbcf14606dddfdf5784ef7ef7dd77bef5cd73e7cf239350b40c93270405620624cd592423223966e7624ceb4db546e6179b9b29e0ec37bd2a008cb8eeb93baa4c448e1d122a48cad3e3e9d1c1c16c7a7c7474b4fbf4d9d3a74fa7d3e993e7cf8e8e8e9e3d7bb6ff7c77767cdc759da48ca2b5afb877464f6c32118514cd5a1aae86158ea1015ff1ba8dbb576a2716641afc86dc3d550d218888b2f4b39099012085f8f0defda74f9f8a48d5d4172f5e44a2e9742a221fbdf5fa77ffe07befbcf3cecec50b6fbdf5d6c5d75e719557c01082f7be9c27010a4097e2ba09748dcccf0f842b690fdbf14bd38488348c394555810011911425e636b439e7fdddddbbb7ef7c72e3e3a74f9f1e1d1dedefededeeee1e1f1f4bca5dd7592207b238e72ae77ce5168b8523323fd3aa17764ce453799d95fb4307fb945537f2dd00c08591bbc2b6d5dc53f642db49ca8a20a08a389bcd269b1bceb983f9fcd993a74972d3343b3b3b97deffe0fea79f6e6c6cbcf2c6eb7ffee77ffe277ff6a72fbdf2b26feade9bcfd9dc696416911042e59bf58e5a23f37370653fabe5ea24541b6c6b14855eea1e254b08e1e8e8687f776f3a9d7e7afbceb56bd7ae5cbebcfbec794a29a51463842c392643484dce80a329c7943d33223212229aa76ac84c92879884012161e5dcca238533549e6fd9a315aa3a2212a0ab2a71ce283f167c329122345595634205464ca29844ba383f9cc6d0ce78ba98cef6f7f7dbe3d9fefefefff83ffdd91ffce0fbe49d23561be12a62167b4df15b23f373b5992faa760c32280aa26245f92c0ed04a1dd3e9f46077eff1e3c78f1e3edcdfdffff4cedd7bf7ee3d7cf830875898e29e5d4c899188b960c65054559582269093fc0d28181ffd34a2ec91b3f5c615f4969289dd319014c4f6c7548821c0904c6faf4e38198d0f8e0ebbc5a21e8d6a5f55ce775df7fce9b39dad0d8f54f92a0b3c79f028c6b898cd8f8f8fdf7afbed0b2f5ddcdcd9aeaa2ac6a8888a48cec19a18bf46e61792922d42f58884480a2a2259724a396748f9dedd7b4787878f1f3f7ef8f0e1a3070fefdfbffff0e1c3a3fd83aaaaa6d3698e69341a39e7baaecb2128a59abdf9c04904001cb3ab6a66ce39e71e4d32347dc3be3058b25b2de07cf117ec5c81d9d958b418d23ee6046c9a86910434c69852b2d6334dd2b62d8836555d5795c5a2a3baaebd4795e3fd43727ceee285735bdba90defffe297d7ae5dfb3ffeaffff39bdf79b7691adfd40931a56417054f7ebd8bd6c8fc1c564ac939d7d71510bd6126a78dd138a514ba2e8400a28bc5e2d1a347cf1e3dfef8f2d5c70f1edebd7b777777d7a2c7182388c62e10a0f35e52ea620400470c003946002040439c1537926a6f03a9072111916346c748c3eeb062df4a6a67682d11b1ebba422d28bfb23755824fbb53555555d7ed7c5e4c2833ab2a2ce3cf713322a2d805c999886a5f354d333b3eca3937553d3b38da7bf6fca5575fb970f1e2f1c1e1fffb7fff3f7ff9efff1d11bdf3cd6f8c37276d085dd779ef614d8c5f23f3b75f64b91c7357430400f4de7b5fb3db7df6bcf695e67cb0bbfbe0defd3b77eedcbe7dfbd9e3277b8f9f1eee1f1c1d1c2cba0e55b32a0310b3214d068617004014550930035887566f0f971eace2a9c665d553a9cd17f6a30c33c62bfd22c3e71bb62dda1411338f88c8de8348ced9fa360da0865e8b15cb1172ce29c4cdf164369ba52e70e5c7cd2875616f775754bbaebb76e56ad33429a577bef90d6e2a02d09c11d75b6e8dcccfe50342f2ec10518845840135a490b203dc7bfefcd33b77af5fb97af3e38f1f3e7cb8bbbb3b3f9ec5791bbb2e76411150216bcff8919c4f0036f08dfd20296298b4f095881401cf20b0343a0fb3af67c3cb9295fd2c267a8cd139d7f764a664ec5c551d37235515004534695b5c62b8d0eb31a305d541c364b4e99c9bcd6623e6d1781cba303f9e5593112777fbe39b2925601a8fc76fbcf5a6abea98d7c5cc35323fafc012d1280428ca8020da2dda763edf7df6fcdae52b3f79efbd6bd7ae4d0f8f487b1ba23913a0f7beaf76c49c554b217125176a2996e102429bbf560c6571590d8892e56c32f6acb52ca54e0bf08660b6dfa694ecac786912ad58325bcc9d73c689478524398598522a4eaf3d3f2f57dbb676e5eabaae691a4d3986d0340d57b4383a7ef8e9bdeb9b9b1776ceedecec5c78e9628c71add6b846e6e79599d51c62ce19440930b4edf3a7cf769f3efbfbbffbbb3bb76e7f72e3e3a3a3a3da57defb1cc2623e2740cd02031a00335755659d933ddce8c4aca59ced3984888440d8e782ed997252ff405d0d2387101de678cc4135fb16632c978315424241a973ce98aef67c45f3724d0c41c93123641590ac193c79626242459094e7f3f9cecece4426474747b3e931323120a842cca03a3f9eddba79b3699a975f7e79636303b220ad49ed6b64fef606130015985dedab1cd3f4f0f0d6cd4fdeffe5afae5fbbf6e1fb1f84451bbbd0384f88a9ed628c0e68282c60a548dbfa66bb7a5c0dea19e8182c7e2bea044bafd50004a72b962b3cbb620c577242c5951d869785376b39dbc2dd33641a4f484055b58b21494f1b62ef5ce543db95c8d3c83d4424242909336f6c6c745dd72e5a6676954f5d300fc0231deeee5fbd7cf9edb7df7eedcd37b6b6b7d7b05c23f3734a02014acad3d9d1b3274f6eddbaf5d1071ffeeae7bfb8f9f1c73539107544a8d02ddad805666e9ac66c94d1bb097b5356ea87662d87ac1d200242424226d0818281c15b5f90dd2915c8e1e343faebd02a5a8e67582631afd5babaca75c4d2b08a90554d97c49c70bb35d66bce3949868ce4b8bc09e7dcac5d6c4d36b6b7b77743b4f035a5d440136374635280c70f1f5db974e9fb7ff883ed9d9d3532d7c8fc6f5a2fec271ccede7680bb7bfb37ae5efbd5af7e75f5ca95070f1eecefee51562214c9296544d42c9644310098794444f6ae20c46c54c9b51664869450404935e542c403913e0b7a662397839f485d8a584fa60ed6c917ec5c01e4f04fcc480e2b2e06d41082316699d91165d51482884c261359e66ccdbadaa19868713c1bd7cdc6c6c66c7a1c632c6fb96bdbd164ccdecd0fa7773fb9fde4de8377df7dd78dc779cd9c5d23f3ec62cb76d806c57ee797da9d64215146224011d198e6d3f9fdeb9ffce4efffe1c73ffef193274fbcf79e48d981082ae465bdc1551e0014819d23c76294f694cc952d2ee8497a567aa9bb1c23224a21dc01a02a02822800c8191e6c08a1d44286bdd1f6b8a56786559610829d40319e06adaeebaaaa2a4c20f36c43d7796611d19cc93902cc925388aaba98cd99d9b303806ed1e6989aa6d99c6c84b655d2b60d55d56c6c6dcf16edbc5d6cee6c4fe7b3d168349f4d438c2f9f3f178f8f7ff1de7b7ff9977f2195a7aa325f9d9d8b311aecd79a09bfefc83c69da2284654bbe02742110220b00222381e8627a7cb4bbffe98d4fae5fbe72ebc6c7dd6c5eb34305cde288dbb62df66a986b35840f493945e7aec47543d12d5c8ef72a99d892e959c1e430fd63f7f3b212338c244fb9ca00064b38d31d5672b62b07575158fe088866296676a5b26a8260cc2c295b4514119ba659040d21d475edbd27c510c27c3643c4e9fefec1f3dd0b1b93e167659fc38a88e67afd5e22f3a4b4d0a3c11409988891308ba6ac5942dbdefff4deed8f6f7ef8f35fddbaf1f19d3b77ac55dfb6a3e530cf62de763c9cd1351791aaaa86099b924d5d81d6d9f2e3908867e12bbca864523cd572400364c9f41419e821324b46b76492ed9925fe2c3cdea2045d780b39e7087154d7e0bd02c41899793299084ad775755d5bf2c81418524a0707078f1f3fde79eb0d5efa2c1ec07888270cc47fb61b768dccafb9cd9442ac59ee033353cc080a21a614d3eeb3e737afdff8f52f7e79e3a3cb7bcf7767b359e9631ceea461fb95adb66d79b0cee267056967a178b6936b78a7d41e579a3087099ea16d3ccbb31dde196680563d8bd3516b4166094a534a20da5495734e112c5e3509a21082290c35e3715dd7767f369b3d7af4e8bb229ec8906c65d213a1ea75fcf9fb8cccbeb10b017090f914cd318a5312d098a67b07f76edfb9f2d1a50f7ffdfeded3678ce4bdefbaae17f500b0b6e01762a994ef4b78593a925f3820a464685ee058be0899434bbb2277b2525f29882a959b62c061491880415b7621e896a2cbca591557fce45d8886109aaa361f3e2f6bb35555b56ddbb6ed7863543e87e974fac9279ffcdbb61d6d6f7bef2d9b74628497871cb6ddfd3ecf0e74bf77b03491f2e27f8aaa88aa8eeb06b3c6d84df70eeedcbefde1fb1f5cfef0a3db9fdc724493d1d8769e855566888a57b902a4a6694e586c4bbb544ccd4a2a6825221d4e047a21320160c81c28c71f163057ec9e79d7c30925c3357cc5a10f3c4c32158497d71a8e63e8ba8e003d56702227dd4b9f18388bb13d3838b872e5cac71f7ffcaef72fbffcf26a7218576169ff95df5787f6f7b46a820aa08aa222022983684cdd74ffe0d1fd07773eb975e5a34b973efce8c1bd7b8ce8882d24b34282fd795dd72bce5ed9caa52379c53c9a8d5da5a79ff11e87b6f7ac0b5a00593abf8a77bd42582fc78f319628b1d7da4324a252441936a6d8eb160593c22582c1d4a3159f368420295739d91b4c2965e86584168bc5f1b12f6fa76ddb7bf7eefd97bff9db283afad3ba1e8ffe99e635f88cb6d83532bf9e8b14b2c11281144495447316cc72ffc1bd07773fbd7af9cad54b976f5cb9faf8e1a3baae5f7df995d96c6669d8d168444426e86adeda5087aea065586f5c295daeb89da74afc83d0f1b374430a736018c45a6931e76c5587b3716f29420ed3b3bcec7d29e03c11ec596a76adf06f87fca1e1454444ba98b2f6ef25e79c21dba1dab65d2c16454e3a846e319bfff847fff8f2eb6f7cf39d6fbcec5f71ce09f5171d521004e30cf717a0759cf9b5358c2f62b1b17788480a229944bbb63bdcdd3b7cbef7c1fbef7ff4abf73f7cff83c3fd7d46dad9da46c476be30ba4c5fee0bc1b6a96d74e7dcd0a72d54ef154495d6e492712909cf152f7168c1866cbb21c2abaa2a781b0ec9dcdcdc2c6a77a60d6d082c76de4058c2dd922b2e503482412fa73038557ba1f266ad2bc54eb8f61511c598dab6354f1e1173ca96f271ce8510aaaab29a0a33c71839849ffcf8bd575e7af9873ffc61cd3e8550792fa04ae888524a8bae23a27ad4985060e5fc1a995f675896fd1d166d55555935b69da47c7c7078e3f2d54b1f7df44f3ffaf1eeb3e7c7474795f34d55a79462d7b522aef2c5e0d81e5de9512e5e6531472fccb51aaa4b4d62455260682d8b1bb9e2c1da1a4ed41c1ac9b66d8bdd1e8d463670a190758606b338a2677defe1890da54f4a036731b076d8aeeb26a391a48ca025e835e82e5fb1272d651b3586c8480fee7efacb9ffeecdbef7ce38ffee48f2be76388e438a7a4848838aeed3aa88438198dad2d768dccaf618d64a5bcd1d43564e916ede1fec1c3fbf7af7d74f997bff8c5cdabd78ff6f6bb452b2254c1229f188a8284522c197a95658f961d3cb4a2431096beca15c89db58d859173f6fccf6a6a0ded6139679b44d2378e2c6159ea99c330b22073e57a01cb4ae6109cc3e35ba49a975d9da232e4eef5e47811ab1f2fdf8e12600af1e068efc7fff51fb6271b9366f4ceb7be49a21262d3345945118028c6d885404466d8d7c8fcbad9cc17b4f903d4be3ad8dbdf7bfaecd33b777ffade4ffef1bffec3c37bf71df1a46e48c0dc30dbd0555599207a81e550ccaaaeebe16cc962c48a2b78366bb2728d386ba686f7cf320a56c0b942513021ace2ca5abeaa691ad3ec8101b1a130d187e770565f6f650d63ce626f1929849042df3866685cb9ee0c2e370000edf1ac427efee8c9dfff97bf7bfdf5d72f9c3f7ff1a5979470b698233310e6941060d434cc2c673ebd3532bf26d67245dc9110e747c7c70787f76fdffdd5cf7ffecb9ffdfcf1bd07acb0359e1ceceda3e9ff7b8f88a68ed5866ea8a0d377452ded4cd9d0c37ac34a9aa4aca10f39bc731609e58067f396c3e3ac544a0a98ad826fa55723000d35474a45c7dc013374673986672f044370765d67454bef5c12e9e517066fe4ec85a38cc7ce214e269bb10bfb4f9f5ffaf5076fbcfceabbdffbee85972e8aea646b93bd5b741d32d54d9352da9f1e8ec6e33532bf9ec81cca3a82c2d1c1c174efe0ee9d3b973efc68efc9b3f33b3ba8309b1e13f42259cb92000ec96b0596a56e5e6a15b01c176b98b1106b18a47d96833d2c3face4542dd1f2425591615c5a2a1ff6ba0645220a2198f1b404cc0acc0a8d7605962b51e830e76c9aee43427c3f2e05b0aeeb4cac78aaa965f83607620eaaaa8e5cb7683d9267be71e5eafeeede9b6fbff5e63b6fbffee61be72f5cd83ab75335f5786363e7fc39e75ce32bfc7d1d1ff67546e6b0f7bfdf8559f677f76e7efcf1d5cb57769f3e4355260e5dd72d161b1b1ba820a031e71823109263ef5dec429126285bbfd4c74b3a6498223a5b5a58e9dbfa2c35ad2174ad587f7614c290767bb6226a46d2ae14861f4bc09472487995d2db4183e1d367679f1407b5b8c4c502a794348b9f4c86a75dceaabf83c3d31380ecc82fe60b93237cfaf8c9e3c78f6fdcb8e1ebaad99c4c36365e7af59537df7eebf5d75f7ffdcd37bff39defbcf9f65b8bf47bda83f29547e6702be919642e058efb96644df9d9e32797dffff0e36bd7734cdefb83bdfd14e2f6f6f6c1c1c1783c6e9ac60174311463b292772d04002b30149b905232b2e890b5375ce66a0e23d2a1251cd61ecd9a4d2693b36406004892154054c53ac906f16dce39cce7e6a996a82fe6c4cce6100061df5a86601ea93d73a8d77e56b5a498e59412012aa15532524a2186ceb91ec000049096ae781fb5aac9cedbb54c01a4149c50818876b6b614e1eebd7b5553cf1773d7d4afbcf2ca6463e3fcf9f37ff6e7fff3bffb0ffffe077ff2c7994e7db9ff7c4badae91f9258125e94979dafa2dfb6f8e894cbd35e7daf99adcc1f1feded367e178fef0d37b8be9f1783c3ed8dbcf39d7a3a60d61737b1b11b36a5e6e771505b30caaa5cdb2cf49daa01122333ee63d96286e98831d9acde2df16e91d66369b5c8e59ae08b117ec4022a2924145482903202aa10009d80840550d3900003954d524316bdff2528febe58616eb08250001184d9a930b170af4c38dc0396feab2363a81888b06bc23d69c434a6ad52380dafb60bd35aaa042808aa04a391b3e098162c822c68f65505cb481991501086b5f2d168b18e3e664124268d837be812e3dd9bd7ff7facde3e7fbd3ddfd972fbeb47de1bcafab08c2ce259594b35b5e1611400058fb6d0000f9eba233f4d5b799dadfae522e559130a79443a42892d2e3fb0f6e5ebb7efdc3cbcf9f3eb3713a8bc5a2aaaaa669168b85d80106f1e1d058ad306f44a4ebba524d290239c3eac84a26769871294f23a2fefc97c34b8ac92dccbb536d658482a2a7d97c7daf239c38baa8a6208d362fb0fc39c389cbdab3051556b448faf3cf32746201c011990e2d0c925ecb4946a8a04b58ea0a975815fb0929fda8c16c51ab7d0866ae3d3baea9eb3a097121c7dd7cdeb5edb3478faf5fbaf2de3ffce82fffe37ff8e6b7bf355dccbb10aaf188c02d4267612deba99da05f23ded0571e99e5cb280205bdf70868a2e7593484f6606fffe6f51bbffac52f6f5dbd7e74745468749b9b9b26de332c5d0c4b08c35176fd3cc9e5bca0a10d3cd51b35f0064b14374cb40cdbaf8633b9084fa8f0c61310d194d3296d2e4229f92d45522af7cd6907537c07626222627096aa21a453495a200040b05e49105111c9aa29a521c04ec849552daa02603fa6338688a23284f7d9307be5c1e2745869c7741596c5cf7e3c91497ea9eab3274ffef63fffcd683cded8d8186f6dd6ce83a882383ca58da9a777c21a995f02580ebb874ec71e2a2231112001eeeded5fbf72f5a30f3fbcf5f1cde7cf9f4bea9b2188a8ae6b38ddd9b4b2934a26c6a062dd1b56492fc167e94e1e32e68649146bbc7861a265c8b31d26638609e15311afa28296f628eb66a37e7874afb547848ed91123f703764d691e01504c6b1a52e86030c2cc26d267d0a80274ea7c962fbcdcfa8404a468ffa2c6bc92007f21e3f764febca9ba88d867585a61ac57d3de755555755d3be7628cb7ae7ffcfffde7bf5191bffc4ffff1d537df389c1f2fba767367db3258bd47ab20f87513b2fdeadbcc3389015a0e05ca2921605cb4f7efdcfde5cf7e7ef5c34b87fb0731c61c9311098cc969a3478a96dcd9ace9d0c4c180035458e065b7bdb033c36e8b7ecf4a8e74685e86c03637afbcd0b0760aaaa6b277328064e958e2d23032924322b3b0fde7a45acccb40a3c07e89a0d6dcc1cccaa7faad4fc66aaa28685601eba45341c1a1c7fec22ad1ca1a6ade96c10da5006b103592ad25d5d8bb8fdeff20e7bcb1b9b9b5b5e52be78957fac2048114f2523b668dcc2fc52a232e875db6c6f509b9eb16edf3274f6fddfce4d6c7379f3d796a539c4f3287885dd7599672a51fb2789ec53b2db8b28d38d4e029ee99796267bd38383d2d6ff8422b0d6543940e3b3fe0748b330c68b7c3a6674bbe0732f10000200049444154780effca94bece9e0f9d56851750544054702c04706676758f4f5d16693314e984611be7b0097b7867f8210c7df852b9359b59fa60cb874c44dd6c7ee3f2d5bfddfe9bd1c6e44ffeec4f3746a3aeed90fb2fdccca69c4ed5ae91f9a580e572ef035a8e0e8014528812e2ee93a7d72e5ff9e4da8de3834356309ea79947db101661d6753dd4bf198e9ab42c45a9640e2ff676df3240c3962e38cde92936f0859dd039c7810d0180dedb2c3d2800b4dcf14a0445ac59fb39287d7bb122423f1c882c0834912d2e59d75211b50b99bd1744b5790d960d0210c820cbea0e9e9c98a5870d8d960d06040240a061c3e710816759be2bdd6443954dc3e18a0e8b732e85d88c4787fbfb3ffbf14fb6b7b7b776b6bff99d77d191b5f20dc1d96f89af0b38bf0edeac3933c3201315a6fb07a90b0fef3fb87ee5eabdbb776d48de6cbe10d0cdcd4d0098cd6616ab943ac7b0c1a294d4cd0cae0493c56bb567f6c296ce79efada7e45f74ea8aad8b31ac10745ecc6b2b5acf88aa6043166c475ad65345915011816809465555ea110c560329d21e36b50154555675c364d8c8b284ba51174068259b05f93347d30f3d85a1c75bd26630201e59b358b9ded91513d572c2da2ddaa3e3e3cb1f5dfade1ffcc1850b175e7ae3b52ec50ca7c1f9f56ae9fcea574d1c43ce965af0ec4834b7218688a21f7df8e1cfdffba76b57ae3ebeffc0780555559dbf78e1f8f8783a9dda0c4923af0d7b9d4a1393a1b1ae6bcb46143e8de5844aa363e960b606cec2ad5901d830c41ab66e78379844a42a4b699cd24d768a20ae1a352a00629f7a469b86a2ea9c75604b56252466464004f4e4000045330c2482407dedb2497caa8a68ced9780b95f734f0ba25652025a259db02408681b9ebe7b224541846d42b982c6d9ff6964bbc6dc72ffe48293e9546969412a8e69c67d3e9c678d280dcbc7ee327efbdf78d6f7feba5d75ecd210a61356a14a1ed3a6626ef521756d2b66b64fece56cfe714093903668f9442ec66f3470f1f7e7cfdc6cd1b1f1feced196c50d57b7f7c7cbc582c2c80b194bdb568ac744e0eeb7e85255b9806a6e0587a118764a01712d657f62b9c26ca5af14109adaf9f1404b4dccfcb7e7fb37e357b41514500b1d40f03212911836615449beea71990553380031444429382475145ec9bb35401edb74c4aca20daf8de7625d12c22a05924236a169b1aa87872bdc867d81467e7940db5e15718f92b5e2e0c7492fa440040993bc6955385fb9fdebbfce147e72e9c7fe39db783e6d876e8b8aeaa9473ea02d1d7679ed1571e990e89bc03cc29440005d5763e7ffef8c987ef7f70e9830fefddbdcb484d55274a961b399a4e2da9634d5e45aca06066a8c16566b3447d45b520a564335b87159495ea0b9ce99f5c81281181a8434054a2be5943fb2a00109a97da8f05230063256454c4e5885b1544401050f5aeff0b3b068182022239ea13b68c0c3642574111638882aaf69a969bb5001d044154126806cd680804057b6b88ce081550425d3cf58e4ed74860c0711f7699ad44a14526a25cfb6cd9586e4b0a349517d5db373ff9c71ffda8998c2fbefcb2afab2e464869b2b39545628c93f158525e23f3cbe1cd227a622500cc1e2885f8e4fec3cb972efde41f7f7cf7f69d18633d9e3092755dcee7f31043f1a0cce85907630164f13c8d535af8062ba98bc2172f9bd2febba2e5f359a23efd73483c7b461de62a57cccea91613420651cd3d4d007b5a0d22d58488e49615c8be868948800cfddfaaaa005968c92a029055f2c92b0a016116c8c20288e43d2bf595d2b66d151199fa416622a2222a803cac03ada8310c594443b33954e82bc4a36105b5a4a0424c16e2c61891e9707a7ce5ca95adeded3ff8febff9d6bbef8eaa7adeb59ac53e38138c5f23f3cb919ecd39a784492c483bd8dbbb76f5ea7bfff8e3ab97af484aa3ba1191e3f9b1b9a38bc5623c1e9bb554d5c56261b05ce9092e0512537cb3ca67092601c03967f2b3e5326f36c10a7170a63bf485caeb064487c404c3cd5d7879704687124099c8b2b556c63ca110c109e7a1afe81a8977200c6d65c9a422a054555935494e9207bd604442595100fb299a4c88984143084a4848c6102ae7e9067a2567f5c1e08c166e49ad0d03e9a1f0ec0af728e6e42a9f536adbb61e35ceb9e9e1d1d52b573efae0c3d75e7bed95375e17911c222030926659574dbe148bcc71132544220e6dbbfbecf9eddbb73fb9f171ceb9a9eba6aae7f3f96c36b3911b366cc32c6108a16d5b9b2ae7bd2ffd902b5b6448c419fa637df2f0f44caeb34eec0ba3ca622e58850118898987e3f454954f323c27f06304cc81960fbadee3b682869ac808513f37b72f0fa67ed39bd66eca39e494559c7349724829a49800229afa2e22bba439a98a95884545254bf6ced99e377191be7d4795195557e705ae347faf8c155c11bc2dfa6605a2678573012049c694eaba26a2e7cf9f5ff9e8d277bef7dd73172e54ce07cda8e08973fefacc19fb3a78b3fdad42b758ec3e7db6bfbbd7b6edcece4eecba9efce51d00b8cafbba02518b0f4308a5777125461a0a349bc11c0adb996725a7db9d86e2402fcc00add85233680eb402f0cb01b8c33e154b1a0f5b4011d181e6c5cc2df3c6bde4cfb299db7b6f6276764a0ea978e35629c939c79c624a51b2aa26c95d8a21ba94521223e20361d5861463cc2a44a4842967cd3a7675b6149348cea0a285ada00a43f761980f1b2acac392b85fba02e0b4766ee13f0e4b9daef25d0cf6c1c618d93bef7dc8f9ead5abaffdd34fb7b6b6de78e76df62e831211cad7a7cbfa2b8fcc1c3b2252a014e3f4f0686f77773e3d26c0c6f9e9fe418ec9d75553d521c598b3730e97d6d2323745df7998d92fd77e22f2de582959b5d7a10b2198ea6cd97cc3961423e2ac984d027166c9040085088980089c62c3e0191d11331231485625119d8c1b5221724440e480818109059d7aec1528ad0e54ca0c5555d5be32de92b9e8cc4ce48ab94e92534a5d8c86c32839c61862341cf651287008a94b51552daa8c926392186352893925c90934020a881266259194b3020894cc2d282d290d50e8590aa050668a166e46199168a70d038690aafaca776d6be226b3d92c778147e31af1d1fd071ffdfafdb7df7efbfcc58b9bdb5ba84a8e61c0005923f3f3b681ff5d3403149134996c42caedac4ba1dddf7d3edddfdb1c35edf114528c5d40d5d164dce068deb6b3d98c154afda3581ea356173de5a2a02392a2f957a802b9ed42d7759a05c0fa8081c801f41534424240546bb6520b8211d0133b764c88a280422aa4e0911c0313360e2b879ec91139244272c884b563266442769e991c79626047cae09890970279a549bab7c9641bda2d4335188fc6d619a36a89552f526715bb3c7594a0aebc9f0842d7758b36b45d860dafe0638c6d4ca2c2754dae4a59a6f3999552e65d2b8a0070dc86e390181d306489216649b9f7b411451114490101fb981734c6c4de0de3f6a2fa59748cec2a635634c6aeaabd48ea16a96272228ba34322dad8dcbc7dfdfa4f7ff4a3575f7df98ffef47ff0de75292a02e37fdf96d63532bf10182b78ef63e834e476367ff4e0fea307f766d3e39c52b7680970321afbba02a445ec52efbe926d0873058d3660bb6138886e2087a0809ab3517f926ad6bee9e9a4fe694612911181011d231133283023082339c29a899c3a7295e3c6b173ce112269cde83c345c3b465276041e1ca1d6be4154870e18983d331239a45c7383a4bcd423305a8f128eeba6cfa3226896bce4328146246146206074400ac25953275c8fabec5dd644c059d348ab0dc7b0dd245011e862e86208c9ac3c8b229b994d19630c5904d42b6cd4a30e202509a917e1322e6e920ca2200268d7262bbd425c4692c3892c709a497b12a0623fbb8d04c8fa4b15282ba8b4c7b331d1c37bf7af5dbafcd63b6fbff4c66b981312aeeb995f965539df8556623a3c3cbc75ebd683070ffafe209315f71511b521581a763802c81c24663625ab12f99c6a9824481245242589319bb7657451a241e3180212128127b6712966ef50859108d5a136de79a6dabb51edeb824cd471c5ecb0e6ba6262748cead11383274f048c8e19993d3964f684e21c10648b0019acd9031461d4d4e63d66556089c6e64512014b8f2929030b0a0a26253f6e042b144c9a244ad2848202a054257bbfb90a29c52c31e620c2ce559e15a80bc901b4316611669e0953964ea280261054110554646601415204c824fd756bc93d80816c52ff3d56d530408517297a8282806ace2a9052f2a3e6debd7b3ffbd9cfde7ef75b9be7769c7749e46bc3d0fbca2333a5a429c72e3c7ef4e8e6cd9bfbfbfb4414baaeae6b2b392ebaae6ddbae6b81d03b67cd99cc6c59bea25f5cb6c5b0510b91720e39f7b43bcbdfda57bf1c7a4725f753f9aa72245d64028780a09ec8337a478e617b3cf68c8d774de52bc79ed11103cae6645c39ae9c37c3428055dff18c88e8889d73e6fe313311a8748027dc7159d2e508ccbf060720a08c8a040268bd2c83ea22e69c49d05525de63a944c4abaa2876510990192ae7369a3a09b45d6c63e0aa6eeac4ec62124fd8864e556721d1ace394312711069028bd46113b84441685838a664ddab374e945435c86d20a275749c0a46a85592db6544196238c02c89d3b777efa937f7af9b557bffdddef484c6735f2d7c8fc5d658022881e1f1eddbd75fbdea79f86b673c0f3f97c67b21963ec420c4b1eac25e599c8e8b2a57e6df95b231b1482c1c9d64f9a624e21e768323aa8a86813e397d77300704ccce89c635467557ed29aa9f66e5c554d455b93b1f9b435f3a8f6de73e59d23188f1bcfce7bef983d9043b2e9d79e78d8cf694612515356c433d3f8104cef6fb9d129f5a258d2786fd16721eb17a1937e9c3b112d794e2965479cb28a083039e715a00d71d175889cc4b1af936496d4769cb3d43e47510e9935134a640a9a53ce11244b2680085941ade5c53243961b18968e863af7a7744c4e9782cd665a806149a3c562b1b3310e6df7eb5ffef29d6f7ee38d37dfb4f4d21a995f967a6617bb278f1f7ffae9a7c7c7c7d8734221a4d84f35b61a03f45a0455ed8bbc8559c261ed7bd8ed55e64f0efbbc7ab74ad4f089888c8ac84ce0080833ab3a04c7e0086be79aca6d8daaa6e28dca79d2c6f1a8aa464d356aaac65bdd831db1f7de133320035a2573dc34c32a4ed68c020ad9a3b9888ca4c6830520410125004124200565a7aa424a243196ad8fa084da93115493aab1dfac209a501808c9e5ac228244cc4e101c8043657631255755490442b360085d12c91363d227c44c1d0225694572969452361513b4cb0af52a4021c3e9d251e1cd16aae3b076d50f065fea63f60c7e422b02d91fdebf7fff835fbffffd3ffac36fbffb2e2a7c3d66577ff5394029ef3e7b76f5ead5bbb7efe4104154521e8fc79a72696f924165d230690c9ed25652eaf2564439d5cb9f3567d50c68794f40504155462542b27812881d3a460fe8501aeae3c9a6aa9b9a377c5579dca87dcd38aeab71534d6a5f37deb365709c75c9786234f9224042acad768a608a7764e519d421e5c6c403013003b263200645405581a4d6c609cc060a50859c05b0f7d873ceae7200ae5827470e2a9288994a8f3608287bf2e8805d20f58e951ce5665461e70368eeb27240d6ba2258c4489873c6a4c91180606204006400064080dcb385e1344fc8be8561d5e4643e521f3d9cd07489898832e868346adb368b08e3b56bd77ef1d39fbdfefaebe3cdadb5cdfc52ace3c3a3fb9fdebb76f9cafdfbf735a61c1344dddcdccc943846d518424822cc5c35cdc6c6c66c368b31dafc12180cf6304c96b6fa1339634195138e0bdb5d1546cf8c9e88998c19c78c35424d6ee2fd64dc6c8c9a51d334158f981debe66834f234a9ab71d38c6b66460204145f55864c678550edb5c5ac3cc87d21844aa6874915c184ea60b067a1886e808a080b99fe5d33d9280179515d60e6c52299df6ead3322c28e2bae16d279ebd52644602014910cbeed02a23a52ef1d8feb91a7d67851ce35a16abc5bb46e1e62d51123306a2b1215424e19d0c4d3b208803a443843762f233a0b53125e34ffa2585a602280d1647c7878d885b0f3d285674f9e7cf4c1877ffdd77fbd46e6ef60c518ad6fcb52a9ce390d1954c37cf1f8e1a39c5253550970346ae6f339a82e42b7e83a00188fc7a3d10899628c8bc5a2247b86ac717362cd712d3dd0f3f93cc66cd76f6646cd22e2089b515dfb4a2413488dec1d11a1f73cf67e82706e3cdedcdca82b47809583ada6198faaedc9d833d48e2b478d6347480840e87cd5b35e093db12376d84fc8ed87ab835a1c4b96ab451214d38c3d69f50635ad03547008aa24e0accd32869e2c5e3b37691a588a30405599eb6ea05daa076ae39da5b5d43abe08919d615ebdcfa0aaa961744ae8e9e2f6a64ce7b5772347f39a675df033251042a52e74390350306d3e150505051125e0b3d322acb1aed439ed9c534a0062fddbbdd30b9073d2a44894a6d3baae13e86236ef62b873f3939ffff4677ff5c31f8eb636628c650676d3346ddb7ee532435f19640ebb104ed2ee293d7df4f8f1c347d3a323c8421e214b90104250116bc32d9dbb29c6b2dd57aeca253f54a827e6ebc6182db108a20082aa20d988aa35b380304045ea099871e478e2f8d59ded91c3aae2da7353b9f1a8d91a8f265585902bc2ca7153b9da31335bb8578f26bad449214046b454243a56a5acd2f3eb96da020ad99a835135974f46959763454a19d03eb7ba1a0d251a8a692ac3888693e71140594928435f1aed3f1c00949c8d5a0b59330550144694731b4d9764eeb8aea822c49c2446492753ae055411b41c0b5e30396285280b677a00ce2a1249ce607af608cc0ca287fb07376fdcf8d3bff88bcdf33bb06cda2efd656b9bf9c52213066d7e963378fcf0d1bd3b7767475346f2dec7b6b3f2867162ebbab6af27a5641a7936b7fcece8ab92c737ee81f181baae63f67d0b2f00823263c5dc381e570c5919a1715c39f6de8f47f576337a696bec119c73a3a6de1837935133aabd2722958ab0f2be725cd5ce133b222074b503e815190b3e4b3d4640cd4d354d67444ce944f298fae490aaaa4d3418b63517deef70f61122aa92fdc1324f0bc00c603e3ce6984988f004e4b6464d25a092210341066664024c3913b04326ef3b70a02a29c7ce5aaf99515525458bf34549ed80ba0abf15d2f22958f6220c27ef4b86426a1932a88a30e0c1eede07bf7effdffed55fbdfad61bceb9f97c5efca0a160df1a995f00e367d0acd0bb3d291d4fa77bcf7721e6d1785cb16b89446221df31f6842f4bc3e69c91e98513e956f644e98a76ce1101aaed45ae90c695df68eac63b7658338d2b5f577e54fbadf1c6f6a4197b1e79371e371ba3f1a8a99c7384809247be76cc9ec97b5fb163870408d427187be6fa52461d0078d96fd5ab900d67450fc4c8b5c7999a5f2af002add715ed92f24e87d9af65d5449c73a0c4c38963d0176c45449c8a90b05006004186902200ba8a2b424f48aa90a517500f9d98d8574e1d28810a902ceb4c677583568a9c03609e12f2b37f2c1dc0ce414a284a88ed7c71efeea737ae5dfffe9ffcd1d6d656699d1d0a1aae91f9f9af2172acead8a734626ae7732b40f44acd9215c12aec221a42086d67e513a25eb06ae84a0d1b948acf5c06d109a871d999a966ae989a9a9b8a6bc69a785c559ba3665257a3badad9d8dcda1c8f19c78d9f4c26755d3b2444652267835f6d4c0023633f73c5144380547b77957add2d0076cefab6c8246369b98f05578a996cf68db0cf185912b30882a4301c22589c79f36fcbecb0928c6946236b2219c038ab6a48d1d40e96d7116dc0b1a020a4ac396b4c525796c742ef7d4ac2cc02980524a28a64016b4829f48c95c6ce53a29b4b2b0ad88bb094dff5e78620aab5735694b61146ed6c7ef7eeddc3c3c3cdcdcd6160f99583e55709992bea4f76c96fdb76b1582c66736b119e2d16d64964bb27a514426cdb368568575936c1753c3126707a067b39b265449c73aa5951c8b1af5ce5b8216aaaaaf1ae6198f87a673cded9984c6a37f27e7363b239ae379baaf2e89c23c8a0ea106befeaaab2ea1c23119143cbe090a05435212a19e7dbf69069465a35065100984e32b1ae66d253ca7ab254c03bebef0100682e83eb87323c5dd79559a0b01c31a26ad6954e4b60ab8092d0f012d61f52323b174573c85dcc04285ebaaa4a92b7c663729528091074443186948320118be259cde8d2d5d9973197970687a4a06799e716cbf43317425c5297f1c99327bbbbbbafbffe7a51df3787769d01fa62bdd993ed28d275ddf1f1f1d1c1a12133e7bc98cfcb376a43d14348a5b3c43183994484b31acdc368a4489078ef9344d3f21a8d4663e76a86b1afc6b5dbaafc665d5fdcda38b7b931a92a4f38aa9bcd71d5d48e20810a013876755579ef1989984a9bd8d2322343425264e09ea58b6a6dc8d6d304a088064bbb2c91c59bcb5d6898343bd923f38cb2c9a909d92ad01778b867002cada50279645f412129da2110019150c43997544869e98d028b73222925977254032da694c7a9168498157d4a00894889855ac40459a2b2bd991570ae68b79f5c340161e0029c3c812827919419298120a235dd3c7efcf8fefdfbdffad6b7cca11591baae87c366d6c8fc4dbd56fbe83fe357271c8094731bbae3f96c36ebba80842292a2545585980160319f8b48ce7d5267388c6020b07a02cea2b96ebc9f65533554cc8c38aeaa495d4d3cd7cc634f63efb727e3ed517d7e67ebc2d6464d8e502be79ba6aab93fcfbaaec7e3b1672702292564620466136b5ee64591da6e468078467004ad6b8310078d8e2634c2683d2d82bd3a1ea96626d7df470141454125194cf82afeb921b3aaaa323cdb2c8b770e897296c14006cc398af472810004598c49af84282a2209d96172c0cce2c874e55d55555d888a149284688c8e0a9380e032c3a53208838782b4cb6f44551141945015cc8b1e3ead8fab454a1f9c017af7d9b3270f1f1d1f1e6d4d36fabe79e7866ad8b846e66fe2b20e6693e0406c5b108819408188014954424ad3f974f7f0ce277736b7760e0f0f178bceb92ac61cbb64c91e66f67ed9b880404c8e18914955c054a17a01c73e4e234c12734c59137b028094438ddc30d70a3ea7a6e2adc66d8f9b0defcf6f6fbc7a7e676b329618628a93d16834a98931831038768e7d8dccc844a48cc48e504551b2aa48b6c95f0838994c60305ce8241792fbc93f4573dd38398e5834a9a031c5894da88b1c7b400625810c8249a26600d02c90416d8c4f6f0d1109b1f2be67c021123be7fac4121b394e5424ab00011231106b86cab1e5a524e5acd6ff4d29c48891358174005a93d32a33f3745491cb88d8338115b08b0aa99f2666ad7336145872ce19190484194554725451bb7ee59c451100d9c818cb4b73b708e3d1d88a96cca48a555513f9d0c55ffdd3cffef71ffe6f0458b14ba021a79053e5b964bf97b9ef7e6be91a99ff4d36134f4c67af348e000051b27143fbc7456647d3a70f1eb56d88315bd54ce405d2af256944368027832a089ccc4a38a1682ea5437a093c06473cf2558d38221ab19fd4d5ce78b2bdd16c54eefcd6d664d434de0981439a4c264ded5101241191f39ebd4344b52609230a2133e10a5fb488830d1bf911119860a036b2b427cbf64514045410e805635134a1f1df0014851085841444910a99783038b0a479b19ff4a768aa0b8426ed8e02c0a0da2782bd3f1113c94cb80ccb2b46524239e9a804144879326ac8892a869436820f958f95cf885d2764d40e2245b40be219892005405251444267fb6068545786a69ca4060150f46877ffd1bdfbafbdf65a0621ef000097338a1040b09fbaf9259fb7f995ca0059aa43154543084f9e3cb976edda7c3e8f5d2843d40be7ceca92e51b2d015e8c26ab716a7cadaa7ae711512097babc43f2ec6a5fd58475e537c6a3735b5b1776b6ce6d8e279eb7264d5d554ce4c0f98aebca39e232d0aa1f0b8927955813c873dca749579cb721664ae2f4452dc5bdd2f1d0b55bd1131b32280891816ca2c2c9f63d259fa9abd3e999608537d74bf571393da21339324624022505b64e190626ccb2b3292e46250aa8492998425f97e7b98b5993e4e21a59d679390a108868592a5922f033eadb2be7b97c27fae4c9934b972e7def07dfe7da374d9d97a32ed671e617c534b02275ce19b2b66dfbfcf9f33b77ee8410aca3b9cc3ed0657daf70124a9c79f245c2b0c908074c062ddc1166f24c84ea894675b53919ef6c6d9fdbdedc9e8cc79ec6951b79aa994194d8bc3e62407668f23c440472a25bd523d371c9889e55be2c858dc21c1cb2462d775b4e7845725a5f341d4c01909c2014e9aae1467f31328986e19f392dcbc8b3f4520e060a22109103a728b0ec02812c938d11069701a34a4cd2c6ba4b31a1f8902b50d30aebc36993ae5d36649650d0fa4511c4925bc5b918a6b886bdd73967484895dbdbdbbb74e9d2fff2bffe70e7e279228a297e06bad7c8fc3c16339bae1411e1724246912f280dd065187b997e575a2e7bdfb5af920d77f6c94038446024739fc832460a15bbcdd168676b637b6b636b63bc51d735e378e4c7956fd8a98848f2c4153b573b853c48380dbbb1a1d8ede26c0f45fa0a320b810eceb0d2b03f6dfc2cb1f3d5f426a2029bcd5c61d5ac20f3c4de9e95abee53a1a7acb175b7aa6640015562b0865501f28a3941035e18c692436eda98dad0b581a36853d509534a212501918c908d8a84604324caa5c7f4ea534a023a2c38976f7cd875dd1751409bba8a21dcbd75fbd18307dbe7764015b2f48efa1a995fd0ca393392730ea49f2652d7753b9f674c2bd215437a5a4166114d2c3b72a56a6229c1f220233152ed78733c3ab7bd796e6b7b7b321937a351ed6ac6865dc5266f4319941099a8f25efa240b0e62492422c738d4801fbef40a1b6645a3fd74dd8f0a54562ce4d9160d440464cb85929ee2399d1c136105e4a2026786670ec91ec3d0dd140b80100119590108d9293b500f58233422234993582dbaaa6e5d97b5aac1ab3011a3663d190d86a745468a9f6e190138a3107d963f60b9bc949223deddddbd75ebd6f77ef0fdbe4dfc4593fbbee4d3e3bf62c82446e75c68c3743a3d3e3e2e15e4e100af95e1d08501b32c1e980f7662916c748767878880222284f8ffb3f7664d7224479aa05e66e6ee119189ab8a55c522d99cbe667b5a66bb1f56761ff677cf0fd8a77d9c9e19e996e96e0e8f22eb06f28c08773753d57d500fcfc804c8dd1512235d220829816401092010116aa6fae977884897d290f3c5b67f71b97d7179f16cb7dd0edd90d350725fb8432400722002e12c18c02fe694d7e633f143c26cd8fe447cc99325c1aa5fead700002000494441541342ccdb43d4a3f2430fff0d778b8cbaf064673e292dddcfefcd25a5e1ccf9cadfcad57e9b50fef6c1710ebd9c59f520121a0011a21332787377560483ea44cd935a5767dd8fc721f3d834713bed3880d083348c8448e8ee6067f3332f067c4f46e8f36cef154e5b7f693c1c8ba4c37effabfff14b30b7da901089d4edc39df93e4120060098e7f9e6e6e6fafafa7038d0990065d16a3d4e073947234ffdec5299e7dd5d384439689cae99a5ebba6dc9979bcd6e335c6c86a1ef0a7362e94ad9f6b913d679043561e9d2a2c97642660cefd6d535339e5e7c816f292ddecee17998ab1fdf81a72bf8e91a10ce0242cee58e5191600ffbfaff5f24b527bbfe68a1cf9b6722722747a713fd88882c768ce8ea6c669d49cd563aee92e444257a8cb025006400606467048f56d61de0b10b89383e094759e386576cefa1eb31afd3345cecc63abffef63b8ca637ce5c7fbc187fbca5fb50997f545996525c1799eff5f5f59b376f44643a1ee367e2a319a1e239e748efebfb7e1886f08c8970bea9366616c6f5c39424890801ccb59ab5c5fb83858904a9cba913260402ebb23cbbd85e6cfa2e2136e59cc941188b242272c76aaa6a40b8ded2c15858bb65c2a757d079c0ebf93dbfeab69ebc0ef1ef7a7c712d3928412158e904b12a5c2ed1f30dcd593036d84392ef798ac17980172ca7c0c2d380c7b478623644f3e6e6aa0a6892a8e742283e4f90656a6aad82d73ea7fd6c39318f0dc02445b69922a2c66c69660866565599b9506292d9c735227185f1026508176c38f9d606d45792dcdddcbefce8d597bffbdd9bef5f7f7eb1abb5825b60ce1feeccf7b0e73cbb3abaaebbb8b8d86eb7a594bb9b9b78dbd674d4f5331d02e820d0c690098f4d2b4f4d132262ab1500c2ab8ec2f5dd0100b456d386aee886e888c0e8e4488260cc6e2baee38e8c00e40f473e9ec3334f6095dfdb31fee1cbedbc209f0ca84fa6d6e54e267ce71ffea4f57d72573f9a721d11b1353bbbab4f0ba735327071215a9fc31246460489500803e56674068c2f08109094dc1d1851977bfe11466d8ff339df46bcde91ff672e44912e757b7b6b4d531603f4c7db4b3f5d981f9ca0ff04432610ba59dc0921bcacb58ee3a8ad9d6b44e2cd0bc17e70b86aad61fcb3aa2b908016fc06d197452823656609493322010a3398223a33962c25a792458496d51e99001311322311388a93a33d54269ccd93ae2b5a0bef4a257a1b897d779349720681c039ca841434170480f89a9665e4aaf97c8ae53c391d56acf87c16884ff4e313e454f6e021b97400008ee23c0f2013c024d249ca2499822cef8c1e8e240ecee800a8e4a0be22c0f126aa1b9ca8234f9ed2fa2497ef3c9db951a542ec6afbbbfbd7df7ea7aa25f5b3a9af210e1feecc3ff90311d56c9e671be7e3f1787f7f7f7d7dbd42b22b7017d3dd76bb5d232e839e1edf16fe0688be260e686dd61ae383cd2cac16b2594a97ba3e6f866e18ba61184a89bc2d2753745ae5230f90e9191e4be07fe06e7c12ad797e09c06386f793edd11a8f7d1e28f8f66d796a3170e1bb3c2ec5b7f339df692c70be2639fb555a89010dd42094d60d8171b1fc14a1c688845c249594bb9c8fb2f8031244e6a7c7b01f8c23f4d3257bf6569e61e9703e3faf38df7940dba2b369cac2e85ec7e9fbefbf07331199a74627d7ec0f95f9a72fcb2590b8e9e170b8babababbbb0bdb75735f3940cbb0514adff711fcbebe73f1f10d24c65d57e2416b2d923697b7df0c1d88314bea73e9fbdc75b9ebbad265c9cc899cce1acb18bb30729bfd494bf9a8ea10deb97e7cbb5b7b6255feced7e10938f9ce9a5c7e3c4146ef3e23defab0ea597fe88fb838fceeb3d2dd11cdc19191090dc8cd23df81d981c521e79c732e92849809162230388183393a68f0f0d65710f90977e2491ff124e10f1e5bc6a49408b0995d5f5fb7d608d0cce8830aecbd56664aa999eff7fbd7af5feff7fb9c73e4cbae7eb06b4856c82322b46bd50d3fe9d696a1f46432026ae00aa71935b6a04b4025c319ba6bea468c801809ede8f064edf18e09991e4d9b6b799c87a9fc81c9f3495d3df81b3cde82bef3fb9f7acf9db34fe91debd3f3c7fa94cd141e0bf116bb500ead29c4de039191c85d453055554021c82225e59c4e0f6989a59a9a2bc66deeef482479fbf53cd7d0befb3bcdf9f43601e0dded6db44bf0037cfc90b05934234433bbb9b9f9ddef7e777d7dfd243cfca19010f7fb7d94e523b15f6c290809f049e865dcbd7062f389083f5e3c3adac973276049223a2d1e0d43b411bde3f9bee16df4e2f7f5b7ef8470de596b4e8f6ad800d6700100b0b3df6e916ef9f813fc88376b7f80d5f07b71387822a35bba88535426020027c6996a101cd6055266c92229b188246dc680a688705acc3c2233acefd79323e39c41f564a519ef26bad75a41f8eeee6e3c1c7f88e2cc7f7395490ee7e75b8069311ec4eb4bc45edbfdf5cdf75f7d73f3e62a132f67eec9ed269055770f5fd975407ab018f619819110dccd0ddc91399d79cc9e2e4c424453052420f4f8b893230131d029e68f9001c0d020b8dd4faa0b184001c041c309e45444b1513b2dd570e5d241348d0f65f998a8b298e2bd756f3c495f07a778c26e88440e7a7a2608b1e10ff806160e1000b86b68b69fe8391eb18b09177d86132cb8ae93eb697ea340b81c7d917c93a8fa0ab712210b4a822c9084e6c6e44804e80de1f46c62a9e9861e6a35d2c7adec13bba6f333377e9585cc5a730392e3f138ced30787ae3fcd834f0d9487a2e9f4e85226c404747f18ef5e5fc1dcb65def6acd66464a2c6616e9e56dae6daea176070cd339421677576f5d096bbca6da5a332271464c52a719c34615ddac811193e72ccc49b823925aebe170e8848672d1e5ccc0e8608a8929092079008908e48ea66616470908d11284857ec2326159ce47bc15124b3e2deb70157c63002588b81ab42e594316f4d6f5408b804a370700068685570e898a21106672c27875dc638a04470474d0e5ba438b9a5b8d3f11311492cd549be65c0c9d168bad25728b011198d79d2a7ad0071060ae8a293b3437dbec7606707f7feb5e5d4784cae2595235037735303729b9eadc6a757742227037abb3e62ea9db939eff9c5572eeeee5ae3a4d17171756e706fafaf577d374ac75e22efb82ccd287cafc23ae4d043cdb38c52321596dadd5dbd757dffeeeabc3ed1d2305dbe609d479ee40850f53c702c39836475b8e59e1b871abb6e5de889c1f46668c04a152fa944a225e074f78b8d75150108100c11bbcdb317509635ed00d30403b356fd139339c363ebec4044566b32c782f70202227aaf71f9c9a9cce2b1600106445810008717d752160b0f5c2f608e9233873d0f220e407d3182082fc009c1ef2a4ed617a26277bb8e9755186aead6cce5d5f988c5139ba5088486c38f995458faacb33f777eb69e0c49d3ad7003c0cdbee06cbeab5eadcdaec0840086f35eae79fb40f95f947dca5ccf37184b9bd79f3e657bffad5f5f5b588b4b93ea18cadecad35db0bce823189a8b50a14521394d3b4a9aa749669f390484d9ce5e492ece1a9b3c4107150d4e3c31361d31e0e3908eeb8f8d7c1a94785c596004effb374b628ab83f36225102696ce89307c7f96c25a1aeadf57976e080f632db9437000de29b358c7cf8779f1ac25455a5a663857e390b3e3325c3cf89fc0a2bab6f51fb5521894001921311260493c7479e84a621662a6ba8c068082a4040e6772537f548d6f2f78e0b168e1ec97e8dc3128d4484f49fc1feecc3ff9235096699aaeaeaea669da0e9b759979be948b1d269cb8ec70261a12a6a63338f872d93e38b89ecac656190a9a3b98aab679aa33ab12b8c41f4ee4993312d2726aafcfc1dceda405b1184d4f17260118d2e238f9c4ea16cc0d1c0c80908080989196b90e90c097890c0dfedf98d971bf3dd93444dc6c3c25c253648b9f84aa0b37354a5bd70305001d2cb2a211d0c9173ec159c92e2059b07611d8c1e20b22352302320f5f91c4527216420aa8db1dc3f97e2946470c448d5cc1108816b7857762d7e7ce0ce7d09408afadef388ee338fe4138ed4365fe29b059224ae9515cd713d8ed7c0976ae845c7f3cd1e8ac9da8422b55005c63885b6fd1284253d55a5b6b688ee6e00ad680f8ecae8edb0e8d96d12d6cd04f080fc6b693ce7626e71f136beacb1d0bf19b128b130a820112a0a133c01208fbd423839ed4a49ffedaf5e99df2ea6d854f235f70a15e3cd06621be0bddc22ecca20f0fbe2c85f3c0c91bfe0c92b29065465369aee6884e21256504074357570423f44498534adc1889a02138ba07e79e001cd089226761a5b6ab69fca54f40afd5b3e29cef1efebdaa8ac488384dd3388e1fb626efbd324584d44564b3d9448afbdb0bae735acc3917f47c2761b6c2b0b83865ad6aa9a5420cc11c144dd1149d999005892036e389d8a33e17ca102ac4c6653d231c1ea63b5b87bab77d0cc2a27ae59caf5424772030448e4c5802fbc3e8c53bbb357774082baf05fb0966e2a9aa35f8aef05889b22cfb23583edce1114f0ac7f313860023109af0b1ce73795fc01cb0c62b6086684cd0e7dcc99c8418095dd18170b1e43c4d07f8e0f84c64cd5783954753e299b6e6fcce44446d9a588830f22fdef6b6fd50997fe2569689da34a96a98fc1e0e8727bbefb52ccf4509e76579627b01011391705e190878e675b0fe21424c41fe244e2c08d07456658087a4100308133ea46864fd21f531ead3a347745c6ec587339c60d93e9cd8ef1c5b9393cd3aacd00b000084b494de81fac0036ce38b961963d43ca7373c7c3fae8c0b43675cb68e113a145f4781e17a7e9d9ef393fa24e730e50480b887d11dc26414d09180d10d4108126349d495d49754d292b62084d541102b3c28513d1a7c207eb4b681772e8acef72831222fc2237ac838fb215e9b3f30de6cccf4e1fb3c4d5396f484ed794e773e5f512e8404056da19ea0d5b95c555d8d30d2be90d0898119854812913b813302815bab6660dc5c0ddc5cce125a23e9c01f96e60b036d9966159ce2fa428c8b39dc620d629a84f09ac4b3d2fa93bd68cb257ebec107023444713780060060e2d1b95a23422231008245688acca06f9f0b646f317556d6078045631fb5460422941317e1229c3170206774415742b016d72c22c7533ac1ad88efa2a29f1bacc123d33d388fc75d99b73fb851f38784cd1ef707331bc7f1d7bffef5f5f5f56eb305f3909b9859dff7cc3c8e63ad75c57ececfd7f57f988429313100b5661e698d84fe38a36ab972d1090cb5919b90109a6a1ba7c3502e6bade6c79c25a5c44ceee2da4c2b33a3b0bbab9a993222113392bb3a381209d1a27c54b716e3d53a27232281134550fbe346dd100ec70999081f6cbecc97f89333c9e4924ea7aac8bcced82b8cbb38e22db2184174a2b0782724726f16c621ccf1416fea22398e0c7b681d092321ef246e764024961c1040d0b6423c00cc1c5cc76ddfdd8fb52b639f74641f5147576d90b2283a133183486a155ab3b9d5c0c383de1c8ce830e03fc7f6cea9d1f33cc7b0e34cb9ebbef8e28bd5e3fb4365be4704c810cf0cd4a9b5bab27f563f913832d3c9e9f809ecfefbd8ad112287848ccb2589e40cce084cc80489303109714939e77c9a6617338f65ec01629298151f6e6c40a250ed333d002984e04094122022030213c7866fe1dfa1d312b6c3b0d8cb2e68d6d358d877274faeb28c27375dac3c220e1740df6a748384044018becf80606840e92400f3a5dd0c4e120a2c71408bded39de2ea435c8294a23d1121211482c232e4bccf2db131b6440c04ea0611df42e86e781637789ee1b7aafc5687ae73cfdeb73bded5ebec4365bedfca8c863668774b23ea1e0c80504e9f2f24d7427de4ba8f12135dc034e1d3ecdecc2ce494e7d26a611682c254240973624e82e17810db8b07b4296e3873b6d5eec4f0c482737741265a9ad4a5a2104312756a7da3f3a3132f81fd4445353f89911158ced72174faade13940a7ad29c5d6834fb2e9f3dac5b06c59fe6c3e11aea2ee71294a448f9e1681c81f729aa234ed81e80a0ba0e418433328b8a323982131baa1270660668a4b13a92419ba32e496a509411266e1439ba2ff2724f3077ffef3f3c54eeadcd5eb70f5ef7edbb2cc1fa7127da8ccf7880009b39e8687077aba7bf04be2cd0bde6c4a29debcf36b73dd9dac83cbc38a259872087836b108a1080b71621226065fc8721eb618a72113c843670d4be9e1696203a713a91d01099183ec626e8b8b2b112cbe44c1a645b3859542891c00093df24bd0e2d31a9ecea7edf93900f6805d21e0037a79960c7b0ee22cec99f395bd93a355c060f230b173a2d3aedff421430de22e35070424b6c5c10783728000e0ca00ae64044ada881131902a46ec240db9f4a5259e4f5a4dc2076ec3ca224604a6453586e7de5ce153f136b2708ec3af996ed1617d601abc5f04686d8dd60ea7b5166630ab8d4d08c102943b67ea9d7a4b0e1b56045040f76014389c9bd09ee411297149dca59c59a2205dcd819a3b0b231a3dc00f04804090887d69a8c14fe4a105a6750ac2da3203c7ca252e5b305fe8e0cbc6d2816cf91902474722581c3d5674f404eef0ba95a1c72a4a22b2c512f6e9fe93484ee0f1024a03a0a33773430620477664208a9a63748fdb3260627022323427c7a04204381c056fe4088e80a6a08b3d7484c927e69ca02ba924c9424c80aae674ca4c78b0b7254e0e4a8b00601995e3b47d3b78f3fc9f7c0ec5afa98d1f2af33d9665145edff75dd7ad718bd1d5c409ba988b9eacb1ce53d0cf6840b2b6c716179a998325a0c592c31ccd114c44ba52b2a49c73c9424418a19711752e4b4ca59db4148640e622d940011440a2ece25eb2da54ddcc9931715a8f79227134300f1dc7faa3866463a1e9a047464f94303e918c3d484f09f9c9684db4f8cd3ed4f3d97af0a1437d38fcd292b1408cc40bdf109c990cc1cfc2ae319e27d62024001084b36b1096da92134428088e2cc8824ca514739d3296524bcab1a36eee842bfd6a7551885edcccda4a613fb735a0b300a2f37fefe9c5f1d0e8ae94a00f95f95e1e44e46a44147678e79ce6b5713d0f543ebf331f21b4bc7cbc8212b730d360e197860233f678ab08bbe49c2525a14498988924aec47356c34a5878d8cd382c024ef35094a8d912d49384453ca620c785eb03464006c6c88e66eee64000e627425cec42dd0428768ca7e1ea21528930a66b775f63d77fefdc0e6704d8d5a09d24fba2e12224725a78bc7a5a4f2cc75cc41e41884b825ea7b8340286060ee4e156c6c420ec2229e59c870100e7b1c2d07543d7f7f9b06f7111dbfaa600201105be6d5ae38c8d3965cd753fb72f3ddb9dc0b9c383a98511f1076cf64f81f49c399ad16377f298ae4a29018d823901843bdebae07a62d5f54e960c4254f089ceee468ec6c08814ce1aa6ec901032a188497249c01c80be1091192139922fc67b244082e488699a5a336f8660b078dec4520173f3ea6660922981646faa8bbb47981e2ce459c735a516140071e1e2348485ed4601d2f0e923081add2831213507b3a6cbfd8ba00dc074e963f574679ed0dd1371309c199480394585c2e20b4221d49ab546e52cbdf9c26e6711313402778ff6d8080cd8d4d5111c6be42b868f614acc965dfd285a32771973e13443335b60ae87b86c2362000c9bbe5519bfd20656f7cd27648315360a3cc8ec071905ff6fb1324393799e9f19604b443dba7bbfdd704e607eb1db5c1fa7591b0987928b884adf01c0388eab53d6c3fa1bc0d5da780c642168b06a117477cac96228cc43965dc997255ff4e9729b98275766ea939424c49c885355909498d991d4857970e4a65aa51debd1d090c0cd4b2ae4707b7b2bcccc3965719183e1716ae4e02892c1bc5a537264242602307268da96d04106e6e410924f156777500776583b3a22ae3aebdca648e94104205573d52ec52e02d7b8785d561cb67823c448e64e0e6a0e3a022121a3b00b2109202bd1080ac4e0a86ef33c07a1d800ba5d8f4ce8d074b6da986053f29065d4639f734a49a7c374bc077726db947c9c0e7de24dcfc3de73b6a1d83083563fb6c8494096844c66ee5085d2edd5beef7bcc388e233aecb6dbaaede6e6a694b264fe124274fbe0ee781ce7cbcbcb719aca662894dc71b3d999c642e84365fe7117e6d9e60d1c171dddb2b963ca5dd96c363967506bad25e198395764e8ed08cd95118244604648e060687ef6f7a91bb9b90217da947c31f41743bfed52e42823d9aae422a2653349a88ef3dc269d9231a7ce11f7c7fae6e69e1c86610083431d09b01aedfac1002a60d385bb87e6e6da1186b9979aa93604a3a0925a8b9e11019c140109d011eb5c1594399981aa9f726f0339253b295114dc1cd17d3e36c670eb014730778bac5be0e5d45bc0dbe8204004cd4111ac29183498aa4373985a53836aaacd63d88e76e3466b847fd579b4da12e1ae2f43979f0ddbd6a6e3feae8d07724522916c54119d4c0934b1f705fb8ebb9966b062a9cd7333c770d1472026226059d09bb0295d423b733e859d3de0b127d36b8a97220897f15b3edc99ef776b1295d60dc3b367cf4a293a6b6b4d5259b7c9ab4efa9da3c5491d894fe95e8b6298bc190089c8300cbbedb019ba9c33b32526662162640664c004c4c4e2c815008553d7632a8766fbe3e1cdf5f5b7df7dcd80cf9e3d5bd82a4844f4ed9b378828c4a594a1eb23c68fc0e0084c40e05ad5ebec6a8c20146a0b2302163253240f2b4b0f925cc04fbc9800c1c96dec54cbe00866e6d65cd501c2150128e02b30474737732074305b24a5ee08adb982ab374530c7d97dae6d529bb51dc7f9709c5455164f7a9fb5dd8fc7ddc5b6ebba368dfb9b5bd7f67cb77dfe6c9749188138533654069b258175467747a0c5477fbbd95ccc76a83ec338599d54abaa5a039018136201e6e680188eecf1f695521684cf97ce36466757c593304d55297180851f2af3bd95e589f6d1c0524adbed5644a6fb63f466768261573bf65a2b3cde58ae7ade136d074f2a90052d60a4c8eec94c7d29db7ec8c20c9e58986349c8080c949d192839a5e6e49ca4dba4cd766af0f5eb6fbffcfaabfdfefefafadaddbf7d7313e7858880f97ebf4fc45dd75d5e5e3e7ff66cb3d988089b656b9939315b6b3a35d796189310b9133aa29b22625b43b299c4d1cc16e359520a7038ecc8dcf07c6700d604c100ac55207488269b1c495d81c81594089c346067f7a91e9b593355f0e63e6bdb4ff35c7552bbbdbfbbbdb953f59cbba058cd3a7fffe6f5300cbbcdd0755d26cac2c749fdeaf67077f8e8c5e5472f767ddf4fe37e1a0fda1429732ad29a88765dde1a6cabf6e354aae664322198060f2b4ed86a35a5d4a6060011163ccff3aa525811e945c0a01a00764083aa2a252d4cbd0f5a93f78bcd06ae4398bb62e053abc0f4a402d750b0b7dd1963b5480bdf722d7a252400376fe00d4972e24ddf0f7de972122459926885481c93230226a304dca5dc81f493c19bef6fbe7df3e68bdf7efdd5b7df982dfa069dab99ed76bb52ca717f68ad959406074fd939ede7868864da19f48c39257283a660569872e2c4c808c468cddc55a1ad697688bc46363caac3c79b775555adc0dcac35037573402746124736444372a006e88eead6cc0d7c7f9c26adb5d6b9b5d97caaf3fd388dd33c35bddbdfdfddeed5adcb7d78e49bd9d5cdfd975f7d830eaf5ebefcd9e73fee5e3c9babdedcdc74c27156ee3685a97082696e739b72d7bb7b36ec1c7be7cdb176f93e0b0ba3f0897080a800adaa5b154a78723d59f906e774820784dc1d88d0415549585533511ce21f18edeff3da2474476b8e889252339bea2c22c80c6ee7e18a714d85cdc493c5099cd93dae7b8020a6e85c193471d97465b719b643bfc95d9781910919910dc2495c140550a4f479d8cdce57dfbdf9e75f7ef19b2fbfbabeb93fce936b8b23fc783cba1a9741516f0ee33c4e39e7d17034bc3fd6987fd8ad54ed85bb948459dc99a03025c1be24212c8999d05dfd445fe024c1f07e5299e7168f66e6aeaeee66c06c080b79de30d4688e3aa9354035a86a73d3da6c5653b3fd3c1fe6e9783ccead4eaad33cdf1f0fc769aecdc63a4f6375f794f2a65b8a131cbb6e408769ac5ffce6ababd7d7bb4ddf2519ca70737768b53ebbd8bc7af16ce887a25ea73913a0437554a009a8eff2a6ef36539bcc8e63dbe35417851ab8b53a2ba50467c9682bb560a14fd2a34017e6a0799850d23a23e2300c1fbad9f73e672eae5a39714eea36b736749d9f3e8e6141b0a6274443fba426112068e28fe96a211ac24ef266e876dbcd76e88620193008ae42e2284b7260409967bd9defaeeec72fbefef6cb6fbfbbbadbdf1d8ec7790a96424ac91c9ad99bdb5b66bebfbf1ff78752cafdf1186b9e98a03a92dcac20e6601a25ce828220089b524a964d919c3884271471f3664f546f080667d227f0c5b7c1544d5b7b083a08d588ce36abf9a4309bcfd5f6d37c98e6c3f138ceb59aeee7f9388df7c7436d4d01abb6719a8e7335774476073383713c1e8f7dbf194a1691dd763b74fd344d87bbfbe3e1e0ed4579f17c1c2ba1cde3384d53adfaf2f94e844ab791eae8d6b92be0a43094bcedbba95a53bf3fcec2d4f4c49a024684d61a9d117d72ce8e4b5c2a33133e4d315e1662887178755dc73f3477f67f8b951930ecbb379cee4008bc247cc189e33eb716684750b1cc2c06923562602534af26c8f6c847cdc219a72ba54fb0ebbb6d57fa9c32a184bd3f3000c109ee53270034a0abeb9b6fae6e7ef7edd5cdfe6828ddd0df1e8eb7b7b7db7e98ebd819a422aafee6fa4a9b4ff3b1a40eb5e938e9febe5675d794ca90d396530648227d4e5d495984d1d9ad64d994b2e9f3b62b392511129184645519fddcb701e1e11f6866cc04b6b08b9bcef33e8c02d9c0c76a636dc7b9cecd31e559613f4df787f1763fde1df6c7c3386add8fd37e1af7e351dd981990a756e75a995924139199cee334217953d021a754c7712f69b3d9bc7cf1bceb3a71bcbfbfbfb99a2eb69bed50ee747f381ceeeeee5ebe7cfe62db9124b7963224b594e69ca4cf69d3e7696e9d7042981cd01c591081c8db5c13f39acc2b2221855db8d3f4e0030e8fdb8798360334fad0cdbec76d0a1206fc386c37bbcb8bcdc5eeb0bdbd3f1c0c3cd088000622a076bfdfc7d5b4841da8c69b94244d755a88a9be5c3242c4eca69552ca2c5d2e45981184b1cb42b4e0f5801c3aa5c3388f5abfbfbafdeef5d5f5f5cd7eaacd617f9cf7b7f7e470d8dfe59cc8ad4e93b746002454f256d554db3ccfadd5d06d1e0e875bb76dea120233133aa167e6aea43ec9d0954d29bb4dbfedbb2e4b499252cac29b948498e5411323616ce5766a656b3d1908bafb34cf00802c8ea886b5b5a9d569d6e37e3f2b1e6bdd1fc7bb6e45ac5f0000200049444154fbf1e6fe6e7f381eeb7c6c73ecf601bc358d30f99c1811e7e9b8f0aec0eb5c6fe7793cdc6dfb81888ec4c7c3fdf1aedf0cc3300c9195b09c9e88da6c7f3cc88da0cdcf8a274ea96031edd52e2fb4a901cb34b65d5fb2308ee3ec33a6e5285cb5a6918340448e4044979797d3344d7586530a530ce25dd71d8fc7711c379bcd300c9f7ffe794ac93e7080fe5437273e21002d211ce4a800b0d96c4adf4d756ead91f0f9adb87ef14e04c81f148dabf66a71364ec259a48417464e7d922ea52c9c134a4e94b213b6d6e6aafbd90eb3dedceef7f7f7f378d06a46c4684311c1327425eeb2a65a098b7108a08ec723809899ea62c0d75a7345c50a804d673323f759a45aad2a155af3a664d56a99524edc97aecb4280c25a60497c2044276033738d4676f1edb305af6ead39823675846638579de6796ced709867f3e3acc7713a1e0fd3749ca671ae73d795e626e066a61052158c0632939370964444a0c62829f3a6eba3f964e6229c981202a37efceaa3c42442c2c8025938e7acaaeac4e841bb28adf639959c3ac19ca830e5d835077ae5aecd85193170af473d7c9cb6441463cb620c7dc2870c1c11379b4de8e9d5f4c39df9be1ef5a42901c417af5ebdfae8a37f817f8ac6e68900ef3c1afd3cd36af5a145740076423865a79b1b31972c9ba11ffa3274b9ef4a97a4cb2c42292512a900da6c6e761ca7fbe3546b23b72ccccc0654897a4618726b0dc0add65a67af15dc099250daa4c084c98ca60633289a37d3be94a51f5337b50a33b9836a3b56f706e4b54e89390b6f87dab4084062b252520222604024274033658cca0c7e6d7335039c5b6d6eda5cddaac2d474ac6d0a3f40076bcdbc02362248420e9c3399a381bb5378df46b547a8564aa9cf45881120734e89fbbe87d368279273ce5dca22d20939a869454e59721672adc73a5df4db600f64c8aadad7ba293295b2ebbba14f7dc949c6b9859bfc2a097be4ed103f596b0d6ec974b2866211300b72752ca85fbd7a7579792922d3d43edc99ef8db5a7ca39398013befce8d54f7ef2937f18867d6d4f68064fdc1c578b8365a76215cc88e02169cf01d1108cc0bb2c7d97fb924b9292b82416461602226027672060c69c73a7c09245f266b3696eaa3e4dd3f9b2a425192ace2d019a70e644aaeeae6650751664064cce33699f4841d1b89d8c0278317b54f5a65a67376bcd9a246621bc75ef931878764b12cb593f09dbc8bc915b64bc47373babd6d66ad5595b6d5a9b4d4d670b8f12007446c849dc2d315613c4c8564227476012644e4490449839b324162112e250e1307328488984889896e0dfcb6de76e88def579d30fa52462406fe4952592df2d0b755986be4c4d37c7e3b6ebfa9c128b28183201328b593b8980166a743848a86ae0dbeb07809901512d8e27c839fff8c73fbebcbcfc80cdfec95ad93fb0cf8cd17118864f7efcd966b7bd7afd3ab13c49505cbbd9733bc3d3cf448adb537bef1034c7855024250401480821c6470eb9b3239208f740403c8e33016a5a32ad0fde666b665e1980c9b39851c4760032922729d56aad3a559f08b224136ece3a57216742277e6801cc13b170c893c10c0c419bd7aad09aa984dc7191f5a313422909dd09bcb98159d06954bd2954f3a9d5799eeb693b329b576d0ed8dcdc40c09d818133004b2c69d040090905430c7bb11d124b626140422c92fad2e592e65a811373a8e4387259ccaa402326499c18842c0b767d2e69331eef85c074113433735f526d5d9f52c9929918a22735004604558bc4f987c8777ff0ce3ccfc858a0e960ba23f47dffb39ffd6cb3d97cd09abcdffa4c29a97b24c00be1279f7c72f1fcd9f1bfff73dea48785c1e360f0f3425d897b2c42673ee79121274889a924e9bb9c8443c7c108c28c8990c91f265827a2c47e6cd56bf3f8eb9a1657c406e84c4e44220c94d6165add4ae16a30930bb2784bc84a602615da227a6202224750d5656d8b04eea4e1d3ee3ad7c9adb29b8b2334d32a4c0c89981149b0b93186c36cb3da54b51998d1e26aadda4cd59aaa8183350d274f0020f4c42804009484ddb1999aa1a112104313a70cdaa7d40b230003f6256dfbc239e926415430a22ab6d6eaecea76d8df88486e52679a0ef7c72e6d379bbe2f7ddf2139800992139794ac74ea58520e4b1704b3e6064d49168e212d99080bcd003968d2adb5667a6e01c52229a5a0a3ec76bbcf3fff3ce73ccf330b7f504ebf176a9e230093ce73ce659a6601faf4d34f7ffce31fff971300bbbeeee79dedf97dbb2ec498d95d61cdf623646646cf39775dd7755d4acc4ccc187d9b617867b111b0113ab53083166eb5b63a83392310424e0200f9e222563bd16b35d35a6b6d6d9a26266267021130016be8aa5e725ace7ef018911dc919549500489dd019890c7c6e539b39737012ab6a154a424d4430245c4e1cf8594cd4aa86eadcd4d44ec929cbe75b99c922506fb1610ebb1180360128a8a27b22626401644271ed08375d224001ef32f70248c67d097d68dc5f0d9051cc28361c59c809199cd0c06a6b04d02d684dce84ce4ceedec0874dd7f7a59422220075b54a7a72b0ae9b6d11391c0e555bec4502514bcc29677727e1cd66f3f1c71f13d1743c0e65f7834bd1fcb7589908600874161310565a561b777d349f2f3f7af5f1a79ff49b016d31f22008dc62f11c793b9678a95e7270745d4ca90c89011353111e240d428529313233b1104b734c2e2442400aa806e0159aa74d47566d36031524ca91c747cd2b81f0e23e82ecaa56d95a97c98d55b8139e9947c4699a1afaa45e6dd65a7d7694653d8300859399c52e24c4c9d59a3513364745d2d05a9b899982901d274662418658f2b99999a3f95b3a4657704570726f6ea6cb77babb83691b639f14e7d91abf1d1ba9aeeb1889dd124b88c251cdc1cdaae952334510805a6b0c8e204c28c4c4ee36d7a9d9b6271066c69c88812ba96a51dd0e79dbe72173279c789e8d10ddc35561093904405477022440095797a6523a66d6da4c151d9250ad0e0ca94bc36eab0853abdb530f75de8b9d2b813f54e6ffa7b23c7fe1e267c8c1a6da91f8dc365d7f7b73e360fffeefffe3f63ffda7ab2fbe11837ed81e8f7b43d8f4dbfbc37e9e9b6446264659a86a082448949dd1cc8d005dacb9999aa100ed12ef326e183af6c4c43939cb68b4db3c0f9f2c006fa66d9eeae1be852dbfb622aee8600d000c486d0e4b2084e0a323327297ccc4ddebacb51a13a554c4809a1dea4cec0440e6aa0a06d694908904901001851b81a20136642404b3c9d47d16c7425418c0cc6b750ab6ba21201922ba9a993a4ee606a0ae739be7718a1d03310168ec69d841d59a5a6dcd54bd8e297135edfa0d710216e9360a8e79f8ddf7576355adeda3e7cf6c9c5f5c5e1ef787cefcdc29143d44af866060e4aa86082084529270129d0e0c3da6449c1cd1118baa83f6899f6fcbcb8b6ed321c7fccbe26604e40aea8be341248592d3fded6d6276d5f17edf755d6131333205ab2c90faf4d94f3fc3c2c736bff8f8a3fd614cc4e4800e14da1ab493d5057da8cc3faa5c97e011770c148e79b8dc7df4d92757bff9aed5664d0168358c595bdc273922660d8cd5cd1061d17ec6190c992813648614d46a224c59904d1d4f293ea6ea75b679d269225001556884b6a81fcd11a9ebb359536de334bb3ba130c702d0cd172499818a24ec7a121c6f461416cc545b6ba6b52928a1a5020691a4159e094ec8ee1a25d7dc00ccb4d68999801c2e7717e6167e901cde008bd1113538612768806666d040551d4801d440d5170d9943ca9d7aab0d6c9cf65581a9abc629dd1dc6d6da546d3cecaf6fef8efbc366e8bce9b3cdaee4dcf7fd3074a964665a43c7000cd009d8a181616b132238b35b3363806525c34992a5cd903743d9f4b94f9c185143104ba080b678839d102077b358ab5ad3aae66ac024c439e7d666f5bac99717cf2f4bdf299aaaafc166a79c8910e89b21d087cafc638bf3ccf42598b12f5fbefc8bbff88b5ffde77f9e6a0b43f1b0300ca38ab99dd294e1816600604e1095490f7bb2879e2de83ef1e78b0891c0925d820e711b343353ad0b38e16129b7f8f1b8ebebd7afd73f139c002ac0e408f33837f51a8869f3799ec7713cd46343550434d0063a2b0008090a6bb5253b9e104881c9092852fac89d96bdc889038c293121ca724f3b1838b20332a02b3540423f976bd46600d680aa7ad5f00f43773fce736b955812b2a402924cfa7eb3bdbcb8e8ba3c946e3eecbb246fbefb7e9e4600fbed77dfe548aded72d7757d5fba92993165ce4c480f2e87706226a92a5270eb20f8c3e0badbed0eb3ee769bbe2f11534a88c060354c2d169b932538c52cf8f44dbd36530b275ece394ff31c0b9557af5e0dc350110204fe80cdbec7ca5cb7944119bdbcbcfc8bbffaabfffbf2ff1af70743e09cb04debf6f2e40eece72c227773859396ea419c7132115f1ec44ccc9c849951c31b218c65c3740b8868aab3aaaab92900e8e903a30e641669f36a06cd16679baedf51a6cda6a49410a9b5368ee3619eeec6c3dcea3c4ed37834133773408d006bd4d33fdc49981990cc4123c539a7d4a55c52eeb22496cd300812011211afe21bc0d1709c27d30a753564c0780d9bfb5c6d6e3ad756d581d811278559a1eb32726920aa70737bb76ffaab2fbfd9ed365d2e7d4a1fbf789e2f9f6d88375dd9dfdeb45adb34b5d60eade908cd2de734b75a13174f3d00110218a2844e7bdd76104268d999b994beefa760ed2416c6b98231a6d39617fcd1f6cbc23226822a22f853c10da894fe707f74f7d07f355fec14c13e60b3efad329979650eb87bdff73ffde94f5fbc7af9dd575f8ff3b194b2789c029a5944bf9d7ca874c9dc3a8b445e3e13f0607e272292735c9b6702ab088a0707755740230616f4f984b21898a1bb69f3667a9ca7d6dadcaa99492ac3306c36bbdc75b90c0adecc5575ae3aaa8d6a9343be78e1f3ec69a2dc6ba76d1ceb711cc7a92b29188604519071a02c7162c2dca5dcf765e8fb6d3f94949390e092dc20a7a011034ce600361d0f600aa611a4698ecdbd369baaceb5552727712440844ec6fbfb36dbf5d577c7a93687efdebc9694dc01c1eb3875499e5d6c3f7df5eaf2e2e2d9c5c5e79ffc8880206748c9dd66f03a4d3c1e374371672210022214466baa186fce2273772338ed6cc3b560188661187249b8af048bc93da0999b85472ea22100f8ac2d277662e2d376ca606ef5d9e540876b33ebbacecc886955197da8ccf7b33bf14739cdd1b17cf2c9273ffb773fffc5bffcebb83f20516b8d1963d3754e3c80351af56448476199eeb8fa20c69d99734e5d919c484ea6896810688aeadc6203b21a2512389899366fcd6aad4dfdbbab5b8b584ee15661bc1faf8e0d10c7da8ee37c73b7bfbebdb9bbdf4fd3346b33f0dde5f394d2d075bbaeeb734952b867e284a6e01a5eb86141124d8310253a717198334b96d49545e45db26416465af7a8c9a1991d8fc755b00a4dcd6caef538dbdcb43951ca40dcd4c6a6aff7fbd7b7d72cf9775f7d391b0cdbed57afef0ce0e5f38b5a2b99614abff8cd97dfbebe1146b0f6f9c71f6f37dd8b172f3e7af1fc62b7e98409d11c1c48c19b69ad80ee68eadaa4e53230fb43c80532fac9073097b2db6e77dbed503aa163050f03420f52123eb25c0b44d9dccf1b81d65abc8fa594ed766b6628b258777de866df1f3b2f78b3a7aca196527af6e2f9dffdfddfffb77ff82f5ffcfa37cd4dbd392644346b1c56cb117479d60ffb7944c21217844c84cc527229a59492a38f4544744e64cd5ad3d6ea3c4ff15fad4dd554ad359de756679be736cf6d5285d4abdb716e87dbfb9bbbfdcdddedf5eddd384f935a333dd636cdb51a202ed67bf75f7c330cddb3cdee62bbb9e8ba8b61f37cb3d995dee6910c019a9945ca3cb983794925672a594a5aea3325ce39f7b9942c7d2ea5146132b336d7a636a9b9bbd64908e6793e8ca9994f73ecff4c0d38672e5d533becc7abfdfeabebabbb71dc5e5c1e9a49199effe8d39baa87f1f8e5f7b744f0b31f7ffad39f7efeeb5ffcf2e262dbe574b8bffbeaf5eb7cc3afaf6ebf7f7df5eae5e527af5ebe7a76316c06b58a0a755676437742170407b6a62b998e9224a1889848d63ae2dd6e7771b11d86ae24999b191811e992b50d40be6e841809ccdd1ab886836010a2e7714c293d7bf6ecf9f3e7f10e0714f80373cefb61250e3d21f430f3300c7ffdb77ff3f1679f7ef3fd77deaa2efdaaaaaae46ca7190fccc3e492080d346c60d7ca8cc71abb90521261607242004f491a28297855f3a6b66038b5d556619edb3ceb3cb5716cd3381fd55f1fc79bc378757575757337ce13927097657836dddd2827202731a8f358b58dcda07efef9e72284806fee0fdfbd7eb32de5f38f3efae4c5b36d29a6163944b6383aa083a6c4dd69c22c29972c5d2943e9b69b3ee7bced87aeeb844955db5cabb6fb716cd6b7b932f33ccfccfb699a8ed37882a9504458a4b6e970385c5d5d9148bfd93e7bf1ea6e9a72373c7bfe82befae670b8e9fb02689bed6eb3bb04c2cd6ef7f9679fb579faf6abdfdedd5c7ff9cdd7bffaf5d7db017ef6f9277ff9f33ffbe4a397cf77831b90916004d4329d3073300b384a44383146f84bab28380cc366e8ba929210a94524c49a39bdbef504c81c40574357464142751782e3f1284576bbddc5c50511e9a2587020fe5099efe591526aad0595390aa9d64ac23ffff33ffbdfffcfffe3ab6fbefce237bfe124d5aa23e59cf7fbbbcbedce291da61111dcac999652ac6ae9076dd6a69993c8c9be0911bbae43a6b956664ceead351052abb586706a0e9712075dc31a8ec7e3f1389b92aadfdfdf7ff3e6ee37d777dfdfddcff3dc0c48f8c58b973ffaecd3dc0df6dbdffcb77ffaa7cf7ff6d39f7cfe93fffc0fff703b8e2f5fbdbabbbbbb391cfec3dffecd2fffe5179f7df2095bbdfbfef56fbffeeaf5f75fffed5ffdf58b8bcdae4bd3e170777b3db5d649d795f2e2d9b32ea7be2f49444486d20da51bfab2d96c12b12c2a7f0fcc93933455df0ca886e44ce0eebbaaea70777bd03a9561f7c9a79f38e77ffd1fbf7cfdfaf5fd7ebf79f9eae5ab171f7ff6d9ebab374dadebcbe5c5f6f6eeba2be97038ec76bbc3e1504a198661b7d98ee8cf9e3d237076abd3a875fef6db6f6d9eae5fbf78be1b9e6d871fbd7c515e5c8487a08023c9a6df2c52665a9c07c2279abaeefe38baeb76bb7df9fcd9f0cdd5ddb8777443405ffa5526407435756dec76b8df77293be2e1f676b3d95cee76fbe37d33eb87cdf3e7cf5b6b5dd75d1dee990b7dc066ffe73fca66f88f7ff7bffee33ffee3d75f7f5ded9852d6b9825a973200b4d6d05c12c74db768f94e67f009e601220aeca1ebba52722939a5146e5d681333132d31796b194fe3185163b5d6fdfd747f7ff8febbd7dfdeec6bea9a0149be1836dbcb8b4f3ffbfcd5273fe294dedcdf712afbc3d8d42f9e3ddf4fed38d5aa9afba1b5f6eae38f7ef6f33fb3f1f04faf5fabce64f8e5d7bfdbf63f7df1f98f12bef8f66bbeba7e5d4a7afeecb2cba9cba59387ed4e12e2454a4d4fd603ee9e4454754ed2a5147d47ad9daa7efae9272f5aeb36979b8b67dfbfb9dedfdd8efbdb36cebbbe7cfad147ffee673fbd7ef3fdbffce297bffdd52fef5fbfb9ec87799e3f79f5625bd2d5f7dfda7cfcc98f3efaf94f7e7c7df5daa6831ef3cc52cdc19591b5d6fded9d8f87695f505b9770f8e8a38b8bed6ee8bbae4361165e0c0c232e09110d989348cb391791c4c8e88c0088b39efc0d1dcc8c01d98011c6fb3b06e46c5dce97dd8bd2a5b0b1872caabadd6e73ce11861b89bb1f2af37f6e8b8b80007ffd1ffee6effeb7bfffaffff51fbefa626fbee426f6b920806903746656776feeaebc12b5889863c0c4c00c569b92e511918f26ca7ca2fb3d6466d65a5bb5e3f17877777b7d757777b7df1f0ea66d6a50a723300db4d96cfa972f9f7ffaa38f2477d777372f9f5fde1fc6e3dded6ee80f9b4155d376f8f6ab2f0bfbfff2977ff5b7fffeaf7d1abffcc5bfeee7633d1c7ff7dbdf3c1ff29f7df6a3971fbf4278c5ac45d2f317bb4d19ba2c25656666c192a548ca2c4c4b92032246e440b00f534ae69e73ce39c3296c22a5b4dfef53dff74336adfbbb9bfdcd1b9ba74c48f348f3a143fbf8f2e2eb246fbefb7abcd93f7bb16554180fdf7df1eb3a4d7ffed3cffff62fff7cdb0fedee8a5add75995f5c3edb9424b4ebbb9c884cfbc4f4ffb0f7a6cf9125c97da05f11f18e3c0014eaeae9ee194a24653291d4ca8c1f69bbffffc735ae495a6a35e2708ebeea0490c77b11eebe1ffc6522ab7a66cd64cb1eeb6e557e8055a1120564223cfcfa1da8481edfb4ebbad4154a524ac79229d0c9272b6c6404a764d6976e1886ae6461620464f4499d52fccec20d50084464d577cf9f3dbb5a8d046eb5dd3fdcddbd7b9fa1611ade4dd376bb2da54cd3247d99673b97c49f22f3cff798b5f59bd5dffedddffded7ffcbbd7df7d57a73a96726c7a369464a0f0d013c694929b813921426c310983721942c38f805b0a6b57a2e5798979268d804549d4f7dd83ee9aceadcd92e8e6e6ead9b367c6e577afefc6bb87a9564988f354f7776dbf256fbfb8bdf9eb5f7efedf7ff32ffb776f0d5cda04ee7de986f56a93f3674fae47e1f9e8c9754cf9deef3f7f7e9bd0f777efed7a73bd5e893777ef735a8f7d625912264196f47d85cb73c2840b6758110180e42e8822f2f4c9b523e7ae3792f9d96dfdf77ffdcb2f7e81297ffbe6adedeede7dfdfb35e35fbcb82da47ed87568ebb1bbbfbf6f3bfcf2b397ffdb5fff65f1f6e6f7ff82f3f1572f9e8de3d895c4cc43575643ef364fbb873a1f749e98e06ab32a7dc78b33300fc3802420c222c88904098451ad29339752c67ee8fb3e33853fdfb2704640773067f222d2098bdbe7cf9f7cf9f26542a8f3fcfadb6fee577d5eafffeb37dfbcab532c33e7791e57c3626df8896bf2e77e0199e736fd9bbffcb7fff07ffceffff5fffac7dffdfa9f893a0068ad8e5d8f291fe6a9b5d9dd983989e8bc88440b71621184502de8baae94924a9614ff20c822223eb5980ca9760618d37b11234e00789834544a56e3661c47e9c66fdfbe7f7377bf3bec1ff6bb87fd11e7bb87375f7192d57af3579f3f4f3a7ff3eabbdd613f5205a082faf9179f8fe338a87df5dfff1f6aedcbdbdbe77f754d5e5fdcde7a3d0e7d296e09785d0a220efd30747d5aaa6b6424212684475a9b29e0e2db799e69bb3b82113a0768220b227ef1f2f9619e6b3323f9e2f99327d7dbaa0e84bffbdd1fdebd7fcff3e1ba4be3e7cf9f8cddd3f50a85334badd3d3eb9b674f9f3c5b95ddb77f38de3f7cf9e597b9efb7dbed661c1111c98550db7c38ac85609e0eaab5240ec181d277e338e69491049941048889912265aa0583a41fca7ae8bb9218010044c459081cdd193111f699fb2457abe1761caeba5c9871489d6f1f32f2b87e5deb5168b3d9e49c8ffe81b2dea7c8fc332e390188f978386cd7abfff0377ff3efffe63fbcfae6dbe97804b5dc77ebf5bab536bf6baa9585c38a31f2a73bc46c90226253e2d323728f0120b8ba230291e41c965fcbced3ccee1f8ead29901049dfad4be972cec469bd1e7f314fea76381cbe7df5e6384fc85cb5b6fb37b7a3f4bf7a79bbe9eeeeef01c2750bb6dbabcd6abb12aebb7d9fd3dffedbbf7c717b3d964256411ba309a3b65a9836e3eafafadadd11991e4d26f92c7a6466447849264644d57656673dbba68b19f72526584d8f20a530137a6bf58ba7d7eb8e0fc719983ca775c9bffaec45ee3b5545b7be74606ddda7f5932b047bf6ecd95c3da6c166adcd4dd19970d595f566d4796a3a475d1df6bb4bf51a7230311a06420cc0a1c7ed390cc37abd1e862e0b1ddd1267452137444b429d509fb917fad5679fa1b637df7c95c9879c449be8fcfeed772f5f3c9727d7c3308848028c79a1c596e55364fe391f539d3949d5f6e4c9937ff8877ff8e6b7bfffcd7ffd6f37ebed38f4cf9edcee0f0fbbe3ae35ea86fe58e7fd7e5f249dfb4c22a25388f2e363f1548dbb969002b69773ce1ad60c53a06b4ae9ae1c453202877b0811ae0af4429c7ab81aaf57dd719e556d7f3cdcddefaae9edeafa174fb70f0ffb80bcb4a66ee9c9f56d3d1e2a6122dc0cfdeebbd7320e439fba9c4a4e8ce09e52e6f530f45dd7f4d1ab77d1b60444075703c4303da130d48dfdc2a93126222608f73a2660165c8f29a5fd34d566cddc54ad556fd35529c961d6d65c4be6d5769b4b41c43acf5dca753e3ed96cbefce20b0cabb2550e4024670142444899731666ae75894cd566666a364d93d042994186b84e02017fd69e1c4ab7598fab612c294f1584c50cdd9c0184398b14e14cb67bffeeeedb8378cb607de6ebed6635748d488791fb2e8016a9eb0fb51265fb9433fffc8f36eb7abbd9eff732767ffff77fffcffff89fe7afbefde2f97300b8b9bd7af31e5e7f979ad1380eb8f7dd5d434eee0ec0044c44ac2e4889b82fa994d297ae8885f4bb2389901d15488418c84933cb2c299959ca8386c51ff234d5693fc5a8030bd523a020220bf4aa9d993decd3ed66fdead51b4e924a77cf145e49f3dcbefbe67525ba7bf726b18ce3b8e9cbfbfdfdedd5bace5366ca9272e007ba64a60f0f0febf5da2044c91011994e8da59a332df46823270f600da2132ddb5a778693c568ad35e72e973e4dc787dd7e9aaa9a53c269b6aeef106c3739b7e6aebadfbd7bfbe6eaea2a913fbdba61dca06b3d3c803544ec44f67576f73c8e2967f3e6daac79167646e21c7a5966066080584d099c8cd02cc875cd1cc117f21a23e7d4755d5f52614c0d1a3a40336f1e52d8cc82408009dd7526d087ddeef76f5f5f6f375f7cf18596beb3799bc676b8d3e95886becd563a22045323000c68271a3a3812f9a7c8fc9f2950ff671e94b16b151f4c37ab7eb519feddaf3edffca7ff44f3f1e8d532eca976c9ba3ccc6d7effeaf5663d9852ad368c632c4608bd1e8ee257ebbe835a4d6bea3b220241479c5b5dad470f6d2d5323c79473ca0060919ecc5a6b89b81709b08e57e392a7699aeb11ccd84910afc71100aeca304dd3ee3801a7fd54a7dd9dd6ba22b0ddbba763dff7fdd017017df9fc56ad0dab7e1cbad56a554a8a0c29e857ab01c0bccde00d009872e210ca532a19d101c50cd40d0162b84544f37cac752682524aac790c09548d9899c7bc2a5d7f381c1e1e1e0e87496b9b5b23c1abb20a158f693a8823dbc44e77afbeed4beaba6e3a40c98938356ffdd889842f930b4af855478b080041db026277375048e84246086e009e530180d6e6e3714ac3a8c7a3c171bd1a365d9f5407c2bbe343ee57b319b16caed630d7ddee6e5c0fa0ed6a353218abed4bfff6e198deec5f7e79739b8959fdddab76f7ce535a5f3f79fb70c85d2104720bda6f10f195e0440b9f0a0ebd0000200049444154fb1499ffda0f74489810c588276b7adceb619fe7231d0ffb7ab87b7f78f3f6759bf6b974cc9c0512b101a9022d6ed040e842988bac86b1eb7391146a74c402c440a401ee8a194bdced5131d2d2c8b9bbb381231b91c3dc40908c18c89a79d35a9ba9ea613fb5d6e6b94dd334cfcd5a1377265aafc794522c6c98590853e294d23074a514098631a89b2ddfd915c945c8dd19dd5dd10101549510181c9800232f005d989d2c3f2d02033a360476c2d01f235c740f62697436538b0d52c9a4dac5be3409c7183b07ec9f891311a3089db6be4be56cde2e26c48f33986a95dcc984881199900d013951ca24c2a9058ce16abbbe5aaff0d806abd8a53a4fe6ada48ce0f3c459d2d57a93b141ad931000aad17ed687fb7d512d3a8b4e36edb31b037e2c3de306408a404e8a9f72e60ff6207474130230adc709d518091cda5cdfbc7dfdfefd5b572b92d5b1a42422ee5cf5bce676014a92fabe5fad567ddfc7d104f400b90391b77aa925fdf87d170f7a47161260247767403775a493b54a3d1c0eb52ebacf414d048094b894249217a84068c0c7a082b9ef4bd775e3d80754104f16e967770f66264677073577055ff46039d0f9a7f57d6805865a34a3047e1f17e531ab540d8116fb5890d8f4f7bd483e1ee7fd7edf5a63c2949224424472404439b9572c8c1c161261099f770e7e5c3ca6592ff737e73652cdd00cc84f0c1394f0a86044b7e8f9577dfff4e6faf6fa6affeaed0a45d6ebe3eea8aa7dc9c444c7c37aecafb66bd249f7fb3d4b6699e058a779da3da0360167b3badb75a6088b6ad9d932751119c1f8039d48de9f22f35fbfd16c2824080971322d89d7fd709c8e643aed0f3eb73ee72ca936489c338b83ccd818706133b2972caba1cf458aa4b3b926028393991210809ea3d1dd0931d8f1b8500ce35821009043dff7b080dd5b5dec40e6699afa6e54d530510f74614466adf5d2df2ae71c4255c3d02d232af750c44044225047668a8bc0bca92a9ec83744e4e214e6d8e1d80d8e7e423b4587c904b0bc0a0f761b2d0b4f66d6e6e6cc7c0480e3f1888b512e3363e69093c54b8a3912c3696e26229791a92600e06e975e6c8e68e81f2f5d1d42fa43555d17b0fb7abd5eafd7f8dddb92f2d0f70f4377dc4f422cc9a5efafb757eb7ef019a6b9962c43ceb52abbb53ad97c141a13e2b4db5db99129a1a32b6034ba160edb86a448f0a755543f45e6ffbf840966aad83067cc846496994078374f3acdf538095297bb84d4dc3a4e49923a9f96f28ee4449812f7434989c3d587198028325594880010e7981c20547ef0b4d9bca8150120b458818c489939a59273d775736bad553b33facdce1a0b10bc19331391aeebfabe8fc1e6a58355444ee8afabe1722bd8f24fb0948b0ac0270a4d083118382c52b2a821f5c5d10412c2220c0b067ef66906b66118e27ba594da5cdd35b6a4140e664827614089c8747e34f33c57b3e122e3679db073ad418444480cc021bd1032b2aaca80d5cc41c194d05763bf59afd055184b4a9b7e1403b02644c37af364bb1d4b766852f294bb3e95031ed59a4e473dee3abf66f2797f4fd650ab40e8bb2da9f2d4612e138dd082fb14993fc00b4040ab6486a05e670150847ad8efdfbf9ff7bbd47745121b64e23e650004f4f0f661024620f42cdc07f34b08c911e3f450487598055d21aad973197c522a3939c32dd48dd0f1338f585d66892266364f2dce69d0afcef5ed52af9ae59cc3248739e2e4b13dbb30728dff7939eee136bdac474ecf896d6d1c4144045f544bc830488ab1403171550570b093ac893b0004ee2fa017759a6badadcd7e9ae8125d82173922f30281f448de093f59338d57b75c22e440084408e4808f1a9baacc4860445c511171b55a6db7eb927265446d63c9a4cd6a2b4377bb5eaf8671e8841967b07ad8bf0dcdeca956d469f790c83be1e3b443536d333a819bc3396f2f01a9040020f6232d687ffa132011f5d9cd1c9aabf5923917716cd30c15a4c78420802279907c3fcd540a982338130a2183315916102102b7a6d51b1a0b72ac0555f56c837712494044cc22b148343342b713391b809110c0228f9ed54fce9d241111b5502d311322c93923622925704844a141d51ee17574ae001d98d4cc5b0377020ed5147717c9cc727a5a54bf4bbd086a51c1a29d045c81191d89c2e060b902d0981d8084992925292d4d11998b7003a2843c2f09931032124128b39c52fa651f7e06369c3f46754d80e08bb61258387bbae3220bc2e8e436f6ddd566d5f5b92a4d8703029624d85a9ff3f5d526136622c922de055e88dda135ab381ff602de091f6a65376d152911ba9d605206e1edbb84e82755cb1fec05106a75b0066e8cde95d40dfd584a622a044254800b128b64643fce9c84c0189c4378d28dc15990dccc5bad13342764474659420bcfda730b1497d09dc38c332ac9533d84100a987896a5ba34c3f60b0b8033401771a185c66c36ce3733b7b67c4944e6f97f2314f56a06ee80044e4806ee273b4d6070a210264242045d649e2fdcd00c81969e39fced4eb42c02875a2b9c2ad26051a694dcb54e53e00163137391c61f3900df4f3e1f4fce10ce3ebb74ead5a3e9d5da0c1aa19ca7c4a59492e400709c8e22391361d34e78dd77e80d5c055c983ae1cc14e50f03b56922f02414d22a668a98beb79a234700a77082fb14993fccfe33bac142085e6b65c0ae1fba5cd6ddb0e98737f7bbae0cd7b7a3e4b23becdfddbfb3a9aebb61d606ae88aeadf543b75daf98c0b5397092249c00d115d4bcb5c60489f8a4a7e8b1ae3e13caa28064e625991a82d3c9774cc189508409b1aaaa838307551213254241e4c741ef52f5b9aa8af002794514e1d843cef36ca806889c3808c4c4599850a22f75f5452a92d00dcd1a38112f157035adea066a06a5ef481cabcd3a4fb5064ca22b8988ec11eb27292d512d2880761ea82e553133105d08bb3c5ac50485f55c002f218a8680ae61f742eecd34c48d4cada624a65672ea4a6af37135f62509b5fae4e6ea78980fbbdd76dc6621adf5fa7add41cd40aab3b5aaf34ca685b964e94b17388acdcd5355cd391f6625b39f5ecaf9a947a68187d8e3e3d68ebca4e4d6e6e9800a85b067de6e36736bdfbd7e75602626e63274b92fc9d9c7be1bba72ee91d0d488d0c5dc5c0dfdc2cb6891dff34760eae9765894669c04f9d201e97c52cfde81e74c48312aa508ce7331fc314724e8684ba824515db4eb174d646240462444592201983c81a3b9990b8a01629879e36345e7a1370b00c82420ea0840a6c1c83a69f611b92fdc374a0118889af3ac6107f83d899dcb0af63257c7a8162100388ee160c18640e4c1f0d278021348a29c53dff7d769c0dc815a3b0a81b92b8109c2584a02ab3e7759726261d46668aa6e55ad3872cac8c22c9281443e704f4043f85127cc9f7c643a822a0009d0a219139f2f491213344f087de222f074bb16a1dffcf65fe6dad441584aca8c888c257eb504d1e198019a616b0aa4ea1853daa8274f63c6138f7a610cc259d2c29d9901e8227e1fc1e51199c1f33c251366cab0e0b9cf851f7eb4037c3c51c06ef5246d4542cc440c4288da62b502eaee644018d6b4a5e49806915b2877819303ce55217c0d90806c71110d3c0532803333f8e34e1229b4a2cf2c165c7ad7f3c5f4e14d044b64027ce0296cf6786d192e7b46f7d801a9832b0823821076258d7df7fad53b6b76d8eda7e9d027017361ec87aecb28ad924adfe5d5d095929bcf884829354067e152409211bbb901192c8d3f0198039e09f49f22f387ca99484ee250cd11889a5bad9588862e17815478c889b5f542bcd95cadc6bbfbfbaa2e899330a18be0d06511200244705037f0da9c51815495c3c1271a4535743707478c5293bef7db3da5d50f041062b6710154b053abc60814039b8be0fce034abaa9d87baaa8829f46699984368d90800184e3a724e888c4e0e46a63160464206626635734743a8b352c06184d1d9541dd44fa2ac4bf571f93e5b68378bfb590517ff3fb402ced7ca32465ea054e7c83404033446740c39edc5275b10412d7ae0aecfc7e3be613b4e7bb7b66c22d1458800905c44fabe1f86a1cf656a8642ddb8724a58bad4ad9cb8366b06de622f6dd180000239f0e348e85364feeb97b2e4402054bd2212e70288b55670cd49fa2e5397c792045540bb71f5f2d9937b70dd1d44b848026c39a5d56ae84a26740473058598b09386f307ba99c7fcf3a4ca0e4434cf73c8d5c6b61317d90c0cd2c969c38e7e52323ea98a45fe94a04021a2e90715ef07b1707eb4c576410d2867664e2cb1e98f51a7bb2359b8fd05590691d95dbdb9a311111232091281bba1bad576d070d0b5d0f644373630bad0c242278010daf58082837b84edd23b10c2455d70be9bcc2ca0f697d5ec62e6100327054030328802831500c0dc9a3680a6b3b5466e45b89484ce39274ca9ef4b34e1660d99018c08539294980599514aceabb5e682a94bfdca39554745048f6dd29227d9404f5a7a9f90063f1804081c51aa4122c87d17369b711a4a162ea9eff2d8f7c2d827fae2e58b6ff6d39bc314e620e66dc839e714c5d5e96a470704548bd11e38a09e23136001e29d2467970ef2347f3f2d09c13e72e08a38fc48feef8f0eb4e27fa2d3c96eada9d5532a631161c9595296c4b0041a346d55c3110d9c68c1fc00004130bf9882402300a6ee6e3ea1bb4fadc6c408c2fd01494d191e4b53bf70f703c088c433d60708e3bb7dd4552e93b08b42e0e351ad3b80fb69648daec8a86a6a15d454170db45805379bdd35a74e124398d3c4fed6a21476d5eaae39e7d566d3afb64009524a7def2c46cc240604b6d8bfc50e8cc2c2e813a2fd874c9be0e0ea0624c3b02afd700cf102a49c33118e5dfff4fa6ac899c09f5c5fadd7aff9cddbd65ad3d9b521a6c56519cc9d96a30204664ba9aa16be51910123713c2e45c25330c8ca102e366753dd476cdab97b7c5c4b9e9e404491572f1e41f6f59014abb5aad585e74d249225e59c726261606b1aa5616bd3c96412d89022870210839113338a0027000768d08c90a736cf736baa67ff085c162c8f8e0566169abde73dca19e5b330433f884c38ef60c8e9f2253df69f0b3cee74d321aa3bba323a98c57de76a084e0ca5cb6a6d9e6d9e2ba3b4d6a6699aa6f0b347d0a6759aa643201cb757ebdb972fd75757d20f691864185c92030109228469ea39493a0001e8a7adc90fb935898832a0c47d87fde0a9b0e4c4b24a4911ba449bcd2a25aeb566caebf526c8508c84619b994a49091703490a63117203d088fa30b18453e18784e880c44b21e4e80ee1104b6126f241cfb94c491637b89391b93ba083233291a1bba28282817973350307d7a65ae779aed5ad7112468afd0d1323274c298c784c4991282742644a9292941c6b1c4405362727246001a640fc5808909845e49f6c7f9c1138b26d683a2c932d33b3ccb2401af15146db70a9e4c3bc74b975cc0011cc1d4eb0750787c5e614d04f63a4282ee2efca176330380112b3a4eb71249cb11981b5d60e6d7ed8e7ddc3619bd8e7aad354e7595b63c6ed7af5ecc5f3727563eb91fa51babe1239847b5a4c9cc01114ce9456c04f48831f0c046468d6e77e92d5713e94dc77cf9ebfef7f0d5dbfe9c683cbce0e7de219a644ddb39bebdfbeddb93b736af3dd746faba1ac443240322627507062213670d0194d09110cdc5c0dce088113da80be3f407040917c31f0a0538235440200f40b342c2c359d7b83101f4750d3202e4e87a3813fdcddbfbb7bdfe5f2e2b397579bad3996948dc85d6bc075b24896e400abd16bb3a686d0d8484809ccb1743d85768a303083299a816ae9bbc0f7bc79f5aa4ed3cdcdcd76bd391ca7ae2f2126c82201b4751727370407a0709a8d71192245fb661e52f7441ca36c0507357303d366066661c9648fe1a000eab820daddcd533233e1dcaa472d3f1fa7b1643c1c53d5ebd5f87eb73f1c769b67b75cf2a1b56abeea86dd6efff6d5ebf76fdf7a9dbb92b6b7377075d53f7fd13f7d2ea57322acd55573ee9a8103550a4f6e3817b4009f5cfa7ec08ad6d01d914d18c795ac36d08fab7e759f4b6b73624c29959244045ddb5c1131b10852260ced56304f9c0915e02c9ce3c84620ae0e8ee4088008480e688bac5ea0493ebc29a0b5f65173157b88e51381223a4362d0ccecbc8c3133308fa96f6b6db7dbdddfdf13e06ab51aba3ea584c884448ecddd54dda041d84b42327e9c0bb7169a22483e4d47216611508756175be85276bb5d4a69e8fa7d2987fb87f7afdeb07ace49eb8c2e8ee4684edff3ed3ed5e2177b91280960290c1c1c8001114180e22252773a6d9580d2631702b05040ce1afcc800ba2c6c1199a04f526735f7cca42767c49412020737566b63c46118c6714c394f39a561c0ae5344b3460009015c9701389022f0455df3a34d9b3f7d7e26816a35b04868c3308cdbcd61e861bd4a7d870f0f317f2fa5207974298c2e424820c4ab7e88e29688102c767aae86e80c104eeae09121a290c5103800c87f7c2265cb98f1b1abbcf43ef28b931d2754f5dc8e2e0358d52076be7efd7a9ee7a74f9fdedcdc745d17d2720c6c00685e4dd5aa0512d59c8cd1dd9aaaaa81833095c4228008d9c1c0d46bad8e9073a69cd1bdef4a429cf7fb77af5ebd7ef55dabf3b3dba77082228644f647f32a04a00ff796cb36e534ccbd4008e1e5fd74a121f6c7275ea72ae3d18c38c800c3d01f6a33e6e2b93a801a010e5d2f44e4dae65aa78988569bcd76bb4d5def5ddfafc7dc770d7dd6069480a89985891afe74f4807e069149aa0ae844404e5cfa71bb6efd00ab552a9d3f609b15d418d0cc0e879db61a6b40308dec514a01805a2ba3d205a665f1695cc030a7f5e369bebaa0cfe003f8ce4534c2479f5f0edc896f753a7fa0aa110c912aa3f73b1e8f777777bbddaeebbadbdbdb274f9e44b846589afa6c6dd6564d0d9c00d9c1c3d8a1c1dca6a60e09a5f6a948ce79b60630cdadb6d61cb1ebbad255612e298364bd3ebe7fbd79f3eabbb7afdff45d5ec1ea9159027cc62199db9f1a263f46323ea2a3ce127e0ba97501d67ef885a7372a5ebeaa02e1a55338338fe3787f98945246c00604989887d2b1bba91e77fbfdee8840ebf5765c6d28e5b45a75ab35f7bd9a57072244265303b405e80f8fbf9f80467d8acc1fa6d3647253402040552dcc7918b124197b197bba1355d5da62bf514d39c05f08ee460c298b8820e2e178ccec59128780ab7be84a090a3d929f22fbd1f9387a00d980cf2098132f31f6eacb4408cf68b5f3dcf634be3233c405481091394dd36eb77bfdfa3500dcdcdcbc78f142aeaef8fe3eee82f97054d5439d8f81810520407184186c546b5aab5a18f282673f25e1b95640271132736d7ddf8310b8afd7e3f3e74f5fbffafacd776fdebc79139c9800dcb33b333b9d18c6ee4ea127886794fa8775bb7f0f99f0884c8cff53fd8fe44c77d7d6ce6fc519f74f44ddd0775d373b64000428594a929232d759a779b7dbcff39c87d5b0da947e0049e36693c611446a533385d8532f5d87c14fc747f3e7d06736374141c0d65a614a638f432fc3d0afd65d3f22a2d5460ec1c4674606142649a5cbe5ccf9a8b52220339d19578b502a7db043bf84da3d2204e0d15084992fc8257659073e4e6bed8c10b2d6e630fcacb5c6a13c1c0ef7f7f7efdfbfbfbdbdbdbebecee31884e3c85d7ef254afb53653441462029a5b433557535525a0c6da6a7cc380c23753228c17cc046e0d4ca0351279feecf6f5374fdebe7afdf0fedd388e0bef64115e103ca17611c357dbce20a147b182e5aafad8e512fc038e3800a87eb0d87478ac66cd2c1aefb348eca9a849ae50d528f3ba1bc652045cc0eff787fdc3ce1dfa71bd5a5f9761ed5dd76db69ed21ce030c64000fe144ff54f3e32d5cddd8578f95d12cb38f0d05bc9320ea5ef0828ee6366ce598491d08ba4a14fabd59085037220f2e834eecb321a10ddc9012da617210f743a8bd183f132c6382b2f4340ce1dc06377464b75e7b0e06ccd4e3804308f54d95a9be7392abafd7e7f7f7fafaa7ddf775d57f77b9ea688db633d566df35cf7d3b49f8eb35647c8c40959d441cd5b050014269456cd1ba7b92ab8aa4e7576b766ca8c22abaa9692e83431020fddd5f52627deed76c7dd4334b484c822b1c964a408b160b839fab95845c28bfd909d233350f8972df49f124a3f4fbfcea08688ccf8c2f0b6b06a47989970357463c9ec4688f3e1783c1e9394f5d5f570b52debb5afb6dde66a8f726c8a2490c002edfcc7711df429327fb0652640735bea2b00354466ea3a1cfa49c81387ba6c9babb6d9c24d9588014868ec87553f2c29ce9d2445763c53a563cff158b8ba23f8d96feb8401bac0b2e149fb0916b999cb279cabbfcb26f67c0a23074664cef37c3c1e89281ae0bbbbbbb85600609aea3cb5e33cdf1ff60fc7c3dc2a8067e24cbccebdd7665a8948201187e1a7efda92c6f7c7c3f178942caa6a667d5ffa566a9d14300f5d974b2234b3799e799e43c1287ee67307f81848974a65881720e14be6f4f2c69e2186a7e7d025bae8dc672e57d51fe7b2129ba36ba6d4e79c9940157dd185a092baf598562b1a07588d5c8a22a95a624422536de67f0a71659fb4f37ed09d4929459b9a5929054c6787e1fa7af7751a6f6e566f5ec37410244652d5665a12eb5c4560b31a4a978981181db4560004604acb4a1d63c54e64f048e3023b65ce50b40b00c24985e462c07031f8a105d9e70b4c88819614b1fccce1301f9cc6878787878707558dcfdfdfdf87e241509c8f537d7bbf9bd49cf0beceafdebe01b0ebf5a6e3749c67689a10524a6eb51e140573e9dba131a7fd7ebf9ff644949a904819caacb3aaf65d46a4e3ab5766b65eafbffaea9b799898d324294a593e1147ad5958dc879f7cc0678d029feb97656d7cacb59e3dbfcfc1e6ee41c86aad0238272166558bab276ea51817458db05aadbefeeadb2ee787dd9dab51f62c74bd5d97c4d2ccbca95bb7de6c9f3ee57168396fae6f1a0a2696a007aa02802cd049fbde968bc0e147cb05fbe947262d3a71e8b418a6a6e44397d66b78b84f5d6987fdf17060c0cd76350c7d9babd51999114fba04f8b8237042bf00690755e271c3b1a0f02e1709df9b7f5c8c5e3faad6e02cb7a376a2569b01c41fa2a09d4e856b84e272be4fd3e0c35c3d755f7ff7d5ab776fab2b100d633799cf759f1cb136214a6d0680d91412e66a3ebbeae1e1e161d6b9ef7bd6766cedd0e6174f6f11d1cdd00dd48ec72321765d1749b2b566b569d6b34e0f7e0fb9be5c58bebc1d7039920698e729b4c23e16765834ca6c21a29f62164f2209e1147e5a2055403bec1eeeefdeb56632ae124002ca92620396ba72fdf45977b5a561e0f54a36eb19291624e78bfbf1a7f50fb626f6bddfdfa7c8fc579dcd223a1a01b939221b1996c463cfe3607dbf5e6d77f70fc7dddecdfa6140c4248460d6c04dc359e04ff18042dccd5c01d0176d480100070d641a22bab713906031e73085f3b1b83c076e1a9f398f70cc0d4e2a7a110f119931838d6dd0f1788c5c1a33db87a97d73bffb3fffcb7ff9ed577f909c36d757cf9eddbe78f2742c195b65b5d06b06b0d91599384d027d92dc90dfed8fbffde6bb5aa72757db5f7ef9b9888c87b24f02aed86c9e26331b86e1fc93ccf35c4a891fd5dd53cecbe10e05ba5388b6d680f0d223f083ad127d50ac0628cf2e901574d21ff9e0490ee79b2b119b1939ac87fed9cdf5939bab71e8b3d0d7ef5edfdfdfe7a1bf79f98cc6a175a9df6ca11b14118016f1c0a599b4ef95aee4003ff2c1d04f1e9d776eee830ce5489e535e8d9a12241e56a3f5e39bfb87699adcbd5abdd96e4bfac3f1b89fa6e99cc70c543d68974e0e4441efc28f7e7f977ccb473db88bf2d530e60d1f44e669d517dcebc7ec61661883a553231a11484421d91e5e5d5119b6d68ec7e3c3d4fef13fffd33ffedffff4d5774714e8fb3f3c7dbafdabbffccb5fbd7c99dc933b23314273535447449a7787f76af0ead5abdffce67f7cfbedb7dae097bf7c7198a75f7df9f9aaef879c049cd4dd9a1a745d57d5cf69b3b5e64d95c8cc52ce970ce913a1c4a736239f00f178a157b48c91f572f683275eebc572c5ce91acaaaad1973e4e7dd7ebf52f10b7dbeb6118bf78f9c58b27375cf5f8feed37df7cd35c9f3c7fb1be79d24478e8f3f546b378543e97a9f127399afd596c4da2978b32d3dd51120f03f7c5524ab9745d870ec7ddbeb5360cc3cd4dca921ee65aa70358e385d614647f2074724395a0ff2122f1c5760463c8c100914be329672f6a5ef4bf1d3e406623c1c959d5d1cd2d26230006e8da0c1d4e3ab406275be818c01c8fc7654112348b6acc9252497c6c008703bc7bf7feed9b77db32acbb628809a8a235b3202357d2bbbdfefe9b6fffe99ffee9db3733027404afdebefbf5ef7eb7de6ea6693a765d4fc4e0098848fa7ea4aa01f7075b723b281151e0d42faf247703a6cb747759eae69c5575ae8fafeb6c28785a3be1e5c62506606da9211e2dccd6ebf1e6e60628e79c6fb73763caaf7ffffbdffce67f3cec7657b74f7ef1cb2fd376755764b8beea6eae8f2216ba629761e97f74f043a1d0f5899ff9c30c7f1612070200039a831a2883e4b4babadabdfa564456fd3094eeb0dbeff7fb9b9b1b97f96abb6ef5b81ac69cf3d9f0c3d40041c9d838241c19c809d0f19c032fe13b4bffe9f8c1bc873022eacce83fcbcc817fccd87cac06cde7798ef5c989ea2591b88ec76384652c3cabe2767b7db3bd99e6060cb92b9bed6a336ee6b94e8e2c82e0e6cddc9ddc11266cbbb935a2f1fafa59de0901135c5f5f5fdd3eddcf35442521e58e89054bca22c2f3a2a6192f4455c9e53c4c3eb7e04b568ca1f1a99a05b8dcf7c2791e7ba686051bee5116f7119268512f0473004e571b39a85aeaa4f41d021f76fbbbc3ebdffdfad7fffceb5fdf5e6d9f3e7fbebdbd3924e1be2f9b8d963c5b705417dbf0d3197914f573fcfebee493deec0f96301520c5c23fba380017ea372b1fd7340ea3df4e7777ef1feebffaea2bda6e5fbc78f6cb5ffef2fafaeaf6d9752a4204adcdaa8fd7bdfb32ca8f1150743db0c840f347bb75f04b3e74e415f48b794f94c34464f0b87737708350a90277b753c25c4c8744c214e54c475cf2496bb3739bb4cbfd93ebdbdca56e1cd6eb712cd9e709aa0102929386b20e98833beea739af562fbb6e9e0ec7dd7ef7700729a55cd4ed384f648aaa94bbcc229cbbd221d74b4c8599a139f3a39a33125dd8512225723c87df233a2f7ee64b999565027452bc8dcfa8b550d6bdd89b2cbb93b3a4fdfbf7efd3712aa5ccfbf9edd75fbffdf61b1179fae2f9edd3a79293b3acafafd36a75749f11f3a250741a489dff00fe515debf8a3ae737fea91498eea0046808ea0ee6aa15e65d2c930d0663bae56e3fdbbb9601bb20000200049444154dfffb76ffff0fbdf6edbf417ffe6dffdeaf3cf8ef3f5f5f57677dcef8f3b6d4d2be6941800437c809c428c0fbdb91b18031b029985d8be2fc5dc02bc8c8fece000cdaabb9b86405bf8f9f025977f59eed93983b8a3390232494e616d2222ba33038fe00c4d7755ad60d37c18c63cac0a0a035842406d6d9eb193f0c95430006746041087cf7ff1f2616abbddcebba4e3702f02ae0ff7f7ab529aeaa12a354b4e5992020253a6ec68e8d4ac02b882021830b86b687bd979251bb6298ea740b533a91ad1a7695a1affd3ca676929491d3162c5bc9d274c04e888e4ae4016a688aacd8dbaeeeedd7dae5a80e1b89feede750c9ffdc517cfbff86c787afd40627dbf79f63cafaeef21f7b9d79996891b02011846210e740ec34566964e02df9fb6263f50ce445680193d991142264675761cc72b5b5dbdcbdfd5c3c3eacbcf3ef7e31f7efbcff7efdf5cdd3cbb5a75c719e7fdbecb9cc7c15a8319453281a3bb993a8127006422d63a4362356caa8c243909b1bad5690e4356f74538c816cf020c102b2284687f6b0a007dee1d009090c080ddd47cd15a6fa80d140473386aa120e2b8da20891bce55efeedfbd7bf7eeeeeeee619e5a4eca282219735fba21fb5052de767d2e60aeb54daead3532eac6e1493fec9b413311381ceafefe010f476df3ebc374fcf66ddf95abd528375757631a86b18c43ee72e8ec829ec6574c865675760c63580a61785e9466c90c2eabfd900289d9b2790c7becac1aade024d0b4b566e00e60601e8a85e8448b0f8b2d425ae4cabcafba7af66ced50dfbed5b76f3e5bf59bcdd372b3d97cf9f4adfb7ee8fb679fc3fac90c9dd4ae552001250d21f690c73524c7e5b713fb4cf21f6f40feac2640b195520a18b7b11139a9339681b65b4c2055faf5aa4ff9e1e1e1bbaf7ed7dd3c41c4da66350026664ca99c319c0ee0ae6668d80ccd91d143f5d12d668f0808176ecf8bd42c5c7e3c379ee75a6a99499a9b19e8b2c374306656279250e389296742c47aacccdc0de3aa2db276666e477e53f791a610b84bb41aca76bdeeba2e11478235726fc849baa12f7db729ddfdc3fe9ef8bd6a0364559fd5c8af6f9f775db95eafaeaeaed6dbcdb01abbae9322cc0bcd8d950d344635cc887ceedde23a0a91177f946bf86879480bd2ee52f0d2ddd59b82c5e7e36d0505b0785f5cd50d2ec457d0b814634485a1cbc330b0b7edd5667cf1f4d8e5ca62eb8dadb7d68fcc1d5b06c719e69325033ca2ae1655d24fb3d93f6b39fbb8a872040368a1926650c6be8c03d44341bcb979526f9eb8e1c3c34377f324a574988ec73a4b4a7d2aa125ad6eb4880ea09b3b34000217c4c7f5da79c0f8a14ae523f68516ed82c755cab9613b47a603dab21244424c22e80b558a39b4a1d10c126107e4889c52e9fbabedf5439daea787064e4425e5cd6a75b5d95e6fb6c330686df33cef0efbfd7e3fb52a39ad56ab6e18baae1fc7c36618b7ebf5f57ab37f76043566be5a6d4a29db71d86c57dbd5388c7d4a9918bb217698f571bd418fda3f273405b96175450473bb18a83c46a6243e57aae7a191839b9a9ac1f26e043a6ad18f5f20c58f826040807d970a736614efc8ac30ad9f3f5bbf78793f1fb9efcb66cbabc11357426fe64806f6f348363f7da4c18530614cc31d2d643fa8ef3997191c98b7d74fe8e52f90d3d48f373737c8f4703c583dc6ad3eb7c68200c00e8e8bbd9d01100842d8632c3898b379dee50ee0fbbeb71fcda83eb0dc89805c28656cde00398897e7c80400e634cf3302235337f437b74f005011f63a55d550f1cb92c6aeeffbbea41ccb95e178d81d0faa2a3975c3107ceb61e86fb657ad99d666068224c4c7fd24898a70575297534a4c8ce1b2e200e4279ef10258d70bd7c0477b1400fd90c9f11815aacb2ae882bd898f327c0b45ee71127bb266420050f093782eacfabc1d579de2f4d650a1dfacfa9ba7368c47731b57b45a7be92742f3192081ffc861eaffcb442639181884f916861ada69a308de9522e3a0a508e02a25da5c1fa69a9e3edd3c7976ac87b3c34fc0b833a540b7b0a3b3b1031899ab5ca05b3ea2417f7f0b125911ceaa05b6a4ce4790cbc941ef6ccc0e4ec993fbc90b81d9c2719563f9206265895866206c6eea664d411772261131510e1fe89cba713033124ea58808586366a1e4eea041650577d76a00460e482e4424c82244a066cdcd0d0c49e8a48007ecc801313d09559f26417f022cbe600fed43bdb2508b5f7e418ff7a95d12cdcf6f262123affafce2f6a633fcf6381d9dfa9ba7b87df2dec0fa0d0c5be8372d6707543742fdf9b4673f876a16e044b7277b74472435ef8a749b4d3ade0c55d3f1c039a79437ebabae94daa6925293126a75ce6ecd911c119896e4a0e0ec1f50314f398d1e278d1f7214e1437c6c78a28430554048ed34dd38292da3780a194d44240e6b5a32775345e12ca984cd2eb8aa2ecc6f64ccf27df17f610e02577883848a40334bc229113805cd3b1449128bbba23b221041ca9c5848d89a02985358f41253b827d530203c69dec1d95fec43259d0f98d397e2bab8481ef929f4fc82bd797a0f090130e6d6cd2d12764734e6d4611e562348cfe3a6a5616f95d72b58af61581b27350422c0a0f8e0a7c8fc110527f849b3303468008cd805b9ef691869aed09a9471bdb922446c964086dce9540fd31ec8539751c3ec0e019d8da3dac413dbeb12cf7dae6c3f2a594f4772d1a45d10431ef2e070de912ea9839098099001d129a81bc88488cdcdcd3c74e898800911ddd4c0c000d0083036436761f8c851cdcdf1c4d05ab6aa86608ccee00e0d89989333b7d65cfdc4290ddb6814112012cedeaad362590f68a0cb5b038b89352d17d71281f647abd9b33ac95970e404cf08b5258b9bcbdd17441e78d8d747cfd94cdd80107c9a0eefdf73b729fd68898e9454a9a691876becc6c6bdbaa9b910f2a2c4f729327f145da685bfd5692e4a8e10fa8b8945090c5189679f855856e356d2dd3c8359261ef330cb71bf07371567b5464e8c480e64104de4d96dee92ac181fcf7dd79f0cd10f26c7407c6904b658c132122fcad1840c446408a14199849b69737335a2650e945282795eac013d300c27a63211a99e51721e72b10839b10833796b7ae2cd90bbb3d0d9c49a08805041c1a174a357516eee7ad2076c6173e01e34b65025a093d7907df44acf117b768838436dfde46b7419995165c7171b2e944e0d031487f9707cffea8d6f49862d27b96b3037f3a1c7323af5e6a4cddd1491e2ab01bf2768f829327f341b145424043fb69644a894e3fee8cd1291236eb757575757fbe3fefdfbf760d8a55cdbb47fd80d634780ec880aa194905880495dcf106d38994687aaffc5c4f2b14223c4cb7311c8240098b59dfdbf62631986cb4bf1eca8aa53ad817463496a9652628466da5a6ba1924e4488840ea66a5652ee730ae07b346cec8e6107b60c516d187bb5da662362c99950cc00051c2838a28cc02c240ce6ea36cd33896416d536cfb39911522a7d3c19cc54c19a2e6b0e304e72c18db64b4062cc72170308553353b7e850f114bd0b018ca89472fff0c0b948c9f3610788b9efe687ddbffccbef5e3e794e654b34ddcd75c7b9df76c3f5d39afa06a40d040599d0a26642ffb91ce39f59641a867c148082cf66c292c7b5eef677ded6b9dcaeaffa24759edfbc7bbbdfef4315dadd89819cc8819c02e98ce6408ee6317a89a3f611e415be278403e6006e1f25d23f7158426ace1c100910c0395e8083a3593305f4d092b3e5c900602498500275da71ca39bb1921b6d634f4814cd11d43669da0d589089214648ec4123008f75078484ed6cc619e03b62189aa69b80f22b3449f69ce2461747dae63113134f1ce7fb593be91aa227d40e73c335e97e9f4f724799baa82839906a488b06a3b1c276bf6ea61d7dedd0dd0d9b049ab6dda5e713f4c8076627b210081b12fcd847f8acc1f4586bc080174a07039004047b3206e8cc7be3b326661badebc7ff5e6e1dddb6fdfbc797b7f7fac1300881009c79486cf7b0e47577300ce193e641e46dafcfeb2c44f4e2641268e12f58cad85cbfd0a9ebc7b1c155030625217a49b3b80d55ac1888401e051883a7049c8e81e2ccad69a9b696d44a4da026d6b1131c204e073831466608b4a43d345733952a5454e760d8c8321b4e6d614c9999991ad35d3c688806ce806143f62b4b7e7c2c1cc10f93c183b6bd85f4aae8475fdc77a7b177cce6a5a7531ab6eadeda6f99baf5ff5c374e5e5657fb5bd1dbbeb6b1ac68aa840016708c512829fdbe3e791331dc0c8c910c02106aaaa00c846a06ed0175c8dbbc3f10f77efeebefbca0e875d9dde4dfbfbfbbbbeefd76534f7828ec08a10a30e8c7187199a9de7907ee136fdfd1de6d238995dc00c02d14ec11b7d7cdac5b5e2ee0d03874b8e1e90513068ee640686cc9c4efc327430b31ac312d5da1403b71ea7bd2a36638310d41349cc88a2c0cb425f888dc4d1cd967037b316ba5a2481f499e6b608f018224025450044fa50fa67317a41e4c5bd0fe0d1f2fd4230f6d21f9e883c3c8c3e644b874bb0aa86306c530526646aad29f33bb5c9a9e4e2db6d797a9bb6d79af2a415a57c508df88fdd43fa7fb9c88c38a00b9b273b0df2938879dbb5265d29b737efbffafaeb3ffc5edfbff5fde1fefefd1fbefbfa7038fc62f86c55e4fee1619d07412c4872ee1b63eb586b8c4ce1c2d4fda3ade6f9237ab8fb2ddc5db44774c162f3ba2cd9edb42400378afc13cc8a5943aa5ca3a3a465cd091c5d19b8d362ce890cec488c8c9458da344316e147f61933238311d436579d2c3b97544ac9c8aaded46ab3569b8213712c77266bad19a1843082b50a008c9498b43d6e410079a9484143c9fa7c613dc6e79978f5a18fd022d7e2800eff2f7b6ffa23cb75dd099ee5de1b916b6d6fe5231f299222255a963cf2aa31c6eec60c1a6ea38141633e341a186006983f6d305fdb18b82db717b565599665896a6bebb1b558a2489114df52afd6cc8c7bef39673e9c88a8ac47526dcc97b158152824f265656665d58b1367fb2d7ab9a0252257eea1c002864cb3bdbd977fed5e9cefeedd7d66efb917e2cd9b1a9b62a8808a0aef0399c03f6fe3bd2b1499170b4c17a1f4f80452004646c0aa5554e729a5b48367a7672867e727473ffbd993278f4f4e4e00e000ee94c02b298d5bc601286270d30c004650535278cad11d2e6b318e671e010e8e93971acaed72f742e2d110c0447b1d23c70f0cae2ad8af36117d47d2cf35a5349349d7ad6bce5aaa55812a049890696b83626a5945ab549402a54815310eb19d2ea7b3454aad310390887800209122e49cbb9c1139048c88a66052cd0c3820865232412fbe3b027a604bcaf929a730e9cbdaa7fb492252954b11eb7a4b7861538d88a59410e2eeed676fbefaab5d9cf0a4a5e974c3b153719f0c54af6b887aa36c7a2a56af23f3ffff42d69785de6ca03afe0690c9195714d8029bc1f460ffde8b2f3e215490666fb99ff3d193c72bab6735e324ad411af0f57a7f0d8e8088c0c8177bc8f7217e9e9a09d9962cff855ecefbfc98811001ad9a02a91b1fa855abd64b571902260cdbfdb3a9699552cb66b3393d3d3e3f39adb958a99a0b2944e2696a22879412339beaa6ebbacda6ab5db6aa8eb703044aa9994ca7f338994ca7f398da663a89211151573b07d385c055654444b8e6a0aa969c0371701ffa1e1804e61be00b10858e35c5f027d24b63ea0fda338d87982998971b39e7b69ddc79f6d9e5bd7b4794b24147b056c956904262265034e051680bc18070b8465f47e63f838d66bfcaa4ed25272044e6ae1633e39814b500348bbd9de5ee4b1f7be5e14b6fa5944aedbefeb75ffde94f7e745aca623a95bc11ca0609dd240e49807a3800185aef6ed97b22908d9e90ea8ff463c73eaa3d1ec975f6fac806df166cc734b8db2414579ead5a3cf1225f54826882c6a08aa256ed8d37de3c3a393e3f5d81d600814d238418e8b09eb54d9c4ee7290500da6c56e7e7eb4d5e17c8b1091452ce75bd7982c8d3f962b6582e16abe5ce5ed334aee25981b9070e41d55a15182184646845d58a54a98a4040846088a86808a61698b7342bf502217cb90fef69008088acde7f2079c3c9bd31bca0014a65e20e602ddac6b6bd71fba8ab6784c28c4c146240c2a1eef54ba821a07df40640bff0b859d2e18e0128aa673c43a855188c29ba7b385a12b02ad099a67bafe49c19e533bfb303af7ff5673ffadeb48588120da37611034af439a8a0891913b8968f99f4021a3844a30b0938ebb7a7fc5fd82598818a79f11602aacf4c627031915cabd6229b0e1515958822bb61a76a518b91233122a8a8e97ab57af7ed77de7ee7c1a3a333b7df5551a81daa06ac4c9838f246a72534d35644cfcf575d2ec6b8d914ea84a800a088a89655ae8747c721845b376e5a2da8d2340da9866aa6986bf5a4936b395faf6acdd0af59a0c536a5e4731a67971a90940aa0e314ca75436050cd53d4ed0e930dad5434120425aebdcf5e26553b5fa59408e0a44847c4cb9b78fbde21260e9131229015258000dc03e9fb95495fa1e856b5721d99ff5c82f35265fbfe019d91ff7f098012a81133550b8606139bedde982cde53c800c0a66c44aa0802480a66c8ce6571f6beb9fd011a8a0222eac5f0c9f792cec07080ceb069eb7d1e874614ccbdf44cbb9ca51459554662260bec4807071b64a99c2621849cf3c9d1f183070fdef9e9db0f1e1e566c0403b845bd1aa89a141f0b33f3645d9a552b22e7eb5529c5c844334708147b43c05a1c6bcc184e4e4e0e0f8f9e7df699fbf75f3838d89bcd164572cdeb6a5a1d33874031787328b9886927958802f5eb1c5071b5ce0fad68b698009e63d1488779ac3a140191112810d4c21c99a82a413ba1c56e4d13000657dcfab989f12313901f55a4c13f696cd4effa4cdbb6bd79ebd6f9a3b7d78fde4986154cd4047cffefa596388c7bbb9f1c2d772e4d652f3793836afbc58ec42e7039566b2d52379b4de93ad9688c315142552b2a603d88461590d6ebcde1e1e1cfde7ee7dd77df3d7cf4f864b5c63477254f22724444e9b29482061438a5149b465537b92ba5006a4a8c01132724530195a20a66d2b6d3ba3e7f72ba7a727efae47cfdcc337796cb5d8e0481b34aad554d7ce7e9b6a102c5896611c9f17e840062257fe8706e54d31ef6ba266097d62fe0232336340e69bd3a436220ae2a4d6a7776f6b6a86757eeb8729139fa52a96a0c69b9b7bf58ee1ebdfbe68440c9aa1919b2a1a122aac7710fcdbdac927a698db925d63832301cb8befd92be235685c1c864932b1319a3122868d7e5a26600cccc1c1f1d9d1e3f397af0e0c1e3870f4f4e4e6a2ea28054aa82b39f538c3ed42d22b556162e225c8b9915edb99102429532b934258cd4cae3c78f638c29a5fce8f064b579747474fffefd9bb76e2958d17e3e1c120100112a8811aadb8a1132f797855ed2de7e5ece24ea15d3fd474bdf6883f5be13c3d58db0ab42c12a41319b4e67b3c5d2e83a32afd221a680a06615344da793c58e0057d46210c5c844c1f94f365a835d2634016c9d52a39aa34f7d866dde0720dd9d0d0c84eeccd9fbd20516240528a576b974a58a1911755d79fcf8f17beffcece8e8a86631513410430a968b48ad01a9749510251737c3dd06ac2aba01410d48807a61d0e5304304448cc802d86dbac3d3b32767e727ebcdeda3e39d9d1d2788c7c4b1a410d9633006125520cd952257021d24ea75bb9b782a480d7b34c516f34b0c494787a2de3ed88a485625d18e0d429ccce6cd64da21db75645e898409408822e2b568366d429a2c96cd7c5e57c705b0a0a15a403055458d86aa6a3aee18791bbffed4ecf1d2e343385ecad5d86b587a643a1dacaba51355b0ae96f526e75cab29183e7af4e8c9a3278f1f3fa9b9448a68508ad65a374f8eb254104503422483de017ed074f545510841c0acca24867193e866985ea6cf16f3b3f3b573c7002057c9551e3c7afcc2fde7430829a594424831466eda1402cda62d1124a34a395734a080441f825155bcf00bddb61b32044010108730bad6744f052fc5983a804e34cd97ed7c41dc98d1471178771d991f5c5f9948054ec8418a4288d3e5ceeefeada3d559855a01590d50031a9198918898ca28d2f3143aef03abd9f7efeb1c32ea3c443130d3c12c40ceba92ab6e72b7ea36ab75d7755dad22624f0e8f57ab4dee0415a58ae4a20a848646939042c389432066e8091dbefc70bf33626e9a4611b4d436267620510c14d800ba5a6aad67abf3ae96522b10c618232750cc9bf2e68fdf4c29c4b661468ea16dd362399fcd2684bb2110a7a48cb56640c21011c9a524fa6c69308cbd7a08be0de03d1ba51048cdd0d4cc14d44c444cd42457e1a62d4605b1992f9bd9bc0200875f3865adebc8fcff1c99a8aa8c088c56c998d3743edddb7bf836266335a8a00828fd30567430acfa40c111f8a0bdf92845fef494d260b094ec35728ac8aadb9c77f9fcfcfcf4fcec7cb559afd79bb58bb28356416553cb9bdc755d139af974f2e2fdfb6d8acbe96c32994c42f2c53f22466200a8b566a91c42dbb64628b950ed696b21450c5c6a3ddfac37b9ab229b924fce4e1f3d397cf2e4c9e9e191377bd376129b90523232229ace27a5ee8b2c66d3346992308a81a892b21951202d4f67cb7ece35a2a19ec2afa3c391c1d44c14d4a52da118a4a6a9450be07c360bed5421e04770e67a1d991f72d45a43933c61c5149188627bebeebdf7def86177f4a0614ccc67a76793d4b68b692dc5cc35040808c514549cb831fa9cdbe0beec2a08fe4f171420c0a72d895415fac87493f6b3b3b3a3b3f3c78f1f1f9f9e6cba2222524144a440ce59b2cd269383bd1b37f70f16b365c3747b7fd9304d6313638cc431c6496a628c918388180211095829455499a8ae8b0f7e7a01a11896ed94029f771b4ed11056ebf5c9f9d9e1d19377df7df7c183070f1f3d20a218633349f3e5c2a68d94dc6d56a747c7329b04c2d4b8b49fe69c351702165171e16c42823e6f470e66e694e81141a5aad677ef26a2226a22662a204a5801cf4a29693adb3d68e78baca08460d7d5ec95c8986a204e4eae060258118d0337d3c96ce77c755aa553224e09195d419c60407fbe0f8bf7d4bc773b509d03655ba85191329ea6de679652dc1921af37abd5eaf4f8e47ce58da688d8cdfd5b3b07376eedddbc7970b0bbdc6d9a86804964af8d2d51136208217a958ac86624d55c871291cc48ea057b128779a8088299a29a4c43a0188828055e4c27073bcbdb07fb2727cfbdf9f69b0e2cc0c01c39b571d2a6c4c4811801504daa32a00b1b213d853d84515fe229dc623f987538ad5f24ccd188ae686fc41b958218a6539e4c80a201830500bd8eccab340a220445012c0618529cce97376fe5f3a372dc55310e0c06a51434739cfc78c9df269d3c3d7af5558aef3c7b9cdac5734ad5d176d2b9c5a51429c56a21b4490c3bb3e92435d69339f1f9fbf767d3c5de6277d2b4010301268e899b58720063533645b33e77d78a445aab8372cd4c5410119803907f9edeb6b3d70ac2ae14db909915eb675101613e499ffac42b1e9902a630685f31b629c640a06252a4000736eef1bc36b2e4f0622a26e6b207daffb5fb798f66d78810d3ea8ad36a66050d4258e522c8b3e572b258604c66ace0bc1ebd8ecc2bd1670e0ed32c06681039a4e9ecc6ed3bebc3f79e1c1f6e4a9e12885a2e2511abf530f5ed3ef3fda493f14e6fe3d98f823d4a0db63817dadb2e8bbfcfb46919c32cb572201438c6869919693e5f12202a946e953715ccdab685d848c9c6a4a1098122a740601818ac02d59a45ccc8cc50ac12050bc13c7b23a8894185213289ad6aa96eeae3e829841470b69c720c313232299a989af94735620804a086a6a004246028263dfd6ad004d2a12d1f552d6db09e16d3aa45555100aa994bf9ba3f1242274ab3e9e260bf992d8d932a9b3b905c4f80ae466482419fbe0c4c018d0343b3b37770b27f70fcee5b9bd3f31031aa294a4aadf48169606a06a6d09b11c14856bc08cb1ee67ec1f01cbc208767aa6a55a955cc8c99dbd4a490c655a7ef1cfdb59bd5869008a965a436802a482ea5e310b3543353235f053a79b3eb4a299d9b5c02904726278e318eeb7e0535f77d25945a0d8d1938b211baa626078c31c4c84dd3500c40d6cf93416aad3d950406143fa2a2aa1a402fc367203608d1a280aa0ab812d7a0396852a49a1909a002083adf5c0dc44009268be5626f3f34ad2002065587c95e47e6d5c899bd69a3ebe3a19f3bd8cce67b07371f2f9647274f6a4576cd0f55bcf0ba7abab7dc96ba1c078fce1f845e6976bbfbe23e5b6a9f30a3fb0b193352cff200189d242167132193841c12a3111411116435b3ae76a52a6387a6a8a85637eb2c5a5480038251f5c88c149bc44c214460442020006432141005452062264443e510528a3bcb698cec9bcf6a5a244b25460be44a5ce261a9805441c0aa1a51407798b6da6b7622f696137dbeed23b342ef92400a2c804a7ee932832ac2b159ee1fcc77f794305745e2c134e5ba9abd02071154975624060ca0a660a2109996bb3bbbbbbb670fdf011540b42a22c2c8db13a051e8d92567b76137dbb297ec05b07b270fe639bd6dd1300762e64084ca91434c81991d13ef3f6cd1b4a5cb79b3925ca00a21c540164231e86aada588545040531353a95255b482212b03789189a44cb5a34431341c90302003592482e97c295611992221328036cd643269a64d6046d7d734b16a06a868c603f409cc6b59a85515d090d47a31127162a76760c25e84c19c38096aaaa66ee04b155491c5ff202006b5425acc77f7f7a6b3c5b968814a7ce1657a1d995761f6c35aab81a1019101a20954830a94668bb4dca36666a5c341f494c814d9067f2a722c819b0b118dc5ea988dab0a5d7447bd9c9b99891522b29e79a98846a680c484bdc86d4fe05402005263e34968e24c4bd552b58ae3e4cdc00c0b5a35717ea7878aa00a28310b0322baad3aa18a162e1c410304622120322122ec56d52a736c28c6082184c924ee2c269bf57934022600a89edf0014b187f2b86ad9f04f55811018c423b04faa4044d8f7bbb6a5c7a5668655cdcc58cd44cd3cbd6386b0369ec445981d50b328eb5acc266808b5ef10ae23f3231f975514313010989aabb401208575c1c57cf7c60b2fffecbd870ffff187bb04bbed52bace252e6990cae92fe206aa4a460c4e920a00e64a907e42abaa890e599afa9ed6d4257cfabceaed9fe0f8081110836b793593e0e7790d8811b58056ab06394b41d4188bd69cab4f7d54ab21610000ab65ad024aca1459d14c036a1063906818636c4213225b804421706c534829c618196db53a03804ec4f5788cd047660171933760408e6770b60b00122182d8e02c6480be3c55e9af24bde0eca8c6449d664800002000494441540b9376f1e8c9e18cb069f9f8c9a128363b0712db0e9ae75ef854bb7fff68c3c02922583d6f63906ad739f34a1cceadde62759aba8672d35a009a2e6707374fde7bb03a39a6ba690c99311028828a3120a1e2a8fe8a403ef0503533323253d361ab3e8c88062903dff3895a0f912724331c079baad50ca57786d59ec16108644aa88415b578294c0c6c1413031aa1aa90855c8baa55ab80081111b99865a929450d8429708c4c482160606554ad0084586a05040513154617b91eb63b201f80701a752bc74f670327b697faed55077bbd92cb9b60dae48c40b596b3da19aa85b0aaf94c68f1dcf371674fe34c28180242edcd4d90ae26d8e08aee332f0f85d4a59ed4244d27b7efdcdd3c7cf8e0e4f874bd81263586a64617c3d7deb0801ca00e3e9b3400a8d61bb61aa85adf620dc22338ee427b03815e4847695c00f632b0b5dfc9a311115e2c24c6cdbd22427078211931808099b90bbda9503fd3c1aa2a556bad88bc4d22ed53742fe6634505aaaa59e841b817c057b88c461c2ad80bb7250523c2714fdbcbe7b9d3bb6ea3f9fbbf9498942e276629596a0ea151b0f3924b33b9f3ecbdc5ee4e483157eb793b0a2a765501ed573e32477da7aa625adb18f76edf3e7d74ebf13b3fddacd713621625045475c148368400cea31acfd4c1cbce8740eacb836de2180c3e1fb08d490040878df698dc5ecf728c4c1d9cd6456c30bd33ed31b948446444440c2c224c040009a09af6ce0e8031f6189a7eb5c8346c66de3755f64f85d8d5021fa4a635feb297783684550dc0b60118db13e9ed3757d52a005519432e2a0681e33a7725f0eead5b3b776eb5f399112a288111918977d557b3cdbcce995b674f564901273b8b9d9b776607fbebf3f3b588012635247079472072b6239811a0d32c5c99d2738d82c025bc7b3f075235ec851b7bb959df029a89f6e4fe5ee2d1869739424644faa9ae2111a18eed2b329059cff44084189809a1969c3322a694426a38a0e3dd031213c5109a109f526db601468800b55e24bbedf8f4992a5c32ea2504db7ed0cd8eb6b74ae3e84706ff693628eb4dce8562d8189e74d2cee7775e7cb15d2e21a562554c080219980da4f5ebc8bc82c7b82ca3c00654091a8cb383bdbd7bcf1e1f9d9e3e7a48c46686a281300c8a971cd0fdab064d689f43120088d5f79fd630782e3c258aa968a08a66c43d4763fbccdeca5117ee9a40087d8a363276efa3d68cacd7ece9ba6ec31b059b346d3b9dc4c8d514d58828041a29a6db9724ebddf25cb840b73ff6f864d7dd1abfd53fae176c90f70bb48b19018819a876a568ad2aa00ab9eb444588d7eb22a15ddcbe73e3d91724465fd9aaaa9b58a00151d0abba36b9ba91e966353dfcba3760a0acc2a8ed6279ebfef3878f8f9e1c1e26355141d3401094ccd80299f5647b3fa709707c473fbfa1d737be0077c300d6ebb32200602fd8e523a43e679a0b5ea90cf61ecc1c0223a23b88b15e121f1a83646f7749813db9e59cab6a0a814208294a0f1c37ee9d2f555553e08bfa135d580cc06cec0f9fbab23c2554b9652471d1880ad8a56281507c5d5c2457a9b9d65a59498a424c9b8ae720b3bbb7efbcf8f264776f45c155d1800790463f1ebb9ecd5eed43440cac4825c4c574be77fbf6ecc60d88ed667d6ea20c261e0c15073d5844e81dd1c5616be62e9408434bb99d973e8c54bdfd1c00b72c32affe109139b82610513fa21c45773c68fd20a2c964322a8998e38c4414ac994ceaa0090426b5d6b2e94a2991b7462bfde500fcb5ef2f47b7a74797d22342a0300a97295c68171011aa2f7855a4e65a732de63247c82136b5e635f0dd9b770eee3dafa915f1599913eacc2ae0951dfe5cc1c8547cdaf7020d08d4106aadedac09d46ece4ecf3779b1dc7bf6632f3f7cfbed9f7eebdb93f9ac6c36a5eb78360591d2ad17f32918faa9e8b23b3e8f19463b647d1a1c6b3fea67b85bb5a2aaaad580b1178b76433e6f2cad364d1aecb3c853bafbde2522446424d70469dbb6699a1863d334ce5fa92a2683b72793585f2286105220555dad569bcda6c7d5975a6bb521ce11b1905435ef2a11d04d3b2f46cad01bad8c20471193413c65f89b92eb608b99aa55b552d5d54c5404117395827006d6ee1f3cfbd2276fdc7deebdd3539ece6bad0018994c946c3068bbce99572d44798851cf172904101453031234416e668b833bf7defdfe0f4ebbce6a892166b55c3b528d5d491cc8978b43852800a636ea136fcb20f879bf9d85fa52d0486d107adc6a41c7d2d137344c4c444401111da11e8807b59ee4f8dbf57aed6f1e39f8d407117baf4c66ef7299919967b3594a49a48848cda5d62a5afab8225463abb5f7c01c3ae4f7f5a51758455715ba10fbf10f4f082a9e42ab4855911ef94eab5c28a5f322309d3df3e2c76707b7cf3a09cdcc7b023218863e5b6b4cbcc6cd5e8519ec454b38fcbf03a0410c218b800030ab58059e2ef69efbd84b6f7fef1f1efee4c735e7ddf9ac935abbdc10ae7367ac4c14b097cdd3815e12f0d2c2e0a215dcaa06c7fe8c86f31ef1a2fddc0eecbecfe4c0cc1e994d0aae1e12630c2184c08180d0ba9abdb20d81878da222a0bf76db1128c6389d4ebb6eede8f9524a194c4dcc0c221aa122186dd1d97a56d74864d3318b827a8100aa3db802c08c50440c404c8b8a55c9d21b55e792634a2bd0dd1b373ffeda67766edc39cbda2ca6b9165f11632fefee3ad197fc51af23f36acd817cc8c0482619889822a85481942607b7eebef8caab870fdf3b3e3b6d44582a8a361caa58a739105b2066f6ee1006f630d9d35b8771b6b99d48893c61f69aae70c9ca8e46059310420c3184e0dae84cd0ebfa84e042c91e543c88c0baa97baf69a9ca0018a33f73605a2233c7183d91fa4ab49482882a6011222100783cc316c600b60040e38ad2f7ba1766efde32087897ebb2b7b556472c56d542d6d5aed9bd75efa597f7ee3e1bda39759d2a799e1d0ddd1c36a557b8d7bc7ae8bc21673a56c0ef23bab9022273a45011a49a058acdf4858fbff2a37ffcfea3c3c727ab75d0da1834eec3aad644038a9e4014cc33120c320363a624ba84ebee65cb0155811c088e3d8d734caf83b934730c1c43884364022228b37bf81999ba15ae998510c064c0ab5aaf1889645c03311123a29aaae868563f1a817ab98888eac46860047e2a086bad606220303a0d4a6f6ca80aaa2062d2d3ebc01044444c73ad45aa7bd43b621153da10bef8c2f32fbefa9ac5b41188cd6cbdd9c4406ceaae346020088204008a72cd9cbe12a5ec53d5918728b915723fb177ca26a902a8eeddb8f9ccfdfbefbcf3ced1839f712910c326a3980400579bc201d1464491d86c703a198ed16af6a912d7e728509f96d8f39419027b621caad680c888c61088c0531d0c7bc80b688e688f2cefdf0646c9e95e1268f474d8fa600cecd41915d0527118508d6139b2deb6b3e590ab71d001ac225255bda6ad2a5535d792a58e415e09521316cbfd675f7cf1e0ee9d53a55ab4494964d55220043790f2ab67df775ce7ccab5cd07a7384888c01145521202370156b38dc7ffef9777ffad3d327879a7355596da4252b66aa7194d570d556636331b28ba43446a0fb7f8d53d91185b3edb07041f8241bc372dc8bb8bd583f39f20a53cd8b4555b52ade028223cb1101d10055447376f16b22606642dac6d0a9aa98a9c3881859199fd21cb30b45f98bc255c42573cd50445d87d373a34766a9b59a16a99e2dfb5f8ca932de7fe1fe8dbb77214482049672d6c41382424a6c620e59c43e3eafacac65b86a4138ba5cbe7fbae0de8c2a826a180c1115a833dcbf75efd69d7b3ff9e10f72b742d02a558145d40005b907f3201a2a82a9f63a550488dec89921a9298eb97404031120f230cd35f79cef2b5ae6c0ec8d65f474473d8c545487018f9a47888a408c00c034583bf806460d918a54ff41314600657677321bf35ed531ad514012ec5176baf59c71532906a2266a554dd40cb4a85495625245abaa430e4a15552daa628668ecc53385aaf1cedd1766f3fd2e6bbb98aae86abd9ecf26908bcb960c7b2720f05ff43a32afc6c13d267c705c1ce065e456d5b510408a4ca65532c764d074965f7af993dffedbafe65a538080707a7a92dac5a633c9199123d32471502caad2f55b7b42f41c158d5d6b4b0ddc0e044c88c88014380444266f49c514801387182313c71002b25629a231c60bc4d0a09ce01a793ae880a96a56dd2e5955956a01a6488cc04a2028d90c8a8d0a9406e2585e420450a96ad5ac56f051acaa89b8884255a9458a8a988a6a151081dc9d0bf474d42a9aa58a5ca06401954340324343c6d44ef7f65e08b81f6c0a10f37a05015383621da0622f8d008a04a034e0b4ae23f3a37fb8052a0cf65536cc842e82736b5044a686649090264d33b975ebd6fac19b119d6802456ab5508c1055aa812a54288414e2f8b3c8c8c4d41d0314108c91188d99010d158dacd6eabe0c5bba250c3092577cb129846844aa9a521a85f8c6c252557357c775e836128045480843200c8866c622e2f21f2ea33ea6c4be964634d2c1d1bd972303a05cbaa2526b15d3ea5c69b1a2b59838bb45aa553511abbd650b8a0a029219a11121139051939601a7a66c0ae4062868da53c760dbc584dcc0f3ba9abd728de5fb06b6976645831140248accb199bef0fcc77efaff7ccbb078c5295514ccd4aa0bfd5433364668a733f3f53eb9603bb118820a1b831162200a860c98184ca1d68e2984a821044646c022628801435570a4100040554453ad342c33b69bbd9133e9831c3f468f1f220a066c200a44eab0f831af9641318c88021af8a41850104525d7da15c9b5ac7357d5bb4655d5a2528b5695a255cc2b5e936a23cac9556e81941023070e149981793e9f3b0a5f45d045d24c4df54a23f1ae23f38307b61fb25ca1411d8a002984bb77efc5a6a9e79b88c41400d995a94c0d4c452c5725065d774618b04f834c428064c00a841690845401d858b4b88d27a346886216fa90a322b5c596880058ad5f1b1091016e7231135f5a6a955c8bd6dead404cd100081909c827ccbd85999a31d8289fa508a8e6744d0537b93710c846208ac8326c4aba92379b9c6b5d779bdae749e9913d55ab69aea5af5d65404d30031811032a8031410c1c02a540cab858cc7c95aaaadc8fde7ac7d1eb53f14a47e65325ebcfd9aff4242f151305c5e562773e5b1e9e9c70448e018c413db7aa9aa8580121c1a29dc786cf542313331360242035416503d54aa444e298014097d601eb27408a0840d50c43303321c0884c2e3f54aa99a15a35b52ad907a3a6ccd1c1f406a01e23a2ae6a2b06aeff17499d0763002ae26b192304b970c205e901fb553567f73acaa5d64d578a4aed4b5fec21042a9d54f59f273dbc894588080118898325e6c816d82213a6309f4c430866761d7bd791f94f489bf8210f1aa028aa9941d34c6edd79f6f0bd779128a460a50080aa190a00a856f78e0743202c5088281057df7e10f63b0f3f77c188c4f793f369a858512d19a9a19a8b8c80acd75525949eab154d0803a0c21617c4e72e02a886dde05a066ae5e209ca06008258c7fd8d2b56aa6a100da248d4c3746a555544277062ad65d3e5cd66534a292a5d5744354b15535014371a54cd7a01e1e30b2ca20260244c313429040226089128c694520881bcaa1e9c88e8439d38af23f3ea3499ef2b620d3ff8ac703cad49253502e4989ebbffb11f7eefbf124200515532331653746e879a291011f623905a0369508b0642284604ea2d2e0112a3a35c103766024091a9699ad404662603c45a45e2905e42662236531e807b3060e55c40a8d701dae26df60222552f3dce346ae46651ccc527494e2e514080828866584ab7d9e4f566536b15309fcdcaa0b0e0156c515322306287dda3311221300083c5404d0a4d6024238080146370460b11413fa6522fd4c72bcef571a5ab59c5ff7658fa18c38a105aa048a6376ede8d694a9a0929d6aaa858949858a10020787f4538e07260849b32abe6bed873151f5fab989daed7aa82002184d6ac859438201a511084a2e622775c1191cd24714234cfb700e48a7b6632de221a7344549feb4a5103c7ec09221341080918626c40ab2a542d524dad22b0f7bd46a80a3977eb75d7756b1153e8e57747bc513515912a869cc039dde81a97c060088a8081383171f0f0f325ed055d7b18fff6cdf075cabcae663fa4a02544c4f5d9f96c369bcf66ebf355edb2560d405a9502e58d2c76f6f76edcfed95b3fbeb1330b60527271e364025552005fcbabc7a7cf55458a0800040c030ca687d6212a99121178b99cf37ad3354d9a4da74d1311619d3bd43ea23c56112d858ae433260323403545030123039f010942199f23d5dc5501c9980801ba2eab56c48e1333c75a4bd715d5ca31c5183d7f962cb96c6a71020919e2a6ebaa3928fd828ac9cc7ad9190d110363604e81679336448a813936a514004829f9602cc698014a29dcc688b4d96c9a61db747d5cc5c8fc39e3bfaeeb66ed64369b49adc78f0e03f3ce6cde18750f8e630820756f6fffbdf5e9eedecd777ffa13516b53aa265650401850112d106828901dc030426a2f34cac7c586191911ba058a828119a0a9185aadd875d50698ab416fcd83882868d055c7cd6db68d55b6ed1b00007b84babf0a5d7a0f00887acc9da80200774cd4896929c5cc284b0865c0af4b71e6a68abf6d57cb80d493a1fc4034e3c0bd160118013241604c81db14636287f8f61f8f0888bdcf1c82d91734f073a41eae23f3aa1f6d4c2292381010a04d6293579bc70f1fcf6b98c5a6569bcd16a99ddf7bfe636fbff563cda7b18d249db22982123030402400a915415c271ad59d39bc6c133303a55e727238c6dd3a9a81a9581631ee3ac7d9f2659f4e3468db0b90ba672dcf42b5d60f704032f3e5a1b791bedf1c01eebaf5b4f125ccecef2d5286db41cf721033bbb8140072400426b400c8089130054e8127d3260506426646a65c15908168329fa594886884e5ba4cc2f519781d991f7c4c2693c78f1e513399b713205d1d9f7efbefbef9bd6f7df7dffe4fbf3f991333779b329befbcf0e2cb8fde7debc7fff04d2200c61408221b2248008d0a1a19050844b5a753fbb089466cf805c383b99af653a33ebb0a55ac5a88804a65ecab6234003453303371596719f0316aa1aa115a95be7e252403df589a191571a08f2be8d5c1c7d6f79faa6a8891d91045045407300e398e7d40315487d4236dc1eed1101d1fef2c700b889e3053e414388400841c832142a9c021a466369b514a460417f29f783d9bbd8ecc0f3d5484c4664d4b0aefbef9d3fff28d6f7cf92ffef2e4d1e1bffd97ff4aab4ca7d3c3c3a3bd83dd5bb7ef7dfc954fbcf3a3ef996d083032518a8864c492110c887cc70f9e351de76ae6ec4db3dec0fa4231a81a8c251f001aa8aa119049ed8d3afb84d24f74cae90902d3c0f27491580360a2712b826ea77b59b8445447613c2304d3a2a2aac88e6a0597050251c25e00deb5c206ec9e212299cf60b127ac50aff9130008fa3a36066a22bb6b0b050e311603a01062339f2da7d3b9c45810f1b2c8035c6f38af72648e4059b80c3340809acb7c369bb6931f7fef075ffae217fff24fbff0c68f7ef49b9ff9ec72320b4821a42e9f2852db4eeedd7beef6eddbe78fdf22460e81c01448800a138a062233945ec3c603047b9be7612c342adca8aaa8291299228c6414e889cf8800465bc44800c0a28832a6d971bc393e82974ffaad84dccbf6202201ada588a999a1602552b35aabd4ca4a044824bd865daf46ab22e89af08364340000aa31212104c4c8d430a7c04d64df583a911481cd148867f3e5c1ad5b29a5cc5ce0929b03d2d555afbc8eccffc6588801a5ca0fbfff833ffd8f7ff4fa57befa8f3ff881e6faf2c75e5ccc66b9ab5dd72d168b6e53c284a78bf9273ff5cbdffacacf024473e028132b87c08941a4033524f74500573c470020044035705ad8e09d4eda275672c7e6c1d799c8103c72007ab584914106349aa9f8020210b2c8a55f6a884fd78086c1cea407d632e45cb6f015d26380aa4c436b830b8bb7dcfef28084809e98b9cf946808cc480c9142c3d4066a528831a4c0812984a084d534d78a88f39d9d67ee3d4781f182688a23b8f7fab87291e9fdd8c85a501c3b3f50043472ed9914e33b0fdffbda5f7de5f37ff8f993078fc9b00d4d135b8e8d74b2596f6edfbdf3f0e8b09d4c99272f7efcb56fbdfe37626005043786c06429089badc52a219a47665fa3aa1b6f22b0379cea92960a60eccc1733375e301340343273aab4f55cac61c2c900b4edf933f254604b1f7d8c611c8c2efd4eef8080c8aa55651b9050a45a1513a50404800488404840fee63eb502620e8c3ca8c242af2a442150208e011b86863132c41890300355c1a2a418d3f460e7c6334ac914d08c1502615523856d5533771673c9123480abaa04441fc950dcfeb2ad5b45d8d4ce18307029a5ae4ba8d8404ac227ef1cfde97ff84f9fff833fcec7999459f9f4c9d9dd3bcfaeab62db70d31e9e9c4eda992871bb9cecdffbf5dff937b87ce6dd33a971bed8d941d8507ebcd3ca6c9a9a76cab1410ee6543040a0081811a2299b321a3186c8a9e52612072f59a5820a989856a9b9964e6ad62aa08646266002526aa955140c089001d980aa582ee2e6b76a387e55b152ab9a552d4572d5d27f07a44a0613305129b574256f406a0c349bb66005a1331333511017d1030e1813840884e242cf0c815c866fdea41900048259cb112ad6d52c12d6759b38c67872b63eebe8e6fd4fdc7bf55761762b4ce75dd76d56ddb29d3716f0bcdc6c9672b29986567341348ab4ae6b25e109aef239b82de23ff9eb3a67fe823496f8f42d05767b8d10529312016d4ed7e7c7277ff8077ff8ad6f7cf3f0bdc792a58dad943a99cc76f6f605c9cc800891154101150282bdf0f15f3a3f5fe5ae9c3e7a0773b75cce25e1d9e60ca82170200e9be2900a4806ac0b1a3889850c1435120a10928a00808b2df7ad970d5391ed4508f1079f7ea3b4cff6d407d1aae4a7de6124915d12bfed3b520bd8ef67c8a9dfd41b8f211182122123040f4b46202a5d9e4c9b26b69388b336328480dab431af540057ebaeabb6fbccdd577ee933b7ee7decac93c4b8d859c652b554167bf8d63b6fbdf9f6c73ff96a5d778198880c8143a850a16a3b4920d7d5ec47b287b4f71709080652aaa1ed2c976cf4931fbef1cdd7ffee2ffee22f4f1e3f29ddc64412c7f57a9d02cde753a732792db77d2aefecedbffa89d7f2fae43baf9f9c1f3d0ad3c0cd14baca48811483eb8398cbb8bb0ad820dc3e569c808084e43205a3f8f2535e974f97a964f02167abd9f8aa8b3bb9e471d73ff675a3eed676e9cbcc4c08608ca0a33a3b39c4159880112342200a6c2990639ad470dec688c6208a14084565554cb8393c5d1f6f74bebbff89d77ee9e5573e3159ee3e7c7292739e4ea75865b55e534c0f1e3cfad257fefa5fdbbf79f1d5979a49aa5af32687c88658a526be8eccab74448ac05e1ccac9e9e977bffd5f3ffff9cf1f1f1f13620861bde92ae17abddeb97563b158f4ebc70b1cb98f4578b5e976f60f5efbd4afc866f30fdffdc6c9f193c8dacc9656329a0a2181088288a9821a028199da803e18c2afbf1971a4a320faa0106b4fd987d116c4f429c9e90fb883ea42b2de8b8e9139e6cc71393918a4209917b0bd7d2f131012a245044460440fcbc89c02310153980636ad260a8610928888d23ac3f12a373bfb9ffcf4afbefadaa75333e9bad2348d55d96c3655544426f3a66ddbaf7ded6b9dd6fff57fffdf9e79fe1e12e74d69421b63239d54917855fbcc8f6064fe7c7d0aa20866d37616303cfad9c3af7ff5eb5ffce2177ff2e33702c5d0dbc80a4024a29b376f2e974b3203426220860b4c193282620877efdd4f29c418ffee1b5f3d7d72389b841094cde9fa540a205401450162542345535f6b0e72274585c01cbb66883060be87c0439ff578302bf66ace70d9fc072ea2bc7fe70b753c51c01ed0305836180ce822c7ef84d003891811d4084901a8b7bc3617690e64849610024222886c912c10a0651202008ea1994c29a4aecb15e8b496c5ade75efac4a73ef999cfeedf7aa6ab966b17621326e9e4e424a504886676f3e64d29f2fad7befedcf3f77ff77ffc17cfbd787f921a53335152ef23ae73e6d558903051ed2a1375b9fbce37bff31ffff00fbffff7df9f4ea7f9bceb4a6d22a3afec08770ff67db019e0625530b48d94d254bace62baf3ccf3f5bfd3b3f5e61fbefb9db393878b96020a01332a01136815133270511f844aac62ea36ef00e216816a4683f82da02148a980086a8e015204f24da7f94be092f7f3e54e722b6d5a08045be2b763721e691fccbdb0adcf0311fdb6cfa581fa66330622b080960245c244181899904d0356c2c42929d0c97977da158893c5cd675ffbe5cfbefacb9f9eedec975e623be69cfd4773086a767276164298cfe7ef1d3efa4f7ffc27ed74bad8ddd9d95be6da954d21c410a25d57b3bfb893d80fcc961f36a6d34e22a5c3c78fbffd77dffaf33ffbc21bfff80628464e16b55b6fa66d0a21388778777757608c442222dfb5183122946ac8dc5535869bb79ffdb5cffd2ea7d9f7befb7a397dd7b533190988818d2314f110025544858a48da5bfc25243143b2d107965d4e81517b27401cbfab0062c0ae3c342452006f4db7e373b436c249d33864d70da147a4d0282cc04c313a0b05543570e8e3b367c678a7690d030126a2c098024526268e64931899599014e9f43c3f59179c2c6f3ff3c2277ee957eebffccacead67ba5273d7c5145d7173bd5e4fa7d393f3955f2db42a0844e207efbdf7952f7f796767e7373ff71bd3c55455908994eaf53ef3a3bf203200a0bcc907bbf337de7bf4677ff2e7afffedeb8bd97c77befbf8c1c3693bd15a5ddd3c4b65e61b376e2c974b2de5fdb94881bad5f9dece2e81accecf16f3c5c73ef52bc04de956dffdda7b801090008010235965eb913f6615cc008282702f178f48ecf318379f1d7659b825c96166e3ff53553074d31f1b6ffd9131dfba1a101a182a238991893a438c9803313205e2f1114642225003c0c8ec81cd043e89f5dbc8cc684cc074d19a126a4ac9148b6111ec042c4cefdc7bf133bffeb9575efbb44058752a8048c9dbdd949288cc66b3f71e3d9eb4b3fd9dbd870f1e6d361b13d85beefff0fb3ffcdbbdafdebf7fff954f7c9c62abaa39170a7c3555673f8291e9ff8fa594bdbdbdd5e9d9d9d9d9cece8e99ad57abd964be58ee7ee7bf7ceb8ffee88ffffedbdfcd9baec689a22c668be3e3e3fdfdfdd26dbcdcca08fb370e528a5dad00a02a4e8f706625014eda59ae25104fa64b513d3d3adbbb79f7f7ffe7ffe5991bcb6ffccd5fbcf5e61b077bfbf3797bf8e851c9757777f7ecec44a45ce434870000200049444154dfcb2382aa30710821e70cae007279de33cc862e7a485ffc209a9811a3e7521d0ded550dd1efb3fbf30118064634ea61150ce8880b234c1cc64718d07a9b4c56556666246220c048182205a2699bc004d4dcea8f028514530c47a727f3d952819f9c6de26cef977fe5d73ff56b9fbbf9ec8b022cc8bd96122a9ab8b058d3344747477b7b7bdda6f8d136cdc9c99974759a267fff9dbfffbfbafff35ffffeefffe67fff5bd3c944449ab67d78f8b86ddb9d9d1d973e714bc2a669ae23f317f248293d7efc3812efecec48a9a594a66918f0a73f79eb4bfff94b5ff9d297f3a63c77e759553d3d3eedba8e0c72ce25d7520aa121daeeee4eae65eb826d4897edf7805c4e8b8c91909891f4377efb7767b3c95fffd55ffef8473f383d5fed2c9693493d3a394e29211ba95515230e40522de7cccc06624a48664a6ad5b4e74303aa73a3c75b0420ea4dec5c1cbecfb1663010a902a27fd787558ee00120764325704f4dbfc42822f190619178a8db21b07795440c812832aa94c96412637483861082a19d6fcaeec1ed878f8f4fd6e5e633f73ffdebffc3abbff2ebf3833b9db2201bb26b86110188a09181f4f36d1b3f6d889c08d0aa4008274f4ebef3cdefee2cf7f676775f7ee5e5d4a4cd6aed76da47474739e7c964e2f4ebb255cb5c47e63fd3c3f003f69693d4accfced3b44d219e9caddab64d293d78e7bdfffb3ffcc1d7fee6f5278f9eececec11e0e9e9795ee7b669a5663760aeb5c64031c6bbcfde2ba59067159f7c1a202a0163cf294153f45cd3b33c009a69facc6ffc36b773fbc29ffde447df3fdfd46913dbc93c970d11195aadd51063930263d775c48036f05010cda837aec40f80b81802185d168384a774e846846d5fc3f3b0c7751217c01099174e0d9e6b8717928fbb8880d10251f41c8ae6be436a98524a93892a6459bff5e0849bd9cbafbdf0a9cffed64baf7d3aecdc142531308a3632bf0dd08b6b440334132f6cccccddb201286fca64329b35d3a3d3a3affdf5df6a2effeaf77eef73bff35be7a79b3089be4c9acd6688b85eafaf029ff3173b327f4e0792735e2e97047872728288d3e9f4ddb7dffeeb2ffdd59f7cfe4f18c39d1bb76badc7874722d2b66d0841a5781deb02e4f3f9f4f6eddbd5347178fa8c47451c1e1cd0030e5325a4a3b3c39df9de2f7df637e364fe8daf7cf91fffe1bbc767c731a002a510547593ab9faa1c433005a930d0b910c1ccc91cacaa037672fb1690500d3f30263f60ab898a7d4a445f9400f0f07d43a756f6b73cb824052260a440402e0f1d1c8400a52a11c5a6a5d4ac8b749bb2a900cdf2939ffeec6f7ceeb7f7efbf04824f9e1c234fa6cbdd2c8a637b3f0092cca097d8654444534c29cdda191a344d53ba1c4238d83d383f3fffebbffa4aa0b87bb0f3ccc7ef1b41ced9a7b8a7a7a76767678bc5e23a327f518fd56ab5bfbbb73a3bafb9dc3c38383a3cfccf7ffe852ffce91736abf572b64b40a52ba0b8982d55f5f4f41450113185983bc839efeddd9b4c26aa0a8c4ea03444d76a25735366f47d07200232801107409a2c6fae24c7185efdd467f7f60e6eddbaf58daf7fe5ed9ffc68673e010a21d0c4b088c2e848ebf35ef3301ffcc10086a2f5fd5722e401006e60ef4b954f75a617c0840f8022008e5f0e2d00e8073c01a917bc23f0be1a901035b5b3c9747ebee90e8f8e39a4dd833b9ffb17bff7cc0b2feddfbe670aab22cd7411d20411c9468c91ba57120c971f01f392dbdbcec964828893c9f4e4e4e4ac9c2d77978bd9fce8e4c9dfbdfe8d4dedfeddfff1ef6f3d7727a5d475ddc9c9492925a5d4b6ed66b3b98ecc5fc82372c839d75ae7f3b9aa7efdeb5fffc217bef0931fbfb933dfb5aa5925c60846a5945a2b33e7521061145fbd7fff3e6c21722eb59788008686db89b447d52942930ca9c8ffcbde9b3ed9795e7762e79ce779deed6e7dbb1bfb4690e20210e02e510b358eedf1589a38e3b1a7c69929cf58954a2af9075249553ef973924a2a5fe249653ed8e558b6e571cd782c8914457135454a0441022441700141000df4de7dd7777b96930fcf7bdfbedd5844529464b9780b856a34807bfbbef73dcf39e7777ee7f7d32469dfd13b1b8d3869c4675feb5cbdf87e56940040045229662cf40d2602d3fe96d7ffad9878a4d7ffb84e9b7581b7bd9a9df82a6d2f71af9f70d65f0b2148785703f0a20a15122ba571602cf786a3619a918a8e9fbceffe87bfbcf7e80995741d429a15520551270107837eaa944270935cefc06b936cd32b42660e5514c7b140cc4663dfc7165901212451231d65a74f9d8226fddad7fff1830f3ee883330802444cd3f41f7c41fb0f3632a3282a8a422965b5fed1a9579f7ce27b57ae5c09c3101db305298410426b9b6619304571687451fb46ca40dd75cfdd8e594ac958f9c655c51efbf52814533189950d111bc4745cc838544a6a5b08d6edb9dd0f3df2e8e183077ef477cf5dbdf2e1e2e255a75d184aaf49404aa229112749b3a60ddca8529d2441a89a50d8fac207fc8d229000a006aea6322ad639d693d56b0682f24311402410c853cc3e0160d322772ce676edbefbdefb1e7af8f3edcf1d1ff71c63202546cd10009c0663bcab93a3eabdb8ca7b6de2a53bad5da6948a821018f3bcdcdd9ea19806839e2db508249230d63cf7dc730568223a76ec98cfaed6da3ccf9324f92c32ff5e8f2877b49a756fe39c636d82a871f9d2d5c7bffdbd577e782a088256bb530e4a00f43b534a049d76b7288a2ccda40c982db3431461a00e1f3e4444811280bc05ff4cac07aa3ab1a6d478a20e3b8f0997c600b8500a070c4e84cdd943b73767e776bff4c317862fbdd8db58d38cecac63272a76ea943559ad3fe02904588d4feb30f3ba3bd36189ce028040da56a94e342f912bd9785f0cd7caaed590c4b30e70a2b3892091096d6d50cd448e04489969cb243808daddf9fb1f79f49147bf2cdb33e9faa0317b30d7505a160299b9cc3522361b715916d58fe1aaf7c65009174c7186a1f28f0068b51a4551e4ba04c046b3c96cb32277966215befac3575a4163d7ccfc8103074aa38510edd68c3186d1d57a2b9f45e6cf691af951515900005252e5d91800dacd44176539ce5acd669116f39db90bef7df01fbff59f5f7ff94c8ccd46d02c465650009316ce38e78cb68e850a8240aeadad341b91d6fab6dbee989b9d4de2b848c78d468baa16d001081004447e19da03a6ceab814c78ad2438f4059cc312904483e298d9b53a7bbe9ccccd1ff8dceba75fb9f0ceb9d1b027089512a3de66bb11a94095656eb591524a81da1a4982911ca045a2dab2c8310293073deb045845110300554e5cfeef99a6d2a44540814008880ec131cb090c2b1c48064924c9199b854a38a0d25852519c342d8851ae37c7c5cceebdc74f3ef4c0238fee3b7c1b8b20d58693765e163eca9c0100100400ac75591d043ec783577140ef34d169b68c318a84c11291e677774b9d05a1b28e490844ccca82190115800d5da0fbfd979ffaa1d2f2b77ee7bffadc5d776ab6dab9342f66e666d0715ae4a1145aeb52e7711c3bf3f1544bf8b3c8fc194e4d9885106cac29b54462a58a346bc4cd37cfbef1f453cfbe79e64d2e39523168610a4381dad23760700cfe6666c62008bc8e5bbbdd4e9244002aa5f04667b24320c20afdf1b56cd54539020be0808949384646c12c1c3a9d9be6ecdefb1e6e75bab3737373e7df7e6369e1f2dafafa9ed93930459ee7d66a25a40a0438aef233564aae0ec8eff8030964ae5c799127e90f019da7ec61fd8d49faf409df56c86c85d556745924e12d031104a342228256ab3d186d32aad9d9594b72bd9f8e734b617cfca1470edf71f7e7ee3931b77b5f81921d89b019a8c0a405de5c5ccb7326188099189979621ec895bb345255d93a7f9cb0f77af29b7144cce3feb03bd3cdf2f4b9a79e05a07ffe2f7fe7c091c36591cdcccc6469519499314607b2d96c4671301e8f25a9cf72e6df8f82964897a522c240e4792600431549896b6b1b2fbdf4a3679e7e6e7d6573a6d10e82d094ecc9a21318bf12ad6266c74e6b2da5f432c7dd6eb7d96c7a64e8a6b97dbb1cd6644a8175bd8b53bf4f0a54948dd61dc74fecdfbbe7f63b6e3bf5e31fbd73eecca0b7016c2451182508901b8d8e05f9bd178728905880235f0aa2136ecbccde1f1954419e550757bf3e78b29eaf810980d0d3f77c651b9017d1026420cb5eae04108759613808c25883ecf7b3de309ddf7bf073c74e1c3bf9e081dbee4c76ed05c6f13867e28af5fa710e500faad55229b8ad57af8e0cde02b700112509672c381c67a31ffedd8b693efeb57ff21b5ffcea974a67745148259bcda6316559964a2929827f301a7cbfdc9189000498176590448152c53875e048a1d1ee074f7effcc9933bd5e2f0cc320888c71d6ba2008ca524f4766fdd05a0b41655138e7daed7614455aeb280a6ef5ead72b2f57706875e66f55e74c52aab2d4a2302a92f1befd273b9deeccdc1d77dcf1c3e77ed0df5c1d0d07563b29101895104205da1488888c02c0798a013a6412e4a61aeceaeb49db46db37366162a1023059fb9e58668302128cc45bdb6416c101699614c405e360636c918ede79ec8187be70ece483cd99398812b04e1b27658042398779998742eec0abea27dcb1fc3d399e260e484c505382a65a190fa8d54f982449996720686e76579a8e9f7efad9c2e8995d73878e1c0c82c0ffb3284a06835e9aa6dd6e5767f96791f9f7e2614a1d05a124e591d856a3b9b1b679fa95538f3ffebd416f206510a9c81893e725325586cd933b66c74de333241179f87e7aebff63815230d50656de5fe000280a63200493f3a840a483b7df75f0c86d478e1c79e3cce9574ffd7869e91a963a50420ac952801508e83d9b69924b102c61f5fc84dbbb720fcef2f6a530bff7e9b7ba00851767f0f352cb5ec119981db3aba450286acff54799b6666676efddc78e1f3b7edffec3b7a9561792268fb3b2286414ab28760e8cb1a10ac1d9e9f9cdf5217afd372761b93522dab22aab923cd5431fa78d14aab43a1d8d48ca388cde3bffcefff347ffeebffbefffdb63f7dd3b4ac74b57afedd9bf2f8e1bfd7eff1f920adf2f7f641a33333303ce8d87651c4604e2fc5be7bef5177f756de19a44a52874c6b16329253269ad716a828f53dbc64110203a218452aa7692f3d0ceadcbb36d61591dfbce8b580257f41ee7471244e09c7544a8fc081f9c3e72dfc3dd5dbb771f3afcd6d9b317de39b7b6baac4dd964144480402c10bd1badf56a75781d0056c5a52fd479eaa7f2b1ebc983800448cc02fd17be1706b4c8c80e88d132098762bd9f1b50070e1e7de4d12f1e3b7e2269774048100a4a671c0a21858ac04299178814264aa7dba5ef6e3eefb9a102033b2fde079514dff64569442cf2a211470050384d440a6873bdb7d1effdd55ffe87ff617eeed06d47b22c4387329461185e3f7ffe2c327f716f80c86acdd6852ad04579eaecb9ef7fefa90befbe1f05b124858cd65889524a090eddc4106e7aa0efffa894d23af3d088a71f04a174ce09a48f729f6d9172fc336ec78d888190b4365a6b49281a0d10005a67d92890d83e78e40b7b0e1c3874f4ccfefdef9c3bb7bab8506443442660460b08082c3cfdc8b7925ca98d55d31300001612d9918f4c9e94d000dec80b8101190949000a579f23c4822a7d05144e1088288ae6f61ffadc030f3c70f7b17b54b303d6001050604b2364445281066db57fbbb6bc15f673c36a16d92fa0bbc937b9f668a97ece4935ebc98a8294b54c42b6e2c802aff7360cf2eceed9bf7beef9b9b9eed77eeb9fee3f74001175aea508acb5f85964fe3d99672a158cfb4321c4dcdcaeab97af3cf5e4532fbff852a735634a4bec69d8c23928cb924030732559cedbc01b0f365472ac00455194651907a1314628f951eebcaa2aab22d2db78390681ec008081b4b6412055249d669d971e7555510b85012610b8ebc091af74666ebfe3ce33af9e3a77f67436ee5bb6a2d23360440b302104621df57e4258ada731323b6266576d511300b8ca170c11504c784bc884829088119d405f7c932427c22fffca6fdc71d7bdfbf61ff4eba4d8e80060d6efc74913a404e3cab24029e346080646a37118063fb1a6b83e5b5662284c80c08c55aee31b1c82524a44cef39c4b8c93a4dd6865a62cc6453b69fde537ff726969e5dffe37fff6e0c183169c0c5459944a10a0fb2c327f7e8f2008d234b5d6c6712c84288ac2cfc410b01927cc78fe8db79e7aea07a77e742a4d4b4931b2f0f603c084085831c5a192689c864c1d23a031268aa2d1b01f45d16030f07ff4769135790da6a43daed7899c3eec2b1202122032a3374f30863d999464e069ba84525b2476c02882b8331bb5da9d3d7b0f3ef2e8179efceeb7fbeb2ba3cd75c71a250138b686c109392d8187cc4cb0f5e379a9949a80cb0061188ec723c798244d45aa1c670c18c78d513a2645419820426f34b4028f1fbbf7e12ffecabedbee67191b5052492402cdecac0a12e7004a0b00522a0070990580288a6e36119cee21a729bb6c2c226a6d922419a5791cc783c1204992a228482829030259f99159ef47ea04b014010bd65a333a252433eb4cb793d6ab3ffa711886dff8c637f61fdc37180e3bb33383412f4e42a5943f5e61a2abf24bc7e6fba589ccd16814451111956599e7b952aad96c4aa4516f14c56af1daf20bcf3effdcd3cfad2cad26712309937c9cfb8102f936ed7a747eda7f12703a506b6765808f69ede8934095d6687a410dc131103138bff555e900314a8504c816d00201a9b03d8b4aa97ff2f57ff6c17be7df79ebecdad255ad0b295085412069737d2d8ec3248a00fc42a91502a40c8cb5c0e4f5bb8881bd17183a53b8248c9450c090e7b9d6656e615498d6cc0c921c64456accae7d07ef7be4a1bb4f9c6875f7b20c592840c950b106d9e34737e2805ccfc1fa28532eefe050140500e479b9b6b666b48d8298819c0324f6e2b7ecd82b88f90ac78bdca367358023c246dce80f7b3f7cfe856614fffebff937fb0e1eb8b6b830bf672e2dd2d1682444e5d559cfc63e8bcc9f55cef4d330af28e543342b75b7d5b974e183a79f7ef6a9ef3f756de15a923492b0610a3371dfaa16b70000274e70753fb3159c53b79d73ce93da9d73443bf7336e56d356e3723f2c440220ae772ab7b4626bea6a35fd87aad142b0ec1c08024928a2565304cdeeeceebdfbf6ed3ff0dedb6f5d78f7edcdd515c71484d1dcfc5eeb8a521be71ca25051000096bd2520236fbd1f12c82080504a6263c6594120e2664bc8a0b436674cb33c6ab64edc7df7bdf7dd7fe0c86d8d992ec42da303affeee2a88a952aee6aa7afe690b454472ce12c9344d016830185cb972c55a2ba5f4fb778028a524944cd638416282c2555445bfb78a56dbc2a6898a07d9f0b9a79e4dc2e89fff8bdf3d7068ffb01cf964ee63d22f580b8fc97f16993f8b471cc7e3f1d85a1b86a10f4be75c28d5f2d2d2333f78fa7b4f7c7f63bd373b3b2f50eacc18e3709a9a56254c1f1a5512db660182546b3d7b572c638c3fe02b3fe5eb82f3668a75b61a72c0560802578d2d3b602042c7c093e6d6af2f3a46e7c019b682258210a1d5656bd7c11333f3fbf71dde35bff7ed736f2c2d2ef686833df31dc52133a363e71c57fe96951a7c55d96e75d14c12adb525bb300c833889e2069022876969e776cfdc75fcde873fff85997d075c6932ed14390a95c7971cf3d4f340c5daf9a96feffaba95651944c9fafafaf2d28a10429032b6f4350b3091a089a6bd1fc04e1f6f008c6cc11a93248d66b3b9b4b4f49dbff98e24f52ffed5efca860a1ba194d257b31e63b7133fb5cf22f36752cd4a299552c6187fc5fda7fbad3fff8b33a75fdb585b4fe2a62435d8ec5b83ddce6c9915c044157faea29c83970b804a756e3a38b72c7aac33c678db2c210438dc49f4b9c56d87d52fe1f578b6fec6a1cfa2d3633d04e2ea50104248f256b396914048b668b51618cc1e38f2a5eefc8123b79f3dfdda8577cfad6c5cedb69276bb2da52c8b4ce7053826225beac9e413bd32aecff7968d15a2d10883301a1bb3391ab350516be673f7dc7bf7f1fb8edc71a754615eba306ac7429585168802c079d71fdca217a1adc3f2a78a4e0ff6d4d5caf2f2f2783c6eb55af551b2755c9224b20ed8fafea07204750408c88438d3e966453e1e0eda49232dd2679e7c6a7d7df5b77fff77761fd8d36c36fdd9dd6c3689c8df3c9f45e6cfe4511485c77e9c73511439e7de78e38d975f78f1d9679ed199f6b56e99e5845205d21b5e01d428e6d696839f6838c7d39159275500b0d69665a9b5ae9806537b8cdb66e553c39269ef4a0708800e103dbd15dd84e0ea7cab39d1e0f0ae09c4d63a6622414a0008f4e14c80226026e34a2948b4e78ede1927cdee1d77def9ca8b4ff636d7ae2c2c2172a7dd6e264d6267b4264584ec679582c86fab21b131d60290c0d29afe70302acc9e23fbeeb8e7c4bdf73fd4eeee0e5a1dcbe40c68168a44d0104e7b9ec4f456364c06319f4241e89b4c63741886d6b985856b7e17acf20544317d31492ac7c8ce80650780ecfb7626876c2d3165835161f4ecc12e222e2d5c2d6d3972e3c77efd1f7df9cb5ff68a5e7e3dfd972e61fe9255b35e6acd5abbbebefede7bef3df9e4932f3efb7cc22aa4c031eb5c0ba15aad165b4ad32c100182a896a826a3b32a2c9989b7a879c8e0a76a88ecadecb4d66559566e93483fb1c9dc021eebcc095bbe8050710faa9f64f27f3d3ac4ecd85ab6e824212039070e812d388b2a0808025be6906b22b9e7d06d7bf6ef9d6905efbe7de6cc6baf6facada6e33c90a100d6651908894ce8c15f6b27123c8c96d99aac345a8866ab73f8ee03779e7cf0f663c7c3e66c5ada61a95bed5909381e9922b54922d83181ad7a64dc9a986e45eace99c4c7c63c8550d6665114f587e3858505bfffe973a9108226b6117ebbc00bc4331860af2a51f5efe078d81f4812712b76a5d65911ab5809f1fdef7f7f588e11f1befbee4b92c43fed2f5dc2fc2491499e57c5dee7b0e29dc1ad8101743b4655b5a7e5f558df8ed58ec9cd4d8154c3e19099cbbc78e59557befdedef7ef0c1079da883da099408c0c239c7795efae7f52294ec1026f02803325746b3d78375ce39a22df8a72e686fb6967643d9019c6c72c294fbd854aea1faedd7e33b190450966ec27fb1e0d0551a93cc609c0520118428d0e5599a1507ef3e39bf7bcfbe83b7bf7deedcc5f7df5b5aef87821a71448e981d21086779f2731b844cbbd2a123d1eacedd76cfbd77df7fdfee0347204ab2923bdd7940351c8c1165ab1901c078a443017893b1d08dc2f2134da109acb5422963cc466f530861bd58200a140424eb93140905120258afe749407eec842c64400451d22e8a6c7975add168341acdd5958d99d6cc1ba7de18ac0ed67e63fdab5ffdea9e3d7b1c5a1f9f6ef2c3f3f65bf1fa9b70db675a41ee0e982a6f4fbce93ffec54526fb9d05982cc46e6df4de88b1e800c08225029a72a1f23885b5bee2133e2afc676fd1494692880cce3989520a614a5ba4054a5efae0ea6bafbefec699b3d7161646c3b4cd31a4c42c4d7558b00062c7002884b01efb04047034757b69679899266e59e48b27022144bfbf5e1445b3d964e6cb972f7ff1f35fd85eeb6e79aa4fefe66f5b3a71e0fdb43c7e08cc06c02f466f8ddda942868191d119a38110109cb30e2ca1ff7f2088ac35cc4c12bc2dbb211251d32146ddfdc71edabdf7b6bbf7bdf1c699d75ebd76e572da1b37a3b011ca3890ce59a34b7616d99620fb1c96181c397ce4d1af3c76c7dd7783545961d071b3d5729a1ddb24504c42971611a34892ab40d91d827c75c2bbfe88ba2112b663925917ff42509e673333ed719697463bc07151b6440800ce7949251242212258a7b50170924889d0823565699c46062b10a53400a6b40c2269741cdb342b92b061b48d8360e9bde53fbbf867ef9d79ff77ffe5efde7bf2b8761a058ef3914397341a20204d53cb2e0c4306caf3dc181386611804fe139248c618ace982fe067364092c393705e5bbed217a7d10f0cf2d67fab084ed6179eb6987755a9ba2e63103303b08a472c0d654e799df6d974214e9d8eff65a6bad33a976697f3cec0dfefa2fff7ad81baeafadf57b435b94cce05559a50a27d238d5a6fcb6643875c8f1649eb6751d275eea48505b65f98236cff33ccfc350898f5908792e7bed95079573c9d4f2094fa3b6e4687b3aaa3642c03aeb8777cc503a03004c02558444e36c643537ba7b1ef9cadcfedb8ebefbe65b572ebebfb67cad371ead6da649a4669a0d81301e8d3646a3e4c0fecf3ffc85871ffe7ca7db2dac8592a3a4133492322f898044853d5b74de07897e060a01db087ace003a630c2308218cb3d6320862ed57d1a9a2fb7a3d3f409c7c2ec84c44cc12bce2ed6465c0df0850c10a1089c0681760c8ce9d79f5ece6c6c67ff1abbffac5c7bed0999b69444d4b4eebd2944e4a29099d734118326103c94f598a3cd745c1cc4918d515a20fcb1ae4abfb14bc89a2eaf4b0173f69707eccc844e7f7766f912477a47b34c659070e08498ac07714869dce354aa1a41442009331c616bad469abd1606bf2b2ec6d6c2e2e5c7de7ed77cfbe76e683f72f3a63c1023814428641284801b375134b9e29ae1cde48c3ea16e3ac5a31d9ff6c1e3348d374341a49d9fe049df827a1286cb7a69dced23598e9cf0eed5c90b4247a11033e1884edd6eced77ddf5dedb6f0d36d6575796faebab57567a8260d7ae5df77ceec0bd9fffeafcfec3adce8cb5ceafd138c0fec64610c60080e49fd6cbf139e7aa5bfc53794cbf9d6923504434da209210c223a842085d6ad85e42d7ae47ce3966532b1259aba740389892eaac6e41afdf1525e168343a75ead4c6e6e6870b1f7cf9b12fdd76c7d15d7be6c119a3b5920112a5a5ce6c6aac2da760bc3054411098c230829bdcd2346d8efc73998c7e82ced8afee4e7798b7ea33b5d63e1f124a8fb4b07368210e236bad2db465e3a5689450240297e9b7df7efbc5175f3c7dead5e56b4bceb940864a0451185acb565b74a88d335c8043cb4eaa906f44d1f4b9f1fa1d880945739a1504d5b4619233adb5e3f178381c763aad4f1096d328eece3eed2384f4d668d46e151495bb26b375200239cef2d5d5e5743cec3492f9d9d93b0e1cbce3ae63a3e1e6eab5a50f2ebcffe1fbef31dbfbefbbefc147, 'asdsadsad', 'Citizen', 'Approved', '2024-09-09 19:03:51', NULL, 0);
INSERT INTO `citizen` (`citizend_id`, `fullname`, `email`, `gender`, `phone`, `c_date_birth`, `age`, `address`, `valid_id`, `password`, `user_type`, `r_status`, `c_current_time`, `otp_code`, `otp_attempts`) VALUES
(40, 'edik Arong edik', 'edgardositon90@gmail.com', 'Male', '09394245345', '1977-06-07', 47, 'LowerCalajo-an Minglanilla Cebu', 0x696d672f696d61676573202832292e6a7067, '$2y$10$q.UrRGmwRTc7OaFAP3FXCe8swgpKkTzZBcpF3HnorTLmpYSR/WF9G', 'Citizen', 'Approved', '2024-09-10 11:56:02', NULL, 0),
(43, 'Daniel  Arong', 'camposanodaniel426@gmail.com', 'Male', '09394245345', '2003-06-18', 21, 'LowerCalajo-an Minglanilla Cebu', 0x696d672f556e7469746c6564202833292e706e67, '$2y$10$9qNw3TBKSLzIA14.PTzSyemOP6bKmOrkQ4LHn5FGFFR8jOKkzwcaW', 'Citizen', 'Approved', '2024-09-12 14:15:47', NULL, 0),
(48, 'trial', '', 'Male', '+639394245345', '1974-06-30', 50, 'lower', 0x696d672f686973746f7279352e6a7067, '$2y$10$f/xHFrwNkj6ouw6BwF0x5eKzM4sIl2IQ2RsV9QnHI7uWYebACVJgi', 'Citizen', 'Approved', '2024-10-20 14:10:48', NULL, 0),
(49, 'Fr.Chilser Uy Tamosa', 'priest3@gmail.com', 'Male', '09394245345', '2015-03-05', 9, 'lower\\r\\nsaddsad', '', '$2y$10$Opi.vuVTSBPOD5gZLtMlTef9kZqAjPiufQjRXBKERZjKiGvVZqGSS', 'Priest', 'Active', '2024-10-20 14:26:53', NULL, 0),
(50, 'Julio Baltazar Balagtas', 'priest4@gmail.com', 'Male', '09394245345', '2012-05-05', 12, 'lower\\r\\nsaddsad', '', '$2y$10$9yg4ktTkTt.ji4uEDa0NE.CEW.Si488edt8FKvzQaqZbTSGkSQWh.', 'Priest', 'Active', '2024-10-20 14:31:32', NULL, 0),
(53, 'Reymart  Belarma', 'reymart@gmail.com', 'Male', '09394245345', '2009-05-05', 15, 'lower\\r\\nsaddsad', '', '$2y$10$A0V4gho1iRr7LWnaOiQ5Du3BvaL5IcZnG.QWdVwRJhVoVwHghpjfW', 'Priest', 'Unactive', '2024-10-20 14:56:18', NULL, 0),
(54, 'Reymart  Belarma', 'qweqweqwe@gmail.com', 'Male', '09394245345', '2008-07-05', 16, 'lower\\r\\nsaddsad', '', '$2y$10$uogl/d8r6BzdK5WCA.5aZOfs69LomY0s56V2qJFjUVVWqW1znNFeK', 'Priest', 'Unactive', '2024-10-20 14:59:32', NULL, 0),
(61, 'qweqweqweq  qwe', '', 'Male', '+639394245345', '1941-02-05', 83, 'lower', 0x696d672f77656263616d2d746f792d70686f746f312e6a7067, '$2y$10$2smnFAIsqQ6yim.CErp3TeJokVtOPDCJxfq638ty5uqkv2RoKiQtC', 'Citizen', 'Pending', '2024-10-22 18:54:26', NULL, 0),
(63, 'edgardo qweqwe siton', 'edgardositon902@gmail.com', 'Male', '+639394245345', '1974-03-06', 50, 'lower', 0x696d672f77656263616d2d746f792d70686f746f322e6a7067, '$2y$10$DB9JVYxjiCPhZhQcMPQJB.lZ2vKiqBQt/IX.jHFb5bNx603hnIQoy', 'Citizen', 'Pending', '2024-10-22 19:21:15', NULL, 0),
(65, 'bbbbbbbb bbbbbb bbbbbbbbbbbbbbbbb', '', 'Male', '09394245345', '1992-02-03', 32, 'bbbbbbb', '', '$2y$10$ooTk/nBhM7DbvsGI9AtRHuxGjaH1L2CInACBq3mqQLMnPEfjOd9Q6', 'Priest', '', '2024-10-27 14:52:18', NULL, 0),
(66, 'qwewqeq wqewqewqe qwe', 'qweqwe@gmail.com', 'Male', '09394245345', '1977-03-03', 47, 'lower\\r\\nsaddsad', '', '$2y$10$D63/4kclEpqOOHmCELekB.v1JQZKm5jHlrbV7zSp1eIUurqfYHDE.', 'Priest', '', '2024-10-27 14:55:41', NULL, 0),
(67, 'edgardo qweqwe siton', '', 'Male', '09394245345', '1927-01-05', 97, 'lower\\r\\nsaddsad', '', '$2y$10$E4tf92dSyvFDR1bWgZ1ghe68oIX.iGyNWk64q4JBejLOqtvq5Mgm.', 'Staff', 'Active', '2024-10-27 15:01:09', NULL, 0),
(68, 'edgardo qweqwe siton', 'sdcxvcxv@gmail.com', 'Female', '+639394245345', '2002-02-04', 22, 'lower', 0x696d672f636f6e312e6a7067, '$2y$10$/yRfs.DD9skskS7dTAQeBOM9urtKGc6ION/qgCn/AxXumLvZnPcvW', 'Citizen', 'Pending', '2024-10-31 18:12:37', NULL, 0),
(69, 'edgardo  siton', 'edgardositon90123@gmail.com', 'Female', '+639394245345', '1957-04-05', 67, 'lower', 0x696d672f636f6e312e6a7067, '$2y$10$jkB2NfTQZy52Dtc7C9gtLOyK551I/Cn7z3Ijn67KbjQpp6kFPRdyG', 'Citizen', 'Pending', '2024-10-31 18:14:06', NULL, 0),
(70, 'qweqwe qweqwe qwe', 'edgardositon93240@gmail.com', 'Female', '+639394245345', '1965-04-06', 59, 'qweqwe', 0x696d672f6261707469736d616c322e6a7067, '$2y$10$zAF131.1AejBQOoEq/rWZOO5zjQOPa694xxEdwH9EJhyAX4AFEEGu', 'Citizen', 'Pending', '2024-10-31 18:20:23', NULL, 0),
(71, 'qweqwe  eqweqwe', 'edgardositon90324@gmail.com', 'Female', '+639394245345', '1995-05-06', 29, 'lower', 0x696d672f77656464696e67322e6a7067, '$2y$10$cAzqbOeTqgkBXsFviUTkqeT4NA4PM1qC/Zxi.l5fguyNxrvLMvuVG', 'Citizen', 'Pending', '2024-10-31 18:22:05', NULL, 0),
(72, 'xcv xcvx cxvxcvxcv', 'edgardositon9012312@gmail.com', 'Female', '+639394245345', '1975-08-09', 49, 'lower', 0x696d672f6261707469736d616c312e6a7067, '$2y$10$A8.T9eoED28EpaWjdGG5.eUGvw.du3Soht3sM9sqSs3D7ER3n48SK', 'Citizen', 'Pending', '2024-10-31 18:24:25', NULL, 0),
(73, 'qwewqe  wqeqwe', 'edgardositon954640@gmail.com', 'Female', '+639394245345', '1975-02-05', 49, 'lower', 0x696d672f686973746f7279352e6a7067, '$2y$10$nAVe2EsrVBNpJRmaDNZyhuYbbqXy6LriexCYof1czkcD0hExn2uZO', 'Citizen', 'Pending', '2024-10-31 18:25:56', NULL, 0),
(74, 'qweqwe qweqweqwe qweqwewqe', 'qweeqwqe@gmail.com', 'Male', '09394245345', '1989-04-06', 35, 'qweqwe', '', '$2y$10$DiiOe4TcqCBAHf/Afxsi4.kvpGKi2zsvV30lczNkgW9PQAHleUqSG', 'Staff', 'Active', '2024-10-31 19:24:06', NULL, 0),
(75, 'qweqweqwe qweqwe qweqwe', 'qweeqwqe@gmail.com', 'Male', 'qweqwe', '1991-05-06', 33, 'qweqwe', '', '$2y$10$sWnKsBdDyBGR69KQFQVDEeSAss4XeOPbL/ZCDV5qh09l04JYwtti6', 'Priest', 'Active', '2024-10-31 19:24:53', NULL, 0),
(76, 'qweqwe qweqwe qweqwe', 'qweqweqweqweqwe@gmail.com', 'Male', '09394245345', '1963-05-05', 61, 'qweqwe', '', '$2y$10$1UNX3eOYcqlmQAaXZmCNj.1Vp2yOd4c0QoV5zmWCBDN0cu.8Lx7Di', 'Priest', 'Active', '2024-10-31 19:30:33', NULL, 0),
(141, 'zybe  maddie', 'zybemaddie@gmail.com', 'Female', '+639394245345', '1982-03-05', 42, 'lower', 0x696d672f617263686974656374757265636f7665722e6a706567, '$2y$10$mk/fysEUvKKnjWSvjpkzHuw8VLx3UkuC4gGrdXfeHDOnGM9.7LoEe', 'Citizen', 'Pending', '2024-11-01 04:10:54', '592571', 0),
(142, 'Aeron  Villafuerte', 'aeronvillafuerte20@gmail.com', 'Female', '+639394245345', '2003-03-09', 21, 'ArgaoSkinaInyuhaCebuCity', 0x696d672f686973746f7279332e6a7067, '$2y$10$ZSPoYW5l06Cw1bHIfT.h5e5EtXUNz7h.gENMD/lENWawXGdmQmrn6', 'Citizen', 'Approved', '2024-11-01 13:42:40', '357295', 0);

-- --------------------------------------------------------

--
-- Table structure for table `confirmationfill`
--

CREATE TABLE `confirmationfill` (
  `confirmationfill_id` int(11) NOT NULL,
  `schedule_id` int(11) DEFAULT NULL,
  `citizen_id` int(11) DEFAULT NULL,
  `announcement_id` int(11) DEFAULT NULL,
  `approval_id` int(11) DEFAULT NULL,
  `fullname` varchar(50) DEFAULT NULL,
  `c_gender` varchar(10) DEFAULT NULL,
  `c_date_birth` date DEFAULT NULL,
  `c_age` int(11) DEFAULT NULL,
  `c_address` varchar(50) NOT NULL,
  `date_of_baptism` date NOT NULL,
  `name_of_church` varchar(255) NOT NULL,
  `father_fullname` varchar(255) NOT NULL,
  `mother_fullname` varchar(255) NOT NULL,
  `permission_to_confirm` varchar(10) NOT NULL,
  `church_address` varchar(255) NOT NULL,
  `status` varchar(50) NOT NULL DEFAULT 'Pending',
  `event_name` varchar(50) NOT NULL DEFAULT 'Confirmation',
  `role` varchar(50) NOT NULL DEFAULT 'Online',
  `c_created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `confirmationfill`
--

INSERT INTO `confirmationfill` (`confirmationfill_id`, `schedule_id`, `citizen_id`, `announcement_id`, `approval_id`, `fullname`, `c_gender`, `c_date_birth`, `c_age`, `c_address`, `date_of_baptism`, `name_of_church`, `father_fullname`, `mother_fullname`, `permission_to_confirm`, `church_address`, `status`, `event_name`, `role`, `c_created_at`) VALUES
(209, 1496, NULL, NULL, NULL, 'Edgardo Arong Siton', 'Male', '2021-03-03', 3, 'Oakland Newzealand            ', '2008-03-19', 'weqweqw', 'qwe', 'qweqweqwe', 'qweqweq', 'qweqwe', 'Approved', 'Confirmation', 'Online', '2024-10-22 08:33:19'),
(212, 1531, NULL, NULL, 71, 'Edgardo Arong Siton', 'Male', '2016-06-06', 8, 'Oakland Newzealand            ', '2007-04-18', 'qwqwewqe', 'qweqweweq', 'qwe', 'wqeqwe', 'qweqwe', 'Approved', 'Confirmation', 'Online', '2024-10-27 06:06:45'),
(213, 1534, NULL, NULL, 73, 'Edgardo Arong Siton', 'Male', '2019-02-05', 5, 'Oakland Newzealand            ', '2009-03-18', 'cvbcb', 'cvbcv', 'bvcbcvb', 'vcbcvb', 'cvbcvb', 'Approved', 'Confirmation', 'Online', '2024-10-27 06:14:50'),
(215, 1586, NULL, NULL, NULL, 'qweqw qweqweqwe qweqwe', 'Male', '2021-03-04', 3, 'Oakland Newzealand            ', '2007-03-19', 'qwe', 'Edgardo Arong Siton', 'qweqweqwe', 'qweqweqwe', 'qweqwe', 'Approved', 'Confirmation', 'Online', '2024-10-28 06:37:55'),
(216, 1587, NULL, NULL, 115, 'qweqweqw qweqweqw eqweqwe', 'Male', '2020-04-04', 4, 'Oaklaeqweqwed Newzealand            ', '2008-03-17', 'qwe', 'Edgardo Arong Siton', 'qweqweqweqwe', 'qweqweqwe', 'qweqwe', 'Approved', 'Confirmation', 'Online', '2024-10-27 06:24:36'),
(223, 1602, NULL, NULL, 119, 'qweqweqwe eqweqw qwe', 'Male', '2019-02-05', 5, 'qweqw', '2008-02-18', 'qweqweqw', 'qweqw', 'eqweqwe', 'eqweqewqwe', 'wqeqw', 'Approved', 'Confirmation', 'Walkin', '2024-10-28 05:11:56'),
(224, 1611, NULL, NULL, 123, 'qweqwe eqweqwe qwewq', 'Male', '2021-02-03', 3, 'qweqwe', '2007-05-18', 'qweqwe', 'qweqwe', 'qweqwe', 'qweq', 'weqwe', 'Approved', 'Confirmation', 'Walkin', '2024-10-30 06:12:03'),
(230, 1613, NULL, NULL, 129, 'edgardo ddfgfdg siton', 'Male', '2022-05-03', 2, 'lower\r\nsaddsad', '2008-03-17', 'vbnbvnbvn', 'Edgardo Arong Siton', 'vbnbvn', 'dfgdfgdf', 'gfdgfd', 'Approved', 'Confirmation', 'Online', '2024-10-30 06:16:59'),
(232, 1666, NULL, NULL, 169, 'qweqwe qweqwe qweqwe', 'Male', '2021-03-04', 3, 'lower\r\nsaddsad', '2009-03-17', 'qweqwe', '', '', 'qweqweqwe', 'qwe', 'Approved', 'Confirmation', 'Walkin', '2024-10-30 06:34:11'),
(233, 1676, NULL, NULL, 179, 'edgardo  siton', 'Male', '2018-04-04', 6, 'lower\r\nsaddsad', '2008-05-18', 'edgardo siton', 'edgardo siton', 'edgardo siton', 'fdgfd', 'dgfdg', 'Pending', 'Confirmation', 'Walkin', '2024-10-31 03:14:42'),
(234, 1689, NULL, NULL, 187, '', 'Male', '0000-00-00', 0, '', '0000-00-00', '', '', '', '', '', 'Pending', 'Confirmation', 'Walkin', '2024-10-31 04:12:55'),
(235, 1690, NULL, NULL, 188, '', 'Male', '0000-00-00', 0, '', '0000-00-00', '', '', '', '', '', 'Pending', 'Confirmation', 'Walkin', '2024-10-31 04:13:45'),
(236, 1691, NULL, NULL, 189, '', 'Male', '0000-00-00', 0, '', '0000-00-00', '', '', '', '', '', 'Pending', 'Confirmation', 'Walkin', '2024-10-31 04:14:03'),
(237, 1692, NULL, NULL, 190, '', 'Male', '0000-00-00', 0, '', '0000-00-00', '', '', '', '', '', 'Pending', 'Confirmation', 'Walkin', '2024-10-31 04:14:20'),
(238, 1693, NULL, NULL, 191, '', 'Male', '2019-05-05', 5, 'qweqwe', '0000-00-00', '', '', '', '', '', 'Pending', 'Confirmation', 'Walkin', '2024-10-31 04:14:42'),
(239, 1694, NULL, NULL, 192, 'rwerwer werwer werw', 'Male', '2021-05-04', 3, 'werwerwer', '0000-00-00', 'werwerewr', 'werwer', 'werwer', '', '', 'Pending', 'Confirmation', 'Walkin', '2024-10-31 04:15:59'),
(240, 1695, NULL, NULL, 193, '', 'Male', '0000-00-00', 0, '', '0000-00-00', '', '', '', '', '', 'Pending', 'Confirmation', 'Walkin', '2024-10-31 04:25:45');

-- --------------------------------------------------------

--
-- Table structure for table `defuctomfill`
--

CREATE TABLE `defuctomfill` (
  `defuctomfill_id` int(11) NOT NULL,
  `schedule_id` int(11) NOT NULL,
  `approval_id` int(11) DEFAULT NULL,
  `pr_status` varchar(100) DEFAULT NULL,
  `d_fullname` varchar(50) NOT NULL,
  `d_address` varchar(50) NOT NULL,
  `d_gender` varchar(15) NOT NULL,
  `cause_of_death` varchar(255) NOT NULL,
  `marital_status` enum('Single','Married','Divorced','Widowed') NOT NULL,
  `place_of_birth` varchar(255) NOT NULL,
  `father_fullname` varchar(255) NOT NULL,
  `date_of_birth` date NOT NULL,
  `age` int(11) NOT NULL,
  `mother_fullname` varchar(255) NOT NULL,
  `parents_residence` text DEFAULT NULL,
  `date_of_death` date NOT NULL,
  `place_of_death` varchar(255) NOT NULL,
  `status` varchar(50) NOT NULL DEFAULT 'Pending',
  `event_name` varchar(50) NOT NULL DEFAULT 'Defuctom',
  `role` varchar(50) NOT NULL DEFAULT 'Online',
  `d_created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `assigned_time` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `defuctomfill`
--

INSERT INTO `defuctomfill` (`defuctomfill_id`, `schedule_id`, `approval_id`, `pr_status`, `d_fullname`, `d_address`, `d_gender`, `cause_of_death`, `marital_status`, `place_of_birth`, `father_fullname`, `date_of_birth`, `age`, `mother_fullname`, `parents_residence`, `date_of_death`, `place_of_death`, `status`, `event_name`, `role`, `d_created_at`, `assigned_time`) VALUES
(110, 1408, 20, NULL, 'cvbcvbcv bcvbcv bcvbc', 'bcvbcvb', 'Male', 'cvbcvb', 'Single', 'cvbcvb', 'bcvb', '2022-04-03', 2, 'cvbc', 'cvbcvbcvb', '2007-04-19', 'cvbcvb', 'Approved', 'Funeral', 'Walkin', '2024-10-22 08:27:48', '2024-10-19 12:31:42'),
(111, 1409, 21, NULL, 'qweqwe qeqweqew qweqewqew', 'qwedfgdfg', 'Male', 'dfgdfg', 'Divorced', 'dfgdfg', 'dfgdfggd', '2022-02-02', 2, 'dfg', 'dfggdf', '2007-05-19', 'dgfdfg', 'Approved', 'Funeral', 'Walkin', '2024-10-20 09:31:59', '2024-10-19 12:32:54'),
(114, 1533, 81, NULL, 'Edgardo Arong Siton', 'Oakland Newzealand            ', 'Male', 'cvbcvbcvb', 'Married', 'cvbcvbcvb', 'cbvcb', '2020-04-03', 4, 'cvbv', 'bcvbcvb', '2008-04-18', 'cvbcv', 'Approved', 'Funeral', 'Online', '2024-10-23 04:50:06', '2024-10-23 04:21:06'),
(115, 1595, NULL, NULL, 'qwewq  ewqewqeqwe', 'Oakland Newzealand            ', 'Male', 'XCVCXVXCV', 'Married', 'qwewqe', 'edgardo siton', '2021-04-03', 3, 'edgardo siton', 'wqewqe', '2020-03-04', 'ewqeqe', 'Approved', 'Funeral', 'Online', '2024-10-28 05:03:11', '2024-10-27 08:16:27'),
(116, 1600, 117, NULL, 'sdfdsfsd sdfsdfsdfsfd sdfdsf', 'sdfds', 'Male', 'sdfsdfdsf', 'Single', 'fsdfsdfds', 'sdfds', '2019-03-03', 5, 'fsdfsdf', 'sdfsdfsfd', '2007-03-19', 'sdfsdf', 'Approved', 'Funeral', 'Walkin', '2024-10-28 05:06:40', '2024-10-28 05:06:32'),
(117, 1601, 118, NULL, 'qwewqeqwe qweqwe wqewqe', 'Oakland Newzealand            ', 'Male', 'qwewqeqwe', 'Single', 'qwewqe', 'Edgardo Arong Siton', '2021-04-04', 3, 'qweqwe', 'qwewqeqweqwe', '2008-04-19', 'weqweqwe', 'Approved', 'Funeral', 'Online', '2024-10-28 05:08:22', '2024-10-28 05:08:01'),
(118, 1615, 130, NULL, 'vbnbvnvbn  vbnbvnbv', 'Oakland Newzealand            ', 'Male', 'qweqweqwe', 'Married', 'nvbnvbn', 'Edgardo Arong Siton', '2020-02-05', 4, 'vbnvbnvb', 'vbnbvn', '2008-02-18', 'nvbnvbn', 'Approved', 'Funeral', 'Online', '2024-10-30 06:28:42', '2024-10-29 12:38:41'),
(119, 1677, 180, NULL, 'ghjghj ghjgh ghjjh', 'jghj', 'Male', '', '', 'ghjg', 'hjhgj', '2021-03-04', 3, 'ghjhgjhgj', 'jgj', '2008-04-19', 'gjgj', 'Pending', 'Funeral', 'Walkin', '2024-10-31 03:15:19', '2024-10-31 03:15:19'),
(120, 1682, NULL, NULL, 'gfhfg  qwewqe', 'Oakland Newzealand            ', '', '', '', 'hgfhgfh', 'Edgardo Arong Siton', '2021-06-04', 3, 'qweqweqweqwe', 'gnh', '2009-02-17', 'nvbnbvn', 'Pending', 'Funeral', 'Online', '2024-10-31 03:19:00', '2024-10-31 03:19:00'),
(121, 1683, NULL, NULL, 'qeqwe  qweqweqe', 'Oakland Newzealand            ', 'Male', '', '', 'qeqeqweqe', 'Edgardo Arong Siton', '2019-07-04', 5, 'qwewqewqe', 'qweqwe', '2020-04-03', 'qwewqe', 'Pending', 'Funeral', 'Online', '2024-10-31 03:19:40', '2024-10-31 03:19:40');

-- --------------------------------------------------------

--
-- Table structure for table `donation`
--

CREATE TABLE `donation` (
  `donation_id` int(11) NOT NULL,
  `d_name` varchar(100) NOT NULL,
  `amount` decimal(10,2) DEFAULT NULL,
  `donated_on` date NOT NULL,
  `description` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `donation`
--

INSERT INTO `donation` (`donation_id`, `d_name`, `amount`, `donated_on`, `description`) VALUES
(1, 'SweetVeniceCasia', 500.00, '2024-11-01', 'HolyGirlfriend'),
(2, 'DarlaKaylaMayonoIpon', 300.00, '2024-05-25', 'Kinakusgan'),
(3, 'EdgardoSiton', 100.00, '2024-05-21', 'Walalang'),
(4, 'AeronVillafuerte', 500.00, '2024-05-25', 'But.an nga bata'),
(5, 'qweqwe', 833.00, '2024-11-08', '100'),
(6, 'qweqweqew', 833.33, '2024-11-15', 'qweqweqwe'),
(7, '', 0.00, '0000-00-00', ''),
(8, '', 0.00, '0000-00-00', ''),
(9, '', 0.00, '0000-00-00', ''),
(10, '', 0.00, '0000-00-00', ''),
(11, 'qwewqe', 833.33, '2024-11-02', 'sdfsdfsdf'),
(12, 'qweqwewqe', 100.00, '2024-11-20', 'dsdfsdf'),
(13, 'qweqew', 100.00, '2024-11-21', 'The word baptism comes from a Greek word (baptize), which means, “to immerse.” Baptism is a ceremony in which a Christian is immersed in water before the church to publically symbolize their belief in Christ. The water is a symbol of sin being washed away'),
(14, 'qweqew', 111.00, '2024-11-21', 'qweqwe'),
(15, 'qweqweqwe', 833.33, '2024-11-15', 'The word baptism comes from a Greek word (baptize), which means, “to immerse.” Baptism is a ceremony in which a Christian is immersed in water before the church to publically symbolize their belief in Christ. The water is a symbol of sin being washed away'),
(16, 'qweqew', 1666.67, '2024-11-01', 'The word baptism comes from a Greek word (baptize), which means, “to immerse.” Baptism is a ceremony in which a Christian is immersed in water before the church to publically symbolize their belief in Christ. The water is a symbol of sin being washed away'),
(17, 'qweqew', 1666.67, '2024-11-01', 'The word baptism comes from a Greek word (baptize), which means, “to immerse.” Baptism is a ceremony in which a Christian is immersed in water before the church to publically symbolize their belief in Christ. The water is a symbol of sin being washed away'),
(18, 'qweqew', 1666.67, '2024-11-20', 'The word baptism comes from a Greek word (baptize), which means, “to immerse.” Baptism is a ceremony in which a Christian is immersed in water before the church to publically symbolize their belief in Christ. The water is a symbol of sin being washed away'),
(19, 'qweqew', 1666.67, '2024-11-20', 'The word baptism comes from a Greek word (baptize), which means, “to immerse.” Baptism is a ceremony in which a Christian is immersed in water before the church to publically symbolize their belief in Christ. The water is a symbol of sin being washed away'),
(20, 'qweqew', 1666.67, '2024-11-20', 'The word baptism comes from a Greek word (baptize), which means, “to immerse.” Baptism is a ceremony in which a Christian is immersed in water before the church to publically symbolize their belief in Christ. The water is a symbol of sin being washed away'),
(21, 'qweqweqwe', 833.33, '2024-11-15', 'The word baptism comes from a Greek word (baptize), which means, “to immerse.” Baptism is a ceremony in which a Christian is immersed in water before the church to publically symbolize their belief in Christ. The water is a symbol of sin being washed away'),
(22, 'qweqweqwe', 833.33, '2024-11-15', 'The word baptism comes from a Greek word (baptize), which means, “to immerse.” Baptism is a ceremony in which a Christian is immersed in water before the church to publically symbolize their belief in Christ. The water is a symbol of sin being washed away'),
(23, 'qweqew', 833.33, '2024-11-20', 'The word baptism comes from a Greek word (baptize), which means, “to immerse.” Baptism is a ceremony in which a Christian is immersed in water before the church to publically symbolize their belief in Christ. The water is a symbol of sin being washed away'),
(24, 'qweqew', 833.33, '2024-11-20', 'The word baptism comes from a Greek word (baptize), which means, “to immerse.” Baptism is a ceremony in which a Christian is immersed in water before the church to publically symbolize their belief in Christ. The water is a symbol of sin being washed away'),
(25, 'qweqew', 833.33, '2024-11-20', 'The word baptism comes from a Greek word (baptize), which means, “to immerse.” Baptism is a ceremony in which a Christian is immersed in water before the church to publically symbolize their belief in Christ. The water is a symbol of sin being washed away'),
(26, 'qweqew', 833.33, '2024-11-21', 'The word baptism comes from a Greek word (baptize), which means, “to immerse.” Baptism is a ceremony in which a Christian is immersed in water before the church to publically symbolize their belief in Christ. The water is a symbol of sin being washed away'),
(27, 'qweqew', 833.33, '2024-11-21', 'The word baptism comes from a Greek word (baptize), which means, “to immerse.” Baptism is a ceremony in which a Christian is immersed in water before the church to publically symbolize their belief in Christ. The water is a symbol of sin being washed away'),
(28, 'qweqew', 833.33, '2024-11-21', 'The word baptism comes from a Greek word (baptize), which means, “to immerse.” Baptism is a ceremony in which a Christian is immersed in water before the church to publically symbolize their belief in Christ. The water is a symbol of sin being washed away'),
(29, 'qweqew', 833.33, '2024-11-21', 'The word baptism comes from a Greek word (baptize), which means, “to immerse.” Baptism is a ceremony in which a Christian is immersed in water before the church to publically symbolize their belief in Christ. The water is a symbol of sin being washed away'),
(30, 'qweqew', 833.33, '2024-11-21', 'The word baptism comes from a Greek word (baptize), which means, “to immerse.” Baptism is a ceremony in which a Christian is immersed in water before the church to publically symbolize their belief in Christ. The water is a symbol of sin being washed away'),
(31, 'qweqew', 833.33, '2024-11-21', 'The word baptism comes from a Greek word (baptize), which means, “to immerse.” Baptism is a ceremony in which a Christian is immersed in water before the church to publically symbolize their belief in Christ. The water is a symbol of sin being washed away'),
(32, 'qweqew', 833.33, '2024-11-21', 'The word baptism comes from a Greek word (baptize), which means, “to immerse.” Baptism is a ceremony in which a Christian is immersed in water before the church to publically symbolize their belief in Christ. The water is a symbol of sin being washed away'),
(33, 'qweqew', 833.33, '2024-11-21', 'The word baptism comes from a Greek word (baptize), which means, “to immerse.” Baptism is a ceremony in which a Christian is immersed in water before the church to publically symbolize their belief in Christ. The water is a symbol of sin being washed away'),
(34, 'qweqew', 833.33, '2024-11-21', 'The word baptism comes from a Greek word (baptize), which means, “to immerse.” Baptism is a ceremony in which a Christian is immersed in water before the church to publically symbolize their belief in Christ. The water is a symbol of sin being washed away'),
(35, 'qweqew', 833.33, '2024-11-21', 'The word baptism comes from a Greek word (baptize), which means, “to immerse.” Baptism is a ceremony in which a Christian is immersed in water before the church to publically symbolize their belief in Christ. The water is a symbol of sin being washed away'),
(36, 'qweqew', 833.33, '2024-11-21', 'The word baptism comes from a Greek word (baptize), which means, “to immerse.” Baptism is a ceremony in which a Christian is immersed in water before the church to publically symbolize their belief in Christ. The water is a symbol of sin being washed away'),
(37, 'qweqew', 833.33, '2024-11-21', 'The word baptism comes from a Greek word (baptize), which means, “to immerse.” Baptism is a ceremony in which a Christian is immersed in water before the church to publically symbolize their belief in Christ. The water is a symbol of sin being washed away'),
(38, 'qweqew', 833.33, '2024-11-21', 'The word baptism comes from a Greek word (baptize), which means, “to immerse.” Baptism is a ceremony in which a Christian is immersed in water before the church to publically symbolize their belief in Christ. The water is a symbol of sin being washed away'),
(39, 'qweqew', 833.33, '2024-11-21', 'The word baptism comes from a Greek word (baptize), which means, “to immerse.” Baptism is a ceremony in which a Christian is immersed in water before the church to publically symbolize their belief in Christ. The water is a symbol of sin being washed away'),
(40, 'qweqew', 833.33, '2024-11-21', 'The word baptism comes from a Greek word (baptize), which means, “to immerse.” Baptism is a ceremony in which a Christian is immersed in water before the church to publically symbolize their belief in Christ. The water is a symbol of sin being washed away'),
(41, 'qweqew', 833.33, '2024-11-21', 'The word baptism comes from a Greek word (baptize), which means, “to immerse.” Baptism is a ceremony in which a Christian is immersed in water before the church to publically symbolize their belief in Christ. The water is a symbol of sin being washed away'),
(42, 'qweqew', 833.33, '2024-11-21', 'The word baptism comes from a Greek word (baptize), which means, “to immerse.” Baptism is a ceremony in which a Christian is immersed in water before the church to publically symbolize their belief in Christ. The water is a symbol of sin being washed away'),
(43, 'qweqew', 833.33, '2024-11-21', 'The word baptism comes from a Greek word (baptize), which means, “to immerse.” Baptism is a ceremony in which a Christian is immersed in water before the church to publically symbolize their belief in Christ. The water is a symbol of sin being washed away'),
(44, 'qweqew', 833.33, '2024-11-21', 'The word baptism comes from a Greek word (baptize), which means, “to immerse.” Baptism is a ceremony in which a Christian is immersed in water before the church to publically symbolize their belief in Christ. The water is a symbol of sin being washed away'),
(45, 'qweqew', 833.33, '2024-11-12', 'The word baptism comes from a Greek word (baptize), which means, “to immerse.” Baptism is a ceremony in which a Christian is immersed in water before the church to publically symbolize their belief in Christ. The water is a symbol of sin being washed away'),
(46, 'qweqew', 833.33, '2024-11-12', 'The word baptism comes from a Greek word (baptize), which means, “to immerse.” Baptism is a ceremony in which a Christian is immersed in water before the church to publically symbolize their belief in Christ. The water is a symbol of sin being washed away'),
(47, 'qweqew', 833.33, '2024-11-12', 'The word baptism comes from a Greek word (baptize), which means, “to immerse.” Baptism is a ceremony in which a Christian is immersed in water before the church to publically symbolize their belief in Christ. The water is a symbol of sin being washed away'),
(48, 'qweqew', 833.33, '2024-11-12', 'The word baptism comes from a Greek word (baptize), which means, “to immerse.” Baptism is a ceremony in which a Christian is immersed in water before the church to publically symbolize their belief in Christ. The water is a symbol of sin being washed away'),
(49, 'qweqew', 833.33, '2024-11-12', 'The word baptism comes from a Greek word (baptize), which means, “to immerse.” Baptism is a ceremony in which a Christian is immersed in water before the church to publically symbolize their belief in Christ. The water is a symbol of sin being washed away'),
(50, 'qweqew', 833.33, '2024-11-12', 'The word baptism comes from a Greek word (baptize), which means, “to immerse.” Baptism is a ceremony in which a Christian is immersed in water before the church to publically symbolize their belief in Christ. The water is a symbol of sin being washed away'),
(51, 'qweqew', 833.33, '2024-11-12', 'The word baptism comes from a Greek word (baptize), which means, “to immerse.” Baptism is a ceremony in which a Christian is immersed in water before the church to publically symbolize their belief in Christ. The water is a symbol of sin being washed away'),
(52, 'qweqew', 833.33, '2024-11-12', 'The word baptism comes from a Greek word (baptize), which means, “to immerse.” Baptism is a ceremony in which a Christian is immersed in water before the church to publically symbolize their belief in Christ. The water is a symbol of sin being washed away'),
(53, 'qweqew', 833.33, '2024-11-12', 'The word baptism comes from a Greek word (baptize), which means, “to immerse.” Baptism is a ceremony in which a Christian is immersed in water before the church to publically symbolize their belief in Christ. The water is a symbol of sin being washed away'),
(54, 'qweqew', 833.33, '2024-11-12', 'The word baptism comes from a Greek word (baptize), which means, “to immerse.” Baptism is a ceremony in which a Christian is immersed in water before the church to publically symbolize their belief in Christ. The water is a symbol of sin being washed away'),
(55, 'qweqew', 833.33, '2024-11-12', 'The word baptism comes from a Greek word (baptize), which means, “to immerse.” Baptism is a ceremony in which a Christian is immersed in water before the church to publically symbolize their belief in Christ. The water is a symbol of sin being washed away'),
(56, 'qweqew', 833.33, '2024-11-12', 'The word baptism comes from a Greek word (baptize), which means, “to immerse.” Baptism is a ceremony in which a Christian is immersed in water before the church to publically symbolize their belief in Christ. The water is a symbol of sin being washed away'),
(57, 'qweqew', 833.33, '2024-11-09', 'The word baptism comes from a Greek word (baptize), which means, “to immerse.” Baptism is a ceremony in which a Christian is immersed in water before the church to publically symbolize their belief in Christ. The water is a symbol of sin being washed away'),
(58, 'qweqew', 833.33, '2024-11-09', 'The word baptism comes from a Greek word (baptize), which means, “to immerse.” Baptism is a ceremony in which a Christian is immersed in water before the church to publically symbolize their belief in Christ. The water is a symbol of sin being washed away'),
(59, 'qweqew', 833.33, '2024-11-09', 'The word baptism comes from a Greek word (baptize), which means, “to immerse.” Baptism is a ceremony in which a Christian is immersed in water before the church to publically symbolize their belief in Christ. The water is a symbol of sin being washed away'),
(60, 'qweqew', 833.33, '2024-11-22', 'The word baptism comes from a Greek word (baptize), which means, “to immerse.” Baptism is a ceremony in which a Christian is immersed in water before the church to publically symbolize their belief in Christ. The water is a symbol of sin being washed away'),
(61, 'qweqew', 833.33, '2024-11-22', 'The word baptism comes from a Greek word (baptize), which means, “to immerse.” Baptism is a ceremony in which a Christian is immersed in water before the church to publically symbolize their belief in Christ. The water is a symbol of sin being washed away'),
(62, 'qweqew', 833.33, '2024-11-07', 'The word baptism comes from a Greek word (baptize), which means, “to immerse.” Baptism is a ceremony in which a Christian is immersed in water before the church to publically symbolize their belief in Christ. The water is a symbol of sin being washed away'),
(63, 'qweqew', 833.33, '2024-11-07', 'The word baptism comes from a Greek word (baptize), which means, “to immerse.” Baptism is a ceremony in which a Christian is immersed in water before the church to publically symbolize their belief in Christ. The water is a symbol of sin being washed away'),
(64, 'qweqew', 833.33, '2024-11-13', 'The word baptism comes from a Greek word (baptize), which means, “to immerse.” Baptism is a ceremony in which a Christian is immersed in water before the church to publically symbolize their belief in Christ. The water is a symbol of sin being washed away'),
(65, 'qweqew', 833.33, '2024-11-13', 'The word baptism comes from a Greek word (baptize), which means, “to immerse.” Baptism is a ceremony in which a Christian is immersed in water before the church to publically symbolize their belief in Christ. The water is a symbol of sin being washed away'),
(66, 'qweqew', 833.33, '2024-11-13', 'The word baptism comes from a Greek word (baptize), which means, “to immerse.” Baptism is a ceremony in which a Christian is immersed in water before the church to publically symbolize their belief in Christ. The water is a symbol of sin being washed away'),
(67, 'qweqew', 833.33, '2024-11-14', 'The word baptism comes from a Greek word (baptize), which means, “to immerse.” Baptism is a ceremony in which a Christian is immersed in water before the church to publically symbolize their belief in Christ. The water is a symbol of sin being washed away'),
(68, 'qweqew', 833.33, '2024-11-11', 'The word baptism comes from a Greek word (baptize), which means, “to immerse.” Baptism is a ceremony in which a Christian is immersed in water before the church to publically symbolize their belief in Christ. The water is a symbol of sin being washed away'),
(69, 'qweqew', 833.33, '2024-11-15', 'The word baptism comes from a Greek word (baptize), which means, “to immerse.” Baptism is a ceremony in which a Christian is immersed in water before the church to publically symbolize their belief in Christ. The water is a symbol of sin being washed away'),
(70, 'qweqew', 833.33, '2024-11-15', 'The word baptism comes from a Greek word (baptize), which means, “to immerse.” Baptism is a ceremony in which a Christian is immersed in water before the church to publically symbolize their belief in Christ. The water is a symbol of sin being washed away'),
(71, 'qweqew', 833.33, '2024-11-21', 'The word baptism comes from a Greek word (baptize), which means, “to immerse.” Baptism is a ceremony in which a Christian is immersed in water before the church to publically symbolize their belief in Christ. The water is a symbol of sin being washed away'),
(72, 'qweqew', 833.33, '2024-11-13', 'The word baptism comes from a Greek word (baptize), which means, “to immerse.” Baptism is a ceremony in which a Christian is immersed in water before the church to publically symbolize their belief in Christ. The water is a symbol of sin being washed away'),
(73, 'qweqew', 833.33, '2024-11-13', 'The word baptism comes from a Greek word (baptize), which means, “to immerse.” Baptism is a ceremony in which a Christian is immersed in water before the church to publically symbolize their belief in Christ. The water is a symbol of sin being washed away'),
(74, 'qweqew', 833.33, '2024-11-13', 'The word baptism comes from a Greek word (baptize), which means, “to immerse.” Baptism is a ceremony in which a Christian is immersed in water before the church to publically symbolize their belief in Christ. The water is a symbol of sin being washed away'),
(75, 'qweqew', 833.33, '2024-11-14', 'The word baptism comes from a Greek word (baptize), which means, “to immerse.” Baptism is a ceremony in which a Christian is immersed in water before the church to publically symbolize their belief in Christ. The water is a symbol of sin being washed away');

-- --------------------------------------------------------

--
-- Table structure for table `event_calendar`
--

CREATE TABLE `event_calendar` (
  `calendar_id` int(11) NOT NULL,
  `cal_fullname` varchar(50) NOT NULL,
  `cal_Category` varchar(50) NOT NULL,
  `cal_description` text NOT NULL,
  `cal_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `event_calendar`
--

INSERT INTO `event_calendar` (`calendar_id`, `cal_fullname`, `cal_Category`, `cal_description`, `cal_date`) VALUES
(77, 'St michael the archangel', 'Saints', 'St. Michael the Archangel, also known as Saint Michael the Archangel or simply Archangel Michael, holds a significant place in the Roman Catholic tradition. He is an Archangel, associated with courage, protection, and divine intervention.', '2024-09-29'),
(79, 'qweqweqwe', 'qweqwe', 'qweqweqwe', '2024-10-25');

-- --------------------------------------------------------

--
-- Table structure for table `financial`
--

CREATE TABLE `financial` (
  `financial_id` int(11) NOT NULL,
  `appointment_id` int(11) NOT NULL,
  `Category` varchar(50) NOT NULL,
  `amount` decimal(15,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `marriagefill`
--

CREATE TABLE `marriagefill` (
  `marriagefill_id` int(11) NOT NULL,
  `schedule_id` int(11) DEFAULT NULL,
  `citizen_id` int(11) DEFAULT NULL,
  `announcement_id` int(11) DEFAULT NULL,
  `approval_id` int(11) DEFAULT NULL,
  `groom_name` varchar(50) NOT NULL,
  `groom_dob` date NOT NULL,
  `groom_age` int(11) NOT NULL,
  `groom_place_of_birth` varchar(255) NOT NULL,
  `groom_citizenship` varchar(255) NOT NULL,
  `groom_address` varchar(50) NOT NULL,
  `groom_religion` varchar(100) NOT NULL,
  `groom_previously_married` enum('Yes','No') NOT NULL,
  `bride_name` varchar(255) NOT NULL,
  `bride_dob` date NOT NULL,
  `bride_age` int(11) NOT NULL,
  `bride_place_of_birth` varchar(255) NOT NULL,
  `bride_citizenship` varchar(255) NOT NULL,
  `bride_address` varchar(255) NOT NULL,
  `bride_religion` varchar(100) NOT NULL,
  `bride_previously_married` enum('Yes','No') NOT NULL,
  `status` varchar(50) NOT NULL DEFAULT 'Pending',
  `event_name` varchar(50) NOT NULL DEFAULT 'Marriage',
  `role` varchar(50) NOT NULL DEFAULT 'Online',
  `m_created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `marriagefill`
--

INSERT INTO `marriagefill` (`marriagefill_id`, `schedule_id`, `citizen_id`, `announcement_id`, `approval_id`, `groom_name`, `groom_dob`, `groom_age`, `groom_place_of_birth`, `groom_citizenship`, `groom_address`, `groom_religion`, `groom_previously_married`, `bride_name`, `bride_dob`, `bride_age`, `bride_place_of_birth`, `bride_citizenship`, `bride_address`, `bride_religion`, `bride_previously_married`, `status`, `event_name`, `role`, `m_created_at`) VALUES
(173, 1398, NULL, NULL, 13, 'Edgardo Arong Siton', '2021-03-02', 3, 'Oakland Newzealcvxcvxvcxand            ', 'xcvxcv', 'xcvxcv', 'qewqweqwe', 'No', 'Edgardo Arong Siton', '2007-04-19', 17, 'Oakland Newzxcvxcvealand            ', 'xcvxcv', 'xcvxcv', 'xcvxcv', 'No', 'Approved', 'Wedding', 'Online', '2024-10-20 07:02:46'),
(181, 1492, NULL, NULL, 61, 'Edgardo Butalid Siton', '1963-09-17', 61, 'Santa Rosa Olango Island', 'Pilipino', 'Santa Rosa Olango Island', 'Catholic', 'No', 'Alicia Suson Arong', '1963-08-21', 61, 'Sition Manga SanRoque Mambaling', 'Pilipino', 'Sition Manga SanRoque Mambaling', 'Catholic', 'No', 'Approved', 'Wedding', 'Online', '2024-10-22 07:25:30'),
(183, 1506, NULL, NULL, NULL, 'Edgardo Arongq Siton', '2008-04-18', 16, 'Oakland Newzealand            ', 'qweqweqw', 'eqweqwe', 'qweqweqwe', 'No', 'wakwaka waka waka', '2020-04-04', 4, 'Oakland Nqweqweqweewzealand            ', 'qweqwe', 'qweqweqwe', 'qwe', 'No', 'Approved', 'Wedding', 'Online', '2024-10-23 06:13:02'),
(184, 1535, NULL, NULL, 74, 'vbnbv bnvbnbvn vbnvbnvbn', '2021-03-05', 3, 'vbnbvn', 'vbnvbn', 'vbnbvn', 'bvnbvn', 'No', 'vbnbvn vbnvbn vbnvbnvbn', '2008-04-18', 16, 'vbnvbnbvn', 'vbnvbn', 'vbn', 'nbvvbnvbn', 'No', 'Approved', 'Wedding', 'Online', '2024-10-27 03:30:53'),
(185, 1563, NULL, NULL, 102, 'edgardo qweqwe siton', '2019-03-05', 5, 'qweqe', 'wqewqeqew', 'lower\r\nsaddsad', 'Catholic', 'No', '0', '2020-04-06', 4, 'ewqeqw', 'qweqw', 'eqweqw', 'qwewq', 'No', 'Approved', 'Wedding', 'Walkin', '2024-10-27 15:14:34'),
(186, 1565, NULL, NULL, 103, 'edgardo qweqwe siton', '2019-03-05', 5, 'qweqe', 'wqewqeqew', 'lower\r\nsaddsad', 'Catholic', 'No', '0', '2020-04-06', 4, 'ewqeqw', 'qweqw', 'eqweqw', 'qwewq', 'No', 'Approved', 'Wedding', 'Walkin', '2024-10-27 05:31:24'),
(187, 1567, NULL, NULL, 104, 'edgardo qweqwe siton', '2019-03-05', 5, 'qweqe', 'wqewqeqew', 'lower\r\nsaddsad', 'Catholic', 'No', '0', '2020-04-06', 4, 'ewqeqw', 'qweqw', 'eqweqw', 'qwewq', 'No', 'Approved', 'Wedding', 'Walkin', '2024-10-27 15:14:41'),
(188, 1573, NULL, NULL, 107, 'cvbvcb cvbcvb cvbcvbb', '2008-11-17', 15, 'cvbcvb', 'cvbvcb', 'cvbvcb', 'cvbcvb', 'No', '0', '2007-12-18', 16, 'qwe', 'qweqeqwe', 'qwe', 'qweqweqwe', 'Yes', 'Approved', 'Wedding', 'Walkin', '2024-10-27 04:49:37'),
(189, 1575, NULL, NULL, 108, 'Edgardo Arong Siton', '2019-03-04', 5, 'cvbcvb', 'cvbcvbbc', 'Oakland Newzealand           bcvbcv ', 'cvb', 'No', 'cvbcvbvcb bcvbcvb cvbcvbcvbcvbcv', '2020-04-05', 4, 'cvbcv', 'bvcbcvb', 'cvbcb', 'cvbcvb', 'No', 'Approved', 'Wedding', 'Online', '2024-10-27 04:52:56'),
(191, 1581, NULL, NULL, 111, 'wqewqeew qwe wqewqe', '2007-05-18', 17, 'qweqe', 'qewqe', 'ddsfsf', 'dsfdsf', 'No', '0', '2019-04-05', 5, 'qweqwe', 'wqewqe', 'qwewq', 'qwewqe', 'No', 'Approved', 'Wedding', 'Walkin', '2024-10-27 05:34:28'),
(198, 1614, NULL, NULL, 131, 'Edgardo Arong Siton', '2021-04-05', 3, 'dfgfdg', 'gdfgdfg', 'Oakland Newzealand            ', 'dfgdfgd', 'No', 'dfgfdg gdfg dfgfdgfd', '2008-11-17', 15, 'dfgdfgdf', 'gfdgfdgfdg', 'dffgfdgfd', 'dfgfdfgd', 'No', 'Pending', 'Wedding', 'Online', '2024-10-29 15:22:00'),
(199, 1625, NULL, NULL, 134, 'Edgardo Arong Siton', '2020-05-04', 4, 'qweqweqe', 'qweqwe', 'Oakland Newzealand            ', 'qweqwe', 'No', 'qwewqe qweqwe qweqwe', '2020-03-04', 4, 'qweqweqwe', 'qweqwe', 'qweqwe', 'qweqwe', 'No', 'Pending', 'Wedding', 'Online', '2024-10-29 15:41:14'),
(200, 1679, NULL, NULL, NULL, 'Edgardo Arong Siton', '2019-05-03', 5, 'qweqweqwe', 'qweqweqwe', 'Oakland Newzealand            ', 'xcvcxvcvx', 'No', 'qweqwe qweqweqew qweqwe', '2021-05-06', 3, 'qweqwe', 'xcxc', 'xcvcxv', 'xcvxcv', 'Yes', 'Pending', 'Wedding', 'Online', '2024-10-31 03:17:23'),
(201, 1681, NULL, NULL, NULL, 'Edgardo Arong Siton', '2019-02-05', 5, 'bvnvbnvb', 'vbnbvn', 'Oakland Newzealand            ', 'vbnbvn', 'No', 'vbnbvn vbnbvn bvnbvnvbn', '2019-05-05', 5, 'vbnbvn', 'vbnvbnvbn', 'vbnbvnvbn', 'vbnbvnvbn', 'No', 'Pending', 'Wedding', 'Online', '2024-10-31 03:18:29');

-- --------------------------------------------------------

--
-- Table structure for table `mass_schedule`
--

CREATE TABLE `mass_schedule` (
  `mass_id` int(11) NOT NULL,
  `schedule_id` int(11) DEFAULT NULL,
  `approval_id` int(11) DEFAULT NULL,
  `mass_title` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `mass_schedule`
--

INSERT INTO `mass_schedule` (`mass_id`, `schedule_id`, `approval_id`, `mass_title`) VALUES
(1, 1536, 82, 'Mass'),
(2, 1537, 83, 'Mass'),
(3, 1538, 84, 'Mass'),
(4, 1539, 85, 'Mass'),
(5, 1540, 86, 'Mass'),
(6, 1541, 87, 'Mass'),
(7, 1542, 88, 'Mass'),
(8, 1543, 89, 'Mass'),
(9, 1546, 91, 'Mass'),
(10, 1547, 92, 'Mass'),
(11, 1548, 93, 'Mass'),
(12, 1549, 94, 'Mass'),
(13, 1550, 95, 'Mass'),
(14, 1551, 96, 'Mass'),
(15, 1552, 97, 'Mass'),
(16, 1553, 98, 'Mass'),
(17, 1623, 132, 'Mass'),
(18, 1624, 133, 'Mass'),
(19, 1628, 137, 'Mass'),
(20, 1629, 138, 'Mass'),
(21, 1630, 139, 'Mass'),
(22, 1631, 140, 'Mass'),
(23, 1632, 141, 'Mass'),
(24, 1633, 142, 'Mass'),
(25, 1634, 143, 'Mass'),
(26, 1635, 144, 'Mass'),
(27, 1636, 145, 'Mass'),
(28, 1637, 146, 'Mass'),
(29, 1638, 147, 'Mass'),
(30, 1639, 148, 'Mass'),
(31, 1640, 149, 'Mass'),
(32, 1641, 150, 'Mass'),
(33, 1642, 151, 'Mass'),
(34, 1643, 152, 'Mass'),
(35, 1644, 153, 'Mass'),
(36, 1645, 154, 'Mass'),
(37, 1646, 155, 'Mass'),
(38, 1647, 156, 'Mass'),
(39, 1648, 157, 'Mass'),
(40, 1649, 158, 'Mass'),
(41, 1650, 159, 'Mass'),
(42, 1651, 160, 'Mass'),
(43, 1667, 170, 'Mass'),
(44, 1672, 176, 'Mass'),
(45, 1673, 177, 'Mass');

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` int(11) NOT NULL,
  `type` varchar(50) DEFAULT NULL,
  `message` text DEFAULT NULL,
  `time` timestamp NOT NULL DEFAULT current_timestamp(),
  `status` enum('unread','read') DEFAULT 'unread'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `notifications`
--

INSERT INTO `notifications` (`id`, `type`, `message`, `time`, `status`) VALUES
(1, 'user_registration', 'New user registered: chanchan', '2024-08-06 12:37:37', 'read'),
(2, 'user_registration', 'New user registered: Sweetie Siton', '2024-08-06 12:56:22', 'unread'),
(3, 'user_registration', 'New user registered: Eddi', '2024-08-06 13:26:37', 'unread'),
(4, 'user_registration', 'New user registered: janet', '2024-08-14 02:11:11', 'unread'),
(5, 'user_registration', 'New user registered: ReymartBelarma@gmail.com', '2024-08-14 02:14:21', 'unread'),
(6, 'user_registration', 'New user registered: ZielcarBelarma', '2024-08-14 02:17:30', 'unread'),
(7, 'user_registration', 'New user registered: qweqwe', '2024-08-14 02:19:49', 'unread'),
(8, 'user_registration', 'New user registered: Alice Arong Siton', '2024-08-26 05:16:14', 'unread'),
(9, 'user_registration', 'New user registered: ', '2024-08-26 05:23:05', 'unread'),
(10, 'user_registration', 'New user registered: ', '2024-08-26 05:46:09', 'unread'),
(11, 'user_registration', 'New user registered: ', '2024-08-26 05:47:13', 'unread'),
(12, 'user_registration', 'New user registered: ', '2024-08-26 05:47:53', 'unread'),
(13, 'user_registration', 'New user registered: ', '2024-08-26 05:48:02', 'unread'),
(14, 'user_registration', 'New user registered: Janet Siton Toledo', '2024-08-26 05:53:12', 'unread'),
(15, 'user_registration', 'New user registered: Grant Toledo Siton', '2024-08-26 05:57:11', 'unread'),
(16, 'user_registration', 'Jacky Arong Siton', '2024-08-26 06:02:31', 'unread'),
(17, 'user_registration', 'asdasd Siton admin', '2024-08-26 06:05:34', 'unread'),
(18, 'user_registration', 'admin Siton admin', '2024-08-26 06:08:04', 'unread'),
(19, 'user_registration', 'Melita Suson Camposano', '2024-08-26 06:28:34', 'unread'),
(20, 'user_registration', 'edik Arong edik', '2024-09-10 03:56:02', 'unread'),
(21, 'user_registration', 'qwe qweqwe qweqwe', '2024-09-10 03:58:48', 'unread'),
(22, 'user_registration', 'sweet qweqweqwe qweqwe', '2024-09-10 04:49:36', 'unread'),
(23, 'user_registration', 'Daniel  Arong', '2024-09-12 06:15:47', 'unread'),
(24, 'user_registration', 'Dummy Satsat Mong', '2024-09-30 03:42:14', 'unread'),
(25, 'user_registration', 'Benjie Arong Sagarino', '2024-09-30 03:51:38', 'unread'),
(26, 'user_registration', 'edgardo Arong siton', '2024-10-05 05:19:50', 'unread'),
(27, 'user_registration', 'Christian Tamosa Uy', '2024-10-16 02:54:13', 'unread'),
(28, 'user_registration', 'edgardo qweqwe siton', '2024-10-20 06:10:48', 'unread'),
(29, 'user_registration', 'edgardo Arong siton', '2024-10-20 06:26:53', 'unread'),
(30, 'user_registration', 'Julio Baltazar Balagtas', '2024-10-20 06:31:32', 'unread'),
(31, 'user_registration', '', '2024-10-20 06:49:56', 'unread'),
(32, 'user_registration', '', '2024-10-20 06:50:09', 'unread'),
(33, 'user_registration', 'Reymart  Belarma', '2024-10-20 06:56:18', 'unread'),
(34, 'user_registration', 'Reymart  Belarma', '2024-10-20 06:59:32', 'unread'),
(35, 'user_registration', 'edgardo  siton', '2024-10-20 06:59:58', 'unread'),
(36, 'user_registration', 'qweqwe qw qweqweqwe', '2024-10-20 07:04:59', 'unread'),
(37, 'user_registration', 'edgardo xcvxcv siton', '2024-10-20 07:05:59', 'unread'),
(38, 'user_registration', 'xcvxcvxcv vbnvbn xcvxcv', '2024-10-20 07:09:20', 'unread'),
(39, 'user_registration', 'nbmnbmbnm nm,nm, mn,n,', '2024-10-20 07:11:10', 'unread'),
(40, 'user_registration', 'edgardo Arong siton', '2024-10-21 11:59:31', 'unread'),
(41, 'user_registration', 'qweqweqweq  qwe', '2024-10-22 10:54:26', 'unread'),
(42, 'user_registration', 'edgardo  siton', '2024-10-22 11:18:38', 'unread'),
(43, 'user_registration', 'edgardo qweqwe siton', '2024-10-22 11:21:15', 'unread'),
(44, 'user_registration', 'edgardo  siton', '2024-10-22 11:24:02', 'unread'),
(45, 'user_registration', 'bbbbbbbb bbbbbb bbbbbbbbbbbbbbbbb', '2024-10-27 06:52:18', 'unread'),
(46, 'user_registration', 'qwewqeq wqewqewqe qwe', '2024-10-27 06:55:41', 'unread'),
(47, 'user_registration', 'edgardo qweqwe siton', '2024-10-27 07:01:09', 'unread'),
(48, 'user_registration', 'edgardo qweqwe siton', '2024-10-31 10:12:37', 'unread');

-- --------------------------------------------------------

--
-- Table structure for table `priest_approval`
--

CREATE TABLE `priest_approval` (
  `approval_id` int(11) NOT NULL,
  `priest_id` int(11) DEFAULT NULL,
  `pr_status` varchar(100) NOT NULL,
  `pr_reason` text NOT NULL,
  `assigned_time` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `priest_approval`
--

INSERT INTO `priest_approval` (`approval_id`, `priest_id`, `pr_status`, `pr_reason`, `assigned_time`) VALUES
(7, 23, 'Approved', 'Sickgihilantangipamaolan', '2024-10-19 04:40:32'),
(10, 14, 'Approved', 'Sickgihilantangipamaolan', '2024-10-19 05:30:09'),
(11, NULL, '', 'Sickgihilantangipamaolan', '2024-10-20 07:12:18'),
(12, 23, 'Approved', 'Sickgihilantangipamaolan', '2024-10-20 09:39:15'),
(13, 23, 'Approved', '', '2024-10-19 11:24:32'),
(18, 14, 'Approved', '', '2024-10-19 12:25:13'),
(19, NULL, '', '', '2024-10-21 04:38:35'),
(20, 23, 'Approved', 'Sickgihilantangipamaolan', '2024-10-20 10:15:46'),
(21, 14, 'Approved', 'Gipamaolanko', '2024-10-20 09:30:25'),
(22, NULL, '', '', '2024-10-19 12:35:40'),
(23, NULL, '', '', '2024-10-19 12:36:56'),
(24, NULL, '', '', '2024-10-19 12:37:17'),
(25, NULL, '', '', '2024-10-19 12:37:40'),
(26, NULL, '', '', '2024-10-27 06:02:29'),
(27, NULL, '', '', '2024-10-19 12:42:44'),
(28, NULL, '', '', '2024-10-19 12:46:04'),
(29, NULL, '', '', '2024-10-19 13:23:48'),
(30, NULL, '', '', '2024-10-19 12:49:17'),
(31, NULL, '', '', '2024-10-19 12:51:10'),
(32, NULL, '', '', '2024-10-19 12:56:42'),
(33, NULL, '', '', '2024-10-19 12:57:58'),
(34, NULL, '', '', '2024-10-19 13:13:03'),
(35, NULL, '', '', '2024-10-19 13:14:15'),
(36, 23, 'Approved', '', '2024-10-19 13:15:37'),
(37, 14, 'Approved', '', '2024-10-19 13:33:52'),
(38, 14, 'Approved', '', '2024-10-19 13:34:32'),
(39, 14, 'Approved', '', '2024-10-19 13:37:06'),
(40, 14, 'Approved', '', '2024-10-19 13:38:23'),
(41, NULL, '', '', '2024-10-20 04:47:26'),
(42, NULL, '', '', '2024-10-20 07:04:23'),
(43, 14, 'Approved', '', '2024-10-20 08:14:09'),
(45, 49, 'Approved', '', '2024-10-20 08:36:16'),
(46, 14, 'Approved', '', '2024-10-20 08:50:49'),
(47, 23, 'Approved', '', '2024-10-20 09:06:24'),
(48, 14, 'Approved', '', '2024-10-20 09:10:54'),
(49, 14, 'Approved', '', '2024-10-20 09:16:18'),
(50, NULL, '', '', '2024-10-20 09:29:07'),
(51, NULL, '', '', '2024-10-20 09:29:12'),
(52, NULL, '', '', '2024-10-20 09:29:30'),
(53, NULL, '', '', '2024-10-20 09:29:32'),
(54, 14, 'Approved', '', '2024-10-21 04:36:36'),
(55, 14, 'Approved', '', '2024-10-21 05:09:09'),
(56, NULL, '', '', '2024-10-21 05:53:34'),
(57, NULL, '', '', '2024-10-21 06:03:00'),
(58, NULL, '', '', '2024-10-21 06:04:04'),
(59, NULL, '', '', '2024-10-22 04:17:00'),
(60, NULL, '', '', '2024-10-22 04:26:53'),
(61, 14, 'Approved', '', '2024-10-22 07:23:52'),
(62, NULL, '', '', '2024-10-22 08:34:31'),
(63, 23, 'Approved', '', '2024-10-22 08:40:10'),
(64, NULL, '', '', '2024-10-22 09:00:41'),
(65, NULL, '', '', '2024-10-22 09:04:58'),
(66, NULL, '', '', '2024-10-22 09:06:24'),
(67, NULL, '', '', '2024-10-22 13:20:15'),
(68, NULL, '', '', '2024-10-22 13:25:20'),
(69, NULL, '', '', '2024-10-23 04:23:13'),
(70, NULL, '', '', '2024-10-23 04:23:19'),
(71, 23, 'Approved', 'Gipamaolanko', '2024-10-27 02:39:35'),
(72, NULL, '', '', '2024-10-23 04:26:09'),
(73, NULL, '', '', '2024-10-24 07:00:20'),
(74, NULL, '', 'GIkalibanga', '2024-10-24 11:26:33'),
(75, NULL, '', '', '2024-10-23 04:35:13'),
(76, NULL, '', '', '2024-10-23 04:37:46'),
(77, NULL, '', '', '2024-10-23 04:37:49'),
(78, NULL, '', '', '2024-10-23 04:37:52'),
(79, NULL, '', '', '2024-10-23 04:39:05'),
(80, NULL, '', '', '2024-10-23 04:39:13'),
(81, NULL, '', '', '2024-10-23 04:45:24'),
(82, 14, 'Approved', '', '2024-10-24 07:33:21'),
(83, 23, 'Approved', '', '2024-10-24 07:34:07'),
(84, 23, 'Approved', '', '2024-10-24 07:34:30'),
(85, 14, 'Approved', '', '2024-10-24 07:39:53'),
(86, 14, 'Approved', '', '2024-10-24 07:40:07'),
(87, 14, 'Approved', '', '2024-10-24 07:40:54'),
(88, 14, 'Approved', '', '2024-10-24 07:44:40'),
(89, 14, 'Approved', '', '2024-10-24 07:59:03'),
(90, NULL, '', '', '2024-10-27 05:24:59'),
(91, 14, 'Approved', '', '2024-10-24 11:34:12'),
(92, 14, 'Approved', '', '2024-10-24 11:35:44'),
(93, 14, 'Approved', '', '2024-10-24 11:38:45'),
(94, 14, 'Approved', '', '2024-10-24 11:53:03'),
(95, 14, 'Approved', '', '2024-10-24 11:57:03'),
(96, 23, 'Approved', '', '2024-10-24 11:59:19'),
(97, 23, 'Approved', '', '2024-10-24 12:01:43'),
(98, 14, 'Approved', '', '2024-10-24 12:02:25'),
(99, NULL, '', '', '2024-10-27 02:49:26'),
(100, NULL, '', 'Gipamaolanko', '2024-10-27 03:03:06'),
(101, NULL, '', '', '2024-10-27 03:47:05'),
(102, NULL, '', '', '2024-10-27 03:49:20'),
(103, NULL, '', '', '2024-10-27 03:52:38'),
(104, NULL, '', '', '2024-10-27 03:52:50'),
(105, NULL, '', '', '2024-10-27 03:54:47'),
(106, 14, 'Approved', '', '2024-10-27 04:00:59'),
(107, NULL, '', '', '2024-10-27 04:49:28'),
(108, NULL, '', '', '2024-10-27 04:52:39'),
(109, NULL, '', '', '2024-10-27 05:27:16'),
(110, NULL, '', '', '2024-10-27 05:32:18'),
(111, 23, 'Declined', 'GIkalibanga', '2024-10-27 05:33:14'),
(112, NULL, '', '', '2024-10-27 05:46:37'),
(113, NULL, '', '', '2024-10-27 05:57:15'),
(114, 23, 'Approved', '', '2024-10-27 06:05:49'),
(115, 23, 'Approved', '', '2024-10-27 06:19:05'),
(116, NULL, '', '', '2024-10-28 04:52:34'),
(117, NULL, '', '', '2024-10-28 05:06:32'),
(118, NULL, '', '', '2024-10-28 05:08:15'),
(119, NULL, '', '', '2024-10-28 05:11:34'),
(120, NULL, '', '', '2024-10-28 13:28:05'),
(121, 23, 'Approved', '', '2024-10-29 14:12:54'),
(122, NULL, '', '', '2024-10-30 06:49:42'),
(123, NULL, '', '', '2024-10-30 06:11:35'),
(124, 23, 'Approved', '', '2024-10-29 13:01:24'),
(125, 23, 'Approved', '', '2024-10-29 13:14:36'),
(126, 23, 'Approved', '', '2024-10-29 14:14:13'),
(127, 23, 'Approved', '', '2024-10-29 14:31:13'),
(128, NULL, '', 'Gipamaolanko', '2024-10-30 04:14:30'),
(129, 23, 'Declined', 'Gipamaolanko', '2024-10-29 15:01:08'),
(130, 23, 'Approved', '', '2024-10-29 15:10:03'),
(131, 23, 'Pending', 'Gipamaolanko', '2024-11-01 14:16:29'),
(132, 23, 'Approved', '', '2024-10-29 15:32:45'),
(133, 23, 'Approved', '', '2024-10-29 15:33:23'),
(134, NULL, '', 'Gipamaolanko', '2024-10-30 06:37:20'),
(135, 23, 'Approved', '', '2024-10-29 15:48:28'),
(136, 23, 'Declined', 'GIkalibanga', '2024-10-30 04:25:12'),
(137, 23, 'Approved', '', '2024-10-30 05:07:51'),
(138, 49, 'Approved', '', '2024-10-30 05:08:33'),
(139, 23, 'Approved', '', '2024-10-30 05:10:24'),
(140, 23, 'Approved', '', '2024-10-30 05:10:25'),
(141, 23, 'Approved', '', '2024-10-30 05:10:29'),
(142, 23, 'Approved', '', '2024-10-30 05:11:38'),
(143, 49, 'Approved', '', '2024-10-30 05:18:30'),
(144, 49, 'Approved', '', '2024-10-30 05:18:31'),
(145, 49, 'Approved', '', '2024-10-30 05:18:31'),
(146, 49, 'Approved', '', '2024-10-30 05:18:32'),
(147, 49, 'Approved', '', '2024-10-30 05:18:32'),
(148, 49, 'Approved', '', '2024-10-30 05:18:32'),
(149, 49, 'Approved', '', '2024-10-30 05:18:32'),
(150, 49, 'Approved', '', '2024-10-30 05:20:37'),
(151, 50, 'Approved', '', '2024-10-30 05:21:42'),
(152, 53, 'Approved', '', '2024-10-30 05:22:38'),
(153, 50, 'Approved', '', '2024-10-30 05:24:11'),
(154, 23, 'Approved', '', '2024-10-30 05:25:23'),
(155, 23, 'Approved', '', '2024-10-30 05:27:22'),
(156, 23, 'Approved', '', '2024-10-30 05:28:06'),
(157, 23, 'Approved', '', '2024-10-30 05:28:42'),
(158, 23, 'Approved', '', '2024-10-30 05:29:31'),
(159, 53, 'Approved', '', '2024-10-30 05:31:03'),
(160, 50, 'Approved', '', '2024-10-30 05:49:58'),
(161, NULL, '', '', '2024-10-30 05:52:14'),
(162, NULL, '', '', '2024-10-30 05:55:25'),
(163, NULL, '', '', '2024-10-30 05:56:00'),
(164, NULL, '', '', '2024-10-30 05:56:47'),
(165, NULL, '', '', '2024-10-30 06:04:57'),
(166, NULL, '', '', '2024-10-30 06:05:47'),
(167, NULL, '', '', '2024-10-30 06:06:10'),
(168, NULL, '', '', '2024-10-30 06:30:40'),
(169, NULL, '', '', '2024-10-30 06:33:57'),
(170, 23, 'Approved', '', '2024-10-30 06:37:06'),
(171, 49, 'Pending', 'qweqwe', '2024-11-01 14:16:57'),
(172, NULL, '', '', '2024-10-30 06:48:37'),
(173, NULL, '', '', '2024-10-30 06:51:26'),
(174, NULL, '', '', '2024-10-31 03:08:59'),
(175, NULL, '', '', '2024-10-31 03:11:29'),
(176, 23, 'Approved', '', '2024-10-31 03:11:44'),
(177, 49, 'Approved', '', '2024-10-31 03:13:14'),
(178, NULL, '', '', '2024-10-31 03:13:57'),
(179, NULL, '', '', '2024-10-31 03:14:42'),
(180, NULL, '', '', '2024-10-31 03:15:19'),
(181, NULL, '', '', '2024-10-31 03:15:54'),
(182, NULL, '', '', '2024-10-31 03:51:11'),
(183, NULL, '', '', '2024-10-31 04:05:56'),
(184, NULL, '', '', '2024-10-31 04:06:13'),
(185, NULL, '', '', '2024-10-31 04:06:22'),
(186, NULL, '', '', '2024-10-31 04:09:11'),
(187, NULL, '', '', '2024-10-31 04:12:55'),
(188, NULL, '', '', '2024-10-31 04:13:45'),
(189, NULL, '', '', '2024-10-31 04:14:03'),
(190, NULL, '', '', '2024-10-31 04:14:20'),
(191, NULL, '', '', '2024-10-31 04:14:42'),
(192, NULL, '', '', '2024-10-31 04:15:59'),
(193, NULL, '', '', '2024-10-31 04:25:45'),
(194, NULL, '', '', '2024-10-31 04:42:00'),
(195, 23, 'Approved', '', '2024-10-31 05:09:24'),
(196, 23, 'Approved', '', '2024-10-31 05:11:39'),
(200, 23, 'Approved', '', '2024-10-31 05:15:08'),
(204, 23, 'Approved', '', '2024-10-31 06:42:10'),
(205, 23, 'Approved', '', '2024-10-31 09:14:40'),
(206, 23, 'Approved', '', '2024-10-31 09:24:40');

-- --------------------------------------------------------

--
-- Table structure for table `req_form`
--

CREATE TABLE `req_form` (
  `req_id` int(11) NOT NULL,
  `schedule_id` int(11) DEFAULT NULL,
  `approval_id` int(11) DEFAULT NULL,
  `req_name_pamisahan` varchar(255) DEFAULT NULL,
  `req_address` varchar(255) DEFAULT NULL,
  `req_category` varchar(255) DEFAULT NULL,
  `req_person` varchar(255) DEFAULT NULL,
  `req_pnumber` varchar(20) DEFAULT NULL,
  `cal_date` date NOT NULL,
  `req_chapel` varchar(100) NOT NULL,
  `status` varchar(15) NOT NULL,
  `role` varchar(15) NOT NULL,
  `event_location` varchar(20) DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `req_form`
--

INSERT INTO `req_form` (`req_id`, `schedule_id`, `approval_id`, `req_name_pamisahan`, `req_address`, `req_category`, `req_person`, `req_pnumber`, `cal_date`, `req_chapel`, `status`, `role`, `event_location`, `created_at`) VALUES
(54, 1431, 35, 'qweqw eqweqwe eqweqw', 'lower', '1st Friday Mass', 'edgardo qweqwe siton', '09394245345', '2024-10-23', 'qweqwe', 'Approved', 'Walkin', 'Outside', '2024-10-19 21:14:15'),
(55, 1474, 59, 'fghfgh hfghfgh fghfg', 'fghfghfgh', '1st Friday Mass', 'fghfgh fghfgh fghfgh', '09394366099', '2024-10-24', 'qweqwefghfgh', 'Approved', 'Walkin', 'Inside', '2024-10-22 12:17:00'),
(60, 1527, NULL, 'eqweqwe weqweqwe qweq', 'qweqw', 'Novena Mass', 'vcbcb qweqwe cvb', '09394366099', '2024-10-24', 'qweqwe', 'Approved', 'Online', 'Outside', '2024-10-22 21:28:41'),
(62, 1529, NULL, 'qweqw qweqweqwe eqwe', 'lower', 'Novena Mass', 'edgardo qweqwe siton', '09394366099', '2024-10-23', 'qweqwe', 'Approved', 'Online', 'Inside', '2024-10-22 21:48:40'),
(63, 1530, 113, 'qweeqw qweqwe qweqwe', 'eqweqwe', 'Monthly Mass', 'eqweqwe qweqwe qweqw', '09394245345', '2024-10-24', 'qweqwe', 'Approved', 'Online', 'Inside', '2024-10-22 22:05:55'),
(64, 1585, 114, 'qweqwe wqqweewe qwe', 'lower', 'Wake Mass', 'dsfsdf qweqwe sdfdsf', '09394366099', '2024-10-30', 'qweqwe', 'Approved', 'Walkin', 'Inside', '2024-10-27 14:05:49'),
(66, 1591, 135, 'fdgfdgfd dfgd fgfdg', 'dfgfdg', 'Monthly Mass', 'edgardo  siton', '09394245345', '2024-11-07', 'fdgfd', 'Pending', 'Online', 'Inside', '2024-10-27 16:12:24'),
(67, 1596, 172, 'wqeqweqw qweqwe eqweqwe', 'qwewqe', 'Monthly Mass', 'qweqweqw qweqweqwe eqweqwe', '09394245345', '2024-10-29', 'qweqweqwe', 'Pending', 'Online', 'Outside', '2024-10-27 16:17:33'),
(68, 1609, 122, 'qweqweqwe qweqwe qweqwe', 'lower', 'Fiesta Mass', 'qweqwe qweqweqwe qweqwe', '09394245345', '2024-10-30', 'qweqweqwe', 'Pending', 'Walkin', 'Inside', '2024-10-28 22:29:01'),
(69, 1610, 173, 'qweqw weqweqwe eqweq', 'qweqweqwe', 'Novena Mass', 'qweqwe qweq weqwe', '09394245345', '2024-10-30', 'qweqwe', 'Pending', 'Online', 'Inside', '2024-10-28 22:29:42'),
(70, 1616, NULL, 'asdasd as dasd', 'lower', 'Monthly Mass', 'edgardo  siton', '09394245345', '2024-10-31', 'qweqwe', 'Pending', 'Online', 'Inside', '2024-10-29 20:39:26'),
(71, 1617, NULL, 'qwewq qwewqewqe eqewqe', 'lower', 'Monthly Mass', 'edgardo  siton', '09394366099', '2024-10-30', 'qweqwe', 'Pending', 'Online', 'Outside', '2024-10-29 20:41:15'),
(72, 1652, 161, 'Egai Arong Siton', 'Tubod Crossing Minglanilla Cebu', 'Baccalaureate Mass', 'Sweet Tingal Casia', '09394245345', '2024-11-01', 'Sr. San Roque Chapel', 'Pending', 'Walkin', 'Inside', '2024-10-30 13:52:14'),
(73, 1653, 162, 'eqwe qweqwe qweqwe', 'qweqw', 'Wake Mass', 'qwewq qweqwe qweqwe', '09394245345', '2024-11-01', 'eqweqwe', 'Pending', 'Walkin', 'Inside', '2024-10-30 13:55:25'),
(74, 1654, 163, 'qw qweqweqwe eqweqwe', 'lower', 'Fiesta Mass', 'edgardo qweqwe siton', '09394245345', '2024-10-31', 'qweqwe', 'Pending', 'Walkin', 'Inside', '2024-10-30 13:56:00'),
(75, 1657, 165, 'qwe qweqweqwe qweqwe', 'lower', 'Fiesta Mass', 'edgardo qweqwe siton', '09394366099', '2024-10-31', 'qweqwe', 'Pending', 'Walkin', 'Inside', '2024-10-30 14:04:57'),
(76, 1658, 166, 'eqweqwe qweqweqwe qweqw', 'qweqweqwe', '1st Friday Mass', 'qwewq qweqw eqweqwe', '09394366099', '2024-11-01', 'eqweqwe', 'Approved', 'Walkin', 'Inside', '2024-10-30 14:05:47'),
(77, 1659, 167, 'qweqweewq qweqwewqe eqw', 'qwewqe', 'Wake Mass', 'qwewqe qweqwe qweqwe', '09394366099', '2024-11-02', 'qwewq', 'Approved', 'Walkin', 'Outside', '2024-10-30 14:06:10'),
(78, 1670, 174, 'eqwe qwewq eqwewq', 'lower', 'Novena Mass', 'qweqwe  qwewq', '09394366099', '2024-11-01', 'qwewqeqwe', 'Pending', 'Walkin', 'Inside', '2024-10-31 11:08:59'),
(79, 1671, 175, 'qweqwe qweqweqwe qwe', 'lower', 'Monthly Mass', 'edgardo qweqweqwe siton', '09394245345', '2024-10-29', 'qweqwe', 'Pending', 'Walkin', 'Outside', '2024-10-31 11:11:29'),
(80, 1678, 181, 'qweqwe weeqqweqwe qweq', 'qweqwe', '1st Friday Mass', 'qweqwe  qwe', '09394366099', '2024-10-25', 'qweqwe', 'Pending', 'Walkin', 'Outside', '2024-10-31 11:15:54'),
(81, 1684, 182, '', '', '', '', '', '0000-00-00', '', 'Pending', 'Walkin', 'Inside', '2024-10-31 11:51:11');

-- --------------------------------------------------------

--
-- Table structure for table `review_feedback`
--

CREATE TABLE `review_feedback` (
  `review_id` int(11) NOT NULL,
  `citizen_id` int(11) NOT NULL,
  `user_rating` int(11) NOT NULL,
  `user_review` text NOT NULL,
  `datetime` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `schedule`
--

CREATE TABLE `schedule` (
  `schedule_id` int(11) NOT NULL,
  `citizen_id` int(11) DEFAULT NULL,
  `date` date NOT NULL,
  `start_time` time NOT NULL,
  `end_time` time NOT NULL,
  `event_type` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `schedule`
--

INSERT INTO `schedule` (`schedule_id`, `citizen_id`, `date`, `start_time`, `end_time`, `event_type`) VALUES
(1389, NULL, '2024-11-11', '11:30:00', '12:30:00', NULL),
(1390, NULL, '2024-11-11', '11:30:00', '12:30:00', NULL),
(1391, NULL, '2024-10-18', '09:00:00', '11:00:00', 'Seminar'),
(1393, 4, '2024-11-24', '13:30:00', '14:30:00', 'Appointment'),
(1394, 4, '2024-11-24', '13:30:00', '14:30:00', 'Appointment'),
(1395, 4, '2024-11-24', '13:30:00', '14:30:00', 'Appointment'),
(1396, 4, '2024-11-24', '13:30:00', '14:30:00', 'Appointment'),
(1398, 4, '2024-11-06', '11:30:00', '12:30:00', 'Appointment'),
(1399, NULL, '2024-10-29', '13:30:00', '14:30:00', 'Appointment'),
(1400, NULL, '2024-10-29', '13:30:00', '14:30:00', 'Appointment'),
(1401, NULL, '2024-10-29', '13:30:00', '14:30:00', 'Appointment'),
(1402, NULL, '2024-10-29', '13:30:00', '14:30:00', 'Appointment'),
(1403, NULL, '2024-10-29', '13:30:00', '14:30:00', 'Appointment'),
(1404, NULL, '2024-10-29', '13:30:00', '14:30:00', 'Appointment'),
(1406, NULL, '2024-10-20', '09:00:00', '11:00:00', 'Seminar'),
(1407, NULL, '2024-10-29', '15:00:00', '16:00:00', 'Appointment'),
(1408, NULL, '2024-10-20', '13:30:00', '14:30:00', 'Appointment'),
(1409, NULL, '2024-10-29', '10:00:00', '11:00:00', 'Appointment'),
(1410, NULL, '2024-11-06', '10:00:00', '11:00:00', 'Appointment'),
(1411, NULL, '2024-11-06', '10:00:00', '11:00:00', 'Appointment'),
(1412, NULL, '2024-11-06', '10:00:00', '11:00:00', 'Appointment'),
(1413, NULL, '2024-11-06', '10:00:00', '11:00:00', 'Appointment'),
(1415, NULL, '2024-10-12', '08:00:00', '05:00:00', 'Seminar'),
(1416, NULL, '2024-10-30', '03:00:00', '04:00:00', 'Appointment'),
(1417, NULL, '2024-10-30', '03:00:00', '04:00:00', 'Appointment'),
(1418, NULL, '2024-10-30', '03:00:00', '04:00:00', 'Appointment'),
(1419, NULL, '2024-10-29', '11:30:00', '12:30:00', 'Appointment'),
(1420, NULL, '2024-10-28', '01:30:00', '02:30:00', 'Appointment'),
(1421, NULL, '2024-10-28', '03:00:00', '04:00:00', 'Appointment'),
(1422, NULL, '2024-10-28', '01:30:00', '02:30:00', 'Appointment'),
(1423, 4, '2024-10-30', '10:00:00', '11:00:00', 'Appointment'),
(1424, 4, '2024-10-29', '08:30:00', '09:30:00', 'Appointment'),
(1425, 4, '2024-10-29', '08:30:00', '09:30:00', 'Appointment'),
(1426, 4, '2024-10-29', '08:30:00', '09:30:00', 'Appointment'),
(1427, 4, '2024-10-29', '08:30:00', '09:30:00', 'Appointment'),
(1428, 4, '2024-10-29', '08:30:00', '09:30:00', 'Appointment'),
(1429, 4, '2024-10-29', '08:30:00', '09:30:00', 'Appointment'),
(1430, NULL, '2024-10-29', '08:30:00', '09:30:00', 'Appointment'),
(1431, NULL, '2024-10-29', '03:00:00', '04:00:00', 'Appointment'),
(1432, NULL, '2024-11-30', '16:30:00', '17:30:00', NULL),
(1433, NULL, '2024-11-30', '16:30:00', '17:30:00', NULL),
(1434, NULL, '2024-10-29', '08:30:00', '09:30:00', NULL),
(1435, NULL, '2024-10-29', '08:30:00', '09:30:00', NULL),
(1436, NULL, '2024-11-25', '13:30:00', '14:30:00', NULL),
(1437, NULL, '2024-11-25', '13:30:00', '14:30:00', NULL),
(1438, NULL, '2024-11-14', '13:30:00', '14:30:00', NULL),
(1439, NULL, '2024-11-14', '13:30:00', '14:30:00', NULL),
(1441, NULL, '2024-10-26', '08:00:00', '05:00:00', 'Seminar'),
(1443, NULL, '2024-11-06', '13:30:00', '14:30:00', NULL),
(1444, NULL, '2024-11-06', '13:30:00', '14:30:00', NULL),
(1455, NULL, '2024-11-21', '13:30:00', '14:30:00', NULL),
(1456, NULL, '2024-10-22', '08:30:00', '12:30:00', NULL),
(1458, NULL, '2024-10-30', '08:30:00', '14:30:00', NULL),
(1463, NULL, '2024-10-31', '10:00:00', '11:00:00', NULL),
(1464, NULL, '2024-10-21', '08:30:00', '13:30:00', NULL),
(1467, NULL, '2024-11-16', '15:00:00', '16:00:00', NULL),
(1468, NULL, '2024-10-29', '09:30:00', '14:30:00', NULL),
(1470, NULL, '2024-10-12', '08:00:00', '05:00:00', 'Seminar'),
(1472, NULL, '2024-10-30', '13:30:00', '14:30:00', 'Appointment'),
(1473, NULL, '2024-10-27', '09:00:00', '11:00:00', 'Seminar'),
(1474, NULL, '2024-10-30', '11:30:00', '12:30:00', 'Appointment'),
(1475, 4, '2024-10-30', '10:00:00', '11:00:00', 'Appointment'),
(1476, NULL, '2024-10-27', '09:00:00', '11:00:00', 'Seminar'),
(1477, NULL, '2024-10-27', '09:00:00', '11:00:00', 'Seminar'),
(1478, NULL, '2024-10-27', '09:00:00', '11:00:00', 'Seminar'),
(1479, NULL, '2024-10-27', '09:00:00', '11:00:00', 'Seminar'),
(1480, NULL, '2024-10-27', '09:00:00', '11:00:00', 'Seminar'),
(1481, NULL, '2024-10-27', '09:00:00', '11:00:00', 'Seminar'),
(1482, NULL, '2024-10-27', '09:00:00', '11:00:00', 'Seminar'),
(1483, NULL, '2024-10-27', '09:00:00', '11:00:00', 'Seminar'),
(1484, NULL, '2024-10-27', '09:00:00', '11:00:00', 'Seminar'),
(1485, NULL, '2024-10-27', '09:00:00', '11:00:00', 'Seminar'),
(1486, NULL, '2024-10-27', '09:00:00', '11:00:00', 'Seminar'),
(1487, NULL, '2024-10-27', '09:00:00', '11:00:00', 'Seminar'),
(1488, NULL, '2024-10-27', '09:00:00', '11:00:00', 'Seminar'),
(1489, NULL, '2024-10-27', '09:00:00', '11:00:00', 'Seminar'),
(1490, NULL, '2024-10-27', '09:00:00', '11:00:00', 'Seminar'),
(1491, 4, '2024-10-30', '08:30:00', '09:30:00', 'Appointment'),
(1492, 4, '2024-11-22', '13:30:00', '14:30:00', 'Appointment'),
(1493, NULL, '2024-10-26', '08:00:00', '05:00:00', 'Seminar'),
(1494, NULL, '2024-10-27', '09:00:00', '11:00:00', 'Seminar'),
(1495, 4, '2024-10-30', '15:00:00', '16:00:00', 'Appointment'),
(1496, 4, '2024-10-31', '08:30:00', '09:30:00', 'Appointment'),
(1497, 4, '2024-11-01', '08:30:00', '09:30:00', 'Appointment'),
(1498, NULL, '2024-10-27', '09:00:00', '11:00:00', 'Seminar'),
(1499, NULL, '2024-10-31', '13:30:00', '14:30:00', 'Appointment'),
(1500, 4, '2024-11-11', '11:30:00', '12:30:00', 'Appointment'),
(1501, NULL, '2024-10-27', '09:00:00', '11:00:00', 'Seminar'),
(1502, 4, '2024-11-04', '10:00:00', '11:00:00', 'Appointment'),
(1503, NULL, '2024-10-27', '09:00:00', '11:00:00', 'Seminar'),
(1504, 4, '2024-11-13', '08:30:00', '09:30:00', 'Appointment'),
(1505, NULL, '2024-10-27', '09:00:00', '11:00:00', 'Seminar'),
(1506, 4, '2024-11-25', '10:00:00', '11:00:00', 'Appointment'),
(1507, NULL, '2024-10-26', '08:00:00', '05:00:00', 'Seminar'),
(1508, 4, '2024-10-31', '13:30:00', '14:30:00', 'Appointment'),
(1509, NULL, '2024-10-27', '09:00:00', '11:00:00', 'Seminar'),
(1510, 4, '2024-11-04', '08:30:00', '09:30:00', 'Appointment'),
(1511, NULL, '2024-10-27', '09:00:00', '11:00:00', 'Seminar'),
(1512, 4, '2024-11-05', '10:00:00', '11:00:00', 'Appointment'),
(1513, NULL, '2024-10-27', '09:00:00', '11:00:00', 'Seminar'),
(1514, 4, '2024-11-04', '11:30:00', '12:30:00', 'Appointment'),
(1515, NULL, '2024-10-27', '09:00:00', '11:00:00', 'Seminar'),
(1516, 4, '2024-11-07', '08:30:00', '09:30:00', 'Appointment'),
(1517, NULL, '2024-10-27', '09:00:00', '11:00:00', 'Seminar'),
(1518, NULL, '2024-10-31', '15:00:00', '16:00:00', 'Appointment'),
(1519, NULL, '2024-10-27', '09:00:00', '11:00:00', 'Seminar'),
(1520, NULL, '2024-11-13', '10:00:00', '11:00:00', 'Appointment'),
(1521, NULL, '2024-11-03', '09:00:00', '11:00:00', 'Seminar'),
(1522, NULL, '2024-11-07', '13:30:00', '14:30:00', 'Appointment'),
(1523, NULL, '2024-10-27', '09:00:00', '11:00:00', 'Seminar'),
(1524, 4, '2024-11-06', '08:30:00', '09:30:00', 'Appointment'),
(1525, 4, '2024-11-20', '15:00:00', '16:00:00', 'Appointment'),
(1526, 4, '2024-11-20', '10:00:00', '11:00:00', 'Appointment'),
(1527, 4, '2024-10-29', '10:00:00', '11:00:00', 'Appointment'),
(1528, 4, '2024-11-13', '11:30:00', '12:30:00', 'Appointment'),
(1529, 4, '2024-11-21', '10:00:00', '11:00:00', 'Appointment'),
(1530, 4, '2024-11-13', '11:30:00', '12:30:00', 'Appointment'),
(1531, 4, '2024-11-06', '08:30:00', '09:30:00', 'Appointment'),
(1532, 4, '2024-10-28', '10:00:00', '11:00:00', 'Appointment'),
(1533, 4, '2024-10-28', '10:00:00', '11:00:00', 'Appointment'),
(1534, 4, '2024-11-05', '08:30:00', '09:30:00', 'Appointment'),
(1535, 4, '2024-11-26', '10:00:00', '11:00:00', 'Appointment'),
(1536, NULL, '2024-10-25', '08:30:00', '09:30:00', NULL),
(1537, NULL, '2024-10-25', '13:30:00', '14:30:00', NULL),
(1538, NULL, '2024-10-24', '10:00:00', '11:00:00', NULL),
(1539, NULL, '2024-10-25', '08:30:00', '09:30:00', NULL),
(1540, NULL, '2024-10-25', '08:30:00', '09:30:00', NULL),
(1541, NULL, '2024-10-24', '16:30:00', '05:30:00', NULL),
(1542, NULL, '2024-10-25', '08:30:00', '09:30:00', NULL),
(1543, NULL, '2024-10-25', '10:00:00', '11:00:00', NULL),
(1544, NULL, '2024-11-20', '13:30:00', '14:30:00', 'Appointment'),
(1545, NULL, '2024-11-03', '09:00:00', '11:00:00', 'Seminar'),
(1546, NULL, '2024-10-24', '13:30:00', '14:30:00', NULL),
(1547, NULL, '2024-10-29', '18:00:00', '14:30:00', NULL),
(1548, NULL, '2024-10-29', '18:00:00', '19:00:00', NULL),
(1549, NULL, '2024-10-30', '19:00:00', '00:00:00', NULL),
(1550, NULL, '2024-10-29', '21:00:00', '00:00:00', NULL),
(1551, NULL, '2024-11-01', '19:00:00', '00:00:00', NULL),
(1552, NULL, '2024-10-25', '08:30:00', '09:30:00', NULL),
(1553, NULL, '2024-10-30', '22:00:00', '23:00:00', NULL),
(1554, NULL, '2024-11-12', '13:30:00', '14:30:00', 'Appointment'),
(1555, NULL, '2024-11-03', '09:00:00', '11:00:00', 'Seminar'),
(1556, 4, '2024-11-13', '13:30:00', '14:30:00', 'Appointment'),
(1557, NULL, '2024-11-03', '09:00:00', '11:00:00', 'Seminar'),
(1558, NULL, '2024-11-03', '09:00:00', '11:00:00', 'Seminar'),
(1559, NULL, '2024-11-03', '09:00:00', '11:00:00', 'Seminar'),
(1560, NULL, '2024-11-09', '08:00:00', '05:00:00', 'Seminar'),
(1561, NULL, '2024-11-15', '13:30:00', '14:30:00', 'Appointment'),
(1562, NULL, '2024-11-03', '09:00:00', '11:00:00', 'Seminar'),
(1563, NULL, '2024-11-21', '13:30:00', '14:30:00', 'Appointment'),
(1564, NULL, '2024-10-12', '08:00:00', '05:00:00', 'Seminar'),
(1565, NULL, '2024-11-21', '13:30:00', '14:30:00', 'Appointment'),
(1566, NULL, '2024-10-26', '08:00:00', '05:00:00', 'Seminar'),
(1567, NULL, '2024-11-21', '13:30:00', '14:30:00', 'Appointment'),
(1568, NULL, '2024-10-12', '08:00:00', '05:00:00', 'Seminar'),
(1569, NULL, '2024-11-19', '13:30:00', '14:30:00', 'Appointment'),
(1570, NULL, '2024-11-03', '09:00:00', '11:00:00', 'Seminar'),
(1571, NULL, '2024-11-21', '15:00:00', '16:00:00', NULL),
(1572, NULL, '2024-10-22', '08:30:00', '09:30:00', NULL),
(1573, NULL, '2024-11-18', '13:30:00', '14:30:00', 'Appointment'),
(1574, NULL, '2024-10-12', '08:00:00', '05:00:00', 'Seminar'),
(1575, 4, '2024-11-22', '10:00:00', '11:00:00', 'Appointment'),
(1576, NULL, '2024-11-09', '08:00:00', '05:00:00', 'Seminar'),
(1577, NULL, '2024-11-26', '15:00:00', '16:00:00', 'Appointment'),
(1578, NULL, '2024-10-27', '09:00:00', '11:00:00', 'Seminar'),
(1580, NULL, '2024-10-12', '08:00:00', '05:00:00', 'Seminar'),
(1581, NULL, '2024-11-19', '15:00:00', '16:00:00', 'Appointment'),
(1582, NULL, '2024-11-09', '08:00:00', '05:00:00', 'Seminar'),
(1583, NULL, '2024-11-20', '15:00:00', '16:00:00', 'Appointment'),
(1584, NULL, '2024-10-27', '09:00:00', '11:00:00', 'Seminar'),
(1585, NULL, '2024-10-28', '03:00:00', '04:00:00', 'Appointment'),
(1586, 4, '2024-11-27', '10:00:00', '11:00:00', 'Appointment'),
(1587, 4, '2024-11-20', '10:00:00', '11:00:00', 'Appointment'),
(1588, 4, '2024-11-20', '08:30:00', '09:30:00', 'Appointment'),
(1589, NULL, '2024-11-03', '09:00:00', '11:00:00', 'Seminar'),
(1591, 4, '2024-11-12', '10:00:00', '11:00:00', 'Appointment'),
(1593, 4, '2024-11-28', '10:00:00', '11:00:00', 'Appointment'),
(1595, 4, '2024-10-28', '11:30:00', '12:30:00', 'Appointment'),
(1596, 4, '2024-10-28', '13:30:00', '14:30:00', 'Appointment'),
(1599, NULL, '2024-10-12', '08:00:00', '05:00:00', 'Seminar'),
(1600, NULL, '2024-10-31', '10:00:00', '11:00:00', 'Appointment'),
(1601, 4, '2024-11-14', '08:30:00', '09:30:00', 'Appointment'),
(1602, NULL, '2024-11-19', '08:30:00', '09:30:00', 'Appointment'),
(1604, NULL, '2024-11-10', '09:00:00', '11:00:00', 'Seminar'),
(1606, NULL, '2024-11-14', '13:30:00', '14:30:00', 'Appointment'),
(1607, NULL, '2024-11-03', '09:00:00', '11:00:00', 'Seminar'),
(1608, 4, '2024-11-19', '10:00:00', '11:00:00', 'Appointment'),
(1609, NULL, '2024-10-29', '03:00:00', '04:00:00', 'Appointment'),
(1610, 4, '2024-11-27', '11:30:00', '12:30:00', 'Appointment'),
(1611, NULL, '2024-11-20', '11:30:00', '12:30:00', 'Appointment'),
(1612, 4, '2024-11-26', '08:30:00', '09:30:00', 'Appointment'),
(1613, 4, '2024-11-28', '13:30:00', '14:30:00', 'Appointment'),
(1614, 4, '2024-11-22', '08:30:00', '09:30:00', 'Appointment'),
(1615, 4, '2024-11-21', '08:30:00', '09:30:00', 'Appointment'),
(1616, 4, '2024-11-06', '10:00:00', '11:00:00', 'Appointment'),
(1617, 4, '2024-10-30', '10:00:00', '11:00:00', 'Appointment'),
(1618, NULL, '2024-11-03', '09:00:00', '11:00:00', 'Seminar'),
(1619, 4, '2024-11-23', '11:30:00', '12:30:00', 'Appointment'),
(1620, 4, '2024-11-26', '13:30:00', '14:30:00', 'Appointment'),
(1621, NULL, '2024-11-03', '09:00:00', '11:00:00', 'Seminar'),
(1622, NULL, '2024-11-03', '09:00:00', '11:00:00', 'Seminar'),
(1623, NULL, '2024-10-30', '04:00:00', '05:00:00', NULL),
(1624, NULL, '2024-10-30', '06:00:00', '07:00:00', NULL),
(1625, 4, '2024-11-29', '10:00:00', '11:00:00', 'Appointment'),
(1626, NULL, '2024-11-25', '13:30:00', '14:30:00', 'Appointment'),
(1627, NULL, '2024-11-03', '09:00:00', '11:00:00', 'Seminar'),
(1628, NULL, '2024-10-31', '10:00:00', '11:00:00', NULL),
(1629, NULL, '2024-10-31', '10:00:00', '11:00:00', NULL),
(1630, NULL, '2024-10-31', '13:30:00', '14:30:00', NULL),
(1631, NULL, '2024-10-31', '13:30:00', '14:30:00', NULL),
(1632, NULL, '2024-10-31', '13:30:00', '14:30:00', NULL),
(1633, NULL, '2024-10-31', '08:30:00', '09:30:00', NULL),
(1634, NULL, '2024-10-31', '13:30:00', '14:30:00', NULL),
(1635, NULL, '2024-10-31', '13:30:00', '14:30:00', NULL),
(1636, NULL, '2024-10-31', '13:30:00', '14:30:00', NULL),
(1637, NULL, '2024-10-31', '13:30:00', '14:30:00', NULL),
(1638, NULL, '2024-10-31', '13:30:00', '14:30:00', NULL),
(1639, NULL, '2024-10-31', '13:30:00', '14:30:00', NULL),
(1640, NULL, '2024-10-31', '13:30:00', '14:30:00', NULL),
(1641, NULL, '2024-10-31', '08:30:00', '09:30:00', NULL),
(1642, NULL, '2024-10-31', '13:30:00', '14:30:00', NULL),
(1643, NULL, '2024-10-31', '13:30:00', '14:30:00', NULL),
(1644, NULL, '2024-10-31', '10:00:00', '11:00:00', NULL),
(1645, NULL, '2024-11-08', '13:30:00', '14:30:00', NULL),
(1646, NULL, '2024-10-31', '11:30:00', '12:30:00', NULL),
(1647, NULL, '2024-11-01', '11:30:00', '12:30:00', NULL),
(1648, NULL, '2024-11-07', '10:00:00', '11:00:00', NULL),
(1649, NULL, '2024-11-06', '13:30:00', '14:30:00', NULL),
(1650, NULL, '2024-10-31', '10:00:00', '11:00:00', NULL),
(1651, NULL, '2024-10-30', '11:30:00', '12:30:00', NULL),
(1652, NULL, '2024-11-01', '08:30:00', '09:30:00', 'Appointment'),
(1653, NULL, '2024-11-27', '01:30:00', '02:30:00', 'Appointment'),
(1654, NULL, '2024-11-12', '03:00:00', '04:00:00', 'Appointment'),
(1655, NULL, '2024-11-18', '15:00:00', '16:00:00', 'Appointment'),
(1656, NULL, '2024-11-03', '09:00:00', '11:00:00', 'Seminar'),
(1657, NULL, '2024-12-02', '11:30:00', '12:30:00', 'Appointment'),
(1658, NULL, '2024-12-11', '11:30:00', '12:30:00', 'Appointment'),
(1659, NULL, '2024-12-11', '11:30:00', '12:30:00', 'Appointment'),
(1660, NULL, '2024-11-03', '09:00:00', '11:00:00', 'Seminar'),
(1661, NULL, '2024-11-10', '09:00:00', '11:00:00', 'Seminar'),
(1662, NULL, '2024-11-10', '09:00:00', '11:00:00', 'Seminar'),
(1663, NULL, '2024-11-10', '09:00:00', '11:00:00', 'Seminar'),
(1664, NULL, '2024-11-13', '15:00:00', '16:00:00', 'Appointment'),
(1665, NULL, '2024-11-03', '09:00:00', '11:00:00', 'Seminar'),
(1666, NULL, '2024-11-14', '15:00:00', '16:00:00', 'Appointment'),
(1667, NULL, '2024-11-02', '10:00:00', '11:00:00', NULL),
(1668, NULL, '2024-11-15', '15:00:00', '16:00:00', 'Appointment'),
(1669, NULL, '2024-11-10', '09:00:00', '11:00:00', 'Seminar'),
(1670, NULL, '2024-11-15', '10:00:00', '11:00:00', 'Appointment'),
(1671, NULL, '2024-11-15', '03:00:00', '04:00:00', 'Appointment'),
(1672, NULL, '2024-11-02', '15:00:00', '16:00:00', NULL),
(1673, NULL, '2024-11-02', '15:00:00', '16:00:00', NULL),
(1674, NULL, '2024-11-18', '11:30:00', '12:30:00', 'Appointment'),
(1675, NULL, '2024-11-03', '09:00:00', '11:00:00', 'Seminar'),
(1676, NULL, '2024-11-15', '08:30:00', '09:30:00', 'Appointment'),
(1677, NULL, '2024-11-09', '11:30:00', '12:30:00', 'Appointment'),
(1678, NULL, '2024-11-09', '01:30:00', '02:30:00', 'Appointment'),
(1679, 4, '2024-11-28', '10:00:00', '11:00:00', 'Appointment'),
(1680, 4, '2024-11-23', '10:00:00', '11:00:00', 'Appointment'),
(1681, 4, '2024-11-16', '10:00:00', '11:00:00', 'Appointment'),
(1682, 4, '2024-11-23', '08:30:00', '09:30:00', 'Appointment'),
(1683, 4, '2024-11-09', '10:00:00', '11:00:00', 'Appointment'),
(1684, NULL, '2024-11-22', '03:00:00', '04:00:00', 'Appointment'),
(1685, NULL, '2024-11-22', '15:00:00', '16:00:00', 'Appointment'),
(1686, NULL, '2024-11-22', '15:00:00', '16:00:00', 'Appointment'),
(1687, NULL, '2024-11-22', '15:00:00', '16:00:00', 'Appointment'),
(1688, NULL, '2024-11-22', '15:00:00', '16:00:00', 'Appointment'),
(1689, NULL, '2024-11-23', '15:00:00', '16:00:00', 'Appointment'),
(1690, NULL, '2024-11-27', '15:00:00', '16:00:00', 'Appointment'),
(1691, NULL, '2024-11-27', '13:30:00', '14:30:00', 'Appointment'),
(1692, NULL, '2024-11-23', '16:30:00', '17:30:00', 'Appointment'),
(1693, NULL, '2024-11-28', '15:00:00', '16:00:00', 'Appointment'),
(1694, NULL, '2024-11-30', '13:30:00', '14:30:00', 'Appointment'),
(1695, NULL, '2024-11-23', '13:30:00', '14:30:00', 'Appointment'),
(1696, NULL, '2024-11-30', '11:30:00', '12:30:00', 'Appointment'),
(1697, NULL, '2024-11-29', '15:00:00', '16:00:00', NULL),
(1698, NULL, '2024-11-01', '08:30:00', '09:30:00', NULL),
(1699, NULL, '2024-11-30', '15:00:00', '16:00:00', NULL),
(1700, NULL, '2024-11-01', '08:30:00', '09:30:00', NULL),
(1707, NULL, '2024-11-29', '13:30:00', '14:30:00', NULL),
(1708, NULL, '2024-11-01', '08:30:00', '09:30:00', NULL),
(1715, NULL, '2024-11-27', '08:30:00', '09:30:00', NULL),
(1716, NULL, '2024-11-08', '08:30:00', '09:30:00', NULL),
(1717, NULL, '2024-11-21', '15:00:00', '16:00:00', NULL),
(1718, NULL, '2024-11-01', '08:30:00', '09:30:00', NULL),
(1719, NULL, '2024-11-28', '08:30:00', '09:30:00', NULL),
(1720, NULL, '2024-11-01', '08:30:00', '09:30:00', NULL),
(1721, 4, '2024-11-30', '10:00:00', '11:00:00', 'Appointment');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `announcement`
--
ALTER TABLE `announcement`
  ADD PRIMARY KEY (`announcement_id`),
  ADD KEY `schedule_id` (`schedule_id`),
  ADD KEY `seminar_id` (`seminar_id`),
  ADD KEY `approval_id` (`approval_id`);

--
-- Indexes for table `appointment_schedule`
--
ALTER TABLE `appointment_schedule`
  ADD PRIMARY KEY (`appsched_id`),
  ADD KEY `confirmation_id` (`confirmation_id`),
  ADD KEY `defuctom_id` (`defuctom_id`),
  ADD KEY `marriage_id` (`marriage_id`),
  ADD KEY `baptismfill_id` (`baptismfill_id`) USING BTREE,
  ADD KEY `schedule_id` (`schedule_id`),
  ADD KEY `request_id` (`request_id`);

--
-- Indexes for table `baptismfill`
--
ALTER TABLE `baptismfill`
  ADD PRIMARY KEY (`baptism_id`),
  ADD KEY `schedule_id` (`schedule_id`),
  ADD KEY `citizen_id` (`citizen_id`),
  ADD KEY `announcement_id` (`announcement_id`),
  ADD KEY `approval_id` (`approval_id`);

--
-- Indexes for table `citizen`
--
ALTER TABLE `citizen`
  ADD PRIMARY KEY (`citizend_id`);

--
-- Indexes for table `confirmationfill`
--
ALTER TABLE `confirmationfill`
  ADD PRIMARY KEY (`confirmationfill_id`),
  ADD KEY `schedule_id` (`schedule_id`),
  ADD KEY `announcement_id` (`announcement_id`),
  ADD KEY `citizen_id` (`citizen_id`),
  ADD KEY `approval_id` (`approval_id`);

--
-- Indexes for table `defuctomfill`
--
ALTER TABLE `defuctomfill`
  ADD PRIMARY KEY (`defuctomfill_id`),
  ADD KEY `schedule_id` (`schedule_id`),
  ADD KEY `approval_id` (`approval_id`);

--
-- Indexes for table `donation`
--
ALTER TABLE `donation`
  ADD PRIMARY KEY (`donation_id`);

--
-- Indexes for table `event_calendar`
--
ALTER TABLE `event_calendar`
  ADD PRIMARY KEY (`calendar_id`);

--
-- Indexes for table `financial`
--
ALTER TABLE `financial`
  ADD PRIMARY KEY (`financial_id`),
  ADD KEY `appointment_id` (`appointment_id`);

--
-- Indexes for table `marriagefill`
--
ALTER TABLE `marriagefill`
  ADD PRIMARY KEY (`marriagefill_id`),
  ADD KEY `schedule_id` (`schedule_id`),
  ADD KEY `announcement_id` (`announcement_id`),
  ADD KEY `citizen_id` (`citizen_id`),
  ADD KEY `approval_id` (`approval_id`);

--
-- Indexes for table `mass_schedule`
--
ALTER TABLE `mass_schedule`
  ADD PRIMARY KEY (`mass_id`),
  ADD KEY `approval_id` (`approval_id`),
  ADD KEY `schedule_id` (`schedule_id`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `priest_approval`
--
ALTER TABLE `priest_approval`
  ADD PRIMARY KEY (`approval_id`),
  ADD KEY `priest_id` (`priest_id`);

--
-- Indexes for table `req_form`
--
ALTER TABLE `req_form`
  ADD PRIMARY KEY (`req_id`),
  ADD KEY `schedule_id` (`schedule_id`),
  ADD KEY `approval_id` (`approval_id`);

--
-- Indexes for table `review_feedback`
--
ALTER TABLE `review_feedback`
  ADD PRIMARY KEY (`review_id`),
  ADD KEY `citizen_id` (`citizen_id`);

--
-- Indexes for table `schedule`
--
ALTER TABLE `schedule`
  ADD PRIMARY KEY (`schedule_id`),
  ADD KEY `schedule_ibfk_1` (`citizen_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `announcement`
--
ALTER TABLE `announcement`
  MODIFY `announcement_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `appointment_schedule`
--
ALTER TABLE `appointment_schedule`
  MODIFY `appsched_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1117;

--
-- AUTO_INCREMENT for table `baptismfill`
--
ALTER TABLE `baptismfill`
  MODIFY `baptism_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=680;

--
-- AUTO_INCREMENT for table `citizen`
--
ALTER TABLE `citizen`
  MODIFY `citizend_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=143;

--
-- AUTO_INCREMENT for table `confirmationfill`
--
ALTER TABLE `confirmationfill`
  MODIFY `confirmationfill_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=241;

--
-- AUTO_INCREMENT for table `defuctomfill`
--
ALTER TABLE `defuctomfill`
  MODIFY `defuctomfill_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=122;

--
-- AUTO_INCREMENT for table `donation`
--
ALTER TABLE `donation`
  MODIFY `donation_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=76;

--
-- AUTO_INCREMENT for table `event_calendar`
--
ALTER TABLE `event_calendar`
  MODIFY `calendar_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=80;

--
-- AUTO_INCREMENT for table `financial`
--
ALTER TABLE `financial`
  MODIFY `financial_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `marriagefill`
--
ALTER TABLE `marriagefill`
  MODIFY `marriagefill_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=202;

--
-- AUTO_INCREMENT for table `mass_schedule`
--
ALTER TABLE `mass_schedule`
  MODIFY `mass_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

--
-- AUTO_INCREMENT for table `notifications`
--
ALTER TABLE `notifications`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- AUTO_INCREMENT for table `priest_approval`
--
ALTER TABLE `priest_approval`
  MODIFY `approval_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=207;

--
-- AUTO_INCREMENT for table `req_form`
--
ALTER TABLE `req_form`
  MODIFY `req_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=82;

--
-- AUTO_INCREMENT for table `review_feedback`
--
ALTER TABLE `review_feedback`
  MODIFY `review_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `schedule`
--
ALTER TABLE `schedule`
  MODIFY `schedule_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1722;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `announcement`
--
ALTER TABLE `announcement`
  ADD CONSTRAINT `announcement_ibfk_1` FOREIGN KEY (`schedule_id`) REFERENCES `schedule` (`schedule_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `announcement_ibfk_3` FOREIGN KEY (`seminar_id`) REFERENCES `schedule` (`schedule_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `announcement_ibfk_4` FOREIGN KEY (`approval_id`) REFERENCES `priest_approval` (`approval_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `appointment_schedule`
--
ALTER TABLE `appointment_schedule`
  ADD CONSTRAINT `appointment_schedule_ibfk_1` FOREIGN KEY (`baptismfill_id`) REFERENCES `baptismfill` (`baptism_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `appointment_schedule_ibfk_2` FOREIGN KEY (`confirmation_id`) REFERENCES `confirmationfill` (`confirmationfill_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `appointment_schedule_ibfk_3` FOREIGN KEY (`defuctom_id`) REFERENCES `defuctomfill` (`defuctomfill_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `appointment_schedule_ibfk_4` FOREIGN KEY (`marriage_id`) REFERENCES `marriagefill` (`marriagefill_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `appointment_schedule_ibfk_6` FOREIGN KEY (`schedule_id`) REFERENCES `schedule` (`schedule_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `appointment_schedule_ibfk_7` FOREIGN KEY (`request_id`) REFERENCES `req_form` (`req_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `baptismfill`
--
ALTER TABLE `baptismfill`
  ADD CONSTRAINT `baptismfill_ibfk_1` FOREIGN KEY (`schedule_id`) REFERENCES `schedule` (`schedule_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `baptismfill_ibfk_2` FOREIGN KEY (`citizen_id`) REFERENCES `citizen` (`citizend_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `baptismfill_ibfk_3` FOREIGN KEY (`announcement_id`) REFERENCES `announcement` (`announcement_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `baptismfill_ibfk_4` FOREIGN KEY (`approval_id`) REFERENCES `priest_approval` (`approval_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `confirmationfill`
--
ALTER TABLE `confirmationfill`
  ADD CONSTRAINT `confirmationfill_ibfk_1` FOREIGN KEY (`schedule_id`) REFERENCES `schedule` (`schedule_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `confirmationfill_ibfk_2` FOREIGN KEY (`announcement_id`) REFERENCES `announcement` (`announcement_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `confirmationfill_ibfk_3` FOREIGN KEY (`citizen_id`) REFERENCES `citizen` (`citizend_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `confirmationfill_ibfk_4` FOREIGN KEY (`approval_id`) REFERENCES `priest_approval` (`approval_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `defuctomfill`
--
ALTER TABLE `defuctomfill`
  ADD CONSTRAINT `defuctomfill_ibfk_1` FOREIGN KEY (`schedule_id`) REFERENCES `schedule` (`schedule_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `defuctomfill_ibfk_2` FOREIGN KEY (`approval_id`) REFERENCES `priest_approval` (`approval_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `financial`
--
ALTER TABLE `financial`
  ADD CONSTRAINT `financial_ibfk_1` FOREIGN KEY (`appointment_id`) REFERENCES `appointment_schedule` (`appsched_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `marriagefill`
--
ALTER TABLE `marriagefill`
  ADD CONSTRAINT `marriagefill_ibfk_1` FOREIGN KEY (`schedule_id`) REFERENCES `schedule` (`schedule_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `marriagefill_ibfk_2` FOREIGN KEY (`announcement_id`) REFERENCES `announcement` (`announcement_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `marriagefill_ibfk_3` FOREIGN KEY (`citizen_id`) REFERENCES `citizen` (`citizend_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `marriagefill_ibfk_4` FOREIGN KEY (`approval_id`) REFERENCES `priest_approval` (`approval_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `mass_schedule`
--
ALTER TABLE `mass_schedule`
  ADD CONSTRAINT `mass_schedule_ibfk_1` FOREIGN KEY (`approval_id`) REFERENCES `priest_approval` (`approval_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `mass_schedule_ibfk_2` FOREIGN KEY (`schedule_id`) REFERENCES `schedule` (`schedule_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `priest_approval`
--
ALTER TABLE `priest_approval`
  ADD CONSTRAINT `priest_approval_ibfk_1` FOREIGN KEY (`priest_id`) REFERENCES `citizen` (`citizend_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `req_form`
--
ALTER TABLE `req_form`
  ADD CONSTRAINT `req_form_ibfk_1` FOREIGN KEY (`approval_id`) REFERENCES `priest_approval` (`approval_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `schedule_id` FOREIGN KEY (`schedule_id`) REFERENCES `schedule` (`schedule_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `review_feedback`
--
ALTER TABLE `review_feedback`
  ADD CONSTRAINT `review_feedback_ibfk_1` FOREIGN KEY (`citizen_id`) REFERENCES `citizen` (`citizend_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `schedule`
--
ALTER TABLE `schedule`
  ADD CONSTRAINT `schedule_ibfk_1` FOREIGN KEY (`citizen_id`) REFERENCES `citizen` (`citizend_id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
