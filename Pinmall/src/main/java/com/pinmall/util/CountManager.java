package com.pinmall.util;

import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

/*
HttpSessionListener는 세션의 생성과 세션이 해제 되는 이벤트에 맞게 리스너를 호출

*/
public class CountManager implements HttpSessionListener {

	private static int count; // 현재 접속자수
	
	private static int totalCount; // 전체 방문수 -> 저장(txt파일, DB )
	 
    public static int getCount() {
        return count;
    }
    
    public static int getTotalCount() {
    	return totalCount;
    }

	@Override
	public void sessionCreated(HttpSessionEvent event) {
		//세션이 만들어질 때 호출(메인페이지를 접속하면 먼저 호출)
        HttpSession session = event.getSession(); //request에서 얻는 session과 동일한 객체
        session.setMaxInactiveInterval(60*20);
         
        count++;
        totalCount++;
         
        session.getServletContext().log(session.getId() + " 세션생성 " + ", 접속자수 : " + count);

	}

	@Override
	public void sessionDestroyed(HttpSessionEvent event) {
		 //세션이 소멸될 때 호출
        count--;
        if(count<0)
            count=0;
         
        HttpSession session = event.getSession();
        session.getServletContext().log(session.getId() + " 세션소멸 " + ", 접속자수 : " + count);
	}

}
