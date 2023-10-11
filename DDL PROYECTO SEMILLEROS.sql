-- This script was generated by the ERD tool in pgAdmin 4.
-- Please log an issue at https://redmine.postgresql.org/projects/pgadmin4/issues/new if you find any bugs, including reproduction steps.
BEGIN;

CREATE SCHEMA IF NOT EXISTS investigation;

CREATE TABLE IF NOT EXISTS investigation.persona
(
    id bigserial NOT NULL,
    id_tipo_documento bigint NOT NULL,
    numero_identificacion character varying(255) COLLATE pg_catalog."default" NOT NULL,
    primer_nombre character varying(255) COLLATE pg_catalog."default" NOT NULL,
    segundo_nombre character varying(255) COLLATE pg_catalog."default",
    primer_apellido character varying(255) COLLATE pg_catalog."default" NOT NULL,
    segundo_apellido character varying(255) COLLATE pg_catalog."default",
    email_personal character varying(255) COLLATE pg_catalog."default" NOT NULL,
    email_institucional character varying(255) COLLATE pg_catalog."default" NOT NULL,
    id_programa bigint,
    PRIMARY KEY (id),
    CONSTRAINT identification_number_unique UNIQUE (numero_identificacion)
);

COMMENT ON COLUMN investigation.persona.id_tipo_documento
    IS 'campo para el id del tipo de documento de la perosna en cuestion';

COMMENT ON COLUMN investigation.persona.numero_identificacion
    IS 'campo para colocar el numero d eidentificacion unico de una persona.';

COMMENT ON COLUMN investigation.persona.email_institucional
    IS 'campo para colocar el email proporcionado por la universidad.
DATO: Restriccion para solo poder colocar correos que terminen en @unimonserrate.edu.co';

COMMENT ON COLUMN investigation.persona.id_programa
    IS 'campo para colocar la id del programa de una persona
DATO: No es obligatorio que la persona pertenezca a un programa.';

CREATE TABLE IF NOT EXISTS investigation.semilleros
(
    id bigserial NOT NULL,
    nombre character varying(255) NOT NULL,
    id_grupo_investigacion bigint,
    CONSTRAINT "PK_id_semillero" PRIMARY KEY (id)
);

COMMENT ON TABLE investigation.semilleros
    IS 'Tabla para almacenar los semilleros que se encuentran en la institucion';

COMMENT ON COLUMN investigation.semilleros.nombre
    IS 'Nombre del semillero en cuestion';

COMMENT ON COLUMN investigation.semilleros.id_grupo_investigacion
    IS 'en este campo se colocara el grupo de investigación al cual pertenece un semillero, debido a que un semillero siempre debe estar dentro de un grupo de investigacion';

CREATE TABLE IF NOT EXISTS investigation.semilleros_personas
(
    id bigserial NOT NULL,
    fecha_registro timestamp with time zone NOT NULL,
    id_semillero bigint NOT NULL,
    id_persona bigint NOT NULL,
    id_rol_semillero bigint,
    fecha_ingreso date NOT NULL,
    fecha_salida date,
    CONSTRAINT pk_id_semillero PRIMARY KEY (id)
);

COMMENT ON COLUMN investigation.semilleros_personas.id_semillero
    IS 'Esta columna es para colocar las id del semillero al cual deseamos asignarle personas';

COMMENT ON COLUMN investigation.semilleros_personas.id_persona
    IS 'En este espacio se colocan las id de las personas que ingresaran a un semillero
DATO: Tener en cuenta que no se puede colocar de nuevo al profesor que ya se asigno como director de semillero.';

COMMENT ON COLUMN investigation.semilleros_personas.id_rol_semillero
    IS 'Columna para asignar los roles que una persona puede tener dentro de un semillero';

COMMENT ON COLUMN investigation.semilleros_personas.fecha_ingreso
    IS 'Campo para registrar la fecha en la que ingresa una persona al semillero';

COMMENT ON COLUMN investigation.semilleros_personas.fecha_salida
    IS 'Fecha en la que la persona sale del semillero';

CREATE TABLE IF NOT EXISTS investigation.roles
(
    id bigserial NOT NULL,
    nombre character varying(255) NOT NULL,
    PRIMARY KEY (id)
);

COMMENT ON TABLE investigation.roles
    IS 'Tabla para los roles que pueden haber dentro de un grupo de investigación o un semillero.';

COMMENT ON COLUMN investigation.roles.nombre
    IS 'Columna para los nombres de lso roles que pueden haber dentro de un semillero.';

CREATE TABLE IF NOT EXISTS investigation.productos
(
    id bigserial NOT NULL,
    nombre_producto character varying(375) NOT NULL,
    id_persona bigint NOT NULL,
    id_tipo_producto bigint NOT NULL,
    descripcion character varying NOT NULL,
    PRIMARY KEY (id)
);

COMMENT ON COLUMN investigation.productos.id_persona
    IS 'columna para colocar la columna de la persona quien hace la ponencia.
DATO: Crear restriccion para que solo admita personas que esten en un semillero.';

COMMENT ON COLUMN investigation.productos.id_tipo_producto
    IS 'En esta columna se veran las tematicas abordadas en la ponencia del estudiante en cuestion, esta tematica se llamara de la relacion que tenga con las tematicas de cada semillero en especifico, debido a que estas deben estar aclaradas con anticipacion a la ponencia.';

COMMENT ON COLUMN investigation.productos.descripcion
    IS 'En esta columna se manejara un valor true o false, este sera true cuando la ponencia si sea internacional y false cuando no';

CREATE TABLE IF NOT EXISTS investigation.tematicas_semillero
(
    id bigserial NOT NULL,
    id_semillero bigint NOT NULL,
    tematica character varying(275) NOT NULL,
    fecha_registro timestamp with time zone NOT NULL,
    PRIMARY KEY (id)
);

COMMENT ON COLUMN investigation.tematicas_semillero.id_semillero
    IS 'En este campo se coloca la id del semillero para poder asignarle una tematica al mismo';

COMMENT ON COLUMN investigation.tematicas_semillero.fecha_registro
    IS 'Campo para colocar la fecha en la que se registra la tematica.';

CREATE TABLE IF NOT EXISTS investigation.registro_horas_autonomas
(
    id bigserial NOT NULL,
    id_persona bigint NOT NULL,
    fecha_realizacion timestamp with time zone NOT NULL,
    cantidad_horas numeric NOT NULL,
    concepto character varying(55) NOT NULL,
    horas_aprobadas boolean NOT NULL,
    id_persona_aprobadora bigint NOT NULL,
    PRIMARY KEY (id)
);

COMMENT ON COLUMN investigation.registro_horas_autonomas.id_persona
    IS 'En este campo se colocara a la persona la cual s ele están asignando las horas.
DATO: Restricción en la cual solo se puedan colocar personas que estén dentro del semillero.';

COMMENT ON COLUMN investigation.registro_horas_autonomas.fecha_realizacion
    IS 'En este campo se colocara la fecha de realizacion de las horas del estudiante';

COMMENT ON COLUMN investigation.registro_horas_autonomas.cantidad_horas
    IS 'En este campo se colocaran la cantidad de horas que realiza un estudiante como investigación
DATO: Restricción para que no se pueda colocar menos de una hora.';

COMMENT ON COLUMN investigation.registro_horas_autonomas.concepto
    IS 'En este campo se colocara una breve descripción conceptual de que se realiza en esa hroas de investigacion.';

COMMENT ON COLUMN investigation.registro_horas_autonomas.horas_aprobadas
    IS 'En este campo se colocaran las horas que fueron aprobadas por el profesor.
DATO: Hay un proceso el cual automáticamente realiza un registro en las horas de un estudiante pero con la cantidad de horas que aprueba un profesor.';

CREATE TABLE IF NOT EXISTS investigation.grupo_investigacion
(
    id bigserial NOT NULL,
    nombre character varying(255) NOT NULL,
    PRIMARY KEY (id)
);

COMMENT ON COLUMN investigation.grupo_investigacion.nombre
    IS 'campo donde se colocara el nombre del grupo de investigacion';

CREATE TABLE IF NOT EXISTS investigation.persona_grupo_investigacion
(
    id bigserial NOT NULL,
    persona_id bigserial NOT NULL,
    grupo_investigacion_id bigserial NOT NULL,
    fecha_ingreso date NOT NULL,
    fecha_salida date,
    PRIMARY KEY (id)
);

COMMENT ON COLUMN investigation.persona_grupo_investigacion.persona_id
    IS 'espacio para colocar a la persona que esta dentro d eun grupo de investigacion.';

COMMENT ON COLUMN investigation.persona_grupo_investigacion.grupo_investigacion_id
    IS 'campo para colocar el id del grupo de investigacion al que pertenece una persona';

CREATE TABLE IF NOT EXISTS investigation.tipos_de_productos
(
    id bigserial NOT NULL,
    nombre character varying(255) NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS investigation.tipo_de_comunidad
(
    id bigserial NOT NULL,
    nombre character varying(255) NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS investigation.persona_tipo_de_comunidad
(
    id bigserial NOT NULL,
    persona_id bigserial NOT NULL,
    tipo_de_comunidad_id bigserial NOT NULL,
    PRIMARY KEY (id)
);

COMMENT ON COLUMN investigation.persona_tipo_de_comunidad.persona_id
    IS 'campo para colcoar la id de la persona a relacionar con un tipo de comunidad';

CREATE TABLE IF NOT EXISTS investigation.tipo_de_documento
(
    id bigserial NOT NULL,
    nombre character varying(255) NOT NULL,
    abreviatura character varying(50) NOT NULL,
    PRIMARY KEY (id)
);

COMMENT ON COLUMN investigation.tipo_de_documento.nombre
    IS 'campo para el nombre dle tipo de documento que peude tener una persona';

COMMENT ON COLUMN investigation.tipo_de_documento.abreviatura
    IS 'campo para colocar la abreviatura del tipo de documento en cuestion';
	
CREATE TABLE IF NOT EXISTS investigation.tipo_de_programa
(
	id bigserial NOT NULL,
	nombre character varying(255) NOT NULL,
	PRIMARY KEY (id)
);

COMMENT ON COLUMN investigation.tipo_de_programa.nombre
	IS 'Campo para el tipo de programa en cuestion';

CREATE TABLE IF NOT EXISTS investigation.programas
(
    id bigserial NOT NULL,
    nombre character varying(255) NOT NULL,
    id_escuela bigint NOT NULL,
	id_tipo_programa bigint NOT NULL,
    PRIMARY KEY (id)
);

COMMENT ON COLUMN investigation.programas.nombre
    IS 'campo para colocar el nombre dle programa en cuestion';

COMMENT ON COLUMN investigation.programas.id_escuela
    IS 'campo para colocar la id de la escuela a la cual pertence el programa';

CREATE TABLE IF NOT EXISTS investigation.escuela
(
    id bigserial NOT NULL,
    nombre character varying(255) NOT NULL,
    PRIMARY KEY (id)
);

COMMENT ON COLUMN investigation.escuela.nombre
    IS 'campo para colocar le nombre d ela escuela en cuestion';

ALTER TABLE IF EXISTS investigation.persona
    ADD FOREIGN KEY (id_tipo_documento)
    REFERENCES investigation.tipo_de_documento (id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS investigation.persona
    ADD FOREIGN KEY (id_programa)
    REFERENCES investigation.programas (id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS investigation.semilleros
    ADD CONSTRAINT fk_grupo_investigacion FOREIGN KEY (id_grupo_investigacion)
    REFERENCES investigation.grupo_investigacion (id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS investigation.semilleros_personas
    ADD CONSTRAINT fk_id_semillero FOREIGN KEY (id_semillero)
    REFERENCES investigation.semilleros (id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS investigation.semilleros_personas
    ADD CONSTRAINT fk_id_rol_semillero FOREIGN KEY (id_rol_semillero)
    REFERENCES investigation.roles (id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS investigation.semilleros_personas
    ADD FOREIGN KEY (id_persona)
    REFERENCES investigation.persona_tipo_de_comunidad (id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS investigation.productos
    ADD FOREIGN KEY (id_tipo_producto)
    REFERENCES investigation.tipos_de_productos (id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS investigation.productos
    ADD FOREIGN KEY (id_persona)
    REFERENCES investigation.persona_tipo_de_comunidad (id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS investigation.tematicas_semillero
    ADD FOREIGN KEY (id_semillero)
    REFERENCES investigation.semilleros (id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS investigation.registro_horas_autonomas
    ADD FOREIGN KEY (id_persona)
    REFERENCES investigation.persona_tipo_de_comunidad (id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS investigation.registro_horas_autonomas
    ADD FOREIGN KEY (id_persona_aprobadora)
    REFERENCES investigation.persona_tipo_de_comunidad (id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS investigation.persona_grupo_investigacion
    ADD FOREIGN KEY (grupo_investigacion_id)
    REFERENCES investigation.grupo_investigacion (id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS investigation.persona_grupo_investigacion
    ADD FOREIGN KEY (persona_id)
    REFERENCES investigation.persona_tipo_de_comunidad (id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS investigation.persona_tipo_de_comunidad
    ADD FOREIGN KEY (persona_id)
    REFERENCES investigation.persona (id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS investigation.persona_tipo_de_comunidad
    ADD FOREIGN KEY (tipo_de_comunidad_id)
    REFERENCES investigation.tipo_de_comunidad (id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS investigation.programas
    ADD FOREIGN KEY (id_escuela)
    REFERENCES investigation.escuela (id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;
	
ALTER TABLE IF EXISTS investigation.programas
    ADD FOREIGN KEY (id_tipo_programa)
    REFERENCES investigation.tipo_de_programa (id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;

END;