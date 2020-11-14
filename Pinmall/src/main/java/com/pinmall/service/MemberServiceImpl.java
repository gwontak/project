package com.pinmall.service;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.pinmall.domain.MemberVO;
import com.pinmall.dto.MemberDTO;
import com.pinmall.persistance.MemberDAO;

@Service
public class MemberServiceImpl implements MemberService {

	@Inject
	private MemberDAO dao;
	
	@Autowired
	private BCryptPasswordEncoder crptPassEnc;

	private static final Logger logger = LoggerFactory.getLogger(MemberServiceImpl.class);
	//회원가입
	@Override
	public void join(MemberVO vo) throws Exception {
		dao.join(vo);
	}
	
	//아이디중복체크
	@Override
	public String checkID(String memt_id) throws Exception {
		// TODO Auto-generated method stub
		return dao.checkID(memt_id);
	}

	//닉네임중복체크
	@Override
	public String checkSName(String memt_sname) throws Exception {
		// TODO Auto-generated method stub
		return dao.checkSName(memt_sname);
	}
	
	//로그인
	@Transactional
	@Override
	public MemberDTO login(MemberDTO dto) throws Exception {
		MemberDTO memDTO = dao.login(dto);
		System.out.println("loginsevice : "+memDTO.toString());

		if(memDTO != null) {
			logger.info(memDTO.toString());
			if(crptPassEnc.matches(dto.getMemt_pw(), memDTO.getMemt_pw())) { 
				dao.loginUpdate(memDTO.getMemt_id()); 
			} else { 
				memDTO = null;
			}
		}
		return memDTO;
	}

	//비밀번호 확인
	@Override
	public String checkPW(String memt_pw) throws Exception {
		
		return dao.checkPW(memt_pw);
	}

	//회원정보 수정
	@Override
	public void modify(MemberVO vo) throws Exception {
		dao.modify(vo);
	}
	
	//비밀번호 변경
	@Override
	public void change(MemberDTO dto) throws Exception {
		dao.changePW(dto);
	}
	
	//회원정보 불러오기
	@Override
	public MemberVO readUser(String memt_id) throws Exception {
		return dao.readUser(memt_id);
	}

	//회원탈퇴
	@Override
	public void deleteUser(String memt_id) throws Exception {
		dao.deleteUser(memt_id);
	}

	
}
