--Creacion de Resgistro 

-- tm Empresa
--select * from tm_empresa 
insert into tm_empresa values ('ARLEY',null,null,'20383372543','HUACHIPA',null,null,null,null,1)
insert into tm_empresa values ('HILTEX',null,null,'20383372543','HUACHIPA',null,null,null,null,1)


-- Tm_Parametros
-- select * from Tm_Parametros 
insert into Tm_Parametros values (1, 1,'Tipo de Parametros',1,null,null,null,null,1)
insert into Tm_Parametros values (2, 1,'Modulos',2,null,null,null,null,1)
insert into Tm_Parametros values (3, 1,'Tipos de Procesos',1,null,null,null,null,1)
insert into Tm_Parametros values (4, 1,'SI/NO',1,null,null,null,null,1)
insert into Tm_Parametros values (5, 1,'TIPOS DE DOCUMENTOS',1,null,null,null,null,1)
insert into Tm_Parametros values (6, 1,'AREAS DE LA EMPRESA',1,null,null,null,null,1)
insert into Tm_Parametros values (7, 1,'CARGOS DE LA EMPRESA',1,null,null,null,null,1)
insert into Tm_Parametros values (8, 1,'TIPOS DE PERSONA',1,null,null,null,null,1)
insert into Tm_Parametros values (9, 1,'TIPOS DE MONEDAS',1,null,null,null,null,1)
insert into Tm_Parametros values (10,1,'TIPOS DE PRODUCTO',1,null,null,null,null,1)
insert into Tm_Parametros values (11,1,'TIPOS DE MODELO',1,null,null,null,null,1)
insert into Tm_Parametros values (12,1,'TIPOS DE COLORES',1,null,null,null,null,1)
insert into Tm_Parametros values (13,1,'TIPOS DE MOVIMIENTOS',1,null,null,null,null,1)
insert into Tm_Parametros values (14,1,'GRUPO DE MOVIMIENTOS ENTRADA',1,null,null,null,null,1)
insert into Tm_Parametros values (15,1,'GRUPO DE MOVIMIENTOS SALIDA',1,null,null,null,null,1)
insert into Tm_Parametros values (16,1,'TIPOS DE ALMACEN',1,null,null,null,null,1)
insert into Tm_Parametros values (17,1,'TIPOS DE PRECIOS - MODELO ALMACEN',1,null,null,null,null,1)
insert into Tm_Parametros values (18,1,'TIPOS ALERTA DE STOCK',1,null,null,null,null,1)
insert into Tm_Parametros values (19,1,'TIPOS DE REPORTE',1,null,null,null,null,1)
insert into Tm_Parametros values (20,1,'TIPOS DE USUARIO',1,null,null,null,null,1)
insert into Tm_Parametros values (21,1,'TIPOS DE CLIENTE',1,null,null,null,null,1)
insert into Tm_Parametros values (22,1,'TIPOS DE PRODUCTO HILADO',1,null,null,null,null,1)
insert into Tm_Parametros values (23,1,'TIPOS DE EMPAQUE HILADO',1,null,null,null,null,1)
insert into Tm_Parametros values (24,1,'MODO INGRESO HILADOS',1,null,null,null,null,1)
insert into Tm_Parametros values (25,1,'ESTADOS',1,null,null,null,null,1)
insert into Tm_Parametros values (26,1,'TIPOS REFERENCIA - MOVIMIENTO SALIDA ',1,null,null,null,null,1)
insert into Tm_Parametros values (27,1,'TIPOS DE PROVEEDOR',1,null,null,null,null,1)
insert into Tm_Parametros values (28,1,'ESTADOS ENTRADA',1,null,null,null,null,1)
insert into Tm_Parametros values (29,1,'ESTADOS SALIDA',1,null,null,null,null,1)

-- Td_Parametros
-- select * from Td_Parametros
-- delete from Td_Parametros  


insert into Td_Parametros values(1,1,'Sistema',null,null,null,null,null,null,null,null,null,1)
insert into Td_Parametros values(2,1,'Modulo',null,null,null,null,null,null,null,null,null,1)
insert into Td_Parametros values(3,1,'Mensaje',null,null,null,null,null,null,null,null,null,1)
insert into Td_Parametros values(1,2,'CONFIGURACION',null,null,null,null,null,null,null,null,null,1)
insert into Td_Parametros values(2,2,'SEGURIDAD',null,null,null,null,null,null,null,null,null,0)
insert into Td_Parametros values(3,2,'ALMACEN',null,null,null,null,null,null,null,null,null,0)
insert into Td_Parametros values(4,2,'PRODUCCION',null,null,null,null,null,null,null,null,null,0)
insert into Td_Parametros values(5,2,'VENTAS - ALMACEN',null,null,null,null,null,null,null,null,null,1)
insert into Td_Parametros values(1,3,'Procesos de Produccion',null,null,null,null,null,null,null,null,null,1)
insert into Td_Parametros values(2,3,'Procesos de Almacen',null,null,null,null,null,null,null,null,null,1)
insert into Td_Parametros values(3,3,'Procesos de Venta',null,null,null,null,null,null,null,null,null,1)
insert into Td_Parametros values(1,4,'SI',null,null,null,null,null,null,null,null,null,1)
insert into Td_Parametros values(2,4,'NO',null,null,null,null,null,null,null,null,null,1)
insert into Td_Parametros values(1,5,'DNI',null,null,null,null,null,null,null,null,null,1)
insert into Td_Parametros values(2,5,'CARNET DE EXTRANJERIA',null,null,null,null,null,null,null,null,null,1)
insert into Td_Parametros values(3,5,'RUC',null,null,null,null,null,null,null,null,null,1)
insert into Td_Parametros values(1,6,'DPT. VENTAS',null,null,null,null,null,null,null,null,null,1)
insert into Td_Parametros values(2,6,'DPT. FACTURACION',null,null,null,null,null,null,null,null,null,1)
insert into Td_Parametros values(3,6,'DPT. ALMACEN',null,null,null,null,null,null,null,null,null,1)
insert into Td_Parametros values(4,6,'GERENCIA GENERAL',null,null,null,null,null,null,null,null,null,1)
insert into Td_Parametros values(5,6,'DPT. PRODUCCION',null,null,null,null,null,null,null,null,null,1)
insert into Td_Parametros values(1,7,'ADMINISTRADOR TI',null,null,null,null,null,null,null,null,null,1)
insert into Td_Parametros values(2,7,'VENDEDOR',null,null,null,null,null,null,null,null,null,1)
insert into Td_Parametros values(3,7,'SUPERVISOR',null,null,null,null,null,null,null,null,null,1)
insert into Td_Parametros values(4,7,'ALMACENERO',null,null,null,null,null,null,null,null,null,1)
insert into Td_Parametros values(5,7,'JEFE DE AREA',null,null,null,null,null,null,null,null,null,1)
insert into Td_Parametros values(1,8,'NATURAL',null,null,null,null,null,null,null,null,null,1)
insert into Td_Parametros values(2,8,'JURIDICA',null,null,null,null,null,null,null,null,null,1)
insert into Td_Parametros values(1,9,'SOLES',null,null,null,null,null,null,null,null,null,1)
insert into Td_Parametros values(2,9,'DOLARES',null,null,null,null,null,null,null,null,null,1)
insert into Td_Parametros values(1,10,'HILADO',null,null,null,null,null,null,null,null,null,1)
insert into Td_Parametros values(2,10,'PRODUCTO EN PROCESO',null,null,null,null,null,null,null,null,null,1)
insert into Td_Parametros values(1,11,'MODELO TERMINADO',null,null,null,null,null,null,null,null,null,1)
insert into Td_Parametros values(2,11,'MODELO EN PROCESO',null,null,null,null,null,null,null,null,null,1)
insert into Td_Parametros values(1,12,'SIMPLE',null,null,null,null,null,null,null,null,null,1)
insert into Td_Parametros values(2,12,'COMPUESTO',null,null,null,null,null,null,null,null,null,1)
insert into Td_Parametros values(1,13,'ENTRADA',null,null,null,null,null,null,null,null,null,1)
insert into Td_Parametros values(2,13,'SALIDA',null,null,null,null,null,null,null,null,null,1)
insert into Td_Parametros values(1,14,'ENTRADA - PROVEEDOR',null,null,null,null,null,null,null,null,null,1)
insert into Td_Parametros values(2,14,'ENTRADA - TRASLADO DE ALMACEN',null,null,null,null,null,null,null,null,null,1)
insert into Td_Parametros values(3,14,'ENTRADA - DEVOLUCIÓN PRODUCTO',null,null,null,null,null,null,null,null,null,1)
insert into Td_Parametros values(4,14,'ENTRADA - INVENTARIO',null,null,null,null,null,null,null,null,null,1)
insert into Td_Parametros values(1,15,'SALIDA - VENTA',null,null,null,null,null,null,null,null,null,1)
insert into Td_Parametros values(2,15,'SALIDA - DEVOLUCIÓN PRODUCTO',null,null,null,null,null,null,null,null,null,1)
insert into Td_Parametros values(3,15,'SALIDA - TRASLADO DE ALMACEN',null,null,null,null,null,null,null,null,null,1)
insert into Td_Parametros values(4,15,'SALIDA - AJUSTE DE ALMACEN',null,null,null,null,null,null,null,null,null,1)
insert into Td_Parametros values(5,15,'SALIDA - VENTA',null,null,null,null,null,null,null,null,null,1)
insert into Td_Parametros values(1,16,'ALMACEN PT',null,null,null,null,null,null,null,null,null,1)
insert into Td_Parametros values(2,16,'ALMACEN - TIENDA',null,null,null,null,null,null,null,null,null,1)
insert into Td_Parametros values(3,16,'ALMACEN - PP',null,null,null,null,null,null,null,null,null,1)
insert into Td_Parametros values(4,16,'ALMACEN - MP',null,null,null,null,null,null,null,null,null,1)
insert into Td_Parametros values(1,17,'PRECIO DE COSTO',null,null,null,null,null,null,null,null,null,1)
insert into Td_Parametros values(2,17,'PRECIO DE VENTA',null,null,null,null,null,null,null,null,null,1)

insert into Td_Parametros values(1,18,'VERDE',null,null,null,null,null,null,null,null,null,1)
insert into Td_Parametros values(2,18,'AMBAR',null,null,null,null,null,null,null,null,null,1)
insert into Td_Parametros values(3,18,'URGENTE',null,null,null,null,null,null,null,null,null,1)
insert into Td_Parametros values(0,18,'NEUTRO',null,null,null,null,null,null,null,null,null,1)
insert into Td_Parametros values(1,19,'REPORTES DETALLADO',null,null,null,null,null,null,null,null,null,1)
insert into Td_Parametros values(2,19,'REPORTES CONSOLIDADO',null,null,null,null,null,null,null,null,null,1)
insert into Td_Parametros values(3,19,'REPORTES RANKING',null,null,null,null,null,null,null,null,null,1)
insert into Td_Parametros values(4,19,'REPORTES GRAFICOS',null,null,null,null,null,null,null,null,null,1)
insert into Td_Parametros values(5,14,'ENTRADA - PRODUCCIÓN',null,null,null,null,null,null,null,null,null,1)
insert into Td_Parametros values(1,20,'ADMINISTRADOR',null,null,null,null,null,null,null,null,null,1)
insert into Td_Parametros values(2,20,'GENERICO',null,null,null,null,null,null,null,null,null,1)
insert into Td_Parametros values(1,21,'TIPO 1',null,null,null,null,null,null,null,null,null,1)
insert into Td_Parametros values(2,21,'TIPO 2',null,null,null,null,null,null,null,null,null,1)
insert into Td_Parametros values(3,21,'TIPO 3',null,null,null,null,null,null,null,null,null,1)
insert into Td_Parametros values(1,22,'CONO',null,null,null,null,null,null,null,null,null,1)
insert into Td_Parametros values(2,22,'BOBINA',null,null,null,null,null,null,null,null,null,1)
insert into Td_Parametros values(1,23,'CAJA',null,null,null,null,null,null,null,null,null,1)
insert into Td_Parametros values(1,24,'UNO A UNO',null,null,null,null,null,null,null,null,null,1)
insert into Td_Parametros values(2,24,'VARIOS',null,null,null,null,null,null,null,null,null,1)

insert into Td_Parametros values(0,25,'ELIMINADO',null,null,null,null,null,null,null,null,null,1)
insert into Td_Parametros values(1,25,'ACTIVO',null,null,null,null,null,null,null,null,null,1)
insert into Td_Parametros values(2,25,'PROCESADO',null,null,null,null,null,null,null,null,null,1)

insert into Td_Parametros values(0,26,'SIN REFERECIA',null,null,null,null,null,null,null,null,null,1)
insert into Td_Parametros values(1,26,'CON FACTURA',null,null,null,null,null,null,null,null,null,1)
insert into Td_Parametros values(2,26,'SIN FACTURA',null,null,null,null,null,null,null,null,null,1)

insert into Td_Parametros values(1,27,'TIPO 1',null,null,null,null,null,null,null,null,null,1)
insert into Td_Parametros values(2,27,'TIPO 2',null,null,null,null,null,null,null,null,null,1)
insert into Td_Parametros values(3,27,'TIPO 3',null,null,null,null,null,null,null,null,null,1)

insert into Td_Parametros values(0,28,'ELIMINADO',null,null,null,null,null,null,null,null,null,1) --ENTRADA
insert into Td_Parametros values(1,28,'ACTIVO',null,null,null,null,null,null,null,null,null,1)
insert into Td_Parametros values(2,28,'VENDIDO',null,null,null,null,null,null,null,null,null,1)
insert into Td_Parametros values(3,28,'DIVIDIDO',null,null,null,null,null,null,null,null,null,1)

insert into Td_Parametros values(0,29,'ELIMINADO',null,null,null,null,null,null,null,null,null,1) --SALIDA
insert into Td_Parametros values(1,29,'ACTIVO',null,null,null,null,null,null,null,null,null,1)



-- Tm_Persona
-- select * from Tm_Persona 
insert into Tm_Persona values (1,1,1,'44911435','Calle QUipan 185','',null,null,null,null,1)
insert into Tm_Persona values (1,1,1,'22222222','direccionat02','',null,null,null,null,1)


-- Td_PersonaNatural
-- select * from Td_PersonaNatural 
insert into Td_PersonaNatural values (1,'CRISTIAN','ANTHONY','NULL','FERNANDEZ','PEREZ','CRISTIAN ANTHONY FERNANDEZ PEREZ',null,null,null,null,1)
insert into Td_PersonaNatural values (2,'CARLOS','','NULL','GUADALUPE','ARIAS','CARLOS GUADALUPE ARIAS',null,null,null,null,1)

-- Td_PersonaJuridica
-- select * from Td_PersonaJuridica 





-- Td_Empleado
-- select * from Td_Empleado 
insert into Td_Empleado values (1,1,1,null,null,null,null,null,1)
insert into Td_Empleado values (2,1,1,null,null,null,null,null,1)


-- Tm_Usuario
-- select * from Tm_Usuario 
insert into Tm_Usuario values (1,1,1,'ITSCRIFER','asdasd',0,0,1,null,null,null,null,1)
insert into Tm_Usuario values (1,2,2,'ITSCARARI','asdasd',0,0,1,null,null,null,null,1)



--Tm_cliente
-- select * from Tm_cliente
insert into Tm_cliente values(1,'cfernandezp@cafp.com','939079213',null,1,null,null,null,null,1)


--Tm_Proveedor
-- select * from Tm_Proveedor
insert into Tm_Proveedor values(1,'cfernandezp@cafp.com','939079213',null,1,null,null,null,null,1)


-- Tm_Almacen
--select * from Tm_Almacen
insert into Tm_Almacen values(1,'ALMACEN-TEXTIL',1,NULL,NULL,NULL,NULL,1)



--Td_UsuarioAlmacen
--select * from Td_UsuarioAlmacen

insert into Td_UsuarioAlmacen values(1,1,null,null,null,null,1)


--Tm_Tienda
--select * from Tm_Tienda
insert into Tm_Tienda values(1,'TIENDA-ARLEY',null,null,null,null,null,1)

--Td_TiendaAlmacen
-- select * from Td_TiendaAlmacen
insert into Td_TiendaAlmacen values(1,1,null,null,null,null,1)

--Td_UsuarioTienda
-- select * from Td_UsuarioTienda
insert into Td_UsuarioTienda values(1,1,null,null,null,null,1)



-- Tm_Familia
-- select * from Tm_Familia
--insert into Tm_Familia values(1,'ALGODON',null,null,null,null,1)


-- Tm_Marca
-- select * from Tm_Marca
--insert into Tm_Marca values(1,'VILARRAZA',null,null,null,null,1)


-- Tm_Titulo
-- select * from Tm_Titulo
--insert into Tm_Titulo values(1,'10/1',null,null,null,null,1)

-- Tm_Color
-- select * from Tm_Color
--insert into Tm_Color values(1,'CRUDO','CRD',1,null,null,null,null,1)

-- Tm_CatalogoProducto
/*
select * from Tm_CatalogoProducto
select * from Tm_ModeloProducto
*/


-- Tm_ModeloProducto
-- select * from Tm_ModeloProducto


--Tm_ModeloAlmacen

-- select * from Tm_ModeloAlmacen


--Tm_ModeloAlmacenPrecio


/*
--tm_movimiento
-- select * from tm_movimiento
insert into tm_movimiento values(1,1,1,1,1,'',1500,270,1770,10,100,100.1,0.1,'AAFAF2023','2020-09-20','2020-09-22',null,null,null,null,null,null,null,0,1)


--tm_movimientoDetalle
/* 
select * from tm_movimiento
select * from tm_movimientoDetalle
*/
insert into tm_movimientoDetalle values(1,1,1,12,1,10,10.01,0.01,1,150,1,'20230902203740','A1545DC14',15.00,null,null,null,null,1)
insert into tm_movimientoDetalle values(1,1,1,12,1,10,10.01,0.01,1,150,1,'20230902203741','A1545DC14',15.00,null,null,null,null,1)
insert into tm_movimientoDetalle values(1,1,1,12,1,10,10.01,0.01,1,150,1,'20230902203742','A1545DC14',15.00,null,null,null,null,1)
insert into tm_movimientoDetalle values(1,1,1,12,1,10,10.01,0.01,1,150,1,'20230902203744','A1545DC14',15.00,null,null,null,null,1)
insert into tm_movimientoDetalle values(1,1,1,12,1,10,10.01,0.01,1,150,1,'20230902203745','A1545DC14',15.00,null,null,null,null,1)
insert into tm_movimientoDetalle values(1,1,1,12,1,10,10.01,0.01,1,150,1,'20230902203746','A1545DC14',15.00,null,null,null,null,1)
insert into tm_movimientoDetalle values(1,1,1,12,1,10,10.01,0.01,1,150,1,'20230902203747','A1545DC14',15.00,null,null,null,null,1)
insert into tm_movimientoDetalle values(1,1,1,12,1,10,10.01,0.01,1,150,1,'20230902203748','A1545DC14',15.00,null,null,null,null,1)
insert into tm_movimientoDetalle values(1,1,1,12,1,10,10.01,0.01,1,150,1,'20230902203749','A1545DC14',15.00,null,null,null,null,1)
insert into tm_movimientoDetalle values(1,1,1,12,1,10,10.01,0.01,1,150,1,'20230902203750','A1545DC14',15.00,null,null,null,null,1)

*/

--Tm_UnidadMedida
-- select * from Tm_UnidadMedida
insert into Tm_UnidadMedida values('Kilogramo',1,'Kg',null,null,null,null,1)


--Tm_Kardex
/*
select * from Tm_Kardex
select * from Tm_ModeloAlmacen
*/



--Tm_KardexDetalle
/*
select * from Tm_Kardex
select * from Tm_KardexDetalle
select * from Tm_MovimientoDetalle

*/

--insert into Tm_KardexDetalle values(1,1)

--Tm_CorrelativoTablas
-- select * from Tm_CorrelativoTablas
insert into Tm_CorrelativoTablas values('Tm_KardexDetalle',1)
