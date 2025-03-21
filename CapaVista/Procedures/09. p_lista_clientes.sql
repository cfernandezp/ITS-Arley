USE ITS
GO
/****** Object:  StoredProcedure [dbo].[p_lista_clientes]    Script Date: 14/08/2023 17:12:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 -- exec p_lista_clientes
 Create procedure [dbo].[p_lista_clientes]
 as
 begin

  SELECT per.iidpersona,   
         clie.iidcliente,   
         pernat.vnombcomp,   
         par_01.vValor as vtipodoc,  
         per.vnrodoc,   
         par_02.vValor as vtipopersona,
		 clie.vNroCelular,
		 clie.vNroCasa,
		 clie.vemail,
		 clie.iTipoCliente,
		 par_03.vValor vTipoCliente
    FROM Tm_Persona per ,   
         Td_PersonaNatural pernat,   
         tm_cliente clie,
		 Td_Parametros par_01,Td_Parametros par_02,Td_Parametros par_03		
   WHERE clie.iidpersona = per.iidpersona  and  
         per.iidpersona = pernat.iidpersona and  
         per.iTipoPersona = 1  AND  
		 (par_01.iidParametro = 5 and per.itipodoc=par_01.iidDetalleParametro) and
		 (par_02.iidParametro = 8 and per.iTipoPersona =par_02.iidDetalleParametro) and
		 (par_03.iidParametro = 21 and clie.ITipoCliente=par_03.iidDetalleParametro) and
         per.cstatus = '1' AND  
         pernat.cstatus = '1' AND  
         clie.cstatus = '1'    
	UNION ALL
	  SELECT per.iidpersona,   
         clie.iidcliente,   
         pernjur.vRazonSocial ,   
         par_01.vValor as vtipodoc,  
         per.vnrodoc,   
         par_02.vValor as vtipopersona,
		 clie.vNroCelular,
		 clie.vNroCasa,
		 clie.vemail,
		 clie.iTipoCliente,
		 par_03.vValor vTipoCliente
    FROM Tm_Persona per ,   
         Td_PersonaJuridica pernjur,   
         tm_cliente clie,
		 Td_Parametros par_01,Td_Parametros par_02,Td_Parametros par_03		
   WHERE clie.iidpersona = per.iidpersona  and  
         per.iidpersona = pernjur.iidpersona and  
         per.iTipoPersona = 2  AND  
		 (par_01.iidParametro = 5 and per.itipodoc=par_01.iidDetalleParametro) and
		 (par_02.iidParametro = 8 and per.iTipoPersona=par_02.iidDetalleParametro) and
		 (par_03.iidParametro = 21 and clie.ITipoCliente=par_03.iidDetalleParametro) and
         per.cstatus = '1' AND  
         pernjur.cstatus = '1' AND  
         clie.cstatus = '1'    
		 	 
			-- select *  from tm_cliente
			-- select *  from Td_PersonaJuridica

			end
