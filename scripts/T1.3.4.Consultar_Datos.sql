USE hospitalizacion;

-- CONSULTAS
-- 1. TOTAL DE REGISTROS POR AÑO
SELECT
	ANIO
	,COUNT(1)
FROM 
	atencion
GROUP BY 
	ANIO;
	
-- 2. TOTAL DE REGISTROS POR ENTIDAD ADMINISTRADORA DE SALUD EAS
SELECT 
	E.descripcion AS NOMBRE_EAS
	,SUM(A.total_atenciones) AS TOTAL_ATENCIONES
FROM 
	atencion AS A 
	LEFT JOIN eas AS E ON 
		A.cod_eas = E.cod 
GROUP BY 
	E.descripcion
ORDER BY 
	SUM(A.total_atenciones) DESC 
LIMIT 10;

-- 3. TOTAL ATENCIONES POR IPS Y SERVICIO PARA HOMBRES MAYORES DE 50 AÑOS
SELECT 
	I.descripcion AS NOMBRE_IPS
	,A.servicio AS SERVICIO
	,SUM(A.total_atenciones) AS TOTAL_ATENCIONES
FROM 
	atencion AS A 
	LEFT JOIN ips AS I ON 
		A.cod_ips = I.cod 
WHERE 
	A.sexo = 'H'
	AND A.edad > 50
GROUP BY 
	I.descripcion, A.servicio 
ORDER BY 
	SUM(A.total_atenciones) DESC 
LIMIT 10;