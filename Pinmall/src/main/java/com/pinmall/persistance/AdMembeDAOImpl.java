package com.pinmall.persistance;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.pinmall.domain.AdMemberVO;
import com.pinmall.domain.AdReviewVO;
import com.pinmall.domain.ReviewVO;

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
	public List<ReviewVO> getReview(Map map) throws Exception {
		return session.selectList(NS+".getReview", map);
	}

	//회원 리뷰 삭제
	@Override
	public void deleteReview(int rv_nb) throws Exception {
		session.delete(NS+".deleteReview", rv_nb);
	}

}
