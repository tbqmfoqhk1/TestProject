package com.springstudy.project.domain;

public class Disease {
	private int no;
	private String type;
	private String data1;
	private String case1;
	private String case2;
	private String case3;
	private String case4;
	private String img;
	
	public Disease() {}
	public Disease(int no, String type, String data1, String case1,
			String case2, String case3, String case4, String img) {
		
		this.no = no;
		this.type = type;
		this.data1 = data1;
		this.case1 = case1;
		this.case2 = case2;
		this.case3 = case3;
		this.case4 = case4;
		this.img = img;
	}
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getData1() {
		return data1;
	}
	public void setData1(String data1) {
		this.data1 = data1;
	}
	public String getCase1() {
		return case1;
	}
	public void setCase1(String case1) {
		this.case1 = case1;
	}
	public String getCase2() {
		return case2;
	}
	public void setCase2(String case2) {
		this.case2 = case2;
	}
	public String getCase3() {
		return case3;
	}
	public void setCase3(String case3) {
		this.case3 = case3;
	}
	public String getCase4() {
		return case4;
	}
	public void setCase4(String case4) {
		this.case4 = case4;
	}
	public String getImg() {
		return img;
	}
	public void setImg(String img) {
		this.img = img;
	}
		
}


