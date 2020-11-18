<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>       
    
<!DOCTYPE html>
<html>
<head>
		<!-- 핸들바 사용 -->
		<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>    
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
<!-- 버튼 클릭 -->
<script id="subCGLISTTemplate" type="text/x-handlebars-template">
	{{#each .}}
	<div class="delete">
	<table class="table table-striped text-center">
		<thead>
			<tr>
				<th  style="width: 10%">선택한 번호</th>
				<th>상품 이미지</th>
				<th>상품 이름</th>
				<th>구매자 이름</th>
				<th>주 소</th>
				<th>핸드폰 번호</th>
				<th>주문 날짜</th>
			</tr>
		</thead>
		<tbody>
		
		<c:forEach items="list">
			<tr>
				<td style="width: 10%">{{odr_code}}</td>
				<td>
					<img src="/admin/product/displayFile?fileName={{pdt_img}}" style="width:50px">
				</td>
				<td >
					<p>
						{{pdt_name}}
					</p> 
				</td>
				<td>
					<p>{{odr_name}}</p>
				</td>
				<td >
					<div class="form-group">
						<span style="display: none;">{{odr_zipcode}}</span>
						<span>{{odr_add}}</span>
						<span>{{odr_dadd}}</span>
					</div> 
				</td>
				<td>
					<p>{{odr_ph}}</p> 
				</td>
				<td >
					<p>{{odr_date}}</p>
				</td>
			</tr>
		</c:forEach>
	</tbody>
	</table>
</div>
	{{/each}}
</script>
<script>
var subOrCode = function(subCGStr, target, templateObject){
	
	var template =  Handlebars.compile(templateObject.html());
	var options = template(subCGStr);
	
	$(".delete").remove();
	target.after(options);
}
</script>
<script>
$(document).ready(function(){
	
	//검색버튼
	$("#btn_search").on("click", function(){
		
		self.location = "OrderList"
			+ '${pm.makeQuery(1)}'
			+ "&searchType="
			+ $("select option:selected").val()
			+ "&keyword=" + $('#keyword').val();
	});
	
	//주문상세 내용
	$(".odr_code").on("click", function(){
		var	mainOrCode = $(this).val();
		var curtr = $(this).parent().parent().parent().parent();
		var url ="/admin/user/subOrCode/" + mainOrCode;
		alert(url);
		
		$.getJSON(url, function(data){
			
			subOrCode(data,curtr,$("#subCGLISTTemplate"))
			
		});
	});
});
</script>


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
	 <div id="content" class="col-xs-14 col-sm-10">		
		<div class="preloader" style="padding:5%;">
			<h3>주문 관리</h3>
			<div class="col-md-12">
				<div class="row text-center">
					<div class="row text-center">
						<div style="display: inline-block; float: left; margin-left:15px;">
							<select name="searchType" style="width:180px; height:40px">
								<option value="null"
									<c:out value="${cri.searchType == null?'selected':''}" />>선택</option>
								<option value="id"
									<c:out value="${cri.searchType eq 'id'?'selected':''}" />>구매자 아이디</option>	
								<option value="code"
									<c:out value="${cri.searchType eq 'code'?'selected':''}" />>상품 번호</option>
								<option value="id_code"
									<c:out value="${cri.searchType eq 'id_code'?'selected':''}" />>구매자 아이디 + 상품 번호</option>
							</select>
							<input type="text" name='keyword' id="keyword" style="width:250px; height:30pt; padding-left:5px;" value='${cri.keyword}' />
							<button id="btn_search" class="btn btn-default">검색</button>
						</div>
						<div class="box" style="border: none;">
						<div class="box-body">
						<table class="table table-striped text-center" >
						<thead>
							<tr>
								<th>주문 번호</th>
								<th></th>
								<th>구매자 아이디</th>
								<th></th>
								<th>구매 수량</th>
								<th>주문 가격</th>
							</tr>
	
						</thead>
						<tbody>
						
						<!-- 상품이 존재할 경우 -->
						<c:forEach items="${list}" var="list">
							<tr>
								<td style="width: 10%">
									<input type="button" style="width: 40px; " class="odr_code" value="${list.odr_code}"/> 
								</td>
								<td >
									<p></p> 
								</td>
								<td>
									<input type="hidden"  name="memt_id" value="${list.memt_id }">
									<input type="hidden"  name="pdt_nb_${list.odr_code}" value="${list.pdt_nb}">
									<p>${list.memt_id }</p>
								</td>
								<td >
									<p></p> 
								</td>
								<td>
									<p>${list.odr_amount}</p> 
								</td>
								<td >
									<p>${list.odr_price}</p> 
								</td>
							</tr>
		
						</c:forEach>	
					</tbody>
					</table>



					<!-- 페이징 기능 -->
					<div class="box-footer">
						<div class="text-center">
							<ul class="pagination">
								<!-- 이전 표시 -->
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
								<c:if test="${pm.next && pm.endPage >0}">
									<li><a href="list${pm.mageSearch(pm.endPage +1)}">&gt;</a>
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
