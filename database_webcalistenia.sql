-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: May 14, 2019 at 03:52 PM
-- Server version: 10.1.21-MariaDB
-- PHP Version: 5.6.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `webcalistenia`
--

-- --------------------------------------------------------

--
-- Table structure for table `earticulo`
--

CREATE TABLE `earticulo` (
  `k` int(11) NOT NULL,
  `iStock` int(11) NOT NULL,
  `sNombre` varchar(255) NOT NULL,
  `xTipo_k` int(11) NOT NULL,
  `xMarca_k` int(11) NOT NULL,
  `sDescripcion` text NOT NULL,
  `dPrecio` decimal(10,2) NOT NULL,
  `sImagen` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `earticulo`
--

INSERT INTO `earticulo` (`k`, `iStock`, `sNombre`, `xTipo_k`, `xMarca_k`, `sDescripcion`, `dPrecio`, `sImagen`) VALUES
(1, 50, 'Anillos de Gimnasio Olímpico', 1, 1, 'Los anillos son gruesos y sólidos y no tienen ninguna astilla o agujeros de ninguna clase, funcionan sus manos por todas partes de ellas y son apenas lisas y sólidas. El material de madera sólida proporciona un excelente agarre sin deslizamiento incluso cuando las palmas comienzan a sudar. Diámetro perfecto de los anillos.\r\n\r\nCaracterísticas\r\n- Diámetro: 235mm\r\n- Diámetro interno: 172mm\r\n- Anillo Espesor: 32mm\r\n- Longitud de la correa: 4.57m\r\n- Ancho de la correa: 38mm\r\n- Peso: 1.82kg\r\n- Capacidad: 365kg.', '32.99', 'anillas1.jpg'),
(2, 8, 'Anillas de Gimnasia para Entrenamiento', 1, 2, 'Anillos de la gimnasia de madera con correas de la hebilla, aros de ejercicio multifunción ajustable.\r\n\r\nCaracterísticas:\r\n- Material: madera de haya / Abedul\r\n- Correas : Ancho en 28 mm\r\n- Correas de nylon correa: 2.5cm x (450520) cm\r\n- Diámetro del tubo del anillo: 32 mm\r\n- Diámetro exterior: 230 mm\r\n- Carga máxima: hasta 300 kg', '26.99', 'anillas2.jpg'),
(3, 37, 'Magnesio Líquido. Tubo de 200 ML', 2, 5, 'AGARRE INMEJORABLE.\r\nEl magnesio líquido le proporciona un agarre más firme, especialmente útil para la escalada y otras actividades deportivas que exijan una presa fiable. Olvídese de las manos sudorosas gracias al agarre perfecto que garantiza nuestro magnesio líquido.\r\n\r\nMÁXIMA CALIDAD. \r\nFabricado en Europa, el magnesio líquido de VIA FORTIS ha superado todos los controles de calidad exigidos. Escoja lo mejor: su piel se lo agradecerá.\r\n\r\nSIN MANCHAS. \r\nA diferencia de las bolas de magnesio, el magnesio líquido no deja manchas. Muchos gimnasios no permiten utilizar magnesio en polvo, por lo que los usuarios se decantan por el magnesio líquido, con la confianza de poder utilizarlo en cualquier lugar. El magnesio seco puede arruinar las prendas textiles, algo que no sucede con el magnesio líquido.', '12.90', 'magnesio1.jpg'),
(4, 26, 'Anillas Olímpicas Gimnasia y Crossfit - Correas Numeradas', 1, 3, 'AGARRE PERFECTO (AUNQUE TE SUDEN LAS MANOS) - Hechas en madera de abedul laminado, nuestras anillas tienen un tacto suave y sedoso proporcionando un agarre como ningún otro material. Anillas que no resbalan te aseguran el máximo rendimiento en los ejercicios más extremos con una confianza absoluta. Olvídate de los plásticos, olvídate del sudor, centrate en tus entrenamientos y wods para mejorar cada día.\r\n\r\nGRAN SENSACIÓN DE SEGURIDAD - Cintas que no se rompen. Lesionarse por culpa de un material defectuoso o de mala calidad es cosa seria. Nuestras anillas usan las cintas más resistentes y anchas del mercado (38mm frente a los habituales 25mm). La capacidad de resistencia de las correas es de 362kg. Estas son las anillas de suspensión más seguras que puedes encontrar y que te permitirán dar el máximo de ti sin tener que preocuparte.', '39.95', 'anillas3.jpg'),
(5, 5, 'Magnesio de Escalada', 2, 5, 'Material duro MAMMUT\r\nMagnesio Montañismo, alpinismo y trekking Unisex Adulto\r\nLiquid 200 Ml (2290-00611-9001)', '13.36', 'magnesio2.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `emarca`
--

CREATE TABLE `emarca` (
  `k` int(11) NOT NULL,
  `sNombre` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `emarca`
--

INSERT INTO `emarca` (`k`, `sNombre`) VALUES
(1, '5BILLION FITNESS'),
(2, 'GHB'),
(3, 'Sportvitae'),
(4, 'VIA FORTIS'),
(5, 'Mammut'),
(9, 'RubberBanditz'),
(10, 'NuevaMarca');

-- --------------------------------------------------------

--
-- Table structure for table `epedido`
--

CREATE TABLE `epedido` (
  `k` int(11) NOT NULL,
  `xUsuario_k` int(11) NOT NULL,
  `dFecha` date NOT NULL,
  `sDireccion` varchar(255) NOT NULL,
  `bEnviado` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `epedido`
--

INSERT INTO `epedido` (`k`, `xUsuario_k`, `dFecha`, `sDireccion`, `bEnviado`) VALUES
(2, 4, '2019-02-07', 'c/Jabonera, n54', 1),
(3, 4, '2019-03-07', 'c/Jabonera, n54', 1),
(4, 2, '2019-03-07', 'c/Simon Hernandez', 1),
(5, 14, '2019-04-14', 'c/Cedaceros, 11', 1),
(6, 2, '2019-05-14', 'c/Simon Hernandez', 1),
(7, 1, '2019-05-14', 'c/Desarrollo 50, 72B', 1),
(8, 16, '2019-05-14', 'c/Zhvyrka, n5', 1),
(9, 1, '2019-05-14', 'c/Desarrollo 50, 72B', 1);

-- --------------------------------------------------------

--
-- Table structure for table `etipo`
--

CREATE TABLE `etipo` (
  `k` int(11) NOT NULL,
  `sNombre` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `etipo`
--

INSERT INTO `etipo` (`k`, `sNombre`) VALUES
(1, 'Anillas'),
(2, 'Magnesio'),
(3, 'Paralelas / PBars'),
(4, 'Barra de dominadas'),
(5, 'Rueda abdominal'),
(6, 'Suplementos'),
(16, 'NuevaCat'),
(17, 'NuevaCat2');

-- --------------------------------------------------------

--
-- Table structure for table `eusuario`
--

CREATE TABLE `eusuario` (
  `k` int(11) NOT NULL,
  `sUser` varchar(255) NOT NULL,
  `sNombre` varchar(255) NOT NULL,
  `sApellido` varchar(255) NOT NULL,
  `sDni` varchar(255) NOT NULL,
  `sDireccion` varchar(255) NOT NULL,
  `sEmail` varchar(255) NOT NULL,
  `dFechaRegistro` date NOT NULL,
  `bAdministrador` tinyint(4) NOT NULL DEFAULT '0',
  `sPassword` varchar(255) NOT NULL,
  `bStatus` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `eusuario`
--

INSERT INTO `eusuario` (`k`, `sUser`, `sNombre`, `sApellido`, `sDni`, `sDireccion`, `sEmail`, `dFechaRegistro`, `bAdministrador`, `sPassword`, `bStatus`) VALUES
(1, '0xefro', 'Vasyl', 'Havrylyuk', '12345678F', 'c/Desarrollo 50, 72B', '0xefro@gmail.com', '2019-02-28', 1, '3c9909afec25354d551dae21590bb26e38d53f2173b8d3dc3eee4c047e7ab1c1eb8b85103e3be7ba613b31bb5c9c36214dc9f14a42fd7a2fdb84856bca5c44c2', 1),
(2, 'zarzanduil', 'Jorge', 'Belinchon', '87654321K', 'c/Simon Hernandez', 'jorge.belinchon.gonzales.96@gmail.com', '2019-02-28', 0, '84a0ce8e54e7f5bef1050e7d77e76422f9f3161d62376077bd694f1c02c180963ed069517a0234ca344156cdf891356154094a91d8b7a3352b990ce0a42c64a8', 1),
(4, 'vasyl_workout', 'Vasyl', 'Havrylyuk', '32145365J', 'c/Jabonera, n54', 'vrylyuk@gmail.com', '2019-03-01', 0, '84a0ce8e54e7f5bef1050e7d77e76422f9f3161d62376077bd694f1c02c180963ed069517a0234ca344156cdf891356154094a91d8b7a3352b990ce0a42c64a8', 1),
(14, 'fer', 'Fernando', 'Alonso', '99988779K', 'c/Cedaceros, 11', 'fer@gmail.com', '2019-05-08', 0, '84a0ce8e54e7f5bef1050e7d77e76422f9f3161d62376077bd694f1c02c180963ed069517a0234ca344156cdf891356154094a91d8b7a3352b990ce0a42c64a8', 1),
(15, 'moi', 'Moises', 'Piñeiro', '86675489K', 'c/Cadaceros, 12', 'moi@gmail.com', '2019-05-08', 1, '84a0ce8e54e7f5bef1050e7d77e76422f9f3161d62376077bd694f1c02c180963ed069517a0234ca344156cdf891356154094a91d8b7a3352b990ce0a42c64a8', 1),
(16, 'viktor', 'Viktor', 'Havrylyuk', 'K9899941G', 'c/Zhvyrka, n5', 'viktor@gmail.com', '2019-05-14', 0, '84a0ce8e54e7f5bef1050e7d77e76422f9f3161d62376077bd694f1c02c180963ed069517a0234ca344156cdf891356154094a91d8b7a3352b990ce0a42c64a8', 1),
(23, 'sisnet', 'SISnet', 'Netijam', '22222222N', 'c/Clavel, 8', 'vasyl.havrylyuk@sisnet360.com', '2019-05-14', 0, '84a0ce8e54e7f5bef1050e7d77e76422f9f3161d62376077bd694f1c02c180963ed069517a0234ca344156cdf891356154094a91d8b7a3352b990ce0a42c64a8', 1);

-- --------------------------------------------------------

--
-- Table structure for table `rpedidoarticulo`
--

CREATE TABLE `rpedidoarticulo` (
  `k` int(11) NOT NULL,
  `xPedido_k` int(11) NOT NULL,
  `xArticulo_k` int(11) NOT NULL,
  `iCantidad` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `rpedidoarticulo`
--

INSERT INTO `rpedidoarticulo` (`k`, `xPedido_k`, `xArticulo_k`, `iCantidad`) VALUES
(2, 2, 2, 3),
(3, 3, 2, 4),
(4, 3, 4, 3),
(5, 4, 2, 8),
(6, 4, 5, 2),
(7, 4, 3, 10),
(8, 5, 4, 2),
(9, 5, 3, 5),
(10, 6, 2, 14),
(11, 6, 3, 3),
(12, 6, 4, 2),
(13, 7, 3, 1),
(14, 8, 2, 10),
(15, 8, 4, 24),
(16, 8, 5, 19),
(17, 8, 3, 1),
(18, 9, 2, 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `earticulo`
--
ALTER TABLE `earticulo`
  ADD PRIMARY KEY (`k`),
  ADD KEY `Categoria_idx` (`xTipo_k`),
  ADD KEY `Marca_idx` (`xMarca_k`);

--
-- Indexes for table `emarca`
--
ALTER TABLE `emarca`
  ADD PRIMARY KEY (`k`);

--
-- Indexes for table `epedido`
--
ALTER TABLE `epedido`
  ADD PRIMARY KEY (`k`),
  ADD KEY `Usuario_idx` (`xUsuario_k`);

--
-- Indexes for table `etipo`
--
ALTER TABLE `etipo`
  ADD PRIMARY KEY (`k`);

--
-- Indexes for table `eusuario`
--
ALTER TABLE `eusuario`
  ADD PRIMARY KEY (`k`);

--
-- Indexes for table `rpedidoarticulo`
--
ALTER TABLE `rpedidoarticulo`
  ADD PRIMARY KEY (`k`),
  ADD KEY `Pedido_idx` (`xPedido_k`),
  ADD KEY `Articulo_idx` (`xArticulo_k`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `earticulo`
--
ALTER TABLE `earticulo`
  MODIFY `k` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `emarca`
--
ALTER TABLE `emarca`
  MODIFY `k` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `epedido`
--
ALTER TABLE `epedido`
  MODIFY `k` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT for table `etipo`
--
ALTER TABLE `etipo`
  MODIFY `k` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;
--
-- AUTO_INCREMENT for table `eusuario`
--
ALTER TABLE `eusuario`
  MODIFY `k` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;
--
-- AUTO_INCREMENT for table `rpedidoarticulo`
--
ALTER TABLE `rpedidoarticulo`
  MODIFY `k` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `earticulo`
--
ALTER TABLE `earticulo`
  ADD CONSTRAINT `Marca` FOREIGN KEY (`xMarca_k`) REFERENCES `emarca` (`k`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `Tipo` FOREIGN KEY (`xTipo_k`) REFERENCES `etipo` (`k`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `epedido`
--
ALTER TABLE `epedido`
  ADD CONSTRAINT `Usuario` FOREIGN KEY (`xUsuario_k`) REFERENCES `eusuario` (`k`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `rpedidoarticulo`
--
ALTER TABLE `rpedidoarticulo`
  ADD CONSTRAINT `Articulo` FOREIGN KEY (`xArticulo_k`) REFERENCES `earticulo` (`k`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `Pedido` FOREIGN KEY (`xPedido_k`) REFERENCES `epedido` (`k`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
