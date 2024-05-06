
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


#FK_EMPLOYEE_MANAGER_ID: Garantiza que el valor en MANAGER_ID haga referencia al EMPLOYEE_ID de otro empleado en la tabla EMPLOYEES.
#FK_EMPLOYEE_JOB_ID: Garantiza que el valor en JOB_ID haga referencia al JOB_ID de la tabla JOBS.
#FK_EMPLOYEE_DEPARTMENT_ID: Garantiza que el valor en DEPARTMENT_ID haga referencia al DEPARTMENT_ID de la tabla DEPARTMENTS.

ALTER TABLE EMPLOYEES
ADD CONSTRAINT FK_EMPLOYEE_MANAGER_ID FOREIGN KEY (MANAGER_ID) REFERENCES EMPLOYEES(EMPLOYEE_ID);
ALTER TABLE EMPLOYEES
ADD CONSTRAINT FK_EMPLOYEE_JOB_ID FOREIGN KEY (JOB_ID) REFERENCES JOBS(JOB_ID);
ALTER TABLE EMPLOYEES
ADD CONSTRAINT FK_EMPLOYEE_DEPARTMENT_ID FOREIGN KEY (DEPARTMENT_ID) REFERENCES DEPARTMENTS(DEPARTMENT_ID);




# FK_DEPARTMENT_MANAGER_ID: Esta restricción de clave externa asegura que el valor en la columna MANAGER_ID de la tabla DEPARTMENTS haga referencia al EMPLOYEE_ID
# de otro empleado en la tabla EMPLOYEES
#FK_DEPARTMENT_LOCATION_ID: Esta restricción de clave externa asegura que el valor en la columna LOCATION_ID de la tabla DEPARTMENTS haga referencia al LOCATION_ID de la tabla LOCATIONS

ALTER TABLE DEPARTMENTS
ADD CONSTRAINT FK_DEPARTMENT_MANAGER_ID FOREIGN KEY (MANAGER_ID) REFERENCES EMPLOYEES(EMPLOYEE_ID);
ALTER TABLE DEPARTMENTS
ADD CONSTRAINT FK_DEPARTMENT_LOCATION_ID FOREIGN KEY (LOCATION_ID) REFERENCES LOCATIONS(LOCATION_ID);





#DML LENGUAJE DE MANIPULACION DE DATOS
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

