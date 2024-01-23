/*
프로시저명 guguProc
구구단 을 전달받아 해당 단수를 출력하는 procedure을 생성하세요. 
*/
CREATE OR REPLACE PROCEDURE gugu_proc(
    dan IN NUMBER)
IS
BEGIN
    FOR hang IN 2..9
    LOOP
        dbms_output.put_line(dan||'x'||hang||'='||dan*hang);    
    END LOOP;
END;

EXEC gugu_proc(5);

/*
부서번호, 부서명, 작업 flag(I: insert, U:update, D:delete)을 매개변수로 받아 
depts 테이블에 
각각 INSERT, UPDATE, DELETE 하는 depts_proc 란 이름의 프로시저를 만들어보자.
그리고 정상종료라면 commit, 예외라면 롤백 처리하도록 처리하세요.
*/
SELECT * FROM depts;
ALTER TABLE depts ADD CONSTRAINT dept_id_pk PRIMARY KEY(department_id);

CREATE OR REPLACE PROCEDURE depts_proc(
    p_id IN depts.department_id%type,
    p_name IN depts.department_name%type,
    p_opper IN VARCHAR2)
IS
    cnt NUMBER;
BEGIN
    SELECT count(*) INTO cnt FROM depts WHERE department_id = p_id;
    
    
    IF p_opper = 'I' THEN
        INSERT INTO depts (department_id,department_name)
        VALUES (p_id,p_name);
    ELSIF p_opper = 'U' THEN
        IF cnt= 0 THEN
            dbms_output.put_line(0/0);
        END IF;
        UPDATE depts SET
            department_name = p_name
        WHERE department_id = p_id;
    ELSIF p_opper = 'D' THEN
        IF cnt= 0 THEN
            dbms_output.put_line(0/0);
        END IF;
        DELETE FROM depts WHERE department_id = p_id;
    ELSE
        dbms_output.put_line('잘못된 입력값 입니다.');
        RETURN;
    END IF;
    dbms_output.put_line('작업 끝');
    COMMIT;
EXCEPTION
    WHEN OTHERS THEN 
        dbms_output.put_line('예외발생');
        ROLLBACK;
END;

EXEC depts_proc(500,'test','I');
SELECT * FROM depts;

UPDATE depts SET
            department_name = 567534565
        WHERE department_id = 'sadfsadfsa';
/*
employee_id를 입력받아 employees에 존재하면,
근속년수를 out하는 프로시저를 작성하세요. (익명블록에서 프로시저를 실행)
없다면 exception처리하세요
*/


CREATE OR REPLACE PROCEDURE show_y(
    p_id IN employees.employee_id%type,
    p_years OUT NUMBER
    )
IS
BEGIN
    SELECT TRUNC((sysdate-hire_date)/365) INTO p_years FROM employees WHERE employee_id = p_id;
EXCEPTION
    WHEN OTHERS THEN
    dbms_output.put_line('예외 발생');
END;

DECLARE
    rs number;
BEGIN
    show_y(200,rs);
    dbms_output.put_line(rs);
END;

/*
프로시저명 - new_emp_proc
employees 테이블의 복사 테이블 emps를 생성합니다.
employee_id, last_name, email, hire_date, job_id를 입력받아
존재하면 이름, 이메일, 입사일, 직업을 update, 
없다면 insert하는 merge문을 작성하세요

머지를 할 타겟 테이블 -> emps
병합시킬 데이터 -> 프로시저로 전달받은 employee_id를 dual에 select 때려서 비교.
*/

CREATE OR REPLACE PROCEDURE new_emp_proc(
    p_id IN emps.employee_id%type,
    p_last_name IN emps.last_name%type,
    p_email IN emps.email%type,
    p_hire_date IN emps.hire_date%type,
    p_job_id IN emps.job_id%type
)
IS
BEGIN
    MERGE INTO emps e
    USING 
        (SELECT 
            p_id as employee_id
        FROM dual)
    ON (e.employee_id = p_id)
    WHEN MATCHED THEN
        UPDATE SET
            e.last_name = p_last_name,
            e.email = p_email,
            e.hire_date = p_hire_date,
            e.job_id = p_job_id
    WHEN NOT MATCHED THEN
        INSERT (employee_id,last_name,email,hire_date,job_id)
        VALUES (p_id,p_last_name,p_email,p_hire_date,p_job_id);
END;

EXEC new_emp_proc(2,'이','네이버',sysdate,'test');

SELECT * FROM emps;
