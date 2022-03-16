set SQL_SAFE_UPDATES=0;
DELETE FROM compran;
DELETE FROM ulleres;
DELETE FROM clientes;
DELETE FROM proveedores;
alter table clientes AUTO_INCREMENT=1;
alter table proveedores AUTO_INCREMENT=1;
alter table ulleres AUTO_INCREMENT=1;

INSERT INTO CLIENTES (idcliente, nombre, direccion, telefono, email, fechareg, idcliente_recomedado)
                             VALUES(default,"C_Ana", "C/. Espronceda 23", 65234566,"ana@gmail.com",CURDATE(), null);
INSERT INTO CLIENTES (idcliente, nombre, direccion, telefono, email, fechareg, idcliente_recomedado)
                             VALUES(default,"C_Pedro", "Paseo Martimo 2", 65359326,"pedro@gmail.com",CURDATE(), null);
INSERT INTO CLIENTES (idcliente, nombre, direccion, telefono, email, fechareg, idcliente_recomedado)
                             VALUES(default,"C_Luis", "Plaza Catalunya 2", 653593445,"luis@gmail.com",CURDATE(), null);
INSERT INTO CLIENTES (idcliente, nombre, direccion, telefono, email, fechareg, idcliente_recomedado)
                             VALUES(default,"C_Juan", "Plaza las Palmera 2", 646593445,"juan@gmail.com",CURDATE(), null);
                             

INSERT INTO PROVEEDORES(idproveedorr,nombre,numero,piso,puerta,ciudad,codigopostal,calle,pais,telefono,fax,nif)
                             VALUES(default, "PLuis", 1,"2A", "3","Barcelona", "08018", "C/. Bilbao", "Spain",111111111,11111111,"NIFProveedor_1");
INSERT INTO PROVEEDORES(idproveedorr,nombre,numero,piso,puerta,ciudad,codigopostal,calle,pais,telefono,fax,nif)
                             VALUES(default, "Pjuan", 1,"2A", "3","Valencia", "46022", "Plaza Tetuan", "Spain",22222222,22222, "NIFProveedor_2");
INSERT INTO PROVEEDORES(idproveedorr,nombre,numero,piso,puerta,ciudad,codigopostal,calle,pais,telefono,fax,nif)
                             VALUES(default, "PMari Cruz", 1,"2A", "3","Menorca", "56987", "C/. Alaior", "Spain",33333333, 3333, "NIFProveedor_3");

INSERT INTO ULLERES (IdUlleres,Marca,Montura,Graduacion,ColorMontura,ColorVidreo,Precio,PROVEEDORES_idproveedorr)
                              VALUES(default,"Rai-ban",1,5.2,"Dorada","Transparante",100.00, 1);
INSERT INTO ULLERES (IdUlleres,Marca,Montura,Graduacion,ColorMontura,ColorVidreo,Precio,PROVEEDORES_idproveedorr)
                              VALUES(default,"Pepes",2,1.0,"Plateadas","Semi_Transparante",125.50, 1);
INSERT INTO ULLERES (IdUlleres,Marca,Montura,Graduacion,ColorMontura,ColorVidreo,Precio,PROVEEDORES_idproveedorr)
                              VALUES(default,"Police",3,0.0,"Negras","Oscuras",90.00, 2);
                              
INSERT INTO COMPRAN(ULLERES_IdUlleres, CLIENTES_idcliente, id_vendedor) VALUES(1,1,1);
INSERT INTO COMPRAN(ULLERES_IdUlleres,CLIENTES_idcliente,id_vendedor) VALUES(1,2,1);
INSERT INTO COMPRAN(ULLERES_IdUlleres,CLIENTES_idcliente,id_vendedor) VALUES(3,1,2);
INSERT INTO COMPRAN(ULLERES_IdUlleres, CLIENTES_idcliente, id_vendedor) VALUES(1,3,1);
INSERT INTO COMPRAN(ULLERES_IdUlleres,CLIENTES_idcliente,id_vendedor) VALUES(2,1,2);
INSERT INTO COMPRAN(ULLERES_IdUlleres,CLIENTES_idcliente,id_vendedor) VALUES(3,2,3);                             
                             

