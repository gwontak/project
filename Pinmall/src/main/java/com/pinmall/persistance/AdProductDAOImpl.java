package com.pinmall.persistance;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.pinmall.domain.CategoryVO;
import com.pinmall.domain.productVO;
import com.pinmall.util.SearchCriteria;

@Repository
public class AdProductDAOImpl implements AdProductDAO {

	@Inject
	private SqlSession session;
	public final static String NS = "com.pinmall.mappers.adProductMapper";
	
	//1차카테고리
	@Override
	public List<CategoryVO> mainCGList() throws Exception {
		return session.selectList(NS+".mainCGList");
	}
	
	//1차카테고리에따른 2차카테고리
	@Override
	public List<CategoryVO> subCGList(String cate_ncategory) throws Exception {
		return session.selectList(NS+".subCGList", cate_ncategory);
	}

	//상품등록
	@Override
	public void insertPOST(productVO vo) throws Exception {
		 session.insert(NS+".insertPOST", vo);
	}

	//상품 리스트
	@Override
	public List<productVO> searchList(SearchCriteria cri) throws Exception {
		return session.selectList(NS+".searchList", cri);
	}
	//상품개수
	@Override
	public int searchListCount(SearchCriteria cri) throws Exception {
		
		return session.selectOne(NS+".searchListCount", cri);
	}

	//상품삭제
	@Override
	public void productDelete(int pdt_nb) throws Exception {

		session.delete(NS+".productDelete", pdt_nb);
	}

	//상품정보
	@Override
	public productVO editGET(int pdt_nb) throws Exception {
	
	  return session.selectOne(NS+".editGET", pdt_nb);
	}

	//상품수정
	@Override
	public void editPOST(productVO vo) throws Exception {
		session.update(NS+".editPOST", vo);
	}
	
	

}
