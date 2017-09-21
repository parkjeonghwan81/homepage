DROP TABLE calendar CASCADE CONSTRAINTS;
 
CREATE TABLE calendar(
  calendarno  NUMBER(7)     NOT NULL,
  labeldate   VARCHAR(10)   NOT NULL, -- 출력할 날짜 2013-10-20 
  label       VARCHAR(30)   NOT NULL, -- 달력에 출력될 레이블
  title       VARCHAR(100)  NOT NULL, -- 제목(*)
  content     VARCHAR(4000) NOT NULL, -- 글 내용
  cnt         NUMBER(5)     DEFAULT 0,-- 조회수
  rdate       DATE          NOT NULL, -- 등록 날짜
  PRIMARY KEY(calendarno)
);
 
INSERT INTO calendar(calendarno, labeldate, label, title, content, cnt, rdate)
VALUES((SELECT NVL(MAX(calendarno), 0) + 1 as calendarno FROM calendar), '2016-01-01', '해돋이', '정동진 갈 예정입니다.', '31일 새벽에 출발합니다.', 0, sysdate);
 
 
-- 전체 목록
SELECT calendarno, labeldate, label, title, content, cnt, rdate
FROM calendar
ORDER BY calendarno DESC;
 
CALENDARNO LABELDATE   LABEL   TITLE                      CONTENT                     CNT  RDATE
----------        -------------   ------   ------------               --------------                  ---   ---------------------
1                  2015-01-01   해돋이  정동진 갈예정입니다.  31일 새벽에 출발합니다.   0     2014-01-09 15:51:08.0
 
          
-- 특정 날짜의 목록
SELECT calendarno, labeldate, label
FROM calendar
WHERE labeldate = '2016-01-01';
 
SELECT calendarno, labeldate, label
FROM calendar
WHERE substr(labeldate, 1, 7) = '2016-01';
-- MySQL: WHERE substring(labeldate, 1, 7) = '2014-01';
 
CALENDARNO LABELDATE   LABEL
 --------------   ----------      -----
     1              2014-01-01  해돋이
 
 
          
-- 조회수 증가 및 조회
UPDATE calendar
SET cnt = cnt + 1
WHERE calendarno = 1;
 
-- 조회
SELECT calendarno, labeldate, label, title, content, cnt, regdate
FROM calendar
WHERE calendarno = 1;
 
 
-- 변경
UPDATE calendar
SET labeldate='', label='', title='', content=''
WHERE calendarno = 1;
 
 
-- 삭제
DELETE FROM calendar
WHERE calendarno = 1;
