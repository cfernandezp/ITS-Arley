USE [ITS]
GO

/****** Object:  View [dbo].[v_MovimientosDetalle]    Script Date: 29/12/2023 17:18:49 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE VIEW [dbo].[v_EntradaDetalle] AS

SELECT entdet.iidEntradaDetalle,	   	   
       entdet.iidEntrada,
       entdet.iidModeloAlmacen,
	   modpro.vCodModelo,
	   modpro.vNombreModelo,
	   --entdet.iidMovimientoDetalleRef,
       entdet.iTipoEmpaque,
	   dpar01.vValor vTipoEmpaque,
       entdet.itotalProductos,
       entdet.iTiproducto,
	   dpar02.vValor vTiproducto,
       entdet.dcPesoNeto,
       entdet.dcPesoBruto,
       entdet.dcTara,
       entdet.iidUniMed,
	   unimed.vNombUniMed vidUniMed,
       entdet.dcSubtotal,
       entdet.iCantidadPaquete,
       entdet.nCodBar,
       entdet.vLote,
	   ent.vDua,
	   ent.vTipoReferencia,
       entdet.dcPrecioKg,
       entdet.iidUsuCrea,
       entdet.dtFecCrea,
       entdet.iidUsuMod,
       entdet.dtFecMod,
       entdet.cstatus
  FROM 
  Tm_EntradaDetalle entdet,
  v_Entradas ent,  
  Tm_ModeloAlmacen modalm,
  Tm_ModeloProducto modpro,
  Tm_UnidadMedida unimed,
  Td_Parametros dpar01,
  Td_Parametros dpar02
  
  

  where   
   ent.iidEntrada= entdet.iidEntrada
  and entdet.iidModeloAlmacen = modalm.iidModeloAlmacen
  and modalm.iidModelo = modpro.iidModelo
  and unimed.iidUniMed = entdet.iidUniMed
  and dpar01.iidParametro= 23 and dpar01.iidDetalleParametro = entdet.iTipoEmpaque
  and dpar02.iidParametro= 22 and dpar02.iidDetalleParametro = entdet.iTiproducto
  --and entdet.cstatus='1'






GO


