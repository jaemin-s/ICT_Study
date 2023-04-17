/*
�����̶�?
- ���� �ٸ� ���̺��� ������ ���谡 �����Ͽ�
1�� �̻��� ���̺��� �����͸� ��ȸ�ϱ� ���� ����մϴ�.

select �÷�����Ʈ from ���� ����� �Ǵ� ���̺� (1�� �̻�)
where ���� ���� -> ����Ŭ ����
*/

-- employees ���̺��� �μ� id�� ��ġ�ϴ� departments ���̺��� �μ� id�� ã�Ƽ�
-- select ���Ͽ� �ִ� �÷����� ����ϴ� ������

select
    first_name, -- ���ʸ� ������ �ִ� �÷��� ���̺��� ���� �Ⱥٿ�����
    e.department_id, --���� �÷��� ��� ���̺��� ������ ���� �ۼ��ؾ���
    department_name
from employees e, departments d
where e.department_id = d.department_id;

select
    first_name, 
    e.department_id,
    department_name
from employees e
inner join departments d
on e.department_id = d.department_id; -- ansi ǥ�� ���� ����

/*
������ ���̺� ���������� �����ϴ� �÷��� ��쿡��
���̺� �̸��� �����ص� �����մϴ� �׷��� �ؼ��� ��Ȯ���� ����
���̺� �̸��� �ۼ��ؼż� �Ҽ��� ǥ���� �ִ� ���� �ٶ����մϴ�.
���̺� �̸��� �ʹ� �� �ÿ��� alias�� �ۼ��Ͽ� Ī�մϴ�.
�� ���̺��� ��� ������ �ִ� �÷��� ��� �ݵ�� ����� �ּž� �մϴ�.

*/

-- 3���� ���̺��� �̿��� ���� ���� (inner join)
-- ���� ���� : �� ���̺��� ��� ��ġ�ϴ� ���� ���� �ุ ��ȯ�մϴ�.

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
1. loc ���̺��� province = 'California' ���ǿ� �´� ���� �������
2. location_id ���� ���� ���� ������ �����͸�
    departments���� ã�Ƽ� ����
3. ���� ����� ������ department_id�� ����
    employees ���̺��� �����͸� ã�Ƽ� ����
4. ���� ����� jobs ���̺��� ���Ͽ� �����ϰ� ���� ����� ���    
*/

-- �ܺ� ����
/*
��ȣ ���̺��� ��ġ�Ǵ� ������ ����Ǵ� ���� ���ΰ��� �ٸ���
��� �� ���̺� ���� ���� ������ �ش� row���� ��ȸ �����
��� ���ԵǴ� ������ ���մϴ�
*/

select
    e.first_name, e.last_name, e.hire_date, e.salary,
    d.department_id, d.department_name
from employees e, departments d, locations loc
where e.department_id = d.department_id(+)
and d.location_id = loc.location_id;

/*
    employees ���̺��� �����ϰ�, departments ���̺��� �������� �ʾƵ�
    (+)�� ���� ���� ���̺��� �������� �Ͽ� departments ���̺��� ���ο�
    �����϶�� �ǹ̸� �ο��ϱ� ���� ��ȣ�� ���Դϴ�.
    �ܺ� ������ ����ߴ���, ���Ŀ� ���� ������ ����ϸ�
    ���������� �켱������ �ν��մϴ�.
*/

/*
    �ܺ� ���� ���� �� ��� ���ǿ� (+)�� �ٿ��� �ܺ� ������ �����˴ϴ�.
    �Ϲ� ���ǿ��� (+)�� ������ ������ �ܺ� ������ Ǯ���� ������ �߻�. (������ ����)
*/
select
    e.employee_id, e.first_name,
    e.department_id,
    j.start_date, j.end_date, j.job_id
from employees e, job_history j
where e.employee_id = j.employee_id(+)
and j.department_id(+) = 80;


