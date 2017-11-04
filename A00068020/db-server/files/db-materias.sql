DROP TABLE IF EXISTS `materia`;

CREATE TABLE `materia` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  `profesor` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

LOCK TABLES `materia` WRITE;
INSERT INTO `materia` VALUES (1,'Sistemas distribuidos','Daniel Barragán'),(2,'Redes Convergentes','Julián Etayo'),(3,'Redes I','Álvaro Pachón');
UNLOCK TABLES;

CREATE USER 'admin'@'192.168.0.26' IDENTIFIED BY 'admin';
GRANT ALL PRIVILEGES ON * . * TO 'admin'@'192.168.0.26';
FLUSH PRIVILEGES;