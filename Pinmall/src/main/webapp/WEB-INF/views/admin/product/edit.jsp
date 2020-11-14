<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
		<link rel="shortcut icon" href="#">
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
		
		<!-- 수정버틑 클릭시 -->
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
		<script type="text/javascript" src="/resources/js/admin/edit.js"></script>
				
<%-- Handlebar Template {{#each .}}는 결합되는 데이터가 복수로 들어올때 사용 --%>		 
<script id="subCGListTemplate" type="text/x-handlebars-template">
	<option value="default">선택</option>
	{{#each .}}
	<option value="{{cate_ncategory}}">{{cate_categoryname}}</option>
	{{/each}}
</script>
<!-- CKEdtior작업+2차 카테고리 작업 -->
<script>
	$(document).ready(function(){
		//CKditer작업
		var ckeditor_config = {
				resize_enabled : false,
				enterMode : CKEDITOR.ENTER_BR,
				shiftEntetMode : CKEDITOR.ENTER_P,
				toolbarCanCollapse : true,
				removePlugins : "elementspath",
				
				filebrowserUploadUrl : '/admin/product/imgUpload'
		};
		CKEDITOR.replace("pdt_detail", ckeditor_config);
		
		//1차카테고리에 따른 2차카테고리 작업
	$("#mainCategory").on("change", function(){
		var mainCGcode = $(this).val();
		var url = "/admin/product/subCGList/" + mainCGcode;
		
		$.getJSON(url, function(data){
			
			subCGList(data, $("#subCategory") , $("#subCGListTemplate"))
			
			});
		});
	
	//상품 목록
	$("#btn_list").on("click", function(){
		location.href="/admin/product/list${pm.makeSearch(pm.cri.page)}";	
			
	});	
		
});
</script>

<!-- 2차카테고리 -->
<script>
	var subCGList = function(subCGStr, target, templateObject){
	
		var template = Handlebars.compile(templateObject.html());
		var options = template(subCGStr);
		
		$("#subCategory option").remove();
		target.append(options);
	}

</script>

<!-- 파일변경 메소드 -->
<script>
	var fileChange = function(fis){
		var str = fis.value;
		$("#fileName").html("파일이 변경됨");
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
	<form id='editForm' role="form" action="/admin/product/edit" method="post" enctype="multipart/form-data">
 
			  <div id="content" style="overflow:auto;" class="col-xs-12 col-sm-10">		
				<div class="preloader">
					<!-- 페이징정보,검색정보 파라미터 -->
					<div>
						<input type="hidden" name="page" value="${cri.page}" />
						<input type="hidden" name="perPageNum" value="${cri.perPageNum}" />
						<input type="hidden" name="searchType" value="${cri.searchType}" />
						<input type="hidden" name="keyword" value="${cri.keyword}" />
					</div>
					
					<div>
						<input name="pdt_nb" type="hidden" value="${vo.pdt_nb}" />
						<label>1차 카테고리</label>
						<select class="form-control" id="mainCategory" name="cate_pcategory" style="width:10%; margin-right:10px; display: inline-block;">
							<option value="default">선택</option>
							<c:forEach  items="${cateList}" var="list">
								<option value="${list.cate_ncategory}"<c:out value="${vo.cate_pcategory == list.cate_ncategory?'selected':''}"/>>${list.cate_categoryname}</option>
							</c:forEach>
						</select>
		
						<label>2차 카테고리</label>
						<select class="form-control" id="subCategory" name="cate_ncategory" style="width:10%; margin-right:10px; display: inline-block;">
							<option value="default">선택</option>
							<c:forEach items="${subCateList}" var="subList">
								<option value="${subList.cate_ncategory}"<c:out value="${vo.cate_ncategory == subList.cate_ncategory?'selected':''}"/>>${subList.cate_categoryname}</option>
							</c:forEach>
						</select>
					</div>
					
				
					<div>
						<label for="exampleInputEmail1">상품명</label>
						<input style="width:40%; display: inline-block;" type="text" class="form-control" id="pdt_name" name="pdt_name" value="${vo.pdt_name}">
					</div>
					
					<div>
						<label for="exampleInputEmail1">개발사</label>
						<input style="width:40%; display: inline-block;" type="text" class="form-control" id="pdt_company" name="pdt_company" value="${vo.pdt_company}">
					</div>
				
					
					<div>
						<label for="exampleInputEmail1" style=" margin-right:10px;">상품 할인</label>
						<input  style="width:20%; display: inline-block;" class="form-control" type="text" id="pdt_dc" name="pdt_dc" value="${vo.pdt_dc}">
						
					</div>
					
					<div>
						<label for="exampleInputEmail1" style=" margin-right:10px;">상품 가격</label>
						<input  style="width:20%; display: inline-block;" class="form-control" type="text" id="pdt_price" name="pdt_price" value="${vo.pdt_price}">
						<label for="exampleInputEmail1" style="margin-right:10px;">상품 수량</label>
						<input  style="width:20%; display: inline-block;" class="form-control" type="text" id="pdt_amount" name="pdt_amount" value="${vo.pdt_amount}">
					</div>
					
					<div>
						<label for="exampleInputEmail1" style="margin-right:10px;">구매 가능 여부</label>
						<select class="form-control" id="pdt_buy" name="pdt_buy" style="width: 15%; display: inline-block;">
						  <option <c:out value="${vo.pdt_buy == 'Y'?'selected':''}" />>Y</option>
						  <option <c:out value="${vo.pdt_buy == 'N'?'selected':''}" />>N</option>
						</select>
					</div>				
				
					<div>
						<label for="exampleInputPassword1">상품소개</label>
						<textarea class="form-control" id="pdt_detail" name="pdt_detail" rows="8">
							${vo.pdt_detail}</textarea>
					</div>
			
					<div>
						<input type="hidden" name="pdt_img" value="${vo.pdt_img}" />
						<label for="exampleInputEmail1">상품 이미지</label> 
						<span id="fileName" style="margin-left:5px; font-size:14px;">현재 등록된 파일 : <c:out value="${originFile}" /></span>
							<input onchange="fileChange(this)"
							type="file" id="file1" name="file1" class="form-control" />
					</div>
					
					<div>
						<label for="exampleInputEmail1" style="width:40%; margin-right:10px;">등록일</label>
						<label for="exampleInputEmail1" style="width:40%; margin-right:10px;">수정일</label>
						<span class="form-control" style="width:40%; margin-right:10px; display: inline-block; ">
							<fmt:formatDate value="${vo.pdt_regdate}" pattern="yyyy-mm-dd HH:mm:ss" /></span>
						<span class="form-control" style="width:40%; margin-right:10px; display: inline-block; ">
							<fmt:formatDate value="${vo.pdt_update}" pattern="yyyy-mm-dd HH:mm:ss" /></span>
					</div>

					<div>

						<ul class="mailbox-attachments uploadedList"></ul>
						<button type="button" id="btn_submit" class="btn btn-primary">수정</button>
						<button type="button" id="btn_list" class="btn btn-default">목록</button>
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