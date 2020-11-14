<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!--DOCTYPE html-->
<html>
<head>

  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script type="text/javascript" src="/resources/js/product/read.js"></script>
  <%-- Handlebar Template --%>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
  <title>PinMall Homepage</title>

  <!-- Bootstrap core CSS -->
  <link href="/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet" >

  <!-- Custom styles for this template -->
  <link href="/css/shop-homepage.css" rel="stylesheet">
  
<!-- 템플릿 상품목록 -->
<script id="template" type="text/x-handlebars-template" >
	{{#each .}}
			<hr>
			<br><br><li class="replyLi" data-rv_nb={{rv_nb}}>
				<div class="timeline-item">
					<span class="time">
						{{prettifyDate rv_date}}
					</span>
					<h3 class="timeline-header">
						<strong>{{checkRating rv_score}} <p class='rv_score' style="display:inline-block;">{{rv_score}}</p></strong> 
					<h3>
				<div class="timeline-body">
					NUM: {{rv_nb}} <p style="float: right;">작성자: {{memt_id}}</p><br>
					<p id="rv_content">{{rv_content}}</p></div><br>
				<div class="timeline-footer" style="float: right;">
					{{eqReplyer memt_id rv_nb}}
				</div>	
			</div>
			</li>
	{{/each}}
</script>

<!-- 핸들바 사용자 정의 헬퍼 -->
<script>
	$(document).ready(function(){
		
		
		
		//매개변수로 받은 timeValue를 원하는 날짜 형태로 변환
		Handlebars.registerHelper("prettifyDate", function(timeValue){
			var dateObj = new Date(timeValue);
			var year = dateObj.getFullYear();
			var month = dateObj.getMonth() + 1;
			var date = dateObj.getDate();
			return year + "/" + month + "/" + date;
		});
		
		//매개변수로 받은 후기 평점을 별표로 출력
		Handlebars.registerHelper("checkRating", function(rating){
			var stars = "";
			switch(rating){
				case 1:
					 stars="★☆☆☆☆";
					 break;
				case 2:
					 stars="★★☆☆☆";
					 break;
				case 3:
					 stars="★★★☆☆";
					 break;
				case 4:
					 stars="★★★★☆";
					 break;
				case 5:
					 stars="★★★★★";
					 break;
				default:
					stars="☆☆☆☆☆";			
			}
			return stars;			
		});
		
		//로그인 아이디와 리뷰아이디 확인후 수정/삭제 버튼 활성화
		Handlebars.registerHelper("eqReplyer", function(replyer, rv_nb){
			var btnHtml = "";
			var memt_id = "${sessionScope.user.memt_id}";
			if (replyer == "${user.memt_id}") {
				btnHtml = "<a class='btn btn-primary btn-xs' data-toggle='modal' data-target='#modifyModal'>"
					+	"수정</a>"
					+ "<butten class='btn btn-danger btn-xs' style='margin-left:5px;'"
					+ "onclick='deleteReview("+rv_nb+");'"
					+ "type='button' > 삭제</button>";
				
			}
			return new Handlebars.SafeString(btnHtml);
			
			
		});
		
		
		
	});
</script>
		
<!-- ul 스타일 적용 -->
<style>
	ul{
	   list-style:none;
	   padding-left:0px;
	   text-align: left;
	   }
	.mainCategory{
		list-style:none;
	   padding-left:0px;
	   text-align: left;
	
		}
	
	li{
	
		padding-left:50px;
	}

	label{
		padding-left:10px;
		height: 10px;
	}
	
	p{
		padding-left:10px;
	}

     #star_grade a{
     	font-size:22px;
        text-decoration: none;
        color: lightgray;
    }
    #star_grade a.on{
        color: black;
    }
    
    #star_grade_modal a{
     	font-size:22px;
        text-decoration: none;
        color: lightgray;
    }
    #star_grade_modal a.on{
        color: black;
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


  
      <!-- /.col-lg-3 -->

      <div class="col-lg-9">
		<!-- content -->
		<h3 class="my-4">상품 상세정보</h3>
          <div class="card-body">
            <h3 class="card-title">${productone.pdt_name}</h3>
            
            <span class="card-text">${productone.pdt_detail}</span><br>
            <span>가격: <fmt:formatNumber value="${productone.pdt_price}" pattern="###,###,###" />원</span><br>
            
           <form method="get" action="/order/buy" style="right: 100%">
				<label for="exampleInputEmail1">구매수량</label><br>
				<input type="number" id="ord_amount" name="ord_amount" value="1" />
				<input type="hidden" id="pdt_nb" name="pdt_nb" value="${productone.pdt_nb}" />
				<button type="submit" id="btn_buy" class="btn btn-primary">구매</button>
				<button type="button" id="btn_cart" class="btn btn-default">장바구니</button>
		   </form>	
		   
		  <div class="card card-outline-secondary my-4">
	   		  <div class="card-header">
	          </div>
	            <div id="popup_front">
	            </div>
	            <form role="form" action="modifyPage" method="get">
	            	<input type="hidden" name="bno" value="${boardVO.bno}">
	            	<input type="hidden" name="page" value="${cri.page}">
	            	<input type="hidden" name="bperPageNum" value="${cri.perPageNum}">
	            </form>

	            <div>
	            	<div>
	            		<label for="review">Review</label>
	            		<div class="rating">
	            			<p id="star_grade">
	            				<a href="#">★</a>
	            				<a href="#">★</a>
	            				<a href="#">★</a>
	            				<a href="#">★</a>
	            				<a href="#">★</a>
	            			</p>
	            		</div>
	            		<textarea id="reviewContent" rows="3" style="width:100%;"></textarea><br />
	            		<p></p>
	            		<!-- 상품후기 리스트 -->
	            		<ul class="timeline">
	            			<c:if test="${sessionScope.user != null}">
	            			<li id="repliesDiv" style="float: right;">
	            			<span class="btn btn-default">
						    	상품후기 보기 <small id='replycntSmall'> [ ${totalReview} ] </small>
						    </span>
	            			<button class="btn btn-primary" id="btn_write_review" type="button" > 상품후기쓰기 </button>
							<br><br>
							
							</li>
							</c:if>
	            		<!-- 상품후기 리스트가 추가된위치 -->
		            		<li class="noReview" style="display:none;">
		            			<hr>
								<div class="timeline-item" >
									<h3 class="my-4">
										상품후기가 존재하지 않습니다.<br>
										상품후기를 입력해주세요.
									</h3>									
								</div>		            		
		            		</li>	
	            		</ul>
	            	
	            		<!--  상품후기 리스트 페이지부분-->
	            		<div>
	            			<ul id="pagination" class="pagination pagination-sm no-margin"></ul>
	            		</div>
	            		
	            		<!-- 상품후기 수정/삭제 팝업 -->
	            		<div id="modifyModal" class="modal modal-primary fade" role="dialog">
	            			<div class="modal-dialog">
	            				<!-- Moadl content -->
	            				<div class="modal-content">
	            					<div class="modal-header">
	            						<div>
	            						<button style="float: right;" type="button" class="close" data-dismiss="modal">&times;</button>
	            						</div>
	            						<div class="modal-title" style="float: left;">
	            							<p id="star_grade_modal">
	            								<a href="#">★</a>
										        <a href="#">★</a>
										        <a href="#">★</a>
										        <a href="#">★</a>
										        <a href="#">★</a>
	            							</p>
	            						</div>
	            					</div>
	            					<div class="modal-body" data-rv_nb>
	            						<p><input type="text" id="replytext" class="form-control"></p>
	            					</div>
	            					<div class="modal-footer">
	            						<button type="button" class="btn btn-info" id="btn_modal_modity">수정</button>
	            						<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
	            					</div>
	            				</div>
	            			</div>
	            		</div>
	            	
	            	</div>
	            </div>
          </div>
		   
          </div>
        </div>
        
        <!-- /.row -->
	
      </div>
      <!-- /.col-lg-9 -->

    </div>
    <!-- /.row -->

  <!-- /.container -->

  <!-- Footer(하단) -->
 <%@ include file="/WEB-INF/views/include/footer.jsp" %>

  <!-- Bootstrap core JavaScript -->
  <script src="/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

</body>

</html>