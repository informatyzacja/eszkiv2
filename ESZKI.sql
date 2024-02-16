-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: db
-- Generation Time: Feb 16, 2024 at 03:59 PM
-- Wersja serwera: 8.3.0
-- Wersja PHP: 8.2.15

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ESZKI`
--

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `Contacts`
--

CREATE TABLE `Contacts` (
  `ContactId` int NOT NULL,
  `UserId` int NOT NULL,
  `UserName` varchar(50) COLLATE utf8mb4_polish_ci NOT NULL,
  `UserSurName` varchar(50) COLLATE utf8mb4_polish_ci NOT NULL,
  `telefon` int NOT NULL,
  `UserIndex` int NOT NULL,
  `JoinDate` date DEFAULT NULL,
  `PwrStartYear` year DEFAULT NULL,
  `GithubName` varchar(50) COLLATE utf8mb4_polish_ci DEFAULT NULL,
  `UserDepartment` varchar(3) COLLATE utf8mb4_polish_ci DEFAULT NULL,
  `UserFieldOfStudy` varchar(3) COLLATE utf8mb4_polish_ci DEFAULT NULL,
  `IsPrivate` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_polish_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `Jobs`
--

CREATE TABLE `Jobs` (
  `JobId` int NOT NULL,
  `JobName` varchar(50) COLLATE utf8mb4_polish_ci NOT NULL,
  `JobDescription` varchar(200) COLLATE utf8mb4_polish_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_polish_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `Projects`
--

CREATE TABLE `Projects` (
  `ProjectId` int NOT NULL,
  `ProjectName` varchar(50) COLLATE utf8mb4_polish_ci NOT NULL,
  `ProjectDescription` varchar(200) COLLATE utf8mb4_polish_ci DEFAULT NULL,
  `IsActive` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_polish_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `ProjectTechnologies`
--

CREATE TABLE `ProjectTechnologies` (
  `ProjectId` int NOT NULL,
  `TechnologyId` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_polish_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `ProjectUsers`
--

CREATE TABLE `ProjectUsers` (
  `ProjectId` int NOT NULL,
  `UserId` int NOT NULL,
  `JobId` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_polish_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `Roles`
--

CREATE TABLE `Roles` (
  `RoleId` int NOT NULL,
  `RoleTitle` varchar(50) COLLATE utf8mb4_polish_ci NOT NULL,
  `Description` varchar(200) COLLATE utf8mb4_polish_ci DEFAULT NULL,
  `CreatedBy` varchar(50) COLLATE utf8mb4_polish_ci DEFAULT NULL,
  `CreatedDate` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_polish_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `Technologies`
--

CREATE TABLE `Technologies` (
  `TechnologyId` int NOT NULL,
  `TechnologyName` varchar(50) COLLATE utf8mb4_polish_ci NOT NULL,
  `TechnologyDescription` varchar(200) COLLATE utf8mb4_polish_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_polish_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `Users`
--

CREATE TABLE `Users` (
  `UserId` int NOT NULL,
  `RoleId` int NOT NULL,
  `ContactId` int NOT NULL,
  `UserName` varchar(50) COLLATE utf8mb4_polish_ci NOT NULL,
  `Password` varchar(50) COLLATE utf8mb4_polish_ci NOT NULL,
  `IsActive` tinyint(1) DEFAULT NULL,
  `Description` varchar(200) COLLATE utf8mb4_polish_ci DEFAULT NULL,
  `CreatedBy` varchar(50) COLLATE utf8mb4_polish_ci DEFAULT NULL,
  `CreatedDate` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_polish_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `UserTechnologies`
--

CREATE TABLE `UserTechnologies` (
  `UserId` int NOT NULL,
  `TechnologyId` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_polish_ci;

--
-- Indeksy dla zrzutów tabel
--

--
-- Indeksy dla tabeli `Contacts`
--
ALTER TABLE `Contacts`
  ADD PRIMARY KEY (`ContactId`),
  ADD UNIQUE KEY `UserId` (`UserId`);

--
-- Indeksy dla tabeli `Jobs`
--
ALTER TABLE `Jobs`
  ADD PRIMARY KEY (`JobId`);

--
-- Indeksy dla tabeli `Projects`
--
ALTER TABLE `Projects`
  ADD PRIMARY KEY (`ProjectId`);

--
-- Indeksy dla tabeli `ProjectTechnologies`
--
ALTER TABLE `ProjectTechnologies`
  ADD KEY `ProjectId` (`ProjectId`,`TechnologyId`),
  ADD KEY `TechnologyId` (`TechnologyId`);

--
-- Indeksy dla tabeli `ProjectUsers`
--
ALTER TABLE `ProjectUsers`
  ADD KEY `ProjectId` (`ProjectId`,`UserId`),
  ADD KEY `UserId` (`UserId`),
  ADD KEY `JobId` (`JobId`);

--
-- Indeksy dla tabeli `Roles`
--
ALTER TABLE `Roles`
  ADD PRIMARY KEY (`RoleId`);

--
-- Indeksy dla tabeli `Technologies`
--
ALTER TABLE `Technologies`
  ADD PRIMARY KEY (`TechnologyId`);

--
-- Indeksy dla tabeli `Users`
--
ALTER TABLE `Users`
  ADD PRIMARY KEY (`UserId`),
  ADD UNIQUE KEY `RoleId` (`RoleId`),
  ADD KEY `ContactId` (`ContactId`);

--
-- Indeksy dla tabeli `UserTechnologies`
--
ALTER TABLE `UserTechnologies`
  ADD KEY `UserId` (`UserId`,`TechnologyId`),
  ADD KEY `TechnologyId` (`TechnologyId`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `Contacts`
--
ALTER TABLE `Contacts`
  MODIFY `ContactId` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `Jobs`
--
ALTER TABLE `Jobs`
  MODIFY `JobId` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `Projects`
--
ALTER TABLE `Projects`
  MODIFY `ProjectId` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `Roles`
--
ALTER TABLE `Roles`
  MODIFY `RoleId` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `Technologies`
--
ALTER TABLE `Technologies`
  MODIFY `TechnologyId` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `Users`
--
ALTER TABLE `Users`
  MODIFY `UserId` int NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `ProjectTechnologies`
--
ALTER TABLE `ProjectTechnologies`
  ADD CONSTRAINT `ProjectTechnologies_ibfk_1` FOREIGN KEY (`ProjectId`) REFERENCES `Projects` (`ProjectId`),
  ADD CONSTRAINT `ProjectTechnologies_ibfk_2` FOREIGN KEY (`TechnologyId`) REFERENCES `Technologies` (`TechnologyId`);

--
-- Constraints for table `ProjectUsers`
--
ALTER TABLE `ProjectUsers`
  ADD CONSTRAINT `ProjectUsers_ibfk_1` FOREIGN KEY (`UserId`) REFERENCES `Users` (`UserId`),
  ADD CONSTRAINT `ProjectUsers_ibfk_2` FOREIGN KEY (`ProjectId`) REFERENCES `Projects` (`ProjectId`),
  ADD CONSTRAINT `ProjectUsers_ibfk_3` FOREIGN KEY (`JobId`) REFERENCES `Jobs` (`JobId`);

--
-- Constraints for table `Users`
--
ALTER TABLE `Users`
  ADD CONSTRAINT `Users_ibfk_1` FOREIGN KEY (`RoleId`) REFERENCES `Roles` (`RoleId`),
  ADD CONSTRAINT `Users_ibfk_2` FOREIGN KEY (`ContactId`) REFERENCES `Contacts` (`ContactId`);

--
-- Constraints for table `UserTechnologies`
--
ALTER TABLE `UserTechnologies`
  ADD CONSTRAINT `UserTechnologies_ibfk_1` FOREIGN KEY (`TechnologyId`) REFERENCES `Technologies` (`TechnologyId`),
  ADD CONSTRAINT `UserTechnologies_ibfk_2` FOREIGN KEY (`UserId`) REFERENCES `Users` (`UserId`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
