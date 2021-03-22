-- ��ü �˻� (���� ���� ������)
select * from tbl_board;

-- ��ü �˻� (���� ������)
select * from tbl_board where bno > 0;

-- ������ ���� ������ (+1 �������� ã��)
select * from tbl_board order by bno + 1 desc;

-- ������ ���� ������ (�������� ã��)
select * from tbl_board order by bno desc;

----------------------------------Hint------------------------------------------

-- Oracle�� hint ��� X (���� ����)
select * from tbl_board order by bno desc;

-- Oracle�� hint ��� O (���� ����)
select /*+INDEX_DESC (tbl_board pk_board) */*
from tbl_board;

-- Full hint
select /*+ Full(tbl_board)*/ * from tbl_board order by bno desc;

-- order by�� ������ hint 
select /*+ index_asc(tbl_board pk_board)*/ * from tbl_board; -- ���� ����
select /*+ index_desc(tbl_board pk_board)*/ * from tbl_board; -- ���� ����

----------------------------------- rownum -------------------------------------

-- ������ ���̺� rownum
select rownum rn, bno, title from tbl_board;

-- full hint
select /*+full(tbl_board)*/ rownum rn, bno, title from tbl_board where bno >0
order by bno;

-- index hint ��������
select /*+index_asc(tbl_board pk_board)*/ rownum rn, bno, title from tbl_board;

-- index hint ��������
select /*+INDEX_DESC(tbl_board pk_board)*/ rownum rn, bno, title from tbl_board where bno > 0;

-- ����¡ ó�� (10���� ��������)
select /*+index_desc(tbl_board pk_board)*/ rownum rn, bno, title, content from tbl_board where rownum <=10;

-- �ƹ��� ���� ������ �ʴ´�.
-- rownum�� ���̺� �����͸� ������ �� '���� ����'���µ�
-- ù��° rownum�� 1�� �������� �ǰ�
-- rownum 1�� > 10�� �񱳱��� ���� �����Ƿ� ��ȿȭ �ȴ�.
-- ���Ŀ� �ٽ� �ٸ� �����͸� �����͵� �׻� 1�� ��������� �������� ������ �ݺ��ǹǷ�
-- SQL�� �ۼ��� �� rownum�� ������ �ݵ�� 1�� ���ԵǾ�� �Ѵ�.
select /*+index_desc(tbl_board pk_board)*/ rownum rn, bno, title, content from tbl_board where rownum > 10 and rownum <=20;
select /*+index_desc(tbl_board pk_board)*/ rownum rn, bno, title, content from tbl_board where rownum <=20;

-- 2�������� ó���ϱ� ���� SQL : inlien view
select bno, title, content
from ( select /*+index_desc(tbl_board pk_board)*/ 
       rownum rn, bno, title, content 
       from tbl_board 
       where rownum <= 20 )
where rn > 10;       