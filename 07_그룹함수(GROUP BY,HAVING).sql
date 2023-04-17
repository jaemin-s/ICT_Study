-- �׷� �Լ� AVG, MAX, MIN, SUM, COUNT

select
    avg(salary),
    max(salary),
    min(salary),
    sum(salary),
    count(salary)
from employees;

SELECT COUNT(*) FROM employees;
select count(first_name) from employees;
select count(commission_pct) from employees; --null�� �ƴ� ���� ��
select count(manager_id) from employees;

-- �μ����� �׷�ȭ, �׷��Լ��� ���

select 
    department_id,
    avg(salary)
from employees
group by department_id;

-- ������ ��
-- �׷��Լ��� �Ϲ� �÷��� ���ÿ� �׳� ����� ���� �����ϴ�.
select 
    department_id,
    avg(salary)
from employees; -- ����

-- group by���� ����� �� group���� ������ ������ �ٸ� �÷��� ��ȸ�� �� �����ϴ�.
select 
    job_id,
    department_id,
    avg(salary)
from employees
group by department_id; -- ����

-- group by�� 2�� ���
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

-- �μ� ���̵� 50 �̻��� �͵��� �׷�ȭ ��Ű��, �׷� ���� ����� 5000 �̻� ��ȸ
select
    department_id,
    avg(salary)
from employees
where department_id >=50
group by department_id
having avg(salary) >= 5000;

-- ���� ������
-- union(������ �ߺ�x), union all(������ �ߺ�o), intersect(������), minus(������)
-- �� �Ʒ� column ������ ������ Ÿ���� ��Ȯ�� ��ġ�ؾ� �մϴ�.

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

--���� 1.
--��� ���̺��� JOB_ID�� ��� ���� ���ϼ���.
--��� ���̺��� JOB_ID�� ������ ����� ���ϼ���. ������ ��� ������ �������� �����ϼ���
select
    job_id,
    count(job_id) as �����,
    avg(salary) as ��տ���
from employees
group by job_id
order by ��տ��� desc;


--���� 2.
--��� ���̺��� �Ի� �⵵ �� ��� ���� ���ϼ���.
select
    to_char(hire_date,'YY') as �Ի�⵵,
    count(to_char(hire_date,'YY')) as �����
from employees
group by to_char(hire_date,'YY')
order by �Ի�⵵ asc;

--���� 3.
--�޿��� 5000 �̻��� ������� �μ��� ��� �޿��� ����ϼ���. �� �μ� ��� �޿��� 7000�̻��� �μ��� ���
select
    department_id,
    avg(salary)
from employees
where salary >= 5000
group by department_id
having avg(salary)>=7000;
--���� 4.
--��� ���̺��� commission_pct(Ŀ�̼�) �÷��� null�� �ƴ� �������
--department_id(�μ���) salary(����)�� ���, �հ�, count�� ���մϴ�.
--���� 1) ������ ����� Ŀ�̼��� �����Ų �����Դϴ�.
--���� 2) ����� �Ҽ� 2° �ڸ����� ���� �ϼ���
select
    department_id,
    trunc(avg(salary+salary*commission_pct),2) as ��տ���,
    sum(salary),
    count(salary)
from employees
where commission_pct is not null
group by department_id;

select * from employees where commission_pct is not null;