--���� 1.
---EMPLOYEES ���̺��, DEPARTMENTS ���̺��� DEPARTMENT_ID�� ����Ǿ� �ֽ��ϴ�.
---EMPLOYEES, DEPARTMENTS ���̺��� ������� �̿��ؼ�
--���� INNER , LEFT OUTER, RIGHT OUTER, FULL OUTER ���� �ϼ���. (�޶����� ���� ���� Ȯ��)
-- INNER
SELECT
    *
FROM employees e
INNER JOIN DEPARTMENTS d
ON e.department_id = d.department_id; --106��
-- LEFT OUTER
SELECT
    *
FROM employees e
LEFT JOIN DEPARTMENTS d
ON e.department_id = d.department_id; --107��
-- RIGHT OUTER
SELECT
    *
FROM employees e
RIGHT JOIN DEPARTMENTS d
ON e.department_id = d.department_id; --122��
-- FULL OUTER
SELECT
    *
FROM employees e
FULL JOIN DEPARTMENTS d
ON e.department_id = d.department_id; --123��

--���� 2.
---EMPLOYEES, DEPARTMENTS ���̺��� INNER JOIN�ϼ���
--����)employee_id�� 200�� ����� �̸�, department_id�� ����ϼ���
--����)�̸� �÷��� first_name�� last_name�� ���ļ� ����մϴ�

SELECT
    concat(e.first_name,e.last_name)as name, d.department_id
FROM employees e
INNER JOIN DEPARTMENTS d
ON e.department_id = d.department_id
WHERE employee_id = 200;

--���� 3.
---EMPLOYEES, JOBS���̺��� INNER JOIN�ϼ���
--����) ��� ����� �̸��� �������̵�, ���� Ÿ��Ʋ�� ����ϰ�, �̸� �������� �������� ����
--HINT) � �÷����� ���� ����� �ִ��� Ȯ��
--select * from jobs;
    
SELECT
    e.first_name, e.job_id, j.job_title
FROM employees e
INNER JOIN jobs j
ON e.job_id = j.job_id
ORDER BY e.first_name ASC;

--���� 4.
----JOBS���̺�� JOB_HISTORY���̺��� LEFT_OUTER JOIN �ϼ���.
--select * from job_history;

SELECT
    *
FROM jobs j
LEFT JOIN job_history h
ON j.job_id = h.job_id;

--���� 5.
----Steven King�� �μ����� ����ϼ���.
--select * from departments;
SELECT
    e.first_name||' '||e.last_name as name, d.department_name     
FROM employees e
INNER JOIN departments d
ON e.department_id = d.department_id
where first_name = 'Steven'
and last_name = 'King';

--���� 6.
----EMPLOYEES ���̺�� DEPARTMENTS ���̺��� Cartesian Product(Cross join)ó���ϼ���
SELECT
    *
FROM employees e
CROSS JOIN departments d;

--���� 7.
--EMPLOYEES ���̺�� DEPARTMENTS ���̺��� �μ���ȣ�� �����ϰ� SA_MAN ������� �����ȣ, �̸�, 
--�޿�, �μ���, �ٹ����� ����ϼ���. (Alias�� ���)
select * from locations;
SELECT
    e.employee_id, e.first_name, e.salary, d.department_name, loc.city 
FROM employees e
JOIN departments d
ON e.department_id = d.department_id
JOIN locations loc
ON d.location_id = loc.location_id
WHERE e.job_id = 'SA_MAN';

--���� 8.
-- employees, jobs ���̺��� ���� �����ϰ� job_title�� 'Stock Manager', 'Stock Clerk'�� ���� ������
--����ϼ���.
select * from jobs;
SELECT
    *
FROM employees e
JOIN jobs j
ON e.job_id=j.job_id
--WHERE j.job_title='Stock Manager'
--OR j.job_title='Stock Clerk';
WHERE j.job_title IN('Stock Manager','Stock Clerk');

--���� 9.
-- departments ���̺��� ������ ���� �μ��� ã�� ����ϼ���. LEFT OUTER JOIN ���
select * from departments;
SELECT
    d.department_name
FROM departments d
LEFT JOIN employees e
ON d.department_id=e.department_id
where e.first_name is null;

--���� 10. 
---join�� �̿��ؼ� ����� �̸��� �� ����� �Ŵ��� �̸��� ����ϼ���
--��Ʈ) EMPLOYEES ���̺�� EMPLOYEES ���̺��� �����ϼ���.
select * from employees;
select
    e1.first_name||' '||e1.last_name as employee_name,
    e2.first_name||' '||e2.last_name as manager_name
from employees e1
inner join employees e2
on e1.manager_id=e2.employee_id;



--���� 11. 
--6. EMPLOYEES ���̺��� left join�Ͽ� ������(�Ŵ���)��, �Ŵ����� �̸�, �Ŵ����� �޿� ���� ����ϼ���
--�Ŵ��� ���̵� ���� ����� �����ϰ� �޿��� �������� ����ϼ���
select * from employees;
SELECT
    e1.first_name||' '||e1.last_name as employee_name, e1.manager_id,
    e2.first_name||' '||e2.last_name as manager_name, e2.salary as manager_salary
FROM employees e1
LEFT JOIN employees e2
ON e1.manager_id = e2.employee_id
WHERE e1.manager_id is not null
ORDER BY e2.salary DESC;