
#DDL (Lenguaje de Definición de Datos)
CREATE TABLE REGIONS (
    REGION_ID INT PRIMARY KEY,
    REGION_NAME VARCHAR(50)
);

CREATE TABLE COUNTRIES (
    COUNTRY_ID INT PRIMARY KEY,
    COUNTRY_NAME VARCHAR(50),
    REGION_ID INT,
    FOREIGN KEY (REGION_ID) REFERENCES REGIONS(REGION_ID)
);

CREATE TABLE LOCATIONS (
    LOCATION_ID INT PRIMARY KEY,
    STREET_ADDRESS VARCHAR(100),
    POSTAL_CODE VARCHAR(20),
    CITY VARCHAR(50),
    STATE_PROVINCE VARCHAR(50),
    COUNTRY_ID INT,
    FOREIGN KEY (COUNTRY_ID) REFERENCES COUNTRIES(COUNTRY_ID)
);

CREATE TABLE JOBS (
    JOB_ID INT PRIMARY KEY,
    GRADE_LEVEL INT,
    LOWEST_SAL DECIMAL(10,2),
    HIGHEST_SAL DECIMAL(10,2)
);
CREATE TABLE DEPARTMENTS (
    DEPARTMENT_ID INT PRIMARY KEY,
    DEPARTMENT_NAME VARCHAR(50),
    MANAGER_ID INT,
    LOCATION_ID INT
);

CREATE TABLE EMPLOYEES (
    EMPLOYEE_ID INT PRIMARY KEY,
    FIRST_NAME VARCHAR(50),
    LAST_NAME VARCHAR(50),
    EMAIL VARCHAR(100),
    PHONE_ VARCHAR(20),
    HIRE_DATE DATE,
    SALARY DECIMAL(10,2),
    COMMISSION_PCT DECIMAL(4,2),
    MANAGER_ID INT,
    JOB_ID INT,
    DEPARTMENT_ID INT,
    FOREIGN KEY (JOB_ID) REFERENCES JOBS(JOB_ID),
);

CREATE TABLE EMPLOYEE_JOB_HISTORY (
    EMPLOYEE_ID INT,
    DEPARTMENT_ID INT,
    JOB_ID INT,
    START_DATE DATE,
    END_DATE DATE,
    FOREIGN KEY (EMPLOYEE_ID) REFERENCES EMPLOYEES(EMPLOYEE_ID),
    FOREIGN KEY (DEPARTMENT_ID) REFERENCES DEPARTMENTS(DEPARTMENT_ID),
    FOREIGN KEY (JOB_ID) REFERENCES JOBS(JOB_ID)
);


#Vamos a insertar datos:



#Insertar datos en la tabla REGIONS
INSERT INTO REGIONS (REGION_ID, REGION_NAME) VALUES
(1, 'Europa Continental');
INSERT INTO REGIONS (REGION_ID, REGION_NAME) VALUES
(2, 'Europa');
INSERT INTO REGIONS (REGION_ID, REGION_NAME) VALUES
(3, 'Asia');
INSERT INTO REGIONS (REGION_ID, REGION_NAME) VALUES
(4, 'América del Sur');
INSERT INTO REGIONS (REGION_ID, REGION_NAME) VALUES
(5, 'África');

#Insertar datos en la tabla COUNTRIES						VA BIEN
INSERT INTO COUNTRIES (COUNTRY_ID, COUNTRY_NAME, REGION_ID) VALUES
(1, 'España', 2);
INSERT INTO COUNTRIES (COUNTRY_ID, COUNTRY_NAME, REGION_ID) VALUES
(2, 'Portugal', 2);
INSERT INTO COUNTRIES (COUNTRY_ID, COUNTRY_NAME, REGION_ID) VALUES
(3, 'Alemania', 2);
INSERT INTO COUNTRIES (COUNTRY_ID, COUNTRY_NAME, REGION_ID) VALUES
(4, 'Francia', 2);
INSERT INTO COUNTRIES (COUNTRY_ID, COUNTRY_NAME, REGION_ID) VALUES
(5, 'Italia', 2);

#Insertar datos en la tabla LOCATIONS					VA BIEN
INSERT INTO LOCATIONS (LOCATION_ID, STREET_ADDRESS, POSTAL_CODE, CITY, STATE_PROVINCE, COUNTRY_ID) VALUES
(1, 'Calle Mayor, 1', '28001', 'Madrid', NULL, 1);
INSERT INTO LOCATIONS (LOCATION_ID, STREET_ADDRESS, POSTAL_CODE, CITY, STATE_PROVINCE, COUNTRY_ID) VALUES		 
(2, 'Calle Mediana, 2', '28003', 'Lisboa', NULL, 2);
INSERT INTO LOCATIONS (LOCATION_ID, STREET_ADDRESS, POSTAL_CODE, CITY, STATE_PROVINCE, COUNTRY_ID) VALUES
(3, 'Calle Grande, 3', '28004', 'Berlín', NULL, 3);
INSERT INTO LOCATIONS (LOCATION_ID, STREET_ADDRESS, POSTAL_CODE, CITY, STATE_PROVINCE, COUNTRY_ID) VALUES
(4, 'Calle Mas Grande , 4', '28005', 'París', NULL, 4);
INSERT INTO LOCATIONS (LOCATION_ID, STREET_ADDRESS, POSTAL_CODE, CITY, STATE_PROVINCE, COUNTRY_ID) VALUES
(5, 'Calle Mas Grande Aún, 5', '28006', 'Roma', NULL, 5);

#Insertar datos en la tabla JOBS 						VA BIEN
INSERT INTO JOBS (JOB_ID, GRADE_LEVEL, LOWEST_SAL, HIGHEST_SAL) VALUES
(1, 1, 30000.00, 50000.00);
INSERT INTO JOBS (JOB_ID, GRADE_LEVEL, LOWEST_SAL, HIGHEST_SAL) VALUES
(2, 2, 40000.00, 60000.00);
INSERT INTO JOBS (JOB_ID, GRADE_LEVEL, LOWEST_SAL, HIGHEST_SAL) VALUES
(3, 3, 50000.00, 70000.00);
INSERT INTO JOBS (JOB_ID, GRADE_LEVEL, LOWEST_SAL, HIGHEST_SAL) VALUES
(4, 4, 60000.00, 80000.00);
INSERT INTO JOBS (JOB_ID, GRADE_LEVEL, LOWEST_SAL, HIGHEST_SAL) VALUES
(5, 5, 70000.00, 90000.00);

#Insertar datos en la tabla DEPARTMENTS
										

INSERT INTO DEPARTMENTS (DEPARTMENT_ID, DEPARTMENT_NAME, MANAGER_ID, LOCATION_ID) VALUES
(1, 'Ventas', 101, 1);
INSERT INTO DEPARTMENTS (DEPARTMENT_ID, DEPARTMENT_NAME, MANAGER_ID, LOCATION_ID) VALUES
(2, 'Marketing', 102, 2);
INSERT INTO DEPARTMENTS (DEPARTMENT_ID, DEPARTMENT_NAME, MANAGER_ID, LOCATION_ID) VALUES
(3, 'Finanzas', 103, 3);
INSERT INTO DEPARTMENTS (DEPARTMENT_ID, DEPARTMENT_NAME, MANAGER_ID, LOCATION_ID) VALUES
(4, 'Logística', 104, 4);
INSERT INTO DEPARTMENTS (DEPARTMENT_ID, DEPARTMENT_NAME, MANAGER_ID, LOCATION_ID) VALUES
(5, 'Gestión', 105, 5);

#Insertar datos en la tabla EMPLOYEES
										
INSERT INTO EMPLOYEES (EMPLOYEE_ID, FIRST_NAME, LAST_NAME, EMAIL, PHONE_, HIRE_DATE, SALARY, COMMISSION_PCT, MANAGER_ID, JOB_ID, DEPARTMENT_ID) VALUES
(101, 'Juan', 'García', 'juan.garcia@example.com', '666222333', TO_DATE('2020-01-01', 'YYYY-MM-DD'), 60000.00, null, null, 1, 1);
INSERT INTO EMPLOYEES (EMPLOYEE_ID, FIRST_NAME, LAST_NAME, EMAIL, PHONE_, HIRE_DATE, SALARY, COMMISSION_PCT, MANAGER_ID, JOB_ID, DEPARTMENT_ID) VALUES
(102, 'María', 'Rodríguez', 'maria.rodriguez@example.com', '666222331', TO_DATE('2020-02-01', 'YYYY-MM-DD'), 70000.00, NULL, NULL, 2, 2);
INSERT INTO EMPLOYEES (EMPLOYEE_ID, FIRST_NAME, LAST_NAME, EMAIL, PHONE_, HIRE_DATE, SALARY, COMMISSION_PCT, MANAGER_ID, JOB_ID, DEPARTMENT_ID) VALUES
(103, 'Pablo', 'Martínez', 'pablo.martinez@example.com', '666222332', TO_DATE('2020-03-01', 'YYYY-MM-DD'), 80000.00, NULL, NULL, 3, 3);
INSERT INTO EMPLOYEES (EMPLOYEE_ID, FIRST_NAME, LAST_NAME, EMAIL, PHONE_, HIRE_DATE, SALARY, COMMISSION_PCT, MANAGER_ID, JOB_ID, DEPARTMENT_ID) VALUES
(104, 'Ana', 'Fernández', 'ana.fernandez@example.com', '666222334', TO_DATE('2020-04-01', 'YYYY-MM-DD'), 90000.00, NULL, NULL, 4, 4);
INSERT INTO EMPLOYEES (EMPLOYEE_ID, FIRST_NAME, LAST_NAME, EMAIL, PHONE_, HIRE_DATE, SALARY, COMMISSION_PCT, MANAGER_ID, JOB_ID, DEPARTMENT_ID) VALUES
(105, 'David', 'López', 'david.lopez@example.com', '666222335', TO_DATE('2020-05-01', 'YYYY-MM-DD'), 100000.00, NULL, NULL, 5, 5);


#Insertar datos en la tabla EMPLOYEE_JOB_HISTORY locationsemployeesemployees 
										

INSERT INTO EMPLOYEE_JOB_HISTORY (EMPLOYEE_ID, DEPARTMENT_ID, JOB_ID, START_DATE, END_DATE) VALUES
(101, 1, 1, TO_DATE('2020-01-01', 'YYYY-MM-DD'), NULL);
INSERT INTO EMPLOYEE_JOB_HISTORY (EMPLOYEE_ID, DEPARTMENT_ID, JOB_ID, START_DATE, END_DATE) VALUES
(102, 2, 2, TO_DATE('2020-02-01', 'YYYY-MM-DD'), NULL);
INSERT INTO EMPLOYEE_JOB_HISTORY (EMPLOYEE_ID, DEPARTMENT_ID, JOB_ID, START_DATE, END_DATE) VALUES
(103, 3, 3, TO_DATE('2020-03-01', 'YYYY-MM-DD'), NULL);
INSERT INTO EMPLOYEE_JOB_HISTORY (EMPLOYEE_ID, DEPARTMENT_ID, JOB_ID, START_DATE, END_DATE) VALUES
(104, 4, 4, TO_DATE('2020-04-01', 'YYYY-MM-DD'), NULL);
INSERT INTO EMPLOYEE_JOB_HISTORY (EMPLOYEE_ID, DEPARTMENT_ID, JOB_ID, START_DATE, END_DATE) VALUES
(105, 5, 5, TO_DATE('2020-05-01', 'YYYY-MM-DD'), NULL);

-- actividad 1 --

CREATE OR REPLACE PROCEDURE CambiarOficio (
    p_empleado_id IN EMPLOYEES.EMPLOYEE_ID%TYPE,
    p_nuevo_job_id IN EMPLOYEES.JOB_ID%TYPE
) AS
    v_nombre_empleado EMPLOYEES.FIRST_NAME%TYPE;
    v_apellido_empleado EMPLOYEES.LAST_NAME%TYPE;
    v_antiguo_job_id EMPLOYEES.JOB_ID%TYPE;
BEGIN
    -- Obtener el nombre y apellido del empleado, y su antiguo oficio
    SELECT FIRST_NAME, LAST_NAME, JOB_ID INTO v_nombre_empleado, v_apellido_empleado, v_antiguo_job_id
    FROM EMPLOYEES
    WHERE EMPLOYEE_ID = p_empleado_id;

    -- Actualizar el oficio del empleado
    UPDATE EMPLOYEES
    SET JOB_ID = p_nuevo_job_id
    WHERE EMPLOYEE_ID = p_empleado_id;

    -- Mostrar los cambios realizados
    DBMS_OUTPUT.PUT_LINE('Empleado: ' || v_nombre_empleado || ' ' || v_apellido_empleado);
    DBMS_OUTPUT.PUT_LINE('Oficio anterior: ' || v_antiguo_job_id);
    DBMS_OUTPUT.PUT_LINE('Nuevo oficio: ' || p_nuevo_job_id);

EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('No se encontró el empleado con ID: ' || p_empleado_id);
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error al actualizar el oficio del empleado.');
END;
/

-- Esto se ejecuta asi por ejemplo--
BEGIN
    CambiarOficio(101, 1);
END;
/

                                        --ACTIVIDAD 2-- 

-- Creación de la función para verificar si el ID del oficio existe
CREATE OR REPLACE FUNCTION ExisteOficio(p_job_id IN JOBS.JOB_ID%TYPE) RETURN BOOLEAN IS
    v_count NUMBER;
BEGIN
    SELECT COUNT(*) INTO v_count
    FROM JOBS
    WHERE JOB_ID = p_job_id;

    RETURN v_count > 0;
END;
/

-- Creación del procedimiento que llama a la función
CREATE OR REPLACE PROCEDURE CambiarOficioConValidacion (
    p_empleado_id IN EMPLOYEES.EMPLOYEE_ID%TYPE,
    p_nuevo_job_id IN EMPLOYEES.JOB_ID%TYPE
) AS
    v_nombre_empleado EMPLOYEES.FIRST_NAME%TYPE;
    v_apellido_empleado EMPLOYEES.LAST_NAME%TYPE;
    v_antiguo_job_id EMPLOYEES.JOB_ID%TYPE;
BEGIN
    -- Verificar si el nuevo job_id existe
    IF NOT ExisteOficio(p_nuevo_job_id) THEN
        DBMS_OUTPUT.PUT_LINE('El oficio con ID ' || p_nuevo_job_id || ' no existe.');
        RETURN;
    END IF;

    -- Obtener el nombre y apellido del empleado, y su antiguo oficio
    SELECT FIRST_NAME, LAST_NAME, JOB_ID INTO v_nombre_empleado, v_apellido_empleado, v_antiguo_job_id
    FROM EMPLOYEES
    WHERE EMPLOYEE_ID = p_empleado_id;

    -- Actualizar el oficio del empleado
    UPDATE EMPLOYEES
    SET JOB_ID = p_nuevo_job_id
    WHERE EMPLOYEE_ID = p_empleado_id;

    -- Mostrar los cambios realizados
    DBMS_OUTPUT.PUT_LINE('Empleado: ' || v_nombre_empleado || ' ' || v_apellido_empleado);
    DBMS_OUTPUT.PUT_LINE('Oficio anterior: ' || v_antiguo_job_id);
    DBMS_OUTPUT.PUT_LINE('Nuevo oficio: ' || p_nuevo_job_id);

    -- Confirmar los cambios
    COMMIT;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('No se encontró el empleado con ID: ' || p_empleado_id);
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error al actualizar el oficio del empleado.');
        ROLLBACK;
END;
/

BEGIN
    CambiarOficioConValidacion(101, 7);
END;
/


--- ACTIVIDAD 3 ----
DECLARE
    v_empleado_id EMPLOYEES.EMPLOYEE_ID%TYPE := 101; -- Reemplaza con el ID del empleado
    v_nuevo_job_id EMPLOYEES.JOB_ID%TYPE := 3; -- Reemplaza con el nuevo JOB_ID
BEGIN
    -- Llamada al procedimiento con los valores directamente asignados
    CambiarOficioConValidacion(v_empleado_id, v_nuevo_job_id);
END;
/

--ACTIVIDAD 4--

CREATE TABLE EMP_AUDIT (
    EMPLOYEE_ID NUMBER,
    UPDATE_TIME TIMESTAMP,
    AUDIT_MESSAGE VARCHAR2(255)
);

CREATE OR REPLACE TRIGGER AuditSalario
AFTER UPDATE OF SALARY ON EMPLOYEES
FOR EACH ROW
WHEN (NEW.SALARY != OLD.SALARY)
BEGIN
    INSERT INTO EMP_AUDIT (EMPLOYEE_ID, UPDATE_TIME, AUDIT_MESSAGE)
    VALUES (:OLD.EMPLOYEE_ID, SYSTIMESTAMP, 'Salario actualizado de ' || TO_CHAR(:OLD.SALARY) || ' a ' || TO_CHAR(:NEW.SALARY));
END;
/

----Aquí comprobamos de que salario tiene antes de modificar nada--

select * 
from EMPLOYEES

---- Actualizamos el salario---

UPDATE EMPLOYEES
SET SALARY = 75000
WHERE EMPLOYEE_ID = 101;

--- Comprobamos que el trige ha funcionado --

select * 
from EMP_AUDIT

