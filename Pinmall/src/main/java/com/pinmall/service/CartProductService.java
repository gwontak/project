package com.pinmall.service;

import java.util.List;
import java.util.Map;

import com.pinmall.domain.CartProductVO;
import com.pinmall.domain.CartVO;

public interface CartProductService {
	
	//장바구니 리스트 출력
	public List<CartProductVO> getCart(String memt_id) throws Exception;
	
	//장바구니 등록
	public void addCart(CartVO vo) throws Exception;
	
	//상품수량변경
	public void cartAmount(Map map) throws Exception;
	
	//선택상품삭제
	public void deleteChecked(int cart_code) throws Exception;

	//장바구니 주문시 삭제
	public void deleteCartOrder(Map map) throws Exception;
}
