<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!--DOCTYPE html-->
<html>
<head>

  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <%-- Handlebar Template --%>
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
  <title>PinMall Homepage</title>

  <!-- Bootstrap core CSS -->
  <link href="/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet" >

  <!-- Custom styles for this template -->
  <link href="/css/shop-homepage.css" rel="stylesheet">
  
    

	<script>
		if("${msg}"=="LOGIN_SUCCESS"){
			alert("로그인 되었습니다.\n환영합니다!");
			
		} else if("${msg}"=="LOGOUT_SUCCESS"){
			alert("로그아웃 되었습니다.");
			
		} else if("${msg}"=="REGISTER_SUCCESS"){
			alert("성공적으로 회원가입 되었습니다.\n로그인 해주세요.");
			
		} else if("${msg}"=="MODIFY_USER_SUCCESS"){
			alert("회원 정보가 수정되었습니다.");
			
		} else if("${msg}"=="CHANGE_PW_SUCCESS"){
			alert("비밀번호가 성공적으로 변경되었습니다.");
			
		}  else if("${msg}"=="DELETE_USER_SUCCESS"){
			alert("회원 탈퇴되었습니다. 감사합니다.");
			
		} 

		</script>
		
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


  
      <!-- /.col-lg-3 -->

      <div class="col-lg-9">
      
        <div id="carouselExampleIndicators" class="carousel slide my-4" data-ride="carousel">
          <ol class="carousel-indicators">
            <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
            <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
            <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
          </ol>
          <div class="carousel-inner" role="listbox">
          <div class="carousel-item active">
              <img class="d-block img-fluid" src="/resources/img/mainImg1.jpg" alt="1slide" width="900px" height="250px"/>
           </div>

           <div class="carousel-item">
              <img class="d-block img-fluid" src="/resources/img/mainImg2.jpg" alt="2slide" width="900px" height="250px"/>
           </div>
           <div class="carousel-item">
              <img class="d-block img-fluid" src="/resources/img/mainImg3.jpg" alt="3slide" width="900px" height="250px"/>
           </div>
         
          </div>
          <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
            <span class="sr-only">Previous</span>
          </a>
          <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
            <span class="carousel-control-next-icon" aria-hidden="true"></span>
            <span class="sr-only">Next</span>
          </a>
        </div>
		<h3 class="my-4">전체상품</h3>
        <div class="row">
	
	<c:forEach items="${productAll}" var="pdtl">
          <div class="col-lg-4 col-md-6 mb-4">
            <div class="card h-100">
              <a href="/product/read?&pdt_nb=${pdtl.pdt_nb}&cate_ncategory=${pdtl.cate_ncategory}">
              <img class="card-img-top" src="/product/displayFile?fileName=${pdtl.pdt_img}"  alt="" width="500px" height="200px"></a>
              <div class="card-body">
                <h5 class="card-title">
                  <a href="/product/read?&pdt_nb=${pdtl.pdt_nb}&cate_ncategory=${pdtl.cate_ncategory}">${pdtl.pdt_name}</a>
                </h5>
                <p>가격: <fmt:formatNumber value="${pdtl.pdt_price}" pattern="###,###,###" />원
              </div>
              <div class="card-footer">
              </div>
            </div>
          </div>
	</c:forEach>

        </div>
        <!-- /.row -->
	
      </div>
      <!-- /.col-lg-9 -->

    </div>
    <!-- /.row -->

  </div>
  <!-- /.container -->

  <!-- Footer(하단) -->
 <%@ include file="/WEB-INF/views/include/footer.jsp" %>

  <!-- Bootstrap core JavaScript -->
  <script src="/vendor/jquery/jquery.min.js"></script>
  <script src="/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

</body>

</html>