Select Enc.*, Det.* , Cli.T_ADRESSE1, Cli.T_VILLE, Cli.T_TELEPHONE
   from tblFacturacion_Enc Enc   
		left join  tblFacturacion_Det Det  on Enc.Id_Encabezado = Det.Id_Encabezado 
		left join  tblFacturacion_Clientes  Cli on Cli.T_PASSEPORT = Enc.CedulaCliente 

  
  where Enc.Empresa = 'Yoyo'

  order by Enc.Fecha asc
