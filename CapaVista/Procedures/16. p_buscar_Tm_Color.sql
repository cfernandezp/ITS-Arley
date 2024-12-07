USE [ITS]
GO

/****** Object:  StoredProcedure [dbo].[p_buscar_tm_familia]    Script Date: 9/10/2023 13:38:13 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


--exec p_buscar_tm_color
Create procedure [dbo].[p_buscar_tm_color]
as
begin

select
iidColor,
vNombColor
from
	tm_color
where	cstatus= '1'


end



GO


