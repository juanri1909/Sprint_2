
/* 1.- Retorna un llistat amb el primer cognom, segon cognom i el nom de tots els alumnes. El llistat haurà d'estar ordenat alfabèticament de menor a major pel primer cognom, segon cognom i nom.*/
/*SELECT APELLIDO1, APELLIDO2, NOMBRE FROM PERSONA WHERE ID IN (SELECT id_alumno FROM alumno_se_matricula_asignatura) ORDER BY APELLIDO1, APELLIDO2, NOMBRE;*/
SELECT APELLIDO1, APELLIDO2, NOMBRE FROM PERSONA WHERE tipo = "alumno" ORDER BY APELLIDO1, APELLIDO2, NOMBRE;

/* 2.- Esbrina el nom i els dos cognoms dels alumnes que no han donat d'alta el seu número de telèfon en la base de dades.*/
SELECT APELLIDO1, APELLIDO2, NOMBRE FROM PERSONA WHERE telefono IS NULL AND tipo = "alumno";

/* 3.- Retorna el llistat dels alumnes que van néixer en 1999.*/
/*SELECT * FROM PERSONA WHERE SUBSTRING(fecha_nacimiento,1,4) = "1999" AND ID IN (SELECT id_alumno FROM alumno_se_matricula_asignatura);*/
SELECT * FROM PERSONA WHERE SUBSTRING(fecha_nacimiento,1,4) = "1999" AND tipo = "alumno";

/* 4.- Retorna el llistat de professors que no han donat d'alta el seu número de telèfon en la base de dades i a més la seva nif acaba en K.*/
SELECT * FROM PERSONA WHERE TELEFONO IS NULL AND SUBSTRING(nif ,9,9) = "K" AND tipo = "profesor";

/* 5.- Retorna el llistat de les assignatures que s'imparteixen en el primer quadrimestre, en el tercer curs del grau que té l'identificador 7.*/
SELECT * FROM ASIGNATURA WHERE cuatrimestre = 1 AND curso = 3 AND id_grado = 7;

/* 6.-Retorna un llistat dels professors juntament amb el nom del departament al qual estan vinculats. 
El llistat ha de retornar quatre columnes, primer cognom, segon cognom, nom i nom del departament. 
El resultat estarà ordenat alfabèticament de menor a major pels cognoms i el nom.*/
SELECT persona.apellido1, persona.apellido2, persona.nombre, departamento.nombre  as nombre_departamento FROM persona, profesor, departamento WHERE  persona.id = profesor.id_profesor AND profesor.id_departamento=departamento.id ORDER BY persona.apellido1, persona.nombre;

/* 7.- Retorna un llistat amb el nom de les assignatures, any d'inici i any de fi del curs escolar de l'alumne amb nif 26902806M.*/
SELECT asignatura.nombre, curso_escolar.anyo_inicio, curso_escolar.anyo_fin FROM curso_escolar,asignatura, persona WHERE persona.nif = "26902806M" AND asignatura.id= curso_escolar.id;

/*8*/
SELECT nombre AS DEPARTAMENTO FROM departamento WHERE id IN (SELECT id_departamento FROM profesor WHERE id_profesor IN (SELECT id_profesor FROM asignatura WHERE id_grado IN (SELECT id FROM grado WHERE nombre = "Grado en Ingeniería Informática (Plan 2015)")));


/*9 Retorna un llistat amb tots els alumnes que s'han matriculat en alguna assignatura durant el curs escolar 2018/2019.*/
SELECT nombre,apellido1,apellido2, tipo FROM persona WHERE id IN (SELECT id_alumno FROM alumno_se_matricula_asignatura WHERE id_curso_escolar IN (SELECT id FROM curso_escolar WHERE anyo_inicio = 2018 AND anyo_fin = 2019));

/*CONSULTA RESUMENT
1.- Retorna el nombre total d'alumnes que hi ha.*/
SELECT COUNT(*) AS TOTAL_ALUMNOS FROM alumno_se_matricula_asignatura;
/*2.- Calcula quants alumnes van néixer en 1999.*/
SELECT COUNT(*) AS TOTAL_ALUMNOS_DE_1999 FROM persona WHERE tipo = "alumno" AND SUBSTRING(fecha_nacimiento,1,4) = "1999";

/*
4.- Retorna un llistat amb tots els departaments i el nombre de professors que hi ha en cadascun d'ells. 
Tingui en compte que poden existir departaments que no tenen professors associats. 
Aquests departaments també han d'aparèixer en el llistat. 
*/
SELECT departamento.nombre, COUNT(profesor.id_departamento)  FROM departamento LEFT JOIN profesor ON  profesor.id_departamento=departamento.id GROUP BY departamento.id; 
    
/*5*/
SELECT grado.nombre, COUNT(asignatura.id_grado) FROM grado LEFT JOIN asignatura ON grado.id=asignatura.id_grado GROUP BY grado.id ORDER BY COUNT(asignatura.id_grado) DESC;
/*9*/
SELECT persona.id, persona.nombre, persona.apellido1, persona.apellido2, COUNT(asignatura.id_profesor) FROM persona LEFT JOIN asignatura ON persona.id = asignatura.id_profesor WHERE persona.tipo= "profesor" GROUP BY persona.id ORDER BY COUNT(asignatura.id_profesor) DESC;

/*10.-Retorna totes les dades de l'alumne més jove.*/
SELECT * FROM persona WHERE  fecha_nacimiento = (SELECT MIN(fecha_nacimiento) FROM persona WHERE tipo = "alumno");


/*LEFT JOIN i RIGHT JOIN.*/

/*1.- Retorna un llistat amb els noms de tots els professors i els departaments que tenen vinculats. 
El llistat també ha de mostrar aquells professors que no tenen cap departament associat. 
El llistat ha de retornar quatre columnes, nom del departament, primer cognom, segon cognom i nom del professor. 
El resultat estarà ordenat alfabèticament de menor a major pel nom del departament, cognoms i el nom.*/
SELECT * FROM persona WHERE id IN (SELECT id_profesor FROM profesor LEFT JOIN departamento ON profesor.id_departamento = departamento.id);

/*2.- Retorna un llistat amb els professors que no estan associats a un departament.*/
SELECT * FROM persona LEFT JOIN profesor ON persona.id = profesor.id_profesor WHERE  persona.tipo ="profesor" AND persona.id IS NULL;

/*3.- Retorna un llistat amb els departaments que no tenen professors associats.*/
SELECT nombre FROM departamento LEFT JOIN profesor ON departamento.id = profesor.id_departamento WHERE profesor.id_departamento IS NULL;

/*4.- Retorna un llistat amb els professors que no imparteixen cap assignatura.*/
SELECT persona.nombre, persona.apellido1,persona.apellido2 FROM persona LEFT JOIN asignatura ON persona.id = asignatura.id_profesor WHERE  persona.tipo ="profesor" AND asignatura.id IS NULL;

/*5.- Retorna un llistat amb les assignatures que no tenen un professor assignat.*/
SELECT asignatura.id, asignatura.nombre FROM asignatura LEFT JOIN persona ON persona.id = asignatura.id_profesor WHERE asignatura.id_profesor IS NULL;
