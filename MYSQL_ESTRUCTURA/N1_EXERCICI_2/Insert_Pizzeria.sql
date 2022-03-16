set SQL_SAFE_UPDATES=0;

DELETE FROM CONTIENE;
DELETE FROM PIZZA;
DELETE FROM PRODUCTO;
DELETE FROM PEDIDO;
DELETE FROM EMPLEADO;
DELETE FROM TIENDA;
DELETE FROM CATEGORIA;
DELETE FROM CLIENTE;
DELETE FROM LOCALIDAD;
DELETE FROM PROVINCIA;

alter table CLIENTE AUTO_INCREMENT=1;
alter table PROVINCIA AUTO_INCREMENT=1;
alter table LOCALIDAD AUTO_INCREMENT=1;
alter table CATEGORIA AUTO_INCREMENT=1;
alter table TIENDA AUTO_INCREMENT=1;
alter table EMPLEADO AUTO_INCREMENT=1;
alter table PEDIDO AUTO_INCREMENT=1;
alter table PRODUCTO AUTO_INCREMENT=1;


insert into PROVINCIA(id_provincia, nombre) VALUES (default, "Barcelona");
insert into PROVINCIA(id_provincia, nombre) VALUES (default, "Valencia");
insert into PROVINCIA(id_provincia, nombre) VALUES (default, "Barcelona");

insert into LOCALIDAD(id_localidad, nombre,PROVINCIA_id_provincia) VALUES (default, "Barcelona", 1);
insert into LOCALIDAD(id_localidad, nombre,PROVINCIA_id_provincia) VALUES (default, "Burjasot", 2);
insert into LOCALIDAD(id_localidad, nombre,PROVINCIA_id_provincia) VALUES (default, "L'Hospitalet Llobregat", 1);

insert into CLIENTE (id_cliente,nombre,apellido,direccion,codigo_postal,telefono,LOCALIDAD_id_localidad) 
                 VALUES (default, "cliente1", "apellido1", "direccion1","0001", "111111111",1);
insert into CLIENTE (id_cliente,nombre,apellido,direccion,codigo_postal,telefono,LOCALIDAD_id_localidad) 
                 VALUES (default, "cliente2", "apellido2", "direccion2","0002","222222222",2);
insert into CLIENTE (id_cliente,nombre,apellido,direccion,codigo_postal,telefono,LOCALIDAD_id_localidad) 
                 VALUES (default, "cliente3", "apellido3", "direccion3","0003", "333333333",1);

insert into CATEGORIA(id_categoria,nombre) VALUES (default, "categoria1");
insert into CATEGORIA(id_categoria,nombre) VALUES (default, "categoria2");
insert into CATEGORIA(id_categoria,nombre) VALUES (default, "categoria3");

insert into TIENDA(id_tienda,direccion,codigo_postal,LOCALIDAD_id_localidad)VALUES(default,"DireccionTienda1","0001",1);
insert into TIENDA(id_tienda,direccion,codigo_postal,LOCALIDAD_id_localidad)VALUES(default,"DireccionTienda2","0001",1);
insert into TIENDA(id_tienda,direccion,codigo_postal,LOCALIDAD_id_localidad)VALUES(default,"DireccionTienda3","0001",1);


insert into EMPLEADO(id_empleado,nombre,apellidos,nif,telefono,profesion,TIENDA_id_tienda)
                   VALUES(default,"Empleado1", "Apellido1", "NIF_1", "Tf_Empl_1",1,1);
insert into EMPLEADO(id_empleado,nombre,apellidos,nif,telefono,profesion,TIENDA_id_tienda)
                   VALUES(default,"Empleado2", "Apellido2", "NIF_2", "Tf_Empl_2",2,1);
insert into EMPLEADO(id_empleado,nombre,apellidos,nif,telefono,profesion,TIENDA_id_tienda)
                   VALUES(default,"Empleado3", "Apellido3", "NIF_3", "Tf_Empl_3",2,1);

insert into PEDIDO (id_pedido,fecha_pedido,tipo_entrega,total,CLIENTE_id_cliente,TIENDA_id_tienda,fecha_entrega_pedido,EMPLEADO_id_empleado_Repartidor)
                 VALUES(default,curdate(),2,25.0,1,1,null,null);
insert into PEDIDO (id_pedido,fecha_pedido,tipo_entrega,total,CLIENTE_id_cliente,TIENDA_id_tienda,fecha_entrega_pedido,EMPLEADO_id_empleado_Repartidor)
                 VALUES(default,curdate(),1,10.50,2,1,curdate(),2);
insert into PEDIDO (id_pedido,fecha_pedido,tipo_entrega,total,CLIENTE_id_cliente,TIENDA_id_tienda,fecha_entrega_pedido,EMPLEADO_id_empleado_Repartidor)
                 VALUES(default,curdate(),1,75.20,1,1,null,1);

insert into PRODUCTO(id_producto,nombre,descripcion,imagen,precio)VALUES(default, 1, "Pizza Pollo", "imagen1", 5);
insert into PRODUCTO(id_producto,nombre,descripcion,imagen,precio)VALUES(default, 3, "Cerveza", "imagen2", 5);
insert into PRODUCTO(id_producto,nombre,descripcion,imagen,precio)VALUES(default, 3, "Coca-Cola", "imagen3", 2.45);

insert into PIZZA(CATEGORIA_id_categoria,PRODUCTO_id_producto)VALUES(1, 1);
insert into PIZZA(CATEGORIA_id_categoria,PRODUCTO_id_producto)VALUES(2, 1);
insert into PIZZA(CATEGORIA_id_categoria,PRODUCTO_id_producto)VALUES(3, 1);

insert into CONTIENE(PEDIDO_id_pedido,PRODUCTO_id_producto,cantidad)VALUES(2, 3,2);
insert into CONTIENE(PEDIDO_id_pedido,PRODUCTO_id_producto,cantidad)VALUES(1, 2,5);
insert into CONTIENE(PEDIDO_id_pedido,PRODUCTO_id_producto,cantidad)VALUES(1, 3,15);
