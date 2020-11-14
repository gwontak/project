package com.pinmall.util;

public class SearchCriteria extends Criteria{

	private String searchType; //검색어 종류(제목,새용,작성자등)
	private String keyword; // 검색어
	
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
		return super.toString() + " SearchCriteria [searchType=" + searchType + ", keyword="
				+ keyword + "]";
	}
}


