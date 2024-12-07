USE [ITS]
GO

/****** Object:  View [dbo].[v_Entradas]    Script Date: 29/12/2023 15:30:45 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


-- select * from v_Salidas
CREATE VIEW [dbo].[v_Salidas] AS

select 
	sal.iidSalida,
	alm.iidAlmacen,
	alm.vDescAlmacen,
	sal.iidPersona,
	vper01.vNombComp vNombPersona,
	vper01.vTipoPersona,
	vper01.vTtipoDoc,
	vper01.vNroDoc,
	sal.iidEmpleado,
	vper02.vNombComp vNombEmpleado,
	sal.iGrupMovimiento,
	dpar02.vValor vGrupMovimiento,
	sal.iTipoReferencia,
	dpar03.vValor vTipoReferencia,
	sal.vObservaciones,
	sal.dcSubtotal,
	sal.dcIgv,
	sal.dcTotal,
	sal.itotalPaquetes,
	sal.dcTotalPesoNeto,
	sal.dcTotalBruto,
	sal.dcTotalTara,
	--sal.vDua,
	sal.dtfechaEE,
	sal.dtfechamov,
	sal.dtfechaCierre,
	sal.iidAlmacenReferido,
	sal.iidMovReferido,
	sal.iidUsuCrea,
	sal.dtFecCrea,
	sal.iidUsuMod,
	sal.dtFecMod,
	sal.iCerrado,
	sal.cstatus
from 
	Tm_Salida sal,
	Tm_Almacen alm,	
	Td_Empleado emp,
	v_Personas vper01,
	v_Personas vper02,	
	Td_Parametros dpar02,
	Td_Parametros dpar03


where
	sal.iidAlmacen = alm.iidAlmacen
	and sal.iidpersona =vper01.iidpersona -- Cliente / Proveedor
	and sal.iidEmpleado = emp.iidEmpleado and vper02.iidpersona = emp.iidEmpleado -- Empleado
	--and dpar01.iidDetalleParametro = mov.iTipoMovimiento and dpar01.iidParametro=13 
	and dpar02.iidDetalleParametro = sal.iGrupMovimiento and dpar02.iidParametro=14
	and dpar03.iidDetalleParametro = sal.iTipoReferencia and dpar03.iidParametro=26
	and sal.cstatus='1'





GO


