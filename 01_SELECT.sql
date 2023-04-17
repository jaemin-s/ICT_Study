-- ����Ŭ�� �ּ�

/*
���� �� �ּ�
�������ּ�����������������
*/
-- SELECT �÷���(������ ����) FROM ���̺�
SELECT * FROM employees;

SELECT employee_id, first_name, last_name
FROM employees;

-- Į���� ��ȸ�ϴ� ��ġ���� * / + - ������ �����մϴ�.
SELECT
    first_name,
    last_name,
    salary,
    salary + salary*0.1
FROM
    employees;
    
SELECT
    first_name as �̸�
FROM employees;

-- ����Ŭ�� Ȭ����ǥ�� ���ڸ� ǥ���ϰ�, ���ڿ� �ȿ� Ȭ����ǥ��
-- ǥ���ϰ� �ʹٸ� �� �� �������� ���� �˴ϴ�.
-- ������ �����ϰ� �ʹٸ� ||�� ����մϴ�.

SELECT
    first_name || last_name || '''s salary is $' || salary
    AS �޿�����
FROM employees;

-- DISTINCT (�ߺ� ���� ����)
SELECT department_id FROM employees;
SELECT DISTINCT department_id FROM employees;

-- rownum, rowid
-- (**�ο��: ������ ���� ��ȯ�Ǵ� �� ��ȣ�� ���)
-- �ο���̵� : 

SELECT ROWNUM, ROWID, employee_id
FROM employees;