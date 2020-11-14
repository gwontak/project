<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script id="subCGListTemplate" type="text/x-handlebars-template">
	{{#each .}}
		<li  style="padding-left: 50px"><a href="/product/list?cate_ncategory={{cate_ncategory}}"><span>{{cate_categoryname}}</span><br /></a></li>
	{{/each}}
</script>

<!-- 2차 카테고리 템플릿 적용함수 -->
<script>
	$(document).ready(function(){
		
		
		
		$("#mainCategory").one("click", function(){
			var mainCGCode= $(this).val();
			var url = "/product/subCGList/" + mainCGCode; 
		
		$.getJSON(url, function(data){
			
			subCGList(data, $("#mainCategory_"+mainCGCode) ,$("#subCGListTemplate"));
			});
	
		});
	});
	var subCGList = function(subCGStr, target, templateObject){
		
		var template = Handlebars.compile(templateObject.html());
		var options = template(subCGStr);
		
		target.append(options);
	}
</script>
	


   <div class="col-lg-3">
	
		<!-- Page left (왼쪽) -->
	<h3 class="my-4">MENU</h3>
                <ul >
				<c:forEach items="${userCategoryList}" var="list">
					<li id="mainCategory" class="mainCategory"  value="${list.cate_ncategory}">
					
						<a class="list-group-item" href="#">
							<span>${list.cate_categoryname}</span><br />
						</a>
						<!-- 2차카테고리 목록 추가되는 장소 id="mainCategory_ + 1차카테고리 코드 -->
						<ul  id="mainCategory_${list.cate_ncategory}"></ul>
					</li>
				</c:forEach>
			</ul>
	</div>
