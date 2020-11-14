package com.pinmall.persistance;

import java.util.List;
import java.util.Map;

import com.pinmall.domain.CategoryVO;
import com.pinmall.domain.productVO;

public interface ProductDAO {
	
	//1차카테고리
	public List<CategoryVO> mainCGList() throws Exception;
	
	//2차카테고리
	public List<CategoryVO> subCGList(String cate_ncategory) throws Exception; 

	//해당카테고리에 따른 2차카테고리(left)
	public List<productVO> productListCG(Map map) throws Exception;
	
	//카테고리 이름
	public String getCTName(String cate_ncategory) throws Exception;
	
	//카테고리에 해당하는 상품 개수
	public int productCount(String cate_ncategory) throws Exception;
	
	//상품카테고리 전체 출력
	public List<productVO> productList() throws Exception;

	//상세정보
	public productVO productRead(int pdt_nb) throws Exception;
}
