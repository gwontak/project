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

import com.pinmall.domain.CategoryVO;
import com.pinmall.domain.productVO;
import com.pinmall.service.ProductService;
import com.pinmall.util.Criteria;
import com.pinmall.util.FileUtils;
import com.pinmall.util.PageMaker;

@Controller
@RequestMapping("product/*")
public class ProductController {
	
	@Inject
	private ProductService service;
	private static final Logger logger = LoggerFactory.getLogger(ProductController.class);
	
	//웹 프러젝트 영역 외부에 파일을 저장할 떄 사용할 경로
	@Resource(name="uploadPath")
	private String uploadPath;

	//해당카테고리 상품리스트 출력
	@RequestMapping(value = "list", method = RequestMethod.GET)
	public void list(@ModelAttribute("cri") Criteria cri,
					@ModelAttribute("cate_ncategory") String cate_ncategory, Model model) throws Exception{
		
		logger.info("2차출력");
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("cate_ncategory", cate_ncategory);
		map.put("rowStart", cri.getRowStart());
		map.put("rowEnd", cri.getRowEnd());
		logger.info(map.toString());
		
		//1차카테고리 코드에해당하는 상품리스트
		List<productVO> list = service.productListCG(map);
		logger.info(list.toString());
		model.addAttribute("productList", list);
		
		//카테고리 이름
		model.addAttribute("cate_categoryname", service.getCTName(cate_ncategory));
		logger.info("카테고리 이름 추가"+model.toString());
		
		//PageMaker생성
		PageMaker pm = new PageMaker();
		pm.setCri(cri);
		int count = service.productCount(cate_ncategory);
		pm.setTotalCount(count);
		
		model.addAttribute("pm",pm);
		
	}

	
	
	//1차카테고리에 따른 2차카테고리 출력
	@ResponseBody
	@RequestMapping(value = "subCGList/{cate_ncategory}",method = RequestMethod.GET)
	public ResponseEntity<List<CategoryVO>> subCGListPOST(@PathVariable("cate_ncategory") String cate_ncategory) throws Exception{
		
		logger.info("2차카테고리 출력");
		
		ResponseEntity<List<CategoryVO>> entity = null;
		
		try {
			logger.info("===="+service.subCGList(cate_ncategory));
			entity = new ResponseEntity<List<CategoryVO>>(service.subCGList(cate_ncategory),HttpStatus.OK);
		} catch(Exception ex) {
			entity = new ResponseEntity<List<CategoryVO>>(HttpStatus.BAD_REQUEST);
			
		}
		
		return entity;
	}
	
	//파일 출력
	@RequestMapping(value = "displayFile",method = RequestMethod.GET)
	public ResponseEntity<byte[]> displayFile(String fileName) throws Exception{
		
		return FileUtils.getFile(uploadPath, fileName);
	}
	
	//상세정보페이지
	@RequestMapping(value = "read",method = RequestMethod.GET)
	public void productRead(@ModelAttribute("cri") Criteria cri,
							@RequestParam("pdt_nb")	int pdt_nb,Model model) throws Exception{
		
		logger.info("상세정보 진행");
		productVO vo = service.productRead(pdt_nb);
		vo.setPdt_img(FileUtils.thumbToOriginName(vo.getPdt_img()));
		logger.info("========"+vo.toString());
		
		model.addAttribute("productone", vo);
		
		PageMaker pm = new PageMaker();
		pm.setCri(cri);
		
		model.addAttribute("pm", pm);
		
		
		
	}
}
