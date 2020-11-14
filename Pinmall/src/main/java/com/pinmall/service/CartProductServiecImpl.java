package com.pinmall.service;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.pinmall.domain.CartProductVO;
import com.pinmall.domain.CartVO;
import com.pinmall.persistance.CartProductDAO;

@Service
public class CartProductServiecImpl implements CartProductService {

	@Inject
	private CartProductDAO dao;
	
	//장바구니 리스트
	@Override
	public List<CartProductVO> getCart(String memt_id) throws Exception {
		return dao.getCart(memt_id);
	}

	//장바구니 입력
	@Override
	public void addCart(CartVO vo) throws Exception {
		dao.addCart(vo);
	}

	//상품수량 변경
	@Override
	public void cartAmount(Map map) throws Exception {
		dao.cartAmount(map);
	}

	//선택상품삭제
	@Override
	public void deleteChecked(int cart_code) throws Exception {
		dao.deleteChecked(cart_code);
	}

	//장바구니 구매시 삭제
	@Override
	public void deleteCartOrder(Map map) throws Exception {
		dao.deleteCartOrder(map);
	}

}
