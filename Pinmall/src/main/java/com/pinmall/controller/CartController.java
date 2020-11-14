package com.pinmall.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.pinmall.domain.CartVO;
import com.pinmall.dto.MemberDTO;
import com.pinmall.service.CartProductService;

@Controller
@RequestMapping("/cart/*")
public class CartController {
	
	@Inject
	private CartProductService service;
	
	
	// 웹 프로젝트 영역 외부에 파일을 저장할 때 사용할 경로
	@Resource(name="uploadPath")
	private String uploadPath;
	
	private static final Logger logger = LoggerFactory.getLogger(CartController.class);

	//장바구니 목록
	@RequestMapping(value = "list", method = RequestMethod.GET)
	public void cartMain(Model model, HttpSession session) throws Exception{
		
		MemberDTO dto = (MemberDTO) session.getAttribute("user");
	
		logger.info("목록 : " + dto.toString());
		model.addAttribute("cartProductList", service.getCart(dto.getMemt_id()));
		logger.info(model.toString());
	}
	
	//장바구니 입력 (상품1개 수량 1개)
	@ResponseBody
	@RequestMapping(value="add", method=RequestMethod.POST)
	public ResponseEntity<String> addCart(int pdt_nb, HttpSession session) {
		
		logger.info("==pdt_nb: " + pdt_nb);
		
		ResponseEntity<String> entity = null;
		
		CartVO vo = new CartVO();
		MemberDTO dto = (MemberDTO) session.getAttribute("user");
		vo.setMemt_id(dto.getMemt_id());
		vo.setPdt_nb(pdt_nb);
		vo.setCart_amount(1);
		logger.info("=====vo: " + vo.toString());
		
		try {
			service.addCart(vo);
			entity = new ResponseEntity<String>(HttpStatus.OK);
			
		} catch(Exception e) {
			entity = new ResponseEntity<String>(HttpStatus.BAD_REQUEST);
			e.printStackTrace();
		}
	
		return entity;
	}
	
	//장바구니 입력 (상품1개 수량 여러개)
	@ResponseBody
	@RequestMapping(value = "addMany")
	public ResponseEntity<String> addManyCart(int pdt_nb,int pdt_amount,HttpSession session) throws Exception{
		
		logger.info("수량여러개 입력");
		
		ResponseEntity<String> entity = null;
		
		CartVO vo = new CartVO();
		MemberDTO dto = (MemberDTO) session.getAttribute("user");
		vo.setMemt_id(dto.getMemt_id());
		vo.setPdt_nb(pdt_nb);
		vo.setCart_amount(pdt_amount);
		logger.info("==vo" + vo.toString());
		
		try {
			service.addCart(vo);
			entity = new ResponseEntity<String>(HttpStatus.OK);
		} catch(Exception ex) {
			entity = new ResponseEntity<String>(HttpStatus.BAD_REQUEST);
			ex.printStackTrace();
		}
		
		return entity;
	}
	
	//장바구니 수량 변경
	@ResponseBody
	@RequestMapping(value = "modify",method = RequestMethod.POST)
	public ResponseEntity<String> cartAmount(int cart_code, int cart_amount) throws Exception{
		
		logger.info("수량변경진행");

		ResponseEntity<String> entity = null;
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("cart_code", cart_code);
		map.put("cart_amount", cart_amount);
		

		
		
		try {
			
			service.cartAmount(map);
			logger.info("map :" + map.toString());
			entity = new ResponseEntity<String>(HttpStatus.OK);
		} catch(Exception ex) {
			entity = new ResponseEntity<String>(HttpStatus.BAD_REQUEST);
			ex.printStackTrace();
			
		}
	
		return entity;
	}
	
	//선택상품 삭제
	@ResponseBody
	@RequestMapping(value = "deleteChecked", method = RequestMethod.POST)
	public ResponseEntity<String> deleteChecked(@RequestParam("checkArr[]") List<Integer> checkArr) throws Exception{
		
		logger.info("선택상품삭제 진행");
		
		ResponseEntity<String> entity = null;
		
		try{
			for(int cart_code : checkArr) {
				service.deleteChecked(cart_code);
			
			}
			entity = new ResponseEntity<String>("SUCCESS",HttpStatus.OK);
		}catch(Exception ex){
			entity = new ResponseEntity<String>("FALSE",HttpStatus.BAD_REQUEST);
			ex.printStackTrace();
		}
		
		return entity;
	}
	

	
}
