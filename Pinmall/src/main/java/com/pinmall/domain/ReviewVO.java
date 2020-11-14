package com.pinmall.domain;

import java.util.Date;

public class ReviewVO {

   private int     rv_nb;          
   private String  memt_id;         
   private int     pdt_nb;            
   private String  rv_content;     
   private int 	   rv_score;
   private Date    rv_date;
   
	public int getRv_nb() {
		return rv_nb;
	}
	public void setRv_nb(int rv_nb) {
		this.rv_nb = rv_nb;
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
	public String getRv_content() {
		return rv_content;
	}
	public void setRv_content(String rv_content) {
		this.rv_content = rv_content;
	}
	public int getRv_score() {
		return rv_score;
	}
	public void setRv_score(int rv_score) {
		this.rv_score = rv_score;
	}
	public Date getRv_date() {
		return rv_date;
	}
	public void setRv_date(Date rv_date) {
		this.rv_date = rv_date;
	}
	
	@Override
	public String toString() {
		return "ReviewVO [rv_nb=" + rv_nb + ", memt_id=" + memt_id + ", pdt_nb=" + pdt_nb + ", rv_content="
				+ rv_content + ", rv_score=" + rv_score + ", rv_date=" + rv_date + "]";
	}
   
   
   
}
