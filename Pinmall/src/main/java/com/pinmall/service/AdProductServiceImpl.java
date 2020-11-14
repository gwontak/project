package com.pinmall.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.pinmall.domain.CategoryVO;
import com.pinmall.domain.productVO;
import com.pinmall.persistance.AdProductDAO;
import com.pinmall.util.SearchCriteria;

@Service
public class AdProductServiceImpl implements AdProductService {

	@Inject
	private AdProductDAO dao;
	
	//1차카테고리
	@Override
	public List<CategoryVO> mainCGList() throws Exception {
		return dao.mainCGList();
	}

	//1차 카테고리에 따른 2차카테고리
	@Override
	public List<CategoryVO> subCGList(String cate_ncategory) throws Exception {
		return dao.subCGList(cate_ncategory);
	}

	//상품등록
	@Override
	public void insertPOST(productVO vo) throws Exception {
		dao.insertPOST(vo);
	}

	//상품리스트
	@Override
	public List<productVO> searchList(SearchCriteria cri) throws Exception {
		return dao.searchList(cri);
	}

	//상품개수
	@Override
	public int searchListCount(SearchCriteria cri) throws Exception {
		return dao.searchListCount(cri);
	}

	//상품삭제
	@Override
	public void productDelete(int pdt_nb) throws Exception {
		dao.productDelete(pdt_nb);
	}

	//상품정보
	@Override
	public productVO editGET(int pdt_nb) throws Exception {
		return dao.editGET(pdt_nb);
	}

	//상품수정
	@Override
	public void editPOST(productVO vo) throws Exception {
		dao.editPOST(vo);
	}

}
