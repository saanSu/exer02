<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%
	// 쿠키로 인증유지 시켜둔 기능을 구현했을때 유지해제를 사용자에게 제공하고 싶으면
	// 사용자가 가진 쿠키를 삭제시켜줘야되는데, 이걸 명령을 통해서 브라우저 쿠키함을 
	// 비우게 하는건 없고,
	
	Cookie c = new Cookie("freepass", "bomb");
	c.setPath(application.getContextPath());
	c.setMaxAge(0);	// maxAge 0초로 설정해서 같은 이름으로 설정해서 보내서
	response.addCookie(c);	// 기존의 쿠키를 무효화시켜야 한다.
	

	session.invalidate();
	// 인증정보를 없애줘야되는데, invalidate 시켜서 없애든, removeAttribute
	Thread.sleep(2000);
	response.sendRedirect(application.getContextPath()+"/login.jsp");
%>