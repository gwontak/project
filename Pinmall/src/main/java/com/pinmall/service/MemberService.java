package com.pinmall.service;

import com.pinmall.domain.MemberVO;
import com.pinmall.dto.MemberDTO;

public interface MemberService {

	//회원가입
	public void join(MemberVO vo) throws Exception;
	
	//아이디 중복체크
	public String checkID(String memt_id) throws Exception;
	
	//닉네임 중복체크
	public String checkSName(String memt_sname) throws Exception;
	
	//로그인
	public MemberDTO login(MemberDTO dto) throws Exception;
	
	//비밀번호 확인
	public String checkPW(String memt_pw) throws Exception;
	
	//회원정보 수정
	public void modify(MemberVO vo) throws Exception;

	//비밀번호 변경
	public void change(MemberDTO dto) throws Exception;

	//MemberVO 가져오기
	public MemberVO readUser(String memt_id) throws Exception;
	
	//회원탈퇴
	public void deleteUser(String memt_id) throws Exception;

}
