$(document).ready(function(){

    //체크박스 전체 체크시
    $("#checkAll").on("click", function(){
        $(".check").prop('checked', this.checked);
    });

    //선택 안된 체크박스 존재시 전체선택 해제
    $(".check").on("click", function(){
        $("#checkAll").prop('checked', false);
    });


	//선택상품삭제
	$("#btn_submit").on("click", function(){
	
		//체크여부 유효성 검사
		if($("input[name='check']:checked").length == 0){
			alert("삭제할 회원을 선택해주세요.");
			return;
		}
		
		var result = confirm("선택한 회원을 탈퇴하시겠습니까?");
		
		if(result){
			var checkArr = [];
			
			$("input[name='check']:checked").each(function(i){
				var memt_id = $(this).val();
				checkArr.push(memt_id);
			});
			
			$.ajax({
				url: "/admin/user/deleteMember",
				type: "post",
				dataType: "text",
				data: {
					checkArr : checkArr
				},
				success: function(data){
					location.href = "/admin/user/member";
				
				}
			});
		
		} else {
		}
	});


	//선택리뷰삭제
	$("#btn_review").on("click", function(){
	
		//체크여부 유효성 검사
		if($("input[name='check']:checked").length == 0){
			alert("삭제할 리뷰를 선택해주세요.");
			return;
		}
		
		var result = confirm("선택한 리뷰를 삭제하시겠습니까?");
		
		if(result){
			var checkArr = [];
			
			$("input[name='check']:checked").each(function(i){
				var memt_id = $(this).val();
				var rv_score = $(this).val();
				checkArr.push(memt_id);
				checkArr.push(rv_score);
			});
			
			$.ajax({
				url: "/admin/user/deleteReivew",
				type: "post",
				dataType: "text",
				data: {
					checkArr : checkArr
				},
				success: function(data){
					location.href = "/admin/user/Review";
				
				}
			});
		
		} else {
		}
	});

});