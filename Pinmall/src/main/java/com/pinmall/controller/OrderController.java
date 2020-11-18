package com.pinmall.controller;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.pinmall.domain.OrderDetailVOList;
import com.pinmall.domain.OrderListVO;
import com.pinmall.domain.OrderVO;
import com.pinmall.domain.productVO;
import com.pinmall.dto.MemberDTO;
import com.pinmall.service.MemberService;
import com.pinmall.service.OrderService;
import com.pinmall.service.ProductService;

@Controller
@RequestMapping(value = "/order/*")
public class OrderController {

	@Inject
	private OrderService service;
	
	@Inject
	private ProductService productService;
	
	@Inject
	private MemberService memberService;
	
	
	private static final Logger logger = LoggerFactory.getLogger(OrderController.class);
	


	//상품구매GET
	@RequestMapping(value = "buy",method = RequestMethod.GET)
	public void buyGET(@RequestParam("ord_amount")  int ord_amount,
						@RequestParam("pdt_nb") int pdt_nb, Model model, HttpSession session) throws Exception{
		
		logger.info("==상품구매GET");
		
		List<productVO> prodcutList = new ArrayList<productVO>();
		List<Integer> amountList = new ArrayList<Integer>();
		
		prodcutList.add(productService.productRead(pdt_nb));
		amountList.add(ord_amount);
		
		model.addAttribute("productList", prodcutList);
		model.addAttribute("amountList", amountList);
		
		MemberDTO dto = (MemberDTO) session.getAttribute("user");
		model.addAttribute("user", memberService.readUser(dto.getMemt_id()));
		logger.info(model.toString());
	}
	
	//상품구매POST
	@RequestMapping(value = "order",method = RequestMethod.POST)
	public String orderPOST(OrderVO order,OrderDetailVOList oderDetailList,String memt_id,HttpSession session) throws Exception{
		
		logger.info("삼품구매POST"+order+oderDetailList+memt_id);
		
		MemberDTO dto = (MemberDTO) session.getAttribute("user");
		service.addOrder(order, oderDetailList, dto.getMemt_id());
		
		
		return "/order/orderComplete";
	}
	
	//장바구니GET
	@RequestMapping(value="buyFromCart", method = RequestMethod.POST)
	public void buyFromCartGET(@RequestParam("check") List<Integer> checkList,
								@RequestParam("pdt_nb") List<Integer> pdt_nbList,
								@RequestParam("cart_amount") List<Integer> cart_amountList,
								@RequestParam("cart_code") List<Integer> cart_codeList,
								Model model, HttpSession session) throws Exception {

			logger.info("장바구니 구매" + checkList);
			
			List<productVO> productList = new ArrayList<productVO>();
			List<Integer> amountList = new ArrayList<Integer>();
			
			for(int i=0; i<cart_codeList.size(); i++) {
			for(int j=0; j<checkList.size(); j++) {
				if(cart_codeList.get(i) == checkList.get(j)) {
					productList.add(productService.productRead((int)pdt_nbList.get(i)));
					amountList.add(cart_amountList.get(i));
					continue;
					
				} else {
					continue;
				}
			}
			}
			model.addAttribute("productList", productList);
			model.addAttribute("amountList", amountList);
			
			MemberDTO dto = (MemberDTO)session.getAttribute("user");
			model.addAttribute("user", memberService.readUser(dto.getMemt_id()));
			logger.info("장바구니 구매" + model.toString());
	}
	
	//주문 조회
	@RequestMapping(value = "list",method = RequestMethod.GET)
	public void orderList(Model model, HttpSession session) throws Exception{
		
		logger.info("주문조회");
		
		MemberDTO dto = (MemberDTO) session.getAttribute("user");
		List<OrderListVO> list = service.orderList(dto.getMemt_id());
		
		model.addAttribute("orderList", list);
		
	}
	
	//주문 상세 조회
	@RequestMapping(value = "read",method = RequestMethod.GET)
	public void orderDetail(int odr_code,Model model) throws Exception{
		
		logger.info("주문 상세조회");
		
		model.addAttribute("orderList", service.readOrder(odr_code));
		model.addAttribute("order", service.getOrder(odr_code));
	}
	
}
