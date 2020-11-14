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

  <!-- 비밀번호 확인을 위한 js  -->
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>	
  <script type="text/javascript" src="/resources/js/member/changePW.js"></script>
  
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
	    <form id="changePWFrom" action="/member/changePW" method="post" >	    	
	       <div class="container" style="width: 800px; padding: 10% 5%;">
	       	<h2>비밀번호 확인</h2>  
      		  <div class="form-group">
      		  		<input type= "hidden" name="memt_id" value="${sessionScope.user.memt_id}" />
					<input type="password" class="form-control" id="memt_pw" class="form-control"
						placeholder="현재 비밀번호를 입력해주세요" style="max-width: 630px;">
					<input type="password" class="form-control" id="memt_changePW" name="memt_pw" class="form-control"
						placeholder="변경할 비밀번호를 입력해주세요" style="max-width: 630px; margin: 7px 0px;">
					<input type="password" class="form-control" id="memt_scheckPW" class="form-control"
						placeholder="변경할 비밀번호를 다시 입력해주세요" style="max-width: 630px;">
				</div> 
				<div class="form-group">
					<input type="button" id="btn_submit" class="btn btn-primary" value="확인">
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