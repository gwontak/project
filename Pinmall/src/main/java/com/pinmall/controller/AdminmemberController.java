package com.pinmall.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.pinmall.domain.AdOrderListVO;
import com.pinmall.domain.ReviewVO;
import com.pinmall.service.AdMemberService;
import com.pinmall.util.AdPageMaker;
import com.pinmall.util.AdSearchCriteria;
import com.pinmall.util.FileUtils;

@Controller
@RequestMapping("/admin/user/*")
public class AdminmemberController {

	@Inject
	private AdMemberService service;	
	
	private static final Logger logger = LoggerFactory.getLogger(AdminmemberController.class);
	
	@Resource(name = "uploadPath")
	private String uploadPath;
	
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
	public ResponseEntity<String> deleteReview(AdOrderListVO vo,@RequestParam("checkArr[]") List<Integer> checkArr) throws Exception{
		
		
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
	
	
	//주문정보
	@RequestMapping(value = "OrderList",method = RequestMethod.GET)
	public void OrderList(@ModelAttribute("cri") AdSearchCriteria cri,Model model, RedirectAttributes redirect) throws Exception{
		
		logger.info("주문정보 진행"+cri.toString());
		
		model.addAttribute("list", service.OrderList(cri));
		
		AdPageMaker pm = new AdPageMaker();
		pm.setCri(cri);
		
		int Count = service.AdSearchlistCount(cri);
		pm.setTotalCount(Count);

		model.addAttribute("pm", pm);
	}
	
	//주문 상세정보 출력
	@ResponseBody
	@RequestMapping(value = "subOrCode/{odr_code}", method = RequestMethod.GET)
	public ResponseEntity<List<AdOrderListVO>> subCGList(@PathVariable("odr_code") int odr_code){
		
		logger.info("상세정보 출력");
		
		ResponseEntity<List<AdOrderListVO>> entity = null;
		try {
			
			entity = new ResponseEntity<List<AdOrderListVO>>(service.OrderDetailList(odr_code),HttpStatus.OK);
			logger.info(entity.toString());
		}catch(Exception ex) {
			entity = new ResponseEntity<List<AdOrderListVO>>(HttpStatus.BAD_REQUEST);
		}
		
		return entity;
	}
	
	//파일 출력
	@ResponseBody
	@RequestMapping(value = "displayFile",method = RequestMethod.GET)
	public ResponseEntity<byte[]> displayFile(String fileName) throws Exception{
		
		return FileUtils.getFile(uploadPath, fileName);
	}
	
}
