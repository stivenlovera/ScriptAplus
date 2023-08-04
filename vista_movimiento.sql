-- Active: 1679545701306@@127.0.0.1@3306@aplussistemaventa
--VISTAS
-- movimiento general
DROP VIEW IF EXISTS vwmovimiento_cuenta;
CREATE VIEW 
vwmovimiento_cuenta AS 
(
    SELECT
        a.id as `asientoId`,
        ocp.`codigoOrden` as codigo,
        ocp.`fechaCreacion` as fecha,
        ocp.descripcion,
        pv.`nombreProveedor` as para,
        ocp.total as total,
        ta.`nombreTipoAsiento` as metodoPago,
        pc.`nombreCuenta`,
        pc.codigo as codigoCuenta,
        pc.id as `PlanCuentaId`,
        CONCAT(p.nombre, ' ', p.apellido) as realizado,
        IF(apc.rol = 'haber', ocp.total, 0) as haber,
        IF(apc.rol = 'debe', ocp.total, 0) as debe
    FROM asiento as a
        INNER JOIN tipoasiento as ta on ta.id = a.`tipoasientoId`
        INNER JOIN asientovplancuenta as apc on apc.`asientoId` = a.id
        INNER JOIN vplancuenta as pc on pc.id = apc.`VPlanCuentaId`
        INNER JOIN ordencompra as ocp on ocp.`asientoId` = a.id and ocp.`estadoId` = 2
        INNER JOIN vproveedor as pv on ocp.`VProveedoreId` = pv.id
        INNER JOIN usuario as usu on ocp.`usuarioId` = usu.`usuarioId`
        INNER JOIN persona as p on p.`personaId` = usu.`personaId`
)
UNION ALL (
    SELECT
        a.id as `asientoId`,
        v.`codigoVenta` as codigo,
        v.`fechaCreacion` as fecha,
        v.descripcion,
        vc.nombreCompletoCliente as para,
        v.total as total,
        ta.`nombreTipoAsiento` as metodoPago,
        pc.`nombreCuenta`,
        pc.codigo as codigoCuenta,
        pc.id as `PlanCuentaId`,
        CONCAT(p.nombre, ' ', p.apellido) as realizado,
        IF(apc.rol = 'haber', v.total, 0) as haber,
        IF(apc.rol = 'debe', v.total, 0) as debe
    FROM asiento as a
        INNER JOIN tipoasiento as ta on ta.id = a.`tipoasientoId`
        INNER JOIN asientovplancuenta as apc on apc.`asientoId` = a.id
        INNER JOIN vplancuenta as pc on pc.id = apc.`VPlanCuentaId`
        INNER JOIN venta as v on v.`asientoId` = a.id and v.`estadoId` = 2
        INNER JOIN vclientes as vc on v.`VClienteId` = vc.id
        INNER JOIN usuario as usu on v.`usuarioId` = usu.`usuarioId`
        INNER JOIN persona as p on p.`personaId` = usu.`personaId`
);
DROP VIEW IF EXISTS vwmovimiento_generales;
CREATE VIEW 
vwmovimiento_generales AS 
(
    SELECT
        a.id as `asientoId`,
        ocp.`codigoOrden` as codigo,
        ocp.`fechaCreacion` as fecha,
        ocp.descripcion,
        pv.`nombreProveedor` as para,
        ocp.total as total,
        ta.`nombreTipoAsiento` as metodoPago,
        CONCAT(p.nombre, ' ', p.apellido) as realizado
    FROM asiento as a
        INNER JOIN tipoasiento as ta on ta.id = a.`tipoasientoId`
        INNER JOIN ordencompra as ocp on ocp.`asientoId` = a.id and ocp.`estadoId` = 2
        INNER JOIN vproveedor as pv on ocp.`VProveedoreId` = pv.id
        INNER JOIN usuario as usu on ocp.`usuarioId` = usu.`usuarioId`
        INNER JOIN persona as p on p.`personaId` = usu.`personaId`
)
UNION ALL (
    SELECT
        a.id as `asientoId`,
        v.`codigoVenta` as codigo,
        v.`fechaCreacion` as fecha,
        v.descripcion,
        vc.`nombreCompletoCliente` as para,
        v.total as total,
        ta.`nombreTipoAsiento` as metodoPago,
        CONCAT(p.nombre, ' ', p.apellido) as realizado
    FROM asiento as a
        INNER JOIN tipoasiento as ta on ta.id = a.`tipoasientoId`
        INNER JOIN venta as v on v.`asientoId` = a.id and v.`estadoId` = 2
        INNER JOIN vclientes as vc on v.`VClienteId` = vc.id
        INNER JOIN usuario as usu on v.`usuarioId` = usu.`usuarioId`
        INNER JOIN persona as p on p.`personaId` = usu.`personaId`
)