package com.pinmall.persistance;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.pinmall.domain.AdminVO;
import com.pinmall.dto.AdminDTO;

@Repository
public class AdminDAOImpl implements AdminDAO {

	@Inject
	private SqlSession session;
	public final static String NS = "com.pinmall.mappers.adminMapper";
	
	//로그인
	@Override
	public AdminVO login(AdminDTO dto) throws Exception {
		// TODO Auto-generated method stub
		return session.selectOne(NS+".login", dto);
	}
	//로그인시간 업데이트
	@Override
	public void loginUpdate(String admin_id) throws Exception {
		session.update(NS+".loginUpdate", admin_id);
	}
	


}
