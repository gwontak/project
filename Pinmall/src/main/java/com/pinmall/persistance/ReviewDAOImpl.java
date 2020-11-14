package com.pinmall.persistance;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.pinmall.domain.ReviewVO;

@Repository
public class ReviewDAOImpl implements ReviewDAO {

	@Inject
	private SqlSession session;
	public final static String NS = "com.pinmall.mappers.ReviewMapper";
	
	//상품쓰기
	@Override
	public void writeReview(ReviewVO vo) throws Exception {
		session.insert(NS+".writeReview", vo);
	}

	//상품후기리스트
	@Override
	public List<ReviewVO> listReview(Map<String, Object> map) throws Exception {
		return session.selectList(NS+".listReview", map);
	}

	//상품후기 총 개수
	@Override
	public int countReview(int pdt_nb) throws Exception {
		return session.selectOne(NS+".countReview", pdt_nb);
	}

	//상품후기 삭제
	@Override
	public int deleteReview(int rv_nb) throws Exception {
		return session.delete(NS+".deleteReivew", rv_nb);
	}

	//상품후기 수정
	@Override
	public void modifyReview(ReviewVO vo) throws Exception {
		 session.update(NS+".modifyReview", vo);
	}
}
