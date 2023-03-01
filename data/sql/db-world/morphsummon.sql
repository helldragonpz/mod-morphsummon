-- mod-morphsummon

SET @ENTRY           := 601072;
SET @MODELID         := 15665;               -- Senior Sergeant Grimsford (creature ID 15703, not used anymore)
SET @NAME            := 'Cet Keres';
SET @SUBNAME         := 'Polymorphologist';
SET @SCRIPTNAME      := 'npc_morphsummon';
SET @NPC_TEXT_HELLO  := @ENTRY;
SET @NPC_TEXT_SORRY  := @NPC_TEXT_HELLO + 1;
SET @NPC_TEXT_CHOICE := @NPC_TEXT_HELLO + 2;
SET @MENU_HELLO      := 61072;
SET @MENU_SORRY      := @MENU_HELLO + 1;
SET @MENU_CHOICE     := @MENU_HELLO + 2;

DELETE FROM `creature_template` WHERE `entry` = @ENTRY;
INSERT INTO `creature_template` ( `entry`, `difficulty_entry_1`, `difficulty_entry_2`, `difficulty_entry_3`, `KillCredit1`, `KillCredit2`, `modelid1`, `modelid2`, `modelid3`, `modelid4`, `name`, `subname`, `IconName`, `gossip_menu_id`, `minlevel`, `maxlevel`, `exp`, `faction`, `npcflag`, `speed_walk`, `speed_run`, `scale`, `rank`, `dmgschool`, `DamageModifier`, `BaseAttackTime`, `RangeAttackTime`, `unit_class`, `unit_flags`, `unit_flags2`, `dynamicflags`, `family`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `type`, `type_flags`, `lootid`, `pickpocketloot`, `skinloot`, `PetSpellDataId`, `VehicleId`, `mingold`, `maxgold`, `AIName`, `MovementType`,`HoverHeight`, `HealthModifier`, `ManaModifier`, `ArmorModifier`, `RacialLeader`, `movementId`, `RegenHealth`, `mechanic_immune_mask`, `flags_extra`, `ScriptName`, `VerifiedBuild`) VALUES
( @ENTRY, 0, 0, 0, 0, 0, @MODELID, 0, 0, 0, @NAME, @SUBNAME, NULL, 0, 80, 80, 2, 35, 0, 1, 1.14286, 1, 0, 0, 1, 2000, 2000, 8, 0, 2048, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 1, 1, 1, 1, 0, 0, 1, 0, 2, @SCRIPTNAME, 0);
UPDATE `creature_template` SET `entry`=601072, `difficulty_entry_1`=0, `difficulty_entry_2`=0, `difficulty_entry_3`=0, `KillCredit1`=0, `KillCredit2`=0, `modelid1`=15665, `modelid2`=0, `modelid3`=0, `modelid4`=0, `name`='Cet Keres', `subname`='Polymorphologist', `IconName`=NULL, `gossip_menu_id`=0, `minlevel`=80, `maxlevel`=80, `exp`=2, `faction`=35, `npcflag`=1, `speed_walk`=1, `speed_run`=1.14286, `speed_swim`=1, `speed_flight`=1, `detection_range`=20, `scale`=1, `rank`=0, `dmgschool`=0, `DamageModifier`=1, `BaseAttackTime`=2000, `RangeAttackTime`=2000, `BaseVariance`=1, `RangeVariance`=1, `unit_class`=8, `unit_flags`=0, `unit_flags2`=2048, `dynamicflags`=0, `family`=0, `trainer_type`=0, `trainer_spell`=0, `trainer_class`=0, `trainer_race`=0, `type`=7, `type_flags`=134217728, `lootid`=0, `pickpocketloot`=0, `skinloot`=0, `PetSpellDataId`=0, `VehicleId`=0, `mingold`=0, `maxgold`=0, `AIName`='', `MovementType`=0, `HoverHeight`=1, `HealthModifier`=1, `ManaModifier`=1, `ArmorModifier`=1, `ExperienceModifier`=1, `RacialLeader`=0, `movementId`=0, `RegenHealth`=1, `mechanic_immune_mask`=0, `spell_school_immune_mask`=0, `flags_extra`=2, `ScriptName`='npc_morphsummon', `VerifiedBuild`=0 WHERE `entry`=601072;

-- creatture_template_movement
DELETE FROM `creature_template_movement` WHERE `CreatureId` IN (@ENTRY);
INSERT INTO `creature_template_movement` (`CreatureId`, `Ground`, `Swim`, `Flight`, `Rooted`, `Chase`, `Random`, `InteractionPauseTimer`) VALUES
(@ENTRY, 1, 1, 0, 0, 0, 0, NULL);

DELETE FROM `npc_text` WHERE `ID` IN (@NPC_TEXT_HELLO, @NPC_TEXT_SORRY, @NPC_TEXT_CHOICE);
INSERT INTO `npc_text` (`ID`, `text0_0`) VALUES
(@NPC_TEXT_HELLO, 'Greetings, $N. If you are looking for ways to change the appearance of your summoned creature, I can help you.'),
(@NPC_TEXT_SORRY, 'Greetings, $N. I am sorry, but you don''t have a summoned creature that I can polymorph.'),
(@NPC_TEXT_CHOICE, 'Please make your choice:');

DELETE FROM `gossip_menu_option` WHERE `MenuID` IN (@MENU_HELLO, @MENU_SORRY, @MENU_CHOICE);
INSERT INTO `gossip_menu_option` (`MenuID`, `OptionID`, `OptionIcon`, `OptionText`, `OptionBroadcastTextID`, `OptionType`, `OptionNpcFlag`, `ActionMenuID`, `ActionPoiID`, `BoxCoded`, `BoxMoney`, `BoxText`, `BoxBroadcastTextID`, `VerifiedBuild`) VALUES
(@MENU_HELLO,0,0,'Choose polymorph',0,0,0,0,0,0,0,'',0,0),
(@MENU_HELLO,1,0,'Choose Felguard weapon',0,0,0,0,0,0,0,'',0,0),
(@MENU_SORRY,0,0,'Ah, nevermind.',0,0,0,0,0,0,0,'',0,0),
(@MENU_CHOICE,0,0,'Back..',0,0,0,0,0,0,0,'',0,0),
(@MENU_CHOICE,1,4,'Next..',0,0,0,0,0,0,0,'',0,0),
(@MENU_CHOICE,2,4,'Previous..',0,0,0,0,0,0,0,'',0,0);
