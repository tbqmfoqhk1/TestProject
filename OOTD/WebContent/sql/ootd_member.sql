/* 먼저 HR 스키마에 member 테이블 생성한다.
 * 아래의 회원 데이터를 member 테이블에 추가한다.
 **/
DROP TABLE ootd_member;
CREATE TABLE ootd_member(
    m_no NUMBER PRIMARY KEY,
	m_id VARCHAR2(100)  NOT NULL,
	m_name VARCHAR2(20) NOT NULL,
	m_pass VARCHAR2(15) NOT NULL,
	m_phone NUMBER(13) NOT NULL,
	m_age NUMBER NOT NULL,
	m_gender VARCHAR2(5 CHAR) NOT NULL
);
DROP SEQUENCE ootd_member_seq;
CREATE SEQUENCE ootd_member_seq;

INSERT INTO ootd_member VALUES(ootd_member_seq.NEXTVAL, 'midas', '홍길동', '1234', 
	 01012345678, 23, '남자');
INSERT INTO ootd_member VALUES(ootd_member_seq.NEXTVAL,'abc', '김길동', '1234', 
	 01012345678, 24, '여자');
INSERT INTO ootd_member VALUES(ootd_member_seq.NEXTVAL,'def', '박길동', '1234', 
	 01012345678, 25, '남자');
INSERT INTO ootd_member VALUES(ootd_member_seq.NEXTVAL,'hig', '이길동', '1234', 
	 01012345678, 26, '여자');
INSERT INTO ootd_member VALUES(ootd_member_seq.NEXTVAL,'qwe', '최길동', '1234', 
	 01012345678, 27, '남자');

commit;
SELECT * FROM ootd_member;
