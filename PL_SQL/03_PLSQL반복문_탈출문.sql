--WHILE문

DECLARE
    v_num NUMBER := 3;
    v_count NUMBER := 1;
BEGIN
    WHILE v_count <=10
    LOOP
        dbms_output.put_line(v_num);
        v_count := v_count+1;
    END LOOP;
END;

-- 탈출문
DECLARE
    v_num NUMBER := 3;
    v_count NUMBER := 1;
BEGIN
    WHILE v_count <=10
    LOOP
        dbms_output.put_line(v_num);
        EXIT WHEN v_count = 5;
        v_count := v_count+1;
    END LOOP;
END;

-- FOR문
DECLARE
    v_num NUMBER := 3;
BEGIN
    FOR i IN 1..9 -- start..end 범위 표현
    LOOP
        dbms_output.put_line(v_num||'x'||i||'='||v_num*i);
    END LOOP;
END;

-- CONTINUE문
DECLARE
    v_num NUMBER := 3;
BEGIN
    FOR i IN 1..9 -- start..end 범위 표현
    LOOP
        CONTINUE WHEN i = 5;
        dbms_output.put_line(v_num||'x'||i||'='||v_num*i);
    END LOOP;
END;

-- 1. 모둔 구구단(2~9단)을 출력하는 익명 블록을 만드세요.
BEGIN
    FOR i IN 2..9
    LOOP
        FOR j IN 1..9
        LOOP
            dbms_output.put_line(i||'x'||j||'='||i*j);
        END LOOP;
        dbms_output.put_line('-------');
    END LOOP;
END;

-- 2. INSERT를 300번 실행하는 익병 블록을 처리하세요.
-- board라는 이름의 테이블을 만드세요. (bno, writer, title 컬럼이 존재합니다.)
-- bno는 SEQUENCE로 올려주고, writer와 title에 번호를 붙여서 INSERT 진행해 주세요
-- ex) 1, test1, title1 >> 2, test2, title2 >> 3, test3, title3...
CREATE TABLE board (
    bno NUMBER(3) PRIMARY KEY,
    writer VARCHAR2(50),
    title VARCHAR2(50)
);

CREATE SEQUENCE board_bno_seq 
    START WITH 1
    MAXVALUE 999
    NOCYCLE;
DROP SEQUENCE board_bno_seq;
BEGIN
    WHILE 1=1
    LOOP 
    INSERT INTO board
    VALUES (board_bno_seq.NEXTVAL,'test'||TO_CHAR(board_bno_seq.NEXTVAL),'title'||TO_CHAR(board_bno_seq.NEXTVAL));
    EXIT WHEN board_bno_seq.CURRVAL >= 300;
    END LOOP;
END;
DELETE FROM board;

SELECT * FROM board ORDER BY bno;