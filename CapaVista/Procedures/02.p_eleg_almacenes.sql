USE [ITS]
GO
/****** Object:  StoredProcedure [dbo].[p_eleg_almacenes]    Script Date: 9/08/2023 16:35:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- EXEC p_eleg_almacenes
CREATE procedure [dbo].[p_eleg_almacenes]
as
begin

	SELECT 
	alm.iidalmacen,   
	alm.vdescalmacen,   
	alm.itipoalmacen,   
	dpar.vvalor  
	FROM 
	td_parametros dpar,   
	tm_almacen  alm
	WHERE ( alm.itipoalmacen = dpar.iiddetalleparametro ) and  
	( ( dpar.iidparametro = 16 ) AND  
	( alm.cstatus = '1' ) )    


end


