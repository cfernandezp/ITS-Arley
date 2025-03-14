USE [ITS]
GO
/****** Object:  StoredProcedure [dbo].[p_buscar_tm_familia]    Script Date: 18/09/2023 17:48:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--exec p_buscar_persona
create procedure [dbo].[p_buscar_persona]
as
begin

	select
	per.iidPersona,	
	dpar01.vValor vTipoPersona,	
	dpar02.vValor vTtipoDoc,
	per.vNroDoc,
	pernat.vNombComp
	from
	Tm_Persona per,
	Td_PersonaNatural pernat,
	Td_Parametros dpar01,
	Td_Parametros dpar02

	where 
	per.iidPersona = pernat.iidPersona and
	dpar01.iidDetalleParametro= per.iTipoPersona and dpar01.iidParametro=8 and
	dpar02.iidDetalleParametro= per.itipoDoc and dpar02.iidParametro=5

	union all

	select
	per.iidPersona,	
	dpar01.vValor vTipoPersona,	
	dpar02.vValor vTtipoDoc,
	per.vNroDoc,
	perjur.vRazonSocial
	from
	Tm_Persona per,
	Td_PersonaJuridica perjur,
	Td_Parametros dpar01,
	Td_Parametros dpar02
	where 
	per.iidPersona = perjur.iidPersona and
	dpar01.iidDetalleParametro= per.iTipoPersona and dpar01.iidParametro=8 and
	dpar02.iidDetalleParametro= per.itipoDoc and dpar02.iidParametro=5

end

SELECT * FROM Td_Parametros WHERE iidParametro  = 5
SELECT * FROM Td_Parametros WHERE iidParametro  = 8