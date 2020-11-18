package com.pinmall.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.pinmall.domain.AdminVO;
import com.pinmall.dto.AdminDTO;
import com.pinmall.persistance.AdminDAO;

@Service
public class AdminServiceImpl implements AdminService {
	
	@Inject
	private AdminDAO dao;
	
	//관리자 로그인
	@Override
	public AdminVO login(AdminDTO dto) throws Exception {
		
		AdminVO vo = dao.login(dto);
		
		if(vo != null) {
			dao.loginUpdate(dto.getAdmin_id());
		} else {
			vo = null;
		}
		return vo;
	}


	
	
}
