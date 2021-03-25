-- ��ü �˻� (���� ���� ������)
SELECT * FROM tbl_board;

-- ��ü �˻� (���� ������)
SELECT * FROM tbl_board WHERE bno > 0;

-- ������ ���� ������ (+1 �������� ã��)
SELECT * FROM tbl_board ORDER BY bno + 1 DESC;

-- ������ ���� ������ (�������� ã��)
SELECT * FROM tbl_board ORDER BY bno DESC;

SELECT * FROM tbl_board ORDER BY bno asc;

-- ��ü ī��Ʈ 
SELECT COUNT(*) FROM tbl_board;

----------------------------------Hint------------------------------------------

-- Oracle�� hint ��� X (���� ����)
SELECT * FROM tbl_board ORDER BY bno DESC;

-- Oracle�� hint ��� O (���� ����)
SELECT /*+INDEX_DESC (tbl_board pk_board) */*
FROM tbl_board;

-- Full hint
SELECT /*+ Full(tbl_board)*/ *
FROM tbl_board
ORDER BY bno DESC;

-- order by�� ������ hint 
SELECT /*+ index_asc(tbl_board pk_board)*/ *
FROM tbl_board; -- ���� ����
SELECT /*+ index_desc(tbl_board pk_board)*/ *
FROM tbl_board; -- ���� ����

----------------------------------- rownum -------------------------------------

-- ������ ���̺� rownum
SELECT ROWNUM rn, bno, title FROM tbl_board;

-- full hint
SELECT /*+full(tbl_board)*/ ROWNUM rn, bno, title 
FROM tbl_board
WHERE bno > 0
ORDER BY bno;

-- index hint ��������
SELECT /*+index_asc(tbl_board pk_board)*/ ROWNUM rn,bno,title
FROM tbl_board;

-- index hint ��������
SELECT /*+INDEX_DESC(tbl_board pk_board)*/ ROWNUM rn,bno,title
FROM tbl_board
WHERE bno > 0;

-- ����¡ ó�� (10���� ��������)
SELECT /*+index_desc(tbl_board pk_board)*/ ROWNUM rn,bno,title,content
FROM tbl_board
WHERE ROWNUM <= 10;

-- �ƹ��� ���� ������ �ʴ´�.
-- rownum�� ���̺� �����͸� ������ �� '���� ����'���µ�
-- ù��° rownum�� 1�� �������� �ǰ�
-- rownum 1�� > 10�� �񱳱��� ���� �����Ƿ� ��ȿȭ �ȴ�.
-- ���Ŀ� �ٽ� �ٸ� �����͸� �����͵� �׻� 1�� ��������� �������� ������ �ݺ��ǹǷ�
-- SQL�� �ۼ��� �� rownum�� ������ �ݵ�� 1�� ���ԵǾ�� �Ѵ�.
SELECT /*+index_desc(tbl_board pk_board)*/ ROWNUM rn,bno,title,content
FROM tbl_board
WHERE ROWNUM > 10 AND ROWNUM <= 20;

SELECT /*+index_desc(tbl_board pk_board)*/ ROWNUM rn, bno, title,content
FROM tbl_board
WHERE ROWNUM <= 20;

-- 2�������� ó���ϱ� ���� SQL : inlien view
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

----------------------------- �˻� ��� -------------------------------------------

-- And �����ڰ� Or ������ ���� �켱 ������ ���� ������ ���� ���� �����Ͱ� �˻��ȴ�.
-- rownum�� 20���� �۰ų� �����鼭(and) �����̳� ���� 'test'��� ���ڿ��� �ִ°��(or)
-- �� �˻��� �ȴ�.
-- And�� Or�� �����ִ� SQL�� �ۼ��� ������ �켱 ���� �������� '()'�� �̿��ް� or������ ó���ؾߵȴ�.
select
*
from
    (
    select /*+index_desc(tbl_board pk_board)*/ rownum rn, bno, title, content, writer, regdate, updatedate
    from tbl_board
    where title like '%Test%' or content like '%Test%' and rownum <= 20
    )
where rn > 10;    

-- �켱 ���� �����ڸ� ����� �˻� SQL ��
select
*
from
(
    select /*+index_desc(tbl_board pk_board)*/ rownum rn, bno, title, content, writer, regdate, updatedate
    from tbl_board
    where (title like '%Test%' or content like '%Test%') and rownum <= 20
)
where rn > 10;