-- 이너(내부) 조인
select
    *
from info i
inner join auth a
on i.auth_id = a.auth_id;

select
    *
from info i
join auth a -- inner 생략 가능
on i.auth_id = a.auth_id;

-- 오라클 문법 (잘 안씀)
select
    *
from info i, auth a
where i.auth_id = a.auth_id; 



select
    i.auth_id, i.title, i.content, a.name
from info i
inner join auth a
on i.auth_id = a.auth_id;

-- 필요한 데이터만 조회하겠다! 라고 한다면
-- where 구문을 통해 일반 조건을 걸어 주시면 됩니다.
select
    i.auth_id, i.title, i.content, a.name
from info i
inner join auth a
on i.auth_id = a.auth_id
where a.name = '이순신';

-- 아우터(외부) 조인
select 
    *
from info i left outer join auth a
on i.auth_id = a.auth_id;

select 
    *
from info i left join auth a -- join에 left or right를 붙이면 outer 생략 가능
on i.auth_id = a.auth_id;

-- 좌측 테이블과 우측 테이블 데이터를 모두 읽어 중복된 데이터는 삭제되는 외부 조인
select *
from info i full join auth a
on i.auth_id = a.auth_id;

-- cross join은 join조건을 설정하지 않기 대문에
-- 단순히 모든 컬럼에 대해 join을 진행합니다.
-- 실제로는 거의 사용하지 않습니다.
select * from info
cross join auth
order by id asc;

-- 여러 개 테이블 조인 -> 키 값만 찾아서 구문을 연결해서 쓰시면 됩니다.
select
    *
from employees e
left join departments d on e.department_id = d.department_id
left join locations loc on d.location_id = loc.location_id;

/*
- 테이블 별칭 a, i를 이용하여 left outer join 사용
- info, auth 테이블 사용
- job 컬럼이 scientist인 사람의 id,title,content,job을 출력
*/
select
    i.title,i.content,
    i.id,a.job
from auth a
left join info i
on i.auth_id = a.auth_id
where a.job = 'scientist';

-- 셀프 조인이란 동일 테이블 사이의 조인을 말합니다.
-- 동일 테이블 컬럼을 통해 기존에 존재하는 값을 매칭시켜 가져올  사용합니다.
select
    e1.employee_id, e1.first_name, e1.manager_id,
    e2.first_name, e2.employee_id
from employees e1
join employees e2
on e1.manager_id = e2.employee_id;