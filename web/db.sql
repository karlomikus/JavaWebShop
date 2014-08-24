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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table webshop.cart: ~0 rows (approximately)
/*!40000 ALTER TABLE `cart` DISABLE KEYS */;
/*!40000 ALTER TABLE `cart` ENABLE KEYS */;


-- Dumping structure for table webshop.countries
CREATE TABLE IF NOT EXISTS `countries` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(2) NOT NULL,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=243 DEFAULT CHARSET=latin1;

-- Dumping data for table webshop.countries: ~242 rows (approximately)
/*!40000 ALTER TABLE `countries` DISABLE KEYS */;
INSERT INTO `countries` (`id`, `code`, `name`) VALUES
	(1, 'US', 'United States'),
	(2, 'CA', 'Canada'),
	(3, 'AF', 'Afghanistan'),
	(4, 'AL', 'Albania'),
	(5, 'DZ', 'Algeria'),
	(6, 'DS', 'American Samoa'),
	(7, 'AD', 'Andorra'),
	(8, 'AO', 'Angola'),
	(9, 'AI', 'Anguilla'),
	(10, 'AQ', 'Antarctica'),
	(11, 'AG', 'Antigua and/or Barbuda'),
	(12, 'AR', 'Argentina'),
	(13, 'AM', 'Armenia'),
	(14, 'AW', 'Aruba'),
	(15, 'AU', 'Australia'),
	(16, 'AT', 'Austria'),
	(17, 'AZ', 'Azerbaijan'),
	(18, 'BS', 'Bahamas'),
	(19, 'BH', 'Bahrain'),
	(20, 'BD', 'Bangladesh'),
	(21, 'BB', 'Barbados'),
	(22, 'BY', 'Belarus'),
	(23, 'BE', 'Belgium'),
	(24, 'BZ', 'Belize'),
	(25, 'BJ', 'Benin'),
	(26, 'BM', 'Bermuda'),
	(27, 'BT', 'Bhutan'),
	(28, 'BO', 'Bolivia'),
	(29, 'BA', 'Bosnia and Herzegovina'),
	(30, 'BW', 'Botswana'),
	(31, 'BV', 'Bouvet Island'),
	(32, 'BR', 'Brazil'),
	(33, 'IO', 'British lndian Ocean Territory'),
	(34, 'BN', 'Brunei Darussalam'),
	(35, 'BG', 'Bulgaria'),
	(36, 'BF', 'Burkina Faso'),
	(37, 'BI', 'Burundi'),
	(38, 'KH', 'Cambodia'),
	(39, 'CM', 'Cameroon'),
	(40, 'CV', 'Cape Verde'),
	(41, 'KY', 'Cayman Islands'),
	(42, 'CF', 'Central African Republic'),
	(43, 'TD', 'Chad'),
	(44, 'CL', 'Chile'),
	(45, 'CN', 'China'),
	(46, 'CX', 'Christmas Island'),
	(47, 'CC', 'Cocos (Keeling) Islands'),
	(48, 'CO', 'Colombia'),
	(49, 'KM', 'Comoros'),
	(50, 'CG', 'Congo'),
	(51, 'CK', 'Cook Islands'),
	(52, 'CR', 'Costa Rica'),
	(53, 'HR', 'Croatia (Hrvatska)'),
	(54, 'CU', 'Cuba'),
	(55, 'CY', 'Cyprus'),
	(56, 'CZ', 'Czech Republic'),
	(57, 'DK', 'Denmark'),
	(58, 'DJ', 'Djibouti'),
	(59, 'DM', 'Dominica'),
	(60, 'DO', 'Dominican Republic'),
	(61, 'TP', 'East Timor'),
	(62, 'EC', 'Ecuador'),
	(63, 'EG', 'Egypt'),
	(64, 'SV', 'El Salvador'),
	(65, 'GQ', 'Equatorial Guinea'),
	(66, 'ER', 'Eritrea'),
	(67, 'EE', 'Estonia'),
	(68, 'ET', 'Ethiopia'),
	(69, 'FK', 'Falkland Islands (Malvinas)'),
	(70, 'FO', 'Faroe Islands'),
	(71, 'FJ', 'Fiji'),
	(72, 'FI', 'Finland'),
	(73, 'FR', 'France'),
	(74, 'FX', 'France, Metropolitan'),
	(75, 'GF', 'French Guiana'),
	(76, 'PF', 'French Polynesia'),
	(77, 'TF', 'French Southern Territories'),
	(78, 'GA', 'Gabon'),
	(79, 'GM', 'Gambia'),
	(80, 'GE', 'Georgia'),
	(81, 'DE', 'Germany'),
	(82, 'GH', 'Ghana'),
	(83, 'GI', 'Gibraltar'),
	(84, 'GR', 'Greece'),
	(85, 'GL', 'Greenland'),
	(86, 'GD', 'Grenada'),
	(87, 'GP', 'Guadeloupe'),
	(88, 'GU', 'Guam'),
	(89, 'GT', 'Guatemala'),
	(90, 'GN', 'Guinea'),
	(91, 'GW', 'Guinea-Bissau'),
	(92, 'GY', 'Guyana'),
	(93, 'HT', 'Haiti'),
	(94, 'HM', 'Heard and Mc Donald Islands'),
	(95, 'HN', 'Honduras'),
	(96, 'HK', 'Hong Kong'),
	(97, 'HU', 'Hungary'),
	(98, 'IS', 'Iceland'),
	(99, 'IN', 'India'),
	(100, 'ID', 'Indonesia'),
	(101, 'IR', 'Iran (Islamic Republic of)'),
	(102, 'IQ', 'Iraq'),
	(103, 'IE', 'Ireland'),
	(104, 'IL', 'Israel'),
	(105, 'IT', 'Italy'),
	(106, 'CI', 'Ivory Coast'),
	(107, 'JM', 'Jamaica'),
	(108, 'JP', 'Japan'),
	(109, 'JO', 'Jordan'),
	(110, 'KZ', 'Kazakhstan'),
	(111, 'KE', 'Kenya'),
	(112, 'KI', 'Kiribati'),
	(113, 'KP', 'Korea, Democratic People\'s Republic of'),
	(114, 'KR', 'Korea, Republic of'),
	(115, 'XK', 'Kosovo'),
	(116, 'KW', 'Kuwait'),
	(117, 'KG', 'Kyrgyzstan'),
	(118, 'LA', 'Lao People\'s Democratic Republic'),
	(119, 'LV', 'Latvia'),
	(120, 'LB', 'Lebanon'),
	(121, 'LS', 'Lesotho'),
	(122, 'LR', 'Liberia'),
	(123, 'LY', 'Libyan Arab Jamahiriya'),
	(124, 'LI', 'Liechtenstein'),
	(125, 'LT', 'Lithuania'),
	(126, 'LU', 'Luxembourg'),
	(127, 'MO', 'Macau'),
	(128, 'MK', 'Macedonia'),
	(129, 'MG', 'Madagascar'),
	(130, 'MW', 'Malawi'),
	(131, 'MY', 'Malaysia'),
	(132, 'MV', 'Maldives'),
	(133, 'ML', 'Mali'),
	(134, 'MT', 'Malta'),
	(135, 'MH', 'Marshall Islands'),
	(136, 'MQ', 'Martinique'),
	(137, 'MR', 'Mauritania'),
	(138, 'MU', 'Mauritius'),
	(139, 'TY', 'Mayotte'),
	(140, 'MX', 'Mexico'),
	(141, 'FM', 'Micronesia, Federated States of'),
	(142, 'MD', 'Moldova, Republic of'),
	(143, 'MC', 'Monaco'),
	(144, 'MN', 'Mongolia'),
	(145, 'ME', 'Montenegro'),
	(146, 'MS', 'Montserrat'),
	(147, 'MA', 'Morocco'),
	(148, 'MZ', 'Mozambique'),
	(149, 'MM', 'Myanmar'),
	(150, 'NA', 'Namibia'),
	(151, 'NR', 'Nauru'),
	(152, 'NP', 'Nepal'),
	(153, 'NL', 'Netherlands'),
	(154, 'AN', 'Netherlands Antilles'),
	(155, 'NC', 'New Caledonia'),
	(156, 'NZ', 'New Zealand'),
	(157, 'NI', 'Nicaragua'),
	(158, 'NE', 'Niger'),
	(159, 'NG', 'Nigeria'),
	(160, 'NU', 'Niue'),
	(161, 'NF', 'Norfork Island'),
	(162, 'MP', 'Northern Mariana Islands'),
	(163, 'NO', 'Norway'),
	(164, 'OM', 'Oman'),
	(165, 'PK', 'Pakistan'),
	(166, 'PW', 'Palau'),
	(167, 'PA', 'Panama'),
	(168, 'PG', 'Papua New Guinea'),
	(169, 'PY', 'Paraguay'),
	(170, 'PE', 'Peru'),
	(171, 'PH', 'Philippines'),
	(172, 'PN', 'Pitcairn'),
	(173, 'PL', 'Poland'),
	(174, 'PT', 'Portugal'),
	(175, 'PR', 'Puerto Rico'),
	(176, 'QA', 'Qatar'),
	(177, 'RE', 'Reunion'),
	(178, 'RO', 'Romania'),
	(179, 'RU', 'Russian Federation'),
	(180, 'RW', 'Rwanda'),
	(181, 'KN', 'Saint Kitts and Nevis'),
	(182, 'LC', 'Saint Lucia'),
	(183, 'VC', 'Saint Vincent and the Grenadines'),
	(184, 'WS', 'Samoa'),
	(185, 'SM', 'San Marino'),
	(186, 'ST', 'Sao Tome and Principe'),
	(187, 'SA', 'Saudi Arabia'),
	(188, 'SN', 'Senegal'),
	(189, 'RS', 'Serbia'),
	(190, 'SC', 'Seychelles'),
	(191, 'SL', 'Sierra Leone'),
	(192, 'SG', 'Singapore'),
	(193, 'SK', 'Slovakia'),
	(194, 'SI', 'Slovenia'),
	(195, 'SB', 'Solomon Islands'),
	(196, 'SO', 'Somalia'),
	(197, 'ZA', 'South Africa'),
	(198, 'GS', 'South Georgia South Sandwich Islands'),
	(199, 'ES', 'Spain'),
	(200, 'LK', 'Sri Lanka'),
	(201, 'SH', 'St. Helena'),
	(202, 'PM', 'St. Pierre and Miquelon'),
	(203, 'SD', 'Sudan'),
	(204, 'SR', 'Suriname'),
	(205, 'SJ', 'Svalbarn and Jan Mayen Islands'),
	(206, 'SZ', 'Swaziland'),
	(207, 'SE', 'Sweden'),
	(208, 'CH', 'Switzerland'),
	(209, 'SY', 'Syrian Arab Republic'),
	(210, 'TW', 'Taiwan'),
	(211, 'TJ', 'Tajikistan'),
	(212, 'TZ', 'Tanzania, United Republic of'),
	(213, 'TH', 'Thailand'),
	(214, 'TG', 'Togo'),
	(215, 'TK', 'Tokelau'),
	(216, 'TO', 'Tonga'),
	(217, 'TT', 'Trinidad and Tobago'),
	(218, 'TN', 'Tunisia'),
	(219, 'TR', 'Turkey'),
	(220, 'TM', 'Turkmenistan'),
	(221, 'TC', 'Turks and Caicos Islands'),
	(222, 'TV', 'Tuvalu'),
	(223, 'UG', 'Uganda'),
	(224, 'UA', 'Ukraine'),
	(225, 'AE', 'United Arab Emirates'),
	(226, 'GB', 'United Kingdom'),
	(227, 'UM', 'United States minor outlying islands'),
	(228, 'UY', 'Uruguay'),
	(229, 'UZ', 'Uzbekistan'),
	(230, 'VU', 'Vanuatu'),
	(231, 'VA', 'Vatican City State'),
	(232, 'VE', 'Venezuela'),
	(233, 'VN', 'Vietnam'),
	(234, 'VG', 'Virigan Islands (British)'),
	(235, 'VI', 'Virgin Islands (U.S.)'),
	(236, 'WF', 'Wallis and Futuna Islands'),
	(237, 'EH', 'Western Sahara'),
	(238, 'YE', 'Yemen'),
	(239, 'YU', 'Yugoslavia'),
	(240, 'ZR', 'Zaire'),
	(241, 'ZM', 'Zambia'),
	(242, 'ZW', 'Zimbabwe');
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


-- Dumping structure for table webshop.orders
CREATE TABLE IF NOT EXISTS `orders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL DEFAULT '0',
  `date` datetime DEFAULT NULL,
  `status` enum('pending','denied','paid') DEFAULT 'pending',
  PRIMARY KEY (`id`),
  KEY `FK_orders_users` (`user_id`),
  CONSTRAINT `FK_orders_users` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;

-- Dumping data for table webshop.orders: ~6 rows (approximately)
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` (`id`, `user_id`, `date`, `status`) VALUES
	(7, 1, '2014-08-17 17:55:04', 'pending'),
	(8, 1, '2014-08-17 18:31:06', 'denied'),
	(9, 1, '2014-08-18 13:52:18', 'pending'),
	(10, 2, '2014-08-18 13:54:21', 'pending'),
	(11, 3, '2014-08-18 14:04:19', 'paid'),
	(12, 3, '2014-08-18 14:04:44', 'paid');
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;


-- Dumping structure for table webshop.orders_products
CREATE TABLE IF NOT EXISTS `orders_products` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `quantity` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_orders_products_products` (`product_id`),
  KEY `FK_orders_products_orders` (`order_id`),
  CONSTRAINT `FK_orders_products_orders` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`),
  CONSTRAINT `FK_orders_products_products` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=latin1;

-- Dumping data for table webshop.orders_products: ~17 rows (approximately)
/*!40000 ALTER TABLE `orders_products` DISABLE KEYS */;
INSERT INTO `orders_products` (`id`, `product_id`, `order_id`, `quantity`) VALUES
	(1, 1, 7, 2),
	(2, 2, 7, 3),
	(3, 6, 7, 1),
	(4, 9, 7, 1),
	(5, 1, 8, 1),
	(6, 7, 9, 1),
	(7, 8, 9, 1),
	(8, 9, 9, 5),
	(9, 10, 9, 1),
	(10, 6, 10, 1),
	(11, 11, 10, 1),
	(12, 12, 10, 1),
	(13, 1, 11, 1),
	(14, 7, 11, 1),
	(15, 4, 12, 2),
	(16, 8, 12, 1),
	(17, 10, 12, 1);
/*!40000 ALTER TABLE `orders_products` ENABLE KEYS */;


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
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;

-- Dumping data for table webshop.products: ~11 rows (approximately)
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` (`id`, `name`, `description`, `category_id`, `price`, `manufacturer`, `image`) VALUES
	(1, 'DT770', '<h3>Sound you can rely on | Superior build quality | Every part is replaceable</h3>\r\n<p>\r\n    The DT 770 PRO is a closed dynamic headphone which has been designed for critical music and sound monitoring. The single-sided cable makes the handling of the headphone easy.\r\n</p>\r\n<ul>\r\n    <li>Closed diffuse-field studio headphone</li>\r\n    <li>"Bass reflex" technology for improved bass response</li>\r\n    <li>Comfortable fit due to rugged, adjustable, soft padded headband construction</li>\r\n    <li>Robust, easy serviceable construction as all parts are replaceable</li>\r\n    <li>Velour, circumaural and replaceable ear pads</li>\r\n    <li>3.0 m (9.8 ft.) coiled cable (single-sided)</li>\r\n    <li>Including drawstring bag</li>\r\n</ul>\r\n<h3>History of DT 770 PRO / DT 880 PRO / DT 990 PRO:</h3>\r\n<p>beyerdynamic’s DT 770 PRO, DT 880 PRO and DT 990 PRO headphone series has it’s roots in the early 1980s. Since then, millions of audio professionals from all parts of the world have become loyal users of beyerdynamic products.</p>\r\n<ul>\r\n    <li>DT 770 PRO, 32 ohms for mobile applications</li>\r\n    <li>DT 770 PRO, 80 ohms for recording applications within the studio</li>\r\n    <li>DT 770 PRO, 250 ohms for mixing applications in the studio</li>\r\n</ul>', 1, 159.99, 'Beyerdynamic', '1.jpg'),
	(2, 'DT880', 'The easiest (and most common way) to handle this kind of thing is to have your group of products be in a collection: e.g. you have a List of Product objects that is passed to the JSP, and then you do', 1, 229.99, 'Beyerdynamic', '2.jpg'),
	(3, 'K-240 MkII', 'AKG K240 MKII Around-The-Ear Headphones Details', 1, 129.99, 'AKG', '3.jpg'),
	(4, 'TP30', '    Tripath-based for fantastic sound reproduction\r\n    USB-DAC input for multimedia sound applications\r\n    Small footprint ideal for desktop or where space is a consideration\r\n    Front panel 3.5mm headphone output', 2, 95.00, 'Topping', '4.jpg'),
	(5, 'O2+ODAC Combo', 'O2+ODAC is an Objective2 headphone amp with integrated ObjectiveDAC. This high performance amp+DAC combo ships fully assembled, tested, and ready to use. Includes USB cable. ', 2, 259.99, 'JDS LABS', '5.jpg'),
	(6, 'HD800', '<p>More than 60 years of ingenious headphone engineering has been applied to the new HD 800. Incorporating Sennheiser\'s most advanced driver technology, these open, around-the-ear, dynamic stereo headphones redefine what reference-grade audio is all about. </p>\r\n\r\n<p>The HD 800 is hand-assembled in Germany with only the finest of materials. The transducer is encased in a precision material made of stainless steel, while the headband and headphone mounting utilizes the most advanced development from the aerospace industry.</p>\r\n\r\n<h3>Features</h3>\r\n<ul class="product_features">\r\n<li>\r\n<p>Reference class wired stereo headphones</p>\r\n\r\n</li>\r\n<li>\r\n<p>Open, around-the-ear, dynamic stereo headphones</p>\r\n\r\n</li>\r\n<li>\r\n<p>Natural hearing experience - realistic and natural sound field with minimal resonance</p>\r\n\r\n</li>\r\n<li>\r\n<p>Biggest transducers ever used in headphones up to today - new innovative dynamic transducer design</p>\r\n\r\n</li>\r\n<li>\r\n<p>Open earcups facilitate transparent sound while showcasing cutting edge industrial design</p>\r\n\r\n</li>\r\n<li>\r\n<p>Metal headband with inner-damping element</p>\r\n\r\n</li>\r\n<li>\r\n<p>Specially tuned symmetrical, impedance matching cable with low capacitance</p>\r\n\r\n</li>\r\n<li>\r\n<p>Precision headphone connectors with detachable cable (part # 532758)</p>\r\n\r\n</li>\r\n<li>\r\n<p>Plush, luxurious ear and headband padding (part # 534411 and 534406 respectively)</p>\r\n\r\n</li>\r\n<li>\r\n<p>Built-tough with a 2 YEAR warranty</p>\r\n\r\n</li>\r\n</ul>\r\n', 1, 1299.99, 'Sennheiser', '6.jpg'),
	(7, 'Snowball', '<p><b>What exactly is this Snowball all about?</b></p>\r\n						<p>The Snowball is a revolutionary microphone. Leave it to Blue to reinvent the wheel... err, microphone once again! With USB connectivity, it has never been easier to get live audio into your Macintosh or Windows desktop or laptop. Just plug it in, adjust your input level and you\'re up and running.</p>\r\n						\r\n						<p><b>Is The Snowball a dynamic microphone like the Blue Ball, or a condenser like the Blue 8Ball or Kiwi?</b></p>\r\n						<p>The Snowball is a condenser, which, according to the audio wonks we know, has a smooth open sound with a nice, natural high-end.</p>\r\n						\r\n						<p><b>I\'ve heard that condenser microphones require something called phantom power. Do I need to concern myself with this? Does The Snowball need batteries?</b></p>\r\n						<p>No. The Snowball derives its operating voltage from something called bus voltage, which is always present on your USB port. As long as the red LED is glowing, you know you\'ve got power. The Snowball does not require batteries.</p>\r\n						\r\n						<p><b>Is the Snowball compatible with Windows 8, Windows 7, and Vista?</b>  </p>\r\n						<p>Yes, Snowball is currently Windows 8, Windows 7 and Vista compatible. Older Snowballs manufactured from July 2007 to January 2009 with serial numbers lower than 76-065000 are not Windows 8, Windows 7 or Vista compatible. (Snowballs manufactured after January 2009 do not have serial numbers.) Snowball is plug-and-play and does not require drivers.</p>\r\n						\r\n						<p><b>Do I need any special software to use The Snowball? Do I need any drivers?</b></p>\r\n						<p>Technically, no. Depending on your application, your OS may have sufficient features to utilize the capabilities of The Snowball. But, to get the most out of your Snowball, you\'ll want to have some kind of software that allows for digital signal processing and non-linear editing that will accept audio from the USB port. Some examples of these programs are listed below. </p>\r\n						\r\n						<p><b>Can I use The Snowball with a traditional analog audio mixer?</b></p>\r\n						<p>No. The Snowball features digital output only. It must be connected to a USB port in order to function. What sample rate and word length does The Snowball use?  The Snowball\'s digital output is set to 44.1 kHz / 16-bit, just like an audio CD. But this is something that only audio geeks really need to worry about.</p>\r\n						\r\n						<p><b>How can I select a different sample rate?</b></p>\r\n						<p>Because The Snowball is designed for the greatest ease of operation and setup, sample rate / word length are not user-definable. Sorry, geeks.</p>\r\n						\r\n						<p><b>What does cardioid and omnidirectional mean? Why should I care?</b></p>\r\n						<p>These are the two polar patterns The Snowball is capable of producing. If you think of polar patterns as the shape of the area that a microphone "hears" omnidirectional hears everything at equal volume from all angles (in a 360 degree sphere surrounding the mic), while cardioid only hears what\'s right in front of it at full volume and other sounds at increasingly diminished volume as the sound source moves further away from the center of the mic (audio techs call this off-axis). You should care because one of the most useful features of a microphone is the ability to control its pickup. We like polar patterns so much, that some of our professional studio microphones have as many as nine different patterns! With The Snowball, we\'ve given you the two most likely to be useful to you.</p>\r\n						\r\n						<p><b>What is The Snowball used for?</b></p>\r\n						<p>Is it a vocal mic, an instrument mic or both?  The Snowball was designed to provide a wide range of applications where a high-quality transducer (a fancy way to say microphone) is needed, but so is ease of use and setup. Though most professional engineers prefer certain microphones for certain applications, we designed The Snowball for use with a wide variety of sources. Here are some suggested applications we came up with when we were locked in Blue\'s patented anechoic think tank: instrument and voice for music production / pre-production / demos, DV-looping / dialog, podcasting, sound effects, audio sampling, interactive programming, video sweetening / post, internet telephony, internet conferencing, recording lectures, poetry slams, spoken word performances and speeches by your favorite politician-- generally anywhere where you need an easy-to-use microphone and you have access to a computer with a USB port. Happy recording!</p>\r\n						\r\n						<p><b>Do I need to keep The Snowball in the freezer when I\'m not using it?</b></p>\r\n						<p>No. This is one snowball that won\'t melt!</p>', 5, 69.99, 'Blue', '7.jpg'),
	(8, 'Yeti', '<p>The <span itemprop="name">Yeti</span> is one of the most advanced and versatile multi-pattern USB microphones available anywhere. Combining three capsules and four different pattern settings, the Yeti is an ultimate tool for creating amazing recordings, directly to your computer. With exceptional sound and performance, the Yeti can capture anything with a clarity &amp; ease unheard of in a USB microphone.</p>\r\n						<p>The Yeti features Blue\'s innovative triple capsule array, allowing for recording in stereo or your choice of three unique patterns, including cardioid, omnidirectional, and bidirectional, giving you recording capabilities usually requiring multiple microphones.</p>\r\n						<p><span itemprop="description">The Yeti utilizes a high quality analog-to-digital converter to send incredible audio fidelity directly into your computer, a built-in headphone amplifier for zero-latency monitoring, and simple controls for headphone volume, pattern selection, instant mute, and microphone gain located directly on the microphone. There are no drivers to install - simply plug the Yeti into your PC or Mac, load up your favorite recording software, and record something amazing.</span></p>', 5, 129.99, 'Blue', '8.jpg'),
	(9, 'ROKIT 5 G3', '<p><span class="text-yellow-22">KRK ROKIT MONITORS – GENERATION 3</span><br>\r\n				KRK Systems is one of the world’s most respected manufacturers of studio reference monitors. In their state of the art design facility, KRK engineers create products that deliver natural and balanced spectral response with low distortion and superior imaging. KRK Studio Monitors have been the professional’s choice of recording engineers and artists for mixing and mastering hit records around the globe, as they need to hear every nuance of the audio being reproduced. KRK ROKIT Generation 3 monitors continue in this design philosophy, so regardless of your musical style, genre, or particular mixing needs, KRK Rokits deliver.</p><br>\r\n                <p><span class="text-yellow-22">ROKIT 5 Powered Monitor - Generation 3</span><br>KRK\'s ROKIT 5 G3 (Generation 3) powered studio monitors offer professional performance and accuracy for recording, mixing, mastering and playback. The system consists of a 1” soft dome tweeter and 5” glass-Aramid composite woofer. It delivers high frequencies up to 35kHz, vocal clarity and extended bass response. The proprietary bi-amped, class A/B amplifier grants SPL up to 106dB. The ROKIT waveguide is designed to ensure detailed imaging in the listening position. The front-firing bass port reduces boundary coupling to allow flexible positioning in the room while the engineered surface reduces diffraction distortion. Multiple input connections ensure the ROKIT 5 G3 will easily integrate in any system configuration. </p>\r\n				<p>As one of the most used Studio monitors in the world, the ROKIT 5 is a high valuable and compact solution towards an accurate mix.</p>', 4, 349.99, 'KRK', '9.jpg'),
	(10, 'MK III', 'The Little Dot MK III succeeds our Little Dot II++ by improving upon it in every possible way. Boasting the highest stability and sound quality yet, the sound-stage realism and imaging precision have improved dramatically over our previous amplifiers, and even at high volumes the Little Dot MK III delivers a smooth, non-fatiguing sound with no hint of dynamic compression or imaging fuzz. Of course the liquid warm midrange tube lovers expect is here in spades, balancing right in with a dynamic low-end and a sweet, airy treble. Tracking precision with low distortion is provided by an ALPS-16 potentiometer, and Rubycon, German WIMA and ERO capacitors ensure the internal circuitry is built with quality in mind.<br><br>The Little Dot MK III also adds in user-tweaking options such as two gain switches to delivery maximum compatibility with all your headphones, regardless of impedance or sensitivity. Also available for the very first time in a Little Dot amplifier, is an internal jumper to allow use with a wider range of driver tube-rolling, including the EF92, CV131, WE403A/B, GE5654, M8100, CV4010, EF95, 6JI as well as all equivalents to these vacuum tubes!<br>', 2, 299.99, 'LittleDot', '10.jpg'),
	(11, 'Audio Extension Cable', '<ul class="a-vertical a-spacing-none">\r\n					\r\n						<li><span class="a-list-item">Allows consistent signal between components using high-quality copper</span></li>\r\n					\r\n						<li><span class="a-list-item">Provides maximum conductivity and prevents corrosion with 24k gold-plated connectors and contacts</span></li>\r\n					\r\n						<li><span class="a-list-item">Produces cleaner sound by reducing EM/RF interference</span></li>\r\n					\r\n						<li><span class="a-list-item">With the Smaller Head it Connects portable audio equipment with the mini-stereo jacks on your portable CD players, digital audio players</span></li>\r\n					\r\n						<li><span class="a-list-item">Flexible high quality wiring to prevent shortage of sound over time; Backed by a limited lifetime warranty</span></li>\r\n					\r\n				</ul>', 3, 6.99, 'iMBA Price', '11.jpg'),
	(12, 'QuietComfort® 2 ear cushion kit', 'Compatible with QuietComfort 2 Acoustic Noise Cancelling® headphones.', 3, 35.00, 'Bose', '12.jpg'),
	(13, 'Protection Carrying Hard Case', '<ul class="a-vertical a-spacing-none">\r\n					\r\n						<li><span class="a-list-item">Package included: Headphone hard case, removable inner mesh pocket , carabiner</span></li>\r\n					\r\n						<li><span class="a-list-item">Hard shell case with soft interior layer for better protection</span></li>\r\n					\r\n						<li><span class="a-list-item">Mesh pocket perfectly for cable storage</span></li>\r\n					\r\n						<li><span class="a-list-item">Fit for Monster Solo or studio</span></li>\r\n					\r\n				</ul>', 3, 5.62, 'Bluecell', '13.jpg');
/*!40000 ALTER TABLE `products` ENABLE KEYS */;


-- Dumping structure for table webshop.products_categories
CREATE TABLE IF NOT EXISTS `products_categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `description` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

-- Dumping data for table webshop.products_categories: ~4 rows (approximately)
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
  `post_number` int(11) DEFAULT NULL,
  `street` varchar(255) DEFAULT NULL,
  `first_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_Groups` (`group_id`),
  KEY `FK_users_countries` (`country_id`),
  CONSTRAINT `FK_Groups` FOREIGN KEY (`group_id`) REFERENCES `groups` (`id`),
  CONSTRAINT `FK_users_countries` FOREIGN KEY (`country_id`) REFERENCES `countries` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- Dumping data for table webshop.users: ~3 rows (approximately)
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` (`id`, `username`, `email`, `password`, `group_id`, `country_id`, `city`, `post_number`, `street`, `first_name`, `last_name`) VALUES
	(1, 'admin', 'admin@admin.com', 'd033e22ae348aeb5660fc2140aec35850c4da997', 1, 54, 'Zagreb', 10000, 'Domobranska 19', 'Karlo', 'Mikuš'),
	(2, 'user1', 'user1@user.com', 'd033e22ae348aeb5660fc2140aec35850c4da997', 2, 9, NULL, NULL, NULL, NULL, NULL),
	(3, 'user2', 'user2@user.com', '89e495e7941cf9e40e6980d14a16bf023ccd4c91', 2, 4, 'Karlovac', 32900, 'Ilica', 'Demo', 'TopKek');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
