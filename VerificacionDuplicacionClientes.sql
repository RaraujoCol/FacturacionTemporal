Select 
        T_PASSEPORT as Cedula,  MAX(T_PRENOM)  as Nombre,  
        MAX(T_LIBELLE) as Apellido,  MAX(T_Adresse1) as Direccion, MAX(T_TELEPHONE) as Telefono,
        MAX(T_EMAIL)  as CorreoElectronico ,
        YTC_TABLELIBRETIERS2
        from tblFacturacion_Clientes group by T_PASSEPORT,  YTC_TABLELIBRETIERS2
  HAVING COUNT(*) >1
-- --------------------------------------------------------------
Select MAX(ID)
               from tblFacturacion_Clientes 
        group by  T_PASSEPORT, T_PRENOM ,T_LIBELLE,T_Adresse1,T_TELEPHONE,T_EMAIL ,  YTC_TABLELIBRETIERS2
  HAVING COUNT(*) >1

--- ----------------------------------------------------------------
Delete from tblFacturacion_Clientes where id in  (
Select MAX(ID)
               from tblFacturacion_Clientes 
        group by  T_PASSEPORT, T_PRENOM ,T_LIBELLE,T_Adresse1,T_TELEPHONE,T_EMAIL ,  YTC_TABLELIBRETIERS2
  HAVING COUNT(*) >1
)
-- ------------------------------------------------------------------

Select MIN(ID), T_PASSEPORT ,  YTC_TABLELIBRETIERS2
        from tblFacturacion_Clientes 
        where T_CODEPOSTAL IS NULL
        group by T_PASSEPORT,  YTC_TABLELIBRETIERS2
        
  HAVING COUNT(*) >1


Delete from tblFacturacion_Clientes where id in  
(
        Select MIN(ID)        from tblFacturacion_Clientes 
                where T_CODEPOSTAL IS NULL
                group by T_PASSEPORT,  YTC_TABLELIBRETIERS2       
        HAVING COUNT(*) >1
)


-- -------------------------------------------------------------------------------------------------------------
-- -------------------------------------------------------------------------------------------------------------
Delete from tblFacturacion_Clientes where id in  
(
        Select MIN(ID)        from tblFacturacion_Clientes 
                where T_CODEPOSTAL IS NOT  NULL
                group by T_PASSEPORT,  YTC_TABLELIBRETIERS2       
        HAVING COUNT(*) >1
)

-- -------------------------------------------------------------------------------------------------------------
-- -------------------------------------------------------------------------------------------------------------
Select MIN(ID), T_PASSEPORT ,  YTC_TABLELIBRETIERS2
        from tblFacturacion_Clientes     
        group by T_PASSEPORT,  YTC_TABLELIBRETIERS2       
  HAVING COUNT(*) >1

    Delete from tblFacturacion_Clientes where id in  
    (
    Select  MIN(ID)         from tblFacturacion_Clientes     
            group by T_PASSEPORT,  YTC_TABLELIBRETIERS2       
    HAVING COUNT(*) >1
    )

  Select * from tblFacturacion_Clientes where T_PASSEPORT = '1026134582' order by T_DTSVLASTCHANGE asc 
  Delete from tblFacturacion_Clientes where Id = 46806

-- ----------------------------------------------------------------------
-- ----------------------------------------------------------------------


Select * from tblFacturacion_Enc where CedulaCliente = '890028'

Select * from tblFacturacion_Det  where Id_Encabezado = 1575

exec usp_facturacion_BorrarProductoFactura   1575 , 243098


exec usp_facturacion_BorrarProductoFactura @Encabezado=NULL,@Id_Detalle=4120


Select * from tblFacturacion_Enc

Select * from  tblFacturacion_Det

exec usp_facturacion_BorrarProductoFactura @Encabezado=N'1575',@Id_Detalle=4127


Select * from tblFacturacion_Det where Id_Detalle=4127

Select * from tblFacturacion_Det


Delete from tblFacturacion_Det where Id_Encabezado in  (

Select Id_Encabezado from tblFacturacion_Enc WHERE CedulaCliente = '890028')

Delete from tblFacturacion_Enc WHERE CedulaCliente = '890028'

Select * from tblFacturacion_Enc WHERE CedulaCliente = '890028'
Select * from tblFacturacion_Det wHERE Id_Encabezado = 1577

Select top 100 * from tblFacturacion_ProductosYoyo order by Valor desc 



Select top 1   isnull(T_PRENOM, '') + ' ' + isnull(T_LIBELLE, '') as Nombre, T_EMAIL  as 
CorreoElectronico from[dbo].[tblFacturacion_Clientes]   Cli
  where T_PASSEPORT = '890088' 


Select isnull(max(Id_Encabezado),0) from tblFacturacion_Enc where CedulaCliente = '8900289' and Empresa = 'YOYO'


(Select isnull(max(Id_Encabezado),150) from tblFacturacion_Enc where CedulaCliente = '8900289' and Empresa = 'YOYO' )  




