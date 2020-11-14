package com.pinmall.service;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.pinmall.domain.CategoryVO;
import com.pinmall.domain.productVO;
import com.pinmall.persistance.ProductDAO;

@Service
public class ProductServiceImpl implements ProductService {

	@Inject
	private ProductDAO dao;
	
	//1차카테고리 출력
	@Override
	public List<CategoryVO> mainCGList() throws Exception {
		return dao.mainCGList();
	}
	
	//2차카테고리 출력
	@Override
	public List<CategoryVO> subCGList(String cate_ncategory) throws Exception {
		return dao.subCGList(cate_ncategory);
	}
	
	//해당 카테고리의 상품 리스트 출력
	@Override
	public List<productVO> productListCG(Map map) throws Exception {
		return dao.productListCG(map);
	}

	//카테고리명 
	@Override
	public String getCTName(String cate_ncategory) throws Exception {
		return dao.getCTName(cate_ncategory);
	}

	//카테고리에 해당하는 상품수
	@Override
	public int productCount(String cate_ncategory) throws Exception {
		return dao.productCount(cate_ncategory);
	}

	//상품카테고리 전체 출력
	@Override
	public List<productVO> productList() throws Exception {
		return dao.productList();
	}

	//상세정보
	@Override
	public productVO productRead(int pdt_nb) throws Exception {
		return dao.productRead(pdt_nb);
	}

}
