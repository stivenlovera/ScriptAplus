-- MySQL dump 10.13  Distrib 8.0.33, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: aplussistemaventa
-- ------------------------------------------------------
-- Server version	5.7.24

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
-- Table structure for table `asiento`
--

DROP TABLE IF EXISTS `asiento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `asiento` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombreAsiento` text NOT NULL,
  `tipoasientoId` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `asiento`
--

LOCK TABLES `asiento` WRITE;
/*!40000 ALTER TABLE `asiento` DISABLE KEYS */;
INSERT INTO `asiento` VALUES (1,'con factura',2),(2,'con factura',1);
/*!40000 ALTER TABLE `asiento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `asientovplancuenta`
--

DROP TABLE IF EXISTS `asientovplancuenta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `asientovplancuenta` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `VPlanCuentaId` int(11) NOT NULL,
  `asientoId` int(11) NOT NULL,
  `rol` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `asientovplancuenta`
--

LOCK TABLES `asientovplancuenta` WRITE;
/*!40000 ALTER TABLE `asientovplancuenta` DISABLE KEYS */;
INSERT INTO `asientovplancuenta` VALUES (1,1,1,'haber'),(2,2,2,'haber'),(3,3,1,'debe');
/*!40000 ALTER TABLE `asientovplancuenta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `atributo`
--

DROP TABLE IF EXISTS `atributo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `atributo` (
  `atributoid` int(11) NOT NULL AUTO_INCREMENT,
  `etiqueta` varchar(200) NOT NULL,
  `tipo` varchar(50) NOT NULL,
  `categoriaid` int(11) DEFAULT NULL,
  PRIMARY KEY (`atributoid`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `atributo`
--

LOCK TABLES `atributo` WRITE;
/*!40000 ALTER TABLE `atributo` DISABLE KEYS */;
INSERT INTO `atributo` VALUES (1,'color','text',3),(2,'altura','text',3),(3,'colores','text',4),(4,'altura','text',4);
/*!40000 ALTER TABLE `atributo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `atributos`
--

DROP TABLE IF EXISTS `atributos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `atributos` (
  `productoid` int(11) NOT NULL,
  `atributoid` int(11) NOT NULL,
  `valor` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`productoid`,`atributoid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `atributos`
--

LOCK TABLES `atributos` WRITE;
/*!40000 ALTER TABLE `atributos` DISABLE KEYS */;
INSERT INTO `atributos` VALUES (1,3,'negro'),(1,4,'1.2 metros'),(2,3,''),(2,4,''),(3,3,'lila'),(3,4,'1 metro');
/*!40000 ALTER TABLE `atributos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categoria`
--

DROP TABLE IF EXISTS `categoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categoria` (
  `categoriaId` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  `izq` int(11) NOT NULL,
  `der` int(11) NOT NULL,
  PRIMARY KEY (`categoriaId`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categoria`
--

LOCK TABLES `categoria` WRITE;
/*!40000 ALTER TABLE `categoria` DISABLE KEYS */;
INSERT INTO `categoria` VALUES (1,'Electrodomesticos',1,8),(2,'Linea Blanca',4,7),(3,'Refrigeradores',2,3),(4,'heladeras',5,6);
/*!40000 ALTER TABLE `categoria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cliente`
--

DROP TABLE IF EXISTS `cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cliente` (
  `id` int(11) NOT NULL,
  `codigo_cliente` varchar(255) DEFAULT NULL,
  `codigo_tipo_documento_identidad` int(11) DEFAULT NULL,
  `complemento` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `nombre_razon_social` varchar(255) DEFAULT NULL,
  `numero_documento` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente`
--

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `configuracion_asientos`
--

DROP TABLE IF EXISTS `configuracion_asientos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `configuracion_asientos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(250) NOT NULL,
  `tipoasiento_id` int(11) NOT NULL,
  `descripcion` varchar(512) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `configuracion_asientos`
--

LOCK TABLES `configuracion_asientos` WRITE;
/*!40000 ALTER TABLE `configuracion_asientos` DISABLE KEYS */;
INSERT INTO `configuracion_asientos` VALUES (1,'venta',2,'use esta clasificacion de asiento para registrar nuevas ventas'),(2,'compra',1,'use esta clasificacion de asiento para registrar nuevas compras');
/*!40000 ALTER TABLE `configuracion_asientos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `configuracionplancuenta`
--

DROP TABLE IF EXISTS `configuracionplancuenta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `configuracionplancuenta` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cuentaClientes` int(11) NOT NULL,
  `cuentaProveedores` int(11) NOT NULL,
  `cuentaProducto` int(11) NOT NULL,
  `cuentaVendedores` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `configuracionplancuenta`
--

LOCK TABLES `configuracionplancuenta` WRITE;
/*!40000 ALTER TABLE `configuracionplancuenta` DISABLE KEYS */;
/*!40000 ALTER TABLE `configuracionplancuenta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `entradaalmacen`
--

DROP TABLE IF EXISTS `entradaalmacen`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `entradaalmacen` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ordenCompraId` int(11) NOT NULL,
  `VProductoId` int(11) NOT NULL,
  `VProveedoreId` int(11) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `precioCompra` decimal(10,2) NOT NULL,
  `precioTotal` decimal(10,2) NOT NULL,
  `fechaVencimiento` datetime NOT NULL,
  `lote` text NOT NULL,
  `almacenId` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `entradaalmacen`
--

LOCK TABLES `entradaalmacen` WRITE;
/*!40000 ALTER TABLE `entradaalmacen` DISABLE KEYS */;
/*!40000 ALTER TABLE `entradaalmacen` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estadoordencompra`
--

DROP TABLE IF EXISTS `estadoordencompra`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `estadoordencompra` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombreEstadoOrdenCompra` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estadoordencompra`
--

LOCK TABLES `estadoordencompra` WRITE;
/*!40000 ALTER TABLE `estadoordencompra` DISABLE KEYS */;
INSERT INTO `estadoordencompra` VALUES (1,'Pendiente'),(2,'Pagado'),(3,'Recibido');
/*!40000 ALTER TABLE `estadoordencompra` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estadoventa`
--

DROP TABLE IF EXISTS `estadoventa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `estadoventa` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombreEstadoVenta` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estadoventa`
--

LOCK TABLES `estadoventa` WRITE;
/*!40000 ALTER TABLE `estadoventa` DISABLE KEYS */;
INSERT INTO `estadoventa` VALUES (1,'cotizacion'),(2,'vendido');
/*!40000 ALTER TABLE `estadoventa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `movimiento`
--

DROP TABLE IF EXISTS `movimiento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `movimiento` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombreAsiento` text NOT NULL,
  `tipoAsientoId` int(11) NOT NULL,
  `asientoId` int(11) NOT NULL,
  `fechaMovimiento` datetime NOT NULL,
  `VPlancuentaId` int(11) NOT NULL,
  `nombrePlanCuenta` text NOT NULL,
  `descripcion` text NOT NULL,
  `debe` decimal(10,2) NOT NULL,
  `haber` decimal(10,2) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movimiento`
--

LOCK TABLES `movimiento` WRITE;
/*!40000 ALTER TABLE `movimiento` DISABLE KEYS */;
INSERT INTO `movimiento` VALUES (1,'con factura',2,1,'2023-07-29 00:00:00',1,'Cuenta por pagar','demo5',0.00,500.00),(2,'con factura',2,1,'2023-08-02 00:00:00',1,'Cuenta por pagar','Esto es una compra',0.00,9000.00),(3,'con factura',2,1,'2023-08-09 01:18:53',1,'Cuenta por pagar','demostracion',0.00,2000.00),(4,'con factura',2,1,'2023-08-09 01:18:53',3,'Cuenta derivada de pagar','demostracion',2000.00,0.00);
/*!40000 ALTER TABLE `movimiento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `movimientoalmacen`
--

DROP TABLE IF EXISTS `movimientoalmacen`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `movimientoalmacen` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `productoId` int(11) NOT NULL,
  `entradaId` int(11) NOT NULL,
  `salidaId` int(11) NOT NULL,
  `fecha` datetime DEFAULT NULL,
  `cantidad` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movimientoalmacen`
--

LOCK TABLES `movimientoalmacen` WRITE;
/*!40000 ALTER TABLE `movimientoalmacen` DISABLE KEYS */;
/*!40000 ALTER TABLE `movimientoalmacen` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ordencompra`
--

DROP TABLE IF EXISTS `ordencompra`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ordencompra` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `codigoOrden` text NOT NULL,
  `VProveedoreId` int(11) NOT NULL,
  `totalLiteral` text NOT NULL,
  `descripcion` text NOT NULL,
  `total` decimal(10,2) NOT NULL,
  `fechaCreacion` datetime NOT NULL,
  `usuarioId` int(11) NOT NULL,
  `asientoId` int(11) NOT NULL,
  `estadoId` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ordencompra`
--

LOCK TABLES `ordencompra` WRITE;
/*!40000 ALTER TABLE `ordencompra` DISABLE KEYS */;
INSERT INTO `ordencompra` VALUES (7,'OC#6',1,'QUINIENTOS','demo',500.00,'2023-07-28 00:00:00',1,1,1),(9,'OC#7',1,'Y Y SIETE MIL OCHOCIENTOS','demo',7800.00,'2023-07-28 00:00:00',1,1,1),(16,'OC#9',1,'Y Y DOS MIL SEISCIENTOS','demo',2600.00,'2023-07-29 00:00:00',1,1,1),(17,'OC#16',1,'Y Y TRES MIL DOSCIENTOS','demo2 ',3200.00,'2023-07-29 00:00:00',1,1,1),(18,'OC#17',1,'Y Y CINCO MIL','demo3',5000.00,'2023-07-29 00:00:00',1,1,1),(19,'OC#18',1,'QUINIENTOS','demo5',500.00,'2023-07-29 00:00:00',1,1,2),(20,'OC#19',1,'Y Y NUEVE MIL','Esto es una compra',9000.00,'2023-08-02 00:00:00',1,1,2),(22,'OC#21',1,'Y Y DOS MIL','Prueba de demostracion',2000.00,'2023-08-08 00:00:00',1,2,1),(23,'OC#22',1,'Y Y DOS MIL','Prueba de demostracion',2000.00,'2023-08-08 00:00:00',1,2,1),(24,'OC#23',1,'Y Y DOS MIL','demostracion',2000.00,'2023-08-08 00:00:00',1,1,1),(25,'OC#24',1,'Y Y DOS MIL','demostracion',2000.00,'2023-08-08 00:00:00',1,1,1),(26,'OC#25',1,'Y Y DOS MIL','demostracion',2000.00,'2023-08-08 00:00:00',1,1,2);
/*!40000 ALTER TABLE `ordencompra` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ordencompraproducto`
--

DROP TABLE IF EXISTS `ordencompraproducto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ordencompraproducto` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `VProductoId` int(11) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `precioCompra` decimal(10,2) NOT NULL,
  `precioTotal` decimal(10,2) NOT NULL,
  `ordenCompraId` int(11) NOT NULL,
  `almacenId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ordencompraproducto`
--

LOCK TABLES `ordencompraproducto` WRITE;
/*!40000 ALTER TABLE `ordencompraproducto` DISABLE KEYS */;
INSERT INTO `ordencompraproducto` VALUES (1,0,20,2000.00,40000.00,1,NULL),(2,0,10,7444.00,74440.00,1,NULL),(3,0,5,249.00,1245.00,2,NULL),(4,0,5,249.00,1245.00,3,NULL),(5,1,5,100.00,500.00,4,NULL),(6,1,5,100.00,500.00,5,NULL),(7,1,5,100.00,500.00,6,NULL),(8,1,5,100.00,500.00,7,NULL),(9,2,5,5.00,25.00,8,NULL),(10,1,15,520.00,7800.00,9,NULL),(11,3,5,200.00,1000.00,14,NULL),(12,1,5,520.00,2600.00,16,NULL),(13,1,8,400.00,3200.00,17,NULL),(14,2,50,100.00,5000.00,18,NULL),(15,2,5,100.00,500.00,19,NULL),(16,1,9,1000.00,9000.00,20,NULL),(17,1,2,1000.00,2000.00,26,NULL);
/*!40000 ALTER TABLE `ordencompraproducto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `parametro`
--

DROP TABLE IF EXISTS `parametro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `parametro` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `codigo_clasificador` varchar(255) NOT NULL,
  `codigo_tipo_parametro` varchar(255) DEFAULT NULL,
  `descripcion` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1111 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `parametro`
--

LOCK TABLES `parametro` WRITE;
/*!40000 ALTER TABLE `parametro` DISABLE KEYS */;
INSERT INTO `parametro` VALUES (1110,'demo','demo','Carnet de identidad');
/*!40000 ALTER TABLE `parametro` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `permiso`
--

DROP TABLE IF EXISTS `permiso`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `permiso` (
  `permisoId` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `ruta` varchar(400) NOT NULL,
  PRIMARY KEY (`permisoId`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permiso`
--

LOCK TABLES `permiso` WRITE;
/*!40000 ALTER TABLE `permiso` DISABLE KEYS */;
INSERT INTO `permiso` VALUES (1,'admin','/demo');
/*!40000 ALTER TABLE `permiso` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `permisos`
--

DROP TABLE IF EXISTS `permisos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `permisos` (
  `permisoId` int(11) NOT NULL,
  `rolId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permisos`
--

LOCK TABLES `permisos` WRITE;
/*!40000 ALTER TABLE `permisos` DISABLE KEYS */;
INSERT INTO `permisos` VALUES (1,1);
/*!40000 ALTER TABLE `permisos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `persona`
--

DROP TABLE IF EXISTS `persona`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `persona` (
  `personaId` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `apellido` varchar(100) NOT NULL,
  `direccion` varchar(300) NOT NULL,
  `fechaNacimiento` date NOT NULL,
  `email` varchar(100) NOT NULL,
  `telefono` varchar(20) NOT NULL,
  `ci` varchar(20) NOT NULL,
  `habilitado` tinyint(4) NOT NULL,
  PRIMARY KEY (`personaId`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `persona`
--

LOCK TABLES `persona` WRITE;
/*!40000 ALTER TABLE `persona` DISABLE KEYS */;
INSERT INTO `persona` VALUES (1,'Ali Stiven','Lovera Huarachi','no registrado','1991-01-01','stivenlovera@gmail.com','75679775','8963497',1),(2,'Mauricio','Peres','no registrado','1994-01-05','mau@gmail.com','66989898','9987778',1),(3,'Ali Stiven','Lovera Huarachi','no registrado','1991-01-01','stivenlovera@gmail.com','75679775','8963497',1);
/*!40000 ALTER TABLE `persona` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `productomaestro`
--

DROP TABLE IF EXISTS `productomaestro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `productomaestro` (
  `productomaestroid` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(200) NOT NULL,
  `categoriaid` int(11) DEFAULT NULL,
  PRIMARY KEY (`productomaestroid`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productomaestro`
--

LOCK TABLES `productomaestro` WRITE;
/*!40000 ALTER TABLE `productomaestro` DISABLE KEYS */;
INSERT INTO `productomaestro` VALUES (1,'heladera Samsung',4),(2,'44545',4),(3,'44545',4),(4,'65656',4),(5,'Heladera haier',4),(6,'Samsung Freezer',4);
/*!40000 ALTER TABLE `productomaestro` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rol`
--

DROP TABLE IF EXISTS `rol`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rol` (
  `rolId` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(20) NOT NULL,
  PRIMARY KEY (`rolId`),
  UNIQUE KEY `nombre` (`nombre`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rol`
--

LOCK TABLES `rol` WRITE;
/*!40000 ALTER TABLE `rol` DISABLE KEYS */;
INSERT INTO `rol` VALUES (1,'administrador');
/*!40000 ALTER TABLE `rol` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roles` (
  `rolesId` int(11) NOT NULL AUTO_INCREMENT,
  `usuarioId` int(11) NOT NULL,
  `rolId` int(11) NOT NULL,
  PRIMARY KEY (`rolesId`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,1,1);
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `salidaalmacen`
--

DROP TABLE IF EXISTS `salidaalmacen`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `salidaalmacen` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ventaId` int(11) NOT NULL,
  `VProductoId` int(11) NOT NULL,
  `VProveedoreId` int(11) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `precioCompra` decimal(10,2) NOT NULL,
  `precioTotal` decimal(10,2) NOT NULL,
  `lote` text NOT NULL,
  `almacenId` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `salidaalmacen`
--

LOCK TABLES `salidaalmacen` WRITE;
/*!40000 ALTER TABLE `salidaalmacen` DISABLE KEYS */;
/*!40000 ALTER TABLE `salidaalmacen` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stockalmacen`
--

DROP TABLE IF EXISTS `stockalmacen`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stockalmacen` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `VProveedoreId` int(11) NOT NULL,
  `VProductoId` int(11) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `precioUnitario` decimal(10,2) NOT NULL,
  `precioTotal` decimal(10,2) NOT NULL,
  `stockAlert` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stockalmacen`
--

LOCK TABLES `stockalmacen` WRITE;
/*!40000 ALTER TABLE `stockalmacen` DISABLE KEYS */;
/*!40000 ALTER TABLE `stockalmacen` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sucursal`
--

DROP TABLE IF EXISTS `sucursal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sucursal` (
  `id` int(11) NOT NULL,
  `codigo` int(11) NOT NULL,
  `departamento` varchar(255) DEFAULT NULL,
  `direccion` varchar(255) DEFAULT NULL,
  `municipio` varchar(255) DEFAULT NULL,
  `nombre` varchar(255) DEFAULT NULL,
  `telefono` varchar(255) DEFAULT '0',
  `id_empresa` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sucursal`
--

LOCK TABLES `sucursal` WRITE;
/*!40000 ALTER TABLE `sucursal` DISABLE KEYS */;
/*!40000 ALTER TABLE `sucursal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipoasiento`
--

DROP TABLE IF EXISTS `tipoasiento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tipoasiento` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombreTipoAsiento` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipoasiento`
--

LOCK TABLES `tipoasiento` WRITE;
/*!40000 ALTER TABLE `tipoasiento` DISABLE KEYS */;
INSERT INTO `tipoasiento` VALUES (1,'Venta'),(2,'Compra');
/*!40000 ALTER TABLE `tipoasiento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuario` (
  `usuarioId` int(11) NOT NULL AUTO_INCREMENT,
  `usuario` varchar(30) DEFAULT NULL,
  `password` varchar(64) DEFAULT NULL,
  `personaId` int(11) NOT NULL,
  `habilitado` tinyint(1) NOT NULL,
  PRIMARY KEY (`usuarioId`),
  UNIQUE KEY `usuario` (`usuario`,`habilitado`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES (1,'admin','admin',1,1),(2,NULL,NULL,2,0);
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `valmacen`
--

DROP TABLE IF EXISTS `valmacen`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `valmacen` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `codigoAlmacen` text NOT NULL,
  `dirrecion` text NOT NULL,
  `nombreAlmacen` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `valmacen`
--

LOCK TABLES `valmacen` WRITE;
/*!40000 ALTER TABLE `valmacen` DISABLE KEYS */;
INSERT INTO `valmacen` VALUES (1,'alm-1','Zona la ramada av isabel catolica','Ramada - isabel catolica'),(2,'alm-2','av lujan #3454','Lujan'),(3,'alm-3','plan 3000, calle chavez  zona mechero','Plan 3000');
/*!40000 ALTER TABLE `valmacen` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vclientes`
--

DROP TABLE IF EXISTS `vclientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vclientes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `codigoCliente` text NOT NULL,
  `numeroDocumento` text NOT NULL,
  `nombreCompletoCliente` text NOT NULL,
  `correoElectronico` text NOT NULL,
  `dirrecion` text NOT NULL,
  `telefono` text NOT NULL,
  `codigoTipoDocumentoIdentidad` int(11) DEFAULT NULL,
  `complemento` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vclientes`
--

LOCK TABLES `vclientes` WRITE;
/*!40000 ALTER TABLE `vclientes` DISABLE KEYS */;
INSERT INTO `vclientes` VALUES (1,'cli-0','8963598','juan xavier','juan@gmail.com','no registrado','75679795',1110,'Lp');
/*!40000 ALTER TABLE `vclientes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `venta`
--

DROP TABLE IF EXISTS `venta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `venta` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `codigoVenta` text NOT NULL,
  `VClienteId` int(11) NOT NULL,
  `totalLiteral` text NOT NULL,
  `descripcion` text NOT NULL,
  `total` decimal(10,2) NOT NULL,
  `fechaCreacion` datetime NOT NULL,
  `usuarioId` int(11) NOT NULL,
  `nit` text NOT NULL,
  `telefono` text NOT NULL,
  `asientoId` int(11) NOT NULL,
  `estadoId` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `venta`
--

LOCK TABLES `venta` WRITE;
/*!40000 ALTER TABLE `venta` DISABLE KEYS */;
INSERT INTO `venta` VALUES (1,'vent#00',1,'cuatro mil ochocientos','venta de prueba manual',4800.00,'2023-08-02 00:00:00',1,'','75988989',2,2),(31,'vent0031',1,'Y Y DOS MIL OCHOCIENTOS OCHENTA','fggfh',2880.00,'2023-08-05 00:00:00',1,'8963598','75679795',2,2),(32,'vent0032',1,'SETENTA Y NUEVE MIL DOSCIENTOS','demo',79200.00,'2023-08-05 19:18:27',1,'8963598','75679795',2,1),(33,'vent0033',1,'Y Y SIETE MIL DOSCIENTOS','fgsdgsdg',7200.00,'2023-08-05 00:00:00',1,'8963598','75679795',2,2),(34,'vent0034',1,'MIL DOSCIENTOS','otra venta de ejemplo',1200.00,'2023-08-05 00:00:00',1,'8963598','75679795',2,2),(35,'vent0035',1,'SETECIENTOS CINCUENTA','efsfddfs',750.00,'2023-08-05 00:00:00',1,'8963598','75679795',2,2),(36,'vent0036',1,'ONCE MIL QUINIENTOS VEINTE','gdfgdfgdfg',11520.00,'2023-08-05 00:00:00',1,'8963598','75679795',2,2),(37,'vent0037',1,'SETECIENTOS CINCUENTA','jghgjhj',750.00,'2023-08-05 00:00:00',1,'8963598','75679795',2,2),(38,'vent0038',1,'MIL DOSCIENTOS','dsfsfd',1200.00,'2023-08-05 00:00:00',1,'8963598','75679795',2,2),(39,'vent0039',1,'SETECIENTOS CINCUENTA','dssfsdf',750.00,'2023-08-05 19:32:52',1,'8963598','75679795',2,1),(40,'vent0040',1,'CUATROCIENTOS CINCUENTA','gsgsdf',450.00,'2023-08-05 19:34:55',1,'8963598','75679795',2,1),(41,'vent0041',1,'TREINTA Y NUEVE MIL DOSCIENTOS','dfgdgfg',39200.00,'2023-08-05 00:00:00',1,'8963598','75679795',2,2),(42,'vent0042',1,'CATORCE MIL SETECIENTOS','tyryrt',14700.00,'2023-08-05 00:00:00',1,'8963598','75679795',2,2),(43,'vent0043',1,'TRESCIENTOS','GBFDGFGDF',300.00,'2023-08-05 00:00:00',1,'8963598','75679795',2,2);
/*!40000 ALTER TABLE `venta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ventaproducto`
--

DROP TABLE IF EXISTS `ventaproducto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ventaproducto` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `VProductoId` int(11) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `precioUnitario` decimal(10,2) NOT NULL,
  `precioTotal` decimal(10,2) NOT NULL,
  `ventaId` int(11) NOT NULL,
  `almacenId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ventaproducto`
--

LOCK TABLES `ventaproducto` WRITE;
/*!40000 ALTER TABLE `ventaproducto` DISABLE KEYS */;
INSERT INTO `ventaproducto` VALUES (1,1,1,4900.00,4900.00,1,NULL),(31,2,2,1440.00,2880.00,31,NULL),(32,2,55,1440.00,79200.00,32,NULL),(33,2,5,1440.00,7200.00,33,NULL),(34,3,8,150.00,1200.00,34,NULL),(35,3,5,150.00,750.00,35,NULL),(36,2,8,1440.00,11520.00,36,NULL),(37,3,5,150.00,750.00,37,NULL),(38,3,8,150.00,1200.00,38,NULL),(39,3,5,150.00,750.00,39,NULL),(40,3,1,150.00,150.00,40,NULL),(41,3,2,150.00,300.00,40,NULL),(42,1,8,4900.00,39200.00,41,NULL),(43,1,3,4900.00,14700.00,42,NULL),(44,3,2,150.00,300.00,43,NULL);
/*!40000 ALTER TABLE `ventaproducto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vmoneda`
--

DROP TABLE IF EXISTS `vmoneda`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vmoneda` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombreMoneda` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vmoneda`
--

LOCK TABLES `vmoneda` WRITE;
/*!40000 ALTER TABLE `vmoneda` DISABLE KEYS */;
/*!40000 ALTER TABLE `vmoneda` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vnivel`
--

DROP TABLE IF EXISTS `vnivel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vnivel` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombreNivel` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vnivel`
--

LOCK TABLES `vnivel` WRITE;
/*!40000 ALTER TABLE `vnivel` DISABLE KEYS */;
/*!40000 ALTER TABLE `vnivel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vplanclientes`
--

DROP TABLE IF EXISTS `vplanclientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vplanclientes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `codigo` text NOT NULL,
  `nombreCuenta` text NOT NULL,
  `moneda` text NOT NULL,
  `valor` decimal(20,2) NOT NULL,
  `codigoIdentificador` text NOT NULL,
  `nivel` int(11) NOT NULL,
  `debe` decimal(20,2) NOT NULL,
  `haber` decimal(20,2) NOT NULL,
  `VPlanCuentaId` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vplanclientes`
--

LOCK TABLES `vplanclientes` WRITE;
/*!40000 ALTER TABLE `vplanclientes` DISABLE KEYS */;
/*!40000 ALTER TABLE `vplanclientes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vplancuenta`
--

DROP TABLE IF EXISTS `vplancuenta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vplancuenta` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `codigo` text NOT NULL,
  `nombreCuenta` text NOT NULL,
  `moneda` text NOT NULL,
  `valor` decimal(20,2) NOT NULL,
  `codigoIdentificador` text NOT NULL,
  `nivel` int(11) NOT NULL,
  `debe` decimal(20,2) NOT NULL,
  `haber` decimal(20,2) NOT NULL,
  `VPlanCuentaId` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vplancuenta`
--

LOCK TABLES `vplancuenta` WRITE;
/*!40000 ALTER TABLE `vplancuenta` DISABLE KEYS */;
INSERT INTO `vplancuenta` VALUES (1,'1000000','Cuenta por pagar','1',1.00,'0',1,0.00,0.00,0),(2,'2000000','Cuenta para venta','1',1.00,'0',1,0.00,0.00,0),(3,'1500000','Cuenta derivada de pagar','1',1.00,'1',1,0.00,0.00,1);
/*!40000 ALTER TABLE `vplancuenta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vplanproductos`
--

DROP TABLE IF EXISTS `vplanproductos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vplanproductos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `codigo` text NOT NULL,
  `nombreCuenta` text NOT NULL,
  `moneda` text NOT NULL,
  `valor` decimal(20,2) NOT NULL,
  `codigoIdentificador` text NOT NULL,
  `nivel` int(11) NOT NULL,
  `debe` decimal(20,2) NOT NULL,
  `haber` decimal(20,2) NOT NULL,
  `VPlanCuentaId` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vplanproductos`
--

LOCK TABLES `vplanproductos` WRITE;
/*!40000 ALTER TABLE `vplanproductos` DISABLE KEYS */;
/*!40000 ALTER TABLE `vplanproductos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vplanproveedores`
--

DROP TABLE IF EXISTS `vplanproveedores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vplanproveedores` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `codigo` text NOT NULL,
  `nombreCuenta` text NOT NULL,
  `moneda` text NOT NULL,
  `valor` decimal(20,2) NOT NULL,
  `codigoIdentificador` text NOT NULL,
  `nivel` int(11) NOT NULL,
  `debe` decimal(20,2) NOT NULL,
  `haber` decimal(20,2) NOT NULL,
  `VPlanCuentaId` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vplanproveedores`
--

LOCK TABLES `vplanproveedores` WRITE;
/*!40000 ALTER TABLE `vplanproveedores` DISABLE KEYS */;
/*!40000 ALTER TABLE `vplanproveedores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vproducto`
--

DROP TABLE IF EXISTS `vproducto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vproducto` (
  `productoid` int(11) NOT NULL AUTO_INCREMENT,
  `codigoProducto` text NOT NULL,
  `codigoBarra` text NOT NULL,
  `nombreProducto` text NOT NULL,
  `precioCompra` decimal(10,0) NOT NULL,
  `utilidadMin` decimal(10,0) NOT NULL,
  `PrecioVentaMin` decimal(10,0) NOT NULL,
  `utilidadMax` decimal(10,0) NOT NULL,
  `PrecioVentaMax` decimal(10,0) NOT NULL,
  `productomaestroid` int(11) DEFAULT NULL,
  PRIMARY KEY (`productoid`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vproducto`
--

LOCK TABLES `vproducto` WRITE;
/*!40000 ALTER TABLE `vproducto` DISABLE KEYS */;
INSERT INTO `vproducto` VALUES (1,'prod-1','554521222112',' RT53K6541SL',1000,20,4200,40,4900,1),(2,'prod-2','454545','5656',100,10,1320,20,1440,5),(3,'prod-3','56566','dr4234234',100,20,120,46,150,1);
/*!40000 ALTER TABLE `vproducto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vproductoimagenes`
--

DROP TABLE IF EXISTS `vproductoimagenes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vproductoimagenes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` text NOT NULL,
  `VproductoId` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vproductoimagenes`
--

LOCK TABLES `vproductoimagenes` WRITE;
/*!40000 ALTER TABLE `vproductoimagenes` DISABLE KEYS */;
INSERT INTO `vproductoimagenes` VALUES (10,' RT53K6541SL2112400.webp',1),(11,'dr42342342113200.png',3);
/*!40000 ALTER TABLE `vproductoimagenes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vproveedor`
--

DROP TABLE IF EXISTS `vproveedor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vproveedor` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nit` varchar(250) NOT NULL,
  `codigoProveedor` text NOT NULL,
  `nombreProveedor` text NOT NULL,
  `dirrecion` text NOT NULL,
  `telefono` text NOT NULL,
  `contacto` text NOT NULL,
  `PlanCuentaId` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vproveedor`
--

LOCK TABLES `vproveedor` WRITE;
/*!40000 ALTER TABLE `vproveedor` DISABLE KEYS */;
INSERT INTO `vproveedor` VALUES (1,'5989656','prov-00','importadora zeus','no registrado','78949456','mauricio parra',0);
/*!40000 ALTER TABLE `vproveedor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `vwmovimiento_cuenta`
--

DROP TABLE IF EXISTS `vwmovimiento_cuenta`;
/*!50001 DROP VIEW IF EXISTS `vwmovimiento_cuenta`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vwmovimiento_cuenta` AS SELECT 
 1 AS `asientoId`,
 1 AS `codigo`,
 1 AS `fecha`,
 1 AS `descripcion`,
 1 AS `para`,
 1 AS `total`,
 1 AS `metodoPago`,
 1 AS `nombreCuenta`,
 1 AS `codigoCuenta`,
 1 AS `PlanCuentaId`,
 1 AS `realizado`,
 1 AS `haber`,
 1 AS `debe`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vwmovimiento_generales`
--

DROP TABLE IF EXISTS `vwmovimiento_generales`;
/*!50001 DROP VIEW IF EXISTS `vwmovimiento_generales`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vwmovimiento_generales` AS SELECT 
 1 AS `asientoId`,
 1 AS `codigo`,
 1 AS `fecha`,
 1 AS `descripcion`,
 1 AS `para`,
 1 AS `total`,
 1 AS `metodoPago`,
 1 AS `realizado`*/;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `vwmovimiento_cuenta`
--

/*!50001 DROP VIEW IF EXISTS `vwmovimiento_cuenta`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vwmovimiento_cuenta` AS (select `a`.`id` AS `asientoId`,`ocp`.`codigoOrden` AS `codigo`,`ocp`.`fechaCreacion` AS `fecha`,`ocp`.`descripcion` AS `descripcion`,`pv`.`nombreProveedor` AS `para`,`ocp`.`total` AS `total`,`ta`.`nombreTipoAsiento` AS `metodoPago`,`pc`.`nombreCuenta` AS `nombreCuenta`,`pc`.`codigo` AS `codigoCuenta`,`pc`.`id` AS `PlanCuentaId`,concat(`p`.`nombre`,' ',`p`.`apellido`) AS `realizado`,if((`apc`.`rol` = 'haber'),`ocp`.`total`,0) AS `haber`,if((`apc`.`rol` = 'debe'),`ocp`.`total`,0) AS `debe` from (((((((`asiento` `a` join `tipoasiento` `ta` on((`ta`.`id` = `a`.`tipoasientoId`))) join `asientovplancuenta` `apc` on((`apc`.`asientoId` = `a`.`id`))) join `vplancuenta` `pc` on((`pc`.`id` = `apc`.`VPlanCuentaId`))) join `ordencompra` `ocp` on(((`ocp`.`asientoId` = `a`.`id`) and (`ocp`.`estadoId` = 2)))) join `vproveedor` `pv` on((`ocp`.`VProveedoreId` = `pv`.`id`))) join `usuario` `usu` on((`ocp`.`usuarioId` = `usu`.`usuarioId`))) join `persona` `p` on((`p`.`personaId` = `usu`.`personaId`)))) union all (select `a`.`id` AS `asientoId`,`v`.`codigoVenta` AS `codigo`,`v`.`fechaCreacion` AS `fecha`,`v`.`descripcion` AS `descripcion`,`vc`.`nombreCompletoCliente` AS `para`,`v`.`total` AS `total`,`ta`.`nombreTipoAsiento` AS `metodoPago`,`pc`.`nombreCuenta` AS `nombreCuenta`,`pc`.`codigo` AS `codigoCuenta`,`pc`.`id` AS `PlanCuentaId`,concat(`p`.`nombre`,' ',`p`.`apellido`) AS `realizado`,if((`apc`.`rol` = 'haber'),`v`.`total`,0) AS `haber`,if((`apc`.`rol` = 'debe'),`v`.`total`,0) AS `debe` from (((((((`asiento` `a` join `tipoasiento` `ta` on((`ta`.`id` = `a`.`tipoasientoId`))) join `asientovplancuenta` `apc` on((`apc`.`asientoId` = `a`.`id`))) join `vplancuenta` `pc` on((`pc`.`id` = `apc`.`VPlanCuentaId`))) join `venta` `v` on(((`v`.`asientoId` = `a`.`id`) and (`v`.`estadoId` = 2)))) join `vclientes` `vc` on((`v`.`VClienteId` = `vc`.`id`))) join `usuario` `usu` on((`v`.`usuarioId` = `usu`.`usuarioId`))) join `persona` `p` on((`p`.`personaId` = `usu`.`personaId`)))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vwmovimiento_generales`
--

/*!50001 DROP VIEW IF EXISTS `vwmovimiento_generales`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vwmovimiento_generales` AS (select `a`.`id` AS `asientoId`,`ocp`.`codigoOrden` AS `codigo`,`ocp`.`fechaCreacion` AS `fecha`,`ocp`.`descripcion` AS `descripcion`,`pv`.`nombreProveedor` AS `para`,`ocp`.`total` AS `total`,`ta`.`nombreTipoAsiento` AS `metodoPago`,concat(`p`.`nombre`,' ',`p`.`apellido`) AS `realizado` from (((((`asiento` `a` join `tipoasiento` `ta` on((`ta`.`id` = `a`.`tipoasientoId`))) join `ordencompra` `ocp` on(((`ocp`.`asientoId` = `a`.`id`) and (`ocp`.`estadoId` = 2)))) join `vproveedor` `pv` on((`ocp`.`VProveedoreId` = `pv`.`id`))) join `usuario` `usu` on((`ocp`.`usuarioId` = `usu`.`usuarioId`))) join `persona` `p` on((`p`.`personaId` = `usu`.`personaId`)))) union all (select `a`.`id` AS `asientoId`,`v`.`codigoVenta` AS `codigo`,`v`.`fechaCreacion` AS `fecha`,`v`.`descripcion` AS `descripcion`,`vc`.`nombreCompletoCliente` AS `para`,`v`.`total` AS `total`,`ta`.`nombreTipoAsiento` AS `metodoPago`,concat(`p`.`nombre`,' ',`p`.`apellido`) AS `realizado` from (((((`asiento` `a` join `tipoasiento` `ta` on((`ta`.`id` = `a`.`tipoasientoId`))) join `venta` `v` on(((`v`.`asientoId` = `a`.`id`) and (`v`.`estadoId` = 2)))) join `vclientes` `vc` on((`v`.`VClienteId` = `vc`.`id`))) join `usuario` `usu` on((`v`.`usuarioId` = `usu`.`usuarioId`))) join `persona` `p` on((`p`.`personaId` = `usu`.`personaId`)))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-08-11 22:49:46
