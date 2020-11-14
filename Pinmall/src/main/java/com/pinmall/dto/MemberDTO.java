package com.pinmall.dto;

import java.util.Date;

public class MemberDTO {

	private String memt_id;
	private String memt_pw;
	private String memt_sname;
	private String memt_point;
	private Date memt_lasttime;
	
	public String getMemt_id() {
		return memt_id;
	}
	public void setMemt_id(String memt_id) {
		this.memt_id = memt_id;
	}
	public String getMemt_pw() {
		return memt_pw;
	}
	public void setMemt_pw(String memt_pw) {
		this.memt_pw = memt_pw;
	}
	public String getMemt_sname() {
		return memt_sname;
	}
	public void setMemt_sname(String memt_sname) {
		this.memt_sname = memt_sname;
	}
	public String getMemt_point() {
		return memt_point;
	}
	public void setMemt_point(String memt_point) {
		this.memt_point = memt_point;
	}
	public Date getMemt_lasttime() {
		return memt_lasttime;
	}
	public void setMemt_lasttime(Date memt_lasttime) {
		this.memt_lasttime = memt_lasttime;
	}
	
	@Override
	public String toString() {
		return "MemberDTO [memt_id=" + memt_id + ", memt_pw=" + memt_pw + ", memt_sname=" + memt_sname + ", memt_point="
				+ memt_point + ", memt_lasttime=" + memt_lasttime + "]";
	}


	
}