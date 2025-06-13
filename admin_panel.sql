-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 13, 2025 at 02:58 PM
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
-- Database: `admin_panel`
--

-- --------------------------------------------------------

--
-- Table structure for table `arrival_mode`
--

CREATE TABLE `arrival_mode` (
  `id` int(11) NOT NULL,
  `mode_code` varchar(10) NOT NULL,
  `mode_name` varchar(100) NOT NULL,
  `description` text DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT 1,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `deleted_by` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `arrival_mode`
--

INSERT INTO `arrival_mode` (`id`, `mode_code`, `mode_name`, `description`, `is_active`, `created_by`, `updated_by`, `deleted_by`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'WALKIN', 'Walk-In', 'Guest arrived without prior booking', 1, 101, 101, NULL, '2025-06-09 10:30:51', '2025-06-09 10:30:51', NULL),
(2, 'ONLINE', 'Online Booking', 'Guest booked through the hotel website', 1, 101, 101, NULL, '2025-06-09 10:30:51', '2025-06-09 10:30:51', NULL),
(3, 'AGENT', 'Travel Agent', 'Booking made via a travel agent', 1, 101, 101, NULL, '2025-06-09 10:30:51', '2025-06-09 10:30:51', NULL),
(4, 'PHONE', 'Phone Reservation', 'Booking confirmed via telephone', 1, 101, 101, NULL, '2025-06-09 10:30:51', '2025-06-09 10:30:51', NULL),
(5, 'EMAIL', 'Email Booking', 'Booking made through email communication', 1, 101, 101, NULL, '2025-06-09 10:30:51', '2025-06-09 10:30:51', NULL),
(6, 'CORP', 'Corporate Booking', 'Corporate guest reservation', 1, 101, 101, NULL, '2025-06-09 10:30:51', '2025-06-09 10:30:51', NULL),
(7, 'OTA', 'Online Travel Agency', 'Booked via OTAs like Booking.com or Expedia', 1, 101, 101, NULL, '2025-06-09 10:30:51', '2025-06-09 10:30:51', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `block_master`
--

CREATE TABLE `block_master` (
  `id` int(11) NOT NULL,
  `block_no` varchar(50) NOT NULL,
  `block_name` varchar(100) NOT NULL,
  `created_by` bigint(20) UNSIGNED DEFAULT NULL,
  `updated_by` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `block_master`
--

INSERT INTO `block_master` (`id`, `block_no`, `block_name`, `created_by`, `updated_by`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'B-101', 'South Block', 1, 1, '2025-06-06 05:39:28', '2025-06-07 05:34:06', '2025-06-07 05:34:06'),
(2, 'B-102', 'East Block', 1, 1, '2025-06-06 05:39:51', '2025-06-07 05:34:06', '2025-06-07 05:34:06'),
(3, 'B-103', 'West Block', 1, 1, '2025-06-06 05:40:21', '2025-06-07 05:34:07', '2025-06-07 05:34:07'),
(4, 'B-104', 'North Block', 1, 1, '2025-06-06 05:41:04', '2025-06-07 05:34:07', '2025-06-07 05:34:07'),
(5, 'BLK-A', 'Block A', 1, 1, '2025-06-07 11:05:57', '2025-06-07 11:05:57', NULL),
(6, 'BLK-B', 'Block B', 1, 1, '2025-06-07 11:05:57', '2025-06-07 11:05:57', NULL),
(7, 'BLK-C', 'Block C', 2, 2, '2025-06-07 11:05:57', '2025-06-07 11:05:57', NULL),
(8, 'TWR-1', 'Tower 1', 1, 2, '2025-06-07 11:05:57', '2025-06-07 11:05:57', NULL),
(9, 'TWR-2', 'Tower 2', 3, 3, '2025-06-07 11:05:57', '2025-06-07 11:05:57', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `block_rooms`
--

CREATE TABLE `block_rooms` (
  `id` int(11) NOT NULL,
  `room_id` int(11) NOT NULL,
  `status_id` int(11) DEFAULT NULL,
  `reason` varchar(255) DEFAULT NULL,
  `fromdatetime` datetime NOT NULL,
  `todatetime` datetime NOT NULL,
  `blocked_by` int(11) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `block_rooms`
--

INSERT INTO `block_rooms` (`id`, `room_id`, `status_id`, `reason`, `fromdatetime`, `todatetime`, `blocked_by`, `timestamp`) VALUES
(1, 1, 4, 'Tesing', '2025-06-11 18:30:00', '2025-06-12 18:30:00', 1, '2025-06-12 13:02:24'),
(2, 3, 7, 'testing', '2025-06-11 18:30:00', '2025-06-12 18:30:00', 1, '2025-06-12 13:05:15'),
(3, 5, 4, 'testing', '2025-06-12 18:30:00', '2025-06-13 18:30:00', 1, '2025-06-12 13:08:31'),
(4, 6, 7, 'testing', '2025-06-12 18:30:00', '2025-06-13 18:30:00', 1, '2025-06-12 13:09:24'),
(5, 7, 7, 'Tesing', '2025-06-12 18:30:00', '2025-06-18 18:30:00', 1, '2025-06-12 13:11:18'),
(6, 9, 7, 'Tesing', '2025-06-19 18:30:00', '2025-06-18 18:30:00', 1, '2025-06-12 13:14:01'),
(7, 10, 7, 'testing', '2025-06-11 18:30:00', '2025-06-13 18:30:00', 1, '2025-06-12 13:15:31'),
(8, 11, 7, 'Tesing', '2025-06-11 18:30:00', '2025-06-12 18:30:00', 1, '2025-06-12 13:17:52');

-- --------------------------------------------------------

--
-- Table structure for table `business_source`
--

CREATE TABLE `business_source` (
  `id` int(11) NOT NULL,
  `source_name` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `business_source`
--

INSERT INTO `business_source` (`id`, `source_name`, `created_at`, `updated_at`) VALUES
(1, 'Referral', '2025-06-09 12:20:44', '2025-06-09 12:20:44'),
(2, 'Online Ads', '2025-06-09 12:20:44', '2025-06-09 12:20:44'),
(3, 'Cold Call', '2025-06-09 12:20:44', '2025-06-09 12:20:44'),
(4, 'Walk-in', '2025-06-09 12:20:44', '2025-06-09 12:20:44');

-- --------------------------------------------------------

--
-- Table structure for table `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) NOT NULL,
  `value` mediumtext NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) NOT NULL,
  `owner` varchar(255) NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `checkin_master`
--

CREATE TABLE `checkin_master` (
  `id` int(11) NOT NULL,
  `is_reservation` tinyint(1) DEFAULT NULL,
  `reservation_number` varchar(50) DEFAULT NULL,
  `arrival_mode` varchar(50) DEFAULT NULL,
  `ota` varchar(100) DEFAULT NULL,
  `booking_id` varchar(100) DEFAULT NULL,
  `contact` varchar(20) DEFAULT NULL,
  `title` varchar(10) DEFAULT NULL,
  `first_name` varchar(100) DEFAULT NULL,
  `last_name` varchar(100) DEFAULT NULL,
  `gender` varchar(10) DEFAULT NULL,
  `city` varchar(100) DEFAULT NULL,
  `id_number` varchar(100) DEFAULT NULL,
  `email` varchar(150) DEFAULT NULL,
  `check_in_mode` varchar(50) DEFAULT NULL,
  `allow_credit` varchar(10) DEFAULT NULL,
  `foreign_guest` varchar(10) DEFAULT NULL,
  `segment_id` int(11) DEFAULT NULL,
  `business_source_id` int(11) DEFAULT NULL,
  `photo` varchar(255) DEFAULT NULL,
  `document` varchar(255) DEFAULT NULL,
  `gst_number` varchar(50) DEFAULT NULL,
  `guest_company` varchar(150) DEFAULT NULL,
  `age` int(11) DEFAULT NULL,
  `gst_type` varchar(50) DEFAULT NULL,
  `address` text DEFAULT NULL,
  `visit_remark` text DEFAULT NULL,
  `pin_code` varchar(10) DEFAULT NULL,
  `nationality` varchar(100) DEFAULT NULL,
  `booking_instructions` text DEFAULT NULL,
  `guest_special_instructions` text DEFAULT NULL,
  `is_vip` tinyint(1) DEFAULT NULL,
  `check_in_type` varchar(50) DEFAULT NULL,
  `check_in_datetime` datetime DEFAULT NULL,
  `number_of_days` int(11) DEFAULT NULL,
  `check_out_datetime` datetime DEFAULT NULL,
  `grace_hours` int(11) DEFAULT NULL,
  `payment_by` varchar(50) DEFAULT NULL,
  `allow_charges_posting` tinyint(1) DEFAULT NULL,
  `enable_paxwise` tinyint(1) DEFAULT NULL,
  `enable_room_sharing` tinyint(1) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `checkin_master`
--

INSERT INTO `checkin_master` (`id`, `is_reservation`, `reservation_number`, `arrival_mode`, `ota`, `booking_id`, `contact`, `title`, `first_name`, `last_name`, `gender`, `city`, `id_number`, `email`, `check_in_mode`, `allow_credit`, `foreign_guest`, `segment_id`, `business_source_id`, `photo`, `document`, `gst_number`, `guest_company`, `age`, `gst_type`, `address`, `visit_remark`, `pin_code`, `nationality`, `booking_instructions`, `guest_special_instructions`, `is_vip`, `check_in_type`, `check_in_datetime`, `number_of_days`, `check_out_datetime`, `grace_hours`, `payment_by`, `allow_charges_posting`, `enable_paxwise`, `enable_room_sharing`, `created_at`, `updated_at`) VALUES
(1, 1, '2002', '1', 'assasas', '1212', '232322', '1', 'kali', 'dass', '1', 'chennaii', '12231221', 'assa@gmail.com', 'Day', 'Yes', 'Yes', 2, 2, NULL, NULL, 'wwe232ee2', 'sdsdsdsd', 22, 'UNREGISTERED', 'dfeffdc', 'sdsdsds', '233233', 'Indian', 'cvxvsv', 'sdvsfvv', 1, '24 Hours CheckIn', '2025-06-10 11:58:26', 1, '2025-06-11 11:58:26', 2, 'Direct', 1, 1, 0, '2025-06-10 01:01:38', '2025-06-10 01:01:38'),
(3, 0, NULL, '1', 'sasas', 'asasas', '23232323', '1', 'sdsdsd', 'sdsd', '1', 'sdsd', 'sdsdsd', 'ssdsdd@sdsd.cm', 'Day', 'Yes', 'No', 1, 1, NULL, NULL, 'asddsdsds', 'dxssdsdd', 22, 'UNREGISTERED', 'sxxsxsxx', 'czxccx', '11221', 'Indian', 'cxx', 'cxcxx', 1, '24 Hours CheckIn', '2025-06-10 14:45:12', 1, '2025-06-11 14:45:12', 2, 'Direct', 0, 0, 0, '2025-06-10 03:59:14', '2025-06-10 06:12:38'),
(4, 1, '21212122', '1', '12121212', '12121212', '33232323', '2', 'ssdd', 'sdsdsdsdd', '2', 'ssdsdsd', '122121212', 'ass@gmail.com', 'Day', 'Yes', 'Yes', 1, 2, NULL, NULL, 'qssasas', 'asasasa', 22, 'UNREGISTERED', 'xxaassasas', 'asasasas', '122121212', 'Foreign', 'czxxx', 'zxxzzx', 1, '24 Hours CheckIn', '2025-06-12 17:19:33', 1, '2025-06-14 17:19:33', 2, 'Company', 1, 1, 1, '2025-06-10 06:21:43', '2025-06-10 06:21:43');

-- --------------------------------------------------------

--
-- Table structure for table `checkin_room_trans`
--

CREATE TABLE `checkin_room_trans` (
  `id` int(11) NOT NULL,
  `checkin_id` int(11) DEFAULT NULL,
  `room_type_id` int(11) DEFAULT NULL,
  `room_id` int(11) DEFAULT NULL,
  `rate_plan_id` int(11) DEFAULT NULL,
  `guest_name` varchar(150) DEFAULT NULL,
  `contact` varchar(20) DEFAULT NULL,
  `male` int(11) DEFAULT NULL,
  `female` int(11) DEFAULT NULL,
  `extra` int(11) DEFAULT NULL,
  `net_rate` decimal(10,2) DEFAULT NULL,
  `disc_type` varchar(50) DEFAULT NULL,
  `disc_val` decimal(10,2) DEFAULT NULL,
  `total` decimal(10,2) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `checkin_room_trans`
--

INSERT INTO `checkin_room_trans` (`id`, `checkin_id`, `room_type_id`, `room_id`, `rate_plan_id`, `guest_name`, `contact`, `male`, `female`, `extra`, `net_rate`, `disc_type`, `disc_val`, `total`, `created_at`, `updated_at`) VALUES
(1, 1, 3, 5, 1, 'dassa', '1212212', 2, 0, 1, 1100.00, 'Amount', 122.00, 978.00, '2025-06-10 01:01:38', '2025-06-10 01:01:38'),
(2, 1, 6, 23, 5, 'dass', '23232323', 2, 0, 1, 700.00, 'No Disc', 0.00, 700.00, '2025-06-10 01:01:38', '2025-06-10 01:01:38'),
(6, 3, 3, 9, 6, 'asasas', '12121212', 2, 0, 1, 2000.00, 'No Disc', 0.00, 2000.00, '2025-06-10 06:12:38', '2025-06-10 06:12:38'),
(7, 4, 4, 2, 4, 'sasasa', '1212212', 2, 0, 1, 1500.00, 'Amount', 1222.00, 278.00, '2025-06-10 06:21:43', '2025-06-10 06:21:43');

-- --------------------------------------------------------

--
-- Table structure for table `checkout_master`
--

CREATE TABLE `checkout_master` (
  `id` int(11) NOT NULL,
  `checkin_id` int(11) NOT NULL,
  `actual_checkout_datetime` datetime NOT NULL,
  `early_checkout` tinyint(1) DEFAULT 0,
  `late_checkout` tinyint(1) DEFAULT 0,
  `checkout_remarks` text DEFAULT NULL,
  `payment_status` enum('Paid','Pending','Partially Paid') NOT NULL DEFAULT 'Pending',
  `total_amount` decimal(12,2) NOT NULL,
  `tax_amount` decimal(12,2) NOT NULL,
  `discount_amount` decimal(12,2) DEFAULT 0.00,
  `grand_total` decimal(12,2) NOT NULL,
  `amount_paid` decimal(12,2) DEFAULT 0.00,
  `balance_due` decimal(12,2) DEFAULT 0.00,
  `created_by` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `checkout_master`
--

INSERT INTO `checkout_master` (`id`, `checkin_id`, `actual_checkout_datetime`, `early_checkout`, `late_checkout`, `checkout_remarks`, `payment_status`, `total_amount`, `tax_amount`, `discount_amount`, `grand_total`, `amount_paid`, `balance_due`, `created_by`, `created_at`, `updated_at`) VALUES
(1, 1, '2025-06-13 11:56:19', 0, 1, NULL, 'Partially Paid', 1678.00, 201.36, 0.00, 1879.36, 1699.36, 180.00, 1, '2025-06-13 06:29:00', '2025-06-13 06:29:00'),
(2, 1, '2025-06-13 12:12:12', 0, 1, NULL, 'Paid', 1678.00, 201.36, 0.00, 1879.36, 3758.72, -1879.36, 1, '2025-06-13 06:43:03', '2025-06-13 06:43:04'),
(4, 1, '2025-06-13 12:57:14', 0, 1, NULL, 'Paid', 1678.00, 201.36, 0.00, 1879.36, 1879.36, 0.00, 1, '2025-06-13 07:27:40', '2025-06-13 07:27:40');

-- --------------------------------------------------------

--
-- Table structure for table `checkout_payments`
--

CREATE TABLE `checkout_payments` (
  `id` int(11) NOT NULL,
  `checkout_id` int(11) NOT NULL,
  `payment_method` enum('Cash','Credit Card','Debit Card','UPI','Bank Transfer','Online Payment','Wallet') NOT NULL,
  `payment_amount` decimal(12,2) NOT NULL,
  `payment_date` datetime NOT NULL,
  `transaction_reference` varchar(100) DEFAULT NULL,
  `payment_notes` text DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `checkout_payments`
--

INSERT INTO `checkout_payments` (`id`, `checkout_id`, `payment_method`, `payment_amount`, `payment_date`, `transaction_reference`, `payment_notes`, `created_by`, `created_at`, `updated_at`) VALUES
(1, 1, 'Credit Card', 1699.36, '2025-06-13 11:59:00', 'PAY-1749815940', NULL, 1, '2025-06-13 06:29:00', '2025-06-13 06:29:00'),
(2, 2, 'Cash', 1879.36, '2025-06-13 12:13:03', 'PAY-1749816783', NULL, 1, '2025-06-13 06:43:03', '2025-06-13 06:43:03'),
(3, 2, 'Cash', 1879.36, '2025-06-13 12:13:03', NULL, NULL, 1, '2025-06-13 06:43:04', '2025-06-13 06:43:04'),
(5, 4, 'Cash', 1879.36, '2025-06-13 12:57:40', 'PAY-1749819460', NULL, 1, '2025-06-13 07:27:40', '2025-06-13 07:27:40');

-- --------------------------------------------------------

--
-- Table structure for table `city_master`
--

CREATE TABLE `city_master` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `state_id` bigint(20) UNSIGNED NOT NULL,
  `city_code` varchar(10) NOT NULL,
  `city_name` varchar(100) NOT NULL,
  `description` text DEFAULT NULL,
  `created_by` bigint(20) UNSIGNED DEFAULT NULL,
  `updated_by` bigint(20) UNSIGNED DEFAULT NULL,
  `deleted_by` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `city_master`
--

INSERT INTO `city_master` (`id`, `state_id`, `city_code`, `city_name`, `description`, `created_by`, `updated_by`, `deleted_by`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 4, 'CHN', 'Chennai', 'Capital city of Tamil Nadu', 1, NULL, NULL, '2025-06-07 09:56:10', '2025-06-07 09:56:10', NULL),
(2, 4, 'MDU', 'Madurai', 'City known for Meenakshi Temple', 1, NULL, NULL, '2025-06-07 09:56:10', '2025-06-07 09:56:10', NULL),
(3, 4, 'CBE', 'Coimbatore', 'Major industrial city', 1, NULL, NULL, '2025-06-07 09:56:10', '2025-06-07 09:56:10', NULL),
(4, 4, 'TRV', 'Tiruvannamalai', 'City famous for Annamalaiyar Temple', 1, NULL, NULL, '2025-06-07 09:56:10', '2025-06-07 09:56:10', NULL),
(5, 4, 'TNJ', 'Tanjore', 'City known for Brihadeeswarar Temple', 1, NULL, NULL, '2025-06-07 09:56:10', '2025-06-07 09:56:10', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `country_master`
--

CREATE TABLE `country_master` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `country_code` varchar(10) NOT NULL,
  `country_name` varchar(100) NOT NULL,
  `description` text DEFAULT NULL,
  `created_by` bigint(20) UNSIGNED DEFAULT NULL,
  `updated_by` bigint(20) UNSIGNED DEFAULT NULL,
  `deleted_by` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `country_master`
--

INSERT INTO `country_master` (`id`, `country_code`, `country_name`, `description`, `created_by`, `updated_by`, `deleted_by`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'IN', 'India', 'Country in South Asia', 1, NULL, NULL, '2025-06-07 09:53:37', '2025-06-07 09:53:37', NULL),
(2, 'US', 'United States', 'Country in North America', 1, NULL, NULL, '2025-06-07 09:53:37', '2025-06-07 09:53:37', NULL),
(3, 'GB', 'United Kingdom', 'Country in Europe', 1, NULL, NULL, '2025-06-07 09:53:37', '2025-06-07 09:53:37', NULL),
(4, 'AU', 'Australia', 'Country in Oceania', 1, NULL, NULL, '2025-06-07 09:53:37', '2025-06-07 09:53:37', NULL),
(5, 'CA', 'Canada', 'Country in North America', 1, NULL, NULL, '2025-06-07 09:53:37', '2025-06-07 09:53:37', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `floor_master`
--

CREATE TABLE `floor_master` (
  `id` int(11) NOT NULL,
  `floor_no` varchar(50) NOT NULL,
  `floor_name` varchar(100) NOT NULL,
  `block_id` int(11) NOT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `deleted_by` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `floor_master`
--

INSERT INTO `floor_master` (`id`, `floor_no`, `floor_name`, `block_id`, `created_by`, `updated_by`, `deleted_by`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'F-101', 'First Floor', 1, 1, 1, NULL, '2025-06-06 11:50:28', '2025-06-07 05:34:14', '2025-06-07 05:34:14'),
(2, 'F-102', 'Second Floor', 1, 1, 1, NULL, '2025-06-06 11:50:37', '2025-06-07 05:34:14', '2025-06-07 05:34:14'),
(3, 'F-201', 'Third Floor', 2, 2, 2, NULL, '2025-06-06 11:50:37', '2025-06-07 05:34:15', '2025-06-07 05:34:15'),
(4, 'F-301', 'Fourth Floor', 4, 2, 2, NULL, '2025-06-06 06:33:16', '2025-06-07 05:34:15', '2025-06-07 05:34:15'),
(5, 'F-101', 'First Floor', 5, 1, 1, NULL, '2025-06-07 05:40:32', '2025-06-07 05:40:32', NULL),
(6, 'F-201', 'Second Floor', 5, 1, 1, NULL, '2025-06-07 05:41:05', '2025-06-07 05:41:05', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `gender_master`
--

CREATE TABLE `gender_master` (
  `id` int(11) NOT NULL,
  `gender_code` varchar(10) NOT NULL,
  `gender_name` varchar(20) NOT NULL,
  `is_active` tinyint(1) DEFAULT 1,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `deleted_by` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `gender_master`
--

INSERT INTO `gender_master` (`id`, `gender_code`, `gender_name`, `is_active`, `created_by`, `updated_by`, `deleted_by`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'M', 'Male', 1, 1, 1, NULL, '2025-06-09 10:35:23', '2025-06-09 10:35:23', NULL),
(2, 'F', 'Female', 1, 1, 1, NULL, '2025-06-09 10:35:23', '2025-06-09 10:35:23', NULL),
(3, 'O', 'Other', 1, 1, 1, NULL, '2025-06-09 10:35:23', '2025-06-09 10:35:23', NULL),
(4, 'U', 'Unspecified', 1, 1, 1, NULL, '2025-06-09 10:35:23', '2025-06-09 10:35:23', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `invoices`
--

CREATE TABLE `invoices` (
  `id` int(11) NOT NULL,
  `invoice_number` varchar(50) NOT NULL,
  `checkout_id` int(11) NOT NULL,
  `invoice_date` date NOT NULL,
  `due_date` date NOT NULL,
  `status` enum('Draft','Sent','Paid','Cancelled') NOT NULL DEFAULT 'Draft',
  `notes` text DEFAULT NULL,
  `terms` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `invoices`
--

INSERT INTO `invoices` (`id`, `invoice_number`, `checkout_id`, `invoice_date`, `due_date`, `status`, `notes`, `terms`, `created_at`, `updated_at`) VALUES
(1, 'INV-1749815940', 1, '2025-06-13', '2025-06-20', 'Sent', NULL, 'Payment due within 7 days', '2025-06-13 06:29:00', '2025-06-13 06:29:00'),
(2, 'INV-1749816783', 2, '2025-06-13', '2025-06-20', 'Paid', NULL, 'Payment due within 7 days', '2025-06-13 06:43:03', '2025-06-13 06:43:05'),
(4, 'INV-1749819460', 4, '2025-06-13', '2025-06-20', 'Paid', NULL, 'Payment due within 7 days', '2025-06-13 07:27:40', '2025-06-13 07:27:40');

-- --------------------------------------------------------

--
-- Table structure for table `invoice_items`
--

CREATE TABLE `invoice_items` (
  `id` int(11) NOT NULL,
  `invoice_id` int(11) NOT NULL,
  `item_type` enum('Room','Service','Tax','Discount','Other') NOT NULL,
  `description` varchar(255) NOT NULL,
  `quantity` decimal(10,2) NOT NULL DEFAULT 1.00,
  `unit_price` decimal(12,2) NOT NULL,
  `tax_rate` decimal(5,2) DEFAULT 0.00,
  `amount` decimal(12,2) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `invoice_items`
--

INSERT INTO `invoice_items` (`id`, `invoice_id`, `item_type`, `description`, `quantity`, `unit_price`, `tax_rate`, `amount`, `created_at`, `updated_at`) VALUES
(1, 1, 'Room', 'Room 505 - Standard Room', 1.00, 1100.00, 12.00, 978.00, '2025-06-13 06:29:00', '2025-06-13 06:29:00'),
(2, 1, 'Room', 'Room 104 - Executive Room', 1.00, 700.00, 12.00, 700.00, '2025-06-13 06:29:00', '2025-06-13 06:29:00'),
(3, 2, 'Room', 'Room 505 - Standard Room', 1.00, 1100.00, 12.00, 978.00, '2025-06-13 06:43:03', '2025-06-13 06:43:03'),
(4, 2, 'Room', 'Room 104 - Executive Room', 1.00, 700.00, 12.00, 700.00, '2025-06-13 06:43:03', '2025-06-13 06:43:03'),
(8, 4, 'Room', 'Room 505 - Standard Room', 1.00, 1100.00, 12.00, 978.00, '2025-06-13 07:27:40', '2025-06-13 07:27:40'),
(9, 4, 'Room', 'Room 104 - Executive Room', 1.00, 700.00, 12.00, 700.00, '2025-06-13 07:27:40', '2025-06-13 07:27:40');

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(255) NOT NULL,
  `payload` longtext NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `job_batches`
--

CREATE TABLE `job_batches` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `total_jobs` int(11) NOT NULL,
  `pending_jobs` int(11) NOT NULL,
  `failed_jobs` int(11) NOT NULL,
  `failed_job_ids` longtext NOT NULL,
  `options` mediumtext DEFAULT NULL,
  `cancelled_at` int(11) DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `finished_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '0001_01_01_000000_create_users_table', 1),
(2, '0001_01_01_000001_create_cache_table', 1),
(3, '0001_01_01_000002_create_jobs_table', 1),
(4, '2025_06_05_093134_create_personal_access_tokens_table', 2);

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `personal_access_tokens`
--

INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES
(10, 'App\\Models\\User', 1, 'authToken', 'f2f5019743df53a6f05deacbd3f3fa6498b95384dd79c66b2b1ebe09fc2b7168', '[\"*\"]', NULL, NULL, '2025-06-06 01:57:35', '2025-06-06 01:57:35'),
(21, 'App\\Models\\User', 3, 'authToken', 'd7d8af470a71386cdaebb1a6496ebe71a81284fec3cb24e15e336921152a10cc', '[\"*\"]', '2025-06-07 02:25:43', NULL, '2025-06-07 01:34:08', '2025-06-07 02:25:43'),
(26, 'App\\Models\\User', 1, 'authToken', '903c1123a705d8f9486c119a496c983a466726e9c3f377138188de7162de0ff4', '[\"*\"]', NULL, NULL, '2025-06-07 05:19:53', '2025-06-07 05:19:53'),
(27, 'App\\Models\\User', 1, 'authToken', 'c05b29c2b4445535f159b68c4de580238c96bf8085a282374f143151653f8fd4', '[\"*\"]', '2025-06-07 05:20:39', NULL, '2025-06-07 05:19:56', '2025-06-07 05:20:39'),
(28, 'App\\Models\\User', 1, 'authToken', 'd69237ece7ddb47ce1572b4eaef7e4f9af7e09ae5c39ababc9280baf9fa39084', '[\"*\"]', NULL, NULL, '2025-06-07 05:20:54', '2025-06-07 05:20:54'),
(29, 'App\\Models\\User', 1, 'authToken', 'b62eac3e22fff3188615c968a1917b19ad6a9087ec28d2bd8370b3dc885185cc', '[\"*\"]', NULL, NULL, '2025-06-07 05:20:56', '2025-06-07 05:20:56'),
(31, 'App\\Models\\User', 1, 'authToken', '64905b4d3b0ec5f791754157992bfaa4b6501bc4da8296f0e8204c1407440899', '[\"*\"]', '2025-06-09 07:44:18', NULL, '2025-06-07 06:49:43', '2025-06-09 07:44:18'),
(37, 'App\\Models\\User', 1, 'authToken', 'd89fa79fc868f14955acc49a2c718f020175fea52b0457a4a6f294d5878ab157', '[\"*\"]', NULL, NULL, '2025-06-11 23:14:47', '2025-06-11 23:14:47'),
(39, 'App\\Models\\User', 1, 'authToken', 'dea883144134d67fad2dddb81f5b408b78daefd5822f0fd2d09c0144a4f4840a', '[\"*\"]', '2025-06-13 07:27:43', NULL, '2025-06-12 05:54:06', '2025-06-13 07:27:43');

-- --------------------------------------------------------

--
-- Table structure for table `plans`
--

CREATE TABLE `plans` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `plan_name` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `rate_per_day` decimal(10,2) DEFAULT 0.00,
  `room_type_id` bigint(20) UNSIGNED DEFAULT NULL,
  `apply_gst` tinyint(1) DEFAULT 0,
  `apply_gst_on_sum` tinyint(1) DEFAULT 0,
  `apply_luxury_tax` tinyint(1) DEFAULT 0,
  `apply_service_tax` tinyint(1) DEFAULT 0,
  `complimentary_wifi` tinyint(1) DEFAULT 0,
  `complimentary_breakfast` tinyint(1) DEFAULT 0,
  `complimentary_lunch` tinyint(1) DEFAULT 0,
  `complimentary_dinner` tinyint(1) DEFAULT 0,
  `status` enum('Active','Inactive') DEFAULT 'Active',
  `created_by` bigint(20) UNSIGNED DEFAULT NULL,
  `updated_by` bigint(20) UNSIGNED DEFAULT NULL,
  `deleted_by` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `plans`
--

INSERT INTO `plans` (`id`, `plan_name`, `description`, `rate_per_day`, `room_type_id`, `apply_gst`, `apply_gst_on_sum`, `apply_luxury_tax`, `apply_service_tax`, `complimentary_wifi`, `complimentary_breakfast`, `complimentary_lunch`, `complimentary_dinner`, `status`, `created_by`, `updated_by`, `deleted_by`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, '1100 Plan', 'Standard room rent plan with all meals included and Wi-Fi.', 1100.00, 3, 1, 1, 0, 0, 1, 1, 1, 1, 'Active', 1, 1, NULL, '2025-06-07 09:34:18', '2025-06-07 09:34:18', NULL),
(2, '1100 Plan', 'Standard room rent plan with all meals included and complimentary services', 1100.00, 3, 1, 1, 0, 0, 1, 1, 1, 1, 'Active', 1, 1, NULL, '2025-06-07 09:34:18', '2025-06-07 09:34:18', NULL),
(3, '900 Plan', 'Budget plan with breakfast only', 900.00, 6, 1, 0, 0, 0, 1, 1, 0, 0, 'Active', 1, 1, NULL, '2025-06-08 03:30:00', '2025-06-08 03:30:00', NULL),
(4, '1500 Premium', 'Premium room plan with all taxes and services', 1500.00, 4, 1, 1, 1, 1, 1, 1, 1, 1, 'Active', 1, 1, NULL, '2025-06-08 04:30:00', '2025-06-08 04:30:00', NULL),
(5, '700 Economy', 'Economy plan with minimal services', 700.00, 6, 0, 0, 0, 0, 0, 1, 0, 0, 'Active', 1, 1, NULL, '2025-06-08 05:30:00', '2025-06-08 05:30:00', NULL),
(6, '2000 Deluxe', 'Deluxe plan with luxury tax and full meals', 2000.00, 3, 1, 1, 1, 0, 1, 1, 1, 1, 'Active', 1, 1, NULL, '2025-06-08 06:30:00', '2025-06-08 06:30:00', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `roomstatus_master`
--

CREATE TABLE `roomstatus_master` (
  `id` int(11) NOT NULL,
  `status_code` varchar(50) NOT NULL,
  `status_name` varchar(255) NOT NULL,
  `color_code` varchar(20) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `deleted_by` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `roomstatus_master`
--

INSERT INTO `roomstatus_master` (`id`, `status_code`, `status_name`, `color_code`, `created_by`, `updated_by`, `deleted_by`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'AVL', 'Available', '#a2d043', 1, 1, NULL, '2025-06-07 07:45:27', '2025-06-07 11:56:35', NULL),
(2, 'OCC', 'Occupied', '#DC3545', 1, 1, NULL, '2025-06-07 07:45:27', '2025-06-07 11:01:10', NULL),
(3, 'CLN', 'Cleaning', '#007BFF', 1, 1, NULL, '2025-06-07 07:45:27', '2025-06-07 11:01:02', NULL),
(4, 'DIR', 'Dirty', '#FFC107', 1, 1, NULL, '2025-06-07 12:09:01', '2025-06-07 12:09:01', NULL),
(5, 'MNT', 'Maintenance', '#6C757D', 1, 1, NULL, '2025-06-07 12:09:01', '2025-06-07 12:09:01', NULL),
(6, 'OOO', 'Out of Order', '#343A40', 1, 1, NULL, '2025-06-07 12:09:01', '2025-06-07 12:09:01', NULL),
(7, 'BLK', 'Blocked', '#9B59B6', 1, 1, NULL, '2025-06-07 12:09:01', '2025-06-07 12:12:27', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `roomtype_master`
--

CREATE TABLE `roomtype_master` (
  `id` int(11) NOT NULL,
  `room_type_code` varchar(10) NOT NULL,
  `display_order` int(11) DEFAULT 0,
  `room_type_name` varchar(100) NOT NULL,
  `default_plan_id` int(11) DEFAULT NULL,
  `wifi_plan_id` int(11) DEFAULT 0,
  `max_adult_pax` int(11) DEFAULT 0,
  `max_child_pax` int(11) DEFAULT 0,
  `max_extra_pax` int(11) DEFAULT 0,
  `negative_count` int(11) DEFAULT 0,
  `roomtype_status` enum('Active','Inactive') DEFAULT 'Active',
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `deleted_by` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `roomtype_master`
--

INSERT INTO `roomtype_master` (`id`, `room_type_code`, `display_order`, `room_type_name`, `default_plan_id`, `wifi_plan_id`, `max_adult_pax`, `max_child_pax`, `max_extra_pax`, `negative_count`, `roomtype_status`, `created_by`, `updated_by`, `deleted_by`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'DLX', 1, 'DELUXE ROOM', 1, 1, 1, 1, 1, 1, 'Inactive', 1, 1, NULL, '2025-06-07 04:14:48', '2025-06-07 05:34:21', '2025-06-07 05:34:21'),
(2, 'DLX', 1, 'DELUXE ROOM', 1, 10111, 1, 1, 1, 1, 'Active', 1, 1, NULL, '2025-06-07 05:41:49', '2025-06-07 05:42:07', '2025-06-07 05:42:07'),
(3, 'STD', 1, 'Standard Room', 1, 1, 2, 1, 1, 0, 'Active', 101, 101, NULL, '2025-06-07 11:12:58', '2025-06-07 11:12:58', NULL),
(4, 'DLX', 2, 'Deluxe Room', 1, 2, 3, 1, 1, 0, 'Active', 101, 1, NULL, '2025-06-07 11:12:58', '2025-06-07 05:43:13', NULL),
(5, 'SUT', 3, 'Suite Room', 1, 3, 4, 2, 2, 0, 'Inactive', 101, 1, NULL, '2025-06-07 11:12:58', '2025-06-07 05:43:24', NULL),
(6, 'EXC', 4, 'Executive Room', 1, 2, 3, 1, 2, 0, 'Active', 101, 1, NULL, '2025-06-07 11:12:58', '2025-06-07 05:43:17', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `room_master`
--

CREATE TABLE `room_master` (
  `id` int(11) NOT NULL,
  `room_no` varchar(10) NOT NULL,
  `display_order` int(11) NOT NULL,
  `floor_id` int(11) NOT NULL,
  `room_type_id` int(11) NOT NULL,
  `max_pax` int(11) NOT NULL DEFAULT 0,
  `max_extra_pax` int(11) NOT NULL DEFAULT 0,
  `status_id` int(11) NOT NULL,
  `is_active` tinyint(1) DEFAULT 1,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `deleted_by` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `room_master`
--

INSERT INTO `room_master` (`id`, `room_no`, `display_order`, `floor_id`, `room_type_id`, `max_pax`, `max_extra_pax`, `status_id`, `is_active`, `created_by`, `updated_by`, `deleted_by`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, '501', 1, 5, 3, 2, 1, 4, 1, 101, 101, NULL, '2025-06-07 11:23:53', '2025-06-13 03:33:05', NULL),
(2, '502', 2, 5, 4, 2, 1, 2, 1, 101, 101, NULL, '2025-06-07 11:23:53', '2025-06-10 06:21:43', NULL),
(3, '503', 3, 5, 5, 3, 2, 7, 1, 101, 101, NULL, '2025-06-07 11:23:53', '2025-06-12 07:35:15', NULL),
(4, '504', 4, 5, 6, 3, 2, 2, 1, 101, 101, NULL, '2025-06-07 11:23:53', '2025-06-07 11:23:53', NULL),
(5, '505', 5, 5, 3, 2, 1, 1, 1, 101, 101, NULL, '2025-06-07 11:23:53', '2025-06-13 07:27:40', NULL),
(6, '506', 6, 5, 4, 2, 1, 7, 1, 101, 101, NULL, '2025-06-07 11:23:53', '2025-06-12 07:39:24', NULL),
(7, '507', 7, 5, 5, 3, 2, 7, 1, 101, 101, NULL, '2025-06-07 11:23:53', '2025-06-12 07:41:18', NULL),
(8, '508', 8, 5, 6, 3, 2, 2, 1, 101, 101, NULL, '2025-06-07 11:23:53', '2025-06-07 11:23:53', NULL),
(9, '509', 9, 5, 3, 2, 1, 7, 1, 101, 101, NULL, '2025-06-07 11:23:53', '2025-06-12 07:44:01', NULL),
(10, '510', 10, 5, 4, 2, 1, 7, 1, 101, 101, NULL, '2025-06-07 11:23:53', '2025-06-12 07:45:31', NULL),
(11, '601', 11, 6, 5, 3, 2, 7, 1, 101, 101, NULL, '2025-06-07 11:23:53', '2025-06-12 07:47:52', NULL),
(12, '602', 12, 6, 6, 3, 2, 2, 1, 101, 101, NULL, '2025-06-07 11:23:53', '2025-06-07 11:23:53', NULL),
(13, '603', 13, 6, 3, 2, 1, 3, 1, 101, 101, NULL, '2025-06-07 11:23:53', '2025-06-07 11:50:00', NULL),
(14, '604', 14, 6, 4, 2, 1, 1, 1, 101, 101, NULL, '2025-06-07 11:23:53', '2025-06-07 11:23:53', NULL),
(15, '605', 15, 6, 5, 3, 2, 1, 1, 101, 101, NULL, '2025-06-07 11:23:53', '2025-06-07 11:23:53', NULL),
(16, '606', 16, 6, 6, 3, 2, 2, 1, 101, 101, NULL, '2025-06-07 11:23:53', '2025-06-07 11:23:53', NULL),
(17, '607', 17, 6, 3, 2, 1, 3, 1, 101, 101, NULL, '2025-06-07 11:23:53', '2025-06-07 11:50:03', NULL),
(18, '608', 18, 6, 4, 2, 1, 1, 1, 101, 101, NULL, '2025-06-07 11:23:53', '2025-06-07 11:23:53', NULL),
(19, '609', 19, 6, 5, 3, 2, 1, 1, 101, 101, NULL, '2025-06-07 11:23:53', '2025-06-07 11:23:53', NULL),
(20, '610', 20, 6, 6, 3, 2, 2, 1, 101, 101, NULL, '2025-06-07 11:23:53', '2025-06-07 11:23:53', NULL),
(21, '101', 1, 6, 5, 1, 1, 4, 1, 1, 1, NULL, '2025-06-07 06:39:35', '2025-06-07 06:39:35', NULL),
(22, '102', 2, 5, 4, 2, 1, 5, 1, 1, 1, NULL, '2025-06-07 06:39:56', '2025-06-07 06:39:56', NULL),
(23, '104', 3, 6, 6, 2, 1, 1, 1, 1, 1, NULL, '2025-06-07 06:40:13', '2025-06-13 07:27:40', NULL),
(24, '106', 1, 6, 4, 1, 2, 7, 1, 1, 1, NULL, '2025-06-07 06:40:37', '2025-06-07 06:40:37', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `segment_master`
--

CREATE TABLE `segment_master` (
  `id` int(11) NOT NULL,
  `segment_name` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `segment_master`
--

INSERT INTO `segment_master` (`id`, `segment_name`, `created_at`, `updated_at`) VALUES
(1, 'Retail', '2025-06-09 12:20:44', '2025-06-09 12:20:44'),
(2, 'Corporate', '2025-06-09 12:20:44', '2025-06-09 12:20:44'),
(3, 'SME', '2025-06-09 12:20:44', '2025-06-09 12:20:44'),
(4, 'Government', '2025-06-09 12:20:44', '2025-06-09 12:20:44');

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `payload` longtext NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `state_master`
--

CREATE TABLE `state_master` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `country_id` bigint(20) UNSIGNED NOT NULL,
  `state_code` varchar(10) NOT NULL,
  `state_name` varchar(100) NOT NULL,
  `description` text DEFAULT NULL,
  `created_by` bigint(20) UNSIGNED DEFAULT NULL,
  `updated_by` bigint(20) UNSIGNED DEFAULT NULL,
  `deleted_by` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `state_master`
--

INSERT INTO `state_master` (`id`, `country_id`, `state_code`, `state_name`, `description`, `created_by`, `updated_by`, `deleted_by`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 'AP', 'Andhra Pradesh', 'State in southern India', 1, NULL, NULL, '2025-06-07 09:54:46', '2025-06-07 09:54:46', NULL),
(2, 1, 'MH', 'Maharashtra', 'State in western India', 1, NULL, NULL, '2025-06-07 09:54:46', '2025-06-07 09:54:46', NULL),
(3, 1, 'KA', 'Karnataka', 'State in southern India', 1, NULL, NULL, '2025-06-07 09:54:46', '2025-06-07 09:54:46', NULL),
(4, 1, 'TN', 'Tamil Nadu', 'State in southern India', 1, NULL, NULL, '2025-06-07 09:54:46', '2025-06-07 09:54:46', NULL),
(5, 1, 'UP', 'Uttar Pradesh', 'State in northern India', 1, NULL, NULL, '2025-06-07 09:54:46', '2025-06-07 09:54:46', NULL),
(6, 1, 'WB', 'West Bengal', 'State in eastern India', 1, NULL, NULL, '2025-06-07 09:54:46', '2025-06-07 09:54:46', NULL),
(7, 1, 'RJ', 'Rajasthan', 'State in northwestern India', 1, NULL, NULL, '2025-06-07 09:54:46', '2025-06-07 09:54:46', NULL),
(8, 1, 'GJ', 'Gujarat', 'State in western India', 1, NULL, NULL, '2025-06-07 09:54:46', '2025-06-07 09:54:46', NULL),
(9, 1, 'PB', 'Punjab', 'State in northern India', 1, NULL, NULL, '2025-06-07 09:54:46', '2025-06-07 09:54:46', NULL),
(10, 1, 'KL', 'Kerala', 'State in southern India', 1, NULL, NULL, '2025-06-07 09:54:46', '2025-06-07 09:54:46', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `title_master`
--

CREATE TABLE `title_master` (
  `id` int(11) NOT NULL,
  `title_code` varchar(10) NOT NULL,
  `title_name` varchar(20) NOT NULL,
  `gender` enum('Male','Female','Other') DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT 1,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `deleted_by` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `title_master`
--

INSERT INTO `title_master` (`id`, `title_code`, `title_name`, `gender`, `is_active`, `created_by`, `updated_by`, `deleted_by`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'MR', 'Mr.', 'Male', 1, 101, 101, NULL, '2025-06-09 10:32:14', '2025-06-09 10:32:14', NULL),
(2, 'MRS', 'Mrs.', 'Female', 1, 101, 101, NULL, '2025-06-09 10:32:14', '2025-06-09 10:32:14', NULL),
(3, 'MS', 'Ms.', 'Female', 1, 101, 101, NULL, '2025-06-09 10:32:14', '2025-06-09 10:32:14', NULL),
(4, 'DR', 'Dr.', NULL, 1, 101, 101, NULL, '2025-06-09 10:32:14', '2025-06-09 10:32:14', NULL),
(5, 'PROF', 'Prof.', NULL, 1, 101, 101, NULL, '2025-06-09 10:32:14', '2025-06-09 10:32:14', NULL),
(6, 'MX', 'Mx.', 'Other', 1, 101, 101, NULL, '2025-06-09 10:32:14', '2025-06-09 10:32:14', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `is_admin` tinyint(1) NOT NULL DEFAULT 0,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `is_admin`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Admin', 'admin@gmail.com', NULL, '$2y$12$D8JKGHYWr4/jb.23Cjzl3ecuC1WNlgQ21ja4Mo25k3za7poL5j1Wu', 1, NULL, '2025-06-05 04:46:13', '2025-06-05 04:46:13'),
(2, 'Kalidass', 'kalidass@gmail.com', NULL, '$2y$12$Dh.Yu.I34og5sKA2YYpk8OY8Uq7q2wuauDKgtAMsopZx8nhp8TYQ2', 1, NULL, '2025-06-06 05:43:46', '2025-06-06 05:43:46'),
(3, 'Suresh', 'suresh@gmail.com', NULL, '$2y$12$lBsVFAakzBafsi3ssqInV.1WetHVr0ICqYix54bKBEW0U.O0bK.SS', 1, NULL, '2025-06-07 01:33:51', '2025-06-07 01:33:51');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `arrival_mode`
--
ALTER TABLE `arrival_mode`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `mode_code` (`mode_code`);

--
-- Indexes for table `block_master`
--
ALTER TABLE `block_master`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `block_rooms`
--
ALTER TABLE `block_rooms`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `business_source`
--
ALTER TABLE `business_source`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `checkin_master`
--
ALTER TABLE `checkin_master`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `checkin_room_trans`
--
ALTER TABLE `checkin_room_trans`
  ADD PRIMARY KEY (`id`),
  ADD KEY `checkin_id` (`checkin_id`);

--
-- Indexes for table `checkout_master`
--
ALTER TABLE `checkout_master`
  ADD PRIMARY KEY (`id`),
  ADD KEY `checkin_id` (`checkin_id`);

--
-- Indexes for table `checkout_payments`
--
ALTER TABLE `checkout_payments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `checkout_id` (`checkout_id`);

--
-- Indexes for table `city_master`
--
ALTER TABLE `city_master`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_state` (`state_id`);

--
-- Indexes for table `country_master`
--
ALTER TABLE `country_master`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `country_code` (`country_code`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `floor_master`
--
ALTER TABLE `floor_master`
  ADD PRIMARY KEY (`id`),
  ADD KEY `block_id` (`block_id`);

--
-- Indexes for table `gender_master`
--
ALTER TABLE `gender_master`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `gender_code` (`gender_code`);

--
-- Indexes for table `invoices`
--
ALTER TABLE `invoices`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `invoice_number` (`invoice_number`),
  ADD KEY `checkout_id` (`checkout_id`);

--
-- Indexes for table `invoice_items`
--
ALTER TABLE `invoice_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `invoice_id` (`invoice_id`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indexes for table `job_batches`
--
ALTER TABLE `job_batches`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `plans`
--
ALTER TABLE `plans`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `roomstatus_master`
--
ALTER TABLE `roomstatus_master`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `roomtype_master`
--
ALTER TABLE `roomtype_master`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `room_master`
--
ALTER TABLE `room_master`
  ADD PRIMARY KEY (`id`),
  ADD KEY `floor_id` (`floor_id`),
  ADD KEY `room_type_id` (`room_type_id`),
  ADD KEY `status_id` (`status_id`);

--
-- Indexes for table `segment_master`
--
ALTER TABLE `segment_master`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indexes for table `state_master`
--
ALTER TABLE `state_master`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_country` (`country_id`);

--
-- Indexes for table `title_master`
--
ALTER TABLE `title_master`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `title_code` (`title_code`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `arrival_mode`
--
ALTER TABLE `arrival_mode`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `block_master`
--
ALTER TABLE `block_master`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `block_rooms`
--
ALTER TABLE `block_rooms`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `business_source`
--
ALTER TABLE `business_source`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `checkin_master`
--
ALTER TABLE `checkin_master`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `checkin_room_trans`
--
ALTER TABLE `checkin_room_trans`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `checkout_master`
--
ALTER TABLE `checkout_master`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `checkout_payments`
--
ALTER TABLE `checkout_payments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `city_master`
--
ALTER TABLE `city_master`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `country_master`
--
ALTER TABLE `country_master`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `floor_master`
--
ALTER TABLE `floor_master`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `gender_master`
--
ALTER TABLE `gender_master`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `invoices`
--
ALTER TABLE `invoices`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `invoice_items`
--
ALTER TABLE `invoice_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT for table `plans`
--
ALTER TABLE `plans`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `roomstatus_master`
--
ALTER TABLE `roomstatus_master`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `roomtype_master`
--
ALTER TABLE `roomtype_master`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `room_master`
--
ALTER TABLE `room_master`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `segment_master`
--
ALTER TABLE `segment_master`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `state_master`
--
ALTER TABLE `state_master`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `title_master`
--
ALTER TABLE `title_master`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `checkin_room_trans`
--
ALTER TABLE `checkin_room_trans`
  ADD CONSTRAINT `checkin_room_trans_ibfk_1` FOREIGN KEY (`checkin_id`) REFERENCES `checkin_master` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `city_master`
--
ALTER TABLE `city_master`
  ADD CONSTRAINT `fk_state` FOREIGN KEY (`state_id`) REFERENCES `state_master` (`id`);

--
-- Constraints for table `floor_master`
--
ALTER TABLE `floor_master`
  ADD CONSTRAINT `floor_master_ibfk_1` FOREIGN KEY (`block_id`) REFERENCES `block_master` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `room_master`
--
ALTER TABLE `room_master`
  ADD CONSTRAINT `room_master_ibfk_1` FOREIGN KEY (`floor_id`) REFERENCES `floor_master` (`id`),
  ADD CONSTRAINT `room_master_ibfk_2` FOREIGN KEY (`room_type_id`) REFERENCES `roomtype_master` (`id`),
  ADD CONSTRAINT `room_master_ibfk_3` FOREIGN KEY (`status_id`) REFERENCES `roomstatus_master` (`id`);

--
-- Constraints for table `state_master`
--
ALTER TABLE `state_master`
  ADD CONSTRAINT `fk_country` FOREIGN KEY (`country_id`) REFERENCES `country_master` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
