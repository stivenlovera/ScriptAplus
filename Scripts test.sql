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

SELECT
    vwmc.asientoId,
    vwmc.codigo,
    vwmc.fecha,
    vwmc.descripcion,
    vwmc.para,
    vwmc.total,
    vwmc.metodoPago,
    vwmc.nombreCuenta,
    vwmc.codigoCuenta,
    vwmc.PlanCuentaId,
    vwmc.realizado,
    vwmc.haber,
    vwmc.debe
FROM
    vwmovimiento_cuenta as vwmc;

SELECT
    vwg.asientoId,
    vwg.codigo,
    vwg.fecha,
    vwg.descripcion,
    vwg.para,
    vwg.total,
    vwg.metodoPago,
    vwg.realizado
FROM
    vwmovimiento_generales as vwg;

    select * from movimiento_general_cuenta;


SELECT * FROM venta LEFT JOIN ventaproducto on venta.id=ventaproducto.`ventaId` WHERE  ventaproducto.VProductoId=NULL
