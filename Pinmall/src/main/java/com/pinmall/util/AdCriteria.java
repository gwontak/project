package com.pinmall.util;

public class AdCriteria {
	//페이징 기능에서 페이지 번호 출력을 위한 부분
	private int page; 			//현제 페이지
	private int perPageNum;		//페이지에 보여줄 게시물 개수
	
	private int rowStart; 		//행 시작
	private int rowEnd;			//행 끝
	
	public AdCriteria(){
		this.page = 1;
		this.perPageNum = 3;
	}

	
	public void setPage(int page) {
		
		if(page<=0)
		{
			this.page = 1;
			return;
		}
		this.page = page;
	}
	
	public void setPerPageNum(int perPageNum) {
		if(perPageNum <= 0 || perPageNum > 100) 
		{
			this.perPageNum = 5;
			return;
		}
		this.perPageNum = perPageNum;
	}
	
	public int getPage() {
		return page;
	}

	public int getPageStart()
	{
		return (this.page - 1) * perPageNum;
	}

	public int getPerPageNum() {
		return this.perPageNum;
	}


	public int getRowStart() {
		return ((page - 1) * perPageNum) + 1;
	}


	public int getRowEnd() {
		return getRowStart() + perPageNum - 1;
	}


	@Override
	public String toString() {
		return "AdCriteria [page=" + page + ", perPageNum=" + perPageNum + ", rowStart=" + getRowStart() + ", rowEnd="
				+ getRowEnd() + "]";
	}
	
	
}
