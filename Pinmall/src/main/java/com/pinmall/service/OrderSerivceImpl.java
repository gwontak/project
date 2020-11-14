package com.pinmall.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.pinmall.domain.OrderDetailVO;
import com.pinmall.domain.OrderDetailVOList;
import com.pinmall.domain.OrderListVO;
import com.pinmall.domain.OrderVO;
import com.pinmall.persistance.OrderDAO;

@Service
public class OrderSerivceImpl implements OrderService {

	@Inject
	private OrderDAO dao;
	
	@Inject
	private CartProductService cartService;

	//주문내역,주문정보 추가(구매)
	@Transactional
	@Override
	public void addOrder(OrderVO order, OrderDetailVOList addOrderDetail, String memt_id) throws Exception {
		
		int odr_code = dao.readOrderCode();
		order.setOdr_code(odr_code);
		dao.addOrder(order);
		
		
		List<OrderDetailVO> list = addOrderDetail.getOrderDetailVOList();
		for(int i=0; i<list.size(); i++) {
			OrderDetailVO orderDetail = list.get(i);
			orderDetail.setOdr_code(odr_code);
			dao.addOrderDetail(orderDetail);
			
			// 장바구니 테이블에서 해당 상품들 삭제
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("memt_id", memt_id);
			map.put("pdt_nb", orderDetail.getPdt_nb());
			cartService.deleteCartOrder(map);
			
		}
	}


	//주문조회
	@Override
	public List<OrderListVO> orderList(String memt_id) throws Exception {
		return dao.orderList(memt_id);
	}

	//주문상세조회
	@Override
	public List<OrderListVO> readOrder(int odr_code) throws Exception {
		return dao.readOrder(odr_code);
	}

	//주문자 정보
	@Override
	public OrderVO getOrder(int odr_code) throws Exception {
		return dao.getOrder(odr_code);
	}



			
}