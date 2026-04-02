-- --------------------------------------------------------
-- Sunucu:                       127.0.0.1
-- Sunucu sürümü:                10.4.32-MariaDB - mariadb.org binary distribution
-- Sunucu İşletim Sistemi:       Win64
-- HeidiSQL Sürüm:               12.6.0.6765
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- temelpaket için veritabanı yapısı dökülüyor
DROP DATABASE IF EXISTS `temelpaket`;
CREATE DATABASE IF NOT EXISTS `temelpaket` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci */;
USE `temelpaket`;

-- tablo yapısı dökülüyor temelpaket.apartments
CREATE TABLE IF NOT EXISTS `apartments` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `label` varchar(255) DEFAULT NULL,
  `citizenid` varchar(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `citizenid` (`citizenid`),
  KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- temelpaket.apartments: ~0 rows (yaklaşık) tablosu için veriler indiriliyor
DELETE FROM `apartments`;

-- tablo yapısı dökülüyor temelpaket.bank_accounts
CREATE TABLE IF NOT EXISTS `bank_accounts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `citizenid` varchar(11) DEFAULT NULL,
  `account_name` varchar(50) DEFAULT NULL,
  `account_balance` int(11) NOT NULL DEFAULT 0,
  `account_type` enum('shared','job','gang') NOT NULL,
  `users` longtext DEFAULT '[]',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `account_name` (`account_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- temelpaket.bank_accounts: ~0 rows (yaklaşık) tablosu için veriler indiriliyor
DELETE FROM `bank_accounts`;

-- tablo yapısı dökülüyor temelpaket.bank_statements
CREATE TABLE IF NOT EXISTS `bank_statements` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `citizenid` varchar(11) DEFAULT NULL,
  `account_name` varchar(50) DEFAULT 'checking',
  `amount` int(11) DEFAULT NULL,
  `reason` varchar(50) DEFAULT NULL,
  `statement_type` enum('deposit','withdraw') DEFAULT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`) USING BTREE,
  KEY `citizenid` (`citizenid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- temelpaket.bank_statements: ~0 rows (yaklaşık) tablosu için veriler indiriliyor
DELETE FROM `bank_statements`;

-- tablo yapısı dökülüyor temelpaket.bans
CREATE TABLE IF NOT EXISTS `bans` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `license` varchar(50) DEFAULT NULL,
  `discord` varchar(50) DEFAULT NULL,
  `ip` varchar(50) DEFAULT NULL,
  `reason` text DEFAULT NULL,
  `expire` int(11) DEFAULT NULL,
  `bannedby` varchar(255) NOT NULL DEFAULT 'LeBanhammer',
  PRIMARY KEY (`id`),
  KEY `license` (`license`),
  KEY `discord` (`discord`),
  KEY `ip` (`ip`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- temelpaket.bans: ~0 rows (yaklaşık) tablosu için veriler indiriliyor
DELETE FROM `bans`;

-- tablo yapısı dökülüyor temelpaket.betterbankcompanies
CREATE TABLE IF NOT EXISTS `betterbankcompanies` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fullName` varchar(50) DEFAULT NULL,
  `IBAN` varchar(6) DEFAULT NULL,
  `moneyAmount` int(11) DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- temelpaket.betterbankcompanies: ~0 rows (yaklaşık) tablosu için veriler indiriliyor
DELETE FROM `betterbankcompanies`;

-- tablo yapısı dökülüyor temelpaket.betterbanktransactions
CREATE TABLE IF NOT EXISTS `betterbanktransactions` (
  `IBAN` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT '0',
  `status` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT '',
  `amount` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT '',
  `time` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT '',
  `comingFrom` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT '',
  `icon` varchar(50) DEFAULT '',
  `color` varchar(10) DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- temelpaket.betterbanktransactions: ~23 rows (yaklaşık) tablosu için veriler indiriliyor
DELETE FROM `betterbanktransactions`;
INSERT INTO `betterbanktransactions` (`IBAN`, `status`, `amount`, `time`, `comingFrom`, `icon`, `color`) VALUES
	('HB383344', 'Transfer', '$300,00', '03-06-2025 02:14', 'Mike Shawn - HB192833', 'fal fa-exchange', 'red'),
	('HB192833', 'Transfer', '$300,00', '03-06-2025 02:14', 'Mile Wurden - HB383344', 'fal fa-exchange', 'green'),
	('HB383344', 'Withdraw', '$200,00', '03-06-2025 02:14', '', 'fas fa-arrow-down', 'red'),
	('HB383344', 'Deposit', '$222,00', '03-06-2025 02:15', '', 'fas fa-arrow-down', 'green'),
	('HB383344', 'Withdraw', '$200,00', '03-06-2025 02:17', '', 'fas fa-arrow-up', 'red'),
	('HB383344', 'Deposit', '$200,00', '03-06-2025 02:17', '', 'fas fa-arrow-down', 'green'),
	('HB383344', 'Transfer', '$4.000,00', '03-06-2025 02:18', 'Mike Shawn - HB192833', 'fas fa-exchange', 'red'),
	('HB192833', 'Transfer', '$4.000,00', '03-06-2025 02:18', 'Mile Wurden - HB383344', 'fas fa-exchange', 'green'),
	('HB383344', 'Withdraw', '$200,00', '03-06-2025 15:09', '', 'fas fa-arrow-up', 'red'),
	('HB383344', 'Withdraw', '$100,00', '04-06-2025 01:23', '', 'fas fa-arrow-up', 'red'),
	('HB383344', 'Deposit', '$200,00', '04-06-2025 01:23', '', 'fas fa-arrow-down', 'green'),
	('HB383344', 'Transfer', '$131,00', '04-06-2025 01:24', 'Mike Shawn - HB192833', 'fas fa-exchange', 'red'),
	('HB192833', 'Transfer', '$131,00', '04-06-2025 01:24', 'Mile Wurden - HB383344', 'fas fa-exchange', 'green'),
	('HB383344', 'Deposit', '$200,00', '04-06-2025 01:30', '', 'fas fa-arrow-down', 'green'),
	('HB383344', 'Withdraw', '$120,00', '04-06-2025 01:30', '', 'fas fa-arrow-up', 'red'),
	('HB383344', 'Transfer', '$222,00', '04-06-2025 01:30', 'Mike Shawn - HB192833', 'fas fa-exchange', 'red'),
	('HB192833', 'Transfer', '$222,00', '04-06-2025 01:30', 'Mile Wurden - HB383344', 'fas fa-exchange', 'green'),
	('HB152249', 'Deposit', '$100,00', '07-07-2025 11:48', '', 'fas fa-arrow-down', 'green'),
	('HB152249', 'Deposit', '$100,00', '07-07-2025 11:55', '', 'fas fa-arrow-down', 'green'),
	('HB152249', 'Withdraw', '$2.000,00', '07-07-2025 12:09', '', 'fas fa-arrow-up', 'red'),
	('HB773768', 'Deposit', '$100,00', '07-07-2025 14:17', '', 'fas fa-arrow-down', 'green'),
	('HB291521', 'Withdraw', '$100,00', '15-07-2025 03:17', '', 'fas fa-arrow-up', 'red'),
	('HB291521', 'Withdraw', '$111,00', '15-07-2025 03:18', '', 'fas fa-arrow-up', 'red');

-- tablo yapısı dökülüyor temelpaket.billing
CREATE TABLE IF NOT EXISTS `billing` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `payerIBAN` varchar(40) NOT NULL,
  `senderIBAN` varchar(40) NOT NULL,
  `payerFullName` varchar(50) DEFAULT NULL,
  `senderFullName` varchar(40) NOT NULL,
  `time` varchar(40) NOT NULL,
  `label` varchar(255) NOT NULL,
  `amount` int(11) NOT NULL,
  `status` varchar(40) NOT NULL DEFAULT 'Waiting',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- temelpaket.billing: ~0 rows (yaklaşık) tablosu için veriler indiriliyor
DELETE FROM `billing`;

-- tablo yapısı dökülüyor temelpaket.crypto
CREATE TABLE IF NOT EXISTS `crypto` (
  `crypto` varchar(50) NOT NULL DEFAULT 'qbit',
  `worth` int(11) NOT NULL DEFAULT 0,
  `history` text DEFAULT NULL,
  PRIMARY KEY (`crypto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- temelpaket.crypto: ~0 rows (yaklaşık) tablosu için veriler indiriliyor
DELETE FROM `crypto`;

-- tablo yapısı dökülüyor temelpaket.crypto_transactions
CREATE TABLE IF NOT EXISTS `crypto_transactions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `citizenid` varchar(11) DEFAULT NULL,
  `title` varchar(50) DEFAULT NULL,
  `message` varchar(50) DEFAULT NULL,
  `date` timestamp NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `citizenid` (`citizenid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- temelpaket.crypto_transactions: ~0 rows (yaklaşık) tablosu için veriler indiriliyor
DELETE FROM `crypto_transactions`;

-- tablo yapısı dökülüyor temelpaket.dealers
CREATE TABLE IF NOT EXISTS `dealers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL DEFAULT '0',
  `coords` longtext DEFAULT NULL,
  `time` longtext DEFAULT NULL,
  `createdby` varchar(50) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- temelpaket.dealers: ~0 rows (yaklaşık) tablosu için veriler indiriliyor
DELETE FROM `dealers`;

-- tablo yapısı dökülüyor temelpaket.hb_motels_keys
CREATE TABLE IF NOT EXISTS `hb_motels_keys` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `owner` varchar(50) NOT NULL,
  `motel` varchar(50) NOT NULL,
  `room_number` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- temelpaket.hb_motels_keys: ~0 rows (yaklaşık) tablosu için veriler indiriliyor
DELETE FROM `hb_motels_keys`;

-- tablo yapısı dökülüyor temelpaket.hb_motels_rooms
CREATE TABLE IF NOT EXISTS `hb_motels_rooms` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `motel` varchar(50) NOT NULL,
  `room_number` int(11) NOT NULL,
  `owner` varchar(50) DEFAULT NULL,
  `is_locked` tinyint(1) DEFAULT 1,
  `stash_locked` tinyint(1) DEFAULT 1,
  `last_rent_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_motel_room` (`motel`,`room_number`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- temelpaket.hb_motels_rooms: ~0 rows (yaklaşık) tablosu için veriler indiriliyor
DELETE FROM `hb_motels_rooms`;

-- tablo yapısı dökülüyor temelpaket.houselocations
CREATE TABLE IF NOT EXISTS `houselocations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `label` varchar(255) DEFAULT NULL,
  `coords` text DEFAULT NULL,
  `owned` tinyint(1) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `tier` tinyint(4) DEFAULT NULL,
  `garage` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- temelpaket.houselocations: ~0 rows (yaklaşık) tablosu için veriler indiriliyor
DELETE FROM `houselocations`;

-- tablo yapısı dökülüyor temelpaket.house_plants
CREATE TABLE IF NOT EXISTS `house_plants` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `building` varchar(50) DEFAULT NULL,
  `stage` int(11) DEFAULT 1,
  `sort` varchar(50) DEFAULT NULL,
  `gender` varchar(50) DEFAULT NULL,
  `food` int(11) DEFAULT 100,
  `health` int(11) DEFAULT 100,
  `progress` int(11) DEFAULT 0,
  `coords` text DEFAULT NULL,
  `plantid` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `building` (`building`),
  KEY `plantid` (`plantid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- temelpaket.house_plants: ~0 rows (yaklaşık) tablosu için veriler indiriliyor
DELETE FROM `house_plants`;

-- tablo yapısı dökülüyor temelpaket.inventories
CREATE TABLE IF NOT EXISTS `inventories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(50) NOT NULL,
  `items` longtext DEFAULT '[]',
  PRIMARY KEY (`identifier`),
  KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=161 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- temelpaket.inventories: ~45 rows (yaklaşık) tablosu için veriler indiriliyor
DELETE FROM `inventories`;
INSERT INTO `inventories` (`id`, `identifier`, `items`) VALUES
	(2, 'ambulancestash_NOF79195', '[]'),
	(40, 'glovebox- HBM345 ', '[]'),
	(75, 'glovebox-00IDG228', '[]'),
	(160, 'glovebox-00RGT869', '[]'),
	(71, 'glovebox-01LXJ993', '[]'),
	(78, 'glovebox-01NSJ938', '[null,null,null,{"type":"item","info":{"drawable":11,"texture":12},"unique":true,"label":"Ayakkabı","useable":true,"amount":1,"slot":4,"name":"shoes","weight":0,"shouldClose":false,"image":"shoes.png","description":""}]'),
	(3, 'glovebox-03YFF980', '[]'),
	(155, 'glovebox-04OBK277', '[]'),
	(106, 'glovebox-04SKF324', '[]'),
	(72, 'glovebox-05HQR964', '[]'),
	(156, 'glovebox-06SJO709', '[]'),
	(61, 'glovebox-08LHY484', '[]'),
	(158, 'glovebox-22IDK137', '[]'),
	(46, 'glovebox-22YLD772', '[]'),
	(122, 'glovebox-28HEA266', '[]'),
	(124, 'glovebox-42GLQ061', '[{"label":"Oda Anahtarı","info":{"room":2,"motel":"hb_pinkcage"},"image":"key.png","unique":true,"slot":1,"description":"","name":"motelkey","shouldClose":true,"type":"item","weight":500,"amount":1,"useable":true},{"label":"Phone","amount":1,"image":"phone.png","unique":true,"slot":2,"shouldClose":false,"name":"phone","description":"Neat phone ya got there","info":[],"weight":700,"type":"item","useable":false}]'),
	(73, 'glovebox-43IJQ107', '[]'),
	(5, 'glovebox-46AAY865', '[]'),
	(23, 'glovebox-4EZT783 ', '[]'),
	(6, 'glovebox-60PNW467', '[]'),
	(98, 'glovebox-61ROC939', '[]'),
	(110, 'glovebox-62GTO240', '[]'),
	(22, 'glovebox-65SUW058', '[]'),
	(157, 'glovebox-65VMS462', '[]'),
	(150, 'glovebox-69KLX155', '[{"info":[],"name":"green_phone","unique":true,"type":"item","label":"Yeşil Telefon","image":"green_phone.png","amount":1,"slot":1,"shouldClose":false,"description":"Neat phone ya got there","weight":700,"useable":false}]'),
	(67, 'glovebox-80VJL454', '[]'),
	(90, 'glovebox-82NPV657', '[]'),
	(63, 'glovebox-88DSD443', '[]'),
	(4, 'glovebox-9XXS323 ', '[]'),
	(36, 'glovebox-9YRW101 ', '[{"description":"Neat phone ya got there","label":"Sarı Telefon","weight":700,"unique":true,"type":"item","shouldClose":false,"amount":1,"useable":false,"image":"yellow_phone.png","slot":1,"name":"yellow_phone","info":[]},{"description":"","label":"Motel Odası Anahtarı","weight":500,"unique":true,"type":"item","shouldClose":true,"amount":1,"useable":true,"image":"key.png","slot":2,"name":"motelkey","info":{"motel":"hb_pinkcage","room":1}},{"description":"","label":"Motel Odası Anahtarı","weight":500,"unique":true,"type":"item","shouldClose":true,"amount":1,"useable":true,"image":"key.png","slot":3,"name":"motelkey","info":{"room":8,"motel":"pinkcage"}},{"description":"","label":"Motel Odası Anahtarı","weight":500,"unique":true,"type":"item","shouldClose":true,"amount":1,"useable":true,"image":"key.png","slot":4,"name":"motelkey","info":{"room":8,"motel":"pinkcage"}}]'),
	(64, 'glovebox-SHOWROOM', '[]'),
	(105, 'hb_perrera1', '[]'),
	(13, 'hb_pinkcage1', '[]'),
	(7, 'hb_pinkcage11', '[]'),
	(44, 'hb_pinkcage14', '[]'),
	(11, 'hb_pinkcage2', '[{"description":"","info":{"texture":0,"drawable":15},"label":"Tişört","useable":true,"name":"tshirt","unique":true,"slot":1,"image":"shirt.png","amount":1,"shouldClose":false,"weight":0,"type":"item"},{"description":"","info":{"texture":0,"drawable":338,"component_id":11},"label":"Gömlek","useable":true,"name":"torso2","unique":true,"slot":2,"image":"torso2.png","amount":1,"shouldClose":false,"weight":0,"type":"item"},{"description":"","info":{"texture":0,"drawable":80,"component_id":11},"label":"Gömlek","useable":true,"name":"torso2","unique":true,"slot":3,"image":"torso2.png","amount":1,"shouldClose":false,"weight":0,"type":"item"},{"description":"","info":{"texture":0,"drawable":19,"component_id":8},"label":"Tişört","useable":true,"name":"tshirt","unique":true,"slot":4,"image":"shirt.png","amount":1,"shouldClose":false,"weight":0,"type":"item"},{"description":"","info":{"texture":5,"drawable":117,"component_id":4},"label":"Pantolon","useable":true,"name":"pantolon","unique":true,"slot":5,"image":"pants.png","amount":1,"shouldClose":false,"weight":0,"type":"item"},null,null,{"description":"Some delicious candy :O","info":[],"label":"Snikkel","useable":true,"name":"snikkel_candy","unique":false,"slot":8,"image":"snikkel_candy.png","amount":1,"shouldClose":true,"weight":100,"type":"item"},null,{"description":"For all the thirsty out there","info":[],"label":"Bottle of Water","useable":true,"name":"water_bottle","unique":false,"slot":10,"image":"water_bottle.png","amount":6,"shouldClose":true,"weight":500,"type":"item"},{"description":"","info":{"texture":0,"drawable":15},"label":"Tişört","useable":true,"name":"tshirt","unique":true,"slot":11,"image":"shirt.png","amount":1,"shouldClose":false,"weight":0,"type":"item"}]'),
	(9, 'hb_pinkcage3', '[]'),
	(24, 'hb_pinkcage4', '[{"description":"Permit to show you can drive a vehicle","label":"Drivers License","weight":0,"unique":true,"type":"item","shouldClose":false,"amount":1,"useable":true,"image":"driver_license.png","slot":1,"name":"driver_license","info":{"birthdate":"2025-06-30","firstname":"Mike","type":"Class C Driver License","lastname":"Shawn"}}]'),
	(19, 'hb_pinkcage5', '[]'),
	(27, 'hb_pinkcage6', '[]'),
	(26, 'hb_pinkcage8', '[]'),
	(109, 'trunk-04SKF324', '[]'),
	(129, 'trunk-42GLQ061', '[]'),
	(39, 'trunk-45PQF526', '[{"unique":false,"description":"Maden kazancını paraya dökebileceğin bir yöntem","info":[],"amount":4,"weight":100,"slot":1,"shouldClose":false,"type":"item","name":"madentokeni","image":"madentokeni.png","useable":false,"label":"Maden Tokeni"},{"unique":false,"description":"Kazma","info":[],"amount":1,"weight":100,"slot":2,"shouldClose":false,"type":"item","name":"pickaxe","image":"pickaxe.png","useable":false,"label":"Kazma"}]'),
	(1, 'trunk-TRUK7027', '[]');

-- tablo yapısı dökülüyor temelpaket.lapraces
CREATE TABLE IF NOT EXISTS `lapraces` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `checkpoints` text DEFAULT NULL,
  `records` text DEFAULT NULL,
  `creator` varchar(50) DEFAULT NULL,
  `distance` int(11) DEFAULT NULL,
  `raceid` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `raceid` (`raceid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- temelpaket.lapraces: ~0 rows (yaklaşık) tablosu için veriler indiriliyor
DELETE FROM `lapraces`;

-- tablo yapısı dökülüyor temelpaket.management_outfits
CREATE TABLE IF NOT EXISTS `management_outfits` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `job_name` varchar(50) NOT NULL,
  `type` varchar(50) NOT NULL,
  `minrank` int(11) NOT NULL DEFAULT 0,
  `name` varchar(50) NOT NULL DEFAULT 'Cool Outfit',
  `gender` varchar(50) NOT NULL DEFAULT 'male',
  `model` varchar(50) DEFAULT NULL,
  `props` varchar(1000) DEFAULT NULL,
  `components` varchar(1500) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- temelpaket.management_outfits: ~0 rows (yaklaşık) tablosu için veriler indiriliyor
DELETE FROM `management_outfits`;

-- tablo yapısı dökülüyor temelpaket.market_stocks
CREATE TABLE IF NOT EXISTS `market_stocks` (
  `market_id` varchar(50) NOT NULL,
  `item_name` varchar(50) NOT NULL,
  `amount` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`market_id`,`item_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- temelpaket.market_stocks: ~2 rows (yaklaşık) tablosu için veriler indiriliyor
DELETE FROM `market_stocks`;
INSERT INTO `market_stocks` (`market_id`, `item_name`, `amount`) VALUES
	('1', 'pistol_ammo', 5),
	('2', 'water_bottle', 2);

-- tablo yapısı dökülüyor temelpaket.motel_rentals
CREATE TABLE IF NOT EXISTS `motel_rentals` (
  `citizenid` varchar(50) NOT NULL,
  `motel` varchar(50) NOT NULL,
  `room` int(11) NOT NULL,
  `rent_timestamp` bigint(20) NOT NULL,
  PRIMARY KEY (`motel`,`room`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- temelpaket.motel_rentals: ~4 rows (yaklaşık) tablosu için veriler indiriliyor
DELETE FROM `motel_rentals`;
INSERT INTO `motel_rentals` (`citizenid`, `motel`, `room`, `rent_timestamp`) VALUES
	('VNJ60175', 'perrera', 1, 1751733735),
	('FMW68507', 'pinkcage', 1, 1751232734),
	('VNJ60175', 'pinkcage', 2, 1751542527),
	('OWH73132', 'pinkcage', 3, 1751879362);

-- tablo yapısı dökülüyor temelpaket.npc_sales_receipts
CREATE TABLE IF NOT EXISTS `npc_sales_receipts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `serial_number` varchar(12) DEFAULT NULL,
  `citizenid` varchar(50) DEFAULT NULL,
  `item` varchar(100) DEFAULT NULL,
  `amount` int(11) DEFAULT NULL,
  `total_price` int(11) DEFAULT NULL,
  `sell_time` datetime DEFAULT current_timestamp(),
  `description` text DEFAULT NULL,
  `from_name` varchar(100) DEFAULT NULL,
  `to_name` varchar(100) DEFAULT NULL,
  `job` varchar(255) DEFAULT 'Bilinmiyor',
  PRIMARY KEY (`id`),
  UNIQUE KEY `serial_number` (`serial_number`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- temelpaket.npc_sales_receipts: ~20 rows (yaklaşık) tablosu için veriler indiriliyor
DELETE FROM `npc_sales_receipts`;
INSERT INTO `npc_sales_receipts` (`id`, `serial_number`, `citizenid`, `item`, `amount`, `total_price`, `sell_time`, `description`, `from_name`, `to_name`, `job`) VALUES
	(1, 'HOV32894824', 'GMY18226', 'fish', 3, 15, '2025-05-01 23:09:36', NULL, NULL, NULL, 'Bilinmiyor'),
	(2, 'HOV55527343', 'GMY18226', 'manuel_fis', 1, 100, '2025-05-01 23:16:30', 'Test', 'emreleann', 'emreleann', 'Bilinmiyor'),
	(3, 'HOV15438232', 'GMY18226', 'manuel_fis', 1, 123, '2025-05-01 23:16:56', 'test', 'emreleann', 'emreleann', 'Bilinmiyor'),
	(4, 'HOV14119873', 'GMY18226', 'manuel_fis', 1, 100, '2025-05-01 23:18:40', 'Test', 'emreleann', 'emreleann', 'Bilinmiyor'),
	(5, 'HOV72136255', 'GMY18226', 'fish2', 1, 7, '2025-05-01 23:19:32', NULL, NULL, NULL, 'Bilinmiyor'),
	(6, 'HOV15354274', 'GMY18226', 'fish', 1, 5, '2025-05-01 23:21:07', NULL, NULL, NULL, 'Bilinmiyor'),
	(7, 'HOV78797405', 'GMY18226', 'fish', 5, 25, '2025-05-01 23:23:03', NULL, NULL, NULL, 'Bilinmiyor'),
	(8, 'HOV19945926', 'GMY18226', 'fish', 5, 25, '2025-05-01 23:23:10', NULL, NULL, NULL, 'Bilinmiyor'),
	(9, 'HOV98019714', 'JJD55789', 'manuel_fis', 1, 100, '2025-05-01 23:29:08', 'Deneme', 'Rocco Crane', 'Mike Shawn', 'Bilinmiyor'),
	(10, 'HOV71020812', 'GMY18226', 'manuel_fis', 1, 11, '2025-05-01 23:30:26', 'Test', 'Rocco Crane', 'Rocco Crane', 'Bilinmiyor'),
	(11, 'HOV66502685', 'JJD55789', 'manuel_fis', 1, 100, '2025-05-01 23:30:44', 'test', 'Rocco Crane', 'Mike Shawn', 'Bilinmiyor'),
	(12, 'HOV94314575', 'JJD55789', 'manuel_fis', 1, 200, '2025-05-01 23:30:54', 'demir', 'Rocco Crane', 'Mike Shawn', 'Bilinmiyor'),
	(13, 'HOV32906494', 'GMY18226', 'manuel_fis', 1, 3, '2025-05-01 23:34:10', '3', 'Rocco Crane', 'Rocco Crane', 'Bilinmiyor'),
	(14, 'HOV93833923', 'GMY18226', 'manuel_fis', 1, 3, '2025-05-01 23:34:32', '3', 'Rocco Crane', 'Rocco Crane', 'Bilinmiyor'),
	(15, 'HOV63896179', 'GMY18226', 'manuel_fis', 1, 2, '2025-05-01 23:34:40', '5', 'Rocco Crane', 'Rocco Crane', 'Bilinmiyor'),
	(16, 'HOV95712585', 'JJD55789', 'manuel_fis', 1, 34, '2025-05-01 23:41:43', 'Popeyes XL Menu', 'Rocco Crane', 'Mike Shawn', 'Bilinmiyor'),
	(17, 'HOV82913513', 'JJD55789', 'manuel_fis', 1, 200, '2025-05-01 23:44:15', 'popeyes xl menu', 'Rocco Crane', 'Mike Shawn', 'Bilinmiyor'),
	(18, 'HOV46856384', 'GMY18226', 'manuel_fis', 1, 1, '2025-05-01 23:45:42', '10', 'Rocco Crane', 'Rocco Crane', 'Bilinmiyor'),
	(19, 'HOV98184509', 'GMY18226', 'manuel_fis', 1, 1, '2025-05-01 23:54:08', 'test', 'Rocco Crane', 'Rocco Crane', 'Bilinmiyor'),
	(20, 'HOV21054992', 'GMY18226', 'manuel_fis', 1, 30, '2025-05-02 00:15:30', 'Popeyes XL Menu', 'Rocco Crane', 'Rocco Crane', 'Bilinmiyor');

-- tablo yapısı dökülüyor temelpaket.occasion_vehicles
CREATE TABLE IF NOT EXISTS `occasion_vehicles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `seller` varchar(50) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `description` longtext DEFAULT NULL,
  `plate` varchar(50) DEFAULT NULL,
  `model` varchar(50) DEFAULT NULL,
  `mods` text DEFAULT NULL,
  `occasionid` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `occasionId` (`occasionid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- temelpaket.occasion_vehicles: ~0 rows (yaklaşık) tablosu için veriler indiriliyor
DELETE FROM `occasion_vehicles`;

-- tablo yapısı dökülüyor temelpaket.phone_ads
CREATE TABLE IF NOT EXISTS `phone_ads` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `owner` varchar(255) DEFAULT NULL,
  `job` varchar(50) DEFAULT 'default',
  `author` varchar(255) DEFAULT NULL,
  `title` varchar(50) DEFAULT NULL,
  `content` varchar(512) DEFAULT NULL,
  `data` varchar(255) DEFAULT NULL,
  `image` varchar(255) NOT NULL DEFAULT '',
  `time` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- temelpaket.phone_ads: ~8 rows (yaklaşık) tablosu için veriler indiriliyor
DELETE FROM `phone_ads`;
INSERT INTO `phone_ads` (`id`, `owner`, `job`, `author`, `title`, `content`, `data`, `image`, `time`) VALUES
	(28, 'HDM14341', 'default', 'Mile Wurden', 'SATILIK DMR', 'Çok temiz kullanıldı kilometresi az çok zorlanmadı\nköpek falan gezdiriyor iş yapar', '{"calls":{"enabled":true,"number":"571-4850"},"messages":{"enabled":true,"number":"571-4850"}}', '', 1749507804000),
	(29, 'HDM14341', 'default', 'Mile Wurden', 'Los Santos Kültür ve Sanat Der', 'Temel Oyunculuk Kursu\nLos Santos Kültür ve Sanat Derneği Temel Oyunculuk Kursu Tiyatro ve Sahne Rol Uygulama Doğaçlama Kurslar haftada iki gündür. Kursların sonunda, bir tiyatro oyunu belirlenecek ve sahnelenmesi için pr', '{"calls":{"enabled":true,"number":"571-4850"},"messages":{"enabled":true,"number":"571-4850"}}', '', 1749507851000),
	(30, 'HDM14341', 'default', 'Mile Wurden', 'Av. Emre Alan', 'Hukukta güçlü temsil, adalete kalıcı çözümler sağlar.', '{"calls":{"enabled":true,"number":"571-4850"},"messages":{"enabled":true,"number":"571-4850"}}', '', 1749507870000),
	(31, 'FMW68507', 'default', 'Mile Wurden', 'SATILIK BOĞAZ KÖPRÜSÜ', 'garantisi benim :))', '{"calls":{"enabled":true,"number":"5289038"},"messages":{"enabled":false,"number":"5289038"}}', '', 1750109573000),
	(32, 'FMW68507', 'default', 'Mile Wurden', 'EN İYİSİ OLAAN KADAR BU EN IYI', 'falan filan inter milan', '{"calls":{"enabled":true,"number":"5289038"},"messages":{"enabled":true,"number":"5289038"}}', '', 1750109590000),
	(33, 'FMW68507', 'default', 'Mile Wurden', 'demiri satıyorum', 'yerinden kaldırabilene beleş', '{"calls":{"enabled":true,"number":"5289038"},"messages":{"enabled":true,"number":"5289038"}}', '', 1750109964000),
	(34, 'VNJ60175', 'default', 'Mike Shawn', 'demiri satıyorum', 'kilosu 10lira', '{"calls":{"enabled":true,"number":"8556860"},"messages":{"enabled":true,"number":"8556860"}}', '', 1751236957000),
	(35, 'VNJ60175', 'default', 'Mike Shawn', 'keske demir olsam', 'evet doğru duyfunuz', '{"calls":{"enabled":true,"number":"8556860"},"messages":{"enabled":true,"number":"8556860"}}', '', 1751237342000);

-- tablo yapısı dökülüyor temelpaket.phone_chats
CREATE TABLE IF NOT EXISTS `phone_chats` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `owner` varchar(255) DEFAULT NULL,
  `number` varchar(255) DEFAULT NULL,
  `name` varchar(255) NOT NULL DEFAULT 'Unknown',
  `muted` tinyint(1) DEFAULT 0,
  `lastOpened` bigint(20) DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- temelpaket.phone_chats: ~13 rows (yaklaşık) tablosu için veriler indiriliyor
DELETE FROM `phone_chats`;
INSERT INTO `phone_chats` (`id`, `owner`, `number`, `name`, `muted`, `lastOpened`) VALUES
	(1, 'HDM14341', '123123123', 'Emre', 0, 1748991703000),
	(2, 'HDM14341', '23123121', 'Mike Shawn', 0, 1749292527000),
	(3, 'HDM14341', '123456', 'Emre Alan', 0, 1749250856000),
	(4, 'HDM14341', 'asdas', 'ghjghj', 0, 1749240671000),
	(5, 'HDM14341', '234567', 'Bozok', 1, 1749172982000),
	(6, 'HDM14341', 'dfgdfgdfg22', 'dfgdfgdfg', 0, 0),
	(7, 'HDM14341', '5042091969', 'DMR', 0, 1749562545000),
	(8, 'HDM14341', '50731311', 'EMRE ANAL', 0, 1749562550000),
	(9, 'FBW33221', '123123123', 'TESTASDASd', 0, 1749597484000),
	(10, 'KQH93442', '123123123', '123123', 0, 1750078313000),
	(17, 'FMW68507', '8556860', 'Unknown', 0, 1751457552000),
	(19, 'VNJ60175', '571-4850', 'avukat ', 0, 1751710007000),
	(20, 'TTM83002', '8556860', 'emre anal', 0, 0);

-- tablo yapısı dökülüyor temelpaket.phone_contacts
CREATE TABLE IF NOT EXISTS `phone_contacts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `owner` varchar(255) DEFAULT NULL,
  `number` varchar(255) DEFAULT NULL,
  `name` varchar(255) NOT NULL DEFAULT 'Unknown',
  `photo` varchar(512) DEFAULT '',
  `tag` varchar(255) DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- temelpaket.phone_contacts: ~13 rows (yaklaşık) tablosu için veriler indiriliyor
DELETE FROM `phone_contacts`;
INSERT INTO `phone_contacts` (`id`, `owner`, `number`, `name`, `photo`, `tag`) VALUES
	(1, 'HDM14341', '123456', 'Emre Alan', '', ''),
	(5, 'HDM14341', 'dfgdfgdfg', 'dfgdfgdfg', '', ''),
	(6, 'HDM14341', 'asdas', 'ghjghj', '', ''),
	(8, 'HDM14341', '5042091969', 'DMR', 'https://files.fivemerr.com/images/98da9ae7-1690-4a14-9f22-d9449cfaba11.jpg', ''),
	(10, 'HDM14341', '50731311', 'EMRE ANAL', 'https://files.fivemerr.com/images/2c52cd29-eba1-4853-9e2f-1b9946c14b0e.jpg', NULL),
	(11, 'HDM14341', 'asdasd', 'ASDasd', 'https://files.fivemerr.com/images/dcd1733d-3867-434f-ab19-61043edc02ab.jpg', NULL),
	(12, 'HDM14341', 'asdasdasdasda', 'asdasdasd', 'https://files.fivemerr.com/images/b8fb501d-9193-4d28-b1f3-34003a4e8ff9.jpg', NULL),
	(13, 'HDM14341', 'dasdasdasd', 'asdasdas', 'https://files.fivemerr.com/images/b8fb501d-9193-4d28-b1f3-34003a4e8ff9.jpg', NULL),
	(14, 'FBW33221', '12312312', 'DMR LUA', '', NULL),
	(15, 'FBW33221', '123123123123123', 'ERMAE SALANSD', '', NULL),
	(16, 'FMW68507', '2315061881', 'DMR LUA', 'https://files.fivemerr.com/images/e9258718-b348-4300-8529-d4cfdc214751.png', NULL),
	(17, 'FMW68507', '1911881292', 'EMR ALAN', 'https://files.fivemerr.com/images/8087a740-c37c-48aa-8fa5-a81b55ea5ef1.jpg', NULL),
	(21, 'VNJ60175', '571-4850', 'avukat ', 'https://files.fivemerr.com/images/7cf2bcb7-be94-4853-8f27-d47251e8a67d.jpg', NULL);

-- tablo yapısı dökülüyor temelpaket.phone_darkgroups
CREATE TABLE IF NOT EXISTS `phone_darkgroups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `invitecode` varchar(50) DEFAULT NULL,
  `owner` varchar(255) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `photo` varchar(512) NOT NULL DEFAULT '',
  `maxmembers` int(11) DEFAULT 0,
  `members` mediumtext NOT NULL,
  `bannedmembers` mediumtext DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- temelpaket.phone_darkgroups: ~1 rows (yaklaşık) tablosu için veriler indiriliyor
DELETE FROM `phone_darkgroups`;
INSERT INTO `phone_darkgroups` (`id`, `invitecode`, `owner`, `name`, `photo`, `maxmembers`, `members`, `bannedmembers`) VALUES
	(1, '4jwxUl', 'FMW68507', 'asdasdasd', '', 1, '["FMW68507"]', NULL);

-- tablo yapısı dökülüyor temelpaket.phone_darkmessages
CREATE TABLE IF NOT EXISTS `phone_darkmessages` (
  `from` varchar(255) DEFAULT NULL,
  `to` int(11) DEFAULT NULL,
  `message` varchar(512) DEFAULT NULL,
  `attachments` mediumtext DEFAULT NULL,
  `time` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- temelpaket.phone_darkmessages: ~0 rows (yaklaşık) tablosu için veriler indiriliyor
DELETE FROM `phone_darkmessages`;

-- tablo yapısı dökülüyor temelpaket.phone_gallery
CREATE TABLE IF NOT EXISTS `phone_gallery` (
  `citizenid` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  `date` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- temelpaket.phone_gallery: ~10 rows (yaklaşık) tablosu için veriler indiriliyor
DELETE FROM `phone_gallery`;
INSERT INTO `phone_gallery` (`citizenid`, `image`, `date`) VALUES
	('HDM14341', 'https://files.fivemerr.com/images/c3bfeccf-b5f0-4c89-aeb6-ef9575ecebcd.jpg', '1748906490548'),
	('HDM14341', 'https://files.fivemerr.com/images/0740db43-45fc-4df5-b12d-603175f8b66b.jpg', '1748992913219'),
	('HDM14341', 'https://files.fivemerr.com/images/2bfe61c6-1e35-4ffa-8524-858be6d08268.jpg', '1749250898927'),
	('FBW33221', 'https://files.fivemerr.com/images/eb911186-dce6-4ced-b5dd-f3e13c245d44.jpg', '1749599284240'),
	('FMW68507', 'https://files.fivemerr.com/images/8ade65fb-0f35-4e37-aea1-80ffc9fbbfc6.jpg', '2025-06-16T21:34:57.470Z'),
	('FMW68507', 'https://files.fivemerr.com/images/eb9be45e-0538-4376-b154-a91e2ef9813f.jpg', '2025-06-16T21:44:59.383Z'),
	('FMW68507', 'https://files.fivemerr.com/images/e88d0435-1217-4a48-a2a1-035351769578.jpg', '2025-06-16T21:45:05.019Z'),
	('VNJ60175', 'https://files.fivemerr.com/images/ec0bf7ff-78f5-4f17-9e11-07934050f90d.jpg', '2025-06-29T22:52:11.934Z'),
	('VNJ60175', 'https://files.fivemerr.com/images/925c79bd-e8ac-40e0-a58b-5dc95c116753.jpg', '2025-06-29T22:53:03.071Z'),
	('VNJ60175', 'https://files.fivemerr.com/images/925c79bd-e8ac-40e0-a58b-5dc95c116753.jpg', '2025-07-05T10:08:03.694Z');

-- tablo yapısı dökülüyor temelpaket.phone_groups
CREATE TABLE IF NOT EXISTS `phone_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `owner` varchar(255) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `photo` varchar(512) NOT NULL DEFAULT '',
  `members` mediumtext NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- temelpaket.phone_groups: ~1 rows (yaklaşık) tablosu için veriler indiriliyor
DELETE FROM `phone_groups`;
INSERT INTO `phone_groups` (`id`, `owner`, `name`, `photo`, `members`) VALUES
	(1, 'HDM14341', 'deneme', '', '["123456","02","01","571-4850"]');

-- tablo yapısı dökülüyor temelpaket.phone_invoices
CREATE TABLE IF NOT EXISTS `phone_invoices` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `citizenid` varchar(50) DEFAULT NULL,
  `amount` int(11) NOT NULL DEFAULT 0,
  `society` tinytext DEFAULT NULL,
  `sender` varchar(50) DEFAULT NULL,
  `sendercitizenid` varchar(50) DEFAULT NULL,
  `reason` text DEFAULT NULL,
  `sell_time` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `citizenid` (`citizenid`)
) ENGINE=InnoDB AUTO_INCREMENT=121 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- temelpaket.phone_invoices: ~45 rows (yaklaşık) tablosu için veriler indiriliyor
DELETE FROM `phone_invoices`;
INSERT INTO `phone_invoices` (`id`, `citizenid`, `amount`, `society`, `sender`, `sendercitizenid`, `reason`, `sell_time`) VALUES
	(56, 'FMW68507', 20, NULL, 'Pinkcage Motel', NULL, 'pinkcage-1 Oda ücreti', '2025-06-30 13:10:03'),
	(57, 'FMW68507', 20, NULL, 'Pinkcage Motel', NULL, 'pinkcage-1 Oda ücreti', '2025-06-30 15:10:03'),
	(58, 'FMW68507', 20, NULL, 'Pinkcage Motel', NULL, 'pinkcage-1 Oda ücreti', '2025-06-30 17:10:03'),
	(59, 'FMW68507', 20, NULL, 'Pinkcage Motel', NULL, 'pinkcage-1 Oda ücreti', '2025-06-30 19:42:18'),
	(75, 'FMW68507', 300, '', 'Vale', 'Vale', NULL, NULL),
	(76, 'FMW68507', 20, NULL, 'Pinkcage Motel', NULL, 'pinkcage-1 Oda ücreti', '2025-07-03 00:52:47'),
	(77, 'FMW68507', 300, '', 'Vale', 'Vale', NULL, NULL),
	(78, 'FMW68507', 20, NULL, 'Pinkcage Motel', NULL, 'pinkcage-1 Oda ücreti', '2025-07-03 02:52:47'),
	(84, 'VNJ60175', 300, '', 'Vale', 'Vale', NULL, NULL),
	(85, 'VNJ60175', 20, NULL, 'Pinkcage Motel', NULL, 'pinkcage-2 Oda ücreti', '2025-07-05 17:10:09'),
	(86, 'VNJ60175', 20, NULL, 'Perrera Beach Motel', NULL, 'Perrera Beach Motel-1 Oda ücreti', '2025-07-07 04:41:30'),
	(87, 'VNJ60175', 20, NULL, 'Pinkcage Motel', NULL, 'Pinkcage Motel-2 Oda ücreti', '2025-07-07 04:41:30'),
	(88, 'VNJ60175', 20, NULL, 'Perrera Beach Motel', NULL, 'Perrera Beach Motel-1 Oda ücreti', '2025-07-07 06:41:30'),
	(89, 'VNJ60175', 20, NULL, 'Pinkcage Motel', NULL, 'Pinkcage Motel-2 Oda ücreti', '2025-07-07 06:41:30'),
	(90, 'VNJ60175', 20, NULL, 'Perrera Beach Motel', NULL, 'Perrera Beach Motel-1 Oda ücreti', '2025-07-07 08:41:30'),
	(91, 'VNJ60175', 20, NULL, 'Pinkcage Motel', NULL, 'Pinkcage Motel-2 Oda ücreti', '2025-07-07 08:41:30'),
	(92, 'VNJ60175', 20, NULL, 'Perrera Beach Motel', NULL, 'Perrera Beach Motel-1 Oda ücreti', '2025-07-07 10:41:30'),
	(93, 'VNJ60175', 20, NULL, 'Pinkcage Motel', NULL, 'Pinkcage Motel-2 Oda ücreti', '2025-07-07 10:41:30'),
	(94, 'VNJ60175', 300, '', 'Vale', 'Vale', NULL, NULL),
	(95, 'VNJ60175', 20, NULL, 'Perrera Beach Motel', NULL, 'Perrera Beach Motel-1 Oda ücreti', '2025-07-07 14:03:50'),
	(96, 'VNJ60175', 20, NULL, 'Pinkcage Motel', NULL, 'Pinkcage Motel-2 Oda ücreti', '2025-07-07 14:03:50'),
	(97, 'VNJ60175', 300, '', 'Vale', 'Vale', NULL, NULL),
	(98, 'VNJ60175', 300, '', 'Vale', 'Vale', NULL, NULL),
	(99, 'VNJ60175', 20, NULL, 'Pinkcage Motel', NULL, 'Pinkcage Motel-2 Oda ücreti', '2025-07-08 15:54:17'),
	(100, 'VNJ60175', 20, NULL, 'Perrera Beach Motel', NULL, 'Perrera Beach Motel-1 Oda ücreti', '2025-07-08 15:54:16'),
	(101, 'VNJ60175', 20, NULL, 'Pinkcage Motel', NULL, 'Pinkcage Motel-2 Oda ücreti', '2025-07-08 17:54:17'),
	(102, 'VNJ60175', 20, NULL, 'Perrera Beach Motel', NULL, 'Perrera Beach Motel-1 Oda ücreti', '2025-07-08 17:54:17'),
	(103, 'VNJ60175', 20, NULL, 'Perrera Beach Motel', NULL, 'Perrera Beach Motel-1 Oda ücreti', '2025-07-08 19:54:17'),
	(104, 'VNJ60175', 20, NULL, 'Pinkcage Motel', NULL, 'Pinkcage Motel-2 Oda ücreti', '2025-07-08 19:54:17'),
	(105, 'VNJ60175', 20, NULL, 'Perrera Beach Motel', NULL, 'Perrera Beach Motel-1 Oda ücreti', '2025-07-08 21:54:17'),
	(106, 'VNJ60175', 20, NULL, 'Pinkcage Motel', NULL, 'Pinkcage Motel-2 Oda ücreti', '2025-07-08 21:54:17'),
	(107, 'VNJ60175', 20, NULL, 'Perrera Beach Motel', NULL, 'Perrera Beach Motel-1 Oda ücreti', '2025-07-08 23:54:17'),
	(108, 'VNJ60175', 20, NULL, 'Pinkcage Motel', NULL, 'Pinkcage Motel-2 Oda ücreti', '2025-07-08 23:54:17'),
	(109, 'VNJ60175', 20, NULL, 'Perrera Beach Motel', NULL, 'Perrera Beach Motel-1 Oda ücreti', '2025-07-09 01:54:17'),
	(110, 'VNJ60175', 20, NULL, 'Pinkcage Motel', NULL, 'Pinkcage Motel-2 Oda ücreti', '2025-07-09 01:54:17'),
	(111, 'VNJ60175', 20, NULL, 'Perrera Beach Motel', NULL, 'Perrera Beach Motel-1 Oda ücreti', '2025-07-09 03:54:17'),
	(112, 'VNJ60175', 20, NULL, 'Pinkcage Motel', NULL, 'Pinkcage Motel-2 Oda ücreti', '2025-07-09 03:54:17'),
	(113, 'VNJ60175', 20, NULL, 'Perrera Beach Motel', NULL, 'Perrera Beach Motel-1 Oda ücreti', '2025-07-09 05:54:17'),
	(114, 'VNJ60175', 20, NULL, 'Pinkcage Motel', NULL, 'Pinkcage Motel-2 Oda ücreti', '2025-07-09 05:54:17'),
	(115, 'VNJ60175', 20, NULL, 'Perrera Beach Motel', NULL, 'Perrera Beach Motel-1 Oda ücreti', '2025-07-09 07:54:17'),
	(116, 'VNJ60175', 20, NULL, 'Pinkcage Motel', NULL, 'Pinkcage Motel-2 Oda ücreti', '2025-07-09 07:54:17'),
	(117, 'VNJ60175', 20, NULL, 'Perrera Beach Motel', NULL, 'Perrera Beach Motel-1 Oda ücreti', '2025-07-09 09:54:17'),
	(118, 'VNJ60175', 20, NULL, 'Pinkcage Motel', NULL, 'Pinkcage Motel-2 Oda ücreti', '2025-07-09 09:54:17'),
	(119, 'VNJ60175', 20, NULL, 'Perrera Beach Motel', NULL, 'Perrera Beach Motel-1 Oda ücreti', '2025-07-09 11:54:17'),
	(120, 'VNJ60175', 20, NULL, 'Pinkcage Motel', NULL, 'Pinkcage Motel-2 Oda ücreti', '2025-07-09 11:54:17');

-- tablo yapısı dökülüyor temelpaket.phone_mail
CREATE TABLE IF NOT EXISTS `phone_mail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `owner` varchar(128) DEFAULT NULL,
  `subject` varchar(50) DEFAULT NULL,
  `starred` tinyint(1) NOT NULL DEFAULT 0,
  `mail` longtext DEFAULT NULL,
  `trash` tinyint(1) NOT NULL DEFAULT 0,
  `muted` tinyint(1) NOT NULL DEFAULT 0,
  `lastOpened` bigint(20) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- temelpaket.phone_mail: ~2 rows (yaklaşık) tablosu için veriler indiriliyor
DELETE FROM `phone_mail`;
INSERT INTO `phone_mail` (`id`, `owner`, `subject`, `starred`, `mail`, `trash`, `muted`, `lastOpened`) VALUES
	(1, 'emreleann@hollystore.com', 'emreleann', 1, '[{"attachments":"[{\\"image\\":\\"https://files.fivemerr.com/images/c3bfeccf-b5f0-4c89-aeb6-ef9575ecebcd.jpg\\"}]","content":"emreleannemreleannemreleannemreleannemreleannemreleannemreleannemreleann","time":1749562410000,"sender":{"address":"hollystore@hollystore.com","name":"hollystore","photo":""},"recipients":[["emreleann@hollystore.com"]]}]', 0, 0, 1749562433000),
	(2, 'hollystore@hollystore.com', 'emreleann', 0, '[{"attachments":"[{\\"image\\":\\"https://files.fivemerr.com/images/c3bfeccf-b5f0-4c89-aeb6-ef9575ecebcd.jpg\\"}]","content":"emreleannemreleannemreleannemreleannemreleannemreleannemreleannemreleann","time":1749562410000,"sender":{"address":"hollystore@hollystore.com","name":"hollystore","photo":""},"recipients":[["emreleann@hollystore.com"]]}]', 0, 0, 1749562415000);

-- tablo yapısı dökülüyor temelpaket.phone_mailaccounts
CREATE TABLE IF NOT EXISTS `phone_mailaccounts` (
  `address` varchar(50) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `password` varchar(60) DEFAULT NULL,
  `photo` varchar(255) DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- temelpaket.phone_mailaccounts: ~3 rows (yaklaşık) tablosu için veriler indiriliyor
DELETE FROM `phone_mailaccounts`;
INSERT INTO `phone_mailaccounts` (`address`, `name`, `password`, `photo`) VALUES
	('hollystore@hollystore.com', 'hollystore', 'hollystore', ''),
	('emreleann@hollystore.com', 'emreleann', 'emreleann', ''),
	('emreleannn@hollystore.com', 'Emre Anal', 'emreleannn', '');

-- tablo yapısı dökülüyor temelpaket.phone_messages
CREATE TABLE IF NOT EXISTS `phone_messages` (
  `from` varchar(255) DEFAULT NULL,
  `to` varchar(255) DEFAULT NULL,
  `message` varchar(512) DEFAULT NULL,
  `attachments` mediumtext DEFAULT NULL,
  `time` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- temelpaket.phone_messages: ~35 rows (yaklaşık) tablosu için veriler indiriliyor
DELETE FROM `phone_messages`;
INSERT INTO `phone_messages` (`from`, `to`, `message`, `attachments`, `time`) VALUES
	('571-4850', '123123123', '123123', '[]', 1748971404244),
	('571-4850', '23123121', 'naber bebek', '[]', 1748991928984),
	('571-4850', 'GROUP-1', 'sa', '[]', 1748991957418),
	('571-4850', '123456', 'sadasd', '[]', 1748995014176),
	('571-4850', '123456', 'asdasd', '[]', 1748995015131),
	('571-4850', '123456', 'asdasd', '[]', 1748995016627),
	('571-4850', '123456', '(GPS:98.013,-1067.462)', '[]', 1749165655808),
	('571-4850', '123456', '(GPS:96.015,-1069.045)', '[]', 1749168296984),
	('571-4850', '234567', '(GPS:152.148,-1034.302)', '[]', 1749168313491),
	('571-4850', '234567', '(GPS:162.465,-1037.614)', '[]', 1749168315802),
	('571-4850', 'asdas', 'anan', '[]', 1749169390571),
	('571-4850', '234567', 'naber', '[]', 1749172984860),
	('571-4850', '5042091969', 'sa', '[]', 1749239769882),
	('571-4850', '50731311', 'naber', '[]', 1749562539087),
	('633-1906', '123123123', 'seasda', '[]', 1749589336273),
	('633-1906', '123123123', '???', '[]', 1749589347626),
	('223-1836', '123123123', 'asdasd', '[]', 1750078309932),
	('5289038', '2315061881', 'selam ', '[]', 1750109463326),
	('5289038', '2315061881', 'ekleme kısmında fotograf bir tık gecikmeli geliyor ', '[]', 1750109473897),
	('5289038', '2315061881', ':)) ', '[]', 1750109475958),
	('5289038', '2315061881', '(GPS:-1518.132,-412.605)', '[]', 1750109478592),
	('5289038', '1911881292', 'sana da selam olsun', '[]', 1750109531805),
	('5289038', 'GROUP-2', '3 insan', '[]', 1750109552816),
	('5289038', '1911881292', 'selam yavrum', '[]', 1750109887473),
	('5289038', '2315061881', 'kilo ver biraz', '[]', 1750109897863),
	('5289038', '571-4850', 'en son kaça olur', '[]', 1750109944096),
	('5289038', '571-4850', 'sana olmaz', '[]', 1750109949231),
	('8556860', '5289038', 'hala satılıksa alıyorum', '[]', 1751236970641),
	('8556860', '5289038', 'selam,', '[]', 1751236974044),
	('8556860', '5289038', '(GPS:-1510.099,-422.257)', '[]', 1751236976519),
	('8556860', '123123', 'asdasd', '[]', 1751237022318),
	('8556860', '571-4850', 'avuykat lazım basım bealda', '[]', 1751237354390),
	('8556860', '571-4850', 'he', '[]', 1751237373257),
	('5289038', '8556860', 'sagolasın askım ', '[]', 1751457555869),
	('5043350', '8556860', 'ananı sıkıym ', '[]', 1752530858236);

-- tablo yapısı dökülüyor temelpaket.phone_transactions
CREATE TABLE IF NOT EXISTS `phone_transactions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `from` varchar(255) DEFAULT NULL,
  `to` varchar(255) DEFAULT NULL,
  `amount` int(11) NOT NULL DEFAULT 0,
  `time` bigint(20) DEFAULT NULL,
  `reason` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- temelpaket.phone_transactions: ~0 rows (yaklaşık) tablosu için veriler indiriliyor
DELETE FROM `phone_transactions`;

-- tablo yapısı dökülüyor temelpaket.phone_tweets
CREATE TABLE IF NOT EXISTS `phone_tweets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `reply` int(11) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `author` varchar(255) DEFAULT NULL,
  `authorimg` varchar(255) DEFAULT NULL,
  `authorrank` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `content` varchar(255) DEFAULT NULL,
  `image` varchar(255) NOT NULL DEFAULT '',
  `views` int(11) NOT NULL DEFAULT 0,
  `likes` int(11) NOT NULL DEFAULT 0,
  `time` bigint(20) DEFAULT NULL,
  `likers` longtext DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- temelpaket.phone_tweets: ~14 rows (yaklaşık) tablosu için veriler indiriliyor
DELETE FROM `phone_tweets`;
INSERT INTO `phone_tweets` (`id`, `reply`, `email`, `author`, `authorimg`, `authorrank`, `title`, `content`, `image`, `views`, `likes`, `time`, `likers`) VALUES
	(1, NULL, 'hollystore@hollystore.com', 'hollystore', '', 'default', NULL, 'hollyborn temel paketi mi?', 'https://files.fivemerr.com/images/e88d0435-1217-4a48-a2a1-035351769578.jpg', 3, 0, 1748906476000, NULL),
	(2, NULL, 'hollystore@hollystore.com', 'emreleann', 'https://files.fivemerr.com/images/c3bfeccf-b5f0-4c89-aeb6-ef9575ecebcd.jpg', 'default', NULL, 'işte bu gerçekten harika!', '', 2, 0, 1748906511000, NULL),
	(3, NULL, 'hollystore@hollystore.com', 'emreleann', 'https://files.fivemerr.com/images/c3bfeccf-b5f0-4c89-aeb6-ef9575ecebcd.jpg', 'default', NULL, 'asdasd', '', 2, 0, 1749249957000, NULL),
	(4, NULL, 'hollystore@hollystore.com', 'emreleann', 'https://files.fivemerr.com/images/c3bfeccf-b5f0-4c89-aeb6-ef9575ecebcd.jpg', 'default', NULL, 'asdasd', '', 2, 0, 1749249959000, NULL),
	(5, NULL, 'hollystore@hollystore.com', 'emreleann', 'https://files.fivemerr.com/images/c3bfeccf-b5f0-4c89-aeb6-ef9575ecebcd.jpg', 'default', NULL, 'asdasdasdasda', '', 0, 0, 1749510392000, NULL),
	(6, NULL, 'emrealan@hollystore.com', 'emrealan', 'https://files.fivemerr.com/images/8087a740-c37c-48aa-8fa5-a81b55ea5ef1.jpg', 'default', NULL, 'demiri seviyorum ya ', '', 0, 0, 1750109678000, NULL),
	(7, NULL, 'emrealan@hollystore.com', 'emrealan', 'https://files.fivemerr.com/images/8087a740-c37c-48aa-8fa5-a81b55ea5ef1.jpg', 'default', NULL, 'ama emreleann daha iyi :)', 'https://files.fivemerr.com/images/8ade65fb-0f35-4e37-aea1-80ffc9fbbfc6.jpg', 0, 0, 1750109694000, NULL),
	(8, NULL, 'emreleannn@hollystore.com', 'emreleannn', '', 'default', NULL, 'selam güzellik', 'https://files.fivemerr.com/images/8ade65fb-0f35-4e37-aea1-80ffc9fbbfc6.jpg', 0, 0, 1750110105000, NULL),
	(9, NULL, 'emreleannn@hollystore.com', 'emreleannn', '', 'default', NULL, 'ne bu demirin g****', 'https://files.fivemerr.com/images/eb9be45e-0538-4376-b154-a91e2ef9813f.jpg', 0, 0, 1750110296000, NULL),
	(10, NULL, 'hollystore@hollystore.com', 'emreleann', 'https://files.fivemerr.com/images/eb911186-dce6-4ced-b5dd-f3e13c245d44.jpg', 'default', NULL, 'asdasdas', 'https://files.fivemerr.com/images/ec0bf7ff-78f5-4f17-9e11-07934050f90d.jpg', 0, 0, 1750884109000, NULL),
	(11, NULL, 'hollystore@hollystore.com', 'emreleann', 'https://files.fivemerr.com/images/eb911186-dce6-4ced-b5dd-f3e13c245d44.jpg', 'default', 'asdasdas', 'asdasdasd', '', 0, 0, 1751234163000, NULL),
	(12, 9, 'mikeshawn@hollystore.com', 'mikeshawn', '', 'default', NULL, 'demirimle oynaşmöayın lütfen', '', 0, 0, 1751237544000, NULL),
	(13, NULL, 'mikeshawn@hollystore.com', 'DEMİRİM DE DEMİR', 'https://files.fivemerr.com/images/ec0bf7ff-78f5-4f17-9e11-07934050f90d.jpg', 'default', NULL, 'selam insanlar', 'https://files.fivemerr.com/images/925c79bd-e8ac-40e0-a58b-5dc95c116753.jpg', 0, 0, 1751237579000, NULL),
	(14, NULL, 'hollystore@hollystore.com', 'emreleann', 'https://files.fivemerr.com/images/eb911186-dce6-4ced-b5dd-f3e13c245d44.jpg', 'default', NULL, 'selam dunya', 'https://files.fivemerr.com/images/098c8a89-95fd-49aa-8ed5-3782db39143b.jpg', 0, 0, 1751710098000, NULL);

-- tablo yapısı dökülüyor temelpaket.phone_twitteraccounts
CREATE TABLE IF NOT EXISTS `phone_twitteraccounts` (
  `nickname` varchar(50) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `password` varchar(60) DEFAULT NULL,
  `picture` varchar(512) DEFAULT NULL,
  `rank` varchar(50) NOT NULL DEFAULT 'default'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- temelpaket.phone_twitteraccounts: ~4 rows (yaklaşık) tablosu için veriler indiriliyor
DELETE FROM `phone_twitteraccounts`;
INSERT INTO `phone_twitteraccounts` (`nickname`, `email`, `password`, `picture`, `rank`) VALUES
	('emreleann', 'hollystore@hollystore.com', 'hollystore', 'https://files.fivemerr.com/images/eb911186-dce6-4ced-b5dd-f3e13c245d44.jpg', 'default'),
	('emrealan', 'emrealan@hollystore.com', 'emrealan', 'https://files.fivemerr.com/images/8087a740-c37c-48aa-8fa5-a81b55ea5ef1.jpg', 'default'),
	('emreleannn', 'emreleannn@hollystore.com', 'emreleannn', NULL, 'default'),
	('DEMİRİM DE DEMİR', 'mikeshawn@hollystore.com', 'mikeshawn', 'https://files.fivemerr.com/images/ec0bf7ff-78f5-4f17-9e11-07934050f90d.jpg', 'default');

-- tablo yapısı dökülüyor temelpaket.players
CREATE TABLE IF NOT EXISTS `players` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `citizenid` varchar(11) NOT NULL,
  `cid` int(11) DEFAULT NULL,
  `license` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `money` text NOT NULL,
  `charinfo` text DEFAULT NULL,
  `job` text NOT NULL,
  `gang` text DEFAULT NULL,
  `position` text NOT NULL,
  `metadata` text NOT NULL,
  `skin` longtext DEFAULT NULL,
  `inventory` longtext DEFAULT NULL,
  `last_updated` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `last_seen` bigint(20) DEFAULT NULL,
  `iban` varchar(255) DEFAULT NULL,
  `pincode` int(50) DEFAULT NULL,
  `phone` varchar(50) DEFAULT NULL,
  `twitteraccount` varchar(50) DEFAULT NULL,
  `settings` longtext DEFAULT NULL,
  `calls` longtext DEFAULT NULL,
  `notes` longtext DEFAULT NULL,
  `photos` longtext DEFAULT NULL,
  `darkchatuser` mediumtext DEFAULT NULL,
  `mailaccount` varchar(50) DEFAULT NULL,
  `logged_in` tinyint(1) DEFAULT 0,
  PRIMARY KEY (`citizenid`),
  KEY `id` (`id`),
  KEY `last_updated` (`last_updated`),
  KEY `license` (`license`)
) ENGINE=InnoDB AUTO_INCREMENT=4086 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- temelpaket.players: ~3 rows (yaklaşık) tablosu için veriler indiriliyor
DELETE FROM `players`;
INSERT INTO `players` (`id`, `citizenid`, `cid`, `license`, `name`, `money`, `charinfo`, `job`, `gang`, `position`, `metadata`, `skin`, `inventory`, `last_updated`, `last_seen`, `iban`, `pincode`, `phone`, `twitteraccount`, `settings`, `calls`, `notes`, `photos`, `darkchatuser`, `mailaccount`, `logged_in`) VALUES
	(4032, 'DZQ11286', 0, 'license:d91243c901cd9d58c601cee7c6e6deddb54d616c', 'emreleann', '{"crypto":0,"bank":6700,"cash":500}', '{"lastname":"Sarı","account":"US01QBCore6991541950","gender":"male","cid":0,"birthdate":"1991-01-19","phone":"3542651490","nationality":"Türkiye","firstname":"Kayahan"}', '{"name":"mechanic","type":"mechanic","onduty":true,"label":"LS Customs","payment":100,"grade":{"name":"Experienced","payment":100,"isboss":false,"level":2},"isboss":false}', '{"label":"No Gang","name":"none","grade":{"name":"Unaffiliated","level":0,"isboss":false},"isboss":false}', '{"x":-91.42417907714844,"y":-1197.99560546875,"z":27.1904296875}', '{"injail":0,"bloodtype":"O-","jailitems":[],"status":[],"criminalrecord":{"hasRecord":false},"ishandcuffed":false,"vehicleKeys":{"88JCT830":true,"69YTM470":true},"inside":{"apartment":[]},"armor":0,"tracker":false,"rep":[],"inlaststand":false,"callsign":"NO CALLSIGN","fingerprint":"AJ487L62ABD4850","hunger":91.6,"licences":{"driver":true,"business":false,"weapon":false},"stress":0,"phonedata":{"SerialNumber":32308186,"InstalledApps":[]},"isdead":false,"thirst":92.4,"walletid":"QB-22775433","phone":[]}', NULL, '[{"info":[],"type":"item","slot":1,"amount":1,"name":"white_phone"},{"info":{"firstname":"Kayahan","citizenid":"DZQ11286","gender":"male","lastname":"Sarı","nationality":"Türkiye","birthdate":"1991-01-19"},"type":"item","slot":2,"amount":1,"name":"id_card"},{"info":{"lastname":"Sarı","firstname":"Kayahan","birthdate":"1991-01-19","type":"Class C Driver License"},"type":"item","slot":3,"amount":1,"name":"driver_license"}]', '2025-07-15 19:06:40', NULL, NULL, NULL, '1917791', NULL, '{"anonymous":{"type":"checkbox","value":false},"position":{"type":"invisible","value":[]},"ringtone":{"type":"url","value":""},"airplane":{"type":"checkbox","value":false},"darkmode":{"type":"checkbox","value":true},"brightness":{"type":"slider","value":100},"twtnotifications":{"type":"invisible","value":true},"group_messaging":{"type":"checkbox","value":true},"background":{"type":"url","value":""},"lockbackground":{"type":"url","value":""},"sounds":{"type":"slider","value":100},"size":{"type":"slider","value":50},"airdrop":{"type":"checkbox","value":true},"downloadedapps":{"type":"invisible","value":[]},"mailnotifications":{"type":"invisible","value":true},"adsnotifications":{"type":"invisible","value":true}}', NULL, NULL, NULL, NULL, NULL, 0),
	(3740, 'GEM97486', 1, 'license:d91243c901cd9d58c601cee7c6e6deddb54d616c', 'emreleann', '{"crypto":0,"cash":500,"bank":5037}', '{"cid":"1","firstname":"Emre","nationality":"USA","lastname":"Alan","birthdate":"1991-12-09","account":"US08QBCore3710204361","phone":"5456326997","gender":0}', '{"name":"mechanic","onduty":true,"isboss":false,"grade":{"level":1,"name":"Novice","isboss":false,"payment":75},"label":"LS Customs","type":"mechanic"}', '{"grade":{"level":0,"name":"Unaffiliated","isboss":false},"name":"none","label":"No Gang","isboss":false}', '{"x":170.7956085205078,"y":7030.4833984375,"z":3.2637939453125}', '{"tracker":false,"armor":0,"vehicleKeys":{"62BZF967":true,"07JHO705":true,"46OQE340":true,"42FDF999":true,"00RGT869":true,"22IDK137":true,"01NBU109":true,"60DUW647":true,"60FBK820":true,"65MHX622":true,"86ZFZ686":true,"48GTV937":true,"85KXU523":true},"injail":0,"walletid":"QB-65770308","rep":[],"status":[],"ishandcuffed":false,"stress":0,"callsign":"NO CALLSIGN","bloodtype":"AB+","sleeveValue":15,"criminalrecord":{"hasRecord":false},"inside":{"apartment":[]},"isdead":false,"phone":[],"inlaststand":false,"hunger":95.8,"phonedata":{"InstalledApps":[],"SerialNumber":99842759},"fingerprint":"Xp990t99kJb7626","licences":{"weapon":false,"driver":true,"business":false},"thirst":96.2,"jailitems":[]}', NULL, '[{"name":"weapon_combatpistol","slot":1,"type":"weapon","amount":1,"info":{"ammo":12,"quality":98.65,"serie":"78QwO5pE932Emmc"}},{"name":"pistol_ammo","slot":2,"type":"item","amount":9,"info":[]},{"name":"cash","slot":4,"type":"item","amount":211,"info":[]}]', '2025-07-15 11:13:51', NULL, 'HB291521', NULL, '6528677', NULL, '{"brightness":{"value":100,"type":"slider"},"darkmode":{"value":true,"type":"checkbox"},"twtnotifications":{"value":true,"type":"invisible"},"airdrop":{"value":true,"type":"checkbox"},"background":{"value":"","type":"url"},"ringtone":{"value":"","type":"url"},"lockbackground":{"value":"","type":"url"},"anonymous":{"value":false,"type":"checkbox"},"downloadedapps":{"value":[],"type":"invisible"},"size":{"value":50,"type":"slider"},"airplane":{"value":false,"type":"checkbox"},"sounds":{"value":100,"type":"slider"},"adsnotifications":{"value":true,"type":"invisible"},"position":{"value":[],"type":"invisible"},"group_messaging":{"value":true,"type":"checkbox"},"mailnotifications":{"value":true,"type":"invisible"}}', NULL, NULL, NULL, NULL, NULL, 0),
	(4043, 'YZW70066', -1, 'license:d91243c901cd9d58c601cee7c6e6deddb54d616c', 'emreleann', '{"crypto":0,"bank":5000,"cash":500}', '{"nationality":"USA","account":"US03QBCore7055978380","gender":"male","firstname":"Mike","birthdate":"1991-10-11","phone":"1521418810","cid":-1,"lastname":"Shawn"}', '{"name":"police","onduty":true,"label":"Law Enforcement","isboss":false,"grade":{"name":"Lieutenant","payment":125,"isboss":false,"level":3},"type":"leo"}', '{"name":"none","label":"No Gang Affiliation","grade":{"name":"none","level":0},"isboss":false}', '{"x":-1063.84619140625,"y":-2691.322998046875,"z":13.811767578125}', '{"injail":0,"bloodtype":"O+","jailitems":[],"status":[],"criminalrecord":{"hasRecord":false},"ishandcuffed":false,"inside":{"apartment":[]},"armor":0,"fingerprint":"nc938a85zJM9990","rep":[],"inlaststand":false,"phone":[],"callsign":"NO CALLSIGN","hunger":95.8,"licences":{"business":false,"driver":true,"weapon":false},"stress":0,"phonedata":{"SerialNumber":54531671,"InstalledApps":[]},"isdead":false,"thirst":96.2,"walletid":"QB-41204101","tracker":false}', NULL, '[{"info":{"lastname":"Shawn","firstname":"Mike","birthdate":"1991-10-11","type":"Class C Driver License"},"type":"item","slot":1,"amount":1,"name":"driver_license"},{"info":{"firstname":"Mike","citizenid":"YZW70066","gender":"male","lastname":"Shawn","nationality":"USA","birthdate":"1991-10-11"},"type":"item","slot":2,"amount":1,"name":"id_card"},{"info":[],"type":"item","slot":3,"amount":990,"name":"cash"},{"info":[],"type":"item","slot":8,"amount":1,"name":"red_phone"}]', '2025-07-15 16:17:29', NULL, NULL, NULL, '6419847', NULL, '{"twtnotifications":{"type":"invisible","value":true},"background":{"type":"url","value":""},"brightness":{"type":"slider","value":100},"size":{"type":"slider","value":30},"darkmode":{"type":"checkbox","value":true},"anonymous":{"type":"checkbox","value":false},"mailnotifications":{"type":"invisible","value":true},"group_messaging":{"type":"checkbox","value":true},"lockbackground":{"type":"url","value":""},"position":{"type":"invisible","value":[]},"downloadedapps":{"type":"invisible","value":[]},"sounds":{"type":"slider","value":100},"adsnotifications":{"type":"invisible","value":true},"airdrop":{"type":"checkbox","value":true},"ringtone":{"type":"url","value":""},"airplane":{"type":"checkbox","value":false}}', NULL, NULL, NULL, NULL, NULL, 0);

-- tablo yapısı dökülüyor temelpaket.playerskins
CREATE TABLE IF NOT EXISTS `playerskins` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `citizenid` varchar(11) NOT NULL,
  `model` varchar(255) NOT NULL,
  `skin` text NOT NULL,
  `active` tinyint(4) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`),
  KEY `citizenid` (`citizenid`),
  KEY `active` (`active`)
) ENGINE=InnoDB AUTO_INCREMENT=105 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- temelpaket.playerskins: ~22 rows (yaklaşık) tablosu için veriler indiriliyor
DELETE FROM `playerskins`;
INSERT INTO `playerskins` (`id`, `citizenid`, `model`, `skin`, `active`) VALUES
	(33, 'JUN38059', 'mp_m_freemode_01', '{"headOverlays":{"sunDamage":{"style":0,"opacity":0,"color":0,"secondColor":0},"lipstick":{"style":0,"opacity":0,"color":0,"secondColor":0},"makeUp":{"style":0,"opacity":0,"color":0,"secondColor":0},"chestHair":{"style":0,"opacity":0,"color":0,"secondColor":0},"beard":{"style":0,"opacity":0,"color":0,"secondColor":0},"blemishes":{"style":0,"opacity":0,"color":0,"secondColor":0},"blush":{"style":0,"opacity":0,"color":0,"secondColor":0},"moleAndFreckles":{"style":0,"opacity":0,"color":0,"secondColor":0},"eyebrows":{"style":0,"opacity":0,"color":0,"secondColor":0},"complexion":{"style":0,"opacity":0,"color":0,"secondColor":0},"ageing":{"style":0,"opacity":0,"color":0,"secondColor":0},"bodyBlemishes":{"style":0,"opacity":0,"color":0,"secondColor":0}},"props":[{"texture":-1,"prop_id":0,"drawable":-1},{"texture":-1,"prop_id":1,"drawable":-1},{"texture":-1,"prop_id":2,"drawable":-1},{"texture":-1,"prop_id":6,"drawable":-1},{"texture":-1,"prop_id":7,"drawable":-1}],"eyeColor":0,"components":[{"component_id":0,"texture":0,"drawable":0},{"component_id":1,"texture":0,"drawable":0},{"component_id":2,"texture":0,"drawable":0},{"component_id":3,"texture":0,"drawable":15},{"component_id":4,"texture":0,"drawable":21},{"component_id":5,"texture":0,"drawable":0},{"component_id":6,"texture":0,"drawable":34},{"component_id":7,"texture":0,"drawable":0},{"component_id":8,"texture":0,"drawable":15},{"component_id":9,"texture":0,"drawable":0},{"component_id":10,"texture":0,"drawable":0},{"component_id":11,"texture":3,"drawable":111}],"model":"mp_m_freemode_01","headBlend":{"skinMix":0.0,"shapeSecond":0,"shapeMix":0.0,"thirdMix":0.0,"shapeThird":0,"shapeFirst":0,"skinThird":0,"skinSecond":0,"skinFirst":0},"tattoos":[],"hair":{"style":0,"highlight":0,"color":0,"texture":0},"faceFeatures":{"chinBoneLowering":0.0,"eyesOpening":0.0,"neckThickness":0.0,"nosePeakSize":0.0,"jawBoneBackSize":0.0,"chinBoneSize":0.0,"eyeBrownForward":0.0,"eyeBrownHigh":0.0,"nosePeakHigh":0.0,"nosePeakLowering":0.0,"noseBoneTwist":0.0,"chinHole":0.0,"noseWidth":0.0,"cheeksWidth":0.0,"jawBoneWidth":0.0,"cheeksBoneHigh":0.0,"chinBoneLenght":0.0,"noseBoneHigh":0.0,"cheeksBoneWidth":0.0,"lipsThickness":0.0}}', 1),
	(48, 'DGD89711', 'mp_m_freemode_01', '{"faceFeatures":{"noseBoneHigh":0.0,"chinBoneLenght":0.0,"nosePeakLowering":0.0,"nosePeakHigh":0.0,"cheeksBoneHigh":0.0,"lipsThickness":0.0,"chinHole":0.0,"chinBoneSize":0.0,"chinBoneLowering":0.0,"cheeksWidth":0.0,"nosePeakSize":0.0,"noseBoneTwist":0.0,"eyesOpening":0.0,"jawBoneBackSize":0.0,"jawBoneWidth":0.0,"eyeBrownHigh":0.0,"noseWidth":0.0,"neckThickness":0.0,"eyeBrownForward":0.0,"cheeksBoneWidth":0.0},"hair":{"texture":0,"color":0,"style":0,"highlight":0},"headBlend":{"skinSecond":0,"shapeSecond":0,"skinMix":0.0,"skinFirst":0,"thirdMix":0.0,"shapeFirst":0,"shapeThird":0,"shapeMix":0.0,"skinThird":0},"eyeColor":0,"tattoos":[],"props":[{"prop_id":0,"drawable":-1,"texture":-1},{"prop_id":1,"drawable":-1,"texture":-1},{"prop_id":2,"drawable":-1,"texture":-1},{"prop_id":6,"drawable":-1,"texture":-1},{"prop_id":7,"drawable":-1,"texture":-1}],"components":[{"drawable":0,"component_id":0,"texture":0},{"drawable":0,"component_id":1,"texture":0},{"drawable":0,"component_id":2,"texture":0},{"drawable":0,"component_id":3,"texture":0},{"drawable":0,"component_id":4,"texture":0},{"drawable":0,"component_id":5,"texture":0},{"drawable":0,"component_id":6,"texture":0},{"drawable":0,"component_id":7,"texture":0},{"drawable":0,"component_id":8,"texture":0},{"drawable":0,"component_id":9,"texture":0},{"drawable":0,"component_id":10,"texture":0},{"drawable":0,"component_id":11,"texture":0}],"headOverlays":{"blush":{"secondColor":0,"opacity":0,"style":0,"color":0},"chestHair":{"secondColor":0,"opacity":0,"style":0,"color":0},"complexion":{"secondColor":0,"opacity":0,"style":0,"color":0},"bodyBlemishes":{"secondColor":0,"opacity":0,"style":0,"color":0},"sunDamage":{"secondColor":0,"opacity":0,"style":0,"color":0},"makeUp":{"secondColor":0,"opacity":0,"style":0,"color":0},"lipstick":{"secondColor":0,"opacity":0,"style":0,"color":0},"beard":{"secondColor":0,"opacity":0,"style":0,"color":0},"eyebrows":{"secondColor":0,"opacity":0,"style":0,"color":0},"moleAndFreckles":{"secondColor":0,"opacity":0,"style":0,"color":0},"ageing":{"secondColor":0,"opacity":0,"style":0,"color":0},"blemishes":{"secondColor":0,"opacity":0,"style":0,"color":0}},"model":"mp_m_freemode_01"}', 1),
	(50, 'SYC82047', 'mp_m_freemode_01', '{"headBlend":{"shapeMix":0.0,"shapeSecond":0,"skinThird":0,"skinMix":0.0,"shapeFirst":0,"thirdMix":0.0,"skinSecond":0,"skinFirst":0,"shapeThird":0},"props":[{"texture":-1,"drawable":-1,"prop_id":0},{"texture":-1,"drawable":-1,"prop_id":1},{"texture":-1,"drawable":-1,"prop_id":2},{"texture":-1,"drawable":-1,"prop_id":6},{"texture":-1,"drawable":-1,"prop_id":7}],"headOverlays":{"lipstick":{"color":0,"style":0,"secondColor":0,"opacity":0},"complexion":{"color":0,"style":0,"secondColor":0,"opacity":0},"beard":{"color":0,"style":0,"secondColor":0,"opacity":0},"sunDamage":{"color":0,"style":0,"secondColor":0,"opacity":0},"blemishes":{"color":0,"style":0,"secondColor":0,"opacity":0},"eyebrows":{"color":0,"style":0,"secondColor":0,"opacity":0},"chestHair":{"color":0,"style":0,"secondColor":0,"opacity":0},"makeUp":{"color":0,"style":0,"secondColor":0,"opacity":0},"bodyBlemishes":{"color":0,"style":0,"secondColor":0,"opacity":0},"ageing":{"color":0,"style":0,"secondColor":0,"opacity":0},"moleAndFreckles":{"color":0,"style":0,"secondColor":0,"opacity":0},"blush":{"color":0,"style":0,"secondColor":0,"opacity":0}},"faceFeatures":{"noseWidth":0.0,"chinBoneLenght":0.0,"eyeBrownHigh":0.0,"nosePeakHigh":0.0,"neckThickness":0.0,"chinHole":0.0,"cheeksBoneWidth":0.0,"noseBoneTwist":0.0,"eyeBrownForward":0.0,"chinBoneLowering":0.0,"nosePeakSize":0.0,"noseBoneHigh":0.0,"lipsThickness":0.0,"jawBoneBackSize":0.0,"cheeksWidth":0.0,"jawBoneWidth":0.0,"nosePeakLowering":0.0,"eyesOpening":0.0,"chinBoneSize":0.0,"cheeksBoneHigh":0.0},"hair":{"color":0,"style":0,"highlight":0,"texture":0},"tattoos":[],"eyeColor":0,"components":[{"texture":0,"drawable":0,"component_id":0},{"texture":0,"drawable":0,"component_id":1},{"texture":0,"drawable":0,"component_id":2},{"texture":0,"drawable":15,"component_id":3},{"texture":0,"drawable":21,"component_id":4},{"texture":0,"drawable":0,"component_id":5},{"texture":0,"drawable":34,"component_id":6},{"texture":0,"drawable":0,"component_id":7},{"texture":0,"drawable":15,"component_id":8},{"texture":0,"drawable":0,"component_id":9},{"texture":0,"drawable":0,"component_id":10},{"texture":0,"drawable":0,"component_id":11}],"model":"mp_m_freemode_01"}', 1),
	(56, 'HDM14341', 'mp_m_freemode_01', '{"tattoos":[],"props":[{"prop_id":0,"drawable":-1,"texture":-1},{"prop_id":1,"drawable":-1,"texture":-1},{"prop_id":2,"drawable":-1,"texture":-1},{"prop_id":6,"drawable":-1,"texture":-1},{"prop_id":7,"drawable":-1,"texture":-1}],"components":[{"drawable":0,"texture":0,"component_id":0},{"drawable":0,"texture":0,"component_id":1},{"drawable":0,"texture":0,"component_id":2},{"drawable":15,"texture":0,"component_id":3},{"drawable":0,"texture":0,"component_id":4},{"drawable":0,"texture":0,"component_id":5},{"drawable":34,"texture":0,"component_id":6},{"drawable":0,"texture":0,"component_id":7},{"drawable":15,"texture":0,"component_id":8},{"drawable":0,"texture":0,"component_id":9},{"drawable":0,"texture":0,"component_id":10},{"drawable":0,"texture":0,"component_id":11}],"model":"mp_m_freemode_01","faceFeatures":{"chinBoneLowering":0.0,"nosePeakLowering":0.0,"cheeksBoneWidth":0.0,"nosePeakSize":0.0,"noseBoneTwist":0.0,"chinHole":0.0,"nosePeakHigh":0.0,"cheeksBoneHigh":0.0,"jawBoneBackSize":0.0,"eyesOpening":0.0,"noseBoneHigh":0.0,"jawBoneWidth":0.0,"chinBoneLenght":0.0,"chinBoneSize":0.0,"lipsThickness":0.0,"neckThickness":0.0,"noseWidth":0.0,"cheeksWidth":0.0,"eyeBrownForward":0.0,"eyeBrownHigh":0.0},"hair":{"color":0,"highlight":0,"style":0,"texture":0},"headOverlays":{"blush":{"secondColor":0,"style":0,"color":0,"opacity":0},"beard":{"secondColor":0,"style":0,"color":0,"opacity":0},"blemishes":{"secondColor":0,"style":0,"color":0,"opacity":0},"lipstick":{"secondColor":0,"style":0,"color":0,"opacity":0},"bodyBlemishes":{"secondColor":0,"style":0,"color":0,"opacity":0},"moleAndFreckles":{"secondColor":0,"style":0,"color":0,"opacity":0},"eyebrows":{"secondColor":0,"style":0,"color":0,"opacity":0},"sunDamage":{"secondColor":0,"style":0,"color":0,"opacity":0},"makeUp":{"secondColor":0,"style":0,"color":0,"opacity":0},"chestHair":{"secondColor":0,"style":0,"color":0,"opacity":0},"complexion":{"secondColor":0,"style":0,"color":0,"opacity":0},"ageing":{"secondColor":0,"style":0,"color":0,"opacity":0}},"headBlend":{"shapeFirst":0,"skinMix":0.0,"shapeSecond":0,"skinFirst":0,"skinThird":0,"shapeThird":0,"shapeMix":0.0,"skinSecond":0,"thirdMix":0.0},"eyeColor":0}', 1),
	(58, 'JXZ09125', 'mp_f_freemode_01', '{"hair":{"color":0,"highlight":0,"style":0,"texture":0},"eyeColor":0,"headBlend":{"skinThird":0,"shapeMix":0.3,"shapeFirst":45,"thirdMix":0.0,"skinMix":0.1,"skinSecond":15,"shapeSecond":21,"shapeThird":0,"skinFirst":20},"model":"mp_f_freemode_01","tattoos":[],"components":[{"drawable":0,"texture":0,"component_id":0},{"drawable":0,"texture":0,"component_id":1},{"drawable":0,"texture":0,"component_id":2},{"drawable":15,"texture":0,"component_id":3},{"drawable":0,"texture":0,"component_id":4},{"drawable":0,"texture":0,"component_id":5},{"drawable":35,"texture":0,"component_id":6},{"drawable":0,"texture":0,"component_id":7},{"drawable":15,"texture":0,"component_id":8},{"drawable":0,"texture":0,"component_id":9},{"drawable":0,"texture":0,"component_id":10},{"drawable":0,"texture":0,"component_id":11}],"props":[{"drawable":-1,"prop_id":0,"texture":-1},{"drawable":-1,"prop_id":1,"texture":-1},{"drawable":-1,"prop_id":2,"texture":-1},{"drawable":-1,"prop_id":6,"texture":-1},{"drawable":-1,"prop_id":7,"texture":-1}],"headOverlays":{"complexion":{"color":0,"opacity":0,"secondColor":0,"style":0},"blush":{"color":0,"opacity":0,"secondColor":0,"style":0},"lipstick":{"color":0,"opacity":0,"secondColor":0,"style":0},"ageing":{"color":0,"opacity":0,"secondColor":0,"style":0},"makeUp":{"color":0,"opacity":0,"secondColor":0,"style":0},"chestHair":{"color":0,"opacity":0,"secondColor":0,"style":0},"beard":{"color":0,"opacity":0,"secondColor":0,"style":0},"moleAndFreckles":{"color":0,"opacity":0,"secondColor":0,"style":0},"eyebrows":{"color":0,"opacity":0,"secondColor":0,"style":0},"sunDamage":{"color":0,"opacity":0,"secondColor":0,"style":0},"blemishes":{"color":0,"opacity":0,"secondColor":0,"style":0},"bodyBlemishes":{"color":0,"opacity":0,"secondColor":0,"style":0}},"faceFeatures":{"neckThickness":0.0,"cheeksBoneHigh":0.0,"nosePeakSize":0.0,"eyeBrownForward":0.0,"lipsThickness":0.0,"chinBoneSize":0.0,"noseBoneTwist":0.0,"noseBoneHigh":0.0,"eyeBrownHigh":0.0,"noseWidth":0.0,"chinBoneLowering":0.0,"eyesOpening":0.0,"jawBoneWidth":0.0,"cheeksBoneWidth":0.0,"chinBoneLenght":0.0,"jawBoneBackSize":0.0,"nosePeakHigh":0.0,"cheeksWidth":0.0,"chinHole":0.0,"nosePeakLowering":0.0}}', 1),
	(59, 'FBW33221', 'mp_m_freemode_01', '{"headBlend":{"skinMix":0.0,"skinFirst":0,"thirdMix":0.0,"shapeSecond":0,"shapeFirst":0,"shapeThird":0,"shapeMix":0.0,"skinThird":0,"skinSecond":0},"hair":{"color":0,"style":0,"texture":0,"highlight":0},"props":[{"prop_id":0,"texture":-1,"drawable":-1},{"prop_id":1,"texture":-1,"drawable":-1},{"prop_id":2,"texture":-1,"drawable":-1},{"prop_id":6,"texture":-1,"drawable":-1},{"prop_id":7,"texture":-1,"drawable":-1}],"model":"mp_m_freemode_01","components":[{"drawable":0,"texture":0,"component_id":0},{"drawable":0,"texture":0,"component_id":1},{"drawable":0,"texture":0,"component_id":2},{"drawable":15,"texture":0,"component_id":3},{"drawable":21,"texture":0,"component_id":4},{"drawable":0,"texture":0,"component_id":5},{"drawable":34,"texture":0,"component_id":6},{"drawable":0,"texture":0,"component_id":7},{"drawable":15,"texture":0,"component_id":8},{"drawable":0,"texture":0,"component_id":9},{"drawable":0,"texture":0,"component_id":10},{"drawable":15,"texture":0,"component_id":11}],"eyeColor":0,"tattoos":[],"headOverlays":{"complexion":{"secondColor":0,"style":0,"opacity":0,"color":0},"chestHair":{"secondColor":0,"style":0,"opacity":0,"color":0},"ageing":{"secondColor":0,"style":0,"opacity":0,"color":0},"blush":{"secondColor":0,"style":0,"opacity":0,"color":0},"moleAndFreckles":{"secondColor":0,"style":0,"opacity":0,"color":0},"beard":{"secondColor":0,"style":0,"opacity":0,"color":0},"bodyBlemishes":{"secondColor":0,"style":0,"opacity":0,"color":0},"eyebrows":{"secondColor":0,"style":0,"opacity":0,"color":0},"sunDamage":{"secondColor":0,"style":0,"opacity":0,"color":0},"makeUp":{"secondColor":0,"style":0,"opacity":0,"color":0},"blemishes":{"secondColor":0,"style":0,"opacity":0,"color":0},"lipstick":{"secondColor":0,"style":0,"opacity":0,"color":0}},"faceFeatures":{"chinHole":0.0,"nosePeakSize":0.0,"jawBoneWidth":0.0,"noseBoneHigh":0.0,"noseBoneTwist":0.0,"chinBoneSize":0.0,"chinBoneLenght":0.0,"neckThickness":0.0,"lipsThickness":0.0,"jawBoneBackSize":0.0,"eyeBrownForward":0.0,"noseWidth":0.0,"eyeBrownHigh":0.0,"nosePeakLowering":0.0,"cheeksBoneHigh":0.0,"nosePeakHigh":0.0,"cheeksWidth":0.0,"chinBoneLowering":0.0,"eyesOpening":0.0,"cheeksBoneWidth":0.0}}', 1),
	(60, 'QWM15616', 'mp_m_freemode_01', '{"props":[{"drawable":-1,"texture":-1,"prop_id":0},{"drawable":-1,"texture":-1,"prop_id":1},{"drawable":-1,"texture":-1,"prop_id":2},{"drawable":-1,"texture":-1,"prop_id":6},{"drawable":-1,"texture":-1,"prop_id":7}],"components":[{"texture":0,"drawable":0,"component_id":0},{"texture":0,"drawable":0,"component_id":1},{"texture":0,"drawable":0,"component_id":2},{"texture":0,"drawable":15,"component_id":3},{"texture":0,"drawable":21,"component_id":4},{"texture":0,"drawable":0,"component_id":5},{"texture":0,"drawable":34,"component_id":6},{"texture":0,"drawable":0,"component_id":7},{"texture":0,"drawable":15,"component_id":8},{"texture":0,"drawable":0,"component_id":9},{"texture":0,"drawable":0,"component_id":10},{"texture":0,"drawable":15,"component_id":11}],"model":"mp_m_freemode_01","faceFeatures":{"chinBoneSize":0.0,"chinBoneLenght":0.0,"lipsThickness":0.0,"noseWidth":0.0,"jawBoneBackSize":0.0,"cheeksWidth":0.0,"chinHole":0.0,"eyesOpening":0.0,"cheeksBoneHigh":0.0,"nosePeakLowering":0.0,"nosePeakSize":0.0,"eyeBrownForward":0.0,"nosePeakHigh":0.0,"noseBoneHigh":0.0,"noseBoneTwist":0.0,"jawBoneWidth":0.0,"neckThickness":0.0,"chinBoneLowering":0.0,"cheeksBoneWidth":0.0,"eyeBrownHigh":0.0},"hair":{"color":0,"highlight":0,"texture":0,"style":0},"headBlend":{"thirdMix":0.0,"shapeThird":0,"skinFirst":0,"shapeSecond":0,"skinThird":0,"shapeFirst":0,"skinMix":0.0,"shapeMix":0.0,"skinSecond":0},"headOverlays":{"chestHair":{"style":0,"secondColor":0,"color":0,"opacity":0},"eyebrows":{"style":0,"secondColor":0,"color":0,"opacity":0},"sunDamage":{"style":0,"secondColor":0,"color":0,"opacity":0},"blush":{"style":0,"secondColor":0,"color":0,"opacity":0},"lipstick":{"style":0,"secondColor":0,"color":0,"opacity":0},"moleAndFreckles":{"style":0,"secondColor":0,"color":0,"opacity":0},"makeUp":{"style":0,"secondColor":0,"color":0,"opacity":0},"complexion":{"style":0,"secondColor":0,"color":0,"opacity":0},"beard":{"style":0,"secondColor":0,"color":0,"opacity":0},"blemishes":{"style":0,"secondColor":0,"color":0,"opacity":0},"ageing":{"style":0,"secondColor":0,"color":0,"opacity":0},"bodyBlemishes":{"style":0,"secondColor":0,"color":0,"opacity":0}},"tattoos":[],"eyeColor":0}', 1),
	(61, 'KQH93442', 'mp_m_freemode_01', '{"components":[{"component_id":0,"texture":0,"drawable":0},{"component_id":1,"texture":0,"drawable":0},{"component_id":2,"texture":0,"drawable":0},{"component_id":3,"texture":0,"drawable":15},{"component_id":4,"texture":0,"drawable":21},{"component_id":5,"texture":0,"drawable":0},{"component_id":6,"texture":0,"drawable":34},{"component_id":7,"texture":0,"drawable":0},{"component_id":8,"texture":0,"drawable":15},{"component_id":9,"texture":0,"drawable":0},{"component_id":10,"texture":0,"drawable":0},{"component_id":11,"texture":0,"drawable":15}],"headOverlays":{"makeUp":{"color":0,"style":0,"opacity":0,"secondColor":0},"ageing":{"color":0,"style":0,"opacity":0,"secondColor":0},"eyebrows":{"color":0,"style":0,"opacity":0,"secondColor":0},"blush":{"color":0,"style":0,"opacity":0,"secondColor":0},"moleAndFreckles":{"color":0,"style":0,"opacity":0,"secondColor":0},"bodyBlemishes":{"color":0,"style":0,"opacity":0,"secondColor":0},"sunDamage":{"color":0,"style":0,"opacity":0,"secondColor":0},"complexion":{"color":0,"style":0,"opacity":0,"secondColor":0},"lipstick":{"color":0,"style":0,"opacity":0,"secondColor":0},"beard":{"color":0,"style":0,"opacity":0,"secondColor":0},"chestHair":{"color":0,"style":0,"opacity":0,"secondColor":0},"blemishes":{"color":0,"style":0,"opacity":0,"secondColor":0}},"tattoos":[],"hair":{"color":0,"texture":0,"style":0,"highlight":0},"faceFeatures":{"chinBoneLenght":0.0,"noseWidth":0.0,"cheeksBoneWidth":0.0,"jawBoneWidth":0.0,"cheeksWidth":0.0,"lipsThickness":0.0,"eyeBrownForward":0.0,"eyesOpening":0.0,"noseBoneHigh":0.0,"chinBoneSize":0.0,"jawBoneBackSize":0.0,"neckThickness":0.0,"cheeksBoneHigh":0.0,"chinBoneLowering":0.0,"chinHole":0.0,"nosePeakHigh":0.0,"noseBoneTwist":0.0,"nosePeakLowering":0.0,"eyeBrownHigh":0.0,"nosePeakSize":0.0},"props":[{"prop_id":0,"texture":-1,"drawable":-1},{"prop_id":1,"texture":-1,"drawable":-1},{"prop_id":2,"texture":-1,"drawable":-1},{"prop_id":6,"texture":-1,"drawable":-1},{"prop_id":7,"texture":-1,"drawable":-1}],"headBlend":{"shapeFirst":0,"skinMix":0.0,"skinFirst":0,"thirdMix":0.0,"shapeMix":0.0,"skinSecond":0,"shapeSecond":0,"shapeThird":0,"skinThird":0},"eyeColor":0,"model":"mp_m_freemode_01"}', 1),
	(62, 'EUU20176', 'mp_m_freemode_01', '{"tattoos":[],"props":[{"texture":-1,"prop_id":0,"drawable":-1},{"texture":-1,"prop_id":1,"drawable":-1},{"texture":-1,"prop_id":2,"drawable":-1},{"texture":-1,"prop_id":6,"drawable":-1},{"texture":-1,"prop_id":7,"drawable":-1}],"components":[{"component_id":0,"texture":0,"drawable":0},{"component_id":1,"texture":0,"drawable":0},{"component_id":2,"texture":0,"drawable":0},{"component_id":3,"texture":0,"drawable":15},{"component_id":4,"texture":0,"drawable":21},{"component_id":5,"texture":0,"drawable":0},{"component_id":6,"texture":0,"drawable":34},{"component_id":7,"texture":0,"drawable":0},{"component_id":8,"texture":0,"drawable":15},{"component_id":9,"texture":0,"drawable":0},{"component_id":10,"texture":0,"drawable":0},{"component_id":11,"texture":0,"drawable":15}],"hair":{"texture":0,"highlight":0,"color":0,"style":0},"eyeColor":0,"headBlend":{"skinFirst":0,"shapeThird":0,"thirdMix":0.0,"skinMix":0.0,"shapeMix":0.0,"shapeFirst":0,"shapeSecond":0,"skinSecond":0,"skinThird":0},"model":"mp_m_freemode_01","headOverlays":{"bodyBlemishes":{"opacity":0,"color":0,"secondColor":0,"style":0},"blush":{"opacity":0,"color":0,"secondColor":0,"style":0},"eyebrows":{"opacity":0,"color":0,"secondColor":0,"style":0},"moleAndFreckles":{"opacity":0,"color":0,"secondColor":0,"style":0},"beard":{"opacity":0,"color":0,"secondColor":0,"style":0},"ageing":{"opacity":0,"color":0,"secondColor":0,"style":0},"chestHair":{"opacity":0,"color":0,"secondColor":0,"style":0},"complexion":{"opacity":0,"color":0,"secondColor":0,"style":0},"blemishes":{"opacity":0,"color":0,"secondColor":0,"style":0},"lipstick":{"opacity":0,"color":0,"secondColor":0,"style":0},"makeUp":{"opacity":0,"color":0,"secondColor":0,"style":0},"sunDamage":{"opacity":0,"color":0,"secondColor":0,"style":0}},"faceFeatures":{"noseBoneHigh":0.0,"eyeBrownForward":0.0,"nosePeakLowering":0.0,"eyesOpening":0.0,"nosePeakSize":0.0,"chinBoneSize":0.0,"noseBoneTwist":0.0,"cheeksBoneWidth":0.0,"noseWidth":0.0,"eyeBrownHigh":0.0,"jawBoneWidth":0.0,"nosePeakHigh":0.0,"chinHole":0.0,"cheeksBoneHigh":0.0,"neckThickness":0.0,"lipsThickness":0.0,"chinBoneLowering":0.0,"jawBoneBackSize":0.0,"cheeksWidth":0.0,"chinBoneLenght":0.0}}', 1),
	(63, 'JBQ59862', 'mp_m_freemode_01', '{"headOverlays":{"blush":{"opacity":0,"secondColor":0,"style":0,"color":0},"sunDamage":{"opacity":0,"secondColor":0,"style":0,"color":0},"makeUp":{"opacity":0,"secondColor":0,"style":0,"color":0},"moleAndFreckles":{"opacity":0,"secondColor":0,"style":0,"color":0},"lipstick":{"opacity":0,"secondColor":0,"style":0,"color":0},"ageing":{"opacity":0,"secondColor":0,"style":0,"color":0},"eyebrows":{"opacity":0,"secondColor":0,"style":0,"color":0},"chestHair":{"opacity":0,"secondColor":0,"style":0,"color":0},"blemishes":{"opacity":0,"secondColor":0,"style":0,"color":0},"complexion":{"opacity":0,"secondColor":0,"style":0,"color":0},"beard":{"opacity":0,"secondColor":0,"style":0,"color":0},"bodyBlemishes":{"opacity":0,"secondColor":0,"style":0,"color":0}},"faceFeatures":{"cheeksWidth":0.0,"noseWidth":0.0,"chinHole":0.0,"chinBoneLenght":0.0,"eyeBrownHigh":0.0,"cheeksBoneWidth":0.0,"nosePeakLowering":0.0,"chinBoneLowering":0.0,"lipsThickness":0.0,"cheeksBoneHigh":0.0,"chinBoneSize":0.0,"nosePeakSize":0.0,"jawBoneWidth":0.0,"eyesOpening":0.0,"jawBoneBackSize":0.0,"noseBoneTwist":0.0,"neckThickness":0.0,"nosePeakHigh":0.0,"noseBoneHigh":0.0,"eyeBrownForward":0.0},"headBlend":{"shapeMix":0.0,"skinThird":0,"skinSecond":0,"shapeSecond":0,"shapeThird":0,"shapeFirst":0,"skinFirst":0,"skinMix":0.0,"thirdMix":0.0},"components":[{"texture":0,"component_id":0,"drawable":0},{"texture":0,"component_id":1,"drawable":0},{"texture":0,"component_id":2,"drawable":0},{"texture":0,"component_id":3,"drawable":15},{"texture":0,"component_id":4,"drawable":21},{"texture":0,"component_id":5,"drawable":0},{"texture":0,"component_id":6,"drawable":34},{"texture":0,"component_id":7,"drawable":0},{"texture":0,"component_id":8,"drawable":15},{"texture":0,"component_id":9,"drawable":0},{"texture":0,"component_id":10,"drawable":0},{"texture":0,"component_id":11,"drawable":15}],"eyeColor":-1,"tattoos":[],"model":"mp_m_freemode_01","hair":{"texture":0,"highlight":0,"style":0,"color":0},"props":[{"texture":-1,"drawable":-1,"prop_id":0},{"texture":-1,"drawable":-1,"prop_id":1},{"texture":-1,"drawable":-1,"prop_id":2},{"texture":-1,"drawable":-1,"prop_id":6},{"texture":-1,"drawable":-1,"prop_id":7}]}', 1),
	(64, 'FMW68507', 'mp_m_freemode_01', '{"headOverlays":{"blush":{"opacity":0,"secondColor":0,"style":0,"color":0},"sunDamage":{"opacity":0,"secondColor":0,"style":0,"color":0},"makeUp":{"opacity":0,"secondColor":0,"style":0,"color":0},"moleAndFreckles":{"opacity":0,"secondColor":0,"style":0,"color":0},"lipstick":{"opacity":0,"secondColor":0,"style":0,"color":0},"ageing":{"opacity":0,"secondColor":0,"style":0,"color":0},"eyebrows":{"opacity":0,"secondColor":0,"style":0,"color":0},"chestHair":{"opacity":0,"secondColor":0,"style":0,"color":0},"blemishes":{"opacity":0,"secondColor":0,"style":0,"color":0},"complexion":{"opacity":0,"secondColor":0,"style":0,"color":0},"beard":{"opacity":0,"secondColor":0,"style":0,"color":0},"bodyBlemishes":{"opacity":0,"secondColor":0,"style":0,"color":0}},"faceFeatures":{"cheeksWidth":0.0,"noseWidth":0.0,"chinHole":0.0,"chinBoneLenght":0.0,"eyeBrownHigh":0.0,"cheeksBoneWidth":0.0,"nosePeakLowering":0.0,"chinBoneLowering":0.0,"lipsThickness":0.0,"cheeksBoneHigh":0.0,"chinBoneSize":0.0,"nosePeakSize":0.0,"jawBoneWidth":0.0,"eyesOpening":0.0,"jawBoneBackSize":0.0,"noseBoneTwist":0.0,"neckThickness":0.0,"nosePeakHigh":0.0,"noseBoneHigh":0.0,"eyeBrownForward":0.0},"headBlend":{"shapeMix":0.0,"skinThird":0,"skinSecond":0,"shapeSecond":0,"shapeThird":0,"shapeFirst":0,"skinFirst":0,"skinMix":0.0,"thirdMix":0.0},"components":[{"texture":0,"component_id":0,"drawable":0},{"texture":0,"component_id":1,"drawable":0},{"texture":0,"component_id":2,"drawable":0},{"texture":0,"component_id":3,"drawable":15},{"texture":0,"component_id":4,"drawable":21},{"texture":0,"component_id":5,"drawable":0},{"texture":0,"component_id":6,"drawable":34},{"texture":0,"component_id":7,"drawable":0},{"texture":0,"component_id":8,"drawable":15},{"texture":0,"component_id":9,"drawable":0},{"texture":0,"component_id":10,"drawable":0},{"texture":0,"component_id":11,"drawable":15}],"eyeColor":-1,"tattoos":[],"model":"mp_m_freemode_01","hair":{"texture":0,"highlight":0,"style":0,"color":0},"props":[{"texture":-1,"drawable":-1,"prop_id":0},{"texture":-1,"drawable":-1,"prop_id":1},{"texture":-1,"drawable":-1,"prop_id":2},{"texture":-1,"drawable":-1,"prop_id":6},{"texture":-1,"drawable":-1,"prop_id":7}]}', 0),
	(65, 'FMW68507', 'u_m_y_fibmugger_01', '{"headOverlays":{"blush":{"opacity":0,"secondColor":0,"style":0,"color":0},"sunDamage":{"opacity":0,"secondColor":0,"style":0,"color":0},"makeUp":{"opacity":0,"secondColor":0,"style":0,"color":0},"moleAndFreckles":{"opacity":0,"secondColor":0,"style":0,"color":0},"lipstick":{"opacity":0,"secondColor":0,"style":0,"color":0},"beard":{"opacity":0,"secondColor":0,"style":0,"color":0},"eyebrows":{"opacity":0,"secondColor":0,"style":0,"color":0},"chestHair":{"opacity":0,"secondColor":0,"style":0,"color":0},"blemishes":{"opacity":0,"secondColor":0,"style":0,"color":0},"ageing":{"opacity":0,"secondColor":0,"style":0,"color":0},"complexion":{"opacity":0,"secondColor":0,"style":0,"color":0},"bodyBlemishes":{"opacity":0,"secondColor":0,"style":0,"color":0}},"faceFeatures":{"cheeksWidth":0,"noseWidth":0,"chinHole":0,"chinBoneLenght":0,"eyeBrownHigh":0,"eyeBrownForward":0,"nosePeakLowering":0,"chinBoneLowering":0,"lipsThickness":0,"cheeksBoneHigh":0,"chinBoneSize":0,"nosePeakSize":0,"jawBoneWidth":0,"neckThickness":0,"jawBoneBackSize":0,"noseBoneTwist":0,"eyesOpening":0,"nosePeakHigh":0,"noseBoneHigh":0,"cheeksBoneWidth":0},"headBlend":{"shapeMix":0,"skinMix":0,"thirdMix":0,"shapeSecond":0,"shapeThird":0,"shapeFirst":0,"skinFirst":0,"skinThird":0,"skinSecond":0},"components":[{"texture":0,"component_id":0,"drawable":0},{"texture":0,"component_id":1,"drawable":0},{"texture":0,"component_id":2,"drawable":0},{"texture":0,"component_id":3,"drawable":0},{"texture":0,"component_id":4,"drawable":0},{"texture":0,"component_id":5,"drawable":0},{"texture":0,"component_id":6,"drawable":0},{"texture":0,"component_id":7,"drawable":0},{"texture":0,"component_id":8,"drawable":0},{"texture":0,"component_id":9,"drawable":0},{"texture":0,"component_id":10,"drawable":0},{"texture":0,"component_id":11,"drawable":0}],"eyeColor":-1,"model":"u_m_y_fibmugger_01","tattoos":[],"hair":{"color":-1,"texture":0,"style":0,"highlight":-1},"props":[{"texture":-1,"drawable":-1,"prop_id":0},{"texture":-1,"drawable":-1,"prop_id":1},{"texture":-1,"drawable":-1,"prop_id":2},{"texture":-1,"drawable":-1,"prop_id":6},{"texture":-1,"drawable":-1,"prop_id":7}]}', 1),
	(72, 'VNJ60175', 'mp_f_freemode_01', '{"faceFeatures":{"eyeBrownForward":0,"nosePeakSize":0,"noseBoneTwist":0,"lipsThickness":0,"nosePeakLowering":0,"jawBoneWidth":0,"eyeBrownHigh":0,"cheeksWidth":0,"chinHole":0,"chinBoneLowering":0,"cheeksBoneHigh":0,"nosePeakHigh":0,"jawBoneBackSize":0,"neckThickness":0,"chinBoneSize":0,"noseWidth":0,"noseBoneHigh":0,"eyesOpening":0,"cheeksBoneWidth":0,"chinBoneLenght":0},"model":"mp_f_freemode_01","eyeColor":0,"headOverlays":{"eyebrows":{"style":0,"secondColor":0,"color":0,"opacity":0},"beard":{"style":0,"secondColor":0,"color":0,"opacity":0},"lipstick":{"style":0,"secondColor":0,"color":0,"opacity":0},"bodyBlemishes":{"style":0,"secondColor":0,"color":0,"opacity":0},"sunDamage":{"style":0,"secondColor":0,"color":0,"opacity":0},"makeUp":{"style":0,"secondColor":0,"color":0,"opacity":0},"complexion":{"style":0,"secondColor":0,"color":0,"opacity":0},"chestHair":{"style":0,"secondColor":0,"color":0,"opacity":0},"blemishes":{"style":0,"secondColor":0,"color":0,"opacity":0},"ageing":{"style":0,"secondColor":0,"color":0,"opacity":0},"moleAndFreckles":{"style":0,"secondColor":0,"color":0,"opacity":0},"blush":{"style":0,"secondColor":0,"color":0,"opacity":0}},"components":[{"texture":0,"drawable":0,"component_id":0},{"texture":0,"drawable":0,"component_id":1},{"texture":0,"drawable":0,"component_id":2},{"texture":0,"drawable":0,"component_id":5},{"texture":0,"drawable":0,"component_id":7},{"texture":0,"drawable":0,"component_id":9},{"texture":0,"drawable":0,"component_id":10},{"texture":0,"drawable":15,"component_id":11},{"texture":0,"drawable":15,"component_id":8},{"texture":0,"drawable":15,"component_id":3},{"texture":0,"drawable":15,"component_id":4},{"texture":0,"drawable":35,"component_id":6}],"hair":{"style":0,"color":0,"texture":0,"highlight":0},"tattoos":[],"props":[{"texture":-1,"drawable":-1,"prop_id":0},{"texture":-1,"drawable":-1,"prop_id":1},{"texture":-1,"drawable":-1,"prop_id":2},{"texture":-1,"drawable":-1,"prop_id":6},{"texture":-1,"drawable":-1,"prop_id":7}],"headBlend":{"shapeSecond":21,"skinThird":0,"skinSecond":15,"shapeMix":0.3,"skinFirst":20,"shapeFirst":45,"shapeThird":0,"thirdMix":0,"skinMix":0.1}}', 0),
	(94, 'OWH73132', 'mp_m_freemode_01', '{"hair":{"color":0,"style":0,"highlight":0,"texture":0},"faceFeatures":{"noseBoneHigh":0,"jawBoneBackSize":0,"nosePeakLowering":0,"nosePeakSize":0,"chinBoneSize":0,"jawBoneWidth":0,"noseBoneTwist":0,"eyeBrownForward":0,"nosePeakHigh":0,"cheeksBoneWidth":0,"cheeksBoneHigh":0,"noseWidth":-0.1,"chinHole":0,"eyesOpening":0,"lipsThickness":0,"eyeBrownHigh":0,"cheeksWidth":0,"chinBoneLenght":0,"chinBoneLowering":0,"neckThickness":0},"eyeColor":0,"components":[{"drawable":0,"component_id":0,"texture":0},{"drawable":0,"component_id":1,"texture":0},{"drawable":0,"component_id":2,"texture":0},{"drawable":4,"component_id":3,"texture":0},{"drawable":0,"component_id":5,"texture":0},{"drawable":36,"component_id":6,"texture":0},{"drawable":0,"component_id":7,"texture":0},{"drawable":15,"component_id":8,"texture":0},{"drawable":0,"component_id":9,"texture":0},{"drawable":0,"component_id":10,"texture":0},{"drawable":111,"component_id":11,"texture":1},{"drawable":23,"component_id":4,"texture":0}],"tattoos":[],"props":[{"prop_id":0,"drawable":-1,"texture":-1},{"prop_id":1,"drawable":-1,"texture":-1},{"prop_id":2,"drawable":-1,"texture":-1},{"prop_id":6,"drawable":-1,"texture":-1},{"prop_id":7,"drawable":-1,"texture":-1}],"model":"mp_m_freemode_01","headBlend":{"shapeThird":0,"skinSecond":0,"thirdMix":0,"shapeSecond":0,"shapeMix":0,"skinThird":0,"skinFirst":0,"shapeFirst":24,"skinMix":0},"headOverlays":{"blemishes":{"color":0,"style":0,"secondColor":0,"opacity":0},"blush":{"color":0,"style":0,"secondColor":0,"opacity":0},"ageing":{"color":0,"style":0,"secondColor":0,"opacity":0},"moleAndFreckles":{"color":0,"style":0,"secondColor":0,"opacity":0},"complexion":{"color":0,"style":0,"secondColor":0,"opacity":0},"lipstick":{"color":0,"style":0,"secondColor":0,"opacity":0},"sunDamage":{"color":0,"style":0,"secondColor":0,"opacity":0},"beard":{"color":0,"style":0,"secondColor":0,"opacity":0},"eyebrows":{"color":0,"style":0,"secondColor":0,"opacity":0},"chestHair":{"color":0,"style":0,"secondColor":0,"opacity":1},"makeUp":{"color":0,"style":0,"secondColor":0,"opacity":0},"bodyBlemishes":{"color":0,"style":0,"secondColor":0,"opacity":0}}}', 1),
	(97, 'SRO73474', 'mp_m_freemode_01', '{"hair":{"color":0,"style":0,"highlight":0,"texture":0},"faceFeatures":{"noseBoneHigh":0,"jawBoneBackSize":0,"nosePeakLowering":0,"chinBoneLowering":0,"chinBoneSize":0,"jawBoneWidth":0,"noseBoneTwist":0,"eyeBrownForward":0,"nosePeakHigh":0,"cheeksBoneWidth":0,"cheeksBoneHigh":0,"noseWidth":0,"cheeksWidth":0,"nosePeakSize":0,"lipsThickness":0,"eyeBrownHigh":0,"chinBoneLenght":0,"chinHole":0,"eyesOpening":0,"neckThickness":0},"model":"mp_m_freemode_01","headOverlays":{"blemishes":{"color":0,"style":0,"secondColor":0,"opacity":0},"blush":{"color":0,"style":0,"secondColor":0,"opacity":0},"ageing":{"color":0,"style":0,"secondColor":0,"opacity":0},"moleAndFreckles":{"color":0,"style":0,"secondColor":0,"opacity":0},"complexion":{"color":0,"style":0,"secondColor":0,"opacity":0},"lipstick":{"color":0,"style":0,"secondColor":0,"opacity":0},"sunDamage":{"color":0,"style":0,"secondColor":0,"opacity":0},"eyebrows":{"color":0,"style":0,"secondColor":0,"opacity":0},"beard":{"color":0,"style":0,"secondColor":0,"opacity":0},"chestHair":{"color":0,"style":0,"secondColor":0,"opacity":0},"makeUp":{"color":0,"style":0,"secondColor":0,"opacity":0},"bodyBlemishes":{"color":0,"style":0,"secondColor":0,"opacity":0}},"eyeColor":0,"tattoos":[],"props":[{"texture":-1,"drawable":-1,"prop_id":0},{"texture":-1,"drawable":-1,"prop_id":1},{"texture":-1,"drawable":-1,"prop_id":2},{"texture":-1,"drawable":-1,"prop_id":6},{"texture":-1,"drawable":-1,"prop_id":7}],"headBlend":{"shapeThird":0,"skinSecond":0,"thirdMix":0,"shapeSecond":0,"shapeMix":0,"skinThird":0,"skinFirst":0,"shapeFirst":0,"skinMix":0},"components":[{"drawable":0,"component_id":0,"texture":0},{"drawable":0,"component_id":1,"texture":0},{"drawable":0,"component_id":2,"texture":0},{"drawable":4,"component_id":3,"texture":0},{"drawable":0,"component_id":5,"texture":0},{"drawable":0,"component_id":7,"texture":0},{"drawable":0,"component_id":9,"texture":0},{"drawable":0,"component_id":10,"texture":0},{"drawable":15,"component_id":8,"texture":0},{"drawable":80,"component_id":11,"texture":0},{"drawable":117,"component_id":4,"texture":5},{"drawable":124,"component_id":6,"texture":0}]}', 1),
	(98, 'VNJ60175', 'mp_m_freemode_01', '{"props":[{"drawable":-1,"texture":-1,"prop_id":0},{"drawable":-1,"texture":-1,"prop_id":1},{"drawable":-1,"texture":-1,"prop_id":2},{"drawable":-1,"texture":-1,"prop_id":6},{"drawable":-1,"texture":-1,"prop_id":7}],"tattoos":[],"headBlend":{"skinThird":0,"skinSecond":0,"thirdMix":0,"shapeMix":0,"shapeFirst":24,"skinMix":0,"shapeSecond":0,"shapeThird":0,"skinFirst":2},"faceFeatures":{"eyeBrownForward":0,"chinBoneLowering":0,"chinBoneLenght":0,"nosePeakLowering":0,"nosePeakSize":0,"chinBoneSize":0,"cheeksBoneWidth":0,"noseBoneHigh":0,"chinHole":0,"eyeBrownHigh":0,"noseBoneTwist":0,"cheeksBoneHigh":0,"jawBoneBackSize":0,"neckThickness":0,"eyesOpening":0,"nosePeakHigh":0,"lipsThickness":0,"noseWidth":0,"jawBoneWidth":0,"cheeksWidth":0},"hair":{"style":10,"texture":0,"highlight":0,"color":3},"model":"mp_m_freemode_01","components":[{"drawable":0,"texture":0,"component_id":0},{"drawable":0,"texture":0,"component_id":1},{"drawable":10,"texture":0,"component_id":2},{"drawable":15,"texture":0,"component_id":3},{"drawable":0,"texture":0,"component_id":5},{"drawable":0,"texture":0,"component_id":7},{"drawable":15,"texture":0,"component_id":8},{"drawable":0,"texture":0,"component_id":9},{"drawable":0,"texture":0,"component_id":10},{"drawable":5,"texture":0,"component_id":11},{"drawable":12,"texture":0,"component_id":4},{"drawable":6,"texture":0,"component_id":6}],"headOverlays":{"ageing":{"style":0,"opacity":0,"secondColor":0,"color":0},"blemishes":{"style":0,"opacity":0,"secondColor":0,"color":0},"bodyBlemishes":{"style":0,"opacity":0,"secondColor":0,"color":0},"makeUp":{"style":0,"opacity":0,"secondColor":0,"color":0},"complexion":{"style":0,"opacity":0,"secondColor":0,"color":0},"blush":{"style":0,"opacity":0,"secondColor":0,"color":0},"chestHair":{"style":0,"opacity":0,"secondColor":0,"color":0},"eyebrows":{"style":0,"opacity":0,"secondColor":0,"color":0},"beard":{"style":0,"opacity":0,"secondColor":0,"color":0},"moleAndFreckles":{"style":0,"opacity":0,"secondColor":0,"color":0},"sunDamage":{"style":0,"opacity":0,"secondColor":0,"color":0},"lipstick":{"style":0,"opacity":0,"secondColor":0,"color":0}},"eyeColor":0}', 1),
	(99, 'LIJ54655', 'mp_m_freemode_01', '{"tattoos":[],"headBlend":{"skinThird":0,"skinFirst":0,"shapeThird":0,"shapeMix":0,"shapeSecond":0,"skinMix":0,"skinSecond":0,"thirdMix":0,"shapeFirst":0},"eyeColor":0,"faceFeatures":{"lipsThickness":0,"eyeBrownHigh":0,"cheeksWidth":0,"chinBoneLowering":0,"chinHole":0,"eyeBrownForward":0,"nosePeakHigh":0,"neckThickness":0,"chinBoneSize":0,"noseWidth":0,"cheeksBoneHigh":0,"eyesOpening":0,"jawBoneWidth":0,"noseBoneTwist":0,"jawBoneBackSize":0,"noseBoneHigh":0,"chinBoneLenght":0,"nosePeakSize":0,"nosePeakLowering":0,"cheeksBoneWidth":0},"hair":{"texture":0,"style":0,"highlight":0,"color":0},"headOverlays":{"sunDamage":{"color":0,"style":0,"secondColor":0,"opacity":0},"eyebrows":{"color":0,"style":0,"secondColor":0,"opacity":0},"blemishes":{"color":0,"style":0,"secondColor":0,"opacity":0},"lipstick":{"color":0,"style":0,"secondColor":0,"opacity":0},"bodyBlemishes":{"color":0,"style":0,"secondColor":0,"opacity":0},"ageing":{"color":0,"style":0,"secondColor":0,"opacity":0},"moleAndFreckles":{"color":0,"style":0,"secondColor":0,"opacity":0},"blush":{"color":0,"style":0,"secondColor":0,"opacity":0},"complexion":{"color":0,"style":0,"secondColor":0,"opacity":0},"beard":{"color":0,"style":0,"secondColor":0,"opacity":0},"makeUp":{"color":0,"style":0,"secondColor":0,"opacity":0},"chestHair":{"color":0,"style":0,"secondColor":0,"opacity":0}},"model":"mp_m_freemode_01","components":[{"texture":0,"drawable":0,"component_id":0},{"texture":0,"drawable":0,"component_id":1},{"texture":0,"drawable":0,"component_id":2},{"texture":0,"drawable":0,"component_id":3},{"texture":0,"drawable":0,"component_id":4},{"texture":0,"drawable":0,"component_id":5},{"texture":0,"drawable":0,"component_id":6},{"texture":0,"drawable":0,"component_id":7},{"texture":0,"drawable":0,"component_id":8},{"texture":0,"drawable":0,"component_id":9},{"texture":0,"drawable":0,"component_id":10},{"texture":0,"drawable":0,"component_id":11}],"props":[{"texture":-1,"prop_id":0,"drawable":-1},{"texture":-1,"prop_id":1,"drawable":-1},{"texture":-1,"prop_id":2,"drawable":-1},{"texture":-1,"prop_id":6,"drawable":-1},{"texture":-1,"prop_id":7,"drawable":-1}]}', 1),
	(100, 'PXJ55813', 'mp_m_freemode_01', '{"tattoos":[],"headBlend":{"skinThird":0,"skinFirst":2,"shapeThird":0,"shapeMix":0,"shapeSecond":0,"skinMix":0,"skinSecond":0,"thirdMix":0,"shapeFirst":6},"eyeColor":0,"faceFeatures":{"lipsThickness":0,"eyeBrownHigh":0,"cheeksWidth":0,"chinBoneLowering":0,"chinHole":0,"eyeBrownForward":0,"nosePeakHigh":0,"neckThickness":0,"chinBoneSize":0,"noseWidth":0,"cheeksBoneHigh":0,"eyesOpening":0,"jawBoneWidth":0,"noseBoneTwist":0,"jawBoneBackSize":0,"noseBoneHigh":0,"chinBoneLenght":0,"nosePeakSize":0,"nosePeakLowering":0,"cheeksBoneWidth":0},"hair":{"texture":0,"style":10,"highlight":0,"color":45},"headOverlays":{"sunDamage":{"color":0,"style":0,"secondColor":0,"opacity":0},"eyebrows":{"color":0,"style":0,"secondColor":0,"opacity":0},"blemishes":{"color":0,"style":0,"secondColor":0,"opacity":0},"lipstick":{"color":0,"style":0,"secondColor":0,"opacity":0},"bodyBlemishes":{"color":0,"style":0,"secondColor":0,"opacity":0},"ageing":{"color":0,"style":0,"secondColor":0,"opacity":0},"moleAndFreckles":{"color":0,"style":0,"secondColor":0,"opacity":0},"blush":{"color":0,"style":0,"secondColor":0,"opacity":0},"complexion":{"color":0,"style":0,"secondColor":0,"opacity":0},"beard":{"color":0,"style":0,"secondColor":0,"opacity":0},"makeUp":{"color":0,"style":0,"secondColor":0,"opacity":0},"chestHair":{"color":0,"style":0,"secondColor":0,"opacity":0}},"model":"mp_m_freemode_01","components":[{"texture":0,"drawable":0,"component_id":0},{"texture":0,"drawable":0,"component_id":1},{"texture":0,"drawable":0,"component_id":2},{"texture":0,"drawable":0,"component_id":3},{"texture":0,"drawable":0,"component_id":5},{"texture":0,"drawable":0,"component_id":7},{"texture":0,"drawable":0,"component_id":9},{"texture":0,"drawable":0,"component_id":10},{"texture":1,"drawable":111,"component_id":11},{"texture":0,"drawable":15,"component_id":8},{"texture":0,"drawable":24,"component_id":4},{"texture":12,"drawable":11,"component_id":6}],"props":[{"texture":-1,"prop_id":0,"drawable":-1},{"texture":-1,"prop_id":1,"drawable":-1},{"texture":-1,"prop_id":2,"drawable":-1},{"texture":-1,"prop_id":6,"drawable":-1},{"texture":-1,"prop_id":7,"drawable":-1}]}', 1),
	(101, 'ITD12982', 'mp_m_freemode_01', '{"tattoos":[],"headBlend":{"skinThird":0,"skinFirst":0,"shapeThird":0,"shapeMix":0,"shapeSecond":0,"skinMix":0,"skinSecond":0,"thirdMix":0,"shapeFirst":0},"eyeColor":0,"faceFeatures":{"lipsThickness":0,"eyeBrownHigh":0,"cheeksWidth":0,"chinBoneLowering":0,"chinHole":0,"eyeBrownForward":0,"nosePeakHigh":0,"neckThickness":0,"chinBoneSize":0,"noseWidth":0,"cheeksBoneHigh":0,"eyesOpening":0,"jawBoneWidth":0,"noseBoneTwist":0,"jawBoneBackSize":0,"noseBoneHigh":0,"chinBoneLenght":0,"nosePeakSize":0,"nosePeakLowering":0,"cheeksBoneWidth":0},"hair":{"texture":0,"style":0,"highlight":0,"color":0},"headOverlays":{"sunDamage":{"color":0,"style":0,"secondColor":0,"opacity":0},"eyebrows":{"color":0,"style":0,"secondColor":0,"opacity":0},"blemishes":{"color":0,"style":0,"secondColor":0,"opacity":0},"lipstick":{"color":0,"style":0,"secondColor":0,"opacity":0},"bodyBlemishes":{"color":0,"style":0,"secondColor":0,"opacity":0},"ageing":{"color":0,"style":0,"secondColor":0,"opacity":0},"moleAndFreckles":{"color":0,"style":0,"secondColor":0,"opacity":0},"blush":{"color":0,"style":0,"secondColor":0,"opacity":0},"complexion":{"color":0,"style":0,"secondColor":0,"opacity":0},"beard":{"color":0,"style":0,"secondColor":0,"opacity":0},"makeUp":{"color":0,"style":0,"secondColor":0,"opacity":0},"chestHair":{"color":0,"style":0,"secondColor":0,"opacity":0}},"model":"mp_m_freemode_01","components":[{"texture":0,"drawable":0,"component_id":0},{"texture":0,"drawable":0,"component_id":1},{"texture":0,"drawable":0,"component_id":2},{"texture":0,"drawable":0,"component_id":3},{"texture":0,"drawable":21,"component_id":4},{"texture":0,"drawable":0,"component_id":5},{"texture":0,"drawable":34,"component_id":6},{"texture":0,"drawable":0,"component_id":7},{"texture":0,"drawable":15,"component_id":8},{"texture":0,"drawable":0,"component_id":9},{"texture":0,"drawable":0,"component_id":10},{"texture":0,"drawable":15,"component_id":11}],"props":[{"texture":-1,"prop_id":0,"drawable":-1},{"texture":-1,"prop_id":1,"drawable":-1},{"texture":-1,"prop_id":2,"drawable":-1},{"texture":-1,"prop_id":6,"drawable":-1},{"texture":-1,"prop_id":7,"drawable":-1}]}', 1),
	(102, 'TTM83002', 'mp_m_freemode_01', '{"headOverlays":{"sunDamage":{"color":0,"secondColor":0,"style":0,"opacity":0},"complexion":{"color":0,"secondColor":0,"style":0,"opacity":0},"chestHair":{"color":0,"secondColor":0,"style":0,"opacity":0},"beard":{"color":0,"secondColor":0,"style":0,"opacity":0},"blemishes":{"color":0,"secondColor":0,"style":0,"opacity":0},"makeUp":{"color":0,"secondColor":0,"style":0,"opacity":0},"lipstick":{"color":0,"secondColor":0,"style":0,"opacity":0},"moleAndFreckles":{"color":0,"secondColor":0,"style":0,"opacity":0},"eyebrows":{"color":0,"secondColor":0,"style":0,"opacity":0},"blush":{"color":0,"secondColor":0,"style":0,"opacity":0},"bodyBlemishes":{"color":0,"secondColor":0,"style":0,"opacity":0},"ageing":{"color":0,"secondColor":0,"style":0,"opacity":0}},"model":"mp_m_freemode_01","eyeColor":0,"hair":{"color":0,"highlight":0,"texture":0,"style":0},"headBlend":{"shapeFirst":0,"shapeMix":0,"skinSecond":0,"shapeThird":0,"shapeSecond":0,"skinMix":0,"thirdMix":0,"skinThird":0,"skinFirst":0},"components":[{"component_id":0,"texture":0,"drawable":0},{"component_id":1,"texture":0,"drawable":0},{"component_id":2,"texture":0,"drawable":0},{"component_id":3,"texture":0,"drawable":0},{"component_id":4,"texture":0,"drawable":0},{"component_id":5,"texture":0,"drawable":0},{"component_id":6,"texture":0,"drawable":0},{"component_id":7,"texture":0,"drawable":0},{"component_id":8,"texture":0,"drawable":0},{"component_id":9,"texture":0,"drawable":0},{"component_id":10,"texture":0,"drawable":0},{"component_id":11,"texture":0,"drawable":0}],"tattoos":[],"props":[{"texture":-1,"prop_id":0,"drawable":-1},{"texture":-1,"prop_id":1,"drawable":-1},{"texture":-1,"prop_id":2,"drawable":-1},{"texture":-1,"prop_id":6,"drawable":-1},{"texture":-1,"prop_id":7,"drawable":-1}],"faceFeatures":{"jawBoneWidth":0,"noseWidth":0,"lipsThickness":0,"nosePeakLowering":0,"nosePeakSize":0,"eyeBrownHigh":0,"chinBoneLenght":0,"chinHole":0,"nosePeakHigh":0,"noseBoneHigh":0,"chinBoneSize":0,"noseBoneTwist":0,"cheeksBoneHigh":0,"chinBoneLowering":0,"jawBoneBackSize":0,"cheeksBoneWidth":0,"cheeksWidth":0,"eyeBrownForward":0,"eyesOpening":0,"neckThickness":0}}', 1),
	(103, 'DZQ11286', 'mp_m_freemode_01', '{"headOverlays":{"sunDamage":{"color":0,"secondColor":0,"style":0,"opacity":0},"complexion":{"color":0,"secondColor":0,"style":0,"opacity":0},"chestHair":{"color":0,"secondColor":0,"style":0,"opacity":0},"beard":{"color":0,"secondColor":0,"style":0,"opacity":0},"blemishes":{"color":0,"secondColor":0,"style":0,"opacity":0},"makeUp":{"color":0,"secondColor":0,"style":0,"opacity":0},"lipstick":{"color":0,"secondColor":0,"style":0,"opacity":0},"moleAndFreckles":{"color":0,"secondColor":0,"style":0,"opacity":0},"eyebrows":{"color":0,"secondColor":0,"style":0,"opacity":0},"blush":{"color":0,"secondColor":0,"style":0,"opacity":0},"bodyBlemishes":{"color":0,"secondColor":0,"style":0,"opacity":0},"ageing":{"color":0,"secondColor":0,"style":0,"opacity":0}},"model":"mp_m_freemode_01","eyeColor":0,"hair":{"color":4,"highlight":0,"texture":0,"style":10},"headBlend":{"shapeFirst":35,"shapeMix":0,"skinSecond":0,"shapeThird":0,"shapeSecond":0,"skinMix":0,"thirdMix":0,"skinThird":0,"skinFirst":2},"components":[{"component_id":0,"texture":0,"drawable":0},{"component_id":1,"texture":0,"drawable":0},{"component_id":2,"texture":0,"drawable":0},{"component_id":5,"texture":0,"drawable":0},{"component_id":7,"texture":0,"drawable":0},{"component_id":9,"texture":0,"drawable":0},{"component_id":10,"texture":0,"drawable":0},{"component_id":11,"texture":3,"drawable":111},{"component_id":8,"texture":0,"drawable":15},{"component_id":3,"texture":0,"drawable":4},{"component_id":4,"texture":0,"drawable":24},{"component_id":6,"texture":0,"drawable":6}],"tattoos":[],"props":[{"texture":-1,"prop_id":0,"drawable":-1},{"texture":-1,"prop_id":1,"drawable":-1},{"texture":-1,"prop_id":2,"drawable":-1},{"texture":-1,"prop_id":6,"drawable":-1},{"texture":-1,"prop_id":7,"drawable":-1}],"faceFeatures":{"jawBoneWidth":0,"noseWidth":0,"lipsThickness":0,"nosePeakLowering":0,"nosePeakSize":0,"eyeBrownHigh":0,"chinBoneLenght":0,"chinHole":0,"nosePeakHigh":0,"noseBoneHigh":0,"chinBoneSize":0,"noseBoneTwist":0,"cheeksBoneHigh":0,"chinBoneLowering":0,"jawBoneBackSize":0,"cheeksBoneWidth":0,"cheeksWidth":0,"eyeBrownForward":0,"eyesOpening":0,"neckThickness":0}}', 1),
	(104, 'YZW70066', 'mp_m_freemode_01', '{"props":[{"drawable":-1,"prop_id":0,"texture":-1},{"drawable":-1,"prop_id":1,"texture":-1},{"drawable":-1,"prop_id":2,"texture":-1},{"drawable":-1,"prop_id":6,"texture":-1},{"drawable":-1,"prop_id":7,"texture":-1}],"eyeColor":0,"model":"mp_m_freemode_01","faceFeatures":{"noseWidth":0,"noseBoneTwist":0,"nosePeakHigh":0,"jawBoneBackSize":0,"nosePeakLowering":0,"chinBoneLowering":0,"chinBoneLenght":0,"lipsThickness":0,"cheeksWidth":0,"jawBoneWidth":0,"chinBoneSize":0,"neckThickness":0,"eyesOpening":0,"eyeBrownHigh":0,"chinHole":0,"cheeksBoneWidth":0,"nosePeakSize":0,"eyeBrownForward":0,"noseBoneHigh":0,"cheeksBoneHigh":0},"headOverlays":{"ageing":{"secondColor":0,"style":0,"color":0,"opacity":0},"blush":{"secondColor":0,"style":0,"color":0,"opacity":0},"makeUp":{"secondColor":0,"style":0,"color":0,"opacity":0},"complexion":{"secondColor":0,"style":0,"color":0,"opacity":0},"lipstick":{"secondColor":0,"style":0,"color":0,"opacity":0},"moleAndFreckles":{"secondColor":0,"style":0,"color":0,"opacity":0},"chestHair":{"secondColor":0,"style":0,"color":0,"opacity":0},"eyebrows":{"secondColor":0,"style":0,"color":0,"opacity":0},"sunDamage":{"secondColor":0,"style":0,"color":0,"opacity":0},"blemishes":{"secondColor":0,"style":0,"color":0,"opacity":0},"bodyBlemishes":{"secondColor":0,"style":0,"color":0,"opacity":0},"beard":{"secondColor":0,"style":0,"color":0,"opacity":0}},"headBlend":{"shapeMix":0,"skinThird":0,"shapeThird":0,"skinMix":0,"skinSecond":0,"thirdMix":0,"skinFirst":0,"shapeFirst":0,"shapeSecond":0},"tattoos":[],"components":[{"drawable":0,"component_id":0,"texture":0},{"drawable":0,"component_id":1,"texture":0},{"drawable":0,"component_id":2,"texture":0},{"drawable":0,"component_id":3,"texture":0},{"drawable":0,"component_id":4,"texture":0},{"drawable":0,"component_id":5,"texture":0},{"drawable":0,"component_id":6,"texture":0},{"drawable":0,"component_id":7,"texture":0},{"drawable":0,"component_id":8,"texture":0},{"drawable":0,"component_id":9,"texture":0},{"drawable":0,"component_id":10,"texture":0},{"drawable":0,"component_id":11,"texture":0}],"hair":{"color":0,"style":0,"highlight":0,"texture":0}}', 1);

-- tablo yapısı dökülüyor temelpaket.player_contacts
CREATE TABLE IF NOT EXISTS `player_contacts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `citizenid` varchar(11) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `number` varchar(50) DEFAULT NULL,
  `iban` varchar(50) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `citizenid` (`citizenid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- temelpaket.player_contacts: ~0 rows (yaklaşık) tablosu için veriler indiriliyor
DELETE FROM `player_contacts`;

-- tablo yapısı dökülüyor temelpaket.player_houses
CREATE TABLE IF NOT EXISTS `player_houses` (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `house` varchar(50) NOT NULL,
  `identifier` varchar(50) DEFAULT NULL,
  `citizenid` varchar(11) DEFAULT NULL,
  `keyholders` text DEFAULT NULL,
  `decorations` text DEFAULT NULL,
  `stash` text DEFAULT NULL,
  `outfit` text DEFAULT NULL,
  `logout` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `house` (`house`),
  KEY `citizenid` (`citizenid`),
  KEY `identifier` (`identifier`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- temelpaket.player_houses: ~0 rows (yaklaşık) tablosu için veriler indiriliyor
DELETE FROM `player_houses`;

-- tablo yapısı dökülüyor temelpaket.player_invoices
CREATE TABLE IF NOT EXISTS `player_invoices` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sender_citizenid` varchar(50) NOT NULL,
  `receiver_citizenid` varchar(50) NOT NULL,
  `amount` int(11) NOT NULL,
  `reason` varchar(255) DEFAULT NULL,
  `status` varchar(20) DEFAULT 'unpaid',
  `date` datetime DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- temelpaket.player_invoices: ~0 rows (yaklaşık) tablosu için veriler indiriliyor
DELETE FROM `player_invoices`;

-- tablo yapısı dökülüyor temelpaket.player_mails
CREATE TABLE IF NOT EXISTS `player_mails` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `citizenid` varchar(11) DEFAULT NULL,
  `sender` varchar(50) DEFAULT NULL,
  `subject` varchar(50) DEFAULT NULL,
  `message` text DEFAULT NULL,
  `read` tinyint(4) DEFAULT 0,
  `mailid` int(11) DEFAULT NULL,
  `date` timestamp NULL DEFAULT current_timestamp(),
  `button` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `citizenid` (`citizenid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- temelpaket.player_mails: ~0 rows (yaklaşık) tablosu için veriler indiriliyor
DELETE FROM `player_mails`;

-- tablo yapısı dökülüyor temelpaket.player_outfits
CREATE TABLE IF NOT EXISTS `player_outfits` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `citizenid` varchar(11) DEFAULT NULL,
  `outfitname` varchar(50) NOT NULL,
  `model` varchar(50) DEFAULT NULL,
  `skin` text DEFAULT NULL,
  `outfitId` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `citizenid` (`citizenid`),
  KEY `outfitId` (`outfitId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- temelpaket.player_outfits: ~0 rows (yaklaşık) tablosu için veriler indiriliyor
DELETE FROM `player_outfits`;

-- tablo yapısı dökülüyor temelpaket.player_outfit_codes
CREATE TABLE IF NOT EXISTS `player_outfit_codes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `outfitid` int(11) NOT NULL,
  `code` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `FK_player_outfit_codes_player_outfits` (`outfitid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- temelpaket.player_outfit_codes: ~0 rows (yaklaşık) tablosu için veriler indiriliyor
DELETE FROM `player_outfit_codes`;

-- tablo yapısı dökülüyor temelpaket.player_taxes
CREATE TABLE IF NOT EXISTS `player_taxes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `citizenid` varchar(50) NOT NULL,
  `tax_type` int(11) NOT NULL DEFAULT 1,
  `amount` int(11) NOT NULL,
  `reason` varchar(255) NOT NULL,
  `date` datetime NOT NULL DEFAULT current_timestamp(),
  `paid` tinyint(1) NOT NULL DEFAULT 0,
  `paid_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `citizenid` (`citizenid`),
  KEY `paid` (`paid`),
  KEY `date` (`date`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- temelpaket.player_taxes: ~39 rows (yaklaşık) tablosu için veriler indiriliyor
DELETE FROM `player_taxes`;
INSERT INTO `player_taxes` (`id`, `citizenid`, `tax_type`, `amount`, `reason`, `date`, `paid`, `paid_date`) VALUES
	(1, 'VNJ60175', 1, 7236, 'Saatlik banka vergisi', '2025-07-07 03:55:55', 0, NULL),
	(2, 'VNJ60175', 1, 7238, 'Saatlik banka vergisi', '2025-07-07 04:55:55', 0, NULL),
	(3, 'VNJ60175', 1, 7244, 'Saatlik banka vergisi', '2025-07-07 05:55:56', 0, NULL),
	(4, 'VNJ60175', 1, 7246, 'Saatlik banka vergisi', '2025-07-07 06:55:56', 0, NULL),
	(5, 'VNJ60175', 1, 7252, 'Saatlik banka vergisi', '2025-07-07 07:55:56', 0, NULL),
	(6, 'VNJ60175', 1, 7254, 'Saatlik banka vergisi', '2025-07-07 08:55:56', 0, NULL),
	(7, 'VNJ60175', 1, 7260, 'Saatlik banka vergisi', '2025-07-07 09:55:57', 0, NULL),
	(8, 'OWH73132', 1, 255, 'Saatlik banka vergisi', '2025-07-07 11:49:01', 0, NULL),
	(9, 'VNJ60175', 1, 7263, 'Saatlik banka vergisi', '2025-07-07 13:03:50', 0, NULL),
	(10, 'VNJ60175', 1, 7419, 'Saatlik banka vergisi', '2025-07-08 14:54:16', 0, NULL),
	(11, 'VNJ60175', 1, 7475, 'Saatlik banka vergisi', '2025-07-08 15:54:17', 0, NULL),
	(12, 'VNJ60175', 1, 7535, 'Saatlik banka vergisi', '2025-07-08 16:54:17', 0, NULL),
	(13, 'VNJ60175', 1, 7591, 'Saatlik banka vergisi', '2025-07-08 17:54:18', 0, NULL),
	(14, 'VNJ60175', 1, 7651, 'Saatlik banka vergisi', '2025-07-08 18:54:18', 0, NULL),
	(15, 'VNJ60175', 1, 7707, 'Saatlik banka vergisi', '2025-07-08 19:54:18', 0, NULL),
	(16, 'VNJ60175', 1, 7767, 'Saatlik banka vergisi', '2025-07-08 20:54:19', 0, NULL),
	(17, 'VNJ60175', 1, 7823, 'Saatlik banka vergisi', '2025-07-08 21:54:19', 0, NULL),
	(18, 'VNJ60175', 1, 7883, 'Saatlik banka vergisi', '2025-07-08 22:54:19', 0, NULL),
	(19, 'VNJ60175', 1, 7939, 'Saatlik banka vergisi', '2025-07-08 23:54:19', 0, NULL),
	(20, 'VNJ60175', 1, 7999, 'Saatlik banka vergisi', '2025-07-09 00:54:20', 0, NULL),
	(21, 'VNJ60175', 1, 8055, 'Saatlik banka vergisi', '2025-07-09 01:54:20', 0, NULL),
	(22, 'VNJ60175', 1, 8115, 'Saatlik banka vergisi', '2025-07-09 02:54:20', 0, NULL),
	(23, 'VNJ60175', 1, 8171, 'Saatlik banka vergisi', '2025-07-09 03:54:20', 0, NULL),
	(24, 'VNJ60175', 1, 8231, 'Saatlik banka vergisi', '2025-07-09 04:54:21', 0, NULL),
	(25, 'VNJ60175', 1, 8287, 'Saatlik banka vergisi', '2025-07-09 05:54:21', 0, NULL),
	(26, 'VNJ60175', 1, 8347, 'Saatlik banka vergisi', '2025-07-09 06:54:21', 0, NULL),
	(27, 'VNJ60175', 1, 8403, 'Saatlik banka vergisi', '2025-07-09 07:54:22', 0, NULL),
	(28, 'VNJ60175', 1, 8463, 'Saatlik banka vergisi', '2025-07-09 08:54:22', 0, NULL),
	(29, 'VNJ60175', 1, 8519, 'Saatlik banka vergisi', '2025-07-09 09:54:22', 0, NULL),
	(30, 'VNJ60175', 1, 8579, 'Saatlik banka vergisi', '2025-07-09 10:54:22', 0, NULL),
	(31, 'VNJ60175', 1, 8635, 'Saatlik banka vergisi', '2025-07-09 11:54:23', 0, NULL),
	(32, 'GEM97486', 1, 250, 'Saatlik banka vergisi', '2025-07-11 16:44:33', 0, NULL),
	(33, 'GEM97486', 1, 250, 'Saatlik banka vergisi', '2025-07-11 17:44:33', 0, NULL),
	(34, 'LIJ54655', 1, 250, 'Saatlik banka vergisi', '2025-07-11 18:44:34', 0, NULL),
	(35, 'LIJ54655', 1, 250, 'Saatlik banka vergisi', '2025-07-11 19:44:34', 0, NULL),
	(36, 'LIJ54655', 1, 250, 'Saatlik banka vergisi', '2025-07-11 20:44:34', 0, NULL),
	(37, 'LIJ54655', 1, 250, 'Saatlik banka vergisi', '2025-07-11 21:44:34', 0, NULL),
	(38, 'LIJ54655', 1, 250, 'Saatlik banka vergisi', '2025-07-11 22:44:35', 0, NULL),
	(39, 'LIJ54655', 1, 281, 'Saatlik banka vergisi', '2025-07-12 00:44:35', 0, NULL);

-- tablo yapısı dökülüyor temelpaket.player_vehicles
CREATE TABLE IF NOT EXISTS `player_vehicles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `license` varchar(50) DEFAULT NULL,
  `citizenid` varchar(11) DEFAULT NULL,
  `vehicle` varchar(50) DEFAULT NULL,
  `hash` varchar(50) DEFAULT NULL,
  `mods` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `plate` varchar(8) NOT NULL,
  `fakeplate` varchar(8) DEFAULT NULL,
  `garage` varchar(50) DEFAULT NULL,
  `fuel` int(11) DEFAULT 100,
  `engine` float DEFAULT 1000,
  `body` float DEFAULT 1000,
  `state` int(11) DEFAULT 1,
  `depotprice` int(11) NOT NULL DEFAULT 0,
  `drivingdistance` int(50) DEFAULT NULL,
  `status` text DEFAULT NULL,
  `balance` int(11) NOT NULL DEFAULT 0,
  `paymentamount` int(11) NOT NULL DEFAULT 0,
  `paymentsleft` int(11) NOT NULL DEFAULT 0,
  `financetime` int(11) NOT NULL DEFAULT 0,
  `logs` longtext DEFAULT '[]',
  `loandate` varchar(255) DEFAULT NULL,
  `loanperiode` varchar(255) DEFAULT NULL,
  `glovebox` longtext DEFAULT NULL,
  `trunk` longtext DEFAULT NULL,
  `nosColour` text DEFAULT NULL,
  `traveldistance` int(50) DEFAULT 0,
  `noslevel` int(10) DEFAULT 0,
  `hasnitro` tinyint(4) DEFAULT 0,
  `mileage` int(11) DEFAULT 0,
  `metadata` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT '{"keys":{}}' CHECK (json_valid(`metadata`)),
  `pound` varchar(60) DEFAULT NULL,
  `stored` tinyint(4) DEFAULT 0,
  `type` varchar(20) DEFAULT 'automobile',
  `job` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `plate` (`plate`),
  KEY `citizenid` (`citizenid`),
  KEY `license` (`license`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- temelpaket.player_vehicles: ~24 rows (yaklaşık) tablosu için veriler indiriliyor
DELETE FROM `player_vehicles`;
INSERT INTO `player_vehicles` (`id`, `license`, `citizenid`, `vehicle`, `hash`, `mods`, `plate`, `fakeplate`, `garage`, `fuel`, `engine`, `body`, `state`, `depotprice`, `drivingdistance`, `status`, `balance`, `paymentamount`, `paymentsleft`, `financetime`, `logs`, `loandate`, `loanperiode`, `glovebox`, `trunk`, `nosColour`, `traveldistance`, `noslevel`, `hasnitro`, `mileage`, `metadata`, `pound`, `stored`, `type`, `job`) VALUES
	(1, 'license:d91243c901cd9d58c601cee7c6e6deddb54d616c', 'HDM14341', 'issi7', '1854776567', '{"modDashboard":-1,"modDoorSpeaker":-1,"modHydrolic":-1,"modAirFilter":-1,"modArchCover":-1,"modSmokeEnabled":false,"modKit19":-1,"modBackWheels":-1,"color1":112,"modArmor":-1,"bodyHealth":1000.0592475178704,"neonColor":[255,0,255],"liveryRoof":-1,"modShifterLeavers":-1,"modRearBumper":-1,"modEngineBlock":-1,"modSpoilers":-1,"modCustomTiresF":false,"tyreSmokeColor":[255,255,255],"oilLevel":4.76596940834568,"modRightFender":-1,"xenonColor":255,"modFrontWheels":-1,"wheelColor":112,"windowStatus":{"1":true,"2":false,"3":false,"4":true,"5":true,"6":false,"7":true,"0":true},"modTrunk":-1,"tireBurstState":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false},"modTrimB":-1,"modSpeakers":-1,"modWindows":-1,"modHood":-1,"modTank":-1,"modTrimA":-1,"wheelWidth":0.0,"engineHealth":1000.0592475178704,"plate":"84XQF370","wheels":0,"modStruts":-1,"tankHealth":1000.0592475178704,"dashboardColor":112,"modSeats":-1,"modTransmission":-1,"modRoof":-1,"modEngine":-1,"modSuspension":-1,"plateIndex":0,"wheelSize":0.0,"modOrnaments":-1,"pearlescentColor":18,"modKit47":-1,"modKit17":-1,"modAPlate":-1,"modFender":-1,"color2":112,"modSteeringWheel":-1,"modPlateHolder":-1,"modTurbo":false,"tireHealth":{"1":1000.0,"2":1000.0,"3":1000.0,"0":1000.0},"fuelLevel":41.30506820566263,"modVanityPlate":-1,"modGrille":-1,"modKit49":-1,"modFrontBumper":-1,"modExhaust":-1,"modLivery":-1,"modKit21":-1,"model":1854776567,"modSideSkirt":-1,"modCustomTiresR":false,"modHorns":-1,"modBrakes":-1,"neonEnabled":[false,false,false,false],"modFrame":-1,"tireBurstCompletely":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false},"extras":{"1":true},"doorStatus":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false},"modXenon":false,"interiorColor":112,"dirtLevel":0.0,"modDial":-1,"modAerials":-1,"windowTint":-1}', '84XQF370', NULL, NULL, 100, 1000, 1000, 1, 0, NULL, NULL, 0, 0, 0, 0, '[]', NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, '{"keys":{}}', NULL, 0, 'automobile', NULL),
	(2, 'license:d91243c901cd9d58c601cee7c6e6deddb54d616c', 'KQH93442', 'asterope2', '-741120335', '{"modWindows":-1,"modPlateHolder":-1,"modGrille":-1,"modRightFender":-1,"modBrakes":-1,"modFrontBumper":-1,"wheelWidth":0.0,"modSeats":-1,"wheelColor":156,"dashboardColor":156,"modEngineBlock":-1,"modKit17":-1,"modAirFilter":-1,"modSideSkirt":-1,"modSpoilers":-1,"wheels":0,"modXenon":false,"windowTint":-1,"modKit49":-1,"tankHealth":1000.0592475178704,"model":-741120335,"tireHealth":{"1":1000.0,"2":1000.0,"3":1000.0,"0":1000.0},"tireBurstCompletely":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false},"modHydrolic":-1,"tireBurstState":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false},"neonEnabled":[false,false,false,false],"modBackWheels":-1,"fuelLevel":65.13491524739108,"engineHealth":1000.0592475178704,"modVanityPlate":-1,"xenonColor":255,"modAPlate":-1,"modRearBumper":-1,"modSuspension":-1,"pearlescentColor":35,"modFender":-1,"modExhaust":-1,"modDial":-1,"modArmor":-1,"modStruts":-1,"modSteeringWheel":-1,"modLivery":-1,"plateIndex":0,"modCustomTiresR":false,"windowStatus":{"1":true,"2":true,"3":true,"4":false,"5":false,"6":true,"7":true,"0":true},"modShifterLeavers":-1,"modAerials":-1,"wheelSize":0.0,"bodyHealth":1000.0592475178704,"oilLevel":4.76596940834568,"plate":"7EEW576","modSpeakers":-1,"modDashboard":-1,"modTrimA":-1,"modKit47":-1,"color1":[0,0,0],"liveryRoof":-1,"modDoorSpeaker":-1,"doorStatus":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false},"modKit21":-1,"modTrunk":-1,"modFrame":-1,"modHood":-1,"modArchCover":-1,"modRoof":-1,"modTransmission":-1,"modOrnaments":-1,"modTank":-1,"modFrontWheels":-1,"modHorns":-1,"neonColor":[255,0,255],"dirtLevel":3.17731293889712,"modSmokeEnabled":false,"modCustomTiresF":false,"extras":[],"color2":[0,0,0],"modEngine":-1,"modTurbo":false,"modTrimB":-1,"interiorColor":154,"tyreSmokeColor":[255,255,255],"modKit19":-1}', '7EEW576', NULL, 'out', 100, 1000, 1000, 1, 0, NULL, NULL, 0, 0, 0, 0, '[]', NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, '{"keys":{}}', NULL, 0, 'automobile', NULL),
	(3, 'license:d91243c901cd9d58c601cee7c6e6deddb54d616c', 'KQH93442', 'asterope', '-1903012613', '{"modWindows":-1,"modPlateHolder":-1,"modGrille":-1,"modRightFender":-1,"modBrakes":-1,"modFrontBumper":-1,"wheelWidth":0.0,"modSeats":-1,"wheelColor":156,"dashboardColor":0,"modEngineBlock":-1,"modKit17":-1,"modAirFilter":-1,"modSideSkirt":-1,"modSpoilers":-1,"wheels":0,"modXenon":false,"windowTint":-1,"modKit49":-1,"tankHealth":1000.0592475178704,"model":-1903012613,"tireHealth":{"1":1000.0,"2":1000.0,"3":1000.0,"0":1000.0},"tireBurstCompletely":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false},"modHydrolic":-1,"tireBurstState":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false},"neonEnabled":[false,false,false,false],"modBackWheels":-1,"fuelLevel":65.13491524739108,"engineHealth":1000.0592475178704,"modVanityPlate":-1,"xenonColor":255,"modAPlate":-1,"modRearBumper":-1,"modSuspension":-1,"pearlescentColor":5,"modFender":-1,"modExhaust":-1,"modDial":-1,"modArmor":-1,"modStruts":-1,"modSteeringWheel":-1,"modLivery":-1,"plateIndex":3,"modCustomTiresR":false,"windowStatus":{"1":true,"2":true,"3":true,"4":false,"5":false,"6":true,"7":true,"0":true},"modShifterLeavers":-1,"modAerials":-1,"wheelSize":0.0,"bodyHealth":1000.0592475178704,"oilLevel":4.76596940834568,"plate":"7SWI283","modSpeakers":-1,"modDashboard":-1,"modTrimA":-1,"modKit47":-1,"color1":[0,0,0],"liveryRoof":-1,"modDoorSpeaker":-1,"doorStatus":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false},"modKit21":-1,"modTrunk":-1,"modFrame":-1,"modHood":-1,"modArchCover":-1,"modRoof":-1,"modTransmission":-1,"modOrnaments":-1,"modTank":-1,"modFrontWheels":-1,"modHorns":-1,"neonColor":[255,0,255],"dirtLevel":7.94328234724281,"modSmokeEnabled":false,"modCustomTiresF":false,"extras":{"12":false,"10":false},"color2":[0,0,0],"modEngine":-1,"modTurbo":false,"modTrimB":-1,"interiorColor":0,"tyreSmokeColor":[255,255,255],"modKit19":-1}', '7SWI283', NULL, 'out', 100, 1000, 1000, 1, 0, NULL, NULL, 0, 0, 0, 0, '[]', NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, '{"keys":{}}', NULL, 0, 'automobile', NULL),
	(4, 'license:d91243c901cd9d58c601cee7c6e6deddb54d616c', 'KQH93442', 'oracle', '1348744438', '{"modWindows":-1,"modPlateHolder":-1,"modGrille":-1,"modRightFender":-1,"modBrakes":-1,"modFrontBumper":-1,"wheelWidth":0.0,"modSeats":-1,"wheelColor":156,"dashboardColor":0,"modEngineBlock":-1,"modKit17":-1,"modAirFilter":-1,"modSideSkirt":-1,"modSpoilers":-1,"wheels":0,"modXenon":false,"windowTint":-1,"modKit49":-1,"tankHealth":1000.0592475178704,"model":1348744438,"tireHealth":{"1":1000.0,"2":1000.0,"3":1000.0,"0":1000.0},"tireBurstCompletely":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false},"modHydrolic":-1,"tireBurstState":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false},"neonEnabled":[false,false,false,false],"modBackWheels":-1,"fuelLevel":30.18447291952269,"engineHealth":1000.0592475178704,"modVanityPlate":-1,"xenonColor":255,"modAPlate":-1,"modRearBumper":-1,"modSuspension":-1,"pearlescentColor":32,"modFender":-1,"modExhaust":-1,"modDial":-1,"modArmor":-1,"modStruts":-1,"modSteeringWheel":-1,"modLivery":-1,"plateIndex":0,"modCustomTiresR":false,"windowStatus":{"1":true,"2":true,"3":true,"4":true,"5":true,"6":true,"7":true,"0":true},"modShifterLeavers":-1,"modAerials":-1,"wheelSize":0.0,"bodyHealth":1000.0592475178704,"oilLevel":5.56029764306997,"plate":"2HHS375","modSpeakers":-1,"modDashboard":-1,"modTrimA":-1,"modKit47":-1,"color1":[0,0,0],"liveryRoof":-1,"modDoorSpeaker":-1,"doorStatus":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false},"modKit21":-1,"modTrunk":-1,"modFrame":-1,"modHood":-1,"modArchCover":-1,"modRoof":-1,"modTransmission":-1,"modOrnaments":-1,"modTank":-1,"modFrontWheels":-1,"modHorns":-1,"neonColor":[255,0,255],"dirtLevel":8.73761058196709,"modSmokeEnabled":false,"modCustomTiresF":false,"extras":{"11":false,"12":false},"color2":[0,0,0],"modEngine":-1,"modTurbo":false,"modTrimB":-1,"interiorColor":0,"tyreSmokeColor":[255,255,255],"modKit19":-1}', '2HHS375', NULL, 'out', 100, 1000, 1000, 1, 0, NULL, NULL, 0, 0, 0, 0, '[]', NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, '{"keys":{}}', NULL, 0, 'automobile', NULL),
	(5, 'license:d91243c901cd9d58c601cee7c6e6deddb54d616c', 'KQH93442', 'asterope2', '-741120335', '{"modWindows":-1,"modPlateHolder":-1,"modGrille":-1,"modRightFender":-1,"modBrakes":-1,"modFrontBumper":-1,"wheelWidth":0.0,"modSeats":-1,"wheelColor":156,"dashboardColor":156,"modEngineBlock":-1,"modKit17":-1,"modAirFilter":-1,"modSideSkirt":-1,"modSpoilers":-1,"wheels":0,"modXenon":false,"windowTint":-1,"modKit49":-1,"tankHealth":1000.0592475178704,"model":-741120335,"tireHealth":{"1":1000.0,"2":1000.0,"3":1000.0,"0":1000.0},"tireBurstCompletely":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false},"modHydrolic":-1,"tireBurstState":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false},"neonEnabled":[false,false,false,false],"modBackWheels":-1,"fuelLevel":35.74477056259266,"engineHealth":1000.0592475178704,"modVanityPlate":-1,"xenonColor":255,"modAPlate":-1,"modRearBumper":-1,"modSuspension":-1,"pearlescentColor":35,"modFender":-1,"modExhaust":-1,"modDial":-1,"modArmor":-1,"modStruts":-1,"modSteeringWheel":-1,"modLivery":-1,"plateIndex":0,"modCustomTiresR":false,"windowStatus":{"1":true,"2":true,"3":true,"4":false,"5":false,"6":true,"7":true,"0":true},"modShifterLeavers":-1,"modAerials":-1,"wheelSize":0.0,"bodyHealth":1000.0592475178704,"oilLevel":4.76596940834568,"plate":"3ZRS249","modSpeakers":-1,"modDashboard":-1,"modTrimA":-1,"modKit47":-1,"color1":[0,0,0],"liveryRoof":-1,"modDoorSpeaker":-1,"doorStatus":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false},"modKit21":-1,"modTrunk":-1,"modFrame":-1,"modHood":-1,"modArchCover":-1,"modRoof":-1,"modTransmission":-1,"modOrnaments":-1,"modTank":-1,"modFrontWheels":-1,"modHorns":-1,"neonColor":[255,0,255],"dirtLevel":6.35462587779425,"modSmokeEnabled":false,"modCustomTiresF":false,"extras":[],"color2":[0,0,0],"modEngine":-1,"modTurbo":false,"modTrimB":-1,"interiorColor":154,"tyreSmokeColor":[255,255,255],"modKit19":-1}', '3ZRS249', NULL, 'out', 100, 1000, 1000, 1, 0, NULL, NULL, 0, 0, 0, 0, '[]', NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, '{"keys":{}}', NULL, 0, 'automobile', NULL),
	(6, 'license:d91243c901cd9d58c601cee7c6e6deddb54d616c', 'KQH93442', 'seminole2', '-1810806490', '{"modTransmission":-1,"modSpoilers":-1,"modVanityPlate":-1,"modHydrolic":-1,"modSeats":-1,"modSteeringWheel":-1,"modSpeakers":-1,"xenonColor":255,"modKit17":-1,"modDoorSpeaker":-1,"modAirFilter":-1,"modFrontBumper":-1,"modAPlate":-1,"engineHealth":1000.0592475178704,"modCustomTiresF":false,"modHood":-1,"modStruts":-1,"fuelLevel":65.13491524739108,"dirtLevel":3.9716411736214,"extras":[],"modAerials":-1,"modTank":-1,"modDial":-1,"modTrimA":-1,"modRightFender":-1,"modXenon":false,"neonColor":[255,0,255],"wheelSize":0.0,"tireBurstState":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false},"interiorColor":13,"neonEnabled":[false,false,false,false],"modKit21":-1,"modLivery":-1,"modFrame":-1,"dashboardColor":111,"plate":"9KQX550","modHorns":-1,"modRoof":-1,"pearlescentColor":134,"tankHealth":1000.0592475178704,"modBrakes":-1,"modPlateHolder":-1,"modArchCover":-1,"tyreSmokeColor":[255,255,255],"windowTint":-1,"modRearBumper":-1,"oilLevel":4.76596940834568,"modOrnaments":-1,"doorStatus":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false},"modBackWheels":-1,"modArmor":-1,"modGrille":-1,"wheelWidth":0.0,"modShifterLeavers":-1,"modSuspension":-1,"wheelColor":13,"modExhaust":-1,"modTrimB":-1,"modFrontWheels":-1,"modSideSkirt":-1,"modKit19":-1,"modKit49":-1,"tireBurstCompletely":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false},"modSmokeEnabled":false,"modDashboard":-1,"color2":[0,0,0],"model":-1810806490,"tireHealth":{"1":1000.0,"2":1000.0,"3":1000.0,"0":1000.0},"modTurbo":false,"liveryRoof":-1,"bodyHealth":1000.0592475178704,"wheels":3,"modFender":-1,"modEngineBlock":-1,"windowStatus":{"1":true,"2":true,"3":true,"4":false,"5":false,"6":true,"7":true,"0":true},"color1":[0,0,0],"modTrunk":-1,"modWindows":-1,"modCustomTiresR":false,"plateIndex":0,"modKit47":-1,"modEngine":-1}', '9KQX550', NULL, 'out', 100, 1000, 1000, 1, 0, NULL, NULL, 0, 0, 0, 0, '[]', NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, '{"keys":{}}', NULL, 0, 'automobile', NULL),
	(7, 'license:d91243c901cd9d58c601cee7c6e6deddb54d616c', 'KQH93442', 'oracle', '1348744438', '{"modDashboard":-1,"plate":"9JCC299","windowStatus":{"1":true,"2":true,"3":true,"4":true,"5":true,"6":true,"7":true,"0":true},"modExhaust":-1,"modGrille":-1,"modRightFender":-1,"modTransmission":-1,"modDial":-1,"modDoorSpeaker":-1,"modTrimA":-1,"wheelColor":156,"tankHealth":1000.0592475178704,"modKit19":-1,"modSteeringWheel":-1,"modBrakes":-1,"tyreSmokeColor":[255,255,255],"modPlateHolder":-1,"xenonColor":255,"wheelSize":0.0,"modAerials":-1,"dashboardColor":0,"extras":{"11":true,"12":false},"modFrontBumper":-1,"dirtLevel":10.32626705141565,"modTrimB":-1,"modCustomTiresR":false,"modSmokeEnabled":false,"modKit17":-1,"liveryRoof":-1,"modStruts":-1,"modWindows":-1,"neonColor":[255,0,255],"plateIndex":0,"modRoof":-1,"modVanityPlate":-1,"modXenon":false,"modSeats":-1,"modOrnaments":-1,"modHorns":-1,"fuelLevel":65.13491524739108,"modTank":-1,"modShifterLeavers":-1,"modAPlate":-1,"pearlescentColor":32,"modTurbo":false,"modAirFilter":-1,"modBackWheels":-1,"modKit49":-1,"color1":[0,0,0],"modCustomTiresF":false,"modEngine":-1,"modTrunk":-1,"windowTint":-1,"modFrame":-1,"neonEnabled":[false,false,false,false],"tireBurstCompletely":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false},"modSpoilers":-1,"modHood":-1,"bodyHealth":1000.0592475178704,"doorStatus":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false},"modKit21":-1,"color2":[0,0,0],"modLivery":-1,"modEngineBlock":-1,"oilLevel":5.56029764306997,"interiorColor":0,"tireHealth":{"1":1000.0,"2":1000.0,"3":1000.0,"0":1000.0},"modKit47":-1,"modFender":-1,"modHydrolic":-1,"modSideSkirt":-1,"modArchCover":-1,"tireBurstState":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false},"wheelWidth":0.0,"model":1348744438,"modFrontWheels":-1,"engineHealth":1000.0592475178704,"modRearBumper":-1,"wheels":0,"modSuspension":-1,"modArmor":-1,"modSpeakers":-1}', '9JCC299', NULL, 'out', 100, 1000, 1000, 1, 0, NULL, NULL, 0, 0, 0, 0, '[]', NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, '{"keys":{}}', NULL, 0, 'automobile', NULL),
	(8, 'license:d91243c901cd9d58c601cee7c6e6deddb54d616c', 'KQH93442', 'bati', '-114291515', '{"modCustomTiresR":false,"modPlateHolder":-1,"modKit49":-1,"modKit47":-1,"modVanityPlate":-1,"modOrnaments":-1,"modFrame":-1,"modExhaust":-1,"modArchCover":-1,"oilLevel":4.76596940834568,"modSideSkirt":-1,"modSmokeEnabled":false,"modRoof":-1,"modRearBumper":-1,"modSpeakers":-1,"bodyHealth":1000.0592475178704,"neonColor":[255,0,255],"modDial":-1,"modStruts":-1,"modFender":-1,"modXenon":false,"modRightFender":-1,"modShifterLeavers":-1,"dashboardColor":0,"modEngineBlock":-1,"tireBurstState":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false},"xenonColor":255,"modWindows":-1,"wheelColor":27,"modKit19":-1,"modTrimB":-1,"modSuspension":-1,"liveryRoof":-1,"dirtLevel":3.17731293889712,"plate":"5UXD565","modTank":-1,"tankHealth":1000.0592475178704,"modFrontBumper":-1,"wheelSize":0.0,"model":-114291515,"modDashboard":-1,"color2":[9,211,9],"tireBurstCompletely":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false},"wheelWidth":0.0,"modKit21":-1,"windowTint":-1,"modTrimA":-1,"pearlescentColor":111,"interiorColor":0,"modHorns":-1,"modSpoilers":-1,"modHydrolic":-1,"modBrakes":-1,"modTrunk":-1,"modSteeringWheel":-1,"engineHealth":1000.0592475178704,"modGrille":-1,"wheels":6,"neonEnabled":[false,false,false,false],"extras":[],"modHood":-1,"modTurbo":false,"modSeats":-1,"tyreSmokeColor":[255,255,255],"color1":[9,211,9],"plateIndex":0,"fuelLevel":65.13491524739108,"windowStatus":{"1":false,"2":false,"3":false,"4":false,"5":false,"6":true,"7":false,"0":false},"modLivery":-1,"modEngine":-1,"modCustomTiresF":false,"modAerials":-1,"doorStatus":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false},"modAPlate":-1,"modKit17":-1,"modBackWheels":-1,"modTransmission":-1,"modFrontWheels":-1,"modDoorSpeaker":-1,"modArmor":-1,"tireHealth":{"1":1000.0,"2":0.0,"3":0.0,"0":1000.0},"modAirFilter":-1}', '5UXD565', NULL, 'out', 100, 1000, 1000, 1, 0, NULL, NULL, 0, 0, 0, 0, '[]', NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, '{"keys":{}}', NULL, 0, 'automobile', NULL),
	(9, 'license:d91243c901cd9d58c601cee7c6e6deddb54d616c', 'KQH93442', 'rhapsody', '841808271', '{"wheelSize":0.0,"modLivery":-1,"modFrontBumper":-1,"modKit17":-1,"engineHealth":1000.0592475178704,"modShifterLeavers":-1,"modAPlate":-1,"modHydrolic":-1,"extras":[],"modWindows":-1,"modEngine":-1,"pearlescentColor":111,"modTransmission":-1,"modSideSkirt":-1,"modTrimA":-1,"modDial":-1,"modCustomTiresF":false,"modTrunk":-1,"model":841808271,"modDoorSpeaker":-1,"plate":"4UQB595","modFrame":-1,"modGrille":-1,"modTurbo":false,"modBrakes":-1,"bodyHealth":1000.0592475178704,"plateIndex":0,"modExhaust":-1,"wheelWidth":0.0,"modSteeringWheel":-1,"modStruts":-1,"neonColor":[255,0,255],"modHood":-1,"modOrnaments":-1,"doorStatus":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false},"modArchCover":-1,"tireBurstState":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false},"modArmor":-1,"modFender":-1,"modVanityPlate":-1,"modSmokeEnabled":false,"tyreSmokeColor":[255,255,255],"modSpoilers":-1,"modDashboard":-1,"wheelColor":156,"tankHealth":1000.0592475178704,"color2":[180,100,50],"modSpeakers":-1,"fuelLevel":65.13491524739108,"modFrontWheels":-1,"modHorns":-1,"modKit47":-1,"modPlateHolder":-1,"tireHealth":{"1":1000.0,"2":1000.0,"3":1000.0,"0":1000.0},"modTank":-1,"modRightFender":-1,"modSuspension":-1,"liveryRoof":-1,"modEngineBlock":-1,"modAerials":-1,"modKit19":-1,"color1":[180,100,50],"modBackWheels":-1,"modSeats":-1,"neonEnabled":[false,false,false,false],"modXenon":false,"modAirFilter":-1,"modKit21":-1,"dashboardColor":0,"dirtLevel":3.17731293889712,"modRoof":-1,"oilLevel":4.76596940834568,"modKit49":-1,"tireBurstCompletely":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false},"xenonColor":255,"modCustomTiresR":false,"windowTint":-1,"interiorColor":0,"wheels":1,"modRearBumper":-1,"modTrimB":-1,"windowStatus":{"1":true,"2":true,"3":true,"4":false,"5":false,"6":true,"7":true,"0":true}}', '4UQB595', NULL, 'out', 100, 1000, 1000, 1, 0, NULL, NULL, 0, 0, 0, 0, '[]', NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, '{"keys":{}}', NULL, 0, 'automobile', NULL),
	(10, 'license:d91243c901cd9d58c601cee7c6e6deddb54d616c', 'KQH93442', 'asterope2', '-741120335', '{"wheelSize":0.0,"modLivery":-1,"modFrontBumper":-1,"modKit17":-1,"engineHealth":1000.0592475178704,"modShifterLeavers":-1,"modAPlate":-1,"modHydrolic":-1,"extras":[],"modWindows":-1,"modEngine":-1,"pearlescentColor":7,"modTransmission":-1,"modSideSkirt":-1,"modTrimA":-1,"modDial":-1,"modCustomTiresF":false,"modTrunk":-1,"model":-741120335,"modDoorSpeaker":-1,"plate":"1ANQ924","modFrame":-1,"modGrille":-1,"modTurbo":false,"modBrakes":-1,"bodyHealth":1000.0592475178704,"plateIndex":0,"modExhaust":-1,"wheelWidth":0.0,"modSteeringWheel":-1,"modStruts":-1,"neonColor":[255,0,255],"modHood":-1,"modOrnaments":-1,"doorStatus":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false},"modArchCover":-1,"tireBurstState":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false},"modArmor":-1,"modFender":-1,"modVanityPlate":-1,"modSmokeEnabled":false,"tyreSmokeColor":[255,255,255],"modSpoilers":-1,"modDashboard":-1,"wheelColor":156,"tankHealth":1000.0592475178704,"color2":[0,70,40],"modSpeakers":-1,"fuelLevel":65.13491524739108,"modFrontWheels":-1,"modHorns":-1,"modKit47":-1,"modPlateHolder":-1,"tireHealth":{"1":1000.0,"2":1000.0,"3":1000.0,"0":1000.0},"modTank":-1,"modRightFender":-1,"modSuspension":-1,"liveryRoof":-1,"modEngineBlock":-1,"modAerials":-1,"modKit19":-1,"color1":[0,70,40],"modBackWheels":-1,"modSeats":-1,"neonEnabled":[false,false,false,false],"modXenon":false,"modAirFilter":-1,"modKit21":-1,"dashboardColor":156,"dirtLevel":3.17731293889712,"modRoof":-1,"oilLevel":4.76596940834568,"modKit49":-1,"tireBurstCompletely":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false},"xenonColor":255,"modCustomTiresR":false,"windowTint":-1,"interiorColor":154,"wheels":0,"modRearBumper":-1,"modTrimB":-1,"windowStatus":{"1":true,"2":true,"3":true,"4":false,"5":false,"6":true,"7":true,"0":true}}', '1ANQ924', NULL, 'out', 100, 1000, 1000, 1, 0, NULL, NULL, 0, 0, 0, 0, '[]', NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, '{"keys":{}}', NULL, 0, 'automobile', NULL),
	(11, 'license:d91243c901cd9d58c601cee7c6e6deddb54d616c', 'KQH93442', 'speedo', '-810318068', '{"modEngine":-1,"modKit49":-1,"wheelWidth":0.0,"modFrontWheels":-1,"modSideSkirt":-1,"modHydrolic":-1,"modArmor":-1,"modTrimB":-1,"modRearBumper":-1,"modTank":-1,"fuelLevel":65.13491524739108,"modFrontBumper":-1,"modAirFilter":-1,"modSpeakers":-1,"wheelSize":0.0,"windowStatus":{"1":true,"2":true,"3":true,"4":false,"5":false,"6":true,"7":false,"0":true},"modDial":-1,"modBackWheels":-1,"extras":[],"modTrunk":-1,"oilLevel":4.76596940834568,"modWindows":-1,"modPlateHolder":-1,"modFender":-1,"modOrnaments":-1,"pearlescentColor":5,"modSeats":-1,"modExhaust":-1,"neonColor":[255,0,255],"modTransmission":-1,"modCustomTiresR":false,"modKit21":-1,"model":-810318068,"windowTint":-1,"xenonColor":255,"wheelColor":156,"modArchCover":-1,"tireHealth":{"1":1000.0,"2":1000.0,"3":1000.0,"0":1000.0},"neonEnabled":[false,false,false,false],"modAPlate":-1,"modKit19":-1,"modLivery":-1,"modSpoilers":-1,"modSuspension":-1,"tireBurstCompletely":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false},"plateIndex":0,"modDoorSpeaker":-1,"modTrimA":-1,"modCustomTiresF":false,"liveryRoof":-1,"modStruts":-1,"modShifterLeavers":-1,"modEngineBlock":-1,"tireBurstState":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false},"modTurbo":false,"plate":"4BCR865","modFrame":-1,"tankHealth":1000.0592475178704,"modSmokeEnabled":false,"modRoof":-1,"modGrille":-1,"modKit17":-1,"modXenon":false,"modAerials":-1,"modKit47":-1,"dirtLevel":10.32626705141565,"dashboardColor":0,"color1":[100,10,30],"color2":[100,10,30],"modRightFender":-1,"modSteeringWheel":-1,"wheels":1,"modHorns":-1,"modBrakes":-1,"bodyHealth":1000.0592475178704,"modVanityPlate":-1,"doorStatus":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false},"modDashboard":-1,"interiorColor":0,"tyreSmokeColor":[255,255,255],"engineHealth":1000.0592475178704,"modHood":-1}', '4BCR865', NULL, 'out', 100, 1000, 1000, 1, 0, NULL, NULL, 0, 0, 0, 0, '[]', NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, '{"keys":{}}', NULL, 0, 'automobile', NULL),
	(12, 'license:d91243c901cd9d58c601cee7c6e6deddb54d616c', 'FMW68507', 'drafter', '686471183', '{"modArmor":4,"modEngineBlock":-1,"modHood":4,"modRoof":0,"modTurbo":1,"fuelLevel":59.57461760432111,"modKit49":-1,"windowTint":1,"modTrimB":-1,"modHydrolic":-1,"neonColor":[255,0,255],"color2":0,"modSpeakers":-1,"modKit47":-1,"engineHealth":1000.0592475178704,"modDial":-1,"modHorns":-1,"modEngine":3,"modSuspension":4,"bodyHealth":1000.0592475178704,"modArchCover":-1,"oilLevel":6.35462587779425,"extras":[],"tireBurstCompletely":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false},"tireBurstState":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false},"modLivery":4,"dirtLevel":0.0,"neonEnabled":[false,false,false,false],"modTrimA":-1,"wheelWidth":0.55999773740768,"modGrille":1,"modDoorSpeaker":-1,"modStruts":-1,"modWindows":-1,"modTransmission":3,"tankHealth":1000.0592475178704,"wheelColor":111,"modXenon":false,"modAirFilter":-1,"modKit21":-1,"modSmokeEnabled":false,"model":686471183,"wheelSize":0.68999999761581,"modTrunk":-1,"modFrame":-1,"modBackWheels":-1,"plate":"46AAY865","modSteeringWheel":-1,"liveryRoof":-1,"modAPlate":-1,"interiorColor":111,"modExhaust":4,"tyreSmokeColor":[255,255,255],"dashboardColor":111,"windowStatus":{"1":true,"2":true,"3":true,"4":false,"5":false,"6":true,"7":true,"0":true},"modDashboard":-1,"modPlateHolder":-1,"modShifterLeavers":-1,"modFrontWheels":4,"modOrnaments":-1,"color1":111,"wheels":7,"modCustomTiresR":false,"modRearBumper":2,"modBrakes":2,"modTank":-1,"modFender":-1,"modSpoilers":-1,"xenonColor":255,"modKit19":-1,"modCustomTiresF":false,"plateIndex":5,"pearlescentColor":4,"doorStatus":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false},"modVanityPlate":-1,"tireHealth":{"1":1000.0,"2":1000.0,"3":1000.0,"0":1000.0},"modFrontBumper":2,"modKit17":-1,"modRightFender":-1,"modAerials":-1,"modSeats":-1,"modSideSkirt":2}', '46AAY865', NULL, NULL, 100, 1000, 1000, 1, 0, NULL, NULL, 0, 0, 0, 0, '[]', NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, '{"keys":{}}', NULL, 0, 'automobile', NULL),
	(13, 'license:d91243c901cd9d58c601cee7c6e6deddb54d616c', 'FMW68507', 'sultan', '970598228', '{"modVanityPlate":-1,"modKit19":-1,"wheelColor":156,"modKit21":-1,"modSuspension":-1,"xenonColor":255,"doorStatus":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false},"wheelWidth":1.0,"modSeats":-1,"modAerials":-1,"modEngineBlock":-1,"modArchCover":-1,"modAPlate":-1,"color2":1,"extras":{"12":false,"10":true},"color1":1,"modPlateHolder":-1,"pearlescentColor":5,"plate":"65SUW058","modTurbo":false,"liveryRoof":-1,"modKit49":-1,"modFrame":-1,"modHydrolic":-1,"modDoorSpeaker":-1,"windowStatus":{"1":true,"2":true,"3":true,"4":false,"5":false,"6":true,"7":true,"0":true},"windowTint":-1,"wheels":0,"modSteeringWheel":-1,"modTrimA":-1,"engineHealth":1000.0592475178704,"modCustomTiresR":false,"modTransmission":-1,"modTrimB":-1,"tireBurstState":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false},"wheelSize":1.0,"modSpoilers":-1,"modFrontBumper":-1,"tireHealth":{"1":1000.0,"2":1000.0,"3":1000.0,"0":1000.0},"modDashboard":-1,"neonEnabled":[false,false,false,false],"modFender":-1,"neonColor":[255,0,255],"modLivery":-1,"modHorns":-1,"modSmokeEnabled":false,"modOrnaments":-1,"modTrunk":-1,"model":970598228,"dashboardColor":0,"modRightFender":-1,"tireBurstCompletely":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false},"modRearBumper":-1,"modFrontWheels":-1,"bodyHealth":1000.0592475178704,"modSpeakers":-1,"modStruts":-1,"modSideSkirt":-1,"oilLevel":4.76596940834568,"modBackWheels":-1,"modExhaust":-1,"plateIndex":3,"modShifterLeavers":-1,"dirtLevel":0.0,"interiorColor":0,"modKit47":-1,"modArmor":-1,"modTank":-1,"modCustomTiresF":false,"modAirFilter":-1,"modWindows":-1,"tankHealth":1000.0592475178704,"modGrille":-1,"tyreSmokeColor":[255,255,255],"modBrakes":-1,"modEngine":-1,"modKit17":-1,"fuelLevel":55.6029764306997,"modXenon":false,"modDial":-1,"modHood":-1,"modRoof":-1}', '65SUW058', NULL, 'motelgarage', 57, 1000, 1000, 1, 0, NULL, NULL, 0, 0, 0, 0, '[{"garage":"Motel Parking","time":"2025-06-25-19:10","type":"Take Out"},{"garage":"Motel Parking","type":"Take Out","time":"2025-06-30-00:34"}]', NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, '{"keys":{}}', NULL, 0, 'automobile', NULL),
	(14, 'license:d91243c901cd9d58c601cee7c6e6deddb54d616c', 'FMW68507', 'tailgater2', '-1244461404', '{"windowStatus":{"1":true,"2":true,"3":true,"4":false,"5":false,"6":true,"7":true,"0":true},"modOrnaments":-1,"modSideSkirt":-1,"modEngineBlock":-1,"modHood":-1,"modAerials":-1,"dashboardColor":111,"modTrunk":-1,"model":-1244461404,"modBackWheels":-1,"modDoorSpeaker":-1,"windowTint":-1,"pearlescentColor":4,"modEngine":-1,"modTransmission":-1,"wheels":7,"interiorColor":5,"neonEnabled":[false,false,false,false],"modFrontWheels":-1,"modTurbo":false,"doorStatus":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false},"modRearBumper":-1,"tankHealth":1000.0592475178704,"oilLevel":4.76596940834568,"modSteeringWheel":-1,"modRightFender":-1,"modFrame":-1,"modHorns":-1,"extras":{"1":false,"2":true},"modRoof":-1,"neonColor":[255,0,255],"modWindows":-1,"modExhaust":-1,"wheelColor":156,"modDashboard":-1,"modKit49":-1,"modAPlate":-1,"modVanityPlate":-1,"modGrille":-1,"modKit19":-1,"modStruts":-1,"bodyHealth":1000.0592475178704,"tireBurstState":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false},"modXenon":false,"modCustomTiresF":false,"wheelSize":0.0,"modBrakes":-1,"modArchCover":-1,"modTrimA":-1,"modSpeakers":-1,"plate":"1WFK318","modShifterLeavers":-1,"modSmokeEnabled":false,"engineHealth":1000.0592475178704,"wheelWidth":0.0,"modTrimB":-1,"modSpoilers":-1,"modSuspension":-1,"color1":[200,190,160],"modKit21":-1,"modKit47":-1,"modTank":-1,"dirtLevel":3.17731293889712,"xenonColor":255,"modAirFilter":-1,"tireHealth":{"1":1000.0,"2":1000.0,"3":1000.0,"0":1000.0},"liveryRoof":-1,"tireBurstCompletely":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false},"modFender":-1,"modFrontBumper":-1,"plateIndex":0,"modHydrolic":-1,"modCustomTiresR":false,"modLivery":-1,"fuelLevel":54.80864819597542,"modSeats":-1,"color2":[200,190,160],"tyreSmokeColor":[255,255,255],"modArmor":-1,"modKit17":-1,"modDial":-1,"modPlateHolder":-1}', '1WFK318', NULL, 'out', 100, 1000, 1000, 1, 0, NULL, NULL, 0, 0, 0, 0, '[]', NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, '{"keys":{}}', NULL, 0, 'automobile', NULL),
	(15, 'license:d91243c901cd9d58c601cee7c6e6deddb54d616c', 'FMW68507', 'ingot', '-1289722222', '{"windowStatus":{"1":true,"2":true,"3":true,"4":false,"5":false,"6":true,"7":true,"0":true},"modOrnaments":-1,"modSideSkirt":-1,"modEngineBlock":-1,"modHood":-1,"modAerials":-1,"dashboardColor":0,"modTrunk":-1,"model":-1289722222,"modBackWheels":-1,"modDoorSpeaker":-1,"windowTint":-1,"pearlescentColor":80,"modEngine":-1,"modTransmission":-1,"wheels":0,"interiorColor":0,"neonEnabled":[false,false,false,false],"modFrontWheels":-1,"modTurbo":false,"doorStatus":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false},"modRearBumper":-1,"tankHealth":1000.0592475178704,"oilLevel":4.76596940834568,"modSteeringWheel":-1,"modRightFender":-1,"modFrame":-1,"modHorns":-1,"extras":{"11":false,"10":false,"1":true},"modRoof":-1,"neonColor":[255,0,255],"modWindows":-1,"modExhaust":-1,"wheelColor":156,"modDashboard":-1,"modKit49":-1,"modAPlate":-1,"modVanityPlate":-1,"modGrille":-1,"modKit19":-1,"modStruts":-1,"bodyHealth":1000.0592475178704,"tireBurstState":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false},"modXenon":false,"modCustomTiresF":false,"wheelSize":0.0,"modBrakes":-1,"modArchCover":-1,"modTrimA":-1,"modSpeakers":-1,"plate":"9XXS323","modShifterLeavers":-1,"modSmokeEnabled":false,"engineHealth":1000.0592475178704,"wheelWidth":0.0,"modTrimB":-1,"modSpoilers":-1,"modSuspension":-1,"color1":[15,15,15],"modKit21":-1,"modKit47":-1,"modTank":-1,"dirtLevel":8.73761058196709,"xenonColor":255,"modAirFilter":-1,"tireHealth":{"1":1000.0,"2":1000.0,"3":1000.0,"0":1000.0},"liveryRoof":-1,"tireBurstCompletely":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false},"modFender":-1,"modFrontBumper":-1,"plateIndex":3,"modHydrolic":-1,"modCustomTiresR":false,"modLivery":-1,"fuelLevel":65.13491524739108,"modSeats":-1,"color2":[8,8,8],"tyreSmokeColor":[255,255,255],"modArmor":-1,"modKit17":-1,"modDial":-1,"modPlateHolder":-1}', '9XXS323', NULL, 'out', 100, 1000, 1000, 1, 0, NULL, NULL, 0, 0, 0, 0, '[]', NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, '{"keys":{}}', NULL, 0, 'automobile', NULL),
	(16, 'license:d91243c901cd9d58c601cee7c6e6deddb54d616c', 'FMW68507', 'cinquemila', '-1527436269', '{"modKit19":-1,"wheelWidth":1.0,"fuelLevel":17.47522116393419,"modExhaust":-1,"engineHealth":1000.0592475178704,"modFrame":-1,"modFrontWheels":-1,"modVanityPlate":-1,"modTrimB":-1,"modDial":-1,"modTank":-1,"modHydrolic":-1,"modSpoilers":-1,"modGrille":-1,"tankHealth":4000.2369900714818,"modOrnaments":-1,"tireHealth":{"1":1000.0,"2":1000.0,"3":1000.0,"0":1000.0},"modArchCover":-1,"modRearBumper":-1,"modTrunk":-1,"modEngineBlock":-1,"modTransmission":-1,"modDashboard":-1,"modAirFilter":-1,"interiorColor":88,"modRightFender":-1,"modCustomTiresR":false,"liveryRoof":-1,"neonEnabled":[false,false,false,false],"modCustomTiresF":false,"windowStatus":{"1":true,"2":true,"3":true,"4":false,"5":false,"6":true,"7":true,"0":true},"modArmor":-1,"modFrontBumper":-1,"bodyHealth":1000.0592475178704,"plate":"6IDV544","model":-1527436269,"neonColor":[255,0,255],"modSeats":-1,"plateIndex":0,"wheels":0,"modKit17":-1,"modSuspension":-1,"oilLevel":6.35462587779425,"modLivery":-1,"extras":[],"modBackWheels":-1,"modBrakes":-1,"modRoof":-1,"color1":[210,190,140],"modStruts":-1,"tireBurstState":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false},"xenonColor":255,"modSpeakers":-1,"modAPlate":-1,"modKit49":-1,"windowTint":-1,"modDoorSpeaker":-1,"modHorns":-1,"wheelSize":1.0,"modSideSkirt":-1,"modAerials":-1,"modXenon":false,"dashboardColor":134,"modHood":-1,"modShifterLeavers":-1,"modPlateHolder":-1,"pearlescentColor":2,"tyreSmokeColor":[255,255,255],"doorStatus":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false},"modTurbo":false,"modEngine":-1,"modSmokeEnabled":false,"modKit21":-1,"modTrimA":-1,"color2":[210,190,140],"modSteeringWheel":-1,"modKit47":-1,"modWindows":-1,"wheelColor":0,"modFender":-1,"dirtLevel":0.0,"tireBurstCompletely":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false}}', '6IDV544', NULL, 'out', 100, 1000, 1000, 1, 0, NULL, NULL, 0, 0, 0, 0, '[]', NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, '{"keys":{}}', NULL, 0, 'automobile', NULL),
	(17, 'license:d91243c901cd9d58c601cee7c6e6deddb54d616c', 'FMW68507', 'premier', '-1883869285', '{"windowStatus":{"1":true,"2":true,"3":true,"4":false,"5":false,"6":true,"7":true,"0":true},"modOrnaments":-1,"modSideSkirt":-1,"modEngineBlock":-1,"modHood":-1,"modAerials":-1,"dashboardColor":0,"modTrunk":-1,"model":-1883869285,"modBackWheels":-1,"modDoorSpeaker":-1,"windowTint":-1,"pearlescentColor":111,"modEngine":-1,"modTransmission":-1,"wheels":0,"interiorColor":0,"neonEnabled":[false,false,false,false],"modFrontWheels":-1,"modTurbo":false,"doorStatus":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false},"modRearBumper":-1,"tankHealth":1000.0592475178704,"oilLevel":4.76596940834568,"modSteeringWheel":-1,"modRightFender":-1,"modFrame":-1,"modHorns":-1,"extras":{"12":true,"11":false},"modRoof":-1,"neonColor":[255,0,255],"modWindows":-1,"modExhaust":-1,"wheelColor":156,"modDashboard":-1,"modKit49":-1,"modAPlate":-1,"modVanityPlate":-1,"modGrille":-1,"modKit19":-1,"modStruts":-1,"bodyHealth":1000.0592475178704,"tireBurstState":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false},"modXenon":false,"modCustomTiresF":false,"wheelSize":0.0,"modBrakes":-1,"modArchCover":-1,"modTrimA":-1,"modSpeakers":-1,"plate":"0ILA887","modShifterLeavers":-1,"modSmokeEnabled":false,"engineHealth":1000.0592475178704,"wheelWidth":0.0,"modTrimB":-1,"modSpoilers":-1,"modSuspension":-1,"color1":[28,49,64],"modKit21":-1,"modKit47":-1,"modTank":-1,"dirtLevel":11.91492352086422,"xenonColor":255,"modAirFilter":-1,"tireHealth":{"1":1000.0,"2":1000.0,"3":1000.0,"0":1000.0},"liveryRoof":-1,"tireBurstCompletely":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false},"modFender":-1,"modFrontBumper":-1,"plateIndex":0,"modHydrolic":-1,"modCustomTiresR":false,"modLivery":-1,"fuelLevel":65.13491524739108,"modSeats":-1,"color2":[8,8,8],"tyreSmokeColor":[255,255,255],"modArmor":-1,"modKit17":-1,"modDial":-1,"modPlateHolder":-1}', '0ILA887', NULL, 'out', 100, 1000, 1000, 1, 0, NULL, NULL, 0, 0, 0, 0, '[]', NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, '{"keys":{}}', NULL, 0, 'automobile', NULL),
	(18, 'license:d91243c901cd9d58c601cee7c6e6deddb54d616c', 'FMW68507', 'jubilee', '461465043', '{"modSmokeEnabled":false,"wheels":3,"modTurbo":false,"modCustomTiresF":false,"modHydrolic":-1,"modFender":-1,"modFrontBumper":-1,"windowTint":-1,"modRoof":-1,"modSideSkirt":-1,"modArchCover":-1,"modSteeringWheel":-1,"oilLevel":4.76596940834568,"xenonColor":255,"modStruts":-1,"modKit21":-1,"dashboardColor":134,"modTank":-1,"modFrontWheels":-1,"modSuspension":-1,"tireBurstState":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false},"modShifterLeavers":-1,"tyreSmokeColor":[255,255,255],"modHorns":-1,"modAirFilter":-1,"modBrakes":-1,"tireHealth":{"1":1000.0,"2":1000.0,"3":1000.0,"0":1000.0},"modOrnaments":-1,"engineHealth":1000.0592475178704,"modTrimB":-1,"modTransmission":-1,"modCustomTiresR":false,"doorStatus":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false},"extras":[],"modRearBumper":-1,"modTrimA":-1,"modVanityPlate":-1,"modArmor":-1,"color1":[180,100,50],"modGrille":-1,"modExhaust":-1,"modBackWheels":-1,"modDashboard":-1,"plate":"1SIV295","modPlateHolder":-1,"dirtLevel":8.73761058196709,"modEngine":-1,"modTrunk":-1,"modAerials":-1,"modWindows":-1,"fuelLevel":65.13491524739108,"modSeats":-1,"modXenon":false,"wheelWidth":0.0,"tireBurstCompletely":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false},"modKit49":-1,"liveryRoof":-1,"pearlescentColor":111,"bodyHealth":1000.0592475178704,"modKit19":-1,"modDial":-1,"wheelSize":0.0,"neonEnabled":[false,false,false,false],"modDoorSpeaker":-1,"modSpoilers":-1,"modHood":-1,"modRightFender":-1,"interiorColor":93,"windowStatus":{"1":true,"2":true,"3":true,"4":true,"5":true,"6":true,"7":true,"0":true},"neonColor":[255,0,255],"modAPlate":-1,"plateIndex":0,"modEngineBlock":-1,"modKit17":-1,"modFrame":-1,"tankHealth":1000.0592475178704,"wheelColor":0,"modSpeakers":-1,"model":461465043,"modKit47":-1,"modLivery":-1,"color2":[180,100,50]}', '1SIV295', NULL, 'out', 100, 1000, 1000, 1, 0, NULL, NULL, 0, 0, 0, 0, '[]', NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, '{"keys":{}}', NULL, 0, 'automobile', NULL),
	(19, 'license:d91243c901cd9d58c601cee7c6e6deddb54d616c', 'FMW68507', 'stratum', '1723137093', '{"modKit47":-1,"modFender":-1,"modCustomTiresF":false,"liveryRoof":-1,"modSmokeEnabled":false,"tyreSmokeColor":[255,255,255],"modXenon":false,"modAerials":-1,"modBackWheels":-1,"windowStatus":{"1":true,"2":true,"3":true,"4":false,"5":false,"6":true,"7":true,"0":true},"modHorns":-1,"modLivery":-1,"modWindows":-1,"dashboardColor":0,"bodyHealth":1000.0592475178704,"color2":[15,15,15],"tankHealth":1000.0592475178704,"modDial":-1,"modArchCover":-1,"modSeats":-1,"modBrakes":-1,"pearlescentColor":18,"modRightFender":-1,"interiorColor":0,"modKit49":-1,"modHood":-1,"modVanityPlate":-1,"modExhaust":-1,"modCustomTiresR":false,"modShifterLeavers":-1,"xenonColor":255,"modFrame":-1,"dirtLevel":8.73761058196709,"modSideSkirt":-1,"modEngine":-1,"wheels":5,"neonColor":[255,0,255],"modKit17":-1,"modSteeringWheel":-1,"modTrunk":-1,"color1":[15,15,15],"modSpeakers":-1,"modKit21":-1,"modPlateHolder":-1,"tireBurstState":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false},"modKit19":-1,"modHydrolic":-1,"modFrontWheels":-1,"tireHealth":{"1":1000.0,"2":1000.0,"3":1000.0,"0":1000.0},"wheelSize":0.0,"modAPlate":-1,"modTank":-1,"modDashboard":-1,"modTrimB":-1,"modGrille":-1,"modRoof":-1,"modStruts":-1,"neonEnabled":[false,false,false,false],"modTurbo":false,"modTransmission":-1,"extras":{"7":false,"2":false,"1":false,"10":true,"11":false,"6":false,"5":false},"modDoorSpeaker":-1,"windowTint":-1,"doorStatus":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false},"oilLevel":4.76596940834568,"wheelColor":156,"engineHealth":1000.0592475178704,"plateIndex":3,"modOrnaments":-1,"modTrimA":-1,"wheelWidth":0.0,"modFrontBumper":-1,"fuelLevel":38.92208350148979,"modEngineBlock":-1,"tireBurstCompletely":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false},"modRearBumper":-1,"plate":"4EZT783","modArmor":-1,"model":1723137093,"modSpoilers":-1,"modAirFilter":-1,"modSuspension":-1}', '4EZT783', NULL, 'out', 100, 1000, 1000, 1, 0, NULL, NULL, 0, 0, 0, 0, '[]', NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, '{"keys":{}}', NULL, 0, 'automobile', NULL),
	(20, 'license:d91243c901cd9d58c601cee7c6e6deddb54d616c', 'VNJ60175', 'drafter', '686471183', '{"modVanityPlate":-1,"modKit19":-1,"wheelColor":111,"modKit21":-1,"modSuspension":4,"xenonColor":255,"doorStatus":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false},"wheelWidth":0.55999773740768,"modSeats":-1,"modAerials":-1,"modEngineBlock":-1,"modArchCover":-1,"modAPlate":-1,"color2":0,"extras":[],"color1":111,"modPlateHolder":-1,"pearlescentColor":4,"plate":"01NSJ938","modTurbo":1,"liveryRoof":-1,"modKit49":-1,"modFrame":-1,"modHydrolic":-1,"modDoorSpeaker":-1,"windowStatus":{"1":true,"2":true,"3":true,"4":false,"5":false,"6":true,"7":true,"0":true},"windowTint":1,"wheels":7,"modSteeringWheel":-1,"modTrimA":-1,"engineHealth":1000.0592475178704,"modCustomTiresR":false,"modTransmission":3,"modTrimB":-1,"tireBurstState":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false},"wheelSize":0.68999999761581,"modSpoilers":-1,"modFrontBumper":2,"tireHealth":{"1":1000.0,"2":1000.0,"3":1000.0,"0":1000.0},"modDashboard":-1,"neonEnabled":[false,false,false,false],"modFender":-1,"neonColor":[255,0,255],"modLivery":4,"modHorns":-1,"modSmokeEnabled":false,"modOrnaments":-1,"modTrunk":-1,"model":686471183,"dashboardColor":111,"modRightFender":1,"tireBurstCompletely":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false},"modRearBumper":2,"modFrontWheels":4,"bodyHealth":1000.0592475178704,"modSpeakers":-1,"modStruts":-1,"modSideSkirt":2,"oilLevel":6.35462587779425,"modBackWheels":-1,"modExhaust":5,"plateIndex":5,"modShifterLeavers":-1,"dirtLevel":0.0,"interiorColor":111,"modKit47":-1,"modArmor":4,"modTank":-1,"modCustomTiresF":false,"modAirFilter":-1,"modWindows":-1,"tankHealth":1000.0592475178704,"modGrille":1,"tyreSmokeColor":[255,255,255],"modBrakes":2,"modEngine":3,"modKit17":-1,"fuelLevel":57.98596113487255,"modXenon":false,"modDial":-1,"modHood":4,"modRoof":-1}', '01NSJ938', NULL, 'motelgarage', 52, 1000, 1000, 1, 0, NULL, NULL, 0, 0, 0, 0, '[{"garage":"Motel Parking","time":"2025-07-04-20:40","type":"Take Out"}]', NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, '{"keys":{}}', NULL, 0, 'automobile', NULL),
	(21, 'license:d91243c901cd9d58c601cee7c6e6deddb54d616c', 'VNJ60175', 'baller8', '-863358884', '{"tyreSmokeColor":[255,255,255],"modBrakes":-1,"dirtLevel":7.94328234724281,"modFender":-1,"engineHealth":1000.0592475178704,"model":-863358884,"plate":"9YRW101","modXenon":false,"tireBurstState":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false},"modKit21":-1,"wheelSize":0.0,"liveryRoof":-1,"modFrontBumper":-1,"modTrimB":-1,"oilLevel":4.76596940834568,"tankHealth":1000.0592475178704,"modDashboard":-1,"modSpoilers":-1,"modShifterLeavers":-1,"xenonColor":255,"modRearBumper":-1,"modKit19":-1,"modHood":-1,"modFrontWheels":-1,"modSpeakers":-1,"modKit17":-1,"modCustomTiresF":false,"color1":[180,100,50],"modSideSkirt":-1,"modLivery":-1,"modRightFender":-1,"modTrimA":-1,"neonColor":[255,0,255],"windowStatus":{"1":true,"2":true,"3":true,"4":false,"5":false,"6":true,"7":true,"0":true},"modAPlate":-1,"modArchCover":-1,"neonEnabled":[false,false,false,false],"interiorColor":99,"pearlescentColor":34,"dashboardColor":6,"modRoof":-1,"modCustomTiresR":false,"modStruts":-1,"modAirFilter":-1,"modBackWheels":-1,"modSteeringWheel":-1,"modHydrolic":-1,"modKit47":-1,"doorStatus":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false},"tireHealth":{"1":1000.0,"2":1000.0,"3":1000.0,"0":1000.0},"modKit49":-1,"color2":[180,100,50],"modArmor":-1,"modEngine":-1,"modTransmission":-1,"modSmokeEnabled":false,"modVanityPlate":-1,"extras":[],"modDoorSpeaker":-1,"plateIndex":0,"modWindows":-1,"modSeats":-1,"tireBurstCompletely":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false},"fuelLevel":65.13491524739108,"modFrame":-1,"modPlateHolder":-1,"modEngineBlock":-1,"wheels":3,"modOrnaments":-1,"modTurbo":false,"modTrunk":-1,"bodyHealth":1000.0592475178704,"modExhaust":-1,"modSuspension":-1,"wheelColor":6,"windowTint":-1,"modAerials":-1,"modDial":-1,"modGrille":-1,"modHorns":-1,"wheelWidth":0.0,"modTank":-1}', '9YRW101', NULL, 'motelgarage', 22, 1000, 1000, 1, 0, NULL, NULL, 0, 0, 0, 0, '[]', NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, '{"keys":{}}', NULL, 0, 'automobile', NULL),
	(22, 'license:d91243c901cd9d58c601cee7c6e6deddb54d616c', 'VNJ60175', 'tailgater2', '-1244461404', '{"modOrnaments":-1,"modDial":-1,"modTank":-1,"tankHealth":1000.0592475178704,"modGrille":-1,"modSpoilers":-1,"wheels":7,"wheelWidth":0.0,"modRearBumper":-1,"dashboardColor":111,"neonColor":[255,0,255],"modShifterLeavers":-1,"plate":"1KSF214","modHydrolic":-1,"modTrimA":-1,"modTransmission":-1,"modAerials":-1,"modTrimB":-1,"modAirFilter":-1,"engineHealth":1000.0592475178704,"modExhaust":-1,"modDashboard":-1,"modHorns":-1,"modBrakes":-1,"modSteeringWheel":-1,"modSideSkirt":-1,"modStruts":-1,"tireBurstState":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false},"modFrontWheels":-1,"color2":[210,190,140],"doorStatus":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false},"plateIndex":0,"xenonColor":255,"modKit47":-1,"modCustomTiresF":false,"modRoof":-1,"modSeats":-1,"modArmor":-1,"modKit17":-1,"wheelSize":0.0,"windowStatus":{"1":true,"2":true,"3":true,"4":false,"5":false,"6":true,"7":true,"0":true},"modSmokeEnabled":false,"modFender":-1,"modKit21":-1,"liveryRoof":-1,"modAPlate":-1,"bodyHealth":1000.0592475178704,"interiorColor":5,"wheelColor":156,"modDoorSpeaker":-1,"tireBurstCompletely":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false},"modRightFender":-1,"modTrunk":-1,"modPlateHolder":-1,"oilLevel":4.76596940834568,"modTurbo":false,"modCustomTiresR":false,"modBackWheels":-1,"dirtLevel":4.76596940834568,"modEngine":-1,"modVanityPlate":-1,"pearlescentColor":4,"model":-1244461404,"tyreSmokeColor":[255,255,255],"windowTint":-1,"modXenon":false,"modFrame":-1,"extras":{"1":false,"2":true},"modHood":-1,"modSpeakers":-1,"tireHealth":{"1":1000.0,"2":1000.0,"3":1000.0,"0":1000.0},"modWindows":-1,"color1":[210,190,140],"modKit49":-1,"neonEnabled":[false,false,false,false],"modLivery":-1,"modFrontBumper":-1,"fuelLevel":65.13491524739108,"modKit19":-1,"modSuspension":-1,"modArchCover":-1,"modEngineBlock":-1}', '1KSF214', NULL, 'out', 100, 1000, 1000, 1, 0, NULL, NULL, 0, 0, 0, 0, '[]', NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, '{"keys":{}}', NULL, 0, 'automobile', NULL),
	(23, 'license:d91243c901cd9d58c601cee7c6e6deddb54d616c', 'VNJ60175', 'primo', '-1150599089', '{"modFrontWheels":-1,"plate":"4PGJ447","modRoof":-1,"modArchCover":-1,"wheelSize":0.0,"modKit21":-1,"neonEnabled":[false,false,false,false],"modAirFilter":-1,"modKit47":-1,"modPlateHolder":-1,"modSpeakers":-1,"modFender":-1,"modTrunk":-1,"neonColor":[255,0,255],"tireHealth":{"1":1000.0,"2":1000.0,"3":1000.0,"0":1000.0},"tireBurstState":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false},"fuelLevel":72.28386935990962,"tankHealth":1000.0592475178704,"modTransmission":-1,"wheelWidth":0.0,"modArmor":-1,"modStruts":-1,"xenonColor":255,"tyreSmokeColor":[255,255,255],"modLivery":-1,"modShifterLeavers":-1,"modCustomTiresR":false,"modSideSkirt":-1,"model":-1150599089,"wheels":0,"modEngineBlock":-1,"engineHealth":1000.0592475178704,"extras":{"11":false,"12":false},"modDoorSpeaker":-1,"modFrame":-1,"modTurbo":false,"modBrakes":-1,"modHood":-1,"modTank":-1,"modDashboard":-1,"modVanityPlate":-1,"modSteeringWheel":-1,"modHorns":-1,"bodyHealth":1000.0592475178704,"modSuspension":-1,"doorStatus":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false},"modKit49":-1,"modRightFender":-1,"dirtLevel":3.9716411736214,"modAerials":-1,"modAPlate":-1,"pearlescentColor":5,"modSmokeEnabled":false,"modTrimA":-1,"modOrnaments":-1,"modFrontBumper":-1,"interiorColor":0,"modRearBumper":-1,"oilLevel":4.76596940834568,"wheelColor":156,"dashboardColor":0,"modSpoilers":-1,"modDial":-1,"modHydrolic":-1,"modEngine":-1,"modSeats":-1,"windowTint":-1,"modGrille":-1,"liveryRoof":-1,"color1":[30,40,80],"modExhaust":-1,"windowStatus":{"1":true,"2":true,"3":true,"4":false,"5":false,"6":true,"7":true,"0":true},"modBackWheels":-1,"tireBurstCompletely":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false},"color2":[30,40,80],"modKit17":-1,"modKit19":-1,"modWindows":-1,"modXenon":false,"modTrimB":-1,"plateIndex":3,"modCustomTiresF":false}', '4PGJ447', NULL, 'out', 100, 1000, 1000, 1, 0, NULL, NULL, 0, 0, 0, 0, '[]', NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, '{"keys":{}}', NULL, 0, 'automobile', NULL),
	(24, 'license:d91243c901cd9d58c601cee7c6e6deddb54d616c', 'GEM97486', 'drafter', '686471183', '{"modAPlate":-1,"modWindows":-1,"modHood":4,"modKit47":-1,"pearlescentColor":4,"modHydrolic":-1,"modRearBumper":2,"modRightFender":1,"modCustomTiresF":false,"tireHealth":{"1":1000.0,"2":1000.0,"3":1000.0,"0":1000.0},"modTrimB":-1,"modAerials":-1,"modTank":-1,"modEngineBlock":-1,"modTransmission":3,"modPlateHolder":-1,"tireBurstState":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false},"modTurbo":false,"tireBurstCompletely":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false},"tyreSmokeColor":[255,255,255],"neonEnabled":[false,false,false,false],"modBackWheels":-1,"wheels":4,"modSmokeEnabled":false,"fuelLevel":63.54625877794252,"dirtLevel":0.0,"modEngine":-1,"modSuspension":4,"modStruts":-1,"windowStatus":{"1":true,"2":true,"3":true,"4":false,"5":false,"6":true,"7":true,"0":false},"modSeats":-1,"wheelColor":111,"modExhaust":4,"modFrontWheels":-1,"engineHealth":1000.0592475178704,"modOrnaments":-1,"oilLevel":6.35462587779425,"bodyHealth":1000.0592475178704,"xenonColor":255,"modTrunk":-1,"interiorColor":111,"tankHealth":1000.0592475178704,"modXenon":false,"plateIndex":0,"extras":[],"modFrame":-1,"dashboardColor":111,"modArchCover":-1,"modDoorSpeaker":-1,"modArmor":4,"liveryRoof":-1,"windowTint":1,"modLivery":-1,"plate":"22IDK137","modDial":-1,"modSteeringWheel":-1,"modFrontBumper":2,"modVanityPlate":-1,"color1":131,"doorStatus":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false},"modCustomTiresR":false,"modSpeakers":-1,"modKit21":-1,"modGrille":3,"modSideSkirt":2,"modDashboard":-1,"modKit19":-1,"modRoof":0,"modKit49":-1,"modAirFilter":-1,"wheelWidth":1.0,"modShifterLeavers":-1,"model":686471183,"neonColor":[255,0,255],"modBrakes":2,"modTrimA":-1,"modFender":-1,"modKit17":-1,"modSpoilers":7,"wheelSize":1.0,"modHorns":-1,"color2":0}', '22IDK137', NULL, 'motelgarage', 59, 1000, 1000, 1, 0, NULL, NULL, 0, 0, 0, 0, '[{"time":"2025-07-15-13:19","garage":"Motel Parking","type":"Take Out"}]', NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, '{"keys":{}}', NULL, 0, 'automobile', NULL);

-- tablo yapısı dökülüyor temelpaket.player_warns
CREATE TABLE IF NOT EXISTS `player_warns` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `senderIdentifier` varchar(50) DEFAULT NULL,
  `targetIdentifier` varchar(50) DEFAULT NULL,
  `reason` text DEFAULT NULL,
  `warnId` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- temelpaket.player_warns: ~0 rows (yaklaşık) tablosu için veriler indiriliyor
DELETE FROM `player_warns`;

-- tablo yapısı dökülüyor temelpaket.qb_banking_societies
CREATE TABLE IF NOT EXISTS `qb_banking_societies` (
  `society` varchar(255) DEFAULT NULL,
  `society_name` varchar(255) DEFAULT NULL,
  `value` int(50) DEFAULT NULL,
  `iban` varchar(255) NOT NULL,
  `is_withdrawing` int(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- temelpaket.qb_banking_societies: ~0 rows (yaklaşık) tablosu için veriler indiriliyor
DELETE FROM `qb_banking_societies`;

-- tablo yapısı dökülüyor temelpaket.qb_banking_transactions
CREATE TABLE IF NOT EXISTS `qb_banking_transactions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `receiver_identifier` varchar(255) NOT NULL,
  `receiver_name` varchar(255) NOT NULL,
  `sender_identifier` varchar(255) NOT NULL,
  `sender_name` varchar(255) NOT NULL,
  `date` varchar(255) NOT NULL,
  `value` int(50) NOT NULL,
  `type` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- temelpaket.qb_banking_transactions: ~5 rows (yaklaşık) tablosu için veriler indiriliyor
DELETE FROM `qb_banking_transactions`;
INSERT INTO `qb_banking_transactions` (`id`, `receiver_identifier`, `receiver_name`, `sender_identifier`, `sender_name`, `date`, `value`, `type`) VALUES
	(1, 'bank', 'Bank (PIN)', 'NOF79195', 'Emre Alan', '2025-05-05 02:18:42', 0, 'transfer'),
	(2, 'bank', 'Bank (IBAN)', 'YAP86904', 'Holly Store', '2025-05-22 14:10:38', 5000, 'transfer'),
	(3, 'bank', 'Bank (PIN)', 'YAP86904', 'Holly Store', '2025-05-22 14:10:47', 0, 'transfer'),
	(4, 'bank', 'Banka Hesabı', 'YAP86904', 'Holly Store', '2025-05-22 14:10:59', 200, 'deposit'),
	(5, 'YAP86904', 'Holly Store', 'bank', 'Banka Hesabı', '2025-05-22 15:13:53', 140, 'withdraw');

-- tablo yapısı dökülüyor temelpaket.spy_bodycam
CREATE TABLE IF NOT EXISTS `spy_bodycam` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `job` varchar(255) NOT NULL,
  `videolink` longtext NOT NULL,
  `street` varchar(255) NOT NULL,
  `date` varchar(255) NOT NULL,
  `playername` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- temelpaket.spy_bodycam: ~1 rows (yaklaşık) tablosu için veriler indiriliyor
DELETE FROM `spy_bodycam`;
INSERT INTO `spy_bodycam` (`id`, `job`, `videolink`, `street`, `date`, `playername`) VALUES
	(42, 'police', 'https://files.fivemerr.com/videos/9404109d-f1b6-4df5-b0b4-06f9af7f9bc6.webm', 'Atlee St', '2025-07-03', 'Mile Wurden');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
