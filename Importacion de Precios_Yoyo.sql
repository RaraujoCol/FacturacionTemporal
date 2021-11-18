Select * from ImportData

DECLARE @Name VARCHAR(100) 
DECLARE @File VARCHAR(100)
DECLARE @query NVARCHAR(MAX)

--SET @File = CONCAT('\\stopnet\ftp\Carpetas\fac','\','ProductosStop.csv')
--SET @query =  concat ('BULK INSERT dbo.tblFacturacion_tmp_Precios  FROM ',CHAR(39),@File,'',CHAR(39),'   with ( FORMATFILE =',CHAR(39),'\\stopnet\ftp\Carpetas\bco\BancoBogotaMulticash\BBMulticash_Detalle.txt',CHAR(39),') ')
--      EXECUTE(@query)


Delete from tblFacturacion_Tmp_Precios1
Delete from tblFacturacion_Tmp_Precios

BULK INSERT tblFacturacion_Tmp_Precios1
FROM '\\stopnet\ftp\Carpetas\fac\ProductosYoyo.csv' --location with filename
WITH
(
   FIRSTROW=2,
   FIELDTERMINATOR = ';',
   ROWTERMINATOR = '\n'
)
GO


Update tblFacturacion_Tmp_Precios1
 set ValorUnitario = replace( [ValorUnitario],'.00000000','')

Insert into tblFacturacion_Tmp_Precios
  (  [IdProducto]
      ,[Nombre]
      ,[Descripcion]
      ,[ValorUnitario]
      ,[idUnidadMedida]
      ,[UnidadPorEmpaque]
      ,[ProductoDocumentoSoporte]
      ,[EsServicio]
      ,[ModeloContable])

Select [IdProducto]
      ,[Nombre]
      ,[Descripcion]
      ,max(  [ValorUnitario])
      ,[idUnidadMedida]
      ,[UnidadPorEmpaque]
      ,[ProductoDocumentoSoporte]
      ,[EsServicio]
      ,[ModeloContable] from tblFacturacion_Tmp_Precios1
 GROUP by 
 [IdProducto]
      ,[Nombre]
      ,[Descripcion]
      ,[idUnidadMedida]
      ,[UnidadPorEmpaque]
      ,[ProductoDocumentoSoporte]
      ,[EsServicio]
      ,[ModeloContable]


Select idProducto, count(*) from tblFacturacion_Tmp_Precios group by idProducto having count(*)>1


-- 1) Se validan los duplicados 

        Select IdProducto, count(*) 
            from [dbo].[tblFacturacion_ProductosYoyo] group by idProducto having count(*)>1

-- 2) Agrego los nuevos

Select * from tblFacturacion_Tmp_Precios where idproducto not in 
(Select idproducto from tblFacturacion_ProductosYoyo)


Insert into tblFacturacion_ProductosYoyo
  (  [IdProducto]
      ,[Nombre]
      ,[Descripcion]
      ,[ValorUnitario]
      ,[idUnidadMedida]
      ,[UnidadPorEmpaque]
      ,[ProductoDocumentoSoporte]
      ,[EsServicio]
      ,[ModeloContable])

Select [IdProducto]
      ,[Nombre]
      ,[Descripcion]
      ,[ValorUnitario]
      ,[idUnidadMedida]
      ,[UnidadPorEmpaque]
      ,[ProductoDocumentoSoporte]
      ,[EsServicio]
      ,[ModeloContable] from tblFacturacion_Tmp_Precios
      where idproducto not in (Select idproducto from tblFacturacion_ProductosYoyo)


-- 3) Actualizo los Precios

Select top 500 Lista.ValorUnitario ,  Pre.ValorUnitario, abs(cast(Lista.ValorUnitario as int) -  cast( Pre.ValorUnitario  as int)  ),

* from tblFacturacion_ProductosYoyo Lista
  inner join tblFacturacion_tmp_Precios Pre on Lista.IdProducto = Pre.iDProducto 
   where Lista.ValorUnitario <> Pre.ValorUnitario

Select * from tblFacturacion_ProductosYoyo where valor is null

Update tblFacturacion_ProductosYoyo
 set Valor= ValorUnitario where valor is null