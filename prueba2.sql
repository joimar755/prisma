-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Versión del servidor:         8.0.30 - MySQL Community Server - GPL
-- SO del servidor:              Win64
-- HeidiSQL Versión:             12.1.0.6537
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

-- Volcando datos para la tabla persona.category: ~7 rows (aproximadamente)
INSERT INTO `category` (`id`, `name`, `description`) VALUES
	(1, 'Gaseosa', 'Gaseosa'),
	(2, 'Panadería', 'Panadería'),
	(3, 'Productos gourmet', 'Productos gourmet'),
	(4, 'Embutidos', 'Embutidos'),
	(5, 'Productos de repostería', 'Productos de repostería'),
	(6, 'Productos desechables', 'Productos desechables'),
	(7, 'Grasas y aceites', 'Grasas y aceites');

-- Volcando datos para la tabla persona.detalle: ~48 rows (aproximadamente)
INSERT INTO `detalle` (`id`, `product_id`, `Subtotal`, `cantidad`, `createdAt`, `ventaId`) VALUES
	(1, 1, 15600, 3, '2024-06-16 15:18:57.004', 1),
	(2, 5, 48000, 4, '2024-06-16 15:18:57.004', 1),
	(3, 37, 9000, 3, '2024-06-16 15:18:57.004', 1),
	(4, 41, 30000, 3, '2024-06-16 15:18:57.004', 1),
	(5, 40, 21000, 3, '2024-06-16 16:41:01.589', 2),
	(6, 41, 40000, 4, '2024-06-16 16:41:01.589', 2),
	(7, 42, 60000, 3, '2024-06-16 16:41:01.589', 2),
	(8, 37, 9000, 3, '2024-06-16 16:41:01.589', 2),
	(9, 84, 1600, 1, '2024-06-17 22:00:15.177', 3),
	(10, 50, 3000, 6, '2024-06-17 22:00:15.177', 3),
	(11, 47, 4000, 1, '2024-06-17 22:00:15.177', 3),
	(16, 36, 13000, 5, '2024-06-18 21:01:58.808', 12),
	(21, 48, 60000, 5, '2024-06-18 21:24:44.622', 16),
	(23, 84, 42000, 3.5, '2024-06-18 21:28:41.799', 18),
	(34, 6, 14040, 3.6, '2024-06-18 21:44:05.572', 24),
	(35, 61, 5850, 1.5, '2024-06-18 23:11:20.570', 25),
	(36, 61, 19500, 7.5, '2024-06-19 03:56:00.046', 26),
	(37, 3, 1500, 1, '2024-06-19 03:56:00.046', 26),
	(38, 55, 5500, 1, '2024-06-19 16:53:07.535', 27),
	(39, 93, 400, 1, '2024-06-19 16:53:07.535', 27),
	(40, 92, 6000, 10, '2024-06-19 16:53:07.535', 27),
	(104, 41, 7200, 3, '2024-06-19 21:50:45.886', 49),
	(105, 92, 2000, 0.5, '2024-06-19 21:50:45.886', 49),
	(106, 91, 2400, 8, '2024-06-20 16:16:41.613', 50),
	(107, 95, 1000, 2, '2024-06-20 16:16:41.613', 50),
	(108, 96, 4500, 15, '2024-06-20 16:42:28.627', 51),
	(109, 52, 7560, 18, '2024-06-20 16:42:28.627', 51),
	(110, 92, 1200, 2, '2024-06-21 17:38:50.721', 52),
	(111, 101, 6000, 1, '2024-06-21 17:38:50.721', 52),
	(112, 54, 6500, 0.5, '2024-06-21 17:38:50.721', 52),
	(113, 107, 5500, 1, '2024-06-21 18:29:21.779', 53),
	(114, 89, 5000, 1, '2024-06-21 18:29:21.779', 53),
	(115, 102, 960, 6, '2024-06-21 18:36:56.310', 54),
	(116, 6, 2400, 1, '2024-06-21 18:36:56.310', 54),
	(117, 97, 2737.6, 0.472, '2024-06-21 18:36:56.310', 54),
	(118, 94, 2600, 2, '2024-06-21 18:45:00.422', 55),
	(119, 75, 2000, 4, '2024-06-21 18:45:00.422', 55),
	(120, 6, 6700, 1, '2024-06-24 06:19:33.895', 56),
	(121, 83, 10400, 2, '2024-06-24 06:19:33.895', 56),
	(122, 3, 1500, 1, '2024-06-24 06:19:33.895', 56),
	(123, 96, 3000, 10, '2024-06-26 18:06:06.993', 57),
	(124, 52, 6300, 15, '2024-06-26 18:06:06.993', 57),
	(125, 5, 4800, 0.4, '2024-07-19 06:22:41.633', 58),
	(126, 5, 42000, 3.5, '2024-07-22 05:00:22.547', 59),
	(127, 2, 4300, 1, '2024-07-22 05:00:22.547', 59),
	(128, 47, 12000, 3, '2024-07-22 05:00:22.547', 59),
	(129, 45, 4500, 1, '2024-07-22 05:00:22.547', 59),
	(130, 4, 6600, 3, '2024-07-24 15:18:05.487', 60);

-- Volcando datos para la tabla persona.product: ~84 rows (aproximadamente)
INSERT INTO `product` (`id`, `name`, `price`, `category_id`, `Stock`, `description`) VALUES
	(1, 'Coca cola', 5200, 1, 10, 'Coca cola'),
	(2, 'Postobon', 4300, 1, 10, 'Postobon'),
	(3, 'vasos 7onz caribe', 1500, 6, 20, 'vasos 7onz caribe'),
	(4, 'vasos 3.3onz color', 2200, 6, 20, 'vasos 3.3onz color'),
	(5, 'astra', 12000, 7, 500, 'astra'),
	(6, 'pan super', 6700, 2, 5, 'pan super'),
	(36, 'bolsa 3 k ', 2500, 6, 10, 'bolsa 3 k '),
	(37, 'bolsa 5 k', 3800, 6, 10, 'bolsa 5 k'),
	(40, 'bolsa 10 k', 4600, 6, 20, 'bolsa 10 k'),
	(41, 'bolsa 15 k', 6000, 6, 10, 'bolsa 15 k'),
	(42, 'bolsa 20 k', 20000, 6, 10, 'bolsa 20 k'),
	(43, 'bolsa 30 k transparente', 9500, 6, 10, 'bolsa 30 k transparente'),
	(44, 'vasos 9 onz', 2200, 6, 10, 'vasos 9 onz'),
	(45, 'servilleta ', 4500, 6, 10, 'servilleta'),
	(46, 'vasos 5 onz', 2499, 6, 10, 'vasos 5 onz'),
	(47, 'pan mini', 4000, 2, 10, 'pan mini'),
	(48, 'crema de leche x 200gr', 4500, 5, 10, '200gr'),
	(50, 'porta comida j1', 500, 6, 50, 'portacomida'),
	(52, 'porta comida j2', 420, 6, 50, 'portacomida j2'),
	(53, 'bolsa papel #2', 4400, 6, 10, 'papel #2'),
	(54, 'bolsa papel #3', 5400, 6, 10, 'papel #3'),
	(55, 'cucharas x 100', 5500, 6, 10, 'cuchara'),
	(56, 'tenedor x 100', 5000, 6, 10, 'tenedor'),
	(57, 'cuchillo x 100', 4800, 6, 10, 'cuchillo'),
	(59, 'cuchara pequeña x 100', 2700, 6, 10, 'cuchara pequeña'),
	(60, 'vasos 16onz hico', 5500, 6, 10, 'hicopor'),
	(61, 'vasos 7onz tuc', 1500, 6, 10, 'vasos 7onz tuc'),
	(62, 'Bolsa 6x9 color', 700, 6, 20, 'Bolsa 6x9 color'),
	(63, 'Bolsa 8x12 color', 1000, 6, 50, 'Bolsa 8x12 color'),
	(64, 'bolsa 7x10 color ', 800, 6, 50, 'bolsa 7x10 color '),
	(65, 'bolsa 10x14 color ', 1500, 6, 50, 'bolsa 10x14 color '),
	(66, 'bolsa transparente  6x9', 1000, 6, 50, 'bolsa transparente  6x9'),
	(67, 'bolsa transparente  7x10', 1300, 6, 50, 'bolsa transparente  7x10'),
	(68, 'bolsa transparente  7x14', 1600, 6, 50, 'bolsa transparente  7x14'),
	(69, 'bolsa transparente  8x12', 1600, 6, 50, 'bolsa transparente  8x12'),
	(70, 'bolsa transparente  8x14', 1800, 6, 50, 'bolsa transparente  8x14'),
	(71, 'bolsa transparente  8x18', 2400, 6, 50, 'bolsa transparente  8x18'),
	(72, 'bolsa transparente  9x14', 2300, 6, 50, 'bolsa transparente  9x14'),
	(73, 'bolsa transparente  10x14', 2600, 6, 50, 'bolsa transparente  10x14'),
	(74, 'bolsa transparente  10x16', 2600, 6, 50, 'bolsa transparente  10x16'),
	(75, 'bolsa transparente  2 1/2  x 9 boly', 500, 6, 50, 'bolsa transparente  2 1/2  x 9 boly'),
	(76, 'bolsa 5 k zarco', 3400, 6, 50, 'bolsa 5 k zarco'),
	(77, 'bolsa 10 k zarco', 4000, 6, 50, 'bolsa 10 k zarco'),
	(78, 'papel aluminio 7mt', 3800, 6, 50, 'papel aluminio  7mt'),
	(79, 'papel aluminio 21mt', 7000, 6, 50, 'papel aluminio  21mt'),
	(80, 'papel aluminio 40mt', 13900, 6, 50, 'papel aluminio  40mt'),
	(81, 'papel aluminio 100mt', 13900, 6, 50, 'papel aluminio  100mt'),
	(82, 'papel parafinado', 8000, 6, 50, 'papel parafinado'),
	(83, 'pan hamburguesa', 5200, 2, 6, 'pan hamburguesa'),
	(84, 'tangelo', 1600, 1, 10, 'tangelo'),
	(85, 'plato #12 hicopor', 1500, 6, 10, 'plato #12 hicopor'),
	(86, 'plato #15 hicopor', 2500, 6, 10, 'plato #15 hicopor'),
	(87, 'plato #18 hicopor', 3400, 6, 10, 'plato #18 hicopor'),
	(88, 'plato #20 hicopor', 4200, 6, 10, 'plato #20 hicopor'),
	(89, 'plato #23 hicopor', 5000, 6, 10, 'plato #23 hicopor'),
	(90, 'plato #26 hicopor', 6300, 6, 10, 'plato #26 hicopor'),
	(91, 'c1 porta', 300, 6, 500, 'c1 porta'),
	(92, 'recipiente aluminio 16onz sin tapa', 600, 6, 20, 'recipiente aluminio 16onz sin tapa'),
	(93, 'cuchara x 10 pequena', 400, 6, 20, 'cuchara x 10 pequena'),
	(94, 'tangelo pequeño', 1300, 1, 10, 'tangelo pequeño'),
	(95, 'p3 porta', 500, 6, 20, 'p3 porta'),
	(96, 'contenedor #16 unidad', 300, 6, 20, 'contenedor #16'),
	(97, '15 x 22 bolsa transparente', 5300, 6, 20, '15 x 22 bolsa transparente'),
	(98, '10 x 16 bolsa transparente', 2700, 6, 20, '10 x 16 bolsa transparente'),
	(99, '12 x 18 transparente ', 3600, 6, 20, '12 x 18 transparente '),
	(101, 'ponque x 6 porciones ramo', 6000, 2, 5, 'ponque x 6 porciones ramo'),
	(102, 'bandeja hicopor #17', 160, 6, 50, 'bandeja hicopor #17'),
	(103, 'bandeja hicopor #4', 250, 6, 50, 'bandeja hicopor #4'),
	(104, 'bandeja hicopor #10', 250, 6, 50, 'bandeja hicopor #10'),
	(105, 'bandeja hicopor #7', 200, 6, 50, 'bandeja hicopor #7'),
	(106, 'bandeja hicopor #1', 130, 6, 20, 'bandeja hicopor #1'),
	(107, 'tenedores x 100', 5500, 6, 20, 'tenedores x 100'),
	(108, 'papa chongo kilo', 15000, 5, 5, 'papa chongo kilo'),
	(109, 'salchicha delichick x26', 16000, 4, 5, 'salchicha delichick x26'),
	(110, 'salsa tomate bolson ', 29000, 5, 5, 'salsa tomate bolson '),
	(111, 'mayonesa bolson ', 29000, 5, 5, 'mayonesa bolson '),
	(112, 'vitina libra', 5800, 3, 6, 'vitina libra'),
	(113, 'Vitina x libra', 6500, 7, 5, 'Vitina  x libra'),
	(114, 'harina repostera ', 2400, 5, 25000, 'harina repostera '),
	(115, 'astor', 3300, 7, 500, 'astor'),
	(116, 'contenedor # 16 paquete', 6000, 6, 5, 'contenedor # 16 paquete'),
	(117, 'contenedor # 24 paquete', 6600, 6, 5, 'contenedor # 24 paquete'),
	(118, 'contenedor # 24 unidad', 400, 6, 60, 'contenedor # 24 unidad'),
	(119, 'bolsa 2k ', 2200, 6, 10, 'bolsa 2k ');

-- Volcando datos para la tabla persona.users: ~1 rows (aproximadamente)
INSERT INTO `users` (`id`, `name`, `email`, `password`) VALUES
	(1, 'joimar', 'joimar19@gmail.com', '$2b$12$6LXKtD14.dkXZNcEcRAHkuul/MyBZPp.1F/XRPtNAfat7mCOXuTjS');

-- Volcando datos para la tabla persona.venta: ~23 rows (aproximadamente)
INSERT INTO `venta` (`id`, `total`, `createdAt`) VALUES
	(1, 102600, '2024-06-16 15:18:57.004'),
	(2, 130000, '2024-06-16 16:41:01.589'),
	(3, 8600, '2024-06-17 22:00:15.177'),
	(4, 0, '2024-06-18 19:58:17.439'),
	(12, 13000, '2024-06-18 21:01:58.808'),
	(16, 60000, '2024-06-18 21:24:44.622'),
	(18, 42000, '2024-06-18 21:28:41.799'),
	(24, 14040, '2024-06-18 21:44:05.572'),
	(25, 5850, '2024-06-18 23:11:20.570'),
	(26, 21000, '2024-06-19 03:56:00.046'),
	(27, 11900, '2024-06-19 16:53:07.535'),
	(49, 9200, '2024-06-19 21:50:45.886'),
	(50, 3400, '2024-06-20 16:16:41.613'),
	(51, 12060, '2024-06-20 16:42:28.627'),
	(52, 13700, '2024-06-21 17:38:50.721'),
	(53, 10500, '2024-06-21 18:29:21.779'),
	(54, 6097.6, '2024-06-21 18:36:56.310'),
	(55, 4600, '2024-06-21 18:45:00.422'),
	(56, 18600, '2024-06-24 06:19:33.895'),
	(57, 9300, '2024-06-26 18:06:06.993'),
	(58, 4800, '2024-07-19 06:22:41.633'),
	(59, 62800, '2024-07-22 05:00:22.547'),
	(60, 6600, '2024-07-24 15:18:05.487');

-- Volcando datos para la tabla persona._prisma_migrations: ~0 rows (aproximadamente)
INSERT INTO `_prisma_migrations` (`id`, `checksum`, `finished_at`, `migration_name`, `logs`, `rolled_back_at`, `started_at`, `applied_steps_count`) VALUES
	('1bf5a6f3-9461-48b4-b2bb-41fda9669df5', '742e7194ec2c1285955e4930308ebee159fec1c35726ca9856f38e28b14d608c', '2024-05-28 18:21:02.453', '20240321050818_init', NULL, NULL, '2024-05-28 18:21:02.290', 1),
	('791ad83a-1d9a-446a-a34d-b07e482b3fb5', '81fba60a252d137a4e29c103ceea44c9d01a2d5a7829ecbec5bc589340d71f9d', '2024-05-28 18:21:13.483', '20240528182113_', NULL, NULL, '2024-05-28 18:21:13.400', 1),
	('8c5b75c4-9341-41f3-94d4-eb6e88faf1e2', '1d5522380549b97954caa98758e5ad0eea7226bd235a41cef601eeeaa8e605a4', '2024-05-28 18:21:02.695', '20240321142730_init', NULL, NULL, '2024-05-28 18:21:02.535', 1),
	('acc6afe7-975a-4050-9964-4ebb4b76c054', '78ca35f658bb91561a86935a36312ccd399331d4bef1a67902a25f17c43b4a46', '2024-05-28 18:21:02.802', '20240321143322_init', NULL, NULL, '2024-05-28 18:21:02.699', 1),
	('e9f74498-8bde-437f-8f06-9f4bebecf2c1', '745846b5b6a620936b1e2387ae1e8e0aac93bde042a27b3e5e6267b1cc24b7b4', '2024-05-28 18:21:02.533', '20240321140042_init', NULL, NULL, '2024-05-28 18:21:02.456', 1);

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
