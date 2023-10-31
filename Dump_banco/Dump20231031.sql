CREATE DATABASE  IF NOT EXISTS `hp_viagens` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `hp_viagens`;
-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: localhost    Database: hp_viagens
-- ------------------------------------------------------
-- Server version	8.0.34

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

--
-- Table structure for table `cliente`
--

DROP TABLE IF EXISTS `cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cliente` (
  `id_cliente` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) NOT NULL,
  `sexo` varchar(10) DEFAULT NULL,
  `data_nasc` date NOT NULL,
  `cpf` varchar(14) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `senha` varchar(50) NOT NULL,
  `telefone` varchar(20) NOT NULL,
  PRIMARY KEY (`id_cliente`),
  UNIQUE KEY `cpf` (`cpf`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente`
--

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
INSERT INTO `cliente` VALUES (1,'Heitor Pimentel','Masculino','1995-10-10','000.111.222-33','algum@email.com.br','123321666','(84) 98888-4444'),(2,'Angela Darlly','Feminino','1995-06-28','000.111.222-34','algum2@email.com','123325888','(84) 98888-5555'),(3,'Flavio Mota','Masculino','1980-01-01','000.111.222-35','algum3@email.com','123388qq','(84) 98888-6666'),(4,'Gabriel Mesquita','Masculino','1995-01-01','000.111.222-36','algum4@email.com','12332123','(84) 98888-7777'),(5,'Bruna Lins','Feminino','1994-01-01','000.111.222-37','algum5@email.com','123abc444','(84) 98888-1111'),(10,'Heitor Pimentel','Masculino','2000-12-10','123.456.789-10','bb@bb.com.br','123456789','(84) 91111-9111'),(16,'Fulano de tal','Masculino','1234-10-10','000.011.112-22','furusteco@email.com','asjdoiasi','(88) 90000-0000');
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pagamento`
--

DROP TABLE IF EXISTS `pagamento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pagamento` (
  `id_pagamento` int NOT NULL AUTO_INCREMENT,
  `status_pag` enum('Pago','Pendente') DEFAULT NULL,
  `data_pag` datetime DEFAULT NULL,
  `valor_pag` decimal(10,2) DEFAULT NULL,
  `forma_pag` varchar(10) DEFAULT NULL,
  `parcela` tinyint DEFAULT NULL,
  PRIMARY KEY (`id_pagamento`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pagamento`
--

LOCK TABLES `pagamento` WRITE;
/*!40000 ALTER TABLE `pagamento` DISABLE KEYS */;
INSERT INTO `pagamento` VALUES (1,'Pago','2023-09-23 00:00:00',1500.00,'Boleto',1),(2,'Pendente',NULL,2000.00,'Pix',1),(3,'Pago','2023-09-23 00:00:00',950.65,'Cartão',3),(4,'Pago','2023-09-23 00:00:00',980.00,'Cartão',5),(5,'Pendente',NULL,1200.00,'',NULL),(7,'Pago','2023-09-26 00:00:00',1230.00,'Cartão',1),(9,'Pago','2023-09-28 16:43:46',2331.00,'Pix',1);
/*!40000 ALTER TABLE `pagamento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reserva`
--

DROP TABLE IF EXISTS `reserva`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reserva` (
  `id_reserva` int NOT NULL AUTO_INCREMENT,
  `data_reserva` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `status_reserva` enum('Confirmada','Pendente') DEFAULT NULL,
  `id_cliente` int DEFAULT NULL,
  `id_viagem` int DEFAULT NULL,
  `id_pagamento` int DEFAULT NULL,
  PRIMARY KEY (`id_reserva`),
  KEY `id_cliente` (`id_cliente`),
  KEY `id_viagem` (`id_viagem`),
  KEY `id_pagamento` (`id_pagamento`),
  CONSTRAINT `reserva_ibfk_1` FOREIGN KEY (`id_cliente`) REFERENCES `cliente` (`id_cliente`),
  CONSTRAINT `reserva_ibfk_2` FOREIGN KEY (`id_viagem`) REFERENCES `viagem` (`id_viagem`),
  CONSTRAINT `reserva_ibfk_3` FOREIGN KEY (`id_pagamento`) REFERENCES `pagamento` (`id_pagamento`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reserva`
--

LOCK TABLES `reserva` WRITE;
/*!40000 ALTER TABLE `reserva` DISABLE KEYS */;
INSERT INTO `reserva` VALUES (1,'2023-09-23 16:24:58','Confirmada',1,1,4),(2,'2023-09-23 16:24:58','Confirmada',3,3,1),(3,'2023-09-23 16:24:58','Confirmada',5,4,3),(4,'2023-09-23 16:24:58','Pendente',4,2,2),(5,'2023-09-23 16:24:58','Pendente',2,5,5),(7,'2023-09-26 18:18:30','Pendente',1,2,3),(8,'2023-09-26 19:39:17',NULL,1,1,1),(9,'2023-09-26 19:40:25',NULL,1,1,2),(10,'2023-09-26 19:50:48',NULL,1,1,1),(11,'2023-09-26 19:56:03',NULL,1,1,1),(12,'2023-09-26 21:37:04','Confirmada',1,1,1);
/*!40000 ALTER TABLE `reserva` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `viagem`
--

DROP TABLE IF EXISTS `viagem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `viagem` (
  `id_viagem` int NOT NULL AUTO_INCREMENT,
  `origem` varchar(30) DEFAULT NULL,
  `destino` varchar(30) DEFAULT NULL,
  `data_ida` datetime DEFAULT NULL,
  `data_volta` datetime DEFAULT NULL,
  PRIMARY KEY (`id_viagem`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `viagem`
--

LOCK TABLES `viagem` WRITE;
/*!40000 ALTER TABLE `viagem` DISABLE KEYS */;
INSERT INTO `viagem` VALUES (1,'Natal','Recife','2023-10-01 00:00:00','2023-10-05 00:00:00'),(2,'Porto Alegre','Natal','2023-10-02 00:00:00','2023-10-05 00:00:00'),(3,'São Paulo','Fortaleza','2023-10-08 00:00:00','2023-10-12 00:00:00'),(4,'Recife','Fortaleza','2023-10-05 00:00:00','2023-10-09 00:00:00'),(5,'Natal','Maceió','2023-10-01 00:00:00','2023-10-04 00:00:00');
/*!40000 ALTER TABLE `viagem` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-10-31  1:27:30
