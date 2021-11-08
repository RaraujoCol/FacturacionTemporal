Select 
    Enc.Id_Encabezado as Id,
    Enc.Fecha as Fecha,
	Enc.CedulaCliente as Nit, 
	Enc.NombreCliente as Nombre, 
	Cli.T_ADRESSE1 as Direccion , 
	Cli.T_VILLE as Ciudad ,
	Cli.T_EMAIL as Email, 
	CLI.T_TELEPHONE as Telefono, 
	Det.Cantidad as Cantidad, 
	Det.NombreProducto as Producto,
	Det.Id_Producto as Op, 
	Det.PrecioUnitario as ValorProducto,
	Det.Descuento as ValorDescuento,
	Det.TotalItem as TotalItem,
	Enc.TotalFactura
	
from 
	tblFacturacion_Enc Enc 
	left join tblFacturacion_Det Det on Enc.Id_Encabezado = Det.Id_Encabezado
	left join tblFacturacion_Clientes Cli on Enc.CedulaCliente = Cli.T_PASSEPORT

WHERE 
    Enc.Empresa = 'Stop'

order by Fecha asc 


