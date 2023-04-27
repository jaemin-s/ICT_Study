CREATE TABLE m_users(
    user_id VARCHAR2(20) PRIMARY KEY,
    user_name VARCHAR2(20) NOT NULL,
    user_address VARCHAR2(200) NOT NULL,
    user_job VARCHAR2(20) NOT NULL
);

SELECT * FROM m_users;

CREATE TABLE prescriptions(
    prescription_no NUMBER(6) PRIMARY KEY,
    user_id VARCHAR2(20) REFERENCES m_users(user_id),
    doctor_name VARCHAR2(20) NOT NULL,
    p_date DATE DEFAULT sysdate NOT NULL,
    day_medication NUMBER(3) NOT NULL
);

SELECT * FROM prescriptions;

CREATE SEQUENCE prescriptions_seq
    START WITH 1
    INCREMENT BY 1
    MAXVALUE 100000
    NOCYCLE
    NOCACHE;



CREATE TABLE products(
    product_name VARCHAR2(40) PRIMARY KEY,
    product_price NUMBER(10) DEFAULT 5000 NOT NULL,
    company_name VARCHAR2(40) NOT NULL
);


CREATE SEQUENCE products_seq
    START WITH 1
    INCREMENT BY 1
    MAXVALUE 100000
    NOCYCLE
    NOCACHE;
   
SELECT * FROM products;


CREATE TABLE ingredients(
    product_name VARCHAR2(40),
    ingredient VARCHAR2(40) NOT NULL
);



