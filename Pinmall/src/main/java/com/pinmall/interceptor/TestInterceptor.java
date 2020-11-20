package com.pinmall.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

// /member/** 주소로 요청하는 부분을 인터셉터 설정을 하여 제어를 하겠다.(인터셉터설정은 servlet.xml에서한다)
public class TestInterceptor extends HandlerInterceptorAdapter {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		// 아래값이 ture가 된다면 원래있던 컨트롤러로 리턴된다. false는 컨트롤러로 리턴x 그래서 redirect를 사용
		// 인터셉터 설정이 관리자메뉴 주소요처이 발생
		// 관리자 로그인 세션여부 체크
		// 1)정상로그인 상태 : return true;
		// 2)로그인 상태가 아님 : 관리자로그인 주소이동작업 return false;
		
		HttpSession session = request.getSession();
		System.out.println(session.toString());
		Object obj = session.getAttribute("user");
		if( obj == null) {
				response.sendRedirect("/member/login");
				return false;
		}
		return true;
	}

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		// 위작업이 끝나면 이곳으로 넘어와 작업후 view로 보내준다.
		super.postHandle(request, response, handler, modelAndView);
	}

}
