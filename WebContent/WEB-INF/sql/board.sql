DROP TABLE board PURGE; 
 
CREATE TABLE board ( 
  boardno   NUMBER(7)     NOT NULL,  -- 글 일련 번호, -9999999 ~ +9999999 
  wname   VARCHAR(20)   NOT NULL,  -- 글쓴이 
  title   VARCHAR(100)  NOT NULL,  -- 제목(*) 
  content VARCHAR(4000) NOT NULL,  -- 글 내용 
  passwd  VARCHAR(15)   NOT NULL,  -- 비밀 번호 
  viewcnt NUMBER(5)     DEFAULT 0, -- 조회수, 기본값 사용 
  wdate   DATE          NOT NULL,  -- 등록 날짜, sysdate 
  grpno   NUMBER(7)     DEFAULT 0, -- 부모글 번호 
  indent  NUMBER(2)     DEFAULT 0, -- 답변여부,답변의 깊이
  refnum  NUMBER		DEFAULT 0,
  ansnum  NUMBER(5)     DEFAULT 0, -- 답변 순서 
  PRIMARY KEY (boardno)  
);


select * from board

select count(*) from board where refnum = 14

alter table board
add(refnum number default 0)
 
delete from board
where indent >0

select boardno, title, grpno, indent, ansnum, refnum
from board
order by grpno desc, ansnum

2. 글 추가(C: Create) 
 
- MAX(boardno): boardno 컬럼에서 최대값을 추출 
SELECT MAX(boardno) as max FROM board; 
 
 MAX 
 ---- 
 NULL <- 값이 없는 경우 
 
 
SELECT MAX(boardno)+1 as max FROM board; 
 
 MAX 
 ---- 
 NULL <- 사칙연산이 의미가 없음. 
 
  
- NVL(): null 값을 0으로 변경 가능함. 
SELECT NVL(MAX(boardno), 0) as max FROM board; 
 
 MAX 
 --- 
   0 
   
 
- 새로운 번호의 생성   
SELECT NVL(MAX(boardno), 0) + 1 as boardno FROM board; 

boardNO 
 ----- 
     1 
 
     
- 서브쿼리를 이용한 레코드 추가 
INSERT INTO board(boardno, wname, title, content, passwd, wdate,grpno)  
VALUES((SELECT NVL(MAX(boardno), 0) + 1 as boardno FROM board), 
'왕눈이', '제목', '내용', '123', sysdate, ((SELECT NVL(MAX(boardno), 0) + 1 as boardno FROM board));                 
 
3. 전체 글 목록(S:Total Select List), 최신글 먼저 출력 
   - ASC: 오름 차순, DESC: 내림 차순 
SELECT boardno, wname, title, content, passwd, viewcnt, wdate, grpno, indent, ansnum 
FROM board 
ORDER BY boardno DESC; 
 
 boardNO WNAME TITLE CONTENT PASSWD VIEWCNT WDATE                 GRPNO INDENT ANSNUM 
 ----- ----- ----- ------- ------ ------- --------------------- ----- ------ ------ 
     1 왕눈이   제목    내용      123          0 2013-10-31 20:46:18.0     0      0      0 
 
 
      
4. 조회수 증가 
UPDATE board
SET viewcnt = viewcnt + 1 
WHERE boardno=1; 
 
 
 
5. 1건의 글 보기(R:Read, PK 사용) 
SELECT boardno, wname, title, content, passwd, viewcnt, wdate, grpno, indent, ansnum 
FROM board  
WHERE boardno = 1; 
 
 PDSNO WNAME TITLE CONTENT PASSWD VIEWCNT WDATE                 GRPNO INDENT ANSNUM FILENAME FILESIZE 
 ----- ----- ----- ------- ------ ------- --------------------- ----- ------ ------ -------- -------- 
     1 왕눈이   제목    내용      123          0 2013-10-21 21:07:30.0     0      0      0 file.txt        0 
 
 
 
 
6. 글 수정(U:Update), PK는 레코드를 구분하는 고유 기능을 가지고 있음으로 
   수정하는 것은 권장하지 않음. 
    
-- PK 수정, PK는 중복 충돌이 발생 할 수 있음으로 변경을 권장하지 않음.  
   
-- 일반 컬럼의 변경, 일반적인 UPDATE임    
UPDATE board 
SET 
wname='왕눈이', 
title='비오는날', 
content='개구리 연못' 
WHERE boardno = 1; 
 
 PDSNO WNAME TITLE CONTENT PASSWD VIEWCNT WDATE                 GRPNO INDENT ANSNUM  
 ----- ----- ----- ------- ------ ------- --------------------- ----- ------ ------  
     1 아로미   제목2   내용2     123          0 2013-10-21 21:07:30.0     0      0      0 
 
     
-- 패스워드 검사 
SELECT COUNT(boardno) as cnt 
FROM board 
WHERE boardno=1 AND passwd='123'; 

--and 둘다맞아야함.
 
 CNT 
 --- 
   1 
      
      
 
7. 글 삭제(D:Delete)
-- 모든 레코드 삭제
DELETE FROM board; 
 
-- 1번 레코드만 삭제
DELETE FROM board WHERE boardno=1; 
 
8. 답변 
 
1) 모든 레코드 삭제 
DELETE FROM board; 
 
 boardNO  TITLE    GRPNO INDENT ANSNUM 
 -----   -----    ----- ------ ------ 
     1  부모글1     1      0      0 
 
      
 boardNO  TITLE    GRPNO INDENT ANSNUM 
 -----  -----    ----- ------ ------ 
     2  부모글2      2      0      0 
     1  부모글1      1      0      0 
 
      							(들여쓰기)
 boardNO  TITLE            GRPNO INDENT 			ANSNUM(부모글뒤로의 답변순서:등록순서아님) 
 -----  -----            ----- ------ 			------ 
     4  부모글4            4      0      				0    
     6		부모글4답변2	 4 		1(1번들여쓰기) 		1			(답변은 들여쓰기)
     8		  부모글4답답1  4  	2(2번들여쓰기)			2
	 5		부모글4답변1	 4     	1				    3
     3  부모글3            3      0      				0      
     2  부모글2            2      0     			    0 
     7		부모글2답변1	  2
     1  부모글1            1      0     			    0 
      !!답변도 레코드생성(프라이머리키생성) 

 boardNO  TITLE    			GRPNO INDENT ANSNUM 
 -----  -----    			----- ------ ------ 
  	3	부모글3					3	0		0   --create()
  	6	  부모글3답3				3	1		1	--insert되기전에 뒤의ansnum 증가!!
  	5	  부모글3답2				3	1		2	
  	7		부모글3답2답1			3	2		3
  	4	  부모글3답1				3	1		4	--답변생성()
  	2	부모글2					2	0		0
  	9	  부모글2답2				2	1		1
   11		부모글2답2답1			2	2		2
    8	  부모글2답1				2	1		3
  	1	부모글1					1	0		0
   10	  부모글1답1				1	1		1


4) 부모글(일반적인 글) 등록 
 
INSERT INTO board(boardno, wname, title, content, passwd, wdate, 
grpno)  
VALUES((SELECT NVL(MAX(boardno), 0) + 1 as boardno FROM board), 
'왕눈이', '부모글3', '내용', '123', sysdate,
(SELECT NVL(MAX(grpno), 0) + 1 as grpno FROM board)
);                 
 
         
SELECT boardno, title, grpno, indent, ansnum 
FROM board  
ORDER BY grpno DESC, ansnum ASC; 
  
     
5) 답변처리
--read(부모의 title,grpno,indent,ansnum) : 첫번째
select boardno, title, grpno, indent, ansnum
from board
where boardno=2 --부모의 글
 
 boardNO TITLE   GRPNO INDENT ANSNUM
 ----- ----- - ---- ------ ------
     2 부모글1       2      0      0
     
--답변등록(부모의grpno,부모+1 -> indent,ansnum): 세번째
INSERT INTO board(boardno, wname, title, content, passwd, wdate, 
grpno,indent,ansnum)  
VALUES((SELECT NVL(MAX(boardno), 0) + 1 as boardno FROM board), 
'아로미', '부모글1 답변글2', '내용', '123', sysdate,2,1,1);
 
     
--부모글의 2차이상의 답변인 경우 ansnum(답변의 순서) 재정렬 :두번째
UPDATE board 
SET ansnum = ansnum + 1 
WHERE grpno=2 AND ansnum > 0; 
 
 
--------------------------------------------------------------------      
 
  
9. 검색 글 목록(S:Search List), title 컬럼에 '제목'이란  
   단어가 들어가 있는 레코드 검색 
    
  
기타)  
- WHERE title LIKE '%독도%': 독도라는 문자열이 발견되면 전부 해당(*)  
- WHERE title LIKE '독도%' : 독도로 시작하는 문자열 검색 
- WHERE title LIKE '%독도' : 독도로 끝나는 문자열 검색 
- WHERE title LIKE '독도'  : 독도와 일치하는 문자열 검색 
- WHERE title = '독도'     : 독도와 일치하는 문자열 검색, LIKE '독도' 동일 
- WHERE title = '__독도'   : 한국독도, 동해독도와 같은 패턴의 문자열 검색 
 
 
1) 성명 검색 글 목록(S:Search List) 
SELECT boardno, wname, title, content, passwd, viewcnt, wdate, grpno, indent, ansnum 
FROM board  
WHERE wname LIKE '%왕눈이%' 
ORDER BY boardno DESC;  
 
 
2) 제목 검색 글 목록(S:Search List) 
SELECT boardno, wname, title, content, passwd, viewcnt, wdate, grpno, indent, ansnum 
FROM board  
WHERE title LIKE '%독도%' 
ORDER BY boardno DESC;  
 
 
 
3) 내용 검색 글 목록(S:Search List) 
SELECT boardno, wname, title, content, passwd, viewcnt, wdate, grpno, indent, ansnum 
FROM board  
WHERE content LIKE '%독도%' 
ORDER BY boardno DESC;  
 


4) 파이프 기호를 통한 SQL 결합 
SELECT ('A' || 'B' || 'C' || 'D') as "grade" 
FROM dual; 
 
 grade 
 ----- 
 ABCD 
  
 
SELECT ('등록자: ' || wname) as "wname"  
FROM board; 
 
 wname 
 --------- 
 등록자: 홍길동 
 등록자: 홍길동 
 등록자: 홍길동 
 등록자: 홍길동 
 
drop table board purge
 
 1) 정렬 
SELECT boardno, wname, title, viewcnt, wdate, grpno, indent, ansnum, viewcnt 
FROM board  
ORDER BY grpno DESC, ansnum ASC;


2) rownum 생성  --가상 칼럼생성
SELECT boardno, wname, title, viewcnt, wdate, grpno, 
indent, ansnum, rownum
FROM (
  SELECT boardno, wname, title, viewcnt, wdate, grpno,
  indent, ansnum
  FROM board  )
  ORDER BY grpno DESC, ansnum ASC 
)

select count(*) from board;


3) rownum 값에 따른 페이지 분리 (rownum을 참조값r에 넣어서 꺼냈네)
SELECT boardno, wname, title, viewcnt, wdate, grpno, 
indent, ansnum,  r
From(
	SELECT boardno, wname, title, viewcnt, wdate, grpno, 
	indent, ansnum, rownum as r
	FROM ( 
	 SELECT boardno, wname, title, viewcnt, wdate, grpno,
	 indent, ansnum
	 FROM board  
	 ORDER BY grpno DESC, ansnum ASC 
) 
)where r >= 3 and r <= 5