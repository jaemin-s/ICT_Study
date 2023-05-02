DROP TABLE patients;
DROP TABLE drugs;
DROP SEQUENCE drugs_seq;
DROP TABLE prescriptions;
DROP SEQUENCE prescriptions_seq;


CREATE TABLE patients(
    patient_id VARCHAR2(20) PRIMARY KEY,
    patient_name VARCHAR2(20) NOT NULL,
    patient_address VARCHAR2(200) NOT NULL,
    patient_phone VARCHAR2(20) NOT NULL
);

CREATE TABLE drugs(
    drug_number NUMBER(10) PRIMARY KEY,
    drug_name VARCHAR2(40) UNIQUE NOT NULL,
    drug_price NUMBER(10) DEFAULT 5000 NOT NULL,
    ingredient VARCHAR2(50) NOT NULL,
    company_name VARCHAR2(40) NOT NULL
);

CREATE SEQUENCE drugs_seq
    START WITH 1
    INCREMENT BY 1
    MAXVALUE 100000
    NOCYCLE
    NOCACHE;
CREATE TABLE prescriptions(
    prescription_no NUMBER(6) PRIMARY KEY,
    patient_id VARCHAR2(20) REFERENCES patients(patient_id),
    doctor_name VARCHAR2(20) NOT NULL,
    drug_number NUMBER(10) REFERENCES drugs(drug_number) NOT NULL,
    days_medication NUMBER(3) NOT NULL,
    prescription_date DATE DEFAULT sysdate NOT NULL
);

CREATE SEQUENCE prescriptions_seq
    START WITH 1
    INCREMENT BY 1
    MAXVALUE 100000
    NOCYCLE
    NOCACHE;

-- ���̵�����
INSERT INTO patients VALUES ('980123-1234567','��ö��','����� ������','010-1111-2222');
INSERT INTO patients VALUES ('941215-2234321','�ڿ���','����� ���α�','010-8282-8888');
INSERT INTO patients VALUES ('910623-1284351','��ö��','��õ�� ����','010-2580-2580');

INSERT INTO drugs VALUES (drugs_seq.NEXTVAL, '��������',30000,'���������忰�꿰','�ϵ�����');
INSERT INTO drugs VALUES (drugs_seq.NEXTVAL, '����ź�÷�����',20000,'�߻縣ź','��������');
INSERT INTO drugs VALUES (drugs_seq.NEXTVAL, '�̷����',25000,'����ȭ���׳׽�','����������');
  
INSERT INTO prescriptions VALUES (prescriptions_seq.nextval,'910623-1284351','Ȳ�ǻ�',2,3,'2020-02-07');
INSERT INTO prescriptions VALUES (prescriptions_seq.nextval,'941215-2234321','�̵�����',3,3,'2021-06-28');
INSERT INTO prescriptions VALUES (prescriptions_seq.nextval,'910623-1284351','Ȳ�ǻ�',2,3,'2022-10-10');

