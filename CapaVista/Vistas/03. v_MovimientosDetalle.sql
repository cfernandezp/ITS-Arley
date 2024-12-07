USE [ITS]
GO

/****** Object:  View [dbo].[v_MovimientosDetalle]    Script Date: 15/10/2023 00:59:27 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO





-- select * from Tm_MovimientoDetalle
-- select * from v_MovimientosDetalle
Create VIEW [dbo].[v_MovimientosDetalle] AS

SELECT movdet.iidMovimientoDetalle,
	   mov.iTipoMovimiento,
	   mov.vTipoMovimiento,
       movdet.iidMovimiento,
       movdet.iidModeloAlmacen,
	   modpro.vCodModelo,
	   modpro.vNombreModelo,
	   movdet.iidMovimientoDetalleRef,
       movdet.iTipoEmpaque,
	   dpar01.vValor vTipoEmpaque,
       movdet.itotalProductos,
       movdet.iTiproducto,
	   dpar02.vValor vTiproducto,
       movdet.dcPesoNeto,
       movdet.dcPesoBruto,
       movdet.dcTara,
       movdet.iidUniMed,
	   unimed.vNombUniMed vidUniMed,
       movdet.dcSubtotal,
       movdet.iCantidadPaquete,
       movdet.nCodBar,
       movdet.vLote,
	   mov.vDua,
	   mov.vTipoReferencia,
       movdet.dcPrecioKg,
       movdet.iidUsuCrea,
       movdet.dtFecCrea,
       movdet.iidUsuMod,
       movdet.dtFecMod,
       movdet.cstatus
  FROM 
  Tm_MovimientoDetalle movdet,
  v_Movimientos mov,  
  Tm_ModeloAlmacen modalm,
  Tm_ModeloProducto modpro,
  Tm_UnidadMedida unimed,
  Td_Parametros dpar01,
  Td_Parametros dpar02,
  Td_Parametros dpar03
  

  where   
   mov.iidMovimiento = movdet.iidMovimiento
  and movdet.iidModeloAlmacen = modalm.iidModeloAlmacen
  and modalm.iidModelo = modpro.iidModelo
  and unimed.iidUniMed = movdet.iidUniMed
  and dpar01.iidParametro= 23 and dpar01.iidDetalleParametro = movdet.iTipoEmpaque
  and dpar02.iidParametro= 22 and dpar02.iidDetalleParametro = movdet.iTiproducto
  and dpar03.iidParametro= 13 and dpar03.iidDetalleParametro = mov.iTipoMovimiento
  --and movdet.cstatus='1'





GO


