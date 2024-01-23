-- 오라클의 주석

/*
여러 줄 주석
주주주주서서서서섯ㄱㄱㄱㄱ
*/
-- SELECT 컬럼명(여러개 가능) FROM 테이블
SELECT * FROM employees;

SELECT employee_id, first_name, last_name
FROM employees;

-- 칼럼을 조회하는 위치에서 * / + - 연산이 가능합니다.
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

-- 오라클은 홑따옴표로 문자를 표현하고, 문자열 안에 홑따옴표를
-- 표현하고 싶다면 두 번 연속으로 쓰면 됩니다.
-- 문장을 연결하고 싶다면 ||을 사용합니다.
SELECT
    first_name || last_name || '''s salary is $' || salary
    AS �޿�����
FROM employees;

-- DISTINCT (중복 행의 제거)
SELECT department_id FROM employees;
SELECT DISTINCT department_id FROM employees;

-- rownum, rowid
-- (**로우넘: 쿼리에 의해 반환되는 행 번호를 출력)
-- 로우아이디 : 

SELECT ROWNUM, ROWID, employee_id
FROM employees;