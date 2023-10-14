-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               8.0.30 - MySQL Community Server - GPL
-- Server OS:                    Win64
-- HeidiSQL Version:             12.1.0.6537
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

-- Dumping structure for table helpdesk.attachments
CREATE TABLE IF NOT EXISTS `attachments` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `ticket_id` int DEFAULT NULL,
  `message_id` int DEFAULT NULL,
  `name` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  `contact_id` int DEFAULT NULL,
  `size` int DEFAULT NULL,
  `path` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `attachments_ticket_id_index` (`ticket_id`),
  KEY `attachments_message_id_index` (`message_id`),
  KEY `attachments_user_id_index` (`user_id`),
  KEY `attachments_contact_id_index` (`contact_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table helpdesk.attachments: ~0 rows (approximately)

-- Dumping structure for table helpdesk.backup
CREATE TABLE IF NOT EXISTS `backup` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `details` json DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table helpdesk.backup: ~0 rows (approximately)

-- Dumping structure for table helpdesk.categories
CREATE TABLE IF NOT EXISTS `categories` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `color` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table helpdesk.categories: ~7 rows (approximately)
INSERT INTO `categories` (`id`, `name`, `color`, `created_at`, `updated_at`, `deleted_at`) VALUES
	(1, 'Social', '#172D13', NULL, NULL, NULL),
	(2, 'Website', '#4FCBE9', NULL, NULL, NULL),
	(3, 'Technical', '#182978', NULL, NULL, NULL),
	(4, 'Email', '#F1B814', NULL, NULL, NULL),
	(5, 'Domain', '#182978', NULL, NULL, NULL),
	(6, 'Internet', '#A7BC5B', NULL, NULL, NULL),
	(7, 'Hosting', '#182978', NULL, NULL, NULL);

-- Dumping structure for table helpdesk.cities
CREATE TABLE IF NOT EXISTS `cities` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table helpdesk.cities: ~0 rows (approximately)

-- Dumping structure for table helpdesk.comments
CREATE TABLE IF NOT EXISTS `comments` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `ticket_id` int DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  `contact_id` int DEFAULT NULL,
  `details` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `comments_ticket_id_index` (`ticket_id`),
  KEY `comments_user_id_index` (`user_id`),
  KEY `comments_contact_id_index` (`contact_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table helpdesk.comments: ~0 rows (approximately)

-- Dumping structure for table helpdesk.contacts
CREATE TABLE IF NOT EXISTS `contacts` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `organization_id` int DEFAULT NULL,
  `first_name` varchar(25) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_name` varchar(25) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `region` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(2) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `postal_code` varchar(25) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `contacts_organization_id_index` (`organization_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table helpdesk.contacts: ~0 rows (approximately)

-- Dumping structure for table helpdesk.conversations
CREATE TABLE IF NOT EXISTS `conversations` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `contact_id` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `conversations_contact_id_index` (`contact_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table helpdesk.conversations: ~0 rows (approximately)

-- Dumping structure for table helpdesk.countries
CREATE TABLE IF NOT EXISTS `countries` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(2) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(75) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `countries_code_index` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=250 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table helpdesk.countries: ~249 rows (approximately)
INSERT INTO `countries` (`id`, `code`, `name`) VALUES
	(1, 'AF', 'Afghanistan'),
	(2, 'AX', 'Åland Islands'),
	(3, 'AL', 'Albania'),
	(4, 'DZ', 'Algeria'),
	(5, 'AS', 'American Samoa'),
	(6, 'AD', 'Andorra'),
	(7, 'AO', 'Angola'),
	(8, 'AI', 'Anguilla'),
	(9, 'AQ', 'Antarctica'),
	(10, 'AG', 'Antigua and Barbuda'),
	(11, 'AR', 'Argentina'),
	(12, 'AM', 'Armenia'),
	(13, 'AW', 'Aruba'),
	(14, 'AU', 'Australia'),
	(15, 'AT', 'Austria'),
	(16, 'AZ', 'Azerbaijan'),
	(17, 'BS', 'Bahamas'),
	(18, 'BH', 'Bahrain'),
	(19, 'BD', 'Bangladesh'),
	(20, 'BB', 'Barbados'),
	(21, 'BY', 'Belarus'),
	(22, 'BE', 'Belgium'),
	(23, 'BZ', 'Belize'),
	(24, 'BJ', 'Benin'),
	(25, 'BM', 'Bermuda'),
	(26, 'BT', 'Bhutan'),
	(27, 'BO', 'Bolivia, Plurinational State of'),
	(28, 'BQ', 'Bonaire, Sint Eustatius and Saba'),
	(29, 'BA', 'Bosnia and Herzegovina'),
	(30, 'BW', 'Botswana'),
	(31, 'BV', 'Bouvet Island'),
	(32, 'BR', 'Brazil'),
	(33, 'IO', 'British Indian Ocean Territory'),
	(34, 'BN', 'Brunei Darussalam'),
	(35, 'BG', 'Bulgaria'),
	(36, 'BF', 'Burkina Faso'),
	(37, 'BI', 'Burundi'),
	(38, 'KH', 'Cambodia'),
	(39, 'CM', 'Cameroon'),
	(40, 'CA', 'Canada'),
	(41, 'CV', 'Cape Verde'),
	(42, 'KY', 'Cayman Islands'),
	(43, 'CF', 'Central African Republic'),
	(44, 'TD', 'Chad'),
	(45, 'CL', 'Chile'),
	(46, 'CN', 'China'),
	(47, 'CX', 'Christmas Island'),
	(48, 'CC', 'Cocos (Keeling) Islands'),
	(49, 'CO', 'Colombia'),
	(50, 'KM', 'Comoros'),
	(51, 'CG', 'Congo'),
	(52, 'CD', 'Congo, the Democratic Republic of the'),
	(53, 'CK', 'Cook Islands'),
	(54, 'CR', 'Costa Rica'),
	(55, 'CI', 'Côte d\'Ivoire'),
	(56, 'HR', 'Croatia'),
	(57, 'CU', 'Cuba'),
	(58, 'CW', 'Curaçao'),
	(59, 'CY', 'Cyprus'),
	(60, 'CZ', 'Czech Republic'),
	(61, 'DK', 'Denmark'),
	(62, 'DJ', 'Djibouti'),
	(63, 'DM', 'Dominica'),
	(64, 'DO', 'Dominican Republic'),
	(65, 'EC', 'Ecuador'),
	(66, 'EG', 'Egypt'),
	(67, 'SV', 'El Salvador'),
	(68, 'GQ', 'Equatorial Guinea'),
	(69, 'ER', 'Eritrea'),
	(70, 'EE', 'Estonia'),
	(71, 'ET', 'Ethiopia'),
	(72, 'FK', 'Falkland Islands (Malvinas)'),
	(73, 'FO', 'Faroe Islands'),
	(74, 'FJ', 'Fiji'),
	(75, 'FI', 'Finland'),
	(76, 'FR', 'France'),
	(77, 'GF', 'French Guiana'),
	(78, 'PF', 'French Polynesia'),
	(79, 'TF', 'French Southern Territories'),
	(80, 'GA', 'Gabon'),
	(81, 'GM', 'Gambia'),
	(82, 'GE', 'Georgia'),
	(83, 'DE', 'Germany'),
	(84, 'GH', 'Ghana'),
	(85, 'GI', 'Gibraltar'),
	(86, 'GR', 'Greece'),
	(87, 'GL', 'Greenland'),
	(88, 'GD', 'Grenada'),
	(89, 'GP', 'Guadeloupe'),
	(90, 'GU', 'Guam'),
	(91, 'GT', 'Guatemala'),
	(92, 'GG', 'Guernsey'),
	(93, 'GN', 'Guinea'),
	(94, 'GW', 'Guinea-Bissau'),
	(95, 'GY', 'Guyana'),
	(96, 'HT', 'Haiti'),
	(97, 'HM', 'Heard Island and McDonald Mcdonald Islands'),
	(98, 'VA', 'Holy See (Vatican City State)'),
	(99, 'HN', 'Honduras'),
	(100, 'HK', 'Hong Kong'),
	(101, 'HU', 'Hungary'),
	(102, 'IS', 'Iceland'),
	(103, 'IN', 'India'),
	(104, 'ID', 'Indonesia'),
	(105, 'IR', 'Iran, Islamic Republic of'),
	(106, 'IQ', 'Iraq'),
	(107, 'IE', 'Ireland'),
	(108, 'IM', 'Isle of Man'),
	(109, 'IL', 'Israel'),
	(110, 'IT', 'Italy'),
	(111, 'JM', 'Jamaica'),
	(112, 'JP', 'Japan'),
	(113, 'JE', 'Jersey'),
	(114, 'JO', 'Jordan'),
	(115, 'KZ', 'Kazakhstan'),
	(116, 'KE', 'Kenya'),
	(117, 'KI', 'Kiribati'),
	(118, 'KP', 'Korea, Democratic People\'s Republic of'),
	(119, 'KR', 'Korea, Republic of'),
	(120, 'KW', 'Kuwait'),
	(121, 'KG', 'Kyrgyzstan'),
	(122, 'LA', 'Lao People\'s Democratic Republic'),
	(123, 'LV', 'Latvia'),
	(124, 'LB', 'Lebanon'),
	(125, 'LS', 'Lesotho'),
	(126, 'LR', 'Liberia'),
	(127, 'LY', 'Libya'),
	(128, 'LI', 'Liechtenstein'),
	(129, 'LT', 'Lithuania'),
	(130, 'LU', 'Luxembourg'),
	(131, 'MO', 'Macao'),
	(132, 'MK', 'Macedonia, the Former Yugoslav Republic of'),
	(133, 'MG', 'Madagascar'),
	(134, 'MW', 'Malawi'),
	(135, 'MY', 'Malaysia'),
	(136, 'MV', 'Maldives'),
	(137, 'ML', 'Mali'),
	(138, 'MT', 'Malta'),
	(139, 'MH', 'Marshall Islands'),
	(140, 'MQ', 'Martinique'),
	(141, 'MR', 'Mauritania'),
	(142, 'MU', 'Mauritius'),
	(143, 'YT', 'Mayotte'),
	(144, 'MX', 'Mexico'),
	(145, 'FM', 'Micronesia, Federated States of'),
	(146, 'MD', 'Moldova, Republic of'),
	(147, 'MC', 'Monaco'),
	(148, 'MN', 'Mongolia'),
	(149, 'ME', 'Montenegro'),
	(150, 'MS', 'Montserrat'),
	(151, 'MA', 'Morocco'),
	(152, 'MZ', 'Mozambique'),
	(153, 'MM', 'Myanmar'),
	(154, 'NA', 'Namibia'),
	(155, 'NR', 'Nauru'),
	(156, 'NP', 'Nepal'),
	(157, 'NL', 'Netherlands'),
	(158, 'NC', 'New Caledonia'),
	(159, 'NZ', 'New Zealand'),
	(160, 'NI', 'Nicaragua'),
	(161, 'NE', 'Niger'),
	(162, 'NG', 'Nigeria'),
	(163, 'NU', 'Niue'),
	(164, 'NF', 'Norfolk Island'),
	(165, 'MP', 'Northern Mariana Islands'),
	(166, 'NO', 'Norway'),
	(167, 'OM', 'Oman'),
	(168, 'PK', 'Pakistan'),
	(169, 'PW', 'Palau'),
	(170, 'PS', 'Palestine, State of'),
	(171, 'PA', 'Panama'),
	(172, 'PG', 'Papua New Guinea'),
	(173, 'PY', 'Paraguay'),
	(174, 'PE', 'Peru'),
	(175, 'PH', 'Philippines'),
	(176, 'PN', 'Pitcairn'),
	(177, 'PL', 'Poland'),
	(178, 'PT', 'Portugal'),
	(179, 'PR', 'Puerto Rico'),
	(180, 'QA', 'Qatar'),
	(181, 'RE', 'Réunion'),
	(182, 'RO', 'Romania'),
	(183, 'RU', 'Russian Federation'),
	(184, 'RW', 'Rwanda'),
	(185, 'BL', 'Saint Barthélemy'),
	(186, 'SH', 'Saint Helena, Ascension and Tristan da Cunha'),
	(187, 'KN', 'Saint Kitts and Nevis'),
	(188, 'LC', 'Saint Lucia'),
	(189, 'MF', 'Saint Martin (French part)'),
	(190, 'PM', 'Saint Pierre and Miquelon'),
	(191, 'VC', 'Saint Vincent and the Grenadines'),
	(192, 'WS', 'Samoa'),
	(193, 'SM', 'San Marino'),
	(194, 'ST', 'Sao Tome and Principe'),
	(195, 'SA', 'Saudi Arabia'),
	(196, 'SN', 'Senegal'),
	(197, 'RS', 'Serbia'),
	(198, 'SC', 'Seychelles'),
	(199, 'SL', 'Sierra Leone'),
	(200, 'SG', 'Singapore'),
	(201, 'SX', 'Sint Maarten (Dutch part)'),
	(202, 'SK', 'Slovakia'),
	(203, 'SI', 'Slovenia'),
	(204, 'SB', 'Solomon Islands'),
	(205, 'SO', 'Somalia'),
	(206, 'ZA', 'South Africa'),
	(207, 'GS', 'South Georgia and the South Sandwich Islands'),
	(208, 'SS', 'South Sudan'),
	(209, 'ES', 'Spain'),
	(210, 'LK', 'Sri Lanka'),
	(211, 'SD', 'Sudan'),
	(212, 'SR', 'Suriname'),
	(213, 'SJ', 'Svalbard and Jan Mayen'),
	(214, 'SZ', 'Swaziland'),
	(215, 'SE', 'Sweden'),
	(216, 'CH', 'Switzerland'),
	(217, 'SY', 'Syrian Arab Republic'),
	(218, 'TW', 'Taiwan'),
	(219, 'TJ', 'Tajikistan'),
	(220, 'TZ', 'Tanzania, United Republic of'),
	(221, 'TH', 'Thailand'),
	(222, 'TL', 'Timor-Leste'),
	(223, 'TG', 'Togo'),
	(224, 'TK', 'Tokelau'),
	(225, 'TO', 'Tonga'),
	(226, 'TT', 'Trinidad and Tobago'),
	(227, 'TN', 'Tunisia'),
	(228, 'TR', 'Turkey'),
	(229, 'TM', 'Turkmenistan'),
	(230, 'TC', 'Turks and Caicos Islands'),
	(231, 'TV', 'Tuvalu'),
	(232, 'UG', 'Uganda'),
	(233, 'UA', 'Ukraine'),
	(234, 'AE', 'United Arab Emirates'),
	(235, 'GB', 'United Kingdom'),
	(236, 'US', 'United States'),
	(237, 'UM', 'United States Minor Outlying Islands'),
	(238, 'UY', 'Uruguay'),
	(239, 'UZ', 'Uzbekistan'),
	(240, 'VU', 'Vanuatu'),
	(241, 'VE', 'Venezuela, Bolivarian Republic of'),
	(242, 'VN', 'Viet Nam'),
	(243, 'VG', 'Virgin Islands, British'),
	(244, 'VI', 'Virgin Islands, U.S.'),
	(245, 'WF', 'Wallis and Futuna'),
	(246, 'EH', 'Western Sahara'),
	(247, 'YE', 'Yemen'),
	(248, 'ZM', 'Zambia'),
	(249, 'ZW', 'Zimbabwe');

-- Dumping structure for table helpdesk.departments
CREATE TABLE IF NOT EXISTS `departments` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table helpdesk.departments: ~6 rows (approximately)
INSERT INTO `departments` (`id`, `name`, `deleted_at`) VALUES
	(1, 'Technical', NULL),
	(2, 'Management', NULL),
	(3, 'Hardware', NULL),
	(4, 'Software', NULL),
	(5, 'Development', NULL),
	(6, 'Admin', NULL);

-- Dumping structure for table helpdesk.email_templates
CREATE TABLE IF NOT EXISTS `email_templates` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `details` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `language` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT 'en',
  `html` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table helpdesk.email_templates: ~7 rows (approximately)
INSERT INTO `email_templates` (`id`, `name`, `details`, `slug`, `language`, `html`) VALUES
	(1, 'Create ticket by new customer', 'When customer create a new ticket from the landing page', 'create_ticket_new_customer', 'en', '<!doctype html>\n<html>\n<head>\n    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>\n    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />\n    <title>Ticket mail</title>\n    <style>\n\n        .mail-body img {\n            border: none;\n            -ms-interpolation-mode: bicubic;\n            max-width: 100%;\n        }\n\n        body {\n            background-color: #f6f6f6;\n        }\n\n        .mail-body table {\n            border-collapse: separate;\n            mso-table-lspace: 0pt;\n            mso-table-rspace: 0pt;\n            width: 100%; }\n        .mail-body table td {\n            font-family: sans-serif;\n            font-size: 14px;\n            vertical-align: top;\n        }\n        .mail-body {\n            background-color: #f6f6f6;\n            width: 100%;\n            font-size: 14px;\n            font-family: sans-serif;\n            -webkit-font-smoothing: antialiased;\n            line-height: 1.4;\n            margin: 0;\n            padding: 0;\n            -ms-text-size-adjust: 100%;\n            -webkit-text-size-adjust: 100%;\n        }\n\n        .mail-body .container {\n            display: block;\n            margin: 0 auto !important;\n            /* makes it centered */\n            max-width: 580px;\n            padding: 10px;\n            width: 580px;\n        }\n\n        .mail-body .content {\n            box-sizing: border-box;\n            display: block;\n            margin: 0 auto;\n            max-width: 580px;\n            padding: 10px;\n        }\n\n        .mail-body .main {\n            background: #ffffff;\n            border-radius: 3px;\n            width: 100%;\n        }\n\n        .mail-body .wrapper {\n            box-sizing: border-box;\n            padding: 20px;\n        }\n\n        .mail-body .content-block {\n            padding-bottom: 5px;\n            padding-top: 5px;\n        }\n\n        .mail-body .footer {\n            clear: both;\n            margin-top: 10px;\n            text-align: center;\n            width: 100%;\n        }\n        .mail-body .footer td,\n        .mail-body .footer p,\n        .mail-body .footer span,\n        .mail-body .footer a {\n            color: #999999;\n            font-size: 12px;\n            text-align: center;\n        }\n\n        .mail-body h1,\n        .mail-body h2,\n        .mail-body h3,\n        .mail-body h4 {\n            color: #000000;\n            font-family: sans-serif;\n            font-weight: 400;\n            line-height: 1.4;\n            margin: 0;\n            margin-bottom: 30px;\n        }\n\n        .mail-body h1 {\n            font-size: 35px;\n            font-weight: 300;\n            text-align: center;\n            text-transform: capitalize;\n        }\n\n        .mail-body p,\n        .mail-body ul,\n        .mail-body ol {\n            font-family: sans-serif;\n            font-size: 14px;\n            font-weight: normal;\n            margin: 0;\n            margin-bottom: 15px;\n            line-height: 1.4;\n        }\n        .mail-body p li,\n        .mail-body ul li,\n        .mail-body ol li {\n            list-style-position: inside;\n            margin-left: 5px;\n        }\n\n        .mail-body .btn {\n            box-sizing: border-box;\n            width: 100%; }\n        .mail-body .btn > tbody > tr > td {\n            padding-bottom: 15px; }\n        .mail-body .btn table {\n            width: auto;\n        }\n        .mail-body .btn table td {\n            background-color: #ffffff;\n            border-radius: 5px;\n            text-align: center;\n        }\n        .mail-body .btn a {\n            background-color: #ffffff;\n            border: solid 1px #7366ff;\n            border-radius: 5px;\n            box-sizing: border-box;\n            color: #7366ff;\n            cursor: pointer;\n            display: inline-block;\n            font-size: 14px;\n            font-weight: bold;\n            margin: 0;\n            padding: 6px 25px;\n            text-decoration: none;\n            text-transform: capitalize;\n        }\n\n        .mail-body .btn-primary table td {\n            background-color: #7366ff;\n        }\n\n        .mail-body .btn-primary a {\n            background-color: #7366ff;\n            border-color: #7366ff;\n            color: #ffffff;\n        }\n\n\n        .mail-body .last {\n            margin-bottom: 0;\n        }\n\n        .mail-body .first {\n            margin-top: 0;\n        }\n\n        .mail-body .align-center {\n            text-align: center;\n        }\n\n        .mail-body .align-right {\n            text-align: right;\n        }\n\n        .mail-body .align-left {\n            text-align: left;\n        }\n\n        .mail-body .clear {\n            clear: both;\n        }\n\n        .mail-body .mt0 {\n            margin-top: 0;\n        }\n\n        .mail-body .mb0 {\n            margin-bottom: 0;\n        }\n\n        .preheader {\n            color: transparent;\n            display: none;\n            height: 0;\n            max-height: 0;\n            max-width: 0;\n            opacity: 0;\n            overflow: hidden;\n            mso-hide: all;\n            visibility: hidden;\n            width: 0;\n        }\n\n        .mail-body .powered-by a {\n            text-decoration: none;\n        }\n\n        .mail-body hr {\n            border: 0;\n            border-bottom: 1px solid #f6f6f6;\n            margin: 20px 0;\n        }\n\n        .mail-body .main{\n            background-image: url(\'https://res.cloudinary.com/robinbd/image/upload/v1663394450/mail-template/background-bottom.png\');\n            background-repeat: no-repeat;\n            background-size: 100%;\n            background-position: 50% 100%;\n        }\n        .gap-bottom{\n            padding-bottom: 10px;\n        }\n        .gap-top{\n            padding-top: 10px;\n        }\n\n        @media only screen and (max-width: 620px) {\n            table.mail-body h1 {\n                font-size: 28px !important;\n                margin-bottom: 10px !important;\n            }\n            table.mail-body p,\n            table.mail-body ul,\n            table.mail-body ol,\n            table.mail-body td,\n            table.mail-body span,\n            table.mail-body a {\n                font-size: 16px !important;\n            }\n            table.mail-body .wrapper,\n            table.mail-body .article {\n                padding: 10px !important;\n            }\n            table.mail-body .content {\n                padding: 0 !important;\n            }\n            table.mail-body .container {\n                padding: 0 !important;\n                width: 100% !important;\n            }\n            table.mail-body .main {\n                border-left-width: 0 !important;\n                border-radius: 0 !important;\n                border-right-width: 0 !important;\n            }\n            table.mail-body .btn table {\n                width: 100% !important;\n            }\n            table.mail-body .btn a {\n                width: 100% !important;\n            }\n            table.mail-body .img-responsive {\n                height: auto !important;\n                max-width: 100% !important;\n                width: auto !important;\n            }\n        }\n\n        @media all {\n            .mail-body .ExternalClass {\n                width: 100%;\n            }\n            .mail-body .ExternalClass,\n            .mail-body .ExternalClass p,\n            .mail-body .ExternalClass span,\n            .mail-body .ExternalClass font,\n            .mail-body .ExternalClass td,\n            .mail-body .ExternalClass div {\n                line-height: 100%;\n            }\n            .mail-body .apple-link a {\n                color: inherit !important;\n                font-family: inherit !important;\n                font-size: inherit !important;\n                font-weight: inherit !important;\n                line-height: inherit !important;\n                text-decoration: none !important;\n            }\n            #MessageViewBody a {\n                color: inherit;\n                text-decoration: none;\n                font-size: inherit;\n                font-family: inherit;\n                font-weight: inherit;\n                line-height: inherit;\n            }\n            .mail-body .btn-primary table td:hover {\n                background-color: #34495e !important;\n            }\n            .mail-body .btn-primary a:hover {\n                background-color: #34495e !important;\n                border-color: #34495e !important;\n            }\n        }\n\n    </style>\n</head>\n<body>\n<span class="preheader">Helpdesk ticket update</span>\n<table role="presentation" border="0" cellpadding="0" cellspacing="0" class="mail-body">\n    <tr>\n        <td></td>\n        <td class="container">\n            <div class="content">\n\n                <!-- START CENTERED WHITE CONTAINER -->\n                <table role="presentation" class="main">\n\n                    <!-- START MAIN CONTENT AREA -->\n                    <tr>\n                        <td class="header">\n                            <a href="#">\n                                <img style="height: 60px; width: auto; margin: 15px auto;display: block" src="http://localhost:8000/images/logo.png" alt="help desk" />\n                            </a>\n                        </td>\n                    </tr>\n                    <tr>\n                        <td class="wrapper">\n\n                            <table role="presentation" class="main-table" border="0" cellpadding="0" cellspacing="0">\n                                <tr>\n                                    <td>\n                                        <p>Hi {name},</p>\n                                        <p>A new ticket has been created. You would be able to login with the following credentials to review your ticket and following up continue process.</p>\n                                        <table role="presentation" border="0" cellpadding="0" cellspacing="0">\n                                            <tbody>\n                                            <tr>\n                                                <td><strong>Ticket Number:</strong> {uid}</td>\n                                            </tr>\n                                            <tr>\n                                                <td><strong>Email:</strong> {email}</td>\n                                            </tr>\n                                            <tr>\n                                                <td><strong>Password:</strong> {password}</td>\n                                            </tr>\n                                            <tr>\n                                                <td class="gap-bottom"> You would be able to login from the following url.</td>\n                                            </tr>\n                                            <tr>\n                                                <td align="left">\n                                                    <table role="presentation" border="0" cellpadding="0" cellspacing="0">\n                                                        <tbody>\n                                                        <tr>\n                                                            <td class="btn btn-primary"><a href="{url}" target="_blank">Login</a> </td>\n                                                        </tr>\n                                                        </tbody>\n                                                    </table>\n                                                </td>\n                                            </tr>\n                                            </tbody>\n                                        </table>\n                                        <p class="gap-top">We will send you also different email regarding the ticket update but if you login on the system you would be able to discuss continue with manager regarding your ticket.</p>\n                                        <p>Thank you!</p>\n                                        <p>Best regards, <br/>{sender_name}</p>\n                                    </td>\n                                </tr>\n                            </table>\n                        </td>\n                    </tr>\n\n                    <!-- END MAIN CONTENT AREA -->\n                </table>\n                <!-- END CENTERED WHITE CONTAINER -->\n\n                <!-- START FOOTER -->\n                <div class="footer">\n                    <table role="presentation" border="0" cellpadding="0" cellspacing="0">\n                        <tr>\n                            <td class="content-block">\n                                <span class="apple-link">HelpDesk - A online ticket support system</span>\n                            </td>\n                        </tr>\n                        <tr>\n                            <td class="content-block powered-by">\n                                © 2022 <a href="http://w3bd.com">W3BD</a> - All rights reserved.\n                            </td>\n                        </tr>\n                    </table>\n                </div>\n                <!-- END FOOTER -->\n\n            </div>\n        </td>\n        <td></td>\n    </tr>\n</table>\n</body>\n</html>\n'),
	(2, 'Create ticket from dashboard', 'When a ticket created from the admin page', 'create_ticket_dashboard', 'en', '<!doctype html>\n<html>\n<head>\n    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>\n    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />\n    <title>Ticket mail</title>\n    <style>\n\n        .mail-body img {\n            border: none;\n            -ms-interpolation-mode: bicubic;\n            max-width: 100%;\n        }\n\n        body {\n            background-color: #f6f6f6;\n        }\n\n        .mail-body table {\n            border-collapse: separate;\n            mso-table-lspace: 0pt;\n            mso-table-rspace: 0pt;\n            width: 100%; }\n        .mail-body table td {\n            font-family: sans-serif;\n            font-size: 14px;\n            vertical-align: top;\n        }\n        .mail-body {\n            background-color: #f6f6f6;\n            width: 100%;\n            font-size: 14px;\n            font-family: sans-serif;\n            -webkit-font-smoothing: antialiased;\n            line-height: 1.4;\n            margin: 0;\n            padding: 0;\n            -ms-text-size-adjust: 100%;\n            -webkit-text-size-adjust: 100%;\n        }\n\n        .mail-body .container {\n            display: block;\n            margin: 0 auto !important;\n            /* makes it centered */\n            max-width: 580px;\n            padding: 10px;\n            width: 580px;\n        }\n\n        .mail-body .content {\n            box-sizing: border-box;\n            display: block;\n            margin: 0 auto;\n            max-width: 580px;\n            padding: 10px;\n        }\n\n        .mail-body .main {\n            background: #ffffff;\n            border-radius: 3px;\n            width: 100%;\n        }\n\n        .mail-body .wrapper {\n            box-sizing: border-box;\n            padding: 20px;\n        }\n\n        .mail-body .content-block {\n            padding-bottom: 5px;\n            padding-top: 5px;\n        }\n\n        .mail-body .footer {\n            clear: both;\n            margin-top: 10px;\n            text-align: center;\n            width: 100%;\n        }\n        .mail-body .footer td,\n        .mail-body .footer p,\n        .mail-body .footer span,\n        .mail-body .footer a {\n            color: #999999;\n            font-size: 12px;\n            text-align: center;\n        }\n\n        .mail-body h1,\n        .mail-body h2,\n        .mail-body h3,\n        .mail-body h4 {\n            color: #000000;\n            font-family: sans-serif;\n            font-weight: 400;\n            line-height: 1.4;\n            margin: 0;\n            margin-bottom: 30px;\n        }\n\n        .mail-body h1 {\n            font-size: 35px;\n            font-weight: 300;\n            text-align: center;\n            text-transform: capitalize;\n        }\n\n        .mail-body p,\n        .mail-body ul,\n        .mail-body ol {\n            font-family: sans-serif;\n            font-size: 14px;\n            font-weight: normal;\n            margin: 0;\n            margin-bottom: 15px;\n            line-height: 1.4;\n        }\n        .mail-body p li,\n        .mail-body ul li,\n        .mail-body ol li {\n            list-style-position: inside;\n            margin-left: 5px;\n        }\n\n        .mail-body .btn {\n            box-sizing: border-box;\n            width: 100%; }\n        .mail-body .btn > tbody > tr > td {\n            padding-bottom: 15px; }\n        .mail-body .btn table {\n            width: auto;\n        }\n        .mail-body .btn table td {\n            background-color: #ffffff;\n            border-radius: 5px;\n            text-align: center;\n        }\n        .mail-body .btn a {\n            background-color: #ffffff;\n            border: solid 1px #7366ff;\n            border-radius: 5px;\n            box-sizing: border-box;\n            color: #7366ff;\n            cursor: pointer;\n            display: inline-block;\n            font-size: 14px;\n            font-weight: bold;\n            margin: 0;\n            padding: 6px 25px;\n            text-decoration: none;\n            text-transform: capitalize;\n        }\n\n        .mail-body .btn-primary table td {\n            background-color: #7366ff;\n        }\n\n        .mail-body .btn-primary a {\n            background-color: #7366ff;\n            border-color: #7366ff;\n            color: #ffffff;\n        }\n\n\n        .mail-body .last {\n            margin-bottom: 0;\n        }\n\n        .mail-body .first {\n            margin-top: 0;\n        }\n\n        .mail-body .align-center {\n            text-align: center;\n        }\n\n        .mail-body .align-right {\n            text-align: right;\n        }\n\n        .mail-body .align-left {\n            text-align: left;\n        }\n\n        .mail-body .clear {\n            clear: both;\n        }\n\n        .mail-body .mt0 {\n            margin-top: 0;\n        }\n\n        .mail-body .mb0 {\n            margin-bottom: 0;\n        }\n\n        .preheader {\n            color: transparent;\n            display: none;\n            height: 0;\n            max-height: 0;\n            max-width: 0;\n            opacity: 0;\n            overflow: hidden;\n            mso-hide: all;\n            visibility: hidden;\n            width: 0;\n        }\n\n        .mail-body .powered-by a {\n            text-decoration: none;\n        }\n\n        .mail-body hr {\n            border: 0;\n            border-bottom: 1px solid #f6f6f6;\n            margin: 20px 0;\n        }\n\n        .mail-body .main{\n            background-image: url(\'https://res.cloudinary.com/robinbd/image/upload/v1663394450/mail-template/background-bottom.png\');\n            background-repeat: no-repeat;\n            background-size: 100%;\n            background-position: 50% 100%;\n        }\n\n        @media only screen and (max-width: 620px) {\n            table.mail-body h1 {\n                font-size: 28px !important;\n                margin-bottom: 10px !important;\n            }\n            table.mail-body p,\n            table.mail-body ul,\n            table.mail-body ol,\n            table.mail-body td,\n            table.mail-body span,\n            table.mail-body a {\n                font-size: 16px !important;\n            }\n            table.mail-body .wrapper,\n            table.mail-body .article {\n                padding: 10px !important;\n            }\n            table.mail-body .content {\n                padding: 0 !important;\n            }\n            table.mail-body .container {\n                padding: 0 !important;\n                width: 100% !important;\n            }\n            table.mail-body .main {\n                border-left-width: 0 !important;\n                border-radius: 0 !important;\n                border-right-width: 0 !important;\n            }\n            table.mail-body .btn table {\n                width: 100% !important;\n            }\n            table.mail-body .btn a {\n                width: 100% !important;\n            }\n            table.mail-body .img-responsive {\n                height: auto !important;\n                max-width: 100% !important;\n                width: auto !important;\n            }\n        }\n\n        @media all {\n            .mail-body .ExternalClass {\n                width: 100%;\n            }\n            .mail-body .ExternalClass,\n            .mail-body .ExternalClass p,\n            .mail-body .ExternalClass span,\n            .mail-body .ExternalClass font,\n            .mail-body .ExternalClass td,\n            .mail-body .ExternalClass div {\n                line-height: 100%;\n            }\n            .mail-body .apple-link a {\n                color: inherit !important;\n                font-family: inherit !important;\n                font-size: inherit !important;\n                font-weight: inherit !important;\n                line-height: inherit !important;\n                text-decoration: none !important;\n            }\n            #MessageViewBody a {\n                color: inherit;\n                text-decoration: none;\n                font-size: inherit;\n                font-family: inherit;\n                font-weight: inherit;\n                line-height: inherit;\n            }\n            .mail-body .btn-primary table td:hover {\n                background-color: #34495e !important;\n            }\n            .mail-body .btn-primary a:hover {\n                background-color: #34495e !important;\n                border-color: #34495e !important;\n            }\n        }\n\n    </style>\n</head>\n<body>\n<span class="preheader">Helpdesk ticket update</span>\n<table role="presentation" border="0" cellpadding="0" cellspacing="0" class="mail-body">\n    <tr>\n        <td></td>\n        <td class="container">\n            <div class="content">\n\n                <!-- START CENTERED WHITE CONTAINER -->\n                <table role="presentation" class="main">\n\n                    <!-- START MAIN CONTENT AREA -->\n                    <tr>\n                        <td class="header">\n                            <a href="#">\n                                <img style="height: 60px; width: auto; margin: 15px auto;display: block" src="https://res.cloudinary.com/robinbd/image/upload/v1663394454/mail-template/help-desk-logo.png" alt="help desk" />\n                            </a>\n                        </td>\n                    </tr>\n                    <tr>\n                        <td class="wrapper">\n\n                            <table role="presentation" class="main-table" border="0" cellpadding="0" cellspacing="0">\n                                <tr>\n                                    <td>\n                                        <p>Hi {name},</p>\n                                        <p>A new ticket has been created. You would be able to review the ticket and following up continue process from the following link.</p>\n                                        <table role="presentation" border="0" cellpadding="0" cellspacing="0" class="btn btn-primary">\n                                            <tbody>\n                                            <tr>\n                                                <td><strong>Ticket number:</strong> {uid}</td>\n                                            </tr>\n                                            <tr>\n                                                <td><strong>Subject:</strong> {subject}</td>\n                                            </tr>\n                                            <tr>\n                                                <td><strong>Ticket type:</strong> {type}</td>\n                                            </tr>\n                                            <tr>\n                                                <td align="left">\n                                                    <table role="presentation" border="0" cellpadding="0" cellspacing="0">\n                                                        <tbody>\n                                                        <tr>\n                                                            <td><a href="{url}" target="_blank">View ticket</a> </td>\n                                                        </tr>\n                                                        </tbody>\n                                                    </table>\n                                                </td>\n                                            </tr>\n                                            </tbody>\n                                        </table>\n                                        <p>We will send you also different email regarding the ticket update but if you login on the system you would be able to discuss continue with manager regarding your ticket.</p>\n                                        <p>Thank you!</p>\n                                        <p>Best regards, <br/>{sender_name}</p>\n                                    </td>\n                                </tr>\n                            </table>\n                        </td>\n                    </tr>\n\n                    <!-- END MAIN CONTENT AREA -->\n                </table>\n                <!-- END CENTERED WHITE CONTAINER -->\n\n                <!-- START FOOTER -->\n                <div class="footer">\n                    <table role="presentation" border="0" cellpadding="0" cellspacing="0">\n                        <tr>\n                            <td class="content-block">\n                                <span class="apple-link">HelpDesk - A online ticket support system</span>\n                            </td>\n                        </tr>\n                        <tr>\n                            <td class="content-block powered-by">\n                                © 2022 <a href="http://w3bd.com">W3BD</a> - All rights reserved.\n                            </td>\n                        </tr>\n                    </table>\n                </div>\n                <!-- END FOOTER -->\n\n            </div>\n        </td>\n        <td></td>\n    </tr>\n</table>\n</body>\n</html>\n'),
	(3, 'Custom Mail', 'It will use to send any custom email.', 'custom_mail', 'en', '<!doctype html>\n<html>\n<head>\n    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>\n    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />\n    <title>Event mail</title>\n    <style>\n\n        .mail-body img {\n            border: none;\n            -ms-interpolation-mode: bicubic;\n            max-width: 100%;\n        }\n\n        body {\n            background-color: #f6f6f6;\n        }\n\n        .mail-body table {\n            border-collapse: separate;\n            mso-table-lspace: 0pt;\n            mso-table-rspace: 0pt;\n            width: 100%; }\n        .mail-body table td {\n            font-family: sans-serif;\n            font-size: 14px;\n            vertical-align: top;\n        }\n        .mail-body {\n            background-color: #f6f6f6;\n            width: 100%;\n            font-size: 14px;\n            font-family: sans-serif;\n            -webkit-font-smoothing: antialiased;\n            line-height: 1.4;\n            margin: 0;\n            padding: 0;\n            -ms-text-size-adjust: 100%;\n            -webkit-text-size-adjust: 100%;\n        }\n\n        .mail-body .container {\n            display: block;\n            margin: 0 auto !important;\n            /* makes it centered */\n            max-width: 580px;\n            padding: 10px;\n            width: 580px;\n        }\n\n        .mail-body .content {\n            box-sizing: border-box;\n            display: block;\n            margin: 0 auto;\n            max-width: 580px;\n            padding: 10px;\n        }\n\n        .mail-body .main {\n            background: #ffffff;\n            border-radius: 3px;\n            width: 100%;\n        }\n\n        .mail-body .wrapper {\n            box-sizing: border-box;\n            padding: 20px;\n        }\n\n        .mail-body .content-block {\n            padding-bottom: 5px;\n            padding-top: 5px;\n        }\n\n        .mail-body .footer {\n            clear: both;\n            margin-top: 10px;\n            text-align: center;\n            width: 100%;\n        }\n        .mail-body .footer td,\n        .mail-body .footer p,\n        .mail-body .footer span,\n        .mail-body .footer a {\n            color: #999999;\n            font-size: 12px;\n            text-align: center;\n        }\n\n        .mail-body h1,\n        .mail-body h2,\n        .mail-body h3,\n        .mail-body h4 {\n            color: #000000;\n            font-family: sans-serif;\n            font-weight: 400;\n            line-height: 1.4;\n            margin: 0;\n            margin-bottom: 30px;\n        }\n\n        .mail-body h1 {\n            font-size: 35px;\n            font-weight: 300;\n            text-align: center;\n            text-transform: capitalize;\n        }\n\n        .mail-body p,\n        .mail-body ul,\n        .mail-body ol {\n            font-family: sans-serif;\n            font-size: 14px;\n            font-weight: normal;\n            margin: 0;\n            margin-bottom: 15px;\n            line-height: 1.4;\n        }\n        .mail-body p li,\n        .mail-body ul li,\n        .mail-body ol li {\n            list-style-position: inside;\n            margin-left: 5px;\n        }\n\n        .mail-body .btn {\n            box-sizing: border-box;\n            width: 100%; }\n        .mail-body .btn > tbody > tr > td {\n            padding-bottom: 15px; }\n        .mail-body .btn table {\n            width: auto;\n        }\n        .mail-body .btn table td {\n            background-color: #ffffff;\n            border-radius: 5px;\n            text-align: center;\n        }\n        .mail-body .btn a {\n            background-color: #ffffff;\n            border: solid 1px #7366ff;\n            border-radius: 5px;\n            box-sizing: border-box;\n            color: #7366ff;\n            cursor: pointer;\n            display: inline-block;\n            font-size: 14px;\n            font-weight: bold;\n            margin: 0;\n            padding: 6px 25px;\n            text-decoration: none;\n            text-transform: capitalize;\n        }\n\n        .mail-body .btn-primary table td {\n            background-color: #7366ff;\n        }\n\n        .mail-body .btn-primary a {\n            background-color: #7366ff;\n            border-color: #7366ff;\n            color: #ffffff;\n        }\n\n\n        .mail-body .last {\n            margin-bottom: 0;\n        }\n\n        .mail-body .first {\n            margin-top: 0;\n        }\n\n        .mail-body .align-center {\n            text-align: center;\n        }\n\n        .mail-body .align-right {\n            text-align: right;\n        }\n\n        .mail-body .align-left {\n            text-align: left;\n        }\n\n        .mail-body .clear {\n            clear: both;\n        }\n\n        .mail-body .mt0 {\n            margin-top: 0;\n        }\n\n        .mail-body .mb0 {\n            margin-bottom: 0;\n        }\n\n        .preheader {\n            color: transparent;\n            display: none;\n            height: 0;\n            max-height: 0;\n            max-width: 0;\n            opacity: 0;\n            overflow: hidden;\n            mso-hide: all;\n            visibility: hidden;\n            width: 0;\n        }\n\n        .mail-body .powered-by a {\n            text-decoration: none;\n        }\n\n        .mail-body hr {\n            border: 0;\n            border-bottom: 1px solid #f6f6f6;\n            margin: 20px 0;\n        }\n\n        .mail-body .main{\n            background-image: url(\'https://res.cloudinary.com/robinbd/image/upload/v1663394450/mail-template/background-bottom.png\');\n            background-repeat: no-repeat;\n            background-size: 100%;\n            background-position: 50% 100%;\n        }\n\n        @media only screen and (max-width: 620px) {\n            table.mail-body h1 {\n                font-size: 28px !important;\n                margin-bottom: 10px !important;\n            }\n            table.mail-body p,\n            table.mail-body ul,\n            table.mail-body ol,\n            table.mail-body td,\n            table.mail-body span,\n            table.mail-body a {\n                font-size: 16px !important;\n            }\n            table.mail-body .wrapper,\n            table.mail-body .article {\n                padding: 10px !important;\n            }\n            table.mail-body .content {\n                padding: 0 !important;\n            }\n            table.mail-body .container {\n                padding: 0 !important;\n                width: 100% !important;\n            }\n            table.mail-body .main {\n                border-left-width: 0 !important;\n                border-radius: 0 !important;\n                border-right-width: 0 !important;\n            }\n            table.mail-body .btn table {\n                width: 100% !important;\n            }\n            table.mail-body .btn a {\n                width: 100% !important;\n            }\n            table.mail-body .img-responsive {\n                height: auto !important;\n                max-width: 100% !important;\n                width: auto !important;\n            }\n        }\n\n        @media all {\n            .mail-body .ExternalClass {\n                width: 100%;\n            }\n            .mail-body .ExternalClass,\n            .mail-body .ExternalClass p,\n            .mail-body .ExternalClass span,\n            .mail-body .ExternalClass font,\n            .mail-body .ExternalClass td,\n            .mail-body .ExternalClass div {\n                line-height: 100%;\n            }\n            .mail-body .apple-link a {\n                color: inherit !important;\n                font-family: inherit !important;\n                font-size: inherit !important;\n                font-weight: inherit !important;\n                line-height: inherit !important;\n                text-decoration: none !important;\n            }\n            #MessageViewBody a {\n                color: inherit;\n                text-decoration: none;\n                font-size: inherit;\n                font-family: inherit;\n                font-weight: inherit;\n                line-height: inherit;\n            }\n            .mail-body .btn-primary table td:hover {\n                background-color: #34495e !important;\n            }\n            .mail-body .btn-primary a:hover {\n                background-color: #34495e !important;\n                border-color: #34495e !important;\n            }\n        }\n\n    </style>\n</head>\n<body>\n<span class="preheader">ProSchedule</span>\n<table role="presentation" border="0" cellpadding="0" cellspacing="0" class="mail-body">\n    <tr>\n        <td></td>\n        <td class="container">\n            <div class="content">\n\n                <!-- START CENTERED WHITE CONTAINER -->\n                <table role="presentation" class="main">\n\n                    <!-- START MAIN CONTENT AREA -->\n                    <tr>\n                        <td class="header">\n                            <a href="#">\n                                <img style="height: 60px; width: auto; margin: 15px auto;display: block" src="https://res.cloudinary.com/robinbd/image/upload/v1678604949/codecanyon/pro-schedule/logo.png" alt="help desk" />\n                            </a>\n                        </td>\n                    </tr>\n                    <tr>\n                        <td class="wrapper">\n\n                            <table role="presentation" class="main-table" border="0" cellpadding="0" cellspacing="0">\n                                <tr>\n                                    <td>\n                                        <p>Hi {name},</p>\n                                        <table role="presentation" border="0" cellpadding="0" cellspacing="0" class="">\n                                            <tbody>\n                                            <tr>\n                                                <td>\n                                                    {body}\n                                                </td>\n                                            </tr>\n                                            </tbody>\n                                        </table>\n                                        <p>Best regards, <br/>{sender_name}</p>\n                                    </td>\n                                </tr>\n                            </table>\n                        </td>\n                    </tr>\n\n                    <!-- END MAIN CONTENT AREA -->\n                </table>\n                <!-- END CENTERED WHITE CONTAINER -->\n\n                <!-- START FOOTER -->\n                <div class="footer">\n                    <table role="presentation" border="0" cellpadding="0" cellspacing="0">\n                        <tr>\n                            <td class="content-block">\n                                <span class="apple-link">ProSchedule - A online ticket support system</span>\n                            </td>\n                        </tr>\n                        <tr>\n                            <td class="content-block powered-by">\n                                © 2022 <a href="http://w3bd.com">W3BD</a> - All rights reserved.\n                            </td>\n                        </tr>\n                    </table>\n                </div>\n                <!-- END FOOTER -->\n\n            </div>\n        </td>\n        <td></td>\n    </tr>\n</table>\n</body>\n</html>\n'),
	(4, 'Got assigned for a ticket', 'When a user got assigned for a ticket.', 'assigned_ticket', 'en', '<!doctype html>\n<html>\n<head>\n    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>\n    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />\n    <title>Ticket mail</title>\n    <style>\n\n        .mail-body img {\n            border: none;\n            -ms-interpolation-mode: bicubic;\n            max-width: 100%;\n        }\n\n        body {\n            background-color: #f6f6f6;\n        }\n\n        .mail-body table {\n            border-collapse: separate;\n            mso-table-lspace: 0pt;\n            mso-table-rspace: 0pt;\n            width: 100%; }\n        .mail-body table td {\n            font-family: sans-serif;\n            font-size: 14px;\n            vertical-align: top;\n        }\n        .mail-body {\n            background-color: #f6f6f6;\n            width: 100%;\n            font-size: 14px;\n            font-family: sans-serif;\n            -webkit-font-smoothing: antialiased;\n            line-height: 1.4;\n            margin: 0;\n            padding: 0;\n            -ms-text-size-adjust: 100%;\n            -webkit-text-size-adjust: 100%;\n        }\n\n        .mail-body .container {\n            display: block;\n            margin: 0 auto !important;\n            /* makes it centered */\n            max-width: 580px;\n            padding: 10px;\n            width: 580px;\n        }\n\n        .mail-body .content {\n            box-sizing: border-box;\n            display: block;\n            margin: 0 auto;\n            max-width: 580px;\n            padding: 10px;\n        }\n\n        .mail-body .main {\n            background: #ffffff;\n            border-radius: 3px;\n            width: 100%;\n        }\n\n        .mail-body .wrapper {\n            box-sizing: border-box;\n            padding: 20px;\n        }\n\n        .mail-body .content-block {\n            padding-bottom: 5px;\n            padding-top: 5px;\n        }\n\n        .mail-body .footer {\n            clear: both;\n            margin-top: 10px;\n            text-align: center;\n            width: 100%;\n        }\n        .mail-body .footer td,\n        .mail-body .footer p,\n        .mail-body .footer span,\n        .mail-body .footer a {\n            color: #999999;\n            font-size: 12px;\n            text-align: center;\n        }\n\n        .mail-body h1,\n        .mail-body h2,\n        .mail-body h3,\n        .mail-body h4 {\n            color: #000000;\n            font-family: sans-serif;\n            font-weight: 400;\n            line-height: 1.4;\n            margin: 0;\n            margin-bottom: 30px;\n        }\n\n        .mail-body h1 {\n            font-size: 35px;\n            font-weight: 300;\n            text-align: center;\n            text-transform: capitalize;\n        }\n\n        .mail-body p,\n        .mail-body ul,\n        .mail-body ol {\n            font-family: sans-serif;\n            font-size: 14px;\n            font-weight: normal;\n            margin: 0;\n            margin-bottom: 15px;\n            line-height: 1.4;\n        }\n        .mail-body p li,\n        .mail-body ul li,\n        .mail-body ol li {\n            list-style-position: inside;\n            margin-left: 5px;\n        }\n\n        .mail-body .btn {\n            box-sizing: border-box;\n            width: 100%; }\n        .mail-body .btn > tbody > tr > td {\n            padding-bottom: 15px; }\n        .mail-body .btn table {\n            width: auto;\n        }\n        .mail-body .btn table td {\n            background-color: #ffffff;\n            border-radius: 5px;\n            text-align: center;\n        }\n        .mail-body .btn a {\n            background-color: #ffffff;\n            border: solid 1px #7366ff;\n            border-radius: 5px;\n            box-sizing: border-box;\n            color: #7366ff;\n            cursor: pointer;\n            display: inline-block;\n            font-size: 14px;\n            font-weight: bold;\n            margin: 0;\n            padding: 6px 25px;\n            text-decoration: none;\n            text-transform: capitalize;\n        }\n\n        .mail-body .btn-primary table td {\n            background-color: #7366ff;\n        }\n\n        .mail-body .btn-primary a {\n            background-color: #7366ff;\n            border-color: #7366ff;\n            color: #ffffff;\n        }\n\n\n        .mail-body .last {\n            margin-bottom: 0;\n        }\n\n        .mail-body .first {\n            margin-top: 0;\n        }\n\n        .mail-body .align-center {\n            text-align: center;\n        }\n\n        .mail-body .align-right {\n            text-align: right;\n        }\n\n        .mail-body .align-left {\n            text-align: left;\n        }\n\n        .mail-body .clear {\n            clear: both;\n        }\n\n        .mail-body .mt0 {\n            margin-top: 0;\n        }\n\n        .mail-body .mb0 {\n            margin-bottom: 0;\n        }\n\n        .preheader {\n            color: transparent;\n            display: none;\n            height: 0;\n            max-height: 0;\n            max-width: 0;\n            opacity: 0;\n            overflow: hidden;\n            mso-hide: all;\n            visibility: hidden;\n            width: 0;\n        }\n\n        .mail-body .powered-by a {\n            text-decoration: none;\n        }\n\n        .mail-body hr {\n            border: 0;\n            border-bottom: 1px solid #f6f6f6;\n            margin: 20px 0;\n        }\n\n        .mail-body .main{\n            background-image: url(\'https://res.cloudinary.com/robinbd/image/upload/v1663394450/mail-template/background-bottom.png\');\n            background-repeat: no-repeat;\n            background-size: 100%;\n            background-position: 50% 100%;\n        }\n        .gap-bottom{\n            padding-bottom: 10px;\n        }\n        .gap-top{\n            padding-top: 10px;\n        }\n\n        @media only screen and (max-width: 620px) {\n            table.mail-body h1 {\n                font-size: 28px !important;\n                margin-bottom: 10px !important;\n            }\n            table.mail-body p,\n            table.mail-body ul,\n            table.mail-body ol,\n            table.mail-body td,\n            table.mail-body span,\n            table.mail-body a {\n                font-size: 16px !important;\n            }\n            table.mail-body .wrapper,\n            table.mail-body .article {\n                padding: 10px !important;\n            }\n            table.mail-body .content {\n                padding: 0 !important;\n            }\n            table.mail-body .container {\n                padding: 0 !important;\n                width: 100% !important;\n            }\n            table.mail-body .main {\n                border-left-width: 0 !important;\n                border-radius: 0 !important;\n                border-right-width: 0 !important;\n            }\n            table.mail-body .btn table {\n                width: 100% !important;\n            }\n            table.mail-body .btn a {\n                width: 100% !important;\n            }\n            table.mail-body .img-responsive {\n                height: auto !important;\n                max-width: 100% !important;\n                width: auto !important;\n            }\n        }\n\n        @media all {\n            .mail-body .ExternalClass {\n                width: 100%;\n            }\n            .mail-body .ExternalClass,\n            .mail-body .ExternalClass p,\n            .mail-body .ExternalClass span,\n            .mail-body .ExternalClass font,\n            .mail-body .ExternalClass td,\n            .mail-body .ExternalClass div {\n                line-height: 100%;\n            }\n            .mail-body .apple-link a {\n                color: inherit !important;\n                font-family: inherit !important;\n                font-size: inherit !important;\n                font-weight: inherit !important;\n                line-height: inherit !important;\n                text-decoration: none !important;\n            }\n            #MessageViewBody a {\n                color: inherit;\n                text-decoration: none;\n                font-size: inherit;\n                font-family: inherit;\n                font-weight: inherit;\n                line-height: inherit;\n            }\n            .mail-body .btn-primary table td:hover {\n                background-color: #34495e !important;\n            }\n            .mail-body .btn-primary a:hover {\n                background-color: #34495e !important;\n                border-color: #34495e !important;\n            }\n        }\n\n    </style>\n</head>\n<body>\n<span class="preheader">Helpdesk ticket update</span>\n<table role="presentation" border="0" cellpadding="0" cellspacing="0" class="mail-body">\n    <tr>\n        <td></td>\n        <td class="container">\n            <div class="content">\n\n                <!-- START CENTERED WHITE CONTAINER -->\n                <table role="presentation" class="main">\n\n                    <!-- START MAIN CONTENT AREA -->\n                    <tr>\n                        <td class="header">\n                            <a href="#">\n                                <img style="height: 60px; width: auto; margin: 15px auto;display: block" src="https://res.cloudinary.com/robinbd/image/upload/v1663394454/mail-template/help-desk-logo.png" alt="help desk" />\n                            </a>\n                        </td>\n                    </tr>\n                    <tr>\n                        <td class="wrapper">\n\n                            <table role="presentation" class="main-table" border="0" cellpadding="0" cellspacing="0">\n                                <tr>\n                                    <td>\n                                        <p>Hi {name},</p>\n                                        <p>You got assigned a new ticket. The following is the ticket info, you would be able to see in details with visiting the ticket link.</p>\n                                        <table role="presentation" border="0" cellpadding="0" cellspacing="0">\n                                            <tbody>\n                                            <tr>\n                                                <td><strong>Ticket number:</strong> {uid}</td>\n                                            </tr>\n                                            <tr>\n                                                <td><strong>Subject:</strong> {subject}</td>\n                                            </tr>\n                                            <tr>\n                                                <td><strong>Ticket type:</strong> {type}</td>\n                                            </tr>\n                                            <tr>\n                                                <td class="gap-bottom"> You would be able view the ticket from the following link.</td>\n                                            </tr>\n                                            <tr>\n                                                <td align="left">\n                                                    <table role="presentation" border="0" cellpadding="0" cellspacing="0">\n                                                        <tbody>\n                                                        <tr>\n                                                            <td class="btn btn-primary"><a href="{url}" target="_blank">View Ticket</a> </td>\n                                                        </tr>\n                                                        </tbody>\n                                                    </table>\n                                                </td>\n                                            </tr>\n                                            </tbody>\n                                        </table>\n                                        <p class="gap-top">We will send you also different email regarding the ticket update but if you login on the system you would be able to discuss continue with users who are associate with the ticket.</p>\n                                        <p>Thank you!</p>\n                                        <p>Best regards, <br/>{sender_name}</p>\n                                    </td>\n                                </tr>\n                            </table>\n                        </td>\n                    </tr>\n\n                    <!-- END MAIN CONTENT AREA -->\n                </table>\n                <!-- END CENTERED WHITE CONTAINER -->\n\n                <!-- START FOOTER -->\n                <div class="footer">\n                    <table role="presentation" border="0" cellpadding="0" cellspacing="0">\n                        <tr>\n                            <td class="content-block">\n                                <span class="apple-link">HelpDesk - A online ticket support system</span>\n                            </td>\n                        </tr>\n                        <tr>\n                            <td class="content-block powered-by">\n                                © 2022 <a href="http://w3bd.com">W3BD</a> - All rights reserved.\n                            </td>\n                        </tr>\n                    </table>\n                </div>\n                <!-- END FOOTER -->\n\n            </div>\n        </td>\n        <td></td>\n    </tr>\n</table>\n</body>\n</html>\n'),
	(5, 'The ticket has been updated', 'When a ticket has been updated.', 'ticket_updated', 'en', '<!doctype html>\n<html>\n<head>\n    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>\n    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />\n    <title>Ticket mail</title>\n    <style>\n\n        .mail-body img {\n            border: none;\n            -ms-interpolation-mode: bicubic;\n            max-width: 100%;\n        }\n\n        body {\n            background-color: #f6f6f6;\n        }\n\n        .mail-body table {\n            border-collapse: separate;\n            mso-table-lspace: 0pt;\n            mso-table-rspace: 0pt;\n            width: 100%; }\n        .mail-body table.bordered_table{\n            border-collapse: collapse;\n            width: 100%;\n            margin-bottom: 10px;\n        }\n        .mail-body table.bordered_table th, .mail-body table.bordered_table td{\n            border: 1px solid #ddd;\n            padding: 8px;\n        }\n        .mail-body table td b{\n            font-weight: 600;\n        }\n        .mail-body table td {\n            font-family: sans-serif;\n            font-size: 14px;\n            vertical-align: top;\n        }\n        .mail-body {\n            background-color: #f6f6f6;\n            width: 100%;\n            font-size: 14px;\n            font-family: sans-serif;\n            -webkit-font-smoothing: antialiased;\n            line-height: 1.4;\n            margin: 0;\n            padding: 0;\n            -ms-text-size-adjust: 100%;\n            -webkit-text-size-adjust: 100%;\n        }\n\n        .mail-body .container {\n            display: block;\n            margin: 0 auto !important;\n            /* makes it centered */\n            max-width: 580px;\n            padding: 10px;\n            width: 580px;\n        }\n\n        .mail-body .content {\n            box-sizing: border-box;\n            display: block;\n            margin: 0 auto;\n            max-width: 580px;\n            padding: 10px;\n        }\n\n        .mail-body .main {\n            background: #ffffff;\n            border-radius: 3px;\n            width: 100%;\n        }\n\n        .mail-body .wrapper {\n            box-sizing: border-box;\n            padding: 20px;\n        }\n\n        .mail-body .content-block {\n            padding-bottom: 5px;\n            padding-top: 5px;\n        }\n\n        .mail-body .footer {\n            clear: both;\n            margin-top: 10px;\n            text-align: center;\n            width: 100%;\n        }\n        .mail-body .footer td,\n        .mail-body .footer p,\n        .mail-body .footer span,\n        .mail-body .footer a {\n            color: #999999;\n            font-size: 12px;\n            text-align: center;\n        }\n\n        .mail-body h1,\n        .mail-body h2,\n        .mail-body h3,\n        .mail-body h4 {\n            color: #000000;\n            font-family: sans-serif;\n            font-weight: 400;\n            line-height: 1.4;\n            margin: 0;\n            margin-bottom: 30px;\n        }\n\n        .mail-body h1 {\n            font-size: 35px;\n            font-weight: 300;\n            text-align: center;\n            text-transform: capitalize;\n        }\n\n        .mail-body p,\n        .mail-body ul,\n        .mail-body ol {\n            font-family: sans-serif;\n            font-size: 14px;\n            font-weight: normal;\n            margin: 0;\n            margin-bottom: 15px;\n            line-height: 1.4;\n        }\n        .mail-body p li,\n        .mail-body ul li,\n        .mail-body ol li {\n            list-style-position: inside;\n            margin-left: 5px;\n        }\n\n        .mail-body .btn {\n            box-sizing: border-box;\n            width: 100%; }\n        .mail-body .btn > tbody > tr > td {\n            padding-bottom: 15px; }\n        .mail-body .btn table {\n            width: auto;\n        }\n        .mail-body .btn table td {\n            background-color: #ffffff;\n            border-radius: 5px;\n            text-align: center;\n        }\n        .mail-body .btn a {\n            background-color: #ffffff;\n            border: solid 1px #7366ff;\n            border-radius: 5px;\n            box-sizing: border-box;\n            color: #7366ff;\n            cursor: pointer;\n            display: inline-block;\n            font-size: 14px;\n            font-weight: bold;\n            margin: 0;\n            padding: 6px 25px;\n            text-decoration: none;\n            text-transform: capitalize;\n        }\n\n        .mail-body .btn-primary table td {\n            background-color: #7366ff;\n        }\n\n        .mail-body .btn-primary a {\n            background-color: #7366ff;\n            border-color: #7366ff;\n            color: #ffffff;\n        }\n\n\n        .mail-body .last {\n            margin-bottom: 0;\n        }\n\n        .mail-body .first {\n            margin-top: 0;\n        }\n\n        .mail-body .align-center {\n            text-align: center;\n        }\n\n        .mail-body .align-right {\n            text-align: right;\n        }\n\n        .mail-body .align-left {\n            text-align: left;\n        }\n\n        .mail-body .clear {\n            clear: both;\n        }\n\n        .mail-body .mt0 {\n            margin-top: 0;\n        }\n\n        .mail-body .mb0 {\n            margin-bottom: 0;\n        }\n\n        .preheader {\n            color: transparent;\n            display: none;\n            height: 0;\n            max-height: 0;\n            max-width: 0;\n            opacity: 0;\n            overflow: hidden;\n            mso-hide: all;\n            visibility: hidden;\n            width: 0;\n        }\n\n        .mail-body .powered-by a {\n            text-decoration: none;\n        }\n\n        .mail-body hr {\n            border: 0;\n            border-bottom: 1px solid #f6f6f6;\n            margin: 20px 0;\n        }\n\n        .mail-body .main{\n            background-image: url(\'https://res.cloudinary.com/robinbd/image/upload/v1663394450/mail-template/background-bottom.png\');\n            background-repeat: no-repeat;\n            background-size: 100%;\n            background-position: 50% 100%;\n        }\n        .gap-bottom{\n            padding-bottom: 10px;\n        }\n        .gap-top{\n            padding-top: 10px;\n        }\n\n        @media only screen and (max-width: 620px) {\n            table.mail-body h1 {\n                font-size: 28px !important;\n                margin-bottom: 10px !important;\n            }\n            table.mail-body p,\n            table.mail-body ul,\n            table.mail-body ol,\n            table.mail-body td,\n            table.mail-body span,\n            table.mail-body a {\n                font-size: 16px !important;\n            }\n            table.mail-body .wrapper,\n            table.mail-body .article {\n                padding: 10px !important;\n            }\n            table.mail-body .content {\n                padding: 0 !important;\n            }\n            table.mail-body .container {\n                padding: 0 !important;\n                width: 100% !important;\n            }\n            table.mail-body .main {\n                border-left-width: 0 !important;\n                border-radius: 0 !important;\n                border-right-width: 0 !important;\n            }\n            table.mail-body .btn table {\n                width: 100% !important;\n            }\n            table.mail-body .btn a {\n                width: 100% !important;\n            }\n            table.mail-body .img-responsive {\n                height: auto !important;\n                max-width: 100% !important;\n                width: auto !important;\n            }\n        }\n\n        @media all {\n            .mail-body .ExternalClass {\n                width: 100%;\n            }\n            .mail-body .ExternalClass,\n            .mail-body .ExternalClass p,\n            .mail-body .ExternalClass span,\n            .mail-body .ExternalClass font,\n            .mail-body .ExternalClass td,\n            .mail-body .ExternalClass div {\n                line-height: 100%;\n            }\n            .mail-body .apple-link a {\n                color: inherit !important;\n                font-family: inherit !important;\n                font-size: inherit !important;\n                font-weight: inherit !important;\n                line-height: inherit !important;\n                text-decoration: none !important;\n            }\n            #MessageViewBody a {\n                color: inherit;\n                text-decoration: none;\n                font-size: inherit;\n                font-family: inherit;\n                font-weight: inherit;\n                line-height: inherit;\n            }\n            .mail-body .btn-primary table td:hover {\n                background-color: #34495e !important;\n            }\n            .mail-body .btn-primary a:hover {\n                background-color: #34495e !important;\n                border-color: #34495e !important;\n            }\n        }\n\n    </style>\n</head>\n<body>\n<span class="preheader">Helpdesk ticket update</span>\n<table role="presentation" border="0" cellpadding="0" cellspacing="0" class="mail-body">\n    <tr>\n        <td></td>\n        <td class="container">\n            <div class="content">\n\n                <!-- START CENTERED WHITE CONTAINER -->\n                <table role="presentation" class="main">\n\n                    <!-- START MAIN CONTENT AREA -->\n                    <tr>\n                        <td class="header">\n                            <a href="#">\n                                <img style="height: 60px; width: auto; margin: 15px auto;display: block" src="https://res.cloudinary.com/robinbd/image/upload/v1663394454/mail-template/help-desk-logo.png" alt="help desk" />\n                            </a>\n                        </td>\n                    </tr>\n                    <tr>\n                        <td class="wrapper">\n\n                            <table role="presentation" class="main-table" border="0" cellpadding="0" cellspacing="0">\n                                <tr>\n                                    <td>\n                                        <p>Hi {name},</p>\n                                        <p>{update_message} The following is the ticket info, you would be able to see in details with visiting the ticket link.</p>\n                                        <table class="bordered_table">\n                                            <tbody>\n                                            <tr>\n                                                <td><b>Ticket number:</b></td>\n                                                <td>{uid}</td>\n                                            </tr>\n                                            <tr>\n                                                <td><b>Subject:</b></td>\n                                                <td>{subject}</td>\n                                            </tr>\n                                            <tr>\n                                                <td><b>Priority:</b></td>\n                                                <td>{priority}</td>\n                                            </tr>\n                                            <tr>\n                                                <td><b>Status:</b></td>\n                                                <td>{status}</td>\n                                            </tr>\n                                            <tr>\n                                                <td><b>Ticket type:</b></td>\n                                                <td>{type}</td>\n                                            </tr>\n                                            <tr>\n                                                <td><b>Department:</b></td>\n                                                <td>{department}</td>\n                                            </tr>\n                                            <tr>\n                                                <td><b>Category:</b></td>\n                                                <td>{category}</td>\n                                            </tr>\n                                            </tbody>\n                                        </table>\n                                        <table role="presentation" border="0" cellpadding="0" cellspacing="0">\n                                            <tbody>\n                                            <tr>\n                                                <td class="gap-bottom"> You would be able view the ticket from the following link.</td>\n                                            </tr>\n                                            <tr>\n                                                <td align="left">\n                                                    <table role="presentation" border="0" cellpadding="0" cellspacing="0">\n                                                        <tbody>\n                                                        <tr>\n                                                            <td class="btn btn-primary"><a href="{url}" target="_blank">View Ticket</a> </td>\n                                                        </tr>\n                                                        </tbody>\n                                                    </table>\n                                                </td>\n                                            </tr>\n                                            </tbody>\n                                        </table>\n                                        <p class="gap-top">We will send you also different email regarding the ticket update but if you login on the system you would be able to discuss continue with users who are associate with the ticket.</p>\n                                        <p>Thank you!</p>\n                                        <p>Best regards, <br/>{sender_name}</p>\n                                    </td>\n                                </tr>\n                            </table>\n                        </td>\n                    </tr>\n\n                    <!-- END MAIN CONTENT AREA -->\n                </table>\n                <!-- END CENTERED WHITE CONTAINER -->\n\n                <!-- START FOOTER -->\n                <div class="footer">\n                    <table role="presentation" border="0" cellpadding="0" cellspacing="0">\n                        <tr>\n                            <td class="content-block">\n                                <span class="apple-link">HelpDesk - A online ticket support system</span>\n                            </td>\n                        </tr>\n                        <tr>\n                            <td class="content-block powered-by">\n                                © 2022 <a href="http://w3bd.com">W3BD</a> - All rights reserved.\n                            </td>\n                        </tr>\n                    </table>\n                </div>\n                <!-- END FOOTER -->\n\n            </div>\n        </td>\n        <td></td>\n    </tr>\n</table>\n</body>\n</html>\n'),
	(6, 'A new comment has been added on the ticket', 'When a comment has been added on a ticket.', 'ticket_new_comment', 'en', '<!doctype html>\n<html>\n<head>\n    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>\n    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />\n    <title>Ticket mail</title>\n    <style>\n\n        .mail-body img {\n            border: none;\n            -ms-interpolation-mode: bicubic;\n            max-width: 100%;\n        }\n\n        body {\n            background-color: #f6f6f6;\n        }\n\n        .mail-body table {\n            border-collapse: separate;\n            mso-table-lspace: 0pt;\n            mso-table-rspace: 0pt;\n            width: 100%; }\n        .mail-body table td {\n            font-family: sans-serif;\n            font-size: 14px;\n            vertical-align: top;\n        }\n        .mail-body {\n            background-color: #f6f6f6;\n            width: 100%;\n            font-size: 14px;\n            font-family: sans-serif;\n            -webkit-font-smoothing: antialiased;\n            line-height: 1.4;\n            margin: 0;\n            padding: 0;\n            -ms-text-size-adjust: 100%;\n            -webkit-text-size-adjust: 100%;\n        }\n\n        .mail-body .container {\n            display: block;\n            margin: 0 auto !important;\n            /* makes it centered */\n            max-width: 580px;\n            padding: 10px;\n            width: 580px;\n        }\n\n        .mail-body .content {\n            box-sizing: border-box;\n            display: block;\n            margin: 0 auto;\n            max-width: 580px;\n            padding: 10px;\n        }\n\n        .mail-body .main {\n            background: #ffffff;\n            border-radius: 3px;\n            width: 100%;\n        }\n\n        .mail-body .wrapper {\n            box-sizing: border-box;\n            padding: 20px;\n        }\n\n        .mail-body .content-block {\n            padding-bottom: 5px;\n            padding-top: 5px;\n        }\n\n        .mail-body .footer {\n            clear: both;\n            margin-top: 10px;\n            text-align: center;\n            width: 100%;\n        }\n        .mail-body .footer td,\n        .mail-body .footer p,\n        .mail-body .footer span,\n        .mail-body .footer a {\n            color: #999999;\n            font-size: 12px;\n            text-align: center;\n        }\n\n        .mail-body h1,\n        .mail-body h2,\n        .mail-body h3,\n        .mail-body h4 {\n            color: #000000;\n            font-family: sans-serif;\n            font-weight: 400;\n            line-height: 1.4;\n            margin: 0;\n            margin-bottom: 30px;\n        }\n\n        .mail-body h1 {\n            font-size: 35px;\n            font-weight: 300;\n            text-align: center;\n            text-transform: capitalize;\n        }\n\n        .mail-body p,\n        .mail-body ul,\n        .mail-body ol {\n            font-family: sans-serif;\n            font-size: 14px;\n            font-weight: normal;\n            margin: 0;\n            margin-bottom: 15px;\n            line-height: 1.4;\n        }\n        .mail-body p li,\n        .mail-body ul li,\n        .mail-body ol li {\n            list-style-position: inside;\n            margin-left: 5px;\n        }\n\n        .mail-body .btn {\n            box-sizing: border-box;\n            width: 100%; }\n        .mail-body .btn > tbody > tr > td {\n            padding-bottom: 15px; }\n        .mail-body .btn table {\n            width: auto;\n        }\n        .mail-body .btn table td {\n            background-color: #ffffff;\n            border-radius: 5px;\n            text-align: center;\n        }\n        .mail-body .btn a {\n            background-color: #ffffff;\n            border: solid 1px #7366ff;\n            border-radius: 5px;\n            box-sizing: border-box;\n            color: #7366ff;\n            cursor: pointer;\n            display: inline-block;\n            font-size: 14px;\n            font-weight: bold;\n            margin: 0;\n            padding: 6px 25px;\n            text-decoration: none;\n            text-transform: capitalize;\n        }\n\n        .mail-body .btn-primary table td {\n            background-color: #7366ff;\n        }\n\n        .mail-body .btn-primary a {\n            background-color: #7366ff;\n            border-color: #7366ff;\n            color: #ffffff;\n        }\n\n\n        .mail-body .last {\n            margin-bottom: 0;\n        }\n\n        .mail-body .first {\n            margin-top: 0;\n        }\n\n        .mail-body .align-center {\n            text-align: center;\n        }\n\n        .mail-body .align-right {\n            text-align: right;\n        }\n\n        .mail-body .align-left {\n            text-align: left;\n        }\n\n        .mail-body .clear {\n            clear: both;\n        }\n\n        .mail-body .mt0 {\n            margin-top: 0;\n        }\n\n        .mail-body .mb0 {\n            margin-bottom: 0;\n        }\n\n        .preheader {\n            color: transparent;\n            display: none;\n            height: 0;\n            max-height: 0;\n            max-width: 0;\n            opacity: 0;\n            overflow: hidden;\n            mso-hide: all;\n            visibility: hidden;\n            width: 0;\n        }\n\n        .mail-body .powered-by a {\n            text-decoration: none;\n        }\n\n        .mail-body hr {\n            border: 0;\n            border-bottom: 1px solid #f6f6f6;\n            margin: 20px 0;\n        }\n\n        .mail-body .main{\n            background-image: url(\'https://res.cloudinary.com/robinbd/image/upload/v1663394450/mail-template/background-bottom.png\');\n            background-repeat: no-repeat;\n            background-size: 100%;\n            background-position: 50% 100%;\n        }\n        .gap-bottom{\n            padding-bottom: 10px;\n        }\n        .gap-top{\n            padding-top: 10px;\n        }\n\n        @media only screen and (max-width: 620px) {\n            table.mail-body h1 {\n                font-size: 28px !important;\n                margin-bottom: 10px !important;\n            }\n            table.mail-body p,\n            table.mail-body ul,\n            table.mail-body ol,\n            table.mail-body td,\n            table.mail-body span,\n            table.mail-body a {\n                font-size: 16px !important;\n            }\n            table.mail-body .wrapper,\n            table.mail-body .article {\n                padding: 10px !important;\n            }\n            table.mail-body .content {\n                padding: 0 !important;\n            }\n            table.mail-body .container {\n                padding: 0 !important;\n                width: 100% !important;\n            }\n            table.mail-body .main {\n                border-left-width: 0 !important;\n                border-radius: 0 !important;\n                border-right-width: 0 !important;\n            }\n            table.mail-body .btn table {\n                width: 100% !important;\n            }\n            table.mail-body .btn a {\n                width: 100% !important;\n            }\n            table.mail-body .img-responsive {\n                height: auto !important;\n                max-width: 100% !important;\n                width: auto !important;\n            }\n        }\n\n        @media all {\n            .mail-body .ExternalClass {\n                width: 100%;\n            }\n            .mail-body .ExternalClass,\n            .mail-body .ExternalClass p,\n            .mail-body .ExternalClass span,\n            .mail-body .ExternalClass font,\n            .mail-body .ExternalClass td,\n            .mail-body .ExternalClass div {\n                line-height: 100%;\n            }\n            .mail-body .apple-link a {\n                color: inherit !important;\n                font-family: inherit !important;\n                font-size: inherit !important;\n                font-weight: inherit !important;\n                line-height: inherit !important;\n                text-decoration: none !important;\n            }\n            #MessageViewBody a {\n                color: inherit;\n                text-decoration: none;\n                font-size: inherit;\n                font-family: inherit;\n                font-weight: inherit;\n                line-height: inherit;\n            }\n            .mail-body .btn-primary table td:hover {\n                background-color: #34495e !important;\n            }\n            .mail-body .btn-primary a:hover {\n                background-color: #34495e !important;\n                border-color: #34495e !important;\n            }\n        }\n\n    </style>\n</head>\n<body>\n<span class="preheader">Helpdesk ticket update</span>\n<table role="presentation" border="0" cellpadding="0" cellspacing="0" class="mail-body">\n    <tr>\n        <td></td>\n        <td class="container">\n            <div class="content">\n\n                <!-- START CENTERED WHITE CONTAINER -->\n                <table role="presentation" class="main">\n\n                    <!-- START MAIN CONTENT AREA -->\n                    <tr>\n                        <td class="header">\n                            <a href="#">\n                                <img style="height: 60px; width: auto; margin: 15px auto;display: block" src="https://res.cloudinary.com/robinbd/image/upload/v1663394454/mail-template/help-desk-logo.png" alt="help desk" />\n                            </a>\n                        </td>\n                    </tr>\n                    <tr>\n                        <td class="wrapper">\n\n                            <table role="presentation" class="main-table" border="0" cellpadding="0" cellspacing="0">\n                                <tr>\n                                    <td>\n                                        <p>Hi {name},</p>\n                                        <p>A new comment has been added on the ticket.</p>\n                                        <table role="presentation" border="0" cellpadding="0" cellspacing="0">\n                                            <tbody>\n                                            <tr>\n                                                <td><strong>Ticket number:</strong> {uid}</td>\n                                            </tr>\n                                            <tr>\n                                                <td><strong>Comment:</strong> {comment}</td>\n                                            </tr>\n                                            <tr>\n                                                <td class="gap-bottom gap-top"> You would be able view the ticket from the following link.</td>\n                                            </tr>\n                                            <tr>\n                                                <td align="left">\n                                                    <table role="presentation" border="0" cellpadding="0" cellspacing="0">\n                                                        <tbody>\n                                                        <tr>\n                                                            <td class="btn btn-primary"><a href="{url}" target="_blank">View Ticket</a> </td>\n                                                        </tr>\n                                                        </tbody>\n                                                    </table>\n                                                </td>\n                                            </tr>\n                                            </tbody>\n                                        </table>\n                                        <p class="gap-top">We will send you also different email regarding the ticket update but if you login on the system you would be able to discuss continue with users who are associate with the ticket.</p>\n                                        <p>Thank you!</p>\n                                        <p>Best regards, <br/>{sender_name}</p>\n                                    </td>\n                                </tr>\n                            </table>\n                        </td>\n                    </tr>\n\n                    <!-- END MAIN CONTENT AREA -->\n                </table>\n                <!-- END CENTERED WHITE CONTAINER -->\n\n                <!-- START FOOTER -->\n                <div class="footer">\n                    <table role="presentation" border="0" cellpadding="0" cellspacing="0">\n                        <tr>\n                            <td class="content-block">\n                                <span class="apple-link">HelpDesk - A online ticket support system</span>\n                            </td>\n                        </tr>\n                        <tr>\n                            <td class="content-block powered-by">\n                                © 2022 <a href="http://w3bd.com">W3BD</a> - All rights reserved.\n                            </td>\n                        </tr>\n                    </table>\n                </div>\n                <!-- END FOOTER -->\n\n            </div>\n        </td>\n        <td></td>\n    </tr>\n</table>\n</body>\n</html>\n'),
	(7, 'User created', 'When a new user created.', 'user_created', 'en', '<!doctype html>\n<html>\n<head>\n    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>\n    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />\n    <title>User Created mail</title>\n    <style>\n\n        .mail-body img {\n            border: none;\n            -ms-interpolation-mode: bicubic;\n            max-width: 100%;\n        }\n\n        body {\n            background-color: #f6f6f6;\n        }\n\n        .mail-body table {\n            border-collapse: separate;\n            mso-table-lspace: 0pt;\n            mso-table-rspace: 0pt;\n            width: 100%; }\n        .mail-body table td {\n            font-family: sans-serif;\n            font-size: 14px;\n            vertical-align: top;\n        }\n        .mail-body table.bordered_table{\n            border-collapse: collapse;\n            width: 100%;\n            margin-bottom: 10px;\n        }\n        .mail-body table.bordered_table th, .mail-body table.bordered_table td{\n            border: 1px solid #ddd;\n            padding: 8px;\n        }\n        .mail-body table td b{\n            font-weight: 600;\n        }\n        .mail-body {\n            background-color: #f6f6f6;\n            width: 100%;\n            font-size: 14px;\n            font-family: sans-serif;\n            -webkit-font-smoothing: antialiased;\n            line-height: 1.4;\n            margin: 0;\n            padding: 0;\n            -ms-text-size-adjust: 100%;\n            -webkit-text-size-adjust: 100%;\n        }\n\n        .mail-body .container {\n            display: block;\n            margin: 0 auto !important;\n            /* makes it centered */\n            max-width: 580px;\n            padding: 10px;\n            width: 580px;\n        }\n\n        .mail-body .content {\n            box-sizing: border-box;\n            display: block;\n            margin: 0 auto;\n            max-width: 580px;\n            padding: 10px;\n        }\n\n        .mail-body .main {\n            background: #ffffff;\n            border-radius: 3px;\n            width: 100%;\n        }\n\n        .mail-body .wrapper {\n            box-sizing: border-box;\n            padding: 20px;\n        }\n\n        .mail-body .content-block {\n            padding-bottom: 5px;\n            padding-top: 5px;\n        }\n\n        .mail-body .footer {\n            clear: both;\n            margin-top: 10px;\n            text-align: center;\n            width: 100%;\n        }\n        .mail-body .footer td,\n        .mail-body .footer p,\n        .mail-body .footer span,\n        .mail-body .footer a {\n            color: #999999;\n            font-size: 12px;\n            text-align: center;\n        }\n\n        .mail-body h1,\n        .mail-body h2,\n        .mail-body h3,\n        .mail-body h4 {\n            color: #000000;\n            font-family: sans-serif;\n            font-weight: 400;\n            line-height: 1.4;\n            margin: 0;\n            margin-bottom: 30px;\n        }\n\n        .mail-body h1 {\n            font-size: 35px;\n            font-weight: 300;\n            text-align: center;\n            text-transform: capitalize;\n        }\n\n        .mail-body p,\n        .mail-body ul,\n        .mail-body ol {\n            font-family: sans-serif;\n            font-size: 14px;\n            font-weight: normal;\n            margin: 0;\n            margin-bottom: 15px;\n            line-height: 1.4;\n        }\n        .mail-body p li,\n        .mail-body ul li,\n        .mail-body ol li {\n            list-style-position: inside;\n            margin-left: 5px;\n        }\n\n        .mail-body .btn {\n            box-sizing: border-box;\n            width: 100%; }\n        .mail-body .btn > tbody > tr > td {\n            padding-bottom: 15px; }\n        .mail-body .btn table {\n            width: auto;\n        }\n        .mail-body .btn table td {\n            background-color: #ffffff;\n            border-radius: 5px;\n            text-align: center;\n        }\n        .mail-body .btn a {\n            background-color: #ffffff;\n            border: solid 1px #7366ff;\n            border-radius: 5px;\n            box-sizing: border-box;\n            color: #7366ff;\n            cursor: pointer;\n            display: inline-block;\n            font-size: 14px;\n            font-weight: bold;\n            margin: 0;\n            padding: 6px 25px;\n            text-decoration: none;\n            text-transform: capitalize;\n        }\n\n        .mail-body .btn-primary table td {\n            background-color: #7366ff;\n        }\n\n        .mail-body .btn-primary a {\n            background-color: #7366ff;\n            border-color: #7366ff;\n            color: #ffffff;\n        }\n\n\n        .mail-body .last {\n            margin-bottom: 0;\n        }\n\n        .mail-body .first {\n            margin-top: 0;\n        }\n\n        .mail-body .align-center {\n            text-align: center;\n        }\n\n        .mail-body .align-right {\n            text-align: right;\n        }\n\n        .mail-body .align-left {\n            text-align: left;\n        }\n\n        .mail-body .clear {\n            clear: both;\n        }\n\n        .mail-body .mt0 {\n            margin-top: 0;\n        }\n\n        .mail-body .mb0 {\n            margin-bottom: 0;\n        }\n\n        .preheader {\n            color: transparent;\n            display: none;\n            height: 0;\n            max-height: 0;\n            max-width: 0;\n            opacity: 0;\n            overflow: hidden;\n            mso-hide: all;\n            visibility: hidden;\n            width: 0;\n        }\n\n        .mail-body .powered-by a {\n            text-decoration: none;\n        }\n\n        .mail-body hr {\n            border: 0;\n            border-bottom: 1px solid #f6f6f6;\n            margin: 20px 0;\n        }\n\n        .mail-body .main{\n            background-image: url(\'https://res.cloudinary.com/robinbd/image/upload/v1663394450/mail-template/background-bottom.png\');\n            background-repeat: no-repeat;\n            background-size: 100%;\n            background-position: 50% 100%;\n        }\n        .gap-bottom{\n            padding-bottom: 10px;\n        }\n        .gap-top{\n            padding-top: 10px;\n        }\n\n        @media only screen and (max-width: 620px) {\n            table.mail-body h1 {\n                font-size: 28px !important;\n                margin-bottom: 10px !important;\n            }\n            table.mail-body p,\n            table.mail-body ul,\n            table.mail-body ol,\n            table.mail-body td,\n            table.mail-body span,\n            table.mail-body a {\n                font-size: 16px !important;\n            }\n            table.mail-body .wrapper,\n            table.mail-body .article {\n                padding: 10px !important;\n            }\n            table.mail-body .content {\n                padding: 0 !important;\n            }\n            table.mail-body .container {\n                padding: 0 !important;\n                width: 100% !important;\n            }\n            table.mail-body .main {\n                border-left-width: 0 !important;\n                border-radius: 0 !important;\n                border-right-width: 0 !important;\n            }\n            table.mail-body .btn table {\n                width: 100% !important;\n            }\n            table.mail-body .btn a {\n                width: 100% !important;\n            }\n            table.mail-body .img-responsive {\n                height: auto !important;\n                max-width: 100% !important;\n                width: auto !important;\n            }\n        }\n\n        @media all {\n            .mail-body .ExternalClass {\n                width: 100%;\n            }\n            .mail-body .ExternalClass,\n            .mail-body .ExternalClass p,\n            .mail-body .ExternalClass span,\n            .mail-body .ExternalClass font,\n            .mail-body .ExternalClass td,\n            .mail-body .ExternalClass div {\n                line-height: 100%;\n            }\n            .mail-body .apple-link a {\n                color: inherit !important;\n                font-family: inherit !important;\n                font-size: inherit !important;\n                font-weight: inherit !important;\n                line-height: inherit !important;\n                text-decoration: none !important;\n            }\n            #MessageViewBody a {\n                color: inherit;\n                text-decoration: none;\n                font-size: inherit;\n                font-family: inherit;\n                font-weight: inherit;\n                line-height: inherit;\n            }\n            .mail-body .btn-primary table td:hover {\n                background-color: #34495e !important;\n            }\n            .mail-body .btn-primary a:hover {\n                background-color: #34495e !important;\n                border-color: #34495e !important;\n            }\n        }\n\n    </style>\n</head>\n<body>\n<span class="preheader">Helpdesk ticket update</span>\n<table role="presentation" border="0" cellpadding="0" cellspacing="0" class="mail-body">\n    <tr>\n        <td></td>\n        <td class="container">\n            <div class="content">\n\n                <!-- START CENTERED WHITE CONTAINER -->\n                <table role="presentation" class="main">\n\n                    <!-- START MAIN CONTENT AREA -->\n                    <tr>\n                        <td class="header">\n                            <a href="#">\n                                <img style="height: 60px; width: auto; margin: 15px auto;display: block" src="https://res.cloudinary.com/robinbd/image/upload/v1663394454/mail-template/help-desk-logo.png" alt="help desk" />\n                            </a>\n                        </td>\n                    </tr>\n                    <tr>\n                        <td class="wrapper">\n\n                            <table role="presentation" class="main-table" border="0" cellpadding="0" cellspacing="0">\n                                <tr>\n                                    <td>\n                                        <p>Hi {name},</p>\n                                        <p>Your HelpDesk account has been created. The following is the credentials for your account.</p>\n                                        <table class="bordered_table">\n                                            <tbody>\n                                            <tr>\n                                                <td><b>Login email</b></td>\n                                                <td>{email}</td>\n                                            </tr>\n                                            <tr>\n                                                <td><b>Password</b></td>\n                                                <td>{password}</td>\n                                            </tr>\n                                            </tbody>\n                                        </table>\n                                        <table role="presentation" border="0" cellpadding="0" cellspacing="0">\n                                            <tbody>\n                                            <tr>\n                                                <td class="gap-bottom"> You would be able login on the dashboard from the following link.</td>\n                                            </tr>\n                                            <tr>\n                                                <td align="left">\n                                                    <table role="presentation" border="0" cellpadding="0" cellspacing="0">\n                                                        <tbody>\n                                                        <tr>\n                                                            <td class="btn btn-primary"><a href="{url}" target="_blank">Login</a> </td>\n                                                        </tr>\n                                                        </tbody>\n                                                    </table>\n                                                </td>\n                                            </tr>\n                                            </tbody>\n                                        </table>\n                                        <p class="gap-top">Enjoy the features of HelpDesk.</p>\n                                        <p>Thank you!</p>\n                                        <p>Best regards, <br/>{sender_name}</p>\n                                    </td>\n                                </tr>\n                            </table>\n                        </td>\n                    </tr>\n\n                    <!-- END MAIN CONTENT AREA -->\n                </table>\n                <!-- END CENTERED WHITE CONTAINER -->\n\n                <!-- START FOOTER -->\n                <div class="footer">\n                    <table role="presentation" border="0" cellpadding="0" cellspacing="0">\n                        <tr>\n                            <td class="content-block">\n                                <span class="apple-link">HelpDesk - A online ticket support system</span>\n                            </td>\n                        </tr>\n                        <tr>\n                            <td class="content-block powered-by">\n                                © 2022 <a href="http://w3bd.com">W3BD</a> - All rights reserved.\n                            </td>\n                        </tr>\n                    </table>\n                </div>\n                <!-- END FOOTER -->\n\n            </div>\n        </td>\n        <td></td>\n    </tr>\n</table>\n</body>\n</html>\n');

-- Dumping structure for table helpdesk.failed_jobs
CREATE TABLE IF NOT EXISTS `failed_jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table helpdesk.failed_jobs: ~0 rows (approximately)

-- Dumping structure for table helpdesk.faqs
CREATE TABLE IF NOT EXISTS `faqs` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `details` text COLLATE utf8mb4_unicode_ci,
  `status` int NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table helpdesk.faqs: ~0 rows (approximately)

-- Dumping structure for table helpdesk.front_pages
CREATE TABLE IF NOT EXISTS `front_pages` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_active` int DEFAULT '1',
  `html` json DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table helpdesk.front_pages: ~6 rows (approximately)
INSERT INTO `front_pages` (`id`, `title`, `slug`, `is_active`, `html`, `created_at`, `updated_at`) VALUES
	(1, 'Privacy', 'privacy', 1, '{"title": "Privacy Policy", "content": "<p>Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source.</p><p>&nbsp;</p><h2><strong>Collection of personal information</strong></h2><p>We receive and store any information you knowingly provide to us when you make a purchase through the Website. Currently this is limited to your email address, which is required for you to be able to login to the Website and access any purchased Tailwind UI products.</p><h2><strong>Collection of non-personal information</strong></h2><p>When you visit the Website our servers automatically record information that your browser sends. This data may include information such as your device\'s IP address, browser type and version, operating system type and version, language preferences or the webpage you were visiting before you came to our Website, pages of our Website that you visit, the time spent on those pages, information you search for on our Website, access times and dates, and other statistics.</p><h2><strong>Purchases</strong></h2><p>All purchases made through the Website are processed by a third party payment processor, Paddle (<a href=\\"https://paddle.com/\\"><strong>paddle.com</strong></a>). Paddle may ask you for personal and/or non-personal information, such as your name, address, email address, credit card information, or other Personal Information. Paddle has a privacy policy (<a href=\\"https://paddle.com/legal-buyers/\\"><strong>paddle.com/legal-buyers/</strong></a>) that describes their collection and use of personal information. Tailwind does not control Paddle or its collection or use of information. Any questions or concerns about Paddle’s practices should be directed to Paddle.</p><p>Paddle provides us with certain non-personal information relating to purchases made by visitors to the Website. The non-personal information may include details of the purchase such as the date, amount paid, and product purchased. The non-personal purchase information may be linked to the Personal Information you provide to us (typically limited to your email address, as stated above). Paddle does not supply us with any of your other Personal Information such as your name, street address, or credit card information.</p><h2><strong>Managing personal information</strong></h2><p>You are able to update your Personal Information in your \\"Account Settings\\" on the Website. Currently this is limited to just your email address, as described above. You may also request that we delete your email address, but this will prevent you from accessing the products you have purchased from Tailwind.</p><p>When you update information, we may maintain a copy of the unrevised information in our records. Some information may remain in our private records after deletion of such information from your account for a retention period. Once the retention period expires, Personal Information shall be deleted. Therefore, the right to access, the right to erasure, your rights to access, add to, and update your information cannot be enforced after the expiration of the retention period.</p><p>We will retain and use your information as necessary to comply with our legal obligations, resolve disputes, and enforce our agreements. We may use any aggregated data derived from or incorporating your Personal Information after you update or delete it, but not in a manner that would identify you personally.</p><h2><strong>Use and processing of collected information</strong></h2><p>Any of the information we collect from you may be used to personalize your experience; improve our Website; improve customer service; process transactions; send notification emails such as password reminders, updates, etc; and operate our Website. Non-Personal Information collected is used only to identify potential cases of abuse and establish statistical information regarding Website usage. This statistical information is not otherwise aggregated in such a way that would identify any particular user of the system.</p><p>We may process Personal Information related to you if one of the following applies: (i) You have given their consent for one or more specific purposes. Note that under some legislations we may be allowed to process information until you object to such processing (by opting out), without having to rely on consent or any other of the following legal bases below. This, however, does not apply, whenever the processing of Personal Information is subject to European data protection law; (ii) Provision of information is necessary for the performance of an agreement with you and/or for any pre-contractual obligations thereof; (ii) Processing is necessary for compliance with a legal obligation to which you are subject; (iv) Processing is related to a task that is carried out in the public interest or in the exercise of official authority vested in us; (v) Processing is necessary for the purposes of the legitimate interests pursued by us or by a third party. In any case, we will be happy to clarify the specific legal basis that applies to the processing, and in particular whether the provision of Personal Data is a statutory or contractual requirement, or a requirement necessary to enter into a contract.</p><h2><strong>Information transfer and storage</strong></h2><p>Depending on your location, data transfers may involve transferring and storing your information in a country other than your own. You are entitled to learn about the legal basis of information transfers to a country outside the European Union or to any international organization governed by public international law or set up by two or more countries, such as the UN, and about the security measures taken by us to safeguard your information. If any such transfer takes place, you can find out more by checking the relevant sections of this document or inquire with us using the information provided in the Contact section.</p><h2><strong>The rights of users</strong></h2><p>You may exercise certain rights regarding your information processed by us. In particular, you have the right to do the following: (i) you have the right to withdraw consent where you have previously given your consent to the processing of your information; (ii) you have the right to object to the processing of your information if the processing is carried out on a legal basis other than consent; (iii) you have the right to learn if information is being processed by us, obtain disclosure regarding certain aspects of the processing and obtain a copy of the information undergoing processing; (iv) you have the right to verify the accuracy of your information and ask for it to be updated or corrected; (v) you have the right, under certain circumstances, to restrict the processing of your information, in which case, we will not process your information for any purpose other than storing it; (vi) you have the right, under certain circumstances, to obtain the erasure of your Personal Information from us; (vii) you have the right to receive your information in a structured, commonly used and machine readable format and, if technically feasible, to have it transmitted to another controller without any hindrance. This provision is applicable provided that your information is processed by automated means and that the processing is based on your consent, on a contract which you are part of or on pre-contractual obligations thereof.</p><h2><strong>The right to object to processing</strong></h2><p>Where Personal Information is processed for a public interest, in the exercise of an official authority vested in us or for the purposes of the legitimate interests pursued by us, you may object to such processing by providing a ground related to your particular situation to justify the objection. You must know that, however, should your Personal Information be processed for direct marketing purposes, you can object to that processing at any time without providing any justification. To learn whether we are processing Personal Information for direct marketing purposes, you may refer to the relevant sections of this document.</p><h2><strong>How to exercise these rights</strong></h2><p>Any requests to exercise User rights can be directed to the Owner by email at <a href=\\"mailto:support@tailwindui.com\\"><strong>support@tailwindui.com</strong></a>. These requests can be exercised free of charge and will be addressed by the Owner as early as possible and always within one month.</p><h2><strong>Privacy of children</strong></h2><p>We do not knowingly collect any Personal Information from children under the age of 13. If you are under the age of 13, please do not submit any Personal Information through our Website. We encourage parents and legal guardians to monitor their children\'s Internet usage and to help enforce this Policy by instructing their children never to provide Personal Information through our Website without their permission. If you have reason to believe that a child under the age of 13 has provided Personal Information to us through our Website, please contact us.</p><h2><strong>Newsletters</strong></h2><p>We offer electronic newsletters which you may voluntarily subscribe to. You may choose to stop receiving our newsletter or marketing emails by following the unsubscribe instructions included in these emails or by contacting us. However, you will continue to receive essential transactional emails.</p><h2><strong>Cookies</strong></h2><p>The Website uses \\"cookies\\" to help personalize your online experience. A cookie is a text file that is placed on your hard disk by a web page server. Cookies cannot be used to run programs or deliver viruses to your computer. Cookies are uniquely assigned to you, and can only be read by a web server in the domain that issued the cookie to you. We may use cookies to collect, store, and track information for statistical purposes to operate our Website. You have the ability to accept or decline cookies. Most web browsers automatically accept cookies, but you can usually modify your browser setting to decline cookies if you prefer.</p><p>In addition to using cookies and related technologies as described above, we also may permit certain third-party companies to help us tailor advertising that we think may be of interest to users and to collect and use other data about user activities on the Website. These companies may deliver ads that might also place cookies and otherwise track user behavior.</p><h2><strong>Links to other websites</strong></h2><p>Our Website contains links to other websites that are not owned or controlled by us. Please be aware that we are not responsible for the privacy practices of such other websites or third parties. We encourage you to be aware when you leave our Website and to read the privacy statements of each and every website that may collect Personal Information.</p><p>In particular, as noted above, purchases made through the Website are handled by Paddle and all such transactions, including any Personal Information or non-personal information collected by Paddle, are under the control of Paddle. We encourage purchasers to read Paddle’s Privacy Policy (<a href=\\"https://paddle.com/legal-buyers/\\"><strong>paddle.com/legal-buyers/</strong></a>).</p><h2><strong>Information security</strong></h2><p>We secure information you provide on computer servers in a controlled, secure environment, protected from unauthorized access, use, or disclosure. We maintain reasonable administrative, technical, and physical safeguards in an effort to protect against unauthorized access, use, modification, and disclosure of Personal Information in its control and custody. However, no data transmission over the Internet or wireless network can be guaranteed. Therefore, while we strive to protect your Personal Information, you acknowledge that (i) there are security and privacy limitations of the Internet which are beyond our control; (ii) the security, integrity, and privacy of any and all information and data exchanged between you and our Website cannot be guaranteed; and (iii) any such information and data may be viewed or tampered with in transit by a third-party, despite best efforts.</p><h2><strong>Data breach</strong></h2><p>In the event we become aware that the security of the Website has been compromised or users’ Personal Information has been disclosed to unrelated third-parties as a result of external activity, including, but not limited to, security attacks or fraud, we reserve the right to take reasonably appropriate measures, including, but not limited to, investigation and reporting, as well as notification to and cooperation with law enforcement authorities. In the event of a data breach, we will make reasonable efforts to notify affected individuals if we believe that there is a reasonable risk of harm to the user as a result of the breach or if notice is otherwise required by law. When we do we will send you an email.</p><h2><strong>Legal disclosure</strong></h2><p>We will disclose any information we collect, use or receive if required or permitted by law, such as to comply with a subpoena, or similar legal process, and when we believe in good faith that disclosure is necessary to protect our rights, protect your safety or the safety of others, investigate fraud, or respond to a government request. In the event we go through a business transition, such as a merger or acquisition by another company, or sale of all or a portion of its assets, your user account and personal data will likely be among the assets transferred.</p><h2><strong>Changes and amendments</strong></h2><p>We reserve the right to modify this privacy policy relating to the Website at any time, effective upon posting of an updated version of this Policy on the Website. When we do we will revise the updated date at the bottom of this page. Continued use of the Website after any such changes shall constitute your consent to such changes.</p><h2><strong>Acceptance of this policy</strong></h2><p>You acknowledge that you have read this Policy and agree to all its terms and conditions. By using the Website you agree to be bound by this Policy. If you do not agree to abide by the terms of this Policy, you are not authorized to use or access the Website.</p>"}', '2023-10-13 04:25:37', '2023-10-13 04:25:37'),
	(2, 'Contact', 'contact', 1, '{"email": "contact@mail.com", "phone": "+902930290232", "location": "8013 Alderwood St. South San Francisco, CA 94080", "content_text": "GET IN TOUCH WITH US", "location_map": "https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d39206.002432144705!2d-95.4973981212445!3d29.709510002925988!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x8640c16de81f3ca5%3A0xf43e0b60ae539ac9!2sGerald+D.+Hines+Waterwall+Park!5e0!3m2!1sen!2sin!4v1566305861440!5m2!1sen!2sin", "email_details": "The phrasal sequence of the is now so that many campaign and benefit", "phone_details": "The phrasal sequence of the is now so that many campaign and benefit.", "content_details": "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eius tempor incididunt ut labore et dolore magna aliqua. Ut enim adiqua minim veniam quis nostrud exercitation ullamco"}', '2023-10-13 04:25:37', '2023-10-13 04:25:37'),
	(3, 'Services', 'services', 1, '{"contact": {"tag": "Available for freelance projects", "title": "Do you have digital project? <br> Let\'s talk.", "details": "Start working with HelpDesk that can provide everything you need to generate awareness, drive traffic, connect."}, "services": [{"icon": "airplay", "name": "UX / UI Design", "details": "The phrasal sequence of the is now so that many campaign and benefit"}, {"icon": "compass", "name": "IOS App Designer", "details": "The phrasal sequence of the is now so that many campaign and benefit"}, {"icon": "camera", "name": "Photography", "details": "The phrasal sequence of the is now so that many campaign and benefit"}, {"icon": "aperture", "name": "Graphic Designer", "details": "The phrasal sequence of the is now so that many campaign and benefit"}, {"icon": "security", "name": "Web Security", "details": "The phrasal sequence of the is now so that many campaign and benefit"}, {"icon": "palette", "name": "24/7 Support", "details": "The phrasal sequence of the is now so that many campaign and benefit"}]}', '2023-10-13 04:25:37', '2023-10-13 04:25:37'),
	(4, 'Terms of Services', 'terms', 1, '{"title": "Terms of Services", "content": "<h3><strong>Introduction :</strong></h3><p>It seems that only fragments of the original text remain in the Lorem Ipsum texts used today. One may speculate that over the course of time certain letters were added or deleted at various positions within the text.</p><p>&nbsp;</p><h3><strong>User Agreements :</strong></h3><p>The most well-known dummy text is the \'Lorem Ipsum\', which is said to have <strong>originated</strong> in the 16th century. Lorem Ipsum is <strong>composed</strong> in a pseudo-Latin language which more or less <strong>corresponds</strong> to \'proper\' Latin. It contains a series of real Latin words. This ancient dummy text is also <strong>incomprehensible</strong>, but it imitates the rhythm of most European languages in Latin script. The <strong>advantage</strong> of its Latin origin and the relative <strong>meaninglessness</strong> of Lorum Ipsum is that the text does not attract attention to itself or distract the viewer\'s <strong>attention</strong> from the layout.</p><p>&nbsp;</p><p>There is now an <strong>abundance</strong> of readable dummy texts. These are usually used when a text is <strong>required purely</strong> to fill a space. These alternatives to the classic Lorem Ipsum texts are often amusing and tell short, funny or <strong>nonsensical</strong> stories.</p><p>It seems that only <strong>fragments</strong> of the original text remain in the Lorem Ipsum texts used today. One may speculate that over the course of time certain letters were added or deleted at various positions within the text.</p><p>&nbsp;</p><h3><strong>Restrictions :</strong></h3><p>You are specifically restricted from all of the following :</p><ul><li>Digital Marketing Solutions for Tomorrow</li><li>Our Talented &amp; Experienced Marketing Agency</li><li>Create your own skin to match your brand</li><li>Digital Marketing Solutions for Tomorrow</li><li>Our Talented &amp; Experienced Marketing Agency</li><li>Create your own skin to match your brand</li></ul><p><br>&nbsp;</p>"}', '2023-10-13 04:25:37', '2023-10-13 04:25:37'),
	(5, 'Home', 'home', 1, '{"sections": [{"image": "/landing/images/dashboard-helpdesk.png", "title": "Make your working process easier with <span>HelpDesk</span>", "buttons": [{"link": "/login", "text": "Login HelpDesk", "new_tab": "0"}, {"link": "/ticket/open", "text": "Submit ticket", "new_tab": "0"}], "details": "It\'s much easier now to create, assign, manage and resolve tickets with HelpDesk. You just need to host this web application on any hosting server of your choice and use it.", "enable_ticket_section": ""}, {"title": "HelpDesk Process", "details": "An example process about how HelpDesk work like.\\n\\n", "tagline": "Process", "features": [{"icon": "ticket", "title": "Submit A ticket", "details": "You can submit ticket from this home page or dashboard after login. If you don\'t have login access you can create account from this <a href=\'/ticket/open\'>link."}, {"icon": "chat", "title": "Instant talk with agent", "details": "You can discuss with agent directly through `let\'s talk` button, if your ticket is being delay to get respond."}, {"icon": "email", "title": "Track progress with email", "details": "You will get email progress when change ticket status or you can comment and discuss with agent for a particular ticket discussion."}, {"icon": "tick", "title": "Done and Close the ticket", "details": "After making done a ticket agent will close the ticket though status, you may get notify when close."}]}, {"enable_ticket_section": "1", "login_require_create_ticket": "0"}]}', '2023-10-13 04:25:37', '2023-10-13 04:25:37'),
	(6, 'Footer Area', 'footer', 1, '{"text": "Start working with HelpDesk that can provide everything you need to generate awareness, drive traffic, connect.", "title": "Footer Area", "copyright": "@ Helpdesk Developed by <a href=\'https://w3bd.com/\'>W3bd</a>."}', '2023-10-13 04:25:37', '2023-10-13 04:25:37');

-- Dumping structure for table helpdesk.jobs
CREATE TABLE IF NOT EXISTS `jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `queue` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint unsigned NOT NULL,
  `reserved_at` int unsigned DEFAULT NULL,
  `available_at` int unsigned NOT NULL,
  `created_at` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `jobs_queue_index` (`queue`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table helpdesk.jobs: ~0 rows (approximately)

-- Dumping structure for table helpdesk.knowledge_base
CREATE TABLE IF NOT EXISTS `knowledge_base` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `details` text COLLATE utf8mb4_unicode_ci,
  `type_id` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table helpdesk.knowledge_base: ~0 rows (approximately)

-- Dumping structure for table helpdesk.languages
CREATE TABLE IF NOT EXISTS `languages` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(5) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table helpdesk.languages: ~11 rows (approximately)
INSERT INTO `languages` (`id`, `code`, `name`) VALUES
	(1, 'en', 'English'),
	(2, 'de', 'German'),
	(3, 'cn', 'Chinese'),
	(4, 'bd', 'Bengali'),
	(5, 'nl', 'Dutch'),
	(6, 'it', 'Italian'),
	(7, 'sa', 'Arabic'),
	(8, 'es', 'Spanish'),
	(9, 'se', 'Swedish'),
	(10, 'pt', 'Portuguese'),
	(11, 'he', 'Hebrew');

-- Dumping structure for table helpdesk.messages
CREATE TABLE IF NOT EXISTS `messages` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `guid` int DEFAULT NULL,
  `conversation_id` int NOT NULL,
  `user_id` int DEFAULT NULL,
  `contact_id` int DEFAULT NULL,
  `is_read` int NOT NULL DEFAULT '0',
  `message` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `messages_guid_index` (`guid`),
  KEY `messages_conversation_id_index` (`conversation_id`),
  KEY `messages_user_id_index` (`user_id`),
  KEY `messages_contact_id_index` (`contact_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table helpdesk.messages: ~0 rows (approximately)

-- Dumping structure for table helpdesk.migrations
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table helpdesk.migrations: ~0 rows (approximately)
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
	(1, '2019_12_14_000001_create_personal_access_tokens_table', 1),
	(2, '2020_01_01_000001_create_password_resets_table', 1),
	(3, '2020_01_01_000002_create_failed_jobs_table', 1),
	(4, '2020_01_01_000004_create_users_table', 1),
	(5, '2020_01_01_000005_create_organizations_table', 1),
	(6, '2020_01_01_000006_create_contacts_table', 1),
	(7, '2021_12_22_110814_create_conversations_table', 1),
	(8, '2021_12_22_111519_create_messages_table', 1),
	(9, '2021_12_22_122111_create_participants_table', 1),
	(10, '2022_05_19_114313_create_tickets_table', 1),
	(11, '2022_05_19_120229_create_status_table', 1),
	(12, '2022_05_19_120353_create_priorities_table', 1),
	(13, '2022_05_19_120638_create_departments_table', 1),
	(14, '2022_05_19_120749_create_types_table', 1),
	(15, '2022_05_25_040954_create_attachments_table', 1),
	(16, '2022_05_31_134932_create_countries_table', 1),
	(17, '2022_06_01_051540_create_comments_table', 1),
	(18, '2022_06_04_152841_create_reviews_table', 1),
	(19, '2022_06_10_173021_create_cities_table', 1),
	(20, '2022_06_13_042934_create_pending_emails', 1),
	(21, '2022_06_15_122734_create_pending_users_table', 1),
	(22, '2022_09_17_063053_create_email_templates_table', 1),
	(23, '2022_09_17_185116_create_knowledge_base_table', 1),
	(24, '2022_09_18_035652_create_settings_table', 1),
	(25, '2022_09_18_052747_create_languages_table', 1),
	(26, '2022_09_20_140009_create_posts_table', 1),
	(27, '2022_09_28_072406_create_front_pages_table', 1),
	(28, '2022_09_29_054634_create_faqs_table', 1),
	(29, '2022_09_29_062233_create_categories_table', 1),
	(30, '2022_10_05_042046_create_notes_table', 1),
	(31, '2022_10_08_030455_create_jobs_table', 1),
	(32, '2022_11_13_052221_create_roles_table', 1),
	(33, '2022_11_20_155214_create_backup_table', 1);

-- Dumping structure for table helpdesk.notes
CREATE TABLE IF NOT EXISTS `notes` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int DEFAULT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `details` text COLLATE utf8mb4_unicode_ci,
  `color` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `notes_user_id_index` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table helpdesk.notes: ~0 rows (approximately)

-- Dumping structure for table helpdesk.organizations
CREATE TABLE IF NOT EXISTS `organizations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `region` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(2) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `postal_code` varchar(25) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table helpdesk.organizations: ~0 rows (approximately)

-- Dumping structure for table helpdesk.participants
CREATE TABLE IF NOT EXISTS `participants` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `conversation_id` int NOT NULL,
  `user_id` int DEFAULT NULL,
  `contact_id` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `participants_conversation_id_index` (`conversation_id`),
  KEY `participants_user_id_index` (`user_id`),
  KEY `participants_contact_id_index` (`contact_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table helpdesk.participants: ~0 rows (approximately)

-- Dumping structure for table helpdesk.password_resets
CREATE TABLE IF NOT EXISTS `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table helpdesk.password_resets: ~0 rows (approximately)

-- Dumping structure for table helpdesk.pending_emails
CREATE TABLE IF NOT EXISTS `pending_emails` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int DEFAULT NULL,
  `ticket_id` int DEFAULT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `value` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `pending_emails_user_id_index` (`user_id`),
  KEY `pending_emails_ticket_id_index` (`ticket_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table helpdesk.pending_emails: ~0 rows (approximately)

-- Dumping structure for table helpdesk.pending_users
CREATE TABLE IF NOT EXISTS `pending_users` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int DEFAULT NULL,
  `ticket_id` int DEFAULT NULL,
  `first_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(25) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `role` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `pending_users_email_unique` (`email`),
  KEY `pending_users_user_id_index` (`user_id`),
  KEY `pending_users_ticket_id_index` (`ticket_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table helpdesk.pending_users: ~0 rows (approximately)

-- Dumping structure for table helpdesk.personal_access_tokens
CREATE TABLE IF NOT EXISTS `personal_access_tokens` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table helpdesk.personal_access_tokens: ~0 rows (approximately)

-- Dumping structure for table helpdesk.posts
CREATE TABLE IF NOT EXISTS `posts` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `author_id` int DEFAULT NULL,
  `is_active` int NOT NULL DEFAULT '1',
  `image` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type_id` int DEFAULT NULL,
  `details` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `posts_author_id_index` (`author_id`),
  KEY `posts_type_id_index` (`type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table helpdesk.posts: ~0 rows (approximately)

-- Dumping structure for table helpdesk.priorities
CREATE TABLE IF NOT EXISTS `priorities` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table helpdesk.priorities: ~4 rows (approximately)
INSERT INTO `priorities` (`id`, `name`, `deleted_at`) VALUES
	(1, 'Urgent', NULL),
	(2, 'Generally', NULL),
	(3, 'Very Urgent', NULL),
	(4, 'Less Urgent', NULL);

-- Dumping structure for table helpdesk.reviews
CREATE TABLE IF NOT EXISTS `reviews` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `ticket_id` int NOT NULL,
  `user_id` int NOT NULL,
  `rating` int DEFAULT NULL,
  `review` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `reviews_ticket_id_index` (`ticket_id`),
  KEY `reviews_user_id_index` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table helpdesk.reviews: ~0 rows (approximately)

-- Dumping structure for table helpdesk.roles
CREATE TABLE IF NOT EXISTS `roles` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `access` json DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table helpdesk.roles: ~5 rows (approximately)
INSERT INTO `roles` (`id`, `name`, `slug`, `access`, `created_at`, `updated_at`) VALUES
	(1, 'Admin', 'admin', '{"faq": {"read": true, "create": true, "delete": true, "update": true}, "blog": {"read": true, "create": true, "delete": true, "update": true}, "chat": {"read": true, "create": true, "delete": true, "update": true}, "smtp": {"read": true, "create": true, "delete": true, "update": true}, "type": {"read": true, "create": true, "delete": true, "update": true}, "user": {"read": true, "create": true, "delete": true, "update": true}, "global": {"read": true, "create": true, "delete": true, "update": true}, "pusher": {"read": true, "create": true, "delete": true, "update": true}, "status": {"read": true, "create": true, "delete": true, "update": true}, "ticket": {"read": true, "create": true, "delete": true, "update": true}, "contact": {"read": true, "create": true, "delete": true, "update": true}, "category": {"read": true, "create": true, "delete": true, "update": true}, "customer": {"read": true, "create": true, "delete": true, "update": true}, "language": {"read": true, "create": true, "delete": true, "update": true}, "priority": {"read": true, "create": true, "delete": true, "update": true}, "department": {"read": true, "create": true, "delete": true, "update": true}, "front_page": {"read": true, "create": true, "delete": true, "update": true}, "organization": {"read": true, "create": true, "delete": true, "update": true}, "email_template": {"read": true, "create": true, "delete": true, "update": true}, "knowledge_base": {"read": true, "create": true, "delete": true, "update": true}}', NULL, NULL),
	(2, 'Customer', 'customer', '{"faq": {"read": false, "create": false, "delete": false, "update": false}, "blog": {"read": false, "create": false, "delete": false, "update": false}, "chat": {"read": false, "create": false, "delete": false, "update": false}, "smtp": {"read": false, "create": false, "delete": false, "update": false}, "type": {"read": false, "create": false, "delete": false, "update": false}, "user": {"read": false, "create": false, "delete": false, "update": false}, "global": {"read": false, "create": false, "delete": false, "update": false}, "pusher": {"read": false, "create": false, "delete": false, "update": false}, "status": {"read": false, "create": false, "delete": false, "update": false}, "ticket": {"read": true, "create": true, "delete": false, "update": false}, "contact": {"read": false, "create": false, "delete": false, "update": false}, "category": {"read": false, "create": false, "delete": false, "update": false}, "customer": {"read": false, "create": false, "delete": false, "update": false}, "language": {"read": false, "create": false, "delete": false, "update": false}, "priority": {"read": false, "create": false, "delete": false, "update": false}, "department": {"read": false, "create": false, "delete": false, "update": false}, "front_page": {"read": false, "create": false, "delete": false, "update": false}, "organization": {"read": false, "create": false, "delete": false, "update": false}, "email_template": {"read": false, "create": false, "delete": false, "update": false}, "knowledge_base": {"read": false, "create": false, "delete": false, "update": false}}', NULL, NULL),
	(3, 'Agency', 'agency', '{"faq": {"read": true, "create": true, "delete": true, "update": true}, "blog": {"read": true, "create": true, "delete": true, "update": true}, "chat": {"read": true, "create": true, "delete": true, "update": true}, "smtp": {"read": false, "create": false, "delete": false, "update": false}, "type": {"read": false, "create": false, "delete": false, "update": false}, "user": {"read": false, "create": false, "delete": false, "update": false}, "global": {"read": false, "create": false, "delete": false, "update": false}, "pusher": {"read": false, "create": false, "delete": false, "update": false}, "status": {"read": false, "create": false, "delete": false, "update": false}, "ticket": {"read": true, "create": true, "delete": false, "update": true}, "contact": {"read": true, "create": true, "delete": true, "update": true}, "category": {"read": false, "create": false, "delete": false, "update": false}, "customer": {"read": true, "create": true, "delete": false, "update": true}, "language": {"read": false, "create": false, "delete": false, "update": false}, "priority": {"read": false, "create": false, "delete": false, "update": false}, "department": {"read": false, "create": false, "delete": false, "update": false}, "front_page": {"read": false, "create": false, "delete": false, "update": false}, "organization": {"read": true, "create": true, "delete": true, "update": true}, "email_template": {"read": false, "create": false, "delete": false, "update": false}, "knowledge_base": {"read": false, "create": false, "delete": false, "update": false}}', NULL, NULL),
	(4, 'Manager', 'manager', '{"faq": {"read": true, "create": true, "delete": true, "update": true}, "blog": {"read": true, "create": true, "delete": true, "update": true}, "chat": {"read": true, "create": true, "delete": true, "update": true}, "smtp": {"read": false, "create": false, "delete": false, "update": false}, "type": {"read": false, "create": false, "delete": false, "update": false}, "user": {"read": false, "create": false, "delete": false, "update": false}, "global": {"read": false, "create": false, "delete": false, "update": false}, "pusher": {"read": false, "create": false, "delete": false, "update": false}, "status": {"read": false, "create": false, "delete": false, "update": false}, "ticket": {"read": true, "create": true, "delete": false, "update": true}, "contact": {"read": true, "create": true, "delete": true, "update": true}, "category": {"read": false, "create": false, "delete": false, "update": false}, "customer": {"read": true, "create": true, "delete": false, "update": true}, "language": {"read": false, "create": false, "delete": false, "update": false}, "priority": {"read": false, "create": false, "delete": false, "update": false}, "department": {"read": false, "create": false, "delete": false, "update": false}, "front_page": {"read": false, "create": false, "delete": false, "update": false}, "organization": {"read": true, "create": true, "delete": true, "update": true}, "email_template": {"read": false, "create": false, "delete": false, "update": false}, "knowledge_base": {"read": false, "create": false, "delete": false, "update": false}}', NULL, NULL),
	(5, 'General', 'general', '{"faq": {"read": false, "create": false, "delete": false, "update": false}, "blog": {"read": false, "create": false, "delete": false, "update": false}, "chat": {"read": false, "create": false, "delete": false, "update": false}, "smtp": {"read": false, "create": false, "delete": false, "update": false}, "type": {"read": false, "create": false, "delete": false, "update": false}, "user": {"read": false, "create": false, "delete": false, "update": false}, "global": {"read": false, "create": false, "delete": false, "update": false}, "pusher": {"read": false, "create": false, "delete": false, "update": false}, "status": {"read": false, "create": false, "delete": false, "update": false}, "ticket": {"read": true, "create": true, "delete": true, "update": true}, "contact": {"read": false, "create": false, "delete": false, "update": false}, "category": {"read": false, "create": false, "delete": false, "update": false}, "customer": {"read": false, "create": false, "delete": false, "update": false}, "language": {"read": false, "create": false, "delete": false, "update": false}, "priority": {"read": false, "create": false, "delete": false, "update": false}, "department": {"read": false, "create": false, "delete": false, "update": false}, "front_page": {"read": false, "create": false, "delete": false, "update": false}, "organization": {"read": false, "create": false, "delete": false, "update": false}, "email_template": {"read": false, "create": false, "delete": false, "update": false}, "knowledge_base": {"read": false, "create": false, "delete": false, "update": false}}', NULL, NULL);

-- Dumping structure for table helpdesk.settings
CREATE TABLE IF NOT EXISTS `settings` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `value` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table helpdesk.settings: ~8 rows (approximately)
INSERT INTO `settings` (`id`, `name`, `slug`, `type`, `value`) VALUES
	(1, 'App Name', 'app_name', 'text', 'Help Desk'),
	(2, 'Default Language', 'default_language', 'text', 'en'),
	(3, 'Main_logo', 'main_logo', 'text', '/images/logo.png'),
	(4, 'Main_favicon', 'main_favicon', 'text', '/favicon.png'),
	(5, 'Hide_ticket_fields', 'hide_ticket_fields', 'json', '[]'),
	(6, 'Footer Text', 'footer_text', 'text', 'Help Desk © 2022 - Powered by W3BD'),
	(7, 'Enable Options', 'enable_options', 'json', '[{"name":"Chat","slug":"chat","value":true},{"name":"FAQ","slug":"faq","value":true},{"name":"Knowledge Base","slug":"kb","value":true},{"name":"Blog","slug":"blog","value":true},{"name":"Contacts","slug":"contact","value":true},{"name":"Organizations","slug":"organization","value":true},{"name":"Notes","slug":"note","value":true},{"name":"Show Login on front page","slug":"show_login","value":true},{"name":"Email to tickets(piping)","slug":"enable_piping","value":true}]'),
	(8, 'Email Notifications', 'email_notifications', 'json', '[{"name":"Create ticket by new customer","slug":"create_ticket_new_customer","value":false},{"name":"Create ticket from dashboard","slug":"create_ticket_dashboard","value":false},{"name":"Notification for the first comment","slug":"first_comment","value":false},{"name":"User got assigned for a task","slug":"assigned_ticket","value":false},{"name":"Status or priority changes","slug":"status_priority","value":false},{"name":"Create a new user","slug":"user_created","value":false}]');

-- Dumping structure for table helpdesk.status
CREATE TABLE IF NOT EXISTS `status` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table helpdesk.status: ~6 rows (approximately)
INSERT INTO `status` (`id`, `name`, `slug`, `deleted_at`) VALUES
	(1, 'Waiting for confirmation', 'waiting_for_confirmation', NULL),
	(2, 'Delay processing', 'delay_processing', NULL),
	(3, 'Pending', 'pending', NULL),
	(4, 'Closed', 'closed', NULL),
	(5, 'Completed', 'completed', NULL),
	(6, 'Processing', 'processing', NULL);

-- Dumping structure for table helpdesk.tickets
CREATE TABLE IF NOT EXISTS `tickets` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `uid` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subject` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status_id` int DEFAULT NULL,
  `open` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `due` timestamp NULL DEFAULT NULL,
  `close` timestamp NULL DEFAULT NULL,
  `response` timestamp NULL DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  `contact_id` int DEFAULT NULL,
  `client_type` int DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `location` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `priority_id` int DEFAULT NULL,
  `department_id` int DEFAULT NULL,
  `category_id` int DEFAULT NULL,
  `assigned_to` int DEFAULT NULL,
  `type_id` int DEFAULT NULL,
  `details` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `review_id` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `tickets_uid_index` (`uid`),
  KEY `tickets_subject_index` (`subject`),
  KEY `tickets_status_id_index` (`status_id`),
  KEY `tickets_user_id_index` (`user_id`),
  KEY `tickets_contact_id_index` (`contact_id`),
  KEY `tickets_created_by_index` (`created_by`),
  KEY `tickets_priority_id_index` (`priority_id`),
  KEY `tickets_department_id_index` (`department_id`),
  KEY `tickets_category_id_index` (`category_id`),
  KEY `tickets_assigned_to_index` (`assigned_to`),
  KEY `tickets_type_id_index` (`type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table helpdesk.tickets: ~0 rows (approximately)

-- Dumping structure for table helpdesk.types
CREATE TABLE IF NOT EXISTS `types` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table helpdesk.types: ~5 rows (approximately)
INSERT INTO `types` (`id`, `name`, `deleted_at`) VALUES
	(1, 'Service', NULL),
	(2, 'Hardware', NULL),
	(3, 'Software', NULL),
	(4, 'Event', NULL),
	(5, 'New type', NULL);

-- Dumping structure for table helpdesk.users
CREATE TABLE IF NOT EXISTS `users` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `role_id` int DEFAULT NULL,
  `title` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT 'Engineer',
  `locale` varchar(5) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'en',
  `country_id` int DEFAULT NULL,
  `address` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `first_name` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `photo_path` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`),
  KEY `users_role_id_index` (`role_id`),
  KEY `users_country_id_index` (`country_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table helpdesk.users: ~1 rows (approximately)
INSERT INTO `users` (`id`, `role_id`, `title`, `locale`, `country_id`, `address`, `city`, `first_name`, `last_name`, `email`, `phone`, `email_verified_at`, `password`, `photo_path`, `remember_token`, `created_at`, `updated_at`, `deleted_at`) VALUES
	(1, 1, 'Engineer', 'en', NULL, NULL, NULL, 'admin', 'helpdesk', 'admin@helpdesk.com', NULL, NULL, '$2y$10$ydCq3Hpk82qAlRkLj.vzaOTW8pHnNe7kQYpkUTtzIspvspOnYgFE6', NULL, NULL, '2023-10-13 04:26:01', '2023-10-13 04:26:01', NULL);

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
