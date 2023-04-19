
SELECT * FROM emps;

INSERT INTO emps(employee_id, last_name, email, hire_date, job_id)
Values (303,'kim','abc1234@naver.com',sysdate,1800);

-- 보류중인 모든 데이터 변경사항을 취소, 직전 커밋 단계로 회귀(돌아가기) 및 트랜잭션 종료
-- DML만 ROLLBACK의 대상이고 ,DDL은 사용시 즉시 커밋됨
ROLLBACK;

-- 세이브포인트 생성
-- 롤백할 포인트를 직접 이름을 붙여서 지정.
-- ANSI 표준 문법이 아니기 때문에 그렣게 권장하지는 않음.

INSERT INTO emps(employee_id, last_name, email, hire_date, job_id)
Values (304,'lee','lee1234@gmail.com',sysdate,1800);

SAVEPOINT insert_park;

INSERT INTO emps(employee_id, last_name, email, hire_date, job_id)
Values (305,'park','park4321@gmail.com',sysdate,1800);

ROLLBACK TO SAVEPOINT insert_park;

-- 오토커밋 여부 확인
SHOW AUTOCOMMIT;
-- 오토커밋 온
SET AUTOCOMMIT ON;
-- 오토커밋 오프
SET AUTOCOMMIT OFF;

DELETE FROM emps WHERE employee_id = 304;



-- 보류중인 모든 데이터 변경사항을 영구적으로 적용하면서 트랜잭션 종료
-- 커밋한 이후에는 어떠한 방법을 사용하더라도 되돌릴 수 없습니다.
COMMIT;

