-- 전체 검색 (비교적 느린 쿼리문)
SELECT * FROM tbl_board;

-- 전체 검색 (빠른 쿼리문)
SELECT * FROM tbl_board WHERE bno > 0;

-- 실행이 느린 쿼리문 (+1 역순으로 찾기)
SELECT * FROM tbl_board ORDER BY bno + 1 DESC;

-- 실행이 빠른 쿼리문 (역순으로 찾기)
SELECT * FROM tbl_board ORDER BY bno DESC;

SELECT * FROM tbl_board ORDER BY bno asc;

-- 전체 카운트 
SELECT COUNT(*) FROM tbl_board;

----------------------------------Hint------------------------------------------

-- Oracle의 hint 사용 X (역순 정렬)
SELECT * FROM tbl_board ORDER BY bno DESC;

-- Oracle의 hint 사용 O (역순 정렬)
SELECT /*+INDEX_DESC (tbl_board pk_board) */*
FROM tbl_board;

-- Full hint
SELECT /*+ Full(tbl_board)*/ *
FROM tbl_board
ORDER BY bno DESC;

-- order by를 생략한 hint 
SELECT /*+ index_asc(tbl_board pk_board)*/ *
FROM tbl_board; -- 내림 차순
SELECT /*+ index_desc(tbl_board pk_board)*/ *
FROM tbl_board; -- 오름 차순

----------------------------------- rownum -------------------------------------

-- 가상의 테이블 rownum
SELECT ROWNUM rn, bno, title FROM tbl_board;

-- full hint
SELECT /*+full(tbl_board)*/ ROWNUM rn, bno, title 
FROM tbl_board
WHERE bno > 0
ORDER BY bno;

-- index hint 내림차순
SELECT /*+index_asc(tbl_board pk_board)*/ ROWNUM rn,bno,title
FROM tbl_board;

-- index hint 오름차순
SELECT /*+INDEX_DESC(tbl_board pk_board)*/ ROWNUM rn,bno,title
FROM tbl_board
WHERE bno > 0;

-- 페이징 처리 (10개의 페이지만)
SELECT /*+index_desc(tbl_board pk_board)*/ ROWNUM rn,bno,title,content
FROM tbl_board
WHERE ROWNUM <= 10;

-- 아무런 값이 나오지 않는다.
-- rownum은 테이블 데이터를 선택한 후 '값이 정해'지는데
-- 첫번째 rownum은 1로 정해지게 되고
-- rownum 1은 > 10의 비교군과 맞지 않으므로 무효화 된다.
-- 이후에 다시 다른 데이터를 가져와도 항상 1로 만들어지고 없어지는 과정이 반복되므로
-- SQL을 작성할 때 rownum의 조건은 반드시 1이 포함되어야 한다.
SELECT /*+index_desc(tbl_board pk_board)*/ ROWNUM rn,bno,title,content
FROM tbl_board
WHERE ROWNUM > 10 AND ROWNUM <= 20;

SELECT /*+index_desc(tbl_board pk_board)*/ ROWNUM rn, bno, title,content
FROM tbl_board
WHERE ROWNUM <= 20;

-- 2페이지를 처리하기 위한 SQL : inlien view
SELECT bno, title,content
FROM (
        SELECT /*+index_desc(tbl_board pk_board)*/ROWNUM rn, bno, title,content
        FROM tbl_board
        WHERE ROWNUM <= 30
    )
WHERE rn > 10;

SELECT bno, title, content, writer, regdate, updatedate
FROM (
        SELECT /*+index_desc(tbl_board pk_board)*/ ROWNUM rn, bno, title, content, writer,regdate, updatedate
        FROM tbl_board
        WHERE ROWNUM <= 30
    )
WHERE rn > 20;

----------------------------- 검색 기능 -------------------------------------------

-- And 연산자가 Or 연산자 보다 우선 순위가 높기 때문에 많은 량의 데이터가 검색된다.
-- rownum이 20보다 작거나 같으면서(and) 내용이나 제목에 'test'라는 문자열이 있는경우(or)
-- 로 검색이 된다.
-- And와 Or가 섞여있는 SQL을 작성할 때에는 우선 순위 연산자인 '()'를 이용햇거 or조건을 처리해야된다.
select
*
from
    (
    select /*+index_desc(tbl_board pk_board)*/ rownum rn, bno, title, content, writer, regdate, updatedate
    from tbl_board
    where title like '%Test%' or content like '%Test%' and rownum <= 20
    )
where rn > 10;    

-- 우선 순위 연산자를 사용한 검색 SQL 문
select
*
from
(
    select /*+index_desc(tbl_board pk_board)*/ rownum rn, bno, title, content, writer, regdate, updatedate
    from tbl_board
    where (title like '%Test%' or content like '%Test%') and rownum <= 20
)
where rn > 10;