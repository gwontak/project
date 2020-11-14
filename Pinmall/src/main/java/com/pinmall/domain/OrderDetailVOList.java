package com.pinmall.domain;

import java.util.List;

public class OrderDetailVOList {
	
	private List<OrderDetailVO> OrderDetailVOList;

	public List<OrderDetailVO> getOrderDetailVOList() {
		return OrderDetailVOList;
	}

	public void setOrderDetailVOList(List<OrderDetailVO> orderDetailVOList) {
		OrderDetailVOList = orderDetailVOList;
	}

	@Override
	public String toString() {
		return "OrderDetailVOList [OrderDetailVOList=" + OrderDetailVOList + "]";
	}
	
	
}
