package com.pinmall.service;

import com.pinmall.domain.AdminVO;
import com.pinmall.dto.AdminDTO;

public interface AdminService {

	//로그인
	public AdminVO login(AdminDTO dto) throws Exception;
	
}
