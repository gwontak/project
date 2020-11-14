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
  
    

<!-- ul 스타일 적용 -->
<style>
ul{
   list-style:none;
   padding-left:0px;
   text-align: left;
   }
.mainCategory{
	list-style:none;
   padding-left:0px;
   text-align: left;

	}

li{

	padding-left:50px;
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
				<h1 class="my-4">
					${cate_categoryname}
				</h1>
 

        <div class="row">
	
		<c:forEach items="${productList}" var="productVO">
          <div class="col-lg-4 col-md-6 mb-4">
            <div class="card h-100">
              <a href="/product/read${pm.makeQuery(pm.cri.page)}&pdt_nb=${productVO.pdt_nb}&cate_ncategory=${cate_ncategory}">
              <img class="card-img-top" src="/product/displayFile?fileName=${productVO.pdt_img}" alt="상의" width="400px" height="200px">
              </a>
              <div class="card-body">
                <h4 class="card-title">
                  <a href="/product/read${pm.makeQuery(pm.cri.page)}&pdt_nb=${productVO.pdt_nb}&cate_ncategory=${cate_ncategory}">${productVO.pdt_name}</a>
                </h4>
                <p>가격: <fmt:formatNumber value="${productVO.pdt_price}" pattern="###,###,###" />원
              </div>
              <div class="card-footer">
                <small class="text-muted">&#9733; &#9733; &#9733; &#9733; &#9734;</small>
              </div>
            </div>
          </div>
		</c:forEach>


        <!-- /.row -->
	<!-- 페이지 표시 -->
      </div>
 			<div class="box-footer">
				<div class="text-center">
					<ul class="pagination">
					 	<c:if test="${pm.prev}">
					 		<li><a href="list${pm.makeQuery(pm.startpage-1)}&cate_ncategory=${cate_ncategory}">&lt;</a> 
						 	</li>
					 	</c:if>
					 	
					<c:forEach begin="${pm.startPage}" end="${pm.endPage}" var="idx">
				 		<li <c:out value="${pm.cri.page == idx?'class =active':''}" />>
				 			<a href="list${pm.makeQuery(idx)}&cate_ncategory=${cate_ncategory}">${idx}</a>
				 		</li>
				 	</c:forEach>
				 	
			 	<c:if test="${pm.next && pm.endPage > 0}">
			 		<li><a href="list${pm.makeQery(pm.endPage +1)}&cate_ncategory=${cate_ncategory}">&gt;</a>
			 		</li>
			 	</c:if>
			 </ul>
			</div>
	      </div>     
      <!-- /.col-lg-9 -->

    </div>
    <!-- /.row -->
        </div>
  </div>
  <!-- /.container -->
  </div>
  </div>

  <!-- Footer(하단) -->
 <%@ include file="/WEB-INF/views/include/footer.jsp" %>

  <!-- Bootstrap core JavaScript -->
  <script src="/vendor/jquery/jquery.min.js"></script>
  <script src="/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

</body>

</html>