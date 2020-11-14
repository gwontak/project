package com.pinmall.domain;

//카테고리 테이블
public class CategoryVO {

	private String cate_ncategory;
	private String cate_pcategory;
	private String cate_categoryname;
	
	public String getCate_ncategory() {
		return cate_ncategory;
	}
	public void setCate_ncategory(String cate_ncategory) {
		this.cate_ncategory = cate_ncategory;
	}
	public String getCate_pcategory() {
		return cate_pcategory;
	}
	public void setCate_pcategory(String cate_pcategory) {
		this.cate_pcategory = cate_pcategory;
	}
	public String getCate_categoryname() {
		return cate_categoryname;
	}
	public void setCate_categoryname(String cate_categoryname) {
		this.cate_categoryname = cate_categoryname;
	}
	
	@Override
	public String toString() {
		return "CategoryVO [cate_ncategory=" + cate_ncategory + ", cate_pcategory=" + cate_pcategory
				+ ", cate_categoryname=" + cate_categoryname + "]";
	}
	
	
}
