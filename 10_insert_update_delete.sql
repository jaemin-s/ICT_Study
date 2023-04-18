-- insert
-- 테이블 구조 확인
DESC departments;

-- insert의 첫번째 방법 (모든 컬럼 데이터를 한 번에 지정)
INSERT INTO departments
VALUES(290,'영업부',100,2300);

-- VALUES (290,'영업부'); --VALUES로 행을 추가할 때는 값을 다 입력해야함

SELECT * FROM departments;

ROLLBACK; -- 실행 시점을 다시 뒤로 되돌리는 키워드

-- insert의 두 번째 방법 (직접 컬럼을 지정하고 저장, NOT NULL 확인해야함)
INSERT INTO departments
    (department_id,department_name)
VALUES
    (290,'영업부',1700);
    
-- 사본 테이블 생성
CREATE table managers as
(SELECt employee_id,first_name,job_id,hire_date
FROM employees WHERE 1 = 2);
-- WHERE 부분에 false값을 넣으면 구조만 복사
-- boolean type이 없어서 false가 나오는 식을 써서 활용

SELECT * FROM managers;

DROP TABLE managers;

-- INSERT (서브쿼리)
INSERT INTO managers
(SELECT employee_id, first_name, job_id, hire_date FROM employees);

-------------------------------------------

-- UPDATE
CREATE TABLE emps AS (SELECT * FROM employees);
SELECT * FROM emps;

/*
CTAS를 사용하면 제약 조건은 NOT NULL 말고는 복사되지 않습니다.
제약조건은 업무 규칙을 지키는 데이터만 저장하고, 그렇지 않은 것들이
DB에 저장되는 것을 방지하는 목적으로 사용합니다.
*/