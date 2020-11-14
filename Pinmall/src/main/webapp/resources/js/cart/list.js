$(document).ready(function(){

	//처음 가격 업데이트
 	updatePrice();

    //체크박스 클릭시
    $("#checkAll").on("click", function(){
        $(".check").prop('checked', this.checked);
		updatePrice();
    });

    //체크박스 중 선택안된 체크박스 존재 시 전체선택 해제
    $(".check").on("click", function(){
        $("#checkAll").prop('checked', false);
		updatePrice();
    });

    //선택상품삭제
    $("#btn_delete_check").on("click", function(){

        //체크여부 유효성 검사
        if ($("input[name='check']:checked").length == 0) {
            alert("삭제할 상품을 선택해주세요.")
            return;
        }

        var result = confirm("선택한 상품을 삭제하시겠습니까?");

        if(result){
            var checkArr = [];

            $("input[name='check']:checked").each(function(i){
                var cart_code = $(this).val();
                checkArr.push(cart_code);
            });

            $.ajax({
                url: '/cart/deleteChecked',
                type: 'post',
                dataType: 'text',
                data: {
                    checkArr : checkArr
                },
				success : function(data) {
					location.href = "/cart/list";
				} 

            });
        } else {
        }

    });

    //상품수량 변경 클릭시
    $("button[name=btn_modify]").on("click", function(){
            var cart_code = $(this).val();
            var cart_amount = $(
                "input[name='cart_amount_" + cart_code + "']").val();

            $.ajax({
                url: "/cart/modify",
                type: "post",
                dataType: "text",
                data: {
                    cart_code : cart_code,
                    cart_amount : cart_amount
                },
                success: function(data){
                    alert("수량이 변경되었습니다.");
                    location.href="/cart/list";
                }



            });

    });
    

});

    //총가격
    var updatePrice = function(){
    	
    	var size = $("input[name='check']:checked").length;
    	var totalPrice = 0;
    
    	$("input[name='check']:checked").each(function(i){
    		var cart_code = $(this).val();
    		var amount = $("input[name='cart_amount_"+cart_code+"']").val();
    		var test = $("input[name='price_"+cart_code+"']").val();
    		
    		totalPrice += parseInt($("input[name='price_"+cart_code+"']").val())*amount;
    	
    	});
    	
    	$("#totalPrice").html(numberFormat(totalPrice) + "원");
    
    
    
    };
    
// 숫자 콤마 설정 
function numberFormat(inputNumber) {
   return inputNumber.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
}

