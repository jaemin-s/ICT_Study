CREATE TABLE patients(
    patient_id VARCHAR2(20) PRIMARY KEY,
    patient_name VARCHAR2(20) NOT NULL,
    patient_address VARCHAR2(200) NOT NULL,
    patient_phone VARCHAR2(20) NOT NULL
);

SELECT * FROM patients;
DROP TABLE patients;

CREATE TABLE prescriptions(
    prescription_no NUMBER(6) PRIMARY KEY,
    patient_id VARCHAR2(20) REFERENCES patients(patient_id),
    doctor_name VARCHAR2(20) NOT NULL,
    drug_number NUMBER(10) REFERENCES drugs(drug_number) NOT NULL,
    days_medication NUMBER(3) NOT NULL,
    prescription_date DATE DEFAULT sysdate NOT NULL
);

DROP TABLE prescriptions;
SELECT * FROM prescriptions;

CREATE SEQUENCE prescriptions_seq
    START WITH 1
    INCREMENT BY 1
    MAXVALUE 100000
    NOCYCLE
    NOCACHE;

DROP SEQUENCE prescriptions_seq;

CREATE TABLE drugs(
    drug_number NUMBER(10) PRIMARY KEY,
    drug_name VARCHAR2(40) UNIQUE NOT NULL,
    drug_price NUMBER(10) DEFAULT 5000 NOT NULL,
    company_name VARCHAR2(40) NOT NULL
);

SELECT * FROM drugs;
DROP TABLE drugs;

CREATE SEQUENCE drugs_seq
    START WITH 1
    INCREMENT BY 1
    MAXVALUE 100000
    NOCYCLE
    NOCACHE;
   
DROP SEQUENCE drugs_seq;


CREATE TABLE ingredients(
    drug_number NUMBER(10) REFERENCES drugs(drug_number) NOT NULL,
    ingredient VARCHAR2(40) NOT NULL
);

DROP TABLE ingredients;



