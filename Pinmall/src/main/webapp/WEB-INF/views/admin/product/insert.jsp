<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
		<!-- ck에디터를 사용하기위한 경로 -->
		<script src="/ckeditor/ckeditor.js"></script><!-- CKEditor -->
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
		<script type="text/javascript" src="/resources/js/admin/insert.js"></script>
				
<%-- Handlebar Template {{#each .}}는 결합되는 데이터가 복수로 들어올때 사용 --%>		 
<script id="subCGListTemplate" type="text/x-handlebars-template">
	<option value="default">2차카테고리 선택</option>
	{{#each .}}
	<option value="{{cate_ncategory}}">{{cate_categoryname}}</option>
	{{/each}}
</script>
<!-- CKEdtior작업+2차 카테고리 작업 -->
<script>
	$(document).ready(function(){
		
		var ckeditor_config = {
				resize_enabled : false,
				enterMode : CKEDITOR.ENTER_BR,
				shiftEntetMode : CKEDITOR.ENTER_P,
				toolbarCanCollapse : true,
				removePlugins : "elementspath",
				
				filebrowserUploadUrl : '/admin/product/imgUpload'
		};
		CKEDITOR.replace("pdt_detail", ckeditor_config);
		
		//1차카테고리에 따른 2차카테고리
	$("#mainCategory").on("change", function(){
		var mainCGcode = $(this).val();
		var url = "/admin/product/subCGList/" + mainCGcode;
		
		$.getJSON(url, function(data){
			
			subCGList(data, $("#subCategory") , $("#subCGListTemplate"))
			
			});
		});
		
	});
</script>

<!-- 카테고리를 두번이상 클릭시 중복제거 -->
<script>
	var subCGList = function(subCGStr, target, templateObject){
	
		var template = Handlebars.compile(templateObject.html());
		var options = template(subCGStr);
		
		$("#subCategory option").remove();
		target.append(options);
	}

</script>

</head>
<body>
<header class="navbar">
 <!-- header(상단) -->
 <%@include file="/WEB-INF/views/include/damin_header.jsp" %>
</header>
	<!-- 상품등록 -->
<div id="main" class="container-fluid">
	<div class="row">
	<!-- left Container-->
	<%@include file="/WEB-INF/views/include/damin_left.jsp" %>
	<form id='registerForm' role="form" action="/admin/product/insert" method="post" enctype="multipart/form-data">
 			
			  <div id="content" style="overflow:auto;" class="col-xs-12 col-sm-10">		
				<div class="preloader">
				<h3>상품 추가</h3>
					<div>
						<label>1차 카테고리</label>
						<select class="form-control" id="mainCategory" name="cate_pcategory" style="width:10%; margin-right:10px; display: inline-block;">
							<option value="default">선택</option>
							<c:forEach  items="${cateList}" var="vo">
								<option value="${vo.cate_ncategory}">${vo.cate_categoryname}</option>
							</c:forEach>
						</select>
		
						<label>2차 카테고리</label>
						<select class="form-control" id="subCategory" name="cate_ncategory" style="width:10%; margin-right:10px; display: inline-block;">
							<option value="default">선택</option>
						</select>
					</div>
					
				
					<div>
						<label for="exampleInputEmail1">상품명</label>
						<input style="width:40%; display: inline-block;" type="text" class="form-control" id="pdt_name" name="pdt_name" placeholder="Enter Product name">
					</div>
					
					<div>
						<label for="exampleInputEmail1">개발사</label>
						<input style="width:40%; display: inline-block;" type="text" class="form-control" id="pdt_company" name="pdt_company" placeholder="Enter Product company">
					</div>
				
					
					<div>
						<label for="exampleInputEmail1" style=" margin-right:10px;">상품 할인</label>
						<input  style="width:20%; display: inline-block;" class="form-control" type="text" id="pdt_dc" name="pdt_dc" placeholder="Enter dc">
						
					</div>
					
					<div>
						<label for="exampleInputEmail1" style=" margin-right:10px;">상품 가격</label>
						<input  style="width:20%; display: inline-block;" class="form-control" type="text" id="pdt_price" name="pdt_price" placeholder="Enter price">
						<label for="exampleInputEmail1" style="margin-right:10px;">상품 수량</label>
						<input  style="width:20%; display: inline-block;" class="form-control" type="text" id="pdt_amount" name="pdt_amount" placeholder="Enter discount price">
					</div>
					
					<div>
						<label for="exampleInputEmail1" style="margin-right:10px;">구매 가능 여부</label>
						<select class="form-control" id="pdt_buy" name="pdt_buy" style="width: 15%; display: inline-block;">
						  <option>Y</option>
						  <option>N</option>
						</select>
					</div>				
				
					<div>
						<label for="exampleInputPassword1">상품소개</label>
						<textarea class="form-control" id="pdt_detail" name="pdt_detail" rows="8"
							placeholder="Enter ..."></textarea>
					</div>
			
					<div>
						<label for="exampleInputEmail1">상품 이미지</label> <input 
							type="file" id="file1" name="file1" class="form-control" />
					</div>
					
					<div>

						<ul class="mailbox-attachments uploadedList"></ul>
						<button type="button" id="btn_submit" class="btn btn-primary">등록</button>
					</div>
					
			  	 </div>
	 		</div> 	
		</form>
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