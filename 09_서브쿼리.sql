/*
    서브쿼리
    
    - 서브쿼리의 사용방법은 () 안에 명시함.
    서브쿼리절의 리턴행이 1줄 이하여야 합니다.
    - 서브쿼리 절에는 비교할 대상이 하나 반드시 들어가야합니다.
    - 해석할 대는 서브쿼리절 부터 먼저 해석하면 됩니다.
*/

-- 'Nancy'의 급여보다 급여가 많은 사람을 검색하는 문장.
SELECT salary FROM employees WHERE first_name = 'Nancy';

SELECT * FROM employees
WHERE salary > (SELECT salary 
                FROM employees 
                WHERE first_name = 'Nancy');
                
-- employee_id 103번인 사람과 job_id가 동일한 사람을 검색하는 문장.
SELECT job_id FROM employees WHERE employee_id = 103;

SELECT * 
FROM employees
WHERE job_id = 
    (SELECT job_id FROM employees WHERE employee_id = 103);

SELECT * 
FROM employees
WHERE job_id = 
    (SELECT job_id FROM employees WHERE job_id = 'IT_PROG');    -- 서브쿼리의 결과는 한줄이여야됨