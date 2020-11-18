package com.pinmall.service;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.pinmall.domain.AdMemberVO;
import com.pinmall.domain.AdOrderListVO;
import com.pinmall.domain.OrderDetailVO;
import com.pinmall.domain.ReviewVO;
import com.pinmall.persistance.AdMemberDAO;
import com.pinmall.util.AdSearchCriteria;


@Service
public class AdMemberServiceImpl implements AdMemberService {

	@Inject
	private AdMemberDAO dao;
	
	//회원정보 가져오기
	@Override
	public List<AdMemberVO> getMember() throws Exception {
		return dao.getMember();
	}
	
	//선택회원 탈퇴
	@Override
	public void deleteMember(String memt_id) throws Exception {
		dao.deleteMember(memt_id);
	}

	//회원탈퇴시 장바구니,주문내역,주문상세내역삭제
	@Override
	public void deleteCart(String memt_id) throws Exception {
		dao.deleteCart(memt_id);
	}

	@Override
	public void deleteOrder(String memt_id) throws Exception {
		dao.deleteOrder(memt_id);
	}

	@Override
	public void deleteOdrDetail(String memt_id) throws Exception {
		dao.deleteOdrDetail(memt_id);
	}

	@Override
	public void deleteRivew(String memt_id) throws Exception {
		dao.deleteRivew(memt_id);
	}

	
	//회원 리뷰 가져오기
	@Override
	public List<ReviewVO> getReview(Map map) throws Exception {
		return dao.getReview(map);
	}

	//회원 리뷰 삭제
	@Override
	public void deleteReview(int rv_nb) throws Exception {
		dao.deleteReview(rv_nb);
	}

	//주문 정보
	@Override
	public List<OrderDetailVO> OrderList(AdSearchCriteria cri) throws Exception {
		return dao.OrderList(cri);
	}

	//주문 개수
	@Override
	public int AdSearchlistCount(AdSearchCriteria cri) throws Exception {
		return dao.AdSearchlistCount(cri);
	}

	//주문 상세정보
	@Override
	public List<AdOrderListVO> OrderDetailList(int odr_code) throws Exception {
		return dao.OrderDetailList(odr_code);
	}


}
