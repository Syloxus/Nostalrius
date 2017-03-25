-- --------------------------------------------------------
-- Host:                         192.168.1.140
-- Server versie:                5.5.5-10.1.11-MariaDB - mariadb.org binary distribution
-- Server OS:                    Win64
-- HeidiSQL Versie:              8.1.0.4545
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- Databasestructuur van nost_chars wordt geschreven
CREATE DATABASE IF NOT EXISTS `nost_chars` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `nost_chars`;


-- Structuur van  tabel nost_chars.cheats_raw wordt geschreven
CREATE TABLE IF NOT EXISTS `cheats_raw` (
  `account` int(11) DEFAULT NULL,
  `guid` int(11) DEFAULT NULL,
  `posx` float DEFAULT NULL,
  `posy` float DEFAULT NULL,
  `posz` float DEFAULT NULL,
  `map` int(11) DEFAULT NULL,
  `desyncMs` int(11) DEFAULT NULL,
  `desyncDist` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumpen data van tabel nost_chars.cheats_raw: ~0 rows (ongeveer)
/*!40000 ALTER TABLE `cheats_raw` DISABLE KEYS */;
/*!40000 ALTER TABLE `cheats_raw` ENABLE KEYS */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
