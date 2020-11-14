package com.pinmall.util;

import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

public class SessionManager implements HttpSessionListener {

	// 2가지 추상메서드는 이벤트에 의하여 자동호출(실행)이 된다.
	// 클라이언트가 접속되었을때 실행됨 session객체를 생성했을때가 아님
	
	//1) 세션이 생성이 되었을 때
	@Override
	public void sessionCreated(HttpSessionEvent se) {
		// TODO Auto-generated method stub

	}

	//2)세션이 소멸 되었을 때
	@Override
	public void sessionDestroyed(HttpSessionEvent se) {
		// TODO Auto-generated method stub

	}

}
