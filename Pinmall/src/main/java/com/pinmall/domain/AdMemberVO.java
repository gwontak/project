package com.pinmall.domain;

import java.util.Date;

public class AdMemberVO {

	private String memt_id;
	private String memt_name;
	private String memt_sname;
	private String memt_accept_e;
	private Date   memt_joined;
	private Date   memt_lasttime;
	
	public String getMemt_id() {
		return memt_id;
	}
	public void setMemt_id(String memt_id) {
		this.memt_id = memt_id;
	}
	public String getMemt_name() {
		return memt_name;
	}
	public void setMemt_name(String memt_name) {
		this.memt_name = memt_name;
	}
	public String getMemt_sname() {
		return memt_sname;
	}
	public void setMemt_sname(String memt_sname) {
		this.memt_sname = memt_sname;
	}
	public String getMemt_accept_e() {
		return memt_accept_e;
	}
	public void setMemt_accept_e(String memt_accept_e) {
		this.memt_accept_e = memt_accept_e;
	}
	public Date getMemt_joined() {
		return memt_joined;
	}
	public void setMemt_joined(Date memt_joined) {
		this.memt_joined = memt_joined;
	}
	public Date getMemt_lasttime() {
		return memt_lasttime;
	}
	public void setMemt_lasttime(Date memt_lasttime) {
		this.memt_lasttime = memt_lasttime;
	}
	
	@Override
	public String toString() {
		return "AdMemberVO [memt_id=" + memt_id + ", memt_name=" + memt_name + ", memt_sname=" + memt_sname
				+ ", memt_accept_e=" + memt_accept_e + ", memt_joined=" + memt_joined + ", memt_lasttime="
				+ memt_lasttime + "]";
	}
	
	
	
}
