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
	<link href="pluginss/bootstrap/bootstrap.css" rel="stylesheet">
	<link href="pluginss/jquery-ui/jquery-ui.min.css" rel="stylesheet">
	<link href="http://maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css" rel="stylesheet">
	<link href='http://fonts.googleapis.com/css?family=Righteous' rel='stylesheet' type='text/css'>
	<link href="pluginss/fancybox/jquery.fancybox.css" rel="stylesheet">
	<link href="pluginss/fullcalendar/fullcalendar.css" rel="stylesheet">
	<link href="pluginss/xcharts/xcharts.min.css" rel="stylesheet">
	<link href="pluginss/select2/select2.css" rel="stylesheet">
	<link href="pluginss/justified-gallery/justifiedGallery.css" rel="stylesheet">
	<link href="csss/style_v2.css" rel="stylesheet">
	<link href="pluginss/chartist/chartist.min.css" rel="stylesheet">
  <!-- 아래스크립을 사용하기위해서 작성하는 j쿼리 -->
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script type="text/javascript" src="/resources/js/admin/admin_login.js"></script>
  <!-- 아이디 로그인을 위한 js -->
  <script>
	if("${msg}"=="LOGIN_FAIL"){	
		alert("로그인에 실패하였습니다.\n아이디와 비밀번호를 다시 확인해주세요.");
	}
	</script>
</head>	 
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
	<%@ include file="/WEB-INF/views/include/damin_header_login.jsp" %>

 	 <!-- Page Content(본문) -->
	  <div class="container">	     
		 <div >
				<div class="loginform" >
				    <form id="loginForm" action="/admin/loginPOST" method="post">
				        <h2 class="text-center">관리자 로그인</h2>       
				        <div class="form-group">
				            <input type="text" id="admin_id" name="admin_id" class="form-control" placeholder="아이디 입력" required="required"><br />
				            <input type="password" id="admin_pw" name="admin_pw" class="form-control" placeholder="패스워드 입력" required="required"><br />
				            <button type="button" id="btn_login" name="btn_login" class="btn btn-primary btn-block">로그인</button>
				        </div>
   
				    </form>
				</div>
		</div>
	</div>


  <!-- Bootstrap core JavaScript -->
  	<script src="pluginss/jquery/jquery.min.js"></script>
	<script src="pluginss/jquery-ui/jquery-ui.min.js"></script>
	<!-- Include all compiled plugins (below), or include individual files as needed -->
	<script src="pluginss/bootstrap/bootstrap.min.js"></script>
	<script src="pluginss/justified-gallery/jquery.justifiedGallery.min.js"></script>
	<script src="pluginss/tinymce/tinymce.min.js"></script>
	<script src="pluginss/tinymce/jquery.tinymce.min.js"></script>
	<!-- All functions for this theme + document.ready processing -->
	<script src="jss/devoops.js"></script>
</body>

</html>