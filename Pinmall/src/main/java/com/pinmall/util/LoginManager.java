package com.pinmall.util;

import java.util.Hashtable;

import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionBindingEvent;
import javax.servlet.http.HttpSessionBindingListener;

public class LoginManager implements HttpSessionBindingListener {

	// 해당클래스를 싱글톤 패턴으로 구성
	private static LoginManager loginMng = null;
	
	//생성자메서드를 만들어 준다.(클래스를 가져가 사용할때 실수하지 않기 위해(접근이 불가능하게하기 위해)만들어준다)
	private LoginManager() {} 
	
	//getInstanec이 메서드를 관습적으로 많이 사용, 요청에 의한 모든 스레드들이 순차적으로 호출되도록 하기위한 동기화작업: synchronized사용
	public static synchronized LoginManager getInstanec() {
		if(loginMng == null) {
				loginMng = new LoginManager();
		}
		return loginMng;
	}
	
	//로그인시 사용자아이디 저장
	private static Hashtable<HttpSession, String> loginUser = new Hashtable<HttpSession, String>();
	
	
	@Override
	public void valueBound(HttpSessionBindingEvent event) {
		// TODO Auto-generated method stub

	}

	@Override
	public void valueUnbound(HttpSessionBindingEvent event) {
		// TODO Auto-generated method stub

	}

}
