-- phpMyAdmin SQL Dump
-- version 4.5.4.1deb2ubuntu2.1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: May 22, 2019 at 07:06 AM
-- Server version: 5.7.26-0ubuntu0.16.04.1
-- PHP Version: 7.0.33-0ubuntu0.16.04.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
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
(1, 34, 'Anillos de Gimnasio Olímpico', 1, 1, 'Los anillos son gruesos y sólidos y no tienen ninguna astilla o agujeros de ninguna clase, funcionan sus manos por todas partes de ellas y son apenas lisas y sólidas. El material de madera sólida proporciona un excelente agarre sin deslizamiento incluso cuando las palmas comienzan a sudar. Diámetro perfecto de los anillos.\r\n\r\nCaracterísticas\r\n- Diámetro: 235mm\r\n- Diámetro interno: 172mm\r\n- Anillo Espesor: 32mm\r\n- Longitud de la correa: 4.57m\r\n- Ancho de la correa: 38mm\r\n- Peso: 1.82kg\r\n- Capacidad: 365kg.', '32.99', 'anillas1.jpg'),
(2, 69, 'Anillas de Gimnasia para Entrenamiento', 1, 2, 'Anillos de la gimnasia de madera con correas de la hebilla, aros de ejercicio multifunción ajustable.\r\n\r\nCaracterísticas:\r\n- Material: madera de haya / Abedul\r\n- Correas : Ancho en 28 mm\r\n- Correas de nylon correa: 2.5cm x (450520) cm\r\n- Diámetro del tubo del anillo: 32 mm\r\n- Diámetro exterior: 230 mm\r\n- Carga máxima: hasta 300 kg', '26.99', 'anillas2.jpg'),
(3, 23, 'Magnesio Líquido. Tubo de 200 ML', 2, 5, 'AGARRE INMEJORABLE.\r\nEl magnesio líquido le proporciona un agarre más firme, especialmente útil para la escalada y otras actividades deportivas que exijan una presa fiable. Olvídese de las manos sudorosas gracias al agarre perfecto que garantiza nuestro magnesio líquido.\r\n\r\nMÁXIMA CALIDAD. \r\nFabricado en Europa, el magnesio líquido de VIA FORTIS ha superado todos los controles de calidad exigidos. Escoja lo mejor: su piel se lo agradecerá.\r\n\r\nSIN MANCHAS. \r\nA diferencia de las bolas de magnesio, el magnesio líquido no deja manchas. Muchos gimnasios no permiten utilizar magnesio en polvo, por lo que los usuarios se decantan por el magnesio líquido, con la confianza de poder utilizarlo en cualquier lugar. El magnesio seco puede arruinar las prendas textiles, algo que no sucede con el magnesio líquido.', '12.90', 'magnesio1.jpg'),
(4, 24, 'Anillas Olímpicas Gimnasia y Crossfit - Correas Numeradas', 1, 3, 'AGARRE PERFECTO (AUNQUE TE SUDEN LAS MANOS) - Hechas en madera de abedul laminado, nuestras anillas tienen un tacto suave y sedoso proporcionando un agarre como ningún otro material. Anillas que no resbalan te aseguran el máximo rendimiento en los ejercicios más extremos con una confianza absoluta. Olvídate de los plásticos, olvídate del sudor, centrate en tus entrenamientos y wods para mejorar cada día.\r\n\r\nGRAN SENSACIÓN DE SEGURIDAD - Cintas que no se rompen. Lesionarse por culpa de un material defectuoso o de mala calidad es cosa seria. Nuestras anillas usan las cintas más resistentes y anchas del mercado (38mm frente a los habituales 25mm). La capacidad de resistencia de las correas es de 362kg. Estas son las anillas de suspensión más seguras que puedes encontrar y que te permitirán dar el máximo de ti sin tener que preocuparte.', '39.95', 'anillas3.jpg'),
(5, 15, 'Magnesio de Escalada', 2, 5, 'Material duro MAMMUT\r\nMagnesio Montañismo, alpinismo y trekking Unisex Adulto\r\nLiquid 200 Ml (2290-00611-9001)', '13.36', 'magnesio2.jpg'),
(6, 29, 'Predator Protein 2Kg', 6, 11, 'Beneficios y Funciones:\r\n\r\n    Contiene 100 % proteína concentrado de alta calidad (W.P.C.).\r\n    Promueve el crecimiento muscular.\r\n    Mejora la recuperación muscular.\r\n    Inhibe el catabolismo muscular.\r\n    Contiene encimas digestivas DIGEZYME®.\r\n    Totalmente libre de aspartamo.\r\n\r\nPresentación: 2kg.', '50.90', '1558073820-amix-predator-2-kg.jpg'),
(7, 12, 'Set de 3 Bandas de Resistencia de Rubberbanditz', 18, 9, 'El complemento perfecto\r\nAyudando a los levantadores de potencia a romper los récords y hacer avances monumentales en el rendimiento durante más de 10 años, las bandas de potencia han sido una herramienta esencial para muchos Goliats de hoy en día para ayudar a superar las mesetas de entrenamiento y probar su fuerza definitiva.\r\n\r\n¿Cómo funcionan las bandas de levantamiento de potencia?\r\nEl levantamiento de fuerza y ​​olímpico con bandas ofrece una resistencia ascendente en todo su rango de movimiento, proporcionando una relación armoniosa con sus músculos. A medida que los músculos se contraen y ejercen fuerza, las bandas se estiran más y la resistencia aumenta. En su punto más débil, generalmente en la posición inicial, las bandas ofrecen una resistencia mínima para ayudarlo a superar el &quot;punto de adherencia&quot; (por ejemplo, el punto más bajo de una sentadilla o press de banca). Luego, a medida que se extiende a lo largo de su repetición, la tensión de la banda de levantamiento de pesas aumenta gradualmente, lo que permite una eficiencia de fortalecimiento muscular óptima que no se puede lograr simplemente por la fuerza de la gravedad.\r\n\r\n¿Qué banda es la adecuada para mí?\r\n* (Nombre): (Espesor) - (Resistencia aproximada)\r\n* Banda de luz: 1/4 &quot;- 5 a 15 lbs (2-7kg)\r\n* Banda media: 1/2 &quot;- 20 a 35 lbs (9-16 kg)\r\n* Banda pesada: 3/4 &quot;- 30 a 50 lb (14-23 kg)\r\n* Banda robusta: 1 1/8 &quot;- 40 a 80 lbs (18-36kg)\r\n* Banda de potencia: 1 3/4 &quot;- 50 a 120 lbs (23-54kg)\r\n* Banda fuerte: 2 1/2 &quot;- 60 a 150 lbs (27-68kg)\r\n* Banda de monstruos: 4 &quot;- 80 a 200 lbs (36-91kg)', '88.05', '1558074190-6105CTdFeFL._SL1210_.jpg'),
(8, 20, 'PURE 100% WHEY 2,27 Kg', 6, 13, 'Pure 100% Whey. Características principales:\r\n\r\n    119 kcal por dosis*.\r\n    Proteínas 100% a partir del suero de leche.\r\n    Alto contenido en proteínas.\r\n    79.3 % proteínas.\r\n    Hasta 10.37 gramos de aminoácidos esenciales.\r\n    Hasta 4.33 gramos de BCAA por dosis.\r\n    6.8 % carbohidratos.\r\n    5.9 % grasas.\r\n    Sin azúcares añadidos.\r\n    Bajo contenido en azúcares.\r\n    Calidad y pureza garantizada.\r\n    Apto para vegetarianos que consumen lácteos.\r\n    Sabores increíbles.\r\n    Enriquecido con enzimas digestivas.\r\n    Envase de 2.27 kg (75 dosis).', '42.99', '1558074406-pure-nutrition-pure-100-whey-2270g.jpg'),
(9, 70, 'Paralelas para Dips y Handstands', 3, 14, 'Cada barra es de 24 &quot;de ancho, 31&quot; de alto y se puede ajustar hasta 35 &quot;, por lo que puede configurarla en paralelo o escalonada para una mayor variedad de ejercicios\r\n\r\nLos tubos resistentes de hierro con recubrimiento en polvo pueden soportar hasta 400 libras, para que pueda entrenar de manera segura el pecho, tríceps, hombros y centro', '52.99', '1558074926-71LOvXwZACL._SL1500_.jpg'),
(10, 34, 'Anclle Wooden PBars', 3, 15, 'Para el ejercicio físico, el fulcro triangular es más estable; el estante corto reduce la fuerza, la balanza no vibra y los dos lados son fijos y firmes.\r\n\r\nLa madera de carbón es sólida y duradera, resistente a las polillas y resistente, absorbe el sudor y es antideslizante con efecto amortiguador.\r\n\r\nFácil de instalar: se puede montar y desmontar sin necesidad de herramientas en pocos segundos. Se adapta incluso en un paquete de bolsas pequeñas y no pesa mucho.\r\n\r\nLas flexiones son la forma más sencilla y efectiva de ejercitar los músculos del pecho. Equipo de fitness perfecto, fácil de llevar, diseño simple y práctico.\r\n\r\nEl estante puede soportar una carga pesada, el producto 25CM puede soportar aproximadamente 300-400KG, el producto 50CM puede soportar aproximadamente 200-300KG', '27.78', '1558075302-61OgIPr4nML._SL1001_.jpg');

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
(11, 'Amix'),
(13, 'Pure Protetin'),
(14, 'ProsourceFit'),
(15, 'Anclle');

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
(5, 14, '2019-04-14', 'c/Cedaceros, 11', 1),
(7, 1, '2019-05-14', 'c/Desarrollo 50, 72B', 1),
(8, 16, '2019-05-14', 'c/Zhvyrka, n5', 1),
(27, 1, '2019-05-16', 'c/Desarrollo 50, 72B', 1),
(28, 1, '2019-05-16', 'c/Desarrollo 50, 72B', 1),
(29, 1, '2019-05-16', 'c/Desarrollo 50, 72B', 1),
(32, 2, '2019-05-16', 'c/Simon Hernandez', 1),
(34, 34, '2019-05-16', 'c/ JAJA', 1),
(35, 1, '2019-05-16', 'c/Desarrollo 50, 72B', 1),
(36, 1, '2019-05-17', 'c/Desarrollo 50, 72B', 0);

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
(18, 'Bandas de resistencia');

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
(2, 'zarzanduil', 'Jorge', 'Belinchon', '87654321K', 'c/Hernandez', 'jorge.belinchon.gonzalez.96@gmail.com', '2019-02-28', 0, '84a0ce8e54e7f5bef1050e7d77e76422f9f3161d62376077bd694f1c02c180963ed069517a0234ca344156cdf891356154094a91d8b7a3352b990ce0a42c64a8', 1),
(4, 'vasyl_workout', 'Vasyl', 'Havrylyuk', '32145365J', 'c/Jabonera, n54', 'vrylyuk@gmail.com', '2019-03-01', 0, '84a0ce8e54e7f5bef1050e7d77e76422f9f3161d62376077bd694f1c02c180963ed069517a0234ca344156cdf891356154094a91d8b7a3352b990ce0a42c64a8', 1),
(14, 'fer', 'Fernando', 'Alonso', '99988779K', 'c/Cedaceros, 11', 'fer@gmail.com', '2019-05-08', 0, '84a0ce8e54e7f5bef1050e7d77e76422f9f3161d62376077bd694f1c02c180963ed069517a0234ca344156cdf891356154094a91d8b7a3352b990ce0a42c64a8', 1),
(15, 'moi', 'Moises', 'Piñeiro', '86675489K', 'c/Cadaceros, 12', 'moi@gmail.com', '2019-05-08', 1, '84a0ce8e54e7f5bef1050e7d77e76422f9f3161d62376077bd694f1c02c180963ed069517a0234ca344156cdf891356154094a91d8b7a3352b990ce0a42c64a8', 1),
(16, 'viktor', 'Viktor', 'Havrylyuk', 'K9899941G', 'c/Zhvyrka, n5', 'viktor@gmail.com', '2019-05-14', 0, '84a0ce8e54e7f5bef1050e7d77e76422f9f3161d62376077bd694f1c02c180963ed069517a0234ca344156cdf891356154094a91d8b7a3352b990ce0a42c64a8', 1),
(24, 'pepe', 'Pepito', 'Pérez', '12345678k', 'c/Desarrollo', 'pepe@gmail.com', '2019-05-16', 0, '84a0ce8e54e7f5bef1050e7d77e76422f9f3161d62376077bd694f1c02c180963ed069517a0234ca344156cdf891356154094a91d8b7a3352b990ce0a42c64a8', 1),
(34, 'sisnet', 'SISnet', 'Netijam', '11221123B', 'c/ JAJA', 'vasyl.havrylyuk@sisnet360.com', '2019-05-16', 0, '84a0ce8e54e7f5bef1050e7d77e76422f9f3161d62376077bd694f1c02c180963ed069517a0234ca344156cdf891356154094a91d8b7a3352b990ce0a42c64a8', 1),
(35, 'Vladitor31', 'Vlad', 'Tomus', 'Y0430746Q', 'La paz', 'Vladitor31@gmail.com', '2019-05-16', 0, '8cf4ccfa5c95c7a35f957a360bad68925d88dc388687181ec9a95462cb3ab09c8c2dccb413c66e20953ae995889c6e61ca4c4a873f0dda8a3e991e00bf3a0893', 1),
(37, 'Vladitor311', 'Vlad', 'Tomus', 'Y0440746Q', 'La paz', 'Vlad_tomus31@yahoo.com', '2019-05-16', 0, '8cf4ccfa5c95c7a35f957a360bad68925d88dc388687181ec9a95462cb3ab09c8c2dccb413c66e20953ae995889c6e61ca4c4a873f0dda8a3e991e00bf3a0893', 0);

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
(8, 5, 4, 2),
(9, 5, 3, 5),
(13, 7, 3, 1),
(14, 8, 2, 10),
(15, 8, 4, 24),
(16, 8, 5, 19),
(17, 8, 3, 1),
(42, 27, 2, 1),
(43, 28, 3, 1),
(44, 29, 5, 1),
(47, 32, 2, 5),
(49, 34, 1, 12),
(50, 34, 5, 1),
(51, 35, 5, 1),
(52, 36, 1, 1);

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
  MODIFY `k` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `emarca`
--
ALTER TABLE `emarca`
  MODIFY `k` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
--
-- AUTO_INCREMENT for table `epedido`
--
ALTER TABLE `epedido`
  MODIFY `k` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;
--
-- AUTO_INCREMENT for table `etipo`
--
ALTER TABLE `etipo`
  MODIFY `k` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;
--
-- AUTO_INCREMENT for table `eusuario`
--
ALTER TABLE `eusuario`
  MODIFY `k` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;
--
-- AUTO_INCREMENT for table `rpedidoarticulo`
--
ALTER TABLE `rpedidoarticulo`
  MODIFY `k` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;
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

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
