-- desc user_objects;
--select object_name, object_type from user_objects;

drop sequence seq_reply;
drop sequence seq_board;

drop table tbl_attach;
drop table tbl_reply;
drop table tbl_board;

COMMIT;

create sequence seq_board;

create sequence seq_reply;

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

create table tbl_attach(
    uuid varchar2(100) not null,
    uploadPath varchar2(200) not null,
    fileName varchar2(100) not null,
    fileType char(1) default 'I',
    bno number(10,0)
);

alter table tbl_board add constraint pk_board primary key ( bno );
alter table tbl_reply add constraint pk_reply primary key (rno);
alter table tbl_reply add constraint fk_reply_board foreign key (bno) references tbl_board(bno);

alter table tbl_attach add constraint pk_attach primary key (uuid);
alter table tbl_attach add constraint fk_board_attach foreign key (bno) references tbl_board(bno);

commit;

create index idx_reply on tbl_reply (bno desc, rno asc);

insert into tbl_board(bno, title, content, writer) values(seq_board.nextval, 'Test', 'Test', 'Test');

INSERT INTO tbl_board ( bno, title, content, writer)
    ( SELECT seq_board.NEXTVAL, title, content, writer
      FROM tbl_board
    );
    
alter table tbl_board add (replyCnt number default 0);
update tbl_board set replyCnt = (select count(rno) from tbl_reply where tbl_reply.bno = tbl_board.bno);

COMMIT;