$(document).ready(function() {
	//처음 가격 업데이트
	updatePrice();


	// 체크박스 전체 클릭
	$("#checkAll").on("click", function() {
		// 전체선택 클릭 여부로 다른 체크박스 체크
		$(".check").prop('checked', this.checked);
		updatePrice();
	});
	
	
	/* 결제하기 버튼 클릭 시 */
	$("#btn_submit").on("click", function(){

			$("#orderForm").submit();

	});
});


// 총 가격 
var updatePrice = function(){

   	var size = $("input[name='check']:checked").length;
    var totalPrice = 0;
    
    $("input[name='check']:checked").each(function(i){
    		var pdt_nb = $(this).val();
    		var amount = $("input[name='amount_"+pdt_nb+"']").val();
    		var price  = $("input[name='price_"+pdt_nb+"']").val();
    		
    		totalPrice += parseInt($("input[name='price_"+pdt_nb+"']").val())*amount;
    	
    });
	$("#totalPrice").html(numberFormat(totalPrice) + "원");
};

/* 숫자 콤마 설정 */
function numberFormat(inputNumber) {
	return inputNumber.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
}