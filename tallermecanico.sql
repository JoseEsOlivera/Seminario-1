-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 18-11-2024 a las 02:42:53
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
-- Base de datos: `tallermecanico`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente`
--

CREATE TABLE `cliente` (
  `idCliente` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `apellido` varchar(50) NOT NULL,
  `direccion` varchar(100) DEFAULT NULL,
  `telefono` varchar(20) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `cliente`
--

INSERT INTO `cliente` (`idCliente`, `nombre`, `apellido`, `direccion`, `telefono`, `email`) VALUES
(1, 'Gabriel', 'Viñabal', 'Av Santa Cecilia', '387-4637895', 'gabriel@correo.com'),
(2, 'María Clara', 'Gómez', 'Avenida Siempreviva 456', '987654321', 'maria.gomez@gmail.com'),
(3, 'Juan Carlos', 'Paz', 'Avenida Belgrano 456', '52485320', 'juanc.paz@gmail.com'),
(4, 'Raul', 'Lopez', 'Av San Martin 342', '381467232', 'raul.lopez@gmail.com'),
(5, 'Carlos', 'Delgado', 'Av Belgrano', '387963251', 'carlos.delgado@gmail.com');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `especialidad`
--

CREATE TABLE `especialidad` (
  `idEspecialidad` int(11) NOT NULL,
  `nombreEspecialidad` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `especialidad`
--

INSERT INTO `especialidad` (`idEspecialidad`, `nombreEspecialidad`) VALUES
(1, 'Mecánica General'),
(2, 'Electricidad Automotriz'),
(3, 'Hidraulica'),
(4, 'Frenos de Autos'),
(5, 'Tren delantero'),
(6, 'Motores Diesel');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mecanico`
--

CREATE TABLE `mecanico` (
  `idMecanico` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `apellido` varchar(50) NOT NULL,
  `telefono` varchar(20) DEFAULT NULL,
  `idEspecialidad` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `mecanico`
--

INSERT INTO `mecanico` (`idMecanico`, `nombre`, `apellido`, `telefono`, `idEspecialidad`) VALUES
(1, 'Eduardo', 'Lopez', '781236', 2),
(2, 'Ana', 'Martínez', '987654321', 2),
(3, 'Carlos', 'Martos', '43362541', 2),
(4, 'Ramon', 'Cabezas', '3874638574', 5),
(5, 'Francisco', 'Arias', '387123621', 6);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ordenreparacion`
--

CREATE TABLE `ordenreparacion` (
  `idOrden` int(11) NOT NULL,
  `idVehiculo` int(11) NOT NULL,
  `detalleReparacion` text NOT NULL,
  `fecha` date NOT NULL,
  `costoEstimado` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `ordenreparacion`
--

INSERT INTO `ordenreparacion` (`idOrden`, `idVehiculo`, `detalleReparacion`, `fecha`, `costoEstimado`) VALUES
(1, 3, 'Cambio de aceite y filtro', '2023-11-10', 1500.00),
(2, 1, 'Revisión del sistema eléctrico', '2023-11-15', 2800.00),
(3, 3, 'Cambio de correo de distribucion', '2023-11-10', 3000.00),
(4, 4, 'Problema en el tren delantero, hace ruido', '2024-11-14', 4500.00),
(5, 5, 'El motor pierde aceite', '2024-11-16', 5000.00);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipousuario`
--

CREATE TABLE `tipousuario` (
  `idTipoUsuario` int(11) NOT NULL,
  `tipo` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tipousuario`
--

INSERT INTO `tipousuario` (`idTipoUsuario`, `tipo`) VALUES
(1, 'Administrador'),
(2, 'Empleado');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `idUsuario` int(11) NOT NULL,
  `usuario` varchar(50) NOT NULL,
  `clave` varchar(50) NOT NULL,
  `estado` tinyint(1) NOT NULL,
  `idTipoUsuario` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`idUsuario`, `usuario`, `clave`, `estado`, `idTipoUsuario`) VALUES
(1, 'admin', 'admin123', 1, 1),
(2, 'empleado1', 'empleado123', 1, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `vehiculo`
--

CREATE TABLE `vehiculo` (
  `idVehiculo` int(11) NOT NULL,
  `marca` varchar(50) NOT NULL,
  `modelo` varchar(50) NOT NULL,
  `anio` int(11) NOT NULL,
  `idCliente` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `vehiculo`
--

INSERT INTO `vehiculo` (`idVehiculo`, `marca`, `modelo`, `anio`, `idCliente`) VALUES
(1, 'Toyota', 'Corolla', 2015, 1),
(2, 'Ford', 'Ranger', 2019, 2),
(3, 'Fiat', 'Cronos', 2021, 3),
(4, 'Peugeot', '408', 2018, 4),
(5, 'Renault', 'Logan', 2020, 5);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`idCliente`);

--
-- Indices de la tabla `especialidad`
--
ALTER TABLE `especialidad`
  ADD PRIMARY KEY (`idEspecialidad`);

--
-- Indices de la tabla `mecanico`
--
ALTER TABLE `mecanico`
  ADD PRIMARY KEY (`idMecanico`),
  ADD KEY `idEspecialidad` (`idEspecialidad`);

--
-- Indices de la tabla `ordenreparacion`
--
ALTER TABLE `ordenreparacion`
  ADD PRIMARY KEY (`idOrden`),
  ADD KEY `idVehiculo` (`idVehiculo`);

--
-- Indices de la tabla `tipousuario`
--
ALTER TABLE `tipousuario`
  ADD PRIMARY KEY (`idTipoUsuario`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`idUsuario`);

--
-- Indices de la tabla `vehiculo`
--
ALTER TABLE `vehiculo`
  ADD PRIMARY KEY (`idVehiculo`),
  ADD KEY `idCliente` (`idCliente`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `cliente`
--
ALTER TABLE `cliente`
  MODIFY `idCliente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `especialidad`
--
ALTER TABLE `especialidad`
  MODIFY `idEspecialidad` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `mecanico`
--
ALTER TABLE `mecanico`
  MODIFY `idMecanico` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `ordenreparacion`
--
ALTER TABLE `ordenreparacion`
  MODIFY `idOrden` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `tipousuario`
--
ALTER TABLE `tipousuario`
  MODIFY `idTipoUsuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `idUsuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `vehiculo`
--
ALTER TABLE `vehiculo`
  MODIFY `idVehiculo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `mecanico`
--
ALTER TABLE `mecanico`
  ADD CONSTRAINT `mecanico_ibfk_1` FOREIGN KEY (`idEspecialidad`) REFERENCES `especialidad` (`idEspecialidad`);

--
-- Filtros para la tabla `ordenreparacion`
--
ALTER TABLE `ordenreparacion`
  ADD CONSTRAINT `ordenreparacion_ibfk_1` FOREIGN KEY (`idVehiculo`) REFERENCES `vehiculo` (`idVehiculo`);

--
-- Filtros para la tabla `vehiculo`
--
ALTER TABLE `vehiculo`
  ADD CONSTRAINT `vehiculo_ibfk_1` FOREIGN KEY (`idCliente`) REFERENCES `cliente` (`idCliente`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
