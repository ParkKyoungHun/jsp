CREATE TABLE `goods_info` (
	`ginum` INT(11) NOT NULL AUTO_INCREMENT,
	`giname` VARCHAR(200) NOT NULL,
	`gidesc` VARCHAR(300) NULL DEFAULT NULL,
	`vinum` INT(11) NOT NULL,
	`gicredat` DATETIME NULL DEFAULT NULL,
	`gimofdat` DATETIME NULL DEFAULT NULL,
	`gicreusr` INT(11) NULL DEFAULT NULL,
	`gimofusr` INT(11) NULL DEFAULT NULL,
	PRIMARY KEY (`ginum`)
)
CREATE TABLE `vendor_info` (
	`vinum` INT(11) NOT NULL AUTO_INCREMENT,
	`viname` VARCHAR(200) NOT NULL,
	`videsc` VARCHAR(300) NULL DEFAULT NULL,
	PRIMARY KEY (`vinum`)
)