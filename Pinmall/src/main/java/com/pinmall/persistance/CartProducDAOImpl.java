package com.pinmall.persistance;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.pinmall.domain.CartProductVO;
import com.pinmall.domain.CartVO;

@Repository
public class CartProducDAOImpl implements CartProductDAO {

	@Inject
	SqlSession session;
	public final static String NS="com.pinmall.mappers.CartMapper";
	
	//장바구니 가져오기
	@Override
	public List<CartProductVO> getCart(String memt_id) throws Exception {
		return session.selectList(NS+".getCart", memt_id);
	}

	//장바구니 입력
	@Override
	public void addCart(CartVO vo) throws Exception {
		session.insert(NS+".addCart", vo);
	}

	//상품수량 변경
	@Override
	public void cartAmount(Map map) throws Exception {
		session.update(NS+".cartAmount", map);
	}

	//상품선택삭제
	@Override
	public void deleteChecked(int cart_code) throws Exception {
		session.delete(NS+".deleteChecked", cart_code);
	}

	//장바구니 주문시 삭제
	@Override
	public void deleteCartOrder(Map map) throws Exception {
			session.delete(NS+".deleteCartOrder", map);
	}
	
	
}
