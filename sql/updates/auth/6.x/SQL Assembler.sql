UPDATE `updates` SET `state`='ARCHIVED';
UPDATE `realmlist` SET `gamebuild`=21463 WHERE `gamebuild`=21355;

ALTER TABLE `realmlist` CHANGE `gamebuild` `gamebuild` int(10) unsigned NOT NULL DEFAULT '21463';
UPDATE `rbac_permissions` SET `name`='Command: disable add criteria' WHERE `id`=350;
UPDATE `rbac_permissions` SET `name`='Command: disable remove criteria' WHERE `id`=359;
UPDATE `rbac_permissions` SET `name`='Command: reload criteria_data' WHERE `id`=609;
UPDATE `realmlist` SET `gamebuild`=21742 WHERE `gamebuild`=21463;

ALTER TABLE `realmlist` CHANGE `gamebuild` `gamebuild` int(10) unsigned NOT NULL DEFAULT '21742';
--
-- Table structure for table `battlenet_item_appearances`
--
DROP TABLE IF EXISTS `battlenet_item_appearances`;
CREATE TABLE `battlenet_item_appearances` (
  `battlenetAccountId` int(10) unsigned NOT NULL,
  `blobIndex` smallint(5) unsigned NOT NULL,
  `appearanceMask` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`battlenetAccountId`,`blobIndex`),
  CONSTRAINT `fk_battlenet_item_appearances` FOREIGN KEY (`battlenetAccountId`) REFERENCES `battlenet_accounts` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `battlenet_item_favorite_appearances`
--
DROP TABLE IF EXISTS `battlenet_item_favorite_appearances`;
CREATE TABLE `battlenet_item_favorite_appearances` (
  `battlenetAccountId` int(10) unsigned NOT NULL,
  `itemModifiedAppearanceId` int(10) unsigned NOT NULL,
  PRIMARY KEY (`battlenetAccountId`,`itemModifiedAppearanceId`),
  CONSTRAINT `fk_battlenet_item_favorite_appearances` FOREIGN KEY (`battlenetAccountId`) REFERENCES `battlenet_accounts` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
UPDATE `realmlist` SET `gamebuild`=22248 WHERE `gamebuild`=21742;

ALTER TABLE `realmlist` CHANGE `gamebuild` `gamebuild` int(10) unsigned NOT NULL DEFAULT '22248';
UPDATE `realmlist` SET `gamebuild`=22293 WHERE `gamebuild`=22248;

ALTER TABLE `realmlist` CHANGE `gamebuild` `gamebuild` int(10) unsigned NOT NULL DEFAULT '22293';
DELETE FROM `rbac_permissions` WHERE `id`= 12;
INSERT INTO `rbac_permissions` (`id`,`name`) VALUES
(12,'Skip character creation demon hunter min level check');

DELETE FROM `rbac_linked_permissions` WHERE `linkedId`= 12;
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
(194, 12);
