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
  <script type="text/javascript" src="/resources/js/admin/Admember.js"></script>
	
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
			<h3>회원 정보 관리</h3>
			<div class="col-md-12">
				<div class="row text-center">
					<div class="row text-center">
						<table class="table table-striped text-center">
						<thead>
							<tr>
								<th><input type="checkbox" id="checkAll" checked="checked" /></th>
								<th>회원 아이디</th>
								<th>회원명</th>
								<th>닉네임</th>
								<th>메일 수신여부</th>
								<th>가입일</th>
								<th>최근 접속일</th>
							</tr>
						</thead>
						<tbody>
						
						<!-- 상품이 존재하지 않는 경우 -->
					    <c:if test="${empty member}">
							<tr>
							<td colspan='6'>상품이 없습니다.</td>
							</tr>
						</c:if>
						
						<!-- 상품이 존재할 경우 -->
						<c:forEach items="${member}" var="member">
							<tr>
								<td>
									<input class="check" type="checkbox" name="check" value="${member.memt_id}">
								</td>
								<td>
									<input type="hidden"  name="memt_id" value="${member.memt_id }">
									<p>${member.memt_id }</p>
								</td> 
								<td >
									 <p>${member.memt_name}</p> 
								</td>
								<td>
									<p>${member.memt_sname}</p> 
								</td>
								<td>
									<p>${member.memt_accept_e}</p> 
								</td>
								<td>
									<p><fmt:formatDate pattern="yyyy년MM월dd일" value="${member.memt_joined}" /></p>
								</td>
								<td>
									<p><fmt:formatDate pattern="yyyy년MM월dd일" value="${member.memt_lasttime}" /></p>
								</td>
								</tr>
						</c:forEach>	

						</tbody>
					</table>
						<div class="text-center" style="float: left;">
							<button id="btn_submit" class="btn btn-flat" type="button" style="padding: 10px 40px; background-color: grey; color:white;">선택한 회원 탈퇴</button>
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
