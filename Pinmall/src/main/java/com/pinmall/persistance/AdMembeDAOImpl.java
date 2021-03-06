package com.pinmall.persistance;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.pinmall.domain.AdMemberVO;
import com.pinmall.domain.AdOrderListVO;
import com.pinmall.domain.OrderDetailVO;
import com.pinmall.domain.ReviewVO;
import com.pinmall.util.AdSearchCriteria;

@Repository
public class AdMembeDAOImpl implements AdMemberDAO {

	@Inject
	private SqlSession session;
	
	public static final String NS = "com.pinmall.mappers.adMemberMapper";
	
	//회원정보 가져오기
	@Override
	public List<AdMemberVO> getMember() throws Exception {
		return session.selectList(NS+".getMember");
	}
	
	//선택회원 탈퇴
	@Override
	public void deleteMember(String memt_id) throws Exception {
		session.delete(NS+".deleteMember", memt_id);
		
	}
	
	//회원탈퇴시 장바구니,주문내역,주문상세내역삭제
	@Override
	public void deleteCart(String memt_id) throws Exception {
		session.delete(NS+".deleteCart", memt_id);
	}

	@Override
	public void deleteOrder(String memt_id) throws Exception {
		session.delete(NS+".deleteOrder", memt_id);
	}

	@Override
	public void deleteOdrDetail(String memt_id) throws Exception {
		session.delete(NS+".deleteOdrDetail", memt_id);
	}

	@Override
	public void deleteRivew(String memt_id) throws Exception {
		session.delete(NS+".deleteRivew", memt_id);
	}

	//회원 리뷰 가져오기
	@Override
	public List<ReviewVO> getReview(AdSearchCriteria cri) throws Exception {
		return session.selectList(NS+".getReview", cri);
	}

	//회원 리뷰 삭제
	@Override
	public void deleteReview(int rv_nb) throws Exception {
		session.delete(NS+".deleteReview", rv_nb);
	}

	//주문 정보
	@Override
	public List<OrderDetailVO> OrderList(AdSearchCriteria cri) throws Exception {
		return session.selectList(NS+".OrderList",cri);
	}

	//주문 개수
	@Override
	public int AdSearchlistCount(AdSearchCriteria cri) throws Exception {
		return session.selectOne(NS+".AdSearchlistCount", cri);
	}

	//주문 상세정보
	@Override
	public List<AdOrderListVO> OrderDetailList(int odr_code) throws Exception {
		return session.selectList(NS+".OrderDetailList",odr_code);
	}

	@Override
	public int ReviewCount(AdSearchCriteria cri) throws Exception {
		return session.selectOne(NS+".ReviewCount", cri);
	}



}
