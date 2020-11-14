package com.pinmall.persistance;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.pinmall.domain.CategoryVO;
import com.pinmall.domain.productVO;

@Repository
public class ProductDAOImpl implements ProductDAO {

	@Inject
	private SqlSession session;
	public final static String NS = "com.pinmall.mappers.ProductMapper";
	
	// 1차카테고리 
	@Override
	public List<CategoryVO> mainCGList() throws Exception {
		return session.selectList(NS+".mainCGList");
	}

	// 2차카테고리
	@Override
	public List<CategoryVO> subCGList(String cate_ncategory) throws Exception {
		return session.selectList(NS+".subCGList", cate_ncategory);
	}

	//1차카테고리에 따른 2차카테고리(left
	@Override
	public List<productVO> productListCG(Map map) throws Exception {
		return session.selectList(NS+".productListCG", map);
	}

	//카테고리명 출력 
	@Override
	public String getCTName(String cate_ncategory) throws Exception {
		return session.selectOne(NS+".getCTName", cate_ncategory);
	}

	// 카테고리에 해당하는 상품 개수
	@Override
	public int productCount(String cate_ncategory) throws Exception {
		return session.selectOne(NS+".productCount", cate_ncategory);
	}

	//상품카테고리 전체 출력
	@Override
	public List<productVO> productList() throws Exception {
		return session.selectList(NS+".productList");
	}

	//상세정보
	@Override
	public productVO productRead(int pdt_nb) throws Exception {
		return session.selectOne(NS+".productRead", pdt_nb);
	}

}
