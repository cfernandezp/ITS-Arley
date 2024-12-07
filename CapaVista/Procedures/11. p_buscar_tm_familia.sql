USE ITS
GO

/****** Object:  StoredProcedure [dbo].[p_buscar_tm_categoria]    Script Date: 15/08/2023 13:17:48 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

--exec p_buscar_tm_familia
Create procedure [dbo].[p_buscar_tm_familia]
as
begin

select
iidFamilia,
vNombFamilia
from
	tm_familia
where	cstatus= '1'


end


GO


