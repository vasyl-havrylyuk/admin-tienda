-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1:3306
-- Tiempo de generación: 07-04-2019 a las 16:41:49
-- Versión del servidor: 5.7.23
-- Versión de PHP: 7.2.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `webcalistenia`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `earticulo`
--

DROP TABLE IF EXISTS `earticulo`;
CREATE TABLE IF NOT EXISTS `earticulo` (
  `k` int(11) NOT NULL AUTO_INCREMENT,
  `iStock` int(11) NOT NULL,
  `sNombre` varchar(255) NOT NULL,
  `xTipo_k` int(11) NOT NULL,
  `xMarca_k` int(11) NOT NULL,
  `sDescripcion` text NOT NULL,
  `dPrecio` decimal(10,2) NOT NULL,
  `sImagen` varchar(255) NOT NULL,
  PRIMARY KEY (`k`),
  KEY `Categoria_idx` (`xTipo_k`),
  KEY `Marca_idx` (`xMarca_k`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `earticulo`
--

INSERT INTO `earticulo` (`k`, `iStock`, `sNombre`, `xTipo_k`, `xMarca_k`, `sDescripcion`, `dPrecio`, `sImagen`) VALUES
(1, 0, 'Anillos de Gimnasio Olímpico', 1, 1, 'Los anillos son gruesos y sólidos y no tienen ninguna astilla o agujeros de ninguna clase, funcionan sus manos por todas partes de ellas y son apenas lisas y sólidas. El material de madera sólida proporciona un excelente agarre sin deslizamiento incluso cuando las palmas comienzan a sudar. Diámetro perfecto de los anillos.\\r\\n\\r\\nCaracterísticas\\r\\n- Diámetro: 235mm\\r\\n- Diámetro interno: 172mm\\r\\n- Anillo Espesor: 32mm\\r\\n- Longitud de la correa: 4.57m\\r\\n- Ancho de la correa: 38mm\\r\\n- Peso: 1.82kg\\r\\n- Capacidad: 365kg.', '32.99', 'anillas1.jpg'),
(2, 48, 'Anillas de Gimnasia para Entrenamiento', 1, 2, 'Anillos de la gimnasia de madera con correas de la hebilla, aros de ejercicio multifunción ajustable.\\r\\n\\r\\nCaracterísticas:\\r\\n- Material: madera de haya / Abedul\\r\\n- Correas : Ancho en 28 mm\\r\\n- Correas de nylon correa: 2.5cm x (450520) cm\\r\\n- Diámetro del tubo del anillo: 32 mm\\r\\n- Diámetro exterior: 230 mm\\r\\n- Carga máxima: hasta 300 kg', '26.99', 'anillas2.jpg'),
(3, 12, 'Magnesio Líquido. Tubo de 200 ML', 2, 5, 'AGARRE INMEJORABLE. El magnesio líquido le proporciona un agarre más firme, especialmente útil para la escalada y otras actividades deportivas que exijan una presa fiable. Olvídese de las manos sudorosas gracias al agarre perfecto que garantiza nuestro magnesio líquido.\\r\\n\\r\\nMÁXIMA CALIDAD. Fabricado en Europa, el magnesio líquido de VIA FORTIS ha superado todos los controles de calidad exigidos. Escoja lo mejor: su piel se lo agradecerá.\\r\\n\\r\\nSIN MANCHAS. A diferencia de las bolas de magnesio, el magnesio líquido no deja manchas. Muchos gimnasios no permiten utilizar magnesio en polvo, por lo que los usuarios se decantan por el magnesio líquido, con la confianza de poder utilizarlo en cualquier lugar. El magnesio seco puede arruinar las prendas textiles, algo que no sucede con el magnesio líquido.', '12.90', 'magnesio1.jpg'),
(4, 6, 'Anillas Olímpicas Gimnasia y Crossfit - Correas Numeradas', 1, 3, 'AGARRE PERFECTO (AUNQUE TE SUDEN LAS MANOS) - Hechas en madera de abedul laminado, nuestras anillas tienen un tacto suave y sedoso proporcionando un agarre como ningún otro material. Anillas que no resbalan te aseguran el máximo rendimiento en los ejercicios más extremos con una confianza absoluta. Olvídate de los plásticos, olvídate del sudor, centrate en tus entrenamientos y wods para mejorar cada día.\\r\\n\\r\\nGRAN SENSACIÓN DE SEGURIDAD - Cintas que no se rompen. Lesionarse por culpa de un material defectuoso o de mala calidad es cosa seria. Nuestras anillas usan las cintas más resistentes y anchas del mercado (38mm frente a los habituales 25mm). La capacidad de resistencia de las correas es de 362kg. Estas son las anillas de suspensión más seguras que puedes encontrar y que te permitirán dar el máximo de ti sin tener que preocuparte.', '39.95', 'anillas3.jpg'),
(5, 10, 'Magnesio de Escalada', 2, 5, 'Material duro MAMMUT\\r\\nMagnesio Montañismo, alpinismo y trekking Unisex Adulto\\r\\nLiquid 200 Ml (2290-00611-9001)\\r\\n', '13.36', 'magnesio2.jpg');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `emarca`
--

DROP TABLE IF EXISTS `emarca`;
CREATE TABLE IF NOT EXISTS `emarca` (
  `k` int(11) NOT NULL AUTO_INCREMENT,
  `sNombre` varchar(255) NOT NULL,
  PRIMARY KEY (`k`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `emarca`
--

INSERT INTO `emarca` (`k`, `sNombre`) VALUES
(1, '5BILLION FITNESS'),
(2, 'GHB'),
(3, 'Sportvitae'),
(4, 'VIA FORTIS'),
(5, 'Mammut');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `epedido`
--

DROP TABLE IF EXISTS `epedido`;
CREATE TABLE IF NOT EXISTS `epedido` (
  `k` int(11) NOT NULL AUTO_INCREMENT,
  `xUsuario_k` int(11) NOT NULL,
  `dFecha` date NOT NULL,
  `sDireccion` varchar(255) NOT NULL,
  PRIMARY KEY (`k`),
  KEY `Usuario_idx` (`xUsuario_k`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `etipo`
--

DROP TABLE IF EXISTS `etipo`;
CREATE TABLE IF NOT EXISTS `etipo` (
  `k` int(11) NOT NULL AUTO_INCREMENT,
  `sNombre` varchar(255) NOT NULL,
  PRIMARY KEY (`k`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `etipo`
--

INSERT INTO `etipo` (`k`, `sNombre`) VALUES
(1, 'Anillas'),
(2, 'Magnesio'),
(3, 'Paralelas / PBars'),
(4, 'Barra de dominadas'),
(5, 'Rueda abdominal'),
(6, 'Suplementos');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `eusuario`
--

DROP TABLE IF EXISTS `eusuario`;
CREATE TABLE IF NOT EXISTS `eusuario` (
  `k` int(11) NOT NULL AUTO_INCREMENT,
  `sUser` varchar(255) NOT NULL,
  `sNombre` varchar(255) NOT NULL,
  `sApellido` varchar(255) NOT NULL,
  `sDni` varchar(255) NOT NULL,
  `sDireccion` varchar(255) NOT NULL,
  `sEmail` varchar(255) NOT NULL,
  `dFechaRegistro` date NOT NULL,
  `bAdministrador` tinyint(4) NOT NULL DEFAULT '0',
  `sPassword` varchar(255) NOT NULL,
  `bStatus` tinyint(4) NOT NULL,
  PRIMARY KEY (`k`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `eusuario`
--

INSERT INTO `eusuario` (`k`, `sUser`, `sNombre`, `sApellido`, `sDni`, `sDireccion`, `sEmail`, `dFechaRegistro`, `bAdministrador`, `sPassword`, `bStatus`) VALUES
(1, '0xefro', 'Vasyl', 'Havrylyuk', '12345678N', 'c/Desarrollo 50, 72B', '0xefro@gmail.com', '2019-02-28', 1, '3c9909afec25354d551dae21590bb26e38d53f2173b8d3dc3eee4c047e7ab1c1eb8b85103e3be7ba613b31bb5c9c36214dc9f14a42fd7a2fdb84856bca5c44c2', 1),
(2, 'zarzanduil', 'Jorge', 'Belinchon', '87654321K', 'c/Simon Hernandez', 'jorge.belinchon.gonzales.96@gmail.com', '2019-02-28', 0, '84a0ce8e54e7f5bef1050e7d77e76422f9f3161d62376077bd694f1c02c180963ed069517a0234ca344156cdf891356154094a91d8b7a3352b990ce0a42c64a8', 1),
(4, 'vasyl_workout', 'Vasyl', 'Havrylyuk', '32145365J', 'c/Jabonera, n54', 'vrylyuk@gmail.com', '2019-03-01', 0, '84a0ce8e54e7f5bef1050e7d77e76422f9f3161d62376077bd694f1c02c180963ed069517a0234ca344156cdf891356154094a91d8b7a3352b990ce0a42c64a8', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rpedidoarticulo`
--

DROP TABLE IF EXISTS `rpedidoarticulo`;
CREATE TABLE IF NOT EXISTS `rpedidoarticulo` (
  `k` int(11) NOT NULL AUTO_INCREMENT,
  `xPedido_k` int(11) NOT NULL,
  `xArticulo_k` int(11) NOT NULL,
  `iCantidad` int(11) NOT NULL,
  PRIMARY KEY (`k`),
  KEY `Pedido_idx` (`xPedido_k`),
  KEY `Articulo_idx` (`xArticulo_k`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `earticulo`
--
ALTER TABLE `earticulo`
  ADD CONSTRAINT `Marca` FOREIGN KEY (`xMarca_k`) REFERENCES `emarca` (`k`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `Tipo` FOREIGN KEY (`xTipo_k`) REFERENCES `etipo` (`k`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `epedido`
--
ALTER TABLE `epedido`
  ADD CONSTRAINT `Usuario` FOREIGN KEY (`xUsuario_k`) REFERENCES `eusuario` (`k`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `rpedidoarticulo`
--
ALTER TABLE `rpedidoarticulo`
  ADD CONSTRAINT `Articulo` FOREIGN KEY (`xArticulo_k`) REFERENCES `earticulo` (`k`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `Pedido` FOREIGN KEY (`xPedido_k`) REFERENCES `epedido` (`k`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
