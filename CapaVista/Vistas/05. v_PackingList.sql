USE [ITS]
GO

/****** Object:  View [dbo].[v_PackingList]    Script Date: 8/04/2024 16:51:23 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO






-- select * from v_PackingList
Create VIEW  [dbo].[v_PackingList] AS


select
emp.vNombEmpresa,
emp.vRuc,
emp.vDireccion vDireccionEmpresa,
per.vNombComp,
per.vnrodoc,
per.vDireccion vDireccionCliente,
per.vContacto,
sal.dtfechamov hora,
sal.iidSalida,
sal.dtfechamov fecha,
dpar01.vValor vReferencia,
modalm.vCodMOdelo,
modalm.vNombreModelo,
modalm.vNombreModeloSinMarca,
modalm.vNombFamilia,
modalm.vNombColor,
modalm.vNombTitulo,
saldet.iCantidadPaquete,
saldet.itotalProductos,
saldet.dcPesoNeto

from
Tm_Empresa				emp,
Tm_Salida				sal,
Tm_SalidaDetalle		saldet,
v_Personas				per,
Td_Parametros			dpar01,
v_ModeloAlmacen			modalm

where 

emp.iidEmpresa = per.iidEmpresa
 and sal.iidsalida = saldet.iidSalida--and sal.iidMovimiento= 1
 and per.iidpersona = sal.iidPersona
 and dpar01.iidDetalleParametro = sal.iTipoReferencia and dpar01.iidParametro=26
 and saldet.iidModeloAlmacen = modalm.iidmodeloalmacen







GO


