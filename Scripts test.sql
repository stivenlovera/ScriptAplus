-- Active: 1687829054607@@127.0.0.1@3306@aplussistemaventa

-- Active: 1687829054607@@127.0.0.1@3306@aplussistemaventa-- Active: 1687829054607@@127.0.0.1@3306@aplussistemaventa-- Active: 1687829054607@@127.0.0.1@3306@aplussistemaventa-- Active: 1687829054607@@127.0.0.1@3306@aplussistemaventa-- Active: 1687829054607@@127.0.0.1@3306@aplussistemaventa

insert into
    persona (
        nombre,
        apellido,
        direccion,
        `fechaNacimiento`,
        email,
        telefono,
        ci,
        habilitado
    )
values (
        'Ali Stiven',
        'Lovera Huarachi',
        'no registrado',
        '1991-01-01',
        'stivenlovera@gmail.com',
        '75679775',
        '8963497',
        '1'
    );

insert into
    usuario (
        usuario,
        password,
        `personaId`,
        habilitado
    )
values ('admin', 'admin', '1', '1');

insert into rol (nombre) values ('administrador');

insert into roles (`usuarioId`, `rolId`) values (1, 1);

insert into permiso (nombre, ruta) values ('admin', '/demo');

insert into permisos (`permisoId`, `rolId`) values (1, 1);

insert into
    tipoasiento (`nombreTipoAsiento`)
values ('Venta'), ('Compra');

insert into
    estadoordencompra (`nombreEstadoOrdenCompra`)
values ('Pendiente'), ('Pagado'), ('Recibido');

##select de movimientos generales
SELECT
    a.id as `asientoId`,
    ocp.`codigoOrden` as codigo,
    ocp.`fechaCreacion` as fecha,
    ocp.descripcion,
    pv.`nombreProveedor` as para,
    ocp.total as total,
    ta.`nombreTipoAsiento` as metodoPago,
    pc.`nombreCuenta`,
    pc.codigo as codigoCuenta
    pc.id as `PlanCuentaId`,
    CONCAT(p.nombre, ' ', p.apellido) as realizado,
    IF(apc.rol = 'haber', ocp.total, 0) as haber,
    IF(apc.rol = 'debe', ocp.total, 0) as debe
FROM asiento as a
    INNER JOIN tipoasiento as ta on ta.id = a.`tipoasientoId`
    INNER JOIN asientovplancuenta as apc on apc.`asientoId` = a.id
    INNER JOIN vplancuenta as pc on apc.`VPlanCuentaId` = apc.`id`
    INNER JOIN ordencompra as ocp on ocp.`asientoId` = a.id and ocp.`estadoId` = 2
    INNER JOIN vproveedor as pv on ocp.`VProveedoreId` = pv.id
    INNER JOIN usuario as usu on ocp.`usuarioId` = usu.`usuarioId`
    INNER JOIN persona as p on p.`personaId` = usu.`personaId`;


SELECT * FROM ordencompra;

SELECT * FROM venta 