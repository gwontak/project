package com.pinmall.persistance;

import java.util.List;

import com.pinmall.domain.CategoryVO;
import com.pinmall.domain.productVO;
import com.pinmall.util.SearchCriteria;

public interface AdProductDAO {
	
	//1차 카테고리
	public List<CategoryVO> mainCGList() throws Exception;
	
	//1차 카테고리에 따른 2차 카테고리
	public List<CategoryVO> subCGList(String cate_ncategory) throws Exception;

	//상품등록
	public void insertPOST(productVO vo) throws Exception;
	
	//상품리스트
	public List<productVO> searchList(SearchCriteria cri) throws Exception;
	
	//상품개수
	public int searchListCount(SearchCriteria cri) throws Exception;
	
	//상품삭제
	public void productDelete(int pdt_nb) throws Exception;
	
	//상품정보
	public productVO editGET(int pdt_nb) throws Exception;
	
	//상품수정
	public void editPOST(productVO vo) throws Exception;
	
}
