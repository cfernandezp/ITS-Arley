USE [ITS]
GO
/****** Object:  StoredProcedure [dbo].[p_Obtener_DatosModelo]    Script Date: 2/09/2023 19:55:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


Create procedure [dbo].[p_Obtener_DatosModelo] (@pi_iidalmacen integer,@pv_vcodModelo nvarchar(10) )
as
begin
select 
	modalm.iidModeloAlmacen,
	modalm.dcPrecioBaseCosto,
	modpro.vNombreModelo,	
	col.vNombColor,
	modpro.vCodModelo,
	modalm.dcStockBruto,
	modalm.dcStockNeto,
	modpro.iidModelo
	from	Tm_ModeloAlmacen modalm, Tm_ModeloProducto modpro, Tm_CatalogoProducto cat, Tm_color col, Tm_Almacen alm
	where	modalm.iidModelo	=	modpro.iidModelo	and	
			modalm.iidProducto	=	cat.iidProducto		and
			modpro.iidColor		=	col.iidColor		and
			modalm.iidAlmacen	=	alm.iidAlmacen		and	
			alm.iidAlmacen		= @pi_iidalmacen		and  modpro.vCodModelo=  @pv_vcodModelo and
			modalm.cstatus		= 1 
end


--exec p_Obtener_DatosModelo 1, '100-01'

