/*
AFTER 트리거 - INSERT, UPDATE, DELETE 작업 이후에 동작하는 트리거를 의미합니다
BEFORE 트리거 - INSERT, UPDATE, DELETE 작업 이전에 동작하는 트리거를 의미합니다.

:OLD = 참조 전 열의 값 (INSERT: 입력 전 자료, UPDATE: 수정 전 자료, DELETE: 삭제될 값) 
:NEW = 참조 후 열의 값 (INSERT: 입력 할 자료, UPDATE: 수정 된 자료, DELETE는 :NEW없음)

테이블에 UPDATE나 DELETE를 시도하면 수정, 또는 삭제된 데이터를
별도의 테이블에 보관해 놓는 형식으로 트리거를 많이 사용합니다.

*/

CREATE TABLE tbl_user(
    id VARCHAR2(20) PRIMARY KEY,
    name VARCHAR2(20),
    address VARCHAR2(30)
);

CREATE TABLE tbl_user_backup(
    id VARCHAR2(20) PRIMARY KEY,
    name VARCHAR2(20),
    address VARCHAR2(30),
    update_date DATE DEFAULT sysdate,
    m_type VARCHAR2(10),
    m_user VARCHAR2(20)
);

-- AFTER 트리거
CREATE OR REPLACE TRIGGER trh_user_backup
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


INSERT INTO tbl_user VALUES('test1','kim','서울');
INSERT INTO tbl_user VALUES('test2','park','경기');
INSERT INTO tbl_user VALUES('test3','lee','부산');

SELECT * FROM tbl_user;
SELECT * FROM tbl_user_backup;

UPDATE tbl_user SET address='인천' WHERE id='test1';
DELETE FROM tbl_user WHERE id='test2';

-- BEFORE 트리거
CREATE OR REPLACE TRIGGER trg_user_insert
    BEFORE INSERT
    ON tbl_user
    FOR EACH ROW
BEGIN
    :NEW.name := SUBSTR(:NEW.name,1,1)||'**';
END;

INSERT INTO tbl_user VALUES('test04','메롱','대전');



/*
- 트리거의 활용
INSERT > 주문 테이블 > 주문 테이블 INSERT 트리거 실행 (물품 테이블 UPDATE)
*/

-- 주문 히스토리
CREATE TABLE order_history (
    history_no NUMBER(5) PRIMARY KEY,
    order_no NUMBER(5),
    product_no NUMBER(5),
    total NUMBER(10),
    price NUMBER(10)
);

-- 상품
CREATE TABLE product (
   product_no NUMBER(5) PRIMARY KEY,
   product_name VARCHAR2(20),
   total NUMBER(5),
   price NUMBER(5)
);

CREATE SEQUENCE order_history_seq NOCACHE;
CREATE SEQUENCE product_seq NOCACHE;

INSERT INTO product VALUES(product_seq.NEXTVAL, 'pizza',100,10000);
INSERT INTO product VALUES(product_seq.NEXTVAL, '치킨',100,30000);
INSERT INTO product VALUES(product_seq.NEXTVAL, '햄버거',100,8000);

SELECT * FROM product;

CREATE OR REPLACE TRIGGER trg_order_history
    AFTER INSERT
    ON order_history
    FOR EACH ROW
DECLARE
    v_total NUMBER;
    v_product_no NUMBER;
BEGIN
    dbms_output.put_line('트리거 실행');
    SELECT
        :NEW.total
    INTO
        v_total
    FROM dual;
    
    v_product_no := :NEW.product_no;
    
    UPDATE product SET total = total - v_total
    WHERE product_no = v_product_no;
END;

INSERT INTO order_history VALUES (order_history_seq.NEXTVAL, 201, 2, 2, 60000);
INSERT INTO order_history VALUES (order_history_seq.NEXTVAL, 203, 3, 20, 160000);

SELECT * FROM product;