package com.pinmall.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.pinmall.domain.MemberVO;
import com.pinmall.dto.MemberDTO;
import com.pinmall.service.MemberService;

@Controller
@RequestMapping("/member/*")
public class MemberController {

	@Inject
	MemberService service;
	
	@Inject
	private BCryptPasswordEncoder crptPassEnc;
	
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	
	//로그인(GET)  
	@RequestMapping(value="login", method=RequestMethod.GET)
	public void loginGet() {

	}
	
	//로그인(POST)
	@RequestMapping(value = "loginPOST",method = RequestMethod.POST)
	public String loginPOST(MemberDTO dto,RedirectAttributes redirect,HttpSession session) throws Exception{
		logger.info(dto.toString());
		
		MemberDTO memDTO = service.login(dto);
		
		session.setAttribute("user", memDTO);
		
		if(memDTO != null) {
			logger.info("로그인성공" + memDTO);
			
			redirect.addFlashAttribute("msg", "LOGIN_SUCCESS");
			
			return "redirect:/";
		} else {
			logger.info("로그인실패" + memDTO);
			
			redirect.addFlashAttribute("msg", "LOGIN_FAIL");
			
			return "redirect:/member/login";
		}
	}
	
	//로그아웃
	@RequestMapping(value = "logOut",method = RequestMethod.GET)
	public String logOut(HttpSession session,RedirectAttributes redirect) {
		
		logger.info("로그아웃");
		
		session.invalidate();
		redirect.addFlashAttribute("msg", "LOGOUT_SUCCESS");
		
		return "redirect:/";
	}
	
	//회원가입(GET)
	@RequestMapping(value="join", method=RequestMethod.GET)
	public void joinGet() throws Exception {

	}
	
	//회원가입(POST)
	@RequestMapping(value = "/joinPost",method = RequestMethod.POST)
	public String joinPost(MemberVO vo, RedirectAttributes redirect) throws Exception{
		
		vo.setMemt_pw(crptPassEnc.encode(vo.getMemt_pw()));
		
		logger.info(vo.toString());
		service.join(vo);
		redirect.addFlashAttribute("msg", "REGISTER_SUCCES");
		
		
		return "redirect:/";
	}
	
	//아이디 중복체크(ajax요청)
	@ResponseBody
	@RequestMapping(value = "checkID",method = RequestMethod.POST)
	public ResponseEntity<String> checkID(@RequestParam("memt_id") String memt_id){
		
		logger.info(memt_id);
		ResponseEntity<String> entity = null;
		
		try {
			String result = service.checkID(memt_id);
			
			if(result != null) {
				entity = new ResponseEntity<String>("FAIL", HttpStatus.OK);
			} else {
				entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
			}
			
		} catch(Exception ex) {
			ex.printStackTrace();
			entity = new ResponseEntity<String>(HttpStatus.BAD_REQUEST);
		}
		
		return entity;
	}

	
	//닉네임 중복체크(ajax요청)
	@ResponseBody
	@RequestMapping(value = "checkSName",method = RequestMethod.POST)
	public ResponseEntity<String> checkSName(@RequestParam("memt_sname") String memt_sname){
		
		logger.info(memt_sname);
		ResponseEntity<String> entity = null;
		
		try {
			String result = service.checkSName(memt_sname);
			
			if(result != null) {
				entity = new ResponseEntity<String>("FAIL", HttpStatus.OK);
			} else {
				entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
			}
			
		} catch(Exception ex) {
			ex.printStackTrace();
			entity = new ResponseEntity<String>(HttpStatus.BAD_REQUEST);
		}
		
		return entity;
	}

	// 이메일 인증 체크
	@ResponseBody
	@RequestMapping(value = "checkAuthcode",method = RequestMethod.POST) 
	public ResponseEntity<String> checkAuthcode(@RequestParam("code") String code, HttpSession session){
		
		ResponseEntity<String> entity = null;
		
		logger.info(code);
		
		try {
			if(code.equals(session.getAttribute("authcode"))) {
				entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
				logger.info(entity.toString());
			} else {
				entity = new ResponseEntity<String>("FAIL", HttpStatus.OK);
			}
			
			
		} catch(Exception ex) {
			ex.printStackTrace();
			entity = new ResponseEntity<String>(HttpStatus.BAD_REQUEST);
		}
		
		
		return entity;
	}
	
	
	// 회원정보수정(get)
	@RequestMapping(value = "modify",method = RequestMethod.GET)
	public String modifyGET(HttpSession session,MemberVO vo,Model model) throws Exception {
		
	   MemberDTO dto = (MemberDTO)session.getAttribute("user");
	   logger.info(dto.toString());
	   
	   model.addAttribute("vo",service.readUser(dto.getMemt_id()));
	   session.setAttribute("user", dto);
		
		return "/member/modify";
	}

	// 회원정보수정(post)
	@RequestMapping(value = "modifyPOST",method = RequestMethod.POST)
	public String modifyPOST(MemberVO vo,HttpSession session,RedirectAttributes redirect) throws Exception {
		
		MemberDTO dto = (MemberDTO)session.getAttribute("user");		
		logger.info(dto.toString());
		vo.setMemt_id(dto.getMemt_id());
		vo.setMemt_pw(dto.getMemt_pw());
		
		logger.info(vo.toString());
		
		service.modify(vo);
		
		session.setAttribute("vo", service.login(dto));
		
		logger.info(vo.toString());
		redirect.addFlashAttribute("msg", "MODIFY_USER_SUCCESS");
		
		return "redirect:/";
	}
	
	//비밀번호(get)
	@RequestMapping(value = "changeGET",method = RequestMethod.GET)
	public String changeGET(HttpSession session,MemberVO vo,Model model) throws Exception{
		
		   MemberDTO dto = (MemberDTO)session.getAttribute("user");
		   logger.info(dto.toString());
		   
		   model.addAttribute("vo",service.readUser(dto.getMemt_id()));
		   session.setAttribute("user", dto);
		
		return "/member/changeGET";
	}
	
	//비밀번호 변경(POST)
	@RequestMapping(value = "changePW",method = RequestMethod.POST)
	public String changePW(MemberDTO dto,HttpSession session, RedirectAttributes redirect) throws Exception {
	
		
		logger.info(dto.toString());
		dto.setMemt_pw(crptPassEnc.encode(dto.getMemt_pw()));
		logger.info("변경된 비밀번호"+dto.toString());
		
		service.change(dto);
		
		MemberDTO memDTO = (MemberDTO) session.getAttribute("user");
		memDTO.setMemt_pw(dto.getMemt_pw());
		logger.info("진행중memDTO"+memDTO);
		session.setAttribute("user", memDTO);
		redirect.addFlashAttribute("msg", "CHANGE_PW_SUCCESS");
		return "redirect:/";
			
	}
	
	
	  
	//비밀번호 확인 Ajax용
	@ResponseBody
	@RequestMapping("checkPwAjax")
	public ResponseEntity<String> checkPwAjax(@RequestParam("memt_pw") String memt_pw, HttpSession session) {
		
		ResponseEntity<String> entity = null;
		MemberDTO dto = (MemberDTO) session.getAttribute("user");
		logger.info("=====mem_pw: " + memt_pw);
		logger.info("=====dto: " + dto.toString());
		
		if(crptPassEnc.matches(memt_pw, dto.getMemt_pw())) {
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
			logger.info("==성공"+dto.toString());
		} else {
			entity = new ResponseEntity<String>("FAIL", HttpStatus.OK);
		}
		
		return entity;
	}
	
	//회원탈퇴(get)
	@RequestMapping(value = "delete", method = RequestMethod.GET)
	public void delte() throws Exception {
	
	}
	
	//회원탈퇴(post)
	@RequestMapping(value = "delete",method = RequestMethod.POST)
	public String delete(String memt_id, HttpSession session, RedirectAttributes redirect) throws Exception{
		
		service.deleteUser(memt_id);
		session.invalidate();
		redirect.addFlashAttribute("msg", "DELETE_USER_SUCCESS");
		
			return "redirect:/";
	}
	
}
