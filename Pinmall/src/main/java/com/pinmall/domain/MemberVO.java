package com.pinmall.domain;

import java.util.Date;

public class MemberVO {

	private String memt_id;  		//아이디     
	private String memt_name; 	    //이름
	private String memt_pw;  	    //비밀번호
	private String memt_zipcode;    //우편번호
	private String memt_add; 		//기본주소
	private String memt_dadd;   	//상세주소
	private String memt_ph;    		//전화번호
	private String memt_sname;  	//닉네임
	private String memt_em; 		//이메일 
	private String memt_accept_e;   //이메일 수신여부
	private Date memt_joined; 		//가입일
	private Date memt_update; 		//수정링
	private Date  memt_lasttime;	//최근 접속시간
	
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
	public String getMemt_pw() {
		return memt_pw;
	}
	public void setMemt_pw(String memt_pw) {
		this.memt_pw = memt_pw;
	}
	public String getMemt_zipcode() {
		return memt_zipcode;
	}
	public void setMemt_zipcode(String memt_zipcode) {
		this.memt_zipcode = memt_zipcode;
	}
	public String getMemt_add() {
		return memt_add;
	}
	public void setMemt_add(String memt_add) {
		this.memt_add = memt_add;
	}
	public String getMemt_dadd() {
		return memt_dadd;
	}
	public void setMemt_dadd(String memt_dadd) {
		this.memt_dadd = memt_dadd;
	}
	public String getMemt_ph() {
		return memt_ph;
	}
	public void setMemt_ph(String memt_ph) {
		this.memt_ph = memt_ph;
	}
	public String getMemt_sname() {
		return memt_sname;
	}
	public void setMemt_sname(String memt_sname) {
		this.memt_sname = memt_sname;
	}
	public String getMemt_em() {
		return memt_em;
	}
	public void setMemt_em(String memt_em) {
		this.memt_em = memt_em;
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
	public Date getMemt_update() {
		return memt_update;
	}
	public void setMemt_update(Date memt_update) {
		this.memt_update = memt_update;
	}
	public Date getMemt_lasttime() {
		return memt_lasttime;
	}
	public void setMemt_lasttime(Date memt_lasttime) {
		this.memt_lasttime = memt_lasttime;
	}
	
	@Override
	public String toString() {
		return "MemberVO [memt_id=" + memt_id + ", memt_name=" + memt_name + ", memt_pw=" + memt_pw + ", memt_zipcode="
				+ memt_zipcode + ", memt_add=" + memt_add + ", memt_dadd=" + memt_dadd + ", memt_ph=" + memt_ph
				+ ", memt_sname=" + memt_sname + ", memt_em=" + memt_em + ", memt_accept_e=" + memt_accept_e
				+ ", memt_joined=" + memt_joined + ", memt_update=" + memt_update
				+ ", memt_lasttime=" + memt_lasttime + "]";
	}
	
	

	
	
}
