package com.pinmall.domain;

public class AdOrderListVO {

	//관리자 주문관리를 위한 VO
	private int odr_code;
	private int odr_ph;
	private String odr_name;
	private String odr_zipcode;
	private String odr_add;
	private	String odr_dadd;
	private String pdt_img;
	private String pdt_name;
	private String odr_totalby;
	private String odr_date;
	
	public int getOdr_code() {
		return odr_code;
	}
	public void setOdr_code(int odr_code) {
		this.odr_code = odr_code;
	}
	public int getOdr_ph() {
		return odr_ph;
	}
	public void setOdr_ph(int odr_ph) {
		this.odr_ph = odr_ph;
	}
	public String getOdr_name() {
		return odr_name;
	}
	public void setOdr_name(String odr_name) {
		this.odr_name = odr_name;
	}
	public String getOdr_zipcode() {
		return odr_zipcode;
	}
	public void setOdr_zipcode(String odr_zipcode) {
		this.odr_zipcode = odr_zipcode;
	}
	public String getOdr_add() {
		return odr_add;
	}
	public void setOdr_add(String odr_add) {
		this.odr_add = odr_add;
	}
	public String getOdr_dadd() {
		return odr_dadd;
	}
	public void setOdr_dadd(String odr_dadd) {
		this.odr_dadd = odr_dadd;
	}
	public String getPdt_img() {
		return pdt_img;
	}
	public void setPdt_img(String pdt_img) {
		this.pdt_img = pdt_img;
	}
	public String getPdt_name() {
		return pdt_name;
	}
	public void setPdt_name(String pdt_name) {
		this.pdt_name = pdt_name;
	}
	public String getOdr_date() {
		return odr_date;
	}
	public void setOdr_date(String odr_date) {
		this.odr_date = odr_date;
	}
	public String getOdr_totalby() {
		return odr_totalby;
	}
	public void setOdr_totalby(String odr_totalby) {
		this.odr_totalby = odr_totalby;
	}
	
	@Override
	public String toString() {
		return "AdOrderListVO [odr_code=" + odr_code + ", odr_ph=" + odr_ph + ", odr_name=" + odr_name
				+ ", odr_zipcode=" + odr_zipcode + ", odr_add=" + odr_add + ", odr_dadd=" + odr_dadd + ", pdt_img="
				+ pdt_img + ", pdt_name=" + pdt_name + ", odr_totalby=" + odr_totalby + ", odr_date=" + odr_date + "]";
	}
	
	
	
	
	
}
