package com.pinmall.domain;

public class OrderDetailViewVO {
	
	private int	odr_amount;  
	private int pdt_nb;     
	private int pdt_price; 
	private int odr_price;
	private String pdt_img;
	private String pdt_name;  
	
	public int getOdr_amount() {
		return odr_amount;
	}
	public void setOdr_amount(int odr_amount) {
		this.odr_amount = odr_amount;
	}
	public int getPdt_nb() {
		return pdt_nb;
	}
	public void setPdt_nb(int pdt_nb) {
		this.pdt_nb = pdt_nb;
	}
	public String getPdt_name() {
		return pdt_name;
	}
	public void setPdt_name(String pdt_name) {
		this.pdt_name = pdt_name;
	}
	public int getPdt_price() {
		return pdt_price;
	}
	public void setPdt_price(int pdt_price) {
		this.pdt_price = pdt_price;
	}
	public String getPdt_img() {
		return pdt_img;
	}
	public void setPdt_img(String pdt_img) {
		this.pdt_img = pdt_img;
	}
	public int getOdr_price() {
		return odr_price;
	}
	public void setOdr_price(int odr_price) {
		this.odr_price = odr_price;
	}
	
	@Override
	public String toString() {
		return "OrderDetailViewVO [odr_amount=" + odr_amount + ", pdt_nb=" + pdt_nb + ", pdt_name=" + pdt_name
				+ ", pdt_price=" + pdt_price + ", pdt_img=" + pdt_img + ", odr_price=" + odr_price + "]";
	} 
	
	
	
	
}
