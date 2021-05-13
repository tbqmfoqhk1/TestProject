--
--## Oracle 데이터베이스
DROP TABLE popular;
CREATE TABLE popular (
	id NUMBER PRIMARY KEY NOT NULL,
    word VARCHAR2(15) NOT NULL
    );

Drop SEQUENCE popular_seq;
CREATE SEQUENCE popular_seq;

INSERT INTO popular word VALUES (popular_seq.NEXTVAL,'레더 재킷');
INSERT INTO popular word VALUES (popular_seq.NEXTVAL,'레더 재킷');
INSERT INTO popular word VALUES (popular_seq.NEXTVAL,'레더 재킷');
INSERT INTO popular word VALUES (popular_seq.NEXTVAL,'레더 재킷');
INSERT INTO popular word VALUES (popular_seq.NEXTVAL,'레더 재킷');
INSERT INTO popular word VALUES (popular_seq.NEXTVAL,'레더 재킷');
INSERT INTO popular word VALUES (popular_seq.NEXTVAL,'블레이저');
INSERT INTO popular word VALUES (popular_seq.NEXTVAL,'블레이저');
INSERT INTO popular word VALUES (popular_seq.NEXTVAL,'블레이저');
INSERT INTO popular word VALUES (popular_seq.NEXTVAL,'블레이저');
INSERT INTO popular word VALUES (popular_seq.NEXTVAL,'블레이저');
INSERT INTO popular word VALUES (popular_seq.NEXTVAL,'ma-1');
INSERT INTO popular word VALUES (popular_seq.NEXTVAL,'ma-1');
INSERT INTO popular word VALUES (popular_seq.NEXTVAL,'ma-1');
INSERT INTO popular word VALUES (popular_seq.NEXTVAL,'ma-1');
INSERT INTO popular word VALUES (popular_seq.NEXTVAL,'꾸안꾸');
INSERT INTO popular word VALUES (popular_seq.NEXTVAL,'꾸안꾸');
INSERT INTO popular word VALUES (popular_seq.NEXTVAL,'꾸안꾸');
INSERT INTO popular word VALUES (popular_seq.NEXTVAL,'가디건');
INSERT INTO popular word VALUES (popular_seq.NEXTVAL,'가디건');
INSERT INTO popular word VALUES (popular_seq.NEXTVAL,'시티보이');
INSERT INTO popular word VALUES (popular_seq.NEXTVAL,'셔츠');
INSERT INTO popular word VALUES (popular_seq.NEXTVAL,'니트');
INSERT INTO popular word VALUES (popular_seq.NEXTVAL,'맨투맨');
INSERT INTO popular word VALUES (popular_seq.NEXTVAL,'청자켓');    
COMMIT;
SELECT word, COUNT(word) AS count FROM popular GROUP BY word ORDER BY count DESC;

SELECT * FROM (SELECT word, COUNT(word) AS count FROM popular GROUP BY word ORDER BY count DESC) WHERE NOT ROWNUM < 4 AND ROWNUM <= 10;
SELECT word, COUNT(word) AS count FROM popular GROUP BY word ORDER BY count DESC;

SELECT popular.*, ROWNUM R FROM popular;

SELECT word, COUNT(word) AS count FROM popular GROUP BY word ORDER BY count DESC;


SELECT ename 이름, job 직급, sal 급여
FROM emp
WHERE sal <= (SELECT MIN(sal) FROM emp);

SELECT popular.*, ROWNUM R FROM popular;
SELECT popular.*, ROWNUM R FROM popular;

SELECT * FROM (SELECT word, COUNT(word) AS count FROM popular GROUP BY word ORDER BY count DESC) WHERE ROWNUM < 6;