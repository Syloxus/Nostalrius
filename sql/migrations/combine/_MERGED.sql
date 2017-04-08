-- -------------------------------------------------------- 
-- 20170327030530_world.sql 
-- -------------------------------------------------------- 
INSERT INTO `migrations` VALUES ('20170327030530');
-- Add the npc_text connecion to the npc_gossip for Archmage Xylem
INSERT INTO `npc_gossip` (`npc_guid`,`textid`) VALUES (35886,8379) ON DUPLICATE KEY UPDATE npc_guid = npc_guid;
-- Combine the bitfields to allow for gossip and Xylem to be a quest giver
UPDATE `creature_template` SET `npcflag` = 3 WHERE `entry`=8379;
 
 
-- -------------------------------------------------------- 
-- 20170328092010_world.sql 
-- -------------------------------------------------------- 
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
 
-- -------------------------------------------------------- 
-- 20170328190610_world.sql 
-- -------------------------------------------------------- 
INSERT INTO `migrations` VALUES ('20170328190610'); 

-- Warchief's Blessing event texts
INSERT INTO creature_ai_texts (entry, content_default, `comment`) VALUES (-143961, 'Honor your heroes! On this day, they have dealt a great blow against one of our most hated enemies! The false Warchief, Rend Blackhand, has fallen!', 'warchief blessing yell1');
INSERT INTO creature_ai_texts (entry, content_default, `comment`) VALUES (-143962, 'Be bathed in my power! Drink in my might! Battle for the glory of the Horde!', 'warchief blessing yell2');
INSERT INTO creature_ai_texts (entry, content_default, `comment`) VALUES (-143963, 'Be bathed in the power of the Warchief! Drink in his might! Battle for the glory of the Horde!', 'warchief blessing yell3');
INSERT INTO creature_template (entry, modelid_1, name, minhealth, maxhealth, armor, faction_A, faction_H, mindmg, maxdmg, attackpower, baseattacktime, rangeattacktime, unit_class, unit_flags, `type`, flags_extra) VALUES (21003, 13069, 'Warchief Blessing Generator', 8, 8, 7, 85, 85, 2, 2, 44, 2000, 2000, 1, 33554946, 10, 2);
 
 
-- -------------------------------------------------------- 
-- 20170328191528_world.sql 
-- -------------------------------------------------------- 
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
 
 
-- -------------------------------------------------------- 
-- 20170329135352_world.sql 
-- -------------------------------------------------------- 
INSERT INTO `migrations` VALUES ('20170329135352'); 

-- Makes it so the self buff proc from the Bloodfang set cannot be dodged or parried.
INSERT INTO `spell_mod` (`Id`, `procChance`, `procFlags`, `procCharges`, `DurationIndex`, `Category`, `CastingTimeIndex`, `StackAmount`, `SpellIconID`, `activeIconID`, `manaCost`, `Attributes`, `AttributesEx`, `AttributesEx2`, `AttributesEx3`, `AttributesEx4`, `Custom`, `InterruptFlags`, `AuraInterruptFlags`, `ChannelInterruptFlags`, `Dispel`, `Stances`, `StancesNot`, `SpellVisual`, `ManaCostPercentage`, `StartRecoveryCategory`, `StartRecoveryTime`, `MaxAffectedTargets`, `MaxTargetLevel`, `DmgClass`, `rangeIndex`, `RecoveryTime`, `CategoryRecoveryTime`, `SpellFamilyName`, `SpellFamilyFlags`, `Comment`) VALUES (23580, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 2097152, -1, -1, -1, -1, 0, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 0, 'Bloodfang proc (8/8 rogue Tier 2) self buff');
 
 
-- -------------------------------------------------------- 
-- 20170329190835_world.sql 
-- -------------------------------------------------------- 
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

 
 
-- -------------------------------------------------------- 
-- 20170329193204_world.sql 
-- -------------------------------------------------------- 
INSERT INTO `migrations` VALUES ('20170329193204'); 

-- Make quest "Letter to Stormpike" require "Encrypted Letter" to be completed first.
UPDATE `quest_template` SET `PrevQuestId`=511 WHERE `entry`=514;
 
 
-- -------------------------------------------------------- 
-- 20170329195220_world.sql 
-- -------------------------------------------------------- 
INSERT INTO `migrations` VALUES ('20170329195220'); 

-- Fix completion text for quest "Beer Basted Boar Ribs".
UPDATE `quest_template` SET `OfferRewardText`='The Malt is brewed, the Boars are dead\r\nAnd before all is done and anything said\r\nWe will have to fight for first dibs\r\nOn these savory Beer Basted Boar Ribs!' WHERE `entry`=384;
 
 
-- -------------------------------------------------------- 
-- 20170330135457_world.sql 
-- -------------------------------------------------------- 
INSERT INTO `migrations` VALUES ('20170330135457');

-- Set blackout to only proc on shadow damage spells
DELETE FROM `spell_proc_event` WHERE `entry` IN (15268,15323,15324,15325,15326);
INSERT INTO `spell_proc_event` (`entry`,`SchoolMask`,`procFlags`) VALUES (15268,32,65536);
INSERT INTO `spell_proc_event` (`entry`,`SchoolMask`,`procFlags`) VALUES (15323,32,65536);
INSERT INTO `spell_proc_event` (`entry`,`SchoolMask`,`procFlags`) VALUES (15324,32,65536);
INSERT INTO `spell_proc_event` (`entry`,`SchoolMask`,`procFlags`) VALUES (15325,32,65536);
INSERT INTO `spell_proc_event` (`entry`,`SchoolMask`,`procFlags`) VALUES (15326,32,65536);
 
 
-- -------------------------------------------------------- 
-- 20170330162501_world.sql 
-- -------------------------------------------------------- 
INSERT INTO `migrations` VALUES ('20170330162501');

-- Changed from "may come.$b$bMac, as promised" to "may come.$b$b$N, as promised"
UPDATE `quest_template` SET `OfferRewardText` = 'Great Spirit Totem! This is dire news indeed. I must begin to plan for whatever may come.$b$b$N, as promised, here is your reward for your brave service.$b$b' WHERE `entry` = '5064' LIMIT 1;
 
 
-- -------------------------------------------------------- 
-- 20170330231749_world.sql 
-- -------------------------------------------------------- 
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
 
 
-- -------------------------------------------------------- 
-- 20170331035126_world.sql 
-- -------------------------------------------------------- 
INSERT INTO `migrations` VALUES ('20170331035126');

-- Stratholme postbox script
UPDATE gameobject_template SET ScriptName = 'go_stratholme_postbox' WHERE entry IN (176346,176352,176353,176350,176351,176349) 
 
-- -------------------------------------------------------- 
-- 20170331134352_world.sql 
-- -------------------------------------------------------- 
INSERT INTO `migrations` VALUES ('20170331134352');

-- Add April Fools event
INSERT INTO `game_event` (`entry`, `start_time`, `end_time`, `occurence`, `length`, `holiday`, `description`, `hardcoded`, `disabled`) VALUES
(77,    '2017-04-01 00:00:00',  '2022-04-03 00:00:00',  1,  999999999,  0,  'April Fools!', 0,  0);

-- Add condition referencing this event
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`) VALUES
(83,    12, 77, 0);

 
 
-- -------------------------------------------------------- 
-- 20170331165323_world.sql 
-- -------------------------------------------------------- 
INSERT INTO `migrations` VALUES ('20170331165323');

--  Allow horde to pick up the quest 'Hive in the Tower'
update quest_template set RequiredRaces = 0 where entry = 1126; 
 
 
-- -------------------------------------------------------- 
-- 20170331201306_world.sql 
-- -------------------------------------------------------- 
INSERT INTO `migrations` VALUES ('20170331201306');

-- Gromsblood spawn in Blasted Lands was spawning below the terrain
UPDATE gameobject SET position_z = 14.5 WHERE guid = 32304
 
 
-- -------------------------------------------------------- 
-- 20170331234934_world.sql 
-- -------------------------------------------------------- 
INSERT INTO `migrations` VALUES ('20170331234934'); 

-- Hide the buff from the Priest tier 2 set 8 piece bonus.
UPDATE `spell_mod` SET `SpellVisual`=0, `Comment`='Priest Tier 2 Set 8 Piece Bonus' WHERE `Id`=22010;

-- Hide the buff from the Mage tier 2 set 8 piece bonus.
INSERT INTO `spell_mod` (`Id`, `procChance`, `procFlags`, `procCharges`, `DurationIndex`, `Category`, `CastingTimeIndex`, `StackAmount`, `SpellIconID`, `activeIconID`, `manaCost`, `Attributes`, `AttributesEx`, `AttributesEx2`, `AttributesEx3`, `AttributesEx4`, `Custom`, `InterruptFlags`, `AuraInterruptFlags`, `ChannelInterruptFlags`, `Dispel`, `Stances`, `StancesNot`, `SpellVisual`, `ManaCostPercentage`, `StartRecoveryCategory`, `StartRecoveryTime`, `MaxAffectedTargets`, `MaxTargetLevel`, `DmgClass`, `rangeIndex`, `RecoveryTime`, `CategoryRecoveryTime`, `SpellFamilyName`, `SpellFamilyFlags`, `Comment`) VALUES (22007, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 0, -1, -1, -1, -1, -1, -1, 0, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 0, 'Mage Tier 2 Set 8 Piece Bonus');
 
 
-- -------------------------------------------------------- 
-- 20170402093309_world.sql 
-- -------------------------------------------------------- 
# Update pinfo strings
UPDATE `mangos_string` SET `content_default`='%s %s%s %s (guid: %u) Account: %s (id: %u%s) GMLevel: %u Last IP: %s%s Last login: %s Latency: %ums Client: %s 2FA: %s' WHERE `entry`='616';
UPDATE `mangos_string` SET `content_default`='Played time: %s Level: %u Money: %ug%us%uc Money inbox: %ug%us%uc Money outbox: %ug%us%uc', `content_loc2`='Temps de jeu: %s Niveau: %u Argent: %ug%us%uc Money inbox: %ug%us%uc Money outbox: %ug%us%uc' WHERE `entry`='549';
 
 
-- -------------------------------------------------------- 
-- _MERGED.sql 
-- -------------------------------------------------------- 
 
 
