package com.pinmall.domain;

import java.util.Date;

public class OrderListVO {
	
	private String pdt_img;
	private String pdt_name;
	private int odr_code;
	private int odr_amount;
	private int odr_price;
	private int pdt_nb;
	private Date odr_date;
	
	
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
	public int getOdr_code() {
		return odr_code;
	}
	public void setOdr_code(int odr_code) {
		this.odr_code = odr_code;
	}
	public int getOdr_amount() {
		return odr_amount;
	}
	public void setOdr_amount(int odr_amount) {
		this.odr_amount = odr_amount;
	}
	public int getOdr_price() {
		return odr_price;
	}
	public void setOdr_price(int odr_price) {
		this.odr_price = odr_price;
	}
	public int getPdt_nb() {
		return pdt_nb;
	}
	public void setPdt_nb(int pdt_nb) {
		this.pdt_nb = pdt_nb;
	}
	public Date getOdr_date() {
		return odr_date;
	}
	public void setOdr_date(Date odr_date) {
		this.odr_date = odr_date;
	}
	
	@Override
	public String toString() {
		return "OrderListVO [pdt_img=" + pdt_img + ", pdt_name=" + pdt_name + ", odr_code=" + odr_code + ", odr_amount="
				+ odr_amount + ", odr_price=" + odr_price + ", pdt_nb=" + pdt_nb + ", odr_date=" + odr_date + "]";
	}
	
	

}
