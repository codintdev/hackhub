/*M!999999\- enable the sandbox mode */ 
-- MariaDB dump 10.19-11.4.3-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: hackhub
-- ------------------------------------------------------
-- Server version	11.4.3-MariaDB-1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*M!100616 SET @OLD_NOTE_VERBOSITY=@@NOTE_VERBOSITY, NOTE_VERBOSITY=0 */;

--
-- Table structure for table `cart`
--

DROP TABLE IF EXISTS `cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cart` (
  `id` int(12) NOT NULL AUTO_INCREMENT,
  `id_producto` int(12) NOT NULL,
  `user` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_cart_id_producto` (`id_producto`),
  KEY `fk_cart_user` (`user`),
  CONSTRAINT `fk_cart_id_producto` FOREIGN KEY (`id_producto`) REFERENCES `productos` (`id`),
  CONSTRAINT `fk_cart_user` FOREIGN KEY (`user`) REFERENCES `users` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart`
--

LOCK TABLES `cart` WRITE;
/*!40000 ALTER TABLE `cart` DISABLE KEYS */;
INSERT INTO `cart` VALUES
(1,1,'mking');
/*!40000 ALTER TABLE `cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `messages`
--

DROP TABLE IF EXISTS `messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `messages` (
  `id` int(12) NOT NULL AUTO_INCREMENT,
  `content` text DEFAULT NULL,
  `user` varchar(50) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `fk_user` (`user`),
  CONSTRAINT `fk_user` FOREIGN KEY (`user`) REFERENCES `users` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `messages`
--

LOCK TABLES `messages` WRITE;
/*!40000 ALTER TABLE `messages` DISABLE KEYS */;
INSERT INTO `messages` VALUES
(1,'Holaa','mking','2024-09-25 23:49:42'),
(2,'Holaa','pperez','2024-09-25 23:50:15'),
(3,'Como estas','mking','2024-09-25 23:50:18'),
(4,'Holaaa','mking','2024-09-25 23:53:28'),
(5,'Holaaaa','pperez','2024-09-25 23:53:49'),
(6,'Como estass','mking','2024-09-25 23:53:55');
/*!40000 ALTER TABLE `messages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `productos`
--

DROP TABLE IF EXISTS `productos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `productos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  `descripcion` varchar(5000) NOT NULL,
  `precio` int(11) NOT NULL,
  `imagen` varchar(5000) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productos`
--

LOCK TABLES `productos` WRITE;
/*!40000 ALTER TABLE `productos` DISABLE KEYS */;
INSERT INTO `productos` VALUES
(1,'FLIPPER ZERO','Flipper Zero, el dispositivo para pruebas de hacking. Como decimos, Flipper Zero es un dispositivo que puede servir para realizar pruebas de hacking y poner a prueba las redes.',1600000,'https://m.media-amazon.com/images/I/61hemQ6tndL._AC_SL1500_.jpg'),
(2,'WIFI PINNEAPPLE','La WiFi Pineapple es un dispositivo que permite realizar ataques de DNS Spoofing, revisar las paginas navegadas, realizar ataques man-in-the-middle en redes Wi-Fi, permitiéndonos espiar todo el tráfico, realizar ataques de Rick Rolling, Nyan Cat o David Hasselhoff y mucho más.',600000,'https://shop.hak5.org/cdn/shop/products/mk7ac-tactical1_2000x.jpg?v=1722645348'),
(3,'USB RUBBER DUCKY','El Rubber Ducky tiene la apariencia de una simple memoria USB. Sin embargo, se trata de un dispositivo de interfaz humana (Human Interface Device, HID por sus siglas en inglés), es decir, un dispositivo de entrada y salida que permite la interacción con el equipo, como lo hacen los teclados y los ratones.',350000,'https://shop.hak5.org/cdn/shop/products/usb-rubber-ducky_mk2_2000x.jpg?v=1659974440'),
(4,'BASH BUNNY','Bash Bunny- La plataforma de ataque USB más avanzada del mundo. Bash Bunny abre superficies de ataque que no eran posibles antes en un solo dispositivo. Los ataques de pruebas de penetración y las tareas de automatización de TI se entregan en segundos con el Bash Bunny.',550000,'https://shop.hak5.org/cdn/shop/files/bash-bunny-mk2_003_1400x.jpg?v=1624552106'),
(5,'ADAPTADOR INALAMBRICO ALFA AWUS036ACS','Adaptador Wi-Fi inalámbrico USB AC600 de doble banda de cobertura ancha con antena externa de alta sensibilidad - Compatible con Windows, MacOS y Kali Linux.',100000,'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSMOqTJ8k6lrQnZwTqkjgx_QYxCklTUJqHsQw&s'),
(6,'HACK RF ONE','HackRF One es capaz de recibir y transmitir en un rango de frecuencia de 1 MHz a 6 GHz con una potencia de salida máxima de hasta 15 dBm según la banda . La unidad viene con un puerto de antena SMA, puertos SMA de entrada y salida de reloj y un puerto USB 2.0.',950000,'https://www.openhacks.com/uploadsproductos/13001-01.jpg'),
(7,'RASPBERRY PI','Una Raspberry PI es un ordenador del tamaño de una tarjeta de crédito. ¿Suena increíble, verdad? Consiste en una placa base que soporta distintos componentes de un ordenador como un procesador ARM de hasta 1500 MHz, un chip gráfico y una memoria RAM de hasta 8 GB. Además, tiene otras muchas otras posibilidades.',350000,'https://upload.wikimedia.org/wikipedia/commons/thumb/f/f1/Raspberry_Pi_4_Model_B_-_Side.jpg/1200px-Raspberry_Pi_4_Model_B_-_Side.jpg');
/*!40000 ALTER TABLE `productos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `username` varchar(50) NOT NULL,
  `password` varchar(5000) NOT NULL,
  `fullname` varchar(50) NOT NULL,
  `cargo` varchar(10) NOT NULL,
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES
('mking','$2a$10$4A/oiSkF983tXWFAPoNym..k8xONCErWe6muIKsmw.SaBflY.2wnW','Rey Misterio','admin'),
('pperez','$2a$10$o8Tr3VdnW1WgcaoIhhQOAe.5nnKsV4WHJmZPbHErTKgHVwJAWNSQu','Pepito Perez','user');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*M!100616 SET NOTE_VERBOSITY=@OLD_NOTE_VERBOSITY */;

-- Dump completed on 2024-10-20 12:13:33
