package com.pinmall.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.pinmall.dto.EmailDTO;
import com.pinmall.service.EmailService;

@Controller
@RequestMapping("/email/*")
public class EmailController {

	@Inject
	EmailService emailService;
	
	private static final Logger logger = LoggerFactory.getLogger(EmailController.class);
 
	@RequestMapping(value = "/send",method = RequestMethod.POST)
	public ResponseEntity<String> send(EmailDTO dto, Model model, HttpSession session){
		
		logger.info(dto.toString());
		
		ResponseEntity<String> entity = null;
		
		//인증코드 6자리 생성
		String authcode = "";
		for(int i=0;i<6;i++) {
			authcode += String.valueOf((int)(Math.random()*10));
		}
		
		session.setAttribute("authcode", authcode);
		
		logger.info(authcode);
		
		try {
		
			emailService.sendMail(dto, authcode);
			entity = new ResponseEntity<String>("ok", HttpStatus.OK);
			
		} catch(Exception ex) {
			ex.printStackTrace();
			entity = new ResponseEntity<String>(HttpStatus.BAD_REQUEST);
		}
		
		return entity;
	}
}
