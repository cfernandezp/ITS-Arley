USE ITS
GO
/****** Object:  StoredProcedure [dbo].[p_buscar_tm_marca]    Script Date: 15/08/2023 11:41:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--exec p_buscar_tm_marca 1
Create procedure [dbo].[p_buscar_tm_marca]

as
begin

select
iidMarca,
vNombMarca
from
	Tm_Marca
where	cstatus= '1'


end

