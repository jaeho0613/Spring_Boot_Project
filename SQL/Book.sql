DROP SEQUENCE seq_board;

DROP TABLE tbl_board;

COMMIT;

CREATE SEQUENCE seq_board;

CREATE TABLE tbl_board (
    bno         NUMBER(10, 0),
    title       VARCHAR2(200) NOT NULL,
    content     VARCHAR2(2000) NOT NULL,
    writer      VARCHAR2(50) NOT NULL,
    regdate     DATE DEFAULT sysdate,
    updatedate  DATE DEFAULT sysdate
);

create table tbl_reply (
    rno number(10, 0),
    bno number(10, 0) not null,
    reply varchar2(1000) not null,
    replyer varchar2(50) not null,
    replyDate date default sysdate,
    updateDate date default sysdate
);

create sequence seq_reply;

alter table tbl_reply add constraint pk_reply primary key (rno);

alter table tbl_reply add constraint fk_reply_board foreign key (bno) references tbl_board(bno);

ALTER TABLE tbl_board ADD CONSTRAINT pk_board PRIMARY KEY ( bno );

insert into tbl_board (bno, title, content, writer) values(seq_board.nextval, 'Test', 'Test', 'Test');
insert into tbl_board (bno, title, content, writer) values(seq_board.nextval, 'Test', 'Test', 'Test');
insert into tbl_board (bno, title, content, writer) values(seq_board.nextval, 'Test', 'Test', 'Test');
insert into tbl_board (bno, title, content, writer) values(seq_board.nextval, 'Test', 'Test', 'Test');
insert into tbl_board (bno, title, content, writer) values(seq_board.nextval, 'Test', 'Test', 'Test');

INSERT INTO tbl_board ( bno, title, content, writer)
    ( SELECT seq_board.NEXTVAL, title, content, writer
      FROM tbl_board
    );

COMMIT;