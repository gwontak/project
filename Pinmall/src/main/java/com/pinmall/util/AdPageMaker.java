package com.pinmall.util;

import org.springframework.web.util.UriComponents;
import org.springframework.web.util.UriComponentsBuilder;

public class AdPageMaker {
	
	private int totalCount;
	private int startPage;
	private int endPage;
	private boolean prev;
	private boolean next;
	
	//페이지 번호의 개수
	private int displayPageNum = 5;
	
	private AdCriteria cri;

	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
		
		calcData();
	}
	
	private void calcData() {
		
		endPage = (int) (Math.ceil(cri.getPage()/(double)displayPageNum) * displayPageNum);
		
		startPage = (endPage - displayPageNum) +1 ;
		
		int tempEndPage = (int) (Math.ceil(totalCount / (double)cri.getPerPageNum()));
		if(endPage > tempEndPage) {
			endPage = tempEndPage;
		}
		
		prev = startPage == 1 ? false :true;
		next = endPage * cri.getPerPageNum() >= totalCount ? false :true; 
	}

	
	public void setCri(AdCriteria cri) {
		this.cri = cri;
	}

	public int getStartPage() {
		return startPage;
	}

	public int getEndPage() {
		return endPage;
	}

	public boolean isPrev() {
		return prev;
	}

	public boolean isNext() {
		return next;
	}

	public int getDisplayPageNum() {
		return displayPageNum;
	}

	public AdCriteria getCri() {
		return cri;
	}
	
	public String makeQuery(int page) {
		
		UriComponents uriComponents =
				UriComponentsBuilder.newInstance()
				.queryParam("page", page)
				.queryParam("pserPageNum", cri.getPerPageNum())
				.build();
		
		return uriComponents.toUriString();
	}
	
	public String makeSearch(int page) {
		
		UriComponents uriComponents =
				UriComponentsBuilder.newInstance()
				.queryParam("page", page)
				.queryParam("perPageNum", cri.getPerPageNum())
				.queryParam("searchType", ((AdSearchCriteria)cri).getSearchType())
				.queryParam("keyword", ((AdSearchCriteria)cri).getKeyword())
				.build();
		
		return uriComponents.toUriString();
	}

	@Override
	public String toString() {
		return "AdPageMaker [totalCount=" + totalCount + ", startPage=" + startPage + ", endPage=" + endPage + ", prev="
				+ prev + ", next=" + next + ", displayPageNum=" + displayPageNum + ", cri=" + cri + "]";
	}
	
	
}
