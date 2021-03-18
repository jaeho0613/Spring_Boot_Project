DROP SEQUENCE seq_board;
DROP TABLE tbl_board;
COMMIT;

CREATE SEQUENCE seq_board;

CREATE TABLE tbl_board (
    bno number(10,0),
    title varchar2(200) not null,
    content varchar2(2000) not null,
    writer varchar2(50) not null,
    regdate date default sysdate,
    updatedate date default sysdate
);

alter table tbl_board add constraint pk_board primary key (bno);

insert into tbl_board (bno, title, content, writer) values(seq_board.nextval, '�׽�Ʈ ����', '�׽�Ʈ ����', 'user00');
insert into tbl_board (bno, title, content, writer) values(seq_board.nextval, '�׽�Ʈ ����', '�׽�Ʈ ����', 'user00');
insert into tbl_board (bno, title, content, writer) values(seq_board.nextval, '�׽�Ʈ ����', '�׽�Ʈ ����', 'user00');
insert into tbl_board (bno, title, content, writer) values(seq_board.nextval, '�׽�Ʈ ����', '�׽�Ʈ ����', 'user00');
insert into tbl_board (bno, title, content, writer) values(seq_board.nextval, '�׽�Ʈ ����', '�׽�Ʈ ����', 'user00');
insert into tbl_board (bno, title, content, writer) values(seq_board.nextval, '�׽�Ʈ ����', '�׽�Ʈ ����', 'user00');

COMMIT;

select * from tbl_board;