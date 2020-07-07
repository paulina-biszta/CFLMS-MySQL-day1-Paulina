-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Czas generowania: 07 Lip 2020, 11:17
-- Wersja serwera: 10.4.13-MariaDB
-- Wersja PHP: 7.4.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Baza danych: `books`
--

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `authors`
--

CREATE TABLE `authors` (
  `author_id` int(11) NOT NULL,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `birth_date` date DEFAULT NULL,
  `phone` varchar(50) DEFAULT NULL,
  `address` varchar(50) NOT NULL,
  `city` varchar(50) NOT NULL,
  `state` char(2) NOT NULL,
  `likes` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Zrzut danych tabeli `authors`
--

INSERT INTO `authors` (`author_id`, `first_name`, `last_name`, `birth_date`, `phone`, `address`, `city`, `state`, `likes`) VALUES
(1, 'Babara', 'schuh', '1986-03-28', '781-932-9754', '0 Sage Terrace', 'Waltham', 'MA', 2273),
(2, 'Ines', 'mayer', '1986-04-13', '804-427-9456', '14187 Commercial Trail', 'Hampton', 'VA', 947),
(3, 'fredi', 'hirten', '1985-02-07', '719-724-7869', '251 Springs Junction', 'Colorado Springs', 'CO', 2967),
(4, 'elise', 'mineral', '1974-04-14', '407-231-8017', '30 Arapahoe Terrace', 'Orlando', 'FL', 457),
(5, 'furzi', 'becher', '1973-11-07', NULL, '5 Spohn Circle', 'Arlington', 'TX', 3675),
(6, 'Elka', 'gurke', '1991-09-04', '312-480-8498', '7 Manley Drive', 'Chicago', 'IL', 3073),
(7, 'Ilene', 'manfgo', '1964-08-30', '615-641-4759', '50 Lillian Crossing', 'Nashville', 'TN', 1672),
(8, 'felix', 'lol', '1993-07-17', '941-527-3977', '538 Mosinee Center', 'Sarasota', 'FL', 205),
(9, 'waschbeton', 'yesplis', '1992-05-23', '559-181-3744', '3520 Ohio Trail', 'Visalia', 'CA', 1486),
(10, 'kürbiskopf', 'pepe', '1969-10-13', '404-246-3370', '68 Lawn Avenue', 'Atlanta', 'GA', 796);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `books`
--

CREATE TABLE `books` (
  `book_id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `quantity_in_stock` int(11) NOT NULL,
  `unit_price` decimal(4,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Zrzut danych tabeli `books`
--

INSERT INTO `books` (`book_id`, `name`, `quantity_in_stock`, `unit_price`) VALUES
(1, 'Hedi die alte Dame', 70, '1.21'),
(2, 'Schwester Maria und die Gurke', 49, '4.65'),
(3, 'König nicht Löwenherz', 38, '3.35'),
(4, 'Spanisch für Anfänger, Si Si', 90, '4.53'),
(5, 'Rusisch für Fortgeschrittene, Vodka Vodka', 94, '1.63'),
(6, 'Web dev werden für dummies', 14, '2.39'),
(7, 'kochen mit alex', 98, '3.29'),
(8, 'die verschollene gurke', 26, '0.74'),
(9, 'die aufgegessene banane', 67, '2.26'),
(10, 'bruder felix', 6, '1.09');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `rent`
--

CREATE TABLE `rent` (
  `rent_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `book_id` int(11) NOT NULL,
  `order_date` date NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `comments` varchar(2000) DEFAULT NULL,
  `rent_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Zrzut danych tabeli `rent`
--

INSERT INTO `rent` (`rent_id`, `customer_id`, `book_id`, `order_date`, `status`, `comments`, `rent_date`) VALUES
(1, 6, 1, '2019-01-30', 1, NULL, NULL),
(2, 7, 2, '2018-08-02', 2, NULL, '2018-08-03'),
(3, 8, 3, '2017-12-01', 1, NULL, NULL),
(4, 2, 4, '2017-01-22', 1, NULL, NULL),
(5, 5, 5, '2017-08-25', 2, '', '2017-08-26'),
(6, 10, 6, '2018-11-18', 1, 'I have one comment', NULL),
(7, 2, 7, '2018-09-22', 2, NULL, '2018-09-23'),
(8, 5, 8, '2018-06-08', 1, 'awesome book', NULL),
(9, 10, 9, '2017-07-05', 2, 'missing pages', '2017-07-06'),
(10, 6, 10, '2018-04-22', 2, NULL, '2018-04-23');

--
-- Indeksy dla zrzutów tabel
--

--
-- Indeksy dla tabeli `authors`
--
ALTER TABLE `authors`
  ADD PRIMARY KEY (`author_id`);

--
-- Indeksy dla tabeli `books`
--
ALTER TABLE `books`
  ADD PRIMARY KEY (`book_id`);

--
-- Indeksy dla tabeli `rent`
--
ALTER TABLE `rent`
  ADD PRIMARY KEY (`rent_id`),
  ADD KEY `fk_rent_book_idx` (`book_id`),
  ADD KEY `fk_rent_customers_idx` (`customer_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT dla tabeli `authors`
--
ALTER TABLE `authors`
  MODIFY `author_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT dla tabeli `books`
--
ALTER TABLE `books`
  MODIFY `book_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT dla tabeli `rent`
--
ALTER TABLE `rent`
  MODIFY `rent_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Ograniczenia dla zrzutów tabel
--

--
-- Ograniczenia dla tabeli `rent`
--
ALTER TABLE `rent`
  ADD CONSTRAINT `fk_rent_book` FOREIGN KEY (`book_id`) REFERENCES `books` (`book_id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_rent_customers` FOREIGN KEY (`customer_id`) REFERENCES `authors` (`author_id`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
