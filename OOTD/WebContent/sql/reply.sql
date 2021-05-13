

DROP TABLE reply;
CREATE TABLE reply(
	no NUMBER(7) PRIMARY KEY,
	list_no NUMBER(7) NOT NULL,
	reply VARCHAR2(500 CHAR),
	writer VARCHAR2(20 CHAR) NOT NULL,
	reg_date TIMESTAMP NOT NULL,	
	CONSTRAINT reply_fk FOREIGN KEY(list_no) REFERENCES ootdlist(list_no)
);

-- 댓글 테이블의 시퀀스
DROP SEQUENCE reply_seq;
CREATE SEQUENCE reply_seq
      MAXVALUE 9999999
      INCREMENT BY 1      
      NOCACHE
      NOORDER
      NOCYCLE;


-- 댓글 데이터 추가하기 - 1번만 실행 한다. --
INSERT INTO reply(no, list_no, reply, writer, reg_date)VALUES(reply_seq.NEXTVAL, 1, '항상 감사합니다.' || CHR(13) || CHR(10) || ' 땡큐!~', 'midas', '2016-05-08 13:44:32');
INSERT INTO reply(no, list_no, reply, writer, reg_date)VALUES(reply_seq.NEXTVAL, 1, '저두 감사드립니다.', 'servlet', '2016-05-09 05:24:57');
INSERT INTO reply(no, list_no, reply, writer, reg_date)VALUES(reply_seq.NEXTVAL, 2, '저두요~ ^_^', 'midas', '2016-05-09 09:19:23');
INSERT INTO reply(no, list_no, reply, writer, reg_date)VALUES(reply_seq.NEXTVAL, 3, '나두 관심이 많은뎅~', 'servlet', '2016-05-09 11:54:45');
INSERT INTO reply(no, list_no, reply, writer, reg_date)VALUES(reply_seq.NEXTVAL, 4, '헤헷~ 감사 합니다.', 'admin', '2016-05-09 12:16:51');
INSERT INTO reply(no, list_no, reply, writer, reg_date)VALUES(reply_seq.NEXTVAL, 4, '아~ 다들 이 사이트가 잘되길 바라는 군요', 'midas', '2016-05-09 13:34:11');
INSERT INTO reply(no, list_no, reply, writer, reg_date)VALUES(reply_seq.NEXTVAL, 4, '관리자님께서 워낙 신경을 쓰시니...' || CHR(13) || CHR(10) || '잘될 겁니다. ', 'servlet', '2016-05-09 14:03:37');
INSERT INTO reply(no, list_no, reply, writer, reg_date)VALUES(reply_seq.NEXTVAL, 4, '저두 사이트 발전에 관심이 많습니다.' || CHR(13) || CHR(10) || '감사합니다.' , 'midas', '2016-05-09 14:39:29');
INSERT INTO reply(no, list_no, reply, writer, reg_date)VALUES(reply_seq.NEXTVAL, 2, '와~ 대단하네요 우리 사이트~' || CHR(13) || CHR(10) || 'ㅋㅋㅋ~', 'servlet', '2016-05-09 14:41:18');
INSERT INTO reply(no, list_no, reply, writer, reg_date)VALUES(reply_seq.NEXTVAL, 2, '우리 관리자님이 워낙 열심이시라~' || CHR(13) || CHR(10) || '그리고 회원님들도 열성으로 사이트에 충성 접속하시니...'|| CHR(13) || CHR(10) ||' 않될 수가 있나요...^_^', 'admin', '2016-05-09 14:52:48');
INSERT INTO reply(no, list_no, reply, writer, reg_date)VALUES(reply_seq.NEXTVAL, 2, '네 맞아요~', 'admin', '2016-05-10 15:42:12');
INSERT INTO reply(no, list_no, reply, writer, reg_date)VALUES(reply_seq.NEXTVAL, 5, '그렇죠 그렇고 말구요', 'servlet', '2016-05-11 15:44:57');
INSERT INTO reply(no, list_no, reply, writer, reg_date)VALUES(reply_seq.NEXTVAL, 5, '항상 감사합니다.', 'midas', '2016-05-15 16:19:23');
INSERT INTO reply(no, list_no, reply, writer, reg_date)VALUES(reply_seq.NEXTVAL, 5, '땡큐!~', 'servlet', '2016-05-16 17:31:45');
INSERT INTO reply(no, list_no, reply, writer, reg_date)VALUES(reply_seq.NEXTVAL, 5, '저두요~ 땡큐!~', 'servlet', '2016-05-19 18:16:51');
INSERT INTO reply(no, list_no, reply, writer, reg_date)VALUES(reply_seq.NEXTVAL, 2, '모두들 열성이네요~' || CHR(13) || CHR(10) || '헤헤~' || CHR(13) || CHR(10) || '땡큐!~', 'admin', '2016-05-20 10:34:11');
INSERT INTO reply(no, list_no, reply, writer, reg_date)VALUES(reply_seq.NEXTVAL, 1, '땡큐~ 여기 붙어라~ ^_^', 'midas', '2016-05-20 11:33:27');
INSERT INTO reply(no, list_no, reply, writer, reg_date)VALUES(reply_seq.NEXTVAL, 5, '땡큐~ 붙었어요~', 'admin', '2016-05-20 13:19:59');
INSERT INTO reply(no, list_no, reply, writer, reg_date)VALUES(reply_seq.NEXTVAL, 5, '당연 회원이면 관심 가져야죠~', 'servlet', '2016-06-10 13:41:17');
INSERT INTO reply(no, list_no, reply, writer, reg_date)VALUES(reply_seq.NEXTVAL, 1, '동감 합니다.' || CHR(13) || CHR(10) ||' 땡큐!~', 'midas', '2016-06-12 14:52:48');

commit;
SELECT * FROM reply;

















