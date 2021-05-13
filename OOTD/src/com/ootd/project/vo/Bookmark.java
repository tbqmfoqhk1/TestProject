package com.ootd.project.vo;


public class Bookmark {

		private int no;
		private int ootdNo;
		private String mId;
		private int state;
		private int listNo;
		private String listImg;
		
		public Bookmark() { }
		
		public Bookmark(int no, int ootdNo, String mId, int state, int listNo, String listImg) {
			this.no = no;
			this.ootdNo = ootdNo;
			this.mId = mId;
			this.state = state;
			this.listNo = listNo;
			this.listImg = listImg;
		}

		public int getNo() {
			return no;
		}

		public void setNo(int no) {
			this.no = no;
		}

		public int getOotdNo() {
			return ootdNo;
		}

		public void setOotdNo(int ootdNo) {
			this.ootdNo = ootdNo;
		}

		public String getmId() {
			return mId;
		}

		public void setmId(String mId) {
			this.mId = mId;
		}

		public int getState() {
			return state;
		}

		public void setState(int state) {
			this.state = state;
		}

		public int getListNo() {
			return listNo;
		}

		public void setListNo(int listNo) {
			this.listNo = listNo;
		}

		public String getListImg() {
			return listImg;
		}

		public void setListImg(String listImg) {
			this.listImg = listImg;
		}
		
	}
