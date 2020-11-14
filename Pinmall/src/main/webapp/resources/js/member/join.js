$(document).ready(function() {
	
	// 아이디중복체크 기능 사용여부 확인 변수
	var isCheckId = "false";

	/*아이디 중복체크 클릭 */
	$("#btn_checkId").on("click",function(){

		if($("#memt_id").val()=="" || $("#memt_id").val()== null){
			alert("아이디를 먼저 입력해주세요");
			return;
			}
			
		var memt_id = $("#memt_id").val();
		
		$.ajax({
			url: '/member/checkID',
			type: 'post',
			dataType: 'text',
			data: {memt_id : memt_id},
			success : function(data){
				if(data == 'SUCCESS'){
					alert("사용가능한 아이디입니다.");
					
					isCheckId = "true";
				} else {
					alert("이미 존재하는 아이디입니다.");
				}
			}
		});
		
	});


	// 닉네임중복체크 기능 사용여부 확인 변수
	var isChecksname = "false";

	/*닉네임 중복체크 클릭 */
	$("#btn_checksname").on("click",function(){

		if($("#memt_sname").val()=="" || $("#memt_sname").val()== null){
			alert("닉네임을 먼저 입력해주세요");
			return;
			}
			
		var memt_sname = $("#memt_sname").val();
		
		$.ajax({
			url: '/member/checkSName',
			type: 'post',
			dataType: 'text',
			data: {memt_sname : memt_sname},
			success : function(data){
				if(data == 'SUCCESS'){
					alert("사용가능한 닉네임입니다.");
					
					isChecksname = "true";
				} else {
					alert("이미 존재하는 닉네임입니다.");
				}
			}
		});
		
	});
	
	//이메일인증 체크를 위한 변수
	var isCheckEmail = 'false';
	
	/* 이메일 인증 클릭시 */
	$("#btn_sendAuthCode").on("click",function(){
		var receiveMail = $("#memt_em").val();
		
		if($("#memt_em").val() == "" || $("#memt_em").val() == null){
			alert("이메일을 먼저 입력해주세요.");
			return;
		}
	
		$.ajax({
			url: '/email/send',
			type: 'post',
			dataType: 'text',
			data:{receiveMail : receiveMail},
			success: function(data){
				$("#email_authcode").show();
				alert("메일이 전송되었습니다.\n입력하신 메일에서 인증코드확인후 입력해주세요");
				
			}
		});
	
	});
	
	//이메일인증 체크를 위한 변수
	var isCheckEmail = 'false';
	
	/* 인증코드 입력 후 확인 클릭시 */
	$("#btn_checkAuthcode").on("click",function(){
		var code = $("#memt_authcode").val();
	
		$.ajax({
			url: '/member/checkAuthcode',
			type:'post',
			dataType: 'text',
			data: {code : code},
			success: function(data){
				if(data == 'SUCCESS'){
					alert("이메일 인증이 완료되었습니다");
					$("#memt_em").attr("readonly",true);
					$("#btn_sendAuthCode").attr("disabled", true);
					isCheckEmail = "true";
				}else{
					alert("인증실패. 다시 시도해주세요.");

				}
			}
		});
	});
	
	//회원가입을 위한 변수
	var form = $("#joinForm");
	
	//회원가입
	$("#btn_submit").on("click",function(){
	
		var memt_name = $("#memt_name");
	 	var memt_id = $("#memt_id");
		var memt_sname = $("#memt_sname");
		var memt_name = $("#memt_name");
		var memt_pw = $("#memt_pw");
		var memt_spw = $("#memt_spw");
		var memt_em = $("#memt_em");
		var memt_authcode = $("#memt_authcode");
		var memt_zipcode = $("input[name='memt_zipcode']");
		var memt_add = $("input[name='memt_add']");
		var memt_dadd = $("input[name='memt_dadd']");
		var memt_ph = $("#memt_ph");
		var memt_accept_e = $("#memt_accept_e");
	
		
		 /* 유효성 검사 */
		if(memt_name.val()==null || memt_name.val()==""){
			alert("이름을 입력해주세요");
				memt_name.focus();
	
		} else if(memt_id.val()==null || memt_id.val()==""){
			alert("아이디를 입력해주세요");
				memt_id.focus();
				
		} else if(isCheckId == "false"){
			alert("아이디 중복 체크를 진행해주세요.");
				memt_id.focus();
				
		}  else if(memt_sname.val()==null || memt_sname.val()==""){ 
			alert("닉네임을 입력해주세요.");
				memt_sname.focus();
		
		} else if(isChecksname == "false"){ 
			alert("닉네임 중복 체크를 진행해주세요.");
				memt_sname.focus();
				
		} else if(memt_pw.val() == null || memt_pw.val() == ""){
			alert("비밀번호를 입력해주세요.");
				memt_pw.focus();
				
		} else if(memt_spw.val() == null || memt_spw.val() == ""){
			alert("비밀번호를 확인란을 입력 해주세요");
				memt_spw.focus();
				
		} else if(memt_pw.val() != memt_spw.val()){
			alert("비밀번호가 다릅니다.\n비밀번호를 다시 확인해 주세요.");
				memt_spw.focus();
				
		} else if(memt_em.val() == "" || memt_em.val() == null){
			alert("이메일을 입력해주세요");
				memt_em.foucus();
				
		}else if(memt_authcode.val() == "" || memt_authcode.val() == null){
			alert("이메일 인증코드를 입력해주세요");
				memt_authcode.foucus();		
				
		} else if(isCheckEmail=="false"){
			alert("이메일 인증을 해주세요");
				memt_em.foucus();
			
		} else if(memt_zipcode.val() == "" || memt_zipcode.val() == null){
			alert("우편번호를 입력해주세요");
				memt_zipcode.focus();
				
		} else if(memt_add.val() == "" || memt_add.val() == null){
			alert("주소를 입력해주세요");
				memt_add.focus();
				
		} else if(memt_dadd.val() == "" || memt_dadd.val() == null){
			alert("상세주소를 입력해주세요");
				memt_dadd.focus();
				
		} else if(memt_ph.val() == "" || memt_ph.val() == null){
			alert("전화번호를 입력해주세요");
				memt_ph.focus();
				
		} else if(memt_accept_e.val() == "" || memt_accept_e.val() == null){
			alert("이메일 수신 동의 여부를 체크해주세요");
				
		} else {
			form.submit();
		}
	});
	
	$("#btn_cancle").on("click", function(){
			location.href="/"; 
	});
	
});


	