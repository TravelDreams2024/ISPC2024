-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: dreamtravel
-- ------------------------------------------------------
-- Server version	8.0.36

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


-- Create and use database Dreamtravel
create database if not exists dreamtravel;
use dreamtravel;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add user',4,'add_user'),(14,'Can change user',4,'change_user'),(15,'Can delete user',4,'delete_user'),(16,'Can view user',4,'view_user'),(17,'Can add content type',5,'add_contenttype'),(18,'Can change content type',5,'change_contenttype'),(19,'Can delete content type',5,'delete_contenttype'),(20,'Can view content type',5,'view_contenttype'),(21,'Can add session',6,'add_session'),(22,'Can change session',6,'change_session'),(23,'Can delete session',6,'delete_session'),(24,'Can view session',6,'view_session'),(25,'Can add categorias',7,'add_categorias'),(26,'Can change categorias',7,'change_categorias'),(27,'Can delete categorias',7,'delete_categorias'),(28,'Can view categorias',7,'view_categorias'),(29,'Can add Metodos De Pago',8,'add_metodopago'),(30,'Can change Metodos De Pago',8,'change_metodopago'),(31,'Can delete Metodos De Pago',8,'delete_metodopago'),(32,'Can view Metodos De Pago',8,'view_metodopago'),(33,'Can add Rol',9,'add_rol'),(34,'Can change Rol',9,'change_rol'),(35,'Can delete Rol',9,'delete_rol'),(36,'Can view Rol',9,'view_rol'),(37,'Can add Usuario',10,'add_usuarios'),(38,'Can change Usuario',10,'change_usuarios'),(39,'Can delete Usuario',10,'delete_usuarios'),(40,'Can view Usuario',10,'view_usuarios'),(41,'Can add Nosotros',11,'add_nosotros'),(42,'Can change Nosotros',11,'change_nosotros'),(43,'Can delete Nosotros',11,'delete_nosotros'),(44,'Can view Nosotros',11,'view_nosotros'),(45,'Can add Destino',12,'add_destinos'),(46,'Can change Destino',12,'change_destinos'),(47,'Can delete Destino',12,'delete_destinos'),(48,'Can view Destino',12,'view_destinos'),(49,'Can add carrito',13,'add_carrito'),(50,'Can change carrito',13,'change_carrito'),(51,'Can delete carrito',13,'delete_carrito'),(52,'Can view carrito',13,'view_carrito');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$600000$tczXzKJr6FZKIGrwHEmICx$OPsXDW+fuqkhPRStC8SBmaDrnUW4kNa3iaSzpwyKnVI=','2024-06-13 13:48:21.480306',1,'supervisor','','','admin@supervisor.com',1,1,'2024-06-03 00:52:34.604234'),(2,'pbkdf2_sha256$600000$G55oNwfwOeXKY4PpGxSaCe$CWWli6aHaJlPW1Ijux/pr1ve59iUB4y7KSV5AQwEn/g=',NULL,0,'test@dreamt.com','','','',0,1,'2024-06-13 05:34:28.089745'),(3,'pbkdf2_sha256$600000$sMm8w2AAb4ddXFdV3Lr1JT$a5XqIUaIP7xo0QlEaokadohOlLJ9GCJl5HX7AGwXL2M=',NULL,0,'','aril','asa','test@dreamtravel.com',0,1,'2024-06-13 05:35:04.315615'),(4,'pbkdf2_sha256$600000$QNmxNFwfd4wPodv0gcZeXU$pUW/qVkLTC5HfPLdGwau3pyIu8vroaRKvbNZdIwBHg8=',NULL,0,'test111111111111111111111@test.com','testtttttttttttt','tttttttttttttttttt','test111111111111111111111@test.com',0,1,'2024-06-13 12:25:35.983352'),(5,'pbkdf2_sha256$600000$LCBuTusPhFLnEgFDXchNW2$cLju8a2J9OD1caIboZCplsIP6bzpAyoVgPcr5+xBtNs=',NULL,0,'222@222.com','222222','2222222222','222@222.com',0,1,'2024-06-13 12:28:15.061536'),(6,'pbkdf2_sha256$600000$rv1LcPgh73x0iPtk0CJoTr$vH1J2s/oQua5mkBOI+JKfUvRg1uE1P5Jen0hAQ2AGLo=',NULL,0,'33333333@33.com','33333333333','3333333333','33333333@33.com',0,1,'2024-06-13 12:32:30.363298');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_groups` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `carrito`
--

DROP TABLE IF EXISTS `carrito`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `carrito` (
  `id_compra` int NOT NULL AUTO_INCREMENT,
  `cantidad` decimal(3,0) NOT NULL,
  `id_destino` int NOT NULL,
  `id_metodoPago` int NOT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id_compra`),
  KEY `DreamTravelapp_carri_id_destino_5f83ed77_fk_destinos_` (`id_destino`),
  KEY `DreamTravelapp_carri_id_metodoPago_46d1d284_fk_metodo_pa` (`id_metodoPago`),
  CONSTRAINT `DreamTravelapp_carri_id_destino_5f83ed77_fk_destinos_` FOREIGN KEY (`id_destino`) REFERENCES `destinos` (`id_destino`),
  CONSTRAINT `DreamTravelapp_carri_id_metodoPago_46d1d284_fk_metodo_pa` FOREIGN KEY (`id_metodoPago`) REFERENCES `metodo_pago` (`id_metodoPago`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `carrito`
--

LOCK TABLES `carrito` WRITE;
/*!40000 ALTER TABLE `carrito` DISABLE KEYS */;
INSERT INTO `carrito` VALUES (6,1,8,1,2),(7,6,12,1,6),(11,7,10,1,5);
/*!40000 ALTER TABLE `carrito` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categorias`
--

DROP TABLE IF EXISTS `categorias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categorias` (
  `id_categoria` int NOT NULL,
  `nombreCategoria` char(150) NOT NULL,
  PRIMARY KEY (`id_categoria`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categorias`
--

LOCK TABLES `categorias` WRITE;
/*!40000 ALTER TABLE `categorias` DISABLE KEYS */;
/*!40000 ALTER TABLE `categorias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `destinos`
--

DROP TABLE IF EXISTS `destinos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `destinos` (
  `id_destino` int NOT NULL AUTO_INCREMENT,
  `nombre_Destino` varchar(150) NOT NULL,
  `descripcion` longtext NOT NULL,
  `image` longtext NOT NULL,
  `precio_Destino` decimal(12,2) NOT NULL,
  `fecha_salida` datetime(6) NOT NULL,
  `cantidad_Disponible` int NOT NULL,
  `id_categoria` int NOT NULL,
  `id_metodoPago` int NOT NULL,
  PRIMARY KEY (`id_destino`),
  KEY `destinos_id_categoria_b2457b83_fk_DreamTrav` (`id_categoria`),
  KEY `destinos_id_metodoPago_c3d221e3_fk_metodo_pago_id_metodoPago` (`id_metodoPago`),
  CONSTRAINT `destinos_id_categoria_b2457b83_fk_DreamTrav` FOREIGN KEY (`id_categoria`) REFERENCES `dreamtravelapp_categorias` (`id_categoria`),
  CONSTRAINT `destinos_id_metodoPago_c3d221e3_fk_metodo_pago_id_metodoPago` FOREIGN KEY (`id_metodoPago`) REFERENCES `metodo_pago` (`id_metodoPago`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `destinos`
--

LOCK TABLES `destinos` WRITE;
/*!40000 ALTER TABLE `destinos` DISABLE KEYS */;
INSERT INTO `destinos` VALUES (6,'San Carlos de Bariloche','Paisajes majestuosos, lagos cristalinos, montañas imponentes, chocolate artesanal, esquí de clase mundial y encanto alpino.','https://i.imgur.com/lkLUUVP.png',450.00,'2024-08-05 06:00:00.000000',20,1,1),(7,'Villa Carlos Paz','Lago, teatro, naturaleza, diversión, espectáculos, sierras, tranquilidad, gastronomía, balnearios, entretenimiento y relax.','https://i.imgur.com/eueFEH0.png',360.00,'2024-07-19 18:00:00.000000',20,1,1),(8,'Necochea','Playas extensas, paseos costeros, faro histórico, pesca deportiva, tranquilidad, dunas imponentes, atardeceres espectaculares.','https://i.imgur.com/fmOTpCr.png',360.00,'2024-09-25 06:00:00.000000',20,1,1),(9,'Monte Hermoso','Playas de arenas doradas, bosques de pinos, reserva natural, actividades acuáticas, descanso, sol, familia, paz, naturaleza.','https://i.imgur.com/sHquW2b.png',320.00,'2024-06-20 12:30:00.000000',5,1,1),(10,'Pehuenco','Extensas dunas doradas, pinos y acacias. Experiencia única para los amantes de la naturaleza y la serenidad.','https://i.imgur.com/ziN8JzS.png',300.00,'2024-10-02 06:00:00.000000',10,1,1),(11,'Glaciar Perito Moreno','Majestuosa masa de hielo, imponente belleza natural, aventura glaciar, turquesa resplandeciente, paisaje patagónico Ãºnico.','https://i.imgur.com/TcZyLCP.png',450.00,'2024-07-21 06:00:00.000000',15,1,1),(12,'Buzios','Playas paradisíacas, aguas cristalinas, encanto bohemio, gastronomía exquisita, actividades acuáticas, arte y cultura.','https://i.imgur.com/kcJGrj2.png',850.00,'2024-08-02 18:00:00.000000',15,2,1),(13,'Camboriú','Playas extensas, moderna infraestructura turística, vida nocturna animada, gastronomía diversa, relax.','https://i.imgur.com/JQhfiRZ.png',950.00,'2024-08-02 18:00:00.000000',15,2,1);
/*!40000 ALTER TABLE `destinos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_admin_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2024-06-03 01:35:23.561459','1','Facundo Cascallares',1,'[{\"added\": {}}]',10,1),(2,'2024-06-13 05:34:29.057356','2','test@dreamt.com',1,'[{\"added\": {}}]',4,1),(3,'2024-06-13 05:39:23.067252','2','Efectivo',2,'[]',8,1),(4,'2024-06-13 13:29:00.950943','5','222@222.com - Necochea',2,'[{\"changed\": {\"fields\": [\"Cantidad\"]}}]',13,1),(5,'2024-06-14 00:09:27.936461','13','222@222.com - Villa Carlos Paz - 1',1,'[{\"added\": {}}]',13,1);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_content_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(5,'contenttypes','contenttype'),(13,'DreamTravelapp','carrito'),(7,'DreamTravelapp','categorias'),(12,'DreamTravelapp','destinos'),(8,'DreamTravelapp','metodopago'),(11,'DreamTravelapp','nosotros'),(9,'DreamTravelapp','rol'),(10,'DreamTravelapp','usuarios'),(6,'sessions','session');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_migrations` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'DreamTravelapp','0001_initial','2024-06-03 00:49:35.393543'),(2,'contenttypes','0001_initial','2024-06-03 00:49:35.448975'),(3,'auth','0001_initial','2024-06-03 00:49:35.974356'),(4,'admin','0001_initial','2024-06-03 00:49:36.097042'),(5,'admin','0002_logentry_remove_auto_add','2024-06-03 00:49:36.098037'),(6,'admin','0003_logentry_add_action_flag_choices','2024-06-03 00:49:36.112392'),(7,'contenttypes','0002_remove_content_type_name','2024-06-03 00:49:36.207791'),(8,'auth','0002_alter_permission_name_max_length','2024-06-03 00:49:36.264011'),(9,'auth','0003_alter_user_email_max_length','2024-06-03 00:49:36.284557'),(10,'auth','0004_alter_user_username_opts','2024-06-03 00:49:36.287389'),(11,'auth','0005_alter_user_last_login_null','2024-06-03 00:49:36.347785'),(12,'auth','0006_require_contenttypes_0002','2024-06-03 00:49:36.347785'),(13,'auth','0007_alter_validators_add_error_messages','2024-06-03 00:49:36.347785'),(14,'auth','0008_alter_user_username_max_length','2024-06-03 00:49:36.414466'),(15,'auth','0009_alter_user_last_name_max_length','2024-06-03 00:49:36.482125'),(16,'auth','0010_alter_group_name_max_length','2024-06-03 00:49:36.501212'),(17,'auth','0011_update_proxy_permissions','2024-06-03 00:49:36.511234'),(18,'auth','0012_alter_user_first_name_max_length','2024-06-03 00:49:36.565737'),(19,'sessions','0001_initial','2024-06-03 00:49:36.602877'),(20,'DreamTravelapp','0002_rename_rol_nosotros_nombre_rol_and_more','2024-06-03 01:14:16.111704'),(21,'DreamTravelapp','0002_alter_carrito_options','2024-06-13 05:43:28.871261');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('2abyqx8s9ayzx93pfk57x3kamn2fphzn','.eJxVjDkOwjAUBe_iGlleZMdQ0nMG62_GAeRIcVJF3B0ipYD2zczbVIZ1qXntMueR1UVZdfrdEOgpbQf8gHafNE1tmUfUu6IP2vVtYnldD_fvoEKv33oIYIorKcYzBO8BfCjWOUeRQ0KGUJBQhmKil8homMgaAU9obUlJ1PsD8oA43Q:1sDvwS:oRrOvk47FFQ1_uFnIrk8PCIkMnZ4o5p987eeePjDE78','2024-06-17 00:52:52.607338'),('42wb7nt3rnqowx00tka7mwlu5cjx77bp','.eJxVjDkOwjAUBe_iGlleZMdQ0nMG62_GAeRIcVJF3B0ipYD2zczbVIZ1qXntMueR1UVZdfrdEOgpbQf8gHafNE1tmUfUu6IP2vVtYnldD_fvoEKv33oIYIorKcYzBO8BfCjWOUeRQ0KGUJBQhmKil8homMgaAU9obUlJ1PsD8oA43Q:1sHczm:opyj872ncynnNHIDEpmcmrNy7HadgJwD0sNFo1ohVC4','2024-06-27 05:27:34.927674'),('94shpr7eg0paphhvnrlh1wfyy6ssa9x1','.eJxVjDkOwjAUBe_iGlleZMdQ0nMG62_GAeRIcVJF3B0ipYD2zczbVIZ1qXntMueR1UVZdfrdEOgpbQf8gHafNE1tmUfUu6IP2vVtYnldD_fvoEKv33oIYIorKcYzBO8BfCjWOUeRQ0KGUJBQhmKil8homMgaAU9obUlJ1PsD8oA43Q:1sHkoP:cs_wlNWsbsp9tFzZNGrLquVC4CXqBATYawyAieSvpYY','2024-06-27 13:48:21.488125'),('fyam6zfl9n4pnb2xxkflc9mfc5b8r5wc','.eJxVjDkOwjAUBe_iGlleZMdQ0nMG62_GAeRIcVJF3B0ipYD2zczbVIZ1qXntMueR1UVZdfrdEOgpbQf8gHafNE1tmUfUu6IP2vVtYnldD_fvoEKv33oIYIorKcYzBO8BfCjWOUeRQ0KGUJBQhmKil8homMgaAU9obUlJ1PsD8oA43Q:1sHjZA:9iSzExfUSCYg8o0SrsY22MfZLkG-TWIx6o0-FcgkW1Q','2024-06-27 12:28:32.751401'),('ypwcu9ca1yz612sk7zszuiv3bpd3n7dl','.eJxVjDkOwjAUBe_iGlleZMdQ0nMG62_GAeRIcVJF3B0ipYD2zczbVIZ1qXntMueR1UVZdfrdEOgpbQf8gHafNE1tmUfUu6IP2vVtYnldD_fvoEKv33oIYIorKcYzBO8BfCjWOUeRQ0KGUJBQhmKil8homMgaAU9obUlJ1PsD8oA43Q:1sHkUF:i4Syj8UtP6z57jU3s4IKi6WzS8V2Z8bweXVPKJukitk','2024-06-27 13:27:31.186822');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dreamtravelapp_categorias`
--

DROP TABLE IF EXISTS `dreamtravelapp_categorias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dreamtravelapp_categorias` (
  `id_categoria` int NOT NULL AUTO_INCREMENT,
  `nombreCategoria` varchar(150) NOT NULL,
  PRIMARY KEY (`id_categoria`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dreamtravelapp_categorias`
--

LOCK TABLES `dreamtravelapp_categorias` WRITE;
/*!40000 ALTER TABLE `dreamtravelapp_categorias` DISABLE KEYS */;
INSERT INTO `dreamtravelapp_categorias` VALUES (1,'Nacional'),(2,'Internacional');
/*!40000 ALTER TABLE `dreamtravelapp_categorias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `metodo_pago`
--

DROP TABLE IF EXISTS `metodo_pago`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `metodo_pago` (
  `id_metodoPago` int NOT NULL AUTO_INCREMENT,
  `nombrePago` varchar(100) NOT NULL,
  PRIMARY KEY (`id_metodoPago`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `metodo_pago`
--

LOCK TABLES `metodo_pago` WRITE;
/*!40000 ALTER TABLE `metodo_pago` DISABLE KEYS */;
INSERT INTO `metodo_pago` VALUES (1,'Tarjeta'),(2,'Efectivo');
/*!40000 ALTER TABLE `metodo_pago` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nosotros`
--

DROP TABLE IF EXISTS `nosotros`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `nosotros` (
  `id_nosotros` int NOT NULL AUTO_INCREMENT,
  `nombre_apellido` varchar(100) NOT NULL,
  `github` varchar(100) NOT NULL,
  `linkedin` varchar(100) NOT NULL,
  `imagen` varchar(100) NOT NULL,
  `nombre_rol` bigint NOT NULL,
  `id_rol` int NOT NULL,
  PRIMARY KEY (`id_nosotros`),
  KEY `nosotros_rol_dd31e868_fk_rol_id` (`nombre_rol`),
  CONSTRAINT `nosotros_rol_dd31e868_fk_rol_id` FOREIGN KEY (`nombre_rol`) REFERENCES `rol` (`id_rol`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nosotros`
--

LOCK TABLES `nosotros` WRITE;
/*!40000 ALTER TABLE `nosotros` DISABLE KEYS */;
INSERT INTO `nosotros` VALUES (1,'Cantarino, Emmanuel','https://github.com/MaxiCantarino','https://www.linkedin.com/','https://i.imgur.com/hP7sdsS.jpg',3,0),(2,'Cascallares, Facundo','https://github.com/FacundoCascallares','https://www.linkedin.com/','https://i.imgur.com/hP7sdsS.jpg',3,3),(3,'Fernandez, Claudio Ranses','https://github.com/ccrrff2014','https://www.linkedin.com/','https://i.imgur.com/hP7sdsS.jpg',3,3),(4,'González, Natalia','https://github.com/Natalia24v','https://www.linkedin.com/','https://i.imgur.com/Qxcj00Z.jpeg',3,3),(5,'Navarrete, Romina Gabriela','https://github.com/rominarg','https://www.linkedin.com/','https://i.imgur.com/Qxcj00Z.jpeg',3,3),(6,'Oro, Elias','https://github.com/EliasOro2030','https://www.linkedin.com/','https://i.imgur.com/hP7sdsS.jpg',3,3),(7,'Ortiz, Fernando Ariel','https://github.com/ariel957','https://www.linkedin.com/','https://i.imgur.com/hP7sdsS.jpg',3,3),(8,'Soto Valenzuela, Juan Gabriel','https://github.com/vstecnic','https://www.linkedin.com/','https://i.imgur.com/hP7sdsS.jpg',3,3);
/*!40000 ALTER TABLE `nosotros` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rol`
--

DROP TABLE IF EXISTS `rol`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rol` (
  `id_rol` bigint NOT NULL AUTO_INCREMENT,
  `nombre_rol` char(100) NOT NULL,
  PRIMARY KEY (`id_rol`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rol`
--

LOCK TABLES `rol` WRITE;
/*!40000 ALTER TABLE `rol` DISABLE KEYS */;
INSERT INTO `rol` VALUES (1,'Administrador'),(2,'Usuario'),(3,'Full Stack');
/*!40000 ALTER TABLE `rol` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuario` (
  `id_usuario` int NOT NULL AUTO_INCREMENT,
  `nombre_usuario` varchar(100) NOT NULL,
  `apellido_usuario` varchar(100) NOT NULL,
  `passw` varchar(100) NOT NULL,
  `direccion` varchar(100) NOT NULL,
  `dni` varchar(8) NOT NULL,
  `telefono` varchar(50) NOT NULL,
  `mail` varchar(254) NOT NULL,
  `id_metodoPago` int NOT NULL,
  `nombre_rol` bigint NOT NULL,
  PRIMARY KEY (`id_usuario`),
  UNIQUE KEY `mail` (`mail`),
  KEY `usuario_id_metodoPago_ba739d02_fk_metodo_pago_id_metodoPago` (`id_metodoPago`),
  KEY `usuario_rol_7df0c658_fk_rol_id` (`nombre_rol`),
  CONSTRAINT `usuario_id_metodoPago_ba739d02_fk_metodo_pago_id_metodoPago` FOREIGN KEY (`id_metodoPago`) REFERENCES `metodo_pago` (`id_metodoPago`),
  CONSTRAINT `usuario_rol_7df0c658_fk_rol_id` FOREIGN KEY (`nombre_rol`) REFERENCES `rol` (`id_rol`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES (1,'Facundo','Cascallares','1234','Heguilor 272','45444444','02236035305','fac@hotmail.com',1,3),(2,'Homero','Simpson','ctrlSupr','Av.Siempre Viva 742','2745136','0303456','homerjsimpson@aol.com',1,2),(3,'Diana','Prince','ww2009_dc','4000 Warner Boulevard, Burbank, California, Estados Unidos','17242560','0800101010231','justice_leage@yahoo.com',2,1),(4,'Rick','Sánchez','SoyPickleRick','Calle Falsa 123','888888','0600242526','ricks@altavista.com',2,1),(5,'Bruno','Diaz','ImBatman','Algun lugar de Gotham City 482 ','227596','4865145780','bruno_diaz@gotham.com',1,2);
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-06-13 21:43:17
