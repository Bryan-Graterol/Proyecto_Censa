-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1:3306
-- Tiempo de generación: 07-03-2023 a las 18:01:45
-- Versión del servidor: 8.0.31
-- Versión de PHP: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `alquiler_carro`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `carros_alquilados`
--

DROP TABLE IF EXISTS `carros_alquilados`;
CREATE TABLE IF NOT EXISTS `carros_alquilados` (
  `id_carro` int NOT NULL AUTO_INCREMENT,
  `modelo` varchar(300) NOT NULL,
  `dias` int NOT NULL,
  `n_usuario` text NOT NULL,
  PRIMARY KEY (`id_carro`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedido`
--

DROP TABLE IF EXISTS `pedido`;
CREATE TABLE IF NOT EXISTS `pedido` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_user` int DEFAULT NULL,
  `id_carro` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_id_user` (`id_user`),
  KEY `fk_id_carro` (`id_carro`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

DROP TABLE IF EXISTS `usuario`;
CREATE TABLE IF NOT EXISTS `usuario` (
  `nombre` text NOT NULL,
  `apellido` text NOT NULL,
  `ti` text NOT NULL,
  `gmail` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `id` int NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`nombre`, `apellido`, `ti`, `gmail`, `password`, `id`) VALUES
('bryan', 'graterol', '0', '123', '$2y$10$Uuny6vF4dNGllf4uD80MVu0scWcyo0Bgup55gKkPAQLrFFeZDBqOS', 1),
('ddd', 'd', '0', '12', '$2y$10$ATiXwbjnhahQbv/yail5pONe1VF5dRGodpANM8hUaOXzEwrBuBip6', 2),
('asd', 'asd', '0', '123', '$2y$10$2zimSfIoGTkSquwC/1CgROBmh6pf4jqE200rgsFjTzAKpqs3xxwFO', 3);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
