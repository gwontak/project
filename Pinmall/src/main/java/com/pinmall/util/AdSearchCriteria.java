package com.pinmall.util;

public class AdSearchCriteria extends AdCriteria{
	
	private String searchType; //검색어 종류
	private String keyword;		//검색어
	public String getSearchType() {
		return searchType;
	}
	public void setSearchType(String searchType) {
		this.searchType = searchType;
	}
	public String getKeyword() {
		return keyword;
	}
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	
	@Override
	public String toString() {
		return "AdSearchCriteria [searchType=" + searchType + ", keyword=" + keyword + ", toString()="
				+ super.toString() + "]";
	}
	
	
	
}
