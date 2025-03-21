USE ITS
GO
/****** Object:  StoredProcedure [dbo].[p_Listado_Personas]    Script Date: 12/08/2023 16:44:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- exec p_Listado_Personas
Create procedure [dbo].[p_Listado_Personas]
as 
begin

SELECT	per.iidpersona, 
		per.iidEmpresa, 
  
		per.Itipopersona,
		per.itipoDoc,
		emp.vNombEmpresa ,
		dpar_01.vValor	vtipopersona,   
		dpar_02.vValor	vtipodoc,   
		per.vnrodoc, 
		pernat.vNombComp,
		per.vDireccion,   
		per.cstatus  
FROM	tm_persona  per, Td_Parametros dpar_01, Td_Parametros dpar_02 , Td_PersonaNatural pernat, Tm_Empresa emp
WHERE	per.iTipoPersona= dpar_01.iidDetalleParametro and dpar_01.iidParametro= 8 and 
		per.iidEmpresa= emp.iidEmpresa and
		per.itipoDoc = dpar_02.iidDetalleParametro and dpar_02.iidParametro= 5 and
		per.iidPersona = pernat.iidPersona and  per.iTipoPersona=1 and
		per.cstatus = '1'  
UNION ALL
SELECT	per.iidpersona,   
		per.iidEmpresa, 		  
		per.Itipopersona,
		per.itipoDoc,
		emp.vNombEmpresa , 
		dpar_01.vValor	vtipopersona,   
		dpar_02.vValor	vtipodoc,   
		per.vnrodoc, 
		perjur.vRazonSocial, 
		per.vDireccion,  
		per.cstatus  
FROM	tm_persona  per, Td_Parametros dpar_01, Td_Parametros dpar_02 , Td_PersonaJuridica perjur, Tm_Empresa emp
WHERE	per.iTipoPersona= dpar_01.iidDetalleParametro and dpar_01.iidParametro= 8 and
		per.iidEmpresa= emp.iidEmpresa and
		per.itipoDoc = dpar_02.iidDetalleParametro and dpar_02.iidParametro= 5 and
		per.iidPersona = perjur.iidPersona and  per.iTipoPersona=2 and
		per.cstatus = '1'  

end



