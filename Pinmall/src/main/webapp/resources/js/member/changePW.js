$(document).ready(function(){
	
	var form = $("#changePWFrom");
	
	var memt_pw = $("#memt_pw");
	var memt_changePW = $("#memt_changePW");
	var memt_scheckPW = $("#memt_scheckPW");
	
	/* 확인 버튼 클릭 시 */
	$("#btn_submit").on("click", function(){
		// 유효성 검사
		if(memt_pw.val() == null || memt_pw.val() == ""){
			alert("현재 비밀번호를 입력해주세요.");
			memt_pw.focus();
			return;
			
		} else if(memt_changePW.val() == null || memt_changePW.val() == ""){
			alert("변경할 비밀번호를 입력해주세요.");
			memt_changePW.focus();
			return;
			
		} else if(memt_scheckPW.val() == null || memt_scheckPW.val() == ""){
			alert("변경할 비밀번호 확인 란을 입력해주세요.");
			memt_scheckPW.focus();
			return;
			
		} else if(memt_changePW.val() != memt_scheckPW.val()){
			alert("변경할 비밀번호와 비밀번호 확인 란의 비밀번호가 다릅니다.");
			return;
		}
		
		// 현재 비밀번호 확인 검사
		var memt_pw_val = memt_pw.val();		
				
		$.ajax({
			url: "/member/checkPwAjax",
			type: "post",
			datatype: "text",
			data: {memt_pw : memt_pw_val},
			success: function(data){
				if(data=='SUCCESS'){
					form.submit();
				} else{
					alert("현재 비밀번호가 다릅니다.");
					memt_pw.val("");
					memt_pw.focus();
				}
			} 
		});
	});
});