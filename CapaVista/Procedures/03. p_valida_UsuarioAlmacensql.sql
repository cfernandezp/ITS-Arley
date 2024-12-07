USE ITS
GO
/****** Object:  StoredProcedure [dbo].[p_valida_UsuarioAlmacen]    Script Date: 9/08/2023 16:53:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

 Create procedure [dbo].[p_valida_UsuarioAlmacen]
 --exec p_valida_UsuarioAlmacen 1,1
(@pi_iidUsuario int,@pi_iidalmacen int )
as
begin
	Declare @i_Resultado		int,@i_contador int
	Declare @v_mensaje			nvarchar(500)
	Declare @v_vDescALmacen		nvarchar(100)
	Declare @v_vDescTienda		nvarchar(100)
	declare	@i_iidAlmacen		int
	declare	@pi_iidTienda		int
	-- exec p_valida_UsuarioTienda 1,1
	
	set @i_resultado=1
	set @v_mensaje='Bienvenido'

	select	@i_contador=count  (*)		
	from td_usuarioAlmacen where iidUsuario=@pi_iidUsuario and iidAlmacen=@pi_iidalmacen
	and cstatus=1

	if @i_contador = 0
		begin
			set @v_mensaje= 'EL USUARIO NO ESTA ASIGNADO A ESTE ALMACEN.'
			set @i_resultado=0		
			Goto	FIN			
		end
	-- Obteniendo Datos del Almacen
	select	@v_vDescALmacen	= vDescAlmacen,
			@i_iidAlmacen = iidAlmacen
	from	Tm_Almacen
	where	iidAlmacen = @pi_iidalmacen


	-- Obteniendo codigo Tienda

	select @pi_iidTienda = iidtienda
	from Td_TiendaAlmacen
	where iidAlmacen= @pi_iidalmacen

	-- Obteniendo Datos de la tienda
	select	@v_vDescTienda	= vDescTienda
	from	Tm_Tienda
	where	iidTienda = @pi_iidTienda

	-- Obteniendo Almacen de la tienda
	select	@i_iidAlmacen	= ta.iidAlmacen,
			@v_vDescAlmacen	= a.vDescAlmacen
	from	Td_TiendaAlmacen ta, Tm_Almacen a
	where	ta.iidTienda= @pi_iidTienda and a.iidAlmacen=ta.iidAlmacen and
			ta.cstatus=1 and a.cstatus=1




	FIN: 

	select	@i_resultado iResultado, @v_mensaje vMensaje, @pi_iidTienda iidTienda,@v_vDescTienda vDescTienda, @i_iidAlmacen iidAlmacen,@v_vDescAlmacen	vDescAlmacen
		--select	@i_resultado iResultado, @v_mensaje vMensaje,  ,@i_iidAlmacen iidAlmacen,@v_vDescAlmacen	vDescAlmacen
end

	-- exec p_valida_UsuarioAlmacen 1,2
