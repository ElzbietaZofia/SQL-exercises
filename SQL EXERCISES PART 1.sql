--
-- SQL EXERCISES - PART 1

-- 1. CREATING DATABASE AND TABLES
-- 2. SIMPLE AND COMPLEX QUERIES

-----------------------------------------------------------



--
-- Creating database: `ksiegarnia`
--

CREATE DATABASE IF NOT EXISTS `ksiegarnia` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `ksiegarnia`;

-- --------------------------------------------------------

--
-- Creating table: `klienci`
--

CREATE TABLE IF NOT EXISTS `klienci` (
  `idklienta` int(11) NOT NULL AUTO_INCREMENT,
  `imie` text COLLATE utf8_polish_ci NOT NULL,
  `nazwisko` text COLLATE utf8_polish_ci NOT NULL,
  `miejscowosc` text COLLATE utf8_polish_ci NOT NULL,
  PRIMARY KEY (`idklienta`),
  KEY `id` (`idklienta`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci AUTO_INCREMENT=11 ;

--
-- Inserting data into: `klienci`
--

INSERT INTO `klienci` (`idklienta`, `imie`, `nazwisko`, `miejscowosc`) VALUES
(1, 'Łukasz', 'Lewandowski', 'Poznań'),
(2, 'Jan', 'Nowak', 'Katowice'),
(3, 'Maciej', 'Wójcik', 'Bydgoszcz'),
(4, 'Agnieszka', 'Jankowska', 'Lublin'),
(5, 'Tomasz', 'Mazur', 'Jelenia Góra'),
(6, 'Michał', 'Zieliński', 'Kraków'),
(7, 'Artur', 'Rutkowski', 'Kielce'),
(8, 'Mateusz', 'Skorupa', 'Gdańsk'),
(9, 'Jerzy', 'Rutkowski', 'Rybnik'),
(10, 'Anna', 'Karenina', 'Pułtusk');

-- --------------------------------------------------------

--
-- Creating table: `ksiazki`
--

CREATE TABLE IF NOT EXISTS `ksiazki` (
  `idksiazki` int(11) NOT NULL AUTO_INCREMENT,
  `imieautora` text COLLATE utf8_polish_ci NOT NULL,
  `nazwiskoautora` text COLLATE utf8_polish_ci NOT NULL,
  `tytul` text COLLATE utf8_polish_ci NOT NULL,
  `cena` float NOT NULL,
  PRIMARY KEY (`idksiazki`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci AUTO_INCREMENT=6 ;

--
-- Inserting data into: `ksiazki`
--

INSERT INTO `ksiazki` (`idksiazki`, `imieautora`, `nazwiskoautora`, `tytul`, `cena`) VALUES
(1, 'Jan', 'Michalak', 'Zaawansowane programowanie w PHP', 47.29),
(2, 'Andrzej', 'Krawczyk', 'Windows 8 PL. Zaawansowana administracja systemem', 49.99),
(3, 'Paweł', 'Jakubowski', 'HTML5. Tworzenie witryn', 53.65),
(4, 'Tomasz', 'Kowalski', 'Urządzenia techniki komputerowej', 34.15),
(5, 'Łukasz', 'Pasternak', 'PHP. Tworzenie nowoczesnych stron WWW', 29.99);



--
-- Creating table: `zamowienia`
--

CREATE TABLE IF NOT EXISTS `zamowienia` (
  `idzamowienia` int(11) NOT NULL AUTO_INCREMENT,
  `idklienta` int(11) NOT NULL,
  `idksiazki` int(11) NOT NULL,
  `data` date NOT NULL,
  `status` text COLLATE utf8_polish_ci NOT NULL,
  PRIMARY KEY (`idzamowienia`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci AUTO_INCREMENT=11 ;

--
-- Inserting data into: `zamowienia`
--

INSERT INTO `zamowienia` (`idzamowienia`, `idklienta`, `idksiazki`, `data`, `status`) VALUES
(1, 2, 4, '2014-10-08', 'oczekiwanie'),
(2, 7, 1, '2014-09-05', 'wyslano'),
(3, 9, 1, '2014-10-11', 'wyslano'),
(4, 2, 2, '2014-10-15', 'oczekiwanie'),
(5, 2, 5, '2014-08-12', 'oczekiwanie'),
(6, 3, 2, '2014-10-20', 'wyslano'),
(7, 4, 3, '2014-08-14', 'wyslano'),
(8, 8, 1, '2014-08-19', 'wyslano'),
(9, 3, 5, '2014-11-19', 'wyslano'),
(10, 9, 2, '2014-12-28', 'oczekiwanie');




--
-- EXCERCISES (QUERIES)
--


--1. Books arranged alphabetically by title

SELECT * FROM ksiazki ORDER BY tytul ASC




--2. The most expensive book in the database

SELECT * FROM ksiazki ORDER BY CENA DESC LIMIT 1




--3. All orders already shipped

SELECT * FROM zamowienia WHERE status="wyslano"




--4. All clients with the surname Rutkowski

SELECT * FROM klienci WHERE nazwisko="Rutkowski"




-- 5. Books with "PHP" in the title

SELECT * FROM ksiazki WHERE tytul LIKE "%PHP%"




--6. Orders orderd by the date (by the newest)

SELECT * FROM zamowienia ORDER BY data DESC




--7. Select for all of the orders: name and surname of the ordering customer, idorder, order date

SELECT klienci.imie, klienci.nazwisko, zamowienia.idzamowienia, zamowienia.data 
FROM klienci, zamowienia 
WHERE klienci.idklienta=zamowienia.idklienta




--8. Select for all of the orders: name and surname of the ordering customer, idorder, order date; using aliases for tables

SELECT k.imie, k.nazwisko, z.idzamowienia, z.data 
FROM klienci AS k, zamowienia AS z 
WHERE k.idklienta=z.idklienta



--9. Names of people who ordered a book nr 2

SELECT klienci.imie, klienci.nazwisko 
FROM klienci, zamowienia 
WHERE zamowienia.idksiazki=2 AND zamowienia.idklienta = klienci.idklienta




--10. What books (title, author) did Jan Nowak order?

SELECT ksiazki.tytul, ksiazki.imieautora, ksiazki.nazwiskoautora
FROM ksiazki, zamowienia 
WHERE zamowienia.idklienta = 2 AND zamowienia.idksiazki = ksiazki.idksiazki




--11. Orders made by people named Rutkowski, sorted by the date from the latest (name and surname of the ordering person, id, date and status orders, title of ordered book)

SELECT klienci.imie, klienci.nazwisko, zamowienia.idzamowienia, zamowienia.status, zamowienia.data, ksiazki.tytul 
FROM klienci, zamowienia, ksiazki 
WHERE klienci.nazwisko = "Rutkowski" 
AND zamowienia.idksiazki = ksiazki.idksiazki AND klienci.idklienta = zamowienia.idzamowienia
ORDER BY zamowienia.data DESC