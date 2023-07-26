drop table T_SHOPPING_NOTICE;

CREATE TABLE T_SHOPPING_NOTICE
   ("NOTICE_ID" NUMBER(10,0) PRIMARY KEY, 
	"NOTICE_TITLE" VARCHAR2(50 BYTE), 
	"NOTICE_CONTENT" VARCHAR2(1000 BYTE) DEFAULT 'N', 
	"NOTICE_DATE" DATE DEFAULT sysdate);
    
    
insert into T_SHOPPING_NOTICE (notice_id,notice_title,notice_content,notice_date) values
( ( SELECT NVL(MAX(notice_id), 0) +1 FROM T_SHOPPING_NOTICE),
  '공지사항 제목입니다.',
  '공지사항 내용입니다.',
  sysdate );
    
select * from T_SHOPPING_NOTICE;


SELECT * FROM T_SHOPPING_NOTICE WHERE notice_id = 1;
SELECT * FROM T_SHOPPING_NOTICE WHERE
notice_title like '%'||'공지'||'%' OR
notice_content like '%'||'공지'||'%'
order by notice_id desc;

SELECT * FROM (
SELECT temp_table.*, ROWNUM as rnum FROM (
select * from T_SHOPPING_NOTICE order by notice_id desc
) temp_table )  WHERE RNUM BETWEEN #{ param1 } AND #{ param2 }

commit;