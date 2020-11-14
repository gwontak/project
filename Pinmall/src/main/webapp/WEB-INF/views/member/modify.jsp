<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<html>
<head>

  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <meta name="description" content="">
  <meta name="author" content="">
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">	

  <title>PinMall Homepage</title>

  <!-- Bootstrap core CSS -->
  <link href="/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet" >

  <!-- Custom styles for this template -->
  <link href="/css/shop-homepage.css" rel="stylesheet">
	
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>	
 
  <!-- 회원정보수정을 위한 js -->
  <script type="text/javascript" src="/resources/js/member/modify.js"></script>		
</head>	 
	<!-- 부가적인 테마 -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
	 
<body>

  <!-- Navigation(상단) -->
	<%@ include file="/WEB-INF/views/include/top.jsp" %>

  <!-- Page Content(본문) -->
  <div class="container">	     
	  <div class="row">
   	  	  <!-- Page left (왼쪽) -->
	  <%@ include file="/WEB-INF/views/include/left_chek.jsp" %> 
	   <div class="col-9">
	    <form id="modifyForm" action="/member/modifyPOST" method="post" >	    	
	       <div class="container" style="width: 800px; padding: 10% 5%;">
	       	<h2>회원정보 수정</h2>
	       		* 만 수정이 가능합니다.<br><br><br>
	            <div class="form-group">
	              <label>이름</label>
	               <input type="text" readonly="readonly" class="form-control" id="memt_name" name="memt_name" value="${vo.memt_name}">       
	            </div>
	            
	            <div class="form-group">
	              <label>닉네임</label>
	               <input type="text" class="form-control" readonly="readonly" id="memt_sname" name="memt_sname" value="${vo.memt_sname}">       
	            </div>
	             
	 			<div class="form-group">
	                <label>이메일</label>
	                <input type="email" readonly="readonly" class="form-control" name="memt_em" id="memt_em" value="${vo.memt_em}"> 
	            </div>
	            
	            <div class="form-group">
	                <label>* 주소</label><br />
	                <input type="text" id="sample2_postcode" placeholder="우편번호" name="memt_zipcode" value="${vo.memt_zipcode}">
	                <input type="button" onclick="sample2_execDaumPostcode()" value="우편번호 찾기" name=""><br />
	           		<input type="text" size=50 id="sample2_address" placeholder="주소" name="memt_add" value="${vo.memt_add}">
	             	<input type="text" size=50 id="sample2_detailAddress" placeholder="상세주소" name="memt_dadd" value="${vo.memt_dadd}">
		          	<input type="hidden"  id="sample2_extraAddress" placeholder="참고항목">
             	</div>
	             
	           <div class="form-group">
	                <label>* 전화번호</label>
	                <input type="tel" class="form-control" id="memt_ph" name="memt_ph" value="${vo.memt_ph}">      
	           </div>
	                         
	           <div class="form-group">
	                <label>* 이메일 수신 동의 여부</label><br />
	                <label><input type="radio" id="memt_accept_e" name="memt_accept_e" value="Y"> 예 </label>&nbsp;&nbsp;
	                <label><input type="radio" id="memt_accept_e" name="memt_accept_e" value="N"> 아니오 </label> &nbsp;&nbsp;
	                     
	             </div>
	             

	           	 <div class="form-group">
	                <input type="button" id="btn_submit"  class="btn btn-primary" value="수정">
	                <input type="button" id="btn_cancle"  class="btn btn-danger" value="취소">
	             </div>
	             
	             
			</div>
	    </form>
	  </div>
	    
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
	</div>
</div>

    
  <!-- Footer(하단) -->
 <%@ include file="/WEB-INF/views/include/footer.jsp" %>

  <!-- Bootstrap core JavaScript -->
  <script src="/vendor/jquery/jquery.min.js"></script>
  <script src="/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  


</body>

</html>