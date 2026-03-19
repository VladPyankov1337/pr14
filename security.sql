-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Мар 19 2026 г., 23:15
-- Версия сервера: 5.7.39-log
-- Версия PHP: 8.1.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `security`
--

-- --------------------------------------------------------

--
-- Структура таблицы `comments`
--

CREATE TABLE `comments` (
  `Id` int(11) NOT NULL COMMENT 'Код',
  `IdUser` int(11) NOT NULL COMMENT 'Код пользователя',
  `IdPost` int(11) NOT NULL COMMENT 'Код поста',
  `Messages` varchar(1000) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Сообщение'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `comments`
--

INSERT INTO `comments` (`Id`, `IdUser`, `IdPost`, `Messages`) VALUES
(8, 10, 1, '124'),
(9, 10, 1, '124124'),
(10, 10, 1, '124'),
(11, 10, 1, '124124'),
(12, 10, 1, '124'),
(13, 10, 1, '124'),
(14, 10, 1, '124'),
(15, 10, 1, '124'),
(16, 10, 1, '124124'),
(17, 10, 1, '124'),
(18, 10, 1, '124'),
(19, 10, 1, '124'),
(20, 10, 1, '124'),
(21, 10, 1, '124'),
(22, 10, 2, '124'),
(23, 10, 2, '124'),
(24, 10, 1, '123');

-- --------------------------------------------------------

--
-- Структура таблицы `comment_attempts_ip`
--

CREATE TABLE `comment_attempts_ip` (
  `ip` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_request_time` int(11) NOT NULL,
  `request_count` int(11) DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `comment_attempts_ip`
--

INSERT INTO `comment_attempts_ip` (`ip`, `last_request_time`, `request_count`) VALUES
('127.0.0.1', 1773951218, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `login_attempts_ip`
--

CREATE TABLE `login_attempts_ip` (
  `ip` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_request_time` int(11) NOT NULL,
  `request_count` int(11) DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `login_attempts_ip`
--

INSERT INTO `login_attempts_ip` (`ip`, `last_request_time`, `request_count`) VALUES
('127.0.0.1', 1773950602, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `news`
--

CREATE TABLE `news` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `text` varchar(1000) NOT NULL,
  `img` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `news`
--

INSERT INTO `news` (`id`, `title`, `text`, `img`) VALUES
(1, 'Внимание! Режим работы на 11 и 12 сентября 2020 г.', '11.09.2020 г. (пятница) занятия проводятся по расписанию звонков «пара-час». 12.09.2020 г. (суббота) занятия проводятся в дистанционном формате (в техникум приходить не нужно).', './img/img831.jpg\r\n'),
(2, 'Продолжается прием на заочное обучение', 'Пермский авиационный техникум продолжает прием документов на заочное обучение по специальностям «Производство авиационных двигателей», «Технология машиностроения», «Управление качеством продукции, процессов и услуг (по отраслям)» и «Прикладная информатика (по отраслям)».\r\n\r\nДокументы принимаются до 15 сентября 2020 г. включительно с 15:00 до 17:00. При себе иметь оригиналы и копии паспорта, документа об образовании, ИНН, СНИЛС и фотографии. Справки по телефону (342) 212-14-92.', './img/img830.jpg\r\n'),
(3, 'Расписание звонков', 'Расписание звонков в разных корпусах (Корпус А (1-2 и 3 этаж), Корпус В, Корпус С)\r\n<a href=\"./documents/Расписание звонков.docx\">Скачать</a>', './img/img831.jpg'),
(4, 'Основные принципы построения безопасных сайтов. Понятие безопасности приложений и классификация опасностей', 'Основные принципы построения безопасных сайтов. Понятие безопасности приложений и классификация опасностей\r\n<a href=\"./documents/1.docx\">Скачать</a>', './img/docx.png'),
(5, 'Источники угроз информационной безопасности и меры по их предотвращению', 'Источники угроз информационной безопасности и меры по их предотвращению\r\n<a href=\"./documents/2.doc\">Скачать</a>', './img/docx.png'),
(6, 'Регламенты и методы разработки безопасных веб-приложений', 'Регламенты и методы разработки безопасных веб-приложений\r\n<a href=\"./documents/3.pdf\">Скачать</a>', './img/docx.png');

-- --------------------------------------------------------

--
-- Структура таблицы `reg_attempts_ip`
--

CREATE TABLE `reg_attempts_ip` (
  `ip` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_request_time` int(11) NOT NULL,
  `request_count` int(11) DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `reg_attempts_ip`
--

INSERT INTO `reg_attempts_ip` (`ip`, `last_request_time`, `request_count`) VALUES
('127.0.0.1', 1773950598, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `login` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `roll` int(11) NOT NULL,
  `failed_attempts` int(11) DEFAULT '0',
  `locked_until` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `users`
--

INSERT INTO `users` (`id`, `login`, `password`, `roll`, `failed_attempts`, `locked_until`) VALUES
(1, 'admin', 'Asdfg123', 1, 0, NULL),
(8, 'user', 'Asdfg123', 0, 0, NULL),
(9, '213', '123', 0, 0, NULL),
(10, '123', '123', 0, 0, NULL),
(11, '1233', '123', 0, 0, NULL),
(12, '1234', '123', 0, 0, NULL),
(13, '12345', '123', 0, 0, NULL),
(14, '21345', '123', 0, 0, NULL),
(15, '123123', '123', 0, 0, NULL);

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`Id`);

--
-- Индексы таблицы `comment_attempts_ip`
--
ALTER TABLE `comment_attempts_ip`
  ADD PRIMARY KEY (`ip`);

--
-- Индексы таблицы `login_attempts_ip`
--
ALTER TABLE `login_attempts_ip`
  ADD PRIMARY KEY (`ip`);

--
-- Индексы таблицы `news`
--
ALTER TABLE `news`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `reg_attempts_ip`
--
ALTER TABLE `reg_attempts_ip`
  ADD PRIMARY KEY (`ip`);

--
-- Индексы таблицы `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `comments`
--
ALTER TABLE `comments`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Код', AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT для таблицы `news`
--
ALTER TABLE `news`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT для таблицы `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
