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

-- Volcando datos para la tabla persona.detalle: ~1 rows (aproximadamente)
INSERT INTO `detalle` (`id`, `cantidad`, `Subtotal`, `product_id`) VALUES
	(1, 2, 10400, 1);

-- Volcando datos para la tabla persona.product: ~8 rows (aproximadamente)
INSERT INTO `product` (`id`, `name`, `price`, `category_id`, `Stock`, `description`) VALUES
	(1, 'Coca cola', 5200, 1, 10, 'Coca cola'),
	(2, 'Postobon', 4300, 1, 10, 'Postobon'),
	(3, 'vasos 7onz caribe', 1500, 6, 20, 'vasos 7onz caribe'),
	(4, 'vasos 3.3onz color', 2200, 6, 20, 'vasos 3.3onz color'),
	(5, 'astra', 12000, 7, 500, 'astra'),
	(6, 'pan super', 6700, 2, 5, 'pan super'),
	(36, 'bolsa 3 k ', 3300, 6, 10, 'bolsa 3 k '),
	(37, 'bolsa 5 k', 3000, 6, 10, 'bolsa 5 k'),
	(40, 'bolsa 10 k', 7000, 6, 20, 'bolsa 10 k'),
	(41, 'bolsa 15 k', 10000, 6, 10, 'bolsa 15 k'),
	(42, 'bolsa 20 k', 20000, 6, 10, 'bolsa 20 k'),
	(43, 'bolsa 30 k', 30000, 6, 10, 'bolsa 30 k'),
	(44, 'vasos 9 onz', 2200, 6, 10, 'vasos 9 onz'),
	(45, 'servilleta ', 4500, 6, 10, 'servilleta'),
	(46, 'vasos 5 onz', 2499, 6, 10, 'vasos 5 onz'),
	(47, 'pan mini', 4000, 2, 10, 'pan mini'),
	(48, 'crema de leche x 200gr', 4500, 5, 10, '200gr'),
	(50, 'porta comida j1', 500, 6, 50, 'portacomida'),
	(52, 'porta comida j2', 500, 6, 50, 'portacomida j2'),
	(53, 'bolsa papel #2', 4400, 6, 10, 'papel #2'),
	(54, 'bolsa papel #3', 5400, 6, 10, 'papel #3'),
	(55, 'cucharas x 100', 5000, 6, 10, 'cuchara'),
	(56, 'tenedor x 100', 5000, 6, 10, 'tenedor'),
	(57, 'cuchillo x 100', 4800, 6, 10, 'cuchillo'),
	(59, 'cuchara pequeña x 100', 2700, 6, 10, 'cuchara pequeña'),
	(60, 'vasos 16onz hico', 5500, 6, 10, 'hicopor'),
	(61, 'vasos 7onz tuc', 1500, 6, 10, 'vasos 7onz tuc');



/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
