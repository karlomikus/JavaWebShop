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

-- Dumping data for table webshop.cart: ~5 rows (approximately)
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
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;

-- Dumping data for table webshop.products: ~5 rows (approximately)
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
