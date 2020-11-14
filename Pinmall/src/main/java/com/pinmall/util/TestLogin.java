package com.pinmall.util;

import javax.servlet.http.HttpSessionBindingEvent;
import javax.servlet.http.HttpSessionBindingListener;

public class TestLogin implements HttpSessionBindingListener {

	// 세션작업을 했을 때 호출되어지는 이벤트메서드
	// 예) session.setAttribute();
	@Override
	public void valueBound(HttpSessionBindingEvent event) {
		// TODO Auto-generated method stub

	}

	// 세션소멸(제거)작업을 했을 때 호출되어지는 이벤트메서드
	// session.invalidate(), session.removeAttribute()
	@Override
	public void valueUnbound(HttpSessionBindingEvent event) {
		// TODO Auto-generated method stub

	}

}
