CREATE OR REPLACE FUNCTION investigation.contador_registros(
	nombre_tabla character varying
) RETURNS integer
AS $$
DECLARE
	resultado int;
BEGIN

    EXECUTE 'SELECT COUNT(*) FROM ' || nombre_tabla INTO resultado;
	RETURN COALESCE(resultado,0);
END;
$$ LANGUAGE plpgsql;

SELECT 
t1.table_name AS Tabla,
(SELECT investigation.contador_registros(t1.table_schema || '.' || t1.table_name::character varying)) AS cantidad_registros
FROM information_schema.tables t1 
WHERE t1.table_schema = 'investigation';

