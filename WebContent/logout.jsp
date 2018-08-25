<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	session.invalidate();
	Thread.sleep(2000);
	response.sendRedirect(application.getContextPath()+"/login.jsp");
%>