
/*
    - NUMBER (n) : 정수를 n번째자리까지 저장할 수 있는 숫자형 타입.
    - NUMBER(n,m) : 정수부, 실수부를 합친 총 자리수가 n, 소수점 자리수는 m. 정수부+m > n 경우, 입력 불가
    - NUMBER : 괄호를 생략할 시 (38,0)으로 자동 지정
    - VARCHAR2(byte) : 괄호 안에 들어올 문자열의 최대 길이를 지정. (4000byte까지)
    - CLOB : 대용량 텍스트 데이터 타입 (최대 4Gbyte)
    - BLOB : 이진형 대용량 객체 (이미지, 파일 저장 시 사용)
    - DATE : BC 4712년 1월 1일 ~ AD 9999년 12월 31일까지 지정 가능. 시, 분, 초 지원 가능.
    
*/
ROLLBACK;
CREATE TABLE dept2 (
    dept_no NUMBER(3),
    dept_name VARCHAR2(20),
    loca VARCHAR2(24),
    dept_date DATE,
    dept_bonus NUMBER(10)
);

SELECT * FROM dept2;
DESC dept2;

INSERT INTO dept2
VALUES(40,'영업','서울',sysdate,200000);
INSERT INTO dept2
VALUES(30,'경영지원','서울',sysdate,2000000); -- 지정한 입력값의 범위를 초과하면 삽입 

-- 컬럼 추가
ALTER TABLE dept2
ADD (dept_count NUMBER(3));

-- 열이름 변경
ALTER TABLE dept2
RENAME COLUMN dept_count TO emp_count;

-- 열 속성 수정
-- 이미 데이터가 들어간 컬럼은 맞지 않는 데이터타입으로는 변경 불가
ALTER TABLE dept2
MODIFY (emp_count NUMBER(4)); 

-- 열 삭제
ALTER TABLE dept2
DROP COLUMN emp_count;

-- 테이블 이름 변경
ALTER TABLE dept2
RENAME TO dept3;

SELECT * FROM dept3;

-- 테이블 삭제 (구조는 남겨두고 내부 데이터만 모두 삭제)
TRUNCATE TABLE dept3;

DROP TABLE dept3;
-- 스크립트창에 연필모양 눌러서 수정 가능