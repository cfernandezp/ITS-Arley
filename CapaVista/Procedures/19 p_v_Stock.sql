use ITS
GO

CREATE VIEW  [dbo].[v_Stock] 
AS

select
modalm.iidmodeloalmacen,
modpro.vCodModelo,
modpro.vNombreModelo,
count(entdet.iCantidadPaquete) iCantidadCajas,
sum(entdet.dcPesoBruto) dcTotalPesoBruto,
sum(entdet.dcTara) dcTotalPesoTara,
sum(entdet.dcPesoNeto) dcTotalPesoNeto
from Tm_EntradaDetalle entdet	
Left join	Tm_ModeloAlmacen modalm	on entdet.iidModeloAlmacen = modalm.iidModeloAlmacen
									Left join	Tm_ModeloProducto modpro	on modalm.iidModeloAlmacen = modpro.iidModelo	
									Left join	Tm_Entrada	ent			on ent.iidEntrada = entdet.iidEntrada
where 
 entdet.cstatus IN ('1','3') and modalm.cstatus='1' and modpro.cstatus='1'
group by modalm.iidmodeloalmacen,modpro.vCodModelo,modpro.vNombreModelo