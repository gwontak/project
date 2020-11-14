<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!--DOCTYPE html-->
<html>
<head>


  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>PinMall Homepage</title>

  <!-- Bootstrap core CSS -->
  <link href="/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet" >

  <!-- Custom styles for this template -->
  <link href="/css/shop-homepage.css" rel="stylesheet">
  
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    

<!-- ul 스타일 적용 -->
<style>
ul{
   list-style:none;
   padding-left:0px;
   text-align: left;
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
				<h1 class="my-4">
					주문내역
				</h1>
		<div class="container">
			<div class="web-cart row no-gutter2 row-no-gutter">
				<div class="col-md-12">
					<table class="table table table-shopping-cart table-style">
						<thead>
							<tr>
								<th>상품 이미지</th>
								<th>상품명</th>
								<th></th>
								<th>구매 날짜</th>
								<th>가격</th>
								<th>수량</th>
								<th>상세조회</th>
							</tr>
						</thead>
						<tbody>
						
						<!-- 상품이 존재하지 않는 경우 -->
					    <c:if test="${empty orderList}">
							<tr>
							<td colspan='6'>상품이 없습니다.</td>
							</tr>
						</c:if>
						
						<!-- 상품이 존재할 경우 -->
						<c:forEach items="${orderList}" var="list">
							<tr>
								<td>
									<input type="hidden"  name="pdt_nb" value="${list.pdt_nb }">
									<input type="hidden"  name="odr_code" value="${list.odr_code }">
										<img src="/product/displayFile?fileName=${list.pdt_img}" style="width: 100px" alt="사진">
								</td> 
								<td >
									<a href="/product/read?pdt_num=${list.pdt_nb}&cate_ncategory=${cate_ncategory}"
										style="color: black;"> ${list.pdt_name} </a>
								</td>
								<td></td>
								<td>
									<p><fmt:formatDate pattern="yyyy년MM월dd일" value="${list.odr_date}" /></p>
								</td>
								<td>
									<p>${list.odr_price}</p>
									<input type="hidden" name="price" value="${list.odr_price}" />
								</td>
								<td>
									<p>${list.odr_amount}</p>
										<input type="hidden" class="btn btn-default" name="ord_amount" value="${list.odr_amount}">
								</td>
								<td>
									<a href="/order/read?pdt_num=${list.pdt_nb}&odr_code=${list.odr_code}"
										style="color: black;">조회</a>
								</td>
								</tr>
						</c:forEach>	

						</tbody>
					</table>
				<div class="gap gap-small"></div>
			</div>


				</div>
			</div>
		</div>
	  <div class="gap"></div>
	</div>
</div>

  <!-- Footer(하단) -->
 <%@ include file="/WEB-INF/views/include/footer.jsp" %>

  <!-- Bootstrap core JavaScript -->
  <script src="/vendor/jquery/jquery.min.js"></script>
  <script src="/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

</body>

</html>