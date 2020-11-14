<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>

  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <meta name="description" content="">
  <meta name="author" content="">
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">	

  <title>PinMall Homepage</title>

  <!-- Bootstrap core CSS -->
  <link href="/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet" >

  <!-- Custom styles for this template -->
  <link href="/css/shop-homepage.css" rel="stylesheet">

  
</head>		 
  <!-- 부가적인 테마 -->
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<body>

  <!-- Navigation(상단) -->
	<%@ include file="/WEB-INF/views/include/top.jsp" %> 

  <!-- Page Content(본문) -->
  <div class="container">	
  	<div class="row">  
  	  <!-- Page left (왼쪽) -->
	  <%@ include file="/WEB-INF/views/include/left_chek.jsp" %>
	  
	   <div class="col-9" style="padding: 1px 1px 200px 3px;">
	    <form id="deleteform" action="/member/delete" method="post" >	    	
	       <div class="container" style="width: 800px; padding: 10% 5%;">
	       	<h2>회원 탈퇴</h2>  
	       		회원 탈퇴를 원하실경우 확인을 눌러 주세요.
				<div class="form-group">
					<input type="hidden" name="memt_id" value="${sessionScope.user.memt_id}" />
					<input type="submit" id="btn_submit" name="btn_submit" class="btn btn-primary" value="확인">
					<input type="button" id="btn_cancle" class="btn btn-default" value="취소" onclick="location.href='/';">
				</div> 
			 </div>
	    	</form>
	      </div> 	    
   		</div>
   </div>
   
  <!-- Footer(하단) -->
 <%@ include file="/WEB-INF/views/include/footer.jsp" %>

  <!-- Bootstrap core JavaScript -->
  <script src="/vendor/jquery/jquery.min.js"></script>
  <script src="/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  


</body>

</html>