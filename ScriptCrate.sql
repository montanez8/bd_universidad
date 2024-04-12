CREATE DATABASE IF NOT EXISTS bd_universidad;

CREATE TYPE genero AS ENUM ('Masculino', 'Femenino');
CREATE TYPE tipo AS ENUM ('Alumno', 'Profesor');
CREATE TYPE tipo_asignatura AS ENUM ('Obligatoria', 'Optativa', 'Básica');

CREATE TABLE persona(
    id int primary key ,
    nif varchar(9),
    nombre varchar(25),
    apellido1 varchar(25),
    apellido2 varchar(25),
    ciudad varchar(25),
    direccion varchar(25),
    telefono varchar(9),
    fecha_nacimiento date,
    sexo genero,
    tipo tipo
);

CREATE TABLE departamento(
    id int primary key,
    nombre varchar(50)

);

CREATE TABLE profesor(
    id int primary key,
    id_departamento int references departamento(id),
    id_persona int references persona(id)
);

CREATE TABLE grado (
                       id INT PRIMARY KEY,
                       nombre VARCHAR(100) NOT NULL
);


CREATE TABLE asignatura (
                            id INT PRIMARY KEY,
                            nombre VARCHAR(100) NOT NULL,
                            creditos FLOAT NOT NULL,
                            tipo tipo_asignatura NOT NULL,
                            curso smallint  CHECK (curso BETWEEN 1 AND 4) NOT NULL,
                            cuatrimestre smallint CHECK (cuatrimestre BETWEEN 1 AND 2) NOT NULL,
                            id_profesor INT REFERENCES profesor(id),
                            id_grado INT REFERENCES grado(id)
);

CREATE TABLE curso_escolar (
                               id INT PRIMARY KEY,
                               anyo_inicio integer NOT NULL,
                               anyo_fin integer NOT NULL
);



CREATE TABLE alumno_se_matricula_asignatura (
                                                id_alumno INT REFERENCES persona(id),
                                                id_asignatura INT REFERENCES asignatura(id),
                                                id_curso_escolar INT REFERENCES curso_escolar(id),
                                                PRIMARY KEY (id_alumno, id_asignatura, id_curso_escolar)
);

