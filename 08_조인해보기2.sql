-- �̳�(����) ����
select
    *
from info i
inner join auth a
on i.auth_id = a.auth_id;

select
    *
from info i
join auth a -- inner ���� ����
on i.auth_id = a.auth_id;

-- ����Ŭ ���� (�� �Ⱦ�)
select
    *
from info i, auth a
where i.auth_id = a.auth_id; 



select
    i.auth_id, i.title, i.content, a.name
from info i
inner join auth a
on i.auth_id = a.auth_id;

-- �ʿ��� �����͸� ��ȸ�ϰڴ�! ��� �Ѵٸ�
-- where ������ ���� �Ϲ� ������ �ɾ� �ֽø� �˴ϴ�.
select
    i.auth_id, i.title, i.content, a.name
from info i
inner join auth a
on i.auth_id = a.auth_id
where a.name = '�̼���';

-- �ƿ���(�ܺ�) ����
select 
    *
from info i left outer join auth a
on i.auth_id = a.auth_id;

select 
    *
from info i left join auth a -- join�� left or right�� ���̸� outer ���� ����
on i.auth_id = a.auth_id;

-- ���� ���̺�� ���� ���̺� �����͸� ��� �о� �ߺ��� �����ʹ� �����Ǵ� �ܺ� ����
select *
from info i full join auth a
on i.auth_id = a.auth_id;

-- cross join�� join������ �������� �ʱ� �빮��
-- �ܼ��� ��� �÷��� ���� join�� �����մϴ�.
-- �����δ� ���� ������� �ʽ��ϴ�.
select * from info
cross join auth
order by id asc;

-- ���� �� ���̺� ���� -> Ű ���� ã�Ƽ� ������ �����ؼ� ���ø� �˴ϴ�.
select
    *
from employees e
left join departments d on e.department_id = d.department_id
left join locations loc on d.location_id = loc.location_id;

/*
- ���̺� ��Ī a, i�� �̿��Ͽ� left outer join ���
- info, auth ���̺� ���
- job �÷��� scientist�� ����� id,title,content,job�� ���
*/
select
    i.title,i.content,
    i.id,a.job
from auth a
left join info i
on i.auth_id = a.auth_id
where a.job = 'scientist';

-- ���� �����̶� ���� ���̺� ������ ������ ���մϴ�.
-- ���� ���̺� �÷��� ���� ������ �����ϴ� ���� ��Ī���� ������ �� ����մϴ�.
select
    e1.employee_id, e1.first_name, e1.manager_id,
    e2.first_name, e2.employee_id
from employees e1
join employees e2
on e1.manager_id = e2.employee_id;