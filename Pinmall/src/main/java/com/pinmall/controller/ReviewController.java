package com.pinmall.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.pinmall.domain.ReviewVO;
import com.pinmall.dto.MemberDTO;
import com.pinmall.service.ReviewService;
import com.pinmall.util.Criteria;
import com.pinmall.util.PageMaker;

@Controller
@RequestMapping("/review/*")
public class ReviewController {

	@Inject
	private ReviewService service;
	private static final Logger logger = LoggerFactory.getLogger(ReviewController.class);
	
	
	//상품후기 쓰기
	@ResponseBody
	@RequestMapping(value = "write",method = RequestMethod.POST )
	public void writeReview(ReviewVO vo,HttpSession session) throws Exception{
		
		logger.info("상풍후기 작성" + vo.toString());
		
		MemberDTO dto = (MemberDTO)session.getAttribute("user");

		logger.info("user : " + dto.toString());
		
		service.writeReview(vo, dto.getMemt_id());
	}
	
	//상품후기리뷰
	@RequestMapping(value = "{pdt_nb}/{page}",method = RequestMethod.GET)
	public ResponseEntity<Map<String, Object>> listReview(
									@PathVariable("pdt_nb") Integer pdt_nb,
									@PathVariable("page") Integer page){
		
		logger.info("리뷰 가져오는중");
		
		ResponseEntity<Map<String, Object>> entity = null;
		
		try {
			Criteria cri = new Criteria();
			cri.setPage(page);
			
			PageMaker pageMaker = new PageMaker();
			pageMaker.setCri(cri);
			
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("pdt_nb", pdt_nb);
			map.put("cri", cri);
			
			List<ReviewVO> list = service.listReview(map);
			
			map.put("list", list);
			
			int replyCount = service.countReview(pdt_nb);
			pageMaker.setTotalCount(replyCount);
			map.put("pageMaker", pageMaker);
			
			logger.info(map.toString());
			entity = new ResponseEntity<Map<String,Object>>(map,HttpStatus.OK);
		}catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<Map<String,Object>>(HttpStatus.BAD_REQUEST);
		}
		
		return entity;
	}
	
	//상품후기 삭제
	@ResponseBody
	@RequestMapping(value = "{rv_nb}" , method = RequestMethod.DELETE)
	public ResponseEntity<String> deleteReview(@PathVariable("rv_nb") int rv_nb) throws Exception{
		
		ResponseEntity<String> entity = null;
		
		try {
			service.deleteReview(rv_nb);
			entity = new ResponseEntity<String>(HttpStatus.OK);
		} catch(Exception ex) {
			entity = new ResponseEntity<String>(HttpStatus.BAD_REQUEST);
			ex.printStackTrace();
		}
		
		return entity;
	}
	
	//상품후기 수정
	@ResponseBody
	@RequestMapping(value = "modify",method = RequestMethod.POST)
	public ResponseEntity<String> modifyReview(ReviewVO vo) throws Exception{
		
		ResponseEntity<String> entity = null;
		
		try {
			service.modifyReview(vo);
			entity = new ResponseEntity<String>(HttpStatus.OK);
		} catch(Exception ex) {
			ex.printStackTrace();
			entity = new ResponseEntity<String>(HttpStatus.BAD_REQUEST);
		}
		
		return entity;
	}
}
