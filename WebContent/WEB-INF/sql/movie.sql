drop table movie purge


CREATE TABLE movie( 
  movieno NUMBER(7)     NOT NULL,  -- 글 일련 번호, -9999999 ~ +9999999 
  title   VARCHAR(100)  NOT NULL,  -- 제목(*)
  content VARCHAR(4000) NOT NULL,  -- 글 내용 
  passwd  VARCHAR(15)   NOT NULL,  -- 비밀 번호 
  viewcnt NUMBER(5)     DEFAULT 0, -- 조회수, 기본값 사용 
  wdate   DATE          NOT NULL,  -- 등록 날짜, sysdate 
  imgname	  VARCHAR(100)	DEFAULT 'noimage.jpg',
  movname	  VARCHAR(100)	DEFAULT 0,
  PRIMARY KEY (movieno) 
);


select * from movie

select count(*) from movie where refnum = 14

alter table movie
add(refnum number default 0)
 
delete from movie
where indent >0

select movieno, title, grpno, indent, ansnum, refnum
from movie
order by grpno desc, ansnum


2. 글 추가(C: Create) 
 
- MAX(movieno): movieno 컬럼에서 최대값을 추출 
SELECT MAX(movieno) as max FROM movie; 
 
 MAX 
 ---- 
 NULL <- 값이 없는 경우 
 
 
SELECT MAX(movieno)+1 as max FROM movie; 
 
 MAX 
 ---- 
 NULL <- 사칙연산이 의미가 없음. 
 
  
- NVL(): null 값을 0으로 변경 가능함. 
SELECT NVL(MAX(movieno), 0) as max FROM movie; 
 
 MAX 
 --- 
   0 
   

- 새로운 번호의 생성   
SELECT NVL(MAX(movieno), 0) + 1 as movieno FROM movie; 

movieNO 
 ----- 
     1 
 
     
- 서브쿼리를 이용한 레코드 추가 
INSERT INTO movie(movieno, imgname,movname, title, content, passwd, wdate)  
VALUES((SELECT NVL(MAX(movieno), 0) + 1 as movieno FROM movie), 
'noimage.jpg', '제목', '내용', '123', '1234',sysdate );                 
 
3. 전체 글 목록(S:Total Select List), 최신글 먼저 출력 
   - ASC: 오름 차순, DESC: 내림 차순 
SELECT movieno, wname, title, content, passwd, viewcnt, wdate, grpno, indent, ansnum 
FROM movie 
ORDER BY movieno DESC; 
 
 movieNO WNAME TITLE CONTENT PASSWD VIEWCNT WDATE                 GRPNO INDENT ANSNUM 
 ----- ----- ----- ------- ------ ------- --------------------- ----- ------ ------ 
     1 왕눈이   제목    내용      123          0 2013-10-31 20:46:18.0     0      0      0 
 
 
      
4. 조회수 증가 
UPDATE movie
SET viewcnt = viewcnt + 1 
WHERE movieno=1; 
 
 
 
5. 1건의 글 보기(R:Read, PK 사용) 
SELECT movieno, wname, title, content, passwd, viewcnt, wdate, grpno, indent, ansnum 
FROM movie  
WHERE movieno = 1; 
 
 PDSNO WNAME TITLE CONTENT PASSWD VIEWCNT WDATE                 GRPNO INDENT ANSNUM FILENAME FILESIZE 
 ----- ----- ----- ------- ------ ------- --------------------- ----- ------ ------ -------- -------- 
     1 왕눈이   제목    내용      123          0 2013-10-21 21:07:30.0     0      0      0 file.txt        0 
 
 
 
 
6. 글 수정(U:Update), PK는 레코드를 구분하는 고유 기능을 가지고 있음으로 
   수정하는 것은 권장하지 않음. 
    
-- PK 수정, PK는 중복 충돌이 발생 할 수 있음으로 변경을 권장하지 않음.  
   
-- 일반 컬럼의 변경, 일반적인 UPDATE임    
UPDATE movie 
SET 
wname='왕눈이', 
title='비오는날', 
content='개구리 연못' 
WHERE movieno = 1; 
 
 PDSNO WNAME TITLE CONTENT PASSWD VIEWCNT WDATE                 GRPNO INDENT ANSNUM  
 ----- ----- ----- ------- ------ ------- --------------------- ----- ------ ------  
     1 아로미   제목2   내용2     123          0 2013-10-21 21:07:30.0     0      0      0 
 
     
-- 패스워드 검사 
SELECT COUNT(movieno) as cnt 
FROM movie 
WHERE movieno=1 AND passwd='123'; 

--and 둘다맞아야함.
 
 CNT 
 --- 
   1 
      
      
 
7. 글 삭제(D:Delete)
-- 모든 레코드 삭제
DELETE FROM movie; 
 
-- 1번 레코드만 삭제
DELETE FROM movie WHERE movieno=5; 
 


select * from movie
