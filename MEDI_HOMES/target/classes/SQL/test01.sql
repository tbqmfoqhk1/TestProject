use spring;
use MYSQL;
create database test;
drop database test;
DROP TABLE IF EXISTS test01;

CREATE TABLE IF NOT EXISTS test01(	
	no INT(10) primary key,
	area VARCHAR(20) NOT NULL,
	name VARCHAR(100) NOT NULL,
	disease VARCHAR(20) NOT NULL,
    grade VARCHAR(20) NOT NULL,
	lat VARCHAR(100) NOT NULL,
    log VARCHAR(100) NOT NULL,
    img VARCHAR(100) NOT NULL
)ENGINE=InnoDB DEFAULT CHARSET=utf8;
DESC test01;

SELECT * FROM test01
WHERE disease = '당뇨병';