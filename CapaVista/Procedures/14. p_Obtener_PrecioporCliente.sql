USE [ITS]
GO
/****** Object:  StoredProcedure [dbo].[p_Obtener_DatosModelo]    Script Date: 2/09/2023 19:55:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


Create procedure [dbo].[p_Obtener_PrecioporCliente] (@pi_iTipoCliente integer,@pi_iidModeloAlmacen integer )
as
begin
	select 
	dcPrecioVenta
	from
	Tm_ModeloAlmacen ma, Tm_ModeloAlmacenPrecio map
	where 
	ma.iidModeloAlmacen = map.iidModeloAlmacen and
	ma.iidModeloAlmacen = @pi_iidModeloAlmacen and
	map.iTipoPrecio = @pi_iTipoCliente
end


--exec p_Obtener_PrecioporCliente  2,1



