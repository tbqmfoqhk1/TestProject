 
 -- 글 번호, 회원ID, 회원 나이, 글 등록날짜, 날씨, 온도, 사진, 글정보, 좋아요 갯수, 댓글 수
-- list_no, member_id, member_age, reg_date, weather, temp, img, content, thanks, comment
DROP TABLE favariteList;
CREATE TABLE favariteList(
  no NUMBER PRIMARY KEY,
  ootd_no NUMBER,
  m_id VARCHAR2(20 CHAR) NOT NULL,
  state NUMBER DEFAULT 0
);

DROP SEQUENCE favariteList_seq;
CREATE SEQUENCE favariteList_seq;

-- 페이징 처리와 댓글 처리를 위해서 아래 SQL 쿼리를 COMMIT까지 5번 실행 한다. 
-- 주의 : 99번과 100번 게시 글을 댓글(reply) 테이블에서 참조하고 있음
INSERT INTO favariteList (no, ootd_no, m_no, state) VALUES (favariteList_seq.NEXTVAL, 22, 'midas', 1);
INSERT INTO favariteList (no, ootd_no, m_no, state) VALUES (favariteList_seq.NEXTVAL, 22, 'abc', 1);
INSERT INTO favariteList (no, ootd_no, m_no, state) VALUES (favariteList_seq.NEXTVAL, 22, 'def', 1);
INSERT INTO favariteList (no, ootd_no, m_no, state) VALUES (favariteList_seq.NEXTVAL, 22, 'hig', 0);
INSERT INTO favariteList (no, ootd_no, m_no, state) VALUES (favariteList_seq.NEXTVAL, 22, 'qwe', 1);
COMMIT;

SELECT * FROM favariteList;
SELECT * FROM ootd_member;
