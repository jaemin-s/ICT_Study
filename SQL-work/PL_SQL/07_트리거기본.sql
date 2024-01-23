/*
trigger는 테이블에 부차고딘 형태로써, INSERT, UPDATE, DELETE 작업이 수행될 때
특정 코드가 작도오디도록 하는 구문입니다.
VIEW에는 부착이 불가능합니다.

트리거를 만들 떄 범위 지정하고 F5버튼으로 부분실행해야 합니다.
그렇지 않으면 하나의 구문으로 인식되어 정상 동작하지 않습니다.
*/

CREATE TABLE tbl_test(
    id NUMBER(10),
    text VARCHAR2(20)
);

CREATE OR REPLACE TRIGGER trg_test
    AFTER DELETE OR UPDATE -- 트리거의 발생 시점. (삭제 or 수정 이후 동작)
    ON tbl_test -- 트리거를 부착할 테이블
    FOR EACH ROW -- 각 행에 모두 적용 (생략 가능. 생략 시 한 번만 실행)
--DECLARE -- 생략 가능
BEGIN
    dbms_output.put_line('x');    
END;

INSERT INTO tbl_test 
VALUES (1,'test');

UPDATE tbl_test SET text='test2' WHERE id=1;

DELETE FROM tbl_test WHERE id=1;