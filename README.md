# Taller1-Bases
Pimer Taller Bases de Datos 2
# Video explicativo: https://youtu.be/kAV6hNYhVCc
## Integrantes: Diego Mogollon, Luis Ospina, Helman Fernandez
## Se creo las base de datos taller 1, donde primeramente utilizamos las tablas que no depende de otras o tienen llaves foraneas donde colocomos el orden las mas compleja a la mas simple donde tenemos y se crea un tabla de estado compra donde tenemos: estado de compra, tipo de envio, datos pertinentes para la transaccion de las tarjetas, tipo de usuario, tipo de pago, comprador, vendedor, cedula, documento de extranjeria, usuarios donde tenemos:
# Estado del Producto
# Estado de la variable
# Producto
# Tambien tenemos una tabla compra, tabla venta, tabla proveedor venta.
# Ya con esto se realizo a interaccion de los datos con cada una de las tablas.
# Primero tenemos un requerimiento no funcional que va direccionado a la seguridad donde las vista donde un  INNER JOIN entre dos tablas usuario y proveedor creamos una vistado del lado del proveedor, donde su funcion no tiene que ver un dato como es el caso del comprador para poder tener privacidad en su informacion.
# Se creo como tal la vista con la informacion ID del usuario, su nombre que solo se veria para nuestro caso al proveedor donde usamos el INNer JOIN donde se filtro por el numero 2 para nosotros seria el 2 = proveedor.
# En la segunda vista tambien es un requerimiento no funcional donde se mostrara la informacion del comprador donde estara esta vista disponible para como tal el cliente donde le mostrara el id del producto, donde tendra un indice para buscar sus articulos y direccion de envio, y para que sepa el cliente otro index para saber el estado de su tarjeta con el numero de esta.
