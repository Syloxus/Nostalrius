-- Structuur van  tabel cheats_raw wordt geschreven
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
