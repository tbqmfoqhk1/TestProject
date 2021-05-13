package com.ootd.project.dao;

// Oracle과 MySQL 접속 정보를 저장하는 클래스
public class DBConnectionInfo {	
	public static final String ORACLE_URL = "jdbc:oracle:thin:@localhost:1521:xe";
	public static final String ORACLE_USER = "hr";
	public static final String ORACLE_PASS = "hr";	
	
	public static final String MYSQL_URL = "jdbc:mysql://localhost:3306/ajax";
	public static final String MYSQL_USER = "root";
	public static final String MYSQL_PASS = "12345678";
}
