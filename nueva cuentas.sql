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
SELECT *
FROM asiento as a
    INNER JOIN tipoasiento as ta on ta.id = a.`tipoasientoId`
    INNER JOIN asientovplancuenta as apc on apc.`asientoId` = a.id
    INNER JOIN vplancuenta as pc on apc.`VPlanCuentaId` = apc.`id`
    LEFT JOIN ordencompra as ocp on ocp.`asientoId` = a.id and ocp.`estadoId` = 2
    LEFT JOIN venta as v on v.`asientoId` = a.id and v.`estadoId` = 2;


SELECT * FROM ordencompra;

SELECT *
FROM venta
insert into
    parametro (
        codigo_clasificador,
        codigo_tipo_parametro,
        descripcion
    )
values (
        'demo',
        'demo',
        'Carnet de identidad'
    );