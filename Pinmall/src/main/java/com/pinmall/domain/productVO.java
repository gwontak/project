package com.pinmall.domain;

import java.util.Date;

import org.springframework.web.multipart.MultipartFile;

public class productVO {
	
	private int	pdt_nb;               
	private String cate_ncategory; // 2차카테고리 코드
	private String cate_pcategory;   // 1차 카테고리 코드
	private String pdt_name;         // 상품명    
	private int pdt_price;           // 상품가격
	private int pdt_dc;              // 상품할인률
	private String pdt_company;      // 상품개발사   
	private String pdt_detail;       // 상품상세설명    
	private String pdt_img;          // 상품이미지   
	private int pdt_amount;          // 상품수량
	private String pdt_buy;          // 상품구매여부   
	private Date pdt_regdate;        // 상품등록날짜
	private Date pdt_update; 		 // 상품정보수정날짜
	
	//업로드 파일
	private MultipartFile file1;

	public int getPdt_nb() {
		return pdt_nb;
	}

	public void setPdt_nb(int pdt_nb) {
		this.pdt_nb = pdt_nb;
	}

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

	public String getPdt_company() {
		return pdt_company;
	}

	public void setPdt_company(String pdt_company) {
		this.pdt_company = pdt_company;
	}

	public String getPdt_detail() {
		return pdt_detail;
	}

	public void setPdt_detail(String pdt_detail) {
		this.pdt_detail = pdt_detail;
	}

	public String getPdt_img() {
		return pdt_img;
	}

	public void setPdt_img(String pdt_img) {
		this.pdt_img = pdt_img;
	}

	public int getPdt_amount() {
		return pdt_amount;
	}

	public void setPdt_amount(int pdt_amount) {
		this.pdt_amount = pdt_amount;
	}

	public String getPdt_buy() {
		return pdt_buy;
	}

	public void setPdt_buy(String pdt_buy) {
		this.pdt_buy = pdt_buy;
	}

	public Date getPdt_regdate() {
		return pdt_regdate;
	}

	public void setPdt_regdate(Date pdt_regdate) {
		this.pdt_regdate = pdt_regdate;
	}

	public Date getPdt_update() {
		return pdt_update;
	}

	public void setPdt_update(Date pdt_update) {
		this.pdt_update = pdt_update;
	}

	public MultipartFile getFile1() {
		return file1;
	}

	public void setFile1(MultipartFile file1) {
		this.file1 = file1;
	}

	@Override
	public String toString() {
		return "productVO [pdt_nb=" + pdt_nb + ", cate_ncategory=" + cate_ncategory + ", cate_pcategory="
				+ cate_pcategory + ", pdt_name=" + pdt_name + ", pdt_price=" + pdt_price + ", pdt_dc=" + pdt_dc
				+ ", pdt_company=" + pdt_company + ", pdt_detail=" + pdt_detail + ", pdt_img=" + pdt_img
				+ ", pdt_amount=" + pdt_amount + ", pdt_buy=" + pdt_buy + ", pdt_regdate=" + pdt_regdate
				+ ", pdt_update=" + pdt_update + ", file1=" + file1 + "]";
	}

	
	

}
