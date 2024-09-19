-- MySQL dump 10.13  Distrib 8.0.32, for macos11.7 (x86_64)
--
-- Host: localhost    Database: mono
-- ------------------------------------------------------
-- Server version	8.0.32

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `abertura_caixas`
--

DROP TABLE IF EXISTS `abertura_caixas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `abertura_caixas` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `usuario_id` int unsigned NOT NULL,
  `data_registro` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `valor` decimal(10,2) NOT NULL,
  `ultima_venda` int NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `abertura_caixas_usuario_id_foreign` (`usuario_id`),
  CONSTRAINT `abertura_caixas_usuario_id_foreign` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `abertura_caixas`
--

LOCK TABLES `abertura_caixas` WRITE;
/*!40000 ALTER TABLE `abertura_caixas` DISABLE KEYS */;
/*!40000 ALTER TABLE `abertura_caixas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `agendamentos`
--

DROP TABLE IF EXISTS `agendamentos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `agendamentos` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `funcionario_id` int unsigned DEFAULT NULL,
  `cliente_id` int unsigned DEFAULT NULL,
  `data` date NOT NULL,
  `observacao` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `inicio` time NOT NULL,
  `termino` time NOT NULL,
  `total` decimal(10,2) NOT NULL,
  `desconto` decimal(10,2) NOT NULL,
  `acrescimo` decimal(10,2) NOT NULL,
  `valor_comissao` decimal(10,2) NOT NULL DEFAULT '0.00',
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `agendamentos_funcionario_id_foreign` (`funcionario_id`),
  KEY `agendamentos_cliente_id_foreign` (`cliente_id`),
  CONSTRAINT `agendamentos_cliente_id_foreign` FOREIGN KEY (`cliente_id`) REFERENCES `clientes` (`id`),
  CONSTRAINT `agendamentos_funcionario_id_foreign` FOREIGN KEY (`funcionario_id`) REFERENCES `funcionarios` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `agendamentos`
--

LOCK TABLES `agendamentos` WRITE;
/*!40000 ALTER TABLE `agendamentos` DISABLE KEYS */;
/*!40000 ALTER TABLE `agendamentos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `alteracao_estoques`
--

DROP TABLE IF EXISTS `alteracao_estoques`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `alteracao_estoques` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `produto_id` int unsigned DEFAULT NULL,
  `usuario_id` int unsigned DEFAULT NULL,
  `quantidade` decimal(10,3) NOT NULL,
  `observacao` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tipo` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `alteracao_estoques_produto_id_foreign` (`produto_id`),
  KEY `alteracao_estoques_usuario_id_foreign` (`usuario_id`),
  CONSTRAINT `alteracao_estoques_produto_id_foreign` FOREIGN KEY (`produto_id`) REFERENCES `produtos` (`id`) ON DELETE CASCADE,
  CONSTRAINT `alteracao_estoques_usuario_id_foreign` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alteracao_estoques`
--

LOCK TABLES `alteracao_estoques` WRITE;
/*!40000 ALTER TABLE `alteracao_estoques` DISABLE KEYS */;
/*!40000 ALTER TABLE `alteracao_estoques` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `apontamentos`
--

DROP TABLE IF EXISTS `apontamentos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `apontamentos` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `produto_id` int unsigned DEFAULT NULL,
  `usuario_id` int unsigned DEFAULT NULL,
  `quantidade` decimal(10,3) NOT NULL,
  `data_registro` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `apontamentos_produto_id_foreign` (`produto_id`),
  KEY `apontamentos_usuario_id_foreign` (`usuario_id`),
  CONSTRAINT `apontamentos_produto_id_foreign` FOREIGN KEY (`produto_id`) REFERENCES `produtos` (`id`) ON DELETE CASCADE,
  CONSTRAINT `apontamentos_usuario_id_foreign` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `apontamentos`
--

LOCK TABLES `apontamentos` WRITE;
/*!40000 ALTER TABLE `apontamentos` DISABLE KEYS */;
/*!40000 ALTER TABLE `apontamentos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `autor_post_blog_ecommerces`
--

DROP TABLE IF EXISTS `autor_post_blog_ecommerces`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `autor_post_blog_ecommerces` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `nome` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tipo` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `img` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `autor_post_blog_ecommerces`
--

LOCK TABLES `autor_post_blog_ecommerces` WRITE;
/*!40000 ALTER TABLE `autor_post_blog_ecommerces` DISABLE KEYS */;
/*!40000 ALTER TABLE `autor_post_blog_ecommerces` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bairro_deliveries`
--

DROP TABLE IF EXISTS `bairro_deliveries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bairro_deliveries` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `nome` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `valor_entrega` decimal(10,2) NOT NULL,
  `valor_repasse` decimal(10,2) NOT NULL DEFAULT '0.00',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bairro_deliveries`
--

LOCK TABLES `bairro_deliveries` WRITE;
/*!40000 ALTER TABLE `bairro_deliveries` DISABLE KEYS */;
/*!40000 ALTER TABLE `bairro_deliveries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `banner_mais_vendidos`
--

DROP TABLE IF EXISTS `banner_mais_vendidos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `banner_mais_vendidos` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `path` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `texto_primario` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `texto_secundario` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `produto_delivery_id` int unsigned DEFAULT NULL,
  `pack_id` int unsigned DEFAULT NULL,
  `ativo` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `banner_mais_vendidos_produto_delivery_id_foreign` (`produto_delivery_id`),
  KEY `banner_mais_vendidos_pack_id_foreign` (`pack_id`),
  CONSTRAINT `banner_mais_vendidos_pack_id_foreign` FOREIGN KEY (`pack_id`) REFERENCES `pack_produto_deliveries` (`id`) ON DELETE CASCADE,
  CONSTRAINT `banner_mais_vendidos_produto_delivery_id_foreign` FOREIGN KEY (`produto_delivery_id`) REFERENCES `produto_deliveries` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `banner_mais_vendidos`
--

LOCK TABLES `banner_mais_vendidos` WRITE;
/*!40000 ALTER TABLE `banner_mais_vendidos` DISABLE KEYS */;
/*!40000 ALTER TABLE `banner_mais_vendidos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `banner_topos`
--

DROP TABLE IF EXISTS `banner_topos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `banner_topos` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `path` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `titulo` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `descricao` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `produto_delivery_id` int unsigned DEFAULT NULL,
  `pack_id` int unsigned DEFAULT NULL,
  `ativo` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `banner_topos_produto_delivery_id_foreign` (`produto_delivery_id`),
  KEY `banner_topos_pack_id_foreign` (`pack_id`),
  CONSTRAINT `banner_topos_pack_id_foreign` FOREIGN KEY (`pack_id`) REFERENCES `pack_produto_deliveries` (`id`) ON DELETE CASCADE,
  CONSTRAINT `banner_topos_produto_delivery_id_foreign` FOREIGN KEY (`produto_delivery_id`) REFERENCES `produto_deliveries` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `banner_topos`
--

LOCK TABLES `banner_topos` WRITE;
/*!40000 ALTER TABLE `banner_topos` DISABLE KEYS */;
/*!40000 ALTER TABLE `banner_topos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `c_te_descargas`
--

DROP TABLE IF EXISTS `c_te_descargas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `c_te_descargas` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `info_id` int unsigned NOT NULL,
  `chave` varchar(44) COLLATE utf8mb4_unicode_ci NOT NULL,
  `seg_cod_barras` varchar(35) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `c_te_descargas_info_id_foreign` (`info_id`),
  CONSTRAINT `c_te_descargas_info_id_foreign` FOREIGN KEY (`info_id`) REFERENCES `info_descargas` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `c_te_descargas`
--

LOCK TABLES `c_te_descargas` WRITE;
/*!40000 ALTER TABLE `c_te_descargas` DISABLE KEYS */;
/*!40000 ALTER TABLE `c_te_descargas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `carrossel_ecommerces`
--

DROP TABLE IF EXISTS `carrossel_ecommerces`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `carrossel_ecommerces` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `titulo` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `descricao` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `link_acao` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nome_botao` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `img` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `carrossel_ecommerces`
--

LOCK TABLES `carrossel_ecommerces` WRITE;
/*!40000 ALTER TABLE `carrossel_ecommerces` DISABLE KEYS */;
/*!40000 ALTER TABLE `carrossel_ecommerces` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categoria_adicionals`
--

DROP TABLE IF EXISTS `categoria_adicionals`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categoria_adicionals` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `nome` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `limite_escolha` int NOT NULL,
  `adicional` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categoria_adicionals`
--

LOCK TABLES `categoria_adicionals` WRITE;
/*!40000 ALTER TABLE `categoria_adicionals` DISABLE KEYS */;
/*!40000 ALTER TABLE `categoria_adicionals` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categoria_contas`
--

DROP TABLE IF EXISTS `categoria_contas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categoria_contas` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `nome` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categoria_contas`
--

LOCK TABLES `categoria_contas` WRITE;
/*!40000 ALTER TABLE `categoria_contas` DISABLE KEYS */;
INSERT INTO `categoria_contas` VALUES (1,'Compras','2023-08-17 20:05:19','2023-08-17 20:05:19'),(2,'Vendas','2023-08-17 20:05:19','2023-08-17 20:05:19');
/*!40000 ALTER TABLE `categoria_contas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categoria_despesa_ctes`
--

DROP TABLE IF EXISTS `categoria_despesa_ctes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categoria_despesa_ctes` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `nome` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categoria_despesa_ctes`
--

LOCK TABLES `categoria_despesa_ctes` WRITE;
/*!40000 ALTER TABLE `categoria_despesa_ctes` DISABLE KEYS */;
/*!40000 ALTER TABLE `categoria_despesa_ctes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categoria_post_blog_ecommerces`
--

DROP TABLE IF EXISTS `categoria_post_blog_ecommerces`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categoria_post_blog_ecommerces` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `nome` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categoria_post_blog_ecommerces`
--

LOCK TABLES `categoria_post_blog_ecommerces` WRITE;
/*!40000 ALTER TABLE `categoria_post_blog_ecommerces` DISABLE KEYS */;
/*!40000 ALTER TABLE `categoria_post_blog_ecommerces` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categoria_produto_deliveries`
--

DROP TABLE IF EXISTS `categoria_produto_deliveries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categoria_produto_deliveries` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `nome` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `descricao` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `path` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categoria_produto_deliveries`
--

LOCK TABLES `categoria_produto_deliveries` WRITE;
/*!40000 ALTER TABLE `categoria_produto_deliveries` DISABLE KEYS */;
/*!40000 ALTER TABLE `categoria_produto_deliveries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categoria_produto_ecommerces`
--

DROP TABLE IF EXISTS `categoria_produto_ecommerces`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categoria_produto_ecommerces` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `nome` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `img` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categoria_produto_ecommerces`
--

LOCK TABLES `categoria_produto_ecommerces` WRITE;
/*!40000 ALTER TABLE `categoria_produto_ecommerces` DISABLE KEYS */;
/*!40000 ALTER TABLE `categoria_produto_ecommerces` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categoria_servicos`
--

DROP TABLE IF EXISTS `categoria_servicos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categoria_servicos` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `nome` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categoria_servicos`
--

LOCK TABLES `categoria_servicos` WRITE;
/*!40000 ALTER TABLE `categoria_servicos` DISABLE KEYS */;
/*!40000 ALTER TABLE `categoria_servicos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categorias`
--

DROP TABLE IF EXISTS `categorias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categorias` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `nome` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categorias`
--

LOCK TABLES `categorias` WRITE;
/*!40000 ALTER TABLE `categorias` DISABLE KEYS */;
/*!40000 ALTER TABLE `categorias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `certificados`
--

DROP TABLE IF EXISTS `certificados`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `certificados` (
  `arquivo` blob NOT NULL,
  `senha` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `certificados`
--

LOCK TABLES `certificados` WRITE;
/*!40000 ALTER TABLE `certificados` DISABLE KEYS */;
/*!40000 ALTER TABLE `certificados` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cidades`
--

DROP TABLE IF EXISTS `cidades`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cidades` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `codigo` varchar(8) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nome` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `uf` varchar(2) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5571 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cidades`
--

LOCK TABLES `cidades` WRITE;
/*!40000 ALTER TABLE `cidades` DISABLE KEYS */;
INSERT INTO `cidades` VALUES (1,'1100015','Alta Floresta D\'Oeste','RO','2023-08-17 20:05:19','2023-08-17 20:05:19'),(2,'1100023','Ariquemes','RO','2023-08-17 20:05:19','2023-08-17 20:05:19'),(3,'1100031','Cabixi','RO','2023-08-17 20:05:19','2023-08-17 20:05:19'),(4,'1100049','Cacoal','RO','2023-08-17 20:05:19','2023-08-17 20:05:19'),(5,'1100056','Cerejeiras','RO','2023-08-17 20:05:19','2023-08-17 20:05:19'),(6,'1100064','Colorado do Oeste','RO','2023-08-17 20:05:19','2023-08-17 20:05:19'),(7,'1100072','Corumbiara','RO','2023-08-17 20:05:19','2023-08-17 20:05:19'),(8,'1100080','Costa Marques','RO','2023-08-17 20:05:19','2023-08-17 20:05:19'),(9,'1100098','Espigao D\'Oeste','RO','2023-08-17 20:05:19','2023-08-17 20:05:19'),(10,'1100106','Guajara-Mirim','RO','2023-08-17 20:05:19','2023-08-17 20:05:19'),(11,'1100114','Jaru','RO','2023-08-17 20:05:19','2023-08-17 20:05:19'),(12,'1100122','Ji-Parana','RO','2023-08-17 20:05:19','2023-08-17 20:05:19'),(13,'1100130','Machadinho D\'Oeste','RO','2023-08-17 20:05:19','2023-08-17 20:05:19'),(14,'1100148','Nova Brasilândia D\'Oeste','RO','2023-08-17 20:05:19','2023-08-17 20:05:19'),(15,'1100155','Ouro Preto do Oeste','RO','2023-08-17 20:05:19','2023-08-17 20:05:19'),(16,'1100189','Pimenta Bueno','RO','2023-08-17 20:05:19','2023-08-17 20:05:19'),(17,'1100205','Porto Velho','RO','2023-08-17 20:05:19','2023-08-17 20:05:19'),(18,'1100254','Presidente Medici','RO','2023-08-17 20:05:19','2023-08-17 20:05:19'),(19,'1100262','Rio Crespo','RO','2023-08-17 20:05:19','2023-08-17 20:05:19'),(20,'1100288','Rolim de Moura','RO','2023-08-17 20:05:19','2023-08-17 20:05:19'),(21,'1100296','Santa Luzia D\'Oeste','RO','2023-08-17 20:05:19','2023-08-17 20:05:19'),(22,'1100304','Vilhena','RO','2023-08-17 20:05:19','2023-08-17 20:05:19'),(23,'1100320','Sao Miguel do Guapore','RO','2023-08-17 20:05:19','2023-08-17 20:05:19'),(24,'1100338','Nova Mamore','RO','2023-08-17 20:05:19','2023-08-17 20:05:19'),(25,'1100346','Alvorada D\'Oeste','RO','2023-08-17 20:05:19','2023-08-17 20:05:19'),(26,'1100379','Alto Alegre dos Parecis','RO','2023-08-17 20:05:19','2023-08-17 20:05:19'),(27,'1100403','Alto Paraiso','RO','2023-08-17 20:05:19','2023-08-17 20:05:19'),(28,'1100452','Buritis','RO','2023-08-17 20:05:19','2023-08-17 20:05:19'),(29,'1100502','Novo Horizonte do Oeste','RO','2023-08-17 20:05:19','2023-08-17 20:05:19'),(30,'1100601','Cacaulândia','RO','2023-08-17 20:05:19','2023-08-17 20:05:19'),(31,'1100700','Campo Novo de Rondônia','RO','2023-08-17 20:05:19','2023-08-17 20:05:19'),(32,'1100809','Candeias do Jamari','RO','2023-08-17 20:05:19','2023-08-17 20:05:19'),(33,'1100908','Castanheiras','RO','2023-08-17 20:05:19','2023-08-17 20:05:19'),(34,'1100924','Chupinguaia','RO','2023-08-17 20:05:19','2023-08-17 20:05:19'),(35,'1100940','Cujubim','RO','2023-08-17 20:05:19','2023-08-17 20:05:19'),(36,'1101005','Governador Jorge Teixeira','RO','2023-08-17 20:05:19','2023-08-17 20:05:19'),(37,'1101104','Itapua do Oeste','RO','2023-08-17 20:05:19','2023-08-17 20:05:19'),(38,'1101203','Ministro Andreazza','RO','2023-08-17 20:05:19','2023-08-17 20:05:19'),(39,'1101302','Mirante da Serra','RO','2023-08-17 20:05:19','2023-08-17 20:05:19'),(40,'1101401','Monte Negro','RO','2023-08-17 20:05:19','2023-08-17 20:05:19'),(41,'1101435','Nova Uniao','RO','2023-08-17 20:05:19','2023-08-17 20:05:19'),(42,'1101450','Parecis','RO','2023-08-17 20:05:19','2023-08-17 20:05:19'),(43,'1101468','Pimenteiras do Oeste','RO','2023-08-17 20:05:19','2023-08-17 20:05:19'),(44,'1101476','Primavera de Rondônia','RO','2023-08-17 20:05:19','2023-08-17 20:05:19'),(45,'1101484','Sao Felipe D\'Oeste','RO','2023-08-17 20:05:19','2023-08-17 20:05:19'),(46,'1101492','Sao Francisco do Guapore','RO','2023-08-17 20:05:19','2023-08-17 20:05:19'),(47,'1101500','Seringueiras','RO','2023-08-17 20:05:19','2023-08-17 20:05:19'),(48,'1101559','Teixeiropolis','RO','2023-08-17 20:05:19','2023-08-17 20:05:19'),(49,'1101609','Theobroma','RO','2023-08-17 20:05:19','2023-08-17 20:05:19'),(50,'1101708','Urupa','RO','2023-08-17 20:05:19','2023-08-17 20:05:19'),(51,'1101757','Vale do Anari','RO','2023-08-17 20:05:19','2023-08-17 20:05:19'),(52,'1101807','Vale do Paraiso','RO','2023-08-17 20:05:19','2023-08-17 20:05:19'),(53,'1200013','Acrelândia','AC','2023-08-17 20:05:19','2023-08-17 20:05:19'),(54,'1200054','Assis Brasil','AC','2023-08-17 20:05:19','2023-08-17 20:05:19'),(55,'1200104','Brasileia','AC','2023-08-17 20:05:19','2023-08-17 20:05:19'),(56,'1200138','Bujari','AC','2023-08-17 20:05:19','2023-08-17 20:05:19'),(57,'1200179','Capixaba','AC','2023-08-17 20:05:19','2023-08-17 20:05:19'),(58,'1200203','Cruzeiro do Sul','AC','2023-08-17 20:05:19','2023-08-17 20:05:19'),(59,'1200252','Epitaciolândia','AC','2023-08-17 20:05:19','2023-08-17 20:05:19'),(60,'1200302','Feijo','AC','2023-08-17 20:05:19','2023-08-17 20:05:19'),(61,'1200328','Jordao','AC','2023-08-17 20:05:19','2023-08-17 20:05:19'),(62,'1200336','Mâncio Lima','AC','2023-08-17 20:05:19','2023-08-17 20:05:19'),(63,'1200344','Manoel Urbano','AC','2023-08-17 20:05:19','2023-08-17 20:05:19'),(64,'1200351','Marechal Thaumaturgo','AC','2023-08-17 20:05:19','2023-08-17 20:05:19'),(65,'1200385','Placido de Castro','AC','2023-08-17 20:05:19','2023-08-17 20:05:19'),(66,'1200393','Porto Walter','AC','2023-08-17 20:05:19','2023-08-17 20:05:19'),(67,'1200401','Rio Branco','AC','2023-08-17 20:05:19','2023-08-17 20:05:19'),(68,'1200427','Rodrigues Alves','AC','2023-08-17 20:05:19','2023-08-17 20:05:19'),(69,'1200435','Santa Rosa do Purus','AC','2023-08-17 20:05:19','2023-08-17 20:05:19'),(70,'1200450','Senador Guiomard','AC','2023-08-17 20:05:19','2023-08-17 20:05:19'),(71,'1200500','Sena Madureira','AC','2023-08-17 20:05:19','2023-08-17 20:05:19'),(72,'1200609','Tarauaca','AC','2023-08-17 20:05:19','2023-08-17 20:05:19'),(73,'1200708','Xapuri','AC','2023-08-17 20:05:19','2023-08-17 20:05:19'),(74,'1200807','Porto Acre','AC','2023-08-17 20:05:19','2023-08-17 20:05:19'),(75,'1300029','Alvaraes','AM','2023-08-17 20:05:19','2023-08-17 20:05:19'),(76,'1300060','Amatura','AM','2023-08-17 20:05:19','2023-08-17 20:05:19'),(77,'1300086','Anama','AM','2023-08-17 20:05:19','2023-08-17 20:05:19'),(78,'1300102','Anori','AM','2023-08-17 20:05:19','2023-08-17 20:05:19'),(79,'1300144','Apui','AM','2023-08-17 20:05:19','2023-08-17 20:05:19'),(80,'1300201','Atalaia do Norte','AM','2023-08-17 20:05:19','2023-08-17 20:05:19'),(81,'1300300','Autazes','AM','2023-08-17 20:05:19','2023-08-17 20:05:19'),(82,'1300409','Barcelos','AM','2023-08-17 20:05:19','2023-08-17 20:05:19'),(83,'1300508','Barreirinha','AM','2023-08-17 20:05:19','2023-08-17 20:05:19'),(84,'1300607','Benjamin Constant','AM','2023-08-17 20:05:19','2023-08-17 20:05:19'),(85,'1300631','Beruri','AM','2023-08-17 20:05:19','2023-08-17 20:05:19'),(86,'1300680','Boa Vista do Ramos','AM','2023-08-17 20:05:19','2023-08-17 20:05:19'),(87,'1300706','Boca do Acre','AM','2023-08-17 20:05:19','2023-08-17 20:05:19'),(88,'1300805','Borba','AM','2023-08-17 20:05:19','2023-08-17 20:05:19'),(89,'1300839','Caapiranga','AM','2023-08-17 20:05:19','2023-08-17 20:05:19'),(90,'1300904','Canutama','AM','2023-08-17 20:05:19','2023-08-17 20:05:19'),(91,'1301001','Carauari','AM','2023-08-17 20:05:19','2023-08-17 20:05:19'),(92,'1301100','Careiro','AM','2023-08-17 20:05:19','2023-08-17 20:05:19'),(93,'1301159','Careiro da Varzea','AM','2023-08-17 20:05:19','2023-08-17 20:05:19'),(94,'1301209','Coari','AM','2023-08-17 20:05:19','2023-08-17 20:05:19'),(95,'1301308','Codajas','AM','2023-08-17 20:05:19','2023-08-17 20:05:19'),(96,'1301407','Eirunepe','AM','2023-08-17 20:05:19','2023-08-17 20:05:19'),(97,'1301506','Envira','AM','2023-08-17 20:05:19','2023-08-17 20:05:19'),(98,'1301605','Fonte Boa','AM','2023-08-17 20:05:19','2023-08-17 20:05:19'),(99,'1301654','Guajara','AM','2023-08-17 20:05:19','2023-08-17 20:05:19'),(100,'1301704','Humaita','AM','2023-08-17 20:05:19','2023-08-17 20:05:19'),(101,'1301803','Ipixuna','AM','2023-08-17 20:05:19','2023-08-17 20:05:19'),(102,'1301852','Iranduba','AM','2023-08-17 20:05:19','2023-08-17 20:05:19'),(103,'1301902','Itacoatiara','AM','2023-08-17 20:05:19','2023-08-17 20:05:19'),(104,'1301951','Itamarati','AM','2023-08-17 20:05:19','2023-08-17 20:05:19'),(105,'1302009','Itapiranga','AM','2023-08-17 20:05:19','2023-08-17 20:05:19'),(106,'1302108','Japura','AM','2023-08-17 20:05:19','2023-08-17 20:05:19'),(107,'1302207','Jurua','AM','2023-08-17 20:05:19','2023-08-17 20:05:19'),(108,'1302306','Jutai','AM','2023-08-17 20:05:19','2023-08-17 20:05:19'),(109,'1302405','Labrea','AM','2023-08-17 20:05:19','2023-08-17 20:05:19'),(110,'1302504','Manacapuru','AM','2023-08-17 20:05:19','2023-08-17 20:05:19'),(111,'1302553','Manaquiri','AM','2023-08-17 20:05:19','2023-08-17 20:05:19'),(112,'1302603','Manaus','AM','2023-08-17 20:05:19','2023-08-17 20:05:19'),(113,'1302702','Manicore','AM','2023-08-17 20:05:19','2023-08-17 20:05:19'),(114,'1302801','Maraa','AM','2023-08-17 20:05:19','2023-08-17 20:05:19'),(115,'1302900','Maues','AM','2023-08-17 20:05:19','2023-08-17 20:05:19'),(116,'1303007','Nhamunda','AM','2023-08-17 20:05:19','2023-08-17 20:05:19'),(117,'1303106','Nova Olinda do Norte','AM','2023-08-17 20:05:19','2023-08-17 20:05:19'),(118,'1303205','Novo Airao','AM','2023-08-17 20:05:19','2023-08-17 20:05:19'),(119,'1303304','Novo Aripuana','AM','2023-08-17 20:05:19','2023-08-17 20:05:19'),(120,'1303403','Parintins','AM','2023-08-17 20:05:19','2023-08-17 20:05:19'),(121,'1303502','Pauini','AM','2023-08-17 20:05:19','2023-08-17 20:05:19'),(122,'1303536','Presidente Figueiredo','AM','2023-08-17 20:05:19','2023-08-17 20:05:19'),(123,'1303569','Rio Preto da Eva','AM','2023-08-17 20:05:19','2023-08-17 20:05:19'),(124,'1303601','Santa Isabel do Rio Negro','AM','2023-08-17 20:05:19','2023-08-17 20:05:19'),(125,'1303700','Santo Antônio do Iça','AM','2023-08-17 20:05:19','2023-08-17 20:05:19'),(126,'1303809','Sao Gabriel da Cachoeira','AM','2023-08-17 20:05:19','2023-08-17 20:05:19'),(127,'1303908','Sao Paulo de Olivença','AM','2023-08-17 20:05:19','2023-08-17 20:05:19'),(128,'1303957','Sao Sebastiao do Uatuma','AM','2023-08-17 20:05:19','2023-08-17 20:05:19'),(129,'1304005','Silves','AM','2023-08-17 20:05:19','2023-08-17 20:05:19'),(130,'1304062','Tabatinga','AM','2023-08-17 20:05:19','2023-08-17 20:05:19'),(131,'1304104','Tapaua','AM','2023-08-17 20:05:19','2023-08-17 20:05:19'),(132,'1304203','Tefe','AM','2023-08-17 20:05:19','2023-08-17 20:05:19'),(133,'1304237','Tonantins','AM','2023-08-17 20:05:19','2023-08-17 20:05:19'),(134,'1304260','Uarini','AM','2023-08-17 20:05:19','2023-08-17 20:05:19'),(135,'1304302','Urucara','AM','2023-08-17 20:05:19','2023-08-17 20:05:19'),(136,'1304401','Urucurituba','AM','2023-08-17 20:05:19','2023-08-17 20:05:19'),(137,'1400027','Amajari','RR','2023-08-17 20:05:19','2023-08-17 20:05:19'),(138,'1400050','Alto Alegre','RR','2023-08-17 20:05:19','2023-08-17 20:05:19'),(139,'1400100','Boa Vista','RR','2023-08-17 20:05:19','2023-08-17 20:05:19'),(140,'1400159','Bonfim','RR','2023-08-17 20:05:19','2023-08-17 20:05:19'),(141,'1400175','Canta','RR','2023-08-17 20:05:19','2023-08-17 20:05:19'),(142,'1400209','Caracarai','RR','2023-08-17 20:05:19','2023-08-17 20:05:19'),(143,'1400233','Caroebe','RR','2023-08-17 20:05:19','2023-08-17 20:05:19'),(144,'1400282','Iracema','RR','2023-08-17 20:05:19','2023-08-17 20:05:19'),(145,'1400308','Mucajai','RR','2023-08-17 20:05:19','2023-08-17 20:05:19'),(146,'1400407','Normandia','RR','2023-08-17 20:05:19','2023-08-17 20:05:19'),(147,'1400456','Pacaraima','RR','2023-08-17 20:05:19','2023-08-17 20:05:19'),(148,'1400472','Rorainopolis','RR','2023-08-17 20:05:19','2023-08-17 20:05:19'),(149,'1400506','Sao Joao da Baliza','RR','2023-08-17 20:05:19','2023-08-17 20:05:19'),(150,'1400605','Sao Luiz','RR','2023-08-17 20:05:19','2023-08-17 20:05:19'),(151,'1400704','Uiramuta','RR','2023-08-17 20:05:20','2023-08-17 20:05:20'),(152,'1500107','Abaetetuba','PA','2023-08-17 20:05:20','2023-08-17 20:05:20'),(153,'1500131','Abel Figueiredo','PA','2023-08-17 20:05:20','2023-08-17 20:05:20'),(154,'1500206','Acara','PA','2023-08-17 20:05:20','2023-08-17 20:05:20'),(155,'1500305','Afua','PA','2023-08-17 20:05:20','2023-08-17 20:05:20'),(156,'1500347','agua Azul do Norte','PA','2023-08-17 20:05:20','2023-08-17 20:05:20'),(157,'1500404','Alenquer','PA','2023-08-17 20:05:20','2023-08-17 20:05:20'),(158,'1500503','Almeirim','PA','2023-08-17 20:05:20','2023-08-17 20:05:20'),(159,'1500602','Altamira','PA','2023-08-17 20:05:20','2023-08-17 20:05:20'),(160,'1500701','Anajas','PA','2023-08-17 20:05:20','2023-08-17 20:05:20'),(161,'1500800','Ananindeua','PA','2023-08-17 20:05:20','2023-08-17 20:05:20'),(162,'1500859','Anapu','PA','2023-08-17 20:05:20','2023-08-17 20:05:20'),(163,'1500909','Augusto Corrêa','PA','2023-08-17 20:05:20','2023-08-17 20:05:20'),(164,'1500958','Aurora do Para','PA','2023-08-17 20:05:20','2023-08-17 20:05:20'),(165,'1501006','Aveiro','PA','2023-08-17 20:05:20','2023-08-17 20:05:20'),(166,'1501105','Bagre','PA','2023-08-17 20:05:20','2023-08-17 20:05:20'),(167,'1501204','Baiao','PA','2023-08-17 20:05:20','2023-08-17 20:05:20'),(168,'1501253','Bannach','PA','2023-08-17 20:05:20','2023-08-17 20:05:20'),(169,'1501303','Barcarena','PA','2023-08-17 20:05:20','2023-08-17 20:05:20'),(170,'1501402','Belem','PA','2023-08-17 20:05:20','2023-08-17 20:05:20'),(171,'1501451','Belterra','PA','2023-08-17 20:05:20','2023-08-17 20:05:20'),(172,'1501501','Benevides','PA','2023-08-17 20:05:20','2023-08-17 20:05:20'),(173,'1501576','Bom Jesus do Tocantins','PA','2023-08-17 20:05:20','2023-08-17 20:05:20'),(174,'1501600','Bonito','PA','2023-08-17 20:05:20','2023-08-17 20:05:20'),(175,'1501709','Bragança','PA','2023-08-17 20:05:20','2023-08-17 20:05:20'),(176,'1501725','Brasil Novo','PA','2023-08-17 20:05:20','2023-08-17 20:05:20'),(177,'1501758','Brejo Grande do Araguaia','PA','2023-08-17 20:05:20','2023-08-17 20:05:20'),(178,'1501782','Breu Branco','PA','2023-08-17 20:05:20','2023-08-17 20:05:20'),(179,'1501808','Breves','PA','2023-08-17 20:05:20','2023-08-17 20:05:20'),(180,'1501907','Bujaru','PA','2023-08-17 20:05:20','2023-08-17 20:05:20'),(181,'1501956','Cachoeira do Piria','PA','2023-08-17 20:05:20','2023-08-17 20:05:20'),(182,'1502004','Cachoeira do Arari','PA','2023-08-17 20:05:20','2023-08-17 20:05:20'),(183,'1502103','Cameta','PA','2023-08-17 20:05:20','2023-08-17 20:05:20'),(184,'1502152','Canaa dos Carajas','PA','2023-08-17 20:05:20','2023-08-17 20:05:20'),(185,'1502202','Capanema','PA','2023-08-17 20:05:20','2023-08-17 20:05:20'),(186,'1502301','Capitao Poço','PA','2023-08-17 20:05:20','2023-08-17 20:05:20'),(187,'1502400','Castanhal','PA','2023-08-17 20:05:20','2023-08-17 20:05:20'),(188,'1502509','Chaves','PA','2023-08-17 20:05:20','2023-08-17 20:05:20'),(189,'1502608','Colares','PA','2023-08-17 20:05:20','2023-08-17 20:05:20'),(190,'1502707','Conceiçao do Araguaia','PA','2023-08-17 20:05:20','2023-08-17 20:05:20'),(191,'1502756','Concordia do Para','PA','2023-08-17 20:05:20','2023-08-17 20:05:20'),(192,'1502764','Cumaru do Norte','PA','2023-08-17 20:05:20','2023-08-17 20:05:20'),(193,'1502772','Curionopolis','PA','2023-08-17 20:05:20','2023-08-17 20:05:20'),(194,'1502806','Curralinho','PA','2023-08-17 20:05:20','2023-08-17 20:05:20'),(195,'1502855','Curua','PA','2023-08-17 20:05:20','2023-08-17 20:05:20'),(196,'1502905','Curuça','PA','2023-08-17 20:05:20','2023-08-17 20:05:20'),(197,'1502939','Dom Eliseu','PA','2023-08-17 20:05:20','2023-08-17 20:05:20'),(198,'1502954','Eldorado dos Carajas','PA','2023-08-17 20:05:20','2023-08-17 20:05:20'),(199,'1503002','Faro','PA','2023-08-17 20:05:20','2023-08-17 20:05:20'),(200,'1503044','Floresta do Araguaia','PA','2023-08-17 20:05:20','2023-08-17 20:05:20'),(201,'1503077','Garrafao do Norte','PA','2023-08-17 20:05:20','2023-08-17 20:05:20'),(202,'1503093','Goianesia do Para','PA','2023-08-17 20:05:20','2023-08-17 20:05:20'),(203,'1503101','Gurupa','PA','2023-08-17 20:05:20','2023-08-17 20:05:20'),(204,'1503200','Igarape-Açu','PA','2023-08-17 20:05:20','2023-08-17 20:05:20'),(205,'1503309','Igarape-Miri','PA','2023-08-17 20:05:20','2023-08-17 20:05:20'),(206,'1503408','Inhangapi','PA','2023-08-17 20:05:20','2023-08-17 20:05:20'),(207,'1503457','Ipixuna do Para','PA','2023-08-17 20:05:20','2023-08-17 20:05:20'),(208,'1503507','Irituia','PA','2023-08-17 20:05:20','2023-08-17 20:05:20'),(209,'1503606','Itaituba','PA','2023-08-17 20:05:20','2023-08-17 20:05:20'),(210,'1503705','Itupiranga','PA','2023-08-17 20:05:20','2023-08-17 20:05:20'),(211,'1503754','Jacareacanga','PA','2023-08-17 20:05:20','2023-08-17 20:05:20'),(212,'1503804','Jacunda','PA','2023-08-17 20:05:20','2023-08-17 20:05:20'),(213,'1503903','Juruti','PA','2023-08-17 20:05:20','2023-08-17 20:05:20'),(214,'1504000','Limoeiro do Ajuru','PA','2023-08-17 20:05:20','2023-08-17 20:05:20'),(215,'1504059','Mae do Rio','PA','2023-08-17 20:05:20','2023-08-17 20:05:20'),(216,'1504109','Magalhaes Barata','PA','2023-08-17 20:05:20','2023-08-17 20:05:20'),(217,'1504208','Maraba','PA','2023-08-17 20:05:20','2023-08-17 20:05:20'),(218,'1504307','Maracana','PA','2023-08-17 20:05:20','2023-08-17 20:05:20'),(219,'1504406','Marapanim','PA','2023-08-17 20:05:20','2023-08-17 20:05:20'),(220,'1504422','Marituba','PA','2023-08-17 20:05:20','2023-08-17 20:05:20'),(221,'1504455','Medicilândia','PA','2023-08-17 20:05:20','2023-08-17 20:05:20'),(222,'1504505','Melgaço','PA','2023-08-17 20:05:20','2023-08-17 20:05:20'),(223,'1504604','Mocajuba','PA','2023-08-17 20:05:20','2023-08-17 20:05:20'),(224,'1504703','Moju','PA','2023-08-17 20:05:20','2023-08-17 20:05:20'),(225,'1504752','Mojui dos Campos','PA','2023-08-17 20:05:20','2023-08-17 20:05:20'),(226,'1504802','Monte Alegre','PA','2023-08-17 20:05:20','2023-08-17 20:05:20'),(227,'1504901','Muana','PA','2023-08-17 20:05:20','2023-08-17 20:05:20'),(228,'1504950','Nova Esperança do Piria','PA','2023-08-17 20:05:20','2023-08-17 20:05:20'),(229,'1504976','Nova Ipixuna','PA','2023-08-17 20:05:20','2023-08-17 20:05:20'),(230,'1505007','Nova Timboteua','PA','2023-08-17 20:05:20','2023-08-17 20:05:20'),(231,'1505031','Novo Progresso','PA','2023-08-17 20:05:20','2023-08-17 20:05:20'),(232,'1505064','Novo Repartimento','PA','2023-08-17 20:05:20','2023-08-17 20:05:20'),(233,'1505106','obidos','PA','2023-08-17 20:05:20','2023-08-17 20:05:20'),(234,'1505205','Oeiras do Para','PA','2023-08-17 20:05:20','2023-08-17 20:05:20'),(235,'1505304','Oriximina','PA','2023-08-17 20:05:20','2023-08-17 20:05:20'),(236,'1505403','Ourem','PA','2023-08-17 20:05:20','2023-08-17 20:05:20'),(237,'1505437','Ourilândia do Norte','PA','2023-08-17 20:05:20','2023-08-17 20:05:20'),(238,'1505486','Pacaja','PA','2023-08-17 20:05:20','2023-08-17 20:05:20'),(239,'1505494','Palestina do Para','PA','2023-08-17 20:05:20','2023-08-17 20:05:20'),(240,'1505502','Paragominas','PA','2023-08-17 20:05:20','2023-08-17 20:05:20'),(241,'1505536','Parauapebas','PA','2023-08-17 20:05:20','2023-08-17 20:05:20'),(242,'1505551','Pau D\'Arco','PA','2023-08-17 20:05:20','2023-08-17 20:05:20'),(243,'1505601','Peixe-Boi','PA','2023-08-17 20:05:20','2023-08-17 20:05:20'),(244,'1505635','Piçarra','PA','2023-08-17 20:05:20','2023-08-17 20:05:20'),(245,'1505650','Placas','PA','2023-08-17 20:05:20','2023-08-17 20:05:20'),(246,'1505700','Ponta de Pedras','PA','2023-08-17 20:05:20','2023-08-17 20:05:20'),(247,'1505809','Portel','PA','2023-08-17 20:05:20','2023-08-17 20:05:20'),(248,'1505908','Porto de Moz','PA','2023-08-17 20:05:20','2023-08-17 20:05:20'),(249,'1506005','Prainha','PA','2023-08-17 20:05:20','2023-08-17 20:05:20'),(250,'1506104','Primavera','PA','2023-08-17 20:05:20','2023-08-17 20:05:20'),(251,'1506112','Quatipuru','PA','2023-08-17 20:05:20','2023-08-17 20:05:20'),(252,'1506138','Redençao','PA','2023-08-17 20:05:20','2023-08-17 20:05:20'),(253,'1506161','Rio Maria','PA','2023-08-17 20:05:20','2023-08-17 20:05:20'),(254,'1506187','Rondon do Para','PA','2023-08-17 20:05:20','2023-08-17 20:05:20'),(255,'1506195','Ruropolis','PA','2023-08-17 20:05:20','2023-08-17 20:05:20'),(256,'1506203','Salinopolis','PA','2023-08-17 20:05:20','2023-08-17 20:05:20'),(257,'1506302','Salvaterra','PA','2023-08-17 20:05:20','2023-08-17 20:05:20'),(258,'1506351','Santa Barbara do Para','PA','2023-08-17 20:05:20','2023-08-17 20:05:20'),(259,'1506401','Santa Cruz do Arari','PA','2023-08-17 20:05:20','2023-08-17 20:05:20'),(260,'1506500','Santa Isabel do Para','PA','2023-08-17 20:05:20','2023-08-17 20:05:20'),(261,'1506559','Santa Luzia do Para','PA','2023-08-17 20:05:20','2023-08-17 20:05:20'),(262,'1506583','Santa Maria das Barreiras','PA','2023-08-17 20:05:20','2023-08-17 20:05:20'),(263,'1506609','Santa Maria do Para','PA','2023-08-17 20:05:20','2023-08-17 20:05:20'),(264,'1506708','Santana do Araguaia','PA','2023-08-17 20:05:20','2023-08-17 20:05:20'),(265,'1506807','Santarem','PA','2023-08-17 20:05:20','2023-08-17 20:05:20'),(266,'1506906','Santarem Novo','PA','2023-08-17 20:05:20','2023-08-17 20:05:20'),(267,'1507003','Santo Antônio do Taua','PA','2023-08-17 20:05:20','2023-08-17 20:05:20'),(268,'1507102','Sao Caetano de Odivelas','PA','2023-08-17 20:05:20','2023-08-17 20:05:20'),(269,'1507151','Sao Domingos do Araguaia','PA','2023-08-17 20:05:20','2023-08-17 20:05:20'),(270,'1507201','Sao Domingos do Capim','PA','2023-08-17 20:05:20','2023-08-17 20:05:20'),(271,'1507300','Sao Felix do Xingu','PA','2023-08-17 20:05:20','2023-08-17 20:05:20'),(272,'1507409','Sao Francisco do Para','PA','2023-08-17 20:05:20','2023-08-17 20:05:20'),(273,'1507458','Sao Geraldo do Araguaia','PA','2023-08-17 20:05:20','2023-08-17 20:05:20'),(274,'1507466','Sao Joao da Ponta','PA','2023-08-17 20:05:20','2023-08-17 20:05:20'),(275,'1507474','Sao Joao de Pirabas','PA','2023-08-17 20:05:20','2023-08-17 20:05:20'),(276,'1507508','Sao Joao do Araguaia','PA','2023-08-17 20:05:20','2023-08-17 20:05:20'),(277,'1507607','Sao Miguel do Guama','PA','2023-08-17 20:05:20','2023-08-17 20:05:20'),(278,'1507706','Sao Sebastiao da Boa Vista','PA','2023-08-17 20:05:20','2023-08-17 20:05:20'),(279,'1507755','Sapucaia','PA','2023-08-17 20:05:20','2023-08-17 20:05:20'),(280,'1507805','Senador Jose Porfirio','PA','2023-08-17 20:05:20','2023-08-17 20:05:20'),(281,'1507904','Soure','PA','2023-08-17 20:05:20','2023-08-17 20:05:20'),(282,'1507953','Tailândia','PA','2023-08-17 20:05:20','2023-08-17 20:05:20'),(283,'1507961','Terra Alta','PA','2023-08-17 20:05:20','2023-08-17 20:05:20'),(284,'1507979','Terra Santa','PA','2023-08-17 20:05:20','2023-08-17 20:05:20'),(285,'1508001','Tome-Açu','PA','2023-08-17 20:05:20','2023-08-17 20:05:20'),(286,'1508035','Tracuateua','PA','2023-08-17 20:05:20','2023-08-17 20:05:20'),(287,'1508050','Trairao','PA','2023-08-17 20:05:20','2023-08-17 20:05:20'),(288,'1508084','Tucuma','PA','2023-08-17 20:05:20','2023-08-17 20:05:20'),(289,'1508100','Tucurui','PA','2023-08-17 20:05:20','2023-08-17 20:05:20'),(290,'1508126','Ulianopolis','PA','2023-08-17 20:05:20','2023-08-17 20:05:20'),(291,'1508159','Uruara','PA','2023-08-17 20:05:20','2023-08-17 20:05:20'),(292,'1508209','Vigia','PA','2023-08-17 20:05:20','2023-08-17 20:05:20'),(293,'1508308','Viseu','PA','2023-08-17 20:05:20','2023-08-17 20:05:20'),(294,'1508357','Vitoria do Xingu','PA','2023-08-17 20:05:20','2023-08-17 20:05:20'),(295,'1508407','Xinguara','PA','2023-08-17 20:05:20','2023-08-17 20:05:20'),(296,'1600055','Serra do Navio','AP','2023-08-17 20:05:20','2023-08-17 20:05:20'),(297,'1600105','Amapa','AP','2023-08-17 20:05:20','2023-08-17 20:05:20'),(298,'1600154','Pedra Branca do Amapari','AP','2023-08-17 20:05:20','2023-08-17 20:05:20'),(299,'1600204','Calçoene','AP','2023-08-17 20:05:20','2023-08-17 20:05:20'),(300,'1600212','Cutias','AP','2023-08-17 20:05:20','2023-08-17 20:05:20'),(301,'1600238','Ferreira Gomes','AP','2023-08-17 20:05:20','2023-08-17 20:05:20'),(302,'1600253','Itaubal','AP','2023-08-17 20:05:20','2023-08-17 20:05:20'),(303,'1600279','Laranjal do Jari','AP','2023-08-17 20:05:20','2023-08-17 20:05:20'),(304,'1600303','Macapa','AP','2023-08-17 20:05:20','2023-08-17 20:05:20'),(305,'1600402','Mazagao','AP','2023-08-17 20:05:20','2023-08-17 20:05:20'),(306,'1600501','Oiapoque','AP','2023-08-17 20:05:20','2023-08-17 20:05:20'),(307,'1600535','Porto Grande','AP','2023-08-17 20:05:20','2023-08-17 20:05:20'),(308,'1600550','Pracuuba','AP','2023-08-17 20:05:20','2023-08-17 20:05:20'),(309,'1600600','Santana','AP','2023-08-17 20:05:20','2023-08-17 20:05:20'),(310,'1600709','Tartarugalzinho','AP','2023-08-17 20:05:20','2023-08-17 20:05:20'),(311,'1600808','Vitoria do Jari','AP','2023-08-17 20:05:20','2023-08-17 20:05:20'),(312,'1700251','Abreulândia','TO','2023-08-17 20:05:20','2023-08-17 20:05:20'),(313,'1700301','Aguiarnopolis','TO','2023-08-17 20:05:20','2023-08-17 20:05:20'),(314,'1700350','Aliança do Tocantins','TO','2023-08-17 20:05:20','2023-08-17 20:05:20'),(315,'1700400','Almas','TO','2023-08-17 20:05:20','2023-08-17 20:05:20'),(316,'1700707','Alvorada','TO','2023-08-17 20:05:20','2023-08-17 20:05:20'),(317,'1701002','Ananas','TO','2023-08-17 20:05:20','2023-08-17 20:05:20'),(318,'1701051','Angico','TO','2023-08-17 20:05:20','2023-08-17 20:05:20'),(319,'1701101','Aparecida do Rio Negro','TO','2023-08-17 20:05:20','2023-08-17 20:05:20'),(320,'1701309','Aragominas','TO','2023-08-17 20:05:20','2023-08-17 20:05:20'),(321,'1701903','Araguacema','TO','2023-08-17 20:05:20','2023-08-17 20:05:20'),(322,'1702000','Araguaçu','TO','2023-08-17 20:05:20','2023-08-17 20:05:20'),(323,'1702109','Araguaina','TO','2023-08-17 20:05:20','2023-08-17 20:05:20'),(324,'1702158','Araguana','TO','2023-08-17 20:05:20','2023-08-17 20:05:20'),(325,'1702208','Araguatins','TO','2023-08-17 20:05:20','2023-08-17 20:05:20'),(326,'1702307','Arapoema','TO','2023-08-17 20:05:20','2023-08-17 20:05:20'),(327,'1702406','Arraias','TO','2023-08-17 20:05:20','2023-08-17 20:05:20'),(328,'1702554','Augustinopolis','TO','2023-08-17 20:05:20','2023-08-17 20:05:20'),(329,'1702703','Aurora do Tocantins','TO','2023-08-17 20:05:20','2023-08-17 20:05:20'),(330,'1702901','Axixa do Tocantins','TO','2023-08-17 20:05:20','2023-08-17 20:05:20'),(331,'1703008','Babaçulândia','TO','2023-08-17 20:05:20','2023-08-17 20:05:20'),(332,'1703057','Bandeirantes do Tocantins','TO','2023-08-17 20:05:20','2023-08-17 20:05:20'),(333,'1703073','Barra do Ouro','TO','2023-08-17 20:05:20','2023-08-17 20:05:20'),(334,'1703107','Barrolândia','TO','2023-08-17 20:05:20','2023-08-17 20:05:20'),(335,'1703206','Bernardo Sayao','TO','2023-08-17 20:05:20','2023-08-17 20:05:20'),(336,'1703305','Bom Jesus do Tocantins','TO','2023-08-17 20:05:20','2023-08-17 20:05:20'),(337,'1703602','Brasilândia do Tocantins','TO','2023-08-17 20:05:20','2023-08-17 20:05:20'),(338,'1703701','Brejinho de Nazare','TO','2023-08-17 20:05:20','2023-08-17 20:05:20'),(339,'1703800','Buriti do Tocantins','TO','2023-08-17 20:05:20','2023-08-17 20:05:20'),(340,'1703826','Cachoeirinha','TO','2023-08-17 20:05:20','2023-08-17 20:05:20'),(341,'1703842','Campos Lindos','TO','2023-08-17 20:05:20','2023-08-17 20:05:20'),(342,'1703867','Cariri do Tocantins','TO','2023-08-17 20:05:20','2023-08-17 20:05:20'),(343,'1703883','Carmolândia','TO','2023-08-17 20:05:20','2023-08-17 20:05:20'),(344,'1703891','Carrasco Bonito','TO','2023-08-17 20:05:20','2023-08-17 20:05:20'),(345,'1703909','Caseara','TO','2023-08-17 20:05:20','2023-08-17 20:05:20'),(346,'1704105','Centenario','TO','2023-08-17 20:05:20','2023-08-17 20:05:20'),(347,'1704600','Chapada de Areia','TO','2023-08-17 20:05:20','2023-08-17 20:05:20'),(348,'1705102','Chapada da Natividade','TO','2023-08-17 20:05:20','2023-08-17 20:05:20'),(349,'1705508','Colinas do Tocantins','TO','2023-08-17 20:05:20','2023-08-17 20:05:20'),(350,'1705557','Combinado','TO','2023-08-17 20:05:20','2023-08-17 20:05:20'),(351,'1705607','Conceiçao do Tocantins','TO','2023-08-17 20:05:20','2023-08-17 20:05:20'),(352,'1706001','Couto Magalhaes','TO','2023-08-17 20:05:20','2023-08-17 20:05:20'),(353,'1706100','Cristalândia','TO','2023-08-17 20:05:20','2023-08-17 20:05:20'),(354,'1706258','Crixas do Tocantins','TO','2023-08-17 20:05:20','2023-08-17 20:05:20'),(355,'1706506','Darcinopolis','TO','2023-08-17 20:05:20','2023-08-17 20:05:20'),(356,'1707009','Dianopolis','TO','2023-08-17 20:05:20','2023-08-17 20:05:20'),(357,'1707108','Divinopolis do Tocantins','TO','2023-08-17 20:05:20','2023-08-17 20:05:20'),(358,'1707207','Dois Irmaos do Tocantins','TO','2023-08-17 20:05:20','2023-08-17 20:05:20'),(359,'1707306','Duere','TO','2023-08-17 20:05:20','2023-08-17 20:05:20'),(360,'1707405','Esperantina','TO','2023-08-17 20:05:20','2023-08-17 20:05:20'),(361,'1707553','Fatima','TO','2023-08-17 20:05:20','2023-08-17 20:05:20'),(362,'1707652','Figueiropolis','TO','2023-08-17 20:05:20','2023-08-17 20:05:20'),(363,'1707702','Filadelfia','TO','2023-08-17 20:05:20','2023-08-17 20:05:20'),(364,'1708205','Formoso do Araguaia','TO','2023-08-17 20:05:20','2023-08-17 20:05:20'),(365,'1708254','Fortaleza do Tabocao','TO','2023-08-17 20:05:20','2023-08-17 20:05:20'),(366,'1708304','Goianorte','TO','2023-08-17 20:05:20','2023-08-17 20:05:20'),(367,'1709005','Goiatins','TO','2023-08-17 20:05:20','2023-08-17 20:05:20'),(368,'1709302','Guarai','TO','2023-08-17 20:05:20','2023-08-17 20:05:20'),(369,'1709500','Gurupi','TO','2023-08-17 20:05:20','2023-08-17 20:05:20'),(370,'1709807','Ipueiras','TO','2023-08-17 20:05:20','2023-08-17 20:05:20'),(371,'1710508','Itacaja','TO','2023-08-17 20:05:20','2023-08-17 20:05:20'),(372,'1710706','Itaguatins','TO','2023-08-17 20:05:20','2023-08-17 20:05:20'),(373,'1710904','Itapiratins','TO','2023-08-17 20:05:20','2023-08-17 20:05:20'),(374,'1711100','Itapora do Tocantins','TO','2023-08-17 20:05:20','2023-08-17 20:05:20'),(375,'1711506','Jau do Tocantins','TO','2023-08-17 20:05:20','2023-08-17 20:05:20'),(376,'1711803','Juarina','TO','2023-08-17 20:05:20','2023-08-17 20:05:20'),(377,'1711902','Lagoa da Confusao','TO','2023-08-17 20:05:20','2023-08-17 20:05:20'),(378,'1711951','Lagoa do Tocantins','TO','2023-08-17 20:05:20','2023-08-17 20:05:20'),(379,'1712009','Lajeado','TO','2023-08-17 20:05:20','2023-08-17 20:05:20'),(380,'1712157','Lavandeira','TO','2023-08-17 20:05:20','2023-08-17 20:05:20'),(381,'1712405','Lizarda','TO','2023-08-17 20:05:20','2023-08-17 20:05:20'),(382,'1712454','Luzinopolis','TO','2023-08-17 20:05:20','2023-08-17 20:05:20'),(383,'1712504','Marianopolis do Tocantins','TO','2023-08-17 20:05:20','2023-08-17 20:05:20'),(384,'1712702','Mateiros','TO','2023-08-17 20:05:20','2023-08-17 20:05:20'),(385,'1712801','Maurilândia do Tocantins','TO','2023-08-17 20:05:20','2023-08-17 20:05:20'),(386,'1713205','Miracema do Tocantins','TO','2023-08-17 20:05:20','2023-08-17 20:05:20'),(387,'1713304','Miranorte','TO','2023-08-17 20:05:20','2023-08-17 20:05:20'),(388,'1713601','Monte do Carmo','TO','2023-08-17 20:05:20','2023-08-17 20:05:20'),(389,'1713700','Monte Santo do Tocantins','TO','2023-08-17 20:05:20','2023-08-17 20:05:20'),(390,'1713809','Palmeiras do Tocantins','TO','2023-08-17 20:05:20','2023-08-17 20:05:20'),(391,'1713957','Muricilândia','TO','2023-08-17 20:05:20','2023-08-17 20:05:20'),(392,'1714203','Natividade','TO','2023-08-17 20:05:20','2023-08-17 20:05:20'),(393,'1714302','Nazare','TO','2023-08-17 20:05:20','2023-08-17 20:05:20'),(394,'1714880','Nova Olinda','TO','2023-08-17 20:05:20','2023-08-17 20:05:20'),(395,'1715002','Nova Rosalândia','TO','2023-08-17 20:05:20','2023-08-17 20:05:20'),(396,'1715101','Novo Acordo','TO','2023-08-17 20:05:20','2023-08-17 20:05:20'),(397,'1715150','Novo Alegre','TO','2023-08-17 20:05:20','2023-08-17 20:05:20'),(398,'1715259','Novo Jardim','TO','2023-08-17 20:05:20','2023-08-17 20:05:20'),(399,'1715507','Oliveira de Fatima','TO','2023-08-17 20:05:20','2023-08-17 20:05:20'),(400,'1715705','Palmeirante','TO','2023-08-17 20:05:20','2023-08-17 20:05:20'),(401,'1715754','Palmeiropolis','TO','2023-08-17 20:05:20','2023-08-17 20:05:20'),(402,'1716109','Paraiso do Tocantins','TO','2023-08-17 20:05:20','2023-08-17 20:05:20'),(403,'1716208','Parana','TO','2023-08-17 20:05:20','2023-08-17 20:05:20'),(404,'1716307','Pau D\'Arco','TO','2023-08-17 20:05:20','2023-08-17 20:05:20'),(405,'1716505','Pedro Afonso','TO','2023-08-17 20:05:20','2023-08-17 20:05:20'),(406,'1716604','Peixe','TO','2023-08-17 20:05:20','2023-08-17 20:05:20'),(407,'1716653','Pequizeiro','TO','2023-08-17 20:05:20','2023-08-17 20:05:20'),(408,'1716703','Colmeia','TO','2023-08-17 20:05:20','2023-08-17 20:05:20'),(409,'1717008','Pindorama do Tocantins','TO','2023-08-17 20:05:20','2023-08-17 20:05:20'),(410,'1717206','Piraquê','TO','2023-08-17 20:05:20','2023-08-17 20:05:20'),(411,'1717503','Pium','TO','2023-08-17 20:05:20','2023-08-17 20:05:20'),(412,'1717800','Ponte Alta do Bom Jesus','TO','2023-08-17 20:05:20','2023-08-17 20:05:20'),(413,'1717909','Ponte Alta do Tocantins','TO','2023-08-17 20:05:20','2023-08-17 20:05:20'),(414,'1718006','Porto Alegre do Tocantins','TO','2023-08-17 20:05:20','2023-08-17 20:05:20'),(415,'1718204','Porto Nacional','TO','2023-08-17 20:05:20','2023-08-17 20:05:20'),(416,'1718303','Praia Norte','TO','2023-08-17 20:05:20','2023-08-17 20:05:20'),(417,'1718402','Presidente Kennedy','TO','2023-08-17 20:05:20','2023-08-17 20:05:20'),(418,'1718451','Pugmil','TO','2023-08-17 20:05:20','2023-08-17 20:05:20'),(419,'1718501','Recursolândia','TO','2023-08-17 20:05:20','2023-08-17 20:05:20'),(420,'1718550','Riachinho','TO','2023-08-17 20:05:20','2023-08-17 20:05:20'),(421,'1718659','Rio da Conceiçao','TO','2023-08-17 20:05:20','2023-08-17 20:05:20'),(422,'1718709','Rio dos Bois','TO','2023-08-17 20:05:20','2023-08-17 20:05:20'),(423,'1718758','Rio Sono','TO','2023-08-17 20:05:20','2023-08-17 20:05:20'),(424,'1718808','Sampaio','TO','2023-08-17 20:05:20','2023-08-17 20:05:20'),(425,'1718840','Sandolândia','TO','2023-08-17 20:05:20','2023-08-17 20:05:20'),(426,'1718865','Santa Fe do Araguaia','TO','2023-08-17 20:05:20','2023-08-17 20:05:20'),(427,'1718881','Santa Maria do Tocantins','TO','2023-08-17 20:05:20','2023-08-17 20:05:20'),(428,'1718899','Santa Rita do Tocantins','TO','2023-08-17 20:05:20','2023-08-17 20:05:20'),(429,'1718907','Santa Rosa do Tocantins','TO','2023-08-17 20:05:20','2023-08-17 20:05:20'),(430,'1719004','Santa Tereza do Tocantins','TO','2023-08-17 20:05:20','2023-08-17 20:05:20'),(431,'1720002','Santa Terezinha do Tocantins','TO','2023-08-17 20:05:20','2023-08-17 20:05:20'),(432,'1720101','Sao Bento do Tocantins','TO','2023-08-17 20:05:20','2023-08-17 20:05:20'),(433,'1720150','Sao Felix do Tocantins','TO','2023-08-17 20:05:20','2023-08-17 20:05:20'),(434,'1720200','Sao Miguel do Tocantins','TO','2023-08-17 20:05:20','2023-08-17 20:05:20'),(435,'1720259','Sao Salvador do Tocantins','TO','2023-08-17 20:05:20','2023-08-17 20:05:20'),(436,'1720309','Sao Sebastiao do Tocantins','TO','2023-08-17 20:05:20','2023-08-17 20:05:20'),(437,'1720499','Sao Valerio','TO','2023-08-17 20:05:20','2023-08-17 20:05:20'),(438,'1720655','Silvanopolis','TO','2023-08-17 20:05:20','2023-08-17 20:05:20'),(439,'1720804','Sitio Novo do Tocantins','TO','2023-08-17 20:05:20','2023-08-17 20:05:20'),(440,'1720853','Sucupira','TO','2023-08-17 20:05:20','2023-08-17 20:05:20'),(441,'1720903','Taguatinga','TO','2023-08-17 20:05:20','2023-08-17 20:05:20'),(442,'1720937','Taipas do Tocantins','TO','2023-08-17 20:05:20','2023-08-17 20:05:20'),(443,'1720978','Talisma','TO','2023-08-17 20:05:20','2023-08-17 20:05:20'),(444,'1721000','Palmas','TO','2023-08-17 20:05:20','2023-08-17 20:05:20'),(445,'1721109','Tocantinia','TO','2023-08-17 20:05:20','2023-08-17 20:05:20'),(446,'1721208','Tocantinopolis','TO','2023-08-17 20:05:20','2023-08-17 20:05:20'),(447,'1721257','Tupirama','TO','2023-08-17 20:05:20','2023-08-17 20:05:20'),(448,'1721307','Tupiratins','TO','2023-08-17 20:05:20','2023-08-17 20:05:20'),(449,'1722081','Wanderlândia','TO','2023-08-17 20:05:20','2023-08-17 20:05:20'),(450,'1722107','Xambioa','TO','2023-08-17 20:05:20','2023-08-17 20:05:20'),(451,'2100055','Açailândia','MA','2023-08-17 20:05:20','2023-08-17 20:05:20'),(452,'2100105','Afonso Cunha','MA','2023-08-17 20:05:20','2023-08-17 20:05:20'),(453,'2100154','agua Doce do Maranhao','MA','2023-08-17 20:05:20','2023-08-17 20:05:20'),(454,'2100204','Alcântara','MA','2023-08-17 20:05:20','2023-08-17 20:05:20'),(455,'2100303','Aldeias Altas','MA','2023-08-17 20:05:20','2023-08-17 20:05:20'),(456,'2100402','Altamira do Maranhao','MA','2023-08-17 20:05:20','2023-08-17 20:05:20'),(457,'2100436','Alto Alegre do Maranhao','MA','2023-08-17 20:05:20','2023-08-17 20:05:20'),(458,'2100477','Alto Alegre do Pindare','MA','2023-08-17 20:05:20','2023-08-17 20:05:20'),(459,'2100501','Alto Parnaiba','MA','2023-08-17 20:05:20','2023-08-17 20:05:20'),(460,'2100550','Amapa do Maranhao','MA','2023-08-17 20:05:20','2023-08-17 20:05:20'),(461,'2100600','Amarante do Maranhao','MA','2023-08-17 20:05:20','2023-08-17 20:05:20'),(462,'2100709','Anajatuba','MA','2023-08-17 20:05:20','2023-08-17 20:05:20'),(463,'2100808','Anapurus','MA','2023-08-17 20:05:20','2023-08-17 20:05:20'),(464,'2100832','Apicum-Açu','MA','2023-08-17 20:05:20','2023-08-17 20:05:20'),(465,'2100873','Araguana','MA','2023-08-17 20:05:20','2023-08-17 20:05:20'),(466,'2100907','Araioses','MA','2023-08-17 20:05:20','2023-08-17 20:05:20'),(467,'2100956','Arame','MA','2023-08-17 20:05:20','2023-08-17 20:05:20'),(468,'2101004','Arari','MA','2023-08-17 20:05:20','2023-08-17 20:05:20'),(469,'2101103','Axixa','MA','2023-08-17 20:05:20','2023-08-17 20:05:20'),(470,'2101202','Bacabal','MA','2023-08-17 20:05:20','2023-08-17 20:05:20'),(471,'2101251','Bacabeira','MA','2023-08-17 20:05:20','2023-08-17 20:05:20'),(472,'2101301','Bacuri','MA','2023-08-17 20:05:20','2023-08-17 20:05:20'),(473,'2101350','Bacurituba','MA','2023-08-17 20:05:20','2023-08-17 20:05:20'),(474,'2101400','Balsas','MA','2023-08-17 20:05:20','2023-08-17 20:05:20'),(475,'2101509','Barao de Grajau','MA','2023-08-17 20:05:20','2023-08-17 20:05:20'),(476,'2101608','Barra do Corda','MA','2023-08-17 20:05:20','2023-08-17 20:05:20'),(477,'2101707','Barreirinhas','MA','2023-08-17 20:05:20','2023-08-17 20:05:20'),(478,'2101731','Belagua','MA','2023-08-17 20:05:20','2023-08-17 20:05:20'),(479,'2101772','Bela Vista do Maranhao','MA','2023-08-17 20:05:20','2023-08-17 20:05:20'),(480,'2101806','Benedito Leite','MA','2023-08-17 20:05:20','2023-08-17 20:05:20'),(481,'2101905','Bequimao','MA','2023-08-17 20:05:20','2023-08-17 20:05:20'),(482,'2101939','Bernardo do Mearim','MA','2023-08-17 20:05:20','2023-08-17 20:05:20'),(483,'2101970','Boa Vista do Gurupi','MA','2023-08-17 20:05:20','2023-08-17 20:05:20'),(484,'2102002','Bom Jardim','MA','2023-08-17 20:05:20','2023-08-17 20:05:20'),(485,'2102036','Bom Jesus das Selvas','MA','2023-08-17 20:05:20','2023-08-17 20:05:20'),(486,'2102077','Bom Lugar','MA','2023-08-17 20:05:20','2023-08-17 20:05:20'),(487,'2102101','Brejo','MA','2023-08-17 20:05:20','2023-08-17 20:05:20'),(488,'2102150','Brejo de Areia','MA','2023-08-17 20:05:20','2023-08-17 20:05:20'),(489,'2102200','Buriti','MA','2023-08-17 20:05:20','2023-08-17 20:05:20'),(490,'2102309','Buriti Bravo','MA','2023-08-17 20:05:20','2023-08-17 20:05:20'),(491,'2102325','Buriticupu','MA','2023-08-17 20:05:20','2023-08-17 20:05:20'),(492,'2102358','Buritirana','MA','2023-08-17 20:05:20','2023-08-17 20:05:20'),(493,'2102374','Cachoeira Grande','MA','2023-08-17 20:05:20','2023-08-17 20:05:20'),(494,'2102408','Cajapio','MA','2023-08-17 20:05:20','2023-08-17 20:05:20'),(495,'2102507','Cajari','MA','2023-08-17 20:05:20','2023-08-17 20:05:20'),(496,'2102556','Campestre do Maranhao','MA','2023-08-17 20:05:20','2023-08-17 20:05:20'),(497,'2102606','Cândido Mendes','MA','2023-08-17 20:05:20','2023-08-17 20:05:20'),(498,'2102705','Cantanhede','MA','2023-08-17 20:05:20','2023-08-17 20:05:20'),(499,'2102754','Capinzal do Norte','MA','2023-08-17 20:05:20','2023-08-17 20:05:20'),(500,'2102804','Carolina','MA','2023-08-17 20:05:20','2023-08-17 20:05:20'),(501,'2102903','Carutapera','MA','2023-08-17 20:05:21','2023-08-17 20:05:21'),(502,'2103000','Caxias','MA','2023-08-17 20:05:21','2023-08-17 20:05:21'),(503,'2103109','Cedral','MA','2023-08-17 20:05:21','2023-08-17 20:05:21'),(504,'2103125','Central do Maranhao','MA','2023-08-17 20:05:21','2023-08-17 20:05:21'),(505,'2103158','Centro do Guilherme','MA','2023-08-17 20:05:21','2023-08-17 20:05:21'),(506,'2103174','Centro Novo do Maranhao','MA','2023-08-17 20:05:21','2023-08-17 20:05:21'),(507,'2103208','Chapadinha','MA','2023-08-17 20:05:21','2023-08-17 20:05:21'),(508,'2103257','Cidelândia','MA','2023-08-17 20:05:21','2023-08-17 20:05:21'),(509,'2103307','Codo','MA','2023-08-17 20:05:21','2023-08-17 20:05:21'),(510,'2103406','Coelho Neto','MA','2023-08-17 20:05:21','2023-08-17 20:05:21'),(511,'2103505','Colinas','MA','2023-08-17 20:05:21','2023-08-17 20:05:21'),(512,'2103554','Conceiçao do Lago-Açu','MA','2023-08-17 20:05:21','2023-08-17 20:05:21'),(513,'2103604','Coroata','MA','2023-08-17 20:05:21','2023-08-17 20:05:21'),(514,'2103703','Cururupu','MA','2023-08-17 20:05:21','2023-08-17 20:05:21'),(515,'2103752','Davinopolis','MA','2023-08-17 20:05:21','2023-08-17 20:05:21'),(516,'2103802','Dom Pedro','MA','2023-08-17 20:05:21','2023-08-17 20:05:21'),(517,'2103901','Duque Bacelar','MA','2023-08-17 20:05:21','2023-08-17 20:05:21'),(518,'2104008','Esperantinopolis','MA','2023-08-17 20:05:21','2023-08-17 20:05:21'),(519,'2104057','Estreito','MA','2023-08-17 20:05:21','2023-08-17 20:05:21'),(520,'2104073','Feira Nova do Maranhao','MA','2023-08-17 20:05:21','2023-08-17 20:05:21'),(521,'2104081','Fernando Falcao','MA','2023-08-17 20:05:21','2023-08-17 20:05:21'),(522,'2104099','Formosa da Serra Negra','MA','2023-08-17 20:05:21','2023-08-17 20:05:21'),(523,'2104107','Fortaleza dos Nogueiras','MA','2023-08-17 20:05:21','2023-08-17 20:05:21'),(524,'2104206','Fortuna','MA','2023-08-17 20:05:21','2023-08-17 20:05:21'),(525,'2104305','Godofredo Viana','MA','2023-08-17 20:05:21','2023-08-17 20:05:21'),(526,'2104404','Gonçalves Dias','MA','2023-08-17 20:05:21','2023-08-17 20:05:21'),(527,'2104503','Governador Archer','MA','2023-08-17 20:05:21','2023-08-17 20:05:21'),(528,'2104552','Governador Edison Lobao','MA','2023-08-17 20:05:21','2023-08-17 20:05:21'),(529,'2104602','Governador Eugênio Barros','MA','2023-08-17 20:05:21','2023-08-17 20:05:21'),(530,'2104628','Governador Luiz Rocha','MA','2023-08-17 20:05:21','2023-08-17 20:05:21'),(531,'2104651','Governador Newton Bello','MA','2023-08-17 20:05:21','2023-08-17 20:05:21'),(532,'2104677','Governador Nunes Freire','MA','2023-08-17 20:05:21','2023-08-17 20:05:21'),(533,'2104701','Graça Aranha','MA','2023-08-17 20:05:21','2023-08-17 20:05:21'),(534,'2104800','Grajau','MA','2023-08-17 20:05:21','2023-08-17 20:05:21'),(535,'2104909','Guimaraes','MA','2023-08-17 20:05:21','2023-08-17 20:05:21'),(536,'2105005','Humberto de Campos','MA','2023-08-17 20:05:21','2023-08-17 20:05:21'),(537,'2105104','Icatu','MA','2023-08-17 20:05:21','2023-08-17 20:05:21'),(538,'2105153','Igarape do Meio','MA','2023-08-17 20:05:21','2023-08-17 20:05:21'),(539,'2105203','Igarape Grande','MA','2023-08-17 20:05:21','2023-08-17 20:05:21'),(540,'2105302','Imperatriz','MA','2023-08-17 20:05:21','2023-08-17 20:05:21'),(541,'2105351','Itaipava do Grajau','MA','2023-08-17 20:05:21','2023-08-17 20:05:21'),(542,'2105401','Itapecuru Mirim','MA','2023-08-17 20:05:21','2023-08-17 20:05:21'),(543,'2105427','Itinga do Maranhao','MA','2023-08-17 20:05:21','2023-08-17 20:05:21'),(544,'2105450','Jatoba','MA','2023-08-17 20:05:21','2023-08-17 20:05:21'),(545,'2105476','Jenipapo dos Vieiras','MA','2023-08-17 20:05:21','2023-08-17 20:05:21'),(546,'2105500','Joao Lisboa','MA','2023-08-17 20:05:21','2023-08-17 20:05:21'),(547,'2105609','Joselândia','MA','2023-08-17 20:05:21','2023-08-17 20:05:21'),(548,'2105658','Junco do Maranhao','MA','2023-08-17 20:05:21','2023-08-17 20:05:21'),(549,'2105708','Lago da Pedra','MA','2023-08-17 20:05:21','2023-08-17 20:05:21'),(550,'2105807','Lago do Junco','MA','2023-08-17 20:05:21','2023-08-17 20:05:21'),(551,'2105906','Lago Verde','MA','2023-08-17 20:05:21','2023-08-17 20:05:21'),(552,'2105922','Lagoa do Mato','MA','2023-08-17 20:05:21','2023-08-17 20:05:21'),(553,'2105948','Lago dos Rodrigues','MA','2023-08-17 20:05:21','2023-08-17 20:05:21'),(554,'2105963','Lagoa Grande do Maranhao','MA','2023-08-17 20:05:21','2023-08-17 20:05:21'),(555,'2105989','Lajeado Novo','MA','2023-08-17 20:05:21','2023-08-17 20:05:21'),(556,'2106003','Lima Campos','MA','2023-08-17 20:05:21','2023-08-17 20:05:21'),(557,'2106102','Loreto','MA','2023-08-17 20:05:21','2023-08-17 20:05:21'),(558,'2106201','Luis Domingues','MA','2023-08-17 20:05:21','2023-08-17 20:05:21'),(559,'2106300','Magalhaes de Almeida','MA','2023-08-17 20:05:21','2023-08-17 20:05:21'),(560,'2106326','Maracaçume','MA','2023-08-17 20:05:21','2023-08-17 20:05:21'),(561,'2106359','Maraja do Sena','MA','2023-08-17 20:05:21','2023-08-17 20:05:21'),(562,'2106375','Maranhaozinho','MA','2023-08-17 20:05:21','2023-08-17 20:05:21'),(563,'2106409','Mata Roma','MA','2023-08-17 20:05:21','2023-08-17 20:05:21'),(564,'2106508','Matinha','MA','2023-08-17 20:05:21','2023-08-17 20:05:21'),(565,'2106607','Matoes','MA','2023-08-17 20:05:21','2023-08-17 20:05:21'),(566,'2106631','Matoes do Norte','MA','2023-08-17 20:05:21','2023-08-17 20:05:21'),(567,'2106672','Milagres do Maranhao','MA','2023-08-17 20:05:21','2023-08-17 20:05:21'),(568,'2106706','Mirador','MA','2023-08-17 20:05:21','2023-08-17 20:05:21'),(569,'2106755','Miranda do Norte','MA','2023-08-17 20:05:21','2023-08-17 20:05:21'),(570,'2106805','Mirinzal','MA','2023-08-17 20:05:21','2023-08-17 20:05:21'),(571,'2106904','Monçao','MA','2023-08-17 20:05:21','2023-08-17 20:05:21'),(572,'2107001','Montes Altos','MA','2023-08-17 20:05:21','2023-08-17 20:05:21'),(573,'2107100','Morros','MA','2023-08-17 20:05:21','2023-08-17 20:05:21'),(574,'2107209','Nina Rodrigues','MA','2023-08-17 20:05:21','2023-08-17 20:05:21'),(575,'2107258','Nova Colinas','MA','2023-08-17 20:05:21','2023-08-17 20:05:21'),(576,'2107308','Nova Iorque','MA','2023-08-17 20:05:21','2023-08-17 20:05:21'),(577,'2107357','Nova Olinda do Maranhao','MA','2023-08-17 20:05:21','2023-08-17 20:05:21'),(578,'2107407','Olho D\'agua das Cunhas','MA','2023-08-17 20:05:21','2023-08-17 20:05:21'),(579,'2107456','Olinda Nova do Maranhao','MA','2023-08-17 20:05:21','2023-08-17 20:05:21'),(580,'2107506','Paço do Lumiar','MA','2023-08-17 20:05:21','2023-08-17 20:05:21'),(581,'2107605','Palmeirândia','MA','2023-08-17 20:05:21','2023-08-17 20:05:21'),(582,'2107704','Paraibano','MA','2023-08-17 20:05:21','2023-08-17 20:05:21'),(583,'2107803','Parnarama','MA','2023-08-17 20:05:21','2023-08-17 20:05:21'),(584,'2107902','Passagem Franca','MA','2023-08-17 20:05:21','2023-08-17 20:05:21'),(585,'2108009','Pastos Bons','MA','2023-08-17 20:05:21','2023-08-17 20:05:21'),(586,'2108058','Paulino Neves','MA','2023-08-17 20:05:21','2023-08-17 20:05:21'),(587,'2108108','Paulo Ramos','MA','2023-08-17 20:05:21','2023-08-17 20:05:21'),(588,'2108207','Pedreiras','MA','2023-08-17 20:05:21','2023-08-17 20:05:21'),(589,'2108256','Pedro do Rosario','MA','2023-08-17 20:05:21','2023-08-17 20:05:21'),(590,'2108306','Penalva','MA','2023-08-17 20:05:21','2023-08-17 20:05:21'),(591,'2108405','Peri Mirim','MA','2023-08-17 20:05:21','2023-08-17 20:05:21'),(592,'2108454','Peritoro','MA','2023-08-17 20:05:21','2023-08-17 20:05:21'),(593,'2108504','Pindare-Mirim','MA','2023-08-17 20:05:21','2023-08-17 20:05:21'),(594,'2108603','Pinheiro','MA','2023-08-17 20:05:21','2023-08-17 20:05:21'),(595,'2108702','Pio XII','MA','2023-08-17 20:05:21','2023-08-17 20:05:21'),(596,'2108801','Pirapemas','MA','2023-08-17 20:05:21','2023-08-17 20:05:21'),(597,'2108900','Poçao de Pedras','MA','2023-08-17 20:05:21','2023-08-17 20:05:21'),(598,'2109007','Porto Franco','MA','2023-08-17 20:05:21','2023-08-17 20:05:21'),(599,'2109056','Porto Rico do Maranhao','MA','2023-08-17 20:05:21','2023-08-17 20:05:21'),(600,'2109106','Presidente Dutra','MA','2023-08-17 20:05:21','2023-08-17 20:05:21'),(601,'2109205','Presidente Juscelino','MA','2023-08-17 20:05:21','2023-08-17 20:05:21'),(602,'2109239','Presidente Medici','MA','2023-08-17 20:05:21','2023-08-17 20:05:21'),(603,'2109270','Presidente Sarney','MA','2023-08-17 20:05:21','2023-08-17 20:05:21'),(604,'2109304','Presidente Vargas','MA','2023-08-17 20:05:21','2023-08-17 20:05:21'),(605,'2109403','Primeira Cruz','MA','2023-08-17 20:05:21','2023-08-17 20:05:21'),(606,'2109452','Raposa','MA','2023-08-17 20:05:21','2023-08-17 20:05:21'),(607,'2109502','Riachao','MA','2023-08-17 20:05:21','2023-08-17 20:05:21'),(608,'2109551','Ribamar Fiquene','MA','2023-08-17 20:05:21','2023-08-17 20:05:21'),(609,'2109601','Rosario','MA','2023-08-17 20:05:21','2023-08-17 20:05:21'),(610,'2109700','Sambaiba','MA','2023-08-17 20:05:21','2023-08-17 20:05:21'),(611,'2109759','Santa Filomena do Maranhao','MA','2023-08-17 20:05:21','2023-08-17 20:05:21'),(612,'2109809','Santa Helena','MA','2023-08-17 20:05:21','2023-08-17 20:05:21'),(613,'2109908','Santa Inês','MA','2023-08-17 20:05:21','2023-08-17 20:05:21'),(614,'2110005','Santa Luzia','MA','2023-08-17 20:05:21','2023-08-17 20:05:21'),(615,'2110039','Santa Luzia do Parua','MA','2023-08-17 20:05:21','2023-08-17 20:05:21'),(616,'2110104','Santa Quiteria do Maranhao','MA','2023-08-17 20:05:21','2023-08-17 20:05:21'),(617,'2110203','Santa Rita','MA','2023-08-17 20:05:21','2023-08-17 20:05:21'),(618,'2110237','Santana do Maranhao','MA','2023-08-17 20:05:21','2023-08-17 20:05:21'),(619,'2110278','Santo Amaro do Maranhao','MA','2023-08-17 20:05:21','2023-08-17 20:05:21'),(620,'2110302','Santo Antônio dos Lopes','MA','2023-08-17 20:05:21','2023-08-17 20:05:21'),(621,'2110401','Sao Benedito do Rio Preto','MA','2023-08-17 20:05:21','2023-08-17 20:05:21'),(622,'2110500','Sao Bento','MA','2023-08-17 20:05:21','2023-08-17 20:05:21'),(623,'2110609','Sao Bernardo','MA','2023-08-17 20:05:21','2023-08-17 20:05:21'),(624,'2110658','Sao Domingos do Azeitao','MA','2023-08-17 20:05:21','2023-08-17 20:05:21'),(625,'2110708','Sao Domingos do Maranhao','MA','2023-08-17 20:05:21','2023-08-17 20:05:21'),(626,'2110807','Sao Felix de Balsas','MA','2023-08-17 20:05:21','2023-08-17 20:05:21'),(627,'2110856','Sao Francisco do Brejao','MA','2023-08-17 20:05:21','2023-08-17 20:05:21'),(628,'2110906','Sao Francisco do Maranhao','MA','2023-08-17 20:05:21','2023-08-17 20:05:21'),(629,'2111003','Sao Joao Batista','MA','2023-08-17 20:05:21','2023-08-17 20:05:21'),(630,'2111029','Sao Joao do Caru','MA','2023-08-17 20:05:21','2023-08-17 20:05:21'),(631,'2111052','Sao Joao do Paraiso','MA','2023-08-17 20:05:21','2023-08-17 20:05:21'),(632,'2111078','Sao Joao do Soter','MA','2023-08-17 20:05:21','2023-08-17 20:05:21'),(633,'2111102','Sao Joao dos Patos','MA','2023-08-17 20:05:21','2023-08-17 20:05:21'),(634,'2111201','Sao Jose de Ribamar','MA','2023-08-17 20:05:21','2023-08-17 20:05:21'),(635,'2111250','Sao Jose dos Basilios','MA','2023-08-17 20:05:21','2023-08-17 20:05:21'),(636,'2111300','Sao Luis','MA','2023-08-17 20:05:21','2023-08-17 20:05:21'),(637,'2111409','Sao Luis Gonzaga do Maranhao','MA','2023-08-17 20:05:21','2023-08-17 20:05:21'),(638,'2111508','Sao Mateus do Maranhao','MA','2023-08-17 20:05:21','2023-08-17 20:05:21'),(639,'2111532','Sao Pedro da agua Branca','MA','2023-08-17 20:05:21','2023-08-17 20:05:21'),(640,'2111573','Sao Pedro dos Crentes','MA','2023-08-17 20:05:21','2023-08-17 20:05:21'),(641,'2111607','Sao Raimundo das Mangabeiras','MA','2023-08-17 20:05:21','2023-08-17 20:05:21'),(642,'2111631','Sao Raimundo do Doca Bezerra','MA','2023-08-17 20:05:21','2023-08-17 20:05:21'),(643,'2111672','Sao Roberto','MA','2023-08-17 20:05:21','2023-08-17 20:05:21'),(644,'2111706','Sao Vicente Ferrer','MA','2023-08-17 20:05:21','2023-08-17 20:05:21'),(645,'2111722','Satubinha','MA','2023-08-17 20:05:21','2023-08-17 20:05:21'),(646,'2111748','Senador Alexandre Costa','MA','2023-08-17 20:05:21','2023-08-17 20:05:21'),(647,'2111763','Senador La Rocque','MA','2023-08-17 20:05:21','2023-08-17 20:05:21'),(648,'2111789','Serrano do Maranhao','MA','2023-08-17 20:05:21','2023-08-17 20:05:21'),(649,'2111805','Sitio Novo','MA','2023-08-17 20:05:21','2023-08-17 20:05:21'),(650,'2111904','Sucupira do Norte','MA','2023-08-17 20:05:21','2023-08-17 20:05:21'),(651,'2111953','Sucupira do Riachao','MA','2023-08-17 20:05:21','2023-08-17 20:05:21'),(652,'2112001','Tasso Fragoso','MA','2023-08-17 20:05:21','2023-08-17 20:05:21'),(653,'2112100','Timbiras','MA','2023-08-17 20:05:21','2023-08-17 20:05:21'),(654,'2112209','Timon','MA','2023-08-17 20:05:21','2023-08-17 20:05:21'),(655,'2112233','Trizidela do Vale','MA','2023-08-17 20:05:21','2023-08-17 20:05:21'),(656,'2112274','Tufilândia','MA','2023-08-17 20:05:21','2023-08-17 20:05:21'),(657,'2112308','Tuntum','MA','2023-08-17 20:05:21','2023-08-17 20:05:21'),(658,'2112407','Turiaçu','MA','2023-08-17 20:05:21','2023-08-17 20:05:21'),(659,'2112456','Turilândia','MA','2023-08-17 20:05:21','2023-08-17 20:05:21'),(660,'2112506','Tutoia','MA','2023-08-17 20:05:21','2023-08-17 20:05:21'),(661,'2112605','Urbano Santos','MA','2023-08-17 20:05:21','2023-08-17 20:05:21'),(662,'2112704','Vargem Grande','MA','2023-08-17 20:05:21','2023-08-17 20:05:21'),(663,'2112803','Viana','MA','2023-08-17 20:05:21','2023-08-17 20:05:21'),(664,'2112852','Vila Nova dos Martirios','MA','2023-08-17 20:05:21','2023-08-17 20:05:21'),(665,'2112902','Vitoria do Mearim','MA','2023-08-17 20:05:21','2023-08-17 20:05:21'),(666,'2113009','Vitorino Freire','MA','2023-08-17 20:05:21','2023-08-17 20:05:21'),(667,'2114007','Ze Doca','MA','2023-08-17 20:05:21','2023-08-17 20:05:21'),(668,'2200053','Acaua','PI','2023-08-17 20:05:21','2023-08-17 20:05:21'),(669,'2200103','Agricolândia','PI','2023-08-17 20:05:21','2023-08-17 20:05:21'),(670,'2200202','agua Branca','PI','2023-08-17 20:05:21','2023-08-17 20:05:21'),(671,'2200251','Alagoinha do Piaui','PI','2023-08-17 20:05:21','2023-08-17 20:05:21'),(672,'2200277','Alegrete do Piaui','PI','2023-08-17 20:05:21','2023-08-17 20:05:21'),(673,'2200301','Alto Longa','PI','2023-08-17 20:05:21','2023-08-17 20:05:21'),(674,'2200400','Altos','PI','2023-08-17 20:05:21','2023-08-17 20:05:21'),(675,'2200459','Alvorada do Gurgueia','PI','2023-08-17 20:05:21','2023-08-17 20:05:21'),(676,'2200509','Amarante','PI','2023-08-17 20:05:21','2023-08-17 20:05:21'),(677,'2200608','Angical do Piaui','PI','2023-08-17 20:05:21','2023-08-17 20:05:21'),(678,'2200707','Anisio de Abreu','PI','2023-08-17 20:05:21','2023-08-17 20:05:21'),(679,'2200806','Antônio Almeida','PI','2023-08-17 20:05:21','2023-08-17 20:05:21'),(680,'2200905','Aroazes','PI','2023-08-17 20:05:21','2023-08-17 20:05:21'),(681,'2200954','Aroeiras do Itaim','PI','2023-08-17 20:05:21','2023-08-17 20:05:21'),(682,'2201002','Arraial','PI','2023-08-17 20:05:21','2023-08-17 20:05:21'),(683,'2201051','Assunçao do Piaui','PI','2023-08-17 20:05:21','2023-08-17 20:05:21'),(684,'2201101','Avelino Lopes','PI','2023-08-17 20:05:21','2023-08-17 20:05:21'),(685,'2201150','Baixa Grande do Ribeiro','PI','2023-08-17 20:05:21','2023-08-17 20:05:21'),(686,'2201176','Barra D\'Alcântara','PI','2023-08-17 20:05:21','2023-08-17 20:05:21'),(687,'2201200','Barras','PI','2023-08-17 20:05:21','2023-08-17 20:05:21'),(688,'2201309','Barreiras do Piaui','PI','2023-08-17 20:05:21','2023-08-17 20:05:21'),(689,'2201408','Barro Duro','PI','2023-08-17 20:05:21','2023-08-17 20:05:21'),(690,'2201507','Batalha','PI','2023-08-17 20:05:21','2023-08-17 20:05:21'),(691,'2201556','Bela Vista do Piaui','PI','2023-08-17 20:05:21','2023-08-17 20:05:21'),(692,'2201572','Belem do Piaui','PI','2023-08-17 20:05:21','2023-08-17 20:05:21'),(693,'2201606','Beneditinos','PI','2023-08-17 20:05:21','2023-08-17 20:05:21'),(694,'2201705','Bertolinia','PI','2023-08-17 20:05:21','2023-08-17 20:05:21'),(695,'2201739','Betânia do Piaui','PI','2023-08-17 20:05:21','2023-08-17 20:05:21'),(696,'2201770','Boa Hora','PI','2023-08-17 20:05:21','2023-08-17 20:05:21'),(697,'2201804','Bocaina','PI','2023-08-17 20:05:21','2023-08-17 20:05:21'),(698,'2201903','Bom Jesus','PI','2023-08-17 20:05:21','2023-08-17 20:05:21'),(699,'2201919','Bom Principio do Piaui','PI','2023-08-17 20:05:21','2023-08-17 20:05:21'),(700,'2201929','Bonfim do Piaui','PI','2023-08-17 20:05:21','2023-08-17 20:05:21'),(701,'2201945','Boqueirao do Piaui','PI','2023-08-17 20:05:21','2023-08-17 20:05:21'),(702,'2201960','Brasileira','PI','2023-08-17 20:05:21','2023-08-17 20:05:21'),(703,'2201988','Brejo do Piaui','PI','2023-08-17 20:05:21','2023-08-17 20:05:21'),(704,'2202000','Buriti dos Lopes','PI','2023-08-17 20:05:21','2023-08-17 20:05:21'),(705,'2202026','Buriti dos Montes','PI','2023-08-17 20:05:21','2023-08-17 20:05:21'),(706,'2202059','Cabeceiras do Piaui','PI','2023-08-17 20:05:21','2023-08-17 20:05:21'),(707,'2202075','Cajazeiras do Piaui','PI','2023-08-17 20:05:21','2023-08-17 20:05:21'),(708,'2202083','Cajueiro da Praia','PI','2023-08-17 20:05:21','2023-08-17 20:05:21'),(709,'2202091','Caldeirao Grande do Piaui','PI','2023-08-17 20:05:21','2023-08-17 20:05:21'),(710,'2202109','Campinas do Piaui','PI','2023-08-17 20:05:21','2023-08-17 20:05:21'),(711,'2202117','Campo Alegre do Fidalgo','PI','2023-08-17 20:05:21','2023-08-17 20:05:21'),(712,'2202133','Campo Grande do Piaui','PI','2023-08-17 20:05:21','2023-08-17 20:05:21'),(713,'2202174','Campo Largo do Piaui','PI','2023-08-17 20:05:21','2023-08-17 20:05:21'),(714,'2202208','Campo Maior','PI','2023-08-17 20:05:21','2023-08-17 20:05:21'),(715,'2202251','Canavieira','PI','2023-08-17 20:05:21','2023-08-17 20:05:21'),(716,'2202307','Canto do Buriti','PI','2023-08-17 20:05:21','2023-08-17 20:05:21'),(717,'2202406','Capitao de Campos','PI','2023-08-17 20:05:21','2023-08-17 20:05:21'),(718,'2202455','Capitao Gervasio Oliveira','PI','2023-08-17 20:05:21','2023-08-17 20:05:21'),(719,'2202505','Caracol','PI','2023-08-17 20:05:21','2023-08-17 20:05:21'),(720,'2202539','Caraubas do Piaui','PI','2023-08-17 20:05:21','2023-08-17 20:05:21'),(721,'2202554','Caridade do Piaui','PI','2023-08-17 20:05:21','2023-08-17 20:05:21'),(722,'2202604','Castelo do Piaui','PI','2023-08-17 20:05:21','2023-08-17 20:05:21'),(723,'2202653','Caxingo','PI','2023-08-17 20:05:21','2023-08-17 20:05:21'),(724,'2202703','Cocal','PI','2023-08-17 20:05:21','2023-08-17 20:05:21'),(725,'2202711','Cocal de Telha','PI','2023-08-17 20:05:21','2023-08-17 20:05:21'),(726,'2202729','Cocal dos Alves','PI','2023-08-17 20:05:21','2023-08-17 20:05:21'),(727,'2202737','Coivaras','PI','2023-08-17 20:05:21','2023-08-17 20:05:21'),(728,'2202752','Colônia do Gurgueia','PI','2023-08-17 20:05:21','2023-08-17 20:05:21'),(729,'2202778','Colônia do Piaui','PI','2023-08-17 20:05:21','2023-08-17 20:05:21'),(730,'2202802','Conceiçao do Caninde','PI','2023-08-17 20:05:21','2023-08-17 20:05:21'),(731,'2202851','Coronel Jose Dias','PI','2023-08-17 20:05:21','2023-08-17 20:05:21'),(732,'2202901','Corrente','PI','2023-08-17 20:05:21','2023-08-17 20:05:21'),(733,'2203008','Cristalândia do Piaui','PI','2023-08-17 20:05:21','2023-08-17 20:05:21'),(734,'2203107','Cristino Castro','PI','2023-08-17 20:05:21','2023-08-17 20:05:21'),(735,'2203206','Curimata','PI','2023-08-17 20:05:21','2023-08-17 20:05:21'),(736,'2203230','Currais','PI','2023-08-17 20:05:21','2023-08-17 20:05:21'),(737,'2203255','Curralinhos','PI','2023-08-17 20:05:21','2023-08-17 20:05:21'),(738,'2203271','Curral Novo do Piaui','PI','2023-08-17 20:05:21','2023-08-17 20:05:21'),(739,'2203305','Demerval Lobao','PI','2023-08-17 20:05:21','2023-08-17 20:05:21'),(740,'2203354','Dirceu Arcoverde','PI','2023-08-17 20:05:21','2023-08-17 20:05:21'),(741,'2203404','Dom Expedito Lopes','PI','2023-08-17 20:05:21','2023-08-17 20:05:21'),(742,'2203420','Domingos Mourao','PI','2023-08-17 20:05:21','2023-08-17 20:05:21'),(743,'2203453','Dom Inocêncio','PI','2023-08-17 20:05:21','2023-08-17 20:05:21'),(744,'2203503','Elesbao Veloso','PI','2023-08-17 20:05:21','2023-08-17 20:05:21'),(745,'2203602','Eliseu Martins','PI','2023-08-17 20:05:21','2023-08-17 20:05:21'),(746,'2203701','Esperantina','PI','2023-08-17 20:05:21','2023-08-17 20:05:21'),(747,'2203750','Fartura do Piaui','PI','2023-08-17 20:05:21','2023-08-17 20:05:21'),(748,'2203800','Flores do Piaui','PI','2023-08-17 20:05:21','2023-08-17 20:05:21'),(749,'2203859','Floresta do Piaui','PI','2023-08-17 20:05:21','2023-08-17 20:05:21'),(750,'2203909','Floriano','PI','2023-08-17 20:05:21','2023-08-17 20:05:21'),(751,'2204006','Francinopolis','PI','2023-08-17 20:05:21','2023-08-17 20:05:21'),(752,'2204105','Francisco Ayres','PI','2023-08-17 20:05:21','2023-08-17 20:05:21'),(753,'2204154','Francisco Macedo','PI','2023-08-17 20:05:21','2023-08-17 20:05:21'),(754,'2204204','Francisco Santos','PI','2023-08-17 20:05:21','2023-08-17 20:05:21'),(755,'2204303','Fronteiras','PI','2023-08-17 20:05:21','2023-08-17 20:05:21'),(756,'2204352','Geminiano','PI','2023-08-17 20:05:21','2023-08-17 20:05:21'),(757,'2204402','Gilbues','PI','2023-08-17 20:05:21','2023-08-17 20:05:21'),(758,'2204501','Guadalupe','PI','2023-08-17 20:05:21','2023-08-17 20:05:21'),(759,'2204550','Guaribas','PI','2023-08-17 20:05:21','2023-08-17 20:05:21'),(760,'2204600','Hugo Napoleao','PI','2023-08-17 20:05:21','2023-08-17 20:05:21'),(761,'2204659','Ilha Grande','PI','2023-08-17 20:05:21','2023-08-17 20:05:21'),(762,'2204709','Inhuma','PI','2023-08-17 20:05:21','2023-08-17 20:05:21'),(763,'2204808','Ipiranga do Piaui','PI','2023-08-17 20:05:21','2023-08-17 20:05:21'),(764,'2204907','Isaias Coelho','PI','2023-08-17 20:05:21','2023-08-17 20:05:21'),(765,'2205003','Itainopolis','PI','2023-08-17 20:05:21','2023-08-17 20:05:21'),(766,'2205102','Itaueira','PI','2023-08-17 20:05:21','2023-08-17 20:05:21'),(767,'2205151','Jacobina do Piaui','PI','2023-08-17 20:05:21','2023-08-17 20:05:21'),(768,'2205201','Jaicos','PI','2023-08-17 20:05:21','2023-08-17 20:05:21'),(769,'2205250','Jardim do Mulato','PI','2023-08-17 20:05:21','2023-08-17 20:05:21'),(770,'2205276','Jatoba do Piaui','PI','2023-08-17 20:05:21','2023-08-17 20:05:21'),(771,'2205300','Jerumenha','PI','2023-08-17 20:05:21','2023-08-17 20:05:21'),(772,'2205359','Joao Costa','PI','2023-08-17 20:05:21','2023-08-17 20:05:21'),(773,'2205409','Joaquim Pires','PI','2023-08-17 20:05:21','2023-08-17 20:05:21'),(774,'2205458','Joca Marques','PI','2023-08-17 20:05:21','2023-08-17 20:05:21'),(775,'2205508','Jose de Freitas','PI','2023-08-17 20:05:21','2023-08-17 20:05:21'),(776,'2205516','Juazeiro do Piaui','PI','2023-08-17 20:05:21','2023-08-17 20:05:21'),(777,'2205524','Julio Borges','PI','2023-08-17 20:05:21','2023-08-17 20:05:21'),(778,'2205532','Jurema','PI','2023-08-17 20:05:21','2023-08-17 20:05:21'),(779,'2205540','Lagoinha do Piaui','PI','2023-08-17 20:05:21','2023-08-17 20:05:21'),(780,'2205557','Lagoa Alegre','PI','2023-08-17 20:05:21','2023-08-17 20:05:21'),(781,'2205565','Lagoa do Barro do Piaui','PI','2023-08-17 20:05:21','2023-08-17 20:05:21'),(782,'2205573','Lagoa de Sao Francisco','PI','2023-08-17 20:05:21','2023-08-17 20:05:21'),(783,'2205581','Lagoa do Piaui','PI','2023-08-17 20:05:21','2023-08-17 20:05:21'),(784,'2205599','Lagoa do Sitio','PI','2023-08-17 20:05:21','2023-08-17 20:05:21'),(785,'2205607','Landri Sales','PI','2023-08-17 20:05:21','2023-08-17 20:05:21'),(786,'2205706','Luis Correia','PI','2023-08-17 20:05:21','2023-08-17 20:05:21'),(787,'2205805','Luzilândia','PI','2023-08-17 20:05:21','2023-08-17 20:05:21'),(788,'2205854','Madeiro','PI','2023-08-17 20:05:21','2023-08-17 20:05:21'),(789,'2205904','Manoel Emidio','PI','2023-08-17 20:05:21','2023-08-17 20:05:21'),(790,'2205953','Marcolândia','PI','2023-08-17 20:05:21','2023-08-17 20:05:21'),(791,'2206001','Marcos Parente','PI','2023-08-17 20:05:21','2023-08-17 20:05:21'),(792,'2206050','Massapê do Piaui','PI','2023-08-17 20:05:21','2023-08-17 20:05:21'),(793,'2206100','Matias Olimpio','PI','2023-08-17 20:05:21','2023-08-17 20:05:21'),(794,'2206209','Miguel Alves','PI','2023-08-17 20:05:22','2023-08-17 20:05:22'),(795,'2206308','Miguel Leao','PI','2023-08-17 20:05:22','2023-08-17 20:05:22'),(796,'2206357','Milton Brandao','PI','2023-08-17 20:05:22','2023-08-17 20:05:22'),(797,'2206407','Monsenhor Gil','PI','2023-08-17 20:05:22','2023-08-17 20:05:22'),(798,'2206506','Monsenhor Hipolito','PI','2023-08-17 20:05:22','2023-08-17 20:05:22'),(799,'2206605','Monte Alegre do Piaui','PI','2023-08-17 20:05:22','2023-08-17 20:05:22'),(800,'2206654','Morro Cabeça no Tempo','PI','2023-08-17 20:05:22','2023-08-17 20:05:22'),(801,'2206670','Morro do Chapeu do Piaui','PI','2023-08-17 20:05:22','2023-08-17 20:05:22'),(802,'2206696','Murici dos Portelas','PI','2023-08-17 20:05:22','2023-08-17 20:05:22'),(803,'2206704','Nazare do Piaui','PI','2023-08-17 20:05:22','2023-08-17 20:05:22'),(804,'2206720','Nazaria','PI','2023-08-17 20:05:22','2023-08-17 20:05:22'),(805,'2206753','Nossa Senhora de Nazare','PI','2023-08-17 20:05:22','2023-08-17 20:05:22'),(806,'2206803','Nossa Senhora dos Remedios','PI','2023-08-17 20:05:22','2023-08-17 20:05:22'),(807,'2206902','Novo Oriente do Piaui','PI','2023-08-17 20:05:22','2023-08-17 20:05:22'),(808,'2206951','Novo Santo Antônio','PI','2023-08-17 20:05:22','2023-08-17 20:05:22'),(809,'2207009','Oeiras','PI','2023-08-17 20:05:22','2023-08-17 20:05:22'),(810,'2207108','Olho D\'agua do Piaui','PI','2023-08-17 20:05:22','2023-08-17 20:05:22'),(811,'2207207','Padre Marcos','PI','2023-08-17 20:05:22','2023-08-17 20:05:22'),(812,'2207306','Paes Landim','PI','2023-08-17 20:05:22','2023-08-17 20:05:22'),(813,'2207355','Pajeu do Piaui','PI','2023-08-17 20:05:22','2023-08-17 20:05:22'),(814,'2207405','Palmeira do Piaui','PI','2023-08-17 20:05:22','2023-08-17 20:05:22'),(815,'2207504','Palmeirais','PI','2023-08-17 20:05:22','2023-08-17 20:05:22'),(816,'2207553','Paqueta','PI','2023-08-17 20:05:22','2023-08-17 20:05:22'),(817,'2207603','Parnagua','PI','2023-08-17 20:05:22','2023-08-17 20:05:22'),(818,'2207702','Parnaiba','PI','2023-08-17 20:05:22','2023-08-17 20:05:22'),(819,'2207751','Passagem Franca do Piaui','PI','2023-08-17 20:05:22','2023-08-17 20:05:22'),(820,'2207777','Patos do Piaui','PI','2023-08-17 20:05:22','2023-08-17 20:05:22'),(821,'2207793','Pau D\'Arco do Piaui','PI','2023-08-17 20:05:22','2023-08-17 20:05:22'),(822,'2207801','Paulistana','PI','2023-08-17 20:05:22','2023-08-17 20:05:22'),(823,'2207850','Pavussu','PI','2023-08-17 20:05:22','2023-08-17 20:05:22'),(824,'2207900','Pedro II','PI','2023-08-17 20:05:22','2023-08-17 20:05:22'),(825,'2207934','Pedro Laurentino','PI','2023-08-17 20:05:22','2023-08-17 20:05:22'),(826,'2207959','Nova Santa Rita','PI','2023-08-17 20:05:22','2023-08-17 20:05:22'),(827,'2208007','Picos','PI','2023-08-17 20:05:22','2023-08-17 20:05:22'),(828,'2208106','Pimenteiras','PI','2023-08-17 20:05:22','2023-08-17 20:05:22'),(829,'2208205','Pio IX','PI','2023-08-17 20:05:22','2023-08-17 20:05:22'),(830,'2208304','Piracuruca','PI','2023-08-17 20:05:22','2023-08-17 20:05:22'),(831,'2208403','Piripiri','PI','2023-08-17 20:05:22','2023-08-17 20:05:22'),(832,'2208502','Porto','PI','2023-08-17 20:05:22','2023-08-17 20:05:22'),(833,'2208551','Porto Alegre do Piaui','PI','2023-08-17 20:05:22','2023-08-17 20:05:22'),(834,'2208601','Prata do Piaui','PI','2023-08-17 20:05:22','2023-08-17 20:05:22'),(835,'2208650','Queimada Nova','PI','2023-08-17 20:05:22','2023-08-17 20:05:22'),(836,'2208700','Redençao do Gurgueia','PI','2023-08-17 20:05:22','2023-08-17 20:05:22'),(837,'2208809','Regeneraçao','PI','2023-08-17 20:05:22','2023-08-17 20:05:22'),(838,'2208858','Riacho Frio','PI','2023-08-17 20:05:22','2023-08-17 20:05:22'),(839,'2208874','Ribeira do Piaui','PI','2023-08-17 20:05:22','2023-08-17 20:05:22'),(840,'2208908','Ribeiro Gonçalves','PI','2023-08-17 20:05:22','2023-08-17 20:05:22'),(841,'2209005','Rio Grande do Piaui','PI','2023-08-17 20:05:22','2023-08-17 20:05:22'),(842,'2209104','Santa Cruz do Piaui','PI','2023-08-17 20:05:22','2023-08-17 20:05:22'),(843,'2209153','Santa Cruz dos Milagres','PI','2023-08-17 20:05:22','2023-08-17 20:05:22'),(844,'2209203','Santa Filomena','PI','2023-08-17 20:05:22','2023-08-17 20:05:22'),(845,'2209302','Santa Luz','PI','2023-08-17 20:05:22','2023-08-17 20:05:22'),(846,'2209351','Santana do Piaui','PI','2023-08-17 20:05:22','2023-08-17 20:05:22'),(847,'2209377','Santa Rosa do Piaui','PI','2023-08-17 20:05:22','2023-08-17 20:05:22'),(848,'2209401','Santo Antônio de Lisboa','PI','2023-08-17 20:05:22','2023-08-17 20:05:22'),(849,'2209450','Santo Antônio dos Milagres','PI','2023-08-17 20:05:22','2023-08-17 20:05:22'),(850,'2209500','Santo Inacio do Piaui','PI','2023-08-17 20:05:22','2023-08-17 20:05:22'),(851,'2209559','Sao Braz do Piaui','PI','2023-08-17 20:05:22','2023-08-17 20:05:22'),(852,'2209609','Sao Felix do Piaui','PI','2023-08-17 20:05:22','2023-08-17 20:05:22'),(853,'2209658','Sao Francisco de Assis do Piaui','PI','2023-08-17 20:05:22','2023-08-17 20:05:22'),(854,'2209708','Sao Francisco do Piaui','PI','2023-08-17 20:05:22','2023-08-17 20:05:22'),(855,'2209757','Sao Gonçalo do Gurgueia','PI','2023-08-17 20:05:22','2023-08-17 20:05:22'),(856,'2209807','Sao Gonçalo do Piaui','PI','2023-08-17 20:05:22','2023-08-17 20:05:22'),(857,'2209856','Sao Joao da Canabrava','PI','2023-08-17 20:05:22','2023-08-17 20:05:22'),(858,'2209872','Sao Joao da Fronteira','PI','2023-08-17 20:05:22','2023-08-17 20:05:22'),(859,'2209906','Sao Joao da Serra','PI','2023-08-17 20:05:22','2023-08-17 20:05:22'),(860,'2209955','Sao Joao da Varjota','PI','2023-08-17 20:05:22','2023-08-17 20:05:22'),(861,'2209971','Sao Joao do Arraial','PI','2023-08-17 20:05:22','2023-08-17 20:05:22'),(862,'2210003','Sao Joao do Piaui','PI','2023-08-17 20:05:22','2023-08-17 20:05:22'),(863,'2210052','Sao Jose do Divino','PI','2023-08-17 20:05:22','2023-08-17 20:05:22'),(864,'2210102','Sao Jose do Peixe','PI','2023-08-17 20:05:22','2023-08-17 20:05:22'),(865,'2210201','Sao Jose do Piaui','PI','2023-08-17 20:05:22','2023-08-17 20:05:22'),(866,'2210300','Sao Juliao','PI','2023-08-17 20:05:22','2023-08-17 20:05:22'),(867,'2210359','Sao Lourenço do Piaui','PI','2023-08-17 20:05:22','2023-08-17 20:05:22'),(868,'2210375','Sao Luis do Piaui','PI','2023-08-17 20:05:22','2023-08-17 20:05:22'),(869,'2210383','Sao Miguel da Baixa Grande','PI','2023-08-17 20:05:22','2023-08-17 20:05:22'),(870,'2210391','Sao Miguel do Fidalgo','PI','2023-08-17 20:05:22','2023-08-17 20:05:22'),(871,'2210409','Sao Miguel do Tapuio','PI','2023-08-17 20:05:22','2023-08-17 20:05:22'),(872,'2210508','Sao Pedro do Piaui','PI','2023-08-17 20:05:22','2023-08-17 20:05:22'),(873,'2210607','Sao Raimundo Nonato','PI','2023-08-17 20:05:22','2023-08-17 20:05:22'),(874,'2210623','Sebastiao Barros','PI','2023-08-17 20:05:22','2023-08-17 20:05:22'),(875,'2210631','Sebastiao Leal','PI','2023-08-17 20:05:22','2023-08-17 20:05:22'),(876,'2210656','Sigefredo Pacheco','PI','2023-08-17 20:05:22','2023-08-17 20:05:22'),(877,'2210706','Simoes','PI','2023-08-17 20:05:22','2023-08-17 20:05:22'),(878,'2210805','Simplicio Mendes','PI','2023-08-17 20:05:22','2023-08-17 20:05:22'),(879,'2210904','Socorro do Piaui','PI','2023-08-17 20:05:22','2023-08-17 20:05:22'),(880,'2210938','Sussuapara','PI','2023-08-17 20:05:22','2023-08-17 20:05:22'),(881,'2210953','Tamboril do Piaui','PI','2023-08-17 20:05:22','2023-08-17 20:05:22'),(882,'2210979','Tanque do Piaui','PI','2023-08-17 20:05:22','2023-08-17 20:05:22'),(883,'2211001','Teresina','PI','2023-08-17 20:05:22','2023-08-17 20:05:22'),(884,'2211100','Uniao','PI','2023-08-17 20:05:22','2023-08-17 20:05:22'),(885,'2211209','Uruçui','PI','2023-08-17 20:05:22','2023-08-17 20:05:22'),(886,'2211308','Valença do Piaui','PI','2023-08-17 20:05:22','2023-08-17 20:05:22'),(887,'2211357','Varzea Branca','PI','2023-08-17 20:05:22','2023-08-17 20:05:22'),(888,'2211407','Varzea Grande','PI','2023-08-17 20:05:22','2023-08-17 20:05:22'),(889,'2211506','Vera Mendes','PI','2023-08-17 20:05:22','2023-08-17 20:05:22'),(890,'2211605','Vila Nova do Piaui','PI','2023-08-17 20:05:22','2023-08-17 20:05:22'),(891,'2211704','Wall Ferraz','PI','2023-08-17 20:05:22','2023-08-17 20:05:22'),(892,'2300101','Abaiara','CE','2023-08-17 20:05:22','2023-08-17 20:05:22'),(893,'2300150','Acarape','CE','2023-08-17 20:05:22','2023-08-17 20:05:22'),(894,'2300200','Acarau','CE','2023-08-17 20:05:22','2023-08-17 20:05:22'),(895,'2300309','Acopiara','CE','2023-08-17 20:05:22','2023-08-17 20:05:22'),(896,'2300408','Aiuaba','CE','2023-08-17 20:05:22','2023-08-17 20:05:22'),(897,'2300507','Alcântaras','CE','2023-08-17 20:05:22','2023-08-17 20:05:22'),(898,'2300606','Altaneira','CE','2023-08-17 20:05:22','2023-08-17 20:05:22'),(899,'2300705','Alto Santo','CE','2023-08-17 20:05:22','2023-08-17 20:05:22'),(900,'2300754','Amontada','CE','2023-08-17 20:05:22','2023-08-17 20:05:22'),(901,'2300804','Antonina do Norte','CE','2023-08-17 20:05:22','2023-08-17 20:05:22'),(902,'2300903','Apuiares','CE','2023-08-17 20:05:22','2023-08-17 20:05:22'),(903,'2301000','Aquiraz','CE','2023-08-17 20:05:22','2023-08-17 20:05:22'),(904,'2301109','Aracati','CE','2023-08-17 20:05:22','2023-08-17 20:05:22'),(905,'2301208','Aracoiaba','CE','2023-08-17 20:05:22','2023-08-17 20:05:22'),(906,'2301257','Ararenda','CE','2023-08-17 20:05:22','2023-08-17 20:05:22'),(907,'2301307','Araripe','CE','2023-08-17 20:05:22','2023-08-17 20:05:22'),(908,'2301406','Aratuba','CE','2023-08-17 20:05:22','2023-08-17 20:05:22'),(909,'2301505','Arneiroz','CE','2023-08-17 20:05:22','2023-08-17 20:05:22'),(910,'2301604','Assare','CE','2023-08-17 20:05:22','2023-08-17 20:05:22'),(911,'2301703','Aurora','CE','2023-08-17 20:05:22','2023-08-17 20:05:22'),(912,'2301802','Baixio','CE','2023-08-17 20:05:22','2023-08-17 20:05:22'),(913,'2301851','Banabuiu','CE','2023-08-17 20:05:22','2023-08-17 20:05:22'),(914,'2301901','Barbalha','CE','2023-08-17 20:05:22','2023-08-17 20:05:22'),(915,'2301950','Barreira','CE','2023-08-17 20:05:22','2023-08-17 20:05:22'),(916,'2302008','Barro','CE','2023-08-17 20:05:22','2023-08-17 20:05:22'),(917,'2302057','Barroquinha','CE','2023-08-17 20:05:22','2023-08-17 20:05:22'),(918,'2302107','Baturite','CE','2023-08-17 20:05:22','2023-08-17 20:05:22'),(919,'2302206','Beberibe','CE','2023-08-17 20:05:22','2023-08-17 20:05:22'),(920,'2302305','Bela Cruz','CE','2023-08-17 20:05:22','2023-08-17 20:05:22'),(921,'2302404','Boa Viagem','CE','2023-08-17 20:05:22','2023-08-17 20:05:22'),(922,'2302503','Brejo Santo','CE','2023-08-17 20:05:22','2023-08-17 20:05:22'),(923,'2302602','Camocim','CE','2023-08-17 20:05:22','2023-08-17 20:05:22'),(924,'2302701','Campos Sales','CE','2023-08-17 20:05:22','2023-08-17 20:05:22'),(925,'2302800','Caninde','CE','2023-08-17 20:05:22','2023-08-17 20:05:22'),(926,'2302909','Capistrano','CE','2023-08-17 20:05:22','2023-08-17 20:05:22'),(927,'2303006','Caridade','CE','2023-08-17 20:05:22','2023-08-17 20:05:22'),(928,'2303105','Carire','CE','2023-08-17 20:05:22','2023-08-17 20:05:22'),(929,'2303204','Caririaçu','CE','2023-08-17 20:05:22','2023-08-17 20:05:22'),(930,'2303303','Carius','CE','2023-08-17 20:05:22','2023-08-17 20:05:22'),(931,'2303402','Carnaubal','CE','2023-08-17 20:05:22','2023-08-17 20:05:22'),(932,'2303501','Cascavel','CE','2023-08-17 20:05:22','2023-08-17 20:05:22'),(933,'2303600','Catarina','CE','2023-08-17 20:05:22','2023-08-17 20:05:22'),(934,'2303659','Catunda','CE','2023-08-17 20:05:22','2023-08-17 20:05:22'),(935,'2303709','Caucaia','CE','2023-08-17 20:05:22','2023-08-17 20:05:22'),(936,'2303808','Cedro','CE','2023-08-17 20:05:22','2023-08-17 20:05:22'),(937,'2303907','Chaval','CE','2023-08-17 20:05:22','2023-08-17 20:05:22'),(938,'2303931','Choro','CE','2023-08-17 20:05:22','2023-08-17 20:05:22'),(939,'2303956','Chorozinho','CE','2023-08-17 20:05:22','2023-08-17 20:05:22'),(940,'2304004','Coreau','CE','2023-08-17 20:05:22','2023-08-17 20:05:22'),(941,'2304103','Crateus','CE','2023-08-17 20:05:22','2023-08-17 20:05:22'),(942,'2304202','Crato','CE','2023-08-17 20:05:22','2023-08-17 20:05:22'),(943,'2304236','Croata','CE','2023-08-17 20:05:22','2023-08-17 20:05:22'),(944,'2304251','Cruz','CE','2023-08-17 20:05:22','2023-08-17 20:05:22'),(945,'2304269','Deputado Irapuan Pinheiro','CE','2023-08-17 20:05:22','2023-08-17 20:05:22'),(946,'2304277','Ererê','CE','2023-08-17 20:05:22','2023-08-17 20:05:22'),(947,'2304285','Eusebio','CE','2023-08-17 20:05:22','2023-08-17 20:05:22'),(948,'2304301','Farias Brito','CE','2023-08-17 20:05:22','2023-08-17 20:05:22'),(949,'2304350','Forquilha','CE','2023-08-17 20:05:22','2023-08-17 20:05:22'),(950,'2304400','Fortaleza','CE','2023-08-17 20:05:22','2023-08-17 20:05:22'),(951,'2304459','Fortim','CE','2023-08-17 20:05:22','2023-08-17 20:05:22'),(952,'2304509','Frecheirinha','CE','2023-08-17 20:05:22','2023-08-17 20:05:22'),(953,'2304608','General Sampaio','CE','2023-08-17 20:05:22','2023-08-17 20:05:22'),(954,'2304657','Graça','CE','2023-08-17 20:05:22','2023-08-17 20:05:22'),(955,'2304707','Granja','CE','2023-08-17 20:05:22','2023-08-17 20:05:22'),(956,'2304806','Granjeiro','CE','2023-08-17 20:05:22','2023-08-17 20:05:22'),(957,'2304905','Groairas','CE','2023-08-17 20:05:22','2023-08-17 20:05:22'),(958,'2304954','Guaiuba','CE','2023-08-17 20:05:22','2023-08-17 20:05:22'),(959,'2305001','Guaraciaba do Norte','CE','2023-08-17 20:05:22','2023-08-17 20:05:22'),(960,'2305100','Guaramiranga','CE','2023-08-17 20:05:22','2023-08-17 20:05:22'),(961,'2305209','Hidrolândia','CE','2023-08-17 20:05:22','2023-08-17 20:05:22'),(962,'2305233','Horizonte','CE','2023-08-17 20:05:22','2023-08-17 20:05:22'),(963,'2305266','Ibaretama','CE','2023-08-17 20:05:22','2023-08-17 20:05:22'),(964,'2305308','Ibiapina','CE','2023-08-17 20:05:22','2023-08-17 20:05:22'),(965,'2305332','Ibicuitinga','CE','2023-08-17 20:05:22','2023-08-17 20:05:22'),(966,'2305357','Icapui','CE','2023-08-17 20:05:22','2023-08-17 20:05:22'),(967,'2305407','Ico','CE','2023-08-17 20:05:22','2023-08-17 20:05:22'),(968,'2305506','Iguatu','CE','2023-08-17 20:05:22','2023-08-17 20:05:22'),(969,'2305605','Independência','CE','2023-08-17 20:05:22','2023-08-17 20:05:22'),(970,'2305654','Ipaporanga','CE','2023-08-17 20:05:22','2023-08-17 20:05:22'),(971,'2305704','Ipaumirim','CE','2023-08-17 20:05:22','2023-08-17 20:05:22'),(972,'2305803','Ipu','CE','2023-08-17 20:05:22','2023-08-17 20:05:22'),(973,'2305902','Ipueiras','CE','2023-08-17 20:05:22','2023-08-17 20:05:22'),(974,'2306009','Iracema','CE','2023-08-17 20:05:22','2023-08-17 20:05:22'),(975,'2306108','Irauçuba','CE','2023-08-17 20:05:22','2023-08-17 20:05:22'),(976,'2306207','Itaiçaba','CE','2023-08-17 20:05:22','2023-08-17 20:05:22'),(977,'2306256','Itaitinga','CE','2023-08-17 20:05:22','2023-08-17 20:05:22'),(978,'2306306','Itapage','CE','2023-08-17 20:05:22','2023-08-17 20:05:22'),(979,'2306405','Itapipoca','CE','2023-08-17 20:05:22','2023-08-17 20:05:22'),(980,'2306504','Itapiuna','CE','2023-08-17 20:05:22','2023-08-17 20:05:22'),(981,'2306553','Itarema','CE','2023-08-17 20:05:22','2023-08-17 20:05:22'),(982,'2306603','Itatira','CE','2023-08-17 20:05:22','2023-08-17 20:05:22'),(983,'2306702','Jaguaretama','CE','2023-08-17 20:05:22','2023-08-17 20:05:22'),(984,'2306801','Jaguaribara','CE','2023-08-17 20:05:22','2023-08-17 20:05:22'),(985,'2306900','Jaguaribe','CE','2023-08-17 20:05:22','2023-08-17 20:05:22'),(986,'2307007','Jaguaruana','CE','2023-08-17 20:05:22','2023-08-17 20:05:22'),(987,'2307106','Jardim','CE','2023-08-17 20:05:22','2023-08-17 20:05:22'),(988,'2307205','Jati','CE','2023-08-17 20:05:22','2023-08-17 20:05:22'),(989,'2307254','Jijoca de Jericoacoara','CE','2023-08-17 20:05:22','2023-08-17 20:05:22'),(990,'2307304','Juazeiro do Norte','CE','2023-08-17 20:05:22','2023-08-17 20:05:22'),(991,'2307403','Jucas','CE','2023-08-17 20:05:22','2023-08-17 20:05:22'),(992,'2307502','Lavras da Mangabeira','CE','2023-08-17 20:05:22','2023-08-17 20:05:22'),(993,'2307601','Limoeiro do Norte','CE','2023-08-17 20:05:22','2023-08-17 20:05:22'),(994,'2307635','Madalena','CE','2023-08-17 20:05:22','2023-08-17 20:05:22'),(995,'2307650','Maracanau','CE','2023-08-17 20:05:22','2023-08-17 20:05:22'),(996,'2307700','Maranguape','CE','2023-08-17 20:05:22','2023-08-17 20:05:22'),(997,'2307809','Marco','CE','2023-08-17 20:05:22','2023-08-17 20:05:22'),(998,'2307908','Martinopole','CE','2023-08-17 20:05:22','2023-08-17 20:05:22'),(999,'2308005','Massapê','CE','2023-08-17 20:05:22','2023-08-17 20:05:22'),(1000,'2308104','Mauriti','CE','2023-08-17 20:05:22','2023-08-17 20:05:22'),(1001,'2308203','Meruoca','CE','2023-08-17 20:05:22','2023-08-17 20:05:22'),(1002,'2308302','Milagres','CE','2023-08-17 20:05:22','2023-08-17 20:05:22'),(1003,'2308351','Milha','CE','2023-08-17 20:05:22','2023-08-17 20:05:22'),(1004,'2308377','Miraima','CE','2023-08-17 20:05:22','2023-08-17 20:05:22'),(1005,'2308401','Missao Velha','CE','2023-08-17 20:05:22','2023-08-17 20:05:22'),(1006,'2308500','Mombaça','CE','2023-08-17 20:05:22','2023-08-17 20:05:22'),(1007,'2308609','Monsenhor Tabosa','CE','2023-08-17 20:05:22','2023-08-17 20:05:22'),(1008,'2308708','Morada Nova','CE','2023-08-17 20:05:22','2023-08-17 20:05:22'),(1009,'2308807','Moraujo','CE','2023-08-17 20:05:22','2023-08-17 20:05:22'),(1010,'2308906','Morrinhos','CE','2023-08-17 20:05:22','2023-08-17 20:05:22'),(1011,'2309003','Mucambo','CE','2023-08-17 20:05:22','2023-08-17 20:05:22'),(1012,'2309102','Mulungu','CE','2023-08-17 20:05:22','2023-08-17 20:05:22'),(1013,'2309201','Nova Olinda','CE','2023-08-17 20:05:22','2023-08-17 20:05:22'),(1014,'2309300','Nova Russas','CE','2023-08-17 20:05:22','2023-08-17 20:05:22'),(1015,'2309409','Novo Oriente','CE','2023-08-17 20:05:22','2023-08-17 20:05:22'),(1016,'2309458','Ocara','CE','2023-08-17 20:05:22','2023-08-17 20:05:22'),(1017,'2309508','Oros','CE','2023-08-17 20:05:22','2023-08-17 20:05:22'),(1018,'2309607','Pacajus','CE','2023-08-17 20:05:22','2023-08-17 20:05:22'),(1019,'2309706','Pacatuba','CE','2023-08-17 20:05:22','2023-08-17 20:05:22'),(1020,'2309805','Pacoti','CE','2023-08-17 20:05:22','2023-08-17 20:05:22'),(1021,'2309904','Pacuja','CE','2023-08-17 20:05:22','2023-08-17 20:05:22'),(1022,'2310001','Palhano','CE','2023-08-17 20:05:22','2023-08-17 20:05:22'),(1023,'2310100','Palmacia','CE','2023-08-17 20:05:22','2023-08-17 20:05:22'),(1024,'2310209','Paracuru','CE','2023-08-17 20:05:22','2023-08-17 20:05:22'),(1025,'2310258','Paraipaba','CE','2023-08-17 20:05:22','2023-08-17 20:05:22'),(1026,'2310308','Parambu','CE','2023-08-17 20:05:22','2023-08-17 20:05:22'),(1027,'2310407','Paramoti','CE','2023-08-17 20:05:22','2023-08-17 20:05:22'),(1028,'2310506','Pedra Branca','CE','2023-08-17 20:05:22','2023-08-17 20:05:22'),(1029,'2310605','Penaforte','CE','2023-08-17 20:05:22','2023-08-17 20:05:22'),(1030,'2310704','Pentecoste','CE','2023-08-17 20:05:22','2023-08-17 20:05:22'),(1031,'2310803','Pereiro','CE','2023-08-17 20:05:22','2023-08-17 20:05:22'),(1032,'2310852','Pindoretama','CE','2023-08-17 20:05:22','2023-08-17 20:05:22'),(1033,'2310902','Piquet Carneiro','CE','2023-08-17 20:05:22','2023-08-17 20:05:22'),(1034,'2310951','Pires Ferreira','CE','2023-08-17 20:05:22','2023-08-17 20:05:22'),(1035,'2311009','Poranga','CE','2023-08-17 20:05:22','2023-08-17 20:05:22'),(1036,'2311108','Porteiras','CE','2023-08-17 20:05:22','2023-08-17 20:05:22'),(1037,'2311207','Potengi','CE','2023-08-17 20:05:22','2023-08-17 20:05:22'),(1038,'2311231','Potiretama','CE','2023-08-17 20:05:22','2023-08-17 20:05:22'),(1039,'2311264','Quiterianopolis','CE','2023-08-17 20:05:22','2023-08-17 20:05:22'),(1040,'2311306','Quixada','CE','2023-08-17 20:05:22','2023-08-17 20:05:22'),(1041,'2311355','Quixelô','CE','2023-08-17 20:05:22','2023-08-17 20:05:22'),(1042,'2311405','Quixeramobim','CE','2023-08-17 20:05:22','2023-08-17 20:05:22'),(1043,'2311504','Quixere','CE','2023-08-17 20:05:22','2023-08-17 20:05:22'),(1044,'2311603','Redençao','CE','2023-08-17 20:05:22','2023-08-17 20:05:22'),(1045,'2311702','Reriutaba','CE','2023-08-17 20:05:22','2023-08-17 20:05:22'),(1046,'2311801','Russas','CE','2023-08-17 20:05:22','2023-08-17 20:05:22'),(1047,'2311900','Saboeiro','CE','2023-08-17 20:05:22','2023-08-17 20:05:22'),(1048,'2311959','Salitre','CE','2023-08-17 20:05:22','2023-08-17 20:05:22'),(1049,'2312007','Santana do Acarau','CE','2023-08-17 20:05:22','2023-08-17 20:05:22'),(1050,'2312106','Santana do Cariri','CE','2023-08-17 20:05:22','2023-08-17 20:05:22'),(1051,'2312205','Santa Quiteria','CE','2023-08-17 20:05:22','2023-08-17 20:05:22'),(1052,'2312304','Sao Benedito','CE','2023-08-17 20:05:22','2023-08-17 20:05:22'),(1053,'2312403','Sao Gonçalo do Amarante','CE','2023-08-17 20:05:22','2023-08-17 20:05:22'),(1054,'2312502','Sao Joao do Jaguaribe','CE','2023-08-17 20:05:22','2023-08-17 20:05:22'),(1055,'2312601','Sao Luis do Curu','CE','2023-08-17 20:05:22','2023-08-17 20:05:22'),(1056,'2312700','Senador Pompeu','CE','2023-08-17 20:05:22','2023-08-17 20:05:22'),(1057,'2312809','Senador Sa','CE','2023-08-17 20:05:22','2023-08-17 20:05:22'),(1058,'2312908','Sobral','CE','2023-08-17 20:05:22','2023-08-17 20:05:22'),(1059,'2313005','Solonopole','CE','2023-08-17 20:05:22','2023-08-17 20:05:22'),(1060,'2313104','Tabuleiro do Norte','CE','2023-08-17 20:05:22','2023-08-17 20:05:22'),(1061,'2313203','Tamboril','CE','2023-08-17 20:05:22','2023-08-17 20:05:22'),(1062,'2313252','Tarrafas','CE','2023-08-17 20:05:22','2023-08-17 20:05:22'),(1063,'2313302','Taua','CE','2023-08-17 20:05:22','2023-08-17 20:05:22'),(1064,'2313351','Tejuçuoca','CE','2023-08-17 20:05:22','2023-08-17 20:05:22'),(1065,'2313401','Tiangua','CE','2023-08-17 20:05:22','2023-08-17 20:05:22'),(1066,'2313500','Trairi','CE','2023-08-17 20:05:22','2023-08-17 20:05:22'),(1067,'2313559','Tururu','CE','2023-08-17 20:05:22','2023-08-17 20:05:22'),(1068,'2313609','Ubajara','CE','2023-08-17 20:05:22','2023-08-17 20:05:22'),(1069,'2313708','Umari','CE','2023-08-17 20:05:22','2023-08-17 20:05:22'),(1070,'2313757','Umirim','CE','2023-08-17 20:05:22','2023-08-17 20:05:22'),(1071,'2313807','Uruburetama','CE','2023-08-17 20:05:22','2023-08-17 20:05:22'),(1072,'2313906','Uruoca','CE','2023-08-17 20:05:22','2023-08-17 20:05:22'),(1073,'2313955','Varjota','CE','2023-08-17 20:05:22','2023-08-17 20:05:22'),(1074,'2314003','Varzea Alegre','CE','2023-08-17 20:05:22','2023-08-17 20:05:22'),(1075,'2314102','Viçosa do Ceara','CE','2023-08-17 20:05:22','2023-08-17 20:05:22'),(1076,'2400109','Acari','RN','2023-08-17 20:05:22','2023-08-17 20:05:22'),(1077,'2400208','Açu','RN','2023-08-17 20:05:22','2023-08-17 20:05:22'),(1078,'2400307','Afonso Bezerra','RN','2023-08-17 20:05:22','2023-08-17 20:05:22'),(1079,'2400406','agua Nova','RN','2023-08-17 20:05:22','2023-08-17 20:05:22'),(1080,'2400505','Alexandria','RN','2023-08-17 20:05:22','2023-08-17 20:05:22'),(1081,'2400604','Almino Afonso','RN','2023-08-17 20:05:22','2023-08-17 20:05:22'),(1082,'2400703','Alto do Rodrigues','RN','2023-08-17 20:05:22','2023-08-17 20:05:22'),(1083,'2400802','Angicos','RN','2023-08-17 20:05:23','2023-08-17 20:05:23'),(1084,'2400901','Antônio Martins','RN','2023-08-17 20:05:23','2023-08-17 20:05:23'),(1085,'2401008','Apodi','RN','2023-08-17 20:05:23','2023-08-17 20:05:23'),(1086,'2401107','Areia Branca','RN','2023-08-17 20:05:23','2023-08-17 20:05:23'),(1087,'2401206','Arês','RN','2023-08-17 20:05:23','2023-08-17 20:05:23'),(1088,'2401305','Augusto Severo','RN','2023-08-17 20:05:23','2023-08-17 20:05:23'),(1089,'2401404','Baia Formosa','RN','2023-08-17 20:05:23','2023-08-17 20:05:23'),(1090,'2401453','Barauna','RN','2023-08-17 20:05:23','2023-08-17 20:05:23'),(1091,'2401503','Barcelona','RN','2023-08-17 20:05:23','2023-08-17 20:05:23'),(1092,'2401602','Bento Fernandes','RN','2023-08-17 20:05:23','2023-08-17 20:05:23'),(1093,'2401651','Bodo','RN','2023-08-17 20:05:23','2023-08-17 20:05:23'),(1094,'2401701','Bom Jesus','RN','2023-08-17 20:05:23','2023-08-17 20:05:23'),(1095,'2401800','Brejinho','RN','2023-08-17 20:05:23','2023-08-17 20:05:23'),(1096,'2401859','Caiçara do Norte','RN','2023-08-17 20:05:23','2023-08-17 20:05:23'),(1097,'2401909','Caiçara do Rio do Vento','RN','2023-08-17 20:05:23','2023-08-17 20:05:23'),(1098,'2402006','Caico','RN','2023-08-17 20:05:23','2023-08-17 20:05:23'),(1099,'2402105','Campo Redondo','RN','2023-08-17 20:05:23','2023-08-17 20:05:23'),(1100,'2402204','Canguaretama','RN','2023-08-17 20:05:23','2023-08-17 20:05:23'),(1101,'2402303','Caraubas','RN','2023-08-17 20:05:23','2023-08-17 20:05:23'),(1102,'2402402','Carnauba dos Dantas','RN','2023-08-17 20:05:23','2023-08-17 20:05:23'),(1103,'2402501','Carnaubais','RN','2023-08-17 20:05:23','2023-08-17 20:05:23'),(1104,'2402600','Ceara-Mirim','RN','2023-08-17 20:05:23','2023-08-17 20:05:23'),(1105,'2402709','Cerro Cora','RN','2023-08-17 20:05:23','2023-08-17 20:05:23'),(1106,'2402808','Coronel Ezequiel','RN','2023-08-17 20:05:23','2023-08-17 20:05:23'),(1107,'2402907','Coronel Joao Pessoa','RN','2023-08-17 20:05:23','2023-08-17 20:05:23'),(1108,'2403004','Cruzeta','RN','2023-08-17 20:05:23','2023-08-17 20:05:23'),(1109,'2403103','Currais Novos','RN','2023-08-17 20:05:23','2023-08-17 20:05:23'),(1110,'2403202','Doutor Severiano','RN','2023-08-17 20:05:23','2023-08-17 20:05:23'),(1111,'2403251','Parnamirim','RN','2023-08-17 20:05:23','2023-08-17 20:05:23'),(1112,'2403301','Encanto','RN','2023-08-17 20:05:23','2023-08-17 20:05:23'),(1113,'2403400','Equador','RN','2023-08-17 20:05:23','2023-08-17 20:05:23'),(1114,'2403509','Espirito Santo','RN','2023-08-17 20:05:23','2023-08-17 20:05:23'),(1115,'2403608','Extremoz','RN','2023-08-17 20:05:23','2023-08-17 20:05:23'),(1116,'2403707','Felipe Guerra','RN','2023-08-17 20:05:23','2023-08-17 20:05:23'),(1117,'2403756','Fernando Pedroza','RN','2023-08-17 20:05:23','2023-08-17 20:05:23'),(1118,'2403806','Florânia','RN','2023-08-17 20:05:23','2023-08-17 20:05:23'),(1119,'2403905','Francisco Dantas','RN','2023-08-17 20:05:23','2023-08-17 20:05:23'),(1120,'2404002','Frutuoso Gomes','RN','2023-08-17 20:05:23','2023-08-17 20:05:23'),(1121,'2404101','Galinhos','RN','2023-08-17 20:05:23','2023-08-17 20:05:23'),(1122,'2404200','Goianinha','RN','2023-08-17 20:05:23','2023-08-17 20:05:23'),(1123,'2404309','Governador Dix-Sept Rosado','RN','2023-08-17 20:05:23','2023-08-17 20:05:23'),(1124,'2404408','Grossos','RN','2023-08-17 20:05:23','2023-08-17 20:05:23'),(1125,'2404507','Guamare','RN','2023-08-17 20:05:23','2023-08-17 20:05:23'),(1126,'2404606','Ielmo Marinho','RN','2023-08-17 20:05:23','2023-08-17 20:05:23'),(1127,'2404705','Ipanguaçu','RN','2023-08-17 20:05:23','2023-08-17 20:05:23'),(1128,'2404804','Ipueira','RN','2023-08-17 20:05:23','2023-08-17 20:05:23'),(1129,'2404853','Itaja','RN','2023-08-17 20:05:23','2023-08-17 20:05:23'),(1130,'2404903','Itau','RN','2023-08-17 20:05:23','2023-08-17 20:05:23'),(1131,'2405009','Jaçana','RN','2023-08-17 20:05:23','2023-08-17 20:05:23'),(1132,'2405108','Jandaira','RN','2023-08-17 20:05:23','2023-08-17 20:05:23'),(1133,'2405207','Janduis','RN','2023-08-17 20:05:23','2023-08-17 20:05:23'),(1134,'2405306','Januario Cicco','RN','2023-08-17 20:05:23','2023-08-17 20:05:23'),(1135,'2405405','Japi','RN','2023-08-17 20:05:23','2023-08-17 20:05:23'),(1136,'2405504','Jardim de Angicos','RN','2023-08-17 20:05:23','2023-08-17 20:05:23'),(1137,'2405603','Jardim de Piranhas','RN','2023-08-17 20:05:23','2023-08-17 20:05:23'),(1138,'2405702','Jardim do Serido','RN','2023-08-17 20:05:23','2023-08-17 20:05:23'),(1139,'2405801','Joao Câmara','RN','2023-08-17 20:05:23','2023-08-17 20:05:23'),(1140,'2405900','Joao Dias','RN','2023-08-17 20:05:23','2023-08-17 20:05:23'),(1141,'2406007','Jose da Penha','RN','2023-08-17 20:05:23','2023-08-17 20:05:23'),(1142,'2406106','Jucurutu','RN','2023-08-17 20:05:23','2023-08-17 20:05:23'),(1143,'2406155','Jundia','RN','2023-08-17 20:05:23','2023-08-17 20:05:23'),(1144,'2406205','Lagoa D\'Anta','RN','2023-08-17 20:05:23','2023-08-17 20:05:23'),(1145,'2406304','Lagoa de Pedras','RN','2023-08-17 20:05:23','2023-08-17 20:05:23'),(1146,'2406403','Lagoa de Velhos','RN','2023-08-17 20:05:23','2023-08-17 20:05:23'),(1147,'2406502','Lagoa Nova','RN','2023-08-17 20:05:23','2023-08-17 20:05:23'),(1148,'2406601','Lagoa Salgada','RN','2023-08-17 20:05:23','2023-08-17 20:05:23'),(1149,'2406700','Lajes','RN','2023-08-17 20:05:23','2023-08-17 20:05:23'),(1150,'2406809','Lajes Pintadas','RN','2023-08-17 20:05:23','2023-08-17 20:05:23'),(1151,'2406908','Lucrecia','RN','2023-08-17 20:05:23','2023-08-17 20:05:23'),(1152,'2407005','Luis Gomes','RN','2023-08-17 20:05:23','2023-08-17 20:05:23'),(1153,'2407104','Macaiba','RN','2023-08-17 20:05:23','2023-08-17 20:05:23'),(1154,'2407203','Macau','RN','2023-08-17 20:05:23','2023-08-17 20:05:23'),(1155,'2407252','Major Sales','RN','2023-08-17 20:05:23','2023-08-17 20:05:23'),(1156,'2407302','Marcelino Vieira','RN','2023-08-17 20:05:23','2023-08-17 20:05:23'),(1157,'2407401','Martins','RN','2023-08-17 20:05:23','2023-08-17 20:05:23'),(1158,'2407500','Maxaranguape','RN','2023-08-17 20:05:23','2023-08-17 20:05:23'),(1159,'2407609','Messias Targino','RN','2023-08-17 20:05:23','2023-08-17 20:05:23'),(1160,'2407708','Montanhas','RN','2023-08-17 20:05:23','2023-08-17 20:05:23'),(1161,'2407807','Monte Alegre','RN','2023-08-17 20:05:23','2023-08-17 20:05:23'),(1162,'2407906','Monte das Gameleiras','RN','2023-08-17 20:05:23','2023-08-17 20:05:23'),(1163,'2408003','Mossoro','RN','2023-08-17 20:05:23','2023-08-17 20:05:23'),(1164,'2408102','Natal','RN','2023-08-17 20:05:23','2023-08-17 20:05:23'),(1165,'2408201','Nisia Floresta','RN','2023-08-17 20:05:23','2023-08-17 20:05:23'),(1166,'2408300','Nova Cruz','RN','2023-08-17 20:05:23','2023-08-17 20:05:23'),(1167,'2408409','Olho-D\'agua do Borges','RN','2023-08-17 20:05:23','2023-08-17 20:05:23'),(1168,'2408508','Ouro Branco','RN','2023-08-17 20:05:23','2023-08-17 20:05:23'),(1169,'2408607','Parana','RN','2023-08-17 20:05:23','2023-08-17 20:05:23'),(1170,'2408706','Parau','RN','2023-08-17 20:05:23','2023-08-17 20:05:23'),(1171,'2408805','Parazinho','RN','2023-08-17 20:05:23','2023-08-17 20:05:23'),(1172,'2408904','Parelhas','RN','2023-08-17 20:05:23','2023-08-17 20:05:23'),(1173,'2408953','Rio do Fogo','RN','2023-08-17 20:05:23','2023-08-17 20:05:23'),(1174,'2409100','Passa e Fica','RN','2023-08-17 20:05:23','2023-08-17 20:05:23'),(1175,'2409209','Passagem','RN','2023-08-17 20:05:23','2023-08-17 20:05:23'),(1176,'2409308','Patu','RN','2023-08-17 20:05:23','2023-08-17 20:05:23'),(1177,'2409332','Santa Maria','RN','2023-08-17 20:05:23','2023-08-17 20:05:23'),(1178,'2409407','Pau dos Ferros','RN','2023-08-17 20:05:23','2023-08-17 20:05:23'),(1179,'2409506','Pedra Grande','RN','2023-08-17 20:05:23','2023-08-17 20:05:23'),(1180,'2409605','Pedra Preta','RN','2023-08-17 20:05:23','2023-08-17 20:05:23'),(1181,'2409704','Pedro Avelino','RN','2023-08-17 20:05:23','2023-08-17 20:05:23'),(1182,'2409803','Pedro Velho','RN','2023-08-17 20:05:23','2023-08-17 20:05:23'),(1183,'2409902','Pendências','RN','2023-08-17 20:05:23','2023-08-17 20:05:23'),(1184,'2410009','Piloes','RN','2023-08-17 20:05:23','2023-08-17 20:05:23'),(1185,'2410108','Poço Branco','RN','2023-08-17 20:05:23','2023-08-17 20:05:23'),(1186,'2410207','Portalegre','RN','2023-08-17 20:05:23','2023-08-17 20:05:23'),(1187,'2410256','Porto do Mangue','RN','2023-08-17 20:05:23','2023-08-17 20:05:23'),(1188,'2410306','Presidente Juscelino','RN','2023-08-17 20:05:23','2023-08-17 20:05:23'),(1189,'2410405','Pureza','RN','2023-08-17 20:05:23','2023-08-17 20:05:23'),(1190,'2410504','Rafael Fernandes','RN','2023-08-17 20:05:23','2023-08-17 20:05:23'),(1191,'2410603','Rafael Godeiro','RN','2023-08-17 20:05:23','2023-08-17 20:05:23'),(1192,'2410702','Riacho da Cruz','RN','2023-08-17 20:05:23','2023-08-17 20:05:23'),(1193,'2410801','Riacho de Santana','RN','2023-08-17 20:05:23','2023-08-17 20:05:23'),(1194,'2410900','Riachuelo','RN','2023-08-17 20:05:23','2023-08-17 20:05:23'),(1195,'2411007','Rodolfo Fernandes','RN','2023-08-17 20:05:23','2023-08-17 20:05:23'),(1196,'2411056','Tibau','RN','2023-08-17 20:05:23','2023-08-17 20:05:23'),(1197,'2411106','Ruy Barbosa','RN','2023-08-17 20:05:23','2023-08-17 20:05:23'),(1198,'2411205','Santa Cruz','RN','2023-08-17 20:05:23','2023-08-17 20:05:23'),(1199,'2411403','Santana do Matos','RN','2023-08-17 20:05:23','2023-08-17 20:05:23'),(1200,'2411429','Santana do Serido','RN','2023-08-17 20:05:23','2023-08-17 20:05:23'),(1201,'2411502','Santo Antônio','RN','2023-08-17 20:05:23','2023-08-17 20:05:23'),(1202,'2411601','Sao Bento do Norte','RN','2023-08-17 20:05:23','2023-08-17 20:05:23'),(1203,'2411700','Sao Bento do Trairi','RN','2023-08-17 20:05:23','2023-08-17 20:05:23'),(1204,'2411809','Sao Fernando','RN','2023-08-17 20:05:23','2023-08-17 20:05:23'),(1205,'2411908','Sao Francisco do Oeste','RN','2023-08-17 20:05:23','2023-08-17 20:05:23'),(1206,'2412005','Sao Gonçalo do Amarante','RN','2023-08-17 20:05:23','2023-08-17 20:05:23'),(1207,'2412104','Sao Joao do Sabugi','RN','2023-08-17 20:05:23','2023-08-17 20:05:23'),(1208,'2412203','Sao Jose de Mipibu','RN','2023-08-17 20:05:23','2023-08-17 20:05:23'),(1209,'2412302','Sao Jose do Campestre','RN','2023-08-17 20:05:23','2023-08-17 20:05:23'),(1210,'2412401','Sao Jose do Serido','RN','2023-08-17 20:05:23','2023-08-17 20:05:23'),(1211,'2412500','Sao Miguel','RN','2023-08-17 20:05:23','2023-08-17 20:05:23'),(1212,'2412559','Sao Miguel do Gostoso','RN','2023-08-17 20:05:23','2023-08-17 20:05:23'),(1213,'2412609','Sao Paulo do Potengi','RN','2023-08-17 20:05:23','2023-08-17 20:05:23'),(1214,'2412708','Sao Pedro','RN','2023-08-17 20:05:23','2023-08-17 20:05:23'),(1215,'2412807','Sao Rafael','RN','2023-08-17 20:05:23','2023-08-17 20:05:23'),(1216,'2412906','Sao Tome','RN','2023-08-17 20:05:23','2023-08-17 20:05:23'),(1217,'2413003','Sao Vicente','RN','2023-08-17 20:05:23','2023-08-17 20:05:23'),(1218,'2413102','Senador Eloi de Souza','RN','2023-08-17 20:05:23','2023-08-17 20:05:23'),(1219,'2413201','Senador Georgino Avelino','RN','2023-08-17 20:05:23','2023-08-17 20:05:23'),(1220,'2413300','Serra de Sao Bento','RN','2023-08-17 20:05:23','2023-08-17 20:05:23'),(1221,'2413359','Serra do Mel','RN','2023-08-17 20:05:23','2023-08-17 20:05:23'),(1222,'2413409','Serra Negra do Norte','RN','2023-08-17 20:05:23','2023-08-17 20:05:23'),(1223,'2413508','Serrinha','RN','2023-08-17 20:05:23','2023-08-17 20:05:23'),(1224,'2413557','Serrinha dos Pintos','RN','2023-08-17 20:05:23','2023-08-17 20:05:23'),(1225,'2413607','Severiano Melo','RN','2023-08-17 20:05:23','2023-08-17 20:05:23'),(1226,'2413706','Sitio Novo','RN','2023-08-17 20:05:23','2023-08-17 20:05:23'),(1227,'2413805','Taboleiro Grande','RN','2023-08-17 20:05:23','2023-08-17 20:05:23'),(1228,'2413904','Taipu','RN','2023-08-17 20:05:23','2023-08-17 20:05:23'),(1229,'2414001','Tangara','RN','2023-08-17 20:05:23','2023-08-17 20:05:23'),(1230,'2414100','Tenente Ananias','RN','2023-08-17 20:05:23','2023-08-17 20:05:23'),(1231,'2414159','Tenente Laurentino Cruz','RN','2023-08-17 20:05:23','2023-08-17 20:05:23'),(1232,'2414209','Tibau do Sul','RN','2023-08-17 20:05:23','2023-08-17 20:05:23'),(1233,'2414308','Timbauba dos Batistas','RN','2023-08-17 20:05:23','2023-08-17 20:05:23'),(1234,'2414407','Touros','RN','2023-08-17 20:05:23','2023-08-17 20:05:23'),(1235,'2414456','Triunfo Potiguar','RN','2023-08-17 20:05:23','2023-08-17 20:05:23'),(1236,'2414506','Umarizal','RN','2023-08-17 20:05:23','2023-08-17 20:05:23'),(1237,'2414605','Upanema','RN','2023-08-17 20:05:23','2023-08-17 20:05:23'),(1238,'2414704','Varzea','RN','2023-08-17 20:05:23','2023-08-17 20:05:23'),(1239,'2414753','Venha-Ver','RN','2023-08-17 20:05:23','2023-08-17 20:05:23'),(1240,'2414803','Vera Cruz','RN','2023-08-17 20:05:23','2023-08-17 20:05:23'),(1241,'2414902','Viçosa','RN','2023-08-17 20:05:23','2023-08-17 20:05:23'),(1242,'2415008','Vila Flor','RN','2023-08-17 20:05:23','2023-08-17 20:05:23'),(1243,'2500106','agua Branca','PB','2023-08-17 20:05:23','2023-08-17 20:05:23'),(1244,'2500205','Aguiar','PB','2023-08-17 20:05:23','2023-08-17 20:05:23'),(1245,'2500304','Alagoa Grande','PB','2023-08-17 20:05:23','2023-08-17 20:05:23'),(1246,'2500403','Alagoa Nova','PB','2023-08-17 20:05:23','2023-08-17 20:05:23'),(1247,'2500502','Alagoinha','PB','2023-08-17 20:05:23','2023-08-17 20:05:23'),(1248,'2500536','Alcantil','PB','2023-08-17 20:05:23','2023-08-17 20:05:23'),(1249,'2500577','Algodao de Jandaira','PB','2023-08-17 20:05:23','2023-08-17 20:05:23'),(1250,'2500601','Alhandra','PB','2023-08-17 20:05:23','2023-08-17 20:05:23'),(1251,'2500700','Sao Joao do Rio do Peixe','PB','2023-08-17 20:05:23','2023-08-17 20:05:23'),(1252,'2500734','Amparo','PB','2023-08-17 20:05:23','2023-08-17 20:05:23'),(1253,'2500775','Aparecida','PB','2023-08-17 20:05:23','2023-08-17 20:05:23'),(1254,'2500809','Araçagi','PB','2023-08-17 20:05:23','2023-08-17 20:05:23'),(1255,'2500908','Arara','PB','2023-08-17 20:05:23','2023-08-17 20:05:23'),(1256,'2501005','Araruna','PB','2023-08-17 20:05:23','2023-08-17 20:05:23'),(1257,'2501104','Areia','PB','2023-08-17 20:05:23','2023-08-17 20:05:23'),(1258,'2501153','Areia de Baraunas','PB','2023-08-17 20:05:23','2023-08-17 20:05:23'),(1259,'2501203','Areial','PB','2023-08-17 20:05:23','2023-08-17 20:05:23'),(1260,'2501302','Aroeiras','PB','2023-08-17 20:05:23','2023-08-17 20:05:23'),(1261,'2501351','Assunçao','PB','2023-08-17 20:05:23','2023-08-17 20:05:23'),(1262,'2501401','Baia da Traiçao','PB','2023-08-17 20:05:23','2023-08-17 20:05:23'),(1263,'2501500','Bananeiras','PB','2023-08-17 20:05:23','2023-08-17 20:05:23'),(1264,'2501534','Barauna','PB','2023-08-17 20:05:23','2023-08-17 20:05:23'),(1265,'2501575','Barra de Santana','PB','2023-08-17 20:05:23','2023-08-17 20:05:23'),(1266,'2501609','Barra de Santa Rosa','PB','2023-08-17 20:05:23','2023-08-17 20:05:23'),(1267,'2501708','Barra de Sao Miguel','PB','2023-08-17 20:05:23','2023-08-17 20:05:23'),(1268,'2501807','Bayeux','PB','2023-08-17 20:05:23','2023-08-17 20:05:23'),(1269,'2501906','Belem','PB','2023-08-17 20:05:23','2023-08-17 20:05:23'),(1270,'2502003','Belem do Brejo do Cruz','PB','2023-08-17 20:05:23','2023-08-17 20:05:23'),(1271,'2502052','Bernardino Batista','PB','2023-08-17 20:05:23','2023-08-17 20:05:23'),(1272,'2502102','Boa Ventura','PB','2023-08-17 20:05:23','2023-08-17 20:05:23'),(1273,'2502151','Boa Vista','PB','2023-08-17 20:05:23','2023-08-17 20:05:23'),(1274,'2502201','Bom Jesus','PB','2023-08-17 20:05:23','2023-08-17 20:05:23'),(1275,'2502300','Bom Sucesso','PB','2023-08-17 20:05:23','2023-08-17 20:05:23'),(1276,'2502409','Bonito de Santa Fe','PB','2023-08-17 20:05:23','2023-08-17 20:05:23'),(1277,'2502508','Boqueirao','PB','2023-08-17 20:05:23','2023-08-17 20:05:23'),(1278,'2502607','Igaracy','PB','2023-08-17 20:05:23','2023-08-17 20:05:23'),(1279,'2502706','Borborema','PB','2023-08-17 20:05:23','2023-08-17 20:05:23'),(1280,'2502805','Brejo do Cruz','PB','2023-08-17 20:05:23','2023-08-17 20:05:23'),(1281,'2502904','Brejo dos Santos','PB','2023-08-17 20:05:23','2023-08-17 20:05:23'),(1282,'2503001','Caapora','PB','2023-08-17 20:05:23','2023-08-17 20:05:23'),(1283,'2503100','Cabaceiras','PB','2023-08-17 20:05:23','2023-08-17 20:05:23'),(1284,'2503209','Cabedelo','PB','2023-08-17 20:05:23','2023-08-17 20:05:23'),(1285,'2503308','Cachoeira dos indios','PB','2023-08-17 20:05:23','2023-08-17 20:05:23'),(1286,'2503407','Cacimba de Areia','PB','2023-08-17 20:05:23','2023-08-17 20:05:23'),(1287,'2503506','Cacimba de Dentro','PB','2023-08-17 20:05:23','2023-08-17 20:05:23'),(1288,'2503555','Cacimbas','PB','2023-08-17 20:05:23','2023-08-17 20:05:23'),(1289,'2503605','Caiçara','PB','2023-08-17 20:05:23','2023-08-17 20:05:23'),(1290,'2503704','Cajazeiras','PB','2023-08-17 20:05:23','2023-08-17 20:05:23'),(1291,'2503753','Cajazeirinhas','PB','2023-08-17 20:05:23','2023-08-17 20:05:23'),(1292,'2503803','Caldas Brandao','PB','2023-08-17 20:05:23','2023-08-17 20:05:23'),(1293,'2503902','Camalau','PB','2023-08-17 20:05:23','2023-08-17 20:05:23'),(1294,'2504009','Campina Grande','PB','2023-08-17 20:05:23','2023-08-17 20:05:23'),(1295,'2504033','Capim','PB','2023-08-17 20:05:23','2023-08-17 20:05:23'),(1296,'2504074','Caraubas','PB','2023-08-17 20:05:23','2023-08-17 20:05:23'),(1297,'2504108','Carrapateira','PB','2023-08-17 20:05:23','2023-08-17 20:05:23'),(1298,'2504157','Casserengue','PB','2023-08-17 20:05:23','2023-08-17 20:05:23'),(1299,'2504207','Catingueira','PB','2023-08-17 20:05:23','2023-08-17 20:05:23'),(1300,'2504306','Catole do Rocha','PB','2023-08-17 20:05:23','2023-08-17 20:05:23'),(1301,'2504355','Caturite','PB','2023-08-17 20:05:23','2023-08-17 20:05:23'),(1302,'2504405','Conceiçao','PB','2023-08-17 20:05:23','2023-08-17 20:05:23'),(1303,'2504504','Condado','PB','2023-08-17 20:05:23','2023-08-17 20:05:23'),(1304,'2504603','Conde','PB','2023-08-17 20:05:23','2023-08-17 20:05:23'),(1305,'2504702','Congo','PB','2023-08-17 20:05:23','2023-08-17 20:05:23'),(1306,'2504801','Coremas','PB','2023-08-17 20:05:23','2023-08-17 20:05:23'),(1307,'2504850','Coxixola','PB','2023-08-17 20:05:23','2023-08-17 20:05:23'),(1308,'2504900','Cruz do Espirito Santo','PB','2023-08-17 20:05:23','2023-08-17 20:05:23'),(1309,'2505006','Cubati','PB','2023-08-17 20:05:23','2023-08-17 20:05:23'),(1310,'2505105','Cuite','PB','2023-08-17 20:05:23','2023-08-17 20:05:23'),(1311,'2505204','Cuitegi','PB','2023-08-17 20:05:23','2023-08-17 20:05:23'),(1312,'2505238','Cuite de Mamanguape','PB','2023-08-17 20:05:23','2023-08-17 20:05:23'),(1313,'2505279','Curral de Cima','PB','2023-08-17 20:05:23','2023-08-17 20:05:23'),(1314,'2505303','Curral Velho','PB','2023-08-17 20:05:23','2023-08-17 20:05:23'),(1315,'2505352','Damiao','PB','2023-08-17 20:05:23','2023-08-17 20:05:23'),(1316,'2505402','Desterro','PB','2023-08-17 20:05:23','2023-08-17 20:05:23'),(1317,'2505501','Vista Serrana','PB','2023-08-17 20:05:23','2023-08-17 20:05:23'),(1318,'2505600','Diamante','PB','2023-08-17 20:05:23','2023-08-17 20:05:23'),(1319,'2505709','Dona Inês','PB','2023-08-17 20:05:23','2023-08-17 20:05:23'),(1320,'2505808','Duas Estradas','PB','2023-08-17 20:05:23','2023-08-17 20:05:23'),(1321,'2505907','Emas','PB','2023-08-17 20:05:23','2023-08-17 20:05:23'),(1322,'2506004','Esperança','PB','2023-08-17 20:05:23','2023-08-17 20:05:23'),(1323,'2506103','Fagundes','PB','2023-08-17 20:05:23','2023-08-17 20:05:23'),(1324,'2506202','Frei Martinho','PB','2023-08-17 20:05:23','2023-08-17 20:05:23'),(1325,'2506251','Gado Bravo','PB','2023-08-17 20:05:23','2023-08-17 20:05:23'),(1326,'2506301','Guarabira','PB','2023-08-17 20:05:23','2023-08-17 20:05:23'),(1327,'2506400','Gurinhem','PB','2023-08-17 20:05:23','2023-08-17 20:05:23'),(1328,'2506509','Gurjao','PB','2023-08-17 20:05:23','2023-08-17 20:05:23'),(1329,'2506608','Ibiara','PB','2023-08-17 20:05:23','2023-08-17 20:05:23'),(1330,'2506707','Imaculada','PB','2023-08-17 20:05:23','2023-08-17 20:05:23'),(1331,'2506806','Inga','PB','2023-08-17 20:05:23','2023-08-17 20:05:23'),(1332,'2506905','Itabaiana','PB','2023-08-17 20:05:23','2023-08-17 20:05:23'),(1333,'2507002','Itaporanga','PB','2023-08-17 20:05:23','2023-08-17 20:05:23'),(1334,'2507101','Itapororoca','PB','2023-08-17 20:05:23','2023-08-17 20:05:23'),(1335,'2507200','Itatuba','PB','2023-08-17 20:05:23','2023-08-17 20:05:23'),(1336,'2507309','Jacarau','PB','2023-08-17 20:05:23','2023-08-17 20:05:23'),(1337,'2507408','Jerico','PB','2023-08-17 20:05:23','2023-08-17 20:05:23'),(1338,'2507507','Joao Pessoa','PB','2023-08-17 20:05:23','2023-08-17 20:05:23'),(1339,'2507606','Juarez Tavora','PB','2023-08-17 20:05:23','2023-08-17 20:05:23'),(1340,'2507705','Juazeirinho','PB','2023-08-17 20:05:23','2023-08-17 20:05:23'),(1341,'2507804','Junco do Serido','PB','2023-08-17 20:05:23','2023-08-17 20:05:23'),(1342,'2507903','Juripiranga','PB','2023-08-17 20:05:23','2023-08-17 20:05:23'),(1343,'2508000','Juru','PB','2023-08-17 20:05:23','2023-08-17 20:05:23'),(1344,'2508109','Lagoa','PB','2023-08-17 20:05:23','2023-08-17 20:05:23'),(1345,'2508208','Lagoa de Dentro','PB','2023-08-17 20:05:23','2023-08-17 20:05:23'),(1346,'2508307','Lagoa Seca','PB','2023-08-17 20:05:23','2023-08-17 20:05:23'),(1347,'2508406','Lastro','PB','2023-08-17 20:05:23','2023-08-17 20:05:23'),(1348,'2508505','Livramento','PB','2023-08-17 20:05:23','2023-08-17 20:05:23'),(1349,'2508554','Logradouro','PB','2023-08-17 20:05:23','2023-08-17 20:05:23'),(1350,'2508604','Lucena','PB','2023-08-17 20:05:23','2023-08-17 20:05:23'),(1351,'2508703','Mae D\'agua','PB','2023-08-17 20:05:23','2023-08-17 20:05:23'),(1352,'2508802','Malta','PB','2023-08-17 20:05:23','2023-08-17 20:05:23'),(1353,'2508901','Mamanguape','PB','2023-08-17 20:05:23','2023-08-17 20:05:23'),(1354,'2509008','Manaira','PB','2023-08-17 20:05:23','2023-08-17 20:05:23'),(1355,'2509057','Marcaçao','PB','2023-08-17 20:05:23','2023-08-17 20:05:23'),(1356,'2509107','Mari','PB','2023-08-17 20:05:23','2023-08-17 20:05:23'),(1357,'2509156','Marizopolis','PB','2023-08-17 20:05:23','2023-08-17 20:05:23'),(1358,'2509206','Massaranduba','PB','2023-08-17 20:05:23','2023-08-17 20:05:23'),(1359,'2509305','Mataraca','PB','2023-08-17 20:05:23','2023-08-17 20:05:23'),(1360,'2509339','Matinhas','PB','2023-08-17 20:05:23','2023-08-17 20:05:23'),(1361,'2509370','Mato Grosso','PB','2023-08-17 20:05:23','2023-08-17 20:05:23'),(1362,'2509396','Matureia','PB','2023-08-17 20:05:23','2023-08-17 20:05:23'),(1363,'2509404','Mogeiro','PB','2023-08-17 20:05:23','2023-08-17 20:05:23'),(1364,'2509503','Montadas','PB','2023-08-17 20:05:23','2023-08-17 20:05:23'),(1365,'2509602','Monte Horebe','PB','2023-08-17 20:05:23','2023-08-17 20:05:23'),(1366,'2509701','Monteiro','PB','2023-08-17 20:05:23','2023-08-17 20:05:23'),(1367,'2509800','Mulungu','PB','2023-08-17 20:05:23','2023-08-17 20:05:23'),(1368,'2509909','Natuba','PB','2023-08-17 20:05:23','2023-08-17 20:05:23'),(1369,'2510006','Nazarezinho','PB','2023-08-17 20:05:23','2023-08-17 20:05:23'),(1370,'2510105','Nova Floresta','PB','2023-08-17 20:05:23','2023-08-17 20:05:23'),(1371,'2510204','Nova Olinda','PB','2023-08-17 20:05:23','2023-08-17 20:05:23'),(1372,'2510303','Nova Palmeira','PB','2023-08-17 20:05:23','2023-08-17 20:05:23'),(1373,'2510402','Olho D\'agua','PB','2023-08-17 20:05:23','2023-08-17 20:05:23'),(1374,'2510501','Olivedos','PB','2023-08-17 20:05:23','2023-08-17 20:05:23'),(1375,'2510600','Ouro Velho','PB','2023-08-17 20:05:23','2023-08-17 20:05:23'),(1376,'2510659','Parari','PB','2023-08-17 20:05:23','2023-08-17 20:05:23'),(1377,'2510709','Passagem','PB','2023-08-17 20:05:23','2023-08-17 20:05:23'),(1378,'2510808','Patos','PB','2023-08-17 20:05:23','2023-08-17 20:05:23'),(1379,'2510907','Paulista','PB','2023-08-17 20:05:23','2023-08-17 20:05:23'),(1380,'2511004','Pedra Branca','PB','2023-08-17 20:05:23','2023-08-17 20:05:23'),(1381,'2511103','Pedra Lavrada','PB','2023-08-17 20:05:23','2023-08-17 20:05:23'),(1382,'2511202','Pedras de Fogo','PB','2023-08-17 20:05:23','2023-08-17 20:05:23'),(1383,'2511301','Pianco','PB','2023-08-17 20:05:23','2023-08-17 20:05:23'),(1384,'2511400','Picui','PB','2023-08-17 20:05:23','2023-08-17 20:05:23'),(1385,'2511509','Pilar','PB','2023-08-17 20:05:23','2023-08-17 20:05:23'),(1386,'2511608','Piloes','PB','2023-08-17 20:05:23','2023-08-17 20:05:23'),(1387,'2511707','Piloezinhos','PB','2023-08-17 20:05:23','2023-08-17 20:05:23'),(1388,'2511806','Pirpirituba','PB','2023-08-17 20:05:23','2023-08-17 20:05:23'),(1389,'2511905','Pitimbu','PB','2023-08-17 20:05:23','2023-08-17 20:05:23'),(1390,'2512002','Pocinhos','PB','2023-08-17 20:05:23','2023-08-17 20:05:23'),(1391,'2512036','Poço Dantas','PB','2023-08-17 20:05:23','2023-08-17 20:05:23'),(1392,'2512077','Poço de Jose de Moura','PB','2023-08-17 20:05:23','2023-08-17 20:05:23'),(1393,'2512101','Pombal','PB','2023-08-17 20:05:23','2023-08-17 20:05:23'),(1394,'2512200','Prata','PB','2023-08-17 20:05:23','2023-08-17 20:05:23'),(1395,'2512309','Princesa Isabel','PB','2023-08-17 20:05:23','2023-08-17 20:05:23'),(1396,'2512408','Puxinana','PB','2023-08-17 20:05:23','2023-08-17 20:05:23'),(1397,'2512507','Queimadas','PB','2023-08-17 20:05:23','2023-08-17 20:05:23'),(1398,'2512606','Quixaba','PB','2023-08-17 20:05:23','2023-08-17 20:05:23'),(1399,'2512705','Remigio','PB','2023-08-17 20:05:23','2023-08-17 20:05:23'),(1400,'2512721','Pedro Regis','PB','2023-08-17 20:05:23','2023-08-17 20:05:23'),(1401,'2512747','Riachao','PB','2023-08-17 20:05:23','2023-08-17 20:05:23'),(1402,'2512754','Riachao do Bacamarte','PB','2023-08-17 20:05:23','2023-08-17 20:05:23'),(1403,'2512762','Riachao do Poço','PB','2023-08-17 20:05:23','2023-08-17 20:05:23'),(1404,'2512788','Riacho de Santo Antônio','PB','2023-08-17 20:05:23','2023-08-17 20:05:23'),(1405,'2512804','Riacho dos Cavalos','PB','2023-08-17 20:05:23','2023-08-17 20:05:23'),(1406,'2512903','Rio Tinto','PB','2023-08-17 20:05:23','2023-08-17 20:05:23'),(1407,'2513000','Salgadinho','PB','2023-08-17 20:05:23','2023-08-17 20:05:23'),(1408,'2513109','Salgado de Sao Felix','PB','2023-08-17 20:05:23','2023-08-17 20:05:23'),(1409,'2513158','Santa Cecilia','PB','2023-08-17 20:05:23','2023-08-17 20:05:23'),(1410,'2513208','Santa Cruz','PB','2023-08-17 20:05:23','2023-08-17 20:05:23'),(1411,'2513307','Santa Helena','PB','2023-08-17 20:05:23','2023-08-17 20:05:23'),(1412,'2513356','Santa Inês','PB','2023-08-17 20:05:23','2023-08-17 20:05:23'),(1413,'2513406','Santa Luzia','PB','2023-08-17 20:05:23','2023-08-17 20:05:23'),(1414,'2513505','Santana de Mangueira','PB','2023-08-17 20:05:23','2023-08-17 20:05:23'),(1415,'2513604','Santana dos Garrotes','PB','2023-08-17 20:05:23','2023-08-17 20:05:23'),(1416,'2513653','Joca Claudino','PB','2023-08-17 20:05:23','2023-08-17 20:05:23'),(1417,'2513703','Santa Rita','PB','2023-08-17 20:05:23','2023-08-17 20:05:23'),(1418,'2513802','Santa Teresinha','PB','2023-08-17 20:05:23','2023-08-17 20:05:23'),(1419,'2513851','Santo Andre','PB','2023-08-17 20:05:23','2023-08-17 20:05:23'),(1420,'2513901','Sao Bento','PB','2023-08-17 20:05:23','2023-08-17 20:05:23'),(1421,'2513927','Sao Bentinho','PB','2023-08-17 20:05:23','2023-08-17 20:05:23'),(1422,'2513943','Sao Domingos do Cariri','PB','2023-08-17 20:05:23','2023-08-17 20:05:23'),(1423,'2513968','Sao Domingos','PB','2023-08-17 20:05:23','2023-08-17 20:05:23'),(1424,'2513984','Sao Francisco','PB','2023-08-17 20:05:23','2023-08-17 20:05:23'),(1425,'2514008','Sao Joao do Cariri','PB','2023-08-17 20:05:23','2023-08-17 20:05:23'),(1426,'2514107','Sao Joao do Tigre','PB','2023-08-17 20:05:23','2023-08-17 20:05:23'),(1427,'2514206','Sao Jose da Lagoa Tapada','PB','2023-08-17 20:05:23','2023-08-17 20:05:23'),(1428,'2514305','Sao Jose de Caiana','PB','2023-08-17 20:05:23','2023-08-17 20:05:23'),(1429,'2514404','Sao Jose de Espinharas','PB','2023-08-17 20:05:23','2023-08-17 20:05:23'),(1430,'2514453','Sao Jose dos Ramos','PB','2023-08-17 20:05:23','2023-08-17 20:05:23'),(1431,'2514503','Sao Jose de Piranhas','PB','2023-08-17 20:05:23','2023-08-17 20:05:23'),(1432,'2514552','Sao Jose de Princesa','PB','2023-08-17 20:05:23','2023-08-17 20:05:23'),(1433,'2514602','Sao Jose do Bonfim','PB','2023-08-17 20:05:23','2023-08-17 20:05:23'),(1434,'2514651','Sao Jose do Brejo do Cruz','PB','2023-08-17 20:05:23','2023-08-17 20:05:23'),(1435,'2514701','Sao Jose do Sabugi','PB','2023-08-17 20:05:23','2023-08-17 20:05:23'),(1436,'2514800','Sao Jose dos Cordeiros','PB','2023-08-17 20:05:23','2023-08-17 20:05:23'),(1437,'2514909','Sao Mamede','PB','2023-08-17 20:05:23','2023-08-17 20:05:23'),(1438,'2515005','Sao Miguel de Taipu','PB','2023-08-17 20:05:23','2023-08-17 20:05:23'),(1439,'2515104','Sao Sebastiao de Lagoa de Roça','PB','2023-08-17 20:05:23','2023-08-17 20:05:23'),(1440,'2515203','Sao Sebastiao do Umbuzeiro','PB','2023-08-17 20:05:23','2023-08-17 20:05:23'),(1441,'2515302','Sape','PB','2023-08-17 20:05:23','2023-08-17 20:05:23'),(1442,'2515401','Sao Vicente do Serido','PB','2023-08-17 20:05:23','2023-08-17 20:05:23'),(1443,'2515500','Serra Branca','PB','2023-08-17 20:05:23','2023-08-17 20:05:23'),(1444,'2515609','Serra da Raiz','PB','2023-08-17 20:05:23','2023-08-17 20:05:23'),(1445,'2515708','Serra Grande','PB','2023-08-17 20:05:23','2023-08-17 20:05:23'),(1446,'2515807','Serra Redonda','PB','2023-08-17 20:05:23','2023-08-17 20:05:23'),(1447,'2515906','Serraria','PB','2023-08-17 20:05:23','2023-08-17 20:05:23'),(1448,'2515930','Sertaozinho','PB','2023-08-17 20:05:23','2023-08-17 20:05:23'),(1449,'2515971','Sobrado','PB','2023-08-17 20:05:23','2023-08-17 20:05:23'),(1450,'2516003','Solânea','PB','2023-08-17 20:05:23','2023-08-17 20:05:23'),(1451,'2516102','Soledade','PB','2023-08-17 20:05:23','2023-08-17 20:05:23'),(1452,'2516151','Sossêgo','PB','2023-08-17 20:05:23','2023-08-17 20:05:23'),(1453,'2516201','Sousa','PB','2023-08-17 20:05:23','2023-08-17 20:05:23'),(1454,'2516300','Sume','PB','2023-08-17 20:05:23','2023-08-17 20:05:23'),(1455,'2516409','Tacima','PB','2023-08-17 20:05:23','2023-08-17 20:05:23'),(1456,'2516508','Taperoa','PB','2023-08-17 20:05:23','2023-08-17 20:05:23'),(1457,'2516607','Tavares','PB','2023-08-17 20:05:23','2023-08-17 20:05:23'),(1458,'2516706','Teixeira','PB','2023-08-17 20:05:23','2023-08-17 20:05:23'),(1459,'2516755','Tenorio','PB','2023-08-17 20:05:23','2023-08-17 20:05:23'),(1460,'2516805','Triunfo','PB','2023-08-17 20:05:23','2023-08-17 20:05:23'),(1461,'2516904','Uirauna','PB','2023-08-17 20:05:23','2023-08-17 20:05:23'),(1462,'2517001','Umbuzeiro','PB','2023-08-17 20:05:23','2023-08-17 20:05:23'),(1463,'2517100','Varzea','PB','2023-08-17 20:05:23','2023-08-17 20:05:23'),(1464,'2517209','Vieiropolis','PB','2023-08-17 20:05:23','2023-08-17 20:05:23'),(1465,'2517407','Zabelê','PB','2023-08-17 20:05:23','2023-08-17 20:05:23'),(1466,'2600054','Abreu e Lima','PE','2023-08-17 20:05:23','2023-08-17 20:05:23'),(1467,'2600104','Afogados da Ingazeira','PE','2023-08-17 20:05:23','2023-08-17 20:05:23'),(1468,'2600203','Afrânio','PE','2023-08-17 20:05:23','2023-08-17 20:05:23'),(1469,'2600302','Agrestina','PE','2023-08-17 20:05:23','2023-08-17 20:05:23'),(1470,'2600401','agua Preta','PE','2023-08-17 20:05:23','2023-08-17 20:05:23'),(1471,'2600500','aguas Belas','PE','2023-08-17 20:05:23','2023-08-17 20:05:23'),(1472,'2600609','Alagoinha','PE','2023-08-17 20:05:23','2023-08-17 20:05:23'),(1473,'2600708','Aliança','PE','2023-08-17 20:05:23','2023-08-17 20:05:23'),(1474,'2600807','Altinho','PE','2023-08-17 20:05:23','2023-08-17 20:05:23'),(1475,'2600906','Amaraji','PE','2023-08-17 20:05:23','2023-08-17 20:05:23'),(1476,'2601003','Angelim','PE','2023-08-17 20:05:23','2023-08-17 20:05:23'),(1477,'2601052','Araçoiaba','PE','2023-08-17 20:05:23','2023-08-17 20:05:23'),(1478,'2601102','Araripina','PE','2023-08-17 20:05:23','2023-08-17 20:05:23'),(1479,'2601201','Arcoverde','PE','2023-08-17 20:05:23','2023-08-17 20:05:23'),(1480,'2601300','Barra de Guabiraba','PE','2023-08-17 20:05:23','2023-08-17 20:05:23'),(1481,'2601409','Barreiros','PE','2023-08-17 20:05:23','2023-08-17 20:05:23'),(1482,'2601508','Belem de Maria','PE','2023-08-17 20:05:23','2023-08-17 20:05:23'),(1483,'2601607','Belem do Sao Francisco','PE','2023-08-17 20:05:23','2023-08-17 20:05:23'),(1484,'2601706','Belo Jardim','PE','2023-08-17 20:05:24','2023-08-17 20:05:24'),(1485,'2601805','Betânia','PE','2023-08-17 20:05:24','2023-08-17 20:05:24'),(1486,'2601904','Bezerros','PE','2023-08-17 20:05:24','2023-08-17 20:05:24'),(1487,'2602001','Bodoco','PE','2023-08-17 20:05:24','2023-08-17 20:05:24'),(1488,'2602100','Bom Conselho','PE','2023-08-17 20:05:24','2023-08-17 20:05:24'),(1489,'2602209','Bom Jardim','PE','2023-08-17 20:05:24','2023-08-17 20:05:24'),(1490,'2602308','Bonito','PE','2023-08-17 20:05:24','2023-08-17 20:05:24'),(1491,'2602407','Brejao','PE','2023-08-17 20:05:24','2023-08-17 20:05:24'),(1492,'2602506','Brejinho','PE','2023-08-17 20:05:24','2023-08-17 20:05:24'),(1493,'2602605','Brejo da Madre de Deus','PE','2023-08-17 20:05:24','2023-08-17 20:05:24'),(1494,'2602704','Buenos Aires','PE','2023-08-17 20:05:24','2023-08-17 20:05:24'),(1495,'2602803','Buique','PE','2023-08-17 20:05:24','2023-08-17 20:05:24'),(1496,'2602902','Cabo de Santo Agostinho','PE','2023-08-17 20:05:24','2023-08-17 20:05:24'),(1497,'2603009','Cabrobo','PE','2023-08-17 20:05:24','2023-08-17 20:05:24'),(1498,'2603108','Cachoeirinha','PE','2023-08-17 20:05:24','2023-08-17 20:05:24'),(1499,'2603207','Caetes','PE','2023-08-17 20:05:24','2023-08-17 20:05:24'),(1500,'2603306','Calçado','PE','2023-08-17 20:05:24','2023-08-17 20:05:24'),(1501,'2603405','Calumbi','PE','2023-08-17 20:05:24','2023-08-17 20:05:24'),(1502,'2603454','Camaragibe','PE','2023-08-17 20:05:24','2023-08-17 20:05:24'),(1503,'2603504','Camocim de Sao Felix','PE','2023-08-17 20:05:24','2023-08-17 20:05:24'),(1504,'2603603','Camutanga','PE','2023-08-17 20:05:24','2023-08-17 20:05:24'),(1505,'2603702','Canhotinho','PE','2023-08-17 20:05:24','2023-08-17 20:05:24'),(1506,'2603801','Capoeiras','PE','2023-08-17 20:05:24','2023-08-17 20:05:24'),(1507,'2603900','Carnaiba','PE','2023-08-17 20:05:24','2023-08-17 20:05:24'),(1508,'2603926','Carnaubeira da Penha','PE','2023-08-17 20:05:24','2023-08-17 20:05:24'),(1509,'2604007','Carpina','PE','2023-08-17 20:05:24','2023-08-17 20:05:24'),(1510,'2604106','Caruaru','PE','2023-08-17 20:05:24','2023-08-17 20:05:24'),(1511,'2604155','Casinhas','PE','2023-08-17 20:05:24','2023-08-17 20:05:24'),(1512,'2604205','Catende','PE','2023-08-17 20:05:24','2023-08-17 20:05:24'),(1513,'2604304','Cedro','PE','2023-08-17 20:05:24','2023-08-17 20:05:24'),(1514,'2604403','Cha de Alegria','PE','2023-08-17 20:05:24','2023-08-17 20:05:24'),(1515,'2604502','Cha Grande','PE','2023-08-17 20:05:24','2023-08-17 20:05:24'),(1516,'2604601','Condado','PE','2023-08-17 20:05:24','2023-08-17 20:05:24'),(1517,'2604700','Correntes','PE','2023-08-17 20:05:24','2023-08-17 20:05:24'),(1518,'2604809','Cortês','PE','2023-08-17 20:05:24','2023-08-17 20:05:24'),(1519,'2604908','Cumaru','PE','2023-08-17 20:05:24','2023-08-17 20:05:24'),(1520,'2605004','Cupira','PE','2023-08-17 20:05:24','2023-08-17 20:05:24'),(1521,'2605103','Custodia','PE','2023-08-17 20:05:24','2023-08-17 20:05:24'),(1522,'2605152','Dormentes','PE','2023-08-17 20:05:24','2023-08-17 20:05:24'),(1523,'2605202','Escada','PE','2023-08-17 20:05:24','2023-08-17 20:05:24'),(1524,'2605301','Exu','PE','2023-08-17 20:05:24','2023-08-17 20:05:24'),(1525,'2605400','Feira Nova','PE','2023-08-17 20:05:24','2023-08-17 20:05:24'),(1526,'2605459','Fernando de Noronha','PE','2023-08-17 20:05:24','2023-08-17 20:05:24'),(1527,'2605509','Ferreiros','PE','2023-08-17 20:05:24','2023-08-17 20:05:24'),(1528,'2605608','Flores','PE','2023-08-17 20:05:24','2023-08-17 20:05:24'),(1529,'2605707','Floresta','PE','2023-08-17 20:05:24','2023-08-17 20:05:24'),(1530,'2605806','Frei Miguelinho','PE','2023-08-17 20:05:24','2023-08-17 20:05:24'),(1531,'2605905','Gameleira','PE','2023-08-17 20:05:24','2023-08-17 20:05:24'),(1532,'2606002','Garanhuns','PE','2023-08-17 20:05:24','2023-08-17 20:05:24'),(1533,'2606101','Gloria do Goita','PE','2023-08-17 20:05:24','2023-08-17 20:05:24'),(1534,'2606200','Goiana','PE','2023-08-17 20:05:24','2023-08-17 20:05:24'),(1535,'2606309','Granito','PE','2023-08-17 20:05:24','2023-08-17 20:05:24'),(1536,'2606408','Gravata','PE','2023-08-17 20:05:24','2023-08-17 20:05:24'),(1537,'2606507','Iati','PE','2023-08-17 20:05:24','2023-08-17 20:05:24'),(1538,'2606606','Ibimirim','PE','2023-08-17 20:05:24','2023-08-17 20:05:24'),(1539,'2606705','Ibirajuba','PE','2023-08-17 20:05:24','2023-08-17 20:05:24'),(1540,'2606804','Igarassu','PE','2023-08-17 20:05:24','2023-08-17 20:05:24'),(1541,'2606903','Iguaraci','PE','2023-08-17 20:05:24','2023-08-17 20:05:24'),(1542,'2607000','Inaja','PE','2023-08-17 20:05:24','2023-08-17 20:05:24'),(1543,'2607109','Ingazeira','PE','2023-08-17 20:05:24','2023-08-17 20:05:24'),(1544,'2607208','Ipojuca','PE','2023-08-17 20:05:24','2023-08-17 20:05:24'),(1545,'2607307','Ipubi','PE','2023-08-17 20:05:24','2023-08-17 20:05:24'),(1546,'2607406','Itacuruba','PE','2023-08-17 20:05:24','2023-08-17 20:05:24'),(1547,'2607505','Itaiba','PE','2023-08-17 20:05:24','2023-08-17 20:05:24'),(1548,'2607604','Ilha de Itamaraca','PE','2023-08-17 20:05:24','2023-08-17 20:05:24'),(1549,'2607653','Itambe','PE','2023-08-17 20:05:24','2023-08-17 20:05:24'),(1550,'2607703','Itapetim','PE','2023-08-17 20:05:24','2023-08-17 20:05:24'),(1551,'2607752','Itapissuma','PE','2023-08-17 20:05:24','2023-08-17 20:05:24'),(1552,'2607802','Itaquitinga','PE','2023-08-17 20:05:24','2023-08-17 20:05:24'),(1553,'2607901','Jaboatao dos Guararapes','PE','2023-08-17 20:05:24','2023-08-17 20:05:24'),(1554,'2607950','Jaqueira','PE','2023-08-17 20:05:24','2023-08-17 20:05:24'),(1555,'2608008','Jatauba','PE','2023-08-17 20:05:24','2023-08-17 20:05:24'),(1556,'2608057','Jatoba','PE','2023-08-17 20:05:24','2023-08-17 20:05:24'),(1557,'2608107','Joao Alfredo','PE','2023-08-17 20:05:24','2023-08-17 20:05:24'),(1558,'2608206','Joaquim Nabuco','PE','2023-08-17 20:05:24','2023-08-17 20:05:24'),(1559,'2608255','Jucati','PE','2023-08-17 20:05:24','2023-08-17 20:05:24'),(1560,'2608305','Jupi','PE','2023-08-17 20:05:24','2023-08-17 20:05:24'),(1561,'2608404','Jurema','PE','2023-08-17 20:05:24','2023-08-17 20:05:24'),(1562,'2608453','Lagoa do Carro','PE','2023-08-17 20:05:24','2023-08-17 20:05:24'),(1563,'2608503','Lagoa de Itaenga','PE','2023-08-17 20:05:24','2023-08-17 20:05:24'),(1564,'2608602','Lagoa do Ouro','PE','2023-08-17 20:05:24','2023-08-17 20:05:24'),(1565,'2608701','Lagoa dos Gatos','PE','2023-08-17 20:05:24','2023-08-17 20:05:24'),(1566,'2608750','Lagoa Grande','PE','2023-08-17 20:05:24','2023-08-17 20:05:24'),(1567,'2608800','Lajedo','PE','2023-08-17 20:05:24','2023-08-17 20:05:24'),(1568,'2608909','Limoeiro','PE','2023-08-17 20:05:24','2023-08-17 20:05:24'),(1569,'2609006','Macaparana','PE','2023-08-17 20:05:24','2023-08-17 20:05:24'),(1570,'2609105','Machados','PE','2023-08-17 20:05:24','2023-08-17 20:05:24'),(1571,'2609154','Manari','PE','2023-08-17 20:05:24','2023-08-17 20:05:24'),(1572,'2609204','Maraial','PE','2023-08-17 20:05:24','2023-08-17 20:05:24'),(1573,'2609303','Mirandiba','PE','2023-08-17 20:05:24','2023-08-17 20:05:24'),(1574,'2609402','Moreno','PE','2023-08-17 20:05:24','2023-08-17 20:05:24'),(1575,'2609501','Nazare da Mata','PE','2023-08-17 20:05:24','2023-08-17 20:05:24'),(1576,'2609600','Olinda','PE','2023-08-17 20:05:24','2023-08-17 20:05:24'),(1577,'2609709','Orobo','PE','2023-08-17 20:05:24','2023-08-17 20:05:24'),(1578,'2609808','Oroco','PE','2023-08-17 20:05:24','2023-08-17 20:05:24'),(1579,'2609907','Ouricuri','PE','2023-08-17 20:05:24','2023-08-17 20:05:24'),(1580,'2610004','Palmares','PE','2023-08-17 20:05:24','2023-08-17 20:05:24'),(1581,'2610103','Palmeirina','PE','2023-08-17 20:05:24','2023-08-17 20:05:24'),(1582,'2610202','Panelas','PE','2023-08-17 20:05:24','2023-08-17 20:05:24'),(1583,'2610301','Paranatama','PE','2023-08-17 20:05:24','2023-08-17 20:05:24'),(1584,'2610400','Parnamirim','PE','2023-08-17 20:05:24','2023-08-17 20:05:24'),(1585,'2610509','Passira','PE','2023-08-17 20:05:24','2023-08-17 20:05:24'),(1586,'2610608','Paudalho','PE','2023-08-17 20:05:24','2023-08-17 20:05:24'),(1587,'2610707','Paulista','PE','2023-08-17 20:05:24','2023-08-17 20:05:24'),(1588,'2610806','Pedra','PE','2023-08-17 20:05:24','2023-08-17 20:05:24'),(1589,'2610905','Pesqueira','PE','2023-08-17 20:05:24','2023-08-17 20:05:24'),(1590,'2611002','Petrolândia','PE','2023-08-17 20:05:24','2023-08-17 20:05:24'),(1591,'2611101','Petrolina','PE','2023-08-17 20:05:24','2023-08-17 20:05:24'),(1592,'2611200','Poçao','PE','2023-08-17 20:05:24','2023-08-17 20:05:24'),(1593,'2611309','Pombos','PE','2023-08-17 20:05:24','2023-08-17 20:05:24'),(1594,'2611408','Primavera','PE','2023-08-17 20:05:24','2023-08-17 20:05:24'),(1595,'2611507','Quipapa','PE','2023-08-17 20:05:24','2023-08-17 20:05:24'),(1596,'2611533','Quixaba','PE','2023-08-17 20:05:24','2023-08-17 20:05:24'),(1597,'2611606','Recife','PE','2023-08-17 20:05:24','2023-08-17 20:05:24'),(1598,'2611705','Riacho das Almas','PE','2023-08-17 20:05:24','2023-08-17 20:05:24'),(1599,'2611804','Ribeirao','PE','2023-08-17 20:05:24','2023-08-17 20:05:24'),(1600,'2611903','Rio Formoso','PE','2023-08-17 20:05:24','2023-08-17 20:05:24'),(1601,'2612000','Saire','PE','2023-08-17 20:05:24','2023-08-17 20:05:24'),(1602,'2612109','Salgadinho','PE','2023-08-17 20:05:24','2023-08-17 20:05:24'),(1603,'2612208','Salgueiro','PE','2023-08-17 20:05:24','2023-08-17 20:05:24'),(1604,'2612307','Saloa','PE','2023-08-17 20:05:24','2023-08-17 20:05:24'),(1605,'2612406','Sanharo','PE','2023-08-17 20:05:24','2023-08-17 20:05:24'),(1606,'2612455','Santa Cruz','PE','2023-08-17 20:05:24','2023-08-17 20:05:24'),(1607,'2612471','Santa Cruz da Baixa Verde','PE','2023-08-17 20:05:24','2023-08-17 20:05:24'),(1608,'2612505','Santa Cruz do Capibaribe','PE','2023-08-17 20:05:24','2023-08-17 20:05:24'),(1609,'2612554','Santa Filomena','PE','2023-08-17 20:05:24','2023-08-17 20:05:24'),(1610,'2612604','Santa Maria da Boa Vista','PE','2023-08-17 20:05:24','2023-08-17 20:05:24'),(1611,'2612703','Santa Maria do Cambuca','PE','2023-08-17 20:05:24','2023-08-17 20:05:24'),(1612,'2612802','Santa Terezinha','PE','2023-08-17 20:05:24','2023-08-17 20:05:24'),(1613,'2612901','Sao Benedito do Sul','PE','2023-08-17 20:05:24','2023-08-17 20:05:24'),(1614,'2613008','Sao Bento do Una','PE','2023-08-17 20:05:24','2023-08-17 20:05:24'),(1615,'2613107','Sao Caitano','PE','2023-08-17 20:05:24','2023-08-17 20:05:24'),(1616,'2613206','Sao Joao','PE','2023-08-17 20:05:24','2023-08-17 20:05:24'),(1617,'2613305','Sao Joaquim do Monte','PE','2023-08-17 20:05:24','2023-08-17 20:05:24'),(1618,'2613404','Sao Jose da Coroa Grande','PE','2023-08-17 20:05:24','2023-08-17 20:05:24'),(1619,'2613503','Sao Jose do Belmonte','PE','2023-08-17 20:05:24','2023-08-17 20:05:24'),(1620,'2613602','Sao Jose do Egito','PE','2023-08-17 20:05:24','2023-08-17 20:05:24'),(1621,'2613701','Sao Lourenço da Mata','PE','2023-08-17 20:05:24','2023-08-17 20:05:24'),(1622,'2613800','Sao Vicente Ferrer','PE','2023-08-17 20:05:24','2023-08-17 20:05:24'),(1623,'2613909','Serra Talhada','PE','2023-08-17 20:05:24','2023-08-17 20:05:24'),(1624,'2614006','Serrita','PE','2023-08-17 20:05:24','2023-08-17 20:05:24'),(1625,'2614105','Sertânia','PE','2023-08-17 20:05:24','2023-08-17 20:05:24'),(1626,'2614204','Sirinhaem','PE','2023-08-17 20:05:24','2023-08-17 20:05:24'),(1627,'2614303','Moreilândia','PE','2023-08-17 20:05:24','2023-08-17 20:05:24'),(1628,'2614402','Solidao','PE','2023-08-17 20:05:24','2023-08-17 20:05:24'),(1629,'2614501','Surubim','PE','2023-08-17 20:05:24','2023-08-17 20:05:24'),(1630,'2614600','Tabira','PE','2023-08-17 20:05:24','2023-08-17 20:05:24'),(1631,'2614709','Tacaimbo','PE','2023-08-17 20:05:24','2023-08-17 20:05:24'),(1632,'2614808','Tacaratu','PE','2023-08-17 20:05:24','2023-08-17 20:05:24'),(1633,'2614857','Tamandare','PE','2023-08-17 20:05:24','2023-08-17 20:05:24'),(1634,'2615003','Taquaritinga do Norte','PE','2023-08-17 20:05:24','2023-08-17 20:05:24'),(1635,'2615102','Terezinha','PE','2023-08-17 20:05:24','2023-08-17 20:05:24'),(1636,'2615201','Terra Nova','PE','2023-08-17 20:05:24','2023-08-17 20:05:24'),(1637,'2615300','Timbauba','PE','2023-08-17 20:05:24','2023-08-17 20:05:24'),(1638,'2615409','Toritama','PE','2023-08-17 20:05:24','2023-08-17 20:05:24'),(1639,'2615508','Tracunhaem','PE','2023-08-17 20:05:24','2023-08-17 20:05:24'),(1640,'2615607','Trindade','PE','2023-08-17 20:05:24','2023-08-17 20:05:24'),(1641,'2615706','Triunfo','PE','2023-08-17 20:05:24','2023-08-17 20:05:24'),(1642,'2615805','Tupanatinga','PE','2023-08-17 20:05:24','2023-08-17 20:05:24'),(1643,'2615904','Tuparetama','PE','2023-08-17 20:05:24','2023-08-17 20:05:24'),(1644,'2616001','Venturosa','PE','2023-08-17 20:05:24','2023-08-17 20:05:24'),(1645,'2616100','Verdejante','PE','2023-08-17 20:05:24','2023-08-17 20:05:24'),(1646,'2616183','Vertente do Lerio','PE','2023-08-17 20:05:24','2023-08-17 20:05:24'),(1647,'2616209','Vertentes','PE','2023-08-17 20:05:24','2023-08-17 20:05:24'),(1648,'2616308','Vicência','PE','2023-08-17 20:05:24','2023-08-17 20:05:24'),(1649,'2616407','Vitoria de Santo Antao','PE','2023-08-17 20:05:24','2023-08-17 20:05:24'),(1650,'2616506','Xexeu','PE','2023-08-17 20:05:24','2023-08-17 20:05:24'),(1651,'2700102','agua Branca','AL','2023-08-17 20:05:24','2023-08-17 20:05:24'),(1652,'2700201','Anadia','AL','2023-08-17 20:05:24','2023-08-17 20:05:24'),(1653,'2700300','Arapiraca','AL','2023-08-17 20:05:24','2023-08-17 20:05:24'),(1654,'2700409','Atalaia','AL','2023-08-17 20:05:24','2023-08-17 20:05:24'),(1655,'2700508','Barra de Santo Antônio','AL','2023-08-17 20:05:24','2023-08-17 20:05:24'),(1656,'2700607','Barra de Sao Miguel','AL','2023-08-17 20:05:24','2023-08-17 20:05:24'),(1657,'2700706','Batalha','AL','2023-08-17 20:05:24','2023-08-17 20:05:24'),(1658,'2700805','Belem','AL','2023-08-17 20:05:24','2023-08-17 20:05:24'),(1659,'2700904','Belo Monte','AL','2023-08-17 20:05:24','2023-08-17 20:05:24'),(1660,'2701001','Boca da Mata','AL','2023-08-17 20:05:24','2023-08-17 20:05:24'),(1661,'2701100','Branquinha','AL','2023-08-17 20:05:24','2023-08-17 20:05:24'),(1662,'2701209','Cacimbinhas','AL','2023-08-17 20:05:24','2023-08-17 20:05:24'),(1663,'2701308','Cajueiro','AL','2023-08-17 20:05:24','2023-08-17 20:05:24'),(1664,'2701357','Campestre','AL','2023-08-17 20:05:24','2023-08-17 20:05:24'),(1665,'2701407','Campo Alegre','AL','2023-08-17 20:05:24','2023-08-17 20:05:24'),(1666,'2701506','Campo Grande','AL','2023-08-17 20:05:24','2023-08-17 20:05:24'),(1667,'2701605','Canapi','AL','2023-08-17 20:05:24','2023-08-17 20:05:24'),(1668,'2701704','Capela','AL','2023-08-17 20:05:24','2023-08-17 20:05:24'),(1669,'2701803','Carneiros','AL','2023-08-17 20:05:24','2023-08-17 20:05:24'),(1670,'2701902','Cha Preta','AL','2023-08-17 20:05:24','2023-08-17 20:05:24'),(1671,'2702009','Coite do Noia','AL','2023-08-17 20:05:24','2023-08-17 20:05:24'),(1672,'2702108','Colônia Leopoldina','AL','2023-08-17 20:05:24','2023-08-17 20:05:24'),(1673,'2702207','Coqueiro Seco','AL','2023-08-17 20:05:24','2023-08-17 20:05:24'),(1674,'2702306','Coruripe','AL','2023-08-17 20:05:24','2023-08-17 20:05:24'),(1675,'2702355','Craibas','AL','2023-08-17 20:05:24','2023-08-17 20:05:24'),(1676,'2702405','Delmiro Gouveia','AL','2023-08-17 20:05:24','2023-08-17 20:05:24'),(1677,'2702504','Dois Riachos','AL','2023-08-17 20:05:24','2023-08-17 20:05:24'),(1678,'2702553','Estrela de Alagoas','AL','2023-08-17 20:05:24','2023-08-17 20:05:24'),(1679,'2702603','Feira Grande','AL','2023-08-17 20:05:24','2023-08-17 20:05:24'),(1680,'2702702','Feliz Deserto','AL','2023-08-17 20:05:24','2023-08-17 20:05:24'),(1681,'2702801','Flexeiras','AL','2023-08-17 20:05:24','2023-08-17 20:05:24'),(1682,'2702900','Girau do Ponciano','AL','2023-08-17 20:05:24','2023-08-17 20:05:24'),(1683,'2703007','Ibateguara','AL','2023-08-17 20:05:24','2023-08-17 20:05:24'),(1684,'2703106','Igaci','AL','2023-08-17 20:05:24','2023-08-17 20:05:24'),(1685,'2703205','Igreja Nova','AL','2023-08-17 20:05:24','2023-08-17 20:05:24'),(1686,'2703304','Inhapi','AL','2023-08-17 20:05:24','2023-08-17 20:05:24'),(1687,'2703403','Jacare dos Homens','AL','2023-08-17 20:05:24','2023-08-17 20:05:24'),(1688,'2703502','Jacuipe','AL','2023-08-17 20:05:24','2023-08-17 20:05:24'),(1689,'2703601','Japaratinga','AL','2023-08-17 20:05:24','2023-08-17 20:05:24'),(1690,'2703700','Jaramataia','AL','2023-08-17 20:05:24','2023-08-17 20:05:24'),(1691,'2703759','Jequia da Praia','AL','2023-08-17 20:05:24','2023-08-17 20:05:24'),(1692,'2703809','Joaquim Gomes','AL','2023-08-17 20:05:24','2023-08-17 20:05:24'),(1693,'2703908','Jundia','AL','2023-08-17 20:05:24','2023-08-17 20:05:24'),(1694,'2704005','Junqueiro','AL','2023-08-17 20:05:24','2023-08-17 20:05:24'),(1695,'2704104','Lagoa da Canoa','AL','2023-08-17 20:05:24','2023-08-17 20:05:24'),(1696,'2704203','Limoeiro de Anadia','AL','2023-08-17 20:05:24','2023-08-17 20:05:24'),(1697,'2704302','Maceio','AL','2023-08-17 20:05:24','2023-08-17 20:05:24'),(1698,'2704401','Major Isidoro','AL','2023-08-17 20:05:24','2023-08-17 20:05:24'),(1699,'2704500','Maragogi','AL','2023-08-17 20:05:24','2023-08-17 20:05:24'),(1700,'2704609','Maravilha','AL','2023-08-17 20:05:24','2023-08-17 20:05:24'),(1701,'2704708','Marechal Deodoro','AL','2023-08-17 20:05:24','2023-08-17 20:05:24'),(1702,'2704807','Maribondo','AL','2023-08-17 20:05:24','2023-08-17 20:05:24'),(1703,'2704906','Mar Vermelho','AL','2023-08-17 20:05:24','2023-08-17 20:05:24'),(1704,'2705002','Mata Grande','AL','2023-08-17 20:05:24','2023-08-17 20:05:24'),(1705,'2705101','Matriz de Camaragibe','AL','2023-08-17 20:05:24','2023-08-17 20:05:24'),(1706,'2705200','Messias','AL','2023-08-17 20:05:24','2023-08-17 20:05:24'),(1707,'2705309','Minador do Negrao','AL','2023-08-17 20:05:24','2023-08-17 20:05:24'),(1708,'2705408','Monteiropolis','AL','2023-08-17 20:05:24','2023-08-17 20:05:24'),(1709,'2705507','Murici','AL','2023-08-17 20:05:24','2023-08-17 20:05:24'),(1710,'2705606','Novo Lino','AL','2023-08-17 20:05:24','2023-08-17 20:05:24'),(1711,'2705705','Olho D\'agua das Flores','AL','2023-08-17 20:05:24','2023-08-17 20:05:24'),(1712,'2705804','Olho D\'agua do Casado','AL','2023-08-17 20:05:24','2023-08-17 20:05:24'),(1713,'2705903','Olho D\'agua Grande','AL','2023-08-17 20:05:24','2023-08-17 20:05:24'),(1714,'2706000','Olivença','AL','2023-08-17 20:05:24','2023-08-17 20:05:24'),(1715,'2706109','Ouro Branco','AL','2023-08-17 20:05:24','2023-08-17 20:05:24'),(1716,'2706208','Palestina','AL','2023-08-17 20:05:24','2023-08-17 20:05:24'),(1717,'2706307','Palmeira dos indios','AL','2023-08-17 20:05:24','2023-08-17 20:05:24'),(1718,'2706406','Pao de Açucar','AL','2023-08-17 20:05:24','2023-08-17 20:05:24'),(1719,'2706422','Pariconha','AL','2023-08-17 20:05:24','2023-08-17 20:05:24'),(1720,'2706448','Paripueira','AL','2023-08-17 20:05:24','2023-08-17 20:05:24'),(1721,'2706505','Passo de Camaragibe','AL','2023-08-17 20:05:24','2023-08-17 20:05:24'),(1722,'2706604','Paulo Jacinto','AL','2023-08-17 20:05:24','2023-08-17 20:05:24'),(1723,'2706703','Penedo','AL','2023-08-17 20:05:24','2023-08-17 20:05:24'),(1724,'2706802','Piaçabuçu','AL','2023-08-17 20:05:24','2023-08-17 20:05:24'),(1725,'2706901','Pilar','AL','2023-08-17 20:05:24','2023-08-17 20:05:24'),(1726,'2707008','Pindoba','AL','2023-08-17 20:05:24','2023-08-17 20:05:24'),(1727,'2707107','Piranhas','AL','2023-08-17 20:05:24','2023-08-17 20:05:24'),(1728,'2707206','Poço das Trincheiras','AL','2023-08-17 20:05:24','2023-08-17 20:05:24'),(1729,'2707305','Porto Calvo','AL','2023-08-17 20:05:24','2023-08-17 20:05:24'),(1730,'2707404','Porto de Pedras','AL','2023-08-17 20:05:24','2023-08-17 20:05:24'),(1731,'2707503','Porto Real do Colegio','AL','2023-08-17 20:05:24','2023-08-17 20:05:24'),(1732,'2707602','Quebrangulo','AL','2023-08-17 20:05:24','2023-08-17 20:05:24'),(1733,'2707701','Rio Largo','AL','2023-08-17 20:05:24','2023-08-17 20:05:24'),(1734,'2707800','Roteiro','AL','2023-08-17 20:05:24','2023-08-17 20:05:24'),(1735,'2707909','Santa Luzia do Norte','AL','2023-08-17 20:05:24','2023-08-17 20:05:24'),(1736,'2708006','Santana do Ipanema','AL','2023-08-17 20:05:24','2023-08-17 20:05:24'),(1737,'2708105','Santana do Mundau','AL','2023-08-17 20:05:24','2023-08-17 20:05:24'),(1738,'2708204','Sao Bras','AL','2023-08-17 20:05:24','2023-08-17 20:05:24'),(1739,'2708303','Sao Jose da Laje','AL','2023-08-17 20:05:24','2023-08-17 20:05:24'),(1740,'2708402','Sao Jose da Tapera','AL','2023-08-17 20:05:24','2023-08-17 20:05:24'),(1741,'2708501','Sao Luis do Quitunde','AL','2023-08-17 20:05:24','2023-08-17 20:05:24'),(1742,'2708600','Sao Miguel dos Campos','AL','2023-08-17 20:05:24','2023-08-17 20:05:24'),(1743,'2708709','Sao Miguel dos Milagres','AL','2023-08-17 20:05:24','2023-08-17 20:05:24'),(1744,'2708808','Sao Sebastiao','AL','2023-08-17 20:05:24','2023-08-17 20:05:24'),(1745,'2708907','Satuba','AL','2023-08-17 20:05:24','2023-08-17 20:05:24'),(1746,'2708956','Senador Rui Palmeira','AL','2023-08-17 20:05:24','2023-08-17 20:05:24'),(1747,'2709004','Tanque D\'Arca','AL','2023-08-17 20:05:24','2023-08-17 20:05:24'),(1748,'2709103','Taquarana','AL','2023-08-17 20:05:24','2023-08-17 20:05:24'),(1749,'2709152','Teotônio Vilela','AL','2023-08-17 20:05:24','2023-08-17 20:05:24'),(1750,'2709202','Traipu','AL','2023-08-17 20:05:24','2023-08-17 20:05:24'),(1751,'2709301','Uniao dos Palmares','AL','2023-08-17 20:05:24','2023-08-17 20:05:24'),(1752,'2709400','Viçosa','AL','2023-08-17 20:05:24','2023-08-17 20:05:24'),(1753,'2800100','Amparo de Sao Francisco','SE','2023-08-17 20:05:24','2023-08-17 20:05:24'),(1754,'2800209','Aquidaba','SE','2023-08-17 20:05:24','2023-08-17 20:05:24'),(1755,'2800308','Aracaju','SE','2023-08-17 20:05:24','2023-08-17 20:05:24'),(1756,'2800407','Araua','SE','2023-08-17 20:05:24','2023-08-17 20:05:24'),(1757,'2800506','Areia Branca','SE','2023-08-17 20:05:24','2023-08-17 20:05:24'),(1758,'2800605','Barra dos Coqueiros','SE','2023-08-17 20:05:24','2023-08-17 20:05:24'),(1759,'2800670','Boquim','SE','2023-08-17 20:05:24','2023-08-17 20:05:24'),(1760,'2800704','Brejo Grande','SE','2023-08-17 20:05:24','2023-08-17 20:05:24'),(1761,'2801009','Campo do Brito','SE','2023-08-17 20:05:24','2023-08-17 20:05:24'),(1762,'2801108','Canhoba','SE','2023-08-17 20:05:24','2023-08-17 20:05:24'),(1763,'2801207','Caninde de Sao Francisco','SE','2023-08-17 20:05:24','2023-08-17 20:05:24'),(1764,'2801306','Capela','SE','2023-08-17 20:05:24','2023-08-17 20:05:24'),(1765,'2801405','Carira','SE','2023-08-17 20:05:24','2023-08-17 20:05:24'),(1766,'2801504','Carmopolis','SE','2023-08-17 20:05:24','2023-08-17 20:05:24'),(1767,'2801603','Cedro de Sao Joao','SE','2023-08-17 20:05:24','2023-08-17 20:05:24'),(1768,'2801702','Cristinapolis','SE','2023-08-17 20:05:24','2023-08-17 20:05:24'),(1769,'2801900','Cumbe','SE','2023-08-17 20:05:24','2023-08-17 20:05:24'),(1770,'2802007','Divina Pastora','SE','2023-08-17 20:05:24','2023-08-17 20:05:24'),(1771,'2802106','Estância','SE','2023-08-17 20:05:24','2023-08-17 20:05:24'),(1772,'2802205','Feira Nova','SE','2023-08-17 20:05:24','2023-08-17 20:05:24'),(1773,'2802304','Frei Paulo','SE','2023-08-17 20:05:24','2023-08-17 20:05:24'),(1774,'2802403','Gararu','SE','2023-08-17 20:05:24','2023-08-17 20:05:24'),(1775,'2802502','General Maynard','SE','2023-08-17 20:05:24','2023-08-17 20:05:24'),(1776,'2802601','Gracho Cardoso','SE','2023-08-17 20:05:24','2023-08-17 20:05:24'),(1777,'2802700','Ilha das Flores','SE','2023-08-17 20:05:24','2023-08-17 20:05:24'),(1778,'2802809','Indiaroba','SE','2023-08-17 20:05:24','2023-08-17 20:05:24'),(1779,'2802908','Itabaiana','SE','2023-08-17 20:05:24','2023-08-17 20:05:24'),(1780,'2803005','Itabaianinha','SE','2023-08-17 20:05:24','2023-08-17 20:05:24'),(1781,'2803104','Itabi','SE','2023-08-17 20:05:24','2023-08-17 20:05:24'),(1782,'2803203','Itaporanga D\'Ajuda','SE','2023-08-17 20:05:24','2023-08-17 20:05:24'),(1783,'2803302','Japaratuba','SE','2023-08-17 20:05:24','2023-08-17 20:05:24'),(1784,'2803401','Japoata','SE','2023-08-17 20:05:24','2023-08-17 20:05:24'),(1785,'2803500','Lagarto','SE','2023-08-17 20:05:24','2023-08-17 20:05:24'),(1786,'2803609','Laranjeiras','SE','2023-08-17 20:05:24','2023-08-17 20:05:24'),(1787,'2803708','Macambira','SE','2023-08-17 20:05:24','2023-08-17 20:05:24'),(1788,'2803807','Malhada dos Bois','SE','2023-08-17 20:05:24','2023-08-17 20:05:24'),(1789,'2803906','Malhador','SE','2023-08-17 20:05:24','2023-08-17 20:05:24'),(1790,'2804003','Maruim','SE','2023-08-17 20:05:24','2023-08-17 20:05:24'),(1791,'2804102','Moita Bonita','SE','2023-08-17 20:05:24','2023-08-17 20:05:24'),(1792,'2804201','Monte Alegre de Sergipe','SE','2023-08-17 20:05:24','2023-08-17 20:05:24'),(1793,'2804300','Muribeca','SE','2023-08-17 20:05:24','2023-08-17 20:05:24'),(1794,'2804409','Neopolis','SE','2023-08-17 20:05:24','2023-08-17 20:05:24'),(1795,'2804458','Nossa Senhora Aparecida','SE','2023-08-17 20:05:24','2023-08-17 20:05:24'),(1796,'2804508','Nossa Senhora da Gloria','SE','2023-08-17 20:05:24','2023-08-17 20:05:24'),(1797,'2804607','Nossa Senhora das Dores','SE','2023-08-17 20:05:24','2023-08-17 20:05:24'),(1798,'2804706','Nossa Senhora de Lourdes','SE','2023-08-17 20:05:24','2023-08-17 20:05:24'),(1799,'2804805','Nossa Senhora do Socorro','SE','2023-08-17 20:05:24','2023-08-17 20:05:24'),(1800,'2804904','Pacatuba','SE','2023-08-17 20:05:24','2023-08-17 20:05:24'),(1801,'2805000','Pedra Mole','SE','2023-08-17 20:05:24','2023-08-17 20:05:24'),(1802,'2805109','Pedrinhas','SE','2023-08-17 20:05:24','2023-08-17 20:05:24'),(1803,'2805208','Pinhao','SE','2023-08-17 20:05:24','2023-08-17 20:05:24'),(1804,'2805307','Pirambu','SE','2023-08-17 20:05:24','2023-08-17 20:05:24'),(1805,'2805406','Poço Redondo','SE','2023-08-17 20:05:24','2023-08-17 20:05:24'),(1806,'2805505','Poço Verde','SE','2023-08-17 20:05:24','2023-08-17 20:05:24'),(1807,'2805604','Porto da Folha','SE','2023-08-17 20:05:24','2023-08-17 20:05:24'),(1808,'2805703','Propria','SE','2023-08-17 20:05:24','2023-08-17 20:05:24'),(1809,'2805802','Riachao do Dantas','SE','2023-08-17 20:05:24','2023-08-17 20:05:24'),(1810,'2805901','Riachuelo','SE','2023-08-17 20:05:24','2023-08-17 20:05:24'),(1811,'2806008','Ribeiropolis','SE','2023-08-17 20:05:24','2023-08-17 20:05:24'),(1812,'2806107','Rosario do Catete','SE','2023-08-17 20:05:24','2023-08-17 20:05:24'),(1813,'2806206','Salgado','SE','2023-08-17 20:05:24','2023-08-17 20:05:24'),(1814,'2806305','Santa Luzia do Itanhy','SE','2023-08-17 20:05:24','2023-08-17 20:05:24'),(1815,'2806404','Santana do Sao Francisco','SE','2023-08-17 20:05:24','2023-08-17 20:05:24'),(1816,'2806503','Santa Rosa de Lima','SE','2023-08-17 20:05:24','2023-08-17 20:05:24'),(1817,'2806602','Santo Amaro das Brotas','SE','2023-08-17 20:05:24','2023-08-17 20:05:24'),(1818,'2806701','Sao Cristovao','SE','2023-08-17 20:05:24','2023-08-17 20:05:24'),(1819,'2806800','Sao Domingos','SE','2023-08-17 20:05:24','2023-08-17 20:05:24'),(1820,'2806909','Sao Francisco','SE','2023-08-17 20:05:24','2023-08-17 20:05:24'),(1821,'2807006','Sao Miguel do Aleixo','SE','2023-08-17 20:05:24','2023-08-17 20:05:24'),(1822,'2807105','Simao Dias','SE','2023-08-17 20:05:24','2023-08-17 20:05:24'),(1823,'2807204','Siriri','SE','2023-08-17 20:05:24','2023-08-17 20:05:24'),(1824,'2807303','Telha','SE','2023-08-17 20:05:24','2023-08-17 20:05:24'),(1825,'2807402','Tobias Barreto','SE','2023-08-17 20:05:24','2023-08-17 20:05:24'),(1826,'2807501','Tomar do Geru','SE','2023-08-17 20:05:24','2023-08-17 20:05:24'),(1827,'2807600','Umbauba','SE','2023-08-17 20:05:24','2023-08-17 20:05:24'),(1828,'2900108','Abaira','BA','2023-08-17 20:05:24','2023-08-17 20:05:24'),(1829,'2900207','Abare','BA','2023-08-17 20:05:24','2023-08-17 20:05:24'),(1830,'2900306','Acajutiba','BA','2023-08-17 20:05:24','2023-08-17 20:05:24'),(1831,'2900355','Adustina','BA','2023-08-17 20:05:24','2023-08-17 20:05:24'),(1832,'2900405','agua Fria','BA','2023-08-17 20:05:24','2023-08-17 20:05:24'),(1833,'2900504','erico Cardoso','BA','2023-08-17 20:05:24','2023-08-17 20:05:24'),(1834,'2900603','Aiquara','BA','2023-08-17 20:05:24','2023-08-17 20:05:24'),(1835,'2900702','Alagoinhas','BA','2023-08-17 20:05:24','2023-08-17 20:05:24'),(1836,'2900801','Alcobaça','BA','2023-08-17 20:05:24','2023-08-17 20:05:24'),(1837,'2900900','Almadina','BA','2023-08-17 20:05:24','2023-08-17 20:05:24'),(1838,'2901007','Amargosa','BA','2023-08-17 20:05:24','2023-08-17 20:05:24'),(1839,'2901106','Amelia Rodrigues','BA','2023-08-17 20:05:24','2023-08-17 20:05:24'),(1840,'2901155','America Dourada','BA','2023-08-17 20:05:24','2023-08-17 20:05:24'),(1841,'2901205','Anage','BA','2023-08-17 20:05:24','2023-08-17 20:05:24'),(1842,'2901304','Andarai','BA','2023-08-17 20:05:25','2023-08-17 20:05:25'),(1843,'2901353','Andorinha','BA','2023-08-17 20:05:25','2023-08-17 20:05:25'),(1844,'2901403','Angical','BA','2023-08-17 20:05:25','2023-08-17 20:05:25'),(1845,'2901502','Anguera','BA','2023-08-17 20:05:25','2023-08-17 20:05:25'),(1846,'2901601','Antas','BA','2023-08-17 20:05:25','2023-08-17 20:05:25'),(1847,'2901700','Antônio Cardoso','BA','2023-08-17 20:05:25','2023-08-17 20:05:25'),(1848,'2901809','Antônio Gonçalves','BA','2023-08-17 20:05:25','2023-08-17 20:05:25'),(1849,'2901908','Apora','BA','2023-08-17 20:05:25','2023-08-17 20:05:25'),(1850,'2901957','Apuarema','BA','2023-08-17 20:05:25','2023-08-17 20:05:25'),(1851,'2902005','Aracatu','BA','2023-08-17 20:05:25','2023-08-17 20:05:25'),(1852,'2902054','Araças','BA','2023-08-17 20:05:25','2023-08-17 20:05:25'),(1853,'2902104','Araci','BA','2023-08-17 20:05:25','2023-08-17 20:05:25'),(1854,'2902203','Aramari','BA','2023-08-17 20:05:25','2023-08-17 20:05:25'),(1855,'2902252','Arataca','BA','2023-08-17 20:05:25','2023-08-17 20:05:25'),(1856,'2902302','Aratuipe','BA','2023-08-17 20:05:25','2023-08-17 20:05:25'),(1857,'2902401','Aurelino Leal','BA','2023-08-17 20:05:25','2023-08-17 20:05:25'),(1858,'2902500','Baianopolis','BA','2023-08-17 20:05:25','2023-08-17 20:05:25'),(1859,'2902609','Baixa Grande','BA','2023-08-17 20:05:25','2023-08-17 20:05:25'),(1860,'2902658','Banzaê','BA','2023-08-17 20:05:25','2023-08-17 20:05:25'),(1861,'2902708','Barra','BA','2023-08-17 20:05:25','2023-08-17 20:05:25'),(1862,'2902807','Barra da Estiva','BA','2023-08-17 20:05:25','2023-08-17 20:05:25'),(1863,'2902906','Barra do Choça','BA','2023-08-17 20:05:25','2023-08-17 20:05:25'),(1864,'2903003','Barra do Mendes','BA','2023-08-17 20:05:25','2023-08-17 20:05:25'),(1865,'2903102','Barra do Rocha','BA','2023-08-17 20:05:25','2023-08-17 20:05:25'),(1866,'2903201','Barreiras','BA','2023-08-17 20:05:25','2023-08-17 20:05:25'),(1867,'2903235','Barro Alto','BA','2023-08-17 20:05:25','2023-08-17 20:05:25'),(1868,'2903276','Barrocas','BA','2023-08-17 20:05:25','2023-08-17 20:05:25'),(1869,'2903300','Barro Preto','BA','2023-08-17 20:05:25','2023-08-17 20:05:25'),(1870,'2903409','Belmonte','BA','2023-08-17 20:05:25','2023-08-17 20:05:25'),(1871,'2903508','Belo Campo','BA','2023-08-17 20:05:25','2023-08-17 20:05:25'),(1872,'2903607','Biritinga','BA','2023-08-17 20:05:25','2023-08-17 20:05:25'),(1873,'2903706','Boa Nova','BA','2023-08-17 20:05:25','2023-08-17 20:05:25'),(1874,'2903805','Boa Vista do Tupim','BA','2023-08-17 20:05:25','2023-08-17 20:05:25'),(1875,'2903904','Bom Jesus da Lapa','BA','2023-08-17 20:05:25','2023-08-17 20:05:25'),(1876,'2903953','Bom Jesus da Serra','BA','2023-08-17 20:05:25','2023-08-17 20:05:25'),(1877,'2904001','Boninal','BA','2023-08-17 20:05:25','2023-08-17 20:05:25'),(1878,'2904050','Bonito','BA','2023-08-17 20:05:25','2023-08-17 20:05:25'),(1879,'2904100','Boquira','BA','2023-08-17 20:05:25','2023-08-17 20:05:25'),(1880,'2904209','Botupora','BA','2023-08-17 20:05:25','2023-08-17 20:05:25'),(1881,'2904308','Brejoes','BA','2023-08-17 20:05:25','2023-08-17 20:05:25'),(1882,'2904407','Brejolândia','BA','2023-08-17 20:05:25','2023-08-17 20:05:25'),(1883,'2904506','Brotas de Macaubas','BA','2023-08-17 20:05:25','2023-08-17 20:05:25'),(1884,'2904605','Brumado','BA','2023-08-17 20:05:25','2023-08-17 20:05:25'),(1885,'2904704','Buerarema','BA','2023-08-17 20:05:25','2023-08-17 20:05:25'),(1886,'2904753','Buritirama','BA','2023-08-17 20:05:25','2023-08-17 20:05:25'),(1887,'2904803','Caatiba','BA','2023-08-17 20:05:25','2023-08-17 20:05:25'),(1888,'2904852','Cabaceiras do Paraguaçu','BA','2023-08-17 20:05:25','2023-08-17 20:05:25'),(1889,'2904902','Cachoeira','BA','2023-08-17 20:05:25','2023-08-17 20:05:25'),(1890,'2905008','Cacule','BA','2023-08-17 20:05:25','2023-08-17 20:05:25'),(1891,'2905107','Caem','BA','2023-08-17 20:05:25','2023-08-17 20:05:25'),(1892,'2905156','Caetanos','BA','2023-08-17 20:05:25','2023-08-17 20:05:25'),(1893,'2905206','Caetite','BA','2023-08-17 20:05:25','2023-08-17 20:05:25'),(1894,'2905305','Cafarnaum','BA','2023-08-17 20:05:25','2023-08-17 20:05:25'),(1895,'2905404','Cairu','BA','2023-08-17 20:05:25','2023-08-17 20:05:25'),(1896,'2905503','Caldeirao Grande','BA','2023-08-17 20:05:25','2023-08-17 20:05:25'),(1897,'2905602','Camacan','BA','2023-08-17 20:05:25','2023-08-17 20:05:25'),(1898,'2905701','Camaçari','BA','2023-08-17 20:05:25','2023-08-17 20:05:25'),(1899,'2905800','Camamu','BA','2023-08-17 20:05:25','2023-08-17 20:05:25'),(1900,'2905909','Campo Alegre de Lourdes','BA','2023-08-17 20:05:25','2023-08-17 20:05:25'),(1901,'2906006','Campo Formoso','BA','2023-08-17 20:05:25','2023-08-17 20:05:25'),(1902,'2906105','Canapolis','BA','2023-08-17 20:05:25','2023-08-17 20:05:25'),(1903,'2906204','Canarana','BA','2023-08-17 20:05:25','2023-08-17 20:05:25'),(1904,'2906303','Canavieiras','BA','2023-08-17 20:05:25','2023-08-17 20:05:25'),(1905,'2906402','Candeal','BA','2023-08-17 20:05:25','2023-08-17 20:05:25'),(1906,'2906501','Candeias','BA','2023-08-17 20:05:25','2023-08-17 20:05:25'),(1907,'2906600','Candiba','BA','2023-08-17 20:05:25','2023-08-17 20:05:25'),(1908,'2906709','Cândido Sales','BA','2023-08-17 20:05:25','2023-08-17 20:05:25'),(1909,'2906808','Cansançao','BA','2023-08-17 20:05:25','2023-08-17 20:05:25'),(1910,'2906824','Canudos','BA','2023-08-17 20:05:25','2023-08-17 20:05:25'),(1911,'2906857','Capela do Alto Alegre','BA','2023-08-17 20:05:25','2023-08-17 20:05:25'),(1912,'2906873','Capim Grosso','BA','2023-08-17 20:05:25','2023-08-17 20:05:25'),(1913,'2906899','Caraibas','BA','2023-08-17 20:05:25','2023-08-17 20:05:25'),(1914,'2906907','Caravelas','BA','2023-08-17 20:05:25','2023-08-17 20:05:25'),(1915,'2907004','Cardeal da Silva','BA','2023-08-17 20:05:25','2023-08-17 20:05:25'),(1916,'2907103','Carinhanha','BA','2023-08-17 20:05:25','2023-08-17 20:05:25'),(1917,'2907202','Casa Nova','BA','2023-08-17 20:05:25','2023-08-17 20:05:25'),(1918,'2907301','Castro Alves','BA','2023-08-17 20:05:25','2023-08-17 20:05:25'),(1919,'2907400','Catolândia','BA','2023-08-17 20:05:25','2023-08-17 20:05:25'),(1920,'2907509','Catu','BA','2023-08-17 20:05:25','2023-08-17 20:05:25'),(1921,'2907558','Caturama','BA','2023-08-17 20:05:25','2023-08-17 20:05:25'),(1922,'2907608','Central','BA','2023-08-17 20:05:25','2023-08-17 20:05:25'),(1923,'2907707','Chorrocho','BA','2023-08-17 20:05:25','2023-08-17 20:05:25'),(1924,'2907806','Cicero Dantas','BA','2023-08-17 20:05:25','2023-08-17 20:05:25'),(1925,'2907905','Cipo','BA','2023-08-17 20:05:25','2023-08-17 20:05:25'),(1926,'2908002','Coaraci','BA','2023-08-17 20:05:25','2023-08-17 20:05:25'),(1927,'2908101','Cocos','BA','2023-08-17 20:05:25','2023-08-17 20:05:25'),(1928,'2908200','Conceiçao da Feira','BA','2023-08-17 20:05:25','2023-08-17 20:05:25'),(1929,'2908309','Conceiçao do Almeida','BA','2023-08-17 20:05:25','2023-08-17 20:05:25'),(1930,'2908408','Conceiçao do Coite','BA','2023-08-17 20:05:25','2023-08-17 20:05:25'),(1931,'2908507','Conceiçao do Jacuipe','BA','2023-08-17 20:05:25','2023-08-17 20:05:25'),(1932,'2908606','Conde','BA','2023-08-17 20:05:25','2023-08-17 20:05:25'),(1933,'2908705','Condeuba','BA','2023-08-17 20:05:25','2023-08-17 20:05:25'),(1934,'2908804','Contendas do Sincora','BA','2023-08-17 20:05:25','2023-08-17 20:05:25'),(1935,'2908903','Coraçao de Maria','BA','2023-08-17 20:05:25','2023-08-17 20:05:25'),(1936,'2909000','Cordeiros','BA','2023-08-17 20:05:25','2023-08-17 20:05:25'),(1937,'2909109','Coribe','BA','2023-08-17 20:05:25','2023-08-17 20:05:25'),(1938,'2909208','Coronel Joao Sa','BA','2023-08-17 20:05:25','2023-08-17 20:05:25'),(1939,'2909307','Correntina','BA','2023-08-17 20:05:25','2023-08-17 20:05:25'),(1940,'2909406','Cotegipe','BA','2023-08-17 20:05:25','2023-08-17 20:05:25'),(1941,'2909505','Cravolândia','BA','2023-08-17 20:05:25','2023-08-17 20:05:25'),(1942,'2909604','Crisopolis','BA','2023-08-17 20:05:25','2023-08-17 20:05:25'),(1943,'2909703','Cristopolis','BA','2023-08-17 20:05:25','2023-08-17 20:05:25'),(1944,'2909802','Cruz das Almas','BA','2023-08-17 20:05:25','2023-08-17 20:05:25'),(1945,'2909901','Curaça','BA','2023-08-17 20:05:25','2023-08-17 20:05:25'),(1946,'2910008','Dario Meira','BA','2023-08-17 20:05:25','2023-08-17 20:05:25'),(1947,'2910057','Dias D\'avila','BA','2023-08-17 20:05:25','2023-08-17 20:05:25'),(1948,'2910107','Dom Basilio','BA','2023-08-17 20:05:25','2023-08-17 20:05:25'),(1949,'2910206','Dom Macedo Costa','BA','2023-08-17 20:05:25','2023-08-17 20:05:25'),(1950,'2910305','Elisio Medrado','BA','2023-08-17 20:05:25','2023-08-17 20:05:25'),(1951,'2910404','Encruzilhada','BA','2023-08-17 20:05:25','2023-08-17 20:05:25'),(1952,'2910503','Entre Rios','BA','2023-08-17 20:05:25','2023-08-17 20:05:25'),(1953,'2910602','Esplanada','BA','2023-08-17 20:05:25','2023-08-17 20:05:25'),(1954,'2910701','Euclides da Cunha','BA','2023-08-17 20:05:25','2023-08-17 20:05:25'),(1955,'2910727','Eunapolis','BA','2023-08-17 20:05:25','2023-08-17 20:05:25'),(1956,'2910750','Fatima','BA','2023-08-17 20:05:25','2023-08-17 20:05:25'),(1957,'2910776','Feira da Mata','BA','2023-08-17 20:05:25','2023-08-17 20:05:25'),(1958,'2910800','Feira de Santana','BA','2023-08-17 20:05:25','2023-08-17 20:05:25'),(1959,'2910859','Filadelfia','BA','2023-08-17 20:05:25','2023-08-17 20:05:25'),(1960,'2910909','Firmino Alves','BA','2023-08-17 20:05:25','2023-08-17 20:05:25'),(1961,'2911006','Floresta Azul','BA','2023-08-17 20:05:25','2023-08-17 20:05:25'),(1962,'2911105','Formosa do Rio Preto','BA','2023-08-17 20:05:25','2023-08-17 20:05:25'),(1963,'2911204','Gandu','BA','2023-08-17 20:05:25','2023-08-17 20:05:25'),(1964,'2911253','Gaviao','BA','2023-08-17 20:05:25','2023-08-17 20:05:25'),(1965,'2911303','Gentio do Ouro','BA','2023-08-17 20:05:25','2023-08-17 20:05:25'),(1966,'2911402','Gloria','BA','2023-08-17 20:05:25','2023-08-17 20:05:25'),(1967,'2911501','Gongogi','BA','2023-08-17 20:05:25','2023-08-17 20:05:25'),(1968,'2911600','Governador Mangabeira','BA','2023-08-17 20:05:25','2023-08-17 20:05:25'),(1969,'2911659','Guajeru','BA','2023-08-17 20:05:25','2023-08-17 20:05:25'),(1970,'2911709','Guanambi','BA','2023-08-17 20:05:25','2023-08-17 20:05:25'),(1971,'2911808','Guaratinga','BA','2023-08-17 20:05:25','2023-08-17 20:05:25'),(1972,'2911857','Heliopolis','BA','2023-08-17 20:05:25','2023-08-17 20:05:25'),(1973,'2911907','Iaçu','BA','2023-08-17 20:05:25','2023-08-17 20:05:25'),(1974,'2912004','Ibiassucê','BA','2023-08-17 20:05:25','2023-08-17 20:05:25'),(1975,'2912103','Ibicarai','BA','2023-08-17 20:05:25','2023-08-17 20:05:25'),(1976,'2912202','Ibicoara','BA','2023-08-17 20:05:25','2023-08-17 20:05:25'),(1977,'2912301','Ibicui','BA','2023-08-17 20:05:25','2023-08-17 20:05:25'),(1978,'2912400','Ibipeba','BA','2023-08-17 20:05:25','2023-08-17 20:05:25'),(1979,'2912509','Ibipitanga','BA','2023-08-17 20:05:25','2023-08-17 20:05:25'),(1980,'2912608','Ibiquera','BA','2023-08-17 20:05:25','2023-08-17 20:05:25'),(1981,'2912707','Ibirapitanga','BA','2023-08-17 20:05:25','2023-08-17 20:05:25'),(1982,'2912806','Ibirapua','BA','2023-08-17 20:05:25','2023-08-17 20:05:25'),(1983,'2912905','Ibirataia','BA','2023-08-17 20:05:25','2023-08-17 20:05:25'),(1984,'2913002','Ibitiara','BA','2023-08-17 20:05:25','2023-08-17 20:05:25'),(1985,'2913101','Ibitita','BA','2023-08-17 20:05:25','2023-08-17 20:05:25'),(1986,'2913200','Ibotirama','BA','2023-08-17 20:05:25','2023-08-17 20:05:25'),(1987,'2913309','Ichu','BA','2023-08-17 20:05:25','2023-08-17 20:05:25'),(1988,'2913408','Igapora','BA','2023-08-17 20:05:25','2023-08-17 20:05:25'),(1989,'2913457','Igrapiuna','BA','2023-08-17 20:05:25','2023-08-17 20:05:25'),(1990,'2913507','Iguai','BA','2023-08-17 20:05:25','2023-08-17 20:05:25'),(1991,'2913606','Ilheus','BA','2023-08-17 20:05:25','2023-08-17 20:05:25'),(1992,'2913705','Inhambupe','BA','2023-08-17 20:05:25','2023-08-17 20:05:25'),(1993,'2913804','Ipecaeta','BA','2023-08-17 20:05:25','2023-08-17 20:05:25'),(1994,'2913903','Ipiau','BA','2023-08-17 20:05:25','2023-08-17 20:05:25'),(1995,'2914000','Ipira','BA','2023-08-17 20:05:25','2023-08-17 20:05:25'),(1996,'2914109','Ipupiara','BA','2023-08-17 20:05:25','2023-08-17 20:05:25'),(1997,'2914208','Irajuba','BA','2023-08-17 20:05:25','2023-08-17 20:05:25'),(1998,'2914307','Iramaia','BA','2023-08-17 20:05:25','2023-08-17 20:05:25'),(1999,'2914406','Iraquara','BA','2023-08-17 20:05:25','2023-08-17 20:05:25'),(2000,'2914505','Irara','BA','2023-08-17 20:05:25','2023-08-17 20:05:25'),(2001,'2914604','Irecê','BA','2023-08-17 20:05:25','2023-08-17 20:05:25'),(2002,'2914653','Itabela','BA','2023-08-17 20:05:25','2023-08-17 20:05:25'),(2003,'2914703','Itaberaba','BA','2023-08-17 20:05:25','2023-08-17 20:05:25'),(2004,'2914802','Itabuna','BA','2023-08-17 20:05:25','2023-08-17 20:05:25'),(2005,'2914901','Itacare','BA','2023-08-17 20:05:25','2023-08-17 20:05:25'),(2006,'2915007','Itaete','BA','2023-08-17 20:05:25','2023-08-17 20:05:25'),(2007,'2915106','Itagi','BA','2023-08-17 20:05:25','2023-08-17 20:05:25'),(2008,'2915205','Itagiba','BA','2023-08-17 20:05:25','2023-08-17 20:05:25'),(2009,'2915304','Itagimirim','BA','2023-08-17 20:05:25','2023-08-17 20:05:25'),(2010,'2915353','Itaguaçu da Bahia','BA','2023-08-17 20:05:25','2023-08-17 20:05:25'),(2011,'2915403','Itaju do Colônia','BA','2023-08-17 20:05:25','2023-08-17 20:05:25'),(2012,'2915502','Itajuipe','BA','2023-08-17 20:05:25','2023-08-17 20:05:25'),(2013,'2915601','Itamaraju','BA','2023-08-17 20:05:25','2023-08-17 20:05:25'),(2014,'2915700','Itamari','BA','2023-08-17 20:05:25','2023-08-17 20:05:25'),(2015,'2915809','Itambe','BA','2023-08-17 20:05:25','2023-08-17 20:05:25'),(2016,'2915908','Itanagra','BA','2023-08-17 20:05:25','2023-08-17 20:05:25'),(2017,'2916005','Itanhem','BA','2023-08-17 20:05:25','2023-08-17 20:05:25'),(2018,'2916104','Itaparica','BA','2023-08-17 20:05:25','2023-08-17 20:05:25'),(2019,'2916203','Itape','BA','2023-08-17 20:05:25','2023-08-17 20:05:25'),(2020,'2916302','Itapebi','BA','2023-08-17 20:05:25','2023-08-17 20:05:25'),(2021,'2916401','Itapetinga','BA','2023-08-17 20:05:25','2023-08-17 20:05:25'),(2022,'2916500','Itapicuru','BA','2023-08-17 20:05:25','2023-08-17 20:05:25'),(2023,'2916609','Itapitanga','BA','2023-08-17 20:05:25','2023-08-17 20:05:25'),(2024,'2916708','Itaquara','BA','2023-08-17 20:05:25','2023-08-17 20:05:25'),(2025,'2916807','Itarantim','BA','2023-08-17 20:05:25','2023-08-17 20:05:25'),(2026,'2916856','Itatim','BA','2023-08-17 20:05:25','2023-08-17 20:05:25'),(2027,'2916906','Itiruçu','BA','2023-08-17 20:05:25','2023-08-17 20:05:25'),(2028,'2917003','Itiuba','BA','2023-08-17 20:05:25','2023-08-17 20:05:25'),(2029,'2917102','Itororo','BA','2023-08-17 20:05:25','2023-08-17 20:05:25'),(2030,'2917201','Ituaçu','BA','2023-08-17 20:05:25','2023-08-17 20:05:25'),(2031,'2917300','Itubera','BA','2023-08-17 20:05:25','2023-08-17 20:05:25'),(2032,'2917334','Iuiu','BA','2023-08-17 20:05:25','2023-08-17 20:05:25'),(2033,'2917359','Jaborandi','BA','2023-08-17 20:05:25','2023-08-17 20:05:25'),(2034,'2917409','Jacaraci','BA','2023-08-17 20:05:25','2023-08-17 20:05:25'),(2035,'2917508','Jacobina','BA','2023-08-17 20:05:25','2023-08-17 20:05:25'),(2036,'2917607','Jaguaquara','BA','2023-08-17 20:05:25','2023-08-17 20:05:25'),(2037,'2917706','Jaguarari','BA','2023-08-17 20:05:25','2023-08-17 20:05:25'),(2038,'2917805','Jaguaripe','BA','2023-08-17 20:05:25','2023-08-17 20:05:25'),(2039,'2917904','Jandaira','BA','2023-08-17 20:05:25','2023-08-17 20:05:25'),(2040,'2918001','Jequie','BA','2023-08-17 20:05:26','2023-08-17 20:05:26'),(2041,'2918100','Jeremoabo','BA','2023-08-17 20:05:26','2023-08-17 20:05:26'),(2042,'2918209','Jiquiriça','BA','2023-08-17 20:05:26','2023-08-17 20:05:26'),(2043,'2918308','Jitauna','BA','2023-08-17 20:05:26','2023-08-17 20:05:26'),(2044,'2918357','Joao Dourado','BA','2023-08-17 20:05:26','2023-08-17 20:05:26'),(2045,'2918407','Juazeiro','BA','2023-08-17 20:05:26','2023-08-17 20:05:26'),(2046,'2918456','Jucuruçu','BA','2023-08-17 20:05:26','2023-08-17 20:05:26'),(2047,'2918506','Jussara','BA','2023-08-17 20:05:26','2023-08-17 20:05:26'),(2048,'2918555','Jussari','BA','2023-08-17 20:05:26','2023-08-17 20:05:26'),(2049,'2918605','Jussiape','BA','2023-08-17 20:05:26','2023-08-17 20:05:26'),(2050,'2918704','Lafaiete Coutinho','BA','2023-08-17 20:05:26','2023-08-17 20:05:26'),(2051,'2918753','Lagoa Real','BA','2023-08-17 20:05:26','2023-08-17 20:05:26'),(2052,'2918803','Laje','BA','2023-08-17 20:05:26','2023-08-17 20:05:26'),(2053,'2918902','Lajedao','BA','2023-08-17 20:05:26','2023-08-17 20:05:26'),(2054,'2919009','Lajedinho','BA','2023-08-17 20:05:26','2023-08-17 20:05:26'),(2055,'2919058','Lajedo do Tabocal','BA','2023-08-17 20:05:26','2023-08-17 20:05:26'),(2056,'2919108','Lamarao','BA','2023-08-17 20:05:26','2023-08-17 20:05:26'),(2057,'2919157','Lapao','BA','2023-08-17 20:05:26','2023-08-17 20:05:26'),(2058,'2919207','Lauro de Freitas','BA','2023-08-17 20:05:26','2023-08-17 20:05:26'),(2059,'2919306','Lençois','BA','2023-08-17 20:05:26','2023-08-17 20:05:26'),(2060,'2919405','Licinio de Almeida','BA','2023-08-17 20:05:26','2023-08-17 20:05:26'),(2061,'2919504','Livramento de Nossa Senhora','BA','2023-08-17 20:05:26','2023-08-17 20:05:26'),(2062,'2919553','Luis Eduardo Magalhaes','BA','2023-08-17 20:05:26','2023-08-17 20:05:26'),(2063,'2919603','Macajuba','BA','2023-08-17 20:05:26','2023-08-17 20:05:26'),(2064,'2919702','Macarani','BA','2023-08-17 20:05:26','2023-08-17 20:05:26'),(2065,'2919801','Macaubas','BA','2023-08-17 20:05:26','2023-08-17 20:05:26'),(2066,'2919900','Macurure','BA','2023-08-17 20:05:26','2023-08-17 20:05:26'),(2067,'2919926','Madre de Deus','BA','2023-08-17 20:05:26','2023-08-17 20:05:26'),(2068,'2919959','Maetinga','BA','2023-08-17 20:05:26','2023-08-17 20:05:26'),(2069,'2920007','Maiquinique','BA','2023-08-17 20:05:26','2023-08-17 20:05:26'),(2070,'2920106','Mairi','BA','2023-08-17 20:05:27','2023-08-17 20:05:27'),(2071,'2920205','Malhada','BA','2023-08-17 20:05:27','2023-08-17 20:05:27'),(2072,'2920304','Malhada de Pedras','BA','2023-08-17 20:05:27','2023-08-17 20:05:27'),(2073,'2920403','Manoel Vitorino','BA','2023-08-17 20:05:27','2023-08-17 20:05:27'),(2074,'2920452','Mansidao','BA','2023-08-17 20:05:27','2023-08-17 20:05:27'),(2075,'2920502','Maracas','BA','2023-08-17 20:05:27','2023-08-17 20:05:27'),(2076,'2920601','Maragogipe','BA','2023-08-17 20:05:27','2023-08-17 20:05:27'),(2077,'2920700','Marau','BA','2023-08-17 20:05:27','2023-08-17 20:05:27'),(2078,'2920809','Marcionilio Souza','BA','2023-08-17 20:05:27','2023-08-17 20:05:27'),(2079,'2920908','Mascote','BA','2023-08-17 20:05:27','2023-08-17 20:05:27'),(2080,'2921005','Mata de Sao Joao','BA','2023-08-17 20:05:27','2023-08-17 20:05:27'),(2081,'2921054','Matina','BA','2023-08-17 20:05:27','2023-08-17 20:05:27'),(2082,'2921104','Medeiros Neto','BA','2023-08-17 20:05:27','2023-08-17 20:05:27'),(2083,'2921203','Miguel Calmon','BA','2023-08-17 20:05:27','2023-08-17 20:05:27'),(2084,'2921302','Milagres','BA','2023-08-17 20:05:27','2023-08-17 20:05:27'),(2085,'2921401','Mirangaba','BA','2023-08-17 20:05:27','2023-08-17 20:05:27'),(2086,'2921450','Mirante','BA','2023-08-17 20:05:27','2023-08-17 20:05:27'),(2087,'2921500','Monte Santo','BA','2023-08-17 20:05:27','2023-08-17 20:05:27'),(2088,'2921609','Morpara','BA','2023-08-17 20:05:27','2023-08-17 20:05:27'),(2089,'2921708','Morro do Chapeu','BA','2023-08-17 20:05:27','2023-08-17 20:05:27'),(2090,'2921807','Mortugaba','BA','2023-08-17 20:05:27','2023-08-17 20:05:27'),(2091,'2921906','Mucugê','BA','2023-08-17 20:05:27','2023-08-17 20:05:27'),(2092,'2922003','Mucuri','BA','2023-08-17 20:05:27','2023-08-17 20:05:27'),(2093,'2922052','Mulungu do Morro','BA','2023-08-17 20:05:27','2023-08-17 20:05:27'),(2094,'2922102','Mundo Novo','BA','2023-08-17 20:05:27','2023-08-17 20:05:27'),(2095,'2922201','Muniz Ferreira','BA','2023-08-17 20:05:27','2023-08-17 20:05:27'),(2096,'2922250','Muquem de Sao Francisco','BA','2023-08-17 20:05:27','2023-08-17 20:05:27'),(2097,'2922300','Muritiba','BA','2023-08-17 20:05:27','2023-08-17 20:05:27'),(2098,'2922409','Mutuipe','BA','2023-08-17 20:05:27','2023-08-17 20:05:27'),(2099,'2922508','Nazare','BA','2023-08-17 20:05:27','2023-08-17 20:05:27'),(2100,'2922607','Nilo Peçanha','BA','2023-08-17 20:05:27','2023-08-17 20:05:27'),(2101,'2922656','Nordestina','BA','2023-08-17 20:05:27','2023-08-17 20:05:27'),(2102,'2922706','Nova Canaa','BA','2023-08-17 20:05:27','2023-08-17 20:05:27'),(2103,'2922730','Nova Fatima','BA','2023-08-17 20:05:27','2023-08-17 20:05:27'),(2104,'2922755','Nova Ibia','BA','2023-08-17 20:05:27','2023-08-17 20:05:27'),(2105,'2922805','Nova Itarana','BA','2023-08-17 20:05:27','2023-08-17 20:05:27'),(2106,'2922854','Nova Redençao','BA','2023-08-17 20:05:27','2023-08-17 20:05:27'),(2107,'2922904','Nova Soure','BA','2023-08-17 20:05:27','2023-08-17 20:05:27'),(2108,'2923001','Nova Viçosa','BA','2023-08-17 20:05:27','2023-08-17 20:05:27'),(2109,'2923035','Novo Horizonte','BA','2023-08-17 20:05:27','2023-08-17 20:05:27'),(2110,'2923050','Novo Triunfo','BA','2023-08-17 20:05:27','2023-08-17 20:05:27'),(2111,'2923100','Olindina','BA','2023-08-17 20:05:27','2023-08-17 20:05:27'),(2112,'2923209','Oliveira dos Brejinhos','BA','2023-08-17 20:05:27','2023-08-17 20:05:27'),(2113,'2923308','Ouriçangas','BA','2023-08-17 20:05:27','2023-08-17 20:05:27'),(2114,'2923357','Ourolândia','BA','2023-08-17 20:05:27','2023-08-17 20:05:27'),(2115,'2923407','Palmas de Monte Alto','BA','2023-08-17 20:05:27','2023-08-17 20:05:27'),(2116,'2923506','Palmeiras','BA','2023-08-17 20:05:27','2023-08-17 20:05:27'),(2117,'2923605','Paramirim','BA','2023-08-17 20:05:27','2023-08-17 20:05:27'),(2118,'2923704','Paratinga','BA','2023-08-17 20:05:27','2023-08-17 20:05:27'),(2119,'2923803','Paripiranga','BA','2023-08-17 20:05:27','2023-08-17 20:05:27'),(2120,'2923902','Pau Brasil','BA','2023-08-17 20:05:27','2023-08-17 20:05:27'),(2121,'2924009','Paulo Afonso','BA','2023-08-17 20:05:27','2023-08-17 20:05:27'),(2122,'2924058','Pe de Serra','BA','2023-08-17 20:05:27','2023-08-17 20:05:27'),(2123,'2924108','Pedrao','BA','2023-08-17 20:05:27','2023-08-17 20:05:27'),(2124,'2924207','Pedro Alexandre','BA','2023-08-17 20:05:27','2023-08-17 20:05:27'),(2125,'2924306','Piata','BA','2023-08-17 20:05:27','2023-08-17 20:05:27'),(2126,'2924405','Pilao Arcado','BA','2023-08-17 20:05:27','2023-08-17 20:05:27'),(2127,'2924504','Pindai','BA','2023-08-17 20:05:27','2023-08-17 20:05:27'),(2128,'2924603','Pindobaçu','BA','2023-08-17 20:05:27','2023-08-17 20:05:27'),(2129,'2924652','Pintadas','BA','2023-08-17 20:05:27','2023-08-17 20:05:27'),(2130,'2924678','Pirai do Norte','BA','2023-08-17 20:05:27','2023-08-17 20:05:27'),(2131,'2924702','Piripa','BA','2023-08-17 20:05:27','2023-08-17 20:05:27'),(2132,'2924801','Piritiba','BA','2023-08-17 20:05:27','2023-08-17 20:05:27'),(2133,'2924900','Planaltino','BA','2023-08-17 20:05:27','2023-08-17 20:05:27'),(2134,'2925006','Planalto','BA','2023-08-17 20:05:27','2023-08-17 20:05:27'),(2135,'2925105','Poçoes','BA','2023-08-17 20:05:27','2023-08-17 20:05:27'),(2136,'2925204','Pojuca','BA','2023-08-17 20:05:27','2023-08-17 20:05:27'),(2137,'2925253','Ponto Novo','BA','2023-08-17 20:05:27','2023-08-17 20:05:27'),(2138,'2925303','Porto Seguro','BA','2023-08-17 20:05:27','2023-08-17 20:05:27'),(2139,'2925402','Potiragua','BA','2023-08-17 20:05:27','2023-08-17 20:05:27'),(2140,'2925501','Prado','BA','2023-08-17 20:05:28','2023-08-17 20:05:28'),(2141,'2925600','Presidente Dutra','BA','2023-08-17 20:05:28','2023-08-17 20:05:28'),(2142,'2925709','Presidente Jânio Quadros','BA','2023-08-17 20:05:28','2023-08-17 20:05:28'),(2143,'2925758','Presidente Tancredo Neves','BA','2023-08-17 20:05:28','2023-08-17 20:05:28'),(2144,'2925808','Queimadas','BA','2023-08-17 20:05:28','2023-08-17 20:05:28'),(2145,'2925907','Quijingue','BA','2023-08-17 20:05:28','2023-08-17 20:05:28'),(2146,'2925931','Quixabeira','BA','2023-08-17 20:05:28','2023-08-17 20:05:28'),(2147,'2925956','Rafael Jambeiro','BA','2023-08-17 20:05:28','2023-08-17 20:05:28'),(2148,'2926004','Remanso','BA','2023-08-17 20:05:28','2023-08-17 20:05:28'),(2149,'2926103','Retirolândia','BA','2023-08-17 20:05:28','2023-08-17 20:05:28'),(2150,'2926202','Riachao das Neves','BA','2023-08-17 20:05:28','2023-08-17 20:05:28'),(2151,'2926301','Riachao do Jacuipe','BA','2023-08-17 20:05:28','2023-08-17 20:05:28'),(2152,'2926400','Riacho de Santana','BA','2023-08-17 20:05:28','2023-08-17 20:05:28'),(2153,'2926509','Ribeira do Amparo','BA','2023-08-17 20:05:28','2023-08-17 20:05:28'),(2154,'2926608','Ribeira do Pombal','BA','2023-08-17 20:05:28','2023-08-17 20:05:28'),(2155,'2926657','Ribeirao do Largo','BA','2023-08-17 20:05:28','2023-08-17 20:05:28'),(2156,'2926707','Rio de Contas','BA','2023-08-17 20:05:28','2023-08-17 20:05:28'),(2157,'2926806','Rio do Antônio','BA','2023-08-17 20:05:28','2023-08-17 20:05:28'),(2158,'2926905','Rio do Pires','BA','2023-08-17 20:05:28','2023-08-17 20:05:28'),(2159,'2927002','Rio Real','BA','2023-08-17 20:05:28','2023-08-17 20:05:28'),(2160,'2927101','Rodelas','BA','2023-08-17 20:05:28','2023-08-17 20:05:28'),(2161,'2927200','Ruy Barbosa','BA','2023-08-17 20:05:28','2023-08-17 20:05:28'),(2162,'2927309','Salinas da Margarida','BA','2023-08-17 20:05:28','2023-08-17 20:05:28'),(2163,'2927408','Salvador','BA','2023-08-17 20:05:28','2023-08-17 20:05:28'),(2164,'2927507','Santa Barbara','BA','2023-08-17 20:05:28','2023-08-17 20:05:28'),(2165,'2927606','Santa Brigida','BA','2023-08-17 20:05:28','2023-08-17 20:05:28'),(2166,'2927705','Santa Cruz Cabralia','BA','2023-08-17 20:05:28','2023-08-17 20:05:28'),(2167,'2927804','Santa Cruz da Vitoria','BA','2023-08-17 20:05:28','2023-08-17 20:05:28'),(2168,'2927903','Santa Inês','BA','2023-08-17 20:05:28','2023-08-17 20:05:28'),(2169,'2928000','Santaluz','BA','2023-08-17 20:05:28','2023-08-17 20:05:28'),(2170,'2928059','Santa Luzia','BA','2023-08-17 20:05:28','2023-08-17 20:05:28'),(2171,'2928109','Santa Maria da Vitoria','BA','2023-08-17 20:05:28','2023-08-17 20:05:28'),(2172,'2928208','Santana','BA','2023-08-17 20:05:28','2023-08-17 20:05:28'),(2173,'2928307','Santanopolis','BA','2023-08-17 20:05:28','2023-08-17 20:05:28'),(2174,'2928406','Santa Rita de Cassia','BA','2023-08-17 20:05:28','2023-08-17 20:05:28'),(2175,'2928505','Santa Teresinha','BA','2023-08-17 20:05:28','2023-08-17 20:05:28'),(2176,'2928604','Santo Amaro','BA','2023-08-17 20:05:28','2023-08-17 20:05:28'),(2177,'2928703','Santo Antônio de Jesus','BA','2023-08-17 20:05:28','2023-08-17 20:05:28'),(2178,'2928802','Santo Estêvao','BA','2023-08-17 20:05:28','2023-08-17 20:05:28'),(2179,'2928901','Sao Desiderio','BA','2023-08-17 20:05:28','2023-08-17 20:05:28'),(2180,'2928950','Sao Domingos','BA','2023-08-17 20:05:28','2023-08-17 20:05:28'),(2181,'2929008','Sao Felix','BA','2023-08-17 20:05:28','2023-08-17 20:05:28'),(2182,'2929057','Sao Felix do Coribe','BA','2023-08-17 20:05:28','2023-08-17 20:05:28'),(2183,'2929107','Sao Felipe','BA','2023-08-17 20:05:28','2023-08-17 20:05:28'),(2184,'2929206','Sao Francisco do Conde','BA','2023-08-17 20:05:28','2023-08-17 20:05:28'),(2185,'2929255','Sao Gabriel','BA','2023-08-17 20:05:28','2023-08-17 20:05:28'),(2186,'2929305','Sao Gonçalo dos Campos','BA','2023-08-17 20:05:28','2023-08-17 20:05:28'),(2187,'2929354','Sao Jose da Vitoria','BA','2023-08-17 20:05:28','2023-08-17 20:05:28'),(2188,'2929370','Sao Jose do Jacuipe','BA','2023-08-17 20:05:28','2023-08-17 20:05:28'),(2189,'2929404','Sao Miguel das Matas','BA','2023-08-17 20:05:28','2023-08-17 20:05:28'),(2190,'2929503','Sao Sebastiao do Passe','BA','2023-08-17 20:05:28','2023-08-17 20:05:28'),(2191,'2929602','Sapeaçu','BA','2023-08-17 20:05:28','2023-08-17 20:05:28'),(2192,'2929701','Satiro Dias','BA','2023-08-17 20:05:28','2023-08-17 20:05:28'),(2193,'2929750','Saubara','BA','2023-08-17 20:05:28','2023-08-17 20:05:28'),(2194,'2929800','Saude','BA','2023-08-17 20:05:28','2023-08-17 20:05:28'),(2195,'2929909','Seabra','BA','2023-08-17 20:05:28','2023-08-17 20:05:28'),(2196,'2930006','Sebastiao Laranjeiras','BA','2023-08-17 20:05:28','2023-08-17 20:05:28'),(2197,'2930105','Senhor do Bonfim','BA','2023-08-17 20:05:28','2023-08-17 20:05:28'),(2198,'2930154','Serra do Ramalho','BA','2023-08-17 20:05:28','2023-08-17 20:05:28'),(2199,'2930204','Sento Se','BA','2023-08-17 20:05:28','2023-08-17 20:05:28'),(2200,'2930303','Serra Dourada','BA','2023-08-17 20:05:28','2023-08-17 20:05:28'),(2201,'2930402','Serra Preta','BA','2023-08-17 20:05:28','2023-08-17 20:05:28'),(2202,'2930501','Serrinha','BA','2023-08-17 20:05:28','2023-08-17 20:05:28'),(2203,'2930600','Serrolândia','BA','2023-08-17 20:05:28','2023-08-17 20:05:28'),(2204,'2930709','Simoes Filho','BA','2023-08-17 20:05:28','2023-08-17 20:05:28'),(2205,'2930758','Sitio do Mato','BA','2023-08-17 20:05:28','2023-08-17 20:05:28'),(2206,'2930766','Sitio do Quinto','BA','2023-08-17 20:05:28','2023-08-17 20:05:28'),(2207,'2930774','Sobradinho','BA','2023-08-17 20:05:28','2023-08-17 20:05:28'),(2208,'2930808','Souto Soares','BA','2023-08-17 20:05:28','2023-08-17 20:05:28'),(2209,'2930907','Tabocas do Brejo Velho','BA','2023-08-17 20:05:28','2023-08-17 20:05:28'),(2210,'2931004','Tanhaçu','BA','2023-08-17 20:05:28','2023-08-17 20:05:28'),(2211,'2931053','Tanque Novo','BA','2023-08-17 20:05:28','2023-08-17 20:05:28'),(2212,'2931103','Tanquinho','BA','2023-08-17 20:05:28','2023-08-17 20:05:28'),(2213,'2931202','Taperoa','BA','2023-08-17 20:05:28','2023-08-17 20:05:28'),(2214,'2931301','Tapiramuta','BA','2023-08-17 20:05:28','2023-08-17 20:05:28'),(2215,'2931350','Teixeira de Freitas','BA','2023-08-17 20:05:28','2023-08-17 20:05:28'),(2216,'2931400','Teodoro Sampaio','BA','2023-08-17 20:05:28','2023-08-17 20:05:28'),(2217,'2931509','Teofilândia','BA','2023-08-17 20:05:28','2023-08-17 20:05:28'),(2218,'2931608','Teolândia','BA','2023-08-17 20:05:28','2023-08-17 20:05:28'),(2219,'2931707','Terra Nova','BA','2023-08-17 20:05:28','2023-08-17 20:05:28'),(2220,'2931806','Tremedal','BA','2023-08-17 20:05:28','2023-08-17 20:05:28'),(2221,'2931905','Tucano','BA','2023-08-17 20:05:28','2023-08-17 20:05:28'),(2222,'2932002','Uaua','BA','2023-08-17 20:05:29','2023-08-17 20:05:29'),(2223,'2932101','Ubaira','BA','2023-08-17 20:05:29','2023-08-17 20:05:29'),(2224,'2932200','Ubaitaba','BA','2023-08-17 20:05:29','2023-08-17 20:05:29'),(2225,'2932309','Ubata','BA','2023-08-17 20:05:29','2023-08-17 20:05:29'),(2226,'2932408','Uibai','BA','2023-08-17 20:05:29','2023-08-17 20:05:29'),(2227,'2932457','Umburanas','BA','2023-08-17 20:05:29','2023-08-17 20:05:29'),(2228,'2932507','Una','BA','2023-08-17 20:05:29','2023-08-17 20:05:29'),(2229,'2932606','Urandi','BA','2023-08-17 20:05:29','2023-08-17 20:05:29'),(2230,'2932705','Uruçuca','BA','2023-08-17 20:05:29','2023-08-17 20:05:29'),(2231,'2932804','Utinga','BA','2023-08-17 20:05:29','2023-08-17 20:05:29'),(2232,'2932903','Valença','BA','2023-08-17 20:05:29','2023-08-17 20:05:29'),(2233,'2933000','Valente','BA','2023-08-17 20:05:29','2023-08-17 20:05:29'),(2234,'2933059','Varzea da Roça','BA','2023-08-17 20:05:29','2023-08-17 20:05:29'),(2235,'2933109','Varzea do Poço','BA','2023-08-17 20:05:29','2023-08-17 20:05:29'),(2236,'2933158','Varzea Nova','BA','2023-08-17 20:05:29','2023-08-17 20:05:29'),(2237,'2933174','Varzedo','BA','2023-08-17 20:05:29','2023-08-17 20:05:29'),(2238,'2933208','Vera Cruz','BA','2023-08-17 20:05:29','2023-08-17 20:05:29'),(2239,'2933257','Vereda','BA','2023-08-17 20:05:29','2023-08-17 20:05:29'),(2240,'2933307','Vitoria da Conquista','BA','2023-08-17 20:05:29','2023-08-17 20:05:29'),(2241,'2933406','Wagner','BA','2023-08-17 20:05:29','2023-08-17 20:05:29'),(2242,'2933455','Wanderley','BA','2023-08-17 20:05:29','2023-08-17 20:05:29'),(2243,'2933505','Wenceslau Guimaraes','BA','2023-08-17 20:05:29','2023-08-17 20:05:29'),(2244,'2933604','Xique-Xique','BA','2023-08-17 20:05:29','2023-08-17 20:05:29'),(2245,'3100104','Abadia dos Dourados','MG','2023-08-17 20:05:29','2023-08-17 20:05:29'),(2246,'3100203','Abaete','MG','2023-08-17 20:05:29','2023-08-17 20:05:29'),(2247,'3100302','Abre Campo','MG','2023-08-17 20:05:29','2023-08-17 20:05:29'),(2248,'3100401','Acaiaca','MG','2023-08-17 20:05:29','2023-08-17 20:05:29'),(2249,'3100500','Açucena','MG','2023-08-17 20:05:29','2023-08-17 20:05:29'),(2250,'3100609','agua Boa','MG','2023-08-17 20:05:29','2023-08-17 20:05:29'),(2251,'3100708','agua Comprida','MG','2023-08-17 20:05:29','2023-08-17 20:05:29'),(2252,'3100807','Aguanil','MG','2023-08-17 20:05:29','2023-08-17 20:05:29'),(2253,'3100906','aguas Formosas','MG','2023-08-17 20:05:29','2023-08-17 20:05:29'),(2254,'3101003','aguas Vermelhas','MG','2023-08-17 20:05:29','2023-08-17 20:05:29'),(2255,'3101102','Aimores','MG','2023-08-17 20:05:29','2023-08-17 20:05:29'),(2256,'3101201','Aiuruoca','MG','2023-08-17 20:05:29','2023-08-17 20:05:29'),(2257,'3101300','Alagoa','MG','2023-08-17 20:05:29','2023-08-17 20:05:29'),(2258,'3101409','Albertina','MG','2023-08-17 20:05:29','2023-08-17 20:05:29'),(2259,'3101508','Alem Paraiba','MG','2023-08-17 20:05:29','2023-08-17 20:05:29'),(2260,'3101607','Alfenas','MG','2023-08-17 20:05:29','2023-08-17 20:05:29'),(2261,'3101631','Alfredo Vasconcelos','MG','2023-08-17 20:05:29','2023-08-17 20:05:29'),(2262,'3101706','Almenara','MG','2023-08-17 20:05:29','2023-08-17 20:05:29'),(2263,'3101805','Alpercata','MG','2023-08-17 20:05:29','2023-08-17 20:05:29'),(2264,'3101904','Alpinopolis','MG','2023-08-17 20:05:29','2023-08-17 20:05:29'),(2265,'3102001','Alterosa','MG','2023-08-17 20:05:29','2023-08-17 20:05:29'),(2266,'3102050','Alto Caparao','MG','2023-08-17 20:05:29','2023-08-17 20:05:29'),(2267,'3102100','Alto Rio Doce','MG','2023-08-17 20:05:29','2023-08-17 20:05:29'),(2268,'3102209','Alvarenga','MG','2023-08-17 20:05:29','2023-08-17 20:05:29'),(2269,'3102308','Alvinopolis','MG','2023-08-17 20:05:29','2023-08-17 20:05:29'),(2270,'3102407','Alvorada de Minas','MG','2023-08-17 20:05:29','2023-08-17 20:05:29'),(2271,'3102506','Amparo do Serra','MG','2023-08-17 20:05:29','2023-08-17 20:05:29'),(2272,'3102605','Andradas','MG','2023-08-17 20:05:29','2023-08-17 20:05:29'),(2273,'3102704','Cachoeira de Pajeu','MG','2023-08-17 20:05:29','2023-08-17 20:05:29'),(2274,'3102803','Andrelândia','MG','2023-08-17 20:05:29','2023-08-17 20:05:29'),(2275,'3102852','Angelândia','MG','2023-08-17 20:05:29','2023-08-17 20:05:29'),(2276,'3102902','Antônio Carlos','MG','2023-08-17 20:05:29','2023-08-17 20:05:29'),(2277,'3103009','Antônio Dias','MG','2023-08-17 20:05:29','2023-08-17 20:05:29'),(2278,'3103108','Antônio Prado de Minas','MG','2023-08-17 20:05:29','2023-08-17 20:05:29'),(2279,'3103207','Araçai','MG','2023-08-17 20:05:29','2023-08-17 20:05:29'),(2280,'3103306','Aracitaba','MG','2023-08-17 20:05:29','2023-08-17 20:05:29'),(2281,'3103405','Araçuai','MG','2023-08-17 20:05:29','2023-08-17 20:05:29'),(2282,'3103504','Araguari','MG','2023-08-17 20:05:29','2023-08-17 20:05:29'),(2283,'3103603','Arantina','MG','2023-08-17 20:05:29','2023-08-17 20:05:29'),(2284,'3103702','Araponga','MG','2023-08-17 20:05:29','2023-08-17 20:05:29'),(2285,'3103751','Arapora','MG','2023-08-17 20:05:29','2023-08-17 20:05:29'),(2286,'3103801','Arapua','MG','2023-08-17 20:05:29','2023-08-17 20:05:29'),(2287,'3103900','Araujos','MG','2023-08-17 20:05:29','2023-08-17 20:05:29'),(2288,'3104007','Araxa','MG','2023-08-17 20:05:29','2023-08-17 20:05:29'),(2289,'3104106','Arceburgo','MG','2023-08-17 20:05:29','2023-08-17 20:05:29'),(2290,'3104205','Arcos','MG','2023-08-17 20:05:29','2023-08-17 20:05:29'),(2291,'3104304','Areado','MG','2023-08-17 20:05:29','2023-08-17 20:05:29'),(2292,'3104403','Argirita','MG','2023-08-17 20:05:29','2023-08-17 20:05:29'),(2293,'3104452','Aricanduva','MG','2023-08-17 20:05:29','2023-08-17 20:05:29'),(2294,'3104502','Arinos','MG','2023-08-17 20:05:29','2023-08-17 20:05:29'),(2295,'3104601','Astolfo Dutra','MG','2023-08-17 20:05:29','2023-08-17 20:05:29'),(2296,'3104700','Ataleia','MG','2023-08-17 20:05:29','2023-08-17 20:05:29'),(2297,'3104809','Augusto de Lima','MG','2023-08-17 20:05:29','2023-08-17 20:05:29'),(2298,'3104908','Baependi','MG','2023-08-17 20:05:30','2023-08-17 20:05:30'),(2299,'3105004','Baldim','MG','2023-08-17 20:05:30','2023-08-17 20:05:30'),(2300,'3105103','Bambui','MG','2023-08-17 20:05:30','2023-08-17 20:05:30'),(2301,'3105202','Bandeira','MG','2023-08-17 20:05:30','2023-08-17 20:05:30'),(2302,'3105301','Bandeira do Sul','MG','2023-08-17 20:05:30','2023-08-17 20:05:30'),(2303,'3105400','Barao de Cocais','MG','2023-08-17 20:05:30','2023-08-17 20:05:30'),(2304,'3105509','Barao de Monte Alto','MG','2023-08-17 20:05:30','2023-08-17 20:05:30'),(2305,'3105608','Barbacena','MG','2023-08-17 20:05:30','2023-08-17 20:05:30'),(2306,'3105707','Barra Longa','MG','2023-08-17 20:05:30','2023-08-17 20:05:30'),(2307,'3105905','Barroso','MG','2023-08-17 20:05:30','2023-08-17 20:05:30'),(2308,'3106002','Bela Vista de Minas','MG','2023-08-17 20:05:30','2023-08-17 20:05:30'),(2309,'3106101','Belmiro Braga','MG','2023-08-17 20:05:30','2023-08-17 20:05:30'),(2310,'3106200','Belo Horizonte','MG','2023-08-17 20:05:30','2023-08-17 20:05:30'),(2311,'3106309','Belo Oriente','MG','2023-08-17 20:05:30','2023-08-17 20:05:30'),(2312,'3106408','Belo Vale','MG','2023-08-17 20:05:30','2023-08-17 20:05:30'),(2313,'3106507','Berilo','MG','2023-08-17 20:05:30','2023-08-17 20:05:30'),(2314,'3106606','Bertopolis','MG','2023-08-17 20:05:30','2023-08-17 20:05:30'),(2315,'3106655','Berizal','MG','2023-08-17 20:05:30','2023-08-17 20:05:30'),(2316,'3106705','Betim','MG','2023-08-17 20:05:30','2023-08-17 20:05:30'),(2317,'3106804','Bias Fortes','MG','2023-08-17 20:05:30','2023-08-17 20:05:30'),(2318,'3106903','Bicas','MG','2023-08-17 20:05:30','2023-08-17 20:05:30'),(2319,'3107000','Biquinhas','MG','2023-08-17 20:05:30','2023-08-17 20:05:30'),(2320,'3107109','Boa Esperança','MG','2023-08-17 20:05:30','2023-08-17 20:05:30'),(2321,'3107208','Bocaina de Minas','MG','2023-08-17 20:05:30','2023-08-17 20:05:30'),(2322,'3107307','Bocaiuva','MG','2023-08-17 20:05:30','2023-08-17 20:05:30'),(2323,'3107406','Bom Despacho','MG','2023-08-17 20:05:30','2023-08-17 20:05:30'),(2324,'3107505','Bom Jardim de Minas','MG','2023-08-17 20:05:30','2023-08-17 20:05:30'),(2325,'3107604','Bom Jesus da Penha','MG','2023-08-17 20:05:30','2023-08-17 20:05:30'),(2326,'3107703','Bom Jesus do Amparo','MG','2023-08-17 20:05:30','2023-08-17 20:05:30'),(2327,'3107802','Bom Jesus do Galho','MG','2023-08-17 20:05:30','2023-08-17 20:05:30'),(2328,'3107901','Bom Repouso','MG','2023-08-17 20:05:30','2023-08-17 20:05:30'),(2329,'3108008','Bom Sucesso','MG','2023-08-17 20:05:30','2023-08-17 20:05:30'),(2330,'3108107','Bonfim','MG','2023-08-17 20:05:30','2023-08-17 20:05:30'),(2331,'3108206','Bonfinopolis de Minas','MG','2023-08-17 20:05:30','2023-08-17 20:05:30'),(2332,'3108255','Bonito de Minas','MG','2023-08-17 20:05:30','2023-08-17 20:05:30'),(2333,'3108305','Borda da Mata','MG','2023-08-17 20:05:30','2023-08-17 20:05:30'),(2334,'3108404','Botelhos','MG','2023-08-17 20:05:30','2023-08-17 20:05:30'),(2335,'3108503','Botumirim','MG','2023-08-17 20:05:30','2023-08-17 20:05:30'),(2336,'3108552','Brasilândia de Minas','MG','2023-08-17 20:05:30','2023-08-17 20:05:30'),(2337,'3108602','Brasilia de Minas','MG','2023-08-17 20:05:30','2023-08-17 20:05:30'),(2338,'3108701','Bras Pires','MG','2023-08-17 20:05:30','2023-08-17 20:05:30'),(2339,'3108800','Braunas','MG','2023-08-17 20:05:30','2023-08-17 20:05:30'),(2340,'3108909','Brazopolis','MG','2023-08-17 20:05:30','2023-08-17 20:05:30'),(2341,'3109006','Brumadinho','MG','2023-08-17 20:05:30','2023-08-17 20:05:30'),(2342,'3109105','Bueno Brandao','MG','2023-08-17 20:05:30','2023-08-17 20:05:30'),(2343,'3109204','Buenopolis','MG','2023-08-17 20:05:30','2023-08-17 20:05:30'),(2344,'3109253','Bugre','MG','2023-08-17 20:05:30','2023-08-17 20:05:30'),(2345,'3109303','Buritis','MG','2023-08-17 20:05:30','2023-08-17 20:05:30'),(2346,'3109402','Buritizeiro','MG','2023-08-17 20:05:30','2023-08-17 20:05:30'),(2347,'3109451','Cabeceira Grande','MG','2023-08-17 20:05:30','2023-08-17 20:05:30'),(2348,'3109501','Cabo Verde','MG','2023-08-17 20:05:30','2023-08-17 20:05:30'),(2349,'3109600','Cachoeira da Prata','MG','2023-08-17 20:05:30','2023-08-17 20:05:30'),(2350,'3109709','Cachoeira de Minas','MG','2023-08-17 20:05:30','2023-08-17 20:05:30'),(2351,'3109808','Cachoeira Dourada','MG','2023-08-17 20:05:30','2023-08-17 20:05:30'),(2352,'3109907','Caetanopolis','MG','2023-08-17 20:05:30','2023-08-17 20:05:30'),(2353,'3110004','Caete','MG','2023-08-17 20:05:30','2023-08-17 20:05:30'),(2354,'3110103','Caiana','MG','2023-08-17 20:05:30','2023-08-17 20:05:30'),(2355,'3110202','Cajuri','MG','2023-08-17 20:05:30','2023-08-17 20:05:30'),(2356,'3110301','Caldas','MG','2023-08-17 20:05:30','2023-08-17 20:05:30'),(2357,'3110400','Camacho','MG','2023-08-17 20:05:30','2023-08-17 20:05:30'),(2358,'3110509','Camanducaia','MG','2023-08-17 20:05:30','2023-08-17 20:05:30'),(2359,'3110608','Cambui','MG','2023-08-17 20:05:30','2023-08-17 20:05:30'),(2360,'3110707','Cambuquira','MG','2023-08-17 20:05:30','2023-08-17 20:05:30'),(2361,'3110806','Campanario','MG','2023-08-17 20:05:30','2023-08-17 20:05:30'),(2362,'3110905','Campanha','MG','2023-08-17 20:05:30','2023-08-17 20:05:30'),(2363,'3111002','Campestre','MG','2023-08-17 20:05:30','2023-08-17 20:05:30'),(2364,'3111101','Campina Verde','MG','2023-08-17 20:05:30','2023-08-17 20:05:30'),(2365,'3111150','Campo Azul','MG','2023-08-17 20:05:30','2023-08-17 20:05:30'),(2366,'3111200','Campo Belo','MG','2023-08-17 20:05:30','2023-08-17 20:05:30'),(2367,'3111309','Campo do Meio','MG','2023-08-17 20:05:30','2023-08-17 20:05:30'),(2368,'3111408','Campo Florido','MG','2023-08-17 20:05:30','2023-08-17 20:05:30'),(2369,'3111507','Campos Altos','MG','2023-08-17 20:05:30','2023-08-17 20:05:30'),(2370,'3111606','Campos Gerais','MG','2023-08-17 20:05:30','2023-08-17 20:05:30'),(2371,'3111705','Canaa','MG','2023-08-17 20:05:30','2023-08-17 20:05:30'),(2372,'3111804','Canapolis','MG','2023-08-17 20:05:30','2023-08-17 20:05:30'),(2373,'3111903','Cana Verde','MG','2023-08-17 20:05:30','2023-08-17 20:05:30'),(2374,'3112000','Candeias','MG','2023-08-17 20:05:30','2023-08-17 20:05:30'),(2375,'3112059','Cantagalo','MG','2023-08-17 20:05:30','2023-08-17 20:05:30'),(2376,'3112109','Caparao','MG','2023-08-17 20:05:30','2023-08-17 20:05:30'),(2377,'3112208','Capela Nova','MG','2023-08-17 20:05:30','2023-08-17 20:05:30'),(2378,'3112307','Capelinha','MG','2023-08-17 20:05:30','2023-08-17 20:05:30'),(2379,'3112406','Capetinga','MG','2023-08-17 20:05:30','2023-08-17 20:05:30'),(2380,'3112505','Capim Branco','MG','2023-08-17 20:05:30','2023-08-17 20:05:30'),(2381,'3112604','Capinopolis','MG','2023-08-17 20:05:30','2023-08-17 20:05:30'),(2382,'3112653','Capitao Andrade','MG','2023-08-17 20:05:30','2023-08-17 20:05:30'),(2383,'3112703','Capitao Eneas','MG','2023-08-17 20:05:30','2023-08-17 20:05:30'),(2384,'3112802','Capitolio','MG','2023-08-17 20:05:30','2023-08-17 20:05:30'),(2385,'3112901','Caputira','MG','2023-08-17 20:05:30','2023-08-17 20:05:30'),(2386,'3113008','Carai','MG','2023-08-17 20:05:30','2023-08-17 20:05:30'),(2387,'3113107','Caranaiba','MG','2023-08-17 20:05:30','2023-08-17 20:05:30'),(2388,'3113206','Carandai','MG','2023-08-17 20:05:30','2023-08-17 20:05:30'),(2389,'3113305','Carangola','MG','2023-08-17 20:05:30','2023-08-17 20:05:30'),(2390,'3113404','Caratinga','MG','2023-08-17 20:05:30','2023-08-17 20:05:30'),(2391,'3113503','Carbonita','MG','2023-08-17 20:05:30','2023-08-17 20:05:30'),(2392,'3113602','Careaçu','MG','2023-08-17 20:05:30','2023-08-17 20:05:30'),(2393,'3113701','Carlos Chagas','MG','2023-08-17 20:05:30','2023-08-17 20:05:30'),(2394,'3113800','Carmesia','MG','2023-08-17 20:05:30','2023-08-17 20:05:30'),(2395,'3113909','Carmo da Cachoeira','MG','2023-08-17 20:05:30','2023-08-17 20:05:30'),(2396,'3114006','Carmo da Mata','MG','2023-08-17 20:05:30','2023-08-17 20:05:30'),(2397,'3114105','Carmo de Minas','MG','2023-08-17 20:05:30','2023-08-17 20:05:30'),(2398,'3114204','Carmo do Cajuru','MG','2023-08-17 20:05:30','2023-08-17 20:05:30'),(2399,'3114303','Carmo do Paranaiba','MG','2023-08-17 20:05:30','2023-08-17 20:05:30'),(2400,'3114402','Carmo do Rio Claro','MG','2023-08-17 20:05:30','2023-08-17 20:05:30'),(2401,'3114501','Carmopolis de Minas','MG','2023-08-17 20:05:30','2023-08-17 20:05:30'),(2402,'3114550','Carneirinho','MG','2023-08-17 20:05:30','2023-08-17 20:05:30'),(2403,'3114600','Carrancas','MG','2023-08-17 20:05:30','2023-08-17 20:05:30'),(2404,'3114709','Carvalhopolis','MG','2023-08-17 20:05:30','2023-08-17 20:05:30'),(2405,'3114808','Carvalhos','MG','2023-08-17 20:05:30','2023-08-17 20:05:30'),(2406,'3114907','Casa Grande','MG','2023-08-17 20:05:30','2023-08-17 20:05:30'),(2407,'3115003','Cascalho Rico','MG','2023-08-17 20:05:30','2023-08-17 20:05:30'),(2408,'3115102','Cassia','MG','2023-08-17 20:05:30','2023-08-17 20:05:30'),(2409,'3115201','Conceiçao da Barra de Minas','MG','2023-08-17 20:05:30','2023-08-17 20:05:30'),(2410,'3115300','Cataguases','MG','2023-08-17 20:05:30','2023-08-17 20:05:30'),(2411,'3115359','Catas Altas','MG','2023-08-17 20:05:30','2023-08-17 20:05:30'),(2412,'3115409','Catas Altas da Noruega','MG','2023-08-17 20:05:30','2023-08-17 20:05:30'),(2413,'3115458','Catuji','MG','2023-08-17 20:05:30','2023-08-17 20:05:30'),(2414,'3115474','Catuti','MG','2023-08-17 20:05:30','2023-08-17 20:05:30'),(2415,'3115508','Caxambu','MG','2023-08-17 20:05:30','2023-08-17 20:05:30'),(2416,'3115607','Cedro do Abaete','MG','2023-08-17 20:05:30','2023-08-17 20:05:30'),(2417,'3115706','Central de Minas','MG','2023-08-17 20:05:30','2023-08-17 20:05:30'),(2418,'3115805','Centralina','MG','2023-08-17 20:05:30','2023-08-17 20:05:30'),(2419,'3115904','Chacara','MG','2023-08-17 20:05:30','2023-08-17 20:05:30'),(2420,'3116001','Chale','MG','2023-08-17 20:05:30','2023-08-17 20:05:30'),(2421,'3116100','Chapada do Norte','MG','2023-08-17 20:05:30','2023-08-17 20:05:30'),(2422,'3116159','Chapada Gaucha','MG','2023-08-17 20:05:30','2023-08-17 20:05:30'),(2423,'3116209','Chiador','MG','2023-08-17 20:05:30','2023-08-17 20:05:30'),(2424,'3116308','Cipotânea','MG','2023-08-17 20:05:30','2023-08-17 20:05:30'),(2425,'3116407','Claraval','MG','2023-08-17 20:05:30','2023-08-17 20:05:30'),(2426,'3116506','Claro dos Poçoes','MG','2023-08-17 20:05:30','2023-08-17 20:05:30'),(2427,'3116605','Claudio','MG','2023-08-17 20:05:30','2023-08-17 20:05:30'),(2428,'3116704','Coimbra','MG','2023-08-17 20:05:30','2023-08-17 20:05:30'),(2429,'3116803','Coluna','MG','2023-08-17 20:05:30','2023-08-17 20:05:30'),(2430,'3116902','Comendador Gomes','MG','2023-08-17 20:05:30','2023-08-17 20:05:30'),(2431,'3117009','Comercinho','MG','2023-08-17 20:05:30','2023-08-17 20:05:30'),(2432,'3117108','Conceiçao da Aparecida','MG','2023-08-17 20:05:30','2023-08-17 20:05:30'),(2433,'3117207','Conceiçao das Pedras','MG','2023-08-17 20:05:30','2023-08-17 20:05:30'),(2434,'3117306','Conceiçao das Alagoas','MG','2023-08-17 20:05:30','2023-08-17 20:05:30'),(2435,'3117405','Conceiçao de Ipanema','MG','2023-08-17 20:05:30','2023-08-17 20:05:30'),(2436,'3117504','Conceiçao do Mato Dentro','MG','2023-08-17 20:05:30','2023-08-17 20:05:30'),(2437,'3117603','Conceiçao do Para','MG','2023-08-17 20:05:31','2023-08-17 20:05:31'),(2438,'3117702','Conceiçao do Rio Verde','MG','2023-08-17 20:05:31','2023-08-17 20:05:31'),(2439,'3117801','Conceiçao dos Ouros','MG','2023-08-17 20:05:31','2023-08-17 20:05:31'),(2440,'3117836','Cônego Marinho','MG','2023-08-17 20:05:31','2023-08-17 20:05:31'),(2441,'3117876','Confins','MG','2023-08-17 20:05:31','2023-08-17 20:05:31'),(2442,'3117900','Congonhal','MG','2023-08-17 20:05:31','2023-08-17 20:05:31'),(2443,'3118007','Congonhas','MG','2023-08-17 20:05:31','2023-08-17 20:05:31'),(2444,'3118106','Congonhas do Norte','MG','2023-08-17 20:05:31','2023-08-17 20:05:31'),(2445,'3118205','Conquista','MG','2023-08-17 20:05:31','2023-08-17 20:05:31'),(2446,'3118304','Conselheiro Lafaiete','MG','2023-08-17 20:05:31','2023-08-17 20:05:31'),(2447,'3118403','Conselheiro Pena','MG','2023-08-17 20:05:31','2023-08-17 20:05:31'),(2448,'3118502','Consolaçao','MG','2023-08-17 20:05:31','2023-08-17 20:05:31'),(2449,'3118601','Contagem','MG','2023-08-17 20:05:31','2023-08-17 20:05:31'),(2450,'3118700','Coqueiral','MG','2023-08-17 20:05:31','2023-08-17 20:05:31'),(2451,'3118809','Coraçao de Jesus','MG','2023-08-17 20:05:31','2023-08-17 20:05:31'),(2452,'3118908','Cordisburgo','MG','2023-08-17 20:05:31','2023-08-17 20:05:31'),(2453,'3119005','Cordislândia','MG','2023-08-17 20:05:31','2023-08-17 20:05:31'),(2454,'3119104','Corinto','MG','2023-08-17 20:05:31','2023-08-17 20:05:31'),(2455,'3119203','Coroaci','MG','2023-08-17 20:05:31','2023-08-17 20:05:31'),(2456,'3119302','Coromandel','MG','2023-08-17 20:05:31','2023-08-17 20:05:31'),(2457,'3119401','Coronel Fabriciano','MG','2023-08-17 20:05:31','2023-08-17 20:05:31'),(2458,'3119500','Coronel Murta','MG','2023-08-17 20:05:31','2023-08-17 20:05:31'),(2459,'3119609','Coronel Pacheco','MG','2023-08-17 20:05:31','2023-08-17 20:05:31'),(2460,'3119708','Coronel Xavier Chaves','MG','2023-08-17 20:05:31','2023-08-17 20:05:31'),(2461,'3119807','Corrego Danta','MG','2023-08-17 20:05:31','2023-08-17 20:05:31'),(2462,'3119906','Corrego do Bom Jesus','MG','2023-08-17 20:05:31','2023-08-17 20:05:31'),(2463,'3119955','Corrego Fundo','MG','2023-08-17 20:05:31','2023-08-17 20:05:31'),(2464,'3120003','Corrego Novo','MG','2023-08-17 20:05:31','2023-08-17 20:05:31'),(2465,'3120102','Couto de Magalhaes de Minas','MG','2023-08-17 20:05:31','2023-08-17 20:05:31'),(2466,'3120151','Crisolita','MG','2023-08-17 20:05:31','2023-08-17 20:05:31'),(2467,'3120201','Cristais','MG','2023-08-17 20:05:31','2023-08-17 20:05:31'),(2468,'3120300','Cristalia','MG','2023-08-17 20:05:31','2023-08-17 20:05:31'),(2469,'3120409','Cristiano Otoni','MG','2023-08-17 20:05:31','2023-08-17 20:05:31'),(2470,'3120508','Cristina','MG','2023-08-17 20:05:31','2023-08-17 20:05:31'),(2471,'3120607','Crucilândia','MG','2023-08-17 20:05:31','2023-08-17 20:05:31'),(2472,'3120706','Cruzeiro da Fortaleza','MG','2023-08-17 20:05:31','2023-08-17 20:05:31'),(2473,'3120805','Cruzilia','MG','2023-08-17 20:05:31','2023-08-17 20:05:31'),(2474,'3120839','Cuparaque','MG','2023-08-17 20:05:31','2023-08-17 20:05:31'),(2475,'3120870','Curral de Dentro','MG','2023-08-17 20:05:31','2023-08-17 20:05:31'),(2476,'3120904','Curvelo','MG','2023-08-17 20:05:31','2023-08-17 20:05:31'),(2477,'3121001','Datas','MG','2023-08-17 20:05:31','2023-08-17 20:05:31'),(2478,'3121100','Delfim Moreira','MG','2023-08-17 20:05:31','2023-08-17 20:05:31'),(2479,'3121209','Delfinopolis','MG','2023-08-17 20:05:31','2023-08-17 20:05:31'),(2480,'3121258','Delta','MG','2023-08-17 20:05:31','2023-08-17 20:05:31'),(2481,'3121308','Descoberto','MG','2023-08-17 20:05:31','2023-08-17 20:05:31'),(2482,'3121407','Desterro de Entre Rios','MG','2023-08-17 20:05:31','2023-08-17 20:05:31'),(2483,'3121506','Desterro do Melo','MG','2023-08-17 20:05:31','2023-08-17 20:05:31'),(2484,'3121605','Diamantina','MG','2023-08-17 20:05:31','2023-08-17 20:05:31'),(2485,'3121704','Diogo de Vasconcelos','MG','2023-08-17 20:05:31','2023-08-17 20:05:31'),(2486,'3121803','Dionisio','MG','2023-08-17 20:05:31','2023-08-17 20:05:31'),(2487,'3121902','Divinesia','MG','2023-08-17 20:05:31','2023-08-17 20:05:31'),(2488,'3122009','Divino','MG','2023-08-17 20:05:31','2023-08-17 20:05:31'),(2489,'3122108','Divino das Laranjeiras','MG','2023-08-17 20:05:31','2023-08-17 20:05:31'),(2490,'3122207','Divinolândia de Minas','MG','2023-08-17 20:05:31','2023-08-17 20:05:31'),(2491,'3122306','Divinopolis','MG','2023-08-17 20:05:31','2023-08-17 20:05:31'),(2492,'3122355','Divisa Alegre','MG','2023-08-17 20:05:31','2023-08-17 20:05:31'),(2493,'3122405','Divisa Nova','MG','2023-08-17 20:05:31','2023-08-17 20:05:31'),(2494,'3122454','Divisopolis','MG','2023-08-17 20:05:31','2023-08-17 20:05:31'),(2495,'3122470','Dom Bosco','MG','2023-08-17 20:05:31','2023-08-17 20:05:31'),(2496,'3122504','Dom Cavati','MG','2023-08-17 20:05:31','2023-08-17 20:05:31'),(2497,'3122603','Dom Joaquim','MG','2023-08-17 20:05:31','2023-08-17 20:05:31'),(2498,'3122702','Dom Silverio','MG','2023-08-17 20:05:31','2023-08-17 20:05:31'),(2499,'3122801','Dom Viçoso','MG','2023-08-17 20:05:31','2023-08-17 20:05:31'),(2500,'3122900','Dona Eusebia','MG','2023-08-17 20:05:31','2023-08-17 20:05:31'),(2501,'3123007','Dores de Campos','MG','2023-08-17 20:05:31','2023-08-17 20:05:31'),(2502,'3123106','Dores de Guanhaes','MG','2023-08-17 20:05:31','2023-08-17 20:05:31'),(2503,'3123205','Dores do Indaia','MG','2023-08-17 20:05:31','2023-08-17 20:05:31'),(2504,'3123304','Dores do Turvo','MG','2023-08-17 20:05:31','2023-08-17 20:05:31'),(2505,'3123403','Doresopolis','MG','2023-08-17 20:05:31','2023-08-17 20:05:31'),(2506,'3123502','Douradoquara','MG','2023-08-17 20:05:31','2023-08-17 20:05:31'),(2507,'3123528','Durande','MG','2023-08-17 20:05:31','2023-08-17 20:05:31'),(2508,'3123601','Eloi Mendes','MG','2023-08-17 20:05:31','2023-08-17 20:05:31'),(2509,'3123700','Engenheiro Caldas','MG','2023-08-17 20:05:31','2023-08-17 20:05:31'),(2510,'3123809','Engenheiro Navarro','MG','2023-08-17 20:05:31','2023-08-17 20:05:31'),(2511,'3123858','Entre Folhas','MG','2023-08-17 20:05:31','2023-08-17 20:05:31'),(2512,'3123908','Entre Rios de Minas','MG','2023-08-17 20:05:31','2023-08-17 20:05:31'),(2513,'3124005','Ervalia','MG','2023-08-17 20:05:31','2023-08-17 20:05:31'),(2514,'3124104','Esmeraldas','MG','2023-08-17 20:05:31','2023-08-17 20:05:31'),(2515,'3124203','Espera Feliz','MG','2023-08-17 20:05:31','2023-08-17 20:05:31'),(2516,'3124302','Espinosa','MG','2023-08-17 20:05:31','2023-08-17 20:05:31'),(2517,'3124401','Espirito Santo do Dourado','MG','2023-08-17 20:05:31','2023-08-17 20:05:31'),(2518,'3124500','Estiva','MG','2023-08-17 20:05:31','2023-08-17 20:05:31'),(2519,'3124609','Estrela Dalva','MG','2023-08-17 20:05:31','2023-08-17 20:05:31'),(2520,'3124708','Estrela do Indaia','MG','2023-08-17 20:05:31','2023-08-17 20:05:31'),(2521,'3124807','Estrela do Sul','MG','2023-08-17 20:05:31','2023-08-17 20:05:31'),(2522,'3124906','Eugenopolis','MG','2023-08-17 20:05:31','2023-08-17 20:05:31'),(2523,'3125002','Ewbank da Câmara','MG','2023-08-17 20:05:31','2023-08-17 20:05:31'),(2524,'3125101','Extrema','MG','2023-08-17 20:05:31','2023-08-17 20:05:31'),(2525,'3125200','Fama','MG','2023-08-17 20:05:31','2023-08-17 20:05:31'),(2526,'3125309','Faria Lemos','MG','2023-08-17 20:05:31','2023-08-17 20:05:31'),(2527,'3125408','Felicio dos Santos','MG','2023-08-17 20:05:31','2023-08-17 20:05:31'),(2528,'3125507','Sao Gonçalo do Rio Preto','MG','2023-08-17 20:05:31','2023-08-17 20:05:31'),(2529,'3125606','Felisburgo','MG','2023-08-17 20:05:31','2023-08-17 20:05:31'),(2530,'3125705','Felixlândia','MG','2023-08-17 20:05:31','2023-08-17 20:05:31'),(2531,'3125804','Fernandes Tourinho','MG','2023-08-17 20:05:31','2023-08-17 20:05:31'),(2532,'3125903','Ferros','MG','2023-08-17 20:05:31','2023-08-17 20:05:31'),(2533,'3125952','Fervedouro','MG','2023-08-17 20:05:31','2023-08-17 20:05:31'),(2534,'3126000','Florestal','MG','2023-08-17 20:05:31','2023-08-17 20:05:31'),(2535,'3126109','Formiga','MG','2023-08-17 20:05:31','2023-08-17 20:05:31'),(2536,'3126208','Formoso','MG','2023-08-17 20:05:31','2023-08-17 20:05:31'),(2537,'3126307','Fortaleza de Minas','MG','2023-08-17 20:05:31','2023-08-17 20:05:31'),(2538,'3126406','Fortuna de Minas','MG','2023-08-17 20:05:31','2023-08-17 20:05:31'),(2539,'3126505','Francisco Badaro','MG','2023-08-17 20:05:31','2023-08-17 20:05:31'),(2540,'3126604','Francisco Dumont','MG','2023-08-17 20:05:31','2023-08-17 20:05:31'),(2541,'3126703','Francisco Sa','MG','2023-08-17 20:05:31','2023-08-17 20:05:31'),(2542,'3126752','Franciscopolis','MG','2023-08-17 20:05:31','2023-08-17 20:05:31'),(2543,'3126802','Frei Gaspar','MG','2023-08-17 20:05:31','2023-08-17 20:05:31'),(2544,'3126901','Frei Inocêncio','MG','2023-08-17 20:05:31','2023-08-17 20:05:31'),(2545,'3126950','Frei Lagonegro','MG','2023-08-17 20:05:31','2023-08-17 20:05:31'),(2546,'3127008','Fronteira','MG','2023-08-17 20:05:31','2023-08-17 20:05:31'),(2547,'3127057','Fronteira dos Vales','MG','2023-08-17 20:05:31','2023-08-17 20:05:31'),(2548,'3127073','Fruta de Leite','MG','2023-08-17 20:05:31','2023-08-17 20:05:31'),(2549,'3127107','Frutal','MG','2023-08-17 20:05:31','2023-08-17 20:05:31'),(2550,'3127206','Funilândia','MG','2023-08-17 20:05:31','2023-08-17 20:05:31'),(2551,'3127305','Galileia','MG','2023-08-17 20:05:31','2023-08-17 20:05:31'),(2552,'3127339','Gameleiras','MG','2023-08-17 20:05:31','2023-08-17 20:05:31'),(2553,'3127354','Glaucilândia','MG','2023-08-17 20:05:31','2023-08-17 20:05:31'),(2554,'3127370','Goiabeira','MG','2023-08-17 20:05:31','2023-08-17 20:05:31'),(2555,'3127388','Goiana','MG','2023-08-17 20:05:31','2023-08-17 20:05:31'),(2556,'3127404','Gonçalves','MG','2023-08-17 20:05:31','2023-08-17 20:05:31'),(2557,'3127503','Gonzaga','MG','2023-08-17 20:05:31','2023-08-17 20:05:31'),(2558,'3127602','Gouveia','MG','2023-08-17 20:05:31','2023-08-17 20:05:31'),(2559,'3127701','Governador Valadares','MG','2023-08-17 20:05:31','2023-08-17 20:05:31'),(2560,'3127800','Grao Mogol','MG','2023-08-17 20:05:31','2023-08-17 20:05:31'),(2561,'3127909','Grupiara','MG','2023-08-17 20:05:31','2023-08-17 20:05:31'),(2562,'3128006','Guanhaes','MG','2023-08-17 20:05:31','2023-08-17 20:05:31'),(2563,'3128105','Guape','MG','2023-08-17 20:05:31','2023-08-17 20:05:31'),(2564,'3128204','Guaraciaba','MG','2023-08-17 20:05:31','2023-08-17 20:05:31'),(2565,'3128253','Guaraciama','MG','2023-08-17 20:05:31','2023-08-17 20:05:31'),(2566,'3128303','Guaranesia','MG','2023-08-17 20:05:31','2023-08-17 20:05:31'),(2567,'3128402','Guarani','MG','2023-08-17 20:05:31','2023-08-17 20:05:31'),(2568,'3128501','Guarara','MG','2023-08-17 20:05:31','2023-08-17 20:05:31'),(2569,'3128600','Guarda-Mor','MG','2023-08-17 20:05:31','2023-08-17 20:05:31'),(2570,'3128709','Guaxupe','MG','2023-08-17 20:05:31','2023-08-17 20:05:31'),(2571,'3128808','Guidoval','MG','2023-08-17 20:05:31','2023-08-17 20:05:31'),(2572,'3128907','Guimarânia','MG','2023-08-17 20:05:31','2023-08-17 20:05:31'),(2573,'3129004','Guiricema','MG','2023-08-17 20:05:31','2023-08-17 20:05:31'),(2574,'3129103','Gurinhata','MG','2023-08-17 20:05:31','2023-08-17 20:05:31'),(2575,'3129202','Heliodora','MG','2023-08-17 20:05:31','2023-08-17 20:05:31'),(2576,'3129301','Iapu','MG','2023-08-17 20:05:31','2023-08-17 20:05:31'),(2577,'3129400','Ibertioga','MG','2023-08-17 20:05:31','2023-08-17 20:05:31'),(2578,'3129509','Ibia','MG','2023-08-17 20:05:31','2023-08-17 20:05:31'),(2579,'3129608','Ibiai','MG','2023-08-17 20:05:31','2023-08-17 20:05:31'),(2580,'3129657','Ibiracatu','MG','2023-08-17 20:05:31','2023-08-17 20:05:31'),(2581,'3129707','Ibiraci','MG','2023-08-17 20:05:31','2023-08-17 20:05:31'),(2582,'3129806','Ibirite','MG','2023-08-17 20:05:31','2023-08-17 20:05:31'),(2583,'3129905','Ibitiura de Minas','MG','2023-08-17 20:05:31','2023-08-17 20:05:31'),(2584,'3130002','Ibituruna','MG','2023-08-17 20:05:31','2023-08-17 20:05:31'),(2585,'3130051','Icarai de Minas','MG','2023-08-17 20:05:31','2023-08-17 20:05:31'),(2586,'3130101','Igarape','MG','2023-08-17 20:05:31','2023-08-17 20:05:31'),(2587,'3130200','Igaratinga','MG','2023-08-17 20:05:31','2023-08-17 20:05:31'),(2588,'3130309','Iguatama','MG','2023-08-17 20:05:31','2023-08-17 20:05:31'),(2589,'3130408','Ijaci','MG','2023-08-17 20:05:31','2023-08-17 20:05:31'),(2590,'3130507','Ilicinea','MG','2023-08-17 20:05:31','2023-08-17 20:05:31'),(2591,'3130556','Imbe de Minas','MG','2023-08-17 20:05:31','2023-08-17 20:05:31'),(2592,'3130606','Inconfidentes','MG','2023-08-17 20:05:31','2023-08-17 20:05:31'),(2593,'3130655','Indaiabira','MG','2023-08-17 20:05:31','2023-08-17 20:05:31'),(2594,'3130705','Indianopolis','MG','2023-08-17 20:05:31','2023-08-17 20:05:31'),(2595,'3130804','Ingai','MG','2023-08-17 20:05:31','2023-08-17 20:05:31'),(2596,'3130903','Inhapim','MG','2023-08-17 20:05:31','2023-08-17 20:05:31'),(2597,'3131000','Inhauma','MG','2023-08-17 20:05:31','2023-08-17 20:05:31'),(2598,'3131109','Inimutaba','MG','2023-08-17 20:05:31','2023-08-17 20:05:31'),(2599,'3131158','Ipaba','MG','2023-08-17 20:05:31','2023-08-17 20:05:31'),(2600,'3131208','Ipanema','MG','2023-08-17 20:05:31','2023-08-17 20:05:31'),(2601,'3131307','Ipatinga','MG','2023-08-17 20:05:31','2023-08-17 20:05:31'),(2602,'3131406','Ipiaçu','MG','2023-08-17 20:05:32','2023-08-17 20:05:32'),(2603,'3131505','Ipuiuna','MG','2023-08-17 20:05:32','2023-08-17 20:05:32'),(2604,'3131604','Irai de Minas','MG','2023-08-17 20:05:32','2023-08-17 20:05:32'),(2605,'3131703','Itabira','MG','2023-08-17 20:05:32','2023-08-17 20:05:32'),(2606,'3131802','Itabirinha','MG','2023-08-17 20:05:32','2023-08-17 20:05:32'),(2607,'3131901','Itabirito','MG','2023-08-17 20:05:32','2023-08-17 20:05:32'),(2608,'3132008','Itacambira','MG','2023-08-17 20:05:32','2023-08-17 20:05:32'),(2609,'3132107','Itacarambi','MG','2023-08-17 20:05:32','2023-08-17 20:05:32'),(2610,'3132206','Itaguara','MG','2023-08-17 20:05:32','2023-08-17 20:05:32'),(2611,'3132305','Itaipe','MG','2023-08-17 20:05:32','2023-08-17 20:05:32'),(2612,'3132404','Itajuba','MG','2023-08-17 20:05:32','2023-08-17 20:05:32'),(2613,'3132503','Itamarandiba','MG','2023-08-17 20:05:32','2023-08-17 20:05:32'),(2614,'3132602','Itamarati de Minas','MG','2023-08-17 20:05:32','2023-08-17 20:05:32'),(2615,'3132701','Itambacuri','MG','2023-08-17 20:05:32','2023-08-17 20:05:32'),(2616,'3132800','Itambe do Mato Dentro','MG','2023-08-17 20:05:32','2023-08-17 20:05:32'),(2617,'3132909','Itamogi','MG','2023-08-17 20:05:32','2023-08-17 20:05:32'),(2618,'3133006','Itamonte','MG','2023-08-17 20:05:32','2023-08-17 20:05:32'),(2619,'3133105','Itanhandu','MG','2023-08-17 20:05:32','2023-08-17 20:05:32'),(2620,'3133204','Itanhomi','MG','2023-08-17 20:05:32','2023-08-17 20:05:32'),(2621,'3133303','Itaobim','MG','2023-08-17 20:05:32','2023-08-17 20:05:32'),(2622,'3133402','Itapagipe','MG','2023-08-17 20:05:32','2023-08-17 20:05:32'),(2623,'3133501','Itapecerica','MG','2023-08-17 20:05:32','2023-08-17 20:05:32'),(2624,'3133600','Itapeva','MG','2023-08-17 20:05:32','2023-08-17 20:05:32'),(2625,'3133709','Itatiaiuçu','MG','2023-08-17 20:05:32','2023-08-17 20:05:32'),(2626,'3133758','Itau de Minas','MG','2023-08-17 20:05:32','2023-08-17 20:05:32'),(2627,'3133808','Itauna','MG','2023-08-17 20:05:32','2023-08-17 20:05:32'),(2628,'3133907','Itaverava','MG','2023-08-17 20:05:32','2023-08-17 20:05:32'),(2629,'3134004','Itinga','MG','2023-08-17 20:05:32','2023-08-17 20:05:32'),(2630,'3134103','Itueta','MG','2023-08-17 20:05:32','2023-08-17 20:05:32'),(2631,'3134202','Ituiutaba','MG','2023-08-17 20:05:32','2023-08-17 20:05:32'),(2632,'3134301','Itumirim','MG','2023-08-17 20:05:32','2023-08-17 20:05:32'),(2633,'3134400','Iturama','MG','2023-08-17 20:05:32','2023-08-17 20:05:32'),(2634,'3134509','Itutinga','MG','2023-08-17 20:05:32','2023-08-17 20:05:32'),(2635,'3134608','Jaboticatubas','MG','2023-08-17 20:05:32','2023-08-17 20:05:32'),(2636,'3134707','Jacinto','MG','2023-08-17 20:05:32','2023-08-17 20:05:32'),(2637,'3134806','Jacui','MG','2023-08-17 20:05:32','2023-08-17 20:05:32'),(2638,'3134905','Jacutinga','MG','2023-08-17 20:05:32','2023-08-17 20:05:32'),(2639,'3135001','Jaguaraçu','MG','2023-08-17 20:05:32','2023-08-17 20:05:32'),(2640,'3135050','Jaiba','MG','2023-08-17 20:05:32','2023-08-17 20:05:32'),(2641,'3135076','Jampruca','MG','2023-08-17 20:05:32','2023-08-17 20:05:32'),(2642,'3135100','Janauba','MG','2023-08-17 20:05:32','2023-08-17 20:05:32'),(2643,'3135209','Januaria','MG','2023-08-17 20:05:32','2023-08-17 20:05:32'),(2644,'3135308','Japaraiba','MG','2023-08-17 20:05:32','2023-08-17 20:05:32'),(2645,'3135357','Japonvar','MG','2023-08-17 20:05:32','2023-08-17 20:05:32'),(2646,'3135407','Jeceaba','MG','2023-08-17 20:05:32','2023-08-17 20:05:32'),(2647,'3135456','Jenipapo de Minas','MG','2023-08-17 20:05:32','2023-08-17 20:05:32'),(2648,'3135506','Jequeri','MG','2023-08-17 20:05:32','2023-08-17 20:05:32'),(2649,'3135605','Jequitai','MG','2023-08-17 20:05:32','2023-08-17 20:05:32'),(2650,'3135704','Jequitiba','MG','2023-08-17 20:05:32','2023-08-17 20:05:32'),(2651,'3135803','Jequitinhonha','MG','2023-08-17 20:05:32','2023-08-17 20:05:32'),(2652,'3135902','Jesuânia','MG','2023-08-17 20:05:32','2023-08-17 20:05:32'),(2653,'3136009','Joaima','MG','2023-08-17 20:05:32','2023-08-17 20:05:32'),(2654,'3136108','Joanesia','MG','2023-08-17 20:05:32','2023-08-17 20:05:32'),(2655,'3136207','Joao Monlevade','MG','2023-08-17 20:05:32','2023-08-17 20:05:32'),(2656,'3136306','Joao Pinheiro','MG','2023-08-17 20:05:32','2023-08-17 20:05:32'),(2657,'3136405','Joaquim Felicio','MG','2023-08-17 20:05:32','2023-08-17 20:05:32'),(2658,'3136504','Jordânia','MG','2023-08-17 20:05:32','2023-08-17 20:05:32'),(2659,'3136520','Jose Gonçalves de Minas','MG','2023-08-17 20:05:32','2023-08-17 20:05:32'),(2660,'3136553','Jose Raydan','MG','2023-08-17 20:05:32','2023-08-17 20:05:32'),(2661,'3136579','Josenopolis','MG','2023-08-17 20:05:32','2023-08-17 20:05:32'),(2662,'3136603','Nova Uniao','MG','2023-08-17 20:05:32','2023-08-17 20:05:32'),(2663,'3136652','Juatuba','MG','2023-08-17 20:05:32','2023-08-17 20:05:32'),(2664,'3136702','Juiz de Fora','MG','2023-08-17 20:05:32','2023-08-17 20:05:32'),(2665,'3136801','Juramento','MG','2023-08-17 20:05:32','2023-08-17 20:05:32'),(2666,'3136900','Juruaia','MG','2023-08-17 20:05:32','2023-08-17 20:05:32'),(2667,'3136959','Juvenilia','MG','2023-08-17 20:05:32','2023-08-17 20:05:32'),(2668,'3137007','Ladainha','MG','2023-08-17 20:05:32','2023-08-17 20:05:32'),(2669,'3137106','Lagamar','MG','2023-08-17 20:05:32','2023-08-17 20:05:32'),(2670,'3137205','Lagoa da Prata','MG','2023-08-17 20:05:32','2023-08-17 20:05:32'),(2671,'3137304','Lagoa dos Patos','MG','2023-08-17 20:05:32','2023-08-17 20:05:32'),(2672,'3137403','Lagoa Dourada','MG','2023-08-17 20:05:32','2023-08-17 20:05:32'),(2673,'3137502','Lagoa Formosa','MG','2023-08-17 20:05:32','2023-08-17 20:05:32'),(2674,'3137536','Lagoa Grande','MG','2023-08-17 20:05:32','2023-08-17 20:05:32'),(2675,'3137601','Lagoa Santa','MG','2023-08-17 20:05:32','2023-08-17 20:05:32'),(2676,'3137700','Lajinha','MG','2023-08-17 20:05:32','2023-08-17 20:05:32'),(2677,'3137809','Lambari','MG','2023-08-17 20:05:32','2023-08-17 20:05:32'),(2678,'3137908','Lamim','MG','2023-08-17 20:05:32','2023-08-17 20:05:32'),(2679,'3138005','Laranjal','MG','2023-08-17 20:05:32','2023-08-17 20:05:32'),(2680,'3138104','Lassance','MG','2023-08-17 20:05:32','2023-08-17 20:05:32'),(2681,'3138203','Lavras','MG','2023-08-17 20:05:32','2023-08-17 20:05:32'),(2682,'3138302','Leandro Ferreira','MG','2023-08-17 20:05:32','2023-08-17 20:05:32'),(2683,'3138351','Leme do Prado','MG','2023-08-17 20:05:32','2023-08-17 20:05:32'),(2684,'3138401','Leopoldina','MG','2023-08-17 20:05:32','2023-08-17 20:05:32'),(2685,'3138500','Liberdade','MG','2023-08-17 20:05:32','2023-08-17 20:05:32'),(2686,'3138609','Lima Duarte','MG','2023-08-17 20:05:32','2023-08-17 20:05:32'),(2687,'3138625','Limeira do Oeste','MG','2023-08-17 20:05:32','2023-08-17 20:05:32'),(2688,'3138658','Lontra','MG','2023-08-17 20:05:32','2023-08-17 20:05:32'),(2689,'3138674','Luisburgo','MG','2023-08-17 20:05:32','2023-08-17 20:05:32'),(2690,'3138682','Luislândia','MG','2023-08-17 20:05:32','2023-08-17 20:05:32'),(2691,'3138708','Luminarias','MG','2023-08-17 20:05:32','2023-08-17 20:05:32'),(2692,'3138807','Luz','MG','2023-08-17 20:05:32','2023-08-17 20:05:32'),(2693,'3138906','Machacalis','MG','2023-08-17 20:05:32','2023-08-17 20:05:32'),(2694,'3139003','Machado','MG','2023-08-17 20:05:32','2023-08-17 20:05:32'),(2695,'3139102','Madre de Deus de Minas','MG','2023-08-17 20:05:32','2023-08-17 20:05:32'),(2696,'3139201','Malacacheta','MG','2023-08-17 20:05:32','2023-08-17 20:05:32'),(2697,'3139250','Mamonas','MG','2023-08-17 20:05:32','2023-08-17 20:05:32'),(2698,'3139300','Manga','MG','2023-08-17 20:05:32','2023-08-17 20:05:32'),(2699,'3139409','Manhuaçu','MG','2023-08-17 20:05:32','2023-08-17 20:05:32'),(2700,'3139508','Manhumirim','MG','2023-08-17 20:05:32','2023-08-17 20:05:32'),(2701,'3139607','Mantena','MG','2023-08-17 20:05:32','2023-08-17 20:05:32'),(2702,'3139706','Maravilhas','MG','2023-08-17 20:05:32','2023-08-17 20:05:32'),(2703,'3139805','Mar de Espanha','MG','2023-08-17 20:05:32','2023-08-17 20:05:32'),(2704,'3139904','Maria da Fe','MG','2023-08-17 20:05:32','2023-08-17 20:05:32'),(2705,'3140001','Mariana','MG','2023-08-17 20:05:32','2023-08-17 20:05:32'),(2706,'3140100','Marilac','MG','2023-08-17 20:05:32','2023-08-17 20:05:32'),(2707,'3140159','Mario Campos','MG','2023-08-17 20:05:32','2023-08-17 20:05:32'),(2708,'3140209','Maripa de Minas','MG','2023-08-17 20:05:32','2023-08-17 20:05:32'),(2709,'3140308','Marlieria','MG','2023-08-17 20:05:32','2023-08-17 20:05:32'),(2710,'3140407','Marmelopolis','MG','2023-08-17 20:05:32','2023-08-17 20:05:32'),(2711,'3140506','Martinho Campos','MG','2023-08-17 20:05:32','2023-08-17 20:05:32'),(2712,'3140530','Martins Soares','MG','2023-08-17 20:05:32','2023-08-17 20:05:32'),(2713,'3140555','Mata Verde','MG','2023-08-17 20:05:32','2023-08-17 20:05:32'),(2714,'3140605','Materlândia','MG','2023-08-17 20:05:32','2023-08-17 20:05:32'),(2715,'3140704','Mateus Leme','MG','2023-08-17 20:05:32','2023-08-17 20:05:32'),(2716,'3140803','Matias Barbosa','MG','2023-08-17 20:05:32','2023-08-17 20:05:32'),(2717,'3140852','Matias Cardoso','MG','2023-08-17 20:05:32','2023-08-17 20:05:32'),(2718,'3140902','Matipo','MG','2023-08-17 20:05:32','2023-08-17 20:05:32'),(2719,'3141009','Mato Verde','MG','2023-08-17 20:05:32','2023-08-17 20:05:32'),(2720,'3141108','Matozinhos','MG','2023-08-17 20:05:32','2023-08-17 20:05:32'),(2721,'3141207','Matutina','MG','2023-08-17 20:05:32','2023-08-17 20:05:32'),(2722,'3141306','Medeiros','MG','2023-08-17 20:05:32','2023-08-17 20:05:32'),(2723,'3141405','Medina','MG','2023-08-17 20:05:32','2023-08-17 20:05:32'),(2724,'3141504','Mendes Pimentel','MG','2023-08-17 20:05:32','2023-08-17 20:05:32'),(2725,'3141603','Mercês','MG','2023-08-17 20:05:32','2023-08-17 20:05:32'),(2726,'3141702','Mesquita','MG','2023-08-17 20:05:32','2023-08-17 20:05:32'),(2727,'3141801','Minas Novas','MG','2023-08-17 20:05:32','2023-08-17 20:05:32'),(2728,'3141900','Minduri','MG','2023-08-17 20:05:32','2023-08-17 20:05:32'),(2729,'3142007','Mirabela','MG','2023-08-17 20:05:32','2023-08-17 20:05:32'),(2730,'3142106','Miradouro','MG','2023-08-17 20:05:32','2023-08-17 20:05:32'),(2731,'3142205','Mirai','MG','2023-08-17 20:05:32','2023-08-17 20:05:32'),(2732,'3142254','Miravânia','MG','2023-08-17 20:05:32','2023-08-17 20:05:32'),(2733,'3142304','Moeda','MG','2023-08-17 20:05:32','2023-08-17 20:05:32'),(2734,'3142403','Moema','MG','2023-08-17 20:05:32','2023-08-17 20:05:32'),(2735,'3142502','Monjolos','MG','2023-08-17 20:05:32','2023-08-17 20:05:32'),(2736,'3142601','Monsenhor Paulo','MG','2023-08-17 20:05:32','2023-08-17 20:05:32'),(2737,'3142700','Montalvânia','MG','2023-08-17 20:05:32','2023-08-17 20:05:32'),(2738,'3142809','Monte Alegre de Minas','MG','2023-08-17 20:05:32','2023-08-17 20:05:32'),(2739,'3142908','Monte Azul','MG','2023-08-17 20:05:32','2023-08-17 20:05:32'),(2740,'3143005','Monte Belo','MG','2023-08-17 20:05:32','2023-08-17 20:05:32'),(2741,'3143104','Monte Carmelo','MG','2023-08-17 20:05:32','2023-08-17 20:05:32'),(2742,'3143153','Monte Formoso','MG','2023-08-17 20:05:33','2023-08-17 20:05:33'),(2743,'3143203','Monte Santo de Minas','MG','2023-08-17 20:05:33','2023-08-17 20:05:33'),(2744,'3143302','Montes Claros','MG','2023-08-17 20:05:33','2023-08-17 20:05:33'),(2745,'3143401','Monte Siao','MG','2023-08-17 20:05:33','2023-08-17 20:05:33'),(2746,'3143450','Montezuma','MG','2023-08-17 20:05:33','2023-08-17 20:05:33'),(2747,'3143500','Morada Nova de Minas','MG','2023-08-17 20:05:33','2023-08-17 20:05:33'),(2748,'3143609','Morro da Garça','MG','2023-08-17 20:05:33','2023-08-17 20:05:33'),(2749,'3143708','Morro do Pilar','MG','2023-08-17 20:05:33','2023-08-17 20:05:33'),(2750,'3143807','Munhoz','MG','2023-08-17 20:05:33','2023-08-17 20:05:33'),(2751,'3143906','Muriae','MG','2023-08-17 20:05:33','2023-08-17 20:05:33'),(2752,'3144003','Mutum','MG','2023-08-17 20:05:33','2023-08-17 20:05:33'),(2753,'3144102','Muzambinho','MG','2023-08-17 20:05:33','2023-08-17 20:05:33'),(2754,'3144201','Nacip Raydan','MG','2023-08-17 20:05:33','2023-08-17 20:05:33'),(2755,'3144300','Nanuque','MG','2023-08-17 20:05:33','2023-08-17 20:05:33'),(2756,'3144359','Naque','MG','2023-08-17 20:05:33','2023-08-17 20:05:33'),(2757,'3144375','Natalândia','MG','2023-08-17 20:05:33','2023-08-17 20:05:33'),(2758,'3144409','Natercia','MG','2023-08-17 20:05:33','2023-08-17 20:05:33'),(2759,'3144508','Nazareno','MG','2023-08-17 20:05:33','2023-08-17 20:05:33'),(2760,'3144607','Nepomuceno','MG','2023-08-17 20:05:33','2023-08-17 20:05:33'),(2761,'3144656','Ninheira','MG','2023-08-17 20:05:33','2023-08-17 20:05:33'),(2762,'3144672','Nova Belem','MG','2023-08-17 20:05:33','2023-08-17 20:05:33'),(2763,'3144706','Nova Era','MG','2023-08-17 20:05:33','2023-08-17 20:05:33'),(2764,'3144805','Nova Lima','MG','2023-08-17 20:05:33','2023-08-17 20:05:33'),(2765,'3144904','Nova Modica','MG','2023-08-17 20:05:33','2023-08-17 20:05:33'),(2766,'3145000','Nova Ponte','MG','2023-08-17 20:05:33','2023-08-17 20:05:33'),(2767,'3145059','Nova Porteirinha','MG','2023-08-17 20:05:33','2023-08-17 20:05:33'),(2768,'3145109','Nova Resende','MG','2023-08-17 20:05:33','2023-08-17 20:05:33'),(2769,'3145208','Nova Serrana','MG','2023-08-17 20:05:33','2023-08-17 20:05:33'),(2770,'3145307','Novo Cruzeiro','MG','2023-08-17 20:05:33','2023-08-17 20:05:33'),(2771,'3145356','Novo Oriente de Minas','MG','2023-08-17 20:05:33','2023-08-17 20:05:33'),(2772,'3145372','Novorizonte','MG','2023-08-17 20:05:33','2023-08-17 20:05:33'),(2773,'3145406','Olaria','MG','2023-08-17 20:05:33','2023-08-17 20:05:33'),(2774,'3145455','Olhos-D\'agua','MG','2023-08-17 20:05:33','2023-08-17 20:05:33'),(2775,'3145505','Olimpio Noronha','MG','2023-08-17 20:05:33','2023-08-17 20:05:33'),(2776,'3145604','Oliveira','MG','2023-08-17 20:05:33','2023-08-17 20:05:33'),(2777,'3145703','Oliveira Fortes','MG','2023-08-17 20:05:33','2023-08-17 20:05:33'),(2778,'3145802','Onça de Pitangui','MG','2023-08-17 20:05:33','2023-08-17 20:05:33'),(2779,'3145851','Oratorios','MG','2023-08-17 20:05:33','2023-08-17 20:05:33'),(2780,'3145877','Orizânia','MG','2023-08-17 20:05:33','2023-08-17 20:05:33'),(2781,'3145901','Ouro Branco','MG','2023-08-17 20:05:33','2023-08-17 20:05:33'),(2782,'3146008','Ouro Fino','MG','2023-08-17 20:05:33','2023-08-17 20:05:33'),(2783,'3146107','Ouro Preto','MG','2023-08-17 20:05:33','2023-08-17 20:05:33'),(2784,'3146206','Ouro Verde de Minas','MG','2023-08-17 20:05:33','2023-08-17 20:05:33'),(2785,'3146255','Padre Carvalho','MG','2023-08-17 20:05:33','2023-08-17 20:05:33'),(2786,'3146305','Padre Paraiso','MG','2023-08-17 20:05:33','2023-08-17 20:05:33'),(2787,'3146404','Paineiras','MG','2023-08-17 20:05:33','2023-08-17 20:05:33'),(2788,'3146503','Pains','MG','2023-08-17 20:05:33','2023-08-17 20:05:33'),(2789,'3146552','Pai Pedro','MG','2023-08-17 20:05:33','2023-08-17 20:05:33'),(2790,'3146602','Paiva','MG','2023-08-17 20:05:33','2023-08-17 20:05:33'),(2791,'3146701','Palma','MG','2023-08-17 20:05:33','2023-08-17 20:05:33'),(2792,'3146750','Palmopolis','MG','2023-08-17 20:05:33','2023-08-17 20:05:33'),(2793,'3146909','Papagaios','MG','2023-08-17 20:05:33','2023-08-17 20:05:33'),(2794,'3147006','Paracatu','MG','2023-08-17 20:05:33','2023-08-17 20:05:33'),(2795,'3147105','Para de Minas','MG','2023-08-17 20:05:33','2023-08-17 20:05:33'),(2796,'3147204','Paraguaçu','MG','2023-08-17 20:05:33','2023-08-17 20:05:33'),(2797,'3147303','Paraisopolis','MG','2023-08-17 20:05:33','2023-08-17 20:05:33'),(2798,'3147402','Paraopeba','MG','2023-08-17 20:05:33','2023-08-17 20:05:33'),(2799,'3147501','Passabem','MG','2023-08-17 20:05:33','2023-08-17 20:05:33'),(2800,'3147600','Passa Quatro','MG','2023-08-17 20:05:33','2023-08-17 20:05:33'),(2801,'3147709','Passa Tempo','MG','2023-08-17 20:05:33','2023-08-17 20:05:33'),(2802,'3147808','Passa-Vinte','MG','2023-08-17 20:05:33','2023-08-17 20:05:33'),(2803,'3147907','Passos','MG','2023-08-17 20:05:33','2023-08-17 20:05:33'),(2804,'3147956','Patis','MG','2023-08-17 20:05:33','2023-08-17 20:05:33'),(2805,'3148004','Patos de Minas','MG','2023-08-17 20:05:33','2023-08-17 20:05:33'),(2806,'3148103','Patrocinio','MG','2023-08-17 20:05:33','2023-08-17 20:05:33'),(2807,'3148202','Patrocinio do Muriae','MG','2023-08-17 20:05:33','2023-08-17 20:05:33'),(2808,'3148301','Paula Cândido','MG','2023-08-17 20:05:33','2023-08-17 20:05:33'),(2809,'3148400','Paulistas','MG','2023-08-17 20:05:33','2023-08-17 20:05:33'),(2810,'3148509','Pavao','MG','2023-08-17 20:05:33','2023-08-17 20:05:33'),(2811,'3148608','Peçanha','MG','2023-08-17 20:05:33','2023-08-17 20:05:33'),(2812,'3148707','Pedra Azul','MG','2023-08-17 20:05:33','2023-08-17 20:05:33'),(2813,'3148756','Pedra Bonita','MG','2023-08-17 20:05:33','2023-08-17 20:05:33'),(2814,'3148806','Pedra do Anta','MG','2023-08-17 20:05:33','2023-08-17 20:05:33'),(2815,'3148905','Pedra do Indaia','MG','2023-08-17 20:05:33','2023-08-17 20:05:33'),(2816,'3149002','Pedra Dourada','MG','2023-08-17 20:05:33','2023-08-17 20:05:33'),(2817,'3149101','Pedralva','MG','2023-08-17 20:05:33','2023-08-17 20:05:33'),(2818,'3149150','Pedras de Maria da Cruz','MG','2023-08-17 20:05:33','2023-08-17 20:05:33'),(2819,'3149200','Pedrinopolis','MG','2023-08-17 20:05:33','2023-08-17 20:05:33'),(2820,'3149309','Pedro Leopoldo','MG','2023-08-17 20:05:33','2023-08-17 20:05:33'),(2821,'3149408','Pedro Teixeira','MG','2023-08-17 20:05:33','2023-08-17 20:05:33'),(2822,'3149507','Pequeri','MG','2023-08-17 20:05:33','2023-08-17 20:05:33'),(2823,'3149606','Pequi','MG','2023-08-17 20:05:33','2023-08-17 20:05:33'),(2824,'3149705','Perdigao','MG','2023-08-17 20:05:33','2023-08-17 20:05:33'),(2825,'3149804','Perdizes','MG','2023-08-17 20:05:33','2023-08-17 20:05:33'),(2826,'3149903','Perdoes','MG','2023-08-17 20:05:33','2023-08-17 20:05:33'),(2827,'3149952','Periquito','MG','2023-08-17 20:05:33','2023-08-17 20:05:33'),(2828,'3150000','Pescador','MG','2023-08-17 20:05:33','2023-08-17 20:05:33'),(2829,'3150109','Piau','MG','2023-08-17 20:05:33','2023-08-17 20:05:33'),(2830,'3150158','Piedade de Caratinga','MG','2023-08-17 20:05:33','2023-08-17 20:05:33'),(2831,'3150208','Piedade de Ponte Nova','MG','2023-08-17 20:05:33','2023-08-17 20:05:33'),(2832,'3150307','Piedade do Rio Grande','MG','2023-08-17 20:05:33','2023-08-17 20:05:33'),(2833,'3150406','Piedade dos Gerais','MG','2023-08-17 20:05:33','2023-08-17 20:05:33'),(2834,'3150505','Pimenta','MG','2023-08-17 20:05:33','2023-08-17 20:05:33'),(2835,'3150539','Pingo-D\'agua','MG','2023-08-17 20:05:33','2023-08-17 20:05:33'),(2836,'3150570','Pintopolis','MG','2023-08-17 20:05:33','2023-08-17 20:05:33'),(2837,'3150604','Piracema','MG','2023-08-17 20:05:33','2023-08-17 20:05:33'),(2838,'3150703','Pirajuba','MG','2023-08-17 20:05:33','2023-08-17 20:05:33'),(2839,'3150802','Piranga','MG','2023-08-17 20:05:33','2023-08-17 20:05:33'),(2840,'3150901','Piranguçu','MG','2023-08-17 20:05:33','2023-08-17 20:05:33'),(2841,'3151008','Piranguinho','MG','2023-08-17 20:05:33','2023-08-17 20:05:33'),(2842,'3151107','Pirapetinga','MG','2023-08-17 20:05:33','2023-08-17 20:05:33'),(2843,'3151206','Pirapora','MG','2023-08-17 20:05:33','2023-08-17 20:05:33'),(2844,'3151305','Pirauba','MG','2023-08-17 20:05:33','2023-08-17 20:05:33'),(2845,'3151404','Pitangui','MG','2023-08-17 20:05:33','2023-08-17 20:05:33'),(2846,'3151503','Piumhi','MG','2023-08-17 20:05:33','2023-08-17 20:05:33'),(2847,'3151602','Planura','MG','2023-08-17 20:05:33','2023-08-17 20:05:33'),(2848,'3151701','Poço Fundo','MG','2023-08-17 20:05:33','2023-08-17 20:05:33'),(2849,'3151800','Poços de Caldas','MG','2023-08-17 20:05:33','2023-08-17 20:05:33'),(2850,'3151909','Pocrane','MG','2023-08-17 20:05:33','2023-08-17 20:05:33'),(2851,'3152006','Pompeu','MG','2023-08-17 20:05:33','2023-08-17 20:05:33'),(2852,'3152105','Ponte Nova','MG','2023-08-17 20:05:33','2023-08-17 20:05:33'),(2853,'3152131','Ponto Chique','MG','2023-08-17 20:05:33','2023-08-17 20:05:33'),(2854,'3152170','Ponto dos Volantes','MG','2023-08-17 20:05:33','2023-08-17 20:05:33'),(2855,'3152204','Porteirinha','MG','2023-08-17 20:05:33','2023-08-17 20:05:33'),(2856,'3152303','Porto Firme','MG','2023-08-17 20:05:33','2023-08-17 20:05:33'),(2857,'3152402','Pote','MG','2023-08-17 20:05:33','2023-08-17 20:05:33'),(2858,'3152501','Pouso Alegre','MG','2023-08-17 20:05:33','2023-08-17 20:05:33'),(2859,'3152600','Pouso Alto','MG','2023-08-17 20:05:33','2023-08-17 20:05:33'),(2860,'3152709','Prados','MG','2023-08-17 20:05:33','2023-08-17 20:05:33'),(2861,'3152808','Prata','MG','2023-08-17 20:05:33','2023-08-17 20:05:33'),(2862,'3152907','Pratapolis','MG','2023-08-17 20:05:33','2023-08-17 20:05:33'),(2863,'3153004','Pratinha','MG','2023-08-17 20:05:33','2023-08-17 20:05:33'),(2864,'3153103','Presidente Bernardes','MG','2023-08-17 20:05:33','2023-08-17 20:05:33'),(2865,'3153202','Presidente Juscelino','MG','2023-08-17 20:05:33','2023-08-17 20:05:33'),(2866,'3153301','Presidente Kubitschek','MG','2023-08-17 20:05:33','2023-08-17 20:05:33'),(2867,'3153400','Presidente Olegario','MG','2023-08-17 20:05:33','2023-08-17 20:05:33'),(2868,'3153509','Alto Jequitiba','MG','2023-08-17 20:05:33','2023-08-17 20:05:33'),(2869,'3153608','Prudente de Morais','MG','2023-08-17 20:05:33','2023-08-17 20:05:33'),(2870,'3153707','Quartel Geral','MG','2023-08-17 20:05:33','2023-08-17 20:05:33'),(2871,'3153806','Queluzito','MG','2023-08-17 20:05:33','2023-08-17 20:05:33'),(2872,'3153905','Raposos','MG','2023-08-17 20:05:33','2023-08-17 20:05:33'),(2873,'3154002','Raul Soares','MG','2023-08-17 20:05:33','2023-08-17 20:05:33'),(2874,'3154101','Recreio','MG','2023-08-17 20:05:33','2023-08-17 20:05:33'),(2875,'3154150','Reduto','MG','2023-08-17 20:05:33','2023-08-17 20:05:33'),(2876,'3154200','Resende Costa','MG','2023-08-17 20:05:33','2023-08-17 20:05:33'),(2877,'3154309','Resplendor','MG','2023-08-17 20:05:33','2023-08-17 20:05:33'),(2878,'3154408','Ressaquinha','MG','2023-08-17 20:05:33','2023-08-17 20:05:33'),(2879,'3154457','Riachinho','MG','2023-08-17 20:05:33','2023-08-17 20:05:33'),(2880,'3154507','Riacho dos Machados','MG','2023-08-17 20:05:33','2023-08-17 20:05:33'),(2881,'3154606','Ribeirao das Neves','MG','2023-08-17 20:05:33','2023-08-17 20:05:33'),(2882,'3154705','Ribeirao Vermelho','MG','2023-08-17 20:05:33','2023-08-17 20:05:33'),(2883,'3154804','Rio Acima','MG','2023-08-17 20:05:33','2023-08-17 20:05:33'),(2884,'3154903','Rio Casca','MG','2023-08-17 20:05:33','2023-08-17 20:05:33'),(2885,'3155009','Rio Doce','MG','2023-08-17 20:05:33','2023-08-17 20:05:33'),(2886,'3155108','Rio do Prado','MG','2023-08-17 20:05:33','2023-08-17 20:05:33'),(2887,'3155207','Rio Espera','MG','2023-08-17 20:05:33','2023-08-17 20:05:33'),(2888,'3155306','Rio Manso','MG','2023-08-17 20:05:33','2023-08-17 20:05:33'),(2889,'3155405','Rio Novo','MG','2023-08-17 20:05:33','2023-08-17 20:05:33'),(2890,'3155504','Rio Paranaiba','MG','2023-08-17 20:05:33','2023-08-17 20:05:33'),(2891,'3155603','Rio Pardo de Minas','MG','2023-08-17 20:05:33','2023-08-17 20:05:33'),(2892,'3155702','Rio Piracicaba','MG','2023-08-17 20:05:33','2023-08-17 20:05:33'),(2893,'3155801','Rio Pomba','MG','2023-08-17 20:05:33','2023-08-17 20:05:33'),(2894,'3155900','Rio Preto','MG','2023-08-17 20:05:33','2023-08-17 20:05:33'),(2895,'3156007','Rio Vermelho','MG','2023-08-17 20:05:33','2023-08-17 20:05:33'),(2896,'3156106','Ritapolis','MG','2023-08-17 20:05:33','2023-08-17 20:05:33'),(2897,'3156205','Rochedo de Minas','MG','2023-08-17 20:05:33','2023-08-17 20:05:33'),(2898,'3156304','Rodeiro','MG','2023-08-17 20:05:33','2023-08-17 20:05:33'),(2899,'3156403','Romaria','MG','2023-08-17 20:05:33','2023-08-17 20:05:33'),(2900,'3156452','Rosario da Limeira','MG','2023-08-17 20:05:33','2023-08-17 20:05:33'),(2901,'3156502','Rubelita','MG','2023-08-17 20:05:33','2023-08-17 20:05:33'),(2902,'3156601','Rubim','MG','2023-08-17 20:05:33','2023-08-17 20:05:33'),(2903,'3156700','Sabara','MG','2023-08-17 20:05:33','2023-08-17 20:05:33'),(2904,'3156809','Sabinopolis','MG','2023-08-17 20:05:33','2023-08-17 20:05:33'),(2905,'3156908','Sacramento','MG','2023-08-17 20:05:33','2023-08-17 20:05:33'),(2906,'3157005','Salinas','MG','2023-08-17 20:05:33','2023-08-17 20:05:33'),(2907,'3157104','Salto da Divisa','MG','2023-08-17 20:05:33','2023-08-17 20:05:33'),(2908,'3157203','Santa Barbara','MG','2023-08-17 20:05:33','2023-08-17 20:05:33'),(2909,'3157252','Santa Barbara do Leste','MG','2023-08-17 20:05:33','2023-08-17 20:05:33'),(2910,'3157278','Santa Barbara do Monte Verde','MG','2023-08-17 20:05:33','2023-08-17 20:05:33'),(2911,'3157302','Santa Barbara do Tugurio','MG','2023-08-17 20:05:33','2023-08-17 20:05:33'),(2912,'3157336','Santa Cruz de Minas','MG','2023-08-17 20:05:33','2023-08-17 20:05:33'),(2913,'3157377','Santa Cruz de Salinas','MG','2023-08-17 20:05:33','2023-08-17 20:05:33'),(2914,'3157401','Santa Cruz do Escalvado','MG','2023-08-17 20:05:33','2023-08-17 20:05:33'),(2915,'3157500','Santa Efigênia de Minas','MG','2023-08-17 20:05:33','2023-08-17 20:05:33'),(2916,'3157609','Santa Fe de Minas','MG','2023-08-17 20:05:33','2023-08-17 20:05:33'),(2917,'3157658','Santa Helena de Minas','MG','2023-08-17 20:05:33','2023-08-17 20:05:33'),(2918,'3157708','Santa Juliana','MG','2023-08-17 20:05:33','2023-08-17 20:05:33'),(2919,'3157807','Santa Luzia','MG','2023-08-17 20:05:33','2023-08-17 20:05:33'),(2920,'3157906','Santa Margarida','MG','2023-08-17 20:05:33','2023-08-17 20:05:33'),(2921,'3158003','Santa Maria de Itabira','MG','2023-08-17 20:05:33','2023-08-17 20:05:33'),(2922,'3158102','Santa Maria do Salto','MG','2023-08-17 20:05:33','2023-08-17 20:05:33'),(2923,'3158201','Santa Maria do Suaçui','MG','2023-08-17 20:05:33','2023-08-17 20:05:33'),(2924,'3158300','Santana da Vargem','MG','2023-08-17 20:05:33','2023-08-17 20:05:33'),(2925,'3158409','Santana de Cataguases','MG','2023-08-17 20:05:33','2023-08-17 20:05:33'),(2926,'3158508','Santana de Pirapama','MG','2023-08-17 20:05:33','2023-08-17 20:05:33'),(2927,'3158607','Santana do Deserto','MG','2023-08-17 20:05:33','2023-08-17 20:05:33'),(2928,'3158706','Santana do Garambeu','MG','2023-08-17 20:05:33','2023-08-17 20:05:33'),(2929,'3158805','Santana do Jacare','MG','2023-08-17 20:05:33','2023-08-17 20:05:33'),(2930,'3158904','Santana do Manhuaçu','MG','2023-08-17 20:05:33','2023-08-17 20:05:33'),(2931,'3158953','Santana do Paraiso','MG','2023-08-17 20:05:33','2023-08-17 20:05:33'),(2932,'3159001','Santana do Riacho','MG','2023-08-17 20:05:33','2023-08-17 20:05:33'),(2933,'3159100','Santana dos Montes','MG','2023-08-17 20:05:33','2023-08-17 20:05:33'),(2934,'3159209','Santa Rita de Caldas','MG','2023-08-17 20:05:33','2023-08-17 20:05:33'),(2935,'3159308','Santa Rita de Jacutinga','MG','2023-08-17 20:05:33','2023-08-17 20:05:33'),(2936,'3159357','Santa Rita de Minas','MG','2023-08-17 20:05:33','2023-08-17 20:05:33'),(2937,'3159407','Santa Rita de Ibitipoca','MG','2023-08-17 20:05:33','2023-08-17 20:05:33'),(2938,'3159506','Santa Rita do Itueto','MG','2023-08-17 20:05:33','2023-08-17 20:05:33'),(2939,'3159605','Santa Rita do Sapucai','MG','2023-08-17 20:05:33','2023-08-17 20:05:33'),(2940,'3159704','Santa Rosa da Serra','MG','2023-08-17 20:05:33','2023-08-17 20:05:33'),(2941,'3159803','Santa Vitoria','MG','2023-08-17 20:05:33','2023-08-17 20:05:33'),(2942,'3159902','Santo Antônio do Amparo','MG','2023-08-17 20:05:33','2023-08-17 20:05:33'),(2943,'3160009','Santo Antônio do Aventureiro','MG','2023-08-17 20:05:33','2023-08-17 20:05:33'),(2944,'3160108','Santo Antônio do Grama','MG','2023-08-17 20:05:33','2023-08-17 20:05:33'),(2945,'3160207','Santo Antônio do Itambe','MG','2023-08-17 20:05:33','2023-08-17 20:05:33'),(2946,'3160306','Santo Antônio do Jacinto','MG','2023-08-17 20:05:33','2023-08-17 20:05:33'),(2947,'3160405','Santo Antônio do Monte','MG','2023-08-17 20:05:33','2023-08-17 20:05:33'),(2948,'3160454','Santo Antônio do Retiro','MG','2023-08-17 20:05:33','2023-08-17 20:05:33'),(2949,'3160504','Santo Antônio do Rio Abaixo','MG','2023-08-17 20:05:33','2023-08-17 20:05:33'),(2950,'3160603','Santo Hipolito','MG','2023-08-17 20:05:33','2023-08-17 20:05:33'),(2951,'3160702','Santos Dumont','MG','2023-08-17 20:05:33','2023-08-17 20:05:33'),(2952,'3160801','Sao Bento Abade','MG','2023-08-17 20:05:34','2023-08-17 20:05:34'),(2953,'3160900','Sao Bras do Suaçui','MG','2023-08-17 20:05:34','2023-08-17 20:05:34'),(2954,'3160959','Sao Domingos das Dores','MG','2023-08-17 20:05:34','2023-08-17 20:05:34'),(2955,'3161007','Sao Domingos do Prata','MG','2023-08-17 20:05:34','2023-08-17 20:05:34'),(2956,'3161056','Sao Felix de Minas','MG','2023-08-17 20:05:34','2023-08-17 20:05:34'),(2957,'3161106','Sao Francisco','MG','2023-08-17 20:05:34','2023-08-17 20:05:34'),(2958,'3161205','Sao Francisco de Paula','MG','2023-08-17 20:05:34','2023-08-17 20:05:34'),(2959,'3161304','Sao Francisco de Sales','MG','2023-08-17 20:05:34','2023-08-17 20:05:34'),(2960,'3161403','Sao Francisco do Gloria','MG','2023-08-17 20:05:34','2023-08-17 20:05:34'),(2961,'3161502','Sao Geraldo','MG','2023-08-17 20:05:34','2023-08-17 20:05:34'),(2962,'3161601','Sao Geraldo da Piedade','MG','2023-08-17 20:05:34','2023-08-17 20:05:34'),(2963,'3161650','Sao Geraldo do Baixio','MG','2023-08-17 20:05:34','2023-08-17 20:05:34'),(2964,'3161700','Sao Gonçalo do Abaete','MG','2023-08-17 20:05:34','2023-08-17 20:05:34'),(2965,'3161809','Sao Gonçalo do Para','MG','2023-08-17 20:05:34','2023-08-17 20:05:34'),(2966,'3161908','Sao Gonçalo do Rio Abaixo','MG','2023-08-17 20:05:34','2023-08-17 20:05:34'),(2967,'3162005','Sao Gonçalo do Sapucai','MG','2023-08-17 20:05:34','2023-08-17 20:05:34'),(2968,'3162104','Sao Gotardo','MG','2023-08-17 20:05:34','2023-08-17 20:05:34'),(2969,'3162203','Sao Joao Batista do Gloria','MG','2023-08-17 20:05:34','2023-08-17 20:05:34'),(2970,'3162252','Sao Joao da Lagoa','MG','2023-08-17 20:05:34','2023-08-17 20:05:34'),(2971,'3162302','Sao Joao da Mata','MG','2023-08-17 20:05:34','2023-08-17 20:05:34'),(2972,'3162401','Sao Joao da Ponte','MG','2023-08-17 20:05:34','2023-08-17 20:05:34'),(2973,'3162450','Sao Joao das Missoes','MG','2023-08-17 20:05:34','2023-08-17 20:05:34'),(2974,'3162500','Sao Joao del Rei','MG','2023-08-17 20:05:34','2023-08-17 20:05:34'),(2975,'3162559','Sao Joao do Manhuaçu','MG','2023-08-17 20:05:34','2023-08-17 20:05:34'),(2976,'3162575','Sao Joao do Manteninha','MG','2023-08-17 20:05:34','2023-08-17 20:05:34'),(2977,'3162609','Sao Joao do Oriente','MG','2023-08-17 20:05:34','2023-08-17 20:05:34'),(2978,'3162658','Sao Joao do Pacui','MG','2023-08-17 20:05:34','2023-08-17 20:05:34'),(2979,'3162708','Sao Joao do Paraiso','MG','2023-08-17 20:05:34','2023-08-17 20:05:34'),(2980,'3162807','Sao Joao Evangelista','MG','2023-08-17 20:05:34','2023-08-17 20:05:34'),(2981,'3162906','Sao Joao Nepomuceno','MG','2023-08-17 20:05:34','2023-08-17 20:05:34'),(2982,'3162922','Sao Joaquim de Bicas','MG','2023-08-17 20:05:34','2023-08-17 20:05:34'),(2983,'3162948','Sao Jose da Barra','MG','2023-08-17 20:05:34','2023-08-17 20:05:34'),(2984,'3162955','Sao Jose da Lapa','MG','2023-08-17 20:05:34','2023-08-17 20:05:34'),(2985,'3163003','Sao Jose da Safira','MG','2023-08-17 20:05:34','2023-08-17 20:05:34'),(2986,'3163102','Sao Jose da Varginha','MG','2023-08-17 20:05:34','2023-08-17 20:05:34'),(2987,'3163201','Sao Jose do Alegre','MG','2023-08-17 20:05:34','2023-08-17 20:05:34'),(2988,'3163300','Sao Jose do Divino','MG','2023-08-17 20:05:34','2023-08-17 20:05:34'),(2989,'3163409','Sao Jose do Goiabal','MG','2023-08-17 20:05:34','2023-08-17 20:05:34'),(2990,'3163508','Sao Jose do Jacuri','MG','2023-08-17 20:05:34','2023-08-17 20:05:34'),(2991,'3163607','Sao Jose do Mantimento','MG','2023-08-17 20:05:34','2023-08-17 20:05:34'),(2992,'3163706','Sao Lourenço','MG','2023-08-17 20:05:34','2023-08-17 20:05:34'),(2993,'3163805','Sao Miguel do Anta','MG','2023-08-17 20:05:34','2023-08-17 20:05:34'),(2994,'3163904','Sao Pedro da Uniao','MG','2023-08-17 20:05:34','2023-08-17 20:05:34'),(2995,'3164001','Sao Pedro dos Ferros','MG','2023-08-17 20:05:34','2023-08-17 20:05:34'),(2996,'3164100','Sao Pedro do Suaçui','MG','2023-08-17 20:05:34','2023-08-17 20:05:34'),(2997,'3164209','Sao Romao','MG','2023-08-17 20:05:34','2023-08-17 20:05:34'),(2998,'3164308','Sao Roque de Minas','MG','2023-08-17 20:05:34','2023-08-17 20:05:34'),(2999,'3164407','Sao Sebastiao da Bela Vista','MG','2023-08-17 20:05:34','2023-08-17 20:05:34'),(3000,'3164431','Sao Sebastiao da Vargem Alegre','MG','2023-08-17 20:05:34','2023-08-17 20:05:34'),(3001,'3164472','Sao Sebastiao do Anta','MG','2023-08-17 20:05:34','2023-08-17 20:05:34'),(3002,'3164506','Sao Sebastiao do Maranhao','MG','2023-08-17 20:05:34','2023-08-17 20:05:34'),(3003,'3164605','Sao Sebastiao do Oeste','MG','2023-08-17 20:05:34','2023-08-17 20:05:34'),(3004,'3164704','Sao Sebastiao do Paraiso','MG','2023-08-17 20:05:34','2023-08-17 20:05:34'),(3005,'3164803','Sao Sebastiao do Rio Preto','MG','2023-08-17 20:05:34','2023-08-17 20:05:34'),(3006,'3164902','Sao Sebastiao do Rio Verde','MG','2023-08-17 20:05:34','2023-08-17 20:05:34'),(3007,'3165008','Sao Tiago','MG','2023-08-17 20:05:34','2023-08-17 20:05:34'),(3008,'3165107','Sao Tomas de Aquino','MG','2023-08-17 20:05:34','2023-08-17 20:05:34'),(3009,'3165206','Sao Thome das Letras','MG','2023-08-17 20:05:34','2023-08-17 20:05:34'),(3010,'3165305','Sao Vicente de Minas','MG','2023-08-17 20:05:34','2023-08-17 20:05:34'),(3011,'3165404','Sapucai-Mirim','MG','2023-08-17 20:05:34','2023-08-17 20:05:34'),(3012,'3165503','Sardoa','MG','2023-08-17 20:05:34','2023-08-17 20:05:34'),(3013,'3165537','Sarzedo','MG','2023-08-17 20:05:34','2023-08-17 20:05:34'),(3014,'3165552','Setubinha','MG','2023-08-17 20:05:34','2023-08-17 20:05:34'),(3015,'3165560','Sem-Peixe','MG','2023-08-17 20:05:34','2023-08-17 20:05:34'),(3016,'3165578','Senador Amaral','MG','2023-08-17 20:05:34','2023-08-17 20:05:34'),(3017,'3165602','Senador Cortes','MG','2023-08-17 20:05:34','2023-08-17 20:05:34'),(3018,'3165701','Senador Firmino','MG','2023-08-17 20:05:34','2023-08-17 20:05:34'),(3019,'3165800','Senador Jose Bento','MG','2023-08-17 20:05:34','2023-08-17 20:05:34'),(3020,'3165909','Senador Modestino Gonçalves','MG','2023-08-17 20:05:34','2023-08-17 20:05:34'),(3021,'3166006','Senhora de Oliveira','MG','2023-08-17 20:05:34','2023-08-17 20:05:34'),(3022,'3166105','Senhora do Porto','MG','2023-08-17 20:05:34','2023-08-17 20:05:34'),(3023,'3166204','Senhora dos Remedios','MG','2023-08-17 20:05:34','2023-08-17 20:05:34'),(3024,'3166303','Sericita','MG','2023-08-17 20:05:34','2023-08-17 20:05:34'),(3025,'3166402','Seritinga','MG','2023-08-17 20:05:34','2023-08-17 20:05:34'),(3026,'3166501','Serra Azul de Minas','MG','2023-08-17 20:05:34','2023-08-17 20:05:34'),(3027,'3166600','Serra da Saudade','MG','2023-08-17 20:05:34','2023-08-17 20:05:34'),(3028,'3166709','Serra dos Aimores','MG','2023-08-17 20:05:34','2023-08-17 20:05:34'),(3029,'3166808','Serra do Salitre','MG','2023-08-17 20:05:34','2023-08-17 20:05:34'),(3030,'3166907','Serrania','MG','2023-08-17 20:05:34','2023-08-17 20:05:34'),(3031,'3166956','Serranopolis de Minas','MG','2023-08-17 20:05:34','2023-08-17 20:05:34'),(3032,'3167004','Serranos','MG','2023-08-17 20:05:34','2023-08-17 20:05:34'),(3033,'3167103','Serro','MG','2023-08-17 20:05:34','2023-08-17 20:05:34'),(3034,'3167202','Sete Lagoas','MG','2023-08-17 20:05:34','2023-08-17 20:05:34'),(3035,'3167301','Silveirânia','MG','2023-08-17 20:05:34','2023-08-17 20:05:34'),(3036,'3167400','Silvianopolis','MG','2023-08-17 20:05:34','2023-08-17 20:05:34'),(3037,'3167509','Simao Pereira','MG','2023-08-17 20:05:34','2023-08-17 20:05:34'),(3038,'3167608','Simonesia','MG','2023-08-17 20:05:34','2023-08-17 20:05:34'),(3039,'3167707','Sobralia','MG','2023-08-17 20:05:34','2023-08-17 20:05:34'),(3040,'3167806','Soledade de Minas','MG','2023-08-17 20:05:34','2023-08-17 20:05:34'),(3041,'3167905','Tabuleiro','MG','2023-08-17 20:05:34','2023-08-17 20:05:34'),(3042,'3168002','Taiobeiras','MG','2023-08-17 20:05:34','2023-08-17 20:05:34'),(3043,'3168051','Taparuba','MG','2023-08-17 20:05:34','2023-08-17 20:05:34'),(3044,'3168101','Tapira','MG','2023-08-17 20:05:34','2023-08-17 20:05:34'),(3045,'3168200','Tapirai','MG','2023-08-17 20:05:34','2023-08-17 20:05:34'),(3046,'3168309','Taquaraçu de Minas','MG','2023-08-17 20:05:34','2023-08-17 20:05:34'),(3047,'3168408','Tarumirim','MG','2023-08-17 20:05:34','2023-08-17 20:05:34'),(3048,'3168507','Teixeiras','MG','2023-08-17 20:05:34','2023-08-17 20:05:34'),(3049,'3168606','Teofilo Otoni','MG','2023-08-17 20:05:34','2023-08-17 20:05:34'),(3050,'3168705','Timoteo','MG','2023-08-17 20:05:34','2023-08-17 20:05:34'),(3051,'3168804','Tiradentes','MG','2023-08-17 20:05:34','2023-08-17 20:05:34'),(3052,'3168903','Tiros','MG','2023-08-17 20:05:34','2023-08-17 20:05:34'),(3053,'3169000','Tocantins','MG','2023-08-17 20:05:34','2023-08-17 20:05:34'),(3054,'3169059','Tocos do Moji','MG','2023-08-17 20:05:34','2023-08-17 20:05:34'),(3055,'3169109','Toledo','MG','2023-08-17 20:05:34','2023-08-17 20:05:34'),(3056,'3169208','Tombos','MG','2023-08-17 20:05:34','2023-08-17 20:05:34'),(3057,'3169307','Três Coraçoes','MG','2023-08-17 20:05:34','2023-08-17 20:05:34'),(3058,'3169356','Três Marias','MG','2023-08-17 20:05:34','2023-08-17 20:05:34'),(3059,'3169406','Três Pontas','MG','2023-08-17 20:05:34','2023-08-17 20:05:34'),(3060,'3169505','Tumiritinga','MG','2023-08-17 20:05:34','2023-08-17 20:05:34'),(3061,'3169604','Tupaciguara','MG','2023-08-17 20:05:34','2023-08-17 20:05:34'),(3062,'3169703','Turmalina','MG','2023-08-17 20:05:34','2023-08-17 20:05:34'),(3063,'3169802','Turvolândia','MG','2023-08-17 20:05:34','2023-08-17 20:05:34'),(3064,'3169901','Uba','MG','2023-08-17 20:05:34','2023-08-17 20:05:34'),(3065,'3170008','Ubai','MG','2023-08-17 20:05:35','2023-08-17 20:05:35'),(3066,'3170057','Ubaporanga','MG','2023-08-17 20:05:35','2023-08-17 20:05:35'),(3067,'3170107','Uberaba','MG','2023-08-17 20:05:35','2023-08-17 20:05:35'),(3068,'3170206','Uberlândia','MG','2023-08-17 20:05:35','2023-08-17 20:05:35'),(3069,'3170305','Umburatiba','MG','2023-08-17 20:05:35','2023-08-17 20:05:35'),(3070,'3170404','Unai','MG','2023-08-17 20:05:35','2023-08-17 20:05:35'),(3071,'3170438','Uniao de Minas','MG','2023-08-17 20:05:35','2023-08-17 20:05:35'),(3072,'3170479','Uruana de Minas','MG','2023-08-17 20:05:35','2023-08-17 20:05:35'),(3073,'3170503','Urucânia','MG','2023-08-17 20:05:35','2023-08-17 20:05:35'),(3074,'3170529','Urucuia','MG','2023-08-17 20:05:35','2023-08-17 20:05:35'),(3075,'3170578','Vargem Alegre','MG','2023-08-17 20:05:35','2023-08-17 20:05:35'),(3076,'3170602','Vargem Bonita','MG','2023-08-17 20:05:35','2023-08-17 20:05:35'),(3077,'3170651','Vargem Grande do Rio Pardo','MG','2023-08-17 20:05:35','2023-08-17 20:05:35'),(3078,'3170701','Varginha','MG','2023-08-17 20:05:35','2023-08-17 20:05:35'),(3079,'3170750','Varjao de Minas','MG','2023-08-17 20:05:35','2023-08-17 20:05:35'),(3080,'3170800','Varzea da Palma','MG','2023-08-17 20:05:35','2023-08-17 20:05:35'),(3081,'3170909','Varzelândia','MG','2023-08-17 20:05:35','2023-08-17 20:05:35'),(3082,'3171006','Vazante','MG','2023-08-17 20:05:35','2023-08-17 20:05:35'),(3083,'3171030','Verdelândia','MG','2023-08-17 20:05:35','2023-08-17 20:05:35'),(3084,'3171071','Veredinha','MG','2023-08-17 20:05:35','2023-08-17 20:05:35'),(3085,'3171105','Verissimo','MG','2023-08-17 20:05:35','2023-08-17 20:05:35'),(3086,'3171154','Vermelho Novo','MG','2023-08-17 20:05:35','2023-08-17 20:05:35'),(3087,'3171204','Vespasiano','MG','2023-08-17 20:05:35','2023-08-17 20:05:35'),(3088,'3171303','Viçosa','MG','2023-08-17 20:05:35','2023-08-17 20:05:35'),(3089,'3171402','Vieiras','MG','2023-08-17 20:05:35','2023-08-17 20:05:35'),(3090,'3171501','Mathias Lobato','MG','2023-08-17 20:05:35','2023-08-17 20:05:35'),(3091,'3171600','Virgem da Lapa','MG','2023-08-17 20:05:35','2023-08-17 20:05:35'),(3092,'3171709','Virginia','MG','2023-08-17 20:05:35','2023-08-17 20:05:35'),(3093,'3171808','Virginopolis','MG','2023-08-17 20:05:35','2023-08-17 20:05:35'),(3094,'3171907','Virgolândia','MG','2023-08-17 20:05:35','2023-08-17 20:05:35'),(3095,'3172004','Visconde do Rio Branco','MG','2023-08-17 20:05:35','2023-08-17 20:05:35'),(3096,'3172103','Volta Grande','MG','2023-08-17 20:05:35','2023-08-17 20:05:35'),(3097,'3172202','Wenceslau Braz','MG','2023-08-17 20:05:35','2023-08-17 20:05:35'),(3098,'3200102','Afonso Claudio','ES','2023-08-17 20:05:35','2023-08-17 20:05:35'),(3099,'3200136','aguia Branca','ES','2023-08-17 20:05:35','2023-08-17 20:05:35'),(3100,'3200169','agua Doce do Norte','ES','2023-08-17 20:05:35','2023-08-17 20:05:35'),(3101,'3200201','Alegre','ES','2023-08-17 20:05:35','2023-08-17 20:05:35'),(3102,'3200300','Alfredo Chaves','ES','2023-08-17 20:05:35','2023-08-17 20:05:35'),(3103,'3200359','Alto Rio Novo','ES','2023-08-17 20:05:35','2023-08-17 20:05:35'),(3104,'3200409','Anchieta','ES','2023-08-17 20:05:35','2023-08-17 20:05:35'),(3105,'3200508','Apiaca','ES','2023-08-17 20:05:35','2023-08-17 20:05:35'),(3106,'3200607','Aracruz','ES','2023-08-17 20:05:35','2023-08-17 20:05:35'),(3107,'3200706','Atilio Vivacqua','ES','2023-08-17 20:05:35','2023-08-17 20:05:35'),(3108,'3200805','Baixo Guandu','ES','2023-08-17 20:05:35','2023-08-17 20:05:35'),(3109,'3200904','Barra de Sao Francisco','ES','2023-08-17 20:05:35','2023-08-17 20:05:35'),(3110,'3201001','Boa Esperança','ES','2023-08-17 20:05:35','2023-08-17 20:05:35'),(3111,'3201100','Bom Jesus do Norte','ES','2023-08-17 20:05:35','2023-08-17 20:05:35'),(3112,'3201159','Brejetuba','ES','2023-08-17 20:05:35','2023-08-17 20:05:35'),(3113,'3201209','Cachoeiro de Itapemirim','ES','2023-08-17 20:05:35','2023-08-17 20:05:35'),(3114,'3201308','Cariacica','ES','2023-08-17 20:05:35','2023-08-17 20:05:35'),(3115,'3201407','Castelo','ES','2023-08-17 20:05:35','2023-08-17 20:05:35'),(3116,'3201506','Colatina','ES','2023-08-17 20:05:35','2023-08-17 20:05:35'),(3117,'3201605','Conceiçao da Barra','ES','2023-08-17 20:05:35','2023-08-17 20:05:35'),(3118,'3201704','Conceiçao do Castelo','ES','2023-08-17 20:05:35','2023-08-17 20:05:35'),(3119,'3201803','Divino de Sao Lourenço','ES','2023-08-17 20:05:35','2023-08-17 20:05:35'),(3120,'3201902','Domingos Martins','ES','2023-08-17 20:05:35','2023-08-17 20:05:35'),(3121,'3202009','Dores do Rio Preto','ES','2023-08-17 20:05:35','2023-08-17 20:05:35'),(3122,'3202108','Ecoporanga','ES','2023-08-17 20:05:35','2023-08-17 20:05:35'),(3123,'3202207','Fundao','ES','2023-08-17 20:05:35','2023-08-17 20:05:35'),(3124,'3202256','Governador Lindenberg','ES','2023-08-17 20:05:35','2023-08-17 20:05:35'),(3125,'3202306','Guaçui','ES','2023-08-17 20:05:35','2023-08-17 20:05:35'),(3126,'3202405','Guarapari','ES','2023-08-17 20:05:35','2023-08-17 20:05:35'),(3127,'3202454','Ibatiba','ES','2023-08-17 20:05:35','2023-08-17 20:05:35'),(3128,'3202504','Ibiraçu','ES','2023-08-17 20:05:35','2023-08-17 20:05:35'),(3129,'3202553','Ibitirama','ES','2023-08-17 20:05:35','2023-08-17 20:05:35'),(3130,'3202603','Iconha','ES','2023-08-17 20:05:35','2023-08-17 20:05:35'),(3131,'3202652','Irupi','ES','2023-08-17 20:05:35','2023-08-17 20:05:35'),(3132,'3202702','Itaguaçu','ES','2023-08-17 20:05:35','2023-08-17 20:05:35'),(3133,'3202801','Itapemirim','ES','2023-08-17 20:05:35','2023-08-17 20:05:35'),(3134,'3202900','Itarana','ES','2023-08-17 20:05:35','2023-08-17 20:05:35'),(3135,'3203007','Iuna','ES','2023-08-17 20:05:36','2023-08-17 20:05:36'),(3136,'3203056','Jaguare','ES','2023-08-17 20:05:36','2023-08-17 20:05:36'),(3137,'3203106','Jerônimo Monteiro','ES','2023-08-17 20:05:36','2023-08-17 20:05:36'),(3138,'3203130','Joao Neiva','ES','2023-08-17 20:05:36','2023-08-17 20:05:36'),(3139,'3203163','Laranja da Terra','ES','2023-08-17 20:05:36','2023-08-17 20:05:36'),(3140,'3203205','Linhares','ES','2023-08-17 20:05:36','2023-08-17 20:05:36'),(3141,'3203304','Mantenopolis','ES','2023-08-17 20:05:36','2023-08-17 20:05:36'),(3142,'3203320','Marataizes','ES','2023-08-17 20:05:36','2023-08-17 20:05:36'),(3143,'3203346','Marechal Floriano','ES','2023-08-17 20:05:36','2023-08-17 20:05:36'),(3144,'3203353','Marilândia','ES','2023-08-17 20:05:36','2023-08-17 20:05:36'),(3145,'3203403','Mimoso do Sul','ES','2023-08-17 20:05:36','2023-08-17 20:05:36'),(3146,'3203502','Montanha','ES','2023-08-17 20:05:36','2023-08-17 20:05:36'),(3147,'3203601','Mucurici','ES','2023-08-17 20:05:36','2023-08-17 20:05:36'),(3148,'3203700','Muniz Freire','ES','2023-08-17 20:05:36','2023-08-17 20:05:36'),(3149,'3203809','Muqui','ES','2023-08-17 20:05:36','2023-08-17 20:05:36'),(3150,'3203908','Nova Venecia','ES','2023-08-17 20:05:36','2023-08-17 20:05:36'),(3151,'3204005','Pancas','ES','2023-08-17 20:05:36','2023-08-17 20:05:36'),(3152,'3204054','Pedro Canario','ES','2023-08-17 20:05:36','2023-08-17 20:05:36'),(3153,'3204104','Pinheiros','ES','2023-08-17 20:05:36','2023-08-17 20:05:36'),(3154,'3204203','Piuma','ES','2023-08-17 20:05:36','2023-08-17 20:05:36'),(3155,'3204252','Ponto Belo','ES','2023-08-17 20:05:36','2023-08-17 20:05:36'),(3156,'3204302','Presidente Kennedy','ES','2023-08-17 20:05:36','2023-08-17 20:05:36'),(3157,'3204351','Rio Bananal','ES','2023-08-17 20:05:36','2023-08-17 20:05:36'),(3158,'3204401','Rio Novo do Sul','ES','2023-08-17 20:05:36','2023-08-17 20:05:36'),(3159,'3204500','Santa Leopoldina','ES','2023-08-17 20:05:36','2023-08-17 20:05:36'),(3160,'3204559','Santa Maria de Jetiba','ES','2023-08-17 20:05:36','2023-08-17 20:05:36'),(3161,'3204609','Santa Teresa','ES','2023-08-17 20:05:36','2023-08-17 20:05:36'),(3162,'3204658','Sao Domingos do Norte','ES','2023-08-17 20:05:36','2023-08-17 20:05:36'),(3163,'3204708','Sao Gabriel da Palha','ES','2023-08-17 20:05:36','2023-08-17 20:05:36'),(3164,'3204807','Sao Jose do Calçado','ES','2023-08-17 20:05:36','2023-08-17 20:05:36'),(3165,'3204906','Sao Mateus','ES','2023-08-17 20:05:36','2023-08-17 20:05:36'),(3166,'3204955','Sao Roque do Canaa','ES','2023-08-17 20:05:36','2023-08-17 20:05:36'),(3167,'3205002','Serra','ES','2023-08-17 20:05:36','2023-08-17 20:05:36'),(3168,'3205010','Sooretama','ES','2023-08-17 20:05:36','2023-08-17 20:05:36'),(3169,'3205036','Vargem Alta','ES','2023-08-17 20:05:36','2023-08-17 20:05:36'),(3170,'3205069','Venda Nova do Imigrante','ES','2023-08-17 20:05:36','2023-08-17 20:05:36'),(3171,'3205101','Viana','ES','2023-08-17 20:05:36','2023-08-17 20:05:36'),(3172,'3205150','Vila Pavao','ES','2023-08-17 20:05:36','2023-08-17 20:05:36'),(3173,'3205176','Vila Valerio','ES','2023-08-17 20:05:36','2023-08-17 20:05:36'),(3174,'3205200','Vila Velha','ES','2023-08-17 20:05:36','2023-08-17 20:05:36'),(3175,'3205309','Vitoria','ES','2023-08-17 20:05:36','2023-08-17 20:05:36'),(3176,'3300100','Angra dos Reis','RJ','2023-08-17 20:05:36','2023-08-17 20:05:36'),(3177,'3300159','Aperibe','RJ','2023-08-17 20:05:36','2023-08-17 20:05:36'),(3178,'3300209','Araruama','RJ','2023-08-17 20:05:36','2023-08-17 20:05:36'),(3179,'3300225','Areal','RJ','2023-08-17 20:05:36','2023-08-17 20:05:36'),(3180,'3300233','Armaçao dos Buzios','RJ','2023-08-17 20:05:36','2023-08-17 20:05:36'),(3181,'3300258','Arraial do Cabo','RJ','2023-08-17 20:05:36','2023-08-17 20:05:36'),(3182,'3300308','Barra do Pirai','RJ','2023-08-17 20:05:36','2023-08-17 20:05:36'),(3183,'3300407','Barra Mansa','RJ','2023-08-17 20:05:36','2023-08-17 20:05:36'),(3184,'3300456','Belford Roxo','RJ','2023-08-17 20:05:36','2023-08-17 20:05:36'),(3185,'3300506','Bom Jardim','RJ','2023-08-17 20:05:36','2023-08-17 20:05:36'),(3186,'3300605','Bom Jesus do Itabapoana','RJ','2023-08-17 20:05:36','2023-08-17 20:05:36'),(3187,'3300704','Cabo Frio','RJ','2023-08-17 20:05:36','2023-08-17 20:05:36'),(3188,'3300803','Cachoeiras de Macacu','RJ','2023-08-17 20:05:36','2023-08-17 20:05:36'),(3189,'3300902','Cambuci','RJ','2023-08-17 20:05:36','2023-08-17 20:05:36'),(3190,'3300936','Carapebus','RJ','2023-08-17 20:05:36','2023-08-17 20:05:36'),(3191,'3300951','Comendador Levy Gasparian','RJ','2023-08-17 20:05:36','2023-08-17 20:05:36'),(3192,'3301009','Campos dos Goytacazes','RJ','2023-08-17 20:05:36','2023-08-17 20:05:36'),(3193,'3301108','Cantagalo','RJ','2023-08-17 20:05:36','2023-08-17 20:05:36'),(3194,'3301157','Cardoso Moreira','RJ','2023-08-17 20:05:36','2023-08-17 20:05:36'),(3195,'3301207','Carmo','RJ','2023-08-17 20:05:36','2023-08-17 20:05:36'),(3196,'3301306','Casimiro de Abreu','RJ','2023-08-17 20:05:36','2023-08-17 20:05:36'),(3197,'3301405','Conceiçao de Macabu','RJ','2023-08-17 20:05:36','2023-08-17 20:05:36'),(3198,'3301504','Cordeiro','RJ','2023-08-17 20:05:36','2023-08-17 20:05:36'),(3199,'3301603','Duas Barras','RJ','2023-08-17 20:05:36','2023-08-17 20:05:36'),(3200,'3301702','Duque de Caxias','RJ','2023-08-17 20:05:36','2023-08-17 20:05:36'),(3201,'3301801','Engenheiro Paulo de Frontin','RJ','2023-08-17 20:05:36','2023-08-17 20:05:36'),(3202,'3301850','Guapimirim','RJ','2023-08-17 20:05:36','2023-08-17 20:05:36'),(3203,'3301876','Iguaba Grande','RJ','2023-08-17 20:05:36','2023-08-17 20:05:36'),(3204,'3301900','Itaborai','RJ','2023-08-17 20:05:36','2023-08-17 20:05:36'),(3205,'3302007','Itaguai','RJ','2023-08-17 20:05:36','2023-08-17 20:05:36'),(3206,'3302056','Italva','RJ','2023-08-17 20:05:36','2023-08-17 20:05:36'),(3207,'3302106','Itaocara','RJ','2023-08-17 20:05:36','2023-08-17 20:05:36'),(3208,'3302205','Itaperuna','RJ','2023-08-17 20:05:36','2023-08-17 20:05:36'),(3209,'3302254','Itatiaia','RJ','2023-08-17 20:05:36','2023-08-17 20:05:36'),(3210,'3302270','Japeri','RJ','2023-08-17 20:05:36','2023-08-17 20:05:36'),(3211,'3302304','Laje do Muriae','RJ','2023-08-17 20:05:36','2023-08-17 20:05:36'),(3212,'3302403','Macae','RJ','2023-08-17 20:05:36','2023-08-17 20:05:36'),(3213,'3302452','Macuco','RJ','2023-08-17 20:05:36','2023-08-17 20:05:36'),(3214,'3302502','Mage','RJ','2023-08-17 20:05:36','2023-08-17 20:05:36'),(3215,'3302601','Mangaratiba','RJ','2023-08-17 20:05:36','2023-08-17 20:05:36'),(3216,'3302700','Marica','RJ','2023-08-17 20:05:36','2023-08-17 20:05:36'),(3217,'3302809','Mendes','RJ','2023-08-17 20:05:36','2023-08-17 20:05:36'),(3218,'3302858','Mesquita','RJ','2023-08-17 20:05:36','2023-08-17 20:05:36'),(3219,'3302908','Miguel Pereira','RJ','2023-08-17 20:05:36','2023-08-17 20:05:36'),(3220,'3303005','Miracema','RJ','2023-08-17 20:05:36','2023-08-17 20:05:36'),(3221,'3303104','Natividade','RJ','2023-08-17 20:05:36','2023-08-17 20:05:36'),(3222,'3303203','Nilopolis','RJ','2023-08-17 20:05:36','2023-08-17 20:05:36'),(3223,'3303302','Niteroi','RJ','2023-08-17 20:05:36','2023-08-17 20:05:36'),(3224,'3303401','Nova Friburgo','RJ','2023-08-17 20:05:36','2023-08-17 20:05:36'),(3225,'3303500','Nova Iguaçu','RJ','2023-08-17 20:05:36','2023-08-17 20:05:36'),(3226,'3303609','Paracambi','RJ','2023-08-17 20:05:36','2023-08-17 20:05:36'),(3227,'3303708','Paraiba do Sul','RJ','2023-08-17 20:05:36','2023-08-17 20:05:36'),(3228,'3303807','Paraty','RJ','2023-08-17 20:05:36','2023-08-17 20:05:36'),(3229,'3303856','Paty do Alferes','RJ','2023-08-17 20:05:36','2023-08-17 20:05:36'),(3230,'3303906','Petropolis','RJ','2023-08-17 20:05:36','2023-08-17 20:05:36'),(3231,'3303955','Pinheiral','RJ','2023-08-17 20:05:36','2023-08-17 20:05:36'),(3232,'3304003','Pirai','RJ','2023-08-17 20:05:36','2023-08-17 20:05:36'),(3233,'3304102','Porciuncula','RJ','2023-08-17 20:05:36','2023-08-17 20:05:36'),(3234,'3304110','Porto Real','RJ','2023-08-17 20:05:36','2023-08-17 20:05:36'),(3235,'3304128','Quatis','RJ','2023-08-17 20:05:36','2023-08-17 20:05:36'),(3236,'3304144','Queimados','RJ','2023-08-17 20:05:36','2023-08-17 20:05:36'),(3237,'3304151','Quissama','RJ','2023-08-17 20:05:36','2023-08-17 20:05:36'),(3238,'3304201','Resende','RJ','2023-08-17 20:05:36','2023-08-17 20:05:36'),(3239,'3304300','Rio Bonito','RJ','2023-08-17 20:05:36','2023-08-17 20:05:36'),(3240,'3304409','Rio Claro','RJ','2023-08-17 20:05:36','2023-08-17 20:05:36'),(3241,'3304508','Rio das Flores','RJ','2023-08-17 20:05:36','2023-08-17 20:05:36'),(3242,'3304524','Rio das Ostras','RJ','2023-08-17 20:05:36','2023-08-17 20:05:36'),(3243,'3304557','Rio de Janeiro','RJ','2023-08-17 20:05:36','2023-08-17 20:05:36'),(3244,'3304607','Santa Maria Madalena','RJ','2023-08-17 20:05:36','2023-08-17 20:05:36'),(3245,'3304706','Santo Antônio de Padua','RJ','2023-08-17 20:05:36','2023-08-17 20:05:36'),(3246,'3304755','Sao Francisco de Itabapoana','RJ','2023-08-17 20:05:36','2023-08-17 20:05:36'),(3247,'3304805','Sao Fidelis','RJ','2023-08-17 20:05:36','2023-08-17 20:05:36'),(3248,'3304904','Sao Gonçalo','RJ','2023-08-17 20:05:36','2023-08-17 20:05:36'),(3249,'3305000','Sao Joao da Barra','RJ','2023-08-17 20:05:37','2023-08-17 20:05:37'),(3250,'3305109','Sao Joao de Meriti','RJ','2023-08-17 20:05:37','2023-08-17 20:05:37'),(3251,'3305133','Sao Jose de Uba','RJ','2023-08-17 20:05:37','2023-08-17 20:05:37'),(3252,'3305158','Sao Jose do Vale do Rio Preto','RJ','2023-08-17 20:05:37','2023-08-17 20:05:37'),(3253,'3305208','Sao Pedro da Aldeia','RJ','2023-08-17 20:05:37','2023-08-17 20:05:37'),(3254,'3305307','Sao Sebastiao do Alto','RJ','2023-08-17 20:05:37','2023-08-17 20:05:37'),(3255,'3305406','Sapucaia','RJ','2023-08-17 20:05:37','2023-08-17 20:05:37'),(3256,'3305505','Saquarema','RJ','2023-08-17 20:05:37','2023-08-17 20:05:37'),(3257,'3305554','Seropedica','RJ','2023-08-17 20:05:37','2023-08-17 20:05:37'),(3258,'3305604','Silva Jardim','RJ','2023-08-17 20:05:37','2023-08-17 20:05:37'),(3259,'3305703','Sumidouro','RJ','2023-08-17 20:05:37','2023-08-17 20:05:37'),(3260,'3305752','Tangua','RJ','2023-08-17 20:05:37','2023-08-17 20:05:37'),(3261,'3305802','Teresopolis','RJ','2023-08-17 20:05:37','2023-08-17 20:05:37'),(3262,'3305901','Trajano de Moraes','RJ','2023-08-17 20:05:37','2023-08-17 20:05:37'),(3263,'3306008','Três Rios','RJ','2023-08-17 20:05:37','2023-08-17 20:05:37'),(3264,'3306107','Valença','RJ','2023-08-17 20:05:37','2023-08-17 20:05:37'),(3265,'3306156','Varre-Sai','RJ','2023-08-17 20:05:37','2023-08-17 20:05:37'),(3266,'3306206','Vassouras','RJ','2023-08-17 20:05:37','2023-08-17 20:05:37'),(3267,'3306305','Volta Redonda','RJ','2023-08-17 20:05:37','2023-08-17 20:05:37'),(3268,'3500105','Adamantina','SP','2023-08-17 20:05:37','2023-08-17 20:05:37'),(3269,'3500204','Adolfo','SP','2023-08-17 20:05:37','2023-08-17 20:05:37'),(3270,'3500303','Aguai','SP','2023-08-17 20:05:37','2023-08-17 20:05:37'),(3271,'3500402','aguas da Prata','SP','2023-08-17 20:05:37','2023-08-17 20:05:37'),(3272,'3500501','aguas de Lindoia','SP','2023-08-17 20:05:37','2023-08-17 20:05:37'),(3273,'3500550','aguas de Santa Barbara','SP','2023-08-17 20:05:37','2023-08-17 20:05:37'),(3274,'3500600','aguas de Sao Pedro','SP','2023-08-17 20:05:37','2023-08-17 20:05:37'),(3275,'3500709','Agudos','SP','2023-08-17 20:05:37','2023-08-17 20:05:37'),(3276,'3500758','Alambari','SP','2023-08-17 20:05:37','2023-08-17 20:05:37'),(3277,'3500808','Alfredo Marcondes','SP','2023-08-17 20:05:37','2023-08-17 20:05:37'),(3278,'3500907','Altair','SP','2023-08-17 20:05:37','2023-08-17 20:05:37'),(3279,'3501004','Altinopolis','SP','2023-08-17 20:05:37','2023-08-17 20:05:37'),(3280,'3501103','Alto Alegre','SP','2023-08-17 20:05:37','2023-08-17 20:05:37'),(3281,'3501152','Aluminio','SP','2023-08-17 20:05:37','2023-08-17 20:05:37'),(3282,'3501202','alvares Florence','SP','2023-08-17 20:05:37','2023-08-17 20:05:37'),(3283,'3501301','alvares Machado','SP','2023-08-17 20:05:37','2023-08-17 20:05:37'),(3284,'3501400','alvaro de Carvalho','SP','2023-08-17 20:05:37','2023-08-17 20:05:37'),(3285,'3501509','Alvinlândia','SP','2023-08-17 20:05:37','2023-08-17 20:05:37'),(3286,'3501608','Americana','SP','2023-08-17 20:05:37','2023-08-17 20:05:37'),(3287,'3501707','Americo Brasiliense','SP','2023-08-17 20:05:37','2023-08-17 20:05:37'),(3288,'3501806','Americo de Campos','SP','2023-08-17 20:05:37','2023-08-17 20:05:37'),(3289,'3501905','Amparo','SP','2023-08-17 20:05:37','2023-08-17 20:05:37'),(3290,'3502002','Analândia','SP','2023-08-17 20:05:37','2023-08-17 20:05:37'),(3291,'3502101','Andradina','SP','2023-08-17 20:05:37','2023-08-17 20:05:37'),(3292,'3502200','Angatuba','SP','2023-08-17 20:05:37','2023-08-17 20:05:37'),(3293,'3502309','Anhembi','SP','2023-08-17 20:05:37','2023-08-17 20:05:37'),(3294,'3502408','Anhumas','SP','2023-08-17 20:05:37','2023-08-17 20:05:37'),(3295,'3502507','Aparecida','SP','2023-08-17 20:05:37','2023-08-17 20:05:37'),(3296,'3502606','Aparecida D\'Oeste','SP','2023-08-17 20:05:37','2023-08-17 20:05:37'),(3297,'3502705','Apiai','SP','2023-08-17 20:05:37','2023-08-17 20:05:37'),(3298,'3502754','Araçariguama','SP','2023-08-17 20:05:37','2023-08-17 20:05:37'),(3299,'3502804','Araçatuba','SP','2023-08-17 20:05:37','2023-08-17 20:05:37'),(3300,'3502903','Araçoiaba da Serra','SP','2023-08-17 20:05:37','2023-08-17 20:05:37'),(3301,'3503000','Aramina','SP','2023-08-17 20:05:37','2023-08-17 20:05:37'),(3302,'3503109','Arandu','SP','2023-08-17 20:05:37','2023-08-17 20:05:37'),(3303,'3503158','Arapei','SP','2023-08-17 20:05:37','2023-08-17 20:05:37'),(3304,'3503208','Araraquara','SP','2023-08-17 20:05:37','2023-08-17 20:05:37'),(3305,'3503307','Araras','SP','2023-08-17 20:05:37','2023-08-17 20:05:37'),(3306,'3503356','Arco-iris','SP','2023-08-17 20:05:37','2023-08-17 20:05:37'),(3307,'3503406','Arealva','SP','2023-08-17 20:05:37','2023-08-17 20:05:37'),(3308,'3503505','Areias','SP','2023-08-17 20:05:37','2023-08-17 20:05:37'),(3309,'3503604','Areiopolis','SP','2023-08-17 20:05:37','2023-08-17 20:05:37'),(3310,'3503703','Ariranha','SP','2023-08-17 20:05:37','2023-08-17 20:05:37'),(3311,'3503802','Artur Nogueira','SP','2023-08-17 20:05:37','2023-08-17 20:05:37'),(3312,'3503901','Aruja','SP','2023-08-17 20:05:37','2023-08-17 20:05:37'),(3313,'3503950','Aspasia','SP','2023-08-17 20:05:37','2023-08-17 20:05:37'),(3314,'3504008','Assis','SP','2023-08-17 20:05:37','2023-08-17 20:05:37'),(3315,'3504107','Atibaia','SP','2023-08-17 20:05:37','2023-08-17 20:05:37'),(3316,'3504206','Auriflama','SP','2023-08-17 20:05:37','2023-08-17 20:05:37'),(3317,'3504305','Avai','SP','2023-08-17 20:05:37','2023-08-17 20:05:37'),(3318,'3504404','Avanhandava','SP','2023-08-17 20:05:37','2023-08-17 20:05:37'),(3319,'3504503','Avare','SP','2023-08-17 20:05:37','2023-08-17 20:05:37'),(3320,'3504602','Bady Bassitt','SP','2023-08-17 20:05:37','2023-08-17 20:05:37'),(3321,'3504701','Balbinos','SP','2023-08-17 20:05:37','2023-08-17 20:05:37'),(3322,'3504800','Balsamo','SP','2023-08-17 20:05:37','2023-08-17 20:05:37'),(3323,'3504909','Bananal','SP','2023-08-17 20:05:37','2023-08-17 20:05:37'),(3324,'3505005','Barao de Antonina','SP','2023-08-17 20:05:37','2023-08-17 20:05:37'),(3325,'3505104','Barbosa','SP','2023-08-17 20:05:37','2023-08-17 20:05:37'),(3326,'3505203','Bariri','SP','2023-08-17 20:05:37','2023-08-17 20:05:37'),(3327,'3505302','Barra Bonita','SP','2023-08-17 20:05:37','2023-08-17 20:05:37'),(3328,'3505351','Barra do Chapeu','SP','2023-08-17 20:05:37','2023-08-17 20:05:37'),(3329,'3505401','Barra do Turvo','SP','2023-08-17 20:05:37','2023-08-17 20:05:37'),(3330,'3505500','Barretos','SP','2023-08-17 20:05:37','2023-08-17 20:05:37'),(3331,'3505609','Barrinha','SP','2023-08-17 20:05:37','2023-08-17 20:05:37'),(3332,'3505708','Barueri','SP','2023-08-17 20:05:37','2023-08-17 20:05:37'),(3333,'3505807','Bastos','SP','2023-08-17 20:05:37','2023-08-17 20:05:37'),(3334,'3505906','Batatais','SP','2023-08-17 20:05:37','2023-08-17 20:05:37'),(3335,'3506003','Bauru','SP','2023-08-17 20:05:37','2023-08-17 20:05:37'),(3336,'3506102','Bebedouro','SP','2023-08-17 20:05:37','2023-08-17 20:05:37'),(3337,'3506201','Bento de Abreu','SP','2023-08-17 20:05:37','2023-08-17 20:05:37'),(3338,'3506300','Bernardino de Campos','SP','2023-08-17 20:05:37','2023-08-17 20:05:37'),(3339,'3506359','Bertioga','SP','2023-08-17 20:05:37','2023-08-17 20:05:37'),(3340,'3506409','Bilac','SP','2023-08-17 20:05:37','2023-08-17 20:05:37'),(3341,'3506508','Birigui','SP','2023-08-17 20:05:37','2023-08-17 20:05:37'),(3342,'3506607','Biritiba-Mirim','SP','2023-08-17 20:05:37','2023-08-17 20:05:37'),(3343,'3506706','Boa Esperança do Sul','SP','2023-08-17 20:05:37','2023-08-17 20:05:37'),(3344,'3506805','Bocaina','SP','2023-08-17 20:05:37','2023-08-17 20:05:37'),(3345,'3506904','Bofete','SP','2023-08-17 20:05:38','2023-08-17 20:05:38'),(3346,'3507001','Boituva','SP','2023-08-17 20:05:38','2023-08-17 20:05:38'),(3347,'3507100','Bom Jesus dos Perdoes','SP','2023-08-17 20:05:38','2023-08-17 20:05:38'),(3348,'3507159','Bom Sucesso de Itarare','SP','2023-08-17 20:05:38','2023-08-17 20:05:38'),(3349,'3507209','Bora','SP','2023-08-17 20:05:38','2023-08-17 20:05:38'),(3350,'3507308','Boraceia','SP','2023-08-17 20:05:38','2023-08-17 20:05:38'),(3351,'3507407','Borborema','SP','2023-08-17 20:05:38','2023-08-17 20:05:38'),(3352,'3507456','Borebi','SP','2023-08-17 20:05:38','2023-08-17 20:05:38'),(3353,'3507506','Botucatu','SP','2023-08-17 20:05:38','2023-08-17 20:05:38'),(3354,'3507605','Bragança Paulista','SP','2023-08-17 20:05:38','2023-08-17 20:05:38'),(3355,'3507704','Brauna','SP','2023-08-17 20:05:38','2023-08-17 20:05:38'),(3356,'3507753','Brejo Alegre','SP','2023-08-17 20:05:38','2023-08-17 20:05:38'),(3357,'3507803','Brodowski','SP','2023-08-17 20:05:38','2023-08-17 20:05:38'),(3358,'3507902','Brotas','SP','2023-08-17 20:05:38','2023-08-17 20:05:38'),(3359,'3508009','Buri','SP','2023-08-17 20:05:38','2023-08-17 20:05:38'),(3360,'3508108','Buritama','SP','2023-08-17 20:05:38','2023-08-17 20:05:38'),(3361,'3508207','Buritizal','SP','2023-08-17 20:05:38','2023-08-17 20:05:38'),(3362,'3508306','Cabralia Paulista','SP','2023-08-17 20:05:38','2023-08-17 20:05:38'),(3363,'3508405','Cabreuva','SP','2023-08-17 20:05:38','2023-08-17 20:05:38'),(3364,'3508504','Caçapava','SP','2023-08-17 20:05:38','2023-08-17 20:05:38'),(3365,'3508603','Cachoeira Paulista','SP','2023-08-17 20:05:38','2023-08-17 20:05:38'),(3366,'3508702','Caconde','SP','2023-08-17 20:05:38','2023-08-17 20:05:38'),(3367,'3508801','Cafelândia','SP','2023-08-17 20:05:38','2023-08-17 20:05:38'),(3368,'3508900','Caiabu','SP','2023-08-17 20:05:38','2023-08-17 20:05:38'),(3369,'3509007','Caieiras','SP','2023-08-17 20:05:38','2023-08-17 20:05:38'),(3370,'3509106','Caiua','SP','2023-08-17 20:05:38','2023-08-17 20:05:38'),(3371,'3509205','Cajamar','SP','2023-08-17 20:05:38','2023-08-17 20:05:38'),(3372,'3509254','Cajati','SP','2023-08-17 20:05:38','2023-08-17 20:05:38'),(3373,'3509304','Cajobi','SP','2023-08-17 20:05:38','2023-08-17 20:05:38'),(3374,'3509403','Cajuru','SP','2023-08-17 20:05:38','2023-08-17 20:05:38'),(3375,'3509452','Campina do Monte Alegre','SP','2023-08-17 20:05:38','2023-08-17 20:05:38'),(3376,'3509502','Campinas','SP','2023-08-17 20:05:38','2023-08-17 20:05:38'),(3377,'3509601','Campo Limpo Paulista','SP','2023-08-17 20:05:38','2023-08-17 20:05:38'),(3378,'3509700','Campos do Jordao','SP','2023-08-17 20:05:38','2023-08-17 20:05:38'),(3379,'3509809','Campos Novos Paulista','SP','2023-08-17 20:05:38','2023-08-17 20:05:38'),(3380,'3509908','Cananeia','SP','2023-08-17 20:05:38','2023-08-17 20:05:38'),(3381,'3509957','Canas','SP','2023-08-17 20:05:38','2023-08-17 20:05:38'),(3382,'3510005','Cândido Mota','SP','2023-08-17 20:05:38','2023-08-17 20:05:38'),(3383,'3510104','Cândido Rodrigues','SP','2023-08-17 20:05:38','2023-08-17 20:05:38'),(3384,'3510153','Canitar','SP','2023-08-17 20:05:38','2023-08-17 20:05:38'),(3385,'3510203','Capao Bonito','SP','2023-08-17 20:05:38','2023-08-17 20:05:38'),(3386,'3510302','Capela do Alto','SP','2023-08-17 20:05:38','2023-08-17 20:05:38'),(3387,'3510401','Capivari','SP','2023-08-17 20:05:38','2023-08-17 20:05:38'),(3388,'3510500','Caraguatatuba','SP','2023-08-17 20:05:38','2023-08-17 20:05:38'),(3389,'3510609','Carapicuiba','SP','2023-08-17 20:05:38','2023-08-17 20:05:38'),(3390,'3510708','Cardoso','SP','2023-08-17 20:05:38','2023-08-17 20:05:38'),(3391,'3510807','Casa Branca','SP','2023-08-17 20:05:38','2023-08-17 20:05:38'),(3392,'3510906','Cassia dos Coqueiros','SP','2023-08-17 20:05:38','2023-08-17 20:05:38'),(3393,'3511003','Castilho','SP','2023-08-17 20:05:38','2023-08-17 20:05:38'),(3394,'3511102','Catanduva','SP','2023-08-17 20:05:38','2023-08-17 20:05:38'),(3395,'3511201','Catigua','SP','2023-08-17 20:05:38','2023-08-17 20:05:38'),(3396,'3511300','Cedral','SP','2023-08-17 20:05:38','2023-08-17 20:05:38'),(3397,'3511409','Cerqueira Cesar','SP','2023-08-17 20:05:38','2023-08-17 20:05:38'),(3398,'3511508','Cerquilho','SP','2023-08-17 20:05:38','2023-08-17 20:05:38'),(3399,'3511607','Cesario Lange','SP','2023-08-17 20:05:38','2023-08-17 20:05:38'),(3400,'3511706','Charqueada','SP','2023-08-17 20:05:38','2023-08-17 20:05:38'),(3401,'3511904','Clementina','SP','2023-08-17 20:05:38','2023-08-17 20:05:38'),(3402,'3512001','Colina','SP','2023-08-17 20:05:38','2023-08-17 20:05:38'),(3403,'3512100','Colômbia','SP','2023-08-17 20:05:38','2023-08-17 20:05:38'),(3404,'3512209','Conchal','SP','2023-08-17 20:05:38','2023-08-17 20:05:38'),(3405,'3512308','Conchas','SP','2023-08-17 20:05:38','2023-08-17 20:05:38'),(3406,'3512407','Cordeiropolis','SP','2023-08-17 20:05:38','2023-08-17 20:05:38'),(3407,'3512506','Coroados','SP','2023-08-17 20:05:38','2023-08-17 20:05:38'),(3408,'3512605','Coronel Macedo','SP','2023-08-17 20:05:38','2023-08-17 20:05:38'),(3409,'3512704','Corumbatai','SP','2023-08-17 20:05:38','2023-08-17 20:05:38'),(3410,'3512803','Cosmopolis','SP','2023-08-17 20:05:38','2023-08-17 20:05:38'),(3411,'3512902','Cosmorama','SP','2023-08-17 20:05:38','2023-08-17 20:05:38'),(3412,'3513009','Cotia','SP','2023-08-17 20:05:38','2023-08-17 20:05:38'),(3413,'3513108','Cravinhos','SP','2023-08-17 20:05:38','2023-08-17 20:05:38'),(3414,'3513207','Cristais Paulista','SP','2023-08-17 20:05:38','2023-08-17 20:05:38'),(3415,'3513306','Cruzalia','SP','2023-08-17 20:05:38','2023-08-17 20:05:38'),(3416,'3513405','Cruzeiro','SP','2023-08-17 20:05:38','2023-08-17 20:05:38'),(3417,'3513504','Cubatao','SP','2023-08-17 20:05:38','2023-08-17 20:05:38'),(3418,'3513603','Cunha','SP','2023-08-17 20:05:38','2023-08-17 20:05:38'),(3419,'3513702','Descalvado','SP','2023-08-17 20:05:38','2023-08-17 20:05:38'),(3420,'3513801','Diadema','SP','2023-08-17 20:05:38','2023-08-17 20:05:38'),(3421,'3513850','Dirce Reis','SP','2023-08-17 20:05:38','2023-08-17 20:05:38'),(3422,'3513900','Divinolândia','SP','2023-08-17 20:05:38','2023-08-17 20:05:38'),(3423,'3514007','Dobrada','SP','2023-08-17 20:05:38','2023-08-17 20:05:38'),(3424,'3514106','Dois Corregos','SP','2023-08-17 20:05:38','2023-08-17 20:05:38'),(3425,'3514205','Dolcinopolis','SP','2023-08-17 20:05:38','2023-08-17 20:05:38'),(3426,'3514304','Dourado','SP','2023-08-17 20:05:38','2023-08-17 20:05:38'),(3427,'3514403','Dracena','SP','2023-08-17 20:05:38','2023-08-17 20:05:38'),(3428,'3514502','Duartina','SP','2023-08-17 20:05:38','2023-08-17 20:05:38'),(3429,'3514601','Dumont','SP','2023-08-17 20:05:38','2023-08-17 20:05:38'),(3430,'3514700','Echapora','SP','2023-08-17 20:05:38','2023-08-17 20:05:38'),(3431,'3514809','Eldorado','SP','2023-08-17 20:05:38','2023-08-17 20:05:38'),(3432,'3514908','Elias Fausto','SP','2023-08-17 20:05:38','2023-08-17 20:05:38'),(3433,'3514924','Elisiario','SP','2023-08-17 20:05:38','2023-08-17 20:05:38'),(3434,'3514957','Embauba','SP','2023-08-17 20:05:38','2023-08-17 20:05:38'),(3435,'3515004','Embu das Artes','SP','2023-08-17 20:05:38','2023-08-17 20:05:38'),(3436,'3515103','Embu-Guaçu','SP','2023-08-17 20:05:38','2023-08-17 20:05:38'),(3437,'3515129','Emilianopolis','SP','2023-08-17 20:05:38','2023-08-17 20:05:38'),(3438,'3515152','Engenheiro Coelho','SP','2023-08-17 20:05:38','2023-08-17 20:05:38'),(3439,'3515186','Espirito Santo do Pinhal','SP','2023-08-17 20:05:38','2023-08-17 20:05:38'),(3440,'3515194','Espirito Santo do Turvo','SP','2023-08-17 20:05:38','2023-08-17 20:05:38'),(3441,'3515202','Estrela D\'Oeste','SP','2023-08-17 20:05:38','2023-08-17 20:05:38'),(3442,'3515301','Estrela do Norte','SP','2023-08-17 20:05:38','2023-08-17 20:05:38'),(3443,'3515350','Euclides da Cunha Paulista','SP','2023-08-17 20:05:38','2023-08-17 20:05:38'),(3444,'3515400','Fartura','SP','2023-08-17 20:05:38','2023-08-17 20:05:38'),(3445,'3515509','Fernandopolis','SP','2023-08-17 20:05:38','2023-08-17 20:05:38'),(3446,'3515608','Fernando Prestes','SP','2023-08-17 20:05:38','2023-08-17 20:05:38'),(3447,'3515657','Fernao','SP','2023-08-17 20:05:38','2023-08-17 20:05:38'),(3448,'3515707','Ferraz de Vasconcelos','SP','2023-08-17 20:05:38','2023-08-17 20:05:38'),(3449,'3515806','Flora Rica','SP','2023-08-17 20:05:38','2023-08-17 20:05:38'),(3450,'3515905','Floreal','SP','2023-08-17 20:05:38','2023-08-17 20:05:38'),(3451,'3516002','Florida Paulista','SP','2023-08-17 20:05:38','2023-08-17 20:05:38'),(3452,'3516101','Florinia','SP','2023-08-17 20:05:38','2023-08-17 20:05:38'),(3453,'3516200','Franca','SP','2023-08-17 20:05:38','2023-08-17 20:05:38'),(3454,'3516309','Francisco Morato','SP','2023-08-17 20:05:38','2023-08-17 20:05:38'),(3455,'3516408','Franco da Rocha','SP','2023-08-17 20:05:38','2023-08-17 20:05:38'),(3456,'3516507','Gabriel Monteiro','SP','2023-08-17 20:05:38','2023-08-17 20:05:38'),(3457,'3516606','Galia','SP','2023-08-17 20:05:38','2023-08-17 20:05:38'),(3458,'3516705','Garça','SP','2023-08-17 20:05:38','2023-08-17 20:05:38'),(3459,'3516804','Gastao Vidigal','SP','2023-08-17 20:05:38','2023-08-17 20:05:38'),(3460,'3516853','Gaviao Peixoto','SP','2023-08-17 20:05:38','2023-08-17 20:05:38'),(3461,'3516903','General Salgado','SP','2023-08-17 20:05:38','2023-08-17 20:05:38'),(3462,'3517000','Getulina','SP','2023-08-17 20:05:38','2023-08-17 20:05:38'),(3463,'3517109','Glicerio','SP','2023-08-17 20:05:38','2023-08-17 20:05:38'),(3464,'3517208','Guaiçara','SP','2023-08-17 20:05:38','2023-08-17 20:05:38'),(3465,'3517307','Guaimbê','SP','2023-08-17 20:05:38','2023-08-17 20:05:38'),(3466,'3517406','Guaira','SP','2023-08-17 20:05:38','2023-08-17 20:05:38'),(3467,'3517505','Guapiaçu','SP','2023-08-17 20:05:38','2023-08-17 20:05:38'),(3468,'3517604','Guapiara','SP','2023-08-17 20:05:38','2023-08-17 20:05:38'),(3469,'3517703','Guara','SP','2023-08-17 20:05:38','2023-08-17 20:05:38'),(3470,'3517802','Guaraçai','SP','2023-08-17 20:05:38','2023-08-17 20:05:38'),(3471,'3517901','Guaraci','SP','2023-08-17 20:05:38','2023-08-17 20:05:38'),(3472,'3518008','Guarani D\'Oeste','SP','2023-08-17 20:05:38','2023-08-17 20:05:38'),(3473,'3518107','Guaranta','SP','2023-08-17 20:05:38','2023-08-17 20:05:38'),(3474,'3518206','Guararapes','SP','2023-08-17 20:05:38','2023-08-17 20:05:38'),(3475,'3518305','Guararema','SP','2023-08-17 20:05:38','2023-08-17 20:05:38'),(3476,'3518404','Guaratingueta','SP','2023-08-17 20:05:38','2023-08-17 20:05:38'),(3477,'3518503','Guarei','SP','2023-08-17 20:05:38','2023-08-17 20:05:38'),(3478,'3518602','Guariba','SP','2023-08-17 20:05:38','2023-08-17 20:05:38'),(3479,'3518701','Guaruja','SP','2023-08-17 20:05:38','2023-08-17 20:05:38'),(3480,'3518800','Guarulhos','SP','2023-08-17 20:05:38','2023-08-17 20:05:38'),(3481,'3518859','Guatapara','SP','2023-08-17 20:05:38','2023-08-17 20:05:38'),(3482,'3518909','Guzolândia','SP','2023-08-17 20:05:38','2023-08-17 20:05:38'),(3483,'3519006','Herculândia','SP','2023-08-17 20:05:38','2023-08-17 20:05:38'),(3484,'3519055','Holambra','SP','2023-08-17 20:05:38','2023-08-17 20:05:38'),(3485,'3519071','Hortolândia','SP','2023-08-17 20:05:38','2023-08-17 20:05:38'),(3486,'3519105','Iacanga','SP','2023-08-17 20:05:38','2023-08-17 20:05:38'),(3487,'3519204','Iacri','SP','2023-08-17 20:05:38','2023-08-17 20:05:38'),(3488,'3519253','Iaras','SP','2023-08-17 20:05:38','2023-08-17 20:05:38'),(3489,'3519303','Ibate','SP','2023-08-17 20:05:38','2023-08-17 20:05:38'),(3490,'3519402','Ibira','SP','2023-08-17 20:05:38','2023-08-17 20:05:38'),(3491,'3519501','Ibirarema','SP','2023-08-17 20:05:38','2023-08-17 20:05:38'),(3492,'3519600','Ibitinga','SP','2023-08-17 20:05:38','2023-08-17 20:05:38'),(3493,'3519709','Ibiuna','SP','2023-08-17 20:05:38','2023-08-17 20:05:38'),(3494,'3519808','Icem','SP','2023-08-17 20:05:38','2023-08-17 20:05:38'),(3495,'3519907','Iepê','SP','2023-08-17 20:05:38','2023-08-17 20:05:38'),(3496,'3520004','Igaraçu do Tietê','SP','2023-08-17 20:05:38','2023-08-17 20:05:38'),(3497,'3520103','Igarapava','SP','2023-08-17 20:05:38','2023-08-17 20:05:38'),(3498,'3520202','Igarata','SP','2023-08-17 20:05:38','2023-08-17 20:05:38'),(3499,'3520301','Iguape','SP','2023-08-17 20:05:38','2023-08-17 20:05:38'),(3500,'3520400','Ilhabela','SP','2023-08-17 20:05:38','2023-08-17 20:05:38'),(3501,'3520426','Ilha Comprida','SP','2023-08-17 20:05:38','2023-08-17 20:05:38'),(3502,'3520442','Ilha Solteira','SP','2023-08-17 20:05:38','2023-08-17 20:05:38'),(3503,'3520509','Indaiatuba','SP','2023-08-17 20:05:38','2023-08-17 20:05:38'),(3504,'3520608','Indiana','SP','2023-08-17 20:05:38','2023-08-17 20:05:38'),(3505,'3520707','Indiapora','SP','2023-08-17 20:05:38','2023-08-17 20:05:38'),(3506,'3520806','Inubia Paulista','SP','2023-08-17 20:05:38','2023-08-17 20:05:38'),(3507,'3520905','Ipaussu','SP','2023-08-17 20:05:38','2023-08-17 20:05:38'),(3508,'3521002','Ipero','SP','2023-08-17 20:05:38','2023-08-17 20:05:38'),(3509,'3521101','Ipeuna','SP','2023-08-17 20:05:38','2023-08-17 20:05:38'),(3510,'3521150','Ipigua','SP','2023-08-17 20:05:38','2023-08-17 20:05:38'),(3511,'3521200','Iporanga','SP','2023-08-17 20:05:38','2023-08-17 20:05:38'),(3512,'3521309','Ipua','SP','2023-08-17 20:05:38','2023-08-17 20:05:38'),(3513,'3521408','Iracemapolis','SP','2023-08-17 20:05:38','2023-08-17 20:05:38'),(3514,'3521507','Irapua','SP','2023-08-17 20:05:38','2023-08-17 20:05:38'),(3515,'3521606','Irapuru','SP','2023-08-17 20:05:38','2023-08-17 20:05:38'),(3516,'3521705','Itabera','SP','2023-08-17 20:05:38','2023-08-17 20:05:38'),(3517,'3521804','Itai','SP','2023-08-17 20:05:38','2023-08-17 20:05:38'),(3518,'3521903','Itajobi','SP','2023-08-17 20:05:38','2023-08-17 20:05:38'),(3519,'3522000','Itaju','SP','2023-08-17 20:05:38','2023-08-17 20:05:38'),(3520,'3522109','Itanhaem','SP','2023-08-17 20:05:38','2023-08-17 20:05:38'),(3521,'3522158','Itaoca','SP','2023-08-17 20:05:38','2023-08-17 20:05:38'),(3522,'3522208','Itapecerica da Serra','SP','2023-08-17 20:05:38','2023-08-17 20:05:38'),(3523,'3522307','Itapetininga','SP','2023-08-17 20:05:38','2023-08-17 20:05:38'),(3524,'3522406','Itapeva','SP','2023-08-17 20:05:38','2023-08-17 20:05:38'),(3525,'3522505','Itapevi','SP','2023-08-17 20:05:38','2023-08-17 20:05:38'),(3526,'3522604','Itapira','SP','2023-08-17 20:05:38','2023-08-17 20:05:38'),(3527,'3522653','Itapirapua Paulista','SP','2023-08-17 20:05:38','2023-08-17 20:05:38'),(3528,'3522703','Itapolis','SP','2023-08-17 20:05:38','2023-08-17 20:05:38'),(3529,'3522802','Itaporanga','SP','2023-08-17 20:05:38','2023-08-17 20:05:38'),(3530,'3522901','Itapui','SP','2023-08-17 20:05:38','2023-08-17 20:05:38'),(3531,'3523008','Itapura','SP','2023-08-17 20:05:38','2023-08-17 20:05:38'),(3532,'3523107','Itaquaquecetuba','SP','2023-08-17 20:05:38','2023-08-17 20:05:38'),(3533,'3523206','Itarare','SP','2023-08-17 20:05:38','2023-08-17 20:05:38'),(3534,'3523305','Itariri','SP','2023-08-17 20:05:38','2023-08-17 20:05:38'),(3535,'3523404','Itatiba','SP','2023-08-17 20:05:38','2023-08-17 20:05:38'),(3536,'3523503','Itatinga','SP','2023-08-17 20:05:38','2023-08-17 20:05:38'),(3537,'3523602','Itirapina','SP','2023-08-17 20:05:38','2023-08-17 20:05:38'),(3538,'3523701','Itirapua','SP','2023-08-17 20:05:38','2023-08-17 20:05:38'),(3539,'3523800','Itobi','SP','2023-08-17 20:05:38','2023-08-17 20:05:38'),(3540,'3523909','Itu','SP','2023-08-17 20:05:38','2023-08-17 20:05:38'),(3541,'3524006','Itupeva','SP','2023-08-17 20:05:38','2023-08-17 20:05:38'),(3542,'3524105','Ituverava','SP','2023-08-17 20:05:38','2023-08-17 20:05:38'),(3543,'3524204','Jaborandi','SP','2023-08-17 20:05:38','2023-08-17 20:05:38'),(3544,'3524303','Jaboticabal','SP','2023-08-17 20:05:38','2023-08-17 20:05:38'),(3545,'3524402','Jacarei','SP','2023-08-17 20:05:38','2023-08-17 20:05:38'),(3546,'3524501','Jaci','SP','2023-08-17 20:05:38','2023-08-17 20:05:38'),(3547,'3524600','Jacupiranga','SP','2023-08-17 20:05:38','2023-08-17 20:05:38'),(3548,'3524709','Jaguariuna','SP','2023-08-17 20:05:38','2023-08-17 20:05:38'),(3549,'3524808','Jales','SP','2023-08-17 20:05:38','2023-08-17 20:05:38'),(3550,'3524907','Jambeiro','SP','2023-08-17 20:05:38','2023-08-17 20:05:38'),(3551,'3525003','Jandira','SP','2023-08-17 20:05:38','2023-08-17 20:05:38'),(3552,'3525102','Jardinopolis','SP','2023-08-17 20:05:38','2023-08-17 20:05:38'),(3553,'3525201','Jarinu','SP','2023-08-17 20:05:38','2023-08-17 20:05:38'),(3554,'3525300','Jau','SP','2023-08-17 20:05:38','2023-08-17 20:05:38'),(3555,'3525409','Jeriquara','SP','2023-08-17 20:05:38','2023-08-17 20:05:38'),(3556,'3525508','Joanopolis','SP','2023-08-17 20:05:38','2023-08-17 20:05:38'),(3557,'3525607','Joao Ramalho','SP','2023-08-17 20:05:38','2023-08-17 20:05:38'),(3558,'3525706','Jose Bonifacio','SP','2023-08-17 20:05:38','2023-08-17 20:05:38'),(3559,'3525805','Julio Mesquita','SP','2023-08-17 20:05:38','2023-08-17 20:05:38'),(3560,'3525854','Jumirim','SP','2023-08-17 20:05:38','2023-08-17 20:05:38'),(3561,'3525904','Jundiai','SP','2023-08-17 20:05:38','2023-08-17 20:05:38'),(3562,'3526001','Junqueiropolis','SP','2023-08-17 20:05:38','2023-08-17 20:05:38'),(3563,'3526100','Juquia','SP','2023-08-17 20:05:38','2023-08-17 20:05:38'),(3564,'3526209','Juquitiba','SP','2023-08-17 20:05:38','2023-08-17 20:05:38'),(3565,'3526308','Lagoinha','SP','2023-08-17 20:05:38','2023-08-17 20:05:38'),(3566,'3526407','Laranjal Paulista','SP','2023-08-17 20:05:38','2023-08-17 20:05:38'),(3567,'3526506','Lavinia','SP','2023-08-17 20:05:38','2023-08-17 20:05:38'),(3568,'3526605','Lavrinhas','SP','2023-08-17 20:05:38','2023-08-17 20:05:38'),(3569,'3526704','Leme','SP','2023-08-17 20:05:38','2023-08-17 20:05:38'),(3570,'3526803','Lençois Paulista','SP','2023-08-17 20:05:38','2023-08-17 20:05:38'),(3571,'3526902','Limeira','SP','2023-08-17 20:05:38','2023-08-17 20:05:38'),(3572,'3527009','Lindoia','SP','2023-08-17 20:05:38','2023-08-17 20:05:38'),(3573,'3527108','Lins','SP','2023-08-17 20:05:38','2023-08-17 20:05:38'),(3574,'3527207','Lorena','SP','2023-08-17 20:05:38','2023-08-17 20:05:38'),(3575,'3527256','Lourdes','SP','2023-08-17 20:05:38','2023-08-17 20:05:38'),(3576,'3527306','Louveira','SP','2023-08-17 20:05:38','2023-08-17 20:05:38'),(3577,'3527405','Lucelia','SP','2023-08-17 20:05:38','2023-08-17 20:05:38'),(3578,'3527504','Lucianopolis','SP','2023-08-17 20:05:38','2023-08-17 20:05:38'),(3579,'3527603','Luis Antônio','SP','2023-08-17 20:05:38','2023-08-17 20:05:38'),(3580,'3527702','Luiziânia','SP','2023-08-17 20:05:38','2023-08-17 20:05:38'),(3581,'3527801','Lupercio','SP','2023-08-17 20:05:38','2023-08-17 20:05:38'),(3582,'3527900','Lutecia','SP','2023-08-17 20:05:38','2023-08-17 20:05:38'),(3583,'3528007','Macatuba','SP','2023-08-17 20:05:38','2023-08-17 20:05:38'),(3584,'3528106','Macaubal','SP','2023-08-17 20:05:38','2023-08-17 20:05:38'),(3585,'3528205','Macedônia','SP','2023-08-17 20:05:38','2023-08-17 20:05:38'),(3586,'3528304','Magda','SP','2023-08-17 20:05:38','2023-08-17 20:05:38'),(3587,'3528403','Mairinque','SP','2023-08-17 20:05:38','2023-08-17 20:05:38'),(3588,'3528502','Mairipora','SP','2023-08-17 20:05:38','2023-08-17 20:05:38'),(3589,'3528601','Manduri','SP','2023-08-17 20:05:38','2023-08-17 20:05:38'),(3590,'3528700','Maraba Paulista','SP','2023-08-17 20:05:38','2023-08-17 20:05:38'),(3591,'3528809','Maracai','SP','2023-08-17 20:05:38','2023-08-17 20:05:38'),(3592,'3528858','Marapoama','SP','2023-08-17 20:05:38','2023-08-17 20:05:38'),(3593,'3528908','Mariapolis','SP','2023-08-17 20:05:38','2023-08-17 20:05:38'),(3594,'3529005','Marilia','SP','2023-08-17 20:05:38','2023-08-17 20:05:38'),(3595,'3529104','Marinopolis','SP','2023-08-17 20:05:38','2023-08-17 20:05:38'),(3596,'3529203','Martinopolis','SP','2023-08-17 20:05:38','2023-08-17 20:05:38'),(3597,'3529302','Matao','SP','2023-08-17 20:05:38','2023-08-17 20:05:38'),(3598,'3529401','Maua','SP','2023-08-17 20:05:38','2023-08-17 20:05:38'),(3599,'3529500','Mendonça','SP','2023-08-17 20:05:38','2023-08-17 20:05:38'),(3600,'3529609','Meridiano','SP','2023-08-17 20:05:38','2023-08-17 20:05:38'),(3601,'3529658','Mesopolis','SP','2023-08-17 20:05:38','2023-08-17 20:05:38'),(3602,'3529708','Miguelopolis','SP','2023-08-17 20:05:38','2023-08-17 20:05:38'),(3603,'3529807','Mineiros do Tietê','SP','2023-08-17 20:05:39','2023-08-17 20:05:39'),(3604,'3529906','Miracatu','SP','2023-08-17 20:05:39','2023-08-17 20:05:39'),(3605,'3530003','Mira Estrela','SP','2023-08-17 20:05:39','2023-08-17 20:05:39'),(3606,'3530102','Mirandopolis','SP','2023-08-17 20:05:39','2023-08-17 20:05:39'),(3607,'3530201','Mirante do Paranapanema','SP','2023-08-17 20:05:39','2023-08-17 20:05:39'),(3608,'3530300','Mirassol','SP','2023-08-17 20:05:39','2023-08-17 20:05:39'),(3609,'3530409','Mirassolândia','SP','2023-08-17 20:05:39','2023-08-17 20:05:39'),(3610,'3530508','Mococa','SP','2023-08-17 20:05:39','2023-08-17 20:05:39'),(3611,'3530607','Mogi das Cruzes','SP','2023-08-17 20:05:39','2023-08-17 20:05:39'),(3612,'3530706','Mogi Guaçu','SP','2023-08-17 20:05:39','2023-08-17 20:05:39'),(3613,'3530805','Moji Mirim','SP','2023-08-17 20:05:39','2023-08-17 20:05:39'),(3614,'3530904','Mombuca','SP','2023-08-17 20:05:39','2023-08-17 20:05:39'),(3615,'3531001','Monçoes','SP','2023-08-17 20:05:39','2023-08-17 20:05:39'),(3616,'3531100','Mongagua','SP','2023-08-17 20:05:39','2023-08-17 20:05:39'),(3617,'3531209','Monte Alegre do Sul','SP','2023-08-17 20:05:39','2023-08-17 20:05:39'),(3618,'3531308','Monte Alto','SP','2023-08-17 20:05:39','2023-08-17 20:05:39'),(3619,'3531407','Monte Aprazivel','SP','2023-08-17 20:05:39','2023-08-17 20:05:39'),(3620,'3531506','Monte Azul Paulista','SP','2023-08-17 20:05:39','2023-08-17 20:05:39'),(3621,'3531605','Monte Castelo','SP','2023-08-17 20:05:39','2023-08-17 20:05:39'),(3622,'3531704','Monteiro Lobato','SP','2023-08-17 20:05:39','2023-08-17 20:05:39'),(3623,'3531803','Monte Mor','SP','2023-08-17 20:05:39','2023-08-17 20:05:39'),(3624,'3531902','Morro Agudo','SP','2023-08-17 20:05:39','2023-08-17 20:05:39'),(3625,'3532009','Morungaba','SP','2023-08-17 20:05:39','2023-08-17 20:05:39'),(3626,'3532058','Motuca','SP','2023-08-17 20:05:39','2023-08-17 20:05:39'),(3627,'3532108','Murutinga do Sul','SP','2023-08-17 20:05:39','2023-08-17 20:05:39'),(3628,'3532157','Nantes','SP','2023-08-17 20:05:39','2023-08-17 20:05:39'),(3629,'3532207','Narandiba','SP','2023-08-17 20:05:39','2023-08-17 20:05:39'),(3630,'3532306','Natividade da Serra','SP','2023-08-17 20:05:39','2023-08-17 20:05:39'),(3631,'3532405','Nazare Paulista','SP','2023-08-17 20:05:39','2023-08-17 20:05:39'),(3632,'3532504','Neves Paulista','SP','2023-08-17 20:05:39','2023-08-17 20:05:39'),(3633,'3532603','Nhandeara','SP','2023-08-17 20:05:39','2023-08-17 20:05:39'),(3634,'3532702','Nipoa','SP','2023-08-17 20:05:39','2023-08-17 20:05:39'),(3635,'3532801','Nova Aliança','SP','2023-08-17 20:05:39','2023-08-17 20:05:39'),(3636,'3532827','Nova Campina','SP','2023-08-17 20:05:39','2023-08-17 20:05:39'),(3637,'3532843','Nova Canaa Paulista','SP','2023-08-17 20:05:39','2023-08-17 20:05:39'),(3638,'3532868','Nova Castilho','SP','2023-08-17 20:05:39','2023-08-17 20:05:39'),(3639,'3532900','Nova Europa','SP','2023-08-17 20:05:39','2023-08-17 20:05:39'),(3640,'3533007','Nova Granada','SP','2023-08-17 20:05:39','2023-08-17 20:05:39'),(3641,'3533106','Nova Guataporanga','SP','2023-08-17 20:05:39','2023-08-17 20:05:39'),(3642,'3533205','Nova Independência','SP','2023-08-17 20:05:39','2023-08-17 20:05:39'),(3643,'3533254','Novais','SP','2023-08-17 20:05:39','2023-08-17 20:05:39'),(3644,'3533304','Nova Luzitânia','SP','2023-08-17 20:05:39','2023-08-17 20:05:39'),(3645,'3533403','Nova Odessa','SP','2023-08-17 20:05:39','2023-08-17 20:05:39'),(3646,'3533502','Novo Horizonte','SP','2023-08-17 20:05:39','2023-08-17 20:05:39'),(3647,'3533601','Nuporanga','SP','2023-08-17 20:05:39','2023-08-17 20:05:39'),(3648,'3533700','Ocauçu','SP','2023-08-17 20:05:39','2023-08-17 20:05:39'),(3649,'3533809','oleo','SP','2023-08-17 20:05:39','2023-08-17 20:05:39'),(3650,'3533908','Olimpia','SP','2023-08-17 20:05:39','2023-08-17 20:05:39'),(3651,'3534005','Onda Verde','SP','2023-08-17 20:05:39','2023-08-17 20:05:39'),(3652,'3534104','Oriente','SP','2023-08-17 20:05:39','2023-08-17 20:05:39'),(3653,'3534203','Orindiuva','SP','2023-08-17 20:05:39','2023-08-17 20:05:39'),(3654,'3534302','Orlândia','SP','2023-08-17 20:05:39','2023-08-17 20:05:39'),(3655,'3534401','Osasco','SP','2023-08-17 20:05:39','2023-08-17 20:05:39'),(3656,'3534500','Oscar Bressane','SP','2023-08-17 20:05:39','2023-08-17 20:05:39'),(3657,'3534609','Osvaldo Cruz','SP','2023-08-17 20:05:39','2023-08-17 20:05:39'),(3658,'3534708','Ourinhos','SP','2023-08-17 20:05:39','2023-08-17 20:05:39'),(3659,'3534757','Ouroeste','SP','2023-08-17 20:05:39','2023-08-17 20:05:39'),(3660,'3534807','Ouro Verde','SP','2023-08-17 20:05:39','2023-08-17 20:05:39'),(3661,'3534906','Pacaembu','SP','2023-08-17 20:05:39','2023-08-17 20:05:39'),(3662,'3535002','Palestina','SP','2023-08-17 20:05:39','2023-08-17 20:05:39'),(3663,'3535101','Palmares Paulista','SP','2023-08-17 20:05:39','2023-08-17 20:05:39'),(3664,'3535200','Palmeira D\'Oeste','SP','2023-08-17 20:05:39','2023-08-17 20:05:39'),(3665,'3535309','Palmital','SP','2023-08-17 20:05:39','2023-08-17 20:05:39'),(3666,'3535408','Panorama','SP','2023-08-17 20:05:39','2023-08-17 20:05:39'),(3667,'3535507','Paraguaçu Paulista','SP','2023-08-17 20:05:39','2023-08-17 20:05:39'),(3668,'3535606','Paraibuna','SP','2023-08-17 20:05:39','2023-08-17 20:05:39'),(3669,'3535705','Paraiso','SP','2023-08-17 20:05:39','2023-08-17 20:05:39'),(3670,'3535804','Paranapanema','SP','2023-08-17 20:05:39','2023-08-17 20:05:39'),(3671,'3535903','Paranapua','SP','2023-08-17 20:05:39','2023-08-17 20:05:39'),(3672,'3536000','Parapua','SP','2023-08-17 20:05:39','2023-08-17 20:05:39'),(3673,'3536109','Pardinho','SP','2023-08-17 20:05:39','2023-08-17 20:05:39'),(3674,'3536208','Pariquera-Açu','SP','2023-08-17 20:05:39','2023-08-17 20:05:39'),(3675,'3536257','Parisi','SP','2023-08-17 20:05:39','2023-08-17 20:05:39'),(3676,'3536307','Patrocinio Paulista','SP','2023-08-17 20:05:39','2023-08-17 20:05:39'),(3677,'3536406','Pauliceia','SP','2023-08-17 20:05:39','2023-08-17 20:05:39'),(3678,'3536505','Paulinia','SP','2023-08-17 20:05:39','2023-08-17 20:05:39'),(3679,'3536570','Paulistânia','SP','2023-08-17 20:05:39','2023-08-17 20:05:39'),(3680,'3536604','Paulo de Faria','SP','2023-08-17 20:05:39','2023-08-17 20:05:39'),(3681,'3536703','Pederneiras','SP','2023-08-17 20:05:39','2023-08-17 20:05:39'),(3682,'3536802','Pedra Bela','SP','2023-08-17 20:05:39','2023-08-17 20:05:39'),(3683,'3536901','Pedranopolis','SP','2023-08-17 20:05:39','2023-08-17 20:05:39'),(3684,'3537008','Pedregulho','SP','2023-08-17 20:05:39','2023-08-17 20:05:39'),(3685,'3537107','Pedreira','SP','2023-08-17 20:05:39','2023-08-17 20:05:39'),(3686,'3537156','Pedrinhas Paulista','SP','2023-08-17 20:05:39','2023-08-17 20:05:39'),(3687,'3537206','Pedro de Toledo','SP','2023-08-17 20:05:39','2023-08-17 20:05:39'),(3688,'3537305','Penapolis','SP','2023-08-17 20:05:39','2023-08-17 20:05:39'),(3689,'3537404','Pereira Barreto','SP','2023-08-17 20:05:39','2023-08-17 20:05:39'),(3690,'3537503','Pereiras','SP','2023-08-17 20:05:39','2023-08-17 20:05:39'),(3691,'3537602','Peruibe','SP','2023-08-17 20:05:39','2023-08-17 20:05:39'),(3692,'3537701','Piacatu','SP','2023-08-17 20:05:39','2023-08-17 20:05:39'),(3693,'3537800','Piedade','SP','2023-08-17 20:05:39','2023-08-17 20:05:39'),(3694,'3537909','Pilar do Sul','SP','2023-08-17 20:05:39','2023-08-17 20:05:39'),(3695,'3538006','Pindamonhangaba','SP','2023-08-17 20:05:39','2023-08-17 20:05:39'),(3696,'3538105','Pindorama','SP','2023-08-17 20:05:39','2023-08-17 20:05:39'),(3697,'3538204','Pinhalzinho','SP','2023-08-17 20:05:39','2023-08-17 20:05:39'),(3698,'3538303','Piquerobi','SP','2023-08-17 20:05:39','2023-08-17 20:05:39'),(3699,'3538501','Piquete','SP','2023-08-17 20:05:39','2023-08-17 20:05:39'),(3700,'3538600','Piracaia','SP','2023-08-17 20:05:39','2023-08-17 20:05:39'),(3701,'3538709','Piracicaba','SP','2023-08-17 20:05:39','2023-08-17 20:05:39'),(3702,'3538808','Piraju','SP','2023-08-17 20:05:39','2023-08-17 20:05:39'),(3703,'3538907','Pirajui','SP','2023-08-17 20:05:39','2023-08-17 20:05:39'),(3704,'3539004','Pirangi','SP','2023-08-17 20:05:39','2023-08-17 20:05:39'),(3705,'3539103','Pirapora do Bom Jesus','SP','2023-08-17 20:05:39','2023-08-17 20:05:39'),(3706,'3539202','Pirapozinho','SP','2023-08-17 20:05:39','2023-08-17 20:05:39'),(3707,'3539301','Pirassununga','SP','2023-08-17 20:05:39','2023-08-17 20:05:39'),(3708,'3539400','Piratininga','SP','2023-08-17 20:05:39','2023-08-17 20:05:39'),(3709,'3539509','Pitangueiras','SP','2023-08-17 20:05:39','2023-08-17 20:05:39'),(3710,'3539608','Planalto','SP','2023-08-17 20:05:39','2023-08-17 20:05:39'),(3711,'3539707','Platina','SP','2023-08-17 20:05:39','2023-08-17 20:05:39'),(3712,'3539806','Poa','SP','2023-08-17 20:05:39','2023-08-17 20:05:39'),(3713,'3539905','Poloni','SP','2023-08-17 20:05:39','2023-08-17 20:05:39'),(3714,'3540002','Pompeia','SP','2023-08-17 20:05:39','2023-08-17 20:05:39'),(3715,'3540101','Pongai','SP','2023-08-17 20:05:39','2023-08-17 20:05:39'),(3716,'3540200','Pontal','SP','2023-08-17 20:05:39','2023-08-17 20:05:39'),(3717,'3540259','Pontalinda','SP','2023-08-17 20:05:39','2023-08-17 20:05:39'),(3718,'3540309','Pontes Gestal','SP','2023-08-17 20:05:39','2023-08-17 20:05:39'),(3719,'3540408','Populina','SP','2023-08-17 20:05:39','2023-08-17 20:05:39'),(3720,'3540507','Porangaba','SP','2023-08-17 20:05:39','2023-08-17 20:05:39'),(3721,'3540606','Porto Feliz','SP','2023-08-17 20:05:39','2023-08-17 20:05:39'),(3722,'3540705','Porto Ferreira','SP','2023-08-17 20:05:39','2023-08-17 20:05:39'),(3723,'3540754','Potim','SP','2023-08-17 20:05:39','2023-08-17 20:05:39'),(3724,'3540804','Potirendaba','SP','2023-08-17 20:05:39','2023-08-17 20:05:39'),(3725,'3540853','Pracinha','SP','2023-08-17 20:05:39','2023-08-17 20:05:39'),(3726,'3540903','Pradopolis','SP','2023-08-17 20:05:39','2023-08-17 20:05:39'),(3727,'3541000','Praia Grande','SP','2023-08-17 20:05:39','2023-08-17 20:05:39'),(3728,'3541059','Pratânia','SP','2023-08-17 20:05:39','2023-08-17 20:05:39'),(3729,'3541109','Presidente Alves','SP','2023-08-17 20:05:39','2023-08-17 20:05:39'),(3730,'3541208','Presidente Bernardes','SP','2023-08-17 20:05:39','2023-08-17 20:05:39'),(3731,'3541307','Presidente Epitacio','SP','2023-08-17 20:05:39','2023-08-17 20:05:39'),(3732,'3541406','Presidente Prudente','SP','2023-08-17 20:05:39','2023-08-17 20:05:39'),(3733,'3541505','Presidente Venceslau','SP','2023-08-17 20:05:39','2023-08-17 20:05:39'),(3734,'3541604','Promissao','SP','2023-08-17 20:05:39','2023-08-17 20:05:39'),(3735,'3541653','Quadra','SP','2023-08-17 20:05:39','2023-08-17 20:05:39'),(3736,'3541703','Quata','SP','2023-08-17 20:05:39','2023-08-17 20:05:39'),(3737,'3541802','Queiroz','SP','2023-08-17 20:05:39','2023-08-17 20:05:39'),(3738,'3541901','Queluz','SP','2023-08-17 20:05:39','2023-08-17 20:05:39'),(3739,'3542008','Quintana','SP','2023-08-17 20:05:39','2023-08-17 20:05:39'),(3740,'3542107','Rafard','SP','2023-08-17 20:05:39','2023-08-17 20:05:39'),(3741,'3542206','Rancharia','SP','2023-08-17 20:05:39','2023-08-17 20:05:39'),(3742,'3542305','Redençao da Serra','SP','2023-08-17 20:05:39','2023-08-17 20:05:39'),(3743,'3542404','Regente Feijo','SP','2023-08-17 20:05:39','2023-08-17 20:05:39'),(3744,'3542503','Reginopolis','SP','2023-08-17 20:05:39','2023-08-17 20:05:39'),(3745,'3542602','Registro','SP','2023-08-17 20:05:39','2023-08-17 20:05:39'),(3746,'3542701','Restinga','SP','2023-08-17 20:05:39','2023-08-17 20:05:39'),(3747,'3542800','Ribeira','SP','2023-08-17 20:05:39','2023-08-17 20:05:39'),(3748,'3542909','Ribeirao Bonito','SP','2023-08-17 20:05:39','2023-08-17 20:05:39'),(3749,'3543006','Ribeirao Branco','SP','2023-08-17 20:05:39','2023-08-17 20:05:39'),(3750,'3543105','Ribeirao Corrente','SP','2023-08-17 20:05:39','2023-08-17 20:05:39'),(3751,'3543204','Ribeirao do Sul','SP','2023-08-17 20:05:39','2023-08-17 20:05:39'),(3752,'3543238','Ribeirao dos indios','SP','2023-08-17 20:05:39','2023-08-17 20:05:39'),(3753,'3543253','Ribeirao Grande','SP','2023-08-17 20:05:39','2023-08-17 20:05:39'),(3754,'3543303','Ribeirao Pires','SP','2023-08-17 20:05:39','2023-08-17 20:05:39'),(3755,'3543402','Ribeirao Preto','SP','2023-08-17 20:05:39','2023-08-17 20:05:39'),(3756,'3543501','Riversul','SP','2023-08-17 20:05:39','2023-08-17 20:05:39'),(3757,'3543600','Rifaina','SP','2023-08-17 20:05:39','2023-08-17 20:05:39'),(3758,'3543709','Rincao','SP','2023-08-17 20:05:39','2023-08-17 20:05:39'),(3759,'3543808','Rinopolis','SP','2023-08-17 20:05:39','2023-08-17 20:05:39'),(3760,'3543907','Rio Claro','SP','2023-08-17 20:05:39','2023-08-17 20:05:39'),(3761,'3544004','Rio das Pedras','SP','2023-08-17 20:05:39','2023-08-17 20:05:39'),(3762,'3544103','Rio Grande da Serra','SP','2023-08-17 20:05:39','2023-08-17 20:05:39'),(3763,'3544202','Riolândia','SP','2023-08-17 20:05:39','2023-08-17 20:05:39'),(3764,'3544251','Rosana','SP','2023-08-17 20:05:39','2023-08-17 20:05:39'),(3765,'3544301','Roseira','SP','2023-08-17 20:05:39','2023-08-17 20:05:39'),(3766,'3544400','Rubiacea','SP','2023-08-17 20:05:39','2023-08-17 20:05:39'),(3767,'3544509','Rubineia','SP','2023-08-17 20:05:39','2023-08-17 20:05:39'),(3768,'3544608','Sabino','SP','2023-08-17 20:05:39','2023-08-17 20:05:39'),(3769,'3544707','Sagres','SP','2023-08-17 20:05:39','2023-08-17 20:05:39'),(3770,'3544806','Sales','SP','2023-08-17 20:05:39','2023-08-17 20:05:39'),(3771,'3544905','Sales Oliveira','SP','2023-08-17 20:05:39','2023-08-17 20:05:39'),(3772,'3545001','Salesopolis','SP','2023-08-17 20:05:39','2023-08-17 20:05:39'),(3773,'3545100','Salmourao','SP','2023-08-17 20:05:39','2023-08-17 20:05:39'),(3774,'3545159','Saltinho','SP','2023-08-17 20:05:39','2023-08-17 20:05:39'),(3775,'3545209','Salto','SP','2023-08-17 20:05:39','2023-08-17 20:05:39'),(3776,'3545308','Salto de Pirapora','SP','2023-08-17 20:05:39','2023-08-17 20:05:39'),(3777,'3545407','Salto Grande','SP','2023-08-17 20:05:39','2023-08-17 20:05:39'),(3778,'3545506','Sandovalina','SP','2023-08-17 20:05:39','2023-08-17 20:05:39'),(3779,'3545605','Santa Adelia','SP','2023-08-17 20:05:39','2023-08-17 20:05:39'),(3780,'3545704','Santa Albertina','SP','2023-08-17 20:05:39','2023-08-17 20:05:39'),(3781,'3545803','Santa Barbara D\'Oeste','SP','2023-08-17 20:05:39','2023-08-17 20:05:39'),(3782,'3546009','Santa Branca','SP','2023-08-17 20:05:39','2023-08-17 20:05:39'),(3783,'3546108','Santa Clara D\'Oeste','SP','2023-08-17 20:05:39','2023-08-17 20:05:39'),(3784,'3546207','Santa Cruz da Conceiçao','SP','2023-08-17 20:05:39','2023-08-17 20:05:39'),(3785,'3546256','Santa Cruz da Esperança','SP','2023-08-17 20:05:39','2023-08-17 20:05:39'),(3786,'3546306','Santa Cruz das Palmeiras','SP','2023-08-17 20:05:39','2023-08-17 20:05:39'),(3787,'3546405','Santa Cruz do Rio Pardo','SP','2023-08-17 20:05:39','2023-08-17 20:05:39'),(3788,'3546504','Santa Ernestina','SP','2023-08-17 20:05:39','2023-08-17 20:05:39'),(3789,'3546603','Santa Fe do Sul','SP','2023-08-17 20:05:39','2023-08-17 20:05:39'),(3790,'3546702','Santa Gertrudes','SP','2023-08-17 20:05:39','2023-08-17 20:05:39'),(3791,'3546801','Santa Isabel','SP','2023-08-17 20:05:39','2023-08-17 20:05:39'),(3792,'3546900','Santa Lucia','SP','2023-08-17 20:05:39','2023-08-17 20:05:39'),(3793,'3547007','Santa Maria da Serra','SP','2023-08-17 20:05:39','2023-08-17 20:05:39'),(3794,'3547106','Santa Mercedes','SP','2023-08-17 20:05:39','2023-08-17 20:05:39'),(3795,'3547205','Santana da Ponte Pensa','SP','2023-08-17 20:05:39','2023-08-17 20:05:39'),(3796,'3547304','Santana de Parnaiba','SP','2023-08-17 20:05:39','2023-08-17 20:05:39'),(3797,'3547403','Santa Rita D\'Oeste','SP','2023-08-17 20:05:39','2023-08-17 20:05:39'),(3798,'3547502','Santa Rita do Passa Quatro','SP','2023-08-17 20:05:39','2023-08-17 20:05:39'),(3799,'3547601','Santa Rosa de Viterbo','SP','2023-08-17 20:05:39','2023-08-17 20:05:39'),(3800,'3547650','Santa Salete','SP','2023-08-17 20:05:39','2023-08-17 20:05:39'),(3801,'3547700','Santo Anastacio','SP','2023-08-17 20:05:39','2023-08-17 20:05:39'),(3802,'3547809','Santo Andre','SP','2023-08-17 20:05:39','2023-08-17 20:05:39'),(3803,'3547908','Santo Antônio da Alegria','SP','2023-08-17 20:05:39','2023-08-17 20:05:39'),(3804,'3548005','Santo Antônio de Posse','SP','2023-08-17 20:05:39','2023-08-17 20:05:39'),(3805,'3548054','Santo Antônio do Aracangua','SP','2023-08-17 20:05:39','2023-08-17 20:05:39'),(3806,'3548104','Santo Antônio do Jardim','SP','2023-08-17 20:05:39','2023-08-17 20:05:39'),(3807,'3548203','Santo Antônio do Pinhal','SP','2023-08-17 20:05:39','2023-08-17 20:05:39'),(3808,'3548302','Santo Expedito','SP','2023-08-17 20:05:39','2023-08-17 20:05:39'),(3809,'3548401','Santopolis do Aguapei','SP','2023-08-17 20:05:39','2023-08-17 20:05:39'),(3810,'3548500','Santos','SP','2023-08-17 20:05:39','2023-08-17 20:05:39'),(3811,'3548609','Sao Bento do Sapucai','SP','2023-08-17 20:05:39','2023-08-17 20:05:39'),(3812,'3548708','Sao Bernardo do Campo','SP','2023-08-17 20:05:39','2023-08-17 20:05:39'),(3813,'3548807','Sao Caetano do Sul','SP','2023-08-17 20:05:39','2023-08-17 20:05:39'),(3814,'3548906','Sao Carlos','SP','2023-08-17 20:05:39','2023-08-17 20:05:39'),(3815,'3549003','Sao Francisco','SP','2023-08-17 20:05:39','2023-08-17 20:05:39'),(3816,'3549102','Sao Joao da Boa Vista','SP','2023-08-17 20:05:39','2023-08-17 20:05:39'),(3817,'3549201','Sao Joao das Duas Pontes','SP','2023-08-17 20:05:39','2023-08-17 20:05:39'),(3818,'3549250','Sao Joao de Iracema','SP','2023-08-17 20:05:39','2023-08-17 20:05:39'),(3819,'3549300','Sao Joao do Pau D\'Alho','SP','2023-08-17 20:05:39','2023-08-17 20:05:39'),(3820,'3549409','Sao Joaquim da Barra','SP','2023-08-17 20:05:39','2023-08-17 20:05:39'),(3821,'3549508','Sao Jose da Bela Vista','SP','2023-08-17 20:05:39','2023-08-17 20:05:39'),(3822,'3549607','Sao Jose do Barreiro','SP','2023-08-17 20:05:39','2023-08-17 20:05:39'),(3823,'3549706','Sao Jose do Rio Pardo','SP','2023-08-17 20:05:39','2023-08-17 20:05:39'),(3824,'3549805','Sao Jose do Rio Preto','SP','2023-08-17 20:05:39','2023-08-17 20:05:39'),(3825,'3549904','Sao Jose dos Campos','SP','2023-08-17 20:05:39','2023-08-17 20:05:39'),(3826,'3549953','Sao Lourenço da Serra','SP','2023-08-17 20:05:40','2023-08-17 20:05:40'),(3827,'3550001','Sao Luis do Paraitinga','SP','2023-08-17 20:05:40','2023-08-17 20:05:40'),(3828,'3550100','Sao Manuel','SP','2023-08-17 20:05:40','2023-08-17 20:05:40'),(3829,'3550209','Sao Miguel Arcanjo','SP','2023-08-17 20:05:40','2023-08-17 20:05:40'),(3830,'3550308','Sao Paulo','SP','2023-08-17 20:05:40','2023-08-17 20:05:40'),(3831,'3550407','Sao Pedro','SP','2023-08-17 20:05:40','2023-08-17 20:05:40'),(3832,'3550506','Sao Pedro do Turvo','SP','2023-08-17 20:05:40','2023-08-17 20:05:40'),(3833,'3550605','Sao Roque','SP','2023-08-17 20:05:40','2023-08-17 20:05:40'),(3834,'3550704','Sao Sebastiao','SP','2023-08-17 20:05:40','2023-08-17 20:05:40'),(3835,'3550803','Sao Sebastiao da Grama','SP','2023-08-17 20:05:40','2023-08-17 20:05:40'),(3836,'3550902','Sao Simao','SP','2023-08-17 20:05:40','2023-08-17 20:05:40'),(3837,'3551009','Sao Vicente','SP','2023-08-17 20:05:40','2023-08-17 20:05:40'),(3838,'3551108','Sarapui','SP','2023-08-17 20:05:40','2023-08-17 20:05:40'),(3839,'3551207','Sarutaia','SP','2023-08-17 20:05:40','2023-08-17 20:05:40'),(3840,'3551306','Sebastianopolis do Sul','SP','2023-08-17 20:05:40','2023-08-17 20:05:40'),(3841,'3551405','Serra Azul','SP','2023-08-17 20:05:40','2023-08-17 20:05:40'),(3842,'3551504','Serrana','SP','2023-08-17 20:05:40','2023-08-17 20:05:40'),(3843,'3551603','Serra Negra','SP','2023-08-17 20:05:40','2023-08-17 20:05:40'),(3844,'3551702','Sertaozinho','SP','2023-08-17 20:05:40','2023-08-17 20:05:40'),(3845,'3551801','Sete Barras','SP','2023-08-17 20:05:40','2023-08-17 20:05:40'),(3846,'3551900','Severinia','SP','2023-08-17 20:05:40','2023-08-17 20:05:40'),(3847,'3552007','Silveiras','SP','2023-08-17 20:05:40','2023-08-17 20:05:40'),(3848,'3552106','Socorro','SP','2023-08-17 20:05:40','2023-08-17 20:05:40'),(3849,'3552205','Sorocaba','SP','2023-08-17 20:05:40','2023-08-17 20:05:40'),(3850,'3552304','Sud Mennucci','SP','2023-08-17 20:05:40','2023-08-17 20:05:40'),(3851,'3552403','Sumare','SP','2023-08-17 20:05:40','2023-08-17 20:05:40'),(3852,'3552502','Suzano','SP','2023-08-17 20:05:40','2023-08-17 20:05:40'),(3853,'3552551','Suzanapolis','SP','2023-08-17 20:05:40','2023-08-17 20:05:40'),(3854,'3552601','Tabapua','SP','2023-08-17 20:05:40','2023-08-17 20:05:40'),(3855,'3552700','Tabatinga','SP','2023-08-17 20:05:40','2023-08-17 20:05:40'),(3856,'3552809','Taboao da Serra','SP','2023-08-17 20:05:40','2023-08-17 20:05:40'),(3857,'3552908','Taciba','SP','2023-08-17 20:05:40','2023-08-17 20:05:40'),(3858,'3553005','Taguai','SP','2023-08-17 20:05:40','2023-08-17 20:05:40'),(3859,'3553104','Taiaçu','SP','2023-08-17 20:05:40','2023-08-17 20:05:40'),(3860,'3553203','Taiuva','SP','2023-08-17 20:05:40','2023-08-17 20:05:40'),(3861,'3553302','Tambau','SP','2023-08-17 20:05:40','2023-08-17 20:05:40'),(3862,'3553401','Tanabi','SP','2023-08-17 20:05:40','2023-08-17 20:05:40'),(3863,'3553500','Tapirai','SP','2023-08-17 20:05:40','2023-08-17 20:05:40'),(3864,'3553609','Tapiratiba','SP','2023-08-17 20:05:40','2023-08-17 20:05:40'),(3865,'3553658','Taquaral','SP','2023-08-17 20:05:40','2023-08-17 20:05:40'),(3866,'3553708','Taquaritinga','SP','2023-08-17 20:05:40','2023-08-17 20:05:40'),(3867,'3553807','Taquarituba','SP','2023-08-17 20:05:40','2023-08-17 20:05:40'),(3868,'3553856','Taquarivai','SP','2023-08-17 20:05:40','2023-08-17 20:05:40'),(3869,'3553906','Tarabai','SP','2023-08-17 20:05:40','2023-08-17 20:05:40'),(3870,'3553955','Taruma','SP','2023-08-17 20:05:40','2023-08-17 20:05:40'),(3871,'3554003','Tatui','SP','2023-08-17 20:05:40','2023-08-17 20:05:40'),(3872,'3554102','Taubate','SP','2023-08-17 20:05:40','2023-08-17 20:05:40'),(3873,'3554201','Tejupa','SP','2023-08-17 20:05:40','2023-08-17 20:05:40'),(3874,'3554300','Teodoro Sampaio','SP','2023-08-17 20:05:40','2023-08-17 20:05:40'),(3875,'3554409','Terra Roxa','SP','2023-08-17 20:05:40','2023-08-17 20:05:40'),(3876,'3554508','Tietê','SP','2023-08-17 20:05:40','2023-08-17 20:05:40'),(3877,'3554607','Timburi','SP','2023-08-17 20:05:40','2023-08-17 20:05:40'),(3878,'3554656','Torre de Pedra','SP','2023-08-17 20:05:40','2023-08-17 20:05:40'),(3879,'3554706','Torrinha','SP','2023-08-17 20:05:40','2023-08-17 20:05:40'),(3880,'3554755','Trabiju','SP','2023-08-17 20:05:40','2023-08-17 20:05:40'),(3881,'3554805','Tremembe','SP','2023-08-17 20:05:40','2023-08-17 20:05:40'),(3882,'3554904','Três Fronteiras','SP','2023-08-17 20:05:40','2023-08-17 20:05:40'),(3883,'3554953','Tuiuti','SP','2023-08-17 20:05:40','2023-08-17 20:05:40'),(3884,'3555000','Tupa','SP','2023-08-17 20:05:40','2023-08-17 20:05:40'),(3885,'3555109','Tupi Paulista','SP','2023-08-17 20:05:40','2023-08-17 20:05:40'),(3886,'3555208','Turiuba','SP','2023-08-17 20:05:40','2023-08-17 20:05:40'),(3887,'3555307','Turmalina','SP','2023-08-17 20:05:40','2023-08-17 20:05:40'),(3888,'3555356','Ubarana','SP','2023-08-17 20:05:40','2023-08-17 20:05:40'),(3889,'3555406','Ubatuba','SP','2023-08-17 20:05:40','2023-08-17 20:05:40'),(3890,'3555505','Ubirajara','SP','2023-08-17 20:05:40','2023-08-17 20:05:40'),(3891,'3555604','Uchoa','SP','2023-08-17 20:05:40','2023-08-17 20:05:40'),(3892,'3555703','Uniao Paulista','SP','2023-08-17 20:05:40','2023-08-17 20:05:40'),(3893,'3555802','Urânia','SP','2023-08-17 20:05:40','2023-08-17 20:05:40'),(3894,'3555901','Uru','SP','2023-08-17 20:05:40','2023-08-17 20:05:40'),(3895,'3556008','Urupês','SP','2023-08-17 20:05:40','2023-08-17 20:05:40'),(3896,'3556107','Valentim Gentil','SP','2023-08-17 20:05:40','2023-08-17 20:05:40'),(3897,'3556206','Valinhos','SP','2023-08-17 20:05:40','2023-08-17 20:05:40'),(3898,'3556305','Valparaiso','SP','2023-08-17 20:05:40','2023-08-17 20:05:40'),(3899,'3556354','Vargem','SP','2023-08-17 20:05:40','2023-08-17 20:05:40'),(3900,'3556404','Vargem Grande do Sul','SP','2023-08-17 20:05:40','2023-08-17 20:05:40'),(3901,'3556453','Vargem Grande Paulista','SP','2023-08-17 20:05:40','2023-08-17 20:05:40'),(3902,'3556503','Varzea Paulista','SP','2023-08-17 20:05:40','2023-08-17 20:05:40'),(3903,'3556602','Vera Cruz','SP','2023-08-17 20:05:40','2023-08-17 20:05:40'),(3904,'3556701','Vinhedo','SP','2023-08-17 20:05:40','2023-08-17 20:05:40'),(3905,'3556800','Viradouro','SP','2023-08-17 20:05:40','2023-08-17 20:05:40'),(3906,'3556909','Vista Alegre do Alto','SP','2023-08-17 20:05:40','2023-08-17 20:05:40'),(3907,'3556958','Vitoria Brasil','SP','2023-08-17 20:05:40','2023-08-17 20:05:40'),(3908,'3557006','Votorantim','SP','2023-08-17 20:05:40','2023-08-17 20:05:40'),(3909,'3557105','Votuporanga','SP','2023-08-17 20:05:40','2023-08-17 20:05:40'),(3910,'3557154','Zacarias','SP','2023-08-17 20:05:40','2023-08-17 20:05:40'),(3911,'3557204','Chavantes','SP','2023-08-17 20:05:40','2023-08-17 20:05:40'),(3912,'3557303','Estiva Gerbi','SP','2023-08-17 20:05:40','2023-08-17 20:05:40'),(3913,'4100103','Abatia','PR','2023-08-17 20:05:40','2023-08-17 20:05:40'),(3914,'4100202','Adrianopolis','PR','2023-08-17 20:05:40','2023-08-17 20:05:40'),(3915,'4100301','Agudos do Sul','PR','2023-08-17 20:05:40','2023-08-17 20:05:40'),(3916,'4100400','Almirante Tamandare','PR','2023-08-17 20:05:40','2023-08-17 20:05:40'),(3917,'4100459','Altamira do Parana','PR','2023-08-17 20:05:40','2023-08-17 20:05:40'),(3918,'4100509','Altônia','PR','2023-08-17 20:05:40','2023-08-17 20:05:40'),(3919,'4100608','Alto Parana','PR','2023-08-17 20:05:40','2023-08-17 20:05:40'),(3920,'4100707','Alto Piquiri','PR','2023-08-17 20:05:40','2023-08-17 20:05:40'),(3921,'4100806','Alvorada do Sul','PR','2023-08-17 20:05:40','2023-08-17 20:05:40'),(3922,'4100905','Amapora','PR','2023-08-17 20:05:40','2023-08-17 20:05:40'),(3923,'4101002','Ampere','PR','2023-08-17 20:05:40','2023-08-17 20:05:40'),(3924,'4101051','Anahy','PR','2023-08-17 20:05:40','2023-08-17 20:05:40'),(3925,'4101101','Andira','PR','2023-08-17 20:05:40','2023-08-17 20:05:40'),(3926,'4101150','Ângulo','PR','2023-08-17 20:05:40','2023-08-17 20:05:40'),(3927,'4101200','Antonina','PR','2023-08-17 20:05:40','2023-08-17 20:05:40'),(3928,'4101309','Antônio Olinto','PR','2023-08-17 20:05:40','2023-08-17 20:05:40'),(3929,'4101408','Apucarana','PR','2023-08-17 20:05:40','2023-08-17 20:05:40'),(3930,'4101507','Arapongas','PR','2023-08-17 20:05:40','2023-08-17 20:05:40'),(3931,'4101606','Arapoti','PR','2023-08-17 20:05:40','2023-08-17 20:05:40'),(3932,'4101655','Arapua','PR','2023-08-17 20:05:40','2023-08-17 20:05:40'),(3933,'4101705','Araruna','PR','2023-08-17 20:05:40','2023-08-17 20:05:40'),(3934,'4101804','Araucaria','PR','2023-08-17 20:05:40','2023-08-17 20:05:40'),(3935,'4101853','Ariranha do Ivai','PR','2023-08-17 20:05:40','2023-08-17 20:05:40'),(3936,'4101903','Assai','PR','2023-08-17 20:05:40','2023-08-17 20:05:40'),(3937,'4102000','Assis Chateaubriand','PR','2023-08-17 20:05:40','2023-08-17 20:05:40'),(3938,'4102109','Astorga','PR','2023-08-17 20:05:40','2023-08-17 20:05:40'),(3939,'4102208','Atalaia','PR','2023-08-17 20:05:40','2023-08-17 20:05:40'),(3940,'4102307','Balsa Nova','PR','2023-08-17 20:05:40','2023-08-17 20:05:40'),(3941,'4102406','Bandeirantes','PR','2023-08-17 20:05:40','2023-08-17 20:05:40'),(3942,'4102505','Barbosa Ferraz','PR','2023-08-17 20:05:40','2023-08-17 20:05:40'),(3943,'4102604','Barracao','PR','2023-08-17 20:05:40','2023-08-17 20:05:40'),(3944,'4102703','Barra do Jacare','PR','2023-08-17 20:05:40','2023-08-17 20:05:40'),(3945,'4102752','Bela Vista da Caroba','PR','2023-08-17 20:05:40','2023-08-17 20:05:40'),(3946,'4102802','Bela Vista do Paraiso','PR','2023-08-17 20:05:40','2023-08-17 20:05:40'),(3947,'4102901','Bituruna','PR','2023-08-17 20:05:40','2023-08-17 20:05:40'),(3948,'4103008','Boa Esperança','PR','2023-08-17 20:05:40','2023-08-17 20:05:40'),(3949,'4103024','Boa Esperança do Iguaçu','PR','2023-08-17 20:05:40','2023-08-17 20:05:40'),(3950,'4103040','Boa Ventura de Sao Roque','PR','2023-08-17 20:05:40','2023-08-17 20:05:40'),(3951,'4103057','Boa Vista da Aparecida','PR','2023-08-17 20:05:40','2023-08-17 20:05:40'),(3952,'4103107','Bocaiuva do Sul','PR','2023-08-17 20:05:40','2023-08-17 20:05:40'),(3953,'4103156','Bom Jesus do Sul','PR','2023-08-17 20:05:40','2023-08-17 20:05:40'),(3954,'4103206','Bom Sucesso','PR','2023-08-17 20:05:40','2023-08-17 20:05:40'),(3955,'4103222','Bom Sucesso do Sul','PR','2023-08-17 20:05:40','2023-08-17 20:05:40'),(3956,'4103305','Borrazopolis','PR','2023-08-17 20:05:40','2023-08-17 20:05:40'),(3957,'4103354','Braganey','PR','2023-08-17 20:05:40','2023-08-17 20:05:40'),(3958,'4103370','Brasilândia do Sul','PR','2023-08-17 20:05:40','2023-08-17 20:05:40'),(3959,'4103404','Cafeara','PR','2023-08-17 20:05:40','2023-08-17 20:05:40'),(3960,'4103453','Cafelândia','PR','2023-08-17 20:05:40','2023-08-17 20:05:40'),(3961,'4103479','Cafezal do Sul','PR','2023-08-17 20:05:40','2023-08-17 20:05:40'),(3962,'4103503','California','PR','2023-08-17 20:05:40','2023-08-17 20:05:40'),(3963,'4103602','Cambara','PR','2023-08-17 20:05:40','2023-08-17 20:05:40'),(3964,'4103701','Cambe','PR','2023-08-17 20:05:40','2023-08-17 20:05:40'),(3965,'4103800','Cambira','PR','2023-08-17 20:05:40','2023-08-17 20:05:40'),(3966,'4103909','Campina da Lagoa','PR','2023-08-17 20:05:40','2023-08-17 20:05:40'),(3967,'4103958','Campina do Simao','PR','2023-08-17 20:05:40','2023-08-17 20:05:40'),(3968,'4104006','Campina Grande do Sul','PR','2023-08-17 20:05:40','2023-08-17 20:05:40'),(3969,'4104055','Campo Bonito','PR','2023-08-17 20:05:40','2023-08-17 20:05:40'),(3970,'4104105','Campo do Tenente','PR','2023-08-17 20:05:40','2023-08-17 20:05:40'),(3971,'4104204','Campo Largo','PR','2023-08-17 20:05:40','2023-08-17 20:05:40'),(3972,'4104253','Campo Magro','PR','2023-08-17 20:05:40','2023-08-17 20:05:40'),(3973,'4104303','Campo Mourao','PR','2023-08-17 20:05:40','2023-08-17 20:05:40'),(3974,'4104402','Cândido de Abreu','PR','2023-08-17 20:05:40','2023-08-17 20:05:40'),(3975,'4104428','Candoi','PR','2023-08-17 20:05:40','2023-08-17 20:05:40'),(3976,'4104451','Cantagalo','PR','2023-08-17 20:05:40','2023-08-17 20:05:40'),(3977,'4104501','Capanema','PR','2023-08-17 20:05:40','2023-08-17 20:05:40'),(3978,'4104600','Capitao Leônidas Marques','PR','2023-08-17 20:05:40','2023-08-17 20:05:40'),(3979,'4104659','Carambei','PR','2023-08-17 20:05:40','2023-08-17 20:05:40'),(3980,'4104709','Carlopolis','PR','2023-08-17 20:05:40','2023-08-17 20:05:40'),(3981,'4104808','Cascavel','PR','2023-08-17 20:05:40','2023-08-17 20:05:40'),(3982,'4104907','Castro','PR','2023-08-17 20:05:40','2023-08-17 20:05:40'),(3983,'4105003','Catanduvas','PR','2023-08-17 20:05:40','2023-08-17 20:05:40'),(3984,'4105102','Centenario do Sul','PR','2023-08-17 20:05:40','2023-08-17 20:05:40'),(3985,'4105201','Cerro Azul','PR','2023-08-17 20:05:40','2023-08-17 20:05:40'),(3986,'4105300','Ceu Azul','PR','2023-08-17 20:05:40','2023-08-17 20:05:40'),(3987,'4105409','Chopinzinho','PR','2023-08-17 20:05:40','2023-08-17 20:05:40'),(3988,'4105508','Cianorte','PR','2023-08-17 20:05:40','2023-08-17 20:05:40'),(3989,'4105607','cidades Gaucha','PR','2023-08-17 20:05:40','2023-08-17 20:05:40'),(3990,'4105706','Clevelândia','PR','2023-08-17 20:05:40','2023-08-17 20:05:40'),(3991,'4105805','Colombo','PR','2023-08-17 20:05:40','2023-08-17 20:05:40'),(3992,'4105904','Colorado','PR','2023-08-17 20:05:40','2023-08-17 20:05:40'),(3993,'4106001','Congonhinhas','PR','2023-08-17 20:05:40','2023-08-17 20:05:40'),(3994,'4106100','Conselheiro Mairinck','PR','2023-08-17 20:05:40','2023-08-17 20:05:40'),(3995,'4106209','Contenda','PR','2023-08-17 20:05:40','2023-08-17 20:05:40'),(3996,'4106308','Corbelia','PR','2023-08-17 20:05:40','2023-08-17 20:05:40'),(3997,'4106407','Cornelio Procopio','PR','2023-08-17 20:05:40','2023-08-17 20:05:40'),(3998,'4106456','Coronel Domingos Soares','PR','2023-08-17 20:05:40','2023-08-17 20:05:40'),(3999,'4106506','Coronel Vivida','PR','2023-08-17 20:05:40','2023-08-17 20:05:40'),(4000,'4106555','Corumbatai do Sul','PR','2023-08-17 20:05:40','2023-08-17 20:05:40'),(4001,'4106571','Cruzeiro do Iguaçu','PR','2023-08-17 20:05:40','2023-08-17 20:05:40'),(4002,'4106605','Cruzeiro do Oeste','PR','2023-08-17 20:05:40','2023-08-17 20:05:40'),(4003,'4106704','Cruzeiro do Sul','PR','2023-08-17 20:05:40','2023-08-17 20:05:40'),(4004,'4106803','Cruz Machado','PR','2023-08-17 20:05:40','2023-08-17 20:05:40'),(4005,'4106852','Cruzmaltina','PR','2023-08-17 20:05:40','2023-08-17 20:05:40'),(4006,'4106902','Curitiba','PR','2023-08-17 20:05:40','2023-08-17 20:05:40'),(4007,'4107009','Curiuva','PR','2023-08-17 20:05:40','2023-08-17 20:05:40'),(4008,'4107108','Diamante do Norte','PR','2023-08-17 20:05:40','2023-08-17 20:05:40'),(4009,'4107124','Diamante do Sul','PR','2023-08-17 20:05:40','2023-08-17 20:05:40'),(4010,'4107157','Diamante D\'Oeste','PR','2023-08-17 20:05:40','2023-08-17 20:05:40'),(4011,'4107207','Dois Vizinhos','PR','2023-08-17 20:05:40','2023-08-17 20:05:40'),(4012,'4107256','Douradina','PR','2023-08-17 20:05:40','2023-08-17 20:05:40'),(4013,'4107306','Doutor Camargo','PR','2023-08-17 20:05:40','2023-08-17 20:05:40'),(4014,'4107405','Eneas Marques','PR','2023-08-17 20:05:40','2023-08-17 20:05:40'),(4015,'4107504','Engenheiro Beltrao','PR','2023-08-17 20:05:40','2023-08-17 20:05:40'),(4016,'4107520','Esperança Nova','PR','2023-08-17 20:05:40','2023-08-17 20:05:40'),(4017,'4107538','Entre Rios do Oeste','PR','2023-08-17 20:05:40','2023-08-17 20:05:40'),(4018,'4107546','Espigao Alto do Iguaçu','PR','2023-08-17 20:05:40','2023-08-17 20:05:40'),(4019,'4107553','Farol','PR','2023-08-17 20:05:40','2023-08-17 20:05:40'),(4020,'4107603','Faxinal','PR','2023-08-17 20:05:40','2023-08-17 20:05:40'),(4021,'4107652','Fazenda Rio Grande','PR','2023-08-17 20:05:40','2023-08-17 20:05:40'),(4022,'4107702','Fênix','PR','2023-08-17 20:05:40','2023-08-17 20:05:40'),(4023,'4107736','Fernandes Pinheiro','PR','2023-08-17 20:05:40','2023-08-17 20:05:40'),(4024,'4107751','Figueira','PR','2023-08-17 20:05:40','2023-08-17 20:05:40'),(4025,'4107801','Florai','PR','2023-08-17 20:05:40','2023-08-17 20:05:40'),(4026,'4107850','Flor da Serra do Sul','PR','2023-08-17 20:05:40','2023-08-17 20:05:40'),(4027,'4107900','Floresta','PR','2023-08-17 20:05:40','2023-08-17 20:05:40'),(4028,'4108007','Florestopolis','PR','2023-08-17 20:05:40','2023-08-17 20:05:40'),(4029,'4108106','Florida','PR','2023-08-17 20:05:40','2023-08-17 20:05:40'),(4030,'4108205','Formosa do Oeste','PR','2023-08-17 20:05:40','2023-08-17 20:05:40'),(4031,'4108304','Foz do Iguaçu','PR','2023-08-17 20:05:40','2023-08-17 20:05:40'),(4032,'4108320','Francisco Alves','PR','2023-08-17 20:05:40','2023-08-17 20:05:40'),(4033,'4108403','Francisco Beltrao','PR','2023-08-17 20:05:40','2023-08-17 20:05:40'),(4034,'4108452','Foz do Jordao','PR','2023-08-17 20:05:40','2023-08-17 20:05:40'),(4035,'4108502','General Carneiro','PR','2023-08-17 20:05:40','2023-08-17 20:05:40'),(4036,'4108551','Godoy Moreira','PR','2023-08-17 20:05:40','2023-08-17 20:05:40'),(4037,'4108601','Goioerê','PR','2023-08-17 20:05:40','2023-08-17 20:05:40'),(4038,'4108650','Goioxim','PR','2023-08-17 20:05:40','2023-08-17 20:05:40'),(4039,'4108700','Grandes Rios','PR','2023-08-17 20:05:40','2023-08-17 20:05:40'),(4040,'4108809','Guaira','PR','2023-08-17 20:05:40','2023-08-17 20:05:40'),(4041,'4108908','Guairaça','PR','2023-08-17 20:05:40','2023-08-17 20:05:40'),(4042,'4108957','Guamiranga','PR','2023-08-17 20:05:40','2023-08-17 20:05:40'),(4043,'4109005','Guapirama','PR','2023-08-17 20:05:40','2023-08-17 20:05:40'),(4044,'4109104','Guaporema','PR','2023-08-17 20:05:40','2023-08-17 20:05:40'),(4045,'4109203','Guaraci','PR','2023-08-17 20:05:40','2023-08-17 20:05:40'),(4046,'4109302','Guaraniaçu','PR','2023-08-17 20:05:40','2023-08-17 20:05:40'),(4047,'4109401','Guarapuava','PR','2023-08-17 20:05:40','2023-08-17 20:05:40'),(4048,'4109500','Guaraqueçaba','PR','2023-08-17 20:05:40','2023-08-17 20:05:40'),(4049,'4109609','Guaratuba','PR','2023-08-17 20:05:40','2023-08-17 20:05:40'),(4050,'4109658','Honorio Serpa','PR','2023-08-17 20:05:40','2023-08-17 20:05:40'),(4051,'4109708','Ibaiti','PR','2023-08-17 20:05:40','2023-08-17 20:05:40'),(4052,'4109757','Ibema','PR','2023-08-17 20:05:40','2023-08-17 20:05:40'),(4053,'4109807','Ibipora','PR','2023-08-17 20:05:40','2023-08-17 20:05:40'),(4054,'4109906','Icaraima','PR','2023-08-17 20:05:40','2023-08-17 20:05:40'),(4055,'4110003','Iguaraçu','PR','2023-08-17 20:05:40','2023-08-17 20:05:40'),(4056,'4110052','Iguatu','PR','2023-08-17 20:05:40','2023-08-17 20:05:40'),(4057,'4110078','Imbau','PR','2023-08-17 20:05:40','2023-08-17 20:05:40'),(4058,'4110102','Imbituva','PR','2023-08-17 20:05:40','2023-08-17 20:05:40'),(4059,'4110201','Inacio Martins','PR','2023-08-17 20:05:40','2023-08-17 20:05:40'),(4060,'4110300','Inaja','PR','2023-08-17 20:05:40','2023-08-17 20:05:40'),(4061,'4110409','Indianopolis','PR','2023-08-17 20:05:40','2023-08-17 20:05:40'),(4062,'4110508','Ipiranga','PR','2023-08-17 20:05:40','2023-08-17 20:05:40'),(4063,'4110607','Ipora','PR','2023-08-17 20:05:40','2023-08-17 20:05:40'),(4064,'4110656','Iracema do Oeste','PR','2023-08-17 20:05:40','2023-08-17 20:05:40'),(4065,'4110706','Irati','PR','2023-08-17 20:05:40','2023-08-17 20:05:40'),(4066,'4110805','Iretama','PR','2023-08-17 20:05:40','2023-08-17 20:05:40'),(4067,'4110904','Itaguaje','PR','2023-08-17 20:05:40','2023-08-17 20:05:40'),(4068,'4110953','Itaipulândia','PR','2023-08-17 20:05:40','2023-08-17 20:05:40'),(4069,'4111001','Itambaraca','PR','2023-08-17 20:05:40','2023-08-17 20:05:40'),(4070,'4111100','Itambe','PR','2023-08-17 20:05:40','2023-08-17 20:05:40'),(4071,'4111209','Itapejara D\'Oeste','PR','2023-08-17 20:05:40','2023-08-17 20:05:40'),(4072,'4111258','Itaperuçu','PR','2023-08-17 20:05:40','2023-08-17 20:05:40'),(4073,'4111308','Itauna do Sul','PR','2023-08-17 20:05:40','2023-08-17 20:05:40'),(4074,'4111407','Ivai','PR','2023-08-17 20:05:40','2023-08-17 20:05:40'),(4075,'4111506','Ivaipora','PR','2023-08-17 20:05:40','2023-08-17 20:05:40'),(4076,'4111555','Ivate','PR','2023-08-17 20:05:40','2023-08-17 20:05:40'),(4077,'4111605','Ivatuba','PR','2023-08-17 20:05:40','2023-08-17 20:05:40'),(4078,'4111704','Jaboti','PR','2023-08-17 20:05:40','2023-08-17 20:05:40'),(4079,'4111803','Jacarezinho','PR','2023-08-17 20:05:40','2023-08-17 20:05:40'),(4080,'4111902','Jaguapita','PR','2023-08-17 20:05:40','2023-08-17 20:05:40'),(4081,'4112009','Jaguariaiva','PR','2023-08-17 20:05:40','2023-08-17 20:05:40'),(4082,'4112108','Jandaia do Sul','PR','2023-08-17 20:05:40','2023-08-17 20:05:40'),(4083,'4112207','Janiopolis','PR','2023-08-17 20:05:40','2023-08-17 20:05:40'),(4084,'4112306','Japira','PR','2023-08-17 20:05:40','2023-08-17 20:05:40'),(4085,'4112405','Japura','PR','2023-08-17 20:05:40','2023-08-17 20:05:40'),(4086,'4112504','Jardim Alegre','PR','2023-08-17 20:05:40','2023-08-17 20:05:40'),(4087,'4112603','Jardim Olinda','PR','2023-08-17 20:05:40','2023-08-17 20:05:40'),(4088,'4112702','Jataizinho','PR','2023-08-17 20:05:40','2023-08-17 20:05:40'),(4089,'4112751','Jesuitas','PR','2023-08-17 20:05:40','2023-08-17 20:05:40'),(4090,'4112801','Joaquim Tavora','PR','2023-08-17 20:05:40','2023-08-17 20:05:40'),(4091,'4112900','Jundiai do Sul','PR','2023-08-17 20:05:40','2023-08-17 20:05:40'),(4092,'4112959','Juranda','PR','2023-08-17 20:05:40','2023-08-17 20:05:40'),(4093,'4113007','Jussara','PR','2023-08-17 20:05:40','2023-08-17 20:05:40'),(4094,'4113106','Kalore','PR','2023-08-17 20:05:40','2023-08-17 20:05:40'),(4095,'4113205','Lapa','PR','2023-08-17 20:05:40','2023-08-17 20:05:40'),(4096,'4113254','Laranjal','PR','2023-08-17 20:05:40','2023-08-17 20:05:40'),(4097,'4113304','Laranjeiras do Sul','PR','2023-08-17 20:05:40','2023-08-17 20:05:40'),(4098,'4113403','Leopolis','PR','2023-08-17 20:05:40','2023-08-17 20:05:40'),(4099,'4113429','Lidianopolis','PR','2023-08-17 20:05:40','2023-08-17 20:05:40'),(4100,'4113452','Lindoeste','PR','2023-08-17 20:05:40','2023-08-17 20:05:40'),(4101,'4113502','Loanda','PR','2023-08-17 20:05:40','2023-08-17 20:05:40'),(4102,'4113601','Lobato','PR','2023-08-17 20:05:40','2023-08-17 20:05:40'),(4103,'4113700','Londrina','PR','2023-08-17 20:05:40','2023-08-17 20:05:40'),(4104,'4113734','Luiziana','PR','2023-08-17 20:05:40','2023-08-17 20:05:40'),(4105,'4113759','Lunardelli','PR','2023-08-17 20:05:40','2023-08-17 20:05:40'),(4106,'4113809','Lupionopolis','PR','2023-08-17 20:05:40','2023-08-17 20:05:40'),(4107,'4113908','Mallet','PR','2023-08-17 20:05:40','2023-08-17 20:05:40'),(4108,'4114005','Mamborê','PR','2023-08-17 20:05:40','2023-08-17 20:05:40'),(4109,'4114104','Mandaguaçu','PR','2023-08-17 20:05:40','2023-08-17 20:05:40'),(4110,'4114203','Mandaguari','PR','2023-08-17 20:05:40','2023-08-17 20:05:40'),(4111,'4114302','Mandirituba','PR','2023-08-17 20:05:40','2023-08-17 20:05:40'),(4112,'4114351','Manfrinopolis','PR','2023-08-17 20:05:40','2023-08-17 20:05:40'),(4113,'4114401','Mangueirinha','PR','2023-08-17 20:05:40','2023-08-17 20:05:40'),(4114,'4114500','Manoel Ribas','PR','2023-08-17 20:05:40','2023-08-17 20:05:40'),(4115,'4114609','Marechal Cândido Rondon','PR','2023-08-17 20:05:40','2023-08-17 20:05:40'),(4116,'4114708','Maria Helena','PR','2023-08-17 20:05:40','2023-08-17 20:05:40'),(4117,'4114807','Marialva','PR','2023-08-17 20:05:40','2023-08-17 20:05:40'),(4118,'4114906','Marilândia do Sul','PR','2023-08-17 20:05:40','2023-08-17 20:05:40'),(4119,'4115002','Marilena','PR','2023-08-17 20:05:40','2023-08-17 20:05:40'),(4120,'4115101','Mariluz','PR','2023-08-17 20:05:40','2023-08-17 20:05:40'),(4121,'4115200','Maringa','PR','2023-08-17 20:05:40','2023-08-17 20:05:40'),(4122,'4115309','Mariopolis','PR','2023-08-17 20:05:40','2023-08-17 20:05:40'),(4123,'4115358','Maripa','PR','2023-08-17 20:05:40','2023-08-17 20:05:40'),(4124,'4115408','Marmeleiro','PR','2023-08-17 20:05:40','2023-08-17 20:05:40'),(4125,'4115457','Marquinho','PR','2023-08-17 20:05:40','2023-08-17 20:05:40'),(4126,'4115507','Marumbi','PR','2023-08-17 20:05:40','2023-08-17 20:05:40'),(4127,'4115606','Matelândia','PR','2023-08-17 20:05:40','2023-08-17 20:05:40'),(4128,'4115705','Matinhos','PR','2023-08-17 20:05:40','2023-08-17 20:05:40'),(4129,'4115739','Mato Rico','PR','2023-08-17 20:05:40','2023-08-17 20:05:40'),(4130,'4115754','Maua da Serra','PR','2023-08-17 20:05:40','2023-08-17 20:05:40'),(4131,'4115804','Medianeira','PR','2023-08-17 20:05:40','2023-08-17 20:05:40'),(4132,'4115853','Mercedes','PR','2023-08-17 20:05:40','2023-08-17 20:05:40'),(4133,'4115903','Mirador','PR','2023-08-17 20:05:40','2023-08-17 20:05:40'),(4134,'4116000','Miraselva','PR','2023-08-17 20:05:40','2023-08-17 20:05:40'),(4135,'4116059','Missal','PR','2023-08-17 20:05:40','2023-08-17 20:05:40'),(4136,'4116109','Moreira Sales','PR','2023-08-17 20:05:40','2023-08-17 20:05:40'),(4137,'4116208','Morretes','PR','2023-08-17 20:05:40','2023-08-17 20:05:40'),(4138,'4116307','Munhoz de Melo','PR','2023-08-17 20:05:40','2023-08-17 20:05:40'),(4139,'4116406','Nossa Senhora das Graças','PR','2023-08-17 20:05:40','2023-08-17 20:05:40'),(4140,'4116505','Nova Aliança do Ivai','PR','2023-08-17 20:05:41','2023-08-17 20:05:41'),(4141,'4116604','Nova America da Colina','PR','2023-08-17 20:05:41','2023-08-17 20:05:41'),(4142,'4116703','Nova Aurora','PR','2023-08-17 20:05:41','2023-08-17 20:05:41'),(4143,'4116802','Nova Cantu','PR','2023-08-17 20:05:41','2023-08-17 20:05:41'),(4144,'4116901','Nova Esperança','PR','2023-08-17 20:05:41','2023-08-17 20:05:41'),(4145,'4116950','Nova Esperança do Sudoeste','PR','2023-08-17 20:05:41','2023-08-17 20:05:41'),(4146,'4117008','Nova Fatima','PR','2023-08-17 20:05:41','2023-08-17 20:05:41'),(4147,'4117057','Nova Laranjeiras','PR','2023-08-17 20:05:41','2023-08-17 20:05:41'),(4148,'4117107','Nova Londrina','PR','2023-08-17 20:05:41','2023-08-17 20:05:41'),(4149,'4117206','Nova Olimpia','PR','2023-08-17 20:05:41','2023-08-17 20:05:41'),(4150,'4117214','Nova Santa Barbara','PR','2023-08-17 20:05:41','2023-08-17 20:05:41'),(4151,'4117222','Nova Santa Rosa','PR','2023-08-17 20:05:41','2023-08-17 20:05:41'),(4152,'4117255','Nova Prata do Iguaçu','PR','2023-08-17 20:05:41','2023-08-17 20:05:41'),(4153,'4117271','Nova Tebas','PR','2023-08-17 20:05:41','2023-08-17 20:05:41'),(4154,'4117297','Novo Itacolomi','PR','2023-08-17 20:05:41','2023-08-17 20:05:41'),(4155,'4117305','Ortigueira','PR','2023-08-17 20:05:41','2023-08-17 20:05:41'),(4156,'4117404','Ourizona','PR','2023-08-17 20:05:41','2023-08-17 20:05:41'),(4157,'4117453','Ouro Verde do Oeste','PR','2023-08-17 20:05:41','2023-08-17 20:05:41'),(4158,'4117503','Paiçandu','PR','2023-08-17 20:05:41','2023-08-17 20:05:41'),(4159,'4117602','Palmas','PR','2023-08-17 20:05:41','2023-08-17 20:05:41'),(4160,'4117701','Palmeira','PR','2023-08-17 20:05:41','2023-08-17 20:05:41'),(4161,'4117800','Palmital','PR','2023-08-17 20:05:41','2023-08-17 20:05:41'),(4162,'4117909','Palotina','PR','2023-08-17 20:05:41','2023-08-17 20:05:41'),(4163,'4118006','Paraiso do Norte','PR','2023-08-17 20:05:41','2023-08-17 20:05:41'),(4164,'4118105','Paranacity','PR','2023-08-17 20:05:41','2023-08-17 20:05:41'),(4165,'4118204','Paranagua','PR','2023-08-17 20:05:41','2023-08-17 20:05:41'),(4166,'4118303','Paranapoema','PR','2023-08-17 20:05:41','2023-08-17 20:05:41'),(4167,'4118402','Paranavai','PR','2023-08-17 20:05:41','2023-08-17 20:05:41'),(4168,'4118451','Pato Bragado','PR','2023-08-17 20:05:41','2023-08-17 20:05:41'),(4169,'4118501','Pato Branco','PR','2023-08-17 20:05:41','2023-08-17 20:05:41'),(4170,'4118600','Paula Freitas','PR','2023-08-17 20:05:41','2023-08-17 20:05:41'),(4171,'4118709','Paulo Frontin','PR','2023-08-17 20:05:41','2023-08-17 20:05:41'),(4172,'4118808','Peabiru','PR','2023-08-17 20:05:41','2023-08-17 20:05:41'),(4173,'4118857','Perobal','PR','2023-08-17 20:05:41','2023-08-17 20:05:41'),(4174,'4118907','Perola','PR','2023-08-17 20:05:41','2023-08-17 20:05:41'),(4175,'4119004','Perola D\'Oeste','PR','2023-08-17 20:05:41','2023-08-17 20:05:41'),(4176,'4119103','Piên','PR','2023-08-17 20:05:41','2023-08-17 20:05:41'),(4177,'4119152','Pinhais','PR','2023-08-17 20:05:41','2023-08-17 20:05:41'),(4178,'4119202','Pinhalao','PR','2023-08-17 20:05:41','2023-08-17 20:05:41'),(4179,'4119251','Pinhal de Sao Bento','PR','2023-08-17 20:05:41','2023-08-17 20:05:41'),(4180,'4119301','Pinhao','PR','2023-08-17 20:05:41','2023-08-17 20:05:41'),(4181,'4119400','Pirai do Sul','PR','2023-08-17 20:05:41','2023-08-17 20:05:41'),(4182,'4119509','Piraquara','PR','2023-08-17 20:05:41','2023-08-17 20:05:41'),(4183,'4119608','Pitanga','PR','2023-08-17 20:05:41','2023-08-17 20:05:41'),(4184,'4119657','Pitangueiras','PR','2023-08-17 20:05:41','2023-08-17 20:05:41'),(4185,'4119707','Planaltina do Parana','PR','2023-08-17 20:05:41','2023-08-17 20:05:41'),(4186,'4119806','Planalto','PR','2023-08-17 20:05:41','2023-08-17 20:05:41'),(4187,'4119905','Ponta Grossa','PR','2023-08-17 20:05:41','2023-08-17 20:05:41'),(4188,'4119954','Pontal do Parana','PR','2023-08-17 20:05:41','2023-08-17 20:05:41'),(4189,'4120002','Porecatu','PR','2023-08-17 20:05:41','2023-08-17 20:05:41'),(4190,'4120101','Porto Amazonas','PR','2023-08-17 20:05:41','2023-08-17 20:05:41'),(4191,'4120150','Porto Barreiro','PR','2023-08-17 20:05:41','2023-08-17 20:05:41'),(4192,'4120200','Porto Rico','PR','2023-08-17 20:05:41','2023-08-17 20:05:41'),(4193,'4120309','Porto Vitoria','PR','2023-08-17 20:05:41','2023-08-17 20:05:41'),(4194,'4120333','Prado Ferreira','PR','2023-08-17 20:05:41','2023-08-17 20:05:41'),(4195,'4120358','Pranchita','PR','2023-08-17 20:05:41','2023-08-17 20:05:41'),(4196,'4120408','Presidente Castelo Branco','PR','2023-08-17 20:05:41','2023-08-17 20:05:41'),(4197,'4120507','Primeiro de Maio','PR','2023-08-17 20:05:41','2023-08-17 20:05:41'),(4198,'4120606','Prudentopolis','PR','2023-08-17 20:05:41','2023-08-17 20:05:41'),(4199,'4120655','Quarto Centenario','PR','2023-08-17 20:05:41','2023-08-17 20:05:41'),(4200,'4120705','Quatigua','PR','2023-08-17 20:05:41','2023-08-17 20:05:41'),(4201,'4120804','Quatro Barras','PR','2023-08-17 20:05:41','2023-08-17 20:05:41'),(4202,'4120853','Quatro Pontes','PR','2023-08-17 20:05:41','2023-08-17 20:05:41'),(4203,'4120903','Quedas do Iguaçu','PR','2023-08-17 20:05:41','2023-08-17 20:05:41'),(4204,'4121000','Querência do Norte','PR','2023-08-17 20:05:41','2023-08-17 20:05:41'),(4205,'4121109','Quinta do Sol','PR','2023-08-17 20:05:41','2023-08-17 20:05:41'),(4206,'4121208','Quitandinha','PR','2023-08-17 20:05:41','2023-08-17 20:05:41'),(4207,'4121257','Ramilândia','PR','2023-08-17 20:05:41','2023-08-17 20:05:41'),(4208,'4121307','Rancho Alegre','PR','2023-08-17 20:05:41','2023-08-17 20:05:41'),(4209,'4121356','Rancho Alegre D\'Oeste','PR','2023-08-17 20:05:41','2023-08-17 20:05:41'),(4210,'4121406','Realeza','PR','2023-08-17 20:05:41','2023-08-17 20:05:41'),(4211,'4121505','Rebouças','PR','2023-08-17 20:05:41','2023-08-17 20:05:41'),(4212,'4121604','Renascença','PR','2023-08-17 20:05:41','2023-08-17 20:05:41'),(4213,'4121703','Reserva','PR','2023-08-17 20:05:41','2023-08-17 20:05:41'),(4214,'4121752','Reserva do Iguaçu','PR','2023-08-17 20:05:41','2023-08-17 20:05:41'),(4215,'4121802','Ribeirao Claro','PR','2023-08-17 20:05:41','2023-08-17 20:05:41'),(4216,'4121901','Ribeirao do Pinhal','PR','2023-08-17 20:05:41','2023-08-17 20:05:41'),(4217,'4122008','Rio Azul','PR','2023-08-17 20:05:41','2023-08-17 20:05:41'),(4218,'4122107','Rio Bom','PR','2023-08-17 20:05:41','2023-08-17 20:05:41'),(4219,'4122156','Rio Bonito do Iguaçu','PR','2023-08-17 20:05:41','2023-08-17 20:05:41'),(4220,'4122172','Rio Branco do Ivai','PR','2023-08-17 20:05:41','2023-08-17 20:05:41'),(4221,'4122206','Rio Branco do Sul','PR','2023-08-17 20:05:41','2023-08-17 20:05:41'),(4222,'4122305','Rio Negro','PR','2023-08-17 20:05:41','2023-08-17 20:05:41'),(4223,'4122404','Rolândia','PR','2023-08-17 20:05:41','2023-08-17 20:05:41'),(4224,'4122503','Roncador','PR','2023-08-17 20:05:41','2023-08-17 20:05:41'),(4225,'4122602','Rondon','PR','2023-08-17 20:05:41','2023-08-17 20:05:41'),(4226,'4122651','Rosario do Ivai','PR','2023-08-17 20:05:41','2023-08-17 20:05:41'),(4227,'4122701','Sabaudia','PR','2023-08-17 20:05:41','2023-08-17 20:05:41'),(4228,'4122800','Salgado Filho','PR','2023-08-17 20:05:41','2023-08-17 20:05:41'),(4229,'4122909','Salto do Itarare','PR','2023-08-17 20:05:41','2023-08-17 20:05:41'),(4230,'4123006','Salto do Lontra','PR','2023-08-17 20:05:41','2023-08-17 20:05:41'),(4231,'4123105','Santa Amelia','PR','2023-08-17 20:05:41','2023-08-17 20:05:41'),(4232,'4123204','Santa Cecilia do Pavao','PR','2023-08-17 20:05:41','2023-08-17 20:05:41'),(4233,'4123303','Santa Cruz de Monte Castelo','PR','2023-08-17 20:05:41','2023-08-17 20:05:41'),(4234,'4123402','Santa Fe','PR','2023-08-17 20:05:41','2023-08-17 20:05:41'),(4235,'4123501','Santa Helena','PR','2023-08-17 20:05:41','2023-08-17 20:05:41'),(4236,'4123600','Santa Inês','PR','2023-08-17 20:05:41','2023-08-17 20:05:41'),(4237,'4123709','Santa Isabel do Ivai','PR','2023-08-17 20:05:41','2023-08-17 20:05:41'),(4238,'4123808','Santa Izabel do Oeste','PR','2023-08-17 20:05:41','2023-08-17 20:05:41'),(4239,'4123824','Santa Lucia','PR','2023-08-17 20:05:41','2023-08-17 20:05:41'),(4240,'4123857','Santa Maria do Oeste','PR','2023-08-17 20:05:41','2023-08-17 20:05:41'),(4241,'4123907','Santa Mariana','PR','2023-08-17 20:05:41','2023-08-17 20:05:41'),(4242,'4123956','Santa Mônica','PR','2023-08-17 20:05:41','2023-08-17 20:05:41'),(4243,'4124004','Santana do Itarare','PR','2023-08-17 20:05:41','2023-08-17 20:05:41'),(4244,'4124020','Santa Tereza do Oeste','PR','2023-08-17 20:05:41','2023-08-17 20:05:41'),(4245,'4124053','Santa Terezinha de Itaipu','PR','2023-08-17 20:05:41','2023-08-17 20:05:41'),(4246,'4124103','Santo Antônio da Platina','PR','2023-08-17 20:05:41','2023-08-17 20:05:41'),(4247,'4124202','Santo Antônio do Caiua','PR','2023-08-17 20:05:41','2023-08-17 20:05:41'),(4248,'4124301','Santo Antônio do Paraiso','PR','2023-08-17 20:05:41','2023-08-17 20:05:41'),(4249,'4124400','Santo Antônio do Sudoeste','PR','2023-08-17 20:05:41','2023-08-17 20:05:41'),(4250,'4124509','Santo Inacio','PR','2023-08-17 20:05:41','2023-08-17 20:05:41'),(4251,'4124608','Sao Carlos do Ivai','PR','2023-08-17 20:05:41','2023-08-17 20:05:41'),(4252,'4124707','Sao Jerônimo da Serra','PR','2023-08-17 20:05:41','2023-08-17 20:05:41'),(4253,'4124806','Sao Joao','PR','2023-08-17 20:05:41','2023-08-17 20:05:41'),(4254,'4124905','Sao Joao do Caiua','PR','2023-08-17 20:05:41','2023-08-17 20:05:41'),(4255,'4125001','Sao Joao do Ivai','PR','2023-08-17 20:05:41','2023-08-17 20:05:41'),(4256,'4125100','Sao Joao do Triunfo','PR','2023-08-17 20:05:41','2023-08-17 20:05:41'),(4257,'4125209','Sao Jorge D\'Oeste','PR','2023-08-17 20:05:41','2023-08-17 20:05:41'),(4258,'4125308','Sao Jorge do Ivai','PR','2023-08-17 20:05:41','2023-08-17 20:05:41'),(4259,'4125357','Sao Jorge do Patrocinio','PR','2023-08-17 20:05:41','2023-08-17 20:05:41'),(4260,'4125407','Sao Jose da Boa Vista','PR','2023-08-17 20:05:41','2023-08-17 20:05:41'),(4261,'4125456','Sao Jose das Palmeiras','PR','2023-08-17 20:05:41','2023-08-17 20:05:41'),(4262,'4125506','Sao Jose dos Pinhais','PR','2023-08-17 20:05:41','2023-08-17 20:05:41'),(4263,'4125555','Sao Manoel do Parana','PR','2023-08-17 20:05:41','2023-08-17 20:05:41'),(4264,'4125605','Sao Mateus do Sul','PR','2023-08-17 20:05:41','2023-08-17 20:05:41'),(4265,'4125704','Sao Miguel do Iguaçu','PR','2023-08-17 20:05:41','2023-08-17 20:05:41'),(4266,'4125753','Sao Pedro do Iguaçu','PR','2023-08-17 20:05:41','2023-08-17 20:05:41'),(4267,'4125803','Sao Pedro do Ivai','PR','2023-08-17 20:05:41','2023-08-17 20:05:41'),(4268,'4125902','Sao Pedro do Parana','PR','2023-08-17 20:05:41','2023-08-17 20:05:41'),(4269,'4126009','Sao Sebastiao da Amoreira','PR','2023-08-17 20:05:41','2023-08-17 20:05:41'),(4270,'4126108','Sao Tome','PR','2023-08-17 20:05:41','2023-08-17 20:05:41'),(4271,'4126207','Sapopema','PR','2023-08-17 20:05:41','2023-08-17 20:05:41'),(4272,'4126256','Sarandi','PR','2023-08-17 20:05:41','2023-08-17 20:05:41'),(4273,'4126272','Saudade do Iguaçu','PR','2023-08-17 20:05:41','2023-08-17 20:05:41'),(4274,'4126306','Senges','PR','2023-08-17 20:05:41','2023-08-17 20:05:41'),(4275,'4126355','Serranopolis do Iguaçu','PR','2023-08-17 20:05:41','2023-08-17 20:05:41'),(4276,'4126405','Sertaneja','PR','2023-08-17 20:05:41','2023-08-17 20:05:41'),(4277,'4126504','Sertanopolis','PR','2023-08-17 20:05:41','2023-08-17 20:05:41'),(4278,'4126603','Siqueira Campos','PR','2023-08-17 20:05:41','2023-08-17 20:05:41'),(4279,'4126652','Sulina','PR','2023-08-17 20:05:41','2023-08-17 20:05:41'),(4280,'4126678','Tamarana','PR','2023-08-17 20:05:41','2023-08-17 20:05:41'),(4281,'4126702','Tamboara','PR','2023-08-17 20:05:41','2023-08-17 20:05:41'),(4282,'4126801','Tapejara','PR','2023-08-17 20:05:41','2023-08-17 20:05:41'),(4283,'4126900','Tapira','PR','2023-08-17 20:05:41','2023-08-17 20:05:41'),(4284,'4127007','Teixeira Soares','PR','2023-08-17 20:05:41','2023-08-17 20:05:41'),(4285,'4127106','Telêmaco Borba','PR','2023-08-17 20:05:41','2023-08-17 20:05:41'),(4286,'4127205','Terra Boa','PR','2023-08-17 20:05:41','2023-08-17 20:05:41'),(4287,'4127304','Terra Rica','PR','2023-08-17 20:05:41','2023-08-17 20:05:41'),(4288,'4127403','Terra Roxa','PR','2023-08-17 20:05:41','2023-08-17 20:05:41'),(4289,'4127502','Tibagi','PR','2023-08-17 20:05:41','2023-08-17 20:05:41'),(4290,'4127601','Tijucas do Sul','PR','2023-08-17 20:05:41','2023-08-17 20:05:41'),(4291,'4127700','Toledo','PR','2023-08-17 20:05:41','2023-08-17 20:05:41'),(4292,'4127809','Tomazina','PR','2023-08-17 20:05:41','2023-08-17 20:05:41'),(4293,'4127858','Três Barras do Parana','PR','2023-08-17 20:05:41','2023-08-17 20:05:41'),(4294,'4127882','Tunas do Parana','PR','2023-08-17 20:05:41','2023-08-17 20:05:41'),(4295,'4127908','Tuneiras do Oeste','PR','2023-08-17 20:05:41','2023-08-17 20:05:41'),(4296,'4127957','Tupassi','PR','2023-08-17 20:05:41','2023-08-17 20:05:41'),(4297,'4127965','Turvo','PR','2023-08-17 20:05:41','2023-08-17 20:05:41'),(4298,'4128005','Ubirata','PR','2023-08-17 20:05:41','2023-08-17 20:05:41'),(4299,'4128104','Umuarama','PR','2023-08-17 20:05:41','2023-08-17 20:05:41'),(4300,'4128203','Uniao da Vitoria','PR','2023-08-17 20:05:41','2023-08-17 20:05:41'),(4301,'4128302','Uniflor','PR','2023-08-17 20:05:41','2023-08-17 20:05:41'),(4302,'4128401','Urai','PR','2023-08-17 20:05:41','2023-08-17 20:05:41'),(4303,'4128500','Wenceslau Braz','PR','2023-08-17 20:05:41','2023-08-17 20:05:41'),(4304,'4128534','Ventania','PR','2023-08-17 20:05:41','2023-08-17 20:05:41'),(4305,'4128559','Vera Cruz do Oeste','PR','2023-08-17 20:05:41','2023-08-17 20:05:41'),(4306,'4128609','Verê','PR','2023-08-17 20:05:41','2023-08-17 20:05:41'),(4307,'4128625','Alto Paraiso','PR','2023-08-17 20:05:41','2023-08-17 20:05:41'),(4308,'4128633','Doutor Ulysses','PR','2023-08-17 20:05:41','2023-08-17 20:05:41'),(4309,'4128658','Virmond','PR','2023-08-17 20:05:41','2023-08-17 20:05:41'),(4310,'4128708','Vitorino','PR','2023-08-17 20:05:41','2023-08-17 20:05:41'),(4311,'4128807','Xambrê','PR','2023-08-17 20:05:41','2023-08-17 20:05:41'),(4312,'4200051','Abdon Batista','SC','2023-08-17 20:05:41','2023-08-17 20:05:41'),(4313,'4200101','Abelardo Luz','SC','2023-08-17 20:05:41','2023-08-17 20:05:41'),(4314,'4200200','Agrolândia','SC','2023-08-17 20:05:41','2023-08-17 20:05:41'),(4315,'4200309','Agronômica','SC','2023-08-17 20:05:41','2023-08-17 20:05:41'),(4316,'4200408','agua Doce','SC','2023-08-17 20:05:41','2023-08-17 20:05:41'),(4317,'4200507','aguas de Chapeco','SC','2023-08-17 20:05:41','2023-08-17 20:05:41'),(4318,'4200556','aguas Frias','SC','2023-08-17 20:05:41','2023-08-17 20:05:41'),(4319,'4200606','aguas Mornas','SC','2023-08-17 20:05:41','2023-08-17 20:05:41'),(4320,'4200705','Alfredo Wagner','SC','2023-08-17 20:05:41','2023-08-17 20:05:41'),(4321,'4200754','Alto Bela Vista','SC','2023-08-17 20:05:41','2023-08-17 20:05:41'),(4322,'4200804','Anchieta','SC','2023-08-17 20:05:41','2023-08-17 20:05:41'),(4323,'4200903','Angelina','SC','2023-08-17 20:05:41','2023-08-17 20:05:41'),(4324,'4201000','Anita Garibaldi','SC','2023-08-17 20:05:41','2023-08-17 20:05:41'),(4325,'4201109','Anitapolis','SC','2023-08-17 20:05:41','2023-08-17 20:05:41'),(4326,'4201208','Antônio Carlos','SC','2023-08-17 20:05:41','2023-08-17 20:05:41'),(4327,'4201257','Apiuna','SC','2023-08-17 20:05:41','2023-08-17 20:05:41'),(4328,'4201273','Arabuta','SC','2023-08-17 20:05:41','2023-08-17 20:05:41'),(4329,'4201307','Araquari','SC','2023-08-17 20:05:41','2023-08-17 20:05:41'),(4330,'4201406','Ararangua','SC','2023-08-17 20:05:41','2023-08-17 20:05:41'),(4331,'4201505','Armazem','SC','2023-08-17 20:05:41','2023-08-17 20:05:41'),(4332,'4201604','Arroio Trinta','SC','2023-08-17 20:05:41','2023-08-17 20:05:41'),(4333,'4201653','Arvoredo','SC','2023-08-17 20:05:41','2023-08-17 20:05:41'),(4334,'4201703','Ascurra','SC','2023-08-17 20:05:41','2023-08-17 20:05:41'),(4335,'4201802','Atalanta','SC','2023-08-17 20:05:41','2023-08-17 20:05:41'),(4336,'4201901','Aurora','SC','2023-08-17 20:05:41','2023-08-17 20:05:41'),(4337,'4201950','Balneario Arroio do Silva','SC','2023-08-17 20:05:41','2023-08-17 20:05:41'),(4338,'4202008','Balneario Camboriu','SC','2023-08-17 20:05:41','2023-08-17 20:05:41'),(4339,'4202057','Balneario Barra do Sul','SC','2023-08-17 20:05:41','2023-08-17 20:05:41'),(4340,'4202073','Balneario Gaivota','SC','2023-08-17 20:05:41','2023-08-17 20:05:41'),(4341,'4202081','Bandeirante','SC','2023-08-17 20:05:41','2023-08-17 20:05:41'),(4342,'4202099','Barra Bonita','SC','2023-08-17 20:05:41','2023-08-17 20:05:41'),(4343,'4202107','Barra Velha','SC','2023-08-17 20:05:41','2023-08-17 20:05:41'),(4344,'4202131','Bela Vista do Toldo','SC','2023-08-17 20:05:41','2023-08-17 20:05:41'),(4345,'4202156','Belmonte','SC','2023-08-17 20:05:41','2023-08-17 20:05:41'),(4346,'4202206','Benedito Novo','SC','2023-08-17 20:05:41','2023-08-17 20:05:41'),(4347,'4202305','Biguaçu','SC','2023-08-17 20:05:41','2023-08-17 20:05:41'),(4348,'4202404','Blumenau','SC','2023-08-17 20:05:41','2023-08-17 20:05:41'),(4349,'4202438','Bocaina do Sul','SC','2023-08-17 20:05:41','2023-08-17 20:05:41'),(4350,'4202453','Bombinhas','SC','2023-08-17 20:05:41','2023-08-17 20:05:41'),(4351,'4202503','Bom Jardim da Serra','SC','2023-08-17 20:05:41','2023-08-17 20:05:41'),(4352,'4202537','Bom Jesus','SC','2023-08-17 20:05:41','2023-08-17 20:05:41'),(4353,'4202578','Bom Jesus do Oeste','SC','2023-08-17 20:05:41','2023-08-17 20:05:41'),(4354,'4202602','Bom Retiro','SC','2023-08-17 20:05:41','2023-08-17 20:05:41'),(4355,'4202701','Botuvera','SC','2023-08-17 20:05:41','2023-08-17 20:05:41'),(4356,'4202800','Braço do Norte','SC','2023-08-17 20:05:41','2023-08-17 20:05:41'),(4357,'4202859','Braço do Trombudo','SC','2023-08-17 20:05:41','2023-08-17 20:05:41'),(4358,'4202875','Brunopolis','SC','2023-08-17 20:05:41','2023-08-17 20:05:41'),(4359,'4202909','Brusque','SC','2023-08-17 20:05:41','2023-08-17 20:05:41'),(4360,'4203006','Caçador','SC','2023-08-17 20:05:41','2023-08-17 20:05:41'),(4361,'4203105','Caibi','SC','2023-08-17 20:05:41','2023-08-17 20:05:41'),(4362,'4203154','Calmon','SC','2023-08-17 20:05:41','2023-08-17 20:05:41'),(4363,'4203204','Camboriu','SC','2023-08-17 20:05:41','2023-08-17 20:05:41'),(4364,'4203253','Capao Alto','SC','2023-08-17 20:05:41','2023-08-17 20:05:41'),(4365,'4203303','Campo Alegre','SC','2023-08-17 20:05:41','2023-08-17 20:05:41'),(4366,'4203402','Campo Belo do Sul','SC','2023-08-17 20:05:41','2023-08-17 20:05:41'),(4367,'4203501','Campo Erê','SC','2023-08-17 20:05:41','2023-08-17 20:05:41'),(4368,'4203600','Campos Novos','SC','2023-08-17 20:05:41','2023-08-17 20:05:41'),(4369,'4203709','Canelinha','SC','2023-08-17 20:05:41','2023-08-17 20:05:41'),(4370,'4203808','Canoinhas','SC','2023-08-17 20:05:41','2023-08-17 20:05:41'),(4371,'4203907','Capinzal','SC','2023-08-17 20:05:41','2023-08-17 20:05:41'),(4372,'4203956','Capivari de Baixo','SC','2023-08-17 20:05:41','2023-08-17 20:05:41'),(4373,'4204004','Catanduvas','SC','2023-08-17 20:05:41','2023-08-17 20:05:41'),(4374,'4204103','Caxambu do Sul','SC','2023-08-17 20:05:41','2023-08-17 20:05:41'),(4375,'4204152','Celso Ramos','SC','2023-08-17 20:05:41','2023-08-17 20:05:41'),(4376,'4204178','Cerro Negro','SC','2023-08-17 20:05:41','2023-08-17 20:05:41'),(4377,'4204194','Chapadao do Lageado','SC','2023-08-17 20:05:41','2023-08-17 20:05:41'),(4378,'4204202','Chapeco','SC','2023-08-17 20:05:41','2023-08-17 20:05:41'),(4379,'4204251','Cocal do Sul','SC','2023-08-17 20:05:41','2023-08-17 20:05:41'),(4380,'4204301','Concordia','SC','2023-08-17 20:05:41','2023-08-17 20:05:41'),(4381,'4204350','Cordilheira Alta','SC','2023-08-17 20:05:41','2023-08-17 20:05:41'),(4382,'4204400','Coronel Freitas','SC','2023-08-17 20:05:41','2023-08-17 20:05:41'),(4383,'4204459','Coronel Martins','SC','2023-08-17 20:05:41','2023-08-17 20:05:41'),(4384,'4204509','Corupa','SC','2023-08-17 20:05:41','2023-08-17 20:05:41'),(4385,'4204558','Correia Pinto','SC','2023-08-17 20:05:41','2023-08-17 20:05:41'),(4386,'4204608','Criciuma','SC','2023-08-17 20:05:41','2023-08-17 20:05:41'),(4387,'4204707','Cunha Pora','SC','2023-08-17 20:05:41','2023-08-17 20:05:41'),(4388,'4204756','Cunhatai','SC','2023-08-17 20:05:41','2023-08-17 20:05:41'),(4389,'4204806','Curitibanos','SC','2023-08-17 20:05:41','2023-08-17 20:05:41'),(4390,'4204905','Descanso','SC','2023-08-17 20:05:41','2023-08-17 20:05:41'),(4391,'4205001','Dionisio Cerqueira','SC','2023-08-17 20:05:41','2023-08-17 20:05:41'),(4392,'4205100','Dona Emma','SC','2023-08-17 20:05:41','2023-08-17 20:05:41'),(4393,'4205159','Doutor Pedrinho','SC','2023-08-17 20:05:41','2023-08-17 20:05:41'),(4394,'4205175','Entre Rios','SC','2023-08-17 20:05:41','2023-08-17 20:05:41'),(4395,'4205191','Ermo','SC','2023-08-17 20:05:41','2023-08-17 20:05:41'),(4396,'4205209','Erval Velho','SC','2023-08-17 20:05:41','2023-08-17 20:05:41'),(4397,'4205308','Faxinal dos Guedes','SC','2023-08-17 20:05:41','2023-08-17 20:05:41'),(4398,'4205357','Flor do Sertao','SC','2023-08-17 20:05:41','2023-08-17 20:05:41'),(4399,'4205407','Florianopolis','SC','2023-08-17 20:05:41','2023-08-17 20:05:41'),(4400,'4205431','Formosa do Sul','SC','2023-08-17 20:05:41','2023-08-17 20:05:41'),(4401,'4205456','Forquilhinha','SC','2023-08-17 20:05:41','2023-08-17 20:05:41'),(4402,'4205506','Fraiburgo','SC','2023-08-17 20:05:41','2023-08-17 20:05:41'),(4403,'4205555','Frei Rogerio','SC','2023-08-17 20:05:41','2023-08-17 20:05:41'),(4404,'4205605','Galvao','SC','2023-08-17 20:05:41','2023-08-17 20:05:41'),(4405,'4205704','Garopaba','SC','2023-08-17 20:05:41','2023-08-17 20:05:41'),(4406,'4205803','Garuva','SC','2023-08-17 20:05:41','2023-08-17 20:05:41'),(4407,'4205902','Gaspar','SC','2023-08-17 20:05:41','2023-08-17 20:05:41'),(4408,'4206009','Governador Celso Ramos','SC','2023-08-17 20:05:41','2023-08-17 20:05:41'),(4409,'4206108','Grao Para','SC','2023-08-17 20:05:41','2023-08-17 20:05:41'),(4410,'4206207','Gravatal','SC','2023-08-17 20:05:41','2023-08-17 20:05:41'),(4411,'4206306','Guabiruba','SC','2023-08-17 20:05:41','2023-08-17 20:05:41'),(4412,'4206405','Guaraciaba','SC','2023-08-17 20:05:41','2023-08-17 20:05:41'),(4413,'4206504','Guaramirim','SC','2023-08-17 20:05:41','2023-08-17 20:05:41'),(4414,'4206603','Guaruja do Sul','SC','2023-08-17 20:05:41','2023-08-17 20:05:41'),(4415,'4206652','Guatambu','SC','2023-08-17 20:05:41','2023-08-17 20:05:41'),(4416,'4206702','Herval D\'Oeste','SC','2023-08-17 20:05:41','2023-08-17 20:05:41'),(4417,'4206751','Ibiam','SC','2023-08-17 20:05:41','2023-08-17 20:05:41'),(4418,'4206801','Ibicare','SC','2023-08-17 20:05:41','2023-08-17 20:05:41'),(4419,'4206900','Ibirama','SC','2023-08-17 20:05:41','2023-08-17 20:05:41'),(4420,'4207007','Içara','SC','2023-08-17 20:05:41','2023-08-17 20:05:41'),(4421,'4207106','Ilhota','SC','2023-08-17 20:05:41','2023-08-17 20:05:41'),(4422,'4207205','Imarui','SC','2023-08-17 20:05:41','2023-08-17 20:05:41'),(4423,'4207304','Imbituba','SC','2023-08-17 20:05:41','2023-08-17 20:05:41'),(4424,'4207403','Imbuia','SC','2023-08-17 20:05:41','2023-08-17 20:05:41'),(4425,'4207502','Indaial','SC','2023-08-17 20:05:41','2023-08-17 20:05:41'),(4426,'4207577','Iomerê','SC','2023-08-17 20:05:41','2023-08-17 20:05:41'),(4427,'4207601','Ipira','SC','2023-08-17 20:05:41','2023-08-17 20:05:41'),(4428,'4207650','Ipora do Oeste','SC','2023-08-17 20:05:41','2023-08-17 20:05:41'),(4429,'4207684','Ipuaçu','SC','2023-08-17 20:05:41','2023-08-17 20:05:41'),(4430,'4207700','Ipumirim','SC','2023-08-17 20:05:41','2023-08-17 20:05:41'),(4431,'4207759','Iraceminha','SC','2023-08-17 20:05:41','2023-08-17 20:05:41'),(4432,'4207809','Irani','SC','2023-08-17 20:05:41','2023-08-17 20:05:41'),(4433,'4207858','Irati','SC','2023-08-17 20:05:41','2023-08-17 20:05:41'),(4434,'4207908','Irineopolis','SC','2023-08-17 20:05:41','2023-08-17 20:05:41'),(4435,'4208005','Ita','SC','2023-08-17 20:05:41','2023-08-17 20:05:41'),(4436,'4208104','Itaiopolis','SC','2023-08-17 20:05:41','2023-08-17 20:05:41'),(4437,'4208203','Itajai','SC','2023-08-17 20:05:41','2023-08-17 20:05:41'),(4438,'4208302','Itapema','SC','2023-08-17 20:05:41','2023-08-17 20:05:41'),(4439,'4208401','Itapiranga','SC','2023-08-17 20:05:41','2023-08-17 20:05:41'),(4440,'4208450','Itapoa','SC','2023-08-17 20:05:41','2023-08-17 20:05:41'),(4441,'4208500','Ituporanga','SC','2023-08-17 20:05:41','2023-08-17 20:05:41'),(4442,'4208609','Jabora','SC','2023-08-17 20:05:41','2023-08-17 20:05:41'),(4443,'4208708','Jacinto Machado','SC','2023-08-17 20:05:41','2023-08-17 20:05:41'),(4444,'4208807','Jaguaruna','SC','2023-08-17 20:05:41','2023-08-17 20:05:41'),(4445,'4208906','Jaragua do Sul','SC','2023-08-17 20:05:41','2023-08-17 20:05:41'),(4446,'4208955','Jardinopolis','SC','2023-08-17 20:05:41','2023-08-17 20:05:41'),(4447,'4209003','Joaçaba','SC','2023-08-17 20:05:41','2023-08-17 20:05:41'),(4448,'4209102','Joinville','SC','2023-08-17 20:05:41','2023-08-17 20:05:41'),(4449,'4209151','Jose Boiteux','SC','2023-08-17 20:05:42','2023-08-17 20:05:42'),(4450,'4209177','Jupia','SC','2023-08-17 20:05:42','2023-08-17 20:05:42'),(4451,'4209201','Lacerdopolis','SC','2023-08-17 20:05:42','2023-08-17 20:05:42'),(4452,'4209300','Lages','SC','2023-08-17 20:05:42','2023-08-17 20:05:42'),(4453,'4209409','Laguna','SC','2023-08-17 20:05:42','2023-08-17 20:05:42'),(4454,'4209458','Lajeado Grande','SC','2023-08-17 20:05:42','2023-08-17 20:05:42'),(4455,'4209508','Laurentino','SC','2023-08-17 20:05:42','2023-08-17 20:05:42'),(4456,'4209607','Lauro Muller','SC','2023-08-17 20:05:42','2023-08-17 20:05:42'),(4457,'4209706','Lebon Regis','SC','2023-08-17 20:05:42','2023-08-17 20:05:42'),(4458,'4209805','Leoberto Leal','SC','2023-08-17 20:05:42','2023-08-17 20:05:42'),(4459,'4209854','Lindoia do Sul','SC','2023-08-17 20:05:42','2023-08-17 20:05:42'),(4460,'4209904','Lontras','SC','2023-08-17 20:05:42','2023-08-17 20:05:42'),(4461,'4210001','Luiz Alves','SC','2023-08-17 20:05:42','2023-08-17 20:05:42'),(4462,'4210035','Luzerna','SC','2023-08-17 20:05:42','2023-08-17 20:05:42'),(4463,'4210050','Macieira','SC','2023-08-17 20:05:42','2023-08-17 20:05:42'),(4464,'4210100','Mafra','SC','2023-08-17 20:05:42','2023-08-17 20:05:42'),(4465,'4210209','Major Gercino','SC','2023-08-17 20:05:42','2023-08-17 20:05:42'),(4466,'4210308','Major Vieira','SC','2023-08-17 20:05:42','2023-08-17 20:05:42'),(4467,'4210407','Maracaja','SC','2023-08-17 20:05:42','2023-08-17 20:05:42'),(4468,'4210506','Maravilha','SC','2023-08-17 20:05:42','2023-08-17 20:05:42'),(4469,'4210555','Marema','SC','2023-08-17 20:05:42','2023-08-17 20:05:42'),(4470,'4210605','Massaranduba','SC','2023-08-17 20:05:42','2023-08-17 20:05:42'),(4471,'4210704','Matos Costa','SC','2023-08-17 20:05:42','2023-08-17 20:05:42'),(4472,'4210803','Meleiro','SC','2023-08-17 20:05:42','2023-08-17 20:05:42'),(4473,'4210852','Mirim Doce','SC','2023-08-17 20:05:42','2023-08-17 20:05:42'),(4474,'4210902','Modelo','SC','2023-08-17 20:05:42','2023-08-17 20:05:42'),(4475,'4211009','Mondai','SC','2023-08-17 20:05:42','2023-08-17 20:05:42'),(4476,'4211058','Monte Carlo','SC','2023-08-17 20:05:42','2023-08-17 20:05:42'),(4477,'4211108','Monte Castelo','SC','2023-08-17 20:05:42','2023-08-17 20:05:42'),(4478,'4211207','Morro da Fumaça','SC','2023-08-17 20:05:42','2023-08-17 20:05:42'),(4479,'4211256','Morro Grande','SC','2023-08-17 20:05:42','2023-08-17 20:05:42'),(4480,'4211306','Navegantes','SC','2023-08-17 20:05:42','2023-08-17 20:05:42'),(4481,'4211405','Nova Erechim','SC','2023-08-17 20:05:42','2023-08-17 20:05:42'),(4482,'4211454','Nova Itaberaba','SC','2023-08-17 20:05:42','2023-08-17 20:05:42'),(4483,'4211504','Nova Trento','SC','2023-08-17 20:05:42','2023-08-17 20:05:42'),(4484,'4211603','Nova Veneza','SC','2023-08-17 20:05:42','2023-08-17 20:05:42'),(4485,'4211652','Novo Horizonte','SC','2023-08-17 20:05:42','2023-08-17 20:05:42'),(4486,'4211702','Orleans','SC','2023-08-17 20:05:42','2023-08-17 20:05:42'),(4487,'4211751','Otacilio Costa','SC','2023-08-17 20:05:42','2023-08-17 20:05:42'),(4488,'4211801','Ouro','SC','2023-08-17 20:05:42','2023-08-17 20:05:42'),(4489,'4211850','Ouro Verde','SC','2023-08-17 20:05:42','2023-08-17 20:05:42'),(4490,'4211876','Paial','SC','2023-08-17 20:05:42','2023-08-17 20:05:42'),(4491,'4211892','Painel','SC','2023-08-17 20:05:42','2023-08-17 20:05:42'),(4492,'4211900','Palhoça','SC','2023-08-17 20:05:42','2023-08-17 20:05:42'),(4493,'4212007','Palma Sola','SC','2023-08-17 20:05:42','2023-08-17 20:05:42'),(4494,'4212056','Palmeira','SC','2023-08-17 20:05:42','2023-08-17 20:05:42'),(4495,'4212106','Palmitos','SC','2023-08-17 20:05:42','2023-08-17 20:05:42'),(4496,'4212205','Papanduva','SC','2023-08-17 20:05:42','2023-08-17 20:05:42'),(4497,'4212239','Paraiso','SC','2023-08-17 20:05:42','2023-08-17 20:05:42'),(4498,'4212254','Passo de Torres','SC','2023-08-17 20:05:42','2023-08-17 20:05:42'),(4499,'4212270','Passos Maia','SC','2023-08-17 20:05:42','2023-08-17 20:05:42'),(4500,'4212304','Paulo Lopes','SC','2023-08-17 20:05:42','2023-08-17 20:05:42'),(4501,'4212403','Pedras Grandes','SC','2023-08-17 20:05:42','2023-08-17 20:05:42'),(4502,'4212502','Penha','SC','2023-08-17 20:05:42','2023-08-17 20:05:42'),(4503,'4212601','Peritiba','SC','2023-08-17 20:05:42','2023-08-17 20:05:42'),(4504,'4212650','Pescaria Brava','SC','2023-08-17 20:05:42','2023-08-17 20:05:42'),(4505,'4212700','Petrolândia','SC','2023-08-17 20:05:42','2023-08-17 20:05:42'),(4506,'4212809','Balneario Piçarras','SC','2023-08-17 20:05:42','2023-08-17 20:05:42'),(4507,'4212908','Pinhalzinho','SC','2023-08-17 20:05:42','2023-08-17 20:05:42'),(4508,'4213005','Pinheiro Preto','SC','2023-08-17 20:05:42','2023-08-17 20:05:42'),(4509,'4213104','Piratuba','SC','2023-08-17 20:05:42','2023-08-17 20:05:42'),(4510,'4213153','Planalto Alegre','SC','2023-08-17 20:05:42','2023-08-17 20:05:42'),(4511,'4213203','Pomerode','SC','2023-08-17 20:05:42','2023-08-17 20:05:42'),(4512,'4213302','Ponte Alta','SC','2023-08-17 20:05:42','2023-08-17 20:05:42'),(4513,'4213351','Ponte Alta do Norte','SC','2023-08-17 20:05:42','2023-08-17 20:05:42'),(4514,'4213401','Ponte Serrada','SC','2023-08-17 20:05:42','2023-08-17 20:05:42'),(4515,'4213500','Porto Belo','SC','2023-08-17 20:05:42','2023-08-17 20:05:42'),(4516,'4213609','Porto Uniao','SC','2023-08-17 20:05:42','2023-08-17 20:05:42'),(4517,'4213708','Pouso Redondo','SC','2023-08-17 20:05:42','2023-08-17 20:05:42'),(4518,'4213807','Praia Grande','SC','2023-08-17 20:05:42','2023-08-17 20:05:42'),(4519,'4213906','Presidente Castello Branco','SC','2023-08-17 20:05:42','2023-08-17 20:05:42'),(4520,'4214003','Presidente Getulio','SC','2023-08-17 20:05:42','2023-08-17 20:05:42'),(4521,'4214102','Presidente Nereu','SC','2023-08-17 20:05:42','2023-08-17 20:05:42'),(4522,'4214151','Princesa','SC','2023-08-17 20:05:42','2023-08-17 20:05:42'),(4523,'4214201','Quilombo','SC','2023-08-17 20:05:42','2023-08-17 20:05:42'),(4524,'4214300','Rancho Queimado','SC','2023-08-17 20:05:42','2023-08-17 20:05:42'),(4525,'4214409','Rio das Antas','SC','2023-08-17 20:05:42','2023-08-17 20:05:42'),(4526,'4214508','Rio do Campo','SC','2023-08-17 20:05:42','2023-08-17 20:05:42'),(4527,'4214607','Rio do Oeste','SC','2023-08-17 20:05:42','2023-08-17 20:05:42'),(4528,'4214706','Rio dos Cedros','SC','2023-08-17 20:05:42','2023-08-17 20:05:42'),(4529,'4214805','Rio do Sul','SC','2023-08-17 20:05:42','2023-08-17 20:05:42'),(4530,'4214904','Rio Fortuna','SC','2023-08-17 20:05:42','2023-08-17 20:05:42'),(4531,'4215000','Rio Negrinho','SC','2023-08-17 20:05:42','2023-08-17 20:05:42'),(4532,'4215059','Rio Rufino','SC','2023-08-17 20:05:42','2023-08-17 20:05:42'),(4533,'4215075','Riqueza','SC','2023-08-17 20:05:42','2023-08-17 20:05:42'),(4534,'4215109','Rodeio','SC','2023-08-17 20:05:42','2023-08-17 20:05:42'),(4535,'4215208','Romelândia','SC','2023-08-17 20:05:42','2023-08-17 20:05:42'),(4536,'4215307','Salete','SC','2023-08-17 20:05:42','2023-08-17 20:05:42'),(4537,'4215356','Saltinho','SC','2023-08-17 20:05:42','2023-08-17 20:05:42'),(4538,'4215406','Salto Veloso','SC','2023-08-17 20:05:42','2023-08-17 20:05:42'),(4539,'4215455','Sangao','SC','2023-08-17 20:05:42','2023-08-17 20:05:42'),(4540,'4215505','Santa Cecilia','SC','2023-08-17 20:05:42','2023-08-17 20:05:42'),(4541,'4215554','Santa Helena','SC','2023-08-17 20:05:42','2023-08-17 20:05:42'),(4542,'4215604','Santa Rosa de Lima','SC','2023-08-17 20:05:42','2023-08-17 20:05:42'),(4543,'4215653','Santa Rosa do Sul','SC','2023-08-17 20:05:42','2023-08-17 20:05:42'),(4544,'4215679','Santa Terezinha','SC','2023-08-17 20:05:42','2023-08-17 20:05:42'),(4545,'4215687','Santa Terezinha do Progresso','SC','2023-08-17 20:05:42','2023-08-17 20:05:42'),(4546,'4215695','Santiago do Sul','SC','2023-08-17 20:05:42','2023-08-17 20:05:42'),(4547,'4215703','Santo Amaro da Imperatriz','SC','2023-08-17 20:05:42','2023-08-17 20:05:42'),(4548,'4215752','Sao Bernardino','SC','2023-08-17 20:05:42','2023-08-17 20:05:42'),(4549,'4215802','Sao Bento do Sul','SC','2023-08-17 20:05:42','2023-08-17 20:05:42'),(4550,'4215901','Sao Bonifacio','SC','2023-08-17 20:05:42','2023-08-17 20:05:42'),(4551,'4216008','Sao Carlos','SC','2023-08-17 20:05:42','2023-08-17 20:05:42'),(4552,'4216057','Sao Cristovao do Sul','SC','2023-08-17 20:05:42','2023-08-17 20:05:42'),(4553,'4216107','Sao Domingos','SC','2023-08-17 20:05:42','2023-08-17 20:05:42'),(4554,'4216206','Sao Francisco do Sul','SC','2023-08-17 20:05:42','2023-08-17 20:05:42'),(4555,'4216255','Sao Joao do Oeste','SC','2023-08-17 20:05:42','2023-08-17 20:05:42'),(4556,'4216305','Sao Joao Batista','SC','2023-08-17 20:05:42','2023-08-17 20:05:42'),(4557,'4216354','Sao Joao do Itaperiu','SC','2023-08-17 20:05:42','2023-08-17 20:05:42'),(4558,'4216404','Sao Joao do Sul','SC','2023-08-17 20:05:42','2023-08-17 20:05:42'),(4559,'4216503','Sao Joaquim','SC','2023-08-17 20:05:42','2023-08-17 20:05:42'),(4560,'4216602','Sao Jose','SC','2023-08-17 20:05:42','2023-08-17 20:05:42'),(4561,'4216701','Sao Jose do Cedro','SC','2023-08-17 20:05:42','2023-08-17 20:05:42'),(4562,'4216800','Sao Jose do Cerrito','SC','2023-08-17 20:05:42','2023-08-17 20:05:42'),(4563,'4216909','Sao Lourenço do Oeste','SC','2023-08-17 20:05:42','2023-08-17 20:05:42'),(4564,'4217006','Sao Ludgero','SC','2023-08-17 20:05:42','2023-08-17 20:05:42'),(4565,'4217105','Sao Martinho','SC','2023-08-17 20:05:42','2023-08-17 20:05:42'),(4566,'4217154','Sao Miguel da Boa Vista','SC','2023-08-17 20:05:42','2023-08-17 20:05:42'),(4567,'4217204','Sao Miguel do Oeste','SC','2023-08-17 20:05:42','2023-08-17 20:05:42'),(4568,'4217253','Sao Pedro de Alcântara','SC','2023-08-17 20:05:42','2023-08-17 20:05:42'),(4569,'4217303','Saudades','SC','2023-08-17 20:05:42','2023-08-17 20:05:42'),(4570,'4217402','Schroeder','SC','2023-08-17 20:05:42','2023-08-17 20:05:42'),(4571,'4217501','Seara','SC','2023-08-17 20:05:42','2023-08-17 20:05:42'),(4572,'4217550','Serra Alta','SC','2023-08-17 20:05:42','2023-08-17 20:05:42'),(4573,'4217600','Sideropolis','SC','2023-08-17 20:05:42','2023-08-17 20:05:42'),(4574,'4217709','Sombrio','SC','2023-08-17 20:05:42','2023-08-17 20:05:42'),(4575,'4217758','Sul Brasil','SC','2023-08-17 20:05:42','2023-08-17 20:05:42'),(4576,'4217808','Taio','SC','2023-08-17 20:05:42','2023-08-17 20:05:42'),(4577,'4217907','Tangara','SC','2023-08-17 20:05:42','2023-08-17 20:05:42'),(4578,'4217956','Tigrinhos','SC','2023-08-17 20:05:42','2023-08-17 20:05:42'),(4579,'4218004','Tijucas','SC','2023-08-17 20:05:42','2023-08-17 20:05:42'),(4580,'4218103','Timbe do Sul','SC','2023-08-17 20:05:42','2023-08-17 20:05:42'),(4581,'4218202','Timbo','SC','2023-08-17 20:05:42','2023-08-17 20:05:42'),(4582,'4218251','Timbo Grande','SC','2023-08-17 20:05:42','2023-08-17 20:05:42'),(4583,'4218301','Três Barras','SC','2023-08-17 20:05:42','2023-08-17 20:05:42'),(4584,'4218350','Treviso','SC','2023-08-17 20:05:42','2023-08-17 20:05:42'),(4585,'4218400','Treze de Maio','SC','2023-08-17 20:05:42','2023-08-17 20:05:42'),(4586,'4218509','Treze Tilias','SC','2023-08-17 20:05:42','2023-08-17 20:05:42'),(4587,'4218608','Trombudo Central','SC','2023-08-17 20:05:42','2023-08-17 20:05:42'),(4588,'4218707','Tubarao','SC','2023-08-17 20:05:42','2023-08-17 20:05:42'),(4589,'4218756','Tunapolis','SC','2023-08-17 20:05:42','2023-08-17 20:05:42'),(4590,'4218806','Turvo','SC','2023-08-17 20:05:42','2023-08-17 20:05:42'),(4591,'4218855','Uniao do Oeste','SC','2023-08-17 20:05:42','2023-08-17 20:05:42'),(4592,'4218905','Urubici','SC','2023-08-17 20:05:42','2023-08-17 20:05:42'),(4593,'4218954','Urupema','SC','2023-08-17 20:05:42','2023-08-17 20:05:42'),(4594,'4219002','Urussanga','SC','2023-08-17 20:05:42','2023-08-17 20:05:42'),(4595,'4219101','Vargeao','SC','2023-08-17 20:05:42','2023-08-17 20:05:42'),(4596,'4219150','Vargem','SC','2023-08-17 20:05:42','2023-08-17 20:05:42'),(4597,'4219176','Vargem Bonita','SC','2023-08-17 20:05:42','2023-08-17 20:05:42'),(4598,'4219200','Vidal Ramos','SC','2023-08-17 20:05:42','2023-08-17 20:05:42'),(4599,'4219309','Videira','SC','2023-08-17 20:05:42','2023-08-17 20:05:42'),(4600,'4219358','Vitor Meireles','SC','2023-08-17 20:05:42','2023-08-17 20:05:42'),(4601,'4219408','Witmarsum','SC','2023-08-17 20:05:42','2023-08-17 20:05:42'),(4602,'4219507','Xanxerê','SC','2023-08-17 20:05:42','2023-08-17 20:05:42'),(4603,'4219606','Xavantina','SC','2023-08-17 20:05:42','2023-08-17 20:05:42'),(4604,'4219705','Xaxim','SC','2023-08-17 20:05:42','2023-08-17 20:05:42'),(4605,'4219853','Zortea','SC','2023-08-17 20:05:42','2023-08-17 20:05:42'),(4606,'4220000','Balneario Rincao','SC','2023-08-17 20:05:42','2023-08-17 20:05:42'),(4607,'4300034','Acegua','RS','2023-08-17 20:05:42','2023-08-17 20:05:42'),(4608,'4300059','agua Santa','RS','2023-08-17 20:05:42','2023-08-17 20:05:42'),(4609,'4300109','Agudo','RS','2023-08-17 20:05:42','2023-08-17 20:05:42'),(4610,'4300208','Ajuricaba','RS','2023-08-17 20:05:42','2023-08-17 20:05:42'),(4611,'4300307','Alecrim','RS','2023-08-17 20:05:42','2023-08-17 20:05:42'),(4612,'4300406','Alegrete','RS','2023-08-17 20:05:42','2023-08-17 20:05:42'),(4613,'4300455','Alegria','RS','2023-08-17 20:05:42','2023-08-17 20:05:42'),(4614,'4300471','Almirante Tamandare do Sul','RS','2023-08-17 20:05:42','2023-08-17 20:05:42'),(4615,'4300505','Alpestre','RS','2023-08-17 20:05:42','2023-08-17 20:05:42'),(4616,'4300554','Alto Alegre','RS','2023-08-17 20:05:42','2023-08-17 20:05:42'),(4617,'4300570','Alto Feliz','RS','2023-08-17 20:05:42','2023-08-17 20:05:42'),(4618,'4300604','Alvorada','RS','2023-08-17 20:05:42','2023-08-17 20:05:42'),(4619,'4300638','Amaral Ferrador','RS','2023-08-17 20:05:42','2023-08-17 20:05:42'),(4620,'4300646','Ametista do Sul','RS','2023-08-17 20:05:42','2023-08-17 20:05:42'),(4621,'4300661','Andre da Rocha','RS','2023-08-17 20:05:42','2023-08-17 20:05:42'),(4622,'4300703','Anta Gorda','RS','2023-08-17 20:05:42','2023-08-17 20:05:42'),(4623,'4300802','Antônio Prado','RS','2023-08-17 20:05:42','2023-08-17 20:05:42'),(4624,'4300851','Arambare','RS','2023-08-17 20:05:42','2023-08-17 20:05:42'),(4625,'4300877','Ararica','RS','2023-08-17 20:05:42','2023-08-17 20:05:42'),(4626,'4300901','Aratiba','RS','2023-08-17 20:05:42','2023-08-17 20:05:42'),(4627,'4301008','Arroio do Meio','RS','2023-08-17 20:05:42','2023-08-17 20:05:42'),(4628,'4301057','Arroio do Sal','RS','2023-08-17 20:05:42','2023-08-17 20:05:42'),(4629,'4301073','Arroio do Padre','RS','2023-08-17 20:05:42','2023-08-17 20:05:42'),(4630,'4301107','Arroio dos Ratos','RS','2023-08-17 20:05:42','2023-08-17 20:05:42'),(4631,'4301206','Arroio do Tigre','RS','2023-08-17 20:05:42','2023-08-17 20:05:42'),(4632,'4301305','Arroio Grande','RS','2023-08-17 20:05:42','2023-08-17 20:05:42'),(4633,'4301404','Arvorezinha','RS','2023-08-17 20:05:42','2023-08-17 20:05:42'),(4634,'4301503','Augusto Pestana','RS','2023-08-17 20:05:42','2023-08-17 20:05:42'),(4635,'4301552','aurea','RS','2023-08-17 20:05:42','2023-08-17 20:05:42'),(4636,'4301602','Bage','RS','2023-08-17 20:05:42','2023-08-17 20:05:42'),(4637,'4301636','Balneario Pinhal','RS','2023-08-17 20:05:42','2023-08-17 20:05:42'),(4638,'4301651','Barao','RS','2023-08-17 20:05:42','2023-08-17 20:05:42'),(4639,'4301701','Barao de Cotegipe','RS','2023-08-17 20:05:42','2023-08-17 20:05:42'),(4640,'4301750','Barao do Triunfo','RS','2023-08-17 20:05:42','2023-08-17 20:05:42'),(4641,'4301800','Barracao','RS','2023-08-17 20:05:42','2023-08-17 20:05:42'),(4642,'4301859','Barra do Guarita','RS','2023-08-17 20:05:42','2023-08-17 20:05:42'),(4643,'4301875','Barra do Quarai','RS','2023-08-17 20:05:42','2023-08-17 20:05:42'),(4644,'4301909','Barra do Ribeiro','RS','2023-08-17 20:05:42','2023-08-17 20:05:42'),(4645,'4301925','Barra do Rio Azul','RS','2023-08-17 20:05:42','2023-08-17 20:05:42'),(4646,'4301958','Barra Funda','RS','2023-08-17 20:05:42','2023-08-17 20:05:42'),(4647,'4302006','Barros Cassal','RS','2023-08-17 20:05:42','2023-08-17 20:05:42'),(4648,'4302055','Benjamin Constant do Sul','RS','2023-08-17 20:05:42','2023-08-17 20:05:42'),(4649,'4302105','Bento Gonçalves','RS','2023-08-17 20:05:42','2023-08-17 20:05:42'),(4650,'4302154','Boa Vista das Missoes','RS','2023-08-17 20:05:42','2023-08-17 20:05:42'),(4651,'4302204','Boa Vista do Burica','RS','2023-08-17 20:05:42','2023-08-17 20:05:42'),(4652,'4302220','Boa Vista do Cadeado','RS','2023-08-17 20:05:42','2023-08-17 20:05:42'),(4653,'4302238','Boa Vista do Incra','RS','2023-08-17 20:05:42','2023-08-17 20:05:42'),(4654,'4302253','Boa Vista do Sul','RS','2023-08-17 20:05:42','2023-08-17 20:05:42'),(4655,'4302303','Bom Jesus','RS','2023-08-17 20:05:42','2023-08-17 20:05:42'),(4656,'4302352','Bom Principio','RS','2023-08-17 20:05:42','2023-08-17 20:05:42'),(4657,'4302378','Bom Progresso','RS','2023-08-17 20:05:42','2023-08-17 20:05:42'),(4658,'4302402','Bom Retiro do Sul','RS','2023-08-17 20:05:42','2023-08-17 20:05:42'),(4659,'4302451','Boqueirao do Leao','RS','2023-08-17 20:05:42','2023-08-17 20:05:42'),(4660,'4302501','Bossoroca','RS','2023-08-17 20:05:42','2023-08-17 20:05:42'),(4661,'4302584','Bozano','RS','2023-08-17 20:05:42','2023-08-17 20:05:42'),(4662,'4302600','Braga','RS','2023-08-17 20:05:42','2023-08-17 20:05:42'),(4663,'4302659','Brochier','RS','2023-08-17 20:05:42','2023-08-17 20:05:42'),(4664,'4302709','Butia','RS','2023-08-17 20:05:42','2023-08-17 20:05:42'),(4665,'4302808','Caçapava do Sul','RS','2023-08-17 20:05:42','2023-08-17 20:05:42'),(4666,'4302907','Cacequi','RS','2023-08-17 20:05:42','2023-08-17 20:05:42'),(4667,'4303004','Cachoeira do Sul','RS','2023-08-17 20:05:42','2023-08-17 20:05:42'),(4668,'4303103','Cachoeirinha','RS','2023-08-17 20:05:42','2023-08-17 20:05:42'),(4669,'4303202','Cacique Doble','RS','2023-08-17 20:05:42','2023-08-17 20:05:42'),(4670,'4303301','Caibate','RS','2023-08-17 20:05:42','2023-08-17 20:05:42'),(4671,'4303400','Caiçara','RS','2023-08-17 20:05:42','2023-08-17 20:05:42'),(4672,'4303509','Camaqua','RS','2023-08-17 20:05:42','2023-08-17 20:05:42'),(4673,'4303558','Camargo','RS','2023-08-17 20:05:42','2023-08-17 20:05:42'),(4674,'4303608','Cambara do Sul','RS','2023-08-17 20:05:42','2023-08-17 20:05:42'),(4675,'4303673','Campestre da Serra','RS','2023-08-17 20:05:42','2023-08-17 20:05:42'),(4676,'4303707','Campina das Missoes','RS','2023-08-17 20:05:42','2023-08-17 20:05:42'),(4677,'4303806','Campinas do Sul','RS','2023-08-17 20:05:43','2023-08-17 20:05:43'),(4678,'4303905','Campo Bom','RS','2023-08-17 20:05:43','2023-08-17 20:05:43'),(4679,'4304002','Campo Novo','RS','2023-08-17 20:05:43','2023-08-17 20:05:43'),(4680,'4304101','Campos Borges','RS','2023-08-17 20:05:43','2023-08-17 20:05:43'),(4681,'4304200','Candelaria','RS','2023-08-17 20:05:43','2023-08-17 20:05:43'),(4682,'4304309','Cândido Godoi','RS','2023-08-17 20:05:43','2023-08-17 20:05:43'),(4683,'4304358','Candiota','RS','2023-08-17 20:05:43','2023-08-17 20:05:43'),(4684,'4304408','Canela','RS','2023-08-17 20:05:43','2023-08-17 20:05:43'),(4685,'4304507','Canguçu','RS','2023-08-17 20:05:43','2023-08-17 20:05:43'),(4686,'4304606','Canoas','RS','2023-08-17 20:05:43','2023-08-17 20:05:43'),(4687,'4304614','Canudos do Vale','RS','2023-08-17 20:05:43','2023-08-17 20:05:43'),(4688,'4304622','Capao Bonito do Sul','RS','2023-08-17 20:05:43','2023-08-17 20:05:43'),(4689,'4304630','Capao da Canoa','RS','2023-08-17 20:05:43','2023-08-17 20:05:43'),(4690,'4304655','Capao do Cipo','RS','2023-08-17 20:05:43','2023-08-17 20:05:43'),(4691,'4304663','Capao do Leao','RS','2023-08-17 20:05:43','2023-08-17 20:05:43'),(4692,'4304671','Capivari do Sul','RS','2023-08-17 20:05:43','2023-08-17 20:05:43'),(4693,'4304689','Capela de Santana','RS','2023-08-17 20:05:43','2023-08-17 20:05:43'),(4694,'4304697','Capitao','RS','2023-08-17 20:05:43','2023-08-17 20:05:43'),(4695,'4304705','Carazinho','RS','2023-08-17 20:05:43','2023-08-17 20:05:43'),(4696,'4304713','Caraa','RS','2023-08-17 20:05:43','2023-08-17 20:05:43'),(4697,'4304804','Carlos Barbosa','RS','2023-08-17 20:05:43','2023-08-17 20:05:43'),(4698,'4304853','Carlos Gomes','RS','2023-08-17 20:05:43','2023-08-17 20:05:43'),(4699,'4304903','Casca','RS','2023-08-17 20:05:43','2023-08-17 20:05:43'),(4700,'4304952','Caseiros','RS','2023-08-17 20:05:43','2023-08-17 20:05:43'),(4701,'4305009','Catuipe','RS','2023-08-17 20:05:43','2023-08-17 20:05:43'),(4702,'4305108','Caxias do Sul','RS','2023-08-17 20:05:43','2023-08-17 20:05:43'),(4703,'4305116','Centenario','RS','2023-08-17 20:05:43','2023-08-17 20:05:43'),(4704,'4305124','Cerrito','RS','2023-08-17 20:05:43','2023-08-17 20:05:43'),(4705,'4305132','Cerro Branco','RS','2023-08-17 20:05:43','2023-08-17 20:05:43'),(4706,'4305157','Cerro Grande','RS','2023-08-17 20:05:43','2023-08-17 20:05:43'),(4707,'4305173','Cerro Grande do Sul','RS','2023-08-17 20:05:43','2023-08-17 20:05:43'),(4708,'4305207','Cerro Largo','RS','2023-08-17 20:05:43','2023-08-17 20:05:43'),(4709,'4305306','Chapada','RS','2023-08-17 20:05:43','2023-08-17 20:05:43'),(4710,'4305355','Charqueadas','RS','2023-08-17 20:05:43','2023-08-17 20:05:43'),(4711,'4305371','Charrua','RS','2023-08-17 20:05:43','2023-08-17 20:05:43'),(4712,'4305405','Chiapetta','RS','2023-08-17 20:05:43','2023-08-17 20:05:43'),(4713,'4305439','Chui','RS','2023-08-17 20:05:43','2023-08-17 20:05:43'),(4714,'4305447','Chuvisca','RS','2023-08-17 20:05:43','2023-08-17 20:05:43'),(4715,'4305454','Cidreira','RS','2023-08-17 20:05:43','2023-08-17 20:05:43'),(4716,'4305504','Ciriaco','RS','2023-08-17 20:05:43','2023-08-17 20:05:43'),(4717,'4305587','Colinas','RS','2023-08-17 20:05:43','2023-08-17 20:05:43'),(4718,'4305603','Colorado','RS','2023-08-17 20:05:43','2023-08-17 20:05:43'),(4719,'4305702','Condor','RS','2023-08-17 20:05:43','2023-08-17 20:05:43'),(4720,'4305801','Constantina','RS','2023-08-17 20:05:43','2023-08-17 20:05:43'),(4721,'4305835','Coqueiro Baixo','RS','2023-08-17 20:05:43','2023-08-17 20:05:43'),(4722,'4305850','Coqueiros do Sul','RS','2023-08-17 20:05:43','2023-08-17 20:05:43'),(4723,'4305871','Coronel Barros','RS','2023-08-17 20:05:43','2023-08-17 20:05:43'),(4724,'4305900','Coronel Bicaco','RS','2023-08-17 20:05:43','2023-08-17 20:05:43'),(4725,'4305934','Coronel Pilar','RS','2023-08-17 20:05:43','2023-08-17 20:05:43'),(4726,'4305959','Cotipora','RS','2023-08-17 20:05:43','2023-08-17 20:05:43'),(4727,'4305975','Coxilha','RS','2023-08-17 20:05:43','2023-08-17 20:05:43'),(4728,'4306007','Crissiumal','RS','2023-08-17 20:05:43','2023-08-17 20:05:43'),(4729,'4306056','Cristal','RS','2023-08-17 20:05:43','2023-08-17 20:05:43'),(4730,'4306072','Cristal do Sul','RS','2023-08-17 20:05:43','2023-08-17 20:05:43'),(4731,'4306106','Cruz Alta','RS','2023-08-17 20:05:43','2023-08-17 20:05:43'),(4732,'4306130','Cruzaltense','RS','2023-08-17 20:05:43','2023-08-17 20:05:43'),(4733,'4306205','Cruzeiro do Sul','RS','2023-08-17 20:05:43','2023-08-17 20:05:43'),(4734,'4306304','David Canabarro','RS','2023-08-17 20:05:43','2023-08-17 20:05:43'),(4735,'4306320','Derrubadas','RS','2023-08-17 20:05:43','2023-08-17 20:05:43'),(4736,'4306353','Dezesseis de Novembro','RS','2023-08-17 20:05:43','2023-08-17 20:05:43'),(4737,'4306379','Dilermando de Aguiar','RS','2023-08-17 20:05:43','2023-08-17 20:05:43'),(4738,'4306403','Dois Irmaos','RS','2023-08-17 20:05:43','2023-08-17 20:05:43'),(4739,'4306429','Dois Irmaos das Missoes','RS','2023-08-17 20:05:43','2023-08-17 20:05:43'),(4740,'4306452','Dois Lajeados','RS','2023-08-17 20:05:43','2023-08-17 20:05:43'),(4741,'4306502','Dom Feliciano','RS','2023-08-17 20:05:43','2023-08-17 20:05:43'),(4742,'4306551','Dom Pedro de Alcântara','RS','2023-08-17 20:05:43','2023-08-17 20:05:43'),(4743,'4306601','Dom Pedrito','RS','2023-08-17 20:05:43','2023-08-17 20:05:43'),(4744,'4306700','Dona Francisca','RS','2023-08-17 20:05:43','2023-08-17 20:05:43'),(4745,'4306734','Doutor Mauricio Cardoso','RS','2023-08-17 20:05:43','2023-08-17 20:05:43'),(4746,'4306759','Doutor Ricardo','RS','2023-08-17 20:05:43','2023-08-17 20:05:43'),(4747,'4306767','Eldorado do Sul','RS','2023-08-17 20:05:43','2023-08-17 20:05:43'),(4748,'4306809','Encantado','RS','2023-08-17 20:05:43','2023-08-17 20:05:43'),(4749,'4306908','Encruzilhada do Sul','RS','2023-08-17 20:05:43','2023-08-17 20:05:43'),(4750,'4306924','Engenho Velho','RS','2023-08-17 20:05:43','2023-08-17 20:05:43'),(4751,'4306932','Entre-Ijuis','RS','2023-08-17 20:05:43','2023-08-17 20:05:43'),(4752,'4306957','Entre Rios do Sul','RS','2023-08-17 20:05:43','2023-08-17 20:05:43'),(4753,'4306973','Erebango','RS','2023-08-17 20:05:43','2023-08-17 20:05:43'),(4754,'4307005','Erechim','RS','2023-08-17 20:05:43','2023-08-17 20:05:43'),(4755,'4307054','Ernestina','RS','2023-08-17 20:05:43','2023-08-17 20:05:43'),(4756,'4307104','Herval','RS','2023-08-17 20:05:43','2023-08-17 20:05:43'),(4757,'4307203','Erval Grande','RS','2023-08-17 20:05:43','2023-08-17 20:05:43'),(4758,'4307302','Erval Seco','RS','2023-08-17 20:05:43','2023-08-17 20:05:43'),(4759,'4307401','Esmeralda','RS','2023-08-17 20:05:43','2023-08-17 20:05:43'),(4760,'4307450','Esperança do Sul','RS','2023-08-17 20:05:43','2023-08-17 20:05:43'),(4761,'4307500','Espumoso','RS','2023-08-17 20:05:43','2023-08-17 20:05:43'),(4762,'4307559','Estaçao','RS','2023-08-17 20:05:43','2023-08-17 20:05:43'),(4763,'4307609','Estância Velha','RS','2023-08-17 20:05:43','2023-08-17 20:05:43'),(4764,'4307708','Esteio','RS','2023-08-17 20:05:43','2023-08-17 20:05:43'),(4765,'4307807','Estrela','RS','2023-08-17 20:05:43','2023-08-17 20:05:43'),(4766,'4307815','Estrela Velha','RS','2023-08-17 20:05:43','2023-08-17 20:05:43'),(4767,'4307831','Eugênio de Castro','RS','2023-08-17 20:05:43','2023-08-17 20:05:43'),(4768,'4307864','Fagundes Varela','RS','2023-08-17 20:05:43','2023-08-17 20:05:43'),(4769,'4307906','Farroupilha','RS','2023-08-17 20:05:43','2023-08-17 20:05:43'),(4770,'4308003','Faxinal do Soturno','RS','2023-08-17 20:05:43','2023-08-17 20:05:43'),(4771,'4308052','Faxinalzinho','RS','2023-08-17 20:05:43','2023-08-17 20:05:43'),(4772,'4308078','Fazenda Vilanova','RS','2023-08-17 20:05:43','2023-08-17 20:05:43'),(4773,'4308102','Feliz','RS','2023-08-17 20:05:43','2023-08-17 20:05:43'),(4774,'4308201','Flores da Cunha','RS','2023-08-17 20:05:43','2023-08-17 20:05:43'),(4775,'4308250','Floriano Peixoto','RS','2023-08-17 20:05:43','2023-08-17 20:05:43'),(4776,'4308300','Fontoura Xavier','RS','2023-08-17 20:05:43','2023-08-17 20:05:43'),(4777,'4308409','Formigueiro','RS','2023-08-17 20:05:43','2023-08-17 20:05:43'),(4778,'4308433','Forquetinha','RS','2023-08-17 20:05:43','2023-08-17 20:05:43'),(4779,'4308458','Fortaleza dos Valos','RS','2023-08-17 20:05:43','2023-08-17 20:05:43'),(4780,'4308508','Frederico Westphalen','RS','2023-08-17 20:05:43','2023-08-17 20:05:43'),(4781,'4308607','Garibaldi','RS','2023-08-17 20:05:43','2023-08-17 20:05:43'),(4782,'4308656','Garruchos','RS','2023-08-17 20:05:43','2023-08-17 20:05:43'),(4783,'4308706','Gaurama','RS','2023-08-17 20:05:43','2023-08-17 20:05:43'),(4784,'4308805','General Câmara','RS','2023-08-17 20:05:43','2023-08-17 20:05:43'),(4785,'4308854','Gentil','RS','2023-08-17 20:05:43','2023-08-17 20:05:43'),(4786,'4308904','Getulio Vargas','RS','2023-08-17 20:05:43','2023-08-17 20:05:43'),(4787,'4309001','Girua','RS','2023-08-17 20:05:43','2023-08-17 20:05:43'),(4788,'4309050','Glorinha','RS','2023-08-17 20:05:43','2023-08-17 20:05:43'),(4789,'4309100','Gramado','RS','2023-08-17 20:05:43','2023-08-17 20:05:43'),(4790,'4309126','Gramado dos Loureiros','RS','2023-08-17 20:05:43','2023-08-17 20:05:43'),(4791,'4309159','Gramado Xavier','RS','2023-08-17 20:05:43','2023-08-17 20:05:43'),(4792,'4309209','Gravatai','RS','2023-08-17 20:05:43','2023-08-17 20:05:43'),(4793,'4309258','Guabiju','RS','2023-08-17 20:05:43','2023-08-17 20:05:43'),(4794,'4309308','Guaiba','RS','2023-08-17 20:05:43','2023-08-17 20:05:43'),(4795,'4309407','Guapore','RS','2023-08-17 20:05:43','2023-08-17 20:05:43'),(4796,'4309506','Guarani das Missoes','RS','2023-08-17 20:05:43','2023-08-17 20:05:43'),(4797,'4309555','Harmonia','RS','2023-08-17 20:05:43','2023-08-17 20:05:43'),(4798,'4309571','Herveiras','RS','2023-08-17 20:05:43','2023-08-17 20:05:43'),(4799,'4309605','Horizontina','RS','2023-08-17 20:05:43','2023-08-17 20:05:43'),(4800,'4309654','Hulha Negra','RS','2023-08-17 20:05:43','2023-08-17 20:05:43'),(4801,'4309704','Humaita','RS','2023-08-17 20:05:43','2023-08-17 20:05:43'),(4802,'4309753','Ibarama','RS','2023-08-17 20:05:43','2023-08-17 20:05:43'),(4803,'4309803','Ibiaça','RS','2023-08-17 20:05:43','2023-08-17 20:05:43'),(4804,'4309902','Ibiraiaras','RS','2023-08-17 20:05:43','2023-08-17 20:05:43'),(4805,'4309951','Ibirapuita','RS','2023-08-17 20:05:43','2023-08-17 20:05:43'),(4806,'4310009','Ibiruba','RS','2023-08-17 20:05:43','2023-08-17 20:05:43'),(4807,'4310108','Igrejinha','RS','2023-08-17 20:05:43','2023-08-17 20:05:43'),(4808,'4310207','Ijui','RS','2023-08-17 20:05:43','2023-08-17 20:05:43'),(4809,'4310306','Ilopolis','RS','2023-08-17 20:05:43','2023-08-17 20:05:43'),(4810,'4310330','Imbe','RS','2023-08-17 20:05:43','2023-08-17 20:05:43'),(4811,'4310363','Imigrante','RS','2023-08-17 20:05:43','2023-08-17 20:05:43'),(4812,'4310405','Independência','RS','2023-08-17 20:05:43','2023-08-17 20:05:43'),(4813,'4310413','Inhacora','RS','2023-08-17 20:05:43','2023-08-17 20:05:43'),(4814,'4310439','Ipê','RS','2023-08-17 20:05:43','2023-08-17 20:05:43'),(4815,'4310462','Ipiranga do Sul','RS','2023-08-17 20:05:43','2023-08-17 20:05:43'),(4816,'4310504','Irai','RS','2023-08-17 20:05:43','2023-08-17 20:05:43'),(4817,'4310538','Itaara','RS','2023-08-17 20:05:43','2023-08-17 20:05:43'),(4818,'4310553','Itacurubi','RS','2023-08-17 20:05:43','2023-08-17 20:05:43'),(4819,'4310579','Itapuca','RS','2023-08-17 20:05:43','2023-08-17 20:05:43'),(4820,'4310603','Itaqui','RS','2023-08-17 20:05:43','2023-08-17 20:05:43'),(4821,'4310652','Itati','RS','2023-08-17 20:05:43','2023-08-17 20:05:43'),(4822,'4310702','Itatiba do Sul','RS','2023-08-17 20:05:43','2023-08-17 20:05:43'),(4823,'4310751','Ivora','RS','2023-08-17 20:05:43','2023-08-17 20:05:43'),(4824,'4310801','Ivoti','RS','2023-08-17 20:05:43','2023-08-17 20:05:43'),(4825,'4310850','Jaboticaba','RS','2023-08-17 20:05:43','2023-08-17 20:05:43'),(4826,'4310876','Jacuizinho','RS','2023-08-17 20:05:43','2023-08-17 20:05:43'),(4827,'4310900','Jacutinga','RS','2023-08-17 20:05:43','2023-08-17 20:05:43'),(4828,'4311007','Jaguarao','RS','2023-08-17 20:05:43','2023-08-17 20:05:43'),(4829,'4311106','Jaguari','RS','2023-08-17 20:05:43','2023-08-17 20:05:43'),(4830,'4311122','Jaquirana','RS','2023-08-17 20:05:43','2023-08-17 20:05:43'),(4831,'4311130','Jari','RS','2023-08-17 20:05:43','2023-08-17 20:05:43'),(4832,'4311155','Joia','RS','2023-08-17 20:05:43','2023-08-17 20:05:43'),(4833,'4311205','Julio de Castilhos','RS','2023-08-17 20:05:43','2023-08-17 20:05:43'),(4834,'4311239','Lagoa Bonita do Sul','RS','2023-08-17 20:05:43','2023-08-17 20:05:43'),(4835,'4311254','Lagoao','RS','2023-08-17 20:05:43','2023-08-17 20:05:43'),(4836,'4311270','Lagoa dos Três Cantos','RS','2023-08-17 20:05:43','2023-08-17 20:05:43'),(4837,'4311304','Lagoa Vermelha','RS','2023-08-17 20:05:43','2023-08-17 20:05:43'),(4838,'4311403','Lajeado','RS','2023-08-17 20:05:43','2023-08-17 20:05:43'),(4839,'4311429','Lajeado do Bugre','RS','2023-08-17 20:05:43','2023-08-17 20:05:43'),(4840,'4311502','Lavras do Sul','RS','2023-08-17 20:05:43','2023-08-17 20:05:43'),(4841,'4311601','Liberato Salzano','RS','2023-08-17 20:05:43','2023-08-17 20:05:43'),(4842,'4311627','Lindolfo Collor','RS','2023-08-17 20:05:43','2023-08-17 20:05:43'),(4843,'4311643','Linha Nova','RS','2023-08-17 20:05:43','2023-08-17 20:05:43'),(4844,'4311700','Machadinho','RS','2023-08-17 20:05:43','2023-08-17 20:05:43'),(4845,'4311718','Maçambara','RS','2023-08-17 20:05:43','2023-08-17 20:05:43'),(4846,'4311734','Mampituba','RS','2023-08-17 20:05:43','2023-08-17 20:05:43'),(4847,'4311759','Manoel Viana','RS','2023-08-17 20:05:43','2023-08-17 20:05:43'),(4848,'4311775','Maquine','RS','2023-08-17 20:05:43','2023-08-17 20:05:43'),(4849,'4311791','Marata','RS','2023-08-17 20:05:43','2023-08-17 20:05:43'),(4850,'4311809','Marau','RS','2023-08-17 20:05:43','2023-08-17 20:05:43'),(4851,'4311908','Marcelino Ramos','RS','2023-08-17 20:05:43','2023-08-17 20:05:43'),(4852,'4311981','Mariana Pimentel','RS','2023-08-17 20:05:43','2023-08-17 20:05:43'),(4853,'4312005','Mariano Moro','RS','2023-08-17 20:05:43','2023-08-17 20:05:43'),(4854,'4312054','Marques de Souza','RS','2023-08-17 20:05:43','2023-08-17 20:05:43'),(4855,'4312104','Mata','RS','2023-08-17 20:05:43','2023-08-17 20:05:43'),(4856,'4312138','Mato Castelhano','RS','2023-08-17 20:05:43','2023-08-17 20:05:43'),(4857,'4312153','Mato Leitao','RS','2023-08-17 20:05:43','2023-08-17 20:05:43'),(4858,'4312179','Mato Queimado','RS','2023-08-17 20:05:43','2023-08-17 20:05:43'),(4859,'4312203','Maximiliano de Almeida','RS','2023-08-17 20:05:43','2023-08-17 20:05:43'),(4860,'4312252','Minas do Leao','RS','2023-08-17 20:05:43','2023-08-17 20:05:43'),(4861,'4312302','Miraguai','RS','2023-08-17 20:05:43','2023-08-17 20:05:43'),(4862,'4312351','Montauri','RS','2023-08-17 20:05:43','2023-08-17 20:05:43'),(4863,'4312377','Monte Alegre dos Campos','RS','2023-08-17 20:05:44','2023-08-17 20:05:44'),(4864,'4312385','Monte Belo do Sul','RS','2023-08-17 20:05:44','2023-08-17 20:05:44'),(4865,'4312401','Montenegro','RS','2023-08-17 20:05:44','2023-08-17 20:05:44'),(4866,'4312427','Mormaço','RS','2023-08-17 20:05:44','2023-08-17 20:05:44'),(4867,'4312443','Morrinhos do Sul','RS','2023-08-17 20:05:44','2023-08-17 20:05:44'),(4868,'4312450','Morro Redondo','RS','2023-08-17 20:05:44','2023-08-17 20:05:44'),(4869,'4312476','Morro Reuter','RS','2023-08-17 20:05:44','2023-08-17 20:05:44'),(4870,'4312500','Mostardas','RS','2023-08-17 20:05:44','2023-08-17 20:05:44'),(4871,'4312609','Muçum','RS','2023-08-17 20:05:44','2023-08-17 20:05:44'),(4872,'4312617','Muitos Capoes','RS','2023-08-17 20:05:44','2023-08-17 20:05:44'),(4873,'4312625','Muliterno','RS','2023-08-17 20:05:44','2023-08-17 20:05:44'),(4874,'4312658','Nao-Me-Toque','RS','2023-08-17 20:05:44','2023-08-17 20:05:44'),(4875,'4312674','Nicolau Vergueiro','RS','2023-08-17 20:05:44','2023-08-17 20:05:44'),(4876,'4312708','Nonoai','RS','2023-08-17 20:05:44','2023-08-17 20:05:44'),(4877,'4312757','Nova Alvorada','RS','2023-08-17 20:05:44','2023-08-17 20:05:44'),(4878,'4312807','Nova Araça','RS','2023-08-17 20:05:44','2023-08-17 20:05:44'),(4879,'4312906','Nova Bassano','RS','2023-08-17 20:05:44','2023-08-17 20:05:44'),(4880,'4312955','Nova Boa Vista','RS','2023-08-17 20:05:44','2023-08-17 20:05:44'),(4881,'4313003','Nova Brescia','RS','2023-08-17 20:05:44','2023-08-17 20:05:44'),(4882,'4313011','Nova Candelaria','RS','2023-08-17 20:05:44','2023-08-17 20:05:44'),(4883,'4313037','Nova Esperança do Sul','RS','2023-08-17 20:05:44','2023-08-17 20:05:44'),(4884,'4313060','Nova Hartz','RS','2023-08-17 20:05:44','2023-08-17 20:05:44'),(4885,'4313086','Nova Padua','RS','2023-08-17 20:05:44','2023-08-17 20:05:44'),(4886,'4313102','Nova Palma','RS','2023-08-17 20:05:44','2023-08-17 20:05:44'),(4887,'4313201','Nova Petropolis','RS','2023-08-17 20:05:44','2023-08-17 20:05:44'),(4888,'4313300','Nova Prata','RS','2023-08-17 20:05:44','2023-08-17 20:05:44'),(4889,'4313334','Nova Ramada','RS','2023-08-17 20:05:44','2023-08-17 20:05:44'),(4890,'4313359','Nova Roma do Sul','RS','2023-08-17 20:05:44','2023-08-17 20:05:44'),(4891,'4313375','Nova Santa Rita','RS','2023-08-17 20:05:44','2023-08-17 20:05:44'),(4892,'4313391','Novo Cabrais','RS','2023-08-17 20:05:44','2023-08-17 20:05:44'),(4893,'4313409','Novo Hamburgo','RS','2023-08-17 20:05:44','2023-08-17 20:05:44'),(4894,'4313425','Novo Machado','RS','2023-08-17 20:05:44','2023-08-17 20:05:44'),(4895,'4313441','Novo Tiradentes','RS','2023-08-17 20:05:44','2023-08-17 20:05:44'),(4896,'4313466','Novo Xingu','RS','2023-08-17 20:05:44','2023-08-17 20:05:44'),(4897,'4313490','Novo Barreiro','RS','2023-08-17 20:05:44','2023-08-17 20:05:44'),(4898,'4313508','Osorio','RS','2023-08-17 20:05:44','2023-08-17 20:05:44'),(4899,'4313607','Paim Filho','RS','2023-08-17 20:05:44','2023-08-17 20:05:44'),(4900,'4313656','Palmares do Sul','RS','2023-08-17 20:05:44','2023-08-17 20:05:44'),(4901,'4313706','Palmeira das Missoes','RS','2023-08-17 20:05:44','2023-08-17 20:05:44'),(4902,'4313805','Palmitinho','RS','2023-08-17 20:05:44','2023-08-17 20:05:44'),(4903,'4313904','Panambi','RS','2023-08-17 20:05:44','2023-08-17 20:05:44'),(4904,'4313953','Pantano Grande','RS','2023-08-17 20:05:44','2023-08-17 20:05:44'),(4905,'4314001','Parai','RS','2023-08-17 20:05:44','2023-08-17 20:05:44'),(4906,'4314027','Paraiso do Sul','RS','2023-08-17 20:05:44','2023-08-17 20:05:44'),(4907,'4314035','Pareci Novo','RS','2023-08-17 20:05:44','2023-08-17 20:05:44'),(4908,'4314050','Parobe','RS','2023-08-17 20:05:44','2023-08-17 20:05:44'),(4909,'4314068','Passa Sete','RS','2023-08-17 20:05:44','2023-08-17 20:05:44'),(4910,'4314076','Passo do Sobrado','RS','2023-08-17 20:05:44','2023-08-17 20:05:44'),(4911,'4314100','Passo Fundo','RS','2023-08-17 20:05:44','2023-08-17 20:05:44'),(4912,'4314134','Paulo Bento','RS','2023-08-17 20:05:44','2023-08-17 20:05:44'),(4913,'4314159','Paverama','RS','2023-08-17 20:05:44','2023-08-17 20:05:44'),(4914,'4314175','Pedras Altas','RS','2023-08-17 20:05:44','2023-08-17 20:05:44'),(4915,'4314209','Pedro Osorio','RS','2023-08-17 20:05:44','2023-08-17 20:05:44'),(4916,'4314308','Pejuçara','RS','2023-08-17 20:05:44','2023-08-17 20:05:44'),(4917,'4314407','Pelotas','RS','2023-08-17 20:05:44','2023-08-17 20:05:44'),(4918,'4314423','Picada Cafe','RS','2023-08-17 20:05:44','2023-08-17 20:05:44'),(4919,'4314456','Pinhal','RS','2023-08-17 20:05:44','2023-08-17 20:05:44'),(4920,'4314464','Pinhal da Serra','RS','2023-08-17 20:05:44','2023-08-17 20:05:44'),(4921,'4314472','Pinhal Grande','RS','2023-08-17 20:05:44','2023-08-17 20:05:44'),(4922,'4314498','Pinheirinho do Vale','RS','2023-08-17 20:05:44','2023-08-17 20:05:44'),(4923,'4314506','Pinheiro Machado','RS','2023-08-17 20:05:45','2023-08-17 20:05:45'),(4924,'4314548','Pinto Bandeira','RS','2023-08-17 20:05:45','2023-08-17 20:05:45'),(4925,'4314555','Pirapo','RS','2023-08-17 20:05:45','2023-08-17 20:05:45'),(4926,'4314605','Piratini','RS','2023-08-17 20:05:45','2023-08-17 20:05:45'),(4927,'4314704','Planalto','RS','2023-08-17 20:05:45','2023-08-17 20:05:45'),(4928,'4314753','Poço das Antas','RS','2023-08-17 20:05:45','2023-08-17 20:05:45'),(4929,'4314779','Pontao','RS','2023-08-17 20:05:45','2023-08-17 20:05:45'),(4930,'4314787','Ponte Preta','RS','2023-08-17 20:05:45','2023-08-17 20:05:45'),(4931,'4314803','Portao','RS','2023-08-17 20:05:45','2023-08-17 20:05:45'),(4932,'4314902','Porto Alegre','RS','2023-08-17 20:05:45','2023-08-17 20:05:45'),(4933,'4315008','Porto Lucena','RS','2023-08-17 20:05:45','2023-08-17 20:05:45'),(4934,'4315057','Porto Maua','RS','2023-08-17 20:05:45','2023-08-17 20:05:45'),(4935,'4315073','Porto Vera Cruz','RS','2023-08-17 20:05:45','2023-08-17 20:05:45'),(4936,'4315107','Porto Xavier','RS','2023-08-17 20:05:45','2023-08-17 20:05:45'),(4937,'4315131','Pouso Novo','RS','2023-08-17 20:05:45','2023-08-17 20:05:45'),(4938,'4315149','Presidente Lucena','RS','2023-08-17 20:05:45','2023-08-17 20:05:45'),(4939,'4315156','Progresso','RS','2023-08-17 20:05:45','2023-08-17 20:05:45'),(4940,'4315172','Protasio Alves','RS','2023-08-17 20:05:45','2023-08-17 20:05:45'),(4941,'4315206','Putinga','RS','2023-08-17 20:05:45','2023-08-17 20:05:45'),(4942,'4315305','Quarai','RS','2023-08-17 20:05:45','2023-08-17 20:05:45'),(4943,'4315313','Quatro Irmaos','RS','2023-08-17 20:05:45','2023-08-17 20:05:45'),(4944,'4315321','Quevedos','RS','2023-08-17 20:05:45','2023-08-17 20:05:45'),(4945,'4315354','Quinze de Novembro','RS','2023-08-17 20:05:45','2023-08-17 20:05:45'),(4946,'4315404','Redentora','RS','2023-08-17 20:05:45','2023-08-17 20:05:45'),(4947,'4315453','Relvado','RS','2023-08-17 20:05:45','2023-08-17 20:05:45'),(4948,'4315503','Restinga Seca','RS','2023-08-17 20:05:45','2023-08-17 20:05:45'),(4949,'4315552','Rio dos indios','RS','2023-08-17 20:05:45','2023-08-17 20:05:45'),(4950,'4315602','Rio Grande','RS','2023-08-17 20:05:45','2023-08-17 20:05:45'),(4951,'4315701','Rio Pardo','RS','2023-08-17 20:05:45','2023-08-17 20:05:45'),(4952,'4315750','Riozinho','RS','2023-08-17 20:05:45','2023-08-17 20:05:45'),(4953,'4315800','Roca Sales','RS','2023-08-17 20:05:45','2023-08-17 20:05:45'),(4954,'4315909','Rodeio Bonito','RS','2023-08-17 20:05:45','2023-08-17 20:05:45'),(4955,'4315958','Rolador','RS','2023-08-17 20:05:45','2023-08-17 20:05:45'),(4956,'4316006','Rolante','RS','2023-08-17 20:05:45','2023-08-17 20:05:45'),(4957,'4316105','Ronda Alta','RS','2023-08-17 20:05:45','2023-08-17 20:05:45'),(4958,'4316204','Rondinha','RS','2023-08-17 20:05:45','2023-08-17 20:05:45'),(4959,'4316303','Roque Gonzales','RS','2023-08-17 20:05:45','2023-08-17 20:05:45'),(4960,'4316402','Rosario do Sul','RS','2023-08-17 20:05:45','2023-08-17 20:05:45'),(4961,'4316428','Sagrada Familia','RS','2023-08-17 20:05:45','2023-08-17 20:05:45'),(4962,'4316436','Saldanha Marinho','RS','2023-08-17 20:05:45','2023-08-17 20:05:45'),(4963,'4316451','Salto do Jacui','RS','2023-08-17 20:05:45','2023-08-17 20:05:45'),(4964,'4316477','Salvador das Missoes','RS','2023-08-17 20:05:45','2023-08-17 20:05:45'),(4965,'4316501','Salvador do Sul','RS','2023-08-17 20:05:45','2023-08-17 20:05:45'),(4966,'4316600','Sananduva','RS','2023-08-17 20:05:45','2023-08-17 20:05:45'),(4967,'4316709','Santa Barbara do Sul','RS','2023-08-17 20:05:45','2023-08-17 20:05:45'),(4968,'4316733','Santa Cecilia do Sul','RS','2023-08-17 20:05:45','2023-08-17 20:05:45'),(4969,'4316758','Santa Clara do Sul','RS','2023-08-17 20:05:45','2023-08-17 20:05:45'),(4970,'4316808','Santa Cruz do Sul','RS','2023-08-17 20:05:45','2023-08-17 20:05:45'),(4971,'4316907','Santa Maria','RS','2023-08-17 20:05:45','2023-08-17 20:05:45'),(4972,'4316956','Santa Maria do Herval','RS','2023-08-17 20:05:45','2023-08-17 20:05:45'),(4973,'4316972','Santa Margarida do Sul','RS','2023-08-17 20:05:45','2023-08-17 20:05:45'),(4974,'4317004','Santana da Boa Vista','RS','2023-08-17 20:05:45','2023-08-17 20:05:45'),(4975,'4317103','Sant\'Ana do Livramento','RS','2023-08-17 20:05:45','2023-08-17 20:05:45'),(4976,'4317202','Santa Rosa','RS','2023-08-17 20:05:45','2023-08-17 20:05:45'),(4977,'4317251','Santa Tereza','RS','2023-08-17 20:05:45','2023-08-17 20:05:45'),(4978,'4317301','Santa Vitoria do Palmar','RS','2023-08-17 20:05:45','2023-08-17 20:05:45'),(4979,'4317400','Santiago','RS','2023-08-17 20:05:45','2023-08-17 20:05:45'),(4980,'4317509','Santo Ângelo','RS','2023-08-17 20:05:45','2023-08-17 20:05:45'),(4981,'4317558','Santo Antônio do Palma','RS','2023-08-17 20:05:45','2023-08-17 20:05:45'),(4982,'4317608','Santo Antônio da Patrulha','RS','2023-08-17 20:05:45','2023-08-17 20:05:45'),(4983,'4317707','Santo Antônio das Missoes','RS','2023-08-17 20:05:45','2023-08-17 20:05:45'),(4984,'4317756','Santo Antônio do Planalto','RS','2023-08-17 20:05:45','2023-08-17 20:05:45'),(4985,'4317806','Santo Augusto','RS','2023-08-17 20:05:45','2023-08-17 20:05:45'),(4986,'4317905','Santo Cristo','RS','2023-08-17 20:05:45','2023-08-17 20:05:45'),(4987,'4317954','Santo Expedito do Sul','RS','2023-08-17 20:05:45','2023-08-17 20:05:45'),(4988,'4318002','Sao Borja','RS','2023-08-17 20:05:45','2023-08-17 20:05:45'),(4989,'4318051','Sao Domingos do Sul','RS','2023-08-17 20:05:45','2023-08-17 20:05:45'),(4990,'4318101','Sao Francisco de Assis','RS','2023-08-17 20:05:45','2023-08-17 20:05:45'),(4991,'4318200','Sao Francisco de Paula','RS','2023-08-17 20:05:45','2023-08-17 20:05:45'),(4992,'4318309','Sao Gabriel','RS','2023-08-17 20:05:45','2023-08-17 20:05:45'),(4993,'4318408','Sao Jerônimo','RS','2023-08-17 20:05:45','2023-08-17 20:05:45'),(4994,'4318424','Sao Joao da Urtiga','RS','2023-08-17 20:05:45','2023-08-17 20:05:45'),(4995,'4318432','Sao Joao do Polêsine','RS','2023-08-17 20:05:45','2023-08-17 20:05:45'),(4996,'4318440','Sao Jorge','RS','2023-08-17 20:05:45','2023-08-17 20:05:45'),(4997,'4318457','Sao Jose das Missoes','RS','2023-08-17 20:05:45','2023-08-17 20:05:45'),(4998,'4318465','Sao Jose do Herval','RS','2023-08-17 20:05:45','2023-08-17 20:05:45'),(4999,'4318481','Sao Jose do Hortêncio','RS','2023-08-17 20:05:45','2023-08-17 20:05:45'),(5000,'4318499','Sao Jose do Inhacora','RS','2023-08-17 20:05:45','2023-08-17 20:05:45'),(5001,'4318507','Sao Jose do Norte','RS','2023-08-17 20:05:45','2023-08-17 20:05:45'),(5002,'4318606','Sao Jose do Ouro','RS','2023-08-17 20:05:45','2023-08-17 20:05:45'),(5003,'4318614','Sao Jose do Sul','RS','2023-08-17 20:05:45','2023-08-17 20:05:45'),(5004,'4318622','Sao Jose dos Ausentes','RS','2023-08-17 20:05:45','2023-08-17 20:05:45'),(5005,'4318705','Sao Leopoldo','RS','2023-08-17 20:05:45','2023-08-17 20:05:45'),(5006,'4318804','Sao Lourenço do Sul','RS','2023-08-17 20:05:45','2023-08-17 20:05:45'),(5007,'4318903','Sao Luiz Gonzaga','RS','2023-08-17 20:05:45','2023-08-17 20:05:45'),(5008,'4319000','Sao Marcos','RS','2023-08-17 20:05:45','2023-08-17 20:05:45'),(5009,'4319109','Sao Martinho','RS','2023-08-17 20:05:45','2023-08-17 20:05:45'),(5010,'4319125','Sao Martinho da Serra','RS','2023-08-17 20:05:45','2023-08-17 20:05:45'),(5011,'4319158','Sao Miguel das Missoes','RS','2023-08-17 20:05:45','2023-08-17 20:05:45'),(5012,'4319208','Sao Nicolau','RS','2023-08-17 20:05:45','2023-08-17 20:05:45'),(5013,'4319307','Sao Paulo das Missoes','RS','2023-08-17 20:05:45','2023-08-17 20:05:45'),(5014,'4319356','Sao Pedro da Serra','RS','2023-08-17 20:05:45','2023-08-17 20:05:45'),(5015,'4319364','Sao Pedro das Missoes','RS','2023-08-17 20:05:45','2023-08-17 20:05:45'),(5016,'4319372','Sao Pedro do Butia','RS','2023-08-17 20:05:45','2023-08-17 20:05:45'),(5017,'4319406','Sao Pedro do Sul','RS','2023-08-17 20:05:45','2023-08-17 20:05:45'),(5018,'4319505','Sao Sebastiao do Cai','RS','2023-08-17 20:05:45','2023-08-17 20:05:45'),(5019,'4319604','Sao Sepe','RS','2023-08-17 20:05:45','2023-08-17 20:05:45'),(5020,'4319703','Sao Valentim','RS','2023-08-17 20:05:45','2023-08-17 20:05:45'),(5021,'4319711','Sao Valentim do Sul','RS','2023-08-17 20:05:45','2023-08-17 20:05:45'),(5022,'4319737','Sao Valerio do Sul','RS','2023-08-17 20:05:45','2023-08-17 20:05:45'),(5023,'4319752','Sao Vendelino','RS','2023-08-17 20:05:45','2023-08-17 20:05:45'),(5024,'4319802','Sao Vicente do Sul','RS','2023-08-17 20:05:45','2023-08-17 20:05:45'),(5025,'4319901','Sapiranga','RS','2023-08-17 20:05:45','2023-08-17 20:05:45'),(5026,'4320008','Sapucaia do Sul','RS','2023-08-17 20:05:45','2023-08-17 20:05:45'),(5027,'4320107','Sarandi','RS','2023-08-17 20:05:45','2023-08-17 20:05:45'),(5028,'4320206','Seberi','RS','2023-08-17 20:05:45','2023-08-17 20:05:45'),(5029,'4320230','Sede Nova','RS','2023-08-17 20:05:45','2023-08-17 20:05:45'),(5030,'4320263','Segredo','RS','2023-08-17 20:05:45','2023-08-17 20:05:45'),(5031,'4320305','Selbach','RS','2023-08-17 20:05:45','2023-08-17 20:05:45'),(5032,'4320321','Senador Salgado Filho','RS','2023-08-17 20:05:45','2023-08-17 20:05:45'),(5033,'4320354','Sentinela do Sul','RS','2023-08-17 20:05:45','2023-08-17 20:05:45'),(5034,'4320404','Serafina Corrêa','RS','2023-08-17 20:05:45','2023-08-17 20:05:45'),(5035,'4320453','Serio','RS','2023-08-17 20:05:45','2023-08-17 20:05:45'),(5036,'4320503','Sertao','RS','2023-08-17 20:05:45','2023-08-17 20:05:45'),(5037,'4320552','Sertao Santana','RS','2023-08-17 20:05:45','2023-08-17 20:05:45'),(5038,'4320578','Sete de Setembro','RS','2023-08-17 20:05:45','2023-08-17 20:05:45'),(5039,'4320602','Severiano de Almeida','RS','2023-08-17 20:05:45','2023-08-17 20:05:45'),(5040,'4320651','Silveira Martins','RS','2023-08-17 20:05:46','2023-08-17 20:05:46'),(5041,'4320677','Sinimbu','RS','2023-08-17 20:05:46','2023-08-17 20:05:46'),(5042,'4320701','Sobradinho','RS','2023-08-17 20:05:46','2023-08-17 20:05:46'),(5043,'4320800','Soledade','RS','2023-08-17 20:05:46','2023-08-17 20:05:46'),(5044,'4320859','Tabai','RS','2023-08-17 20:05:46','2023-08-17 20:05:46'),(5045,'4320909','Tapejara','RS','2023-08-17 20:05:46','2023-08-17 20:05:46'),(5046,'4321006','Tapera','RS','2023-08-17 20:05:46','2023-08-17 20:05:46'),(5047,'4321105','Tapes','RS','2023-08-17 20:05:46','2023-08-17 20:05:46'),(5048,'4321204','Taquara','RS','2023-08-17 20:05:46','2023-08-17 20:05:46'),(5049,'4321303','Taquari','RS','2023-08-17 20:05:46','2023-08-17 20:05:46'),(5050,'4321329','Taquaruçu do Sul','RS','2023-08-17 20:05:46','2023-08-17 20:05:46'),(5051,'4321352','Tavares','RS','2023-08-17 20:05:46','2023-08-17 20:05:46'),(5052,'4321402','Tenente Portela','RS','2023-08-17 20:05:46','2023-08-17 20:05:46'),(5053,'4321436','Terra de Areia','RS','2023-08-17 20:05:46','2023-08-17 20:05:46'),(5054,'4321451','Teutônia','RS','2023-08-17 20:05:46','2023-08-17 20:05:46'),(5055,'4321469','Tio Hugo','RS','2023-08-17 20:05:46','2023-08-17 20:05:46'),(5056,'4321477','Tiradentes do Sul','RS','2023-08-17 20:05:46','2023-08-17 20:05:46'),(5057,'4321493','Toropi','RS','2023-08-17 20:05:46','2023-08-17 20:05:46'),(5058,'4321501','Torres','RS','2023-08-17 20:05:46','2023-08-17 20:05:46'),(5059,'4321600','Tramandai','RS','2023-08-17 20:05:46','2023-08-17 20:05:46'),(5060,'4321626','Travesseiro','RS','2023-08-17 20:05:46','2023-08-17 20:05:46'),(5061,'4321634','Três Arroios','RS','2023-08-17 20:05:46','2023-08-17 20:05:46'),(5062,'4321667','Três Cachoeiras','RS','2023-08-17 20:05:46','2023-08-17 20:05:46'),(5063,'4321709','Três Coroas','RS','2023-08-17 20:05:46','2023-08-17 20:05:46'),(5064,'4321808','Três de Maio','RS','2023-08-17 20:05:46','2023-08-17 20:05:46'),(5065,'4321832','Três Forquilhas','RS','2023-08-17 20:05:46','2023-08-17 20:05:46'),(5066,'4321857','Três Palmeiras','RS','2023-08-17 20:05:46','2023-08-17 20:05:46'),(5067,'4321907','Três Passos','RS','2023-08-17 20:05:46','2023-08-17 20:05:46'),(5068,'4321956','Trindade do Sul','RS','2023-08-17 20:05:46','2023-08-17 20:05:46'),(5069,'4322004','Triunfo','RS','2023-08-17 20:05:46','2023-08-17 20:05:46'),(5070,'4322103','Tucunduva','RS','2023-08-17 20:05:46','2023-08-17 20:05:46'),(5071,'4322152','Tunas','RS','2023-08-17 20:05:46','2023-08-17 20:05:46'),(5072,'4322186','Tupanci do Sul','RS','2023-08-17 20:05:46','2023-08-17 20:05:46'),(5073,'4322202','Tupancireta','RS','2023-08-17 20:05:46','2023-08-17 20:05:46'),(5074,'4322251','Tupandi','RS','2023-08-17 20:05:46','2023-08-17 20:05:46'),(5075,'4322301','Tuparendi','RS','2023-08-17 20:05:46','2023-08-17 20:05:46'),(5076,'4322327','Turuçu','RS','2023-08-17 20:05:46','2023-08-17 20:05:46'),(5077,'4322343','Ubiretama','RS','2023-08-17 20:05:46','2023-08-17 20:05:46'),(5078,'4322350','Uniao da Serra','RS','2023-08-17 20:05:46','2023-08-17 20:05:46'),(5079,'4322376','Unistalda','RS','2023-08-17 20:05:46','2023-08-17 20:05:46'),(5080,'4322400','Uruguaiana','RS','2023-08-17 20:05:46','2023-08-17 20:05:46'),(5081,'4322509','Vacaria','RS','2023-08-17 20:05:46','2023-08-17 20:05:46'),(5082,'4322525','Vale Verde','RS','2023-08-17 20:05:46','2023-08-17 20:05:46'),(5083,'4322533','Vale do Sol','RS','2023-08-17 20:05:46','2023-08-17 20:05:46'),(5084,'4322541','Vale Real','RS','2023-08-17 20:05:46','2023-08-17 20:05:46'),(5085,'4322558','Vanini','RS','2023-08-17 20:05:46','2023-08-17 20:05:46'),(5086,'4322608','Venâncio Aires','RS','2023-08-17 20:05:46','2023-08-17 20:05:46'),(5087,'4322707','Vera Cruz','RS','2023-08-17 20:05:46','2023-08-17 20:05:46'),(5088,'4322806','Veranopolis','RS','2023-08-17 20:05:46','2023-08-17 20:05:46'),(5089,'4322855','Vespasiano Correa','RS','2023-08-17 20:05:46','2023-08-17 20:05:46'),(5090,'4322905','Viadutos','RS','2023-08-17 20:05:46','2023-08-17 20:05:46'),(5091,'4323002','Viamao','RS','2023-08-17 20:05:46','2023-08-17 20:05:46'),(5092,'4323101','Vicente Dutra','RS','2023-08-17 20:05:46','2023-08-17 20:05:46'),(5093,'4323200','Victor Graeff','RS','2023-08-17 20:05:46','2023-08-17 20:05:46'),(5094,'4323309','Vila Flores','RS','2023-08-17 20:05:46','2023-08-17 20:05:46'),(5095,'4323358','Vila Lângaro','RS','2023-08-17 20:05:46','2023-08-17 20:05:46'),(5096,'4323408','Vila Maria','RS','2023-08-17 20:05:46','2023-08-17 20:05:46'),(5097,'4323457','Vila Nova do Sul','RS','2023-08-17 20:05:46','2023-08-17 20:05:46'),(5098,'4323507','Vista Alegre','RS','2023-08-17 20:05:46','2023-08-17 20:05:46'),(5099,'4323606','Vista Alegre do Prata','RS','2023-08-17 20:05:46','2023-08-17 20:05:46'),(5100,'4323705','Vista Gaucha','RS','2023-08-17 20:05:46','2023-08-17 20:05:46'),(5101,'4323754','Vitoria das Missoes','RS','2023-08-17 20:05:46','2023-08-17 20:05:46'),(5102,'4323770','Westfalia','RS','2023-08-17 20:05:46','2023-08-17 20:05:46'),(5103,'4323804','Xangri-la','RS','2023-08-17 20:05:46','2023-08-17 20:05:46'),(5104,'5000203','agua Clara','MS','2023-08-17 20:05:46','2023-08-17 20:05:46'),(5105,'5000252','Alcinopolis','MS','2023-08-17 20:05:46','2023-08-17 20:05:46'),(5106,'5000609','Amambai','MS','2023-08-17 20:05:46','2023-08-17 20:05:46'),(5107,'5000708','Anastacio','MS','2023-08-17 20:05:46','2023-08-17 20:05:46'),(5108,'5000807','Anaurilândia','MS','2023-08-17 20:05:46','2023-08-17 20:05:46'),(5109,'5000856','Angelica','MS','2023-08-17 20:05:46','2023-08-17 20:05:46'),(5110,'5000906','Antônio Joao','MS','2023-08-17 20:05:46','2023-08-17 20:05:46'),(5111,'5001003','Aparecida do Taboado','MS','2023-08-17 20:05:46','2023-08-17 20:05:46'),(5112,'5001102','Aquidauana','MS','2023-08-17 20:05:46','2023-08-17 20:05:46'),(5113,'5001243','Aral Moreira','MS','2023-08-17 20:05:46','2023-08-17 20:05:46'),(5114,'5001508','Bandeirantes','MS','2023-08-17 20:05:46','2023-08-17 20:05:46'),(5115,'5001904','Bataguassu','MS','2023-08-17 20:05:46','2023-08-17 20:05:46'),(5116,'5002001','Bataypora','MS','2023-08-17 20:05:46','2023-08-17 20:05:46'),(5117,'5002100','Bela Vista','MS','2023-08-17 20:05:46','2023-08-17 20:05:46'),(5118,'5002159','Bodoquena','MS','2023-08-17 20:05:46','2023-08-17 20:05:46'),(5119,'5002209','Bonito','MS','2023-08-17 20:05:46','2023-08-17 20:05:46'),(5120,'5002308','Brasilândia','MS','2023-08-17 20:05:46','2023-08-17 20:05:46'),(5121,'5002407','Caarapo','MS','2023-08-17 20:05:46','2023-08-17 20:05:46'),(5122,'5002605','Camapua','MS','2023-08-17 20:05:46','2023-08-17 20:05:46'),(5123,'5002704','Campo Grande','MS','2023-08-17 20:05:46','2023-08-17 20:05:46'),(5124,'5002803','Caracol','MS','2023-08-17 20:05:46','2023-08-17 20:05:46'),(5125,'5002902','Cassilândia','MS','2023-08-17 20:05:46','2023-08-17 20:05:46'),(5126,'5002951','Chapadao do Sul','MS','2023-08-17 20:05:46','2023-08-17 20:05:46'),(5127,'5003108','Corguinho','MS','2023-08-17 20:05:46','2023-08-17 20:05:46'),(5128,'5003157','Coronel Sapucaia','MS','2023-08-17 20:05:46','2023-08-17 20:05:46'),(5129,'5003207','Corumba','MS','2023-08-17 20:05:46','2023-08-17 20:05:46'),(5130,'5003256','Costa Rica','MS','2023-08-17 20:05:46','2023-08-17 20:05:46'),(5131,'5003306','Coxim','MS','2023-08-17 20:05:46','2023-08-17 20:05:46'),(5132,'5003454','Deodapolis','MS','2023-08-17 20:05:46','2023-08-17 20:05:46'),(5133,'5003488','Dois Irmaos do Buriti','MS','2023-08-17 20:05:46','2023-08-17 20:05:46'),(5134,'5003504','Douradina','MS','2023-08-17 20:05:46','2023-08-17 20:05:46'),(5135,'5003702','Dourados','MS','2023-08-17 20:05:46','2023-08-17 20:05:46'),(5136,'5003751','Eldorado','MS','2023-08-17 20:05:46','2023-08-17 20:05:46'),(5137,'5003801','Fatima do Sul','MS','2023-08-17 20:05:46','2023-08-17 20:05:46'),(5138,'5003900','Figueirao','MS','2023-08-17 20:05:46','2023-08-17 20:05:46'),(5139,'5004007','Gloria de Dourados','MS','2023-08-17 20:05:46','2023-08-17 20:05:46'),(5140,'5004106','Guia Lopes da Laguna','MS','2023-08-17 20:05:46','2023-08-17 20:05:46'),(5141,'5004304','Iguatemi','MS','2023-08-17 20:05:46','2023-08-17 20:05:46'),(5142,'5004403','Inocência','MS','2023-08-17 20:05:46','2023-08-17 20:05:46'),(5143,'5004502','Itapora','MS','2023-08-17 20:05:46','2023-08-17 20:05:46'),(5144,'5004601','Itaquirai','MS','2023-08-17 20:05:46','2023-08-17 20:05:46'),(5145,'5004700','Ivinhema','MS','2023-08-17 20:05:46','2023-08-17 20:05:46'),(5146,'5004809','Japora','MS','2023-08-17 20:05:46','2023-08-17 20:05:46'),(5147,'5004908','Jaraguari','MS','2023-08-17 20:05:46','2023-08-17 20:05:46'),(5148,'5005004','Jardim','MS','2023-08-17 20:05:46','2023-08-17 20:05:46'),(5149,'5005103','Jatei','MS','2023-08-17 20:05:46','2023-08-17 20:05:46'),(5150,'5005152','Juti','MS','2023-08-17 20:05:46','2023-08-17 20:05:46'),(5151,'5005202','Ladario','MS','2023-08-17 20:05:46','2023-08-17 20:05:46'),(5152,'5005251','Laguna Carapa','MS','2023-08-17 20:05:46','2023-08-17 20:05:46'),(5153,'5005400','Maracaju','MS','2023-08-17 20:05:46','2023-08-17 20:05:46'),(5154,'5005608','Miranda','MS','2023-08-17 20:05:46','2023-08-17 20:05:46'),(5155,'5005681','Mundo Novo','MS','2023-08-17 20:05:46','2023-08-17 20:05:46'),(5156,'5005707','Navirai','MS','2023-08-17 20:05:46','2023-08-17 20:05:46'),(5157,'5005806','Nioaque','MS','2023-08-17 20:05:46','2023-08-17 20:05:46'),(5158,'5006002','Nova Alvorada do Sul','MS','2023-08-17 20:05:46','2023-08-17 20:05:46'),(5159,'5006200','Nova Andradina','MS','2023-08-17 20:05:46','2023-08-17 20:05:46'),(5160,'5006259','Novo Horizonte do Sul','MS','2023-08-17 20:05:46','2023-08-17 20:05:46'),(5161,'5006275','Paraiso das aguas','MS','2023-08-17 20:05:46','2023-08-17 20:05:46'),(5162,'5006309','Paranaiba','MS','2023-08-17 20:05:46','2023-08-17 20:05:46'),(5163,'5006358','Paranhos','MS','2023-08-17 20:05:46','2023-08-17 20:05:46'),(5164,'5006408','Pedro Gomes','MS','2023-08-17 20:05:46','2023-08-17 20:05:46'),(5165,'5006606','Ponta Pora','MS','2023-08-17 20:05:46','2023-08-17 20:05:46'),(5166,'5006903','Porto Murtinho','MS','2023-08-17 20:05:46','2023-08-17 20:05:46'),(5167,'5007109','Ribas do Rio Pardo','MS','2023-08-17 20:05:46','2023-08-17 20:05:46'),(5168,'5007208','Rio Brilhante','MS','2023-08-17 20:05:46','2023-08-17 20:05:46'),(5169,'5007307','Rio Negro','MS','2023-08-17 20:05:46','2023-08-17 20:05:46'),(5170,'5007406','Rio Verde de Mato Grosso','MS','2023-08-17 20:05:46','2023-08-17 20:05:46'),(5171,'5007505','Rochedo','MS','2023-08-17 20:05:46','2023-08-17 20:05:46'),(5172,'5007554','Santa Rita do Pardo','MS','2023-08-17 20:05:46','2023-08-17 20:05:46'),(5173,'5007695','Sao Gabriel do Oeste','MS','2023-08-17 20:05:46','2023-08-17 20:05:46'),(5174,'5007703','Sete Quedas','MS','2023-08-17 20:05:46','2023-08-17 20:05:46'),(5175,'5007802','Selviria','MS','2023-08-17 20:05:46','2023-08-17 20:05:46'),(5176,'5007901','Sidrolândia','MS','2023-08-17 20:05:46','2023-08-17 20:05:46'),(5177,'5007935','Sonora','MS','2023-08-17 20:05:46','2023-08-17 20:05:46'),(5178,'5007950','Tacuru','MS','2023-08-17 20:05:46','2023-08-17 20:05:46'),(5179,'5007976','Taquarussu','MS','2023-08-17 20:05:46','2023-08-17 20:05:46'),(5180,'5008008','Terenos','MS','2023-08-17 20:05:46','2023-08-17 20:05:46'),(5181,'5008305','Três Lagoas','MS','2023-08-17 20:05:46','2023-08-17 20:05:46'),(5182,'5008404','Vicentina','MS','2023-08-17 20:05:46','2023-08-17 20:05:46'),(5183,'5100102','Acorizal','MT','2023-08-17 20:05:46','2023-08-17 20:05:46'),(5184,'5100201','agua Boa','MT','2023-08-17 20:05:46','2023-08-17 20:05:46'),(5185,'5100250','Alta Floresta','MT','2023-08-17 20:05:46','2023-08-17 20:05:46'),(5186,'5100300','Alto Araguaia','MT','2023-08-17 20:05:46','2023-08-17 20:05:46'),(5187,'5100359','Alto Boa Vista','MT','2023-08-17 20:05:46','2023-08-17 20:05:46'),(5188,'5100409','Alto Garças','MT','2023-08-17 20:05:46','2023-08-17 20:05:46'),(5189,'5100508','Alto Paraguai','MT','2023-08-17 20:05:46','2023-08-17 20:05:46'),(5190,'5100607','Alto Taquari','MT','2023-08-17 20:05:46','2023-08-17 20:05:46'),(5191,'5100805','Apiacas','MT','2023-08-17 20:05:46','2023-08-17 20:05:46'),(5192,'5101001','Araguaiana','MT','2023-08-17 20:05:46','2023-08-17 20:05:46'),(5193,'5101209','Araguainha','MT','2023-08-17 20:05:46','2023-08-17 20:05:46'),(5194,'5101258','Araputanga','MT','2023-08-17 20:05:46','2023-08-17 20:05:46'),(5195,'5101308','Arenapolis','MT','2023-08-17 20:05:46','2023-08-17 20:05:46'),(5196,'5101407','Aripuana','MT','2023-08-17 20:05:46','2023-08-17 20:05:46'),(5197,'5101605','Barao de Melgaço','MT','2023-08-17 20:05:46','2023-08-17 20:05:46'),(5198,'5101704','Barra do Bugres','MT','2023-08-17 20:05:46','2023-08-17 20:05:46'),(5199,'5101803','Barra do Garças','MT','2023-08-17 20:05:46','2023-08-17 20:05:46'),(5200,'5101852','Bom Jesus do Araguaia','MT','2023-08-17 20:05:46','2023-08-17 20:05:46'),(5201,'5101902','Brasnorte','MT','2023-08-17 20:05:46','2023-08-17 20:05:46'),(5202,'5102504','Caceres','MT','2023-08-17 20:05:46','2023-08-17 20:05:46'),(5203,'5102603','Campinapolis','MT','2023-08-17 20:05:46','2023-08-17 20:05:46'),(5204,'5102637','Campo Novo do Parecis','MT','2023-08-17 20:05:46','2023-08-17 20:05:46'),(5205,'5102678','Campo Verde','MT','2023-08-17 20:05:46','2023-08-17 20:05:46'),(5206,'5102686','Campos de Julio','MT','2023-08-17 20:05:46','2023-08-17 20:05:46'),(5207,'5102694','Canabrava do Norte','MT','2023-08-17 20:05:46','2023-08-17 20:05:46'),(5208,'5102702','Canarana','MT','2023-08-17 20:05:46','2023-08-17 20:05:46'),(5209,'5102793','Carlinda','MT','2023-08-17 20:05:46','2023-08-17 20:05:46'),(5210,'5102850','Castanheira','MT','2023-08-17 20:05:46','2023-08-17 20:05:46'),(5211,'5103007','Chapada dos Guimaraes','MT','2023-08-17 20:05:46','2023-08-17 20:05:46'),(5212,'5103056','Claudia','MT','2023-08-17 20:05:46','2023-08-17 20:05:46'),(5213,'5103106','Cocalinho','MT','2023-08-17 20:05:46','2023-08-17 20:05:46'),(5214,'5103205','Colider','MT','2023-08-17 20:05:46','2023-08-17 20:05:46'),(5215,'5103254','Colniza','MT','2023-08-17 20:05:46','2023-08-17 20:05:46'),(5216,'5103304','Comodoro','MT','2023-08-17 20:05:46','2023-08-17 20:05:46'),(5217,'5103353','Confresa','MT','2023-08-17 20:05:46','2023-08-17 20:05:46'),(5218,'5103361','Conquista D\'Oeste','MT','2023-08-17 20:05:46','2023-08-17 20:05:46'),(5219,'5103379','Cotriguaçu','MT','2023-08-17 20:05:46','2023-08-17 20:05:46'),(5220,'5103403','Cuiaba','MT','2023-08-17 20:05:46','2023-08-17 20:05:46'),(5221,'5103437','Curvelândia','MT','2023-08-17 20:05:46','2023-08-17 20:05:46'),(5222,'5103452','Denise','MT','2023-08-17 20:05:46','2023-08-17 20:05:46'),(5223,'5103502','Diamantino','MT','2023-08-17 20:05:46','2023-08-17 20:05:46'),(5224,'5103601','Dom Aquino','MT','2023-08-17 20:05:46','2023-08-17 20:05:46'),(5225,'5103700','Feliz Natal','MT','2023-08-17 20:05:46','2023-08-17 20:05:46'),(5226,'5103809','Figueiropolis D\'Oeste','MT','2023-08-17 20:05:46','2023-08-17 20:05:46'),(5227,'5103858','Gaucha do Norte','MT','2023-08-17 20:05:46','2023-08-17 20:05:46'),(5228,'5103908','General Carneiro','MT','2023-08-17 20:05:46','2023-08-17 20:05:46'),(5229,'5103957','Gloria D\'Oeste','MT','2023-08-17 20:05:46','2023-08-17 20:05:46'),(5230,'5104104','Guaranta do Norte','MT','2023-08-17 20:05:46','2023-08-17 20:05:46'),(5231,'5104203','Guiratinga','MT','2023-08-17 20:05:46','2023-08-17 20:05:46'),(5232,'5104500','Indiavai','MT','2023-08-17 20:05:46','2023-08-17 20:05:46'),(5233,'5104526','Ipiranga do Norte','MT','2023-08-17 20:05:46','2023-08-17 20:05:46'),(5234,'5104542','Itanhanga','MT','2023-08-17 20:05:46','2023-08-17 20:05:46'),(5235,'5104559','Itauba','MT','2023-08-17 20:05:46','2023-08-17 20:05:46'),(5236,'5104609','Itiquira','MT','2023-08-17 20:05:46','2023-08-17 20:05:46'),(5237,'5104807','Jaciara','MT','2023-08-17 20:05:46','2023-08-17 20:05:46'),(5238,'5104906','Jangada','MT','2023-08-17 20:05:46','2023-08-17 20:05:46'),(5239,'5105002','Jauru','MT','2023-08-17 20:05:46','2023-08-17 20:05:46'),(5240,'5105101','Juara','MT','2023-08-17 20:05:46','2023-08-17 20:05:46'),(5241,'5105150','Juina','MT','2023-08-17 20:05:46','2023-08-17 20:05:46'),(5242,'5105176','Juruena','MT','2023-08-17 20:05:46','2023-08-17 20:05:46'),(5243,'5105200','Juscimeira','MT','2023-08-17 20:05:46','2023-08-17 20:05:46'),(5244,'5105234','Lambari D\'Oeste','MT','2023-08-17 20:05:46','2023-08-17 20:05:46'),(5245,'5105259','Lucas do Rio Verde','MT','2023-08-17 20:05:46','2023-08-17 20:05:46'),(5246,'5105309','Luciara','MT','2023-08-17 20:05:46','2023-08-17 20:05:46'),(5247,'5105507','Vila Bela da Santissima Trindade','MT','2023-08-17 20:05:46','2023-08-17 20:05:46'),(5248,'5105580','Marcelândia','MT','2023-08-17 20:05:46','2023-08-17 20:05:46'),(5249,'5105606','Matupa','MT','2023-08-17 20:05:46','2023-08-17 20:05:46'),(5250,'5105622','Mirassol D\'Oeste','MT','2023-08-17 20:05:46','2023-08-17 20:05:46'),(5251,'5105903','Nobres','MT','2023-08-17 20:05:46','2023-08-17 20:05:46'),(5252,'5106000','Nortelândia','MT','2023-08-17 20:05:46','2023-08-17 20:05:46'),(5253,'5106109','Nossa Senhora do Livramento','MT','2023-08-17 20:05:46','2023-08-17 20:05:46'),(5254,'5106158','Nova Bandeirantes','MT','2023-08-17 20:05:46','2023-08-17 20:05:46'),(5255,'5106174','Nova Nazare','MT','2023-08-17 20:05:46','2023-08-17 20:05:46'),(5256,'5106182','Nova Lacerda','MT','2023-08-17 20:05:46','2023-08-17 20:05:46'),(5257,'5106190','Nova Santa Helena','MT','2023-08-17 20:05:46','2023-08-17 20:05:46'),(5258,'5106208','Nova Brasilândia','MT','2023-08-17 20:05:46','2023-08-17 20:05:46'),(5259,'5106216','Nova Canaa do Norte','MT','2023-08-17 20:05:46','2023-08-17 20:05:46'),(5260,'5106224','Nova Mutum','MT','2023-08-17 20:05:46','2023-08-17 20:05:46'),(5261,'5106232','Nova Olimpia','MT','2023-08-17 20:05:46','2023-08-17 20:05:46'),(5262,'5106240','Nova Ubirata','MT','2023-08-17 20:05:46','2023-08-17 20:05:46'),(5263,'5106257','Nova Xavantina','MT','2023-08-17 20:05:46','2023-08-17 20:05:46'),(5264,'5106265','Novo Mundo','MT','2023-08-17 20:05:46','2023-08-17 20:05:46'),(5265,'5106273','Novo Horizonte do Norte','MT','2023-08-17 20:05:46','2023-08-17 20:05:46'),(5266,'5106281','Novo Sao Joaquim','MT','2023-08-17 20:05:46','2023-08-17 20:05:46'),(5267,'5106299','Paranaita','MT','2023-08-17 20:05:46','2023-08-17 20:05:46'),(5268,'5106307','Paranatinga','MT','2023-08-17 20:05:46','2023-08-17 20:05:46'),(5269,'5106315','Novo Santo Antônio','MT','2023-08-17 20:05:46','2023-08-17 20:05:46'),(5270,'5106372','Pedra Preta','MT','2023-08-17 20:05:46','2023-08-17 20:05:46'),(5271,'5106422','Peixoto de Azevedo','MT','2023-08-17 20:05:46','2023-08-17 20:05:46'),(5272,'5106455','Planalto da Serra','MT','2023-08-17 20:05:46','2023-08-17 20:05:46'),(5273,'5106505','Pocone','MT','2023-08-17 20:05:46','2023-08-17 20:05:46'),(5274,'5106653','Pontal do Araguaia','MT','2023-08-17 20:05:46','2023-08-17 20:05:46'),(5275,'5106703','Ponte Branca','MT','2023-08-17 20:05:46','2023-08-17 20:05:46'),(5276,'5106752','Pontes e Lacerda','MT','2023-08-17 20:05:46','2023-08-17 20:05:46'),(5277,'5106778','Porto Alegre do Norte','MT','2023-08-17 20:05:46','2023-08-17 20:05:46'),(5278,'5106802','Porto dos Gauchos','MT','2023-08-17 20:05:46','2023-08-17 20:05:46'),(5279,'5106828','Porto Esperidiao','MT','2023-08-17 20:05:46','2023-08-17 20:05:46'),(5280,'5106851','Porto Estrela','MT','2023-08-17 20:05:46','2023-08-17 20:05:46'),(5281,'5107008','Poxoreo','MT','2023-08-17 20:05:46','2023-08-17 20:05:46'),(5282,'5107040','Primavera do Leste','MT','2023-08-17 20:05:46','2023-08-17 20:05:46'),(5283,'5107065','Querência','MT','2023-08-17 20:05:46','2023-08-17 20:05:46'),(5284,'5107107','Sao Jose dos Quatro Marcos','MT','2023-08-17 20:05:46','2023-08-17 20:05:46'),(5285,'5107156','Reserva do Cabaçal','MT','2023-08-17 20:05:46','2023-08-17 20:05:46'),(5286,'5107180','Ribeirao Cascalheira','MT','2023-08-17 20:05:46','2023-08-17 20:05:46'),(5287,'5107198','Ribeiraozinho','MT','2023-08-17 20:05:46','2023-08-17 20:05:46'),(5288,'5107206','Rio Branco','MT','2023-08-17 20:05:46','2023-08-17 20:05:46'),(5289,'5107248','Santa Carmem','MT','2023-08-17 20:05:46','2023-08-17 20:05:46'),(5290,'5107263','Santo Afonso','MT','2023-08-17 20:05:46','2023-08-17 20:05:46'),(5291,'5107297','Sao Jose do Povo','MT','2023-08-17 20:05:46','2023-08-17 20:05:46'),(5292,'5107305','Sao Jose do Rio Claro','MT','2023-08-17 20:05:46','2023-08-17 20:05:46'),(5293,'5107354','Sao Jose do Xingu','MT','2023-08-17 20:05:46','2023-08-17 20:05:46'),(5294,'5107404','Sao Pedro da Cipa','MT','2023-08-17 20:05:46','2023-08-17 20:05:46'),(5295,'5107578','Rondolândia','MT','2023-08-17 20:05:46','2023-08-17 20:05:46'),(5296,'5107602','Rondonopolis','MT','2023-08-17 20:05:46','2023-08-17 20:05:46'),(5297,'5107701','Rosario Oeste','MT','2023-08-17 20:05:46','2023-08-17 20:05:46'),(5298,'5107743','Santa Cruz do Xingu','MT','2023-08-17 20:05:46','2023-08-17 20:05:46'),(5299,'5107750','Salto do Ceu','MT','2023-08-17 20:05:46','2023-08-17 20:05:46'),(5300,'5107768','Santa Rita do Trivelato','MT','2023-08-17 20:05:46','2023-08-17 20:05:46'),(5301,'5107776','Santa Terezinha','MT','2023-08-17 20:05:46','2023-08-17 20:05:46'),(5302,'5107792','Santo Antônio do Leste','MT','2023-08-17 20:05:46','2023-08-17 20:05:46'),(5303,'5107800','Santo Antônio do Leverger','MT','2023-08-17 20:05:46','2023-08-17 20:05:46'),(5304,'5107859','Sao Felix do Araguaia','MT','2023-08-17 20:05:46','2023-08-17 20:05:46'),(5305,'5107875','Sapezal','MT','2023-08-17 20:05:46','2023-08-17 20:05:46'),(5306,'5107883','Serra Nova Dourada','MT','2023-08-17 20:05:46','2023-08-17 20:05:46'),(5307,'5107909','Sinop','MT','2023-08-17 20:05:46','2023-08-17 20:05:46'),(5308,'5107925','Sorriso','MT','2023-08-17 20:05:46','2023-08-17 20:05:46'),(5309,'5107941','Tabapora','MT','2023-08-17 20:05:46','2023-08-17 20:05:46'),(5310,'5107958','Tangara da Serra','MT','2023-08-17 20:05:46','2023-08-17 20:05:46'),(5311,'5108006','Tapurah','MT','2023-08-17 20:05:46','2023-08-17 20:05:46'),(5312,'5108055','Terra Nova do Norte','MT','2023-08-17 20:05:46','2023-08-17 20:05:46'),(5313,'5108105','Tesouro','MT','2023-08-17 20:05:46','2023-08-17 20:05:46'),(5314,'5108204','Torixoreu','MT','2023-08-17 20:05:46','2023-08-17 20:05:46'),(5315,'5108303','Uniao do Sul','MT','2023-08-17 20:05:46','2023-08-17 20:05:46'),(5316,'5108352','Vale de Sao Domingos','MT','2023-08-17 20:05:46','2023-08-17 20:05:46'),(5317,'5108402','Varzea Grande','MT','2023-08-17 20:05:46','2023-08-17 20:05:46'),(5318,'5108501','Vera','MT','2023-08-17 20:05:46','2023-08-17 20:05:46'),(5319,'5108600','Vila Rica','MT','2023-08-17 20:05:46','2023-08-17 20:05:46'),(5320,'5108808','Nova Guarita','MT','2023-08-17 20:05:46','2023-08-17 20:05:46'),(5321,'5108857','Nova Marilândia','MT','2023-08-17 20:05:46','2023-08-17 20:05:46'),(5322,'5108907','Nova Maringa','MT','2023-08-17 20:05:46','2023-08-17 20:05:46'),(5323,'5108956','Nova Monte Verde','MT','2023-08-17 20:05:46','2023-08-17 20:05:46'),(5324,'5200050','Abadia de Goias','GO','2023-08-17 20:05:46','2023-08-17 20:05:46'),(5325,'5200100','Abadiânia','GO','2023-08-17 20:05:46','2023-08-17 20:05:46'),(5326,'5200134','Acreuna','GO','2023-08-17 20:05:46','2023-08-17 20:05:46'),(5327,'5200159','Adelândia','GO','2023-08-17 20:05:46','2023-08-17 20:05:46'),(5328,'5200175','agua Fria de Goias','GO','2023-08-17 20:05:46','2023-08-17 20:05:46'),(5329,'5200209','agua Limpa','GO','2023-08-17 20:05:46','2023-08-17 20:05:46'),(5330,'5200258','aguas Lindas de Goias','GO','2023-08-17 20:05:46','2023-08-17 20:05:46'),(5331,'5200308','Alexânia','GO','2023-08-17 20:05:46','2023-08-17 20:05:46'),(5332,'5200506','Aloândia','GO','2023-08-17 20:05:46','2023-08-17 20:05:46'),(5333,'5200555','Alto Horizonte','GO','2023-08-17 20:05:46','2023-08-17 20:05:46'),(5334,'5200605','Alto Paraiso de Goias','GO','2023-08-17 20:05:46','2023-08-17 20:05:46'),(5335,'5200803','Alvorada do Norte','GO','2023-08-17 20:05:46','2023-08-17 20:05:46'),(5336,'5200829','Amaralina','GO','2023-08-17 20:05:46','2023-08-17 20:05:46'),(5337,'5200852','Americano do Brasil','GO','2023-08-17 20:05:46','2023-08-17 20:05:46'),(5338,'5200902','Amorinopolis','GO','2023-08-17 20:05:46','2023-08-17 20:05:46'),(5339,'5201108','Anapolis','GO','2023-08-17 20:05:46','2023-08-17 20:05:46'),(5340,'5201207','Anhanguera','GO','2023-08-17 20:05:46','2023-08-17 20:05:46'),(5341,'5201306','Anicuns','GO','2023-08-17 20:05:46','2023-08-17 20:05:46'),(5342,'5201405','Aparecida de Goiânia','GO','2023-08-17 20:05:46','2023-08-17 20:05:46'),(5343,'5201454','Aparecida do Rio Doce','GO','2023-08-17 20:05:46','2023-08-17 20:05:46'),(5344,'5201504','Apore','GO','2023-08-17 20:05:46','2023-08-17 20:05:46'),(5345,'5201603','Araçu','GO','2023-08-17 20:05:46','2023-08-17 20:05:46'),(5346,'5201702','Aragarças','GO','2023-08-17 20:05:46','2023-08-17 20:05:46'),(5347,'5201801','Aragoiânia','GO','2023-08-17 20:05:46','2023-08-17 20:05:46'),(5348,'5202155','Araguapaz','GO','2023-08-17 20:05:46','2023-08-17 20:05:46'),(5349,'5202353','Arenopolis','GO','2023-08-17 20:05:46','2023-08-17 20:05:46'),(5350,'5202502','Aruana','GO','2023-08-17 20:05:46','2023-08-17 20:05:46'),(5351,'5202601','Aurilândia','GO','2023-08-17 20:05:46','2023-08-17 20:05:46'),(5352,'5202809','Avelinopolis','GO','2023-08-17 20:05:46','2023-08-17 20:05:46'),(5353,'5203104','Baliza','GO','2023-08-17 20:05:46','2023-08-17 20:05:46'),(5354,'5203203','Barro Alto','GO','2023-08-17 20:05:46','2023-08-17 20:05:46'),(5355,'5203302','Bela Vista de Goias','GO','2023-08-17 20:05:46','2023-08-17 20:05:46'),(5356,'5203401','Bom Jardim de Goias','GO','2023-08-17 20:05:46','2023-08-17 20:05:46'),(5357,'5203500','Bom Jesus de Goias','GO','2023-08-17 20:05:46','2023-08-17 20:05:46'),(5358,'5203559','Bonfinopolis','GO','2023-08-17 20:05:46','2023-08-17 20:05:46'),(5359,'5203575','Bonopolis','GO','2023-08-17 20:05:46','2023-08-17 20:05:46'),(5360,'5203609','Brazabrantes','GO','2023-08-17 20:05:46','2023-08-17 20:05:46'),(5361,'5203807','Britânia','GO','2023-08-17 20:05:46','2023-08-17 20:05:46'),(5362,'5203906','Buriti Alegre','GO','2023-08-17 20:05:46','2023-08-17 20:05:46'),(5363,'5203939','Buriti de Goias','GO','2023-08-17 20:05:46','2023-08-17 20:05:46'),(5364,'5203962','Buritinopolis','GO','2023-08-17 20:05:47','2023-08-17 20:05:47'),(5365,'5204003','Cabeceiras','GO','2023-08-17 20:05:47','2023-08-17 20:05:47'),(5366,'5204102','Cachoeira Alta','GO','2023-08-17 20:05:47','2023-08-17 20:05:47'),(5367,'5204201','Cachoeira de Goias','GO','2023-08-17 20:05:47','2023-08-17 20:05:47'),(5368,'5204250','Cachoeira Dourada','GO','2023-08-17 20:05:47','2023-08-17 20:05:47'),(5369,'5204300','Caçu','GO','2023-08-17 20:05:47','2023-08-17 20:05:47'),(5370,'5204409','Caiapônia','GO','2023-08-17 20:05:47','2023-08-17 20:05:47'),(5371,'5204508','Caldas Novas','GO','2023-08-17 20:05:47','2023-08-17 20:05:47'),(5372,'5204557','Caldazinha','GO','2023-08-17 20:05:47','2023-08-17 20:05:47'),(5373,'5204607','Campestre de Goias','GO','2023-08-17 20:05:47','2023-08-17 20:05:47'),(5374,'5204656','Campinaçu','GO','2023-08-17 20:05:47','2023-08-17 20:05:47'),(5375,'5204706','Campinorte','GO','2023-08-17 20:05:47','2023-08-17 20:05:47'),(5376,'5204805','Campo Alegre de Goias','GO','2023-08-17 20:05:47','2023-08-17 20:05:47'),(5377,'5204854','Campo Limpo de Goias','GO','2023-08-17 20:05:47','2023-08-17 20:05:47'),(5378,'5204904','Campos Belos','GO','2023-08-17 20:05:47','2023-08-17 20:05:47'),(5379,'5204953','Campos Verdes','GO','2023-08-17 20:05:47','2023-08-17 20:05:47'),(5380,'5205000','Carmo do Rio Verde','GO','2023-08-17 20:05:47','2023-08-17 20:05:47'),(5381,'5205059','Castelândia','GO','2023-08-17 20:05:47','2023-08-17 20:05:47'),(5382,'5205109','Catalao','GO','2023-08-17 20:05:47','2023-08-17 20:05:47'),(5383,'5205208','Caturai','GO','2023-08-17 20:05:47','2023-08-17 20:05:47'),(5384,'5205307','Cavalcante','GO','2023-08-17 20:05:47','2023-08-17 20:05:47'),(5385,'5205406','Ceres','GO','2023-08-17 20:05:47','2023-08-17 20:05:47'),(5386,'5205455','Cezarina','GO','2023-08-17 20:05:47','2023-08-17 20:05:47'),(5387,'5205471','Chapadao do Ceu','GO','2023-08-17 20:05:47','2023-08-17 20:05:47'),(5388,'5205497','cidades Ocidental','GO','2023-08-17 20:05:47','2023-08-17 20:05:47'),(5389,'5205513','Cocalzinho de Goias','GO','2023-08-17 20:05:47','2023-08-17 20:05:47'),(5390,'5205521','Colinas do Sul','GO','2023-08-17 20:05:47','2023-08-17 20:05:47'),(5391,'5205703','Corrego do Ouro','GO','2023-08-17 20:05:47','2023-08-17 20:05:47'),(5392,'5205802','Corumba de Goias','GO','2023-08-17 20:05:47','2023-08-17 20:05:47'),(5393,'5205901','Corumbaiba','GO','2023-08-17 20:05:47','2023-08-17 20:05:47'),(5394,'5206206','Cristalina','GO','2023-08-17 20:05:47','2023-08-17 20:05:47'),(5395,'5206305','Cristianopolis','GO','2023-08-17 20:05:47','2023-08-17 20:05:47'),(5396,'5206404','Crixas','GO','2023-08-17 20:05:47','2023-08-17 20:05:47'),(5397,'5206503','Crominia','GO','2023-08-17 20:05:47','2023-08-17 20:05:47'),(5398,'5206602','Cumari','GO','2023-08-17 20:05:47','2023-08-17 20:05:47'),(5399,'5206701','Damianopolis','GO','2023-08-17 20:05:47','2023-08-17 20:05:47'),(5400,'5206800','Damolândia','GO','2023-08-17 20:05:47','2023-08-17 20:05:47'),(5401,'5206909','Davinopolis','GO','2023-08-17 20:05:47','2023-08-17 20:05:47'),(5402,'5207105','Diorama','GO','2023-08-17 20:05:47','2023-08-17 20:05:47'),(5403,'5207253','Doverlândia','GO','2023-08-17 20:05:47','2023-08-17 20:05:47'),(5404,'5207352','Edealina','GO','2023-08-17 20:05:47','2023-08-17 20:05:47'),(5405,'5207402','Edeia','GO','2023-08-17 20:05:47','2023-08-17 20:05:47'),(5406,'5207501','Estrela do Norte','GO','2023-08-17 20:05:47','2023-08-17 20:05:47'),(5407,'5207535','Faina','GO','2023-08-17 20:05:47','2023-08-17 20:05:47'),(5408,'5207600','Fazenda Nova','GO','2023-08-17 20:05:47','2023-08-17 20:05:47'),(5409,'5207808','Firminopolis','GO','2023-08-17 20:05:47','2023-08-17 20:05:47'),(5410,'5207907','Flores de Goias','GO','2023-08-17 20:05:47','2023-08-17 20:05:47'),(5411,'5208004','Formosa','GO','2023-08-17 20:05:47','2023-08-17 20:05:47'),(5412,'5208103','Formoso','GO','2023-08-17 20:05:47','2023-08-17 20:05:47'),(5413,'5208152','Gameleira de Goias','GO','2023-08-17 20:05:47','2023-08-17 20:05:47'),(5414,'5208301','Divinopolis de Goias','GO','2023-08-17 20:05:47','2023-08-17 20:05:47'),(5415,'5208400','Goianapolis','GO','2023-08-17 20:05:47','2023-08-17 20:05:47'),(5416,'5208509','Goiandira','GO','2023-08-17 20:05:47','2023-08-17 20:05:47'),(5417,'5208608','Goianesia','GO','2023-08-17 20:05:47','2023-08-17 20:05:47'),(5418,'5208707','Goiânia','GO','2023-08-17 20:05:47','2023-08-17 20:05:47'),(5419,'5208806','Goianira','GO','2023-08-17 20:05:47','2023-08-17 20:05:47'),(5420,'5208905','Goias','GO','2023-08-17 20:05:47','2023-08-17 20:05:47'),(5421,'5209101','Goiatuba','GO','2023-08-17 20:05:47','2023-08-17 20:05:47'),(5422,'5209150','Gouvelândia','GO','2023-08-17 20:05:47','2023-08-17 20:05:47'),(5423,'5209200','Guapo','GO','2023-08-17 20:05:47','2023-08-17 20:05:47'),(5424,'5209291','Guaraita','GO','2023-08-17 20:05:47','2023-08-17 20:05:47'),(5425,'5209408','Guarani de Goias','GO','2023-08-17 20:05:47','2023-08-17 20:05:47'),(5426,'5209457','Guarinos','GO','2023-08-17 20:05:47','2023-08-17 20:05:47'),(5427,'5209606','Heitorai','GO','2023-08-17 20:05:47','2023-08-17 20:05:47'),(5428,'5209705','Hidrolândia','GO','2023-08-17 20:05:47','2023-08-17 20:05:47'),(5429,'5209804','Hidrolina','GO','2023-08-17 20:05:47','2023-08-17 20:05:47'),(5430,'5209903','Iaciara','GO','2023-08-17 20:05:47','2023-08-17 20:05:47'),(5431,'5209937','Inaciolândia','GO','2023-08-17 20:05:47','2023-08-17 20:05:47'),(5432,'5209952','Indiara','GO','2023-08-17 20:05:47','2023-08-17 20:05:47'),(5433,'5210000','Inhumas','GO','2023-08-17 20:05:47','2023-08-17 20:05:47'),(5434,'5210109','Ipameri','GO','2023-08-17 20:05:47','2023-08-17 20:05:47'),(5435,'5210158','Ipiranga de Goias','GO','2023-08-17 20:05:47','2023-08-17 20:05:47'),(5436,'5210208','Ipora','GO','2023-08-17 20:05:47','2023-08-17 20:05:47'),(5437,'5210307','Israelândia','GO','2023-08-17 20:05:47','2023-08-17 20:05:47'),(5438,'5210406','Itaberai','GO','2023-08-17 20:05:47','2023-08-17 20:05:47'),(5439,'5210562','Itaguari','GO','2023-08-17 20:05:47','2023-08-17 20:05:47'),(5440,'5210604','Itaguaru','GO','2023-08-17 20:05:47','2023-08-17 20:05:47'),(5441,'5210802','Itaja','GO','2023-08-17 20:05:47','2023-08-17 20:05:47'),(5442,'5210901','Itapaci','GO','2023-08-17 20:05:47','2023-08-17 20:05:47'),(5443,'5211008','Itapirapua','GO','2023-08-17 20:05:47','2023-08-17 20:05:47'),(5444,'5211206','Itapuranga','GO','2023-08-17 20:05:47','2023-08-17 20:05:47'),(5445,'5211305','Itaruma','GO','2023-08-17 20:05:47','2023-08-17 20:05:47'),(5446,'5211404','Itauçu','GO','2023-08-17 20:05:47','2023-08-17 20:05:47'),(5447,'5211503','Itumbiara','GO','2023-08-17 20:05:47','2023-08-17 20:05:47'),(5448,'5211602','Ivolândia','GO','2023-08-17 20:05:47','2023-08-17 20:05:47'),(5449,'5211701','Jandaia','GO','2023-08-17 20:05:47','2023-08-17 20:05:47'),(5450,'5211800','Jaragua','GO','2023-08-17 20:05:47','2023-08-17 20:05:47'),(5451,'5211909','Jatai','GO','2023-08-17 20:05:47','2023-08-17 20:05:47'),(5452,'5212006','Jaupaci','GO','2023-08-17 20:05:47','2023-08-17 20:05:47'),(5453,'5212055','Jesupolis','GO','2023-08-17 20:05:47','2023-08-17 20:05:47'),(5454,'5212105','Joviânia','GO','2023-08-17 20:05:47','2023-08-17 20:05:47'),(5455,'5212204','Jussara','GO','2023-08-17 20:05:47','2023-08-17 20:05:47'),(5456,'5212253','Lagoa Santa','GO','2023-08-17 20:05:47','2023-08-17 20:05:47'),(5457,'5212303','Leopoldo de Bulhoes','GO','2023-08-17 20:05:47','2023-08-17 20:05:47'),(5458,'5212501','Luziânia','GO','2023-08-17 20:05:47','2023-08-17 20:05:47'),(5459,'5212600','Mairipotaba','GO','2023-08-17 20:05:47','2023-08-17 20:05:47'),(5460,'5212709','Mambai','GO','2023-08-17 20:05:47','2023-08-17 20:05:47'),(5461,'5212808','Mara Rosa','GO','2023-08-17 20:05:47','2023-08-17 20:05:47'),(5462,'5212907','Marzagao','GO','2023-08-17 20:05:47','2023-08-17 20:05:47'),(5463,'5212956','Matrincha','GO','2023-08-17 20:05:47','2023-08-17 20:05:47'),(5464,'5213004','Maurilândia','GO','2023-08-17 20:05:47','2023-08-17 20:05:47'),(5465,'5213053','Mimoso de Goias','GO','2023-08-17 20:05:47','2023-08-17 20:05:47'),(5466,'5213087','Minaçu','GO','2023-08-17 20:05:47','2023-08-17 20:05:47'),(5467,'5213103','Mineiros','GO','2023-08-17 20:05:47','2023-08-17 20:05:47'),(5468,'5213400','Moipora','GO','2023-08-17 20:05:47','2023-08-17 20:05:47'),(5469,'5213509','Monte Alegre de Goias','GO','2023-08-17 20:05:47','2023-08-17 20:05:47'),(5470,'5213707','Montes Claros de Goias','GO','2023-08-17 20:05:47','2023-08-17 20:05:47'),(5471,'5213756','Montividiu','GO','2023-08-17 20:05:47','2023-08-17 20:05:47'),(5472,'5213772','Montividiu do Norte','GO','2023-08-17 20:05:47','2023-08-17 20:05:47'),(5473,'5213806','Morrinhos','GO','2023-08-17 20:05:47','2023-08-17 20:05:47'),(5474,'5213855','Morro Agudo de Goias','GO','2023-08-17 20:05:47','2023-08-17 20:05:47'),(5475,'5213905','Mossâmedes','GO','2023-08-17 20:05:47','2023-08-17 20:05:47'),(5476,'5214002','Mozarlândia','GO','2023-08-17 20:05:47','2023-08-17 20:05:47'),(5477,'5214051','Mundo Novo','GO','2023-08-17 20:05:47','2023-08-17 20:05:47'),(5478,'5214101','Mutunopolis','GO','2023-08-17 20:05:47','2023-08-17 20:05:47'),(5479,'5214408','Nazario','GO','2023-08-17 20:05:47','2023-08-17 20:05:47'),(5480,'5214507','Neropolis','GO','2023-08-17 20:05:47','2023-08-17 20:05:47'),(5481,'5214606','Niquelândia','GO','2023-08-17 20:05:47','2023-08-17 20:05:47'),(5482,'5214705','Nova America','GO','2023-08-17 20:05:47','2023-08-17 20:05:47'),(5483,'5214804','Nova Aurora','GO','2023-08-17 20:05:47','2023-08-17 20:05:47'),(5484,'5214838','Nova Crixas','GO','2023-08-17 20:05:47','2023-08-17 20:05:47'),(5485,'5214861','Nova Gloria','GO','2023-08-17 20:05:47','2023-08-17 20:05:47'),(5486,'5214879','Nova Iguaçu de Goias','GO','2023-08-17 20:05:47','2023-08-17 20:05:47'),(5487,'5214903','Nova Roma','GO','2023-08-17 20:05:47','2023-08-17 20:05:47'),(5488,'5215009','Nova Veneza','GO','2023-08-17 20:05:47','2023-08-17 20:05:47'),(5489,'5215207','Novo Brasil','GO','2023-08-17 20:05:47','2023-08-17 20:05:47'),(5490,'5215231','Novo Gama','GO','2023-08-17 20:05:47','2023-08-17 20:05:47'),(5491,'5215256','Novo Planalto','GO','2023-08-17 20:05:47','2023-08-17 20:05:47'),(5492,'5215306','Orizona','GO','2023-08-17 20:05:47','2023-08-17 20:05:47'),(5493,'5215405','Ouro Verde de Goias','GO','2023-08-17 20:05:47','2023-08-17 20:05:47'),(5494,'5215504','Ouvidor','GO','2023-08-17 20:05:47','2023-08-17 20:05:47'),(5495,'5215603','Padre Bernardo','GO','2023-08-17 20:05:47','2023-08-17 20:05:47'),(5496,'5215652','Palestina de Goias','GO','2023-08-17 20:05:47','2023-08-17 20:05:47'),(5497,'5215702','Palmeiras de Goias','GO','2023-08-17 20:05:47','2023-08-17 20:05:47'),(5498,'5215801','Palmelo','GO','2023-08-17 20:05:47','2023-08-17 20:05:47'),(5499,'5215900','Palminopolis','GO','2023-08-17 20:05:47','2023-08-17 20:05:47'),(5500,'5216007','Panama','GO','2023-08-17 20:05:47','2023-08-17 20:05:47'),(5501,'5216304','Paranaiguara','GO','2023-08-17 20:05:47','2023-08-17 20:05:47'),(5502,'5216403','Parauna','GO','2023-08-17 20:05:47','2023-08-17 20:05:47'),(5503,'5216452','Perolândia','GO','2023-08-17 20:05:47','2023-08-17 20:05:47'),(5504,'5216809','Petrolina de Goias','GO','2023-08-17 20:05:47','2023-08-17 20:05:47'),(5505,'5216908','Pilar de Goias','GO','2023-08-17 20:05:47','2023-08-17 20:05:47'),(5506,'5217104','Piracanjuba','GO','2023-08-17 20:05:47','2023-08-17 20:05:47'),(5507,'5217203','Piranhas','GO','2023-08-17 20:05:47','2023-08-17 20:05:47'),(5508,'5217302','Pirenopolis','GO','2023-08-17 20:05:47','2023-08-17 20:05:47'),(5509,'5217401','Pires do Rio','GO','2023-08-17 20:05:47','2023-08-17 20:05:47'),(5510,'5217609','Planaltina','GO','2023-08-17 20:05:47','2023-08-17 20:05:47'),(5511,'5217708','Pontalina','GO','2023-08-17 20:05:47','2023-08-17 20:05:47'),(5512,'5218003','Porangatu','GO','2023-08-17 20:05:47','2023-08-17 20:05:47'),(5513,'5218052','Porteirao','GO','2023-08-17 20:05:47','2023-08-17 20:05:47'),(5514,'5218102','Portelândia','GO','2023-08-17 20:05:47','2023-08-17 20:05:47'),(5515,'5218300','Posse','GO','2023-08-17 20:05:47','2023-08-17 20:05:47'),(5516,'5218391','Professor Jamil','GO','2023-08-17 20:05:47','2023-08-17 20:05:47'),(5517,'5218508','Quirinopolis','GO','2023-08-17 20:05:47','2023-08-17 20:05:47'),(5518,'5218607','Rialma','GO','2023-08-17 20:05:47','2023-08-17 20:05:47'),(5519,'5218706','Rianapolis','GO','2023-08-17 20:05:47','2023-08-17 20:05:47'),(5520,'5218789','Rio Quente','GO','2023-08-17 20:05:47','2023-08-17 20:05:47'),(5521,'5218805','Rio Verde','GO','2023-08-17 20:05:47','2023-08-17 20:05:47'),(5522,'5218904','Rubiataba','GO','2023-08-17 20:05:47','2023-08-17 20:05:47'),(5523,'5219001','Sanclerlândia','GO','2023-08-17 20:05:47','2023-08-17 20:05:47'),(5524,'5219100','Santa Barbara de Goias','GO','2023-08-17 20:05:47','2023-08-17 20:05:47'),(5525,'5219209','Santa Cruz de Goias','GO','2023-08-17 20:05:47','2023-08-17 20:05:47'),(5526,'5219258','Santa Fe de Goias','GO','2023-08-17 20:05:47','2023-08-17 20:05:47'),(5527,'5219308','Santa Helena de Goias','GO','2023-08-17 20:05:47','2023-08-17 20:05:47'),(5528,'5219357','Santa Isabel','GO','2023-08-17 20:05:47','2023-08-17 20:05:47'),(5529,'5219407','Santa Rita do Araguaia','GO','2023-08-17 20:05:47','2023-08-17 20:05:47'),(5530,'5219456','Santa Rita do Novo Destino','GO','2023-08-17 20:05:47','2023-08-17 20:05:47'),(5531,'5219506','Santa Rosa de Goias','GO','2023-08-17 20:05:47','2023-08-17 20:05:47'),(5532,'5219605','Santa Tereza de Goias','GO','2023-08-17 20:05:47','2023-08-17 20:05:47'),(5533,'5219704','Santa Terezinha de Goias','GO','2023-08-17 20:05:47','2023-08-17 20:05:47'),(5534,'5219712','Santo Antônio da Barra','GO','2023-08-17 20:05:47','2023-08-17 20:05:47'),(5535,'5219738','Santo Antônio de Goias','GO','2023-08-17 20:05:47','2023-08-17 20:05:47'),(5536,'5219753','Santo Antônio do Descoberto','GO','2023-08-17 20:05:47','2023-08-17 20:05:47'),(5537,'5219803','Sao Domingos','GO','2023-08-17 20:05:47','2023-08-17 20:05:47'),(5538,'5219902','Sao Francisco de Goias','GO','2023-08-17 20:05:47','2023-08-17 20:05:47'),(5539,'5220009','Sao Joao D\'Aliança','GO','2023-08-17 20:05:47','2023-08-17 20:05:47'),(5540,'5220058','Sao Joao da Parauna','GO','2023-08-17 20:05:47','2023-08-17 20:05:47'),(5541,'5220108','Sao Luis de Montes Belos','GO','2023-08-17 20:05:47','2023-08-17 20:05:47'),(5542,'5220157','Sao Luiz do Norte','GO','2023-08-17 20:05:47','2023-08-17 20:05:47'),(5543,'5220207','Sao Miguel do Araguaia','GO','2023-08-17 20:05:47','2023-08-17 20:05:47'),(5544,'5220264','Sao Miguel do Passa Quatro','GO','2023-08-17 20:05:47','2023-08-17 20:05:47'),(5545,'5220280','Sao Patricio','GO','2023-08-17 20:05:47','2023-08-17 20:05:47'),(5546,'5220405','Sao Simao','GO','2023-08-17 20:05:47','2023-08-17 20:05:47'),(5547,'5220454','Senador Canedo','GO','2023-08-17 20:05:47','2023-08-17 20:05:47'),(5548,'5220504','Serranopolis','GO','2023-08-17 20:05:47','2023-08-17 20:05:47'),(5549,'5220603','Silvânia','GO','2023-08-17 20:05:47','2023-08-17 20:05:47'),(5550,'5220686','Simolândia','GO','2023-08-17 20:05:47','2023-08-17 20:05:47'),(5551,'5220702','Sitio D\'Abadia','GO','2023-08-17 20:05:47','2023-08-17 20:05:47'),(5552,'5221007','Taquaral de Goias','GO','2023-08-17 20:05:47','2023-08-17 20:05:47'),(5553,'5221080','Teresina de Goias','GO','2023-08-17 20:05:47','2023-08-17 20:05:47'),(5554,'5221197','Terezopolis de Goias','GO','2023-08-17 20:05:47','2023-08-17 20:05:47'),(5555,'5221304','Três Ranchos','GO','2023-08-17 20:05:47','2023-08-17 20:05:47'),(5556,'5221403','Trindade','GO','2023-08-17 20:05:47','2023-08-17 20:05:47'),(5557,'5221452','Trombas','GO','2023-08-17 20:05:47','2023-08-17 20:05:47'),(5558,'5221502','Turvânia','GO','2023-08-17 20:05:47','2023-08-17 20:05:47'),(5559,'5221551','Turvelândia','GO','2023-08-17 20:05:47','2023-08-17 20:05:47'),(5560,'5221577','Uirapuru','GO','2023-08-17 20:05:47','2023-08-17 20:05:47'),(5561,'5221601','Uruaçu','GO','2023-08-17 20:05:47','2023-08-17 20:05:47'),(5562,'5221700','Uruana','GO','2023-08-17 20:05:47','2023-08-17 20:05:47'),(5563,'5221809','Urutai','GO','2023-08-17 20:05:47','2023-08-17 20:05:47'),(5564,'5221858','Valparaiso de Goias','GO','2023-08-17 20:05:47','2023-08-17 20:05:47'),(5565,'5221908','Varjao','GO','2023-08-17 20:05:47','2023-08-17 20:05:47'),(5566,'5222005','Vianopolis','GO','2023-08-17 20:05:47','2023-08-17 20:05:47'),(5567,'5222054','Vicentinopolis','GO','2023-08-17 20:05:47','2023-08-17 20:05:47'),(5568,'5222203','Vila Boa','GO','2023-08-17 20:05:47','2023-08-17 20:05:47'),(5569,'5222302','Vila Propicio','GO','2023-08-17 20:05:47','2023-08-17 20:05:47'),(5570,'5300108','Brasilia','DF','2023-08-17 20:05:47','2023-08-17 20:05:47');
/*!40000 ALTER TABLE `cidades` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ciots`
--

DROP TABLE IF EXISTS `ciots`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ciots` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `mdfe_id` int unsigned NOT NULL,
  `cpf_cnpj` varchar(18) COLLATE utf8mb4_unicode_ci NOT NULL,
  `codigo` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ciots_mdfe_id_foreign` (`mdfe_id`),
  CONSTRAINT `ciots_mdfe_id_foreign` FOREIGN KEY (`mdfe_id`) REFERENCES `mdves` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ciots`
--

LOCK TABLES `ciots` WRITE;
/*!40000 ALTER TABLE `ciots` DISABLE KEYS */;
/*!40000 ALTER TABLE `ciots` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cliente_deliveries`
--

DROP TABLE IF EXISTS `cliente_deliveries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cliente_deliveries` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `nome` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sobre_nome` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `senha` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL,
  `celular` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` int NOT NULL,
  `data_token` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `ativo` tinyint(1) NOT NULL,
  `referencia` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente_deliveries`
--

LOCK TABLES `cliente_deliveries` WRITE;
/*!40000 ALTER TABLE `cliente_deliveries` DISABLE KEYS */;
/*!40000 ALTER TABLE `cliente_deliveries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cliente_ecommerces`
--

DROP TABLE IF EXISTS `cliente_ecommerces`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cliente_ecommerces` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `nome` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sobre_nome` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cpf` varchar(18) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `telefone` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `senha` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente_ecommerces`
--

LOCK TABLES `cliente_ecommerces` WRITE;
/*!40000 ALTER TABLE `cliente_ecommerces` DISABLE KEYS */;
/*!40000 ALTER TABLE `cliente_ecommerces` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clientes`
--

DROP TABLE IF EXISTS `clientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clientes` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `razao_social` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nome_fantasia` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cpf_cnpj` varchar(19) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '000.000.000-00',
  `rua` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ie_rg` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `numero` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `bairro` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `telefone` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `celular` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '00 00000 0000',
  `email` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'null',
  `cep` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'null',
  `consumidor_final` int NOT NULL,
  `contribuinte` int NOT NULL,
  `cidade_id` int unsigned NOT NULL,
  `limite_venda` decimal(10,2) NOT NULL DEFAULT '0.00',
  `rua_cobranca` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `numero_cobranca` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `bairro_cobranca` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cep_cobranca` varchar(9) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cidade_cobranca_id` int unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `clientes_cidade_id_foreign` (`cidade_id`),
  KEY `clientes_cidade_cobranca_id_foreign` (`cidade_cobranca_id`),
  CONSTRAINT `clientes_cidade_cobranca_id_foreign` FOREIGN KEY (`cidade_cobranca_id`) REFERENCES `cidades` (`id`) ON DELETE CASCADE,
  CONSTRAINT `clientes_cidade_id_foreign` FOREIGN KEY (`cidade_id`) REFERENCES `cidades` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clientes`
--

LOCK TABLES `clientes` WRITE;
/*!40000 ALTER TABLE `clientes` DISABLE KEYS */;
/*!40000 ALTER TABLE `clientes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `codigo_descontos`
--

DROP TABLE IF EXISTS `codigo_descontos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `codigo_descontos` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `codigo` int NOT NULL,
  `cliente_id` int unsigned DEFAULT NULL,
  `tipo` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `valor` decimal(10,4) NOT NULL,
  `ativo` tinyint(1) NOT NULL,
  `push` tinyint(1) NOT NULL,
  `sms` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `codigo_descontos_cliente_id_foreign` (`cliente_id`),
  CONSTRAINT `codigo_descontos_cliente_id_foreign` FOREIGN KEY (`cliente_id`) REFERENCES `cliente_deliveries` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `codigo_descontos`
--

LOCK TABLES `codigo_descontos` WRITE;
/*!40000 ALTER TABLE `codigo_descontos` DISABLE KEYS */;
/*!40000 ALTER TABLE `codigo_descontos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comissao_vendas`
--

DROP TABLE IF EXISTS `comissao_vendas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comissao_vendas` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `funcionario_id` int unsigned DEFAULT NULL,
  `venda_id` int NOT NULL,
  `tabela` varchar(14) COLLATE utf8mb4_unicode_ci NOT NULL,
  `valor` decimal(10,2) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `comissao_vendas_funcionario_id_foreign` (`funcionario_id`),
  CONSTRAINT `comissao_vendas_funcionario_id_foreign` FOREIGN KEY (`funcionario_id`) REFERENCES `funcionarios` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comissao_vendas`
--

LOCK TABLES `comissao_vendas` WRITE;
/*!40000 ALTER TABLE `comissao_vendas` DISABLE KEYS */;
/*!40000 ALTER TABLE `comissao_vendas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `complemento_deliveries`
--

DROP TABLE IF EXISTS `complemento_deliveries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `complemento_deliveries` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `nome` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `valor` decimal(10,2) NOT NULL,
  `categoria_id` int unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `complemento_deliveries_categoria_id_foreign` (`categoria_id`),
  CONSTRAINT `complemento_deliveries_categoria_id_foreign` FOREIGN KEY (`categoria_id`) REFERENCES `categoria_adicionals` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `complemento_deliveries`
--

LOCK TABLES `complemento_deliveries` WRITE;
/*!40000 ALTER TABLE `complemento_deliveries` DISABLE KEYS */;
/*!40000 ALTER TABLE `complemento_deliveries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `componente_ctes`
--

DROP TABLE IF EXISTS `componente_ctes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `componente_ctes` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `nome` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `valor` decimal(10,4) NOT NULL,
  `cte_id` int unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `componente_ctes_cte_id_foreign` (`cte_id`),
  CONSTRAINT `componente_ctes_cte_id_foreign` FOREIGN KEY (`cte_id`) REFERENCES `ctes` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `componente_ctes`
--

LOCK TABLES `componente_ctes` WRITE;
/*!40000 ALTER TABLE `componente_ctes` DISABLE KEYS */;
/*!40000 ALTER TABLE `componente_ctes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `compras`
--

DROP TABLE IF EXISTS `compras`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `compras` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `fornecedor_id` int unsigned NOT NULL,
  `usuario_id` int unsigned NOT NULL,
  `observacao` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `xml_path` varchar(48) COLLATE utf8mb4_unicode_ci NOT NULL,
  `chave` varchar(44) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nf` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `numero_emissao` int NOT NULL,
  `estado` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `valor` decimal(10,2) NOT NULL,
  `desconto` decimal(10,2) NOT NULL,
  `dfe_id` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `compras_fornecedor_id_foreign` (`fornecedor_id`),
  KEY `compras_usuario_id_foreign` (`usuario_id`),
  CONSTRAINT `compras_fornecedor_id_foreign` FOREIGN KEY (`fornecedor_id`) REFERENCES `fornecedors` (`id`) ON DELETE CASCADE,
  CONSTRAINT `compras_usuario_id_foreign` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `compras`
--

LOCK TABLES `compras` WRITE;
/*!40000 ALTER TABLE `compras` DISABLE KEYS */;
/*!40000 ALTER TABLE `compras` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `config_caixas`
--

DROP TABLE IF EXISTS `config_caixas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `config_caixas` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `finalizar` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `reiniciar` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `editar_desconto` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `editar_acrescimo` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `editar_observacao` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `setar_valor_recebido` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `forma_pagamento_dinheiro` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `forma_pagamento_debito` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `forma_pagamento_credito` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `forma_pagamento_pix` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `setar_leitor` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `valor_recebido_automatico` tinyint(1) NOT NULL,
  `usuario_id` int unsigned NOT NULL,
  `impressora_modelo` int NOT NULL DEFAULT '80',
  `modelo_pdv` int NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `config_caixas_usuario_id_foreign` (`usuario_id`),
  CONSTRAINT `config_caixas_usuario_id_foreign` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `config_caixas`
--

LOCK TABLES `config_caixas` WRITE;
/*!40000 ALTER TABLE `config_caixas` DISABLE KEYS */;
/*!40000 ALTER TABLE `config_caixas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `config_ecommerces`
--

DROP TABLE IF EXISTS `config_ecommerces`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `config_ecommerces` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `nome` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `link` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `logo` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL,
  `rua` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL,
  `numero` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `bairro` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cidade` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `uf` varchar(2) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cep` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `telefone` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `link_facebook` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `link_twiter` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `link_instagram` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `frete_gratis_valor` decimal(10,2) NOT NULL,
  `mercadopago_public_key` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mercadopago_access_token` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `funcionamento` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `latitude` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `longitude` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `politica_privacidade` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `src_mapa` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `cor_principal` varchar(8) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tema_ecommerce` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `google_api` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `config_ecommerces`
--

LOCK TABLES `config_ecommerces` WRITE;
/*!40000 ALTER TABLE `config_ecommerces` DISABLE KEYS */;
/*!40000 ALTER TABLE `config_ecommerces` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `config_notas`
--

DROP TABLE IF EXISTS `config_notas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `config_notas` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `razao_social` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nome_fantasia` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cnpj` varchar(19) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ie` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `logradouro` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL,
  `numero` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `bairro` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `fone` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cep` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `pais` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `municipio` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `codPais` int NOT NULL,
  `codMun` int NOT NULL,
  `UF` char(2) COLLATE utf8mb4_unicode_ci NOT NULL,
  `CST_CSOSN_padrao` varchar(3) COLLATE utf8mb4_unicode_ci NOT NULL,
  `CST_COFINS_padrao` varchar(3) COLLATE utf8mb4_unicode_ci NOT NULL,
  `CST_PIS_padrao` varchar(3) COLLATE utf8mb4_unicode_ci NOT NULL,
  `CST_IPI_padrao` varchar(3) COLLATE utf8mb4_unicode_ci NOT NULL,
  `frete_padrao` int NOT NULL,
  `tipo_pagamento_padrao` varchar(2) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nat_op_padrao` int NOT NULL,
  `ambiente` int NOT NULL,
  `cUF` varchar(2) COLLATE utf8mb4_unicode_ci NOT NULL,
  `numero_serie_nfe` varchar(3) COLLATE utf8mb4_unicode_ci NOT NULL,
  `numero_serie_nfce` varchar(3) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ultimo_numero_nfe` int NOT NULL,
  `ultimo_numero_nfce` int NOT NULL,
  `ultimo_numero_cte` int NOT NULL,
  `ultimo_numero_mdfe` int NOT NULL,
  `csc` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `csc_id` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `certificado_a3` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `config_notas`
--

LOCK TABLES `config_notas` WRITE;
/*!40000 ALTER TABLE `config_notas` DISABLE KEYS */;
/*!40000 ALTER TABLE `config_notas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `conta_pagars`
--

DROP TABLE IF EXISTS `conta_pagars`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conta_pagars` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `compra_id` int unsigned DEFAULT NULL,
  `categoria_id` int unsigned NOT NULL,
  `referencia` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `valor_integral` decimal(10,2) NOT NULL,
  `valor_pago` decimal(10,2) NOT NULL DEFAULT '0.00',
  `date_register` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `data_vencimento` date NOT NULL,
  `data_pagamento` date NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `conta_pagars_compra_id_foreign` (`compra_id`),
  KEY `conta_pagars_categoria_id_foreign` (`categoria_id`),
  CONSTRAINT `conta_pagars_categoria_id_foreign` FOREIGN KEY (`categoria_id`) REFERENCES `categoria_contas` (`id`) ON DELETE CASCADE,
  CONSTRAINT `conta_pagars_compra_id_foreign` FOREIGN KEY (`compra_id`) REFERENCES `compras` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `conta_pagars`
--

LOCK TABLES `conta_pagars` WRITE;
/*!40000 ALTER TABLE `conta_pagars` DISABLE KEYS */;
/*!40000 ALTER TABLE `conta_pagars` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `conta_recebers`
--

DROP TABLE IF EXISTS `conta_recebers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conta_recebers` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `venda_id` int unsigned DEFAULT NULL,
  `usuario_id` int unsigned DEFAULT NULL,
  `categoria_id` int unsigned NOT NULL,
  `referencia` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `valor_integral` decimal(10,2) NOT NULL,
  `valor_recebido` decimal(10,2) NOT NULL DEFAULT '0.00',
  `date_register` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `data_vencimento` date NOT NULL,
  `data_recebimento` date NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `conta_recebers_venda_id_foreign` (`venda_id`),
  KEY `conta_recebers_usuario_id_foreign` (`usuario_id`),
  KEY `conta_recebers_categoria_id_foreign` (`categoria_id`),
  CONSTRAINT `conta_recebers_categoria_id_foreign` FOREIGN KEY (`categoria_id`) REFERENCES `categoria_contas` (`id`) ON DELETE CASCADE,
  CONSTRAINT `conta_recebers_usuario_id_foreign` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`) ON DELETE CASCADE,
  CONSTRAINT `conta_recebers_venda_id_foreign` FOREIGN KEY (`venda_id`) REFERENCES `vendas` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `conta_recebers`
--

LOCK TABLES `conta_recebers` WRITE;
/*!40000 ALTER TABLE `conta_recebers` DISABLE KEYS */;
/*!40000 ALTER TABLE `conta_recebers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contato_ecommerces`
--

DROP TABLE IF EXISTS `contato_ecommerces`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contato_ecommerces` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `nome` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `texto` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contato_ecommerces`
--

LOCK TABLES `contato_ecommerces` WRITE;
/*!40000 ALTER TABLE `contato_ecommerces` DISABLE KEYS */;
/*!40000 ALTER TABLE `contato_ecommerces` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contato_funcionarios`
--

DROP TABLE IF EXISTS `contato_funcionarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contato_funcionarios` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `nome` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `telefone` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `funcionario_id` int unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `contato_funcionarios_funcionario_id_foreign` (`funcionario_id`),
  CONSTRAINT `contato_funcionarios_funcionario_id_foreign` FOREIGN KEY (`funcionario_id`) REFERENCES `funcionarios` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contato_funcionarios`
--

LOCK TABLES `contato_funcionarios` WRITE;
/*!40000 ALTER TABLE `contato_funcionarios` DISABLE KEYS */;
/*!40000 ALTER TABLE `contato_funcionarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cotacaos`
--

DROP TABLE IF EXISTS `cotacaos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cotacaos` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `fornecedor_id` int unsigned NOT NULL,
  `forma_pagamento` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `responsavel` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `referencia` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `link` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `observacao` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `resposta` tinyint(1) NOT NULL,
  `ativa` tinyint(1) NOT NULL,
  `valor` decimal(10,2) NOT NULL,
  `desconto` decimal(10,2) NOT NULL,
  `escolhida` tinyint(1) NOT NULL,
  `data_registro` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cotacaos_fornecedor_id_foreign` (`fornecedor_id`),
  CONSTRAINT `cotacaos_fornecedor_id_foreign` FOREIGN KEY (`fornecedor_id`) REFERENCES `fornecedors` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cotacaos`
--

LOCK TABLES `cotacaos` WRITE;
/*!40000 ALTER TABLE `cotacaos` DISABLE KEYS */;
/*!40000 ALTER TABLE `cotacaos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `credito_vendas`
--

DROP TABLE IF EXISTS `credito_vendas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `credito_vendas` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `venda_id` int unsigned NOT NULL,
  `cliente_id` int unsigned NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `credito_vendas_venda_id_foreign` (`venda_id`),
  KEY `credito_vendas_cliente_id_foreign` (`cliente_id`),
  CONSTRAINT `credito_vendas_cliente_id_foreign` FOREIGN KEY (`cliente_id`) REFERENCES `clientes` (`id`) ON DELETE CASCADE,
  CONSTRAINT `credito_vendas_venda_id_foreign` FOREIGN KEY (`venda_id`) REFERENCES `vendas` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `credito_vendas`
--

LOCK TABLES `credito_vendas` WRITE;
/*!40000 ALTER TABLE `credito_vendas` DISABLE KEYS */;
/*!40000 ALTER TABLE `credito_vendas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ctes`
--

DROP TABLE IF EXISTS `ctes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ctes` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `chave_nfe` varchar(450) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remetente_id` int unsigned NOT NULL,
  `destinatario_id` int unsigned NOT NULL,
  `usuario_id` int unsigned NOT NULL,
  `natureza_id` int unsigned NOT NULL,
  `tomador` int NOT NULL,
  `municipio_envio` int unsigned NOT NULL,
  `municipio_inicio` int unsigned NOT NULL,
  `municipio_fim` int unsigned NOT NULL,
  `logradouro_tomador` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `numero_tomador` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bairro_tomador` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cep_tomador` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `municipio_tomador` int unsigned DEFAULT NULL,
  `valor_transporte` decimal(10,2) NOT NULL,
  `valor_receber` decimal(10,2) NOT NULL,
  `valor_carga` decimal(10,2) NOT NULL,
  `produto_predominante` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `data_previsata_entrega` date NOT NULL,
  `observacao` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sequencia_cce` int NOT NULL,
  `cte_numero` int NOT NULL DEFAULT '0',
  `chave` varchar(48) COLLATE utf8mb4_unicode_ci NOT NULL,
  `path_xml` varchar(51) COLLATE utf8mb4_unicode_ci NOT NULL,
  `estado` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `data_registro` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `retira` tinyint(1) NOT NULL,
  `detalhes_retira` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `modal` varchar(2) COLLATE utf8mb4_unicode_ci NOT NULL,
  `veiculo_id` int unsigned NOT NULL,
  `tpDoc` varchar(2) COLLATE utf8mb4_unicode_ci NOT NULL,
  `descOutros` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nDoc` int NOT NULL,
  `vDocFisc` decimal(10,2) NOT NULL,
  `globalizado` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ctes_remetente_id_foreign` (`remetente_id`),
  KEY `ctes_destinatario_id_foreign` (`destinatario_id`),
  KEY `ctes_usuario_id_foreign` (`usuario_id`),
  KEY `ctes_natureza_id_foreign` (`natureza_id`),
  KEY `ctes_municipio_envio_foreign` (`municipio_envio`),
  KEY `ctes_municipio_inicio_foreign` (`municipio_inicio`),
  KEY `ctes_municipio_fim_foreign` (`municipio_fim`),
  KEY `ctes_municipio_tomador_foreign` (`municipio_tomador`),
  KEY `ctes_veiculo_id_foreign` (`veiculo_id`),
  CONSTRAINT `ctes_destinatario_id_foreign` FOREIGN KEY (`destinatario_id`) REFERENCES `clientes` (`id`),
  CONSTRAINT `ctes_municipio_envio_foreign` FOREIGN KEY (`municipio_envio`) REFERENCES `cidades` (`id`),
  CONSTRAINT `ctes_municipio_fim_foreign` FOREIGN KEY (`municipio_fim`) REFERENCES `cidades` (`id`),
  CONSTRAINT `ctes_municipio_inicio_foreign` FOREIGN KEY (`municipio_inicio`) REFERENCES `cidades` (`id`),
  CONSTRAINT `ctes_municipio_tomador_foreign` FOREIGN KEY (`municipio_tomador`) REFERENCES `cidades` (`id`),
  CONSTRAINT `ctes_natureza_id_foreign` FOREIGN KEY (`natureza_id`) REFERENCES `natureza_operacaos` (`id`),
  CONSTRAINT `ctes_remetente_id_foreign` FOREIGN KEY (`remetente_id`) REFERENCES `clientes` (`id`),
  CONSTRAINT `ctes_usuario_id_foreign` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`),
  CONSTRAINT `ctes_veiculo_id_foreign` FOREIGN KEY (`veiculo_id`) REFERENCES `veiculos` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ctes`
--

LOCK TABLES `ctes` WRITE;
/*!40000 ALTER TABLE `ctes` DISABLE KEYS */;
/*!40000 ALTER TABLE `ctes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `curtida_produto_ecommerces`
--

DROP TABLE IF EXISTS `curtida_produto_ecommerces`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `curtida_produto_ecommerces` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `produto_id` int unsigned NOT NULL,
  `cliente_id` int unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `curtida_produto_ecommerces_produto_id_foreign` (`produto_id`),
  KEY `curtida_produto_ecommerces_cliente_id_foreign` (`cliente_id`),
  CONSTRAINT `curtida_produto_ecommerces_cliente_id_foreign` FOREIGN KEY (`cliente_id`) REFERENCES `cliente_ecommerces` (`id`) ON DELETE CASCADE,
  CONSTRAINT `curtida_produto_ecommerces_produto_id_foreign` FOREIGN KEY (`produto_id`) REFERENCES `produto_ecommerces` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `curtida_produto_ecommerces`
--

LOCK TABLES `curtida_produto_ecommerces` WRITE;
/*!40000 ALTER TABLE `curtida_produto_ecommerces` DISABLE KEYS */;
/*!40000 ALTER TABLE `curtida_produto_ecommerces` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `delivery_configs`
--

DROP TABLE IF EXISTS `delivery_configs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `delivery_configs` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `link_face` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `link_twiteer` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `link_google` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `link_instagram` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `telefone` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `endereco` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tempo_medio_entrega` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tempo_maximo_cancelamento` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `valor_entrega` decimal(10,2) NOT NULL,
  `nome_exibicao_web` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `latitude` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `longitude` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `politica_privacidade` varchar(400) COLLATE utf8mb4_unicode_ci NOT NULL,
  `valor_km` decimal(10,2) NOT NULL,
  `entrega_gratis_ate` int NOT NULL,
  `maximo_km_entrega` int NOT NULL,
  `usar_bairros` tinyint(1) NOT NULL,
  `maximo_adicionais` int NOT NULL,
  `maximo_adicionais_pizza` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `delivery_configs`
--

LOCK TABLES `delivery_configs` WRITE;
/*!40000 ALTER TABLE `delivery_configs` DISABLE KEYS */;
/*!40000 ALTER TABLE `delivery_configs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `despesa_ctes`
--

DROP TABLE IF EXISTS `despesa_ctes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `despesa_ctes` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `categoria_id` int unsigned NOT NULL,
  `cte_id` int unsigned NOT NULL,
  `valor` decimal(10,2) NOT NULL,
  `descricao` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `data_registro` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `despesa_ctes_categoria_id_foreign` (`categoria_id`),
  KEY `despesa_ctes_cte_id_foreign` (`cte_id`),
  CONSTRAINT `despesa_ctes_categoria_id_foreign` FOREIGN KEY (`categoria_id`) REFERENCES `categoria_despesa_ctes` (`id`) ON DELETE CASCADE,
  CONSTRAINT `despesa_ctes_cte_id_foreign` FOREIGN KEY (`cte_id`) REFERENCES `ctes` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `despesa_ctes`
--

LOCK TABLES `despesa_ctes` WRITE;
/*!40000 ALTER TABLE `despesa_ctes` DISABLE KEYS */;
/*!40000 ALTER TABLE `despesa_ctes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `devolucaos`
--

DROP TABLE IF EXISTS `devolucaos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `devolucaos` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `fornecedor_id` int unsigned NOT NULL,
  `usuario_id` int unsigned NOT NULL,
  `natureza_id` int unsigned NOT NULL,
  `transportadora_id` int unsigned DEFAULT NULL,
  `data_registro` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `valor_integral` decimal(10,2) NOT NULL,
  `valor_devolvido` decimal(10,2) NOT NULL,
  `motivo` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `observacao` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `estado` int NOT NULL,
  `devolucao_parcial` tinyint(1) NOT NULL,
  `chave_nf_entrada` varchar(48) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nNf` int NOT NULL,
  `tipo` int NOT NULL,
  `vFrete` decimal(10,2) NOT NULL,
  `vDesc` decimal(10,2) NOT NULL,
  `chave_gerada` varchar(44) COLLATE utf8mb4_unicode_ci NOT NULL,
  `numero_gerado` int NOT NULL,
  `sequencia_cce` int NOT NULL DEFAULT '0',
  `transportadora_nome` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `transportadora_cidade` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `transportadora_uf` varchar(2) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `transportadora_cpf_cnpj` varchar(18) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `transportadora_ie` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `transportadora_endereco` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `frete_quantidade` decimal(6,2) NOT NULL DEFAULT '0.00',
  `frete_especie` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `frete_marca` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `frete_numero` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `frete_tipo` int NOT NULL DEFAULT '0',
  `veiculo_placa` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `veiculo_uf` varchar(2) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `frete_peso_bruto` decimal(10,3) NOT NULL DEFAULT '0.000',
  `frete_peso_liquido` decimal(10,3) NOT NULL DEFAULT '0.000',
  `despesa_acessorias` decimal(10,2) NOT NULL DEFAULT '0.00',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `devolucaos_fornecedor_id_foreign` (`fornecedor_id`),
  KEY `devolucaos_usuario_id_foreign` (`usuario_id`),
  KEY `devolucaos_natureza_id_foreign` (`natureza_id`),
  KEY `devolucaos_transportadora_id_foreign` (`transportadora_id`),
  CONSTRAINT `devolucaos_fornecedor_id_foreign` FOREIGN KEY (`fornecedor_id`) REFERENCES `fornecedors` (`id`),
  CONSTRAINT `devolucaos_natureza_id_foreign` FOREIGN KEY (`natureza_id`) REFERENCES `natureza_operacaos` (`id`),
  CONSTRAINT `devolucaos_transportadora_id_foreign` FOREIGN KEY (`transportadora_id`) REFERENCES `transportadoras` (`id`),
  CONSTRAINT `devolucaos_usuario_id_foreign` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `devolucaos`
--

LOCK TABLES `devolucaos` WRITE;
/*!40000 ALTER TABLE `devolucaos` DISABLE KEYS */;
/*!40000 ALTER TABLE `devolucaos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `divisao_grades`
--

DROP TABLE IF EXISTS `divisao_grades`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `divisao_grades` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `nome` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sub_divisao` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `divisao_grades`
--

LOCK TABLES `divisao_grades` WRITE;
/*!40000 ALTER TABLE `divisao_grades` DISABLE KEYS */;
/*!40000 ALTER TABLE `divisao_grades` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dre_categorias`
--

DROP TABLE IF EXISTS `dre_categorias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dre_categorias` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `dre_id` int unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `dre_categorias_dre_id_foreign` (`dre_id`),
  CONSTRAINT `dre_categorias_dre_id_foreign` FOREIGN KEY (`dre_id`) REFERENCES `dres` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dre_categorias`
--

LOCK TABLES `dre_categorias` WRITE;
/*!40000 ALTER TABLE `dre_categorias` DISABLE KEYS */;
/*!40000 ALTER TABLE `dre_categorias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dres`
--

DROP TABLE IF EXISTS `dres`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dres` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `inicio` date NOT NULL,
  `fim` date NOT NULL,
  `observacao` varchar(300) COLLATE utf8mb4_unicode_ci NOT NULL,
  `percentual_imposto` decimal(5,2) NOT NULL DEFAULT '0.00',
  `lucro_prejuizo` decimal(12,2) NOT NULL DEFAULT '0.00',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dres`
--

LOCK TABLES `dres` WRITE;
/*!40000 ALTER TABLE `dres` DISABLE KEYS */;
/*!40000 ALTER TABLE `dres` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `empresas`
--

DROP TABLE IF EXISTS `empresas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `empresas` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empresas`
--

LOCK TABLES `empresas` WRITE;
/*!40000 ALTER TABLE `empresas` DISABLE KEYS */;
/*!40000 ALTER TABLE `empresas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `endereco_deliveries`
--

DROP TABLE IF EXISTS `endereco_deliveries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `endereco_deliveries` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `cliente_id` int unsigned NOT NULL,
  `rua` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `bairro` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `bairro_id` int NOT NULL,
  `numero` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `referencia` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `latitude` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `longitude` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `endereco_deliveries_cliente_id_foreign` (`cliente_id`),
  CONSTRAINT `endereco_deliveries_cliente_id_foreign` FOREIGN KEY (`cliente_id`) REFERENCES `cliente_deliveries` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `endereco_deliveries`
--

LOCK TABLES `endereco_deliveries` WRITE;
/*!40000 ALTER TABLE `endereco_deliveries` DISABLE KEYS */;
/*!40000 ALTER TABLE `endereco_deliveries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `endereco_ecommerces`
--

DROP TABLE IF EXISTS `endereco_ecommerces`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `endereco_ecommerces` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `cliente_id` int unsigned NOT NULL,
  `rua` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `numero` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `bairro` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cidade` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `uf` varchar(2) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cep` varchar(9) COLLATE utf8mb4_unicode_ci NOT NULL,
  `complemento` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `endereco_ecommerces_cliente_id_foreign` (`cliente_id`),
  CONSTRAINT `endereco_ecommerces_cliente_id_foreign` FOREIGN KEY (`cliente_id`) REFERENCES `cliente_ecommerces` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `endereco_ecommerces`
--

LOCK TABLES `endereco_ecommerces` WRITE;
/*!40000 ALTER TABLE `endereco_ecommerces` DISABLE KEYS */;
/*!40000 ALTER TABLE `endereco_ecommerces` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `escritorio_contabils`
--

DROP TABLE IF EXISTS `escritorio_contabils`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `escritorio_contabils` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `razao_social` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nome_fantasia` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cnpj` varchar(19) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ie` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `logradouro` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL,
  `numero` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `bairro` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `fone` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cep` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `escritorio_contabils`
--

LOCK TABLES `escritorio_contabils` WRITE;
/*!40000 ALTER TABLE `escritorio_contabils` DISABLE KEYS */;
/*!40000 ALTER TABLE `escritorio_contabils` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estoques`
--

DROP TABLE IF EXISTS `estoques`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `estoques` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `produto_id` int unsigned NOT NULL,
  `quantidade` decimal(10,3) NOT NULL,
  `valor_compra` decimal(10,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `estoques_produto_id_foreign` (`produto_id`),
  CONSTRAINT `estoques_produto_id_foreign` FOREIGN KEY (`produto_id`) REFERENCES `produtos` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estoques`
--

LOCK TABLES `estoques` WRITE;
/*!40000 ALTER TABLE `estoques` DISABLE KEYS */;
/*!40000 ALTER TABLE `estoques` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fatura_orcamentos`
--

DROP TABLE IF EXISTS `fatura_orcamentos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fatura_orcamentos` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `orcamento_id` int unsigned DEFAULT NULL,
  `valor` decimal(10,2) NOT NULL,
  `vencimento` date NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fatura_orcamentos_orcamento_id_foreign` (`orcamento_id`),
  CONSTRAINT `fatura_orcamentos_orcamento_id_foreign` FOREIGN KEY (`orcamento_id`) REFERENCES `orcamentos` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fatura_orcamentos`
--

LOCK TABLES `fatura_orcamentos` WRITE;
/*!40000 ALTER TABLE `fatura_orcamentos` DISABLE KEYS */;
/*!40000 ALTER TABLE `fatura_orcamentos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fornecedors`
--

DROP TABLE IF EXISTS `fornecedors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fornecedors` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `razao_social` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nome_fantasia` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cpf_cnpj` varchar(19) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ie_rg` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `rua` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL,
  `numero` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `bairro` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `telefone` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `celular` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '00 00000 0000',
  `email` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cep` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cidade_id` int unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fornecedors_cidade_id_foreign` (`cidade_id`),
  CONSTRAINT `fornecedors_cidade_id_foreign` FOREIGN KEY (`cidade_id`) REFERENCES `cidades` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fornecedors`
--

LOCK TABLES `fornecedors` WRITE;
/*!40000 ALTER TABLE `fornecedors` DISABLE KEYS */;
/*!40000 ALTER TABLE `fornecedors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fretes`
--

DROP TABLE IF EXISTS `fretes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fretes` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `placa` varchar(9) COLLATE utf8mb4_unicode_ci NOT NULL,
  `uf` varchar(2) COLLATE utf8mb4_unicode_ci NOT NULL,
  `valor` decimal(10,2) NOT NULL,
  `tipo` int NOT NULL,
  `qtdVolumes` int NOT NULL,
  `numeracaoVolumes` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `especie` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `peso_liquido` decimal(8,3) NOT NULL,
  `peso_bruto` decimal(8,3) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fretes`
--

LOCK TABLES `fretes` WRITE;
/*!40000 ALTER TABLE `fretes` DISABLE KEYS */;
/*!40000 ALTER TABLE `fretes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `funcionamento_deliveries`
--

DROP TABLE IF EXISTS `funcionamento_deliveries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `funcionamento_deliveries` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `ativo` tinyint(1) NOT NULL,
  `dia` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `inicio_expediente` varchar(5) COLLATE utf8mb4_unicode_ci NOT NULL,
  `fim_expediente` varchar(5) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `funcionamento_deliveries`
--

LOCK TABLES `funcionamento_deliveries` WRITE;
/*!40000 ALTER TABLE `funcionamento_deliveries` DISABLE KEYS */;
/*!40000 ALTER TABLE `funcionamento_deliveries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `funcionario_os`
--

DROP TABLE IF EXISTS `funcionario_os`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `funcionario_os` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `usuario_id` int unsigned NOT NULL,
  `ordem_servico_id` int unsigned NOT NULL,
  `funcionario_id` int unsigned NOT NULL,
  `funcao` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `funcionario_os_usuario_id_foreign` (`usuario_id`),
  KEY `funcionario_os_ordem_servico_id_foreign` (`ordem_servico_id`),
  KEY `funcionario_os_funcionario_id_foreign` (`funcionario_id`),
  CONSTRAINT `funcionario_os_funcionario_id_foreign` FOREIGN KEY (`funcionario_id`) REFERENCES `funcionarios` (`id`),
  CONSTRAINT `funcionario_os_ordem_servico_id_foreign` FOREIGN KEY (`ordem_servico_id`) REFERENCES `ordem_servicos` (`id`),
  CONSTRAINT `funcionario_os_usuario_id_foreign` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `funcionario_os`
--

LOCK TABLES `funcionario_os` WRITE;
/*!40000 ALTER TABLE `funcionario_os` DISABLE KEYS */;
/*!40000 ALTER TABLE `funcionario_os` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `funcionarios`
--

DROP TABLE IF EXISTS `funcionarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `funcionarios` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cpf` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '000.000.000-00',
  `rg` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `rua` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL,
  `numero` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `bairro` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `telefone` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `celular` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '00 00000 0000',
  `email` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'null',
  `data_registro` date NOT NULL,
  `percentual_comissao` decimal(6,2) NOT NULL DEFAULT '0.00',
  `salario` decimal(10,2) NOT NULL DEFAULT '0.00',
  `usuario_id` int unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `funcionarios_usuario_id_foreign` (`usuario_id`),
  CONSTRAINT `funcionarios_usuario_id_foreign` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `funcionarios`
--

LOCK TABLES `funcionarios` WRITE;
/*!40000 ALTER TABLE `funcionarios` DISABLE KEYS */;
/*!40000 ALTER TABLE `funcionarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `i_b_p_t_s`
--

DROP TABLE IF EXISTS `i_b_p_t_s`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `i_b_p_t_s` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `uf` varchar(2) COLLATE utf8mb4_unicode_ci NOT NULL,
  `versao` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `i_b_p_t_s`
--

LOCK TABLES `i_b_p_t_s` WRITE;
/*!40000 ALTER TABLE `i_b_p_t_s` DISABLE KEYS */;
/*!40000 ALTER TABLE `i_b_p_t_s` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `imagem_produto_ecommerces`
--

DROP TABLE IF EXISTS `imagem_produto_ecommerces`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `imagem_produto_ecommerces` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `produto_id` int unsigned NOT NULL,
  `img` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `imagem_produto_ecommerces_produto_id_foreign` (`produto_id`),
  CONSTRAINT `imagem_produto_ecommerces_produto_id_foreign` FOREIGN KEY (`produto_id`) REFERENCES `produto_ecommerces` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `imagem_produto_ecommerces`
--

LOCK TABLES `imagem_produto_ecommerces` WRITE;
/*!40000 ALTER TABLE `imagem_produto_ecommerces` DISABLE KEYS */;
/*!40000 ALTER TABLE `imagem_produto_ecommerces` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `imagens_produto_deliveries`
--

DROP TABLE IF EXISTS `imagens_produto_deliveries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `imagens_produto_deliveries` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `produto_id` int unsigned NOT NULL,
  `path` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `imagens_produto_deliveries_produto_id_foreign` (`produto_id`),
  CONSTRAINT `imagens_produto_deliveries_produto_id_foreign` FOREIGN KEY (`produto_id`) REFERENCES `produto_deliveries` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `imagens_produto_deliveries`
--

LOCK TABLES `imagens_produto_deliveries` WRITE;
/*!40000 ALTER TABLE `imagens_produto_deliveries` DISABLE KEYS */;
/*!40000 ALTER TABLE `imagens_produto_deliveries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `info_descargas`
--

DROP TABLE IF EXISTS `info_descargas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `info_descargas` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `mdfe_id` int unsigned NOT NULL,
  `cidade_id` int unsigned NOT NULL,
  `tp_unid_transp` int NOT NULL,
  `id_unid_transp` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `quantidade_rateio` decimal(5,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `info_descargas_mdfe_id_foreign` (`mdfe_id`),
  KEY `info_descargas_cidade_id_foreign` (`cidade_id`),
  CONSTRAINT `info_descargas_cidade_id_foreign` FOREIGN KEY (`cidade_id`) REFERENCES `cidades` (`id`) ON DELETE CASCADE,
  CONSTRAINT `info_descargas_mdfe_id_foreign` FOREIGN KEY (`mdfe_id`) REFERENCES `mdves` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `info_descargas`
--

LOCK TABLES `info_descargas` WRITE;
/*!40000 ALTER TABLE `info_descargas` DISABLE KEYS */;
/*!40000 ALTER TABLE `info_descargas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `informativo_ecommerces`
--

DROP TABLE IF EXISTS `informativo_ecommerces`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `informativo_ecommerces` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `informativo_ecommerces`
--

LOCK TABLES `informativo_ecommerces` WRITE;
/*!40000 ALTER TABLE `informativo_ecommerces` DISABLE KEYS */;
/*!40000 ALTER TABLE `informativo_ecommerces` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `item_agendamentos`
--

DROP TABLE IF EXISTS `item_agendamentos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `item_agendamentos` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `servico_id` int unsigned NOT NULL,
  `agendamento_id` int unsigned NOT NULL,
  `quantidade` decimal(10,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `item_agendamentos_servico_id_foreign` (`servico_id`),
  KEY `item_agendamentos_agendamento_id_foreign` (`agendamento_id`),
  CONSTRAINT `item_agendamentos_agendamento_id_foreign` FOREIGN KEY (`agendamento_id`) REFERENCES `agendamentos` (`id`),
  CONSTRAINT `item_agendamentos_servico_id_foreign` FOREIGN KEY (`servico_id`) REFERENCES `servicos` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item_agendamentos`
--

LOCK TABLES `item_agendamentos` WRITE;
/*!40000 ALTER TABLE `item_agendamentos` DISABLE KEYS */;
/*!40000 ALTER TABLE `item_agendamentos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `item_compras`
--

DROP TABLE IF EXISTS `item_compras`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `item_compras` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `compra_id` int unsigned NOT NULL,
  `produto_id` int unsigned NOT NULL,
  `quantidade` decimal(10,2) NOT NULL,
  `valor_unitario` decimal(10,2) NOT NULL,
  `unidade_compra` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `validade` date DEFAULT NULL,
  `cfop_entrada` varchar(4) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `codigo_siad` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `item_compras_compra_id_foreign` (`compra_id`),
  KEY `item_compras_produto_id_foreign` (`produto_id`),
  CONSTRAINT `item_compras_compra_id_foreign` FOREIGN KEY (`compra_id`) REFERENCES `compras` (`id`),
  CONSTRAINT `item_compras_produto_id_foreign` FOREIGN KEY (`produto_id`) REFERENCES `produtos` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item_compras`
--

LOCK TABLES `item_compras` WRITE;
/*!40000 ALTER TABLE `item_compras` DISABLE KEYS */;
/*!40000 ALTER TABLE `item_compras` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `item_cotacaos`
--

DROP TABLE IF EXISTS `item_cotacaos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `item_cotacaos` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `cotacao_id` int unsigned NOT NULL,
  `produto_id` int unsigned NOT NULL,
  `valor` decimal(10,2) NOT NULL,
  `quantidade` decimal(8,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `item_cotacaos_cotacao_id_foreign` (`cotacao_id`),
  KEY `item_cotacaos_produto_id_foreign` (`produto_id`),
  CONSTRAINT `item_cotacaos_cotacao_id_foreign` FOREIGN KEY (`cotacao_id`) REFERENCES `cotacaos` (`id`) ON DELETE CASCADE,
  CONSTRAINT `item_cotacaos_produto_id_foreign` FOREIGN KEY (`produto_id`) REFERENCES `produtos` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item_cotacaos`
--

LOCK TABLES `item_cotacaos` WRITE;
/*!40000 ALTER TABLE `item_cotacaos` DISABLE KEYS */;
/*!40000 ALTER TABLE `item_cotacaos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `item_devolucaos`
--

DROP TABLE IF EXISTS `item_devolucaos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `item_devolucaos` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `cod` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nome` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ncm` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cfop` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `codBarras` varchar(13) COLLATE utf8mb4_unicode_ci NOT NULL,
  `valor_unit` decimal(10,2) NOT NULL,
  `quantidade` decimal(8,2) NOT NULL,
  `item_parcial` tinyint(1) NOT NULL,
  `unidade_medida` varchar(8) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cst_csosn` varchar(3) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cst_pis` varchar(3) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cst_cofins` varchar(3) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cst_ipi` varchar(3) COLLATE utf8mb4_unicode_ci NOT NULL,
  `perc_icms` decimal(8,2) NOT NULL,
  `perc_pis` decimal(8,2) NOT NULL,
  `perc_cofins` decimal(8,2) NOT NULL,
  `perc_ipi` decimal(8,2) NOT NULL,
  `pRedBC` decimal(8,2) NOT NULL,
  `devolucao_id` int unsigned NOT NULL,
  `vBCSTRet` decimal(8,2) NOT NULL DEFAULT '0.00',
  `vFrete` decimal(8,2) NOT NULL DEFAULT '0.00',
  `modBCST` decimal(8,2) NOT NULL,
  `vBCST` decimal(8,2) NOT NULL,
  `pICMSST` decimal(8,2) NOT NULL,
  `vICMSST` decimal(8,2) NOT NULL,
  `pMVAST` decimal(8,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `item_devolucaos_devolucao_id_foreign` (`devolucao_id`),
  CONSTRAINT `item_devolucaos_devolucao_id_foreign` FOREIGN KEY (`devolucao_id`) REFERENCES `devolucaos` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item_devolucaos`
--

LOCK TABLES `item_devolucaos` WRITE;
/*!40000 ALTER TABLE `item_devolucaos` DISABLE KEYS */;
/*!40000 ALTER TABLE `item_devolucaos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `item_dves`
--

DROP TABLE IF EXISTS `item_dves`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `item_dves` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `numero_nfe` int NOT NULL,
  `produto_id` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item_dves`
--

LOCK TABLES `item_dves` WRITE;
/*!40000 ALTER TABLE `item_dves` DISABLE KEYS */;
/*!40000 ALTER TABLE `item_dves` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `item_i_b_t_e_s`
--

DROP TABLE IF EXISTS `item_i_b_t_e_s`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `item_i_b_t_e_s` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `ibte_id` int unsigned NOT NULL,
  `codigo` varchar(8) COLLATE utf8mb4_unicode_ci NOT NULL,
  `descricao` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nacional_federal` decimal(5,2) NOT NULL,
  `importado_federal` decimal(5,2) NOT NULL,
  `estadual` decimal(5,2) NOT NULL,
  `municipal` decimal(5,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `item_i_b_t_e_s_ibte_id_foreign` (`ibte_id`),
  CONSTRAINT `item_i_b_t_e_s_ibte_id_foreign` FOREIGN KEY (`ibte_id`) REFERENCES `i_b_p_t_s` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item_i_b_t_e_s`
--

LOCK TABLES `item_i_b_t_e_s` WRITE;
/*!40000 ALTER TABLE `item_i_b_t_e_s` DISABLE KEYS */;
/*!40000 ALTER TABLE `item_i_b_t_e_s` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `item_orcamentos`
--

DROP TABLE IF EXISTS `item_orcamentos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `item_orcamentos` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `orcamento_id` int unsigned NOT NULL,
  `produto_id` int unsigned NOT NULL,
  `quantidade` decimal(10,2) NOT NULL,
  `valor` decimal(10,2) NOT NULL,
  `observacao` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `item_orcamentos_orcamento_id_foreign` (`orcamento_id`),
  KEY `item_orcamentos_produto_id_foreign` (`produto_id`),
  CONSTRAINT `item_orcamentos_orcamento_id_foreign` FOREIGN KEY (`orcamento_id`) REFERENCES `orcamentos` (`id`) ON DELETE CASCADE,
  CONSTRAINT `item_orcamentos_produto_id_foreign` FOREIGN KEY (`produto_id`) REFERENCES `produtos` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item_orcamentos`
--

LOCK TABLES `item_orcamentos` WRITE;
/*!40000 ALTER TABLE `item_orcamentos` DISABLE KEYS */;
/*!40000 ALTER TABLE `item_orcamentos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `item_pack_produto_deliveries`
--

DROP TABLE IF EXISTS `item_pack_produto_deliveries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `item_pack_produto_deliveries` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `produto_delivery_id` int unsigned DEFAULT NULL,
  `pack_id` int unsigned DEFAULT NULL,
  `quantidade` decimal(5,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `item_pack_produto_deliveries_produto_delivery_id_foreign` (`produto_delivery_id`),
  KEY `item_pack_produto_deliveries_pack_id_foreign` (`pack_id`),
  CONSTRAINT `item_pack_produto_deliveries_pack_id_foreign` FOREIGN KEY (`pack_id`) REFERENCES `pack_produto_deliveries` (`id`) ON DELETE CASCADE,
  CONSTRAINT `item_pack_produto_deliveries_produto_delivery_id_foreign` FOREIGN KEY (`produto_delivery_id`) REFERENCES `produto_deliveries` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item_pack_produto_deliveries`
--

LOCK TABLES `item_pack_produto_deliveries` WRITE;
/*!40000 ALTER TABLE `item_pack_produto_deliveries` DISABLE KEYS */;
/*!40000 ALTER TABLE `item_pack_produto_deliveries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `item_pedido_complemento_deliveries`
--

DROP TABLE IF EXISTS `item_pedido_complemento_deliveries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `item_pedido_complemento_deliveries` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `item_pedido_id` int unsigned NOT NULL,
  `complemento_id` int unsigned NOT NULL,
  `quantidade` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `item_pedido_complemento_deliveries_item_pedido_id_foreign` (`item_pedido_id`),
  KEY `item_pedido_complemento_deliveries_complemento_id_foreign` (`complemento_id`),
  CONSTRAINT `item_pedido_complemento_deliveries_complemento_id_foreign` FOREIGN KEY (`complemento_id`) REFERENCES `complemento_deliveries` (`id`) ON DELETE CASCADE,
  CONSTRAINT `item_pedido_complemento_deliveries_item_pedido_id_foreign` FOREIGN KEY (`item_pedido_id`) REFERENCES `item_pedido_deliveries` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item_pedido_complemento_deliveries`
--

LOCK TABLES `item_pedido_complemento_deliveries` WRITE;
/*!40000 ALTER TABLE `item_pedido_complemento_deliveries` DISABLE KEYS */;
/*!40000 ALTER TABLE `item_pedido_complemento_deliveries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `item_pedido_complemento_locals`
--

DROP TABLE IF EXISTS `item_pedido_complemento_locals`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `item_pedido_complemento_locals` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `item_pedido` int unsigned NOT NULL,
  `complemento_id` int unsigned NOT NULL,
  `quantidade` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `item_pedido_complemento_locals_item_pedido_foreign` (`item_pedido`),
  KEY `item_pedido_complemento_locals_complemento_id_foreign` (`complemento_id`),
  CONSTRAINT `item_pedido_complemento_locals_complemento_id_foreign` FOREIGN KEY (`complemento_id`) REFERENCES `complemento_deliveries` (`id`) ON DELETE CASCADE,
  CONSTRAINT `item_pedido_complemento_locals_item_pedido_foreign` FOREIGN KEY (`item_pedido`) REFERENCES `item_pedidos` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item_pedido_complemento_locals`
--

LOCK TABLES `item_pedido_complemento_locals` WRITE;
/*!40000 ALTER TABLE `item_pedido_complemento_locals` DISABLE KEYS */;
/*!40000 ALTER TABLE `item_pedido_complemento_locals` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `item_pedido_deliveries`
--

DROP TABLE IF EXISTS `item_pedido_deliveries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `item_pedido_deliveries` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `produto_id` int unsigned NOT NULL,
  `pedido_id` int unsigned NOT NULL,
  `status` tinyint(1) NOT NULL,
  `impresso` tinyint(1) NOT NULL DEFAULT '0',
  `quantidade` decimal(8,2) NOT NULL,
  `observacao` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tamanho_id` int unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `item_pedido_deliveries_produto_id_foreign` (`produto_id`),
  KEY `item_pedido_deliveries_pedido_id_foreign` (`pedido_id`),
  KEY `item_pedido_deliveries_tamanho_id_foreign` (`tamanho_id`),
  CONSTRAINT `item_pedido_deliveries_pedido_id_foreign` FOREIGN KEY (`pedido_id`) REFERENCES `pedido_deliveries` (`id`) ON DELETE CASCADE,
  CONSTRAINT `item_pedido_deliveries_produto_id_foreign` FOREIGN KEY (`produto_id`) REFERENCES `produto_deliveries` (`id`) ON DELETE CASCADE,
  CONSTRAINT `item_pedido_deliveries_tamanho_id_foreign` FOREIGN KEY (`tamanho_id`) REFERENCES `tamanho_pizzas` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item_pedido_deliveries`
--

LOCK TABLES `item_pedido_deliveries` WRITE;
/*!40000 ALTER TABLE `item_pedido_deliveries` DISABLE KEYS */;
/*!40000 ALTER TABLE `item_pedido_deliveries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `item_pedido_ecommerces`
--

DROP TABLE IF EXISTS `item_pedido_ecommerces`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `item_pedido_ecommerces` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `pedido_id` int unsigned NOT NULL,
  `produto_id` int unsigned NOT NULL,
  `quantidade` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `item_pedido_ecommerces_pedido_id_foreign` (`pedido_id`),
  KEY `item_pedido_ecommerces_produto_id_foreign` (`produto_id`),
  CONSTRAINT `item_pedido_ecommerces_pedido_id_foreign` FOREIGN KEY (`pedido_id`) REFERENCES `pedido_ecommerces` (`id`) ON DELETE CASCADE,
  CONSTRAINT `item_pedido_ecommerces_produto_id_foreign` FOREIGN KEY (`produto_id`) REFERENCES `produto_ecommerces` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item_pedido_ecommerces`
--

LOCK TABLES `item_pedido_ecommerces` WRITE;
/*!40000 ALTER TABLE `item_pedido_ecommerces` DISABLE KEYS */;
/*!40000 ALTER TABLE `item_pedido_ecommerces` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `item_pedidos`
--

DROP TABLE IF EXISTS `item_pedidos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `item_pedidos` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `produto_id` int unsigned NOT NULL,
  `pedido_id` int unsigned NOT NULL,
  `tamanho_pizza_id` int unsigned DEFAULT NULL,
  `usuario_id` int unsigned DEFAULT NULL,
  `observacao` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL,
  `quantidade` decimal(8,2) NOT NULL,
  `valor` decimal(10,2) NOT NULL,
  `impresso` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `item_pedidos_produto_id_foreign` (`produto_id`),
  KEY `item_pedidos_pedido_id_foreign` (`pedido_id`),
  KEY `item_pedidos_tamanho_pizza_id_foreign` (`tamanho_pizza_id`),
  KEY `item_pedidos_usuario_id_foreign` (`usuario_id`),
  CONSTRAINT `item_pedidos_pedido_id_foreign` FOREIGN KEY (`pedido_id`) REFERENCES `pedidos` (`id`) ON DELETE CASCADE,
  CONSTRAINT `item_pedidos_produto_id_foreign` FOREIGN KEY (`produto_id`) REFERENCES `produtos` (`id`),
  CONSTRAINT `item_pedidos_tamanho_pizza_id_foreign` FOREIGN KEY (`tamanho_pizza_id`) REFERENCES `tamanho_pizzas` (`id`) ON DELETE CASCADE,
  CONSTRAINT `item_pedidos_usuario_id_foreign` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item_pedidos`
--

LOCK TABLES `item_pedidos` WRITE;
/*!40000 ALTER TABLE `item_pedidos` DISABLE KEYS */;
/*!40000 ALTER TABLE `item_pedidos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `item_pizza_pedido_locals`
--

DROP TABLE IF EXISTS `item_pizza_pedido_locals`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `item_pizza_pedido_locals` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `item_pedido` int unsigned NOT NULL,
  `sabor_id` int unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `item_pizza_pedido_locals_item_pedido_foreign` (`item_pedido`),
  KEY `item_pizza_pedido_locals_sabor_id_foreign` (`sabor_id`),
  CONSTRAINT `item_pizza_pedido_locals_item_pedido_foreign` FOREIGN KEY (`item_pedido`) REFERENCES `item_pedidos` (`id`) ON DELETE CASCADE,
  CONSTRAINT `item_pizza_pedido_locals_sabor_id_foreign` FOREIGN KEY (`sabor_id`) REFERENCES `produto_deliveries` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item_pizza_pedido_locals`
--

LOCK TABLES `item_pizza_pedido_locals` WRITE;
/*!40000 ALTER TABLE `item_pizza_pedido_locals` DISABLE KEYS */;
/*!40000 ALTER TABLE `item_pizza_pedido_locals` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `item_pizza_pedidos`
--

DROP TABLE IF EXISTS `item_pizza_pedidos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `item_pizza_pedidos` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `item_pedido` int unsigned NOT NULL,
  `sabor_id` int unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `item_pizza_pedidos_item_pedido_foreign` (`item_pedido`),
  KEY `item_pizza_pedidos_sabor_id_foreign` (`sabor_id`),
  CONSTRAINT `item_pizza_pedidos_item_pedido_foreign` FOREIGN KEY (`item_pedido`) REFERENCES `item_pedido_deliveries` (`id`) ON DELETE CASCADE,
  CONSTRAINT `item_pizza_pedidos_sabor_id_foreign` FOREIGN KEY (`sabor_id`) REFERENCES `produto_deliveries` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item_pizza_pedidos`
--

LOCK TABLES `item_pizza_pedidos` WRITE;
/*!40000 ALTER TABLE `item_pizza_pedidos` DISABLE KEYS */;
/*!40000 ALTER TABLE `item_pizza_pedidos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `item_receitas`
--

DROP TABLE IF EXISTS `item_receitas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `item_receitas` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `produto_id` int unsigned DEFAULT NULL,
  `receita_id` int unsigned DEFAULT NULL,
  `quantidade` decimal(10,3) NOT NULL,
  `medida` varchar(8) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `item_receitas_produto_id_foreign` (`produto_id`),
  KEY `item_receitas_receita_id_foreign` (`receita_id`),
  CONSTRAINT `item_receitas_produto_id_foreign` FOREIGN KEY (`produto_id`) REFERENCES `produtos` (`id`) ON DELETE CASCADE,
  CONSTRAINT `item_receitas_receita_id_foreign` FOREIGN KEY (`receita_id`) REFERENCES `receitas` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item_receitas`
--

LOCK TABLES `item_receitas` WRITE;
/*!40000 ALTER TABLE `item_receitas` DISABLE KEYS */;
/*!40000 ALTER TABLE `item_receitas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `item_venda_caixas`
--

DROP TABLE IF EXISTS `item_venda_caixas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `item_venda_caixas` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `venda_caixa_id` int unsigned NOT NULL,
  `produto_id` int unsigned NOT NULL,
  `item_pedido_id` int unsigned DEFAULT NULL,
  `quantidade` decimal(10,3) NOT NULL,
  `valor` decimal(10,2) NOT NULL,
  `observacao` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `item_venda_caixas_venda_caixa_id_foreign` (`venda_caixa_id`),
  KEY `item_venda_caixas_produto_id_foreign` (`produto_id`),
  KEY `item_venda_caixas_item_pedido_id_foreign` (`item_pedido_id`),
  CONSTRAINT `item_venda_caixas_item_pedido_id_foreign` FOREIGN KEY (`item_pedido_id`) REFERENCES `item_pedidos` (`id`) ON DELETE CASCADE,
  CONSTRAINT `item_venda_caixas_produto_id_foreign` FOREIGN KEY (`produto_id`) REFERENCES `produtos` (`id`),
  CONSTRAINT `item_venda_caixas_venda_caixa_id_foreign` FOREIGN KEY (`venda_caixa_id`) REFERENCES `venda_caixas` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item_venda_caixas`
--

LOCK TABLES `item_venda_caixas` WRITE;
/*!40000 ALTER TABLE `item_venda_caixas` DISABLE KEYS */;
/*!40000 ALTER TABLE `item_venda_caixas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `item_vendas`
--

DROP TABLE IF EXISTS `item_vendas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `item_vendas` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `venda_id` int unsigned NOT NULL,
  `produto_id` int unsigned NOT NULL,
  `quantidade` decimal(10,3) NOT NULL,
  `valor` decimal(10,2) NOT NULL,
  `observacao` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `item_vendas_venda_id_foreign` (`venda_id`),
  KEY `item_vendas_produto_id_foreign` (`produto_id`),
  CONSTRAINT `item_vendas_produto_id_foreign` FOREIGN KEY (`produto_id`) REFERENCES `produtos` (`id`),
  CONSTRAINT `item_vendas_venda_id_foreign` FOREIGN KEY (`venda_id`) REFERENCES `vendas` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item_vendas`
--

LOCK TABLES `item_vendas` WRITE;
/*!40000 ALTER TABLE `item_vendas` DISABLE KEYS */;
/*!40000 ALTER TABLE `item_vendas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lacre_transportes`
--

DROP TABLE IF EXISTS `lacre_transportes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `lacre_transportes` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `info_id` int unsigned NOT NULL,
  `numero` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `lacre_transportes_info_id_foreign` (`info_id`),
  CONSTRAINT `lacre_transportes_info_id_foreign` FOREIGN KEY (`info_id`) REFERENCES `info_descargas` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lacre_transportes`
--

LOCK TABLES `lacre_transportes` WRITE;
/*!40000 ALTER TABLE `lacre_transportes` DISABLE KEYS */;
/*!40000 ALTER TABLE `lacre_transportes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lacre_unidade_cargas`
--

DROP TABLE IF EXISTS `lacre_unidade_cargas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `lacre_unidade_cargas` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `info_id` int unsigned NOT NULL,
  `numero` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `lacre_unidade_cargas_info_id_foreign` (`info_id`),
  CONSTRAINT `lacre_unidade_cargas_info_id_foreign` FOREIGN KEY (`info_id`) REFERENCES `info_descargas` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lacre_unidade_cargas`
--

LOCK TABLES `lacre_unidade_cargas` WRITE;
/*!40000 ALTER TABLE `lacre_unidade_cargas` DISABLE KEYS */;
/*!40000 ALTER TABLE `lacre_unidade_cargas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lancamento_categorias`
--

DROP TABLE IF EXISTS `lancamento_categorias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `lancamento_categorias` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `categoria_id` int unsigned NOT NULL,
  `nome` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `valor` decimal(10,2) NOT NULL,
  `percentual` decimal(5,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `lancamento_categorias_categoria_id_foreign` (`categoria_id`),
  CONSTRAINT `lancamento_categorias_categoria_id_foreign` FOREIGN KEY (`categoria_id`) REFERENCES `dre_categorias` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lancamento_categorias`
--

LOCK TABLES `lancamento_categorias` WRITE;
/*!40000 ALTER TABLE `lancamento_categorias` DISABLE KEYS */;
/*!40000 ALTER TABLE `lancamento_categorias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lista_complemento_deliveries`
--

DROP TABLE IF EXISTS `lista_complemento_deliveries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `lista_complemento_deliveries` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `produto_id` int unsigned NOT NULL,
  `complemento_id` int unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `lista_complemento_deliveries_produto_id_foreign` (`produto_id`),
  KEY `lista_complemento_deliveries_complemento_id_foreign` (`complemento_id`),
  CONSTRAINT `lista_complemento_deliveries_complemento_id_foreign` FOREIGN KEY (`complemento_id`) REFERENCES `complemento_deliveries` (`id`) ON DELETE CASCADE,
  CONSTRAINT `lista_complemento_deliveries_produto_id_foreign` FOREIGN KEY (`produto_id`) REFERENCES `produto_deliveries` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lista_complemento_deliveries`
--

LOCK TABLES `lista_complemento_deliveries` WRITE;
/*!40000 ALTER TABLE `lista_complemento_deliveries` DISABLE KEYS */;
/*!40000 ALTER TABLE `lista_complemento_deliveries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lista_precos`
--

DROP TABLE IF EXISTS `lista_precos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `lista_precos` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `nome` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `percentual_alteracao` decimal(4,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lista_precos`
--

LOCK TABLES `lista_precos` WRITE;
/*!40000 ALTER TABLE `lista_precos` DISABLE KEYS */;
/*!40000 ALTER TABLE `lista_precos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `manifesta_dves`
--

DROP TABLE IF EXISTS `manifesta_dves`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `manifesta_dves` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `chave` varchar(44) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nome` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `documento` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `valor` decimal(10,2) NOT NULL,
  `num_prot` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `data_emissao` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sequencia_evento` int NOT NULL,
  `fatura_salva` tinyint(1) NOT NULL,
  `tipo` int NOT NULL,
  `nsu` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `manifesta_dves`
--

LOCK TABLES `manifesta_dves` WRITE;
/*!40000 ALTER TABLE `manifesta_dves` DISABLE KEYS */;
/*!40000 ALTER TABLE `manifesta_dves` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdves`
--

DROP TABLE IF EXISTS `mdves`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mdves` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `uf_inicio` varchar(2) COLLATE utf8mb4_unicode_ci NOT NULL,
  `uf_fim` varchar(2) COLLATE utf8mb4_unicode_ci NOT NULL,
  `encerrado` tinyint(1) NOT NULL,
  `data_inicio_viagem` date NOT NULL,
  `carga_posterior` tinyint(1) NOT NULL,
  `cnpj_contratante` varchar(18) COLLATE utf8mb4_unicode_ci NOT NULL,
  `veiculo_tracao_id` int unsigned NOT NULL,
  `veiculo_reboque_id` int unsigned NOT NULL,
  `estado` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mdfe_numero` int NOT NULL,
  `chave` varchar(44) COLLATE utf8mb4_unicode_ci NOT NULL,
  `protocolo` varchar(16) COLLATE utf8mb4_unicode_ci NOT NULL,
  `seguradora_nome` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `seguradora_cnpj` varchar(18) COLLATE utf8mb4_unicode_ci NOT NULL,
  `numero_apolice` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `numero_averbacao` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `valor_carga` decimal(10,2) NOT NULL,
  `quantidade_carga` decimal(10,4) NOT NULL,
  `info_complementar` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `info_adicional_fisco` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `condutor_nome` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `condutor_cpf` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lac_rodo` varchar(8) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tp_emit` int NOT NULL,
  `tp_transp` int NOT NULL,
  `produto_pred_nome` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `produto_pred_ncm` varchar(8) COLLATE utf8mb4_unicode_ci NOT NULL,
  `produto_pred_cod_barras` varchar(13) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cep_carrega` varchar(9) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cep_descarrega` varchar(9) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tp_carga` varchar(2) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdves_veiculo_tracao_id_foreign` (`veiculo_tracao_id`),
  KEY `mdves_veiculo_reboque_id_foreign` (`veiculo_reboque_id`),
  CONSTRAINT `mdves_veiculo_reboque_id_foreign` FOREIGN KEY (`veiculo_reboque_id`) REFERENCES `veiculos` (`id`),
  CONSTRAINT `mdves_veiculo_tracao_id_foreign` FOREIGN KEY (`veiculo_tracao_id`) REFERENCES `veiculos` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdves`
--

LOCK TABLES `mdves` WRITE;
/*!40000 ALTER TABLE `mdves` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdves` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `medida_ctes`
--

DROP TABLE IF EXISTS `medida_ctes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `medida_ctes` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `cod_unidade` varchar(2) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tipo_medida` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `quantidade_carga` decimal(10,4) NOT NULL,
  `cte_id` int unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `medida_ctes_cte_id_foreign` (`cte_id`),
  CONSTRAINT `medida_ctes_cte_id_foreign` FOREIGN KEY (`cte_id`) REFERENCES `ctes` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `medida_ctes`
--

LOCK TABLES `medida_ctes` WRITE;
/*!40000 ALTER TABLE `medida_ctes` DISABLE KEYS */;
/*!40000 ALTER TABLE `medida_ctes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mercado_configs`
--

DROP TABLE IF EXISTS `mercado_configs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mercado_configs` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `funcionamento` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `descricao` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_de_produtos` int NOT NULL,
  `total_de_clientes` int NOT NULL,
  `total_de_funcionarios` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mercado_configs`
--

LOCK TABLES `mercado_configs` WRITE;
/*!40000 ALTER TABLE `mercado_configs` DISABLE KEYS */;
/*!40000 ALTER TABLE `mercado_configs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mesas`
--

DROP TABLE IF EXISTS `mesas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mesas` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `nome` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mesas`
--

LOCK TABLES `mesas` WRITE;
/*!40000 ALTER TABLE `mesas` DISABLE KEYS */;
/*!40000 ALTER TABLE `mesas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2129 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1996,'2014_10_12_000000_create_usuario_table',1),(1997,'2014_10_12_100000_create_password_resets_table',1),(1998,'2014_10_12_100000_create_tela_pedidos_table',1),(1999,'2019_01_13_074542_create_bairro_deliveries_table',1),(2000,'2019_01_14_173256_create_categoria_contas_table',1),(2001,'2019_02_05_224101_create_cidades_table',1),(2002,'2019_02_10_132730_create_categorias_table',1),(2003,'2019_02_10_170842_create_produtos_table',1),(2004,'2019_02_10_182200_create_clientes_table',1),(2005,'2019_02_11_003750_create_fornecedores_table',1),(2006,'2019_02_13_025957_create_ordem_servico_table',1),(2007,'2019_02_13_043706_create_compras_table',1),(2008,'2019_02_13_043951_create_item_compra_table',1),(2009,'2019_02_13_212540_create_estoque_table',1),(2010,'2019_03_07_124329_create_transportadoras_table',1),(2011,'2019_09_06_132659_create_natureza_operacaos_table',1),(2012,'2019_09_06_233629_create_fretes_table',1),(2013,'2019_09_07_000028_create_funcionarios_table',1),(2014,'2019_09_07_000243_create_contato_funcionarios_table',1),(2015,'2019_09_07_000401_create_vendas_table',1),(2016,'2019_09_07_000402_create_orcamentos_table',1),(2017,'2019_09_07_000602_create_item_vendas_table',1),(2018,'2019_09_07_000603_create_item_orcamentos_table',1),(2019,'2019_09_07_001421_create_categoria_servicos_table',1),(2020,'2019_09_07_001450_create_servicos_table',1),(2021,'2019_09_07_001649_create_servico_os_table',1),(2022,'2019_09_09_060514_create_relatorio_os_table',1),(2023,'2019_09_10_120640_create_funcionario_os_table',1),(2024,'2019_09_13_124343_create_conta_pagars_table',1),(2025,'2019_09_16_133536_create_receitas_table',1),(2026,'2019_09_16_134008_create_item_receitas_table',1),(2027,'2019_09_17_104549_create_apontamentos_table',1),(2028,'2019_09_18_120307_create_config_notas_table',1),(2029,'2019_09_20_072219_create_conta_recebers_table',1),(2030,'2019_09_20_190012_create_credito_vendas_table',1),(2031,'2019_09_25_221701_create_escritorio_contabils_table',1),(2032,'2019_09_27_201804_create_venda_caixas_table',1),(2033,'2019_09_27_201839_create_sangria_caixas_table',1),(2034,'2019_09_27_202513_create_abertura_caixas_table',1),(2035,'2019_10_08_020219_create_cotacaos_table',1),(2036,'2019_10_08_020521_create_item_cotacaos_table',1),(2037,'2019_11_18_142053_create_cliente_deliveries_table',1),(2038,'2019_11_18_173451_create_categoria_produto_deliveries_table',1),(2039,'2019_11_18_173545_create_endereco_deliveries_table',1),(2040,'2019_11_18_174144_create_delivery_configs_table',1),(2041,'2019_11_18_174210_create_tamanho_pizzas_table',1),(2042,'2019_11_18_174216_create_produto_deliveries_table',1),(2043,'2019_11_18_174216_create_produto_pizzas_table',1),(2044,'2019_11_18_174238_create_codigo_descontos_table',1),(2045,'2019_11_18_174240_create_pedido_deliveries_table',1),(2046,'2019_11_18_174253_create_item_pedido_deliveries_table',1),(2047,'2019_11_18_174254_create_item_pizza_pedidos_table',1),(2048,'2019_11_18_182024_create_imagens_produto_deliveries_table',1),(2049,'2019_11_18_182201_create_funcionamento_deliveries_table',1),(2050,'2019_11_24_081143_create_categoria_adicionals_table',1),(2051,'2019_11_25_114233_create_complemento_deliveries_table',1),(2052,'2019_11_25_115042_create_lista_complemento_deliveries_table',1),(2053,'2019_11_25_115947_create_item_pedido_complemento_deliveries_table',1),(2054,'2019_12_12_113546_create_veiculos_table',1),(2055,'2019_12_12_113547_create_ctes_table',1),(2056,'2019_12_12_113840_create_medida_ctes_table',1),(2057,'2019_12_14_232910_create_componente_ctes_table',1),(2058,'2019_12_19_184011_create_produto_favorito_deliveries_table',1),(2059,'2019_12_24_105307_create_tributacaos_table',1),(2060,'2019_12_27_081743_create_token_cliente_deliveries_table',1),(2061,'2020_01_03_003420_create_mesas_table',1),(2062,'2020_01_03_121157_create_certificados_table',1),(2063,'2020_01_04_003419_create_pushes_table',1),(2064,'2020_01_04_003420_create_pedidos_table',1),(2065,'2020_01_04_003421_create_item_pedidos_table',1),(2066,'2020_01_04_003422_create_item_venda_caixas_table',1),(2067,'2020_01_18_084439_create_item_pizza_pedido_locals_table',1),(2068,'2020_01_19_003305_create_item_pedido_complemento_locals_table',1),(2069,'2020_01_19_201036_create_categoria_despesa_ctes_table',1),(2070,'2020_01_19_201358_create_despesa_ctes_table',1),(2071,'2020_01_20_004105_create_receita_ctes_table',1),(2072,'2020_02_26_100343_create_token_webs_table',1),(2073,'2020_02_27_182503_create_devolucaos_table',1),(2074,'2020_02_27_182519_create_item_devolucaos_table',1),(2075,'2020_03_01_085359_create_mdves_table',1),(2076,'2020_03_02_205916_create_municipio_carregamentos_table',1),(2077,'2020_03_02_205937_create_percursos_table',1),(2078,'2020_03_03_080744_create_ciots_table',1),(2079,'2020_03_03_080847_create_vale_pedagios_table',1),(2080,'2020_03_03_081000_create_info_descargas_table',1),(2081,'2020_03_03_081214_create_n_fe_descargas_table',1),(2082,'2020_03_03_081236_create_c_te_descargas_table',1),(2083,'2020_03_03_081412_create_lacre_unidade_cargas_table',1),(2084,'2020_03_03_081444_create_unidade_cargas_table',1),(2085,'2020_03_03_081503_create_lacre_transportes_table',1),(2086,'2020_05_16_002118_create_manifesta_dves_table',1),(2087,'2020_05_29_164157_create_pedido_pag_seguros_table',1),(2088,'2020_06_18_133755_create_pedido_deletes_table',1),(2089,'2020_06_23_095357_create_pack_produto_deliveries_table',1),(2090,'2020_06_23_095512_create_item_pack_produto_deliveries_table',1),(2091,'2020_06_24_093940_create_mercado_configs_table',1),(2092,'2020_06_24_095935_create_banner_mais_vendidos_table',1),(2093,'2020_06_24_095959_create_banner_topos_table',1),(2094,'2020_07_06_155337_create_fatura_orcamentos_table',1),(2095,'2020_08_05_073712_create_lista_precos_table',1),(2096,'2020_08_05_074304_create_produto_lista_precos_table',1),(2097,'2020_08_19_094151_create_alteracao_estoques_table',1),(2098,'2020_09_09_084728_create_pedido_qr_code_clientes_table',1),(2099,'2020_09_09_103043_create_item_dves_table',1),(2100,'2020_11_16_155356_create_empresas_table',1),(2101,'2020_11_22_171953_create_motoboys_table',1),(2102,'2020_11_22_172042_create_pedido_motoboys_table',1),(2103,'2020_11_24_081612_create_comissao_vendas_table',1),(2104,'2020_11_26_081725_create_suprimento_caixas_table',1),(2105,'2021_01_24_132506_create_agendamentos_table',1),(2106,'2021_01_24_133704_create_item_agendamentos_table',1),(2107,'2021_07_12_093843_create_dres_table',1),(2108,'2021_07_12_094001_create_dre_categorias_table',1),(2109,'2021_07_12_094014_create_lancamento_categorias_table',1),(2110,'2021_07_12_094135_create_i_b_p_t_s_table',1),(2111,'2021_07_12_094201_create_item_i_b_t_e_s_table',1),(2112,'2021_07_19_124531_create_config_ecommerces_table',1),(2113,'2021_07_19_124550_create_categoria_produto_ecommerces_table',1),(2114,'2021_07_19_124631_create_produto_ecommerces_table',1),(2115,'2021_07_19_124649_create_imagem_produto_ecommerces_table',1),(2116,'2021_07_19_124703_create_carrossel_ecommerces_table',1),(2117,'2021_07_19_124719_create_autor_post_blog_ecommerces_table',1),(2118,'2021_07_19_124735_create_categoria_post_blog_ecommerces_table',1),(2119,'2021_07_19_124749_create_post_blog_ecommerces_table',1),(2120,'2021_07_19_124802_create_contato_ecommerces_table',1),(2121,'2021_07_19_124909_create_informativo_ecommerces_table',1),(2122,'2021_07_19_124928_create_cliente_ecommerces_table',1),(2123,'2021_07_19_124941_create_endereco_ecommerces_table',1),(2124,'2021_07_19_124952_create_pedido_ecommerces_table',1),(2125,'2021_07_19_125005_create_item_pedido_ecommerces_table',1),(2126,'2021_07_19_125033_create_curtida_produto_ecommerces_table',1),(2127,'2021_08_12_074523_create_config_caixas_table',1),(2128,'2021_10_31_113153_create_divisao_grades_table',1);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `motoboys`
--

DROP TABLE IF EXISTS `motoboys`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `motoboys` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `nome` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `telefone1` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `telefone2` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `telefone3` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cpf` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `rg` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `endereco` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tipo_transporte` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `motoboys`
--

LOCK TABLES `motoboys` WRITE;
/*!40000 ALTER TABLE `motoboys` DISABLE KEYS */;
/*!40000 ALTER TABLE `motoboys` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `municipio_carregamentos`
--

DROP TABLE IF EXISTS `municipio_carregamentos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `municipio_carregamentos` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `mdfe_id` int unsigned NOT NULL,
  `cidade_id` int unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `municipio_carregamentos_mdfe_id_foreign` (`mdfe_id`),
  KEY `municipio_carregamentos_cidade_id_foreign` (`cidade_id`),
  CONSTRAINT `municipio_carregamentos_cidade_id_foreign` FOREIGN KEY (`cidade_id`) REFERENCES `cidades` (`id`) ON DELETE CASCADE,
  CONSTRAINT `municipio_carregamentos_mdfe_id_foreign` FOREIGN KEY (`mdfe_id`) REFERENCES `mdves` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `municipio_carregamentos`
--

LOCK TABLES `municipio_carregamentos` WRITE;
/*!40000 ALTER TABLE `municipio_carregamentos` DISABLE KEYS */;
/*!40000 ALTER TABLE `municipio_carregamentos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `n_fe_descargas`
--

DROP TABLE IF EXISTS `n_fe_descargas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `n_fe_descargas` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `info_id` int unsigned NOT NULL,
  `chave` varchar(44) COLLATE utf8mb4_unicode_ci NOT NULL,
  `seg_cod_barras` varchar(35) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `n_fe_descargas_info_id_foreign` (`info_id`),
  CONSTRAINT `n_fe_descargas_info_id_foreign` FOREIGN KEY (`info_id`) REFERENCES `info_descargas` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `n_fe_descargas`
--

LOCK TABLES `n_fe_descargas` WRITE;
/*!40000 ALTER TABLE `n_fe_descargas` DISABLE KEYS */;
/*!40000 ALTER TABLE `n_fe_descargas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `natureza_operacaos`
--

DROP TABLE IF EXISTS `natureza_operacaos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `natureza_operacaos` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `natureza` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL,
  `CFOP_entrada_estadual` varchar(5) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `CFOP_entrada_inter_estadual` varchar(5) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `CFOP_saida_estadual` varchar(5) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `CFOP_saida_inter_estadual` varchar(5) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `natureza_operacaos`
--

LOCK TABLES `natureza_operacaos` WRITE;
/*!40000 ALTER TABLE `natureza_operacaos` DISABLE KEYS */;
/*!40000 ALTER TABLE `natureza_operacaos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orcamentos`
--

DROP TABLE IF EXISTS `orcamentos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orcamentos` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `cliente_id` int unsigned NOT NULL,
  `usuario_id` int unsigned NOT NULL,
  `natureza_id` int unsigned DEFAULT NULL,
  `frete_id` int unsigned DEFAULT NULL,
  `transportadora_id` int unsigned DEFAULT NULL,
  `valor_total` decimal(10,2) NOT NULL,
  `desconto` decimal(10,2) NOT NULL,
  `forma_pagamento` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tipo_pagamento` varchar(2) COLLATE utf8mb4_unicode_ci NOT NULL,
  `observacao` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `estado` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_enviado` tinyint(1) NOT NULL,
  `validade` date NOT NULL,
  `venda_id` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `orcamentos_cliente_id_foreign` (`cliente_id`),
  KEY `orcamentos_usuario_id_foreign` (`usuario_id`),
  KEY `orcamentos_natureza_id_foreign` (`natureza_id`),
  KEY `orcamentos_frete_id_foreign` (`frete_id`),
  KEY `orcamentos_transportadora_id_foreign` (`transportadora_id`),
  CONSTRAINT `orcamentos_cliente_id_foreign` FOREIGN KEY (`cliente_id`) REFERENCES `clientes` (`id`),
  CONSTRAINT `orcamentos_frete_id_foreign` FOREIGN KEY (`frete_id`) REFERENCES `fretes` (`id`) ON DELETE CASCADE,
  CONSTRAINT `orcamentos_natureza_id_foreign` FOREIGN KEY (`natureza_id`) REFERENCES `natureza_operacaos` (`id`),
  CONSTRAINT `orcamentos_transportadora_id_foreign` FOREIGN KEY (`transportadora_id`) REFERENCES `transportadoras` (`id`) ON DELETE CASCADE,
  CONSTRAINT `orcamentos_usuario_id_foreign` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orcamentos`
--

LOCK TABLES `orcamentos` WRITE;
/*!40000 ALTER TABLE `orcamentos` DISABLE KEYS */;
/*!40000 ALTER TABLE `orcamentos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ordem_servicos`
--

DROP TABLE IF EXISTS `ordem_servicos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ordem_servicos` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `cliente_id` int unsigned NOT NULL,
  `usuario_id` int unsigned NOT NULL,
  `estado` varchar(2) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pd',
  `descricao` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `forma_pagamento` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'av',
  `valor` decimal(10,2) NOT NULL DEFAULT '0.00',
  `desconto` decimal(10,2) NOT NULL DEFAULT '0.00',
  `data_registro` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `data_prevista_finalizacao` date NOT NULL DEFAULT '1981-01-01',
  `NfNumero` int NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ordem_servicos_cliente_id_foreign` (`cliente_id`),
  KEY `ordem_servicos_usuario_id_foreign` (`usuario_id`),
  CONSTRAINT `ordem_servicos_cliente_id_foreign` FOREIGN KEY (`cliente_id`) REFERENCES `clientes` (`id`) ON DELETE CASCADE,
  CONSTRAINT `ordem_servicos_usuario_id_foreign` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ordem_servicos`
--

LOCK TABLES `ordem_servicos` WRITE;
/*!40000 ALTER TABLE `ordem_servicos` DISABLE KEYS */;
/*!40000 ALTER TABLE `ordem_servicos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pack_produto_deliveries`
--

DROP TABLE IF EXISTS `pack_produto_deliveries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pack_produto_deliveries` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `nome` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `descricao` varchar(300) COLLATE utf8mb4_unicode_ci NOT NULL,
  `valor` decimal(10,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pack_produto_deliveries`
--

LOCK TABLES `pack_produto_deliveries` WRITE;
/*!40000 ALTER TABLE `pack_produto_deliveries` DISABLE KEYS */;
/*!40000 ALTER TABLE `pack_produto_deliveries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_resets`
--

LOCK TABLES `password_resets` WRITE;
/*!40000 ALTER TABLE `password_resets` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_resets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pedido_deletes`
--

DROP TABLE IF EXISTS `pedido_deletes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pedido_deletes` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `produto` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `pedido_id` int NOT NULL,
  `valor` decimal(10,2) NOT NULL,
  `data_insercao` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `quantidade` decimal(10,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pedido_deletes`
--

LOCK TABLES `pedido_deletes` WRITE;
/*!40000 ALTER TABLE `pedido_deletes` DISABLE KEYS */;
/*!40000 ALTER TABLE `pedido_deletes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pedido_deliveries`
--

DROP TABLE IF EXISTS `pedido_deliveries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pedido_deliveries` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `cliente_id` int unsigned NOT NULL,
  `data_registro` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `valor_total` decimal(10,2) NOT NULL,
  `troco_para` decimal(10,2) NOT NULL,
  `forma_pagamento` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `observacao` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `telefone` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `estado` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `motivoEstado` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `endereco_id` int unsigned DEFAULT NULL,
  `cupom_id` int unsigned DEFAULT NULL,
  `desconto` decimal(10,2) NOT NULL,
  `app` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `pedido_deliveries_cliente_id_foreign` (`cliente_id`),
  KEY `pedido_deliveries_endereco_id_foreign` (`endereco_id`),
  KEY `pedido_deliveries_cupom_id_foreign` (`cupom_id`),
  CONSTRAINT `pedido_deliveries_cliente_id_foreign` FOREIGN KEY (`cliente_id`) REFERENCES `cliente_deliveries` (`id`) ON DELETE CASCADE,
  CONSTRAINT `pedido_deliveries_cupom_id_foreign` FOREIGN KEY (`cupom_id`) REFERENCES `codigo_descontos` (`id`) ON DELETE CASCADE,
  CONSTRAINT `pedido_deliveries_endereco_id_foreign` FOREIGN KEY (`endereco_id`) REFERENCES `endereco_deliveries` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pedido_deliveries`
--

LOCK TABLES `pedido_deliveries` WRITE;
/*!40000 ALTER TABLE `pedido_deliveries` DISABLE KEYS */;
/*!40000 ALTER TABLE `pedido_deliveries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pedido_ecommerces`
--

DROP TABLE IF EXISTS `pedido_ecommerces`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pedido_ecommerces` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `cliente_id` int unsigned DEFAULT NULL,
  `endereco_id` int unsigned DEFAULT NULL,
  `status` int NOT NULL,
  `status_preparacao` int NOT NULL,
  `codigo_rastreio` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `valor_total` decimal(10,2) NOT NULL,
  `valor_frete` decimal(10,2) NOT NULL,
  `tipo_frete` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `venda_id` int NOT NULL DEFAULT '0',
  `numero_nfe` int NOT NULL DEFAULT '0',
  `observacao` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `rand_pedido` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `link_boleto` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `qr_code_base64` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `qr_code` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `transacao_id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `forma_pagamento` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `status_pagamento` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `status_detalhe` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `hash` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `pedido_ecommerces_cliente_id_foreign` (`cliente_id`),
  KEY `pedido_ecommerces_endereco_id_foreign` (`endereco_id`),
  CONSTRAINT `pedido_ecommerces_cliente_id_foreign` FOREIGN KEY (`cliente_id`) REFERENCES `cliente_ecommerces` (`id`) ON DELETE CASCADE,
  CONSTRAINT `pedido_ecommerces_endereco_id_foreign` FOREIGN KEY (`endereco_id`) REFERENCES `endereco_ecommerces` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pedido_ecommerces`
--

LOCK TABLES `pedido_ecommerces` WRITE;
/*!40000 ALTER TABLE `pedido_ecommerces` DISABLE KEYS */;
/*!40000 ALTER TABLE `pedido_ecommerces` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pedido_motoboys`
--

DROP TABLE IF EXISTS `pedido_motoboys`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pedido_motoboys` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `motoboy_id` int unsigned DEFAULT NULL,
  `pedido_id` int unsigned DEFAULT NULL,
  `valor` decimal(7,2) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `observacao` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `pedido_motoboys_motoboy_id_foreign` (`motoboy_id`),
  KEY `pedido_motoboys_pedido_id_foreign` (`pedido_id`),
  CONSTRAINT `pedido_motoboys_motoboy_id_foreign` FOREIGN KEY (`motoboy_id`) REFERENCES `motoboys` (`id`) ON DELETE CASCADE,
  CONSTRAINT `pedido_motoboys_pedido_id_foreign` FOREIGN KEY (`pedido_id`) REFERENCES `pedido_deliveries` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pedido_motoboys`
--

LOCK TABLES `pedido_motoboys` WRITE;
/*!40000 ALTER TABLE `pedido_motoboys` DISABLE KEYS */;
/*!40000 ALTER TABLE `pedido_motoboys` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pedido_pag_seguros`
--

DROP TABLE IF EXISTS `pedido_pag_seguros`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pedido_pag_seguros` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `pedido_delivery_id` int unsigned NOT NULL,
  `numero_cartao` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cpf` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nome_impresso` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL,
  `codigo_transacao` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `referencia` varchar(35) COLLATE utf8mb4_unicode_ci NOT NULL,
  `bandeira` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `parcelas` int NOT NULL,
  `status` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `pedido_pag_seguros_pedido_delivery_id_foreign` (`pedido_delivery_id`),
  CONSTRAINT `pedido_pag_seguros_pedido_delivery_id_foreign` FOREIGN KEY (`pedido_delivery_id`) REFERENCES `pedido_deliveries` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pedido_pag_seguros`
--

LOCK TABLES `pedido_pag_seguros` WRITE;
/*!40000 ALTER TABLE `pedido_pag_seguros` DISABLE KEYS */;
/*!40000 ALTER TABLE `pedido_pag_seguros` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pedido_qr_code_clientes`
--

DROP TABLE IF EXISTS `pedido_qr_code_clientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pedido_qr_code_clientes` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `pedido_id` int unsigned DEFAULT NULL,
  `hash` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `pedido_qr_code_clientes_pedido_id_foreign` (`pedido_id`),
  CONSTRAINT `pedido_qr_code_clientes_pedido_id_foreign` FOREIGN KEY (`pedido_id`) REFERENCES `pedidos` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pedido_qr_code_clientes`
--

LOCK TABLES `pedido_qr_code_clientes` WRITE;
/*!40000 ALTER TABLE `pedido_qr_code_clientes` DISABLE KEYS */;
/*!40000 ALTER TABLE `pedido_qr_code_clientes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pedidos`
--

DROP TABLE IF EXISTS `pedidos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pedidos` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `comanda` varchar(12) COLLATE utf8mb4_unicode_ci NOT NULL,
  `observacao` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL,
  `mesa_id` int unsigned DEFAULT NULL,
  `bairro_id` int unsigned DEFAULT NULL,
  `nome` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `rua` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `numero` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `referencia` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `telefone` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `desativado` tinyint(1) NOT NULL,
  `referencia_cliete` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `mesa_ativa` tinyint(1) NOT NULL DEFAULT '1',
  `fechar_mesa` tinyint(1) NOT NULL DEFAULT '0',
  `data_registro` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `imprimir` tinyint(1) NOT NULL DEFAULT '0',
  `finalizado_atendimeto` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `pedidos_mesa_id_foreign` (`mesa_id`),
  KEY `pedidos_bairro_id_foreign` (`bairro_id`),
  CONSTRAINT `pedidos_bairro_id_foreign` FOREIGN KEY (`bairro_id`) REFERENCES `bairro_deliveries` (`id`),
  CONSTRAINT `pedidos_mesa_id_foreign` FOREIGN KEY (`mesa_id`) REFERENCES `mesas` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pedidos`
--

LOCK TABLES `pedidos` WRITE;
/*!40000 ALTER TABLE `pedidos` DISABLE KEYS */;
/*!40000 ALTER TABLE `pedidos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `percursos`
--

DROP TABLE IF EXISTS `percursos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `percursos` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `mdfe_id` int unsigned NOT NULL,
  `uf` varchar(2) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `percursos_mdfe_id_foreign` (`mdfe_id`),
  CONSTRAINT `percursos_mdfe_id_foreign` FOREIGN KEY (`mdfe_id`) REFERENCES `mdves` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `percursos`
--

LOCK TABLES `percursos` WRITE;
/*!40000 ALTER TABLE `percursos` DISABLE KEYS */;
/*!40000 ALTER TABLE `percursos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `post_blog_ecommerces`
--

DROP TABLE IF EXISTS `post_blog_ecommerces`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `post_blog_ecommerces` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `titulo` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `img` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tags` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `texto` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `categoria_id` int unsigned NOT NULL,
  `autor_id` int unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `post_blog_ecommerces_categoria_id_foreign` (`categoria_id`),
  KEY `post_blog_ecommerces_autor_id_foreign` (`autor_id`),
  CONSTRAINT `post_blog_ecommerces_autor_id_foreign` FOREIGN KEY (`autor_id`) REFERENCES `autor_post_blog_ecommerces` (`id`) ON DELETE CASCADE,
  CONSTRAINT `post_blog_ecommerces_categoria_id_foreign` FOREIGN KEY (`categoria_id`) REFERENCES `categoria_post_blog_ecommerces` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `post_blog_ecommerces`
--

LOCK TABLES `post_blog_ecommerces` WRITE;
/*!40000 ALTER TABLE `post_blog_ecommerces` DISABLE KEYS */;
/*!40000 ALTER TABLE `post_blog_ecommerces` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `produto_deliveries`
--

DROP TABLE IF EXISTS `produto_deliveries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `produto_deliveries` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `produto_id` int unsigned NOT NULL,
  `categoria_id` int unsigned NOT NULL,
  `descricao` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ingredientes` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `valor` decimal(10,2) NOT NULL,
  `valor_anterior` decimal(10,2) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `auto_atendimento` tinyint(1) NOT NULL DEFAULT '0',
  `destaque` tinyint(1) NOT NULL,
  `limite_diario` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `produto_deliveries_produto_id_foreign` (`produto_id`),
  KEY `produto_deliveries_categoria_id_foreign` (`categoria_id`),
  CONSTRAINT `produto_deliveries_categoria_id_foreign` FOREIGN KEY (`categoria_id`) REFERENCES `categoria_produto_deliveries` (`id`) ON DELETE CASCADE,
  CONSTRAINT `produto_deliveries_produto_id_foreign` FOREIGN KEY (`produto_id`) REFERENCES `produtos` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produto_deliveries`
--

LOCK TABLES `produto_deliveries` WRITE;
/*!40000 ALTER TABLE `produto_deliveries` DISABLE KEYS */;
/*!40000 ALTER TABLE `produto_deliveries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `produto_ecommerces`
--

DROP TABLE IF EXISTS `produto_ecommerces`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `produto_ecommerces` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `produto_id` int unsigned NOT NULL,
  `categoria_id` int unsigned NOT NULL,
  `descricao` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `controlar_estoque` tinyint(1) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `destaque` tinyint(1) NOT NULL,
  `cep` varchar(9) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `valor` decimal(10,2) NOT NULL,
  `percentual_desconto_view` int NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `produto_ecommerces_produto_id_foreign` (`produto_id`),
  KEY `produto_ecommerces_categoria_id_foreign` (`categoria_id`),
  CONSTRAINT `produto_ecommerces_categoria_id_foreign` FOREIGN KEY (`categoria_id`) REFERENCES `categoria_produto_ecommerces` (`id`) ON DELETE CASCADE,
  CONSTRAINT `produto_ecommerces_produto_id_foreign` FOREIGN KEY (`produto_id`) REFERENCES `produtos` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produto_ecommerces`
--

LOCK TABLES `produto_ecommerces` WRITE;
/*!40000 ALTER TABLE `produto_ecommerces` DISABLE KEYS */;
/*!40000 ALTER TABLE `produto_ecommerces` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `produto_favorito_deliveries`
--

DROP TABLE IF EXISTS `produto_favorito_deliveries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `produto_favorito_deliveries` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `produto_id` int unsigned NOT NULL,
  `cliente_id` int unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `produto_favorito_deliveries_produto_id_foreign` (`produto_id`),
  KEY `produto_favorito_deliveries_cliente_id_foreign` (`cliente_id`),
  CONSTRAINT `produto_favorito_deliveries_cliente_id_foreign` FOREIGN KEY (`cliente_id`) REFERENCES `cliente_deliveries` (`id`) ON DELETE CASCADE,
  CONSTRAINT `produto_favorito_deliveries_produto_id_foreign` FOREIGN KEY (`produto_id`) REFERENCES `produto_deliveries` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produto_favorito_deliveries`
--

LOCK TABLES `produto_favorito_deliveries` WRITE;
/*!40000 ALTER TABLE `produto_favorito_deliveries` DISABLE KEYS */;
/*!40000 ALTER TABLE `produto_favorito_deliveries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `produto_lista_precos`
--

DROP TABLE IF EXISTS `produto_lista_precos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `produto_lista_precos` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `lista_id` int unsigned NOT NULL,
  `produto_id` int unsigned NOT NULL,
  `valor` decimal(10,2) NOT NULL,
  `percentual_lucro` decimal(10,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `produto_lista_precos_lista_id_foreign` (`lista_id`),
  KEY `produto_lista_precos_produto_id_foreign` (`produto_id`),
  CONSTRAINT `produto_lista_precos_lista_id_foreign` FOREIGN KEY (`lista_id`) REFERENCES `lista_precos` (`id`) ON DELETE CASCADE,
  CONSTRAINT `produto_lista_precos_produto_id_foreign` FOREIGN KEY (`produto_id`) REFERENCES `produtos` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produto_lista_precos`
--

LOCK TABLES `produto_lista_precos` WRITE;
/*!40000 ALTER TABLE `produto_lista_precos` DISABLE KEYS */;
/*!40000 ALTER TABLE `produto_lista_precos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `produto_pizzas`
--

DROP TABLE IF EXISTS `produto_pizzas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `produto_pizzas` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `produto_id` int unsigned DEFAULT NULL,
  `tamanho_id` int unsigned DEFAULT NULL,
  `valor` decimal(10,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `produto_pizzas_produto_id_foreign` (`produto_id`),
  KEY `produto_pizzas_tamanho_id_foreign` (`tamanho_id`),
  CONSTRAINT `produto_pizzas_produto_id_foreign` FOREIGN KEY (`produto_id`) REFERENCES `produto_deliveries` (`id`) ON DELETE CASCADE,
  CONSTRAINT `produto_pizzas_tamanho_id_foreign` FOREIGN KEY (`tamanho_id`) REFERENCES `tamanho_pizzas` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produto_pizzas`
--

LOCK TABLES `produto_pizzas` WRITE;
/*!40000 ALTER TABLE `produto_pizzas` DISABLE KEYS */;
/*!40000 ALTER TABLE `produto_pizzas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `produtos`
--

DROP TABLE IF EXISTS `produtos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `produtos` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cor` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `categoria_id` int unsigned NOT NULL,
  `valor_venda` decimal(10,2) NOT NULL DEFAULT '0.00',
  `valor_compra` decimal(10,2) NOT NULL DEFAULT '0.00',
  `NCM` varchar(13) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `codBarras` varchar(13) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `CEST` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `CST_CSOSN` varchar(3) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `CST_PIS` varchar(3) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `CST_COFINS` varchar(3) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `CST_IPI` varchar(3) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `unidade_compra` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `conversao_unitaria` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1',
  `unidade_venda` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `composto` tinyint(1) NOT NULL DEFAULT '0',
  `valor_livre` tinyint(1) NOT NULL,
  `perc_icms` decimal(10,2) NOT NULL DEFAULT '0.00',
  `perc_pis` decimal(10,2) NOT NULL DEFAULT '0.00',
  `perc_cofins` decimal(10,2) NOT NULL DEFAULT '0.00',
  `perc_ipi` decimal(10,2) NOT NULL DEFAULT '0.00',
  `perc_iss` decimal(10,2) NOT NULL DEFAULT '0.00',
  `pRedBC` decimal(5,2) NOT NULL DEFAULT '0.00',
  `cBenef` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `cListServ` varchar(5) COLLATE utf8mb4_unicode_ci NOT NULL,
  `CFOP_saida_estadual` varchar(5) COLLATE utf8mb4_unicode_ci NOT NULL,
  `CFOP_saida_inter_estadual` varchar(5) COLLATE utf8mb4_unicode_ci NOT NULL,
  `codigo_anp` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `descricao_anp` varchar(95) COLLATE utf8mb4_unicode_ci NOT NULL,
  `perc_glp` decimal(5,2) NOT NULL DEFAULT '0.00',
  `perc_gnn` decimal(5,2) NOT NULL DEFAULT '0.00',
  `perc_gni` decimal(5,2) NOT NULL DEFAULT '0.00',
  `valor_partida` decimal(10,2) NOT NULL DEFAULT '0.00',
  `unidade_tributavel` varchar(4) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `quantidade_tributavel` decimal(10,2) NOT NULL DEFAULT '0.00',
  `imagem` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `alerta_vencimento` int NOT NULL,
  `gerenciar_estoque` tinyint(1) NOT NULL,
  `estoque_minimo` int NOT NULL DEFAULT '0',
  `referencia` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `referencia_balanca` int NOT NULL DEFAULT '0',
  `tela_id` int unsigned DEFAULT NULL,
  `largura` decimal(6,2) NOT NULL DEFAULT '0.00',
  `comprimento` decimal(6,2) NOT NULL DEFAULT '0.00',
  `altura` decimal(6,2) NOT NULL DEFAULT '0.00',
  `peso_liquido` decimal(8,3) NOT NULL DEFAULT '0.000',
  `peso_bruto` decimal(8,3) NOT NULL DEFAULT '0.000',
  `referencia_grade` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `grade` tinyint(1) NOT NULL DEFAULT '0',
  `str_grade` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `passageiros` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `cor_veiculo` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `chassi` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `combustivel` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `numero_motor` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `ano` varchar(2) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `modelo` varchar(2) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `perc_icms_interestadual` decimal(10,2) NOT NULL DEFAULT '0.00',
  `perc_icms_interno` decimal(10,2) NOT NULL DEFAULT '0.00',
  `perc_fcp_interestadual` decimal(10,2) NOT NULL DEFAULT '0.00',
  `origem` int NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `produtos_categoria_id_foreign` (`categoria_id`),
  KEY `produtos_tela_id_foreign` (`tela_id`),
  CONSTRAINT `produtos_categoria_id_foreign` FOREIGN KEY (`categoria_id`) REFERENCES `categorias` (`id`) ON DELETE CASCADE,
  CONSTRAINT `produtos_tela_id_foreign` FOREIGN KEY (`tela_id`) REFERENCES `tela_pedidos` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produtos`
--

LOCK TABLES `produtos` WRITE;
/*!40000 ALTER TABLE `produtos` DISABLE KEYS */;
/*!40000 ALTER TABLE `produtos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pushes`
--

DROP TABLE IF EXISTS `pushes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pushes` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `cliente_id` int unsigned DEFAULT NULL,
  `titulo` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `texto` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `path_img` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `referencia_produto` int NOT NULL,
  `data_registro` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `status` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `pushes_cliente_id_foreign` (`cliente_id`),
  CONSTRAINT `pushes_cliente_id_foreign` FOREIGN KEY (`cliente_id`) REFERENCES `cliente_deliveries` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pushes`
--

LOCK TABLES `pushes` WRITE;
/*!40000 ALTER TABLE `pushes` DISABLE KEYS */;
/*!40000 ALTER TABLE `pushes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `receita_ctes`
--

DROP TABLE IF EXISTS `receita_ctes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `receita_ctes` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `cte_id` int unsigned NOT NULL,
  `valor` decimal(10,2) NOT NULL,
  `descricao` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `data_registro` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `receita_ctes_cte_id_foreign` (`cte_id`),
  CONSTRAINT `receita_ctes_cte_id_foreign` FOREIGN KEY (`cte_id`) REFERENCES `ctes` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `receita_ctes`
--

LOCK TABLES `receita_ctes` WRITE;
/*!40000 ALTER TABLE `receita_ctes` DISABLE KEYS */;
/*!40000 ALTER TABLE `receita_ctes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `receitas`
--

DROP TABLE IF EXISTS `receitas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `receitas` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `produto_id` int unsigned DEFAULT NULL,
  `descricao` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `rendimento` double(8,2) NOT NULL,
  `valor_custo` decimal(10,2) NOT NULL,
  `tempo_preparo` int NOT NULL,
  `pizza` tinyint(1) NOT NULL,
  `pedacos` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `receitas_produto_id_foreign` (`produto_id`),
  CONSTRAINT `receitas_produto_id_foreign` FOREIGN KEY (`produto_id`) REFERENCES `produtos` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `receitas`
--

LOCK TABLES `receitas` WRITE;
/*!40000 ALTER TABLE `receitas` DISABLE KEYS */;
/*!40000 ALTER TABLE `receitas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `relatorio_os`
--

DROP TABLE IF EXISTS `relatorio_os`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `relatorio_os` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `usuario_id` int unsigned NOT NULL,
  `ordem_servico_id` int unsigned NOT NULL,
  `texto` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `data_registro` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `relatorio_os_usuario_id_foreign` (`usuario_id`),
  KEY `relatorio_os_ordem_servico_id_foreign` (`ordem_servico_id`),
  CONSTRAINT `relatorio_os_ordem_servico_id_foreign` FOREIGN KEY (`ordem_servico_id`) REFERENCES `ordem_servicos` (`id`),
  CONSTRAINT `relatorio_os_usuario_id_foreign` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `relatorio_os`
--

LOCK TABLES `relatorio_os` WRITE;
/*!40000 ALTER TABLE `relatorio_os` DISABLE KEYS */;
/*!40000 ALTER TABLE `relatorio_os` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sangria_caixas`
--

DROP TABLE IF EXISTS `sangria_caixas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sangria_caixas` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `usuario_id` int unsigned NOT NULL,
  `data_registro` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `valor` decimal(10,2) NOT NULL,
  `observacao` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `sangria_caixas_usuario_id_foreign` (`usuario_id`),
  CONSTRAINT `sangria_caixas_usuario_id_foreign` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sangria_caixas`
--

LOCK TABLES `sangria_caixas` WRITE;
/*!40000 ALTER TABLE `sangria_caixas` DISABLE KEYS */;
/*!40000 ALTER TABLE `sangria_caixas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `servico_os`
--

DROP TABLE IF EXISTS `servico_os`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `servico_os` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `servico_id` int unsigned NOT NULL,
  `ordem_servico_id` int unsigned NOT NULL,
  `quantidade` int NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `servico_os_servico_id_foreign` (`servico_id`),
  KEY `servico_os_ordem_servico_id_foreign` (`ordem_servico_id`),
  CONSTRAINT `servico_os_ordem_servico_id_foreign` FOREIGN KEY (`ordem_servico_id`) REFERENCES `ordem_servicos` (`id`),
  CONSTRAINT `servico_os_servico_id_foreign` FOREIGN KEY (`servico_id`) REFERENCES `servicos` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `servico_os`
--

LOCK TABLES `servico_os` WRITE;
/*!40000 ALTER TABLE `servico_os` DISABLE KEYS */;
/*!40000 ALTER TABLE `servico_os` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `servicos`
--

DROP TABLE IF EXISTS `servicos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `servicos` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `nome` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `valor` decimal(10,2) NOT NULL,
  `unidade_cobranca` varchar(5) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tempo_servico` int NOT NULL,
  `comissao` decimal(6,2) NOT NULL DEFAULT '0.00',
  `categoria_id` int unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `servicos_categoria_id_foreign` (`categoria_id`),
  CONSTRAINT `servicos_categoria_id_foreign` FOREIGN KEY (`categoria_id`) REFERENCES `categoria_servicos` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `servicos`
--

LOCK TABLES `servicos` WRITE;
/*!40000 ALTER TABLE `servicos` DISABLE KEYS */;
/*!40000 ALTER TABLE `servicos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `suprimento_caixas`
--

DROP TABLE IF EXISTS `suprimento_caixas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `suprimento_caixas` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `usuario_id` int unsigned NOT NULL,
  `observacao` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `valor` decimal(10,2) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `suprimento_caixas_usuario_id_foreign` (`usuario_id`),
  CONSTRAINT `suprimento_caixas_usuario_id_foreign` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `suprimento_caixas`
--

LOCK TABLES `suprimento_caixas` WRITE;
/*!40000 ALTER TABLE `suprimento_caixas` DISABLE KEYS */;
/*!40000 ALTER TABLE `suprimento_caixas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tamanho_pizzas`
--

DROP TABLE IF EXISTS `tamanho_pizzas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tamanho_pizzas` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `nome` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `pedacos` int NOT NULL,
  `maximo_sabores` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tamanho_pizzas`
--

LOCK TABLES `tamanho_pizzas` WRITE;
/*!40000 ALTER TABLE `tamanho_pizzas` DISABLE KEYS */;
/*!40000 ALTER TABLE `tamanho_pizzas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tela_pedidos`
--

DROP TABLE IF EXISTS `tela_pedidos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tela_pedidos` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `nome` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `alerta_amarelo` int NOT NULL DEFAULT '0',
  `alerta_vermelho` int NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tela_pedidos`
--

LOCK TABLES `tela_pedidos` WRITE;
/*!40000 ALTER TABLE `tela_pedidos` DISABLE KEYS */;
/*!40000 ALTER TABLE `tela_pedidos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `token_cliente_deliveries`
--

DROP TABLE IF EXISTS `token_cliente_deliveries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `token_cliente_deliveries` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `token` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cliente_id` int unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `token_cliente_deliveries_cliente_id_foreign` (`cliente_id`),
  CONSTRAINT `token_cliente_deliveries_cliente_id_foreign` FOREIGN KEY (`cliente_id`) REFERENCES `cliente_deliveries` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `token_cliente_deliveries`
--

LOCK TABLES `token_cliente_deliveries` WRITE;
/*!40000 ALTER TABLE `token_cliente_deliveries` DISABLE KEYS */;
/*!40000 ALTER TABLE `token_cliente_deliveries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `token_webs`
--

DROP TABLE IF EXISTS `token_webs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `token_webs` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `token` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cliente_id` int unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `token_webs_cliente_id_foreign` (`cliente_id`),
  CONSTRAINT `token_webs_cliente_id_foreign` FOREIGN KEY (`cliente_id`) REFERENCES `cliente_deliveries` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `token_webs`
--

LOCK TABLES `token_webs` WRITE;
/*!40000 ALTER TABLE `token_webs` DISABLE KEYS */;
/*!40000 ALTER TABLE `token_webs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transportadoras`
--

DROP TABLE IF EXISTS `transportadoras`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `transportadoras` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `razao_social` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cnpj_cpf` varchar(19) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '000.000.000-00',
  `logradouro` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cidade_id` int unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `transportadoras_cidade_id_foreign` (`cidade_id`),
  CONSTRAINT `transportadoras_cidade_id_foreign` FOREIGN KEY (`cidade_id`) REFERENCES `cidades` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transportadoras`
--

LOCK TABLES `transportadoras` WRITE;
/*!40000 ALTER TABLE `transportadoras` DISABLE KEYS */;
/*!40000 ALTER TABLE `transportadoras` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tributacaos`
--

DROP TABLE IF EXISTS `tributacaos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tributacaos` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `icms` decimal(4,2) NOT NULL,
  `pis` decimal(4,2) NOT NULL,
  `cofins` decimal(4,2) NOT NULL,
  `ipi` decimal(4,2) NOT NULL,
  `ncm_padrao` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0000.00.00',
  `regime` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tributacaos`
--

LOCK TABLES `tributacaos` WRITE;
/*!40000 ALTER TABLE `tributacaos` DISABLE KEYS */;
/*!40000 ALTER TABLE `tributacaos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `unidade_cargas`
--

DROP TABLE IF EXISTS `unidade_cargas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `unidade_cargas` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `info_id` int unsigned NOT NULL,
  `id_unidade_carga` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `quantidade_rateio` decimal(5,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `unidade_cargas_info_id_foreign` (`info_id`),
  CONSTRAINT `unidade_cargas_info_id_foreign` FOREIGN KEY (`info_id`) REFERENCES `info_descargas` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `unidade_cargas`
--

LOCK TABLES `unidade_cargas` WRITE;
/*!40000 ALTER TABLE `unidade_cargas` DISABLE KEYS */;
/*!40000 ALTER TABLE `unidade_cargas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuarios` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `nome` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `login` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `adm` tinyint(1) NOT NULL,
  `senha` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `img` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `ativo` tinyint(1) NOT NULL,
  `acesso_cliente` tinyint(1) NOT NULL,
  `acesso_fornecedor` tinyint(1) NOT NULL,
  `acesso_produto` tinyint(1) NOT NULL,
  `acesso_financeiro` tinyint(1) NOT NULL,
  `acesso_caixa` tinyint(1) NOT NULL,
  `acesso_estoque` tinyint(1) NOT NULL,
  `acesso_compra` tinyint(1) NOT NULL,
  `acesso_fiscal` tinyint(1) NOT NULL,
  `venda_nao_fiscal` tinyint(1) NOT NULL,
  `acesso_cte` tinyint(1) NOT NULL,
  `acesso_mdfe` tinyint(1) NOT NULL,
  `tema` int NOT NULL DEFAULT '1',
  `tema_menu` int NOT NULL DEFAULT '1',
  `permissao` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios`
--

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` VALUES (1,'Usuário','usuario',1,'202cb962ac59075b964b07152d234b70','',1,1,1,1,1,1,1,1,1,1,1,1,1,1,'[\"\\/categorias\",\"\\/produtos\",\"\\/clientes\",\"\\/fornecedores\",\"\\/transportadoras\",\"\\/funcionarios\",\"\\/categoriasServico\",\"\\/servicos\",\"\\/listaDePrecos\",\"\\/categoriasConta\",\"\\/veiculos\",\"\\/usuarios\",\"\\/compraFiscal\",\"\\/compraManual\",\"\\/compras\",\"\\/cotacao\",\"\\/dfe\",\"\\/estoque\",\"\\/estoque\\/apontamentoProducao\",\"\\/vendas\\/lista\",\"\\/vendas\\/nova\",\"\\/frenteCaixa\",\"\\/orcamentoVenda\",\"\\/ordemServico\",\"\\/vendasEmCredito\",\"\\/devolucao\",\"\\/agendamentos\",\"\\/contasPagar\",\"\\/contasReceber\",\"\\/fluxoCaixa\",\"\\/graficos\",\"\\/pedidos\",\"\\/telasPedido\",\"\\/controleCozinha\\/selecionar\",\"\\/mesas\",\"\\/pedidos\\/controleComandas\",\"\\/cte\",\"\\/cte\\/nova\",\"\\/categoriaDespesa\",\"\\/mdfe\",\"\\/mdfe\\/nova\",\"\\/relatorios\",\"\\/dre\",\"\\/deliveryCategoria\",\"\\/deliveryProduto\",\"\\/deliveryComplemento\",\"\\/bairrosDelivery\",\"\\/pedidosDelivery\",\"\\/pedidosDelivery\\/frente\",\"\\/configDelivery\",\"\\/funcionamentoDelivery\",\"\\/push\",\"\\/tamanhosPizza\",\"\\/motoboys\",\"\\/codigoDesconto\",\"\\/configNF\",\"\\/escritorio\",\"\\/naturezaOperacao\",\"\\/tributos\",\"\\/enviarXml\",\"\\/ibpt\",\"\\/categoriaEcommerce\",\"\\/produtoEcommerce\",\"\\/pedidosEcommerce\",\"\\/configEcommerce\",\"\\/carrosselEcommerce\",\"\\/autorPost\",\"\\/categoriaPosts\",\"\\/postBlog\",\"\\/contatoEcommerce\",\"\\/informativoEcommerce\",\"\\/clienteEcommerce\",\"\\/configEcommerce\\/verSite\"]','2023-08-17 20:05:19','2023-08-17 20:05:19');
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vale_pedagios`
--

DROP TABLE IF EXISTS `vale_pedagios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vale_pedagios` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `mdfe_id` int unsigned NOT NULL,
  `cnpj_fornecedor` varchar(18) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cnpj_fornecedor_pagador` varchar(18) COLLATE utf8mb4_unicode_ci NOT NULL,
  `numero_compra` varchar(18) COLLATE utf8mb4_unicode_ci NOT NULL,
  `valor` decimal(10,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `vale_pedagios_mdfe_id_foreign` (`mdfe_id`),
  CONSTRAINT `vale_pedagios_mdfe_id_foreign` FOREIGN KEY (`mdfe_id`) REFERENCES `mdves` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vale_pedagios`
--

LOCK TABLES `vale_pedagios` WRITE;
/*!40000 ALTER TABLE `vale_pedagios` DISABLE KEYS */;
/*!40000 ALTER TABLE `vale_pedagios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `veiculos`
--

DROP TABLE IF EXISTS `veiculos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `veiculos` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `placa` varchar(8) COLLATE utf8mb4_unicode_ci NOT NULL,
  `uf` varchar(2) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cor` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `marca` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `modelo` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `rntrc` varchar(12) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tipo` varchar(2) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tipo_carroceira` varchar(2) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tipo_rodado` varchar(2) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tara` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `capacidade` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `proprietario_documento` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `proprietario_nome` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `proprietario_ie` varchar(13) COLLATE utf8mb4_unicode_ci NOT NULL,
  `proprietario_uf` varchar(2) COLLATE utf8mb4_unicode_ci NOT NULL,
  `proprietario_tp` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `veiculos`
--

LOCK TABLES `veiculos` WRITE;
/*!40000 ALTER TABLE `veiculos` DISABLE KEYS */;
/*!40000 ALTER TABLE `veiculos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `venda_caixas`
--

DROP TABLE IF EXISTS `venda_caixas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `venda_caixas` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `cliente_id` int unsigned DEFAULT NULL,
  `usuario_id` int unsigned NOT NULL,
  `natureza_id` int unsigned NOT NULL,
  `data_registro` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `valor_total` decimal(10,2) NOT NULL,
  `dinheiro_recebido` decimal(10,2) NOT NULL,
  `troco` decimal(10,2) NOT NULL,
  `desconto` decimal(10,2) NOT NULL,
  `acrescimo` decimal(10,2) NOT NULL,
  `forma_pagamento` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tipo_pagamento` varchar(2) COLLATE utf8mb4_unicode_ci NOT NULL,
  `estado` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `NFcNumero` int NOT NULL DEFAULT '0',
  `chave` varchar(48) COLLATE utf8mb4_unicode_ci NOT NULL,
  `path_xml` varchar(48) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nome` varchar(38) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cpf` varchar(18) COLLATE utf8mb4_unicode_ci NOT NULL,
  `observacao` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `pedido_delivery_id` int NOT NULL,
  `tipo_pagamento_1` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `valor_pagamento_1` decimal(10,2) NOT NULL DEFAULT '0.00',
  `tipo_pagamento_2` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `valor_pagamento_2` decimal(10,2) NOT NULL DEFAULT '0.00',
  `tipo_pagamento_3` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `valor_pagamento_3` decimal(10,2) NOT NULL DEFAULT '0.00',
  `bandeira_cartao` varchar(2) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '99',
  `cnpj_cartao` varchar(18) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `cAut_cartao` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `descricao_pag_outros` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `venda_caixas_cliente_id_foreign` (`cliente_id`),
  KEY `venda_caixas_usuario_id_foreign` (`usuario_id`),
  KEY `venda_caixas_natureza_id_foreign` (`natureza_id`),
  CONSTRAINT `venda_caixas_cliente_id_foreign` FOREIGN KEY (`cliente_id`) REFERENCES `clientes` (`id`),
  CONSTRAINT `venda_caixas_natureza_id_foreign` FOREIGN KEY (`natureza_id`) REFERENCES `natureza_operacaos` (`id`),
  CONSTRAINT `venda_caixas_usuario_id_foreign` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `venda_caixas`
--

LOCK TABLES `venda_caixas` WRITE;
/*!40000 ALTER TABLE `venda_caixas` DISABLE KEYS */;
/*!40000 ALTER TABLE `venda_caixas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vendas`
--

DROP TABLE IF EXISTS `vendas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vendas` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `cliente_id` int unsigned NOT NULL,
  `usuario_id` int unsigned NOT NULL,
  `natureza_id` int unsigned NOT NULL,
  `frete_id` int unsigned DEFAULT NULL,
  `transportadora_id` int unsigned DEFAULT NULL,
  `data_registro` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `valor_total` decimal(10,2) NOT NULL,
  `desconto` decimal(10,2) NOT NULL,
  `forma_pagamento` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tipo_pagamento` varchar(2) COLLATE utf8mb4_unicode_ci NOT NULL,
  `observacao` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `estado` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sequencia_cce` int NOT NULL,
  `NfNumero` int NOT NULL DEFAULT '0',
  `chave` varchar(48) COLLATE utf8mb4_unicode_ci NOT NULL,
  `path_xml` varchar(51) COLLATE utf8mb4_unicode_ci NOT NULL,
  `pedido_ecommerce_id` int NOT NULL DEFAULT '0',
  `bandeira_cartao` varchar(2) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '99',
  `cnpj_cartao` varchar(18) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `cAut_cartao` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `descricao_pag_outros` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `vendas_cliente_id_foreign` (`cliente_id`),
  KEY `vendas_usuario_id_foreign` (`usuario_id`),
  KEY `vendas_natureza_id_foreign` (`natureza_id`),
  KEY `vendas_frete_id_foreign` (`frete_id`),
  KEY `vendas_transportadora_id_foreign` (`transportadora_id`),
  CONSTRAINT `vendas_cliente_id_foreign` FOREIGN KEY (`cliente_id`) REFERENCES `clientes` (`id`),
  CONSTRAINT `vendas_frete_id_foreign` FOREIGN KEY (`frete_id`) REFERENCES `fretes` (`id`) ON DELETE CASCADE,
  CONSTRAINT `vendas_natureza_id_foreign` FOREIGN KEY (`natureza_id`) REFERENCES `natureza_operacaos` (`id`),
  CONSTRAINT `vendas_transportadora_id_foreign` FOREIGN KEY (`transportadora_id`) REFERENCES `transportadoras` (`id`) ON DELETE CASCADE,
  CONSTRAINT `vendas_usuario_id_foreign` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vendas`
--

LOCK TABLES `vendas` WRITE;
/*!40000 ALTER TABLE `vendas` DISABLE KEYS */;
/*!40000 ALTER TABLE `vendas` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-08-17 17:06:03
