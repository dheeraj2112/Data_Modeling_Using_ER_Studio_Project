--
-- ER/Studio Data Architect SQL Code Generation
-- Project :      ORA_HR_DM.DM1
--
-- Date Created : Wednesday, September 11, 2024 16:04:26
-- Target DBMS : Snowflake
--

DROP TABLE COUNTRIES
;
DROP TABLE DEPARTMENTS
;
DROP TABLE EMPLOYEES
;
DROP TABLE JOB_HISTORY
;
DROP TABLE JOBS
;
DROP TABLE LOCATIONS
;
DROP TABLE REGIONS
;
-- 
-- TABLE: COUNTRIES 
--

CREATE TABLE COUNTRIES(
    COUNTRY_ID      CHAR(2)         NOT NULL,
    COUNTRY_NAME    VARCHAR(40),
    REGION_ID       NUMBER(0, 0)
)
;



-- 
-- TABLE: DEPARTMENTS 
--

CREATE TABLE DEPARTMENTS(
    DEPARTMENT_ID      NUMBER(4, 0)    NOT NULL,
    DEPARTMENT_NAME    VARCHAR(30)     NOT NULL,
    MANAGER_ID         NUMBER(6, 0),
    LOCATION_ID        NUMBER(4, 0)
)
;



-- 
-- TABLE: EMPLOYEES 
--

CREATE TABLE EMPLOYEES(
    EMPLOYEE_ID       NUMBER(6, 0)    NOT NULL,
    FIRST_NAME        VARCHAR(20),
    LAST_NAME         VARCHAR(25)     NOT NULL,
    EMAIL             VARCHAR(25)     NOT NULL,
    PHONE_NUMBER      VARCHAR(20),
    HIRE_DATE         DATE            NOT NULL,
    JOB_ID            VARCHAR(10)     NOT NULL,
    SALARY            NUMBER(8, 2),
    COMMISSION_PCT    NUMBER(2, 2),
    MANAGER_ID        NUMBER(6, 0),
    DEPARTMENT_ID     NUMBER(4, 0)
)
;



-- 
-- TABLE: JOB_HISTORY 
--

CREATE TABLE JOB_HISTORY(
    EMPLOYEE_ID      NUMBER(6, 0)    NOT NULL,
    START_DATE       DATE            NOT NULL,
    END_DATE         DATE            NOT NULL,
    JOB_ID           VARCHAR(10)     NOT NULL,
    DEPARTMENT_ID    NUMBER(4, 0)
)
;



-- 
-- TABLE: JOBS 
--

CREATE TABLE JOBS(
    JOB_ID        VARCHAR(10)     NOT NULL,
    JOB_TITLE     VARCHAR(35)     NOT NULL,
    MIN_SALARY    NUMBER(6, 0),
    MAX_SALARY    NUMBER(6, 0)
)
;



-- 
-- TABLE: LOCATIONS 
--

CREATE TABLE LOCATIONS(
    LOCATION_ID       NUMBER(4, 0)    NOT NULL,
    STREET_ADDRESS    VARCHAR(40),
    POSTAL_CODE       VARCHAR(12),
    CITY              VARCHAR(30)     NOT NULL,
    STATE_PROVINCE    VARCHAR(25),
    COUNTRY_ID        CHAR(2)
)
;



-- 
-- TABLE: REGIONS 
--

CREATE TABLE REGIONS(
    REGION_ID      NUMBER(0, 0)    NOT NULL,
    REGION_NAME    VARCHAR(25)
)
;



-- 
-- TABLE: COUNTRIES 
--

ALTER TABLE COUNTRIES ADD 
    CONSTRAINT COUNTRY_C_ID_PK PRIMARY KEY (COUNTRY_ID)
;

-- 
-- TABLE: DEPARTMENTS 
--

ALTER TABLE DEPARTMENTS ADD 
    CONSTRAINT DEPT_ID_PK PRIMARY KEY (DEPARTMENT_ID)
;

-- 
-- TABLE: EMPLOYEES 
--

ALTER TABLE EMPLOYEES ADD 
    CONSTRAINT EMP_EMP_ID_PK PRIMARY KEY (EMPLOYEE_ID)
;

-- 
-- TABLE: JOB_HISTORY 
--

ALTER TABLE JOB_HISTORY ADD 
    CONSTRAINT JHIST_EMP_ID_ST_DATE_PK PRIMARY KEY (EMPLOYEE_ID, START_DATE)
;

-- 
-- TABLE: JOBS 
--

ALTER TABLE JOBS ADD 
    CONSTRAINT JOB_ID_PK PRIMARY KEY (JOB_ID)
;

-- 
-- TABLE: LOCATIONS 
--

ALTER TABLE LOCATIONS ADD 
    CONSTRAINT LOC_ID_PK PRIMARY KEY (LOCATION_ID)
;

-- 
-- TABLE: REGIONS 
--

ALTER TABLE REGIONS ADD 
    CONSTRAINT REG_ID_PK PRIMARY KEY (REGION_ID)
;

-- 
-- TABLE: COUNTRIES 
--

ALTER TABLE COUNTRIES ADD CONSTRAINT COUNTR_REG_FK 
    FOREIGN KEY (REGION_ID)
    REFERENCES REGIONS(REGION_ID)
;


-- 
-- TABLE: DEPARTMENTS 
--

ALTER TABLE DEPARTMENTS ADD CONSTRAINT DEPT_LOC_FK 
    FOREIGN KEY (LOCATION_ID)
    REFERENCES LOCATIONS(LOCATION_ID)
;

ALTER TABLE DEPARTMENTS ADD CONSTRAINT DEPT_MGR_FK 
    FOREIGN KEY (MANAGER_ID)
    REFERENCES EMPLOYEES(EMPLOYEE_ID)
;


-- 
-- TABLE: EMPLOYEES 
--

ALTER TABLE EMPLOYEES ADD CONSTRAINT EMP_DEPT_FK 
    FOREIGN KEY (DEPARTMENT_ID)
    REFERENCES DEPARTMENTS(DEPARTMENT_ID)
;

ALTER TABLE EMPLOYEES ADD CONSTRAINT EMP_MANAGER_FK 
    FOREIGN KEY (MANAGER_ID)
    REFERENCES EMPLOYEES(EMPLOYEE_ID)
;


-- 
-- TABLE: JOB_HISTORY 
--

ALTER TABLE JOB_HISTORY ADD CONSTRAINT JHIST_DEPT_FK 
    FOREIGN KEY (DEPARTMENT_ID)
    REFERENCES DEPARTMENTS(DEPARTMENT_ID)
;

ALTER TABLE JOB_HISTORY ADD CONSTRAINT JHIST_EMP_FK 
    FOREIGN KEY (EMPLOYEE_ID)
    REFERENCES EMPLOYEES(EMPLOYEE_ID)
;

ALTER TABLE JOB_HISTORY ADD CONSTRAINT JHIST_JOB_FK 
    FOREIGN KEY (JOB_ID)
    REFERENCES JOBS(JOB_ID)
;


-- 
-- TABLE: LOCATIONS 
--

ALTER TABLE LOCATIONS ADD CONSTRAINT LOC_C_ID_FK 
    FOREIGN KEY (COUNTRY_ID)
    REFERENCES COUNTRIES(COUNTRY_ID)
;


