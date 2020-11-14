package com.pinmall.persistance;

import java.util.List;

import com.pinmall.domain.OrderDetailVO;
import com.pinmall.domain.OrderListVO;
import com.pinmall.domain.OrderVO;

public interface OrderDAO {

	//시퀀스 가져오기
	public int readOrderCode() throws Exception;
	
	//주문내역 추가
	public void addOrderDetail(OrderDetailVO vo) throws Exception;
	
	//주문정보 추가
	public void addOrder(OrderVO vo) throws Exception;
	
	//주문조회
	public List<OrderListVO> orderList(String memt_id) throws Exception;
	
	//주문상세조회
	public List<OrderListVO> readOrder(int odr_code) throws Exception;
	
	//주문자정보
	public OrderVO getOrder(int odr_code) throws Exception;
	
	
}
