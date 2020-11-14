package com.pinmall.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.pinmall.domain.AdReviewVO;
import com.pinmall.domain.ReviewVO;
import com.pinmall.service.AdMemberService;

@Controller
@RequestMapping("/admin/user/*")
public class AdminmemberController {

	@Inject
	private AdMemberService service;	
	
	private static final Logger logger = LoggerFactory.getLogger(AdminmemberController.class);
	
	
	//회원관리
	@RequestMapping(value = "member",method = RequestMethod.GET)
	public void getMember(Model model) throws Exception{
		
		logger.info("회원 관리 실행");
		
		model.addAttribute("member", service.getMember());
		logger.info("회원 관리 실행" + model.toString());
		
		
	}
	
	//선택회원 탈퇴
	@ResponseBody
	@RequestMapping(value = "deleteMember", method = RequestMethod.POST)
	public ResponseEntity<String> deleteMember(@RequestParam("checkArr[]") List<String> checkArr) throws Exception{
		
		logger.info("삭제진행"+checkArr);
		ResponseEntity<String> entity = null;
		
		try {
			for(String memt_id : checkArr) {
				service.deleteRivew(memt_id);
				service.deleteCart(memt_id);
				service.deleteOrder(memt_id);
				service.deleteOdrDetail(memt_id);
				service.deleteMember(memt_id);
			}
			entity = new ResponseEntity<String>(HttpStatus.OK);
		}catch(Exception ex) {
			entity = new ResponseEntity<String>(HttpStatus.BAD_REQUEST);
			ex.printStackTrace();
		}
		
		return entity;
		
	}
	
	//리뷰게시판(get)
	@RequestMapping(value = "Review", method = RequestMethod.GET)
	public void getReview(Model model) throws Exception{
		
		logger.info("리뷰게시판");
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		List<ReviewVO> list = service.getReview(map);
		model.addAttribute("list", list);
		
		
	}
	
	
	//리뷰삭제
	@ResponseBody
	@RequestMapping(value = "deleteReview", method = RequestMethod.POST)
	public ResponseEntity<String> deleteReview(AdReviewVO vo,@RequestParam("checkArr[]") List<Integer> checkArr) throws Exception{
		
		
		logger.info("리뷰 삭제 : " + checkArr);
		ResponseEntity<String> entity = null;
		
		try {
			for(int rv_nb : checkArr) {
				
				service.deleteReview(rv_nb);
				
			}
			
			entity = new ResponseEntity<String>(HttpStatus.OK);
		} catch (Exception ex) {
			entity = new ResponseEntity<String>(HttpStatus.BAD_REQUEST);
			ex.printStackTrace();
			
		}
		
		return entity;
	}
}
