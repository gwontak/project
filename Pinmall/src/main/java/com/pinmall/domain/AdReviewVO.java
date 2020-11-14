package com.pinmall.domain;

public class AdReviewVO {

	//관리자 리뷰페이지 에서 사용하기 위한 VO
	private String memt_id;
	private int pdt_nb;
	private int rv_score;
	
	
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
	public int getRv_score() {
		return rv_score;
	}
	public void setRv_score(int rv_score) {
		this.rv_score = rv_score;
	}
	
	@Override
	public String toString() {
		return "AdReviewVO [memt_id=" + memt_id + ", pdt_nb=" + pdt_nb + ", rv_score=" + rv_score + "]";
	}
	
	
	
	
}
