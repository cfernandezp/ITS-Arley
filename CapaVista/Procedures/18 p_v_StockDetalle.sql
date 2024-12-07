use ITS
GO

Create VIEW  [dbo].[v_StockDetalle] 
AS

select 
entdet.iidentradadetalle,
entdet.nCodBar,
modpro.vCodModelo,
modpro.vNombreModelo,
entdet.dcPesoBruto,
entdet.dcTara,
entdet.dcPesoNeto,
entdet.cstatus,
entdet.vLote,
entdet.iidEntrada,
ent.vDua 
from	Tm_Entrada ent	inner join Tm_EntradaDetalle entdet	on ent.iidEntrada = entdet.iidEntrada
						inner join	Tm_ModeloAlmacen modalm	on entdet.iidModeloAlmacen = modalm.iidModeloAlmacen
						inner join	Tm_ModeloProducto modpro	on modalm.iidModeloAlmacen = modpro.iidModelo	

		
where  entdet.cstatus IN ('1','3')  

