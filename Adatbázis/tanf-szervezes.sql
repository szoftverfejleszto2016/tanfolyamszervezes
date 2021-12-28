-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Gép: 127.0.0.1
-- Létrehozás ideje: 2021. Dec 28. 10:13
-- Kiszolgáló verziója: 10.4.6-MariaDB
-- PHP verzió: 7.3.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Adatbázis: `tanf-szervezes`
--

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `csoportok`
--

CREATE TABLE `csoportok` (
  `csid` int(11) NOT NULL,
  `kid` int(11) NOT NULL,
  `indulas` date NOT NULL,
  `beosztas` varchar(60) COLLATE utf8mb4_hungarian_ci NOT NULL,
  `helyszin` varchar(30) COLLATE utf8mb4_hungarian_ci NOT NULL,
  `ar` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_hungarian_ci;

--
-- A tábla adatainak kiíratása `csoportok`
--

INSERT INTO `csoportok` (`csid`, `kid`, `indulas`, `beosztas`, `helyszin`, `ar`) VALUES
(1, 1, '2021-09-08', 'szerda-péntek 17-20 óráig', 'tanterem', 390000),
(2, 1, '2021-09-11', 'szombatonként 10-16 óráig', 'online', 290000),
(3, 2, '2022-09-07', 'szerda-péntek 17-20 óráig', 'tanterem', 390000),
(4, 2, '2022-09-10', 'szombatonként 10-16 óráig', 'online', 290000),
(5, 3, '2022-09-10', 'szombatonként 10-16 óráig', 'online', 490000);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `jelentkezok`
--

CREATE TABLE `jelentkezok` (
  `jid` int(11) NOT NULL,
  `csid` int(11) NOT NULL,
  `jnev` varchar(60) COLLATE utf8mb4_hungarian_ci NOT NULL,
  `szulnev` varchar(60) COLLATE utf8mb4_hungarian_ci DEFAULT NULL,
  `szulido` date NOT NULL,
  `szulhely` varchar(60) COLLATE utf8mb4_hungarian_ci NOT NULL,
  `anyjaneve` varchar(60) COLLATE utf8mb4_hungarian_ci NOT NULL,
  `cim` varchar(80) COLLATE utf8mb4_hungarian_ci NOT NULL,
  `telefon` varchar(15) COLLATE utf8mb4_hungarian_ci NOT NULL,
  `email` varchar(50) COLLATE utf8mb4_hungarian_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_hungarian_ci;

--
-- A tábla adatainak kiíratása `jelentkezok`
--

INSERT INTO `jelentkezok` (`jid`, `csid`, `jnev`, `szulnev`, `szulido`, `szulhely`, `anyjaneve`, `cim`, `telefon`, `email`) VALUES
(1, 1, 'Kiss Gizella', 'Kiss Gizella', '2000-06-02', 'Budapest', 'Németh Gizella', '1011 Budapest, Vár u. 11.', '+36702996724', 'kissg@freemail.hu'),
(2, 1, 'Nagy Béla', 'Nagy Béla', '1991-01-12', 'Budapest', 'Kovács Lujza', '1022 Budapest, Hegy u. 22.', '+36302986724', 'nagyb@freemail.hu'),
(3, 2, 'Kovács Lajos', 'Kovács Lajos', '1986-07-30', 'Miskolc', 'Fekete Erzsébet', '1033 Budapest, Flórián tér 13.', '+36202976724', 'kovacslajos@gmail.hu'),
(4, 2, 'Szabó Géza', 'Szabó Géza', '2001-03-12', 'Budapest', 'Piros Piroska', '1044 Budapest, Váci út 201.', '+36301996724', 'gezasz@gmail.hu'),
(5, 2, 'Fekete Mihály', 'Fekete Mihály', '1993-11-23', 'Budapest', 'Kék Klára', '1055 Budapest, Deák tér 55. 1/3', '+36201996723', 'fekete@freemail.hu'),
(6, 3, 'Kovácsné Fehér Ágnes', 'Fehér Ágnes', '1978-01-30', 'Eger', 'Barna Éva', '1066 Budapest, Király u. 36. 5/16', '+3670196724', 'kfeheragi@freemail.hu'),
(7, 3, 'Magyar Márton', 'Magyar Márton', '2000-09-01', 'Budapest', 'Kiss Virág', '1077 Budapest, Nyugati u. 77.', '+36302996724', 'magyarm@gmail.hu'),
(8, 3, 'Németh István', 'Németh István', '1998-04-01', 'Budapest', 'Bazsa Rózsa', '1088 Budapest, Rákóczi tér 8.', '+36302996724', 'nemeth.istvan@gmail.hu'),
(9, 3, 'Orosz Gabriella', 'Orosz Gabriella', '2000-06-02', 'Budapest', 'Tóth Ibolya', '1099 Budapest, Ecseri út 99.', '+36202996724', 'oroszg@gmail.hu'),
(10, 3, 'Széles Gáborné', 'Keskeny Klára', '1982-06-12', 'Budapest', 'Nagy Katalin', '1101 Budapest, Kozma u. 100.', '+36202996724', 'szeles@gmail.hu'),
(11, 3, 'Kocka József', 'Kocka József', '1992-10-13', 'Szeged', 'Szabó Sarolta', '1111 Budapest, Irinyi J. u. 11.', '+36702997724', 'kocka2@gmail.hu'),
(12, 3, 'Fazekas Attila', 'Fazekas Attila', '2001-12-02', 'Budapest', 'Tóth Zoé', '1121 Budapest, Virág u. 12.', '+36702996720', 'fazekas@freemail.hu'),
(13, 3, 'Asztalos Szilvia', 'Asztalos Szilvia', '2000-05-01', 'Győr', 'Fazekas Anna', '1133 Budapest, Angyal . 13.', '+36302996714', 'asztalos@freemail.hu'),
(14, 4, 'Tóth Krisztina', 'Tóth Krisztina', '1991-11-07', 'Budapest', 'Papp Ildikó', '1144 Budapest, Róna u. 144.', '+36702996725', 'kriszti1991@gmail.hu'),
(15, 4, 'Nagy János', 'Nagy János', '1989-06-20', 'Budapest', 'Horváth Orsolya', '2119 Pécel, Thököly u. 15.', '+36302996711', 'nagyjanos@gmail.hu'),
(16, 4, 'Soós Sándor', 'Soós Sándor', '2000-07-29', 'Budapest', 'Román Róbert', '1162 Budapest, Sas u. 116.', '+36302996713', 'sooss@freemail.hu'),
(17, 4, 'Kis Zsolt', 'Kis Zsolt', '1994-02-10', 'Debrecen', 'Kósa Renáta', '1173 Budapest, Borsó u. 17. 1/7', '+36202995724', 'kiszsolt@gmail.hu'),
(18, 4, 'Simon Lajos', 'Simon Lajos', '1965-04-18', 'Budapest', 'Homoki Andrea', '1183 Budapest, Nefelejcs u. 18.', '+36202994724', 'simonlajos@gmail.hu'),
(21, 4, 'Kovács Zsolt', 'Kovács Zsolt', '1969-02-05', 'Budapest', 'Kiss Borbála', '1191 Budapest, Kossuth tér 19.', '+36501234567', 'kozso@hotmail.com');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `kepzesek`
--

CREATE TABLE `kepzesek` (
  `kid` int(11) NOT NULL,
  `knev` varchar(60) COLLATE utf8mb4_hungarian_ci NOT NULL,
  `oraszam` int(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_hungarian_ci;

--
-- A tábla adatainak kiíratása `kepzesek`
--

INSERT INTO `kepzesek` (`kid`, `knev`, `oraszam`) VALUES
(1, 'Junior frontend fejlesztő', 400),
(2, 'Junior Java backend fejlesztő', 400),
(3, 'Junior fullstack fejlesztő', 800);

--
-- Indexek a kiírt táblákhoz
--

--
-- A tábla indexei `csoportok`
--
ALTER TABLE `csoportok`
  ADD PRIMARY KEY (`csid`),
  ADD KEY `kid` (`kid`);

--
-- A tábla indexei `jelentkezok`
--
ALTER TABLE `jelentkezok`
  ADD PRIMARY KEY (`jid`),
  ADD KEY `csid` (`csid`);

--
-- A tábla indexei `kepzesek`
--
ALTER TABLE `kepzesek`
  ADD PRIMARY KEY (`kid`);

--
-- A kiírt táblák AUTO_INCREMENT értéke
--

--
-- AUTO_INCREMENT a táblához `csoportok`
--
ALTER TABLE `csoportok`
  MODIFY `csid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT a táblához `jelentkezok`
--
ALTER TABLE `jelentkezok`
  MODIFY `jid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;

--
-- AUTO_INCREMENT a táblához `kepzesek`
--
ALTER TABLE `kepzesek`
  MODIFY `kid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Megkötések a kiírt táblákhoz
--

--
-- Megkötések a táblához `csoportok`
--
ALTER TABLE `csoportok`
  ADD CONSTRAINT `csoportok_ibfk_1` FOREIGN KEY (`kid`) REFERENCES `kepzesek` (`kid`);

--
-- Megkötések a táblához `jelentkezok`
--
ALTER TABLE `jelentkezok`
  ADD CONSTRAINT `jelentkezok_ibfk_1` FOREIGN KEY (`csid`) REFERENCES `csoportok` (`csid`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
