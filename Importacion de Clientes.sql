Delete from tblFacturacion_Tmp_Clientes
BULK INSERT tblFacturacion_Tmp_Clientes
FROM '\\stopnet\ftp\Carpetas\fac\NuevosClientes.csv' --location with filename
WITH
(
   FIRSTROW=2,
   FIELDTERMINATOR = ';',
   ROWTERMINATOR = '\n'
)
GO


insert into tblFacturacion_Clientes

(

    [T_PASSEPORT]
      ,[YTC_TABLELIBRETIERS2]
      ,[T_LIBELLE]
      ,[T_PRENOM]
      ,[T_ADRESSE1]
      ,[T_VILLE]
      ,[T_CODEPOSTAL]
      ,[T_TELEPHONE]
      ,[T_TELEX]
      ,[T_EMAIL]
      ,[T_PAYS]
      ,[T_DTSVLASTCHANGE]
)

Select [T_PASSEPORT]
      ,[YTC_TABLELIBRETIERS2]
      ,[T_LIBELLE]
      ,[T_PRENOM]
      ,[T_ADRESSE1]
      ,[T_VILLE]
      ,[T_CODEPOSTAL]
      ,[T_TELEPHONE]
      ,[T_TELEX]
      ,[T_EMAIL]
      ,[T_PAYS]
      ,[T_DTSVLASTCHANGE] from tblFacturacion_Tmp_Clientes
 where T_PASSEPORT NOT IN (Select T_PASSEPORT FROM tblFacturacion_Clientes )