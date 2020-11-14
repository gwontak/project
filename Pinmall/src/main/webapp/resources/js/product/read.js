var replyPage = 1;

$(document).ready(function(){

	//장바구니 저장
	$("#btn_cart").on("click", function(){
		
		var pdt_nb = $("#pdt_nb").val();
		var pdt_amount = $("#ord_amount").val();
	
		$.ajax({
			url: "/cart/addMany",
			type: "post",
			dataType: "text",
			data: { pdt_nb: pdt_nb,
					pdt_amount: pdt_amount},
			success: function(data){
				var result = confirm("장바구니에 추가되었습니다.\n 확인하시겠습니까?");
				if(result){
					location.href="/cart/list";
				} else{}
			}			
		});
	
	});

    //별점 클릭시, 색상 변경
    $('#star_grade a').click(function(){
        $(this).parent().children("a").removeClass("on");
        $(this).addClass("on").prevAll("a").addClass("on");
            return false;
    });
    
    /* 상품 후기 보기 클릭 시 */ 
	$("#repliesDiv").on("click", function() {

		var pdt_nb = $("#pdt_nb").val();
		
		// 이미 열려있으면, 닫아
		if ($(".timeline li").length > 2) {
			$(".replyLi").remove();
			$(".noReview").hide();
			// 페이지 숨기기
			$(".pagination li").remove();
			return;
		}
		// 열려있지 않으면, 목록 보여줌
		getPage("/review/" + pdt_nb + "/1");

	});
	

    //상품후기 쓰기 버튼 클릭시
    $("#btn_write_review").on("click", function(){
        var rv_score=0;
        var rv_content = $("#reviewContent").val();
        var pdt_nb = $("#pdt_nb").val();

        // 선택된 별점 개수를 가져옴
        $("#star_grade a").each(function(i,e){
            if($(this).attr('class')=='on') {
                rv_score += 1;
            }
        });

        //유효성 검사
        if(rv_score==0){
            alert("별점을 선택해주세요.");
            return;
        } else if(rv_content=="" || rv_content==null){
            alert("내용을 입력해주세요");
            return;
        }
        
        $.ajax({
            url: '/review/write',
            type: 'post',
            dataType: 'text',
            data: {
                rv_score : rv_score,
                rv_content : rv_content,
                pdt_nb : pdt_nb
            },
            success: function(data){
                alert("상품후기가 등록되었습니다.");
                $("#star_grade a").parent().children("a").removeClass("on");
                $("#reviewContent").val("");
                replayPage = 1;
                getPage("/review/" + pdt_nb + "/1");
            }

        });

    });
    
    //Modal 창
    $(".timeline").on("click", ".replyLi", function(event){
    
    	var reply = $(this);
    	var rv_nb = $(this).attr("data-rv_nb");
    	var score = $(this).find(".rv_score").text();
    	
    	
    	//팝업창 평정후기 가져오기
    	$("#star_grade_modal a").each(function(index, item){
    		if(index<score){
    			$(item).addClass('on');
    		} else {
    			$(item).removeClass('on');
    		}
    	});
    
    	//후기 내용 가져오기
    	$("#replytext").val(reply.find('#rv_content').text());
    	
    	//후기 번호 가져오기
    	$(".modal-body").attr("data-rv_nb", rv_nb);
    	
    });
    
    //별점 클릭시, 색상 변경
    $('#star_grade_modal a').click(function(){
    	$(this).parent().children("a").removeClass("on");
    	$(this).addClass("on").prevAll("a").addClass("on");
    		return false;
    });
    
    //수정버튼 클릭시(modal)
    $("#btn_modal_modity").on("click", function(){
    	
    	var rv_nb = $(".modal-body").attr("data-rv_nb");
    	var rv_content = $("#replytext").val();
    	var pdt_nb = $("#pdt_nb").val();
    	
    	//선택된 별의 개수를 가져옴
    	var rv_score = 0;
    	$("#star_grade_modal a").each(function(i, e){
    		if($(this).attr('class')=='on'){
    			rv_score += 1;
    		}
    	});
    
    	$.ajax({
    		url: '/review/modify',
    		type: 'post',
    		data: {
				rv_nb : rv_nb,
    			rv_content : rv_content,
    			rv_score : rv_score
    		},
    		dataType: 'text',
    		success: function(data){
    			alert("수정 되었습니다");
    			getPage("/review/" + pdt_nb + "/" + replyPage);
    		}
   		 });
    
    });
    
    
    
});

//후기 리스트 템플릭 적용 함수
function getPage(pageInfo) {
        $.getJSON(pageInfo, function(data){

            if(data.list.length>0){
                printData(data.list, $("#repliesDiv"), $("#template"));
                printPaging(data.pageMaker, $(".pagination"));

                $("#modifyModal").modal('hide');
                $("#replycntSmall").html("[" + data.pageMaker.totalCount + "]");

            } else {
                printNoData();
                $("#replycntSmall").html("[ 0 ]");
            }

        });
};

//상품후기 리스트가 존재하지 않을 때 보여줌
var printNoData = function(){
        $(".replyLi").remove();
        $(".noReview").show();
    };


//상품후기 리스트를 보여주는 템플릿
var printData = function(replyArr, target, templateObject){
    var template = Handlebars.compile(templateObject.html());
    
    var html = template(replyArr);
    $(".replyLi").remove();
    $(".noReview").hide();
    target.after(html);
}
    
        
// 상품후기 리스트의 하단 페이지 부분 작업
var printPaging = function(pageMaker, target) {
    var str = "";

	// 이전
	if (pageMaker.prev) {
		str += "<li><a href='" + (pageMaker.startPage - 1)
				+ "'> << </a></li>";
	}
	// 페이지 인덱스
	for (var i = pageMaker.startPage, len = pageMaker.endPage; i <= len; i++) {
		var strClass = pageMaker.cri.page == i ? 'class=active' : '';
		str += "<li "+strClass+"><a href='"+i+"'>" + i + "</a></li>";
	}
	// 다음
	if (pageMaker.next) {
		str += "<li><a href='" + (pageMaker.endPage + 1)
				+ "'> >> </a></li>";
	}

	target.html(str);
};

//상품후기 삭제 버튼 클릭시
var deleteReview = function(rv_nb){

	var result = confirm("이 상품 후기를 삭제하겠습니까?");
	if(result){
		$.ajax({
			url: "/review/"+rv_nb,
			type: "delete",
			dataType: "text",
			data: {rv_nb : rv_nb},
			success: function(data){
				alert("삭제되었습니다.");
				var pdt_nb = $("#pdt_nb").val();
				getPage("/review/" +pdt_nb+ "/" + replyPage);
			}
		});
	} else {}
}
