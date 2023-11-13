-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 13-11-2023 a las 17:33:01
-- Versión del servidor: 10.4.28-MariaDB
-- Versión de PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `compras`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes`
--

CREATE TABLE `clientes` (
  `dni` varchar(20) NOT NULL,
  `nombre` varchar(20) NOT NULL,
  `apellido` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `clientes`
--

INSERT INTO `clientes` (`dni`, `nombre`, `apellido`) VALUES
('187294322', 'Emilio', 'Rangel'),
('45329573', 'Junior', 'Pinto'),
('465734784', 'Marby', 'Sanchez'),
('547264893', 'Maria', 'Apolito'),
('547847592', 'Nairobi', 'Rivas'),
('563143893', 'Dayana', 'Torres'),
('645243695', 'Naisil', 'Pinto'),
('6454859375', 'Alejandra', 'Garcia'),
('645738345', 'Yilber', 'Padilla'),
('961037475', 'Susana', 'Sanchez');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `compras`
--

CREATE TABLE `compras` (
  `id_compras` int(20) NOT NULL,
  `concepto` varchar(20) NOT NULL,
  `clientes_dni` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `compras`
--

INSERT INTO `compras` (`id_compras`, `concepto`, `clientes_dni`) VALUES
(1, 'consumidor', '45329573'),
(2, 'consumidor', '961037475'),
(3, 'mayorista', '187294322'),
(4, 'consumidor', '547264893'),
(5, 'mayorista', '563143893'),
(6, 'mayorista', '465734784'),
(7, 'mayorista', '6454859375'),
(8, 'consumidor', '547847592'),
(9, 'mayorista', '645243695'),
(10, 'consumidor', '645738345');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `lineascompra`
--

CREATE TABLE `lineascompra` (
  `numero` int(20) NOT NULL,
  `compras_id` int(20) NOT NULL,
  `producto` varchar(20) NOT NULL,
  `importe` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `lineascompra`
--

INSERT INTO `lineascompra` (`numero`, `compras_id`, `producto`, `importe`) VALUES
(1, 1, 'Azucar', 1100),
(3, 2, 'Pan', 800),
(4, 3, 'Cafe', 5000),
(5, 4, 'Galletas', 1000),
(6, 5, 'Jugo', 1500),
(7, 6, 'Coca', 2500),
(8, 7, 'Sal', 600),
(9, 8, 'Huevos', 2800),
(10, 9, 'Ketchup', 800),
(11, 10, 'Mostaza', 800);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`dni`);

--
-- Indices de la tabla `compras`
--
ALTER TABLE `compras`
  ADD PRIMARY KEY (`id_compras`),
  ADD KEY `clientes_dni` (`clientes_dni`);

--
-- Indices de la tabla `lineascompra`
--
ALTER TABLE `lineascompra`
  ADD PRIMARY KEY (`numero`),
  ADD KEY `compras_id` (`compras_id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `compras`
--
ALTER TABLE `compras`
  MODIFY `id_compras` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `lineascompra`
--
ALTER TABLE `lineascompra`
  MODIFY `numero` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `compras`
--
ALTER TABLE `compras`
  ADD CONSTRAINT `compras_ibfk_1` FOREIGN KEY (`clientes_dni`) REFERENCES `clientes` (`dni`),
  ADD CONSTRAINT `compras_ibfk_2` FOREIGN KEY (`id_compras`) REFERENCES `lineascompra` (`compras_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
