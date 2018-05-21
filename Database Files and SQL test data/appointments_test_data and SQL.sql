BEGIN TRANSACTION;
CREATE DATABASE `dbname`;

CREATE TABLE IF NOT EXISTS `appointments` (
	`id`	INTEGER PRIMARY KEY AUTOINCREMENT,
	`date`	VARCHAR(255) NOT NULL,
	`time`	VARCHAR(255) NOT NULL,
	`desc`	VARCHAR(255) NOT NULL
);
INSERT INTO `appointments` VALUES (1,'05/05/2018','11:20am','Important ');
INSERT INTO `appointments` VALUES (2,'05/31/2018','11:20am','Meeting coming ahead ');
INSERT INTO `appointments` VALUES (3,'06/31/2018','06:20pm','Tom visiting');
INSERT INTO `appointments` VALUES (4,'06/31/2018','1:20pm','Clarence check up');
INSERT INTO `appointments` VALUES (5,'06/31/2018','06:20pm','Tom visiting');
INSERT INTO `appointments` VALUES (6,'05/31/2018','11:20am','Meeting coming ahead ');
COMMIT;


