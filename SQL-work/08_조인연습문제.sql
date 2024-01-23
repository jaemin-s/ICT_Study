--문제 1.
---EMPLOYEES 테이블과, DEPARTMENTS 테이블은 DEPARTMENT_ID로 연결되어 있습니다.
---EMPLOYEES, DEPARTMENTS 테이블을 엘리어스를 이용해서
--각각 INNER , LEFT OUTER, RIGHT OUTER, FULL OUTER 조인 하세요. (달라지는 행의 개수 확인)
-- INNER
SELECT
    *
FROM employees e
INNER JOIN DEPARTMENTS d
ON e.department_id = d.department_id; --106개
-- LEFT OUTER
SELECT
    *
FROM employees e
LEFT JOIN DEPARTMENTS d
ON e.department_id = d.department_id; --107개
-- RIGHT OUTER
SELECT
    *
FROM employees e
RIGHT JOIN DEPARTMENTS d
ON e.department_id = d.department_id; --122개
-- FULL OUTER
SELECT
    *
FROM employees e
FULL JOIN DEPARTMENTS d
ON e.department_id = d.department_id; --123개

--문제 2.
---EMPLOYEES, DEPARTMENTS 테이블을 INNER JOIN하세요
--조건)employee_id가 200인 사람의 이름, department_id를 출력하세요
--조건)이름 컬럼은 first_name과 last_name을 합쳐서 출력합니다

SELECT
    concat(e.first_name,e.last_name)as name, d.department_id
FROM employees e
INNER JOIN DEPARTMENTS d
ON e.department_id = d.department_id
WHERE employee_id = 200;

--문제 3.
---EMPLOYEES, JOBS테이블을 INNER JOIN하세요
--조건) 모든 사원의 이름과 직무아이디, 직무 타이틀을 출력하고, 이름 기준으로 오름차순 정렬
--HINT) 어떤 컬럼으로 서로 연결되 있는지 확인
--select * from jobs;
    
SELECT
    e.first_name, e.job_id, j.job_title
FROM employees e
INNER JOIN jobs j
ON e.job_id = j.job_id
ORDER BY e.first_name ASC;

--문제 4.
----JOBS테이블과 JOB_HISTORY테이블을 LEFT_OUTER JOIN 하세요.
--select * from job_history;

SELECT
    *
FROM jobs j
LEFT JOIN job_history h
ON j.job_id = h.job_id;

--문제 5.
----Steven King의 부서명을 출력하세요.
--select * from departments;
SELECT
    e.first_name||' '||e.last_name as name, d.department_name     
FROM employees e
INNER JOIN departments d
ON e.department_id = d.department_id
where first_name = 'Steven'
and last_name = 'King';

--문제 6.
----EMPLOYEES 테이블과 DEPARTMENTS 테이블을 Cartesian Product(Cross join)처리하세요
SELECT
    *
FROM employees e
CROSS JOIN departments d;

--문제 7.
--EMPLOYEES 테이블과 DEPARTMENTS 테이블의 부서번호를 조인하고 SA_MAN 사원만의 사원번호, 이름, 
--급여, 부서명, 근무지를 출력하세요. (Alias를 사용)
select * from locations;
SELECT
    e.employee_id, e.first_name, e.salary, d.department_name, loc.city 
FROM employees e
JOIN departments d
ON e.department_id = d.department_id
JOIN locations loc
ON d.location_id = loc.location_id
WHERE e.job_id = 'SA_MAN';

--문제 8.
-- employees, jobs 테이블을 조인 지정하고 job_title이 'Stock Manager', 'Stock Clerk'인 직원 정보만
--출력하세요.
select * from jobs;
SELECT
    *
FROM employees e
JOIN jobs j
ON e.job_id=j.job_id
--WHERE j.job_title='Stock Manager'
--OR j.job_title='Stock Clerk';
WHERE j.job_title IN('Stock Manager','Stock Clerk');

--문제 9.
-- departments 테이블에서 직원이 없는 부서를 찾아 출력하세요. LEFT OUTER JOIN 사용
select * from departments;
SELECT
    d.department_name
FROM departments d
LEFT JOIN employees e
ON d.department_id=e.department_id
where e.first_name is null;

--문제 10. 
---join을 이용해서 사원의 이름과 그 사원의 매니저 이름을 출력하세요
--힌트) EMPLOYEES 테이블과 EMPLOYEES 테이블을 조인하세요.
select * from employees;
select
    e1.first_name||' '||e1.last_name as employee_name,
    e2.first_name||' '||e2.last_name as manager_name
from employees e1
inner join employees e2
on e1.manager_id=e2.employee_id;



--문제 11. 
--6. EMPLOYEES 테이블에서 left join하여 관리자(매니저)와, 매니저의 이름, 매니저의 급여 까지 출력하세요
--매니저 아이디가 없는 사람은 배제하고 급여는 역순으로 출력하세요
select * from employees;
SELECT
    e1.first_name||' '||e1.last_name as employee_name, e1.manager_id,
    e2.first_name||' '||e2.last_name as manager_name, e2.salary as manager_salary
FROM employees e1
LEFT JOIN employees e2
ON e1.manager_id = e2.employee_id
WHERE e1.manager_id is not null
ORDER BY e2.salary DESC;