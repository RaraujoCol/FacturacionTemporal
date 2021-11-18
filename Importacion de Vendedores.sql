Select * from ImportData

--SET @File = CONCAT('\\stopnet\ftp\Carpetas\fac','\','ProductosStop.csv')
--SET @query =  concat ('BULK INSERT dbo.tblFacturacion_tmp_Precios  FROM ',CHAR(39),@File,'',CHAR(39),'   with ( FORMATFILE =',CHAR(39),'\\stopnet\ftp\Carpetas\bco\BancoBogotaMulticash\BBMulticash_Detalle.txt',CHAR(39),') ')
--      EXECUTE(@query)


Delete from tblFacturacion_Tmp_Vendedores


BULK INSERT tblFacturacion_Tmp_Vendedores
FROM '\\stopnet\ftp\Carpetas\fac\ListaVendedores.csv' --location with filename
WITH
(
   FIRSTROW=2,
   FIELDTERMINATOR = ';',
   ROWTERMINATOR = '\n'
)
GO


Select * from tblFacturacion_Tmp_Vendedores 
   where comercial    not  in (   select Cedula from tblFacturacion_Vendedores where cedula is not null)



insert into tblFacturacion_Vendedores
(
    [Cedula]
    ,[Nombre]
    ,[Apellidos]
    ,[Establecimiento]
    ,[Marca]
    ,[Perfil]

)
SELECT [comercial]
      ,[Nombre]
      ,[Apellido]
      ,[Establecimiento]
      ,[Marca]
      ,[Perfil]
  FROM [dbo].[tblFacturacion_Tmp_Vendedores]
   where comercial    not  in (   select Cedula from tblFacturacion_Vendedores where cedula is not null)


