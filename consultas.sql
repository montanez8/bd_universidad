### **3. Consultas sobre una tabla**

-- Consultas sobre una tabla

-- 1. Devuelve un listado con el primer apellido, segundo apellido y el nombre de todos los alumnos.
-- El listado deberá estar ordenado alfabéticamente de menor a mayor por el primer apellido, segundo apellido y nombre.

SELECT apellido1, apellido2, nombre
FROM persona
where
    public.persona.tipo = 'Alumno'
ORDER BY apellido1, apellido2, nombre;

-- 2. Averigua el nombre y los dos apellidos de los alumnos que **no** han dado de alta su número de teléfono en la base de datos.
SELECT nombre, apellido1, apellido2
FROM persona
WHERE
    telefono IS null;

-- 3. Devuelve el listado de los alumnos que nacieron en `1999`.

SELECT nombre, apellido1, apellido2
FROM persona
WHERE
    tipo = 'Alumno'
    AND fecha_nacimiento BETWEEN '1999-01-01' AND '1999-12-31';

-- 4. Devuelve el listado de profesores que **no** han dado de alta su número de teléfono en la base de datos y además su nif termina en `K`.

SELECT nombre, apellido1, apellido2, nif
FROM persona
    INNER JOIN profesor ON persona.id = profesor.id_persona
WHERE
    tipo = 'Profesor'
    AND telefono IS NULL
    AND nif LIKE '%K';

-- 5. Devuelve el listado de las asignaturas que se imparten en el primer cuatrimestre, en el tercer curso del grado que tiene el identificador `7`.
SELECT nombre
FROM asignatura
WHERE
    curso = 3
    AND cuatrimestre = 1
    AND id_grado = 7;

-- Consultas multitabla(composicion interna)

-- 1. Devuelve un listado con los datos de todas las **alumnas** que se han matriculado alguna vez en el `Grado en Ingeniería Informática (Plan 2015)`.

SELECT p.nombre, p.apellido1, p.apellido2
FROM
    persona p
    INNER JOIN alumno_se_matricula_asignatura am ON p.id = am.id_alumno
    INNER JOIN asignatura a ON a.id = am.id_asignatura
    INNER JOIN grado g ON g.id = a.id_grado
WHERE
    g.nombre = 'Grado en Ingeniería Informática (Plan 2015)'
    AND p.sexo = 'Femenino';

-- 2. Devuelve un listado con todas las asignaturas ofertadas en el `Grado en Ingeniería Informática (Plan 2015)`.

SELECT a.nombre
FROM asignatura a
    INNER JOIN grado g ON g.id = a.id_grado
WHERE
    g.nombre = 'Grado en Ingeniería Informática (Plan 2015)';

-- 3. Devuelve un listado de los profesores junto con el nombre del departamento al que están vinculados.
-- El listado debe devolver cuatro columnas, primer apellido, segundo apellido, nombre y nombre del departamento. El resultado estará ordenado alfabéticament
-- de menor a mayor por los apellidos y el nombre.

SELECT d.nombre, p.apellido1, p.apellido2, p.nombre
FROM
    persona p
    INNER JOIN profesor pr ON pr.id = p.id
    INNER JOIN departamento d ON d.id = pr.id_departamento
ORDER BY d.nombre, p.apellido1, p.apellido2, p.nombre;

-- 4. Devuelve un listado con el nombre de las asignaturas, año de inicio y año de fin del curso escolar del alumno con nif `26902806M`.

SELECT a.nombre, c.anyo_inicio, c.anyo_fin
FROM
    alumno_se_matricula_asignatura am
    INNER JOIN asignatura a ON a.id = am.id_asignatura
    INNER JOIN curso_escolar c ON c.id = am.id_curso_escolar
    INNER JOIN persona p ON p.id = am.id_alumno
WHERE
    p.nif = '26902806M';

-- 5. Devuelve un listado con el nombre de todos los departamentos que tienen profesores que imparten alguna asignatura en el
--  `Grado en Ingeniería Informática (Plan 2015)`.

SELECT DISTINCT
    d.nombre
FROM
    departamento d
    INNER JOIN profesor p ON p.id_departamento = d.id
    INNER JOIN asignatura a ON a.id_profesor = p.id
    INNER JOIN grado g ON g.id = a.id_grado
WHERE
    g.nombre = 'Grado en Ingeniería Informática (Plan 2015)';

-- 6. Devuelve un listado con todos los alumnos que se han matriculado en alguna asignatura durante el curso escolar 2018/2019.

SELECT DISTINCT
    p.nombre,
    p.apellido1,
    p.apellido2
FROM
    persona p
    INNER JOIN alumno_se_matricula_asignatura am ON p.id = am.id_alumno
    INNER JOIN curso_escolar c ON c.id = am.id_curso_escolar
WHERE
    c.anyo_inicio = 2018
    AND c.anyo_fin = 2019;

-- consultas multitabla(composicion externa)

-- 1. Devuelve un listado con los nombres de **todos** los profesores y
-- los departamentos que tienen vinculados. El listado también debe mostrar aquellos profesores que no tienen ningún departamento asociado.
-- l listado debe devolver cuatro columnas, nombre del departamento, primer apellido, segundo apellido y nombre del profesor.
--  El resultado estará ordenado alfabéticamente de menor a mayor por el nombre del departamento, apellidos y el nombre.

SELECT COALESCE(d.nombre, 'Sin departamento') AS departamento, p.apellido1, p.apellido2, p.nombre
FROM
    persona p
    LEFT JOIN profesor pr ON pr.id = p.id
    LEFT JOIN departamento d ON d.id = pr.id_departamento
where
    p.tipo = 'Profesor'
ORDER BY departamento, p.apellido1, p.apellido2, p.nombre;

-- 2. Devuelve un listado con los profesores que no están asociados a un departamento.

SELECT
    p.nombre AS nombre_profesor,
    p.apellido1,
    p.apellido2
FROM 
    profesor pr
LEFT JOIN
    persona p ON pr.id_persona = p.id
WHERE
    pr.id_departamento IS NULL;


-- 3. Devuelve un listado con los departamentos que no tienen profesores asociados.

SELECT d.nombre
FROM departamento d
         LEFT JOIN profesor p ON p.id_departamento = d.id
WHERE p.id IS NULL;


-- 4. Devuelve un listado con los profesores que no imparten ninguna asignatura.

    SELECT
    p.nombre AS nombre_profesor,
    p.apellido1,
    p.apellido2
FROM
    profesor pr
LEFT JOIN 
    persona p ON pr.id_persona = p.id
WHERE
    NOT EXISTS (SELECT 1 FROM asignatura WHERE id_profesor = pr.id);

-- 5. Devuelve un listado con las asignaturas que no tienen un profesor asignado.

SELECT
    nombre
FROM
    asignatura
WHERE 
    id_profesor IS NULL;

-- 6. Devuelve un listado con todos los departamentos que tienen alguna asignatura que no se haya impartido en ningún curso escolar.
-- El resultado debe mostrar el nombre del departamento y el nombre de la asignatura que no se haya impartido nunca.

SELECT 
    d.nombre AS nombre_departamento, 
    a.nombre AS nombre_asignatura
FROM 
    departamento d
JOIN 
    profesor pr ON d.id = pr.id_departamento
JOIN 
    asignatura a ON pr.id = a.id_profesor
WHERE 
    NOT EXISTS (SELECT 1 FROM alumno_se_matricula_asignatura WHERE id_asignatura = a.id);


-- Consultas de resumen

-- 1. Calcula cuántos alumnos nacieron en 2005.
SELECT
    COUNT(*) AS num_alumnos
FROM
    persona
WHERE
    tipo = 'Alumno' AND EXTRACT(YEAR FROM fecha_nacimiento) = 2005;


-- 2. Calcula cuántos profesores hay en cada departamento. El resultado sólo debe mostrar dos columnas, una con el nombre del departamento y otra con el número de profesores que hay en ese departamento. El resultado sólo debe incluir los departamentos que tienen profesores asociados y deberá estar ordenado de mayor a menor por el número de profesores.
SELECT
    d.nombre AS nombre_departamento,
    COUNT(pr.id) AS num_profesores
FROM
    departamento d
JOIN
    profesor pr ON d.id = pr.id_departamento
GROUP BY
    d.nombre
ORDER BY
    num_profesores DESC;


-- 3. Devuelve un listado con todos los departamentos y el número de profesores que hay en cada uno de ellos. 
-- Tenga en cuenta que pueden existir departamentos que no tienen profesores asociados. Estos departamentos también tienen que aparecer en el listado.

SELECT
    d.nombre AS nombre_departamento,
    COUNT(pr.id) AS num_profesores
FROM
    departamento d
LEFT JOIN
    profesor pr ON d.id = pr.id_departamento
GROUP BY
    d.nombre;


-- 4. Devuelve un listado con el nombre de todos los grados existentes en la base de datos y el número de asignaturas que tiene cada uno. 
-- Tenga en cuenta que pueden existir grados que no tienen asignaturas asociadas. Estos grados también tienen que aparecer en el listado. 
-- El resultado deberá estar ordenado de mayor a menor por el número de asignaturas.

SELECT
    g.nombre AS nombre_grado,
    COUNT(a.id) AS num_asignaturas
FROM
    grado g
LEFT JOIN
    asignatura a ON g.id = a.id_grado
GROUP BY
    g.nombre
ORDER BY
    num_asignaturas DESC;

-- 5. Devuelve un listado con el nombre de todos los grados existentes en la base de datos y el número de asignaturas que tiene cada uno, 
-- de los grados que tengan más de `40` asignaturas asociadas.

SELECT
    g.nombre AS nombre_grado,
    COUNT(a.id) AS num_asignaturas
FROM
    grado g
JOIN
    asignatura a ON g.id = a.id_grado
GROUP BY
    g.nombre
HAVING
    COUNT(a.id) > 40;

-- 6. Devuelve un listado que muestre el nombre de los grados y la suma del número total de créditos que hay para cada tipo de asignatura. 
-- El resultado debe tener tres columnas: nombre del grado, tipo de asignatura y la suma de los créditos de todas las asignaturas que hay de ese tipo. 
-- Ordene el resultado de mayor a menor por el número total de crédidos.

SELECT
    g.nombre AS nombre_grado,
    a.tipo AS tipo_asignatura,
    SUM(a.creditos) AS total_creditos
FROM
    grado g
JOIN
    asignatura a ON g.id = a.id_grado
GROUP BY
    g.nombre, a.tipo
ORDER BY
    total_creditos DESC;


-- 7. Devuelve un listado que muestre cuántos alumnos se han matriculado de alguna asignatura en cada uno de los cursos escolares. 
-- El resultado deberá mostrar dos columnas, una columna con el año de inicio del curso escolar y otra con el número de alumnos matriculados.
SELECT
    ce.anyo_inicio AS anyo_inicio_curso_escolar,
    COUNT(DISTINCT ama.id_alumno) AS num_alumnos_matriculados
FROM
    curso_escolar ce
JOIN
    alumno_se_matricula_asignatura ama ON ce.id = ama.id_curso_escolar
GROUP BY
    ce.anyo_inicio;

-- 8. Devuelve un listado con el número de asignaturas que imparte cada profesor. El listado debe tener en cuenta aquellos profesores que no imparten ninguna asignatura. 
-- El resultado mostrará cinco columnas: id, nombre, primer apellido, segundo apellido y número de asignaturas. El resultado estará ordenado de mayor a menor por el número de asignaturas.

SELECT
    pr.id AS id_profesor,
    p.nombre AS nombre_profesor,
    p.apellido1,
    p.apellido2,
    COUNT(a.id) AS num_asignaturas
FROM
    profesor pr
JOIN
    persona p ON pr.id_persona = p.id
LEFT JOIN
    asignatura a ON pr.id = a.id_profesor
GROUP BY
    pr.id, p.nombre, p.apellido1, p.apellido2
ORDER BY
    num_asignaturas DESC;



    ### **1.5.8 Subconsultas**

-- 1. Devuelve todos los datos del alumno más joven.

SELECT
    *
FROM
    persona
WHERE
    fecha_nacimiento = (SELECT MAX(fecha_nacimiento) FROM persona WHERE tipo = 'Alumno');

-- 2. Devuelve un listado con los profesores que no están asociados a un departamento.

SELECT
    *
FROM
    persona
WHERE
    fecha_nacimiento = (SELECT MAX(fecha_nacimiento) FROM persona WHERE tipo = 'Alumno');

-- 3. Devuelve un listado con los departamentos que no tienen profesores asociados.

SELECT
    *
FROM
    departamento d
WHERE
    NOT EXISTS (SELECT 1 FROM profesor WHERE id_departamento = d.id);

-- 4. Devuelve un listado con los profesores que tienen un departamento asociado y que no imparten ninguna asignatura.

SELECT
    p.*
FROM
    profesor pr
JOIN
    persona p ON pr.id_persona = p.id
WHERE
    pr.id_departamento IS NOT NULL AND
    NOT EXISTS (SELECT 1 FROM asignatura WHERE id_profesor = pr.id);

-- 5. Devuelve un listado con las asignaturas que no tienen un profesor asignado.

SELECT
    *
FROM
    asignatura
WHERE
    id_profesor IS NULL;

-- 6. Devuelve un listado con todos los departamentos que no han impartido asignaturas en ningún curso escolar

SELECT
    *
FROM
    departamento d
WHERE
    NOT EXISTS (
        SELECT 1
        FROM profesor pr
        JOIN asignatura a ON pr.id = a.id_profesor
        WHERE pr.id_departamento = d.id AND
        EXISTS (SELECT 1 FROM alumno_se_matricula_asignatura WHERE id_asignatura = a.id)
    );