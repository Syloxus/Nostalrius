/* 
* 20170104084343_world.sql 
*/ 
INSERT INTO `migrations` VALUES ('20170104084343');

-- fix Judgement of Command (should use melee hit/crit rules)
UPDATE `spell_mod` SET `DmgClass`='-1', `SpellFamilyName`='10', `Comment`='Judgement of Command (Rank 1) - SPELLFAMILY_PALADIN' WHERE `Id`='20467';
UPDATE `spell_mod` SET `DmgClass`='-1', `SpellFamilyName`='10', `Comment`='Judgement of Command (Rank 2) - SPELLFAMILY_PALADIN' WHERE `Id`='20963';
UPDATE `spell_mod` SET `DmgClass`='-1', `SpellFamilyName`='10', `Comment`='Judgement of Command (Rank 3) - SPELLFAMILY_PALADIN' WHERE `Id`='20964';
UPDATE `spell_mod` SET `DmgClass`='-1', `SpellFamilyName`='10', `Comment`='Judgement of Command (Rank 4) - SPELLFAMILY_PALADIN' WHERE `Id`='20965';
UPDATE `spell_mod` SET `DmgClass`='-1', `SpellFamilyName`='10', `Comment`='Judgement of Command (Rank 5) - SPELLFAMILY_PALADIN' WHERE `Id`='20966';

-- remove SP scaling from Storm Gauntlets, Fiery Plate Gauntlets, Blazefury Medallion and Fiery Retributer 
REPLACE INTO `spell_bonus_data` (`entry`, `direct_bonus`, `dot_bonus`, `ap_bonus`, `ap_dot_bonus`, `comments`) VALUES ('7712', '0', '0', '0', '0', 'Fiery Retribution - no scaling'); 
REPLACE INTO `spell_bonus_data` (`entry`, `direct_bonus`, `dot_bonus`, `ap_bonus`, `ap_dot_bonus`, `comments`) VALUES ('7714', '0', '0', '0', '0', 'Fiery Plate Gauntlets - no scaling'); 
REPLACE INTO `spell_bonus_data` (`entry`, `direct_bonus`, `dot_bonus`, `ap_bonus`, `ap_dot_bonus`, `comments`) VALUES ('16614', '0', '0', '0', '0', 'Storm Gauntlets - no scaling'); 
DELETE FROM `spell_effect_mod` WHERE `Id`='16614' and`EffectIndex`='0'; 
-- don't allow 100% proc chance spells to proc further triggers e.g. Vengeance 
REPLACE INTO `spell_mod` (`Id`, `AttributesEx3`, `Comment`) VALUES ('16614', '65536', 'Storm Gauntlets - don\'t trigger procs'); 
REPLACE INTO `spell_mod` (`Id`, `AttributesEx3`, `Comment`) VALUES ('7712', '65536', 'Fire Strike - don\'t trigger procs'); 
REPLACE INTO `spell_mod` (`Id`, `AttributesEx3`, `Comment`) VALUES ('7714', '65536', 'Fire Strike - don\'t trigger procs'); 
 
 
/* 
* 20170104090513_world.sql 
*/ 
INSERT INTO `migrations` VALUES ('20170104090513');

-- Gnomish Death Ray - ignore armor and self-invulnerability
REPLACE INTO `spell_mod` VALUES
('13278', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '536870912', '-1', '-1', '-1', '-1', '32', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '0', 'Gnomish Death Ray charge - ignore armor and immunities'),
('13279', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '2097152', '-1', '-1', '262144', '-1', '32', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '2', '-1', '-1', '-1', '-1', '0', 'Gnomish Death Ray cast - ignore armor and deal melee physical damage');
REPLACE INTO `spell_effect_mod` VALUES 
('13278', '0', '-1', '-1', '-1', '-1', '-1', '-1', '900', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '0', '-1', 'Gnomish Death Ray - fix Amplitude of periodic trigger'),
('13278', '2', '6', '1', '0', '0', '0', '149', '1000', '0', '0', '0', '0', '1', '0', '0', '3', '0', '0', '0', 'Gnomish Death Ray - damage over time');
-- no scaling
REPLACE INTO `spell_bonus_data` (`entry`, `direct_bonus`, `dot_bonus`, `ap_bonus`, `ap_dot_bonus`, `comments`) VALUES ('13279', '0', '0', '0', '0', 'Death Ray');
 
 
/* 
* 20170105042752_world.sql 
*/ 
INSERT INTO `migrations` VALUES ('20170105042752'); 

-- correct far away summons
REPLACE INTO `spell_effect_mod` (`Id`, `EffectIndex`, `EffectRadiusIndex`, `EffectMiscValue`, `Comment`) VALUES 
(126, 0, 13, -1, 'Generic - reduce 100 yards summon distance'),
(29234, 0, 13, -1, 'Generic - reduce 100 yards summon distance'),
(11403, 0, 13, -1, 'Generic - reduce 100 yards summon distance'),
(21287, 0, 13, -1, 'Generic - reduce 100 yards summon distance');

-- adjust Eye of Kilrogg
UPDATE `creature_template` SET `unit_flags` = 512, `mechanic_immune_mask` = 902267455, `flags_extra` = 310, `ScriptName` = 'npc_eye_of_kilrogg' WHERE (`entry` = 4277);
 
 
/* 
* 20170105071719_world.sql 
*/ 
INSERT INTO `migrations` VALUES ('20170105071719');

-- remove spell scaling from many item procs
REPLACE INTO `spell_bonus_data` VALUES
('6297', '0', '0', '0', '0', 'Fiery Blaze - no scaling'),
('13897', '0', '0', '0', '0', 'Fiery Weapon - no scaling'),
('14795', '0', '0', '0', '0', 'Venomhide Poison - no scaling'),
('18374', '0', '0', '0', '0', 'Cloak of Fire - no scaling'),
('20004', '0', '0', '0', '0', 'Lifestealing - no scaling'),
('22600', '0', '0', '0', '0', 'Force Reactive Disk - no scaling');
 
 
/* 
* 20170105071928_world.sql 
*/ 
INSERT INTO `migrations` VALUES ('20170105071928');

-- dm n. link some packs together
REPLACE INTO `creature_groups` VALUES
('134810', '134831', '0', '0', '2'),
('134810', '134857', '0', '0', '2'),
('134788', '134789', '0', '0', '2'),
('134803', '134830', '0', '0', '2'),
('134803', '134868', '0', '0', '2'),
('134819', '134862', '0', '0', '2'),
('134870', '134817', '0', '0', '2'),
('134881', '134876', '0', '0', '2'),
('134881', '134875', '0', '0', '2'),
('134880', '134879', '0', '0', '2');
 
 
/* 
* 20170105072151_world.sql 
*/ 
INSERT INTO `migrations` VALUES ('20170105072151');

-- slightly lower chromaggus run speed 
UPDATE `creature_template` SET `speed_run`='1.95' WHERE `entry`='14020';
 
 
/* 
* 20170105073851_world.sql 
*/ 
INSERT INTO `migrations` VALUES ('20170105073851');

-- fix Whip Lasher HP (source: wow bestiary)
UPDATE `creature_template` SET `minlevel`='54', `minhealth`='1900', `maxhealth`='1900' WHERE `entry`='13022';
-- fix Gordok Mastiff loot drop rates (source: allakhazam)
UPDATE `creature_loot_template` SET `ChanceOrQuestChance`='28.37' WHERE `entry`='13036' and`item`='18237';
UPDATE `creature_loot_template` SET `ChanceOrQuestChance`='15.24' WHERE `entry`='13036' and`item`='18236';
UPDATE `creature_loot_template` SET `ChanceOrQuestChance`='3.37' WHERE `entry`='13036' and`item`='8146';
-- fix Carrion Swarmer drop rates
UPDATE `creature_loot_template` SET `ChanceOrQuestChance`='46.01' WHERE `entry`='13160' and`item`='6302';
UPDATE `creature_loot_template` SET `ChanceOrQuestChance`='30.8' WHERE `entry`='13160' and`item`='6300';
-- Carrion Swarmers aren't supposed to be skinnable
UPDATE `creature_template` SET `skinloot`='0' WHERE `entry`='13160';
 
 
/* 
* 20170105074859_world.sql 
*/ 
INSERT INTO `migrations` VALUES ('20170105074859');

-- ZF: Scarabs aren't skinnable
UPDATE `creature_template` SET `skinloot`='0' WHERE `entry`='7269';
 
 
/* 
* 20170105075655_world.sql 
*/ 
INSERT INTO `migrations` VALUES ('20170105075655');

-- fix several mobs with the wrong minlevel
UPDATE `creature_template` SET `minlevel`='52', `minhealth`=`maxhealth` WHERE `entry`='10043';
UPDATE `creature_template` SET `minlevel`='60', `minhealth`=`maxhealth` WHERE `entry`='11374';
UPDATE `creature_template` SET `minlevel`='60', `minhealth`=`maxhealth` WHERE `entry`='11365';
UPDATE `creature_template` SET `minlevel`='61' WHERE `entry`='11338';
UPDATE `creature_template` SET `minlevel`='60' WHERE `entry`='15043';
UPDATE `creature_template` SET `minlevel`='30' WHERE `entry`='3297';
UPDATE `creature_template` SET `minlevel`='60' WHERE `entry`='15546';
UPDATE `creature_template` SET `minlevel`='17' WHERE `entry`='122';
UPDATE `creature_template` SET `minlevel`='20' WHERE `entry`='15723';
 
 
/* 
* 20170106040230_world.sql 
*/ 
INSERT INTO `migrations` VALUES ('20170106040230');

-- nature's grace procflags (don't proc off melee spells)
UPDATE `spell_proc_event` SET `procFlags`='87040' WHERE `entry`='16880';
 
 
/* 
* 20170106072108_world.sql 
*/ 
INSERT INTO `migrations` VALUES ('20170106072108');

-- fix possible method to stuck windsor escort
UPDATE `creature_template` SET `npcflag`='0' WHERE `entry` in (9022, 9679);

-- only let windsor open his supply room
UPDATE `gameobject_template` SET `faction`='114' WHERE `entry`='170561';

-- fix windsor's frenzy aura, kinda hacky but okay
REPLACE INTO spell_effect_mod VALUES
('15167', '0', '6', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '0', '-1', 'Windsor\'s Frenzy');
REPLACE INTO spell_mod VALUES
('15167', '-1', '-1', '-1', '2', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '0', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '0', 'Windsor\'s Frenzy - 30s duration');
 
 
/* 
* 20170106072541_world.sql 
*/ 
INSERT INTO `migrations` VALUES ('20170106072541');

-- import magister kalendris script
UPDATE `creature_template` SET `AIName`='', `ScriptName`='boss_magister_kalendris' WHERE `entry`='11487';
 
 
/* 
* 20170106082142_world.sql 
*/ 
INSERT INTO `migrations` VALUES ('20170106082142');

-- fix npcflags of theramore and wetlands vendors selling horses to non-exalted non-humans
UPDATE `creature_template` SET `npcflag`='7' WHERE `entry`='4885';
UPDATE `creature_template` SET `npcflag`='7' WHERE `entry`='1460';
 
 
/* 
* 20170106093057_world.sql 
*/ 
INSERT INTO `migrations` VALUES ('20170106093057');

-- insert gahz'ranka creature guid
REPLACE INTO `creature` (`guid`, `id`, `map`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`, `spawnFlags`)
VALUES ('2530122', '15114', '309', '15288', '0', '-11673.35', '-1726.283', '-5.911', '4.29', '259200', '0', '0', '396000', '396000', '0', '0', '0');
-- remove event_scripts event
DELETE FROM event_scripts WHERE id = 9104;
-- add scripted_event
REPLACE INTO `scripted_event_id` (`id`, `ScriptName`) VALUES ('9104', 'event_summon_gahzranka');
-- fix bobber positioning
UPDATE `spell_target_position` SET `target_position_x`='-11682.76', `target_position_y`='-1713.3712', `target_position_z`='8.7727' WHERE `id`='24325';
-- increase gahz'ranka walk speed
UPDATE `creature_template` SET `speed_walk`='1.35' WHERE `entry`='15114';
-- give mudskunk lure an hour CD
UPDATE `item_template` SET `spellcooldown_1`='3600000' WHERE `entry`='19974';
 
 
/* 
* 20170106100635_world.sql 
*/ 
INSERT INTO `migrations` VALUES ('20170106100635');

-- fix barov peasant caller damage
UPDATE `creature_template` SET `mindmg`='65', `maxdmg`='70' WHERE `entry`='11636';
UPDATE `creature_template` SET `mindmg`='65', `maxdmg`='70' WHERE `entry`='11637';
 
 
/* 
* 20170106112109_world.sql 
*/ 
INSERT INTO `migrations` VALUES ('20170106112109');

-- npc_creeping_doom script
UPDATE `creature_template` SET `ScriptName`='npc_creeping_doom' WHERE `entry`='14761';
-- add can't block flags to simone, precious, and solenor
UPDATE `creature_template` SET `flags_extra`='16' WHERE `entry`='14533';
UPDATE `creature_template` SET `flags_extra`='16' WHERE `entry`='14538';
UPDATE `creature_template` SET `flags_extra`='4112' WHERE `entry`='14530';
 
 
/* 
* 20170106164137_world.sql 
*/ 
INSERT INTO `migrations` VALUES ('20170106164137'); 

-- specify pool instance for drawn maps
ALTER TABLE `pool_template` ADD COLUMN `instance` MEDIUMINT(8) NOT NULL DEFAULT 0;
 
 
/* 
* 20170106164931_world.sql 
*/ 
INSERT INTO `migrations` VALUES ('20170106164931');

-- shared thekal emotes
REPLACE INTO `script_texts` (`entry`, `content_default`, `type`, `comment`) VALUES ('-1309027', '%s dies.', '2', 'thekal EMOTE_DIES');
REPLACE INTO `script_texts` (`entry`, `content_default`, `type`, `comment`) VALUES ('-1309028', '%s is resurrected by a nearby ally!', '2', 'thekal EMOTE_RESURRECT');

-- link thekal pull
REPLACE INTO `creature_groups` (`leaderGUID`, `memberGUID`, `dist`, `angle`, `flags`) VALUES ('49310', '49313', '0', '0', '2');
REPLACE INTO `creature_groups` (`leaderGUID`, `memberGUID`, `dist`, `angle`, `flags`) VALUES ('49310', '49314', '0', '0', '2');
REPLACE INTO `creature_groups` (`leaderGUID`, `memberGUID`, `dist`, `angle`, `flags`) VALUES ('49310', '49312', '0', '0', '2');
REPLACE INTO `creature_groups` (`leaderGUID`, `memberGUID`, `dist`, `angle`, `flags`) VALUES ('49310', '49311', '0', '0', '2');

-- link some croc packs
REPLACE INTO creature_groups VALUES
('49709', '49707', '15.3211', '12.5667', '2'),
('49709', '49708', '20.7756', '12.7878', '2'),
('49709', '49706', '9.40126', '4.239', '2'),
('91514', '91516', '9.30395', '6.38664', '2'),
('91514', '91517', '3.19625', '11.9109', '2'),
('91514', '91515', '10.6955', '8.45393', '2'),
('91514', '91513', '5.09392', '5.42491', '2');
 
 
/* 
* 20170106165807_world.sql 
*/ 
INSERT INTO `migrations` VALUES ('20170106165807');

-- Update some resistance values from WoW Bestiary
-- Lucifron
UPDATE `creature_template` SET `resistance2`='93', `resistance5`='186' WHERE `entry`='12118';
-- Gehennas
UPDATE `creature_template` SET `resistance2`='186', `resistance5`='93' WHERE `entry`='12259';
-- Shazzrah
UPDATE `creature_template` SET `resistance2`='93', `resistance6`='186' WHERE `entry`='12264';
-- Golemagg
UPDATE `creature_template` SET `resistance2`='186' WHERE `entry`='11988';
-- Onyxia's Elite Guards
UPDATE `creature_template` SET `resistance2`='150' WHERE `entry`='12739';
 
 
/* 
* 20170106165858_world.sql 
*/ 
INSERT INTO `migrations` VALUES ('20170106165858');

-- low level quest object DRSS
UPDATE gameobject SET spawnflags = 8 WHERE guid in ('29992','29991','29988','1380','29986','29648','7026','9417','10027','10119','10122','10130','10131','10134','10140','10164','10168','10169','10177','10178','10181','10182','10193','10663','10868','15211','14628','14561','14560','14559','14558','14557','14556','14555','13610','13603','13478','13291','13288','13287','13286','13247','13019','13017','12863','26242','26752','26753','26754','26755','26757','26758','26759','26760','26761','26762','26763','26764','26767','27023','27024','27025','27026','27027','27030','27031','27032','27033','27034','27035','27041','27058','27082','27085','29278','29280','29283','29583','29636','30658','30663','30664','30665','30666','30667','30668','30672','30698','30700','30703','30713','30717','30718','30719','30720','30721','32168','32169','33422','33423','33424','33837','33838','33840','33843','34799','34802','34805','34806','34900','34901','42653','42654','42655','42656','42657','42658','42659','42660','42661','42699','42700','42701','42702','42703','42704','42705','42722','42723','42724','42725','42726','42727','42728','42729','42730','42742','42743','42744','42745','42746','42747','42768','42769','42770','42771','42772','42773','42774','42776','42777','42778','42781','42787','42790','42791','42792','45005','45006','45007','45031','45032','45042','45043','45063','45064','45066','45067','45068','45070','45071','45072','45111','45112','45131','45145','45146','45147','45148','45149','45150','45151','45152','45153','45154','45155','45156','45157','45167','45169','45173','45174','45178','45179','45181','45182','45183','45184','45185','45186','45187','45188','45189','45190','45191','45192','45193','45194','45195','45196','45197','45198','45199','45200','45201','45202','45203','45204','45205','45206','45207','45210','45211','45212','45214','45215','45216','45217','45218','45226','45231','45232','45233','45234','45235','45236','45237','45241','45243','45246','45247','45248','45249','45250','45252','45253','45255','45258','45262','45263','45264','45265','45266','45268','45269','45270','45273','45274','45275','45276','45277','45278','45279','45280','45281','45282','45283','45284','45286','45287','45289','45290','45291','45292','45293','45294','54949','44659','44657','44656','44655','44654','44653','44652','44651','44650','44649','44646','44645','44644','44643','44641','44640','42098','42040','42039','40727','40726','40725','40724','40723','33525','33524','33519','33518','32879','32877','32876','32875','32874','32873','32872','32864','18707','18706','18705','18704','18703','18702','18697','18696','18695','18692','18690','18689','18688','18687','18686','18685','17197','17196','16672','16671','16670','16669','16668','16667','16666','16665','16664','15720','15718','15717','15716','15715','15714','15713','15712','15711','15710','15709','13420','13419','13418','13417','13416','13415','13414','13413','13412','13411','13410','13409','13408','13295','13290','13277','13276','13275','13274','13273','13272','13271','13270','13269','13268','13267','13266','13265','13264','13251','13244','13243','13242','13241','13237','13236','13235','13207','13206','13205','13204','13202','13201','13200','13198','13196','13194','13192','13191','12668','12667','12666','12665','12646','12644','12643','12640','12639','12638','12629','12627','12623','12620','12619','12593','12592','12591','12590','12589','12588','12565','12563','12562','12561','12560','12559','12558','12557','12556','12555','12554','12515','12514','12513','12512','12511','12510','12509','12508','12507','12506','12457','12446','12445','12444','12442','12441','12440','12434','12433','12432','12431','12430','12429','12428','12427','12426','12425','12424','12423','12422','12421','12420','12418','12417','12416','12415','12414','12413','12412','12411','12410','12409','12408','12407','12406','12405','12404','12206','12204','12203','12202','12200','12199','12198','12197','47625','47626','47627','47628','47629','47630','47631','47632','47633','47634','47635','47636','47637','47638','47639','47640','47641','47642','47643','47645','47646','47647','47648','47649','47650','47651','47652','47653','47654','47655','47656','47657','47658','47659','47660','47661','47662','47663','47700','47701','47702','47703','47704','47705','47706','47708','47709','47710','47711','47874','47875','47876','47877','47878','47879','47880','47881','47882','47883','47884','47885','47886','47887','47888','47889','47890','47891','47905','47995','47996','47997','47998','47999','48000','48001','48002','48147','48148','48149','48150','48151','48152','48153','48154','48155','48156','48157','48158','48159','48160','48161','48527','48637','48639','48643','48672','48673','48674','48675','48677','48678','48679','48680','48683','48684','48688','48692','48693','48694','48696','48745','48746','48749','48750','48753','48754','48755','48776','48778','48779','48780','48781','48782','48783','48784','48788','48793','48794','48795','48796','49467','49468','49469','49470','49471','49472','49473','49474','49475','49476','49477','49478','49479','49480','49481','49482','49483','49484','49485','49486','49487','49488','49489','49490','49491','49492','49493','49494','49495','49496','49497','49498','49499','49533','49534','49535','49536','49537','49538','49539','49540','49541','49542','49543','49544','49545','49546','49547','49548','49549','49550','49551','49552','49553','49554','49555','49556','49557','49558','49559','49560','49561','49562','49563','49564','49565','49566','49567','49568','49569','49570','49589','49590','49591','49593','49595','49596','49739','49740','49741','49742','49743','49744','49745','49746','49747','49748','49749','49750','49751','49752','49753','49754','49755','49756','49757','49758','49759','49760','49761','49762','49763','49764','49765','49766','49767','49768','49769','49770','49771','49772','49773','49774','49775','49776','49777','49778','49779','49780','49781','49782','49783','49784','49785','49786','49787','49788','49789','49790','49791','49792','49793','49794','49795','49796','49797','49798','49799','49800','49808','49828','30785','30784','30744','30743','30742','30741','30740','30739','30643','30642','31041','30636','30635','30606','30605','30604','30601','30598','30597','30594','30593','30587','30586','30585','30584','30583','30561','30559','31040','30556','31036','31035','31024','30549','396275','396283','30543','30542','30541','30383','396282','30380','30378','30375','396281','396280','30369','29680','29362','30824','30825','30867','30876','30880','30927','30928','30975','30977','30980','30981','30986','30998','31003','31004','31005','31006','31009','396279','31029','396278','396277','31039','396276','30638','31383','31379','31378','31377','31375','31374','31369','31368','31367','31365','31360','31359','31356','31350','31349');

 
 
/* 
* 20170106201803_world.sql 
*/ 
INSERT INTO `migrations` VALUES ('20170106201803'); 

-- Stranglethorn Fishing Extravaganza
-- adjust promoters
UPDATE `creature` SET `orientation` = 4.75 WHERE `guid` = 54742;
INSERT IGNORE INTO `creature` VALUES (NULL, 15119, 0, 0, 0, -4965.1, -934.93, 501.66, 5.56, 550, 0, 0, 3517, 0, 0, 0, 0);
INSERT IGNORE INTO `game_event_creature` VALUES ((SELECT `guid` FROM `creature` WHERE `id` = 15119), 14);
REPLACE INTO `game_event_quest` VALUES
(8228, 14),
(8229, 14);

-- adjust event timers
UPDATE `game_event` SET `start_time` = '2017-01-07 09:00:00', `end_time` = '2027-01-01 00:00:00', `length` = 1920 WHERE `entry` = 14;
UPDATE `game_event` SET `start_time` = '2017-01-08 14:00:00', `end_time` = '2027-01-01 00:00:00', `description` = 'Stranglethorn Fishing Extravaganza: Tournament' WHERE `entry` = 15;
UPDATE `game_event` SET `start_time` = '2017-01-08 12:00:00', `end_time` = '2027-01-01 00:00:00', `length` = 300, `description` = 'Stranglethorn Fishing Extravaganza: The Crew' WHERE `entry` = 40;

-- remove old junk
DELETE FROM `creature_ai_scripts` WHERE `creature_id` IN (987658, 987659);
DELETE FROM `creature` WHERE `id` IN (987659, 987658);
DELETE FROM `game_event_creature` WHERE `guid` IN (1173165, 1173167);
DELETE FROM `creature_template` WHERE `entry` IN (987659, 987658);
DELETE FROM `game_event` WHERE `entry` = 41;
DELETE FROM `quest_end_scripts` WHERE `id` = 8193;
UPDATE `quest_template` SET `CompleteScript` = 0 WHERE `entry` = 8193;

-- create new junk
UPDATE `game_event_creature` SET `event` = 40 WHERE `guid` = 1173164;
UPDATE `creature_template` SET `npcflag` = 0, `ScriptName` = 'npc_riggle_bassbait' WHERE `entry` = 15077;
REPLACE INTO `game_event_quest` VALUES (8193, 15);
UPDATE `pool_template` SET `instance` = 6 WHERE `entry` = 4000;
REPLACE INTO `game_event_quest` VALUES
(8221, 40),
(8224, 40),
(8225, 40),
(8194, 40);
REPLACE INTO `variables` VALUES (30023, 1, '');
 
 
/* 
* 20170106235324_world.sql 
*/ 
INSERT INTO `migrations` VALUES ('20170106235324'); 

-- database cleanup
UPDATE `creature_template` SET `ScriptName` = '' WHERE `entry` IN (6031, 6142, 6410, 6411, 7792, 8383);
DELETE FROM `creature_template` WHERE `entry` BETWEEN 19996 AND 20001;
DELETE FROM `creature_template` WHERE `entry` IN (55001, 55011, 55021, 55031, 55041, 55051);
DROP TABLE `playerlowstart_spell`;
DROP TABLE `playerstart_equip`;
DROP TABLE `playerstart_equip2`;
DROP TABLE `playerstart_equip3`;
DROP TABLE `playerstart_spell`;
 
 
/* 
* 20170107002441_world.sql 
*/ 
INSERT INTO `migrations` VALUES ('20170107002441'); 

DELETE FROM `gameobject_template` WHERE `entry` = 177260;
 
 
/* 
* 20170107012601_world.sql 
*/ 
INSERT INTO `migrations` VALUES ('20170107012601'); 

-- startup errors cleansing
UPDATE `item_template` SET `stackable` = 200 WHERE `entry` = 20086;
DELETE FROM `item_template` WHERE `entry` > 50000;
UPDATE `creature` SET `spawndist` = 0 WHERE `MovementType` = 0 AND `spawndist` <> 0;
DELETE FROM `creature_groups` WHERE `leaderGUID` NOT IN (SELECT `guid` FROM `creature`);
DELETE FROM `creature_groups` WHERE `memberGUID` NOT IN (SELECT `guid` FROM `creature`);
DELETE FROM `creature_addon` WHERE `guid` NOT IN (SELECT `guid` FROM `creature`);
DELETE FROM `creature_questrelation` WHERE `id` NOT IN (SELECT `entry` FROM `creature_template`);
DELETE FROM `creature_movement` WHERE `id` NOT IN (SELECT `guid` FROM `creature`);
UPDATE `creature_template` SET `ScriptName` = '' WHERE `ScriptName` LIKE 'NULL';
 
 
/* 
* 20170107111232_world.sql 
*/ 
INSERT INTO `migrations` VALUES ('20170107111232');

UPDATE creature_template SET ScriptName="npc_shahram", AIName="" WHERE entry=10718;

INSERT INTO `spell_effect_mod`  VALUES (16602,	0,	42,	1,	1,	0,	0,	0,	0,	0,	0,	0,	0,	1,	0,	13,	0,	0,	10718,	0,	'Summon Shahram');

 
 
/* 
* 20170107132432_world.sql 
*/ 
INSERT INTO `migrations` VALUES ('20170107132432');

-- fix Blackout proc flags
-- proc on all shadow tree spells, including silence and vampiric embrace, but only on initial application of SW:P and the first tick of Mind Flay
REPLACE INTO spell_proc_event VALUES
('15268', '0', '0', '2256576516', '0', '0', '65536', '524291', '0', '0', '0');
 
 
/* 
* 20170107133556_world.sql 
*/ 
INSERT INTO `migrations` VALUES ('20170107133556'); 

-- startup errors cleansing
UPDATE `creature_template` SET `ScriptName` = 'generic_spell_ai' WHERE `entry` = 9718;
UPDATE `creature` SET `spawndist` = 10 WHERE `MovementType` = 1 AND `spawndist` = 0;
UPDATE `creature` cr, `creature_template` ct SET cr.`curhealth` = ct.`maxhealth` WHERE cr.`curhealth` < ct.`minhealth` AND cr.`id` = ct.`entry` AND ct.`RegenHealth` > 0;
UPDATE `creature` cr, `creature_template` ct SET cr.`curmana` = ct.`maxmana` WHERE cr.`curmana` < ct.`minmana` AND cr.`id` = ct.`entry`;
 
 
/* 
* 20170107173502_world.sql 
*/ 
INSERT INTO `migrations` VALUES ('20170107173502');

-- fix Kobold Vermin aggro text
UPDATE `creature_ai_texts` SET `content_default`='Yiieeeee! Me run!' WHERE `entry`='-8';
 
 
/* 
* 20170108051756_world.sql 
*/ 
INSERT INTO `migrations` VALUES ('20170108051756');

UPDATE creature SET position_x = '6904.711914', position_y = '34.375999', position_z = '20.383772', orientation = '3.107141' WHERE guid = '37191';
UPDATE creature SET position_x = '6928.914551', position_y = '52.257618', position_z = '16.013895', orientation = '3.130702' WHERE guid = '37136';
 
 
/* 
* 20170108112012_world.sql 
*/ 
INSERT INTO `migrations` VALUES ('20170108112012');

-- Create Sunscale/Nightfin events
INSERT INTO `game_event` VALUES (47, '2017-01-01 06:00:00', '2022-12-31 00:00:00', 1440, 1080, 0, 'Fishing: Sunscale Cycle', 0);
INSERT INTO `game_event` VALUES (48, '2017-01-01 18:00:00', '2022-12-31 12:00:00', 1440, 1080, 0, 'Fishing: Nightfin Cycle', 0);

-- Create Sunscale/Nightfin conditions
INSERT INTO `conditions` VALUES (81, 12, 47, 0);
INSERT INTO `conditions` VALUES (82, 12, 48, 0);

-- Delete junk from fishing template
DELETE FROM fishing_loot_template WHERE mincountOrRef<0;

-- Update drop conditions for Sunscale/Nightfin
UPDATE `fishing_loot_template` SET condition_id=81 WHERE item=13760;
UPDATE `fishing_loot_template` SET condition_id=82 WHERE item=13759;
-- Plated Armorfish/Lightning Eel follow the same cycle
UPDATE `fishing_loot_template` SET condition_id=81 WHERE item=13757;
UPDATE `fishing_loot_template` SET condition_id=82 WHERE item=13890;

 
 
/* 
* 20170108152725_world.sql 
*/ 
INSERT INTO `migrations` VALUES ('20170108152725');

-- LBRS adjustments
UPDATE creature SET position_x = '-94.411293', position_y = '-421.173798', position_z = '-18.934973', orientation = '6.227048' WHERE guid = '44311';
UPDATE creature SET position_x = '-94.759087', position_y = '-424.828522', position_z = '-18.934973', orientation = '5.944305' WHERE guid = '44312';
DELETE FROM creature WHERE guid=44271;
DELETE FROM creature_addon WHERE guid=44271;
DELETE FROM creature_movement WHERE id=44271;
DELETE FROM game_event_creature WHERE guid=44271;
DELETE FROM game_event_creature_data WHERE guid=44271;
DELETE FROM creature_battleground WHERE guid=44271;
DELETE FROM creature WHERE guid=44272;
DELETE FROM creature_addon WHERE guid=44272;
DELETE FROM creature_movement WHERE id=44272;
DELETE FROM game_event_creature WHERE guid=44272;
DELETE FROM game_event_creature_data WHERE guid=44272;
DELETE FROM creature_battleground WHERE guid=44272;
UPDATE creature SET position_x = '-83.343330', position_y = '-428.336945', position_z = '-18.934982', orientation = '3.478160' WHERE guid = '44309';
UPDATE creature SET position_x = '-83.482597', position_y = '-423.773682', position_z = '-18.934982', orientation = '3.403547' WHERE guid = '44310';
DELETE FROM creature WHERE guid=44308;
DELETE FROM creature_addon WHERE guid=44308;
DELETE FROM creature_movement WHERE id=44308;
DELETE FROM game_event_creature WHERE guid=44308;
DELETE FROM game_event_creature_data WHERE guid=44308;
DELETE FROM creature_battleground WHERE guid=44308;
DELETE FROM creature WHERE guid=1007866;
DELETE FROM creature_addon WHERE guid=1007866;
DELETE FROM creature_movement WHERE id=1007866;
DELETE FROM game_event_creature WHERE guid=1007866;
DELETE FROM game_event_creature_data WHERE guid=1007866;
DELETE FROM creature_battleground WHERE guid=1007866;
DELETE FROM creature WHERE guid=44315;
DELETE FROM creature_addon WHERE guid=44315;
DELETE FROM creature_movement WHERE id=44315;
DELETE FROM game_event_creature WHERE guid=44315;
DELETE FROM game_event_creature_data WHERE guid=44315;
DELETE FROM creature_battleground WHERE guid=44315;
DELETE FROM creature WHERE guid=1007881;
DELETE FROM creature_addon WHERE guid=1007881;
DELETE FROM creature_movement WHERE id=1007881;
DELETE FROM game_event_creature WHERE guid=1007881;
DELETE FROM game_event_creature_data WHERE guid=1007881;
DELETE FROM creature_battleground WHERE guid=1007881;
DELETE FROM creature WHERE guid=1007885;
DELETE FROM creature_addon WHERE guid=1007885;
DELETE FROM creature_movement WHERE id=1007885;
DELETE FROM game_event_creature WHERE guid=1007885;
DELETE FROM game_event_creature_data WHERE guid=1007885;
DELETE FROM creature_battleground WHERE guid=1007885;
DELETE FROM creature_movement WHERE id=44310;
DELETE FROM creature WHERE guid=44310;
INSERT INTO creature VALUES (44310,9262,229,0,866,-83.4826,-423.774,-18.935,3.40355,10800,0,0,6475,3006,0,1,0);
DELETE FROM creature_movement WHERE id=44309;
DELETE FROM creature WHERE guid=44309;
INSERT INTO creature VALUES (44309,9261,229,0,962,-83.3433,-428.337,-18.935,3.47816,10800,0,0,6413,2163,0,1,0);
UPDATE creature SET spawndist=2.000000, MovementType=1 WHERE guid=44309;
UPDATE creature SET spawndist=2.000000, MovementType=1 WHERE guid=44310;
UPDATE creature SET position_x = '-16.053492', position_y = '-406.984314', position_z = '-18.934940', orientation = '6.195633' WHERE guid = '43765';
DELETE FROM gameobject WHERE guid = '3998306';
INSERT INTO gameobject VALUES ( 3998306, 136962, 229, -23.912, -410.12, -18.935, 3.62345, 0, 0, 0.971117, -0.238605, 25, 100, 1,0);
UPDATE creature SET position_x = '-22.648155', position_y = '-407.300568', position_z = '-18.934940', orientation = '4.538430' WHERE guid = '44007';
UPDATE creature SET position_x = '-26.924671', position_y = '-412.477570', position_z = '-18.934940', orientation = '0.689973' WHERE guid = '44151';
UPDATE creature SET position_x = '-37.427734', position_y = '-408.751892', position_z = '-18.934971', orientation = '2.670618' WHERE guid = '44008';
UPDATE creature SET position_x = '-43.778992', position_y = '-405.338379', position_z = '-18.934971', orientation = '5.745453' WHERE guid = '44019';
DELETE FROM creature WHERE guid=43766;
DELETE FROM creature_addon WHERE guid=43766;
DELETE FROM creature_movement WHERE id=43766;
DELETE FROM game_event_creature WHERE guid=43766;
DELETE FROM game_event_creature_data WHERE guid=43766;
DELETE FROM creature_battleground WHERE guid=43766;
UPDATE creature SET position_x = '-35.630585', position_y = '-425.856628', position_z = '-18.934900', orientation = '3.015862' WHERE guid = '43767';
UPDATE creature SET position_x = '-42.455517', position_y = '-423.923340', position_z = '-18.934900', orientation = '5.764749' WHERE guid = '44078';
DELETE FROM gameobject WHERE guid = '3998307';
INSERT INTO gameobject VALUES ( 3998307, 1798, 229, -38.9654, -425.091, -18.9349, 3.01587, 0, 0, 0.998025, 0.0628193, 25, 100, 1,0);
DELETE FROM creature WHERE guid=43768;
DELETE FROM creature_addon WHERE guid=43768;
DELETE FROM creature_movement WHERE id=43768;
DELETE FROM game_event_creature WHERE guid=43768;
DELETE FROM game_event_creature_data WHERE guid=43768;
DELETE FROM creature_battleground WHERE guid=43768;
DELETE FROM gameobject WHERE guid = '3998308';
INSERT INTO gameobject VALUES ( 3998308, 1798, 229, -60.2116, -409.235, -18.9349, 6.23207, 0, 0, 0.0255525, -0.999673, 25, 100, 1,0);
UPDATE creature SET position_x = '-61.050312', position_y = '-412.576691', position_z = '-18.934946', orientation = '0.683235' WHERE guid = '44150';
UPDATE creature SET position_x = '-42.294334', position_y = '-420.130341', position_z = '-18.934946', orientation = '2.591757' WHERE guid = '44149';
UPDATE creature SET position_x = '-61.780327', position_y = '-406.734100', position_z = '-18.934946', orientation = '5.305303' WHERE guid = '1007855';
UPDATE creature SET position_x = '-53.368259', position_y = '-427.687592', position_z = '-18.934662', orientation = '3.302547' WHERE guid = '44338';
UPDATE creature SET position_x = '-62.471985', position_y = '-431.136261', position_z = '-18.934662', orientation = '0.718586' WHERE guid = '1007861';
DELETE FROM creature WHERE guid=44333;
INSERT INTO creature VALUES (44333,9259,229,0,1092,-59.6716,-432.742,-18.9347,1.0838,25,5,0,8031,0,0,1,0);
DELETE FROM creature_movement WHERE id=44333;
DELETE FROM creature WHERE guid=44333;
INSERT INTO creature VALUES (44333,9259,229,0,1092,-59.6716,-432.742,-18.9347,1.0838,25,5,0,8317,0,0,0,0);
DELETE FROM gameobject WHERE guid = '3998309';
INSERT INTO gameobject VALUES ( 3998309, 1798, 229, -80.1904, -453.645, -18.935, 4.07221, 0, 0, 0.893683, -0.448699, 25, 100, 1,0);
UPDATE creature SET position_x = '-83.239670', position_y = '-454.829041', position_z = '-18.934986', orientation = '1.024852' WHERE guid = '44306';
UPDATE creature SET position_x = '-78.821732', position_y = '-451.353729', position_z = '-18.934986', orientation = '2.929450' WHERE guid = '44304';
UPDATE creature SET position_x = '-85.093147', position_y = '-450.228424', position_z = '-18.934986', orientation = '5.603724' WHERE guid = '44305';
UPDATE creature SET position_x = '-77.848122', position_y = '-452.517792', position_z = '-18.934994', orientation = '2.548511' WHERE guid = '44304';
UPDATE creature SET position_x = '-81.294746', position_y = '-448.586182', position_z = '-18.934994', orientation = '4.594474' WHERE guid = '44307';
DELETE FROM gameobject WHERE guid = '3998310';
INSERT INTO gameobject VALUES ( 3998310, 1798, 229, 35.3697, -550.836, -18.6014, 3.36145, 0, 0, 0.993964, -0.10971, 25, 100, 1,0);
DELETE FROM creature WHERE guid=44332;
INSERT INTO creature VALUES (44332,9262,229,0,866,31.8581,-550.86,-18.6014,0.011724,25,5,0,6475,3362,0,1,0);
DELETE FROM creature_movement WHERE id=44332;
DELETE FROM creature WHERE guid=44332;
INSERT INTO creature VALUES (44332,9262,229,0,866,31.8581,-550.86,-18.6014,0.011724,25,5,0,6475,3362,0,0,0);
DELETE FROM creature WHERE guid=44331;
INSERT INTO creature VALUES (44331,9261,229,0,962,34.2318,-547.452,-18.6014,4.64166,25,5,0,6643,2241,0,1,0);
DELETE FROM creature_movement WHERE id=44331;
DELETE FROM creature WHERE guid=44331;
INSERT INTO creature VALUES (44331,9261,229,0,962,34.2318,-547.452,-18.6014,4.64166,25,5,0,6413,2163,0,0,0);
UPDATE creature SET position_x = '-117.270241', position_y = '-478.662659', position_z = '-18.456411', orientation = '4.786945' WHERE guid = '1007889';
UPDATE creature SET position_x = '-115.380806', position_y = '-482.893707', position_z = '-18.456411', orientation = '2.383627' WHERE guid = '1007887';
DELETE FROM creature WHERE guid=44330;
DELETE FROM creature_addon WHERE guid=44330;
DELETE FROM creature_movement WHERE id=44330;
DELETE FROM game_event_creature WHERE guid=44330;
DELETE FROM game_event_creature_data WHERE guid=44330;
DELETE FROM creature_battleground WHERE guid=44330;
DELETE FROM creature WHERE guid=44330;
INSERT INTO creature VALUES (44330,9259,229,0,1092,-111.449,-484.729,-18.4564,6.05143,25,5,0,8031,0,0,1,0);
DELETE FROM creature_movement WHERE id=44330;
DELETE FROM creature WHERE guid=44330;
INSERT INTO creature VALUES (44330,9259,229,0,1092,-111.449,-484.729,-18.4564,6.05143,25,5,0,8031,0,0,0,0);
DELETE FROM creature WHERE guid=44329;
INSERT INTO creature VALUES (44329,9261,229,0,962,-106.532,-483.55,-18.4564,2.98838,25,5,0,6413,2163,0,1,0);
DELETE FROM creature_movement WHERE id=44329;
DELETE FROM creature WHERE guid=44329;
INSERT INTO creature VALUES (44329,9261,229,0,962,-106.532,-483.55,-18.4564,2.98838,25,5,0,6643,2241,0,0,0);
UPDATE creature SET position_x = '-111.060493', position_y = '-484.374451', position_z = '-18.456392', orientation = '5.804018' WHERE guid = '44330';
DELETE FROM creature WHERE guid=44328;
INSERT INTO creature VALUES (44328,9259,229,0,1092,-100.496,-491.663,-18.4564,1.67282,25,5,0,8317,0,0,1,0);
DELETE FROM creature_movement WHERE id=44328;
DELETE FROM creature WHERE guid=44328;
INSERT INTO creature VALUES (44328,9259,229,0,1092,-100.496,-491.663,-18.4564,1.67282,25,5,0,8031,0,0,0,0);
UPDATE creature SET position_x = '-142.365829', position_y = '-499.088043', position_z = '-18.456362', orientation = '2.799869' WHERE guid = '44321';
UPDATE creature SET position_x = '-147.197769', position_y = '-497.277008', position_z = '-18.456362', orientation = '6.275255' WHERE guid = '44325';
UPDATE creature SET position_x = '-143.656219', position_y = '-494.930023', position_z = '-18.456362', orientation = '3.726639' WHERE guid = '44324';
UPDATE creature SET position_x = '-158.152542', position_y = '-499.376251', position_z = '-18.456362', orientation = '2.615300' WHERE guid = '44319';
UPDATE creature SET position_x = '-156.562805', position_y = '-495.555725', position_z = '-18.456415', orientation = '3.534217' WHERE guid = '44320';
UPDATE creature SET position_x = '-26.556408', position_y = '-427.698761', position_z = '-18.934988', orientation = '2.131546' WHERE guid = '43764';
DELETE FROM creature WHERE guid=44327;
INSERT INTO creature VALUES (44327,9259,229,0,1092,-87.7573,-464.193,-18.935,2.08125,25,5,0,8031,0,0,1,0);
DELETE FROM creature_movement WHERE id=44327;
DELETE FROM creature WHERE guid=44327;
INSERT INTO creature VALUES (44327,9259,229,0,1092,-87.7573,-464.193,-18.935,2.08125,25,5,0,8317,0,0,0,0);
UPDATE creature SET position_x = '-88.116806', position_y = '-463.339935', position_z = '-18.934916', orientation = '1.998773' WHERE guid = '44327';

DELETE FROM `creature_groups` WHERE `leaderGUID` NOT IN (SELECT `guid` FROM `creature`);
DELETE FROM `creature_groups` WHERE `memberGUID` NOT IN (SELECT `guid` FROM `creature`); 
DELETE FROM creature_groups WHERE memberguid in (44327, 44328, 44329, 44330, 44331, 44332, 44333);
DELETE FROM creature_groups WHERE leaderguid in (44327, 44328, 44329, 44330, 44331, 44332, 44333);

UPDATE creature SET position_x = '-50.511337', position_y = '-298.181122', position_z = '70.940605', orientation = '6.176346' WHERE guid = '45796';
UPDATE creature SET position_x = '-43.487648', position_y = '-298.824585', position_z = '70.943237', orientation = '4.825464' WHERE guid = '45797';
UPDATE creature SET position_x = '-143.994476', position_y = '-300.378113', position_z = '70.952461', orientation = '4.786194' WHERE guid = '45785';
UPDATE creature SET position_x = '-135.892487', position_y = '-298.899170', position_z = '70.952438', orientation = '3.478510' WHERE guid = '45776';

-- update BRS orc male/female alt modelids
UPDATE `creature_template` SET `modelid_2`='9596', `modelid_3`='9853', `modelid_4`='9854' WHERE `entry`='9045';
UPDATE `creature_template` SET `modelid_2`='9630', `modelid_3`='9857', `modelid_4`='9858' WHERE `entry`='9097';
UPDATE `creature_template` SET `modelid_2`='9620', `modelid_3`='9863', `modelid_4`='9864' WHERE `entry`='9098';
UPDATE `creature_template` SET `modelid_2`='9610', `modelid_3`='9865', `modelid_4`='9866' WHERE `entry`='9257';
UPDATE `creature_template` SET `modelid_2`='9638', `modelid_3`='9859', `modelid_4`='9860' WHERE `entry`='9258';
UPDATE `creature_template` SET `modelid_2`='9665', `modelid_3`='9871', `modelid_4`='9872' WHERE `entry`='9259';
UPDATE `creature_template` SET `modelid_2`='9661', `modelid_3`='9884', `modelid_4`='9885' WHERE `entry`='9260';
UPDATE `creature_template` SET `modelid_2`='9645', `modelid_3`='9867', `modelid_4`='9868' WHERE `entry`='9261';
UPDATE `creature_template` SET `modelid_2`='9649', `modelid_3`='9877', `modelid_4`='9878' WHERE `entry`='9262';
UPDATE `creature_template` SET `modelid_2`='9653', `modelid_3`='9869', `modelid_4`='9870' WHERE `entry`='9263';
UPDATE `creature_template` SET `modelid_2`='9657', `modelid_3`='9888', `modelid_4`='9889' WHERE `entry`='9264';
UPDATE `creature_template` SET `modelid_2`='9886' WHERE `entry`='9716';
UPDATE `creature_template` SET `modelid_2`='9614', `modelid_3`='9879', `modelid_4`='9880' WHERE `entry`='9717';
UPDATE `creature_template` SET `modelid_2`='9626', `modelid_3`='9873', `modelid_4`='9874' WHERE `entry`='9693';
UPDATE `creature_template` SET `modelid_2`='9603', `modelid_3`='9875', `modelid_4`='9876' WHERE `entry`='9692';
UPDATE `creature_template` SET `modelid_2`='9634', `modelid_3`='9881', `modelid_4`='9882' WHERE `entry`='9583';
UPDATE `creature_template` SET `modelid_2`='9671' WHERE `entry`='9817';
UPDATE `creature_template` SET `modelid_2`='9850', `modelid_3`='9851' WHERE `entry`='9818';
UPDATE `creature_template` SET `modelid_2`='9687', `modelid_3`='9688', `modelid_4`='9896' WHERE `entry`='9819';
UPDATE `creature_template` SET `modelid_2`='9697', `modelid_3`='9698', `modelid_4`='9894' WHERE `entry`='10319';
UPDATE `creature_template` SET `modelid_2`='9887' WHERE `entry`='10318';
UPDATE `creature_template` SET `modelid_2`='9735', `modelid_3`='9890', `modelid_4`='9891' WHERE `entry`='10317';
-- clear BRS orc creature table modelids
UPDATE `creature` SET `modelid`='0' WHERE `id` in ('9045', '9097','9098','9257','9258','9259','9260','9261','9262','9263','9264','9583','9692','9693','9716','9717','9817','9818','9819','10317','10318','10319');

-- add creature_addon aura to guid 44009 -  NATURE channeling aura 13236
-- add creature_addon aura to guid 44319 44320 - DARK channeling aura 21157
REPLACE INTO `creature_addon` (`guid`, `mount`, `bytes1`, `b2_0_sheath`, `b2_1_flags`, `emote`, `moveflags`, `auras`) VALUES ('44009', '0', '0', '1', '16', '0', '0', '13236');
REPLACE INTO `creature_addon` (`guid`, `mount`, `bytes1`, `b2_0_sheath`, `b2_1_flags`, `emote`, `moveflags`, `auras`) VALUES ('44319', '0', '0', '1', '16', '0', '0', '12380');
REPLACE INTO `creature_addon` (`guid`, `mount`, `bytes1`, `b2_0_sheath`, `b2_1_flags`, `emote`, `moveflags`, `auras`) VALUES ('44320', '0', '0', '1', '16', '0', '0', '12380');

-- add sleep anim/auras to guids 44311, 44312, 1004514, 44328
-- aura sleep visual 26115
REPLACE INTO `creature_addon` (`guid`, `mount`, `bytes1`, `b2_0_sheath`, `b2_1_flags`, `emote`, `moveflags`, `auras`) VALUES ('44311', '0', '0', '1', '16', '0', '0', '26115');
REPLACE INTO `creature_addon` (`guid`, `mount`, `bytes1`, `b2_0_sheath`, `b2_1_flags`, `emote`, `moveflags`, `auras`) VALUES ('44312', '0', '0', '1', '16', '0', '0', '26115');
REPLACE INTO `creature_addon` (`guid`, `mount`, `bytes1`, `b2_0_sheath`, `b2_1_flags`, `emote`, `moveflags`, `auras`) VALUES ('44328', '0', '0', '1', '16', '0', '0', '26115');
REPLACE INTO `creature_addon` (`guid`, `mount`, `bytes1`, `b2_0_sheath`, `b2_1_flags`, `emote`, `moveflags`, `auras`) VALUES ('1004514', '0', '0', '1', '16', '0', '0', '26115');
REPLACE INTO `creature_addon` (`guid`, `mount`, `bytes1`, `b2_0_sheath`, `b2_1_flags`, `emote`, `moveflags`, `auras`) VALUES ('45797', '0', '0', '1', '16', '0', '0', '26115');
REPLACE INTO `creature_addon` (`guid`, `mount`, `bytes1`, `b2_0_sheath`, `b2_1_flags`, `emote`, `moveflags`, `auras`) VALUES ('45796', '0', '0', '1', '16', '0', '0', '26115');
REPLACE INTO `creature_addon` (`guid`, `mount`, `bytes1`, `b2_0_sheath`, `b2_1_flags`, `emote`, `moveflags`, `auras`) VALUES ('45776', '0', '0', '1', '16', '0', '0', '26115');
REPLACE INTO `creature_addon` (`guid`, `mount`, `bytes1`, `b2_0_sheath`, `b2_1_flags`, `emote`, `moveflags`, `auras`) VALUES ('45785', '0', '0', '1', '16', '0', '0', '26115');

-- remove sleep visual 26115 on enter combat for entries 9261, 9259
REPLACE INTO `creature_ai_scripts` (`id`, `creature_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_type`, `action1_param1`, `action1_param2`, `action1_param3`, `action2_type`, `action2_param1`, `action2_param2`, `action2_param3`, `action3_type`, `action3_param1`, `action3_param2`, `action3_param3`, `comment`) VALUES ('925904', '9259', '4', '0', '100', '0', '0', '0', '0', '0', '28', '0', '26115', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'Firebrand Grunt - remove Sleep aura on aggro');
REPLACE INTO `creature_ai_scripts` (`id`, `creature_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_type`, `action1_param1`, `action1_param2`, `action1_param3`, `action2_type`, `action2_param1`, `action2_param2`, `action2_param3`, `action3_type`, `action3_param1`, `action3_param2`, `action3_param3`, `comment`) VALUES ('926116', '9261', '4', '0', '100', '0', '0', '0', '0', '0', '28', '0', '26115', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'Firebrand Darkweaver - remove Sleep aura on aggro');
REPLACE INTO `creature_ai_scripts` (`id`, `creature_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_type`, `action1_param1`, `action1_param2`, `action1_param3`, `action2_type`, `action2_param1`, `action2_param2`, `action2_param3`, `action3_type`, `action3_param1`, `action3_param2`, `action3_param3`, `comment`) VALUES ('958304', '9583', '4', '0', '100', '0', '0', '0', '0', '0', '28', '0', '26115', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'Bloodaxe Veteran - remove Sleep aura on aggro');
REPLACE INTO `creature_ai_scripts` (`id`, `creature_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_type`, `action1_param1`, `action1_param2`, `action1_param3`, `action2_type`, `action2_param1`, `action2_param2`, `action2_param3`, `action3_type`, `action3_param1`, `action3_param2`, `action3_param3`, `comment`) VALUES ('969314', '9693', '4', '0', '100', '0', '0', '0', '0', '0', '28', '0', '26115', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'Bloodaxe Evoker - remove Sleep aura on aggro');
REPLACE INTO `creature_ai_scripts` (`id`, `creature_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_type`, `action1_param1`, `action1_param2`, `action1_param3`, `action2_type`, `action2_param1`, `action2_param2`, `action2_param3`, `action3_type`, `action3_param1`, `action3_param2`, `action3_param3`, `comment`) VALUES ('971704', '9717', '4', '0', '100', '0', '0', '0', '0', '0', '28', '0', '26115', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'Bloodaxe Summoner - remove Sleep aura on aggro');

-- add /sit anim to guid 44321, 43764, 44327, 44330
REPLACE INTO `creature_addon` (`guid`, `mount`, `bytes1`, `b2_0_sheath`, `b2_1_flags`, `emote`, `moveflags`) VALUES ('44321', '0', '1', '1', '16', '0', '0');
REPLACE INTO `creature_addon` (`guid`, `mount`, `bytes1`, `b2_0_sheath`, `b2_1_flags`, `emote`, `moveflags`) VALUES ('43764', '0', '1', '1', '16', '0', '0');
REPLACE INTO `creature_addon` (`guid`, `mount`, `bytes1`, `b2_0_sheath`, `b2_1_flags`, `emote`, `moveflags`) VALUES ('44327', '0', '1', '1', '16', '0', '0');
REPLACE INTO `creature_addon` (`guid`, `mount`, `bytes1`, `b2_0_sheath`, `b2_1_flags`, `emote`, `moveflags`) VALUES ('44330', '0', '1', '1', '16', '0', '0');

-- add 44333 to creature_groups with leaderguid 44337
REPLACE INTO `creature_groups` (`leaderGUID`, `memberGUID`, `dist`, `angle`, `flags`) VALUES ('44337', '44333', '0', '0', '2');
-- GROUP the last 4 guids just before the pyromancer room
REPLACE INTO `creature_groups` VALUES
('1007889', '1007887', '7.22497', '8.1069', '2'),
('1007889', '44329', '8.79556', '8.66152', '2'),
('1007889', '44330', '7.84643', '5.29692', '2'),
('45802', '1074011', '6.46892', '5.73096', '2'),
('45799', '1074013', '12.4649', '3.34594', '2'),
('45802', '45793', '8.84937', '7.76108', '2');

-- fix crystal spiders
DELETE FROM `creature_ai_scripts` WHERE `id`='1037501';

-- randomize bannok spawn point via instance script
DELETE FROM `pool_creature` WHERE `pool_entry`='22902';
DELETE FROM `pool_template` WHERE `entry`='22902';
DELETE FROM `creature` WHERE `guid`='45843';

-- arcanite reaper plans drop rate
UPDATE `creature_loot_template` SET `ChanceOrQuestChance`='7' WHERE `entry`='9596' and`item`='12838';

-- fix respawn times of newly added mobs
UPDATE `creature` SET `spawntimesecs`='10800' WHERE `guid`='44330';
UPDATE `creature` SET `spawntimesecs`='10800' WHERE `guid`='44333';
UPDATE `creature` SET `spawntimesecs`='10800' WHERE `guid`='44327';
UPDATE `creature` SET `spawntimesecs`='10800' WHERE `guid`='44328';
UPDATE `creature` SET `spawntimesecs`='10800' WHERE `guid`='44329';
UPDATE `creature` SET `spawntimesecs`='10800' WHERE `guid`='44331';
UPDATE `creature` SET `spawntimesecs`='10800' WHERE `guid`='44332';

-- add missing patrol waypoints
DELETE from creature_groups WHERE leaderguid in (1070113, 1071023);
DELETE FROM creature_movement WHERE id=1070113;
DELETE FROM creature WHERE guid=1070113;
INSERT INTO creature VALUES (1070113,9692,229,0,810,-127.276,-368.965,57.4075,0.0175872,10800,0,0,8227,0,0,2,0);
DELETE FROM creature_movement WHERE id=1071023;
DELETE FROM creature WHERE guid=1071023;
INSERT INTO creature VALUES (1071023,9692,229,0,810,-147.824,-343.794,67.7461,3.14868,10800,0,0,8227,0,0,2,0);
INSERT INTO creature_movement (id,point,position_x,position_y,position_z,orientation,wpguid,waittime) VALUES (1071023,1, -162.308853,-343.957306,64.401604,3.136868, 0,6000);
UPDATE creature SET MovementType=2 WHERE guid=1071023;
DELETE FROM creature WHERE guid=1071023;
INSERT INTO creature VALUES (1071023,9692,229,0,810,-147.824,-343.794,67.7461,3.14868,10800,0,0,8227,0,0,2,0);
INSERT INTO creature_movement (id,point,position_x,position_y,position_z,orientation,wpguid,waittime) VALUES (1071023,2, -132.762711,-343.776001,70.952446,0.007049, 0,6000);
UPDATE creature SET MovementType=2 WHERE guid=1071023;
DELETE FROM creature WHERE guid=1071023;
INSERT INTO creature VALUES (1071023,9692,229,0,810,-147.824,-343.794,67.7461,3.14868,10800,0,0,8227,0,0,2,0);
INSERT INTO creature_movement (id,point,position_x,position_y,position_z,orientation,wpguid,waittime) VALUES (1070113,1, -167.250168,-369.182861,64.400841,3.140785, 0,6000);
UPDATE creature SET MovementType=2 WHERE guid=1070113;
DELETE FROM creature WHERE guid=1070113;
INSERT INTO creature VALUES (1070113,9692,229,0,810,-127.276,-368.965,57.4075,0.0175872,10800,0,0,8227,0,0,2,0);
INSERT INTO creature_movement (id,point,position_x,position_y,position_z,orientation,wpguid,waittime) VALUES (1070113,2, -130.649124,-368.794342,57.433338,0.081649, 0,6000);
UPDATE creature SET MovementType=2 WHERE guid=1070113;
DELETE FROM creature WHERE guid=1070113;
INSERT INTO creature VALUES (1070113,9692,229,0,810,-127.276,-368.965,57.4075,0.0175872,10800,0,0,8506,0,0,2,0);

-- formation group patrols
DELETE FROM creature_groups WHERE leaderguid in (1070113, 1071023);
REPLACE INTO creature_groups VALUES
('1070113', '1070121', '3.5', '2', '3'),
('1070113', '1070117', '3.5', '4.25', '3'),
('1071023', '1071030', '3.5', '2', '3'),
('1071023', '1071027', '3.5', '4.25', '3');
 
 
/* 
* 20170108185741_world.sql 
*/ 
INSERT INTO `migrations` VALUES ('20170108185741'); 

-- Silverpine Forest issues
UPDATE `creature_template` SET `ScriptName` = 'npc_councilman' WHERE `entry` IN (2060, 2061, 2062, 2063, 2064, 2066, 2065, 2067, 2068);
UPDATE `gameobject_template` SET `data6` = 0, `ScriptName` = 'go_dusty_spellbooks' WHERE `entry` = 1571;
DELETE FROM `event_scripts` WHERE `id` = 259;
UPDATE `gameobject` SET `spawntimesecs` = 10 WHERE `id` = 1571;
 
 
/* 
* 20170109002844_world.sql 
*/ 
INSERT INTO `migrations` VALUES ('20170109002844');

UPDATE `creature` SET `MovementType`='0' WHERE `guid`='48805';
UPDATE `creature_movement` SET `waittime`='2500' WHERE `id`='48805' and`point`='1';
UPDATE `creature_movement` SET `waittime`='150000' WHERE `id`='48805' and`point`='5';
REPLACE INTO `creature_movement` (`id`, `point`, `position_x`, `position_y`, `position_z`, `waittime`, `script_id`, `textid1`, `textid2`, `textid3`, `textid4`, `textid5`, `emote`, `spell`, `wpguid`, `orientation`, `model1`, `model2`) VALUES ('48805', '6', '143.481', '99.0964', '104.659', '150000', '0', '0', '0', '0', '0', '0', '0', '0', '0', '3.26377', '0', '0');
 
 
/* 
* 20170109092728_world.sql 
*/ 
INSERT INTO `migrations` VALUES ('20170109092728');

-- add sleep anim to guid 43765
REPLACE INTO `creature_addon` (`guid`, `mount`, `bytes1`, `b2_0_sheath`, `b2_1_flags`, `emote`, `moveflags`, `auras`) VALUES ('43765', '0', '0', '1', '16', '0', '0', '26115');
 
 
/* 
* 20170109103918_world.sql 
*/ 
INSERT INTO `migrations` VALUES ('20170109103918');

-- fix Blackhand Summoners - ignore range/LOS checks
REPLACE INTO `spell_mod` VALUES
('15792', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '4', '-1', '-1', '0', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '1', '-1', '-1', '-1', '0', 'Summon Blackhand Veteran - ignore LOS'),
('15794', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '4', '-1', '-1', '0', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '1', '-1', '-1', '-1', '0', 'Summon Blackhand Dreadweaver - ignore LOS');
 
 
/* 
* 20170109111149_world.sql 
*/ 
INSERT INTO `migrations` VALUES ('20170109111149');

-- fix Cookie EventAI
UPDATE `creature_ai_scripts` SET `event_param1`='5000', `event_param2`='5000', `event_param3`='27000', `event_param4`='36200', `action1_param2`='0', `action1_param3`='0' WHERE `id`='64501';
 
 
/* 
* 20170109121114_world.sql 
*/ 
INSERT INTO `migrations` VALUES ('20170109121114');

-- Fix some pooled creatures with chances that didn't add up to 100
-- Miner Johnson
UPDATE `creature` SET `position_x`='-152.496', `position_y`='-532.116', `position_z`='49.5965', `orientation`='4.83726' WHERE `guid`='84079';
REPLACE INTO creature VALUES
('84082', '598', '36', '556', '0', '-152.496', '-532.116', '49.5965', '4.83726', '25000', '0', '0', '1144', '0', '0', '0', '0');
REPLACE INTO `pool_creature` (`guid`, `pool_entry`, `chance`, `description`, `flags`) VALUES ('84082', '3601', '0', 'Miner Johson - placeholder (Defias Miner)', '0');
UPDATE `pool_creature` SET `chance`='20' WHERE `guid`='84079';
REPLACE INTO `creature_addon` (`guid`, `mount`, `bytes1`, `b2_0_sheath`, `b2_1_flags`, `emote`, `moveflags`) VALUES ('84079', '0', '0', '1', '16', '233', '0');
UPDATE `creature_template` SET `equipment_id`='738' WHERE `entry`='3586';
-- The Blind Hunter
REPLACE INTO creature VALUES
('87490', '4539', '47', '4735', '0', '2200.76', '1978.19', '56.7228', '3.735', '36000', '0', '0', '5268', '0', '0', '0', '0');
REPLACE INTO `pool_creature` (`guid`, `pool_entry`, `chance`, `description`, `flags`) VALUES ('87490', '4701', '0', 'Blind Hunter - placeholder (Greater Kraul Bat)', '0');
-- delete missing Nimar the Slayer guid
DELETE FROM `pool_creature` WHERE `guid`='1183835';
 
 
/* 
* 20170109132132_world.sql 
*/ 
INSERT INTO `migrations` VALUES ('20170109132132');

-- remove troll nef guids...
DELETE FROM creature WHERE id = 11583;
 
 
/* 
* 20170109173910_world.sql 
*/ 
INSERT INTO `migrations` VALUES ('20170109173910');

-- add missing Magmus yell
REPLACE INTO `script_texts` (`entry`, `content_default`, `type`, `comment`) VALUES ('-1230052', 'Emperor Thaurissan does not wish to be disturbed! Turn back now or face your doom, weak mortals!', '6', 'yell Magmus');
 
 
/* 
* 20170109180104_world.sql 
*/ 
INSERT INTO `migrations` VALUES ('20170109180104');

-- Create loot template for Half-Buried Bottle
INSERT INTO `gameobject_loot_template` VALUES
(2560,  4234,   25, 0,  1,  1,  0),
(2560,  4098,   25, 0,  1,  1,  0),
(2560,  2319,   21, 0,  1,  1,  0),
(2560,  4100,   17, 0,  1,  1,  0),
(2560,  4102,   17, 0,  1,  1,  0),
(2560,  4101,   17, 0,  1,  1,  0),
(2560,  4586,   9,  0,  1,  1,  0),
(2560,  2290,   4,  0,  1,  1,  0),
(2560,  2289,   4,  0,  1,  1,  0),
(2560,  1711,   4,  0,  1,  1,  0),
(2560,  1477,   3,  0,  1,  1,  0),
(2560,  4232,   2,  0,  1,  1,  0),
(2560,  4235,   1.42,   0,  1,  1,  0),
(2560,  1529,   0.26,   0,  1,  1,  0);

-- Move bottle spawns where players can click them
UPDATE `gameobject` SET position_z=0.4 WHERE guid=11031;
UPDATE `gameobject` SET position_z=2.4 WHERE guid=11034;
 
 
/* 
* 20170109180834_world.sql 
*/ 
INSERT INTO `migrations` VALUES ('20170109180834');

-- Darkmaster Gandling - add interrupt immunity
UPDATE creature_template SET mechanic_immune_mask = mechanic_immune_mask | 33554432 WHERE entry = 1853;
 
 
/* 
* 20170109183000_world.sql 
*/ 
INSERT INTO `migrations` VALUES ('20170109183000');

-- default EffectMiscValue to -1
ALTER TABLE `spell_effect_mod` 
CHANGE COLUMN `EffectMiscValue` `EffectMiscValue` INT(10) NOT NULL DEFAULT '-1';
 
 
/* 
* 20170110100628_world.sql 
*/ 
INSERT INTO `migrations` VALUES ('20170110100628');

-- remove eventai from skeletal servant
DELETE FROM `creature_ai_scripts` WHERE `id`='847701';
UPDATE `creature_template` SET `AIName`='' WHERE `entry`='8477';
-- remove from creature table, these are summoned by necromancers in EventAI
DELETE from creature WHERE id = 8477;
-- force cast summon skeletal servant on spawn (or some DB defined dark channeling auras prevents cast on spawn)
UPDATE `creature_ai_scripts` SET `action1_param3`='2' WHERE `id`='1040002';
UPDATE `creature_ai_scripts` SET `action1_param3`='2' WHERE `id`='855302';
-- remove summon skeletal servant from thuzadin shadowcasters
UPDATE `creature_ai_scripts` SET `action3_type`='0', `action3_param1`='0', `action3_param3`='0' WHERE `id`='1039802';
 
 
/* 
* 20170110163154_world.sql 
*/ 
INSERT INTO `migrations` VALUES ('20170110163154');

-- missing UD strath scripts
REPLACE INTO `script_texts` (`entry`, `content_default`, `content_loc2`, `sound`, `type`, `language`, `emote`, `comment`) VALUES ('-1000020', 'Intruders! More pawns of the Argent Dawn, no doubt. I already count one of their number among my prisoners. Withdraw from my domain before she is executed!', 'Des intrus ! Encore des marionnettes de l\'Aube d\'argent, sans doute. J\'en ai déjà une parmi mes prisonniers. Hâtez-vous de quitter nom domaine, sans quoi elle sera exécutée !', '0', '6', '0', '0', 'rivendare YELL_45MIN');
REPLACE INTO `script_texts` (`entry`, `content_default`, `sound`, `type`, `language`, `emote`, `comment`) VALUES ('-1000021', 'You\'re still here? Your foolishness is amusing! The Argent Dawn wench needn\'t suffer in vain. Leave at once and she shall be spared!', '0', '6', '0', '0', 'rivendare YELL_10MIN');
REPLACE INTO `script_texts` (`entry`, `content_default`, `content_loc2`, `sound`, `type`, `language`, `emote`, `comment`) VALUES ('-1000022', 'I shall take great pleasure in taking this poor wretch\'s life! It\'s not too late, she needn\'t suffer in vain. Turn back and her death shall be merciful!', 'Je vais prendre beaucoup de plaisir à tuer cette pauvre femme ! Il n\'est pas trop tard, Il n\'est pas nécessaire qu\'elle souffre pour rien. Allez-vous-en et sa mort sera miséricordieuse !', '0', '6', '0', '0', 'rivendare YELL_5MIN');
REPLACE INTO `script_texts` (`entry`, `content_default`, `content_loc2`, `sound`, `type`, `language`, `emote`, `comment`) VALUES ('-1000023', 'Don\'t worry about me! Slay this dreadful beast and cleanse this world of his foul taint!', 'Ne vous inquiétez pas de moi ! Tuez cette bête odieuse ! Libérez le monde de sa vile corruption !', '0', '6', '0', '0', 'ysida YELL_5MIN');
REPLACE INTO `script_texts` (`entry`, `content_default`, `sound`, `type`, `language`, `emote`, `comment`) VALUES ('-1000024', 'May this prisoner\'s death serve as a warning. None shall defy the Scourge and live!', '0', '6', '0', '0', 'rivendare YELL_FAILED');
REPLACE INTO `script_texts` (`entry`, `content_default`, `sound`, `type`, `language`, `emote`, `comment`) VALUES ('-1000025', 'So you see fit to toy with the Lich King\'s creations? Ramstein, be sure to give the intruders a proper greeting.', '0', '6', '0', '0', 'rivendare YELL_RAMMSTEIN');
REPLACE INTO `script_texts` (`entry`, `content_default`, `sound`, `type`, `language`, `emote`, `comment`) VALUES ('-1000026', 'Ramstein hunger for flesh!', '0', '6', '0', '0', 'rammstein YELL_SPAWN');
REPLACE INTO `script_texts` (`entry`, `content_default`, `sound`, `type`, `language`, `emote`, `comment`) VALUES ('-1000027', 'Who dares disturb our master?', '0', '6', '0', '0', 'black_guard_sentry YELL_SPAWN');
REPLACE INTO `script_texts` (`entry`, `content_default`, `sound`, `type`, `language`, `emote`, `comment`) VALUES ('-1000028', 'Time to take matters into my own hands. Come. Enter my domain and challenge the might of the Scourge!', '0', '6', '0', '0', 'rivendare YELL_READY');
REPLACE INTO `script_texts` (`entry`, `content_default`, `sound`, `type`, `language`, `emote`, `comment`) VALUES ('-1000029', 'My death means nothing.... light... will... prevail!', '0', '6', '0', '0', 'ysida YELL_FAILED');
REPLACE INTO `script_texts` (`entry`, `content_default`, `sound`, `type`, `language`, `emote`, `comment`) VALUES ('-1000030', 'You did it... you\'ve slain Baron Rivendare! The Argent Dawn shall hear of your valiant deeds!', '0', '0', '0', '0', 'ysida SAY_REWARD');
 
 
/* 
* 20170110182144_world.sql 
*/ 
INSERT INTO `migrations` VALUES ('20170110182144'); 

-- update modified script name
UPDATE `creature_template` SET `ScriptName` = 'npc_goblin_land_mine' WHERE `entry` = 7527;
 
 
/* 
* 20170110213018_world.sql 
*/ 
INSERT INTO `migrations` VALUES ('20170110213018');

INSERT INTO `creature_ai_scripts` VALUES
(16001503,	2384,	1,	0,	100,	0,	1000,	1000,	0,	0,	11,	8152,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	'Starving Mountain Lion - Cast Prowl on Spawn'); 
 
/* 
* 20170110221214_world.sql 
*/ 
INSERT INTO `migrations` VALUES ('20170110221214');

-- Add Patch 1.9 Event
INSERT INTO `game_event` VALUES
(161,	'2030-01-01 00:00:00',	'2030-01-01 00:00:00',	525600,	525600,	0,	'Patch 1.9',	0);

-- Tie all Fish Schools, Floating Wreckage, and Patches of Elemental Water to this event
INSERT INTO `game_event_gameobject` (`guid`, `event`)
SELECT `guid`, 161 FROM `gameobject`
JOIN `gameobject_template` ON `name` LIKE '%School%' OR `name` LIKE '%Wreckage' OR `name`='Patch of Elemental Water' OR `name`='Oil Spill' 
WHERE `gameobject`.`id` = `gameobject_template`.`entry`;

/* You may use this to confirm
SELECT name, event FROM gameobject_template
JOIN gameobject ON gameobject.id = entry
JOIN game_event_gameobject ON gameobject.guid = game_event_gameobject.guid
WHERE game_event_gameobject.event = 161
*/
 
 
/* 
* 20170112124344_world.sql 
*/ 
INSERT INTO `migrations` VALUES ('20170112124344'); 

-- Grand Foreman Puzik Gallywix tuning
UPDATE `creature_template` SET `ScriptName` = 'npc_puzik_gallywix' WHERE `entry` = 7288;
UPDATE `creature` SET `spawntimesecs` = 360, `spawnFlags` = 24 WHERE `id` = 7288;
 
 
/* 
* 20170113073948_world.sql 
*/ 
INSERT INTO `migrations` VALUES ('20170113073948');

-- flag some GM commands as COMMAND_FLAGS_CRITICAL
UPDATE `command` SET `flags`='2' WHERE `name`='cast back';
UPDATE `command` SET `flags`='2' WHERE `name`='cast dist';
UPDATE `command` SET `flags`='2' WHERE `name`='cast self';
UPDATE `command` SET `flags`='2' WHERE `name`='cast target';
UPDATE `command` SET `flags`='2' WHERE `name`='cast';
UPDATE `command` SET `flags`='2' WHERE `name`='honor add';
UPDATE `command` SET `flags`='2' WHERE `name`='honor setrp';
UPDATE `command` SET `flags`='2' WHERE `name`='gobject respawn';
UPDATE `command` SET `flags`='2' WHERE `name`='modify money';
UPDATE `command` SET `flags`='2' WHERE `name`='npc add';
UPDATE `command` SET `flags`='2' WHERE `name`='npc additem';
UPDATE `command` SET `flags`='2' WHERE `name`='npc changeentry';
UPDATE `command` SET `flags`='2' WHERE `name`='reset honor';
UPDATE `command` SET `flags`='2' WHERE `name`='die';
UPDATE `command` SET `flags`='2' WHERE `name`='additem';
UPDATE `command` SET `flags`='2' WHERE `name`='levelup';
UPDATE `command` SET `flags`='2' WHERE `name`='additemset';
UPDATE `command` SET `flags`='2' WHERE `name`='send mass items';
UPDATE `command` SET `flags`='2' WHERE `name`='respawn';
UPDATE `command` SET `flags`='2' WHERE `name`='send mass mail';
UPDATE `command` SET `flags`='2' WHERE `name`='send items';
UPDATE `command` SET `flags`='2' WHERE `name`='send money';
UPDATE `command` SET `flags`='2' WHERE `name`='damage';
 
 
/* 
* 20170115145734_world.sql 
*/ 
INSERT INTO `migrations` VALUES ('20170115145734'); 

DROP TABLE IF EXISTS `world_template`;
DROP TABLE IF EXISTS `instance_template`;

DROP TABLE IF EXISTS `map_template`;
CREATE TABLE `map_template` (
  `Entry` SMALLINT(5) UNSIGNED NOT NULL,
  `Parent` INT(10) UNSIGNED NOT NULL DEFAULT '0',
  `MapType` TINYINT(3) UNSIGNED NOT NULL DEFAULT '0',
  `LinkedZone` INT(10) UNSIGNED NOT NULL DEFAULT '0',
  `LevelMin` TINYINT(3) UNSIGNED NOT NULL DEFAULT '0',
  `LevelMax` TINYINT(3) UNSIGNED NOT NULL DEFAULT '0',
  `MaxPlayers` TINYINT(3) UNSIGNED NOT NULL DEFAULT '0',
  `ResetDelay` INT(10) UNSIGNED NOT NULL DEFAULT '0',
  `GhostEntranceMap` SMALLINT(5) NOT NULL DEFAULT '-1',
  `GhostEntranceX` FLOAT NOT NULL DEFAULT '0',
  `GhostEntranceY` FLOAT NOT NULL DEFAULT '0',
  `MapName` VARCHAR(128) NOT NULL DEFAULT '',
  `ScriptName` VARCHAR(128) NOT NULL DEFAULT '',
  PRIMARY KEY (`Entry`)
) ENGINE=MYISAM DEFAULT CHARSET=utf8;

INSERT INTO `map_template` VALUES
('0','0','0','0','0','0','0','0','-1','0','0','Eastern Kingdoms',''),
('1','0','0','0','0','0','0','0','-1','0','0','Kalimdor',''),
('13','0','0','0','0','0','0','0','-1','0','0','Testing',''),
('25','0','0','0','0','0','0','0','-1','0','0','Scott Test',''),
('29','0','1','0','0','0','0','0','-1','0','0','CashTest',''),
('30','0','3','0','51','60','40','0','-1','0','0','Alterac Valley',''),
('33','0','1','0','20','26','10','0','0','-230.989','1571.57','Shadowfang Keep','instance_shadowfang_keep'),
('34','0','1','717','24','32','10','0','0','-8762.38','848.01','Stormwind Stockade',''),
('35','0','0','717','0','0','0','0','-1','0','0','<unused> StormwindPrison',''),
('36','0','1','0','17','26','10','0','0','-11207.8','1681.15','Deadmines','instance_deadmines'),
('37','0','0','0','10','20','30','0','-1','0','0','Azshara Crater',''),
('42','0','0','0','0','0','0','0','-1','0','0','Collin\'s Test',''),
('43','0','1','718','17','24','10','0','1','-751.131','-2209.24','Wailing Caverns','instance_wailing_caverns'),
('44','0','1','0','0','0','0','0','-1','0','0','<unused> Monastery',''),
('47','0','1','0','29','38','10','0','1','-4459.45','-1660.21','Razorfen Kraul','instance_razorfen_kraul'),
('48','0','1','719','24','32','10','0','1','4249.12','748.387','Blackfathom Deeps','instance_blackfathom_deeps'),
('70','0','1','1337','41','51','10','0','0','-6060.18','-2955','Uldaman','instance_uldaman'),
('90','0','1','721','29','38','10','0','0','-5162.66','931.599','Gnomeregan','instance_gnomeregan'),
('109','0','1','1477','50','0','10','0','0','-10170.1','-3995.97','Sunken Temple','instance_sunken_temple'),
('129','0','1','0','37','46','10','0','1','-4662.88','-2535.87','Razorfen Downs','instance_razorfen_downs'),
('169','0','2','0','0','0','0','0','-1','0','0','Emerald Dream',''),
('189','0','1','0','34','45','10','0','0','2892.24','-811.264','Scarlet Monastery','instance_scarlet_monastery'),
('209','0','1','0','44','54','10','0','1','-6790.58','-2891.28','Zul\'Farrak','instance_zulfarrak'),
('229','0','1','1583','55','0','10','3','0','-7522.53','-1233.04','Blackrock Spire','instance_blackrock_spire'),
('230','0','1','1584','52','0','5','0','0','-7178.1','-928.639','Blackrock Depths','instance_blackrock_depths'),
('249','0','2','2159','60','0','40','5','1','-4753.31','-3752.42','Onyxia\'s Lair',''),
('269','0','1','0','0','0','0','0','-1','0','0','Caverns of Time',''),
('289','0','1','0','58','0','5','0','0','1274.78','-2552.56','Scholomance','instance_scholomance'),
('309','0','2','1977','60','0','20','3','0','-11916.1','-1224.58','Zul\'Gurub','instance_zulgurub'),
('329','0','1','0','58','0','5','0','0','3392.32','-3378.48','Stratholme','instance_stratholme'),
('349','0','1','2100','46','55','10','0','1','-1432.7','2924.98','Maraudon',''),
('369','0','0','2257','0','0','0','0','-1','0','0','Deeprun Tram',''),
('389','0','1','2437','13','18','10','0','1','1816.76','-4423.37','Ragefire Chasm',''),
('409','0','2','2717','60','0','40','7','0','-7510.56','-1036.7','Molten Core','instance_molten_core'),
('429','0','1','2557','55','0','5','0','1','-3908.03','1130','Dire Maul','instance_dire_maul'),
('449','0','0','2918','0','0','0','0','-1','0','0','Alliance PVP Barracks',''),
('450','0','0','2917','0','0','0','0','-1','0','0','Horde PVP Barracks',''),
('451','0','0','0','0','0','0','0','-1','0','0','Development Land',''),
('469','0','2','2677','60','0','40','7','0','-7663.41','-1218.67','Blackwing Lair','instance_blackwing_lair'),
('489','0','3','3277','10','60','10','0','-1','0','0','Warsong Gulch',''),
('509','0','2','3429','60','0','20','3','1','-8114.46','1526.37','Ruins of Ahn\'Qiraj','instance_ruins_of_ahnqiraj'),
('529','0','3','3358','20','60','15','0','-1','0','0','Arathi Basin',''),
('531','0','2','3428','60','0','40','7','1','-8111.72','1526.79','Ahn\'Qiraj Temple','instance_temple_of_ahnqiraj'),
('533','0','2','3456','60','0','40','7','-1','0','0','Naxxramas','instance_naxxramas'); 
 
/* 
* 20170115192602_world.sql 
*/ 
INSERT INTO `migrations` VALUES ('20170115192602'); 

-- In Dreams revamp
UPDATE `creature_template` SET `mechanic_immune_mask` = 616644443 WHERE (`entry` = 1840);
DELETE FROM `creature_ai_scripts` WHERE `creature_id` = 12128;
UPDATE `creature_template` SET `baseattacktime` = 2000, `AIName` = '', `ScriptName` = 'npc_crimson_elite' WHERE (`entry` = 12128);
 
 
/* 
* 20170116140723_world.sql 
*/ 
INSERT INTO `migrations` VALUES ('20170116140723'); 

-- eventMgr update
ALTER TABLE `game_event` ADD COLUMN `disabled` TINYINT(3) NOT NULL DEFAULT 0;
REPLACE INTO `mangos_string` (`entry`, `content_default`) VALUES 
(1600, 'Event %u is disabled!'),
(1601, 'Event %u is already enabled!'),
(1602, 'Event %u is enabled!'),
(1603, 'Event %u is already disabled!');
 
 
/* 
* 20170117191308_world.sql 
*/ 
INSERT INTO `migrations` VALUES ('20170117191308'); 

-- Call of Water

-- allow extra quest for those who forgot to speak with Water Elemental after cleansing
UPDATE `quest_template` SET `PrevQuestId` = -100 WHERE `entry` = 1103;

-- allow extra quest for those who lost somehow their Water Sapta
UPDATE `quest_template` SET `PrevQuestId` = -63, `ExclusiveGroup` = 0 WHERE `entry` = 972;

-- silence errors
INSERT INTO `spell_script_target` VALUES (8899, 0, 113791);
 
 
/* 
* 20170120215220_world.sql 
*/ 
INSERT INTO `migrations` VALUES ('20170120215220'); 

-- Critters
UPDATE `creature_template` SET `AIName` = '', `ScriptName` = 'npc_critter' WHERE `entry` IN 
(385,
582,
721,
883,
890,
1352,
1412,
1420,
1933,
2110,
2442,
2620,
2914,
3300,
3681,
4075,
4076,
4166,
4953,
16372,
5739,
5741,
5742,
5743,
5951,
6271,
6368,
6653,
16377,
16371,
16779,
7208,
8881,
8963,
9600,
9699,
9700,
10016,
10017,
10582,
10685,
10716,
10779,
10780,
11776,
12120,
12297,
12299,
12383,
13017,
13321,
13338,
14421,
14892,
15010,
16998,
15476,
15475,
16030,
16068,
16369,
16373);
 
 
/* 
* 20170120221501_world.sql 
*/ 
INSERT INTO `migrations` VALUES ('20170120221501'); 

-- Silithid Invaders
REPLACE INTO `creature` VALUES
( NULL, '4131', '1', '11143', '0', '-6489.73', '-3418.54', '-72.0054', '1.55083', '300', '5', '0', '1300', '0', '0', '1', '0' ),
( NULL, '4131', '1', '11143', '0', '-6513.45', '-3448.1', '-70.0097', '4.07589', '300', '5', '0', '1300', '0', '0', '1', '0'  ),
( NULL, '4131', '1', '11143', '0', '-6438.9', '-3434.43', '-58.7494', '5.10398', '300', '5', '0', '1300', '0', '0', '1', '0'  ),
( NULL, '4131', '1', '11143', '0', '-6467.75', '-3539.06', '-58.9529', '4.51728', '300', '5', '0', '1300', '0', '0', '1', '0' ),
( NULL, '4131', '1', '11143', '0', '-6491.92', '-3501.98', '-70.0342', '6.21531', '300', '5', '0', '1300', '0', '0', '1', '0' );
 
 
/* 
* 20170121111213_world.sql 
*/ 
INSERT INTO `migrations` VALUES ('20170121111213'); 

-- Mangletooth quest rewards
REPLACE INTO `spell_mod` (`Id`, `AttributesEx2`, `Comment`) VALUES
(16610, 4, 'Mangletooth - ignore LOS for rewSpell'),
(17013, 4, 'Mangletooth - ignore LOS for rewSpell'),
(16612, 4, 'Mangletooth - ignore LOS for rewSpell'),
(10767, 4, 'Mangletooth - ignore LOS for rewSpell'),
(16618, 4, 'Mangletooth - ignore LOS for rewSpell'),
(7764, 4, 'Mangletooth - ignore LOS for rewSpell');
 
 
/* 
* 20170121140653_world.sql 
*/ 
INSERT INTO `migrations` VALUES ('20170121140653'); 

DROP TABLE IF EXISTS `locales_area`;
CREATE TABLE `locales_area` (
  `Entry` MEDIUMINT(8) NOT NULL DEFAULT '0',
  `NameLoc1` VARCHAR(100) NOT NULL DEFAULT '',
  `NameLoc2` VARCHAR(100) NOT NULL DEFAULT '',
  `NameLoc3` VARCHAR(100) NOT NULL DEFAULT '',
  `NameLoc4` VARCHAR(100) NOT NULL DEFAULT '',
  `NameLoc5` VARCHAR(100) NOT NULL DEFAULT '',
  `NameLoc6` VARCHAR(100) NOT NULL DEFAULT '',
  `NameLoc7` VARCHAR(100) NOT NULL DEFAULT '',
  `NameLoc8` VARCHAR(100) NOT NULL DEFAULT '',
  PRIMARY KEY (`Entry`)
) ENGINE=MYISAM DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `area_template`;
CREATE TABLE `area_template` (
  `Entry` MEDIUMINT(8) DEFAULT 0 NOT NULL,
  `MapId` MEDIUMINT(8) DEFAULT 0 NOT NULL,
  `ZoneId` MEDIUMINT(8) DEFAULT 0 NOT NULL,
  `ExploreFlag` MEDIUMINT(8) DEFAULT 0 NOT NULL,
  `Flags` MEDIUMINT(8) DEFAULT 0 NOT NULL,
  `AreaLevel` MEDIUMINT(8) DEFAULT 0 NOT NULL,
  `Name` VARCHAR(100) CHARSET utf8 COLLATE utf8_general_ci DEFAULT '' NOT NULL,
  `Team` TINYINT(3) DEFAULT 0 NOT NULL,
  `LiquidTypeId` TINYINT(3) DEFAULT 0 NOT NULL,
  PRIMARY KEY (`Entry`)
 ) ENGINE=MYISAM DEFAULT CHARSET=utf8;
 
INSERT INTO `area_template` VALUES
(1,0,0,119,65,0,'Dun Morogh',2,0),
(2,0,40,120,64,0,'Longshore',0,0),
(3,0,0,121,64,0,'Badlands',0,0),
(4,0,0,122,64,0,'Blasted Lands',0,0),
(7,0,33,123,64,0,'Blackwater Cove',0,0),
(8,0,0,124,64,0,'Swamp of Sorrows',0,0),
(9,0,12,125,64,0,'Northshire Valley',0,0),
(10,0,0,617,64,0,'Duskwood',0,0),
(11,0,0,618,64,0,'Wetlands',0,0),
(12,0,0,126,64,0,'Elwynn Forest',2,0),
(13,0,10,555,64,0,'The World Tree',0,0),
(14,1,0,127,64,0,'Durotar',4,0),
(15,1,0,128,64,0,'Dustwallow Marsh',0,0),
(16,1,0,129,64,0,'Azshara',0,0),
(17,1,0,130,64,0,'The Barrens',4,0),
(18,0,12,131,64,7,'Crystal Lake',0,0),
(19,0,33,574,64,40,'Zul\'Gurub',0,0),
(20,0,40,132,64,14,'Moonbrook',0,0),
(21,0,0,133,64,0,'Kul Tiras',0,0),
(22,451,0,547,64,0,'Programmer Isle',0,0),
(23,0,12,134,64,0,'Northshire River',0,0),
(24,0,12,135,64,0,'Northshire Abbey',0,0),
(25,0,0,136,64,0,'Blackrock Mountain',0,0),
(26,0,40,602,64,0,'Lighthouse',0,0),
(28,0,0,137,64,0,'Western Plaguelands',0,0),
(30,0,0,138,64,0,'Nine',0,0),
(32,0,10,139,64,0,'The Cemetary',0,0),
(33,0,0,140,64,0,'Stranglethorn Vale',0,0),
(34,0,12,141,64,0,'Echo Ridge Mine',0,0),
(35,0,33,142,64,42,'Booty Bay',0,0),
(36,0,0,143,64,0,'Alterac Mountains',0,0),
(37,0,33,144,64,36,'Lake Nazferiti',0,0),
(38,0,0,145,64,0,'Loch Modan',2,0),
(40,0,0,146,64,0,'Westfall',2,0),
(41,0,0,556,64,0,'Deadwind Pass',0,0),
(42,0,10,147,64,25,'Darkshire',0,0),
(43,0,33,148,64,42,'Wild Shore',0,0),
(44,0,0,149,64,0,'Redridge Mountains',0,0),
(45,0,0,150,64,0,'Arathi Highlands',0,0),
(46,0,0,151,64,0,'Burning Steppes',0,0),
(47,0,0,152,64,0,'The Hinterlands',0,0),
(49,0,22,153,64,0,'Dead Man\'s Hole',0,0),
(51,0,0,154,64,0,'Searing Gorge',0,0),
(53,0,12,155,64,0,'Thieves Camp',0,0),
(54,0,12,550,64,8,'Jasperlode Mine',0,0),
(55,0,12,156,64,0,'Valley of Heroes UNUSED',0,0),
(56,0,12,157,64,0,'Heroes\' Vigil',0,0),
(57,0,12,158,64,5,'Fargodeep Mine',0,0),
(59,0,12,159,64,0,'Northshire Vineyards',0,0),
(60,0,12,606,64,8,'Forest\'s Edge',0,0),
(61,0,12,160,64,0,'Thunder Falls',0,0),
(62,0,12,161,64,8,'Brackwell Pumpkin Patch',0,0),
(63,0,12,162,64,6,'The Stonefield Farm',0,0),
(64,0,12,163,64,6,'The Maclure Vineyards',0,0),
(65,0,0,164,68,0,'***On Map Dungeon***',0,0),
(66,1,0,165,68,0,'***On Map Dungeon***',0,0),
(67,17,0,166,68,0,'***On Map Dungeon***',0,0),
(68,0,44,557,64,16,'Lake Everstill',0,0),
(69,0,44,167,64,15,'Lakeshire',0,0),
(70,0,44,168,64,24,'Stonewatch',0,0),
(71,0,44,627,64,20,'Stonewatch Falls',0,0),
(72,0,4,169,64,63,'The Dark Portal',0,0),
(73,0,4,170,64,50,'The Tainted Scar',0,0),
(74,0,8,171,64,43,'Pool of Tears',0,0),
(75,0,8,172,64,37,'Stonard',0,0),
(76,0,8,173,64,37,'Fallow Sanctuary',0,0),
(77,0,1,174,64,0,'Anvilmar',0,0),
(80,0,12,175,64,10,'Stormwind Mountains',2,0),
(81,451,22,575,64,0,'Jeff NE Quadrant Changed',0,0),
(82,451,22,176,64,0,'Jeff NW Quadrant',0,0),
(83,451,22,177,64,0,'Jeff SE Quadrant',0,0),
(84,451,22,178,64,0,'Jeff SW Quadrant',0,0),
(85,0,0,179,64,0,'Tirisfal Glades',4,0),
(86,0,12,180,64,8,'Stone Cairn Lake',0,0),
(87,0,12,548,64,5,'Goldshire',0,0),
(88,0,12,181,64,6,'Eastvale Logging Camp',0,0),
(89,0,12,182,64,0,'Mirror Lake Orchard',0,0),
(91,0,12,183,64,8,'Tower of Azora',0,0),
(92,0,12,558,64,0,'Mirror Lake',0,0),
(93,0,10,628,64,28,'Vul\'Gol Ogre Mound',0,0),
(94,0,10,184,64,24,'Raven Hill',0,0),
(95,0,44,185,64,20,'Redridge Canyons',0,0),
(96,0,44,186,64,25,'Tower of Ilgalar',0,0),
(97,0,44,187,64,19,'Alther\'s Mill',0,0),
(98,0,44,188,64,17,'Rethban Caverns',0,0),
(99,0,33,189,64,30,'Rebel Camp',0,0),
(100,0,33,585,64,31,'Nesingwary\'s Expedition',0,0),
(101,0,33,190,64,32,'Kurzen\'s Compound',0,0),
(102,0,33,586,64,41,'Ruins of Zul\'Kunda',0,0),
(103,0,33,191,64,40,'Ruins of Zul\'Mamwe',0,0),
(104,0,33,192,64,37,'The Vile Reef',0,0),
(105,0,33,193,64,42,'Mosh\'Ogg Ogre Mound',0,0),
(106,0,33,194,64,0,'The Stockpile',0,0),
(107,0,40,195,64,14,'Saldean\'s Farm',0,0),
(108,0,40,196,64,15,'Sentinel Hill',0,0),
(109,0,40,197,64,15,'Furlbrow\'s Pumpkin Farm',0,0),
(111,0,40,198,64,12,'Jangolode Mine',0,0),
(113,0,40,576,64,15,'Gold Coast Quarry',0,0),
(115,0,40,199,64,17,'Westfall Lighthouse',0,0),
(116,0,8,200,64,39,'Misty Valley',0,0),
(117,0,33,629,64,35,'Grom\'gol Base Camp',0,0),
(118,0,11,201,64,22,'Whelgar\'s Excavation Site',0,0),
(120,0,12,559,64,8,'Westbrook Garrison',0,0),
(121,0,10,202,64,28,'Tranquil Gardens Cemetery',0,0),
(122,0,33,203,64,37,'Zuuldaia Ruins',0,0),
(123,0,33,204,64,34,'Bal\'lal Ruins',0,0),
(125,0,33,205,64,35,'Kal\'ai Ruins',0,0),
(126,0,33,206,64,0,'Tkashi Ruins',0,0),
(127,0,33,207,64,40,'Balia\'mah Ruins',0,0),
(128,0,33,208,64,36,'Ziata\'jai Ruins',0,0),
(129,0,33,209,64,37,'Mizjah Ruins',0,0),
(130,0,0,210,64,0,'Silverpine Forest',4,0),
(131,0,1,211,64,5,'Kharanos',0,0),
(132,0,1,212,64,0,'Coldridge Valley',0,0),
(133,0,1,213,64,10,'Gnomeregan',0,0),
(134,0,1,214,64,10,'Gol\'Bolar Quarry',0,0),
(135,0,1,215,64,7,'Frostmane Hold',0,0),
(136,0,1,216,64,5,'The Grizzled Den',0,0),
(137,0,1,217,64,7,'Brewnall Village',0,0),
(138,0,1,218,64,7,'Misty Pine Refuge',0,0),
(139,0,0,219,64,0,'Eastern Plaguelands',0,0),
(141,1,0,220,64,0,'Teldrassil',2,0),
(142,0,38,221,64,15,'Ironband\'s Excavation Site',0,0),
(143,0,38,222,64,18,'Mo\'grosh Stronghold',0,0),
(144,0,38,223,64,10,'Thelsamar',0,0),
(145,0,38,224,64,18,'Algaz Gate',0,0),
(146,0,38,225,64,15,'Stonewrought Dam',0,0),
(147,0,38,226,64,15,'The Farstrider Lodge',0,0),
(148,1,0,227,64,0,'Darkshore',2,0),
(149,0,38,228,64,12,'Silver Stream Mine',0,0),
(150,0,11,229,64,20,'Menethil Harbor',0,0),
(151,451,0,560,64,0,'Designer Island',0,0),
(152,0,85,230,64,9,'The Bulwark',0,0),
(153,0,85,607,64,10,'Ruins of Lordaeron',0,0),
(154,0,85,231,64,0,'Deathknell',0,0),
(155,0,85,232,64,0,'Night Web\'s Hollow',0,0),
(156,0,85,233,64,6,'Solliden Farmstead',0,0),
(157,0,85,234,64,8,'Agamand Mills',0,0),
(158,0,85,235,64,0,'Agamand Family Crypt',0,0),
(159,0,85,236,64,5,'Brill',0,0),
(160,0,85,237,64,12,'Whispering Gardens',0,0),
(161,0,85,238,64,10,'Terrace of Repose',0,0),
(162,0,85,239,64,7,'Brightwater Lake',0,0),
(163,0,85,240,64,0,'Gunther\'s Retreat',0,0),
(164,0,85,241,64,7,'Garren\'s Haunt',0,0),
(165,0,85,242,64,5,'Balnir Farmstead',0,0),
(166,0,85,243,64,5,'Cold Hearth Manor',0,0),
(167,0,85,244,64,8,'Crusader Outpost',0,0),
(168,0,85,245,64,0,'The North Coast',0,0),
(169,0,85,577,64,0,'Whispering Shore',0,0),
(170,0,0,246,64,0,'Lordamere Lake',0,0),
(172,0,130,247,64,18,'Fenris Isle',0,0),
(173,0,85,620,64,0,'Faol\'s Rest',0,0),
(186,1,141,622,64,5,'Dolanaar',0,0),
(187,1,141,248,64,7,'Darnassus UNUSED',0,0),
(188,1,141,561,64,0,'Shadowglen',0,0),
(189,0,1,249,64,5,'Steelgrill\'s Depot',0,0),
(190,0,28,250,64,56,'Hearthglen',0,0),
(192,0,28,251,64,55,'Northridge Lumber Camp',0,0),
(193,0,28,252,64,55,'Ruins of Andorhal',0,0),
(195,0,28,253,64,0,'School of Necromancy',0,0),
(196,0,28,578,64,0,'Uther\'s Tomb',0,0),
(197,0,28,254,64,50,'Sorrow Hill',0,0),
(198,0,28,255,64,55,'The Weeping Cave',0,0),
(199,0,28,256,64,50,'Felstone Field',0,0),
(200,0,28,257,64,54,'Dalson\'s Tears',0,0),
(201,0,28,258,64,57,'Gahrron\'s Withering',0,0),
(202,0,28,259,64,46,'The Writhing Haunt',0,0),
(203,0,28,260,64,0,'Mardenholde Keep',0,0),
(204,0,130,261,64,15,'Pyrewood Village',0,0),
(205,0,11,262,64,28,'Dun Modr',0,0),
(206,36,0,263,64,0,'Westfall',0,0),
(207,36,0,264,64,0,'The Great Sea',0,0),
(208,36,0,265,64,0,'Unused Ironcladcove',0,0),
(209,33,0,266,0,16,'Shadowfang Keep',4,0),
(210,36,0,267,68,0,'***On Map Dungeon***',0,0),
(211,0,1,268,64,7,'Iceflow Lake',0,0),
(212,0,1,269,64,8,'Helm\'s Bed Lake',0,0),
(213,0,130,270,64,13,'Deep Elem Mine',0,0),
(214,0,0,271,64,0,'The Great Sea',0,0),
(215,1,0,272,64,0,'Mulgore',4,0),
(219,0,40,273,64,15,'Alexston Farmstead',0,0),
(220,1,215,562,64,0,'Red Cloud Mesa',0,0),
(221,1,215,274,64,0,'Camp Narache',0,0),
(222,1,215,275,64,5,'Bloodhoof Village',0,0),
(223,1,215,276,64,0,'Stonebull Lake',0,0),
(224,1,215,277,64,7,'Ravaged Caravan',0,0),
(225,1,215,278,64,9,'Red Rocks',0,0),
(226,0,130,551,64,11,'The Skittering Dark',0,0),
(227,0,130,279,64,11,'Valgan\'s Field',0,0),
(228,0,130,280,64,10,'The Sepulcher',0,0),
(229,0,130,281,64,12,'Olsen\'s Farthing',0,0),
(230,0,130,282,64,18,'The Greymane Wall',0,0),
(231,0,130,283,64,20,'Beren\'s Peril',0,0),
(232,0,130,284,64,0,'The Dawning Isles',0,0),
(233,0,130,285,64,15,'Ambermill',0,0),
(235,0,130,608,64,0,'Fenris Keep',0,0),
(236,0,130,286,64,16,'Shadowfang Keep',0,0),
(237,0,130,287,64,16,'The Decrepit Ferry',0,0),
(238,0,130,587,64,0,'Malden\'s Orchard',0,0),
(239,0,130,588,64,11,'The Ivar Patch',0,0),
(240,0,130,288,64,12,'The Dead Field',0,0),
(241,0,10,289,64,26,'The Rotting Orchard',0,0),
(242,0,10,290,64,28,'Brightwood Grove',0,0),
(243,0,10,291,64,0,'Forlorn Rowe',0,0),
(244,0,10,292,64,0,'The Whipple Estate',0,0),
(245,0,10,563,64,25,'The Yorgen Farmstead',0,0),
(246,0,51,293,64,48,'The Cauldron',0,0),
(247,0,51,294,64,45,'Grimesilt Dig Site',0,0),
(249,0,46,1,64,50,'Dreadmaul Rock',0,0),
(250,0,46,579,64,54,'Ruins of Thaurissan',0,0),
(251,0,46,2,64,0,'Flame Crest',0,0),
(252,0,46,3,64,57,'Blackrock Stronghold',0,0),
(253,0,46,4,64,56,'The Pillar of Ash',0,0),
(254,0,46,630,64,55,'Blackrock Mountain',0,0),
(255,0,46,5,64,59,'Altar of Storms',0,0),
(256,1,141,6,64,0,'Aldrassil',0,0),
(257,1,141,7,64,0,'Shadowthread Cave',0,0),
(258,1,141,8,64,0,'Fel Rock',0,0),
(259,1,141,9,64,5,'Lake Al\'Ameth',0,0),
(260,1,141,10,64,6,'Starbreeze Village',0,0),
(261,1,141,11,64,8,'Gnarlpine Hold',0,0),
(262,1,141,12,64,0,'Ban\'ethil Barrow Den',0,0),
(263,1,141,13,64,0,'The Cleft',0,0),
(264,1,141,14,64,9,'The Oracle Glade',0,0),
(265,1,141,15,64,11,'Wellspring River',0,0),
(266,1,141,16,64,9,'Wellspring Lake',0,0),
(267,0,0,17,64,0,'Hillsbrad Foothills',0,0),
(268,37,0,580,64,0,'Azshara Crater',0,0),
(269,0,0,18,64,18,'Dun Algaz',0,0),
(271,0,267,615,64,22,'Southshore',0,0),
(272,0,267,19,64,20,'Tarren Mill',0,0),
(275,0,267,20,64,21,'Durnholde Keep',0,0),
(276,0,0,564,64,0,'UNUSED Stonewrought Pass',0,0),
(277,0,36,21,64,0,'The Foothill Caverns',0,0),
(278,0,36,22,64,32,'Lordamere Internment Camp',0,0),
(279,0,36,23,64,30,'Dalaran',0,0),
(280,0,36,24,64,34,'Strahnbrad',0,0),
(281,0,36,25,64,36,'Ruins of Alterac',0,0),
(282,0,36,26,64,35,'Crushridge Hold',0,0),
(283,0,36,27,64,35,'Slaughter Hollow',0,0),
(284,0,36,28,64,27,'The Uplands',0,0),
(285,0,267,29,64,21,'Southpoint Tower',0,0),
(286,0,267,30,64,22,'Hillsbrad Fields',0,0),
(287,0,267,31,64,0,'Hillsbrad',0,0),
(288,0,267,32,64,27,'Azurelode Mine',0,0),
(289,0,267,33,64,26,'Nethander Stead',0,0),
(290,0,267,34,64,30,'Dun Garok',0,0),
(293,0,0,35,64,30,'Thoradin\'s Wall',0,0),
(294,0,267,36,64,30,'Eastern Strand',0,0),
(295,0,267,616,64,30,'Western Strand',0,0),
(296,0,0,37,64,0,'South Seas UNUSED',0,0),
(297,0,33,38,64,50,'Jaguero Isle',0,0),
(298,0,11,39,64,0,'Baradin Bay',0,0),
(299,0,11,40,64,0,'Menethil Bay',0,0),
(300,0,8,41,64,41,'Misty Reed Strand',0,0),
(301,0,33,42,64,0,'The Savage Coast',0,0),
(302,0,33,565,64,0,'The Crystal Shore',0,0),
(303,0,33,43,64,0,'Shell Beach',0,0),
(305,0,130,44,64,0,'North Tide\'s Run',0,0),
(306,0,130,45,64,0,'South Tide\'s Run',0,0),
(307,0,47,46,64,48,'The Overlook Cliffs',0,0),
(308,0,0,631,64,0,'The Forbidding Sea',0,0),
(309,0,11,47,64,24,'Ironbeard\'s Tomb',0,0),
(310,0,33,48,64,41,'Crystalvein Mine',0,0),
(311,0,33,589,64,44,'Ruins of Aboraz',0,0),
(312,0,33,49,64,0,'Janeiro\'s Point',0,0),
(313,0,45,632,64,31,'Northfold Manor',0,0),
(314,0,45,50,64,33,'Go\'Shek Farm',0,0),
(315,0,45,590,64,31,'Dabyrie\'s Farmstead',0,0),
(316,0,45,51,64,35,'Boulderfist Hall',0,0),
(317,0,45,609,64,33,'Witherbark Village',0,0),
(318,0,45,52,64,36,'Drywhisker Gorge',0,0),
(320,0,45,53,64,30,'Refuge Pointe',0,0),
(321,0,45,54,64,30,'Hammerfall',0,0),
(322,0,45,581,64,0,'Blackwater Shipwrecks',0,0),
(323,0,45,55,64,0,'O\'Breen\'s Camp',0,0),
(324,0,45,56,64,36,'Stromgarde Keep',0,0),
(325,0,45,57,64,0,'The Tower of Arathor',0,0),
(326,0,45,58,64,0,'The Sanctum',0,0),
(327,0,45,59,64,40,'Faldir\'s Cove',0,0),
(328,0,45,566,64,0,'The Drowned Reef',0,0),
(330,0,0,60,64,0,'Thandol Span',0,0),
(331,1,0,61,64,0,'Ashenvale',0,0),
(332,1,0,62,64,0,'The Great Sea',0,0),
(333,0,45,63,64,38,'Circle of East Binding',0,0),
(334,0,45,64,64,38,'Circle of West Binding',0,0),
(335,0,45,65,64,38,'Circle of Inner Binding',0,0),
(336,0,45,66,64,38,'Circle of Outer Binding',0,0),
(337,0,3,67,64,36,'Apocryphan\'s Rest',0,0),
(338,0,3,633,64,39,'Angor Fortress',0,0),
(339,0,3,634,64,45,'Lethlor Ravine',0,0),
(340,0,3,68,64,38,'Kargath',0,0),
(341,0,3,69,64,36,'Camp Kosh',0,0),
(342,0,3,70,64,39,'Camp Boff',0,0),
(343,0,3,71,64,0,'Camp Wurg',0,0),
(344,0,3,72,64,43,'Camp Cagg',0,0),
(345,0,3,73,64,39,'Agmond\'s End',0,0),
(346,0,3,74,64,36,'Hammertoe\'s Digsite',0,0),
(347,0,3,75,64,43,'Dustbelch Grotto',0,0),
(348,0,47,76,64,41,'Aerie Peak',0,0),
(349,0,47,77,64,0,'Wildhammer Keep',0,0),
(350,0,47,78,64,45,'Quel\'Danil Lodge',0,0),
(351,0,47,79,64,48,'Skulk Rock',0,0),
(352,0,47,80,64,0,'Zun\'watha',0,0),
(353,0,47,81,64,44,'Shadra\'Alor',0,0),
(354,0,47,591,64,45,'Jintha\'Alor',0,0),
(355,0,47,592,64,46,'The Altar of Zul',0,0),
(356,0,47,82,64,41,'Seradane',0,0),
(357,1,0,83,64,0,'Feralas',0,0),
(358,1,215,84,64,0,'Brambleblade Ravine',0,0),
(359,1,17,85,64,25,'Bael Modan',0,0),
(360,1,215,86,64,7,'The Venture Co. Mine',0,0),
(361,1,0,87,64,0,'Felwood',0,0),
(362,1,14,88,64,5,'Razor Hill',0,0),
(363,1,14,89,64,0,'Valley of Trials',0,0),
(364,1,14,90,64,0,'The Den',0,0),
(365,1,14,91,64,0,'Burning Blade Coven',0,0),
(366,1,14,92,64,7,'Kolkar Crag',0,0),
(367,1,14,93,64,6,'Sen\'jin Village',0,0),
(368,1,14,94,64,7,'Echo Isles',0,0),
(369,1,14,95,64,9,'Thunder Ridge',0,0),
(370,1,14,96,64,8,'Drygulch Ravine',0,0),
(371,1,14,567,64,0,'Dustwind Cave',0,0),
(372,1,14,97,64,6,'Tiragarde Keep',0,0),
(373,1,14,98,64,0,'Scuttle Coast',0,0),
(374,1,14,99,64,0,'Bladefist Bay',0,0),
(375,1,14,100,64,0,'Deadeye Shore',0,0),
(377,1,0,101,64,9,'Southfury River',0,0),
(378,1,17,102,64,10,'Camp Taurajo',0,0),
(379,1,17,103,64,10,'Far Watch Post',0,0),
(380,1,17,104,64,15,'The Crossroads',0,0),
(381,1,17,105,64,17,'Boulder Lode Mine',0,0),
(382,1,17,552,64,15,'The Sludge Fen',0,0),
(383,1,17,106,64,14,'The Dry Hills',0,0),
(384,1,17,107,64,11,'Dreadmist Peak',0,0),
(385,1,17,108,64,15,'Northwatch Hold',0,0),
(386,1,17,109,64,12,'The Forgotten Pools',0,0),
(387,1,17,582,64,12,'Lushwater Oasis',0,0),
(388,1,17,110,64,15,'The Stagnant Oasis',0,0),
(390,1,17,111,64,20,'Field of Giants',0,0),
(391,1,17,112,64,12,'The Merchant Coast',0,0),
(392,1,17,113,64,15,'Ratchet',0,0),
(393,1,14,114,64,0,'Darkspear Strand',0,0),
(394,0,0,115,64,0,'Darrowmere Lake UNUSED',0,0),
(395,0,394,116,64,0,'Caer Darrow UNUSED',0,0),
(396,1,215,117,64,6,'Winterhoof Water Well',0,0),
(397,1,215,118,64,7,'Thunderhorn Water Well',0,0),
(398,1,215,441,64,8,'Wildmane Water Well',0,0),
(399,1,215,610,64,6,'Skyline Ridge',0,0),
(400,1,0,442,64,0,'Thousand Needles',0,0),
(401,1,17,443,64,0,'The Tidus Stair',0,0),
(403,1,15,568,64,0,'Shady Rest Inn',0,0),
(404,1,215,444,64,8,'Bael\'dun Digsite',0,0),
(405,1,0,445,64,0,'Desolace',0,0),
(406,1,0,446,64,0,'Stonetalon Mountains',0,0),
(407,1,14,447,64,10,'Orgrimmar UNUSED',0,0),
(408,0,0,448,64,0,'Gillijim\'s Isle',0,0),
(409,0,0,449,64,0,'Island of Doctor Lapidis',0,0),
(410,1,14,450,64,8,'Razorwind Canyon',0,0),
(411,1,331,451,64,0,'Bathran\'s Haunt',0,0),
(412,1,331,625,64,0,'The Ruins of Ordil\'Aran',0,0),
(413,1,331,452,64,19,'Maestra\'s Post',0,0),
(414,1,331,453,64,20,'The Zoram Strand',0,0),
(415,1,331,454,64,20,'Astranaar',0,0),
(416,1,331,455,64,23,'The Shrine of Aessina',0,0),
(417,1,331,456,64,25,'Fire Scar Shrine',0,0),
(418,1,331,457,64,23,'The Ruins of Stardust',0,0),
(419,1,331,458,64,28,'The Howling Vale',0,0),
(420,1,331,459,64,25,'Silverwind Refuge',0,0),
(421,1,331,460,64,25,'Mystral Lake',0,0),
(422,1,331,461,64,26,'Fallen Sky Lake',0,0),
(424,1,331,462,64,22,'Iris Lake',0,0),
(425,1,331,549,64,0,'Moonwell',0,0),
(426,1,331,463,64,24,'Raynewood Retreat',0,0),
(427,1,331,464,64,0,'The Shady Nook',0,0),
(428,1,331,569,64,25,'Night Run',0,0),
(429,1,331,611,64,0,'Xavian',0,0),
(430,1,331,465,64,28,'Satyrnaar',0,0),
(431,1,331,553,64,25,'Splintertree Post',0,0),
(432,1,331,466,64,30,'The Dor\'Danil Barrow Den',0,0),
(433,1,331,467,64,0,'Falfarren River',0,0),
(434,1,331,570,64,29,'Felfire Hill',0,0),
(435,1,331,468,64,0,'Demon Fall Canyon',0,0),
(436,1,331,469,64,0,'Demon Fall Ridge',0,0),
(437,1,331,612,64,22,'Warsong Lumber Camp',0,0),
(438,1,331,470,64,20,'Bough Shadow',0,0),
(439,1,400,471,64,35,'The Shimmering Flats',0,0),
(440,1,0,472,64,0,'Tanaris',0,0),
(441,1,331,473,64,20,'Lake Falathim',0,0),
(442,1,148,474,64,12,'Auberdine',0,0),
(443,1,148,475,64,19,'Ruins of Mathystra',0,0),
(444,1,148,476,64,16,'Tower of Althalaxx',0,0),
(445,1,148,477,64,14,'Cliffspring Falls',0,0),
(446,1,148,478,64,11,'Bashal\'Aran',0,0),
(447,1,148,479,64,11,'Ameth\'Aran',0,0),
(448,1,148,480,64,15,'Grove of the Ancients',0,0),
(449,1,148,481,64,16,'The Master\'s Glaive',0,0),
(450,1,148,482,64,19,'Remtravel\'s Excavation',0,0),
(452,1,148,483,64,0,'Mist\'s Edge',0,0),
(453,1,148,583,64,0,'The Long Wash',0,0),
(454,1,148,484,64,0,'Wildbend River',0,0),
(455,1,148,485,64,0,'Blackwood Den',0,0),
(456,1,148,486,64,14,'Cliffspring River',0,0),
(457,1,0,571,64,0,'The Veiled Sea',0,0),
(458,1,17,487,64,0,'Gold Road',0,0),
(459,0,85,375,64,10,'Scarlet Watch Post',0,0),
(460,1,406,488,64,20,'Sun Rock Retreat',0,0),
(461,1,406,489,64,20,'Windshear Crag',0,0),
(463,1,406,490,64,0,'Cragpool Lake',0,0),
(464,1,406,491,64,21,'Mirkfallon Lake',0,0),
(465,1,406,492,64,25,'The Charred Vale',0,0),
(466,1,406,493,64,0,'Valley of the Bloodfuries',0,0),
(467,1,406,613,64,25,'Stonetalon Peak',0,0),
(468,1,406,494,64,0,'The Talon Den',0,0),
(469,1,406,495,64,0,'Greatwood Vale',0,0),
(470,1,215,496,64,10,'Thunder Bluff UNUSED',0,0),
(471,1,215,497,64,0,'Brave Wind Mesa',0,0),
(472,1,215,498,64,0,'Fire Stone Mesa',0,0),
(473,1,215,554,64,0,'Mantle Rock',0,0),
(474,1,215,499,64,0,'Hunter Rise UNUSED',0,0),
(475,1,215,500,64,0,'Spirit RiseUNUSED',0,0),
(476,1,215,501,64,0,'Elder RiseUNUSED',0,0),
(477,0,33,502,64,43,'Ruins of Jubuwal',0,0),
(478,1,141,503,64,8,'Pools of Arlithrien',0,0),
(479,1,400,504,64,0,'The Rustmaul Dig Site',0,0),
(480,1,400,505,64,30,'Camp E\'thok',0,0),
(481,1,400,572,64,24,'Splithoof Crag',0,0),
(482,1,400,506,64,29,'Highperch',0,0),
(483,1,400,507,64,30,'The Screeching Canyon',0,0),
(484,1,400,508,64,26,'Freewind Post',0,0),
(485,1,400,509,64,25,'The Great Lift',0,0),
(486,1,400,510,64,0,'Galak Hold',0,0),
(487,1,400,511,64,0,'Roguefeather Den',0,0),
(488,1,400,512,64,0,'The Weathered Nook',0,0),
(489,1,357,513,64,0,'Thalanaar',0,0),
(490,1,0,514,64,0,'Un\'Goro Crater',0,0),
(491,47,0,515,0,0,'Razorfen Kraul',4,0),
(492,0,10,516,64,26,'Raven Hill Cemetery',0,0),
(493,1,0,517,64,0,'Moonglade',0,0),
(495,0,0,519,64,0,'DELETE ME',0,0),
(496,1,15,518,64,36,'Brackenwall Village',0,0),
(497,1,15,520,64,0,'Swamplight Manor',0,0),
(498,1,15,521,64,0,'Bloodfen Burrow',0,0),
(499,1,15,522,64,0,'Darkmist Cavern',0,0),
(500,1,15,623,64,0,'Moggle Point',0,0),
(501,1,15,614,64,0,'Beezil\'s Wreck',0,0),
(502,1,15,624,64,36,'Witch Hill',0,0),
(503,1,15,573,64,0,'Sentry Point',0,0),
(504,1,15,523,64,0,'North Point Tower',0,0),
(505,1,15,524,64,0,'West Point Tower',0,0),
(506,1,15,525,64,0,'Lost Point',0,0),
(507,1,15,526,64,36,'Bluefen',0,0),
(508,1,15,527,64,0,'Stonemaul Ruins',0,0),
(509,1,15,528,64,38,'The Den of Flame',0,0),
(510,1,15,584,64,0,'The Dragonmurk',0,0),
(511,1,15,529,64,43,'Wyrmbog',0,0),
(512,1,15,530,64,0,'Onyxia\'s Lair UNUSED',0,0),
(513,1,15,531,64,36,'Theramore Isle',0,0),
(514,1,15,532,64,0,'Foothold Citadel',0,0),
(515,1,15,533,64,0,'Ironclad Prison',0,0),
(516,1,15,534,64,0,'Dustwallow Bay',0,0),
(517,1,15,535,64,0,'Tidefury Cove',0,0),
(518,1,15,536,64,36,'Dreadmurk Shore',0,0),
(536,0,10,537,64,24,'Addle\'s Stead',0,0),
(537,1,490,538,64,55,'Fire Plume Ridge',0,0),
(538,1,490,539,64,49,'Lakkari Tar Pits',0,0),
(539,1,490,540,64,53,'Terror Run',0,0),
(540,1,490,541,64,51,'The Slithering Scar',0,0),
(541,1,490,542,64,0,'Marshal\'s Refuge',0,0),
(542,1,490,543,64,0,'Fungal Rock',0,0),
(543,1,490,544,64,53,'Golakka Hot Springs',0,0),
(556,0,38,545,64,12,'The Loch',0,0),
(576,0,10,546,64,25,'Beggar\'s Haunt',0,0);

INSERT INTO `area_template` VALUES
(596,1,405,593,64,35,'Kodo Graveyard',0,0),
(597,1,405,594,64,0,'Ghost Walker Post',0,0),
(598,1,405,595,64,0,'Sar\'theris Strand',0,0),
(599,1,405,596,64,30,'Thunder Axe Fortress',0,0),
(600,1,405,597,64,0,'Bolgan\'s Hole',0,0),
(602,1,405,599,64,39,'Mannoroc Coven',0,0),
(603,1,405,600,64,31,'Sargeron',0,0),
(604,1,405,601,64,36,'Magram Village',0,0),
(606,1,405,603,64,34,'Gelkis Village',0,0),
(607,1,405,604,64,37,'Valley of Spears',0,0),
(608,1,405,605,64,30,'Nijel\'s Point',0,0),
(609,1,405,598,64,32,'Kolkar Village',0,0),
(616,1,0,619,64,0,'Hyjal',0,0),
(618,1,0,621,65,0,'Winterspring',0,0),
(636,1,406,626,64,0,'Blackwolf River',0,0),
(637,1,215,635,64,0,'Kodo Rock',0,0),
(638,1,14,636,64,0,'Hidden Path',0,0),
(639,1,14,637,64,0,'Spirit Rock',0,0),
(640,1,14,638,64,0,'Shrine of the Dormant Flame',0,0),
(656,1,493,295,64,15,'Lake Elune\'ara',0,0),
(657,0,8,296,64,37,'The Harborage',0,0),
(676,150,0,297,64,0,'Outland',0,0),
(696,1,141,298,64,0,'Craftsmen\'s Terrace UNUSED',0,0),
(697,1,141,299,64,0,'Tradesmen\'s Terrace UNUSED',0,0),
(698,1,141,300,64,0,'The Temple Gardens UNUSED',0,0),
(699,1,141,301,64,0,'Temple of Elune UNUSED',0,0),
(700,1,141,302,64,0,'Cenarion Enclave UNUSED',0,0),
(701,1,141,303,64,0,'Warrior\'s Terrace UNUSED',0,0),
(702,1,141,304,64,11,'Rut\'theran Village',0,0),
(716,0,1,639,64,0,'Ironband\'s Compound',0,0),
(717,34,0,640,0,0,'The Stockade',2,0),
(718,43,0,641,0,0,'Wailing Caverns',4,0),
(719,48,0,642,0,0,'Blackfathom Deeps',0,0),
(720,1,17,643,64,0,'Fray Island',0,0),
(721,90,0,305,0,0,'Gnomeregan',2,0),
(722,129,0,644,3,0,'Razorfen Downs',4,0),
(736,1,141,645,64,8,'Ban\'ethil Hollow',0,0),
(796,189,0,646,0,0,'Scarlet Monastery',4,0),
(797,0,12,647,64,8,'Jerod\'s Landing',0,0),
(798,0,12,648,64,8,'Ridgepoint Tower',0,0),
(799,0,10,649,64,10,'The Darkened Bank',0,0),
(800,0,1,650,64,4,'Coldridge Pass',0,0),
(801,0,1,651,64,8,'Chill Breeze Valley',0,0),
(802,0,1,652,64,8,'Shimmer Ridge',0,0),
(803,0,1,653,64,7,'Amberstill Ranch',0,0),
(804,0,1,654,64,8,'The Tundrid Hills',0,0),
(805,0,1,655,64,0,'South Gate Pass',0,0),
(806,0,1,656,64,12,'South Gate Outpost',0,0),
(807,0,1,657,64,0,'North Gate Pass',0,0),
(808,0,1,658,64,11,'North Gate Outpost',0,0),
(809,0,1,659,64,7,'Gates of Ironforge',0,0),
(810,0,85,660,64,7,'Stillwater Pond',0,0),
(811,0,85,661,64,5,'Nightmare Vale',0,0),
(812,0,85,662,64,10,'Venomweb Vale',0,0),
(813,0,28,663,64,52,'The Bulwark',0,0),
(814,1,14,664,64,0,'Southfury River',0,0),
(815,1,17,665,64,0,'Southfury River',0,0),
(816,1,14,666,64,8,'Razormane Grounds',0,0),
(817,1,14,667,64,10,'Skull Rock',0,0),
(818,1,215,668,64,5,'Palemane Rock',0,0),
(819,1,215,669,64,9,'Windfury Ridge',0,0),
(820,1,215,670,64,5,'The Golden Plains',0,0),
(821,1,215,671,64,8,'The Rolling Plains',0,0),
(836,0,11,672,64,20,'Dun Algaz',0,0),
(837,0,38,673,64,0,'Dun Algaz',0,0),
(838,0,38,306,64,0,'North Gate Pass',0,0),
(839,0,38,307,64,0,'South Gate Pass',0,0),
(856,0,10,674,64,19,'Twilight Grove',0,0),
(876,1,0,675,64,0,'GM Island',0,0),
(877,1,17,676,64,0,'Delete ME',0,0),
(878,1,16,677,64,0,'Southfury River',0,0),
(879,1,331,678,64,0,'Southfury River',0,0),
(880,0,45,679,64,30,'Thandol Span',0,0),
(881,0,11,680,64,0,'Thandol Span',0,0),
(896,0,267,308,64,30,'Purgation Isle',0,0),
(916,0,40,681,64,9,'The Jansen Stead',0,0),
(917,0,40,682,64,18,'The Dead Acre',0,0),
(918,0,40,683,64,14,'The Molsen Farm',0,0),
(919,0,40,684,64,14,'Stendel\'s Pond',0,0),
(920,0,40,309,64,17,'The Dagger Hills',0,0),
(921,0,40,310,64,16,'Demont\'s Place',0,0),
(922,0,40,311,64,18,'The Dust Plains',0,0),
(923,0,38,312,64,13,'Stonesplinter Valley',0,0),
(924,0,38,313,64,11,'Valley of Kings',0,0),
(925,0,38,314,64,12,'Algaz Station',0,0),
(926,0,130,315,64,0,'Bucklebree Farm',0,0),
(927,0,130,316,64,14,'The Shining Strand',0,0),
(928,0,130,317,64,0,'North Tide\'s Hollow',0,0),
(936,0,38,318,64,12,'Grizzlepaw Ridge',0,0),
(956,169,0,319,64,0,'The Verdant Fields',0,0),
(976,1,440,320,64,40,'Gadgetzan',0,0),
(977,1,440,390,64,40,'Steamwheedle Port',0,0),
(978,1,440,321,64,45,'Zul\'Farrak',0,0),
(979,1,440,322,64,44,'Sandsorrow Watch',0,0),
(980,1,440,323,64,49,'Thistleshrub Valley',0,0),
(981,1,440,324,64,48,'The Gaping Chasm',0,0),
(982,1,440,325,64,48,'The Noxious Lair',0,0),
(983,1,440,326,64,47,'Dunemaul Compound',0,0),
(984,1,440,327,64,47,'Eastmoon Ruins',0,0),
(985,1,440,328,64,44,'Waterspring Field',0,0),
(986,1,440,329,64,45,'Zalashji\'s Den',0,0),
(987,1,440,330,64,48,'Land\'s End Beach',0,0),
(988,1,440,331,64,0,'Wavestrider Beach',0,0),
(989,1,440,332,64,0,'Uldum',0,0),
(990,1,440,333,64,50,'Valley of the Watchers',0,0),
(991,1,440,334,64,0,'Gunstan\'s Post',0,0),
(992,1,440,335,64,47,'Southmoon Ruins',0,0),
(996,0,44,408,64,22,'Render\'s Camp',0,0),
(997,0,44,409,64,20,'Render\'s Valley',0,0),
(998,0,44,410,64,25,'Render\'s Rock',0,0),
(999,0,44,411,64,0,'Stonewatch Tower',0,0),
(1000,0,44,412,64,22,'Galardell Valley',0,0),
(1001,0,44,336,64,16,'Lakeridge Highway',0,0),
(1002,0,44,337,64,16,'Three Corners',0,0),
(1016,0,11,338,64,28,'Direforge Hill',0,0),
(1017,0,11,339,64,30,'Raptor Ridge',0,0),
(1018,0,11,340,64,25,'Black Channel Marsh',0,0),
(1019,0,139,341,64,0,'The Green Belt',0,0),
(1020,0,11,342,64,22,'Mosshide Fen',0,0),
(1021,0,11,343,64,22,'Thelgen Rock',0,0),
(1022,0,11,344,64,24,'Bluegill Marsh',0,0),
(1023,0,11,345,64,25,'Saltspray Glen',0,0),
(1024,0,11,346,64,20,'Sundown Marsh',0,0),
(1025,0,11,347,64,21,'The Green Belt',0,0),
(1036,0,11,391,64,28,'Angerfang Encampment',0,0),
(1037,0,11,392,64,25,'Grim Batol',0,0),
(1038,0,11,393,64,25,'Dragonmaw Gates',0,0),
(1039,0,11,394,64,25,'The Lost Fleet',0,0),
(1056,0,267,348,64,31,'Darrow Hill',0,0),
(1057,0,267,349,64,0,'Thoradin\'s Wall',0,0),
(1076,1,406,368,64,21,'Webwinder Path',0,0),
(1097,0,10,351,64,19,'The Hushed Bank',0,0),
(1098,0,10,352,64,30,'Manor Mistmantle',0,0),
(1099,1,357,353,64,42,'Camp Mojache',0,0),
(1100,1,357,395,64,41,'Grimtotem Compound',0,0),
(1101,1,357,396,64,44,'The Writhing Deep',0,0),
(1102,1,357,350,64,0,'Wildwind Lake',0,0),
(1103,1,357,397,64,42,'Gordunni Outpost',0,0),
(1104,1,357,398,64,0,'Mok\'Gordun',0,0),
(1105,1,357,354,64,44,'Feral Scar Vale',0,0),
(1106,1,357,399,64,46,'Frayfeather Highlands',0,0),
(1107,1,357,400,64,0,'Idlewind Lake',0,0),
(1108,1,357,355,64,49,'The Forgotten Coast',0,0),
(1109,1,357,401,64,0,'East Pillar',0,0),
(1110,1,357,402,64,0,'West Pillar',0,0),
(1111,1,357,403,64,60,'Dream Bough',0,0),
(1112,1,357,404,64,0,'Jademir Lake',0,0),
(1113,1,357,405,64,60,'Oneiros',0,0),
(1114,1,357,356,64,49,'Ruins of Ravenwind',0,0),
(1115,1,357,357,64,0,'Rage Scar Hold',0,0),
(1116,1,357,358,64,0,'Feathermoon Stronghold',0,0),
(1117,1,357,359,64,0,'Ruins of Solarsal',0,0),
(1118,1,357,360,64,0,'Lower Wilds UNUSED',0,0),
(1119,1,357,369,64,48,'The Twin Colossals',0,0),
(1120,1,357,413,64,43,'Sardor Isle',0,0),
(1121,1,357,414,64,44,'Isle of Dread',0,0),
(1136,1,357,361,64,0,'High Wilderness',0,0),
(1137,1,357,370,64,42,'Lower Wilds',0,0),
(1156,1,17,362,64,0,'Southern Barrens',0,0),
(1157,1,17,406,64,0,'Southern Gold Road',0,0),
(1176,209,0,371,0,0,'Zul\'Farrak',0,0),
(1196,1,0,363,64,0,'UNUSEDAlcaz Island',0,0),
(1216,1,16,364,64,49,'Timbermaw Hold',0,0),
(1217,1,16,365,64,0,'Vanndir Encampment',0,0),
(1218,1,16,366,64,0,'TESTAzshara',0,0),
(1219,1,16,367,64,52,'Legash Encampment',0,0),
(1220,1,16,415,64,52,'Thalassian Base Camp',0,0),
(1221,1,16,416,64,48,'Ruins of Eldarath ',0,0),
(1222,1,16,417,64,0,'Hetaera\'s Clutch',0,0),
(1223,1,16,418,64,0,'Temple of Zin-Malor',0,0),
(1224,1,16,419,64,0,'Bear\'s Head',0,0),
(1225,1,16,420,64,49,'Ursolan',0,0),
(1226,1,16,421,64,55,'Temple of Arkkoran',0,0),
(1227,1,16,422,64,50,'Bay of Storms',0,0),
(1228,1,16,423,64,52,'The Shattered Strand',0,0),
(1229,1,16,424,64,53,'Tower of Eldara',0,0),
(1230,1,16,425,64,51,'Jagged Reef',0,0),
(1231,1,16,426,64,52,'Southridge Beach',0,0),
(1232,1,16,427,64,54,'Ravencrest Monument',0,0),
(1233,1,16,428,64,49,'Forlorn Ridge',0,0),
(1234,1,16,429,64,52,'Lake Mennar',0,0),
(1235,1,16,430,64,46,'Shadowsong Shrine',0,0),
(1236,1,16,431,64,45,'Haldarr Encampment',0,0),
(1237,1,16,432,64,49,'Valormok',0,0),
(1256,1,16,433,64,42,'The Ruined Reaches',0,0),
(1276,1,331,434,64,0,'The Talondeep Path',0,0),
(1277,1,406,435,64,20,'The Talondeep Path',0,0),
(1296,1,14,372,64,0,'Rocktusk Farm',0,0),
(1297,1,14,407,64,0,'Jaggedswine Farm',0,0),
(1316,1,17,436,64,33,'Razorfen Downs',0,0),
(1336,1,440,373,64,45,'Lost Rigger Cove',0,0),
(1337,70,0,437,0,0,'Uldaman',0,0),
(1338,0,130,438,64,0,'Lordamere Lake',0,0),
(1339,0,36,439,64,0,'Lordamere Lake',0,0),
(1357,0,36,440,64,36,'Gallows\' Corner',0,0),
(1377,1,0,374,64,0,'Silithus',0,0),
(1397,169,0,376,64,0,'Emerald Forest',0,0),
(1417,109,0,377,0,0,'Sunken Temple',0,0),
(1437,0,4,378,64,47,'Dreadmaul Hold',0,0),
(1438,0,4,379,64,50,'Nethergarde Keep',0,0),
(1439,0,4,380,64,55,'Dreadmaul Post',0,0),
(1440,0,4,381,64,51,'Serpent\'s Coil',0,0),
(1441,0,4,382,64,54,'Altar of Storms',0,0),
(1442,0,51,383,64,48,'Firewatch Ridge',0,0),
(1443,0,51,384,64,0,'The Slag Pit',0,0),
(1444,0,51,385,64,56,'The Sea of Cinders',0,0),
(1445,0,51,386,64,0,'Blackrock Mountain',0,0),
(1446,0,51,387,64,0,'Thorium Point',0,0),
(1457,0,4,388,64,47,'Garrison Armory',0,0),
(1477,0,0,389,0,0,'The Temple of Atal\'Hakkar',0,0),
(1497,0,0,685,312,10,'Undercity',4,0),
(1517,0,3,686,64,0,'Uldaman',0,0),
(1518,0,40,687,64,0,'Not Used Deadmines',0,0),
(1519,0,0,688,312,10,'Stormwind City',2,0),
(1537,0,0,689,312,10,'Ironforge',2,0),
(1557,1,400,690,64,0,'Splithoof Hold',0,0),
(1577,0,33,691,64,0,'The Cape of Stranglethorn',0,0),
(1578,0,33,692,64,0,'Southern Savage Coast',0,0),
(1579,0,0,693,64,0,'Unused The Deadmines 002',2,0),
(1580,36,1579,694,64,0,'Unused Ironclad Cove 003',0,0),
(1581,36,0,695,0,0,'The Deadmines',2,0),
(1582,36,1581,696,0,0,'Ironclad Cove',2,0),
(1583,0,0,697,0,0,'Blackrock Spire',0,0),
(1584,0,0,698,0,0,'Blackrock Depths',0,0),
(1597,1,17,699,64,0,'Raptor Grounds UNUSED',4,0),
(1598,1,17,700,64,0,'Grol\'dom Farm UNUSED',4,0),
(1599,1,17,701,64,0,'Mor\'shan Base Camp',4,0),
(1600,1,17,702,64,0,'Honor\'s Stand UNUSED',4,0),
(1601,1,17,703,64,0,'Blackthorn Ridge UNUSED',4,0),
(1602,1,17,704,64,0,'Bramblescar UNUSED',4,0),
(1603,1,17,705,64,0,'Agama\'gor UNUSED',4,0),
(1617,0,1519,706,64,0,'Valley of Heroes',2,0),
(1637,1,0,707,312,10,'Orgrimmar',4,0),
(1638,1,0,708,312,10,'Thunder Bluff',4,0),
(1639,1,1638,709,64,0,'Elder Rise',4,0),
(1640,1,1638,710,64,0,'Spirit Rise',4,0),
(1641,1,1638,711,64,0,'Hunter Rise',4,0),
(1657,1,0,712,312,10,'Darnassus',2,0),
(1658,1,1657,713,64,0,'Cenarion Enclave',2,0),
(1659,1,1657,714,64,0,'Craftsmen\'s Terrace',2,0),
(1660,1,1657,715,64,0,'Warrior\'s Terrace',2,0),
(1661,1,1657,716,64,0,'The Temple Gardens',2,0),
(1662,1,1657,717,64,0,'Tradesmen\'s Terrace',2,0),
(1677,0,36,718,64,33,'Gavin\'s Naze',0,0),
(1678,0,36,719,64,33,'Sofera\'s Naze',0,0),
(1679,0,36,720,64,33,'Corrahn\'s Dagger',0,0),
(1680,0,36,721,64,34,'The Headland',0,0),
(1681,0,36,722,64,31,'Misty Shore',0,0),
(1682,0,36,723,64,39,'Dandred\'s Fold',0,0),
(1683,0,36,724,64,34,'Growless Cave',0,0),
(1684,0,36,725,64,30,'Chillwind Point',0,0),
(1697,1,17,726,64,18,'Raptor Grounds',4,0),
(1698,1,17,727,64,20,'Bramblescar',4,0),
(1699,1,17,728,64,13,'Thorn Hill',4,0),
(1700,1,17,729,64,19,'Agama\'gor',4,0),
(1701,1,17,730,64,20,'Blackthorn Ridge',4,0),
(1702,1,17,731,64,18,'Honor\'s Stand',4,0),
(1703,1,17,732,64,17,'The Mor\'shan Rampart',4,0),
(1704,1,17,733,64,11,'Grol\'dom Farm',4,0),
(1717,1,17,734,64,24,'Razorfen Kraul',4,0),
(1718,1,17,735,64,0,'The Great Lift',4,0),
(1737,0,33,736,64,40,'Mistvale Valley',0,0),
(1738,0,33,737,64,43,'Nek\'mani Wellspring',0,0),
(1739,0,33,738,64,42,'Bloodsail Compound',0,0),
(1740,0,33,739,64,36,'Venture Co. Base Camp',0,0),
(1741,0,33,740,64,43,'Gurubashi Arena',0,0),
(1742,0,33,741,64,0,'Spirit Den',0,0),
(1757,0,33,742,64,0,'The Crimson Veil',0,0),
(1758,0,33,743,64,0,'The Riptide',0,0),
(1759,0,33,744,64,0,'The Damsel\'s Luck',0,0),
(1760,0,33,745,64,0,'Venture Co. Operations Center',0,0),
(1761,1,361,746,64,47,'Deadwood Village',0,0),
(1762,1,361,747,64,54,'Felpaw Village',0,0),
(1763,1,361,748,64,51,'Jaedenar',0,0),
(1764,1,361,749,64,0,'Bloodvenom River',0,0),
(1765,1,361,750,64,52,'Bloodvenom Falls',0,0),
(1766,1,361,751,64,53,'Shatter Scar Vale',0,0),
(1767,1,361,752,64,53,'Irontree Woods',0,0),
(1768,1,361,753,64,0,'Irontree Cavern',0,0),
(1769,1,361,754,64,54,'Timbermaw Hold',0,0),
(1770,1,361,755,64,0,'Shadow Hold',0,0),
(1771,1,361,756,64,0,'Shrine of the Deceiver',0,0),
(1777,0,8,757,64,36,'Itharius\'s Cave',0,0),
(1778,0,8,758,64,41,'Sorrowmurk',0,0),
(1779,0,8,759,64,0,'Draenil\'dur Village',0,0),
(1780,0,8,760,64,36,'Splinterspear Junction',0,0),
(1797,0,8,761,64,41,'Stagalbog',0,0),
(1798,0,8,762,64,36,'The Shifting Mire',0,0),
(1817,0,8,763,64,0,'Stagalbog Cave',0,0),
(1837,0,45,764,64,0,'Witherbark Caverns',0,0),
(1857,0,45,765,64,32,'Thoradin\'s Wall',0,0),
(1858,0,45,766,64,32,'Boulder\'gor',0,0),
(1877,0,3,767,64,42,'Valley of Fangs',0,0),
(1878,0,3,768,64,39,'The Dustbowl',0,0),
(1879,0,3,769,64,40,'Mirage Flats',0,0),
(1880,0,47,770,64,0,'Featherbeard\'s Hovel',0,0),
(1881,0,47,771,64,0,'Shindigger\'s Camp',0,0),
(1882,0,47,772,64,45,'Plaguemist Ravine',0,0),
(1883,0,47,773,64,48,'Valorwind Lake',0,0),
(1884,0,47,774,64,46,'Agol\'watha',0,0),
(1885,0,47,775,64,42,'Hiri\'watha',0,0),
(1886,0,47,776,64,47,'The Creeping Ruin',0,0),
(1887,0,47,777,64,0,'Bogen\'s Ledge',0,0),
(1897,0,3,778,64,36,'The Maker\'s Terrace',0,0),
(1898,0,3,779,64,39,'Dustwind Gulch',0,0),
(1917,0,47,780,64,49,'Shaol\'watha',0,0),
(1937,1,440,781,64,42,'Noonshade Ruins',0,0),
(1938,1,440,782,64,45,'Broken Pillar',0,0),
(1939,1,440,783,64,45,'Abyssal Sands',0,0),
(1940,1,440,784,64,49,'Southbreak Shore',0,0),
(1941,1,0,785,64,0,'Caverns of Time',0,0),
(1942,1,490,786,64,48,'The Marshlands',0,0),
(1943,1,490,787,64,50,'Ironstone Plateau',0,0),
(1957,0,51,788,64,47,'Blackchar Cave',0,0),
(1958,0,51,789,64,43,'Tanner Camp',0,0),
(1959,0,51,790,64,45,'Dustfire Valley',0,0),
(1977,309,0,791,0,0,'Zul\'Gurub',0,0),
(1978,0,8,792,64,41,'Misty Reed Post',0,0),
(1997,1,361,793,64,0,'Bloodvenom Post ',0,0),
(1998,1,361,794,64,53,'Talonbranch Glade ',0,0),
(2017,329,0,795,0,0,'Stratholme',0,0),
(2037,0,0,796,64,0,'UNUSEDShadowfang Keep 003',0,0),
(2057,289,0,797,0,0,'Scholomance',0,0),
(2077,1,148,798,64,0,'Twilight Vale',0,0),
(2078,1,148,799,64,0,'Twilight Shore',0,0),
(2079,1,15,800,64,61,'Alcaz Island',0,0),
(2097,1,400,801,64,26,'Darkcloud Pinnacle',0,0),
(2098,0,10,802,64,0,'Dawning Wood Catacombs',0,0),
(2099,0,44,803,64,0,'Stonewatch Keep',0,0),
(2100,349,0,804,0,0,'Maraudon',0,0),
(2101,0,38,805,64,0,'Stoutlager Inn',0,0),
(2102,0,1,806,64,0,'Thunderbrew Distillery',0,0),
(2103,0,11,807,64,0,'Menethil Keep',0,0),
(2104,0,11,808,64,0,'Deepwater Tavern',0,0),
(2117,0,85,809,64,0,'Shadow Grave',0,0),
(2118,0,85,810,64,0,'Brill Town Hall',0,0),
(2119,0,85,811,64,0,'Gallows\' End Tavern',0,0),
(2137,1,215,812,64,0,'The Pools of VisionUNUSED',0,0),
(2138,1,17,813,64,0,'Dreadmist Den',0,0),
(2157,1,17,814,64,0,'Bael\'dun Keep',0,0),
(2158,1,15,815,64,0,'Emberstrife\'s Den',0,0),
(2159,1,0,816,0,0,'Onyxia\'s Lair',0,0),
(2160,1,406,817,64,0,'Windshear Mine',0,0),
(2161,0,10,818,64,0,'Roland\'s Doom',0,0),
(2177,0,33,819,208,0,'Battle Ring',0,0),
(2197,1,1638,820,64,0,'The Pools of Vision',4,0),
(2198,1,405,821,64,30,'Shadowbreak Ravine',0,0),
(2217,1,405,822,64,0,'Broken Spear Village',0,0),
(2237,1,400,823,64,28,'Whitereach Post',0,0),
(2238,1,400,824,64,0,'Gornia',0,0),
(2239,1,400,825,64,0,'Zane\'s Eye Crater',0,0),
(2240,1,400,826,64,0,'Mirage Raceway',0,0),
(2241,1,618,827,64,57,'Frostsaber Rock',0,0),
(2242,1,618,828,64,58,'The Hidden Grove',0,0),
(2243,1,618,829,64,55,'Timbermaw Post',0,0),
(2244,1,618,830,64,57,'Winterfall Village',0,0),
(2245,1,618,831,64,56,'Mazthoril',0,0),
(2246,1,618,832,64,55,'Frostfire Hot Springs',0,0),
(2247,1,618,833,64,56,'Ice Thistle Hills',0,0),
(2248,1,618,834,64,0,'Dun Mandarr',0,0),
(2249,1,618,835,64,60,'Frostwhisper Gorge',0,0),
(2250,1,618,836,64,56,'Owl Wing Thicket',0,0),
(2251,1,618,837,64,56,'Lake Kel\'Theril',0,0),
(2252,1,618,838,64,0,'The Ruins of Kel\'Theril',0,0),
(2253,1,618,839,64,55,'Starfall Village',0,0),
(2254,1,618,840,64,0,'Ban\'Thallow Barrow Den',0,0),
(2255,1,618,841,64,55,'Everlook',0,0),
(2256,1,618,842,64,60,'Darkwhisper Gorge',0,0),
(2257,369,0,843,0,0,'Deeprun Tram',2,0),
(2258,0,139,844,64,58,'The Fungal Vale',0,0),
(2259,0,139,845,64,0,'UNUSEDThe Marris Stead',0,0),
(2260,0,139,846,64,54,'The Marris Stead',0,0),
(2261,0,139,847,64,54,'The Undercroft',0,0),
(2262,0,139,848,64,55,'Darrowshire',0,0),
(2263,0,139,849,64,55,'Crown Guard Tower',0,0),
(2264,0,139,850,64,57,'Corin\'s Crossing',0,0),
(2265,0,139,851,64,0,'Scarlet Base Camp',0,0),
(2266,0,139,852,64,55,'Tyr\'s Hand',0,0),
(2267,0,139,853,64,0,'The Scarlet Basilica',0,0),
(2268,0,139,854,64,58,'Light\'s Hope Chapel',0,0),
(2269,0,139,855,64,0,'Browman Mill',0,0),
(2270,0,139,856,64,58,'The Noxious Glade',0,0),
(2271,0,139,857,64,56,'Eastwall Tower',0,0),
(2272,0,139,858,64,58,'Northdale',0,0),
(2273,0,139,859,64,57,'Zul\'Mashar',0,0),
(2274,0,139,860,64,0,'Mazra\'Alor',0,0),
(2275,0,139,861,64,56,'Northpass Tower',0,0),
(2276,0,139,862,64,59,'Quel\'Lithien Lodge',0,0),
(2277,0,139,863,64,55,'Plaguewood',0,0),
(2278,0,139,864,64,0,'Scourgehold',0,0),
(2279,0,139,865,64,55,'Stratholme',0,0),
(2280,0,0,866,64,0,'UNUSED Stratholme',0,0),
(2297,0,28,867,64,55,'Darrowmere Lake',0,0),
(2298,0,28,868,64,55,'Caer Darrow',0,0),
(2299,0,139,869,64,0,'Darrowmere Lake',0,0),
(2300,1,440,870,64,50,'Caverns of Time',0,0),
(2301,1,331,871,64,23,'Thistlefur Village',0,0),
(2302,1,15,872,64,39,'The Quagmire',0,0),
(2303,1,400,873,64,27,'Windbreak Canyon',0,0),
(2317,1,440,874,64,0,'South Seas',0,0),
(2318,1,15,875,64,0,'The Great Sea',0,0),
(2319,1,17,876,64,0,'The Great Sea',0,0),
(2320,1,14,877,64,0,'The Great Sea',0,0),
(2321,1,16,878,64,0,'The Great Sea',0,0),
(2322,1,141,879,64,0,'The Veiled Sea',2,0),
(2323,1,357,880,64,0,'The Veiled Sea',0,0),
(2324,1,405,881,64,0,'The Veiled Sea',0,0),
(2325,1,331,882,64,0,'The Veiled Sea',0,0),
(2326,1,148,883,64,0,'The Veiled Sea',2,0),
(2337,1,14,884,64,0,'Razor Hill Barracks',4,0),
(2338,0,33,885,64,0,'South Seas',0,0),
(2339,0,33,886,64,0,'The Great Sea',0,0),
(2357,1,331,887,64,0,'Bloodtooth Camp',0,0),
(2358,1,331,888,64,0,'Forest Song',0,0),
(2359,1,331,889,64,24,'Greenpaw Village',0,0),
(2360,1,331,890,64,0,'Silverwing Outpost',0,0),
(2361,1,493,891,64,15,'Nighthaven',0,0),
(2362,1,493,892,64,0,'Shrine of Remulos',0,0),
(2363,1,493,893,64,0,'Stormrage Barrow Dens',0,0),
(2364,0,40,894,64,0,'The Great Sea',0,0),
(2365,0,11,895,64,0,'The Great Sea',0,0),
(2366,269,0,896,0,0,'The Black Morass',0,0),
(2367,269,0,897,0,0,'Old Hillsbrad Foothills',0,0),
(2368,269,2367,898,0,0,'Tarren Mill',0,0),
(2369,269,2367,899,0,0,'Southshore',0,0),
(2370,269,2367,900,0,0,'Durnholde Keep',0,0),
(2371,269,2367,901,0,0,'Dun Garok',0,0),
(2372,269,2367,902,0,0,'Hillsbrad Fields',0,0),
(2373,269,2367,903,0,0,'Eastern Strand',0,0),
(2374,269,2367,904,0,0,'Nethander Stead',0,0),
(2375,269,2367,905,0,0,'Darrow Hill',0,0),
(2376,269,2367,906,0,0,'Southpoint Tower',0,0),
(2377,269,2367,907,0,0,'Thoradin\'s Wall',0,0),
(2378,269,2367,908,0,0,'Western Strand',0,0),
(2379,269,2367,909,0,0,'Azurelode Mine',0,0),
(2397,0,267,910,64,0,'The Great Sea',0,0),
(2398,0,130,911,64,0,'The Great Sea',0,0),
(2399,0,85,912,64,0,'The Great Sea',0,0),
(2400,0,47,913,64,0,'The Forbidding Sea',0,0),
(2401,0,45,914,64,0,'The Forbidding Sea',0,0),
(2402,0,11,915,64,0,'The Forbidding Sea',0,0),
(2403,0,8,916,64,0,'The Forbidding Sea',0,0),
(2404,1,405,917,64,30,'Tethris Aran',0,0),
(2405,1,405,918,64,32,'Ethel Rethor',0,0),
(2406,1,405,919,64,35,'Ranazjar Isle',0,0),
(2407,1,405,920,64,32,'Kormek\'s Hut',0,0),
(2408,1,405,921,64,33,'Shadowprey Village',0,0),
(2417,0,46,922,64,54,'Blackrock Pass',0,0),
(2418,0,46,923,64,55,'Morgan\'s Vigil',0,0),
(2419,0,46,924,64,0,'Slither Rock',0,0),
(2420,0,46,925,64,52,'Terror Wing Path',0,0),
(2421,0,46,926,64,54,'Draco\'dar',0,0),
(2437,389,0,927,0,0,'Ragefire Chasm',4,0),
(2457,1,331,928,64,0,'Nightsong Woods',0,0),
(2477,1,1377,929,64,0,'The Veiled Sea',0,0),
(2478,1,361,930,64,47,'Morlos\'Aran',0,0),
(2479,1,361,931,64,48,'Emerald Sanctuary',0,0),
(2480,1,361,932,64,50,'Jadefire Glen',0,0),
(2481,1,361,933,64,51,'Ruins of Constellas',0,0),
(2497,1,16,934,64,53,'Bitter Reaches',0,0),
(2517,0,4,935,64,46,'Rise of the Defiler',0,0),
(2518,1,357,936,64,0,'Lariss Pavilion',0,0),
(2519,1,357,937,64,41,'Woodpaw Hills',0,0),
(2520,1,357,938,64,0,'Woodpaw Den',0,0),
(2521,1,357,939,64,-1,'Verdantis River',0,0),
(2522,1,357,940,64,45,'Ruins of Isildien',0,0),
(2537,1,406,941,64,15,'Grimtotem Post',0,0),
(2538,1,406,942,64,15,'Camp Aparaje',0,0),
(2539,1,406,943,64,15,'Malaka\'jin',0,0),
(2540,1,406,944,64,16,'Boulderslide Ravine',0,0),
(2541,1,406,945,64,18,'Sishir Canyon',0,0),
(2557,429,0,946,0,0,'Dire Maul',0,0),
(2558,0,41,947,64,0,'Deadwind Ravine',0,0),
(2559,0,41,948,64,0,'Diamondhead River',0,0),
(2560,0,41,949,64,0,'Ariden\'s Camp',0,0),
(2561,0,41,950,64,57,'The Vice',0,0),
(2562,0,41,951,64,60,'Karazhan',0,0),
(2563,0,41,952,64,0,'Morgan\'s Plot',0,0),
(2577,1,357,953,64,44,'Dire Maul',0,0),
(2597,30,0,954,0,0,'Alterac Valley',0,0),
(2617,1,405,955,64,0,'Scrabblescrew\'s Camp',0,0),
(2618,1,361,956,64,50,'Jadefire Run',0,0),
(2619,0,139,957,64,55,'Thondroril River',0,0),
(2620,0,28,958,64,0,'Thondroril River',0,0),
(2621,0,139,959,64,54,'Lake Mereldar',0,0),
(2622,0,139,960,64,55,'Pestilent Scar',0,0),
(2623,0,139,961,64,59,'The Infectis Scar',0,0),
(2624,0,139,962,64,58,'Blackwood Lake',0,0),
(2625,0,139,963,64,0,'Eastwall Gate',0,0),
(2626,0,139,964,64,0,'Terrorweb Tunnel',0,0),
(2627,0,139,965,64,55,'Terrordale',0,0),
(2637,1,331,966,64,0,'Kargathia Keep',0,0),
(2657,1,405,967,64,0,'Valley of Bones',0,0),
(2677,469,0,968,0,0,'Blackwing Lair',0,0),
(2697,0,41,969,64,50,'Deadman\'s Crossing',0,0),
(2717,409,0,970,0,0,'Molten Core',0,0),
(2737,1,1377,971,64,55,'The Scarab Wall',0,0),
(2738,1,1377,972,64,55,'Southwind Village',0,0),
(2739,1,1377,973,64,55,'Twilight Base Camp',0,0),
(2740,1,1377,974,64,55,'The Crystal Vale',0,0),
(2741,1,1377,975,64,0,'The Scarab Dais',0,0),
(2742,1,1377,976,64,55,'Hive\'Ashi',0,0),
(2743,1,1377,977,64,55,'Hive\'Zora',0,0),
(2744,1,1377,978,64,55,'Hive\'Regal',0,0),
(2757,1,17,979,64,0,'Shrine of the Fallen Warrior',0,0),
(2777,0,267,980,64,0,'UNUSED Alterac Valley',0,0),
(2797,1,331,981,64,0,'Blackfathom Deeps',0,0),
(2817,30,0,0,68,0,'***On Map Dungeon***',0,0),
(2837,1,41,982,64,0,'The Master\'s Cellar',0,0),
(2838,0,51,983,64,0,'Stonewrought Pass',0,0),
(2839,0,36,984,64,0,'Alterac Valley',0,0),
(2857,1,440,985,128,0,'The Rumble Cage',0,0),
(2877,451,22,986,0,60,'Chunk Test',0,0),
(2897,1,331,987,64,0,'Zoram\'gar Outpost',0,0),
(2917,1,0,988,32,0,'Hall of Legends',4,0),
(2918,449,0,989,32,0,'Champions\' Hall',2,0),
(2937,0,41,990,64,0,'Grosh\'gok Compound',0,0),
(2938,0,41,991,64,50,'Sleeping Gorge',0,0),
(2957,30,2597,992,0,0,'Irondeep Mine',0,0),
(2958,30,2597,993,0,0,'Stonehearth Outpost',0,0),
(2959,30,2597,994,0,0,'Dun Baldar',0,0),
(2960,30,2597,995,0,0,'Icewing Pass',0,0),
(2961,30,2597,996,0,0,'Frostwolf Village',0,0),
(2962,30,2597,997,0,0,'Tower Point',0,0),
(2963,30,2597,998,0,0,'Coldtooth Mine',0,0),
(2964,30,2597,999,0,0,'Winterax Hold',0,0),
(2977,30,2597,1000,0,0,'Iceblood Garrison',0,0),
(2978,30,2597,1001,0,0,'Frostwolf Keep',0,0),
(2979,1,14,1002,64,0,'Tor\'kren Farm',0,0),
(3017,30,2597,1003,0,0,'Frost Dagger Pass',0,0),
(3037,1,400,1004,64,0,'Ironstone Camp',0,0),
(3038,1,400,1005,64,0,'Weazel\'s Crater',0,0),
(3039,1,400,1006,64,0,'Tahonda Ruins',0,0),
(3057,30,2597,1007,0,0,'Field of Strife',0,0),
(3058,30,2597,1008,0,0,'Icewing Cavern',0,0),
(3077,1,1377,1009,64,55,'Valor\'s Rest',0,0),
(3097,1,1377,1010,64,0,'The Swarming Pillar',0,0),
(3098,1,1377,1011,64,57,'Twilight Post',0,0),
(3099,1,1377,1012,64,59,'Twilight Outpost',0,0),
(3100,1,1377,1013,64,0,'Ravaged Twilight Camp',0,0),
(3117,1,357,1014,64,0,'Shalzaru\'s Lair',0,0),
(3137,1,16,1015,64,0,'Talrendis Point',0,0),
(3138,1,16,1016,64,0,'Rethress Sanctum',0,0),
(3139,1,618,1017,64,0,'Moon Horror Den',0,0),
(3140,1,16,1018,64,0,'Scalebeard\'s Cave',0,0),
(3157,1,406,1019,64,0,'Boulderslide Cavern',0,0),
(3177,1,331,1020,64,0,'Warsong Labor Camp',0,0),
(3197,0,28,1021,64,0,'Chillwind Camp',0,0),
(3217,1,2557,1022,128,0,'The Maul',0,0),
(3237,1,2557,1023,128,0,'The Maul UNUSED',0,0),
(3257,1,1377,1024,64,0,'Bones of Grakkarond',0,0),
(3277,489,0,1025,0,0,'Warsong Gulch',0,0),
(3297,30,2597,1026,0,0,'Frostwolf Graveyard',0,0),
(3298,30,2597,1027,0,0,'Frostwolf Pass',0,0),
(3299,30,2597,1028,0,0,'Dun Baldar Pass',0,0),
(3300,30,2597,1029,0,0,'Iceblood Graveyard',0,0),
(3301,30,2597,1030,0,0,'Snowfall Graveyard',0,0),
(3302,30,2597,1031,0,0,'Stonehearth Graveyard',0,0),
(3303,30,2597,1032,0,0,'Stormpike Graveyard',0,0),
(3304,30,2597,1033,0,0,'Icewing Bunker',0,0),
(3305,30,2597,1034,0,0,'Stonehearth Bunker',0,0),
(3306,30,2597,1035,0,0,'Wildpaw Ridge',0,0),
(3317,0,47,1036,64,0,'Revantusk Village',0,0),
(3318,30,2597,1037,0,0,'Rock of Durotan',0,0),
(3319,1,331,1038,64,0,'Silverwing Grove',0,0),
(3320,489,3277,1039,0,0,'Warsong Lumber Mill',0,0),
(3321,489,3277,1040,0,0,'Silverwing Hold',0,0),
(3337,30,2597,1041,0,0,'Wildpaw Cavern',0,0),
(3338,30,2597,1042,0,0,'The Veiled Cleft',0,0),
(3357,0,33,1043,64,0,'Yojamba Isle',0,0),
(3358,529,0,1044,0,0,'Arathi Basin',0,0),
(3377,309,1977,1045,0,0,'The Coil',0,0),
(3378,309,1977,1046,0,0,'Altar of Hir\'eek',0,0),
(3379,309,1977,1047,0,0,'Shadra\'zaar',0,0),
(3380,309,1977,1048,0,0,'Hakkari Grounds',0,0),
(3381,309,1977,1049,0,0,'Naze of Shirvallah',0,0),
(3382,309,1977,1050,0,0,'Temple of Bethekk',0,0),
(3383,309,1977,1051,0,0,'The Bloodfire Pit',0,0),
(3384,309,1977,1052,0,0,'Altar of the Blood God',0,0),
(3397,309,1977,1053,0,0,'Zanza\'s Rise',0,0),
(3398,309,1977,1054,0,0,'Edge of Madness',0,0),
(3417,529,3358,1055,0,0,'Trollbane Hall',0,0),
(3418,529,3358,1056,0,0,'Defiler\'s Den',0,0),
(3419,309,1977,1057,0,0,'Pagle\'s Pointe',0,0),
(3420,529,3358,1058,0,0,'Farm',0,0),
(3421,529,3358,1059,0,0,'Blacksmith',0,0),
(3422,529,3358,1060,0,0,'Lumber Mill',0,0),
(3423,529,3358,1061,0,0,'Gold Mine',0,0),
(3424,529,3358,1062,0,0,'Stables',0,0),
(3425,1,1377,1063,64,55,'Cenarion Hold',0,0),
(3426,1,1377,1064,64,59,'Staghelm Point',0,0),
(3427,1,1377,1065,64,0,'Bronzebeard Encampment',0,0),
(3428,531,0,1066,0,0,'Ahn\'Qiraj',0,0),
(3429,509,0,1067,0,0,'Ruins of Ahn\'Qiraj',0,0),
(3446,1,1377,1066,64,0,'Twilight\'s Run',0,0),
(3447,1,1377,1067,64,0,'Ortell\'s Hideout',0,0),
(3448,509,3429,1068,0,0,'Scarab Terrace',0,0),
(3449,509,3429,1069,0,0,'General\'s Terrace',0,0),
(3450,509,3429,1070,0,0,'The Reservoir',0,0),
(3451,509,3429,1071,0,0,'The Hatchery',0,0),
(3452,509,3429,1072,0,0,'The Comb',0,0),
(3453,509,3429,1073,0,0,'Watchers\' Terrace',0,0),
(3454,1,1377,1074,64,0,'Ruins of Ahn\'Qiraj',0,0),
(3456,533,0,1075,3,0,'Naxxramas',0,21),
(3459,0,0,0,512,0,'City',0,0),
(3478,1,0,1075,0,0,'Gates of Ahn\'Qiraj',0,0),
(3486,0,36,1076,64,30,'Ravenholdt Manor',0,0); 
 
/* 
* 20170121162820_world.sql 
*/ 
INSERT INTO `migrations` VALUES ('20170121162820');

-- Cleanup in case last migration was applied
DELETE from `game_event` WHERE entry = 161;
DELETE from `game_event_gameobject` WHERE event = 161;
-- End cleanup


-- Add Patch 1.9 Event
INSERT INTO `game_event` VALUES
(161,	'2017-01-01 00:00:00',	'2030-01-01 00:00:00',	525600,	525600,	0,	'Patch 1.9', 0, 1);

-- Tie all Fish Schools, Floating Wreckage, and Patches of Elemental Water to this event
INSERT INTO `game_event_gameobject` (`guid`, `event`)
SELECT guid, 161 FROM gameobject
JOIN gameobject_template ON (`name` LIKE '%School%' AND NOT (`name` LIKE '%Tastyfish' OR `name` LIKE 'School of Fish')) OR `name` LIKE '%Wreckage' OR `name`='Oil Spill' 
WHERE gameobject.id = gameobject_template.entry;

/* You may use this to confirm
SELECT name, event FROM gameobject_template
JOIN gameobject ON gameobject.id = entry
JOIN game_event_gameobject ON gameobject.guid = game_event_gameobject.guid
WHERE game_event_gameobject.event = 161
*/ 
 
/* 
* 20170121165537_world.sql 
*/ 
INSERT INTO `migrations` VALUES ('20170121165537');

-- Add Patches of Elemental Water
INSERT INTO `gameobject` VALUES
(3998318,	180753,	1,	3025.51,	-6639.05,	0,	2.71549,	0,	0,	0,	0,	25,	100,	1,	0),
(3998317,	180753,	1,	3999.31,	-6324.65,	0,	3.06499,	0,	0,	0,	0,	25,	100,	1,	0),
(3998316,	180753,	1,	4029.74,	-6055.9,	0,	3.06499,	0,	0,	0,	0,	25,	100,	1,	0),
(3998315,	180753,	1,	3613.85,	-6096.47,	0,	0.48496,	0,	0,	0,	0,	25,	100,	1,	0),
(3998319,	180753,	1,	2886.88,	-7059.92,	0,	5.31909,	0,	0,	0,	0,	25,	100,	1,	0),
(3998320,	180753,	1,	3502.27,	-7293.18,	0,	5.70785,	0,	0,	0,	0,	25,	100,	1,	0);

-- Tie Swirling Maelstrom and Patch of Elemental Water to patch 1.9
INSERT INTO game_event_gameobject (guid, event)
SELECT guid, 161 FROM gameobject
JOIN gameobject_template ON name LIKE 'Swirling Maelstrom' OR name LIKE 'Patch %'
WHERE gameobject.id = gameobject_template.entry;

-- Define spawning behaviour for Patch of Elemental Water
INSERT INTO pool_template VALUES 
(42905, 2, 'Patch of Elemental Water', 0, 0);
-- Add to pool
INSERT INTO pool_gameobject_template VALUES
(180753, 42905, 0, 'Patch of Elemental Water', 0); 

-- Set respawn of Patches to one hour
UPDATE gameobject SET spawntimesecs = 3600 WHERE id = 180753;
-- Make them fishable
UPDATE gameobject_template SET data0 = 4, data4 = 1628 WHERE entry = 180753;

 
 
/* 
* 20170121173959_world.sql 
*/ 
INSERT INTO `migrations` VALUES ('20170121173959'); 

-- Death From Below
-- remove redundant trap
DELETE FROM `gameobject` WHERE `guid` = 16637;

-- set Cannon Fire
UPDATE `gameobject_template` SET `data10` = 4170 WHERE `entry` = 113531;

-- set Cannon Fire targets
REPLACE INTO `spell_script_target` VALUES 
(4170, 1, 2595),
(4170, 1, 2596);

-- random near wp for script support
REPLACE INTO `script_waypoint` VALUES
(2610, 0, -2157.61, -1972.53, 15.55, 0, '');

-- extend primary key to both spell entry and map id
ALTER TABLE `spell_target_position` DROP PRIMARY KEY, ADD PRIMARY KEY(`id`, `target_map`);

-- set Cannon Fire hit position
REPLACE INTO `spell_target_position` VALUES
(4170, 0, -2142.36, -1984.28, 11.19, 0);
 
 
/* 
* 20170122011219_world.sql 
*/ 
INSERT INTO `migrations` VALUES ('20170122011219'); 

-- Stitches
UPDATE `creature_model_info` SET `bounding_radius` = 2 WHERE `modelid` = 2381;
REPLACE INTO `script_waypoint` VALUES
(412, 65, -10560.29, -1187.79, 28.084, 0, '');
UPDATE `script_waypoint` SET `waittime` = 5000 WHERE `entry` = 412 AND `pointid` = 0;
 
 
/* 
* 20170122025609_world.sql 
*/ 
INSERT INTO `migrations` VALUES ('20170122025609'); 

-- Mana Surges
UPDATE `creature_template` SET `ScriptName` = 'npc_tabetha' WHERE (`entry` = 6546);
UPDATE `quest_template` SET `StartScript` = 0 WHERE `entry` = 1957;
DELETE FROM `quest_start_scripts` WHERE `id` = 1957;
UPDATE `creature_template` SET `faction_A` = 189, `faction_H` = 189 WHERE (`entry` = 6550);
 
 
/* 
* 20170122055053_world.sql 
*/ 
INSERT INTO `migrations` VALUES ('20170122055053'); 

REPLACE INTO `scripted_event_id` VALUES (747, 'event_test_of_endurance');
UPDATE `gameobject` SET `spawntimesecs` = 300 WHERE `id` = 20447;
DELETE FROM `event_scripts` WHERE id = 747;
UPDATE `creature_template` SET `ScriptName` = 'npc_grenka_bloodscreech' WHERE `entry` = 4490;
 
 
/* 
* 20170122090318_world.sql 
*/ 
INSERT INTO `migrations` VALUES ('20170122090318'); 

-- Sarilus Foulborne
UPDATE `creature_template` SET `faction_A` = 118, `faction_H` = 118, `ScriptName` = 'npc_sarilus_foulborne' WHERE `entry` = 3986;
 
 
/* 
* 20170122104100_world.sql 
*/ 
INSERT INTO `migrations` VALUES ('20170122104100'); 

-- The Principle Source
UPDATE `creature` SET `spawntimesecs` = 360, `spawndist` = 5, `MovementType` = 1 WHERE `guid` IN (13720, 13708, 13728, 13710, 13739, 13715, 13733, 13717, 13734, 13746, 13735, 13713, 13706, 13718);
REPLACE INTO `scripted_event_id` VALUES (5246, 'event_the_principle_source');
DELETE FROM `event_scripts` WHERE id = 5246;
 
 
/* 
* 20170122141254_world.sql 
*/ 
INSERT INTO `migrations` VALUES ('20170122141254'); 

-- Curing the Sick
UPDATE `creature_template` SET `ScriptName` = 'npc_sickly_critter' WHERE `entry` IN (12296, 12298);
 
 
/* 
* 20170123075848_world.sql 
*/ 
INSERT INTO `migrations` VALUES ('20170123075848'); 

-- Missing In Action
UPDATE `script_waypoint` SET `waittime` = 4000 WHERE `entry` = 349 AND `pointid` = 53;
UPDATE `script_waypoint` SET `waittime` = 4000 WHERE `entry` = 349 AND `pointid` = 54;
 
 
/* 
* 20170123105000_world.sql 
*/ 
INSERT INTO `migrations` VALUES ('20170123105000'); 

INSERT INTO `locales_area` VALUES ('1', '', '', '', '', '', '', '', 'Дун Морог');
INSERT INTO `locales_area` VALUES ('2', '', '', '', '', '', '', '', 'Бескрайний берег');
INSERT INTO `locales_area` VALUES ('3', '', '', '', '', '', '', '', 'Бесплодные земли');
INSERT INTO `locales_area` VALUES ('4', '', '', '', '', '', '', '', 'Выжженные земли');
INSERT INTO `locales_area` VALUES ('7', '', '', '', '', '', '', '', 'Бухта Черноводья');
INSERT INTO `locales_area` VALUES ('8', '', '', '', '', '', '', '', 'Болото Печали');
INSERT INTO `locales_area` VALUES ('9', '', '', '', '', '', '', '', 'Долина Североземья');
INSERT INTO `locales_area` VALUES ('10', '', '', '', '', '', '', '', 'Сумеречный лес');
INSERT INTO `locales_area` VALUES ('11', '', '', '', '', '', '', '', 'Болотина');
INSERT INTO `locales_area` VALUES ('12', '', '', '', '', '', '', '', 'Элвиннский лес');
INSERT INTO `locales_area` VALUES ('13', '', '', '', '', '', '', '', 'Древо Жизни');
INSERT INTO `locales_area` VALUES ('14', '', '', '', '', '', '', '', 'Дуротар');
INSERT INTO `locales_area` VALUES ('15', '', '', '', '', '', '', '', 'Пылевые топи');
INSERT INTO `locales_area` VALUES ('16', '', '', '', '', '', '', '', 'Азшара');
INSERT INTO `locales_area` VALUES ('17', '', '', '', '', '', '', '', 'Степи');
INSERT INTO `locales_area` VALUES ('18', '', '', '', '', '', '', '', 'Озеро Хрустальное');
INSERT INTO `locales_area` VALUES ('19', '', '', '', '', '', '', '', 'Зул\'Гуруб');
INSERT INTO `locales_area` VALUES ('20', '', '', '', '', '', '', '', 'Луноречье');
INSERT INTO `locales_area` VALUES ('21', '', '', '', '', '', '', '', 'Кул-Тирас');
INSERT INTO `locales_area` VALUES ('22', '', '', '', '', '', '', '', 'Остров Программиста');
INSERT INTO `locales_area` VALUES ('23', '', '', '', '', '', '', '', 'Река Североземья');
INSERT INTO `locales_area` VALUES ('24', '', '', '', '', '', '', '', 'Аббатство Североземья');
INSERT INTO `locales_area` VALUES ('25', '', '', '', '', '', '', '', 'Черная гора');
INSERT INTO `locales_area` VALUES ('26', '', '', '', '', '', '', '', 'Маяк');
INSERT INTO `locales_area` VALUES ('28', '', '', '', '', '', '', '', 'Западные Чумные земли');
INSERT INTO `locales_area` VALUES ('30', '', '', '', '', '', '', '', 'Девять');
INSERT INTO `locales_area` VALUES ('32', '', '', '', '', '', '', '', 'Кладбище');
INSERT INTO `locales_area` VALUES ('33', '', '', '', '', '', '', '', 'Тернистая долина');
INSERT INTO `locales_area` VALUES ('34', '', '', '', '', '', '', '', 'Рудник Горного Эха');
INSERT INTO `locales_area` VALUES ('35', '', '', '', '', '', '', '', 'Пиратская Бухта');
INSERT INTO `locales_area` VALUES ('36', '', '', '', '', '', '', '', 'Альтеракские горы');
INSERT INTO `locales_area` VALUES ('37', '', '', '', '', '', '', '', 'Озеро Назферити');
INSERT INTO `locales_area` VALUES ('38', '', '', '', '', '', '', '', 'Лок Модан');
INSERT INTO `locales_area` VALUES ('40', '', '', '', '', '', '', '', 'Западный Край');
INSERT INTO `locales_area` VALUES ('41', '', '', '', '', '', '', '', 'Перевал Мертвого Ветра');
INSERT INTO `locales_area` VALUES ('42', '', '', '', '', '', '', '', 'Темнолесье');
INSERT INTO `locales_area` VALUES ('43', '', '', '', '', '', '', '', 'Пустынный берег');
INSERT INTO `locales_area` VALUES ('44', '', '', '', '', '', '', '', 'Красногорье');
INSERT INTO `locales_area` VALUES ('45', '', '', '', '', '', '', '', 'Нагорье Арати');
INSERT INTO `locales_area` VALUES ('46', '', '', '', '', '', '', '', 'Пылающие степи');
INSERT INTO `locales_area` VALUES ('47', '', '', '', '', '', '', '', 'Внутренние земли');
INSERT INTO `locales_area` VALUES ('49', '', '', '', '', '', '', '', 'Нора Мертвеца');
INSERT INTO `locales_area` VALUES ('51', '', '', '', '', '', '', '', 'Тлеющее ущелье');
INSERT INTO `locales_area` VALUES ('53', '', '', '', '', '', '', '', 'Воровской лагерь');
INSERT INTO `locales_area` VALUES ('54', '', '', '', '', '', '', '', 'Яшмовая шахта');
INSERT INTO `locales_area` VALUES ('55', '', '', '', '', '', '', '', 'Аллея Героев НЕ ИСПОЛЬЗУЕТСЯ');
INSERT INTO `locales_area` VALUES ('56', '', '', '', '', '', '', '', 'Часовые Вечности');
INSERT INTO `locales_area` VALUES ('57', '', '', '', '', '', '', '', 'Рудник Подземных Глубин');
INSERT INTO `locales_area` VALUES ('59', '', '', '', '', '', '', '', 'Виноградники Североземья');
INSERT INTO `locales_area` VALUES ('60', '', '', '', '', '', '', '', 'Лесная опушка');
INSERT INTO `locales_area` VALUES ('61', '', '', '', '', '', '', '', 'Ревущий водопад');
INSERT INTO `locales_area` VALUES ('62', '', '', '', '', '', '', '', 'Тыквенное поле Бреквеллов');
INSERT INTO `locales_area` VALUES ('63', '', '', '', '', '', '', '', 'Ферма Стоунфилдов');
INSERT INTO `locales_area` VALUES ('64', '', '', '', '', '', '', '', 'Виноградники Маклура');
INSERT INTO `locales_area` VALUES ('65', '', '', '', '', '', '', '', '***Используй меня повторно 3***');
INSERT INTO `locales_area` VALUES ('66', '', '', '', '', '', '', '', '***Используй меня повторно 6***');
INSERT INTO `locales_area` VALUES ('67', '', '', '', '', '', '', '', '***Используй меня повторно 5***');
INSERT INTO `locales_area` VALUES ('68', '', '', '', '', '', '', '', 'Озеро Безмолвия');
INSERT INTO `locales_area` VALUES ('69', '', '', '', '', '', '', '', 'Приозерье');
INSERT INTO `locales_area` VALUES ('70', '', '', '', '', '', '', '', 'Крепость Каменной Стражи');
INSERT INTO `locales_area` VALUES ('71', '', '', '', '', '', '', '', 'Водопад Каменной Стражи');
INSERT INTO `locales_area` VALUES ('72', '', '', '', '', '', '', '', 'Темный портал');
INSERT INTO `locales_area` VALUES ('73', '', '', '', '', '', '', '', 'Гниющий шрам');
INSERT INTO `locales_area` VALUES ('74', '', '', '', '', '', '', '', 'Озеро Слез');
INSERT INTO `locales_area` VALUES ('75', '', '', '', '', '', '', '', 'Каменор');
INSERT INTO `locales_area` VALUES ('76', '', '', '', '', '', '', '', 'Болотное пристанище');
INSERT INTO `locales_area` VALUES ('77', '', '', '', '', '', '', '', 'Старая Наковальня');
INSERT INTO `locales_area` VALUES ('80', '', '', '', '', '', '', '', 'Горы Штормграда');
INSERT INTO `locales_area` VALUES ('81', '', '', '', '', '', '', '', 'Джефф СВ Измененный квадрант');
INSERT INTO `locales_area` VALUES ('82', '', '', '', '', '', '', '', 'Джефф СЗ Квадрант');
INSERT INTO `locales_area` VALUES ('83', '', '', '', '', '', '', '', 'Джефф ЮВ Квадрант');
INSERT INTO `locales_area` VALUES ('84', '', '', '', '', '', '', '', 'Джефф ЮЗ Квадрант');
INSERT INTO `locales_area` VALUES ('85', '', '', '', '', '', '', '', 'Тирисфальские леса');
INSERT INTO `locales_area` VALUES ('86', '', '', '', '', '', '', '', 'Озеро Каменных Столбов');
INSERT INTO `locales_area` VALUES ('87', '', '', '', '', '', '', '', 'Златоземье');
INSERT INTO `locales_area` VALUES ('88', '', '', '', '', '', '', '', 'Лесопилка Восточной долины');
INSERT INTO `locales_area` VALUES ('89', '', '', '', '', '', '', '', 'Сад у Зеркального озера');
INSERT INTO `locales_area` VALUES ('91', '', '', '', '', '', '', '', 'Башня Азоры');
INSERT INTO `locales_area` VALUES ('92', '', '', '', '', '', '', '', 'Зеркальное озеро');
INSERT INTO `locales_area` VALUES ('93', '', '', '', '', '', '', '', 'Лощина Вул\'Гол');
INSERT INTO `locales_area` VALUES ('94', '', '', '', '', '', '', '', 'Вороний Холм');
INSERT INTO `locales_area` VALUES ('95', '', '', '', '', '', '', '', 'Каньоны Красногорья');
INSERT INTO `locales_area` VALUES ('96', '', '', '', '', '', '', '', 'Башня Илгалара');
INSERT INTO `locales_area` VALUES ('97', '', '', '', '', '', '', '', 'Лесопилка Альтера');
INSERT INTO `locales_area` VALUES ('98', '', '', '', '', '', '', '', 'Пещеры Ретбана');
INSERT INTO `locales_area` VALUES ('99', '', '', '', '', '', '', '', 'Лагерь Повстанцев');
INSERT INTO `locales_area` VALUES ('100', '', '', '', '', '', '', '', 'Экспедиция Эрнестуэя');
INSERT INTO `locales_area` VALUES ('101', '', '', '', '', '', '', '', 'Лагерь Курцена');
INSERT INTO `locales_area` VALUES ('102', '', '', '', '', '', '', '', 'Руины Зул\'Кунды');
INSERT INTO `locales_area` VALUES ('103', '', '', '', '', '', '', '', 'Руины Зул\'Мамве');
INSERT INTO `locales_area` VALUES ('104', '', '', '', '', '', '', '', 'Коварный риф');
INSERT INTO `locales_area` VALUES ('105', '', '', '', '', '', '', '', 'Холм Мош\'Огг');
INSERT INTO `locales_area` VALUES ('106', '', '', '', '', '', '', '', 'Схрон');
INSERT INTO `locales_area` VALUES ('107', '', '', '', '', '', '', '', 'Ферма Сальдена');
INSERT INTO `locales_area` VALUES ('108', '', '', '', '', '', '', '', 'Сторожевой холм');
INSERT INTO `locales_area` VALUES ('109', '', '', '', '', '', '', '', 'Тыквенная ферма Хмуроброва');
INSERT INTO `locales_area` VALUES ('111', '', '', '', '', '', '', '', 'Рудник Янго');
INSERT INTO `locales_area` VALUES ('113', '', '', '', '', '', '', '', 'Прииск на Золотом Берегу');
INSERT INTO `locales_area` VALUES ('115', '', '', '', '', '', '', '', 'Маяк в Западном Крае');
INSERT INTO `locales_area` VALUES ('116', '', '', '', '', '', '', '', 'Туманная долина');
INSERT INTO `locales_area` VALUES ('117', '', '', '', '', '', '', '', 'Лагерь Гром\'гол');
INSERT INTO `locales_area` VALUES ('118', '', '', '', '', '', '', '', 'Раскопки Вельгара');
INSERT INTO `locales_area` VALUES ('120', '', '', '', '', '', '', '', 'Гарнизон у Западного ручья');
INSERT INTO `locales_area` VALUES ('121', '', '', '', '', '', '', '', 'Безмятежное кладбище');
INSERT INTO `locales_area` VALUES ('122', '', '', '', '', '', '', '', 'Руины Зуулдая');
INSERT INTO `locales_area` VALUES ('123', '', '', '', '', '', '', '', 'Руины Бал\'лал');
INSERT INTO `locales_area` VALUES ('125', '', '', '', '', '', '', '', 'Руины Кал\'аи');
INSERT INTO `locales_area` VALUES ('126', '', '', '', '', '', '', '', 'Руины Ткаши');
INSERT INTO `locales_area` VALUES ('127', '', '', '', '', '', '', '', 'Руины Балиа\'ма');
INSERT INTO `locales_area` VALUES ('128', '', '', '', '', '', '', '', 'Руины Зиата\'джаи');
INSERT INTO `locales_area` VALUES ('129', '', '', '', '', '', '', '', 'Руины Мизжа');
INSERT INTO `locales_area` VALUES ('130', '', '', '', '', '', '', '', 'Серебряный бор');
INSERT INTO `locales_area` VALUES ('131', '', '', '', '', '', '', '', 'Каранос');
INSERT INTO `locales_area` VALUES ('132', '', '', '', '', '', '', '', 'Холодная долина');
INSERT INTO `locales_area` VALUES ('133', '', '', '', '', '', '', '', 'Гномреган');
INSERT INTO `locales_area` VALUES ('134', '', '', '', '', '', '', '', 'Карьер Гол\'Болар');
INSERT INTO `locales_area` VALUES ('135', '', '', '', '', '', '', '', 'Форт Мерзлогривов');
INSERT INTO `locales_area` VALUES ('136', '', '', '', '', '', '', '', 'Серая берлога');
INSERT INTO `locales_area` VALUES ('137', '', '', '', '', '', '', '', 'Поселок Пивоваров');
INSERT INTO `locales_area` VALUES ('138', '', '', '', '', '', '', '', 'Сторожка у заснеженной сосны');
INSERT INTO `locales_area` VALUES ('139', '', '', '', '', '', '', '', 'Восточные Чумные земли');
INSERT INTO `locales_area` VALUES ('141', '', '', '', '', '', '', '', 'Тельдрассил');
INSERT INTO `locales_area` VALUES ('142', '', '', '', '', '', '', '', 'Раскопки Сталекрута');
INSERT INTO `locales_area` VALUES ('143', '', '', '', '', '', '', '', 'Оплот Мо\'грош');
INSERT INTO `locales_area` VALUES ('144', '', '', '', '', '', '', '', 'Телcамар');
INSERT INTO `locales_area` VALUES ('145', '', '', '', '', '', '', '', 'Врата Альгаза');
INSERT INTO `locales_area` VALUES ('146', '', '', '', '', '', '', '', 'Каменная Плотина');
INSERT INTO `locales_area` VALUES ('147', '', '', '', '', '', '', '', 'Приют Странников');
INSERT INTO `locales_area` VALUES ('148', '', '', '', '', '', '', '', 'Темные берега');
INSERT INTO `locales_area` VALUES ('149', '', '', '', '', '', '', '', 'Рудник у Серебряного ручейка');
INSERT INTO `locales_area` VALUES ('150', '', '', '', '', '', '', '', 'Гавань Менетилов');
INSERT INTO `locales_area` VALUES ('151', '', '', '', '', '', '', '', 'Остров Дизайнера');
INSERT INTO `locales_area` VALUES ('152', '', '', '', '', '', '', '', 'Бастион');
INSERT INTO `locales_area` VALUES ('153', '', '', '', '', '', '', '', 'Руины Лордерона');
INSERT INTO `locales_area` VALUES ('154', '', '', '', '', '', '', '', 'Могильник');
INSERT INTO `locales_area` VALUES ('155', '', '', '', '', '', '', '', 'Паучья низина');
INSERT INTO `locales_area` VALUES ('156', '', '', '', '', '', '', '', 'Усадьба Соллиден');
INSERT INTO `locales_area` VALUES ('157', '', '', '', '', '', '', '', 'Мельницы Агамондов');
INSERT INTO `locales_area` VALUES ('158', '', '', '', '', '', '', '', 'Семейная усыпальница Агамондов');
INSERT INTO `locales_area` VALUES ('159', '', '', '', '', '', '', '', 'Брилл');
INSERT INTO `locales_area` VALUES ('160', '', '', '', '', '', '', '', 'Шепчущие сады');
INSERT INTO `locales_area` VALUES ('161', '', '', '', '', '', '', '', 'Терраса Покоя');
INSERT INTO `locales_area` VALUES ('162', '', '', '', '', '', '', '', 'Озеро Ясноводное');
INSERT INTO `locales_area` VALUES ('163', '', '', '', '', '', '', '', 'Приют Гюнтера');
INSERT INTO `locales_area` VALUES ('164', '', '', '', '', '', '', '', 'Ферма Гаррена');
INSERT INTO `locales_area` VALUES ('165', '', '', '', '', '', '', '', 'Усадьба Балнира');
INSERT INTO `locales_area` VALUES ('166', '', '', '', '', '', '', '', 'Поместье \"Остывший Очаг\"');
INSERT INTO `locales_area` VALUES ('167', '', '', '', '', '', '', '', 'Застава Алого Ордена');
INSERT INTO `locales_area` VALUES ('168', '', '', '', '', '', '', '', 'Северное побережье');
INSERT INTO `locales_area` VALUES ('169', '', '', '', '', '', '', '', 'Шепчущий берег');
INSERT INTO `locales_area` VALUES ('170', '', '', '', '', '', '', '', 'Озеро Лордамер');
INSERT INTO `locales_area` VALUES ('172', '', '', '', '', '', '', '', 'Остров Фенриса');
INSERT INTO `locales_area` VALUES ('173', '', '', '', '', '', '', '', 'Могила Фаола');
INSERT INTO `locales_area` VALUES ('186', '', '', '', '', '', '', '', 'Доланаар');
INSERT INTO `locales_area` VALUES ('187', '', '', '', '', '', '', '', 'Дарнас НЕ ИСПОЛЬЗУЕТСЯ');
INSERT INTO `locales_area` VALUES ('188', '', '', '', '', '', '', '', 'Тенистая долина');
INSERT INTO `locales_area` VALUES ('189', '', '', '', '', '', '', '', 'Поселок Сталежара');
INSERT INTO `locales_area` VALUES ('190', '', '', '', '', '', '', '', 'Дольный Очаг');
INSERT INTO `locales_area` VALUES ('192', '', '', '', '', '', '', '', 'Лесопилка Северного Кряжа');
INSERT INTO `locales_area` VALUES ('193', '', '', '', '', '', '', '', 'Руины Андорала');
INSERT INTO `locales_area` VALUES ('195', '', '', '', '', '', '', '', 'Школа некромантии');
INSERT INTO `locales_area` VALUES ('196', '', '', '', '', '', '', '', 'Гробница Утера');
INSERT INTO `locales_area` VALUES ('197', '', '', '', '', '', '', '', 'Холм Печали');
INSERT INTO `locales_area` VALUES ('198', '', '', '', '', '', '', '', 'Грот Слез');
INSERT INTO `locales_area` VALUES ('199', '', '', '', '', '', '', '', 'Поле Джанис');
INSERT INTO `locales_area` VALUES ('200', '', '', '', '', '', '', '', 'Слезы Далсона');
INSERT INTO `locales_area` VALUES ('201', '', '', '', '', '', '', '', 'Пустошь Гаррона');
INSERT INTO `locales_area` VALUES ('202', '', '', '', '', '', '', '', 'Удел Страданий');
INSERT INTO `locales_area` VALUES ('203', '', '', '', '', '', '', '', 'Крепость Марденхольд');
INSERT INTO `locales_area` VALUES ('204', '', '', '', '', '', '', '', 'Деревня Погребальных Костров');
INSERT INTO `locales_area` VALUES ('205', '', '', '', '', '', '', '', 'Дун Модр');
INSERT INTO `locales_area` VALUES ('206', '', '', '', '', '', '', '', 'Западный Край');
INSERT INTO `locales_area` VALUES ('207', '', '', '', '', '', '', '', 'Великое море');
INSERT INTO `locales_area` VALUES ('208', '', '', '', '', '', '', '', 'Не используется Потайная бухта');
INSERT INTO `locales_area` VALUES ('209', '', '', '', '', '', '', '', 'Крепость Темного Клыка');
INSERT INTO `locales_area` VALUES ('210', '', '', '', '', '', '', '', '***Используй меня повторно 2***');
INSERT INTO `locales_area` VALUES ('211', '', '', '', '', '', '', '', 'Заледеневшее озеро');
INSERT INTO `locales_area` VALUES ('212', '', '', '', '', '', '', '', 'Озеро Хельмово Ложе');
INSERT INTO `locales_area` VALUES ('213', '', '', '', '', '', '', '', 'Серебряный рудник');
INSERT INTO `locales_area` VALUES ('214', '', '', '', '', '', '', '', 'Великое море');
INSERT INTO `locales_area` VALUES ('215', '', '', '', '', '', '', '', 'Мулгор');
INSERT INTO `locales_area` VALUES ('219', '', '', '', '', '', '', '', 'Поместье Алекстона');
INSERT INTO `locales_area` VALUES ('220', '', '', '', '', '', '', '', 'Плато Красного Облака');
INSERT INTO `locales_area` VALUES ('221', '', '', '', '', '', '', '', 'Лагерь Нараче');
INSERT INTO `locales_area` VALUES ('222', '', '', '', '', '', '', '', 'Деревня Кровавого Копыта');
INSERT INTO `locales_area` VALUES ('223', '', '', '', '', '', '', '', 'Озеро Каменного Быка');
INSERT INTO `locales_area` VALUES ('224', '', '', '', '', '', '', '', 'Разграбленный караван');
INSERT INTO `locales_area` VALUES ('225', '', '', '', '', '', '', '', 'Красные скалы');
INSERT INTO `locales_area` VALUES ('226', '', '', '', '', '', '', '', 'Струящаяся Тьма');
INSERT INTO `locales_area` VALUES ('227', '', '', '', '', '', '', '', 'Поле Валгана');
INSERT INTO `locales_area` VALUES ('228', '', '', '', '', '', '', '', 'Гробница');
INSERT INTO `locales_area` VALUES ('229', '', '', '', '', '', '', '', 'Удел Ольсена');
INSERT INTO `locales_area` VALUES ('230', '', '', '', '', '', '', '', 'Стена Седогрива');
INSERT INTO `locales_area` VALUES ('231', '', '', '', '', '', '', '', 'Погибель Берена');
INSERT INTO `locales_area` VALUES ('232', '', '', '', '', '', '', '', 'Рассветные острова');
INSERT INTO `locales_area` VALUES ('233', '', '', '', '', '', '', '', 'Янтарная мельница');
INSERT INTO `locales_area` VALUES ('235', '', '', '', '', '', '', '', 'Крепость Фенриса');
INSERT INTO `locales_area` VALUES ('236', '', '', '', '', '', '', '', 'Крепость Темного Клыка');
INSERT INTO `locales_area` VALUES ('237', '', '', '', '', '', '', '', 'Старая переправа');
INSERT INTO `locales_area` VALUES ('238', '', '', '', '', '', '', '', 'Сад Мальдена');
INSERT INTO `locales_area` VALUES ('239', '', '', '', '', '', '', '', 'Делянка Ивара');
INSERT INTO `locales_area` VALUES ('240', '', '', '', '', '', '', '', 'Мертвое поле');
INSERT INTO `locales_area` VALUES ('241', '', '', '', '', '', '', '', 'Гниющий сад');
INSERT INTO `locales_area` VALUES ('242', '', '', '', '', '', '', '', 'Светлая роща');
INSERT INTO `locales_area` VALUES ('243', '', '', '', '', '', '', '', 'Покинутая усадьба');
INSERT INTO `locales_area` VALUES ('244', '', '', '', '', '', '', '', 'Имение Уиппл');
INSERT INTO `locales_area` VALUES ('245', '', '', '', '', '', '', '', 'Усадьба Йоргена');
INSERT INTO `locales_area` VALUES ('246', '', '', '', '', '', '', '', 'Котлован');
INSERT INTO `locales_area` VALUES ('247', '', '', '', '', '', '', '', 'Карьер Грязнули');
INSERT INTO `locales_area` VALUES ('249', '', '', '', '', '', '', '', 'Скала Молота Ужаса');
INSERT INTO `locales_area` VALUES ('250', '', '', '', '', '', '', '', 'Руины Тауриссана');
INSERT INTO `locales_area` VALUES ('251', '', '', '', '', '', '', '', 'Пламенеющий Стяг');
INSERT INTO `locales_area` VALUES ('252', '', '', '', '', '', '', '', 'Крепость Черной горы');
INSERT INTO `locales_area` VALUES ('253', '', '', '', '', '', '', '', 'Башня Пепла');
INSERT INTO `locales_area` VALUES ('254', '', '', '', '', '', '', '', 'Черная гора');
INSERT INTO `locales_area` VALUES ('255', '', '', '', '', '', '', '', 'Алтарь Бурь');
INSERT INTO `locales_area` VALUES ('256', '', '', '', '', '', '', '', 'Альдрассил');
INSERT INTO `locales_area` VALUES ('257', '', '', '', '', '', '', '', 'Паучье логово');
INSERT INTO `locales_area` VALUES ('258', '', '', '', '', '', '', '', 'Пещера Бесов');
INSERT INTO `locales_area` VALUES ('259', '', '', '', '', '', '', '', 'Озеро Аль\'Амет');
INSERT INTO `locales_area` VALUES ('260', '', '', '', '', '', '', '', 'Деревня Звездного Ветра');
INSERT INTO `locales_area` VALUES ('261', '', '', '', '', '', '', '', 'Лагерь у Кривой Сосны');
INSERT INTO `locales_area` VALUES ('262', '', '', '', '', '', '', '', 'Обитель Бен\'этиль');
INSERT INTO `locales_area` VALUES ('263', '', '', '', '', '', '', '', 'Расселина');
INSERT INTO `locales_area` VALUES ('264', '', '', '', '', '', '', '', 'Поляна Оракула');
INSERT INTO `locales_area` VALUES ('265', '', '', '', '', '', '', '', 'Родниковая река');
INSERT INTO `locales_area` VALUES ('266', '', '', '', '', '', '', '', 'Родниковое озеро');
INSERT INTO `locales_area` VALUES ('267', '', '', '', '', '', '', '', 'Предгорья Хилсбрада');
INSERT INTO `locales_area` VALUES ('268', '', '', '', '', '', '', '', 'Кратер Азшары');
INSERT INTO `locales_area` VALUES ('269', '', '', '', '', '', '', '', 'Дун Альгаз');
INSERT INTO `locales_area` VALUES ('271', '', '', '', '', '', '', '', 'Южнобережье');
INSERT INTO `locales_area` VALUES ('272', '', '', '', '', '', '', '', 'Мельница Таррен');
INSERT INTO `locales_area` VALUES ('275', '', '', '', '', '', '', '', 'Крепость Дарнхольд');
INSERT INTO `locales_area` VALUES ('276', '', '', '', '', '', '', '', 'НЕ ИСПОЛЬЗУЕТСЯ Подгорная тропа');
INSERT INTO `locales_area` VALUES ('277', '', '', '', '', '', '', '', 'Пещеры предгорий');
INSERT INTO `locales_area` VALUES ('278', '', '', '', '', '', '', '', 'Лордамерские выселки');
INSERT INTO `locales_area` VALUES ('279', '', '', '', '', '', '', '', 'Даларан');
INSERT INTO `locales_area` VALUES ('280', '', '', '', '', '', '', '', 'Странбрад');
INSERT INTO `locales_area` VALUES ('281', '', '', '', '', '', '', '', 'Руины Альтерака');
INSERT INTO `locales_area` VALUES ('282', '', '', '', '', '', '', '', 'Логово Раздробленного Хребта');
INSERT INTO `locales_area` VALUES ('283', '', '', '', '', '', '', '', 'Кровавая низина');
INSERT INTO `locales_area` VALUES ('284', '', '', '', '', '', '', '', 'Высокогорье');
INSERT INTO `locales_area` VALUES ('285', '', '', '', '', '', '', '', 'Южная башня');
INSERT INTO `locales_area` VALUES ('286', '', '', '', '', '', '', '', 'Хилсбрадские поля');
INSERT INTO `locales_area` VALUES ('287', '', '', '', '', '', '', '', 'Хилсбрад');
INSERT INTO `locales_area` VALUES ('288', '', '', '', '', '', '', '', 'Лазуритовый рудник');
INSERT INTO `locales_area` VALUES ('289', '', '', '', '', '', '', '', 'Владение Нетандера');
INSERT INTO `locales_area` VALUES ('290', '', '', '', '', '', '', '', 'Дун Гарок');
INSERT INTO `locales_area` VALUES ('293', '', '', '', '', '', '', '', 'Стена Торадина');
INSERT INTO `locales_area` VALUES ('294', '', '', '', '', '', '', '', 'Восточное побережье');
INSERT INTO `locales_area` VALUES ('295', '', '', '', '', '', '', '', 'Западное побережье');
INSERT INTO `locales_area` VALUES ('296', '', '', '', '', '', '', '', 'Южные моря НЕ ИСПОЛЬЗУЕТСЯ');
INSERT INTO `locales_area` VALUES ('297', '', '', '', '', '', '', '', 'Остров Жагуаро');
INSERT INTO `locales_area` VALUES ('298', '', '', '', '', '', '', '', 'Бухта Барадин');
INSERT INTO `locales_area` VALUES ('299', '', '', '', '', '', '', '', 'Бухта Менетилов');
INSERT INTO `locales_area` VALUES ('300', '', '', '', '', '', '', '', 'Тростниковый берег');
INSERT INTO `locales_area` VALUES ('301', '', '', '', '', '', '', '', 'Гибельный берег');
INSERT INTO `locales_area` VALUES ('302', '', '', '', '', '', '', '', 'Хрустальное взморье');
INSERT INTO `locales_area` VALUES ('303', '', '', '', '', '', '', '', 'Ракушечный пляж');
INSERT INTO `locales_area` VALUES ('305', '', '', '', '', '', '', '', 'Берег Северного прилива');
INSERT INTO `locales_area` VALUES ('306', '', '', '', '', '', '', '', 'Берег Южного прилива');
INSERT INTO `locales_area` VALUES ('307', '', '', '', '', '', '', '', 'Отвесные скалы');
INSERT INTO `locales_area` VALUES ('308', '', '', '', '', '', '', '', 'Зловещее море');
INSERT INTO `locales_area` VALUES ('309', '', '', '', '', '', '', '', 'Гробница Железноборода');
INSERT INTO `locales_area` VALUES ('310', '', '', '', '', '', '', '', 'Хрустальная шахта');
INSERT INTO `locales_area` VALUES ('311', '', '', '', '', '', '', '', 'Руины Абораза');
INSERT INTO `locales_area` VALUES ('312', '', '', '', '', '', '', '', 'Остров Жанейро');
INSERT INTO `locales_area` VALUES ('313', '', '', '', '', '', '', '', 'Северное поместье');
INSERT INTO `locales_area` VALUES ('314', '', '', '', '', '', '', '', 'Ферма Го\'Шека');
INSERT INTO `locales_area` VALUES ('315', '', '', '', '', '', '', '', 'Усадьба Дабири');
INSERT INTO `locales_area` VALUES ('316', '', '', '', '', '', '', '', 'Крепость Тяжелого Кулака');
INSERT INTO `locales_area` VALUES ('317', '', '', '', '', '', '', '', 'Деревня Сухокожих');
INSERT INTO `locales_area` VALUES ('318', '', '', '', '', '', '', '', 'Теснина Сухоусов');
INSERT INTO `locales_area` VALUES ('320', '', '', '', '', '', '', '', 'Опорный пункт');
INSERT INTO `locales_area` VALUES ('321', '', '', '', '', '', '', '', 'Павший Молот');
INSERT INTO `locales_area` VALUES ('322', '', '', '', '', '', '', '', 'Обломки судов Черноводья');
INSERT INTO `locales_area` VALUES ('323', '', '', '', '', '', '', '', 'Лагерь О\'Брина');
INSERT INTO `locales_area` VALUES ('324', '', '', '', '', '', '', '', 'Крепость Стромгард');
INSERT INTO `locales_area` VALUES ('325', '', '', '', '', '', '', '', 'Башня Аратора');
INSERT INTO `locales_area` VALUES ('326', '', '', '', '', '', '', '', 'Святилище');
INSERT INTO `locales_area` VALUES ('327', '', '', '', '', '', '', '', 'Бухта Фальдира');
INSERT INTO `locales_area` VALUES ('328', '', '', '', '', '', '', '', 'Подводный риф');
INSERT INTO `locales_area` VALUES ('330', '', '', '', '', '', '', '', 'Мост Тандола');
INSERT INTO `locales_area` VALUES ('331', '', '', '', '', '', '', '', 'Ясеневый лес');
INSERT INTO `locales_area` VALUES ('332', '', '', '', '', '', '', '', 'Великое море');
INSERT INTO `locales_area` VALUES ('333', '', '', '', '', '', '', '', 'Восточный круг Обуздания');
INSERT INTO `locales_area` VALUES ('334', '', '', '', '', '', '', '', 'Западный Круг Обуздания');
INSERT INTO `locales_area` VALUES ('335', '', '', '', '', '', '', '', 'Внутренний Круг Обуздания');
INSERT INTO `locales_area` VALUES ('336', '', '', '', '', '', '', '', 'Внешний Круг Обуздания');
INSERT INTO `locales_area` VALUES ('337', '', '', '', '', '', '', '', 'Скелет Апокрифана');
INSERT INTO `locales_area` VALUES ('338', '', '', '', '', '', '', '', 'Крепость Ангор');
INSERT INTO `locales_area` VALUES ('339', '', '', '', '', '', '', '', 'Долина Летлор');
INSERT INTO `locales_area` VALUES ('340', '', '', '', '', '', '', '', 'Каргат');
INSERT INTO `locales_area` VALUES ('341', '', '', '', '', '', '', '', 'Лагерь Кош');
INSERT INTO `locales_area` VALUES ('342', '', '', '', '', '', '', '', 'Лагерь Бофф');
INSERT INTO `locales_area` VALUES ('343', '', '', '', '', '', '', '', 'Лагерь Вург');
INSERT INTO `locales_area` VALUES ('344', '', '', '', '', '', '', '', 'Лагерь Кэгг');
INSERT INTO `locales_area` VALUES ('345', '', '', '', '', '', '', '', 'Удел Эгмонда');
INSERT INTO `locales_area` VALUES ('346', '', '', '', '', '', '', '', 'Карьер Тяжелоступа');
INSERT INTO `locales_area` VALUES ('347', '', '', '', '', '', '', '', 'Грот Гнилобрюхих');
INSERT INTO `locales_area` VALUES ('348', '', '', '', '', '', '', '', 'Заоблачный пик');
INSERT INTO `locales_area` VALUES ('349', '', '', '', '', '', '', '', 'Крепость Громового Молота');
INSERT INTO `locales_area` VALUES ('350', '', '', '', '', '', '', '', 'Сторожка Кель\'Данил');
INSERT INTO `locales_area` VALUES ('351', '', '', '', '', '', '', '', 'Осклизлая скала');
INSERT INTO `locales_area` VALUES ('352', '', '', '', '', '', '', '', 'Зун\'вата');
INSERT INTO `locales_area` VALUES ('353', '', '', '', '', '', '', '', 'Шадра\'Алор');
INSERT INTO `locales_area` VALUES ('354', '', '', '', '', '', '', '', 'Джинта\'Алор');
INSERT INTO `locales_area` VALUES ('355', '', '', '', '', '', '', '', 'Алтарь Зула');
INSERT INTO `locales_area` VALUES ('356', '', '', '', '', '', '', '', 'Серадан');
INSERT INTO `locales_area` VALUES ('357', '', '', '', '', '', '', '', 'Фералас');
INSERT INTO `locales_area` VALUES ('358', '', '', '', '', '', '', '', 'Ежевичная лощина');
INSERT INTO `locales_area` VALUES ('359', '', '', '', '', '', '', '', 'Бейл Модан');
INSERT INTO `locales_area` VALUES ('360', '', '', '', '', '', '', '', 'Рудник Торговой Компании');
INSERT INTO `locales_area` VALUES ('361', '', '', '', '', '', '', '', 'Оскверненный лес');
INSERT INTO `locales_area` VALUES ('362', '', '', '', '', '', '', '', 'Колючий Холм');
INSERT INTO `locales_area` VALUES ('363', '', '', '', '', '', '', '', 'Долина Испытаний');
INSERT INTO `locales_area` VALUES ('364', '', '', '', '', '', '', '', 'Логово');
INSERT INTO `locales_area` VALUES ('365', '', '', '', '', '', '', '', 'Грот Пылающего Клинка');
INSERT INTO `locales_area` VALUES ('366', '', '', '', '', '', '', '', 'Утес Колкар');
INSERT INTO `locales_area` VALUES ('367', '', '', '', '', '', '', '', 'Деревня Сен\'джин');
INSERT INTO `locales_area` VALUES ('368', '', '', '', '', '', '', '', 'Острова Эха');
INSERT INTO `locales_area` VALUES ('369', '', '', '', '', '', '', '', 'Громовой хребет');
INSERT INTO `locales_area` VALUES ('370', '', '', '', '', '', '', '', 'Сухая лощина');
INSERT INTO `locales_area` VALUES ('371', '', '', '', '', '', '', '', 'Пещера Пыльного Ветра');
INSERT INTO `locales_area` VALUES ('372', '', '', '', '', '', '', '', 'Крепость Тирагард');
INSERT INTO `locales_area` VALUES ('373', '', '', '', '', '', '', '', 'Берег Разбитых Кораблей');
INSERT INTO `locales_area` VALUES ('374', '', '', '', '', '', '', '', 'Бухта Острорука');
INSERT INTO `locales_area` VALUES ('375', '', '', '', '', '', '', '', 'Взморье Мертвого Глаза');
INSERT INTO `locales_area` VALUES ('377', '', '', '', '', '', '', '', 'Река Строптивая');
INSERT INTO `locales_area` VALUES ('378', '', '', '', '', '', '', '', 'Лагерь Таурахо');
INSERT INTO `locales_area` VALUES ('379', '', '', '', '', '', '', '', 'Дальняя застава');
INSERT INTO `locales_area` VALUES ('380', '', '', '', '', '', '', '', 'Перекресток');
INSERT INTO `locales_area` VALUES ('381', '', '', '', '', '', '', '', 'Каменный карьер');
INSERT INTO `locales_area` VALUES ('382', '', '', '', '', '', '', '', 'Нефтяное болото');
INSERT INTO `locales_area` VALUES ('383', '', '', '', '', '', '', '', 'Сухие холмы');
INSERT INTO `locales_area` VALUES ('384', '', '', '', '', '', '', '', 'Вершина Багрового Тумана');
INSERT INTO `locales_area` VALUES ('385', '', '', '', '', '', '', '', 'Крепость Северной Стражи');
INSERT INTO `locales_area` VALUES ('386', '', '', '', '', '', '', '', 'Забытые пруды');
INSERT INTO `locales_area` VALUES ('387', '', '', '', '', '', '', '', 'Цветущий оазис');
INSERT INTO `locales_area` VALUES ('388', '', '', '', '', '', '', '', 'Застывший оазис');
INSERT INTO `locales_area` VALUES ('390', '', '', '', '', '', '', '', 'Поля Великанов');
INSERT INTO `locales_area` VALUES ('391', '', '', '', '', '', '', '', 'Торговое побережье');
INSERT INTO `locales_area` VALUES ('392', '', '', '', '', '', '', '', 'Кабестан');
INSERT INTO `locales_area` VALUES ('393', '', '', '', '', '', '', '', 'Побережье Черного Копья');
INSERT INTO `locales_area` VALUES ('394', '', '', '', '', '', '', '', 'Озеро Дарроумир НЕ ИСПОЛЬЗУЕТСЯ');
INSERT INTO `locales_area` VALUES ('395', '', '', '', '', '', '', '', 'Каэр Дэрроу НЕ ИСПОЛЬЗУЕТСЯ');
INSERT INTO `locales_area` VALUES ('396', '', '', '', '', '', '', '', 'Колодец Заиндевевшего Копыта');
INSERT INTO `locales_area` VALUES ('397', '', '', '', '', '', '', '', 'Колодец Громового Рога');
INSERT INTO `locales_area` VALUES ('398', '', '', '', '', '', '', '', 'Колодец Буйногривых');
INSERT INTO `locales_area` VALUES ('399', '', '', '', '', '', '', '', 'Гряда на горизонте');
INSERT INTO `locales_area` VALUES ('400', '', '', '', '', '', '', '', 'Тысяча Игл');
INSERT INTO `locales_area` VALUES ('401', '', '', '', '', '', '', '', 'Лестница Прилива');
INSERT INTO `locales_area` VALUES ('403', '', '', '', '', '', '', '', 'Таверна \"Последний привал\"');
INSERT INTO `locales_area` VALUES ('404', '', '', '', '', '', '', '', 'Раскопки Бейл\'дана');
INSERT INTO `locales_area` VALUES ('405', '', '', '', '', '', '', '', 'Пустоши');
INSERT INTO `locales_area` VALUES ('406', '', '', '', '', '', '', '', 'Когтистые горы');
INSERT INTO `locales_area` VALUES ('407', '', '', '', '', '', '', '', 'Оргриммар НЕ ИСПОЛЬЗУЕТСЯ');
INSERT INTO `locales_area` VALUES ('408', '', '', '', '', '', '', '', 'Остров Гиллиджима');
INSERT INTO `locales_area` VALUES ('409', '', '', '', '', '', '', '', 'Остров доктора Лапидиса');
INSERT INTO `locales_area` VALUES ('410', '', '', '', '', '', '', '', 'Каньон Колючего Ветра');
INSERT INTO `locales_area` VALUES ('411', '', '', '', '', '', '', '', 'Убежище Батрана');
INSERT INTO `locales_area` VALUES ('412', '', '', '', '', '', '', '', 'Руины Ордил\'Арана');
INSERT INTO `locales_area` VALUES ('413', '', '', '', '', '', '', '', 'Застава Мейстры');
INSERT INTO `locales_area` VALUES ('414', '', '', '', '', '', '', '', 'Зорамское взморье');
INSERT INTO `locales_area` VALUES ('415', '', '', '', '', '', '', '', 'Астранаар');
INSERT INTO `locales_area` VALUES ('416', '', '', '', '', '', '', '', 'Святилище Эссины');
INSERT INTO `locales_area` VALUES ('417', '', '', '', '', '', '', '', 'Святилище Огненной Расщелины');
INSERT INTO `locales_area` VALUES ('418', '', '', '', '', '', '', '', 'Руины Звездной Пыли');
INSERT INTO `locales_area` VALUES ('419', '', '', '', '', '', '', '', 'Воющая долина');
INSERT INTO `locales_area` VALUES ('420', '', '', '', '', '', '', '', 'Приют Серебряного Ветра');
INSERT INTO `locales_area` VALUES ('421', '', '', '', '', '', '', '', 'Озеро Мистраль');
INSERT INTO `locales_area` VALUES ('422', '', '', '', '', '', '', '', 'Зеркало Небес');
INSERT INTO `locales_area` VALUES ('424', '', '', '', '', '', '', '', 'Озеро Ирис');
INSERT INTO `locales_area` VALUES ('425', '', '', '', '', '', '', '', 'Лунный колодец');
INSERT INTO `locales_area` VALUES ('426', '', '', '', '', '', '', '', 'Приют в Ночных Лесах');
INSERT INTO `locales_area` VALUES ('427', '', '', '', '', '', '', '', 'Тенистый закоулок');
INSERT INTO `locales_area` VALUES ('428', '', '', '', '', '', '', '', 'Ночная поляна');
INSERT INTO `locales_area` VALUES ('429', '', '', '', '', '', '', '', 'Ксавиан');
INSERT INTO `locales_area` VALUES ('430', '', '', '', '', '', '', '', 'Сатирнаар');
INSERT INTO `locales_area` VALUES ('431', '', '', '', '', '', '', '', 'Застава Расщепленного Дерева');
INSERT INTO `locales_area` VALUES ('432', '', '', '', '', '', '', '', 'Обитель Дор\'Данил');
INSERT INTO `locales_area` VALUES ('433', '', '', '', '', '', '', '', 'Река Фалфаррен');
INSERT INTO `locales_area` VALUES ('434', '', '', '', '', '', '', '', 'Холм Демонического Огня');
INSERT INTO `locales_area` VALUES ('435', '', '', '', '', '', '', '', 'Каньон Гибели Демона');
INSERT INTO `locales_area` VALUES ('436', '', '', '', '', '', '', '', 'Гряда Гибели Демона');
INSERT INTO `locales_area` VALUES ('437', '', '', '', '', '', '', '', 'Лесозаготовки Песни Войны');
INSERT INTO `locales_area` VALUES ('438', '', '', '', '', '', '', '', 'Тенистая Крона');
INSERT INTO `locales_area` VALUES ('439', '', '', '', '', '', '', '', 'Мерцающая равнина');
INSERT INTO `locales_area` VALUES ('440', '', '', '', '', '', '', '', 'Танарис');
INSERT INTO `locales_area` VALUES ('441', '', '', '', '', '', '', '', 'Озеро Фалатим');
INSERT INTO `locales_area` VALUES ('442', '', '', '', '', '', '', '', 'Аубердин');
INSERT INTO `locales_area` VALUES ('443', '', '', '', '', '', '', '', 'Руины Матистры');
INSERT INTO `locales_area` VALUES ('444', '', '', '', '', '', '', '', 'Башня Алталакса');
INSERT INTO `locales_area` VALUES ('445', '', '', '', '', '', '', '', 'Водопад Скалистый');
INSERT INTO `locales_area` VALUES ('446', '', '', '', '', '', '', '', 'Башал\'Аран');
INSERT INTO `locales_area` VALUES ('447', '', '', '', '', '', '', '', 'Амет\'Аран');
INSERT INTO `locales_area` VALUES ('448', '', '', '', '', '', '', '', 'Роща Древних');
INSERT INTO `locales_area` VALUES ('449', '', '', '', '', '', '', '', 'Меч Властителя');
INSERT INTO `locales_area` VALUES ('450', '', '', '', '', '', '', '', 'Раскопки рассеянного геолога');
INSERT INTO `locales_area` VALUES ('452', '', '', '', '', '', '', '', 'Туманный Предел');
INSERT INTO `locales_area` VALUES ('453', '', '', '', '', '', '', '', 'Длинный пролив');
INSERT INTO `locales_area` VALUES ('454', '', '', '', '', '', '', '', 'Петляющая река');
INSERT INTO `locales_area` VALUES ('455', '', '', '', '', '', '', '', 'Берлога в Чернолесье');
INSERT INTO `locales_area` VALUES ('456', '', '', '', '', '', '', '', 'Река Скалистая');
INSERT INTO `locales_area` VALUES ('457', '', '', '', '', '', '', '', 'Сокрытое море');
INSERT INTO `locales_area` VALUES ('458', '', '', '', '', '', '', '', 'Золотой Путь');
INSERT INTO `locales_area` VALUES ('459', '', '', '', '', '', '', '', 'Сторожевой пост Алого ордена');
INSERT INTO `locales_area` VALUES ('460', '', '', '', '', '', '', '', 'Приют у Солнечного Камня');
INSERT INTO `locales_area` VALUES ('461', '', '', '', '', '', '', '', 'Утес Ветрорезов');
INSERT INTO `locales_area` VALUES ('463', '', '', '', '', '', '', '', 'Скалистое озеро');
INSERT INTO `locales_area` VALUES ('464', '', '', '', '', '', '', '', 'Мутное озеро');
INSERT INTO `locales_area` VALUES ('465', '', '', '', '', '', '', '', 'Обугленная долина');
INSERT INTO `locales_area` VALUES ('466', '', '', '', '', '', '', '', 'Долина Кровавой Ярости');
INSERT INTO `locales_area` VALUES ('467', '', '', '', '', '', '', '', 'Пик Каменного Когтя');
INSERT INTO `locales_area` VALUES ('468', '', '', '', '', '', '', '', 'Логово Когтя');
INSERT INTO `locales_area` VALUES ('469', '', '', '', '', '', '', '', 'Долина Высокого леса');
INSERT INTO `locales_area` VALUES ('470', '', '', '', '', '', '', '', 'Громовой Утес НЕ ИСПОЛЬЗУЕТСЯ');
INSERT INTO `locales_area` VALUES ('471', '', '', '', '', '', '', '', 'Плато Дерзкого Ветра');
INSERT INTO `locales_area` VALUES ('472', '', '', '', '', '', '', '', 'Плато Огненного Камня');
INSERT INTO `locales_area` VALUES ('473', '', '', '', '', '', '', '', 'Скала Мантия');
INSERT INTO `locales_area` VALUES ('474', '', '', '', '', '', '', '', 'Вершина Охотников НЕ ИСПОЛЬЗУЕТСЯ');
INSERT INTO `locales_area` VALUES ('475', '', '', '', '', '', '', '', 'Уступ Духов НЕ ИСПОЛЬЗУЕТСЯ');
INSERT INTO `locales_area` VALUES ('476', '', '', '', '', '', '', '', 'Вершина Старейшин НЕ ИСПОЛЬЗУЕТСЯ');
INSERT INTO `locales_area` VALUES ('477', '', '', '', '', '', '', '', 'Руины Жубуваля');
INSERT INTO `locales_area` VALUES ('478', '', '', '', '', '', '', '', 'Пруды Арлитриэна');
INSERT INTO `locales_area` VALUES ('479', '', '', '', '', '', '', '', 'Карьер Ржавой Кувалды');
INSERT INTO `locales_area` VALUES ('480', '', '', '', '', '', '', '', 'Лагерь Э\'Ток');
INSERT INTO `locales_area` VALUES ('481', '', '', '', '', '', '', '', 'Утес Треснувшего Копыта');
INSERT INTO `locales_area` VALUES ('482', '', '', '', '', '', '', '', 'Скальное гнездовье');
INSERT INTO `locales_area` VALUES ('483', '', '', '', '', '', '', '', 'Каньон Визга');
INSERT INTO `locales_area` VALUES ('484', '', '', '', '', '', '', '', 'Застава Вольного Ветра');
INSERT INTO `locales_area` VALUES ('485', '', '', '', '', '', '', '', 'Великий Подъемник');
INSERT INTO `locales_area` VALUES ('486', '', '', '', '', '', '', '', 'Форт Галак');
INSERT INTO `locales_area` VALUES ('487', '', '', '', '', '', '', '', 'Логово Легкоперых');
INSERT INTO `locales_area` VALUES ('488', '', '', '', '', '', '', '', 'Угол Семи Ветров');
INSERT INTO `locales_area` VALUES ('489', '', '', '', '', '', '', '', 'Таланаар');
INSERT INTO `locales_area` VALUES ('490', '', '', '', '', '', '', '', 'Кратер Ун\'Горо');
INSERT INTO `locales_area` VALUES ('491', '', '', '', '', '', '', '', 'Лабиринты Иглошкурых');
INSERT INTO `locales_area` VALUES ('492', '', '', '', '', '', '', '', 'Кладбище Вороньего Холма');
INSERT INTO `locales_area` VALUES ('493', '', '', '', '', '', '', '', 'Лунная поляна');
INSERT INTO `locales_area` VALUES ('495', '', '', '', '', '', '', '', 'Удалите МЕНЯ');
INSERT INTO `locales_area` VALUES ('496', '', '', '', '', '', '', '', 'Деревня Гиблотопь');
INSERT INTO `locales_area` VALUES ('497', '', '', '', '', '', '', '', 'Сторожка \"Болотный огонек\"');
INSERT INTO `locales_area` VALUES ('498', '', '', '', '', '', '', '', 'Логово Кровавой Топи');
INSERT INTO `locales_area` VALUES ('499', '', '', '', '', '', '', '', 'Мглистая пещера');
INSERT INTO `locales_area` VALUES ('500', '', '', '', '', '', '', '', 'Вершина Моггл');
INSERT INTO `locales_area` VALUES ('501', '', '', '', '', '', '', '', 'Место крушения Бизиля');
INSERT INTO `locales_area` VALUES ('502', '', '', '', '', '', '', '', 'Ведьмин холм');
INSERT INTO `locales_area` VALUES ('503', '', '', '', '', '', '', '', 'Сторожевой пост');
INSERT INTO `locales_area` VALUES ('504', '', '', '', '', '', '', '', 'Северная башня');
INSERT INTO `locales_area` VALUES ('505', '', '', '', '', '', '', '', 'Западная башня');
INSERT INTO `locales_area` VALUES ('506', '', '', '', '', '', '', '', 'Разрушенная башня');
INSERT INTO `locales_area` VALUES ('507', '', '', '', '', '', '', '', 'Синяя топь');
INSERT INTO `locales_area` VALUES ('508', '', '', '', '', '', '', '', 'Руины Деревни Каменного Молота');
INSERT INTO `locales_area` VALUES ('509', '', '', '', '', '', '', '', 'Огненное логово');
INSERT INTO `locales_area` VALUES ('510', '', '', '', '', '', '', '', 'Земля Драконов');
INSERT INTO `locales_area` VALUES ('511', '', '', '', '', '', '', '', 'Драконьи топи');
INSERT INTO `locales_area` VALUES ('512', '', '', '', '', '', '', '', 'Логово Ониксии НЕ ИСПОЛЬЗУЕТСЯ');
INSERT INTO `locales_area` VALUES ('513', '', '', '', '', '', '', '', 'Остров Терамор');
INSERT INTO `locales_area` VALUES ('514', '', '', '', '', '', '', '', 'Цитадель');
INSERT INTO `locales_area` VALUES ('515', '', '', '', '', '', '', '', 'Потайная бухта');
INSERT INTO `locales_area` VALUES ('516', '', '', '', '', '', '', '', 'Пылевая бухта');
INSERT INTO `locales_area` VALUES ('517', '', '', '', '', '', '', '', 'Залив Яростных Волн');
INSERT INTO `locales_area` VALUES ('518', '', '', '', '', '', '', '', 'Зловещий берег');
INSERT INTO `locales_area` VALUES ('536', '', '', '', '', '', '', '', 'Участок Эддла');
INSERT INTO `locales_area` VALUES ('537', '', '', '', '', '', '', '', 'Вулкан Огненного Венца');
INSERT INTO `locales_area` VALUES ('538', '', '', '', '', '', '', '', 'Смоляные ямы Лаккари');
INSERT INTO `locales_area` VALUES ('539', '', '', '', '', '', '', '', 'Путь Ужаса');
INSERT INTO `locales_area` VALUES ('540', '', '', '', '', '', '', '', 'Скользкий овраг');
INSERT INTO `locales_area` VALUES ('541', '', '', '', '', '', '', '', 'Укрытие Маршалла');
INSERT INTO `locales_area` VALUES ('542', '', '', '', '', '', '', '', 'Пещера Лишайников');
INSERT INTO `locales_area` VALUES ('543', '', '', '', '', '', '', '', 'Горячие источники Голакка');
INSERT INTO `locales_area` VALUES ('556', '', '', '', '', '', '', '', 'Озеро Лок');
INSERT INTO `locales_area` VALUES ('576', '', '', '', '', '', '', '', 'Приют Бродяги');
INSERT INTO `locales_area` VALUES ('596', '', '', '', '', '', '', '', 'Кладбище кодо');
INSERT INTO `locales_area` VALUES ('597', '', '', '', '', '', '', '', 'Застава Скитающихся Духов');
INSERT INTO `locales_area` VALUES ('598', '', '', '', '', '', '', '', 'Побережье Сар\'Терис');
INSERT INTO `locales_area` VALUES ('599', '', '', '', '', '', '', '', 'Крепость Громового Топора');
INSERT INTO `locales_area` VALUES ('600', '', '', '', '', '', '', '', 'Пещера Болгана');
INSERT INTO `locales_area` VALUES ('602', '', '', '', '', '', '', '', 'Поле Маннорок');
INSERT INTO `locales_area` VALUES ('603', '', '', '', '', '', '', '', 'Саргерон');
INSERT INTO `locales_area` VALUES ('604', '', '', '', '', '', '', '', 'Деревня Маграм');
INSERT INTO `locales_area` VALUES ('606', '', '', '', '', '', '', '', 'Деревня Гелкис');
INSERT INTO `locales_area` VALUES ('607', '', '', '', '', '', '', '', 'Долина Копий');
INSERT INTO `locales_area` VALUES ('608', '', '', '', '', '', '', '', 'Высота Найджела');
INSERT INTO `locales_area` VALUES ('609', '', '', '', '', '', '', '', 'Деревня Колкар');
INSERT INTO `locales_area` VALUES ('616', '', '', '', '', '', '', '', 'Хиджал');
INSERT INTO `locales_area` VALUES ('618', '', '', '', '', '', '', '', 'Зимние Ключи');
INSERT INTO `locales_area` VALUES ('636', '', '', '', '', '', '', '', 'Волчья река');
INSERT INTO `locales_area` VALUES ('637', '', '', '', '', '', '', '', 'Дольмен Кодо');
INSERT INTO `locales_area` VALUES ('638', '', '', '', '', '', '', '', 'Потайная тропа');
INSERT INTO `locales_area` VALUES ('639', '', '', '', '', '', '', '', 'Священный Камень');
INSERT INTO `locales_area` VALUES ('640', '', '', '', '', '', '', '', 'Святилище Дремлющего Пламени');
INSERT INTO `locales_area` VALUES ('656', '', '', '', '', '', '', '', 'Озеро Элуне\'ара');
INSERT INTO `locales_area` VALUES ('657', '', '', '', '', '', '', '', 'Убежище');
INSERT INTO `locales_area` VALUES ('676', '', '', '', '', '', '', '', 'Запределье');
INSERT INTO `locales_area` VALUES ('696', '', '', '', '', '', '', '', 'Терраса ремесленников НЕ ИСПОЛЬЗУЕТСЯ');
INSERT INTO `locales_area` VALUES ('697', '', '', '', '', '', '', '', 'Терраса торговцев НЕ ИСПОЛЬЗУЕТСЯ');
INSERT INTO `locales_area` VALUES ('698', '', '', '', '', '', '', '', 'Храмовые сады НЕ ИСПОЛЬЗУЕТСЯ');
INSERT INTO `locales_area` VALUES ('699', '', '', '', '', '', '', '', 'Храм Элуны НЕ ИСПОЛЬЗУЕТСЯ');
INSERT INTO `locales_area` VALUES ('700', '', '', '', '', '', '', '', 'Анклав Кенария НЕ ИСПОЛЬЗУЕТСЯ');
INSERT INTO `locales_area` VALUES ('701', '', '', '', '', '', '', '', 'Терраса Воинов НЕ ИСПОЛЬЗУЕТСЯ');
INSERT INTO `locales_area` VALUES ('702', '', '', '', '', '', '', '', 'Деревня Рут\'теран');
INSERT INTO `locales_area` VALUES ('716', '', '', '', '', '', '', '', 'Мастерская Сталекрута');
INSERT INTO `locales_area` VALUES ('717', '', '', '', '', '', '', '', 'Тюрьма');
INSERT INTO `locales_area` VALUES ('718', '', '', '', '', '', '', '', 'Пещеры Стенаний');
INSERT INTO `locales_area` VALUES ('719', '', '', '', '', '', '', '', 'Непроглядная Пучина');
INSERT INTO `locales_area` VALUES ('720', '', '', '', '', '', '', '', 'Остров Битв');
INSERT INTO `locales_area` VALUES ('721', '', '', '', '', '', '', '', 'Гномреган');
INSERT INTO `locales_area` VALUES ('722', '', '', '', '', '', '', '', 'Курганы Иглошкурых');
INSERT INTO `locales_area` VALUES ('736', '', '', '', '', '', '', '', 'Лощина Бен\'этиль');
INSERT INTO `locales_area` VALUES ('796', '', '', '', '', '', '', '', 'Монастырь Алого ордена');
INSERT INTO `locales_area` VALUES ('797', '', '', '', '', '', '', '', 'Лагерь Джерода');
INSERT INTO `locales_area` VALUES ('798', '', '', '', '', '', '', '', 'Дозорная башня');
INSERT INTO `locales_area` VALUES ('799', '', '', '', '', '', '', '', 'Темный берег');
INSERT INTO `locales_area` VALUES ('800', '', '', '', '', '', '', '', 'Туннель Холодной долины');
INSERT INTO `locales_area` VALUES ('801', '', '', '', '', '', '', '', 'Долина Промозглого Ветра');
INSERT INTO `locales_area` VALUES ('802', '', '', '', '', '', '', '', 'Мерцающий хребет');
INSERT INTO `locales_area` VALUES ('803', '', '', '', '', '', '', '', 'Ферма Янтарленов');
INSERT INTO `locales_area` VALUES ('804', '', '', '', '', '', '', '', 'Холмы Тандрид');
INSERT INTO `locales_area` VALUES ('805', '', '', '', '', '', '', '', 'Южные врата');
INSERT INTO `locales_area` VALUES ('806', '', '', '', '', '', '', '', 'Застава у Южных врат');
INSERT INTO `locales_area` VALUES ('807', '', '', '', '', '', '', '', 'Северные врата');
INSERT INTO `locales_area` VALUES ('808', '', '', '', '', '', '', '', 'Застава у Северных врат');
INSERT INTO `locales_area` VALUES ('809', '', '', '', '', '', '', '', 'Врата Стальгорна');
INSERT INTO `locales_area` VALUES ('810', '', '', '', '', '', '', '', 'Тихий Омут');
INSERT INTO `locales_area` VALUES ('811', '', '', '', '', '', '', '', 'Долина Кошмаров');
INSERT INTO `locales_area` VALUES ('812', '', '', '', '', '', '', '', 'Долина ядовитых пауков');
INSERT INTO `locales_area` VALUES ('813', '', '', '', '', '', '', '', 'Бастион');
INSERT INTO `locales_area` VALUES ('814', '', '', '', '', '', '', '', 'Река Строптивая');
INSERT INTO `locales_area` VALUES ('815', '', '', '', '', '', '', '', 'Река Строптивая');
INSERT INTO `locales_area` VALUES ('816', '', '', '', '', '', '', '', 'Земли Иглогривых');
INSERT INTO `locales_area` VALUES ('817', '', '', '', '', '', '', '', 'Скала Черепа');
INSERT INTO `locales_area` VALUES ('818', '', '', '', '', '', '', '', 'Утес Бледногривов');
INSERT INTO `locales_area` VALUES ('819', '', '', '', '', '', '', '', 'Гряда Неистовства Ветра');
INSERT INTO `locales_area` VALUES ('820', '', '', '', '', '', '', '', 'Золотые равнины');
INSERT INTO `locales_area` VALUES ('821', '', '', '', '', '', '', '', 'Холмистые равнины');
INSERT INTO `locales_area` VALUES ('836', '', '', '', '', '', '', '', 'Дун Альгаз');
INSERT INTO `locales_area` VALUES ('837', '', '', '', '', '', '', '', 'Дун Альгаз');
INSERT INTO `locales_area` VALUES ('838', '', '', '', '', '', '', '', 'Северные врата');
INSERT INTO `locales_area` VALUES ('839', '', '', '', '', '', '', '', 'Южные врата');
INSERT INTO `locales_area` VALUES ('856', '', '', '', '', '', '', '', 'Мглистая роща');
INSERT INTO `locales_area` VALUES ('876', '', '', '', '', '', '', '', 'Остров ГМ');
INSERT INTO `locales_area` VALUES ('877', '', '', '', '', '', '', '', 'Удалите МЕНЯ');
INSERT INTO `locales_area` VALUES ('878', '', '', '', '', '', '', '', 'Река Строптивая');
INSERT INTO `locales_area` VALUES ('879', '', '', '', '', '', '', '', 'Река Строптивая');
INSERT INTO `locales_area` VALUES ('880', '', '', '', '', '', '', '', 'Мост Тандола');
INSERT INTO `locales_area` VALUES ('881', '', '', '', '', '', '', '', 'Мост Тандола');
INSERT INTO `locales_area` VALUES ('896', '', '', '', '', '', '', '', 'Остров Очищения');
INSERT INTO `locales_area` VALUES ('916', '', '', '', '', '', '', '', 'Владение Янсена');
INSERT INTO `locales_area` VALUES ('917', '', '', '', '', '', '', '', 'Мертвая пашня');
INSERT INTO `locales_area` VALUES ('918', '', '', '', '', '', '', '', 'Ферма Мольсена');
INSERT INTO `locales_area` VALUES ('919', '', '', '', '', '', '', '', 'Пруд Стенделя');
INSERT INTO `locales_area` VALUES ('920', '', '', '', '', '', '', '', 'Холмы Разбойничьих Кинжалов');
INSERT INTO `locales_area` VALUES ('921', '', '', '', '', '', '', '', 'Участок Демонта');
INSERT INTO `locales_area` VALUES ('922', '', '', '', '', '', '', '', 'Пыльные равнины');
INSERT INTO `locales_area` VALUES ('923', '', '', '', '', '', '', '', 'Долина Камнедробов');
INSERT INTO `locales_area` VALUES ('924', '', '', '', '', '', '', '', 'Долина Королей');
INSERT INTO `locales_area` VALUES ('925', '', '', '', '', '', '', '', 'Станция Альгаз');
INSERT INTO `locales_area` VALUES ('926', '', '', '', '', '', '', '', 'Ферма Баклбри');
INSERT INTO `locales_area` VALUES ('927', '', '', '', '', '', '', '', 'Сияющий берег');
INSERT INTO `locales_area` VALUES ('928', '', '', '', '', '', '', '', 'Северная приливная низина');
INSERT INTO `locales_area` VALUES ('936', '', '', '', '', '', '', '', 'Хребет Седых Лап');
INSERT INTO `locales_area` VALUES ('956', '', '', '', '', '', '', '', 'Зеленеющие поля');
INSERT INTO `locales_area` VALUES ('976', '', '', '', '', '', '', '', 'Прибамбасск');
INSERT INTO `locales_area` VALUES ('977', '', '', '', '', '', '', '', 'Порт Картеля');
INSERT INTO `locales_area` VALUES ('978', '', '', '', '', '', '', '', 'Зул\'Фаррак');
INSERT INTO `locales_area` VALUES ('979', '', '', '', '', '', '', '', 'Застава Скорбных Песков');
INSERT INTO `locales_area` VALUES ('980', '', '', '', '', '', '', '', 'Долина Кактусов');
INSERT INTO `locales_area` VALUES ('981', '', '', '', '', '', '', '', 'Зияющая бездна');
INSERT INTO `locales_area` VALUES ('982', '', '', '', '', '', '', '', 'Ядовитый улей');
INSERT INTO `locales_area` VALUES ('983', '', '', '', '', '', '', '', 'Поселение Песчаного Молота');
INSERT INTO `locales_area` VALUES ('984', '', '', '', '', '', '', '', 'Руины Восточной Луны');
INSERT INTO `locales_area` VALUES ('985', '', '', '', '', '', '', '', 'Родниковое поле');
INSERT INTO `locales_area` VALUES ('986', '', '', '', '', '', '', '', 'Логово Залашьи');
INSERT INTO `locales_area` VALUES ('987', '', '', '', '', '', '', '', 'Пляж на Краю Света');
INSERT INTO `locales_area` VALUES ('988', '', '', '', '', '', '', '', 'Берег Морского Бродяги');
INSERT INTO `locales_area` VALUES ('989', '', '', '', '', '', '', '', 'Ульдум');
INSERT INTO `locales_area` VALUES ('990', '', '', '', '', '', '', '', 'Долина Стражей');
INSERT INTO `locales_area` VALUES ('991', '', '', '', '', '', '', '', 'Застава Ганстена');
INSERT INTO `locales_area` VALUES ('992', '', '', '', '', '', '', '', 'Руины Южной Луны');
INSERT INTO `locales_area` VALUES ('996', '', '', '', '', '', '', '', 'Лагерь Ренда');
INSERT INTO `locales_area` VALUES ('997', '', '', '', '', '', '', '', 'Долина Ренда');
INSERT INTO `locales_area` VALUES ('998', '', '', '', '', '', '', '', 'Скала Ренда');
INSERT INTO `locales_area` VALUES ('999', '', '', '', '', '', '', '', 'Башня Каменной Стражи');
INSERT INTO `locales_area` VALUES ('1000', '', '', '', '', '', '', '', 'Долина Галарделл');
INSERT INTO `locales_area` VALUES ('1001', '', '', '', '', '', '', '', 'Озерный тракт');
INSERT INTO `locales_area` VALUES ('1002', '', '', '', '', '', '', '', 'Три Угла');
INSERT INTO `locales_area` VALUES ('1016', '', '', '', '', '', '', '', 'Зловещий холм');
INSERT INTO `locales_area` VALUES ('1017', '', '', '', '', '', '', '', 'Гряда Ящеров');
INSERT INTO `locales_area` VALUES ('1018', '', '', '', '', '', '', '', 'Черная трясина');
INSERT INTO `locales_area` VALUES ('1019', '', '', '', '', '', '', '', 'Зеленый Пояс');
INSERT INTO `locales_area` VALUES ('1020', '', '', '', '', '', '', '', 'Болото Мохошкуров');
INSERT INTO `locales_area` VALUES ('1021', '', '', '', '', '', '', '', 'Пещера Тельгена');
INSERT INTO `locales_area` VALUES ('1022', '', '', '', '', '', '', '', 'Болота Синежабрых');
INSERT INTO `locales_area` VALUES ('1023', '', '', '', '', '', '', '', 'Долина Солевого Тумана');
INSERT INTO `locales_area` VALUES ('1024', '', '', '', '', '', '', '', 'Закатное болото');
INSERT INTO `locales_area` VALUES ('1025', '', '', '', '', '', '', '', 'Зеленый Пояс');
INSERT INTO `locales_area` VALUES ('1036', '', '', '', '', '', '', '', 'Лагерь Злого Клыка');
INSERT INTO `locales_area` VALUES ('1037', '', '', '', '', '', '', '', 'Грим Батол');
INSERT INTO `locales_area` VALUES ('1038', '', '', '', '', '', '', '', 'Врата Драконьей Пасти');
INSERT INTO `locales_area` VALUES ('1039', '', '', '', '', '', '', '', 'Погибший Флот');
INSERT INTO `locales_area` VALUES ('1056', '', '', '', '', '', '', '', 'Холм Дарроу');
INSERT INTO `locales_area` VALUES ('1057', '', '', '', '', '', '', '', 'Стена Торадина');
INSERT INTO `locales_area` VALUES ('1076', '', '', '', '', '', '', '', 'Паучий тракт');
INSERT INTO `locales_area` VALUES ('1097', '', '', '', '', '', '', '', 'Затихший берег');
INSERT INTO `locales_area` VALUES ('1098', '', '', '', '', '', '', '', 'Поместье Мистмантла');
INSERT INTO `locales_area` VALUES ('1099', '', '', '', '', '', '', '', 'Лагерь Мохаче');
INSERT INTO `locales_area` VALUES ('1100', '', '', '', '', '', '', '', 'Лагерь Зловещего Тотема');
INSERT INTO `locales_area` VALUES ('1101', '', '', '', '', '', '', '', 'Гудящая Бездна');
INSERT INTO `locales_area` VALUES ('1102', '', '', '', '', '', '', '', 'Штормовое озеро');
INSERT INTO `locales_area` VALUES ('1103', '', '', '', '', '', '', '', 'Поселение Гордунни');
INSERT INTO `locales_area` VALUES ('1104', '', '', '', '', '', '', '', 'Мок\'Гордун');
INSERT INTO `locales_area` VALUES ('1105', '', '', '', '', '', '', '', 'Долина Свирепого Утеса');
INSERT INTO `locales_area` VALUES ('1106', '', '', '', '', '', '', '', 'Высокогорье Блеклых Перьев');
INSERT INTO `locales_area` VALUES ('1107', '', '', '', '', '', '', '', 'Озеро Тихого Ветра');
INSERT INTO `locales_area` VALUES ('1108', '', '', '', '', '', '', '', 'Забытый берег');
INSERT INTO `locales_area` VALUES ('1109', '', '', '', '', '', '', '', 'Восточная колонна');
INSERT INTO `locales_area` VALUES ('1110', '', '', '', '', '', '', '', 'Западная колонна');
INSERT INTO `locales_area` VALUES ('1111', '', '', '', '', '', '', '', 'Сонные Ветви');
INSERT INTO `locales_area` VALUES ('1112', '', '', '', '', '', '', '', 'Нефритовое озеро');
INSERT INTO `locales_area` VALUES ('1113', '', '', '', '', '', '', '', 'Онейрос');
INSERT INTO `locales_area` VALUES ('1114', '', '', '', '', '', '', '', 'Руины Яростного Ветра');
INSERT INTO `locales_area` VALUES ('1115', '', '', '', '', '', '', '', 'Пещера Бешеного оврага');
INSERT INTO `locales_area` VALUES ('1116', '', '', '', '', '', '', '', 'Крепость Оперенной Луны');
INSERT INTO `locales_area` VALUES ('1117', '', '', '', '', '', '', '', 'Руины Соларсаля');
INSERT INTO `locales_area` VALUES ('1118', '', '', '', '', '', '', '', 'Низинные чащобы НЕ ИСПОЛЬЗУЕТСЯ');
INSERT INTO `locales_area` VALUES ('1119', '', '', '', '', '', '', '', 'Два Колосса');
INSERT INTO `locales_area` VALUES ('1120', '', '', '', '', '', '', '', 'Остров Сардор');
INSERT INTO `locales_area` VALUES ('1121', '', '', '', '', '', '', '', 'Остров Ужаса');
INSERT INTO `locales_area` VALUES ('1136', '', '', '', '', '', '', '', 'Высокогорные дебри');
INSERT INTO `locales_area` VALUES ('1137', '', '', '', '', '', '', '', 'Низинные чащобы');
INSERT INTO `locales_area` VALUES ('1156', '', '', '', '', '', '', '', 'Южные степи');
INSERT INTO `locales_area` VALUES ('1157', '', '', '', '', '', '', '', 'Южный Золотой Путь');
INSERT INTO `locales_area` VALUES ('1176', '', '', '', '', '', '', '', 'Зул\'Фаррак');
INSERT INTO `locales_area` VALUES ('1196', '', '', '', '', '', '', '', 'НЕ ИСПОЛЬЗУЕТСЯ Остров Альказ');
INSERT INTO `locales_area` VALUES ('1216', '', '', '', '', '', '', '', 'Крепость Древобрюхов');
INSERT INTO `locales_area` VALUES ('1217', '', '', '', '', '', '', '', 'Лагерь Ванндир');
INSERT INTO `locales_area` VALUES ('1218', '', '', '', '', '', '', '', 'ТЕСТАзшара');
INSERT INTO `locales_area` VALUES ('1219', '', '', '', '', '', '', '', 'Лагерь Легаш');
INSERT INTO `locales_area` VALUES ('1220', '', '', '', '', '', '', '', 'Талассийское поселение');
INSERT INTO `locales_area` VALUES ('1221', '', '', '', '', '', '', '', 'Руины Эльдарата');
INSERT INTO `locales_area` VALUES ('1222', '', '', '', '', '', '', '', 'Гнездо Хетайры');
INSERT INTO `locales_area` VALUES ('1223', '', '', '', '', '', '', '', 'Храм Зин-Малор');
INSERT INTO `locales_area` VALUES ('1224', '', '', '', '', '', '', '', 'Медвежий угол');
INSERT INTO `locales_area` VALUES ('1225', '', '', '', '', '', '', '', 'Урсолан');
INSERT INTO `locales_area` VALUES ('1226', '', '', '', '', '', '', '', 'Храм Арккоран');
INSERT INTO `locales_area` VALUES ('1227', '', '', '', '', '', '', '', 'Залив Бурь');
INSERT INTO `locales_area` VALUES ('1228', '', '', '', '', '', '', '', 'Разоренное побережье');
INSERT INTO `locales_area` VALUES ('1229', '', '', '', '', '', '', '', 'Башня Эльдары');
INSERT INTO `locales_area` VALUES ('1230', '', '', '', '', '', '', '', 'Острые рифы');
INSERT INTO `locales_area` VALUES ('1231', '', '', '', '', '', '', '', 'Южный пляж');
INSERT INTO `locales_area` VALUES ('1232', '', '', '', '', '', '', '', 'Памятник Гребню Ворона');
INSERT INTO `locales_area` VALUES ('1233', '', '', '', '', '', '', '', 'Одинокая вершина');
INSERT INTO `locales_area` VALUES ('1234', '', '', '', '', '', '', '', 'Озеро Меннар');
INSERT INTO `locales_area` VALUES ('1235', '', '', '', '', '', '', '', 'Святилище Песни Теней');
INSERT INTO `locales_area` VALUES ('1236', '', '', '', '', '', '', '', 'Лагерь Халдарр');
INSERT INTO `locales_area` VALUES ('1237', '', '', '', '', '', '', '', 'Храбростан');
INSERT INTO `locales_area` VALUES ('1256', '', '', '', '', '', '', '', 'Опустошенный берег');
INSERT INTO `locales_area` VALUES ('1276', '', '', '', '', '', '', '', 'Туннель Когтя');
INSERT INTO `locales_area` VALUES ('1277', '', '', '', '', '', '', '', 'Туннель Когтя');
INSERT INTO `locales_area` VALUES ('1296', '', '', '', '', '', '', '', 'Ферма Каменного Клыка');
INSERT INTO `locales_area` VALUES ('1297', '', '', '', '', '', '', '', 'Свиноферма');
INSERT INTO `locales_area` VALUES ('1316', '', '', '', '', '', '', '', 'Курганы Иглошкурых');
INSERT INTO `locales_area` VALUES ('1336', '', '', '', '', '', '', '', 'Бухта Сорванных Парусов');
INSERT INTO `locales_area` VALUES ('1337', '', '', '', '', '', '', '', 'Ульдаман');
INSERT INTO `locales_area` VALUES ('1338', '', '', '', '', '', '', '', 'Озеро Лордамер');
INSERT INTO `locales_area` VALUES ('1339', '', '', '', '', '', '', '', 'Озеро Лордамер');
INSERT INTO `locales_area` VALUES ('1357', '', '', '', '', '', '', '', 'Перекресток Висельников');
INSERT INTO `locales_area` VALUES ('1377', '', '', '', '', '', '', '', 'Силитус');
INSERT INTO `locales_area` VALUES ('1397', '', '', '', '', '', '', '', 'Изумрудный лес');
INSERT INTO `locales_area` VALUES ('1417', '', '', '', '', '', '', '', 'Затонувший храм');
INSERT INTO `locales_area` VALUES ('1437', '', '', '', '', '', '', '', 'Форт Молота Ужаса');
INSERT INTO `locales_area` VALUES ('1438', '', '', '', '', '', '', '', 'Крепость Стражей Пустоты');
INSERT INTO `locales_area` VALUES ('1439', '', '', '', '', '', '', '', 'Стоянка Молота Ужаса');
INSERT INTO `locales_area` VALUES ('1440', '', '', '', '', '', '', '', 'Змеиные Кольца');
INSERT INTO `locales_area` VALUES ('1441', '', '', '', '', '', '', '', 'Алтарь Бурь');
INSERT INTO `locales_area` VALUES ('1442', '', '', '', '', '', '', '', 'Гряда Огненной стражи');
INSERT INTO `locales_area` VALUES ('1443', '', '', '', '', '', '', '', 'Шлаковая Яма');
INSERT INTO `locales_area` VALUES ('1444', '', '', '', '', '', '', '', 'Пепельное Море');
INSERT INTO `locales_area` VALUES ('1445', '', '', '', '', '', '', '', 'Черная гора');
INSERT INTO `locales_area` VALUES ('1446', '', '', '', '', '', '', '', 'Лагерь Братства Тория');
INSERT INTO `locales_area` VALUES ('1457', '', '', '', '', '', '', '', 'Мастерские Гарнизона');
INSERT INTO `locales_area` VALUES ('1477', '', '', '', '', '', '', '', 'Храм Атал\'Хаккара');
INSERT INTO `locales_area` VALUES ('1497', '', '', '', '', '', '', '', 'Подгород');
INSERT INTO `locales_area` VALUES ('1517', '', '', '', '', '', '', '', 'Ульдаман');
INSERT INTO `locales_area` VALUES ('1518', '', '', '', '', '', '', '', 'Не использующиеся Мертвые копи');
INSERT INTO `locales_area` VALUES ('1519', '', '', '', '', '', '', '', 'Штормград');
INSERT INTO `locales_area` VALUES ('1537', '', '', '', '', '', '', '', 'Стальгорн');
INSERT INTO `locales_area` VALUES ('1557', '', '', '', '', '', '', '', 'Оплот Треснувшего Копыта');
INSERT INTO `locales_area` VALUES ('1577', '', '', '', '', '', '', '', 'Мыс Тернистой долины');
INSERT INTO `locales_area` VALUES ('1578', '', '', '', '', '', '', '', 'Южный Гибельный берег');
INSERT INTO `locales_area` VALUES ('1579', '', '', '', '', '', '', '', 'НЕ ИСПОЛЬЗУЕТСЯ Мертвые копи 002');
INSERT INTO `locales_area` VALUES ('1580', '', '', '', '', '', '', '', 'НЕ ИСПОЛЬЗУЕТСЯ Потайная бухта 003');
INSERT INTO `locales_area` VALUES ('1581', '', '', '', '', '', '', '', 'Мертвые копи');
INSERT INTO `locales_area` VALUES ('1582', '', '', '', '', '', '', '', 'Потайная бухта');
INSERT INTO `locales_area` VALUES ('1583', '', '', '', '', '', '', '', 'Пик Черной горы');
INSERT INTO `locales_area` VALUES ('1584', '', '', '', '', '', '', '', 'Глубины Черной горы');
INSERT INTO `locales_area` VALUES ('1597', '', '', '', '', '', '', '', 'Земли ящеров НЕ ИСПОЛЬЗУЕТСЯ');
INSERT INTO `locales_area` VALUES ('1598', '', '', '', '', '', '', '', 'Ферма Гроль\'дома НЕ ИСПОЛЬЗУЕТСЯ');
INSERT INTO `locales_area` VALUES ('1599', '', '', '', '', '', '', '', 'Лагерь Мор\'шан');
INSERT INTO `locales_area` VALUES ('1600', '', '', '', '', '', '', '', 'Застава Чести НЕ ИСПОЛЬЗУЕТСЯ');
INSERT INTO `locales_area` VALUES ('1601', '', '', '', '', '', '', '', 'Хребет Черный шип НЕ ИСПОЛЬЗУЕТСЯ');
INSERT INTO `locales_area` VALUES ('1602', '', '', '', '', '', '', '', 'Ежевичный Шип НЕ ИСПОЛЬЗУЕТСЯ');
INSERT INTO `locales_area` VALUES ('1603', '', '', '', '', '', '', '', 'Агамагор НЕ ИСПОЛЬЗУЕТСЯ');
INSERT INTO `locales_area` VALUES ('1617', '', '', '', '', '', '', '', 'Аллея Героев');
INSERT INTO `locales_area` VALUES ('1637', '', '', '', '', '', '', '', 'Оргриммар');
INSERT INTO `locales_area` VALUES ('1638', '', '', '', '', '', '', '', 'Громовой Утес');
INSERT INTO `locales_area` VALUES ('1639', '', '', '', '', '', '', '', 'Вершина Старейшин');
INSERT INTO `locales_area` VALUES ('1640', '', '', '', '', '', '', '', 'Вершина Духов');
INSERT INTO `locales_area` VALUES ('1641', '', '', '', '', '', '', '', 'Вершина Охотников');
INSERT INTO `locales_area` VALUES ('1657', '', '', '', '', '', '', '', 'Дарнас');
INSERT INTO `locales_area` VALUES ('1658', '', '', '', '', '', '', '', 'Анклав Кенария');
INSERT INTO `locales_area` VALUES ('1659', '', '', '', '', '', '', '', 'Терраса Ремесленников');
INSERT INTO `locales_area` VALUES ('1660', '', '', '', '', '', '', '', 'Терраса Воинов');
INSERT INTO `locales_area` VALUES ('1661', '', '', '', '', '', '', '', 'Храмовые сады');
INSERT INTO `locales_area` VALUES ('1662', '', '', '', '', '', '', '', 'Терраса Торговцев');
INSERT INTO `locales_area` VALUES ('1677', '', '', '', '', '', '', '', 'Возвышенность Гэвина');
INSERT INTO `locales_area` VALUES ('1678', '', '', '', '', '', '', '', 'Возвышенность Соферы');
INSERT INTO `locales_area` VALUES ('1679', '', '', '', '', '', '', '', 'Уступ Коррана');
INSERT INTO `locales_area` VALUES ('1680', '', '', '', '', '', '', '', 'Высокий отрог');
INSERT INTO `locales_area` VALUES ('1681', '', '', '', '', '', '', '', 'Мглистый берег');
INSERT INTO `locales_area` VALUES ('1682', '', '', '', '', '', '', '', 'Овчарня Дандреда');
INSERT INTO `locales_area` VALUES ('1683', '', '', '', '', '', '', '', 'Промерзшая пещера');
INSERT INTO `locales_area` VALUES ('1684', '', '', '', '', '', '', '', 'Берег Промозглого Ветра');
INSERT INTO `locales_area` VALUES ('1697', '', '', '', '', '', '', '', 'Земли Ящеров');
INSERT INTO `locales_area` VALUES ('1698', '', '', '', '', '', '', '', 'Ежевичный овраг');
INSERT INTO `locales_area` VALUES ('1699', '', '', '', '', '', '', '', 'Тернистый холм');
INSERT INTO `locales_area` VALUES ('1700', '', '', '', '', '', '', '', 'Агама\'гор');
INSERT INTO `locales_area` VALUES ('1701', '', '', '', '', '', '', '', 'Хребет Черных Шипов');
INSERT INTO `locales_area` VALUES ('1702', '', '', '', '', '', '', '', 'Застава Чести');
INSERT INTO `locales_area` VALUES ('1703', '', '', '', '', '', '', '', 'Застава Мор\'шан');
INSERT INTO `locales_area` VALUES ('1704', '', '', '', '', '', '', '', 'Ферма Гроль\'дома');
INSERT INTO `locales_area` VALUES ('1717', '', '', '', '', '', '', '', 'Лабиринты Иглошкурых');
INSERT INTO `locales_area` VALUES ('1718', '', '', '', '', '', '', '', 'Великий Подъемник');
INSERT INTO `locales_area` VALUES ('1737', '', '', '', '', '', '', '', 'Мглистая долина');
INSERT INTO `locales_area` VALUES ('1738', '', '', '', '', '', '', '', 'Родник Нек\'Мани');
INSERT INTO `locales_area` VALUES ('1739', '', '', '', '', '', '', '', 'Лагерь Кровавого Паруса');
INSERT INTO `locales_area` VALUES ('1740', '', '', '', '', '', '', '', 'Главный лагерь Торговой Компании');
INSERT INTO `locales_area` VALUES ('1741', '', '', '', '', '', '', '', 'Арена Гурубаши');
INSERT INTO `locales_area` VALUES ('1742', '', '', '', '', '', '', '', 'Пещера Духов');
INSERT INTO `locales_area` VALUES ('1757', '', '', '', '', '', '', '', 'Кровавая Завеса');
INSERT INTO `locales_area` VALUES ('1758', '', '', '', '', '', '', '', 'Бурун');
INSERT INTO `locales_area` VALUES ('1759', '', '', '', '', '', '', '', 'Госпожа Удача');
INSERT INTO `locales_area` VALUES ('1760', '', '', '', '', '', '', '', 'Штаб-квартира Торговой Компании');
INSERT INTO `locales_area` VALUES ('1761', '', '', '', '', '', '', '', 'Деревня Мертвого Леса');
INSERT INTO `locales_area` VALUES ('1762', '', '', '', '', '', '', '', 'Деревня Сквернолапов');
INSERT INTO `locales_area` VALUES ('1763', '', '', '', '', '', '', '', 'Джеденар');
INSERT INTO `locales_area` VALUES ('1764', '', '', '', '', '', '', '', 'Река Отравленной Крови');
INSERT INTO `locales_area` VALUES ('1765', '', '', '', '', '', '', '', 'Водопад Отравленной Крови');
INSERT INTO `locales_area` VALUES ('1766', '', '', '', '', '', '', '', 'Долина Рваных Ран');
INSERT INTO `locales_area` VALUES ('1767', '', '', '', '', '', '', '', 'Железнолесье');
INSERT INTO `locales_area` VALUES ('1768', '', '', '', '', '', '', '', 'Пещера Железнолесья');
INSERT INTO `locales_area` VALUES ('1769', '', '', '', '', '', '', '', 'Крепость Древобрюхов');
INSERT INTO `locales_area` VALUES ('1770', '', '', '', '', '', '', '', 'Оплот Теней');
INSERT INTO `locales_area` VALUES ('1771', '', '', '', '', '', '', '', 'Святилище Искусителя');
INSERT INTO `locales_area` VALUES ('1777', '', '', '', '', '', '', '', 'Пещера Итара');
INSERT INTO `locales_area` VALUES ('1778', '', '', '', '', '', '', '', 'Горемрак');
INSERT INTO `locales_area` VALUES ('1779', '', '', '', '', '', '', '', 'Деревня Дренил\'дур');
INSERT INTO `locales_area` VALUES ('1780', '', '', '', '', '', '', '', 'Развилка Расщепленного Копья');
INSERT INTO `locales_area` VALUES ('1797', '', '', '', '', '', '', '', 'Вязкая топь');
INSERT INTO `locales_area` VALUES ('1798', '', '', '', '', '', '', '', 'Ползучая трясина');
INSERT INTO `locales_area` VALUES ('1817', '', '', '', '', '', '', '', 'Пещера у Вязкой топи');
INSERT INTO `locales_area` VALUES ('1837', '', '', '', '', '', '', '', 'Пещеры Сухокожих');
INSERT INTO `locales_area` VALUES ('1857', '', '', '', '', '', '', '', 'Стена Торадина');
INSERT INTO `locales_area` VALUES ('1858', '', '', '', '', '', '', '', 'Камен\'гор');
INSERT INTO `locales_area` VALUES ('1877', '', '', '', '', '', '', '', 'Долина Клыков');
INSERT INTO `locales_area` VALUES ('1878', '', '', '', '', '', '', '', 'Знойные Пески');
INSERT INTO `locales_area` VALUES ('1879', '', '', '', '', '', '', '', 'Маревые равнины');
INSERT INTO `locales_area` VALUES ('1880', '', '', '', '', '', '', '', 'Домик Пероборода');
INSERT INTO `locales_area` VALUES ('1881', '', '', '', '', '', '', '', 'Лагерь Выпивохи');
INSERT INTO `locales_area` VALUES ('1882', '', '', '', '', '', '', '', 'Чумная лощина');
INSERT INTO `locales_area` VALUES ('1883', '', '', '', '', '', '', '', 'Озеро Доблести');
INSERT INTO `locales_area` VALUES ('1884', '', '', '', '', '', '', '', 'Агол\'вата');
INSERT INTO `locales_area` VALUES ('1885', '', '', '', '', '', '', '', 'Хири\'вата');
INSERT INTO `locales_area` VALUES ('1886', '', '', '', '', '', '', '', 'Ползучие руины');
INSERT INTO `locales_area` VALUES ('1887', '', '', '', '', '', '', '', 'Грот Богена');
INSERT INTO `locales_area` VALUES ('1897', '', '', '', '', '', '', '', 'Терраса Творца');
INSERT INTO `locales_area` VALUES ('1898', '', '', '', '', '', '', '', 'Лощина Суховея');
INSERT INTO `locales_area` VALUES ('1917', '', '', '', '', '', '', '', 'Шаол\'вата');
INSERT INTO `locales_area` VALUES ('1937', '', '', '', '', '', '', '', 'Руины Полуденной Тени');
INSERT INTO `locales_area` VALUES ('1938', '', '', '', '', '', '', '', 'Разбитая Колонна');
INSERT INTO `locales_area` VALUES ('1939', '', '', '', '', '', '', '', 'Безбрежные пески');
INSERT INTO `locales_area` VALUES ('1940', '', '', '', '', '', '', '', 'Берег за Южной грядой');
INSERT INTO `locales_area` VALUES ('1941', '', '', '', '', '', '', '', 'Пещеры Времени');
INSERT INTO `locales_area` VALUES ('1942', '', '', '', '', '', '', '', 'Топи');
INSERT INTO `locales_area` VALUES ('1943', '', '', '', '', '', '', '', 'Плато Железного Камня');
INSERT INTO `locales_area` VALUES ('1957', '', '', '', '', '', '', '', 'Обугленная пещера');
INSERT INTO `locales_area` VALUES ('1958', '', '', '', '', '', '', '', 'Палатка Дубильщицы');
INSERT INTO `locales_area` VALUES ('1959', '', '', '', '', '', '', '', 'Выжженная долина');
INSERT INTO `locales_area` VALUES ('1977', '', '', '', '', '', '', '', 'Зул\'Гуруб');
INSERT INTO `locales_area` VALUES ('1978', '', '', '', '', '', '', '', 'Тростниковая застава');
INSERT INTO `locales_area` VALUES ('1997', '', '', '', '', '', '', '', 'Застава Отравленной Крови');
INSERT INTO `locales_area` VALUES ('1998', '', '', '', '', '', '', '', 'Поляна Когтистых Ветвей');
INSERT INTO `locales_area` VALUES ('2017', '', '', '', '', '', '', '', 'Стратхольм');
INSERT INTO `locales_area` VALUES ('2037', '', '', '', '', '', '', '', 'НЕ ИСПОЛЬЗУЕТСЯ Крепость Темного Клыка 003');
INSERT INTO `locales_area` VALUES ('2057', '', '', '', '', '', '', '', 'Некроситет');
INSERT INTO `locales_area` VALUES ('2077', '', '', '', '', '', '', '', 'Сумеречная долина');
INSERT INTO `locales_area` VALUES ('2078', '', '', '', '', '', '', '', 'Сумеречная излучина');
INSERT INTO `locales_area` VALUES ('2079', '', '', '', '', '', '', '', 'Остров Алькац');
INSERT INTO `locales_area` VALUES ('2097', '', '', '', '', '', '', '', 'Пик Темного Облака');
INSERT INTO `locales_area` VALUES ('2098', '', '', '', '', '', '', '', 'Катакомбы Утреннего Леса');
INSERT INTO `locales_area` VALUES ('2099', '', '', '', '', '', '', '', 'Крепость Каменной Стражи');
INSERT INTO `locales_area` VALUES ('2100', '', '', '', '', '', '', '', 'Мародон');
INSERT INTO `locales_area` VALUES ('2101', '', '', '', '', '', '', '', 'Таверна \"Крепкое пойло\"');
INSERT INTO `locales_area` VALUES ('2102', '', '', '', '', '', '', '', 'Таверна \"Громоварка\"');
INSERT INTO `locales_area` VALUES ('2103', '', '', '', '', '', '', '', 'Крепость Менетил');
INSERT INTO `locales_area` VALUES ('2104', '', '', '', '', '', '', '', 'Таверна \"Большая вода\"');
INSERT INTO `locales_area` VALUES ('2117', '', '', '', '', '', '', '', 'Мрачный склеп');
INSERT INTO `locales_area` VALUES ('2118', '', '', '', '', '', '', '', 'Ратуша Брилла');
INSERT INTO `locales_area` VALUES ('2119', '', '', '', '', '', '', '', 'Таверна \"Петля висельника\"');
INSERT INTO `locales_area` VALUES ('2137', '', '', '', '', '', '', '', 'Пруды ВиденийНЕ ИСПОЛЬЗУЕТСЯ');
INSERT INTO `locales_area` VALUES ('2138', '', '', '', '', '', '', '', 'Пещера Багрового Тумана');
INSERT INTO `locales_area` VALUES ('2157', '', '', '', '', '', '', '', 'Крепость Бейл\'дан');
INSERT INTO `locales_area` VALUES ('2158', '', '', '', '', '', '', '', 'Логово Огнебора');
INSERT INTO `locales_area` VALUES ('2159', '', '', '', '', '', '', '', 'Логово Ониксии');
INSERT INTO `locales_area` VALUES ('2160', '', '', '', '', '', '', '', 'Рудник Ветрорезов');
INSERT INTO `locales_area` VALUES ('2161', '', '', '', '', '', '', '', 'Погибель Роланда');
INSERT INTO `locales_area` VALUES ('2177', '', '', '', '', '', '', '', 'Ринг');
INSERT INTO `locales_area` VALUES ('2197', '', '', '', '', '', '', '', 'Пруды Видений');
INSERT INTO `locales_area` VALUES ('2198', '', '', '', '', '', '', '', 'Лощина Тьмы');
INSERT INTO `locales_area` VALUES ('2217', '', '', '', '', '', '', '', 'Деревня Сломанного Копья');
INSERT INTO `locales_area` VALUES ('2237', '', '', '', '', '', '', '', 'Застава Белого Плеса');
INSERT INTO `locales_area` VALUES ('2238', '', '', '', '', '', '', '', 'Горния');
INSERT INTO `locales_area` VALUES ('2239', '', '', '', '', '', '', '', 'Око Зейна');
INSERT INTO `locales_area` VALUES ('2240', '', '', '', '', '', '', '', 'Виражи на Миражах');
INSERT INTO `locales_area` VALUES ('2241', '', '', '', '', '', '', '', 'Уступ Ледопардов');
INSERT INTO `locales_area` VALUES ('2242', '', '', '', '', '', '', '', 'Сокрытая роща');
INSERT INTO `locales_area` VALUES ('2243', '', '', '', '', '', '', '', 'Застава Древобрюхов');
INSERT INTO `locales_area` VALUES ('2244', '', '', '', '', '', '', '', 'Деревня Зимней Спячки');
INSERT INTO `locales_area` VALUES ('2245', '', '', '', '', '', '', '', 'Мазторил');
INSERT INTO `locales_area` VALUES ('2246', '', '', '', '', '', '', '', 'Источники Ледяного огня');
INSERT INTO `locales_area` VALUES ('2247', '', '', '', '', '', '', '', 'Холмы Ледополоха');
INSERT INTO `locales_area` VALUES ('2248', '', '', '', '', '', '', '', 'Дун Мандарр');
INSERT INTO `locales_area` VALUES ('2249', '', '', '', '', '', '', '', 'Теснина Ледяного Шепота');
INSERT INTO `locales_area` VALUES ('2250', '', '', '', '', '', '', '', 'Совиная чаща');
INSERT INTO `locales_area` VALUES ('2251', '', '', '', '', '', '', '', 'Озеро Кел\'Терил');
INSERT INTO `locales_area` VALUES ('2252', '', '', '', '', '', '', '', 'Руины Кел\'Терила');
INSERT INTO `locales_area` VALUES ('2253', '', '', '', '', '', '', '', 'Деревня Звездопада');
INSERT INTO `locales_area` VALUES ('2254', '', '', '', '', '', '', '', 'Берлога Бен\'Таллоу');
INSERT INTO `locales_area` VALUES ('2255', '', '', '', '', '', '', '', 'Круговзор');
INSERT INTO `locales_area` VALUES ('2256', '', '', '', '', '', '', '', 'Теснина Зловещего Шепота');
INSERT INTO `locales_area` VALUES ('2257', '', '', '', '', '', '', '', 'Подземный поезд');
INSERT INTO `locales_area` VALUES ('2258', '', '', '', '', '', '', '', 'Грибная долина');
INSERT INTO `locales_area` VALUES ('2259', '', '', '', '', '', '', '', 'НЕ ИСПОЛЬЗУЕТСЯПоместье Маррисов');
INSERT INTO `locales_area` VALUES ('2260', '', '', '', '', '', '', '', 'Поместье Маррисов');
INSERT INTO `locales_area` VALUES ('2261', '', '', '', '', '', '', '', 'Крипта');
INSERT INTO `locales_area` VALUES ('2262', '', '', '', '', '', '', '', 'Дарроушир');
INSERT INTO `locales_area` VALUES ('2263', '', '', '', '', '', '', '', 'Башня королевской стражи');
INSERT INTO `locales_area` VALUES ('2264', '', '', '', '', '', '', '', 'Перекресток Корина');
INSERT INTO `locales_area` VALUES ('2265', '', '', '', '', '', '', '', 'Лагерь Алого ордена');
INSERT INTO `locales_area` VALUES ('2266', '', '', '', '', '', '', '', 'Длань Тира');
INSERT INTO `locales_area` VALUES ('2267', '', '', '', '', '', '', '', 'Алая Базилика');
INSERT INTO `locales_area` VALUES ('2268', '', '', '', '', '', '', '', 'Часовня Последней Надежды');
INSERT INTO `locales_area` VALUES ('2269', '', '', '', '', '', '', '', 'Лесопилка Бровача');
INSERT INTO `locales_area` VALUES ('2270', '', '', '', '', '', '', '', 'Ядовитая поляна');
INSERT INTO `locales_area` VALUES ('2271', '', '', '', '', '', '', '', 'Восточная башня');
INSERT INTO `locales_area` VALUES ('2272', '', '', '', '', '', '', '', 'Северный Дол');
INSERT INTO `locales_area` VALUES ('2273', '', '', '', '', '', '', '', 'Зул\'Машар');
INSERT INTO `locales_area` VALUES ('2274', '', '', '', '', '', '', '', 'Мазра\'Алор');
INSERT INTO `locales_area` VALUES ('2275', '', '', '', '', '', '', '', 'Башня Северного перевала');
INSERT INTO `locales_area` VALUES ('2276', '', '', '', '', '', '', '', 'Сторожка Кель\'Литиен');
INSERT INTO `locales_area` VALUES ('2277', '', '', '', '', '', '', '', 'Проклятый лес');
INSERT INTO `locales_area` VALUES ('2278', '', '', '', '', '', '', '', 'Оплот Плети');
INSERT INTO `locales_area` VALUES ('2279', '', '', '', '', '', '', '', 'Стратхольм');
INSERT INTO `locales_area` VALUES ('2280', '', '', '', '', '', '', '', 'НЕ ИСПОЛЬЗУЕТСЯ Стратхольм');
INSERT INTO `locales_area` VALUES ('2297', '', '', '', '', '', '', '', 'Озеро Дарроумир');
INSERT INTO `locales_area` VALUES ('2298', '', '', '', '', '', '', '', 'Каэр Дарроу');
INSERT INTO `locales_area` VALUES ('2299', '', '', '', '', '', '', '', 'Озеро Дарроумир');
INSERT INTO `locales_area` VALUES ('2300', '', '', '', '', '', '', '', 'Пещеры Времени');
INSERT INTO `locales_area` VALUES ('2301', '', '', '', '', '', '', '', 'Деревня Колючего Меха');
INSERT INTO `locales_area` VALUES ('2302', '', '', '', '', '', '', '', 'Трясина');
INSERT INTO `locales_area` VALUES ('2303', '', '', '', '', '', '', '', 'Безветренный каньон');
INSERT INTO `locales_area` VALUES ('2317', '', '', '', '', '', '', '', 'Южные моря');
INSERT INTO `locales_area` VALUES ('2318', '', '', '', '', '', '', '', 'Великое море');
INSERT INTO `locales_area` VALUES ('2319', '', '', '', '', '', '', '', 'Великое море');
INSERT INTO `locales_area` VALUES ('2320', '', '', '', '', '', '', '', 'Великое море');
INSERT INTO `locales_area` VALUES ('2321', '', '', '', '', '', '', '', 'Великое море');
INSERT INTO `locales_area` VALUES ('2322', '', '', '', '', '', '', '', 'Сокрытое море');
INSERT INTO `locales_area` VALUES ('2323', '', '', '', '', '', '', '', 'Сокрытое море');
INSERT INTO `locales_area` VALUES ('2324', '', '', '', '', '', '', '', 'Сокрытое море');
INSERT INTO `locales_area` VALUES ('2325', '', '', '', '', '', '', '', 'Сокрытое море');
INSERT INTO `locales_area` VALUES ('2326', '', '', '', '', '', '', '', 'Сокрытое море');
INSERT INTO `locales_area` VALUES ('2337', '', '', '', '', '', '', '', 'Казармы Колючего Холма');
INSERT INTO `locales_area` VALUES ('2338', '', '', '', '', '', '', '', 'Южные моря');
INSERT INTO `locales_area` VALUES ('2339', '', '', '', '', '', '', '', 'Великое море');
INSERT INTO `locales_area` VALUES ('2357', '', '', '', '', '', '', '', 'Лагерь Кровавого Клыка');
INSERT INTO `locales_area` VALUES ('2358', '', '', '', '', '', '', '', 'Лесная Песнь');
INSERT INTO `locales_area` VALUES ('2359', '', '', '', '', '', '', '', 'Деревня Зеленой Лапы');
INSERT INTO `locales_area` VALUES ('2360', '', '', '', '', '', '', '', 'Аванпост Среброкрылых');
INSERT INTO `locales_area` VALUES ('2361', '', '', '', '', '', '', '', 'Ночная Гавань');
INSERT INTO `locales_area` VALUES ('2362', '', '', '', '', '', '', '', 'Святилище Ремула');
INSERT INTO `locales_area` VALUES ('2363', '', '', '', '', '', '', '', 'Кельи Малфуриона');
INSERT INTO `locales_area` VALUES ('2364', '', '', '', '', '', '', '', 'Великое море');
INSERT INTO `locales_area` VALUES ('2365', '', '', '', '', '', '', '', 'Великое море');
INSERT INTO `locales_area` VALUES ('2366', '', '', '', '', '', '', '', 'Черные топи');
INSERT INTO `locales_area` VALUES ('2367', '', '', '', '', '', '', '', 'Старые предгорья Хилсбрада');
INSERT INTO `locales_area` VALUES ('2368', '', '', '', '', '', '', '', 'Мельница Таррен');
INSERT INTO `locales_area` VALUES ('2369', '', '', '', '', '', '', '', 'Южнобережье');
INSERT INTO `locales_area` VALUES ('2370', '', '', '', '', '', '', '', 'Крепость Дарнхольд');
INSERT INTO `locales_area` VALUES ('2371', '', '', '', '', '', '', '', 'Дун Гарок');
INSERT INTO `locales_area` VALUES ('2372', '', '', '', '', '', '', '', 'Хилсбрадские поля');
INSERT INTO `locales_area` VALUES ('2373', '', '', '', '', '', '', '', 'Восточное побережье');
INSERT INTO `locales_area` VALUES ('2374', '', '', '', '', '', '', '', 'Владение Нетандера');
INSERT INTO `locales_area` VALUES ('2375', '', '', '', '', '', '', '', 'Холм Дарроу');
INSERT INTO `locales_area` VALUES ('2376', '', '', '', '', '', '', '', 'Южная башня');
INSERT INTO `locales_area` VALUES ('2377', '', '', '', '', '', '', '', 'Стена Торадина');
INSERT INTO `locales_area` VALUES ('2378', '', '', '', '', '', '', '', 'Западное побережье');
INSERT INTO `locales_area` VALUES ('2379', '', '', '', '', '', '', '', 'Лазуритовый рудник');
INSERT INTO `locales_area` VALUES ('2397', '', '', '', '', '', '', '', 'Великое море');
INSERT INTO `locales_area` VALUES ('2398', '', '', '', '', '', '', '', 'Великое море');
INSERT INTO `locales_area` VALUES ('2399', '', '', '', '', '', '', '', 'Великое море');
INSERT INTO `locales_area` VALUES ('2400', '', '', '', '', '', '', '', 'Зловещее море');
INSERT INTO `locales_area` VALUES ('2401', '', '', '', '', '', '', '', 'Зловещее море');
INSERT INTO `locales_area` VALUES ('2402', '', '', '', '', '', '', '', 'Зловещее море');
INSERT INTO `locales_area` VALUES ('2403', '', '', '', '', '', '', '', 'Зловещее море');
INSERT INTO `locales_area` VALUES ('2404', '', '', '', '', '', '', '', 'Тефрис-Аран');
INSERT INTO `locales_area` VALUES ('2405', '', '', '', '', '', '', '', 'Этель-Ретор');
INSERT INTO `locales_area` VALUES ('2406', '', '', '', '', '', '', '', 'Остров Раназьяр');
INSERT INTO `locales_area` VALUES ('2407', '', '', '', '', '', '', '', 'Хижина Кормека');
INSERT INTO `locales_area` VALUES ('2408', '', '', '', '', '', '', '', 'Деревня Ночных Охотников');
INSERT INTO `locales_area` VALUES ('2417', '', '', '', '', '', '', '', 'Перевал Черной горы');
INSERT INTO `locales_area` VALUES ('2418', '', '', '', '', '', '', '', 'Дозор Моргана');
INSERT INTO `locales_area` VALUES ('2419', '', '', '', '', '', '', '', 'Скользкая скала');
INSERT INTO `locales_area` VALUES ('2420', '', '', '', '', '', '', '', 'Тропа Крылатого Ужаса');
INSERT INTO `locales_area` VALUES ('2421', '', '', '', '', '', '', '', 'Драко\'дар');
INSERT INTO `locales_area` VALUES ('2437', '', '', '', '', '', '', '', 'Огненная пропасть');
INSERT INTO `locales_area` VALUES ('2457', '', '', '', '', '', '', '', 'Леса Ночной Песни');
INSERT INTO `locales_area` VALUES ('2477', '', '', '', '', '', '', '', 'Сокрытое море');
INSERT INTO `locales_area` VALUES ('2478', '', '', '', '', '', '', '', 'Морлос\'Аран');
INSERT INTO `locales_area` VALUES ('2479', '', '', '', '', '', '', '', 'Изумрудное святилище');
INSERT INTO `locales_area` VALUES ('2480', '', '', '', '', '', '', '', 'Долина Нефритового Пламени');
INSERT INTO `locales_area` VALUES ('2481', '', '', '', '', '', '', '', 'Руины Констелласа');
INSERT INTO `locales_area` VALUES ('2497', '', '', '', '', '', '', '', 'Горькие плесы');
INSERT INTO `locales_area` VALUES ('2517', '', '', '', '', '', '', '', 'Утес Осквернителя');
INSERT INTO `locales_area` VALUES ('2518', '', '', '', '', '', '', '', 'Павильон Лорисс');
INSERT INTO `locales_area` VALUES ('2519', '', '', '', '', '', '', '', 'Холмы Древолапов');
INSERT INTO `locales_area` VALUES ('2520', '', '', '', '', '', '', '', 'Логово Древолапов');
INSERT INTO `locales_area` VALUES ('2521', '', '', '', '', '', '', '', 'Река Вердантис');
INSERT INTO `locales_area` VALUES ('2522', '', '', '', '', '', '', '', 'Руины Исильдиэна');
INSERT INTO `locales_area` VALUES ('2537', '', '', '', '', '', '', '', 'Застава Зловещего Тотема');
INSERT INTO `locales_area` VALUES ('2538', '', '', '', '', '', '', '', 'Лагерь Апарахе');
INSERT INTO `locales_area` VALUES ('2539', '', '', '', '', '', '', '', 'Малака\'джин');
INSERT INTO `locales_area` VALUES ('2540', '', '', '', '', '', '', '', 'Ущелье Камнепадов');
INSERT INTO `locales_area` VALUES ('2541', '', '', '', '', '', '', '', 'Сиширский каньон');
INSERT INTO `locales_area` VALUES ('2557', '', '', '', '', '', '', '', 'Забытый Город');
INSERT INTO `locales_area` VALUES ('2558', '', '', '', '', '', '', '', 'Овраг Мертвого Ветра');
INSERT INTO `locales_area` VALUES ('2559', '', '', '', '', '', '', '', 'Река Алмазная');
INSERT INTO `locales_area` VALUES ('2560', '', '', '', '', '', '', '', 'Лагерь Аридена');
INSERT INTO `locales_area` VALUES ('2561', '', '', '', '', '', '', '', 'Погань');
INSERT INTO `locales_area` VALUES ('2562', '', '', '', '', '', '', '', 'Каражан');
INSERT INTO `locales_area` VALUES ('2563', '', '', '', '', '', '', '', 'Надел Моргана');
INSERT INTO `locales_area` VALUES ('2577', '', '', '', '', '', '', '', 'Забытый Город');
INSERT INTO `locales_area` VALUES ('2597', '', '', '', '', '', '', '', 'Альтеракская долина');
INSERT INTO `locales_area` VALUES ('2617', '', '', '', '', '', '', '', 'Лагерь Заржавня');
INSERT INTO `locales_area` VALUES ('2618', '', '', '', '', '', '', '', 'Холм Нефритового Пламени');
INSERT INTO `locales_area` VALUES ('2619', '', '', '', '', '', '', '', 'Река Тондрорил');
INSERT INTO `locales_area` VALUES ('2620', '', '', '', '', '', '', '', 'Река Тондрорил');
INSERT INTO `locales_area` VALUES ('2621', '', '', '', '', '', '', '', 'Озеро Мерельдар');
INSERT INTO `locales_area` VALUES ('2622', '', '', '', '', '', '', '', 'Моровой овраг');
INSERT INTO `locales_area` VALUES ('2623', '', '', '', '', '', '', '', 'Чумной овраг');
INSERT INTO `locales_area` VALUES ('2624', '', '', '', '', '', '', '', 'Озеро Чернолесья');
INSERT INTO `locales_area` VALUES ('2625', '', '', '', '', '', '', '', 'Восточные ворота');
INSERT INTO `locales_area` VALUES ('2626', '', '', '', '', '', '', '', 'Туннель Ужаса');
INSERT INTO `locales_area` VALUES ('2627', '', '', '', '', '', '', '', 'Долина Ужаса');
INSERT INTO `locales_area` VALUES ('2637', '', '', '', '', '', '', '', 'Крепость Каргатия');
INSERT INTO `locales_area` VALUES ('2657', '', '', '', '', '', '', '', 'Долина Костей');
INSERT INTO `locales_area` VALUES ('2677', '', '', '', '', '', '', '', 'Логово Крыла Тьмы');
INSERT INTO `locales_area` VALUES ('2697', '', '', '', '', '', '', '', 'Перекресток Мертвеца');
INSERT INTO `locales_area` VALUES ('2717', '', '', '', '', '', '', '', 'Огненные Недра');
INSERT INTO `locales_area` VALUES ('2737', '', '', '', '', '', '', '', 'Стена Скарабея');
INSERT INTO `locales_area` VALUES ('2738', '', '', '', '', '', '', '', 'Деревня Южного Ветра');
INSERT INTO `locales_area` VALUES ('2739', '', '', '', '', '', '', '', 'Сумеречный лагерь');
INSERT INTO `locales_area` VALUES ('2740', '', '', '', '', '', '', '', 'Долина Кристаллов');
INSERT INTO `locales_area` VALUES ('2741', '', '', '', '', '', '', '', 'Помост Скарабея');
INSERT INTO `locales_area` VALUES ('2742', '', '', '', '', '', '', '', 'Улей Аши');
INSERT INTO `locales_area` VALUES ('2743', '', '', '', '', '', '', '', 'Улей Зора');
INSERT INTO `locales_area` VALUES ('2744', '', '', '', '', '', '', '', 'Улей Регал');
INSERT INTO `locales_area` VALUES ('2757', '', '', '', '', '', '', '', 'Святилище Павшего Воина');
INSERT INTO `locales_area` VALUES ('2777', '', '', '', '', '', '', '', 'НЕ ИСПОЛЬЗУЕТСЯ Альтеракская долина');
INSERT INTO `locales_area` VALUES ('2797', '', '', '', '', '', '', '', 'Непроглядная Пучина');
INSERT INTO `locales_area` VALUES ('2817', '', '', '', '', '', '', '', '***Используй меня повторно 4***');
INSERT INTO `locales_area` VALUES ('2837', '', '', '', '', '', '', '', 'Хозяйский погреб');
INSERT INTO `locales_area` VALUES ('2838', '', '', '', '', '', '', '', 'Подгорная тропа');
INSERT INTO `locales_area` VALUES ('2839', '', '', '', '', '', '', '', 'Альтеракская долина');
INSERT INTO `locales_area` VALUES ('2857', '', '', '', '', '', '', '', 'Гремящая Клеть');
INSERT INTO `locales_area` VALUES ('2877', '', '', '', '', '', '', '', 'Глыба Тест');
INSERT INTO `locales_area` VALUES ('2897', '', '', '', '', '', '', '', 'Форт Зорам\'гар');
INSERT INTO `locales_area` VALUES ('2917', '', '', '', '', '', '', '', 'Зал Легенд');
INSERT INTO `locales_area` VALUES ('2918', '', '', '', '', '', '', '', 'Зал Защитника');
INSERT INTO `locales_area` VALUES ('2937', '', '', '', '', '', '', '', 'Поселок Грош\'гок');
INSERT INTO `locales_area` VALUES ('2938', '', '', '', '', '', '', '', 'Спящая теснина');
INSERT INTO `locales_area` VALUES ('2957', '', '', '', '', '', '', '', 'Железный рудник');
INSERT INTO `locales_area` VALUES ('2958', '', '', '', '', '', '', '', 'Форт Каменного Очага');
INSERT INTO `locales_area` VALUES ('2959', '', '', '', '', '', '', '', 'Дун Болдар');
INSERT INTO `locales_area` VALUES ('2960', '', '', '', '', '', '', '', 'Перевал Ледяного Крыла');
INSERT INTO `locales_area` VALUES ('2961', '', '', '', '', '', '', '', 'Деревня Северного Волка');
INSERT INTO `locales_area` VALUES ('2962', '', '', '', '', '', '', '', 'Смотровая башня');
INSERT INTO `locales_area` VALUES ('2963', '', '', '', '', '', '', '', 'Рудник Ледяного Зуба');
INSERT INTO `locales_area` VALUES ('2964', '', '', '', '', '', '', '', 'Форт Ледяной Секиры');
INSERT INTO `locales_area` VALUES ('2977', '', '', '', '', '', '', '', 'Гарнизон Стылой Крови');
INSERT INTO `locales_area` VALUES ('2978', '', '', '', '', '', '', '', 'Крепость Северного Волка');
INSERT INTO `locales_area` VALUES ('2979', '', '', '', '', '', '', '', 'Ферма Тор\'кренов');
INSERT INTO `locales_area` VALUES ('3017', '', '', '', '', '', '', '', 'Перевал Ледяного Клинка');
INSERT INTO `locales_area` VALUES ('3037', '', '', '', '', '', '', '', 'Лагерь Железного Камня');
INSERT INTO `locales_area` VALUES ('3038', '', '', '', '', '', '', '', 'Кратер Криворука');
INSERT INTO `locales_area` VALUES ('3039', '', '', '', '', '', '', '', 'Руины Тахонды');
INSERT INTO `locales_area` VALUES ('3057', '', '', '', '', '', '', '', 'Поле брани');
INSERT INTO `locales_area` VALUES ('3058', '', '', '', '', '', '', '', 'Пещера Ледяного Крыла');
INSERT INTO `locales_area` VALUES ('3077', '', '', '', '', '', '', '', 'Погост Отважных');
INSERT INTO `locales_area` VALUES ('3097', '', '', '', '', '', '', '', 'Роящаяся вершина');
INSERT INTO `locales_area` VALUES ('3098', '', '', '', '', '', '', '', 'Сумеречная застава');
INSERT INTO `locales_area` VALUES ('3099', '', '', '', '', '', '', '', 'Сумеречный форт');
INSERT INTO `locales_area` VALUES ('3100', '', '', '', '', '', '', '', 'Разоренный Сумеречный лагерь');
INSERT INTO `locales_area` VALUES ('3117', '', '', '', '', '', '', '', 'Убежище Шалзару');
INSERT INTO `locales_area` VALUES ('3137', '', '', '', '', '', '', '', 'Застава Талрендис');
INSERT INTO `locales_area` VALUES ('3138', '', '', '', '', '', '', '', 'Святилище Ретресса');
INSERT INTO `locales_area` VALUES ('3139', '', '', '', '', '', '', '', 'Обитель Лунного Ужаса');
INSERT INTO `locales_area` VALUES ('3140', '', '', '', '', '', '', '', 'Пещера Чешуеборода');
INSERT INTO `locales_area` VALUES ('3157', '', '', '', '', '', '', '', 'Пещера Камнепадов');
INSERT INTO `locales_area` VALUES ('3177', '', '', '', '', '', '', '', 'Рабочий лагерь Песни Войны');
INSERT INTO `locales_area` VALUES ('3197', '', '', '', '', '', '', '', 'Лагерь Промозглого Ветра');
INSERT INTO `locales_area` VALUES ('3217', '', '', '', '', '', '', '', 'Ристалище');
INSERT INTO `locales_area` VALUES ('3237', '', '', '', '', '', '', '', 'Молот НЕ ИСПОЛЬЗУЕТСЯ');
INSERT INTO `locales_area` VALUES ('3257', '', '', '', '', '', '', '', 'Кости Граккаронда');
INSERT INTO `locales_area` VALUES ('3277', '', '', '', '', '', '', '', 'Ущелье Песни Войны');
INSERT INTO `locales_area` VALUES ('3297', '', '', '', '', '', '', '', 'Кладбище Северного Волка');
INSERT INTO `locales_area` VALUES ('3298', '', '', '', '', '', '', '', 'Перевал Северного Волка');
INSERT INTO `locales_area` VALUES ('3299', '', '', '', '', '', '', '', 'Перевал Дун Болдар');
INSERT INTO `locales_area` VALUES ('3300', '', '', '', '', '', '', '', 'Кладбище Стылой Крови');
INSERT INTO `locales_area` VALUES ('3301', '', '', '', '', '', '', '', 'Кладбище Снегопада');
INSERT INTO `locales_area` VALUES ('3302', '', '', '', '', '', '', '', 'Кладбище Каменного Очага');
INSERT INTO `locales_area` VALUES ('3303', '', '', '', '', '', '', '', 'Кладбище Грозовой Вершины');
INSERT INTO `locales_area` VALUES ('3304', '', '', '', '', '', '', '', 'Укрытие Ледяного Крыла');
INSERT INTO `locales_area` VALUES ('3305', '', '', '', '', '', '', '', 'Укрытие Каменного Очага');
INSERT INTO `locales_area` VALUES ('3306', '', '', '', '', '', '', '', 'Гряда Дикой Лапы');
INSERT INTO `locales_area` VALUES ('3317', '', '', '', '', '', '', '', 'Деревня Сломанного Клыка');
INSERT INTO `locales_area` VALUES ('3318', '', '', '', '', '', '', '', 'Обелиск Дуротана');
INSERT INTO `locales_area` VALUES ('3319', '', '', '', '', '', '', '', 'Роща Среброкрылых');
INSERT INTO `locales_area` VALUES ('3320', '', '', '', '', '', '', '', 'Лесопилка Песни Войны');
INSERT INTO `locales_area` VALUES ('3321', '', '', '', '', '', '', '', 'Крепость Среброкрылых');
INSERT INTO `locales_area` VALUES ('3337', '', '', '', '', '', '', '', 'Пещера Дикой Лапы');
INSERT INTO `locales_area` VALUES ('3338', '', '', '', '', '', '', '', 'Сокрытое ущелье');
INSERT INTO `locales_area` VALUES ('3357', '', '', '', '', '', '', '', 'Остров Йоджамба');
INSERT INTO `locales_area` VALUES ('3358', '', '', '', '', '', '', '', 'Низина Арати');
INSERT INTO `locales_area` VALUES ('3377', '', '', '', '', '', '', '', 'Змеиное Кольцо');
INSERT INTO `locales_area` VALUES ('3378', '', '', '', '', '', '', '', 'Алтарь Хир\'ика');
INSERT INTO `locales_area` VALUES ('3379', '', '', '', '', '', '', '', 'Шадра\'заар');
INSERT INTO `locales_area` VALUES ('3380', '', '', '', '', '', '', '', 'Земли Хаккари');
INSERT INTO `locales_area` VALUES ('3381', '', '', '', '', '', '', '', 'Холм Ширвалла');
INSERT INTO `locales_area` VALUES ('3382', '', '', '', '', '', '', '', 'Храм Бетекк');
INSERT INTO `locales_area` VALUES ('3383', '', '', '', '', '', '', '', 'Алтарь Кипящей Крови');
INSERT INTO `locales_area` VALUES ('3384', '', '', '', '', '', '', '', 'Алтарь Бога Крови');
INSERT INTO `locales_area` VALUES ('3397', '', '', '', '', '', '', '', 'Пирамида Занзы');
INSERT INTO `locales_area` VALUES ('3398', '', '', '', '', '', '', '', 'Грань Безумия');
INSERT INTO `locales_area` VALUES ('3417', '', '', '', '', '', '', '', 'Зал Троллебоя');
INSERT INTO `locales_area` VALUES ('3418', '', '', '', '', '', '', '', 'Логово Осквернителя');
INSERT INTO `locales_area` VALUES ('3419', '', '', '', '', '', '', '', 'Стоянка Пэгла');
INSERT INTO `locales_area` VALUES ('3420', '', '', '', '', '', '', '', 'Ферма');
INSERT INTO `locales_area` VALUES ('3421', '', '', '', '', '', '', '', 'Кузница');
INSERT INTO `locales_area` VALUES ('3422', '', '', '', '', '', '', '', 'Лесопилка');
INSERT INTO `locales_area` VALUES ('3423', '', '', '', '', '', '', '', 'Золотой рудник');
INSERT INTO `locales_area` VALUES ('3424', '', '', '', '', '', '', '', 'Стойла');
INSERT INTO `locales_area` VALUES ('3425', '', '', '', '', '', '', '', 'Крепость Кенария');
INSERT INTO `locales_area` VALUES ('3426', '', '', '', '', '', '', '', 'Лагерь Оленьего Шлема');
INSERT INTO `locales_area` VALUES ('3427', '', '', '', '', '', '', '', 'Лагерь Бронзоборода');
INSERT INTO `locales_area` VALUES ('3428', '', '', '', '', '', '', '', 'Ан\'Кираж');
INSERT INTO `locales_area` VALUES ('3429', '', '', '', '', '', '', '', 'Руины Ан\'Киража');
INSERT INTO `locales_area` VALUES ('3446', '', '', '', '', '', '', '', 'Сумеречная пещера');
INSERT INTO `locales_area` VALUES ('3447', '', '', '', '', '', '', '', 'Укрытие Ортелла');
INSERT INTO `locales_area` VALUES ('3448', '', '', '', '', '', '', '', 'Терраса Скарабея');
INSERT INTO `locales_area` VALUES ('3449', '', '', '', '', '', '', '', 'Терраса Генерала');
INSERT INTO `locales_area` VALUES ('3450', '', '', '', '', '', '', '', 'Резервуар');
INSERT INTO `locales_area` VALUES ('3451', '', '', '', '', '', '', '', 'Инкубатор');
INSERT INTO `locales_area` VALUES ('3452', '', '', '', '', '', '', '', 'Соты');
INSERT INTO `locales_area` VALUES ('3453', '', '', '', '', '', '', '', 'Терраса Стражей');
INSERT INTO `locales_area` VALUES ('3454', '', '', '', '', '', '', '', 'Руины Ан\'Киража');
INSERT INTO `locales_area` VALUES ('3456', '', '', '', '', '', '', '', 'Наксрамас');
INSERT INTO `locales_area` VALUES ('3459', '', '', '', '', '', '', '', 'Город');
INSERT INTO `locales_area` VALUES ('3478', '', '', '', '', '', '', '', 'Врата Ан\'Киража');
INSERT INTO `locales_area` VALUES ('3486', '', '', '', '', '', '', '', 'Поместье Черного Ворона');

 
 
/* 
* 20170123142652_world.sql 
*/ 
INSERT INTO `migrations` VALUES ('20170123142652'); 

-- Goblin Bomb Dispenser
UPDATE `creature_template` SET 
`unit_flags` = 32776,
`maxgold` = 0, `scale` = 0.2, 
`speed_walk` = 0.6, `speed_run` = 1.14286, 
`mechanic_immune_mask` = 902267455, `ScriptName` = 'npc_goblin_bomb_dispenser' WHERE `entry` = 8937;

-- Explosive Sheep
UPDATE `creature_template` SET 
`unit_flags` = 32776,
`mingold` = 0, `maxgold` = 0, 
`speed_walk` = 1.08, `speed_run` = 1.14286, 
`mechanic_immune_mask` = 902267455, `AIName` = '', `ScriptName` = 'npc_explosive_sheep' WHERE `entry` = 2675;

DELETE FROM `creature_ai_scripts` WHERE `creature_id` = 2675;
 
 
/* 
* 20170123145704_world.sql 
*/ 
INSERT INTO `migrations` VALUES ('20170123145704');

-- Update spawntime of Waterlogged Footlocker
UPDATE `gameobject` SET `spawntimesecs` = 180  WHERE `id` = 179487;

-- Update "Special Snowflake" Waterlogged Footlocker
UPDATE `gameobject` SET `spawntimesecs` = 540 WHERE `guid` = 47812; 
 
/* 
* 20170123151850_world.sql 
*/ 
INSERT INTO `migrations` VALUES ('20170123151850');

-- Update Footlocker spawntimes
UPDATE `gameobject` SET `spawntimesecs` = 180 WHERE `id` = 179486 OR `id` = 179492 OR `id` = 179486 OR `id` = 179494 OR `id` = 179490;
 
 
/* 
* 20170123192033_world.sql 
*/ 
INSERT INTO `migrations` VALUES ('20170123192033'); 

-- Rescue OOX-17/TN!
DELETE FROM `script_waypoint` WHERE `entry` = 7784 AND `pointid` BETWEEN 26 AND 34;
REPLACE INTO `script_waypoint` VALUES
( '7784', '26', '-7975.16', '-4500.39', '10.90', '0', '' ),
( '7784', '27', '-7947.92', '-4581.73', '11.09', '0', '' ),
( '7784', '28', '-7875.96', '-4645.89', '9.99', '0', '' ),
( '7784', '29', '-7816.43', '-4707.44', '11.04', '0', '' ),
( '7784', '30', '-7780.92', '-4761.81', '9.5', '0', '' ),
( '7784', '31', '-7587.67', '-4765.01', '8.96', '0', '' ),
( '7784', '32', '-7497.65', '-4792.86', '10.01', '0', 'second ambush SAY_AMBUSH' ),
( '7784', '33', '-7391.54', '-4774.26', '12.44', '0', '' ),
( '7784', '34', '-7308.42', '-4739.87', '12.65', '0', '' ),
( '7784', '35', '-7016.11', '-4751.12', '10.06', '0', '' ),
( '7784', '36', '-6985.52', '-4777.41', '10.26', '0', '' ),
( '7784', '37', '-6953.02', '-4786', '6.32', '0', '' ),
( '7784', '38', '-6940.37', '-4831.03', '0.67', '10000', 'quest complete SAY_END' );
 
 
/* 
* 20170123195300_world.sql 
*/ 
INSERT INTO `migrations` VALUES ('20170123195300'); 

-- Rok'Alim the Pounder
UPDATE `creature` SET `spawntimesecs` = 600, `spawnFlags` = 24 WHERE `id` = 4499;
 
 
/* 
* 20170124093500_world.sql 
*/ 
INSERT INTO `migrations` VALUES ('20170124093500'); 

UPDATE `locales_area` SET `Entry`='1', `NameLoc1`='던 모로', `NameLoc2`='Dun Morogh', `NameLoc3`='Dun Morogh', `NameLoc4`='丹莫罗', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Дун Морог' WHERE (`Entry`='1');
UPDATE `locales_area` SET `Entry`='2', `NameLoc1`='기나긴 해안', `NameLoc2`='Longrivage', `NameLoc3`='Longshore', `NameLoc4`='长滩', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Бескрайний берег' WHERE (`Entry`='2');
UPDATE `locales_area` SET `Entry`='3', `NameLoc1`='황야의 땅', `NameLoc2`='Terres ingrates (Badlands)', `NameLoc3`='Ödland', `NameLoc4`='荒芜之地', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Бесплодные земли' WHERE (`Entry`='3');
UPDATE `locales_area` SET `Entry`='4', `NameLoc1`='저주받은 땅', `NameLoc2`='Terres foudroyées (Blasted Lands)', `NameLoc3`='Verwüstete Lande', `NameLoc4`='诅咒之地', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Выжженные земли' WHERE (`Entry`='4');
UPDATE `locales_area` SET `Entry`='7', `NameLoc1`='검은바다 만', `NameLoc2`='Crique des Flots noirs', `NameLoc3`='Schwarzmeerbucht', `NameLoc4`='黑水湾', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Бухта Черноводья' WHERE (`Entry`='7');
UPDATE `locales_area` SET `Entry`='8', `NameLoc1`='슬픔의 늪', `NameLoc2`='Marais des Chagrins (Swamp of Sorrows)', `NameLoc3`='Sümpfe des Elends', `NameLoc4`='悲伤沼泽', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Болото Печали' WHERE (`Entry`='8');
UPDATE `locales_area` SET `Entry`='9', `NameLoc1`='노스샤이어 계곡', `NameLoc2`='Vallée de Northshire', `NameLoc3`='Nordhaintal', `NameLoc4`='北郡山谷', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Долина Североземья' WHERE (`Entry`='9');
UPDATE `locales_area` SET `Entry`='10', `NameLoc1`='그늘숲', `NameLoc2`='Bois de la Pénombre (Duskwood)', `NameLoc3`='Dämmerwald', `NameLoc4`='暮色森林', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Сумеречный лес' WHERE (`Entry`='10');
UPDATE `locales_area` SET `Entry`='11', `NameLoc1`='저습지', `NameLoc2`='Les Paluns (Wetlands)', `NameLoc3`='Sumpfland', `NameLoc4`='湿地', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Болотина' WHERE (`Entry`='11');
UPDATE `locales_area` SET `Entry`='12', `NameLoc1`='엘윈 숲', `NameLoc2`='Forêt d\'Elwynn', `NameLoc3`='Wald von Elwynn', `NameLoc4`='艾尔文森林', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Элвиннский лес' WHERE (`Entry`='12');
UPDATE `locales_area` SET `Entry`='13', `NameLoc1`='세계수', `NameLoc2`='L\'Arbre-monde', `NameLoc3`='Der Weltbaum', `NameLoc4`='世界之树', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Древо Жизни' WHERE (`Entry`='13');
UPDATE `locales_area` SET `Entry`='14', `NameLoc1`='듀로타', `NameLoc2`='Durotar', `NameLoc3`='Durotar', `NameLoc4`='杜隆塔尔', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Дуротар' WHERE (`Entry`='14');
UPDATE `locales_area` SET `Entry`='15', `NameLoc1`='먼지진흙 습지대', `NameLoc2`='Marécage d\'Âprefange (Dustwallow Marsh)', `NameLoc3`='Marschen von Dustwallow', `NameLoc4`='尘泥沼泽', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Пылевые топи' WHERE (`Entry`='15');
UPDATE `locales_area` SET `Entry`='16', `NameLoc1`='아즈샤라', `NameLoc2`='Azshara', `NameLoc3`='Azshara', `NameLoc4`='艾萨拉', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Азшара' WHERE (`Entry`='16');
UPDATE `locales_area` SET `Entry`='17', `NameLoc1`='불모의 땅', `NameLoc2`='Les Tarides (the Barrens)', `NameLoc3`='Brachland', `NameLoc4`='贫瘠之地', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Степи' WHERE (`Entry`='17');
UPDATE `locales_area` SET `Entry`='18', `NameLoc1`='수정 호수', `NameLoc2`='Lac de Cristal', `NameLoc3`='Kristallsee', `NameLoc4`='水晶湖', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Озеро Хрустальное' WHERE (`Entry`='18');
UPDATE `locales_area` SET `Entry`='19', `NameLoc1`='줄구룹', `NameLoc2`='Zul\'Gurub', `NameLoc3`='Zul\'Gurub', `NameLoc4`='祖尔格拉布', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Зул\'Гуруб' WHERE (`Entry`='19');
UPDATE `locales_area` SET `Entry`='20', `NameLoc1`='문브룩', `NameLoc2`='Ruisselune', `NameLoc3`='Moonbrook', `NameLoc4`='月溪镇', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Луноречье' WHERE (`Entry`='20');
UPDATE `locales_area` SET `Entry`='21', `NameLoc1`='쿨 티라스', `NameLoc2`='Kul Tiras', `NameLoc3`='Kul Tiras', `NameLoc4`='库尔提拉斯', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Кул-Тирас' WHERE (`Entry`='21');
UPDATE `locales_area` SET `Entry`='22', `NameLoc1`='프로그래머의 섬', `NameLoc2`='Ile des programmeurs', `NameLoc3`='Programmierer-Insel', `NameLoc4`='Programmer Isle', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Остров Программиста' WHERE (`Entry`='22');
UPDATE `locales_area` SET `Entry`='23', `NameLoc1`='노스샤이어 강', `NameLoc2`='Fleuve Northshire', `NameLoc3`='Der Nordhain', `NameLoc4`='北郡河', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Река Североземья' WHERE (`Entry`='23');
UPDATE `locales_area` SET `Entry`='24', `NameLoc1`='노스샤이어 수도원', `NameLoc2`='Abbaye de Northshire', `NameLoc3`='Abtei von Nordhain', `NameLoc4`='北郡修道院', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Аббатство Североземья' WHERE (`Entry`='24');
UPDATE `locales_area` SET `Entry`='25', `NameLoc1`='검은바위 산', `NameLoc2`='Mont Blackrock', `NameLoc3`='Der Blackrock', `NameLoc4`='黑石山', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Черная гора' WHERE (`Entry`='25');
UPDATE `locales_area` SET `Entry`='26', `NameLoc1`='등대', `NameLoc2`='Phare', `NameLoc3`='Leuchtturm', `NameLoc4`='灯塔', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Маяк' WHERE (`Entry`='26');
UPDATE `locales_area` SET `Entry`='28', `NameLoc1`='서부 역병지대', `NameLoc2`='Maleterres de l\'ouest (Western Plaguelands)', `NameLoc3`='Westliche Pestländer', `NameLoc4`='西瘟疫之地', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Западные Чумные земли' WHERE (`Entry`='28');
UPDATE `locales_area` SET `Entry`='30', `NameLoc1`='나인', `NameLoc2`='Neuf', `NameLoc3`='Nine', `NameLoc4`='Nine', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Девять' WHERE (`Entry`='30');
UPDATE `locales_area` SET `Entry`='32', `NameLoc1`='묘지', `NameLoc2`='Le cimetière', `NameLoc3`='Der Friedhof', `NameLoc4`='大墓地', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Кладбище' WHERE (`Entry`='32');
UPDATE `locales_area` SET `Entry`='33', `NameLoc1`='가시덤불 골짜기', `NameLoc2`='Vallée de Strangleronce (Stranglethorn Vale)', `NameLoc3`='Schlingendorntal', `NameLoc4`='荆棘谷', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Тернистая долина' WHERE (`Entry`='33');
UPDATE `locales_area` SET `Entry`='34', `NameLoc1`='메아리 광산', `NameLoc2`='Mine de la crête aux échos', `NameLoc3`='Echokammmine', `NameLoc4`='回音山矿洞', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Рудник Горного Эха' WHERE (`Entry`='34');
UPDATE `locales_area` SET `Entry`='35', `NameLoc1`='무법항', `NameLoc2`='Baie-du-Butin', `NameLoc3`='Booty Bay', `NameLoc4`='藏宝海湾', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Пиратская Бухта' WHERE (`Entry`='35');
UPDATE `locales_area` SET `Entry`='36', `NameLoc1`='알터랙 산맥', `NameLoc2`='Montagnes d\'Alterac', `NameLoc3`='Alteracgebirge', `NameLoc4`='奥特兰克山脉', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Альтеракские горы' WHERE (`Entry`='36');
UPDATE `locales_area` SET `Entry`='37', `NameLoc1`='나즈페리티 호수', `NameLoc2`='Lac Nazfériti', `NameLoc3`='Der Nazferitisee', `NameLoc4`='纳菲瑞提湖', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Озеро Назферити' WHERE (`Entry`='37');
UPDATE `locales_area` SET `Entry`='38', `NameLoc1`='모단 호수', `NameLoc2`='Loch Modan', `NameLoc3`='Loch Modan', `NameLoc4`='洛克莫丹', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Лок Модан' WHERE (`Entry`='38');
UPDATE `locales_area` SET `Entry`='40', `NameLoc1`='서부 몰락지대', `NameLoc2`='Marche de l\'Ouest (Westfall)', `NameLoc3`='Westfall', `NameLoc4`='西部荒野', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Западный Край' WHERE (`Entry`='40');
UPDATE `locales_area` SET `Entry`='41', `NameLoc1`='죽음의 고개', `NameLoc2`='Défilé de Deuillevent (Deadwind Pass)', `NameLoc3`='Gebirgspass der Totenwinde', `NameLoc4`='逆风小径', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Перевал Мертвого Ветра' WHERE (`Entry`='41');
UPDATE `locales_area` SET `Entry`='42', `NameLoc1`='다크샤이어', `NameLoc2`='Darkshire', `NameLoc3`='Dunkelhain', `NameLoc4`='夜色镇', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Темнолесье' WHERE (`Entry`='42');
UPDATE `locales_area` SET `Entry`='43', `NameLoc1`='거친 해안', `NameLoc2`='Le Rivage cruel', `NameLoc3`='Die wilden Ufer', `NameLoc4`='蛮荒海岸', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Пустынный берег' WHERE (`Entry`='43');
UPDATE `locales_area` SET `Entry`='44', `NameLoc1`='붉은마루 산맥', `NameLoc2`='Les Carmines (Redridge Mts)', `NameLoc3`='Rotkammgebirge', `NameLoc4`='赤脊山', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Красногорье' WHERE (`Entry`='44');
UPDATE `locales_area` SET `Entry`='45', `NameLoc1`='아라시 고원', `NameLoc2`='Hautes-terres d\'Arathi', `NameLoc3`='Arathihochland', `NameLoc4`='阿拉希高地', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Нагорье Арати' WHERE (`Entry`='45');
UPDATE `locales_area` SET `Entry`='46', `NameLoc1`='불타는 평원', `NameLoc2`='Steppes ardentes', `NameLoc3`='Brennende Steppe', `NameLoc4`='燃烧平原', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Пылающие степи' WHERE (`Entry`='46');
UPDATE `locales_area` SET `Entry`='47', `NameLoc1`='동부 내륙지', `NameLoc2`='Les Hinterlands', `NameLoc3`='Hinterland', `NameLoc4`='辛特兰', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Внутренние земли' WHERE (`Entry`='47');
UPDATE `locales_area` SET `Entry`='49', `NameLoc1`='사자의 구멍', `NameLoc2`='Gouffre du mort', `NameLoc3`='Dead Man\'s Hole', `NameLoc4`='亡者之穴', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Нора Мертвеца' WHERE (`Entry`='49');
UPDATE `locales_area` SET `Entry`='51', `NameLoc1`='이글거리는 협곡', `NameLoc2`='Gorge des Vents brûlants (Searing Gorge)', `NameLoc3`='Sengende Schlucht', `NameLoc4`='灼热峡谷', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Тлеющее ущелье' WHERE (`Entry`='51');
UPDATE `locales_area` SET `Entry`='53', `NameLoc1`='도둑 야영지', `NameLoc2`='Camp des voleurs', `NameLoc3`='Diebeslager', `NameLoc4`='盗贼营地', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Воровской лагерь' WHERE (`Entry`='53');
UPDATE `locales_area` SET `Entry`='54', `NameLoc1`='석영 광산', `NameLoc2`='Mine de Jasperlode', `NameLoc3`='Jaspismine', `NameLoc4`='玉石矿洞', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Яшмовая шахта' WHERE (`Entry`='54');
UPDATE `locales_area` SET `Entry`='55', `NameLoc1`='영웅의 계곡', `NameLoc2`='Valley of Heroes UNUSED', `NameLoc3`='Valley of Heroes UNUSED', `NameLoc4`='英雄谷', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Аллея Героев НЕ ИСПОЛЬЗУЕТСЯ' WHERE (`Entry`='55');
UPDATE `locales_area` SET `Entry`='56', `NameLoc1`='수호영웅의 안식처', `NameLoc2`='Veillée des héros', `NameLoc3`='Heldenwache', `NameLoc4`='英雄哨岗', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Часовые Вечности' WHERE (`Entry`='56');
UPDATE `locales_area` SET `Entry`='57', `NameLoc1`='개미굴 광산', `NameLoc2`='Mine de Fargodeep', `NameLoc3`='Tiefenschachtmine', `NameLoc4`='法戈第矿洞', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Рудник Подземных Глубин' WHERE (`Entry`='57');
UPDATE `locales_area` SET `Entry`='59', `NameLoc1`='노스샤이어 포도밭', `NameLoc2`='Vignes de Northshire', `NameLoc3`='Weinberge von Nordhain', `NameLoc4`='北郡农场', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Виноградники Североземья' WHERE (`Entry`='59');
UPDATE `locales_area` SET `Entry`='60', `NameLoc1`='숲 가장자리', `NameLoc2`='La Lisière', `NameLoc3`='Der Waldrand', `NameLoc4`='林边空地', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Лесная опушка' WHERE (`Entry`='60');
UPDATE `locales_area` SET `Entry`='61', `NameLoc1`='천둥 폭포', `NameLoc2`='Chutes du Tonnerre', `NameLoc3`='Donnerfälle', `NameLoc4`='雷霆瀑布', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Ревущий водопад' WHERE (`Entry`='61');
UPDATE `locales_area` SET `Entry`='62', `NameLoc1`='브랙웰 호박밭', `NameLoc2`='Champ de potirons des Brackwell', `NameLoc3`='Brackwells Kürbisbeet', `NameLoc4`='布莱克威尔南瓜田', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Тыквенное поле Бреквеллов' WHERE (`Entry`='62');
UPDATE `locales_area` SET `Entry`='63', `NameLoc1`='스톤필드 농장', `NameLoc2`='La ferme des Stonefield', `NameLoc3`='Hof der Stonefields', `NameLoc4`='斯通菲尔德农场', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Ферма Стоунфилдов' WHERE (`Entry`='63');
UPDATE `locales_area` SET `Entry`='64', `NameLoc1`='맥클루어 포도밭', `NameLoc2`='Les Vignes des Maclure', `NameLoc3`='Weinberge der Maclures', `NameLoc4`='马科伦农场', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Виноградники Маклура' WHERE (`Entry`='64');
UPDATE `locales_area` SET `Entry`='65', `NameLoc1`='*** 야외 던전 ***', `NameLoc2`='***Donjon sur carte***', `NameLoc3`='***Dungeon auf Karte***', `NameLoc4`='***大型地下城***', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='***Используй меня повторно 3***' WHERE (`Entry`='65');
UPDATE `locales_area` SET `Entry`='66', `NameLoc1`='*** 야외 던전 ***', `NameLoc2`='***Donjon sur carte***', `NameLoc3`='***Dungeon auf Karte***', `NameLoc4`='***大型地下城***', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='***Используй меня повторно 6***' WHERE (`Entry`='66');
UPDATE `locales_area` SET `Entry`='67', `NameLoc1`='*** 야외 던전 ***', `NameLoc2`='***Donjon sur carte***', `NameLoc3`='***Dungeon auf Karte***', `NameLoc4`='***大型地下城***', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='***Используй меня повторно 5***' WHERE (`Entry`='67');
UPDATE `locales_area` SET `Entry`='68', `NameLoc1`='영원의 호수', `NameLoc2`='Lac placide', `NameLoc3`='Der Immerruhsee', `NameLoc4`='止水湖', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Озеро Безмолвия' WHERE (`Entry`='68');
UPDATE `locales_area` SET `Entry`='69', `NameLoc1`='레이크샤이어', `NameLoc2`='Lakeshire', `NameLoc3`='Seenhain', `NameLoc4`='湖畔镇', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Приозерье' WHERE (`Entry`='69');
UPDATE `locales_area` SET `Entry`='70', `NameLoc1`='돌망루 요새', `NameLoc2`='Guet-de-pierre', `NameLoc3`='Steinwacht', `NameLoc4`='石堡', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Крепость Каменной Стражи' WHERE (`Entry`='70');
UPDATE `locales_area` SET `Entry`='71', `NameLoc1`='함락된 돌망루 요새', `NameLoc2`='Chutes de Guet-de-pierre', `NameLoc3`='Steinwachtfälle', `NameLoc4`='石堡瀑布', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Водопад Каменной Стражи' WHERE (`Entry`='71');
UPDATE `locales_area` SET `Entry`='72', `NameLoc1`='어둠의 문', `NameLoc2`='La Porte des ténèbres', `NameLoc3`='Das Dunkle Portal', `NameLoc4`='黑暗之门', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Темный портал' WHERE (`Entry`='72');
UPDATE `locales_area` SET `Entry`='73', `NameLoc1`='타락의 흉터', `NameLoc2`='La Balafre impure', `NameLoc3`='Die faulende Narbe', `NameLoc4`='腐烂之痕', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Гниющий шрам' WHERE (`Entry`='73');
UPDATE `locales_area` SET `Entry`='74', `NameLoc1`='눈물의 연못', `NameLoc2`='Bassin des larmes', `NameLoc3`='Tränenteich', `NameLoc4`='泪水之池', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Озеро Слез' WHERE (`Entry`='74');
UPDATE `locales_area` SET `Entry`='75', `NameLoc1`='스토나드', `NameLoc2`='Stonard', `NameLoc3`='Stonard', `NameLoc4`='斯通纳德', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Каменор' WHERE (`Entry`='75');
UPDATE `locales_area` SET `Entry`='76', `NameLoc1`='드레노어 성역', `NameLoc2`='Sanctuaire des friches', `NameLoc3`='Das Fallow Heiligtum', `NameLoc4`='农田避难所', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Болотное пристанище' WHERE (`Entry`='76');
UPDATE `locales_area` SET `Entry`='77', `NameLoc1`='앤빌마', `NameLoc2`='Anvilmar', `NameLoc3`='Anvilmar', `NameLoc4`='安威玛尔', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Старая Наковальня' WHERE (`Entry`='77');
UPDATE `locales_area` SET `Entry`='80', `NameLoc1`='스톰윈드 산맥', `NameLoc2`='Monts Stormwind', `NameLoc3`='Berge von Stormwind', `NameLoc4`='暴风山脉', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Горы Штормграда' WHERE (`Entry`='80');
UPDATE `locales_area` SET `Entry`='81', `NameLoc1`='제프의 북동 사분면', `NameLoc2`='Quadrant NE de Jeff modifié', `NameLoc3`='Jeff NO-Quadrant geändert', `NameLoc4`='Jeff NE Quadrant', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Джефф СВ Измененный квадрант' WHERE (`Entry`='81');
UPDATE `locales_area` SET `Entry`='82', `NameLoc1`='제프의 북서 사분면', `NameLoc2`='Quadrant de Jeff NO', `NameLoc3`='Jeff NW-Quadrant', `NameLoc4`='Jeff NW Quadrant', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Джефф СЗ Квадрант' WHERE (`Entry`='82');
UPDATE `locales_area` SET `Entry`='83', `NameLoc1`='제프의 남동 사분면', `NameLoc2`='Quadrant de Jeff SE', `NameLoc3`='Jeff SO-Quadrant', `NameLoc4`='Jeff SE Quadrant', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Джефф ЮВ Квадрант' WHERE (`Entry`='83');
UPDATE `locales_area` SET `Entry`='84', `NameLoc1`='제프의 남서 사분면', `NameLoc2`='Quadrant de Jeff SO', `NameLoc3`='Jeff SW-Quadrant', `NameLoc4`='Jeff SW Quadrant', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Джефф ЮЗ Квадрант' WHERE (`Entry`='84');
UPDATE `locales_area` SET `Entry`='85', `NameLoc1`='티리스팔 숲', `NameLoc2`='Clairières de Tirisfal', `NameLoc3`='Tirisfal', `NameLoc4`='提瑞斯法林地', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Тирисфальские леса' WHERE (`Entry`='85');
UPDATE `locales_area` SET `Entry`='86', `NameLoc1`='돌무덤 호수', `NameLoc2`='Lac du Cairn', `NameLoc3`='Der Steinhügelsee', `NameLoc4`='石碑湖', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Озеро Каменных Столбов' WHERE (`Entry`='86');
UPDATE `locales_area` SET `Entry`='87', `NameLoc1`='골드샤이어', `NameLoc2`='Goldshire', `NameLoc3`='Goldhain', `NameLoc4`='闪金镇', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Златоземье' WHERE (`Entry`='87');
UPDATE `locales_area` SET `Entry`='88', `NameLoc1`='동부 벌목지', `NameLoc2`='Camp de bûcherons du Val d\'est', `NameLoc3`='Holzfällerlager des Osttals', `NameLoc4`='东谷伐木场', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Лесопилка Восточной долины' WHERE (`Entry`='88');
UPDATE `locales_area` SET `Entry`='89', `NameLoc1`='거울 호수 과수원', `NameLoc2`='Verger du lac Miroir', `NameLoc3`='Obsthain am Spiegelsee', `NameLoc4`='明镜湖果园', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Сад у Зеркального озера' WHERE (`Entry`='89');
UPDATE `locales_area` SET `Entry`='91', `NameLoc1`='아조라의 탑', `NameLoc2`='Tour d\'Azora', `NameLoc3`='Turm von Azora', `NameLoc4`='阿祖拉之塔', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Башня Азоры' WHERE (`Entry`='91');
UPDATE `locales_area` SET `Entry`='92', `NameLoc1`='거울 호수', `NameLoc2`='Lac Miroir', `NameLoc3`='Spiegelsee', `NameLoc4`='明镜湖', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Зеркальное озеро' WHERE (`Entry`='92');
UPDATE `locales_area` SET `Entry`='93', `NameLoc1`='벌골 오우거 소굴', `NameLoc2`='Tertre des ogres Vul\'Gol', `NameLoc3`='Ogerhort Vul\'Gol', `NameLoc4`='沃古尔食人魔山', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Лощина Вул\'Гол' WHERE (`Entry`='93');
UPDATE `locales_area` SET `Entry`='94', `NameLoc1`='까마귀 언덕', `NameLoc2`='Colline-aux-Corbeaux', `NameLoc3`='Rabenflucht', `NameLoc4`='乌鸦岭', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Вороний Холм' WHERE (`Entry`='94');
UPDATE `locales_area` SET `Entry`='95', `NameLoc1`='붉은마루 협곡', `NameLoc2`='Canyons des Carmines', `NameLoc3`='Rotkammschlucht', `NameLoc4`='赤脊峡谷', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Каньоны Красногорья' WHERE (`Entry`='95');
UPDATE `locales_area` SET `Entry`='96', `NameLoc1`='일갈라의 탑', `NameLoc2`='Tour d\'Ilgalar', `NameLoc3`='Der Turm von Ilgalar', `NameLoc4`='伊尔加拉之塔', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Башня Илгалара' WHERE (`Entry`='96');
UPDATE `locales_area` SET `Entry`='97', `NameLoc1`='앨더의 제재소', `NameLoc2`='Scierie d\'Alther', `NameLoc3`='Althers Mühle', `NameLoc4`='奥瑟尔伐木场', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Лесопилка Альтера' WHERE (`Entry`='97');
UPDATE `locales_area` SET `Entry`='98', `NameLoc1`='레스밴 동굴', `NameLoc2`='Cavernes de Rethban', `NameLoc3`='Rethbanhöhlen', `NameLoc4`='瑞斯班洞穴', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Пещеры Ретбана' WHERE (`Entry`='98');
UPDATE `locales_area` SET `Entry`='99', `NameLoc1`='반란군 야영지', `NameLoc2`='Camp rebelle', `NameLoc3`='Rebellenlager', `NameLoc4`='反抗军营地', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Лагерь Повстанцев' WHERE (`Entry`='99');
UPDATE `locales_area` SET `Entry`='100', `NameLoc1`='네싱워리 원정대', `NameLoc2`='Expédition de Nesingwary', `NameLoc3`='Nesingwarys Expedition', `NameLoc4`='奈辛瓦里远征队营地', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Экспедиция Эрнестуэя' WHERE (`Entry`='100');
UPDATE `locales_area` SET `Entry`='101', `NameLoc1`='쿠르젠 주둔지', `NameLoc2`='Base de Kurzen', `NameLoc3`='Kurzens Truppenlager', `NameLoc4`='库尔森的营地', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Лагерь Курцена' WHERE (`Entry`='101');
UPDATE `locales_area` SET `Entry`='102', `NameLoc1`='줄쿤다의 폐허', `NameLoc2`='Ruines de Zul\'Kunda', `NameLoc3`='Ruinen von Zul\'Kunda', `NameLoc4`='祖昆达废墟', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Руины Зул\'Кунды' WHERE (`Entry`='102');
UPDATE `locales_area` SET `Entry`='103', `NameLoc1`='줄맘웨의 폐허', `NameLoc2`='Ruines de Zul\'Mamwe', `NameLoc3`='Ruinen von Zul\'Mamwe', `NameLoc4`='祖玛维废墟', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Руины Зул\'Мамве' WHERE (`Entry`='103');
UPDATE `locales_area` SET `Entry`='104', `NameLoc1`='썩은내 산호초', `NameLoc2`='Le Récif infâme', `NameLoc3`='Das finstere Riff', `NameLoc4`='暗礁海', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Коварный риф' WHERE (`Entry`='104');
UPDATE `locales_area` SET `Entry`='105', `NameLoc1`='모쉬오그 오우거 소굴', `NameLoc2`='Tertre des ogres Mosh\'Ogg', `NameLoc3`='Ogerhügel der Mosh\'Ogg', `NameLoc4`='莫什奥格食人魔山', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Холм Мош\'Огг' WHERE (`Entry`='105');
UPDATE `locales_area` SET `Entry`='106', `NameLoc1`='보급창', `NameLoc2`='La réserve', `NameLoc3`='Das Vorratslager', `NameLoc4`='储藏室', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Схрон' WHERE (`Entry`='106');
UPDATE `locales_area` SET `Entry`='107', `NameLoc1`='살딘 농장', `NameLoc2`='Ferme des Saldean', `NameLoc3`='Saldeans Farm', `NameLoc4`='萨丁农场', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Ферма Сальдена' WHERE (`Entry`='107');
UPDATE `locales_area` SET `Entry`='108', `NameLoc1`='감시의 언덕', `NameLoc2`='Colline des sentinelles', `NameLoc3`='Späherkuppe', `NameLoc4`='哨兵岭', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Сторожевой холм' WHERE (`Entry`='108');
UPDATE `locales_area` SET `Entry`='109', `NameLoc1`='펄브로우 호박밭', `NameLoc2`='Ferme de potirons de Furlbrow', `NameLoc3`='Furlbrows Kürbishof', `NameLoc4`='法布隆南瓜农场', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Тыквенная ферма Хмуроброва' WHERE (`Entry`='109');
UPDATE `locales_area` SET `Entry`='111', `NameLoc1`='장고로드 광산', `NameLoc2`='Mine de Jangolode', `NameLoc3`='Der Jangoschacht', `NameLoc4`='詹戈洛德矿洞', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Рудник Янго' WHERE (`Entry`='111');
UPDATE `locales_area` SET `Entry`='113', `NameLoc1`='황금해안 채석장', `NameLoc2`='Carrière de la côte de l\'Or', `NameLoc3`='Der Goldküstensteinbruch', `NameLoc4`='金海岸矿洞', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Прииск на Золотом Берегу' WHERE (`Entry`='113');
UPDATE `locales_area` SET `Entry`='115', `NameLoc1`='서부 몰락지대 등대', `NameLoc2`='Phare de l\'Ouest', `NameLoc3`='Der Leuchtturm von Westfall', `NameLoc4`='西部荒野灯塔', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Маяк в Западном Крае' WHERE (`Entry`='115');
UPDATE `locales_area` SET `Entry`='116', `NameLoc1`='안개 골짜기', `NameLoc2`='Vallée des brumes', `NameLoc3`='Das neblige Tal', `NameLoc4`='迷雾谷', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Туманная долина' WHERE (`Entry`='116');
UPDATE `locales_area` SET `Entry`='117', `NameLoc1`='그롬골 주둔지', `NameLoc2`='Campement Grom\'gol', `NameLoc3`='Das Basislager von Grom\'gol', `NameLoc4`='格罗姆高营地', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Лагерь Гром\'гол' WHERE (`Entry`='117');
UPDATE `locales_area` SET `Entry`='118', `NameLoc1`='웰가르의 발굴현장', `NameLoc2`='Excavations de Whelgar', `NameLoc3`='Whelgars Ausgrabungsstätte', `NameLoc4`='维尔加挖掘场', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Раскопки Вельгара' WHERE (`Entry`='118');
UPDATE `locales_area` SET `Entry`='120', `NameLoc1`='서부 주둔지', `NameLoc2`='Garnison du ruisseau de l\'ouest', `NameLoc3`='Weststromgarnison', `NameLoc4`='西泉要塞', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Гарнизон у Западного ручья' WHERE (`Entry`='120');
UPDATE `locales_area` SET `Entry`='121', `NameLoc1`='고요의 정원 묘지', `NameLoc2`='Cimetière des jardins paisibles', `NameLoc3`='Der Friedhof \"Stille Gärten\"', `NameLoc4`='静谧花园墓场', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Безмятежное кладбище' WHERE (`Entry`='121');
UPDATE `locales_area` SET `Entry`='122', `NameLoc1`='줄다이아 폐허', `NameLoc2`='Ruines de Zuuldaia', `NameLoc3`='Ruinen von Zuuldaia', `NameLoc4`='祖丹亚废墟', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Руины Зуулдая' WHERE (`Entry`='122');
UPDATE `locales_area` SET `Entry`='123', `NameLoc1`='발랄 폐허', `NameLoc2`='Ruines de Bal\'lal', `NameLoc3`='Ruinen von Bal\'lal', `NameLoc4`='巴拉尔废墟', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Руины Бал\'лал' WHERE (`Entry`='123');
UPDATE `locales_area` SET `Entry`='125', `NameLoc1`='칼아이 폐허', `NameLoc2`='Ruines de Kal\'ai', `NameLoc3`='Ruinen von Kal\'ai', `NameLoc4`='卡莱废墟', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Руины Кал\'аи' WHERE (`Entry`='125');
UPDATE `locales_area` SET `Entry`='126', `NameLoc1`='트카시 폐허', `NameLoc2`='Ruines de Tkashi', `NameLoc3`='Ruinen von Tkashi', `NameLoc4`='伽什废墟', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Руины Ткаши' WHERE (`Entry`='126');
UPDATE `locales_area` SET `Entry`='127', `NameLoc1`='발리아마 폐허', `NameLoc2`='Ruines de Balia\'mah', `NameLoc3`='Ruinen von Balia\'mah', `NameLoc4`='巴里亚曼废墟', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Руины Балиа\'ма' WHERE (`Entry`='127');
UPDATE `locales_area` SET `Entry`='128', `NameLoc1`='지아타자이 폐허', `NameLoc2`='Ruines de Ziata\'jai', `NameLoc3`='Ruinen von Ziata\'jai', `NameLoc4`='赞塔加废墟', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Руины Зиата\'джаи' WHERE (`Entry`='128');
UPDATE `locales_area` SET `Entry`='129', `NameLoc1`='미즈자 폐허', `NameLoc2`='Ruines de Mizjah', `NameLoc3`='Ruinen von Mizjah', `NameLoc4`='米扎废墟', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Руины Мизжа' WHERE (`Entry`='129');
UPDATE `locales_area` SET `Entry`='130', `NameLoc1`='은빛소나무 숲', `NameLoc2`='Forêt des Pins argentés (Silverpine Forest)', `NameLoc3`='Silberwald', `NameLoc4`='银松森林', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Серебряный бор' WHERE (`Entry`='130');
UPDATE `locales_area` SET `Entry`='131', `NameLoc1`='카라노스', `NameLoc2`='Kharanos', `NameLoc3`='Kharanos', `NameLoc4`='卡拉诺斯', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Каранос' WHERE (`Entry`='131');
UPDATE `locales_area` SET `Entry`='132', `NameLoc1`='눈마루 골짜기', `NameLoc2`='Vallée des Frigères', `NameLoc3`='Das Coldridgetal', `NameLoc4`='寒脊山谷', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Холодная долина' WHERE (`Entry`='132');
UPDATE `locales_area` SET `Entry`='133', `NameLoc1`='놈리건', `NameLoc2`='Gnomeregan', `NameLoc3`='Gnomeregan', `NameLoc4`='诺莫瑞根', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Гномреган' WHERE (`Entry`='133');
UPDATE `locales_area` SET `Entry`='134', `NameLoc1`='골볼라 채석장', `NameLoc2`='Carrière de Gol\'Bolar', `NameLoc3`='Der Gol\'bolar Steinbruch', `NameLoc4`='古博拉采掘场', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Карьер Гол\'Болар' WHERE (`Entry`='134');
UPDATE `locales_area` SET `Entry`='135', `NameLoc1`='서리갈기 소굴', `NameLoc2`='Repaire des Frostmane', `NameLoc3`='Höhle der Frostmane', `NameLoc4`='霜鬃巨魔要塞', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Форт Мерзлогривов' WHERE (`Entry`='135');
UPDATE `locales_area` SET `Entry`='136', `NameLoc1`='은빛 동굴', `NameLoc2`='L\'antre Gris', `NameLoc3`='Der Graufelsbau', `NameLoc4`='灰色洞穴', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Серая берлога' WHERE (`Entry`='136');
UPDATE `locales_area` SET `Entry`='137', `NameLoc1`='브루날 마을', `NameLoc2`='Brassetout', `NameLoc3`='Brewnall', `NameLoc4`='烈酒村', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Поселок Пивоваров' WHERE (`Entry`='137');
UPDATE `locales_area` SET `Entry`='138', `NameLoc1`='안개소나무 은거처', `NameLoc2`='Refuge de Brumepins', `NameLoc3`='Nebelfichtenzuflucht', `NameLoc4`='雾松避难所', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Сторожка у заснеженной сосны' WHERE (`Entry`='138');
UPDATE `locales_area` SET `Entry`='139', `NameLoc1`='동부 역병지대', `NameLoc2`='Maleterres de l\'est (Eastern Plaguelands)', `NameLoc3`='Östliche Pestländer', `NameLoc4`='东瘟疫之地', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Восточные Чумные земли' WHERE (`Entry`='139');
UPDATE `locales_area` SET `Entry`='141', `NameLoc1`='텔드랏실', `NameLoc2`='Teldrassil', `NameLoc3`='Teldrassil', `NameLoc4`='泰达希尔', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Тельдрассил' WHERE (`Entry`='141');
UPDATE `locales_area` SET `Entry`='142', `NameLoc1`='아이언밴드의 발굴현장', `NameLoc2`='Excavations d\'Ironband', `NameLoc3`='Ironbands Ausgrabungsstätte', `NameLoc4`='铁环挖掘场', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Раскопки Сталекрута' WHERE (`Entry`='142');
UPDATE `locales_area` SET `Entry`='143', `NameLoc1`='모그로쉬 소굴', `NameLoc2`='Bastion des Mo\'grosh', `NameLoc3`='Festung Mo\'grosh', `NameLoc4`='莫格罗什要塞', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Оплот Мо\'грош' WHERE (`Entry`='143');
UPDATE `locales_area` SET `Entry`='144', `NameLoc1`='텔사마', `NameLoc2`='Thelsamar', `NameLoc3`='Thelsamar', `NameLoc4`='塞尔萨玛', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Телcамар' WHERE (`Entry`='144');
UPDATE `locales_area` SET `Entry`='145', `NameLoc1`='알가즈 관문', `NameLoc2`='Porte d\'Algaz', `NameLoc3`='Algaz-Tor', `NameLoc4`='奥加兹大门', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Врата Альгаза' WHERE (`Entry`='145');
UPDATE `locales_area` SET `Entry`='146', `NameLoc1`='돌다지 댐', `NameLoc2`='Barrage de Formepierre', `NameLoc3`='Der Stonewroughtdamm', `NameLoc4`='巨石水坝', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Каменная Плотина' WHERE (`Entry`='146');
UPDATE `locales_area` SET `Entry`='147', `NameLoc1`='순찰자의 오두막', `NameLoc2`='Le pavillon des Pérégrins', `NameLoc3`='Die Weitschreiter-Lodge', `NameLoc4`='旅行者营地', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Приют Странников' WHERE (`Entry`='147');
UPDATE `locales_area` SET `Entry`='148', `NameLoc1`='어둠의 해안', `NameLoc2`='Sombrivage (Darkshore)', `NameLoc3`='Dunkelküste', `NameLoc4`='黑海岸', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Темные берега' WHERE (`Entry`='148');
UPDATE `locales_area` SET `Entry`='149', `NameLoc1`='은여울 광산', `NameLoc2`='Mine du Ru d\'argent', `NameLoc3`='Silberbachmine', `NameLoc4`='银泉矿洞', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Рудник у Серебряного ручейка' WHERE (`Entry`='149');
UPDATE `locales_area` SET `Entry`='150', `NameLoc1`='메네실 항구', `NameLoc2`='Port de Menethil', `NameLoc3`='Der Hafen von Menethil', `NameLoc4`='米奈希尔港', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Гавань Менетилов' WHERE (`Entry`='150');
UPDATE `locales_area` SET `Entry`='151', `NameLoc1`='디자이너의 섬', `NameLoc2`='Ile des concepteurs', `NameLoc3`='Designer-Insel', `NameLoc4`='Designer Island', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Остров Дизайнера' WHERE (`Entry`='151');
UPDATE `locales_area` SET `Entry`='152', `NameLoc1`='보루', `NameLoc2`='La Barricade', `NameLoc3`='Das Bollwerk', `NameLoc4`='亡灵壁垒', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Бастион' WHERE (`Entry`='152');
UPDATE `locales_area` SET `Entry`='153', `NameLoc1`='로데론의 폐허', `NameLoc2`='Ruines de Lordaeron', `NameLoc3`='Ruinen von Lordaeron', `NameLoc4`='洛丹伦废墟', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Руины Лордерона' WHERE (`Entry`='153');
UPDATE `locales_area` SET `Entry`='154', `NameLoc1`='데스넬', `NameLoc2`='Le Glas', `NameLoc3`='Deathknell', `NameLoc4`='丧钟镇', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Могильник' WHERE (`Entry`='154');
UPDATE `locales_area` SET `Entry`='155', `NameLoc1`='검은그물 거미굴', `NameLoc2`='Grottes des Tisse-nuit', `NameLoc3`='Nachtwebergrund', `NameLoc4`='夜行蜘蛛洞穴', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Паучья низина' WHERE (`Entry`='155');
UPDATE `locales_area` SET `Entry`='156', `NameLoc1`='솔리덴 농장', `NameLoc2`='Ferme des Solliden', `NameLoc3`='Sollidens Bauernhof', `NameLoc4`='索利丹农场', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Усадьба Соллиден' WHERE (`Entry`='156');
UPDATE `locales_area` SET `Entry`='157', `NameLoc1`='아가만드 밀농장', `NameLoc2`='Moulins d\'Agamand', `NameLoc3`='Agamands Mühlen', `NameLoc4`='阿加曼德磨坊', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Мельницы Агамондов' WHERE (`Entry`='157');
UPDATE `locales_area` SET `Entry`='158', `NameLoc1`='아가만드가 납골당', `NameLoc2`='Crypte de la famille Agamand', `NameLoc3`='Gruft der Familie Agamand', `NameLoc4`='阿加曼德家族墓穴', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Семейная усыпальница Агамондов' WHERE (`Entry`='158');
UPDATE `locales_area` SET `Entry`='159', `NameLoc1`='브릴', `NameLoc2`='Brill', `NameLoc3`='Brill', `NameLoc4`='布瑞尔', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Брилл' WHERE (`Entry`='159');
UPDATE `locales_area` SET `Entry`='160', `NameLoc1`='속삭임의 정원', `NameLoc2`='Jardins des murmures', `NameLoc3`='Flüstergärten', `NameLoc4`='耳语花园', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Шепчущие сады' WHERE (`Entry`='160');
UPDATE `locales_area` SET `Entry`='161', `NameLoc1`='평온의 정원', `NameLoc2`='Terrasse de la quiétude', `NameLoc3`='Terrasse der Erholung', `NameLoc4`='休息区', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Терраса Покоя' WHERE (`Entry`='161');
UPDATE `locales_area` SET `Entry`='162', `NameLoc1`='청명 호수', `NameLoc2`='Lac Etincelant', `NameLoc3`='Blendwassersee', `NameLoc4`='澈水湖', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Озеро Ясноводное' WHERE (`Entry`='162');
UPDATE `locales_area` SET `Entry`='163', `NameLoc1`='군터의 은거지', `NameLoc2`='Retraite de Gunther', `NameLoc3`='Gunthers Zufluchtsort', `NameLoc4`='冈瑟尔的居所', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Приют Гюнтера' WHERE (`Entry`='163');
UPDATE `locales_area` SET `Entry`='164', `NameLoc1`='가렌의 흉가', `NameLoc2`='Antre de Garren', `NameLoc3`='Garrens Schlupfwinkel', `NameLoc4`='加伦鬼屋', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Ферма Гаррена' WHERE (`Entry`='164');
UPDATE `locales_area` SET `Entry`='165', `NameLoc1`='발니르 농장', `NameLoc2`='Ferme des Balnir', `NameLoc3`='Balnirs Bauernhof', `NameLoc4`='巴尼尔农场', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Усадьба Балнира' WHERE (`Entry`='165');
UPDATE `locales_area` SET `Entry`='166', `NameLoc1`='버려진 장원', `NameLoc2`='Manoir du Foyer froid', `NameLoc3`='Coldhearth-Anwesen', `NameLoc4`='炉灰庄园', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Поместье \"Остывший Очаг\"' WHERE (`Entry`='166');
UPDATE `locales_area` SET `Entry`='167', `NameLoc1`='붉은십자군 전초기지', `NameLoc2`='Avant-poste des Croisés', `NameLoc3`='Außenposten der Kreuzzügler', `NameLoc4`='十字军前哨', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Застава Алого Ордена' WHERE (`Entry`='167');
UPDATE `locales_area` SET `Entry`='168', `NameLoc1`='북부 해안', `NameLoc2`='La Côte nord', `NameLoc3`='Die Nordküste', `NameLoc4`='北部海岸', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Северное побережье' WHERE (`Entry`='168');
UPDATE `locales_area` SET `Entry`='169', `NameLoc1`='속삭임의 해안', `NameLoc2`='Rivage des murmures', `NameLoc3`='Die stille Küste', `NameLoc4`='耳语海岸', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Шепчущий берег' WHERE (`Entry`='169');
UPDATE `locales_area` SET `Entry`='170', `NameLoc1`='로다미어 호수', `NameLoc2`='Lac Lordamere', `NameLoc3`='Der Lordameresee', `NameLoc4`='洛丹米尔湖', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Озеро Лордамер' WHERE (`Entry`='170');
UPDATE `locales_area` SET `Entry`='172', `NameLoc1`='펜리스 섬', `NameLoc2`='Ile de Fenris', `NameLoc3`='Insel Fenris', `NameLoc4`='芬里斯岛', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Остров Фенриса' WHERE (`Entry`='172');
UPDATE `locales_area` SET `Entry`='173', `NameLoc1`='파올의 안식처', `NameLoc2`='Repos de Faol', `NameLoc3`='Faols Ruheplatz', `NameLoc4`='法奥之墓', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Могила Фаола' WHERE (`Entry`='173');
UPDATE `locales_area` SET `Entry`='186', `NameLoc1`='돌라나르', `NameLoc2`='Dolanaar', `NameLoc3`='Dolanaar', `NameLoc4`='多兰纳尔', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Доланаар' WHERE (`Entry`='186');
UPDATE `locales_area` SET `Entry`='187', `NameLoc1`='다르나서스', `NameLoc2`='Darnassus UNUSED', `NameLoc3`='Darnassus UNUSED', `NameLoc4`='Darnassus UNUSED', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Дарнас НЕ ИСПОЛЬЗУЕТСЯ' WHERE (`Entry`='187');
UPDATE `locales_area` SET `Entry`='188', `NameLoc1`='그늘 협곡', `NameLoc2`='Sombrevallon', `NameLoc3`='Shadowglen', `NameLoc4`='幽影谷', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Тенистая долина' WHERE (`Entry`='188');
UPDATE `locales_area` SET `Entry`='189', `NameLoc1`='스틸그릴의 정비소', `NameLoc2`='Dépôt de Steelgrill', `NameLoc3`='Steelgrills Depot', `NameLoc4`='钢架补给站', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Поселок Сталежара' WHERE (`Entry`='189');
UPDATE `locales_area` SET `Entry`='190', `NameLoc1`='하스글렌', `NameLoc2`='Hearthglen', `NameLoc3`='Hearthglen', `NameLoc4`='壁炉谷', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Дольный Очаг' WHERE (`Entry`='190');
UPDATE `locales_area` SET `Entry`='192', `NameLoc1`='북마루 벌목지', `NameLoc2`='Camp de bûcherons de la Crête du nord', `NameLoc3`='Holzlager Northridge', `NameLoc4`='北山伐木场', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Лесопилка Северного Кряжа' WHERE (`Entry`='192');
UPDATE `locales_area` SET `Entry`='193', `NameLoc1`='안돌할 폐허', `NameLoc2`='Ruines d\'Andorhal', `NameLoc3`='Die Ruinen von Andorhal', `NameLoc4`='安多哈尔废墟', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Руины Андорала' WHERE (`Entry`='193');
UPDATE `locales_area` SET `Entry`='195', `NameLoc1`='강령술 학교', `NameLoc2`='Ecole de nécromancie', `NameLoc3`='Schule der Totenbeschwörung', `NameLoc4`='通灵术学校', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Школа некромантии' WHERE (`Entry`='195');
UPDATE `locales_area` SET `Entry`='196', `NameLoc1`='우서 경의 무덤', `NameLoc2`='Tombeau d\'Uther', `NameLoc3`='Uthers Grabmal', `NameLoc4`='乌瑟尔之墓', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Гробница Утера' WHERE (`Entry`='196');
UPDATE `locales_area` SET `Entry`='197', `NameLoc1`='슬픔의 언덕', `NameLoc2`='Colline des chagrins', `NameLoc3`='Trauerhügel', `NameLoc4`='悔恨岭', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Холм Печали' WHERE (`Entry`='197');
UPDATE `locales_area` SET `Entry`='198', `NameLoc1`='진흙탕 동굴', `NameLoc2`='La grotte des Pleurs', `NameLoc3`='Die weinende Höhle', `NameLoc4`='哭泣之洞', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Грот Слез' WHERE (`Entry`='198');
UPDATE `locales_area` SET `Entry`='199', `NameLoc1`='펠스톤 농장', `NameLoc2`='Champ de Felstone', `NameLoc3`='Teufelssteinfeld', `NameLoc4`='费尔斯通农场', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Поле Джанис' WHERE (`Entry`='199');
UPDATE `locales_area` SET `Entry`='200', `NameLoc1`='달슨의 눈물', `NameLoc2`='Larmes de Dalson', `NameLoc3`='Dalsons Tränenfeld', `NameLoc4`='达尔松之泪', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Слезы Далсона' WHERE (`Entry`='200');
UPDATE `locales_area` SET `Entry`='201', `NameLoc1`='가론의 흉가', `NameLoc2`='La Flétrissure de Gahrron', `NameLoc3`='Gahrrons Trauerfeld', `NameLoc4`='盖罗恩农场', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Пустошь Гаррона' WHERE (`Entry`='201');
UPDATE `locales_area` SET `Entry`='202', `NameLoc1`='고통의 흉가', `NameLoc2`='Le Repaire putride', `NameLoc3`='Das trostlose Feld', `NameLoc4`='嚎哭鬼屋', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Удел Страданий' WHERE (`Entry`='202');
UPDATE `locales_area` SET `Entry`='203', `NameLoc1`='마르덴홀드 요새', `NameLoc2`='Donjon de Mardenholde', `NameLoc3`='Burg Mardenholde', `NameLoc4`='玛登霍尔德城堡', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Крепость Марденхольд' WHERE (`Entry`='203');
UPDATE `locales_area` SET `Entry`='204', `NameLoc1`='장작나무 마을', `NameLoc2`='Bois-du-Bûcher', `NameLoc3`='Pyrewood', `NameLoc4`='焚木村', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Деревня Погребальных Костров' WHERE (`Entry`='204');
UPDATE `locales_area` SET `Entry`='205', `NameLoc1`='던 모드르', `NameLoc2`='Dun Modr', `NameLoc3`='Dun Modr', `NameLoc4`='丹莫德', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Дун Модр' WHERE (`Entry`='205');
UPDATE `locales_area` SET `Entry`='206', `NameLoc1`='서부 몰락지대', `NameLoc2`='Marche de l\'Ouest (Westfall)', `NameLoc3`='Westfall', `NameLoc4`='西部荒野', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Западный Край' WHERE (`Entry`='206');
UPDATE `locales_area` SET `Entry`='207', `NameLoc1`='대해', `NameLoc2`='La Grande mer', `NameLoc3`='Das große Meer', `NameLoc4`='无尽之海', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Великое море' WHERE (`Entry`='207');
UPDATE `locales_area` SET `Entry`='208', `NameLoc1`='철갑 동굴', `NameLoc2`='Unused Ironcladcove', `NameLoc3`='Ungenutzt - Ironcladbucht', `NameLoc4`='铁甲山谷', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Не используется Потайная бухта' WHERE (`Entry`='208');
UPDATE `locales_area` SET `Entry`='209', `NameLoc1`='그림자송곳니 성채', `NameLoc2`='Donjon d\'Ombrecroc', `NameLoc3`='Burg Shadowfang', `NameLoc4`='影牙城堡', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Крепость Темного Клыка' WHERE (`Entry`='209');
UPDATE `locales_area` SET `Entry`='210', `NameLoc1`='*** 야외 던전 ***', `NameLoc2`='***Donjon sur carte***', `NameLoc3`='***Dungeon auf Karte***', `NameLoc4`='***大型地下城***', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='***Используй меня повторно 2***' WHERE (`Entry`='210');
UPDATE `locales_area` SET `Entry`='211', `NameLoc1`='얼음 호수', `NameLoc2`='Lac glacial', `NameLoc3`='Iceflowsee', `NameLoc4`='涌冰湖', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Заледеневшее озеро' WHERE (`Entry`='211');
UPDATE `locales_area` SET `Entry`='212', `NameLoc1`='투구바닥 호수', `NameLoc2`='Lac du Lit d\'Helm', `NameLoc3`='Helmsbedsee', `NameLoc4`='盔枕湖', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Озеро Хельмово Ложе' WHERE (`Entry`='212');
UPDATE `locales_area` SET `Entry`='213', `NameLoc1`='심원 광산', `NameLoc2`='Mine du gouffre d\'Elem', `NameLoc3`='Tiefenfelsmine', `NameLoc4`='埃利姆矿洞', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Серебряный рудник' WHERE (`Entry`='213');
UPDATE `locales_area` SET `Entry`='214', `NameLoc1`='대해', `NameLoc2`='La Grande mer', `NameLoc3`='Das große Meer', `NameLoc4`='无尽之海', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Великое море' WHERE (`Entry`='214');
UPDATE `locales_area` SET `Entry`='215', `NameLoc1`='멀고어', `NameLoc2`='Mulgore', `NameLoc3`='Mulgore', `NameLoc4`='莫高雷', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Мулгор' WHERE (`Entry`='215');
UPDATE `locales_area` SET `Entry`='219', `NameLoc1`='알렉스턴 농장', `NameLoc2`='Ferme des Alexston', `NameLoc3`='Alexstons Bauernhof', `NameLoc4`='阿历克斯顿农场', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Поместье Алекстона' WHERE (`Entry`='219');
UPDATE `locales_area` SET `Entry`='220', `NameLoc1`='붉은구름 고원', `NameLoc2`='Mesa de Nuage rouge', `NameLoc3`='Red Cloud Mesa', `NameLoc4`='红云台地', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Плато Красного Облака' WHERE (`Entry`='220');
UPDATE `locales_area` SET `Entry`='221', `NameLoc1`='나라체 야영지', `NameLoc2`='Camp Narache', `NameLoc3`='Camp Narache', `NameLoc4`='纳拉其营地', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Лагерь Нараче' WHERE (`Entry`='221');
UPDATE `locales_area` SET `Entry`='222', `NameLoc1`='블러드후프 마을', `NameLoc2`='Village Bloodhoof', `NameLoc3`='Bloodhoof', `NameLoc4`='血蹄村', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Деревня Кровавого Копыта' WHERE (`Entry`='222');
UPDATE `locales_area` SET `Entry`='223', `NameLoc1`='황소바위 호수', `NameLoc2`='Lac Taureau-de-pierre', `NameLoc3`='Stonebullsee', `NameLoc4`='石牛湖', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Озеро Каменного Быка' WHERE (`Entry`='223');
UPDATE `locales_area` SET `Entry`='224', `NameLoc1`='습격당한 짐마차 행렬', `NameLoc2`='Caravane dévastée', `NameLoc3`='Überfallene Karawane', `NameLoc4`='被破坏的货车', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Разграбленный караван' WHERE (`Entry`='224');
UPDATE `locales_area` SET `Entry`='225', `NameLoc1`='붉은 바위 언덕', `NameLoc2`='Rochers rouges', `NameLoc3`='Teufelsfelsen', `NameLoc4`='赤色石', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Красные скалы' WHERE (`Entry`='225');
UPDATE `locales_area` SET `Entry`='226', `NameLoc1`='암흑 땅거미굴', `NameLoc2`='Le Grouillement', `NameLoc3`='Das Huschdunkel', `NameLoc4`='粘丝洞', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Струящаяся Тьма' WHERE (`Entry`='226');
UPDATE `locales_area` SET `Entry`='227', `NameLoc1`='발간 농장', `NameLoc2`='Champ de Valgan', `NameLoc3`='Valgans Feld', `NameLoc4`='瓦尔甘牧场', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Поле Валгана' WHERE (`Entry`='227');
UPDATE `locales_area` SET `Entry`='228', `NameLoc1`='공동묘지', `NameLoc2`='Le Sépulcre', `NameLoc3`='Das Grabmal', `NameLoc4`='瑟伯切尔', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Гробница' WHERE (`Entry`='228');
UPDATE `locales_area` SET `Entry`='229', `NameLoc1`='올슨 농장', `NameLoc2`='Ferme des Olsen', `NameLoc3`='Olsen\'s Farthing', `NameLoc4`='奥森农场', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Удел Ольсена' WHERE (`Entry`='229');
UPDATE `locales_area` SET `Entry`='230', `NameLoc1`='그레이메인 성벽', `NameLoc2`='Le mur de Greymane', `NameLoc3`='Der Graumarnwall', `NameLoc4`='格雷迈恩之墙', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Стена Седогрива' WHERE (`Entry`='230');
UPDATE `locales_area` SET `Entry`='231', `NameLoc1`='베렌의 동굴', `NameLoc2`='Péril de Beren', `NameLoc3`='Beren\'s Peril', `NameLoc4`='博伦的巢穴', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Погибель Берена' WHERE (`Entry`='231');
UPDATE `locales_area` SET `Entry`='232', `NameLoc1`='여명의 섬', `NameLoc2`='Les îles de l\'aube', `NameLoc3`='Die Morgeninseln', `NameLoc4`='黎明岛', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Рассветные острова' WHERE (`Entry`='232');
UPDATE `locales_area` SET `Entry`='233', `NameLoc1`='앰버밀', `NameLoc2`='Moulin-de-l\'Ambre', `NameLoc3`='Ambermill', `NameLoc4`='安伯米尔', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Янтарная мельница' WHERE (`Entry`='233');
UPDATE `locales_area` SET `Entry`='235', `NameLoc1`='펜리스 요새', `NameLoc2`='Donjon de Fenris', `NameLoc3`='Burg Fenris', `NameLoc4`='芬里斯城堡', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Крепость Фенриса' WHERE (`Entry`='235');
UPDATE `locales_area` SET `Entry`='236', `NameLoc1`='그림자송곳니 성채', `NameLoc2`='Donjon d\'Ombrecroc', `NameLoc3`='Burg Shadowfang', `NameLoc4`='影牙城堡', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Крепость Темного Клыка' WHERE (`Entry`='236');
UPDATE `locales_area` SET `Entry`='237', `NameLoc1`='오래된 나루터', `NameLoc2`='Le bac délabré', `NameLoc3`='Die verfallene Fähre', `NameLoc4`='破旧渡口', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Старая переправа' WHERE (`Entry`='237');
UPDATE `locales_area` SET `Entry`='238', `NameLoc1`='말덴의 과수원', `NameLoc2`='Verger de Malden', `NameLoc3`='Maldens Obsthain', `NameLoc4`='玛尔丁果园', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Сад Мальдена' WHERE (`Entry`='238');
UPDATE `locales_area` SET `Entry`='239', `NameLoc1`='이바르 호박밭', `NameLoc2`='Le lopin d\'Ivar', `NameLoc3`='Das Ivar-Feld', `NameLoc4`='伊瓦农场', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Делянка Ивара' WHERE (`Entry`='239');
UPDATE `locales_area` SET `Entry`='240', `NameLoc1`='죽음의 농장', `NameLoc2`='Le Champ des morts', `NameLoc3`='Das Todesfeld', `NameLoc4`='亡者农场', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Мертвое поле' WHERE (`Entry`='240');
UPDATE `locales_area` SET `Entry`='241', `NameLoc1`='오염된 과수원', `NameLoc2`='Le verger pourrissant', `NameLoc3`='Der verlassene Obstgarten', `NameLoc4`='烂果园', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Гниющий сад' WHERE (`Entry`='241');
UPDATE `locales_area` SET `Entry`='242', `NameLoc1`='밝은숲', `NameLoc2`='Bosquet de Clairbois', `NameLoc3`='Schattenhain', `NameLoc4`='阳光树林', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Светлая роща' WHERE (`Entry`='242');
UPDATE `locales_area` SET `Entry`='243', `NameLoc1`='버려진 흉가', `NameLoc2`='La masure lugubre', `NameLoc3`='Das verlassene Gut', `NameLoc4`='荒弃鬼屋', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Покинутая усадьба' WHERE (`Entry`='243');
UPDATE `locales_area` SET `Entry`='244', `NameLoc1`='휘플가 저택', `NameLoc2`='Le domaine de Whipple', `NameLoc3`='Der Whipple-Besitz', `NameLoc4`='维普尔庄园', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Имение Уиппл' WHERE (`Entry`='244');
UPDATE `locales_area` SET `Entry`='245', `NameLoc1`='요르겐 농장', `NameLoc2`='La ferme des Yorgen', `NameLoc3`='Yorgens Bauernhof', `NameLoc4`='约根农场', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Усадьба Йоргена' WHERE (`Entry`='245');
UPDATE `locales_area` SET `Entry`='246', `NameLoc1`='용광로', `NameLoc2`='Le Chaudron', `NameLoc3`='Der Kessel', `NameLoc4`='大熔炉', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Котлован' WHERE (`Entry`='246');
UPDATE `locales_area` SET `Entry`='247', `NameLoc1`='검댕가루 발굴현장', `NameLoc2`='Site de fouilles de Grimesilt', `NameLoc3`='Grimesilt-Grabungsstätte', `NameLoc4`='煤渣挖掘场', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Карьер Грязнули' WHERE (`Entry`='247');
UPDATE `locales_area` SET `Entry`='249', `NameLoc1`='우레망치 바위굴', `NameLoc2`='Rocher des Cognepeurs', `NameLoc3`='Schreckensfels', `NameLoc4`='巨槌石', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Скала Молота Ужаса' WHERE (`Entry`='249');
UPDATE `locales_area` SET `Entry`='250', `NameLoc1`='타우릿산의 폐허', `NameLoc2`='Ruines de Thaurissan', `NameLoc3`='Die Ruinen von Thaurissan', `NameLoc4`='索瑞森废墟', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Руины Тауриссана' WHERE (`Entry`='250');
UPDATE `locales_area` SET `Entry`='251', `NameLoc1`='화염 마루', `NameLoc2`='Corniche des flammes', `NameLoc3`='Flammenkamm', `NameLoc4`='烈焰峰', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Пламенеющий Стяг' WHERE (`Entry`='251');
UPDATE `locales_area` SET `Entry`='252', `NameLoc1`='검은바위 요새', `NameLoc2`='Bastion des Blackrock', `NameLoc3`='Festung der Blackrock', `NameLoc4`='黑石要塞', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Крепость Черной горы' WHERE (`Entry`='252');
UPDATE `locales_area` SET `Entry`='253', `NameLoc1`='잿빛 기둥', `NameLoc2`='Le Pilier de cendres', `NameLoc3`='Die Aschensäule', `NameLoc4`='灰烬之柱', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Башня Пепла' WHERE (`Entry`='253');
UPDATE `locales_area` SET `Entry`='254', `NameLoc1`='검은바위 산', `NameLoc2`='Mont Blackrock', `NameLoc3`='Der Blackrock', `NameLoc4`='黑石山', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Черная гора' WHERE (`Entry`='254');
UPDATE `locales_area` SET `Entry`='255', `NameLoc1`='폭풍의 제단', `NameLoc2`='Autel des tempêtes', `NameLoc3`='Altar der Stürme', `NameLoc4`='风暴祭坛', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Алтарь Бурь' WHERE (`Entry`='255');
UPDATE `locales_area` SET `Entry`='256', `NameLoc1`='알드랏실', `NameLoc2`='Aldrassil', `NameLoc3`='Aldrassil', `NameLoc4`='奥达希尔', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Альдрассил' WHERE (`Entry`='256');
UPDATE `locales_area` SET `Entry`='257', `NameLoc1`='그늘 거미굴', `NameLoc2`='Grotte de Sombrefil', `NameLoc3`='Schattenweberhöhle', `NameLoc4`='黑丝洞', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Паучье логово' WHERE (`Entry`='257');
UPDATE `locales_area` SET `Entry`='258', `NameLoc1`='악마 바위굴', `NameLoc2`='Gangreroche', `NameLoc3`='Teufelsfels', `NameLoc4`='地狱石', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Пещера Бесов' WHERE (`Entry`='258');
UPDATE `locales_area` SET `Entry`='259', `NameLoc1`='알아메스 호수', `NameLoc2`='Lac Al\'Ameth', `NameLoc3`='Al\'Amethsee', `NameLoc4`='奥拉密斯湖', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Озеро Аль\'Амет' WHERE (`Entry`='259');
UPDATE `locales_area` SET `Entry`='260', `NameLoc1`='별바람 마을', `NameLoc2`='Brise-stellaire', `NameLoc3`='Starbreeze', `NameLoc4`='星风村', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Деревня Звездного Ветра' WHERE (`Entry`='260');
UPDATE `locales_area` SET `Entry`='261', `NameLoc1`='나무옹이 요새', `NameLoc2`='Camp des Pins-tordus', `NameLoc3`='Höhle der Knarzklauen', `NameLoc4`='脊骨堡', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Лагерь у Кривой Сосны' WHERE (`Entry`='261');
UPDATE `locales_area` SET `Entry`='262', `NameLoc1`='바네실 지하굴', `NameLoc2`='Refuge des saisons de Ban\'ethil', `NameLoc3`='Grabhügel von Ban\'ethil', `NameLoc4`='班奈希尔兽穴', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Обитель Бен\'этиль' WHERE (`Entry`='262');
UPDATE `locales_area` SET `Entry`='263', `NameLoc1`='바위 동굴', `NameLoc2`='La Faille', `NameLoc3`='Die Kluft', `NameLoc4`='大断崖', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Расселина' WHERE (`Entry`='263');
UPDATE `locales_area` SET `Entry`='264', `NameLoc1`='신탁의 숲', `NameLoc2`='La Clairière de l\'Oracle', `NameLoc3`='Die Lichtung des Orakels', `NameLoc4`='神谕林地', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Поляна Оракула' WHERE (`Entry`='264');
UPDATE `locales_area` SET `Entry`='265', `NameLoc1`='생명의 강', `NameLoc2`='L\'Aigue-vive', `NameLoc3`='Der Wellspring', `NameLoc4`='涌泉河', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Родниковая река' WHERE (`Entry`='265');
UPDATE `locales_area` SET `Entry`='266', `NameLoc1`='생명의 호수', `NameLoc2`='Lac d\'Aigue-vive', `NameLoc3`='Wellspringsee', `NameLoc4`='涌泉湖', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Родниковое озеро' WHERE (`Entry`='266');
UPDATE `locales_area` SET `Entry`='267', `NameLoc1`='힐스브래드 구릉지', `NameLoc2`='Contreforts d\'Hillsbrad', `NameLoc3`='Vorgebirge von Hillsbrad', `NameLoc4`='希尔斯布莱德丘陵', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Предгорья Хилсбрада' WHERE (`Entry`='267');
UPDATE `locales_area` SET `Entry`='268', `NameLoc1`='아즈샤라 분화구', `NameLoc2`='Cratère d\'Azshara', `NameLoc3`='Azshara-Krater', `NameLoc4`='积雪平原', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Кратер Азшары' WHERE (`Entry`='268');
UPDATE `locales_area` SET `Entry`='269', `NameLoc1`='던 알가즈', `NameLoc2`='Dun Algaz', `NameLoc3`='Dun Algaz', `NameLoc4`='丹奥加兹', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Дун Альгаз' WHERE (`Entry`='269');
UPDATE `locales_area` SET `Entry`='271', `NameLoc1`='사우스쇼어', `NameLoc2`='Southshore', `NameLoc3`='Southshore', `NameLoc4`='南海镇', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Южнобережье' WHERE (`Entry`='271');
UPDATE `locales_area` SET `Entry`='272', `NameLoc1`='타렌 밀농장', `NameLoc2`='Moulin-de-Tarren', `NameLoc3`='Tarrens Mühle', `NameLoc4`='塔伦米尔', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Мельница Таррен' WHERE (`Entry`='272');
UPDATE `locales_area` SET `Entry`='275', `NameLoc1`='던홀드 요새', `NameLoc2`='Donjon de Durnholde', `NameLoc3`='Burg Durnholde', `NameLoc4`='敦霍尔德城堡', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Крепость Дарнхольд' WHERE (`Entry`='275');
UPDATE `locales_area` SET `Entry`='276', `NameLoc1`='돌다지 고개', `NameLoc2`='UNUSED Passage de Formepierre', `NameLoc3`='UNUSED Stonewrought Pass', `NameLoc4`='石坝小径', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='НЕ ИСПОЛЬЗУЕТСЯ Подгорная тропа' WHERE (`Entry`='276');
UPDATE `locales_area` SET `Entry`='277', `NameLoc1`='구릉지 동굴', `NameLoc2`='Les cavernes des contreforts', `NameLoc3`='Die Vorgebirgshöhlen', `NameLoc4`='丘陵洞穴', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Пещеры предгорий' WHERE (`Entry`='277');
UPDATE `locales_area` SET `Entry`='278', `NameLoc1`='로다미어 포로수용소', `NameLoc2`='Camp d\'internement de Lordamere', `NameLoc3`='Lordamere-Internierungslager', `NameLoc4`='洛丹米尔收容所', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Лордамерские выселки' WHERE (`Entry`='278');
UPDATE `locales_area` SET `Entry`='279', `NameLoc1`='달라란', `NameLoc2`='Dalaran', `NameLoc3`='Dalaran', `NameLoc4`='达拉然', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Даларан' WHERE (`Entry`='279');
UPDATE `locales_area` SET `Entry`='280', `NameLoc1`='스트란브래드', `NameLoc2`='Strahnbrad', `NameLoc3`='Strahnbrad', `NameLoc4`='斯坦恩布莱德', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Странбрад' WHERE (`Entry`='280');
UPDATE `locales_area` SET `Entry`='281', `NameLoc1`='알터랙 폐허', `NameLoc2`='Ruines d\'Alterac', `NameLoc3`='Die Ruinen von Alterac', `NameLoc4`='奥特兰克废墟', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Руины Альтерака' WHERE (`Entry`='281');
UPDATE `locales_area` SET `Entry`='282', `NameLoc1`='산사태 오우거 소굴', `NameLoc2`='Bastion Cassecrête', `NameLoc3`='Crushridgehöhle', `NameLoc4`='破碎岭城堡', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Логово Раздробленного Хребта' WHERE (`Entry`='282');
UPDATE `locales_area` SET `Entry`='283', `NameLoc1`='살육의 동굴', `NameLoc2`='Creux du massacre', `NameLoc3`='Schlächtergrotte', `NameLoc4`='屠杀谷', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Кровавая низина' WHERE (`Entry`='283');
UPDATE `locales_area` SET `Entry`='284', `NameLoc1`='고원', `NameLoc2`='Les Hauteurs', `NameLoc3`='Das Oberland', `NameLoc4`='高地', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Высокогорье' WHERE (`Entry`='284');
UPDATE `locales_area` SET `Entry`='285', `NameLoc1`='남부 경비탑', `NameLoc2`='Tour de la Pointe du Midi', `NameLoc3`='Südwacht', `NameLoc4`='南点哨塔', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Южная башня' WHERE (`Entry`='285');
UPDATE `locales_area` SET `Entry`='286', `NameLoc1`='힐스브래드 농장', `NameLoc2`='Champs d\'Hillsbrad', `NameLoc3`='Die Felder von Hillsbrad', `NameLoc4`='希尔斯布莱德农场', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Хилсбрадские поля' WHERE (`Entry`='286');
UPDATE `locales_area` SET `Entry`='287', `NameLoc1`='힐스브래드', `NameLoc2`='Hillsbrad', `NameLoc3`='Hillsbrad', `NameLoc4`='希尔斯布莱德', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Хилсбрад' WHERE (`Entry`='287');
UPDATE `locales_area` SET `Entry`='288', `NameLoc1`='청금석 광산', `NameLoc2`='Mine d\'Azurelode', `NameLoc3`='Der Azurschacht', `NameLoc4`='碧玉矿洞', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Лазуритовый рудник' WHERE (`Entry`='288');
UPDATE `locales_area` SET `Entry`='289', `NameLoc1`='네산더 농장', `NameLoc2`='Ferme des Nethander', `NameLoc3`='Nethander-Siedlung', `NameLoc4`='奈杉德哨岗', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Владение Нетандера' WHERE (`Entry`='289');
UPDATE `locales_area` SET `Entry`='290', `NameLoc1`='던 가록', `NameLoc2`='Dun Garok', `NameLoc3`='Dun Garok', `NameLoc4`='丹加洛克', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Дун Гарок' WHERE (`Entry`='290');
UPDATE `locales_area` SET `Entry`='293', `NameLoc1`='소라딘의 성벽', `NameLoc2`='Mur de Thoradin', `NameLoc3`='Thoradinswall', `NameLoc4`='索拉丁之墙', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Стена Торадина' WHERE (`Entry`='293');
UPDATE `locales_area` SET `Entry`='294', `NameLoc1`='동부 해안', `NameLoc2`='Rivage oriental', `NameLoc3`='Oststrand', `NameLoc4`='东部海滩', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Восточное побережье' WHERE (`Entry`='294');
UPDATE `locales_area` SET `Entry`='295', `NameLoc1`='서부 해안', `NameLoc2`='Rivage occidental', `NameLoc3`='Weststrand', `NameLoc4`='西部海岸', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Западное побережье' WHERE (`Entry`='295');
UPDATE `locales_area` SET `Entry`='296', `NameLoc1`='남쪽 바다', `NameLoc2`='South Seas UNUSED', `NameLoc3`='South Seas UNUSED', `NameLoc4`='South Seas UNUSED', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Южные моря НЕ ИСПОЛЬЗУЕТСЯ' WHERE (`Entry`='296');
UPDATE `locales_area` SET `Entry`='297', `NameLoc1`='자구에로 섬', `NameLoc2`='Ile aux jagueros', `NameLoc3`='Die Insel Jaguero', `NameLoc4`='哈圭罗岛', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Остров Жагуаро' WHERE (`Entry`='297');
UPDATE `locales_area` SET `Entry`='298', `NameLoc1`='바라딘 만', `NameLoc2`='Baie de Baradin', `NameLoc3`='Baradinbucht', `NameLoc4`='巴拉丁海湾', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Бухта Барадин' WHERE (`Entry`='298');
UPDATE `locales_area` SET `Entry`='299', `NameLoc1`='메네실 만', `NameLoc2`='Baie de Menethil', `NameLoc3`='Bucht von Menethil', `NameLoc4`='米奈希尔海湾', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Бухта Менетилов' WHERE (`Entry`='299');
UPDATE `locales_area` SET `Entry`='300', `NameLoc1`='안개갈대 해안', `NameLoc2`='Grève de Brumejonc', `NameLoc3`='Nebelschilfstrand', `NameLoc4`='芦苇海滩', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Тростниковый берег' WHERE (`Entry`='300');
UPDATE `locales_area` SET `Entry`='301', `NameLoc1`='폭풍 해안', `NameLoc2`='La Côte sauvage', `NameLoc3`='Die ungezähmte Küste', `NameLoc4`='野人海岸', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Гибельный берег' WHERE (`Entry`='301');
UPDATE `locales_area` SET `Entry`='302', `NameLoc1`='수정 해안', `NameLoc2`='Le Rivage de cristal', `NameLoc3`='Das Kristallufer', `NameLoc4`='水晶海岸', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Хрустальное взморье' WHERE (`Entry`='302');
UPDATE `locales_area` SET `Entry`='303', `NameLoc1`='조개껍질 해안', `NameLoc2`='Plage aux coquillages', `NameLoc3`='Muschelschalenstrand', `NameLoc4`='贝壳海滩', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Ракушечный пляж' WHERE (`Entry`='303');
UPDATE `locales_area` SET `Entry`='305', `NameLoc1`='북부 해안가', `NameLoc2`='La côte nord', `NameLoc3`='North Tide\'s Run', `NameLoc4`='北流海岸', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Берег Северного прилива' WHERE (`Entry`='305');
UPDATE `locales_area` SET `Entry`='306', `NameLoc1`='남부 해안가', `NameLoc2`='La côte sud', `NameLoc3`='South Tide\'s Run', `NameLoc4`='南流海岸', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Берег Южного прилива' WHERE (`Entry`='306');
UPDATE `locales_area` SET `Entry`='307', `NameLoc1`='전망대 절벽', `NameLoc2`='Les Hauts-Surplombs', `NameLoc3`='Die Aussichtsklippen', `NameLoc4`='望海崖', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Отвесные скалы' WHERE (`Entry`='307');
UPDATE `locales_area` SET `Entry`='308', `NameLoc1`='성난 바다', `NameLoc2`='La Mer interdite', `NameLoc3`='Das verbotene Meer', `NameLoc4`='禁忌之海', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Зловещее море' WHERE (`Entry`='308');
UPDATE `locales_area` SET `Entry`='309', `NameLoc1`='아이언비어드의 고분', `NameLoc2`='Tombe d\'Ironbeard', `NameLoc3`='Ironbeards Grabmal', `NameLoc4`='铁须之墓', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Гробница Железноборода' WHERE (`Entry`='309');
UPDATE `locales_area` SET `Entry`='310', `NameLoc1`='수정 광산', `NameLoc2`='Mine aux cristaux', `NameLoc3`='Kristalladermine', `NameLoc4`='水晶矿洞', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Хрустальная шахта' WHERE (`Entry`='310');
UPDATE `locales_area` SET `Entry`='311', `NameLoc1`='아보라즈의 폐허', `NameLoc2`='Ruines d\'Aboraz', `NameLoc3`='Ruinen von Aboraz', `NameLoc4`='阿博拉兹废墟', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Руины Абораза' WHERE (`Entry`='311');
UPDATE `locales_area` SET `Entry`='312', `NameLoc1`='자네이로 섬', `NameLoc2`='Cap Janeiro', `NameLoc3`='Janeirospitze', `NameLoc4`='加尼罗哨站', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Остров Жанейро' WHERE (`Entry`='312');
UPDATE `locales_area` SET `Entry`='313', `NameLoc1`='북부습곡 장원', `NameLoc2`='Manoir de Nordclos', `NameLoc3`='Nordhof', `NameLoc4`='诺斯弗德农场', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Северное поместье' WHERE (`Entry`='313');
UPDATE `locales_area` SET `Entry`='314', `NameLoc1`='고셰크 농장', `NameLoc2`='Ferme de Go\'Shek', `NameLoc3`='Go\'Sheks Hof', `NameLoc4`='格沙克农场', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Ферма Го\'Шека' WHERE (`Entry`='314');
UPDATE `locales_area` SET `Entry`='315', `NameLoc1`='다비리 농장', `NameLoc2`='Ferme des Dabyrie', `NameLoc3`='Bauernhof der Dabyries', `NameLoc4`='达比雷农场', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Усадьба Дабири' WHERE (`Entry`='315');
UPDATE `locales_area` SET `Entry`='316', `NameLoc1`='돌주먹일족 소굴', `NameLoc2`='Hall Rochepoing', `NameLoc3`='Halle der Felsfäuste', `NameLoc4`='石拳大厅', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Крепость Тяжелого Кулака' WHERE (`Entry`='316');
UPDATE `locales_area` SET `Entry`='317', `NameLoc1`='마른나무껍질 마을', `NameLoc2`='Village Witherbark', `NameLoc3`='Witherbark', `NameLoc4`='枯木村', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Деревня Сухокожих' WHERE (`Entry`='317');
UPDATE `locales_area` SET `Entry`='318', `NameLoc1`='마른수염 골짜기', `NameLoc2`='Gorge des Sèches-moustaches', `NameLoc3`='Schlucht der Trockenstoppel', `NameLoc4`='枯须峡谷', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Теснина Сухоусов' WHERE (`Entry`='318');
UPDATE `locales_area` SET `Entry`='320', `NameLoc1`='임시 주둔지', `NameLoc2`='Refuge de l\'Ornière', `NameLoc3`='Die Zuflucht', `NameLoc4`='避难谷地', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Опорный пункт' WHERE (`Entry`='320');
UPDATE `locales_area` SET `Entry`='321', `NameLoc1`='해머폴', `NameLoc2`='Trépas-d\'Orgrim', `NameLoc3`='Hammerfall', `NameLoc4`='落锤镇', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Павший Молот' WHERE (`Entry`='321');
UPDATE `locales_area` SET `Entry`='322', `NameLoc1`='검은바다 난파지', `NameLoc2`='Epaves des Flots noirs', `NameLoc3`='Schiffswracks der Schwarzmeerräuber', `NameLoc4`='黑水湾沉船', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Обломки судов Черноводья' WHERE (`Entry`='322');
UPDATE `locales_area` SET `Entry`='323', `NameLoc1`='오브린의 야영지', `NameLoc2`='Camp de O\'Breen', `NameLoc3`='O\'Breens Lager', `NameLoc4`='奥布瑞恩营地', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Лагерь О\'Брина' WHERE (`Entry`='323');
UPDATE `locales_area` SET `Entry`='324', `NameLoc1`='스트롬가드 요새', `NameLoc2`='Donjon de Stromgarde', `NameLoc3`='Burg Stromgarde', `NameLoc4`='激流堡', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Крепость Стромгард' WHERE (`Entry`='324');
UPDATE `locales_area` SET `Entry`='325', `NameLoc1`='아라소르의 탑', `NameLoc2`='La Tour d\'Arathor', `NameLoc3`='Der Turm von Arathor', `NameLoc4`='阿拉索之塔', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Башня Аратора' WHERE (`Entry`='325');
UPDATE `locales_area` SET `Entry`='326', `NameLoc1`='성소', `NameLoc2`='Le Sanctuaire', `NameLoc3`='Das Sanktum', `NameLoc4`='密室', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Святилище' WHERE (`Entry`='326');
UPDATE `locales_area` SET `Entry`='327', `NameLoc1`='팔디르의 만', `NameLoc2`='La Crique de Faldir', `NameLoc3`='Die Faldirbucht', `NameLoc4`='法迪尔海湾', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Бухта Фальдира' WHERE (`Entry`='327');
UPDATE `locales_area` SET `Entry`='328', `NameLoc1`='가라앉은 산호초', `NameLoc2`='Le récif englouti', `NameLoc3`='Das versunkene Riff', `NameLoc4`='水下暗礁', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Подводный риф' WHERE (`Entry`='328');
UPDATE `locales_area` SET `Entry`='330', `NameLoc1`='탄돌 교각', `NameLoc2`='Viaduc de Thandol', `NameLoc3`='Thandol-Übergang', `NameLoc4`='萨多尔大桥', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Мост Тандола' WHERE (`Entry`='330');
UPDATE `locales_area` SET `Entry`='331', `NameLoc1`='잿빛 골짜기', `NameLoc2`='Ashenvale', `NameLoc3`='Ashenvale', `NameLoc4`='灰谷', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Ясеневый лес' WHERE (`Entry`='331');
UPDATE `locales_area` SET `Entry`='332', `NameLoc1`='대해', `NameLoc2`='La Grande mer', `NameLoc3`='Das große Meer', `NameLoc4`='无尽之海', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Великое море' WHERE (`Entry`='332');
UPDATE `locales_area` SET `Entry`='333', `NameLoc1`='동쪽 봉인의 마법진', `NameLoc2`='Cercle de lien oriental', `NameLoc3`='Kreis der östlichen Bindung', `NameLoc4`='东部禁锢法阵', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Восточный круг Обуздания' WHERE (`Entry`='333');
UPDATE `locales_area` SET `Entry`='334', `NameLoc1`='서쪽 봉인의 마법진', `NameLoc2`='Cercle de lien occidental', `NameLoc3`='Kreis der westlichen Bindung', `NameLoc4`='西部禁锢法阵', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Западный Круг Обуздания' WHERE (`Entry`='334');
UPDATE `locales_area` SET `Entry`='335', `NameLoc1`='내부 봉인의 마법진', `NameLoc2`='Cercle de lien intérieur', `NameLoc3`='Kreis der inneren Bindung', `NameLoc4`='内禁锢法阵', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Внутренний Круг Обуздания' WHERE (`Entry`='335');
UPDATE `locales_area` SET `Entry`='336', `NameLoc1`='외부 봉인의 마법진', `NameLoc2`='Cercle de lien extérieur', `NameLoc3`='Kreis der äußeren Bindung', `NameLoc4`='外禁锢法阵', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Внешний Круг Обуздания' WHERE (`Entry`='336');
UPDATE `locales_area` SET `Entry`='337', `NameLoc1`='아포크리판의 안식처', `NameLoc2`='Repos d\'Apocryphan', `NameLoc3`='Apocryphans Ruheplatz', `NameLoc4`='圣者之陵', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Скелет Апокрифана' WHERE (`Entry`='337');
UPDATE `locales_area` SET `Entry`='338', `NameLoc1`='고통의 요새', `NameLoc2`='Forteresse d\'Angor', `NameLoc3`='Festung Angor', `NameLoc4`='苦痛堡垒', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Крепость Ангор' WHERE (`Entry`='338');
UPDATE `locales_area` SET `Entry`='339', `NameLoc1`='레슬로 협곡', `NameLoc2`='Ravin de Lethlor', `NameLoc3`='Die Lethlorklamm', `NameLoc4`='莱瑟罗峡谷', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Долина Летлор' WHERE (`Entry`='339');
UPDATE `locales_area` SET `Entry`='340', `NameLoc1`='카르가스', `NameLoc2`='Kargath', `NameLoc3`='Kargath', `NameLoc4`='卡加斯', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Каргат' WHERE (`Entry`='340');
UPDATE `locales_area` SET `Entry`='341', `NameLoc1`='코쉬 야영지', `NameLoc2`='Camp Kosh', `NameLoc3`='Camp Kosh', `NameLoc4`='柯什营地', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Лагерь Кош' WHERE (`Entry`='341');
UPDATE `locales_area` SET `Entry`='342', `NameLoc1`='보프 야영지', `NameLoc2`='Camp Boff', `NameLoc3`='Camp Boff', `NameLoc4`='博夫营地', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Лагерь Бофф' WHERE (`Entry`='342');
UPDATE `locales_area` SET `Entry`='343', `NameLoc1`='우르그 야영지', `NameLoc2`='Camp Wurg', `NameLoc3`='Camp Wurg', `NameLoc4`='瓦格营地', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Лагерь Вург' WHERE (`Entry`='343');
UPDATE `locales_area` SET `Entry`='344', `NameLoc1`='카그 야영지', `NameLoc2`='Camp Cagg', `NameLoc3`='Camp Cagg', `NameLoc4`='卡格营地', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Лагерь Кэгг' WHERE (`Entry`='344');
UPDATE `locales_area` SET `Entry`='345', `NameLoc1`='아그몬드의 최후', `NameLoc2`='Fin d\'Agmond', `NameLoc3`='Agmondkuppe', `NameLoc4`='埃格蒙德的营地', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Удел Эгмонда' WHERE (`Entry`='345');
UPDATE `locales_area` SET `Entry`='346', `NameLoc1`='해머토의 발굴현장', `NameLoc2`='Site de fouilles d\'Hammertoe', `NameLoc3`='Hammertoes Grabungsstätte', `NameLoc4`='铁趾挖掘场', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Карьер Тяжелоступа' WHERE (`Entry`='346');
UPDATE `locales_area` SET `Entry`='347', `NameLoc1`='먼지목도리 소굴', `NameLoc2`='Grotte de Crache-poussière', `NameLoc3`='Die Staubspeiergrotte', `NameLoc4`='火山洞穴', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Грот Гнилобрюхих' WHERE (`Entry`='347');
UPDATE `locales_area` SET `Entry`='348', `NameLoc1`='맹금의 봉우리', `NameLoc2`='Nid-de-l\'Aigle', `NameLoc3`='Aerie Peak', `NameLoc4`='鹰巢山', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Заоблачный пик' WHERE (`Entry`='348');
UPDATE `locales_area` SET `Entry`='349', `NameLoc1`='와일드해머 요새', `NameLoc2`='Donjon des Wildhammer', `NameLoc3`='Burg Wildhammer', `NameLoc4`='蛮锤城堡', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Крепость Громового Молота' WHERE (`Entry`='349');
UPDATE `locales_area` SET `Entry`='350', `NameLoc1`='쿠엘다닐 오두막', `NameLoc2`='Gîte de Quel\'Danil', `NameLoc3`='Die Quel\'Danil-Hütte', `NameLoc4`='奎尔丹尼小屋', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Сторожка Кель\'Данил' WHERE (`Entry`='350');
UPDATE `locales_area` SET `Entry`='351', `NameLoc1`='굼벵이 바위굴', `NameLoc2`='Rocher de l\'Affût', `NameLoc3`='Skulk Rock', `NameLoc4`='隐匿石', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Осклизлая скала' WHERE (`Entry`='351');
UPDATE `locales_area` SET `Entry`='352', `NameLoc1`='준와타', `NameLoc2`='Zun\'watha', `NameLoc3`='Zun\'watha', `NameLoc4`='祖瓦沙', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Зун\'вата' WHERE (`Entry`='352');
UPDATE `locales_area` SET `Entry`='353', `NameLoc1`='샤드라알로', `NameLoc2`='Shadra\'Alor', `NameLoc3`='Shadra\'Alor', `NameLoc4`='沙德拉洛', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Шадра\'Алор' WHERE (`Entry`='353');
UPDATE `locales_area` SET `Entry`='354', `NameLoc1`='진타알로', `NameLoc2`='Jintha\'Alor', `NameLoc3`='Jintha\'Alor', `NameLoc4`='辛萨罗', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Джинта\'Алор' WHERE (`Entry`='354');
UPDATE `locales_area` SET `Entry`='355', `NameLoc1`='줄의 제단', `NameLoc2`='L\'Autel de Zul', `NameLoc3`='Der Altar von Zul', `NameLoc4`='祖尔祭坛', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Алтарь Зула' WHERE (`Entry`='355');
UPDATE `locales_area` SET `Entry`='356', `NameLoc1`='세라데인', `NameLoc2`='Seradane', `NameLoc3`='Seradane', `NameLoc4`='瑟拉丹', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Серадан' WHERE (`Entry`='356');
UPDATE `locales_area` SET `Entry`='357', `NameLoc1`='페랄라스', `NameLoc2`='Feralas', `NameLoc3`='Feralas', `NameLoc4`='菲拉斯', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Фералас' WHERE (`Entry`='357');
UPDATE `locales_area` SET `Entry`='358', `NameLoc1`='칼날가시 협곡', `NameLoc2`='Ravin de Roncelame', `NameLoc3`='Dornrankenklamm', `NameLoc4`='刺刃峡谷', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Ежевичная лощина' WHERE (`Entry`='358');
UPDATE `locales_area` SET `Entry`='359', `NameLoc1`='바엘 모단', `NameLoc2`='Bael Modan', `NameLoc3`='Bael Modan', `NameLoc4`='巴尔莫丹', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Бейл Модан' WHERE (`Entry`='359');
UPDATE `locales_area` SET `Entry`='360', `NameLoc1`='투자개발회사 광산', `NameLoc2`='Mine de la KapitalRisk', `NameLoc3`='Die Mine der Venture Co.', `NameLoc4`='风险投资公司矿洞', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Рудник Торговой Компании' WHERE (`Entry`='360');
UPDATE `locales_area` SET `Entry`='361', `NameLoc1`='악령의 숲', `NameLoc2`='Gangrebois (Felwood)', `NameLoc3`='Teufelswald', `NameLoc4`='费伍德森林', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Оскверненный лес' WHERE (`Entry`='361');
UPDATE `locales_area` SET `Entry`='362', `NameLoc1`='칼바위 언덕', `NameLoc2`='Tranchecolline', `NameLoc3`='Klingenhügel', `NameLoc4`='剃刀岭', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Колючий Холм' WHERE (`Entry`='362');
UPDATE `locales_area` SET `Entry`='363', `NameLoc1`='시험의 골짜기', `NameLoc2`='Vallée des épreuves', `NameLoc3`='Das Tal der Prüfungen', `NameLoc4`='试炼谷', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Долина Испытаний' WHERE (`Entry`='363');
UPDATE `locales_area` SET `Entry`='364', `NameLoc1`='동굴 막사', `NameLoc2`='L\'Antre', `NameLoc3`='Der Höhlenbau', `NameLoc4`='大兽穴', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Логово' WHERE (`Entry`='364');
UPDATE `locales_area` SET `Entry`='365', `NameLoc1`='불타는 칼날 소굴', `NameLoc2`='Convent de la Lame ardente', `NameLoc3`='Koven der Brennenden Klinge', `NameLoc4`='火刃集会所', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Грот Пылающего Клинка' WHERE (`Entry`='365');
UPDATE `locales_area` SET `Entry`='366', `NameLoc1`='콜카르 바윗골', `NameLoc2`='Combe des Kolkar', `NameLoc3`='Kolkarklippe', `NameLoc4`='科卡尔峭壁', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Утес Колкар' WHERE (`Entry`='366');
UPDATE `locales_area` SET `Entry`='367', `NameLoc1`='센진 마을', `NameLoc2`='Village de Sen\'jin', `NameLoc3`='Sen\'jin', `NameLoc4`='森金村', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Деревня Сен\'джин' WHERE (`Entry`='367');
UPDATE `locales_area` SET `Entry`='368', `NameLoc1`='메아리 섬', `NameLoc2`='Îles de l\'Écho', `NameLoc3`='Die Echoinseln', `NameLoc4`='回音群岛', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Острова Эха' WHERE (`Entry`='368');
UPDATE `locales_area` SET `Entry`='369', `NameLoc1`='천둥 골짜기', `NameLoc2`='Falaises du Tonnerre', `NameLoc3`='Donnergrat', `NameLoc4`='雷霆山', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Громовой хребет' WHERE (`Entry`='369');
UPDATE `locales_area` SET `Entry`='370', `NameLoc1`='모래바람 협곡', `NameLoc2`='Ravin asséché', `NameLoc3`='Staubwindklamm', `NameLoc4`='枯水谷', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Сухая лощина' WHERE (`Entry`='370');
UPDATE `locales_area` SET `Entry`='371', `NameLoc1`='먼지바람 동굴', `NameLoc2`='Caverne des Terrevent', `NameLoc3`='Staubwindhöhle', `NameLoc4`='尘风洞穴', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Пещера Пыльного Ветра' WHERE (`Entry`='371');
UPDATE `locales_area` SET `Entry`='372', `NameLoc1`='타이라가드 요새', `NameLoc2`='Donjon de Tiragarde', `NameLoc3`='Burg Tiragarde', `NameLoc4`='提拉加德城堡', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Крепость Тирагард' WHERE (`Entry`='372');
UPDATE `locales_area` SET `Entry`='373', `NameLoc1`='가라앉은 해안', `NameLoc2`='Côte des naufrages', `NameLoc3`='Schipperküste', `NameLoc4`='流亡海岸', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Берег Разбитых Кораблей' WHERE (`Entry`='373');
UPDATE `locales_area` SET `Entry`='374', `NameLoc1`='칼날주먹 만', `NameLoc2`='Baie de Bladefist', `NameLoc3`='Messerbucht', `NameLoc4`='刃拳海湾', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Бухта Острорука' WHERE (`Entry`='374');
UPDATE `locales_area` SET `Entry`='375', `NameLoc1`='데드아이 해안', `NameLoc2`='Rivage de Deadeye', `NameLoc3`='Killrogs Küste', `NameLoc4`='死眼海岸', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Взморье Мертвого Глаза' WHERE (`Entry`='375');
UPDATE `locales_area` SET `Entry`='377', `NameLoc1`='분노의 강', `NameLoc2`='Fleuve Furie-du-Sud', `NameLoc3`='Der Südstrom', `NameLoc4`='怒水河', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Река Строптивая' WHERE (`Entry`='377');
UPDATE `locales_area` SET `Entry`='378', `NameLoc1`='타우라조 야영지', `NameLoc2`='Camp Taurajo', `NameLoc3`='Camp Taurajo', `NameLoc4`='陶拉祖营地', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Лагерь Таурахо' WHERE (`Entry`='378');
UPDATE `locales_area` SET `Entry`='379', `NameLoc1`='전초 기지', `NameLoc2`='Poste de garde extérieur', `NameLoc3`='Farwatch-Posten', `NameLoc4`='前沿哨所', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Дальняя застава' WHERE (`Entry`='379');
UPDATE `locales_area` SET `Entry`='380', `NameLoc1`='크로스로드', `NameLoc2`='La Croisée', `NameLoc3`='Crossroads', `NameLoc4`='十字路口', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Перекресток' WHERE (`Entry`='380');
UPDATE `locales_area` SET `Entry`='381', `NameLoc1`='돌무더기 광산', `NameLoc2`='Mine des Pierriers', `NameLoc3`='Felsadermine', `NameLoc4`='石矿洞', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Каменный карьер' WHERE (`Entry`='381');
UPDATE `locales_area` SET `Entry`='382', `NameLoc1`='진흙늪', `NameLoc2`='La Videfange', `NameLoc3`='Das Schlickermoor', `NameLoc4`='淤泥沼泽', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Нефтяное болото' WHERE (`Entry`='382');
UPDATE `locales_area` SET `Entry`='383', `NameLoc1`='메마른 언덕', `NameLoc2`='Les Collines arides', `NameLoc3`='Die trockenen Hügel', `NameLoc4`='无水岭', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Сухие холмы' WHERE (`Entry`='383');
UPDATE `locales_area` SET `Entry`='384', `NameLoc1`='공포의 안개봉우리', `NameLoc2`='Pic de Brume-funeste', `NameLoc3`='Glutnebelgipfel', `NameLoc4`='鬼雾峰', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Вершина Багрового Тумана' WHERE (`Entry`='384');
UPDATE `locales_area` SET `Entry`='385', `NameLoc1`='북부 전초기지', `NameLoc2`='Fort du Nord', `NameLoc3`='Die Feste Northwatch', `NameLoc4`='北方城堡', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Крепость Северной Стражи' WHERE (`Entry`='385');
UPDATE `locales_area` SET `Entry`='386', `NameLoc1`='잊혀진 웅덩이', `NameLoc2`='Les Bassins oubliés', `NameLoc3`='Die vergessenen Teiche', `NameLoc4`='遗忘之池', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Забытые пруды' WHERE (`Entry`='386');
UPDATE `locales_area` SET `Entry`='387', `NameLoc1`='푸른 오아시스', `NameLoc2`='Oasis luxuriante', `NameLoc3`='Die blühende Oase', `NameLoc4`='甜水绿洲', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Цветущий оазис' WHERE (`Entry`='387');
UPDATE `locales_area` SET `Entry`='388', `NameLoc1`='죽은 오아시스', `NameLoc2`='L\'oasis stagnante', `NameLoc3`='Die brackige Oase', `NameLoc4`='死水绿洲', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Застывший оазис' WHERE (`Entry`='388');
UPDATE `locales_area` SET `Entry`='390', `NameLoc1`='거인의 들판', `NameLoc2`='Champ des Géants', `NameLoc3`='Feld der Riesen', `NameLoc4`='巨人旷野', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Поля Великанов' WHERE (`Entry`='390');
UPDATE `locales_area` SET `Entry`='391', `NameLoc1`='무역 해안', `NameLoc2`='La Côte des marchands', `NameLoc3`='Die Händlerküste', `NameLoc4`='商旅海岸', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Торговое побережье' WHERE (`Entry`='391');
UPDATE `locales_area` SET `Entry`='392', `NameLoc1`='톱니항', `NameLoc2`='Ratchet', `NameLoc3`='Ratchet', `NameLoc4`='棘齿城', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Кабестан' WHERE (`Entry`='392');
UPDATE `locales_area` SET `Entry`='393', `NameLoc1`='검은창 해안', `NameLoc2`='Grève des Darkspear', `NameLoc3`='Strand der Darkspear', `NameLoc4`='暗矛海滩', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Побережье Черного Копья' WHERE (`Entry`='393');
UPDATE `locales_area` SET `Entry`='394', `NameLoc1`='다로미어 호수', `NameLoc2`='Lac DarrowmereUNUSED', `NameLoc3`='Darrowmere Lake UNUSED', `NameLoc4`='达隆米尔湖', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Озеро Дарроумир НЕ ИСПОЛЬЗУЕТСЯ' WHERE (`Entry`='394');
UPDATE `locales_area` SET `Entry`='395', `NameLoc1`='카엘 다로우', `NameLoc2`='Caer Darrow UNUSED', `NameLoc3`='Caer Darrow UNUSED', `NameLoc4`='Caer Darrow UNUSED', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Каэр Дэрроу НЕ ИСПОЛЬЗУЕТСЯ' WHERE (`Entry`='395');
UPDATE `locales_area` SET `Entry`='396', `NameLoc1`='윈터후프 우물', `NameLoc2`='Puits Winterhoof', `NameLoc3`='Wasserbrunnen von Winterhoof', `NameLoc4`='冰蹄水井', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Колодец Заиндевевшего Копыта' WHERE (`Entry`='396');
UPDATE `locales_area` SET `Entry`='397', `NameLoc1`='썬더혼 우물', `NameLoc2`='Puits Thunderhorn', `NameLoc3`='Wasserbrunnen von Thunderhorn', `NameLoc4`='雷角水井', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Колодец Громового Рога' WHERE (`Entry`='397');
UPDATE `locales_area` SET `Entry`='398', `NameLoc1`='와일드메인 우물', `NameLoc2`='Puits Wildmane', `NameLoc3`='Wasserbrunnen von Wildmane', `NameLoc4`='蛮鬃水井', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Колодец Буйногривых' WHERE (`Entry`='398');
UPDATE `locales_area` SET `Entry`='399', `NameLoc1`='지평선 마루', `NameLoc2`='Crête de Skyline', `NameLoc3`='Skylineridge', `NameLoc4`='冲天岭', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Гряда на горизонте' WHERE (`Entry`='399');
UPDATE `locales_area` SET `Entry`='400', `NameLoc1`='버섯구름 봉우리', `NameLoc2`='Mille pointes (Thousand Needles)', `NameLoc3`='Tausend Nadeln', `NameLoc4`='千针石林', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Тысяча Игл' WHERE (`Entry`='400');
UPDATE `locales_area` SET `Entry`='401', `NameLoc1`='타이더스 계단', `NameLoc2`='L\'Escalier des marées', `NameLoc3`='Die Tidusstaffel', `NameLoc4`='提度斯阶梯', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Лестница Прилива' WHERE (`Entry`='401');
UPDATE `locales_area` SET `Entry`='403', `NameLoc1`='그늘 쉼터 여관', `NameLoc2`='Auberge du Repos ombragé', `NameLoc3`='Gasthaus Zur süßen Ruh', `NameLoc4`='树荫旅店', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Таверна \"Последний привал\"' WHERE (`Entry`='403');
UPDATE `locales_area` SET `Entry`='404', `NameLoc1`='바엘던 발굴현장', `NameLoc2`='Site de fouilles de Bael\'Dun', `NameLoc3`='Grabungsstätte von Bael\'dun', `NameLoc4`='巴尔丹挖掘场', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Раскопки Бейл\'дана' WHERE (`Entry`='404');
UPDATE `locales_area` SET `Entry`='405', `NameLoc1`='잊혀진 땅', `NameLoc2`='Désolace', `NameLoc3`='Desolace', `NameLoc4`='凄凉之地', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Пустоши' WHERE (`Entry`='405');
UPDATE `locales_area` SET `Entry`='406', `NameLoc1`='돌발톱 산맥', `NameLoc2`='Les Serres-Rocheuses (Stonetalon Mts)', `NameLoc3`='Steinkrallengebirge', `NameLoc4`='石爪山脉', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Когтистые горы' WHERE (`Entry`='406');
UPDATE `locales_area` SET `Entry`='407', `NameLoc1`='오그리마', `NameLoc2`='Orgrimmar UNUSED', `NameLoc3`='Orgrimmar UNUSED', `NameLoc4`='奥格瑞玛', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Оргриммар НЕ ИСПОЛЬЗУЕТСЯ' WHERE (`Entry`='407');
UPDATE `locales_area` SET `Entry`='408', `NameLoc1`='길리짐의 섬', `NameLoc2`='Ile de Gillijim', `NameLoc3`='Gillijims Insel', `NameLoc4`='吉利吉姆之岛', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Остров Гиллиджима' WHERE (`Entry`='408');
UPDATE `locales_area` SET `Entry`='409', `NameLoc1`='학자 라피디스의 섬', `NameLoc2`='Ile du docteur Lapidis', `NameLoc3`='Insel des Doktor Lapidis', `NameLoc4`='拉匹迪斯之岛', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Остров доктора Лапидиса' WHERE (`Entry`='409');
UPDATE `locales_area` SET `Entry`='410', `NameLoc1`='칼바람 협곡', `NameLoc2`='Canyon de Tranchevent', `NameLoc3`='Klingenschlucht', `NameLoc4`='烈风峡谷', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Каньон Колючего Ветра' WHERE (`Entry`='410');
UPDATE `locales_area` SET `Entry`='411', `NameLoc1`='배스랜 서식지', `NameLoc2`='Repaire de Bathran', `NameLoc3`='Bathrans Schlupfwinkel', `NameLoc4`='巴斯兰鬼屋', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Убежище Батрана' WHERE (`Entry`='411');
UPDATE `locales_area` SET `Entry`='412', `NameLoc1`='오르딜아란의 폐허', `NameLoc2`='Les Ruines d\'Ordil\'Aran', `NameLoc3`='Die Ruinen von Ordil\'Aran', `NameLoc4`='奥迪拉兰废墟', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Руины Ордил\'Арана' WHERE (`Entry`='412');
UPDATE `locales_area` SET `Entry`='413', `NameLoc1`='마에스트라 주둔지', `NameLoc2`='Poste de Maestra', `NameLoc3`='Maestras Posten', `NameLoc4`='迈斯特拉岗哨', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Застава Мейстры' WHERE (`Entry`='413');
UPDATE `locales_area` SET `Entry`='414', `NameLoc1`='조람 해안', `NameLoc2`='La grève de Zoram', `NameLoc3`='Der Zoramstrand', `NameLoc4`='佐拉姆海岸', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Зорамское взморье' WHERE (`Entry`='414');
UPDATE `locales_area` SET `Entry`='415', `NameLoc1`='아스트라나르', `NameLoc2`='Astranaar', `NameLoc3`='Astranaar', `NameLoc4`='阿斯特兰纳', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Астранаар' WHERE (`Entry`='415');
UPDATE `locales_area` SET `Entry`='416', `NameLoc1`='아에시나의 제단', `NameLoc2`='Le sanctuaire d\'Aessina', `NameLoc3`='Der Schrein von Aessina', `NameLoc4`='艾森娜神殿', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Святилище Эссины' WHERE (`Entry`='416');
UPDATE `locales_area` SET `Entry`='417', `NameLoc1`='불타버린 신전', `NameLoc2`='Sanctuaire de Scarfeu', `NameLoc3`='Schrein des sengenden Feuers', `NameLoc4`='火痕神殿', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Святилище Огненной Расщелины' WHERE (`Entry`='417');
UPDATE `locales_area` SET `Entry`='418', `NameLoc1`='별가루의 폐허', `NameLoc2`='Les ruines de Chimétoile', `NameLoc3`='Die Sternenstaubruinen', `NameLoc4`='星尘废墟', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Руины Звездной Пыли' WHERE (`Entry`='418');
UPDATE `locales_area` SET `Entry`='419', `NameLoc1`='울부짖는 골짜기', `NameLoc2`='Le Val hurlant', `NameLoc3`='Das heulende Tal', `NameLoc4`='狼嚎谷', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Воющая долина' WHERE (`Entry`='419');
UPDATE `locales_area` SET `Entry`='420', `NameLoc1`='실바람 산장', `NameLoc2`='Refuge de Vent-argent', `NameLoc3`='Silberwindzuflucht', `NameLoc4`='银风避难所', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Приют Серебряного Ветра' WHERE (`Entry`='420');
UPDATE `locales_area` SET `Entry`='421', `NameLoc1`='미스트랄 호수', `NameLoc2`='Lac Mystral', `NameLoc3`='Mystralsee', `NameLoc4`='密斯特拉湖', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Озеро Мистраль' WHERE (`Entry`='421');
UPDATE `locales_area` SET `Entry`='422', `NameLoc1`='유성 호수', `NameLoc2`='Lac Tombeciel', `NameLoc3`='Himmelssturzsee', `NameLoc4`='坠星湖', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Зеркало Небес' WHERE (`Entry`='422');
UPDATE `locales_area` SET `Entry`='424', `NameLoc1`='아이리스 호수', `NameLoc2`='Lac Iris', `NameLoc3`='Irissee', `NameLoc4`='伊瑞斯湖', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Озеро Ирис' WHERE (`Entry`='424');
UPDATE `locales_area` SET `Entry`='425', `NameLoc1`='달샘', `NameLoc2`='Puits de lune', `NameLoc3`='Mondbrunnen', `NameLoc4`='月亮井', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Лунный колодец' WHERE (`Entry`='425');
UPDATE `locales_area` SET `Entry`='426', `NameLoc1`='라이네나무 은신처', `NameLoc2`='Retraite de Raynewood', `NameLoc3`='Raynewood', `NameLoc4`='林中树居', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Приют в Ночных Лесах' WHERE (`Entry`='426');
UPDATE `locales_area` SET `Entry`='427', `NameLoc1`='그늘 동굴', `NameLoc2`='Le creux ombragé', `NameLoc3`='Der Schattenwinkel', `NameLoc4`='林荫小径', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Тенистый закоулок' WHERE (`Entry`='427');
UPDATE `locales_area` SET `Entry`='428', `NameLoc1`='어둠의 터', `NameLoc2`='Défilé de la nuit', `NameLoc3`='Nachtflucht', `NameLoc4`='夜道谷', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Ночная поляна' WHERE (`Entry`='428');
UPDATE `locales_area` SET `Entry`='429', `NameLoc1`='사비안', `NameLoc2`='Xavian', `NameLoc3`='Xavian', `NameLoc4`='萨维亚', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Ксавиан' WHERE (`Entry`='429');
UPDATE `locales_area` SET `Entry`='430', `NameLoc1`='사티르나르', `NameLoc2`='Satyrnaar', `NameLoc3`='Satyrnaar', `NameLoc4`='萨提纳尔', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Сатирнаар' WHERE (`Entry`='430');
UPDATE `locales_area` SET `Entry`='431', `NameLoc1`='토막나무 주둔지', `NameLoc2`='Poste de Bois-brisé', `NameLoc3`='Splintertreeposten', `NameLoc4`='碎木岗哨', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Застава Расщепленного Дерева' WHERE (`Entry`='431');
UPDATE `locales_area` SET `Entry`='432', `NameLoc1`='도르다닐 지하굴', `NameLoc2`='Le Refuge des saisons de Dor\'danil', `NameLoc3`='Der Dor\'danil-Grabhügel', `NameLoc4`='朵丹尼尔兽穴', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Обитель Дор\'Данил' WHERE (`Entry`='432');
UPDATE `locales_area` SET `Entry`='433', `NameLoc1`='팔파렌 강', `NameLoc2`='Fleuve Falfarren', `NameLoc3`='Der Falfarren', `NameLoc4`='弗伦河', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Река Фалфаррен' WHERE (`Entry`='433');
UPDATE `locales_area` SET `Entry`='434', `NameLoc1`='지옥불 언덕', `NameLoc2`='Colline Gangrefeu', `NameLoc3`='Felfire Hill', `NameLoc4`='冥火岭', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Холм Демонического Огня' WHERE (`Entry`='434');
UPDATE `locales_area` SET `Entry`='435', `NameLoc1`='악마벼락 협곡', `NameLoc2`='Canyon de la Malechute', `NameLoc3`='Dämonensturz', `NameLoc4`='屠魔峡谷', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Каньон Гибели Демона' WHERE (`Entry`='435');
UPDATE `locales_area` SET `Entry`='436', `NameLoc1`='악마벼락 마루', `NameLoc2`='Crête de la Malechute', `NameLoc3`='Dämonenstieg', `NameLoc4`='屠魔山', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Гряда Гибели Демона' WHERE (`Entry`='436');
UPDATE `locales_area` SET `Entry`='437', `NameLoc1`='전쟁노래부족 벌목기지', `NameLoc2`='Camp de bûcherons Warsong', `NameLoc3`='Das Holzfällerlager der Warsong', `NameLoc4`='战歌伐木营地', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Лесозаготовки Песни Войны' WHERE (`Entry`='437');
UPDATE `locales_area` SET `Entry`='438', `NameLoc1`='어둠의 나무', `NameLoc2`='L\'Ombrage', `NameLoc3`='Schattengrün', `NameLoc4`='大树荫', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Тенистая Крона' WHERE (`Entry`='438');
UPDATE `locales_area` SET `Entry`='439', `NameLoc1`='소금 평원', `NameLoc2`='Les Salines', `NameLoc3`='Die schimmernde Ebene', `NameLoc4`='闪光平原', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Мерцающая равнина' WHERE (`Entry`='439');
UPDATE `locales_area` SET `Entry`='440', `NameLoc1`='타나리스', `NameLoc2`='Tanaris', `NameLoc3`='Tanaris', `NameLoc4`='塔纳利斯', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Танарис' WHERE (`Entry`='440');
UPDATE `locales_area` SET `Entry`='441', `NameLoc1`='팔라딤 호수', `NameLoc2`='Lac Falathim', `NameLoc3`='Falathimsee', `NameLoc4`='法拉希姆湖', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Озеро Фалатим' WHERE (`Entry`='441');
UPDATE `locales_area` SET `Entry`='442', `NameLoc1`='아우버다인', `NameLoc2`='Auberdine', `NameLoc3`='Auberdine', `NameLoc4`='奥伯丁', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Аубердин' WHERE (`Entry`='442');
UPDATE `locales_area` SET `Entry`='443', `NameLoc1`='마시스트라의 폐허', `NameLoc2`='Ruines de Mathystra', `NameLoc3`='Die Ruinen von Mathystra', `NameLoc4`='玛塞斯特拉废墟', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Руины Матистры' WHERE (`Entry`='443');
UPDATE `locales_area` SET `Entry`='444', `NameLoc1`='알살락스의 탑', `NameLoc2`='Tour d\'Althalaxx', `NameLoc3`='Turm von Althalaxx', `NameLoc4`='奥萨拉克斯之塔', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Башня Алталакса' WHERE (`Entry`='444');
UPDATE `locales_area` SET `Entry`='445', `NameLoc1`='절벽 폭포', `NameLoc2`='Chutes de la Bondissante', `NameLoc3`='Cliffspring Falls', `NameLoc4`='峭壁之泉', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Водопад Скалистый' WHERE (`Entry`='445');
UPDATE `locales_area` SET `Entry`='446', `NameLoc1`='바샬아란', `NameLoc2`='Bashal\'Aran', `NameLoc3`='Bashal\'Aran', `NameLoc4`='巴莎兰', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Башал\'Аран' WHERE (`Entry`='446');
UPDATE `locales_area` SET `Entry`='447', `NameLoc1`='아메스아란', `NameLoc2`='Ameth\'Aran', `NameLoc3`='Ameth\'Aran', `NameLoc4`='亚米萨兰', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Амет\'Аран' WHERE (`Entry`='447');
UPDATE `locales_area` SET `Entry`='448', `NameLoc1`='고대정령의 숲', `NameLoc2`='Bosquet des Anciens', `NameLoc3`='Der Hain der Uralten', `NameLoc4`='古树之林', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Роща Древних' WHERE (`Entry`='448');
UPDATE `locales_area` SET `Entry`='449', `NameLoc1`='지배자의 무덤', `NameLoc2`='Le Glaive du Maître', `NameLoc3`='Die Meistergleve', `NameLoc4`='主宰之剑', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Меч Властителя' WHERE (`Entry`='449');
UPDATE `locales_area` SET `Entry`='450', `NameLoc1`='렘트레블의 발굴현장', `NameLoc2`='Excavations de Remtravel', `NameLoc3`='Remtravels Ausgrabung', `NameLoc4`='雷姆塔维尔挖掘场', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Раскопки рассеянного геолога' WHERE (`Entry`='450');
UPDATE `locales_area` SET `Entry`='452', `NameLoc1`='안개 해안', `NameLoc2`='La lisière des brumes', `NameLoc3`='Nebelrand', `NameLoc4`='薄雾海', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Туманный Предел' WHERE (`Entry`='452');
UPDATE `locales_area` SET `Entry`='453', `NameLoc1`='침식지', `NameLoc2`='Le Lent reflux', `NameLoc3`='Der lange Strand', `NameLoc4`='长桥码头', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Длинный пролив' WHERE (`Entry`='453');
UPDATE `locales_area` SET `Entry`='454', `NameLoc1`='성난굽이 강', `NameLoc2`='La Sinueuse', `NameLoc3`='Wildschnellen', `NameLoc4`='急弯河', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Петляющая река' WHERE (`Entry`='454');
UPDATE `locales_area` SET `Entry`='455', `NameLoc1`='검은나무일족 소굴', `NameLoc2`='Tanière des Noirbois', `NameLoc3`='Bau der Schwarzfelle', `NameLoc4`='黑木洞穴', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Берлога в Чернолесье' WHERE (`Entry`='455');
UPDATE `locales_area` SET `Entry`='456', `NameLoc1`='폭포수 강', `NameLoc2`='La Bondissante', `NameLoc3`='Cliffspring', `NameLoc4`='壁泉河', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Река Скалистая' WHERE (`Entry`='456');
UPDATE `locales_area` SET `Entry`='457', `NameLoc1`='장막의 바다', `NameLoc2`='La Mer voilée', `NameLoc3`='Das verhüllte Meer', `NameLoc4`='迷雾之海', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Сокрытое море' WHERE (`Entry`='457');
UPDATE `locales_area` SET `Entry`='458', `NameLoc1`='황금길', `NameLoc2`='Route de l\'or', `NameLoc3`='Goldstraße', `NameLoc4`='黄金之路', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Золотой Путь' WHERE (`Entry`='458');
UPDATE `locales_area` SET `Entry`='459', `NameLoc1`='붉은십자군 경비초소', `NameLoc2`='Poste de garde de la Croisade', `NameLoc3`='Scharlachroter Wachposten', `NameLoc4`='血色十字军哨岗', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Сторожевой пост Алого ордена' WHERE (`Entry`='459');
UPDATE `locales_area` SET `Entry`='460', `NameLoc1`='해바위 야영지', `NameLoc2`='Retraite de Roche-Soleil', `NameLoc3`='Sonnenfels', `NameLoc4`='烈日石居', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Приют у Солнечного Камня' WHERE (`Entry`='460');
UPDATE `locales_area` SET `Entry`='461', `NameLoc1`='칼바람 바위산', `NameLoc2`='Combe des Cisailles', `NameLoc3`='Die Scherwindklippe', `NameLoc4`='狂风峭壁', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Утес Ветрорезов' WHERE (`Entry`='461');
UPDATE `locales_area` SET `Entry`='463', `NameLoc1`='바위웅덩이 호수', `NameLoc2`='Lac de la Combe', `NameLoc3`='Felskesselsee', `NameLoc4`='峭壁湖', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Скалистое озеро' WHERE (`Entry`='463');
UPDATE `locales_area` SET `Entry`='464', `NameLoc1`='땅거미 호수', `NameLoc2`='Lac Mirkfallon', `NameLoc3`='Mirkfallonsee', `NameLoc4`='暗色湖', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Мутное озеро' WHERE (`Entry`='464');
UPDATE `locales_area` SET `Entry`='465', `NameLoc1`='잿더미 계곡', `NameLoc2`='Le Val calciné', `NameLoc3`='Das verbrannte Tal', `NameLoc4`='焦炭谷', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Обугленная долина' WHERE (`Entry`='465');
UPDATE `locales_area` SET `Entry`='466', `NameLoc1`='혈폭풍일족의 골짜기', `NameLoc2`='Vallée des Rouges-furies', `NameLoc3`='Tal der Blutfurien', `NameLoc4`='血怒峡谷', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Долина Кровавой Ярости' WHERE (`Entry`='466');
UPDATE `locales_area` SET `Entry`='467', `NameLoc1`='돌발톱 봉우리', `NameLoc2`='Pic des Serres-Rocheuses', `NameLoc3`='Der Steinkrallengipfel', `NameLoc4`='石爪峰', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Пик Каменного Когтя' WHERE (`Entry`='467');
UPDATE `locales_area` SET `Entry`='468', `NameLoc1`='갈퀴발톱굴', `NameLoc2`='L\'antre des Serres', `NameLoc3`='Der Krallenbau', `NameLoc4`='猛禽洞穴', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Логово Когтя' WHERE (`Entry`='468');
UPDATE `locales_area` SET `Entry`='469', `NameLoc1`='큰소나무 계곡', `NameLoc2`='Val de Grandbois', `NameLoc3`='Hochwipfeltal', `NameLoc4`='巨木谷', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Долина Высокого леса' WHERE (`Entry`='469');
UPDATE `locales_area` SET `Entry`='470', `NameLoc1`='썬더 블러프', `NameLoc2`='Thunder Bluff UNUSED', `NameLoc3`='Thunder Bluff UNUSED', `NameLoc4`='雷霆崖', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Громовой Утес НЕ ИСПОЛЬЗУЕТСЯ' WHERE (`Entry`='470');
UPDATE `locales_area` SET `Entry`='471', `NameLoc1`='용사의 바람절벽', `NameLoc2`='Mesa de Brave-vent', `NameLoc3`='Brave Wind Mesa', `NameLoc4`='强风台地', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Плато Дерзкого Ветра' WHERE (`Entry`='471');
UPDATE `locales_area` SET `Entry`='472', `NameLoc1`='부싯돌 고원', `NameLoc2`='Mesa de Pierrefeu', `NameLoc3`='Fire Stone Mesa', `NameLoc4`='火石台地', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Плато Огненного Камня' WHERE (`Entry`='472');
UPDATE `locales_area` SET `Entry`='473', `NameLoc1`='바람막이 바위', `NameLoc2`='Roc de Mantle', `NameLoc3`='Mantle Rock', `NameLoc4`='披肩石', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Скала Мантия' WHERE (`Entry`='473');
UPDATE `locales_area` SET `Entry`='474', `NameLoc1`='수렵의 봉우리', `NameLoc2`='Hunter Rise UNUSED', `NameLoc3`='Hunter Rise UNUSED', `NameLoc4`='猎人高地', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Вершина Охотников НЕ ИСПОЛЬЗУЕТСЯ' WHERE (`Entry`='474');
UPDATE `locales_area` SET `Entry`='475', `NameLoc1`='정기의 봉우리', `NameLoc2`='Spirit RiseUNUSED', `NameLoc3`='Spirit RiseUNUSED', `NameLoc4`='Spirit RiseUNUSED', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Уступ Духов НЕ ИСПОЛЬЗУЕТСЯ' WHERE (`Entry`='475');
UPDATE `locales_area` SET `Entry`='476', `NameLoc1`='장로의 봉우리', `NameLoc2`='Elder RiseUNUSED', `NameLoc3`='Elder RiseUNUSED', `NameLoc4`='长者高地', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Вершина Старейшин НЕ ИСПОЛЬЗУЕТСЯ' WHERE (`Entry`='476');
UPDATE `locales_area` SET `Entry`='477', `NameLoc1`='주부왈의 폐허', `NameLoc2`='Ruines de Jubuwal', `NameLoc3`='Ruinen von Jubuwal', `NameLoc4`='朱布瓦尔废墟', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Руины Жубуваля' WHERE (`Entry`='477');
UPDATE `locales_area` SET `Entry`='478', `NameLoc1`='아리스리엔 연못', `NameLoc2`='Bassins d\'Arlithrien', `NameLoc3`='Teiche von Arlithrien', `NameLoc4`='阿里斯瑞恩之池', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Пруды Арлитриэна' WHERE (`Entry`='478');
UPDATE `locales_area` SET `Entry`='479', `NameLoc1`='녹슨망치 발굴현장', `NameLoc2`='Site de fouilles de Rustmaul', `NameLoc3`='Die Rustmaul-Grabungsstätte', `NameLoc4`='锈锤挖掘场', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Карьер Ржавой Кувалды' WHERE (`Entry`='479');
UPDATE `locales_area` SET `Entry`='480', `NameLoc1`='에톡 야영지', `NameLoc2`='Camp E\'thok', `NameLoc3`='Camp E\'thok', `NameLoc4`='伊索克营地', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Лагерь Э\'Ток' WHERE (`Entry`='480');
UPDATE `locales_area` SET `Entry`='481', `NameLoc1`='갈래발굽 바윗골', `NameLoc2`='Combe du Sabot fendu', `NameLoc3`='Spalthufklippe', `NameLoc4`='裂蹄峭壁', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Утес Треснувшего Копыта' WHERE (`Entry`='481');
UPDATE `locales_area` SET `Entry`='482', `NameLoc1`='마루둥지', `NameLoc2`='Haut-perchoir', `NameLoc3`='Der Steilhang', `NameLoc4`='风巢', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Скальное гнездовье' WHERE (`Entry`='482');
UPDATE `locales_area` SET `Entry`='483', `NameLoc1`='회오리 협곡', `NameLoc2`='Canyon des hurlements', `NameLoc3`='Der kreischende Canyon', `NameLoc4`='尖啸峡谷', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Каньон Визга' WHERE (`Entry`='483');
UPDATE `locales_area` SET `Entry`='484', `NameLoc1`='높새바람 봉우리', `NameLoc2`='Poste de Librevent', `NameLoc3`='Freiwindposten', `NameLoc4`='乱风岗', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Застава Вольного Ветра' WHERE (`Entry`='484');
UPDATE `locales_area` SET `Entry`='485', `NameLoc1`='구름 승강장', `NameLoc2`='La Grande élévation', `NameLoc3`='Der große Aufzug', `NameLoc4`='升降梯', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Великий Подъемник' WHERE (`Entry`='485');
UPDATE `locales_area` SET `Entry`='486', `NameLoc1`='갈라크 소굴', `NameLoc2`='Repaire des Galak', `NameLoc3`='Galakhöhle', `NameLoc4`='加拉克城堡', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Форт Галак' WHERE (`Entry`='486');
UPDATE `locales_area` SET `Entry`='487', `NameLoc1`='하피 동굴', `NameLoc2`='Tanière des Volplumes', `NameLoc3`='Bau der Wildfedern', `NameLoc4`='飞羽洞穴', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Логово Легкоперых' WHERE (`Entry`='487');
UPDATE `locales_area` SET `Entry`='488', `NameLoc1`='비바람 바위굴', `NameLoc2`='La niche érodée', `NameLoc3`='Der Wetterwinkel', `NameLoc4`='老屋', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Угол Семи Ветров' WHERE (`Entry`='488');
UPDATE `locales_area` SET `Entry`='489', `NameLoc1`='탈라나르', `NameLoc2`='Thalanaar', `NameLoc3`='Thalanaar', `NameLoc4`='萨兰纳尔', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Таланаар' WHERE (`Entry`='489');
UPDATE `locales_area` SET `Entry`='490', `NameLoc1`='운고로 분화구', `NameLoc2`='Cratère d\'Un\'Goro', `NameLoc3`='Un\'Goro-Krater', `NameLoc4`='安戈洛环形山', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Кратер Ун\'Горо' WHERE (`Entry`='490');
UPDATE `locales_area` SET `Entry`='491', `NameLoc1`='가시덩굴 우리', `NameLoc2`='Kraal de Tranchebauge', `NameLoc3`='Der Kral von Razorfen', `NameLoc4`='剃刀沼泽', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Лабиринты Иглошкурых' WHERE (`Entry`='491');
UPDATE `locales_area` SET `Entry`='492', `NameLoc1`='까마귀 언덕 묘지', `NameLoc2`='Cimetière de Colline-aux-Corbeaux', `NameLoc3`='Friedhof von Rabenflucht', `NameLoc4`='乌鸦岭墓地', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Кладбище Вороньего Холма' WHERE (`Entry`='492');
UPDATE `locales_area` SET `Entry`='493', `NameLoc1`='달의 숲', `NameLoc2`='Reflet-de-Lune (Moonglade)', `NameLoc3`='Moonglade', `NameLoc4`='月光林地', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Лунная поляна' WHERE (`Entry`='493');
UPDATE `locales_area` SET `Entry`='495', `NameLoc1`='DELETE ME', `NameLoc2`='SUPPRIMEZ-MOI', `NameLoc3`='DELETE ME', `NameLoc4`='DELETE ME', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Удалите МЕНЯ' WHERE (`Entry`='495');
UPDATE `locales_area` SET `Entry`='496', `NameLoc1`='담쟁이 마을', `NameLoc2`='Mur-de-Fougères', `NameLoc3`='Brackenwall', `NameLoc4`='蕨墙村', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Деревня Гиблотопь' WHERE (`Entry`='496');
UPDATE `locales_area` SET `Entry`='497', `NameLoc1`='늪지기 오두막', `NameLoc2`='Manoir des Flammeroles', `NameLoc3`='Swamplight-Anwesen', `NameLoc4`='水光庄园', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Сторожка \"Болотный огонек\"' WHERE (`Entry`='497');
UPDATE `locales_area` SET `Entry`='498', `NameLoc1`='붉은늪지 동굴', `NameLoc2`='Terrier des Rougefanges', `NameLoc3`='Blutsumpfbau', `NameLoc4`='鲜血沼泽墓穴', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Логово Кровавой Топи' WHERE (`Entry`='498');
UPDATE `locales_area` SET `Entry`='499', `NameLoc1`='암흑안개 거미굴', `NameLoc2`='Caverne de Sombrebrume', `NameLoc3`='Graunebelhöhlen', `NameLoc4`='黑雾洞穴', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Мглистая пещера' WHERE (`Entry`='499');
UPDATE `locales_area` SET `Entry`='500', `NameLoc1`='모글 야영지', `NameLoc2`='Cap Moggle', `NameLoc3`='Moggle-Spitze', `NameLoc4`='摩戈尔哨塔', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Вершина Моггл' WHERE (`Entry`='500');
UPDATE `locales_area` SET `Entry`='501', `NameLoc1`='비질의 추락지', `NameLoc2`='Epave de Beezil', `NameLoc3`='Beezils Wrack', `NameLoc4`='比吉尔的飞艇残骸', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Место крушения Бизиля' WHERE (`Entry`='501');
UPDATE `locales_area` SET `Entry`='502', `NameLoc1`='마녀 언덕', `NameLoc2`='Colline des sorcières', `NameLoc3`='Hexenhügel', `NameLoc4`='女巫岭', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Ведьмин холм' WHERE (`Entry`='502');
UPDATE `locales_area` SET `Entry`='503', `NameLoc1`='감시초소', `NameLoc2`='Halte de la Vigie', `NameLoc3`='Späherwacht', `NameLoc4`='警戒哨岗', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Сторожевой пост' WHERE (`Entry`='503');
UPDATE `locales_area` SET `Entry`='504', `NameLoc1`='북부 경비탑', `NameLoc2`='Tour de la halte nord', `NameLoc3`='Nordwacht', `NameLoc4`='北点哨塔', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Северная башня' WHERE (`Entry`='504');
UPDATE `locales_area` SET `Entry`='505', `NameLoc1`='서부 경비탑', `NameLoc2`='Tour du cap ouest', `NameLoc3`='Westwacht', `NameLoc4`='西点哨塔', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Западная башня' WHERE (`Entry`='505');
UPDATE `locales_area` SET `Entry`='506', `NameLoc1`='버려진 경비탑', `NameLoc2`='Halte perdue', `NameLoc3`='Die verlassene Wacht', `NameLoc4`='废弃哨塔', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Разрушенная башня' WHERE (`Entry`='506');
UPDATE `locales_area` SET `Entry`='507', `NameLoc1`='푸른늪지', `NameLoc2`='Marais bleu', `NameLoc3`='Blaumoor', `NameLoc4`='蓝色沼泽', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Синяя топь' WHERE (`Entry`='507');
UPDATE `locales_area` SET `Entry`='508', `NameLoc1`='돌망치일족 폐허', `NameLoc2`='Ruines Cognepierres', `NameLoc3`='Die Stonemaul Ruinen', `NameLoc4`='石槌废墟', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Руины Деревни Каменного Молота' WHERE (`Entry`='508');
UPDATE `locales_area` SET `Entry`='509', `NameLoc1`='화염의 둥지', `NameLoc2`='L\'Antre des flammes', `NameLoc3`='Der Flammenbau', `NameLoc4`='火焰洞穴', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Огненное логово' WHERE (`Entry`='509');
UPDATE `locales_area` SET `Entry`='510', `NameLoc1`='용의 늪', `NameLoc2`='Le cloaque aux dragons', `NameLoc3`='Das Drachendüster', `NameLoc4`='黑龙谷', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Земля Драконов' WHERE (`Entry`='510');
UPDATE `locales_area` SET `Entry`='511', `NameLoc1`='용의 둥지', `NameLoc2`='Tourbière du Ver', `NameLoc3`='Der Drachensumpf', `NameLoc4`='巨龙沼泽', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Драконьи топи' WHERE (`Entry`='511');
UPDATE `locales_area` SET `Entry`='512', `NameLoc1`='오닉시아의 둥지', `NameLoc2`='Onyxia\'s Lair UNUSED', `NameLoc3`='Onyxia\'s Lair UNUSED', `NameLoc4`='奥妮克希亚的巢穴', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Логово Ониксии НЕ ИСПОЛЬЗУЕТСЯ' WHERE (`Entry`='512');
UPDATE `locales_area` SET `Entry`='513', `NameLoc1`='테라모어 섬', `NameLoc2`='Ile de Theramore', `NameLoc3`='Die Insel Theramore', `NameLoc4`='塞拉摩岛', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Остров Терамор' WHERE (`Entry`='513');
UPDATE `locales_area` SET `Entry`='514', `NameLoc1`='거점 요새', `NameLoc2`='Citadelle de Theramore', `NameLoc3`='Foothold-Zitadelle', `NameLoc4`='塞拉摩堡垒', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Цитадель' WHERE (`Entry`='514');
UPDATE `locales_area` SET `Entry`='515', `NameLoc1`='철갑 감옥', `NameLoc2`='Prison du cuirassé', `NameLoc3`='Ironclad-Gefängnis', `NameLoc4`='铁栏监狱', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Потайная бухта' WHERE (`Entry`='515');
UPDATE `locales_area` SET `Entry`='516', `NameLoc1`='먼지진흙 만', `NameLoc2`='Baie d\'Âprefange', `NameLoc3`='Dustwallow Bay', `NameLoc4`='尘泥海湾', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Пылевая бухта' WHERE (`Entry`='516');
UPDATE `locales_area` SET `Entry`='517', `NameLoc1`='성난파도 만', `NameLoc2`='Crique du Mascaret', `NameLoc3`='Tidefury-Bucht', `NameLoc4`='狂潮湾', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Залив Яростных Волн' WHERE (`Entry`='517');
UPDATE `locales_area` SET `Entry`='518', `NameLoc1`='몸서리 해안', `NameLoc2`='Rivage de Troubleffroi', `NameLoc3`='Dreadmurk Shore', `NameLoc4`='恐惧海岸', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Зловещий берег' WHERE (`Entry`='518');
UPDATE `locales_area` SET `Entry`='536', `NameLoc1`='에이들의 은신처', `NameLoc2`='Ferme des Addle', `NameLoc3`='Addles Siedlung', `NameLoc4`='腐草农场', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Участок Эддла' WHERE (`Entry`='536');
UPDATE `locales_area` SET `Entry`='537', `NameLoc1`='불기둥 마루', `NameLoc2`='Crête de la Fournaise', `NameLoc3`='Der Feuerfedergrat', `NameLoc4`='火羽山', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Вулкан Огненного Венца' WHERE (`Entry`='537');
UPDATE `locales_area` SET `Entry`='538', `NameLoc1`='락카리 잿구덩이', `NameLoc2`='Fosses de goudron de Lakkari', `NameLoc3`='Teergruben von Lakkari', `NameLoc4`='拉卡利油沼', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Смоляные ямы Лаккари' WHERE (`Entry`='538');
UPDATE `locales_area` SET `Entry`='539', `NameLoc1`='공포의 터', `NameLoc2`='Coteaux de la terreur', `NameLoc3`='Terrorflucht', `NameLoc4`='恐惧小道', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Путь Ужаса' WHERE (`Entry`='539');
UPDATE `locales_area` SET `Entry`='540', `NameLoc1`='갈래굽이 구렁', `NameLoc2`='La Balafre sinueuse', `NameLoc3`='Die wuchernde Narbe', `NameLoc4`='巨痕谷', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Скользкий овраг' WHERE (`Entry`='540');
UPDATE `locales_area` SET `Entry`='541', `NameLoc1`='마샬의 야영지', `NameLoc2`='Refuge des Marshal', `NameLoc3`='Marshals Zuflucht', `NameLoc4`='马绍尔营地', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Укрытие Маршалла' WHERE (`Entry`='541');
UPDATE `locales_area` SET `Entry`='542', `NameLoc1`='버섯 바위굴', `NameLoc2`='Rocher fongique', `NameLoc3`='Fungusfels', `NameLoc4`='蘑菇石', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Пещера Лишайников' WHERE (`Entry`='542');
UPDATE `locales_area` SET `Entry`='543', `NameLoc1`='골락카 간헐천', `NameLoc2`='Sources de Golakka', `NameLoc3`='Die heißen Quellen von Golakka', `NameLoc4`='葛拉卡温泉', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Горячие источники Голакка' WHERE (`Entry`='543');
UPDATE `locales_area` SET `Entry`='556', `NameLoc1`='대호수', `NameLoc2`='Le Loch', `NameLoc3`='Der Loch', `NameLoc4`='洛克湖', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Озеро Лок' WHERE (`Entry`='556');
UPDATE `locales_area` SET `Entry`='576', `NameLoc1`='부랑자 소굴', `NameLoc2`='Repaire des mendiants', `NameLoc3`='Bettlerschlupfwinkel', `NameLoc4`='乞丐鬼屋', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Приют Бродяги' WHERE (`Entry`='576');
UPDATE `locales_area` SET `Entry`='596', `NameLoc1`='코도 무덤', `NameLoc2`='Cimetière des kodos', `NameLoc3`='Der Kodofriedhof', `NameLoc4`='科多兽坟场', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Кладбище кодо' WHERE (`Entry`='596');
UPDATE `locales_area` SET `Entry`='597', `NameLoc1`='침묵의 초소', `NameLoc2`='Poste de Rôdeur-fantôme', `NameLoc3`='Geistwandlerposten', `NameLoc4`='幽灵岗哨', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Застава Скитающихся Духов' WHERE (`Entry`='597');
UPDATE `locales_area` SET `Entry`='598', `NameLoc1`='살데리스 해안', `NameLoc2`='Grève de Sar\'theris', `NameLoc3`='Sar\'theris-Strand', `NameLoc4`='萨瑟里斯海岸', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Побережье Сар\'Терис' WHERE (`Entry`='598');
UPDATE `locales_area` SET `Entry`='599', `NameLoc1`='천둥도끼 요새', `NameLoc2`='Forteresse de Hache-Tonnerre', `NameLoc3`='Festung Thunder Axe', `NameLoc4`='雷斧堡垒', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Крепость Громового Топора' WHERE (`Entry`='599');
UPDATE `locales_area` SET `Entry`='600', `NameLoc1`='볼간의 구덩이', `NameLoc2`='Trou de Bolgan', `NameLoc3`='Bolgans Loch', `NameLoc4`='波尔甘的洞穴', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Пещера Болгана' WHERE (`Entry`='600');
UPDATE `locales_area` SET `Entry`='602', `NameLoc1`='만노로크 소굴', `NameLoc2`='Convent de Mannoroc', `NameLoc3`='Mannorocs Koven', `NameLoc4`='玛诺洛克集会所', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Поле Маннорок' WHERE (`Entry`='602');
UPDATE `locales_area` SET `Entry`='603', `NameLoc1`='살게론', `NameLoc2`='Sargeron', `NameLoc3`='Sargeron', `NameLoc4`='萨格隆', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Саргерон' WHERE (`Entry`='603');
UPDATE `locales_area` SET `Entry`='604', `NameLoc1`='마그람 마을', `NameLoc2`='Village des Magram', `NameLoc3`='Magram', `NameLoc4`='玛格拉姆村', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Деревня Маграм' WHERE (`Entry`='604');
UPDATE `locales_area` SET `Entry`='606', `NameLoc1`='겔키스 마을', `NameLoc2`='Village des Gelkis', `NameLoc3`='Gelkis', `NameLoc4`='吉尔吉斯村', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Деревня Гелкис' WHERE (`Entry`='606');
UPDATE `locales_area` SET `Entry`='607', `NameLoc1`='뾰족바위 골짜기', `NameLoc2`='Vallée des Lances', `NameLoc3`='Das Tal der Speere', `NameLoc4`='长矛谷', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Долина Копий' WHERE (`Entry`='607');
UPDATE `locales_area` SET `Entry`='608', `NameLoc1`='나이젤의 야영지', `NameLoc2`='Combe de Nijel', `NameLoc3`='Die Nijelspitze', `NameLoc4`='尼耶尔前哨站', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Высота Найджела' WHERE (`Entry`='608');
UPDATE `locales_area` SET `Entry`='609', `NameLoc1`='콜카르 마을', `NameLoc2`='Village des Kolkar', `NameLoc3`='Kolkar', `NameLoc4`='科尔卡村', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Деревня Колкар' WHERE (`Entry`='609');
UPDATE `locales_area` SET `Entry`='616', `NameLoc1`='하이잘 산', `NameLoc2`='Hyjal', `NameLoc3`='Hyjal', `NameLoc4`='海加尔山', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Хиджал' WHERE (`Entry`='616');
UPDATE `locales_area` SET `Entry`='618', `NameLoc1`='여명의 설원', `NameLoc2`='Berceau-de-l\'Hiver (Winterspring)', `NameLoc3`='Winterspring', `NameLoc4`='冬泉谷', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Зимние Ключи' WHERE (`Entry`='618');
UPDATE `locales_area` SET `Entry`='636', `NameLoc1`='검은늑대 강', `NameLoc2`='Fleuve Loup-noir', `NameLoc3`='Schwarzwolfschnellen', `NameLoc4`='黑狼河', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Волчья река' WHERE (`Entry`='636');
UPDATE `locales_area` SET `Entry`='637', `NameLoc1`='코도 바위', `NameLoc2`='Rocher des kodos', `NameLoc3`='Kodofels', `NameLoc4`='科多石', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Дольмен Кодо' WHERE (`Entry`='637');
UPDATE `locales_area` SET `Entry`='638', `NameLoc1`='비밀의 길', `NameLoc2`='Chemin secret', `NameLoc3`='Verborgener Pfad', `NameLoc4`='秘道', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Потайная тропа' WHERE (`Entry`='638');
UPDATE `locales_area` SET `Entry`='639', `NameLoc1`='정기 바위', `NameLoc2`='Rocher des esprits', `NameLoc3`='Geisterfelsen', `NameLoc4`='灵魂石地', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Священный Камень' WHERE (`Entry`='639');
UPDATE `locales_area` SET `Entry`='640', `NameLoc1`='희미한 불꽃의 제단', `NameLoc2`='Autel de la flamme dormante', `NameLoc3`='Schrein der schlafenden Flamme', `NameLoc4`='眠炎圣殿', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Святилище Дремлющего Пламени' WHERE (`Entry`='640');
UPDATE `locales_area` SET `Entry`='656', `NameLoc1`='엘룬아라 호수', `NameLoc2`='Lac Elune\'ara', `NameLoc3`='Der Elune\'ara See', `NameLoc4`='月神湖', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Озеро Элуне\'ара' WHERE (`Entry`='656');
UPDATE `locales_area` SET `Entry`='657', `NameLoc1`='피난처', `NameLoc2`='Le Havre boueux', `NameLoc3`='Der sichere Hafen', `NameLoc4`='避难营', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Убежище' WHERE (`Entry`='657');
UPDATE `locales_area` SET `Entry`='676', `NameLoc1`='아웃랜드', `NameLoc2`='Outreterre', `NameLoc3`='Scherbenwelt', `NameLoc4`='外域', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Запределье' WHERE (`Entry`='676');
UPDATE `locales_area` SET `Entry`='696', `NameLoc1`='장인의 정원', `NameLoc2`='Craftsmen\'s Terrace UNUSED', `NameLoc3`='Craftsmen\'s Terrace UNUSED', `NameLoc4`='工匠区', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Терраса ремесленников НЕ ИСПОЛЬЗУЕТСЯ' WHERE (`Entry`='696');
UPDATE `locales_area` SET `Entry`='697', `NameLoc1`='상인의 정원', `NameLoc2`='Tradesmen\'s Terrace UNUSED', `NameLoc3`='Tradesmen\'s Terrace UNUSED', `NameLoc4`='贸易区', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Терраса торговцев НЕ ИСПОЛЬЗУЕТСЯ' WHERE (`Entry`='697');
UPDATE `locales_area` SET `Entry`='698', `NameLoc1`='신전 정원', `NameLoc2`='The Temple Gardens UNUSED', `NameLoc3`='The Temple Gardens UNUSED', `NameLoc4`='神庙花园', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Храмовые сады НЕ ИСПОЛЬЗУЕТСЯ' WHERE (`Entry`='698');
UPDATE `locales_area` SET `Entry`='699', `NameLoc1`='엘룬의 신전', `NameLoc2`='Temple of Elune UNUSED', `NameLoc3`='Temple of Elune UNUSED', `NameLoc4`='月神殿', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Храм Элуны НЕ ИСПОЛЬЗУЕТСЯ' WHERE (`Entry`='699');
UPDATE `locales_area` SET `Entry`='700', `NameLoc1`='세나리온 자치령', `NameLoc2`='Cenarion Enclave UNUSED', `NameLoc3`='Cenarion Enclave UNUSED', `NameLoc4`='Cenarion Enclave UNUSED', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Анклав Кенария НЕ ИСПОЛЬЗУЕТСЯ' WHERE (`Entry`='700');
UPDATE `locales_area` SET `Entry`='701', `NameLoc1`='전사의 정원', `NameLoc2`='Warrior\'s Terrace UNUSED', `NameLoc3`='Warrior\'s Terrace UNUSED', `NameLoc4`='Warrior\'s Terrace UNUSED', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Терраса Воинов НЕ ИСПОЛЬЗУЕТСЯ' WHERE (`Entry`='701');
UPDATE `locales_area` SET `Entry`='702', `NameLoc1`='루테란 마을', `NameLoc2`='Rut\'theran', `NameLoc3`='Rut\'theran', `NameLoc4`='鲁瑟兰村', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Деревня Рут\'теран' WHERE (`Entry`='702');
UPDATE `locales_area` SET `Entry`='716', `NameLoc1`='아이언밴드 야영지', `NameLoc2`='Base d\'Ironband', `NameLoc3`='Ironbands Truppenlager', `NameLoc4`='铁环营地', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Мастерская Сталекрута' WHERE (`Entry`='716');
UPDATE `locales_area` SET `Entry`='717', `NameLoc1`='스톰윈드 지하감옥', `NameLoc2`='La Prison', `NameLoc3`='Das Verlies', `NameLoc4`='监狱', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Тюрьма' WHERE (`Entry`='717');
UPDATE `locales_area` SET `Entry`='718', `NameLoc1`='통곡의 동굴', `NameLoc2`='Cavernes des lamentations', `NameLoc3`='Die Höhlen des Wehklagens', `NameLoc4`='哀嚎洞穴', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Пещеры Стенаний' WHERE (`Entry`='718');
UPDATE `locales_area` SET `Entry`='719', `NameLoc1`='검은심연의 나락', `NameLoc2`='Profondeurs de Brassenoire', `NameLoc3`='Blackfathom-Tiefe', `NameLoc4`='黑暗深渊', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Непроглядная Пучина' WHERE (`Entry`='719');
UPDATE `locales_area` SET `Entry`='720', `NameLoc1`='격투의 섬', `NameLoc2`='Ile de la Dispute', `NameLoc3`='Prügel-Eiland', `NameLoc4`='勇士岛', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Остров Битв' WHERE (`Entry`='720');
UPDATE `locales_area` SET `Entry`='721', `NameLoc1`='놈리건', `NameLoc2`='Gnomeregan', `NameLoc3`='Gnomeregan', `NameLoc4`='诺莫瑞根', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Гномреган' WHERE (`Entry`='721');
UPDATE `locales_area` SET `Entry`='722', `NameLoc1`='가시덩굴 구릉', `NameLoc2`='Souilles de Tranchebauge', `NameLoc3`='Die Hügel von Razorfen', `NameLoc4`='剃刀高地', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Курганы Иглошкурых' WHERE (`Entry`='722');
UPDATE `locales_area` SET `Entry`='736', `NameLoc1`='바네실 동굴', `NameLoc2`='Creux de Ban\'ethil', `NameLoc3`='Ban\'ethil Hollow', `NameLoc4`='班尼希尔山谷', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Лощина Бен\'этиль' WHERE (`Entry`='736');
UPDATE `locales_area` SET `Entry`='796', `NameLoc1`='붉은십자군 수도원', `NameLoc2`='Monastère écarlate', `NameLoc3`='Das scharlachrote Kloster', `NameLoc4`='血色修道院', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Монастырь Алого ордена' WHERE (`Entry`='796');
UPDATE `locales_area` SET `Entry`='797', `NameLoc1`='제로드 선착장', `NameLoc2`='Le Débarcadère de Jerod', `NameLoc3`='Jerods Anlegestelle', `NameLoc4`='杰罗德码头', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Лагерь Джерода' WHERE (`Entry`='797');
UPDATE `locales_area` SET `Entry`='798', `NameLoc1`='마루목 감시탑', `NameLoc2`='Tour de la Crête', `NameLoc3`='Kammwacht', `NameLoc4`='山巅之塔', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Дозорная башня' WHERE (`Entry`='798');
UPDATE `locales_area` SET `Entry`='799', `NameLoc1`='어스름 강둑', `NameLoc2`='La Rive sombre', `NameLoc3`='Das dunkle Ufer', `NameLoc4`='暗色河滩', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Темный берег' WHERE (`Entry`='799');
UPDATE `locales_area` SET `Entry`='800', `NameLoc1`='눈마루 고개', `NameLoc2`='Passe des Frigères', `NameLoc3`='Coldridgepass', `NameLoc4`='寒脊山小径', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Туннель Холодной долины' WHERE (`Entry`='800');
UPDATE `locales_area` SET `Entry`='801', `NameLoc1`='찬바람 골짜기', `NameLoc2`='Vallée de la bise', `NameLoc3`='Chillbreezetal', `NameLoc4`='寒风峡谷', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Долина Промозглого Ветра' WHERE (`Entry`='801');
UPDATE `locales_area` SET `Entry`='802', `NameLoc1`='쉼머 마루', `NameLoc2`='Crête scintillante', `NameLoc3`='Schimmergrat', `NameLoc4`='闪光岭', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Мерцающий хребет' WHERE (`Entry`='802');
UPDATE `locales_area` SET `Entry`='803', `NameLoc1`='앰버스틸 목장', `NameLoc2`='Ferme des Amberstill', `NameLoc3`='Amberstill-Ranch', `NameLoc4`='冻石农场', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Ферма Янтарленов' WHERE (`Entry`='803');
UPDATE `locales_area` SET `Entry`='804', `NameLoc1`='툰드리드 언덕', `NameLoc2`='Les Collines de Tundrid', `NameLoc3`='Die Tundrid-Hügel', `NameLoc4`='冻土岭', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Холмы Тандрид' WHERE (`Entry`='804');
UPDATE `locales_area` SET `Entry`='805', `NameLoc1`='남부 관문 통행로', `NameLoc2`='Passage de la porte Sud', `NameLoc3`='Südtorpass', `NameLoc4`='南门小径', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Южные врата' WHERE (`Entry`='805');
UPDATE `locales_area` SET `Entry`='806', `NameLoc1`='남부 관문 전초기지', `NameLoc2`='Avant-poste de la porte Sud', `NameLoc3`='Südtoraußenposten', `NameLoc4`='南门哨岗', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Застава у Южных врат' WHERE (`Entry`='806');
UPDATE `locales_area` SET `Entry`='807', `NameLoc1`='북부 관문 통행로', `NameLoc2`='Passage de la porte Nord', `NameLoc3`='Nordtorpass', `NameLoc4`='北门小径', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Северные врата' WHERE (`Entry`='807');
UPDATE `locales_area` SET `Entry`='808', `NameLoc1`='북부 관문 전초기지', `NameLoc2`='Avant-poste de la porte Nord', `NameLoc3`='Nordtoraußenposten', `NameLoc4`='北门哨岗', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Застава у Северных врат' WHERE (`Entry`='808');
UPDATE `locales_area` SET `Entry`='809', `NameLoc1`='아이언포지 성문', `NameLoc2`='Portes d\'Ironforge', `NameLoc3`='Tore von Ironforge', `NameLoc4`='铁炉堡大门', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Врата Стальгорна' WHERE (`Entry`='809');
UPDATE `locales_area` SET `Entry`='810', `NameLoc1`='고요의 연못', `NameLoc2`='Etang immobile', `NameLoc3`='Stillwassertümpel', `NameLoc4`='静水池', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Тихий Омут' WHERE (`Entry`='810');
UPDATE `locales_area` SET `Entry`='811', `NameLoc1`='악몽의 골짜기', `NameLoc2`='Vallée des cauchemars', `NameLoc3`='Alptraumtal', `NameLoc4`='噩梦谷', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Долина Кошмаров' WHERE (`Entry`='811');
UPDATE `locales_area` SET `Entry`='812', `NameLoc1`='독그물 골짜기', `NameLoc2`='Vallée de Tissevenin', `NameLoc3`='Giftwebertal', `NameLoc4`='毒蛛峡谷', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Долина ядовитых пауков' WHERE (`Entry`='812');
UPDATE `locales_area` SET `Entry`='813', `NameLoc1`='보루', `NameLoc2`='La Barricade', `NameLoc3`='Das Bollwerk', `NameLoc4`='亡灵壁垒', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Бастион' WHERE (`Entry`='813');
UPDATE `locales_area` SET `Entry`='814', `NameLoc1`='분노의 강', `NameLoc2`='Fleuve Furie-du-Sud', `NameLoc3`='Der Südstrom', `NameLoc4`='怒水河', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Река Строптивая' WHERE (`Entry`='814');
UPDATE `locales_area` SET `Entry`='815', `NameLoc1`='분노의 강', `NameLoc2`='Fleuve Furie-du-Sud', `NameLoc3`='Der Südstrom', `NameLoc4`='怒水河', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Река Строптивая' WHERE (`Entry`='815');
UPDATE `locales_area` SET `Entry`='816', `NameLoc1`='서슬갈기일족 영토', `NameLoc2`='Terres des Tranchecrins', `NameLoc3`='Revier der Grimmhauer', `NameLoc4`='钢鬃营地', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Земли Иглогривых' WHERE (`Entry`='816');
UPDATE `locales_area` SET `Entry`='817', `NameLoc1`='해골 바위굴', `NameLoc2`='Rocher du crâne', `NameLoc3`='Die Knochenhöhle', `NameLoc4`='骷髅石', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Скала Черепа' WHERE (`Entry`='817');
UPDATE `locales_area` SET `Entry`='818', `NameLoc1`='회색갈기일족 바위굴', `NameLoc2`='Rocher des crins-pâles', `NameLoc3`='Bleichmähnenfels', `NameLoc4`='白鬃石', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Утес Бледногривов' WHERE (`Entry`='818');
UPDATE `locales_area` SET `Entry`='819', `NameLoc1`='성난바람 마루', `NameLoc2`='Crête des Furies-des-vents', `NameLoc3`='Windfurienkamm', `NameLoc4`='狂风山', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Гряда Неистовства Ветра' WHERE (`Entry`='819');
UPDATE `locales_area` SET `Entry`='820', `NameLoc1`='황금 초원', `NameLoc2`='Les plaines dorées', `NameLoc3`='Die goldenen Ebenen', `NameLoc4`='金色平原', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Золотые равнины' WHERE (`Entry`='820');
UPDATE `locales_area` SET `Entry`='821', `NameLoc1`='구릉 초원', `NameLoc2`='Les plaines vallonnées', `NameLoc3`='Die wogenden Ebenen', `NameLoc4`='草海平原', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Холмистые равнины' WHERE (`Entry`='821');
UPDATE `locales_area` SET `Entry`='836', `NameLoc1`='던 알가즈', `NameLoc2`='Dun Algaz', `NameLoc3`='Dun Algaz', `NameLoc4`='丹奥加兹', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Дун Альгаз' WHERE (`Entry`='836');
UPDATE `locales_area` SET `Entry`='837', `NameLoc1`='던 알가즈', `NameLoc2`='Dun Algaz', `NameLoc3`='Dun Algaz', `NameLoc4`='丹奥加兹', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Дун Альгаз' WHERE (`Entry`='837');
UPDATE `locales_area` SET `Entry`='838', `NameLoc1`='북부 관문 통행로', `NameLoc2`='Passage de la porte Nord', `NameLoc3`='Nordtorpass', `NameLoc4`='北门小径', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Северные врата' WHERE (`Entry`='838');
UPDATE `locales_area` SET `Entry`='839', `NameLoc1`='남부 관문 통행로', `NameLoc2`='Passage de la porte Sud', `NameLoc3`='Südtorpass', `NameLoc4`='南门小径', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Южные врата' WHERE (`Entry`='839');
UPDATE `locales_area` SET `Entry`='856', `NameLoc1`='황혼의 숲', `NameLoc2`='Bosquet du crépuscule', `NameLoc3`='Der Zwielichtshain', `NameLoc4`='黎明森林', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Мглистая роща' WHERE (`Entry`='856');
UPDATE `locales_area` SET `Entry`='876', `NameLoc1`='GM의 안식처', `NameLoc2`='Ile des MJ', `NameLoc3`='GM-Insel', `NameLoc4`='GM Island', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Остров ГМ' WHERE (`Entry`='876');
UPDATE `locales_area` SET `Entry`='877', `NameLoc1`='Delete ME', `NameLoc2`='Supprimez-MOI', `NameLoc3`='Delete ME', `NameLoc4`='Delete ME', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Удалите МЕНЯ' WHERE (`Entry`='877');
UPDATE `locales_area` SET `Entry`='878', `NameLoc1`='분노의 강', `NameLoc2`='Fleuve Furie-du-Sud', `NameLoc3`='Der Südstrom', `NameLoc4`='怒水河', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Река Строптивая' WHERE (`Entry`='878');
UPDATE `locales_area` SET `Entry`='879', `NameLoc1`='분노의 강', `NameLoc2`='Fleuve Furie-du-Sud', `NameLoc3`='Der Südstrom', `NameLoc4`='怒水河', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Река Строптивая' WHERE (`Entry`='879');
UPDATE `locales_area` SET `Entry`='880', `NameLoc1`='탄돌 교각', `NameLoc2`='Viaduc de Thandol', `NameLoc3`='Thandol-Übergang', `NameLoc4`='萨多尔大桥', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Мост Тандола' WHERE (`Entry`='880');
UPDATE `locales_area` SET `Entry`='881', `NameLoc1`='탄돌 교각', `NameLoc2`='Viaduc de Thandol', `NameLoc3`='Thandol-Übergang', `NameLoc4`='萨多尔大桥', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Мост Тандола' WHERE (`Entry`='881');
UPDATE `locales_area` SET `Entry`='896', `NameLoc1`='속죄의 섬', `NameLoc2`='Ile de la purification', `NameLoc3`='Fegefeuer-Insel', `NameLoc4`='赎罪岛', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Остров Очищения' WHERE (`Entry`='896');
UPDATE `locales_area` SET `Entry`='916', `NameLoc1`='얀센 농장', `NameLoc2`='La ferme des Jansen', `NameLoc3`='Jansens Siedlung', `NameLoc4`='贾森农场', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Владение Янсена' WHERE (`Entry`='916');
UPDATE `locales_area` SET `Entry`='917', `NameLoc1`='메마른 논밭', `NameLoc2`='L\'acre mort', `NameLoc3`='Der Todesacker', `NameLoc4`='死亡农地', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Мертвая пашня' WHERE (`Entry`='917');
UPDATE `locales_area` SET `Entry`='918', `NameLoc1`='몰센 농장', `NameLoc2`='La ferme des Molsen', `NameLoc3`='Molsens Hof', `NameLoc4`='摩尔森农场', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Ферма Мольсена' WHERE (`Entry`='918');
UPDATE `locales_area` SET `Entry`='919', `NameLoc1`='스텐들의 연못', `NameLoc2`='Etang de Stendel', `NameLoc3`='Stendels Tümpel', `NameLoc4`='斯特登的池塘', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Пруд Стенделя' WHERE (`Entry`='919');
UPDATE `locales_area` SET `Entry`='920', `NameLoc1`='비수 언덕', `NameLoc2`='Les collines de la Dague', `NameLoc3`='Die Dolchhügel', `NameLoc4`='匕首岭', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Холмы Разбойничьих Кинжалов' WHERE (`Entry`='920');
UPDATE `locales_area` SET `Entry`='921', `NameLoc1`='데몬트의 집터', `NameLoc2`='Maison de Demont', `NameLoc3`='Demonts Heim', `NameLoc4`='迪蒙特荒野', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Участок Демонта' WHERE (`Entry`='921');
UPDATE `locales_area` SET `Entry`='922', `NameLoc1`='먼지 언덕', `NameLoc2`='Les Plaines de poussière', `NameLoc3`='Die Staubebenen', `NameLoc4`='尘埃平原', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Пыльные равнины' WHERE (`Entry`='922');
UPDATE `locales_area` SET `Entry`='923', `NameLoc1`='가루바위 골짜기', `NameLoc2`='Vallée des Brisepierre', `NameLoc3`='Splittersteintal', `NameLoc4`='碎石怪之谷', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Долина Камнедробов' WHERE (`Entry`='923');
UPDATE `locales_area` SET `Entry`='924', `NameLoc1`='왕의 계곡', `NameLoc2`='Vallée des rois', `NameLoc3`='Tal der Könige', `NameLoc4`='国王谷', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Долина Королей' WHERE (`Entry`='924');
UPDATE `locales_area` SET `Entry`='925', `NameLoc1`='알가즈 주둔지', `NameLoc2`='Poste d\'Algaz', `NameLoc3`='Station Algaz', `NameLoc4`='奥加兹岗哨', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Станция Альгаз' WHERE (`Entry`='925');
UPDATE `locales_area` SET `Entry`='926', `NameLoc1`='버클브리 농장', `NameLoc2`='Ferme des Bucklebree', `NameLoc3`='Bucklebree-Hof', `NameLoc4`='巴克布雷农场', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Ферма Баклбри' WHERE (`Entry`='926');
UPDATE `locales_area` SET `Entry`='927', `NameLoc1`='반짝이는 호숫가', `NameLoc2`='Le Rivage rayonnant', `NameLoc3`='Der leuchtende Strand', `NameLoc4`='闪光湖岸', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Сияющий берег' WHERE (`Entry`='927');
UPDATE `locales_area` SET `Entry`='928', `NameLoc1`='북부 해안 골짜기', `NameLoc2`='Creux de la côte nord', `NameLoc3`='North Tide\'s Hollow', `NameLoc4`='北流谷', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Северная приливная низина' WHERE (`Entry`='928');
UPDATE `locales_area` SET `Entry`='936', `NameLoc1`='곰발바닥 마루', `NameLoc2`='Falaise de Vieillegriffe', `NameLoc3`='Grautatzengrat', `NameLoc4`='灰爪山', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Хребет Седых Лап' WHERE (`Entry`='936');
UPDATE `locales_area` SET `Entry`='956', `NameLoc1`='신록의 들판', `NameLoc2`='Les Champs verdoyants', `NameLoc3`='Die saftgrünen Felder', `NameLoc4`='青草平原', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Зеленеющие поля' WHERE (`Entry`='956');
UPDATE `locales_area` SET `Entry`='976', `NameLoc1`='가젯잔', `NameLoc2`='Gadgetzan', `NameLoc3`='Gadgetzan', `NameLoc4`='加基森', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Прибамбасск' WHERE (`Entry`='976');
UPDATE `locales_area` SET `Entry`='977', `NameLoc1`='스팀휘들 항구', `NameLoc2`='Port Gentepression', `NameLoc3`='Steamwheedle', `NameLoc4`='热砂港', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Порт Картеля' WHERE (`Entry`='977');
UPDATE `locales_area` SET `Entry`='978', `NameLoc1`='줄파락', `NameLoc2`='Zul\'Farrak', `NameLoc3`='Zul\'Farrak', `NameLoc4`='祖尔法拉克', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Зул\'Фаррак' WHERE (`Entry`='978');
UPDATE `locales_area` SET `Entry`='979', `NameLoc1`='슬픈모래 감시탑', `NameLoc2`='Guet de Tristesable', `NameLoc3`='Sandsorrow-Wache', `NameLoc4`='流沙岗哨', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Застава Скорбных Песков' WHERE (`Entry`='979');
UPDATE `locales_area` SET `Entry`='980', `NameLoc1`='덤불나무 골짜기', `NameLoc2`='Vallée des Chardonniers', `NameLoc3`='Disteltal', `NameLoc4`='灌木谷', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Долина Кактусов' WHERE (`Entry`='980');
UPDATE `locales_area` SET `Entry`='981', `NameLoc1`='모래지옥 협곡', `NameLoc2`='Le Gouffre béant', `NameLoc3`='Die klaffende Schlucht', `NameLoc4`='大裂口', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Зияющая бездна' WHERE (`Entry`='981');
UPDATE `locales_area` SET `Entry`='982', `NameLoc1`='맹독의 둥지', `NameLoc2`='Le Repaire nuisible', `NameLoc3`='Der giftige Unterschlupf', `NameLoc4`='腐化之巢', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Ядовитый улей' WHERE (`Entry`='982');
UPDATE `locales_area` SET `Entry`='983', `NameLoc1`='모래망치 주둔지', `NameLoc2`='Base des Cognedunes', `NameLoc3`='Truppenlager der Dünenbrecher', `NameLoc4`='砂槌营地', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Поселение Песчаного Молота' WHERE (`Entry`='983');
UPDATE `locales_area` SET `Entry`='984', `NameLoc1`='동쪽 달의 폐허', `NameLoc2`='Ruines d\'Estelune', `NameLoc3`='Ostmondruinen', `NameLoc4`='东月废墟', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Руины Восточной Луны' WHERE (`Entry`='984');
UPDATE `locales_area` SET `Entry`='985', `NameLoc1`='샘솟는 벌판', `NameLoc2`='Champ des puisatiers', `NameLoc3`='Waterspring-Feld', `NameLoc4`='清泉平原', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Родниковое поле' WHERE (`Entry`='985');
UPDATE `locales_area` SET `Entry`='986', `NameLoc1`='잘라쉬지의 굴', `NameLoc2`='La tanière de Zalashji', `NameLoc3`='Zalashjis Bau', `NameLoc4`='萨拉辛之穴', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Логово Залашьи' WHERE (`Entry`='986');
UPDATE `locales_area` SET `Entry`='987', `NameLoc1`='끝자락 해안', `NameLoc2`='Plage du Bout-du-Monde', `NameLoc3`='Landendestrand', `NameLoc4`='天涯海滩', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Пляж на Краю Света' WHERE (`Entry`='987');
UPDATE `locales_area` SET `Entry`='988', `NameLoc1`='파도타기 해안', `NameLoc2`='Plage des Déferlantes', `NameLoc3`='Wellenschreiterstrand', `NameLoc4`='破浪海滩', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Берег Морского Бродяги' WHERE (`Entry`='988');
UPDATE `locales_area` SET `Entry`='989', `NameLoc1`='울둠', `NameLoc2`='Uldum', `NameLoc3`='Uldum', `NameLoc4`='奥丹姆', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Ульдум' WHERE (`Entry`='989');
UPDATE `locales_area` SET `Entry`='990', `NameLoc1`='감시자의 골짜기', `NameLoc2`='Vallée des guetteurs', `NameLoc3`='Tal der Behüter', `NameLoc4`='守卫之谷', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Долина Стражей' WHERE (`Entry`='990');
UPDATE `locales_area` SET `Entry`='991', `NameLoc1`='건스탠의 야영지', `NameLoc2`='Poste de Gunstan', `NameLoc3`='Gunstans Posten', `NameLoc4`='古斯坦的哨岗', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Застава Ганстена' WHERE (`Entry`='991');
UPDATE `locales_area` SET `Entry`='992', `NameLoc1`='서쪽 달의 폐허', `NameLoc2`='Ruines de Sudelune', `NameLoc3`='Südmondruinen', `NameLoc4`='南月废墟', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Руины Южной Луны' WHERE (`Entry`='992');
UPDATE `locales_area` SET `Entry`='996', `NameLoc1`='약탈의 야영지', `NameLoc2`='Camp des Etripeurs', `NameLoc3`='Renders Lager', `NameLoc4`='撕裂者营地', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Лагерь Ренда' WHERE (`Entry`='996');
UPDATE `locales_area` SET `Entry`='997', `NameLoc1`='약탈의 계곡', `NameLoc2`='Vallée des Etripeurs', `NameLoc3`='Renders Tal', `NameLoc4`='撕裂者山谷', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Долина Ренда' WHERE (`Entry`='997');
UPDATE `locales_area` SET `Entry`='998', `NameLoc1`='약탈의 바위굴', `NameLoc2`='Rocher des Etripeurs', `NameLoc3`='Renders Fels', `NameLoc4`='撕裂者之石', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Скала Ренда' WHERE (`Entry`='998');
UPDATE `locales_area` SET `Entry`='999', `NameLoc1`='돌망루 탑', `NameLoc2`='Tour de Guet-de-pierre', `NameLoc3`='Turm der Steinwacht', `NameLoc4`='石堡高塔', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Башня Каменной Стражи' WHERE (`Entry`='999');
UPDATE `locales_area` SET `Entry`='1000', `NameLoc1`='갈라델 골짜기', `NameLoc2`='Vallée de Galardell', `NameLoc3`='Galardelltal', `NameLoc4`='加拉德尔山谷', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Долина Галарделл' WHERE (`Entry`='1000');
UPDATE `locales_area` SET `Entry`='1001', `NameLoc1`='호수마루 오솔길', `NameLoc2`='Grand-route de la Crête du lac', `NameLoc3`='Uferpfad', `NameLoc4`='湖边大道', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Озерный тракт' WHERE (`Entry`='1001');
UPDATE `locales_area` SET `Entry`='1002', `NameLoc1`='붉은마루 삼거리', `NameLoc2`='Trois chemins', `NameLoc3`='Drei Ecken', `NameLoc4`='三角路口', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Три Угла' WHERE (`Entry`='1002');
UPDATE `locales_area` SET `Entry`='1016', `NameLoc1`='불길한 언덕', `NameLoc2`='Colline de Morneforge', `NameLoc3`='Direforge Hill', `NameLoc4`='恶铁岭', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Зловещий холм' WHERE (`Entry`='1016');
UPDATE `locales_area` SET `Entry`='1017', `NameLoc1`='랩터 마루', `NameLoc2`='Crête des raptors', `NameLoc3`='Raptorgrat', `NameLoc4`='恐龙岭', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Гряда Ящеров' WHERE (`Entry`='1017');
UPDATE `locales_area` SET `Entry`='1018', `NameLoc1`='검은바닥 습지대', `NameLoc2`='Marais des eaux-noires', `NameLoc3`='Schwarzkanalmarschen', `NameLoc4`='黑水沼泽', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Черная трясина' WHERE (`Entry`='1018');
UPDATE `locales_area` SET `Entry`='1019', `NameLoc1`='녹지대', `NameLoc2`='La Ceinture verte', `NameLoc3`='Der grüne Gürtel', `NameLoc4`='绿带草地', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Зеленый Пояс' WHERE (`Entry`='1019');
UPDATE `locales_area` SET `Entry`='1020', `NameLoc1`='이끼가죽 수렁', `NameLoc2`='Marais des Poils-moussus', `NameLoc3`='Moosfellmoor', `NameLoc4`='藓皮沼泽', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Болото Мохошкуров' WHERE (`Entry`='1020');
UPDATE `locales_area` SET `Entry`='1021', `NameLoc1`='텔겐 바위굴', `NameLoc2`='Rocher de Thelgen', `NameLoc3`='Thelgenfelsen', `NameLoc4`='瑟根石', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Пещера Тельгена' WHERE (`Entry`='1021');
UPDATE `locales_area` SET `Entry`='1022', `NameLoc1`='푸른아가미 습지대', `NameLoc2`='Marais des Branchies-bleues', `NameLoc3`='Blaukiemenmarschen', `NameLoc4`='蓝腮沼泽', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Болота Синежабрых' WHERE (`Entry`='1022');
UPDATE `locales_area` SET `Entry`='1023', `NameLoc1`='소금물 습지대', `NameLoc2`='Vallon des embruns', `NameLoc3`='Salzgischtschlucht', `NameLoc4`='盐沫沼泽', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Долина Солевого Тумана' WHERE (`Entry`='1023');
UPDATE `locales_area` SET `Entry`='1024', `NameLoc1`='해몰이 늪', `NameLoc2`='Marais du couchant', `NameLoc3`='Sonnenwendmarschen', `NameLoc4`='日落沼泽', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Закатное болото' WHERE (`Entry`='1024');
UPDATE `locales_area` SET `Entry`='1025', `NameLoc1`='녹지대', `NameLoc2`='La Ceinture verte', `NameLoc3`='Der grüne Gürtel', `NameLoc4`='绿带草地', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Зеленый Пояс' WHERE (`Entry`='1025');
UPDATE `locales_area` SET `Entry`='1036', `NameLoc1`='성난송곳니 야영지', `NameLoc2`='Campement de Hargnecroc', `NameLoc3`='Angerfang-Lager', `NameLoc4`='怒牙营地', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Лагерь Злого Клыка' WHERE (`Entry`='1036');
UPDATE `locales_area` SET `Entry`='1037', `NameLoc1`='그림 바톨', `NameLoc2`='Grim Batol', `NameLoc3`='Grim Batol', `NameLoc4`='格瑞姆巴托', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Грим Батол' WHERE (`Entry`='1037');
UPDATE `locales_area` SET `Entry`='1038', `NameLoc1`='용아귀부족 관문', `NameLoc2`='Portes des Dragonmaw', `NameLoc3`='Tore der Dragonmaw', `NameLoc4`='龙喉大门', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Врата Драконьей Пасти' WHERE (`Entry`='1038');
UPDATE `locales_area` SET `Entry`='1039', `NameLoc1`='잃어버린 해안', `NameLoc2`='La flotte perdue', `NameLoc3`='Die verlorene Flotte', `NameLoc4`='失落的舰队', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Погибший Флот' WHERE (`Entry`='1039');
UPDATE `locales_area` SET `Entry`='1056', `NameLoc1`='다로우 언덕', `NameLoc2`='Colline de Darrow', `NameLoc3`='Darrow Hill', `NameLoc4`='达隆山', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Холм Дарроу' WHERE (`Entry`='1056');
UPDATE `locales_area` SET `Entry`='1057', `NameLoc1`='소라딘의 성벽', `NameLoc2`='Mur de Thoradin', `NameLoc3`='Thoradinswall', `NameLoc4`='索拉丁之墙', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Стена Торадина' WHERE (`Entry`='1057');
UPDATE `locales_area` SET `Entry`='1076', `NameLoc1`='그물누비 고개', `NameLoc2`='Sentier des Tisseuses', `NameLoc3`='Weberpass', `NameLoc4`='蛛网小径', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Паучий тракт' WHERE (`Entry`='1076');
UPDATE `locales_area` SET `Entry`='1097', `NameLoc1`='고요의 강둑', `NameLoc2`='La Rive silencieuse', `NameLoc3`='Das stille Ufer', `NameLoc4`='寂静河岸', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Затихший берег' WHERE (`Entry`='1097');
UPDATE `locales_area` SET `Entry`='1098', `NameLoc1`='미스트맨틀 장원', `NameLoc2`='Manoir Mistmantle', `NameLoc3`='Anwesen der Mistmantles', `NameLoc4`='密斯特曼托庄园', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Поместье Мистмантла' WHERE (`Entry`='1098');
UPDATE `locales_area` SET `Entry`='1099', `NameLoc1`='모자케 야영지', `NameLoc2`='Camp Mojache', `NameLoc3`='Camp Mojache', `NameLoc4`='莫沙彻营地', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Лагерь Мохаче' WHERE (`Entry`='1099');
UPDATE `locales_area` SET `Entry`='1100', `NameLoc1`='그림토템 주둔지', `NameLoc2`='Base des Totem sinistre', `NameLoc3`='Truppenlager der Grimmtotem', `NameLoc4`='恐怖图腾营地', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Лагерь Зловещего Тотема' WHERE (`Entry`='1100');
UPDATE `locales_area` SET `Entry`='1101', `NameLoc1`='고통의 구덩이', `NameLoc2`='Gouffre grouillant', `NameLoc3`='Die verwundene Tiefe', `NameLoc4`='痛苦深渊', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Гудящая Бездна' WHERE (`Entry`='1101');
UPDATE `locales_area` SET `Entry`='1102', `NameLoc1`='갈기바람 호수', `NameLoc2`='Lac des rafales', `NameLoc3`='Wildwindsee', `NameLoc4`='狂风湖', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Штормовое озеро' WHERE (`Entry`='1102');
UPDATE `locales_area` SET `Entry`='1103', `NameLoc1`='골두니 전초기지', `NameLoc2`='Avant-poste des Gordunni', `NameLoc3`='Außenposten der Gordunni', `NameLoc4`='戈杜尼前哨站', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Поселение Гордунни' WHERE (`Entry`='1103');
UPDATE `locales_area` SET `Entry`='1104', `NameLoc1`='모크골둔', `NameLoc2`='Mok\'Gordun', `NameLoc3`='Mok\'Gordun', `NameLoc4`='莫克高顿', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Мок\'Гордун' WHERE (`Entry`='1104');
UPDATE `locales_area` SET `Entry`='1105', `NameLoc1`='거친흉터 골짜기', `NameLoc2`='Val des Griffes farouches', `NameLoc3`='Wildschrammtal', `NameLoc4`='深痕谷', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Долина Свирепого Утеса' WHERE (`Entry`='1105');
UPDATE `locales_area` SET `Entry`='1106', `NameLoc1`='공작날개 고원', `NameLoc2`='Hautes-terres des Aigreplumes', `NameLoc3`='Fransenfederhochland', `NameLoc4`='乱羽高地', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Высокогорье Блеклых Перьев' WHERE (`Entry`='1106');
UPDATE `locales_area` SET `Entry`='1107', `NameLoc1`='산들바람 호수', `NameLoc2`='Lac Idlewind', `NameLoc3`='Idlewindsee', `NameLoc4`='微风湖', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Озеро Тихого Ветра' WHERE (`Entry`='1107');
UPDATE `locales_area` SET `Entry`='1108', `NameLoc1`='잊혀진 해안', `NameLoc2`='La Côte oubliée', `NameLoc3`='Die vergessene Küste', `NameLoc4`='被遗忘的海岸', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Забытый берег' WHERE (`Entry`='1108');
UPDATE `locales_area` SET `Entry`='1109', `NameLoc1`='동쪽 기둥', `NameLoc2`='Pilier Est', `NameLoc3`='Ostsäule', `NameLoc4`='东部石柱', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Восточная колонна' WHERE (`Entry`='1109');
UPDATE `locales_area` SET `Entry`='1110', `NameLoc1`='서쪽 기둥', `NameLoc2`='Pilier Ouest', `NameLoc3`='Westsäule', `NameLoc4`='西部石柱', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Западная колонна' WHERE (`Entry`='1110');
UPDATE `locales_area` SET `Entry`='1111', `NameLoc1`='꿈나무', `NameLoc2`='Bosquet du rêve', `NameLoc3`='Traum-Geäst', `NameLoc4`='梦境之树', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Сонные Ветви' WHERE (`Entry`='1111');
UPDATE `locales_area` SET `Entry`='1112', `NameLoc1`='비취비늘 호수', `NameLoc2`='Lac Jademir', `NameLoc3`='Jademirsee', `NameLoc4`='加德米尔湖', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Нефритовое озеро' WHERE (`Entry`='1112');
UPDATE `locales_area` SET `Entry`='1113', `NameLoc1`='오네이로스', `NameLoc2`='Oneiros', `NameLoc3`='Oneiros', `NameLoc4`='奥奈罗斯', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Онейрос' WHERE (`Entry`='1113');
UPDATE `locales_area` SET `Entry`='1114', `NameLoc1`='까마귀바람 폐허', `NameLoc2`='Ruines de Vent-du-Corbeau', `NameLoc3`='Ruinen von Rabenwind', `NameLoc4`='鸦风废墟', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Руины Яростного Ветра' WHERE (`Entry`='1114');
UPDATE `locales_area` SET `Entry`='1115', `NameLoc1`='무쇠설인 소굴', `NameLoc2`='Repaire des Griffes féroces', `NameLoc3`='Wutschrammfeste', `NameLoc4`='怒痕堡', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Пещера Бешеного оврага' WHERE (`Entry`='1115');
UPDATE `locales_area` SET `Entry`='1116', `NameLoc1`='페더문 요새', `NameLoc2`='Bastion de Feathermoon', `NameLoc3`='Festung Feathermoon', `NameLoc4`='羽月要塞', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Крепость Оперенной Луны' WHERE (`Entry`='1116');
UPDATE `locales_area` SET `Entry`='1117', `NameLoc1`='솔라살 폐허', `NameLoc2`='Ruines de Solarsal', `NameLoc3`='Ruinen von Solarsal', `NameLoc4`='索兰萨尔废墟', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Руины Соларсаля' WHERE (`Entry`='1117');
UPDATE `locales_area` SET `Entry`='1118', `NameLoc1`='낮은벌', `NameLoc2`='Lower Wilds UNUSED', `NameLoc3`='Lower Wilds UNUSED', `NameLoc4`='Lower Wilds UNUSED', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Низинные чащобы НЕ ИСПОЛЬЗУЕТСЯ' WHERE (`Entry`='1118');
UPDATE `locales_area` SET `Entry`='1119', `NameLoc1`='쌍둥이 바위산', `NameLoc2`='Les Colosses jumeaux', `NameLoc3`='Die Zwillingskolosse', `NameLoc4`='双塔山', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Два Колосса' WHERE (`Entry`='1119');
UPDATE `locales_area` SET `Entry`='1120', `NameLoc1`='살도르 섬', `NameLoc2`='Ile de Sardor', `NameLoc3`='Insel Sardor', `NameLoc4`='萨尔多岛', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Остров Сардор' WHERE (`Entry`='1120');
UPDATE `locales_area` SET `Entry`='1121', `NameLoc1`='공포의 섬', `NameLoc2`='lle de l\'effroi', `NameLoc3`='Die Insel des Schreckens', `NameLoc4`='恐怖之岛', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Остров Ужаса' WHERE (`Entry`='1121');
UPDATE `locales_area` SET `Entry`='1136', `NameLoc1`='높은벌', `NameLoc2`='Les plateaux sauvages', `NameLoc3`='Die obere Wildnis', `NameLoc4`='高原荒野', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Высокогорные дебри' WHERE (`Entry`='1136');
UPDATE `locales_area` SET `Entry`='1137', `NameLoc1`='낮은벌', `NameLoc2`='Etendues sauvages', `NameLoc3`='Die untere Wildnis', `NameLoc4`='低地荒野', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Низинные чащобы' WHERE (`Entry`='1137');
UPDATE `locales_area` SET `Entry`='1156', `NameLoc1`='불모의 땅 남부', `NameLoc2`='Tarides du sud', `NameLoc3`='Südliches Brachland', `NameLoc4`='南贫瘠之地', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Южные степи' WHERE (`Entry`='1156');
UPDATE `locales_area` SET `Entry`='1157', `NameLoc1`='남부 황금길', `NameLoc2`='Route de l\'or méridionale', `NameLoc3`='Südliche Goldstraße', `NameLoc4`='南黄金之路', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Южный Золотой Путь' WHERE (`Entry`='1157');
UPDATE `locales_area` SET `Entry`='1176', `NameLoc1`='줄파락', `NameLoc2`='Zul\'Farrak', `NameLoc3`='Zul\'Farrak', `NameLoc4`='祖尔法拉克', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Зул\'Фаррак' WHERE (`Entry`='1176');
UPDATE `locales_area` SET `Entry`='1196', `NameLoc1`='알카즈 섬', `NameLoc2`='UNUSEDAlcaz Island', `NameLoc3`='UNUSEDAlcaz Island', `NameLoc4`='奥卡兹岛', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='НЕ ИСПОЛЬЗУЕТСЯ Остров Альказ' WHERE (`Entry`='1196');
UPDATE `locales_area` SET `Entry`='1216', `NameLoc1`='나무구렁 요새', `NameLoc2`='Repaire des Grumegueules', `NameLoc3`='Holzschlundfeste', `NameLoc4`='木喉要塞', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Крепость Древобрюхов' WHERE (`Entry`='1216');
UPDATE `locales_area` SET `Entry`='1217', `NameLoc1`='반디르 야영지', `NameLoc2`='Campement de Vanndir', `NameLoc3`='Vanndir-Lager', `NameLoc4`='范迪尔营地', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Лагерь Ванндир' WHERE (`Entry`='1217');
UPDATE `locales_area` SET `Entry`='1218', `NameLoc1`='아즈샤라', `NameLoc2`='TESTAzshara', `NameLoc3`='TESTAzshara', `NameLoc4`='TESTAzshara', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='ТЕСТАзшара' WHERE (`Entry`='1218');
UPDATE `locales_area` SET `Entry`='1219', `NameLoc1`='레가쉬 야영지', `NameLoc2`='Campement Legashi', `NameLoc3`='Lager der Legashi', `NameLoc4`='雷加什营地', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Лагерь Легаш' WHERE (`Entry`='1219');
UPDATE `locales_area` SET `Entry`='1220', `NameLoc1`='탈라시안 주둔지', `NameLoc2`='Camp de base thalassien', `NameLoc3`='Thalassischer Stützpunkt', `NameLoc4`='萨拉斯营地', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Талассийское поселение' WHERE (`Entry`='1220');
UPDATE `locales_area` SET `Entry`='1221', `NameLoc1`='엘다라스 폐허', `NameLoc2`='Ruines d\'Eldarath', `NameLoc3`='Die Ruinen von Eldarath', `NameLoc4`='埃达拉斯废墟', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Руины Эльдарата' WHERE (`Entry`='1221');
UPDATE `locales_area` SET `Entry`='1222', `NameLoc1`='헤타에라의 손아귀', `NameLoc2`='Frai d\'Hetaera', `NameLoc3`='Hetaeras Gelege', `NameLoc4`='赫塔拉的巢穴', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Гнездо Хетайры' WHERE (`Entry`='1222');
UPDATE `locales_area` SET `Entry`='1223', `NameLoc1`='진말로의 신전', `NameLoc2`='Temple de Zin-Malor', `NameLoc3`='Tempel von Zin-Malor', `NameLoc4`='辛玛洛神殿', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Храм Зин-Малор' WHERE (`Entry`='1223');
UPDATE `locales_area` SET `Entry`='1224', `NameLoc1`='곰마루', `NameLoc2`='Tête d\'ours', `NameLoc3`='Bärenkopf', `NameLoc4`='熊头', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Медвежий угол' WHERE (`Entry`='1224');
UPDATE `locales_area` SET `Entry`='1225', `NameLoc1`='우르솔란', `NameLoc2`='Ursolan', `NameLoc3`='Ursolan', `NameLoc4`='乌索兰', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Урсолан' WHERE (`Entry`='1225');
UPDATE `locales_area` SET `Entry`='1226', `NameLoc1`='아크코란의 신전', `NameLoc2`='Temple d\'Arkkoran', `NameLoc3`='Der Tempel von Arkkoran', `NameLoc4`='亚考兰神殿', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Храм Арккоран' WHERE (`Entry`='1226');
UPDATE `locales_area` SET `Entry`='1227', `NameLoc1`='폭풍의 만', `NameLoc2`='Baie des tempêtes', `NameLoc3`='Die Bucht der Stürme', `NameLoc4`='风暴海湾', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Залив Бурь' WHERE (`Entry`='1227');
UPDATE `locales_area` SET `Entry`='1228', `NameLoc1`='조각난 해안', `NameLoc2`='La Grève fracassée', `NameLoc3`='Der zertrümmerte Strand', `NameLoc4`='破碎海岸', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Разоренное побережье' WHERE (`Entry`='1228');
UPDATE `locales_area` SET `Entry`='1229', `NameLoc1`='엘다라의 탑', `NameLoc2`='Tour d\'Eldara', `NameLoc3`='Turm von Eldara', `NameLoc4`='埃达拉之塔', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Башня Эльдары' WHERE (`Entry`='1229');
UPDATE `locales_area` SET `Entry`='1230', `NameLoc1`='톱니 산호초', `NameLoc2`='Récif déchiqueté', `NameLoc3`='Gezacktes Riff', `NameLoc4`='锯齿暗礁', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Острые рифы' WHERE (`Entry`='1230');
UPDATE `locales_area` SET `Entry`='1231', `NameLoc1`='남녘마루 해안', `NameLoc2`='Plage des Crêtes du sud', `NameLoc3`='Southridge-Strand', `NameLoc4`='南山海滩', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Южный пляж' WHERE (`Entry`='1231');
UPDATE `locales_area` SET `Entry`='1232', `NameLoc1`='레이븐크레스트 기념비', `NameLoc2`='Colosse de Ravencrest', `NameLoc3`='Ravencrest-Monument', `NameLoc4`='拉文凯斯雕像', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Памятник Гребню Ворона' WHERE (`Entry`='1232');
UPDATE `locales_area` SET `Entry`='1233', `NameLoc1`='쓸쓸한 마루', `NameLoc2`='La crête lugubre', `NameLoc3`='Der einsame Grat', `NameLoc4`='凄凉山', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Одинокая вершина' WHERE (`Entry`='1233');
UPDATE `locales_area` SET `Entry`='1234', `NameLoc1`='멘나르 호수', `NameLoc2`='Lac Mennar', `NameLoc3`='Mennarsee', `NameLoc4`='门纳尔湖', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Озеро Меннар' WHERE (`Entry`='1234');
UPDATE `locales_area` SET `Entry`='1235', `NameLoc1`='섀도송 제단', `NameLoc2`='Sanctuaire de Shadowsong', `NameLoc3`='Shadowsong-Schrein', `NameLoc4`='影歌神殿', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Святилище Песни Теней' WHERE (`Entry`='1235');
UPDATE `locales_area` SET `Entry`='1236', `NameLoc1`='할다르 야영지', `NameLoc2`='Campement des Haldarr', `NameLoc3`='Lager der Haldarr', `NameLoc4`='哈达尔营地', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Лагерь Халдарр' WHERE (`Entry`='1236');
UPDATE `locales_area` SET `Entry`='1237', `NameLoc1`='발로르모크', `NameLoc2`='Valormok', `NameLoc3`='Valormok', `NameLoc4`='瓦罗莫克', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Храбростан' WHERE (`Entry`='1237');
UPDATE `locales_area` SET `Entry`='1256', `NameLoc1`='버려진 착륙장', `NameLoc2`='Les Confins dévastés', `NameLoc3`='Die verfallenen Gegenden', `NameLoc4`='废墟海岸', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Опустошенный берег' WHERE (`Entry`='1256');
UPDATE `locales_area` SET `Entry`='1276', `NameLoc1`='돌발톱 토굴길', `NameLoc2`='La Perce des Serres', `NameLoc3`='Der Steinkrallenpfad', `NameLoc4`='石爪小径', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Туннель Когтя' WHERE (`Entry`='1276');
UPDATE `locales_area` SET `Entry`='1277', `NameLoc1`='돌발톱 토굴길', `NameLoc2`='La Perce des Serres', `NameLoc3`='Der Steinkrallenpfad', `NameLoc4`='石爪小径', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Туннель Когтя' WHERE (`Entry`='1277');
UPDATE `locales_area` SET `Entry`='1296', `NameLoc1`='바위어금니 농장', `NameLoc2`='Ferme Brochepierre', `NameLoc3`='Felshauerhof', `NameLoc4`='石牙农场', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Ферма Каменного Клыка' WHERE (`Entry`='1296');
UPDATE `locales_area` SET `Entry`='1297', `NameLoc1`='톱니멧돼지 농장', `NameLoc2`='Ferme Rêche-pourceau', `NameLoc3`='Scheckeneberhof', `NameLoc4`='野猪农场', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Свиноферма' WHERE (`Entry`='1297');
UPDATE `locales_area` SET `Entry`='1316', `NameLoc1`='가시덩굴 구릉', `NameLoc2`='Souilles de Tranchebauge', `NameLoc3`='Die Hügel von Razorfen', `NameLoc4`='剃刀高地', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Курганы Иглошкурых' WHERE (`Entry`='1316');
UPDATE `locales_area` SET `Entry`='1336', `NameLoc1`='해적단 소굴', `NameLoc2`='Crique des Gréements', `NameLoc3`='Lost-Rigger-Bucht', `NameLoc4`='落帆海湾', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Бухта Сорванных Парусов' WHERE (`Entry`='1336');
UPDATE `locales_area` SET `Entry`='1337', `NameLoc1`='울다만', `NameLoc2`='Uldaman', `NameLoc3`='Uldaman', `NameLoc4`='奥达曼', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Ульдаман' WHERE (`Entry`='1337');
UPDATE `locales_area` SET `Entry`='1338', `NameLoc1`='로다미어 호수', `NameLoc2`='Lac Lordamere', `NameLoc3`='Der Lordameresee', `NameLoc4`='洛丹米尔湖', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Озеро Лордамер' WHERE (`Entry`='1338');
UPDATE `locales_area` SET `Entry`='1339', `NameLoc1`='로다미어 호수', `NameLoc2`='Lac Lordamere', `NameLoc3`='Der Lordameresee', `NameLoc4`='洛丹米尔湖', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Озеро Лордамер' WHERE (`Entry`='1339');
UPDATE `locales_area` SET `Entry`='1357', `NameLoc1`='갤로우 삼거리', `NameLoc2`='Fourche du gibet', `NameLoc3`='Galgeneck', `NameLoc4`='绞刑场', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Перекресток Висельников' WHERE (`Entry`='1357');
UPDATE `locales_area` SET `Entry`='1377', `NameLoc1`='실리더스', `NameLoc2`='Silithus', `NameLoc3`='Silithus', `NameLoc4`='希利苏斯', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Силитус' WHERE (`Entry`='1377');
UPDATE `locales_area` SET `Entry`='1397', `NameLoc1`='에메랄드 숲', `NameLoc2`='Forêt d\'émeraude', `NameLoc3`='Smaragdwald', `NameLoc4`='翠叶森林', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Изумрудный лес' WHERE (`Entry`='1397');
UPDATE `locales_area` SET `Entry`='1417', `NameLoc1`='가라앉은 사원', `NameLoc2`='Temple englouti', `NameLoc3`='Versunkener Tempel', `NameLoc4`='沉没的神庙', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Затонувший храм' WHERE (`Entry`='1417');
UPDATE `locales_area` SET `Entry`='1437', `NameLoc1`='우레망치 요새', `NameLoc2`='Bastion Cognepeur', `NameLoc3`='Feste Schreckensfels', `NameLoc4`='巨槌要塞', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Форт Молота Ужаса' WHERE (`Entry`='1437');
UPDATE `locales_area` SET `Entry`='1438', `NameLoc1`='네더가드 요새', `NameLoc2`='Rempart-du-Néant', `NameLoc3`='Burg Nethergarde', `NameLoc4`='守望堡', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Крепость Стражей Пустоты' WHERE (`Entry`='1438');
UPDATE `locales_area` SET `Entry`='1439', `NameLoc1`='우레망치 주둔지', `NameLoc2`='Poste Cognepeur', `NameLoc3`='Schreckensfelsposten', `NameLoc4`='巨槌岗哨', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Стоянка Молота Ужаса' WHERE (`Entry`='1439');
UPDATE `locales_area` SET `Entry`='1440', `NameLoc1`='뱀의 보금자리', `NameLoc2`='Anneaux du serpent', `NameLoc3`='Schlangenschlinge', `NameLoc4`='盘蛇谷', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Змеиные Кольца' WHERE (`Entry`='1440');
UPDATE `locales_area` SET `Entry`='1441', `NameLoc1`='폭풍의 제단', `NameLoc2`='Autel des tempêtes', `NameLoc3`='Altar der Stürme', `NameLoc4`='风暴祭坛', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Алтарь Бурь' WHERE (`Entry`='1441');
UPDATE `locales_area` SET `Entry`='1442', `NameLoc1`='불망루 마루', `NameLoc2`='Crête de Guet-du-feu', `NameLoc3`='Firewatchgrat', `NameLoc4`='观火岭', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Гряда Огненной стражи' WHERE (`Entry`='1442');
UPDATE `locales_area` SET `Entry`='1443', `NameLoc1`='잿가루 채석장', `NameLoc2`='La Fosse aux scories', `NameLoc3`='Die Schlackengrube', `NameLoc4`='熔渣之池', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Шлаковая Яма' WHERE (`Entry`='1443');
UPDATE `locales_area` SET `Entry`='1444', `NameLoc1`='잿더미 바다', `NameLoc2`='La Mer de braises', `NameLoc3`='Das Meer der Asche', `NameLoc4`='灰烬之海', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Пепельное Море' WHERE (`Entry`='1444');
UPDATE `locales_area` SET `Entry`='1445', `NameLoc1`='검은바위 산', `NameLoc2`='Mont Blackrock', `NameLoc3`='Der Blackrock', `NameLoc4`='黑石山', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Черная гора' WHERE (`Entry`='1445');
UPDATE `locales_area` SET `Entry`='1446', `NameLoc1`='토륨 조합 거점', `NameLoc2`='Halte du Thorium', `NameLoc3`='Thoriumspitze', `NameLoc4`='瑟银哨塔', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Лагерь Братства Тория' WHERE (`Entry`='1446');
UPDATE `locales_area` SET `Entry`='1457', `NameLoc1`='요새 무기고', `NameLoc2`='Armurerie de la garnison', `NameLoc3`='Garnison-Waffenkammer', `NameLoc4`='要塞军械库', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Мастерские Гарнизона' WHERE (`Entry`='1457');
UPDATE `locales_area` SET `Entry`='1477', `NameLoc1`='아탈학카르 신전', `NameLoc2`='Le temple d\'Atal\'Hakkar', `NameLoc3`='Der Tempel von Atal\'Hakkar', `NameLoc4`='阿塔哈卡神庙', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Храм Атал\'Хаккара' WHERE (`Entry`='1477');
UPDATE `locales_area` SET `Entry`='1497', `NameLoc1`='언더시티', `NameLoc2`='Undercity', `NameLoc3`='Undercity', `NameLoc4`='幽暗城', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Подгород' WHERE (`Entry`='1497');
UPDATE `locales_area` SET `Entry`='1517', `NameLoc1`='울다만', `NameLoc2`='Uldaman', `NameLoc3`='Uldaman', `NameLoc4`='奥达曼', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Ульдаман' WHERE (`Entry`='1517');
UPDATE `locales_area` SET `Entry`='1518', `NameLoc1`='죽음의 폐광', `NameLoc2`='Mortemines non utilisé', `NameLoc3`='Nicht benutzt - Todesminen', `NameLoc4`='Not Used Deadmines', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Не использующиеся Мертвые копи' WHERE (`Entry`='1518');
UPDATE `locales_area` SET `Entry`='1519', `NameLoc1`='스톰윈드', `NameLoc2`='Cité de Stormwind', `NameLoc3`='Stormwind', `NameLoc4`='暴风城', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Штормград' WHERE (`Entry`='1519');
UPDATE `locales_area` SET `Entry`='1537', `NameLoc1`='아이언포지', `NameLoc2`='Ironforge', `NameLoc3`='Ironforge', `NameLoc4`='铁炉堡', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Стальгорн' WHERE (`Entry`='1537');
UPDATE `locales_area` SET `Entry`='1557', `NameLoc1`='갈래발굽 소굴', `NameLoc2`='Bastion du Sabot fendu', `NameLoc3`='Spalthufhöhle', `NameLoc4`='裂蹄堡', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Оплот Треснувшего Копыта' WHERE (`Entry`='1557');
UPDATE `locales_area` SET `Entry`='1577', `NameLoc1`='가시덤불 봉우리', `NameLoc2`='Le cap Strangleronce', `NameLoc3`='Kap des Schlingendorntals', `NameLoc4`='荆棘谷海角', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Мыс Тернистой долины' WHERE (`Entry`='1577');
UPDATE `locales_area` SET `Entry`='1578', `NameLoc1`='폭풍 해안 남부', `NameLoc2`='Côte sauvage du sud', `NameLoc3`='Südliche ungezähmte Küste', `NameLoc4`='南野人海岸', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Южный Гибельный берег' WHERE (`Entry`='1578');
UPDATE `locales_area` SET `Entry`='1579', `NameLoc1`='죽음의 폐광', `NameLoc2`='Unused The Deadmines 002', `NameLoc3`='Unused The Deadmines 002', `NameLoc4`='Unused The Deadmines 002', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='НЕ ИСПОЛЬЗУЕТСЯ Мертвые копи 002' WHERE (`Entry`='1579');
UPDATE `locales_area` SET `Entry`='1580', `NameLoc1`='철갑 동굴', `NameLoc2`='Unused Ironclad Cove 003', `NameLoc3`='Unused Ironclad Cove 003', `NameLoc4`='Unused Ironclad Cove 003', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='НЕ ИСПОЛЬЗУЕТСЯ Потайная бухта 003' WHERE (`Entry`='1580');
UPDATE `locales_area` SET `Entry`='1581', `NameLoc1`='죽음의 폐광', `NameLoc2`='Les Mortemines', `NameLoc3`='Die Todesminen', `NameLoc4`='死亡矿井', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Мертвые копи' WHERE (`Entry`='1581');
UPDATE `locales_area` SET `Entry`='1582', `NameLoc1`='철갑 동굴', `NameLoc2`='Crique du cuirassé', `NameLoc3`='Ironcladbucht', `NameLoc4`='铁甲湾', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Потайная бухта' WHERE (`Entry`='1582');
UPDATE `locales_area` SET `Entry`='1583', `NameLoc1`='검은바위 첨탑', `NameLoc2`='Pic Blackrock', `NameLoc3`='Blackrockspitze', `NameLoc4`='黑石塔', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Пик Черной горы' WHERE (`Entry`='1583');
UPDATE `locales_area` SET `Entry`='1584', `NameLoc1`='검은바위 나락', `NameLoc2`='Profondeurs de Blackrock', `NameLoc3`='Blackrocktiefen', `NameLoc4`='黑石深渊', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Глубины Черной горы' WHERE (`Entry`='1584');
UPDATE `locales_area` SET `Entry`='1597', `NameLoc1`='랩터 서식지', `NameLoc2`='Raptor Grounds UNUSED', `NameLoc3`='Raptor Grounds UNUSED', `NameLoc4`='Raptor Grounds UNUSED', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Земли ящеров НЕ ИСПОЛЬЗУЕТСЯ' WHERE (`Entry`='1597');
UPDATE `locales_area` SET `Entry`='1598', `NameLoc1`='그롤돔 농장', `NameLoc2`='Grol\'dom Farm UNUSED', `NameLoc3`='Grol\'dom Hof UNUSED', `NameLoc4`='Grol\'dom Farm UNUSED', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Ферма Гроль\'дома НЕ ИСПОЛЬЗУЕТСЯ' WHERE (`Entry`='1598');
UPDATE `locales_area` SET `Entry`='1599', `NameLoc1`='몰샨 주둔지', `NameLoc2`='Campement de Mor\'shan', `NameLoc3`='Mor\'shan-Stützpunkt', `NameLoc4`='莫尔杉营地', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Лагерь Мор\'шан' WHERE (`Entry`='1599');
UPDATE `locales_area` SET `Entry`='1600', `NameLoc1`='Honor\'s Stand UNUSED', `NameLoc2`='Honor\'s Stand UNUSED', `NameLoc3`='Honor\'s Stand UNUSED', `NameLoc4`='Honor\'s Stand UNUSED', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Застава Чести НЕ ИСПОЛЬЗУЕТСЯ' WHERE (`Entry`='1600');
UPDATE `locales_area` SET `Entry`='1601', `NameLoc1`='검은가시 마루', `NameLoc2`='Blackthorn Ridge UNUSED', `NameLoc3`='Blackthorn Ridge UNUSED', `NameLoc4`='Blackthorn Ridge UNUSED', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Хребет Черный шип НЕ ИСПОЛЬЗУЕТСЯ' WHERE (`Entry`='1601');
UPDATE `locales_area` SET `Entry`='1602', `NameLoc1`='가시덩굴 벌판', `NameLoc2`='Ronceplaie UNUSED', `NameLoc3`='Bramblescar UNUSED', `NameLoc4`='Bramblescar UNUSED', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Ежевичный Шип НЕ ИСПОЛЬЗУЕТСЯ' WHERE (`Entry`='1602');
UPDATE `locales_area` SET `Entry`='1603', `NameLoc1`='아가마고르', `NameLoc2`='Agama\'gor UNUSED', `NameLoc3`='Agama\'gor UNUSED', `NameLoc4`='Agama\'gor UNUSED', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Агамагор НЕ ИСПОЛЬЗУЕТСЯ' WHERE (`Entry`='1603');
UPDATE `locales_area` SET `Entry`='1617', `NameLoc1`='영웅의 계곡', `NameLoc2`='Vallée des héros', `NameLoc3`='Das Tal der Helden', `NameLoc4`='英雄谷', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Аллея Героев' WHERE (`Entry`='1617');
UPDATE `locales_area` SET `Entry`='1637', `NameLoc1`='오그리마', `NameLoc2`='Orgrimmar', `NameLoc3`='Orgrimmar', `NameLoc4`='奥格瑞玛', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Оргриммар' WHERE (`Entry`='1637');
UPDATE `locales_area` SET `Entry`='1638', `NameLoc1`='썬더 블러프', `NameLoc2`='Thunder Bluff', `NameLoc3`='Thunder Bluff', `NameLoc4`='雷霆崖', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Громовой Утес' WHERE (`Entry`='1638');
UPDATE `locales_area` SET `Entry`='1639', `NameLoc1`='장로의 봉우리', `NameLoc2`='Cime des Anciens', `NameLoc3`='Die Anhöhe der Ältesten', `NameLoc4`='长者高地', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Вершина Старейшин' WHERE (`Entry`='1639');
UPDATE `locales_area` SET `Entry`='1640', `NameLoc1`='정기의 봉우리', `NameLoc2`='Cime des Esprits', `NameLoc3`='Die Anhöhe der Geister', `NameLoc4`='灵魂高地', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Вершина Духов' WHERE (`Entry`='1640');
UPDATE `locales_area` SET `Entry`='1641', `NameLoc1`='수렵의 봉우리', `NameLoc2`='Cime des chasseurs', `NameLoc3`='Die Anhöhe der Jäger', `NameLoc4`='猎人高地', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Вершина Охотников' WHERE (`Entry`='1641');
UPDATE `locales_area` SET `Entry`='1657', `NameLoc1`='다르나서스', `NameLoc2`='Darnassus', `NameLoc3`='Darnassus', `NameLoc4`='达纳苏斯', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Дарнас' WHERE (`Entry`='1657');
UPDATE `locales_area` SET `Entry`='1658', `NameLoc1`='세나리온 자치령', `NameLoc2`='Enclave cénarienne', `NameLoc3`='Die Enklave des Cenarius', `NameLoc4`='塞纳里奥区', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Анклав Кенария' WHERE (`Entry`='1658');
UPDATE `locales_area` SET `Entry`='1659', `NameLoc1`='장인의 정원', `NameLoc2`='Terrasse des Artisans', `NameLoc3`='Die Terrasse der Handwerker', `NameLoc4`='工匠区', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Терраса Ремесленников' WHERE (`Entry`='1659');
UPDATE `locales_area` SET `Entry`='1660', `NameLoc1`='전사의 정원', `NameLoc2`='Terrasse des Guerriers', `NameLoc3`='Die Terrasse der Krieger', `NameLoc4`='战士区', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Терраса Воинов' WHERE (`Entry`='1660');
UPDATE `locales_area` SET `Entry`='1661', `NameLoc1`='신전 정원', `NameLoc2`='Les Jardins du temple', `NameLoc3`='Die Tempelgärten', `NameLoc4`='神殿花园', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Храмовые сады' WHERE (`Entry`='1661');
UPDATE `locales_area` SET `Entry`='1662', `NameLoc1`='상인의 정원', `NameLoc2`='Terrasse des Marchands', `NameLoc3`='Die Terrasse der Händler', `NameLoc4`='贸易区', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Терраса Торговцев' WHERE (`Entry`='1662');
UPDATE `locales_area` SET `Entry`='1677', `NameLoc1`='가빈 절벽', `NameLoc2`='Promontoire de Gavin', `NameLoc3`='Gavins Landspitze', `NameLoc4`='加文高地', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Возвышенность Гэвина' WHERE (`Entry`='1677');
UPDATE `locales_area` SET `Entry`='1678', `NameLoc1`='소페라 절벽', `NameLoc2`='Promontoire de Sofera', `NameLoc3`='Soferas Landspitze', `NameLoc4`='索菲亚高地', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Возвышенность Соферы' WHERE (`Entry`='1678');
UPDATE `locales_area` SET `Entry`='1679', `NameLoc1`='코란의 비수', `NameLoc2`='Dague de Corrahn', `NameLoc3`='Corrahns Dolch', `NameLoc4`='考兰之匕', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Уступ Коррана' WHERE (`Entry`='1679');
UPDATE `locales_area` SET `Entry`='1680', `NameLoc1`='마루터기', `NameLoc2`='L\'Avancée', `NameLoc3`='Die Landzunge', `NameLoc4`='山头营地', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Высокий отрог' WHERE (`Entry`='1680');
UPDATE `locales_area` SET `Entry`='1681', `NameLoc1`='물안개 호숫가', `NameLoc2`='Rivage brumeux', `NameLoc3`='Nebelufer', `NameLoc4`='雾气湖岸', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Мглистый берег' WHERE (`Entry`='1681');
UPDATE `locales_area` SET `Entry`='1682', `NameLoc1`='단드레드 장원', `NameLoc2`='Clos de Dandred', `NameLoc3`='Dandreds Senke', `NameLoc4`='达伦德农场', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Овчарня Дандреда' WHERE (`Entry`='1682');
UPDATE `locales_area` SET `Entry`='1683', `NameLoc1`='침묵의 동굴', `NameLoc2`='Caverne stérile', `NameLoc3`='Growlesshöhle', `NameLoc4`='无草洞', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Промерзшая пещера' WHERE (`Entry`='1683');
UPDATE `locales_area` SET `Entry`='1684', `NameLoc1`='서리바람 거점', `NameLoc2`='Pointe du Noroît', `NameLoc3`='Chillwindspitze', `NameLoc4`='冰风岗', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Берег Промозглого Ветра' WHERE (`Entry`='1684');
UPDATE `locales_area` SET `Entry`='1697', `NameLoc1`='랩터 서식지', `NameLoc2`='Terres des Raptors', `NameLoc3`='Raptorgründe', `NameLoc4`='迅猛龙巢穴', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Земли Ящеров' WHERE (`Entry`='1697');
UPDATE `locales_area` SET `Entry`='1698', `NameLoc1`='가시덩굴 벌판', `NameLoc2`='Ronceplaie', `NameLoc3`='Dornennarbe', `NameLoc4`='迅猛龙平原', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Ежевичный овраг' WHERE (`Entry`='1698');
UPDATE `locales_area` SET `Entry`='1699', `NameLoc1`='가시덩굴 언덕', `NameLoc2`='Colline des épines', `NameLoc3`='Dornenhügel', `NameLoc4`='荆棘岭', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Тернистый холм' WHERE (`Entry`='1699');
UPDATE `locales_area` SET `Entry`='1700', `NameLoc1`='아가마고르', `NameLoc2`='Agama\'gor', `NameLoc3`='Agama\'gor', `NameLoc4`='阿迦玛戈', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Агама\'гор' WHERE (`Entry`='1700');
UPDATE `locales_area` SET `Entry`='1701', `NameLoc1`='검은가시 마루', `NameLoc2`='Crête de Noirépine', `NameLoc3`='Schwarzdorngrat', `NameLoc4`='黑棘山', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Хребет Черных Шипов' WHERE (`Entry`='1701');
UPDATE `locales_area` SET `Entry`='1702', `NameLoc1`='명예의 감시탑', `NameLoc2`='Le lieu de l\'Honneur', `NameLoc3`='Ehrenmal', `NameLoc4`='荣耀岗哨', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Застава Чести' WHERE (`Entry`='1702');
UPDATE `locales_area` SET `Entry`='1703', `NameLoc1`='몰샨의 망루', `NameLoc2`='Le Rempart de Mor\'shan', `NameLoc3`='Der Mor\'shan-Schutzwall', `NameLoc4`='摩尔沙农场', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Застава Мор\'шан' WHERE (`Entry`='1703');
UPDATE `locales_area` SET `Entry`='1704', `NameLoc1`='그롤돔 농장', `NameLoc2`='Ferme de Grol\'dom', `NameLoc3`='Grol\'doms Hof', `NameLoc4`='格罗多姆农场', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Ферма Гроль\'дома' WHERE (`Entry`='1704');
UPDATE `locales_area` SET `Entry`='1717', `NameLoc1`='가시덩굴 우리', `NameLoc2`='Kraal de Tranchebauge', `NameLoc3`='Der Kral von Razorfen', `NameLoc4`='剃刀沼泽', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Лабиринты Иглошкурых' WHERE (`Entry`='1717');
UPDATE `locales_area` SET `Entry`='1718', `NameLoc1`='구름 승강장', `NameLoc2`='La Grande élévation', `NameLoc3`='Der große Aufzug', `NameLoc4`='升降梯', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Великий Подъемник' WHERE (`Entry`='1718');
UPDATE `locales_area` SET `Entry`='1737', `NameLoc1`='안개계곡 골짜기', `NameLoc2`='Valbrume', `NameLoc3`='Nebeltal', `NameLoc4`='薄雾谷', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Мглистая долина' WHERE (`Entry`='1737');
UPDATE `locales_area` SET `Entry`='1738', `NameLoc1`='네크마니 수원지', `NameLoc2`='Fontaine des Nek\'mani', `NameLoc3`='Nek\'maniquellbrunnen', `NameLoc4`='纳克迈尼圣泉', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Родник Нек\'Мани' WHERE (`Entry`='1738');
UPDATE `locales_area` SET `Entry`='1739', `NameLoc1`='붉은해적단 주둔지', `NameLoc2`='Base de la Voile sanglante', `NameLoc3`='Truppenlager der Blutsegelbukaniere', `NameLoc4`='血帆营地', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Лагерь Кровавого Паруса' WHERE (`Entry`='1739');
UPDATE `locales_area` SET `Entry`='1740', `NameLoc1`='투자개발회사 탐사기지', `NameLoc2`='Campement de la KapitalRisk', `NameLoc3`='Stützpunkt der Venture Co.', `NameLoc4`='风险投资公司营地', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Главный лагерь Торговой Компании' WHERE (`Entry`='1740');
UPDATE `locales_area` SET `Entry`='1741', `NameLoc1`='구루바시 투기장', `NameLoc2`='Arène des Gurubashi', `NameLoc3`='Die Arena der Gurubashi', `NameLoc4`='古拉巴什竞技场', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Арена Гурубаши' WHERE (`Entry`='1741');
UPDATE `locales_area` SET `Entry`='1742', `NameLoc1`='정기의 동굴', `NameLoc2`='Antre des esprits', `NameLoc3`='Geisterhöhlenbau', `NameLoc4`='灵魂之穴', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Пещера Духов' WHERE (`Entry`='1742');
UPDATE `locales_area` SET `Entry`='1757', `NameLoc1`='크림슨 베일호', `NameLoc2`='Le Voile cramoisi', `NameLoc3`='Die CRIMSON VEIL', `NameLoc4`='赤红之雾', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Кровавая Завеса' WHERE (`Entry`='1757');
UPDATE `locales_area` SET `Entry`='1758', `NameLoc1`='립타이드호', `NameLoc2`='Le Courant', `NameLoc3`='Die RIPTIDE', `NameLoc4`='断潮之池', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Бурун' WHERE (`Entry`='1758');
UPDATE `locales_area` SET `Entry`='1759', `NameLoc1`='담셀의 행운호', `NameLoc2`='La Chance de la demoiselle', `NameLoc3`='Die DAMSEL\'S LUCK', `NameLoc4`='少女的好运', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Госпожа Удача' WHERE (`Entry`='1759');
UPDATE `locales_area` SET `Entry`='1760', `NameLoc1`='투자개발회사 기계조작실', `NameLoc2`='Centre d\'opérations de la KapitalRisk', `NameLoc3`='Arbeitszentrale der Venture Co.', `NameLoc4`='风险投资公司工作中心', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Штаб-квартира Торговой Компании' WHERE (`Entry`='1760');
UPDATE `locales_area` SET `Entry`='1761', `NameLoc1`='마른가지 마을', `NameLoc2`='Village des Mort-bois', `NameLoc3`='Lager der Totenwaldfelle', `NameLoc4`='死木村', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Деревня Мертвого Леса' WHERE (`Entry`='1761');
UPDATE `locales_area` SET `Entry`='1762', `NameLoc1`='악령발 마을', `NameLoc2`='Village de Gangrepatte', `NameLoc3`='Revier der Teufelspfoten', `NameLoc4`='魔爪村', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Деревня Сквернолапов' WHERE (`Entry`='1762');
UPDATE `locales_area` SET `Entry`='1763', `NameLoc1`='자에데나르', `NameLoc2`='Jaedenar', `NameLoc3`='Jaedenar', `NameLoc4`='加德纳尔', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Джеденар' WHERE (`Entry`='1763');
UPDATE `locales_area` SET `Entry`='1764', `NameLoc1`='피멍울 강', `NameLoc2`='La Vénéneuse', `NameLoc3`='Blutgiftbach', `NameLoc4`='血毒河', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Река Отравленной Крови' WHERE (`Entry`='1764');
UPDATE `locales_area` SET `Entry`='1765', `NameLoc1`='피멍울 폭포', `NameLoc2`='Chutes de la Vénéneuse', `NameLoc3`='Die Blutgiftfälle', `NameLoc4`='血毒瀑布', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Водопад Отравленной Крови' WHERE (`Entry`='1765');
UPDATE `locales_area` SET `Entry`='1766', `NameLoc1`='불벼락 골짜기', `NameLoc2`='Val Grêlé', `NameLoc3`='Narbengrund', `NameLoc4`='碎痕谷', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Долина Рваных Ран' WHERE (`Entry`='1766');
UPDATE `locales_area` SET `Entry`='1767', `NameLoc1`='강철나무 숲', `NameLoc2`='Bois d\'Arbrefer', `NameLoc3`='Der Eisenwald', `NameLoc4`='铁木森林', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Железнолесье' WHERE (`Entry`='1767');
UPDATE `locales_area` SET `Entry`='1768', `NameLoc1`='강철나무 굴', `NameLoc2`='Caverne d\'Arbrefer', `NameLoc3`='Eisenstammhöhle', `NameLoc4`='铁木山洞', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Пещера Железнолесья' WHERE (`Entry`='1768');
UPDATE `locales_area` SET `Entry`='1769', `NameLoc1`='나무구렁 요새', `NameLoc2`='Repaire des Grumegueules', `NameLoc3`='Holzschlundfeste', `NameLoc4`='木喉要塞', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Крепость Древобрюхов' WHERE (`Entry`='1769');
UPDATE `locales_area` SET `Entry`='1770', `NameLoc1`='어둠의 요새', `NameLoc2`='Fort des ombres', `NameLoc3`='Schattenfeste', `NameLoc4`='暗影堡', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Оплот Теней' WHERE (`Entry`='1770');
UPDATE `locales_area` SET `Entry`='1771', `NameLoc1`='책략가의 사원', `NameLoc2`='Sanctuaire du Trompeur', `NameLoc3`='Schrein des Betrügers', `NameLoc4`='欺诈者神祠', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Святилище Искусителя' WHERE (`Entry`='1771');
UPDATE `locales_area` SET `Entry`='1777', `NameLoc1`='이타리우스의 동굴', `NameLoc2`='Caverne d\'Itharius', `NameLoc3`='Itharius\' Höhle', `NameLoc4`='伊萨里奥斯的洞穴', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Пещера Итара' WHERE (`Entry`='1777');
UPDATE `locales_area` SET `Entry`='1778', `NameLoc1`='슬픔의 그늘', `NameLoc2`='Noirchagrin', `NameLoc3`='Sorgendunkel', `NameLoc4`='忧伤湿地', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Горемрак' WHERE (`Entry`='1778');
UPDATE `locales_area` SET `Entry`='1779', `NameLoc1`='드레닐두르 마을', `NameLoc2`='Village de Draenil\'dur', `NameLoc3`='Draenil\'dur', `NameLoc4`='德莱尼村', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Деревня Дренил\'дур' WHERE (`Entry`='1779');
UPDATE `locales_area` SET `Entry`='1780', `NameLoc1`='부러진창 교차로', `NameLoc2`='Croisement de Lance-brisée', `NameLoc3`='Splitterspeerkreuzung', `NameLoc4`='断矛路口', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Развилка Расщепленного Копья' WHERE (`Entry`='1780');
UPDATE `locales_area` SET `Entry`='1797', `NameLoc1`='진흙늪', `NameLoc2`='Stagalbog', `NameLoc3`='Stagalsumpf', `NameLoc4`='雄鹿沼泽', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Вязкая топь' WHERE (`Entry`='1797');
UPDATE `locales_area` SET `Entry`='1798', `NameLoc1`='변화의 늪', `NameLoc2`='Le Bourbier changeant', `NameLoc3`='Der Wabersumpf', `NameLoc4`='流沙泥潭', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Ползучая трясина' WHERE (`Entry`='1798');
UPDATE `locales_area` SET `Entry`='1817', `NameLoc1`='진흙늪 동굴', `NameLoc2`='Caverne de Stagalbog', `NameLoc3`='Stagalsumpfhöhle', `NameLoc4`='雄鹿沼泽洞穴', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Пещера у Вязкой топи' WHERE (`Entry`='1817');
UPDATE `locales_area` SET `Entry`='1837', `NameLoc1`='마른나무껍질 동굴', `NameLoc2`='Cavernes Witherbark', `NameLoc3`='Witherbarkhöhlen', `NameLoc4`='枯木洞穴', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Пещеры Сухокожих' WHERE (`Entry`='1837');
UPDATE `locales_area` SET `Entry`='1857', `NameLoc1`='소라딘의 성벽', `NameLoc2`='Mur de Thoradin', `NameLoc3`='Thoradinswall', `NameLoc4`='索拉丁之墙', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Стена Торадина' WHERE (`Entry`='1857');
UPDATE `locales_area` SET `Entry`='1858', `NameLoc1`='돌주먹 언덕', `NameLoc2`='Boulder\'gor', `NameLoc3`='Fels\'gor', `NameLoc4`='博德戈尔', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Камен\'гор' WHERE (`Entry`='1858');
UPDATE `locales_area` SET `Entry`='1877', `NameLoc1`='송곳니 골짜기', `NameLoc2`='Vallée des crocs', `NameLoc3`='Fangzahntal', `NameLoc4`='巨牙谷', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Долина Клыков' WHERE (`Entry`='1877');
UPDATE `locales_area` SET `Entry`='1878', `NameLoc1`='먼지받이', `NameLoc2`='Vallée de la poussière', `NameLoc3`='Die Staubschüssel', `NameLoc4`='漫尘盆地', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Знойные Пески' WHERE (`Entry`='1878');
UPDATE `locales_area` SET `Entry`='1879', `NameLoc1`='신기루 벌판', `NameLoc2`='Vallée des mirages', `NameLoc3`='Illusionenebene', `NameLoc4`='雾气平原', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Маревые равнины' WHERE (`Entry`='1879');
UPDATE `locales_area` SET `Entry`='1880', `NameLoc1`='페더비어드의 오두막', `NameLoc2`='Taudis de Featherbeard', `NameLoc3`='Federbarts Hütte', `NameLoc4`='羽须小屋', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Домик Пероборода' WHERE (`Entry`='1880');
UPDATE `locales_area` SET `Entry`='1881', `NameLoc1`='신디거의 야영지', `NameLoc2`='Camp de Shindigger', `NameLoc3`='Shindiggers Lager', `NameLoc4`='拉普索迪营地', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Лагерь Выпивохи' WHERE (`Entry`='1881');
UPDATE `locales_area` SET `Entry`='1882', `NameLoc1`='역병안개 협곡', `NameLoc2`='Ravin de Pestebrume', `NameLoc3`='Seuchennebelklamm', `NameLoc4`='毒雾峡谷', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Чумная лощина' WHERE (`Entry`='1882');
UPDATE `locales_area` SET `Entry`='1883', `NameLoc1`='돌개바람 호수', `NameLoc2`='Lac Vent-vaillant', `NameLoc3`='Ehrenwindsee', `NameLoc4`='瓦罗温湖', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Озеро Доблести' WHERE (`Entry`='1883');
UPDATE `locales_area` SET `Entry`='1884', `NameLoc1`='아골와타', `NameLoc2`='Agol\'watha', `NameLoc3`='Agol\'watha', `NameLoc4`='亚戈瓦萨', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Агол\'вата' WHERE (`Entry`='1884');
UPDATE `locales_area` SET `Entry`='1885', `NameLoc1`='히리와타', `NameLoc2`='Hiri\'watha', `NameLoc3`='Hiri\'watha', `NameLoc4`='西利瓦萨', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Хири\'вата' WHERE (`Entry`='1885');
UPDATE `locales_area` SET `Entry`='1886', `NameLoc1`='굼벵이 폐허', `NameLoc2`='La Ruine aux rampants', `NameLoc3`='Die Gruselruinen', `NameLoc4`='爬虫废墟', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Ползучие руины' WHERE (`Entry`='1886');
UPDATE `locales_area` SET `Entry`='1887', `NameLoc1`='보겐의 절벽', `NameLoc2`='Escarpement de Bogen', `NameLoc3`='Bogens Kante', `NameLoc4`='伯根的棚屋', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Грот Богена' WHERE (`Entry`='1887');
UPDATE `locales_area` SET `Entry`='1897', `NameLoc1`='창조주의 정원', `NameLoc2`='La Terrasse des faiseurs', `NameLoc3`='Terrasse des Schöpfers', `NameLoc4`='造物者遗迹', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Терраса Творца' WHERE (`Entry`='1897');
UPDATE `locales_area` SET `Entry`='1898', `NameLoc1`='먼지바람 협곡', `NameLoc2`='Goulet de la Bourrasque', `NameLoc3`='Staubwindschlucht', `NameLoc4`='尘风峡谷', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Лощина Суховея' WHERE (`Entry`='1898');
UPDATE `locales_area` SET `Entry`='1917', `NameLoc1`='샤올와타', `NameLoc2`='Shaol\'watha', `NameLoc3`='Shaol\'watha', `NameLoc4`='沙尔瓦萨', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Шаол\'вата' WHERE (`Entry`='1917');
UPDATE `locales_area` SET `Entry`='1937', `NameLoc1`='해그늘 폐허', `NameLoc2`='Ruines d\'Ombre-du-Zénith', `NameLoc3`='Tagschattenruinen', `NameLoc4`='热影废墟', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Руины Полуденной Тени' WHERE (`Entry`='1937');
UPDATE `locales_area` SET `Entry`='1938', `NameLoc1`='무너진 기둥', `NameLoc2`='Pilier brisé', `NameLoc3`='Zerbrochene Säule', `NameLoc4`='破碎石柱', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Разбитая Колонна' WHERE (`Entry`='1938');
UPDATE `locales_area` SET `Entry`='1939', `NameLoc1`='끝없는 사막', `NameLoc2`='Désert Abysséen', `NameLoc3`='Die ewigen Sande', `NameLoc4`='深沙平原', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Безбрежные пески' WHERE (`Entry`='1939');
UPDATE `locales_area` SET `Entry`='1940', `NameLoc1`='거친파도 해안', `NameLoc2`='Rivage de Brisesud', `NameLoc3`='Südbrandung', `NameLoc4`='塔纳利斯南海', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Берег за Южной грядой' WHERE (`Entry`='1940');
UPDATE `locales_area` SET `Entry`='1941', `NameLoc1`='시간의 동굴', `NameLoc2`='Grottes du temps', `NameLoc3`='Die Höhlen der Zeit', `NameLoc4`='时光之穴', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Пещеры Времени' WHERE (`Entry`='1941');
UPDATE `locales_area` SET `Entry`='1942', `NameLoc1`='늪지대', `NameLoc2`='La Fondrière', `NameLoc3`='Die Marschen', `NameLoc4`='沼泽地', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Топи' WHERE (`Entry`='1942');
UPDATE `locales_area` SET `Entry`='1943', `NameLoc1`='강철바위 고원', `NameLoc2`='Plateau de Rochefer', `NameLoc3`='Eisensteinplateau', `NameLoc4`='铁石高原', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Плато Железного Камня' WHERE (`Entry`='1943');
UPDATE `locales_area` SET `Entry`='1957', `NameLoc1`='검은재 동굴', `NameLoc2`='Caverne de Noircharbon', `NameLoc3`='Blackcharhöhle', `NameLoc4`='黑炭谷', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Обугленная пещера' WHERE (`Entry`='1957');
UPDATE `locales_area` SET `Entry`='1958', `NameLoc1`='무두장이 야영지', `NameLoc2`='Camp de Tanner', `NameLoc3`='Tanners Lager', `NameLoc4`='制皮匠营地', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Палатка Дубильщицы' WHERE (`Entry`='1958');
UPDATE `locales_area` SET `Entry`='1959', `NameLoc1`='먼지불 골짜기', `NameLoc2`='Vallée des Escarbilles', `NameLoc3`='Staubfeuertal', `NameLoc4`='尘火谷', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Выжженная долина' WHERE (`Entry`='1959');
UPDATE `locales_area` SET `Entry`='1977', `NameLoc1`='줄구룹', `NameLoc2`='Zul\'Gurub', `NameLoc3`='Zul\'Gurub', `NameLoc4`='祖尔格拉布', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Зул\'Гуруб' WHERE (`Entry`='1977');
UPDATE `locales_area` SET `Entry`='1978', `NameLoc1`='안개갈대 주둔지', `NameLoc2`='Poste de Brumejonc', `NameLoc3`='Nebelschilfposten', `NameLoc4`='芦苇哨岗', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Тростниковая застава' WHERE (`Entry`='1978');
UPDATE `locales_area` SET `Entry`='1997', `NameLoc1`='피멍울 초소', `NameLoc2`='Poste de la Vénéneuse', `NameLoc3`='Blutgiftposten', `NameLoc4`='血毒岗哨', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Застава Отравленной Крови' WHERE (`Entry`='1997');
UPDATE `locales_area` SET `Entry`='1998', `NameLoc1`='갈퀴가지 숲', `NameLoc2`='Clairière de Griffebranche', `NameLoc3`='Nachtlaublichtung', `NameLoc4`='刺枝林地', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Поляна Когтистых Ветвей' WHERE (`Entry`='1998');
UPDATE `locales_area` SET `Entry`='2017', `NameLoc1`='스트라솔름', `NameLoc2`='Stratholme', `NameLoc3`='Stratholme', `NameLoc4`='斯坦索姆', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Стратхольм' WHERE (`Entry`='2017');
UPDATE `locales_area` SET `Entry`='2037', `NameLoc1`='그림자송곳니 성채', `NameLoc2`='UNUSEDShadowfang Keep 003', `NameLoc3`='UNUSEDShadowfang Keep 003', `NameLoc4`='UNUSEDShadowfang Keep 003', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='НЕ ИСПОЛЬЗУЕТСЯ Крепость Темного Клыка 003' WHERE (`Entry`='2037');
UPDATE `locales_area` SET `Entry`='2057', `NameLoc1`='스칼로맨스', `NameLoc2`='Scholomance', `NameLoc3`='Scholomance', `NameLoc4`='通灵学院', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Некроситет' WHERE (`Entry`='2057');
UPDATE `locales_area` SET `Entry`='2077', `NameLoc1`='황혼의 계곡', `NameLoc2`='Vallée du crépuscule', `NameLoc3`='Das Zwielichttal', `NameLoc4`='暮光谷', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Сумеречная долина' WHERE (`Entry`='2077');
UPDATE `locales_area` SET `Entry`='2078', `NameLoc1`='황혼의 해안', `NameLoc2`='Rivage du crépuscule', `NameLoc3`='Zwielichtufer', `NameLoc4`='暮光海岸', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Сумеречная излучина' WHERE (`Entry`='2078');
UPDATE `locales_area` SET `Entry`='2079', `NameLoc1`='알카즈 섬', `NameLoc2`='Ile d\'Alcaz', `NameLoc3`='Insel Alcaz', `NameLoc4`='奥卡兹岛', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Остров Алькац' WHERE (`Entry`='2079');
UPDATE `locales_area` SET `Entry`='2097', `NameLoc1`='먹구름 봉우리', `NameLoc2`='Cime de Noir-nuage', `NameLoc3`='Düsterwolkengipfel', `NameLoc4`='黑云峰', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Пик Темного Облака' WHERE (`Entry`='2097');
UPDATE `locales_area` SET `Entry`='2098', `NameLoc1`='새벽숲 지하묘지', `NameLoc2`='Catacombes du Bois-de-l\'Aube', `NameLoc3`='Katakomben des Morgenwaldes', `NameLoc4`='黎明墓穴', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Катакомбы Утреннего Леса' WHERE (`Entry`='2098');
UPDATE `locales_area` SET `Entry`='2099', `NameLoc1`='돌망루 요새', `NameLoc2`='Donjon de Guet-de-pierre', `NameLoc3`='Burg Steinwacht', `NameLoc4`='石堡要塞', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Крепость Каменной Стражи' WHERE (`Entry`='2099');
UPDATE `locales_area` SET `Entry`='2100', `NameLoc1`='마라우돈', `NameLoc2`='Maraudon', `NameLoc3`='Maraudon', `NameLoc4`='玛拉顿', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Мародон' WHERE (`Entry`='2100');
UPDATE `locales_area` SET `Entry`='2101', `NameLoc1`='스타우트라거 여관', `NameLoc2`='Auberge de la Fortebière', `NameLoc3`='Gasthof Zum Starkbier-Lager', `NameLoc4`='烈酒旅店', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Таверна \"Крепкое пойло\"' WHERE (`Entry`='2101');
UPDATE `locales_area` SET `Entry`='2102', `NameLoc1`='썬더브루 양조장', `NameLoc2`='Distillerie Thunderbrew', `NameLoc3`='Brauerei Donnerbräu', `NameLoc4`='雷酒酿制厂', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Таверна \"Громоварка\"' WHERE (`Entry`='2102');
UPDATE `locales_area` SET `Entry`='2103', `NameLoc1`='메네실 요새', `NameLoc2`='Donjon de Menethil', `NameLoc3`='Burg Menethil', `NameLoc4`='米奈希尔城堡', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Крепость Менетил' WHERE (`Entry`='2103');
UPDATE `locales_area` SET `Entry`='2104', `NameLoc1`='깊은바다 선술집', `NameLoc2`='Taverne de l\'Eau-profonde', `NameLoc3`='Deepwater Taverne', `NameLoc4`='深水旅店', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Таверна \"Большая вода\"' WHERE (`Entry`='2104');
UPDATE `locales_area` SET `Entry`='2117', `NameLoc1`='암흑의 무덤', `NameLoc2`='Tombeau des ombres', `NameLoc3`='Schattengrab', `NameLoc4`='灰影墓穴', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Мрачный склеп' WHERE (`Entry`='2117');
UPDATE `locales_area` SET `Entry`='2118', `NameLoc1`='브릴 마을회관', `NameLoc2`='Hôtel de ville de Brill', `NameLoc3`='Rathaus von Brill', `NameLoc4`='布瑞尔城镇大厅', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Ратуша Брилла' WHERE (`Entry`='2118');
UPDATE `locales_area` SET `Entry`='2119', `NameLoc1`='갤로우 선술집', `NameLoc2`='Taverne des Pendus', `NameLoc3`='Taverne Zur Galgenschlinge', `NameLoc4`='恐惧之末旅店', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Таверна \"Петля висельника\"' WHERE (`Entry`='2119');
UPDATE `locales_area` SET `Entry`='2137', `NameLoc1`='예언의 웅덩이', `NameLoc2`='The Pools of VisionUNUSED', `NameLoc3`='The Pools of VisionUNUSED', `NameLoc4`='The Pools of VisionUNUSED', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Пруды ВиденийНЕ ИСПОЛЬЗУЕТСЯ' WHERE (`Entry`='2137');
UPDATE `locales_area` SET `Entry`='2138', `NameLoc1`='공포의 안개굴', `NameLoc2`='Refuge de Brume-funeste', `NameLoc3`='Glutnebelbau', `NameLoc4`='鬼雾兽穴', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Пещера Багрового Тумана' WHERE (`Entry`='2138');
UPDATE `locales_area` SET `Entry`='2157', `NameLoc1`='바엘던 요새', `NameLoc2`='Donjon de Bael\'dun', `NameLoc3`='Burg Bael\'dun', `NameLoc4`='巴尔丹城堡', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Крепость Бейл\'дан' WHERE (`Entry`='2157');
UPDATE `locales_area` SET `Entry`='2158', `NameLoc1`='엠버스트라이프의 굴', `NameLoc2`='Tanière de Brandeguerre', `NameLoc3`='Aschenschwingens Bau', `NameLoc4`='埃博斯塔夫的巢穴', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Логово Огнебора' WHERE (`Entry`='2158');
UPDATE `locales_area` SET `Entry`='2159', `NameLoc1`='오닉시아의 둥지', `NameLoc2`='Repaire d\'Onyxia', `NameLoc3`='Onyxias Hort', `NameLoc4`='奥妮克希亚的巢穴', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Логово Ониксии' WHERE (`Entry`='2159');
UPDATE `locales_area` SET `Entry`='2160', `NameLoc1`='칼바람 광산', `NameLoc2`='Mine des Cisailles', `NameLoc3`='Scherwindmine', `NameLoc4`='狂风矿洞', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Рудник Ветрорезов' WHERE (`Entry`='2160');
UPDATE `locales_area` SET `Entry`='2161', `NameLoc1`='롤랜드 광산', `NameLoc2`='Destin de Roland', `NameLoc3`='Rolands Verdammnis', `NameLoc4`='罗兰之墓', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Погибель Роланда' WHERE (`Entry`='2161');
UPDATE `locales_area` SET `Entry`='2177', `NameLoc1`='투기장', `NameLoc2`='L\'arène', `NameLoc3`='Kampfring', `NameLoc4`='大竞技场', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Ринг' WHERE (`Entry`='2177');
UPDATE `locales_area` SET `Entry`='2197', `NameLoc1`='예언의 웅덩이', `NameLoc2`='Les Bassins de la Vision', `NameLoc3`='Die Teiche der Visionen', `NameLoc4`='预见之池', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Пруды Видений' WHERE (`Entry`='2197');
UPDATE `locales_area` SET `Entry`='2198', `NameLoc1`='동트는 협곡', `NameLoc2`='Ravin de Brèche-de-l\'Ombre', `NameLoc3`='Shadowbreakklamm', `NameLoc4`='破影峡谷', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Лощина Тьмы' WHERE (`Entry`='2198');
UPDATE `locales_area` SET `Entry`='2217', `NameLoc1`='부러진창 마을', `NameLoc2`='Village de la Lance brisée', `NameLoc3`='Bruchspeeringen', `NameLoc4`='断矛村', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Деревня Сломанного Копья' WHERE (`Entry`='2217');
UPDATE `locales_area` SET `Entry`='2237', `NameLoc1`='백사장 야영지', `NameLoc2`='Poste de Blanc-relais', `NameLoc3`='Weißgipfelposten', `NameLoc4`='白沙岗哨', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Застава Белого Плеса' WHERE (`Entry`='2237');
UPDATE `locales_area` SET `Entry`='2238', `NameLoc1`='고르니아', `NameLoc2`='Gornia', `NameLoc3`='Gornia', `NameLoc4`='戈尼亚', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Горния' WHERE (`Entry`='2238');
UPDATE `locales_area` SET `Entry`='2239', `NameLoc1`='제인의 눈동자 분화구', `NameLoc2`='Cratère de l\'Oeil de Zane', `NameLoc3`='Zanes-Auge-Krater', `NameLoc4`='赞恩之眼', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Око Зейна' WHERE (`Entry`='2239');
UPDATE `locales_area` SET `Entry`='2240', `NameLoc1`='신기루 경주장', `NameLoc2`='Piste des mirages', `NameLoc3`='Illusionenrennbahn', `NameLoc4`='沙漠赛道', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Виражи на Миражах' WHERE (`Entry`='2240');
UPDATE `locales_area` SET `Entry`='2241', `NameLoc1`='눈호랑이 바위', `NameLoc2`='Roc des Sabres-de-Givre', `NameLoc3`='Frostsäblerfelsen', `NameLoc4`='霜刀石', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Уступ Ледопардов' WHERE (`Entry`='2241');
UPDATE `locales_area` SET `Entry`='2242', `NameLoc1`='숨겨진 숲', `NameLoc2`='Le Bosquet caché', `NameLoc3`='Der versteckte Hain', `NameLoc4`='隐秘小林', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Сокрытая роща' WHERE (`Entry`='2242');
UPDATE `locales_area` SET `Entry`='2243', `NameLoc1`='나무구렁 야영지', `NameLoc2`='Poste des Grumegueules', `NameLoc3`='Holzschlundposten', `NameLoc4`='木喉岗哨', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Застава Древобрюхов' WHERE (`Entry`='2243');
UPDATE `locales_area` SET `Entry`='2244', `NameLoc1`='눈사태일족 마을', `NameLoc2`='Village Tombe-hiver', `NameLoc3`='Lager der Winterfelle', `NameLoc4`='寒水村', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Деревня Зимней Спячки' WHERE (`Entry`='2244');
UPDATE `locales_area` SET `Entry`='2245', `NameLoc1`='마즈소릴', `NameLoc2`='Mazthoril', `NameLoc3`='Mazthoril', `NameLoc4`='麦索瑞尔', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Мазторил' WHERE (`Entry`='2245');
UPDATE `locales_area` SET `Entry`='2246', `NameLoc1`='얼음불꽃 온천', `NameLoc2`='Sources de Givrefeu', `NameLoc3`='Die Frostfeuerquellen', `NameLoc4`='冰火温泉', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Источники Ледяного огня' WHERE (`Entry`='2246');
UPDATE `locales_area` SET `Entry`='2247', `NameLoc1`='얼음엉겅퀴 언덕', `NameLoc2`='Collines des Chardons de glace', `NameLoc3`='Eisdistelberge', `NameLoc4`='冰蓟岭', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Холмы Ледополоха' WHERE (`Entry`='2247');
UPDATE `locales_area` SET `Entry`='2248', `NameLoc1`='던 만다르', `NameLoc2`='Dun Mandarr', `NameLoc3`='Dun Mandarr', `NameLoc4`='丹曼达尔', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Дун Мандарр' WHERE (`Entry`='2248');
UPDATE `locales_area` SET `Entry`='2249', `NameLoc1`='서리속삭임 골짜기', `NameLoc2`='Gorge du Blanc murmure', `NameLoc3`='Frostwhisperschlucht', `NameLoc4`='霜语峡谷', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Теснина Ледяного Шепота' WHERE (`Entry`='2249');
UPDATE `locales_area` SET `Entry`='2250', `NameLoc1`='올빼미날개 숲', `NameLoc2`='Fourré de l\'Aile de la chouette', `NameLoc3`='Eulenflügeldickicht', `NameLoc4`='枭翼树丛', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Совиная чаща' WHERE (`Entry`='2250');
UPDATE `locales_area` SET `Entry`='2251', `NameLoc1`='켈테릴 호수', `NameLoc2`='Lac Kel\'Theril', `NameLoc3`='Kel\'Therilsee', `NameLoc4`='凯斯利尔湖', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Озеро Кел\'Терил' WHERE (`Entry`='2251');
UPDATE `locales_area` SET `Entry`='2252', `NameLoc1`='켈테릴의 폐허', `NameLoc2`='Les ruines de Kel\'Theril', `NameLoc3`='Die Ruinen von Kel\'Theril', `NameLoc4`='凯斯利尔废墟', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Руины Кел\'Терила' WHERE (`Entry`='2252');
UPDATE `locales_area` SET `Entry`='2253', `NameLoc1`='별똥별 마을', `NameLoc2`='Pluie-d\'Etoiles', `NameLoc3`='Starfall', `NameLoc4`='坠星村', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Деревня Звездопада' WHERE (`Entry`='2253');
UPDATE `locales_area` SET `Entry`='2254', `NameLoc1`='반탈로우 지하굴', `NameLoc2`='Refuge des saisons de Ban\'Thallow', `NameLoc3`='Grabhügel von Ban\'Thallow', `NameLoc4`='班萨罗兽穴', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Берлога Бен\'Таллоу' WHERE (`Entry`='2254');
UPDATE `locales_area` SET `Entry`='2255', `NameLoc1`='눈망루 마을', `NameLoc2`='Long-guet', `NameLoc3`='Everlook', `NameLoc4`='永望镇', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Круговзор' WHERE (`Entry`='2255');
UPDATE `locales_area` SET `Entry`='2256', `NameLoc1`='검은속삭임 협곡', `NameLoc2`='Gorge du Sombre murmure', `NameLoc3`='Die flüsternde Schlucht', `NameLoc4`='暗语峡谷', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Теснина Зловещего Шепота' WHERE (`Entry`='2256');
UPDATE `locales_area` SET `Entry`='2257', `NameLoc1`='깊은굴 지하철', `NameLoc2`='Tram des profondeurs', `NameLoc3`='Die Tiefenbahn', `NameLoc4`='矿道地铁', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Подземный поезд' WHERE (`Entry`='2257');
UPDATE `locales_area` SET `Entry`='2258', `NameLoc1`='곰팡이 계곡', `NameLoc2`='La Vallée des fongus', `NameLoc3`='Das Fungustal', `NameLoc4`='蘑菇谷', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Грибная долина' WHERE (`Entry`='2258');
UPDATE `locales_area` SET `Entry`='2259', `NameLoc1`='마리스 농장', `NameLoc2`='UNUSEDLa ferme des Marris', `NameLoc3`='UNUSEDThe Marris Stead', `NameLoc4`='UNUSEDThe Marris Stead', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='НЕ ИСПОЛЬЗУЕТСЯПоместье Маррисов' WHERE (`Entry`='2259');
UPDATE `locales_area` SET `Entry`='2260', `NameLoc1`='마리스 농장', `NameLoc2`='La ferme des Marris', `NameLoc3`='Marris\' Siedlung', `NameLoc4`='玛瑞斯农场', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Поместье Маррисов' WHERE (`Entry`='2260');
UPDATE `locales_area` SET `Entry`='2261', `NameLoc1`='지하 납골당', `NameLoc2`='Le caveau de Zaeldarr', `NameLoc3`='Das Tiefgewölbe', `NameLoc4`='墓室', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Крипта' WHERE (`Entry`='2261');
UPDATE `locales_area` SET `Entry`='2262', `NameLoc1`='다로우샤이어', `NameLoc2`='Darrowshire', `NameLoc3`='Darrowshire', `NameLoc4`='达隆郡', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Дарроушир' WHERE (`Entry`='2262');
UPDATE `locales_area` SET `Entry`='2263', `NameLoc1`='산마루 경비탑', `NameLoc2`='Tour de garde de la couronne', `NameLoc3`='Turm der Kronenwache', `NameLoc4`='皇冠哨塔', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Башня королевской стражи' WHERE (`Entry`='2263');
UPDATE `locales_area` SET `Entry`='2264', `NameLoc1`='코린 삼거리', `NameLoc2`='La Croisée de Corin', `NameLoc3`='Corins Kreuzung', `NameLoc4`='考林路口', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Перекресток Корина' WHERE (`Entry`='2264');
UPDATE `locales_area` SET `Entry`='2265', `NameLoc1`='붉은십자군 주둔지', `NameLoc2`='Camp de la Croisade', `NameLoc3`='Scharlachroter Stützpunkt', `NameLoc4`='血色十字军营地', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Лагерь Алого ордена' WHERE (`Entry`='2265');
UPDATE `locales_area` SET `Entry`='2266', `NameLoc1`='티르의 손 수도원', `NameLoc2`='Main de Tyr', `NameLoc3`='Tyrs Hand', `NameLoc4`='提尔之手', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Длань Тира' WHERE (`Entry`='2266');
UPDATE `locales_area` SET `Entry`='2267', `NameLoc1`='붉은십자군 대성당', `NameLoc2`='La Basilique écarlate', `NameLoc3`='Die scharlachrote Basilika', `NameLoc4`='血色十字军教堂', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Алая Базилика' WHERE (`Entry`='2267');
UPDATE `locales_area` SET `Entry`='2268', `NameLoc1`='희망의 빛 예배당', `NameLoc2`='Chapelle de l\'Espoir de Lumière', `NameLoc3`='Kapelle des hoffnungsvollen Lichts', `NameLoc4`='圣光之愿礼拜堂', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Часовня Последней Надежды' WHERE (`Entry`='2268');
UPDATE `locales_area` SET `Entry`='2269', `NameLoc1`='브라우만 밀농장', `NameLoc2`='Scierie de Browman', `NameLoc3`='Braumanns Mühle', `NameLoc4`='布洛米尔', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Лесопилка Бровача' WHERE (`Entry`='2269');
UPDATE `locales_area` SET `Entry`='2270', `NameLoc1`='맹독의 숲', `NameLoc2`='La Clairière nocive', `NameLoc3`='Das giftige Tal', `NameLoc4`='剧毒林地', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Ядовитая поляна' WHERE (`Entry`='2270');
UPDATE `locales_area` SET `Entry`='2271', `NameLoc1`='동부방벽 경비탑', `NameLoc2`='Tour du Mur d\'est', `NameLoc3`='Ostwallturm', `NameLoc4`='东墙哨塔', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Восточная башня' WHERE (`Entry`='2271');
UPDATE `locales_area` SET `Entry`='2272', `NameLoc1`='노스데일', `NameLoc2`='Valnord', `NameLoc3`='Nordtal', `NameLoc4`='北谷', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Северный Дол' WHERE (`Entry`='2272');
UPDATE `locales_area` SET `Entry`='2273', `NameLoc1`='줄마샤르', `NameLoc2`='Zul\'Mashar', `NameLoc3`='Zul\'Mashar', `NameLoc4`='祖玛沙尔', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Зул\'Машар' WHERE (`Entry`='2273');
UPDATE `locales_area` SET `Entry`='2274', `NameLoc1`='마즈라알로', `NameLoc2`='Mazra\'Alor', `NameLoc3`='Mazra\'Alor', `NameLoc4`='玛兹拉罗', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Мазра\'Алор' WHERE (`Entry`='2274');
UPDATE `locales_area` SET `Entry`='2275', `NameLoc1`='북부관문 경비탑', `NameLoc2`='Tour du Col du nord', `NameLoc3`='Nordpassturm', `NameLoc4`='北地哨塔', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Башня Северного перевала' WHERE (`Entry`='2275');
UPDATE `locales_area` SET `Entry`='2276', `NameLoc1`='쿠엘리시엔 오두막', `NameLoc2`='Gîte de Quel\'Lithien', `NameLoc3`='Quel\'Lithien-Lodge', `NameLoc4`='奎尔林斯小屋', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Сторожка Кель\'Литиен' WHERE (`Entry`='2276');
UPDATE `locales_area` SET `Entry`='2277', `NameLoc1`='역병의 숲', `NameLoc2`='Pestebois', `NameLoc3`='Der Pestwald', `NameLoc4`='病木林', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Проклятый лес' WHERE (`Entry`='2277');
UPDATE `locales_area` SET `Entry`='2278', `NameLoc1`='스컬지 요새', `NameLoc2`='Fort-Fléau', `NameLoc3`='Geißelfeste', `NameLoc4`='瘟疫要塞', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Оплот Плети' WHERE (`Entry`='2278');
UPDATE `locales_area` SET `Entry`='2279', `NameLoc1`='스트라솔름', `NameLoc2`='Stratholme', `NameLoc3`='Stratholme', `NameLoc4`='斯坦索姆', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Стратхольм' WHERE (`Entry`='2279');
UPDATE `locales_area` SET `Entry`='2280', `NameLoc1`='스트라솔름', `NameLoc2`='UNUSED Stratholme', `NameLoc3`='UNUSED Stratholme', `NameLoc4`='UNUSED Stratholme', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='НЕ ИСПОЛЬЗУЕТСЯ Стратхольм' WHERE (`Entry`='2280');
UPDATE `locales_area` SET `Entry`='2297', `NameLoc1`='다로미어 호수', `NameLoc2`='Lac Darrowmere', `NameLoc3`='Darrowmeresee', `NameLoc4`='达隆米尔湖', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Озеро Дарроумир' WHERE (`Entry`='2297');
UPDATE `locales_area` SET `Entry`='2298', `NameLoc1`='카엘 다로우', `NameLoc2`='Caer Darrow', `NameLoc3`='Caer Darrow', `NameLoc4`='凯尔达隆', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Каэр Дарроу' WHERE (`Entry`='2298');
UPDATE `locales_area` SET `Entry`='2299', `NameLoc1`='다로미어 호수', `NameLoc2`='Lac Darrowmere', `NameLoc3`='Darrowmeresee', `NameLoc4`='达隆米尔湖', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Озеро Дарроумир' WHERE (`Entry`='2299');
UPDATE `locales_area` SET `Entry`='2300', `NameLoc1`='시간의 동굴', `NameLoc2`='Grottes du temps', `NameLoc3`='Die Höhlen der Zeit', `NameLoc4`='时光之穴', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Пещеры Времени' WHERE (`Entry`='2300');
UPDATE `locales_area` SET `Entry`='2301', `NameLoc1`='엉겅퀴 마을', `NameLoc2`='Village des Crins-de-Chardon', `NameLoc3`='Lager der Distelfelle', `NameLoc4`='蓟皮村', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Деревня Колючего Меха' WHERE (`Entry`='2301');
UPDATE `locales_area` SET `Entry`='2302', `NameLoc1`='먼지 수렁', `NameLoc2`='Le Bourbier', `NameLoc3`='Der Morast', `NameLoc4`='泥潭沼泽', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Трясина' WHERE (`Entry`='2302');
UPDATE `locales_area` SET `Entry`='2303', `NameLoc1`='갈기바람 협곡', `NameLoc2`='Canyon de Brisevent', `NameLoc3`='Schlucht der heulenden Winde', `NameLoc4`='风裂峡谷', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Безветренный каньон' WHERE (`Entry`='2303');
UPDATE `locales_area` SET `Entry`='2317', `NameLoc1`='남쪽 바다', `NameLoc2`='Mers du sud', `NameLoc3`='Die südlichen Meere', `NameLoc4`='南海', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Южные моря' WHERE (`Entry`='2317');
UPDATE `locales_area` SET `Entry`='2318', `NameLoc1`='대해', `NameLoc2`='La Grande mer', `NameLoc3`='Das große Meer', `NameLoc4`='无尽之海', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Великое море' WHERE (`Entry`='2318');
UPDATE `locales_area` SET `Entry`='2319', `NameLoc1`='대해', `NameLoc2`='La Grande mer', `NameLoc3`='Das große Meer', `NameLoc4`='无尽之海', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Великое море' WHERE (`Entry`='2319');
UPDATE `locales_area` SET `Entry`='2320', `NameLoc1`='대해', `NameLoc2`='La Grande mer', `NameLoc3`='Das große Meer', `NameLoc4`='无尽之海', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Великое море' WHERE (`Entry`='2320');
UPDATE `locales_area` SET `Entry`='2321', `NameLoc1`='대해', `NameLoc2`='La Grande mer', `NameLoc3`='Das große Meer', `NameLoc4`='无尽之海', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Великое море' WHERE (`Entry`='2321');
UPDATE `locales_area` SET `Entry`='2322', `NameLoc1`='장막의 바다', `NameLoc2`='La Mer voilée', `NameLoc3`='Das verhüllte Meer', `NameLoc4`='迷雾之海', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Сокрытое море' WHERE (`Entry`='2322');
UPDATE `locales_area` SET `Entry`='2323', `NameLoc1`='장막의 바다', `NameLoc2`='La Mer voilée', `NameLoc3`='Das verhüllte Meer', `NameLoc4`='迷雾之海', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Сокрытое море' WHERE (`Entry`='2323');
UPDATE `locales_area` SET `Entry`='2324', `NameLoc1`='장막의 바다', `NameLoc2`='La Mer voilée', `NameLoc3`='Das verhüllte Meer', `NameLoc4`='迷雾之海', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Сокрытое море' WHERE (`Entry`='2324');
UPDATE `locales_area` SET `Entry`='2325', `NameLoc1`='장막의 바다', `NameLoc2`='La Mer voilée', `NameLoc3`='Das verhüllte Meer', `NameLoc4`='迷雾之海', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Сокрытое море' WHERE (`Entry`='2325');
UPDATE `locales_area` SET `Entry`='2326', `NameLoc1`='장막의 바다', `NameLoc2`='La Mer voilée', `NameLoc3`='Das verhüllte Meer', `NameLoc4`='迷雾之海', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Сокрытое море' WHERE (`Entry`='2326');
UPDATE `locales_area` SET `Entry`='2337', `NameLoc1`='칼바람 언덕 병영', `NameLoc2`='Caserne de Tranchecolline', `NameLoc3`='Kaserne von Klingenhügel', `NameLoc4`='剃刀岭兵营', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Казармы Колючего Холма' WHERE (`Entry`='2337');
UPDATE `locales_area` SET `Entry`='2338', `NameLoc1`='남쪽 바다', `NameLoc2`='Mers du sud', `NameLoc3`='Die südlichen Meere', `NameLoc4`='南海', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Южные моря' WHERE (`Entry`='2338');
UPDATE `locales_area` SET `Entry`='2339', `NameLoc1`='대해', `NameLoc2`='La Grande mer', `NameLoc3`='Das große Meer', `NameLoc4`='无尽之海', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Великое море' WHERE (`Entry`='2339');
UPDATE `locales_area` SET `Entry`='2357', `NameLoc1`='붉은송곳니 야영지', `NameLoc2`='Camp de Dent-rouge', `NameLoc3`='Blutreißers Lager', `NameLoc4`='血牙营地', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Лагерь Кровавого Клыка' WHERE (`Entry`='2357');
UPDATE `locales_area` SET `Entry`='2358', `NameLoc1`='숲의 노래', `NameLoc2`='Chant des forêts', `NameLoc3`='Forest Song', `NameLoc4`='林歌神殿', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Лесная Песнь' WHERE (`Entry`='2358');
UPDATE `locales_area` SET `Entry`='2359', `NameLoc1`='푸른발 마을', `NameLoc2`='Village des Pattes-vertes', `NameLoc3`='Laubtatzenlichtung', `NameLoc4`='绿爪村', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Деревня Зеленой Лапы' WHERE (`Entry`='2359');
UPDATE `locales_area` SET `Entry`='2360', `NameLoc1`='은빛날개 전초기지', `NameLoc2`='Avant-poste d\'Aile-argent', `NameLoc3`='Außenposten der Silverwing', `NameLoc4`='银翼哨站', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Аванпост Среброкрылых' WHERE (`Entry`='2360');
UPDATE `locales_area` SET `Entry`='2361', `NameLoc1`='나이트헤이븐', `NameLoc2`='Havrenuit', `NameLoc3`='Nighthaven', `NameLoc4`='永夜港', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Ночная Гавань' WHERE (`Entry`='2361');
UPDATE `locales_area` SET `Entry`='2362', `NameLoc1`='레물로스의 제단', `NameLoc2`='Sanctuaire de Remulos', `NameLoc3`='Der Schrein von Remulos', `NameLoc4`='雷姆洛斯神殿', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Святилище Ремула' WHERE (`Entry`='2362');
UPDATE `locales_area` SET `Entry`='2363', `NameLoc1`='스톰레이지 지하굴', `NameLoc2`='Refuge des saisons de Malfurion', `NameLoc3`='Die Stormrage Grabhügel', `NameLoc4`='怒风兽穴', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Кельи Малфуриона' WHERE (`Entry`='2363');
UPDATE `locales_area` SET `Entry`='2364', `NameLoc1`='대해', `NameLoc2`='La Grande mer', `NameLoc3`='Das große Meer', `NameLoc4`='无尽之海', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Великое море' WHERE (`Entry`='2364');
UPDATE `locales_area` SET `Entry`='2365', `NameLoc1`='대해', `NameLoc2`='La Grande mer', `NameLoc3`='Das große Meer', `NameLoc4`='无尽之海', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Великое море' WHERE (`Entry`='2365');
UPDATE `locales_area` SET `Entry`='2366', `NameLoc1`='검은늪', `NameLoc2`='Le Noir Marécage', `NameLoc3`='Das schwarze Fenn', `NameLoc4`='黑色沼泽', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Черные топи' WHERE (`Entry`='2366');
UPDATE `locales_area` SET `Entry`='2367', `NameLoc1`='옛 힐스브래드 구릉지', `NameLoc2`='Anciens contreforts d\'Hillsbrad', `NameLoc3`='Die alten Vorgebirge von Hillsbrad', `NameLoc4`='Old Hillsbrad Foothills', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Старые предгорья Хилсбрада' WHERE (`Entry`='2367');
UPDATE `locales_area` SET `Entry`='2368', `NameLoc1`='타렌 밀농장', `NameLoc2`='Moulin-de-Tarren', `NameLoc3`='Tarrens Mühle', `NameLoc4`='塔伦米尔', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Мельница Таррен' WHERE (`Entry`='2368');
UPDATE `locales_area` SET `Entry`='2369', `NameLoc1`='사우스쇼어', `NameLoc2`='Southshore', `NameLoc3`='Southshore', `NameLoc4`='南海镇', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Южнобережье' WHERE (`Entry`='2369');
UPDATE `locales_area` SET `Entry`='2370', `NameLoc1`='던홀드 요새', `NameLoc2`='Donjon de Durnholde', `NameLoc3`='Burg Durnholde', `NameLoc4`='敦霍尔德城堡', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Крепость Дарнхольд' WHERE (`Entry`='2370');
UPDATE `locales_area` SET `Entry`='2371', `NameLoc1`='던 가록', `NameLoc2`='Dun Garok', `NameLoc3`='Dun Garok', `NameLoc4`='丹加洛克', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Дун Гарок' WHERE (`Entry`='2371');
UPDATE `locales_area` SET `Entry`='2372', `NameLoc1`='힐스브래드 농장', `NameLoc2`='Champs d\'Hillsbrad', `NameLoc3`='Die Felder von Hillsbrad', `NameLoc4`='希尔斯布莱德农场', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Хилсбрадские поля' WHERE (`Entry`='2372');
UPDATE `locales_area` SET `Entry`='2373', `NameLoc1`='동부 해안', `NameLoc2`='Rivage oriental', `NameLoc3`='Oststrand', `NameLoc4`='东部海滩', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Восточное побережье' WHERE (`Entry`='2373');
UPDATE `locales_area` SET `Entry`='2374', `NameLoc1`='네산더 농장', `NameLoc2`='Ferme des Nethander', `NameLoc3`='Nethander-Siedlung', `NameLoc4`='奈杉德哨岗', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Владение Нетандера' WHERE (`Entry`='2374');
UPDATE `locales_area` SET `Entry`='2375', `NameLoc1`='다로우 언덕', `NameLoc2`='Colline de Darrow', `NameLoc3`='Darrow Hill', `NameLoc4`='达隆山', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Холм Дарроу' WHERE (`Entry`='2375');
UPDATE `locales_area` SET `Entry`='2376', `NameLoc1`='남부 경비탑', `NameLoc2`='Tour de la Pointe du Midi', `NameLoc3`='Südwacht', `NameLoc4`='南点哨塔', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Южная башня' WHERE (`Entry`='2376');
UPDATE `locales_area` SET `Entry`='2377', `NameLoc1`='소라딘의 성벽', `NameLoc2`='Mur de Thoradin', `NameLoc3`='Thoradinswall', `NameLoc4`='索拉丁之墙', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Стена Торадина' WHERE (`Entry`='2377');
UPDATE `locales_area` SET `Entry`='2378', `NameLoc1`='서부 해안', `NameLoc2`='Rivage occidental', `NameLoc3`='Weststrand', `NameLoc4`='西部海岸', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Западное побережье' WHERE (`Entry`='2378');
UPDATE `locales_area` SET `Entry`='2379', `NameLoc1`='청금석 광산', `NameLoc2`='Mine d\'Azurelode', `NameLoc3`='Der Azurschacht', `NameLoc4`='碧玉矿洞', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Лазуритовый рудник' WHERE (`Entry`='2379');
UPDATE `locales_area` SET `Entry`='2397', `NameLoc1`='대해', `NameLoc2`='La Grande mer', `NameLoc3`='Das große Meer', `NameLoc4`='无尽之海', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Великое море' WHERE (`Entry`='2397');
UPDATE `locales_area` SET `Entry`='2398', `NameLoc1`='대해', `NameLoc2`='La Grande mer', `NameLoc3`='Das große Meer', `NameLoc4`='无尽之海', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Великое море' WHERE (`Entry`='2398');
UPDATE `locales_area` SET `Entry`='2399', `NameLoc1`='대해', `NameLoc2`='La Grande mer', `NameLoc3`='Das große Meer', `NameLoc4`='无尽之海', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Великое море' WHERE (`Entry`='2399');
UPDATE `locales_area` SET `Entry`='2400', `NameLoc1`='성난 바다', `NameLoc2`='La Mer interdite', `NameLoc3`='Das verbotene Meer', `NameLoc4`='禁忌之海', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Зловещее море' WHERE (`Entry`='2400');
UPDATE `locales_area` SET `Entry`='2401', `NameLoc1`='성난 바다', `NameLoc2`='La Mer interdite', `NameLoc3`='Das verbotene Meer', `NameLoc4`='禁忌之海', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Зловещее море' WHERE (`Entry`='2401');
UPDATE `locales_area` SET `Entry`='2402', `NameLoc1`='성난 바다', `NameLoc2`='La Mer interdite', `NameLoc3`='Das verbotene Meer', `NameLoc4`='禁忌之海', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Зловещее море' WHERE (`Entry`='2402');
UPDATE `locales_area` SET `Entry`='2403', `NameLoc1`='성난 바다', `NameLoc2`='La Mer interdite', `NameLoc3`='Das verbotene Meer', `NameLoc4`='禁忌之海', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Зловещее море' WHERE (`Entry`='2403');
UPDATE `locales_area` SET `Entry`='2404', `NameLoc1`='테드리스 아란', `NameLoc2`='Tethris Aran', `NameLoc3`='Tethris Aran', `NameLoc4`='塔迪萨兰', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Тефрис-Аран' WHERE (`Entry`='2404');
UPDATE `locales_area` SET `Entry`='2405', `NameLoc1`='에텔 레소르', `NameLoc2`='Ethel Rethor', `NameLoc3`='Ethel Rethor', `NameLoc4`='艾瑟雷索', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Этель-Ретор' WHERE (`Entry`='2405');
UPDATE `locales_area` SET `Entry`='2406', `NameLoc1`='라나즈자르 섬', `NameLoc2`='Ile de Ranazjar', `NameLoc3`='Die Insel Ranazjar', `NameLoc4`='拉纳加尔岛', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Остров Раназьяр' WHERE (`Entry`='2406');
UPDATE `locales_area` SET `Entry`='2407', `NameLoc1`='코르메크의 오두막', `NameLoc2`='Hutte de Kormek', `NameLoc3`='Kormeks Hütte', `NameLoc4`='考米克小屋', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Хижина Кормека' WHERE (`Entry`='2407');
UPDATE `locales_area` SET `Entry`='2408', `NameLoc1`='그늘수렵 마을', `NameLoc2`='Proie-de-l\'Ombre', `NameLoc3`='Shadowprey', `NameLoc4`='葬影村', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Деревня Ночных Охотников' WHERE (`Entry`='2408');
UPDATE `locales_area` SET `Entry`='2417', `NameLoc1`='검은바위 고개', `NameLoc2`='Défilé des Blackrock', `NameLoc3`='Blackrockpass', `NameLoc4`='黑石小径', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Перевал Черной горы' WHERE (`Entry`='2417');
UPDATE `locales_area` SET `Entry`='2418', `NameLoc1`='모건의 망루', `NameLoc2`='Veille de Morgan', `NameLoc3`='Morgans Wacht', `NameLoc4`='摩根的岗哨', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Дозор Моргана' WHERE (`Entry`='2418');
UPDATE `locales_area` SET `Entry`='2419', `NameLoc1`='뱀갈퀴 바위굴', `NameLoc2`='Roc sinueux', `NameLoc3`='Schlitterfels', `NameLoc4`='滑石', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Скользкая скала' WHERE (`Entry`='2419');
UPDATE `locales_area` SET `Entry`='2420', `NameLoc1`='공포의 날개 골짜기', `NameLoc2`='Chemin de l\'Aile de la terreur', `NameLoc3`='Schreckenspfad', `NameLoc4`='龙翼小径', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Тропа Крылатого Ужаса' WHERE (`Entry`='2420');
UPDATE `locales_area` SET `Entry`='2421', `NameLoc1`='드라코다르', `NameLoc2`='Draco\'dar', `NameLoc3`='Draco\'dar', `NameLoc4`='德拉考达尔', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Драко\'дар' WHERE (`Entry`='2421');
UPDATE `locales_area` SET `Entry`='2437', `NameLoc1`='성난불길 협곡', `NameLoc2`='Gouffre de Ragefeu', `NameLoc3`='Ragefireabgrund', `NameLoc4`='怒焰裂谷', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Огненная пропасть' WHERE (`Entry`='2437');
UPDATE `locales_area` SET `Entry`='2457', `NameLoc1`='별빛노래 숲', `NameLoc2`='Bois de Chantenuit', `NameLoc3`='Nightsongwälder', `NameLoc4`='夜歌森林', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Леса Ночной Песни' WHERE (`Entry`='2457');
UPDATE `locales_area` SET `Entry`='2477', `NameLoc1`='장막의 바다', `NameLoc2`='La Mer voilée', `NameLoc3`='Das verhüllte Meer', `NameLoc4`='迷雾之海', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Сокрытое море' WHERE (`Entry`='2477');
UPDATE `locales_area` SET `Entry`='2478', `NameLoc1`='모를로스아란', `NameLoc2`='Morlos\'Aran', `NameLoc3`='Morlos\'Aran', `NameLoc4`='摩罗萨兰', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Морлос\'Аран' WHERE (`Entry`='2478');
UPDATE `locales_area` SET `Entry`='2479', `NameLoc1`='에메랄드 성소', `NameLoc2`='Sanctuaire d\'émeraude', `NameLoc3`='Das Smaragdrefugium', `NameLoc4`='翡翠圣地', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Изумрудное святилище' WHERE (`Entry`='2479');
UPDATE `locales_area` SET `Entry`='2480', `NameLoc1`='비취불꽃 숲', `NameLoc2`='Vallon des Jadefeu', `NameLoc3`='Jadefeuertal', `NameLoc4`='碧火谷', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Долина Нефритового Пламени' WHERE (`Entry`='2480');
UPDATE `locales_area` SET `Entry`='2481', `NameLoc1`='콘스텔라스 폐허', `NameLoc2`='Ruines de Constellas', `NameLoc3`='Ruinen von Constellas', `NameLoc4`='克斯特拉斯废墟', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Руины Констелласа' WHERE (`Entry`='2481');
UPDATE `locales_area` SET `Entry`='2497', `NameLoc1`='시련의 산마루', `NameLoc2`='Confins amers', `NameLoc3`='Bittere Landzunge', `NameLoc4`='痛苦海岸', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Горькие плесы' WHERE (`Entry`='2497');
UPDATE `locales_area` SET `Entry`='2517', `NameLoc1`='파멸자의 봉우리', `NameLoc2`='Cime du Souilleur', `NameLoc3`='Anhöhe des Entweihers', `NameLoc4`='污染者高地', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Утес Осквернителя' WHERE (`Entry`='2517');
UPDATE `locales_area` SET `Entry`='2518', `NameLoc1`='라리스 정자', `NameLoc2`='Pavillon de Lariss', `NameLoc3`='Lariss\' Pavillon', `NameLoc4`='拉瑞斯小亭', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Павильон Лорисс' WHERE (`Entry`='2518');
UPDATE `locales_area` SET `Entry`='2519', `NameLoc1`='덩굴발 언덕', `NameLoc2`='Collines des Griffebois', `NameLoc3`='Waldpfotenhügel', `NameLoc4`='木爪岭', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Холмы Древолапов' WHERE (`Entry`='2519');
UPDATE `locales_area` SET `Entry`='2520', `NameLoc1`='덩굴발일족 소굴', `NameLoc2`='Tanière des Griffebois', `NameLoc3`='Waldpfotenbau', `NameLoc4`='木爪巢穴', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Логово Древолапов' WHERE (`Entry`='2520');
UPDATE `locales_area` SET `Entry`='2521', `NameLoc1`='베르단티스 강', `NameLoc2`='La Verdantis', `NameLoc3`='Verdantis', `NameLoc4`='沃丹提斯河', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Река Вердантис' WHERE (`Entry`='2521');
UPDATE `locales_area` SET `Entry`='2522', `NameLoc1`='이실디엔 폐허', `NameLoc2`='Ruines d\'Isildien', `NameLoc3`='Ruinen von Isildien', `NameLoc4`='伊斯迪尔废墟', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Руины Исильдиэна' WHERE (`Entry`='2522');
UPDATE `locales_area` SET `Entry`='2537', `NameLoc1`='그림토템 초소', `NameLoc2`='Poste Totem sinistre', `NameLoc3`='Posten der Grimmtotem', `NameLoc4`='恐怖图腾岗哨', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Застава Зловещего Тотема' WHERE (`Entry`='2537');
UPDATE `locales_area` SET `Entry`='2538', `NameLoc1`='아파라제 야영지', `NameLoc2`='Camp Aparaje', `NameLoc3`='Camp Aparaje', `NameLoc4`='阿帕拉耶营地', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Лагерь Апарахе' WHERE (`Entry`='2538');
UPDATE `locales_area` SET `Entry`='2539', `NameLoc1`='말라카진', `NameLoc2`='Malaka\'jin', `NameLoc3`='Malaka\'jin', `NameLoc4`='玛拉卡金', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Малака\'джин' WHERE (`Entry`='2539');
UPDATE `locales_area` SET `Entry`='2540', `NameLoc1`='구릉바위 협곡', `NameLoc2`='Ravin des Eboulis', `NameLoc3`='Steinschlagklamm', `NameLoc4`='滚岩峡谷', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Ущелье Камнепадов' WHERE (`Entry`='2540');
UPDATE `locales_area` SET `Entry`='2541', `NameLoc1`='시쉬르 협곡', `NameLoc2`='Canyon de Sishir', `NameLoc3`='Sishircanyon', `NameLoc4`='希塞尔山谷', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Сиширский каньон' WHERE (`Entry`='2541');
UPDATE `locales_area` SET `Entry`='2557', `NameLoc1`='혈투의 전장', `NameLoc2`='Hache-tripes', `NameLoc3`='Düsterbruch', `NameLoc4`='厄运之槌', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Забытый Город' WHERE (`Entry`='2557');
UPDATE `locales_area` SET `Entry`='2558', `NameLoc1`='죽음의 협곡', `NameLoc2`='Ravin de Deuillevent', `NameLoc3`='Schlucht der Totenwinde', `NameLoc4`='逆风谷', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Овраг Мертвого Ветра' WHERE (`Entry`='2558');
UPDATE `locales_area` SET `Entry`='2559', `NameLoc1`='다이아몬드 강', `NameLoc2`='Rivière Diamondhead', `NameLoc3`='Diamondhead', `NameLoc4`='钻石河', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Река Алмазная' WHERE (`Entry`='2559');
UPDATE `locales_area` SET `Entry`='2560', `NameLoc1`='아리덴의 야영지', `NameLoc2`='Camp d\'Ariden', `NameLoc3`='Aridens Lager', `NameLoc4`='埃瑞丁营地', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Лагерь Аридена' WHERE (`Entry`='2560');
UPDATE `locales_area` SET `Entry`='2561', `NameLoc1`='악의 소굴', `NameLoc2`='L\'Etau', `NameLoc3`='Das Laster', `NameLoc4`='罪恶谷', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Погань' WHERE (`Entry`='2561');
UPDATE `locales_area` SET `Entry`='2562', `NameLoc1`='카라잔', `NameLoc2`='Karazhan', `NameLoc3`='Karazhan', `NameLoc4`='卡拉赞', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Каражан' WHERE (`Entry`='2562');
UPDATE `locales_area` SET `Entry`='2563', `NameLoc1`='모건의 터', `NameLoc2`='Le lopin de Morgan', `NameLoc3`='Morgan\'s Plot', `NameLoc4`='摩根墓场', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Надел Моргана' WHERE (`Entry`='2563');
UPDATE `locales_area` SET `Entry`='2577', `NameLoc1`='혈투의 전장', `NameLoc2`='Hache-tripes', `NameLoc3`='Düsterbruch', `NameLoc4`='厄运之槌', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Забытый Город' WHERE (`Entry`='2577');
UPDATE `locales_area` SET `Entry`='2597', `NameLoc1`='알터랙 계곡', `NameLoc2`='Vallée d\'Alterac', `NameLoc3`='Alteractal', `NameLoc4`='奥特兰克山谷', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Альтеракская долина' WHERE (`Entry`='2597');
UPDATE `locales_area` SET `Entry`='2617', `NameLoc1`='스크래블스크류의 야영지', `NameLoc2`='Camp de Scrabblescrew', `NameLoc3`='Scrabblescrews Lager', `NameLoc4`='瑟卡布斯库的营地', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Лагерь Заржавня' WHERE (`Entry`='2617');
UPDATE `locales_area` SET `Entry`='2618', `NameLoc1`='비취불꽃 비탈', `NameLoc2`='Défilé des Jadefeu', `NameLoc3`='Jadefeuerbach', `NameLoc4`='碧火小径', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Холм Нефритового Пламени' WHERE (`Entry`='2618');
UPDATE `locales_area` SET `Entry`='2619', `NameLoc1`='톤드로릴 강', `NameLoc2`='La Thondroril', `NameLoc3`='Thondroril', `NameLoc4`='索多里尔河', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Река Тондрорил' WHERE (`Entry`='2619');
UPDATE `locales_area` SET `Entry`='2620', `NameLoc1`='톤드로릴 강', `NameLoc2`='La Thondroril', `NameLoc3`='Thondroril', `NameLoc4`='索多里尔河', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Река Тондрорил' WHERE (`Entry`='2620');
UPDATE `locales_area` SET `Entry`='2621', `NameLoc1`='메렐다르 호수', `NameLoc2`='Lac Mereldar', `NameLoc3`='Mereldarsee', `NameLoc4`='米雷达尔湖', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Озеро Мерельдар' WHERE (`Entry`='2621');
UPDATE `locales_area` SET `Entry`='2622', `NameLoc1`='전염의 흉터', `NameLoc2`='Balafre pestilentielle', `NameLoc3`='Pestilenznarbe', `NameLoc4`='瘟疫之痕', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Моровой овраг' WHERE (`Entry`='2622');
UPDATE `locales_area` SET `Entry`='2623', `NameLoc1`='오염의 흉터', `NameLoc2`='La Balafre infecte', `NameLoc3`='Die Infektnarbe', `NameLoc4`='魔刃之痕', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Чумной овраг' WHERE (`Entry`='2623');
UPDATE `locales_area` SET `Entry`='2624', `NameLoc1`='검은나무 호수', `NameLoc2`='Lac de Noirbois', `NameLoc3`='Blackwoodsee', `NameLoc4`='黑木湖', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Озеро Чернолесья' WHERE (`Entry`='2624');
UPDATE `locales_area` SET `Entry`='2625', `NameLoc1`='동부방벽 관문', `NameLoc2`='Porte du Mur d\'est', `NameLoc3`='Ostwalltor', `NameLoc4`='东墙大门', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Восточные ворота' WHERE (`Entry`='2625');
UPDATE `locales_area` SET `Entry`='2626', `NameLoc1`='공포의 거미굴', `NameLoc2`='Tunnel de Tisse-terreur', `NameLoc3`='Terrorweb-Tunnel', `NameLoc4`='恶蛛隧道', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Туннель Ужаса' WHERE (`Entry`='2626');
UPDATE `locales_area` SET `Entry`='2627', `NameLoc1`='테러데일', `NameLoc2`='Val-Terreur', `NameLoc3`='Schreckenstal', `NameLoc4`='恐惧谷', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Долина Ужаса' WHERE (`Entry`='2627');
UPDATE `locales_area` SET `Entry`='2637', `NameLoc1`='카르가시아 요새', `NameLoc2`='Donjon de Kargathia', `NameLoc3`='Burg Kargathia', `NameLoc4`='卡加希亚要塞', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Крепость Каргатия' WHERE (`Entry`='2637');
UPDATE `locales_area` SET `Entry`='2657', `NameLoc1`='뼈의 골짜기', `NameLoc2`='Vallée des ossements', `NameLoc3`='Tal der Knochen', `NameLoc4`='白骨之谷', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Долина Костей' WHERE (`Entry`='2657');
UPDATE `locales_area` SET `Entry`='2677', `NameLoc1`='검은날개 둥지', `NameLoc2`='Repaire de l\'Aile noire', `NameLoc3`='Pechschwingenhort', `NameLoc4`='黑翼之巢', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Логово Крыла Тьмы' WHERE (`Entry`='2677');
UPDATE `locales_area` SET `Entry`='2697', `NameLoc1`='사자의 길', `NameLoc2`='Croisée de l\'homme mort', `NameLoc3`='Totmannsfurt', `NameLoc4`='死者十字', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Перекресток Мертвеца' WHERE (`Entry`='2697');
UPDATE `locales_area` SET `Entry`='2717', `NameLoc1`='화산 심장부', `NameLoc2`='Cœur du Magma', `NameLoc3`='Geschmolzener Kern', `NameLoc4`='熔火之心', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Огненные Недра' WHERE (`Entry`='2717');
UPDATE `locales_area` SET `Entry`='2737', `NameLoc1`='스카라베 성벽', `NameLoc2`='Le Mur du scarabée', `NameLoc3`='Der Skarabäuswall', `NameLoc4`='甲虫之墙', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Стена Скарабея' WHERE (`Entry`='2737');
UPDATE `locales_area` SET `Entry`='2738', `NameLoc1`='마파람 마을', `NameLoc2`='Village de Sudevent', `NameLoc3`='Südwindposten', `NameLoc4`='南风村', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Деревня Южного Ветра' WHERE (`Entry`='2738');
UPDATE `locales_area` SET `Entry`='2739', `NameLoc1`='황혼의 망치단 주둔지', `NameLoc2`='Campement du crépuscule', `NameLoc3`='Basislager der Twilight', `NameLoc4`='暮光营地', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Сумеречный лагерь' WHERE (`Entry`='2739');
UPDATE `locales_area` SET `Entry`='2740', `NameLoc1`='수정 골짜기', `NameLoc2`='La Vallée des cristaux', `NameLoc3`='Das Kristalltal', `NameLoc4`='水晶谷', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Долина Кристаллов' WHERE (`Entry`='2740');
UPDATE `locales_area` SET `Entry`='2741', `NameLoc1`='스카라베 제단', `NameLoc2`='L\'Estrade du scarabée', `NameLoc3`='Die Skarabäushöhe', `NameLoc4`='甲虫之台', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Помост Скарабея' WHERE (`Entry`='2741');
UPDATE `locales_area` SET `Entry`='2742', `NameLoc1`='하이브아쉬', `NameLoc2`='Ruche\'Ashi', `NameLoc3`='Bau des Ashischwarms', `NameLoc4`='亚什虫巢', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Улей Аши' WHERE (`Entry`='2742');
UPDATE `locales_area` SET `Entry`='2743', `NameLoc1`='하이브조라', `NameLoc2`='Ruche\'Zora', `NameLoc3`='Bau des Zoraschwarms', `NameLoc4`='佐拉虫巢', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Улей Зора' WHERE (`Entry`='2743');
UPDATE `locales_area` SET `Entry`='2744', `NameLoc1`='하이브레갈', `NameLoc2`='Ruche\'Regal', `NameLoc3`='Bau des Regalschwarms', `NameLoc4`='雷戈虫巢', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Улей Регал' WHERE (`Entry`='2744');
UPDATE `locales_area` SET `Entry`='2757', `NameLoc1`='전사한 용사의 제단', `NameLoc2`='Autel du Guerrier mort', `NameLoc3`='Schrein des gefallenen Kriegers', `NameLoc4`='战士之魂神殿', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Святилище Павшего Воина' WHERE (`Entry`='2757');
UPDATE `locales_area` SET `Entry`='2777', `NameLoc1`='알터랙 계곡', `NameLoc2`='UNUSED Alterac Valley', `NameLoc3`='UNUSED Alterac Valley', `NameLoc4`='UNUSED Alterac Valley', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='НЕ ИСПОЛЬЗУЕТСЯ Альтеракская долина' WHERE (`Entry`='2777');
UPDATE `locales_area` SET `Entry`='2797', `NameLoc1`='검은심연의 나락', `NameLoc2`='Profondeurs de Brassenoire', `NameLoc3`='Blackfathom-Tiefe', `NameLoc4`='黑暗深渊', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Непроглядная Пучина' WHERE (`Entry`='2797');
UPDATE `locales_area` SET `Entry`='2817', `NameLoc1`='*** 야외 던전 ***', `NameLoc2`='***Donjon sur la carte***', `NameLoc3`='***Dungeon auf Karte***', `NameLoc4`='***大型地下城***', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='***Используй меня повторно 4***' WHERE (`Entry`='2817');
UPDATE `locales_area` SET `Entry`='2837', `NameLoc1`='지배자의 지하실', `NameLoc2`='La cave du maître', `NameLoc3`='Der Keller des Meisters', `NameLoc4`='主宰的庇护所', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Хозяйский погреб' WHERE (`Entry`='2837');
UPDATE `locales_area` SET `Entry`='2838', `NameLoc1`='돌다지 고개', `NameLoc2`='Passage de Formepierre', `NameLoc3`='Stonewroughtpass', `NameLoc4`='石坝小径', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Подгорная тропа' WHERE (`Entry`='2838');
UPDATE `locales_area` SET `Entry`='2839', `NameLoc1`='알터랙 계곡', `NameLoc2`='Vallée d\'Alterac', `NameLoc3`='Alteractal', `NameLoc4`='奥特兰克山谷', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Альтеракская долина' WHERE (`Entry`='2839');
UPDATE `locales_area` SET `Entry`='2857', `NameLoc1`='싸움 우리', `NameLoc2`='La Cage des grondements', `NameLoc3`='Der Rumblekäfig', `NameLoc4`='加基森竞技场', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Гремящая Клеть' WHERE (`Entry`='2857');
UPDATE `locales_area` SET `Entry`='2877', `NameLoc1`='땅덩어리 시험용', `NameLoc2`='Test de Chunk', `NameLoc3`='Brocken-Test', `NameLoc4`='Chunk Test', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Глыба Тест' WHERE (`Entry`='2877');
UPDATE `locales_area` SET `Entry`='2897', `NameLoc1`='조람가르 전초기지', `NameLoc2`='Avant-poste de Zoram\'gar', `NameLoc3`='Zoram\'gar-Außenposten', `NameLoc4`='佐拉姆加前哨站', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Форт Зорам\'гар' WHERE (`Entry`='2897');
UPDATE `locales_area` SET `Entry`='2917', `NameLoc1`='전설의 전당', `NameLoc2`='Hall des Légendes', `NameLoc3`='Halle der Legenden', `NameLoc4`='传说大厅', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Зал Легенд' WHERE (`Entry`='2917');
UPDATE `locales_area` SET `Entry`='2918', `NameLoc1`='용사의 전당', `NameLoc2`='Hall des Champions', `NameLoc3`='Halle der Champions', `NameLoc4`='勇士大厅', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Зал Защитника' WHERE (`Entry`='2918');
UPDATE `locales_area` SET `Entry`='2937', `NameLoc1`='그로쉬고크 주둔지', `NameLoc2`='Base des Grosh\'gok', `NameLoc3`='Das Grosh\'gok Lager', `NameLoc4`='格罗高克营地', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Поселок Грош\'гок' WHERE (`Entry`='2937');
UPDATE `locales_area` SET `Entry`='2938', `NameLoc1`='수면의 협곡', `NameLoc2`='Gorge endormie', `NameLoc3`='Die schlummernde Schlucht', `NameLoc4`='沉睡峡谷', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Спящая теснина' WHERE (`Entry`='2938');
UPDATE `locales_area` SET `Entry`='2957', `NameLoc1`='깊은무쇠 광산', `NameLoc2`='Mine de Gouffrefer', `NameLoc3`='Irondeep-Mine', `NameLoc4`='深铁矿洞', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Железный рудник' WHERE (`Entry`='2957');
UPDATE `locales_area` SET `Entry`='2958', `NameLoc1`='돌심장 전초기지', `NameLoc2`='Avant-poste de Stonehearth', `NameLoc3`='Stonehearth-Außenposten', `NameLoc4`='石炉哨站', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Форт Каменного Очага' WHERE (`Entry`='2958');
UPDATE `locales_area` SET `Entry`='2959', `NameLoc1`='던 발다르', `NameLoc2`='Dun Baldar', `NameLoc3`='Dun Baldar', `NameLoc4`='丹巴达尔', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Дун Болдар' WHERE (`Entry`='2959');
UPDATE `locales_area` SET `Entry`='2960', `NameLoc1`='얼음날개 고개', `NameLoc2`='Défilé de l\'Aile de glace', `NameLoc3`='Icewingpass', `NameLoc4`='冰翼小径', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Перевал Ледяного Крыла' WHERE (`Entry`='2960');
UPDATE `locales_area` SET `Entry`='2961', `NameLoc1`='서리늑대 마을', `NameLoc2`='Village Frostwolf', `NameLoc3`='Frostwolf', `NameLoc4`='霜狼村', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Деревня Северного Волка' WHERE (`Entry`='2961');
UPDATE `locales_area` SET `Entry`='2962', `NameLoc1`='거점 보초탑', `NameLoc2`='Tour de la halte', `NameLoc3`='Turmstellung', `NameLoc4`='哨塔高地', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Смотровая башня' WHERE (`Entry`='2962');
UPDATE `locales_area` SET `Entry`='2963', `NameLoc1`='얼음이빨 광산', `NameLoc2`='Mine de Froide-dent', `NameLoc3`='Coldtooth-Mine', `NameLoc4`='冷齿矿洞', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Рудник Ледяного Зуба' WHERE (`Entry`='2963');
UPDATE `locales_area` SET `Entry`='2964', `NameLoc1`='겨울도끼 요새', `NameLoc2`='Repaire des Winterax', `NameLoc3`='Feste der Winterax', `NameLoc4`='冰斧要塞', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Форт Ледяной Секиры' WHERE (`Entry`='2964');
UPDATE `locales_area` SET `Entry`='2977', `NameLoc1`='', `NameLoc2`='Garnison de Glace-sang', `NameLoc3`='Iceblood-Garnison', `NameLoc4`='冰血要塞', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Гарнизон Стылой Крови' WHERE (`Entry`='2977');
UPDATE `locales_area` SET `Entry`='2978', `NameLoc1`='', `NameLoc2`='Donjon Frostwolf', `NameLoc3`='Burg Frostwolf', `NameLoc4`='霜狼要塞', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Крепость Северного Волка' WHERE (`Entry`='2978');
UPDATE `locales_area` SET `Entry`='2979', `NameLoc1`='', `NameLoc2`='Ferme de Tor\'kren', `NameLoc3`='Tor\'krens Hof', `NameLoc4`='托克雷农场', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Ферма Тор\'кренов' WHERE (`Entry`='2979');
UPDATE `locales_area` SET `Entry`='3017', `NameLoc1`='', `NameLoc2`='Défilé de la Dague de givre', `NameLoc3`='Frostdagger-Pass', `NameLoc4`='霜刀小径', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Перевал Ледяного Клинка' WHERE (`Entry`='3017');
UPDATE `locales_area` SET `Entry`='3037', `NameLoc1`='', `NameLoc2`='Camp Rochefer', `NameLoc3`='Eisensteinlager', `NameLoc4`='铁石营地', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Лагерь Железного Камня' WHERE (`Entry`='3037');
UPDATE `locales_area` SET `Entry`='3038', `NameLoc1`='', `NameLoc2`='Cratère de Weazel', `NameLoc3`='Weazels Krater', `NameLoc4`='维吉尔之坑', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Кратер Криворука' WHERE (`Entry`='3038');
UPDATE `locales_area` SET `Entry`='3039', `NameLoc1`='', `NameLoc2`='Ruines de Tahonda', `NameLoc3`='Ruinen von Tahonda', `NameLoc4`='塔霍达废墟', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Руины Тахонды' WHERE (`Entry`='3039');
UPDATE `locales_area` SET `Entry`='3057', `NameLoc1`='', `NameLoc2`='Champ sanglant', `NameLoc3`='Feld des Kampfes', `NameLoc4`='征战平原', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Поле брани' WHERE (`Entry`='3057');
UPDATE `locales_area` SET `Entry`='3058', `NameLoc1`='', `NameLoc2`='Caverne de l\'Aile de glace', `NameLoc3`='Icewinghöhle', `NameLoc4`='冰翼洞穴', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Пещера Ледяного Крыла' WHERE (`Entry`='3058');
UPDATE `locales_area` SET `Entry`='3077', `NameLoc1`='', `NameLoc2`='Le repos des vaillants', `NameLoc3`='Heldenwacht', `NameLoc4`='勇士之墓', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Погост Отважных' WHERE (`Entry`='3077');
UPDATE `locales_area` SET `Entry`='3097', `NameLoc1`='', `NameLoc2`='Le pilier grouillant', `NameLoc3`='Die Schwarmsäule', `NameLoc4`='虫群之柱', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Роящаяся вершина' WHERE (`Entry`='3097');
UPDATE `locales_area` SET `Entry`='3098', `NameLoc1`='', `NameLoc2`='Poste du Crépuscule', `NameLoc3`='Twilight-Posten', `NameLoc4`='暮光岗哨', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Сумеречная застава' WHERE (`Entry`='3098');
UPDATE `locales_area` SET `Entry`='3099', `NameLoc1`='', `NameLoc2`='Avant-poste du Crépuscule', `NameLoc3`='Twilight-Außenposten', `NameLoc4`='暮光前哨站', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Сумеречный форт' WHERE (`Entry`='3099');
UPDATE `locales_area` SET `Entry`='3100', `NameLoc1`='', `NameLoc2`='Camp du Crépuscule ravagé', `NameLoc3`='Verwüsteter Twilight-Stützpunkt', `NameLoc4`='暮光营地废墟', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Разоренный Сумеречный лагерь' WHERE (`Entry`='3100');
UPDATE `locales_area` SET `Entry`='3117', `NameLoc1`='', `NameLoc2`='Antre de Shalzaru', `NameLoc3`='Shalzarus Unterschlupf', `NameLoc4`='沙尔扎鲁的巢穴', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Убежище Шалзару' WHERE (`Entry`='3117');
UPDATE `locales_area` SET `Entry`='3137', `NameLoc1`='', `NameLoc2`='Halte de Talrendis', `NameLoc3`='Talrendisspitze', `NameLoc4`='塔伦迪斯营地', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Застава Талрендис' WHERE (`Entry`='3137');
UPDATE `locales_area` SET `Entry`='3138', `NameLoc1`='', `NameLoc2`='Sanctuaire de Rethress', `NameLoc3`='Rethress Sanktum', `NameLoc4`='雷瑟斯圣所', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Святилище Ретресса' WHERE (`Entry`='3138');
UPDATE `locales_area` SET `Entry`='3139', `NameLoc1`='', `NameLoc2`='Antre de l\'Horreur lunaire', `NameLoc3`='Mondschreckensbau', `NameLoc4`='惨月洞穴', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Обитель Лунного Ужаса' WHERE (`Entry`='3139');
UPDATE `locales_area` SET `Entry`='3140', `NameLoc1`='', `NameLoc2`='Caverne de Barbe-d\'écailles', `NameLoc3`='Schuppenbarts Höhle', `NameLoc4`='鳞须海龟洞穴', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Пещера Чешуеборода' WHERE (`Entry`='3140');
UPDATE `locales_area` SET `Entry`='3157', `NameLoc1`='', `NameLoc2`='Caverne des Eboulis', `NameLoc3`='Steinschlaghöhle', `NameLoc4`='滚岩洞穴', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Пещера Камнепадов' WHERE (`Entry`='3157');
UPDATE `locales_area` SET `Entry`='3177', `NameLoc1`='', `NameLoc2`='Camp de travail Warsong', `NameLoc3`='Lager der Warsongarbeiter', `NameLoc4`='战歌劳工营地', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Рабочий лагерь Песни Войны' WHERE (`Entry`='3177');
UPDATE `locales_area` SET `Entry`='3197', `NameLoc1`='', `NameLoc2`='Camp du Noroît', `NameLoc3`='Chillwind-Lager', `NameLoc4`='寒风营地', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Лагерь Промозглого Ветра' WHERE (`Entry`='3197');
UPDATE `locales_area` SET `Entry`='3217', `NameLoc1`='', `NameLoc2`='L\'Etripoir', `NameLoc3`='Die Schlägergrube', `NameLoc4`='巨槌竞技场', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Ристалище' WHERE (`Entry`='3217');
UPDATE `locales_area` SET `Entry`='3237', `NameLoc1`='', `NameLoc2`='L\'Etripoir UNUSED', `NameLoc3`='Die Schlägergrube', `NameLoc4`='The Maul UNUSED', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Молот НЕ ИСПОЛЬЗУЕТСЯ' WHERE (`Entry`='3237');
UPDATE `locales_area` SET `Entry`='3257', `NameLoc1`='', `NameLoc2`='Restes de Grakkarond', `NameLoc3`='Knochen von Grakkarond', `NameLoc4`='格拉卡隆之骨', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Кости Граккаронда' WHERE (`Entry`='3257');
UPDATE `locales_area` SET `Entry`='3277', `NameLoc1`='', `NameLoc2`='Goulet des Warsong', `NameLoc3`='Warsongschlucht', `NameLoc4`='战歌峡谷', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Ущелье Песни Войны' WHERE (`Entry`='3277');
UPDATE `locales_area` SET `Entry`='3297', `NameLoc1`='', `NameLoc2`='Cimetière Frostwolf', `NameLoc3`='Friedhof der Frostwolf', `NameLoc4`='霜狼墓地', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Кладбище Северного Волка' WHERE (`Entry`='3297');
UPDATE `locales_area` SET `Entry`='3298', `NameLoc1`='', `NameLoc2`='Col Frostwolf', `NameLoc3`='Frostwolfpass', `NameLoc4`='霜狼小径', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Перевал Северного Волка' WHERE (`Entry`='3298');
UPDATE `locales_area` SET `Entry`='3299', `NameLoc1`='', `NameLoc2`='Col de Dun Baldar', `NameLoc3`='Pass von Dun Baldar', `NameLoc4`='丹巴达尔小径', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Перевал Дун Болдар' WHERE (`Entry`='3299');
UPDATE `locales_area` SET `Entry`='3300', `NameLoc1`='', `NameLoc2`='Cimetière de Glace-sang', `NameLoc3`='Iceblood-Friedhof', `NameLoc4`='冰血墓地', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Кладбище Стылой Крови' WHERE (`Entry`='3300');
UPDATE `locales_area` SET `Entry`='3301', `NameLoc1`='', `NameLoc2`='Cimetière des neiges', `NameLoc3`='Snowfall-Friedhof', `NameLoc4`='落雪墓地', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Кладбище Снегопада' WHERE (`Entry`='3301');
UPDATE `locales_area` SET `Entry`='3302', `NameLoc1`='', `NameLoc2`='Cimetière de Stonehearth', `NameLoc3`='Stonehearth-Friedhof', `NameLoc4`='石炉墓地', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Кладбище Каменного Очага' WHERE (`Entry`='3302');
UPDATE `locales_area` SET `Entry`='3303', `NameLoc1`='', `NameLoc2`='Cimetière Stormpike', `NameLoc3`='Stormpike-Friedhof', `NameLoc4`='雷矛墓地', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Кладбище Грозовой Вершины' WHERE (`Entry`='3303');
UPDATE `locales_area` SET `Entry`='3304', `NameLoc1`='', `NameLoc2`='Fortin de l\'Aile de glace', `NameLoc3`='Icewing-Bunker', `NameLoc4`='冰翼碉堡', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Укрытие Ледяного Крыла' WHERE (`Entry`='3304');
UPDATE `locales_area` SET `Entry`='3305', `NameLoc1`='', `NameLoc2`='Fortin de Stoneheartth', `NameLoc3`='Stonehearth-Bunker', `NameLoc4`='石炉碉堡', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Укрытие Каменного Очага' WHERE (`Entry`='3305');
UPDATE `locales_area` SET `Entry`='3306', `NameLoc1`='', `NameLoc2`='Crête des Follepattes', `NameLoc3`='Wildpfotengrat', `NameLoc4`='蛮爪岭', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Гряда Дикой Лапы' WHERE (`Entry`='3306');
UPDATE `locales_area` SET `Entry`='3317', `NameLoc1`='', `NameLoc2`='Village des Revantusk', `NameLoc3`='Revantusk', `NameLoc4`='恶齿村', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Деревня Сломанного Клыка' WHERE (`Entry`='3317');
UPDATE `locales_area` SET `Entry`='3318', `NameLoc1`='', `NameLoc2`='Rocher de Durotan', `NameLoc3`='Fels von Durotan', `NameLoc4`='杜隆坦之石', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Обелиск Дуротана' WHERE (`Entry`='3318');
UPDATE `locales_area` SET `Entry`='3319', `NameLoc1`='', `NameLoc2`='Bosquet d\'Aile-argent', `NameLoc3`='Hain der Silverwing', `NameLoc4`='银翼树林', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Роща Среброкрылых' WHERE (`Entry`='3319');
UPDATE `locales_area` SET `Entry`='3320', `NameLoc1`='', `NameLoc2`='Scierie des Warsong', `NameLoc3`='Sägewerk der Warsong', `NameLoc4`='战歌伐木场', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Лесопилка Песни Войны' WHERE (`Entry`='3320');
UPDATE `locales_area` SET `Entry`='3321', `NameLoc1`='', `NameLoc2`='Fort d\'Aile-argent', `NameLoc3`='Feste Silverwing', `NameLoc4`='银翼要塞', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Крепость Среброкрылых' WHERE (`Entry`='3321');
UPDATE `locales_area` SET `Entry`='3337', `NameLoc1`='', `NameLoc2`='Caverne des Follepattes', `NameLoc3`='Höhle der Wildpfoten', `NameLoc4`='蛮爪洞穴', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Пещера Дикой Лапы' WHERE (`Entry`='3337');
UPDATE `locales_area` SET `Entry`='3338', `NameLoc1`='', `NameLoc2`='La Faille voilée', `NameLoc3`='Die verhüllte Kluft', `NameLoc4`='迷雾裂隙', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Сокрытое ущелье' WHERE (`Entry`='3338');
UPDATE `locales_area` SET `Entry`='3357', `NameLoc1`='', `NameLoc2`='Ile de Yojamba', `NameLoc3`='Die Insel Yojamba', `NameLoc4`='尤亚姆巴岛', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Остров Йоджамба' WHERE (`Entry`='3357');
UPDATE `locales_area` SET `Entry`='3358', `NameLoc1`='', `NameLoc2`='Bassin d\'Arathi', `NameLoc3`='Arathibecken', `NameLoc4`='阿拉希盆地', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Низина Арати' WHERE (`Entry`='3358');
UPDATE `locales_area` SET `Entry`='3377', `NameLoc1`='', `NameLoc2`='L\'Anneau', `NameLoc3`='Die Windung', `NameLoc4`='毒蛇小径', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Змеиное Кольцо' WHERE (`Entry`='3377');
UPDATE `locales_area` SET `Entry`='3378', `NameLoc1`='', `NameLoc2`='Autel d\'Hir\'eek', `NameLoc3`='Altar von Hir\'eek', `NameLoc4`='希里克祭坛', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Алтарь Хир\'ика' WHERE (`Entry`='3378');
UPDATE `locales_area` SET `Entry`='3379', `NameLoc1`='', `NameLoc2`='Shadra\'zaar', `NameLoc3`='Shadra\'zaar', `NameLoc4`='沙德拉扎尔', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Шадра\'заар' WHERE (`Entry`='3379');
UPDATE `locales_area` SET `Entry`='3380', `NameLoc1`='', `NameLoc2`='Terres hakkari', `NameLoc3`='Hakkarigründe', `NameLoc4`='哈卡莱猎场', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Земли Хаккари' WHERE (`Entry`='3380');
UPDATE `locales_area` SET `Entry`='3381', `NameLoc1`='', `NameLoc2`='Promontoire de Shirvallah', `NameLoc3`='Landspitze Shirvallahs', `NameLoc4`='希瓦拉尔之角', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Холм Ширвалла' WHERE (`Entry`='3381');
UPDATE `locales_area` SET `Entry`='3382', `NameLoc1`='', `NameLoc2`='Temple de Bethekk', `NameLoc3`='Tempel von Bethekk', `NameLoc4`='贝瑟克神庙', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Храм Бетекк' WHERE (`Entry`='3382');
UPDATE `locales_area` SET `Entry`='3383', `NameLoc1`='', `NameLoc2`='Fosse du Sang igné', `NameLoc3`='Die Blutfeuergrube', `NameLoc4`='血火之池', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Алтарь Кипящей Крови' WHERE (`Entry`='3383');
UPDATE `locales_area` SET `Entry`='3384', `NameLoc1`='', `NameLoc2`='Autel du Dieu sanglant', `NameLoc3`='Altar des Blutgottes', `NameLoc4`='血神祭坛', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Алтарь Бога Крови' WHERE (`Entry`='3384');
UPDATE `locales_area` SET `Entry`='3397', `NameLoc1`='', `NameLoc2`='Cime de Zanza', `NameLoc3`='Zanzas Anhöhe', `NameLoc4`='赞扎高地', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Пирамида Занзы' WHERE (`Entry`='3397');
UPDATE `locales_area` SET `Entry`='3398', `NameLoc1`='', `NameLoc2`='Frontière de la folie', `NameLoc3`='Rand des Wahnsinns', `NameLoc4`='疯狂之缘', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Грань Безумия' WHERE (`Entry`='3398');
UPDATE `locales_area` SET `Entry`='3417', `NameLoc1`='', `NameLoc2`='Salle de Trollbane', `NameLoc3`='Trollbanes Halle', `NameLoc4`='托尔贝恩大厅', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Зал Троллебоя' WHERE (`Entry`='3417');
UPDATE `locales_area` SET `Entry`='3418', `NameLoc1`='', `NameLoc2`='L\'antre des Profanateurs', `NameLoc3`='Die entweihte Feste', `NameLoc4`='污染者之穴', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Логово Осквернителя' WHERE (`Entry`='3418');
UPDATE `locales_area` SET `Entry`='3419', `NameLoc1`='', `NameLoc2`='Pointe de Pagle', `NameLoc3`='Pagles Spitze', `NameLoc4`='帕格渔点', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Стоянка Пэгла' WHERE (`Entry`='3419');
UPDATE `locales_area` SET `Entry`='3420', `NameLoc1`='', `NameLoc2`='Ferme', `NameLoc3`='Hof', `NameLoc4`='农场', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Ферма' WHERE (`Entry`='3420');
UPDATE `locales_area` SET `Entry`='3421', `NameLoc1`='', `NameLoc2`='Forge', `NameLoc3`='Schmiede', `NameLoc4`='铁匠铺', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Кузница' WHERE (`Entry`='3421');
UPDATE `locales_area` SET `Entry`='3422', `NameLoc1`='', `NameLoc2`='Scierie', `NameLoc3`='Sägewerk', `NameLoc4`='伐木场', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Лесопилка' WHERE (`Entry`='3422');
UPDATE `locales_area` SET `Entry`='3423', `NameLoc1`='', `NameLoc2`='Mine d\'or', `NameLoc3`='Goldmine', `NameLoc4`='矿洞', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Золотой рудник' WHERE (`Entry`='3423');
UPDATE `locales_area` SET `Entry`='3424', `NameLoc1`='', `NameLoc2`='Ecuries', `NameLoc3`='Ställe', `NameLoc4`='兽栏', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Стойла' WHERE (`Entry`='3424');
UPDATE `locales_area` SET `Entry`='3425', `NameLoc1`='', `NameLoc2`='Fort cénarien', `NameLoc3`='Burg Cenarius', `NameLoc4`='塞纳里奥要塞', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Крепость Кенария' WHERE (`Entry`='3425');
UPDATE `locales_area` SET `Entry`='3426', `NameLoc1`='', `NameLoc2`='Halte de Staghelm', `NameLoc3`='Staghelms Stätte', `NameLoc4`='鹿盔岗哨', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Лагерь Оленьего Шлема' WHERE (`Entry`='3426');
UPDATE `locales_area` SET `Entry`='3427', `NameLoc1`='', `NameLoc2`='Campement de Bronzebeard', `NameLoc3`='Bronzebeards Lager', `NameLoc4`='铜须营地', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Лагерь Бронзоборода' WHERE (`Entry`='3427');
UPDATE `locales_area` SET `Entry`='3428', `NameLoc1`='', `NameLoc2`='Ahn\'Qiraj', `NameLoc3`='Ahn\'Qiraj', `NameLoc4`='安其拉', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Ан\'Кираж' WHERE (`Entry`='3428');
UPDATE `locales_area` SET `Entry`='3429', `NameLoc1`='', `NameLoc2`='Ruines d\'Ahn\'Qiraj', `NameLoc3`='Ruinen von Ahn\'Qiraj', `NameLoc4`='安其拉废墟', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Руины Ан\'Киража' WHERE (`Entry`='3429');
UPDATE `locales_area` SET `Entry`='3446', `NameLoc1`='', `NameLoc2`='Défilé du Crépuscule', `NameLoc3`='Kavernen der Twilight', `NameLoc4`='暮光小径', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Сумеречная пещера' WHERE (`Entry`='3446');
UPDATE `locales_area` SET `Entry`='3447', `NameLoc1`='', `NameLoc2`='La planque d\'Ortell', `NameLoc3`='Ortells Unterschlupf', `NameLoc4`='奥泰尔藏身处', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Укрытие Ортелла' WHERE (`Entry`='3447');
UPDATE `locales_area` SET `Entry`='3448', `NameLoc1`='', `NameLoc2`='Terrasse du scarabée', `NameLoc3`='Skarabäusterrasse', `NameLoc4`='甲虫平台', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Терраса Скарабея' WHERE (`Entry`='3448');
UPDATE `locales_area` SET `Entry`='3449', `NameLoc1`='', `NameLoc2`='Terrasse du général', `NameLoc3`='Terrasse des Generals', `NameLoc4`='将军平台', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Терраса Генерала' WHERE (`Entry`='3449');
UPDATE `locales_area` SET `Entry`='3450', `NameLoc1`='', `NameLoc2`='Le réservoir', `NameLoc3`='Das Reservoir', `NameLoc4`='蓄水池', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Резервуар' WHERE (`Entry`='3450');
UPDATE `locales_area` SET `Entry`='3451', `NameLoc1`='', `NameLoc2`='La chambre des œufs', `NameLoc3`='Die Brutstätte', `NameLoc4`='孵化间', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Инкубатор' WHERE (`Entry`='3451');
UPDATE `locales_area` SET `Entry`='3452', `NameLoc1`='', `NameLoc2`='Les rayons', `NameLoc3`='Die Wabenkammer', `NameLoc4`='蜂巢', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Соты' WHERE (`Entry`='3452');
UPDATE `locales_area` SET `Entry`='3453', `NameLoc1`='', `NameLoc2`='Terrasse des guetteurs', `NameLoc3`='Terrasse der Wächter', `NameLoc4`='守望平台', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Терраса Стражей' WHERE (`Entry`='3453');
UPDATE `locales_area` SET `Entry`='3454', `NameLoc1`='', `NameLoc2`='Ruines d\'Ahn\'Qiraj', `NameLoc3`='Ruinen von Ahn\'Qiraj', `NameLoc4`='安其拉废墟', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Руины Ан\'Киража' WHERE (`Entry`='3454');
UPDATE `locales_area` SET `Entry`='3456', `NameLoc1`='', `NameLoc2`='Naxxramas', `NameLoc3`='Naxxramas', `NameLoc4`='纳克萨玛斯', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Наксрамас' WHERE (`Entry`='3456');
UPDATE `locales_area` SET `Entry`='3459', `NameLoc1`='', `NameLoc2`='Capitales', `NameLoc3`='Hauptstädte', `NameLoc4`='城市', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Город' WHERE (`Entry`='3459');
UPDATE `locales_area` SET `Entry`='3478', `NameLoc1`='', `NameLoc2`='Portes d\'Ahn\'Qiraj', `NameLoc3`='Tore von Ahn\'Qiraj', `NameLoc4`='安其拉之门', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Врата Ан\'Киража' WHERE (`Entry`='3478');
UPDATE `locales_area` SET `Entry`='3486', `NameLoc1`='', `NameLoc2`='Manoir de Ravenholdt', `NameLoc3`='Ravenholdt-Anwesen', `NameLoc4`='拉文霍德庄园', `NameLoc5`='', `NameLoc6`='', `NameLoc7`='', `NameLoc8`='Поместье Черного Ворона' WHERE (`Entry`='3486');
 
 
/* 
* 20170124161936_world.sql 
*/ 
INSERT INTO `migrations` VALUES ('20170124161936'); 

-- Firestone (Rank 2)
UPDATE `item_template` SET `InventoryType` = 23 WHERE `entry` = 13699;
 
 
/* 
* 20170124173428_world.sql 
*/ 
INSERT INTO `migrations` VALUES ('20170124173428'); 

-- Skeletons
UPDATE `creature_template` SET `mechanic_immune_mask` = 646015775 WHERE `type` = 6 AND `name` LIKE '%skelet%' AND `entry` <> 16193;
 
 
/* 
* 20170124193116_world.sql 
*/ 
INSERT INTO `migrations` VALUES ('20170124193116'); 

-- Timbermaw
REPLACE INTO `creature_onkill_reputation` VALUES
( 6186, 576, 0, 7, 0, -25, 0, 0, 0, 0 ),
( 6187, 576, 0, 7, 0, -25, 0, 0, 0, 0 ),
( 11552, 576, 0, 7, 0, -25, 0, 0, 0, 0 );

UPDATE `creature_template` SET `attackpower` = 126 WHERE (`entry` = 6651);
 
 
/* 
* 20170124204003_world.sql 
*/ 
INSERT INTO `migrations` VALUES ('20170124204003');

UPDATE `quest_template` SET `RewSpell` = 19345 WHERE `entry` = 5677;
 
 
/* 
* 20170125124633_world.sql 
*/ 
INSERT INTO `migrations` VALUES ('20170125124633');

-- Get ready to re-insert Patch 1.9
DELETE from `game_event` WHERE `entry` = 161;

-- Add Patch Events
INSERT INTO `game_event` VALUES
(161,	'2017-01-01 00:00:00',	'2030-01-01 00:00:00',	525600,	525600,	0,	'Patch 1.3', 0, 1),
(162,	'2017-01-01 00:00:00',	'2030-01-01 00:00:00',	525600,	525600,	0,	'Patch 1.4 | 1.5', 0, 1),
(163,	'2017-01-01 00:00:00',	'2030-01-01 00:00:00',	525600,	525600,	0,	'Patch 1.6', 0, 1),
(164,	'2017-01-01 00:00:00',	'2030-01-01 00:00:00',	525600,	525600,	0,	'Patch 1.7', 0, 1),
(165,	'2017-01-01 00:00:00',	'2030-01-01 00:00:00',	525600,	525600,	0,	'Patch 1.8', 0, 1),
(166,	'2017-01-01 00:00:00',	'2030-01-01 00:00:00',	525600,	525600,	0,	'Patch 1.9', 0, 1),
(167,	'2017-01-01 00:00:00',	'2030-01-01 00:00:00',	525600,	525600,	0,	'Patch 1.10', 0, 1),
(168,	'2017-01-01 00:00:00',	'2030-01-01 00:00:00',	525600,	525600,	0,	'Patch 1.11', 0, 1);

-- Move 1.9 Objects
UPDATE `game_event_gameobject` SET `event` = 166 WHERE `event` = 161;

-- Add Eel Swarms to Patch 1.11
INSERT INTO `game_event_gameobject` (`guid`, `event`)
SELECT `guid`, 168 FROM gameobject
JOIN `gameobject_template` ON `name` LIKE 'Stonescale Eel Swarm'
WHERE gameobject.id = gameobject_template.entry;

-- Add Footlockers to Patch 1.3
INSERT INTO `game_event_gameobject` (`guid`, `event`)
SELECT `guid`, 161 FROM gameobject
JOIN `gameobject_template` ON gameobject_template.name REGEXP '.*(ed|t|y) Footlocker'
WHERE gameobject.id = gameobject_template.entry;

/* You may use this to confirm
SELECT name, event FROM gameobject_template
JOIN gameobject ON gameobject.id = entry
JOIN game_event_gameobject ON gameobject.guid = game_event_gameobject.guid
WHERE game_event_gameobject.event = <event id>
*/

 
 
/* 
* 20170125173733_world.sql 
*/ 
INSERT INTO `migrations` VALUES ('20170125173733'); 

-- Mana Surge
UPDATE `creature_template` SET `flags_extra` = 64 WHERE (`entry` = 6550);
 
 
/* 
* 20170125181715_world.sql 
*/ 
INSERT INTO `migrations` VALUES ('20170125181715'); 

-- Mission: Possible But Not Probable
UPDATE `creature_template` SET `ScriptName` = 'npc_mission_possible_but_not_probable' WHERE `entry` IN (7310, 7308, 7307, 7288);
DELETE FROM `creature_loot_template` WHERE `entry` IN (7310, 7308, 7307);
 
 
/* 
* 20170126211827_world.sql 
*/ 
INSERT INTO `migrations` VALUES ('20170126211827'); 

-- Primordial Behemoth
UPDATE `creature_template` SET `AIName` = '', `ScriptName` = 'npc_primordial_behemoth' WHERE `entry` = 12206;
DELETE FROM `creature_ai_scripts` WHERE `creature_id` = 12206;
 
 
/* 
* 20170127135208_world.sql 
*/ 
INSERT INTO `migrations` VALUES ('20170127135208');

-- Add Darkwood Pole to loot
-- Most sources said 1:3500 to 1:6100 chance
-- Settled on 1:5000 (0.02%)

INSERT INTO `fishing_loot_template` VALUES
-- Tarren Mill Lake
(267, 6366, 0.02, 1, 1, 1, 0),
(272, 6366, 0.02, 1, 1, 1, 0),
-- Sun Rock Retreat
(460, 6366, 0.02, 1, 1, 1, 0),
-- Lakeshire Lake
(44, 6366, 0.02, 1, 1, 1, 0),
(68, 6366, 0.02, 1, 1, 1, 0),
(69, 6366, 0.02, 1, 1, 1, 0),
-- Astranaar
(415, 6366, 0.02, 1, 1, 1, 0);

 
 
/* 
* 20170127164550_world.sql 
*/ 
INSERT INTO `migrations` VALUES ('20170127164550');

INSERT INTO `script_texts` VALUES
(-1780221,  'Vorsha must fall. Are you going to douse the flame or not?',  NULL,   NULL,   NULL,   NULL,   NULL,   NULL,   NULL,   NULL,   0,  0,  1,  0,  'Player is taking his time to douse the flame'),
(-1780222,  'You have tested my patience. I will return to the Outpost to find someone worthy of the task.',  NULL,   NULL,   NULL,   NULL,   NULL,   NULL,   NULL,   NULL,   0,  0,  1,  0,  'Muglash got impatient');
 
 
/* 
* 20170128214156_world.sql 
*/ 
INSERT INTO `migrations` VALUES ('20170128214156'); 

-- Arcane Missiles
DELETE FROM `spell_mod` WHERE `custom` & 8 AND `Comment` LIKE 'Projec%';
 
 
/* 
* 20170129104915_world.sql 
*/ 
INSERT INTO `migrations` VALUES ('20170129104915'); 

-- Emberstrife
DELETE FROM `spell_effect_mod` WHERE `id` = 16053;
DELETE FROM `creature_ai_scripts` WHERE `creature_id` = 10321;
UPDATE `creature_template` SET `spell3` = 16054, `AIName` = '', `ScriptName` = 'npc_emberstrife' WHERE `entry` = 10321;
REPLACE INTO `spell_script_target` VALUES (16054, 0, 175321);
UPDATE `gameobject_template` SET `ScriptName` = 'go_unforged_seal' WHERE `entry` = 175321;
UPDATE `gameobject_template` SET `ScriptName` = 'go_forged_seal' WHERE `entry` = 175322;
UPDATE `gameobject_template` SET `size` = 0.5 WHERE `entry` = 175322;
 
 
/* 
* 20170129210735_world.sql 
*/ 
INSERT INTO `migrations` VALUES ('20170129210735'); 

REPLACE INTO `creature_groups` VALUES 
(28714, 28714, 32, 6.28, 7),
(28714, 27289, 26, 3.14, 7),
(28714, 28728, 14, 3.14, 7),
(28714, 27290, 8, 3.14, 7);
DELETE FROM `creature_movement` WHERE `id` IN (28728, 28714, 27290, 27289);
UPDATE `creature` SET `spawndist` = 0, `MovementType` = 0 WHERE `guid` IN (28728, 28714, 27290, 27289);
UPDATE `creature` SET `position_x` = -1888.72, `position_y` = 2458.89, `position_z` = 59.8224, `orientation` = 4.48 WHERE `guid` = 28714;
UPDATE `creature` SET `position_x` = -1887.26, `position_y` = 2465.12, `position_z` = 59.8224, `orientation` = 4.48 WHERE `guid` = 27289;
UPDATE `creature` SET `position_x` = -1883.63, `position_y` = 2471.68, `position_z` = 59.8224, `orientation` = 4.48 WHERE `guid` = 28728;
UPDATE `creature` SET `position_x` = -1882.11, `position_y` = 2476.80, `position_z` = 59.8224, `orientation` = 4.48 WHERE `guid` = 27290;
UPDATE `creature_template` SET `ScriptName` = 'npc_cork_gizelton' WHERE `entry` = 11625;
UPDATE `creature_template` SET `npcflag` = 0 WHERE `entry` IN (11626, 11625);
REPLACE INTO `script_texts` (`entry`, `content_default`) VALUES 
( -1001000, 'Time for the Gizelton Caravan to head on out! We\'ll be back soon but if you cannot wait, head north to Kormek\'s Hut. We open shop in about an hour.' ),
( -1001001, 'This is Rigger Gizelton asking for assistance escorting my caravan past Mannoroc Coven. I\'m on the road east of Shadowprey Village.' ),
( -1001002, 'Eeck! Demons appear hungry for the kodos!' ),
( -1001003, 'What am I paying you for? The kodos are nearly dead!' ),
( -1001004, 'Only if I were about five feet taller, then I would show these blasphemous demons a thing or two! Help!' ),
( -1001005, 'Wow! We did it... not sure why we thought we needed the likes of you. Nevertheless, speak with Smeed Scrabblescrew; he will give you your earnings!' ),
( -1001006, 'So sorry to leave a customer but we have places to go and people to swindle. We will be back sometime later today. Good-bye!' ),
( -1001007, 'I am looking for some bodyguards that would like to protect the Gizelton Caravan. We are stopped on the road east of Kormek\'s Hut, north of Kolkar Centaur Village.' ),
( -1001008, 'Hey, you call yourself a body guard? Get to work and protect us...' ),
( -1001009, 'Mister body guard, are you going to earn your money or what?' ),
( -1001010, 'You\'re fired! <Cough...Cork clears throat.> I mean, help!' ),
( -1001011, 'Blast those stupid centaurs! Sigh - well, it seems you kept your bargain. Up the road you shall find Smeed Scrabblescrew, he has your money.' );
REPLACE INTO `script_waypoint` VALUES 
( 11625, 0, -1888.72, 2458.89, 59.8224, 0, '' ),
( 11625, 1, -1895.4, 2432.5, 59.8224, 0, '' ),
( 11625, 2, -1899.03, 2418.98, 59.8224, 0, '' ),
( 11625, 3, -1899.68, 2393.35, 59.8224, 0, '' ),
( 11625, 4, -1892.03, 2375.61, 59.9178, 0, '' ),
( 11625, 5, -1885.29, 2346.94, 59.8216, 0, '' ),
( 11625, 6, -1881.12, 2339.05, 59.8216, 0, '' ),
( 11625, 7, -1864.4, 2316.59, 59.8226, 0, '' ),
( 11625, 8, -1852.79, 2300.12, 59.8226, 0, '' ),
( 11625, 9, -1847.08, 2287.99, 59.8226, 0, '' ),
( 11625, 10, -1844.34, 2264.2, 59.8226, 0, '' ),
( 11625, 11, -1842.38, 2243.22, 59.8226, 0, '' ),
( 11625, 12, -1840.11, 2237.75, 59.8226, 0, '' ),
( 11625, 13, -1830.64, 2226.2, 59.8226, 0, '' ),
( 11625, 14, -1810.22, 2209.43, 59.8226, 0, '' ),
( 11625, 15, -1802.8, 2194.02, 59.8226, 0, '' ),
( 11625, 16, -1800.41, 2180.08, 59.8226, 0, '' ),
( 11625, 17, -1800.26, 2166.08, 60.1822, 0, '' ),
( 11625, 18, -1801.62, 2148.85, 62.344, 0, '' ),
( 11625, 19, -1801.15, 2134.86, 63.1766, 0, '' ),
( 11625, 20, -1802.26, 2110.11, 63.6737, 0, '' ),
( 11625, 21, -1805.87, 2096.6, 63.1784, 0, '' ),
( 11625, 22, -1809.25, 2083.01, 63.0772, 0, '' ),
( 11625, 23, -1812.63, 2069.43, 63.043, 0, '' ),
( 11625, 24, -1816.72, 2056.04, 61.8496, 0, '' ),
( 11625, 25, -1822.89, 2032.23, 60.6524, 0, '' ),
( 11625, 26, -1822.76, 2027.39, 60.3783, 0, '' ),
( 11625, 27, -1815.56, 2003.46, 59.4022, 0, '' ),
( 11625, 28, -1814.41, 1983.18, 58.9549, 0, '' ),
( 11625, 29, -1811.8, 1967.01, 59.4735, 0, '' ),
( 11625, 30, -1803.12, 1951.78, 60.7154, 0, '' ),
( 11625, 31, -1793.24, 1941.87, 60.8439, 0, '' ),
( 11625, 32, -1775.92, 1926.82, 59.3033, 0, '' ),
( 11625, 33, -1759.93, 1918.92, 58.9613, 0, '' ),
( 11625, 34, -1751.9, 1917.2, 59.0003, 0, '' ),
( 11625, 35, -1737.91, 1917.04, 59.0673, 0, '' ),
( 11625, 36, -1712.18, 1914.85, 60.4394, 0, '' ),
( 11625, 37, -1701.72, 1911.02, 61.0949, 0, '' ),
( 11625, 38, -1694.06, 1904.03, 61.03, 0, '' ),
( 11625, 39, -1687.1, 1886.34, 59.7501, 0, '' ),
( 11625, 40, -1684.12, 1872.66, 59.0354, 0, '' ),
( 11625, 41, -1673.14, 1845.28, 58.9273, 0, '' ),
( 11625, 42, -1657.63, 1821.97, 58.9273, 0, '' ),
( 11625, 43, -1649.83, 1810.34, 58.9273, 0, '' ),
( 11625, 44, -1634.24, 1787.08, 58.9252, 0, '' ),
( 11625, 45, -1626.45, 1775.45, 58.9252, 0, '' ),
( 11625, 46, -1605.77, 1750.66, 58.9256, 0, '' ),
( 11625, 47, -1594.91, 1741.83, 58.9256, 0, '' ),
( 11625, 48, -1573.31, 1724.02, 58.9256, 0, '' ),
( 11625, 49, -1553.4, 1704.35, 58.9256, 0, '' ),
( 11625, 50, -1543.67, 1694.29, 58.9256, 0, '' ),
( 11625, 51, -1523.39, 1674.99, 58.9256, 0, '' ),
( 11625, 52, -1505.1, 1659.98, 58.9256, 0, '' ),
( 11625, 53, -1489.89, 1652.47, 58.9256, 0, '' ),
( 11625, 54, -1460.15, 1634.27, 58.9256, 0, '' ),
( 11625, 55, -1453.16, 1621.35, 58.9256, 0, '' ),
( 11625, 56, -1446.87, 1598.31, 58.9256, 0, '' ),
( 11625, 57, -1440.81, 1573.28, 58.9256, 0, '' ),
( 11625, 58, -1445.9, 1553.99, 58.9256, 0, '' ),
( 11625, 59, -1451.91, 1541.35, 58.9256, 0, '' ),
( 11625, 60, -1458.46, 1528.97, 58.9256, 0, '' ),
( 11625, 61, -1471.62, 1504.26, 58.9256, 0, '' ),
( 11625, 62, -1478.08, 1491.84, 58.9256, 0, '' ),
( 11625, 63, -1490.08, 1466.54, 58.9256, 0, '' ),
( 11625, 64, -1491.71, 1455.14, 58.9291, 0, '' ),
( 11625, 65, -1488.22, 1427.36, 58.9348, 0, '' ),
( 11625, 66, -1486.41, 1413.48, 58.9418, 0, '' ),
( 11625, 67, -1487.62, 1388.44, 58.9251, 0, '' ),
( 11625, 68, -1491.84, 1375.08, 58.9301, 0, '' ),
( 11625, 69, -1502.72, 1349.31, 58.9416, 0, '' ),
( 11625, 70, -1508.49, 1336.58, 59.525, 0, '' ),
( 11625, 71, -1511.68, 1327.41, 60.3754, 0, '' ),
( 11625, 72, -1514.03, 1314.22, 62.0185, 0, '' ),
( 11625, 73, -1514.79, 1300.27, 64.5471, 0, '' ),
( 11625, 74, -1516.1, 1286.34, 68.0841, 0, '' ),
( 11625, 75, -1518.52, 1272.55, 72.0932, 0, '' ),
( 11625, 76, -1523.17, 1245.16, 82.7876, 0, '' ),
( 11625, 77, -1522.5, 1234.75, 87.008, 0, '' ),
( 11625, 78, -1517.95, 1221.51, 91.5343, 0, '' ),
( 11625, 79, -1511.76, 1208.2, 96.7403, 0, '' ),
( 11625, 80, -1501.33, 1196.53, 102.475, 0, '' ),
( 11625, 81, -1490.76, 1188.95, 106.376, 0, '' ),
( 11625, 82, -1475.92, 1185.48, 109.181, 0, '' ),
( 11625, 83, -1452.6, 1187.95, 111.422, 0, '' ),
( 11625, 84, -1433.28, 1193.58, 111.857, 0, '' ),
( 11625, 85, -1414.55, 1203.63, 111.886, 0, '' ),
( 11625, 86, -1388.31, 1213.37, 111.599, 0, '' ),
( 11625, 87, -1375.11, 1218.03, 111.465, 0, '' ),
( 11625, 88, -1348.49, 1226.69, 111.175, 0, '' ),
( 11625, 89, -1319.41, 1232.27, 110.201, 0, '' ),
( 11625, 90, -1290.31, 1231.38, 109.237, 0, '' ),
( 11625, 91, -1277.59, 1225.54, 108.85, 0, '' ),
( 11625, 92, -1264.86, 1219.71, 108.452, 0, '' ),
( 11625, 93, -1230.04, 1204.31, 104.374, 0, '' ),
( 11625, 94, -1216.17, 1206.24, 101.889, 0, '' ),
( 11625, 95, -1202.32, 1208.28, 99.7026, 0, '' ),
( 11625, 96, -1188.03, 1207.66, 97.2208, 0, '' ),
( 11625, 97, -1170.99, 1195.93, 94.5615, 0, '' ),
( 11625, 98, -1155.46, 1192.16, 92.4374, 0, '' ),
( 11625, 99, -1127.52, 1190.39, 89.8358, 0, '' ),
( 11625, 100, -1113.58, 1189.12, 89.7403, 0, '' ),
( 11625, 101, -1070.8, 1186.15, 89.7403, 0, '' ),
( 11625, 102, -1037.27, 1183.2, 89.8006, 0, '' ),
( 11625, 103, -995.58, 1177.92, 89.7409, 0, '' ),
( 11625, 104, -981.817, 1180.48, 89.8152, 0, '' ),
( 11625, 105, -952.606, 1181.99, 89.7313, 0, '' ),
( 11625, 106, -935.445, 1182.25, 91.2113, 0, '' ),
( 11625, 107, -921.448, 1182.53, 93.1746, 0, '' ),
( 11625, 108, -879.467, 1183.72, 97.6043, 0, '' ),
( 11625, 109, -858.976, 1184.22, 99.0322, 0, '' ),
( 11625, 110, -828.316, 1180.2, 99.6657, 0, '' ),
( 11625, 111, -799.811, 1176, 99.3364, 0, '' ),
( 11625, 112, -757.106, 1191.47, 96.9164, 0, '' ),
( 11625, 113, -731.879, 1208.14, 92.6956, 0, '' ),
( 11625, 114, -719.12, 1213.91, 91.3297, 0, '' ),
( 11625, 115, -706.36, 1219.67, 90.2856, 0, '' ),
( 11625, 116, -689.935, 1228.43, 89.4426, 0, '' ),
( 11625, 117, -679.121, 1237.31, 89.17, 0, '' ),
( 11625, 118, -661.434, 1247.28, 89.17, 0, '' ),
( 11625, 119, -635.655, 1258.2, 89.2063, 0, '' ),
( 11625, 120, -614.489, 1269.64, 89.1686, 0, '' ),
( 11625, 121, -600.078, 1274.85, 89.1238, 0, '' ),
( 11625, 122, -586.268, 1277.15, 89.145, 0, '' ),
( 11625, 123, -546.297, 1287.15, 89.1597, 0, '' ),
( 11625, 124, -541.257, 1300.21, 89.1602, 0, '' ),
( 11625, 125, -536.026, 1313.2, 89.1314, 0, '' ),
( 11625, 126, -525.098, 1338.97, 89.1005, 0, '' ),
( 11625, 127, -518.852, 1356.12, 89.0827, 0, '' ),
( 11625, 128, -516.879, 1395.56, 89.0827, 0, '' ),
( 11625, 129, -518.905, 1436.25, 89.0696, 0, '' ),
( 11625, 130, -525.605, 1446.54, 88.4907, 0, '' ),
( 11625, 131, -543.459, 1462.9, 88.3752, 0, '' ),
( 11625, 132, -557.591, 1471.17, 88.9477, 0, '' ),
( 11625, 133, -584.698, 1478.14, 88.3754, 0, '' ),
( 11625, 134, -598.459, 1480.72, 88.3754, 0, '' ),
( 11625, 135, -632.084, 1491.03, 88.3754, 0, '' ),
( 11625, 136, -644.249, 1497.95, 88.3754, 0, '' ),
( 11625, 137, -660.456, 1507.56, 88.3874, 0, '' ),
( 11625, 138, -666.507, 1504.7, 89.0746, 0, '' ),
( 11625, 139, -673.795, 1499.48, 90.3922, 0, '' ),
( 11625, 140, -692.154, 1480.43, 90.5302, 0, '' ),
( 11625, 141, -710.764, 1470.11, 91.3034, 0, '' ),
( 11625, 142, -697.048, 1484.75, 91.0929, 0, '' ),
( 11625, 143, -676.552, 1497.37, 90.6505, 0, '' ),
( 11625, 144, -665.209, 1505.76, 88.8321, 0, '' ),
( 11625, 145, -657.898, 1510.94, 88.3752, 0, '' ),
( 11625, 146, -647.387, 1501.69, 88.3752, 0, '' ),
( 11625, 147, -630.597, 1491.17, 88.3752, 0, '' ),
( 11625, 148, -603.756, 1483.26, 88.3752, 0, '' ),
( 11625, 149, -576.573, 1476.54, 88.3752, 0, '' ),
( 11625, 150, -556.868, 1470.92, 88.8685, 0, '' ),
( 11625, 151, -547.471, 1464.89, 88.3747, 0, '' ),
( 11625, 152, -529.316, 1449.97, 88.402, 0, '' ),
( 11625, 153, -517.699, 1433.75, 89.0816, 0, '' ),
( 11625, 154, -518.09, 1405.76, 89.0816, 0, '' ),
( 11625, 155, -518.149, 1377.76, 89.0816, 0, '' ),
( 11625, 156, -521.289, 1350.76, 89.0816, 0, '' ),
( 11625, 157, -531.625, 1324.74, 89.1339, 0, '' ),
( 11625, 158, -537.391, 1311.99, 89.1594, 0, '' ),
( 11625, 159, -551.845, 1284.12, 89.1594, 0, '' ),
( 11625, 160, -578.054, 1278.57, 89.1685, 0, '' ),
( 11625, 161, -591.957, 1276.92, 89.1634, 0, '' ),
( 11625, 162, -611.806, 1271.05, 89.1694, 0, '' ),
( 11625, 163, -623.928, 1264.06, 89.1694, 0, '' ),
( 11625, 164, -653.384, 1249.74, 89.1694, 0, '' ),
( 11625, 165, -666.372, 1244.51, 89.1694, 0, '' ),
( 11625, 166, -684.6, 1232.06, 89.2134, 0, '' ),
( 11625, 167, -694.027, 1225.67, 89.6627, 0, '' ),
( 11625, 168, -706.605, 1219.58, 90.2981, 0, '' ),
( 11625, 169, -732.184, 1208.23, 92.7376, 0, '' ),
( 11625, 170, -738.514, 1204.75, 93.8662, 0, '' ),
( 11625, 171, -754.159, 1193.91, 96.6195, 0, '' ),
( 11625, 172, -766.62, 1187.59, 97.8394, 0, '' ),
( 11625, 173, -792.515, 1177.07, 98.8327, 0, '' ),
( 11625, 174, -802.533, 1175.57, 99.4435, 0, '' ),
( 11625, 175, -821.772, 1178.84, 99.6542, 0, '' ),
( 11625, 176, -835.435, 1181.9, 99.6662, 0, '' ),
( 11625, 177, -848.98, 1184.67, 99.5782, 0, '' ),
( 11625, 178, -861.251, 1185.3, 98.8033, 0, '' ),
( 11625, 179, -889.179, 1183.34, 96.6117, 0, '' ),
( 11625, 180, -903.158, 1182.57, 95.2033, 0, '' ),
( 11625, 181, -931.15, 1182.17, 91.8346, 0, '' ),
( 11625, 182, -945.149, 1182.01, 89.8612, 0, '' ),
( 11625, 183, -959.149, 1181.92, 89.7397, 0, '' ),
( 11625, 184, -973.149, 1181.97, 89.7397, 0, '' ),
( 11625, 185, -1001.65, 1178.06, 89.7398, 0, '' ),
( 11625, 186, -1011.8, 1177.4, 89.7398, 0, '' ),
( 11625, 187, -1033.08, 1182.29, 89.7629, 0, '' ),
( 11625, 188, -1073.62, 1186.33, 89.7398, 0, '' ),
( 11625, 189, -1101.59, 1187.56, 89.7398, 0, '' ),
( 11625, 190, -1129.48, 1190.01, 89.8855, 0, '' ),
( 11625, 191, -1143.44, 1191.11, 91.0344, 0, '' ),
( 11625, 192, -1166.85, 1194.28, 93.9649, 0, '' ),
( 11625, 193, -1184.71, 1203.56, 96.6406, 0, '' ),
( 11625, 194, -1201.45, 1208.2, 99.5698, 0, '' ),
( 11625, 195, -1225.42, 1204.68, 103.502, 0, '' ),
( 11625, 196, -1235.55, 1206.75, 105.129, 0, '' ),
( 11625, 197, -1261.05, 1218.25, 108.207, 0, '' ),
( 11625, 198, -1286.64, 1229.58, 109.112, 0, '' ),
( 11625, 199, -1306.84, 1233.21, 109.771, 0, '' ),
( 11625, 200, -1331.25, 1233.54, 110.674, 0, '' ),
( 11625, 201, -1350.02, 1227.22, 111.201, 0, '' ),
( 11625, 202, -1389.37, 1212.53, 111.587, 0, '' ),
( 11625, 203, -1415.8, 1202.23, 111.948, 0, '' ),
( 11625, 204, -1424.26, 1196.81, 112.038, 0, '' ),
( 11625, 205, -1449.27, 1188.13, 111.53, 0, '' ),
( 11625, 206, -1474.53, 1186.42, 109.366, 0, '' ),
( 11625, 207, -1491.78, 1189.4, 106.114, 0, '' ),
( 11625, 208, -1502.95, 1198.12, 101.757, 0, '' ),
( 11625, 209, -1512.09, 1209.44, 96.2469, 0, '' ),
( 11625, 210, -1520.19, 1226.67, 89.7861, 0, '' ),
( 11625, 211, -1522.75, 1243.63, 83.3864, 0, '' ),
( 11625, 212, -1520.9, 1257.51, 77.7027, 0, '' ),
( 11625, 213, -1518.48, 1273.17, 71.8991, 0, '' ),
( 11625, 214, -1516.17, 1290.94, 66.8473, 0, '' ),
( 11625, 215, -1514.74, 1306.19, 63.4211, 0, '' ),
( 11625, 216, -1511.54, 1328.73, 60.2051, 0, '' ),
( 11625, 217, -1505.75, 1341.47, 59.2142, 0, '' ),
( 11625, 218, -1494.42, 1367.08, 58.9254, 0, '' ),
( 11625, 219, -1485.84, 1393.02, 58.9251, 0, '' ),
( 11625, 220, -1485.47, 1407, 58.9469, 0, '' ),
( 11625, 221, -1487.57, 1434.84, 58.9347, 0, '' ),
( 11625, 222, -1489.45, 1448.71, 58.9302, 0, '' ),
( 11625, 223, -1489.77, 1469.49, 58.9251, 0, '' ),
( 11625, 224, -1483.8, 1482.15, 58.9251, 0, '' ),
( 11625, 225, -1471.32, 1507.22, 58.9251, 0, '' ),
( 11625, 226, -1464.94, 1519.68, 58.9251, 0, '' ),
( 11625, 227, -1452.27, 1544.64, 58.9251, 0, '' ),
( 11625, 228, -1442.94, 1584.75, 58.9255, 0, '' ),
( 11625, 229, -1452.7, 1610.98, 58.9255, 0, '' ),
( 11625, 230, -1464.1, 1641.7, 58.9255, 0, '' ),
( 11625, 231, -1474.86, 1647.49, 58.9255, 0, '' ),
( 11625, 232, -1500.84, 1657.91, 58.9255, 0, '' ),
( 11625, 233, -1521.76, 1671.96, 58.9255, 0, '' ),
( 11625, 234, -1541.37, 1691.94, 58.9255, 0, '' ),
( 11625, 235, -1551.2, 1701.92, 58.9255, 0, '' ),
( 11625, 236, -1571.41, 1721.29, 58.9255, 0, '' ),
( 11625, 237, -1592.97, 1739.14, 58.9255, 0, '' ),
( 11625, 238, -1613.28, 1758.07, 58.9255, 0, '' ),
( 11625, 239, -1630.32, 1780.27, 58.9255, 0, '' ),
( 11625, 240, -1645.92, 1803.52, 58.9296, 0, '' ),
( 11625, 241, -1661.7, 1826.65, 58.9271, 0, '' ),
( 11625, 242, -1681.42, 1858.29, 58.9271, 0, '' ),
( 11625, 243, -1686.38, 1877.21, 59.2059, 0, '' ),
( 11625, 244, -1692.06, 1899.02, 60.7504, 0, '' ),
( 11625, 245, -1699.45, 1908.31, 61.1412, 0, '' ),
( 11625, 246, -1717, 1915.93, 60.0908, 0, '' ),
( 11625, 247, -1738.04, 1917.48, 59.0673, 0, '' ),
( 11625, 248, -1757.16, 1918.92, 58.9757, 0, '' ),
( 11625, 249, -1772.71, 1926.58, 59.1537, 0, '' ),
( 11625, 250, -1791.81, 1939.62, 60.7298, 0, '' ),
( 11625, 251, -1802.7, 1951.89, 60.7237, 0, '' ),
( 11625, 252, -1809.79, 1963.96, 59.7477, 0, '' ),
( 11625, 253, -1815.2, 1976.74, 59.0006, 0, '' ),
( 11625, 254, -1817.51, 2008.7, 59.5336, 0, '' ),
( 11625, 255, -1823, 2032.7, 60.6767, 0, '' ),
( 11625, 256, -1821.87, 2042.21, 60.944, 0, '' ),
( 11625, 257, -1813.14, 2068.68, 63.0096, 0, '' ),
( 11625, 258, -1810.52, 2082.43, 63.114, 0, '' ),
( 11625, 259, -1806.9, 2095.9, 63.1144, 0, '' ),
( 11625, 260, -1802.03, 2111.56, 63.6862, 0, '' ),
( 11625, 261, -1802.03, 2111.56, 63.6862, 0, '' ),
( 11625, 262, -1801.53, 2141.07, 63.006, 0, '' ),
( 11625, 263, -1801.53, 2141.07, 63.006, 0, '' ),
( 11625, 264, -1802.25, 2155.05, 61.5195, 0, '' ),
( 11625, 265, -1803.02, 2183.03, 59.8215, 0, '' ),
( 11625, 266, -1808.36, 2207.2, 59.8215, 0, '' ),
( 11625, 267, -1822.66, 2219.86, 59.8215, 0, '' ),
( 11625, 268, -1836.76, 2232.87, 59.8215, 0, '' ),
( 11625, 269, -1843.44, 2245.11, 59.8215, 0, '' ),
( 11625, 270, -1844.75, 2266.9, 59.8215, 0, '' ),
( 11625, 271, -1846.34, 2280.81, 59.8215, 0, '' ),
( 11625, 272, -1849.89, 2294.13, 59.8215, 0, '' ),
( 11625, 273, -1864.58, 2316.31, 59.8215, 0, '' ),
( 11625, 274, -1872.72, 2327.7, 59.8224, 0, '' ),
( 11625, 275, -1884.98, 2346.82, 59.8224, 0, '' ),
( 11625, 276, -1887.2, 2354.3, 59.8696, 0, '' ),
( 11625, 277, -1893.87, 2379.11, 59.9196, 0, '' ),
( 11625, 278, -1900.07, 2391.67, 59.8224, 0, '' ),
( 11625, 279, -1904, 2405.04, 59.8224, 0, '' ),
( 11625, 280, -1904, 2405.04, 59.8224, 0, '' ),
( 11625, 281, -1895.71, 2431.78, 59.8224, 0, '' );
 
 
/* 
* 20170130141559_world.sql 
*/ 
INSERT INTO `migrations` VALUES ('20170130141559'); 

DELETE FROM `creature` WHERE `guid` IN (28728, 27290, 27289);
DELETE FROM `creature_groups` WHERE `leaderGuid` = 28714;
UPDATE `creature_template` SET `ScriptName` = 'npc_rigger_gizelton' WHERE `entry` = 11626;
 
 
/* 
* 20170130193630_world.sql 
*/ 
INSERT INTO `migrations` VALUES ('20170130193630'); 

UPDATE `creature_template` SET `type_flags` = 0 WHERE `entry` IN (11626, 11625, 11564);
UPDATE `creature` SET `spawnFlags` = 1 WHERE `id` = 11625;
 
 
/* 
* 20170131090127_world.sql 
*/ 
INSERT INTO `migrations` VALUES ('20170131090127'); 

UPDATE `creature_template` SET `ScriptName` = 'npc_caravan_vendor' WHERE `entry` IN (12245, 12246);
UPDATE `creature` SET `position_x` = -711.45, `position_y` = 1444.69, `position_z` = 90.7485, `orientation` = 1.26 WHERE `id` = 12245;
UPDATE `creature` SET `spawntimesecs` = 1800 WHERE `id` = 11625;
 
 
/* 
* 20170201132624_world.sql 
*/ 
INSERT INTO `migrations` VALUES ('20170201132624'); 

-- Zanza's Potent Potables
REPLACE INTO `spell_mod` (`Id`, `AttributesEx3`, `Comment`) VALUES 
(24382, 1048576, 'Spirit of Zanza - persist through death (before 1.12)'),
(24417, 1048576, 'Sheen of Zanza - persist through death (before 1.12)'),
(24383, 1048576, 'Swiftness of Zanza - persist through death (before 1.12)');
 
 
/* 
* 20170202193328_world.sql 
*/ 
INSERT INTO `migrations` VALUES ('20170202193328'); 

UPDATE `creature_template` SET `ScriptName` = 'npc_squire_rowe' WHERE `entry` = 17804;
UPDATE `creature_template` SET `ScriptName` = 'npc_reginald_windsor' WHERE `entry` = 12580;
UPDATE `creature_template` SET `faction_A` = 12, `faction_H` = 12 WHERE `entry` IN (12580, 17804);
 
 
/* 
* 20170202224348_world.sql 
*/ 
INSERT INTO `migrations` VALUES ('20170202224348');

-- Stop Cloven Hoof from dropping from mobs
DELETE FROM `creature_loot_template` WHERE `item`= 5869;

-- Remove unrequired flag from Flame
-- Make flame just stay there. Players aren't really taking the whole brazier
UPDATE `gameobject` SET `spawnFlags` = 0,`spawntimesecs` = 0 WHERE `guid` = 13295;



 
 
/* 
* 20170203100600_world.sql 
*/ 
INSERT INTO `migrations` VALUES ('20170203100600');

# Update quest levels for Lunar Festival event
UPDATE quest_template SET minlevel = 1 WHERE entry = 8867; # Lunar Fireworks

UPDATE quest_template SET minlevel = 1 WHERE entry = 8619; # Morndeep the Elder
UPDATE quest_template SET minlevel = 1 WHERE entry = 8635; # Splitrock the Elder
UPDATE quest_template SET minlevel = 1 WHERE entry = 8636; # Rumblerock the Elder
UPDATE quest_template SET minlevel = 1 WHERE entry = 8642; # Silvervein the Elder
UPDATE quest_template SET minlevel = 1 WHERE entry = 8643; # Highpeak the Elder
UPDATE quest_template SET minlevel = 1 WHERE entry = 8644; # Stonefort the Elder
UPDATE quest_template SET minlevel = 1 WHERE entry = 8645; # Obsidian the Elder
UPDATE quest_template SET minlevel = 1 WHERE entry = 8646; # Hammershout the Elder
UPDATE quest_template SET minlevel = 1 WHERE entry = 8647; # Bellowrage the Elder
UPDATE quest_template SET minlevel = 1 WHERE entry = 8648; # Darkcore the Elder
UPDATE quest_template SET minlevel = 1 WHERE entry = 8649; # Stormbrow the Elder
UPDATE quest_template SET minlevel = 1 WHERE entry = 8650; # Snowcrown the Elder
UPDATE quest_template SET minlevel = 1 WHERE entry = 8651; # Ironband the Elder
UPDATE quest_template SET minlevel = 1 WHERE entry = 8652; # Graveborn the Elder
UPDATE quest_template SET minlevel = 1 WHERE entry = 8653; # Goldwell the Elder
UPDATE quest_template SET minlevel = 1 WHERE entry = 8654; # Primestone the Elder
UPDATE quest_template SET minlevel = 1 WHERE entry = 8670; # Runetotem the Elder
UPDATE quest_template SET minlevel = 1 WHERE entry = 8671; # Ragetotem the Elder
UPDATE quest_template SET minlevel = 1 WHERE entry = 8672; # Stonespire the Elder
UPDATE quest_template SET minlevel = 1 WHERE entry = 8673; # Bloodhoof the Elder
UPDATE quest_template SET minlevel = 1 WHERE entry = 8674; # Winterhoof the Elder
UPDATE quest_template SET minlevel = 1 WHERE entry = 8675; # Skychaser the Elder
UPDATE quest_template SET minlevel = 1 WHERE entry = 8676; # Wildmane the Elder
UPDATE quest_template SET minlevel = 1 WHERE entry = 8677; # Darkhorn the Elder
UPDATE quest_template SET minlevel = 1 WHERE entry = 8679; # Grimtotem the Elder
UPDATE quest_template SET minlevel = 1 WHERE entry = 8680; # Windtotem the Elder
UPDATE quest_template SET minlevel = 1 WHERE entry = 8681; # Thunderhorn the Elder
UPDATE quest_template SET minlevel = 1 WHERE entry = 8682; # Skyseer the Elder
UPDATE quest_template SET minlevel = 1 WHERE entry = 8683; # Dawnstrider the Elder
UPDATE quest_template SET minlevel = 1 WHERE entry = 8684; # Dreamseer the Elder
UPDATE quest_template SET minlevel = 1 WHERE entry = 8685; # Mistwalker the Elder
UPDATE quest_template SET minlevel = 1 WHERE entry = 8686; # High Mountain the Elder
UPDATE quest_template SET minlevel = 1 WHERE entry = 8688; # Windrun the Elder
UPDATE quest_template SET minlevel = 1 WHERE entry = 8713; # Starsong the Elder
UPDATE quest_template SET minlevel = 1 WHERE entry = 8714; # Moonstrike the Elder
UPDATE quest_template SET minlevel = 1 WHERE entry = 8715; # Bladeleaf the Elder
UPDATE quest_template SET minlevel = 1 WHERE entry = 8716; # Starglade the Elder
UPDATE quest_template SET minlevel = 1 WHERE entry = 8717; # Moonwarden the Elder
UPDATE quest_template SET minlevel = 1 WHERE entry = 8718; # Bladeswift the Elder
UPDATE quest_template SET minlevel = 1 WHERE entry = 8719; # Bladesing the Elder
UPDATE quest_template SET minlevel = 1 WHERE entry = 8720; # Skygleam the Elder
UPDATE quest_template SET minlevel = 1 WHERE entry = 8721; # Starweave the Elder
UPDATE quest_template SET minlevel = 1 WHERE entry = 8722; # Meadowrun the Elder
UPDATE quest_template SET minlevel = 1 WHERE entry = 8723; # Nightwind the Elder
UPDATE quest_template SET minlevel = 1 WHERE entry = 8724; # Morningdew the Elder
UPDATE quest_template SET minlevel = 1 WHERE entry = 8725; # Riversong the Elder
UPDATE quest_template SET minlevel = 1 WHERE entry = 8726; # Brightspear the Elder
UPDATE quest_template SET minlevel = 1 WHERE entry = 8727; # Farwhisper the Elder
UPDATE quest_template SET minlevel = 1 WHERE entry = 8828; # Elder Morndeep
UPDATE quest_template SET minlevel = 1 WHERE entry = 8866; # Bronzebeard the Elder


UPDATE quest_template SET minlevel = 1 WHERE entry = 8870; # The Lunar Festival (Alliance)
UPDATE quest_template SET minlevel = 1 WHERE entry = 8871; # The Lunar Festival (Alliance)
UPDATE quest_template SET minlevel = 1 WHERE entry = 8872; # The Lunar Festival (Alliance)
UPDATE quest_template SET minlevel = 1 WHERE entry = 8873; # The Lunar Festival (Horde)
UPDATE quest_template SET minlevel = 1 WHERE entry = 8875; # The Lunar Festival (Horde)
UPDATE quest_template SET minlevel = 1 WHERE entry = 8883; # Valadar Starsong
 
 
/* 
* 20170203102835_world.sql 
*/ 
INSERT INTO `migrations` VALUES ('20170203102835');

# Greater Moonlight spawns for Lunar Festival
INSERT INTO `gameobject` (`id`,`map`,`position_x`,`position_y`,`position_z`,`orientation`,`rotation0`,`rotation1`,`rotation2`,`rotation3`,`spawntimesecs`,`animprogress`,`state`,`spawnFlags`) VALUES (300058,0,-8748.54,1074.11,90.5289,2.98686,0,0,0.997009,0.0772914,25,100,1,0);
INSERT INTO `game_event_gameobject` (`guid`, `event`) VALUES (LAST_INSERT_ID(), 7);
INSERT INTO `gameobject` (`id`,`map`,`position_x`,`position_y`,`position_z`,`orientation`,`rotation0`,`rotation1`,`rotation2`,`rotation3`,`spawntimesecs`,`animprogress`,`state`,`spawnFlags`) VALUES (300058,0,-4663.36,-956.337,500.378,4.99386,0,0,0.600928,-0.799303,25,100,1,0);
INSERT INTO `game_event_gameobject` (`guid`, `event`) VALUES (LAST_INSERT_ID(),7);
INSERT INTO `gameobject` (`id`,`map`,`position_x`,`position_y`,`position_z`,`orientation`,`rotation0`,`rotation1`,`rotation2`,`rotation3`,`spawntimesecs`,`animprogress`,`state`,`spawnFlags`) VALUES (300058,1,-1032.01,-230.341,160.172,3.91038,0,0,0.927027,-0.374995,25,100,1,0);
INSERT INTO `game_event_gameobject` (`guid`, `event`) VALUES (LAST_INSERT_ID(),7);
INSERT INTO `gameobject` (`id`,`map`,`position_x`,`position_y`,`position_z`,`orientation`,`rotation0`,`rotation1`,`rotation2`,`rotation3`,`spawntimesecs`,`animprogress`,`state`,`spawnFlags`) VALUES (300058,1,1983.28,-4255.96,31.6933,0.800278,0,0,0.389546,0.921007,25,100,1,0);
INSERT INTO `game_event_gameobject` (`guid`, `event`) VALUES (LAST_INSERT_ID(),7);
 
 
/* 
* 20170203111800_world.sql 
*/ 
INSERT INTO `migrations` VALUES ('20170203111800');

# Fariel Starsong gossip
INSERT INTO npc_gossip (npc_guid, textid) VALUES (91687, 8203);
INSERT INTO npc_text (id, text0_0, prob0, em0_1, em0_3) VALUES (8203, "I, like my brother, honor those who honor their ancestors. It brings me great joy to share my crafting secrets to disciples of the Lunar Festival!", 1, 1, 1);
 
 
/* 
* 20170203114800_world.sql 
*/ 
INSERT INTO `migrations` VALUES ('20170203114800');

# Lunar Festival vendor items
REPLACE INTO `npc_vendor` (`entry`, `item`) VALUES 
('15909', '21741'),
('15909', '21743'),
('15909', '21742'),
('15909', '21740'),
('15909', '21722'),
('15909', '21723'),
('15909', '21737'),
('15909', '21738'),
('15864', '21713'),
('15864', '21537'),
('15864', '21541'),
('15864', '21544'),
('15864', '21157'),
('15864', '21538'),
('15864', '21539'),
('15864', '21543'),
('15864', '21640');
 
 
/* 
* 20170203115700_world.sql 
*/ 
INSERT INTO `migrations` VALUES ('20170203115700');

# Elune's Blessing quest text
UPDATE `quest_template` SET `OfferRewardText`='Very well done, $N. Defeating Omen sent his spirit back to the water of Elune\'ara. Although the beast himself is blessed by Elune and so cannot die, his anger will subside for another year.' WHERE `entry`='8868';
 
 
/* 
* 20170203122300_world.sql 
*/ 
INSERT INTO `migrations` VALUES ('20170203122300');

# Table & scroll
INSERT INTO `gameobject` (`id`,`map`,`position_x`,`position_y`,`position_z`,`orientation`,`rotation0`,`rotation1`,`rotation2`,`rotation3`,`spawntimesecs`,`animprogress`,`state`,`spawnFlags`) VALUES (180910,1,7946.93,-2621.03,494.168,5.59793,0,0,0.335962,-0.941876,25,100,1,0);
INSERT INTO `game_event_gameobject` (`guid`, `event`) VALUES (LAST_INSERT_ID(), 7);
INSERT INTO `gameobject` (`id`,`map`,`position_x`,`position_y`,`position_z`,`orientation`,`rotation0`,`rotation1`,`rotation2`,`rotation3`,`spawntimesecs`,`animprogress`,`state`,`spawnFlags`) VALUES (180879,1,7946.93,-2621.03,492.307,5.59793,0,0,0.335962,-0.941876,25,100,1,0);
INSERT INTO `game_event_gameobject` (`guid`, `event`) VALUES (LAST_INSERT_ID(), 7);
 
 
/* 
* 20170203131900_world.sql 
*/ 
INSERT INTO `migrations` VALUES ('20170203131900');

# Lucky Red Envelopes
INSERT INTO `gameobject` (`id`,`map`,`position_x`,`position_y`,`position_z`,`orientation`,`rotation0`,`rotation1`,`rotation2`,`rotation3`,`spawntimesecs`,`animprogress`,`state`,`spawnFlags`) VALUES (180909,1,7946.86,-2620.91,494.168,6.06523,0,0,0.108761,-0.994068,25,100,1,0);
INSERT INTO `game_event_gameobject` (`guid`, `event`) VALUES (LAST_INSERT_ID(), 7);
INSERT INTO `gameobject` (`id`,`map`,`position_x`,`position_y`,`position_z`,`orientation`,`rotation0`,`rotation1`,`rotation2`,`rotation3`,`spawntimesecs`,`animprogress`,`state`,`spawnFlags`) VALUES (180909,1,7947.35,-2620.77,494.168,1.38347,0,0,0.637875,0.77014,25,100,1,0);
INSERT INTO `game_event_gameobject` (`guid`, `event`) VALUES (LAST_INSERT_ID(), 7);
INSERT INTO `gameobject` (`id`,`map`,`position_x`,`position_y`,`position_z`,`orientation`,`rotation0`,`rotation1`,`rotation2`,`rotation3`,`spawntimesecs`,`animprogress`,`state`,`spawnFlags`) VALUES (180909,1,7947.08,-2621.2,494.168,0.359312,0,0,0.178691,0.983905,25,100,1,0);
INSERT INTO `game_event_gameobject` (`guid`, `event`) VALUES (LAST_INSERT_ID(), 7);
INSERT INTO `gameobject` (`id`,`map`,`position_x`,`position_y`,`position_z`,`orientation`,`rotation0`,`rotation1`,`rotation2`,`rotation3`,`spawntimesecs`,`animprogress`,`state`,`spawnFlags`) VALUES (180909,1,7946.56,-2621.56,494.168,0.100123,0,0,0.0500404,0.998747,25,100,1,0);
INSERT INTO `game_event_gameobject` (`guid`, `event`) VALUES (LAST_INSERT_ID(), 7); 
 
/* 
* 20170203144000_world.sql 
*/ 
INSERT INTO `migrations` VALUES ('20170203144000');

# Firework schematics loot
INSERT INTO `item_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`) VALUES ('21741', '21730', '100', '0', '1', '1', '0');
INSERT INTO `item_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`) VALUES ('21741', '21731', '100', '0', '1', '1', '0');
INSERT INTO `item_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`) VALUES ('21741', '21732', '100', '0', '1', '1', '0');
INSERT INTO `item_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`) VALUES ('21743', '21733', '100', '0', '1', '1', '0');
INSERT INTO `item_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`) VALUES ('21743', '21734', '100', '0', '1', '1', '0');
INSERT INTO `item_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`) VALUES ('21743', '21735', '100', '0', '1', '1', '0');
INSERT INTO `item_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`) VALUES ('21742', '21727', '100', '0', '1', '1', '0');
INSERT INTO `item_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`) VALUES ('21742', '21728', '100', '0', '1', '1', '0');
INSERT INTO `item_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`) VALUES ('21742', '21729', '100', '0', '1', '1', '0');
INSERT INTO `item_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`) VALUES ('21740', '21724', '100', '0', '1', '1', '0');
INSERT INTO `item_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`) VALUES ('21740', '21725', '100', '0', '1', '1', '0');
INSERT INTO `item_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`) VALUES ('21740', '21726', '100', '0', '1', '1', '0');
 
 
/* 
* 20170203151109_world.sql 
*/ 
INSERT INTO `migrations` VALUES ('20170203151109');

UPDATE `quest_template` SET `MinLevel`='40' WHERE `entry`='8868';
 
 
/* 
* 20170203152921_world.sql 
*/ 
INSERT INTO `migrations` VALUES ('20170203152921'); 

-- Alzzin's Minion
UPDATE `creature_loot_template` SET `ChanceOrQuestChance` = 10.0 WHERE `entry` = 11460 AND `item` IN (10620, 12365);
 
 
/* 
* 20170203171900_world.sql 
*/ 
INSERT INTO `migrations` VALUES ('20170203171900');

# More Lunar Festival objects
INSERT INTO `gameobject` (`id`,`map`,`position_x`,`position_y`,`position_z`,`orientation`,`rotation0`,`rotation1`,`rotation2`,`rotation3`,`spawntimesecs`,`animprogress`,`state`,`spawnFlags`) VALUES (180875,1,7555.49,-2867.46,459,2.49166,0,0,0.947661,0.319279,25,100,1,0);
INSERT INTO `game_event_gameobject` (`guid`, `event`) VALUES (LAST_INSERT_ID(), 7);
INSERT INTO `gameobject` (`id`,`map`,`position_x`,`position_y`,`position_z`,`orientation`,`rotation0`,`rotation1`,`rotation2`,`rotation3`,`spawntimesecs`,`animprogress`,`state`,`spawnFlags`) VALUES (180875,1,7533.88,-2852.41,457.4,2.56627,0,0,0.95891,0.283711,25,100,1,0);
INSERT INTO `game_event_gameobject` (`guid`, `event`) VALUES (LAST_INSERT_ID(), 7);
INSERT INTO `gameobject` (`id`,`map`,`position_x`,`position_y`,`position_z`,`orientation`,`rotation0`,`rotation1`,`rotation2`,`rotation3`,`spawntimesecs`,`animprogress`,`state`,`spawnFlags`) VALUES (180777,1,7532.68,-2851.47,457.933,2.56627,0,0,0.95891,0.283711,25,100,1,0);
INSERT INTO `game_event_gameobject` (`guid`, `event`) VALUES (LAST_INSERT_ID(), 7);
INSERT INTO `gameobject` (`id`,`map`,`position_x`,`position_y`,`position_z`,`orientation`,`rotation0`,`rotation1`,`rotation2`,`rotation3`,`spawntimesecs`,`animprogress`,`state`,`spawnFlags`) VALUES (180777,1,7535.36,-2853.06,457.933,2.56627,0,0,0.95891,0.283711,25,100,1,0);
INSERT INTO `game_event_gameobject` (`guid`, `event`) VALUES (LAST_INSERT_ID(), 7);
INSERT INTO `gameobject` (`id`,`map`,`position_x`,`position_y`,`position_z`,`orientation`,`rotation0`,`rotation1`,`rotation2`,`rotation3`,`spawntimesecs`,`animprogress`,`state`,`spawnFlags`) VALUES (180777,1,7554.26,-2866.64,459.493,2.50343,0,0,0.949524,0.313694,25,100,1,0);
INSERT INTO `game_event_gameobject` (`guid`, `event`) VALUES (LAST_INSERT_ID(), 7);
INSERT INTO `gameobject` (`id`,`map`,`position_x`,`position_y`,`position_z`,`orientation`,`rotation0`,`rotation1`,`rotation2`,`rotation3`,`spawntimesecs`,`animprogress`,`state`,`spawnFlags`) VALUES (180777,1,7556.9,-2868.63,459.893,2.46416,0,0,0.943182,0.332277,25,100,1,0);
INSERT INTO `game_event_gameobject` (`guid`, `event`) VALUES (LAST_INSERT_ID(), 7);
INSERT INTO `gameobject` (`id`,`map`,`position_x`,`position_y`,`position_z`,`orientation`,`rotation0`,`rotation1`,`rotation2`,`rotation3`,`spawntimesecs`,`animprogress`,`state`,`spawnFlags`) VALUES (180766,1,7557.05,-2865.43,457.062,4.54767,0,0,0.359522,-0.933136,25,100,1,0);
INSERT INTO `game_event_gameobject` (`guid`, `event`) VALUES (LAST_INSERT_ID(), 7);
INSERT INTO `gameobject` (`id`,`map`,`position_x`,`position_y`,`position_z`,`orientation`,`rotation0`,`rotation1`,`rotation2`,`rotation3`,`spawntimesecs`,`animprogress`,`state`,`spawnFlags`) VALUES (180766,1,7535.28,-2850.26,455.388,4.77778,0,0,0.250023,-0.96824,25,100,1,0);
INSERT INTO `game_event_gameobject` (`guid`, `event`) VALUES (LAST_INSERT_ID(), 7);
INSERT INTO `gameobject` (`id`,`map`,`position_x`,`position_y`,`position_z`,`orientation`,`rotation0`,`rotation1`,`rotation2`,`rotation3`,`spawntimesecs`,`animprogress`,`state`,`spawnFlags`) VALUES (180772,1,7555.39,-2867.73,460.165,4.0633,0,0,0.895673,-0.444713,25,100,1,0);
INSERT INTO `game_event_gameobject` (`guid`, `event`) VALUES (LAST_INSERT_ID(), 7);
INSERT INTO `gameobject` (`id`,`map`,`position_x`,`position_y`,`position_z`,`orientation`,`rotation0`,`rotation1`,`rotation2`,`rotation3`,`spawntimesecs`,`animprogress`,`state`,`spawnFlags`) VALUES (180772,1,7533.83,-2852.56,458.565,4.09157,0,0,0.889297,-0.45733,25,100,1,0);
INSERT INTO `game_event_gameobject` (`guid`, `event`) VALUES (LAST_INSERT_ID(), 7);
INSERT INTO `gameobject` (`id`,`map`,`position_x`,`position_y`,`position_z`,`orientation`,`rotation0`,`rotation1`,`rotation2`,`rotation3`,`spawntimesecs`,`animprogress`,`state`,`spawnFlags`) VALUES (180777,1,7948.94,-2629.66,492.639,1.24999,0,0,0.585093,0.810966,25,100,1,0);
INSERT INTO `game_event_gameobject` (`guid`, `event`) VALUES (LAST_INSERT_ID(), 7);
INSERT INTO `gameobject` (`id`,`map`,`position_x`,`position_y`,`position_z`,`orientation`,`rotation0`,`rotation1`,`rotation2`,`rotation3`,`spawntimesecs`,`animprogress`,`state`,`spawnFlags`) VALUES (180777,1,7951.51,-2615.76,492.545,1.30423,0,0,0.606868,0.794803,25,100,1,0);
INSERT INTO `game_event_gameobject` (`guid`, `event`) VALUES (LAST_INSERT_ID(), 7);
INSERT INTO `gameobject` (`id`,`map`,`position_x`,`position_y`,`position_z`,`orientation`,`rotation0`,`rotation1`,`rotation2`,`rotation3`,`spawntimesecs`,`animprogress`,`state`,`spawnFlags`) VALUES (180777,0,-8957.6,503.504,97,0.670335,0,0,0.328927,0.944355,25,100,1,0);
INSERT INTO `game_event_gameobject` (`guid`, `event`) VALUES (LAST_INSERT_ID(), 7);
INSERT INTO `gameobject` (`id`,`map`,`position_x`,`position_y`,`position_z`,`orientation`,`rotation0`,`rotation1`,`rotation2`,`rotation3`,`spawntimesecs`,`animprogress`,`state`,`spawnFlags`) VALUES (180777,0,-8971.99,521.649,97.0006,3.82764,0,0,0.941743,-0.336335,25,100,1,0);
INSERT INTO `game_event_gameobject` (`guid`, `event`) VALUES (LAST_INSERT_ID(), 7);
INSERT INTO `gameobject` (`id`,`map`,`position_x`,`position_y`,`position_z`,`orientation`,`rotation0`,`rotation1`,`rotation2`,`rotation3`,`spawntimesecs`,`animprogress`,`state`,`spawnFlags`) VALUES (180777,0,-8995.39,502.988,97.1706,3.73261,0,0,0.956655,-0.291224,25,100,1,0);
INSERT INTO `game_event_gameobject` (`guid`, `event`) VALUES (LAST_INSERT_ID(), 7);
INSERT INTO `gameobject` (`id`,`map`,`position_x`,`position_y`,`position_z`,`orientation`,`rotation0`,`rotation1`,`rotation2`,`rotation3`,`spawntimesecs`,`animprogress`,`state`,`spawnFlags`) VALUES (180777,0,-8981.28,484.561,97.1765,0.657771,0,0,0.322988,0.946403,25,100,1,0);
INSERT INTO `game_event_gameobject` (`guid`, `event`) VALUES (LAST_INSERT_ID(), 7);
INSERT INTO `gameobject` (`id`,`map`,`position_x`,`position_y`,`position_z`,`orientation`,`rotation0`,`rotation1`,`rotation2`,`rotation3`,`spawntimesecs`,`animprogress`,`state`,`spawnFlags`) VALUES (180777,0,-9015.21,457.918,95.4169,0.606723,0,0,0.29873,0.954338,25,100,1,0);
INSERT INTO `game_event_gameobject` (`guid`, `event`) VALUES (LAST_INSERT_ID(), 7);
INSERT INTO `gameobject` (`id`,`map`,`position_x`,`position_y`,`position_z`,`orientation`,`rotation0`,`rotation1`,`rotation2`,`rotation3`,`spawntimesecs`,`animprogress`,`state`,`spawnFlags`) VALUES (180777,0,-9029.31,475.614,95.4105,3.77581,0,0,0.95014,-0.311823,25,100,1,0);
INSERT INTO `game_event_gameobject` (`guid`, `event`) VALUES (LAST_INSERT_ID(), 7);
INSERT INTO `gameobject` (`id`,`map`,`position_x`,`position_y`,`position_z`,`orientation`,`rotation0`,`rotation1`,`rotation2`,`rotation3`,`spawntimesecs`,`animprogress`,`state`,`spawnFlags`) VALUES (180777,0,-9092.41,399.354,93.0788,0.717474,0,0,0.351092,0.936341,25,100,1,0);
INSERT INTO `game_event_gameobject` (`guid`, `event`) VALUES (LAST_INSERT_ID(), 7);
INSERT INTO `gameobject` (`id`,`map`,`position_x`,`position_y`,`position_z`,`orientation`,`rotation0`,`rotation1`,`rotation2`,`rotation3`,`spawntimesecs`,`animprogress`,`state`,`spawnFlags`) VALUES (180777,0,-9106.66,417.552,93.2071,3.65486,0,0,0.967249,-0.253828,25,100,1,0);
INSERT INTO `game_event_gameobject` (`guid`, `event`) VALUES (LAST_INSERT_ID(), 7);
INSERT INTO `gameobject` (`id`,`map`,`position_x`,`position_y`,`position_z`,`orientation`,`rotation0`,`rotation1`,`rotation2`,`rotation3`,`spawntimesecs`,`animprogress`,`state`,`spawnFlags`) VALUES (180777,1,10155.2,2571.16,1320.59,3.94897,0,0,0.919619,-0.392812,25,100,1,0);
INSERT INTO `game_event_gameobject` (`guid`, `event`) VALUES (LAST_INSERT_ID(), 7);
INSERT INTO `gameobject` (`id`,`map`,`position_x`,`position_y`,`position_z`,`orientation`,`rotation0`,`rotation1`,`rotation2`,`rotation3`,`spawntimesecs`,`animprogress`,`state`,`spawnFlags`) VALUES (180777,1,10148.2,2592.01,1330.4,1.57312,0,0,0.707928,0.706285,25,100,1,0);
INSERT INTO `game_event_gameobject` (`guid`, `event`) VALUES (LAST_INSERT_ID(), 7);
INSERT INTO `gameobject` (`id`,`map`,`position_x`,`position_y`,`position_z`,`orientation`,`rotation0`,`rotation1`,`rotation2`,`rotation3`,`spawntimesecs`,`animprogress`,`state`,`spawnFlags`) VALUES (180777,1,10155.7,2593.41,1330.29,4.83331,0,0,0.663089,-0.74854,25,100,1,0);
INSERT INTO `game_event_gameobject` (`guid`, `event`) VALUES (LAST_INSERT_ID(), 7);
INSERT INTO `gameobject` (`id`,`map`,`position_x`,`position_y`,`position_z`,`orientation`,`rotation0`,`rotation1`,`rotation2`,`rotation3`,`spawntimesecs`,`animprogress`,`state`,`spawnFlags`) VALUES (180766,1,10149.7,2591.23,1330.72,1.66737,0,0,0.740415,0.67215,25,100,1,0);
INSERT INTO `game_event_gameobject` (`guid`, `event`) VALUES (LAST_INSERT_ID(), 7);
INSERT INTO `gameobject` (`id`,`map`,`position_x`,`position_y`,`position_z`,`orientation`,`rotation0`,`rotation1`,`rotation2`,`rotation3`,`spawntimesecs`,`animprogress`,`state`,`spawnFlags`) VALUES (180766,1,10155.2,2592.3,1330.77,1.70664,0,0,0.753469,0.657484,25,100,1,0);
INSERT INTO `game_event_gameobject` (`guid`, `event`) VALUES (LAST_INSERT_ID(), 7);
INSERT INTO `gameobject` (`id`,`map`,`position_x`,`position_y`,`position_z`,`orientation`,`rotation0`,`rotation1`,`rotation2`,`rotation3`,`spawntimesecs`,`animprogress`,`state`,`spawnFlags`) VALUES (180766,1,10159.7,2604.62,1330.83,1.62654,0,0,0.726536,0.687128,25,100,1,0);
INSERT INTO `game_event_gameobject` (`guid`, `event`) VALUES (LAST_INSERT_ID(), 7);
INSERT INTO `gameobject` (`id`,`map`,`position_x`,`position_y`,`position_z`,`orientation`,`rotation0`,`rotation1`,`rotation2`,`rotation3`,`spawntimesecs`,`animprogress`,`state`,`spawnFlags`) VALUES (180766,1,10139.9,2605.2,1330.83,1.53857,0,0,0.695622,0.718408,25,100,1,0);
INSERT INTO `game_event_gameobject` (`guid`, `event`) VALUES (LAST_INSERT_ID(), 7);
INSERT INTO `gameobject` (`id`,`map`,`position_x`,`position_y`,`position_z`,`orientation`,`rotation0`,`rotation1`,`rotation2`,`rotation3`,`spawntimesecs`,`animprogress`,`state`,`spawnFlags`) VALUES (180764,1,10139.9,2604.81,1330.83,1.62497,0,0,0.725998,0.687697,25,100,1,0);
INSERT INTO `game_event_gameobject` (`guid`, `event`) VALUES (LAST_INSERT_ID(), 7);
INSERT INTO `gameobject` (`id`,`map`,`position_x`,`position_y`,`position_z`,`orientation`,`rotation0`,`rotation1`,`rotation2`,`rotation3`,`spawntimesecs`,`animprogress`,`state`,`spawnFlags`) VALUES (180764,1,10159.7,2604.23,1330.83,1.58727,0,0,0.712907,0.701258,25,100,1,0);
INSERT INTO `game_event_gameobject` (`guid`, `event`) VALUES (LAST_INSERT_ID(), 7);
INSERT INTO `gameobject` (`id`,`map`,`position_x`,`position_y`,`position_z`,`orientation`,`rotation0`,`rotation1`,`rotation2`,`rotation3`,`spawntimesecs`,`animprogress`,`state`,`spawnFlags`) VALUES (180764,1,10155.3,2591.91,1330.49,1.66186,0,0,0.73856,0.674187,25,100,1,0);
INSERT INTO `game_event_gameobject` (`guid`, `event`) VALUES (LAST_INSERT_ID(), 7);
INSERT INTO `gameobject` (`id`,`map`,`position_x`,`position_y`,`position_z`,`orientation`,`rotation0`,`rotation1`,`rotation2`,`rotation3`,`spawntimesecs`,`animprogress`,`state`,`spawnFlags`) VALUES (180764,1,10149.6,2590.84,1330.4,1.66972,0,0,0.741202,0.671282,25,100,1,0);
INSERT INTO `game_event_gameobject` (`guid`, `event`) VALUES (LAST_INSERT_ID(), 7);
INSERT INTO `gameobject` (`id`,`map`,`position_x`,`position_y`,`position_z`,`orientation`,`rotation0`,`rotation1`,`rotation2`,`rotation3`,`spawntimesecs`,`animprogress`,`state`,`spawnFlags`) VALUES (180777,1,10145.8,2575,1320.91,0.890613,0,0,0.430735,0.902479,25,100,1,0);
INSERT INTO `game_event_gameobject` (`guid`, `event`) VALUES (LAST_INSERT_ID(), 7);
INSERT INTO `gameobject` (`id`,`map`,`position_x`,`position_y`,`position_z`,`orientation`,`rotation0`,`rotation1`,`rotation2`,`rotation3`,`spawntimesecs`,`animprogress`,`state`,`spawnFlags`) VALUES (180766,1,10146.6,2574.85,1320.77,1.12231,0,0,0.532163,0.846642,25,100,1,0);
INSERT INTO `game_event_gameobject` (`guid`, `event`) VALUES (LAST_INSERT_ID(), 7);
INSERT INTO `gameobject` (`id`,`map`,`position_x`,`position_y`,`position_z`,`orientation`,`rotation0`,`rotation1`,`rotation2`,`rotation3`,`spawntimesecs`,`animprogress`,`state`,`spawnFlags`) VALUES (180764,1,10146.4,2574.47,1320.81,1.16786,0,0,0.551307,0.834303,25,100,1,0);
INSERT INTO `game_event_gameobject` (`guid`, `event`) VALUES (LAST_INSERT_ID(), 7);
INSERT INTO `gameobject` (`id`,`map`,`position_x`,`position_y`,`position_z`,`orientation`,`rotation0`,`rotation1`,`rotation2`,`rotation3`,`spawntimesecs`,`animprogress`,`state`,`spawnFlags`) VALUES (180879,1,10145.8,2572.99,1320.9,1.57155,0,0,0.707375,0.706839,25,100,1,0);
INSERT INTO `game_event_gameobject` (`guid`, `event`) VALUES (LAST_INSERT_ID(), 7);
INSERT INTO `gameobject` (`id`,`map`,`position_x`,`position_y`,`position_z`,`orientation`,`rotation0`,`rotation1`,`rotation2`,`rotation3`,`spawntimesecs`,`animprogress`,`state`,`spawnFlags`) VALUES (180878,1,10146.8,2571.74,1320.76,1.81895,0,0,0.789183,0.614158,25,100,1,0);
INSERT INTO `game_event_gameobject` (`guid`, `event`) VALUES (LAST_INSERT_ID(), 7);
INSERT INTO `gameobject` (`id`,`map`,`position_x`,`position_y`,`position_z`,`orientation`,`rotation0`,`rotation1`,`rotation2`,`rotation3`,`spawntimesecs`,`animprogress`,`state`,`spawnFlags`) VALUES (180878,1,10148.6,2573.92,1320.49,1.5637,0,0,0.704593,0.709611,25,100,1,0);
INSERT INTO `game_event_gameobject` (`guid`, `event`) VALUES (LAST_INSERT_ID(), 7);
INSERT INTO `gameobject` (`id`,`map`,`position_x`,`position_y`,`position_z`,`orientation`,`rotation0`,`rotation1`,`rotation2`,`rotation3`,`spawntimesecs`,`animprogress`,`state`,`spawnFlags`) VALUES (180878,1,10147.6,2574.14,1320.63,1.30452,0,0,0.606983,0.794715,25,100,1,0);
INSERT INTO `game_event_gameobject` (`guid`, `event`) VALUES (LAST_INSERT_ID(), 7);
INSERT INTO `gameobject` (`id`,`map`,`position_x`,`position_y`,`position_z`,`orientation`,`rotation0`,`rotation1`,`rotation2`,`rotation3`,`spawntimesecs`,`animprogress`,`state`,`spawnFlags`) VALUES (180878,1,10144.5,2572.55,1321.12,1.49694,0,0,0.680519,0.732731,25,100,1,0);
INSERT INTO `game_event_gameobject` (`guid`, `event`) VALUES (LAST_INSERT_ID(), 7);
INSERT INTO `gameobject` (`id`,`map`,`position_x`,`position_y`,`position_z`,`orientation`,`rotation0`,`rotation1`,`rotation2`,`rotation3`,`spawntimesecs`,`animprogress`,`state`,`spawnFlags`) VALUES (180878,1,10143.9,2573.33,1321.24,1.76005,0,0,0.770755,0.637132,25,100,1,0);
INSERT INTO `game_event_gameobject` (`guid`, `event`) VALUES (LAST_INSERT_ID(), 7);
INSERT INTO `gameobject` (`id`,`map`,`position_x`,`position_y`,`position_z`,`orientation`,`rotation0`,`rotation1`,`rotation2`,`rotation3`,`spawntimesecs`,`animprogress`,`state`,`spawnFlags`) VALUES (180878,1,10144.6,2574.08,1321.11,1.07832,0,0,0.513417,0.858139,25,100,1,0);
INSERT INTO `game_event_gameobject` (`guid`, `event`) VALUES (LAST_INSERT_ID(), 7);
INSERT INTO `gameobject` (`id`,`map`,`position_x`,`position_y`,`position_z`,`orientation`,`rotation0`,`rotation1`,`rotation2`,`rotation3`,`spawntimesecs`,`animprogress`,`state`,`spawnFlags`) VALUES (300058,1,10150.6,2602.13,1330.83,1.95247,0,0,0.828394,0.560145,25,100,1,0);
INSERT INTO `game_event_gameobject` (`guid`, `event`) VALUES (LAST_INSERT_ID(), 7);
INSERT INTO `gameobject` (`id`,`map`,`position_x`,`position_y`,`position_z`,`orientation`,`rotation0`,`rotation1`,`rotation2`,`rotation3`,`spawntimesecs`,`animprogress`,`state`,`spawnFlags`) VALUES (180880,1,10146.3,2572.41,1322.76,0.626712,0,0,0.308253,0.951304,25,100,1,0);
INSERT INTO `game_event_gameobject` (`guid`, `event`) VALUES (LAST_INSERT_ID(), 7);
INSERT INTO `gameobject` (`id`,`map`,`position_x`,`position_y`,`position_z`,`orientation`,`rotation0`,`rotation1`,`rotation2`,`rotation3`,`spawntimesecs`,`animprogress`,`state`,`spawnFlags`) VALUES (180882,1,10146.4,2572.78,1322.76,1.44745,0,0,0.662182,0.749343,25,100,1,0);
INSERT INTO `game_event_gameobject` (`guid`, `event`) VALUES (LAST_INSERT_ID(), 7);
INSERT INTO `gameobject` (`id`,`map`,`position_x`,`position_y`,`position_z`,`orientation`,`rotation0`,`rotation1`,`rotation2`,`rotation3`,`spawntimesecs`,`animprogress`,`state`,`spawnFlags`) VALUES (180881,1,10146,2573.34,1322.76,2.11897,0,0,0.872103,0.489322,25,100,1,0);
INSERT INTO `game_event_gameobject` (`guid`, `event`) VALUES (LAST_INSERT_ID(), 7);
INSERT INTO `gameobject` (`id`,`map`,`position_x`,`position_y`,`position_z`,`orientation`,`rotation0`,`rotation1`,`rotation2`,`rotation3`,`spawntimesecs`,`animprogress`,`state`,`spawnFlags`) VALUES (180883,1,10145.6,2572.35,1322.76,5.96113,0,0,0.160331,-0.987063,25,100,1,0);
INSERT INTO `game_event_gameobject` (`guid`, `event`) VALUES (LAST_INSERT_ID(), 7);
INSERT INTO `gameobject` (`id`,`map`,`position_x`,`position_y`,`position_z`,`orientation`,`rotation0`,`rotation1`,`rotation2`,`rotation3`,`spawntimesecs`,`animprogress`,`state`,`spawnFlags`) VALUES (180883,1,10145.5,2573.08,1322.76,5.90458,0,0,0.188173,-0.982136,25,100,1,0);
INSERT INTO `game_event_gameobject` (`guid`, `event`) VALUES (LAST_INSERT_ID(), 7);
INSERT INTO `gameobject` (`id`,`map`,`position_x`,`position_y`,`position_z`,`orientation`,`rotation0`,`rotation1`,`rotation2`,`rotation3`,`spawntimesecs`,`animprogress`,`state`,`spawnFlags`) VALUES (180869,1,10148.3,2595.67,1330.83,1.23537,0,0,0.57915,0.815221,25,100,1,0);
INSERT INTO `game_event_gameobject` (`guid`, `event`) VALUES (LAST_INSERT_ID(), 7);
INSERT INTO `gameobject` (`id`,`map`,`position_x`,`position_y`,`position_z`,`orientation`,`rotation0`,`rotation1`,`rotation2`,`rotation3`,`spawntimesecs`,`animprogress`,`state`,`spawnFlags`) VALUES (180869,1,10154.5,2597.78,1330.83,2.29644,0,0,0.912036,0.41011,25,100,1,0);
INSERT INTO `game_event_gameobject` (`guid`, `event`) VALUES (LAST_INSERT_ID(), 7);
INSERT INTO `gameobject` (`id`,`map`,`position_x`,`position_y`,`position_z`,`orientation`,`rotation0`,`rotation1`,`rotation2`,`rotation3`,`spawntimesecs`,`animprogress`,`state`,`spawnFlags`) VALUES (180869,1,10155.6,2605.15,1330.83,3.4392,0,0,0.988949,-0.148254,25,100,1,0);
INSERT INTO `game_event_gameobject` (`guid`, `event`) VALUES (LAST_INSERT_ID(), 7);
INSERT INTO `gameobject` (`id`,`map`,`position_x`,`position_y`,`position_z`,`orientation`,`rotation0`,`rotation1`,`rotation2`,`rotation3`,`spawntimesecs`,`animprogress`,`state`,`spawnFlags`) VALUES (180869,1,10145.6,2606.04,1330.83,5.44902,0,0,0.405097,-0.914274,25,100,1,0);
INSERT INTO `game_event_gameobject` (`guid`, `event`) VALUES (LAST_INSERT_ID(), 7);
INSERT INTO `gameobject` (`id`,`map`,`position_x`,`position_y`,`position_z`,`orientation`,`rotation0`,`rotation1`,`rotation2`,`rotation3`,`spawntimesecs`,`animprogress`,`state`,`spawnFlags`) VALUES (180868,1,10147.5,2608.75,1330.83,5.10345,0,0,0.556251,-0.831014,25,100,1,0);
INSERT INTO `game_event_gameobject` (`guid`, `event`) VALUES (LAST_INSERT_ID(), 7);
INSERT INTO `gameobject` (`id`,`map`,`position_x`,`position_y`,`position_z`,`orientation`,`rotation0`,`rotation1`,`rotation2`,`rotation3`,`spawntimesecs`,`animprogress`,`state`,`spawnFlags`) VALUES (180868,1,10151.7,2608.76,1330.83,4.64242,0,0,0.731407,-0.681942,25,100,1,0);
INSERT INTO `game_event_gameobject` (`guid`, `event`) VALUES (LAST_INSERT_ID(), 7);
INSERT INTO `gameobject` (`id`,`map`,`position_x`,`position_y`,`position_z`,`orientation`,`rotation0`,`rotation1`,`rotation2`,`rotation3`,`spawntimesecs`,`animprogress`,`state`,`spawnFlags`) VALUES (180868,1,10155.4,2607.31,1330.83,3.8374,0,0,0.94009,-0.340926,25,100,1,0);
INSERT INTO `game_event_gameobject` (`guid`, `event`) VALUES (LAST_INSERT_ID(), 7);
INSERT INTO `gameobject` (`id`,`map`,`position_x`,`position_y`,`position_z`,`orientation`,`rotation0`,`rotation1`,`rotation2`,`rotation3`,`spawntimesecs`,`animprogress`,`state`,`spawnFlags`) VALUES (180868,1,10156.8,2602.67,1330.83,3.10228,0,0,0.999807,0.0196561,25,100,1,0);
INSERT INTO `game_event_gameobject` (`guid`, `event`) VALUES (LAST_INSERT_ID(), 7);
 
 
/* 
* 20170203184629_world.sql 
*/ 
INSERT INTO `migrations` VALUES ('20170203184629');

INSERT INTO `spell_script_target` (`entry`,`type`,`targetEntry`) VALUES (26373,0,300058);

INSERT INTO `gameobject` (`id`,`map`,`position_x`,`position_y`,`position_z`,`orientation`,`rotation0`,`rotation1`,`rotation2`,`rotation3`,`spawntimesecs`,`animprogress`,`state`,`spawnFlags`) VALUES (300058,0,1641.54,239.796,62.5928,3.20459,0,0,0.999504,-0.0314928,25,100,1,0);

INSERT INTO `game_event_gameobject` (`guid`, `event`) VALUES (LAST_INSERT_ID(), 7);
UPDATE `gameobject_template` SET `ScriptName` = "go_greater_moonlight" WHERE `entry` = 300058;
 
 
/* 
* 20170203185500_world.sql 
*/ 
INSERT INTO `migrations` VALUES ('20170203185500');

UPDATE quest_template SET MinLevel = 1, QuestLevel = 60 WHERE entry = 8868;
 
 
/* 
* 20170204153146_world.sql 
*/ 
INSERT INTO `migrations` VALUES ('20170204153146'); 

-- Demonic Rune
UPDATE `item_template` SET `AllowableClass` = 1494 WHERE `entry` = 12662;
 
 
/* 
* 20170204215120_world.sql 
*/ 
INSERT INTO `migrations` VALUES ('20170204215120');

-- Delete Junk coordinates
DELETE FROM `spell_target_position` WHERE `id` = 8195;

-- Update Skeram Blinks with proper coordinates
INSERT INTO `spell_target_position` VALUES
(4801,  531,    -8330.1,    2122.84,    133.07, 5.04),
(8195,  531,    -8306.33,   2062.45,    133.07, 1.95),
(20449, 531,    -8349.43,   2080.26,    125.66, 0.407);
 
 
/* 
* 20170204232710_world.sql 
*/ 
INSERT INTO `migrations` VALUES ('20170204232710'); 

-- Omen
UPDATE `creature_template` SET `faction_A` = 14, `faction_H` = 14, `attackpower` = 31, `ScriptName` = 'npc_minion_of_omen' WHERE `entry` = 15466;
UPDATE `creature_template` SET 
`minhealth` = 470000, `maxhealth` = 470000, 
`attackpower` = 330, `dmg_multiplier` = 2, 
`resistance2` = 26, `resistance3` = 26, 
`resistance4` = 26, `resistance5` = 26, `resistance6` = 26, 
`mechanic_immune_mask` = 650854399, `flags_extra` = 0,
`ScriptName` = 'boss_omen' WHERE `entry` = 15467;
 
 
/* 
* 20170204232742_world.sql 
*/ 
INSERT INTO `migrations` VALUES ('20170204232742'); 

-- Firework Launchers, Cluster Launchers
UPDATE `gameobject_template` SET `data0` = 1352, `data1` = 35 WHERE `entry` = 180874;
REPLACE INTO spell_script_target VALUES 
(26304, 0, 180772),
(26325, 0, 180772),
(26327, 0, 180772),
(26488, 0, 180772),
(26490, 0, 180772),
(26517, 0, 180772),
(26521, 0, 180772),
(26304, 0, 180869),
(26325, 0, 180869),
(26327, 0, 180869),
(26488, 0, 180869),
(26490, 0, 180869),
(26517, 0, 180869),
(26521, 0, 180869),
(26304, 0, 180874),
(26325, 0, 180874),
(26327, 0, 180874),
(26488, 0, 180874),
(26490, 0, 180874),
(26517, 0, 180874),
(26521, 0, 180874),
(26286, 0, 180771),
(26291, 0, 180771),
(26292, 0, 180771),
(26333, 0, 180771),
(26334, 0, 180771),
(26336, 0, 180771),
(26294, 0, 180771),
(26295, 0, 180771),
(26337, 0, 180771),
(26338, 0, 180771),
(26286, 0, 180868),
(26291, 0, 180868),
(26292, 0, 180868),
(26333, 0, 180868),
(26334, 0, 180868),
(26336, 0, 180868),
(26294, 0, 180868),
(26295, 0, 180868),
(26337, 0, 180868),
(26338, 0, 180868);
 
 
/* 
* 20170205094814_world.sql 
*/ 
INSERT INTO `migrations` VALUES ('20170205094814'); 

-- Minions of Omen
REPLACE INTO `creature` VALUES
(2330376, 15466, 1, 0, 0, 7469.99, -2850.58, 466.656, 4.88930, 300, 5, 0, 5000, 0, 0, 1, 0),
(2330375, 15466, 1, 0, 0, 7485.16, -2784.31, 462.914, 4.91679, 300, 5, 0, 5000, 0, 0, 1, 0),
(2330374, 15466, 1, 0, 0, 7456.36, -2786.69, 464.682, 4.20366, 300, 5, 0, 5000, 0, 0, 1, 0),
(2330377, 15466, 1, 0, 0, 7497.63, -2876.70, 458.888, 5.43515, 300, 5, 0, 5000, 0, 0, 1, 0),
(2330378, 15466, 1, 0, 0, 7519.12, -2909.51, 459.933, 3.64053, 300, 5, 0, 5000, 0, 0, 1, 0),
(2330379, 15466, 1, 0, 0, 7626.87, -2938.65, 462.638, 5.45479, 300, 5, 0, 5000, 0, 0, 1, 0),
(2330380, 15466, 1, 0, 0, 7621.04, -2913.19, 463.067, 5.63464, 300, 5, 0, 5000, 0, 0, 1, 0),
(2330381, 15466, 1, 0, 0, 7680.61, -2913.07, 462.082, 0.36854, 300, 5, 0, 5000, 0, 0, 1, 0),
(2330382, 15466, 1, 0, 0, 7679.06, -2887.34, 463.960, 1.49559, 300, 5, 0, 5000, 0, 0, 1, 0),
(2330383, 15466, 1, 0, 0, 7714.73, -2907.89, 469.921, 0.17611, 300, 5, 0, 5000, 0, 0, 1, 0),
(2330384, 15466, 1, 0, 0, 7726.26, -2879.23, 464.410, 0.76909, 300, 5, 0, 5000, 0, 0, 1, 0),
(2330385, 15466, 1, 0, 0, 7748.58, -2892.94, 466.809, 0.28215, 300, 5, 0, 5000, 0, 0, 1, 0),
(2330386, 15466, 1, 0, 0, 7788.84, -2889.77, 467.064, 0.43922, 300, 5, 0, 5000, 0, 0, 1, 0),
(2330387, 15466, 1, 0, 0, 7781.36, -2846.24, 464.438, 1.53878, 300, 5, 0, 5000, 0, 0, 1, 0),
(2330388, 15466, 1, 0, 0, 7800.04, -2821.85, 457.797, 3.78895, 300, 5, 0, 5000, 0, 0, 1, 0),
(2330389, 15466, 1, 0, 0, 7727.31, -2855.40, 464.361, 0.78480, 300, 5, 0, 5000, 0, 0, 1, 0),
(2330390, 15466, 1, 0, 0, 7420.89, -2870.12, 466.381, 1.24424, 300, 5, 0, 5000, 0, 0, 1, 0),
(2330391, 15466, 1, 0, 0, 7582.20, -2883.16, 463.106, 0.01116, 300, 5, 0, 5000, 0, 0, 1, 0),
(2330392, 15466, 1, 0, 0, 7605.94, -2891.43, 464.455, 6.27864, 300, 5, 0, 5000, 0, 0, 1, 0),
(2330393, 15466, 1, 0, 0, 7649.13, -2910.13, 463.966, 0.02295, 300, 5, 0, 5000, 0, 0, 1, 0),
(2330394, 15466, 1, 0, 0, 7650.71, -2877.28, 466.328, 0.67483, 300, 5, 0, 5000, 0, 0, 1, 0),
(2330395, 15466, 1, 0, 0, 7550.13, -2891.34, 462.293, 3.30984, 300, 5, 0, 5000, 0, 0, 1, 0),
(2330396, 15466, 1, 0, 0, 7753.78, -2836.75, 461.609, 4.38976, 300, 5, 0, 5000, 0, 0, 1, 0);

REPLACE INTO `pool_template` VALUES
(14006, 13, 'Minion of Omen', 0, 11);

REPLACE INTO `pool_creature_template` VALUES
(15466, 14006, 0.0, 'Minion of Omen', 0);

REPLACE INTO `game_event_creature` VALUES
(2330376, 7),
(2330375, 7),
(2330374, 7),
(2330377, 7),
(2330378, 7),
(2330379, 7),
(2330380, 7),
(2330381, 7),
(2330382, 7),
(2330383, 7),
(2330384, 7),
(2330385, 7),
(2330386, 7),
(2330387, 7),
(2330388, 7),
(2330389, 7),
(2330390, 7),
(2330391, 7),
(2330392, 7),
(2330393, 7),
(2330394, 7),
(2330395, 7),
(2330396, 7);
 
 
/* 
* 20170205101929_world.sql 
*/ 
INSERT INTO `migrations` VALUES ('20170205101929'); 

-- Omen
DELETE FROM `creature_template` WHERE `entry` = 15902;
INSERT INTO `creature_template` (`entry`, `modelid_1`, `name`, `minhealth`, `maxhealth`, `faction_A`, `faction_H`, `scale`, `unit_flags`, `type`) VALUES
(15902, 14501, 'Giant Spotlight', 5000, 5000, 35, 35, 0, 0x2000206, 10);
DELETE FROM `creature_template_addon` WHERE `entry` = 15902;
INSERT INTO `creature_template_addon` (`entry`, `auras`) VALUES (15902, '25824');
UPDATE `gameobject_template` SET `data2` = 5 WHERE `entry` = 180876;
UPDATE `creature_template` SET `unit_flags` = 0, `lootid` = 0 WHERE `entry` = 15467;
UPDATE `gameobject_template` SET `size` = 0.01, `data2` = 8 WHERE `entry` = 180876;
DELETE FROM `creature_loot_template` WHERE `entry` = 15467;
REPLACE INTO `gameobject_template` (`entry`, `type`, `displayId`, `name`, `data3`) VALUES
(180856, 10, 6522, 'Firework Rocket, Type 1 Purple', 3000);
REPLACE INTO `gameobject_template` (`entry`, `type`, `displayId`, `name`, `size`, `data1`, `data2`, `data3`, `data5`, `data11`, `data14`) VALUES
(180877, 6, 327, 'Elune\'s Blessing TRAP QUESTCREDIT', 0.01, 255, 8, 26394, 1, 1, 1);
UPDATE `quest_template` SET `QuestLevel` = 60, `RewRepFaction1` = 609, `RewRepValue1` = 100 WHERE `entry` = 8868;
 
 
/* 
* 20170205182843_world.sql 
*/ 
INSERT INTO `migrations` VALUES ('20170205182843'); 

UPDATE `gameobject_template` SET `type` = 10, `flags` = 0, `data3` = `data2`, `data2` = 0, `data13` = 1, `data16` = 1 WHERE `NAME` LIKE 'firework, sho%';
DELETE FROM `spell_effect_mod` WHERE `id` = 26325;
UPDATE `creature_template` SET `ScriptName` = 'npc_firestarter_show' WHERE `ScriptName` = 'npc_holiday_firestarter';
DELETE FROM `gameobject` WHERE `id` IN (SELECT entry FROM gameobject_template WHERE NAME LIKE 'firework, sho%');
 
 
/* 
* 20170206055532_world.sql 
*/ 
INSERT INTO `migrations` VALUES ('20170206055532'); 

-- Eye of Kilrogg
UPDATE `creature_template` SET `minhealth` = 64, `maxhealth` = 64 WHERE `entry` = 4277;
 
 
/* 
* 20170206082553_world.sql 
*/ 
INSERT INTO `migrations` VALUES ('20170206082553'); 

-- Rescue OOX-17/TN!
UPDATE `script_waypoint` SET `waittime` = 2000 WHERE `entry` = 7784 AND `pointid` = 34;

DELETE FROM `script_waypoint` WHERE `entry` = 7784 AND `pointid` > 34;
REPLACE INTO `script_waypoint` VALUES
( '7784', '35', '-7265.41', '-4757.59', '9.46', '0', '' ),
( '7784', '36', '-7218.20', '-4771.53', '12.88', '0', '' ),
( '7784', '37', '-7165.54', '-4764.26', '9.85', '0', '' ),
( '7784', '38', '-7175.87', '-4759.82', '9.84', '0', '' ),
( '7784', '39', '-7065.05', '-4748.49', '9.81', '0', '' ),
( '7784', '40', '-7065.05', '-4748.49', '9.81', '0', '' ),
( '7784', '41', '-7016.11', '-4751.12', '10.06', '0', '' ),
( '7784', '42', '-6985.52', '-4777.41', '10.26', '0', '' ),
( '7784', '43', '-6953.02', '-4786', '6.32', '0', '' ),
( '7784', '44', '-6940.37', '-4831.03', '0.67', '10000', 'quest complete SAY_END' );
 
 
/* 
* 20170206103839_world.sql 
*/ 
INSERT INTO `migrations` VALUES ('20170206103839'); 

-- Thenan
UPDATE `quest_end_scripts` SET `datalong2` = 180000, `data_flags` = 2 WHERE `id` = 652;
 
 
/* 
* 20170206132655_world.sql 
*/ 
INSERT INTO `migrations` VALUES ('20170206132655'); 

-- Attack on the Tower
DELETE FROM `gameobject_loot_template` WHERE `entry` IN (2177, 2178, 2179) AND `ChanceOrQuestChance` > 0;
UPDATE `quest_end_scripts` SET `datalong4` = 300 WHERE `id` = 652;
UPDATE `event_scripts` SET `datalong2` = 120000, `datalong3` = 3, `data_flags` = 4 WHERE `id` IN (415, 416, 417);
 
 
/* 
* 20170206142220_world.sql 
*/ 
INSERT INTO `migrations` VALUES ('20170206142220'); 

-- Witch Doctor Unbagwa
DELETE FROM `quest_end_scripts` WHERE `id` = 349;
UPDATE `quest_template` SET `CompleteScript` = 0 WHERE `entry` = 349;
UPDATE `creature_template` SET `attackpower` = 34, `scale` = 1.6, `flags_extra` = 2, `ScriptName` = 'npc_witch_doctor_unbagwa' WHERE `entry` = 1449;
UPDATE `creature_template` SET `mindmg` = 75, `maxdmg` = 85, `attackpower` = 115 WHERE `entry` = 1511;
 
 
/* 
* 20170207063854_world.sql 
*/ 
INSERT INTO `migrations` VALUES ('20170207063854'); 

CREATE TABLE `tempDisabled` AS SELECT DISTINCT * FROM `spell_disabled`;
TRUNCATE `spell_disabled`;
INSERT INTO `spell_disabled` SELECT * FROM `tempDisabled`;
DROP TABLE `tempDisabled`;
ALTER TABLE `spell_disabled` ADD PRIMARY KEY(`entry`);
 
 
/* 
* 20170207080114_world.sql 
*/ 
-- Remove ability to teach Beast Tracking from Daggerspine Shorehunter
UPDATE `creature_template` SET `spell1` = 5119 WHERE `entry` = 2369;

INSERT INTO `migrations` VALUES ('20170207080114');
 
 
/* 
* 20170207133959_world.sql 
*/ 
INSERT INTO `migrations` VALUES ('20170207133959');

/*
-- Query: SELECT * FROM nostalrius.quest_template WHERE entry IN (8863, 8864, 8865, 8862, 8876, 8879, 8880, 8877, 8878, 8881, 8882)
LIMIT 0, 1000

-- Date: 2017-02-07 13:43
*/
INSERT INTO `quest_template` (`entry`,`Method`,`ZoneOrSort`,`MinLevel`,`QuestLevel`,`Type`,`RequiredClasses`,`RequiredRaces`,`RequiredSkill`,`RequiredSkillValue`,`RepObjectiveFaction`,`RepObjectiveValue`,`RequiredMinRepFaction`,`RequiredMinRepValue`,`RequiredMaxRepFaction`,`RequiredMaxRepValue`,`SuggestedPlayers`,`LimitTime`,`QuestFlags`,`SpecialFlags`,`PrevQuestId`,`NextQuestId`,`ExclusiveGroup`,`NextQuestInChain`,`SrcItemId`,`SrcItemCount`,`SrcSpell`,`Title`,`Details`,`Objectives`,`OfferRewardText`,`RequestItemsText`,`EndText`,`ObjectiveText1`,`ObjectiveText2`,`ObjectiveText3`,`ObjectiveText4`,`ReqItemId1`,`ReqItemId2`,`ReqItemId3`,`ReqItemId4`,`ReqItemCount1`,`ReqItemCount2`,`ReqItemCount3`,`ReqItemCount4`,`ReqSourceId1`,`ReqSourceId2`,`ReqSourceId3`,`ReqSourceId4`,`ReqSourceCount1`,`ReqSourceCount2`,`ReqSourceCount3`,`ReqSourceCount4`,`ReqCreatureOrGOId1`,`ReqCreatureOrGOId2`,`ReqCreatureOrGOId3`,`ReqCreatureOrGOId4`,`ReqCreatureOrGOCount1`,`ReqCreatureOrGOCount2`,`ReqCreatureOrGOCount3`,`ReqCreatureOrGOCount4`,`ReqSpellCast1`,`ReqSpellCast2`,`ReqSpellCast3`,`ReqSpellCast4`,`RewChoiceItemId1`,`RewChoiceItemId2`,`RewChoiceItemId3`,`RewChoiceItemId4`,`RewChoiceItemId5`,`RewChoiceItemId6`,`RewChoiceItemCount1`,`RewChoiceItemCount2`,`RewChoiceItemCount3`,`RewChoiceItemCount4`,`RewChoiceItemCount5`,`RewChoiceItemCount6`,`RewItemId1`,`RewItemId2`,`RewItemId3`,`RewItemId4`,`RewItemCount1`,`RewItemCount2`,`RewItemCount3`,`RewItemCount4`,`RewRepFaction1`,`RewRepFaction2`,`RewRepFaction3`,`RewRepFaction4`,`RewRepFaction5`,`RewRepValue1`,`RewRepValue2`,`RewRepValue3`,`RewRepValue4`,`RewRepValue5`,`RewOrReqMoney`,`RewMoneyMaxLevel`,`RewSpell`,`RewSpellCast`,`RewMailTemplateId`,`RewMailDelaySecs`,`PointMapId`,`PointX`,`PointY`,`PointOpt`,`DetailsEmote1`,`DetailsEmote2`,`DetailsEmote3`,`DetailsEmote4`,`DetailsEmoteDelay1`,`DetailsEmoteDelay2`,`DetailsEmoteDelay3`,`DetailsEmoteDelay4`,`IncompleteEmote`,`CompleteEmote`,`OfferRewardEmote1`,`OfferRewardEmote2`,`OfferRewardEmote3`,`OfferRewardEmote4`,`OfferRewardEmoteDelay1`,`OfferRewardEmoteDelay2`,`OfferRewardEmoteDelay3`,`OfferRewardEmoteDelay4`,`StartScript`,`CompleteScript`) VALUES (8862,0,-366,10,60,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'Elune\'s Candle','','','Very well then - I accept these coins of ancestry. Please take Elune\'s candle with my blessing. Also, please enjoy these complimentary fireworks.','Elune\'s candle is an artifact of great reverence to the disciples of the Lunar Festival. Stored within the candle is true moonlight, ready to be unleashed!$B$BThis light is harmless to most creatures, but you will find that Omen and his minions are burned and dazzled by it.','','','','','',21100,0,0,0,5,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,21713,21640,0,0,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0);
INSERT INTO `quest_template` (`entry`,`Method`,`ZoneOrSort`,`MinLevel`,`QuestLevel`,`Type`,`RequiredClasses`,`RequiredRaces`,`RequiredSkill`,`RequiredSkillValue`,`RepObjectiveFaction`,`RepObjectiveValue`,`RequiredMinRepFaction`,`RequiredMinRepValue`,`RequiredMaxRepFaction`,`RequiredMaxRepValue`,`SuggestedPlayers`,`LimitTime`,`QuestFlags`,`SpecialFlags`,`PrevQuestId`,`NextQuestId`,`ExclusiveGroup`,`NextQuestInChain`,`SrcItemId`,`SrcItemCount`,`SrcSpell`,`Title`,`Details`,`Objectives`,`OfferRewardText`,`RequestItemsText`,`EndText`,`ObjectiveText1`,`ObjectiveText2`,`ObjectiveText3`,`ObjectiveText4`,`ReqItemId1`,`ReqItemId2`,`ReqItemId3`,`ReqItemId4`,`ReqItemCount1`,`ReqItemCount2`,`ReqItemCount3`,`ReqItemCount4`,`ReqSourceId1`,`ReqSourceId2`,`ReqSourceId3`,`ReqSourceId4`,`ReqSourceCount1`,`ReqSourceCount2`,`ReqSourceCount3`,`ReqSourceCount4`,`ReqCreatureOrGOId1`,`ReqCreatureOrGOId2`,`ReqCreatureOrGOId3`,`ReqCreatureOrGOId4`,`ReqCreatureOrGOCount1`,`ReqCreatureOrGOCount2`,`ReqCreatureOrGOCount3`,`ReqCreatureOrGOCount4`,`ReqSpellCast1`,`ReqSpellCast2`,`ReqSpellCast3`,`ReqSpellCast4`,`RewChoiceItemId1`,`RewChoiceItemId2`,`RewChoiceItemId3`,`RewChoiceItemId4`,`RewChoiceItemId5`,`RewChoiceItemId6`,`RewChoiceItemCount1`,`RewChoiceItemCount2`,`RewChoiceItemCount3`,`RewChoiceItemCount4`,`RewChoiceItemCount5`,`RewChoiceItemCount6`,`RewItemId1`,`RewItemId2`,`RewItemId3`,`RewItemId4`,`RewItemCount1`,`RewItemCount2`,`RewItemCount3`,`RewItemCount4`,`RewRepFaction1`,`RewRepFaction2`,`RewRepFaction3`,`RewRepFaction4`,`RewRepFaction5`,`RewRepValue1`,`RewRepValue2`,`RewRepValue3`,`RewRepValue4`,`RewRepValue5`,`RewOrReqMoney`,`RewMoneyMaxLevel`,`RewSpell`,`RewSpellCast`,`RewMailTemplateId`,`RewMailDelaySecs`,`PointMapId`,`PointX`,`PointY`,`PointOpt`,`DetailsEmote1`,`DetailsEmote2`,`DetailsEmote3`,`DetailsEmote4`,`DetailsEmoteDelay1`,`DetailsEmoteDelay2`,`DetailsEmoteDelay3`,`DetailsEmoteDelay4`,`IncompleteEmote`,`CompleteEmote`,`OfferRewardEmote1`,`OfferRewardEmote2`,`OfferRewardEmote3`,`OfferRewardEmote4`,`OfferRewardEmoteDelay1`,`OfferRewardEmoteDelay2`,`OfferRewardEmoteDelay3`,`OfferRewardEmoteDelay4`,`StartScript`,`CompleteScript`) VALUES (8863,0,-366,1,60,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'Festival Dumplings','','','Excellent - please enjoy these dumplings with my compliments.  While they are but a small token of appreciation for the honor you have brought upon yourself through your actions, I think you will enjoy them all the same. Should you have any more coins of ancestry, I stand ready to offer you a wide array of items in exchange.','If you are hungry, then you have come to the right place my friend! Dumplings are the traditional food of the Lunar Festival; it has been served since the time of the first Lunar Festival, and I am pleased to be able to offer it at this one.$B$B In exchange for just a single coin of ancestry, I will share with you a sampling of one of the tastiest dishes you will ever enjoy!',NULL,NULL,NULL,NULL,NULL,21100,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,21537,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0);
INSERT INTO `quest_template` (`entry`,`Method`,`ZoneOrSort`,`MinLevel`,`QuestLevel`,`Type`,`RequiredClasses`,`RequiredRaces`,`RequiredSkill`,`RequiredSkillValue`,`RepObjectiveFaction`,`RepObjectiveValue`,`RequiredMinRepFaction`,`RequiredMinRepValue`,`RequiredMaxRepFaction`,`RequiredMaxRepValue`,`SuggestedPlayers`,`LimitTime`,`QuestFlags`,`SpecialFlags`,`PrevQuestId`,`NextQuestId`,`ExclusiveGroup`,`NextQuestInChain`,`SrcItemId`,`SrcItemCount`,`SrcSpell`,`Title`,`Details`,`Objectives`,`OfferRewardText`,`RequestItemsText`,`EndText`,`ObjectiveText1`,`ObjectiveText2`,`ObjectiveText3`,`ObjectiveText4`,`ReqItemId1`,`ReqItemId2`,`ReqItemId3`,`ReqItemId4`,`ReqItemCount1`,`ReqItemCount2`,`ReqItemCount3`,`ReqItemCount4`,`ReqSourceId1`,`ReqSourceId2`,`ReqSourceId3`,`ReqSourceId4`,`ReqSourceCount1`,`ReqSourceCount2`,`ReqSourceCount3`,`ReqSourceCount4`,`ReqCreatureOrGOId1`,`ReqCreatureOrGOId2`,`ReqCreatureOrGOId3`,`ReqCreatureOrGOId4`,`ReqCreatureOrGOCount1`,`ReqCreatureOrGOCount2`,`ReqCreatureOrGOCount3`,`ReqCreatureOrGOCount4`,`ReqSpellCast1`,`ReqSpellCast2`,`ReqSpellCast3`,`ReqSpellCast4`,`RewChoiceItemId1`,`RewChoiceItemId2`,`RewChoiceItemId3`,`RewChoiceItemId4`,`RewChoiceItemId5`,`RewChoiceItemId6`,`RewChoiceItemCount1`,`RewChoiceItemCount2`,`RewChoiceItemCount3`,`RewChoiceItemCount4`,`RewChoiceItemCount5`,`RewChoiceItemCount6`,`RewItemId1`,`RewItemId2`,`RewItemId3`,`RewItemId4`,`RewItemCount1`,`RewItemCount2`,`RewItemCount3`,`RewItemCount4`,`RewRepFaction1`,`RewRepFaction2`,`RewRepFaction3`,`RewRepFaction4`,`RewRepFaction5`,`RewRepValue1`,`RewRepValue2`,`RewRepValue3`,`RewRepValue4`,`RewRepValue5`,`RewOrReqMoney`,`RewMoneyMaxLevel`,`RewSpell`,`RewSpellCast`,`RewMailTemplateId`,`RewMailDelaySecs`,`PointMapId`,`PointX`,`PointY`,`PointOpt`,`DetailsEmote1`,`DetailsEmote2`,`DetailsEmote3`,`DetailsEmote4`,`DetailsEmoteDelay1`,`DetailsEmoteDelay2`,`DetailsEmoteDelay3`,`DetailsEmoteDelay4`,`IncompleteEmote`,`CompleteEmote`,`OfferRewardEmote1`,`OfferRewardEmote2`,`OfferRewardEmote3`,`OfferRewardEmote4`,`OfferRewardEmoteDelay1`,`OfferRewardEmoteDelay2`,`OfferRewardEmoteDelay3`,`OfferRewardEmoteDelay4`,`StartScript`,`CompleteScript`) VALUES (8864,0,-366,1,60,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'Festive Lunar Dresses','',NULL,'Very well then - I accept these coins of ancestry.  Please take your dress with my blessing.  Also, please enjoy these complimentary fireworks.','I have a selection of dresses that may be of interest to you.  Such dresses have been worn in times past during the Lunar Festival, and the selection I have today is perhaps the finest I have ever seen.  Each is hand-crafted with only the finest and softest of components.$B$BIn exchange for some coins of ancestry, I will let you choose one of the three styles I have to keep as your own.  Is this acceptable to you?',NULL,NULL,NULL,NULL,NULL,21100,0,0,0,5,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,21157,21539,21538,0,0,0,0,0,0,0,0,0,21640,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0);
INSERT INTO `quest_template` (`entry`,`Method`,`ZoneOrSort`,`MinLevel`,`QuestLevel`,`Type`,`RequiredClasses`,`RequiredRaces`,`RequiredSkill`,`RequiredSkillValue`,`RepObjectiveFaction`,`RepObjectiveValue`,`RequiredMinRepFaction`,`RequiredMinRepValue`,`RequiredMaxRepFaction`,`RequiredMaxRepValue`,`SuggestedPlayers`,`LimitTime`,`QuestFlags`,`SpecialFlags`,`PrevQuestId`,`NextQuestId`,`ExclusiveGroup`,`NextQuestInChain`,`SrcItemId`,`SrcItemCount`,`SrcSpell`,`Title`,`Details`,`Objectives`,`OfferRewardText`,`RequestItemsText`,`EndText`,`ObjectiveText1`,`ObjectiveText2`,`ObjectiveText3`,`ObjectiveText4`,`ReqItemId1`,`ReqItemId2`,`ReqItemId3`,`ReqItemId4`,`ReqItemCount1`,`ReqItemCount2`,`ReqItemCount3`,`ReqItemCount4`,`ReqSourceId1`,`ReqSourceId2`,`ReqSourceId3`,`ReqSourceId4`,`ReqSourceCount1`,`ReqSourceCount2`,`ReqSourceCount3`,`ReqSourceCount4`,`ReqCreatureOrGOId1`,`ReqCreatureOrGOId2`,`ReqCreatureOrGOId3`,`ReqCreatureOrGOId4`,`ReqCreatureOrGOCount1`,`ReqCreatureOrGOCount2`,`ReqCreatureOrGOCount3`,`ReqCreatureOrGOCount4`,`ReqSpellCast1`,`ReqSpellCast2`,`ReqSpellCast3`,`ReqSpellCast4`,`RewChoiceItemId1`,`RewChoiceItemId2`,`RewChoiceItemId3`,`RewChoiceItemId4`,`RewChoiceItemId5`,`RewChoiceItemId6`,`RewChoiceItemCount1`,`RewChoiceItemCount2`,`RewChoiceItemCount3`,`RewChoiceItemCount4`,`RewChoiceItemCount5`,`RewChoiceItemCount6`,`RewItemId1`,`RewItemId2`,`RewItemId3`,`RewItemId4`,`RewItemCount1`,`RewItemCount2`,`RewItemCount3`,`RewItemCount4`,`RewRepFaction1`,`RewRepFaction2`,`RewRepFaction3`,`RewRepFaction4`,`RewRepFaction5`,`RewRepValue1`,`RewRepValue2`,`RewRepValue3`,`RewRepValue4`,`RewRepValue5`,`RewOrReqMoney`,`RewMoneyMaxLevel`,`RewSpell`,`RewSpellCast`,`RewMailTemplateId`,`RewMailDelaySecs`,`PointMapId`,`PointX`,`PointY`,`PointOpt`,`DetailsEmote1`,`DetailsEmote2`,`DetailsEmote3`,`DetailsEmote4`,`DetailsEmoteDelay1`,`DetailsEmoteDelay2`,`DetailsEmoteDelay3`,`DetailsEmoteDelay4`,`IncompleteEmote`,`CompleteEmote`,`OfferRewardEmote1`,`OfferRewardEmote2`,`OfferRewardEmote3`,`OfferRewardEmote4`,`OfferRewardEmoteDelay1`,`OfferRewardEmoteDelay2`,`OfferRewardEmoteDelay3`,`OfferRewardEmoteDelay4`,`StartScript`,`CompleteScript`) VALUES (8865,0,-366,1,60,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'Festive Lunar Pant Suits','','','Very well then - I accept these coins of ancestry. Please take your pant suit with my blessing. Also, please enjoy these complimentary fireworks.','I am please to inform you that I have a fine selection of festive pant suits available for you to own... but only in trade for coins of ancestry. If fashion is important to you, then these are what you\'re looking for! I assure you that you will not find pant suits like these anywhere else.$B$BIn exchange for some Coins of Ancestry, I will let you choose one of the three styles I have to keep as your own. Is this acceptable to you?',NULL,NULL,NULL,NULL,NULL,21100,0,0,0,5,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,21543,21544,21541,0,0,0,0,0,0,0,0,0,21640,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0);
INSERT INTO `quest_template` (`entry`,`Method`,`ZoneOrSort`,`MinLevel`,`QuestLevel`,`Type`,`RequiredClasses`,`RequiredRaces`,`RequiredSkill`,`RequiredSkillValue`,`RepObjectiveFaction`,`RepObjectiveValue`,`RequiredMinRepFaction`,`RequiredMinRepValue`,`RequiredMaxRepFaction`,`RequiredMaxRepValue`,`SuggestedPlayers`,`LimitTime`,`QuestFlags`,`SpecialFlags`,`PrevQuestId`,`NextQuestId`,`ExclusiveGroup`,`NextQuestInChain`,`SrcItemId`,`SrcItemCount`,`SrcSpell`,`Title`,`Details`,`Objectives`,`OfferRewardText`,`RequestItemsText`,`EndText`,`ObjectiveText1`,`ObjectiveText2`,`ObjectiveText3`,`ObjectiveText4`,`ReqItemId1`,`ReqItemId2`,`ReqItemId3`,`ReqItemId4`,`ReqItemCount1`,`ReqItemCount2`,`ReqItemCount3`,`ReqItemCount4`,`ReqSourceId1`,`ReqSourceId2`,`ReqSourceId3`,`ReqSourceId4`,`ReqSourceCount1`,`ReqSourceCount2`,`ReqSourceCount3`,`ReqSourceCount4`,`ReqCreatureOrGOId1`,`ReqCreatureOrGOId2`,`ReqCreatureOrGOId3`,`ReqCreatureOrGOId4`,`ReqCreatureOrGOCount1`,`ReqCreatureOrGOCount2`,`ReqCreatureOrGOCount3`,`ReqCreatureOrGOCount4`,`ReqSpellCast1`,`ReqSpellCast2`,`ReqSpellCast3`,`ReqSpellCast4`,`RewChoiceItemId1`,`RewChoiceItemId2`,`RewChoiceItemId3`,`RewChoiceItemId4`,`RewChoiceItemId5`,`RewChoiceItemId6`,`RewChoiceItemCount1`,`RewChoiceItemCount2`,`RewChoiceItemCount3`,`RewChoiceItemCount4`,`RewChoiceItemCount5`,`RewChoiceItemCount6`,`RewItemId1`,`RewItemId2`,`RewItemId3`,`RewItemId4`,`RewItemCount1`,`RewItemCount2`,`RewItemCount3`,`RewItemCount4`,`RewRepFaction1`,`RewRepFaction2`,`RewRepFaction3`,`RewRepFaction4`,`RewRepFaction5`,`RewRepValue1`,`RewRepValue2`,`RewRepValue3`,`RewRepValue4`,`RewRepValue5`,`RewOrReqMoney`,`RewMoneyMaxLevel`,`RewSpell`,`RewSpellCast`,`RewMailTemplateId`,`RewMailDelaySecs`,`PointMapId`,`PointX`,`PointY`,`PointOpt`,`DetailsEmote1`,`DetailsEmote2`,`DetailsEmote3`,`DetailsEmote4`,`DetailsEmoteDelay1`,`DetailsEmoteDelay2`,`DetailsEmoteDelay3`,`DetailsEmoteDelay4`,`IncompleteEmote`,`CompleteEmote`,`OfferRewardEmote1`,`OfferRewardEmote2`,`OfferRewardEmote3`,`OfferRewardEmote4`,`OfferRewardEmoteDelay1`,`OfferRewardEmoteDelay2`,`OfferRewardEmoteDelay3`,`OfferRewardEmoteDelay4`,`StartScript`,`CompleteScript`) VALUES (8876,0,-366,25,60,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'Small Rockets','','','Ah, very well. Here are your recipes, $N, and my Elune bless you.','I hold the secrets to creating Lunar Festival rockets, and I am happy to share my knowledge with the honored.$B$BIn exchange for coins of ancestry, I can offer you the recipe to make a small rocket...',NULL,NULL,NULL,NULL,NULL,21100,0,0,0,5,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,21740,21640,0,0,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0);
INSERT INTO `quest_template` (`entry`,`Method`,`ZoneOrSort`,`MinLevel`,`QuestLevel`,`Type`,`RequiredClasses`,`RequiredRaces`,`RequiredSkill`,`RequiredSkillValue`,`RepObjectiveFaction`,`RepObjectiveValue`,`RequiredMinRepFaction`,`RequiredMinRepValue`,`RequiredMaxRepFaction`,`RequiredMaxRepValue`,`SuggestedPlayers`,`LimitTime`,`QuestFlags`,`SpecialFlags`,`PrevQuestId`,`NextQuestId`,`ExclusiveGroup`,`NextQuestInChain`,`SrcItemId`,`SrcItemCount`,`SrcSpell`,`Title`,`Details`,`Objectives`,`OfferRewardText`,`RequestItemsText`,`EndText`,`ObjectiveText1`,`ObjectiveText2`,`ObjectiveText3`,`ObjectiveText4`,`ReqItemId1`,`ReqItemId2`,`ReqItemId3`,`ReqItemId4`,`ReqItemCount1`,`ReqItemCount2`,`ReqItemCount3`,`ReqItemCount4`,`ReqSourceId1`,`ReqSourceId2`,`ReqSourceId3`,`ReqSourceId4`,`ReqSourceCount1`,`ReqSourceCount2`,`ReqSourceCount3`,`ReqSourceCount4`,`ReqCreatureOrGOId1`,`ReqCreatureOrGOId2`,`ReqCreatureOrGOId3`,`ReqCreatureOrGOId4`,`ReqCreatureOrGOCount1`,`ReqCreatureOrGOCount2`,`ReqCreatureOrGOCount3`,`ReqCreatureOrGOCount4`,`ReqSpellCast1`,`ReqSpellCast2`,`ReqSpellCast3`,`ReqSpellCast4`,`RewChoiceItemId1`,`RewChoiceItemId2`,`RewChoiceItemId3`,`RewChoiceItemId4`,`RewChoiceItemId5`,`RewChoiceItemId6`,`RewChoiceItemCount1`,`RewChoiceItemCount2`,`RewChoiceItemCount3`,`RewChoiceItemCount4`,`RewChoiceItemCount5`,`RewChoiceItemCount6`,`RewItemId1`,`RewItemId2`,`RewItemId3`,`RewItemId4`,`RewItemCount1`,`RewItemCount2`,`RewItemCount3`,`RewItemCount4`,`RewRepFaction1`,`RewRepFaction2`,`RewRepFaction3`,`RewRepFaction4`,`RewRepFaction5`,`RewRepValue1`,`RewRepValue2`,`RewRepValue3`,`RewRepValue4`,`RewRepValue5`,`RewOrReqMoney`,`RewMoneyMaxLevel`,`RewSpell`,`RewSpellCast`,`RewMailTemplateId`,`RewMailDelaySecs`,`PointMapId`,`PointX`,`PointY`,`PointOpt`,`DetailsEmote1`,`DetailsEmote2`,`DetailsEmote3`,`DetailsEmote4`,`DetailsEmoteDelay1`,`DetailsEmoteDelay2`,`DetailsEmoteDelay3`,`DetailsEmoteDelay4`,`IncompleteEmote`,`CompleteEmote`,`OfferRewardEmote1`,`OfferRewardEmote2`,`OfferRewardEmote3`,`OfferRewardEmote4`,`OfferRewardEmoteDelay1`,`OfferRewardEmoteDelay2`,`OfferRewardEmoteDelay3`,`OfferRewardEmoteDelay4`,`StartScript`,`CompleteScript`) VALUES (8877,0,-366,45,60,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'Firework Launcher','','','Here you are, $N. Here is the schematic to create a firework launcher. Place launchers where you wish to celebrate, and then welcome your friends to join you!','Although rockets are a wonderful way to celebrate, in order to see their glory... they must be fired from a launcher.$B$BBring me coins of ancestry and I can offer you the knowledge to create rocket launchers like the ones you see in Moonglade.',NULL,NULL,NULL,NULL,NULL,21100,0,0,0,5,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,21738,21640,0,0,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0);
INSERT INTO `quest_template` (`entry`,`Method`,`ZoneOrSort`,`MinLevel`,`QuestLevel`,`Type`,`RequiredClasses`,`RequiredRaces`,`RequiredSkill`,`RequiredSkillValue`,`RepObjectiveFaction`,`RepObjectiveValue`,`RequiredMinRepFaction`,`RequiredMinRepValue`,`RequiredMaxRepFaction`,`RequiredMaxRepValue`,`SuggestedPlayers`,`LimitTime`,`QuestFlags`,`SpecialFlags`,`PrevQuestId`,`NextQuestId`,`ExclusiveGroup`,`NextQuestInChain`,`SrcItemId`,`SrcItemCount`,`SrcSpell`,`Title`,`Details`,`Objectives`,`OfferRewardText`,`RequestItemsText`,`EndText`,`ObjectiveText1`,`ObjectiveText2`,`ObjectiveText3`,`ObjectiveText4`,`ReqItemId1`,`ReqItemId2`,`ReqItemId3`,`ReqItemId4`,`ReqItemCount1`,`ReqItemCount2`,`ReqItemCount3`,`ReqItemCount4`,`ReqSourceId1`,`ReqSourceId2`,`ReqSourceId3`,`ReqSourceId4`,`ReqSourceCount1`,`ReqSourceCount2`,`ReqSourceCount3`,`ReqSourceCount4`,`ReqCreatureOrGOId1`,`ReqCreatureOrGOId2`,`ReqCreatureOrGOId3`,`ReqCreatureOrGOId4`,`ReqCreatureOrGOCount1`,`ReqCreatureOrGOCount2`,`ReqCreatureOrGOCount3`,`ReqCreatureOrGOCount4`,`ReqSpellCast1`,`ReqSpellCast2`,`ReqSpellCast3`,`ReqSpellCast4`,`RewChoiceItemId1`,`RewChoiceItemId2`,`RewChoiceItemId3`,`RewChoiceItemId4`,`RewChoiceItemId5`,`RewChoiceItemId6`,`RewChoiceItemCount1`,`RewChoiceItemCount2`,`RewChoiceItemCount3`,`RewChoiceItemCount4`,`RewChoiceItemCount5`,`RewChoiceItemCount6`,`RewItemId1`,`RewItemId2`,`RewItemId3`,`RewItemId4`,`RewItemCount1`,`RewItemCount2`,`RewItemCount3`,`RewItemCount4`,`RewRepFaction1`,`RewRepFaction2`,`RewRepFaction3`,`RewRepFaction4`,`RewRepFaction5`,`RewRepValue1`,`RewRepValue2`,`RewRepValue3`,`RewRepValue4`,`RewRepValue5`,`RewOrReqMoney`,`RewMoneyMaxLevel`,`RewSpell`,`RewSpellCast`,`RewMailTemplateId`,`RewMailDelaySecs`,`PointMapId`,`PointX`,`PointY`,`PointOpt`,`DetailsEmote1`,`DetailsEmote2`,`DetailsEmote3`,`DetailsEmote4`,`DetailsEmoteDelay1`,`DetailsEmoteDelay2`,`DetailsEmoteDelay3`,`DetailsEmoteDelay4`,`IncompleteEmote`,`CompleteEmote`,`OfferRewardEmote1`,`OfferRewardEmote2`,`OfferRewardEmote3`,`OfferRewardEmote4`,`OfferRewardEmoteDelay1`,`OfferRewardEmoteDelay2`,`OfferRewardEmoteDelay3`,`OfferRewardEmoteDelay4`,`StartScript`,`CompleteScript`) VALUES (8878,0,-366,50,60,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'Festive Recipes','','','Here are the patterns, $N.  I am sure you will find the product of this knowledge quite beautiful.','The dresses and pant suits you see are traditional clothes from many years past.  They are worn in honor of old ways and loved ones gone. If you bring me coins of ancestry, $N, then I will give you the pattern to create traditional red dresses or suits.',NULL,NULL,NULL,NULL,NULL,21100,0,0,0,5,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,21722,21723,0,0,0,0,0,0,0,0,0,0,21640,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0);
INSERT INTO `quest_template` (`entry`,`Method`,`ZoneOrSort`,`MinLevel`,`QuestLevel`,`Type`,`RequiredClasses`,`RequiredRaces`,`RequiredSkill`,`RequiredSkillValue`,`RepObjectiveFaction`,`RepObjectiveValue`,`RequiredMinRepFaction`,`RequiredMinRepValue`,`RequiredMaxRepFaction`,`RequiredMaxRepValue`,`SuggestedPlayers`,`LimitTime`,`QuestFlags`,`SpecialFlags`,`PrevQuestId`,`NextQuestId`,`ExclusiveGroup`,`NextQuestInChain`,`SrcItemId`,`SrcItemCount`,`SrcSpell`,`Title`,`Details`,`Objectives`,`OfferRewardText`,`RequestItemsText`,`EndText`,`ObjectiveText1`,`ObjectiveText2`,`ObjectiveText3`,`ObjectiveText4`,`ReqItemId1`,`ReqItemId2`,`ReqItemId3`,`ReqItemId4`,`ReqItemCount1`,`ReqItemCount2`,`ReqItemCount3`,`ReqItemCount4`,`ReqSourceId1`,`ReqSourceId2`,`ReqSourceId3`,`ReqSourceId4`,`ReqSourceCount1`,`ReqSourceCount2`,`ReqSourceCount3`,`ReqSourceCount4`,`ReqCreatureOrGOId1`,`ReqCreatureOrGOId2`,`ReqCreatureOrGOId3`,`ReqCreatureOrGOId4`,`ReqCreatureOrGOCount1`,`ReqCreatureOrGOCount2`,`ReqCreatureOrGOCount3`,`ReqCreatureOrGOCount4`,`ReqSpellCast1`,`ReqSpellCast2`,`ReqSpellCast3`,`ReqSpellCast4`,`RewChoiceItemId1`,`RewChoiceItemId2`,`RewChoiceItemId3`,`RewChoiceItemId4`,`RewChoiceItemId5`,`RewChoiceItemId6`,`RewChoiceItemCount1`,`RewChoiceItemCount2`,`RewChoiceItemCount3`,`RewChoiceItemCount4`,`RewChoiceItemCount5`,`RewChoiceItemCount6`,`RewItemId1`,`RewItemId2`,`RewItemId3`,`RewItemId4`,`RewItemCount1`,`RewItemCount2`,`RewItemCount3`,`RewItemCount4`,`RewRepFaction1`,`RewRepFaction2`,`RewRepFaction3`,`RewRepFaction4`,`RewRepFaction5`,`RewRepValue1`,`RewRepValue2`,`RewRepValue3`,`RewRepValue4`,`RewRepValue5`,`RewOrReqMoney`,`RewMoneyMaxLevel`,`RewSpell`,`RewSpellCast`,`RewMailTemplateId`,`RewMailDelaySecs`,`PointMapId`,`PointX`,`PointY`,`PointOpt`,`DetailsEmote1`,`DetailsEmote2`,`DetailsEmote3`,`DetailsEmote4`,`DetailsEmoteDelay1`,`DetailsEmoteDelay2`,`DetailsEmoteDelay3`,`DetailsEmoteDelay4`,`IncompleteEmote`,`CompleteEmote`,`OfferRewardEmote1`,`OfferRewardEmote2`,`OfferRewardEmote3`,`OfferRewardEmote4`,`OfferRewardEmoteDelay1`,`OfferRewardEmoteDelay2`,`OfferRewardEmoteDelay3`,`OfferRewardEmoteDelay4`,`StartScript`,`CompleteScript`) VALUES (8879,0,-366,35,60,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'Large Rockets','','','Very well - I accept these coins of ancestry. Here are your recipes, $N. May you use them to spread Elune\'s glory!','Large Festival rockets light up the sky brilliantly - only the cluster rockets rival their magnificence!$B$BBring me coins of ancestry, $N, and I shall share the knowledge of their creation.',NULL,NULL,NULL,NULL,NULL,21100,0,0,0,5,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,21742,21640,0,0,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0);
INSERT INTO `quest_template` (`entry`,`Method`,`ZoneOrSort`,`MinLevel`,`QuestLevel`,`Type`,`RequiredClasses`,`RequiredRaces`,`RequiredSkill`,`RequiredSkillValue`,`RepObjectiveFaction`,`RepObjectiveValue`,`RequiredMinRepFaction`,`RequiredMinRepValue`,`RequiredMaxRepFaction`,`RequiredMaxRepValue`,`SuggestedPlayers`,`LimitTime`,`QuestFlags`,`SpecialFlags`,`PrevQuestId`,`NextQuestId`,`ExclusiveGroup`,`NextQuestInChain`,`SrcItemId`,`SrcItemCount`,`SrcSpell`,`Title`,`Details`,`Objectives`,`OfferRewardText`,`RequestItemsText`,`EndText`,`ObjectiveText1`,`ObjectiveText2`,`ObjectiveText3`,`ObjectiveText4`,`ReqItemId1`,`ReqItemId2`,`ReqItemId3`,`ReqItemId4`,`ReqItemCount1`,`ReqItemCount2`,`ReqItemCount3`,`ReqItemCount4`,`ReqSourceId1`,`ReqSourceId2`,`ReqSourceId3`,`ReqSourceId4`,`ReqSourceCount1`,`ReqSourceCount2`,`ReqSourceCount3`,`ReqSourceCount4`,`ReqCreatureOrGOId1`,`ReqCreatureOrGOId2`,`ReqCreatureOrGOId3`,`ReqCreatureOrGOId4`,`ReqCreatureOrGOCount1`,`ReqCreatureOrGOCount2`,`ReqCreatureOrGOCount3`,`ReqCreatureOrGOCount4`,`ReqSpellCast1`,`ReqSpellCast2`,`ReqSpellCast3`,`ReqSpellCast4`,`RewChoiceItemId1`,`RewChoiceItemId2`,`RewChoiceItemId3`,`RewChoiceItemId4`,`RewChoiceItemId5`,`RewChoiceItemId6`,`RewChoiceItemCount1`,`RewChoiceItemCount2`,`RewChoiceItemCount3`,`RewChoiceItemCount4`,`RewChoiceItemCount5`,`RewChoiceItemCount6`,`RewItemId1`,`RewItemId2`,`RewItemId3`,`RewItemId4`,`RewItemCount1`,`RewItemCount2`,`RewItemCount3`,`RewItemCount4`,`RewRepFaction1`,`RewRepFaction2`,`RewRepFaction3`,`RewRepFaction4`,`RewRepFaction5`,`RewRepValue1`,`RewRepValue2`,`RewRepValue3`,`RewRepValue4`,`RewRepValue5`,`RewOrReqMoney`,`RewMoneyMaxLevel`,`RewSpell`,`RewSpellCast`,`RewMailTemplateId`,`RewMailDelaySecs`,`PointMapId`,`PointX`,`PointY`,`PointOpt`,`DetailsEmote1`,`DetailsEmote2`,`DetailsEmote3`,`DetailsEmote4`,`DetailsEmoteDelay1`,`DetailsEmoteDelay2`,`DetailsEmoteDelay3`,`DetailsEmoteDelay4`,`IncompleteEmote`,`CompleteEmote`,`OfferRewardEmote1`,`OfferRewardEmote2`,`OfferRewardEmote3`,`OfferRewardEmote4`,`OfferRewardEmoteDelay1`,`OfferRewardEmoteDelay2`,`OfferRewardEmoteDelay3`,`OfferRewardEmoteDelay4`,`StartScript`,`CompleteScript`) VALUES (8880,0,-366,35,60,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'Cluster Rockets','','','Here you are, $N.  Take these recipes and learn their secrets.  I bid you fortune, and I look forward to seeing your magnificent creations.','Cluster rockets are a collection of individual rockets, and their beauty is awesome!  Bring me coins of ancestry and I will share the knowledge of their creation to you...',NULL,NULL,NULL,NULL,NULL,21100,0,0,0,5,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,21741,21640,0,0,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0);
INSERT INTO `quest_template` (`entry`,`Method`,`ZoneOrSort`,`MinLevel`,`QuestLevel`,`Type`,`RequiredClasses`,`RequiredRaces`,`RequiredSkill`,`RequiredSkillValue`,`RepObjectiveFaction`,`RepObjectiveValue`,`RequiredMinRepFaction`,`RequiredMinRepValue`,`RequiredMaxRepFaction`,`RequiredMaxRepValue`,`SuggestedPlayers`,`LimitTime`,`QuestFlags`,`SpecialFlags`,`PrevQuestId`,`NextQuestId`,`ExclusiveGroup`,`NextQuestInChain`,`SrcItemId`,`SrcItemCount`,`SrcSpell`,`Title`,`Details`,`Objectives`,`OfferRewardText`,`RequestItemsText`,`EndText`,`ObjectiveText1`,`ObjectiveText2`,`ObjectiveText3`,`ObjectiveText4`,`ReqItemId1`,`ReqItemId2`,`ReqItemId3`,`ReqItemId4`,`ReqItemCount1`,`ReqItemCount2`,`ReqItemCount3`,`ReqItemCount4`,`ReqSourceId1`,`ReqSourceId2`,`ReqSourceId3`,`ReqSourceId4`,`ReqSourceCount1`,`ReqSourceCount2`,`ReqSourceCount3`,`ReqSourceCount4`,`ReqCreatureOrGOId1`,`ReqCreatureOrGOId2`,`ReqCreatureOrGOId3`,`ReqCreatureOrGOId4`,`ReqCreatureOrGOCount1`,`ReqCreatureOrGOCount2`,`ReqCreatureOrGOCount3`,`ReqCreatureOrGOCount4`,`ReqSpellCast1`,`ReqSpellCast2`,`ReqSpellCast3`,`ReqSpellCast4`,`RewChoiceItemId1`,`RewChoiceItemId2`,`RewChoiceItemId3`,`RewChoiceItemId4`,`RewChoiceItemId5`,`RewChoiceItemId6`,`RewChoiceItemCount1`,`RewChoiceItemCount2`,`RewChoiceItemCount3`,`RewChoiceItemCount4`,`RewChoiceItemCount5`,`RewChoiceItemCount6`,`RewItemId1`,`RewItemId2`,`RewItemId3`,`RewItemId4`,`RewItemCount1`,`RewItemCount2`,`RewItemCount3`,`RewItemCount4`,`RewRepFaction1`,`RewRepFaction2`,`RewRepFaction3`,`RewRepFaction4`,`RewRepFaction5`,`RewRepValue1`,`RewRepValue2`,`RewRepValue3`,`RewRepValue4`,`RewRepValue5`,`RewOrReqMoney`,`RewMoneyMaxLevel`,`RewSpell`,`RewSpellCast`,`RewMailTemplateId`,`RewMailDelaySecs`,`PointMapId`,`PointX`,`PointY`,`PointOpt`,`DetailsEmote1`,`DetailsEmote2`,`DetailsEmote3`,`DetailsEmote4`,`DetailsEmoteDelay1`,`DetailsEmoteDelay2`,`DetailsEmoteDelay3`,`DetailsEmoteDelay4`,`IncompleteEmote`,`CompleteEmote`,`OfferRewardEmote1`,`OfferRewardEmote2`,`OfferRewardEmote3`,`OfferRewardEmote4`,`OfferRewardEmoteDelay1`,`OfferRewardEmoteDelay2`,`OfferRewardEmoteDelay3`,`OfferRewardEmoteDelay4`,`StartScript`,`CompleteScript`) VALUES (8881,0,-366,55,60,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'Large Cluster Rockets','','','Thank you, $N.  Here is the recipe for large cluster rockets.  May your products bring joy and luck to all those who gaze up them.','Large cluster rockets require vast resources and skill to create, but their brilliance and beauty is worth that effort!  Bring me coins of ancestry and I will grant you the knowledge of their crafting.',NULL,NULL,NULL,NULL,NULL,21100,0,0,0,5,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,21743,21640,0,0,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0);
INSERT INTO `quest_template` (`entry`,`Method`,`ZoneOrSort`,`MinLevel`,`QuestLevel`,`Type`,`RequiredClasses`,`RequiredRaces`,`RequiredSkill`,`RequiredSkillValue`,`RepObjectiveFaction`,`RepObjectiveValue`,`RequiredMinRepFaction`,`RequiredMinRepValue`,`RequiredMaxRepFaction`,`RequiredMaxRepValue`,`SuggestedPlayers`,`LimitTime`,`QuestFlags`,`SpecialFlags`,`PrevQuestId`,`NextQuestId`,`ExclusiveGroup`,`NextQuestInChain`,`SrcItemId`,`SrcItemCount`,`SrcSpell`,`Title`,`Details`,`Objectives`,`OfferRewardText`,`RequestItemsText`,`EndText`,`ObjectiveText1`,`ObjectiveText2`,`ObjectiveText3`,`ObjectiveText4`,`ReqItemId1`,`ReqItemId2`,`ReqItemId3`,`ReqItemId4`,`ReqItemCount1`,`ReqItemCount2`,`ReqItemCount3`,`ReqItemCount4`,`ReqSourceId1`,`ReqSourceId2`,`ReqSourceId3`,`ReqSourceId4`,`ReqSourceCount1`,`ReqSourceCount2`,`ReqSourceCount3`,`ReqSourceCount4`,`ReqCreatureOrGOId1`,`ReqCreatureOrGOId2`,`ReqCreatureOrGOId3`,`ReqCreatureOrGOId4`,`ReqCreatureOrGOCount1`,`ReqCreatureOrGOCount2`,`ReqCreatureOrGOCount3`,`ReqCreatureOrGOCount4`,`ReqSpellCast1`,`ReqSpellCast2`,`ReqSpellCast3`,`ReqSpellCast4`,`RewChoiceItemId1`,`RewChoiceItemId2`,`RewChoiceItemId3`,`RewChoiceItemId4`,`RewChoiceItemId5`,`RewChoiceItemId6`,`RewChoiceItemCount1`,`RewChoiceItemCount2`,`RewChoiceItemCount3`,`RewChoiceItemCount4`,`RewChoiceItemCount5`,`RewChoiceItemCount6`,`RewItemId1`,`RewItemId2`,`RewItemId3`,`RewItemId4`,`RewItemCount1`,`RewItemCount2`,`RewItemCount3`,`RewItemCount4`,`RewRepFaction1`,`RewRepFaction2`,`RewRepFaction3`,`RewRepFaction4`,`RewRepFaction5`,`RewRepValue1`,`RewRepValue2`,`RewRepValue3`,`RewRepValue4`,`RewRepValue5`,`RewOrReqMoney`,`RewMoneyMaxLevel`,`RewSpell`,`RewSpellCast`,`RewMailTemplateId`,`RewMailDelaySecs`,`PointMapId`,`PointX`,`PointY`,`PointOpt`,`DetailsEmote1`,`DetailsEmote2`,`DetailsEmote3`,`DetailsEmote4`,`DetailsEmoteDelay1`,`DetailsEmoteDelay2`,`DetailsEmoteDelay3`,`DetailsEmoteDelay4`,`IncompleteEmote`,`CompleteEmote`,`OfferRewardEmote1`,`OfferRewardEmote2`,`OfferRewardEmote3`,`OfferRewardEmote4`,`OfferRewardEmoteDelay1`,`OfferRewardEmoteDelay2`,`OfferRewardEmoteDelay3`,`OfferRewardEmoteDelay4`,`StartScript`,`CompleteScript`) VALUES (8882,0,-366,55,60,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'Cluster Launcher','','','Here is your schematic.  Study it closely, and learn...','The most splendid fireworks shows must include cluster rockets, and those cluster rockets must be fired from cluster launchers! Is it not then logical for you to learn the secrets of making cluster launchers? Bring me coins of ancestry and I will give this knowledge to you.',NULL,NULL,NULL,NULL,NULL,21100,0,0,0,5,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,21737,21640,0,0,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0);
 
 
/* 
* 20170207135652_world.sql 
*/ 
INSERT INTO `migrations` VALUES ('20170207135652');

INSERT INTO `gameobject` (`guid`,`id`,`map`,`position_x`,`position_y`,`position_z`,`orientation`,`rotation0`,`rotation1`,`rotation2`,`rotation3`,`spawntimesecs`,`animprogress`,`state`,`spawnFlags`) VALUES (3998422,300058,1,7610.9,-2229.02,468.667,1.53044,0,0,0.692694,0.721231,25,100,1,0);
INSERT INTO `gameobject` (`guid`,`id`,`map`,`position_x`,`position_y`,`position_z`,`orientation`,`rotation0`,`rotation1`,`rotation2`,`rotation3`,`spawntimesecs`,`animprogress`,`state`,`spawnFlags`) VALUES (3998423,300058,1,7603.61,-2211.24,471.655,1.83281,0,0,0.79342,0.608675,25,100,1,0);
INSERT INTO `gameobject` (`guid`,`id`,`map`,`position_x`,`position_y`,`position_z`,`orientation`,`rotation0`,`rotation1`,`rotation2`,`rotation3`,`spawntimesecs`,`animprogress`,`state`,`spawnFlags`) VALUES (3998424,300058,1,7585.07,-2205.29,475.272,3.32743,0,0,0.995686,-0.0927842,25,100,1,0);
INSERT INTO `gameobject` (`guid`,`id`,`map`,`position_x`,`position_y`,`position_z`,`orientation`,`rotation0`,`rotation1`,`rotation2`,`rotation3`,`spawntimesecs`,`animprogress`,`state`,`spawnFlags`) VALUES (3998425,300058,1,7570.18,-2220.54,473.481,4.10261,0,0,0.886759,-0.462232,25,100,1,0);
INSERT INTO `gameobject` (`guid`,`id`,`map`,`position_x`,`position_y`,`position_z`,`orientation`,`rotation0`,`rotation1`,`rotation2`,`rotation3`,`spawntimesecs`,`animprogress`,`state`,`spawnFlags`) VALUES (3998426,300058,1,7575.1,-2238.81,469.792,5.32706,0,0,0.46006,-0.887888,25,100,1,0);
INSERT INTO `gameobject` (`guid`,`id`,`map`,`position_x`,`position_y`,`position_z`,`orientation`,`rotation0`,`rotation1`,`rotation2`,`rotation3`,`spawntimesecs`,`animprogress`,`state`,`spawnFlags`) VALUES (3998427,300058,1,7595.28,-2247.1,466.833,6.02448,0,0,0.128991,-0.991646,25,100,1,0);
 
 
/* 
* 20170207135823_world.sql 
*/ 
INSERT INTO `migrations` VALUES ('20170207135823');

UPDATE `item_template` SET `spellcharges_1`='0' WHERE `entry`='21711';
 
 
/* 
* 20170207140105_world.sql 
*/ 
INSERT INTO `migrations` VALUES ('20170207140105'); 

-- Herod
UPDATE `gameobject_template` SET `ScriptName` = 'go_herod_lever' WHERE `entry` = 101855;
 
 
/* 
* 20170207185713_world.sql 
*/ 
INSERT INTO `migrations` VALUES ('20170207185713'); 

-- Lunar Festival: Fireworks
UPDATE `game_event` SET `start_time` = '2017-02-08 01:00:00', `end_time` = '2027-01-08 01:00:00', `length` = 20160 WHERE `entry` = 7;
UPDATE `game_event` SET `length` = 10, `description` = 'Fireworks', `hardcoded` = 1 WHERE `entry` = 6;
REPLACE INTO `game_event` VALUES (76, '2017-02-21 18:00:00', '2027-01-08 01:00:00', 525600, 380, 0, 'Lunar Festival: Fireworks', 0, 0);

REPLACE INTO `creature` VALUES
( 70044, '20114', '1', '0', '0', '7623.24', '-2455.68', '456.981', '3.84729', '25', '5', '0', '64', '0', '0', '0', '0' ),
( 70045, '20114', '1', '0', '0', '7563.56', '-2585.86', '455.312', '1.0002', '25', '5', '0', '64', '0', '0', '0', '0' ),
( 70046, '20114', '1', '0', '0', '7533.86', '-2742.04', '455.329', '0.250142', '25', '5', '0', '64', '0', '0', '0', '0' ),
( 70047, '20114', '1', '0', '0', '7633.41', '-2774.23', '454.428', '3.61557', '25', '5', '0', '64', '0', '0', '0', '0' ),
( 70048, '20114', '1', '0', '0', '7806.85', '-2742.91', '455.237', '5.19422', '25', '5', '0', '64', '0', '0', '0', '0' ),
( 70049, '20114', '1', '0', '0', '7721.71', '-2578.8', '457.983', '3.9533', '25', '5', '0', '64', '0', '0', '0', '0' ),
( 70050, '20114', '1', '0', '0', '7703.75', '-2365.55', '457.354', '4.58556', '25', '5', '0', '64', '0', '0', '0', '0' ),
( 70051, '20114', '0', '0', '0', '-14437.2', '482.042', '31.0667', '5.86969', '25', '5', '0', '64', '0', '0', '0', '0' ),
( 70052, '20114', '0', '0', '0', '-14294.5', '554.777', '8.73363', '2.51993', '25', '5', '0', '64', '0', '0', '0', '0' );

REPLACE INTO `game_event_creature` VALUES
( 70044, 6 ),
( 70045, 6 ),
( 70046, 6 ),
( 70047, 6 ),
( 70048, 6 ),
( 70049, 6 ),
( 70050, 6 ),
( 70051, 6 ),
( 70052, 6 );
 
 
/* 
* 20170207202921_world.sql 
*/ 
INSERT INTO `migrations` VALUES ('20170207202921'); 

-- Lunar Festival
REPLACE INTO `creature_questrelation` VALUES
( '15864', '8862' ),
( '15864', '8863' ),
( '15864', '8864' ),
( '15864', '8865' ),
( '15909', '8876' ),
( '15909', '8877' ),
( '15909', '8878' ),
( '15909', '8879' ),
( '15909', '8880' ),
( '15909', '8881' ),
( '15909', '8882' );

REPLACE INTO `creature_involvedrelation` VALUES
( '15864', '8862' ),
( '15864', '8863' ),
( '15864', '8864' ),
( '15864', '8865' ),
( '15909', '8876' ),
( '15909', '8877' ),
( '15909', '8878' ),
( '15909', '8879' ),
( '15909', '8880' ),
( '15909', '8881' ),
( '15909', '8882' );
 
 
/* 
* 20170208044858_logs.sql 
*/ 
INSERT INTO `migrations` VALUES ('20170208044858'); 

DROP TABLE IF EXISTS `logs_spamdetects`;
DROP TABLE IF EXISTS `logs_spamdetect`;
CREATE TABLE `logs_spamdetect` (
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `accountId` int(11) DEFAULT '0',
  `guid` int(11) NOT NULL DEFAULT '0',
  `message` varchar(255) NOT NULL DEFAULT '',
  `reason` varchar(255) NOT NULL DEFAULT '',
  KEY `guid` (`guid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8; 
 
/* 
* 20170221220346_world.sql 
*/ 
INSERT INTO `migrations` VALUES ('20170221220346');

-- Update Merithra's faction
UPDATE `creature_template` SET `faction_A` = 35, `faction_H` = 35 WHERE `entry` = 15378;
-- Update Caelastrasz faction
UPDATE `creature_template` SET `faction_A` = 35, `faction_H` = 35 WHERE `entry` = 15379;
-- Update Arygos faction
UPDATE `creature_template` SET `faction_A` = 35, `faction_H` = 35 WHERE `entry` = 15380;

-- Add equipment for Kaldorei Infantry
INSERT INTO `creature_equip_template_raw` VALUES
(818,   8377,   8377,   0,  33488898,   33488898,   0,  1037,   1037,   0);
-- Link Kaldorei equipment
UPDATE `creature_template` SET `equipment_id` = 818 WHERE `entry` = 15423;

 
 
/* 
* 20170226104406_world.sql 
*/ 
INSERT INTO `migrations` VALUES ('20170226104406');

UPDATE `script_texts` SET `content_default` = "Aye, Fandral, remember these words: Let not your grief guide your faith. These thoughts you hold... dark places you go, night elf. Absolution cannot be had through misguided vengeance." WHERE `entry` = -1000757;
UPDATE `script_texts` SET `content_default` = "We will push him back, Anachronos. This I vow. Uphold your end of this task. Let not your hands falter as you seal our fates behind the barrier." WHERE `entry` = -1000759;
UPDATE `script_texts` SET `content_default` = "NOW, STAGHELM! WE GO NOW! Prepare your magic!" WHERE `entry` = -1000765;
 
 
/* 
* 20170226133612_world.sql 
*/ 
INSERT INTO `migrations` VALUES ('20170226133612');

-- Make Fandral throw scepter at Gate
INSERT INTO `spell_target_position` (`id`, `target_map`, `target_position_x`, `target_position_y`, `target_position_z`, `target_orientation`) VALUES
(25182, 1,  -8133.34,   1525.13,    17.1904,    0);
 
 
/* 
* 20170302175053_world.sql 
*/ 
INSERT INTO `migrations` VALUES ('20170302175053'); 

UPDATE `quest_template` SET `MinLevel` = 20 WHERE `entry` IN (8794, 8793, 8792, 8795); 
 
/* 
* 20170304164208_world.sql 
*/ 
INSERT INTO `migrations` VALUES ('20170304164208'); 

-- Add questgiver flag
UPDATE `creature_template` SET `npcflag` = 3 WHERE `entry` IN (15737, 15736); 
 
/* 
* 20170307094939_world.sql 
*/ 
INSERT INTO `migrations` VALUES ('20170307094939'); 

UPDATE gameobject_template SET `type`=10, `data3`=0, `data19`=6799, `flags` = 0 WHERE `entry`=180794;
 
 
/* 
* 20170307135853_world.sql 
*/ 
INSERT INTO `migrations` VALUES ('20170307135853'); 
-- FIX for horde commendation officers, where questrelation and involverelation questid mismatch

-- Undercity Commendation Officer
UPDATE `creature_questrelation` SET `quest`='8832' WHERE `id`='15738' and`quest`='8816';
UPDATE `creature_questrelation` SET `quest`='8833' WHERE `id`='15738' and`quest`='8824';

-- Darkspear Commendation Officer
UPDATE `creature_questrelation` SET `quest`='8844' WHERE `id`='15737' and`quest`='8818';
UPDATE `creature_questrelation` SET `quest`='8845' WHERE `id`='15737' and`quest`='8826';

-- Ogrimmar Commendation Officer
UPDATE `creature_questrelation` SET `quest`='8840' WHERE `id`='15736' and`quest`='8815';
UPDATE `creature_questrelation` SET `quest`='8841' WHERE `id`='15736' and`quest`='8823';

-- Thunder Bluff Commendation Officer
UPDATE `creature_questrelation` SET `quest`='8842' WHERE `id`='15739' and`quest`='8817';
UPDATE `creature_questrelation` SET `quest`='8843' WHERE `id`='15739' and`quest`='8825';
 
 
/* 
* 20170312073355_world.sql 
*/ 
INSERT INTO `migrations` VALUES ('20170312073355'); 
-- FIX for Extinguishing the Idol quest, where involvedrelation entry is missing for brazier

-- Allow quest to be turned in to Belnistrasz's Brazier
INSERT INTO `gameobject_involvedrelation` VALUES ('152097','3525');
 
 
/* 
* 20170313144200_world.sql 
*/ 
INSERT INTO `migrations` VALUES ('20170313144200');

-- Change damage school from frost to nature on Noxxion
UPDATE `creature_template` SET `dmgschool` = 3 WHERE `entry` = 13282 LIMIT 1;

-- Change damage school from frost to nature on Noxxion's Spawn
UPDATE `creature_template` SET `dmgschool` = 3 WHERE `entry` = 13456 LIMIT 1;
 
 
/* 
* 20170314031050_world.sql 
*/ 
INSERT INTO `migrations` VALUES ('20170314031050');

-- Make quest Compendium of the Fallen unavailable to Undead
UPDATE `quest_template` SET `RequiredRaces`=162 WHERE `entry`=1049;
 
 
/* 
* 20170314223700_world.sql 
*/ 
INSERT INTO `migrations` VALUES ('20170314223700');

-- Replace bugged/abusive ACTIVE Thrash spell with non-abusive PASSIVE one. Should affect 91 rows, these rows to be exact (http://pastebin.com/ySv3Ynzq)
Update creature_template SET spell1 = 3417 where spell1 = 3391;
Update creature_template SET spell2 = 3417 where spell2 = 3391;
Update creature_template SET spell3 = 3417 where spell3 = 3391;
Update creature_template SET spell4 = 3417 where spell4 = 3391; 
 
/* 
* 20170314223800_world.sql 
*/ 
INSERT INTO `migrations` VALUES ('20170314223800');

-- Fix Thanthaldis Snowgleam to be more like he was in retail, added missing spells, corrected hp and damage. Source video https://www.youtube.com/watch?v=cQ3gkWbnNnM 
REPLACE INTO `creature_template` (`entry`, `KillCredit1`, `KillCredit2`, `modelid_1`, `modelid_2`, `modelid_3`, `modelid_4`, `name`, `subname`, `gossip_menu_id`, `minlevel`, `maxlevel`, `minhealth`, `maxhealth`, `minmana`, `maxmana`, `armor`, `faction_A`, `faction_H`, `npcflag`, `speed_walk`, `speed_run`, `scale`, `rank`, `mindmg`, `maxdmg`, `dmgschool`, `attackpower`, `dmg_multiplier`, `baseattacktime`, `rangeattacktime`, `unit_class`, `unit_flags`, `dynamicflags`, `family`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `minrangedmg`, `maxrangedmg`, `rangedattackpower`, `type`, `type_flags`, `lootid`, `pickpocketloot`, `skinloot`, `resistance1`, `resistance2`, `resistance3`, `resistance4`, `resistance5`, `resistance6`, `spell1`, `spell2`, `spell3`, `spell4`, `PetSpellDataId`, `mingold`, `maxgold`, `AIName`, `MovementType`, `InhabitType`, `Civilian`, `RacialLeader`, `RegenHealth`, `equipment_id`, `trainer_id`, `vendor_id`, `MechanicImmuneMask`, `SchoolImmuneMask`, `flags_extra`, `ScriptName`) VALUES (13217, 0, 0, 13319, 0, 0, 0, 'Thanthaldis Snowgleam', 'Stormpike Supply Officer', 0, 58, 58, 41595, 41595, 0, 0, 3408, 1334, 1334, 16388, 1.05, 1.14286, 0, 1, 1413, 1705, 0, 302, 1, 2100, 2000, 1, 4160, 0, 0, 0, 0, 0, 0, 60.784, 83.578, 100, 7, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3417, 19642, 19644, 0, 0, 0, 0, 'EventAI', 0, 3, 0, 0, 1, 1149, 0, 0, 0, 0, 0, '');

-- Fix for Lieutenant Haggerdin, added missing spells, corrected hp and damage.
REPLACE INTO `creature_template` (`entry`, `KillCredit1`, `KillCredit2`, `modelid_1`, `modelid_2`, `modelid_3`, `modelid_4`, `name`, `subname`, `gossip_menu_id`, `minlevel`, `maxlevel`, `minhealth`, `maxhealth`, `minmana`, `maxmana`, `armor`, `faction_A`, `faction_H`, `npcflag`, `speed_walk`, `speed_run`, `scale`, `rank`, `mindmg`, `maxdmg`, `dmgschool`, `attackpower`, `dmg_multiplier`, `baseattacktime`, `rangeattacktime`, `unit_class`, `unit_flags`, `dynamicflags`, `family`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `minrangedmg`, `maxrangedmg`, `rangedattackpower`, `type`, `type_flags`, `lootid`, `pickpocketloot`, `skinloot`, `resistance1`, `resistance2`, `resistance3`, `resistance4`, `resistance5`, `resistance6`, `spell1`, `spell2`, `spell3`, `spell4`, `PetSpellDataId`, `mingold`, `maxgold`, `AIName`, `MovementType`, `InhabitType`, `Civilian`, `RacialLeader`, `RegenHealth`, `equipment_id`, `trainer_id`, `vendor_id`, `MechanicImmuneMask`, `SchoolImmuneMask`, `flags_extra`, `ScriptName`) VALUES (13841, 0, 0, 13841, 0, 0, 0, 'Lieutenant Haggerdin', NULL, 5442, 61, 61, 44296, 44296, 0, 0, 4091, 1334, 1334, 3, 1.05, 1.14286, 0, 1, 1363, 1696, 0, 278, 1, 2000, 2000, 1, 4160, 0, 0, 0, 0, 0, 0, 172.1, 240.07, 100, 7, 8, 13841, 0, 0, 0, 5, 5, 5, 5, 5, 19130, 12169, 0, 0, 0, 458, 603, 'EventAI', 0, 3, 0, 0, 1, 2061, 0, 0, 0, 0, 0, '');

-- Fix for Stormpike Battleguards, added missing spells, corrected hp and damage.
REPLACE INTO `creature_template` (`entry`, `KillCredit1`, `KillCredit2`, `modelid_1`, `modelid_2`, `modelid_3`, `modelid_4`, `name`, `subname`, `gossip_menu_id`, `minlevel`, `maxlevel`, `minhealth`, `maxhealth`, `minmana`, `maxmana`, `armor`, `faction_A`, `faction_H`, `npcflag`, `speed_walk`, `speed_run`, `scale`, `rank`, `mindmg`, `maxdmg`, `dmgschool`, `attackpower`, `dmg_multiplier`, `baseattacktime`, `rangeattacktime`, `unit_class`, `unit_flags`, `dynamicflags`, `family`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `minrangedmg`, `maxrangedmg`, `rangedattackpower`, `type`, `type_flags`, `lootid`, `pickpocketloot`, `skinloot`, `resistance1`, `resistance2`, `resistance3`, `resistance4`, `resistance5`, `resistance6`, `spell1`, `spell2`, `spell3`, `spell4`, `PetSpellDataId`, `mingold`, `maxgold`, `AIName`, `MovementType`, `InhabitType`, `Civilian`, `RacialLeader`, `RegenHealth`, `equipment_id`, `trainer_id`, `vendor_id`, `MechanicImmuneMask`, `SchoolImmuneMask`, `flags_extra`, `ScriptName`) VALUES (14284, 0, 0, 14322, 14324, 14326, 14327, 'Stormpike Battleguard', NULL, 0, 61, 61, 16638, 16638, 0, 0, 3489, 11, 11, 0, 1.05, 1.14286, 0, 1, 832, 991, 0, 268, 1, 2000, 2000, 1, 0, 0, 0, 0, 0, 0, 0, 172, 240, 100, 7, 8, 14284, 0, 0, 0, 0, 0, 0, 0, 0, 22120, 3248, 16509, 22591, 0, 432, 569, 'EventAI', 1, 1, 0, 0, 1, 884, 0, 0, 0, 0, 0, '');

-- Fix for Frostwolf Battleguards, added missing spells, corrected hp and damage.
REPLACE INTO `creature_template` (`entry`, `KillCredit1`, `KillCredit2`, `modelid_1`, `modelid_2`, `modelid_3`, `modelid_4`, `name`, `subname`, `gossip_menu_id`, `minlevel`, `maxlevel`, `minhealth`, `maxhealth`, `minmana`, `maxmana`, `armor`, `faction_A`, `faction_H`, `npcflag`, `speed_walk`, `speed_run`, `scale`, `rank`, `mindmg`, `maxdmg`, `dmgschool`, `attackpower`, `dmg_multiplier`, `baseattacktime`, `rangeattacktime`, `unit_class`, `unit_flags`, `dynamicflags`, `family`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `minrangedmg`, `maxrangedmg`, `rangedattackpower`, `type`, `type_flags`, `lootid`, `pickpocketloot`, `skinloot`, `resistance1`, `resistance2`, `resistance3`, `resistance4`, `resistance5`, `resistance6`, `spell1`, `spell2`, `spell3`, `spell4`, `PetSpellDataId`, `mingold`, `maxgold`, `AIName`, `MovementType`, `InhabitType`, `Civilian`, `RacialLeader`, `RegenHealth`, `equipment_id`, `trainer_id`, `vendor_id`, `MechanicImmuneMask`, `SchoolImmuneMask`, `flags_extra`, `ScriptName`) VALUES (14285, 0, 0, 14320, 14323, 0, 0, 'Frostwolf Battleguard', NULL, 0, 61, 61, 16638, 16638, 0, 0, 3489, 85, 85, 0, 1.05, 1.14286, 0, 1, 832, 991, 0, 268, 1, 2000, 2000, 1, 0, 0, 0, 0, 0, 0, 0, 172.1, 240.07, 100, 7, 8, 14285, 0, 0, 0, 5, 5, 5, 5, 5, 22120, 3248, 16509, 22591, 0, 377, 497, 'EventAI', 1, 3, 0, 0, 1, 2062, 0, 0, 0, 0, 0, '');

-- Fix for Stromgarde keep npcs, added missing spells.
REPLACE INTO `creature_template` (`entry`, `KillCredit1`, `KillCredit2`, `modelid_1`, `modelid_2`, `modelid_3`, `modelid_4`, `name`, `subname`, `gossip_menu_id`, `minlevel`, `maxlevel`, `minhealth`, `maxhealth`, `minmana`, `maxmana`, `armor`, `faction_A`, `faction_H`, `npcflag`, `speed_walk`, `speed_run`, `scale`, `rank`, `mindmg`, `maxdmg`, `dmgschool`, `attackpower`, `dmg_multiplier`, `baseattacktime`, `rangeattacktime`, `unit_class`, `unit_flags`, `dynamicflags`, `family`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `minrangedmg`, `maxrangedmg`, `rangedattackpower`, `type`, `type_flags`, `lootid`, `pickpocketloot`, `skinloot`, `resistance1`, `resistance2`, `resistance3`, `resistance4`, `resistance5`, `resistance6`, `spell1`, `spell2`, `spell3`, `spell4`, `PetSpellDataId`, `mingold`, `maxgold`, `AIName`, `MovementType`, `InhabitType`, `Civilian`, `RacialLeader`, `RegenHealth`, `equipment_id`, `trainer_id`, `vendor_id`, `MechanicImmuneMask`, `SchoolImmuneMask`, `flags_extra`, `ScriptName`) VALUES (2583, 0, 0, 4139, 0, 0, 0, 'Stromgarde Troll Hunter', NULL, 0, 37, 38, 3359, 3453, 1142, 1189, 1372, 11, 11, 0, 1.05, 1.14286, 0, 1, 193, 249, 0, 148, 1, 1341, 2000, 2, 32768, 0, 0, 0, 0, 0, 0, 44.84, 61.655, 100, 7, 8, 2583, 2583, 0, 0, 0, 0, 0, 0, 0, 17137, 2767, 0, 0, 0, 204, 272, 'EventAI', 1, 3, 0, 0, 1, 1968, 0, 0, 0, 0, 0, '');
REPLACE INTO `creature_template` (`entry`, `KillCredit1`, `KillCredit2`, `modelid_1`, `modelid_2`, `modelid_3`, `modelid_4`, `name`, `subname`, `gossip_menu_id`, `minlevel`, `maxlevel`, `minhealth`, `maxhealth`, `minmana`, `maxmana`, `armor`, `faction_A`, `faction_H`, `npcflag`, `speed_walk`, `speed_run`, `scale`, `rank`, `mindmg`, `maxdmg`, `dmgschool`, `attackpower`, `dmg_multiplier`, `baseattacktime`, `rangeattacktime`, `unit_class`, `unit_flags`, `dynamicflags`, `family`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `minrangedmg`, `maxrangedmg`, `rangedattackpower`, `type`, `type_flags`, `lootid`, `pickpocketloot`, `skinloot`, `resistance1`, `resistance2`, `resistance3`, `resistance4`, `resistance5`, `resistance6`, `spell1`, `spell2`, `spell3`, `spell4`, `PetSpellDataId`, `mingold`, `maxgold`, `AIName`, `MovementType`, `InhabitType`, `Civilian`, `RacialLeader`, `RegenHealth`, `equipment_id`, `trainer_id`, `vendor_id`, `MechanicImmuneMask`, `SchoolImmuneMask`, `flags_extra`, `ScriptName`) VALUES (2584, 0, 0, 4137, 0, 0, 0, 'Stromgarde Defender', NULL, 0, 38, 39, 4264, 4450, 0, 0, 1834, 11, 11, 0, 1.05, 1.14286, 0, 1, 193, 249, 0, 152, 1, 1341, 2000, 1, 32768, 0, 0, 0, 0, 0, 0, 44.84, 61.655, 100, 7, 8, 2584, 2584, 0, 0, 0, 0, 0, 0, 0, 7164, 11972, 0, 0, 0, 249, 330, 'EventAI', 1, 3, 0, 0, 1, 1969, 0, 0, 0, 0, 0, '');
REPLACE INTO `creature_template` (`entry`, `KillCredit1`, `KillCredit2`, `modelid_1`, `modelid_2`, `modelid_3`, `modelid_4`, `name`, `subname`, `gossip_menu_id`, `minlevel`, `maxlevel`, `minhealth`, `maxhealth`, `minmana`, `maxmana`, `armor`, `faction_A`, `faction_H`, `npcflag`, `speed_walk`, `speed_run`, `scale`, `rank`, `mindmg`, `maxdmg`, `dmgschool`, `attackpower`, `dmg_multiplier`, `baseattacktime`, `rangeattacktime`, `unit_class`, `unit_flags`, `dynamicflags`, `family`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `minrangedmg`, `maxrangedmg`, `rangedattackpower`, `type`, `type_flags`, `lootid`, `pickpocketloot`, `skinloot`, `resistance1`, `resistance2`, `resistance3`, `resistance4`, `resistance5`, `resistance6`, `spell1`, `spell2`, `spell3`, `spell4`, `PetSpellDataId`, `mingold`, `maxgold`, `AIName`, `MovementType`, `InhabitType`, `Civilian`, `RacialLeader`, `RegenHealth`, `equipment_id`, `trainer_id`, `vendor_id`, `MechanicImmuneMask`, `SchoolImmuneMask`, `flags_extra`, `ScriptName`) VALUES (2585, 0, 0, 4143, 0, 0, 0, 'Stromgarde Vindicator', NULL, 0, 39, 40, 4438, 4658, 0, 0, 1890, 11, 11, 0, 1.05, 1.14286, 0, 1, 199, 256, 0, 156, 1, 1333, 2000, 1, 32768, 0, 0, 0, 0, 0, 0, 45.7392, 62.8914, 100, 7, 8, 2585, 2585, 0, 0, 0, 0, 0, 0, 0, 8602, 0, 0, 0, 0, 259, 343, 'EventAI', 0, 3, 0, 0, 1, 105, 0, 0, 0, 0, 0, '');

-- Fix for Lieutenant Valorcall and his Stromgarde Cavalrymen, added missing spells.
REPLACE INTO `creature_template` (`entry`, `KillCredit1`, `KillCredit2`, `modelid_1`, `modelid_2`, `modelid_3`, `modelid_4`, `name`, `subname`, `gossip_menu_id`, `minlevel`, `maxlevel`, `minhealth`, `maxhealth`, `minmana`, `maxmana`, `armor`, `faction_A`, `faction_H`, `npcflag`, `speed_walk`, `speed_run`, `scale`, `rank`, `mindmg`, `maxdmg`, `dmgschool`, `attackpower`, `dmg_multiplier`, `baseattacktime`, `rangeattacktime`, `unit_class`, `unit_flags`, `dynamicflags`, `family`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `minrangedmg`, `maxrangedmg`, `rangedattackpower`, `type`, `type_flags`, `lootid`, `pickpocketloot`, `skinloot`, `resistance1`, `resistance2`, `resistance3`, `resistance4`, `resistance5`, `resistance6`, `spell1`, `spell2`, `spell3`, `spell4`, `PetSpellDataId`, `mingold`, `maxgold`, `AIName`, `MovementType`, `InhabitType`, `Civilian`, `RacialLeader`, `RegenHealth`, `equipment_id`, `trainer_id`, `vendor_id`, `MechanicImmuneMask`, `SchoolImmuneMask`, `flags_extra`, `ScriptName`) VALUES (2612, 0, 0, 4141, 0, 0, 0, 'Lieutenant Valorcall', NULL, 0, 38, 38, 5497, 5497, 1783, 1783, 1418, 11, 11, 2, 1.05, 1.14286, 0, 1, 208, 268, 0, 148, 1, 1325, 2000, 2, 32832, 0, 0, 0, 0, 0, 0, 46.624, 64.108, 100, 7, 8, 2612, 2612, 0, 0, 0, 0, 0, 0, 0, 642, 3472, 13953, 0, 0, 215, 285, 'EventAI', 0, 3, 0, 0, 1, 1976, 0, 0, 0, 0, 0, '');
REPLACE INTO `creature_template` (`entry`, `KillCredit1`, `KillCredit2`, `modelid_1`, `modelid_2`, `modelid_3`, `modelid_4`, `name`, `subname`, `gossip_menu_id`, `minlevel`, `maxlevel`, `minhealth`, `maxhealth`, `minmana`, `maxmana`, `armor`, `faction_A`, `faction_H`, `npcflag`, `speed_walk`, `speed_run`, `scale`, `rank`, `mindmg`, `maxdmg`, `dmgschool`, `attackpower`, `dmg_multiplier`, `baseattacktime`, `rangeattacktime`, `unit_class`, `unit_flags`, `dynamicflags`, `family`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `minrangedmg`, `maxrangedmg`, `rangedattackpower`, `type`, `type_flags`, `lootid`, `pickpocketloot`, `skinloot`, `resistance1`, `resistance2`, `resistance3`, `resistance4`, `resistance5`, `resistance6`, `spell1`, `spell2`, `spell3`, `spell4`, `PetSpellDataId`, `mingold`, `maxgold`, `AIName`, `MovementType`, `InhabitType`, `Civilian`, `RacialLeader`, `RegenHealth`, `equipment_id`, `trainer_id`, `vendor_id`, `MechanicImmuneMask`, `SchoolImmuneMask`, `flags_extra`, `ScriptName`) VALUES (2738, 0, 0, 4145, 0, 0, 0, 'Stromgarde Cavalryman', NULL, 0, 36, 37, 3804, 5380, 0, 0, 1340, 11, 11, 2, 1.05, 1.14286, 0, 1, 193, 249, 0, 144, 1, 1341, 2000, 1, 0, 0, 0, 0, 0, 0, 0, 44.84, 61.655, 100, 7, 8, 2738, 2738, 0, 0, 0, 0, 0, 0, 0, 6268, 0, 0, 0, 0, 232, 308, 'EventAI', 0, 3, 0, 0, 1, 417, 0, 0, 0, 0, 0, '');

-- Fix for Otto, added missing spells.
REPLACE INTO `creature_template` (`entry`, `KillCredit1`, `KillCredit2`, `modelid_1`, `modelid_2`, `modelid_3`, `modelid_4`, `name`, `subname`, `gossip_menu_id`, `minlevel`, `maxlevel`, `minhealth`, `maxhealth`, `minmana`, `maxmana`, `armor`, `faction_A`, `faction_H`, `npcflag`, `speed_walk`, `speed_run`, `scale`, `rank`, `mindmg`, `maxdmg`, `dmgschool`, `attackpower`, `dmg_multiplier`, `baseattacktime`, `rangeattacktime`, `unit_class`, `unit_flags`, `dynamicflags`, `family`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `minrangedmg`, `maxrangedmg`, `rangedattackpower`, `type`, `type_flags`, `lootid`, `pickpocketloot`, `skinloot`, `resistance1`, `resistance2`, `resistance3`, `resistance4`, `resistance5`, `resistance6`, `spell1`, `spell2`, `spell3`, `spell4`, `PetSpellDataId`, `mingold`, `maxgold`, `AIName`, `MovementType`, `InhabitType`, `Civilian`, `RacialLeader`, `RegenHealth`, `equipment_id`, `trainer_id`, `vendor_id`, `MechanicImmuneMask`, `SchoolImmuneMask`, `flags_extra`, `ScriptName`) VALUES (2599, 0, 0, 3971, 0, 0, 0, 'Otto', 'Bodyguard', 0, 38, 38, 4152, 4152, 0, 0, 1709, 87, 87, 0, 1.05, 1.14286, 0, 1, 185, 239, 0, 148, 1, 1350, 2000, 1, 32768, 0, 0, 0, 0, 0, 0, 43.956, 60.4395, 100, 7, 8, 2599, 2599, 0, 0, 0, 0, 0, 0, 0, 6253, 12555, 0, 0, 0, 253, 335, 'EventAI', 0, 3, 0, 0, 1, 258, 0, 0, 0, 0, 0, '');

-- Fix for League of Arathor Elite, added missing spells, corrected level, hp and damage.
REPLACE INTO `creature_template` (`entry`, `KillCredit1`, `KillCredit2`, `modelid_1`, `modelid_2`, `modelid_3`, `modelid_4`, `name`, `subname`, `gossip_menu_id`, `minlevel`, `maxlevel`, `minhealth`, `maxhealth`, `minmana`, `maxmana`, `armor`, `faction_A`, `faction_H`, `npcflag`, `speed_walk`, `speed_run`, `scale`, `rank`, `mindmg`, `maxdmg`, `dmgschool`, `attackpower`, `dmg_multiplier`, `baseattacktime`, `rangeattacktime`, `unit_class`, `unit_flags`, `dynamicflags`, `family`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `minrangedmg`, `maxrangedmg`, `rangedattackpower`, `type`, `type_flags`, `lootid`, `pickpocketloot`, `skinloot`, `resistance1`, `resistance2`, `resistance3`, `resistance4`, `resistance5`, `resistance6`, `spell1`, `spell2`, `spell3`, `spell4`, `PetSpellDataId`, `mingold`, `maxgold`, `AIName`, `MovementType`, `InhabitType`, `Civilian`, `RacialLeader`, `RegenHealth`, `equipment_id`, `trainer_id`, `vendor_id`, `MechanicImmuneMask`, `SchoolImmuneMask`, `flags_extra`, `ScriptName`) VALUES (15130, 0, 0, 15280, 15281, 0, 0, 'League of Arathor Elite', NULL, 0, 55, 55, 7842, 7842, 0, 0, 3500, 1577, 1577, 0, 1.05, 1.14286, 0, 1, 474, 564, 0, 156, 1, 2000, 2000, 1, 4096, 0, 0, 0, 0, 0, 0, 1.4664, 2.0163, 100, 7, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 15284, 11972, 0, 0, 0, 0, 0, 'EventAI', 0, 3, 0, 0, 1, 2075, 0, 0, 0, 0, 0, '');

-- Fix for Defiler Elite, added missing spells, corrected hp and damage.
REPLACE INTO `creature_template` (`entry`, `KillCredit1`, `KillCredit2`, `modelid_1`, `modelid_2`, `modelid_3`, `modelid_4`, `name`, `subname`, `gossip_menu_id`, `minlevel`, `maxlevel`, `minhealth`, `maxhealth`, `minmana`, `maxmana`, `armor`, `faction_A`, `faction_H`, `npcflag`, `speed_walk`, `speed_run`, `scale`, `rank`, `mindmg`, `maxdmg`, `dmgschool`, `attackpower`, `dmg_multiplier`, `baseattacktime`, `rangeattacktime`, `unit_class`, `unit_flags`, `dynamicflags`, `family`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `minrangedmg`, `maxrangedmg`, `rangedattackpower`, `type`, `type_flags`, `lootid`, `pickpocketloot`, `skinloot`, `resistance1`, `resistance2`, `resistance3`, `resistance4`, `resistance5`, `resistance6`, `spell1`, `spell2`, `spell3`, `spell4`, `PetSpellDataId`, `mingold`, `maxgold`, `AIName`, `MovementType`, `InhabitType`, `Civilian`, `RacialLeader`, `RegenHealth`, `equipment_id`, `trainer_id`, `vendor_id`, `MechanicImmuneMask`, `SchoolImmuneMask`, `flags_extra`, `ScriptName`) VALUES (15128, 0, 0, 15284, 15285, 0, 0, 'Defiler Elite', NULL, 0, 55, 55, 7842, 7842, 0, 0, 3500, 412, 412, 0, 1.05, 1.14286, 0, 1, 474, 564, 0, 250, 1, 2000, 2000, 1, 4096, 0, 0, 0, 0, 0, 0, 58.872, 80.949, 100, 7, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 15284, 11972, 0, 0, 0, 0, 0, 'EventAI', 0, 3, 0, 0, 1, 2074, 0, 0, 0, 0, 0, '');

-- Fix for Samuel Hawke, added missing spells, corrected level, hp and damage. Source video (https://youtu.be/GH2DMdZaPxA?t=225) i know video is from early tbc but they didnt change him from vanilla.
REPLACE INTO `creature_template` (`entry`, `KillCredit1`, `KillCredit2`, `modelid_1`, `modelid_2`, `modelid_3`, `modelid_4`, `name`, `subname`, `gossip_menu_id`, `minlevel`, `maxlevel`, `minhealth`, `maxhealth`, `minmana`, `maxmana`, `armor`, `faction_A`, `faction_H`, `npcflag`, `speed_walk`, `speed_run`, `scale`, `rank`, `mindmg`, `maxdmg`, `dmgschool`, `attackpower`, `dmg_multiplier`, `baseattacktime`, `rangeattacktime`, `unit_class`, `unit_flags`, `dynamicflags`, `family`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `minrangedmg`, `maxrangedmg`, `rangedattackpower`, `type`, `type_flags`, `lootid`, `pickpocketloot`, `skinloot`, `resistance1`, `resistance2`, `resistance3`, `resistance4`, `resistance5`, `resistance6`, `spell1`, `spell2`, `spell3`, `spell4`, `PetSpellDataId`, `mingold`, `maxgold`, `AIName`, `MovementType`, `InhabitType`, `Civilian`, `RacialLeader`, `RegenHealth`, `equipment_id`, `trainer_id`, `vendor_id`, `MechanicImmuneMask`, `SchoolImmuneMask`, `flags_extra`, `ScriptName`) VALUES (15127, 0, 0, 15277, 0, 0, 0, 'Samuel Hawke', 'League of Arathor Supply Officer', 0, 55, 55, 48440, 48440, 0, 0, 3790, 1599, 1599, 16388, 1.05, 1.14286, 0, 1, 810, 926, 0, 290, 1, 2000, 2000, 1, 4096, 0, 0, 0, 0, 0, 0, 220.81, 320.77, 100, 7, 8, 0, 0, 0, 0, 15, 15, 15, 15, 15, 6253, 22911, 15284, 15708, 0, 0, 0, 'EventAI', 0, 3, 0, 0, 1, 877, 0, 0, 0, 0, 0, '');

-- Fix for Rutherford Twing, added missing spells, corrected hp and damage.
REPLACE INTO `creature_template` (`entry`, `KillCredit1`, `KillCredit2`, `modelid_1`, `modelid_2`, `modelid_3`, `modelid_4`, `name`, `subname`, `gossip_menu_id`, `minlevel`, `maxlevel`, `minhealth`, `maxhealth`, `minmana`, `maxmana`, `armor`, `faction_A`, `faction_H`, `npcflag`, `speed_walk`, `speed_run`, `scale`, `rank`, `mindmg`, `maxdmg`, `dmgschool`, `attackpower`, `dmg_multiplier`, `baseattacktime`, `rangeattacktime`, `unit_class`, `unit_flags`, `dynamicflags`, `family`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `minrangedmg`, `maxrangedmg`, `rangedattackpower`, `type`, `type_flags`, `lootid`, `pickpocketloot`, `skinloot`, `resistance1`, `resistance2`, `resistance3`, `resistance4`, `resistance5`, `resistance6`, `spell1`, `spell2`, `spell3`, `spell4`, `PetSpellDataId`, `mingold`, `maxgold`, `AIName`, `MovementType`, `InhabitType`, `Civilian`, `RacialLeader`, `RegenHealth`, `equipment_id`, `trainer_id`, `vendor_id`, `MechanicImmuneMask`, `SchoolImmuneMask`, `flags_extra`, `ScriptName`) VALUES (15126, 0, 0, 15276, 0, 0, 0, 'Rutherford Twing', 'Defilers Supply Officer', 0, 55, 55, 48440, 48440, 0, 0, 3790, 1598, 1598, 16388, 1.05, 1.14286, 0, 1, 810, 926, 0, 248, 1, 1500, 2000, 1, 4096, 0, 0, 0, 0, 0, 0, 62.7984, 86.3478, 100, 7, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6253, 22911, 15708, 0, 0, 0, 0, 'EventAI', 0, 3, 0, 0, 1, 2073, 0, 0, 0, 0, 0, '');

-- Fix for Hammerfall Grunt, added missing spells.
REPLACE INTO `creature_template` (`entry`, `KillCredit1`, `KillCredit2`, `modelid_1`, `modelid_2`, `modelid_3`, `modelid_4`, `name`, `subname`, `gossip_menu_id`, `minlevel`, `maxlevel`, `minhealth`, `maxhealth`, `minmana`, `maxmana`, `armor`, `faction_A`, `faction_H`, `npcflag`, `speed_walk`, `speed_run`, `scale`, `rank`, `mindmg`, `maxdmg`, `dmgschool`, `attackpower`, `dmg_multiplier`, `baseattacktime`, `rangeattacktime`, `unit_class`, `unit_flags`, `dynamicflags`, `family`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `minrangedmg`, `maxrangedmg`, `rangedattackpower`, `type`, `type_flags`, `lootid`, `pickpocketloot`, `skinloot`, `resistance1`, `resistance2`, `resistance3`, `resistance4`, `resistance5`, `resistance6`, `spell1`, `spell2`, `spell3`, `spell4`, `PetSpellDataId`, `mingold`, `maxgold`, `AIName`, `MovementType`, `InhabitType`, `Civilian`, `RacialLeader`, `RegenHealth`, `equipment_id`, `trainer_id`, `vendor_id`, `MechanicImmuneMask`, `SchoolImmuneMask`, `flags_extra`, `ScriptName`) VALUES (2619, 0, 0, 4032, 0, 0, 0, 'Hammerfall Grunt', NULL, 0, 34, 35, 1187, 1337, 970, 970, 1373, 83, 83, 0, 1.05, 1.14286, 0, 0, 61, 78, 0, 138, 1, 2000, 2000, 1, 32768, 0, 0, 0, 0, 0, 0, 53.8384, 74.0278, 100, 7, 0, 2619, 2619, 0, 0, 0, 0, 0, 0, 0, 3019, 3427, 0, 0, 0, 54, 75, 'EventAI', 1, 3, 0, 0, 1, 920, 0, 0, 0, 0, 0, '');

-- Fix for Refu Pointe Defender, added missing spells.
REPLACE INTO `creature_template` (`entry`, `KillCredit1`, `KillCredit2`, `modelid_1`, `modelid_2`, `modelid_3`, `modelid_4`, `name`, `subname`, `gossip_menu_id`, `minlevel`, `maxlevel`, `minhealth`, `maxhealth`, `minmana`, `maxmana`, `armor`, `faction_A`, `faction_H`, `npcflag`, `speed_walk`, `speed_run`, `scale`, `rank`, `mindmg`, `maxdmg`, `dmgschool`, `attackpower`, `dmg_multiplier`, `baseattacktime`, `rangeattacktime`, `unit_class`, `unit_flags`, `dynamicflags`, `family`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `minrangedmg`, `maxrangedmg`, `rangedattackpower`, `type`, `type_flags`, `lootid`, `pickpocketloot`, `skinloot`, `resistance1`, `resistance2`, `resistance3`, `resistance4`, `resistance5`, `resistance6`, `spell1`, `spell2`, `spell3`, `spell4`, `PetSpellDataId`, `mingold`, `maxgold`, `AIName`, `MovementType`, `InhabitType`, `Civilian`, `RacialLeader`, `RegenHealth`, `equipment_id`, `trainer_id`, `vendor_id`, `MechanicImmuneMask`, `SchoolImmuneMask`, `flags_extra`, `ScriptName`) VALUES (10696, 0, 0, 4137, 0, 0, 0, 'Refuge Pointe Defender', NULL, 0, 41, 45, 3291, 4026, 0, 0, 2725, 11, 11, 0, 1.05, 1.14286, 0, 0, 491, 631, 0, 204, 1, 2000, 2000, 1, 4096, 0, 0, 0, 0, 0, 0, 62.8672, 86.4424, 100, 7, 0, 10696, 10696, 0, 0, 0, 0, 0, 0, 0, 7164, 11972, 0, 0, 0, 0, 0, 'EventAI', 1, 3, 0, 0, 1, 1969, 0, 0, 0, 0, 0, ''); 
 
/* 
* 20170315220520_world.sql 
*/ 
INSERT INTO `migrations` VALUES ('20170315220520');

-- Bug: Lvl 18 and 19 warriors had the same base HP
-- Change: 19 All Warriors
UPDATE `player_classlevelstats` SET `basehp`=183 WHERE `class`=1 AND `level`=19;

-- Bug: Lvl 18 and 19 HUMAN warriors have the same stats
-- Change: 19 Human Warrior
-- The following are estimated stats right between lvl 18 and lvl 20 stats. No source for correct stats could be found.
UPDATE `player_levelstats` SET `str`=46, `agi`=34, `sta`=42, `inte`=22, `spi`=26 WHERE `race`=1 AND `class`=1 AND `level`=19;

-- Bug: Lvl 18, 19 and 20 orc rogues have the same stats
-- 19, 20 Orc Rogue.
-- https://github.com/cmangos/mangos-classic/blob/f7d9cb40b04ecedbf029ff805869812bcf7c4898/sql/archive/0.7/3562_player_levelstats.sql
DELETE FROM player_levelstats WHERE race=2 and class=4 and level=19;
DELETE FROM player_levelstats WHERE race=2 and class=4 and level=20;
INSERT INTO player_levelstats VALUES
('2', '4', '19', '38', '44', '35', '20', '30'),
('2', '4', '20', '38', '46', '36', '20', '30');

 
 
/* 
* 20170316013229_world.sql 
*/ 
INSERT INTO `migrations` VALUES ('20170316013229'); 

INSERT INTO `command` (`name`, `security`, `help`, `flags`) VALUES ('wareffortget', '6', 'Syntax: .wareffortget \"[ResourceName]\"', '0');
INSERT INTO `command` (`name`, `security`, `help`, `flags`) VALUES ('wareffortset', '6', 'Syntax: .wareffortset \"[ResourceName]\" [NewResourceCount]', '0');
 
 
/* 
* 20170316201700_world.sql 
*/ 
INSERT INTO `migrations` VALUES ('20170316201700');

INSERT INTO mangos_string (entry, content_default) VALUES (640, "Group type: %s (ID: %s) Leader: %s (account %s) Player count: %d Players: %s");
 
 
/* 
* 20170318015000_world.sql 
*/ 
INSERT INTO `migrations` VALUES ('20170318015000');

-- Adds PROC_EX_NO_PERIODIC flag to Shadow Vulnerability
UPDATE spell_proc_event SET procEx=524288 WHERE entry IN (17800,17794,17797,17798,17799)
 
 
/* 
* 20170320205756_world.sql 
*/ 
INSERT INTO `migrations` VALUES ('20170320205756');

UPDATE `creature_template` SET `name`='Tranquil Air Totem' WHERE `entry`='15803';
 
 
/* 
* 20170321151330_world.sql 
*/ 
INSERT INTO `migrations` VALUES ('20170321151330');

-- Tie Crystalline Tear to Patch 1.9
INSERT INTO `game_event_gameobject` VALUES (49389, 166);
 
 
/* 
* 20170326174853_world.sql 
*/ 
INSERT INTO `migrations` VALUES ('20170326174853'); 


-- Mountain Lions in Hillsbrad foothills should not be stealthed
DELETE FROM `creature_ai_scripts`
WHERE `creature_id` = 2384 or `creature_id` = 2385;


-- Fix Skeletons immune to wrong stuff
UPDATE `creature_template`
SET `mechanicimmunemask` = '213521' 
WHERE `mechanicimmunemask` = '646015775';
 
 
/* 
* 20170327000003_world.sql 
*/ 
INSERT INTO `migrations` VALUES ('20170327000003');

-- The Woodland Protector quest text fix
UPDATE `quest_template` SET `OfferRewardText`='Your service to the creatures of Shadowglen is worthy of reward, $N.$b$bYou confirmed my fears, however. If the grells have become tainted by the Fel Moss, one can only imagine what has become of the Gnarlpine tribe of furbolgs who once lived here.$b$bShould you find yourself in Dolanaar, able $C, seek out the knowledgeable druid, Athridas Bearmantle. He shares our concern for the well being of the forest.' WHERE `entry`=459;
 
 
/* 
* 20170327030530_world.sql 
*/ 
INSERT INTO `migrations` VALUES ('20170327030530');
-- Add the npc_text connecion to the npc_gossip for Archmage Xylem
INSERT INTO `npc_gossip` (`npc_guid`,`textid`) VALUES (35886,8379) ON DUPLICATE KEY UPDATE npc_guid = npc_guid;
-- Combine the bitfields to allow for gossip and Xylem to be a quest giver
UPDATE `creature_template` SET `npcflag` = 3 WHERE `entry`=8379;
 
 
/* 
* 20170328092010_world.sql 
*/ 
INSERT INTO `migrations` VALUES ('20170328092010');

-- Teldrassil: Fandral Staghelm should be referred as Arch Druid, not Arch $C
UPDATE `quest_template` SET `RequestItemsText` = "Hmm... You come with the spirit of the forest strongly within you, $C. What business do you have with the Arch Druid of the Kaldorei?" WHERE `entry` = 940;

-- Grove of the Ancients: Fandral Staghelm should be referred as Arch Druid, not Arch $C
UPDATE `quest_template` SET `OfferRewardText` = "Ah. Thank you, $N. It is strange, though. The Arch Druid always seems in such a hurry. The forest knows that all shall come to pass in the appointed time. Shan'do Stormrage understood that." where `entry` = 952;

-- Morrowgrain Research: Fandral Staghelm should be referred as Arch Druid, not Arch $C
UPDATE `quest_template` SET 
`OfferRewardText` = "Well done $N, I will be sure to give these to the Arch Druid himself when he has need of them. Meanwhile, please accept this as a token of the Cenarion Circle's appreciation.$b$bOur need for morrowgrain, for now, is constant; if you wish to continue aiding us, then please return when you have cultivated more of it.",
`RequestItemsText` = "Yes $N, have you grown some morrowgrain for the Arch Druid's important research? The mysterious properties of Un'Goro Crater become clearer with each passing day, thanks to the help you are giving us."
WHERE `entry` = 3785;

-- Crown of the Earth: Fandral Staghelm should be referred as Arch Druid, not Arch $C
UPDATE `quest_template` SET `OfferRewardText`="Shan'do Stormrage never returned, and the druids were in disarray, and to this day we still do not know what became of him. With Malfurion missing, Arch Druid Fandral Staghelm took over the leadership of the druids, convincing the Circle of Ancients in Darkshore that it was time for our people to rebuild, and that it was time for our people to regain their immortality.$B$BWith the approval of the Circle, Staghelm and the most powerful druids grew Teldrassil, the new World Tree." WHERE `entry`=933;
UPDATE `quest_template` SET 
`OfferRewardText`="To be in the presence of the Oracle Tree... it is almost to feel wisdom take form. Let me continue the telling...$B$BWith Teldrassil grown, the Arch Druid approached the dragons for their blessings, as the dragons had placed upon Nordrassil in ancient times. But Nozdormu, Lord of Time, refused to give his blessing, chiding the druid for his arrogance. In agreement with Nozdormu, Alexstrasza also refused Staghelm, and without her blessing, Teldrassil's growth has been flawed and unpredictable...",
`RequestItemsText`="Along with the druids, the Oracle Tree and the Arch Druid have been carefully monitoring the growth of Teldrassil. But though we have a new home, our immortal lives have not been restored." WHERE `entry`=934; 
 
/* 
* 20170328190610_world.sql 
*/ 
INSERT INTO `migrations` VALUES ('20170328190610'); 

-- Warchief's Blessing event texts
INSERT INTO creature_ai_texts (entry, content_default, `comment`) VALUES (-143961, 'Honor your heroes! On this day, they have dealt a great blow against one of our most hated enemies! The false Warchief, Rend Blackhand, has fallen!', 'warchief blessing yell1');
INSERT INTO creature_ai_texts (entry, content_default, `comment`) VALUES (-143962, 'Be bathed in my power! Drink in my might! Battle for the glory of the Horde!', 'warchief blessing yell2');
INSERT INTO creature_ai_texts (entry, content_default, `comment`) VALUES (-143963, 'Be bathed in the power of the Warchief! Drink in his might! Battle for the glory of the Horde!', 'warchief blessing yell3');
INSERT INTO creature_template (entry, modelid_1, name, minhealth, maxhealth, armor, faction_A, faction_H, mindmg, maxdmg, attackpower, baseattacktime, rangeattacktime, unit_class, unit_flags, `type`, flags_extra) VALUES (21003, 13069, 'Warchief Blessing Generator', 8, 8, 7, 85, 85, 2, 2, 44, 2000, 2000, 1, 33554946, 10, 2);
 
 
/* 
* 20170328191528_world.sql 
*/ 
INSERT INTO `migrations` VALUES ('20170328191528');

-- Remove reputation check from Nefarius's Corruption, check for Charge of the Dragonflights.
-- Set time to 90 minutes. 5400 seconds = 1.5 * 60 * 60 seconds. Originally 5 hours.
UPDATE `quest_template` SET `RequiredMinRepFaction` = 0, `RequiredMinRepValue` = 0, `LimitTime` = 5400, 
`Objectives`  = 'Slay Nefarian and recover the Red Scepter Shard. Return the Red Scepter Shard to Anachronos at the Caverns of Time in Tanaris. You have one and a half hours to complete this task.' 
WHERE `entry` = 8730;

-- Update objectives texts
DELETE FROM `locales_quest` WHERE `entry` = 8730;
INSERT INTO `locales_quest` (`entry`, `Title_loc1`, `Title_loc2`, `Title_loc3`, `Title_loc4`, `Title_loc5`, `Title_loc6`, `Title_loc7`, `Title_loc8`, `Details_loc1`, `Details_loc2`, `Details_loc3`, `Details_loc4`, `Details_loc5`, `Details_loc6`, `Details_loc7`, `Details_loc8`, `Objectives_loc1`, `Objectives_loc2`, `Objectives_loc3`, `Objectives_loc4`, `Objectives_loc5`, `Objectives_loc6`, `Objectives_loc7`, `Objectives_loc8`, `OfferRewardText_loc1`, `OfferRewardText_loc2`, `OfferRewardText_loc3`, `OfferRewardText_loc4`, `OfferRewardText_loc5`, `OfferRewardText_loc6`, `OfferRewardText_loc7`, `OfferRewardText_loc8`, `RequestItemsText_loc1`, `RequestItemsText_loc2`, `RequestItemsText_loc3`, `RequestItemsText_loc4`, `RequestItemsText_loc5`, `RequestItemsText_loc6`, `RequestItemsText_loc7`, `RequestItemsText_loc8`, `EndText_loc1`, `EndText_loc2`, `EndText_loc3`, `EndText_loc4`, `EndText_loc5`, `EndText_loc6`, `EndText_loc7`, `EndText_loc8`, `ObjectiveText1_loc1`, `ObjectiveText1_loc2`, `ObjectiveText1_loc3`, `ObjectiveText1_loc4`, `ObjectiveText1_loc5`, `ObjectiveText1_loc6`, `ObjectiveText1_loc7`, `ObjectiveText1_loc8`, `ObjectiveText2_loc1`, `ObjectiveText2_loc2`, `ObjectiveText2_loc3`, `ObjectiveText2_loc4`, `ObjectiveText2_loc5`, `ObjectiveText2_loc6`, `ObjectiveText2_loc7`, `ObjectiveText2_loc8`, `ObjectiveText3_loc1`, `ObjectiveText3_loc2`, `ObjectiveText3_loc3`, `ObjectiveText3_loc4`, `ObjectiveText3_loc5`, `ObjectiveText3_loc6`, `ObjectiveText3_loc7`, `ObjectiveText3_loc8`, `ObjectiveText4_loc1`, `ObjectiveText4_loc2`, `ObjectiveText4_loc3`, `ObjectiveText4_loc4`, `ObjectiveText4_loc5`, `ObjectiveText4_loc6`, `ObjectiveText4_loc7`, `ObjectiveText4_loc8`) VALUES
(8730,  NULL,   'La corruption de Nefarius',    'Nefarius\' Verderbnis',    '奈法里奥斯的腐蚀', NULL,   'La corrupción de Nefarius',    'La corrupción de Nefarius',    'Нефариус, пораженный порчей',  NULL,   'Champion, est-ce bien vous ? Un millier d’années se sont écoulées depuis que le fragment m’a été confié, et c’est à mon heure la plus sombre que quelqu’un se présente pour me le réclamer… Mais que serait une tragédie sans cruauté ?$B$B< Vaelastrasz tousse faiblement.>$B$BNe… Nefarius détient aujourd’hui le fragment du sceptre.$B$BLe temps presse. Nefarius a l’intention de détruire le fragment. Vous devez vous hâter !', 'Held, seid Ihr es? Es ist tausend Jahre her, seitdem man mir den Splitter anvertraut hat. Jetzt, in meiner finstersten Stunde soll jemand erscheinen, um mich davon zu entlasten... aber was wäre eine Tragödie ohne Grausamkeit?$B$B<Vaelastrasz hustet geschwächt.>$B$BNe... Nefarius besitzt nun den Szeptersplitter.$B$BDie Zeit ist entscheidend. Nefarius hat vor den Splitter zu zerstören. Ihr müsst Euch beeilen!',   '勇士，是你吗？我受命保管这个碎片已经一千年了，在我最黑暗的时候，应该有人站出来替我把它拿回来……但是一切都是任重道远的。$B$B<瓦拉斯塔兹轻轻地咳嗽着。>$B$B耐……耐法里奥斯现在掌握着scepter shard。$B$B时间是最关键的。耐法里奥斯将要摧毁这个scepter。你必须赶快！',   NULL,   '¿Eres tú, Campeón? Mil años hace que me fue confiado este fragmento, y en triste hora vienen a arrebatármelo... Pero ¿qué sería una tragedia sin crueldad?$B$B<Vaelastrasz tose débilmente.>$B$BEl... El fragmento de cetro está en poder de Nefarius.$B$BEl tiempo corre en nuestra contra. Nefarius planea destruirlo. ¡Apresúrate!',    '¿Eres tú, Campeón? Mil años hace que me fue confiado este fragmento, y en triste hora vienen a arrebatármelo... Pero ¿qué sería una tragedia sin crueldad?$B$B<Vaelastrasz tose débilmente.>$B$BEl... El fragmento de cetro está en poder de Nefarius.$B$BEl tiempo corre en nuestra contra. Nefarius planea destruirlo. ¡Apresúrate!',    'Надо же, герой! Тысячу лет назад мне поручили хранить осколок, и вот, в черный час он был отнят у меня... Но какая же трагедия без жестокости?$B$B*Веластрас слабо кашляет.*$B$BОс... осколок скипетра ныне у Нефариуса.$B$BВремя дорого, ибо Нефариус намерен уничтожить осколок. Поторопись!',   NULL,   'Tuez Nefarian pour récupérer le Fragment de sceptre rouge. Rapportez le Fragment de sceptre rouge à Anachronos aux Grottes du temps en Tanaris. Vous avez une heure et demi pour accomplir cette tâche.',  'Tötet Nefarian und bringt den roten Szeptersplitter wieder in Euren Besitz. Bringt den roten Szeptersplitter zu Anachronos in den Höhlen der Zeit in Tanaris. Euch bleiben ein und halb Stunden, um diese Aufgabe zu erfüllen.',   '干掉奈法利安并拿到Red Scepter Shard。把Red Scepter Shard带给塔纳利斯时光之穴门口的阿纳克洛斯。你必须在一个半小时之内完成这个任务。',   NULL,   'Mata a Nefarian y recupera del fragmento de cetro rojo. Llévaselo a Anacronos a las Cavernas del Tiempo, en Tanaris. Tienes una hora y media para completar esta tarea.',  '', 'Убейте Нефариана и добудьте осколок красного скипетра. Верните осколок красного скипетра Анахроносу в Пещеры Времени в Танарис. На выполнение задания у вас есть 1.5 часов.',  NULL,   NULL,   '', '瓦拉斯塔兹的灵魂终於平静了，勇士。所有的守护巨龙都在关注着你的进展。他们知道你的身边有强大的盟友。$B$B我奉命送给你一些东西，希望它可以在这场战斗中帮助你。好好使用它……$B', NULL,   '', '', 'Теперь душа Валестраса в своем кругу, герой. Аспекты следили за твоими успехами с большим интересом. Знай, у тебя есть сильные союзники.', NULL,   NULL,   '', '又有一位英雄因为挑战死亡之翼的子嗣而阵亡了。我们将因这样的损失而被永远诅咒……',  NULL,   '', '', 'Еще один пал перед отродьем Смертокрыла.', NULL,   NULL,   '', NULL,   NULL,   '', '', '', NULL,   NULL,   '', '', NULL,   '', '', '', NULL,   NULL,   '', '', NULL,   '', '', '', NULL,   NULL,   '', '', NULL,   '', '', '', NULL,   NULL,   '', '', NULL,   '', '', '');
 
 
/* 
* 20170329135352_world.sql 
*/ 
INSERT INTO `migrations` VALUES ('20170329135352'); 

-- Makes it so the self buff proc from the Bloodfang set cannot be dodged or parried.
INSERT INTO `spell_mod` (`Id`, `procChance`, `procFlags`, `procCharges`, `DurationIndex`, `Category`, `CastingTimeIndex`, `StackAmount`, `SpellIconID`, `activeIconID`, `manaCost`, `Attributes`, `AttributesEx`, `AttributesEx2`, `AttributesEx3`, `AttributesEx4`, `Custom`, `InterruptFlags`, `AuraInterruptFlags`, `ChannelInterruptFlags`, `Dispel`, `Stances`, `StancesNot`, `SpellVisual`, `ManaCostPercentage`, `StartRecoveryCategory`, `StartRecoveryTime`, `MaxAffectedTargets`, `MaxTargetLevel`, `DmgClass`, `rangeIndex`, `RecoveryTime`, `CategoryRecoveryTime`, `SpellFamilyName`, `SpellFamilyFlags`, `Comment`) VALUES (23580, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 2097152, -1, -1, -1, -1, 0, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 0, 'Bloodfang proc (8/8 rogue Tier 2) self buff');
 
 
/* 
* 20170329190835_world.sql 
*/ 
INSERT INTO `migrations` VALUES ('20170329190835');

REPLACE INTO `script_texts` (`entry`, `content_default`, `content_loc1`, `content_loc2`, `content_loc3`, `content_loc4`, `content_loc5`, `content_loc6`, `content_loc7`, `content_loc8`, `sound`, `type`, `language`, `emote`, `comment`) VALUES
(-1469031,  'Looking for this: Red Scepter Shard? Come and get it...',    NULL,   NULL,   'Sucht ihr das hier: Roter Szepter Splitter? Kommt und holt es...',   '在找红色节杖碎片吗？过来啊，到这里来拿啊。。。',   NULL,   NULL,   NULL,   NULL,   0,  1,  0,  0,  'Nefarius\' yell at start of Red Scepter Shard Run'),
(-1469038,  'I wonder, heroes, what will you do when I manage to destroy this shard? Will the world be beyond Salvation?',  NULL,   NULL,   'Ich frage mich, Helden, was werdet ihr tun wenn ich diesen Splitter zerstöre? Wird die Welt nicht mehr zu retten sein?',   '我在想，英雄们啊，如果我把这碎片给毁了，你们会怎么办呢？这世界就无法被拯救了吧？',   NULL,   NULL,   NULL,   NULL,   0,  1,  0,  0,  'Nefarius\' Scepter Taunt '),
(-1469039,  'Lord Victor Nefarius\'s laughter echoes through the halls of Blackwing.',  NULL,   NULL,   'Lord Victor Nefarius\' Gelächter shallt durch die Hallen des Pechschwingenhortes',  '维克多·耐法里奥斯的笑声回响在整个黑翼大厅里',   NULL,   NULL,   NULL,   NULL,   0,  3,  0,  11, 'Lord Victor Nefarius\'s laughter echoes through the halls of Blackwing.'),
(-1469040,  'What\'s this? A chip in the shard? Finally, a weakness exposed... It won\'t be long now.', NULL,   NULL,   'Was ist das? Ein Sprung im Splitter? Endlich, eine ausgesetze Schwäche... Es ist bald soweit.',   '这是什么？碎片里有个缺口？终于，弱点出现了。。。用不了多久了',   NULL,   NULL,   NULL,   NULL,   0,  1,  0,  0,  ''),
(-1469041,  'Would it not be glorious if you somehow managed to defeat me, but not before I could destroy the only hope Kalimdor may have? I am giddy with anticipation. Soon... Soon it will be dust.',    NULL,   NULL,   'Wäre es nicht glorreich wenn ihr mich irgendwie besiegen würdet, aber nicht bevor ich die einzige Hoffnung Kalimdor\'s zerstöre? Mir wird Schwindelig vor Vorfreude. Bald... bald wird eure Hoffnung zu Staub verfallen.',   '如果你们在我摧毁这拯救卡利姆多唯一的希望之后才将我打败，那这份荣耀是不是会变得暗淡无光许多了呢。这将会发生一切真是让我太兴奋了。很快了。。。很快，一切都会化为灰烬。',   NULL,   NULL,   NULL,   NULL,   0,  1,  0,  0,  NULL),
(-1469042,  'Not even my father could have planned such tragedy... such chaos. You will never make it! Time is running out!',   NULL,   NULL,   'Nicht einmal mein Vater hätte so eine Tragödie... solch ein Chaos bewirken können. Ihr werdet es nie schaffen! Die Zeit wird knapp!',   '就连我父亲当初都没能计划出这样的悲剧。。。这样彻底的混沌。你们不会成功的！时间快没了！',   NULL,   NULL,   NULL,   NULL,   0,  1,  0,  0,  NULL),
(-1469043,  'Ah, the protective layer is nearly gone. Do you hear that, heroes? That... That is the sound of inevitability. Of your hopes and dreams being crushed under the weight of my being.',  NULL,   NULL,   'Ah, die Schutzschicht is bald aufgebrochen. Hört ihr das, Helden? Das ist der Klang der Unvermeidlichkeit. Der Klang eurer Hoffnungen und Träume, wie sie unter dem Gewicht meines Wesens zermalmt werden.',   '哎呀，保护层快没了。你们听到吗，英雄们？那个。。。那是你们逃不掉的声音，是你们的希望和梦想被我摧毁的声音。',   NULL,   NULL,   NULL,   NULL,   0,  1,  0,  0,  NULL),
(-1469044,  'Lord Victor Nefarius\'s laughter can once more be heard through the halls of Blackwing.',  NULL,   NULL,   'Lord Victor Nefarius\' Gelächter kann noch einmal durch die Hallen des Pechschwingenhortes gehört werden.',   '耐法里奥斯的笑声再次响彻这个黑翼大厅。',   NULL,   NULL,   NULL,   NULL,   0,  3,  0,  11, NULL),
(-1469045,  'The scepter shard is no more! Your beloved Kalimdor shall soon be a desolate wasteland. I will, of course, turn the Eastern Kingdoms into an ashen, lifeless void...', NULL,   NULL,   'Der Szeptersplitter ist nicht mehr! Euer beliebtes Kalimdor wird bald eine trostlose Wüste sein. Ich werde, natürlich, die Östlichen Königreiche zu Asche machen, zu einer leblosen Leere...',   '碎片不复存在了！你们挚爱的卡利姆多马上就会成为一块荒芜的废地。而我，当然了，就会把东部王国变成一片苍白的，毫无生气的空虚。。。',   NULL,   NULL,   NULL,   NULL,   0,  1,  0,  0,  'Nefarius\' Final Say on Scepter Run fail');

 
 
/* 
* 20170329193204_world.sql 
*/ 
INSERT INTO `migrations` VALUES ('20170329193204'); 

-- Make quest "Letter to Stormpike" require "Encrypted Letter" to be completed first.
UPDATE `quest_template` SET `PrevQuestId`=511 WHERE `entry`=514;
 
 
/* 
* 20170329195220_world.sql 
*/ 
INSERT INTO `migrations` VALUES ('20170329195220'); 

-- Fix completion text for quest "Beer Basted Boar Ribs".
UPDATE `quest_template` SET `OfferRewardText`='The Malt is brewed, the Boars are dead\r\nAnd before all is done and anything said\r\nWe will have to fight for first dibs\r\nOn these savory Beer Basted Boar Ribs!' WHERE `entry`=384;
 
 
/* 
* 20170330135457_world.sql 
*/ 
INSERT INTO `migrations` VALUES ('20170330135457');

-- Set blackout to only proc on shadow damage spells
DELETE FROM `spell_proc_event` WHERE `entry` IN (15268,15323,15324,15325,15326);
INSERT INTO `spell_proc_event` (`entry`,`SchoolMask`,`procFlags`) VALUES (15268,32,65536);
INSERT INTO `spell_proc_event` (`entry`,`SchoolMask`,`procFlags`) VALUES (15323,32,65536);
INSERT INTO `spell_proc_event` (`entry`,`SchoolMask`,`procFlags`) VALUES (15324,32,65536);
INSERT INTO `spell_proc_event` (`entry`,`SchoolMask`,`procFlags`) VALUES (15325,32,65536);
INSERT INTO `spell_proc_event` (`entry`,`SchoolMask`,`procFlags`) VALUES (15326,32,65536);
 
 
/* 
* 20170330162501_world.sql 
*/ 
INSERT INTO `migrations` VALUES ('20170330162501');

-- Changed from "may come.$b$bMac, as promised" to "may come.$b$b$N, as promised"
UPDATE `quest_template` SET `OfferRewardText` = 'Great Spirit Totem! This is dire news indeed. I must begin to plan for whatever may come.$b$b$N, as promised, here is your reward for your brave service.$b$b' WHERE `entry` = '5064' LIMIT 1;
 
 
/* 
* 20170330231749_world.sql 
*/ 
INSERT INTO `migrations` VALUES ('20170330231749');

-- Add new conditions for Red Scepter Shard and "From the Desk of Victor Nefarius"
-- Behaviour to be defined in blackwing_instance script
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`) VALUES
(55,    18, 469,    1),
(56,    18, 469,    2);


-- Make "From the Desk of Victor Nefarius" drop on a failed Scepter Run
UPDATE `creature_loot_template` SET `ChanceOrQuestChance` = 100, `condition_id` = 55 WHERE `entry` = 21142;
-- Make Red Scepter shard drop for only the Scepter Champion
UPDATE `creature_loot_template` SET `ChanceOrQuestChance` = 100, `condition_id` = 56 WHERE `entry` = 21138;
 
 
/* 
* 20170331035126_world.sql 
*/ 
INSERT INTO `migrations` VALUES ('20170331035126');

-- Stratholme postbox script
UPDATE gameobject_template SET ScriptName = 'go_stratholme_postbox' WHERE entry IN (176346,176352,176353,176350,176351,176349) 
 
/* 
* 20170331134352_world.sql 
*/ 
INSERT INTO `migrations` VALUES ('20170331134352');

-- Add April Fools event
INSERT INTO `game_event` (`entry`, `start_time`, `end_time`, `occurence`, `length`, `holiday`, `description`, `hardcoded`, `disabled`) VALUES
(77,    '2017-04-01 00:00:00',  '2022-04-03 00:00:00',  1,  999999999,  0,  'April Fools!', 0,  0);

-- Add condition referencing this event
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`) VALUES
(83,    12, 77, 0);

 
 
/* 
* 20170331165323_world.sql 
*/ 
INSERT INTO `migrations` VALUES ('20170331165323');

--  Allow horde to pick up the quest 'Hive in the Tower'
update quest_template set RequiredRaces = 0 where entry = 1126; 
 
 
/* 
* 20170331201306_world.sql 
*/ 
INSERT INTO `migrations` VALUES ('20170331201306');

-- Gromsblood spawn in Blasted Lands was spawning below the terrain
UPDATE gameobject SET position_z = 14.5 WHERE guid = 32304
 
 
/* 
* 20170331234934_world.sql 
*/ 
INSERT INTO `migrations` VALUES ('20170331234934'); 

-- Hide the buff from the Priest tier 2 set 8 piece bonus.
UPDATE `spell_mod` SET `SpellVisual`=0, `Comment`='Priest Tier 2 Set 8 Piece Bonus' WHERE `Id`=22010;

-- Hide the buff from the Mage tier 2 set 8 piece bonus.
INSERT INTO `spell_mod` (`Id`, `procChance`, `procFlags`, `procCharges`, `DurationIndex`, `Category`, `CastingTimeIndex`, `StackAmount`, `SpellIconID`, `activeIconID`, `manaCost`, `Attributes`, `AttributesEx`, `AttributesEx2`, `AttributesEx3`, `AttributesEx4`, `Custom`, `InterruptFlags`, `AuraInterruptFlags`, `ChannelInterruptFlags`, `Dispel`, `Stances`, `StancesNot`, `SpellVisual`, `ManaCostPercentage`, `StartRecoveryCategory`, `StartRecoveryTime`, `MaxAffectedTargets`, `MaxTargetLevel`, `DmgClass`, `rangeIndex`, `RecoveryTime`, `CategoryRecoveryTime`, `SpellFamilyName`, `SpellFamilyFlags`, `Comment`) VALUES (22007, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 0, -1, -1, -1, -1, -1, -1, 0, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 0, 'Mage Tier 2 Set 8 Piece Bonus');
 
 
/* 
* 20170402093309_world.sql 
*/ 
INSERT INTO migrations VALUES ('20170402093309');

# Update pinfo strings
UPDATE `mangos_string` SET `content_default`='%s %s%s %s (guid: %u) Account: %s (id: %u%s) GMLevel: %u Last IP: %s%s Last login: %s Latency: %ums Client: %s 2FA: %s' WHERE `entry`='616';
UPDATE `mangos_string` SET `content_default`='Played time: %s Level: %u Money: %ug%us%uc Money inbox: %ug%us%uc Money outbox: %ug%us%uc', `content_loc2`='Temps de jeu: %s Niveau: %u Argent: %ug%us%uc Money inbox: %ug%us%uc Money outbox: %ug%us%uc' WHERE `entry`='549';
 
 
/* 
* classicdb_updates.sql 
*/ 
 
 
