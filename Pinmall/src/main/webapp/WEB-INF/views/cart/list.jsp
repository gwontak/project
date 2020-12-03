<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!--DOCTYPE html-->
<html>
<head>


  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">
  <%-- Handlebar Template --%>
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script> 
  <title>PinMall Homepage</title>

  <!-- Bootstrap core CSS -->
  <link href="/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet" >

  <!-- Custom styles for this template -->
  <link href="/css/shop-homepage.css" rel="stylesheet">
  
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script type="text/javascript" src="/resources/js/cart/list.js"></script>
    

<!-- ul 스타일 적용 -->
<style>
ul{
   list-style:none;
   padding-left:0px;
   text-align: left;
   }

.pt-5, .py-5 {

   width:100%;
   height:100px;
   position:absolute;
   bottom:0;
   text-align: center;

}
</style>
	
</head>

<body>

      <!-- Navigation(상단) -->
	<%@ include file="/WEB-INF/views/include/top.jsp" %>
	<div class="container">
    <div class="row">
	<!-- Page left (왼쪽) -->
    <%@ include file="/WEB-INF/views/include/left.jsp" %>

    <div class="col-lg-9">
     <div class="container no-gutter">
	 	<div class="row no-gutter2 row-no-gutter">
	       <div class="col-xs-12">
				<h1 class="my-4">
					장바구니
				</h1>
			</div>
				<form method="post" action="/order/buyFromCart">
					<div class="btn-container" style="display: inline-block; float: right; margin:20px 10px 5px 5px;">
							<button id="btn_buy"  class="btn btn-primary" type="submit" >선택 상품 구매</button>
							<button id="btn_delete_check"  class="btn btn-default" >선택 상품 삭제</button>
					</div>
					<table class="table table table-shopping-cart table-style">
							<tr>
								<th><input type="checkbox" id="checkAll" checked="checked"/>상품체크</th>
								<th>번호</th>
								<th>상품 이미지</th>
								<th>상품명</th>
								<th>가격</th>
								<th>수량</th>
							</tr>
						
						<!-- 상품이 존재하지 않는 경우 -->
					    <c:if test="${empty cartProductList}">
							<tr>
							<td colspan='6'>상품이 없습니다.</td>
							</tr>
						</c:if>
						
						<!-- 상품이 존재할 경우 -->
						<c:set var="i" value="${fn:length(cartProductList)}" ></c:set>
						<c:forEach items="${cartProductList}" var="cartProductVO">
							<tr>
								<td>
									<input type="checkbox" name="check" class="check" value="${cartProductVO.cart_code}" checked="checked" >
									<input type="hidden" id="pdt_nb_${cartProductVO.cart_code}" name="pdt_nb" value="${cartProductVO.pdt_nb }">		
									<input type="hidden" name="cart_amount" value="${cartProductVO.cart_amount}">
									<input type="hidden" name="cart_code" value="${cartProductVO.cart_code}">					
								</td>
								<td>${i}</td>
								<td>
									<a href="/product/read?pdt_nb=${cartProductVO.pdt_nb}&cate_ncategory=${cate_ncategory}">
										<img src="/product/displayFile?fileName=${cartProductVO.pdt_img}" style="width: 100px" alt="사진">
									</a>
								</td> 
								<td >
									<a href="/product/read?pdt_num=${cartProductVO.pdt_nb}&cate_ncategory=${cate_ncategory}"
										style="color: black;"> ${cartProductVO.pdt_name} </a>
								</td>
								<td>
									<p>${cartProductVO.pdt_price}</p>
									<input type="hidden" name="price_${cartProductVO.cart_code}" value="${cartProductVO.pdt_price}" /></td>
								<td>
									<input type="number" name="cart_amount_${cartProductVO.cart_code}"
										style="width:60px; height:34px; padding-left:5px;" value="${cartProductVO.cart_amount}" />
										<input type="hidden" class="btn btn-default" name="ord_amount" value="${cartProductVO.cart_code}">
									<button type="button" name="btn_modify" class="btn btn-default" value="${cartProductVO.cart_code}">변경</button>
								</td>
								<c:set var="i" value="${i-1}" ></c:set>
							</tr>
						</c:forEach>
					</table>
				</form>
				</div>
				
				<div class="row"> 
					<table>	
							<tr>
								<td colspan="5" class="text-left" style="text-align:left;"></td>
								<td class="table-shopping-cart-title"></td>
								<td colspan="1" class="text-center">
									총 상품금액 : 
								<span class="total-cost-title" id="totalPrice"></span>
								</td>
							</tr>
					</table>
				
				</div>
	    <!-- /.row -->
		</div>
		
	  <!-- /.col-lg-9 -->	
	   </div>
	
    <!-- /.row -->
    </div>

<!-- /.container -->
 </div>

  <!-- Footer(하단) -->
 <%@ include file="/WEB-INF/views/include/footer.jsp" %>

  <!-- Bootstrap core JavaScript -->
  <script src="/vendor/jquery/jquery.min.js"></script>
  <script src="/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

</body>

</html>