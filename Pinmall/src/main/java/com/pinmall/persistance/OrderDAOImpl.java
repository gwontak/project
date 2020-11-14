package com.pinmall.persistance;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.pinmall.domain.OrderDetailVO;
import com.pinmall.domain.OrderListVO;
import com.pinmall.domain.OrderVO;

@Repository
public class OrderDAOImpl implements OrderDAO {

	@Inject
	private SqlSession session;

	private static final String NS = "com.pinmall.mappers.orderMapper";
	
	//시퀀스 가져오기
	@Override
	public int readOrderCode() throws Exception {
		return session.selectOne(NS+".readOrderCode");
	}
	
	//주문내역추가
	@Override
	public void addOrderDetail(OrderDetailVO vo) throws Exception {
		session.insert(NS+".addOrderDetail", vo);
	}

	//주문정보 추가
	@Override
	public void addOrder(OrderVO vo) throws Exception {
		session.insert(NS+".addOrder", vo);
	}

	//주문 조회
	@Override
	public List<OrderListVO> orderList(String memt_id) throws Exception {
		return session.selectList(NS+".orderList", memt_id);
		
	}

	//주문상세정보 조회
	@Override
	public List<OrderListVO> readOrder(int odr_code) throws Exception {
		return session.selectList(NS+".readOrder", odr_code);
	}

	//주문자 정보
	@Override
	public OrderVO getOrder(int odr_code) throws Exception {
		return session.selectOne(NS+".getOrder", odr_code);
	}
}
