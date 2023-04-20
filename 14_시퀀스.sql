-- 시퀀스 (순차적으로 증가하는 값을 만들어 주는 객체)

-- 시퀀스를 안 쓴 테이블
CREATE TABLE dept3 (
    dept_no NUMBER(2),
    dept_name VARCHAR2(14),
    laca VARCHAR2(13),
    dept_date DATE    
);

INSERT INTO dept3
VALUES (1,'test','test',sysdate);

INSERT INTO dept3
VALUES (2,'test','test',sysdate);

INSERT INTO dept3
VALUES (3,'test','test',sysdate);

-- 매번 숫자를 입력하는 것은 비효율적임
DROP TABLE dept3;

SELECT * FROM dept3;

----------------------------

-- 시퀀스를 사용한 테이블
CREATE SEQUENCE dept3_seq --구분하기 좋게 시퀀스 이름 지어주기
    START WITH 1 -- 시작값 (기본값은 증가할 때 최소값, 감소할 때 최대값)
    INCREMENT BY 1 -- 증가값 (양수면 증가, 음수면 감소, 기본값 1)
    MAXVALUE 10 -- 최대값(기본값은 증가일 때 1027, 감소일 때 -1)
    MINVALUE 1 -- 최솟값(기본값 증가 1, 감소일 때 -1028)
    NOCACHE -- 캐시메모리 사용 여부 (CACHE). 
            -- 성능향상 위해 일정 범위의 시퀀스 미리 받음, 
            -- 그러나 에러 발생시 메모리 내 데이터 전부 지워지고 다시 시퀀스를 받을 때 날라간 데이터는 건너뜀
    NOCYCLE; -- 순환 여부 (NOCYCLE이 기본, 순환시키려면 CYCLE)

CREATE TABLE dept3 (
    dept_no NUMBER(2) PRIMARY KEY,
    dept_name VARCHAR2(14),
    laca VARCHAR2(13),
    dept_date DATE    
);

--시퀀스 사용하기 (NEXTVAL, CURRVAL)
INSERT INTO dept3
VALUES(dept3_seq.NEXTVAL, 'test', 'test', sysdate);

SELECT * FROM dept3;

SELECT dept3_seq.CURRVAL FROM dual;

-- 시퀀스 수정 (직접 수정 가능)
-- START WITH는 수정이 불가능
ALTER SEQUENCE dept3_seq MAXVALUE 9999; -- 최대값 증가
ALTER SEQUENCE dept3_seq INCREMENT BY 10; -- 증가값 변경
ALTER SEQUENCE dept3_seq MINVALUE 0; -- 최소값 변경

-- 시퀀스 값을 다시 처음으로 돌리는 방법
DROP TABLE dept3; -- 테이블을 지워도 시퀀스 값은 그대로
ALTER SEQUENCE dept3_seq INCREMENT BY -9;
SELECT dept3_seq.NEXTVAL FROM dual;
ALTER SEQUENCE dept3_seq INCREMENT BY 1;
SELECT dept3_seq.CURRVAL FROM dual;
-- 또는 지우고 다시 만들기
DROP SEQUENCE dept3_seq;

----------------------------------

/*
- index
index는 primary key, unique 제약 조건에서 자동으로 생성되고,
조회를 빠르게 해 주는 hint 역할을 합니다.
index는 조회를 빠르게 하지만, 무작위하게 많은 인덱스를 생성해서
사용하면 오히려 성능 부하를 일으킬 수 있습니다.
정말 필요할 때만 index를 사용하는 것이 바람직합니다.
*/

SELECT * FROM employees WHERE salary = 12008;

-- 인덱스 추가
CREATE INDEX emp_salary_idx ON employees(salary);

DROP INDEX emp_salary_idx;

-- 시퀀스와 인덱스를 사용하는 hint 방법
CREATE SEQUENCE board_seq
    START WITH 1
    INCREMENT BY 1
    NOCACHE
    NOCYCLE;
    
CREATE TABLE tbl_board(
    bno NUMBER(10) PRIMARY KEY,
    writer VARCHAR2(20)
);

INSERT INTO tbl_board
VALUES(board_seq.NEXTVAL, 'test');

INSERT INTO tbl_board
VALUES(board_seq.NEXTVAL, 'admin');

INSERT INTO tbl_board
VALUES(board_seq.NEXTVAL, 'hong');

INSERT INTO tbl_board
VALUES(board_seq.NEXTVAL, 'kim');

INSERT INTO tbl_board
VALUES(board_seq.NEXTVAL, 'test');

INSERT INTO tbl_board
VALUES(board_seq.NEXTVAL, 'test');

INSERT INTO tbl_board
VALUES(board_seq.NEXTVAL, 'admin');

INSERT INTO tbl_board
VALUES(board_seq.NEXTVAL, 'hong');

INSERT INTO tbl_board
VALUES(board_seq.NEXTVAL, 'kim');

SELECT * FROM tbl_board;

COMMIT;

-- 인덱스 이름 변경
ALTER INDEx SYS_C007045
RENAME TO tbl_board_idx;


SELECT * FROM
    (
    SELECT ROWNUM AS rn, a.*
    FROM
        (SELECT * FROM tbl_board ORDER BY bno DESC) a
    )
WHERE rn >10 AND rn <=20;

-- /*+ INDEX(table_name index_name)*/
-- 지정된 인덱스를 강제로 쓰게끔 지정.
-- INDEX ASC, DESC를 추가해서 내림차, 오름차 순으로 쓰게끔 지정 가능

SELECT * FROM
    (
    SELECT /*+ INDEX_DESC(tbl_board tbl_board_idx) */
        ROWNUM AS rn,
        bno,
        writer
    FROM tbl_board
    )
WHERE rn >10 AND rn <=20;

/*
- 인덱스가 권장되는 경우 
1. 컬럼이 WHERE 또는 조인조건에서 자주 사용되는 경우
2. 열이 광범위한 값을 포함하는 경우
3. 테이블이 대형인 경우
4. 타겟 컬럼이 많은 수의 null값을 포함하는 경우.

 테이블이 자주 수정되고, 이미 하나 이상의 인덱스를 가지고 있는 경우에는
 권장하지 않습니다.
*/