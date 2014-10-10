# ************************************************************
# Sequel Pro SQL dump
# Version 4096
#
# http://www.sequelpro.com/
# http://code.google.com/p/sequel-pro/
#
# Host: 127.0.0.1 (MySQL 5.6.21)
# Database: eOutletz
# Generation Time: 2014-10-10 02:24:19 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table Address
# ------------------------------------------------------------

DROP TABLE IF EXISTS `Address`;

CREATE TABLE `Address` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `address1` varchar(255) NOT NULL,
  `address2` varchar(255) DEFAULT NULL,
  `city` varchar(255) NOT NULL,
  `state` varchar(255) NOT NULL,
  `country` varchar(255) NOT NULL,
  `postalcode` varchar(255) NOT NULL,
  `user_id` int(11) NOT NULL,
  `address_type_id` int(11) NOT NULL,
  `create_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `Address_Address_Type` (`address_type_id`),
  KEY `Address_User` (`user_id`),
  CONSTRAINT `Address_Address_Type` FOREIGN KEY (`address_type_id`) REFERENCES `Address_Type` (`id`),
  CONSTRAINT `Address_User` FOREIGN KEY (`user_id`) REFERENCES `User` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

LOCK TABLES `Address` WRITE;
/*!40000 ALTER TABLE `Address` DISABLE KEYS */;

INSERT INTO `Address` (`id`, `address1`, `address2`, `city`, `state`, `country`, `postalcode`, `user_id`, `address_type_id`, `create_date`, `update_date`)
VALUES
	(1,'3200 zanker rd','6622','san jose','ca','usa','98888',1,1,'2014-10-09 19:16:08','2014-10-09 19:16:08'),
	(2,'1700 halford ave','115','santa clara','ca','usa','95054',7,1,'2014-10-09 19:17:15','2014-10-09 19:17:15');

/*!40000 ALTER TABLE `Address` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table Address_Type
# ------------------------------------------------------------

DROP TABLE IF EXISTS `Address_Type`;

CREATE TABLE `Address_Type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

LOCK TABLES `Address_Type` WRITE;
/*!40000 ALTER TABLE `Address_Type` DISABLE KEYS */;

INSERT INTO `Address_Type` (`id`, `type`)
VALUES
	(1,'billing'),
	(2,'shipping');

/*!40000 ALTER TABLE `Address_Type` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table Color
# ------------------------------------------------------------

DROP TABLE IF EXISTS `Color`;

CREATE TABLE `Color` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `color` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

LOCK TABLES `Color` WRITE;
/*!40000 ALTER TABLE `Color` DISABLE KEYS */;

INSERT INTO `Color` (`id`, `color`)
VALUES
	(1,'black'),
	(2,'yellow');

/*!40000 ALTER TABLE `Color` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table Order
# ------------------------------------------------------------

DROP TABLE IF EXISTS `Order`;

CREATE TABLE `Order` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `payment_type_id` int(11) NOT NULL,
  `create_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `address_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `Order_Address` (`address_id`),
  KEY `Order_Payment_Type` (`payment_type_id`),
  KEY `Order_Product` (`product_id`),
  KEY `Order_User` (`user_id`),
  CONSTRAINT `Order_Address` FOREIGN KEY (`address_id`) REFERENCES `Address` (`id`),
  CONSTRAINT `Order_Payment_Type` FOREIGN KEY (`payment_type_id`) REFERENCES `Payment_Type` (`id`),
  CONSTRAINT `Order_Product` FOREIGN KEY (`product_id`) REFERENCES `Product` (`id`),
  CONSTRAINT `Order_User` FOREIGN KEY (`user_id`) REFERENCES `User` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

LOCK TABLES `Order` WRITE;
/*!40000 ALTER TABLE `Order` DISABLE KEYS */;

INSERT INTO `Order` (`id`, `product_id`, `user_id`, `payment_type_id`, `create_date`, `update_date`, `address_id`)
VALUES
	(1,1,1,1,'2014-10-09 19:16:21','2014-10-09 19:16:21',1),
	(2,2,1,2,'2014-10-09 19:16:38','2014-10-09 19:16:38',1),
	(3,3,8,2,'2014-10-09 19:22:09','2014-10-09 19:22:13',2),
	(4,40,9,3,'2014-10-09 19:22:41','2014-10-09 19:22:41',2);

/*!40000 ALTER TABLE `Order` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table Order_Status
# ------------------------------------------------------------

DROP TABLE IF EXISTS `Order_Status`;

CREATE TABLE `Order_Status` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `status` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

LOCK TABLES `Order_Status` WRITE;
/*!40000 ALTER TABLE `Order_Status` DISABLE KEYS */;

INSERT INTO `Order_Status` (`id`, `status`)
VALUES
	(1,1),
	(2,2),
	(3,3);

/*!40000 ALTER TABLE `Order_Status` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table Order_Tracking
# ------------------------------------------------------------

DROP TABLE IF EXISTS `Order_Tracking`;

CREATE TABLE `Order_Tracking` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `create_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `order_id` int(11) NOT NULL,
  `comments` varchar(255) NOT NULL,
  `Order_Status_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `Order_Tracking_Order` (`order_id`),
  KEY `Order_Tracking_Order_Status` (`Order_Status_id`),
  CONSTRAINT `Order_Tracking_Order` FOREIGN KEY (`order_id`) REFERENCES `Order` (`id`),
  CONSTRAINT `Order_Tracking_Order_Status` FOREIGN KEY (`Order_Status_id`) REFERENCES `Order_Status` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

LOCK TABLES `Order_Tracking` WRITE;
/*!40000 ALTER TABLE `Order_Tracking` DISABLE KEYS */;

INSERT INTO `Order_Tracking` (`id`, `create_date`, `update_date`, `order_id`, `comments`, `Order_Status_id`)
VALUES
	(1,'2014-10-09 19:20:17','2014-10-09 19:20:17',1,'this is sample tracking',1),
	(2,'2014-10-09 19:20:31','2014-10-09 19:20:31',1,'this is sample tracking',2),
	(3,'2014-10-09 19:20:45','2014-10-09 19:20:45',2,'this is sample tracking',3);

/*!40000 ALTER TABLE `Order_Tracking` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table Partner
# ------------------------------------------------------------

DROP TABLE IF EXISTS `Partner`;

CREATE TABLE `Partner` (
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `create_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

LOCK TABLES `Partner` WRITE;
/*!40000 ALTER TABLE `Partner` DISABLE KEYS */;

INSERT INTO `Partner` (`name`, `email`, `id`, `create_date`, `update_date`)
VALUES
	('raj','raj@raj.com',1,'2014-10-09 18:40:24','2014-10-09 18:40:42');

/*!40000 ALTER TABLE `Partner` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table Partner_Contact
# ------------------------------------------------------------

DROP TABLE IF EXISTS `Partner_Contact`;

CREATE TABLE `Partner_Contact` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `address1` varchar(255) NOT NULL,
  `address2` varchar(255) DEFAULT NULL,
  `city` varchar(255) NOT NULL,
  `state` varchar(255) NOT NULL,
  `country` varchar(255) NOT NULL,
  `type_id` int(11) NOT NULL,
  `partner_id` int(11) NOT NULL,
  `create_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `Partner_Contact_Partner` (`partner_id`),
  CONSTRAINT `Partner_Contact_Partner` FOREIGN KEY (`partner_id`) REFERENCES `Partner` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

LOCK TABLES `Partner_Contact` WRITE;
/*!40000 ALTER TABLE `Partner_Contact` DISABLE KEYS */;

INSERT INTO `Partner_Contact` (`id`, `address1`, `address2`, `city`, `state`, `country`, `type_id`, `partner_id`, `create_date`, `update_date`)
VALUES
	(1,'3200 zanker rd','3344','san jose','ca','usa',1,1,'2014-10-09 18:41:43','2014-10-09 18:41:43');

/*!40000 ALTER TABLE `Partner_Contact` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table Payment_Type
# ------------------------------------------------------------

DROP TABLE IF EXISTS `Payment_Type`;

CREATE TABLE `Payment_Type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

LOCK TABLES `Payment_Type` WRITE;
/*!40000 ALTER TABLE `Payment_Type` DISABLE KEYS */;

INSERT INTO `Payment_Type` (`id`, `type`)
VALUES
	(1,'master card'),
	(2,'visa card'),
	(3,'paypal');

/*!40000 ALTER TABLE `Payment_Type` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table Phone
# ------------------------------------------------------------

DROP TABLE IF EXISTS `Phone`;

CREATE TABLE `Phone` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(255) NOT NULL,
  `phone` varchar(15) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `Phone_User` (`user_id`),
  CONSTRAINT `Phone_User` FOREIGN KEY (`user_id`) REFERENCES `User` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

LOCK TABLES `Phone` WRITE;
/*!40000 ALTER TABLE `Phone` DISABLE KEYS */;

INSERT INTO `Phone` (`id`, `type`, `phone`, `user_id`)
VALUES
	(1,'mobile','4088678877',1),
	(2,'home','4332218764',7);

/*!40000 ALTER TABLE `Phone` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table Product
# ------------------------------------------------------------

DROP TABLE IF EXISTS `Product`;

CREATE TABLE `Product` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_category_id` int(11) NOT NULL,
  `sku` varchar(25) NOT NULL DEFAULT '',
  `name` varchar(255) NOT NULL,
  `price` decimal(12,2) NOT NULL,
  `description` varchar(1000) NOT NULL,
  `image` blob NOT NULL,
  `partner_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `msrp` decimal(12,2) NOT NULL,
  `units_in_stock` int(11) NOT NULL,
  `units_in_order` int(11) NOT NULL,
  `unit_price` decimal(12,2) NOT NULL,
  `create_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `product_Partner` (`partner_id`),
  KEY `product_category_product` (`product_category_id`),
  CONSTRAINT `product_Partner` FOREIGN KEY (`partner_id`) REFERENCES `Partner` (`id`),
  CONSTRAINT `product_category_product` FOREIGN KEY (`product_category_id`) REFERENCES `Product_Category` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=latin1;

LOCK TABLES `Product` WRITE;
/*!40000 ALTER TABLE `Product` DISABLE KEYS */;

INSERT INTO `Product` (`id`, `product_category_id`, `sku`, `name`, `price`, `description`, `image`, `partner_id`, `quantity`, `msrp`, `units_in_stock`, `units_in_order`, `unit_price`, `create_date`, `update_date`)
VALUES
	(1,1,'SSS3324431','Adidas Men Blue & Red Striped Polo T-shirt',12.11,'is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.',X'687474703A2F2F64656D6F2E31386D617265742E636F6D2F64656D6F2F6D696D6974792F696D616765732F70726F647563742D382E6A7067',1,2,11.00,1,1,11.11,'2014-10-09 18:49:25','2014-10-09 18:57:53'),
	(2,2,'SSS3324432','Adidas Men Blue & Red Striped Polo T-shirt',12.11,'is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.',X'687474703A2F2F64656D6F2E31386D617265742E636F6D2F64656D6F2F6D696D6974792F696D616765732F70726F647563742D31302E6A7067',1,2,11.00,1,1,11.11,'2014-10-09 18:49:25','2014-10-09 18:57:54'),
	(3,4,'SSS3324433','Adidas Men Blue & Red Striped Polo T-shirt',12.11,'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).',X'687474703A2F2F64656D6F2E31386D617265742E636F6D2F64656D6F2F6D696D6974792F696D616765732F70726F647563742D382E6A7067',1,2,11.00,1,1,11.11,'2014-10-09 18:49:25','2014-10-09 19:12:49'),
	(4,3,'SSS3324434','Adidas Men Flame Black T-shirt',12.11,'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).',X'687474703A2F2F64656D6F2E31386D617265742E636F6D2F64656D6F2F6D696D6974792F696D616765732F70726F647563742D382E6A7067',1,2,11.00,1,1,11.11,'2014-10-09 18:49:25','2014-10-09 19:12:51'),
	(5,2,'SSS3324434','Adidas Men Flame Black T-shirt',12.11,'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).',X'687474703A2F2F64656D6F2E31386D617265742E636F6D2F64656D6F2F6D696D6974792F696D616765732F70726F647563742D382E6A7067',1,2,11.00,1,1,11.11,'2014-10-09 18:49:25','2014-10-09 19:12:53'),
	(6,3,'SSS3324434','Adidas Men Blue & Red Striped Polo T-shirt',12.11,'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).',X'687474703A2F2F64656D6F2E31386D617265742E636F6D2F64656D6F2F6D696D6974792F696D616765732F70726F647563742D382E6A7067',1,2,11.00,1,1,11.11,'2014-10-09 18:49:25','2014-10-09 19:12:54'),
	(7,3,'SSS3324434','Adidas Men Flame Black T-shirt',12.11,'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).',X'687474703A2F2F64656D6F2E31386D617265742E636F6D2F64656D6F2F6D696D6974792F696D616765732F70726F647563742D382E6A7067',1,2,11.00,1,1,11.11,'2014-10-09 18:49:25','2014-10-09 19:13:02'),
	(8,2,'SSS3324434','Adidas Men Red Printed T-shirt',12.11,'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).',X'687474703A2F2F64656D6F2E31386D617265742E636F6D2F64656D6F2F6D696D6974792F696D616765732F70726F647563742D382E6A7067',1,2,11.00,1,1,11.11,'2014-10-09 18:49:25','2014-10-09 19:13:04'),
	(9,4,'SSS3324434','Adidas Men Red Printed T-shirt',12.11,'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).',X'687474703A2F2F64656D6F2E31386D617265742E636F6D2F64656D6F2F6D696D6974792F696D616765732F70726F647563742D382E6A7067',1,2,11.00,1,1,11.11,'2014-10-09 18:49:25','2014-10-09 19:13:06'),
	(10,3,'SSS3324434','Adidas Men Flame Black T-shirt',12.11,'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).',X'687474703A2F2F64656D6F2E31386D617265742E636F6D2F64656D6F2F6D696D6974792F696D616765732F70726F647563742D382E6A7067',1,2,11.00,1,1,11.11,'2014-10-09 18:49:25','2014-10-09 19:13:08'),
	(11,2,'SSS3324434','Live Nation ACDC Gray T-Shirt',12.11,'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).',X'687474703A2F2F64656D6F2E31386D617265742E636F6D2F64656D6F2F6D696D6974792F696D616765732F70726F647563742D382E6A7067',1,2,11.00,1,1,11.11,'2014-10-09 18:49:25','2014-10-09 19:13:11'),
	(12,3,'SSS3324434','Live Nation ACDC Gray T-Shirt',12.11,'is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.',X'687474703A2F2F64656D6F2E31386D617265742E636F6D2F64656D6F2F6D696D6974792F696D616765732F70726F647563742D382E6A7067',1,2,11.00,1,1,11.11,'2014-10-09 18:49:25','2014-10-09 19:13:13'),
	(13,2,'SSS3324434','Live Nation ACDC Gray T-Shirt',12.11,'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).',X'687474703A2F2F64656D6F2E31386D617265742E636F6D2F64656D6F2F6D696D6974792F696D616765732F70726F647563742D382E6A7067',1,2,11.00,1,1,11.11,'2014-10-09 18:49:25','2014-10-09 19:13:15'),
	(14,2,'SSS3324434','Live Nation ACDC Gray T-Shirt',12.11,'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).',X'687474703A2F2F64656D6F2E31386D617265742E636F6D2F64656D6F2F6D696D6974792F696D616765732F70726F647563742D382E6A7067',1,2,11.00,1,1,11.11,'2014-10-09 18:49:25','2014-10-09 19:13:18'),
	(15,3,'SSS3324434','Live Nation ACDC Gray T-Shirt',12.11,'is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.',X'687474703A2F2F64656D6F2E31386D617265742E636F6D2F64656D6F2F6D696D6974792F696D616765732F70726F647563742D382E6A7067',1,2,11.00,1,1,11.11,'2014-10-09 18:49:25','2014-10-09 19:13:20'),
	(16,4,'SSS3324434','Live Nation ACDC Gray T-Shirt',12.11,'There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn\'t anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable. The generated Lorem Ipsum is therefore always free from repetition, injected humour, or non-characteristic words etc',X'687474703A2F2F64656D6F2E31386D617265742E636F6D2F64656D6F2F6D696D6974792F696D616765732F70726F647563742D382E6A7067',1,2,11.00,1,1,11.11,'2014-10-09 18:49:25','2014-10-09 19:13:22'),
	(17,2,'SSS3324434','Live Nation ACDC Gray T-Shirt',12.11,'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).',X'687474703A2F2F64656D6F2E31386D617265742E636F6D2F64656D6F2F6D696D6974792F696D616765732F70726F647563742D382E6A7067',1,2,11.00,1,1,11.11,'2014-10-09 18:49:25','2014-10-09 19:13:24'),
	(18,4,'SSS3324434','Live Nation ACDC Gray T-Shirt',12.11,'There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn\'t anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable. The generated Lorem Ipsum is therefore always free from repetition, injected humour, or non-characteristic words etc',X'687474703A2F2F64656D6F2E31386D617265742E636F6D2F64656D6F2F6D696D6974792F696D616765732F70726F647563742D382E6A7067',1,2,11.00,1,1,11.11,'2014-10-09 18:49:25','2014-10-09 19:13:26'),
	(19,2,'SSS3324434','Age Of Wisdom Tan Graphic Tee',12.11,'is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.',X'687474703A2F2F64656D6F2E31386D617265742E636F6D2F64656D6F2F6D696D6974792F696D616765732F70726F647563742D382E6A7067',1,2,11.00,1,1,11.11,'2014-10-09 18:49:25','2014-10-09 19:13:28'),
	(20,3,'SSS3324434','Age Of Wisdom Tan Graphic Tee',12.11,'There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn\'t anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable. The generated Lorem Ipsum is therefore always free from repetition, injected humour, or non-characteristic words etc',X'687474703A2F2F64656D6F2E31386D617265742E636F6D2F64656D6F2F6D696D6974792F696D616765732F70726F647563742D382E6A7067',1,2,11.00,1,1,11.11,'2014-10-09 18:49:25','2014-10-09 19:13:30'),
	(21,2,'SSS3324434','Age Of Wisdom Tan Graphic Tee',12.11,'is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.',X'687474703A2F2F64656D6F2E31386D617265742E636F6D2F64656D6F2F6D696D6974792F696D616765732F70726F647563742D382E6A7067',1,2,11.00,1,1,11.11,'2014-10-09 18:49:25','2014-10-09 19:13:32'),
	(22,3,'SSS3324434','Age Of Wisdom Tan Graphic Tee',12.11,'is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.',X'687474703A2F2F64656D6F2E31386D617265742E636F6D2F64656D6F2F6D696D6974792F696D616765732F70726F647563742D382E6A7067',1,2,11.00,1,1,11.11,'2014-10-09 18:49:25','2014-10-09 19:13:34'),
	(23,2,'SSS3324434','Classic Laundry Green Graphic T-Shirt',12.11,'There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn\'t anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable. The generated Lorem Ipsum is therefore always free from repetition, injected humour, or non-characteristic words etc',X'687474703A2F2F64656D6F2E31386D617265742E636F6D2F64656D6F2F6D696D6974792F696D616765732F70726F647563742D382E6A7067',1,2,11.00,1,1,11.11,'2014-10-09 18:49:25','2014-10-09 19:13:36'),
	(24,3,'SSS3324434','Classic Laundry Green Graphic T-Shirt',12.11,'There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn\'t anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable. The generated Lorem Ipsum is therefore always free from repetition, injected humour, or non-characteristic words etc',X'687474703A2F2F64656D6F2E31386D617265742E636F6D2F64656D6F2F6D696D6974792F696D616765732F70726F647563742D382E6A7067',1,2,11.00,1,1,11.11,'2014-10-09 18:49:25','2014-10-09 19:13:38'),
	(25,2,'SSS3324434','Classic Laundry Green Graphic T-Shirt',12.11,'There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn\'t anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable. The generated Lorem Ipsum is therefore always free from repetition, injected humour, or non-characteristic words etc',X'687474703A2F2F64656D6F2E31386D617265742E636F6D2F64656D6F2F6D696D6974792F696D616765732F70726F647563742D382E6A7067',1,2,11.00,1,1,11.11,'2014-10-09 18:49:25','2014-10-09 19:13:40'),
	(26,3,'SSS3324434','Age Of Wisdom Tan Graphic Tee',12.11,'is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.',X'687474703A2F2F64656D6F2E31386D617265742E636F6D2F64656D6F2F6D696D6974792F696D616765732F70726F647563742D382E6A7067',1,2,11.00,1,1,11.11,'2014-10-09 18:49:25','2014-10-09 19:13:42'),
	(27,3,'SSS3324434','Classic Laundry Green Graphic T-Shirt',12.11,'There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn\'t anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable. The generated Lorem Ipsum is therefore always free from repetition, injected humour, or non-characteristic words etc',X'687474703A2F2F64656D6F2E31386D617265742E636F6D2F64656D6F2F6D696D6974792F696D616765732F70726F647563742D382E6A7067',1,2,11.00,1,1,11.11,'2014-10-09 18:49:25','2014-10-09 19:13:45'),
	(28,2,'SSS3324434','Classic Laundry Green Graphic T-Shirt',12.11,'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).',X'687474703A2F2F64656D6F2E31386D617265742E636F6D2F64656D6F2F6D696D6974792F696D616765732F70726F647563742D382E6A7067',1,2,11.00,1,1,11.11,'2014-10-09 18:49:25','2014-10-09 19:13:47'),
	(29,3,'SSS3324434','Live Nation ACDC Gray T-Shirt',12.11,'There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn\'t anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable. The generated Lorem Ipsum is therefore always free from repetition, injected humour, or non-characteristic words etc',X'687474703A2F2F64656D6F2E31386D617265742E636F6D2F64656D6F2F6D696D6974792F696D616765732F70726F647563742D382E6A7067',1,2,11.00,1,1,11.11,'2014-10-09 18:49:25','2014-10-09 19:13:54'),
	(30,2,'SSS3324434','Classic Laundry Green Graphic T-Shirt',12.11,'is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.',X'687474703A2F2F64656D6F2E31386D617265742E636F6D2F64656D6F2F6D696D6974792F696D616765732F70726F647563742D382E6A7067',1,2,11.00,1,1,11.11,'2014-10-09 18:49:25','2014-10-09 19:13:56'),
	(31,3,'SSS3324434','Classic Laundry Green Graphic T-Shirt',12.11,'There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn\'t anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable. The generated Lorem Ipsum is therefore always free from repetition, injected humour, or non-characteristic words etc',X'687474703A2F2F64656D6F2E31386D617265742E636F6D2F64656D6F2F6D696D6974792F696D616765732F70726F647563742D382E6A7067',1,2,11.00,1,1,11.11,'2014-10-09 18:49:25','2014-10-09 19:13:58'),
	(32,2,'SSS3324434','Disc Jockey Print T-Shirt',12.11,'There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn\'t anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable. The generated Lorem Ipsum is therefore always free from repetition, injected humour, or non-characteristic words etc',X'687474703A2F2F64656D6F2E31386D617265742E636F6D2F64656D6F2F6D696D6974792F696D616765732F70726F647563742D382E6A7067',1,2,11.00,1,1,11.11,'2014-10-09 18:49:25','2014-10-09 19:14:02'),
	(33,3,'SSS3324434','Disc Jockey Print T-Shirt',12.11,'is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.',X'687474703A2F2F64656D6F2E31386D617265742E636F6D2F64656D6F2F6D696D6974792F696D616765732F70726F647563742D382E6A7067',1,2,11.00,1,1,11.11,'2014-10-09 18:49:25','2014-10-09 19:14:05'),
	(34,2,'SSS3324434','Disc Jockey Print T-Shirt',12.11,'There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn\'t anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable. The generated Lorem Ipsum is therefore always free from repetition, injected humour, or non-characteristic words etc',X'687474703A2F2F64656D6F2E31386D617265742E636F6D2F64656D6F2F6D696D6974792F696D616765732F70726F647563742D382E6A7067',1,2,11.00,1,1,11.11,'2014-10-09 18:49:25','2014-10-09 19:14:06'),
	(35,3,'SSS3324434','Disc Jockey Print T-Shirt',12.11,'There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn\'t anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable. The generated Lorem Ipsum is therefore always free from repetition, injected humour, or non-characteristic words etc',X'687474703A2F2F64656D6F2E31386D617265742E636F6D2F64656D6F2F6D696D6974792F696D616765732F70726F647563742D382E6A7067',1,2,11.00,1,1,11.11,'2014-10-09 18:49:25','2014-10-09 19:14:08'),
	(36,2,'SSS3324434','Disc Jockey Print T-Shirt',12.11,'There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn\'t anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable. The generated Lorem Ipsum is therefore always free from repetition, injected humour, or non-characteristic words etc',X'687474703A2F2F64656D6F2E31386D617265742E636F6D2F64656D6F2F6D696D6974792F696D616765732F70726F647563742D382E6A7067',1,2,11.00,1,1,11.11,'2014-10-09 18:49:25','2014-10-09 19:14:09'),
	(37,3,'SSS3324434','Disc Jockey Print T-Shirt',12.11,'There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn\'t anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable. The generated Lorem Ipsum is therefore always free from repetition, injected humour, or non-characteristic words etc',X'687474703A2F2F64656D6F2E31386D617265742E636F6D2F64656D6F2F6D696D6974792F696D616765732F70726F647563742D382E6A7067',1,2,11.00,1,1,11.11,'2014-10-09 18:49:25','2014-10-09 19:14:11'),
	(38,4,'SSS3324434','Disc Jockey Print T-Shirt',12.11,'There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn\'t anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable. The generated Lorem Ipsum is therefore always free from repetition, injected humour, or non-characteristic words etc',X'687474703A2F2F64656D6F2E31386D617265742E636F6D2F64656D6F2F6D696D6974792F696D616765732F70726F647563742D382E6A7067',1,2,11.00,1,1,11.11,'2014-10-09 18:49:25','2014-10-09 19:14:16'),
	(39,2,'SSS3324434','Disc Jockey Print T-Shirt',12.11,'There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn\'t anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable. The generated Lorem Ipsum is therefore always free from repetition, injected humour, or non-characteristic words etc',X'687474703A2F2F64656D6F2E31386D617265742E636F6D2F64656D6F2F6D696D6974792F696D616765732F70726F647563742D382E6A7067',1,2,11.00,1,1,11.11,'2014-10-09 18:49:25','2014-10-09 19:14:17'),
	(40,3,'SSS3324434','Disc Jockey Print T-Shirt',12.11,'There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn\'t anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable. The generated Lorem Ipsum is therefore always free from repetition, injected humour, or non-characteristic words etc',X'687474703A2F2F64656D6F2E31386D617265742E636F6D2F64656D6F2F6D696D6974792F696D616765732F70726F647563742D382E6A7067',1,2,11.00,1,1,11.11,'2014-10-09 18:49:25','2014-10-09 19:14:19'),
	(41,2,'SSS3324434','Disc Jockey Print T-Shirt',12.11,'There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn\'t anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable. The generated Lorem Ipsum is therefore always free from repetition, injected humour, or non-characteristic words etc',X'687474703A2F2F64656D6F2E31386D617265742E636F6D2F64656D6F2F6D696D6974792F696D616765732F70726F647563742D382E6A7067',1,2,11.00,1,1,11.11,'2014-10-09 18:49:25','2014-10-09 19:14:23'),
	(42,4,'SSS3324434','Disc Jockey Print T-Shirt',12.11,'There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn\'t anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable. The generated Lorem Ipsum is therefore always free from repetition, injected humour, or non-characteristic words etc',X'687474703A2F2F64656D6F2E31386D617265742E636F6D2F64656D6F2F6D696D6974792F696D616765732F64657461696C312D732E6A7067',1,2,11.00,1,1,11.11,'2014-10-09 18:49:25','2014-10-09 19:14:25'),
	(43,2,'SSS3324434','Disc Jockey Print T-Shirt',12.11,'There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn\'t anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable. The generated Lorem Ipsum is therefore always free from repetition, injected humour, or non-characteristic words etc',X'687474703A2F2F64656D6F2E31386D617265742E636F6D2F64656D6F2F6D696D6974792F696D616765732F70726F647563742D31312E6A7067',1,2,11.00,1,1,11.11,'2014-10-09 18:49:25','2014-10-09 19:14:27');

/*!40000 ALTER TABLE `Product` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table Product_Category
# ------------------------------------------------------------

DROP TABLE IF EXISTS `Product_Category`;

CREATE TABLE `Product_Category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

LOCK TABLES `Product_Category` WRITE;
/*!40000 ALTER TABLE `Product_Category` DISABLE KEYS */;

INSERT INTO `Product_Category` (`id`, `name`)
VALUES
	(1,'Cras justo odio'),
	(2,'Dapibus ac facilisis in'),
	(3,'Morbi leo risus'),
	(4,'Porta ac consectetur ac');

/*!40000 ALTER TABLE `Product_Category` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table Product_Color
# ------------------------------------------------------------

DROP TABLE IF EXISTS `Product_Color`;

CREATE TABLE `Product_Color` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `color_id` int(11) NOT NULL,
  `create_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `Product_Color_Color` (`color_id`),
  KEY `Product_Color_Product` (`product_id`),
  CONSTRAINT `Product_Color_Color` FOREIGN KEY (`color_id`) REFERENCES `Color` (`id`),
  CONSTRAINT `Product_Color_Product` FOREIGN KEY (`product_id`) REFERENCES `Product` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Dump of table Product_Size
# ------------------------------------------------------------

DROP TABLE IF EXISTS `Product_Size`;

CREATE TABLE `Product_Size` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `size_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `create_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `Product_Size_Product` (`product_id`),
  KEY `Product_Size_Size` (`size_id`),
  CONSTRAINT `Product_Size_Product` FOREIGN KEY (`product_id`) REFERENCES `Product` (`id`),
  CONSTRAINT `Product_Size_Size` FOREIGN KEY (`size_id`) REFERENCES `Size` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=latin1;

LOCK TABLES `Product_Size` WRITE;
/*!40000 ALTER TABLE `Product_Size` DISABLE KEYS */;

INSERT INTO `Product_Size` (`id`, `size_id`, `product_id`, `create_date`, `update_date`)
VALUES
	(1,1,1,'2014-10-09 19:03:20','2014-10-09 19:03:20'),
	(3,2,2,'2014-10-09 19:03:20','2014-10-09 19:04:01'),
	(4,3,3,'2014-10-09 19:03:20','2014-10-09 19:04:05'),
	(5,4,4,'2014-10-09 19:03:20','2014-10-09 19:04:09'),
	(6,5,5,'2014-10-09 19:03:20','2014-10-09 19:04:13'),
	(7,6,6,'2014-10-09 19:03:20','2014-10-09 19:04:22'),
	(8,1,7,'2014-10-09 19:03:20','2014-10-09 19:04:29'),
	(9,2,8,'2014-10-09 19:03:20','2014-10-09 19:04:35'),
	(10,3,9,'2014-10-09 19:03:20','2014-10-09 19:04:38'),
	(11,4,10,'2014-10-09 19:03:20','2014-10-09 19:04:43'),
	(12,5,11,'2014-10-09 19:03:20','2014-10-09 19:04:47'),
	(13,6,12,'2014-10-09 19:03:20','2014-10-09 19:04:53'),
	(14,1,13,'2014-10-09 19:03:20','2014-10-09 19:05:09'),
	(15,2,14,'2014-10-09 19:03:20','2014-10-09 19:05:13'),
	(16,3,15,'2014-10-09 19:03:20','2014-10-09 19:06:41'),
	(17,4,15,'2014-10-09 19:03:20','2014-10-09 19:06:45'),
	(18,5,16,'2014-10-09 19:03:20','2014-10-09 19:06:51'),
	(19,6,15,'2014-10-09 19:03:20','2014-10-09 19:06:55'),
	(20,1,14,'2014-10-09 19:03:20','2014-10-09 19:07:04'),
	(21,2,17,'2014-10-09 19:03:20','2014-10-09 19:08:12'),
	(22,2,18,'2014-10-09 19:03:20','2014-10-09 19:08:17'),
	(23,2,19,'2014-10-09 19:03:20','2014-10-09 19:08:20'),
	(24,2,20,'2014-10-09 19:03:20','2014-10-09 19:08:24'),
	(25,2,22,'2014-10-09 19:03:20','2014-10-09 19:08:28'),
	(26,5,16,'2014-10-09 19:03:20','2014-10-09 19:08:44'),
	(27,6,24,'2014-10-09 19:03:20','2014-10-09 19:11:34'),
	(28,1,32,'2014-10-09 19:03:20','2014-10-09 19:11:38'),
	(29,2,24,'2014-10-09 19:03:20','2014-10-09 19:11:45'),
	(30,5,33,'2014-10-09 19:03:20','2014-10-09 19:11:59'),
	(31,5,32,'2014-10-09 19:03:20','2014-10-09 19:12:04'),
	(32,2,14,'2014-10-09 19:03:20','2014-10-09 19:05:13'),
	(33,2,27,'2014-10-09 19:03:20','2014-10-09 19:12:16'),
	(34,2,30,'2014-10-09 19:03:20','2014-10-09 19:12:27');

/*!40000 ALTER TABLE `Product_Size` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table Size
# ------------------------------------------------------------

DROP TABLE IF EXISTS `Size`;

CREATE TABLE `Size` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `size` char(3) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

LOCK TABLES `Size` WRITE;
/*!40000 ALTER TABLE `Size` DISABLE KEYS */;

INSERT INTO `Size` (`id`, `size`)
VALUES
	(1,'S'),
	(2,'XS'),
	(3,'M'),
	(4,'L'),
	(5,'XL'),
	(6,'XXL');

/*!40000 ALTER TABLE `Size` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table User
# ------------------------------------------------------------

DROP TABLE IF EXISTS `User`;

CREATE TABLE `User` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `firstname` varchar(255) NOT NULL,
  `lastname` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL DEFAULT '',
  `merchant` char(1) NOT NULL DEFAULT 'N',
  `create_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;

LOCK TABLES `User` WRITE;
/*!40000 ALTER TABLE `User` DISABLE KEYS */;

INSERT INTO `User` (`id`, `firstname`, `lastname`, `email`, `password`, `merchant`, `create_date`, `update_date`)
VALUES
	(1,'venkanna','balaji','test-us-92492228@paypal.com','11111111','N','2014-10-06 22:09:26','2014-10-06 22:09:26'),
	(7,'venkanna','ttrrfff','test-us-9249228@paypal.com','11111111','N','2014-10-07 17:18:44','2014-10-07 17:18:44'),
	(8,'venkanna','ttrrfff','test-us-924929@paypal.com','8a84698280b745ee93593324cf874e03282cc040','N','2014-10-08 18:20:40','2014-10-08 18:20:40'),
	(9,'venkanna','ttrrfff','test-us-92408@paypal.com','15ed59f2650ea8252b3aba597e98f091b03d788d','N','2014-10-08 18:41:47','2014-10-08 18:41:47'),
	(10,'venkanna','ttrrfff','test-us-92409@paypal.com','a479461541eb56e53659abc69a822f8aa485c77c','N','2014-10-08 18:55:22','2014-10-08 18:55:22'),
	(11,'venkanna','ttrrfff','test-us-92410@paypal.com','367edf9d634afb07dc2ac0d5b5d75c78b771b6fd','N','2014-10-08 19:01:33','2014-10-08 19:01:33');

/*!40000 ALTER TABLE `User` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
