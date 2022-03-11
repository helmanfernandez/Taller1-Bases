use taller1;

create table taller1.Estado_Compra(
Id	 int not null,
Estado varchar(50),
primary key(Id)
);

create table taller1.Tipo_Envio(
Id	 int not null,
Nombre_Tipo_Envio varchar(50),
primary key(Id)
);

create table taller1.Datos_TC(
Numero_tarjeta	 int not null,
Fecha_Expiracion_Año date,
Fecha_Expiracion_Dia date,
Codigo_Seguridad varchar(50),
primary key(Numero_tarjeta)
);

create table taller1.Tipo_de_Pago(
Id	 int not null,
Metodo_pago varchar(50),
Tarjeta	 int not null,
primary key(Id),
foreign key(Tarjeta) references taller1.Datos_TC(Numero_tarjeta)
);

create table taller1.Tipo_Usuario(
Id	 int not null,
Roll_Usuario varchar(50),
primary key(Id)
);

create table taller1.Tipo_Documento(
Id	 int not null,
Nombre_Tipo_Documento varchar(50),
primary key(Id)
);

create table taller1.Usuario(
Id	 int not null,
Nombre varchar(50),
Telefono int,
CorreoElectronico varchar(50),
Contraseña varchar(50),
Direccion  varchar(50),
Ciudad  varchar(50),
Id_Tipo_Usuario int not null,
Id_Tipo_Documento int not null,
primary key(Id),
foreign key(Id_Tipo_Usuario) references taller1.Tipo_Usuario(Id),
foreign key(Id_Tipo_Documento) references taller1.Tipo_Documento(Id)
);

create table taller1.Estado_Producto(
Id	 int not null,
Estado varchar(50),
primary key(Id)
);

create table taller1.Estado_Variante(
Id	 int not null,
Color varchar(50),
Talla varchar(50),
primary key(Id)
);

create table taller1.Producto(
Id	 int not null,
Nombre varchar(50),
Marca varchar(50),
Categoria varchar(50),
Foto varchar(50),
Precio float,
Caracteristica varchar(50),
Descripcion varchar(50),
Cantidad int(50),
Id_Variante_Producto int not null,
Id_Estado_Producto int not null,
primary key(Id),
foreign key(Id_Variante_Producto) references taller1.Estado_Variante(Id),
foreign key(Id_Estado_Producto) references taller1.Estado_Producto(Id)
);

create table taller1.Compra(
Id	 int not null,
Direccion_Envio varchar(50),
Id_Tipo_Pago int not null,
Id_Tipo_Envio int not null,
Id_Producto int not null,
Id_Estado_Compra int not null,
Id_Usuario int not null,
primary key(Id),
foreign key(Id_Tipo_Pago) references taller1.Tipo_de_Pago(Id),
foreign key(Id_Tipo_Envio) references taller1.Tipo_Envio(Id),
foreign key(Id_Producto) references taller1.Estado_Producto(Id),
foreign key(Id_Estado_Compra) references taller1.Estado_Producto(Id),
foreign key(Id_Usuario) references taller1.Tipo_Usuario(Id)
);

create table taller1.Venta(
Id	 int not null,
Producto varchar(50),
Fecha_Venta date,
Id_compra int not null,
primary key(Id),
foreign key(Id_compra) references taller1.Compra(Id)
);


create table taller1.Proveedor_Venta(
Id	 int not null,
Id_Usuario int not null,
Id_Venta int not null,
primary key(Id),
foreign key(Id_Usuario) references taller1.Usuario(Id),
foreign key(Id_Venta) references taller1.Venta(Id)
);

/* CREACION DE VISTAS */
/* REQUERIMIENTO NO FUNCIONAL - SEGURIDAD  -- INFORMACION DEL PROVEEDOR Y SUS VENTAS*/

CREATE VIEW provData AS
SELECT U.Id,U.Nombre,U.Telefono,P.Id,P.Id_Usuario,Id_Venta
FROM usuario
INNER JOIN proveedor_venta
ON  U.Id = P.Id
WHERE Id_Tipo_Usuario = 2;  /*ESTADO 3 IGUAL A PROVEEDOR*/
 /*DE ESTA FORMA SOLO SE PODRA VER LA INFORMACION DE PROVEEDOR Y LAS VENTAS QUE A REALIZADO SIN INTERFERIR EN LA INFORMACION DE LOS DEMAS TIPO DE USUARIOS*/


/* ESTA VISTA TAMBIEN  SE CREA DEBIDO A UN REQUERIMIENTO NO FUNCIONAL, EN CASO DE QUE SE DEBA MOSTRAR LA INFORMACION DE UNA COMPRA PARA EL USUARIO PERO OCULTAR
ALGUNOS DATOS COMO ID_ENVIO O EL ID_USUARIO QUE ES INFORMACION QUE SOLO DEBE VER EL ADMINISTRADOR */


CREATE VIEW provData AS
SELECT U.Id,U.Nombre,U.Telefono,C.Id_Tipo_Pago,C.Id_Producto,C.Id_Estado_Compra
FROM usuario
INNER JOIN compra
ON  U.Id = C.Id_Usuario
WHERE Id_Tipo_Usuario = 3;   /*ESTADO 3 IGUAL A COMPRADOR*/


CREATE VIEW prov AS
SELECT *
FROM usuario
WHERE Id = 2;


/*CREACION DE INDICES*/
    alter table produc add precio int;
    alter table produc add index i_precio(precio);
    
    CREATE INDEX nombre_index ON  taller1.producto (categoria);
    SHOW  INDEX  FROM taller1.producto  /* ESTE INDEX NOS AYUDARA A BUSCAR DE UNA FORMA MAS RAPIDA LA CATEGORIA EN LA TABLA DE PRODUCTO*/
    
    /*EN CASO DE QUE UN DOMICILIARIO DEBA CONSULTAR LAS DIRECCIONES DE ENVIO DE FORMA RAPIDA PODREMOS APLICAR UN INDICE A LA TABLE COMPRA 
    EN EL CAMPO DIRECCION DE ENVIO*/
    CREATE INDEX nombre_index2 ON  taller1.compra (Direccion_Envio);
    SHOW  INDEX  FROM taller1.compra
    
    
    /*EN CASO DE QUE DESEEMOS BUSCAR LA FECHA DE EXPIRACION DE UNA TARJETA QUE TUVO UN PROBLEMA EN EL MOMENTO EN QUE SE GENERABA ALGUNA TRANSACCION, CON LA DEVOLUCION
    O ALGO POR EL ESTILO PODRIAMOS CREAR UN INDEX PARA PODER BUSCARLO DE FORMA MAS RAPIDA*/
    
        CREATE INDEX nombre_index3 ON  taller1.datos_tc (Fecha_Expiracion_Año);
        SHOW  INDEX  FROM taller1.datos_tc
    



