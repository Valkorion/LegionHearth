UPDATE `updates` SET `state`='ARCHIVED';
ALTER TABLE `creature_display_info` CHANGE `Unknown620` `PlayerModelScale` float NOT NULL DEFAULT '0';
ALTER TABLE `battle_pet_species_locale`
  CHANGE `SourceText` `SourceText_lang` text,
  CHANGE `Description` `Description_lang` text;

ALTER TABLE `creature_display_info_locale`
  CHANGE `TextureVariation_lang1` `TextureVariation1_lang` text,
  CHANGE `TextureVariation_lang2` `TextureVariation2_lang` text,
  CHANGE `TextureVariation_lang3` `TextureVariation3_lang` text;

ALTER TABLE `gameobjects` CHANGE `Data7` `Data8` int(10) NOT NULL DEFAULT '0' AFTER `Data6`;
ALTER TABLE `gameobjects` CHANGE `Data6` `Data7` int(10) NOT NULL DEFAULT '0' AFTER `Data5`;
ALTER TABLE `gameobjects` CHANGE `Data5` `Data6` int(10) NOT NULL DEFAULT '0' AFTER `Data4`;
ALTER TABLE `gameobjects` CHANGE `Data4` `Data5` int(10) NOT NULL DEFAULT '0' AFTER `Data3`;
ALTER TABLE `gameobjects` CHANGE `Data3` `Data4` int(10) NOT NULL DEFAULT '0' AFTER `Data2`;
ALTER TABLE `gameobjects` CHANGE `Data2` `Data3` int(10) NOT NULL DEFAULT '0' AFTER `Data1`;
ALTER TABLE `gameobjects` CHANGE `Data1` `Data2` int(10) NOT NULL DEFAULT '0' AFTER `Data0`;
ALTER TABLE `gameobjects` CHANGE `Data0` `Data1` int(10) NOT NULL DEFAULT '0' AFTER `Type`;

ALTER TABLE `phase_group` RENAME `phase_x_phase_group`;
--
-- Table structure for table `spell_procs_per_minute`
--

DROP TABLE IF EXISTS `spell_procs_per_minute`;
CREATE TABLE `spell_procs_per_minute` (
  `ID` int(10) unsigned NOT NULL DEFAULT '0',
  `BaseProcRate` float NOT NULL DEFAULT '0',
  `Flags` int(10) unsigned NOT NULL DEFAULT '0',
  `VerifiedBuild` smallint(6) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Table structure for table `spell_procs_per_minute_mod`
--
DROP TABLE IF EXISTS `spell_procs_per_minute_mod`;
CREATE TABLE `spell_procs_per_minute_mod` (
  `ID` int(10) unsigned NOT NULL DEFAULT '0',
  `Type` int(10) unsigned NOT NULL DEFAULT '0',
  `Param` int(10) unsigned NOT NULL DEFAULT '0',
  `Coeff` float NOT NULL DEFAULT '0',
  `SpellProcsPerMinuteID` int(10) unsigned NOT NULL DEFAULT '0',
  `VerifiedBuild` smallint(6) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
--
-- Table structure for table `item_upgrade`
--
DROP TABLE IF EXISTS `item_upgrade`;
CREATE TABLE `item_upgrade` (
  `ID` int(10) unsigned NOT NULL DEFAULT '0',
  `ItemUpgradePathID` int(10) unsigned NOT NULL DEFAULT '0',
  `ItemLevelBonus` int(10) unsigned NOT NULL DEFAULT '0',
  `PrevItemUpgradeID` int(10) unsigned NOT NULL DEFAULT '0',
  `CurrencyID` int(10) unsigned NOT NULL DEFAULT '0',
  `CurrencyCost` int(10) unsigned NOT NULL DEFAULT '0',
  `VerifiedBuild` smallint(6) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Table structure for table `ruleset_item_upgrade`
--
DROP TABLE IF EXISTS `ruleset_item_upgrade`;
CREATE TABLE `ruleset_item_upgrade` (
  `ID` int(10) unsigned NOT NULL DEFAULT '0',
  `RulesetID` int(10) unsigned NOT NULL DEFAULT '0',
  `ItemUpgradeID` int(10) unsigned NOT NULL DEFAULT '0',
  `ItemID` int(10) unsigned NOT NULL DEFAULT '0',
  `VerifiedBuild` smallint(6) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
--
-- Table structure for table `achievement`
--
ALTER TABLE `achievement`
  MODIFY `Title` text AFTER `ID`,
  MODIFY `Description` text AFTER `Title`,
  MODIFY `Flags` int(10) unsigned NOT NULL DEFAULT '0' AFTER `Description`,
  MODIFY `Reward` text AFTER `Flags`,
  MODIFY `MapID` smallint(6) NOT NULL DEFAULT '0' AFTER `Reward`,
  MODIFY `Supercedes` smallint(5) unsigned NOT NULL DEFAULT '0' AFTER `MapID`,
  MODIFY `Category` smallint(5) unsigned NOT NULL DEFAULT '0' AFTER `Supercedes`,
  MODIFY `UIOrder` smallint(5) unsigned NOT NULL DEFAULT '0' AFTER `Category`,
  MODIFY `IconID` smallint(5) unsigned NOT NULL DEFAULT '0' AFTER `UIOrder`,
  MODIFY `SharesCriteria` smallint(5) unsigned NOT NULL DEFAULT '0' AFTER `IconID`,
  MODIFY `CriteriaTree` smallint(5) unsigned NOT NULL DEFAULT '0' AFTER `SharesCriteria`,
  MODIFY `Faction` tinyint(4) NOT NULL DEFAULT '0' AFTER `CriteriaTree`,
  MODIFY `Points` tinyint(3) unsigned NOT NULL DEFAULT '0' AFTER `Faction`,
  MODIFY `MinimumCriteria` tinyint(3) unsigned NOT NULL DEFAULT '0' AFTER `Points`;

--
-- Table structure for table `anim_kit`
--
DROP TABLE IF EXISTS `anim_kit`;
CREATE TABLE `anim_kit` (
  `ID` int(10) unsigned NOT NULL DEFAULT '0',
  `OneShotDuration` int(10) unsigned NOT NULL DEFAULT '0',
  `OneShotStopAnimKitID` smallint(5) unsigned NOT NULL DEFAULT '0',
  `LowDefAnimKitID` smallint(5) unsigned NOT NULL DEFAULT '0',
  `VerifiedBuild` smallint(6) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Table structure for table `area_group_member`
--
ALTER TABLE `area_group_member`
  MODIFY `AreaGroupID` smallint(5) unsigned NOT NULL DEFAULT '0' AFTER `ID`,
  MODIFY `AreaID` smallint(5) unsigned NOT NULL DEFAULT '0' AFTER `AreaGroupID`;

--
-- Table structure for table `armor_location`
--
DROP TABLE IF EXISTS `armor_location`;
CREATE TABLE `armor_location` (
  `ID` int(10) unsigned NOT NULL DEFAULT '0',
  `Modifier1` float NOT NULL DEFAULT '0',
  `Modifier2` float NOT NULL DEFAULT '0',
  `Modifier3` float NOT NULL DEFAULT '0',
  `Modifier4` float NOT NULL DEFAULT '0',
  `Modifier5` float NOT NULL DEFAULT '0',
  `VerifiedBuild` smallint(6) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Table structure for table `auction_house`
--
ALTER TABLE `auction_house`
  MODIFY `Name` text AFTER `ID`,
  MODIFY `FactionID` smallint(5) unsigned NOT NULL DEFAULT '0' AFTER `Name`,
  MODIFY `DepositRate` tinyint(3) unsigned NOT NULL DEFAULT '0' AFTER `FactionID`,
  MODIFY `ConsignmentRate` tinyint(3) unsigned NOT NULL DEFAULT '0' AFTER `DepositRate`;

--
-- Table structure for table `bank_bag_slot_prices`
--
DROP TABLE IF EXISTS `bank_bag_slot_prices`;
CREATE TABLE `bank_bag_slot_prices` (
  `ID` int(10) unsigned NOT NULL DEFAULT '0',
  `Cost` int(10) unsigned NOT NULL DEFAULT '0',
  `VerifiedBuild` smallint(6) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Table structure for table `barber_shop_style`
--
ALTER TABLE `barber_shop_style`
  MODIFY `DisplayName` text AFTER `ID`,
  MODIFY `Description` text AFTER `DisplayName`,
  MODIFY `CostModifier` float NOT NULL DEFAULT '0' AFTER `Description`,
  MODIFY `Type` tinyint(3) unsigned NOT NULL DEFAULT '0' AFTER `CostModifier`,
  MODIFY `Race` tinyint(3) unsigned NOT NULL DEFAULT '0' AFTER `Type`,
  MODIFY `Sex` tinyint(3) unsigned NOT NULL DEFAULT '0' AFTER `Race`,
  MODIFY `Data` tinyint(3) unsigned NOT NULL DEFAULT '0' AFTER `Sex`;

--
-- Table structure for table `battle_pet_breed_quality`
--
ALTER TABLE `battle_pet_breed_quality`
  MODIFY `Modifier` float NOT NULL DEFAULT '0' AFTER `ID`,
  MODIFY `Quality` tinyint(3) unsigned NOT NULL DEFAULT '0' AFTER `Modifier`;

--
-- Table structure for table `battle_pet_breed_state`
--
ALTER TABLE `battle_pet_breed_state`
  MODIFY `Value` smallint(6) NOT NULL DEFAULT '0' AFTER `ID`,
  MODIFY `BreedID` tinyint(3) unsigned NOT NULL DEFAULT '0' AFTER `Value`,
  MODIFY `State` tinyint(3) unsigned NOT NULL DEFAULT '0' AFTER `BreedID`;

--
-- Table structure for table `battle_pet_species`
--
ALTER TABLE `battle_pet_species`
  MODIFY `SourceText` text AFTER `SummonSpellID`,
  MODIFY `Description` text AFTER `SourceText`,
  MODIFY `Flags` smallint(5) unsigned NOT NULL DEFAULT '0' AFTER `Description`,
  MODIFY `PetType` tinyint(3) unsigned NOT NULL DEFAULT '0' AFTER `Flags`,
  MODIFY `Source` tinyint(4) NOT NULL DEFAULT '0' AFTER `PetType`;

--
-- Table structure for table `battle_pet_species_state`
--
ALTER TABLE `battle_pet_species_state`
  MODIFY `Value` int(11) NOT NULL DEFAULT '0' AFTER `ID`,
  MODIFY `SpeciesID` smallint(5) unsigned NOT NULL DEFAULT '0' AFTER `Value`,
  MODIFY `State` tinyint(3) unsigned NOT NULL DEFAULT '0' AFTER `SpeciesID`;

--
-- Table structure for table `broadcast_text`
--
ALTER TABLE `broadcast_text`
  MODIFY `MaleText` text AFTER `ID`,
  MODIFY `FemaleText` text AFTER `MaleText`,
  MODIFY `EmoteID1` smallint(5) unsigned NOT NULL DEFAULT '0' AFTER `FemaleText`,
  MODIFY `EmoteID2` smallint(5) unsigned NOT NULL DEFAULT '0' AFTER `EmoteID1`,
  MODIFY `EmoteID3` smallint(5) unsigned NOT NULL DEFAULT '0' AFTER `EmoteID2`,
  MODIFY `EmoteDelay1` smallint(5) unsigned NOT NULL DEFAULT '0' AFTER `EmoteID3`,
  MODIFY `EmoteDelay2` smallint(5) unsigned NOT NULL DEFAULT '0' AFTER `EmoteDelay1`,
  MODIFY `EmoteDelay3` smallint(5) unsigned NOT NULL DEFAULT '0' AFTER `EmoteDelay2`,
  MODIFY `SoundID` smallint(5) unsigned NOT NULL DEFAULT '0' AFTER `EmoteDelay3`,
  MODIFY `UnkEmoteID` smallint(5) unsigned NOT NULL DEFAULT '0' AFTER `SoundID`,
  MODIFY `Language` tinyint(3) unsigned NOT NULL DEFAULT '0' AFTER `UnkEmoteID`,
  MODIFY `Type` tinyint(3) unsigned NOT NULL DEFAULT '0' AFTER `Language`,
  MODIFY `VerifiedBuild` smallint(6) NOT NULL DEFAULT '0' AFTER `Type`;

--
-- Table structure for table `char_start_outfit`
--
ALTER TABLE `char_start_outfit`
  MODIFY `ItemID1` int(11) NOT NULL DEFAULT '0' AFTER `ID`,
  MODIFY `ItemID2` int(11) NOT NULL DEFAULT '0' AFTER `ItemID1`,
  MODIFY `ItemID3` int(11) NOT NULL DEFAULT '0' AFTER `ItemID2`,
  MODIFY `ItemID4` int(11) NOT NULL DEFAULT '0' AFTER `ItemID3`,
  MODIFY `ItemID5` int(11) NOT NULL DEFAULT '0' AFTER `ItemID4`,
  MODIFY `ItemID6` int(11) NOT NULL DEFAULT '0' AFTER `ItemID5`,
  MODIFY `ItemID7` int(11) NOT NULL DEFAULT '0' AFTER `ItemID6`,
  MODIFY `ItemID8` int(11) NOT NULL DEFAULT '0' AFTER `ItemID7`,
  MODIFY `ItemID9` int(11) NOT NULL DEFAULT '0' AFTER `ItemID8`,
  MODIFY `ItemID10` int(11) NOT NULL DEFAULT '0' AFTER `ItemID9`,
  MODIFY `ItemID11` int(11) NOT NULL DEFAULT '0' AFTER `ItemID10`,
  MODIFY `ItemID12` int(11) NOT NULL DEFAULT '0' AFTER `ItemID11`,
  MODIFY `ItemID13` int(11) NOT NULL DEFAULT '0' AFTER `ItemID12`,
  MODIFY `ItemID14` int(11) NOT NULL DEFAULT '0' AFTER `ItemID13`,
  MODIFY `ItemID15` int(11) NOT NULL DEFAULT '0' AFTER `ItemID14`,
  MODIFY `ItemID16` int(11) NOT NULL DEFAULT '0' AFTER `ItemID15`,
  MODIFY `ItemID17` int(11) NOT NULL DEFAULT '0' AFTER `ItemID16`,
  MODIFY `ItemID18` int(11) NOT NULL DEFAULT '0' AFTER `ItemID17`,
  MODIFY `ItemID19` int(11) NOT NULL DEFAULT '0' AFTER `ItemID18`,
  MODIFY `ItemID20` int(11) NOT NULL DEFAULT '0' AFTER `ItemID19`,
  MODIFY `ItemID21` int(11) NOT NULL DEFAULT '0' AFTER `ItemID20`,
  MODIFY `ItemID22` int(11) NOT NULL DEFAULT '0' AFTER `ItemID21`,
  MODIFY `ItemID23` int(11) NOT NULL DEFAULT '0' AFTER `ItemID22`,
  MODIFY `ItemID24` int(11) NOT NULL DEFAULT '0' AFTER `ItemID23`,
  MODIFY `PetDisplayID` int(10) unsigned NOT NULL DEFAULT '0' AFTER `ItemID24`,
  MODIFY `PetFamilyID` tinyint(3) unsigned NOT NULL DEFAULT '0' AFTER `OutfitID`;

--
-- Table structure for table `chr_classes_x_power_types`
--
ALTER TABLE `chr_classes_x_power_types`
  MODIFY `ClassID` tinyint(3) unsigned NOT NULL DEFAULT '0' AFTER `ID`,
  MODIFY `PowerType` tinyint(3) unsigned NOT NULL DEFAULT '0' AFTER `ClassID`;

--
-- Table structure for table `chr_races`
--
DROP TABLE IF EXISTS `chr_races`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `chr_races` (
  `ID` int(10) unsigned NOT NULL DEFAULT '0',
  `Flags` int(10) unsigned NOT NULL DEFAULT '0',
  `ClientPrefix` text,
  `ClientFileString` text,
  `Name` text,
  `NameFemale` text,
  `NameMale` text,
  `FacialHairCustomization1` text,
  `FacialHairCustomization2` text,
  `HairCustomization` text,
  `CreateScreenFileDataID` int(10) unsigned NOT NULL DEFAULT '0',
  `SelectScreenFileDataID` int(10) unsigned NOT NULL DEFAULT '0',
  `MaleCustomizeOffset1` float NOT NULL DEFAULT '0',
  `MaleCustomizeOffset2` float NOT NULL DEFAULT '0',
  `MaleCustomizeOffset3` float NOT NULL DEFAULT '0',
  `FemaleCustomizeOffset1` float NOT NULL DEFAULT '0',
  `FemaleCustomizeOffset2` float NOT NULL DEFAULT '0',
  `FemaleCustomizeOffset3` float NOT NULL DEFAULT '0',
  `LowResScreenFileDataID` int(10) unsigned NOT NULL DEFAULT '0',
  `FactionID` smallint(5) unsigned NOT NULL DEFAULT '0',
  `ExplorationSoundID` smallint(5) unsigned NOT NULL DEFAULT '0',
  `MaleDisplayID` smallint(5) unsigned NOT NULL DEFAULT '0',
  `FemaleDisplayID` smallint(5) unsigned NOT NULL DEFAULT '0',
  `ResSicknessSpellID` smallint(5) unsigned NOT NULL DEFAULT '0',
  `SplashSoundID` smallint(5) unsigned NOT NULL DEFAULT '0',
  `CinematicSequenceID` smallint(5) unsigned NOT NULL DEFAULT '0',
  `UAMaleCreatureSoundDataID` smallint(5) unsigned NOT NULL DEFAULT '0',
  `UAFemaleCreatureSoundDataID` smallint(5) unsigned NOT NULL DEFAULT '0',
  `HighResMaleDisplayID` smallint(5) unsigned NOT NULL DEFAULT '0',
  `HighResFemaleDisplayID` smallint(5) unsigned NOT NULL DEFAULT '0',
  `Unk` smallint(5) unsigned NOT NULL DEFAULT '0',
  `BaseLanguage` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `CreatureType` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `TeamID` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `RaceRelated` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `UnalteredVisualRaceID` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `CharComponentTextureLayoutID` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `DefaultClassID` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `NeutralRaceID` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `CharComponentTexLayoutHiResID` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `VerifiedBuild` smallint(6) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Table structure for table `chr_races_locale`
--
DROP TABLE IF EXISTS `chr_races_locale`;
CREATE TABLE `chr_races_locale` (
  `ID` int(10) unsigned NOT NULL DEFAULT '0',
  `locale` varchar(4) NOT NULL,
  `Name_lang` text,
  `NameFemale_lang` text,
  `NameMale_lang` text,
  `VerifiedBuild` smallint(6) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`locale`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


--
-- Table structure for table `cinematic_sequences`
--
ALTER TABLE `cinematic_sequences`
  MODIFY `SoundID` smallint(5) unsigned NOT NULL DEFAULT '0' AFTER `ID`,
  MODIFY `Camera1` smallint(5) unsigned NOT NULL DEFAULT '0' AFTER `SoundID`,
  MODIFY `Camera2` smallint(5) unsigned NOT NULL DEFAULT '0' AFTER `Camera1`,
  MODIFY `Camera3` smallint(5) unsigned NOT NULL DEFAULT '0' AFTER `Camera2`,
  MODIFY `Camera4` smallint(5) unsigned NOT NULL DEFAULT '0' AFTER `Camera3`,
  MODIFY `Camera5` smallint(5) unsigned NOT NULL DEFAULT '0' AFTER `Camera4`,
  MODIFY `Camera6` smallint(5) unsigned NOT NULL DEFAULT '0' AFTER `Camera5`,
  MODIFY `Camera7` smallint(5) unsigned NOT NULL DEFAULT '0' AFTER `Camera6`,
  MODIFY `Camera8` smallint(5) unsigned NOT NULL DEFAULT '0' AFTER `Camera7`;

--
-- Table structure for table `creature_display_info`
--
ALTER TABLE `creature_display_info`
  MODIFY `ExtendedDisplayInfoID` int(10) unsigned NOT NULL DEFAULT '0' AFTER `ID`,
  MODIFY `CreatureModelScale` float NOT NULL DEFAULT '0' AFTER `ExtendedDisplayInfoID`,
  MODIFY `PlayerModelScale` float NOT NULL DEFAULT '0' AFTER `CreatureModelScale`,
  DROP `TextureVariation1`,
  DROP `TextureVariation2`,
  DROP `TextureVariation3`,
  MODIFY `PortraitTextureName` text AFTER `PlayerModelScale`,
  MODIFY `PortraitCreatureDisplayInfoID` int(10) unsigned NOT NULL DEFAULT '0' AFTER `PortraitTextureName`,
  MODIFY `CreatureGeosetData` int(10) unsigned NOT NULL DEFAULT '0' AFTER `PortraitCreatureDisplayInfoID`,
  MODIFY `StateSpellVisualKitID` int(10) unsigned NOT NULL DEFAULT '0' AFTER `CreatureGeosetData`,
  MODIFY `ModelID` smallint(5) unsigned NOT NULL DEFAULT '0' AFTER `StateSpellVisualKitID`,
  MODIFY `SoundID` smallint(5) unsigned NOT NULL DEFAULT '0' AFTER `ModelID`,
  MODIFY `NPCSoundID` smallint(5) unsigned NOT NULL DEFAULT '0' AFTER `SoundID`,
  MODIFY `ParticleColorID` smallint(5) unsigned NOT NULL DEFAULT '0' AFTER `NPCSoundID`,
  MODIFY `ObjectEffectPackageID` smallint(5) unsigned NOT NULL DEFAULT '0' AFTER `ParticleColorID`,
  MODIFY `AnimReplacementSetID` smallint(5) unsigned NOT NULL DEFAULT '0' AFTER `ObjectEffectPackageID`,
  MODIFY `CreatureModelAlpha` tinyint(3) unsigned NOT NULL DEFAULT '0' AFTER `AnimReplacementSetID`,
  MODIFY `SizeClass` tinyint(3) unsigned NOT NULL DEFAULT '0' AFTER `CreatureModelAlpha`,
  MODIFY `BloodID` tinyint(3) unsigned NOT NULL DEFAULT '0' AFTER `SizeClass`,
  MODIFY `Flags` tinyint(3) unsigned NOT NULL DEFAULT '0' AFTER `BloodID`,
  MODIFY `Gender` tinyint(4) NOT NULL DEFAULT '0' AFTER `Flags`,
  ADD `Unk700` tinyint(4) NOT NULL DEFAULT '0' AFTER `Gender`;

ALTER TABLE `creature_display_info`
  ADD `TextureVariation1` int(10) unsigned NOT NULL DEFAULT '0' AFTER `PlayerModelScale`,
  ADD `TextureVariation2` int(10) unsigned NOT NULL DEFAULT '0' AFTER `TextureVariation1`,
  ADD `TextureVariation3` int(10) unsigned NOT NULL DEFAULT '0' AFTER `TextureVariation2`;

--
-- Table structure for table `creature_display_info_extra`
--
DROP TABLE IF EXISTS `creature_display_info_extra`;
CREATE TABLE `creature_display_info_extra` (
  `ID` int(10) unsigned NOT NULL DEFAULT '0',
  `NPCItemDisplay1` int(10) unsigned NOT NULL DEFAULT '0',
  `NPCItemDisplay2` int(10) unsigned NOT NULL DEFAULT '0',
  `NPCItemDisplay3` int(10) unsigned NOT NULL DEFAULT '0',
  `NPCItemDisplay4` int(10) unsigned NOT NULL DEFAULT '0',
  `NPCItemDisplay5` int(10) unsigned NOT NULL DEFAULT '0',
  `NPCItemDisplay6` int(10) unsigned NOT NULL DEFAULT '0',
  `NPCItemDisplay7` int(10) unsigned NOT NULL DEFAULT '0',
  `NPCItemDisplay8` int(10) unsigned NOT NULL DEFAULT '0',
  `NPCItemDisplay9` int(10) unsigned NOT NULL DEFAULT '0',
  `NPCItemDisplay10` int(10) unsigned NOT NULL DEFAULT '0',
  `FileDataID` int(10) unsigned NOT NULL DEFAULT '0',
  `HDFileDataID` int(10) unsigned NOT NULL DEFAULT '0',
  `DisplayRaceID` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `DisplaySexID` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `DisplayClassID` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `SkinID` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `FaceID` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `HairStyleID` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `HairColorID` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `FacialHairID` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `CustomDisplayOption1` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `CustomDisplayOption2` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `CustomDisplayOption3` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `Flags` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `VerifiedBuild` smallint(6) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Table structure for table `creature_type`
--
ALTER TABLE `creature_type` MODIFY `Flags` tinyint(3) unsigned NOT NULL DEFAULT '0' AFTER `Name`;

--
-- Table structure for table `criteria`
--
ALTER TABLE `criteria`
  MODIFY `Asset` int(10) unsigned NOT NULL DEFAULT '0' AFTER `ID`,
  MODIFY `StartAsset` int(10) unsigned NOT NULL DEFAULT '0' AFTER `Asset`,
  MODIFY `FailAsset` int(10) unsigned NOT NULL DEFAULT '0' AFTER `StartAsset`,
  MODIFY `StartTimer` smallint(5) unsigned NOT NULL DEFAULT '0' AFTER `FailAsset`,
  MODIFY `ModifierTreeId` smallint(5) unsigned NOT NULL DEFAULT '0' AFTER `StartTimer`,
  MODIFY `EligibilityWorldStateID` smallint(5) unsigned NOT NULL DEFAULT '0' AFTER `ModifierTreeId`,
  MODIFY `Type` tinyint(3) unsigned NOT NULL DEFAULT '0' AFTER `EligibilityWorldStateID`,
  MODIFY `StartEvent` tinyint(3) unsigned NOT NULL DEFAULT '0' AFTER `Type`,
  MODIFY `FailEvent` tinyint(3) unsigned NOT NULL DEFAULT '0' AFTER `StartEvent`,
  MODIFY `Flags` tinyint(3) unsigned NOT NULL DEFAULT '0' AFTER `FailEvent`,
  MODIFY `EligibilityWorldStateValue` tinyint(3) unsigned NOT NULL DEFAULT '0' AFTER `Flags`;

--
-- Table structure for table `criteria_tree`
--
ALTER TABLE `criteria_tree`
  MODIFY `Amount` int(10) unsigned NOT NULL DEFAULT '0' AFTER `ID`,
  MODIFY `Description` text AFTER `Amount`,
  MODIFY `CriteriaID` smallint(5) unsigned NOT NULL DEFAULT '0' AFTER `Description`,
  MODIFY `Parent` smallint(5) unsigned NOT NULL DEFAULT '0' AFTER `CriteriaID`,
  MODIFY `Flags` smallint(5) unsigned NOT NULL DEFAULT '0' AFTER `Parent`,
  MODIFY `OrderIndex` smallint(5) unsigned NOT NULL DEFAULT '0' AFTER `Flags`,
  MODIFY `Operator` tinyint(3) unsigned NOT NULL DEFAULT '0' AFTER `OrderIndex`;

--
-- Table structure for table `currency_types`
--
ALTER TABLE `currency_types`
  MODIFY `Name` text AFTER `ID`,
  MODIFY `InventoryIcon1` text AFTER `Name`,
  MODIFY `InventoryIcon2` text AFTER `InventoryIcon1`,
  MODIFY `MaxQty` int(10) unsigned NOT NULL DEFAULT '0' AFTER `InventoryIcon2`,
  MODIFY `MaxEarnablePerWeek` int(10) unsigned NOT NULL DEFAULT '0' AFTER `MaxQty`,
  MODIFY `Flags` int(10) unsigned NOT NULL DEFAULT '0' AFTER `MaxEarnablePerWeek`,
  MODIFY `Description` text AFTER `Flags`,
  MODIFY `CategoryID` tinyint(3) unsigned NOT NULL DEFAULT '0' AFTER `Description`,
  MODIFY `SpellWeight` tinyint(3) unsigned NOT NULL DEFAULT '0' AFTER `CategoryID`,
  MODIFY `SpellCategory` tinyint(3) unsigned NOT NULL DEFAULT '0' AFTER `SpellWeight`,
  MODIFY `Quality` tinyint(3) unsigned NOT NULL DEFAULT '0' AFTER `SpellCategory`;

--
-- Table structure for table `currency_types_locale`
--
ALTER TABLE `currency_types_locale` DROP `InventoryIcon1_lang`;
ALTER TABLE `currency_types_locale` DROP `InventoryIcon2_lang`;

--
-- Table structure for table `curve_point`
--
ALTER TABLE `curve_point` 
  MODIFY `X` float NOT NULL DEFAULT '0' AFTER `ID`,
  MODIFY `Y` float NOT NULL DEFAULT '0' AFTER `X`,
  MODIFY `CurveID` smallint(5) unsigned NOT NULL DEFAULT '0' AFTER `Y`,
  MODIFY `Index` tinyint(3) unsigned NOT NULL DEFAULT '0' AFTER `CurveID`;

--
-- Table structure for table `destructible_model_data`
--
ALTER TABLE `destructible_model_data`
  MODIFY `StateDamagedDisplayID` smallint(5) unsigned NOT NULL DEFAULT '0' AFTER `ID`,
  MODIFY `StateDestroyedDisplayID` smallint(5) unsigned NOT NULL DEFAULT '0' AFTER `StateDamagedDisplayID`,
  MODIFY `StateRebuildingDisplayID` smallint(5) unsigned NOT NULL DEFAULT '0' AFTER `StateDestroyedDisplayID`,
  MODIFY `StateSmokeDisplayID` smallint(5) unsigned NOT NULL DEFAULT '0' AFTER `StateRebuildingDisplayID`,
  MODIFY `HealEffectSpeed` smallint(5) unsigned NOT NULL DEFAULT '0' AFTER `StateSmokeDisplayID`,
  MODIFY `StateDamagedImpactEffectDoodadSet` tinyint(3) unsigned NOT NULL DEFAULT '0' AFTER `HealEffectSpeed`,
  MODIFY `StateDamagedAmbientDoodadSet` tinyint(3) unsigned NOT NULL DEFAULT '0' AFTER `StateDamagedImpactEffectDoodadSet`,
  MODIFY `StateDamagedNameSet` tinyint(3) unsigned NOT NULL DEFAULT '0' AFTER `StateDamagedAmbientDoodadSet`,
  MODIFY `StateDestroyedDestructionDoodadSet` tinyint(3) unsigned NOT NULL DEFAULT '0' AFTER `StateDamagedNameSet`,
  MODIFY `StateDestroyedImpactEffectDoodadSet` tinyint(3) unsigned NOT NULL DEFAULT '0' AFTER `StateDestroyedDestructionDoodadSet`,
  MODIFY `StateDestroyedAmbientDoodadSet` tinyint(3) unsigned NOT NULL DEFAULT '0' AFTER `StateDestroyedImpactEffectDoodadSet`,
  MODIFY `StateDestroyedNameSet` tinyint(3) unsigned NOT NULL DEFAULT '0' AFTER `StateDestroyedAmbientDoodadSet`,
  MODIFY `StateRebuildingDestructionDoodadSet` tinyint(3) unsigned NOT NULL DEFAULT '0' AFTER `StateDestroyedNameSet`,
  MODIFY `StateRebuildingImpactEffectDoodadSet` tinyint(3) unsigned NOT NULL DEFAULT '0' AFTER `StateRebuildingDestructionDoodadSet`,
  MODIFY `StateRebuildingAmbientDoodadSet` tinyint(3) unsigned NOT NULL DEFAULT '0' AFTER `StateRebuildingImpactEffectDoodadSet`,
  MODIFY `StateRebuildingNameSet` tinyint(3) unsigned NOT NULL DEFAULT '0' AFTER `StateRebuildingAmbientDoodadSet`,
  MODIFY `StateSmokeInitDoodadSet` tinyint(3) unsigned NOT NULL DEFAULT '0' AFTER `StateRebuildingNameSet`,
  MODIFY `StateSmokeAmbientDoodadSet` tinyint(3) unsigned NOT NULL DEFAULT '0' AFTER `StateSmokeInitDoodadSet`,
  MODIFY `StateSmokeNameSet` tinyint(3) unsigned NOT NULL DEFAULT '0' AFTER `StateSmokeAmbientDoodadSet`,
  MODIFY `EjectDirection` tinyint(3) unsigned NOT NULL DEFAULT '0' AFTER `StateSmokeNameSet`,
  MODIFY `DoNotHighlight` tinyint(3) unsigned NOT NULL DEFAULT '0' AFTER `EjectDirection`,
  MODIFY `HealEffect` tinyint(3) unsigned NOT NULL DEFAULT '0' AFTER `DoNotHighlight`,
  DROP `RepairGroundFx`;

--
-- Table structure for table `durability_costs`
--
DROP TABLE IF EXISTS `durability_costs`;
CREATE TABLE `durability_costs` (
  `ID` int(10) unsigned NOT NULL DEFAULT '0',
  `WeaponSubClassCost1` smallint(5) unsigned NOT NULL DEFAULT '0',
  `WeaponSubClassCost2` smallint(5) unsigned NOT NULL DEFAULT '0',
  `WeaponSubClassCost3` smallint(5) unsigned NOT NULL DEFAULT '0',
  `WeaponSubClassCost4` smallint(5) unsigned NOT NULL DEFAULT '0',
  `WeaponSubClassCost5` smallint(5) unsigned NOT NULL DEFAULT '0',
  `WeaponSubClassCost6` smallint(5) unsigned NOT NULL DEFAULT '0',
  `WeaponSubClassCost7` smallint(5) unsigned NOT NULL DEFAULT '0',
  `WeaponSubClassCost8` smallint(5) unsigned NOT NULL DEFAULT '0',
  `WeaponSubClassCost9` smallint(5) unsigned NOT NULL DEFAULT '0',
  `WeaponSubClassCost10` smallint(5) unsigned NOT NULL DEFAULT '0',
  `WeaponSubClassCost11` smallint(5) unsigned NOT NULL DEFAULT '0',
  `WeaponSubClassCost12` smallint(5) unsigned NOT NULL DEFAULT '0',
  `WeaponSubClassCost13` smallint(5) unsigned NOT NULL DEFAULT '0',
  `WeaponSubClassCost14` smallint(5) unsigned NOT NULL DEFAULT '0',
  `WeaponSubClassCost15` smallint(5) unsigned NOT NULL DEFAULT '0',
  `WeaponSubClassCost16` smallint(5) unsigned NOT NULL DEFAULT '0',
  `WeaponSubClassCost17` smallint(5) unsigned NOT NULL DEFAULT '0',
  `WeaponSubClassCost18` smallint(5) unsigned NOT NULL DEFAULT '0',
  `WeaponSubClassCost19` smallint(5) unsigned NOT NULL DEFAULT '0',
  `WeaponSubClassCost20` smallint(5) unsigned NOT NULL DEFAULT '0',
  `WeaponSubClassCost21` smallint(5) unsigned NOT NULL DEFAULT '0',
  `ArmorSubClassCost1` smallint(5) unsigned NOT NULL DEFAULT '0',
  `ArmorSubClassCost2` smallint(5) unsigned NOT NULL DEFAULT '0',
  `ArmorSubClassCost3` smallint(5) unsigned NOT NULL DEFAULT '0',
  `ArmorSubClassCost4` smallint(5) unsigned NOT NULL DEFAULT '0',
  `ArmorSubClassCost5` smallint(5) unsigned NOT NULL DEFAULT '0',
  `ArmorSubClassCost6` smallint(5) unsigned NOT NULL DEFAULT '0',
  `ArmorSubClassCost7` smallint(5) unsigned NOT NULL DEFAULT '0',
  `ArmorSubClassCost8` smallint(5) unsigned NOT NULL DEFAULT '0',
  `VerifiedBuild` smallint(6) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Table structure for table `emotes_text_sound`
--
DROP TABLE IF EXISTS `emotes_text_sound`;
CREATE TABLE `emotes_text_sound` (
  `ID` int(10) unsigned NOT NULL DEFAULT '0',
  `EmotesTextId` smallint(5) unsigned NOT NULL DEFAULT '0',
  `SoundId` smallint(5) unsigned NOT NULL DEFAULT '0',
  `RaceId` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `SexId` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `ClassId` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `VerifiedBuild` smallint(6) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Table structure for table `gameobjects`
--
ALTER TABLE `gameobjects`
  MODIFY `ID` int(10) unsigned NOT NULL DEFAULT '0' FIRST ,
  MODIFY `PositionX` float NOT NULL DEFAULT '0' AFTER `ID`,
  MODIFY `PositionY` float NOT NULL DEFAULT '0' AFTER `PositionX`,
  MODIFY `PositionZ` float NOT NULL DEFAULT '0' AFTER `PositionY`,
  MODIFY `RotationX` float NOT NULL DEFAULT '0' AFTER `PositionZ`,
  MODIFY `RotationY` float NOT NULL DEFAULT '0' AFTER `RotationX`,
  MODIFY `RotationZ` float NOT NULL DEFAULT '0' AFTER `RotationY`,
  MODIFY `RotationW` float NOT NULL DEFAULT '0' AFTER `RotationZ`,
  MODIFY `Size` float NOT NULL DEFAULT '0' AFTER `RotationW`,
  MODIFY `Data1` int(10) NOT NULL DEFAULT '0' AFTER `Size`,
  MODIFY `Data2` int(10) NOT NULL DEFAULT '0' AFTER `Data1`,
  MODIFY `Data3` int(10) NOT NULL DEFAULT '0' AFTER `Data2`,
  MODIFY `Data4` int(10) NOT NULL DEFAULT '0' AFTER `Data3`,
  MODIFY `Data5` int(10) NOT NULL DEFAULT '0' AFTER `Data4`,
  MODIFY `Data6` int(10) NOT NULL DEFAULT '0' AFTER `Data5`,
  MODIFY `Data7` int(10) NOT NULL DEFAULT '0' AFTER `Data6`,
  MODIFY `Data8` int(10) NOT NULL DEFAULT '0' AFTER `Data7`,
  MODIFY `Name` text AFTER `Data7`,
  MODIFY `MapID` smallint(5) unsigned NOT NULL DEFAULT '0' AFTER `Name`,
  MODIFY `DisplayID` smallint(5) unsigned NOT NULL DEFAULT '0' AFTER `MapID`,
  MODIFY `PhaseID` smallint(5) unsigned NOT NULL DEFAULT '0' AFTER `DisplayID`,
  MODIFY `PhaseGroupID` smallint(5) unsigned NOT NULL DEFAULT '0' AFTER `PhaseID`,
  MODIFY `PhaseUseFlags` tinyint(3) unsigned NOT NULL DEFAULT '0' AFTER `PhaseGroupID`,
  MODIFY `Type` tinyint(3) unsigned NOT NULL DEFAULT '0' AFTER `PhaseUseFlags`,
  MODIFY `VerifiedBuild` smallint(6) NOT NULL DEFAULT '0' AFTER `Type`;

--
-- Table structure for table `gameobject_display_info`
--
DROP TABLE IF EXISTS `gameobject_display_info`;
CREATE TABLE `gameobject_display_info` (
  `ID` int(10) unsigned NOT NULL DEFAULT '0',
  `FileDataID` int(10) unsigned NOT NULL DEFAULT '0',
  `GeoBoxMinX` float NOT NULL DEFAULT '0',
  `GeoBoxMinY` float NOT NULL DEFAULT '0',
  `GeoBoxMinZ` float NOT NULL DEFAULT '0',
  `GeoBoxMaxX` float NOT NULL DEFAULT '0',
  `GeoBoxMaxY` float NOT NULL DEFAULT '0',
  `GeoBoxMaxZ` float NOT NULL DEFAULT '0',
  `OverrideLootEffectScale` float NOT NULL DEFAULT '0',
  `OverrideNameScale` float NOT NULL DEFAULT '0',
  `Sound1` smallint(5) unsigned NOT NULL DEFAULT '0',
  `Sound2` smallint(5) unsigned NOT NULL DEFAULT '0',
  `Sound3` smallint(5) unsigned NOT NULL DEFAULT '0',
  `Sound4` smallint(5) unsigned NOT NULL DEFAULT '0',
  `Sound5` smallint(5) unsigned NOT NULL DEFAULT '0',
  `Sound6` smallint(5) unsigned NOT NULL DEFAULT '0',
  `Sound7` smallint(5) unsigned NOT NULL DEFAULT '0',
  `Sound8` smallint(5) unsigned NOT NULL DEFAULT '0',
  `Sound9` smallint(5) unsigned NOT NULL DEFAULT '0',
  `Sound10` smallint(5) unsigned NOT NULL DEFAULT '0',
  `ObjectEffectPackageID` smallint(5) unsigned NOT NULL DEFAULT '0',
  `VerifiedBuild` smallint(6) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Table structure for table `game_tables`
--
ALTER TABLE `game_tables` ENGINE=MyISAM, DEFAULT CHARSET=utf8;
ALTER TABLE `game_tables`
  MODIFY `Name` text AFTER `ID`,
  MODIFY `NumRows` smallint(5) unsigned NOT NULL DEFAULT '0' AFTER `Name`,
  MODIFY `NumColumns` tinyint(3) unsigned NOT NULL DEFAULT '0' AFTER `NumRows`,
  MODIFY `VerifiedBuild` smallint(6) NOT NULL DEFAULT '0' AFTER `NumColumns`;

--
-- Table structure for table `game_tables_locale`
--
ALTER TABLE `game_tables_locale` MODIFY `Name_lang` text AFTER `locale`;

--
-- Table structure for table `garr_ability`
--
ALTER TABLE `garr_ability`
  MODIFY `Name` text AFTER `ID`,
  MODIFY `Description` text AFTER `Name`,
  MODIFY `IconFileDataID` int(10) unsigned NOT NULL DEFAULT '0' AFTER `Description`,
  MODIFY `OtherFactionGarrAbilityID` smallint(5) unsigned NOT NULL DEFAULT '0' AFTER `IconFileDataID`,
  MODIFY `Flags` tinyint(3) unsigned NOT NULL DEFAULT '0' AFTER `OtherFactionGarrAbilityID`,
  MODIFY `GarrAbilityCategoryID` tinyint(3) unsigned NOT NULL DEFAULT '0' AFTER `Flags`,
  MODIFY `FollowerTypeID` tinyint(3) unsigned NOT NULL DEFAULT '0' AFTER `GarrAbilityCategoryID`;

--
-- Table structure for table `garr_building`
--
ALTER TABLE `garr_building`
  MODIFY `NameAlliance` text AFTER `AllianceGameObjectID`,
  MODIFY `NameHorde` text AFTER `NameAlliance`,
  MODIFY `Description` text AFTER `NameHorde`,
  MODIFY `Tooltip` text AFTER `Description`,
  MODIFY `IconFileDataID` int(10) unsigned NOT NULL DEFAULT '0' AFTER `Tooltip`,
  MODIFY `BuildDuration` smallint(5) unsigned NOT NULL DEFAULT '0' AFTER `IconFileDataID`,
  MODIFY `CostCurrencyID` smallint(5) unsigned NOT NULL DEFAULT '0' AFTER `BuildDuration`,
  MODIFY `CostCurrencyAmount` smallint(6) NOT NULL DEFAULT '0' AFTER `CostCurrencyID`,
  MODIFY `AllianceActivationScenePackageID` smallint(5) unsigned NOT NULL DEFAULT '0' AFTER `CostCurrencyAmount`,
  MODIFY `HordeActivationScenePackageID` smallint(5) unsigned NOT NULL DEFAULT '0' AFTER `AllianceActivationScenePackageID`,
  MODIFY `CostMoney` smallint(6) NOT NULL DEFAULT '0' AFTER `HordeActivationScenePackageID`,
  MODIFY `Unknown` tinyint(3) unsigned NOT NULL DEFAULT '0' AFTER `CostMoney`,
  MODIFY `Type` tinyint(3) unsigned NOT NULL DEFAULT '0' AFTER `Unknown`,
  MODIFY `Level` tinyint(3) unsigned NOT NULL DEFAULT '0' AFTER `Type`,
  MODIFY `HordeTexPrefixKitID` tinyint(3) unsigned NOT NULL DEFAULT '0' AFTER `Level`,
  MODIFY `AllianceTexPrefixKitID` tinyint(3) unsigned NOT NULL DEFAULT '0' AFTER `HordeTexPrefixKitID`,
  MODIFY `BonusAmount` tinyint(3) unsigned NOT NULL DEFAULT '0' AFTER `AllianceTexPrefixKitID`,
  MODIFY `Flags` tinyint(3) unsigned NOT NULL DEFAULT '0' AFTER `BonusAmount`,
  MODIFY `MaxShipments` tinyint(3) unsigned NOT NULL DEFAULT '0' AFTER `Flags`,
  MODIFY `FollowerRequiredGarrAbilityID` tinyint(3) unsigned NOT NULL DEFAULT '0' AFTER `MaxShipments`,
  MODIFY `FollowerGarrAbilityEffectID` tinyint(3) unsigned NOT NULL DEFAULT '0' AFTER `FollowerRequiredGarrAbilityID`,
  ADD `GarrTypeID` tinyint(3) unsigned NOT NULL DEFAULT '0' AFTER `FollowerGarrAbilityEffectID`;

--
-- Table structure for table `garr_building_plot_inst`
--
ALTER TABLE `garr_building_plot_inst`
  MODIFY `LandmarkOffsetX` float NOT NULL DEFAULT '0' AFTER `ID`,
  MODIFY `LandmarkOffsetY` float NOT NULL DEFAULT '0' AFTER `LandmarkOffsetX`,
  MODIFY `UiTextureAtlasMemberID` smallint(5) unsigned NOT NULL DEFAULT '0' AFTER `LandmarkOffsetY`,
  MODIFY `GarrSiteLevelPlotInstID` smallint(5) unsigned NOT NULL DEFAULT '0' AFTER `UiTextureAtlasMemberID`,
  MODIFY `GarrBuildingID` tinyint(3) unsigned NOT NULL DEFAULT '0' AFTER `GarrSiteLevelPlotInstID`;

--
-- Table structure for table `garr_class_spec`
--
ALTER TABLE `garr_class_spec`
  MODIFY `ClassAtlasID` smallint(5) unsigned NOT NULL DEFAULT '0' AFTER `NameGenderless`,
  MODIFY `GarrFollItemSetID` tinyint(3) unsigned NOT NULL DEFAULT '0' AFTER `ClassAtlasID`;

--
-- Table structure for table `garr_follower`
--
ALTER TABLE `garr_follower`
  MODIFY `HordeCreatureID` int(10) unsigned NOT NULL DEFAULT '0' AFTER `ID`,
  MODIFY `AllianceCreatureID` int(10) unsigned NOT NULL DEFAULT '0' AFTER `HordeCreatureID`,
  MODIFY `HordeSourceText` text AFTER `AllianceCreatureID`,
  MODIFY `AllianceSourceText` text AFTER `HordeSourceText`,
  MODIFY `HordePortraitIconID` int(10) unsigned NOT NULL DEFAULT '0' AFTER `AllianceSourceText`,
  MODIFY `AlliancePortraitIconID` int(10) unsigned NOT NULL DEFAULT '0' AFTER `HordePortraitIconID`,
  MODIFY `ItemLevelWeapon` smallint(5) unsigned NOT NULL DEFAULT '0' AFTER `AlliancePortraitIconID`,
  MODIFY `ItemLevelArmor` smallint(5) unsigned NOT NULL DEFAULT '0' AFTER `ItemLevelWeapon`,
  MODIFY `FollowerTypeID` tinyint(3) unsigned NOT NULL DEFAULT '0' AFTER `ItemLevelArmor`,
  MODIFY `HordeUiAnimRaceInfoID` tinyint(3) unsigned NOT NULL DEFAULT '0' AFTER `FollowerTypeID`,
  MODIFY `AllianceUiAnimRaceInfoID` tinyint(3) unsigned NOT NULL DEFAULT '0' AFTER `HordeUiAnimRaceInfoID`,
  MODIFY `Quality` tinyint(3) unsigned NOT NULL DEFAULT '0' AFTER `AllianceUiAnimRaceInfoID`,
  MODIFY `HordeGarrClassSpecID` tinyint(3) unsigned NOT NULL DEFAULT '0' AFTER `Quality`,
  MODIFY `AllianceGarrClassSpecID` tinyint(3) unsigned NOT NULL DEFAULT '0' AFTER `HordeGarrClassSpecID`,
  MODIFY `HordeGarrFollItemSetID` tinyint(3) unsigned NOT NULL DEFAULT '0' AFTER `AllianceGarrClassSpecID`,
  MODIFY `AllianceGarrFollItemSetID` tinyint(3) unsigned NOT NULL DEFAULT '0' AFTER `HordeGarrFollItemSetID`,
  MODIFY `Level` tinyint(3) unsigned NOT NULL DEFAULT '0' AFTER `AllianceGarrFollItemSetID`,
  MODIFY `Unknown1` tinyint(3) unsigned NOT NULL DEFAULT '0' AFTER `Level`,
  MODIFY `Flags` tinyint(3) unsigned NOT NULL DEFAULT '0' AFTER `Unknown1`,
  MODIFY `Unknown2` tinyint(4) NOT NULL DEFAULT '0' AFTER `Flags`,
  MODIFY `Unknown3` tinyint(4) NOT NULL DEFAULT '0' AFTER `Unknown2`,
  MODIFY `HordeListPortraitTextureKitID` tinyint(3) unsigned NOT NULL DEFAULT '0' AFTER `Unknown3`,
  MODIFY `AllianceListPortraitTextureKitID` tinyint(3) unsigned NOT NULL DEFAULT '0' AFTER `HordeListPortraitTextureKitID`,
  ADD `GarrTypeID` tinyint(3) unsigned NOT NULL DEFAULT '0' AFTER `AllianceListPortraitTextureKitID`;

--
-- Table structure for table `garr_follower_x_ability`
--
ALTER TABLE `garr_follower_x_ability`
  MODIFY `GarrFollowerID` smallint(5) unsigned NOT NULL DEFAULT '0' AFTER `ID`,
  MODIFY `GarrAbilityID` smallint(5) unsigned NOT NULL DEFAULT '0' AFTER `GarrFollowerID`,
  MODIFY `FactionIndex` tinyint(3) unsigned NOT NULL DEFAULT '0' AFTER `GarrAbilityID`;

--
-- Table structure for table `garr_plot`
--
ALTER TABLE `garr_plot`
  MODIFY `Name` text AFTER `ID`,
  MODIFY `AllianceConstructionGameObjectID` int(10) unsigned NOT NULL DEFAULT '0' AFTER `Name`,
  MODIFY `HordeConstructionGameObjectID` int(10) unsigned NOT NULL DEFAULT '0' AFTER `AllianceConstructionGameObjectID`,
  MODIFY `GarrPlotUICategoryID` tinyint(3) unsigned NOT NULL DEFAULT '0' AFTER `HordeConstructionGameObjectID`,
  MODIFY `PlotType` tinyint(3) unsigned NOT NULL DEFAULT '0' AFTER `GarrPlotUICategoryID`,
  MODIFY `Flags` tinyint(3) unsigned NOT NULL DEFAULT '0' AFTER `PlotType`,
  MODIFY `MinCount` tinyint(3) unsigned NOT NULL DEFAULT '0' AFTER `Flags`,
  MODIFY `MaxCount` tinyint(3) unsigned NOT NULL DEFAULT '0' AFTER `MinCount`;

--
-- Table structure for table `garr_plot_building`
--
ALTER TABLE `garr_plot_building`
  MODIFY `GarrPlotID` tinyint(3) unsigned NOT NULL DEFAULT '0' AFTER `ID`,
  MODIFY `GarrBuildingID` tinyint(3) unsigned NOT NULL DEFAULT '0' AFTER `GarrPlotID`;
  
--
-- Table structure for table `garr_plot_instance`
--
ALTER TABLE `garr_plot_instance`
  MODIFY `Name` text AFTER `ID`,
  MODIFY `GarrPlotID` tinyint(3) unsigned NOT NULL DEFAULT '0' AFTER `Name`;

--
-- Table structure for table `garr_site_level`
--
ALTER TABLE `garr_site_level`
  MODIFY `TownHallX` float NOT NULL DEFAULT '0' AFTER `ID`,
  MODIFY `TownHallY` float NOT NULL DEFAULT '0' AFTER `TownHallX`,
  MODIFY `MapID` smallint(5) unsigned NOT NULL DEFAULT '0' AFTER `TownHallY`,
  MODIFY `UpgradeResourceCost` smallint(5) unsigned NOT NULL DEFAULT '0' AFTER `MapID`,
  MODIFY `UpgradeMoneyCost` smallint(5) unsigned NOT NULL DEFAULT '0' AFTER `UpgradeResourceCost`,
  MODIFY `Level` tinyint(3) unsigned NOT NULL DEFAULT '0' AFTER `UpgradeMoneyCost`,
  MODIFY `SiteID` tinyint(3) unsigned NOT NULL DEFAULT '0' AFTER `Level`,
  MODIFY `UITextureKitID` tinyint(3) unsigned NOT NULL DEFAULT '0' AFTER `SiteID`,
  MODIFY `MovieID` tinyint(3) unsigned NOT NULL DEFAULT '0' AFTER `UITextureKitID`,
  MODIFY `Level2` tinyint(3) unsigned NOT NULL DEFAULT '0' AFTER `MovieID`;

--
-- Table structure for table `garr_site_level_plot_inst`
--
ALTER TABLE `garr_site_level_plot_inst`
  MODIFY `LandmarkX` float NOT NULL DEFAULT '0' AFTER `ID`,
  MODIFY `LandmarkY` float NOT NULL DEFAULT '0' AFTER `LandmarkX`,
  MODIFY `GarrSiteLevelID` smallint(5) unsigned NOT NULL DEFAULT '0' AFTER `LandmarkY`,
  MODIFY `GarrPlotInstanceID` tinyint(3) unsigned NOT NULL DEFAULT '0' AFTER `GarrSiteLevelID`,
  MODIFY `Unknown` tinyint(3) unsigned NOT NULL DEFAULT '0' AFTER `GarrPlotInstanceID`;

--
-- Table structure for table `glyph_slot`
--
ALTER TABLE `glyph_slot`
  MODIFY `Type` tinyint(3) unsigned NOT NULL DEFAULT '0' AFTER `ID`,
  MODIFY `Tooltip` tinyint(3) unsigned NOT NULL DEFAULT '0' AFTER `Type`;

--
-- Table structure for table `guild_color_background`
--
DROP TABLE IF EXISTS `guild_color_background`;
CREATE TABLE `guild_color_background` (
  `ID` int(10) unsigned NOT NULL DEFAULT '0',
  `Red` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `Green` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `Blue` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `VerifiedBuild` smallint(6) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Table structure for table `guild_color_border`
--
DROP TABLE IF EXISTS `guild_color_border`;
CREATE TABLE `guild_color_border` (
  `ID` int(10) unsigned NOT NULL DEFAULT '0',
  `Red` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `Green` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `Blue` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `VerifiedBuild` smallint(6) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


--
-- Table structure for table `guild_color_emblem`
--
DROP TABLE IF EXISTS `guild_color_emblem`;
CREATE TABLE `guild_color_emblem` (
  `ID` int(10) unsigned NOT NULL DEFAULT '0',
  `Red` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `Green` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `Blue` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `VerifiedBuild` smallint(6) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Table structure for table `guild_perk_spells`
--
ALTER TABLE `guild_perk_spells`
  MODIFY `SpellID` int(10) unsigned NOT NULL DEFAULT '0' AFTER `ID`,
  MODIFY `GuildLevel` tinyint(3) unsigned NOT NULL DEFAULT '0' AFTER `SpellID`;

--
-- Table structure for table `heirloom`
--
ALTER TABLE `heirloom`
  MODIFY `SourceText` text AFTER `ItemID`,
  MODIFY `OldItem1` int(10) unsigned NOT NULL DEFAULT '0' AFTER `SourceText`,
  MODIFY `OldItem2` int(10) unsigned NOT NULL DEFAULT '0' AFTER `OldItem1`,
  MODIFY `NextDifficultyItemID` int(10) unsigned NOT NULL DEFAULT '0' AFTER `OldItem2`,
  MODIFY `UpgradeItemID1` int(10) unsigned NOT NULL DEFAULT '0' AFTER `NextDifficultyItemID`,
  MODIFY `UpgradeItemID2` int(10) unsigned NOT NULL DEFAULT '0' AFTER `UpgradeItemID1`,
  MODIFY `ItemBonusListID1` smallint(5) unsigned NOT NULL DEFAULT '0' AFTER `UpgradeItemID2`,
  MODIFY `ItemBonusListID2` smallint(5) unsigned NOT NULL DEFAULT '0' AFTER `ItemBonusListID1`,
  MODIFY `Flags` tinyint(3) unsigned NOT NULL DEFAULT '0' AFTER `ItemBonusListID2`,
  MODIFY `Source` tinyint(3) unsigned NOT NULL DEFAULT '0' AFTER `Flags`;

--
-- Table structure for table `holidays`
--
ALTER TABLE `holidays`
  MODIFY `Date1` int(10) unsigned NOT NULL DEFAULT '0' AFTER `ID`,
  MODIFY `Date2` int(10) unsigned NOT NULL DEFAULT '0' AFTER `Date1`,
  MODIFY `Date3` int(10) unsigned NOT NULL DEFAULT '0' AFTER `Date2`,
  MODIFY `Date4` int(10) unsigned NOT NULL DEFAULT '0' AFTER `Date3`,
  MODIFY `Date5` int(10) unsigned NOT NULL DEFAULT '0' AFTER `Date4`,
  MODIFY `Date6` int(10) unsigned NOT NULL DEFAULT '0' AFTER `Date5`,
  MODIFY `Date7` int(10) unsigned NOT NULL DEFAULT '0' AFTER `Date6`,
  MODIFY `Date8` int(10) unsigned NOT NULL DEFAULT '0' AFTER `Date7`,
  MODIFY `Date9` int(10) unsigned NOT NULL DEFAULT '0' AFTER `Date8`,
  MODIFY `Date10` int(10) unsigned NOT NULL DEFAULT '0' AFTER `Date9`,
  MODIFY `Date11` int(10) unsigned NOT NULL DEFAULT '0' AFTER `Date10`,
  MODIFY `Date12` int(10) unsigned NOT NULL DEFAULT '0' AFTER `Date11`,
  MODIFY `Date13` int(10) unsigned NOT NULL DEFAULT '0' AFTER `Date12`,
  MODIFY `Date14` int(10) unsigned NOT NULL DEFAULT '0' AFTER `Date13`,
  MODIFY `Date15` int(10) unsigned NOT NULL DEFAULT '0' AFTER `Date14`,
  MODIFY `Date16` int(10) unsigned NOT NULL DEFAULT '0' AFTER `Date15`,
  MODIFY `TextureFilename` text AFTER `Date16`,
  MODIFY `Duration1` smallint(5) unsigned NOT NULL DEFAULT '0' AFTER `TextureFilename`,
  MODIFY `Duration2` smallint(5) unsigned NOT NULL DEFAULT '0' AFTER `Duration1`,
  MODIFY `Duration3` smallint(5) unsigned NOT NULL DEFAULT '0' AFTER `Duration2`,
  MODIFY `Duration4` smallint(5) unsigned NOT NULL DEFAULT '0' AFTER `Duration3`,
  MODIFY `Duration5` smallint(5) unsigned NOT NULL DEFAULT '0' AFTER `Duration4`,
  MODIFY `Duration6` smallint(5) unsigned NOT NULL DEFAULT '0' AFTER `Duration5`,
  MODIFY `Duration7` smallint(5) unsigned NOT NULL DEFAULT '0' AFTER `Duration6`,
  MODIFY `Duration8` smallint(5) unsigned NOT NULL DEFAULT '0' AFTER `Duration7`,
  MODIFY `Duration9` smallint(5) unsigned NOT NULL DEFAULT '0' AFTER `Duration8`,
  MODIFY `Duration10` smallint(5) unsigned NOT NULL DEFAULT '0' AFTER `Duration9`,
  MODIFY `Region` smallint(5) unsigned NOT NULL DEFAULT '0' AFTER `Duration10`,
  MODIFY `Looping` tinyint(3) unsigned NOT NULL DEFAULT '0' AFTER `Region`,
  MODIFY `CalendarFlags1` tinyint(3) unsigned NOT NULL DEFAULT '0' AFTER `Looping`,
  MODIFY `CalendarFlags2` tinyint(3) unsigned NOT NULL DEFAULT '0' AFTER `CalendarFlags1`,
  MODIFY `CalendarFlags3` tinyint(3) unsigned NOT NULL DEFAULT '0' AFTER `CalendarFlags2`,
  MODIFY `CalendarFlags4` tinyint(3) unsigned NOT NULL DEFAULT '0' AFTER `CalendarFlags3`,
  MODIFY `CalendarFlags5` tinyint(3) unsigned NOT NULL DEFAULT '0' AFTER `CalendarFlags4`,
  MODIFY `CalendarFlags6` tinyint(3) unsigned NOT NULL DEFAULT '0' AFTER `CalendarFlags5`,
  MODIFY `CalendarFlags7` tinyint(3) unsigned NOT NULL DEFAULT '0' AFTER `CalendarFlags6`,
  MODIFY `CalendarFlags8` tinyint(3) unsigned NOT NULL DEFAULT '0' AFTER `CalendarFlags7`,
  MODIFY `CalendarFlags9` tinyint(3) unsigned NOT NULL DEFAULT '0' AFTER `CalendarFlags8`,
  MODIFY `CalendarFlags10` tinyint(3) unsigned NOT NULL DEFAULT '0' AFTER `CalendarFlags9`,
  MODIFY `HolidayNameID` tinyint(3) unsigned NOT NULL DEFAULT '0' AFTER `CalendarFlags10`,
  MODIFY `HolidayDescriptionID` tinyint(3) unsigned NOT NULL DEFAULT '0' AFTER `HolidayNameID`,
  MODIFY `Priority` tinyint(3) unsigned NOT NULL DEFAULT '0' AFTER `HolidayDescriptionID`,
  MODIFY `CalendarFilterType` tinyint(4) NOT NULL DEFAULT '0' AFTER `Priority`,
  MODIFY `Flags` tinyint(3) unsigned NOT NULL DEFAULT '0' AFTER `CalendarFilterType`;

--
-- Table structure for table `item`
--
ALTER TABLE `item`
  MODIFY `FileDataID` int(10) unsigned NOT NULL DEFAULT '0' AFTER `ID`,
  MODIFY `Class` tinyint(3) unsigned NOT NULL DEFAULT '0' AFTER `FileDataID`,
  MODIFY `SubClass` tinyint(3) unsigned NOT NULL DEFAULT '0' AFTER `Class`,
  MODIFY `SoundOverrideSubclass` tinyint(4) NOT NULL DEFAULT '0' AFTER `SubClass`,
  MODIFY `Material` tinyint(4) NOT NULL DEFAULT '0' AFTER `SoundOverrideSubclass`,
  MODIFY `InventoryType` tinyint(3) unsigned NOT NULL DEFAULT '0' AFTER `Material`,
  MODIFY `Sheath` tinyint(3) unsigned NOT NULL DEFAULT '0' AFTER `InventoryType`,
  MODIFY `GroupSoundsID` tinyint(3) unsigned NOT NULL DEFAULT '0' AFTER `Sheath`;

--
-- Table structure for table `item_appearance`
--
ALTER TABLE `item_appearance` ADD `ObjectComponentSlot` tinyint(3) unsigned NOT NULL DEFAULT '0' AFTER `IconFileDataID`;

--
-- Table structure for table `item_armor_quality`
--
DROP TABLE IF EXISTS `item_armor_quality`;
CREATE TABLE `item_armor_quality` (
  `ID` int(10) unsigned NOT NULL DEFAULT '0',
  `QualityMod1` float NOT NULL DEFAULT '0',
  `QualityMod2` float NOT NULL DEFAULT '0',
  `QualityMod3` float NOT NULL DEFAULT '0',
  `QualityMod4` float NOT NULL DEFAULT '0',
  `QualityMod5` float NOT NULL DEFAULT '0',
  `QualityMod6` float NOT NULL DEFAULT '0',
  `QualityMod7` float NOT NULL DEFAULT '0',
  `ItemLevel` smallint(5) unsigned NOT NULL DEFAULT '0',
  `VerifiedBuild` smallint(6) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Table structure for table `item_armor_shield`
--
DROP TABLE IF EXISTS `item_armor_shield`;
CREATE TABLE `item_armor_shield` (
  `ID` int(10) unsigned NOT NULL DEFAULT '0',
  `Quality1` float NOT NULL DEFAULT '0',
  `Quality2` float NOT NULL DEFAULT '0',
  `Quality3` float NOT NULL DEFAULT '0',
  `Quality4` float NOT NULL DEFAULT '0',
  `Quality5` float NOT NULL DEFAULT '0',
  `Quality6` float NOT NULL DEFAULT '0',
  `Quality7` float NOT NULL DEFAULT '0',
  `ItemLevel` smallint(5) unsigned NOT NULL DEFAULT '0',
  `VerifiedBuild` smallint(6) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Table structure for table `item_armor_total`
--
DROP TABLE IF EXISTS `item_armor_total`;
CREATE TABLE `item_armor_total` (
  `ID` int(10) unsigned NOT NULL DEFAULT '0',
  `Value1` float NOT NULL DEFAULT '0',
  `Value2` float NOT NULL DEFAULT '0',
  `Value3` float NOT NULL DEFAULT '0',
  `Value4` float NOT NULL DEFAULT '0',
  `ItemLevel` smallint(5) unsigned NOT NULL DEFAULT '0',
  `VerifiedBuild` smallint(6) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Table structure for table `item_bag_family`
--
DROP TABLE IF EXISTS `item_bag_family`;
CREATE TABLE `item_bag_family` (
  `ID` int(10) unsigned NOT NULL DEFAULT '0',
  `Name` text,
  `VerifiedBuild` smallint(6) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Table structure for table `item_bag_family_locale`
--
DROP TABLE IF EXISTS `item_bag_family_locale`;
CREATE TABLE `item_bag_family_locale` (
  `ID` int(10) unsigned NOT NULL DEFAULT '0',
  `locale` varchar(4) NOT NULL,
  `Name_lang` text,
  `VerifiedBuild` smallint(6) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`locale`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Table structure for table `item_bonus`
--
ALTER TABLE `item_bonus`
  MODIFY `Value1` int(11) NOT NULL DEFAULT '0' AFTER `ID`,
  MODIFY `Value2` int(11) NOT NULL DEFAULT '0' AFTER `Value1`,
  MODIFY `BonusListID` smallint(5) unsigned NOT NULL DEFAULT '0' AFTER `Value2`,
  MODIFY `Type` tinyint(3) unsigned NOT NULL DEFAULT '0' AFTER `BonusListID`,
  MODIFY `Index` tinyint(3) unsigned NOT NULL DEFAULT '0' AFTER `Type`;

--
-- Table structure for table `item_bonus_tree_node`
--
ALTER TABLE `item_bonus_tree_node`
  MODIFY `BonusTreeID` smallint(5) unsigned NOT NULL DEFAULT '0' AFTER `ID`,
  MODIFY `SubTreeID` smallint(5) unsigned NOT NULL DEFAULT '0' AFTER `BonusTreeID`,
  MODIFY `BonusListID` smallint(5) unsigned NOT NULL DEFAULT '0' AFTER `SubTreeID`,
  MODIFY `BonusTreeModID` tinyint(3) unsigned NOT NULL DEFAULT '0' AFTER `BonusListID`;

--
-- Table structure for table `item_class`
--
ALTER TABLE `item_class`
  MODIFY `PriceMod` float NOT NULL DEFAULT '0' AFTER `ID`,
  MODIFY `Name` text AFTER `PriceMod`,
  MODIFY `Flags` tinyint(3) unsigned NOT NULL DEFAULT '0' AFTER `Name`;

--
-- Table structure for table `item_currency_cost`
--
ALTER TABLE `item_currency_cost` DROP INDEX `idx_itemId`;

--
-- Table structure for table `item_damage_ammo`
--
DROP TABLE IF EXISTS `item_damage_ammo`;
CREATE TABLE `item_damage_ammo` (
  `ID` int(10) unsigned NOT NULL DEFAULT '0',
  `DPS1` float NOT NULL DEFAULT '0',
  `DPS2` float NOT NULL DEFAULT '0',
  `DPS3` float NOT NULL DEFAULT '0',
  `DPS4` float NOT NULL DEFAULT '0',
  `DPS5` float NOT NULL DEFAULT '0',
  `DPS6` float NOT NULL DEFAULT '0',
  `DPS7` float NOT NULL DEFAULT '0',
  `ItemLevel` smallint(5) unsigned NOT NULL DEFAULT '0',
  `VerifiedBuild` smallint(6) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Table structure for table `item_damage_one_hand`
--
DROP TABLE IF EXISTS `item_damage_one_hand`;
CREATE TABLE `item_damage_one_hand` (
  `ID` int(10) unsigned NOT NULL DEFAULT '0',
  `DPS1` float NOT NULL DEFAULT '0',
  `DPS2` float NOT NULL DEFAULT '0',
  `DPS3` float NOT NULL DEFAULT '0',
  `DPS4` float NOT NULL DEFAULT '0',
  `DPS5` float NOT NULL DEFAULT '0',
  `DPS6` float NOT NULL DEFAULT '0',
  `DPS7` float NOT NULL DEFAULT '0',
  `ItemLevel` smallint(5) unsigned NOT NULL DEFAULT '0',
  `VerifiedBuild` smallint(6) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Table structure for table `item_damage_one_hand_caster`
--
DROP TABLE IF EXISTS `item_damage_one_hand_caster`;
CREATE TABLE `item_damage_one_hand_caster` (
  `ID` int(10) unsigned NOT NULL DEFAULT '0',
  `DPS1` float NOT NULL DEFAULT '0',
  `DPS2` float NOT NULL DEFAULT '0',
  `DPS3` float NOT NULL DEFAULT '0',
  `DPS4` float NOT NULL DEFAULT '0',
  `DPS5` float NOT NULL DEFAULT '0',
  `DPS6` float NOT NULL DEFAULT '0',
  `DPS7` float NOT NULL DEFAULT '0',
  `ItemLevel` smallint(5) unsigned NOT NULL DEFAULT '0',
  `VerifiedBuild` smallint(6) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Table structure for table `item_damage_two_hand`
--
DROP TABLE IF EXISTS `item_damage_two_hand`;
CREATE TABLE `item_damage_two_hand` (
  `ID` int(10) unsigned NOT NULL DEFAULT '0',
  `DPS1` float NOT NULL DEFAULT '0',
  `DPS2` float NOT NULL DEFAULT '0',
  `DPS3` float NOT NULL DEFAULT '0',
  `DPS4` float NOT NULL DEFAULT '0',
  `DPS5` float NOT NULL DEFAULT '0',
  `DPS6` float NOT NULL DEFAULT '0',
  `DPS7` float NOT NULL DEFAULT '0',
  `ItemLevel` smallint(5) unsigned NOT NULL DEFAULT '0',
  `VerifiedBuild` smallint(6) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Table structure for table `item_damage_two_hand_caster`
--
DROP TABLE IF EXISTS `item_damage_two_hand_caster`;
CREATE TABLE `item_damage_two_hand_caster` (
  `ID` int(10) unsigned NOT NULL DEFAULT '0',
  `DPS1` float NOT NULL DEFAULT '0',
  `DPS2` float NOT NULL DEFAULT '0',
  `DPS3` float NOT NULL DEFAULT '0',
  `DPS4` float NOT NULL DEFAULT '0',
  `DPS5` float NOT NULL DEFAULT '0',
  `DPS6` float NOT NULL DEFAULT '0',
  `DPS7` float NOT NULL DEFAULT '0',
  `ItemLevel` smallint(5) unsigned NOT NULL DEFAULT '0',
  `VerifiedBuild` smallint(6) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Table structure for table `item_disenchant_loot`
--
ALTER TABLE `item_disenchant_loot`
  MODIFY `MinItemLevel` smallint(5) unsigned NOT NULL DEFAULT '0' AFTER `ID`,
  MODIFY `MaxItemLevel` smallint(5) unsigned NOT NULL DEFAULT '0' AFTER `MinItemLevel`,
  MODIFY `RequiredDisenchantSkill` smallint(5) unsigned NOT NULL DEFAULT '0' AFTER `MaxItemLevel`,
  MODIFY `ItemClass` tinyint(3) unsigned NOT NULL DEFAULT '0' AFTER `RequiredDisenchantSkill`,
  MODIFY `ItemSubClass` tinyint(4) NOT NULL DEFAULT '0' AFTER `ItemClass`,
  MODIFY `ItemQuality` tinyint(3) unsigned NOT NULL DEFAULT '0' AFTER `ItemSubClass`;

--
-- Table structure for table `item_effect`
--
ALTER TABLE `item_effect`
  MODIFY `SpellID` int(10) unsigned NOT NULL DEFAULT '0' AFTER `ItemID`,
  MODIFY `Cooldown` int(11) NOT NULL DEFAULT '0' AFTER `SpellID`,
  MODIFY `CategoryCooldown` int(11) NOT NULL DEFAULT '0' AFTER `Cooldown`,
  MODIFY `Charges` smallint(6) NOT NULL DEFAULT '0' AFTER `CategoryCooldown`,
  MODIFY `Category` smallint(5) unsigned NOT NULL DEFAULT '0' AFTER `Charges`,
  MODIFY `ChrSpecializationID` smallint(5) unsigned NOT NULL DEFAULT '0' AFTER `Category`,
  MODIFY `OrderIndex` tinyint(3) unsigned NOT NULL DEFAULT '0' AFTER `ChrSpecializationID`,
  MODIFY `Trigger` tinyint(3) unsigned NOT NULL DEFAULT '0' AFTER `OrderIndex`;

--
-- Table structure for table `item_extended_cost`
--
ALTER TABLE `item_extended_cost`
  MODIFY `RequiredItem1` int(10) unsigned NOT NULL DEFAULT '0' AFTER `ID`,
  MODIFY `RequiredItem2` int(10) unsigned NOT NULL DEFAULT '0' AFTER `RequiredItem1`,
  MODIFY `RequiredItem3` int(10) unsigned NOT NULL DEFAULT '0' AFTER `RequiredItem2`,
  MODIFY `RequiredItem4` int(10) unsigned NOT NULL DEFAULT '0' AFTER `RequiredItem3`,
  MODIFY `RequiredItem5` int(10) unsigned NOT NULL DEFAULT '0' AFTER `RequiredItem4`,
  MODIFY `RequiredCurrencyCount1` int(10) unsigned NOT NULL DEFAULT '0' AFTER `RequiredItem5`,
  MODIFY `RequiredCurrencyCount2` int(10) unsigned NOT NULL DEFAULT '0' AFTER `RequiredCurrencyCount1`,
  MODIFY `RequiredCurrencyCount3` int(10) unsigned NOT NULL DEFAULT '0' AFTER `RequiredCurrencyCount2`,
  MODIFY `RequiredCurrencyCount4` int(10) unsigned NOT NULL DEFAULT '0' AFTER `RequiredCurrencyCount3`,
  MODIFY `RequiredCurrencyCount5` int(10) unsigned NOT NULL DEFAULT '0' AFTER `RequiredCurrencyCount4`,
  MODIFY `RequiredMoney` int(10) unsigned NOT NULL DEFAULT '0' AFTER `RequiredCurrencyCount5`,
  MODIFY `RequiredItemCount1` smallint(5) unsigned NOT NULL DEFAULT '0' AFTER `RequiredMoney`,
  MODIFY `RequiredItemCount2` smallint(5) unsigned NOT NULL DEFAULT '0' AFTER `RequiredItemCount1`,
  MODIFY `RequiredItemCount3` smallint(5) unsigned NOT NULL DEFAULT '0' AFTER `RequiredItemCount2`,
  MODIFY `RequiredItemCount4` smallint(5) unsigned NOT NULL DEFAULT '0' AFTER `RequiredItemCount3`,
  MODIFY `RequiredItemCount5` smallint(5) unsigned NOT NULL DEFAULT '0' AFTER `RequiredItemCount4`,
  MODIFY `RequiredPersonalArenaRating` smallint(5) unsigned NOT NULL DEFAULT '0' AFTER `RequiredItemCount5`,
  MODIFY `RequiredCurrency1` smallint(5) unsigned NOT NULL DEFAULT '0' AFTER `RequiredPersonalArenaRating`,
  MODIFY `RequiredCurrency2` smallint(5) unsigned NOT NULL DEFAULT '0' AFTER `RequiredCurrency1`,
  MODIFY `RequiredCurrency3` smallint(5) unsigned NOT NULL DEFAULT '0' AFTER `RequiredCurrency2`,
  MODIFY `RequiredCurrency4` smallint(5) unsigned NOT NULL DEFAULT '0' AFTER `RequiredCurrency3`,
  MODIFY `RequiredCurrency5` smallint(5) unsigned NOT NULL DEFAULT '0' AFTER `RequiredCurrency4`,
  MODIFY `RequiredArenaSlot` tinyint(3) unsigned NOT NULL DEFAULT '0' AFTER `RequiredCurrency5`,
  MODIFY `RequiredFactionId` tinyint(3) unsigned NOT NULL DEFAULT '0' AFTER `RequiredArenaSlot`,
  MODIFY `RequiredFactionStanding` tinyint(3) unsigned NOT NULL DEFAULT '0' AFTER `RequiredFactionId`,
  MODIFY `RequirementFlags` tinyint(3) unsigned NOT NULL DEFAULT '0' AFTER `RequiredFactionStanding`,
  MODIFY `RequiredAchievement` tinyint(3) unsigned NOT NULL DEFAULT '0' AFTER `RequirementFlags`,
  DROP `ItemPurchaseGroup`;

--
-- Table structure for table `item_limit_category`
--
ALTER TABLE `item_limit_category`
  MODIFY `Quantity` tinyint(3) unsigned NOT NULL DEFAULT '0' AFTER `Name`,
  MODIFY `Flags` tinyint(3) unsigned NOT NULL DEFAULT '0' AFTER `Quantity`;

--
-- Table structure for table `item_modified_appearance`
--
ALTER TABLE `item_modified_appearance`
  MODIFY `AppearanceID` smallint(5) unsigned NOT NULL DEFAULT '0' AFTER `ItemID`,
  MODIFY `AppearanceModID` tinyint(3) unsigned NOT NULL DEFAULT '0' AFTER `AppearanceID`,
  MODIFY `Index` tinyint(3) unsigned NOT NULL DEFAULT '0' AFTER `AppearanceModID`,
  DROP `IconFileDataID`;

--
-- Table structure for table `item_price_base`
--
ALTER TABLE `item_price_base`
  MODIFY `ArmorFactor` float NOT NULL DEFAULT '0' AFTER `ID`,
  MODIFY `WeaponFactor` float NOT NULL DEFAULT '0' AFTER `ArmorFactor`,
  MODIFY `ItemLevel` smallint(5) unsigned NOT NULL DEFAULT '0' AFTER `WeaponFactor`;

--
-- Table structure for table `item_random_properties`
--
ALTER TABLE `item_random_properties`
  MODIFY `Name` text AFTER `ID`,
  MODIFY `Enchantment1` smallint(5) unsigned NOT NULL DEFAULT '0' AFTER `Name`,
  MODIFY `Enchantment2` smallint(5) unsigned NOT NULL DEFAULT '0' AFTER `Enchantment1`,
  MODIFY `Enchantment3` smallint(5) unsigned NOT NULL DEFAULT '0' AFTER `Enchantment2`,
  MODIFY `Enchantment4` smallint(5) unsigned NOT NULL DEFAULT '0' AFTER `Enchantment3`,
  MODIFY `Enchantment5` smallint(5) unsigned NOT NULL DEFAULT '0' AFTER `Enchantment4`,
  DROP `InternalName`;

--
-- Table structure for table `item_random_properties_locale`
--
ALTER TABLE `item_random_properties_locale` DROP `InternalName_lang`;

--
-- Table structure for table `item_random_suffix`
--
ALTER TABLE `item_random_suffix`
  MODIFY `Enchantment1` smallint(5) unsigned NOT NULL DEFAULT '0' AFTER `InternalName`,
  MODIFY `Enchantment2` smallint(5) unsigned NOT NULL DEFAULT '0' AFTER `Enchantment1`,
  MODIFY `Enchantment3` smallint(5) unsigned NOT NULL DEFAULT '0' AFTER `Enchantment2`,
  MODIFY `Enchantment4` smallint(5) unsigned NOT NULL DEFAULT '0' AFTER `Enchantment3`,
  MODIFY `Enchantment5` smallint(5) unsigned NOT NULL DEFAULT '0' AFTER `Enchantment4`,
  MODIFY `AllocationPct1` smallint(5) unsigned NOT NULL DEFAULT '0' AFTER `Enchantment5`,
  MODIFY `AllocationPct2` smallint(5) unsigned NOT NULL DEFAULT '0' AFTER `AllocationPct1`,
  MODIFY `AllocationPct3` smallint(5) unsigned NOT NULL DEFAULT '0' AFTER `AllocationPct2`,
  MODIFY `AllocationPct4` smallint(5) unsigned NOT NULL DEFAULT '0' AFTER `AllocationPct3`,
  MODIFY `AllocationPct5` smallint(5) unsigned NOT NULL DEFAULT '0' AFTER `AllocationPct4`;

--
-- Table structure for table `item_set_spell`
--
DROP TABLE IF EXISTS `item_set_spell`;
CREATE TABLE `item_set_spell` (
  `ID` int(10) unsigned NOT NULL DEFAULT '0',
  `SpellID` int(10) unsigned NOT NULL DEFAULT '0',
  `ItemSetID` smallint(5) unsigned NOT NULL DEFAULT '0',
  `ChrSpecID` smallint(5) unsigned NOT NULL DEFAULT '0',
  `Threshold` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `VerifiedBuild` smallint(6) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Table structure for table `item_sparse`
--
ALTER TABLE `item_sparse`
  MODIFY `Flags1` int(10) unsigned NOT NULL DEFAULT '0' AFTER `ID`,
  MODIFY `Flags2` int(10) unsigned NOT NULL DEFAULT '0' AFTER `Flags1`,
  MODIFY `Flags3` int(10) unsigned NOT NULL DEFAULT '0' AFTER `Flags2`,
  MODIFY `Unk1` float NOT NULL DEFAULT '0' AFTER `Flags3`,
  MODIFY `Unk2` float NOT NULL DEFAULT '0' AFTER `Unk1`,
  MODIFY `BuyPrice` int(10) unsigned NOT NULL DEFAULT '0' AFTER `Unk2`,
  MODIFY `SellPrice` int(10) unsigned NOT NULL DEFAULT '0' AFTER `BuyPrice`,
  MODIFY `AllowableClass` int(11) NOT NULL DEFAULT '0' AFTER `SellPrice`,
  MODIFY `AllowableRace` int(11) NOT NULL DEFAULT '0' AFTER `AllowableClass`,
  MODIFY `RequiredSpell` int(10) unsigned NOT NULL DEFAULT '0' AFTER `AllowableRace`,
  MODIFY `MaxCount` int(10) unsigned NOT NULL DEFAULT '0' AFTER `RequiredSpell`,
  MODIFY `Stackable` int(10) unsigned NOT NULL DEFAULT '0' AFTER `MaxCount`,
  MODIFY `ItemStatAllocation1` int(11) NOT NULL DEFAULT '0' AFTER `Stackable`,
  MODIFY `ItemStatAllocation2` int(11) NOT NULL DEFAULT '0' AFTER `ItemStatAllocation1`,
  MODIFY `ItemStatAllocation3` int(11) NOT NULL DEFAULT '0' AFTER `ItemStatAllocation2`,
  MODIFY `ItemStatAllocation4` int(11) NOT NULL DEFAULT '0' AFTER `ItemStatAllocation3`,
  MODIFY `ItemStatAllocation5` int(11) NOT NULL DEFAULT '0' AFTER `ItemStatAllocation4`,
  MODIFY `ItemStatAllocation6` int(11) NOT NULL DEFAULT '0' AFTER `ItemStatAllocation5`,
  MODIFY `ItemStatAllocation7` int(11) NOT NULL DEFAULT '0' AFTER `ItemStatAllocation6`,
  MODIFY `ItemStatAllocation8` int(11) NOT NULL DEFAULT '0' AFTER `ItemStatAllocation7`,
  MODIFY `ItemStatAllocation9` int(11) NOT NULL DEFAULT '0' AFTER `ItemStatAllocation8`,
  MODIFY `ItemStatAllocation10` int(11) NOT NULL DEFAULT '0' AFTER `ItemStatAllocation9`,
  MODIFY `ItemStatSocketCostMultiplier1` float NOT NULL DEFAULT '0' AFTER `ItemStatAllocation10`,
  MODIFY `ItemStatSocketCostMultiplier2` float NOT NULL DEFAULT '0' AFTER `ItemStatSocketCostMultiplier1`,
  MODIFY `ItemStatSocketCostMultiplier3` float NOT NULL DEFAULT '0' AFTER `ItemStatSocketCostMultiplier2`,
  MODIFY `ItemStatSocketCostMultiplier4` float NOT NULL DEFAULT '0' AFTER `ItemStatSocketCostMultiplier3`,
  MODIFY `ItemStatSocketCostMultiplier5` float NOT NULL DEFAULT '0' AFTER `ItemStatSocketCostMultiplier4`,
  MODIFY `ItemStatSocketCostMultiplier6` float NOT NULL DEFAULT '0' AFTER `ItemStatSocketCostMultiplier5`,
  MODIFY `ItemStatSocketCostMultiplier7` float NOT NULL DEFAULT '0' AFTER `ItemStatSocketCostMultiplier6`,
  MODIFY `ItemStatSocketCostMultiplier8` float NOT NULL DEFAULT '0' AFTER `ItemStatSocketCostMultiplier7`,
  MODIFY `ItemStatSocketCostMultiplier9` float NOT NULL DEFAULT '0' AFTER `ItemStatSocketCostMultiplier8`,
  MODIFY `ItemStatSocketCostMultiplier10` float NOT NULL DEFAULT '0' AFTER `ItemStatSocketCostMultiplier9`,
  MODIFY `RangedModRange` float NOT NULL DEFAULT '0' AFTER `ItemStatSocketCostMultiplier10`,
  MODIFY `Name` text AFTER `RangedModRange`,
  MODIFY `Name2` text AFTER `Name`,
  MODIFY `Name3` text AFTER `Name2`,
  MODIFY `Name4` text AFTER `Name3`,
  MODIFY `Description` text AFTER `Name4`,
  MODIFY `BagFamily` int(10) unsigned NOT NULL DEFAULT '0' AFTER `Description`,
  MODIFY `ArmorDamageModifier` float NOT NULL DEFAULT '0' AFTER `BagFamily`,
  MODIFY `Duration` int(10) unsigned NOT NULL DEFAULT '0' AFTER `ArmorDamageModifier`,
  MODIFY `StatScalingFactor` float NOT NULL DEFAULT '0' AFTER `Duration`,
  MODIFY `ItemLevel` smallint(5) unsigned NOT NULL DEFAULT '0' AFTER `StatScalingFactor`,
  MODIFY `RequiredSkill` smallint(5) unsigned NOT NULL DEFAULT '0' AFTER `ItemLevel`,
  MODIFY `RequiredSkillRank` smallint(5) unsigned NOT NULL DEFAULT '0' AFTER `RequiredSkill`,
  MODIFY `RequiredReputationFaction` smallint(5) unsigned NOT NULL DEFAULT '0' AFTER `RequiredSkillRank`,
  MODIFY `ItemStatValue1` smallint(6) NOT NULL DEFAULT '0' AFTER `RequiredReputationFaction`,
  MODIFY `ItemStatValue2` smallint(6) NOT NULL DEFAULT '0' AFTER `ItemStatValue1`,
  MODIFY `ItemStatValue3` smallint(6) NOT NULL DEFAULT '0' AFTER `ItemStatValue2`,
  MODIFY `ItemStatValue4` smallint(6) NOT NULL DEFAULT '0' AFTER `ItemStatValue3`,
  MODIFY `ItemStatValue5` smallint(6) NOT NULL DEFAULT '0' AFTER `ItemStatValue4`,
  MODIFY `ItemStatValue6` smallint(6) NOT NULL DEFAULT '0' AFTER `ItemStatValue5`,
  MODIFY `ItemStatValue7` smallint(6) NOT NULL DEFAULT '0' AFTER `ItemStatValue6`,
  MODIFY `ItemStatValue8` smallint(6) NOT NULL DEFAULT '0' AFTER `ItemStatValue7`,
  MODIFY `ItemStatValue9` smallint(6) NOT NULL DEFAULT '0' AFTER `ItemStatValue8`,
  MODIFY `ItemStatValue10` smallint(6) NOT NULL DEFAULT '0' AFTER `ItemStatValue9`,
  MODIFY `ScalingStatDistribution` smallint(5) unsigned NOT NULL DEFAULT '0' AFTER `ItemStatValue10`,
  MODIFY `Delay` smallint(5) unsigned NOT NULL DEFAULT '0' AFTER `ScalingStatDistribution`,
  MODIFY `PageText` smallint(5) unsigned NOT NULL DEFAULT '0' AFTER `Delay`,
  MODIFY `StartQuest` smallint(5) unsigned NOT NULL DEFAULT '0' AFTER `PageText`,
  MODIFY `LockID` smallint(5) unsigned NOT NULL DEFAULT '0' AFTER `StartQuest`,
  MODIFY `RandomProperty` smallint(5) unsigned NOT NULL DEFAULT '0' AFTER `LockID`,
  MODIFY `RandomSuffix` smallint(5) unsigned NOT NULL DEFAULT '0' AFTER `RandomProperty`,
  MODIFY `ItemSet` smallint(5) unsigned NOT NULL DEFAULT '0' AFTER `RandomSuffix`,
  MODIFY `Area` smallint(5) unsigned NOT NULL DEFAULT '0' AFTER `ItemSet`,
  MODIFY `Map` smallint(5) unsigned NOT NULL DEFAULT '0' AFTER `Area`,
  MODIFY `SocketBonus` smallint(5) unsigned NOT NULL DEFAULT '0' AFTER `Map`,
  MODIFY `GemProperties` smallint(5) unsigned NOT NULL DEFAULT '0' AFTER `SocketBonus`,
  MODIFY `ItemLimitCategory` smallint(5) unsigned NOT NULL DEFAULT '0' AFTER `GemProperties`,
  MODIFY `HolidayID` smallint(5) unsigned NOT NULL DEFAULT '0' AFTER `ItemLimitCategory`,
  MODIFY `ItemNameDescriptionID` smallint(5) unsigned NOT NULL DEFAULT '0' AFTER `HolidayID`,
  MODIFY `Quality` tinyint(3) unsigned NOT NULL DEFAULT '0' AFTER `ItemNameDescriptionID`,
  MODIFY `BuyCount` tinyint(3) unsigned NOT NULL DEFAULT '0' AFTER `Quality`,
  MODIFY `InventoryType` tinyint(3) unsigned NOT NULL DEFAULT '0' AFTER `BuyCount`,
  MODIFY `RequiredLevel` tinyint(4) NOT NULL DEFAULT '0' AFTER `InventoryType`,
  MODIFY `RequiredHonorRank` tinyint(3) unsigned NOT NULL DEFAULT '0' AFTER `RequiredLevel`,
  MODIFY `RequiredCityRank` tinyint(3) unsigned NOT NULL DEFAULT '0' AFTER `RequiredHonorRank`,
  MODIFY `RequiredReputationRank` tinyint(3) unsigned NOT NULL DEFAULT '0' AFTER `RequiredCityRank`,
  MODIFY `ContainerSlots` tinyint(3) unsigned NOT NULL DEFAULT '0' AFTER `RequiredReputationRank`,
  MODIFY `ItemStatType1` tinyint(4) NOT NULL DEFAULT '0' AFTER `ContainerSlots`,
  MODIFY `ItemStatType2` tinyint(4) NOT NULL DEFAULT '0' AFTER `ItemStatType1`,
  MODIFY `ItemStatType3` tinyint(4) NOT NULL DEFAULT '0' AFTER `ItemStatType2`,
  MODIFY `ItemStatType4` tinyint(4) NOT NULL DEFAULT '0' AFTER `ItemStatType3`,
  MODIFY `ItemStatType5` tinyint(4) NOT NULL DEFAULT '0' AFTER `ItemStatType4`,
  MODIFY `ItemStatType6` tinyint(4) NOT NULL DEFAULT '0' AFTER `ItemStatType5`,
  MODIFY `ItemStatType7` tinyint(4) NOT NULL DEFAULT '0' AFTER `ItemStatType6`,
  MODIFY `ItemStatType8` tinyint(4) NOT NULL DEFAULT '0' AFTER `ItemStatType7`,
  MODIFY `ItemStatType9` tinyint(4) NOT NULL DEFAULT '0' AFTER `ItemStatType8`,
  MODIFY `ItemStatType10` tinyint(4) NOT NULL DEFAULT '0' AFTER `ItemStatType9`,
  MODIFY `DamageType` tinyint(3) unsigned NOT NULL DEFAULT '0' AFTER `ItemStatType10`,
  MODIFY `Bonding` tinyint(3) unsigned NOT NULL DEFAULT '0' AFTER `DamageType`,
  MODIFY `LanguageID` tinyint(3) unsigned NOT NULL DEFAULT '0' AFTER `Bonding`,
  MODIFY `PageMaterial` tinyint(3) unsigned NOT NULL DEFAULT '0' AFTER `LanguageID`,
  MODIFY `Material` tinyint(4) NOT NULL DEFAULT '0' AFTER `PageMaterial`,
  MODIFY `Sheath` tinyint(3) unsigned NOT NULL DEFAULT '0' AFTER `Material`,
  MODIFY `TotemCategory` tinyint(3) unsigned NOT NULL DEFAULT '0' AFTER `Sheath`,
  MODIFY `SocketColor1` tinyint(3) unsigned NOT NULL DEFAULT '0' AFTER `TotemCategory`,
  MODIFY `SocketColor2` tinyint(3) unsigned NOT NULL DEFAULT '0' AFTER `SocketColor1`,
  MODIFY `SocketColor3` tinyint(3) unsigned NOT NULL DEFAULT '0' AFTER `SocketColor2`,
  MODIFY `CurrencySubstitutionID` tinyint(3) unsigned NOT NULL DEFAULT '0' AFTER `SocketColor3`,
  MODIFY `CurrencySubstitutionCount` tinyint(3) unsigned NOT NULL DEFAULT '0' AFTER `CurrencySubstitutionID`,
  ADD `ArtifactID` tinyint(3) unsigned NOT NULL DEFAULT '0' AFTER `CurrencySubstitutionCount`;

--
-- Table structure for table `item_spec`
--
ALTER TABLE `item_spec`
  MODIFY `SpecID` smallint(5) unsigned NOT NULL DEFAULT '0' AFTER `ID`,
  MODIFY `MinLevel` tinyint(3) unsigned NOT NULL DEFAULT '0' AFTER `SpecID`,
  MODIFY `MaxLevel` tinyint(3) unsigned NOT NULL DEFAULT '0' AFTER `MinLevel`,
  MODIFY `ItemType` tinyint(3) unsigned NOT NULL DEFAULT '0' AFTER `MaxLevel`,
  MODIFY `PrimaryStat` tinyint(3) unsigned NOT NULL DEFAULT '0' AFTER `ItemType`,
  MODIFY `SecondaryStat` tinyint(3) unsigned NOT NULL DEFAULT '0' AFTER `PrimaryStat`;

--
-- Table structure for table `item_spec_override`
--
ALTER TABLE `item_spec_override` MODIFY `SpecID` smallint(5) unsigned NOT NULL DEFAULT '0' AFTER `ItemID`;

--
-- Table structure for table `item_to_battle_pet_species`
--
ALTER TABLE `item_to_battle_pet_species`
  MODIFY `BattlePetSpeciesID` smallint(5) unsigned NOT NULL DEFAULT '0' AFTER `ID`,
  ADD `VerifiedBuild` smallint(6) NOT NULL DEFAULT '0' AFTER `BattlePetSpeciesID`;

ALTER TABLE `item_to_battle_pet_species` ADD PRIMARY KEY (`ID`);

--
-- Table structure for table `item_x_bonus_tree`
--
ALTER TABLE `item_x_bonus_tree` MODIFY `BonusTreeID` smallint(5) unsigned NOT NULL DEFAULT '0' AFTER `ItemID`;

--
-- Table structure for table `key_chain`
--
ALTER TABLE `key_chain` DROP PRIMARY KEY;
ALTER TABLE `key_chain` CHANGE `Id` `ID` int(10) unsigned NOT NULL DEFAULT '0' FIRST;
ALTER TABLE `key_chain` ADD PRIMARY KEY (`ID`);

--
-- Table structure for table `modifier_tree`
--
ALTER TABLE `modifier_tree`
  MODIFY `Asset1` int(10) unsigned NOT NULL DEFAULT '0' AFTER `ID`,
  MODIFY `Asset2` int(10) unsigned NOT NULL DEFAULT '0' AFTER `Asset1`,
  MODIFY `Parent` smallint(5) unsigned NOT NULL DEFAULT '0' AFTER `Asset2`,
  MODIFY `Type` tinyint(3) unsigned NOT NULL DEFAULT '0' AFTER `Parent`,
  ADD `Unk700` tinyint(3) unsigned NOT NULL DEFAULT '0' AFTER `Type`,
  MODIFY `Operator` tinyint(3) unsigned NOT NULL DEFAULT '0' AFTER `Unk700`,
  MODIFY `Amount` tinyint(3) unsigned NOT NULL DEFAULT '0' AFTER `Operator`;

--
-- Table structure for table `mount`
--
ALTER TABLE `mount` DROP PRIMARY KEY;
ALTER TABLE `mount`
  CHANGE `Id` `ID` int(10) unsigned NOT NULL DEFAULT '0' FIRST ,
  MODIFY `SpellId` int(10) unsigned NOT NULL DEFAULT '0' AFTER `ID`,
  MODIFY `DisplayId` int(10) unsigned NOT NULL DEFAULT '0' AFTER `SpellId`,
  MODIFY `Name` text AFTER `DisplayId`,
  MODIFY `Description` text AFTER `Name`,
  MODIFY `SourceDescription` text AFTER `Description`,
  MODIFY `MountTypeId` smallint(5) unsigned NOT NULL DEFAULT '0' AFTER `SourceDescription`,
  MODIFY `Flags` smallint(5) unsigned NOT NULL DEFAULT '0' AFTER `MountTypeId`,
  MODIFY `PlayerConditionId` smallint(5) unsigned NOT NULL DEFAULT '0' AFTER `Flags`,
  MODIFY `Source` tinyint(3) unsigned NOT NULL DEFAULT '0' AFTER `PlayerConditionId`;
ALTER TABLE `mount` ADD PRIMARY KEY (`ID`);

--
-- Dumping data for table `mount`
--
ALTER TABLE `mount_locale` DROP PRIMARY KEY;
ALTER TABLE `mount_locale` CHANGE `Id` `ID` int(10) unsigned NOT NULL DEFAULT '0' FIRST;
ALTER TABLE `mount_locale` ADD PRIMARY KEY (`ID`, `locale`);

--
-- Table structure for table `mount_capability`
--
ALTER TABLE `mount_capability`
  MODIFY `RequiredSpell` int(10) unsigned NOT NULL DEFAULT '0' AFTER `ID`,
  MODIFY `SpeedModSpell` int(10) unsigned NOT NULL DEFAULT '0' AFTER `RequiredSpell`,
  MODIFY `RequiredRidingSkill` smallint(5) unsigned NOT NULL DEFAULT '0' AFTER `SpeedModSpell`,
  MODIFY `RequiredArea` smallint(5) unsigned NOT NULL DEFAULT '0' AFTER `RequiredRidingSkill`,
  MODIFY `RequiredMap` smallint(6) NOT NULL DEFAULT '0' AFTER `RequiredArea`,
  MODIFY `Flags` tinyint(3) unsigned NOT NULL DEFAULT '0' AFTER `RequiredMap`,
  MODIFY `RequiredAura` tinyint(3) unsigned NOT NULL DEFAULT '0' AFTER `Flags`;

--
-- Table structure for table `mount_type_x_capability`
--
ALTER TABLE `mount_type_x_capability`
  MODIFY `MountTypeID` smallint(5) unsigned NOT NULL DEFAULT '0' AFTER `ID`,
  MODIFY `MountCapabilityID` smallint(5) unsigned NOT NULL DEFAULT '0' AFTER `MountTypeID`,
  MODIFY `OrderIndex` tinyint(3) unsigned NOT NULL DEFAULT '0' AFTER `MountCapabilityID`;

--
-- Table structure for table `movie`
--
DROP TABLE IF EXISTS `movie`;
CREATE TABLE `movie` (
  `ID` int(10) unsigned NOT NULL DEFAULT '0',
  `AudioFileDataID` int(10) unsigned NOT NULL DEFAULT '0',
  `SubtitleFileDataID` int(10) unsigned NOT NULL DEFAULT '0',
  `Volume` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `KeyID` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `VerifiedBuild` smallint(6) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Table structure for table `names_profanity`
--
ALTER TABLE `names_profanity` MODIFY `Language` tinyint(4) NOT NULL DEFAULT '0' AFTER `Name`;

--
-- Table structure for table `names_reserved_locale`
--
ALTER TABLE `names_reserved_locale` MODIFY `LocaleMask` tinyint(3) unsigned NOT NULL DEFAULT '0' AFTER `Name`;

--
-- Table structure for table `name_gen`
--
ALTER TABLE `name_gen`
  MODIFY `Race` tinyint(3) unsigned NOT NULL DEFAULT '0' AFTER `Name`,
  MODIFY `Sex` tinyint(3) unsigned NOT NULL DEFAULT '0' AFTER `Race`;

--
-- Table structure for table `override_spell_data`
--
ALTER TABLE `override_spell_data`
  MODIFY `PlayerActionbarFileDataID` int(10) unsigned NOT NULL DEFAULT '0' AFTER `SpellID10`,
  MODIFY `Flags` tinyint(3) unsigned NOT NULL DEFAULT '0' AFTER `PlayerActionbarFileDataID`;

--
-- Table structure for table `phase_x_phase_group`
--
ALTER TABLE `phase_x_phase_group`
  MODIFY `PhaseID` smallint(5) unsigned NOT NULL DEFAULT '0' AFTER `ID`,
  MODIFY `PhaseGroupID` smallint(5) unsigned NOT NULL DEFAULT '0' AFTER `PhaseID`,
  MODIFY `VerifiedBuild` smallint(6) NOT NULL DEFAULT '0' AFTER `PhaseGroupID`;

--
-- Table structure for table `player_condition`
--
ALTER TABLE `player_condition`
  MODIFY `RaceMask` int(10) unsigned NOT NULL DEFAULT '0' AFTER `ID`,
  MODIFY `SkillLogic` int(10) unsigned NOT NULL DEFAULT '0' AFTER `RaceMask`,
  MODIFY `ReputationLogic` int(10) unsigned NOT NULL DEFAULT '0' AFTER `SkillLogic`,
  MODIFY `PrevQuestLogic` int(10) unsigned NOT NULL DEFAULT '0' AFTER `ReputationLogic`,
  MODIFY `CurrQuestLogic` int(10) unsigned NOT NULL DEFAULT '0' AFTER `PrevQuestLogic`,
  MODIFY `CurrentCompletedQuestLogic` int(10) unsigned NOT NULL DEFAULT '0' AFTER `CurrQuestLogic`,
  MODIFY `SpellLogic` int(10) unsigned NOT NULL DEFAULT '0' AFTER `CurrentCompletedQuestLogic`,
  MODIFY `SpellID1` int(10) unsigned NOT NULL DEFAULT '0' AFTER `SpellLogic`,
  MODIFY `SpellID2` int(10) unsigned NOT NULL DEFAULT '0' AFTER `SpellID1`,
  MODIFY `SpellID3` int(10) unsigned NOT NULL DEFAULT '0' AFTER `SpellID2`,
  MODIFY `SpellID4` int(10) unsigned NOT NULL DEFAULT '0' AFTER `SpellID3`,
  MODIFY `ItemLogic` int(10) unsigned NOT NULL DEFAULT '0' AFTER `SpellID4`,
  MODIFY `ItemID1` int(10) unsigned NOT NULL DEFAULT '0' AFTER `ItemLogic`,
  MODIFY `ItemID2` int(10) unsigned NOT NULL DEFAULT '0' AFTER `ItemID1`,
  MODIFY `ItemID3` int(10) unsigned NOT NULL DEFAULT '0' AFTER `ItemID2`,
  MODIFY `ItemID4` int(10) unsigned NOT NULL DEFAULT '0' AFTER `ItemID3`,
  MODIFY `Time1` int(10) unsigned NOT NULL DEFAULT '0' AFTER `ItemID4`,
  MODIFY `Time2` int(10) unsigned NOT NULL DEFAULT '0' AFTER `Time1`,
  MODIFY `AuraSpellLogic` int(10) unsigned NOT NULL DEFAULT '0' AFTER `Time2`,
  MODIFY `AuraSpellID1` int(10) unsigned NOT NULL DEFAULT '0' AFTER `AuraSpellLogic`,
  MODIFY `AuraSpellID2` int(10) unsigned NOT NULL DEFAULT '0' AFTER `AuraSpellID1`,
  MODIFY `AuraSpellID3` int(10) unsigned NOT NULL DEFAULT '0' AFTER `AuraSpellID2`,
  MODIFY `AuraSpellID4` int(10) unsigned NOT NULL DEFAULT '0' AFTER `AuraSpellID3`,
  MODIFY `AchievementLogic` int(10) unsigned NOT NULL DEFAULT '0' AFTER `AuraSpellID4`,
  MODIFY `AreaLogic` int(10) unsigned NOT NULL DEFAULT '0' AFTER `AchievementLogic`,
  MODIFY `QuestKillLogic` int(10) unsigned NOT NULL DEFAULT '0' AFTER `AreaLogic`,
  MODIFY `QuestKillMonster1` int(10) unsigned NOT NULL DEFAULT '0' AFTER `QuestKillLogic`,
  MODIFY `QuestKillMonster2` int(10) unsigned NOT NULL DEFAULT '0' AFTER `QuestKillMonster1`,
  MODIFY `QuestKillMonster3` int(10) unsigned NOT NULL DEFAULT '0' AFTER `QuestKillMonster2`,
  MODIFY `QuestKillMonster4` int(10) unsigned NOT NULL DEFAULT '0' AFTER `QuestKillMonster3`,
  ADD `QuestKillMonster5` int(10) unsigned NOT NULL DEFAULT '0' AFTER `QuestKillMonster4`,
  ADD `QuestKillMonster6` int(10) unsigned NOT NULL DEFAULT '0' AFTER `QuestKillMonster5`,
  MODIFY `FailureDescription` text AFTER `QuestKillMonster6`,
  ADD `Unknown700_1` int(10) unsigned NOT NULL DEFAULT '0' AFTER `FailureDescription`,
  ADD `Unknown700_2` int(10) unsigned NOT NULL DEFAULT '0' AFTER `Unknown700_1`,
  MODIFY `MinLevel` smallint(5) unsigned NOT NULL DEFAULT '0' AFTER `Unknown700_2`,
  MODIFY `MaxLevel` smallint(5) unsigned NOT NULL DEFAULT '0' AFTER `MinLevel`,
  MODIFY `ClassMask` smallint(5) unsigned NOT NULL DEFAULT '0' AFTER `MaxLevel`,
  MODIFY `SkillID1` smallint(5) unsigned NOT NULL DEFAULT '0' AFTER `ClassMask`,
  MODIFY `SkillID2` smallint(5) unsigned NOT NULL DEFAULT '0' AFTER `SkillID1`,
  MODIFY `SkillID3` smallint(5) unsigned NOT NULL DEFAULT '0' AFTER `SkillID2`,
  MODIFY `SkillID4` smallint(5) unsigned NOT NULL DEFAULT '0' AFTER `SkillID3`,
  MODIFY `MinSkill1` smallint(6) NOT NULL DEFAULT '0' AFTER `SkillID4`,
  MODIFY `MinSkill2` smallint(6) NOT NULL DEFAULT '0' AFTER `MinSkill1`,
  MODIFY `MinSkill3` smallint(6) NOT NULL DEFAULT '0' AFTER `MinSkill2`,
  MODIFY `MinSkill4` smallint(6) NOT NULL DEFAULT '0' AFTER `MinSkill3`,
  MODIFY `MaxSkill1` smallint(6) NOT NULL DEFAULT '0' AFTER `MinSkill4`,
  MODIFY `MaxSkill2` smallint(6) NOT NULL DEFAULT '0' AFTER `MaxSkill1`,
  MODIFY `MaxSkill3` smallint(6) NOT NULL DEFAULT '0' AFTER `MaxSkill2`,
  MODIFY `MaxSkill4` smallint(6) NOT NULL DEFAULT '0' AFTER `MaxSkill3`,
  MODIFY `MinFactionID1` smallint(5) unsigned NOT NULL DEFAULT '0' AFTER `MaxSkill4`,
  MODIFY `MinFactionID2` smallint(5) unsigned NOT NULL DEFAULT '0' AFTER `MinFactionID1`,
  MODIFY `MinFactionID3` smallint(5) unsigned NOT NULL DEFAULT '0' AFTER `MinFactionID2`,
  MODIFY `MaxFactionID` smallint(5) unsigned NOT NULL DEFAULT '0' AFTER `MinFactionID3`,
  MODIFY `PrevQuestID1` smallint(5) unsigned NOT NULL DEFAULT '0' AFTER `MaxFactionID`,
  MODIFY `PrevQuestID2` smallint(5) unsigned NOT NULL DEFAULT '0' AFTER `PrevQuestID1`,
  MODIFY `PrevQuestID3` smallint(5) unsigned NOT NULL DEFAULT '0' AFTER `PrevQuestID2`,
  MODIFY `PrevQuestID4` smallint(5) unsigned NOT NULL DEFAULT '0' AFTER `PrevQuestID3`,
  MODIFY `CurrQuestID1` smallint(5) unsigned NOT NULL DEFAULT '0' AFTER `PrevQuestID4`,
  MODIFY `CurrQuestID2` smallint(5) unsigned NOT NULL DEFAULT '0' AFTER `CurrQuestID1`,
  MODIFY `CurrQuestID3` smallint(5) unsigned NOT NULL DEFAULT '0' AFTER `CurrQuestID2`,
  MODIFY `CurrQuestID4` smallint(5) unsigned NOT NULL DEFAULT '0' AFTER `CurrQuestID3`,
  MODIFY `CurrentCompletedQuestID1` smallint(5) unsigned NOT NULL DEFAULT '0' AFTER `CurrQuestID4`,
  MODIFY `CurrentCompletedQuestID2` smallint(5) unsigned NOT NULL DEFAULT '0' AFTER `CurrentCompletedQuestID1`,
  MODIFY `CurrentCompletedQuestID3` smallint(5) unsigned NOT NULL DEFAULT '0' AFTER `CurrentCompletedQuestID2`,
  MODIFY `CurrentCompletedQuestID4` smallint(5) unsigned NOT NULL DEFAULT '0' AFTER `CurrentCompletedQuestID3`,
  MODIFY `Explored1` smallint(5) unsigned NOT NULL DEFAULT '0' AFTER `CurrentCompletedQuestID4`,
  MODIFY `Explored2` smallint(5) unsigned NOT NULL DEFAULT '0' AFTER `Explored1`,
  MODIFY `WorldStateExpressionID` smallint(5) unsigned NOT NULL DEFAULT '0' AFTER `Explored2`,
  MODIFY `Achievement1` smallint(5) unsigned NOT NULL DEFAULT '0' AFTER `WorldStateExpressionID`,
  MODIFY `Achievement2` smallint(5) unsigned NOT NULL DEFAULT '0' AFTER `Achievement1`,
  MODIFY `Achievement3` smallint(5) unsigned NOT NULL DEFAULT '0' AFTER `Achievement2`,
  MODIFY `Achievement4` smallint(5) unsigned NOT NULL DEFAULT '0' AFTER `Achievement3`,
  MODIFY `AreaID1` smallint(5) unsigned NOT NULL DEFAULT '0' AFTER `Achievement4`,
  MODIFY `AreaID2` smallint(5) unsigned NOT NULL DEFAULT '0' AFTER `AreaID1`,
  MODIFY `AreaID3` smallint(5) unsigned NOT NULL DEFAULT '0' AFTER `AreaID2`,
  MODIFY `AreaID4` smallint(5) unsigned NOT NULL DEFAULT '0' AFTER `AreaID3`,
  MODIFY `QuestKillID` smallint(5) unsigned NOT NULL DEFAULT '0' AFTER `AreaID4`,
  MODIFY `PhaseID` smallint(5) unsigned NOT NULL DEFAULT '0' AFTER `QuestKillID`,
  MODIFY `MinAvgItemLevel` smallint(5) unsigned NOT NULL DEFAULT '0' AFTER `PhaseID`,
  MODIFY `MaxAvgItemLevel` smallint(5) unsigned NOT NULL DEFAULT '0' AFTER `MinAvgItemLevel`,
  MODIFY `MinAvgEquippedItemLevel` smallint(5) unsigned NOT NULL DEFAULT '0' AFTER `MaxAvgItemLevel`,
  MODIFY `MaxAvgEquippedItemLevel` smallint(5) unsigned NOT NULL DEFAULT '0' AFTER `MinAvgEquippedItemLevel`,
  ADD `ModifierTreeID` smallint(5) unsigned NOT NULL DEFAULT '0' AFTER `MaxAvgEquippedItemLevel`,
  MODIFY `Flags` tinyint(3) unsigned NOT NULL DEFAULT '0' AFTER `ModifierTreeID`,
  MODIFY `Gender` tinyint(4) NOT NULL DEFAULT '0' AFTER `Flags`,
  MODIFY `NativeGender` tinyint(4) NOT NULL DEFAULT '0' AFTER `Gender`,
  MODIFY `LanguageID` tinyint(3) unsigned NOT NULL DEFAULT '0' AFTER `NativeGender`,
  MODIFY `MinLanguage` tinyint(3) unsigned NOT NULL DEFAULT '0' AFTER `LanguageID`,
  MODIFY `MaxLanguage` tinyint(3) unsigned NOT NULL DEFAULT '0' AFTER `MinLanguage`,
  MODIFY `MinReputation1` tinyint(3) unsigned NOT NULL DEFAULT '0' AFTER `MaxLanguage`,
  MODIFY `MinReputation2` tinyint(3) unsigned NOT NULL DEFAULT '0' AFTER `MinReputation1`,
  MODIFY `MinReputation3` tinyint(3) unsigned NOT NULL DEFAULT '0' AFTER `MinReputation2`,
  MODIFY `MaxReputation` tinyint(3) unsigned NOT NULL DEFAULT '0' AFTER `MinReputation3`,
  MODIFY `Unknown1` tinyint(3) unsigned NOT NULL DEFAULT '0' AFTER `MaxReputation`,
  MODIFY `MinPVPRank` tinyint(3) unsigned NOT NULL DEFAULT '0' AFTER `Unknown1`,
  MODIFY `MaxPVPRank` tinyint(3) unsigned NOT NULL DEFAULT '0' AFTER `MinPVPRank`,
  MODIFY `PvpMedal` tinyint(3) unsigned NOT NULL DEFAULT '0' AFTER `MaxPVPRank`,
  MODIFY `ItemCount1` tinyint(3) unsigned NOT NULL DEFAULT '0' AFTER `PvpMedal`,
  MODIFY `ItemCount2` tinyint(3) unsigned NOT NULL DEFAULT '0' AFTER `ItemCount1`,
  MODIFY `ItemCount3` tinyint(3) unsigned NOT NULL DEFAULT '0' AFTER `ItemCount2`,
  MODIFY `ItemCount4` tinyint(3) unsigned NOT NULL DEFAULT '0' AFTER `ItemCount3`,
  MODIFY `ItemFlags` tinyint(3) unsigned NOT NULL DEFAULT '0' AFTER `ItemCount4`,
  ADD `AuraCount1` tinyint(3) unsigned NOT NULL DEFAULT '0' AFTER `ItemFlags`,
  ADD `AuraCount2` tinyint(3) unsigned NOT NULL DEFAULT '0' AFTER `AuraCount1`,
  ADD `AuraCount3` tinyint(3) unsigned NOT NULL DEFAULT '0' AFTER `AuraCount2`,
  ADD `AuraCount4` tinyint(3) unsigned NOT NULL DEFAULT '0' AFTER `AuraCount3`,
  MODIFY `WeatherID` tinyint(3) unsigned NOT NULL DEFAULT '0' AFTER `AuraCount4`,
  MODIFY `PartyStatus` tinyint(3) unsigned NOT NULL DEFAULT '0' AFTER `WeatherID`,
  MODIFY `LifetimeMaxPVPRank` tinyint(3) unsigned NOT NULL DEFAULT '0' AFTER `PartyStatus`,
  MODIFY `LfgLogic` tinyint(3) unsigned NOT NULL DEFAULT '0' AFTER `LifetimeMaxPVPRank`,
  MODIFY `LfgStatus1` tinyint(3) unsigned NOT NULL DEFAULT '0' AFTER `LfgLogic`,
  MODIFY `LfgStatus2` tinyint(3) unsigned NOT NULL DEFAULT '0' AFTER `LfgStatus1`,
  MODIFY `LfgStatus3` tinyint(3) unsigned NOT NULL DEFAULT '0' AFTER `LfgStatus2`,
  MODIFY `LfgStatus4` tinyint(3) unsigned NOT NULL DEFAULT '0' AFTER `LfgStatus3`,
  MODIFY `LfgCompare1` tinyint(3) unsigned NOT NULL DEFAULT '0' AFTER `LfgStatus4`,
  MODIFY `LfgCompare2` tinyint(3) unsigned NOT NULL DEFAULT '0' AFTER `LfgCompare1`,
  MODIFY `LfgCompare3` tinyint(3) unsigned NOT NULL DEFAULT '0' AFTER `LfgCompare2`,
  MODIFY `LfgCompare4` tinyint(3) unsigned NOT NULL DEFAULT '0' AFTER `LfgCompare3`,
  MODIFY `LfgValue1` tinyint(3) unsigned NOT NULL DEFAULT '0' AFTER `LfgCompare4`,
  MODIFY `LfgValue2` tinyint(3) unsigned NOT NULL DEFAULT '0' AFTER `LfgValue1`,
  MODIFY `LfgValue3` tinyint(3) unsigned NOT NULL DEFAULT '0' AFTER `LfgValue2`,
  MODIFY `LfgValue4` tinyint(3) unsigned NOT NULL DEFAULT '0' AFTER `LfgValue3`,
  MODIFY `CurrencyLogic` tinyint(3) unsigned NOT NULL DEFAULT '0' AFTER `LfgValue4`,
  MODIFY `CurrencyID1` tinyint(3) unsigned NOT NULL DEFAULT '0' AFTER `CurrencyLogic`,
  MODIFY `CurrencyID2` tinyint(3) unsigned NOT NULL DEFAULT '0' AFTER `CurrencyID1`,
  MODIFY `CurrencyID3` tinyint(3) unsigned NOT NULL DEFAULT '0' AFTER `CurrencyID2`,
  MODIFY `CurrencyID4` tinyint(3) unsigned NOT NULL DEFAULT '0' AFTER `CurrencyID3`,
  MODIFY `CurrencyCount1` tinyint(3) unsigned NOT NULL DEFAULT '0' AFTER `CurrencyID4`,
  MODIFY `CurrencyCount2` tinyint(3) unsigned NOT NULL DEFAULT '0' AFTER `CurrencyCount1`,
  MODIFY `CurrencyCount3` tinyint(3) unsigned NOT NULL DEFAULT '0' AFTER `CurrencyCount2`,
  MODIFY `CurrencyCount4` tinyint(3) unsigned NOT NULL DEFAULT '0' AFTER `CurrencyCount3`,
  MODIFY `MinExpansionLevel` tinyint(4) NOT NULL DEFAULT '0' AFTER `CurrencyCount4`,
  MODIFY `MaxExpansionLevel` tinyint(4) NOT NULL DEFAULT '0' AFTER `MinExpansionLevel`,
  MODIFY `MinExpansionTier` tinyint(4) NOT NULL DEFAULT '0' AFTER `MaxExpansionLevel`,
  MODIFY `MaxExpansionTier` tinyint(4) NOT NULL DEFAULT '0' AFTER `MinExpansionTier`,
  MODIFY `MinGuildLevel` tinyint(3) unsigned NOT NULL DEFAULT '0' AFTER `MaxExpansionTier`,
  MODIFY `MaxGuildLevel` tinyint(3) unsigned NOT NULL DEFAULT '0' AFTER `MinGuildLevel`,
  MODIFY `PhaseUseFlags` tinyint(3) unsigned NOT NULL DEFAULT '0' AFTER `MaxGuildLevel`,
  MODIFY `PhaseGroupID` tinyint(3) unsigned NOT NULL DEFAULT '0' AFTER `PhaseUseFlags`,
  MODIFY `ChrSpecializationIndex` tinyint(4) NOT NULL DEFAULT '0' AFTER `PhaseGroupID`,
  MODIFY `ChrSpecializationRole` tinyint(4) NOT NULL DEFAULT '0' AFTER `ChrSpecializationIndex`,
  MODIFY `PowerType` tinyint(4) NOT NULL DEFAULT '0' AFTER `ChrSpecializationRole`,
  MODIFY `PowerTypeComp` tinyint(4) NOT NULL DEFAULT '0' AFTER `PowerType`,
  MODIFY `PowerTypeValue` tinyint(4) NOT NULL DEFAULT '0' AFTER `PowerTypeComp`;

--
-- Table structure for table `power_display`
--
DROP TABLE IF EXISTS `power_display`;
CREATE TABLE `power_display` (
  `ID` int(10) unsigned NOT NULL DEFAULT '0',
  `GlobalStringBaseTag` text,
  `PowerType` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `Red` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `Green` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `Blue` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `VerifiedBuild` smallint(6) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Table structure for table `quest_faction_reward`
--
DROP TABLE IF EXISTS `quest_faction_reward`;
CREATE TABLE `quest_faction_reward` (
  `ID` int(10) unsigned NOT NULL DEFAULT '0',
  `QuestRewFactionValue1` smallint(6) NOT NULL DEFAULT '0',
  `QuestRewFactionValue2` smallint(6) NOT NULL DEFAULT '0',
  `QuestRewFactionValue3` smallint(6) NOT NULL DEFAULT '0',
  `QuestRewFactionValue4` smallint(6) NOT NULL DEFAULT '0',
  `QuestRewFactionValue5` smallint(6) NOT NULL DEFAULT '0',
  `QuestRewFactionValue6` smallint(6) NOT NULL DEFAULT '0',
  `QuestRewFactionValue7` smallint(6) NOT NULL DEFAULT '0',
  `QuestRewFactionValue8` smallint(6) NOT NULL DEFAULT '0',
  `QuestRewFactionValue9` smallint(6) NOT NULL DEFAULT '0',
  `QuestRewFactionValue10` smallint(6) NOT NULL DEFAULT '0',
  `VerifiedBuild` smallint(6) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Table structure for table `quest_money_reward`
--
ALTER TABLE `quest_money_reward` DROP PRIMARY KEY;
ALTER TABLE `quest_money_reward` CHANGE `Level` `ID` int(10) unsigned NOT NULL DEFAULT '0' FIRST;
ALTER TABLE `quest_money_reward` ADD PRIMARY KEY (`ID`);

--
-- Table structure for table `quest_package_item`
--
ALTER TABLE `quest_package_item`
  MODIFY `ItemID` int(10) unsigned NOT NULL DEFAULT '0' AFTER `ID`,
  MODIFY `QuestPackageID` smallint(5) unsigned NOT NULL DEFAULT '0' AFTER `ItemID`,
  MODIFY `ItemCount` tinyint(3) unsigned NOT NULL DEFAULT '0' AFTER `QuestPackageID`,
  MODIFY `FilterType` tinyint(3) unsigned NOT NULL DEFAULT '0' AFTER `ItemCount`;

--
-- Table structure for table `quest_v2`
--
ALTER TABLE `quest_v2` MODIFY `UniqueBitFlag` smallint(5) unsigned NOT NULL DEFAULT '0' AFTER `ID`;

--
-- Table structure for table `quest_x_p`
--
ALTER TABLE `quest_xp`
  MODIFY `Exp1` smallint(5) unsigned NOT NULL DEFAULT '0' AFTER `ID`,
  MODIFY `Exp2` smallint(5) unsigned NOT NULL DEFAULT '0' AFTER `Exp1`,
  MODIFY `Exp3` smallint(5) unsigned NOT NULL DEFAULT '0' AFTER `Exp2`,
  MODIFY `Exp4` smallint(5) unsigned NOT NULL DEFAULT '0' AFTER `Exp3`,
  MODIFY `Exp5` smallint(5) unsigned NOT NULL DEFAULT '0' AFTER `Exp4`,
  MODIFY `Exp6` smallint(5) unsigned NOT NULL DEFAULT '0' AFTER `Exp5`,
  MODIFY `Exp7` smallint(5) unsigned NOT NULL DEFAULT '0' AFTER `Exp6`,
  MODIFY `Exp8` smallint(5) unsigned NOT NULL DEFAULT '0' AFTER `Exp7`,
  MODIFY `Exp9` smallint(5) unsigned NOT NULL DEFAULT '0' AFTER `Exp8`,
  MODIFY `Exp10` smallint(5) unsigned NOT NULL DEFAULT '0' AFTER `Exp9`;

--
-- Table structure for table `rand_prop_points`
--
DROP TABLE IF EXISTS `rand_prop_points`;
CREATE TABLE `rand_prop_points` (
  `ID` int(10) unsigned NOT NULL DEFAULT '0',
  `EpicPropertiesPoints1` smallint(5) unsigned NOT NULL DEFAULT '0',
  `EpicPropertiesPoints2` smallint(5) unsigned NOT NULL DEFAULT '0',
  `EpicPropertiesPoints3` smallint(5) unsigned NOT NULL DEFAULT '0',
  `EpicPropertiesPoints4` smallint(5) unsigned NOT NULL DEFAULT '0',
  `EpicPropertiesPoints5` smallint(5) unsigned NOT NULL DEFAULT '0',
  `RarePropertiesPoints1` smallint(5) unsigned NOT NULL DEFAULT '0',
  `RarePropertiesPoints2` smallint(5) unsigned NOT NULL DEFAULT '0',
  `RarePropertiesPoints3` smallint(5) unsigned NOT NULL DEFAULT '0',
  `RarePropertiesPoints4` smallint(5) unsigned NOT NULL DEFAULT '0',
  `RarePropertiesPoints5` smallint(5) unsigned NOT NULL DEFAULT '0',
  `UncommonPropertiesPoints1` smallint(5) unsigned NOT NULL DEFAULT '0',
  `UncommonPropertiesPoints2` smallint(5) unsigned NOT NULL DEFAULT '0',
  `UncommonPropertiesPoints3` smallint(5) unsigned NOT NULL DEFAULT '0',
  `UncommonPropertiesPoints4` smallint(5) unsigned NOT NULL DEFAULT '0',
  `UncommonPropertiesPoints5` smallint(5) unsigned NOT NULL DEFAULT '0',
  `VerifiedBuild` smallint(6) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Table structure for table `scaling_stat_distribution`
--
ALTER TABLE `scaling_stat_distribution`
  MODIFY `ItemLevelCurveID` smallint(5) unsigned NOT NULL DEFAULT '0' AFTER `ID`,
  MODIFY `MinLevel` tinyint(3) unsigned NOT NULL DEFAULT '0' AFTER `ItemLevelCurveID`,
  MODIFY `MaxLevel` tinyint(3) unsigned NOT NULL DEFAULT '0' AFTER `MinLevel`;

--
-- Table structure for table `skill_line`
--
DROP TABLE IF EXISTS `skill_line`;
CREATE TABLE `skill_line` (
  `ID` int(10) unsigned NOT NULL DEFAULT '0',
  `DisplayName` text,
  `Description` text,
  `AlternateVerb` text,
  `SpellIconID` smallint(5) unsigned NOT NULL DEFAULT '0',
  `Flags` smallint(5) unsigned NOT NULL DEFAULT '0',
  `CategoryID` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `CanLink` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `ParentSkillLineID` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `VerifiedBuild` smallint(6) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Table structure for table `skill_line_locale`
--

DROP TABLE IF EXISTS `skill_line_locale`;
CREATE TABLE `skill_line_locale` (
  `ID` int(10) unsigned NOT NULL DEFAULT '0',
  `locale` varchar(4) NOT NULL,
  `DisplayName_lang` text,
  `Description_lang` text,
  `AlternateVerb_lang` text,
  `VerifiedBuild` smallint(6) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`locale`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Table structure for table `skill_line_ability`
--
DROP TABLE IF EXISTS `skill_line_ability`;
CREATE TABLE `skill_line_ability` (
  `ID` int(10) unsigned NOT NULL DEFAULT '0',
  `SpellID` int(10) unsigned NOT NULL DEFAULT '0',
  `RaceMask` int(10) unsigned NOT NULL DEFAULT '0',
  `ClassMask` int(10) unsigned NOT NULL DEFAULT '0',
  `SupercedesSpell` int(10) unsigned NOT NULL DEFAULT '0',
  `SkillLine` smallint(5) unsigned NOT NULL DEFAULT '0',
  `MinSkillLineRank` smallint(5) unsigned NOT NULL DEFAULT '0',
  `TrivialSkillLineRankHigh` smallint(5) unsigned NOT NULL DEFAULT '0',
  `TrivialSkillLineRankLow` smallint(5) unsigned NOT NULL DEFAULT '0',
  `UniqueBit` smallint(5) unsigned NOT NULL DEFAULT '0',
  `TradeSkillCategoryID` smallint(5) unsigned NOT NULL DEFAULT '0',
  `AquireMethod` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `NumSkillUps` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `VerifiedBuild` smallint(6) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Table structure for table `skill_race_class_info`
--
DROP TABLE IF EXISTS `skill_race_class_info`;
CREATE TABLE `skill_race_class_info` (
  `ID` int(10) unsigned NOT NULL DEFAULT '0',
  `RaceMask` int(11) NOT NULL DEFAULT '0',
  `SkillID` smallint(5) unsigned NOT NULL DEFAULT '0',
  `ClassMask` smallint(6) NOT NULL DEFAULT '0',
  `Flags` smallint(5) unsigned NOT NULL DEFAULT '0',
  `SkillTierID` smallint(5) unsigned NOT NULL DEFAULT '0',
  `Availability` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `MinLevel` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `VerifiedBuild` smallint(6) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Table structure for table `sound_kit`
--
DROP TABLE IF EXISTS `sound_kit`;
CREATE TABLE `sound_kit` (
  `ID` int(10) unsigned NOT NULL DEFAULT '0',
  `SoundType` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `Name` text,
  `VolumeFloat` float NOT NULL DEFAULT '0',
  `MinDistance` float NOT NULL DEFAULT '0',
  `DistanceCutoff` float NOT NULL DEFAULT '0',
  `VolumeVariationPlus` float NOT NULL DEFAULT '0',
  `VolumeVariationMinus` float NOT NULL DEFAULT '0',
  `PitchVariationPlus` float NOT NULL DEFAULT '0',
  `PitchVariationMinus` float NOT NULL DEFAULT '0',
  `PitchAdjust` float NOT NULL DEFAULT '0',
  `Flags` smallint(5) unsigned NOT NULL DEFAULT '0',
  `SoundEntriesAdvancedID` smallint(5) unsigned NOT NULL DEFAULT '0',
  `EAXDef` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `DialogType` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `BusOverwriteID` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `Unk700` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `VerifiedBuild` smallint(6) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Table structure for table `sound_kit_locale`
--
DROP TABLE IF EXISTS `sound_kit_locale`;
CREATE TABLE `sound_kit_locale` (
  `ID` int(10) unsigned NOT NULL DEFAULT '0',
  `locale` varchar(4) NOT NULL,
  `Name_lang` text,
  `VerifiedBuild` smallint(6) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`locale`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Table structure for table `specialization_spells`
--
ALTER TABLE `specialization_spells`
  MODIFY `SpellID` int(10) unsigned NOT NULL DEFAULT '0' AFTER `ID`,
  MODIFY `OverridesSpellID` int(10) unsigned NOT NULL DEFAULT '0' AFTER `SpellID`,
  MODIFY `Description` text AFTER `OverridesSpellID`,
  MODIFY `SpecID` smallint(5) unsigned NOT NULL DEFAULT '0' AFTER `Description`,
  MODIFY `OrderIndex` tinyint(3) unsigned NOT NULL DEFAULT '0' AFTER `SpecID`;

--
-- Table structure for table `spell`
--
DROP TABLE IF EXISTS `spell`;
CREATE TABLE `spell` (
  `ID` int(10) unsigned NOT NULL DEFAULT '0',
  `Name` text,
  `NameSubtext` text,
  `Description` text,
  `AuraDescription` text,
  `MiscID` int(10) unsigned NOT NULL DEFAULT '0',
  `DescriptionVariablesID` smallint(5) unsigned NOT NULL DEFAULT '0',
  `VerifiedBuild` smallint(6) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Table structure for table `spell_locale`
--
DROP TABLE IF EXISTS `spell_locale`;
CREATE TABLE `spell_locale` (
  `ID` int(10) unsigned NOT NULL DEFAULT '0',
  `locale` varchar(4) NOT NULL,
  `Name_lang` text,
  `NameSubtext_lang` text,
  `Description_lang` text,
  `AuraDescription_lang` text,
  `VerifiedBuild` smallint(6) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`locale`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Table structure for table `spell_aura_options`
--
DROP TABLE IF EXISTS `spell_aura_options`;
CREATE TABLE `spell_aura_options` (
  `ID` int(10) unsigned NOT NULL DEFAULT '0',
  `SpellID` int(10) unsigned NOT NULL DEFAULT '0',
  `ProcCharges` int(10) unsigned NOT NULL DEFAULT '0',
  `ProcTypeMask` int(10) unsigned NOT NULL DEFAULT '0',
  `ProcCategoryRecovery` int(10) unsigned NOT NULL DEFAULT '0',
  `CumulativeAura` smallint(5) unsigned NOT NULL DEFAULT '0',
  `DifficultyID` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `ProcChance` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `SpellProcsPerMinuteID` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `VerifiedBuild` smallint(6) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Table structure for table `spell_aura_restrictions`
--
DROP TABLE IF EXISTS `spell_aura_restrictions`;
CREATE TABLE `spell_aura_restrictions` (
  `ID` int(10) unsigned NOT NULL DEFAULT '0',
  `SpellID` int(10) unsigned NOT NULL DEFAULT '0',
  `CasterAuraSpell` int(10) unsigned NOT NULL DEFAULT '0',
  `TargetAuraSpell` int(10) unsigned NOT NULL DEFAULT '0',
  `ExcludeCasterAuraSpell` int(10) unsigned NOT NULL DEFAULT '0',
  `ExcludeTargetAuraSpell` int(10) unsigned NOT NULL DEFAULT '0',
  `DifficultyID` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `CasterAuraState` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `TargetAuraState` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `ExcludeCasterAuraState` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `ExcludeTargetAuraState` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `VerifiedBuild` smallint(6) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Table structure for table `spell_casting_requirements`
--
DROP TABLE IF EXISTS `spell_casting_requirements`;
CREATE TABLE `spell_casting_requirements` (
  `ID` int(10) unsigned NOT NULL DEFAULT '0',
  `SpellID` int(10) unsigned NOT NULL DEFAULT '0',
  `MinFactionID` smallint(5) unsigned NOT NULL DEFAULT '0',
  `RequiredAreasID` smallint(5) unsigned NOT NULL DEFAULT '0',
  `RequiresSpellFocus` smallint(5) unsigned NOT NULL DEFAULT '0',
  `FacingCasterFlags` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `MinReputation` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `RequiredAuraVision` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `VerifiedBuild` smallint(6) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Table structure for table `spell_cast_times`
--
ALTER TABLE `spell_cast_times`
  MODIFY `MinCastTime` int(11) NOT NULL DEFAULT '0' AFTER `CastTime`,
  MODIFY `CastTimePerLevel` smallint(6) NOT NULL DEFAULT '0' AFTER `MinCastTime`;

--
-- Table structure for table `spell_categories`
--
DROP TABLE IF EXISTS `spell_categories`;
CREATE TABLE `spell_categories` (
  `ID` int(10) unsigned NOT NULL DEFAULT '0',
  `SpellID` int(10) unsigned NOT NULL DEFAULT '0',
  `Category` smallint(5) unsigned NOT NULL DEFAULT '0',
  `StartRecoveryCategory` smallint(5) unsigned NOT NULL DEFAULT '0',
  `ChargeCategory` smallint(5) unsigned NOT NULL DEFAULT '0',
  `DifficultyID` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `DefenseType` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `DispelType` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `Mechanic` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `PreventionType` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `VerifiedBuild` smallint(6) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Table structure for table `spell_category`
--
DROP TABLE IF EXISTS `spell_category`;
CREATE TABLE `spell_category` (
  `ID` int(10) unsigned NOT NULL DEFAULT '0',
  `Name` text,
  `ChargeRecoveryTime` int(11) NOT NULL DEFAULT '0',
  `Flags` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `UsesPerWeek` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `MaxCharges` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `VerifiedBuild` smallint(6) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Table structure for table `spell_category_locale`
--
DROP TABLE IF EXISTS `spell_category_locale`;
CREATE TABLE `spell_category_locale` (
  `ID` int(10) unsigned NOT NULL DEFAULT '0',
  `locale` varchar(4) NOT NULL,
  `Name_lang` text,
  `VerifiedBuild` smallint(6) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`locale`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Table structure for table `spell_class_options`
--
DROP TABLE IF EXISTS `spell_class_options`;
CREATE TABLE `spell_class_options` (
  `ID` int(10) unsigned NOT NULL DEFAULT '0',
  `SpellID` int(10) unsigned NOT NULL DEFAULT '0',
  `SpellClassMask1` int(10) unsigned NOT NULL DEFAULT '0',
  `SpellClassMask2` int(10) unsigned NOT NULL DEFAULT '0',
  `SpellClassMask3` int(10) unsigned NOT NULL DEFAULT '0',
  `SpellClassMask4` int(10) unsigned NOT NULL DEFAULT '0',
  `ModalNextSpell` smallint(5) unsigned NOT NULL DEFAULT '0',
  `SpellClassSet` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `VerifiedBuild` smallint(6) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Table structure for table `spell_cooldowns`
--
DROP TABLE IF EXISTS `spell_cooldowns`;
CREATE TABLE `spell_cooldowns` (
  `ID` int(10) unsigned NOT NULL DEFAULT '0',
  `SpellID` int(10) unsigned NOT NULL DEFAULT '0',
  `CategoryRecoveryTime` int(10) unsigned NOT NULL DEFAULT '0',
  `RecoveryTime` int(10) unsigned NOT NULL DEFAULT '0',
  `StartRecoveryTime` int(10) unsigned NOT NULL DEFAULT '0',
  `DifficultyID` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `VerifiedBuild` smallint(6) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Table structure for table `spell_duration`
--
ALTER TABLE `spell_duration`
  CHANGE `Duration1` `Duration` int(11) NOT NULL DEFAULT '0' AFTER `ID`,
  CHANGE `Duration3` `MaxDuration` int(11) NOT NULL DEFAULT '0' AFTER `Duration`,
  CHANGE `Duration2` `DurationPerLevel` smallint(6) NOT NULL DEFAULT '0' AFTER `MaxDuration`;

--
-- Table structure for table `spell_effect`
--
DROP TABLE IF EXISTS `spell_effect`;
CREATE TABLE `spell_effect` (
  `ID` int(10) unsigned NOT NULL DEFAULT '0',
  `EffectAmplitude` float NOT NULL DEFAULT '0',
  `EffectAuraPeriod` int(10) unsigned NOT NULL DEFAULT '0',
  `EffectBasePoints` int(10) unsigned NOT NULL DEFAULT '0',
  `EffectBonusCoefficient` float NOT NULL DEFAULT '0',
  `EffectChainAmplitude` float NOT NULL DEFAULT '0',
  `EffectDieSides` int(10) unsigned NOT NULL DEFAULT '0',
  `EffectItemType` int(10) unsigned NOT NULL DEFAULT '0',
  `EffectMiscValue` int(11) NOT NULL DEFAULT '0',
  `EffectMiscValueB` int(11) NOT NULL DEFAULT '0',
  `EffectPointsPerResource` float NOT NULL DEFAULT '0',
  `EffectRealPointsPerLevel` float NOT NULL DEFAULT '0',
  `EffectSpellClassMask1` int(10) unsigned NOT NULL DEFAULT '0',
  `EffectSpellClassMask2` int(10) unsigned NOT NULL DEFAULT '0',
  `EffectSpellClassMask3` int(10) unsigned NOT NULL DEFAULT '0',
  `EffectSpellClassMask4` int(10) unsigned NOT NULL DEFAULT '0',
  `EffectTriggerSpell` int(10) unsigned NOT NULL DEFAULT '0',
  `EffectPosFacing` float NOT NULL DEFAULT '0',
  `SpellID` int(10) unsigned NOT NULL DEFAULT '0',
  `EffectAttributes` int(10) unsigned NOT NULL DEFAULT '0',
  `BonusCoefficientFromAP` float NOT NULL DEFAULT '0',
  `EffectAura` smallint(5) unsigned NOT NULL DEFAULT '0',
  `EffectChainTargets` smallint(5) unsigned NOT NULL DEFAULT '0',
  `DifficultyID` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `Effect` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `EffectMechanic` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `EffectRadiusIndex` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `EffectRadiusMaxIndex` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `ImplicitTarget1` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `ImplicitTarget2` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `EffectIndex` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `VerifiedBuild` smallint(6) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Table structure for table `spell_effect_scaling`
--
DROP TABLE IF EXISTS `spell_effect_scaling`;
CREATE TABLE `spell_effect_scaling` (
  `ID` int(10) unsigned NOT NULL DEFAULT '0',
  `Coefficient` float NOT NULL DEFAULT '0',
  `Variance` float NOT NULL DEFAULT '0',
  `ResourceCoefficient` float NOT NULL DEFAULT '0',
  `SpellEffectID` int(10) unsigned NOT NULL DEFAULT '0',
  `VerifiedBuild` smallint(6) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Table structure for table `spell_equipped_items`
--
DROP TABLE IF EXISTS `spell_equipped_items`;
CREATE TABLE `spell_equipped_items` (
  `ID` int(10) unsigned NOT NULL DEFAULT '0',
  `SpellID` int(10) unsigned NOT NULL DEFAULT '0',
  `EquippedItemInventoryTypeMask` int(11) NOT NULL DEFAULT '0',
  `EquippedItemSubClassMask` int(11) NOT NULL DEFAULT '0',
  `EquippedItemClass` tinyint(4) NOT NULL DEFAULT '0',
  `VerifiedBuild` smallint(6) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Table structure for table `spell_focus_object`
--
DROP TABLE IF EXISTS `spell_focus_object`;
CREATE TABLE `spell_focus_object` (
  `ID` int(10) unsigned NOT NULL DEFAULT '0',
  `Name` text,
  `VerifiedBuild` smallint(6) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Table structure for table `spell_focus_object_locale`
--
DROP TABLE IF EXISTS `spell_focus_object_locale`;
CREATE TABLE `spell_focus_object_locale` (
  `ID` int(10) unsigned NOT NULL DEFAULT '0',
  `locale` varchar(4) NOT NULL,
  `Name_lang` text,
  `VerifiedBuild` smallint(6) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`locale`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Table structure for table `spell_interrupts`
--
DROP TABLE IF EXISTS `spell_interrupts`;
CREATE TABLE `spell_interrupts` (
  `ID` int(10) unsigned NOT NULL DEFAULT '0',
  `SpellID` int(10) unsigned NOT NULL DEFAULT '0',
  `AuraInterruptFlags1` int(10) unsigned NOT NULL DEFAULT '0',
  `AuraInterruptFlags2` int(10) unsigned NOT NULL DEFAULT '0',
  `ChannelInterruptFlags1` int(10) unsigned NOT NULL DEFAULT '0',
  `ChannelInterruptFlags2` int(10) unsigned NOT NULL DEFAULT '0',
  `InterruptFlags` smallint(5) unsigned NOT NULL DEFAULT '0',
  `DifficultyID` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `VerifiedBuild` smallint(6) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Table structure for table `spell_item_enchantment_condition`
--
ALTER TABLE `spell_item_enchantment_condition`
  MODIFY `LTOperand1` tinyint(3) unsigned NOT NULL DEFAULT '0' AFTER `LTOperandType5`,
  MODIFY `LTOperand2` tinyint(3) unsigned NOT NULL DEFAULT '0' AFTER `LTOperand1`,
  MODIFY `LTOperand3` tinyint(3) unsigned NOT NULL DEFAULT '0' AFTER `LTOperand2`,
  MODIFY `LTOperand4` tinyint(3) unsigned NOT NULL DEFAULT '0' AFTER `LTOperand3`,
  MODIFY `LTOperand5` tinyint(3) unsigned NOT NULL DEFAULT '0' AFTER `LTOperand4`,
  MODIFY `RTOperand1` tinyint(3) unsigned NOT NULL DEFAULT '0' AFTER `RTOperandType5`,
  MODIFY `RTOperand2` tinyint(3) unsigned NOT NULL DEFAULT '0' AFTER `RTOperand1`,
  MODIFY `RTOperand3` tinyint(3) unsigned NOT NULL DEFAULT '0' AFTER `RTOperand2`,
  MODIFY `RTOperand4` tinyint(3) unsigned NOT NULL DEFAULT '0' AFTER `RTOperand3`,
  MODIFY `RTOperand5` tinyint(3) unsigned NOT NULL DEFAULT '0' AFTER `RTOperand4`;

--
-- Table structure for table `spell_levels`
--
DROP TABLE IF EXISTS `spell_levels`;
CREATE TABLE `spell_levels` (
  `ID` int(10) unsigned NOT NULL DEFAULT '0',
  `SpellID` int(10) unsigned NOT NULL DEFAULT '0',
  `BaseLevel` smallint(5) unsigned NOT NULL DEFAULT '0',
  `MaxLevel` smallint(5) unsigned NOT NULL DEFAULT '0',
  `SpellLevel` smallint(5) unsigned NOT NULL DEFAULT '0',
  `DifficultyID` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `VerifiedBuild` smallint(6) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Table structure for table `spell_misc`
--
ALTER TABLE `spell_misc`
  MODIFY `Speed` float NOT NULL DEFAULT '0' AFTER `AttributesExM`,
  MODIFY `MultistrikeSpeedMod` float NOT NULL DEFAULT '0' AFTER `Speed`,
  MODIFY `CastingTimeIndex` smallint(5) unsigned NOT NULL DEFAULT '0' AFTER `MultistrikeSpeedMod`,
  MODIFY `DurationIndex` smallint(5) unsigned NOT NULL DEFAULT '0' AFTER `CastingTimeIndex`,
  MODIFY `RangeIndex` smallint(5) unsigned NOT NULL DEFAULT '0' AFTER `DurationIndex`,
  MODIFY `SpellIconID` smallint(5) unsigned NOT NULL DEFAULT '0' AFTER `RangeIndex`,
  MODIFY `ActiveIconID` smallint(5) unsigned NOT NULL DEFAULT '0' AFTER `SpellIconID`,
  MODIFY `SchoolMask` tinyint(3) unsigned NOT NULL DEFAULT '0' AFTER `ActiveIconID`;

--
-- Table structure for table `spell_power`
--
ALTER TABLE `spell_power`
  MODIFY `ManaCost` int(10) unsigned NOT NULL DEFAULT '0' AFTER `SpellID`,
  MODIFY `ManaCostPercentage` float NOT NULL DEFAULT '0' AFTER `ManaCost`,
  MODIFY `ManaCostPercentagePerSecond` float NOT NULL DEFAULT '0' AFTER `ManaCostPercentage`,
  MODIFY `RequiredAura` int(10) unsigned NOT NULL DEFAULT '0' AFTER `ManaCostPercentagePerSecond`,
  MODIFY `HealthCostPercentage` float NOT NULL DEFAULT '0' AFTER `RequiredAura`,
  MODIFY `ManaCostPerSecond` smallint(5) unsigned NOT NULL DEFAULT '0' AFTER `HealthCostPercentage`,
  MODIFY `ManaCostAdditional` smallint(5) unsigned NOT NULL DEFAULT '0' AFTER `ManaCostPerSecond`,
  MODIFY `PowerDisplayID` smallint(5) unsigned NOT NULL DEFAULT '0' AFTER `ManaCostAdditional`,
  MODIFY `UnitPowerBarID` smallint(5) unsigned NOT NULL DEFAULT '0' AFTER `PowerDisplayID`,
  MODIFY `PowerIndex` tinyint(3) unsigned NOT NULL DEFAULT '0' AFTER `UnitPowerBarID`,
  MODIFY `PowerType` tinyint(3) unsigned NOT NULL DEFAULT '0' AFTER `PowerIndex`,
  MODIFY `ManaCostPerLevel` tinyint(3) unsigned NOT NULL DEFAULT '0' AFTER `PowerType`;

--
-- Table structure for table `spell_power_difficulty`
--
ALTER TABLE `spell_power_difficulty` DROP PRIMARY KEY;
ALTER TABLE `spell_power_difficulty`
  MODIFY `DifficultyID` tinyint(3) unsigned NOT NULL DEFAULT '0' AFTER `SpellPowerID`,
  MODIFY `PowerIndex` tinyint(3) unsigned NOT NULL DEFAULT '0' AFTER `DifficultyID`;
ALTER TABLE `spell_power_difficulty` ADD PRIMARY KEY (`SpellPowerID`);

--
-- Table structure for table `spell_procs_per_minute`
--
ALTER TABLE `spell_procs_per_minute` MODIFY `Flags` tinyint(3) unsigned NOT NULL DEFAULT '0' AFTER `BaseProcRate`;

--
-- Table structure for table `spell_procs_per_minute_mod`
--
ALTER TABLE `spell_procs_per_minute_mod`
  MODIFY `Param` smallint(5) unsigned NOT NULL DEFAULT '0' AFTER `Coeff`,
  MODIFY `Type` tinyint(3) unsigned NOT NULL DEFAULT '0' AFTER `Param`,
  MODIFY `SpellProcsPerMinuteID` tinyint(3) unsigned NOT NULL DEFAULT '0' AFTER `Type`;

--
-- Table structure for table `spell_range`
--
ALTER TABLE `spell_range`
  MODIFY `DisplayName` text AFTER `MaxRangeFriend`,
  MODIFY `DisplayNameShort` text AFTER `DisplayName`,
  MODIFY `Flags` tinyint(3) unsigned NOT NULL DEFAULT '0' AFTER `DisplayNameShort`;

--
-- Table structure for table `spell_reagents`
--
DROP TABLE IF EXISTS `spell_reagents`;
CREATE TABLE `spell_reagents` (
  `ID` int(10) unsigned NOT NULL DEFAULT '0',
  `SpellID` int(10) unsigned NOT NULL DEFAULT '0',
  `Reagent1` int(11) NOT NULL DEFAULT '0',
  `Reagent2` int(11) NOT NULL DEFAULT '0',
  `Reagent3` int(11) NOT NULL DEFAULT '0',
  `Reagent4` int(11) NOT NULL DEFAULT '0',
  `Reagent5` int(11) NOT NULL DEFAULT '0',
  `Reagent6` int(11) NOT NULL DEFAULT '0',
  `Reagent7` int(11) NOT NULL DEFAULT '0',
  `Reagent8` int(11) NOT NULL DEFAULT '0',
  `ReagentCount1` smallint(5) unsigned NOT NULL DEFAULT '0',
  `ReagentCount2` smallint(5) unsigned NOT NULL DEFAULT '0',
  `ReagentCount3` smallint(5) unsigned NOT NULL DEFAULT '0',
  `ReagentCount4` smallint(5) unsigned NOT NULL DEFAULT '0',
  `ReagentCount5` smallint(5) unsigned NOT NULL DEFAULT '0',
  `ReagentCount6` smallint(5) unsigned NOT NULL DEFAULT '0',
  `ReagentCount7` smallint(5) unsigned NOT NULL DEFAULT '0',
  `ReagentCount8` smallint(5) unsigned NOT NULL DEFAULT '0',
  `VerifiedBuild` smallint(6) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Table structure for table `spell_scaling`
--
DROP TABLE IF EXISTS `spell_scaling`;
CREATE TABLE `spell_scaling` (
  `ID` int(10) unsigned NOT NULL DEFAULT '0',
  `SpellID` int(10) unsigned NOT NULL DEFAULT '0',
  `ScalesFromItemLevel` smallint(5) unsigned NOT NULL DEFAULT '0',
  `ScalingClass` tinyint(4) NOT NULL DEFAULT '0',
  `MaxScalingLevel` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `VerifiedBuild` smallint(6) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Table structure for table `spell_shapeshift`
--
DROP TABLE IF EXISTS `spell_shapeshift`;
CREATE TABLE `spell_shapeshift` (
  `ID` int(10) unsigned NOT NULL DEFAULT '0',
  `SpellID` int(10) unsigned NOT NULL DEFAULT '0',
  `ShapeshiftExclude1` int(10) unsigned NOT NULL DEFAULT '0',
  `ShapeshiftExclude2` int(10) unsigned NOT NULL DEFAULT '0',
  `ShapeshiftMask1` int(10) unsigned NOT NULL DEFAULT '0',
  `ShapeshiftMask2` int(10) unsigned NOT NULL DEFAULT '0',
  `StanceBarOrder` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `VerifiedBuild` smallint(6) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Table structure for table `spell_shapeshift_form`
--
DROP TABLE IF EXISTS `spell_shapeshift_form`;
CREATE TABLE `spell_shapeshift_form` (
  `ID` int(10) unsigned NOT NULL DEFAULT '0',
  `Name` text,
  `WeaponDamageVariance` float NOT NULL DEFAULT '0',
  `Flags` int(10) unsigned NOT NULL DEFAULT '0',
  `AttackIconID` smallint(5) unsigned NOT NULL DEFAULT '0',
  `CombatRoundTime` smallint(5) unsigned NOT NULL DEFAULT '0',
  `CreatureDisplayID1` smallint(5) unsigned NOT NULL DEFAULT '0',
  `CreatureDisplayID2` smallint(5) unsigned NOT NULL DEFAULT '0',
  `CreatureDisplayID3` smallint(5) unsigned NOT NULL DEFAULT '0',
  `CreatureDisplayID4` smallint(5) unsigned NOT NULL DEFAULT '0',
  `PresetSpellID1` smallint(5) unsigned NOT NULL DEFAULT '0',
  `PresetSpellID2` smallint(5) unsigned NOT NULL DEFAULT '0',
  `PresetSpellID3` smallint(5) unsigned NOT NULL DEFAULT '0',
  `PresetSpellID4` smallint(5) unsigned NOT NULL DEFAULT '0',
  `PresetSpellID5` smallint(5) unsigned NOT NULL DEFAULT '0',
  `PresetSpellID6` smallint(5) unsigned NOT NULL DEFAULT '0',
  `PresetSpellID7` smallint(5) unsigned NOT NULL DEFAULT '0',
  `PresetSpellID8` smallint(5) unsigned NOT NULL DEFAULT '0',
  `CreatureType` tinyint(4) NOT NULL DEFAULT '0',
  `MountTypeID` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `BonusActionBar` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `VerifiedBuild` smallint(6) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Table structure for table `spell_shapeshift_form_locale`
--
DROP TABLE IF EXISTS `spell_shapeshift_form_locale`;
CREATE TABLE `spell_shapeshift_form_locale` (
  `ID` int(10) unsigned NOT NULL DEFAULT '0',
  `locale` varchar(4) NOT NULL,
  `Name_lang` text,
  `VerifiedBuild` smallint(6) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`locale`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Table structure for table `spell_target_restrictions`
--
DROP TABLE IF EXISTS `spell_target_restrictions`;
CREATE TABLE `spell_target_restrictions` (
  `ID` int(10) unsigned NOT NULL DEFAULT '0',
  `SpellID` int(10) unsigned NOT NULL DEFAULT '0',
  `ConeAngle` float NOT NULL DEFAULT '0',
  `Width` float NOT NULL DEFAULT '0',
  `Targets` int(10) unsigned NOT NULL DEFAULT '0',
  `MaxTargetLevel` smallint(5) unsigned NOT NULL DEFAULT '0',
  `TargetCreatureType` smallint(5) unsigned NOT NULL DEFAULT '0',
  `DifficultyID` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `MaxAffectedTargets` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `VerifiedBuild` smallint(6) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Table structure for table `spell_totems`
--
DROP TABLE IF EXISTS `spell_totems`;
CREATE TABLE `spell_totems` (
  `ID` int(10) unsigned NOT NULL DEFAULT '0',
  `SpellID` int(10) unsigned NOT NULL DEFAULT '0',
  `Totem1` int(10) unsigned NOT NULL DEFAULT '0',
  `Totem2` int(10) unsigned NOT NULL DEFAULT '0',
  `RequiredTotemCategoryID1` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `RequiredTotemCategoryID2` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `VerifiedBuild` smallint(6) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Table structure for table `spell_x_spell_visual`
--
ALTER TABLE `spell_x_spell_visual`
  MODIFY `Unk620` float NOT NULL DEFAULT '0' AFTER `SpellID`,
  MODIFY `SpellVisualID1` smallint(5) unsigned NOT NULL DEFAULT '0' AFTER `Unk620`,
  MODIFY `SpellVisualID2` smallint(5) unsigned NOT NULL DEFAULT '0' AFTER `SpellVisualID1`,
  MODIFY `PlayerConditionID` smallint(5) unsigned NOT NULL DEFAULT '0' AFTER `SpellVisualID2`,
  MODIFY `DifficultyID` tinyint(3) unsigned NOT NULL DEFAULT '0' AFTER `PlayerConditionID`,
  MODIFY `Flags` tinyint(3) unsigned NOT NULL DEFAULT '0' AFTER `DifficultyID`;

--
-- Table structure for table `taxi_nodes`
--
ALTER TABLE `taxi_nodes`
  MODIFY `PosX` float NOT NULL DEFAULT '0' AFTER `ID`,
  MODIFY `PosY` float NOT NULL DEFAULT '0' AFTER `PosX`,
  MODIFY `PosZ` float NOT NULL DEFAULT '0' AFTER `PosY`,
  MODIFY `Name` text AFTER `PosZ`,
  MODIFY `MountCreatureID1` int(10) unsigned NOT NULL DEFAULT '0' AFTER `Name`,
  MODIFY `MountCreatureID2` int(10) unsigned NOT NULL DEFAULT '0' AFTER `MountCreatureID1`,
  MODIFY `MapOffsetX` float NOT NULL DEFAULT '0' AFTER `MountCreatureID2`,
  MODIFY `MapOffsetY` float NOT NULL DEFAULT '0' AFTER `MapOffsetX`,
  MODIFY `MapID` smallint(5) unsigned NOT NULL DEFAULT '0' AFTER `MapOffsetY`,
  MODIFY `ConditionID` smallint(5) unsigned NOT NULL DEFAULT '0' AFTER `MapID`,
  MODIFY `LearnableIndex` smallint(5) unsigned NOT NULL DEFAULT '0' AFTER `ConditionID`,
  MODIFY `Flags` tinyint(3) unsigned NOT NULL DEFAULT '0' AFTER `LearnableIndex`;

--
-- Table structure for table `taxi_path`
--
ALTER TABLE `taxi_path`
  MODIFY `From` smallint(5) unsigned NOT NULL DEFAULT '0' AFTER `ID`,
  MODIFY `To` smallint(5) unsigned NOT NULL DEFAULT '0' AFTER `From`,
  MODIFY `Cost` smallint(5) unsigned NOT NULL DEFAULT '0' AFTER `To`;

--
-- Table structure for table `taxi_path_node`
--
ALTER TABLE `taxi_path_node`
  MODIFY `LocX` float NOT NULL DEFAULT '0' AFTER `ID`,
  MODIFY `LocY` float NOT NULL DEFAULT '0' AFTER `LocX`,
  MODIFY `LocZ` float NOT NULL DEFAULT '0' AFTER `LocY`,
  MODIFY `Delay` int(10) unsigned NOT NULL DEFAULT '0' AFTER `LocZ`,
  MODIFY `PathID` smallint(5) unsigned NOT NULL DEFAULT '0' AFTER `Delay`,
  MODIFY `MapID` smallint(5) unsigned NOT NULL DEFAULT '0' AFTER `PathID`,
  MODIFY `ArrivalEventID` smallint(5) unsigned NOT NULL DEFAULT '0' AFTER `MapID`,
  MODIFY `DepartureEventID` smallint(5) unsigned NOT NULL DEFAULT '0' AFTER `ArrivalEventID`,
  MODIFY `NodeIndex` tinyint(3) unsigned NOT NULL DEFAULT '0' AFTER `DepartureEventID`,
  MODIFY `Flags` tinyint(3) unsigned NOT NULL DEFAULT '0' AFTER `NodeIndex`;

--
-- Table structure for table `totem_category`
--
ALTER TABLE `totem_category`
  MODIFY `CategoryMask` int(10) unsigned NOT NULL DEFAULT '0' AFTER `Name`,
  MODIFY `CategoryType` tinyint(3) unsigned NOT NULL DEFAULT '0' AFTER `CategoryMask`;

--
-- Table structure for table `toy`
--
ALTER TABLE `toy`
  MODIFY `Description` text AFTER `ItemID`,
  MODIFY `Flags` tinyint(3) unsigned NOT NULL DEFAULT '0' AFTER `Description`,
  MODIFY `CategoryFilter` tinyint(3) unsigned NOT NULL DEFAULT '0' AFTER `Flags`;

--
-- Table structure for table `toy_locale`
--
ALTER TABLE `toy_locale` MODIFY `Description_lang` text AFTER `locale`;

--
-- Table structure for table `transport_animation`
--
ALTER TABLE `transport_animation` MODIFY `SequenceID` tinyint(3) unsigned NOT NULL DEFAULT '0' AFTER `PosZ`;

--
-- Table structure for table `unit_power_bar`
--
ALTER TABLE `unit_power_bar`
  MODIFY `MaxPower` int(10) unsigned NOT NULL DEFAULT '0' AFTER `ID`,
  MODIFY `RegenerationPeace` float NOT NULL DEFAULT '0' AFTER `MaxPower`,
  MODIFY `RegenerationCombat` float NOT NULL DEFAULT '0' AFTER `RegenerationPeace`,
  MODIFY `FileDataID1` int(10) unsigned NOT NULL DEFAULT '0' AFTER `RegenerationCombat`,
  MODIFY `FileDataID2` int(10) unsigned NOT NULL DEFAULT '0' AFTER `FileDataID1`,
  MODIFY `FileDataID3` int(10) unsigned NOT NULL DEFAULT '0' AFTER `FileDataID2`,
  MODIFY `FileDataID4` int(10) unsigned NOT NULL DEFAULT '0' AFTER `FileDataID3`,
  MODIFY `FileDataID5` int(10) unsigned NOT NULL DEFAULT '0' AFTER `FileDataID4`,
  MODIFY `FileDataID6` int(10) unsigned NOT NULL DEFAULT '0' AFTER `FileDataID5`,
  MODIFY `Color1` int(10) unsigned NOT NULL DEFAULT '0' AFTER `FileDataID6`,
  MODIFY `Color2` int(10) unsigned NOT NULL DEFAULT '0' AFTER `Color1`,
  MODIFY `Color3` int(10) unsigned NOT NULL DEFAULT '0' AFTER `Color2`,
  MODIFY `Color4` int(10) unsigned NOT NULL DEFAULT '0' AFTER `Color3`,
  MODIFY `Color5` int(10) unsigned NOT NULL DEFAULT '0' AFTER `Color4`,
  MODIFY `Color6` int(10) unsigned NOT NULL DEFAULT '0' AFTER `Color5`,
  MODIFY `Name` text AFTER `Color6`,
  MODIFY `Cost` text AFTER `Name`,
  MODIFY `OutOfError` text AFTER `Cost`,
  MODIFY `ToolTip` text AFTER `OutOfError`,
  MODIFY `StartInset` float NOT NULL DEFAULT '0' AFTER `ToolTip`,
  MODIFY `EndInset` float NOT NULL DEFAULT '0' AFTER `StartInset`,
  MODIFY `StartPower` smallint(5) unsigned NOT NULL DEFAULT '0' AFTER `EndInset`,
  MODIFY `Flags` smallint(5) unsigned NOT NULL DEFAULT '0' AFTER `StartPower`,
  MODIFY `MinPower` tinyint(3) unsigned NOT NULL DEFAULT '0' AFTER `Flags`,
  MODIFY `CenterPower` tinyint(3) unsigned NOT NULL DEFAULT '0' AFTER `MinPower`,
  MODIFY `BarType` tinyint(3) unsigned NOT NULL DEFAULT '0' AFTER `CenterPower`;

--
-- Table structure for table `world_map_overlay`
--
ALTER TABLE `world_map_overlay`
  MODIFY `TextureName` text AFTER `ID`,
  MODIFY `MapAreaID` smallint(5) unsigned NOT NULL DEFAULT '0' AFTER `TextureName`,
  MODIFY `AreaID1` smallint(5) unsigned NOT NULL DEFAULT '0' AFTER `MapAreaID`,
  MODIFY `AreaID2` smallint(5) unsigned NOT NULL DEFAULT '0' AFTER `AreaID1`,
  MODIFY `AreaID3` smallint(5) unsigned NOT NULL DEFAULT '0' AFTER `AreaID2`,
  MODIFY `AreaID4` smallint(5) unsigned NOT NULL DEFAULT '0' AFTER `AreaID3`,
  MODIFY `TextureWidth` smallint(5) unsigned NOT NULL DEFAULT '0' AFTER `AreaID4`,
  MODIFY `TextureHeight` smallint(5) unsigned NOT NULL DEFAULT '0' AFTER `TextureWidth`,
  MODIFY `OffsetX` smallint(5) unsigned NOT NULL DEFAULT '0' AFTER `TextureHeight`,
  MODIFY `OffsetY` smallint(5) unsigned NOT NULL DEFAULT '0' AFTER `OffsetX`,
  MODIFY `HitRectTop` smallint(5) unsigned NOT NULL DEFAULT '0' AFTER `OffsetY`,
  MODIFY `HitRectLeft` smallint(5) unsigned NOT NULL DEFAULT '0' AFTER `HitRectTop`,
  MODIFY `HitRectBottom` smallint(5) unsigned NOT NULL DEFAULT '0' AFTER `HitRectLeft`,
  MODIFY `HitRectRight` smallint(5) unsigned NOT NULL DEFAULT '0' AFTER `HitRectBottom`,
  MODIFY `PlayerConditionID` smallint(5) unsigned NOT NULL DEFAULT '0' AFTER `HitRectRight`;

--
-- Table structure for table `world_map_transforms`
--
DROP TABLE IF EXISTS `world_map_transforms`;
CREATE TABLE `world_map_transforms` (
  `ID` int(10) unsigned NOT NULL DEFAULT '0',
  `RegionMinX` float NOT NULL DEFAULT '0',
  `RegionMinY` float NOT NULL DEFAULT '0',
  `RegionMinZ` float NOT NULL DEFAULT '0',
  `RegionMaxX` float NOT NULL DEFAULT '0',
  `RegionMaxY` float NOT NULL DEFAULT '0',
  `RegionMaxZ` float NOT NULL DEFAULT '0',
  `RegionOffsetX` float NOT NULL DEFAULT '0',
  `RegionOffsetY` float NOT NULL DEFAULT '0',
  `RegionScale` float NOT NULL DEFAULT '0',
  `MapID` smallint(5) unsigned NOT NULL DEFAULT '0',
  `NewMapID` smallint(5) unsigned NOT NULL DEFAULT '0',
  `NewDungeonMapID` smallint(5) unsigned NOT NULL DEFAULT '0',
  `NewAreaID` smallint(5) unsigned NOT NULL DEFAULT '0',
  `Flags` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `VerifiedBuild` smallint(6) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

DROP TABLE `creature_display_info_locale`;
DROP TABLE `holidays_locale`;
DROP TABLE `sound_entries`;
DROP TABLE `sound_entries_locale`;
DROP TABLE `spell_rune_cost`;
DROP TABLE `world_map_overlay_locale`;
--
-- Table structure for table `chat_channels`
--
DROP TABLE IF EXISTS `chat_channels`;
CREATE TABLE `chat_channels` (
  `ID` int(10) unsigned NOT NULL DEFAULT '0',
  `Flags` int(10) unsigned NOT NULL DEFAULT '0',
  `Name` text,
  `Shortcut` text,
  `FactionGroup` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `VerifiedBuild` smallint(6) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Table structure for table `chat_channels_locale`
--
DROP TABLE IF EXISTS `chat_channels_locale`;
CREATE TABLE `chat_channels_locale` (
  `ID` int(10) unsigned NOT NULL DEFAULT '0',
  `locale` varchar(4) NOT NULL,
  `Name_lang` text,
  `Shortcut_lang` text,
  `VerifiedBuild` smallint(6) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`locale`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Table structure for table `chr_specialization`
--
DROP TABLE IF EXISTS `chr_specialization`;
CREATE TABLE `chr_specialization` (
  `ID` int(10) unsigned NOT NULL DEFAULT '0',
  `MasterySpellID1` int(10) unsigned NOT NULL DEFAULT '0',
  `MasterySpellID2` int(10) unsigned NOT NULL DEFAULT '0',
  `Flags` int(10) unsigned NOT NULL DEFAULT '0',
  `AnimReplacementSetID` int(10) unsigned NOT NULL DEFAULT '0',
  `Name` text,
  `Name2` text,
  `Description` text,
  `BackgroundFile` text,
  `SpellIconID` smallint(5) unsigned NOT NULL DEFAULT '0',
  `ClassID` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `OrderIndex` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `PetTalentType` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `Role` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `PrimaryStatOrder` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `VerifiedBuild` smallint(6) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Table structure for table `chr_specialization_locale`
--

DROP TABLE IF EXISTS `chr_specialization_locale`;
CREATE TABLE `chr_specialization_locale` (
  `ID` int(10) unsigned NOT NULL DEFAULT '0',
  `locale` varchar(4) NOT NULL,
  `Name_lang` text,
  `Name2_lang` text,
  `Description_lang` text,
  `VerifiedBuild` smallint(6) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`locale`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Table structure for table `creature_display_info_extra`
--
ALTER TABLE `creature_display_info_extra`
  DROP `NPCItemDisplay1`,
  DROP `NPCItemDisplay2`,
  DROP `NPCItemDisplay3`,
  DROP `NPCItemDisplay4`,
  DROP `NPCItemDisplay5`,
  DROP `NPCItemDisplay6`,
  DROP `NPCItemDisplay7`,
  DROP `NPCItemDisplay8`,
  DROP `NPCItemDisplay9`,
  DROP `NPCItemDisplay10`;

--
-- Table structure for table `emotes`
--
DROP TABLE IF EXISTS `emotes`;
CREATE TABLE `emotes` (
  `ID` int(10) unsigned NOT NULL DEFAULT '0',
  `EmoteSlashCommand` text,
  `SpellVisualKitID` int(10) unsigned NOT NULL DEFAULT '0',
  `EmoteFlags` int(10) unsigned NOT NULL DEFAULT '0',
  `AnimID` smallint(5) unsigned NOT NULL DEFAULT '0',
  `EmoteSoundID` smallint(5) unsigned NOT NULL DEFAULT '0',
  `EmoteSpecProc` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `EmoteSpecProcParam` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `VerifiedBuild` smallint(6) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


--
-- Table structure for table `gameobject_display_info`
--
ALTER TABLE `gameobject_display_info`
  DROP `Sound1`,
  DROP `Sound2`,
  DROP `Sound3`,
  DROP `Sound4`,
  DROP `Sound5`,
  DROP `Sound6`,
  DROP `Sound7`,
  DROP `Sound8`,
  DROP `Sound9`,
  DROP `Sound10`;

--
-- Table structure for table `garr_class_spec`
--
ALTER TABLE `garr_class_spec` ADD COLUMN `Unknown700` tinyint(3) unsigned NOT NULL DEFAULT '0' AFTER `GarrFollItemSetID`;

--
-- Table structure for table `gem_properties`
--
DROP TABLE IF EXISTS `gem_properties`;
CREATE TABLE `gem_properties` (
  `ID` int(10) unsigned NOT NULL DEFAULT '0',
  `Type` int(10) unsigned NOT NULL DEFAULT '0',
  `EnchantID` smallint(5) unsigned NOT NULL DEFAULT '0',
  `MinItemLevel` smallint(5) unsigned NOT NULL DEFAULT '0',
  `MaxCountInv` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `MaxCountItem` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `VerifiedBuild` smallint(6) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Table structure for table `glyph_properties`
--
DROP TABLE IF EXISTS `glyph_properties`;
CREATE TABLE `glyph_properties` (
  `ID` int(10) unsigned NOT NULL DEFAULT '0',
  `SpellID` int(10) unsigned NOT NULL DEFAULT '0',
  `SpellIconID` smallint(5) unsigned NOT NULL DEFAULT '0',
  `Type` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `GlyphExclusiveCategoryID` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `VerifiedBuild` smallint(6) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Table structure for table `item_set`
--
DROP TABLE IF EXISTS `item_set`;
CREATE TABLE `item_set` (
  `ID` int(10) unsigned NOT NULL DEFAULT '0',
  `Name` text,
  `ItemID1` int(10) unsigned NOT NULL DEFAULT '0',
  `ItemID2` int(10) unsigned NOT NULL DEFAULT '0',
  `ItemID3` int(10) unsigned NOT NULL DEFAULT '0',
  `ItemID4` int(10) unsigned NOT NULL DEFAULT '0',
  `ItemID5` int(10) unsigned NOT NULL DEFAULT '0',
  `ItemID6` int(10) unsigned NOT NULL DEFAULT '0',
  `ItemID7` int(10) unsigned NOT NULL DEFAULT '0',
  `ItemID8` int(10) unsigned NOT NULL DEFAULT '0',
  `ItemID9` int(10) unsigned NOT NULL DEFAULT '0',
  `ItemID10` int(10) unsigned NOT NULL DEFAULT '0',
  `ItemID11` int(10) unsigned NOT NULL DEFAULT '0',
  `ItemID12` int(10) unsigned NOT NULL DEFAULT '0',
  `ItemID13` int(10) unsigned NOT NULL DEFAULT '0',
  `ItemID14` int(10) unsigned NOT NULL DEFAULT '0',
  `ItemID15` int(10) unsigned NOT NULL DEFAULT '0',
  `ItemID16` int(10) unsigned NOT NULL DEFAULT '0',
  `ItemID17` int(10) unsigned NOT NULL DEFAULT '0',
  `RequiredSkillRank` smallint(5) unsigned NOT NULL DEFAULT '0',
  `RequiredSkill` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `VerifiedBuild` smallint(6) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Table structure for table `item_set_locale`
--
DROP TABLE IF EXISTS `item_set_locale`;
CREATE TABLE `item_set_locale` (
  `ID` int(10) unsigned NOT NULL DEFAULT '0',
  `locale` varchar(4) NOT NULL,
  `Name_lang` text,
  `VerifiedBuild` smallint(6) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`locale`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Table structure for table `lock`
--
DROP TABLE IF EXISTS `lock`;
CREATE TABLE `lock` (
  `ID` int(10) unsigned NOT NULL DEFAULT '0',
  `Index1` int(10) unsigned NOT NULL DEFAULT '0',
  `Index2` int(10) unsigned NOT NULL DEFAULT '0',
  `Index3` int(10) unsigned NOT NULL DEFAULT '0',
  `Index4` int(10) unsigned NOT NULL DEFAULT '0',
  `Index5` int(10) unsigned NOT NULL DEFAULT '0',
  `Index6` int(10) unsigned NOT NULL DEFAULT '0',
  `Index7` int(10) unsigned NOT NULL DEFAULT '0',
  `Index8` int(10) unsigned NOT NULL DEFAULT '0',
  `Skill1` smallint(5) unsigned NOT NULL DEFAULT '0',
  `Skill2` smallint(5) unsigned NOT NULL DEFAULT '0',
  `Skill3` smallint(5) unsigned NOT NULL DEFAULT '0',
  `Skill4` smallint(5) unsigned NOT NULL DEFAULT '0',
  `Skill5` smallint(5) unsigned NOT NULL DEFAULT '0',
  `Skill6` smallint(5) unsigned NOT NULL DEFAULT '0',
  `Skill7` smallint(5) unsigned NOT NULL DEFAULT '0',
  `Skill8` smallint(5) unsigned NOT NULL DEFAULT '0',
  `Type1` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `Type2` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `Type3` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `Type4` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `Type5` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `Type6` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `Type7` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `Type8` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `Action1` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `Action2` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `Action3` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `Action4` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `Action5` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `Action6` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `Action7` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `Action8` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `VerifiedBuild` smallint(6) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Table structure for table `pvp_difficulty`
--

DROP TABLE IF EXISTS `pvp_difficulty`;
CREATE TABLE `pvp_difficulty` (
  `ID` int(10) unsigned NOT NULL DEFAULT '0',
  `MapID` smallint(5) unsigned NOT NULL DEFAULT '0',
  `BracketID` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `MinLevel` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `MaxLevel` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `VerifiedBuild` smallint(6) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Table structure for table `spell_levels`
--
ALTER TABLE `spell_levels` ADD COLUMN `MaxUsableLevel` tinyint(3) unsigned NOT NULL DEFAULT '0' AFTER `DifficultyID`;

--
-- Table structure for table `summon_properties`
--
DROP TABLE IF EXISTS `summon_properties`;
CREATE TABLE `summon_properties` (
  `ID` int(10) unsigned NOT NULL DEFAULT '0',
  `Category` int(10) unsigned NOT NULL DEFAULT '0',
  `Faction` int(10) unsigned NOT NULL DEFAULT '0',
  `Type` int(10) unsigned NOT NULL DEFAULT '0',
  `Slot` int(11) NOT NULL DEFAULT '0',
  `Flags` int(10) unsigned NOT NULL DEFAULT '0',
  `VerifiedBuild` smallint(6) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Table structure for table `vehicle_seat`
--
DROP TABLE IF EXISTS `vehicle_seat`;
CREATE TABLE `vehicle_seat` (
  `ID` int(10) unsigned NOT NULL DEFAULT '0',
  `Flags1` int(10) unsigned NOT NULL DEFAULT '0',
  `Flags2` int(10) unsigned NOT NULL DEFAULT '0',
  `Flags3` int(10) unsigned NOT NULL DEFAULT '0',
  `AttachmentOffsetX` float NOT NULL DEFAULT '0',
  `AttachmentOffsetY` float NOT NULL DEFAULT '0',
  `AttachmentOffsetZ` float NOT NULL DEFAULT '0',
  `EnterPreDelay` float NOT NULL DEFAULT '0',
  `EnterSpeed` float NOT NULL DEFAULT '0',
  `EnterGravity` float NOT NULL DEFAULT '0',
  `EnterMinDuration` float NOT NULL DEFAULT '0',
  `EnterMaxDuration` float NOT NULL DEFAULT '0',
  `EnterMinArcHeight` float NOT NULL DEFAULT '0',
  `EnterMaxArcHeight` float NOT NULL DEFAULT '0',
  `ExitPreDelay` float NOT NULL DEFAULT '0',
  `ExitSpeed` float NOT NULL DEFAULT '0',
  `ExitGravity` float NOT NULL DEFAULT '0',
  `ExitMinDuration` float NOT NULL DEFAULT '0',
  `ExitMaxDuration` float NOT NULL DEFAULT '0',
  `ExitMinArcHeight` float NOT NULL DEFAULT '0',
  `ExitMaxArcHeight` float NOT NULL DEFAULT '0',
  `PassengerYaw` float NOT NULL DEFAULT '0',
  `PassengerPitch` float NOT NULL DEFAULT '0',
  `PassengerRoll` float NOT NULL DEFAULT '0',
  `VehicleEnterAnimDelay` float NOT NULL DEFAULT '0',
  `VehicleExitAnimDelay` float NOT NULL DEFAULT '0',
  `CameraEnteringDelay` float NOT NULL DEFAULT '0',
  `CameraEnteringDuration` float NOT NULL DEFAULT '0',
  `CameraExitingDelay` float NOT NULL DEFAULT '0',
  `CameraExitingDuration` float NOT NULL DEFAULT '0',
  `CameraOffsetX` float NOT NULL DEFAULT '0',
  `CameraOffsetY` float NOT NULL DEFAULT '0',
  `CameraOffsetZ` float NOT NULL DEFAULT '0',
  `CameraPosChaseRate` float NOT NULL DEFAULT '0',
  `CameraFacingChaseRate` float NOT NULL DEFAULT '0',
  `CameraEnteringZoom` float NOT NULL DEFAULT '0',
  `CameraSeatZoomMin` float NOT NULL DEFAULT '0',
  `CameraSeatZoomMax` float NOT NULL DEFAULT '0',
  `UISkinFileDataID` int(10) unsigned NOT NULL DEFAULT '0',
  `EnterAnimStart` smallint(6) NOT NULL DEFAULT '0',
  `EnterAnimLoop` smallint(6) NOT NULL DEFAULT '0',
  `RideAnimStart` smallint(6) NOT NULL DEFAULT '0',
  `RideAnimLoop` smallint(6) NOT NULL DEFAULT '0',
  `RideUpperAnimStart` smallint(6) NOT NULL DEFAULT '0',
  `RideUpperAnimLoop` smallint(6) NOT NULL DEFAULT '0',
  `ExitAnimStart` smallint(6) NOT NULL DEFAULT '0',
  `ExitAnimLoop` smallint(6) NOT NULL DEFAULT '0',
  `ExitAnimEnd` smallint(6) NOT NULL DEFAULT '0',
  `VehicleEnterAnim` smallint(6) NOT NULL DEFAULT '0',
  `VehicleExitAnim` smallint(6) NOT NULL DEFAULT '0',
  `VehicleRideAnimLoop` smallint(6) NOT NULL DEFAULT '0',
  `EnterUISoundID` smallint(5) unsigned NOT NULL DEFAULT '0',
  `ExitUISoundID` smallint(5) unsigned NOT NULL DEFAULT '0',
  `EnterAnimKitID` smallint(5) unsigned NOT NULL DEFAULT '0',
  `RideAnimKitID` smallint(5) unsigned NOT NULL DEFAULT '0',
  `ExitAnimKitID` smallint(5) unsigned NOT NULL DEFAULT '0',
  `VehicleEnterAnimKitID` smallint(5) unsigned NOT NULL DEFAULT '0',
  `VehicleRideAnimKitID` smallint(5) unsigned NOT NULL DEFAULT '0',
  `VehicleExitAnimKitID` smallint(5) unsigned NOT NULL DEFAULT '0',
  `CameraModeID` smallint(5) unsigned NOT NULL DEFAULT '0',
  `AttachmentID` tinyint(4) NOT NULL DEFAULT '0',
  `PassengerAttachmentID` tinyint(4) NOT NULL DEFAULT '0',
  `VehicleEnterAnimBone` tinyint(4) NOT NULL DEFAULT '0',
  `VehicleExitAnimBone` tinyint(4) NOT NULL DEFAULT '0',
  `VehicleRideAnimLoopBone` tinyint(4) NOT NULL DEFAULT '0',
  `VehicleAbilityDisplay` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `VerifiedBuild` smallint(6) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
--
-- Table structure for table `area_table`
--
DROP TABLE IF EXISTS `area_table`;
CREATE TABLE `area_table` (
  `ID` int(10) unsigned NOT NULL DEFAULT '0',
  `Flags1` int(10) unsigned NOT NULL DEFAULT '0',
  `Flags2` int(10) unsigned NOT NULL DEFAULT '0',
  `ZoneName` text,
  `AmbientMultiplier` float NOT NULL DEFAULT '0',
  `AreaName` text,
  `MapID` smallint(5) unsigned NOT NULL DEFAULT '0',
  `ParentAreaID` smallint(5) unsigned NOT NULL DEFAULT '0',
  `AreaBit` smallint(6) NOT NULL DEFAULT '0',
  `AmbienceID` smallint(5) unsigned NOT NULL DEFAULT '0',
  `ZoneMusic` smallint(5) unsigned NOT NULL DEFAULT '0',
  `IntroSound` smallint(5) unsigned NOT NULL DEFAULT '0',
  `LiquidTypeID1` smallint(5) unsigned NOT NULL DEFAULT '0',
  `LiquidTypeID2` smallint(5) unsigned NOT NULL DEFAULT '0',
  `LiquidTypeID3` smallint(5) unsigned NOT NULL DEFAULT '0',
  `LiquidTypeID4` smallint(5) unsigned NOT NULL DEFAULT '0',
  `UWZoneMusic` smallint(5) unsigned NOT NULL DEFAULT '0',
  `UWAmbience` smallint(5) unsigned NOT NULL DEFAULT '0',
  `PvPCombastWorldStateID` smallint(5) unsigned NOT NULL DEFAULT '0',
  `SoundProviderPref` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `SoundProviderPrefUnderwater` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `ExplorationLevel` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `FactionGroupMask` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `MountFlags` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `UWIntroMusic` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `WildBattlePetLevelMin` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `WildBattlePetLevelMax` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `WindSettingsID` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `VerifiedBuild` smallint(6) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Table structure for table `area_table_locale`
--
DROP TABLE IF EXISTS `area_table_locale`;
CREATE TABLE `area_table_locale` (
  `ID` int(10) unsigned NOT NULL DEFAULT '0',
  `locale` varchar(4) NOT NULL,
  `AreaName_lang` text,
  `VerifiedBuild` smallint(6) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`locale`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Table structure for table `area_trigger`
--
DROP TABLE IF EXISTS `area_trigger`;
CREATE TABLE `area_trigger` (
  `ID` int(10) unsigned NOT NULL DEFAULT '0',
  `PosX` float NOT NULL DEFAULT '0',
  `PosY` float NOT NULL DEFAULT '0',
  `PosZ` float NOT NULL DEFAULT '0',
  `Radius` float NOT NULL DEFAULT '0',
  `BoxLength` float NOT NULL DEFAULT '0',
  `BoxWidth` float NOT NULL DEFAULT '0',
  `BoxHeight` float NOT NULL DEFAULT '0',
  `BoxYaw` float NOT NULL DEFAULT '0',
  `MapID` smallint(5) unsigned NOT NULL DEFAULT '0',
  `PhaseID` smallint(5) unsigned NOT NULL DEFAULT '0',
  `PhaseGroupID` smallint(5) unsigned NOT NULL DEFAULT '0',
  `ShapeID` smallint(5) unsigned NOT NULL DEFAULT '0',
  `AreaTriggerActionSetID` smallint(5) unsigned NOT NULL DEFAULT '0',
  `PhaseUseFlags` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `ShapeType` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `Flag` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `VerifiedBuild` smallint(6) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Table structure for table `char_titles`
--
DROP TABLE IF EXISTS `char_titles`;
CREATE TABLE `char_titles` (
  `ID` int(10) unsigned NOT NULL DEFAULT '0',
  `NameMale` text,
  `NameFemale` text,
  `ConditionID` smallint(5) unsigned NOT NULL DEFAULT '0',
  `MaskID` smallint(5) unsigned NOT NULL DEFAULT '0',
  `Flags` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `VerifiedBuild` smallint(6) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Table structure for table `char_titles_locale`
--
DROP TABLE IF EXISTS `char_titles_locale`;
CREATE TABLE `char_titles_locale` (
  `ID` int(10) unsigned NOT NULL DEFAULT '0',
  `locale` varchar(4) NOT NULL,
  `NameMale_lang` text,
  `NameFemale_lang` text,
  `VerifiedBuild` smallint(6) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`locale`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Table structure for table `creature_family`
--
DROP TABLE IF EXISTS `creature_family`;
CREATE TABLE `creature_family` (
  `ID` int(10) unsigned NOT NULL DEFAULT '0',
  `MinScale` float NOT NULL DEFAULT '0',
  `MaxScale` float NOT NULL DEFAULT '0',
  `Name` text,
  `IconFile` text,
  `SkillLine1` smallint(5) unsigned NOT NULL DEFAULT '0',
  `SkillLine2` smallint(5) unsigned NOT NULL DEFAULT '0',
  `PetFoodMask` smallint(5) unsigned NOT NULL DEFAULT '0',
  `MinScaleLevel` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `MaxScaleLevel` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `PetTalentType` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `CategoryEnumID` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `VerifiedBuild` smallint(6) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Table structure for table `creature_family_locale`
--
DROP TABLE IF EXISTS `creature_family_locale`;
CREATE TABLE `creature_family_locale` (
  `ID` int(10) unsigned NOT NULL DEFAULT '0',
  `locale` varchar(4) NOT NULL,
  `Name_lang` text,
  `VerifiedBuild` smallint(6) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`locale`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Table structure for table `difficulty`
--
DROP TABLE IF EXISTS `difficulty`;
CREATE TABLE `difficulty` (
  `ID` int(10) unsigned NOT NULL DEFAULT '0',
  `Name` text,
  `FallbackDifficultyID` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `InstanceType` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `MinPlayers` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `MaxPlayers` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `OldEnumValue` tinyint(4) NOT NULL DEFAULT '0',
  `Flags` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `ToggleDifficultyID` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `GroupSizeHealthCurveID` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `GroupSizeDmgCurveID` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `GroupSizeSpellPointsCurveID` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `ItemBonusTreeModID` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `OrderIndex` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `VerifiedBuild` smallint(6) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Table structure for table `difficulty_locale`
--
DROP TABLE IF EXISTS `difficulty_locale`;
CREATE TABLE `difficulty_locale` (
  `ID` int(10) unsigned NOT NULL DEFAULT '0',
  `locale` varchar(4) NOT NULL,
  `Name_lang` text,
  `VerifiedBuild` smallint(6) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`locale`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Table structure for table `dungeon_encounter`
--
DROP TABLE IF EXISTS `dungeon_encounter`;
CREATE TABLE `dungeon_encounter` (
  `ID` int(10) unsigned NOT NULL DEFAULT '0',
  `Name` text,
  `CreatureDisplayID` int(10) unsigned NOT NULL DEFAULT '0',
  `MapID` smallint(5) unsigned NOT NULL DEFAULT '0',
  `OrderIndex` smallint(5) unsigned NOT NULL DEFAULT '0',
  `SpellIconID` smallint(5) unsigned NOT NULL DEFAULT '0',
  `DifficultyID` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `Bit` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `Flags` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `VerifiedBuild` smallint(6) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Table structure for table `dungeon_encounter_locale`
--
DROP TABLE IF EXISTS `dungeon_encounter_locale`;
CREATE TABLE `dungeon_encounter_locale` (
  `ID` int(10) unsigned NOT NULL DEFAULT '0',
  `locale` varchar(4) NOT NULL,
  `Name_lang` text,
  `VerifiedBuild` smallint(6) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`locale`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Table structure for table `emotes_text`
--
DROP TABLE IF EXISTS `emotes_text`;
CREATE TABLE `emotes_text` (
  `ID` int(10) unsigned NOT NULL DEFAULT '0',
  `Name` text,
  `EmoteID` smallint(5) unsigned NOT NULL DEFAULT '0',
  `VerifiedBuild` smallint(6) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Table structure for table `emotes_text_locale`
--
DROP TABLE IF EXISTS `emotes_text_locale`;
CREATE TABLE `emotes_text_locale` (
  `ID` int(10) unsigned NOT NULL DEFAULT '0',
  `locale` varchar(4) NOT NULL,
  `Name_lang` text,
  `VerifiedBuild` smallint(6) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`locale`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Table structure for table `map`
--
DROP TABLE IF EXISTS `map`;
CREATE TABLE `map` (
  `ID` int(10) unsigned NOT NULL DEFAULT '0',
  `Directory` text,
  `Flags` int(10) unsigned NOT NULL DEFAULT '0',
  `MapType` int(10) unsigned NOT NULL DEFAULT '0',
  `MinimapIconScale` float NOT NULL DEFAULT '0',
  `CorpsePosX` float NOT NULL DEFAULT '0',
  `CorpsePosY` float NOT NULL DEFAULT '0',
  `RaidOffset` int(10) unsigned NOT NULL DEFAULT '0',
  `MapName` text,
  `MapDescription0` text,
  `MapDescription1` text,
  `AreaTableID` smallint(5) unsigned NOT NULL DEFAULT '0',
  `LoadingScreenID` smallint(5) unsigned NOT NULL DEFAULT '0',
  `CorpseMapID` smallint(6) NOT NULL DEFAULT '0',
  `TimeOfDayOverride` smallint(5) unsigned NOT NULL DEFAULT '0',
  `ParentMapID` smallint(6) NOT NULL DEFAULT '0',
  `CosmeticParentMapID` smallint(6) NOT NULL DEFAULT '0',
  `InstanceType` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `unk5` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `ExpansionID` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `MaxPlayers` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `TimeOffset` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `VerifiedBuild` smallint(6) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Table structure for table `map_locale`
--
DROP TABLE IF EXISTS `map_locale`;
CREATE TABLE `map_locale` (
  `ID` int(10) unsigned NOT NULL DEFAULT '0',
  `locale` varchar(4) NOT NULL,
  `MapName_lang` text,
  `MapDescription0_lang` text,
  `MapDescription1_lang` text,
  `VerifiedBuild` smallint(6) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`locale`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Table structure for table `phase`
--
DROP TABLE IF EXISTS `phase`;
CREATE TABLE `phase` (
  `ID` int(10) unsigned NOT NULL DEFAULT '0',
  `Flags` smallint(5) unsigned NOT NULL DEFAULT '0',
  `VerifiedBuild` smallint(6) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
--
-- Table structure for table `area_table`
--
ALTER TABLE `area_table` CHANGE `UWIntroMusic` `UWIntroMusic` smallint(5) unsigned NOT NULL DEFAULT '0' AFTER `LiquidTypeID4`;

--
-- Table structure for table `banned_addons`
--
DROP TABLE IF EXISTS `banned_addons`;
CREATE TABLE `banned_addons` (
  `ID` int(10) unsigned NOT NULL DEFAULT '0',
  `Name` text,
  `Version` text,
  `Flags` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `VerifiedBuild` smallint(6) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Table structure for table `battlemaster_list`
--
DROP TABLE IF EXISTS `battlemaster_list`;
CREATE TABLE `battlemaster_list` (
  `ID` int(10) unsigned NOT NULL DEFAULT '0',
  `Name` text,
  `IconFileDataID` int(10) unsigned NOT NULL DEFAULT '0',
  `GameType` text,
  `MapID1` smallint(6) NOT NULL DEFAULT '0',
  `MapID2` smallint(6) NOT NULL DEFAULT '0',
  `MapID3` smallint(6) NOT NULL DEFAULT '0',
  `MapID4` smallint(6) NOT NULL DEFAULT '0',
  `MapID5` smallint(6) NOT NULL DEFAULT '0',
  `MapID6` smallint(6) NOT NULL DEFAULT '0',
  `MapID7` smallint(6) NOT NULL DEFAULT '0',
  `MapID8` smallint(6) NOT NULL DEFAULT '0',
  `MapID9` smallint(6) NOT NULL DEFAULT '0',
  `MapID10` smallint(6) NOT NULL DEFAULT '0',
  `MapID11` smallint(6) NOT NULL DEFAULT '0',
  `MapID12` smallint(6) NOT NULL DEFAULT '0',
  `MapID13` smallint(6) NOT NULL DEFAULT '0',
  `MapID14` smallint(6) NOT NULL DEFAULT '0',
  `MapID15` smallint(6) NOT NULL DEFAULT '0',
  `MapID16` smallint(6) NOT NULL DEFAULT '0',
  `HolidayWorldState` smallint(5) unsigned NOT NULL DEFAULT '0',
  `PlayerConditionID` smallint(5) unsigned NOT NULL DEFAULT '0',
  `InstanceType` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `GroupsAllowed` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `MaxGroupSize` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `MinLevel` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `MaxLevel` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `RatedPlayers` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `MinPlayers` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `MaxPlayers` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `Flags` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `VerifiedBuild` smallint(6) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Table structure for table `battlemaster_list_locale`
--
DROP TABLE IF EXISTS `battlemaster_list_locale`;
CREATE TABLE `battlemaster_list_locale` (
  `ID` int(10) unsigned NOT NULL DEFAULT '0',
  `locale` varchar(4) NOT NULL,
  `Name_lang` text,
  `GameType_lang` text,
  `VerifiedBuild` smallint(6) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`locale`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Table structure for table `char_sections`
--
DROP TABLE IF EXISTS `char_sections`;
CREATE TABLE `char_sections` (
  `Id` int(10) unsigned NOT NULL DEFAULT '0',
  `TextureFileDataID1` int(10) unsigned NOT NULL DEFAULT '0',
  `TextureFileDataID2` int(10) unsigned NOT NULL DEFAULT '0',
  `TextureFileDataID3` int(10) unsigned NOT NULL DEFAULT '0',
  `Flags` smallint(5) unsigned NOT NULL DEFAULT '0',
  `Race` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `Gender` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `GenType` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `Type` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `Color` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `VerifiedBuild` smallint(6) NOT NULL DEFAULT '0',
  PRIMARY KEY (`Id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Table structure for table `chr_classes`
--
DROP TABLE IF EXISTS `chr_classes`;
CREATE TABLE `chr_classes` (
  `ID` int(10) unsigned NOT NULL DEFAULT '0',
  `PowerType` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `PetNameToken` text,
  `Name` text,
  `NameFemale` text,
  `NameMale` text,
  `Filename` text,
  `CreateScreenFileDataID` int(10) unsigned NOT NULL DEFAULT '0',
  `SelectScreenFileDataID` int(10) unsigned NOT NULL DEFAULT '0',
  `LowResScreenFileDataID` int(10) unsigned NOT NULL DEFAULT '0',
  `Flags` smallint(5) unsigned NOT NULL DEFAULT '0',
  `CinematicSequenceID` smallint(5) unsigned NOT NULL DEFAULT '0',
  `DefaultSpec` smallint(5) unsigned NOT NULL DEFAULT '0',
  `SpellClassSet` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `AttackPowerPerStrength` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `AttackPowerPerAgility` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `RangedAttackPowerPerAgility` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `IconFileDataID` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `Unk1` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `VerifiedBuild` smallint(6) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Table structure for table `chr_classes_locale`
--
DROP TABLE IF EXISTS `chr_classes_locale`;
CREATE TABLE `chr_classes_locale` (
  `ID` int(10) unsigned NOT NULL DEFAULT '0',
  `locale` varchar(4) NOT NULL,
  `Name_lang` text,
  `NameFemale_lang` text,
  `NameMale_lang` text,
  `VerifiedBuild` smallint(6) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`locale`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Table structure for table `chr_races`
--
ALTER TABLE `chr_races` ADD `ItemAppearanceFrameRaceID` tinyint(3) unsigned NOT NULL DEFAULT '0' AFTER `NeutralRaceID`;

--
-- Table structure for table `creature_display_info`
--
ALTER TABLE `creature_display_info` ADD `InstanceOtherPlayerPetScale` float NOT NULL DEFAULT '0' AFTER `StateSpellVisualKitID`;

--
-- Table structure for table `creature_model_data`
--
DROP TABLE IF EXISTS `creature_model_data`;
CREATE TABLE `creature_model_data` (
  `ID` int(10) unsigned NOT NULL DEFAULT '0',
  `Flags` int(10) unsigned NOT NULL DEFAULT '0',
  `FileDataID` int(10) unsigned NOT NULL DEFAULT '0',
  `ModelScale` float NOT NULL DEFAULT '0',
  `FootprintTextureLength` float NOT NULL DEFAULT '0',
  `FootprintTextureWidth` float NOT NULL DEFAULT '0',
  `FootprintParticleScale` float NOT NULL DEFAULT '0',
  `CollisionWidth` float NOT NULL DEFAULT '0',
  `CollisionHeight` float NOT NULL DEFAULT '0',
  `MountHeight` float NOT NULL DEFAULT '0',
  `GeoBoxMin1` float NOT NULL DEFAULT '0',
  `GeoBoxMin2` float NOT NULL DEFAULT '0',
  `GeoBoxMin3` float NOT NULL DEFAULT '0',
  `GeoBoxMax1` float NOT NULL DEFAULT '0',
  `GeoBoxMax2` float NOT NULL DEFAULT '0',
  `GeoBoxMax3` float NOT NULL DEFAULT '0',
  `WorldEffectScale` float NOT NULL DEFAULT '0',
  `AttachedEffectScale` float NOT NULL DEFAULT '0',
  `MissileCollisionRadius` float NOT NULL DEFAULT '0',
  `MissileCollisionPush` float NOT NULL DEFAULT '0',
  `MissileCollisionRaise` float NOT NULL DEFAULT '0',
  `OverrideLootEffectScale` float NOT NULL DEFAULT '0',
  `OverrideNameScale` float NOT NULL DEFAULT '0',
  `OverrideSelectionRadius` float NOT NULL DEFAULT '0',
  `TamedPetBaseScale` float NOT NULL DEFAULT '0',
  `HoverHeight` float NOT NULL DEFAULT '0',
  `SoundID` smallint(5) unsigned NOT NULL DEFAULT '0',
  `CreatureGeosetDataID` smallint(5) unsigned NOT NULL DEFAULT '0',
  `SizeClass` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `BloodID` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `FootprintTextureID` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `FoleyMaterialID` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `Unk700_1` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `Unk700_2` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `FootstepShakeSize` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `DeathThudShakeSize` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `VerifiedBuild` smallint(6) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Table structure for table `emotes`
--
ALTER TABLE `emotes`
  ADD `Unk703_1` int(10) unsigned NOT NULL DEFAULT '0' AFTER `EmoteFlags`,
  ADD `Unk703_2` int(10) unsigned NOT NULL DEFAULT '0' AFTER `Unk703_1`,
  CHANGE `EmoteSpecProcParam` `EmoteSpecProcParam` smallint(5) unsigned NOT NULL DEFAULT '0' AFTER `AnimID`;

--
-- Table structure for table `faction`
--
DROP TABLE IF EXISTS `faction`;
CREATE TABLE `faction` (
  `ID` int(10) unsigned NOT NULL DEFAULT '0',
  `ReputationRaceMask1` int(10) unsigned NOT NULL DEFAULT '0',
  `ReputationRaceMask2` int(10) unsigned NOT NULL DEFAULT '0',
  `ReputationRaceMask3` int(10) unsigned NOT NULL DEFAULT '0',
  `ReputationRaceMask4` int(10) unsigned NOT NULL DEFAULT '0',
  `ReputationBase1` int(11) NOT NULL DEFAULT '0',
  `ReputationBase2` int(11) NOT NULL DEFAULT '0',
  `ReputationBase3` int(11) NOT NULL DEFAULT '0',
  `ReputationBase4` int(11) NOT NULL DEFAULT '0',
  `ParentFactionModIn` float NOT NULL DEFAULT '0',
  `ParentFactionModOut` float NOT NULL DEFAULT '0',
  `Name` text,
  `Description` text,
  `ReputationIndex` smallint(6) NOT NULL DEFAULT '0',
  `ReputationClassMask1` smallint(5) unsigned NOT NULL DEFAULT '0',
  `ReputationClassMask2` smallint(5) unsigned NOT NULL DEFAULT '0',
  `ReputationClassMask3` smallint(5) unsigned NOT NULL DEFAULT '0',
  `ReputationClassMask4` smallint(5) unsigned NOT NULL DEFAULT '0',
  `ReputationFlags1` smallint(5) unsigned NOT NULL DEFAULT '0',
  `ReputationFlags2` smallint(5) unsigned NOT NULL DEFAULT '0',
  `ReputationFlags3` smallint(5) unsigned NOT NULL DEFAULT '0',
  `ReputationFlags4` smallint(5) unsigned NOT NULL DEFAULT '0',
  `ParentFactionID` smallint(5) unsigned NOT NULL DEFAULT '0',
  `ParentFactionCapIn` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `ParentFactionCapOut` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `Expansion` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `Flags` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `FriendshipRepID` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `VerifiedBuild` smallint(6) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Table structure for table `faction_locale`
--
DROP TABLE IF EXISTS `faction_locale`;
CREATE TABLE `faction_locale` (
  `ID` int(10) unsigned NOT NULL DEFAULT '0',
  `locale` varchar(4) NOT NULL,
  `Name_lang` text,
  `Description_lang` text,
  `VerifiedBuild` smallint(6) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`locale`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Table structure for table `faction_template`
--
DROP TABLE IF EXISTS `faction_template`;
CREATE TABLE `faction_template` (
  `ID` int(10) unsigned NOT NULL DEFAULT '0',
  `Faction` smallint(5) unsigned NOT NULL DEFAULT '0',
  `Flags` smallint(5) unsigned NOT NULL DEFAULT '0',
  `Enemies1` smallint(5) unsigned NOT NULL DEFAULT '0',
  `Enemies2` smallint(5) unsigned NOT NULL DEFAULT '0',
  `Enemies3` smallint(5) unsigned NOT NULL DEFAULT '0',
  `Enemies4` smallint(5) unsigned NOT NULL DEFAULT '0',
  `Friends1` smallint(5) unsigned NOT NULL DEFAULT '0',
  `Friends2` smallint(5) unsigned NOT NULL DEFAULT '0',
  `Friends3` smallint(5) unsigned NOT NULL DEFAULT '0',
  `Friends4` smallint(5) unsigned NOT NULL DEFAULT '0',
  `Mask` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `FriendMask` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `EnemyMask` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `VerifiedBuild` smallint(6) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Table structure for table `garr_ability`
--
ALTER TABLE `garr_ability` CHANGE `Flags` `Flags` smallint(5) unsigned NOT NULL DEFAULT '0' AFTER `IconFileDataID`;

--
-- Table structure for table `garr_ability`
--
ALTER TABLE `garr_class_spec`
  ADD `Limit` tinyint(3) unsigned NOT NULL DEFAULT '0' AFTER `GarrFollItemSetID`,
  CHANGE `Unknown700` `Flags` tinyint(3) unsigned NOT NULL DEFAULT '0' AFTER `Limit`;

--
-- Table structure for table `garr_follower`
--
ALTER TABLE `garr_follower`
  ADD `MaxDurability` tinyint(3) unsigned NOT NULL DEFAULT '0' AFTER `GarrTypeID`,
  ADD `Class` tinyint(3) unsigned NOT NULL DEFAULT '0' AFTER `MaxDurability`;

--
-- Table structure for table `garr_plot`
--
ALTER TABLE `garr_plot` CHANGE `MinCount` `MinCount` smallint(5) unsigned NOT NULL DEFAULT '0' AFTER `HordeConstructionGameObjectID`;
ALTER TABLE `garr_plot` CHANGE `MaxCount` `MaxCount` smallint(5) unsigned NOT NULL DEFAULT '0' AFTER `MinCount`;

--
-- Table structure for table `gem_properties`
--
ALTER TABLE `gem_properties`
  DROP `MaxCountInv`,
  DROP COLUMN `MaxCountItem`;

--
-- Table structure for table `glyph_slot`
--
ALTER TABLE `glyph_slot` MODIFY COLUMN `Tooltip` smallint(5) unsigned NOT NULL DEFAULT '0' AFTER `ID`;

--
-- Table structure for table `guild_perk_spells`
--
ALTER TABLE `guild_perk_spells` DROP COLUMN `GuildLevel`;

--
-- Table structure for table `item_appearance`
--
ALTER TABLE `item_appearance` ADD COLUMN `UIOrder` int(10) unsigned NOT NULL DEFAULT '0' AFTER `IconFileDataID`;

--
-- Table structure for table `item_modified_appearance`
--
ALTER TABLE `item_modified_appearance` ADD COLUMN `SourceType` tinyint(3) unsigned NOT NULL DEFAULT '0' AFTER `Index`;

--
-- Table structure for table `item_set`
--
ALTER TABLE `item_set` ADD COLUMN `Unknown703` int(10) unsigned NOT NULL DEFAULT '0' AFTER `ItemID17`;

--
-- Table structure for table `item_sparse`
--
ALTER TABLE `item_sparse` ADD COLUMN `RequiredExpansion` tinyint(3) unsigned NOT NULL DEFAULT '0' AFTER `ArtifactID`;

--
-- Table structure for table `lfg_dungeons`
--
DROP TABLE IF EXISTS `lfg_dungeons`;
CREATE TABLE `lfg_dungeons` (
  `ID` int(10) unsigned NOT NULL DEFAULT '0',
  `Name` text,
  `Flags` int(10) unsigned NOT NULL DEFAULT '0',
  `TextureFilename` text,
  `Description` text,
  `MaxLevel` smallint(5) unsigned NOT NULL DEFAULT '0',
  `TargetLevelMax` smallint(5) unsigned NOT NULL DEFAULT '0',
  `MapID` smallint(6) NOT NULL DEFAULT '0',
  `RandomID` smallint(5) unsigned NOT NULL DEFAULT '0',
  `ScenarioID` smallint(5) unsigned NOT NULL DEFAULT '0',
  `LastBossJournalEncounterID` smallint(5) unsigned NOT NULL DEFAULT '0',
  `BonusReputationAmount` smallint(5) unsigned NOT NULL DEFAULT '0',
  `MentorItemLevel` smallint(5) unsigned NOT NULL DEFAULT '0',
  `MinLevel` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `TargetLevel` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `TargetLevelMin` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `DifficultyID` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `Type` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `Faction` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `Expansion` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `OrderIndex` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `GroupID` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `CountTank` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `CountHealer` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `CountDamage` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `MinCountTank` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `MinCountHealer` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `MinCountDamage` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `SubType` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `MentorCharLevel` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `VerifiedBuild` smallint(6) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Table structure for table `lfg_dungeons_locale`
--
DROP TABLE IF EXISTS `lfg_dungeons_locale`;
CREATE TABLE `lfg_dungeons_locale` (
  `ID` int(10) unsigned NOT NULL DEFAULT '0',
  `locale` varchar(4) NOT NULL,
  `Name_lang` text,
  `Description_lang` text,
  `VerifiedBuild` smallint(6) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`locale`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Table structure for table `light`
--
DROP TABLE IF EXISTS `light`;
CREATE TABLE `light` (
  `ID` int(10) unsigned NOT NULL DEFAULT '0',
  `PosX` float NOT NULL DEFAULT '0',
  `PosY` float NOT NULL DEFAULT '0',
  `PosZ` float NOT NULL DEFAULT '0',
  `FalloffStart` float NOT NULL DEFAULT '0',
  `FalloffEnd` float NOT NULL DEFAULT '0',
  `MapID` smallint(5) unsigned NOT NULL DEFAULT '0',
  `LightParamsID1` smallint(5) unsigned NOT NULL DEFAULT '0',
  `LightParamsID2` smallint(5) unsigned NOT NULL DEFAULT '0',
  `LightParamsID3` smallint(5) unsigned NOT NULL DEFAULT '0',
  `LightParamsID4` smallint(5) unsigned NOT NULL DEFAULT '0',
  `LightParamsID5` smallint(5) unsigned NOT NULL DEFAULT '0',
  `LightParamsID6` smallint(5) unsigned NOT NULL DEFAULT '0',
  `LightParamsID7` smallint(5) unsigned NOT NULL DEFAULT '0',
  `LightParamsID8` smallint(5) unsigned NOT NULL DEFAULT '0',
  `VerifiedBuild` smallint(6) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Table structure for table `liquid_type`
--
DROP TABLE IF EXISTS `liquid_type`;
CREATE TABLE `liquid_type` (
  `ID` int(10) unsigned NOT NULL DEFAULT '0',
  `Name` text,
  `SpellID` int(10) unsigned NOT NULL DEFAULT '0',
  `MaxDarkenDepth` float NOT NULL DEFAULT '0',
  `FogDarkenIntensity` float NOT NULL DEFAULT '0',
  `AmbDarkenIntensity` float NOT NULL DEFAULT '0',
  `DirDarkenIntensity` float NOT NULL DEFAULT '0',
  `ParticleScale` float NOT NULL DEFAULT '0',
  `Texture1` text,
  `Texture2` text,
  `Texture3` text,
  `Texture4` text,
  `Texture5` text,
  `Texture6` text,
  `Color1` int(10) unsigned NOT NULL DEFAULT '0',
  `Color2` int(10) unsigned NOT NULL DEFAULT '0',
  `Float1` float NOT NULL DEFAULT '0',
  `Float2` float NOT NULL DEFAULT '0',
  `Float3` float NOT NULL DEFAULT '0',
  `Float4` float NOT NULL DEFAULT '0',
  `Float5` float NOT NULL DEFAULT '0',
  `Float6` float NOT NULL DEFAULT '0',
  `Float7` float NOT NULL DEFAULT '0',
  `Float8` float NOT NULL DEFAULT '0',
  `Float9` float NOT NULL DEFAULT '0',
  `Float10` float NOT NULL DEFAULT '0',
  `Float11` float NOT NULL DEFAULT '0',
  `Float12` float NOT NULL DEFAULT '0',
  `Float13` float NOT NULL DEFAULT '0',
  `Float14` float NOT NULL DEFAULT '0',
  `Float15` float NOT NULL DEFAULT '0',
  `Float16` float NOT NULL DEFAULT '0',
  `Float17` float NOT NULL DEFAULT '0',
  `Float18` float NOT NULL DEFAULT '0',
  `Int1` int(10) unsigned NOT NULL DEFAULT '0',
  `Int2` int(10) unsigned NOT NULL DEFAULT '0',
  `Int3` int(10) unsigned NOT NULL DEFAULT '0',
  `Int4` int(10) unsigned NOT NULL DEFAULT '0',
  `Flags` smallint(5) unsigned NOT NULL DEFAULT '0',
  `SoundID` smallint(5) unsigned NOT NULL DEFAULT '0',
  `Type` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `LightID` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `ParticleMovement` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `ParticleTexSlots` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `MaterialID` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `DepthTexCount1` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `DepthTexCount2` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `DepthTexCount3` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `DepthTexCount4` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `DepthTexCount5` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `DepthTexCount6` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `VerifiedBuild` smallint(6) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Table structure for table `liquid_type_locale`
--
DROP TABLE IF EXISTS `liquid_type_locale`;
CREATE TABLE `liquid_type_locale` (
  `ID` int(10) unsigned NOT NULL DEFAULT '0',
  `locale` varchar(4) NOT NULL,
  `Name_lang` text,
  `VerifiedBuild` smallint(6) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`locale`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Table structure for table `map`
--
ALTER TABLE `map` DROP `RaidOffset`;

--
-- Table structure for table `map_difficulty`
--
DROP TABLE IF EXISTS `map_difficulty`;
CREATE TABLE `map_difficulty` (
  `ID` int(10) unsigned NOT NULL DEFAULT '0',
  `Message` text,
  `Context` int(10) unsigned NOT NULL DEFAULT '0',
  `MapID` smallint(5) unsigned NOT NULL DEFAULT '0',
  `DifficultyID` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `RaidDurationType` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `MaxPlayers` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `LockID` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `ItemBonusTreeModID` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `VerifiedBuild` smallint(6) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Table structure for table `map_difficulty_locale`
--
DROP TABLE IF EXISTS `map_difficulty_locale`;
CREATE TABLE `map_difficulty_locale` (
  `ID` int(10) unsigned NOT NULL DEFAULT '0',
  `locale` varchar(4) NOT NULL,
  `Message_lang` text,
  `VerifiedBuild` smallint(6) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`locale`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Table structure for table `mount_capability`
--
ALTER TABLE `mount_capability` MODIFY COLUMN `RequiredAura` int(10) unsigned NOT NULL DEFAULT '0' AFTER `ID`;

--
-- Table structure for table `quest_sort`
--
ALTER TABLE `quest_sort` ADD COLUMN `SortOrder` tinyint(3) unsigned NOT NULL DEFAULT '0' AFTER `SortName`;

--
-- Table structure for table `rand_prop_points`
--
ALTER TABLE `rand_prop_points`
  CHANGE `EpicPropertiesPoints1` `EpicPropertiesPoints1` int(10) unsigned NOT NULL DEFAULT '0' AFTER `ID`,
  CHANGE `EpicPropertiesPoints2` `EpicPropertiesPoints2` int(10) unsigned NOT NULL DEFAULT '0' AFTER `EpicPropertiesPoints1`,
  CHANGE `EpicPropertiesPoints3` `EpicPropertiesPoints3` int(10) unsigned NOT NULL DEFAULT '0' AFTER `EpicPropertiesPoints2`,
  CHANGE `EpicPropertiesPoints4` `EpicPropertiesPoints4` int(10) unsigned NOT NULL DEFAULT '0' AFTER `EpicPropertiesPoints3`,
  CHANGE `EpicPropertiesPoints5` `EpicPropertiesPoints5` int(10) unsigned NOT NULL DEFAULT '0' AFTER `EpicPropertiesPoints4`,
  CHANGE `RarePropertiesPoints1` `RarePropertiesPoints1` int(10) unsigned NOT NULL DEFAULT '0' AFTER `EpicPropertiesPoints5`,
  CHANGE `RarePropertiesPoints2` `RarePropertiesPoints2` int(10) unsigned NOT NULL DEFAULT '0' AFTER `RarePropertiesPoints1`,
  CHANGE `RarePropertiesPoints3` `RarePropertiesPoints3` int(10) unsigned NOT NULL DEFAULT '0' AFTER `RarePropertiesPoints2`,
  CHANGE `RarePropertiesPoints4` `RarePropertiesPoints4` int(10) unsigned NOT NULL DEFAULT '0' AFTER `RarePropertiesPoints3`,
  CHANGE `RarePropertiesPoints5` `RarePropertiesPoints5` int(10) unsigned NOT NULL DEFAULT '0' AFTER `RarePropertiesPoints4`,
  CHANGE `UncommonPropertiesPoints1` `UncommonPropertiesPoints1` int(10) unsigned NOT NULL DEFAULT '0' AFTER `RarePropertiesPoints5`,
  CHANGE `UncommonPropertiesPoints2` `UncommonPropertiesPoints2` int(10) unsigned NOT NULL DEFAULT '0' AFTER `UncommonPropertiesPoints1`,
  CHANGE `UncommonPropertiesPoints3` `UncommonPropertiesPoints3` int(10) unsigned NOT NULL DEFAULT '0' AFTER `UncommonPropertiesPoints2`,
  CHANGE `UncommonPropertiesPoints4` `UncommonPropertiesPoints4` int(10) unsigned NOT NULL DEFAULT '0' AFTER `UncommonPropertiesPoints3`,
  CHANGE `UncommonPropertiesPoints5` `UncommonPropertiesPoints5` int(10) unsigned NOT NULL DEFAULT '0' AFTER `UncommonPropertiesPoints4`;

--
-- Table structure for table `skill_race_class_info`
--
ALTER TABLE `skill_race_class_info` MODIFY COLUMN `ClassMask` int(11) NOT NULL DEFAULT '0' AFTER `RaceMask`;

--
-- Table structure for table `sound_kit`
--
ALTER TABLE `sound_kit`
  CHANGE `BusOverwriteID` `BusOverwriteID` smallint(5) unsigned NOT NULL DEFAULT '0' AFTER `SoundEntriesAdvancedID`,
  CHANGE `SoundType` `SoundType` tinyint(3) unsigned NOT NULL DEFAULT '0' AFTER `BusOverwriteID`;

--
-- Table structure for table `spell_category`
--
ALTER TABLE `spell_category` ADD COLUMN `Unk703`  int(10) UNSIGNED NOT NULL DEFAULT '0' AFTER `ChargeRecoveryTime`;

--
-- Table structure for table `spell_item_enchantment`
--
DROP TABLE IF EXISTS `spell_item_enchantment`;
CREATE TABLE `spell_item_enchantment` (
  `ID` int(10) unsigned NOT NULL DEFAULT '0',
  `EffectSpellID1` int(10) unsigned NOT NULL DEFAULT '0',
  `EffectSpellID2` int(10) unsigned NOT NULL DEFAULT '0',
  `EffectSpellID3` int(10) unsigned NOT NULL DEFAULT '0',
  `Name` text,
  `EffectScalingPoints1` float NOT NULL DEFAULT '0',
  `EffectScalingPoints2` float NOT NULL DEFAULT '0',
  `EffectScalingPoints3` float NOT NULL DEFAULT '0',
  `PlayerConditionID` int(10) unsigned NOT NULL DEFAULT '0',
  `TransmogCost` int(10) unsigned NOT NULL DEFAULT '0',
  `TextureFileDataID` int(10) unsigned NOT NULL DEFAULT '0',
  `EffectPointsMin1` smallint(5) unsigned NOT NULL DEFAULT '0',
  `EffectPointsMin2` smallint(5) unsigned NOT NULL DEFAULT '0',
  `EffectPointsMin3` smallint(5) unsigned NOT NULL DEFAULT '0',
  `ItemVisual` smallint(5) unsigned NOT NULL DEFAULT '0',
  `Flags` smallint(5) unsigned NOT NULL DEFAULT '0',
  `RequiredSkillID` smallint(5) unsigned NOT NULL DEFAULT '0',
  `RequiredSkillRank` smallint(5) unsigned NOT NULL DEFAULT '0',
  `ItemLevel` smallint(5) unsigned NOT NULL DEFAULT '0',
  `Charges` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `Effect1` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `Effect2` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `Effect3` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `ConditionID` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `MinLevel` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `MaxLevel` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `ScalingClass` tinyint(4) NOT NULL DEFAULT '0',
  `ScalingClassRestricted` tinyint(4) NOT NULL DEFAULT '0',
  `VerifiedBuild` smallint(6) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Table structure for table `spell_item_enchantment_locale`
--
DROP TABLE IF EXISTS `spell_item_enchantment_locale`;
CREATE TABLE `spell_item_enchantment_locale` (
  `ID` int(10) unsigned NOT NULL DEFAULT '0',
  `locale` varchar(4) NOT NULL,
  `Name_lang` text,
  `VerifiedBuild` smallint(6) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`locale`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Table structure for table `spell_scaling`
--
ALTER TABLE `spell_scaling` ADD COLUMN `MinScalingLevel` tinyint(3) UNSIGNED NOT NULL DEFAULT '0' AFTER `ScalingClass`;

--
-- Table structure for table `talent`
--
DROP TABLE IF EXISTS `talent`;
CREATE TABLE `talent` (
  `ID` int(10) unsigned NOT NULL DEFAULT '0',
  `SpellID` int(10) unsigned NOT NULL DEFAULT '0',
  `OverridesSpellID` int(10) unsigned NOT NULL DEFAULT '0',
  `Description` text,
  `SpecID` smallint(5) unsigned NOT NULL DEFAULT '0',
  `TierID` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `ColumnIndex` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `Flags` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `CategoryMask1` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `CategoryMask2` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `ClassID` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `VerifiedBuild` smallint(6) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Table structure for table `talent_locale`
--
DROP TABLE IF EXISTS `talent_locale`;
CREATE TABLE `talent_locale` (
  `ID` int(10) unsigned NOT NULL DEFAULT '0',
  `locale` varchar(4) NOT NULL,
  `Description_lang` text,
  `VerifiedBuild` smallint(6) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`locale`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Table structure for table `vehicle`
--
DROP TABLE IF EXISTS `vehicle`;
CREATE TABLE `vehicle` (
  `ID` int(10) unsigned NOT NULL DEFAULT '0',
  `Flags` int(10) unsigned NOT NULL DEFAULT '0',
  `TurnSpeed` float NOT NULL DEFAULT '0',
  `PitchSpeed` float NOT NULL DEFAULT '0',
  `PitchMin` float NOT NULL DEFAULT '0',
  `PitchMax` float NOT NULL DEFAULT '0',
  `MouseLookOffsetPitch` float NOT NULL DEFAULT '0',
  `CameraFadeDistScalarMin` float NOT NULL DEFAULT '0',
  `CameraFadeDistScalarMax` float NOT NULL DEFAULT '0',
  `CameraPitchOffset` float NOT NULL DEFAULT '0',
  `FacingLimitRight` float NOT NULL DEFAULT '0',
  `FacingLimitLeft` float NOT NULL DEFAULT '0',
  `MsslTrgtTurnLingering` float NOT NULL DEFAULT '0',
  `MsslTrgtPitchLingering` float NOT NULL DEFAULT '0',
  `MsslTrgtMouseLingering` float NOT NULL DEFAULT '0',
  `MsslTrgtEndOpacity` float NOT NULL DEFAULT '0',
  `MsslTrgtArcSpeed` float NOT NULL DEFAULT '0',
  `MsslTrgtArcRepeat` float NOT NULL DEFAULT '0',
  `MsslTrgtArcWidth` float NOT NULL DEFAULT '0',
  `MsslTrgtImpactRadius1` float NOT NULL DEFAULT '0',
  `MsslTrgtImpactRadius2` float NOT NULL DEFAULT '0',
  `MsslTrgtArcTexture` text,
  `MsslTrgtImpactTexture` text,
  `MsslTrgtImpactModel1` text,
  `MsslTrgtImpactModel2` text,
  `CameraYawOffset` float NOT NULL DEFAULT '0',
  `MsslTrgtImpactTexRadius` float NOT NULL DEFAULT '0',
  `SeatID1` smallint(5) unsigned NOT NULL DEFAULT '0',
  `SeatID2` smallint(5) unsigned NOT NULL DEFAULT '0',
  `SeatID3` smallint(5) unsigned NOT NULL DEFAULT '0',
  `SeatID4` smallint(5) unsigned NOT NULL DEFAULT '0',
  `SeatID5` smallint(5) unsigned NOT NULL DEFAULT '0',
  `SeatID6` smallint(5) unsigned NOT NULL DEFAULT '0',
  `SeatID7` smallint(5) unsigned NOT NULL DEFAULT '0',
  `SeatID8` smallint(5) unsigned NOT NULL DEFAULT '0',
  `VehicleUIIndicatorID` smallint(5) unsigned NOT NULL DEFAULT '0',
  `PowerDisplayID1` smallint(5) unsigned NOT NULL DEFAULT '0',
  `PowerDisplayID2` smallint(5) unsigned NOT NULL DEFAULT '0',
  `PowerDisplayID3` smallint(5) unsigned NOT NULL DEFAULT '0',
  `FlagsB` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `UILocomotionType` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `VerifiedBuild` smallint(6) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Table structure for table `vehicle_seat`
--
ALTER TABLE `vehicle_seat`
  CHANGE `EnterUISoundID` `EnterUISoundID` int(10) unsigned NOT NULL DEFAULT '0' AFTER `VehicleExitAnimDelay`,
  CHANGE `ExitUISoundID` `ExitUISoundID` int(10) unsigned NOT NULL DEFAULT '0' AFTER `EnterUISoundID`;

--
-- Table structure for table `wmo_area_table`
--
DROP TABLE IF EXISTS `wmo_area_table`;
CREATE TABLE `wmo_area_table` (
  `ID` int(10) unsigned NOT NULL DEFAULT '0',
  `WMOGroupID` int(11) NOT NULL DEFAULT '0',
  `AreaName` text,
  `WMOID` smallint(6) NOT NULL DEFAULT '0',
  `AmbienceID` int(10) unsigned NOT NULL DEFAULT '0',
  `ZoneMusic` int(10) unsigned NOT NULL DEFAULT '0',
  `IntroSound` int(10) unsigned NOT NULL DEFAULT '0',
  `AreaTableID` int(10) unsigned NOT NULL DEFAULT '0',
  `UWIntroSound` int(10) unsigned NOT NULL DEFAULT '0',
  `UWAmbience` int(10) unsigned NOT NULL DEFAULT '0',
  `NameSet` tinyint(4) NOT NULL DEFAULT '0',
  `SoundProviderPref` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `SoundProviderPrefUnderwater` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `Flags` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `UWZoneMusic` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `VerifiedBuild` smallint(6) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Table structure for table `wmo_area_table_locale`
--
DROP TABLE IF EXISTS `wmo_area_table_locale`;
CREATE TABLE `wmo_area_table_locale` (
  `ID` int(10) unsigned NOT NULL DEFAULT '0',
  `locale` varchar(4) NOT NULL,
  `AreaName_lang` text,
  `VerifiedBuild` smallint(6) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`locale`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Table structure for table `world_map_area`
--
DROP TABLE IF EXISTS `world_map_area`;
CREATE TABLE `world_map_area` (
  `ID` int(10) unsigned NOT NULL DEFAULT '0',
  `AreaName` text,
  `LocLeft` float NOT NULL DEFAULT '0',
  `LocRight` float NOT NULL DEFAULT '0',
  `LocTop` float NOT NULL DEFAULT '0',
  `LocBottom` float NOT NULL DEFAULT '0',
  `MapID` smallint(5) unsigned NOT NULL DEFAULT '0',
  `AreaID` smallint(5) unsigned NOT NULL DEFAULT '0',
  `DisplayMapID` smallint(6) NOT NULL DEFAULT '0',
  `DefaultDungeonFloor` smallint(6) NOT NULL DEFAULT '0',
  `ParentWorldMapID` smallint(5) unsigned NOT NULL DEFAULT '0',
  `Flags` smallint(5) unsigned NOT NULL DEFAULT '0',
  `PlayerConditionID` smallint(5) unsigned NOT NULL DEFAULT '0',
  `LevelRangeMin` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `LevelRangeMax` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `BountySetID` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `BountyBoardLocation` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `VerifiedBuild` smallint(6) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Table structure for table `world_map_overlay`
--
ALTER TABLE `world_map_overlay` ADD `Flags` tinyint(3) unsigned NOT NULL DEFAULT '0' AFTER `PlayerConditionID`;

--
-- Table structure for table `world_safe_locs`
--
DROP TABLE IF EXISTS `world_safe_locs`;
CREATE TABLE `world_safe_locs` (
  `ID` int(10) unsigned NOT NULL DEFAULT '0',
  `LocX` float NOT NULL DEFAULT '0',
  `LocY` float NOT NULL DEFAULT '0',
  `LocZ` float NOT NULL DEFAULT '0',
  `Facing` float NOT NULL DEFAULT '0',
  `AreaName` text,
  `MapID` smallint(5) unsigned NOT NULL DEFAULT '0',
  `VerifiedBuild` smallint(6) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Table structure for table `world_safe_locs_locale`
--
DROP TABLE IF EXISTS `world_safe_locs_locale`;
CREATE TABLE `world_safe_locs_locale` (
  `ID` int(10) unsigned NOT NULL DEFAULT '0',
  `locale` varchar(4) NOT NULL,
  `AreaName_lang` text,
  `VerifiedBuild` smallint(6) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`locale`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

DROP TABLE `game_tables`;
DROP TABLE `game_tables_locale`;
DROP TABLE `item_to_battle_pet_species`;
ALTER TABLE `achievement`
  MODIFY `Title` text NULL FIRST,
  MODIFY `Description` text NULL AFTER `Title`,
  MODIFY `Flags` int(10) unsigned NOT NULL DEFAULT '0' AFTER `Description`,
  MODIFY `Reward` text NULL AFTER `Flags`,
  MODIFY `MapID` smallint(6) NOT NULL DEFAULT '0' AFTER `Reward`,
  MODIFY `Supercedes` smallint(5) unsigned NOT NULL DEFAULT '0' AFTER `MapID`,
  MODIFY `Category` smallint(5) unsigned NOT NULL DEFAULT '0' AFTER `Supercedes`,
  MODIFY `UIOrder` smallint(5) unsigned NOT NULL DEFAULT '0' AFTER `Category`,
  MODIFY `IconID` smallint(5) unsigned NOT NULL DEFAULT '0' AFTER `UIOrder`,
  MODIFY `SharesCriteria` smallint(5) unsigned NOT NULL DEFAULT '0' AFTER `IconID`,
  MODIFY `CriteriaTree` smallint(5) unsigned NOT NULL DEFAULT '0' AFTER `SharesCriteria`,
  MODIFY `Faction` tinyint(4) NOT NULL DEFAULT '0' AFTER `CriteriaTree`,
  MODIFY `Points` tinyint(3) unsigned NOT NULL DEFAULT '0' AFTER `Faction`,
  MODIFY `MinimumCriteria` tinyint(3) unsigned NOT NULL DEFAULT '0' AFTER `Points`;

ALTER TABLE `area_table`
  CHANGE `PvPCombastWorldStateID` `PvPCombatWorldStateID` smallint(5) unsigned NOT NULL DEFAULT '0' AFTER `UWAmbience`,
  CHANGE `UWIntroMusic` `UWIntroSound` int(10) unsigned NOT NULL DEFAULT '0' AFTER `WindSettingsID`;

ALTER TABLE `area_trigger`
  MODIFY `PosX` float NOT NULL DEFAULT '0' FIRST,
  MODIFY `PosY` float NOT NULL DEFAULT '0' AFTER `PosX`,
  MODIFY `PosZ` float NOT NULL DEFAULT '0' AFTER `PosY`,
  MODIFY `Radius` float NOT NULL DEFAULT '0' AFTER `PosZ`,
  MODIFY `BoxLength` float NOT NULL DEFAULT '0' AFTER `Radius`,
  MODIFY `BoxWidth` float NOT NULL DEFAULT '0' AFTER `BoxLength`,
  MODIFY `BoxHeight` float NOT NULL DEFAULT '0' AFTER `BoxWidth`,
  MODIFY `BoxYaw` float NOT NULL DEFAULT '0' AFTER `BoxHeight`,
  MODIFY `MapID` smallint(5) unsigned NOT NULL DEFAULT '0' AFTER `BoxYaw`,
  MODIFY `PhaseID` smallint(5) unsigned NOT NULL DEFAULT '0' AFTER `MapID`,
  MODIFY `PhaseGroupID` smallint(5) unsigned NOT NULL DEFAULT '0' AFTER `PhaseID`,
  MODIFY `ShapeID` smallint(5) unsigned NOT NULL DEFAULT '0' AFTER `PhaseGroupID`,
  MODIFY `AreaTriggerActionSetID` smallint(5) unsigned NOT NULL DEFAULT '0' AFTER `ShapeID`,
  MODIFY `PhaseUseFlags` tinyint(3) unsigned NOT NULL DEFAULT '0' AFTER `AreaTriggerActionSetID`,
  MODIFY `ShapeType` tinyint(3) unsigned NOT NULL DEFAULT '0' AFTER `PhaseUseFlags`,
  MODIFY `Flag` tinyint(3) unsigned NOT NULL DEFAULT '0' AFTER `ShapeType`;

ALTER TABLE `barber_shop_style`
  MODIFY `DisplayName` text NULL FIRST,
  MODIFY `Description` text NULL AFTER `DisplayName`,
  MODIFY `CostModifier` float NOT NULL DEFAULT '0' AFTER `Description`,
  MODIFY `Type` tinyint(3) unsigned NOT NULL DEFAULT '0' AFTER `CostModifier`,
  MODIFY `Race` tinyint(3) unsigned NOT NULL DEFAULT '0' AFTER `Type`,
  MODIFY `Sex` tinyint(3) unsigned NOT NULL DEFAULT '0' AFTER `Race`,
  MODIFY `Data` tinyint(3) unsigned NOT NULL DEFAULT '0' AFTER `Sex`;

ALTER TABLE `battle_pet_species`
  MODIFY `CreatureID` int(10) unsigned NOT NULL DEFAULT '0' FIRST,
  MODIFY `IconFileID` int(10) unsigned NOT NULL DEFAULT '0' AFTER `CreatureID`,
  MODIFY `SummonSpellID` int(10) unsigned NOT NULL DEFAULT '0' AFTER `IconFileID`,
  MODIFY `SourceText` text NULL AFTER `SummonSpellID`,
  MODIFY `Description` text NULL AFTER `SourceText`,
  MODIFY `Flags` smallint(5) unsigned NOT NULL DEFAULT '0' AFTER `Description`,
  MODIFY `PetType` tinyint(3) unsigned NOT NULL DEFAULT '0' AFTER `Flags`,
  MODIFY `Source` tinyint(4) NOT NULL DEFAULT '0' AFTER `PetType`;

ALTER TABLE `broadcast_text`
  CHANGE `SoundID` `SoundID1` int(10) unsigned NOT NULL DEFAULT '0' AFTER `Type`,
  ADD `SoundID2` int(10) unsigned NOT NULL DEFAULT '0' AFTER `SoundID1`,
  ADD `PlayerConditionID` int(10) unsigned NOT NULL DEFAULT '0' AFTER `SoundID2`;

ALTER TABLE `chr_classes`
  MODIFY `PetNameToken` text NULL FIRST,
  MODIFY `Name` text NULL AFTER `PetNameToken`,
  MODIFY `NameFemale` text NULL AFTER `Name`,
  MODIFY `NameMale` text NULL AFTER `NameFemale`,
  MODIFY `Filename` text NULL AFTER `NameMale`,
  MODIFY `CreateScreenFileDataID` int(10) unsigned NOT NULL DEFAULT '0' AFTER `Filename`,
  MODIFY `SelectScreenFileDataID` int(10) unsigned NOT NULL DEFAULT '0' AFTER `CreateScreenFileDataID`,
  MODIFY `LowResScreenFileDataID` int(10) unsigned NOT NULL DEFAULT '0' AFTER `SelectScreenFileDataID`,
  MODIFY `Flags` smallint(5) unsigned NOT NULL DEFAULT '0' AFTER `LowResScreenFileDataID`,
  MODIFY `CinematicSequenceID` smallint(5) unsigned NOT NULL DEFAULT '0' AFTER `Flags`,
  MODIFY `DefaultSpec` smallint(5) unsigned NOT NULL DEFAULT '0' AFTER `CinematicSequenceID`,
  MODIFY `PowerType` tinyint(3) unsigned NOT NULL DEFAULT '0' AFTER `DefaultSpec`,
  MODIFY `SpellClassSet` tinyint(3) unsigned NOT NULL DEFAULT '0' AFTER `PowerType`,
  MODIFY `AttackPowerPerStrength` tinyint(3) unsigned NOT NULL DEFAULT '0' AFTER `SpellClassSet`,
  MODIFY `AttackPowerPerAgility` tinyint(3) unsigned NOT NULL DEFAULT '0' AFTER `AttackPowerPerStrength`,
  MODIFY `RangedAttackPowerPerAgility` tinyint(3) unsigned NOT NULL DEFAULT '0' AFTER `AttackPowerPerAgility`,
  MODIFY `IconFileDataID` tinyint(3) unsigned NOT NULL DEFAULT '0' AFTER `RangedAttackPowerPerAgility`,
  MODIFY `Unk1` tinyint(3) unsigned NOT NULL DEFAULT '0' AFTER `IconFileDataID`;

ALTER TABLE `chr_races`
  MODIFY `Unk` smallint(5) unsigned NOT NULL DEFAULT '0' AFTER `UAFemaleCreatureSoundDataID`,
  MODIFY `BaseLanguage` tinyint(3) unsigned NOT NULL DEFAULT '0' AFTER `Unk`,
  MODIFY `CreatureType` tinyint(3) unsigned NOT NULL DEFAULT '0' AFTER `BaseLanguage`,
  MODIFY `TeamID` tinyint(3) unsigned NOT NULL DEFAULT '0' AFTER `CreatureType`,
  MODIFY `RaceRelated` tinyint(3) unsigned NOT NULL DEFAULT '0' AFTER `TeamID`,
  MODIFY `UnalteredVisualRaceID` tinyint(3) unsigned NOT NULL DEFAULT '0' AFTER `RaceRelated`,
  MODIFY `CharComponentTextureLayoutID` tinyint(3) unsigned NOT NULL DEFAULT '0' AFTER `UnalteredVisualRaceID`,
  MODIFY `DefaultClassID` tinyint(3) unsigned NOT NULL DEFAULT '0' AFTER `CharComponentTextureLayoutID`,
  MODIFY `NeutralRaceID` tinyint(3) unsigned NOT NULL DEFAULT '0' AFTER `DefaultClassID`,
  MODIFY `ItemAppearanceFrameRaceID` tinyint(3) unsigned NOT NULL DEFAULT '0' AFTER `NeutralRaceID`,
  MODIFY `CharComponentTexLayoutHiResID` tinyint(3) unsigned NOT NULL DEFAULT '0' AFTER `ItemAppearanceFrameRaceID`,
  MODIFY `HighResMaleDisplayID` int(10) unsigned NOT NULL DEFAULT '0' AFTER `CharComponentTexLayoutHiResID`,
  MODIFY `HighResFemaleDisplayID` int(10) unsigned NOT NULL DEFAULT '0' AFTER `HighResMaleDisplayID`;

ALTER TABLE `chr_specialization`
  MODIFY `MasterySpellID1` int(10) unsigned NOT NULL DEFAULT '0' FIRST,
  MODIFY `MasterySpellID2` int(10) unsigned NOT NULL DEFAULT '0' AFTER `MasterySpellID1`,
  MODIFY `Name` text NULL AFTER `MasterySpellID2`,
  MODIFY `Name2` text NULL AFTER `Name`,
  MODIFY `Description` text NULL AFTER `Name2`,
  MODIFY `BackgroundFile` text NULL AFTER `Description`,
  MODIFY `SpellIconID` smallint(5) unsigned NOT NULL DEFAULT '0' AFTER `BackgroundFile`,
  MODIFY `ClassID` tinyint(3) unsigned NOT NULL DEFAULT '0' AFTER `SpellIconID`,
  MODIFY `OrderIndex` tinyint(3) unsigned NOT NULL DEFAULT '0' AFTER `ClassID`,
  MODIFY `PetTalentType` tinyint(3) unsigned NOT NULL DEFAULT '0' AFTER `OrderIndex`,
  MODIFY `Role` tinyint(3) unsigned NOT NULL DEFAULT '0' AFTER `PetTalentType`,
  MODIFY `PrimaryStatOrder` tinyint(3) unsigned NOT NULL DEFAULT '0' AFTER `Role`;

ALTER TABLE `creature_model_data`
  MODIFY `ModelScale` float NOT NULL DEFAULT '0' AFTER `ID`,
  MODIFY `FootprintTextureLength` float NOT NULL DEFAULT '0' AFTER `ModelScale`,
  MODIFY `FootprintTextureWidth` float NOT NULL DEFAULT '0' AFTER `FootprintTextureLength`,
  MODIFY `FootprintParticleScale` float NOT NULL DEFAULT '0' AFTER `FootprintTextureWidth`,
  MODIFY `CollisionWidth` float NOT NULL DEFAULT '0' AFTER `FootprintParticleScale`,
  MODIFY `CollisionHeight` float NOT NULL DEFAULT '0' AFTER `CollisionWidth`,
  MODIFY `MountHeight` float NOT NULL DEFAULT '0' AFTER `CollisionHeight`,
  MODIFY `GeoBoxMin1` float NOT NULL DEFAULT '0' AFTER `MountHeight`,
  MODIFY `GeoBoxMin2` float NOT NULL DEFAULT '0' AFTER `GeoBoxMin1`,
  MODIFY `GeoBoxMin3` float NOT NULL DEFAULT '0' AFTER `GeoBoxMin2`,
  MODIFY `GeoBoxMax1` float NOT NULL DEFAULT '0' AFTER `GeoBoxMin3`,
  MODIFY `GeoBoxMax2` float NOT NULL DEFAULT '0' AFTER `GeoBoxMax1`,
  MODIFY `GeoBoxMax3` float NOT NULL DEFAULT '0' AFTER `GeoBoxMax2`,
  MODIFY `WorldEffectScale` float NOT NULL DEFAULT '0' AFTER `GeoBoxMax3`,
  MODIFY `AttachedEffectScale` float NOT NULL DEFAULT '0' AFTER `WorldEffectScale`,
  MODIFY `MissileCollisionRadius` float NOT NULL DEFAULT '0' AFTER `AttachedEffectScale`,
  MODIFY `MissileCollisionPush` float NOT NULL DEFAULT '0' AFTER `MissileCollisionRadius`,
  MODIFY `MissileCollisionRaise` float NOT NULL DEFAULT '0' AFTER `MissileCollisionPush`,
  MODIFY `OverrideLootEffectScale` float NOT NULL DEFAULT '0' AFTER `MissileCollisionRaise`,
  MODIFY `OverrideNameScale` float NOT NULL DEFAULT '0' AFTER `OverrideLootEffectScale`,
  MODIFY `OverrideSelectionRadius` float NOT NULL DEFAULT '0' AFTER `OverrideNameScale`,
  MODIFY `TamedPetBaseScale` float NOT NULL DEFAULT '0' AFTER `OverrideSelectionRadius`,
  MODIFY `HoverHeight` float NOT NULL DEFAULT '0' AFTER `TamedPetBaseScale`,
  MODIFY `SizeClass` int(10) unsigned NOT NULL DEFAULT '0' AFTER `FileDataID`,
  MODIFY `BloodID` int(10) unsigned NOT NULL DEFAULT '0' AFTER `SizeClass`,
  MODIFY `FootprintTextureID` int(10) unsigned NOT NULL DEFAULT '0' AFTER `BloodID`,
  MODIFY `FoleyMaterialID` int(10) unsigned NOT NULL DEFAULT '0' AFTER `FootprintTextureID`,
  CHANGE `Unk700_1` `FootstepEffectID` int(10) unsigned NOT NULL DEFAULT '0' AFTER `FoleyMaterialID`,
  CHANGE `Unk700_2` `DeathThudEffectID` int(10) unsigned NOT NULL DEFAULT '0' AFTER `FootstepEffectID`,
  MODIFY `FootstepShakeSize` int(10) unsigned NOT NULL DEFAULT '0' AFTER `DeathThudEffectID`,
  MODIFY `DeathThudShakeSize` int(10) unsigned NOT NULL DEFAULT '0' AFTER `FootstepShakeSize`,
  MODIFY `SoundID` int(10) unsigned NOT NULL DEFAULT '0' AFTER `DeathThudShakeSize`,
  MODIFY `CreatureGeosetDataID` int(10) unsigned NOT NULL DEFAULT '0' AFTER `SoundID`;

ALTER TABLE `criteria_tree`
  MODIFY `CriteriaID` int(10) unsigned NOT NULL DEFAULT '0' AFTER `ID`,
  MODIFY `Operator` tinyint(3) unsigned NOT NULL DEFAULT '0' AFTER `Flags`,
  MODIFY `OrderIndex` int(10) unsigned NOT NULL DEFAULT '0' AFTER `Operator`;

ALTER TABLE `currency_types`
  MODIFY `SpellCategory` tinyint(3) unsigned NOT NULL DEFAULT '0' AFTER `CategoryID`,
  MODIFY `Quality` tinyint(3) unsigned NOT NULL DEFAULT '0' AFTER `SpellCategory`,
  MODIFY `SpellWeight` int(10) unsigned NOT NULL DEFAULT '0' AFTER `Quality`;

ALTER TABLE `dungeon_encounter`
  MODIFY `SpellIconID` smallint(5) unsigned NOT NULL DEFAULT '0' AFTER `MapID`,
  MODIFY `DifficultyID` tinyint(3) unsigned NOT NULL DEFAULT '0' AFTER `SpellIconID`,
  MODIFY `Bit` tinyint(3) unsigned NOT NULL DEFAULT '0' AFTER `DifficultyID`,
  MODIFY `Flags` tinyint(3) unsigned NOT NULL DEFAULT '0' AFTER `Bit`,
  MODIFY `OrderIndex` int(10) unsigned NOT NULL DEFAULT '0' AFTER `Flags`;

ALTER TABLE `emotes`
  MODIFY `EmoteSpecProc` tinyint(3) unsigned NOT NULL DEFAULT '0' AFTER `AnimID`,
  MODIFY `EmoteSpecProcParam` int(10) unsigned NOT NULL DEFAULT '0' AFTER `EmoteSpecProc`,
  MODIFY `EmoteSoundID` int(10) unsigned NOT NULL DEFAULT '0' AFTER `EmoteSpecProcParam`,
  CHANGE `Unk703_1` `ClassMask` int(10) unsigned NOT NULL DEFAULT '0' AFTER `EmoteSoundID`,
  CHANGE `Unk703_2` `RaceMask` int(10) unsigned NOT NULL DEFAULT '0' AFTER `ClassMask`;

ALTER TABLE `emotes_text_sound`
  MODIFY `RaceId` tinyint(3) unsigned NOT NULL DEFAULT '0' AFTER `EmotesTextId`,
  MODIFY `SexId` tinyint(3) unsigned NOT NULL DEFAULT '0' AFTER `RaceId`,
  MODIFY `ClassId` tinyint(3) unsigned NOT NULL DEFAULT '0' AFTER `SexId`,
  MODIFY `SoundId` int(10) unsigned NOT NULL DEFAULT '0' AFTER `ClassId`;

ALTER TABLE `faction`
  ADD `ReputationMax1` int(10) unsigned NOT NULL DEFAULT '0' AFTER `Description`,
  ADD `ReputationMax2` int(10) unsigned NOT NULL DEFAULT '0' AFTER `ReputationMax1`,
  ADD `ReputationMax3` int(10) unsigned NOT NULL DEFAULT '0' AFTER `ReputationMax2`,
  ADD `ReputationMax4` int(10) unsigned NOT NULL DEFAULT '0' AFTER `ReputationMax3`;

ALTER TABLE `gameobjects`
  MODIFY `PositionX` float NOT NULL DEFAULT '0' FIRST,
  MODIFY `PositionY` float NOT NULL DEFAULT '0' AFTER `PositionX`,
  MODIFY `PositionZ` float NOT NULL DEFAULT '0' AFTER `PositionY`,
  MODIFY `RotationX` float NOT NULL DEFAULT '0' AFTER `PositionZ`,
  MODIFY `RotationY` float NOT NULL DEFAULT '0' AFTER `RotationX`,
  MODIFY `RotationZ` float NOT NULL DEFAULT '0' AFTER `RotationY`,
  MODIFY `RotationW` float NOT NULL DEFAULT '0' AFTER `RotationZ`,
  MODIFY `Size` float NOT NULL DEFAULT '0' AFTER `RotationW`,
  MODIFY `Data1` int(11) NOT NULL DEFAULT '0' AFTER `Size`,
  MODIFY `Data2` int(11) NOT NULL DEFAULT '0' AFTER `Data1`,
  MODIFY `Data3` int(11) NOT NULL DEFAULT '0' AFTER `Data2`,
  MODIFY `Data4` int(11) NOT NULL DEFAULT '0' AFTER `Data3`,
  MODIFY `Data5` int(11) NOT NULL DEFAULT '0' AFTER `Data4`,
  MODIFY `Data6` int(11) NOT NULL DEFAULT '0' AFTER `Data5`,
  MODIFY `Data7` int(11) NOT NULL DEFAULT '0' AFTER `Data6`,
  MODIFY `Data8` int(11) NOT NULL DEFAULT '0' AFTER `Data7`,
  MODIFY `Name` text NULL AFTER `Data8`,
  MODIFY `MapID` smallint(5) unsigned NOT NULL DEFAULT '0' AFTER `Name`,
  MODIFY `DisplayID` smallint(5) unsigned NOT NULL DEFAULT '0' AFTER `MapID`,
  MODIFY `PhaseID` smallint(5) unsigned NOT NULL DEFAULT '0' AFTER `DisplayID`,
  MODIFY `PhaseGroupID` smallint(5) unsigned NOT NULL DEFAULT '0' AFTER `PhaseID`,
  MODIFY `PhaseUseFlags` tinyint(3) unsigned NOT NULL DEFAULT '0' AFTER `PhaseGroupID`,
  MODIFY `Type` tinyint(3) unsigned NOT NULL DEFAULT '0' AFTER `PhaseUseFlags`;

ALTER TABLE `garr_ability`
  MODIFY `Name` text NULL FIRST,
  MODIFY `Description` text NULL AFTER `Name`,
  MODIFY `IconFileDataID` int(10) unsigned NOT NULL DEFAULT '0' AFTER `Description`,
  MODIFY `Flags` smallint(5) unsigned NOT NULL DEFAULT '0' AFTER `IconFileDataID`,
  MODIFY `OtherFactionGarrAbilityID` smallint(5) unsigned NOT NULL DEFAULT '0' AFTER `Flags`,
  MODIFY `GarrAbilityCategoryID` tinyint(3) unsigned NOT NULL DEFAULT '0' AFTER `OtherFactionGarrAbilityID`,
  MODIFY `FollowerTypeID` tinyint(3) unsigned NOT NULL DEFAULT '0' AFTER `GarrAbilityCategoryID`;

ALTER TABLE `garr_building`
  MODIFY `CostCurrencyID` smallint(5) unsigned NOT NULL DEFAULT '0' AFTER `IconFileDataID`,
  MODIFY `HordeTexPrefixKitID` smallint(5) unsigned NOT NULL DEFAULT '0' AFTER `CostCurrencyID`,
  MODIFY `AllianceTexPrefixKitID` smallint(5) unsigned NOT NULL DEFAULT '0' AFTER `HordeTexPrefixKitID`,
  MODIFY `AllianceActivationScenePackageID` smallint(5) unsigned NOT NULL DEFAULT '0' AFTER `AllianceTexPrefixKitID`,
  MODIFY `HordeActivationScenePackageID` smallint(5) unsigned NOT NULL DEFAULT '0' AFTER `AllianceActivationScenePackageID`,
  MODIFY `FollowerRequiredGarrAbilityID` smallint(5) unsigned NOT NULL DEFAULT '0' AFTER `HordeActivationScenePackageID`,
  MODIFY `FollowerGarrAbilityEffectID` smallint(5) unsigned NOT NULL DEFAULT '0' AFTER `FollowerRequiredGarrAbilityID`,
  MODIFY `CostMoney` smallint(6) NOT NULL DEFAULT '0' AFTER `FollowerGarrAbilityEffectID`,
  MODIFY `Unknown` tinyint(3) unsigned NOT NULL DEFAULT '0' AFTER `CostMoney`,
  MODIFY `Type` tinyint(3) unsigned NOT NULL DEFAULT '0' AFTER `Unknown`,
  MODIFY `Level` tinyint(3) unsigned NOT NULL DEFAULT '0' AFTER `Type`,
  MODIFY `Flags` tinyint(3) unsigned NOT NULL DEFAULT '0' AFTER `Level`,
  MODIFY `MaxShipments` tinyint(3) unsigned NOT NULL DEFAULT '0' AFTER `Flags`,
  MODIFY `GarrTypeID` tinyint(3) unsigned NOT NULL DEFAULT '0' AFTER `MaxShipments`,
  MODIFY `BuildDuration` int(10) unsigned NOT NULL DEFAULT '0' AFTER `GarrTypeID`,
  MODIFY `CostCurrencyAmount` int(11) NOT NULL DEFAULT '0' AFTER `BuildDuration`,
  MODIFY `BonusAmount` int(10) unsigned NOT NULL DEFAULT '0' AFTER `CostCurrencyAmount`;

ALTER TABLE `garr_building_plot_inst`
  MODIFY `LandmarkOffsetX` float NOT NULL DEFAULT '0' FIRST,
  MODIFY `LandmarkOffsetY` float NOT NULL DEFAULT '0' AFTER `LandmarkOffsetX`,
  MODIFY `UiTextureAtlasMemberID` smallint(5) unsigned NOT NULL DEFAULT '0' AFTER `LandmarkOffsetY`,
  MODIFY `GarrSiteLevelPlotInstID` smallint(5) unsigned NOT NULL DEFAULT '0' AFTER `UiTextureAtlasMemberID`,
  MODIFY `GarrBuildingID` tinyint(3) unsigned NOT NULL DEFAULT '0' AFTER `GarrSiteLevelPlotInstID`;

ALTER TABLE `garr_class_spec`
  MODIFY `NameMale` text NULL FIRST,
  MODIFY `NameFemale` text NULL AFTER `NameMale`,
  MODIFY `NameGenderless` text NULL AFTER `NameFemale`,
  MODIFY `ClassAtlasID` smallint(5) unsigned NOT NULL DEFAULT '0' AFTER `NameGenderless`,
  MODIFY `GarrFollItemSetID` tinyint(3) unsigned NOT NULL DEFAULT '0' AFTER `ClassAtlasID`,
  MODIFY `Limit` tinyint(3) unsigned NOT NULL DEFAULT '0' AFTER `GarrFollItemSetID`,
  MODIFY `Flags` tinyint(3) unsigned NOT NULL DEFAULT '0' AFTER `Limit`;

ALTER TABLE `garr_follower`
  MODIFY `HordeCreatureID` int(10) unsigned NOT NULL DEFAULT '0' FIRST,
  MODIFY `AllianceCreatureID` int(10) unsigned NOT NULL DEFAULT '0' AFTER `HordeCreatureID`,
  MODIFY `HordeSourceText` text NULL AFTER `AllianceCreatureID`,
  MODIFY `AllianceSourceText` text NULL AFTER `HordeSourceText`,
  MODIFY `HordePortraitIconID` int(10) unsigned NOT NULL DEFAULT '0' AFTER `AllianceSourceText`,
  MODIFY `AlliancePortraitIconID` int(10) unsigned NOT NULL DEFAULT '0' AFTER `HordePortraitIconID`,
  ADD `HordeAddedBroadcastTextID` int(10) unsigned NOT NULL DEFAULT '0' AFTER `AlliancePortraitIconID`,
  ADD `AllianceAddedBroadcastTextID` int(10) unsigned NOT NULL DEFAULT '0' AFTER `HordeAddedBroadcastTextID`,
  MODIFY `HordeGarrFollItemSetID` smallint(5) unsigned NOT NULL DEFAULT '0' AFTER `AllianceAddedBroadcastTextID`,
  MODIFY `AllianceGarrFollItemSetID` smallint(5) unsigned NOT NULL DEFAULT '0' AFTER `HordeGarrFollItemSetID`,
  MODIFY `ItemLevelWeapon` smallint(5) unsigned NOT NULL DEFAULT '0' AFTER `AllianceGarrFollItemSetID`,
  MODIFY `ItemLevelArmor` smallint(5) unsigned NOT NULL DEFAULT '0' AFTER `ItemLevelWeapon`,
  MODIFY `HordeListPortraitTextureKitID` smallint(5) unsigned NOT NULL DEFAULT '0' AFTER `ItemLevelArmor`,
  MODIFY `AllianceListPortraitTextureKitID` smallint(5) unsigned NOT NULL DEFAULT '0' AFTER `HordeListPortraitTextureKitID`,
  MODIFY `FollowerTypeID` tinyint(3) unsigned NOT NULL DEFAULT '0' AFTER `AllianceListPortraitTextureKitID`,
  MODIFY `HordeUiAnimRaceInfoID` tinyint(3) unsigned NOT NULL DEFAULT '0' AFTER `FollowerTypeID`,
  MODIFY `AllianceUiAnimRaceInfoID` tinyint(3) unsigned NOT NULL DEFAULT '0' AFTER `HordeUiAnimRaceInfoID`,
  MODIFY `Quality` tinyint(3) unsigned NOT NULL DEFAULT '0' AFTER `AllianceUiAnimRaceInfoID`,
  MODIFY `HordeGarrClassSpecID` tinyint(3) unsigned NOT NULL DEFAULT '0' AFTER `Quality`,
  MODIFY `AllianceGarrClassSpecID` tinyint(3) unsigned NOT NULL DEFAULT '0' AFTER `HordeGarrClassSpecID`,
  MODIFY `Level` tinyint(3) unsigned NOT NULL DEFAULT '0' AFTER `AllianceGarrClassSpecID`,
  MODIFY `Unknown1` tinyint(3) unsigned NOT NULL DEFAULT '0' AFTER `Level`,
  MODIFY `Flags` tinyint(3) unsigned NOT NULL DEFAULT '0' AFTER `Unknown1`,
  MODIFY `Unknown2` tinyint(4) NOT NULL DEFAULT '0' AFTER `Flags`,
  MODIFY `Unknown3` tinyint(4) NOT NULL DEFAULT '0' AFTER `Unknown2`,
  MODIFY `GarrTypeID` tinyint(3) unsigned NOT NULL DEFAULT '0' AFTER `Unknown3`,
  MODIFY `MaxDurability` tinyint(3) unsigned NOT NULL DEFAULT '0' AFTER `GarrTypeID`,
  MODIFY `Class` tinyint(3) unsigned NOT NULL DEFAULT '0' AFTER `MaxDurability`,
  ADD `HordeFlavorTextGarrStringID` tinyint(3) unsigned NOT NULL DEFAULT '0' AFTER `Class`,
  ADD `AllianceFlavorTextGarrStringID` tinyint(3) unsigned NOT NULL DEFAULT '0' AFTER `HordeFlavorTextGarrStringID`;

ALTER TABLE `garr_plot`
  MODIFY `GarrPlotUICategoryID` tinyint(3) unsigned NOT NULL DEFAULT '0' AFTER `HordeConstructionGameObjectID`,
  MODIFY `PlotType` tinyint(3) unsigned NOT NULL DEFAULT '0' AFTER `GarrPlotUICategoryID`,
  MODIFY `Flags` tinyint(3) unsigned NOT NULL DEFAULT '0' AFTER `PlotType`,
  MODIFY `MinCount` int(10) unsigned NOT NULL DEFAULT '0' AFTER `Flags`,
  MODIFY `MaxCount` int(10) unsigned NOT NULL DEFAULT '0' AFTER `MinCount`;

ALTER TABLE `garr_site_level` MODIFY `SiteID` smallint(5) unsigned NOT NULL DEFAULT '0' AFTER `MapID`;

ALTER TABLE `heirloom`
  MODIFY `ItemID` int(10) unsigned NOT NULL DEFAULT '0' FIRST,
  MODIFY `SourceText` text NULL AFTER `ItemID`,
  MODIFY `OldItem1` int(10) unsigned NOT NULL DEFAULT '0' AFTER `SourceText`,
  MODIFY `OldItem2` int(10) unsigned NOT NULL DEFAULT '0' AFTER `OldItem1`,
  MODIFY `NextDifficultyItemID` int(10) unsigned NOT NULL DEFAULT '0' AFTER `OldItem2`,
  MODIFY `UpgradeItemID1` int(10) unsigned NOT NULL DEFAULT '0' AFTER `NextDifficultyItemID`,
  MODIFY `UpgradeItemID2` int(10) unsigned NOT NULL DEFAULT '0' AFTER `UpgradeItemID1`,
  MODIFY `ItemBonusListID1` smallint(5) unsigned NOT NULL DEFAULT '0' AFTER `UpgradeItemID2`,
  MODIFY `ItemBonusListID2` smallint(5) unsigned NOT NULL DEFAULT '0' AFTER `ItemBonusListID1`,
  MODIFY `Flags` tinyint(3) unsigned NOT NULL DEFAULT '0' AFTER `ItemBonusListID2`,
  MODIFY `Source` tinyint(3) unsigned NOT NULL DEFAULT '0' AFTER `Flags`;

ALTER TABLE `item_extended_cost` DROP `RequiredMoney`;

ALTER TABLE `item_modified_appearance`
  MODIFY `ItemID` int(10) unsigned NOT NULL DEFAULT '0' FIRST,
  MODIFY `AppearanceID` smallint(5) unsigned NOT NULL DEFAULT '0' AFTER `ItemID`,
  MODIFY `AppearanceModID` tinyint(3) unsigned NOT NULL DEFAULT '0' AFTER `AppearanceID`,
  MODIFY `Index` tinyint(3) unsigned NOT NULL DEFAULT '0' AFTER `AppearanceModID`,
  MODIFY `SourceType` tinyint(3) unsigned NOT NULL DEFAULT '0' AFTER `Index`;

ALTER TABLE `item_set`
  MODIFY `RequiredSkill` int(10) unsigned NOT NULL DEFAULT '0' AFTER `RequiredSkillRank`,
  CHANGE `Unknown703` `Flags` int(10) unsigned NOT NULL DEFAULT '0' AFTER `RequiredSkill`;

ALTER TABLE `lfg_dungeons`
  MODIFY `Name` text NULL FIRST,
  MODIFY `Flags` int(10) unsigned NOT NULL DEFAULT '0' AFTER `Name`,
  MODIFY `TextureFilename` text NULL AFTER `Flags`,
  MODIFY `Description` text NULL AFTER `TextureFilename`,
  MODIFY `MaxLevel` smallint(5) unsigned NOT NULL DEFAULT '0' AFTER `Description`,
  MODIFY `TargetLevelMax` smallint(5) unsigned NOT NULL DEFAULT '0' AFTER `MaxLevel`,
  MODIFY `MapID` smallint(6) NOT NULL DEFAULT '0' AFTER `TargetLevelMax`,
  MODIFY `RandomID` smallint(5) unsigned NOT NULL DEFAULT '0' AFTER `MapID`,
  MODIFY `ScenarioID` smallint(5) unsigned NOT NULL DEFAULT '0' AFTER `RandomID`,
  MODIFY `LastBossJournalEncounterID` smallint(5) unsigned NOT NULL DEFAULT '0' AFTER `ScenarioID`,
  MODIFY `BonusReputationAmount` smallint(5) unsigned NOT NULL DEFAULT '0' AFTER `LastBossJournalEncounterID`,
  MODIFY `MentorItemLevel` smallint(5) unsigned NOT NULL DEFAULT '0' AFTER `BonusReputationAmount`,
  MODIFY `MinLevel` tinyint(3) unsigned NOT NULL DEFAULT '0' AFTER `MentorItemLevel`,
  MODIFY `TargetLevel` tinyint(3) unsigned NOT NULL DEFAULT '0' AFTER `MinLevel`,
  MODIFY `TargetLevelMin` tinyint(3) unsigned NOT NULL DEFAULT '0' AFTER `TargetLevel`,
  MODIFY `DifficultyID` tinyint(3) unsigned NOT NULL DEFAULT '0' AFTER `TargetLevelMin`,
  MODIFY `Type` tinyint(3) unsigned NOT NULL DEFAULT '0' AFTER `DifficultyID`,
  MODIFY `Faction` tinyint(3) unsigned NOT NULL DEFAULT '0' AFTER `Type`,
  MODIFY `Expansion` tinyint(3) unsigned NOT NULL DEFAULT '0' AFTER `Faction`,
  MODIFY `OrderIndex` tinyint(3) unsigned NOT NULL DEFAULT '0' AFTER `Expansion`,
  MODIFY `GroupID` tinyint(3) unsigned NOT NULL DEFAULT '0' AFTER `OrderIndex`,
  MODIFY `CountTank` tinyint(3) unsigned NOT NULL DEFAULT '0' AFTER `GroupID`,
  MODIFY `CountHealer` tinyint(3) unsigned NOT NULL DEFAULT '0' AFTER `CountTank`,
  MODIFY `CountDamage` tinyint(3) unsigned NOT NULL DEFAULT '0' AFTER `CountHealer`,
  MODIFY `MinCountTank` tinyint(3) unsigned NOT NULL DEFAULT '0' AFTER `CountDamage`,
  MODIFY `MinCountHealer` tinyint(3) unsigned NOT NULL DEFAULT '0' AFTER `MinCountTank`,
  MODIFY `MinCountDamage` tinyint(3) unsigned NOT NULL DEFAULT '0' AFTER `MinCountHealer`,
  MODIFY `SubType` tinyint(3) unsigned NOT NULL DEFAULT '0' AFTER `MinCountDamage`,
  MODIFY `MentorCharLevel` tinyint(3) unsigned NOT NULL DEFAULT '0' AFTER `SubType`;

ALTER TABLE `liquid_type`
  MODIFY `LightID` smallint(5) unsigned NOT NULL DEFAULT '0' AFTER `Flags`,
  MODIFY `Type` tinyint(3) unsigned NOT NULL DEFAULT '0' AFTER `LightID`,
  MODIFY `ParticleMovement` tinyint(3) unsigned NOT NULL DEFAULT '0' AFTER `Type`,
  MODIFY `ParticleTexSlots` tinyint(3) unsigned NOT NULL DEFAULT '0' AFTER `ParticleMovement`,
  MODIFY `MaterialID` tinyint(3) unsigned NOT NULL DEFAULT '0' AFTER `ParticleTexSlots`,
  MODIFY `DepthTexCount1` tinyint(3) unsigned NOT NULL DEFAULT '0' AFTER `MaterialID`,
  MODIFY `DepthTexCount2` tinyint(3) unsigned NOT NULL DEFAULT '0' AFTER `DepthTexCount1`,
  MODIFY `DepthTexCount3` tinyint(3) unsigned NOT NULL DEFAULT '0' AFTER `DepthTexCount2`,
  MODIFY `DepthTexCount4` tinyint(3) unsigned NOT NULL DEFAULT '0' AFTER `DepthTexCount3`,
  MODIFY `DepthTexCount5` tinyint(3) unsigned NOT NULL DEFAULT '0' AFTER `DepthTexCount4`,
  MODIFY `DepthTexCount6` tinyint(3) unsigned NOT NULL DEFAULT '0' AFTER `DepthTexCount5`,
  MODIFY `SoundID` int(10) unsigned NOT NULL DEFAULT '0' AFTER `DepthTexCount6`;

ALTER TABLE `map_difficulty`
  MODIFY `MapID` smallint(5) unsigned NOT NULL DEFAULT '0' AFTER `Message`,
  MODIFY `DifficultyID` tinyint(3) unsigned NOT NULL DEFAULT '0' AFTER `MapID`,
  MODIFY `RaidDurationType` tinyint(3) unsigned NOT NULL DEFAULT '0' AFTER `DifficultyID`,
  MODIFY `MaxPlayers` tinyint(3) unsigned NOT NULL DEFAULT '0' AFTER `RaidDurationType`,
  MODIFY `LockID` tinyint(3) unsigned NOT NULL DEFAULT '0' AFTER `MaxPlayers`,
  MODIFY `ItemBonusTreeModID` tinyint(3) unsigned NOT NULL DEFAULT '0' AFTER `LockID`;

ALTER TABLE `mount`
  MODIFY `SpellId` int(10) unsigned NOT NULL DEFAULT '0' FIRST,
  MODIFY `DisplayId` int(10) unsigned NOT NULL DEFAULT '0' AFTER `SpellId`,
  MODIFY `Name` text NULL AFTER `DisplayId`,
  MODIFY `Description` text NULL AFTER `Name`,
  MODIFY `SourceDescription` text NULL AFTER `Description`,
  ADD `CameraPivotMultiplier` float NOT NULL DEFAULT '0' AFTER `SourceDescription`,
  MODIFY `MountTypeId` smallint(5) unsigned NOT NULL DEFAULT '0' AFTER `CameraPivotMultiplier`,
  MODIFY `Flags` smallint(5) unsigned NOT NULL DEFAULT '0' AFTER `MountTypeId`,
  MODIFY `PlayerConditionId` smallint(5) unsigned NOT NULL DEFAULT '0' AFTER `Flags`,
  MODIFY `Source` tinyint(3) unsigned NOT NULL DEFAULT '0' AFTER `PlayerConditionId`;

ALTER TABLE `mount_capability`
  MODIFY `RequiredSpell` int(10) unsigned NOT NULL DEFAULT '0' FIRST,
  MODIFY `SpeedModSpell` int(10) unsigned NOT NULL DEFAULT '0' AFTER `RequiredSpell`,
  MODIFY `RequiredRidingSkill` smallint(5) unsigned NOT NULL DEFAULT '0' AFTER `SpeedModSpell`,
  MODIFY `RequiredArea` smallint(5) unsigned NOT NULL DEFAULT '0' AFTER `RequiredRidingSkill`,
  MODIFY `RequiredMap` smallint(6) NOT NULL DEFAULT '0' AFTER `RequiredArea`,
  MODIFY `Flags` tinyint(3) unsigned NOT NULL DEFAULT '0' AFTER `RequiredMap`;

ALTER TABLE `player_condition`
  MODIFY `ItemLogic` int(10) unsigned NOT NULL DEFAULT '0' AFTER `SpellLogic`,
  MODIFY `Time1` int(10) unsigned NOT NULL DEFAULT '0' AFTER `ItemLogic`,
  MODIFY `Time2` int(10) unsigned NOT NULL DEFAULT '0' AFTER `Time1`,
  MODIFY `AuraSpellLogic` int(10) unsigned NOT NULL DEFAULT '0' AFTER `Time2`,
  MODIFY `AuraSpellID1` int(10) unsigned NOT NULL DEFAULT '0' AFTER `AuraSpellLogic`,
  MODIFY `AuraSpellID2` int(10) unsigned NOT NULL DEFAULT '0' AFTER `AuraSpellID1`,
  MODIFY `AuraSpellID3` int(10) unsigned NOT NULL DEFAULT '0' AFTER `AuraSpellID2`,
  MODIFY `AuraSpellID4` int(10) unsigned NOT NULL DEFAULT '0' AFTER `AuraSpellID3`,
  MODIFY `AchievementLogic` int(10) unsigned NOT NULL DEFAULT '0' AFTER `AuraSpellID4`,
  MODIFY `AreaLogic` int(10) unsigned NOT NULL DEFAULT '0' AFTER `AchievementLogic`,
  MODIFY `QuestKillLogic` int(10) unsigned NOT NULL DEFAULT '0' AFTER `AreaLogic`,
  MODIFY `FailureDescription` text NULL AFTER `QuestKillLogic`,
  MODIFY `MinLevel` smallint(5) unsigned NOT NULL DEFAULT '0' AFTER `FailureDescription`,
  MODIFY `MaxLevel` smallint(5) unsigned NOT NULL DEFAULT '0' AFTER `MinLevel`,
  MODIFY `SkillID1` smallint(5) unsigned NOT NULL DEFAULT '0' AFTER `MaxLevel`,
  MODIFY `SkillID2` smallint(5) unsigned NOT NULL DEFAULT '0' AFTER `SkillID1`,
  MODIFY `SkillID3` smallint(5) unsigned NOT NULL DEFAULT '0' AFTER `SkillID2`,
  MODIFY `SkillID4` smallint(5) unsigned NOT NULL DEFAULT '0' AFTER `SkillID3`,
  MODIFY `MinSkill1` smallint(6) NOT NULL DEFAULT '0' AFTER `SkillID4`,
  MODIFY `MinSkill2` smallint(6) NOT NULL DEFAULT '0' AFTER `MinSkill1`,
  MODIFY `MinSkill3` smallint(6) NOT NULL DEFAULT '0' AFTER `MinSkill2`,
  MODIFY `MinSkill4` smallint(6) NOT NULL DEFAULT '0' AFTER `MinSkill3`,
  MODIFY `MaxSkill1` smallint(6) NOT NULL DEFAULT '0' AFTER `MinSkill4`,
  MODIFY `MaxSkill2` smallint(6) NOT NULL DEFAULT '0' AFTER `MaxSkill1`,
  MODIFY `MaxSkill3` smallint(6) NOT NULL DEFAULT '0' AFTER `MaxSkill2`,
  MODIFY `MaxSkill4` smallint(6) NOT NULL DEFAULT '0' AFTER `MaxSkill3`,
  MODIFY `MaxFactionID` smallint(5) unsigned NOT NULL DEFAULT '0' AFTER `MaxSkill4`,
  MODIFY `PrevQuestID1` smallint(5) unsigned NOT NULL DEFAULT '0' AFTER `MaxFactionID`,
  MODIFY `PrevQuestID2` smallint(5) unsigned NOT NULL DEFAULT '0' AFTER `PrevQuestID1`,
  MODIFY `PrevQuestID3` smallint(5) unsigned NOT NULL DEFAULT '0' AFTER `PrevQuestID2`,
  MODIFY `PrevQuestID4` smallint(5) unsigned NOT NULL DEFAULT '0' AFTER `PrevQuestID3`,
  MODIFY `CurrQuestID1` smallint(5) unsigned NOT NULL DEFAULT '0' AFTER `PrevQuestID4`,
  MODIFY `CurrQuestID2` smallint(5) unsigned NOT NULL DEFAULT '0' AFTER `CurrQuestID1`,
  MODIFY `CurrQuestID3` smallint(5) unsigned NOT NULL DEFAULT '0' AFTER `CurrQuestID2`,
  MODIFY `CurrQuestID4` smallint(5) unsigned NOT NULL DEFAULT '0' AFTER `CurrQuestID3`,
  MODIFY `CurrentCompletedQuestID1` smallint(5) unsigned NOT NULL DEFAULT '0' AFTER `CurrQuestID4`,
  MODIFY `CurrentCompletedQuestID2` smallint(5) unsigned NOT NULL DEFAULT '0' AFTER `CurrentCompletedQuestID1`,
  MODIFY `CurrentCompletedQuestID3` smallint(5) unsigned NOT NULL DEFAULT '0' AFTER `CurrentCompletedQuestID2`,
  MODIFY `CurrentCompletedQuestID4` smallint(5) unsigned NOT NULL DEFAULT '0' AFTER `CurrentCompletedQuestID3`,
  MODIFY `Explored1` smallint(5) unsigned NOT NULL DEFAULT '0' AFTER `CurrentCompletedQuestID4`,
  MODIFY `Explored2` smallint(5) unsigned NOT NULL DEFAULT '0' AFTER `Explored1`,
  MODIFY `WorldStateExpressionID` smallint(5) unsigned NOT NULL DEFAULT '0' AFTER `Explored2`,
  MODIFY `Achievement1` smallint(5) unsigned NOT NULL DEFAULT '0' AFTER `WorldStateExpressionID`,
  MODIFY `Achievement2` smallint(5) unsigned NOT NULL DEFAULT '0' AFTER `Achievement1`,
  MODIFY `Achievement3` smallint(5) unsigned NOT NULL DEFAULT '0' AFTER `Achievement2`,
  MODIFY `Achievement4` smallint(5) unsigned NOT NULL DEFAULT '0' AFTER `Achievement3`,
  MODIFY `AreaID1` smallint(5) unsigned NOT NULL DEFAULT '0' AFTER `Achievement4`,
  MODIFY `AreaID2` smallint(5) unsigned NOT NULL DEFAULT '0' AFTER `AreaID1`,
  MODIFY `AreaID3` smallint(5) unsigned NOT NULL DEFAULT '0' AFTER `AreaID2`,
  MODIFY `AreaID4` smallint(5) unsigned NOT NULL DEFAULT '0' AFTER `AreaID3`,
  MODIFY `QuestKillID` smallint(5) unsigned NOT NULL DEFAULT '0' AFTER `AreaID4`,
  MODIFY `PhaseID` smallint(5) unsigned NOT NULL DEFAULT '0' AFTER `QuestKillID`,
  MODIFY `MinAvgEquippedItemLevel` smallint(5) unsigned NOT NULL DEFAULT '0' AFTER `PhaseID`,
  MODIFY `MaxAvgEquippedItemLevel` smallint(5) unsigned NOT NULL DEFAULT '0' AFTER `MinAvgEquippedItemLevel`,
  MODIFY `ModifierTreeID` smallint(5) unsigned NOT NULL DEFAULT '0' AFTER `MaxAvgEquippedItemLevel`,
  MODIFY `Flags` tinyint(3) unsigned NOT NULL DEFAULT '0' AFTER `ModifierTreeID`,
  MODIFY `Gender` tinyint(4) NOT NULL DEFAULT '0' AFTER `Flags`,
  MODIFY `NativeGender` tinyint(4) NOT NULL DEFAULT '0' AFTER `Gender`,
  MODIFY `MinLanguage` tinyint(3) unsigned NOT NULL DEFAULT '0' AFTER `NativeGender`,
  MODIFY `MaxLanguage` tinyint(3) unsigned NOT NULL DEFAULT '0' AFTER `MinLanguage`,
  MODIFY `MinReputation1` tinyint(3) unsigned NOT NULL DEFAULT '0' AFTER `MaxLanguage`,
  MODIFY `MinReputation2` tinyint(3) unsigned NOT NULL DEFAULT '0' AFTER `MinReputation1`,
  MODIFY `MinReputation3` tinyint(3) unsigned NOT NULL DEFAULT '0' AFTER `MinReputation2`,
  MODIFY `MaxReputation` tinyint(3) unsigned NOT NULL DEFAULT '0' AFTER `MinReputation3`,
  MODIFY `Unknown1` tinyint(3) unsigned NOT NULL DEFAULT '0' AFTER `MaxReputation`,
  MODIFY `MinPVPRank` tinyint(3) unsigned NOT NULL DEFAULT '0' AFTER `Unknown1`,
  MODIFY `MaxPVPRank` tinyint(3) unsigned NOT NULL DEFAULT '0' AFTER `MinPVPRank`,
  MODIFY `PvpMedal` tinyint(3) unsigned NOT NULL DEFAULT '0' AFTER `MaxPVPRank`,
  MODIFY `ItemFlags` tinyint(3) unsigned NOT NULL DEFAULT '0' AFTER `PvpMedal`,
  MODIFY `AuraCount1` tinyint(3) unsigned NOT NULL DEFAULT '0' AFTER `ItemFlags`,
  MODIFY `AuraCount2` tinyint(3) unsigned NOT NULL DEFAULT '0' AFTER `AuraCount1`,
  MODIFY `AuraCount3` tinyint(3) unsigned NOT NULL DEFAULT '0' AFTER `AuraCount2`,
  MODIFY `AuraCount4` tinyint(3) unsigned NOT NULL DEFAULT '0' AFTER `AuraCount3`,
  MODIFY `WeatherID` tinyint(3) unsigned NOT NULL DEFAULT '0' AFTER `AuraCount4`,
  MODIFY `PartyStatus` tinyint(3) unsigned NOT NULL DEFAULT '0' AFTER `WeatherID`,
  MODIFY `LifetimeMaxPVPRank` tinyint(3) unsigned NOT NULL DEFAULT '0' AFTER `PartyStatus`,
  MODIFY `LfgStatus1` tinyint(3) unsigned NOT NULL DEFAULT '0' AFTER `LifetimeMaxPVPRank`,
  MODIFY `LfgStatus2` tinyint(3) unsigned NOT NULL DEFAULT '0' AFTER `LfgStatus1`,
  MODIFY `LfgStatus3` tinyint(3) unsigned NOT NULL DEFAULT '0' AFTER `LfgStatus2`,
  MODIFY `LfgStatus4` tinyint(3) unsigned NOT NULL DEFAULT '0' AFTER `LfgStatus3`,
  MODIFY `LfgCompare1` tinyint(3) unsigned NOT NULL DEFAULT '0' AFTER `LfgStatus4`,
  MODIFY `LfgCompare2` tinyint(3) unsigned NOT NULL DEFAULT '0' AFTER `LfgCompare1`,
  MODIFY `LfgCompare3` tinyint(3) unsigned NOT NULL DEFAULT '0' AFTER `LfgCompare2`,
  MODIFY `LfgCompare4` tinyint(3) unsigned NOT NULL DEFAULT '0' AFTER `LfgCompare3`,
  MODIFY `CurrencyCount1` tinyint(3) unsigned NOT NULL DEFAULT '0' AFTER `LfgCompare4`,
  MODIFY `CurrencyCount2` tinyint(3) unsigned NOT NULL DEFAULT '0' AFTER `CurrencyCount1`,
  MODIFY `CurrencyCount3` tinyint(3) unsigned NOT NULL DEFAULT '0' AFTER `CurrencyCount2`,
  MODIFY `CurrencyCount4` tinyint(3) unsigned NOT NULL DEFAULT '0' AFTER `CurrencyCount3`,
  MODIFY `MinExpansionLevel` tinyint(4) NOT NULL DEFAULT '0' AFTER `CurrencyCount4`,
  MODIFY `MaxExpansionLevel` tinyint(4) NOT NULL DEFAULT '0' AFTER `MinExpansionLevel`,
  MODIFY `MinExpansionTier` tinyint(4) NOT NULL DEFAULT '0' AFTER `MaxExpansionLevel`,
  MODIFY `MaxExpansionTier` tinyint(4) NOT NULL DEFAULT '0' AFTER `MinExpansionTier`,
  MODIFY `MinGuildLevel` tinyint(3) unsigned NOT NULL DEFAULT '0' AFTER `MaxExpansionTier`,
  MODIFY `MaxGuildLevel` tinyint(3) unsigned NOT NULL DEFAULT '0' AFTER `MinGuildLevel`,
  MODIFY `PhaseUseFlags` tinyint(3) unsigned NOT NULL DEFAULT '0' AFTER `MaxGuildLevel`,
  MODIFY `ChrSpecializationIndex` tinyint(4) NOT NULL DEFAULT '0' AFTER `PhaseUseFlags`,
  MODIFY `ChrSpecializationRole` tinyint(4) NOT NULL DEFAULT '0' AFTER `ChrSpecializationIndex`,
  MODIFY `PowerType` tinyint(4) NOT NULL DEFAULT '0' AFTER `ChrSpecializationRole`,
  MODIFY `PowerTypeComp` tinyint(4) NOT NULL DEFAULT '0' AFTER `PowerType`,
  MODIFY `PowerTypeValue` tinyint(4) NOT NULL DEFAULT '0' AFTER `PowerTypeComp`,
  MODIFY `ClassMask` int(10) unsigned NOT NULL DEFAULT '0' AFTER `PowerTypeValue`,
  MODIFY `LanguageID` int(10) unsigned NOT NULL DEFAULT '0' AFTER `ClassMask`,
  MODIFY `MinFactionID1` int(10) unsigned NOT NULL DEFAULT '0' AFTER `LanguageID`,
  MODIFY `MinFactionID2` int(10) unsigned NOT NULL DEFAULT '0' AFTER `MinFactionID1`,
  MODIFY `MinFactionID3` int(10) unsigned NOT NULL DEFAULT '0' AFTER `MinFactionID2`,
  MODIFY `ItemCount1` int(10) unsigned NOT NULL DEFAULT '0' AFTER `ItemID4`,
  MODIFY `ItemCount2` int(10) unsigned NOT NULL DEFAULT '0' AFTER `ItemCount1`,
  MODIFY `ItemCount3` int(10) unsigned NOT NULL DEFAULT '0' AFTER `ItemCount2`,
  MODIFY `ItemCount4` int(10) unsigned NOT NULL DEFAULT '0' AFTER `ItemCount3`,
  MODIFY `LfgLogic` int(10) unsigned NOT NULL DEFAULT '0' AFTER `ItemCount4`,
  MODIFY `LfgValue1` int(10) unsigned NOT NULL DEFAULT '0' AFTER `LfgLogic`,
  MODIFY `LfgValue2` int(10) unsigned NOT NULL DEFAULT '0' AFTER `LfgValue1`,
  MODIFY `LfgValue3` int(10) unsigned NOT NULL DEFAULT '0' AFTER `LfgValue2`,
  MODIFY `LfgValue4` int(10) unsigned NOT NULL DEFAULT '0' AFTER `LfgValue3`,
  MODIFY `CurrencyLogic` int(10) unsigned NOT NULL DEFAULT '0' AFTER `LfgValue4`,
  MODIFY `CurrencyID1` int(10) unsigned NOT NULL DEFAULT '0' AFTER `CurrencyLogic`,
  MODIFY `CurrencyID2` int(10) unsigned NOT NULL DEFAULT '0' AFTER `CurrencyID1`,
  MODIFY `CurrencyID3` int(10) unsigned NOT NULL DEFAULT '0' AFTER `CurrencyID2`,
  MODIFY `CurrencyID4` int(10) unsigned NOT NULL DEFAULT '0' AFTER `CurrencyID3`,
  MODIFY `PhaseGroupID` int(10) unsigned NOT NULL DEFAULT '0' AFTER `QuestKillMonster6`,
  MODIFY `MinAvgItemLevel` int(10) unsigned NOT NULL DEFAULT '0' AFTER `PhaseGroupID`,
  MODIFY `MaxAvgItemLevel` int(10) unsigned NOT NULL DEFAULT '0' AFTER `MinAvgItemLevel`,
  MODIFY `Unknown700_1` int(10) unsigned NOT NULL DEFAULT '0' AFTER `MaxAvgItemLevel`,
  MODIFY `Unknown700_2` int(10) unsigned NOT NULL DEFAULT '0' AFTER `Unknown700_1`;

ALTER TABLE `scaling_stat_distribution`
  MODIFY `MinLevel` int(10) unsigned NOT NULL DEFAULT '0' AFTER `ItemLevelCurveID`,
  MODIFY `MaxLevel` int(10) unsigned NOT NULL DEFAULT '0' AFTER `MinLevel`;

ALTER TABLE `skill_line` MODIFY `ParentSkillLineID` int(10) unsigned NOT NULL DEFAULT '0' AFTER `CanLink`;

ALTER TABLE `skill_line_ability`
  MODIFY `SupercedesSpell` int(10) unsigned NOT NULL DEFAULT '0' AFTER `RaceMask`,
  ADD `Unknown703` int(10) unsigned NOT NULL DEFAULT '0' AFTER `SupercedesSpell`,
  MODIFY `SkillLine` smallint(5) unsigned NOT NULL DEFAULT '0' AFTER `Unknown703`,
  MODIFY `MinSkillLineRank` smallint(5) unsigned NOT NULL DEFAULT '0' AFTER `SkillLine`,
  MODIFY `TrivialSkillLineRankHigh` smallint(5) unsigned NOT NULL DEFAULT '0' AFTER `MinSkillLineRank`,
  MODIFY `TrivialSkillLineRankLow` smallint(5) unsigned NOT NULL DEFAULT '0' AFTER `TrivialSkillLineRankHigh`,
  MODIFY `UniqueBit` smallint(5) unsigned NOT NULL DEFAULT '0' AFTER `TrivialSkillLineRankLow`,
  MODIFY `TradeSkillCategoryID` smallint(5) unsigned NOT NULL DEFAULT '0' AFTER `UniqueBit`,
  MODIFY `AquireMethod` tinyint(3) unsigned NOT NULL DEFAULT '0' AFTER `TradeSkillCategoryID`,
  MODIFY `NumSkillUps` tinyint(3) unsigned NOT NULL DEFAULT '0' AFTER `AquireMethod`;

ALTER TABLE `skill_race_class_info`
  MODIFY `SkillID` smallint(5) unsigned NOT NULL DEFAULT '0' AFTER `RaceMask`,
  MODIFY `Flags` smallint(5) unsigned NOT NULL DEFAULT '0' AFTER `SkillID`,
  MODIFY `SkillTierID` smallint(5) unsigned NOT NULL DEFAULT '0' AFTER `Flags`,
  MODIFY `Availability` tinyint(3) unsigned NOT NULL DEFAULT '0' AFTER `SkillTierID`,
  MODIFY `MinLevel` tinyint(3) unsigned NOT NULL DEFAULT '0' AFTER `Availability`;

ALTER TABLE `sound_kit`
  MODIFY `Name` text NULL FIRST,
  MODIFY `VolumeFloat` float NOT NULL DEFAULT '0' AFTER `Name`,
  MODIFY `MinDistance` float NOT NULL DEFAULT '0' AFTER `VolumeFloat`,
  MODIFY `DistanceCutoff` float NOT NULL DEFAULT '0' AFTER `MinDistance`,
  MODIFY `VolumeVariationPlus` float NOT NULL DEFAULT '0' AFTER `DistanceCutoff`,
  MODIFY `VolumeVariationMinus` float NOT NULL DEFAULT '0' AFTER `VolumeVariationPlus`,
  MODIFY `PitchVariationPlus` float NOT NULL DEFAULT '0' AFTER `VolumeVariationMinus`,
  MODIFY `PitchVariationMinus` float NOT NULL DEFAULT '0' AFTER `PitchVariationPlus`,
  MODIFY `PitchAdjust` float NOT NULL DEFAULT '0' AFTER `PitchVariationMinus`,
  MODIFY `Flags` smallint(5) unsigned NOT NULL DEFAULT '0' AFTER `PitchAdjust`,
  MODIFY `SoundEntriesAdvancedID` smallint(5) unsigned NOT NULL DEFAULT '0' AFTER `Flags`,
  MODIFY `BusOverwriteID` smallint(5) unsigned NOT NULL DEFAULT '0' AFTER `SoundEntriesAdvancedID`,
  MODIFY `SoundType` tinyint(3) unsigned NOT NULL DEFAULT '0' AFTER `BusOverwriteID`,
  MODIFY `EAXDef` tinyint(3) unsigned NOT NULL DEFAULT '0' AFTER `SoundType`,
  MODIFY `DialogType` tinyint(3) unsigned NOT NULL DEFAULT '0' AFTER `EAXDef`,
  MODIFY `Unk700` tinyint(3) unsigned NOT NULL DEFAULT '0' AFTER `DialogType`;

ALTER TABLE `specialization_spells`
  MODIFY `SpellID` int(10) unsigned NOT NULL DEFAULT '0' FIRST,
  MODIFY `OverridesSpellID` int(10) unsigned NOT NULL DEFAULT '0' AFTER `SpellID`,
  MODIFY `Description` text NULL AFTER `OverridesSpellID`,
  MODIFY `SpecID` smallint(5) unsigned NOT NULL DEFAULT '0' AFTER `Description`,
  MODIFY `OrderIndex` tinyint(3) unsigned NOT NULL DEFAULT '0' AFTER `SpecID`;

ALTER TABLE `spell`
  MODIFY `Name` text NULL FIRST,
  MODIFY `NameSubtext` text NULL AFTER `Name`,
  MODIFY `Description` text NULL AFTER `NameSubtext`,
  MODIFY `AuraDescription` text NULL AFTER `Description`,
  MODIFY `MiscID` int(10) unsigned NOT NULL DEFAULT '0' AFTER `AuraDescription`,
  MODIFY `DescriptionVariablesID` int(10) unsigned NOT NULL DEFAULT '0' AFTER `ID`;

ALTER TABLE `spell_category`
  MODIFY `Flags` tinyint(3) unsigned NOT NULL DEFAULT '0' AFTER `ChargeRecoveryTime`,
  MODIFY `UsesPerWeek` tinyint(3) unsigned NOT NULL DEFAULT '0' AFTER `Flags`,
  MODIFY `MaxCharges` tinyint(3) unsigned NOT NULL DEFAULT '0' AFTER `UsesPerWeek`;

ALTER TABLE `spell_class_options`
  MODIFY `SpellClassSet` tinyint(3) unsigned NOT NULL DEFAULT '0' AFTER `SpellClassMask4`,
  MODIFY `ModalNextSpell` int(10) unsigned NOT NULL DEFAULT '0' AFTER `SpellClassSet`;

ALTER TABLE `spell_effect`
  MODIFY `EffectAmplitude` float NOT NULL DEFAULT '0' FIRST,
  MODIFY `EffectBonusCoefficient` float NOT NULL DEFAULT '0' AFTER `EffectAmplitude`,
  MODIFY `EffectChainAmplitude` float NOT NULL DEFAULT '0' AFTER `EffectBonusCoefficient`,
  MODIFY `EffectPointsPerResource` float NOT NULL DEFAULT '0' AFTER `EffectChainAmplitude`,
  MODIFY `EffectRealPointsPerLevel` float NOT NULL DEFAULT '0' AFTER `EffectPointsPerResource`,
  MODIFY `EffectSpellClassMask1` int(10) unsigned NOT NULL DEFAULT '0' AFTER `EffectRealPointsPerLevel`,
  MODIFY `EffectSpellClassMask2` int(10) unsigned NOT NULL DEFAULT '0' AFTER `EffectSpellClassMask1`,
  MODIFY `EffectSpellClassMask3` int(10) unsigned NOT NULL DEFAULT '0' AFTER `EffectSpellClassMask2`,
  MODIFY `EffectSpellClassMask4` int(10) unsigned NOT NULL DEFAULT '0' AFTER `EffectSpellClassMask3`,
  MODIFY `EffectPosFacing` float NOT NULL DEFAULT '0' AFTER `EffectSpellClassMask4`,
  MODIFY `BonusCoefficientFromAP` float NOT NULL DEFAULT '0' AFTER `EffectPosFacing`,
  MODIFY `DifficultyID` int(10) unsigned NOT NULL DEFAULT '0' AFTER `ID`,
  MODIFY `Effect` int(10) unsigned NOT NULL DEFAULT '0' AFTER `DifficultyID`,
  MODIFY `EffectAura` int(10) unsigned NOT NULL DEFAULT '0' AFTER `Effect`,
  MODIFY `EffectChainTargets` int(10) unsigned NOT NULL DEFAULT '0' AFTER `EffectBasePoints`,
  MODIFY `EffectMechanic` int(10) unsigned NOT NULL DEFAULT '0' AFTER `EffectItemType`,
  MODIFY `EffectRadiusIndex` int(10) unsigned NOT NULL DEFAULT '0' AFTER `EffectMiscValueB`,
  MODIFY `EffectRadiusMaxIndex` int(10) unsigned NOT NULL DEFAULT '0' AFTER `EffectRadiusIndex`,
  MODIFY `ImplicitTarget1` int(10) unsigned NOT NULL DEFAULT '0' AFTER `EffectTriggerSpell`,
  MODIFY `ImplicitTarget2` int(10) unsigned NOT NULL DEFAULT '0' AFTER `ImplicitTarget1`,
  MODIFY `EffectIndex` int(10) unsigned NOT NULL DEFAULT '0' AFTER `SpellID`;

ALTER TABLE `spell_item_enchantment`
  MODIFY `TransmogCost` int(10) unsigned NOT NULL DEFAULT '0' AFTER `EffectScalingPoints3`,
  MODIFY `TextureFileDataID` int(10) unsigned NOT NULL DEFAULT '0' AFTER `TransmogCost`,
  MODIFY `EffectPointsMin1` smallint(5) unsigned NOT NULL DEFAULT '0' AFTER `TextureFileDataID`,
  MODIFY `EffectPointsMin2` smallint(5) unsigned NOT NULL DEFAULT '0' AFTER `EffectPointsMin1`,
  MODIFY `EffectPointsMin3` smallint(5) unsigned NOT NULL DEFAULT '0' AFTER `EffectPointsMin2`,
  MODIFY `ItemVisual` smallint(5) unsigned NOT NULL DEFAULT '0' AFTER `EffectPointsMin3`,
  MODIFY `Flags` smallint(5) unsigned NOT NULL DEFAULT '0' AFTER `ItemVisual`,
  MODIFY `RequiredSkillID` smallint(5) unsigned NOT NULL DEFAULT '0' AFTER `Flags`,
  MODIFY `RequiredSkillRank` smallint(5) unsigned NOT NULL DEFAULT '0' AFTER `RequiredSkillID`,
  MODIFY `ItemLevel` smallint(5) unsigned NOT NULL DEFAULT '0' AFTER `RequiredSkillRank`,
  MODIFY `Charges` tinyint(3) unsigned NOT NULL DEFAULT '0' AFTER `ItemLevel`,
  MODIFY `Effect1` tinyint(3) unsigned NOT NULL DEFAULT '0' AFTER `Charges`,
  MODIFY `Effect2` tinyint(3) unsigned NOT NULL DEFAULT '0' AFTER `Effect1`,
  MODIFY `Effect3` tinyint(3) unsigned NOT NULL DEFAULT '0' AFTER `Effect2`,
  MODIFY `ConditionID` tinyint(3) unsigned NOT NULL DEFAULT '0' AFTER `Effect3`,
  MODIFY `MinLevel` tinyint(3) unsigned NOT NULL DEFAULT '0' AFTER `ConditionID`,
  MODIFY `MaxLevel` tinyint(3) unsigned NOT NULL DEFAULT '0' AFTER `MinLevel`,
  MODIFY `ScalingClass` tinyint(4) NOT NULL DEFAULT '0' AFTER `MaxLevel`,
  MODIFY `ScalingClassRestricted` tinyint(4) NOT NULL DEFAULT '0' AFTER `ScalingClass`;

ALTER TABLE `spell_item_enchantment_condition`
  MODIFY `Operator1` tinyint(3) unsigned NOT NULL DEFAULT '0' AFTER `LTOperandType5`,
  MODIFY `Operator2` tinyint(3) unsigned NOT NULL DEFAULT '0' AFTER `Operator1`,
  MODIFY `Operator3` tinyint(3) unsigned NOT NULL DEFAULT '0' AFTER `Operator2`,
  MODIFY `Operator4` tinyint(3) unsigned NOT NULL DEFAULT '0' AFTER `Operator3`,
  MODIFY `Operator5` tinyint(3) unsigned NOT NULL DEFAULT '0' AFTER `Operator4`,
  MODIFY `RTOperandType1` tinyint(3) unsigned NOT NULL DEFAULT '0' AFTER `Operator5`,
  MODIFY `RTOperandType2` tinyint(3) unsigned NOT NULL DEFAULT '0' AFTER `RTOperandType1`,
  MODIFY `RTOperandType3` tinyint(3) unsigned NOT NULL DEFAULT '0' AFTER `RTOperandType2`,
  MODIFY `RTOperandType4` tinyint(3) unsigned NOT NULL DEFAULT '0' AFTER `RTOperandType3`,
  MODIFY `RTOperandType5` tinyint(3) unsigned NOT NULL DEFAULT '0' AFTER `RTOperandType4`,
  MODIFY `RTOperand1` tinyint(3) unsigned NOT NULL DEFAULT '0' AFTER `RTOperandType5`,
  MODIFY `RTOperand2` tinyint(3) unsigned NOT NULL DEFAULT '0' AFTER `RTOperand1`,
  MODIFY `RTOperand3` tinyint(3) unsigned NOT NULL DEFAULT '0' AFTER `RTOperand2`,
  MODIFY `RTOperand4` tinyint(3) unsigned NOT NULL DEFAULT '0' AFTER `RTOperand3`,
  MODIFY `RTOperand5` tinyint(3) unsigned NOT NULL DEFAULT '0' AFTER `RTOperand4`,
  MODIFY `Logic1` tinyint(3) unsigned NOT NULL DEFAULT '0' AFTER `RTOperand5`,
  MODIFY `Logic2` tinyint(3) unsigned NOT NULL DEFAULT '0' AFTER `Logic1`,
  MODIFY `Logic3` tinyint(3) unsigned NOT NULL DEFAULT '0' AFTER `Logic2`,
  MODIFY `Logic4` tinyint(3) unsigned NOT NULL DEFAULT '0' AFTER `Logic3`,
  MODIFY `Logic5` tinyint(3) unsigned NOT NULL DEFAULT '0' AFTER `Logic4`,
  MODIFY `LTOperand1` int(10) unsigned NOT NULL DEFAULT '0' AFTER `Logic5`,
  MODIFY `LTOperand2` int(10) unsigned NOT NULL DEFAULT '0' AFTER `LTOperand1`,
  MODIFY `LTOperand3` int(10) unsigned NOT NULL DEFAULT '0' AFTER `LTOperand2`,
  MODIFY `LTOperand4` int(10) unsigned NOT NULL DEFAULT '0' AFTER `LTOperand3`,
  MODIFY `LTOperand5` int(10) unsigned NOT NULL DEFAULT '0' AFTER `LTOperand4`;

ALTER TABLE `spell_power`
  MODIFY `SpellID` int(10) unsigned NOT NULL DEFAULT '0' FIRST,
  MODIFY `ManaCost` int(10) unsigned NOT NULL DEFAULT '0' AFTER `SpellID`,
  MODIFY `ManaCostPercentage` float NOT NULL DEFAULT '0' AFTER `ManaCost`,
  MODIFY `ManaCostPercentagePerSecond` float NOT NULL DEFAULT '0' AFTER `ManaCostPercentage`,
  MODIFY `RequiredAura` int(10) unsigned NOT NULL DEFAULT '0' AFTER `ManaCostPercentagePerSecond`,
  MODIFY `HealthCostPercentage` float NOT NULL DEFAULT '0' AFTER `RequiredAura`,
  MODIFY `PowerIndex` tinyint(3) unsigned NOT NULL DEFAULT '0' AFTER `HealthCostPercentage`,
  MODIFY `PowerType` tinyint(3) unsigned NOT NULL DEFAULT '0' AFTER `PowerIndex`,
  MODIFY `ManaCostPerLevel` int(10) unsigned NOT NULL DEFAULT '0' AFTER `ID`,
  MODIFY `ManaCostPerSecond` int(10) unsigned NOT NULL DEFAULT '0' AFTER `ManaCostPerLevel`,
  MODIFY `ManaCostAdditional` int(10) unsigned NOT NULL DEFAULT '0' AFTER `ManaCostPerSecond`,
  MODIFY `PowerDisplayID` int(10) unsigned NOT NULL DEFAULT '0' AFTER `ManaCostAdditional`,
  MODIFY `UnitPowerBarID` int(10) unsigned NOT NULL DEFAULT '0' AFTER `PowerDisplayID`;

ALTER TABLE `spell_power_difficulty` CHANGE `SpellPowerID` `ID` int(10) unsigned NOT NULL DEFAULT '0' AFTER `PowerIndex`;

ALTER TABLE `spell_scaling`
  MODIFY `MinScalingLevel` tinyint(3) unsigned NOT NULL DEFAULT '0' AFTER `ScalesFromItemLevel`,
  MODIFY `MaxScalingLevel` tinyint(3) unsigned NOT NULL DEFAULT '0' AFTER `MinScalingLevel`,
  MODIFY `ScalingClass` int(11) NOT NULL DEFAULT '0' AFTER `MaxScalingLevel`;

ALTER TABLE `spell_shapeshift_form` MODIFY `MountTypeID` smallint(5) unsigned NOT NULL DEFAULT '0' AFTER `PresetSpellID8`;

ALTER TABLE `spell_target_restrictions`
  MODIFY `TargetCreatureType` smallint(5) unsigned NOT NULL DEFAULT '0' AFTER `Targets`,
  MODIFY `DifficultyID` tinyint(3) unsigned NOT NULL DEFAULT '0' AFTER `TargetCreatureType`,
  MODIFY `MaxAffectedTargets` tinyint(3) unsigned NOT NULL DEFAULT '0' AFTER `DifficultyID`,
  MODIFY `MaxTargetLevel` int(10) unsigned NOT NULL DEFAULT '0' AFTER `MaxAffectedTargets`;

ALTER TABLE `spell_totems`
  MODIFY `RequiredTotemCategoryID1` smallint(5) unsigned NOT NULL DEFAULT '0' AFTER `Totem2`,
  MODIFY `RequiredTotemCategoryID2` smallint(5) unsigned NOT NULL DEFAULT '0' AFTER `RequiredTotemCategoryID1`;

ALTER TABLE `spell_x_spell_visual`
  MODIFY `SpellID` int(10) unsigned NOT NULL DEFAULT '0' FIRST,
  MODIFY `Unk620` float NOT NULL DEFAULT '0' AFTER `SpellID`,
  MODIFY `SpellVisualID1` smallint(5) unsigned NOT NULL DEFAULT '0' AFTER `Unk620`,
  MODIFY `SpellVisualID2` smallint(5) unsigned NOT NULL DEFAULT '0' AFTER `SpellVisualID1`,
  MODIFY `PlayerConditionID` smallint(5) unsigned NOT NULL DEFAULT '0' AFTER `SpellVisualID2`,
  MODIFY `DifficultyID` tinyint(3) unsigned NOT NULL DEFAULT '0' AFTER `PlayerConditionID`,
  MODIFY `Flags` tinyint(3) unsigned NOT NULL DEFAULT '0' AFTER `DifficultyID`;

ALTER TABLE `taxi_nodes`
  MODIFY `PosX` float NOT NULL DEFAULT '0' FIRST,
  MODIFY `PosY` float NOT NULL DEFAULT '0' AFTER `PosX`,
  MODIFY `PosZ` float NOT NULL DEFAULT '0' AFTER `PosY`,
  MODIFY `Name` text NULL AFTER `PosZ`,
  MODIFY `MountCreatureID1` int(10) unsigned NOT NULL DEFAULT '0' AFTER `Name`,
  MODIFY `MountCreatureID2` int(10) unsigned NOT NULL DEFAULT '0' AFTER `MountCreatureID1`,
  MODIFY `MapOffsetX` float NOT NULL DEFAULT '0' AFTER `MountCreatureID2`,
  MODIFY `MapOffsetY` float NOT NULL DEFAULT '0' AFTER `MapOffsetX`,
  MODIFY `MapID` smallint(5) unsigned NOT NULL DEFAULT '0' AFTER `MapOffsetY`,
  MODIFY `ConditionID` smallint(5) unsigned NOT NULL DEFAULT '0' AFTER `MapID`,
  MODIFY `LearnableIndex` smallint(5) unsigned NOT NULL DEFAULT '0' AFTER `ConditionID`,
  MODIFY `Flags` tinyint(3) unsigned NOT NULL DEFAULT '0' AFTER `LearnableIndex`;

ALTER TABLE `taxi_path`
  MODIFY `From` smallint(5) unsigned NOT NULL DEFAULT '0' FIRST,
  MODIFY `To` smallint(5) unsigned NOT NULL DEFAULT '0' AFTER `From`,
  MODIFY `Cost` int(10) unsigned NOT NULL DEFAULT '0' AFTER `ID`;

ALTER TABLE `taxi_path_node`
  MODIFY `LocX` float NOT NULL DEFAULT '0' FIRST,
  MODIFY `LocY` float NOT NULL DEFAULT '0' AFTER `LocX`,
  MODIFY `LocZ` float NOT NULL DEFAULT '0' AFTER `LocY`,
  MODIFY `Delay` int(10) unsigned NOT NULL DEFAULT '0' AFTER `LocZ`,
  MODIFY `PathID` smallint(5) unsigned NOT NULL DEFAULT '0' AFTER `Delay`,
  MODIFY `MapID` smallint(5) unsigned NOT NULL DEFAULT '0' AFTER `PathID`,
  MODIFY `ArrivalEventID` smallint(5) unsigned NOT NULL DEFAULT '0' AFTER `MapID`,
  MODIFY `DepartureEventID` smallint(5) unsigned NOT NULL DEFAULT '0' AFTER `ArrivalEventID`,
  MODIFY `NodeIndex` tinyint(3) unsigned NOT NULL DEFAULT '0' AFTER `DepartureEventID`,
  MODIFY `Flags` tinyint(3) unsigned NOT NULL DEFAULT '0' AFTER `NodeIndex`;

ALTER TABLE `toy`
  MODIFY `ItemID` int(10) unsigned NOT NULL DEFAULT '0' FIRST,
  MODIFY `Description` text NULL AFTER `ItemID`,
  MODIFY `Flags` tinyint(3) unsigned NOT NULL DEFAULT '0' AFTER `Description`,
  MODIFY `CategoryFilter` tinyint(3) unsigned NOT NULL DEFAULT '0' AFTER `Flags`;

ALTER TABLE `unit_power_bar`
  MODIFY `RegenerationPeace` float NOT NULL DEFAULT '0' AFTER `ID`,
  MODIFY `RegenerationCombat` float NOT NULL DEFAULT '0' AFTER `RegenerationPeace`,
  MODIFY `FileDataID1` int(10) unsigned NOT NULL DEFAULT '0' AFTER `RegenerationCombat`,
  MODIFY `FileDataID2` int(10) unsigned NOT NULL DEFAULT '0' AFTER `FileDataID1`,
  MODIFY `FileDataID3` int(10) unsigned NOT NULL DEFAULT '0' AFTER `FileDataID2`,
  MODIFY `FileDataID4` int(10) unsigned NOT NULL DEFAULT '0' AFTER `FileDataID3`,
  MODIFY `FileDataID5` int(10) unsigned NOT NULL DEFAULT '0' AFTER `FileDataID4`,
  MODIFY `FileDataID6` int(10) unsigned NOT NULL DEFAULT '0' AFTER `FileDataID5`,
  MODIFY `Color1` int(10) unsigned NOT NULL DEFAULT '0' AFTER `FileDataID6`,
  MODIFY `Color2` int(10) unsigned NOT NULL DEFAULT '0' AFTER `Color1`,
  MODIFY `Color3` int(10) unsigned NOT NULL DEFAULT '0' AFTER `Color2`,
  MODIFY `Color4` int(10) unsigned NOT NULL DEFAULT '0' AFTER `Color3`,
  MODIFY `Color5` int(10) unsigned NOT NULL DEFAULT '0' AFTER `Color4`,
  MODIFY `Color6` int(10) unsigned NOT NULL DEFAULT '0' AFTER `Color5`,
  MODIFY `Name` text NULL AFTER `Color6`,
  MODIFY `Cost` text NULL AFTER `Name`,
  MODIFY `OutOfError` text NULL AFTER `Cost`,
  MODIFY `ToolTip` text NULL AFTER `OutOfError`,
  MODIFY `StartInset` float NOT NULL DEFAULT '0' AFTER `ToolTip`,
  MODIFY `EndInset` float NOT NULL DEFAULT '0' AFTER `StartInset`,
  MODIFY `StartPower` smallint(5) unsigned NOT NULL DEFAULT '0' AFTER `EndInset`,
  MODIFY `Flags` smallint(5) unsigned NOT NULL DEFAULT '0' AFTER `StartPower`,
  MODIFY `CenterPower` tinyint(3) unsigned NOT NULL DEFAULT '0' AFTER `Flags`,
  MODIFY `BarType` tinyint(3) unsigned NOT NULL DEFAULT '0' AFTER `CenterPower`,
  MODIFY `MinPower` int(10) unsigned NOT NULL DEFAULT '0' AFTER `BarType`;

ALTER TABLE `vehicle_seat`
  MODIFY `CameraEnteringDelay` float NOT NULL DEFAULT '0' AFTER `VehicleExitAnimDelay`,
  MODIFY `CameraEnteringDuration` float NOT NULL DEFAULT '0' AFTER `CameraEnteringDelay`,
  MODIFY `CameraExitingDelay` float NOT NULL DEFAULT '0' AFTER `CameraEnteringDuration`,
  MODIFY `CameraExitingDuration` float NOT NULL DEFAULT '0' AFTER `CameraExitingDelay`,
  MODIFY `CameraOffsetX` float NOT NULL DEFAULT '0' AFTER `CameraExitingDuration`,
  MODIFY `CameraOffsetY` float NOT NULL DEFAULT '0' AFTER `CameraOffsetX`,
  MODIFY `CameraOffsetZ` float NOT NULL DEFAULT '0' AFTER `CameraOffsetY`,
  MODIFY `CameraPosChaseRate` float NOT NULL DEFAULT '0' AFTER `CameraOffsetZ`,
  MODIFY `CameraFacingChaseRate` float NOT NULL DEFAULT '0' AFTER `CameraPosChaseRate`,
  MODIFY `CameraEnteringZoom` float NOT NULL DEFAULT '0' AFTER `CameraFacingChaseRate`,
  MODIFY `CameraSeatZoomMin` float NOT NULL DEFAULT '0' AFTER `CameraEnteringZoom`,
  MODIFY `CameraSeatZoomMax` float NOT NULL DEFAULT '0' AFTER `CameraSeatZoomMin`,
  MODIFY `UISkinFileDataID` int(10) unsigned NOT NULL DEFAULT '0' AFTER `CameraSeatZoomMax`,
  MODIFY `EnterAnimStart` smallint(6) NOT NULL DEFAULT '0' AFTER `UISkinFileDataID`,
  MODIFY `EnterAnimLoop` smallint(6) NOT NULL DEFAULT '0' AFTER `EnterAnimStart`,
  MODIFY `RideAnimStart` smallint(6) NOT NULL DEFAULT '0' AFTER `EnterAnimLoop`,
  MODIFY `RideAnimLoop` smallint(6) NOT NULL DEFAULT '0' AFTER `RideAnimStart`,
  MODIFY `RideUpperAnimStart` smallint(6) NOT NULL DEFAULT '0' AFTER `RideAnimLoop`,
  MODIFY `RideUpperAnimLoop` smallint(6) NOT NULL DEFAULT '0' AFTER `RideUpperAnimStart`,
  MODIFY `ExitAnimStart` smallint(6) NOT NULL DEFAULT '0' AFTER `RideUpperAnimLoop`,
  MODIFY `ExitAnimLoop` smallint(6) NOT NULL DEFAULT '0' AFTER `ExitAnimStart`,
  MODIFY `ExitAnimEnd` smallint(6) NOT NULL DEFAULT '0' AFTER `ExitAnimLoop`,
  MODIFY `VehicleEnterAnim` smallint(6) NOT NULL DEFAULT '0' AFTER `ExitAnimEnd`,
  MODIFY `VehicleExitAnim` smallint(6) NOT NULL DEFAULT '0' AFTER `VehicleEnterAnim`,
  MODIFY `VehicleRideAnimLoop` smallint(6) NOT NULL DEFAULT '0' AFTER `VehicleExitAnim`,
  MODIFY `EnterAnimKitID` smallint(5) unsigned NOT NULL DEFAULT '0' AFTER `VehicleRideAnimLoop`,
  MODIFY `RideAnimKitID` smallint(5) unsigned NOT NULL DEFAULT '0' AFTER `EnterAnimKitID`,
  MODIFY `ExitAnimKitID` smallint(5) unsigned NOT NULL DEFAULT '0' AFTER `RideAnimKitID`,
  MODIFY `VehicleEnterAnimKitID` smallint(5) unsigned NOT NULL DEFAULT '0' AFTER `ExitAnimKitID`,
  MODIFY `VehicleRideAnimKitID` smallint(5) unsigned NOT NULL DEFAULT '0' AFTER `VehicleEnterAnimKitID`,
  MODIFY `VehicleExitAnimKitID` smallint(5) unsigned NOT NULL DEFAULT '0' AFTER `VehicleRideAnimKitID`,
  MODIFY `CameraModeID` smallint(5) unsigned NOT NULL DEFAULT '0' AFTER `VehicleExitAnimKitID`,
  MODIFY `AttachmentID` tinyint(4) NOT NULL DEFAULT '0' AFTER `CameraModeID`,
  MODIFY `PassengerAttachmentID` tinyint(4) NOT NULL DEFAULT '0' AFTER `AttachmentID`,
  MODIFY `VehicleEnterAnimBone` tinyint(4) NOT NULL DEFAULT '0' AFTER `PassengerAttachmentID`,
  MODIFY `VehicleExitAnimBone` tinyint(4) NOT NULL DEFAULT '0' AFTER `VehicleEnterAnimBone`,
  MODIFY `VehicleRideAnimLoopBone` tinyint(4) NOT NULL DEFAULT '0' AFTER `VehicleExitAnimBone`,
  MODIFY `VehicleAbilityDisplay` tinyint(3) unsigned NOT NULL DEFAULT '0' AFTER `VehicleRideAnimLoopBone`;

ALTER TABLE `wmo_area_table`
  MODIFY `WMOGroupID` int(11) NOT NULL DEFAULT '0' FIRST,
  MODIFY `AreaName` text NULL AFTER `WMOGroupID`,
  MODIFY `WMOID` smallint(6) NOT NULL DEFAULT '0' AFTER `AreaName`,
  MODIFY `AmbienceID` smallint(5) unsigned NOT NULL DEFAULT '0' AFTER `WMOID`,
  MODIFY `ZoneMusic` smallint(5) unsigned NOT NULL DEFAULT '0' AFTER `AmbienceID`,
  MODIFY `IntroSound` smallint(5) unsigned NOT NULL DEFAULT '0' AFTER `ZoneMusic`,
  MODIFY `AreaTableID` smallint(5) unsigned NOT NULL DEFAULT '0' AFTER `IntroSound`,
  MODIFY `UWIntroSound` smallint(5) unsigned NOT NULL DEFAULT '0' AFTER `AreaTableID`,
  MODIFY `UWAmbience` smallint(5) unsigned NOT NULL DEFAULT '0' AFTER `UWIntroSound`,
  MODIFY `NameSet` tinyint(4) NOT NULL DEFAULT '0' AFTER `UWAmbience`,
  MODIFY `SoundProviderPref` tinyint(3) unsigned NOT NULL DEFAULT '0' AFTER `NameSet`,
  MODIFY `SoundProviderPrefUnderwater` tinyint(3) unsigned NOT NULL DEFAULT '0' AFTER `SoundProviderPref`,
  MODIFY `Flags` tinyint(3) unsigned NOT NULL DEFAULT '0' AFTER `SoundProviderPrefUnderwater`,
  MODIFY `UWZoneMusic` int(10) unsigned NOT NULL DEFAULT '0' AFTER `ID`;

ALTER TABLE `world_map_area`
  MODIFY `AreaName` text NULL FIRST,
  MODIFY `LocLeft` float NOT NULL DEFAULT '0' AFTER `AreaName`,
  MODIFY `LocRight` float NOT NULL DEFAULT '0' AFTER `LocLeft`,
  MODIFY `LocTop` float NOT NULL DEFAULT '0' AFTER `LocRight`,
  MODIFY `LocBottom` float NOT NULL DEFAULT '0' AFTER `LocTop`,
  MODIFY `MapID` smallint(5) unsigned NOT NULL DEFAULT '0' AFTER `LocBottom`,
  MODIFY `AreaID` smallint(5) unsigned NOT NULL DEFAULT '0' AFTER `MapID`,
  MODIFY `DisplayMapID` smallint(6) NOT NULL DEFAULT '0' AFTER `AreaID`,
  MODIFY `DefaultDungeonFloor` smallint(6) NOT NULL DEFAULT '0' AFTER `DisplayMapID`,
  MODIFY `ParentWorldMapID` smallint(5) unsigned NOT NULL DEFAULT '0' AFTER `DefaultDungeonFloor`,
  MODIFY `Flags` smallint(5) unsigned NOT NULL DEFAULT '0' AFTER `ParentWorldMapID`,
  MODIFY `LevelRangeMin` tinyint(3) unsigned NOT NULL DEFAULT '0' AFTER `Flags`,
  MODIFY `LevelRangeMax` tinyint(3) unsigned NOT NULL DEFAULT '0' AFTER `LevelRangeMin`,
  MODIFY `BountySetID` tinyint(3) unsigned NOT NULL DEFAULT '0' AFTER `LevelRangeMax`,
  MODIFY `BountyBoardLocation` tinyint(3) unsigned NOT NULL DEFAULT '0' AFTER `BountySetID`,
  MODIFY `PlayerConditionID` int(10) unsigned NOT NULL DEFAULT '0' AFTER `ID`;

ALTER TABLE `world_map_overlay`
  MODIFY `TextureWidth` smallint(5) unsigned NOT NULL DEFAULT '0' AFTER `TextureName`,
  MODIFY `TextureHeight` smallint(5) unsigned NOT NULL DEFAULT '0' AFTER `TextureWidth`,
  MODIFY `MapAreaID` int(10) unsigned NOT NULL DEFAULT '0' AFTER `TextureHeight`,
  MODIFY `AreaID1` int(10) unsigned NOT NULL DEFAULT '0' AFTER `MapAreaID`,
  MODIFY `AreaID2` int(10) unsigned NOT NULL DEFAULT '0' AFTER `AreaID1`,
  MODIFY `AreaID3` int(10) unsigned NOT NULL DEFAULT '0' AFTER `AreaID2`,
  MODIFY `AreaID4` int(10) unsigned NOT NULL DEFAULT '0' AFTER `AreaID3`,
  MODIFY `OffsetX` int(10) unsigned NOT NULL DEFAULT '0' AFTER `AreaID4`,
  MODIFY `OffsetY` int(10) unsigned NOT NULL DEFAULT '0' AFTER `OffsetX`,
  MODIFY `HitRectTop` int(10) unsigned NOT NULL DEFAULT '0' AFTER `OffsetY`,
  MODIFY `HitRectLeft` int(10) unsigned NOT NULL DEFAULT '0' AFTER `HitRectTop`,
  MODIFY `HitRectBottom` int(10) unsigned NOT NULL DEFAULT '0' AFTER `HitRectLeft`,
  MODIFY `HitRectRight` int(10) unsigned NOT NULL DEFAULT '0' AFTER `HitRectBottom`,
  MODIFY `PlayerConditionID` int(10) unsigned NOT NULL DEFAULT '0' AFTER `HitRectRight`,
  MODIFY `Flags` int(10) unsigned NOT NULL DEFAULT '0' AFTER `PlayerConditionID`;

DROP TABLE `glyph_slot`;
ALTER TABLE `lfg_dungeons` ADD `PlayerConditionID` int(10) unsigned NOT NULL DEFAULT 0 AFTER `Description`;

ALTER TABLE `map`
  CHANGE `Flags` `Flags1` int(10) unsigned NOT NULL DEFAULT 0 AFTER `Directory`,
  CHANGE `MapType` `Flags2` int(10) unsigned NOT NULL DEFAULT 0 AFTER `Flags1`,
  ADD `WindSettingsID` smallint(5) unsigned NOT NULL DEFAULT 0 AFTER `CosmeticParentMapID`;

ALTER TABLE `player_condition`
  CHANGE `Unknown700_1` `Unknown7001` int(10) unsigned NOT NULL DEFAULT 0 AFTER `MaxAvgItemLevel`,
  CHANGE `Unknown700_2` `Unknown7002` int(10) unsigned NOT NULL DEFAULT 0 AFTER `Unknown7001`;

ALTER TABLE `world_map_transforms` ADD `AreaID` smallint(5) unsigned NOT NULL DEFAULT 0 AFTER `MapID`;
ALTER TABLE `char_sections` CHANGE `Id` `ID` int(10) unsigned NOT NULL DEFAULT 0 FIRST;

ALTER TABLE `chr_races`
  CHANGE `Unk` `Unk1` int(10) unsigned NOT NULL DEFAULT 0 AFTER `HighResFemaleDisplayID`,
  ADD `Unk2` int(10) unsigned NOT NULL DEFAULT 0 AFTER `Unk1`,
  ADD `Unk3` int(10) unsigned NOT NULL DEFAULT 0 AFTER `Unk2`;

ALTER TABLE `spell_scaling`
  CHANGE `MinScalingLevel` `MinScalingLevel` int(10) unsigned NOT NULL DEFAULT 0 AFTER `ScalingClass`,
  CHANGE `MaxScalingLevel` `MaxScalingLevel` int(10) unsigned NOT NULL DEFAULT 0 AFTER `MinScalingLevel`;
ALTER TABLE `item_random_suffix` DROP `InternalName`;
ALTER TABLE `item_random_suffix_locale` DROP `InternalName_lang`;
ALTER TABLE `char_titles` DROP `ConditionID`;
ALTER TABLE `creature_family` DROP `CategoryEnumID`;
--
-- Table structure for table `item_search_name`
--
DROP TABLE IF EXISTS `item_search_name`;
CREATE TABLE `item_search_name` (
  `ID` int(10) unsigned NOT NULL DEFAULT '0',
  `Name` text,
  `Flags1` int(10) unsigned NOT NULL DEFAULT '0',
  `Flags2` int(10) unsigned NOT NULL DEFAULT '0',
  `Flags3` int(10) unsigned NOT NULL DEFAULT '0',
  `AllowableRace` int(10) unsigned NOT NULL DEFAULT '0',
  `RequiredSpell` int(10) unsigned NOT NULL DEFAULT '0',
  `RequiredReputationFaction` smallint(5) unsigned NOT NULL DEFAULT '0',
  `RequiredSkill` smallint(5) unsigned NOT NULL DEFAULT '0',
  `RequiredSkillRank` smallint(5) unsigned NOT NULL DEFAULT '0',
  `ItemLevel` smallint(5) unsigned NOT NULL DEFAULT '0',
  `Quality` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `RequiredExpansion` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `RequiredReputationRank` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `RequiredLevel` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `AllowableClass` int(10) unsigned NOT NULL DEFAULT '0',
  `VerifiedBuild` smallint(6) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Table structure for table `item_search_name_locale`
--
DROP TABLE IF EXISTS `item_search_name_locale`;
CREATE TABLE `item_search_name_locale` (
  `ID` int(10) unsigned NOT NULL DEFAULT '0',
  `locale` varchar(4) NOT NULL,
  `Name_lang` text,
  `VerifiedBuild` smallint(6) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`locale`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

ALTER TABLE `item_upgrade`
  CHANGE `CurrencyCost` `CurrencyCost` int(10) unsigned NOT NULL DEFAULT '0' AFTER `ID`,
  CHANGE `PrevItemUpgradeID` `PrevItemUpgradeID` smallint(5) unsigned NOT NULL DEFAULT '0' AFTER `CurrencyCost`,
  CHANGE `CurrencyID` `CurrencyID` smallint(5) unsigned NOT NULL DEFAULT '0' AFTER `PrevItemUpgradeID`,
  CHANGE `ItemUpgradePathID` `ItemUpgradePathID` tinyint(3) unsigned NOT NULL DEFAULT '0' AFTER `CurrencyID`,
  CHANGE `ItemLevelBonus` `ItemLevelBonus` tinyint(3) unsigned NOT NULL DEFAULT '0' AFTER `ItemUpgradePathID`;

ALTER TABLE `ruleset_item_upgrade`
  CHANGE `ItemID` `ItemID` int(10) unsigned NOT NULL DEFAULT '0' AFTER `ID`,
  CHANGE `ItemUpgradeID` `ItemUpgradeID` smallint(5) unsigned NOT NULL DEFAULT '0' AFTER `ItemID`,
  DROP `RulesetID`;

ALTER TABLE `skill_line_ability` CHANGE `AquireMethod` `AcquireMethod` tinyint(3) unsigned NOT NULL DEFAULT '0';
--
-- Table structure for table `item_child_equipment`
--
DROP TABLE IF EXISTS `item_child_equipment`;
CREATE TABLE `item_child_equipment` (
  `ID` int(10) unsigned NOT NULL DEFAULT '0',
  `ItemID` int(10) unsigned NOT NULL DEFAULT '0',
  `AltItemID` int(10) unsigned NOT NULL DEFAULT '0',
  `AltEquipmentSlot` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `VerifiedBuild` smallint(6) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
