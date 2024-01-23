
-- MERGE: 테이블 병합

/*
    UPDATE와 INSERT를 한 방에 처리
    
    한 테이블에 해당하는 데이터가 있다면 UPDATE를,
    없으면 INSERT로 처리해라
*/

CREATE TABLE emps_it AS (SELECT * FROM employees WHERE 1=2);
SELECT * FROM emps_it;

INSERT INTO emps_it
    (employee_id, first_name, last_name, email, hire_date, job_id)
VALUES
    (105, '데이비드','김','DAVIDKIM','20/04/19','IT_PROG');
    
SELECT * FROM employees
WHERE job_id = 'IT_PROG';

MERGE INTO emps_it a -- 머지를 할 타겟 테이블(병합 받는 테이블)
USING -- 병합시킬 데이터
    (SELECT * FROM employees WHERE job_id = 'IT_PROG') b -- 병합하고자 하는 데이터
ON -- 병합시킬 데이터의 연결 조건
    (a.employee_id = b.employee_id)
WHEN MATCHED THEN -- 조건에 일치하는 경우 타겟 테이블에 이렇게 실행해라
        UPDATE SET
            a.phone_number = b.phone_number,
            a.hire_date = b.hire_date,
            a.salary = b.salary,
            a.commission_pct = b.commission_pct,
            a.manager_id = b.manager_id,
            a.department_id = b.department_id
            
            /*
            DELETE만 단독으로 쓸 수는 없습니다.
            UPDATE 이후에 DELETE 작성이 가능합니다.
            UPDATE 된 대상을 DELETE 하도록 설계되어 있기 때문에
            삭제할 대상 컬럽들을 동일한 값으로 일단 UPDATE를 진행하고
            DELETE의 WHERE절에 아까 지정한 동일한 값을 지정해서 삭제합니다.
            */
            DELETE
                WHERE a.employee_id = b.employee_id
WHEN NOT MATCHED THEN -- 조건에 일치하지 않는 경우 타겟 테이블에 이렇게 실행해라
    INSERT /*속성(컬럼)*/ VALUES
    (b.employee_id, b.first_name, b.last_name,
    b.email, b.phone_number, b.hire_date, b.job_id,
    b.salary, b.commission_pct, b.manager_id, b.department_id);
    
--------------------------

INSERT INTO emps_it
    (employee_id, first_name, last_name, email, hire_date, job_id)
VALUES(102, '렉스', '박', 'LEXPARK', '01/04/06', 'AD_VP');
INSERT INTO emps_it
    (employee_id, first_name, last_name, email, hire_date, job_id)
VALUES(101, '니나', '최', 'NINA', '20/04/06', 'AD_VP');
INSERT INTO emps_it
    (employee_id, first_name, last_name, email, hire_date, job_id)
VALUES(103, '흥민', '손', 'HMSON', '20/04/06', 'AD_VP');

/*
employees 테이블을 매번 빈번하게 수정되는 테이블이라고 가정하자.
기존의 데이터는 email, phone, salary, comm_pct, man_id, dept_id를
업데이트 하도록 처리
새로 유입된 데이터는 그대로 추가.
*/


MERGE INTO emps_it a
    USING (SELECT * FROM employees) b
    ON (a.employee_id = b.employee_id)
WHEN MATCHED THEN
    UPDATE SET
        a.email = b.email,
        a.phone_number = b.phone_number,
        a.salary = b.salary,
        a.commission_pct = b.commission_pct,
        a.manager_id = b.manager_id,
        a.department_id = b.department_id
WHEN NOT MATCHED THEN
    INSERT VALUES(
        b.employee_id, b.first_name, b.last_name,
        b.email, b.phone_number, b.hire_date, b.job_id,
        b.salary, b.commission_pct, b.manager_id, b.department_id
    );
    
SELECT * FROM emps_it ORDER BY employee_id ASC;   

ROLLBACK;

SELECT * FROM depts;
INSERT INTO depts
VALUES 
(280,'개발',null,1800);
INSERT INTO depts
VALUES 
(290,'회계부',null,1800);
INSERT INTO depts
VALUES 
(300,'재정',301,1800);
INSERT INTO depts
VALUES 
(310,'인사',302,1800);
INSERT INTO depts
VALUES 
(320,'영업',303,1700);

UPDATE depts SET department_name = 'IT bank' WHERE department_name = 'IT Support';
UPDATE depts SET manager_id = 301 WHERE department_id = 290;
UPDATE depts SET department_name = 'IT Help', manager_id = 303, location_id=1800 WHERE department_name = 'IT Helpdesk';
UPDATE depts SET manager_id = 301 WHERE department_id IN (290,300,310,320);
SELECT * FROM depts;

DELETE FROM depts WHERE department_id=320;
DELETE FROM depts WHERE department_id=220;

DELETE FROM depts WHERE department_id>200;
UPDATE depts SET manager_id=100
WHERE manager_id IS NOT NULL;

MERGE INTO depts a
    USING departments b
    ON (a.department_id = b.department_id)
    WHEN MATCHED THEN
        UPDATE SET
            a.department_name = b.department_name,
            a.manager_id = b.manager_id,
            a.location_id = b.location_id
    WHEN NOT MATCHED THEN
        INSERT VALUES(
            b.department_id,b.department_name,b.manager_id,b.location_id
        );
            
SELECT * FROM depts;

DESC jobs;
CREATE table jobs_it as (SELECT * FROM jobs WHERE min_salary > 6000);
SELECT * FROM jobs_it;
SELECT * FROM jobs;
DROP TABLE jobs_it;

INSERT INTO jobs_it VALUES ('IT_DEV', '아이티개발팀', 6000, 20000);
INSERT INTO jobs_it VALUES ('NET_DEV', '네트워크개발팀', 5000, 20000);
INSERT INTO jobs_it VALUES ('SEC_DEV', '보안개발팀', 6000, 19000);

MERGE INTO jobs_it a
USING (SELECT * FROM jobs WHERE min_salary > 0) b
ON (a.job_id = b.job_id)
WHEN MATCHED THEN
    UPDATE SET
        a.min_salary = b.min_salary,
        a.max_salary = b.max_salary
WHEN NOT MATCHED THEN
    INSERT VALUES
        (b.job_id, b.job_title, b.min_salary, b.max_salary);
