-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost
-- Tiempo de generación: 23-09-2025 a las 02:11:53
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `obrador`
--
CREATE DATABASE IF NOT EXISTS `obrador` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `obrador`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empleado`
--

CREATE TABLE `empleado` (
  `id_empleado` int(11) NOT NULL,
  `dni` bigint(20) NOT NULL,
  `apellido` varchar(58) NOT NULL,
  `nombre` varchar(58) NOT NULL,
  `acceso` int(11) NOT NULL,
  `estado` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `empleado`
--

INSERT INTO `empleado` (`id_empleado`, `dni`, `apellido`, `nombre`, `acceso`, `estado`) VALUES
(1, 40512954, 'Fet', 'Enzo', 1, 1),
(2, 41642946, 'Bossa', 'Jose', 2, 0),
(3, 41298069, 'Garcia', 'Jesus', 1, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `herramienta`
--

CREATE TABLE `herramienta` (
  `id_herramienta` int(11) NOT NULL,
  `nombre` varchar(60) NOT NULL,
  `descripcion` varchar(100) NOT NULL,
  `stock` int(11) NOT NULL,
  `estado` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `herramienta`
--

INSERT INTO `herramienta` (`id_herramienta`, `nombre`, `descripcion`, `stock`, `estado`) VALUES
(1, 'Fresadora', 'Herramienta para fresar superficies', 10, 0),
(2, 'Amoladora', 'Herramienta para cortar', 15, 1),
(3, 'Taladro', 'Taladro electrico percutor', 20, 1),
(4, 'Martillo', 'Martillo basico', 30, 1),
(5, 'Llave Inglesa', 'Llave para ajustar tuercas y pernos', 25, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `movimiento`
--

CREATE TABLE `movimiento` (
  `id_movimiento` int(11) NOT NULL,
  `id_empleado` int(11) NOT NULL,
  `id_herramienta` int(11) NOT NULL,
  `fechap` date NOT NULL,
  `fechad` date DEFAULT NULL,
  `cantidadret` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `movimiento`
--

INSERT INTO `movimiento` (`id_movimiento`, `id_empleado`, `id_herramienta`, `fechap`, `fechad`, `cantidadret`) VALUES
(2, 1, 2, '2025-09-01', '2025-09-22', 1),
(3, 2, 2, '2025-08-08', '2025-09-22', 1),
(4, 2, 3, '2025-09-05', '2025-09-22', 1),
(5, 3, 4, '2025-06-20', '2025-09-22', 1),
(6, 3, 5, '2025-09-16', '2025-09-22', 1);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `empleado`
--
ALTER TABLE `empleado`
  ADD PRIMARY KEY (`id_empleado`),
  ADD UNIQUE KEY `dni` (`dni`);

--
-- Indices de la tabla `herramienta`
--
ALTER TABLE `herramienta`
  ADD PRIMARY KEY (`id_herramienta`);

--
-- Indices de la tabla `movimiento`
--
ALTER TABLE `movimiento`
  ADD PRIMARY KEY (`id_movimiento`),
  ADD KEY `fk_herramienta_movimiento` (`id_herramienta`),
  ADD KEY `fk_empleado_movimiento` (`id_empleado`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `empleado`
--
ALTER TABLE `empleado`
  MODIFY `id_empleado` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `herramienta`
--
ALTER TABLE `herramienta`
  MODIFY `id_herramienta` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `movimiento`
--
ALTER TABLE `movimiento`
  MODIFY `id_movimiento` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `movimiento`
--
ALTER TABLE `movimiento`
  ADD CONSTRAINT `fk_empleado_movimiento` FOREIGN KEY (`id_empleado`) REFERENCES `empleado` (`id_empleado`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_herramienta_movimiento` FOREIGN KEY (`id_herramienta`) REFERENCES `herramienta` (`id_herramienta`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
