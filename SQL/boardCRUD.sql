-- 전체 검색 (비교적 느린 쿼리문)
select * from tbl_board;

-- 전체 검색 (빠른 쿼리문)
select * from tbl_board where bno > 0;

-- 실행이 느린 쿼리문 (+1 역순으로 찾기)
select * from tbl_board order by bno + 1 desc;

-- 실행이 빠른 쿼리문 (역순으로 찾기)
select * from tbl_board order by bno desc;

----------------------------------Hint------------------------------------------

-- Oracle의 hint 사용 X (역순 정렬)
select * from tbl_board order by bno desc;

-- Oracle의 hint 사용 O (역순 정렬)
select /*+INDEX_DESC (tbl_board pk_board) */*
from tbl_board;

-- Full hint
select /*+ Full(tbl_board)*/ * from tbl_board order by bno desc;

-- order by를 생략한 hint 
select /*+ index_asc(tbl_board pk_board)*/ * from tbl_board; -- 내림 차순
select /*+ index_desc(tbl_board pk_board)*/ * from tbl_board; -- 오름 차순

----------------------------------- rownum -------------------------------------

-- 가상의 테이블 rownum
select rownum rn, bno, title from tbl_board;

-- full hint
select /*+full(tbl_board)*/ rownum rn, bno, title from tbl_board where bno >0
order by bno;

-- index hint 내림차순
select /*+index_asc(tbl_board pk_board)*/ rownum rn, bno, title from tbl_board;

-- index hint 오름차순
select /*+INDEX_DESC(tbl_board pk_board)*/ rownum rn, bno, title from tbl_board where bno > 0;

-- 페이징 처리 (10개의 페이지만)
select /*+index_desc(tbl_board pk_board)*/ rownum rn, bno, title, content from tbl_board where rownum <=10;

-- 아무런 값이 나오지 않는다.
-- rownum은 테이블 데이터를 선택한 후 '값이 정해'지는데
-- 첫번째 rownum은 1로 정해지게 되고
-- rownum 1은 > 10의 비교군과 맞지 않으므로 무효화 된다.
-- 이후에 다시 다른 데이터를 가져와도 항상 1로 만들어지고 없어지는 과정이 반복되므로
-- SQL을 작성할 때 rownum의 조건은 반드시 1이 포함되어야 한다.
select /*+index_desc(tbl_board pk_board)*/ rownum rn, bno, title, content from tbl_board where rownum > 10 and rownum <=20;
select /*+index_desc(tbl_board pk_board)*/ rownum rn, bno, title, content from tbl_board where rownum <=20;

-- 2페이지를 처리하기 위한 SQL : inlien view
select bno, title, content
from ( select /*+index_desc(tbl_board pk_board)*/ 
       rownum rn, bno, title, content 
       from tbl_board 
       where rownum <= 20 )
where rn > 10;       