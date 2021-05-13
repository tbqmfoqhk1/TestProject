 
 -- 글 번호, 회원ID, 회원 나이, 글 등록날짜, 날씨, 온도, 사진, 글정보, 좋아요 갯수, 댓글 수
-- list_no, member_id, member_age, reg_date, weather, temp, img, content, thanks, comment
DROP TABLE ootdlist;
CREATE TABLE ootdlist(
  list_no NUMBER PRIMARY KEY,
  m_id VARCHAR2(20 CHAR) NOT NULL,
  m_age NUMBER(3),
  list_reg_date TIMESTAMP NOT NULL,
  list_weather VARCHAR2(20 CHAR) NOT NULL,
  list_temp VARCHAR2(20 CHAR) NOT NULL,
  list_img VARCHAR2(50 CHAR),
  list_content VARCHAR2(1000 CHAR) NOT NULL,
  list_hash VARCHAR2(1000 CHAR) NOT NULL,
  list_thanks NUMBER DEFAULT 0
);


DROP SEQUENCE ootd_seq;
CREATE SEQUENCE ootd_seq;



-- 페이징 처리와 댓글 처리를 위해서 아래 SQL 쿼리를 COMMIT까지 5번 실행 한다. 
-- 주의 : 99번과 100번 게시 글을 댓글(reply) 테이블에서 참조하고 있음
INSERT INTO ootdlist (list_no,m_id,m_age,list_reg_date,list_weather,list_temp,list_img,list_content,list_hash,list_thanks) VALUES (ootd_seq.NEXTVAL,'midas',23,'2016-04-27','맑음','20도','a5.JPG',
    '착용 옷'|| CHR(13) || CHR(10) || '버킷 햇'|| CHR(13) || CHR(10) ||'점퍼'|| CHR(13) || CHR(10) ||'풀오버 탑'|| CHR(13) || CHR(10) || '데님 진'|| CHR(13) || CHR(10) || '에어 조던' || CHR(13) || CHR(10) || ' |  생각보다 날씨가 더워서 힘들었습니다.', '#ootd/#데일리/#맑음',45);
INSERT INTO ootdlist (list_no,m_id,m_age,list_reg_date,list_weather,list_temp,list_img,list_content,list_hash,list_thanks) VALUES (ootd_seq.NEXTVAL,'midas',23,'2016-04-27','맑음','20도','a6.JPG',
    '착용 옷'|| CHR(13) || CHR(10) || '버킷 햇'|| CHR(13) || CHR(10) ||'점퍼'|| CHR(13) || CHR(10) ||'풀오버 탑'|| CHR(13) || CHR(10) || '데님 진'|| CHR(13) || CHR(10) || '에어 조던' || CHR(13) || CHR(10) || ' |  생각보다 날씨가 더워서 힘들었습니다.', '#ootd/#데일리/#맑음',45);
    INSERT INTO ootdlist (list_no,m_id,m_age,list_reg_date,list_weather,list_temp,list_img,list_content,list_hash,list_thanks) VALUES (ootd_seq.NEXTVAL,'midas',23,'2016-04-27','맑음','20도','b1.jpg',
    '착용 옷'|| CHR(13) || CHR(10) || '버킷 햇'|| CHR(13) || CHR(10) ||'점퍼'|| CHR(13) || CHR(10) ||'풀오버 탑'|| CHR(13) || CHR(10) || '데님 진'|| CHR(13) || CHR(10) || '에어 조던' || CHR(13) || CHR(10) || ' |  생각보다 날씨가 더워서 힘들었습니다.', '#ootd/#데일리/#맑음',45);
    INSERT INTO ootdlist (list_no,m_id,m_age,list_reg_date,list_weather,list_temp,list_img,list_content,list_hash,list_thanks) VALUES (ootd_seq.NEXTVAL,'midas',23,'2016-04-27','맑음','20도','b2.jpg',
    '착용 옷'|| CHR(13) || CHR(10) || '버킷 햇'|| CHR(13) || CHR(10) ||'점퍼'|| CHR(13) || CHR(10) ||'풀오버 탑'|| CHR(13) || CHR(10) || '데님 진'|| CHR(13) || CHR(10) || '에어 조던' || CHR(13) || CHR(10) || ' |  생각보다 날씨가 더워서 힘들었습니다.', '#ootd/#데일리/#맑음',45);

COMMIT;
SELECT * FROM ootdlist;
