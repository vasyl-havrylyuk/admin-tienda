-- phpMyAdmin SQL Dump
-- version 4.6.6deb5
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost:3306
-- Tiempo de generación: 20-06-2019 a las 12:44:28
-- Versión del servidor: 5.7.26-0ubuntu0.18.04.1
-- Versión de PHP: 7.2.19-0ubuntu0.18.04.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
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
-- Volcado de datos para la tabla `earticulo`
--

INSERT INTO `earticulo` (`k`, `iStock`, `sNombre`, `xTipo_k`, `xMarca_k`, `sDescripcion`, `dPrecio`, `sImagen`) VALUES
(1, 23, 'Anillos de Gimnasio Olímpico', 1, 1, 'Los anillos son gruesos y sólidos y no tienen ninguna astilla o agujeros de ninguna clase, funcionan sus manos por todas partes de ellas y son apenas lisas y sólidas. El material de madera sólida proporciona un excelente agarre sin deslizamiento incluso cuando las palmas comienzan a sudar. Diámetro perfecto de los anillos.\r\n\r\nCaracterísticas\r\n- Diámetro: 235mm\r\n- Diámetro interno: 172mm\r\n- Anillo Espesor: 32mm\r\n- Longitud de la correa: 4.57m\r\n- Ancho de la correa: 38mm\r\n- Peso: 1.82kg\r\n- Capacidad: 365kg.', '32.99', 'anillas1.jpg'),
(2, 23, 'Anillas de Gimnasia para Entrenamiento', 1, 2, 'Anillos de la gimnasia de madera con correas de la hebilla, aros de ejercicio multifunción ajustable.\r\n\r\nCaracterísticas:\r\n- Material: madera de haya / Abedul\r\n- Correas : Ancho en 28 mm\r\n- Correas de nylon correa: 2.5cm x (450520) cm\r\n- Diámetro del tubo del anillo: 32 mm\r\n- Diámetro exterior: 230 mm\r\n- Carga máxima: hasta 300 kg', '26.99', 'anillas2.jpg'),
(3, 76, 'Magnesio Líquido. Tubo de 200 ML', 2, 5, 'AGARRE INMEJORABLE.\r\nEl magnesio líquido le proporciona un agarre más firme, especialmente útil para la escalada y otras actividades deportivas que exijan una presa fiable. Olvídese de las manos sudorosas gracias al agarre perfecto que garantiza nuestro magnesio líquido.\r\n\r\nMÁXIMA CALIDAD. \r\nFabricado en Europa, el magnesio líquido de VIA FORTIS ha superado todos los controles de calidad exigidos. Escoja lo mejor: su piel se lo agradecerá.\r\n\r\nSIN MANCHAS. \r\nA diferencia de las bolas de magnesio, el magnesio líquido no deja manchas. Muchos gimnasios no permiten utilizar magnesio en polvo, por lo que los usuarios se decantan por el magnesio líquido, con la confianza de poder utilizarlo en cualquier lugar. El magnesio seco puede arruinar las prendas textiles, algo que no sucede con el magnesio líquido.', '12.90', 'magnesio1.jpg'),
(4, 30, 'Anillas Olímpicas Gimnasia y Crossfit - Correas Numeradas', 1, 3, 'AGARRE PERFECTO (AUNQUE TE SUDEN LAS MANOS) - Hechas en madera de abedul laminado, nuestras anillas tienen un tacto suave y sedoso proporcionando un agarre como ningún otro material. Anillas que no resbalan te aseguran el máximo rendimiento en los ejercicios más extremos con una confianza absoluta. Olvídate de los plásticos, olvídate del sudor, centrate en tus entrenamientos y wods para mejorar cada día.\r\n\r\nGRAN SENSACIÓN DE SEGURIDAD - Cintas que no se rompen. Lesionarse por culpa de un material defectuoso o de mala calidad es cosa seria. Nuestras anillas usan las cintas más resistentes y anchas del mercado (38mm frente a los habituales 25mm). La capacidad de resistencia de las correas es de 362kg. Estas son las anillas de suspensión más seguras que puedes encontrar y que te permitirán dar el máximo de ti sin tener que preocuparte.', '39.95', 'anillas3.jpg'),
(5, 40, 'Magnesio de Escalada', 2, 5, 'Material duro MAMMUT\r\nMagnesio Montañismo, alpinismo y trekking Unisex Adulto\r\nLiquid 200 Ml (2290-00611-9001)', '13.36', 'magnesio2.jpg'),
(6, 28, 'Predator Protein 2Kg', 6, 11, 'Beneficios y Funciones:\r\n\r\n    Contiene 100 % proteína concentrado de alta calidad (W.P.C.).\r\n    Promueve el crecimiento muscular.\r\n    Mejora la recuperación muscular.\r\n    Inhibe el catabolismo muscular.\r\n    Contiene encimas digestivas DIGEZYME®.\r\n    Totalmente libre de aspartamo.\r\n\r\nPresentación: 2kg.', '50.90', '1558073820-amix-predator-2-kg.jpg'),
(7, 32, 'Set de 3 Bandas de Resistencia de Rubberbanditz', 18, 9, 'El complemento perfecto\r\nAyudando a los levantadores de potencia a romper los récords y hacer avances monumentales en el rendimiento durante más de 10 años, las bandas de potencia han sido una herramienta esencial para muchos Goliats de hoy en día para ayudar a superar las mesetas de entrenamiento y probar su fuerza definitiva.\r\n\r\n¿Cómo funcionan las bandas de levantamiento de potencia?\r\nEl levantamiento de fuerza y ​​olímpico con bandas ofrece una resistencia ascendente en todo su rango de movimiento, proporcionando una relación armoniosa con sus músculos. A medida que los músculos se contraen y ejercen fuerza, las bandas se estiran más y la resistencia aumenta. En su punto más débil, generalmente en la posición inicial, las bandas ofrecen una resistencia mínima para ayudarlo a superar el &quot;punto de adherencia&quot; (por ejemplo, el punto más bajo de una sentadilla o press de banca). Luego, a medida que se extiende a lo largo de su repetición, la tensión de la banda de levantamiento de pesas aumenta gradualmente, lo que permite una eficiencia de fortalecimiento muscular óptima que no se puede lograr simplemente por la fuerza de la gravedad.\r\n\r\n¿Qué banda es la adecuada para mí?\r\n* (Nombre): (Espesor) - (Resistencia aproximada)\r\n* Banda de luz: 1/4 &quot;- 5 a 15 lbs (2-7kg)\r\n* Banda media: 1/2 &quot;- 20 a 35 lbs (9-16 kg)\r\n* Banda pesada: 3/4 &quot;- 30 a 50 lb (14-23 kg)\r\n* Banda robusta: 1 1/8 &quot;- 40 a 80 lbs (18-36kg)\r\n* Banda de potencia: 1 3/4 &quot;- 50 a 120 lbs (23-54kg)\r\n* Banda fuerte: 2 1/2 &quot;- 60 a 150 lbs (27-68kg)\r\n* Banda de monstruos: 4 &quot;- 80 a 200 lbs (36-91kg)', '88.05', '1558074190-6105CTdFeFL._SL1210_.jpg'),
(8, 16, 'PURE 100% WHEY 2,27 Kg', 6, 13, 'Pure 100% Whey. Características principales:\r\n\r\n    119 kcal por dosis*.\r\n    Proteínas 100% a partir del suero de leche.\r\n    Alto contenido en proteínas.\r\n    79.3 % proteínas.\r\n    Hasta 10.37 gramos de aminoácidos esenciales.\r\n    Hasta 4.33 gramos de BCAA por dosis.\r\n    6.8 % carbohidratos.\r\n    5.9 % grasas.\r\n    Sin azúcares añadidos.\r\n    Bajo contenido en azúcares.\r\n    Calidad y pureza garantizada.\r\n    Apto para vegetarianos que consumen lácteos.\r\n    Sabores increíbles.\r\n    Enriquecido con enzimas digestivas.\r\n    Envase de 2.27 kg (75 dosis).', '42.99', '1558074406-pure-nutrition-pure-100-whey-2270g.jpg'),
(9, 50, 'Paralelas para Dips y Handstands', 3, 14, 'Cada barra es de 24 &quot;de ancho, 31&quot; de alto y se puede ajustar hasta 35 &quot;, por lo que puede configurarla en paralelo o escalonada para una mayor variedad de ejercicios\r\n\r\nLos tubos resistentes de hierro con recubrimiento en polvo pueden soportar hasta 400 libras, para que pueda entrenar de manera segura el pecho, tríceps, hombros y centro', '52.99', '1558074926-71LOvXwZACL._SL1500_.jpg'),
(10, 59, 'Anclle Wooden PBars', 3, 15, 'Para el ejercicio físico, el fulcro triangular es más estable; el estante corto reduce la fuerza, la balanza no vibra y los dos lados son fijos y firmes.\r\n\r\nLa madera de carbón es sólida y duradera, resistente a las polillas y resistente, absorbe el sudor y es antideslizante con efecto amortiguador.\r\n\r\nFácil de instalar: se puede montar y desmontar sin necesidad de herramientas en pocos segundos. Se adapta incluso en un paquete de bolsas pequeñas y no pesa mucho.\r\n\r\nLas flexiones son la forma más sencilla y efectiva de ejercitar los músculos del pecho. Equipo de fitness perfecto, fácil de llevar, diseño simple y práctico.\r\n\r\nEl estante puede soportar una carga pesada, el producto 25CM puede soportar aproximadamente 300-400KG, el producto 50CM puede soportar aproximadamente 200-300KG', '27.78', '1558075302-61OgIPr4nML._SL1001_.jpg'),
(11, 30, 'Rodillo para abdominales hipopresivos, rueda de aerobic, AB roller', 5, 16, 'Rueda de ejercicio con asideros de PVC y varilla de acero. Ligera y portátil, con un peso de 522 gramos, ayuda a la escultura del cuerpo. Su uso ayuda a reafirmar, tensar y aplanar el abdomen, además de que también ayudará a fortalecer los brazo, los hombros y los músculos de la espalda.', '12.90', '1558960764-81UFnDNic5L._SL1500_.jpg');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `elog`
--

CREATE TABLE `elog` (
  `k` int(11) NOT NULL,
  `sTipo` text COLLATE latin1_spanish_ci NOT NULL,
  `sDescripcion` text COLLATE latin1_spanish_ci NOT NULL,
  `sTimestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

--
-- Volcado de datos para la tabla `elog`
--

INSERT INTO `elog` (`k`, `sTipo`, `sDescripcion`, `sTimestamp`) VALUES
(6, 'info', 'zarzanduil se ha logueado', '2019-06-10 10:21:23'),
(7, 'info', 'fer se ha logueado', '2019-06-10 10:21:28'),
(8, 'info', '0xefro se ha logueado', '2019-06-10 10:21:34'),
(10, 'info', 'vasyl.havrylyuk se ha registrado', '2019-06-10 11:03:30'),
(11, 'info', 'vasyl.havrylyuk se ha logueado', '2019-06-10 11:04:56'),
(12, 'info', 'undefined ha actualizado su cuenta', '2019-06-10 11:24:45'),
(13, 'info', 'vasyl.havrylyuky ha actualizado su cuenta', '2019-06-10 11:26:03'),
(14, 'info', 'vasyl.havrylyuk ha actualizado su cuenta', '2019-06-10 11:27:17'),
(15, 'info', 'vasyl.havrylyuk ha actualizado su cuenta', '2019-06-10 11:27:39'),
(16, 'info', 'undefined ha realizado el pedido #42', '2019-06-10 11:43:26'),
(17, 'info', '0xefro se ha logueado', '2019-06-10 11:44:59'),
(18, 'info', '0xefro ha realizado el pedido #43', '2019-06-10 11:52:05'),
(20, 'info', ' se ha logueado', '2019-06-10 12:04:32'),
(21, 'info', ' se ha logueado', '2019-06-10 12:06:57'),
(22, 'info', ' se ha logueado', '2019-06-10 12:07:11'),
(23, 'info', 'se ha logueado', '2019-06-10 12:27:03'),
(24, 'info', 'Moises se ha logueado', '2019-06-10 12:29:01'),
(25, 'info', 'Vasyl se ha logueado', '2019-06-10 12:31:11'),
(26, 'info', 'Vasyl se ha logueado', '2019-06-10 12:32:40'),
(27, 'info', 'Vasyl ha insertado un nuevo artículo', '2019-06-10 12:37:42'),
(28, 'info', 'Moises se ha logueado', '2019-06-10 12:38:12'),
(29, 'info', 'Moises eliminó una categoria', '2019-06-10 12:40:18'),
(30, 'info', 'Moises actualizó una categoria', '2019-06-10 12:40:49'),
(31, 'info', ' ha cerrado la sesión', '2019-06-10 12:41:40'),
(32, 'info', 'Moises se ha logueado', '2019-06-10 12:42:08'),
(33, 'info', 'Moises ha cerrado la sesión', '2019-06-10 12:42:13'),
(34, 'info', 'Vasyl se ha logueado', '2019-06-10 12:42:36'),
(35, 'info', '0xefro eliminó una categoria', '2019-06-10 12:43:06'),
(36, 'info', '0xefro eliminó un usuario', '2019-06-10 12:48:22'),
(37, 'info', '10minutemail se ha logueado', '2019-06-10 13:02:43'),
(38, 'info', 'Vlad se ha registrado', '2019-06-10 13:40:10'),
(39, 'info', 'Vlad se ha logueado', '2019-06-10 13:47:24'),
(40, 'info', '0xefro se ha logueado', '2019-06-10 13:49:47'),
(41, 'info', 'Vlad se ha logueado', '2019-06-10 13:51:58'),
(42, 'info', 'Vlad se ha logueado', '2019-06-10 14:10:12'),
(43, 'info', 'Vlad se ha logueado', '2019-06-10 14:36:54'),
(44, 'info', 'Vlad ha realizado el pedido #44', '2019-06-10 14:38:31'),
(45, 'info', '0xefro se ha logueado', '2019-06-10 14:45:01'),
(46, 'info', '0xefro actualizó un usuario', '2019-06-10 14:45:44'),
(47, 'info', 'Vlad se ha logueado', '2019-06-10 14:46:55'),
(48, 'info', '0xefro se ha logueado', '2019-06-10 18:11:46'),
(49, 'info', '   0xefro se ha registrado', '2019-06-12 10:07:53'),
(50, 'info', '0xefro se ha registrado', '2019-06-12 10:09:07'),
(51, 'info', '0xefro se ha logueado', '2019-06-12 10:09:42'),
(52, 'info', '0xefro ha realizado el pedido #45', '2019-06-12 10:11:21'),
(53, 'info', 'jorge.belinchon se ha registrado', '2019-06-12 14:03:15'),
(54, 'info', 'jorge.belinchon se ha logueado', '2019-06-12 14:05:50'),
(55, 'info', 'fer se ha logueado', '2019-06-20 11:12:00'),
(56, 'info', 'fer ha realizado el pedido #46', '2019-06-20 11:12:59'),
(57, 'info', 'profesores se ha registrado', '2019-06-20 11:52:19'),
(58, 'info', 'profesores se ha registrado', '2019-06-20 11:52:47'),
(59, 'info', 'fer se ha logueado', '2019-06-20 11:53:25');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `emarca`
--

CREATE TABLE `emarca` (
  `k` int(11) NOT NULL,
  `sNombre` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `emarca`
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
(15, 'Anclle'),
(16, 'Body Sculpture');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `epedido`
--

CREATE TABLE `epedido` (
  `k` int(11) NOT NULL,
  `xUsuario_k` int(11) NOT NULL,
  `dFecha` date NOT NULL,
  `sDireccion` varchar(255) NOT NULL,
  `bEnviado` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `epedido`
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
(34, 34, '2019-05-16', 'c/ JAJA', 1),
(35, 1, '2019-05-16', 'c/Desarrollo 50, 72B', 1),
(36, 1, '2019-05-17', 'c/Desarrollo 50, 72B', 1),
(38, 38, '2019-05-27', 'Calle la Moraleja', 1),
(39, 38, '2019-05-27', 'Calle la Moraleja', 1),
(40, 38, '2019-06-10', 'Calle la Moraleja', 1),
(41, 38, '2019-06-10', 'Calle la Moraleja', 1),
(43, 1, '2019-06-10', 'c/Desarrollo 50, 72B', 0),
(44, 43, '2019-06-10', 'Calle vasyl', 0),
(46, 14, '2019-06-20', 'c/Cedaceros, 11', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `etipo`
--

CREATE TABLE `etipo` (
  `k` int(11) NOT NULL,
  `sNombre` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `etipo`
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
-- Estructura de tabla para la tabla `eusuario`
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
-- Volcado de datos para la tabla `eusuario`
--

INSERT INTO `eusuario` (`k`, `sUser`, `sNombre`, `sApellido`, `sDni`, `sDireccion`, `sEmail`, `dFechaRegistro`, `bAdministrador`, `sPassword`, `bStatus`) VALUES
(1, '0xefro', 'Vasyl', 'Havrylyuk', '12345678F', 'c/Desarrollo 50, 72B', '0xefro@gmail.com', '2019-02-28', 1, '3c9909afec25354d551dae21590bb26e38d53f2173b8d3dc3eee4c047e7ab1c1eb8b85103e3be7ba613b31bb5c9c36214dc9f14a42fd7a2fdb84856bca5c44c2', 1),
(4, 'vasyl_workout', 'Vasyl', 'Havrylyuk', '32145365J', 'c/Jabonera, n54', 'vrylyuk@gmail.com', '2019-03-01', 0, '84a0ce8e54e7f5bef1050e7d77e76422f9f3161d62376077bd694f1c02c180963ed069517a0234ca344156cdf891356154094a91d8b7a3352b990ce0a42c64a8', 1),
(14, 'fer', 'Fernando', 'Alonso', '99988779K', 'c/Cedaceros, 11', 'fer@gmail.com', '2019-05-08', 0, '84a0ce8e54e7f5bef1050e7d77e76422f9f3161d62376077bd694f1c02c180963ed069517a0234ca344156cdf891356154094a91d8b7a3352b990ce0a42c64a8', 1),
(16, 'viktor', 'Viktor', 'Havrylyuk', 'K9899941G', 'c/Zhvyrka, n5', 'viktor@gmail.com', '2019-05-14', 0, '84a0ce8e54e7f5bef1050e7d77e76422f9f3161d62376077bd694f1c02c180963ed069517a0234ca344156cdf891356154094a91d8b7a3352b990ce0a42c64a8', 1),
(24, 'pepe', 'Pepito', 'Pérez', '12345678k', 'c/Desarrollo', 'pepe@gmail.com', '2019-05-16', 0, '84a0ce8e54e7f5bef1050e7d77e76422f9f3161d62376077bd694f1c02c180963ed069517a0234ca344156cdf891356154094a91d8b7a3352b990ce0a42c64a8', 1),
(34, 'sisnet', 'SISnet', 'Netijam', '11221123B', 'c/ JAJA', '0xefro3@gmail.com', '2019-05-16', 0, '84a0ce8e54e7f5bef1050e7d77e76422f9f3161d62376077bd694f1c02c180963ed069517a0234ca344156cdf891356154094a91d8b7a3352b990ce0a42c64a8', 1),
(37, 'Vladitor311', 'Vlad', 'Tomus', 'Y0440746Q', 'La paz', 'Vlad_tomus31@yahoo.com', '2019-05-16', 0, '8cf4ccfa5c95c7a35f957a360bad68925d88dc388687181ec9a95462cb3ab09c8c2dccb413c66e20953ae995889c6e61ca4c4a873f0dda8a3e991e00bf3a0893', 1),
(38, 'zarzanduil', 'Jorge', 'Belinchón', '66666666H', 'Calle la Moraleja', 'zarzanduil.96@gmail.com', '2019-05-27', 0, '84a0ce8e54e7f5bef1050e7d77e76422f9f3161d62376077bd694f1c02c180963ed069517a0234ca344156cdf891356154094a91d8b7a3352b990ce0a42c64a8', 1),
(41, '0xefro2', 'Vasyl', 'Havrylyuk', '12345678N', 'c/Carrera, 4', '0xefro2@gmail.com', '2019-06-10', 0, '84a0ce8e54e7f5bef1050e7d77e76422f9f3161d62376077bd694f1c02c180963ed069517a0234ca344156cdf891356154094a91d8b7a3352b990ce0a42c64a8', 0),
(43, 'Vlad', 'Vlad', 'Vlad', 'Y0430746Q', 'Calle vasyl', 'vladitor31@yahoo.es', '2019-06-10', 1, 'a3d14b555eba4d047383870b9d5742cac9a361ce17132fde400ca31d94041e93a7afd32f0882bd1fc8a71b5d2a5948246f8eeca0b9d7824ab5ab974ad8b3cf25', 1),
(46, 'jorge.belinchon', 'Jorge', 'Belinchon', '47586048Z', 'c/Moraleja de Enmedio 13 5 D', 'jorge.belinchon@sisnet360.com', '2019-06-12', 0, '51b9238513fcd4cd5e00ae1e806bd10b52e114771814371900add396ddc0b8b65ee83747b5cd5d27151edc25387f081863c90bdbde2bad8156ef38666ad999f9', 1),
(48, 'profesores', 'Profes', 'Cañaveral', '12345678D', 'Av Onu', 'b1303623@urhen.com', '2019-06-20', 0, '84a0ce8e54e7f5bef1050e7d77e76422f9f3161d62376077bd694f1c02c180963ed069517a0234ca344156cdf891356154094a91d8b7a3352b990ce0a42c64a8', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rpedidoarticulo`
--

CREATE TABLE `rpedidoarticulo` (
  `k` int(11) NOT NULL,
  `xPedido_k` int(11) NOT NULL,
  `xArticulo_k` int(11) NOT NULL,
  `iCantidad` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `rpedidoarticulo`
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
(49, 34, 1, 12),
(50, 34, 5, 1),
(51, 35, 5, 1),
(52, 36, 1, 1),
(54, 38, 1, 1),
(55, 39, 2, 69),
(56, 39, 1, 33),
(57, 39, 3, 23),
(58, 39, 4, 24),
(59, 39, 5, 15),
(60, 39, 9, 70),
(61, 39, 10, 34),
(62, 40, 10, 1),
(63, 40, 7, 1),
(64, 41, 3, 1),
(67, 43, 3, 1),
(68, 44, 1, 5),
(70, 46, 2, 4);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `earticulo`
--
ALTER TABLE `earticulo`
  ADD PRIMARY KEY (`k`),
  ADD KEY `Categoria_idx` (`xTipo_k`),
  ADD KEY `Marca_idx` (`xMarca_k`);

--
-- Indices de la tabla `elog`
--
ALTER TABLE `elog`
  ADD PRIMARY KEY (`k`);

--
-- Indices de la tabla `emarca`
--
ALTER TABLE `emarca`
  ADD PRIMARY KEY (`k`);

--
-- Indices de la tabla `epedido`
--
ALTER TABLE `epedido`
  ADD PRIMARY KEY (`k`),
  ADD KEY `Usuario_idx` (`xUsuario_k`);

--
-- Indices de la tabla `etipo`
--
ALTER TABLE `etipo`
  ADD PRIMARY KEY (`k`);

--
-- Indices de la tabla `eusuario`
--
ALTER TABLE `eusuario`
  ADD PRIMARY KEY (`k`);

--
-- Indices de la tabla `rpedidoarticulo`
--
ALTER TABLE `rpedidoarticulo`
  ADD PRIMARY KEY (`k`),
  ADD KEY `Pedido_idx` (`xPedido_k`),
  ADD KEY `Articulo_idx` (`xArticulo_k`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `earticulo`
--
ALTER TABLE `earticulo`
  MODIFY `k` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT de la tabla `elog`
--
ALTER TABLE `elog`
  MODIFY `k` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=60;
--
-- AUTO_INCREMENT de la tabla `emarca`
--
ALTER TABLE `emarca`
  MODIFY `k` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;
--
-- AUTO_INCREMENT de la tabla `epedido`
--
ALTER TABLE `epedido`
  MODIFY `k` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;
--
-- AUTO_INCREMENT de la tabla `etipo`
--
ALTER TABLE `etipo`
  MODIFY `k` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;
--
-- AUTO_INCREMENT de la tabla `eusuario`
--
ALTER TABLE `eusuario`
  MODIFY `k` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;
--
-- AUTO_INCREMENT de la tabla `rpedidoarticulo`
--
ALTER TABLE `rpedidoarticulo`
  MODIFY `k` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=71;
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

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
