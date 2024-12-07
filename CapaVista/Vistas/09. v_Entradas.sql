USE [ITS]
GO

/****** Object:  View [dbo].[v_Entradas]    Script Date: 29/12/2023 15:01:08 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO





-- select * from v_Movimientos
CREATE VIEW [dbo].[v_Entradas] AS

select 
	ent.iidEntrada,
	alm.iidAlmacen,
	alm.vDescAlmacen,
	ent.iidPersona,
	vper01.vNombComp vNombPersona,
	vper01.vTipoPersona,
	vper01.vTtipoDoc,
	vper01.vNroDoc,
	ent.iidEmpleado,
	vper02.vNombComp vNombEmpleado,
	ent.iGrupMovimiento,
	dpar02.vValor vGrupMovimiento,
	ent.iTipoReferencia,
	dpar03.vValor vTipoReferencia,
	ent.vObservaciones,
	ent.dcSubtotal,
	ent.dcIgv,
	ent.dcTotal,
	ent.itotalPaquetes,
	ent.dcTotalPesoNeto,
	ent.dcTotalBruto,
	ent.dcTotalTara,
	ent.vDua,
	ent.dtfechaEE,
	ent.dtfechamov,
	ent.dtfechaCierre,
	ent.iidAlmacenReferido,
	ent.iidMovReferido,
	ent.iidUsuCrea,
	ent.dtFecCrea,
	ent.iidUsuMod,
	ent.dtFecMod,
	ent.iCerrado,
	ent.cstatus
from 
	Tm_Entrada ent,
	Tm_Almacen alm,	
	Td_Empleado emp,
	v_Personas vper01,
	v_Personas vper02,	
	Td_Parametros dpar02,
	Td_Parametros dpar03


where
	ent.iidAlmacen = alm.iidAlmacen
	and ent.iidpersona =vper01.iidpersona -- Cliente / Proveedor
	and ent.iidEmpleado = emp.iidEmpleado and vper02.iidpersona = emp.iidEmpleado -- Empleado
	--and dpar01.iidDetalleParametro = mov.iTipoMovimiento and dpar01.iidParametro=13 
	and dpar02.iidDetalleParametro = ent.iGrupMovimiento and dpar02.iidParametro=14
	and dpar03.iidDetalleParametro = ent.iTipoReferencia and dpar03.iidParametro=26
	and ent.cstatus='1'




GO


