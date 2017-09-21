DROP TABLE depart CASCADE CONSTRAINTS PURGE;
DROP TABLE notice CASCADE CONSTRAINTS PURGE;

CREATE TABLE depart(
    deptno   number(7)     NOT NULL, -- 부서번호
    deptname   VARCHAR(10) NOT NULL, -- 부서이름
    deptof        VARCHAR(14) NOT NULL, -- 사무실
    CONSTRAINT deptno_pk_deptno PRIMARY KEY (deptno) 
);

drop sequence depart_seq

CREATE SEQUENCE depart_seq
    START WITH   1       
    INCREMENT BY 1       
    MAXVALUE     9999999 
    CACHE 2              
    NOCYCLE; 
    
CREATE SEQUENCE notice_seq
    START WITH   1       
    INCREMENT BY 1       
    MAXVALUE     9999999 
    CACHE 2              
    NOCYCLE; 
    
create table notice(
	nonum	 number(10) not null,
	title	 varchar(30)	not null,
	content  varchar(50) not null,
	wdate 	 date		not null,
	deptno   number(6)     NOT NULL, -- 부서번호
	constraint nonum_pk_nonum primary key(nonum), 
	constraint nonum_fk_deptno 
	foreign key(deptno) references depart(deptno)
);

select * from depart

INSERT INTO depart(deptno, deptname, deptof)
VALUES(depart_seq.nextval, '전산부', '101호');
INSERT INTO depart(deptno, deptname, deptof)
VALUES(depart_seq.nextval, '기획부', '201호');
INSERT INTO depart(deptno, deptname, deptof)
VALUES(depart_seq.nextval, '생산부', '301호');
INSERT INTO depart(deptno, deptname, deptof)
VALUES(depart_seq.nextval, '기술부', '407호');


