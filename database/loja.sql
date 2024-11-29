/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

CREATE DATABASE IF NOT EXISTS `loja` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */;
USE `loja`;

CREATE TABLE IF NOT EXISTS `carrinho` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `produto_id` int(11) NOT NULL,
  `quantidade` int(11) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`),
  KEY `produto_id` (`produto_id`),
  CONSTRAINT `carrinho_ibfk_1` FOREIGN KEY (`produto_id`) REFERENCES `produtos` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO `carrinho` (`id`, `produto_id`, `quantidade`) VALUES
	(1, 1, 1),
	(2, 1, 1),
	(3, 1, 1),
	(4, 1, 1),
	(5, 3, 1);

CREATE TABLE IF NOT EXISTS `produtos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) NOT NULL,
  `descricao` text DEFAULT NULL,
  `preco` decimal(10,2) NOT NULL,
  `imagem` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO `produtos` (`id`, `nome`, `descricao`, `preco`, `imagem`) VALUES
	(1, 'Laptop', 'Faça uma declaração poderosa e alimente suas ideias com o novo Surface Laptop 3. Elegante e leve, com melhor velocidade, desempenho, conforto de digitação e vida útil da bateria, viaja com facilidade e torna cada dia mais produtivo. ', 2500.00, 'laptop.jpg'),
	(2, 'Fone de Ouvido', 'Os fones de ouvido JBL Tune 720BT transmitem o potente som \r\nJBL Pure Bass graças à última tecnologia bluetooth 5.3! Fáceis de usar, esses fones de \r\nouvido proporcionam até 76 horas de puro prazer e até 3 horas extras de bateria com apenas 5 minutos de carga.', 279.90, 'fone.jpg'),
	(3, 'Apple iPhone 15 Pro Max', 'Apple iPhone 15 Pro Max: O iPhone mais avançado de todos os tempos, com design em titânio ultraleve, chip A17 Pro para desempenho inigualável, sistema de câmera profissional com zoom óptico de até 5x e tela Super Retina XDR de 6,7” com ProMotion. \r\nInovação e sofisticação em cada detalhe.', 10999.00, 'iphone.jpg'),
	(4, 'Impressora', 'EPSON EcoTank L1250 - Impressora, tanque de Tinta Colorida, Wi-Fi Direct, Comando de voz, Bivolt, Cor: Preto', 819.00, 'impressora.jpg'),
	(5, 'Caixa de Som Bluetooth', 'A caixa de som portátil JBL PartyBox Encore Essential oferece até 6 horas de diversão ininterrupta.\r\n Com alça de fácil empunhadura e design à prova de respingos, você sempre pode levar a festa com você. Dançando na praia? Se refrescando à beira da piscina?\r\n Mantenha a música em movimento em qualquer lugar com o incrível som JBL Original Pro e graves profundos.', 1489.00, 'jbl.jpg');

CREATE TABLE IF NOT EXISTS `usuarios` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO `usuarios` (`id`, `username`, `password`) VALUES
	(1, 'admin', '21232f297a57a5a743894a0e4a801fc3');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
