<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    
<!DOCTYPE html>
<aside class="main-sidebar">
<c:choose>
	<c:when test="${sessionScope.admin != null}">
		<div id="sidebar-left" class="col-xs-2 col-sm-2">
			<ul class="nav main-menu">
				<li>
					<a href="/admin/adminmain" >
						<i class="fa fa-dashboard"></i>
						<span class="hidden-xs">main</span>
					</a>
				</li>
				<li class="dropdown">
					<a href="#" class="dropdown-toggle">
						<i class="fa fa-bar-chart-o"></i>
						<span class="hidden-xs">상품 관리</span>
					</a>
					<ul class="dropdown-menu">
						<li><a href="/admin/product/insert">상품 등록</a></li>
						<li><a href="/admin/product/list">상품 목록</a></li>
					</ul>
				</li>
				<li class="dropdown">
					<a href="#" class="dropdown-toggle">
						<i class="fa fa-table"></i>
						 <span class="hidden-xs">주문 관리</span>
					</a>
					<ul class="dropdown-menu">
						<li><a href="/admin/user/OrderList">주문 목록</a></li>
					</ul>
				</li>
				<li class="dropdown">
					<a href="#" class="dropdown-toggle">
						<i class="fa fa-pencil-square-o"></i>
						 <span class="hidden-xs">회원관리</span>
					</a>
					<ul class="dropdown-menu">
						<li><a href="/admin/user/member">회원 목록</a></li>
						<li><a href="/admin/user/Review">회원 리뷰 관리</a></li>
					</ul>
				</li>
			</ul>
		</div>
	</c:when>
</c:choose>

<c:choose>
	<c:when test="${sessionScope.admin == null}">
		<div id="sidebar-left" class="col-xs-2 col-sm-2">>
			<ul class="nav main-menu">
				<li>
					<a href="/admin/login" class="ajax-link">
						<i class="fa fa-dashboard"></i>
						<span class="hidden-xs">로그인을 해주세요.</span>
					</a>
				</li>
			</ul>
		</div>
	</c:when>
</c:choose>
</aside>
