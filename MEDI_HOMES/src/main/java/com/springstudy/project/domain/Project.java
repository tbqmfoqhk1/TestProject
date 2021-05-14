package com.springstudy.project.domain;

public class Project {
	private int no;
	private String area;
	private String name;
	private String disease;
	private String grade;
	private String lat;
	private String log;
	private String img;
	
	public Project() {}
	public Project(int no, String area, String name, String disease,
			String grade, String lat, String log, String img) {
		
		this.no = no;
		this.area = area;
		this.name = name;
		this.disease = disease;
		this.grade = grade;
		this.lat = lat;
		this.log = log;
		this.img = img;
	}
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getArea() {
		return area;
	}
	public void setArea(String area) {
		this.area = area;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getDisease() {
		return disease;
	}
	public void setDisease(String disease) {
		this.disease = disease;
	}
	public String getGrade() {
		return grade;
	}
	public void setGrade(String grade) {
		this.grade = grade;
	}
	public String getLat() {
		return lat;
	}
	public void setLat(String lat) {
		this.lat = lat;
	}
	public String getLog() {
		return log;
	}
	public void setLog(String log) {
		this.log = log;
	}
	public String getImg() {
		return img;
	}
	public void setImg(String img) {
		this.img = img;
	}
}


