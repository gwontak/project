package com.pinmall.domain;

public class CartVO {
	
	 private int Cart_code;						
	 private int cart_amount;	
	 private String memt_id;
	 private int pdt_nb;
	 
	public int getCart_code() {
		return Cart_code;
	}
	public void setCart_code(int cart_code) {
		Cart_code = cart_code;
	}
	public int getCart_amount() {
		return cart_amount;
	}
	public void setCart_amount(int cart_amount) {
		this.cart_amount = cart_amount;
	}
	public String getMemt_id() {
		return memt_id;
	}
	public void setMemt_id(String memt_id) {
		this.memt_id = memt_id;
	}
	public int getPdt_nb() {
		return pdt_nb;
	}
	public void setPdt_nb(int pdt_nb) {
		this.pdt_nb = pdt_nb;
	}
	
	@Override
	public String toString() {
		return "CartVO [Cart_code=" + Cart_code + ", cart_amount=" + cart_amount + ", memt_id=" + memt_id + ", pdt_nb="
				+ pdt_nb + "]";
	}
 

	
 

}
