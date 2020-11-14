$(document).ready(function() {
	
	var form = $("#modifyForm");
	// 인증 확인 여부를 위한 변수
	
	/* 회원수정 버튼 클릭 시 */ 
	$("#btn_submit").on("click", function(){
		
		var memt_phone = $("#memt_ph");
		var memt_zipcode = $("input[name='memt_zipcode']");
		var memt_add = $("input[name='memt_add']");
		var memt_dadd = $("input[name='memt_dadd']");
		
		/* 유효성 검사 */
		 if(memt_phone.val()==null || memt_phone.val()==""){
			alert("휴대폰 번호를 입력해주세요.");
			memt_phone.focus();
			return;

		} else if(memt_zipcode.val()==null || memt_zipcode.val()==""){
			alert("우편번호를 입력해주세요.");
			return;
			
		} else if(memt_add.val()==null || memt_add.val()==""){
			alert("주소를 입력해주세요.");
			return;
			
		} else if(memt_dadd.val()==null || memt_dadd.val()==""){
			alert("상세 주소를 입력해주세요.");
			return;
		} else {
			form.submit();
		}
		 

	});
	
	/* 취소 버튼 클릭 시 */
	$("#btn_cancle").on("click", function(){
			location.href="/"; 
		});
	
});

