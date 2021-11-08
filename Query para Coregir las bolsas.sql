  Update  
  tblFacturacion_Det 
   set NombreProducto =   Pro.Nombre 

   from tblFacturacion_Det  Det left join tblFacturacion_ProductosStop Pro 
  ON  Det.Id_Producto = Pro.IdProducto 

    WHERE
  
  Det.NombreProducto = 'Producto no encontrado!'
