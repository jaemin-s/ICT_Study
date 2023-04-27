CREATE TABLE m_users(
    user_id VARCHAR2(20) PRIMARY KEY,
    user_name VARCHAR2(20) NOT NULL,
    user_address VARCHAR2(200) NOT NULL,
    user_job VARCHAR2(20) NOT NULL
);

DROP TABLE m_users;

INSERT INTO m_users VALUES ("991212-1234567","홍길동","서울시 마포구","의사");