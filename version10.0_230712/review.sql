drop table t_shopping_review;

select * from t_goods_detail_image;

select * from t_goods_detail_image where goods_id = 354 and filetype = 'main_image';


  CREATE TABLE "SCOTT"."T_SHOPPING_REVIEW" 
   (	"REVIEW_ID" NUMBER(20,0), 
	"GOODS_ID" NUMBER(20,0) , 
    "ORDER_ID" NUMBER(20,0) ,
	"FILENAME" VARCHAR2(200 BYTE), 
	"MEMBER_ID" VARCHAR2(10 BYTE), 
	"REVIEW_CONTENT" VARCHAR2(1000 BYTE), 
	"REVIEW_COMMENT" VARCHAR2(1000 BYTE) DEFAULT NULL, 
	"REVIEW_STAR" NUMBER(10,0) DEFAULT NULL, 
	"REVIEW_DATE" DATE DEFAULT sysdate, 
	 PRIMARY KEY ("REVIEW_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
  
  
insert into T_SHOPPING_REVIEW (REVIEW_id,GOODS_id,ORDER_ID,FILENAME,MEMBER_id,REVIEW_content,REVIEW_STAR,REVIEW_date) values
( ( SELECT NVL(MAX(REVIEW_id), 0) +1 FROM T_SHOPPING_REVIEW),354,300,'duke.png', 'qwer', '客快旷', 3, sysdate );



select * from t_shopping_review;

select * from t_goods_detail_image where goods_id = 354 and filetype = 'main_image';

select * from t_shopping_review 
        where  
        review_comment like '%府轰%' OR
        review_content like '%府轰%'
        order by review_id desc;

select * from t_shopping_review where goods_id = 354;


commit;