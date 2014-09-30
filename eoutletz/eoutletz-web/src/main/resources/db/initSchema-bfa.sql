
CREATE TABLE IF NOT EXISTS `partner_alliance` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `allianceId` varchar(255) DEFAULT NULL,
  `allianceName` varchar(255) DEFAULT NULL,
  `employerId` varchar(255) DEFAULT NULL,
  `employerName` varchar(255) DEFAULT NULL,
  `marketPlaceLogoUrl` varchar(255) DEFAULT NULL,
  `partnerLogoUrl` varchar(255) DEFAULT NULL,
  `createdTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY (`allianceId`,`employerId`)
);

CREATE TABLE IF NOT EXISTS `token` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `accessToken` varchar(255) DEFAULT NULL,
  `createdTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
);

CREATE TABLE IF NOT EXISTS `user` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `active` char(1) DEFAULT NULL,
  `baUserId` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `employerId` varchar(255) DEFAULT NULL,
  `firstName` varchar(255) DEFAULT NULL,
  `lastName` varchar(255) DEFAULT NULL,
  `payFrequency` int(11) DEFAULT NULL,
  `refId` varchar(255) DEFAULT NULL,
  `userName` varchar(255) DEFAULT NULL,
  `createdTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY (`refId`)
);

CREATE TABLE IF NOT EXISTS `user_benefit` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `userBenefitId` varchar(255) DEFAULT NULL,
  `benefitId` varchar(255) DEFAULT NULL,
  `benefitType` varchar(255) DEFAULT NULL,
  `benefitTypeId` varchar(255) DEFAULT NULL,
  `userId` int(20) DEFAULT NULL,
  `createdTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `benefitId` (`benefitId`,`userId`,`userBenefitId`),
  KEY `userId` (`userId`),
  CONSTRAINT FOREIGN KEY (`userId`) REFERENCES `user` (`id`)
);

CREATE TABLE IF NOT EXISTS `user_dependent` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `baDependentId` varchar(255) DEFAULT NULL,
  `bfDependentId` varchar(255) DEFAULT NULL,
  `userId` int(20) DEFAULT NULL,
  `createdTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY (`bfDependentId`,`baDependentId`,`userId`),
  KEY (`userId`),
  CONSTRAINT FOREIGN KEY (`userId`) REFERENCES `user` (`id`)
);

CREATE TABLE IF NOT EXISTS `user_person` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `personId` varchar(255) DEFAULT NULL,
  `userId` int(20) DEFAULT NULL,
  `createdTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY (`userId`),
  CONSTRAINT FOREIGN KEY (`userId`) REFERENCES `user` (`id`)
);

DROP TABLE IF EXISTS `user_token`;

CREATE TABLE IF NOT EXISTS `user_cookie` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `createdTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `cookie` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `userId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY (`cookie`,`userId`),
  KEY (`userId`),
  CONSTRAINT FOREIGN KEY (`userId`) REFERENCES `user` (`id`)
);

/*
Drop BFA unused tables
*/
DROP TABLE IF EXISTS user_hra;
DROP TABLE IF EXISTS expense_set_hra;
DROP TABLE IF EXISTS hra;