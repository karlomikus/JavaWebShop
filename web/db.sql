-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               5.6.12-log - MySQL Community Server (GPL)
-- Server OS:                    Win32
-- HeidiSQL Version:             8.3.0.4694
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- Dumping database structure for webshop
CREATE DATABASE IF NOT EXISTS `webshop` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `webshop`;


-- Dumping structure for table webshop.cart
CREATE TABLE IF NOT EXISTS `cart` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `quantity` smallint(6) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_cart_users` (`user_id`),
  CONSTRAINT `FK_cart_users` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

-- Dumping data for table webshop.cart: ~6 rows (approximately)
/*!40000 ALTER TABLE `cart` DISABLE KEYS */;
INSERT INTO `cart` (`id`, `product_id`, `user_id`, `quantity`) VALUES
	(1, 1, 1, 1),
	(2, 2, 1, 1),
	(3, 1, 2, 1),
	(4, 2, 1, 1),
	(5, 4, 2, 1),
	(6, 4, 2, 1);
/*!40000 ALTER TABLE `cart` ENABLE KEYS */;


-- Dumping structure for table webshop.countries
CREATE TABLE IF NOT EXISTS `countries` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `short` varchar(2) NOT NULL,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- Dumping data for table webshop.countries: ~0 rows (approximately)
/*!40000 ALTER TABLE `countries` DISABLE KEYS */;
INSERT INTO `countries` (`id`, `short`, `name`) VALUES
	(1, 'hr', 'Hrvatska');
/*!40000 ALTER TABLE `countries` ENABLE KEYS */;


-- Dumping structure for table webshop.groups
CREATE TABLE IF NOT EXISTS `groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `description` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- Dumping data for table webshop.groups: ~2 rows (approximately)
/*!40000 ALTER TABLE `groups` DISABLE KEYS */;
INSERT INTO `groups` (`id`, `name`, `description`) VALUES
	(1, 'Administrators', 'Administrators group'),
	(2, 'Clients', 'Site clients');
/*!40000 ALTER TABLE `groups` ENABLE KEYS */;


-- Dumping structure for table webshop.products
CREATE TABLE IF NOT EXISTS `products` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `description` text,
  `category_id` int(11) DEFAULT NULL,
  `price` decimal(10,2) NOT NULL,
  `manufacturer` varchar(50) DEFAULT NULL,
  `image` varchar(50) DEFAULT 'nopic.jpg',
  PRIMARY KEY (`id`),
  KEY `FK_Category` (`category_id`),
  CONSTRAINT `FK_Category` FOREIGN KEY (`category_id`) REFERENCES `products_categories` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

-- Dumping data for table webshop.products: ~5 rows (approximately)
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` (`id`, `name`, `description`, `category_id`, `price`, `manufacturer`, `image`) VALUES
	(1, 'DT770', '<h3>Sound you can rely on | Superior build quality | Every part is replaceable</h3>\r\n<p>\r\n    The DT 770 PRO is a closed dynamic headphone which has been designed for critical music and sound monitoring. The single-sided cable makes the handling of the headphone easy.\r\n</p>\r\n<ul>\r\n    <li>Closed diffuse-field studio headphone</li>\r\n    <li>"Bass reflex" technology for improved bass response</li>\r\n    <li>Comfortable fit due to rugged, adjustable, soft padded headband construction</li>\r\n    <li>Robust, easy serviceable construction as all parts are replaceable</li>\r\n    <li>Velour, circumaural and replaceable ear pads</li>\r\n    <li>3.0 m (9.8 ft.) coiled cable (single-sided)</li>\r\n    <li>Including drawstring bag</li>\r\n</ul>\r\n<h3>History of DT 770 PRO / DT 880 PRO / DT 990 PRO:</h3>\r\n<p>beyerdynamic’s DT 770 PRO, DT 880 PRO and DT 990 PRO headphone series has it’s roots in the early 1980s. Since then, millions of audio professionals from all parts of the world have become loyal users of beyerdynamic products.</p>\r\n<ul>\r\n    <li>DT 770 PRO, 32 ohms for mobile applications</li>\r\n    <li>DT 770 PRO, 80 ohms for recording applications within the studio</li>\r\n    <li>DT 770 PRO, 250 ohms for mixing applications in the studio</li>\r\n</ul>', 1, 159.99, 'Beyerdynamic', '1.jpg'),
	(2, 'DT880', 'The easiest (and most common way) to handle this kind of thing is to have your group of products be in a collection: e.g. you have a List of Product objects that is passed to the JSP, and then you do', 1, 229.99, 'Beyerdynamic', 'nopic.jpg'),
	(3, 'K-240 MkII', 'AKG K240 MKII Around-The-Ear Headphones Details', 1, 129.99, 'AKG', 'nopic.jpg'),
	(4, 'TP30', '    Tripath-based for fantastic sound reproduction\r\n    USB-DAC input for multimedia sound applications\r\n    Small footprint ideal for desktop or where space is a consideration\r\n    Front panel 3.5mm headphone output', 2, 95.00, 'Topping', '4.jpg'),
	(5, 'O2+ODAC Combo', 'O2+ODAC is an Objective2 headphone amp with integrated ObjectiveDAC. This high performance amp+DAC combo ships fully assembled, tested, and ready to use. Includes USB cable. ', 2, 259.99, 'JDS LABS', 'nopic.jpg');
/*!40000 ALTER TABLE `products` ENABLE KEYS */;


-- Dumping structure for table webshop.products_categories
CREATE TABLE IF NOT EXISTS `products_categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `description` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

-- Dumping data for table webshop.products_categories: ~5 rows (approximately)
/*!40000 ALTER TABLE `products_categories` DISABLE KEYS */;
INSERT INTO `products_categories` (`id`, `name`, `description`) VALUES
	(1, 'Headphones', 'Open headphones'),
	(2, 'AMP/DAC', 'Amplifiers and Digital to Analog Converters'),
	(3, 'Accessories', 'Audio accessories'),
	(4, 'Speakers', 'Bookshelf and active speakers'),
	(5, 'Microphones', 'Condenzator microphones');
/*!40000 ALTER TABLE `products_categories` ENABLE KEYS */;


-- Dumping structure for table webshop.users
CREATE TABLE IF NOT EXISTS `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` text NOT NULL,
  `group_id` int(11) NOT NULL,
  `country_id` int(11) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `street` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_Groups` (`group_id`),
  KEY `FK_users_countries` (`country_id`),
  CONSTRAINT `FK_Groups` FOREIGN KEY (`group_id`) REFERENCES `groups` (`id`),
  CONSTRAINT `FK_users_countries` FOREIGN KEY (`country_id`) REFERENCES `countries` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- Dumping data for table webshop.users: ~3 rows (approximately)
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` (`id`, `username`, `email`, `password`, `group_id`, `country_id`, `city`, `street`) VALUES
	(1, 'admin', 'admin@admin.com', 'd033e22ae348aeb5660fc2140aec35850c4da997', 1, 1, '', ''),
	(2, 'user1', 'user1@user.com', 'd033e22ae348aeb5660fc2140aec35850c4da997', 2, NULL, NULL, NULL);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
