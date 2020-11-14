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
						<table class="table table-striped text-center">
						<thead>
							<tr>
								<th><input type="checkbox" id="checkAll" checked="checked" /></th>
								<th>회원 아이디</th>
								<th>상품번호</th>
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
									<input type="hidden" name="pdt_nb_${list.pdt_nb }" value="${list.pdt_nb }">
									<p>${list.pdt_nb }</p>
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
