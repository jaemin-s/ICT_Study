-- 그룹 함수 AVG, MAX, MIN, SUM, COUNT

select
    avg(salary),
    max(salary),
    min(salary),
    sum(salary),
    count(salary)
from employees;

SELECT COUNT(*) FROM employees;
select count(first_name) from employees;
select count(commission_pct) from employees; --null이 아닌 행의 수
select count(manager_id) from employees;

-- 부서별로 그룹화, 그룹함수의 사용

select 
    department_id,
    avg(salary)
from employees
group by department_id;

-- 주의할 점
-- 그룹함수는 일반 컬럼과 동시에 그냥 출력할 수는 없습니다.
select 
    department_id,
    avg(salary)
from employees; -- 에러

-- group by절을 사용할 때 group절에 묶이지 않으면 다른 컬럼을 조회할 수 없습니다.
select 
    job_id,
    department_id,
    avg(salary)
from employees
group by department_id; -- 에러

-- group by절 2개 사용
select 
    job_id,
    department_id,
    avg(salary)
from employees
group by department_id, job_id
order by department_id;

select 
    department_id,
    avg(salary)
from employees
group by department_id
HAVING sum(salary) >= 100000;

select
    job_id,
    count(*)
from employees
group by job_id
having count(*) >= 5;

-- 부서 아이디가 50 이상인 것들을 그룹화 시키고, 그룹 월급 평균이 5000 이상만 조회
select
    department_id,
    avg(salary)
from employees
where department_id >=50
group by department_id
having avg(salary) >= 5000;

-- 집합 연산자
-- union(합집합 중복x), union all(합집합 중복o), intersect(교집합), minus(차집합)
-- 위 아래 column 개수와 데이터 타입이 정확히 일치해야 합니다.

select
    employee_id, first_name
from employees
where hire_date like '04%'
union
select
    employee_id, first_name
from employees
where department_id = 20;

select
    employee_id, first_name
from employees
where hire_date like '04%'
intersect
select
    employee_id, first_name
from employees
where department_id = 20;

select
    employee_id, first_name
from employees
where hire_date like '04%'
minus
select
    employee_id, first_name
from employees
where department_id = 20;

--문제 1.
--사원 테이블에서 JOB_ID별 사원 수를 구하세요.
--사원 테이블에서 JOB_ID별 월급의 평균을 구하세요. 월급의 평균 순으로 내림차순 정렬하세요
select
    job_id,
    count(job_id) as 사원수,
    avg(salary) as 평균월급
from employees
group by job_id
order by 평균월급 desc;


--문제 2.
--사원 테이블에서 입사 년도 별 사원 수를 구하세요.
select
    to_char(hire_date,'YY') as 입사년도,
    count(to_char(hire_date,'YY')) as 사원수
from employees
group by to_char(hire_date,'YY')
order by 입사년도 asc;

--문제 3.
--급여가 5000 이상인 사원들의 부서별 평균 급여를 출력하세요. 단 부서 평균 급여가 7000이상인 부서만 출력
select
    department_id,
    avg(salary)
from employees
where salary >= 5000
group by department_id
having avg(salary)>=7000;
--문제 4.
--사원 테이블에서 commission_pct(커미션) 컬럼이 null이 아닌 사람들의
--department_id(부서별) salary(월급)의 평균, 합계, count를 구합니다.
--조건 1) 월급의 평균은 커미션을 적용시킨 월급입니다.
--조건 2) 평균은 소수 2째 자리에서 절삭 하세요
select
    department_id,
    trunc(avg(salary+salary*commission_pct),2) as 평균월급,
    sum(salary),
    count(salary)
from employees
where commission_pct is not null
group by department_id;

select * from employees where commission_pct is not null;