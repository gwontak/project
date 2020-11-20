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
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
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
				<h1 class="my-4">게시판</h1>
			</div>
				<div style="display: inline-block; float: left; margin-left:15px;">
					<select name="searchType" style="width:180px; height:40px">
						<option value="null"
							<c:out value="${cri.searchType == null?'selected':''}" />>선택</option>
						<option value="title"
							<c:out value="${cri.searchType eq 'id'?'selected':''}" />>제목</option>	
						<option value="id"
							<c:out value="${cri.searchType eq 'pdt'?'selected':''}" />>작성자</option>
						<option value="date"
							<c:out value="${cri.searchType eq 'review'?'selected':''}" />>작성일</option>
						<option value="title_id"
							<c:out value="${cri.searchType eq 'id_code'?'selected':''}" />>제목 + 작성자</option>
						<option value="title_date"
							<c:out value="${cri.searchType eq 'id_code'?'selected':''}" />>제목 + 작성일</option>
						<option value="all"
							<c:out value="${cri.searchType eq 'id_code'?'selected':''}" />>작성자 + 제목 + 작성일</option>	
					</select>
					<input type="text" name='keyword' id="keyword" style="width:250px; height:30pt; padding-left:5px;" value='${cri.keyword}' />
					<button id="btn_search" class="btn btn-default">검색</button>
				</div>
				<form method="post" action="/board/read">
					<table class="table table table-shopping-cart table-style">
							<tr>
								<th>제목</th>
								<th>작성자</th>
								<th>작성일</th>
							</tr>
						
						<!-- 게시물이 존재하지 않는 경우 -->
					    <c:if test="${empty cartProductList}">
							<tr>
							<td colspan='6'>작성한 게시물이 없습니다.</td>
							</tr>
						</c:if>
						
						<!-- 게시물이 존재할 경우 -->
						<c:set var="i" value="${fn:length(board)}" ></c:set>
						<c:forEach items="${board}" var="board">
							<tr>
								<td>${i}</td>
								<td>
									<a href="/board/read?memet_id=${board.memt_id}&brd_nb=${board.brd_nb}">
										${board.titel}
									</a>
								</td> 
								<td >
									<p>${board.memt_id}</p>
								</td>
								<td>
									<p>${board.brd_date}</p>
								</td>
								<c:set var="i" value="${i-1}" ></c:set>
							</tr>
						</c:forEach>
					</table>
						<button class="btn btn-primary" id="btn_write_review" type="button" >글쓰기 </button>
				</form>
				</div><br><br>
				
				<!-- 페이징기능 -->
				<div class="box-footer">
					<div class="text-center">
						<ul class="pagination">
							<!-- 이전 표시여부 -->
							<c:if test="${pm.prev}">
								<li><a href="list${pm.makeSearch(pm.startPage -1)}">&lt;</a>
								</li>
							</c:if>
							
							<!-- 페이지 번호 -->
							<c:forEach begin="${pm.startPage}" end="${pm.endPage}" var="idx">
								<li<c:out value="${pm.cri.page == idx?;class = active':''}" />>
								</li>
							</c:forEach>
							
							<!-- 다음 표시 여부 -->
							<c:if test="${pm.bext && pm.endPage > 0}">
								<li><a href="list${pm.makeSearch(pm.endPage +1) }" >&gt;</a> 
								</li>
							</c:if>
						</ul>
					</div>
				</div>
									
				</div>
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