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

ALTER TABLE tbl_board ADD CONSTRAINT pk_board PRIMARY KEY ( bno );

INSERT INTO tbl_board (
    bno,
    title,
    content,
    writer
) VALUES (
    seq_board.NEXTVAL,
    '테스트 제목',
    '테스트 내용',
    'user00'
);

insert into tbl_board (bno, title, content, writer) values(seq_board.nextval, '테스트 제목', '테스트 내용', 'user00');
insert into tbl_board (bno, title, content, writer) values(seq_board.nextval, '테스트 제목', '테스트 내용', 'user00');
insert into tbl_board (bno, title, content, writer) values(seq_board.nextval, '테스트 제목', '테스트 내용', 'user00');
insert into tbl_board (bno, title, content, writer) values(seq_board.nextval, '테스트 제목', '테스트 내용', 'user00');
insert into tbl_board (bno, title, content, writer) values(seq_board.nextval, '테스트 제목', '테스트 내용', 'user00');

INSERT INTO tbl_board (
    bno,
    title,
    content,
    writer
)
    ( SELECT
        seq_board.NEXTVAL,
        title,
        content,
        writer
    FROM
        tbl_board
    );

COMMIT;