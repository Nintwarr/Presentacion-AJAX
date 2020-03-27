-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Host: mysql:3306
-- Generation Time: Mar 27, 2020 at 07:35 PM
-- Server version: 8.0.19
-- PHP Version: 7.4.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `chat_prueba`
--
CREATE DATABASE IF NOT EXISTS `chat_prueba` DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci;
USE `chat_prueba`;

-- --------------------------------------------------------

--
-- Table structure for table `Mensajes`
--

CREATE TABLE `Mensajes` (
  `ID_Mensaje` int UNSIGNED NOT NULL,
  `ID_Usuario` int UNSIGNED NOT NULL,
  `Texto` text COLLATE utf8_unicode_ci NOT NULL,
  `Marca_temporal` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `Mensajes`
--

INSERT INTO `Mensajes` (`ID_Mensaje`, `ID_Usuario`, `Texto`, `Marca_temporal`) VALUES
(1, 1, 'Buenas tardes mozuelos', '2020-03-26 11:42:28'),
(2, 2, 'Qué onda?', '2020-03-26 11:42:28'),
(3, 1, 'Hola, soy viejito', '2020-03-26 16:14:11'),
(16, 1, 'Sigo viejo', '2020-03-27 10:08:11'),
(17, 1, 'No me he muerto', '2020-03-27 10:12:56'),
(18, 1, 'Que sigo vivo, eh?', '2020-03-27 10:13:17'),
(19, 2, 'Esperemos que siga as&iacute;', '2020-03-27 10:16:10'),
(20, 1, 'Hla', '2020-03-27 14:29:11'),
(21, 18, 'Os gustan mis galletas', '2020-03-27 14:29:36'),
(22, 18, 'Eh?', '2020-03-27 14:29:40'),
(23, 18, 'Tambi&eacute;n tenemos galletitas', '2020-03-27 14:35:55'),
(24, 1, 'Estoy de vuelta', '2020-03-27 14:56:05'),
(25, 2, 'Es bueno saberlo', '2020-03-27 14:58:30'),
(26, 2, 'Vosotros est&aacute;is bien?', '2020-03-27 14:59:56'),
(27, 2, 'Si, perfectamente', '2020-03-27 15:00:07'),
(28, 19, 'En un lugar de la Mancha, de cuyo nombre no quiero acordarme, no ha mucho tiempo que viv&iacute;a un hidalgo de los de lanza en astillero, adarga antigua, roc&iacute;n flaco y galgo corredor. Una olla de algo m&aacute;s vaca que carnero, salpic&oacute;n las m&aacute;s noches, duelos y quebrantos los s&aacute;bados, lantejas los viernes, alg&uacute;n palomino de a&ntilde;adidura los domingos, consum&iacute;an las tres partes de su hacienda. El resto della conclu&iacute;an sayo de velarte, calzas de velludo para las fiestas, con sus pantuflos de lo mesmo, y los d&iacute;as de entresemana se honraba con su vellor&iacute; de lo m&aacute;s fino. Ten&iacute;a en su casa una ama que pasaba de los cuarenta, y una sobrina que no llegaba a los veinte, y un mozo de campo y plaza, que as&iacute; ensillaba el roc&iacute;n como tomaba la podadera. Frisaba la edad de nuestro hidalgo con los cincuenta a&ntilde;os; era de complexi&oacute;n recia, seco de carnes, enjuto de rostro, gran madrugador y amigo de la caza. Quieren decir que ten&iacute;a el sobrenombre de Quijada, o Quesada, que en esto hay alguna diferencia en los autores que deste caso escriben; aunque por conjeturas veros&iacute;miles se deja entender que se llamaba Quijana. Pero esto importa poco a nuestro cuento: basta que en la narraci&oacute;n d&eacute;l no se salga un punto de la verdad.', '2020-03-27 15:17:49'),
(29, 2, 'sadfasdf', '2020-03-27 15:27:56'),
(30, 1, 'Buenas tardes', '2020-03-27 17:21:00'),
(31, 2, 'Hola a todos', '2020-03-27 17:22:02'),
(32, 2, 'Me voy yendo', '2020-03-27 17:35:55');

-- --------------------------------------------------------

--
-- Table structure for table `Usuarios`
--

CREATE TABLE `Usuarios` (
  `ID_Usuario` int UNSIGNED NOT NULL,
  `Nick` varchar(128) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `Usuarios`
--

INSERT INTO `Usuarios` (`ID_Usuario`, `Nick`) VALUES
(1, 'AbueloEnmascarado'),
(19, 'Don Miguel De Cervantes'),
(18, 'GalletasPrincipe'),
(17, 'Horacio'),
(2, 'LaTeleka'),
(3, 'Teleko');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `Mensajes`
--
ALTER TABLE `Mensajes`
  ADD PRIMARY KEY (`ID_Mensaje`),
  ADD KEY `ID_Usuario` (`ID_Usuario`);

--
-- Indexes for table `Usuarios`
--
ALTER TABLE `Usuarios`
  ADD PRIMARY KEY (`ID_Usuario`),
  ADD UNIQUE KEY `Nick_unique` (`Nick`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `Mensajes`
--
ALTER TABLE `Mensajes`
  MODIFY `ID_Mensaje` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `Usuarios`
--
ALTER TABLE `Usuarios`
  MODIFY `ID_Usuario` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `Mensajes`
--
ALTER TABLE `Mensajes`
  ADD CONSTRAINT `Mensajes_ibfk_1` FOREIGN KEY (`ID_Usuario`) REFERENCES `Usuarios` (`ID_Usuario`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
