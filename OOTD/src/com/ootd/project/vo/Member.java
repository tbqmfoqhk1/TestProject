package com.ootd.project.vo;

// 회원 한 명의 정보를 저장하는 VO(Value Object) 클래스
public class Member {
	
	private int id;
	private String word;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getWord() {
		return word;
	}
	public void setWord(String word) {
		this.word = word;
	}
}
