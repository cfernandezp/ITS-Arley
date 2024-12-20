USE its
GO
/****** Object:  StoredProcedure [dbo].[p_lista_personas]    Script Date: 12/08/2023 21:06:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 -- exec p_lista_personas
 CREATE procedure [dbo].[p_lista_personas] ( @pi_iidpersona integer)
 as
 begin

  SELECT per.iidpersona,   
         per.itipopersona,   
         par_01.vValor as vtipodoc,   
         per.vnrodoc,   
         per.vdireccion,   
         pernat.vnombcomp  
    FROM tm_persona			per,   
         td_personanatural	pernat,
		 Td_Parametros		par_01
   WHERE pernat.iidpersona = per.iidpersona  and   
		(par_01.iidParametro = 5 and per.itipodoc=par_01.iidDetalleParametro)     and 
          per.cstatus = '1' and per.iidPersona=@pi_iidpersona
	union all
	SELECT per.iidpersona,   
         per.itipopersona,   
         par_01.vValor as vtipodoc,      
         per.vnrodoc,   
         per.vdireccion,   
         perjur.vRazonSocial  
    FROM tm_persona			per,   
         Td_PersonaJuridica	perjur,
		 Td_Parametros		par_01
   WHERE perjur.iidpersona = per.iidpersona  and 
		(par_01.iidParametro = 5 and per.itipodoc=par_01.iidDetalleParametro)     and          
          per.cstatus = '1'  and per.iidPersona=@pi_iidpersona
	
end
