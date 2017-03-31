-- Structuur van  tabel warden_checks wordt geschreven
CREATE TABLE IF NOT EXISTS `warden_checks` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Check ID from warden_checks',
  `groupid` smallint(5) unsigned NOT NULL COMMENT 'The Grouping ID of the warden_checks',
  `type` smallint(5) unsigned DEFAULT NULL COMMENT 'Check Type',
  `str` varchar(20) NOT NULL DEFAULT '',
  `data` varchar(48) NOT NULL DEFAULT '',
  `address` int(10) unsigned NOT NULL DEFAULT '0',
  `length` int(10) unsigned NOT NULL DEFAULT '0',
  `result` varchar(24) NOT NULL DEFAULT '',
  `result2` varchar(24) NOT NULL DEFAULT '',
  `build` smallint(5) unsigned NOT NULL COMMENT 'Client build',
  `comment` varchar(50) DEFAULT '' COMMENT 'Description of what the check is',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=1571 DEFAULT CHARSET=utf8;

-- Structuur van  tabel warden_penalty wordt geschreven
CREATE TABLE IF NOT EXISTS `warden_penalty` (
  `groupid` mediumint(9) NOT NULL,
  `action` smallint(6) DEFAULT NULL,
  `banTime` int(11) DEFAULT NULL,
  `reason` text,
  PRIMARY KEY (`groupid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
