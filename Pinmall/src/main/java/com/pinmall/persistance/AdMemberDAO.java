package com.pinmall.persistance;

import java.util.List;
import java.util.Map;

import com.pinmall.domain.AdMemberVO;
import com.pinmall.domain.ReviewVO;

public interface AdMemberDAO {

	//회원정보 가져오기
	public List<AdMemberVO> getMember() throws Exception;
	
	//선택회원 탈퇴
	public void deleteMember(String memt_id) throws Exception;
	
	//회원탈퇴시 장바구니,주문내역,주문상세내역삭제
	public void deleteCart(String memt_id) throws Exception;
	
	public void deleteOrder(String memt_id) throws Exception;
	
	public void deleteOdrDetail(String memt_id) throws Exception;
	
	public void deleteRivew(String memt_id) throws Exception;
	
	//회원 리뷰 가져오기
	public List<ReviewVO> getReview(Map map) throws Exception;
	
	//회원 리뷰 삭제
	public void deleteReview(int rv_nb) throws Exception;
	
}
