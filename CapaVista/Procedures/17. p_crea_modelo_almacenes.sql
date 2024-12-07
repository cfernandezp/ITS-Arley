USE ITS
GO
/****** Object:  StoredProcedure [dbo].[p_crea_modelo_almacenes]    Script Date: 9/10/2023 14:09:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- exec p_crea_modelo_almacenes 1,1,1,1
Create procedure [dbo].[p_crea_modelo_almacenes]
(@pi_iidalmacen integer, @pi_iidusuario integer,@pi_iidproducto integer, @pi_iidmodelo integer )
as
begin
	declare @iTotalALmacenes	integer
	declare @iContador			integer
	declare @iidAlmacen			integer

	declare @t_Almacenes	table(
			id integer primary key identity(1,1),
			iidAlmacen	integer)


	  set @iContador = 1

	  Insert into @t_Almacenes
	  select iidalmacen from Tm_Almacen where cstatus=1 and iidAlmacen<>@pi_iidalmacen

		while	@iContador <= ( select count(*) from  @t_Almacenes )
		begin
			set @iidAlmacen = (select iidalmacen from @t_Almacenes where id=@iContador )

				insert into Tm_ModeloAlmacen
				(iidproducto,iidmodelo,iidAlmacen,iUnidadMedida,
				dcStockBruto,dcStockNeto,dcStockMinimo,dcStockMaximo,dcPrecioBaseCosto,
				iidUsuCrea,dtFecCrea,cstatus)
				
				select 
				@pi_iidproducto,@pi_iidmodelo,@iidAlmacen,1,
				0,0,0,0,0,
				@pi_iidusuario,getdate(),1

		set @iContador= @iContador + 1
		end

select 'ok' vMensaje
end


--select * from Tm_ModeloAlmacen