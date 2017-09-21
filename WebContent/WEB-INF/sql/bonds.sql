drop table bonds

select rownum from BONDS;

select * from (select rownum numrow , boardtable.* from bonds) 
where numrow > 1 and numrow <= 2

create table bonds(
	id			varchar(20) 	not null,
	passwd		varchar(20)		not null,
	bname 		varchar(20)		not null,
	tel			varchar(30)		not null,
	email		varchar(50)		not null UNIQUE,
	zipcode		varchar(7)		not null,
	address1	varchar(100) 	not null,
	address2 	varchar(100)	not null,
	fname		varchar(50)		default 'bonds.jpg',
	job			varchar(30)		null,
	jdate		date			not null,
	grade		varchar(2)		default 'H',
	primary key(id)
);

insert into bonds( id, passwd, bname, tel, email, zipcode, address1, address2,
 fname, job, jdate, grade)
values( 'admin', '1234', '박정환', '111-1111-1111', 'admin@mail.com', '1234', '서울시 노원구',
 '롯데백화점', 'basic.jpg', '배우', sysdate, 'A' );
 
 
select count(*) from bonds where id='a';
select count(*) from bonds where email='a';

select * from BONDS


rownum 값에 따른 페이지 분리

1.
select id, passwd, bname, email, zipcode, address1, address2, job, jdate, tel, fname,grade
from BONDS

2.rownum만들어줌 (가상컬럽생성)
select id, passwd, bname, email,zipcode,address1,address2,job,jdate,tel,fname,grade,rownum
from (
	select id,passwd, bname,email,zipcode, address1,address2,job,jdate,tel,fname,grade
	from bonds
	)  --where rownum>3 and rownum<9 조건문을 넣으니까 안먹혀서 참조값을 넣어주고 쓴는듯.

3.rownum 값에 따른 페이지 분리

select id,passwd,bname,email,zipcode,address1,address2,job,jdate,tel,fname,grade,r
from(
	select id, passwd, bname, email,zipcode,address1,address2,job,jdate,tel,fname,grade,rownum as r
	from (
		select id,passwd, bname,email,zipcode, address1,address2,job,jdate,tel,fname,grade
		from bonds
		)where id like us
	) where r>3 and r<7
	로우넘의 기준은 가만보니까 회원가입(insert) 순으로 정해지는 것 같다.
	
	
	
	
	select id,passwd,bname,email,zipcode,address1,address2,job,jdate,tel,fname,grade,r 
from( 
select id, passwd, bname, email,zipcode,address1,address2,job,jdate,tel,fname,grade,rownum as r 
from ( 
		select id,passwd, bname,email,zipcode, address1,address2,job,jdate,tel,fname,grade 
		from bonds 
		) where id like '%'||'user1'||'%'
	) where r>=1 and r<=10 
	
	
	
	
	
update bonds set tel = '1',email = '1', zipcode = '1',address1 = '1',address2 = '1', fname = '1',bname = '1',
	job = '1' where id = 'user1';

select * from bonds;
