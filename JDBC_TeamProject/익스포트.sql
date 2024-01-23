--------------------------------------------------------
--  파일이 생성됨 - 수요일-5월-03-2023   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Sequence BOARD_BNO_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "HR"."BOARD_BNO_SEQ"  MINVALUE 1 MAXVALUE 999 INCREMENT BY 1 START WITH 301 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence BOARD_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "HR"."BOARD_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 50 NOCACHE  NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence DEPARTMENTS_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "HR"."DEPARTMENTS_SEQ"  MINVALUE 1 MAXVALUE 9990 INCREMENT BY 10 START WITH 280 NOCACHE  NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence DEPT3_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "HR"."DEPT3_SEQ"  MINVALUE 1 MAXVALUE 10 INCREMENT BY 1 START WITH 2 NOCACHE  NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence DRUGS_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "HR"."DRUGS_SEQ"  MINVALUE 1 MAXVALUE 100000 INCREMENT BY 1 START WITH 8 NOCACHE  NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence EMPLOYEES_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "HR"."EMPLOYEES_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 207 NOCACHE  NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence LOCATIONS_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "HR"."LOCATIONS_SEQ"  MINVALUE 1 MAXVALUE 9900 INCREMENT BY 100 START WITH 3300 NOCACHE  NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence MOVIE_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "HR"."MOVIE_SEQ"  MINVALUE 1 MAXVALUE 100000 INCREMENT BY 1 START WITH 2 NOCACHE  NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence ORDER_HISTORY_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "HR"."ORDER_HISTORY_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 4 NOCACHE  NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence ORDER_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "HR"."ORDER_SEQ"  MINVALUE 1 MAXVALUE 100000 INCREMENT BY 1 START WITH 1 NOCACHE  NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence PRESCRIPTIONS_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "HR"."PRESCRIPTIONS_SEQ"  MINVALUE 1 MAXVALUE 100000 INCREMENT BY 1 START WITH 6 NOCACHE  NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence PRODUCT_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "HR"."PRODUCT_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 4 NOCACHE  NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence SEQ_AUTH
--------------------------------------------------------

   CREATE SEQUENCE  "HR"."SEQ_AUTH"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 21 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence SEQ_INFO
--------------------------------------------------------

   CREATE SEQUENCE  "HR"."SEQ_INFO"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 21 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence USERS_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "HR"."USERS_SEQ"  MINVALUE 1 MAXVALUE 100000 INCREMENT BY 1 START WITH 4 NOCACHE  NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Table AUTH
--------------------------------------------------------

  CREATE TABLE "HR"."AUTH" 
   (	"AUTH_ID" NUMBER, 
	"NAME" VARCHAR2(30 BYTE), 
	"JOB" VARCHAR2(30 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table BOARD
--------------------------------------------------------

  CREATE TABLE "HR"."BOARD" 
   (	"BNO" NUMBER(3,0), 
	"WRITER" VARCHAR2(50 BYTE), 
	"TITLE" VARCHAR2(50 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table COUNTRIES
--------------------------------------------------------

  CREATE TABLE "HR"."COUNTRIES" 
   (	"COUNTRY_ID" CHAR(2 BYTE), 
	"COUNTRY_NAME" VARCHAR2(40 BYTE), 
	"REGION_ID" NUMBER, 
	 CONSTRAINT "COUNTRY_C_ID_PK" PRIMARY KEY ("COUNTRY_ID") ENABLE
   ) ORGANIZATION INDEX NOCOMPRESS PCTFREE 10 INITRANS 2 MAXTRANS 255 LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" 
 PCTTHRESHOLD 50;

   COMMENT ON COLUMN "HR"."COUNTRIES"."COUNTRY_ID" IS 'Primary key of countries table.';
   COMMENT ON COLUMN "HR"."COUNTRIES"."COUNTRY_NAME" IS 'Country name';
   COMMENT ON COLUMN "HR"."COUNTRIES"."REGION_ID" IS 'Region ID for the country. Foreign key to region_id column in the departments table.';
   COMMENT ON TABLE "HR"."COUNTRIES"  IS 'country table. Contains 25 rows. References with locations table.';
--------------------------------------------------------
--  DDL for Table DEPARTMENTS
--------------------------------------------------------

  CREATE TABLE "HR"."DEPARTMENTS" 
   (	"DEPARTMENT_ID" NUMBER(4,0), 
	"DEPARTMENT_NAME" VARCHAR2(30 BYTE), 
	"MANAGER_ID" NUMBER(6,0), 
	"LOCATION_ID" NUMBER(4,0)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;

   COMMENT ON COLUMN "HR"."DEPARTMENTS"."DEPARTMENT_ID" IS 'Primary key column of departments table.';
   COMMENT ON COLUMN "HR"."DEPARTMENTS"."DEPARTMENT_NAME" IS 'A not null column that shows name of a department. Administration,
Marketing, Purchasing, Human Resources, Shipping, IT, Executive, Public
Relations, Sales, Finance, and Accounting. ';
   COMMENT ON COLUMN "HR"."DEPARTMENTS"."MANAGER_ID" IS 'Manager_id of a department. Foreign key to employee_id column of employees table. The manager_id column of the employee table references this column.';
   COMMENT ON COLUMN "HR"."DEPARTMENTS"."LOCATION_ID" IS 'Location id where a department is located. Foreign key to location_id column of locations table.';
   COMMENT ON TABLE "HR"."DEPARTMENTS"  IS 'Departments table that shows details of departments where employees
work. Contains 27 rows; references with locations, employees, and job_history tables.';
--------------------------------------------------------
--  DDL for Table DEPT2
--------------------------------------------------------

  CREATE TABLE "HR"."DEPT2" 
   (	"DEPT_NO" NUMBER(2,0), 
	"DEPT_NAME" VARCHAR2(14 BYTE), 
	"LOCA" NUMBER(4,0), 
	"DEPT_BONUS" NUMBER(10,0), 
	"DEPT_GENDER" VARCHAR2(1 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table DEPTS
--------------------------------------------------------

  CREATE TABLE "HR"."DEPTS" 
   (	"DEPARTMENT_ID" NUMBER(4,0), 
	"DEPARTMENT_NAME" VARCHAR2(30 BYTE), 
	"MANAGER_ID" NUMBER(6,0), 
	"LOCATION_ID" NUMBER(4,0)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table DRUGS
--------------------------------------------------------

  CREATE TABLE "HR"."DRUGS" 
   (	"DRUG_NUMBER" NUMBER(10,0), 
	"DRUG_NAME" VARCHAR2(40 BYTE), 
	"DRUG_PRICE" NUMBER(10,0) DEFAULT 5000, 
	"INGREDIENT" VARCHAR2(50 BYTE), 
	"COMPANY_NAME" VARCHAR2(40 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table EMPLOYEES
--------------------------------------------------------

  CREATE TABLE "HR"."EMPLOYEES" 
   (	"EMPLOYEE_ID" NUMBER(6,0), 
	"FIRST_NAME" VARCHAR2(20 BYTE), 
	"LAST_NAME" VARCHAR2(25 BYTE), 
	"EMAIL" VARCHAR2(25 BYTE), 
	"PHONE_NUMBER" VARCHAR2(20 BYTE), 
	"HIRE_DATE" DATE, 
	"JOB_ID" VARCHAR2(10 BYTE), 
	"SALARY" NUMBER(8,2), 
	"COMMISSION_PCT" NUMBER(2,2), 
	"MANAGER_ID" NUMBER(6,0), 
	"DEPARTMENT_ID" NUMBER(4,0)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;

   COMMENT ON COLUMN "HR"."EMPLOYEES"."EMPLOYEE_ID" IS 'Primary key of employees table.';
   COMMENT ON COLUMN "HR"."EMPLOYEES"."FIRST_NAME" IS 'First name of the employee. A not null column.';
   COMMENT ON COLUMN "HR"."EMPLOYEES"."LAST_NAME" IS 'Last name of the employee. A not null column.';
   COMMENT ON COLUMN "HR"."EMPLOYEES"."EMAIL" IS 'Email id of the employee';
   COMMENT ON COLUMN "HR"."EMPLOYEES"."PHONE_NUMBER" IS 'Phone number of the employee; includes country code and area code';
   COMMENT ON COLUMN "HR"."EMPLOYEES"."HIRE_DATE" IS 'Date when the employee started on this job. A not null column.';
   COMMENT ON COLUMN "HR"."EMPLOYEES"."JOB_ID" IS 'Current job of the employee; foreign key to job_id column of the
jobs table. A not null column.';
   COMMENT ON COLUMN "HR"."EMPLOYEES"."SALARY" IS 'Monthly salary of the employee. Must be greater
than zero (enforced by constraint emp_salary_min)';
   COMMENT ON COLUMN "HR"."EMPLOYEES"."COMMISSION_PCT" IS 'Commission percentage of the employee; Only employees in sales
department elgible for commission percentage';
   COMMENT ON COLUMN "HR"."EMPLOYEES"."MANAGER_ID" IS 'Manager id of the employee; has same domain as manager_id in
departments table. Foreign key to employee_id column of employees table.
(useful for reflexive joins and CONNECT BY query)';
   COMMENT ON COLUMN "HR"."EMPLOYEES"."DEPARTMENT_ID" IS 'Department id where employee works; foreign key to department_id
column of the departments table';
   COMMENT ON TABLE "HR"."EMPLOYEES"  IS 'employees table. Contains 107 rows. References with departments,
jobs, job_history tables. Contains a self reference.';
--------------------------------------------------------
--  DDL for Table EMPS
--------------------------------------------------------

  CREATE TABLE "HR"."EMPS" 
   (	"EMPLOYEE_ID" NUMBER(6,0), 
	"FIRST_NAME" VARCHAR2(20 BYTE), 
	"LAST_NAME" VARCHAR2(25 BYTE), 
	"EMAIL" VARCHAR2(25 BYTE), 
	"PHONE_NUMBER" VARCHAR2(20 BYTE), 
	"HIRE_DATE" DATE, 
	"JOB_ID" VARCHAR2(10 BYTE), 
	"SALARY" NUMBER(8,2), 
	"COMMISSION_PCT" NUMBER(2,2), 
	"MANAGER_ID" NUMBER(6,0), 
	"DEPARTMENT_ID" NUMBER(4,0)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table EMPS_IT
--------------------------------------------------------

  CREATE TABLE "HR"."EMPS_IT" 
   (	"EMPLOYEE_ID" NUMBER(6,0), 
	"FIRST_NAME" VARCHAR2(20 BYTE), 
	"LAST_NAME" VARCHAR2(25 BYTE), 
	"EMAIL" VARCHAR2(25 BYTE), 
	"PHONE_NUMBER" VARCHAR2(20 BYTE), 
	"HIRE_DATE" DATE, 
	"JOB_ID" VARCHAR2(10 BYTE), 
	"SALARY" NUMBER(8,2), 
	"COMMISSION_PCT" NUMBER(2,2), 
	"MANAGER_ID" NUMBER(6,0), 
	"DEPARTMENT_ID" NUMBER(4,0)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table INFO
--------------------------------------------------------

  CREATE TABLE "HR"."INFO" 
   (	"ID" NUMBER, 
	"TITLE" VARCHAR2(100 BYTE), 
	"CONTENT" VARCHAR2(100 BYTE), 
	"REGDATE" DATE DEFAULT sysdate, 
	"AUTH_ID" NUMBER
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table JOBS
--------------------------------------------------------

  CREATE TABLE "HR"."JOBS" 
   (	"JOB_ID" VARCHAR2(10 BYTE), 
	"JOB_TITLE" VARCHAR2(35 BYTE), 
	"MIN_SALARY" NUMBER(6,0), 
	"MAX_SALARY" NUMBER(6,0)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;

   COMMENT ON COLUMN "HR"."JOBS"."JOB_ID" IS 'Primary key of jobs table.';
   COMMENT ON COLUMN "HR"."JOBS"."JOB_TITLE" IS 'A not null column that shows job title, e.g. AD_VP, FI_ACCOUNTANT';
   COMMENT ON COLUMN "HR"."JOBS"."MIN_SALARY" IS 'Minimum salary for a job title.';
   COMMENT ON COLUMN "HR"."JOBS"."MAX_SALARY" IS 'Maximum salary for a job title';
   COMMENT ON TABLE "HR"."JOBS"  IS 'jobs table with job titles and salary ranges. Contains 19 rows.
References with employees and job_history table.';
--------------------------------------------------------
--  DDL for Table JOBS_IT
--------------------------------------------------------

  CREATE TABLE "HR"."JOBS_IT" 
   (	"JOB_ID" VARCHAR2(10 BYTE), 
	"JOB_TITLE" VARCHAR2(35 BYTE), 
	"MIN_SALARY" NUMBER(6,0), 
	"MAX_SALARY" NUMBER(6,0)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table JOB_HISTORY
--------------------------------------------------------

  CREATE TABLE "HR"."JOB_HISTORY" 
   (	"EMPLOYEE_ID" NUMBER(6,0), 
	"START_DATE" DATE, 
	"END_DATE" DATE, 
	"JOB_ID" VARCHAR2(10 BYTE), 
	"DEPARTMENT_ID" NUMBER(4,0)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;

   COMMENT ON COLUMN "HR"."JOB_HISTORY"."EMPLOYEE_ID" IS 'A not null column in the complex primary key employee_id+start_date.
Foreign key to employee_id column of the employee table';
   COMMENT ON COLUMN "HR"."JOB_HISTORY"."START_DATE" IS 'A not null column in the complex primary key employee_id+start_date.
Must be less than the end_date of the job_history table. (enforced by
constraint jhist_date_interval)';
   COMMENT ON COLUMN "HR"."JOB_HISTORY"."END_DATE" IS 'Last day of the employee in this job role. A not null column. Must be
greater than the start_date of the job_history table.
(enforced by constraint jhist_date_interval)';
   COMMENT ON COLUMN "HR"."JOB_HISTORY"."JOB_ID" IS 'Job role in which the employee worked in the past; foreign key to
job_id column in the jobs table. A not null column.';
   COMMENT ON COLUMN "HR"."JOB_HISTORY"."DEPARTMENT_ID" IS 'Department id in which the employee worked in the past; foreign key to deparment_id column in the departments table';
   COMMENT ON TABLE "HR"."JOB_HISTORY"  IS 'Table that stores job history of the employees. If an employee
changes departments within the job or changes jobs within the department,
new rows get inserted into this table with old job information of the
employee. Contains a complex primary key: employee_id+start_date.
Contains 25 rows. References with jobs, employees, and departments tables.';
--------------------------------------------------------
--  DDL for Table LOCATIONS
--------------------------------------------------------

  CREATE TABLE "HR"."LOCATIONS" 
   (	"LOCATION_ID" NUMBER(4,0), 
	"STREET_ADDRESS" VARCHAR2(40 BYTE), 
	"POSTAL_CODE" VARCHAR2(12 BYTE), 
	"CITY" VARCHAR2(30 BYTE), 
	"STATE_PROVINCE" VARCHAR2(25 BYTE), 
	"COUNTRY_ID" CHAR(2 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;

   COMMENT ON COLUMN "HR"."LOCATIONS"."LOCATION_ID" IS 'Primary key of locations table';
   COMMENT ON COLUMN "HR"."LOCATIONS"."STREET_ADDRESS" IS 'Street address of an office, warehouse, or production site of a company.
Contains building number and street name';
   COMMENT ON COLUMN "HR"."LOCATIONS"."POSTAL_CODE" IS 'Postal code of the location of an office, warehouse, or production site
of a company. ';
   COMMENT ON COLUMN "HR"."LOCATIONS"."CITY" IS 'A not null column that shows city where an office, warehouse, or
production site of a company is located. ';
   COMMENT ON COLUMN "HR"."LOCATIONS"."STATE_PROVINCE" IS 'State or Province where an office, warehouse, or production site of a
company is located.';
   COMMENT ON COLUMN "HR"."LOCATIONS"."COUNTRY_ID" IS 'Country where an office, warehouse, or production site of a company is
located. Foreign key to country_id column of the countries table.';
   COMMENT ON TABLE "HR"."LOCATIONS"  IS 'Locations table that contains specific address of a specific office,
warehouse, and/or production site of a company. Does not store addresses /
locations of customers. Contains 23 rows; references with the
departments and countries tables. ';
--------------------------------------------------------
--  DDL for Table MEMBERS
--------------------------------------------------------

  CREATE TABLE "HR"."MEMBERS" 
   (	"MEM_ID" VARCHAR2(20 BYTE), 
	"MEM_PW" VARCHAR2(20 BYTE), 
	"MEM_NAME" VARCHAR2(20 BYTE), 
	"MEM_AGE" NUMBER(2,0), 
	"MEM_REGDATE" DATE DEFAULT sysdate
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table MOVIE
--------------------------------------------------------

  CREATE TABLE "HR"."MOVIE" 
   (	"SERIAL_NUMBER" NUMBER(5,0), 
	"MOVIE_NAME" VARCHAR2(50 BYTE), 
	"NATION" VARCHAR2(20 BYTE), 
	"PUB_YEAR" NUMBER(4,0), 
	"RENTAL" VARCHAR2(10 BYTE) DEFAULT 'true', 
	"CHARGE" NUMBER(5,0) DEFAULT 2000
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table ORDER_HISTORY
--------------------------------------------------------

  CREATE TABLE "HR"."ORDER_HISTORY" 
   (	"ORDER_NO" NUMBER(5,0), 
	"USER_NUMBER" NUMBER(5,0), 
	"SERIAL_NUMBER" NUMBER(5,0), 
	"ORDER_DATE" DATE DEFAULT sysdate, 
	"RETURN_DATE" DATE DEFAULT sysdate+3
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table PATIENTS
--------------------------------------------------------

  CREATE TABLE "HR"."PATIENTS" 
   (	"PATIENT_ID" VARCHAR2(20 BYTE), 
	"PATIENT_NAME" VARCHAR2(20 BYTE), 
	"PATIENT_ADDRESS" VARCHAR2(200 BYTE), 
	"PATIENT_PHONE" VARCHAR2(20 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table PRESCRIPTIONS
--------------------------------------------------------

  CREATE TABLE "HR"."PRESCRIPTIONS" 
   (	"PRESCRIPTION_NO" NUMBER(6,0), 
	"PATIENT_ID" VARCHAR2(20 BYTE), 
	"DOCTOR_NAME" VARCHAR2(20 BYTE), 
	"DRUG_NUMBER" NUMBER(10,0), 
	"DAYS_MEDICATION" NUMBER(3,0), 
	"PRESCRIPTION_DATE" DATE DEFAULT sysdate
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table PRODUCT
--------------------------------------------------------

  CREATE TABLE "HR"."PRODUCT" 
   (	"PRODUCT_NO" NUMBER(5,0), 
	"PRODUCT_NAME" VARCHAR2(20 BYTE), 
	"TOTAL" NUMBER(5,0), 
	"PRICE" NUMBER(5,0)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table REGIONS
--------------------------------------------------------

  CREATE TABLE "HR"."REGIONS" 
   (	"REGION_ID" NUMBER, 
	"REGION_NAME" VARCHAR2(25 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table TBL_BOARD
--------------------------------------------------------

  CREATE TABLE "HR"."TBL_BOARD" 
   (	"BNO" NUMBER(10,0), 
	"WRITER" VARCHAR2(20 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table TBL_TEST
--------------------------------------------------------

  CREATE TABLE "HR"."TBL_TEST" 
   (	"ID" NUMBER(10,0), 
	"TEXT" VARCHAR2(20 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table TBL_USER
--------------------------------------------------------

  CREATE TABLE "HR"."TBL_USER" 
   (	"ID" VARCHAR2(20 BYTE), 
	"NAME" VARCHAR2(20 BYTE), 
	"ADDRESS" VARCHAR2(30 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table TBL_USER_BACKUP
--------------------------------------------------------

  CREATE TABLE "HR"."TBL_USER_BACKUP" 
   (	"ID" VARCHAR2(20 BYTE), 
	"NAME" VARCHAR2(20 BYTE), 
	"ADDRESS" VARCHAR2(30 BYTE), 
	"UPDATE_DATE" DATE DEFAULT sysdate, 
	"M_TYPE" VARCHAR2(10 BYTE), 
	"M_USER" VARCHAR2(20 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table USERS
--------------------------------------------------------

  CREATE TABLE "HR"."USERS" 
   (	"USER_NUMBER" NUMBER(5,0), 
	"USER_NAME" VARCHAR2(20 BYTE), 
	"PHONE_NUMBER" VARCHAR2(30 BYTE), 
	"TOTAL_PAYING" NUMBER(10,0) DEFAULT 0, 
	"GRADE" VARCHAR2(10 BYTE) DEFAULT 'BRONZE'
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for View EMP_DETAILS_VIEW
--------------------------------------------------------

  CREATE OR REPLACE FORCE VIEW "HR"."EMP_DETAILS_VIEW" ("EMPLOYEE_ID", "JOB_ID", "MANAGER_ID", "DEPARTMENT_ID", "LOCATION_ID", "COUNTRY_ID", "FIRST_NAME", "LAST_NAME", "SALARY", "COMMISSION_PCT", "DEPARTMENT_NAME", "JOB_TITLE", "CITY", "STATE_PROVINCE", "COUNTRY_NAME", "REGION_NAME") AS 
  SELECT
  e.employee_id,
  e.job_id,
  e.manager_id,
  e.department_id,
  d.location_id,
  l.country_id,
  e.first_name,
  e.last_name,
  e.salary,
  e.commission_pct,
  d.department_name,
  j.job_title,
  l.city,
  l.state_province,
  c.country_name,
  r.region_name
FROM
  employees e,
  departments d,
  jobs j,
  locations l,
  countries c,
  regions r
WHERE e.department_id = d.department_id
  AND d.location_id = l.location_id
  AND l.country_id = c.country_id
  AND c.region_id = r.region_id
  AND j.job_id = e.job_id
WITH READ ONLY
;
--------------------------------------------------------
--  DDL for View VIEW_EMP_DEPT_JOBS
--------------------------------------------------------

  CREATE OR REPLACE FORCE VIEW "HR"."VIEW_EMP_DEPT_JOBS" ("EMPLOYEE_ID", "NAME", "DEPARTMENT_NAME", "JOB_TITLE", "SALARY") AS 
  (
    SELECT
        e.employee_id,
        e.first_name||' '||last_name as name,
        d.department_name,
        j.job_title,
        e.salary -- 추가
    FROM employees e
    LEFT JOIN departments d
    ON e.department_id = d.department_id
    LEFT JOIN jobs j
    ON e.job_id = j.job_id
) ORDER BY employee_id ASC
;
--------------------------------------------------------
--  DDL for View VIEW_EMP_TEST
--------------------------------------------------------

  CREATE OR REPLACE FORCE VIEW "HR"."VIEW_EMP_TEST" ("EMPLOYEE_ID", "FIRST_NAME", "LAST_NAME", "EMAIL", "HIRE_DATE", "JOB_ID", "DEPARTMENT_ID") AS 
  (
    SELECT
        employee_id,
        first_name,
        last_name,
        email,
        hire_date,
        job_id,
        department_id
    FROM employees
    WHERE department_id = 60
) WITH CHECK OPTION  CONSTRAINT "VIEW_EMP_TEST_CK"
;
REM INSERTING into HR.PATIENTS
SET DEFINE OFF;
Insert into HR.PATIENTS (PATIENT_ID,PATIENT_NAME,PATIENT_ADDRESS,PATIENT_PHONE) values ('123456-1234567','홍길동','서울시 마포구','101-1234-1234');
Insert into HR.PATIENTS (PATIENT_ID,PATIENT_NAME,PATIENT_ADDRESS,PATIENT_PHONE) values ('980123-1234567','김철수','서울시 마포구','010-1111-2222');
Insert into HR.PATIENTS (PATIENT_ID,PATIENT_NAME,PATIENT_ADDRESS,PATIENT_PHONE) values ('941215-2234321','박영희','서울시 종로구','010-8282-8888');
Insert into HR.PATIENTS (PATIENT_ID,PATIENT_NAME,PATIENT_ADDRESS,PATIENT_PHONE) values ('910623-1284351','김철수','인천시 부평구','010-2580-2580');
Insert into HR.PATIENTS (PATIENT_ID,PATIENT_NAME,PATIENT_ADDRESS,PATIENT_PHONE) values ('881226-1231252','이춘섭','인천시 미추홀구','010-8431-8941');
REM INSERTING into HR.PRESCRIPTIONS
SET DEFINE OFF;
Insert into HR.PRESCRIPTIONS (PRESCRIPTION_NO,PATIENT_ID,DOCTOR_NAME,DRUG_NUMBER,DAYS_MEDICATION,PRESCRIPTION_DATE) values (1,'910623-1284351','황의사',2,3,to_date('20/02/07','RR/MM/DD'));
Insert into HR.PRESCRIPTIONS (PRESCRIPTION_NO,PATIENT_ID,DOCTOR_NAME,DRUG_NUMBER,DAYS_MEDICATION,PRESCRIPTION_DATE) values (2,'941215-2234321','이돌팔이',3,3,to_date('21/06/28','RR/MM/DD'));
Insert into HR.PRESCRIPTIONS (PRESCRIPTION_NO,PATIENT_ID,DOCTOR_NAME,DRUG_NUMBER,DAYS_MEDICATION,PRESCRIPTION_DATE) values (3,'910623-1284351','황의사',2,3,to_date('22/10/10','RR/MM/DD'));
Insert into HR.PRESCRIPTIONS (PRESCRIPTION_NO,PATIENT_ID,DOCTOR_NAME,DRUG_NUMBER,DAYS_MEDICATION,PRESCRIPTION_DATE) values (5,'123456-1234567','최돌팔이',5,2,to_date('23/05/03','RR/MM/DD'));
REM INSERTING into HR.DRUGS
SET DEFINE OFF;
Insert into HR.DRUGS (DRUG_NUMBER,DRUG_NAME,DRUG_PRICE,INGREDIENT,COMPANY_NAME) values (8,'미녹시온정',38000,'미녹시딜','오스코리아제약');
Insert into HR.DRUGS (DRUG_NUMBER,DRUG_NAME,DRUG_PRICE,INGREDIENT,COMPANY_NAME) values (9,'판콜아이시럽',3000,'덱시부프로펜','동화약품');
Insert into HR.DRUGS (DRUG_NUMBER,DRUG_NAME,DRUG_PRICE,INGREDIENT,COMPANY_NAME) values (4,'겔포스엘현탁액',7000,'인산알루미늄겔','보령');
Insert into HR.DRUGS (DRUG_NUMBER,DRUG_NAME,DRUG_PRICE,INGREDIENT,COMPANY_NAME) values (1,'가나릴정',30000,'이토프리드염산염','일동제약');
Insert into HR.DRUGS (DRUG_NUMBER,DRUG_NAME,DRUG_PRICE,INGREDIENT,COMPANY_NAME) values (2,'뉴발탄플러스정',20000,'발사르탄','신일제약');
Insert into HR.DRUGS (DRUG_NUMBER,DRUG_NAME,DRUG_PRICE,INGREDIENT,COMPANY_NAME) values (3,'미루바정',25000,'수산화마그네슘','씨엠지제약');
Insert into HR.DRUGS (DRUG_NUMBER,DRUG_NAME,DRUG_PRICE,INGREDIENT,COMPANY_NAME) values (5,'타이레놀500mg정',12000,'아세트아미노펜','한국얀센');
Insert into HR.DRUGS (DRUG_NUMBER,DRUG_NAME,DRUG_PRICE,INGREDIENT,COMPANY_NAME) values (6,'어린이타이레놀160mg',15000,'아세트아미노펜','한국얀센');
Insert into HR.DRUGS (DRUG_NUMBER,DRUG_NAME,DRUG_PRICE,INGREDIENT,COMPANY_NAME) values (7,'프로페시아정1밀리그램',50000,'피나스테리드','한국오가논');
--------------------------------------------------------
--  DDL for Index TBL_BOARD_IDX
--------------------------------------------------------

  CREATE UNIQUE INDEX "HR"."TBL_BOARD_IDX" ON "HR"."TBL_BOARD" ("BNO") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index LOC_ID_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "HR"."LOC_ID_PK" ON "HR"."LOCATIONS" ("LOCATION_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index EMP_MANAGER_IX
--------------------------------------------------------

  CREATE INDEX "HR"."EMP_MANAGER_IX" ON "HR"."EMPLOYEES" ("MANAGER_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index TABLE1_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "HR"."TABLE1_PK" ON "HR"."AUTH" ("AUTH_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index DEPT_LOCATION_IX
--------------------------------------------------------

  CREATE INDEX "HR"."DEPT_LOCATION_IX" ON "HR"."DEPARTMENTS" ("LOCATION_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index JHIST_EMP_ID_ST_DATE_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "HR"."JHIST_EMP_ID_ST_DATE_PK" ON "HR"."JOB_HISTORY" ("EMPLOYEE_ID", "START_DATE") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index JHIST_DEPARTMENT_IX
--------------------------------------------------------

  CREATE INDEX "HR"."JHIST_DEPARTMENT_IX" ON "HR"."JOB_HISTORY" ("DEPARTMENT_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index COUNTRY_C_ID_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "HR"."COUNTRY_C_ID_PK" ON "HR"."COUNTRIES" ("COUNTRY_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index JHIST_JOB_IX
--------------------------------------------------------

  CREATE INDEX "HR"."JHIST_JOB_IX" ON "HR"."JOB_HISTORY" ("JOB_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index JHIST_EMPLOYEE_IX
--------------------------------------------------------

  CREATE INDEX "HR"."JHIST_EMPLOYEE_IX" ON "HR"."JOB_HISTORY" ("EMPLOYEE_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index EMP_JOB_IX
--------------------------------------------------------

  CREATE INDEX "HR"."EMP_JOB_IX" ON "HR"."EMPLOYEES" ("JOB_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index LOC_CITY_IX
--------------------------------------------------------

  CREATE INDEX "HR"."LOC_CITY_IX" ON "HR"."LOCATIONS" ("CITY") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index EMPS_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "HR"."EMPS_PK" ON "HR"."EMPS" ("EMPLOYEE_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index JOB_ID_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "HR"."JOB_ID_PK" ON "HR"."JOBS" ("JOB_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index DEPT2_DEPTNAME_UK
--------------------------------------------------------

  CREATE UNIQUE INDEX "HR"."DEPT2_DEPTNAME_UK" ON "HR"."DEPT2" ("DEPT_NAME") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index LOC_STATE_PROVINCE_IX
--------------------------------------------------------

  CREATE INDEX "HR"."LOC_STATE_PROVINCE_IX" ON "HR"."LOCATIONS" ("STATE_PROVINCE") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index EMP_DEPARTMENT_IX
--------------------------------------------------------

  CREATE INDEX "HR"."EMP_DEPARTMENT_IX" ON "HR"."EMPLOYEES" ("DEPARTMENT_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index EMP_EMAIL_UK
--------------------------------------------------------

  CREATE UNIQUE INDEX "HR"."EMP_EMAIL_UK" ON "HR"."EMPLOYEES" ("EMAIL") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index EMP_NAME_IX
--------------------------------------------------------

  CREATE INDEX "HR"."EMP_NAME_IX" ON "HR"."EMPLOYEES" ("LAST_NAME", "FIRST_NAME") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index DEPTS_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "HR"."DEPTS_PK" ON "HR"."DEPTS" ("DEPARTMENT_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index INFO_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "HR"."INFO_PK" ON "HR"."INFO" ("ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index REG_ID_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "HR"."REG_ID_PK" ON "HR"."REGIONS" ("REGION_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index EMP_EMP_ID_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "HR"."EMP_EMP_ID_PK" ON "HR"."EMPLOYEES" ("EMPLOYEE_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index DEPT_ID_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "HR"."DEPT_ID_PK" ON "HR"."DEPARTMENTS" ("DEPARTMENT_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index LOC_COUNTRY_IX
--------------------------------------------------------

  CREATE INDEX "HR"."LOC_COUNTRY_IX" ON "HR"."LOCATIONS" ("COUNTRY_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Trigger SECURE_EMPLOYEES
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "HR"."SECURE_EMPLOYEES" 
  BEFORE INSERT OR UPDATE OR DELETE ON employees
BEGIN
  secure_dml;
END secure_employees;
/
ALTER TRIGGER "HR"."SECURE_EMPLOYEES" DISABLE;
--------------------------------------------------------
--  DDL for Trigger TRG_ORDER_HISTORY
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "HR"."TRG_ORDER_HISTORY" 
    AFTER INSERT
    ON order_history
    FOR EACH ROW
DECLARE
    v_serial_number NUMBER(5);
BEGIN
    SELECT
        :NEW.serial_number
    INTO v_serial_number
    FROM dual;

    UPDATE movie SET rental = 'false' 
    WHERE serial_number = v_serial_number;
END;
/
ALTER TRIGGER "HR"."TRG_ORDER_HISTORY" ENABLE;
--------------------------------------------------------
--  DDL for Trigger TRG_TEST
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "HR"."TRG_TEST" 
    AFTER DELETE OR UPDATE -- 트리거의 발생 시점. (삭제 or 수정 이후 동작)
    ON tbl_test -- 트리거를 부착할 테이블
    FOR EACH ROW -- 각 행에 모두 적용 (생략 가능. 생략 시 한 번만 실행)
--DECLARE -- 생략 가능
BEGIN
    dbms_output.put_line('x');    
END;
/
ALTER TRIGGER "HR"."TRG_TEST" ENABLE;
--------------------------------------------------------
--  DDL for Trigger TRG_USER_INSERT
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "HR"."TRG_USER_INSERT" 
    BEFORE INSERT
    ON tbl_user
    FOR EACH ROW
BEGIN
    :NEW.name := SUBSTR(:NEW.name,1,1)||'**';
END;
/
ALTER TRIGGER "HR"."TRG_USER_INSERT" ENABLE;
--------------------------------------------------------
--  DDL for Trigger TRH_USER_BACKUP
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "HR"."TRH_USER_BACKUP" 
    AFTER UPDATE OR DELETE
    ON tbl_user
    FOR EACH ROW
DECLARE
    v_type VARCHAR2(10);
BEGIN
    IF UPDATING THEN -- UPDATING은 시스템 자체에서 상태에 대한 내용을 지원하는 빌트인 구문
        v_type := '수정';
    ELSIF DELETING THEN
        v_type := '삭제';
    END IF;

    -- 본격적 실행 구문 작성
    INSERT INTO tbl_user_backup
    VALUES(:OLD.id, :OLD.name, :OLD.address, sysdate, v_type, USER());
END;
/
ALTER TRIGGER "HR"."TRH_USER_BACKUP" ENABLE;
--------------------------------------------------------
--  DDL for Trigger UPDATE_JOB_HISTORY
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "HR"."UPDATE_JOB_HISTORY" 
  AFTER UPDATE OF job_id, department_id ON employees
  FOR EACH ROW
BEGIN
  add_job_history(:old.employee_id, :old.hire_date, sysdate,
                  :old.job_id, :old.department_id);
END;
/
ALTER TRIGGER "HR"."UPDATE_JOB_HISTORY" ENABLE;
--------------------------------------------------------
--  DDL for Procedure ADD_JOB_HISTORY
--------------------------------------------------------
set define off;

  CREATE OR REPLACE PROCEDURE "HR"."ADD_JOB_HISTORY" 
  (  p_emp_id          job_history.employee_id%type
   , p_start_date      job_history.start_date%type
   , p_end_date        job_history.end_date%type
   , p_job_id          job_history.job_id%type
   , p_department_id   job_history.department_id%type
   )
IS
BEGIN
  INSERT INTO job_history (employee_id, start_date, end_date,
                           job_id, department_id)
    VALUES(p_emp_id, p_start_date, p_end_date, p_job_id, p_department_id);
END add_job_history;

/
--------------------------------------------------------
--  DDL for Procedure DEPTS_PROC
--------------------------------------------------------
set define off;

  CREATE OR REPLACE PROCEDURE "HR"."DEPTS_PROC" (
    p_id IN depts.department_id%type,
    p_name IN depts.department_name%type,
    p_opper IN VARCHAR2)
IS
    cnt NUMBER;
BEGIN
    SELECT count(*) INTO cnt FROM depts WHERE department_id = p_id;


    IF p_opper = 'I' THEN
        INSERT INTO depts (department_id,department_name)
        VALUES (p_id,p_name);
    ELSIF p_opper = 'U' THEN
        IF cnt= 0 THEN
            dbms_output.put_line(0/0);
        END IF;
        UPDATE depts SET
            department_name = p_name
        WHERE department_id = p_id;
    ELSIF p_opper = 'D' THEN
        IF cnt= 0 THEN
            dbms_output.put_line(0/0);
        END IF;
        DELETE FROM depts WHERE department_id = p_id;
    ELSE
        dbms_output.put_line('잘못된 입력값 입니다.');
        RETURN;
    END IF;
    dbms_output.put_line('작업 끝');
    COMMIT;
EXCEPTION
    WHEN OTHERS THEN 
        dbms_output.put_line('예외발생');
        ROLLBACK;
END;

/
--------------------------------------------------------
--  DDL for Procedure GUGU_PROC
--------------------------------------------------------
set define off;

  CREATE OR REPLACE PROCEDURE "HR"."GUGU_PROC" (
    dan IN NUMBER)
IS
BEGIN
    FOR hang IN 2..9
    LOOP
        dbms_output.put_line(dan||'x'||hang||'='||dan*hang);    
    END LOOP;
END;

EXEC gugu_proc(5);

/*
부서번호, 부서명, 작업 flag(I: insert, U:update, D:delete)을 매개변수로 받아 
depts 테이블에 
각각 INSERT, UPDATE, DELETE 하는 depts_proc 란 이름의 프로시저를 만들어보자.
그리고 정상종료라면 commit, 예외라면 롤백 처리하도록 처리하세요.
*/
SELECT * FROM depts;
ALTER TABLE depts ADD CONSTRAINT dept_id_pk PRIMARY KEY(department_id);

CREATE OR REPLACE PROCEDURE depts_proc(
    p_id IN depts.department_id%type,
    p_name IN depts.department_name%type,
    p_opper IN VARCHAR2)
IS
    cnt NUMBER;
BEGIN
    SELECT count(*) INTO cnt FROM depts WHERE department_id = p_id;


    IF p_opper = 'I' THEN
        INSERT INTO depts (department_id,department_name)
        VALUES (p_id,p_name);
    ELSIF p_opper = 'U' THEN
        IF cnt= 0 THEN
            dbms_output.put_line(0/0);
        END IF;
        UPDATE depts SET
            department_name = p_name
        WHERE department_id = p_id;
    ELSIF p_opper = 'D' THEN
        IF cnt= 0 THEN
            dbms_output.put_line(0/0);
        END IF;
        DELETE FROM depts WHERE department_id = p_id;
    ELSE
        dbms_output.put_line('잘못된 입력값 입니다.');
        RETURN;
    END IF;
    dbms_output.put_line('작업 끝');
    COMMIT;
EXCEPTION
    WHEN OTHERS THEN 
        dbms_output.put_line('예외발생');
        ROLLBACK;
END;

EXEC depts_proc(500,'test','I');
SELECT * FROM depts;

UPDATE depts SET
            department_name = 567534565
        WHERE department_id = 'sadfsadfsa';
/*
employee_id를 입력받아 employees에 존재하면,
근속년수를 out하는 프로시저를 작성하세요. (익명블록에서 프로시저를 실행)
없다면 exception처리하세요
*/


CREATE OR REPLACE PROCEDURE show_y(
    p_id IN employees.employee_id%type,
    p_years OUT NUMBER
    )
IS
BEGIN
    SELECT TRUNC(sysdate-hire_date) INTO p_years FROM employees WHERE employee_id = p_id;
EXCEPTION
    WHEN OTHERS THEN
    dbms_output.put_line('예외 발생');
END;

DECLARE
    rs number;
BEGIN
    show_y(100,rs);
    dbms_output.put_line(rs);
END;


/
--------------------------------------------------------
--  DDL for Procedure MY_NEW_JOB_PROC
--------------------------------------------------------
set define off;

  CREATE OR REPLACE PROCEDURE "HR"."MY_NEW_JOB_PROC" 
    (p_job_id IN jobs.job_id%TYPE,
    p_result OUT VARCHAR2 -- 바깥쪽에서 출력을 하기 위한 변수
    )
IS
    v_cnt NUMBER := 0;
    v_result VARCHAR2(100) := '값이 없어서 INSERT 처리 되었습니다.';
BEGIN
    SELECT
        COUNT(*)
    INTO
        v_cnt
    FROM jobs
    WHERE job_id = p_job_id;

    IF v_cnt=0 THEN
        dbms_output.put_line(p_job_id || '는 테이블에 존재하지 않습니다.');
        RETURN; -- 프로시저 강제 종료.
    END IF;
        SELECT
            job_id||'의 최대 연봉: '||max_salary||', 최소연봉: '||min_salary
        INTO
            v_result -- 조회 결과를 대입
        FROM jobs
        WHERE job_id = p_job_id;
    -- OUT 매개변수에 결과를 할당
    p_result := v_result;
    COMMIT;
END;

/
--------------------------------------------------------
--  DDL for Procedure MY_PARAMETER_TEST_PROC
--------------------------------------------------------
set define off;

  CREATE OR REPLACE PROCEDURE "HR"."MY_PARAMETER_TEST_PROC" 
    (
    p_var1 IN VARCHAR2, -- 반환 불가. 받는 용도로만 활용
    p_var2 OUT VARCHAR2, -- 프로시저가 끝나기 전까지 값의 할당이 안됨
    p_var3 IN OUT VARCHAR2 -- IN, OUT이 둘 다 가능
    )
IS

BEGIN
    dbms_output.put_line('p_var1: '||p_var1); -- 가능
    dbms_output.put_line('p_var2: '||p_var2); -- 값 전달 안됨(공백)
    dbms_output.put_line('p_var3: '||p_var3); -- 가능

--    p_var1 := '결과1';
    p_var2 := '결과2';
    p_var3 := '결과3';
END;

/
--------------------------------------------------------
--  DDL for Procedure NEW_EMP_PROC
--------------------------------------------------------
set define off;

  CREATE OR REPLACE PROCEDURE "HR"."NEW_EMP_PROC" (
    p_id IN emps.employee_id%type,
    p_last_name IN emps.last_name%type,
    p_email IN emps.email%type,
    p_hire_date IN emps.hire_date%type,
    p_job_id IN emps.job_id%type
)
IS
BEGIN
    MERGE INTO emps e
    USING 
        (SELECT 
            p_id as employee_id
        FROM dual)
    ON (e.employee_id = p_id)
    WHEN MATCHED THEN
        UPDATE SET
            e.last_name = p_last_name,
            e.email = p_email,
            e.hire_date = p_hire_date,
            e.job_id = p_job_id
    WHEN NOT MATCHED THEN
        INSERT (employee_id,last_name,email,hire_date,job_id) VALUES
            (p_id,p_last_name,p_email,p_hire_date,p_job_id);
END;

/
--------------------------------------------------------
--  DDL for Procedure P_TEST
--------------------------------------------------------
set define off;

  CREATE OR REPLACE PROCEDURE "HR"."P_TEST" 
IS -- 선언부
    v_msg VARCHAR2(30) := 'Hello Procedure!';
BEGIN
    dbms_output.put_line(v_msg);
END;

/
--------------------------------------------------------
--  DDL for Procedure SECURE_DML
--------------------------------------------------------
set define off;

  CREATE OR REPLACE PROCEDURE "HR"."SECURE_DML" 
IS
BEGIN
  IF TO_CHAR (SYSDATE, 'HH24:MI') NOT BETWEEN '08:00' AND '18:00'
        OR TO_CHAR (SYSDATE, 'DY') IN ('SAT', 'SUN') THEN
	RAISE_APPLICATION_ERROR (-20205,
		'You may only make changes during normal office hours');
  END IF;
END secure_dml;

/
--------------------------------------------------------
--  DDL for Procedure SHOW_Y
--------------------------------------------------------
set define off;

  CREATE OR REPLACE PROCEDURE "HR"."SHOW_Y" (
    p_id IN employees.employee_id%type,
    p_years OUT NUMBER
    )
IS
BEGIN
    SELECT TRUNC((sysdate-hire_date)/365) INTO p_years FROM employees WHERE employee_id = p_id;
EXCEPTION
    WHEN OTHERS THEN
    dbms_output.put_line('예외 발생');
END;

/
--------------------------------------------------------
--  Constraints for Table DEPT2
--------------------------------------------------------

  ALTER TABLE "HR"."DEPT2" MODIFY ("DEPT_BONUS" NOT NULL ENABLE);
  ALTER TABLE "HR"."DEPT2" ADD CONSTRAINT "DEPT2_DEPTNAME_UK" UNIQUE ("DEPT_NAME")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
  ALTER TABLE "HR"."DEPT2" ADD CONSTRAINT "DEPT2_GENDER_CK" CHECK (dept_gender IN ('M','F')) ENABLE;
  ALTER TABLE "HR"."DEPT2" MODIFY ("DEPT_NAME" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table EMPS
--------------------------------------------------------

  ALTER TABLE "HR"."EMPS" ADD CONSTRAINT "EMPS_PK" PRIMARY KEY ("EMPLOYEE_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
  ALTER TABLE "HR"."EMPS" MODIFY ("EMPLOYEE_ID" NOT NULL ENABLE);
  ALTER TABLE "HR"."EMPS" MODIFY ("JOB_ID" NOT NULL ENABLE);
  ALTER TABLE "HR"."EMPS" MODIFY ("HIRE_DATE" NOT NULL ENABLE);
  ALTER TABLE "HR"."EMPS" MODIFY ("EMAIL" NOT NULL ENABLE);
  ALTER TABLE "HR"."EMPS" MODIFY ("LAST_NAME" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table MEMBERS
--------------------------------------------------------

  ALTER TABLE "HR"."MEMBERS" ADD PRIMARY KEY ("MEM_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
  ALTER TABLE "HR"."MEMBERS" MODIFY ("MEM_NAME" NOT NULL ENABLE);
  ALTER TABLE "HR"."MEMBERS" MODIFY ("MEM_PW" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table MOVIE
--------------------------------------------------------

  ALTER TABLE "HR"."MOVIE" MODIFY ("CHARGE" NOT NULL ENABLE);
  ALTER TABLE "HR"."MOVIE" ADD PRIMARY KEY ("SERIAL_NUMBER")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
  ALTER TABLE "HR"."MOVIE" MODIFY ("RENTAL" NOT NULL ENABLE);
  ALTER TABLE "HR"."MOVIE" MODIFY ("NATION" NOT NULL ENABLE);
  ALTER TABLE "HR"."MOVIE" MODIFY ("MOVIE_NAME" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table LOCATIONS
--------------------------------------------------------

  ALTER TABLE "HR"."LOCATIONS" ADD CONSTRAINT "LOC_ID_PK" PRIMARY KEY ("LOCATION_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
  ALTER TABLE "HR"."LOCATIONS" MODIFY ("CITY" CONSTRAINT "LOC_CITY_NN" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table AUTH
--------------------------------------------------------

  ALTER TABLE "HR"."AUTH" ADD CONSTRAINT "TABLE1_PK" PRIMARY KEY ("AUTH_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
  ALTER TABLE "HR"."AUTH" MODIFY ("AUTH_ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table DEPTS
--------------------------------------------------------

  ALTER TABLE "HR"."DEPTS" ADD CONSTRAINT "DEPTS_PK" PRIMARY KEY ("DEPARTMENT_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
  ALTER TABLE "HR"."DEPTS" MODIFY ("DEPARTMENT_ID" NOT NULL ENABLE);
  ALTER TABLE "HR"."DEPTS" MODIFY ("DEPARTMENT_NAME" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table TBL_USER_BACKUP
--------------------------------------------------------

  ALTER TABLE "HR"."TBL_USER_BACKUP" ADD PRIMARY KEY ("ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Constraints for Table ORDER_HISTORY
--------------------------------------------------------

  ALTER TABLE "HR"."ORDER_HISTORY" ADD PRIMARY KEY ("ORDER_NO")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
  ALTER TABLE "HR"."ORDER_HISTORY" MODIFY ("SERIAL_NUMBER" NOT NULL ENABLE);
  ALTER TABLE "HR"."ORDER_HISTORY" MODIFY ("USER_NUMBER" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table JOBS
--------------------------------------------------------

  ALTER TABLE "HR"."JOBS" ADD CONSTRAINT "JOB_ID_PK" PRIMARY KEY ("JOB_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
  ALTER TABLE "HR"."JOBS" MODIFY ("JOB_TITLE" CONSTRAINT "JOB_TITLE_NN" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table REGIONS
--------------------------------------------------------

  ALTER TABLE "HR"."REGIONS" ADD CONSTRAINT "REG_ID_PK" PRIMARY KEY ("REGION_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
  ALTER TABLE "HR"."REGIONS" MODIFY ("REGION_ID" CONSTRAINT "REGION_ID_NN" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table TBL_BOARD
--------------------------------------------------------

  ALTER TABLE "HR"."TBL_BOARD" ADD PRIMARY KEY ("BNO")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Constraints for Table BOARD
--------------------------------------------------------

  ALTER TABLE "HR"."BOARD" ADD PRIMARY KEY ("BNO")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Constraints for Table COUNTRIES
--------------------------------------------------------

  ALTER TABLE "HR"."COUNTRIES" ADD CONSTRAINT "COUNTRY_C_ID_PK" PRIMARY KEY ("COUNTRY_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
  ALTER TABLE "HR"."COUNTRIES" MODIFY ("COUNTRY_ID" CONSTRAINT "COUNTRY_ID_NN" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table INFO
--------------------------------------------------------

  ALTER TABLE "HR"."INFO" ADD CONSTRAINT "INFO_PK" PRIMARY KEY ("ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
  ALTER TABLE "HR"."INFO" MODIFY ("REGDATE" NOT NULL ENABLE);
  ALTER TABLE "HR"."INFO" MODIFY ("ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table PRODUCT
--------------------------------------------------------

  ALTER TABLE "HR"."PRODUCT" ADD PRIMARY KEY ("PRODUCT_NO")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Constraints for Table EMPLOYEES
--------------------------------------------------------

  ALTER TABLE "HR"."EMPLOYEES" ADD CONSTRAINT "EMP_EMP_ID_PK" PRIMARY KEY ("EMPLOYEE_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
  ALTER TABLE "HR"."EMPLOYEES" ADD CONSTRAINT "EMP_EMAIL_UK" UNIQUE ("EMAIL")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
  ALTER TABLE "HR"."EMPLOYEES" ADD CONSTRAINT "EMP_SALARY_MIN" CHECK (salary > 0) ENABLE;
  ALTER TABLE "HR"."EMPLOYEES" MODIFY ("JOB_ID" CONSTRAINT "EMP_JOB_NN" NOT NULL ENABLE);
  ALTER TABLE "HR"."EMPLOYEES" MODIFY ("HIRE_DATE" CONSTRAINT "EMP_HIRE_DATE_NN" NOT NULL ENABLE);
  ALTER TABLE "HR"."EMPLOYEES" MODIFY ("EMAIL" CONSTRAINT "EMP_EMAIL_NN" NOT NULL ENABLE);
  ALTER TABLE "HR"."EMPLOYEES" MODIFY ("LAST_NAME" CONSTRAINT "EMP_LAST_NAME_NN" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table PATIENTS
--------------------------------------------------------

  ALTER TABLE "HR"."PATIENTS" ADD PRIMARY KEY ("PATIENT_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
  ALTER TABLE "HR"."PATIENTS" MODIFY ("PATIENT_PHONE" NOT NULL ENABLE);
  ALTER TABLE "HR"."PATIENTS" MODIFY ("PATIENT_ADDRESS" NOT NULL ENABLE);
  ALTER TABLE "HR"."PATIENTS" MODIFY ("PATIENT_NAME" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table EMPS_IT
--------------------------------------------------------

  ALTER TABLE "HR"."EMPS_IT" MODIFY ("JOB_ID" NOT NULL ENABLE);
  ALTER TABLE "HR"."EMPS_IT" MODIFY ("HIRE_DATE" NOT NULL ENABLE);
  ALTER TABLE "HR"."EMPS_IT" MODIFY ("EMAIL" NOT NULL ENABLE);
  ALTER TABLE "HR"."EMPS_IT" MODIFY ("LAST_NAME" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table USERS
--------------------------------------------------------

  ALTER TABLE "HR"."USERS" ADD PRIMARY KEY ("USER_NUMBER")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
  ALTER TABLE "HR"."USERS" MODIFY ("PHONE_NUMBER" NOT NULL ENABLE);
  ALTER TABLE "HR"."USERS" MODIFY ("USER_NAME" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table DRUGS
--------------------------------------------------------

  ALTER TABLE "HR"."DRUGS" ADD UNIQUE ("DRUG_NAME")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
  ALTER TABLE "HR"."DRUGS" ADD PRIMARY KEY ("DRUG_NUMBER")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
  ALTER TABLE "HR"."DRUGS" MODIFY ("COMPANY_NAME" NOT NULL ENABLE);
  ALTER TABLE "HR"."DRUGS" MODIFY ("INGREDIENT" NOT NULL ENABLE);
  ALTER TABLE "HR"."DRUGS" MODIFY ("DRUG_PRICE" NOT NULL ENABLE);
  ALTER TABLE "HR"."DRUGS" MODIFY ("DRUG_NAME" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table JOBS_IT
--------------------------------------------------------

  ALTER TABLE "HR"."JOBS_IT" MODIFY ("JOB_TITLE" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table DEPARTMENTS
--------------------------------------------------------

  ALTER TABLE "HR"."DEPARTMENTS" ADD CONSTRAINT "DEPT_ID_PK" PRIMARY KEY ("DEPARTMENT_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
  ALTER TABLE "HR"."DEPARTMENTS" MODIFY ("DEPARTMENT_NAME" CONSTRAINT "DEPT_NAME_NN" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table JOB_HISTORY
--------------------------------------------------------

  ALTER TABLE "HR"."JOB_HISTORY" ADD CONSTRAINT "JHIST_EMP_ID_ST_DATE_PK" PRIMARY KEY ("EMPLOYEE_ID", "START_DATE")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
  ALTER TABLE "HR"."JOB_HISTORY" ADD CONSTRAINT "JHIST_DATE_INTERVAL" CHECK (end_date > start_date) ENABLE;
  ALTER TABLE "HR"."JOB_HISTORY" MODIFY ("JOB_ID" CONSTRAINT "JHIST_JOB_NN" NOT NULL ENABLE);
  ALTER TABLE "HR"."JOB_HISTORY" MODIFY ("END_DATE" CONSTRAINT "JHIST_END_DATE_NN" NOT NULL ENABLE);
  ALTER TABLE "HR"."JOB_HISTORY" MODIFY ("START_DATE" CONSTRAINT "JHIST_START_DATE_NN" NOT NULL ENABLE);
  ALTER TABLE "HR"."JOB_HISTORY" MODIFY ("EMPLOYEE_ID" CONSTRAINT "JHIST_EMPLOYEE_NN" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table TBL_USER
--------------------------------------------------------

  ALTER TABLE "HR"."TBL_USER" ADD PRIMARY KEY ("ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Constraints for Table PRESCRIPTIONS
--------------------------------------------------------

  ALTER TABLE "HR"."PRESCRIPTIONS" ADD PRIMARY KEY ("PRESCRIPTION_NO")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
  ALTER TABLE "HR"."PRESCRIPTIONS" MODIFY ("PRESCRIPTION_DATE" NOT NULL ENABLE);
  ALTER TABLE "HR"."PRESCRIPTIONS" MODIFY ("DAYS_MEDICATION" NOT NULL ENABLE);
  ALTER TABLE "HR"."PRESCRIPTIONS" MODIFY ("DRUG_NUMBER" NOT NULL ENABLE);
  ALTER TABLE "HR"."PRESCRIPTIONS" MODIFY ("DOCTOR_NAME" NOT NULL ENABLE);
--------------------------------------------------------
--  Ref Constraints for Table COUNTRIES
--------------------------------------------------------

  ALTER TABLE "HR"."COUNTRIES" ADD CONSTRAINT "COUNTR_REG_FK" FOREIGN KEY ("REGION_ID")
	  REFERENCES "HR"."REGIONS" ("REGION_ID") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table DEPARTMENTS
--------------------------------------------------------

  ALTER TABLE "HR"."DEPARTMENTS" ADD CONSTRAINT "DEPT_LOC_FK" FOREIGN KEY ("LOCATION_ID")
	  REFERENCES "HR"."LOCATIONS" ("LOCATION_ID") ENABLE;
  ALTER TABLE "HR"."DEPARTMENTS" ADD CONSTRAINT "DEPT_MGR_FK" FOREIGN KEY ("MANAGER_ID")
	  REFERENCES "HR"."EMPLOYEES" ("EMPLOYEE_ID") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table DEPT2
--------------------------------------------------------

  ALTER TABLE "HR"."DEPT2" ADD CONSTRAINT "DEPT2_LOCA_LOCID_FK" FOREIGN KEY ("LOCA")
	  REFERENCES "HR"."LOCATIONS" ("LOCATION_ID") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table EMPLOYEES
--------------------------------------------------------

  ALTER TABLE "HR"."EMPLOYEES" ADD CONSTRAINT "EMP_DEPT_FK" FOREIGN KEY ("DEPARTMENT_ID")
	  REFERENCES "HR"."DEPARTMENTS" ("DEPARTMENT_ID") ENABLE;
  ALTER TABLE "HR"."EMPLOYEES" ADD CONSTRAINT "EMP_JOB_FK" FOREIGN KEY ("JOB_ID")
	  REFERENCES "HR"."JOBS" ("JOB_ID") ENABLE;
  ALTER TABLE "HR"."EMPLOYEES" ADD CONSTRAINT "EMP_MANAGER_FK" FOREIGN KEY ("MANAGER_ID")
	  REFERENCES "HR"."EMPLOYEES" ("EMPLOYEE_ID") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table JOB_HISTORY
--------------------------------------------------------

  ALTER TABLE "HR"."JOB_HISTORY" ADD CONSTRAINT "JHIST_DEPT_FK" FOREIGN KEY ("DEPARTMENT_ID")
	  REFERENCES "HR"."DEPARTMENTS" ("DEPARTMENT_ID") ENABLE;
  ALTER TABLE "HR"."JOB_HISTORY" ADD CONSTRAINT "JHIST_EMP_FK" FOREIGN KEY ("EMPLOYEE_ID")
	  REFERENCES "HR"."EMPLOYEES" ("EMPLOYEE_ID") ENABLE;
  ALTER TABLE "HR"."JOB_HISTORY" ADD CONSTRAINT "JHIST_JOB_FK" FOREIGN KEY ("JOB_ID")
	  REFERENCES "HR"."JOBS" ("JOB_ID") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table LOCATIONS
--------------------------------------------------------

  ALTER TABLE "HR"."LOCATIONS" ADD CONSTRAINT "LOC_C_ID_FK" FOREIGN KEY ("COUNTRY_ID")
	  REFERENCES "HR"."COUNTRIES" ("COUNTRY_ID") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table PRESCRIPTIONS
--------------------------------------------------------

  ALTER TABLE "HR"."PRESCRIPTIONS" ADD FOREIGN KEY ("PATIENT_ID")
	  REFERENCES "HR"."PATIENTS" ("PATIENT_ID") ENABLE;
  ALTER TABLE "HR"."PRESCRIPTIONS" ADD FOREIGN KEY ("DRUG_NUMBER")
	  REFERENCES "HR"."DRUGS" ("DRUG_NUMBER") ENABLE;
