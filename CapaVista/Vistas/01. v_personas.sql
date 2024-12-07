USE [ITS]
GO

/****** Object:  View [dbo].[v_Personas]    Script Date: 15/10/2023 01:59:04 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



-- select * from v_Personas
Create VIEW [dbo].[v_Personas] AS

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


