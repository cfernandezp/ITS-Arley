USE [ITS]
GO
/****** Object:  StoredProcedure [dbo].[p_buscar_Tm_Color]    Script Date: 21/09/2023 18:42:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--exec [p_buscar_Tm_Cliente]
Create procedure [dbo].[p_buscar_Tm_Cliente]
as
begin

select
clie.iidCliente,
per.vNombComp,
per.vTipoPersona,
per.iidPersona
from
	Tm_Cliente clie,
	v_Personas per
where	
	clie.iidPersona=per.iidPersona and
	clie.cstatus= '1' and per.cstatus= '1'


end

