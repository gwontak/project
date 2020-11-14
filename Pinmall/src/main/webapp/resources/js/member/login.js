$(document).ready(function(){

	var form = $("#loginForm");
	
	//로그인 버튼 클릭
	$("#btn_login").on("click", function(){
	
		var memt_id = $("#memt_id");
		var memt_pw = $("#memt_pw");
		
		if(memt_id.val() == null || memt_id.val() == ""){
			alert("아이디를 입력하세요");
			memt_id.focus();
			
		} else if(memt_pw.val() == null || memt_pw.val() == ""){
			alert("비밀번호를 입력하세요");
			memt_pw.focus();
			
		} else {
			form.submit();
		}
	});
});