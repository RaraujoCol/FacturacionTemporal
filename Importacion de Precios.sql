Select * from ImportData

DECLARE @Name VARCHAR(100) 
DECLARE @File VARCHAR(100)
DECLARE @query NVARCHAR(MAX)

--SET @File = CONCAT('\\stopnet\ftp\Carpetas\fac','\','ProductosStop.csv')
--SET @query =  concat ('BULK INSERT dbo.tblFacturacion_tmp_Precios  FROM ',CHAR(39),@File,'',CHAR(39),'   with ( FORMATFILE =',CHAR(39),'\\stopnet\ftp\Carpetas\bco\BancoBogotaMulticash\BBMulticash_Detalle.txt',CHAR(39),') ')
--      EXECUTE(@query)


Delete from tblFacturacion_Tmp_Precios1
BULK INSERT tblFacturacion_Tmp_Precios1
FROM '\\stopnet\ftp\Carpetas\fac\ProductosStop.csv' --location with filename
WITH
(
   FIRSTROW=2,
   FIELDTERMINATOR = ';',
   ROWTERMINATOR = '\n'
)
GO

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
      ,[ValorUnitario]
      ,[idUnidadMedida]
      ,[UnidadPorEmpaque]
      ,[ProductoDocumentoSoporte]
      ,[EsServicio]
      ,[ModeloContable] from tblFacturacion_Tmp_Precios1
 GROUP by 
 [IdProducto]
      ,[Nombre]
      ,[Descripcion]
      ,[ValorUnitario]
      ,[idUnidadMedida]
      ,[UnidadPorEmpaque]
      ,[ProductoDocumentoSoporte]
      ,[EsServicio]
      ,[ModeloContable]




Select idProducto, count(*) from tblFacturacion_Tmp_Precios group by idProducto having count(*)>1
Select IdProducto , replace(ValorUnitario,'.00000000','')   from tblFacturacion_Tmp_Precios 

