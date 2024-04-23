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
INSERT INTO `product` (`id`, `name`, `description`, `price`, `Stock`, `category_id`) VALUES
	(1, 'Coca cola', 'Coca cola', 5200, 10, 1),
	(2, 'Postobon', 'Postobon', 4300, 10, 1),
	(3, 'vasos 7onz caribe', 'vasos 7onz caribe', 1500, 20, 6),
	(4, 'vasos 3.3onz color', 'vasos 3.3onz color', 2200, 20, 6),
	(5, 'astra', 'astra', 12000, 500, 7),
	(6, 'pan super', 'pan super', 6700, 5, 2),
	(7, 'pan mini', 'pan mini', 4000, 10, 2),
	(10, 'pan hamburgesa', 'pan hamburgesa', 5500, 10, 2);

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
