drop table reply purge

create table rep(
rnum number not null,
content varchar(500) not null,
regdate date not null,
id varchar(10) not null,
boardno number(7) not null,
primary key(rnum),
foreign key(boardno)  references board(boardno)
)

--create(댓글등록)
select * from bonds;
select * from board;
 
select nvl(max(rnum),0)+1 from reply;
 
insert into reply(rnum, content, regdate, id, boardno)
values((select nvl(max(rnum),0)+1 from reply),
'의견입니다.',sysdate,'user1',52
)

--인서트할때 board테이블에있는 primary키 참조해야함.
 
 
--read(댓글 내용)
select * from reply
 
--update(댓글 수정)
update reply
set content = '새로운 의견을 올립니다.'
where rnum = 1
 
--delete(댓글 삭제)
delete from REPLY
where rnum = 1
 
 
--list(목록)
select rnum, content, to_char(regdate,'yyyy-mm-dd') regdate, id, boardno, r
FROM(
select rnum, content, regdate, id, boardno, rownum r
FROM(
select rnum, content, regdate, id, boardno
from REPLY
order by rnum DESC
    )
)WHERE r >= 1 and r <= 5
 
 
--total(목록)
select count(*) from reply
 