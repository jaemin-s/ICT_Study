








SELECT * FROM user_sys_privs; -- 권환 확인

-- 단순 뷰
-- 뷰의 컬럼 이름은 함수와 같은 가상표현식이면 안됩니다.
-- 가상표현식? 함수를 사용한 컬럼이름 >> 별칭을 붙이면 됨



SELECT employee_id, first_name||' '||last_name, job_id, salary
FROM employees
WHERE department_id = 60;

CREATE VIEW view_emp AS (
    SELECT employee_id, first_name||' '||last_name AS name, job_id, salary
    FROM employees
    WHERE department_id = 60
);

SELECT * FROM view_emp;

-- 복합 뷰
-- 여러 테이블을 조인하여 필요한 데이터만 저장하고 빠른 확인을 위해 사용
CREATE VIEW view_emp_dept_jobs AS (
    SELECT
        e.employee_id,
        e.first_name||' '||last_name as name,
        d.department_name,
        j.job_title
    FROM employees e
    LEFT JOIN departments d
    ON e.department_id = d.department_id
    LEFT JOIN jobs j
    ON e.job_id = j.job_id
) ORDER BY employee_id ASC;

SELECT * FROM view_emp_dept_jobs;

-- 뷰의 수정 (CREATE OR REPLACE VIEW 구문)
-- 동일 이름으로 해당 구문을 사용하면 데이터가 변경되면서 새롭게 생성됩니다.

CREATE OR REPLACE VIEW view_emp_dept_jobs AS (
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
) ORDER BY employee_id ASC;

SELECT * FROM view_emp_dept_jobs;

SELECT  job_title, AVG(salary)
FROM view_emp_dept_jobs
GROUP BY job_title
ORDER BY AVG(salary) DESC; -- SQL 구문이 확실히 짧아짐

-- 뷰 삭제
DROP VIEW view_emp;

/*
VIEW에 INSERT가 일어나는 경우 실제 테이블에도 반영이 됩니다
그래서 VIEW의 INSERT, UPDATE, DELETE는 많은 제약사항이 따릅니다.
원본 테이블이 NOT NULL인 경우 VIEW에 INSERT가 불가능합니다.
VIEW에서 사용하는 컬럼이 가상열인 경우에도 안됩니다.
*/

-- 두 번째 컬럼인 'name'은 가상열(virtual column)이기 때문에 INSERT 안 됩니다.
INSERT INTO view_emp_dept_jobs
VALUES(300,'test','test','test',10000);

-- JOIN된 뷰의 경우 한번에 수정할 수 없습니다.
INSERT INTO view_emp_dept_jobs
(emloyee_id,department_name,job_title,salary)
VALUES(300,'test','test','test',10000);

-- 원본 테이블의 null을 허용하지 않는 컬럼 때문에 들어갈 수 없습니다.
INSERT INTO view_emp
(emloyee_id,job_id,salary)
VALUES(300,'test',10000);

-- WITH CHECK OPTION >> 조건 제약 컬럼
-- 조건에 사용되어진 컬럼값음 뷰를 통해서 변경할 수 없게 해주는 키워드


-- 읽기 전용 뷰 -> WITH READ ONLY (DML 연산을 막음 -> SELECT만 허용)
CREATE OR REPLACE VIEW view_emp_test AS (
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
) WITH CHECK OPTION CONSTRAINT view_emp_test_ck;

SELECT * FROM view_emp_test;

UPDATE view_emp_test
SET department_id = 100 WHERE employee_id = 106;

SELECT * FROM employees;