USE ITS
GO
/****** Object:  StoredProcedure [dbo].[P_Login_Usuario]    Script Date: 24/07/2023 19:12:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create Procedure [dbo].[P_Login_Usuario]
( @pv_vcodUsuario nvarchar(20) ,@pv_vPassword nvarchar(20) )
as
Begin

/*
exec P_Login_Usuario 'ITSCRIFER','asdasd'
SELECT * FROM TM_USUARIO
*/
	Declare @v_CodUsuario nvarchar(9)
	Declare @v_Password nvarchar(20)
	Declare @i_iidUsuario int
	Declare @i_iidEmpleado int
	Declare @pi_resultado int
	declare @pv_mensaje nvarchar(50)
	declare	@i_contador	int
	Declare @i_iidEmpresa int

	set @pi_resultado=1
	set @pv_mensaje='Bienvenido'	
	
--	set @pv_vcodUsuario='SITCRIFER'
--	set @pv_vPassword='asdasd'

	
		-- Validando Usuario
		Select	@v_CodUsuario	= vcodUsuario,
				@i_iidEmpleado	= iidEmpleado,
				@i_iidUsuario	= iidUsuario
		from	Tm_Usuario
		where	vcodUsuario		= @pv_vcodUsuario

		if @v_CodUsuario is null
		begin
			set @pv_mensaje='El usuario no existe'	
			set @pi_resultado=0		
			goto FIN	
		end
		
		
		-- Validando Password	
		PRINT 	@pv_vPassword
						
		--select  @v_Password		= isnull(@v_Password,'')
		
		select  @v_Password		= isnull(@v_Password,'')
		from	Tm_Usuario 
		where	iidUsuario=@i_iidUsuario and vPassword=@pv_vPassword and	
		cstatus=1 

	
		if @v_Password is null
		begin
			set @pv_mensaje= 'Password Incorrecto'
			set @pi_resultado=0
			goto FIN			
		end

		
		-- Obteniendo Empresa

		select	@i_iidEmpresa	= p.iidEmpresa 
		from	Td_Empleado e, Tm_Persona p, Tm_Usuario u
		where	p.iidPersona=e.iidPersona and e.iidEmpleado=u.iidEmpleado and u.vcodUsuario=@v_CodUsuario and 
				e.cstatus=1 and p.cstatus=1 and u.cstatus=1

		FIN:
		--select @pi_resultado iResultado, @pv_mensaje vMensaje
		/*
		select	@pi_resultado iResultado, @pv_mensaje vMensaje,@v_CodUsuario vCodUsuario,
				@i_iidEmpleado iidEmpleado,@i_iidUsuario iidUsuario, @i_iidEmpresa iidEmpresa*/
		
		if @pi_resultado=1
		begin
			select	
					@pi_resultado iResultado,
					@pv_mensaje vMensaje,
					usu.iidUsuario,
					usu.vcodUsuario,
					emp.iidEmpleado,
					per_nat.vNombComp as vNombEmpleado,
					ep.iidEmpresa ,
					ep.vNombEmpresa,
					usu.iTipousuario,
					dpar_01.vvalor vTipousuario

			from	Tm_Usuario usu, Td_Empleado emp, Td_PersonaNatural per_nat, tm_persona per, Tm_Empresa ep, Td_Parametros dpar_01
			where	usu.iidEmpleado = emp.iidEmpleado and 
					dpar_01.iiddetalleparametro=usu.itipoUsuario and dpar_01.iidparametro=20 and
					emp.iidPersona = per_nat.iidPersona and
					emp.iidPersona = per.iidPersona and per.iidEmpresa = ep.iidEmpresa
					and usu.iidUsuario= @i_iidUsuario
		end
		else
		begin
				select	
					@pi_resultado iResultado,
					@pv_mensaje vMensaje,
					0 ,
					null,
					0 ,
					null ,
					0  ,
					null
		end
-- exec P_Login_Usuario 'SITADMADM4','asdasd'
End

-- select * from Td_Parametros
