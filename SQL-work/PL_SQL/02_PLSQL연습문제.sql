-- 1. 구구단 중 3단을 출력하는 익명 블록을 만들어 보자. (출력문 9개를 복사해서 쓰세요)
DECLARE
    
BEGIN
    dbms_output.put_line('3*1='||3*1);
    dbms_output.put_line('3*2='||3*2);
    dbms_output.put_line('3*3='||3*3);
    dbms_output.put_line('3*4='||3*4);
    dbms_output.put_line('3*5='||3*5);
    dbms_output.put_line('3*6='||3*6);
    dbms_output.put_line('3*7='||3*7);
    dbms_output.put_line('3*8='||3*8);
    dbms_output.put_line('3*9='||3*9);

END;

-- 2. employees 테이블에서 201번 사원의 이름과 이메일 주소를 출력하는
-- 익명블록을 만들어 보자. (변수에 담아서 출력하세요.)

DECLARE
    v_name employees.first_name%TYPE;
    v_email employees.email%TYPE;
BEGIN
    SELECT
        first_name,email
    INTO
        v_name,v_email
    FROM employees
    WHERE employee_id = 201;
    dbms_output.put_line(v_name||' '||v_email);
END;
-- 3. employees 테이블에서 사원번호가 제일 큰 사원을 찾아낸 뒤 (MAX 함수 사용)
-- 이 번호 + 1번으로 아래의 사원을 emps 테이블에
-- employee_id, last_name, email, hire_date, job_id를 신규 삽입하는 익명 블록을 만드세요
-- 사원명: steven, 이메일: stevenjobs, 입사날짜: 오늘, 직업아이디: CEO

DECLARE
    max_eid employees.employee_id%type;
BEGIN
    SELECT MAX(employee_id)+1 INTO max_eid FROM employees;
    INSERT INTO emps (
        employee_id,last_name,email,hire_date,job_id
    ) VALUES (
        max_eid,'steven','stevenjobs',sysdate,'CEO'
    );
END;