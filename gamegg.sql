-- =================================================================
-- SQL Schema for GameGG MTA:SA RPG Gamemode
-- Version: 1.0
-- This script is robust and can be executed multiple times without error.
-- =================================================================

-- Step 1: Create the database `gamegg` if it does not already exist.
CREATE DATABASE IF NOT EXISTS `gamegg` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;

-- Step 2: Select the `gamegg` database for the subsequent commands.
USE `gamegg`;

-- Step 3: Create the `accounts` table if it does not already exist.
-- This table stores all player account information.
CREATE TABLE IF NOT EXISTS `accounts` (
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

-- Step 4: Create the `vehicles` table if it does not already exist.
-- This table stores all player-owned vehicles.
CREATE TABLE IF NOT EXISTS `vehicles` (
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

-- Step 5: Create the `bans` table if it does not already exist.
-- This table logs all banned players.
CREATE TABLE IF NOT EXISTS `bans` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `serial` varchar(50) NOT NULL,
  `admin` varchar(50) NOT NULL,
  `reason` text NOT NULL,
  `ban_date` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
