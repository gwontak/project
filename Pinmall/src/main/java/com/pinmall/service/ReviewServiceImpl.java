package com.pinmall.service;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.pinmall.domain.ReviewVO;
import com.pinmall.persistance.ReviewDAO;

@Service
public class ReviewServiceImpl implements ReviewService {

	@Inject
	private ReviewDAO dao;

	//상품후기쓰기
	@Override
	public void writeReview(ReviewVO vo,String memt_id) throws Exception {
			vo.setMemt_id(memt_id);
			dao.writeReview(vo);
	}

	//상품후기리스트
	@Override
	public List<ReviewVO> listReview(Map<String, Object> map) throws Exception {
		return dao.listReview(map);
	}

	//상품후기 총 개수
	@Override
	public int countReview(int pdt_nb) throws Exception {
		return dao.countReview(pdt_nb);
	}

	//상품후기 삭제
	@Override
	public int deleteReview(int rv_nb) throws Exception {
		return dao.deleteReview(rv_nb);
	}

	//상품후기 수정
	@Override
	public void modifyReview(ReviewVO vo) throws Exception {
			dao.modifyReview(vo);
	}
}
