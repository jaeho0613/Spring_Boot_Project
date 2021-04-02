select * from tbl_reply;

select * from tbl_reply order by rno desc;

select rno, bno, reply, replyer, replyDate, updatedate
		from tbl_reply
		where bno = 100
		order by rno asc;
        
select * from tbl_reply where rno = 5;

select /*+index(tbl_reply idx_reply)*/
    rownum rn, bno, rno, reply, replyer, replyDate, updatedate
from tbl_reply
where bno = 327680
and rno > 0;

select count(rno) from tbl_reply where bno = 327680;