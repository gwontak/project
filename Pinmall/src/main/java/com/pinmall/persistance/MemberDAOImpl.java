package com.pinmall.persistance;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.pinmall.domain.MemberVO;
import com.pinmall.dto.MemberDTO;

@Repository
public class MemberDAOImpl implements MemberDAO {

	@Inject
	private SqlSession session;
	public final static String NS = "com.pinmall.mappers.MemberMapper";
	
	//회원가입
	@Override
	public void join(MemberVO vo) throws Exception {
		session.insert(NS+ ".join", vo);
	}

	//아이디 중복체크
	@Override
	public String checkID(String memt_id) throws Exception {
		
		return session.selectOne(NS+".checkID", memt_id);
	}

	//닉네임 중복체크
	@Override
	public String checkSName(String memt_sname) throws Exception {
		
		return session.selectOne(NS+".checkSName", memt_sname);
	}

	//로그인
	@Override
	public MemberDTO login(MemberDTO dto) throws Exception {

		return session.selectOne(NS+".login", dto);
	}

	//로그인 시간 업데이트
	@Override
	public void loginUpdate(String memt_id) throws Exception {
		
		session.update(NS+".loginUpdate", memt_id);
	}

	//비밀번호 확인
	@Override
	public String checkPW(String memt_pw) throws Exception {
		// TODO Auto-generated method stub
		return session.selectOne(NS+".checkPW", memt_pw);
	}

	//회원정보 수정
	@Override
	public void modify(MemberVO vo) throws Exception {

		session.update(NS+".modify", vo);
	}

	//비밀번호 변경
	@Override
	public void changePW(MemberDTO dto) throws Exception {
		session.update(NS+".changePW", dto);
	}

	//회원정보 가져오기
	@Override
	public MemberVO readUser(String memt_id) throws Exception {
		return session.selectOne(NS+".readUser", memt_id);
	}

	//회원탈퇴
	@Override
	public void deleteUser(String memt_id) throws Exception {
		 session.delete(NS+".deleteUser", memt_id);
	}


		
}
