/*
조인이란?
- 서로 다른 테이블간에 설정된 관계가 결합하여
1개 이상의 테이블에서 데이터를 조회하기 위해 사용합니다.
select 컬럼리스트 from 조인 대상이 되는 테이블 (1개 이상)
where 조인 조건 -> 오라클 조인
*/

-- employees 테이블의 부서 id와 일치하는 departments 테이블의 부서 id를 찾아서
-- select 이하에 있는 컬럼들을 출력하는 쿼리문

select
    first_name, -- 한쪽만 가지고 있는 컬럼은 테이블을 따로 안붙여도됨
    e.department_id, --공통 컬럼은 어느 테이블에서 꺼내올 지를 작성해야함
    department_name
from employees e, departments d
where e.department_id = d.department_id;

select
    first_name, 
    e.department_id,
    department_name
from employees e
inner join departments d
on e.department_id = d.department_id; -- ansi 표준 조인 문법

/*
각각의 테이블에 독립적으로 존재하는 컬럼의 경우에는
테이블 이름을 생략해도 무방합니다 그러나 해석의 명확성을 위해
테이블 이름을 작성해셔서 소속을 표현해 주는 것이 바람직합니다.
테이블 이름이 너무 길 시에는 alias를 작성하여 칭합니다.
두 테이블이 모두 가지고 있는 컬럼의 경우 반드시 명시해 주셔야 합니다.
*/

-- 3개의 테이블을 이용한 내부 조인 (inner join)
-- 내부 조인 : 두 테이블에서 모두 일치하는 값을 가진 행만 반환합니다.

select
    e.first_name, e.last_name, e.department_id,
    d.department_name,
    j.job_title
from employees e, departments d, jobs j
where e.department_id = d.department_id
and e.job_id = j.job_id;

select
    e.first_name, e.last_name,
    d.department_id, d.department_name,
    j.job_title,
    loc.city
from
    employees e,
    departments d,
    jobs j,
    locations loc
where
    e.department_id = d.department_id -- 4
and 
    e.job_id = j.job_id -- 3
and
    d.location_id = loc.location_id -- 2
and
    loc.state_province = 'California'; -- 1
    
/*
1. loc 테이블의 province = 'California' 조건에 맞는 값을 대상으로
2. location_id 값과 같은 값을 가지는 데이터를
    departments에서 찾아서 조인
3. 위의 결과와 동일한 department_id를 가진
    employees 테이블의 데이터를 찾아서 조인
4. 위의 결과와 jobs 테이블을 비교하여 조인하고 최종 결과를 출력    
*/

-- 외부 조인
/*
상호 테이블간에 일치되는 값으로 연결되는 내부 조인과는 다르게
어느 한 테이블에 공통 값이 없더라도 해당 row들이 조회 결과에
모두 포함되는 조인을 말합니다
*/

select
    e.first_name, e.last_name, e.hire_date, e.salary,
    d.department_id, d.department_name
from employees e, departments d, locations loc
where e.department_id = d.department_id(+)
and d.location_id = loc.location_id;

/*
    employees 테이블에는 존재하고, departments 테이블에는 존재하지 않아도
    (+)가 붙지 않은 테이블을 기준으로 하여 departments 테이블이 조인에
    참여하라는 의미를 부여하기 위해 기호를 붙입니다.
    외부 조인을 사용했더라도, 이후에 내부 조인을 사용하면
    내부조인을 우선적으로 인식합니다.
*/

/*
    외부 조인 진행 시 모든 조건에 (+)를 붙여야 외부 조인이 유지됩니다.
    일반 조건에도 (+)를 붙이지 않으면 외부 조인이 풀리는 현상이 발생. (데이터 누락)
*/
select
    e.employee_id, e.first_name,
    e.department_id,
    j.start_date, j.end_date, j.job_id
from employees e, job_history j
where e.employee_id = j.employee_id(+)
and j.department_id(+) = 80;