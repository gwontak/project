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

  <title>PinMall Homepage</title>

  <!-- Bootstrap core CSS -->
  <link href="/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet" >

  <!-- Custom styles for this template -->
  <link href="/css/shop-homepage.css" rel="stylesheet">
  
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script type="text/javascript" src="/resources/js/order/orderComplete.js"></script>
    

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
		<div class="col-xs-12">
			<h1 class="my-4">
					상품구매 <small>주문내역</small>
				</h1>
		</div>

		<%-- MAIN CONTENT --%> 
		<section class="content container-fluid">
			<div class="box" style="border: none; padding:200px 50px; text-align: center;">
				<div class="box-body"  >
					<h3>해당 상품의 주문이 완료되었습니다.</h3><br>
					<button type="button" id="btn_orderList" class="btn btn-primary">주문내역 확인</button>
					<button type="button" id="btn_main" class="btn btn-default">쇼핑 계속하기</button>
				</div>
			</div>
		</section>
		
		</div>		
      <!-- /.col-lg-9 -->

    	</div>
        </div>


  <!-- Footer(하단) -->
 <%@ include file="/WEB-INF/views/include/footer.jsp" %>

  <!-- Bootstrap core JavaScript -->
  <script src="/vendor/jquery/jquery.min.js"></script>
  <script src="/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

</body>

</html>