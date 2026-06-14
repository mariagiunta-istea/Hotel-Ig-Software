CREATE DATABASE  IF NOT EXISTS `Hotel` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `Hotel`;
-- MySQL dump 10.13  Distrib 8.0.44, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: Hotel
-- ------------------------------------------------------
-- Server version	9.6.0

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
SET @MYSQLDUMP_TEMP_LOG_BIN = @@SESSION.SQL_LOG_BIN;
SET @@SESSION.SQL_LOG_BIN= 0;

--
-- GTID state at the beginning of the backup 
--

SET @@GLOBAL.GTID_PURGED=/*!80000 '+'*/ '70be06da-53e2-11f1-9a00-2ef745e8b7b0:1-158';

--
-- Table structure for table `estadias`
--

DROP TABLE IF EXISTS `estadias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `estadias` (
  `idEstadia` int NOT NULL AUTO_INCREMENT,
  `id_reserva` int DEFAULT NULL,
  `id_huesped` int NOT NULL,
  `id_habitacion` int NOT NULL,
  `fecha_ingreso` datetime NOT NULL,
  `fecha_egreso` datetime DEFAULT NULL,
  `cantidad_personas` int NOT NULL,
  `precio_noche_aplicado` decimal(10,2) NOT NULL,
  `observaciones` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`idEstadia`),
  KEY `id_reserva` (`id_reserva`),
  KEY `id_huesped` (`id_huesped`),
  KEY `id_habitacion` (`id_habitacion`),
  CONSTRAINT `estadias_ibfk_1` FOREIGN KEY (`id_reserva`) REFERENCES `reservas` (`idReserva`),
  CONSTRAINT `estadias_ibfk_2` FOREIGN KEY (`id_huesped`) REFERENCES `huespedes` (`idHuesped`),
  CONSTRAINT `estadias_ibfk_3` FOREIGN KEY (`id_habitacion`) REFERENCES `habitaciones` (`idHabitacion`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estadias`
--

LOCK TABLES `estadias` WRITE;
/*!40000 ALTER TABLE `estadias` DISABLE KEYS */;
INSERT INTO `estadias` VALUES (1,1,1,3,'2026-03-10 14:00:00','2026-03-13 10:00:00',2,52000.00,'Check-out realizado sin novedades.'),(2,2,4,6,'2026-03-12 15:10:00','2026-03-15 10:20:00',3,72000.00,'Grupo familiar.'),(3,3,7,8,'2026-03-15 13:45:00','2026-03-18 09:50:00',4,105000.00,'Suite con salida anticipada.'),(4,4,10,5,'2026-03-18 14:30:00','2026-03-20 10:05:00',2,54000.00,'Se aplico descuento al ingreso.'),(5,5,13,1,'2026-03-19 16:00:00','2026-03-21 09:30:00',1,35000.00,'Viaje laboral.'),(6,6,16,11,'2026-03-22 14:10:00','2026-03-25 10:15:00',3,76000.00,'Sin observaciones.'),(7,7,19,12,'2026-03-25 15:25:00','2026-03-28 11:00:00',4,110000.00,'Se aplico tarifa promocional.'),(8,8,22,10,'2026-03-28 13:55:00','2026-03-30 10:00:00',2,58000.00,'Incluye cochera.'),(9,9,25,2,'2026-04-01 14:05:00','2026-04-03 09:40:00',1,35000.00,'Estadia finalizada.'),(10,10,28,14,'2026-04-02 14:45:00','2026-04-05 10:10:00',3,80000.00,'Incluye desayuno.'),(11,11,31,4,'2026-04-05 15:15:00','2026-04-07 10:00:00',2,52000.00,'Sin observaciones.'),(12,12,34,15,'2026-04-06 16:30:00','2026-04-09 11:05:00',4,118000.00,'Descuento comercial aplicado.'),(13,NULL,38,9,'2026-04-10 12:20:00','2026-04-11 09:10:00',1,38000.00,'Ingreso directo sin reserva.'),(14,NULL,41,5,'2026-04-11 14:40:00',NULL,2,56000.00,'Estadia activa, egreso pendiente.'),(15,NULL,44,15,'2026-04-12 15:00:00',NULL,4,120000.00,'Estadia activa en suite.'),(16,13,37,7,'2026-04-12 14:20:00','2026-04-15 10:05:00',3,72000.00,'Nueva estadia desde reserva, huesped recurrente.'),(17,14,40,3,'2026-04-14 15:00:00','2026-04-16 09:55:00',2,52000.00,'Reserva utilizada con dos huespedes.'),(18,NULL,1,10,'2026-04-18 13:40:00','2026-04-20 10:10:00',2,58000.00,'Ingreso directo de huesped ya registrado.'),(19,NULL,4,6,'2026-04-21 14:15:00','2026-04-24 10:00:00',3,72000.00,'Nueva estadia para huesped titular existente.'),(20,NULL,22,11,'2026-04-25 15:25:00','2026-04-28 10:20:00',3,76000.00,'Estadia directa con grupo repetido parcialmente.'),(21,19,9,12,'2026-05-02 14:10:00','2026-05-05 10:05:00',4,112000.00,'Suite contratada por huesped ya alojado anteriormente.'),(22,20,14,5,'2026-05-04 13:50:00','2026-05-06 09:50:00',2,56000.00,'Reserva utilizada por huesped existente.'),(23,NULL,28,14,'2026-05-07 14:30:00','2026-05-10 10:15:00',3,80000.00,'Estadia directa con servicios adicionales.'),(24,NULL,34,15,'2026-05-11 15:10:00','2026-05-14 10:10:00',4,120000.00,'Nueva estadia en suite para huesped recurrente.'),(25,NULL,10,5,'2026-05-15 14:00:00','2026-05-17 09:45:00',2,56000.00,'Segunda estadia de huesped ya registrado.');
/*!40000 ALTER TABLE `estadias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `habitaciones`
--

DROP TABLE IF EXISTS `habitaciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `habitaciones` (
  `idHabitacion` int NOT NULL AUTO_INCREMENT,
  `numero` varchar(10) NOT NULL,
  `piso` int NOT NULL,
  `tipo_habitacion` enum('Simple','Doble','Triple','Suite') NOT NULL,
  `capacidad` int NOT NULL,
  `precio_noche-base` decimal(10,2) NOT NULL,
  `estado_habitacion` enum('Disponible','Reservada','Ocupada','En limpieza','Fuera de servicio') NOT NULL,
  PRIMARY KEY (`idHabitacion`),
  UNIQUE KEY `numero` (`numero`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `habitaciones`
--

LOCK TABLES `habitaciones` WRITE;
/*!40000 ALTER TABLE `habitaciones` DISABLE KEYS */;
INSERT INTO `habitaciones` VALUES (1,'101',1,'Simple',1,35000.00,'Disponible'),(2,'102',1,'Simple',1,35000.00,'Disponible'),(3,'103',1,'Doble',2,52000.00,'Reservada'),(4,'104',1,'Doble',2,52000.00,'Ocupada'),(5,'201',2,'Doble',2,56000.00,'Disponible'),(6,'202',2,'Triple',3,72000.00,'Ocupada'),(7,'203',2,'Triple',3,72000.00,'Reservada'),(8,'204',2,'Suite',4,105000.00,'Disponible'),(9,'301',3,'Simple',1,38000.00,'En limpieza'),(10,'302',3,'Doble',2,58000.00,'Disponible'),(11,'303',3,'Triple',3,76000.00,'Disponible'),(12,'304',3,'Suite',4,112000.00,'Reservada'),(13,'401',4,'Doble',2,60000.00,'Fuera de servicio'),(14,'402',4,'Triple',3,80000.00,'Disponible'),(15,'403',4,'Suite',4,120000.00,'Ocupada');
/*!40000 ALTER TABLE `habitaciones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `huespedes`
--

DROP TABLE IF EXISTS `huespedes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `huespedes` (
  `idHuesped` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  `apellido` varchar(50) NOT NULL,
  `dni` varchar(20) NOT NULL,
  `telefono` varchar(30) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `direccion` varchar(150) DEFAULT NULL,
  `fecha_registro` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`idHuesped`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `huespedes`
--

LOCK TABLES `huespedes` WRITE;
/*!40000 ALTER TABLE `huespedes` DISABLE KEYS */;
INSERT INTO `huespedes` VALUES (1,'Juan','Perez','30111222','3415551001','juan.perez@mail.com','San Martin 123, Rosario','2026-01-05 09:15:00'),(2,'Maria','Gomez','28777888','3415551002','maria.gomez@mail.com','Cordoba 2450, Rosario','2026-01-06 10:20:00'),(3,'Carlos','Lopez','32999111','3415551003','carlos.lopez@mail.com','Mitre 800, Rosario','2026-01-07 11:35:00'),(4,'Ana','Rodriguez','31555666','3415551004','ana.rodriguez@mail.com','Santa Fe 1720, Rosario','2026-01-08 12:05:00'),(5,'Luis','Fernandez','34999888','3415551005','luis.fernandez@mail.com','Pellegrini 900, Rosario','2026-01-09 14:10:00'),(6,'Lucia','Martinez','33888777','3415551006','lucia.martinez@mail.com','Entre Rios 650, Rosario','2026-01-10 09:40:00'),(7,'Diego','Sanchez','30123456','3415551007','diego.sanchez@mail.com','Italia 1400, Rosario','2026-01-11 16:22:00'),(8,'Sofia','Romero','36777111','3415551008','sofia.romero@mail.com','Mendoza 2200, Rosario','2026-01-12 18:12:00'),(9,'Martin','Torres','27888999','3415551009','martin.torres@mail.com','Espana 730, Rosario','2026-01-13 08:55:00'),(10,'Valentina','Diaz','39555111','3415551010','valentina.diaz@mail.com','Balcarce 1210, Rosario','2026-01-14 13:25:00'),(11,'Jorge','Alvarez','26000111','3415551011','jorge.alvarez@mail.com','Dorrego 1430, Rosario','2026-01-15 10:10:00'),(12,'Patricia','Suarez','29888222','3415551012','patricia.suarez@mail.com','Salta 760, Rosario','2026-01-16 15:30:00'),(13,'Federico','Molina','33222333','3415551013','federico.molina@mail.com','Urquiza 1820, Rosario','2026-01-17 09:18:00'),(14,'Carolina','Castro','34111444','3415551014','carolina.castro@mail.com','San Juan 530, Rosario','2026-01-18 17:45:00'),(15,'Ricardo','Ortega','25555999','3415551015','ricardo.ortega@mail.com','Catamarca 900, Rosario','2026-01-19 11:11:00'),(16,'Florencia','Navarro','37444555','3415551016','florencia.navarro@mail.com','Laprida 1815, Rosario','2026-01-20 14:52:00'),(17,'Hernan','Rojas','31888123','3415551017','hernan.rojas@mail.com','Maipu 640, Rosario','2026-01-21 08:35:00'),(18,'Paula','Medina','35666777','3415551018','paula.medina@mail.com','Zeballos 1450, Rosario','2026-01-22 19:05:00'),(19,'Gustavo','Herrera','24999888','3415551019','gustavo.herrera@mail.com','Ayacucho 300, Rosario','2026-01-23 10:42:00'),(20,'Natalia','Vega','36333777','3415551020','natalia.vega@mail.com','Orono 1300, Rosario','2026-01-24 12:48:00'),(21,'Andres','Silva','30444555','3415551021','andres.silva@mail.com','Buenos Aires 980, Rosario','2026-01-25 09:25:00'),(22,'Gabriela','Morales','29777123','3415551022','gabriela.morales@mail.com','Paraguay 1110, Rosario','2026-01-26 16:05:00'),(23,'Sebastian','Arias','38888111','3415551023','sebastian.arias@mail.com','San Lorenzo 510, Rosario','2026-01-27 18:14:00'),(24,'Rocio','Benitez','40555222','3415551024','rocio.benitez@mail.com','Tucuman 870, Rosario','2026-01-28 13:36:00'),(25,'Claudio','Ponce','27111222','3415551025','claudio.ponce@mail.com','Montevideo 990, Rosario','2026-01-29 08:18:00'),(26,'Marina','Figueroa','33333444','3415551026','marina.figueroa@mail.com','Rioja 1650, Rosario','2026-01-30 15:41:00'),(27,'Emiliano','Peralta','37666111','3415551027','emiliano.peralta@mail.com','Jujuy 1180, Rosario','2026-02-01 10:12:00'),(28,'Daniela','Acosta','35999111','3415551028','daniela.acosta@mail.com','Moreno 220, Rosario','2026-02-02 11:47:00'),(29,'Sergio','Cabrera','24666777','3415551029','sergio.cabrera@mail.com','Necochea 1400, Rosario','2026-02-03 17:15:00'),(30,'Laura','Campos','28999123','3415551030','laura.campos@mail.com','3 de Febrero 1550, Rosario','2026-02-04 09:55:00'),(31,'Nicolas','Reyes','37123456','3415551031','nicolas.reyes@mail.com','Mendoza 4100, Rosario','2026-02-05 12:20:00'),(32,'Veronica','Ibarra','30777888','3415551032','veronica.ibarra@mail.com','Italia 2550, Rosario','2026-02-06 18:33:00'),(33,'Pablo','Cruz','32222999','3415551033','pablo.cruz@mail.com','Cafferata 770, Rosario','2026-02-07 08:47:00'),(34,'Agustina','Leiva','39888111','3415551034','agustina.leiva@mail.com','Pueyrredon 1350, Rosario','2026-02-08 14:04:00'),(35,'Miguel','Gimenez','26888999','3415551035','miguel.gimenez@mail.com','Arijon 540, Rosario','2026-02-09 16:28:00'),(36,'Camila','Ramos','39111222','3415551036','camila.ramos@mail.com','Avellaneda 2600, Rosario','2026-02-10 10:39:00'),(37,'Raul','Sosa','23777111','3415551037','raul.sosa@mail.com','San Luis 1870, Rosario','2026-02-11 09:08:00'),(38,'Elena','Nunez','28222333','3415551038','elena.nunez@mail.com','Viamonte 910, Rosario','2026-02-12 11:26:00'),(39,'Tomas','Farias','41111222','3415551039','tomas.farias@mail.com','Rondeau 4200, Rosario','2026-02-13 15:02:00'),(40,'Noelia','Paz','34444888','3415551040','noelia.paz@mail.com','Lagos 1650, Rosario','2026-02-14 18:40:00'),(41,'Facundo','Miranda','40222555','3415551041','facundo.miranda@mail.com','Sarmiento 670, Rosario','2026-02-15 13:33:00'),(42,'Julieta','Correa','38333111','3415551042','julieta.correa@mail.com','Alsina 890, Rosario','2026-02-16 12:17:00'),(43,'Oscar','Mendez','23111444','3415551043','oscar.mendez@mail.com','Mendoza 510, Rosario','2026-02-17 08:50:00'),(44,'Cecilia','Vargas','29999555','3415551044','cecilia.vargas@mail.com','Pellegrini 3100, Rosario','2026-02-18 16:43:00'),(45,'Ivan','Ferreyra','39666111','3415551045','ivan.ferreyra@mail.com','San Nicolas 720, Rosario','2026-02-19 17:09:00'),(46,'Micaela','Aguirre','40777888','3415551046','micaela.aguirre@mail.com','Eva Peron 6100, Rosario','2026-02-20 11:02:00'),(47,'Matias','Luna','33555111','3415551047','matias.luna@mail.com','Wheelwright 1230, Rosario','2026-02-21 09:41:00'),(48,'Silvina','Bravo','27777111','3415551048','silvina.bravo@mail.com','San Martin 4200, Rosario','2026-02-22 12:58:00'),(49,'Ramiro','Villar','36222111','3415551049','ramiro.villar@mail.com','Uriburu 1450, Rosario','2026-02-23 15:55:00'),(50,'Teresa','Blanco','25888111','3415551050','teresa.blanco@mail.com','Espana 2900, Rosario','2026-02-24 10:21:00');
/*!40000 ALTER TABLE `huespedes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `huespedes_estadias`
--

DROP TABLE IF EXISTS `huespedes_estadias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `huespedes_estadias` (
  `idHuesped` int NOT NULL,
  `idEstadia` int NOT NULL,
  PRIMARY KEY (`idHuesped`,`idEstadia`),
  KEY `idEstadia` (`idEstadia`),
  CONSTRAINT `huespedes_estadias_ibfk_1` FOREIGN KEY (`idHuesped`) REFERENCES `huespedes` (`idHuesped`),
  CONSTRAINT `huespedes_estadias_ibfk_2` FOREIGN KEY (`idEstadia`) REFERENCES `estadias` (`idEstadia`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `huespedes_estadias`
--

LOCK TABLES `huespedes_estadias` WRITE;
/*!40000 ALTER TABLE `huespedes_estadias` DISABLE KEYS */;
INSERT INTO `huespedes_estadias` VALUES (1,1),(2,1),(4,2),(5,2),(6,2),(7,3),(8,3),(9,3),(10,3),(10,4),(11,4),(13,5),(16,6),(17,6),(18,6),(19,7),(20,7),(21,7),(22,7),(22,8),(23,8),(25,9),(28,10),(29,10),(30,10),(31,11),(32,11),(34,12),(35,12),(36,12),(37,12),(38,13),(41,14),(42,14),(44,15),(45,15),(46,15),(47,15),(37,16),(38,16),(39,16),(40,17),(41,17),(1,18),(3,18),(4,19),(5,19),(6,19),(22,20),(23,20),(24,20),(9,21),(10,21),(11,21),(12,21),(14,22),(15,22),(28,23),(29,23),(30,23),(34,24),(35,24),(36,24),(37,24),(10,25),(11,25);
/*!40000 ALTER TABLE `huespedes_estadias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pagos`
--

DROP TABLE IF EXISTS `pagos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pagos` (
  `idPago` int NOT NULL AUTO_INCREMENT,
  `id_estadia` int NOT NULL,
  `fecha_pago` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `monto` decimal(10,2) NOT NULL,
  `medio_pago` enum('Efectivo','Tarjeta','Transferencia','MercadoPago') NOT NULL,
  `observaciones` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`idPago`),
  KEY `id_estadia` (`id_estadia`),
  CONSTRAINT `pagos_ibfk_1` FOREIGN KEY (`id_estadia`) REFERENCES `estadias` (`idEstadia`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pagos`
--

LOCK TABLES `pagos` WRITE;
/*!40000 ALTER TABLE `pagos` DISABLE KEYS */;
INSERT INTO `pagos` VALUES (1,1,'2026-03-13 10:10:00',171000.00,'Tarjeta','Pago total de estadia y servicios.'),(2,2,'2026-03-15 10:25:00',244500.00,'Transferencia','Pago al egreso.'),(3,3,'2026-03-18 10:00:00',357000.00,'MercadoPago','Pago total.'),(4,4,'2026-03-20 10:15:00',114000.00,'Efectivo','Pago con descuento aplicado.'),(5,5,'2026-03-21 09:35:00',70000.00,'Tarjeta','Pago total.'),(6,6,'2026-03-25 10:20:00',247500.00,'Transferencia','Pago total.'),(7,7,'2026-03-28 11:10:00',360000.00,'Tarjeta','Pago total con servicios.'),(8,8,'2026-03-30 10:10:00',122000.00,'MercadoPago','Pago total.'),(9,9,'2026-04-03 09:45:00',70000.00,'Efectivo','Pago total.'),(10,10,'2026-04-05 10:20:00',253500.00,'Transferencia','Pago total.'),(11,11,'2026-04-07 10:10:00',110000.00,'Tarjeta','Pago total.'),(12,12,'2026-04-09 11:15:00',385500.00,'MercadoPago','Pago total.'),(13,13,'2026-04-11 09:20:00',38000.00,'Efectivo','Pago de estadia directa.'),(14,14,'2026-04-11 15:00:00',56000.00,'Tarjeta','Pago parcial anticipado.'),(15,15,'2026-04-12 15:20:00',120000.00,'Transferencia','Pago parcial anticipado.'),(16,16,'2026-04-15 10:20:00',237000.00,'Tarjeta','Pago total de estadia.'),(17,17,'2026-04-16 10:05:00',109000.00,'MercadoPago','Pago total.'),(18,18,'2026-04-20 10:20:00',122000.00,'Efectivo','Pago total.'),(19,19,'2026-04-24 10:10:00',229500.00,'Transferencia','Pago total con servicios.'),(20,20,'2026-04-28 10:30:00',232500.00,'Tarjeta','Pago total.'),(21,21,'2026-05-05 10:15:00',357000.00,'MercadoPago','Pago total de suite.'),(22,22,'2026-05-06 10:00:00',118000.00,'Efectivo','Pago total.'),(23,23,'2026-05-10 10:25:00',253500.00,'Tarjeta','Pago total.'),(24,24,'2026-05-14 10:20:00',375000.00,'Transferencia','Pago total con servicios.'),(25,25,'2026-05-17 09:55:00',118000.00,'MercadoPago','Pago total.');
/*!40000 ALTER TABLE `pagos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reservas`
--

DROP TABLE IF EXISTS `reservas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reservas` (
  `idReserva` int NOT NULL AUTO_INCREMENT,
  `id_huesped` int NOT NULL,
  `id_habitacion` int NOT NULL,
  `fecha_reserva` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `fecha_ingreso` date NOT NULL,
  `fecha_egreso` date NOT NULL,
  `cantidad_personas` int NOT NULL,
  `precio_noche_reservado` decimal(10,2) NOT NULL,
  `estado_reserva` enum('Pendiente','Confirmada','Cancelada','Finalizada') NOT NULL,
  `observaciones` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`idReserva`),
  KEY `id_huesped` (`id_huesped`),
  KEY `id_habitacion` (`id_habitacion`),
  CONSTRAINT `reservas_ibfk_1` FOREIGN KEY (`id_huesped`) REFERENCES `huespedes` (`idHuesped`),
  CONSTRAINT `reservas_ibfk_2` FOREIGN KEY (`id_habitacion`) REFERENCES `habitaciones` (`idHabitacion`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reservas`
--

LOCK TABLES `reservas` WRITE;
/*!40000 ALTER TABLE `reservas` DISABLE KEYS */;
INSERT INTO `reservas` VALUES (1,1,3,'2026-03-01 10:00:00','2026-03-10','2026-03-13',2,52000.00,'Finalizada','Reserva creada con sena abonada.'),(2,4,6,'2026-03-02 11:30:00','2026-03-12','2026-03-15',3,72000.00,'Finalizada','Familia con tres huespedes.'),(3,7,8,'2026-03-03 09:20:00','2026-03-15','2026-03-18',4,105000.00,'Finalizada','Suite reservada por fin de semana largo.'),(4,10,5,'2026-03-04 15:45:00','2026-03-18','2026-03-20',2,56000.00,'Finalizada','Reserva telefonica confirmada.'),(5,13,1,'2026-03-05 13:10:00','2026-03-19','2026-03-21',1,35000.00,'Finalizada','Huesped por viaje laboral.'),(6,16,11,'2026-03-06 17:25:00','2026-03-22','2026-03-25',3,76000.00,'Finalizada','Grupo de tres personas.'),(7,19,12,'2026-03-07 10:40:00','2026-03-25','2026-03-28',4,112000.00,'Finalizada','Suite para grupo familiar.'),(8,22,10,'2026-03-08 12:05:00','2026-03-28','2026-03-30',2,58000.00,'Finalizada','Reserva con cochera solicitada.'),(9,25,2,'2026-03-09 14:15:00','2026-04-01','2026-04-03',1,35000.00,'Finalizada','Estadia corta.'),(10,28,14,'2026-03-10 16:00:00','2026-04-02','2026-04-05',3,80000.00,'Finalizada','Tres huespedes, incluye desayuno.'),(11,31,4,'2026-03-11 09:50:00','2026-04-05','2026-04-07',2,52000.00,'Finalizada','Reserva tomada por mostrador.'),(12,34,15,'2026-03-12 18:20:00','2026-04-06','2026-04-09',4,120000.00,'Finalizada','Suite con servicios adicionales.'),(13,37,7,'2026-03-13 10:10:00','2026-04-12','2026-04-15',3,72000.00,'Finalizada','Reserva utilizada en una estadia.'),(14,40,3,'2026-03-14 11:25:00','2026-04-14','2026-04-16',2,52000.00,'Finalizada','Reserva confirmada por transferencia y utilizada.'),(15,43,8,'2026-03-15 13:35:00','2026-04-20','2026-04-23',4,105000.00,'Pendiente','Falta confirmacion definitiva.'),(16,46,10,'2026-03-16 15:55:00','2026-04-22','2026-04-24',2,58000.00,'Pendiente','Consulta web pendiente de sena.'),(17,49,11,'2026-03-17 16:40:00','2026-04-25','2026-04-28',3,76000.00,'Cancelada','Cancelada por el huesped.'),(18,5,1,'2026-03-18 12:30:00','2026-04-26','2026-04-27',1,35000.00,'Cancelada','No se recibio confirmacion.'),(19,9,12,'2026-03-19 10:30:00','2026-05-02','2026-05-05',4,112000.00,'Finalizada','Reserva utilizada por huesped recurrente.'),(20,14,5,'2026-03-20 17:10:00','2026-05-04','2026-05-06',2,56000.00,'Finalizada','Reserva confirmada y utilizada.');
/*!40000 ALTER TABLE `reservas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `servicios`
--

DROP TABLE IF EXISTS `servicios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `servicios` (
  `idServicio` int NOT NULL AUTO_INCREMENT,
  `nombre-servicio` enum('WiFi','Lavanderia','Cochera','Desayuno','Almuerzo','Cena','Piscina','Minibar') NOT NULL,
  `precio-base` decimal(10,2) NOT NULL,
  PRIMARY KEY (`idServicio`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `servicios`
--

LOCK TABLES `servicios` WRITE;
/*!40000 ALTER TABLE `servicios` DISABLE KEYS */;
INSERT INTO `servicios` VALUES (1,'WiFi',25000.00),(2,'Lavanderia',36500.00),(3,'Cochera',32000.00),(4,'Desayuno',5000.00),(5,'Almuerzo',8500.00),(6,'Cena',9500.00),(7,'Piscina',42000.00),(8,'Minibar',46000.00);
/*!40000 ALTER TABLE `servicios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `servicios_estadias`
--

DROP TABLE IF EXISTS `servicios_estadias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `servicios_estadias` (
  `idServicio` int NOT NULL,
  `idEstadia` int NOT NULL,
  `precio-aplicado` decimal(10,2) NOT NULL,
  PRIMARY KEY (`idServicio`,`idEstadia`),
  KEY `idEstadia` (`idEstadia`),
  CONSTRAINT `servicios_estadias_ibfk_1` FOREIGN KEY (`idServicio`) REFERENCES `servicios` (`idServicio`),
  CONSTRAINT `servicios_estadias_ibfk_2` FOREIGN KEY (`idEstadia`) REFERENCES `estadias` (`idEstadia`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `servicios_estadias`
--

LOCK TABLES `servicios_estadias` WRITE;
/*!40000 ALTER TABLE `servicios_estadias` DISABLE KEYS */;
INSERT INTO `servicios_estadias` VALUES (1,1,0.00),(1,2,0.00),(1,3,0.00),(1,4,0.00),(1,5,0.00),(1,6,0.00),(1,7,0.00),(1,8,0.00),(1,9,0.00),(1,10,0.00),(1,11,0.00),(1,12,0.00),(1,13,0.00),(1,14,0.00),(1,15,0.00),(1,16,0.00),(1,17,0.00),(1,18,0.00),(1,19,0.00),(1,20,0.00),(1,21,0.00),(1,22,0.00),(1,23,0.00),(1,24,0.00),(1,25,0.00),(2,6,4500.00),(2,20,4500.00),(3,1,6000.00),(3,4,6000.00),(3,8,6000.00),(3,11,6000.00),(3,14,6000.00),(3,16,6000.00),(3,18,6000.00),(3,22,6000.00),(3,25,6000.00),(4,1,5000.00),(4,2,5000.00),(4,3,5000.00),(4,6,5000.00),(4,7,5000.00),(4,10,5000.00),(4,12,5000.00),(4,15,5000.00),(4,16,5000.00),(4,17,5000.00),(4,19,5000.00),(4,21,5000.00),(4,23,5000.00),(4,24,5000.00),(5,2,8500.00),(5,10,8500.00),(5,19,8500.00),(5,23,8500.00),(6,7,9500.00),(6,12,9500.00),(6,21,9500.00),(7,3,3000.00),(7,7,3000.00),(7,15,3000.00),(7,24,3000.00),(8,3,7000.00),(8,12,7000.00),(8,21,7000.00),(8,24,7000.00);
/*!40000 ALTER TABLE `servicios_estadias` ENABLE KEYS */;
UNLOCK TABLES;
SET @@SESSION.SQL_LOG_BIN = @MYSQLDUMP_TEMP_LOG_BIN;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-06-14  0:50:44
