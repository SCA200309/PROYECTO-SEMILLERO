-- Inserts para la tabla tipo_de_programa
INSERT INTO investigation.tipo_de_programa (nombre)
VALUES
    ('Pregrado'),
    ('Posgrado'),
    ('Diplomado'),
    ('Tecnico'),
    ('Tecnologo');

-- Inserts para la tabla escuela
INSERT INTO investigation.escuela (nombre)
VALUES
    ('Escuela de Ingeniería y Tecnologia'),
    ('Escuela de Ciencias de la Salud'),
    ('Escuela de Educación'),
    ('Escuela de Ciencias Administrativas y Economicas'),
    ('Escuela de Ciencias Humanas y Sociales');

-- Inserts para la tabla tipo_de_documento
INSERT INTO investigation.tipo_de_documento (nombre, abreviatura)
VALUES
    ('Cédula de Ciudadanía', 'CC'),
    ('Tarjeta de Identidad', 'TI'),
    ('Pasaporte', 'P'),
    ('Cédula de Extranjería', 'CE');

-- Inserts para la tabla grupo_investigacion
INSERT INTO investigation.grupo_investigacion (nombre)
VALUES
    ('Grupo de Investigación en Inteligencia Artificial'),
    ('Grupo de Investigación en Psicología Clínica'),
    ('Grupo de Investigación en Enfermería'),
    ('Grupo de Investigación en Educación Inclusiva'),
    ('Grupo de Investigación en Arte Digital'),
    ('Grupo de Investigación en Matemáticas');

-- Inserts para la tabla tipo_de_comunidad
INSERT INTO investigation.tipo_de_comunidad (nombre)
VALUES
    ('Estudiante'),
    ('Profesor'),
    ('Investigador'),
    ('Egresado'),
    ('Comunidad Externa'),
    ('Administrativo'),
    ('Tutor');

-- Inserts para la tabla roles
INSERT INTO investigation.roles (nombre)
VALUES
    ('Director de Semillero'),
    ('Estudiante Investigador'),
    ('Profesor Investigador');

-- Inserts para la tabla tipos_de_productos
INSERT INTO investigation.tipos_de_productos (nombre)
VALUES
    ('Artículo Científico'),
    ('Ponencia Nacional'),
    ('Ponencia Internacional'),
    ('Libro'),
    ('Capítulo de Libro'),
    ('Proyecto de Investigación'),
    ('Informe Técnico'),
    ('Documentación Variada');

-- Inserts para la tabla programas
INSERT INTO investigation.programas (nombre, id_escuela, id_tipo_programa)
VALUES
    ('Ingeniería en Sistemas', 1, 1),
    ('Trabajo Social', 5, 1),
    ('Licenciatura en Educación Infantil', 3, 1),
    ('Atención Integral de la Primera Infancia', 3, 4),
    ('Finanzas Y Negocios Internacionales', 4, 1),
    ('Auxiliar de Veterinaria y Cuidado de Mascotas', 2, 4);

-- Inserts para la tabla persona
INSERT INTO investigation.persona (id_tipo_documento, numero_identificacion, primer_nombre, segundo_nombre, primer_apellido, segundo_apellido, email_personal, email_institucional, id_programa)
VALUES
    (1, '1234567890', 'Juan', 'Carlos', 'Pérez', 'Gómez', 'juan@gmail.com', 'juan@unimonserrate.edu.co', 1),
    (2, '9876543210', 'Ana', NULL, 'García', 'López', 'ana@gmail.com', 'ana@unimonserrate.edu.co', 2),
    (3, '5678901234', 'Pedro', NULL, 'Martínez', 'Rodríguez', 'pedro@gmail.com', 'pedro@unimonserrate.edu.co', NULL),
    (4, '3456789012', 'Luisa', 'María', 'González', 'Sánchez', 'luisa@gmail.com', 'luisa@unimonserrate.edu.co', 3),
    (1, '7890123456', 'Sofía', 'Isabel', 'Ramírez', 'Pérez', 'sofia@gmail.com', 'sofia@unimonserrate.edu.co', NULL),
    (1, '2345678901', 'Carlos', 'Andrés', 'López', 'García', 'carlos@gmail.com', 'carlos@unimonserrate.edu.co', 1),
    (1, '1000255437', 'Sebastian', NULL , 'Cardona', 'Aldana', 'sebastianaldana09@gmail.com', 'scardonaa@unimonserrate.edu.co', 1),
    (2, '9458943210', 'Angie', 'Catalina', 'López', NULL, 'angie@gmail.com', 'ang@unimonserrate.edu.co', 5),
    (3, '4562310123', 'Carlos', 'Martinez', 'Rodríguez', NULL, 'carlosrodriguez@gmail.com', 'carlosmart@unimonserrate.edu.co', 5),
    (4, '7890123846', 'Juan', 'David', 'Pérez', 'Gaitan', 'JuanD876@gmail.com', 'JuanDPerez@unimonserrate.edu.co', 1),
    (1, '2345678150', 'Luis', 'Alfonso', 'Contreras', NULL, 'luisAlfo@gmail.com', 'luisac@unimonserrate.edu.co', 1),
    (2, '5678901004', 'Matias', 'Díaz', 'Alvarado', NULL, 'mda@gmail.com', 'matiasda@unimonserrate.edu.co', 3);

-- Inserts para la tabla persona_tipo_de_comunidad
INSERT INTO investigation.persona_tipo_de_comunidad (persona_id, tipo_de_comunidad_id)
VALUES
    (1, 2),
    (2, 1),
    (3, 4),
    (4, 3),
    (5, 5),
    (6, 6),
    (1, 7),
    (4, 6),
    (8, 7),
    (7, 1),
    (11, 1),
    (12, 1);

-- Inserts para la tabla semilleros
INSERT INTO investigation.semilleros (nombre, id_grupo_investigacion)
VALUES
    ('Semillero de BigData', 1),
    ('Semillero de Psicología Clínica', 2),
    ('Semillero de Enfermería Comunitaria', 3),
    ('Semillero de Educación Inclusiva', 4),
    ('Semillero Solimon', 1);

-- Inserts para la tabla semilleros_personas
INSERT INTO investigation.semilleros_personas (fecha_registro, id_semillero, id_persona, id_rol_semillero, fecha_ingreso, fecha_salida)
VALUES
    ('2018-03-16 10:00:00', 1, 1, 1, '2023-10-06', NULL),
    ('2021-10-25 14:30:00', 2, 2, 2, '2023-10-05', NULL),
    ('2020-10-14 16:45:00', 5, 3, 3, '2023-10-04', NULL),
    ('2021-10-23 09:15:00', 5, 4, 1, '2023-10-03', NULL),
    ('2022-10-12 11:30:00', 5, 5, 2, '2023-10-02', NULL),
    ('2022-07-01 13:20:00', 1, 6, 3, '2023-10-01', NULL),
    ('2023-03-06 10:00:00', 1, 8, 1, '2023-10-06', NULL),
    ('2023-06-25 14:30:00', 5, 7, 2, '2023-10-05', NULL),
    ('2023-09-04 16:45:00', 3, 9, 3, '2023-10-04', NULL),
    ('2023-01-13 09:15:00', 4, 10, 1, '2023-10-03', NULL),
    ('2023-05-02 11:30:00', 4, 12, 2, '2023-10-02', NULL),
    ('2023-08-01 16:20:00', 5, 11, 3, '2023-10-01', NULL);


-- Inserts para la tabla tematicas_semillero
INSERT INTO investigation.tematicas_semillero (id_semillero, tematica, fecha_registro)
VALUES
    (1, 'Machine Learning', '2023-10-06 10:00:00'),
    (2, 'Psicología Infantil', '2023-10-05 14:30:00'),
    (3, 'Salud Comunitaria', '2023-10-04 16:45:00'),
    (4, 'Educación Especial', '2023-10-03 09:15:00'),
    (5, 'Arte Digital 3D', '2023-10-02 11:30:00'),
    (5, 'Álgebra Abstracta', '2023-10-01 13:20:00'),
    (5, 'Influencia del software libre en el desarrollo de nuevas apps', '2023-10-05 13:20:00');

-- Inserts para la tabla persona_grupo_investigacion
INSERT INTO investigation.persona_grupo_investigacion (persona_id, grupo_investigacion_id, fecha_ingreso, fecha_salida)
VALUES
    (1, 1, '2023-10-06', NULL),
    (2, 2, '2023-10-05', NULL),
    (3, 3, '2023-10-04', NULL),
    (4, 4, '2023-10-03', NULL),
    (5, 5, '2023-10-02', NULL),
    (6, 6, '2023-10-01', NULL);

-- Inserts para la tabla productos
INSERT INTO investigation.productos (nombre_producto, id_persona, id_tipo_producto, descripcion)
VALUES
    ('Artículo sobre IA en Medicina', 1, 1, 'Artículo científico internacional'),
    ('Ponencia en Congreso de Psicología', 2, 2, 'Ponencia en congreso nacional'),
    ('Libro de Enfermería Comunitaria', 3, 4, 'Libro de investigación'),
    ('Capítulo de Libro sobre Educación Inclusiva', 4, 5, 'Capítulo en libro académico'),
    ('Proyecto de Investigación en Arte Digital', 5, 6, 'Proyecto de investigación'),
    ('Informe Técnico sobre Geometría Algebraica', 6, 7, 'Informe técnico internacional'),
    ('Diagrama y Modelado Base de Datos', 7, 8,'Diagrama relacional y modelado de la base de datos para el proyecto en cuestión');

-- Inserts para la tabla registro_horas_autonomas
INSERT INTO investigation.registro_horas_autonomas (id_persona, fecha_realizacion, cantidad_horas, concepto, horas_aprobadas, id_persona_aprobadora)
VALUES
    (1, '2023-10-06 10:00:00', 10, 'Investigación en IA', true, 3),
    (2, '2023-10-05 14:30:00', 8, 'Estudio de Caso', true, 1),
    (3, '2023-10-04 16:45:00', 6, 'Revisión Bibliográfica', false, 2),
    (4, '2023-10-03 09:15:00', 12, 'Investigación en Educación', true, 3),
    (5, '2023-10-02 11:30:00', 5, 'Producción Artística', true, 6),
    (6, '2023-10-01 13:20:00', 9, 'Investigación Matemática', true, 4);