USE [ITS]
GO

/****** Object:  View [dbo].[v_PackingCodBar]    Script Date: 8/04/2024 16:58:30 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO




Create view [dbo].[v_PackingCodBar]
as

select 
ed.iidEntradaDetalle,
ed.nCodBar ,
modalm.vNombTitulo,
ed.vLote,
modalm.iidColor,
modalm.vNombColor,
ed.dcPesoBruto,
ed.dcTara,
ed.dcPesoNeto,
ed.itotalProductos,
dpar01.vValor,
ed.nCodBar CodBar,
ed.dtFecCrea,
modalm.vNombreModelo,
modalm.vNombreModeloSinMarca,
emp.vNombEmpresa,
ed.iidentrada,
ent.dtfechamov,
ent.dtfechaEE
 from 
 tm_entradadetalle ed,
 tm_entrada ent,
 v_ModeloAlmacen modalm,

-- Tm_ModeloAlmacen ma,
-- Tm_ModeloProducto mp,
-- Tm_CatalogoProducto cat,
-- Tm_Titulo ti,
-- Tm_color col,
 Td_Parametros dpar01,
 Tm_Empresa emp
 where 
 ed.iidentrada	= ent.iidentrada
 and ed.iidModeloAlmacen = modalm.iidmodeloalmacen

 --and  ed.iidModeloAlmacen	= ma.iidModeloAlmacen 
 --and mp.iidModelo		= ma.iidModelo
 --and cat.iidProducto	= mp.iidProducto

 --and cat.iidProducto= mp.iidProducto
 --and cat.iidTitulo = ti.iidTitulo
 --and mp.iidColor = col.iidColor
 and modalm.iidEmpresa= emp.iidEmpresa
 and dpar01.iidDetalleParametro = ed.iTiproducto and dpar01.iidParametro=22


GO


select * from v_ModeloAlmacen