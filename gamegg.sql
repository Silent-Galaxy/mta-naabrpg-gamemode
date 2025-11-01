-- SQL Dump for a standard MTA:SA RPG Gamemode
-- version 1.0
-- https://your.dev.assistant

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `gamegg`
--

-- --------------------------------------------------------

--
-- ساختار جدول `accounts`
-- جدول اصلی برای نگهداری اطلاعات بازیکنان
--

CREATE TABLE `accounts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `serial` varchar(50) NOT NULL,
  `money` bigint(20) DEFAULT 500,
  `bank` bigint(20) DEFAULT 1000,
  `skin` int(3) DEFAULT 0,
  `level` int(5) DEFAULT 1,
  `xp` int(11) DEFAULT 0,
  `admin` int(2) DEFAULT 0,
  `last_login` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `serial` (`serial`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- ساختار جدول `vehicles`
-- جدول برای نگهداری اطلاعات وسایل نقلیه بازیکنان
--

CREATE TABLE `vehicles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `owner_id` int(11) NOT NULL,
  `model` int(4) NOT NULL,
  `pos_x` float NOT NULL,
  `pos_y` float NOT NULL,
  `pos_z` float NOT NULL,
  `rot_x` float NOT NULL,
  `rot_y` float NOT NULL,
  `rot_z` float NOT NULL,
  `health` float DEFAULT 1000,
  `fuel` float DEFAULT 100,
  `locked` tinyint(1) DEFAULT 1,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- ساختار جدول `bans`
-- جدول برای ثبت بازیکنان بن شده از سرور
--

CREATE TABLE `bans` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `serial` varchar(50) NOT NULL,
  `admin` varchar(50) NOT NULL,
  `reason` text NOT NULL,
  `ban_date` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
