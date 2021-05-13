DROP TABLE bookmark;
CREATE TABLE bookmark(
  no NUMBER PRIMARY KEY,
  ootd_no NUMBER,
  m_id VARCHAR2(20 CHAR) NOT NULL,
  state NUMBER DEFAULT 0
);

DROP SEQUENCE bookmark_seq;
CREATE SEQUENCE bookmark_seq;

-- 페이징 처리와 댓글 처리를 위해서 아래 SQL 쿼리를 COMMIT까지 5번 실행 한다. 
-- 주의 : 99번과 100번 게시 글을 댓글(reply) 테이블에서 참조하고 있음
INSERT INTO bookmark (no, ootd_no, m_id, state) VALUES (bookmark_seq.NEXTVAL, 22, 'midas', 1);
INSERT INTO bookmark (no, ootd_no, m_id, state) VALUES (bookmark_seq.NEXTVAL, 22, 'abc', 1);
INSERT INTO bookmark (no, ootd_no, m_id, state) VALUES (bookmark_seq.NEXTVAL, 22, 'def', 1);
INSERT INTO bookmark (no, ootd_no, m_id, state) VALUES (bookmark_seq.NEXTVAL, 22, 'hig', 0);
INSERT INTO bookmark (no, ootd_no, m_id, state) VALUES (bookmark_seq.NEXTVAL, 22, 'qwe', 1);
COMMIT;

SELECT * FROM bookmark;