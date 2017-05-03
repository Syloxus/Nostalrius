-- Structuur van  tabel warden_checks wordt geschreven
CREATE TABLE IF NOT EXISTS `warden_checks` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Check ID from warden_checks',
  `groupid` smallint(5) unsigned NOT NULL COMMENT 'The Grouping ID of the warden_checks',
  `type` smallint(5) unsigned DEFAULT NULL COMMENT 'Check Type',
  `str` varchar(20) NOT NULL DEFAULT '',
  `data` varchar(50) NOT NULL DEFAULT '',
  `address` int(10) unsigned NOT NULL DEFAULT '0',
  `length` int(10) unsigned NOT NULL DEFAULT '0',
  `result` varchar(50) NOT NULL DEFAULT '',
  `result2` varchar(50) NOT NULL DEFAULT '',
  `build` smallint(5) unsigned NOT NULL COMMENT 'Client build',
  `comment` varchar(50) DEFAULT '' COMMENT 'Description of what the check is',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=1563 DEFAULT CHARSET=utf8;

-- Dumpen data van tabel warden_checks: 5 rows
/*!40000 ALTER TABLE `warden_checks` DISABLE KEYS */;
INSERT IGNORE INTO `warden_checks` (`id`, `groupid`, `type`, `str`, `data`, `address`, `length`, `result`, `result2`, `build`, `comment`) VALUES
	(3, 3, NULL, '', '', 13090004, 4, '', '', 5875, 'playerBase - 0x00C7BCD4'),
	(2, 2, NULL, '', '', 0, 0, '', '', 5875, 'dynamic signature'),
	(1, 1, NULL, '', '', 0, 0, '', '', 5875, 'static signature'),
	(4, 4, NULL, '', '', 136, 4, '', '', 5875, 'pointer1 - 0x00000088'),
	(5, 5, NULL, '', '', 40, 4, '', '', 5875, 'playerMovementBase - 0x00000118');
/*!40000 ALTER TABLE `warden_checks` ENABLE KEYS */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
