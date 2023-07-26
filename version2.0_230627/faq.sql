drop table T_SHOPPING_FAQ;

CREATE TABLE T_SHOPPING_FAQ
   ("FAQ_ID" NUMBER(10,0) PRIMARY KEY, 
	"FAQ_TITLE" VARCHAR2(100 BYTE), 
	"FAQ_CONTENT" VARCHAR2(1000 BYTE) DEFAULT 'N', 
	"FAQ_DATE" DATE DEFAULT sysdate);
    
    
insert into T_SHOPPING_FAQ (faq_id,faq_title,faq_content,faq_date) values
( ( SELECT NVL(MAX(faq_id), 0) +1 FROM T_SHOPPING_FAQ),
  'FAQ 제목입니다7.',
  'FAQ 내용입니다7.',
  sysdate );
    
select * from T_SHOPPING_FAQ;


SELECT * FROM T_SHOPPING_FAQ WHERE faq_id = 4;
SELECT * FROM T_SHOPPING_FAQ WHERE
faq_title like '%'||'FAQ'||'%' OR
faq_content like '%'||'FAQ'||'%'
order by faq_id desc;

SELECT * FROM (
SELECT temp_table.*, ROWNUM as rnum FROM (
select * from T_SHOPPING_FAQ order by faq_id desc
) temp_table )  WHERE RNUM BETWEEN 1 AND 5;

commit;