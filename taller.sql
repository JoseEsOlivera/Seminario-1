-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 28-10-2024 a las 03:49:02
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
-- Base de datos: `taller`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente`
--

CREATE TABLE `cliente` (
  `IdCliente` int(11) NOT NULL,
  `Nombre` varchar(100) NOT NULL,
  `Direccion` varchar(200) DEFAULT NULL,
  `Clave` varchar(100) NOT NULL,
  `Estado` tinyint(1) NOT NULL,
  `IdTipoUsuario` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `cliente`
--

INSERT INTO `cliente` (`IdCliente`, `Nombre`, `Direccion`, `Clave`, `Estado`, `IdTipoUsuario`) VALUES
(1, 'Juan Pérez', 'Av. Siempre Viva 123', 'clavecliente1', 1, 2),
(2, 'María Gómez', 'Calle Falsa 456', 'clavecliente2', 1, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `especialidad`
--

CREATE TABLE `especialidad` (
  `IdEspecialidad` int(11) NOT NULL,
  `Especialidad` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `especialidad`
--

INSERT INTO `especialidad` (`IdEspecialidad`, `Especialidad`) VALUES
(1, 'Mecánica General'),
(2, 'Electricidad Automotriz');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mecanico`
--

CREATE TABLE `mecanico` (
  `IdMecanico` int(11) NOT NULL,
  `Mecanico` varchar(100) NOT NULL,
  `Estado` tinyint(1) NOT NULL,
  `IdEspecialidad` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `mecanico`
--

INSERT INTO `mecanico` (`IdMecanico`, `Mecanico`, `Estado`, `IdEspecialidad`) VALUES
(1, 'Carlos López', 1, 1),
(2, 'Luis Fernández', 1, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ordenreparacion`
--

CREATE TABLE `ordenreparacion` (
  `IdOrdenReparacion` int(11) NOT NULL,
  `Detalle` varchar(500) NOT NULL,
  `IdVehiculo` int(11) DEFAULT NULL,
  `IdMecanico` int(11) DEFAULT NULL,
  `Fecha` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `ordenreparacion`
--

INSERT INTO `ordenreparacion` (`IdOrdenReparacion`, `Detalle`, `IdVehiculo`, `IdMecanico`, `Fecha`) VALUES
(1, 'Cambio de aceite y filtros', 1, 1, '2024-09-15'),
(2, 'Revisión sistema eléctrico', 2, 2, '2024-10-01');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipousuario`
--

CREATE TABLE `tipousuario` (
  `IdTipoUsuario` int(11) NOT NULL,
  `Tipo` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tipousuario`
--

INSERT INTO `tipousuario` (`IdTipoUsuario`, `Tipo`) VALUES
(1, 'Administrador'),
(2, 'Cliente'),
(3, 'Mecánico');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `idUsuario` int(11) NOT NULL,
  `Usuario` varchar(50) NOT NULL,
  `Clave` varchar(100) NOT NULL,
  `Estado` tinyint(1) NOT NULL,
  `IdTipoUsuario` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`idUsuario`, `Usuario`, `Clave`, `Estado`, `IdTipoUsuario`) VALUES
(1, 'admin', 'admin123', 1, 1),
(2, 'juanperez', 'clave123', 1, 2),
(3, 'mecanico1', 'mecanico123', 1, 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `vehiculo`
--

CREATE TABLE `vehiculo` (
  `IdVehiculo` int(11) NOT NULL,
  `Marca` varchar(100) NOT NULL,
  `Modelo` date NOT NULL,
  `Estado` tinyint(1) NOT NULL,
  `IdCliente` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `vehiculo`
--

INSERT INTO `vehiculo` (`IdVehiculo`, `Marca`, `Modelo`, `Estado`, `IdCliente`) VALUES
(1, 'Toyota', '2022-05-10', 1, 1),
(2, 'Ford', '2021-07-15', 1, 2);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`IdCliente`);

--
-- Indices de la tabla `especialidad`
--
ALTER TABLE `especialidad`
  ADD PRIMARY KEY (`IdEspecialidad`);

--
-- Indices de la tabla `mecanico`
--
ALTER TABLE `mecanico`
  ADD PRIMARY KEY (`IdMecanico`),
  ADD KEY `IdEspecialidad` (`IdEspecialidad`);

--
-- Indices de la tabla `ordenreparacion`
--
ALTER TABLE `ordenreparacion`
  ADD PRIMARY KEY (`IdOrdenReparacion`),
  ADD KEY `IdVehiculo` (`IdVehiculo`),
  ADD KEY `IdMecanico` (`IdMecanico`);

--
-- Indices de la tabla `tipousuario`
--
ALTER TABLE `tipousuario`
  ADD PRIMARY KEY (`IdTipoUsuario`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`idUsuario`),
  ADD KEY `IdTipoUsuario` (`IdTipoUsuario`);

--
-- Indices de la tabla `vehiculo`
--
ALTER TABLE `vehiculo`
  ADD PRIMARY KEY (`IdVehiculo`),
  ADD KEY `IdCliente` (`IdCliente`);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `mecanico`
--
ALTER TABLE `mecanico`
  ADD CONSTRAINT `mecanico_ibfk_1` FOREIGN KEY (`IdEspecialidad`) REFERENCES `especialidad` (`IdEspecialidad`);

--
-- Filtros para la tabla `ordenreparacion`
--
ALTER TABLE `ordenreparacion`
  ADD CONSTRAINT `ordenreparacion_ibfk_1` FOREIGN KEY (`IdVehiculo`) REFERENCES `vehiculo` (`IdVehiculo`),
  ADD CONSTRAINT `ordenreparacion_ibfk_2` FOREIGN KEY (`IdMecanico`) REFERENCES `mecanico` (`IdMecanico`);

--
-- Filtros para la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD CONSTRAINT `usuario_ibfk_1` FOREIGN KEY (`IdTipoUsuario`) REFERENCES `tipousuario` (`IdTipoUsuario`);

--
-- Filtros para la tabla `vehiculo`
--
ALTER TABLE `vehiculo`
  ADD CONSTRAINT `vehiculo_ibfk_1` FOREIGN KEY (`IdCliente`) REFERENCES `cliente` (`IdCliente`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
