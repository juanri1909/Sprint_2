
/*1.- Llista el nom de tots els productos que hi ha en la taula producto.*/
SELECT NOMBRE FROM PRODUCTO;

/*2.- Llista els noms i els preus de tots els productos de la taula producto.*/
SELECT NOMBRE, PRECIO FROM PRODUCTO;
/*
3.-Llista totes les columnes de la taula producto.*/
SELECT * FROM PRODUCTO;
/*
4.- Llista el nom dels productos, el preu en euros i el preu en dòlars estatunidencs (USD).*/
SELECT NOMBRE, CONCAT(PRECIO, "€"), CONCAT(ROUND(PRECIO/0.9 ,1),"$")FROM PRODUCTO;

/*
5.- Llista el nom dels productos, el preu en euros i el preu en dòlars estatunidencs (USD). Utilitza els següents àlies per a les columnes: nom de producto, euros, dolars.
*/
SELECT NOMBRE, CONCAT(PRECIO, "€") AS EUROS, CONCAT(ROUND(PRECIO/0.9 ,1),"$") AS DOLARES FROM PRODUCTO;
/*
6.-Llista els noms i els preus de tots els productos de la taula producto, convertint els noms a majúscula.
*/
SELECT UPPER(NOMBRE), PRECIO FROM PRODUCTO;
/*
7.-Llista els noms i els preus de tots els productos de la taula producto, convertint els noms a minúscula.
*/
SELECT LOWER(NOMBRE), PRECIO FROM PRODUCTO;
/*
8.-Llista el nom de tots els fabricants en una columna, i en una altra columna obtingui en majúscules els dos primers caràcters del nom del fabricant.
*/
SELECT NOMBRE, UPPER(SUBSTRING(NOMBRE,1, 2) )FROM PRODUCTO;
/*
9.-Llista els noms i els preus de tots els productos de la taula producto, arrodonint el valor del preu.
*/
SELECT NOMBRE, ROUND(PRECIO,1), PRECIO FROM PRODUCTO;
/*
10.-Llista els noms i els preus de tots els productos de la taula producto, truncant el valor del preu per a mostrar-lo sense cap xifra decimal.
*/
SELECT NOMBRE, ROUND(PRECIO) FROM PRODUCTO;
/*
11.-Llista el codi dels fabricants que tenen productos en la taula producto.
*/
SELECT codigo FROM FABRICANTE WHERE codigo IN (SELECT codigo_fabricante FROM PRODUCTO);
/*
13.-Llista els noms dels fabricants ordenats de manera ascendent.
*/
SELECT NOMBRE FROM FABRICANTE ORDER BY NOMBRE;
/*
14.-Llista els noms dels fabricants ordenats de manera descendent.
*/
SELECT NOMBRE FROM FABRICANTE ORDER BY NOMBRE DESC;
/*
15.-Llista els noms dels productos ordenats en primer lloc pel nom de manera ascendent i en segon lloc pel preu de manera descendent.
*/
SELECT NOMBRE, PRECIO FROM PRODUCTO  ORDER BY NOMBRE, PRECIO DESC;
/*
16.-Retorna una llista amb les 5 primeres files de la taula fabricante.
*/
SELECT * FROM FABRICANTE LIMIT 5;
/*
17.- Retorna una llista amb 2 files a partir de la quarta fila de la taula fabricante. La quarta fila també s'ha d'incloure en la resposta.
*/
SELECT * FROM FABRICANTE LIMIT 3,2;
/*
20.- Llista el nom de tots els productos del fabricant el codi de fabricant del qual és igual a 2.
*/
SELECT NOMBRE FROM PRODUCTO WHERE  CODIGO IN ( SELECT CODIGO_FABRICANTE FROM PRODUCTO WHERE CODIGO = 2);

