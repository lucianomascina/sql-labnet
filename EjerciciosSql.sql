--Recuperar id, apellido, fecha de contrataci�n, salario de los empleados
SELECT	ID AS 'EMPLEADO ID',
		LAST_NAME AS 'APELLIDO', 
		HIRE_DATE AS 'FECHA DE CONTRATACION',
		ISNULL(SALARY,0) AS 'SALARIO'
FROM	TEST.EMPLOYEES


--Recuperar id, apellido, fecha de contrataci�n, salario anual de los empleados.
SELECT	ID AS 'EMPLEADO ID', 
		LAST_NAME AS 'APELLIDO', 
		HIRE_DATE AS 'FECHA DE CONTRATACION',
		ISNULL(12 * SALARY,0) AS 'SALARIO ANUAL'
FROM	TEST.EMPLOYEES


--Recuperar id, apellido y nombre, fecha de contrataci�n, salario anual de los empleados.
SELECT	ID AS 'EMPLEADO ID',
		CONCAT(LAST_NAME,', ',FIRST_NAME) AS 'APELLIDO Y NOMBRE', 
		HIRE_DATE AS 'FECHA DE CONTRATACION',
		ISNULL(12 * SALARY,0) AS 'SALARIO ANUAL'
FROM	TEST.EMPLOYEES


--Recuperar lista de departamentos que tienen empleados:
--a. Recuperar lista de departamentos de los empleados
SELECT	DEPARTMENTS.ID AS 'ID DEP',
		DEPARTMENTS.DEPARTMENT_NAME AS 'NOMBRE DEP',
		EMPLOYEES.ID AS 'EMPLEADO ID',
		CONCAT(LAST_NAME,', ',FIRST_NAME) AS 'APELLIDO Y NOMBRE'
FROM	TEST.EMPLOYEES, TEST.DEPARTMENTS 
WHERE	EMPLOYEES.DEPARTMENT_ID=DEPARTMENTS.ID
ORDER BY [ID DEP] DESC


--b. Recuperar lista no repetida de departamentos de los empleados
SELECT	DISTINCT TEST.DEPARTMENTS.ID AS 'ID DEP',
		TEST.DEPARTMENTS.DEPARTMENT_NAME AS 'NOMBRE DEP'
FROM	TEST.EMPLOYEES, TEST.DEPARTMENTS 
WHERE	EMPLOYEES.DEPARTMENT_ID=DEPARTMENTS.ID
ORDER BY [ID DEP] DESC


--Recuperar lista de empleados cuyo salario sea menor a 2000.
SELECT	ISNULL(SALARY,0) AS 'SALARIO',
		ID AS 'EMPLEADO ID',
		CONCAT(LAST_NAME,', ',FIRST_NAME) AS 'APELLIDO Y NOMBRE', 
		HIRE_DATE AS 'FECHA DE CONTRATACION'
FROM	TEST.EMPLOYEES
WHERE	SALARY < 2000
ORDER BY SALARIO DESC


--Recuperar lista de empleados cuyo salario sea entre 1800 y 3000
SELECT	SALARY AS 'SALARIO',
		ID AS 'EMPLEADO ID',
		CONCAT(LAST_NAME,', ',FIRST_NAME) AS 'APELLIDO Y NOMBRE',
		HIRE_DATE AS 'FECHA DE CONTRATACION'
FROM	TEST.EMPLOYEES
WHERE	SALARY BETWEEN 1800 AND 3000
ORDER BY SALARIO DESC

--Recuperar lista de empleados cuyo departamento sea 10 o 30 o 31.
SELECT	DEPARTMENT_ID AS 'DEPARTAMENTO ID',
		ID AS 'EMPLEADO ID',
		CONCAT(LAST_NAME,', ',FIRST_NAME) AS 'APELLIDO Y NOMBRE',
		ISNULL(SALARY,0) AS 'SALARIO',
		HIRE_DATE AS 'FECHA DE CONTRATACION'
FROM	TEST.EMPLOYEES 
WHERE	DEPARTMENT_ID IN(10,30,31)
ORDER BY [DEPARTAMENTO ID] DESC


--Recuperar lista de empleados cuyo apellido empiece con F.
SELECT	ID AS 'EMPLEADO ID',
		CONCAT(LAST_NAME,', ',FIRST_NAME) AS 'APELLIDO Y NOMBRE', 
		ISNULL(SALARY,0) AS 'SALARIO',
		HIRE_DATE AS 'FECHA DE CONTRATACION'
FROM	TEST.EMPLOYEES 
WHERE	LAST_NAME LIKE 'F%'


--Recuperar lista de empleados cuyo job_id:
--a. no hay sido definido
SELECT	ID,
		CONCAT(LAST_NAME,', ',FIRST_NAME) AS 'APELLIDO Y NOMBRE', 
		ISNULL(SALARY,0) AS 'SALARIO',
		HIRE_DATE AS 'FECHA DE CONTRATACION',
		ISNULL(JOB_ID,'NULO') AS 'EMPLEO ID'
FROM	TEST.EMPLOYEES 
WHERE	JOB_ID IS NULL


--b. haya sido definido.
SELECT	CONCAT(LAST_NAME,', ',FIRST_NAME) AS 'APELLIDO Y NOMBRE',
		ID AS 'EMPLEADO ID',
		ISNULL(SALARY,0) AS 'SALARIO',
		HIRE_DATE AS 'FECHA DE CONTRATACION',
		JOB_ID AS 'EMPLEO ID'
FROM	TEST.EMPLOYEES 
WHERE	JOB_ID IS NOT NULL
ORDER BY [APELLIDO Y NOMBRE]


--Recuperar lista de empleados cuyo job_id sea �AD_CTB� o �FQ_GRT� (sin usar
--IN) y cuyo salario sea mayor a 1900.
SELECT	JOB_ID AS 'EMPLEO ID',
		ID AS 'EMPLEADO ID',
		CONCAT(LAST_NAME,', ',FIRST_NAME) AS 'APELLIDO Y NOMBRE',
		ISNULL(SALARY,0) AS 'SALARIO',
		HIRE_DATE AS 'FECHA DE CONTRATACION'	
FROM	TEST.EMPLOYEES 
WHERE	(JOB_ID = 'AD_CTB' OR JOB_ID = 'FQ_GRT') AND SALARY > 1900
ORDER BY [EMPLEO ID]


--Recuperar empleados ordenados por fecha de ingreso (desde m�s viejo a m�s nuevo).
SELECT	ID AS 'EMPLEADO ID',
		HIRE_DATE AS 'FECHA DE CONTRATACION',
		CONCAT(LAST_NAME,', ',FIRST_NAME) AS 'APELLIDO Y NOMBRE',
		ISNULL(SALARY,0) AS 'SALARIO',
		ISNULL(JOB_ID, 'NULO') AS 'ID EMPLEO'
FROM	TEST.EMPLOYEES 
ORDER BY [FECHA DE CONTRATACION] ASC


--Recuperar empleados ordenados por fecha de ingreso descendente y apellido ascendente.
SELECT	ID AS 'EMPLEADO ID',
		HIRE_DATE AS 'FECHA DE CONTRATACION',
		LAST_NAME AS 'APELLIDO', 
		ISNULL(SALARY,0) AS 'SALARIO',
		ISNULL(JOB_ID, 'VACIO') AS 'ID EMPLEO'
FROM	TEST.EMPLOYEES 
ORDER BY [FECHA DE CONTRATACION] DESC, LAST_NAME ASC 


--Recuperar apellido y salario anual de empleados ordenados por salario anual.
SELECT	ISNULL(12 * SALARY,0) AS 'SALARIO ANUAL',
		LAST_NAME AS 'APELLIDO',
		ID AS 'EMPLEADO ID'
FROM	TEST.EMPLOYEES
ORDER BY [SALARIO ANUAL] DESC


--Recuperar lista de empleados con la descripci�n del departamento al que cada uno pertenece.
SELECT	EMPLOYEES.ID AS 'EMPLEADO ID',
		CONCAT(LAST_NAME,', ',FIRST_NAME) AS 'APELLIDO Y NOMBRE',
		ISNULL(EMPLOYEES.SALARY,0) AS 'SALARIO',
		DEPARTMENTS.ID AS 'ID DEPARTAMENTO',
		ISNULL(DEPARTMENTS.DEPARTMENT_DESCRIPTION, 'NULO') AS 'DESCRIPCION DEP'
FROM	TEST.EMPLOYEES
INNER JOIN TEST.DEPARTMENTS ON EMPLOYEES.DEPARTMENT_ID=DEPARTMENTS.ID


--Recuperar lista de empleados con la descripci�n del departamento, tengan o no departamento asignado.
SELECT	EMPLOYEES.ID AS 'EMPLEADO ID',
		CONCAT(LAST_NAME,', ',FIRST_NAME) AS 'APELLIDO Y NOMBRE',
		ISNULL(EMPLOYEES.SALARY,0) AS 'SALARIO', 
		DEPARTMENTS.ID AS 'ID DEPARTAMENTO',
		ISNULL(DEPARTMENTS.DEPARTMENT_DESCRIPTION, 'NULO') AS 'DESCRIPCION DEP'
FROM	TEST.EMPLOYEES
LEFT JOIN TEST.DEPARTMENTS ON EMPLOYEES.DEPARTMENT_ID=DEPARTMENTS.ID


--Recuperar lista de departamentos con empleados de cada departamento, tengan o no empleados asociados.
SELECT	DEPARTMENTS.ID AS 'DEPARTAMENTO ID', 
		DEPARTMENTS.DEPARTMENT_NAME AS 'NOMBRE DEP', 
		DEPARTMENTS.DEPARTMENT_DESCRIPTION AS 'DESCRIPCION DEP',
		EMPLOYEES.ID AS 'EMPLEADO ID',
		CONCAT(LAST_NAME,', ',FIRST_NAME) AS 'APELLIDO Y NOMBRE'
FROM	TEST.EMPLOYEES
RIGHT JOIN TEST.DEPARTMENTS ON EMPLOYEES.DEPARTMENT_ID=DEPARTMENTS.ID
ORDER BY [DEPARTAMENTO ID] DESC

--Recuperar lista de subordinados por cada m�nager
SELECT	J.ID AS 'MANAGER ID',
		CONCAT(J.LAST_NAME,', ',J.FIRST_NAME) AS 'MANAGER',
		E.ID AS 'SUBORDINADO ID',
		CONCAT(E.LAST_NAME,', ',E.FIRST_NAME) AS 'SUBORDINADO'
FROM	TEST.EMPLOYEES E
INNER JOIN TEST.EMPLOYEES J ON J.ID = E.MANAGER_ID
ORDER BY MANAGER


--Recuperar m�ximo, m�nimo, promedio, y suma total de salarios de los empleados.
SELECT	MAX(SALARY) AS 'SALARIO MAXIMO',
		MIN(SALARY) AS 'SALARIO MINIMO',
		AVG(SALARY) AS 'SALARIO PROMEDIO', 
		SUM(SALARY) AS 'SUMA TOTAL SALARIOS'
FROM	TEST.EMPLOYEES


--Recuperar m�ximo, m�nimo, promedio, y suma total de fecha de contrataci�n de los empleados.
SELECT	MAX(HIRE_DATE) AS 'FECHA MAXIMA DE CONTRATACION',
		MIN(HIRE_DATE) AS 'FECHA MINIMA DE CONTRATACION'
		--AVG(HIRE_DATE) AS 'FECHA PROMEDIO', 
		--SUM(HIRE_DATE) AS 'FECHA TOTAL'
FROM	TEST.EMPLOYEES


--Obtener la cantidad de empleados de cada departamento.
SELECT	EMPLOYEES.DEPARTMENT_ID AS 'DEPARTAMENTO ID',
		COUNT(EMPLOYEES.ID) AS 'CANTIDAD EMPLEADOS'
FROM	TEST.EMPLOYEES
GROUP BY DEPARTMENT_ID
HAVING	DEPARTMENT_ID IS NOT NULL
ORDER BY [DEPARTAMENTO ID] DESC


--Obtener la cantidad de empleados por cada departamento y job.
SELECT	EMPLOYEES.DEPARTMENT_ID AS 'DEPARTAMENTO ID',
		EMPLOYEES.JOB_ID AS 'TRABAJO ID',
		COUNT(EMPLOYEES.ID) AS 'CANT EMPLEADOS'
FROM	TEST.EMPLOYEES
GROUP BY DEPARTMENT_ID,JOB_ID
HAVING	DEPARTMENT_ID IS NOT NULL
ORDER BY [DEPARTAMENTO ID] DESC


--Recuperar los departamentos y el salario promedio si es menor a 1200.
SELECT	EMPLOYEES.DEPARTMENT_ID AS 'ID DEPARTAMENTO',
		AVG(SALARY) AS 'SALARIO PROMEDIO'
FROM	TEST.EMPLOYEES
GROUP BY DEPARTMENT_ID
HAVING	AVG(SALARY) < 1200


--Caso 1: Crear insert de todos los campos en orden.
INSERT INTO TEST.DEPARTMENTS(ID, DEPARTMENT_NAME, LOCATION_ID, DEPARTMENT_DESCRIPTION)
VALUES(60, 'SISTEMAS', 2, 'DEPARTAMENTO SISTEMAS')

INSERT INTO TEST.EMPLOYEES(ID, FIRST_NAME, LAST_NAME, SALARY, DEPARTMENT_ID, JOB_ID, HIRE_DATE, MANAGER_ID)
VALUES(19, 'LUCIANO', 'MASCINA', 5000.0, 60,'AD_PBC', '2022-09-21', 2)

INSERT INTO TEST.JOBS(ID, JOB_NAME)
VALUES('SYS', 'ANALYST')

INSERT INTO TEST.LOCATIONS(ID, CITY)
VALUES(4, 'MAR DEL PLATA')


--Crear insert usando solamente los campos obligatorios.
INSERT INTO TEST.DEPARTMENTS(ID, DEPARTMENT_NAME, LOCATION_ID)
VALUES(70, 'MANTENIMIENTO', 3)

INSERT INTO TEST.EMPLOYEES(ID, FIRST_NAME, LAST_NAME, HIRE_DATE)
VALUES(20, 'LIONEL', 'MESSI', '2022-09-20')

INSERT INTO TEST.JOBS(ID, JOB_NAME)
VALUES('MANT', 'ENCARGADO')

INSERT INTO TEST.LOCATIONS(ID, CITY)
VALUES('5', 'SAN LUIS')


--Crear un nuevo empleado basado en los datos de Gustavo Boulette:
--cambiando su nombre
--aumentando su sueldo en $200.
--blanqueando su manager
INSERT INTO TEST.EMPLOYEES(ID, FIRST_NAME, LAST_NAME, SALARY, DEPARTMENT_ID, JOB_ID, HIRE_DATE, MANAGER_ID)
SELECT	19, 'LEANDRO', LAST_NAME, SALARY+200, DEPARTMENT_ID, JOB_ID, HIRE_DATE, 2  
FROM	TEST.EMPLOYEES
WHERE	ID=12


--Actualizar salario del empleado 10 a $1100.
UPDATE	TEST.EMPLOYEES
SET		SALARY=1100
WHERE	EMPLOYEES.ID=10


--Aumentar salario en un 10% a todos los empleados del departamento 40.
UPDATE	TEST.EMPLOYEES
SET		SALARY=SALARY * 1.10
WHERE	EMPLOYEES.DEPARTMENT_ID=40


--Eliminar departamentos cuyo id sea mayor a 50.
DELETE 
FROM	TEST.DEPARTMENTS
WHERE	DEPARTMENTS.ID > 50


--Eliminar departamento 40.
DELETE 
FROM	TEST.DEPARTMENTS
WHERE	DEPARTMENTS.ID=40


--Crear la funci�n fn_AntiguedadEmpleado que retorne la antiguedad en a�os de cada
--empleado donde el parametro de ingreso es el id del empleado
GO
CREATE FUNCTION fn_AntiguedadEmpleado(@id INT)
RETURNS INT
AS
BEGIN
	DECLARE @ANTIGUEDAD INT 
	SELECT @ANTIGUEDAD=DATEDIFF(YEAR,EMPLOYEES.HIRE_DATE,GETDATE())
	FROM TEST.EMPLOYEES
	WHERE ID=@id
	RETURN @ANTIGUEDAD
END
GO
SELECT dbo.fn_AntiguedadEmpleado(5)


--Crear el Procedimiento almacenado "sp_GetNombreAntiguedad" que retorne el primer
--nombre y el apellido separados por una coma y en la segunda columna la antiguedad en a�o. Usar
--la funci�n creada en el punto anterior.
--Ordenar por antiguedad descendiente (mas antiguo primero)
GO
CREATE PROCEDURE sp_GetNombreAntiguedad
AS
BEGIN
	SELECT	CONCAT(LAST_NAME,', ',FIRST_NAME) AS 'APELLIDO Y NOMBRE',
			dbo.fn_AntiguedadEmpleado(ID) AS 'ANTIGUEDAD'
	FROM	TEST.EMPLOYEES
	WHERE   EMPLOYEES.ID=ID
	ORDER BY ANTIGUEDAD DESC
END

EXEC sp_GetNombreAntiguedad

--VERSION CON WHILE
GO
CREATE PROCEDURE sp_GetNombreAntiguedad2
AS
BEGIN
	DECLARE	@ROWS INT = (SELECT	COUNT(*) FROM TEST.EMPLOYEES)
	DECLARE @I INT = 1
	DECLARE @TEMP TABLE (NOMBREYAPELLIDO VARCHAR(100), ANTIGUEDAD INT)

	WHILE @I <= @ROWS	
	BEGIN
		INSERT	INTO @TEMP (NOMBREYAPELLIDO, ANTIGUEDAD)
		SELECT	CONCAT(LAST_NAME,', ',FIRST_NAME),
				dbo.fn_AntiguedadEmpleado(ID) AS 'ANTIGUEDAD'
		FROM	TEST.EMPLOYEES
		WHERE   EMPLOYEES.ID=@I
		
		SET	@I = @I + 1
	END

	SELECT	NOMBREYAPELLIDO AS 'APELLIDO Y NOMBRE',
			ANTIGUEDAD 
	FROM	@TEMP
	ORDER BY ANTIGUEDAD DESC
END

EXEC sp_GetNombreAntiguedad2

--Crear una nueva tabla de �Auditoria� con los siguientes campos: ID (auto incremental),
--Operaci�n (si se hace un insert/delete/update) 
--Fecha
CREATE TABLE TEST.AUDITORIA (
	ID INT IDENTITY(1,1) PRIMARY KEY,
	OPERACION VARCHAR(100) NOT NULL,
	FECHA DATETIME NOT NULL
);


--Crear un trigger sobre la tabla de empleados que al hacer un insert/delete/update registre en la
--nueva tabla de auditoria la operaci�n realizada.
GO
CREATE TRIGGER tr_AUDITORIA
ON TEST.EMPLOYEES
AFTER INSERT,UPDATE,DELETE
AS
SET NOCOUNT ON;
BEGIN 
	IF EXISTS (SELECT 0 FROM inserted)
	BEGIN
		IF EXISTS (SELECT 0 FROM deleted)
		BEGIN 
			INSERT	INTO TEST.AUDITORIA(OPERACION,FECHA)
			SELECT	CONCAT('SE ACTUALIZARON VALORES DEL EMPLEADO ',LAST_NAME,', ',FIRST_NAME),
					GETDATE()
			FROM INSERTED
		END ELSE
		BEGIN
			INSERT	INTO TEST.AUDITORIA(OPERACION,FECHA)
			SELECT	CONCAT('SE INSERTARON VALORES DEL EMPLEADO ',LAST_NAME,', ',FIRST_NAME),
					GETDATE()
			FROM INSERTED
		END
	END ELSE 
	BEGIN
		INSERT	INTO TEST.AUDITORIA(OPERACION,FECHA)
		SELECT	CONCAT('SE BORRARON VALORES DEL EMPLEADO ',LAST_NAME,', ',FIRST_NAME),
				GETDATE()
		FROM DELETED
	END 
END
