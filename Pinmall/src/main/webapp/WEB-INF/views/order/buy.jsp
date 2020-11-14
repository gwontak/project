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
  <title>PinMall Homepage</title>

  <!-- Bootstrap core CSS -->
  <link href="/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet" >

  <!-- Custom styles for this template -->
  <link href="/css/shop-homepage.css" rel="stylesheet">
  
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script type="text/javascript" src="/resources/js/order/buy.js"></script>
    

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
	<form action="order" method="post" accept="/order/oder">
	<div class="row no-gutter2 row-no-gutter">
		<div class="col-xs-12">
			<h3 class="my-4">주문 상품 확인</h3>
		</div>
		<div class="col-xs-12">
			<table class="table table table-shopping-cart table-style">
				<colgroup>
					<col style="width:110px;"/>
					<col />
					<col style="width:200px;"/>
					<col />
					<col style="width:150px;"/>
				</colgroup>
				<thead id="thead">
					<tr>
						<th>이미지</th>
						<th>상품정보</th>
						<th class="hidden-xs"></th>
						<th class="hidden-xs">수량</th>
						<th class="hidden-xs">금액</th>
						<th class="hidden-xs"></th>
					</tr>
				</thead>	
				<c:forEach items="${productList}" var="productVO" varStatus="i">
					<tr id="productVO_${productVO.pdt_nb}" >
						<td>
							<input type="hidden" name="OrderDetailVOList[${i.index}].odr_amount" value="${amountList[i.index]}" />
							<input type="hidden" name="OrderDetailVOList[${i.index}].pdt_nb" value="${productVO.pdt_nb}" />
							<input type="hidden"  name="OrderDetailVOList[${i.index}].odr_price" value="${productVO.pdt_price * amountList[i.index]}" />
							<input type="hidden" name="OrderDetailVOList[${i.index}].memt_id" value="${user.memt_id}" />
						</td>
						<tr>
							<td>
								<a href="/product/read?pdt_nb=${productVO.pdt_nb }">
								<img src="/product/displayFile?fileName=${productVO.pdt_img}" alt="상품이미지" width="90"/></a>
							</td>
						<td>
							<div class="cart-product-title _goodsno" data-goods-ea="1" data-goodsno="69" data-goods-price="20000" data-goods-category="">
							${productVO.pdt_name}</div>
							<div class="cart-product-price">
							<br/>
							</div>
							<div class="web-cart-mobile-info cart-product-price visible-xs">
								<div style="text-align:left;">
								</div>
							</div>
						</td>
						<td class="_goodsno-td-69 _goodsno-td-">
								<div class="_goodsno-price-69 _goodsno-price- _goods-price-all">
								</div>
								<div class="_goodsno-percent-69 _goodsno-percent- _goods-percent-all">
								</div>
						</td>
						<td class="hidden-xs">
							${amountList[i.index]}
							<input type="hidden"  id="odr_amount" name="odr_amount" value="${amountList[i.index]}" /> 
						</td> 
						<td class="hidden-xs">${productVO.pdt_price}</td>	
						<td class="hidden-xs">
						</td>
						</tr>
					</c:forEach>	
			</table>
		</div>

	<div id="coupon-layer-popup" class="layer-pop pop-coupon-app" style="z-index:1200;">
	</div>
      		<input class="_coupon-use-multiple" type="hidden" value="0"/>
			<div class="_coupon-add-div">


					<div class="_coupon-add-div-price"></div>
					<div class="_coupon-add-div-percent"></div>

			</div>

			<!-- 금액 합계 -->
				<div class="container">
					<div class="row">
						<table summary="" class="table table table-shopping-cart table-style">
							<thead>
								<tr>
									<th scope="col">최종 결제 금액</th> 
									<th scope="col"></th>
									<th scope="col"></th>
									<th scope="col"></th>
								</tr>
							</thead>
							<tbody>
								<tr>
								<c:forEach items="${productList}" var="productVO" varStatus="i">
									<td>
										<p>
										<fmt:formatNumber value="${productVO.pdt_price * amountList[i.index]}"  pattern="###,###,###" /></p>
										<input type="hidden" id="odr_totalby" name="odr_totalby" value="${productVO.pdt_price * amountList[i.index]}" />
										<input type="hidden" id="odr_price" name="odr_price" value="${productVO.pdt_price * amountList[i.index]}" /> 
									</td>
									
									<td>
											<p class="text-center">
											</p>
									</td>
									<td class="v-top">
											<p class="text-center">
											</p>
									</td>
									<td>
									<td>
								 </c:forEach>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
			<br><br>
			<div class="col-md-12 no-gutter">
				<table summary="" class="table table table-shopping-cart table-style">
					<thead>
						<tr class="bg">
							<th scope="col" colspan="2">
								배송정보 
							</th>
						</tr>
					</thead>
					<tbody>
			
						<tr>
							<th scope="row"><span style="color: red;"> *</span> 이름</th>
							<td>
								<input type="text" class="form-control input-sm" style="width:90px;"  id="odr_name" name="odr_name" value="" required title="이름" maxlength="10"/>
							</td>
							<td>
								<input type="hidden"  class="form-control input-sm" id="memt_id" name="memt_id" value="${user.memt_id}">
							</td>
						</tr>
						<tr>
							<th scope="row"><span style="color: red;"> *</span> 주소</th>
							<td>
									<div class="form-group">
						                <input type="text" id="sample2_postcode" placeholder="우편번호" name="odr_zipcode">
						                <input type="button" onclick="sample2_execDaumPostcode()" value="우편번호 찾기" name=""><br />
						           		<input type="text" size=50 id="sample2_address" placeholder="주소" name="odr_add">
						             	<input type="text" size=50 id="sample2_detailAddress" placeholder="상세주소" name="odr_dadd">
							          	<input type="hidden"  id="sample2_extraAddress" placeholder="참고항목">
					             	</div>
						</tr>
						<tr>
							<th scope="row"><span style="color: red;"> *</span> 휴대폰 번호</th>
							<td class="form-inline text-left">
								<input type="text"name="odr_ph"  title="휴대폰"/>
							</td>
						</tr>
	
					</tbody>
				</table>
							
				<div class="container">
					<div class="row">
						<table class="table table table-shopping-cart table-style">
							<thead>
								 <tr class="bg">
									 <th>결제수단 선택</th>
								 </tr>
							 </thead>
							 <tbody>
								<tr>
									<td style="text-align:left;padding-left:20px;">
											<input type="radio" title="신용카드 선택" value="card"/>
												카드결제
									</td>
								</tr>
							 </tbody>
						</table>
						<div class="text-center" style="margin-top:20px;">
							<a href="/" class="btn btn-default btn-lg"><span class="txt-yellow">취소하기</span></a>&nbsp;
							<button id="btn_submit" class="btn btn-flat" type="submit" style="padding: 10px 40px; background-color: grey; color:white;">결제하기</button>
						</div>

				 	</div>
				</div>
			</div>
		</div>
		</form>
	
	 <!-- 우편기능 -->
		
		<div id="layer" style="display:none;position:fixed;overflow:hidden;z-index:1;-webkit-overflow-scrolling:touch;">
		<img src="//t1.daumcdn.net/postcode/resource/images/close.png" id="btnCloseLayer" style="cursor:pointer;position:absolute;right:-3px;top:-3px;z-index:1" onclick="closeDaumPostcode()" alt="닫기 버튼">
		</div>
		
		<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
		<script>
		    // 우편번호 찾기 화면을 넣을 element
		    var element_layer = document.getElementById('layer');
		
		    function closeDaumPostcode() {
		        // iframe을 넣은 element를 안보이게 한다.
		        element_layer.style.display = 'none';
		    }
		
		    function sample2_execDaumPostcode() {
		        new daum.Postcode({
		            oncomplete: function(data) {
		                // 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
		
		                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
		                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
		                var addr = ''; // 주소 변수
		                var extraAddr = ''; // 참고항목 변수
		
		                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
		                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
		                    addr = data.roadAddress;
		                } else { // 사용자가 지번 주소를 선택했을 경우(J)
		                    addr = data.jibunAddress;
		                }
		
		                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
		                if(data.userSelectedType === 'R'){
		                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
		                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
		                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
		                        extraAddr += data.bname;
		                    }
		                    // 건물명이 있고, 공동주택일 경우 추가한다.
		                    if(data.buildingName !== '' && data.apartment === 'Y'){
		                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
		                    }
		                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
		                    if(extraAddr !== ''){
		                        extraAddr = ' (' + extraAddr + ')';
		                    }
		                    // 조합된 참고항목을 해당 필드에 넣는다.
		                    document.getElementById("sample2_extraAddress").value = extraAddr;
		                
		                } else {
		                    document.getElementById("sample2_extraAddress").value = '';
		                }
		
		                // 우편번호와 주소 정보를 해당 필드에 넣는다.
		                document.getElementById('sample2_postcode').value = data.zonecode;
		                document.getElementById("sample2_address").value = addr;
		                // 커서를 상세주소 필드로 이동한다.
		                document.getElementById("sample2_detailAddress").focus();
		
		                // iframe을 넣은 element를 안보이게 한다.
		                // (autoClose:false 기능을 이용한다면, 아래 코드를 제거해야 화면에서 사라지지 않는다.)
		                element_layer.style.display = 'none';
		            },
		            width : '100%',
		            height : '100%',
		            maxSuggestItems : 5
		        }).embed(element_layer);
		
		        // iframe을 넣은 element를 보이게 한다.
		        element_layer.style.display = 'block';
		
		        // iframe을 넣은 element의 위치를 화면의 가운데로 이동시킨다.
		        initLayerPosition();
		    }
		
			    // 브라우저의 크기 변경에 따라 레이어를 가운데로 이동시키고자 하실때에는
			    // resize이벤트나, orientationchange이벤트를 이용하여 값이 변경될때마다 아래 함수를 실행 시켜 주시거나,
			    // 직접 element_layer의 top,left값을 수정해 주시면 됩니다.
			    function initLayerPosition(){
			        var width = 300; //우편번호서비스가 들어갈 element의 width
			        var height = 400; //우편번호서비스가 들어갈 element의 height
			        var borderWidth = 5; //샘플에서 사용하는 border의 두께
		
		        // 위에서 선언한 값들을 실제 element에 넣는다.
		        element_layer.style.width = width + 'px';
		        element_layer.style.height = height + 'px';
		        element_layer.style.border = borderWidth + 'px solid';
		        // 실행되는 순간의 화면 너비와 높이 값을 가져와서 중앙에 뜰 수 있도록 위치를 계산한다.
		        element_layer.style.left = (((window.innerWidth || document.documentElement.clientWidth) - width)/2 - borderWidth) + 'px';
		        element_layer.style.top = (((window.innerHeight || document.documentElement.clientHeight) - height)/2 - borderWidth) + 'px';
		    }
		</script>

      <!-- /.col-lg-9 -->
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