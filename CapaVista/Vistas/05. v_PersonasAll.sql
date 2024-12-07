USE [ITS]
GO

/****** Object:  View [dbo].[v_Personas]    Script Date: 12/11/2023 23:16:04 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO
-- select * from v_PersonasAll
cREATE VIEW [dbo].[v_PersonasAll] AS

	select
	emp.iidEmpresa,
	emp.vNombEmpresa,
	per.iidPersona,	
	dpar01.vValor vTipoPersona,	
	dpar02.vValor vTtipoDoc,
	per.vNroDoc,
	per.vDireccion,
	per.vContacto,
	pernat.vNombComp,
	 
	ISNULL((select x.iidempleado from Td_Empleado x where x.iidPersona=per.iidPersona and x.cstatus='1'),0) swEmpleado, 
	ISNULL((select iidUsuario from Tm_Usuario x where x.iidpersona=per.iidPersona and x.cstatus='1') ,0) swUsuario,
	ISNULL((select iidProveedor from Tm_Proveedor x where x.iidPersona=per.iidPersona and x.cstatus='1'),0) swProveedor,
	ISNULL((select iidCliente from Tm_Cliente x where x.iidPersona=per.iidPersona and x.cstatus='1'),0) swCliente,
	/*
	case (select iidempleado from Td_Empleado x where x.iidPersona=per.iidPersona and x.cstatus='1') when null then 0 end swEmpleado,
	case (select iidusuario from Tm_Usuario x where x.iidpersona=per.iidPersona and x.cstatus='1') when null then 0 end swUsuario,
	case (select iidProveedor from Tm_Proveedor x where x.iidPersona=per.iidPersona and x.cstatus='1') when null then 0  end swProveedor,
	case (select iidCliente from Tm_Cliente x where x.iidPersona=per.iidPersona and x.cstatus='1') when null then 0  end swCliente,
	*/
	per.cstatus
	from
	tm_empresa emp,
	Tm_Persona per,
	Td_PersonaNatural pernat,
	Td_Parametros dpar01,
	Td_Parametros dpar02

	where 
	per.iidEmpresa = emp.iidEmpresa and
	per.iidPersona = pernat.iidPersona and
	dpar01.iidDetalleParametro= per.iTipoPersona and dpar01.iidParametro=8 and
	dpar02.iidDetalleParametro= per.itipoDoc and dpar02.iidParametro=5
	union all

	select
	emp.iidEmpresa,
	emp.vNombEmpresa,
	per.iidPersona,	
	dpar01.vValor vTipoPersona,	
	dpar02.vValor vTtipoDoc,
	per.vNroDoc,
	per.vDireccion,
	per.vContacto,
	perjur.vRazonSocial,
	ISNULL((select x.iidempleado from Td_Empleado x where x.iidPersona=per.iidPersona and x.cstatus='1'),0) swEmpleado, 
	ISNULL((select iidUsuario from Tm_Usuario x where x.iidpersona=per.iidPersona and x.cstatus='1') ,0) swUsuario,
	ISNULL((select iidProveedor from Tm_Proveedor x where x.iidPersona=per.iidPersona and x.cstatus='1'),0) swProveedor,
	ISNULL((select iidCliente from Tm_Cliente x where x.iidPersona=per.iidPersona and x.cstatus='1'),0) swCliente,
	per.cstatus
	from
	tm_empresa emp,
	Tm_Persona per,
	Td_PersonaJuridica perjur,
	Td_Parametros dpar01,
	Td_Parametros dpar02
	where 
	per.iidEmpresa = emp.iidEmpresa and
	per.iidPersona = perjur.iidPersona and
	dpar01.iidDetalleParametro= per.iTipoPersona and dpar01.iidParametro=8 and
	dpar02.iidDetalleParametro= per.itipoDoc and dpar02.iidParametro=5


GO


