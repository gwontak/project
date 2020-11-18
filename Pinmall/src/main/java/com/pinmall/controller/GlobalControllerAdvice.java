package com.pinmall.controller;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ModelAttribute;

import com.pinmall.service.ProductService;

@ControllerAdvice(basePackages = {"com.pinmall.controller"})
public class GlobalControllerAdvice {

	@Inject
	private ProductService service;
	private static final Logger logger = LoggerFactory.getLogger(GlobalControllerAdvice.class);
	
	
	//1차카테고리 메뉴 표시
	@ModelAttribute
	public void categoryList(Model model) throws Exception{
		model.addAttribute("userCategoryList", service.mainCGList());
	}
	
	//home페이지 상품리스트 출력
	@ModelAttribute
	public void productMainList(Model model) throws Exception{

		logger.info("상품리스트 출력");
		model.addAttribute("productAll",  service.productList());
		
		
	}
	
	
}
