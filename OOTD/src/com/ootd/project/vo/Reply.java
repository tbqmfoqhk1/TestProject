package com.ootd.project.vo;

import java.sql.Timestamp;

public class Reply {

		private int no;
		private int list_no;
		private String reply;
		private String writer;
		private Timestamp reg_date;
		
		public Reply() { }
		
		public Reply(int list_no, String reply, String writer) {
			this.list_no = list_no;
			this.reply = reply;
			this.writer = writer;
		}
		
		public Reply(int no, int list_no, String reply, String writer, Timestamp reg_date) {
			this.no = no;
			this.list_no = list_no;
			this.reply = reply;
			this.writer = writer;
			this.reg_date = reg_date;
		}

		public int getNo() {
			return no;
		}

		public void setNo(int no) {
			this.no = no;
		}

		public int getList_no() {
			return list_no;
		}

		public void setList_no(int list_no) {
			this.list_no = list_no;
		}

		public String getReply() {
			return reply;
		}

		public void setReply(String reply) {
			this.reply = reply;
		}

		public String getWriter() {
			return writer;
		}

		public void setWriter(String writer) {
			this.writer = writer;
		}

		public Timestamp getReg_date() {
			return reg_date;
		}

		public void setReg_date(Timestamp reg_date) {
			this.reg_date = reg_date;
		}
		
		


	}
