<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>


<head>

 <meta name="viewport" content="width=device-width, initial-scale=1">
  <meta name="description" content="">
  <meta name="author" content="">
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">	

  <title>Shop Homepage - Start Bootstrap Template</title>

  <!-- Bootstrap core CSS -->
  <link href="/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet" >

  <!-- Custom styles for this template -->
  <link href="/css/shop-homepage.css" rel="stylesheet">
  
  <!-- 아래스크립을 사용하기위해서 작성하는 j쿼리 -->
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  
  <!-- 아이디 로그인을 위한 js -->
  <script type="text/javascript" src="/resources/js/member/login.js"></script>
  <script>
	if("${msg}"=="LOGIN_FAIL"){	
		alert("로그인에 실패하였습니다.\n아이디와 비밀번호를 다시 확인해주세요.");
	}
	</script>
</head>	 
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
<style>
	.loginform {
	    width: 340px;
	    margin: 50px auto;
	  	font-size: 15px;
	}
	.loginform form {
	    margin-bottom: 15px;
	    background: #f7f7f7;
	    box-shadow: 0px 2px 2px rgba(0, 0, 0, 0.3);
	    padding: 30px;
	}
	.loginform h2 {
	    margin: 0 0 15px;
	}
	.form-control, .btn {
	    min-height: 38px;
	    border-radius: 2px;
	}
	.btn {        
	    font-size: 15px;
	    font-weight: bold;
	}
</style>
<body>

  <!-- Navigation(상단) -->
	<%@ include file="/WEB-INF/views/include/top.jsp" %>

 	 <!-- Page Content(본문) -->
	  <div class="container">	     
		 <div >
				<div class="loginform" >
				    <form id="loginForm" action="/member/loginPOST" method="post">
				        <h2 class="text-center">로그인</h2>       
				        <div class="form-group">
				            <input type="text" id="memt_id" name="memt_id" class="form-control" placeholder="아이디 입력" required="required"><br />
				            <input type="password" id="memt_pw" name="memt_pw" class="form-control" placeholder="패스워드 입력" required="required"><br />
				            <button type="button" id="btn_login" name="btn_login" class="btn btn-primary btn-block">로그인</button>
				        </div>
				        <div class="clearfix">
				            <a href="#" class="float-right">비밀번호 찾기</a>
				        </div>        
				    </form>
				    <p class="text-center"><a href="#">Create an Account</a></p>
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