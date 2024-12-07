USE [ITS]
GO

/****** Object:  View [dbo].[v_Movimientos]    Script Date: 6/12/2023 16:17:25 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO




-- select * from v_Movimientos
CREATE VIEW [dbo].[v_stock_hilados] AS

select 
	mov.iidMovimiento,
	alm.iidAlmacen,
	alm.vDescAlmacen,
	mov.iidPersona,
	vper01.vNombComp vNombPersona,
	vper01.vTipoPersona,
	vper01.vTtipoDoc,
	vper01.vNroDoc,
	mov.iidEmpleado,
	vper02.vNombComp vNombEmpleado,
	mov.iTipoMovimiento,
	dpar01.vValor vTipoMovimiento,
	mov.iGrupMovimiento,
	dpar02.vValor vGrupMovimiento,
	mov.iTipoReferencia,
	dpar03.vValor vTipoReferencia,
	mov.vObservaciones,
	mov.dcSubtotal,
	mov.dcIgv,
	mov.dcTotal,
	mov.itotalPaquetes,
	mov.dcTotalPesoNeto,
	mov.dcTotalBruto,
	mov.dcTotalTara,
	mov.vDua,
	mov.dtfechaEE,
	mov.dtfechamov,
	mov.dtfechaCierre,
	mov.iidAlmacenReferido,
	mov.iidMovReferido,
	mov.iidUsuCrea,
	mov.dtFecCrea,
	mov.iidUsuMod,
	mov.dtFecMod,
	mov.iCerrado,
	mov.cstatus
from 
	Tm_Movimiento mov,
	Tm_Almacen alm,	
	Td_Empleado emp,
	v_Personas vper01,
	v_Personas vper02,
	Td_Parametros dpar01,
	Td_Parametros dpar02,
	Td_Parametros dpar03


where
	mov.iidAlmacen = alm.iidAlmacen
	and mov.iidpersona =vper01.iidpersona -- Cliente / Proveedor
	and mov.iidEmpleado = emp.iidEmpleado and vper02.iidpersona = emp.iidEmpleado -- Empleado
	and dpar01.iidDetalleParametro = mov.iTipoMovimiento and dpar01.iidParametro=13 
	and dpar02.iidDetalleParametro = mov.iGrupMovimiento and dpar02.iidParametro=14
	and dpar03.iidDetalleParametro = mov.iTipoReferencia and dpar03.iidParametro=26
	and mov.cstatus='1'



GO


