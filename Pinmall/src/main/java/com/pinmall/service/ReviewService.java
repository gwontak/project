package com.pinmall.service;

import java.util.List;
import java.util.Map;

import com.pinmall.domain.ReviewVO;

public interface ReviewService {

	//상품후기쓰기
	public void writeReview(ReviewVO vo,String memt_id) throws Exception;
	
	//상품후기리스트
	public List<ReviewVO> listReview(Map<String, Object> map) throws Exception;
	
	//상품후기 총 개수
	public int countReview(int pdt_nb) throws Exception;
	
	//상품후기 삭제
	public int deleteReview(int rv_nb) throws Exception;
	
	//상품후기 수정	
	public void modifyReview(ReviewVO vo) throws Exception;
}
