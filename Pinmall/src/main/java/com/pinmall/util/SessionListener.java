package com.pinmall.util;

import java.util.Collection;
import java.util.Enumeration;
import java.util.Hashtable;

import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionBindingEvent;
import javax.servlet.http.HttpSessionBindingListener;

/* 중복 로그인을 방지하기 위한 세션리스너
HttpSessionBindingListener는 세션바인딩리스너 인터페이스를 구현한 세션에 바인딩 시키거나 언바인딩 되는 이벤트에 맞게 리스너를 호출
즉, 세션정보 추가시 valueBound() 호출, 세션제거(소멸)시 valueUnbound() 호출
*/


public class SessionListener implements HttpSessionBindingListener{
    
	// 싱글톤 패턴 : 클래스를 객체생성시 단 한번만 생성하기위한 패턴
	private static SessionListener sessionListener = null;
    
    // 로그인한 접속자를 저장
    private static Hashtable<HttpSession, String> loginUsers = new Hashtable<HttpSession, String>();
    
    // 싱글톤 패턴
    public static synchronized SessionListener getInstance() {
        // 첫 접속자에 의하여 객체생성. 2번째 부터는 생성된 객체를 참조
    	if(sessionListener == null) {
            sessionListener = new SessionListener();
        }
        return sessionListener;
    }

    // 세션정보 추가시<<특정작업 호출되는 이벤트(자동으로 호출)
    @Override
    public void valueBound(HttpSessionBindingEvent event) {//HttpSession객체와 같다
        loginUsers.put(event.getSession(), event.getName());//<<세션객체와 아이디를 저장(사용자 로그인아이디)
        System.out.println(event.getName() + " 로그인 완료");
        System.out.println("현재 접속자 수 : " +  getUserCount());
    }

    // 세션소멸(제거) 시<<특정작업 호출되는 이벤트
    @Override
    public void valueUnbound(HttpSessionBindingEvent event) {
        loginUsers.remove(event.getSession());
        System.out.println(event.getName() + " 로그아웃 완료");
        System.out.println("현재 접속자 수 : " +  getUserCount());
    }
    
    // 접속한 아이디를 해시테이블 컬렉션에서 삭제
    public void removeSession(String userId) {
        Enumeration<HttpSession> e = loginUsers.keys(); 
        HttpSession session = null;
        while(e.hasMoreElements()){
            session = e.nextElement();
            if(loginUsers.get(session).equals(userId)){
                //세션이 invalidate될때 HttpSessionBindingListener를 
                //구현하는 클레스의 valueUnbound()함수가 호출된다.
                session.invalidate();
            }
       }
    }

    /*
        아이디 중복로그인 방지목적으로 체크
        파라미터로 아디를 집어 넣는다 containsValue의 데이터 값을 가져오고loginUsers 값이 true면 중복 아니면 false
    */
   public boolean isUsing(String userId){
       return loginUsers.containsValue(userId);
   }
    
   
   /*
        로그인을 확인 후 아이디를 세션형태로 저장
       로그인시 첫번째로 호출
       로그인할때 아래 메소드 호출 
    */
   public void setSession(HttpSession session, String userId){
       //이순간에 Session Binding이벤트가 일어나는 시점
       //name값으로 userId, value값으로 자기자신(HttpSessionBindingListener를 구현하는 Object)
       session.setAttribute(userId, this);//login에 자기자신을 집어넣는다.
   }
    
    
   //아이디 읽어온다.
   public String getUserID(HttpSession session){
       return (String)loginUsers.get(session);
   }
    
    
   // 현재 접속자수 확인
   public int getUserCount(){
       return loginUsers.size();
   }
    
    
   // 현재 접속중(로그인)인 모든 사용자 아이디를 출력
   public void printloginUsers(){
	   //Enumeration구조에 세션객체를 저장(순차적 저장)
       Enumeration<HttpSession> e = loginUsers.keys();//loginUsers.keys를해서 세션객체 확보
       HttpSession session = null;
       System.out.println("===========================================");
       int i = 0;
       while(e.hasMoreElements()){
           session = e.nextElement(); //세션 변수에 넣고 커서를 다음, 아래로 내린다.(순차적으로 세션이 저장되어 있기때문에)이 작업이 데이터가 없을때까지 진행 
           System.out.println((++i) + ". 접속자 : " +  loginUsers.get(session));
       }
       System.out.println("===========================================");
    }
    
   // 현재 접속중인 모든 사용자리스트를 리턴
   public Collection<String> getUsers(){
       Collection<String> collection = loginUsers.values();
       return collection;
   }
}
