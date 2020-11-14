package com.pinmall.domain;

import java.util.Date;

public class BoardVO {

   private int brd_nb;      
   private String ment_id;     
   private String brd_titel;  
   private String bdr_content;
   private Date bdr_date;
   
	public int getBrd_nb() {
		return brd_nb;
	}
	public void setBrd_nb(int brd_nb) {
		this.brd_nb = brd_nb;
	}
	public String getMent_id() {
		return ment_id;
	}
	public void setMent_id(String ment_id) {
		this.ment_id = ment_id;
	}
	public String getBrd_titel() {
		return brd_titel;
	}
	public void setBrd_titel(String brd_titel) {
		this.brd_titel = brd_titel;
	}
	public String getBdr_content() {
		return bdr_content;
	}
	public void setBdr_content(String bdr_content) {
		this.bdr_content = bdr_content;
	}
	public Date getBdr_date() {
		return bdr_date;
	}
	public void setBdr_date(Date bdr_date) {
		this.bdr_date = bdr_date;
	}
	
	@Override
	public String toString() {
		return "BoardVO [brd_nb=" + brd_nb + ", ment_id=" + ment_id + ", brd_titel=" + brd_titel + ", bdr_content="
				+ bdr_content + ", bdr_date=" + bdr_date + "]";
	}
   
   
   
}
