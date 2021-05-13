package com.ootd.project.vo;

import java.sql.Timestamp;

public class Board {

	// list_no, mem_id, mem_age, regDate, weather, temp, img, content, thanks
	private int list_no;
	private String m_id;
	private int m_age;
	private Timestamp list_reg_date;	
	private String list_weather;
	private String list_temp;
	private String list_img;
	private String list_content;
	private String list_hash;
	private int list_thanks;
	
	public Board() { }
	public Board(int list_no, String m_id, int m_age, Timestamp list_reg_date,
			String list_weather, String list_temp, String list_img, String list_content, String list_hash,int list_thanks) {
		this.list_no = list_no;
		this.m_id = m_id;
		this.m_age = m_age;
		this.list_reg_date = list_reg_date;
		this.list_weather = list_weather;		
		this.list_temp = list_temp;
		this.list_img = list_img;
		this.list_content = list_content;
		this.list_hash = list_hash;
		this.list_thanks = list_thanks;
	}
	public int getList_no() {
		return list_no;
	}
	public void setList_no(int list_no) {
		this.list_no = list_no;
	}
	public String getM_id() {
		return m_id;
	}
	public void setM_id(String m_id) {
		this.m_id = m_id;
	}
	public int getM_age() {
		return m_age;
	}
	public void setM_age(int m_age) {
		this.m_age = m_age;
	}
	public String getList_weather() {
		return list_weather;
	}
	public void setList_weather(String list_weather) {
		this.list_weather = list_weather;
	}
	public String getList_temp() {
		return list_temp;
	}
	public void setList_temp(String list_temp) {
		this.list_temp = list_temp;
	}
	public Timestamp getList_reg_date() {
		return list_reg_date;
	}
	public void setList_reg_date(Timestamp list_reg_date) {
		this.list_reg_date = list_reg_date;
	}
	public String getList_img() {
		return list_img;
	}
	public void setList_img(String list_img) {
		this.list_img = list_img;
	}
	public String getList_content() {
		return list_content;
	}
	public void setList_content(String list_content) {
		this.list_content = list_content;
	}
	public String getList_hash() {
		return list_hash;
	} 
	public void setList_hash(String list_hash) {
		this.list_hash=list_hash;
	}
	public int getList_thanks() {
		return list_thanks;
	}
	public void setList_thanks(int list_thanks) {
		this.list_thanks = list_thanks;
	}
	
	
}
