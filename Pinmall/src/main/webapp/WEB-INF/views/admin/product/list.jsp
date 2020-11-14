<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>   
    
<!DOCTYPE html>
<html>
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
<head>

<!-- 버튼 클릭 -->
<script>
	$(document).ready(function(){
	
		//검색버튼
		$("#btn_search").on("click", function(){
			
			self.location = "list"
				+ '${pm.makeQuery(1)}'
				+ "&searchType="
				+ $("select option:selected").val()
				+ "&keyword=" + $('#keyword').val();
		
		});
		
		//전체 선택 체크 박스 클릭
		$("#checkAll").on("click", function(){
			$(".check").prop('checked', this.checked);
		});
		
		//체크박스 중 선택 안된 체크박스가 존재 시 전체선택 체크박스 해제
		$(".check").on("click", function(){
			$("#checkAll").prop('checked', false);			
		});
		
		//상품 리스트 삭제
		$("button[name=btn_delete]").on("click", function(){
			$(this).parent().submit();
		});
		
		//선택상품삭제
		$("#btn_delete_check").on("click", function(){
			if($("input[name='check']:checked").length == 0){
				alert("삭제할 상품을 선택해주세요.");
				return;
			}
			
			var result = confirm("선택한 상품을 삭제하시겠습니까?");
			
			if(result){
				
				var checkArr = [];
				var imgArr = [];
				
				$("input[name='check']:checked").each(function(i){
					var pdt_nb = $(this).val()
					
					var pdt_img = $("input[name='img_"+pdt_nb+"']").val();
					
					checkArr.push(pdt_nb);
					imgArr.push(pdt_img);
				});
				
				$.ajax({
					url: '/admin/product/deleteChecked',
					type: 'post',
					dataType: 'text',
					data: {	checkArr : checkArr, imgArr : imgArr},
					success : function(){
							alert("삭제가 완료되었습니다.");
							location.href = "/admin/product/list${pm.makeSearch(pm.cri.page)}";
						}
				});
			} else{}
			
		});
	});
	
</script>

<!-- 상품 수정 -->
<script>
	var clickEdit =function(pdt_nb){
		var url = '/admin/product/edit${pm.makeSearch(pm.cri.page)}&pdt_nb='+ pdt_nb;
		location.href = url;
	}

</script>

<%-- 메시지 처리 --%>
<script>
	if ("${msg}" == "INSERT_SUCCESS") {
		alert("상품등록이 완료되었습니다.");
		
	} else if ("${msg}" == "EDIT_SUCCESS") {
		alert("상품 수정이 완료되었습니다.");
		
	} else if ("${msg}" == "DELETE_SUCCESS") {
		alert("상품 삭제가 완료되었습니다.");
	}
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
	 <div id="content" class="col-xs-12 col-sm-10">		
		<div class="preloader" style="padding:5%;">
				<h3>상품 리스트</h3>
					<div class="col-md-12">
						<div class="row text-center">
									<div class="row text-center">
									<div style="display: inline-block; float: left; margin-left:15px;">
									<select name="searchType" style="width:180px; height:40px">
										<option value="null"
											<c:out value="${cri.searchType == null?'selected':'' }" />>선택 </option>
										<option value="name"
											<c:out value="${cri.searchType eq 'name'?'selected':'' }" />>상품명</option>
										<option value="detail"
											<c:out value="${cri.searchType eq 'detail'?'selected':'' }" />>내용</option>
										<option value="company"
											<c:out value="${cri.searchType eq 'company'?'selected':'' }" />>제조사 </option>								
										<option value="name_detail"
											<c:out value="${cri.searchType eq 'name_detail'?'selected':'' }" />>상품명 + 내용 </option>
										<option value="name_company"
											<c:out value="${cri.searchType eq 'name_company'?'selected':'' }" />>상품명 + 제조사</option>
										<option value="all"
											<c:out value="${cri.searchType eq 'all'?'selected':'' }" />>성품명 + 내용 + 제조사</option>
										
									</select>
									<input type="text" name='keyword' id="keyword" style="width:250px; height:30pt; padding-left:5px;" value='${cri.keyword}' />
									<button id="btn_search" class="btn btn-default">검색</button>
								</div>
							<div style="display: inline-block; float: right; margin-right:15px;">
							<button id="btn_delete_check" class="btn btn-default">선택 상품 삭제</button>
							<button class="btn btn-primary" onclick="location.href='/admin/product/insert'">상품등록</button>							
							</div>
							</div>
						</div>
					</div>
					<br>
			<div class="box" style="border: none;">
				<div class="box-body">
				<table  class="table table-striped text-center">
					<tr>
						<th><input type="checkbox" id="checkAll" /></th>
						<th>상품 번호</th>
						<th>상품 이미지</th>
						<th>상품명</th>
						<th>판매가</th>
						<th>할인가</th>
						<th>제조사</th>
						<th>수량</th>
						<th>판매여부</th>
						<th>수정/삭제</th>
					</tr>
					
					<!-- 상품리스트 -->
					<c:if test="${empty productList}">
						<tr>
							<td>
								<p>등록된 상품이 존재하지 않습니다.</p>
							</td>
						</tr>
					</c:if>
					
					<c:forEach items="${productList}" var="productVO">
						<tr>
						<td>
							<input class="check" type="checkbox" name="check" value="${productVO.pdt_nb}">
						</td>
						
						<td class="col-md-1">${productVO.pdt_nb}</td>
						
						<td class="col-md-2">
							<img src="/admin/product/displayFile?fileName=${productVO.pdt_img }" style="width:80px">
							
							<!-- 체크박스 선택 이미지 정보 -->
							<input type="hidden" name="img_${productVO.pdt_nb}" value="${productVO.pdt_img}" />
						</td>	

						<td class="col-md-2"><a href="/admin/product/read${pm.makeSearch(pm.cri.page)}&pdt_nb=${productVO.pdt_nb}"
						style="color: black;">${productVO.pdt_name}</a></td>								
						<td class="col-md-1">${productVO.pdt_price}</td>
						<td class="col-md-1">${productVO.pdt_dc}</td>
						<td class="col-md-2">${productVO.pdt_company}</td>
						
						<!-- 상품수량 -->
						<td>
						<input name="amount_${productVO.pdt_name}" type="hidden" style="width:80px; height:34px; padding-left:5px;" value="${productVO.pdt_amount}">
						<p style="width:80px; height:34px; padding-left:5px;">${productVO.pdt_amount}</p>
						 </td>
					  	<!-- 상품전시 기능 -->
					  	<td>
					  		<input class="form-control" type="hidden" name="buy_${productVO.pdt_nb}" style="width: 60px; display: inline-block;">
					  		<p style="width: 60px; display: inline-block;">${productVO.pdt_buy}</p>
					  	</td>
						<td class="col-md-2">
							<form class="deleteForm" method="post"
								action="/admin/product/delete${pm.makeSearch(pm.cri.page)}">
								<!-- {pm.makeSearch(pm.cri.page)패이징 정보와 검색정보 -->
								<!-- 상품 코드 -->
								<input type="hidden" name="pdt_nb"
									value="${productVO.pdt_nb}">
								<!-- 파일 이미지명 -->
								<input type="hidden" name="pdt_img"
									value="${productVO.pdt_img}">
								<!-- 수정기능 -->
								<button type="button" name="btn_edit" class="btn btn-default" onclick="clickEdit(${productVO.pdt_nb});">수정</button>
								
								<!-- 삭제기능 -->
								<button type="button" name="btn_delete" class="btn btn-danger">삭제</button>
							</form>
						</td>					  	
					  </tr>
					</c:forEach>
				</table>
			</div>
			
			<!-- 페이징 기능 -->
			<div class="box-footer">
				<div class="text-center">
					<ul class="pagination">
						<!-- 이전표시 여부 -->
						<c:if test="${pm.prev}">
							<li><a href="list${pm.makeSearch(pm.startPage-1)}">&lt;</a>
							</li>
						</c:if>
						
						<!-- 페이지번호 -->
						<c:forEach begin="${pm.startPage}" end="${pm.endPage}" var="idx">
								<li <c:out value="${pm.cri.page == idx?'class = active':''}" />>
								 	<a href="list${pm.makeSearch(idx)}">${idx}</a>
								</li>
						</c:forEach>
						
						<!-- 다음표시 여부 -->
						<c:if test="${pm.next && pm.endPage > 0}">
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