package com.pinmall.domain;

public class CartProductVO {

	
	private int		cart_code;						
	private int 	cart_amount;	
	private int 	pdt_nb;
	private String  pdt_name;
	private int     pdt_price;
	private int     pdt_dc;
	private String  pdt_img;
	
	public int getCart_code() {
		return cart_code;
	}
	public void setCart_code(int cart_code) {
		this.cart_code = cart_code;
	}
	public int getCart_amount() {
		return cart_amount;
	}
	public void setCart_amount(int cart_amount) {
		this.cart_amount = cart_amount;
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
	public int getPdt_dc() {
		return pdt_dc;
	}
	public void setPdt_dc(int pdt_dc) {
		this.pdt_dc = pdt_dc;
	}
	public String getPdt_img() {
		return pdt_img;
	}
	public void setPdt_img(String pdt_img) {
		this.pdt_img = pdt_img;
	}
	
	@Override
	public String toString() {
		return "CartProductVO [cart_code=" + cart_code + ", cart_amount=" + cart_amount + ", pdt_nb=" + pdt_nb
				+ ", pdt_name=" + pdt_name + ", pdt_price=" + pdt_price + ", pdt_dc=" + pdt_dc + ", pdt_img=" + pdt_img
				+ "]";
	}
	
	
	
}
