# ************************************************************
# Sequel Pro SQL dump
# Version 4096
#
# http://www.sequelpro.com/
# http://code.google.com/p/sequel-pro/
#
# Host: 127.0.0.1 (MySQL 5.6.21)
# Database: eOutletz
# Generation Time: 2014-10-11 16:23:11 +0000
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



# Dump of table Address_Type
# ------------------------------------------------------------

CREATE TABLE `Address_Type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;



# Dump of table Category
# ------------------------------------------------------------

CREATE TABLE `Category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;



# Dump of table Color
# ------------------------------------------------------------

CREATE TABLE `Color` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `color` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;



# Dump of table Order
# ------------------------------------------------------------

CREATE TABLE `Order` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `payment_type_id` int(11) NOT NULL,
  `create_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `address_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `Order_Address` (`address_id`),
  KEY `Order_Payment_Type` (`payment_type_id`),
  KEY `Order_User` (`user_id`),
  CONSTRAINT `Order_Address` FOREIGN KEY (`address_id`) REFERENCES `Address` (`id`),
  CONSTRAINT `Order_Payment_Type` FOREIGN KEY (`payment_type_id`) REFERENCES `Payment_Type` (`id`),
  CONSTRAINT `Order_User` FOREIGN KEY (`user_id`) REFERENCES `User` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;



# Dump of table Order_Status
# ------------------------------------------------------------

CREATE TABLE `Order_Status` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `status` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;



# Dump of table Order_Tracking
# ------------------------------------------------------------

CREATE TABLE `Order_Tracking` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `create_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `order_id` int(11) NOT NULL,
  `comments` varchar(255) NOT NULL,
  `order_status_id` int(11) NOT NULL,
  `tracking_number` varchar(75) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `order_status_tracking` (`order_id`,`order_status_id`,`tracking_number`),
  KEY `Order_Tracking_Order_Status` (`order_status_id`),
  CONSTRAINT `Order_Tracking_Order_Status` FOREIGN KEY (`order_status_id`) REFERENCES `Order_Status` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;



# Dump of table Partner
# ------------------------------------------------------------

CREATE TABLE `Partner` (
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `create_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;



# Dump of table Partner_Contact
# ------------------------------------------------------------

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
  `postal_code` varchar(25) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `Partner_Contact_Partner` (`partner_id`),
  KEY `Partner_Contact_Address_Type` (`type_id`),
  CONSTRAINT `Partner_Contact_Address_Type` FOREIGN KEY (`type_id`) REFERENCES `Address_Type` (`id`),
  CONSTRAINT `Partner_Contact_Partner` FOREIGN KEY (`partner_id`) REFERENCES `Partner` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;



# Dump of table Payment_Type
# ------------------------------------------------------------

CREATE TABLE `Payment_Type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;



# Dump of table Phone
# ------------------------------------------------------------

CREATE TABLE `Phone` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(255) NOT NULL,
  `phone` varchar(15) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `Phone_User` (`user_id`),
  CONSTRAINT `Phone_User` FOREIGN KEY (`user_id`) REFERENCES `User` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;



# Dump of table Product
# ------------------------------------------------------------

CREATE TABLE `Product` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sku` varchar(25) NOT NULL DEFAULT '',
  `name` varchar(255) NOT NULL,
  `price` decimal(12,2) NOT NULL,
  `description` varchar(1000) NOT NULL,
  `image` varchar(255) NOT NULL DEFAULT '',
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
  CONSTRAINT `product_Partner` FOREIGN KEY (`partner_id`) REFERENCES `Partner` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=latin1;



# Dump of table Product_Category
# ------------------------------------------------------------

CREATE TABLE `Product_Category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `create_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `Product_Product` (`product_id`),
  KEY `Category_Category` (`category_id`),
  CONSTRAINT `Category_Category ` FOREIGN KEY (`category_id`) REFERENCES `Category` (`id`),
  CONSTRAINT `Product_Product` FOREIGN KEY (`product_id`) REFERENCES `Product` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=latin1;



# Dump of table Product_Color
# ------------------------------------------------------------

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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;



# Dump of table Product_Order
# ------------------------------------------------------------

CREATE TABLE `Product_Order` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `create_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `Product_Order` (`order_id`),
  KEY `Product_Product_Id` (`product_id`),
  CONSTRAINT `Product_Order` FOREIGN KEY (`order_id`) REFERENCES `Order` (`id`),
  CONSTRAINT `Product_Product_Id` FOREIGN KEY (`product_id`) REFERENCES `Product` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;



# Dump of table Product_Size
# ------------------------------------------------------------

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



# Dump of table Size
# ------------------------------------------------------------

CREATE TABLE `Size` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `size` char(3) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;



# Dump of table User
# ------------------------------------------------------------

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




/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
