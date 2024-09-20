/*!999999\- enable the sandbox mode */ 
-- MariaDB dump 10.19-11.4.2-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: hackhub
-- ------------------------------------------------------
-- Server version	11.4.2-MariaDB-4

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
-- Table structure for table `productos`
--

DROP TABLE IF EXISTS `productos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `productos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  `descripcion` varchar(500) DEFAULT NULL,
  `precio` int(11) NOT NULL,
  `imagen` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productos`
--

LOCK TABLES `productos` WRITE;
/*!40000 ALTER TABLE `productos` DISABLE KEYS */;
INSERT INTO `productos` VALUES
(1,'Flipper Zero','El Flipper Zero es un dispositivo portátil multifuncional diseñado para la investigación de seguridad y la exploración de radiofrecuencia. Es una herramienta de hacking ético que puede interactuar con una variedad de tecnologías, como sistemas de acceso RFID, infrarrojos, NFC, y otros protocolos inalámbricos. Su interfaz amigable y capacidades de hardware lo hacen popular entre entusiastas de la seguridad, hackers y técnicos para probar la seguridad de dispositivos y sistemas.',1600000,'https://i5.walmartimages.com/seo/Flipper-Zero-Electronic-Pet-Hacking-Multi-Tool-Original-IN-HAND_78b1278c-8b59-454e-93e2-ea7550b6948e.4069108a752503b309e3ccebb4614bd5.jpeg'),
(2,'ESP8266 Deauther','El ESP8266 Deauther es un firmware basado en el microcontrolador ESP8266 que permite realizar ataques de desautenticación (deauth) en redes Wi-Fi. Este firmware, desarrollado para fines educativos y de pruebas de seguridad, puede desconectar dispositivos de una red inalámbrica al enviar paquetes de desautenticación. Aunque útil para la auditoría de redes, su uso en redes ajenas sin autorización es ilegal y poco ético.',238000,'https://images-cdn.ubuy.co.in/633b3dcc7dffa939de04e483-aursinc-wifi-deauther-amp-bad-usb.jpg'),
(3,'Rubber Ducky','El Rubber Ducky es un dispositivo USB diseñado para realizar ataques de inyección de comandos en computadores. Disfrazado como una memoria USB, se identifica como un teclado al conectarse, lo que le permite ejecutar scripts preprogramados a alta velocidad. Estos scripts pueden realizar diversas acciones, como abrir aplicaciones, ejecutar comandos o instalar malware. Popular en pruebas de penetración, su uso sin autorización es ilegal y antiético.',183000,'https://i5.walmartimages.com/asr/8f64b8c6-9af9-4707-b3ae-00f6d19c4def.bf98ec597a3f5da714c779a4856b3a10.jpeg'),
(4,'Bash Bunny','El Bash Bunny es una herramienta avanzada de pruebas de penetración en forma de un dispositivo USB que permite automatizar ataques y pruebas de seguridad. Al conectarse a una computadora, puede emular varios dispositivos, como un teclado, almacenamiento masivo o adaptador de red, para ejecutar ataques rápidos, como la inyección de comandos, robo de datos o creación de puertas traseras. Es ideal para profesionales de seguridad, pero su uso sin autorización es ilegal y antiético.',492000,'https://shop.hak5.org/cdn/shop/products/bash-bunny-mk2_001_a71eaf45-5f2e-4156-ac45-5b782d25f62f_2000x.jpg?v=1624910237'),
(5,'KeyCroc','En este video presentamos el KeyCroc de la marca Hak5, un dispositivo hardware que funciona como un Keylogger y es capaz de capturar las pulsaciones de teclado, conectarse a una red Wifi y ejecutar scripts para automatizar nuestras labores de auditoria.',679000,'https://shop.hak5.org/cdn/shop/files/keycroc-new_2000x.jpg?v=1698880769');
/*!40000 ALTER TABLE `productos` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*M!100616 SET NOTE_VERBOSITY=@OLD_NOTE_VERBOSITY */;

-- Dump completed on 2024-09-03 23:29:38
