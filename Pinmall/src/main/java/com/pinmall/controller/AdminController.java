package com.pinmall.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.pinmall.domain.AdminVO;
import com.pinmall.dto.AdminDTO;
import com.pinmall.service.AdminService;

@Controller
@RequestMapping("/admin/*")
public class AdminController {

	@Inject
	private AdminService service;
	
	private static final Logger logger = LoggerFactory.getLogger(AdminController.class);
	
	//관리자 메인
	@RequestMapping(value = "adminmain",method = RequestMethod.GET)
	public String adminMain(Model model) throws Exception{
			
		return "/admin/admin_main";
	}
	
	//관리자 로그인 GET
	@RequestMapping(value = "login",method = RequestMethod.GET)
	public String adminlogin() throws Exception{
		
		return "/admin/login";
	}
	
	//관리자 로그인 POST
	@RequestMapping(value = "loginPOST",method = RequestMethod.POST)
	public String adminlogin(AdminDTO dto,RedirectAttributes redirect,HttpSession session) throws Exception {
		
		AdminVO vo = null;
		vo = service.login(dto);
		String msg = "";
		
		
		if(vo != null) {
			
			session.setAttribute("admin", vo);
			
			logger.info("session : " + session.toString());
			msg = "LOGIN_SUCCESS";
		} else {
			msg = "LOGIN_FAIL";
		}
		 redirect.addFlashAttribute("msg", msg);
		return	"redirect:/admin/adminmain";
	}
	
	//관리자 로그아웃GET
	@RequestMapping(value = "logOut", method = RequestMethod.GET)
	public String logOut(HttpSession session, RedirectAttributes redirect) throws Exception{
		
		logger.info("로그아웃 실행");
		
		session.invalidate();
		redirect.addAttribute("msg","LOGOUT_SUCCESS");
		
		return "redirect:/admin/adminmain";
	}
	
	
}
