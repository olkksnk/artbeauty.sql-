-- База данных: `ArtBeauty`

-- --------------------------------------------------------

-- Структура таблицы `categories`

CREATE TABLE `categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `categories` (`id`, `name`) VALUES
(1, 'Hair'),
(2, 'Nails'),
(3, 'Face'),
(4, 'Body'),
(5, 'Makeup');

-- --------------------------------------------------------

-- Структура таблицы `trainers` (Мастера)

CREATE TABLE `trainers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `specialty` varchar(100) NOT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `trainers` (`id`, `first_name`, `last_name`, `specialty`, `phone`, `email`) VALUES
(1, 'Anna', 'Koval', 'Haircuts, Styling, Hair Care', '+380671234501', 'a.koval@artbeauty.ua'),
(2, 'Ihor', 'Melnyk', 'Manicure, Pedicure, Nail Art', '+380671234502', 'i.melnyk@artbeauty.ua'),
(3, 'Svitlana', 'Vasylenko', 'Cosmetology, Facials', '+380671234503', 's.vasylenko@artbeauty.ua'),
(4, 'Dmytro', 'Romanenko', 'Massages, Body Wraps', '+380671234504', 'd.romanenko@artbeauty.ua'),
(5, 'Olena', 'Bondar', 'Evening Makeup, Daily Makeup', '+380671234505', 'o.bondar@artbeauty.ua');

-- --------------------------------------------------------

-- Структура таблицы `services` (Услуги)

CREATE TABLE `services` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `category_id` int(11) NOT NULL,
  `trainer_id` int(11) NOT NULL,
  `duration_min` int(11) NOT NULL,
  `price` decimal(8,2) NOT NULL,
  `schedule` varchar(100) DEFAULT NULL,
  `format` enum('group','personal') NOT NULL DEFAULT 'personal',
  PRIMARY KEY (`id`),
  KEY `category_id` (`category_id`),
  KEY `trainer_id` (`trainer_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `services` (`id`, `name`, `category_id`, `trainer_id`, `duration_min`, `price`, `schedule`, `format`) VALUES
(1, 'Haircut & Styling', 1, 1, 60, '500.00', 'Mon, Wed, Fri - 10:00', 'personal'),
(2, 'Hair Dyeing', 1, 1, 120, '1500.00', 'Tue, Thu - 09:00', 'personal'),
(3, 'Manicure with Gel Polish', 2, 2, 90, '450.00', 'Mon-Fri - 08:00', 'personal'),
(4, 'Eyebrow Shaping & Tinting', 5, 5, 45, '350.00', 'Tue, Thu, Sat - 11:00', 'personal'),
(5, 'Classic Facial Cleansing', 3, 3, 90, '800.00', 'Mon, Wed, Fri - 14:00', 'personal'),
(6, 'Relaxing Full Body Massage', 4, 4, 60, '700.00', 'Sat, Sun - 11:00', 'personal'),
(7, 'Bridal Makeup', 5, 5, 120, '1200.00', 'By appointment', 'personal'),
(8, 'Keratin Hair Straightening', 1, 1, 180, '2200.00', 'By appointment', 'personal');

-- --------------------------------------------------------

-- Структура таблицы `clients` (Клиенты)

CREATE TABLE `clients` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `registered_at` date NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `phone` (`phone`),
  UNIQUE KEY `email` (`email`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `clients` (`id`, `first_name`, `last_name`, `phone`, `email`, `registered_at`) VALUES
(1, 'Ivan', 'Petrenko', '+380501111001', 'i.petrenko@gmail.com', '2024-01-15'),
(2, 'Anna', 'Shevchenko', '+380501111002', 'a.shevchenko@gmail.com', '2024-02-03'),
(3, 'Maksym', 'Ivanov', '+380501111003', 'm.ivanov@gmail.com', '2024-03-20'),
(4, 'Viktoriia', 'Kravchenko', '+380501111004', 'v.kravchenko@gmail.com', '2024-04-07'),
(5, 'Oleksandr', 'Boiko', '+380501111005', 'o.boyko@gmail.com', '2024-05-11'),
(6, 'Yuliia', 'Moroz', '+380501111006', 'yu.moroz@gmail.com', '2024-06-18'),
(7, 'Artem', 'Lysenko', '+380501111007', 'a.lysenko@gmail.com', '2024-07-02'),
(8, 'Daria', 'Melnyk', '+380501111008', 'd.melnyk@gmail.com', '2024-08-25');

-- --------------------------------------------------------

-- Структура таблицы `memberships` (Абонементы / Сертификаты)

CREATE TABLE `memberships` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `duration_days` int(11) NOT NULL,
  `price` decimal(8,2) NOT NULL,
  `description` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `memberships` (`id`, `name`, `duration_days`, `price`, `description`) VALUES
(1, 'Gift Certificate 500', 90, '500.00', 'Certificate for any services'),
(2, 'Gift Certificate 1000', 90, '1000.00', 'Certificate for any services'),
(3, 'Deposit Card 3000', 180, '3000.00', 'Personal balance for beauty procedures'),
(4, 'VIP Annual Card', 365, '10000.00', '15% discount on all services for a year');

-- --------------------------------------------------------

-- Структура таблицы `client_memberships`

CREATE TABLE `client_memberships` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `client_id` int(11) NOT NULL,
  `membership_id` int(11) NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  PRIMARY KEY (`id`),
  KEY `client_id` (`client_id`),
  KEY `membership_id` (`membership_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `client_memberships` (`id`, `client_id`, `membership_id`, `start_date`, `end_date`) VALUES
(1, 1, 2, '2025-04-01', '2025-06-30'),
(2, 2, 3, '2025-03-01', '2025-09-01'),
(3, 3, 1, '2025-04-15', '2025-07-15'),
(4, 4, 4, '2025-01-01', '2025-12-31'),
(5, 5, 2, '2025-05-10', '2025-08-10'),
(6, 6, 1, '2025-05-01', '2025-08-01'),
(7, 7, 3, '2025-04-01', '2025-10-01'),
(8, 8, 4, '2025-05-05', '2026-05-05');

-- --------------------------------------------------------

-- Структура таблицы `payments` (Оплаты)

CREATE TABLE `payments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `client_id` int(11) NOT NULL,
  `amount` decimal(8,2) NOT NULL,
  `paid_at` datetime NOT NULL,
  `type` enum('membership','service') NOT NULL,
  `note` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `client_id` (`client_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `payments` (`id`, `client_id`, `amount`, `paid_at`, `type`, `note`) VALUES
(1, 1, '1000.00', '2025-04-01 09:00:00', 'membership', 'Certificate 1000'),
(2, 2, '3000.00', '2025-03-01 10:00:00', 'membership', 'Deposit Card 3000'),
(3, 3, '500.00', '2025-04-15 11:00:00', 'membership', 'Certificate 500'),
(4, 4, '10000.00', '2025-01-01 09:00:00', 'membership', 'VIP Annual Card'),
(5, 5, '1000.00', '2025-05-10 08:30:00', 'membership', 'Certificate 1000'),
(6, 6, '500.00', '2025-05-01 10:00:00', 'membership', 'Certificate 500'),
(7, 7, '3000.00', '2025-04-01 09:00:00', 'membership', 'Deposit Card 3000'),
(8, 8, '10000.00', '2025-05-05 10:00:00', 'membership', 'VIP Annual Card'),
(9, 2, '500.00', '2025-05-08 10:00:00', 'service', 'Haircut & Styling'),
(10, 7, '450.00', '2025-05-09 09:00:00', 'service', 'Manicure with Gel Polish');

-- --------------------------------------------------------

-- Структура таблицы `bookings` (Записи на процедуры)

CREATE TABLE `bookings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `client_id` int(11) NOT NULL,
  `service_id` int(11) NOT NULL,
  `booked_at` datetime NOT NULL,
  `status` enum('pending','confirmed','cancelled') NOT NULL DEFAULT 'confirmed',
  PRIMARY KEY (`id`),
  KEY `client_id` (`client_id`),
  KEY `service_id` (`service_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `bookings` (`id`, `client_id`, `service_id`, `booked_at`, `status`) VALUES
(1, 1, 1, '2025-05-05 10:00:00', 'confirmed'),
(2, 1, 3, '2025-05-07 11:00:00', 'confirmed'),
(3, 2, 5, '2025-05-06 19:00:00', 'confirmed'),
(4, 2, 8, '2025-05-08 10:00:00', 'confirmed'),
(5, 3, 2, '2025-05-05 08:00:00', 'confirmed'),
(6, 4, 6, '2025-05-10 11:00:00', 'confirmed'),
(7, 4, 5, '2025-05-13 19:00:00', 'pending'),
(8, 5, 4, '2025-05-10 09:00:00', 'confirmed'),
(9, 6, 1, '2025-05-12 10:00:00', 'confirmed'),
(10, 7, 7, '2025-05-09 09:00:00', 'confirmed'),
(11, 8, 3, '2025-05-07 11:00:00', 'cancelled'),
(12, 8, 1, '2025-05-12 10:00:00', 'confirmed');
