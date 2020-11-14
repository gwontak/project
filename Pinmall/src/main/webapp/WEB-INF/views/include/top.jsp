<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>


<!--DOCTYPE html-->
	  <nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
	    <div class="container">
	      <a class="navbar-brand" href="/">Pin Mall</a>
	      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
	        <span class="navbar-toggler-icon"></span>
	      </button>
	      
	      <div class="collapse navbar-collapse" id="navbarResponsive">
	        <ul class="navbar-nav ml-auto">
	        <!-- 로그인x -->
	        <c:if test="${sessionScope.user == null}">
		          <li class="nav-item active">
			            <a class="nav-link" href="/">Home
			              <span class="sr-only">(current)</span>
			            </a>
		          </li>
		          <li class="nav-item">
			            <a class="nav-link" href="/member/login">로그인</a>
		          </li>
		          <li class="nav-item">
			            <a class="nav-link" href="/member/join">회원가입</a>
		          </li>
		          <li class="nav-item">
		            	<a class="nav-link" href="#">고객센터</a>
		          </li>
		       </c:if>
	          
	          <!-- 로그인o -->
	          <c:if test="${sessionScope.user != null}">
		          <li class="nav-item">
		            	<p class="nav-link" >
							최근 접속 시간: 
							<fmt:formatDate value="${sessionScope.user.memt_lasttime}" pattern="yyyy-MM-dd HH:mm:ss"/><!-- MemberDTO의 mem_date_last get을 사용중 -->
						</p>
		          </li>
	        		<li class="nav-item"> 
						<p class="nav-link">
						${sessionScope.user.memt_sname}님
						</p>
			      </li>
		          <li class="nav-item">
			            <a class="nav-link" href="/member/logOut">로그아웃</a>
		          </li>
		          <li class="nav-item">
			            <a class="nav-link" href="/member/modify">회원정보수정</a>
		          </li>
			          <li class="nav-item">
			            <a class="nav-link" href="/cart/list">장바구니</a>
		          </li>
			          <li class="nav-item">
			            <a class="nav-link" href="/order/list">주문조회</a>
		          </li>
	          </c:if>
	        </ul>
	      </div>
	    </div>
	  </nav>
