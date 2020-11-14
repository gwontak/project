package com.pinmall.domain;

public class OrderDetailVO {

	private int odr_code;
	private int pdt_nb;
	private int odr_amount;
	private int odr_price;
	private String memt_id;
	
	public int getOdr_code() {
		return odr_code;
	}
	public void setOdr_code(int odr_code) {
		this.odr_code = odr_code;
	}
	public int getPdt_nb() {
		return pdt_nb;
	}
	public void setPdt_nb(int pdt_nb) {
		this.pdt_nb = pdt_nb;
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
	public String getMemt_id() {
		return memt_id;
	}
	public void setMemt_id(String memt_id) {
		this.memt_id = memt_id;
	}
	
	@Override
	public String toString() {
		return "OrderDetailVO [odr_code=" + odr_code + ", pdt_nb=" + pdt_nb + ", odr_amount=" + odr_amount
				+ ", odr_price=" + odr_price + ", memt_id=" + memt_id + "]";
	}
	

	
}
