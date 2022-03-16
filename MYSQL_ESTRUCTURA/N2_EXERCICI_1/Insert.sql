set SQL_SAFE_UPDATES=0;

DELETE FROM TIENE_PLAYLIST;
DELETE FROM PLAYLIST;
DELETE FROM ME_GUSTA;
DELETE FROM COMENTARIOS;
DELETE FROM TIENE_ETIQUETAS;
DELETE FROM VALORAR_VIDEO;
DELETE FROM VIDEO;
DELETE FROM SUSCRIBE;
DELETE FROM CANAL;
DELETE FROM USUARIOS;
DELETE FROM ETIQUETAS;


alter table CANAL AUTO_INCREMENT=1;
alter table COMENTARIOS AUTO_INCREMENT=1;
alter table ETIQUETAS AUTO_INCREMENT=1;
alter table PLAYLIST AUTO_INCREMENT=1;
alter table USUARIOS AUTO_INCREMENT=1;
alter table VIDEO AUTO_INCREMENT=1;

insert into USUARIOS(id_usuario,password,nom,fecha_nacimiento,sexo,pais,codigo_postal) 
VALUES(default, "abc1234juanX", "Usuario_1",  curdate(), "H", "España", "08018");
insert into USUARIOS(id_usuario,password,nom,fecha_nacimiento,sexo,pais,codigo_postal) 
VALUES(default, "12345", "Usuario_2",  curdate(), "M", "Madrid", "28018");
insert into USUARIOS(id_usuario,password,nom,fecha_nacimiento,sexo,pais,codigo_postal) 
VALUES(default, "12345678", "Usuario_3",  curdate(), "H", "New York", "45234");


insert into ETIQUETAS(id_etiquetas,nombre)VALUES(default, "ETIQUETA_1");
insert into ETIQUETAS(id_etiquetas,nombre)VALUES(default, "ETIQUETA_2");
insert into ETIQUETAS(id_etiquetas,nombre)VALUES(default, "ETIQUETA_3");

insert into PLAYLIST(id_playlist,nombre,fecha_creacion,estado,USUARIOS_id_usuario)
VALUES(default, "playlist1", curdate(), 1,1);
insert into PLAYLIST(id_playlist,nombre,fecha_creacion,estado,USUARIOS_id_usuario)
VALUES(default, "playlist2", curdate(), 1,2);
insert into PLAYLIST(id_playlist,nombre,fecha_creacion,estado,USUARIOS_id_usuario)
VALUES(default, "playlist3", curdate(), 1,3);

insert into VIDEO(id_video,titulo,descripcion,tamano,nom_fichero,duracion,thumbnail,num_reproducciones,num_likes,num_dislkes,estados,USUARIOS_id_usuario,dia_hora_publicacion)
VALUES(default, "VIDEO_1", "DESCRIPCION_1", 790, "FICHERO_1", 95, "THUMBANIL_1", 0, 0,0,1,1,curdate());
insert into VIDEO(id_video,titulo,descripcion,tamano,nom_fichero,duracion,thumbnail,num_reproducciones,num_likes,num_dislkes,estados,USUARIOS_id_usuario,dia_hora_publicacion)
VALUES(default, "VIDEO_2", "DESCRIPCION_2", 1220, "FICHERO_2", 95, "THUMBANIL_2", 1, 0,0,1,1,curdate());
insert into VIDEO(id_video,titulo,descripcion,tamano,nom_fichero,duracion,thumbnail,num_reproducciones,num_likes,num_dislkes,estados,USUARIOS_id_usuario,dia_hora_publicacion)
VALUES(default, "VIDEO_1", "DESCRIPCION_1", 1080, "FICHERO_3", 95, "THUMBANIL_3", 0, 0,0,1,2,curdate());

insert into CANAL(id_canal,nombre,descripcion,fecha_creacion,USUARIOS_id_usuario)
VALUES(default, "CANAL_1", "DESCRIPCION_CANAL_1", curdate(), 1);
insert into CANAL(id_canal,nombre,descripcion,fecha_creacion,USUARIOS_id_usuario)
VALUES(default, "CANAL_2", "DESCRIPCION_CANAL_2", curdate(), 2);
insert into CANAL(id_canal,nombre,descripcion,fecha_creacion,USUARIOS_id_usuario)
VALUES(default, "CANAL_3", "DESCRIPCION_CANAL_3", curdate(), 2);

insert into COMENTARIOS(id_comentario,contenido,dia_hora_comentario,USUARIOS_id_usuario,VIDEO_id_video)
VALUES(default, "contenido_comentario_1", curdate(), 1, 2);
insert into COMENTARIOS(id_comentario,contenido,dia_hora_comentario,USUARIOS_id_usuario,VIDEO_id_video)
VALUES(default, "contenido_comentario_2", curdate(), 1, 2);
insert into COMENTARIOS(id_comentario,contenido,dia_hora_comentario,USUARIOS_id_usuario,VIDEO_id_video)
VALUES(default, "contenido_comentario_3", curdate(), 3, 1);

insert into ME_GUSTA(COMENTARIOS_id_comentario, USUARIOS_id_usuario,`like`,dia_hora)
VALUES (1, 1, 0, curdate());
insert into ME_GUSTA(COMENTARIOS_id_comentario, USUARIOS_id_usuario,`like`,dia_hora)
VALUES (2, 1, 1, curdate());


insert into SUSCRIBE(USUARIOS_id_usuario, CANAL_id_canal) VALUES( 1, 1);
insert into SUSCRIBE(USUARIOS_id_usuario, CANAL_id_canal) VALUES( 2, 2);
insert into SUSCRIBE(USUARIOS_id_usuario, CANAL_id_canal) VALUES( 2, 3);

insert into TIENE_ETIQUETAS(VIDEO_id_video,ETIQUETAS_id_etiquetas) VALUES( 1,1);
insert into TIENE_ETIQUETAS(VIDEO_id_video,ETIQUETAS_id_etiquetas) VALUES( 1,2);


insert into TIENE_PLAYLIST(VIDEO_id_video,PLAYLIST_id_playlist) VALUES(1, 1);
insert into TIENE_PLAYLIST(VIDEO_id_video,PLAYLIST_id_playlist) VALUES(2, 1);
insert into TIENE_PLAYLIST(VIDEO_id_video,PLAYLIST_id_playlist) VALUES(3, 1);


insert into VALORAR_VIDEO(USUARIOS_id_usuario,VIDEO_id_video, `like`,fecha)
VALUES (3, 1, 0, curdate());
insert into VALORAR_VIDEO(USUARIOS_id_usuario,VIDEO_id_video, `like`,fecha)
VALUES (1, 3, 1, curdate());


