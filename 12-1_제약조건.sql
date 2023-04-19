
-- 테이블 생성과 제약조건
-- 테이블 열레벨 제약조건 (PRIMARY KEY, UNIQUE, NOT NULL, FOREIGN KEY, CHECK)
-- PRIMARY KEY: 테이블의 고유 식별 컬럼입니다. (주요 키)
-- UNIQUE: 유일한 값을 갖게 하는 컬럼 (중복값 방지)
-- NOT NULL: null을 허용하지 않음.
-- FOREIGN KEY: 참조하는 테이블의 PRIMARY KEY를 저장하는 컬럼
-- CHECK: 정의된 형식만 저장되도록 허용.

DESC dept2;

CREATE TABLE dept2 (
    dept_no NUMBER(3) CONSTRAINT dept2_deptno_pk PRIMARY KEY, -- dept2_deptno_pk는 제약조건의 사용자 지정 별칭, 다른걸로 지어도 상관없음
    dept_name VARCHAR2(20) NOT NULL CONSTRAINT dept2_deptname_uk UNIQUE, -- NOT NULL은 바로 가능
    loca NUMBER(4) CONSTRAINT dept2_loca_locid_fk REFERENCES locations(location_id),
    dept_bonus NUMBER(10) CONSTRAINT dept2_bonus_ck CHECK(dept_bonus > 0),
    dept_gender VARCHAR2(1) CONSTRAINT dept2_gender_ck CHECK(dept_gender IN ('M','F'))
);

desc locations;
DESC dept2;
SELECT * FROM dept2;