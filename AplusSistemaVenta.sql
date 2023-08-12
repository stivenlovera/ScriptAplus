-- Active: 1687829054607@@127.0.0.1@3306@aplussistemaventa
-- Active: 1687482932083@@159.203.172.137@3306@AplusSistemaVenta
SELECT * FROM parametro where codigo_tipo_parametro='TIPO_DOCUMENTO_IDENTIDAD';
SELECT * FROM vclientes;
SELECT * FROM cliente;
SELECT * FROM usuario;

SELECT * FROM persona;
SELECT * FROM venta;
SELECT * FROM asiento;
SELECT * FROM VPlanClientes;
SELECT * FROM parametro GROUP BY codigo_tipo_parametro;

SELECT * FROM asiento;

SELECT * FROM  tipo_movimiento_material_pedido WHERE `Ped_Mat_ID`=41785;


SELECT * FROM  pedidos_material WHERE `Ped_ID`= 18928;
SELECT * FROM pedidos WHERE Pro_ID=1719;
-- Active: 1679545701306@@127.0.0.1@3306@aplussistemaventa
DROP DATABASE IF EXISTS AplusSistemaVenta;

CREATE database
    AplusSistemaVenta CHARACTER SET 'UTF8' COLLATE 'utf8_general_ci';

use AplusSistemaVenta;

/*ALMACEN*/

DROP TABLE IF EXISTS asiento;

CREATE TABLE
    `asiento` (
        `id` int(11) NOT NULL AUTO_INCREMENT,
        `nombreAsiento` text NOT NULL,
        `tipoasientoId` int(11) NOT NULL,
        PRIMARY KEY (`id`)
    );

DROP TABLE IF EXISTS asientovplancuenta;

CREATE TABLE
    `asientovplancuenta` (
        `id` int(11) NOT NULL AUTO_INCREMENT,
        `VPlanCuentaId` int(11) NOT NULL,
        `asientoId` int(11) NOT NULL,
        `rol` text NOT NULL,
        PRIMARY KEY (`id`)
    );

DROP TABLE IF EXISTS atributo;

CREATE TABLE
    `atributo` (
        `atributoid` int(11) NOT NULL AUTO_INCREMENT,
        `etiqueta` varchar(200) NOT NULL,
        `tipo` varchar(50) NOT NULL,
        `categoriaid` int(11) DEFAULT NULL,
        PRIMARY KEY (`atributoid`)
    );

DROP TABLE IF EXISTS atributos;

CREATE TABLE
    `atributos` (
        `productoid` int(11) NOT NULL,
        `atributoid` int(11) NOT NULL,
        `valor` varchar(200) DEFAULT NULL,
        PRIMARY KEY (`productoid`, `atributoid`)
    );

DROP TABLE IF EXISTS categoria;

CREATE TABLE
    `categoria` (
        `categoriaId` int(11) NOT NULL AUTO_INCREMENT,
        `nombre` varchar(50) NOT NULL,
        `izq` int(11) NOT NULL,
        `der` int(11) NOT NULL,
        PRIMARY KEY (`categoriaId`)
    );

DROP TABLE IF EXISTS cliente;

CREATE TABLE
    `cliente` (
        `id` int(11) NOT NULL,
        `codigo_cliente` varchar(255) DEFAULT NULL,
        `codigo_tipo_documento_identidad` int(11) DEFAULT NULL,
        `complemento` varchar(255) DEFAULT NULL,
        `email` varchar(255) DEFAULT NULL,
        `nombre_razon_social` varchar(255) DEFAULT NULL,
        `numero_documento` varchar(255) DEFAULT NULL,
        PRIMARY KEY (`id`)
    );

DROP TABLE IF EXISTS configuracionplancuenta;

CREATE TABLE
    `configuracionplancuenta` (
        `id` int(11) NOT NULL AUTO_INCREMENT,
        `cuentaClientes` int(11) NOT NULL,
        `cuentaProveedores` int(11) NOT NULL,
        `cuentaProducto` int(11) NOT NULL,
        `cuentaVendedores` int(11) NOT NULL,
        PRIMARY KEY (`id`)
    );

DROP TABLE IF EXISTS entradaalmacen;

CREATE TABLE
    `entradaalmacen` (
        `id` int(11) NOT NULL AUTO_INCREMENT,
        `ordenCompraId` int(11) NOT NULL,
        `VProductoId` int(11) NOT NULL,
        `VProveedoreId` int(11) NOT NULL,
        `cantidad` int(11) NOT NULL,
        `precioCompra` decimal(10, 2) NOT NULL,
        `precioTotal` decimal(10, 2) NOT NULL,
        `fechaVencimiento` datetime NOT NULL,
        `lote` text NOT NULL,
        `almacenId` int(11) NOT NULL,
        PRIMARY KEY (`id`)
    );

DROP TABLE IF EXISTS estadoordencompra;

CREATE TABLE
    `estadoordencompra` (
        `id` int(11) NOT NULL AUTO_INCREMENT,
        `nombreEstadoOrdenCompra` text NOT NULL,
        PRIMARY KEY (`id`)
    );

DROP TABLE IF EXISTS estadoventa;
CREATE TABLE
    `estadoventa` (
        `id` int(11) NOT NULL AUTO_INCREMENT,
        `nombreEstadoVenta` text NOT NULL,
        PRIMARY KEY (`id`)
    );
DROP TABLE IF EXISTS movimiento;
CREATE TABLE
    `movimiento` (
        `id` int(11) NOT NULL AUTO_INCREMENT,
        `nombreAsiento` text NOT NULL,
        `tipoAsientoId` int(11) NOT NULL,
        `asientoId` int(11) NOT NULL,
        `fechaMovimiento` datetime NOT NULL,
        `VPlancuentaId` int(11) NOT NULL,
        `nombrePlanCuenta` text NOT NULL,
        `descripcion` text NOT NULL,
        `debe` decimal(10, 2) NOT NULL,
        `haber` decimal(10, 2) NOT NULL,
        PRIMARY KEY (`id`)
    );
DROP TABLE IF EXISTS ordencompra;
CREATE TABLE
    `ordencompra` (
        `id` int(11) NOT NULL AUTO_INCREMENT,
        `codigoOrden` text NOT NULL,
        `VProveedoreId` int(11) NOT NULL,
        `totalLiteral` text NOT NULL,
        `descripcion` text NOT NULL,
        `total` decimal(10, 2) NOT NULL,
        `fechaCreacion` datetime NOT NULL,
        `usuarioId` int(11) NOT NULL,
        `nit` text NOT NULL,
        `telefono` text NOT NULL,
        `asientoId` int(11) NOT NULL,
        `estadoId` int(11) NOT NULL,
        PRIMARY KEY (`id`)
    );
DROP TABLE IF EXISTS ordencompraproducto;
CREATE TABLE
    `ordencompraproducto` (
        `id` int(11) NOT NULL AUTO_INCREMENT,
        `VProductoId` int(11) NOT NULL,
        `cantidad` int(11) NOT NULL,
        `precioCompra` decimal(10, 2) NOT NULL,
        `precioTotal` decimal(10, 2) NOT NULL,
        `ordenCompraId` int(11) NOT NULL,
        PRIMARY KEY (`id`)
    );
DROP TABLE IF EXISTS parametro;
CREATE TABLE
    `parametro` (
        `id` bigint(20) NOT NULL AUTO_INCREMENT,
        `codigo_clasificador` varchar(255) NOT NULL,
        `codigo_tipo_parametro` varchar(255) DEFAULT NULL,
        `descripcion` varchar(255) NOT NULL,
        PRIMARY KEY (`id`)
    );
DROP TABLE IF EXISTS permiso;
CREATE TABLE
    `permiso` (
        `permisoId` int(11) NOT NULL AUTO_INCREMENT,
        `nombre` varchar(100) NOT NULL,
        `ruta` varchar(400) NOT NULL,
        PRIMARY KEY (`permisoId`)
    );
DROP TABLE IF EXISTS permisos;
CREATE TABLE
    `permisos` (
        `permisoId` int(11) NOT NULL,
        `rolId` int(11) NOT NULL
    );
DROP TABLE IF EXISTS persona;
CREATE TABLE
    `persona` (
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
    );
DROP TABLE IF EXISTS productomaestro;
CREATE TABLE
    `productomaestro` (
        `productomaestroid` int(11) NOT NULL AUTO_INCREMENT,
        `nombre` varchar(200) NOT NULL,
        `categoriaid` int(11) DEFAULT NULL,
        PRIMARY KEY (`productomaestroid`)
    );
DROP TABLE IF EXISTS rol;
CREATE TABLE
    `rol` (
        `rolId` int(11) NOT NULL AUTO_INCREMENT,
        `nombre` varchar(20) NOT NULL,
        PRIMARY KEY (`rolId`),
        UNIQUE KEY `nombre` (`nombre`)
    );
DROP TABLE IF EXISTS roles;
CREATE TABLE
    `roles` (
        `rolesId` int(11) NOT NULL AUTO_INCREMENT,
        `usuarioId` int(11) NOT NULL,
        `rolId` int(11) NOT NULL,
        PRIMARY KEY (`rolesId`)
    );
DROP TABLE IF EXISTS salidaalmacen;
CREATE TABLE
    `salidaalmacen` (
        `id` int(11) NOT NULL AUTO_INCREMENT,
        `ventaId` int(11) NOT NULL,
        `VProductoId` int(11) NOT NULL,
        `VProveedoreId` int(11) NOT NULL,
        `cantidad` int(11) NOT NULL,
        `precioCompra` decimal(10, 2) NOT NULL,
        `precioTotal` decimal(10, 2) NOT NULL,
        `lote` text NOT NULL,
        `almacenId` int(11) NOT NULL,
        PRIMARY KEY (`id`)
    );
DROP TABLE IF EXISTS stockalmacen;
CREATE TABLE
    `stockalmacen` (
        `id` int(11) NOT NULL AUTO_INCREMENT,
        `VProveedoreId` int(11) NOT NULL,
        `VProductoId` int(11) NOT NULL,
        `cantidad` int(11) NOT NULL,
        `precioUnitario` decimal(10, 2) NOT NULL,
        `precioTotal` decimal(10, 2) NOT NULL,
        `stockAlert` int(11) NOT NULL,
        PRIMARY KEY (`id`)
    );
DROP TABLE IF EXISTS sucursal;
CREATE TABLE
    `sucursal` (
        `id` int(11) NOT NULL,
        `codigo` int(11) NOT NULL,
        `departamento` varchar(255) DEFAULT NULL,
        `direccion` varchar(255) DEFAULT NULL,
        `municipio` varchar(255) DEFAULT NULL,
        `nombre` varchar(255) DEFAULT NULL,
        `telefono` varchar(255) DEFAULT '0',
        `id_empresa` int(11) NOT NULL,
        PRIMARY KEY (`id`)
    );
DROP TABLE IF EXISTS tipoasiento;
CREATE TABLE
    `tipoasiento` (
        `id` int(11) NOT NULL AUTO_INCREMENT,
        `nombreTipoAsiento` text NOT NULL,
        PRIMARY KEY (`id`)
    );
DROP TABLE IF EXISTS usuario;
CREATE TABLE
    `usuario` (
        `usuarioId` int(11) NOT NULL AUTO_INCREMENT,
        `usuario` varchar(30) DEFAULT NULL,
        `password` varchar(64) DEFAULT NULL,
        `personaId` int(11) NOT NULL,
        `habilitado` tinyint(1) NOT NULL,
        PRIMARY KEY (`usuarioId`),
        UNIQUE KEY `usuario` (`usuario`, `habilitado`)
    );
DROP TABLE IF EXISTS valmacen;
CREATE TABLE
    `valmacen` (
        `id` int(11) NOT NULL AUTO_INCREMENT,
        `codigoAlmacen` text NOT NULL,
        `dirrecion` text NOT NULL,
        `nombreAlmacen` text NOT NULL,
        PRIMARY KEY (`id`)
    );
DROP TABLE IF EXISTS vclientes;
CREATE TABLE
    `vclientes` (
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
    );
DROP TABLE IF EXISTS venta;
CREATE TABLE
    `venta` (
        `id` int(11) NOT NULL AUTO_INCREMENT,
        `codigoVenta` text NOT NULL,
        `VClienteId` int(11) NOT NULL,
        `totalLiteral` text NOT NULL,
        `descripcion` text NOT NULL,
        `total` decimal(10, 2) NOT NULL,
        `fechaCreacion` datetime NOT NULL,
        `usuarioId` int(11) NOT NULL,
        `nit` text NOT NULL,
        `telefono` text NOT NULL,
        `asientoId` int(11) NOT NULL,
        `estadoId` int(11) NOT NULL,
        PRIMARY KEY (`id`)
    );
DROP TABLE IF EXISTS ventaproducto;
CREATE TABLE
    `ventaproducto` (
        `id` int(11) NOT NULL AUTO_INCREMENT,
        `VProductoId` int(11) NOT NULL,
        `cantidad` int(11) NOT NULL,
        `precioUnitario` decimal(10, 2) NOT NULL,
        `precioTotal` decimal(10, 2) NOT NULL,
        `ventaId` int(11) NOT NULL,
        PRIMARY KEY (`id`)
    );
DROP TABLE IF EXISTS vmoneda;
CREATE TABLE
    `vmoneda` (
        `id` int(11) NOT NULL AUTO_INCREMENT,
        `nombreMoneda` text NOT NULL,
        PRIMARY KEY (`id`)
    );
DROP TABLE IF EXISTS vnivel;
CREATE TABLE
    `vnivel` (
        `id` int(11) NOT NULL AUTO_INCREMENT,
        `nombreNivel` text NOT NULL,
        PRIMARY KEY (`id`)
    );
DROP TABLE IF EXISTS vplanclientes;
CREATE TABLE
    `vplanclientes` (
        `id` int(11) NOT NULL AUTO_INCREMENT,
        `codigo` text NOT NULL,
        `nombreCuenta` text NOT NULL,
        `moneda` text NOT NULL,
        `valor` decimal(20, 2) NOT NULL,
        `codigoIdentificador` text NOT NULL,
        `nivel` int(11) NOT NULL,
        `debe` decimal(20, 2) NOT NULL,
        `haber` decimal(20, 2) NOT NULL,
        `VPlanCuentaId` int(11) NOT NULL,
        PRIMARY KEY (`id`)
    );
DROP TABLE IF EXISTS vplancuenta;
CREATE TABLE
    `vplancuenta` (
        `id` int(11) NOT NULL AUTO_INCREMENT,
        `codigo` text NOT NULL,
        `nombreCuenta` text NOT NULL,
        `moneda` text NOT NULL,
        `valor` decimal(20, 2) NOT NULL,
        `codigoIdentificador` text NOT NULL,
        `nivel` int(11) NOT NULL,
        `debe` decimal(20, 2) NOT NULL,
        `haber` decimal(20, 2) NOT NULL,
        `VPlanCuentaId` int(11) NOT NULL,
        PRIMARY KEY (`id`)
    );
DROP TABLE IF EXISTS vplanproductos;
CREATE TABLE
    `vplanproductos` (
        `id` int(11) NOT NULL AUTO_INCREMENT,
        `codigo` text NOT NULL,
        `nombreCuenta` text NOT NULL,
        `moneda` text NOT NULL,
        `valor` decimal(20, 2) NOT NULL,
        `codigoIdentificador` text NOT NULL,
        `nivel` int(11) NOT NULL,
        `debe` decimal(20, 2) NOT NULL,
        `haber` decimal(20, 2) NOT NULL,
        `VPlanCuentaId` int(11) NOT NULL,
        PRIMARY KEY (`id`)
    );
DROP TABLE IF EXISTS vplanproveedores;
CREATE TABLE
    `vplanproveedores` (
        `id` int(11) NOT NULL AUTO_INCREMENT,
        `codigo` text NOT NULL,
        `nombreCuenta` text NOT NULL,
        `moneda` text NOT NULL,
        `valor` decimal(20, 2) NOT NULL,
        `codigoIdentificador` text NOT NULL,
        `nivel` int(11) NOT NULL,
        `debe` decimal(20, 2) NOT NULL,
        `haber` decimal(20, 2) NOT NULL,
        `VPlanCuentaId` int(11) NOT NULL,
        PRIMARY KEY (`id`)
    );
DROP TABLE IF EXISTS vproducto;
CREATE TABLE
    `vproducto` (
        `productoid` int(11) NOT NULL AUTO_INCREMENT,
        `codigoProducto` text NOT NULL,
        `codigoBarra` text NOT NULL,
        `nombreProducto` text NOT NULL,
        `unidadMedida` text NOT NULL,
        `stockMinimo` int(11) NOT NULL,
        `precioCompra` decimal(10, 0) NOT NULL,
        `utilidadMin` decimal(10, 0) NOT NULL,
        `PrecioVentaMin` decimal(10, 0) NOT NULL,
        `utilidadMax` decimal(10, 0) NOT NULL,
        `PrecioVentaMax` decimal(10, 0) NOT NULL,
        `proveedorId` int(11) NOT NULL,
        `productomaestroid` int(11) DEFAULT NULL,
        PRIMARY KEY (`productoid`)
    );
DROP TABLE IF EXISTS vproductoimagenes;
CREATE TABLE
    `vproductoimagenes` (
        `id` int(11) NOT NULL AUTO_INCREMENT,
        `nombre` text NOT NULL,
        `VproductoId` int(11) NOT NULL,
        PRIMARY KEY (`id`)
    );
DROP TABLE IF EXISTS vproveedor;
CREATE TABLE
    `vproveedor` (
        `id` int(11) NOT NULL AUTO_INCREMENT,
        `codigoProveedor` text NOT NULL,
        `nombreProveedor` text NOT NULL,
        `dirrecion` text NOT NULL,
        `telefono` text NOT NULL,
        `contacto` text NOT NULL,
        `PlanCuentaId` int(11) NOT NULL,
        PRIMARY KEY (`id`)
    );

##despliege de en estado 


DROP TABLE IF EXISTS movimientoAlmacen;
CREATE TABLE `movimientoAlmacen` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `productoId` int(11) NOT NULL,
  `entradaId` int(11) NOT NULL,
  `salidaId` int(11) NOT NULL,
  `fecha` datetime DEFAULT NULL,
  `cantidad` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
)