-- Insert tablas

-- Insert tabla persona
INSERT INTO
    persona (
        id, nif, nombre, apellido1, apellido2, ciudad, direccion, telefono, fecha_nacimiento, sexo, tipo
    )
values (
        1, '123456789', 'Juan', 'Perez', 'Gomez', 'Bucaramanga', 'Calle Principal 123', '123456789', '1990-01-01', 'Masculino', 'Profesor'
    ),
    (
        2, '223456789', 'Carlos', 'Lopez', 'Fernandez', 'Bucaramanga', 'Calle Secundaria 456', '22346789', '1991-02-02', 'Masculino', 'Profesor'
    ),
    (
        3, '323456789', 'Maria', 'Martinez', 'Rodriguez', 'Bucaramanga', 'Avenida de la Paz 789', '33456789', '1992-03-03', 'Femenino', 'Profesor'
    ),
    (
        4, '423456789', 'Ana', 'Garcia', 'Sanchez', 'Bucaramanga', 'Plaza Mayor 321', '42346789', '1993-04-04', 'Femenino', 'Profesor'
    ),
    (
        5, '523456789', 'Pedro', 'Gonzalez', 'Torres', 'Bucaramanga', 'Calle del Sol 654', '52346789', '1994-05-05', 'Masculino', 'Profesor'
    ),
    (
        6, '623456789', 'Laura', 'Fernandez', 'Lopez', 'Bucaramanga', 'Calle Nueva 987', '62345789', '1995-06-06', 'Femenino', 'Profesor'
    ),
    (
        7, '723456789', 'Javier', 'Ramirez', 'Santos', 'Bucaramanga', 'Avenida del Parque 741', '72346789', '1996-07-07', 'Masculino', 'Profesor'
    ),
    (
        8, '823456789', 'Sara', 'Jimenez', 'Hernandez', 'Bucaramanga', 'Calle Mayor 852', '82345789', '1997-08-08', 'Femenino', 'Profesor'
    ),
    (
        9, '923456789', 'Diego', 'Moreno', 'Vargas', 'Bucaramanga', 'Paseo del Rio 369', '92345679', '1998-09-09', 'Masculino', 'Profesor'
    ),
    (
        10, '102345678', 'Elena', 'Ruiz', 'Luna', 'Bucaramanga', 'Carrera Principal 147', '102356789', '1999-10-10', 'Femenino', 'Profesor'
    ),
    (
        11, '112345678', 'Alejandro', 'Herrera', 'Molina', 'Bucaramanga', 'Avenida Central 258', '112345678', '2000-11-11', 'Masculino', 'Profesor'
    ),
    (
        12, '122345678', 'Natalia', 'Gutierrez', 'Ortega', 'Bucaramanga', 'Calle del Bosque 369', '122345678', '2001-12-12', 'Femenino', 'Profesor'
    ),
    (
        13, '132345678', 'Gabriel', 'Silva', 'Cruz', 'Bucaramanga', 'Plaza del Sol 741', '132345678', '2002-01-13', 'Masculino', 'Profesor'
    ),
    (
        14, '142345678', 'Lucia', 'Torres', 'Reyes', 'Bucaramanga', 'Avenida Libertad 852', '142345678', '2003-02-14', 'Femenino', 'Profesor'
    ),
    (
        15, '152345678', 'Manuel', 'Molina', 'Garcia', 'Bucaramanga', 'Calle del Rio 963', '152345678', '2004-03-15', 'Masculino', 'Profesor'
    ),
    (
        16, '16245789', 'Luis', 'Hernandez', 'Garcia', 'Bucaramanga', 'Calle del Estudiante 123', '162346789', '2005-04-16', 'Masculino', 'Alumno'
    ),
    (
        17, '172356789', 'Carolina', 'Martinez', 'Lopez', 'Bucaramanga', 'Avenida 456', '173456789', '2006-05-17', 'Femenino', 'Alumno'
    ),
    (
        18, '182456789', 'Andres', 'Gonzalez', 'Sanchez', 'Bucaramanga', 'Carre 789', '182346789', '2007-06-18', 'Masculino', 'Alumno'
    ),
    (
        19, '192356789', 'Isabel', 'Rodriguez', 'Fernandez', 'Bucaramanga', 'Plaza', '192345679', '2008-07-19', 'Femenino', 'Alumno'
    ),
    (
        20, '202346789', 'Mateo', 'Perez', 'Torres', 'Bucaramanga', 'Calle 4', '203456789', '2009-08-20', 'Masculino', 'Alumno'
    ),
    (
        21, '212345789', 'Valeria', 'Lopez', 'Gomez', 'Bucaramanga', 'Avenida 987', '212356789', '2010-09-21', 'Femenino', 'Alumno'
    ),
    (
        23, '232356789', 'Sofia', 'Gomez', 'Lopez', 'Bucaramanga', 'Avenid 852', '232345789', '2012-11-23', 'Femenino', 'Alumno'
    ),
    (
        24, '242456789', 'Daniel', 'Torres', 'Sanchez', 'Bucaramanga', 'Calle  369', '242356789', '2013-12-24', 'Masculino', 'Alumno'
    ),
    (
        25, '253456789', 'Paula', 'Garcia', 'Gomez', 'Bucaramanga', 'Avenida  147', '252346789', '2014-01-25', 'Femenino', 'Alumno'
    ),
    (
        26, '263456789', 'Pablo', 'Lopez', 'Fernandez', 'Bucaramanga', 'Calle  258', '262346789', '2015-02-26', 'Masculino', 'Alumno'
    ),
    (
        27, '272456789', 'Carmen', 'Sanchez', 'Gomez', 'Bucaramanga', 'Avenida 369', '272456789', '2016-03-27', 'Femenino', 'Alumno'
    ),
    (
        28, '282356789', 'Jorge', 'Gomez', 'Fernandez', 'Bucaramanga', 'Calle 741', '282356789', '2017-04-28', 'Masculino', 'Alumno'
    ),
    (
        29, '292346789', 'Eva', 'Fernandez', 'Gomez', 'Bucaramanga', 'Avenida  852', '292345689', '2018-05-29', 'Femenino', 'Alumno'
    ),
    (
        30, '302345789', 'Alvaro', 'Garcia', 'Sanchez', 'Bucaramanga', 'Calle 369', '302356789', '2019-06-30', 'Masculino', 'Alumno'
    ),
    (
        22, '222346789', 'Santiago', 'Sanchez', 'Fernandez', 'Bucaramanga', 'Calle 741', '223456789', '2011-10-22', 'Masculino', 'Alumno'
    );

-- Insert tabla departamento
INSERT INTO
    departamento (id, nombre)
VALUES (
        1, 'Departamento de Informática'
    ),
    (
        2, 'Departamento de Matemáticas'
    ),
    (3, 'Departamento de Física'),
    (4, 'Departamento de Química'),
    (5, 'Departamento de Biología'),
    (
        6, 'Departamento de Geografía'
    ),
    (7, 'Departamento de Historia'),
    (8, 'Departamento de Arte'),
    (9, 'Departamento de Derecho'),
    (
        10, 'Departamento de Economía'
    ),
    (
        11, 'Departamento de Psicología'
    ),
    (
        12, 'Departamento de Sociología'
    ),
    (
        13, 'Departamento de Filosofía'
    ),
    (
        14, 'Departamento de Lenguas Extranjeras'
    ),
    (
        15, 'Departamento de Educación Física'
    );

-- Insert tabla profesor
INSERT INTO
    profesor (id, id_departamento, id)
VALUES (1, 1, 1),
    (2, 2, 2),
    (3, 3, 3),
    (4, 4, 4),
    (5, 5, 5),
    (6, 6, 6),
    (7, 7, 7),
    (8, 8, 8),
    (9, 9, 9),
    (10, 10, 10),
    (11, 11, 11),
    (12, 12, 12),
    (13, 13, 13),
    (14, 14, 14),
    (15, 15, 15);

-- Insert tabla grado
INSERT INTO
    grado (id, nombre)
VALUES (1, 'Ingeniería Informática'),
    (2, 'Ingeniería Civil'),
    (3, 'Ingeniería Mecánica'),
    (4, 'Ingeniería Eléctrica'),
    (5, 'Ingeniería Química'),
    (6, 'Ingeniería Aeronáutica'),
    (7, 'Ingeniería Ambiental'),
    (8, 'Ingeniería Industrial'),
    (9, 'Ingeniería Biomédica'),
    (10, 'Ingeniería de Sistemas'),
    (
        11, 'Ingeniería de Telecomunicaciones'
    ),
    (
        12, 'Ingeniería de Materiales'
    ),
    (
        13, 'Ingeniería de Construcción'
    ),
    (
        14, 'Ingeniería de Transporte'
    ),
    (15, 'Ingeniería de Minas');

-- Insert tabla asignatura
insert into
    asignatura (
        id, nombre, creditos, tipo, curso, cuatrimestre, id_profesor, id_grado
    )
values (
        1, 'Base de Datos', 5, 'Obligatoria', 2, 1, 1, 1
    ),
    (
        2, 'Programación', 6, 'Obligatoria', 2, 1, 2, 2
    ),
    (
        3, 'Algoritmos y Estructuras de Datos', 4, 'Optativa', 2, 2, 3, 3
    ),
    (
        4, 'Ingeniería de Software', 7, 'Obligatoria', 2, 2, 4, 4
    ),
    (
        9, 'Programacion en Java', 7, 'Obligatoria', 2, 2, 9, 9
    ),
    (
        10, 'Estructuras de datos y algoritmos', 6, 'Optativa', 2, 1, 10, 10
    ),
    (
        6, 'Calculo', 6, 'Optativa', 2, 1, 2, 6
    ),
    (
        8, 'Química', 8, 'Optativa', 2, 1, 1, 8
    ),
    (
        12, 'Redes', 8, 'Optativa', 2, 2, 12, 12
    ),
    (
        5, 'Algebra lineal', 8, 'Obligatoria', 2, 2, 5, 5
    ),
    (
        15, 'Seguridad Informatica', 7, 'Obligatoria', 3, 2, 15, 15
    ),
    (
        14, 'Base de datos', 6, 'Optativa', 2, 2, 14, 14
    ),
    (
        11, 'Gestión de proyectos de software', 7, 'Obligatoria', 2, 1, 11, 11
    ),
    (
        7, 'Introduccion a la psicología', 7, 'Obligatoria', 2, 1, 7, 7
    ),
    (
        13, 'Sistemas Operativos', 7, 'Obligatoria', 1, 2, 13, 13
    );

-- Insert tabla curso_escolar
INSERT INTO
    curso_escolar (id, anyo_inicio, anyo_fin)
VALUES (1, 2023, 2015),
    (2, 2023, 2015),
    (3, 2023, 2024),
    (4, 2023, 2024),
    (5, 2023, 2024),
    (6, 2023, 2024),
    (7, 2023, 2024),
    (8, 2023, 2024),
    (9, 2023, 2024),
    (10, 2023, 2024),
    (11, 2023, 2024),
    (12, 2023, 2024),
    (13, 2023, 2024),
    (14, 2023, 2024),
    (15, 2023, 2024);

-- Insert tabla matricula
INSERT INTO
    alumno_se_matricula_asignatura (
        id_alumno, id_asignatura, id_curso_escolar
    )
VALUES (16, 1, 1),
    (17, 2, 2),
    (18, 3, 3),
    (19, 4, 4),
    (20, 5, 5),
    (21, 6, 6),
    (22, 7, 7),
    (23, 8, 8),
    (24, 9, 9),
    (25, 10, 10),
    (26, 11, 11),
    (27, 12, 12),
    (28, 13, 13),
    (29, 14, 14),
    (30, 15, 15);