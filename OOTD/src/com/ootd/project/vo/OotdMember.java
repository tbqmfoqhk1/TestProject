package com.ootd.project.vo;

public class OotdMember {	
	
	// m_no, m_id, m_name, m_pass, m_mobile, m_age
	private int m_no;
	private String m_id;
	private String m_name;
	private String m_pass;	
	private int m_phone;
	private int m_age;
	private String m_gender;
		
	public OotdMember() { }
	public OotdMember(int m_no, String m_id, String m_name, String m_pass,
			int m_phone, int m_age, String m_gender) {
		this.m_no = m_no;
		this.m_id = m_id;
		this.m_name = m_name;
		this.m_pass = m_pass;
		this.m_phone = m_phone;		
		this.m_age = m_age;
		this.m_gender = m_gender;
	}
	public int getM_no() {
		return m_no;
	}
	public void setM_no(int m_no) {
		this.m_no = m_no;
	}
	public String getM_id() {
		return m_id;
	}
	public void setM_id(String m_id) {
		this.m_id = m_id;
	}
	public String getM_name() {
		return m_name;
	}
	public void setM_name(String m_name) {
		this.m_name = m_name;
	}
	public String getM_pass() {
		return m_pass;
	}
	public void setM_pass(String m_pass) {
		this.m_pass = m_pass;
	}
	public int getM_phone() {
		return m_phone;
	}
	public void setM_phone(int m_phone) {
		this.m_phone = m_phone;
	}
	public int getM_age() {
		return m_age;
	}
	public void setM_age(int m_age) {
		this.m_age = m_age;
	}
	public String getM_gender() {
		return m_gender;
	}
	public void setM_gender(String m_gender) {
		this.m_gender = m_gender;
	}
}
