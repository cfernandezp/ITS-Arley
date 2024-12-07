USE [ITS]
GO

/****** Object:  View [dbo].[v_ModeloAlmacen]    Script Date: 8/04/2024 16:34:16 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



-- select * from v_ModeloAlmacen

Create VIEW [dbo].[v_ModeloAlmacen] AS

select 
emp.iidEmpresa,
emp.vNombEmpresa,
alm.iidAlmacen,
alm.vDescAlmacen,
modalm.iidproducto,
modalm.iidmodelo,
fam.iidfamilia,
fam.vNombFamilia,
col.iidColor,
col.vNombColor,
til.iidTitulo,
til.vNombTitulo,
modalm.iidmodeloalmacen,
modpro.vNombreModelo,
fam.vNombFamilia + ' ' + til.vNombTitulo + ' ' + col.vNombColor vNombreModeloSinMarca,
modpro.vNombreCortoModelo,
modpro.vCodModelo,
modpro.iTipoModelo,
dpar01.vValor vtipoModelo,
unimed.vNombUniMed

from 
Tm_Empresa emp,
Tm_CatalogoProducto catpro,
Tm_Almacen alm,
Tm_ModeloAlmacen modalm,
Tm_ModeloProducto modpro,
Tm_UnidadMedida unimed,
Td_Parametros dpar01,
Tm_Familia fam,
Tm_color col,
Tm_Titulo til


where 
emp.iidEmpresa = catpro.iidEmpresa
and catpro.iidProducto = modpro.iidProducto
and catpro.iidEmpresa = fam.iidFamilia
and modpro.iidColor = col.iidColor
and catpro.iidTitulo = til.iidTitulo

and alm.iidAlmacen = modalm.iidAlmacen
and modalm.iidModelo = modpro.iidModelo
and unimed.iidUniMed = modalm.iUnidadMedida
and dpar01.iidParametro= 11 and dpar01.iidDetalleParametro = modpro.iTipoModelo



GO


