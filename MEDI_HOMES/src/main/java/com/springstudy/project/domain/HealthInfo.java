package com.springstudy.project.domain;

public class HealthInfo {
	private int no;
	private String titles;
	private String contents;
	private String img;
	
	public HealthInfo() {}
	public HealthInfo(int no, String titles, String contents, String img) {
		
		this.no = no;
		this.titles = titles;
		this.contents = contents;
		this.img = img;
	}
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getTitles() {
		return titles;
	}
	public void setTitles(String titles) {
		this.titles = titles;
	}
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}
	public String getImg() {
		return img;
	}
	public void setImg(String img) {
		this.img = img;
	}
	
}


