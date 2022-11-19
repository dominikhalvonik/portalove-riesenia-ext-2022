-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Hostiteľ: 127.0.0.1:3308
-- Čas generovania: So 19.Nov 2022, 09:23
-- Verzia serveru: 8.0.18
-- Verzia PHP: 8.0.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Databáza: `portalove-riesenia`
--

-- --------------------------------------------------------

--
-- Štruktúra tabuľky pre tabuľku `game`
--

DROP TABLE IF EXISTS `game`;
CREATE TABLE IF NOT EXISTS `game` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(45) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `seo_url` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `seo_url_UNIQUE` (`seo_url`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Sťahujem dáta pre tabuľku `game`
--

INSERT INTO `game` (`id`, `title`, `seo_url`, `created_at`, `updated_at`) VALUES
(1, 'New Game', 'new-game', '2022-10-01 00:00:00', '2022-10-01 00:00:00');

-- --------------------------------------------------------

--
-- Štruktúra tabuľky pre tabuľku `game_attribute`
--

DROP TABLE IF EXISTS `game_attribute`;
CREATE TABLE IF NOT EXISTS `game_attribute` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `attribute_value` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `game_attribute_definition_id` int(11) NOT NULL,
  `game_id` int(11) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_game_attribute_game_attribute_definition_idx` (`game_attribute_definition_id`),
  KEY `fk_game_attribute_game1_idx` (`game_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Štruktúra tabuľky pre tabuľku `game_attribute_definition`
--

DROP TABLE IF EXISTS `game_attribute_definition`;
CREATE TABLE IF NOT EXISTS `game_attribute_definition` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) COLLATE utf8mb4_general_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_UNIQUE` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Štruktúra tabuľky pre tabuľku `game_img`
--

DROP TABLE IF EXISTS `game_img`;
CREATE TABLE IF NOT EXISTS `game_img` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `alt_name` varchar(45) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `path` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `game_id` int(11) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `path_UNIQUE` (`path`),
  KEY `fk_game_img_game1_idx` (`game_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Štruktúra tabuľky pre tabuľku `menu`
--

DROP TABLE IF EXISTS `menu`;
CREATE TABLE IF NOT EXISTS `menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `display_name` varchar(45) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `sys_name` varchar(45) COLLATE utf8mb4_general_ci NOT NULL,
  `path` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `sys_name_UNIQUE` (`sys_name`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Sťahujem dáta pre tabuľku `menu`
--

INSERT INTO `menu` (`id`, `display_name`, `sys_name`, `path`, `created_at`, `updated_at`) VALUES
(2, 'Home', 'home', 'index.php', '2022-10-01 08:35:25', '2022-10-01 08:35:25'),
(3, 'Browse', 'browse', 'browse.php', '2022-10-01 00:00:00', '2022-10-01 00:00:00'),
(4, 'Details', 'details', 'details.php', '2022-10-01 00:00:00', '2022-10-01 00:00:00'),
(5, 'Streams', 'streams', 'streams.php', '2022-10-01 00:00:00', '2022-10-01 00:00:00');

-- --------------------------------------------------------

--
-- Štruktúra tabuľky pre tabuľku `stream`
--

DROP TABLE IF EXISTS `stream`;
CREATE TABLE IF NOT EXISTS `stream` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `game_id` int(11) NOT NULL,
  `streamer_id` int(11) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_stream_game1_idx` (`game_id`),
  KEY `fk_stream_streamer1_idx` (`streamer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Štruktúra tabuľky pre tabuľku `streamer`
--

DROP TABLE IF EXISTS `streamer`;
CREATE TABLE IF NOT EXISTS `streamer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nickname` varchar(45) COLLATE utf8mb4_general_ci NOT NULL,
  `avatar` varchar(45) COLLATE utf8mb4_general_ci NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `nickname_UNIQUE` (`nickname`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Štruktúra tabuľky pre tabuľku `stream_attribute`
--

DROP TABLE IF EXISTS `stream_attribute`;
CREATE TABLE IF NOT EXISTS `stream_attribute` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `attribute_value` varchar(45) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `stream_id` int(11) NOT NULL,
  `stream_attribute_definition_id` int(11) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_stream_attribute_stream1_idx` (`stream_id`),
  KEY `fk_stream_attribute_stream_attribute_definition1_idx` (`stream_attribute_definition_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Štruktúra tabuľky pre tabuľku `stream_attribute_definition`
--

DROP TABLE IF EXISTS `stream_attribute_definition`;
CREATE TABLE IF NOT EXISTS `stream_attribute_definition` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) COLLATE utf8mb4_general_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_UNIQUE` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Štruktúra tabuľky pre tabuľku `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(200) COLLATE utf8mb4_general_ci NOT NULL,
  `password` varchar(200) COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Sťahujem dáta pre tabuľku `user`
--

INSERT INTO `user` (`id`, `username`, `password`) VALUES
(1, 'admin', 'b10f28a810504d6132057f5e76fecc8264c2289a');

--
-- Obmedzenie pre exportované tabuľky
--

--
-- Obmedzenie pre tabuľku `game_attribute`
--
ALTER TABLE `game_attribute`
  ADD CONSTRAINT `fk_game_attribute_game1` FOREIGN KEY (`game_id`) REFERENCES `game` (`id`),
  ADD CONSTRAINT `fk_game_attribute_game_attribute_definition` FOREIGN KEY (`game_attribute_definition_id`) REFERENCES `game_attribute_definition` (`id`);

--
-- Obmedzenie pre tabuľku `game_img`
--
ALTER TABLE `game_img`
  ADD CONSTRAINT `fk_game_img_game1` FOREIGN KEY (`game_id`) REFERENCES `game` (`id`);

--
-- Obmedzenie pre tabuľku `stream`
--
ALTER TABLE `stream`
  ADD CONSTRAINT `fk_stream_game1` FOREIGN KEY (`game_id`) REFERENCES `game` (`id`),
  ADD CONSTRAINT `fk_stream_streamer1` FOREIGN KEY (`streamer_id`) REFERENCES `streamer` (`id`);

--
-- Obmedzenie pre tabuľku `stream_attribute`
--
ALTER TABLE `stream_attribute`
  ADD CONSTRAINT `fk_stream_attribute_stream1` FOREIGN KEY (`stream_id`) REFERENCES `stream` (`id`),
  ADD CONSTRAINT `fk_stream_attribute_stream_attribute_definition1` FOREIGN KEY (`stream_attribute_definition_id`) REFERENCES `stream_attribute_definition` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
