USE ITS
GO
/****** Object:  StoredProcedure [dbo].[p_Listado_Empleados]    Script Date: 12/08/2023 18:34:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
  -- exec p_Listado_Empleados
Alter procedure [dbo].[p_Listado_Empleados]
as 
begin
  
  SELECT 
       e.iidEmpleado,
	   pn.vNombComp,
	   dpar_01.vValor vtipoDoc,
	   p.vNroDoc,
	   p.itipoDoc,
	   e.iidPersona	   

    FROM Td_Empleado e	inner join Tm_Persona p				on e.iidPersona=p.iidPersona
						inner join Td_PersonaNatural pn		on pn.iidPersona=p.iidPersona 
						inner join	Td_Parametros	dpar_01	on dpar_01.iidDetalleParametro=p.itipoDoc and dpar_01.iidParametro=5
	where e.cstatus='1' and p.cstatus='1'
end
