USE ITS
GO
/****** Object:  StoredProcedure [dbo].[p_buscar_td_parametros]    Script Date: 12/08/2023 17:06:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- exec p_buscar_td_parametros 1
Create procedure [dbo].[p_buscar_td_parametros]
(@pi_iidParametro integer )
as
begin

select
	iidDetalleParametro,
	vValor
from
	Td_Parametros
where	iidParametro=@pi_iidParametro


end

