package com.pinmall.service;

import java.util.List;

import com.pinmall.domain.OrderDetailVOList;
import com.pinmall.domain.OrderListVO;
import com.pinmall.domain.OrderVO;

public interface OrderService {

	//주문내역 추가
	public void addOrder(OrderVO vo, OrderDetailVOList orderDerailList, String memt_id) throws Exception;
	
	
	//주문 조회
	public List<OrderListVO> orderList(String memt_id) throws Exception;
	
	//주문상세조회
	public List<OrderListVO> readOrder(int odr_code) throws Exception;
	
	//주문자정보
	public OrderVO getOrder(int odr_code) throws Exception;
}
