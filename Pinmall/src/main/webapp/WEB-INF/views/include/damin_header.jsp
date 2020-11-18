<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>   
    
<!DOCTYPE html>
	<div class="container-fluid expanded-panel">
		<div class="row">
			<div id="logo" class="col-xs-12 col-sm-2">
				<a href="/admin/adminmain">PinMall</a>
			</div>
			<div id="top-panel" class="col-xs-12 col-sm-10">
				<div class="row">
					<div class="col-xs-8 col-sm-4">
						<div id="search">
							<i class="fa fa-search"></i>
						</div>
					</div>
					<div class="col-xs-4 col-sm-8 top-panel-right">
					
						<ul class="nav navbar-nav pull-right panel-menu">
							 <!-- 로그인x -->
					        <c:if test="${sessionScope.admin == null}">
						          <li class="nav-item active">
							            <a class="nav-link" href="/damin/adminmain">Home
							              <span class="sr-only">(current)</span>
							            </a>
						          </li>
						          <li class="nav-item">
							            <a class="nav-link" href="/admin/login">로그인</a>
						          </li>
						       </c:if>
					          
					          <!-- 로그인o -->
					          <c:if test="${sessionScope.admin != null}">
						          <li class="nav-item">
						            	<p style="color: white;">
											최근 접속 시간: 
											<fmt:formatDate value="${sessionScope.admin.admin_date_late}" pattern="yyyy-MM-dd HH:mm:ss"/><!-- MemberDTO의 mem_date_last get을 사용중 -->
									&nbsp;&nbsp;
										</p>
						          </li>
					        		<li class="nav-item"> 
										<p style="color: white;">
										${sessionScope.admin.admin_name}님
										</p>
							      </li>
						          <li class="nav-item">
							            <a style="color: white;" href="/admin/logOut">로그아웃</a>
						          </li>
					          </c:if>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>