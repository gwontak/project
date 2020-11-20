<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>       
    
    
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title>PinMall</title>
		<meta name="description" content="description">
		<meta name="author" content="DevOOPS">
		<meta name="viewport" content="width=device-width, initial-scale=1">
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
	
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script type="text/javascript" src="/resources/js/admin/review.js"></script>
	
	</head>
<body>
<header class="navbar">
 <!-- header(상단) -->
 <%@include file="/WEB-INF/views/include/damin_header.jsp" %>
</header>
<div id="main" class="container-fluid">
	<div class="row">
	<!-- left Container-->
	<%@include file="/WEB-INF/views/include/damin_left.jsp" %>
		<!--Start Content-->
	 <div id="content" class="col-xs-12 col-sm-10">		
		<div class="preloader" style="padding:5%;">
			<h3>리뷰 게시판 관리</h3>
			<div class="col-md-12">
				<div class="row text-center">
					<div class="row text-center">
						<div style="display: inline-block; float: left; margin-left:15px;">
							<select name="searchType" style="width:180px; height:40px">
								<option value="null"
									<c:out value="${cri.searchType == null?'selected':''}" />>선택</option>
								<option value="id"
									<c:out value="${cri.searchType eq 'id'?'selected':''}" />>회원 아이디</option>	
								<option value="pdt"
									<c:out value="${cri.searchType eq 'pdt'?'selected':''}" />>상품 번호</option>
								<option value="review"
									<c:out value="${cri.searchType eq 'review'?'selected':''}" />>리뷰 번호</option>
								<option value="id_pdt"
									<c:out value="${cri.searchType eq 'id_code'?'selected':''}" />>회원 아이디 + 상품 번호</option>
								<option value="id_review"
									<c:out value="${cri.searchType eq 'id_code'?'selected':''}" />>회원 아이디 + 리뷰 번호</option>
								<option value="all"
									<c:out value="${cri.searchType eq 'id_code'?'selected':''}" />>회원 아이디 + 리뷰 번호 + 상품 번호</option>	
							</select>
							<input type="text" name='keyword' id="keyword" style="width:250px; height:30pt; padding-left:5px;" value='${cri.keyword}' />
							<button id="btn_search" class="btn btn-default">검색</button>
						</div>
						<table class="table table-striped text-center">
						<thead>
							<tr>
								<th><input type="checkbox" id="checkAll" checked="checked" /></th>
								<th>회원 아이디</th>
								<th>상품번호</th>
								<th>리뷰번호</th>
								<th>리뷰내용</th>
								<th>작성번호</th>
								<th>리뷰 작성일</th>
							</tr>
						</thead>
						<tbody>
						
						<!-- 상품이 존재하지 않는 경우 -->
					    <c:if test="${empty list}">
							<tr>
							<td colspan='6'>작성된 리뷰가 없습니다.</td>
							</tr>
						</c:if>
						
						<!-- 상품이 존재할 경우 -->
						<c:forEach items="${list}" var="list">
							<tr>
								<td>
									<input class="check" type="checkbox" name="check" value="${list.rv_nb}">
								</td>
								<td>
									<input type="hidden"  name="memt_id" value="${list.memt_id }">
									<p>${list.memt_id }</p>
								</td>
									<td>
									<input type="hidden"  name="memt_id_${pdt_nb}" value="${list.pdt_nb }">
									<p>${list.pdt_nb }</p>
								</td>  
								<td>
									<input type="hidden" name="rv_nb_${list.rv_nb }" value="${list.rv_nb }">
									<p>${list.rv_nb }</p>
								</td>
								<td >
									<p>${list.rv_content}</p> 
								</td>
								<td>
									<input type="hidden" name="rv_score_${list.rv_score}" value="${list.rv_score}">
									<p>${list.rv_score}</p> 
								</td>
								<td>
									<p><fmt:formatDate pattern="yyyy년MM월dd일" value="${list.rv_date}" /></p>
								</td>
								</tr>
						</c:forEach>	

						</tbody>
					</table>
						<div class="text-center" style="float: left;">
							<button id="btn_submit" class="btn btn-flat" type="button" style="padding: 10px 40px; background-color: grey; color:white;">선택한 리뷰 삭제</button>
						</div><br><br>
	
					<!-- 페이징 기능 -->
					<div class="box-footer">
						<div class="text-center">
							<ul class="pagination">
								<!-- 이전 표시여부 -->
								<c:if test="${pm.prev}">
									<li><a href="list${pm.makeSearch(pm.startPage-1)}">&lt;</a>
									</li>
								</c:if>	
								
								<!-- 페이지 번호 -->
								<c:forEach begin="${pm.startPage}" end="${pm.endPage}" var="idx">
									<li<c:out value="${pm.cri.page == idx?'class = active':''}" />>
										<a href="list${pm.makeSearch(idx)}">${idx}</a>
									</li>
								</c:forEach>							
								
								<!-- 다음표시 여부 -->
								<c:if test="${pm.next && pm.endPage >0 }">
									<li><a href="list${pm.makeSearch(pm.endPage +1)}">&gt;</a>
									</li>
								</c:if>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>
		</div>
	</div>
	</div>
</div>
<!--End Container-->
<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<!--<script src="http://code.jquery.com/jquery.js"></script>-->
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
