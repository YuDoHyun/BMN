drop table T_SHOPPING_QNA;

CREATE TABLE T_SHOPPING_QNA
(
    "QNA_ID" NUMBER(20,0) PRIMARY KEY,
    "GOODS_ID" NUMBER(20,0) DEFAULT NULL,
    "FILENAME" VARCHAR2(50 BYTE),
    "MEMBER_ID" VARCHAR2(10 BYTE),
    "QNA_TITLE" VARCHAR2(100 BYTE),
    "QNA_CONTENT" VARCHAR2(1000 BYTE),
    "QNA_COMMENT" VARCHAR2(1000 BYTE) DEFAULT NULL,
    "QNA_STATUS" VARCHAR2(10 BYTE) DEFAULT 'N',
    "QNA_DATE" DATE DEFAULT sysdate,
    CONSTRAINT "FK_MEMBER_ID" FOREIGN KEY ("MEMBER_ID")
        REFERENCES "SCOTT"."T_SHOPPING_MEMBER" ("MEMBER_ID"),
    CONSTRAINT "FK_GOODS_ID" FOREIGN KEY ("GOODS_ID")
        REFERENCES "SCOTT"."T_SHOPPING_GOODS" ("GOODS_ID")
);

    
insert into T_SHOPPING_QNA (QNA_id,GOODS_id,FILENAME,MEMBER_id,QNA_title,QNA_content,QNA_date) values
( ( SELECT NVL(MAX(QNA_id), 0) +1 FROM T_SHOPPING_QNA),354,'duke.png', 'lee',
  'QNA 제목입니다1.',
  'QNA 내용입니다1.',
  sysdate );
insert into T_SHOPPING_QNA (QNA_id,GOODS_id,FILENAME,MEMBER_id,QNA_title,QNA_content,QNA_date) values
( ( SELECT NVL(MAX(QNA_id), 0) +1 FROM T_SHOPPING_QNA),354,'duke2.png', 'lee',
  'QNA 제목입니다2.',
  'QNA 내용입니다2.',
  sysdate );
insert into T_SHOPPING_QNA (QNA_id,GOODS_id,FILENAME,MEMBER_id,QNA_title,QNA_content,QNA_date) values
( ( SELECT NVL(MAX(QNA_id), 0) +1 FROM T_SHOPPING_QNA),350,'image1.png', 'cha',
  'QNA 제목입니다3.',
  'QNA 내용입니다3.',
  sysdate );
insert into T_SHOPPING_QNA (QNA_id,GOODS_id,FILENAME,MEMBER_id,QNA_title,QNA_content,QNA_date) values
( ( SELECT NVL(MAX(QNA_id), 0) +1 FROM T_SHOPPING_QNA),354,'image2.png', 'cha',
  'QNA 제목입니다4.',
  'QNA 내용입니다4.',
  sysdate );
insert into T_SHOPPING_QNA (QNA_id,GOODS_id,FILENAME,MEMBER_id,QNA_title,QNA_content,QNA_date) values
( ( SELECT NVL(MAX(QNA_id), 0) +1 FROM T_SHOPPING_QNA),354,'duke.png', 'lee',
  'QNA 제목입니다1.',
  'QNA 내용입니다1.',
  sysdate );
insert into T_SHOPPING_QNA (QNA_id,GOODS_id,FILENAME,MEMBER_id,QNA_title,QNA_content,QNA_date) values
( ( SELECT NVL(MAX(QNA_id), 0) +1 FROM T_SHOPPING_QNA),354,'duke2.png', 'lee',
  'QNA 제목입니다2.',
  'QNA 내용입니다2.',
  sysdate );
insert into T_SHOPPING_QNA (QNA_id,GOODS_id,FILENAME,MEMBER_id,QNA_title,QNA_content,QNA_date) values
( ( SELECT NVL(MAX(QNA_id), 0) +1 FROM T_SHOPPING_QNA),350,'image1.png', 'cha',
  'QNA 제목입니다3.',
  'QNA 내용입니다3.',
  sysdate );
insert into T_SHOPPING_QNA (QNA_id,GOODS_id,FILENAME,MEMBER_id,QNA_title,QNA_content,QNA_date) values
( ( SELECT NVL(MAX(QNA_id), 0) +1 FROM T_SHOPPING_QNA),354,'image2.png', 'cha',
  'QNA 제목입니다4.',
  'QNA 내용입니다4.',
  sysdate );

SELECT Q.QNA_ID, Q.FILENAME, Q.MEMBER_ID, M.MEMBER_NAME, Q.QNA_TITLE,
	        Q.QNA_CONTENT, Q.QNA_COMMENT, Q.QNA_STATUS, Q.QNA_DATE 
	        FROM T_SHOPPING_QNA Q 
	        JOIN T_SHOPPING_MEMBER M ON Q.MEMBER_ID = M.MEMBER_ID 
	        WHERE Q.QNA_ID= 20;
            
select * from T_SHOPPING_QNA;

SELECT * FROM (
		    SELECT temp_table.*, ROWNUM AS rnum FROM (
		        SELECT Q.QNA_ID, I.FILENAME, Q.QNA_TITLE, M.MEMBER_NAME, Q.QNA_DATE, G.GOODS_ID
		        FROM T_SHOPPING_QNA Q
		        JOIN T_SHOPPING_MEMBER M ON Q.MEMBER_ID = M.MEMBER_ID
		        LEFT JOIN T_SHOPPING_GOODS G ON Q.GOODS_ID = G.GOODS_ID
		        LEFT JOIN T_GOODS_DETAIL_IMAGE I ON G.GOODS_ID = I.GOODS_ID AND I.FILETYPE = 'main_image'
		        WHERE Q.member_id='lee'
		        ORDER BY Q.QNA_ID DESC
		    ) temp_table ) WHERE RNUM BETWEEN 1 AND 10;

DESC T_SHOPPING_QNA;

select MAX(QNA_ID)+1 from T_SHOPPING_QNA dual;

SELECT * FROM T_SHOPPING_QNA
WHERE QNA_ID = 1;

SELECT Q.QNA_ID, Q.FILENAME, Q.MEMBER_ID, M.MEMBER_NAME, Q.QNA_TITLE, Q.QNA_CONTENT, Q.QNA_COMMENT, Q.QNA_STATUS, Q.QNA_DATE
FROM T_SHOPPING_QNA Q
JOIN T_SHOPPING_MEMBER M ON Q.MEMBER_ID = M.MEMBER_ID
WHERE QNA_ID = 1;

SELECT
    Q.QNA_ID,
    I.FILENAME,
    Q.QNA_TITLE,
    M.MEMBER_NAME,
    Q.QNA_DATE
FROM
    T_SHOPPING_QNA Q
    JOIN T_SHOPPING_GOODS G ON Q.GOODS_ID = G.GOODS_ID
    JOIN T_SHOPPING_MEMBER M ON Q.MEMBER_ID = M.MEMBER_ID
    JOIN T_GOODS_DETAIL_IMAGE I ON G.GOODS_ID = I.GOODS_ID
WHERE I.FILETYPE = 'main_image';

select q.qna_id, m.member_name, q.qna_title, q.qna_content, q.filename, q.qna_comment from t_shopping_qna q
join t_shopping_member m on q.member_id = m.member_id 
where qna_id=1;
            
SELECT * FROM T_SHOPPING_QNA WHERE qna_id = 4;
SELECT * FROM T_SHOPPING_QNA WHERE
qna_title like '%'||''||'%' OR
qna_content like '%'||''||'%'
order by qna_id desc;

SELECT * FROM (
    SELECT temp_table.*, ROWNUM AS rnum FROM (
        SELECT Q.QNA_ID, I.FILENAME, Q.QNA_TITLE, M.MEMBER_NAME, Q.QNA_DATE, G.GOODS_ID
        FROM T_SHOPPING_QNA Q
        JOIN T_SHOPPING_GOODS G ON Q.GOODS_ID = G.GOODS_ID
        JOIN T_SHOPPING_MEMBER M ON Q.MEMBER_ID = M.MEMBER_ID
        JOIN T_GOODS_DETAIL_IMAGE I ON G.GOODS_ID = I.GOODS_ID
        WHERE I.FILETYPE = 'main_image'
        ORDER BY Q.QNA_ID DESC
    ) temp_table ) WHERE RNUM BETWEEN 1 AND 10;

commit;